-- v1.7 | G Script's Macro
--================ SERVICES ================
local HttpService     = game:GetService("HttpService")
local Players         = game:GetService("Players")
local TextChatService = game:GetService("TextChatService")
local TweenService    = game:GetService("TweenService")
local Lighting        = game:GetService("Lighting")
local RunService      = game:GetService("RunService")

local player = Players.LocalPlayer
local userId = player.UserId

--================ ป้องกันรันซ้ำ ================
if _G.MacroRunning then
    local g = Instance.new("ScreenGui")
    g.ResetOnSpawn = false
    g.Parent = game:GetService("CoreGui")
    local f = Instance.new("Frame", g)
    f.Size = UDim2.new(0,340,0,110)
    f.Position = UDim2.new(0.5,-170,0.5,-55)
    f.BackgroundColor3 = Color3.fromRGB(20,20,25)
    f.BorderSizePixel = 0
    Instance.new("UICorner", f).CornerRadius = UDim.new(0,14)
    local st = Instance.new("UIStroke", f)
    st.Color = Color3.fromRGB(255,80,80) st.Thickness = 2
    local icon = Instance.new("TextLabel", f)
    icon.Size = UDim2.new(0,40,0,40) icon.Position = UDim2.new(0,14,0,14)
    icon.BackgroundTransparency = 1 icon.Text = "!!"
    icon.TextColor3 = Color3.fromRGB(255,80,80)
    icon.TextSize = 28 icon.Font = Enum.Font.GothamBold
    local t1 = Instance.new("TextLabel", f)
    t1.Size = UDim2.new(1,-70,0,28) t1.Position = UDim2.new(0,58,0,14)
    t1.BackgroundTransparency = 1
    t1.Text = "Macro is already running!"
    t1.TextColor3 = Color3.fromRGB(255,80,80)
    t1.Font = Enum.Font.GothamBold t1.TextSize = 14
    t1.TextXAlignment = Enum.TextXAlignment.Left
    local t2 = Instance.new("TextLabel", f)
    t2.Size = UDim2.new(1,-70,0,40) t2.Position = UDim2.new(0,58,0,44)
    t2.BackgroundTransparency = 1
    t2.Text = "มาโครทำงานอยู่แล้ว!\nMacro đang chạy rồi!"
    t2.TextColor3 = Color3.fromRGB(160,160,180)
    t2.Font = Enum.Font.Gotham t2.TextSize = 11
    t2.TextXAlignment = Enum.TextXAlignment.Left t2.TextWrapped = true
    local bar = Instance.new("Frame", f)
    bar.Size = UDim2.new(1,0,0,4) bar.Position = UDim2.new(0,0,1,-4)
    bar.BackgroundColor3 = Color3.fromRGB(255,80,80) bar.BorderSizePixel = 0
    Instance.new("UICorner", bar).CornerRadius = UDim.new(0,4)
    TweenService:Create(bar, TweenInfo.new(3), {Size=UDim2.new(0,0,0,4)}):Play()
    task.delay(3, function() game:GetService("Debris"):AddItem(g, 0) end)
    return
end
_G.MacroRunning = true

--================ LANGUAGE ================
local lang = "ENG"
local TEXT = {
    ENG = {
        -- general
        back = "< Back", next = "Next >", ok = "OK  Start",
        -- lang page
        langTitle = "Select Language",
        -- how to page
        howBigTitle = "User Manual - G Script's Macro",
        howSec1 = "How to get Webhook URL",
        howSec1Body =
            "On Phone:\n"..
            "1. Open Chrome and go to discord.com\n"..
            "2. Login to your account\n"..
            "3. Switch to Desktop mode in Chrome menu\n"..
            "4. Go to your Server\n"..
            "5. Click channel > Edit Channel\n"..
            "6. Integrations > Webhooks > New Webhook\n"..
            "7. Give it a name, set channel, then Copy URL\n\n"..
            "On PC:\n"..
            "Same as above but you're already in Desktop mode.\n\n"..
            "NPC Webhook = channel for NPC alerts\n"..
            "Biome Webhook = channel for Biome alerts",
        howSec2 = "How to get VIP Server Link",
        howSec2Body =
            "1. Open Roblox and go to Sol's RNG\n"..
            "2. Click Private Servers tab\n"..
            "3. Copy your private server link\n"..
            "4. Paste it in the VIP Server box\n\n"..
            "You can skip VIP by pressing the red button.\n"..
            "The macro will still work normally.\n\n"..
            "Still confused? Copy the video link below:",
        howSec3 = "How to Stop / Start Macro",
        howSec3Body =
            "Type in Roblox chat:\n"..
            "  /SP  or  /sp  -> STOP macro\n"..
            "  /ST  or  /st  -> START macro again\n\n"..
            "Edit button (top-right corner):\n"..
            "Press to reopen @everyone settings anytime.",
        howVideo = "Video guide:",
        howVideoCopy = "Copy Link",
        -- input page
        inputTitle = "Setup - Webhooks & VIP",
        npcWh = "NPC Webhook URL",
        biomeWh = "Biome Webhook URL",
        vipTitle = "VIP Server Link",
        vipSkip = "Skip VIP",
        vipWant = "I have VIP",
        vipPlaceholder = "Paste VIP link here...",
        npcPlaceholder = "Paste NPC Webhook URL...",
        biomePlaceholder = "Paste Biome Webhook URL...",
        testBtn = "Test",
        errNpc = "Invalid NPC Webhook!",
        errBiome = "Invalid Biome Webhook!",
        errVip = "Invalid VIP link!",
        -- select page
        selectTitle = "Select @everyone targets",
        -- running
        running = "Macro Running  /SP to stop",
        stopped = "Macro Stopped  /ST to start",
        hintStart = "Macro Started!",
        hintStop = "Macro Stopped! Type /ST to start again.",
    },
    TH = {
        back = "< ย้อนกลับ", next = "ถัดไป >", ok = "OK  เริ่ม",
        langTitle = "เลือกภาษา",
        howBigTitle = "คู่มือการใช้งาน - G Script's Macro",
        howSec1 = "วิธีหา Webhook URL",
        howSec1Body =
            "บนโทรศัพท์:\n"..
            "1. เปิด Chrome แล้วเข้า discord.com\n"..
            "2. Login เข้าบัญชีของคุณ\n"..
            "3. สลับไปโหมด Desktop ในเมนู Chrome\n"..
            "4. ไปที่ Server ของคุณ\n"..
            "5. กดที่ช่อง > แก้ไขช่อง\n"..
            "6. Integrations > Webhooks > New Webhook\n"..
            "7. ตั้งชื่อ เลือกช่อง แล้วกด Copy URL\n\n"..
            "บนคอม:\n"..
            "เหมือนกันเลย แต่ไม่ต้องสลับโหมด\n\n"..
            "NPC Webhook = ช่องสำหรับแจ้งเตือน NPC\n"..
            "Biome Webhook = ช่องสำหรับแจ้งเตือน Biome",
        howSec2 = "วิธีหา VIP Server Link",
        howSec2Body =
            "1. เปิด Roblox แล้วเข้า Sol's RNG\n"..
            "2. กดแท็บ Private Servers\n"..
            "3. Copy ลิงก์เซิร์ฟเวอร์ส่วนตัว\n"..
            "4. นำมาวางในช่อง VIP Server\n\n"..
            "ข้ามได้โดยกดปุ่มสีแดง\n"..
            "มาโครยังทำงานได้ปกติ\n\n"..
            "ยังสับสนอยู่? Copy ลิงก์วีดีโอด้านล่าง:",
        howSec3 = "วิธีหยุด/เริ่ม Macro",
        howSec3Body =
            "พิมพ์ในแชทเกม:\n"..
            "  /SP  หรือ  /sp  -> หยุดมาโคร\n"..
            "  /ST  หรือ  /st  -> เริ่มมาโครใหม่\n\n"..
            "ปุ่มแก้ไข (มุมขวาบน):\n"..
            "กดเพื่อเปิดตั้งค่า @everyone ใหม่ได้ตลอด",
        howVideo = "คลิปวีดีโอ:",
        howVideoCopy = "Copy ลิงก์",
        inputTitle = "ตั้งค่า - Webhooks & VIP",
        npcWh = "NPC Webhook URL",
        biomeWh = "Biome Webhook URL",
        vipTitle = "VIP Server Link",
        vipSkip = "ไม่ต้องการใส่ VIP",
        vipWant = "ฉันมี VIP",
        vipPlaceholder = "วาง VIP link ที่นี่...",
        npcPlaceholder = "วาง NPC Webhook URL...",
        biomePlaceholder = "วาง Biome Webhook URL...",
        testBtn = "ทดสอบ",
        errNpc = "NPC Webhook ไม่ถูกต้อง!",
        errBiome = "Biome Webhook ไม่ถูกต้อง!",
        errVip = "VIP link ไม่ถูกต้อง!",
        selectTitle = "เลือกอันที่จะ @everyone",
        running = "มาโครทำงานอยู่  /SP หยุด",
        stopped = "มาโครหยุดแล้ว  /ST เริ่ม",
        hintStart = "มาโครเริ่มทำงานแล้ว!",
        hintStop = "มาโครหยุดแล้ว! พิมพ์ /ST เพื่อเริ่มใหม่",
    },
    VN = {
        back = "< Quay lai", next = "Tiep >", ok = "OK  Bat dau",
        langTitle = "Chon ngon ngu",
        howBigTitle = "Huong dan su dung - G Script's Macro",
        howSec1 = "Cach lay Webhook URL",
        howSec1Body =
            "Tren dien thoai:\n"..
            "1. Mo Chrome va vao discord.com\n"..
            "2. Dang nhap tai khoan\n"..
            "3. Chuyen sang Desktop mode trong menu Chrome\n"..
            "4. Vao Server cua ban\n"..
            "5. Nhan vao kenh > Chinh sua kenh\n"..
            "6. Integrations > Webhooks > New Webhook\n"..
            "7. Dat ten, chon kenh, roi Copy URL\n\n"..
            "Tren may tinh:\n"..
            "Tuong tu nhung khong can doi che do.\n\n"..
            "NPC Webhook = kenh thong bao NPC\n"..
            "Biome Webhook = kenh thong bao Biome",
        howSec2 = "Cach lay link VIP Server",
        howSec2Body =
            "1. Mo Roblox va vao Sol's RNG\n"..
            "2. Nhan tab Private Servers\n"..
            "3. Copy link server rieng\n"..
            "4. Dan vao o VIP Server\n\n"..
            "Co the bo qua bang nut do.\n"..
            "Macro van hoat dong binh thuong.\n\n"..
            "Van chua hieu? Copy link video duoi day:",
        howSec3 = "Cach dung / bat dau Macro",
        howSec3Body =
            "Go trong chat game:\n"..
            "  /SP  hoac  /sp  -> DUNG macro\n"..
            "  /ST  hoac  /st  -> BAT DAU lai\n\n"..
            "Nut chinh sua (goc phai tren):\n"..
            "Nhan de mo lai cai dat @everyone bat cu luc nao.",
        howVideo = "Video huong dan:",
        howVideoCopy = "Copy Link",
        inputTitle = "Cai dat - Webhooks & VIP",
        npcWh = "NPC Webhook URL",
        biomeWh = "Biome Webhook URL",
        vipTitle = "Link VIP Server",
        vipSkip = "Bo qua VIP",
        vipWant = "Toi co VIP",
        vipPlaceholder = "Dan link VIP tai day...",
        npcPlaceholder = "Dan NPC Webhook URL...",
        biomePlaceholder = "Dan Biome Webhook URL...",
        testBtn = "Thu",
        errNpc = "NPC Webhook khong hop le!",
        errBiome = "Biome Webhook khong hop le!",
        errVip = "Link VIP khong hop le!",
        selectTitle = "Chon muc @everyone",
        running = "Macro dang chay  /SP de dung",
        stopped = "Macro da dung  /ST de bat dau",
        hintStart = "Macro da bat dau!",
        hintStop = "Macro da dung! Go /ST de bat dau lai.",
    }
}
local function T(k) return TEXT[lang][k] or k end

--================ NPC CONFIG ================
local NPCS = {
    { name="MARI",   keyword="mari",   image="https://static.wikia.nocookie.net/sol-rng/images/3/37/MARI_HIGH_QUALITYY.png/revision/latest?cb=20240704045119",  color=16777215 },
    { name="JESTER", keyword="jester", image="https://static.wikia.nocookie.net/sol-rng/images/d/db/Headshot_of_Jester.png/revision/latest?cb=20240630142936",  color=10181046 },
    { name="RIN",    keyword="rin",    image="https://static.wikia.nocookie.net/sol-rng/images/0/04/RinHeadShot.png/revision/latest?cb=20260214165200",          color=16744272 },
}

--================ BIOME CONFIG ================
local BIOMES = {
    { name="WINDY",      duration=120,  trigger="%[Windy%]",      endTrigger=nil, image="https://files.catbox.moe/i5zrd4.png",  color=11393254, rare=false },
    { name="SNOWY",      duration=120,  trigger="%[Snowy%]",      endTrigger=nil, image="https://files.catbox.moe/1ci11a.png",  color=16777215, rare=false },
    { name="RAINY",      duration=120,  trigger="%[Rainy%]",      endTrigger=nil, image="https://files.catbox.moe/tga93x.png",  color=4886754,  rare=false },
    { name="SANDSTORM",  duration=650,  trigger="%[Sand Storm%]", endTrigger=nil, image="https://files.catbox.moe/ifumtg.png",  color=16750848, rare=false },
    { name="HELL",       duration=666,  trigger="%[Hell%]",       endTrigger=nil, image="https://files.catbox.moe/ea80ib.png",  color=16711680, rare=false },
    { name="STARFALL",   duration=600,  trigger="%[Starfall%]",   endTrigger=nil, image="https://files.catbox.moe/hzccx8.png",  color=16763904, rare=false },
    { name="HEAVEN",     duration=240,  trigger="%[Heaven%]",     endTrigger=nil, image="https://files.catbox.moe/izgcbl.png",  color=16777164, rare=false },
    { name="CORRUPTION", duration=650,  trigger="%[Corruption%]", endTrigger=nil, image="https://files.catbox.moe/q29een.png",  color=8388736,  rare=false },
    { name="NULL",       duration=99,   trigger="%[Null%]",       endTrigger=nil, image="https://files.catbox.moe/070ta3.png",  color=1315860,  rare=false },
    { name="GLITCHED",   duration=164,  trigger="%[Manager%]: Unexpected error",            endTrigger="%[Manager%]: %[Code 404%] has resolved", image="https://files.catbox.moe/3kuvwy.png", color=65280,    rare=true },
    { name="DREAMSPACE", duration=192,  trigger="%[Dreamspace%]: You begin to feel sleepy", endTrigger="%[Dreamspace%]: Waking up",              image="https://files.catbox.moe/dci7dn.png", color=11141290, rare=true },
    { name="CYBERSPACE", duration=720,  trigger="%[Cyberspace%]: Signal_Received",          endTrigger="%[Cyberspace%]: Signal Lost",            image="https://files.catbox.moe/cen7e7.png", color=65535,    rare=true },
}

--================ STATE ================
local macroRunning  = false
local vipLink       = ""
local webhookUrl    = ""
local biomeWh       = ""
local skipVip       = false
local lastSentTime  = {}
local recentSent    = {}
local activeBiomes  = {}
local currentBiome  = nil
local COOLDOWN      = 600
local NPC_DURATION  = 180
local chatHooked    = false
local statusLabel   = nil
local editBtn       = nil

local npcPing  = {}
local biomePing = {}
for _,n in ipairs(NPCS)   do npcPing[n.name]   = true  end
for _,b in ipairs(BIOMES) do biomePing[b.name]  = b.rare end

--================ BLUR/FOV ================
local blur   = Instance.new("BlurEffect", Lighting)
blur.Size    = 0
local cam    = workspace.CurrentCamera
local origFOV = cam.FieldOfView

local function blurIn()
    TweenService:Create(cam,    TweenInfo.new(0.6,Enum.EasingStyle.Quad,Enum.EasingDirection.Out), {FieldOfView=origFOV-12}):Play()
    TweenService:Create(blur,   TweenInfo.new(0.6,Enum.EasingStyle.Quad,Enum.EasingDirection.Out), {Size=18}):Play()
end
local function blurOut()
    TweenService:Create(cam,    TweenInfo.new(0.5,Enum.EasingStyle.Quad,Enum.EasingDirection.In),  {FieldOfView=origFOV}):Play()
    TweenService:Create(blur,   TweenInfo.new(0.5,Enum.EasingStyle.Quad,Enum.EasingDirection.In),  {Size=0}):Play()
end

--================ ANIM HELPERS ================
local function btnAnim(b, nc)
    nc = nc or b.BackgroundColor3
    local dn = false
    b.MouseButton1Down:Connect(function() dn=true  TweenService:Create(b,TweenInfo.new(0.08),{BackgroundTransparency=0.35}):Play() end)
    b.MouseButton1Up:Connect(function()   dn=false TweenService:Create(b,TweenInfo.new(0.15,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{BackgroundTransparency=0,BackgroundColor3=nc}):Play() end)
    b.MouseLeave:Connect(function() if not dn then TweenService:Create(b,TweenInfo.new(0.15),{BackgroundColor3=nc,BackgroundTransparency=0}):Play() end end)
    b.MouseEnter:Connect(function() TweenService:Create(b,TweenInfo.new(0.15),{BackgroundColor3=Color3.new(math.min(nc.R+0.08,1),math.min(nc.G+0.08,1),math.min(nc.B+0.08,1))}):Play() end)
end

local function fadeIn(f)
    f.Visible = true
    f.BackgroundTransparency = 1
    for _,c in ipairs(f:GetDescendants()) do
        if c:IsA("TextLabel") or c:IsA("TextButton") then c.TextTransparency=1 end
        if c:IsA("UIStroke") then c.Transparency=1 end
        if c:IsA("ImageLabel") then c.ImageTransparency=1 end
    end
    TweenService:Create(f,TweenInfo.new(0.2,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{BackgroundTransparency=0}):Play()
    task.spawn(function()
        task.wait(0.04)
        for _,c in ipairs(f:GetDescendants()) do
            if c:IsA("TextLabel") or c:IsA("TextButton") then TweenService:Create(c,TweenInfo.new(0.16),{TextTransparency=0}):Play() end
            if c:IsA("UIStroke") then TweenService:Create(c,TweenInfo.new(0.16),{Transparency=0}):Play() end
            if c:IsA("ImageLabel") then TweenService:Create(c,TweenInfo.new(0.16),{ImageTransparency=0}):Play() end
        end
    end)
end

local function fadeOut(f, cb)
    for _,c in ipairs(f:GetDescendants()) do
        if c:IsA("TextLabel") or c:IsA("TextButton") then TweenService:Create(c,TweenInfo.new(0.1),{TextTransparency=1}):Play() end
        if c:IsA("UIStroke") then TweenService:Create(c,TweenInfo.new(0.1),{Transparency=1}):Play() end
        if c:IsA("ImageLabel") then TweenService:Create(c,TweenInfo.new(0.1),{ImageTransparency=1}):Play() end
    end
    TweenService:Create(f,TweenInfo.new(0.14,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{BackgroundTransparency=1}):Play()
    task.wait(0.16)
    f.Visible = false
    f.BackgroundTransparency = 0
    for _,c in ipairs(f:GetDescendants()) do
        if c:IsA("TextLabel") or c:IsA("TextButton") then c.TextTransparency=0 end
        if c:IsA("UIStroke") then c.Transparency=0 end
        if c:IsA("ImageLabel") then c.ImageTransparency=0 end
    end
    if cb then cb() end
end

--================ MKBOX (truncate display) ================
local function mkBox(p,x,y,w,h,ph)
    local b = Instance.new("TextBox",p)
    b.Size=UDim2.new(0,w,0,h) b.Position=UDim2.new(0,x,0,y)
    b.BackgroundColor3=Color3.fromRGB(32,32,40) b.Text=""
    b.PlaceholderText=ph or "" b.PlaceholderColor3=Color3.fromRGB(90,90,105)
    b.TextColor3=Color3.fromRGB(32,32,40) -- hide real text (same as bg)
    b.Font=Enum.Font.Gotham b.TextSize=9
    b.ClearTextOnFocus=false b.BorderSizePixel=0
    b.ClipsDescendants=true b.TextXAlignment=Enum.TextXAlignment.Left
    Instance.new("UICorner",b).CornerRadius=UDim.new(0,7)
    local s=Instance.new("UIStroke",b) s.Color=Color3.fromRGB(55,55,72) s.Thickness=1
    b.Focused:Connect(function()
        TweenService:Create(s,TweenInfo.new(0.18),{Color=Color3.fromRGB(88,140,255)}):Play()
        b.TextColor3=Color3.new(1,1,1) -- show real text while editing
    end)
    b.FocusLost:Connect(function()
        TweenService:Create(s,TweenInfo.new(0.18),{Color=Color3.fromRGB(55,55,72)}):Play()
        b.TextColor3=Color3.fromRGB(32,32,40) -- hide real text again
    end)
    -- display label shows truncated text when not focused
    local dl=Instance.new("TextLabel",b)
    dl.Size=UDim2.new(1,-8,1,0) dl.Position=UDim2.new(0,6,0,0)
    dl.BackgroundTransparency=1
    dl.Font=Enum.Font.Gotham dl.TextSize=9
    dl.TextXAlignment=Enum.TextXAlignment.Left dl.Text="" dl.ZIndex=3
    dl.TextColor3=Color3.fromRGB(90,90,105)
    b.Changed:Connect(function(prop)
        if prop=="Text" then
            local t=b.Text
            dl.Text=#t>34 and "..."..t:sub(-30) or t
            dl.TextColor3=t=="" and Color3.fromRGB(90,90,105) or Color3.new(1,1,1)
        end
    end)
    b.Focused:Connect(function() dl.Visible=false end)
    b.FocusLost:Connect(function()
        dl.Visible=true
        local t=b.Text
        dl.Text=#t>34 and "..."..t:sub(-30) or t
        dl.TextColor3=t=="" and Color3.fromRGB(90,90,105) or Color3.new(1,1,1)
    end)
    return b
end

local function mkBtn(p,txt,x,y,w,h,bg)
    local b=Instance.new("TextButton",p)
    b.Size=UDim2.new(0,w,0,h) b.Position=UDim2.new(0,x,0,y)
    b.Text=txt b.TextColor3=Color3.new(1,1,1)
    b.BackgroundColor3=bg or Color3.fromRGB(60,120,255)
    b.Font=Enum.Font.GothamBold b.TextSize=12 b.BorderSizePixel=0
    Instance.new("UICorner",b).CornerRadius=UDim.new(0,8)
    btnAnim(b, bg or Color3.fromRGB(60,120,255))
    return b
end

local function mkLbl(p,txt,x,y,w,h,sz,bold,col,cx)
    local l=Instance.new("TextLabel",p)
    l.Size=UDim2.new(0,w,0,h) l.Position=UDim2.new(0,x,0,y)
    l.BackgroundTransparency=1 l.Text=txt
    l.TextColor3=col or Color3.new(1,1,1)
    l.Font=bold and Enum.Font.GothamBold or Enum.Font.Gotham
    l.TextSize=sz or 12 l.TextWrapped=true
    l.TextXAlignment=cx and Enum.TextXAlignment.Center or Enum.TextXAlignment.Left
    l.TextYAlignment=Enum.TextYAlignment.Top
    return l
end

local function mkFrame(w,h)
    local vp=workspace.CurrentCamera.ViewportSize
    local f=Instance.new("Frame",gui)
    f.Size=UDim2.new(0,w,0,h)
    f.Position=UDim2.new(0.5,-w/2,0.5,-h/2)
    f.BackgroundColor3=Color3.fromRGB(20,20,26) f.BorderSizePixel=0
    f.Active=true f.Draggable=false f.Visible=false
    Instance.new("UICorner",f).CornerRadius=UDim.new(0,14)
    local s=Instance.new("UIStroke",f) s.Color=Color3.fromRGB(60,120,255) s.Thickness=1.5
    return f
end

local function mkHeader(parent,w,txt)
    local hdr=Instance.new("Frame",parent)
    hdr.Size=UDim2.new(1,0,0,44) hdr.Position=UDim2.new(0,0,0,0)
    hdr.BackgroundColor3=Color3.fromRGB(40,80,200) hdr.BorderSizePixel=0
    Instance.new("UICorner",hdr).CornerRadius=UDim.new(0,14)
    local fix=Instance.new("Frame",hdr)
    fix.Size=UDim2.new(1,0,0,14) fix.Position=UDim2.new(0,0,1,-14)
    fix.BackgroundColor3=Color3.fromRGB(40,80,200) fix.BorderSizePixel=0
    local tl=Instance.new("TextLabel",hdr)
    tl.Size=UDim2.new(1,-16,1,0) tl.Position=UDim2.new(0,12,0,0)
    tl.BackgroundTransparency=1 tl.Text=txt
    tl.TextColor3=Color3.new(1,1,1) tl.Font=Enum.Font.GothamBold
    tl.TextSize=13 tl.TextXAlignment=Enum.TextXAlignment.Left
    tl.TextYAlignment=Enum.TextYAlignment.Center tl.TextWrapped=true
    return hdr,tl
end

local function mkBottomBar(parent,w,frameH)
    local bar=Instance.new("Frame",parent)
    bar.Size=UDim2.new(1,-16,0,44) bar.Position=UDim2.new(0,8,1,-52)
    bar.BackgroundTransparency=1 bar.BorderSizePixel=0
    return bar
end

--================ GUI ROOT ================
local vp = workspace.CurrentCamera.ViewportSize
local gui = Instance.new("ScreenGui")
gui.Name="MacroV17" gui.ResetOnSpawn=false
gui.Parent=game:GetService("CoreGui")

-- status bar top right
statusLabel=Instance.new("TextLabel",gui)
statusLabel.Size=UDim2.new(0,260,0,22) statusLabel.Position=UDim2.new(1,-268,0,8)
statusLabel.BackgroundTransparency=1 statusLabel.Text=""
statusLabel.TextColor3=Color3.fromRGB(0,220,100) statusLabel.Font=Enum.Font.GothamBold
statusLabel.TextSize=11 statusLabel.TextXAlignment=Enum.TextXAlignment.Right
statusLabel.TextStrokeTransparency=0.4 statusLabel.TextStrokeColor3=Color3.new(0,0,0)
statusLabel.Visible=false

-- edit button top right
editBtn=Instance.new("TextButton",gui)
editBtn.Size=UDim2.new(0,72,0,26) editBtn.Position=UDim2.new(1,-80,0,34)
editBtn.BackgroundColor3=Color3.fromRGB(40,80,200) editBtn.Text="@ Edit"
editBtn.TextColor3=Color3.new(1,1,1) editBtn.Font=Enum.Font.GothamBold
editBtn.TextSize=11 editBtn.BorderSizePixel=0 editBtn.Visible=false
Instance.new("UICorner",editBtn).CornerRadius=UDim.new(0,8)
btnAnim(editBtn,Color3.fromRGB(40,80,200))

--================ PAGE HELPERS (shared) ================
local function showStatus(txt,col)
    if statusLabel then statusLabel.Text=txt statusLabel.TextColor3=col statusLabel.Visible=true end
end

--================ TIME ================
local function getTime()
    local ok,r=pcall(function()
        local req=syn and syn.request or request or http_request
        local d=HttpService:JSONDecode(req({Url="http://worldtimeapi.org/api/ip",Method="GET"}).Body)
        return "["..d.datetime:match("T(%d+:%d+:%d+)").."]"
    end)
    return ok and r or os.date("[%H:%M:%S]",os.time())
end

--================ SEND ================
local function sendRaw(url,body)
    if not url or url=="" then return end
    local r=syn and syn.request or request or http_request
    if not r then return end
    pcall(function() r({Url=url,Method="POST",Headers={["Content-Type"]="application/json"},Body=HttpService:JSONEncode(body)}) end)
end
local function sendSimple(msg,url) sendRaw(url or webhookUrl,{content=msg}) end

local function sendNpcEmbed(npc,isEnd)
    local t=getTime()
    local body
    if isEnd then
        body={content="",embeds={{description="**"..t.."**\n\nNPC Left - "..npc.name,color=npc.color,thumbnail={url=npc.image},footer={text="G Script's Macro | v1.7"},timestamp=os.date("!%Y-%m-%dT%H:%M:%S.000Z",os.time())}}}
    else
        local ping=npcPing[npc.name] and "@everyone" or ""
        local vipLine=skipVip and "" or "\n\nPrivate Server:\n"..vipLink
        body={content=ping,embeds={{description="**"..t.."**\n\nNPC Spawn - "..npc.name..vipLine,color=npc.color,thumbnail={url=npc.image},footer={text="G Script's Macro | v1.7"},timestamp=os.date("!%Y-%m-%dT%H:%M:%S.000Z",os.time())}},allowed_mentions={parse={"everyone"}}}
    end
    sendRaw(webhookUrl,body)
end

local function sendBiomeEmbed(biome,isEnd)
    local t=getTime()
    local body
    if isEnd then
        body={content="",embeds={{description="**"..t.."**\n\nBiome Ended - "..biome.name,color=biome.color,thumbnail={url=biome.image},footer={text="G Script's Macro | v1.7"},timestamp=os.date("!%Y-%m-%dT%H:%M:%S.000Z",os.time())}}}
    else
        local ping=biomePing[biome.name] and "@everyone" or ""
        local vipLine=skipVip and "" or "\n\nPrivate Server:\n"..vipLink
        body={content=ping,embeds={{description="**"..t.."**\n\nBiome Started - "..biome.name..vipLine,color=biome.color,thumbnail={url=biome.image},footer={text="G Script's Macro | v1.7"},timestamp=os.date("!%Y-%m-%dT%H:%M:%S.000Z",os.time())}},allowed_mentions={parse={"everyone"}}}
    end
    sendRaw(biomeWh,body)
end

--================ STOP/START ================
local function stopMacro()
    if not macroRunning then return end
    macroRunning=false _G.MacroRunning=false
    sendSimple(getTime()..": Macro stopped.")
    sendSimple(getTime()..": Macro stopped.",biomeWh)
    local h=Instance.new("Hint") h.Text=T("hintStop") h.Parent=workspace
    game:GetService("Debris"):AddItem(h,4)
    showStatus(T("stopped"),Color3.fromRGB(255,80,80))
end

local function startMacro()
    if macroRunning then return end
    macroRunning=true
    sendSimple(getTime()..": Macro started!")
    sendSimple(getTime()..": Macro started!",biomeWh)
    local h=Instance.new("Hint") h.Text=T("hintStart") h.Parent=workspace
    game:GetService("Debris"):AddItem(h,3)
    showStatus(T("running"),Color3.fromRGB(0,220,100))
end

--================ BIOME TIMER ================
local function endBiome(biome)
    if not activeBiomes[biome.name] then return end
    activeBiomes[biome.name]=false lastSentTime[biome.name]=0
    sendBiomeEmbed(biome,true)
    if currentBiome==biome.name then currentBiome=nil end
end

local function startBiomeTimer(biome)
    if currentBiome and currentBiome~=biome.name then
        for _,b in ipairs(BIOMES) do if b.name==currentBiome and activeBiomes[b.name] then endBiome(b) end end
    end
    currentBiome=biome.name activeBiomes[biome.name]=true
    if not biome.endTrigger then task.delay(biome.duration,function() endBiome(biome) end) end
end

--================ CHAT ================
local function checkMsg(text,fromPlayer)
    if not macroRunning or fromPlayer or not text or text=="" then return end
    if text:find("%[Merchant%]") then
        local low=text:lower()
        for _,npc in ipairs(NPCS) do
            if low:find(npc.keyword) and low:find("arrived") then
                local now=tick()
                if recentSent[npc.name] and now-recentSent[npc.name]<5 then return end
                recentSent[npc.name]=now
                if now-(lastSentTime[npc.name] or 0)>=COOLDOWN then
                    lastSentTime[npc.name]=now sendNpcEmbed(npc,false)
                    task.delay(NPC_DURATION,function() lastSentTime[npc.name]=0 sendNpcEmbed(npc,true) end)
                end
                return
            end
        end
    end
    for _,biome in ipairs(BIOMES) do
        if text:find(biome.trigger) then
            local now=tick()
            if recentSent[biome.name] and now-recentSent[biome.name]<5 then return end
            recentSent[biome.name]=now
            if now-(lastSentTime[biome.name] or 0)>=COOLDOWN then
                lastSentTime[biome.name]=now startBiomeTimer(biome) sendBiomeEmbed(biome,false)
            end
            return
        end
        if biome.endTrigger and text:find(biome.endTrigger) then endBiome(biome) return end
    end
end

local function hookChat()
    if chatHooked then return end chatHooked=true
    pcall(function()
        TextChatService.MessageReceived:Connect(function(msg)
            local fp=msg.TextSource and Players:GetPlayerByUserId(msg.TextSource.UserId)
            checkMsg(msg.Text or "",fp)
        end)
    end)
    task.spawn(function()
        task.wait(3)
        pcall(function()
            local cg=player.PlayerGui:WaitForChild("Chat",10)
            local lf=cg:FindFirstChild("Frame_MessageLogDisplay",true)
            if not lf then return end
            lf.ChildAdded:Connect(function(child)
                task.wait(0.1)
                local lb=child:FindFirstChildWhichIsA("TextLabel",true)
                if lb and lb.Text~="" then checkMsg(lb.Text or "",nil) end
            end)
        end)
    end)
    for _,p in ipairs(Players:GetPlayers()) do p.Chatted:Connect(function(m) checkMsg(m,p) end) end
    Players.PlayerAdded:Connect(function(p) p.Chatted:Connect(function(m) checkMsg(m,p) end) end)
    player.Chatted:Connect(function(m)
        local l=m:lower()
        if l=="/sp" then stopMacro() elseif l=="/st" then startMacro() end
    end)
end

Players.PlayerRemoving:Connect(function(p) if p==player then stopMacro() end end)
player.AncestryChanged:Connect(function() if not player.Parent then stopMacro() end end)

--================ BUILD FRAMES ================
local FW = math.min(vp.X-20, 400)
local FH = math.min(vp.Y-40, 500)
local BLUE = Color3.fromRGB(60,120,255)
local DBLUE = Color3.fromRGB(40,80,200)
local RED  = Color3.fromRGB(220,55,55)
local DARK = Color3.fromRGB(20,20,26)

-- forward refs
local langTitleLbl = nil
local langPage,howPage,inputPage,selectPage

local function goTo(from,to)
    task.spawn(function()
        fadeOut(from,function() fadeIn(to) end)
    end)
end

--==== PAGE 0: LANGUAGE ====
langPage = Instance.new("Frame",gui)
langPage.Size=UDim2.new(0,FW,0,200)
langPage.Position=UDim2.new(0.5,-FW/2,0.5,-100)
langPage.BackgroundColor3=DARK langPage.BorderSizePixel=0
langPage.Active=true langPage.Visible=false
Instance.new("UICorner",langPage).CornerRadius=UDim.new(0,14)
Instance.new("UIStroke",langPage).Color=BLUE
do
    local _,tl=mkHeader(langPage,FW,"")
    tl.Text="" -- set by refresh
    local lTitleLbl=tl

    local bw=math.floor((FW-32)/3)
    local b1=mkBtn(langPage,"EN",8,54,bw,42,BLUE)
    local b2=mkBtn(langPage,"TH",8+bw+8,54,bw,42,BLUE)
    local b3=mkBtn(langPage,"VN",8+bw*2+16,54,bw,42,BLUE)
    b1.TextSize=13 b2.TextSize=13 b3.TextSize=13

    local ver=mkLbl(langPage,"G Script's Macro | v1.7",0,108,FW,20,10,false,Color3.fromRGB(90,90,110),true)
    ver.TextYAlignment=Enum.TextYAlignment.Center

    local function pickLang(l)
        lang=l
        fadeOut(langPage,function()
            -- update how page texts then show
            refreshHow()
            fadeIn(howPage)
        end)
    end
    b1.MouseButton1Click:Connect(function() pickLang("ENG") end)
    b2.MouseButton1Click:Connect(function() pickLang("TH")  end)
    b3.MouseButton1Click:Connect(function() pickLang("VN")  end)

    -- store ref for refresh
    langTitleLbl = tl
end

--==== PAGE 1: HOW TO ====
howPage = Instance.new("Frame",gui)
howPage.Size=UDim2.new(0,FW,0,FH)
howPage.Position=UDim2.new(0.5,-FW/2,0.5,-FH/2)
howPage.BackgroundColor3=DARK howPage.BorderSizePixel=0
howPage.Active=true howPage.Visible=false
Instance.new("UICorner",howPage).CornerRadius=UDim.new(0,14)
Instance.new("UIStroke",howPage).Color=BLUE

local howHdrFr,howTitleLbl = mkHeader(howPage,FW,"")

-- scroll (no lang bar inside how page)
local howScroll=Instance.new("ScrollingFrame",howPage)
howScroll.Size=UDim2.new(1,-16,1,-100) howScroll.Position=UDim2.new(0,8,0,52)
howScroll.BackgroundTransparency=1 howScroll.BorderSizePixel=0
howScroll.ScrollBarThickness=4 howScroll.ScrollBarImageColor3=BLUE
howScroll.CanvasSize=UDim2.new(0,0,0,700)
local ci=Instance.new("Frame",howScroll) ci.Size=UDim2.new(1,0,0,700) ci.BackgroundTransparency=1

local bigTitleLbl = mkLbl(ci,"",0,0,FW-16,38,12,true,Color3.fromRGB(140,170,255),true)
bigTitleLbl.BackgroundColor3=Color3.fromRGB(28,28,45) bigTitleLbl.BackgroundTransparency=0
bigTitleLbl.TextYAlignment=Enum.TextYAlignment.Center
Instance.new("UICorner",bigTitleLbl).CornerRadius=UDim.new(0,8)

local function mkSecHdr(y,txt)
    local f=Instance.new("Frame",ci)
    f.Size=UDim2.new(1,0,0,26) f.Position=UDim2.new(0,0,0,y)
    f.BackgroundColor3=Color3.fromRGB(45,55,90) f.BorderSizePixel=0
    Instance.new("UICorner",f).CornerRadius=UDim.new(0,7)
    local l=Instance.new("TextLabel",f)
    l.Size=UDim2.new(1,-8,1,0) l.Position=UDim2.new(0,8,0,0)
    l.BackgroundTransparency=1 l.Text=txt
    l.TextColor3=Color3.fromRGB(180,205,255) l.Font=Enum.Font.GothamBold l.TextSize=11
    l.TextXAlignment=Enum.TextXAlignment.Left l.TextYAlignment=Enum.TextYAlignment.Center
    return l
end

local s1Lbl=mkSecHdr(44,"")
local s1Body=mkLbl(ci,"",4,74,FW-24,140,10,false,Color3.fromRGB(200,200,215),false)
local s2Lbl=mkSecHdr(222,"")
local s2Body=mkLbl(ci,"",4,252,FW-24,140,10,false,Color3.fromRGB(200,200,215),false)

-- video link in sec2
local vidLbl=mkLbl(ci,"",4,400,FW-110,18,10,false,Color3.fromRGB(170,170,190),false)
local urlLbl=mkLbl(ci,"https://youtu.be/ejrTN2DkOiQ",4,420,FW-110,18,10,false,Color3.fromRGB(80,160,255),false)
local cpBtn=mkBtn(ci,"Copy",FW-100,416,80,24,DBLUE) cpBtn.TextSize=10
cpBtn.MouseButton1Click:Connect(function()
    pcall(function()
        local cb=setclipboard or (syn and syn.setclipboard) or toclipboard
        if cb then cb("https://youtu.be/ejrTN2DkOiQ?si=e_1-l-nNkNmHFL7i") end
    end)
    local orig=cpBtn.Text cpBtn.Text="Copied!"
    task.wait(1.5) cpBtn.Text=orig
end)

local s3Lbl=mkSecHdr(452,"")
local s3Body=mkLbl(ci,"",4,482,FW-24,140,10,false,Color3.fromRGB(200,200,215),false)

-- bottom bar
local howBar=Instance.new("Frame",howPage)
howBar.Size=UDim2.new(1,-16,0,40) howBar.Position=UDim2.new(0,8,1,-48)
howBar.BackgroundTransparency=1 howBar.BorderSizePixel=0
local howBack=mkBtn(howBar,"",0,0,math.floor((FW-20)/2),36,Color3.fromRGB(50,55,75))
local howNext=mkBtn(howBar,"",math.floor((FW-20)/2)+4,0,math.floor((FW-20)/2),36,BLUE)
howBack.TextSize=12 howNext.TextSize=12

howBack.MouseButton1Click:Connect(function()
    fadeOut(howPage,function() fadeIn(langPage) end)
end)
howNext.MouseButton1Click:Connect(function()
    refreshInput()
    fadeOut(howPage,function() fadeIn(inputPage) end)
end)

--==== PAGE 2: INPUT (webhook + vip) ====
inputPage = Instance.new("Frame",gui)
inputPage.Size=UDim2.new(0,FW,0,FH)
inputPage.Position=UDim2.new(0.5,-FW/2,0.5,-FH/2)
inputPage.BackgroundColor3=DARK inputPage.BorderSizePixel=0
inputPage.Active=true inputPage.Draggable=false inputPage.Visible=false
Instance.new("UICorner",inputPage).CornerRadius=UDim.new(0,14)
Instance.new("UIStroke",inputPage).Color=BLUE

local _,inTitleLbl=mkHeader(inputPage,FW,"")

local inStatus=mkLbl(inputPage,"",8,50,FW-16,18,10,false,Color3.fromRGB(120,120,145),true)
inStatus.TextYAlignment=Enum.TextYAlignment.Center

-- NPC webhook
local npcLbl=mkLbl(inputPage,"",14,74,FW-28,14,10,false,Color3.fromRGB(135,135,160),false)
local npcBox=mkBox(inputPage,14,90,FW-90,30,"")
local tstNpc=mkBtn(inputPage,"Test",FW-72,90,58,30,Color3.fromRGB(50,55,80)) tstNpc.TextSize=10

-- Biome webhook
local bioLbl=mkLbl(inputPage,"",14,128,FW-28,14,10,false,Color3.fromRGB(135,135,160),false)
local bioBox=mkBox(inputPage,14,144,FW-90,30,"")
local tstBio=mkBtn(inputPage,"Test",FW-72,144,58,30,Color3.fromRGB(50,55,80)) tstBio.TextSize=10

-- divider
local div1=Instance.new("Frame",inputPage)
div1.Size=UDim2.new(1,-16,0,1) div1.Position=UDim2.new(0,8,0,184)
div1.BackgroundColor3=Color3.fromRGB(45,45,60) div1.BorderSizePixel=0

-- VIP section
local vipSectionLbl=mkLbl(inputPage,"",14,192,FW-28,14,10,false,Color3.fromRGB(135,135,160),false)

-- vip toggle buttons (อยู่ก่อน)
local vipSkipBtn=mkBtn(inputPage,"",14,210,math.floor((FW-36)/2),34,RED)
local vipWantBtn=mkBtn(inputPage,"",math.floor((FW-36)/2)+22,210,math.floor((FW-36)/2),34,Color3.fromRGB(50,55,80))
vipSkipBtn.TextSize=11 vipWantBtn.TextSize=11

-- vipBox อยู่ใต้ปุ่ม โผล่เมื่อกด "ฉันมี VIP"
local vipBox=mkBox(inputPage,14,252,FW-28,30,"")
vipBox.Visible=false

local vipBoxShown=false
skipVip=true -- default = skip
vipSkipBtn.MouseButton1Click:Connect(function()
    skipVip=true vipBoxShown=false vipBox.Visible=false
    TweenService:Create(vipSkipBtn,TweenInfo.new(0.15),{BackgroundColor3=RED}):Play()
    TweenService:Create(vipWantBtn,TweenInfo.new(0.15),{BackgroundColor3=Color3.fromRGB(50,55,80)}):Play()
end)
vipWantBtn.MouseButton1Click:Connect(function()
    skipVip=false vipBoxShown=true vipBox.Visible=true
    TweenService:Create(vipWantBtn,TweenInfo.new(0.15),{BackgroundColor3=BLUE}):Play()
    TweenService:Create(vipSkipBtn,TweenInfo.new(0.15),{BackgroundColor3=Color3.fromRGB(50,55,80)}):Play()
end)

-- bottom bar
local inBar=Instance.new("Frame",inputPage)
inBar.Size=UDim2.new(1,-16,0,40) inBar.Position=UDim2.new(0,8,1,-48)
inBar.BackgroundTransparency=1 inBar.BorderSizePixel=0
local inBack=mkBtn(inBar,"",0,0,math.floor((FW-20)/2),36,Color3.fromRGB(50,55,75))
local inNext=mkBtn(inBar,"",math.floor((FW-20)/2)+4,0,math.floor((FW-20)/2),36,BLUE)
inBack.TextSize=12 inNext.TextSize=12

local function setInStatus(txt,col)
    inStatus.Text=txt inStatus.TextColor3=col or Color3.fromRGB(120,120,145)
end

tstNpc.MouseButton1Click:Connect(function()
    local u=npcBox.Text
    if u=="" or not u:find("discord.com/api/webhooks") then setInStatus(T("errNpc"),RED) task.wait(2) setInStatus("",nil) return end
    sendSimple(getTime()..": Test NPC!",u) setInStatus("NPC test sent!",Color3.fromRGB(0,220,100)) task.wait(2) setInStatus("",nil)
end)
tstBio.MouseButton1Click:Connect(function()
    local u=bioBox.Text
    if u=="" or not u:find("discord.com/api/webhooks") then setInStatus(T("errBiome"),RED) task.wait(2) setInStatus("",nil) return end
    sendSimple(getTime()..": Test Biome!",u) setInStatus("Biome test sent!",Color3.fromRGB(0,220,100)) task.wait(2) setInStatus("",nil)
end)

inBack.MouseButton1Click:Connect(function()
    fadeOut(inputPage,function() fadeIn(howPage) end)
end)
inNext.MouseButton1Click:Connect(function()
    local wb=npcBox.Text
    if wb=="" or not wb:find("discord.com/api/webhooks") then setInStatus(T("errNpc"),RED) task.wait(2) setInStatus("",nil) return end
    local bb=bioBox.Text
    if bb=="" or not bb:find("discord.com/api/webhooks") then setInStatus(T("errBiome"),RED) task.wait(2) setInStatus("",nil) return end
    if not skipVip then
        local vl=vipBox.Text
        if vl=="" or not vl:find("roblox.com") then setInStatus(T("errVip"),RED) task.wait(2) setInStatus("",nil) return end
        vipLink=vl
    end
    webhookUrl=wb biomeWh=bb
    refreshSelect()
    fadeOut(inputPage,function() fadeIn(selectPage) end)
end)

--==== PAGE 3: SELECT @everyone ====
local selW=math.min(vp.X-20,500)
local selH=math.min(vp.Y-60,440)
selectPage=Instance.new("Frame",gui)
selectPage.Size=UDim2.new(0,selW,0,selH)
selectPage.Position=UDim2.new(0.5,-selW/2,0.5,-selH/2)
selectPage.BackgroundColor3=DARK selectPage.BorderSizePixel=0
selectPage.Active=true selectPage.Visible=false
Instance.new("UICorner",selectPage).CornerRadius=UDim.new(0,14)
Instance.new("UIStroke",selectPage).Color=BLUE

local _,selTitleLbl=mkHeader(selectPage,selW,"")

local cW=math.floor((selW-30)/3)
local cH=selH-100

local function mkCol(title,xPos)
    local bg=Instance.new("Frame",selectPage)
    bg.Size=UDim2.new(0,cW,0,cH) bg.Position=UDim2.new(0,xPos,0,52)
    bg.BackgroundColor3=Color3.fromRGB(26,26,34) bg.BorderSizePixel=0
    Instance.new("UICorner",bg).CornerRadius=UDim.new(0,10)
    local hdr=Instance.new("TextLabel",bg)
    hdr.Size=UDim2.new(1,0,0,24) hdr.Position=UDim2.new(0,0,0,2)
    hdr.BackgroundTransparency=1 hdr.Text=title
    hdr.TextColor3=BLUE hdr.Font=Enum.Font.GothamBold hdr.TextSize=11
    hdr.TextXAlignment=Enum.TextXAlignment.Center
    local sc=Instance.new("ScrollingFrame",bg)
    sc.Size=UDim2.new(1,-4,1,-30) sc.Position=UDim2.new(0,2,0,28)
    sc.BackgroundTransparency=1 sc.BorderSizePixel=0
    sc.ScrollBarThickness=3 sc.ScrollBarImageColor3=BLUE
    sc.CanvasSize=UDim2.new(0,0,0,0)
    return sc
end

local npcScroll  =mkCol("NPC",8)
local biomeScroll=mkCol("Biome",8+cW+7)
local rareScroll =mkCol("Rare",8+(cW+7)*2)

local function addCb(scroll,name,def,onToggle)
    local n=#scroll:GetChildren()
    local row=Instance.new("Frame",scroll)
    row.Size=UDim2.new(1,-4,0,26) row.Position=UDim2.new(0,2,0,n*28)
    row.BackgroundTransparency=1
    local box=Instance.new("TextButton",row)
    box.Size=UDim2.new(0,18,0,18) box.Position=UDim2.new(0,2,0,4)
    box.BackgroundColor3=def and BLUE or Color3.fromRGB(48,48,60)
    box.Text=def and "v" or "" box.TextColor3=Color3.new(1,1,1)
    box.Font=Enum.Font.GothamBold box.TextSize=11 box.BorderSizePixel=0
    Instance.new("UICorner",box).CornerRadius=UDim.new(0,4)
    local lbl=Instance.new("TextLabel",row)
    lbl.Size=UDim2.new(1,-24,1,0) lbl.Position=UDim2.new(0,24,0,0)
    lbl.BackgroundTransparency=1 lbl.Text=name
    lbl.TextColor3=Color3.new(1,1,1) lbl.Font=Enum.Font.Gotham lbl.TextSize=10
    lbl.TextXAlignment=Enum.TextXAlignment.Left
    local en=def
    box.MouseButton1Click:Connect(function()
        en=not en
        TweenService:Create(box,TweenInfo.new(0.14),{BackgroundColor3=en and BLUE or Color3.fromRGB(48,48,60)}):Play()
        box.Text=en and "v" or ""
        onToggle(en)
    end)
    scroll.CanvasSize=UDim2.new(0,0,0,(n+1)*28)
end

for _,n in ipairs(NPCS)   do addCb(npcScroll,  n.name,true, function(v) npcPing[n.name]=v end) end
for _,b in ipairs(BIOMES) do
    if not b.rare then addCb(biomeScroll,b.name,false,function(v) biomePing[b.name]=v end) end
end
for _,b in ipairs(BIOMES) do
    if b.rare then addCb(rareScroll,b.name,true,function(v) biomePing[b.name]=v end) end
end

local bY=selH-44
local selBack=mkBtn(selectPage,"",8,bY,math.floor(selW/2)-12,36,Color3.fromRGB(50,55,75))
local selOk  =mkBtn(selectPage,"",math.floor(selW/2)+4,bY,math.floor(selW/2)-12,36,BLUE)
selBack.TextSize=12 selOk.TextSize=12

selBack.MouseButton1Click:Connect(function()
    fadeOut(selectPage,function() fadeIn(inputPage) end)
end)
selOk.MouseButton1Click:Connect(function()
    fadeOut(selectPage,function()
        blurOut()
        macroRunning=true hookChat()
        sendSimple(getTime()..": Macro started!")
        sendSimple(getTime()..": Macro started!",biomeWh)
        showStatus(T("running"),Color3.fromRGB(0,220,100))
        statusLabel.Visible=true
        editBtn.Visible=true
    end)
end)

-- edit button opens select page again
editBtn.MouseButton1Click:Connect(function()
    stopMacro()
    refreshSelect()
    fadeIn(selectPage)
end)

--================ REFRESH FUNCTIONS ================
function refreshHow()
    howTitleLbl.Text    = T("howBigTitle")
    bigTitleLbl.Text    = T("howBigTitle")
    s1Lbl.Text          = T("howSec1")
    s1Body.Text         = T("howSec1Body")
    s2Lbl.Text          = T("howSec2")
    s2Body.Text         = T("howSec2Body")
    s3Lbl.Text          = T("howSec3")
    s3Body.Text         = T("howSec3Body")
    vidLbl.Text         = T("howVideo")
    howBack.Text        = T("back")
    howNext.Text        = T("next")
    howScroll.CanvasPosition = Vector2.new(0,0)
end

function refreshInput()
    inTitleLbl.Text          = T("inputTitle")
    npcLbl.Text              = T("npcWh")
    bioLbl.Text              = T("biomeWh")
    vipSectionLbl.Text       = T("vipTitle")
    npcBox.PlaceholderText   = T("npcPlaceholder")
    bioBox.PlaceholderText   = T("biomePlaceholder")
    vipBox.PlaceholderText   = T("vipPlaceholder")
    vipSkipBtn.Text          = T("vipSkip")
    vipWantBtn.Text          = T("vipWant")
    tstNpc.Text              = T("testBtn")
    tstBio.Text              = T("testBtn")
    inBack.Text              = T("back")
    inNext.Text              = T("next")
    setInStatus("",nil)
end

function refreshSelect()
    selTitleLbl.Text = T("selectTitle")
    selBack.Text     = T("back")
    selOk.Text       = T("ok")
end

-- lang page title refresh
local function refreshLang()
    if langTitleLbl then
        langTitleLbl.Text = T("langTitle")
    end
end

--================ INIT ================
lang="ENG"
refreshLang()
refreshHow()
refreshInput()
refreshSelect()

blurIn()
task.wait(0.3)
fadeIn(langPage)

print("v1.7 loaded | /SP stop | /ST start")
