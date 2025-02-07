Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8FCA2BB9F
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2025 07:40:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.883254.1293439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgI24-0002SF-La; Fri, 07 Feb 2025 06:40:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 883254.1293439; Fri, 07 Feb 2025 06:40:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgI24-0002P9-IO; Fri, 07 Feb 2025 06:40:08 +0000
Received: by outflank-mailman (input) for mailman id 883254;
 Fri, 07 Feb 2025 01:21:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+S8b=U6=gmail.com=cyangping1@srs-se1.protection.inumbo.net>)
 id 1tgD3g-0007eQ-4o
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2025 01:21:28 +0000
Received: from mail-oo1-xc43.google.com (mail-oo1-xc43.google.com
 [2607:f8b0:4864:20::c43])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9015f91-e4f1-11ef-b3ef-695165c68f79;
 Fri, 07 Feb 2025 02:21:25 +0100 (CET)
Received: by mail-oo1-xc43.google.com with SMTP id
 006d021491bc7-5f2efbc31deso863835eaf.3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Feb 2025 17:21:25 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: d9015f91-e4f1-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738891284; x=1739496084; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QlV7t0xrapBbLrnrqZR6V3DwsdpQs3II9UHY+DZiuK8=;
        b=CERcuhGw2MJNXVhDZxCMPwyICgSl8XjD7aTQ7CXBjCYkwI6DNrBinE+yMNI9Gswrwf
         qIvbv5NtjX15NJA3XWYnxzz56FEzWVQkh0qt3YjVFUd+TC7dcLwXiQajvn68/MkO2ESu
         FPQ6nqufMsvdWf6NAGqqPnvxVihCSDkuX0KlxbrHXua+Hi6ACvtTBOUT5Y7SxuYUYiyF
         PQahWzL+UP+rJy/kyBOKms36LG85GyHU8lkcQunKeTpJr1jcTQEkcNK1RNq3k/DgI2iQ
         vPxGBKAF6NTMDTIn0l9AFeBTVVrLrX2poC8QiZ9p3w+Dv5+gFbOEddyqt3XrV8boNeXy
         4VHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738891284; x=1739496084;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QlV7t0xrapBbLrnrqZR6V3DwsdpQs3II9UHY+DZiuK8=;
        b=PlA4JGhzbIisrQStR57QIsUhgDGXEVshVlCaE5Zd3KdGgRsqb7ia+J29o5l03Dymfy
         dF3feyvBP+7zm61/AJqC2LoSak6GRuERvvTW3sKr24fcCFpIvPuG1iyo5U/zg7SMEV7Q
         apcUDCqfoim2ao1w5z1WyW5ry1G0i3iNtBzY4P5+70yqEdZhoITJy6yy+b25diOEQi5F
         1gl7H5/sC1IIgQcPu9yn+U3brovQ9UWxfaXE+NSGek+2/wwqM3LT8N3ZrMVQR4j+rDMO
         V+hHJ3QZPXqISNfpNp3X26xVSGVX4LXGbK3PZlOAYVEZiSErAs0qCEWH4JOUy+DYiGza
         gSWA==
X-Gm-Message-State: AOJu0YywbL77In8jrFqFIxI33gEZoxMFpFKFZYjBZxtKas+U83/f+WQ1
	Poo8I4xPCPmEYyfez1qHFlBIFOSne0+Boffgwf/hDsvsbVqC8HlutuJEsDCj0sCS3PPNcIxiLGE
	zn+vSdSwEt3MPpO4smYqKc9r6siZNVxmFiKuwdw==
X-Gm-Gg: ASbGncuVSCcmkRkZbHM1fN+l9SX7vwKFJL3Be9wN3OP6do4hprgh4Rv8iEEmTX0yc3d
	hNQ5aVcBmnKBZU+3QRBYj04t3fWl+t592M8qt2muNiSCCFyjOG4WELRg7f0yILc/DJHDujUM=
X-Google-Smtp-Source: AGHT+IGRNqYvjEttNOnCSidfxJV7cOJD+1gBBTlVXweIRafXkrG2hD5LJyM6ZgbyptX804S2TYjDDKWpCmo32HEYjPs=
X-Received: by 2002:a4a:ee14:0:b0:5fa:8925:3d76 with SMTP id
 006d021491bc7-5fc5e5c755dmr1124140eaf.1.1738891284200; Thu, 06 Feb 2025
 17:21:24 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?B?6ZmI6Ziz5bmz?= <cyangping1@gmail.com>
Date: Fri, 7 Feb 2025 09:21:13 +0800
X-Gm-Features: AWEUYZlqTHiIzcyWOpuwBAU_7gzY6IjO1rhpMUxeiL3_HYpKORTpW-2TJD9aE7M
Message-ID: <CAO=13s98129neuHFG3jtDm_UK-1jeryc2_bOVmfngacgMeq-ZA@mail.gmail.com>
Subject: =?UTF-8?Q?=5Bqemu_arm64=5D=5Befi=5D_=E2=80=9C_Instruction_abort=3A_Translation?=
	=?UTF-8?Q?_fault=2C_third_level=E2=80=9D_happend_when_using_QEMU_to_boot_Xen_v?=
	=?UTF-8?Q?ia_EFI=2E?=
To: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="0000000000004c4691062d832d43"

--0000000000004c4691062d832d43
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

hi,

I use QEMU_EFI to start xen, and when xen calls:
status =3D SystemTable->BootServices->ExitBootServices(ImageHandle,
map_key);

DxeMain.c CoreExitBootServices function execution and the Status is 0, and
then happen Synchronous Exception, Instruction abort: Translation fault,
third level
Steps To Reproduce=EF=BC=9A

1.QEMU emulator version 9.0.4 (v9.0.4)
qemu-system-aarch64 -M virt -cpu max -m 2048 -bios QEMU_EFI.fd -drive
if=3Dnone,file=3Dxen-uefi.img,format=3Draw,id=3Defidisk -device
virtio-blk-device,drive=3Defidisk -serial mon:stdio -nographic
2. QEMU_EFI is built using the latest code , build -a AARCH64 -t GCC5 -p
./edk2/ArmVirtPkg/ArmVirtQemu.dsc -b DEBUG ; xen version has tried version
4.9, 4.17.4.19
3. enter UEFI shell and execute xen.efi

Can you help me take a look? I would really appreciate it=EF=BC=81

the log as follow:

CoreExitBootServices
SetUefiImageMemoryAttributes - 0x00000000BFE60000 - 0x0000000000040000
(0x0000000000000008)
SetUefiImageMemoryAttributes - 0x00000000BF5C0000 - 0x0000000000040000
(0x0000000000000008)
SetUefiImageMemoryAttributes - 0x00000000BF570000 - 0x0000000000040000
(0x0000000000000008)
SetUefiImageMemoryAttributes - 0x00000000BF400000 - 0x0000000000040000
(0x0000000000000008)
SetUefiImageMemoryAttributes - 0x00000000BF280000 - 0x0000000000040000
(0x0000000000000008)
SetUefiImageMemoryAttributes - 0x00000000BFE20000 - 0x0000000000030000
(0x0000000000000008)
SetUefiImageMemoryAttributes - 0x00000000BF1A0000 - 0x0000000000030000
(0x0000000000000008)
SetUefiImageMemoryAttributes - 0x00000000BF160000 - 0x0000000000030000
(0x0000000000000008)
CoreExitBootServices end Status :0.

Synchronous Exception at 0x0000000000000000
PC 0x000000000000
PC 0x0000BE673BE4 (0x0000BE660000+0x00013BE4) [ 1] Shell.dll
PC 0x0000BE48EAF4
PC 0x0000BE48ED08
PC 0x0000BE492418
PC 0x00004781844C (0x000047811000+0x0000744C) [ 2] DxeCore.dll
PC 0x0000BE6652F0 (0x0000BE660000+0x000052F0) [ 3] Shell.dll
PC 0x0000BE666FCC (0x0000BE660000+0x00006FCC) [ 3] Shell.dll
PC 0x0000BE6681F8 (0x0000BE660000+0x000081F8) [ 3] Shell.dll
PC 0x00004781844C (0x000047811000+0x0000744C) [ 4] DxeCore.dll
PC 0x0000BE8345D8 (0x0000BE82A000+0x0000A5D8) [ 5] UiApp.dll
PC 0x0000BE838C20 (0x0000BE82A000+0x0000EC20) [ 5] UiApp.dll
PC 0x0000BF54D4F4 (0x0000BF537000+0x000164F4) [ 6] SetupBrowser.dll
PC 0x0000BF542858 (0x0000BF537000+0x0000B858) [ 6] SetupBrowser.dll
PC 0x0000BE832064 (0x0000BE82A000+0x00008064) [ 7] UiApp.dll
PC 0x00004781844C (0x000047811000+0x0000744C) [ 8] DxeCore.dll
PC 0x0000BF2ED6F4 (0x0000BF2E6000+0x000076F4) [ 9] BdsDxe.dll
PC 0x0000BF2EF824 (0x0000BF2E6000+0x00009824) [ 9] BdsDxe.dll
PC 0x00004781BE94 (0x000047811000+0x0000AE94) [ 10] DxeCore.dll
[ 1]
/home/code/1-qemu-uefi/Build/ArmVirtQemu-AARCH64/DEBUG_GCC5/AARCH64/ShellPk=
g/Application/Shell/Shell/DEBUG/Shell.dll
[ 2]
/home/code/1-qemu-uefi/Build/ArmVirtQemu-AARCH64/DEBUG_GCC5/AARCH64/MdeModu=
lePkg/Core/Dxe/DxeMain/DEBUG/DxeCore.dll
[ 3]
/home/code/1-qemu-uefi/Build/ArmVirtQemu-AARCH64/DEBUG_GCC5/AARCH64/ShellPk=
g/Application/Shell/Shell/DEBUG/Shell.dll
[ 4]
/home/code/1-qemu-uefi/Build/ArmVirtQemu-AARCH64/DEBUG_GCC5/AARCH64/MdeModu=
lePkg/Core/Dxe/DxeMain/DEBUG/DxeCore.dll
[ 5]
/home/code/1-qemu-uefi/Build/ArmVirtQemu-AARCH64/DEBUG_GCC5/AARCH64/MdeModu=
lePkg/Application/UiApp/UiApp/DEBUG/UiApp.dll
[ 6]
/home/code/1-qemu-uefi/Build/ArmVirtQemu-AARCH64/DEBUG_GCC5/AARCH64/MdeModu=
lePkg/Universal/SetupBrowserDxe/SetupBrowserDxe/DEBUG/SetupBrowser.dll
[ 7]
/home/code/1-qemu-uefi/Build/ArmVirtQemu-AARCH64/DEBUG_GCC5/AARCH64/MdeModu=
lePkg/Application/UiApp/UiApp/DEBUG/UiApp.dll
[ 8]
/home/code/1-qemu-uefi/Build/ArmVirtQemu-AARCH64/DEBUG_GCC5/AARCH64/MdeModu=
lePkg/Core/Dxe/DxeMain/DEBUG/DxeCore.dll
[ 9]
/home/code/1-qemu-uefi/Build/ArmVirtQemu-AARCH64/DEBUG_GCC5/AARCH64/MdeModu=
lePkg/Universal/BdsDxe/BdsDxe/DEBUG/BdsDxe.dll
[ 10]
/home/code/1-qemu-uefi/Build/ArmVirtQemu-AARCH64/DEBUG_GCC5/AARCH64/MdeModu=
lePkg/Core/Dxe/DxeMain/DEBUG/DxeCore.dll

X0 0x0000000000000000 X1 0x00000000BE72C278 X2 0x000000004780FEB8 X3
0x0000000000000000
X4 0x0000000000000001 X5 0x0000000000000001 X6 0x0000000000000000 X7
0x0000000000000000
X8 0x00600000BF16070F X9 0x00000000BF160000 X10 0x0000000000000003 X11
0x00000000BEF8EFFF
X12 0x0000000000000002 X13 0x0000000000000000 X14 0x6300000008000000 X15
0x0000000000000000
X16 0x00000000BF51D280 X17 0x0000000000687010 X18 0x0000000000000000 X19
0x00000000BE6DA1E0
X20 0x00000000BE81F198 X21 0x00000000BE4A3A88 X22 0x0000000050000000 X23
0x0000000000000001
X24 0x00000000BE73A000 X25 0x00000000BE7C3000 X26 0x00000000BE4BE8E8 X27
0x0000000000000002
X28 0x0000000000000000 FP 0x000000004780FE50 LR 0x00000000BE673BE4

V0 0x0000000000000000 0000000000000000 V1 0x0000000000000000
0000000000000000
V2 0x0000000000000000 0000000000000000 V3 0x0000000000000000
0000000000000000
V4 0x0000000000000000 0000000000000000 V5 0x0000000000000000
0000000000000000
V6 0x0000000000000000 0000000000000000 V7 0x0000000000000000
0000000000000000
V8 0x0000000000000000 0000000000000000 V9 0x0000000000000000
0000000000000000
V10 0x0000000000000000 0000000000000000 V11 0x0000000000000000
0000000000000000
V12 0x0000000000000000 0000000000000000 V13 0x0000000000000000
0000000000000000
V14 0x0000000000000000 0000000000000000 V15 0x0000000000000000
0000000000000000
V16 0x0000000000000000 0000000000000000 V17 0x0000000000000000
0000000000000000
V18 0x0000000000000000 0000000000000000 V19 0x0000000000000000
0000000000000000
V20 0x0000000000000000 0000000000000000 V21 0x0000000000000000
0000000000000000
V22 0x0000000000000000 0000000000000000 V23 0x0000000000000000
0000000000000000
V24 0x0000000000000000 0000000000000000 V25 0x0000000000000000
0000000000000000
V26 0x0000000000000000 0000000000000000 V27 0x0000000000000000
0000000000000000
V28 0x0000000000000000 0000000000000000 V29 0x0000000000000000
0000000000000000
V30 0x0000000000000000 0000000000000000 V31 0x0000000000000000
0000000000000000

SP 0x000000004780FE50 ELR 0x0000000000000000 SPSR 0x60000AC5 FPSR 0x0000000=
0
ESR 0x86000007 FAR 0x0000000000000000

ESR : EC 0x21 IL 0x1 ISS 0x00000007

Instruction abort: Translation fault, third level

Stack dump:
000004780FD50: 000000004780FE80 00000000FFFFFFD0 000000004780FEB0
000000004780FEB0
000004780FD70: 000000004780FE80 00000000FFFFFFD0 7469784565726F43
76726553746F6F42
000004780FD90: 6E65202073656369 7375746174532064 000A0D202E303A20
000000000000070D
000004780FDB0: 0000002700000001 00000000BF5229D6 0000000000030000
00000000478329F0
000004780FDD0: 000000004780FE30 0000000047817B8C 0000000000000008
000000004783C000
000004780FDF0: 00000000BF160000 0000000000030000 0000000000000001
0000000000030000
000004780FE10: 0000000000000008 00000000BF160000 0000000000010000
006000000000070C
000004780FE30: 000000004780FEB0 000000004781C6AC 000000004780FE60
00000000BFE7042C

000004780FE50: 000000004780FEE0 00000000BE48EAF4 0000000000000000
0000000030000000
000004780FE70: 00000000BE7C1018 0000000050000000 00000000BFFD0018
0000000001000000
000004780FE90: 00000000BE7C3000 00000000BE4BE8E8 0000000000000002
0000000000000000
000004780FEB0: 000000004780FF00 00000000BE492408 0000000000000000
0000000030000000
000004780FED0: 00000000BE7C1018 0000000050000000 000000004780FEF0
00000000BE48ED08
000004780FEF0: 000000004780FF00 00000000BE492418 0000000047810010
000000004781844C
000004780FF10: 0000000000000000 00000000BE818798 00000000BE73A000
0000000000000001
000004780FF30: 00000000BE72C248 00000000478102A8 00000000BE6DA000
0000000000000000
ASSERT [ArmCpuDxe]
/home/code/1-qemu-uefi/edk2/ArmPkg/Library/DefaultExceptionHandlerLib/AArch=
64/DefaultExceptionHandler.c(340):
((BOOLEAN)(0=3D=3D1))

--0000000000004c4691062d832d43
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p style=3D"box-sizing:border-box;margin-top:0px;color:rgb=
(31,35,40);font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot=
;,&quot;Noto Sans&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&=
quot;,&quot;Segoe UI Emoji&quot;;font-size:14px">hi,</p><p dir=3D"auto" sty=
le=3D"box-sizing:border-box;margin-top:0px;color:rgb(31,35,40);font-family:=
-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,&quot;Noto Sans&quot;=
,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Em=
oji&quot;;font-size:14px">I use QEMU_EFI to start xen, and when xen calls:<=
br style=3D"box-sizing:border-box">status =3D SystemTable-&gt;BootServices-=
&gt;ExitBootServices(ImageHandle,<br style=3D"box-sizing:border-box">map_ke=
y);</p><p dir=3D"auto" style=3D"box-sizing:border-box;margin-top:0px;color:=
rgb(31,35,40);font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&q=
uot;,&quot;Noto Sans&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emo=
ji&quot;,&quot;Segoe UI Emoji&quot;;font-size:14px">DxeMain.c CoreExitBootS=
ervices function execution and the Status is 0, and then happen Synchronous=
 Exception,=C2=A0Instruction abort: Translation fault, third level</p><h3 d=
ir=3D"auto" style=3D"box-sizing:border-box;font-size:1.25em;line-height:1.2=
5;color:rgb(31,35,40);font-family:-apple-system,BlinkMacSystemFont,&quot;Se=
goe UI&quot;,&quot;Noto Sans&quot;,Helvetica,Arial,sans-serif,&quot;Apple C=
olor Emoji&quot;,&quot;Segoe UI Emoji&quot;">Steps To Reproduce=EF=BC=9A</h=
3><p dir=3D"auto" style=3D"box-sizing:border-box;margin-top:0px;color:rgb(3=
1,35,40);font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,=
&quot;Noto Sans&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&qu=
ot;,&quot;Segoe UI Emoji&quot;;font-size:14px">1.QEMU emulator version 9.0.=
4 (v9.0.4)<br style=3D"box-sizing:border-box">qemu-system-aarch64 -M virt -=
cpu max -m 2048 -bios QEMU_EFI.fd -drive if=3Dnone,file=3Dxen-uefi.img,form=
at=3Draw,id=3Defidisk -device virtio-blk-device,drive=3Defidisk -serial mon=
:stdio -nographic<br style=3D"box-sizing:border-box">2. QEMU_EFI is built u=
sing the latest code , build -a AARCH64 -t GCC5 -p ./edk2/ArmVirtPkg/ArmVir=
tQemu.dsc -b DEBUG ; xen version has tried version 4.9, 4.17.4.19<br style=
=3D"box-sizing:border-box">3. enter UEFI shell and execute xen.efi</p><p st=
yle=3D"box-sizing:border-box;margin-top:0px;color:rgb(31,35,40);font-family=
:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,&quot;Noto Sans&quot=
;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI E=
moji&quot;;font-size:14px">

Can you help me take a look? I would really appreciate it=EF=BC=81</p><p di=
r=3D"auto" style=3D"box-sizing:border-box;margin-top:0px;color:rgb(31,35,40=
);font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,&quot;N=
oto Sans&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&qu=
ot;Segoe UI Emoji&quot;;font-size:14px">the log as follow:</p><p dir=3D"aut=
o" style=3D"box-sizing:border-box;margin-top:0px;color:rgb(31,35,40);font-f=
amily:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,&quot;Noto Sans=
&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe=
 UI Emoji&quot;;font-size:14px">CoreExitBootServices<br style=3D"box-sizing=
:border-box">SetUefiImageMemoryAttributes - 0x00000000BFE60000 - 0x00000000=
00040000 (0x0000000000000008)<br style=3D"box-sizing:border-box">SetUefiIma=
geMemoryAttributes - 0x00000000BF5C0000 - 0x0000000000040000 (0x00000000000=
00008)<br style=3D"box-sizing:border-box">SetUefiImageMemoryAttributes - 0x=
00000000BF570000 - 0x0000000000040000 (0x0000000000000008)<br style=3D"box-=
sizing:border-box">SetUefiImageMemoryAttributes - 0x00000000BF400000 - 0x00=
00000000040000 (0x0000000000000008)<br style=3D"box-sizing:border-box">SetU=
efiImageMemoryAttributes - 0x00000000BF280000 - 0x0000000000040000 (0x00000=
00000000008)<br style=3D"box-sizing:border-box">SetUefiImageMemoryAttribute=
s - 0x00000000BFE20000 - 0x0000000000030000 (0x0000000000000008)<br style=
=3D"box-sizing:border-box">SetUefiImageMemoryAttributes - 0x00000000BF1A000=
0 - 0x0000000000030000 (0x0000000000000008)<br style=3D"box-sizing:border-b=
ox">SetUefiImageMemoryAttributes - 0x00000000BF160000 - 0x0000000000030000 =
(0x0000000000000008)<br style=3D"box-sizing:border-box">CoreExitBootService=
s end Status :0.</p><p dir=3D"auto" style=3D"box-sizing:border-box;margin-t=
op:0px;color:rgb(31,35,40);font-family:-apple-system,BlinkMacSystemFont,&qu=
ot;Segoe UI&quot;,&quot;Noto Sans&quot;,Helvetica,Arial,sans-serif,&quot;Ap=
ple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;;font-size:14px">Synchronou=
s Exception at 0x0000000000000000<br style=3D"box-sizing:border-box">PC 0x0=
00000000000<br style=3D"box-sizing:border-box">PC 0x0000BE673BE4 (0x0000BE6=
60000+0x00013BE4) [ 1] Shell.dll<br style=3D"box-sizing:border-box">PC 0x00=
00BE48EAF4<br style=3D"box-sizing:border-box">PC 0x0000BE48ED08<br style=3D=
"box-sizing:border-box">PC 0x0000BE492418<br style=3D"box-sizing:border-box=
">PC 0x00004781844C (0x000047811000+0x0000744C) [ 2] DxeCore.dll<br style=
=3D"box-sizing:border-box">PC 0x0000BE6652F0 (0x0000BE660000+0x000052F0) [ =
3] Shell.dll<br style=3D"box-sizing:border-box">PC 0x0000BE666FCC (0x0000BE=
660000+0x00006FCC) [ 3] Shell.dll<br style=3D"box-sizing:border-box">PC 0x0=
000BE6681F8 (0x0000BE660000+0x000081F8) [ 3] Shell.dll<br style=3D"box-sizi=
ng:border-box">PC 0x00004781844C (0x000047811000+0x0000744C) [ 4] DxeCore.d=
ll<br style=3D"box-sizing:border-box">PC 0x0000BE8345D8 (0x0000BE82A000+0x0=
000A5D8) [ 5] UiApp.dll<br style=3D"box-sizing:border-box">PC 0x0000BE838C2=
0 (0x0000BE82A000+0x0000EC20) [ 5] UiApp.dll<br style=3D"box-sizing:border-=
box">PC 0x0000BF54D4F4 (0x0000BF537000+0x000164F4) [ 6] SetupBrowser.dll<br=
 style=3D"box-sizing:border-box">PC 0x0000BF542858 (0x0000BF537000+0x0000B8=
58) [ 6] SetupBrowser.dll<br style=3D"box-sizing:border-box">PC 0x0000BE832=
064 (0x0000BE82A000+0x00008064) [ 7] UiApp.dll<br style=3D"box-sizing:borde=
r-box">PC 0x00004781844C (0x000047811000+0x0000744C) [ 8] DxeCore.dll<br st=
yle=3D"box-sizing:border-box">PC 0x0000BF2ED6F4 (0x0000BF2E6000+0x000076F4)=
 [ 9] BdsDxe.dll<br style=3D"box-sizing:border-box">PC 0x0000BF2EF824 (0x00=
00BF2E6000+0x00009824) [ 9] BdsDxe.dll<br style=3D"box-sizing:border-box">P=
C 0x00004781BE94 (0x000047811000+0x0000AE94) [ 10] DxeCore.dll<br style=3D"=
box-sizing:border-box">[ 1] /home/code/1-qemu-uefi/Build/ArmVirtQemu-AARCH6=
4/DEBUG_GCC5/AARCH64/ShellPkg/Application/Shell/Shell/DEBUG/Shell.dll<br st=
yle=3D"box-sizing:border-box">[ 2] /home/code/1-qemu-uefi/Build/ArmVirtQemu=
-AARCH64/DEBUG_GCC5/AARCH64/MdeModulePkg/Core/Dxe/DxeMain/DEBUG/DxeCore.dll=
<br style=3D"box-sizing:border-box">[ 3] /home/code/1-qemu-uefi/Build/ArmVi=
rtQemu-AARCH64/DEBUG_GCC5/AARCH64/ShellPkg/Application/Shell/Shell/DEBUG/Sh=
ell.dll<br style=3D"box-sizing:border-box">[ 4] /home/code/1-qemu-uefi/Buil=
d/ArmVirtQemu-AARCH64/DEBUG_GCC5/AARCH64/MdeModulePkg/Core/Dxe/DxeMain/DEBU=
G/DxeCore.dll<br style=3D"box-sizing:border-box">[ 5] /home/code/1-qemu-uef=
i/Build/ArmVirtQemu-AARCH64/DEBUG_GCC5/AARCH64/MdeModulePkg/Application/UiA=
pp/UiApp/DEBUG/UiApp.dll<br style=3D"box-sizing:border-box">[ 6] /home/code=
/1-qemu-uefi/Build/ArmVirtQemu-AARCH64/DEBUG_GCC5/AARCH64/MdeModulePkg/Univ=
ersal/SetupBrowserDxe/SetupBrowserDxe/DEBUG/SetupBrowser.dll<br style=3D"bo=
x-sizing:border-box">[ 7] /home/code/1-qemu-uefi/Build/ArmVirtQemu-AARCH64/=
DEBUG_GCC5/AARCH64/MdeModulePkg/Application/UiApp/UiApp/DEBUG/UiApp.dll<br =
style=3D"box-sizing:border-box">[ 8] /home/code/1-qemu-uefi/Build/ArmVirtQe=
mu-AARCH64/DEBUG_GCC5/AARCH64/MdeModulePkg/Core/Dxe/DxeMain/DEBUG/DxeCore.d=
ll<br style=3D"box-sizing:border-box">[ 9] /home/code/1-qemu-uefi/Build/Arm=
VirtQemu-AARCH64/DEBUG_GCC5/AARCH64/MdeModulePkg/Universal/BdsDxe/BdsDxe/DE=
BUG/BdsDxe.dll<br style=3D"box-sizing:border-box">[ 10] /home/code/1-qemu-u=
efi/Build/ArmVirtQemu-AARCH64/DEBUG_GCC5/AARCH64/MdeModulePkg/Core/Dxe/DxeM=
ain/DEBUG/DxeCore.dll</p><p dir=3D"auto" style=3D"box-sizing:border-box;mar=
gin-top:0px;color:rgb(31,35,40);font-family:-apple-system,BlinkMacSystemFon=
t,&quot;Segoe UI&quot;,&quot;Noto Sans&quot;,Helvetica,Arial,sans-serif,&qu=
ot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;;font-size:14px">X0 0x=
0000000000000000 X1 0x00000000BE72C278 X2 0x000000004780FEB8 X3 0x000000000=
0000000<br style=3D"box-sizing:border-box">X4 0x0000000000000001 X5 0x00000=
00000000001 X6 0x0000000000000000 X7 0x0000000000000000<br style=3D"box-siz=
ing:border-box">X8 0x00600000BF16070F X9 0x00000000BF160000 X10 0x000000000=
0000003 X11 0x00000000BEF8EFFF<br style=3D"box-sizing:border-box">X12 0x000=
0000000000002 X13 0x0000000000000000 X14 0x6300000008000000 X15 0x000000000=
0000000<br style=3D"box-sizing:border-box">X16 0x00000000BF51D280 X17 0x000=
0000000687010 X18 0x0000000000000000 X19 0x00000000BE6DA1E0<br style=3D"box=
-sizing:border-box">X20 0x00000000BE81F198 X21 0x00000000BE4A3A88 X22 0x000=
0000050000000 X23 0x0000000000000001<br style=3D"box-sizing:border-box">X24=
 0x00000000BE73A000 X25 0x00000000BE7C3000 X26 0x00000000BE4BE8E8 X27 0x000=
0000000000002<br style=3D"box-sizing:border-box">X28 0x0000000000000000 FP =
0x000000004780FE50 LR 0x00000000BE673BE4</p><p dir=3D"auto" style=3D"box-si=
zing:border-box;margin-top:0px;color:rgb(31,35,40);font-family:-apple-syste=
m,BlinkMacSystemFont,&quot;Segoe UI&quot;,&quot;Noto Sans&quot;,Helvetica,A=
rial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;;fo=
nt-size:14px">V0 0x0000000000000000 0000000000000000 V1 0x0000000000000000 =
0000000000000000<br style=3D"box-sizing:border-box">V2 0x0000000000000000 0=
000000000000000 V3 0x0000000000000000 0000000000000000<br style=3D"box-sizi=
ng:border-box">V4 0x0000000000000000 0000000000000000 V5 0x0000000000000000=
 0000000000000000<br style=3D"box-sizing:border-box">V6 0x0000000000000000 =
0000000000000000 V7 0x0000000000000000 0000000000000000<br style=3D"box-siz=
ing:border-box">V8 0x0000000000000000 0000000000000000 V9 0x000000000000000=
0 0000000000000000<br style=3D"box-sizing:border-box">V10 0x000000000000000=
0 0000000000000000 V11 0x0000000000000000 0000000000000000<br style=3D"box-=
sizing:border-box">V12 0x0000000000000000 0000000000000000 V13 0x0000000000=
000000 0000000000000000<br style=3D"box-sizing:border-box">V14 0x0000000000=
000000 0000000000000000 V15 0x0000000000000000 0000000000000000<br style=3D=
"box-sizing:border-box">V16 0x0000000000000000 0000000000000000 V17 0x00000=
00000000000 0000000000000000<br style=3D"box-sizing:border-box">V18 0x00000=
00000000000 0000000000000000 V19 0x0000000000000000 0000000000000000<br sty=
le=3D"box-sizing:border-box">V20 0x0000000000000000 0000000000000000 V21 0x=
0000000000000000 0000000000000000<br style=3D"box-sizing:border-box">V22 0x=
0000000000000000 0000000000000000 V23 0x0000000000000000 0000000000000000<b=
r style=3D"box-sizing:border-box">V24 0x0000000000000000 0000000000000000 V=
25 0x0000000000000000 0000000000000000<br style=3D"box-sizing:border-box">V=
26 0x0000000000000000 0000000000000000 V27 0x0000000000000000 0000000000000=
000<br style=3D"box-sizing:border-box">V28 0x0000000000000000 0000000000000=
000 V29 0x0000000000000000 0000000000000000<br style=3D"box-sizing:border-b=
ox">V30 0x0000000000000000 0000000000000000 V31 0x0000000000000000 00000000=
00000000</p><p dir=3D"auto" style=3D"box-sizing:border-box;margin-top:0px;c=
olor:rgb(31,35,40);font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe=
 UI&quot;,&quot;Noto Sans&quot;,Helvetica,Arial,sans-serif,&quot;Apple Colo=
r Emoji&quot;,&quot;Segoe UI Emoji&quot;;font-size:14px">SP 0x000000004780F=
E50 ELR 0x0000000000000000 SPSR 0x60000AC5 FPSR 0x00000000<br style=3D"box-=
sizing:border-box">ESR 0x86000007 FAR 0x0000000000000000</p><p dir=3D"auto"=
 style=3D"box-sizing:border-box;margin-top:0px;color:rgb(31,35,40);font-fam=
ily:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,&quot;Noto Sans&q=
uot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe U=
I Emoji&quot;;font-size:14px">ESR : EC 0x21 IL 0x1 ISS 0x00000007</p><p dir=
=3D"auto" style=3D"box-sizing:border-box;margin-top:0px;color:rgb(31,35,40)=
;font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,&quot;No=
to Sans&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quo=
t;Segoe UI Emoji&quot;;font-size:14px">Instruction abort: Translation fault=
, third level</p><p dir=3D"auto" style=3D"box-sizing:border-box;margin-top:=
0px;color:rgb(31,35,40);font-family:-apple-system,BlinkMacSystemFont,&quot;=
Segoe UI&quot;,&quot;Noto Sans&quot;,Helvetica,Arial,sans-serif,&quot;Apple=
 Color Emoji&quot;,&quot;Segoe UI Emoji&quot;;font-size:14px">Stack dump:<b=
r style=3D"box-sizing:border-box">000004780FD50: 000000004780FE80 00000000F=
FFFFFD0 000000004780FEB0 000000004780FEB0<br style=3D"box-sizing:border-box=
">000004780FD70: 000000004780FE80 00000000FFFFFFD0 7469784565726F43 7672655=
3746F6F42<br style=3D"box-sizing:border-box">000004780FD90: 6E6520207365636=
9 7375746174532064 000A0D202E303A20 000000000000070D<br style=3D"box-sizing=
:border-box">000004780FDB0: 0000002700000001 00000000BF5229D6 0000000000030=
000 00000000478329F0<br style=3D"box-sizing:border-box">000004780FDD0: 0000=
00004780FE30 0000000047817B8C 0000000000000008 000000004783C000<br style=3D=
"box-sizing:border-box">000004780FDF0: 00000000BF160000 0000000000030000 00=
00000000000001 0000000000030000<br style=3D"box-sizing:border-box">00000478=
0FE10: 0000000000000008 00000000BF160000 0000000000010000 006000000000070C<=
br style=3D"box-sizing:border-box">000004780FE30: 000000004780FEB0 00000000=
4781C6AC 000000004780FE60 00000000BFE7042C</p><blockquote style=3D"box-sizi=
ng:border-box;margin-top:0px;margin-right:0px;margin-left:0px;padding:0px 1=
em;font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,&quot;=
Noto Sans&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&q=
uot;Segoe UI Emoji&quot;;font-size:14px"><p dir=3D"auto" style=3D"box-sizin=
g:border-box;margin-top:0px;margin-bottom:0px">000004780FE50: 000000004780F=
EE0 00000000BE48EAF4 0000000000000000 0000000030000000<br style=3D"box-sizi=
ng:border-box">000004780FE70: 00000000BE7C1018 0000000050000000 00000000BFF=
D0018 0000000001000000<br style=3D"box-sizing:border-box">000004780FE90: 00=
000000BE7C3000 00000000BE4BE8E8 0000000000000002 0000000000000000<br style=
=3D"box-sizing:border-box">000004780FEB0: 000000004780FF00 00000000BE492408=
 0000000000000000 0000000030000000<br style=3D"box-sizing:border-box">00000=
4780FED0: 00000000BE7C1018 0000000050000000 000000004780FEF0 00000000BE48ED=
08<br style=3D"box-sizing:border-box">000004780FEF0: 000000004780FF00 00000=
000BE492418 0000000047810010 000000004781844C<br style=3D"box-sizing:border=
-box">000004780FF10: 0000000000000000 00000000BE818798 00000000BE73A000 000=
0000000000001<br style=3D"box-sizing:border-box">000004780FF30: 00000000BE7=
2C248 00000000478102A8 00000000BE6DA000 0000000000000000<br style=3D"box-si=
zing:border-box">ASSERT [ArmCpuDxe] /home/code/1-qemu-uefi/edk2/ArmPkg/Libr=
ary/DefaultExceptionHandlerLib/AArch64/DefaultExceptionHandler.c(340): ((BO=
OLEAN)(0=3D=3D1))</p></blockquote></div>

--0000000000004c4691062d832d43--

