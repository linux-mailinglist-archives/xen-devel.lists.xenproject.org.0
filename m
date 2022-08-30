Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 488F65A5B39
	for <lists+xen-devel@lfdr.de>; Tue, 30 Aug 2022 07:44:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.394797.634344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSu1p-0001Sy-Qn; Tue, 30 Aug 2022 05:43:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 394797.634344; Tue, 30 Aug 2022 05:43:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSu1p-0001Qj-MZ; Tue, 30 Aug 2022 05:43:13 +0000
Received: by outflank-mailman (input) for mailman id 394797;
 Tue, 30 Aug 2022 05:43:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fKwo=ZC=gmail.com=asr7247@srs-se1.protection.inumbo.net>)
 id 1oSu1o-0001Qd-8O
 for xen-devel@lists.xenproject.org; Tue, 30 Aug 2022 05:43:12 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1d8ac63-2826-11ed-bd2e-47488cf2e6aa;
 Tue, 30 Aug 2022 07:43:11 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id b16so12737583edd.4
 for <xen-devel@lists.xenproject.org>; Mon, 29 Aug 2022 22:43:10 -0700 (PDT)
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
X-Inumbo-ID: a1d8ac63-2826-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc;
        bh=9VY24i33HtkAB+3wuweaTj38nQZAaFFG3cZlo+n+/W4=;
        b=gGE6vP90MLjd9R+rkBNg98No3rH/2C8LF6qOyUMrkjuFPk4rZeWygTksXNl73Fed/c
         PTEhP4Dx7brICsYs/llSmRIZMbgjfORQ6RG6okSOB1jDqm3WiqzfbjG2RoDx2nOTO9zS
         uklkEBCnDc3X2I/fspqPb7yFBDugNRIu/ydrNfYlaOxJGZT+PlrPaaoaVsxrKz10C7a9
         jHNfyLe8r3/qFoKz/WDK1JOzF7Th7NPT3cFTQiXoTZZJoVKthluYPUzPbH2h/Melmbxh
         ggLWkMou23YGOqEPi433ehJhxJn7YVHuUt3TnzbjYj6ItbCGy7NZDHIM1GgzGmwTuVwa
         P8Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc;
        bh=9VY24i33HtkAB+3wuweaTj38nQZAaFFG3cZlo+n+/W4=;
        b=bXytKN22xKz/WNn0+HLfRETRW5rQNuaA/NTqaV2wxq6jnB+MJ5MC50RrtUbgcWRQcL
         6JsURLSsVBVjQC3DxZWoMNdqnRHoGAmw4uMOOt5NOUfWPSJQ/vToLYyHpt1BLWJNRFg7
         CzTankzW6F3f264gDgf6uOkUCl/bKH+8Gw4lrtaGDQg9+WeVF9lu2y09FNHTNOmVXZ8o
         cwuSClXOfTQy2MsYzMvpIeWZXKU++yPJgp3IG1nH1KJK2E77YldvvdEMREEjMxEhaFfr
         YmQtseqN+AWQrv3GTlSpm/WlgShIWrXJU5oLhIj9/HbWht8J94JxM+adMcl9GhC4pirs
         wcDw==
X-Gm-Message-State: ACgBeo3o6ZmFw5DizsS93GfAuG9PHv5Jx5w4IYPwc3DaGZ2XoWC3Nly+
	+mfNY6pGP6/ukM20AbyP5y+lMDD/zefnarO8Px22QEraNy4=
X-Google-Smtp-Source: AA6agR6nULYXLtMcRrLEdH0oJcL92Ab8Hia8wmZQK2mZJkT9Ao/DOSBReghkpYOcZVMR0KfRrO37pSLp5OFU70cWx6s=
X-Received: by 2002:a05:6402:2790:b0:448:b1b1:8c7c with SMTP id
 b16-20020a056402279000b00448b1b18c7cmr2462654ede.70.1661838190049; Mon, 29
 Aug 2022 22:43:10 -0700 (PDT)
MIME-Version: 1.0
From: A Sudheer <asr7247@gmail.com>
Date: Tue, 30 Aug 2022 11:12:58 +0530
Message-ID: <CABg_PyLqrajOuKidSfuzXk8=pAraLfwEQX_mO2-Ofv5kNiWa8w@mail.gmail.com>
Subject: USB-C 250GB SSD Passthrough fails to DomU Ubuntu
To: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000fdfb4c05e76edabd"

--000000000000fdfb4c05e76edabd
Content-Type: text/plain; charset="UTF-8"

Hi All

On XEN-4.16 with Ubuntu 22.04 Dom0 and HVM-DomU, I tried to do a USB mass
storage device passthrough to DomU.
I followed the PVUSB method mentioned in
https://wiki.xenproject.org/wiki/Xen_USB_Passthrough.

I am able to do passthrough for USB 2.0 and 3.x version 32/64 GB mass
storage devices to DomU.
Passthrough failed for "SanDisk 250GB SSD USB-C, USB 3.1" with below error.
Able to access the SSD in Dom0.
Can someone help with what could be missing here.

*Commands used:*
host$ sudo xl usbctrl-attach vm1 version=3 ports=6
host$ sudo xl usbdev-attach vm1 hostbus=3 hostaddr=2

*Error Log in DomU*
VM1:~$ sudo dmesg
[  152.841566] usb 2-1: new SuperSpeed USB device number 2 using xhci_hcd
[  152.867164] usb 2-1: New USB device found, idVendor=0781,
idProduct=558c, bcdDevice=10.12
[  152.867173] usb 2-1: New USB device strings: Mfr=2, Product=3,
SerialNumber=1
[  152.867177] usb 2-1: Product: Extreme SSD
[  152.867179] usb 2-1: Manufacturer: SanDisk
[  152.867182] usb 2-1: SerialNumber: 31393430475A343030363932
[  152.899103] *usb 2-1: USB controller 0000:00:04.0 does not support
streams, which are required by the UAS driver.*
[  152.899110] usb 2-1: Please try an other USB controller if you wish to
use UAS.
[  152.899113] usb-storage 2-1:1.0: USB Mass Storage device detected
[  152.902033] scsi host2: usb-storage 2-1:1.0
[  152.902174] usbcore: registered new interface driver usb-storage
[  152.908928] usbcore: registered new interface driver uas
[  174.933399] usb 2-1: reset SuperSpeed USB device number 2 using xhci_hcd

Thanks
Sudheer

--000000000000fdfb4c05e76edabd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All<br><br>On XEN-4.16 with Ubuntu 22.04 Dom0 and HVM-D=
omU, I tried to do a USB mass storage device passthrough to DomU.<br>I foll=
owed the PVUSB method mentioned in <a href=3D"https://wiki.xenproject.org/w=
iki/Xen_USB_Passthrough" target=3D"_blank">https://wiki.xenproject.org/wiki=
/Xen_USB_Passthrough</a>.<br><br>I am able to do passthrough for USB 2.0 an=
d 3.x version 32/64 GB mass storage devices to DomU.=C2=A0<br>Passthrough f=
ailed for &quot;SanDisk 250GB SSD USB-C, USB 3.1&quot; with below error. Ab=
le to access the SSD in Dom0.<div>Can someone help with what could be missi=
ng here.<br><br><b>Commands=C2=A0used:</b></div><div><span style=3D"color:r=
gb(23,43,77);font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&qu=
ot;,Roboto,Oxygen,Ubuntu,&quot;Fira Sans&quot;,&quot;Droid Sans&quot;,&quot=
;Helvetica Neue&quot;,sans-serif;font-size:14px">host$ sudo xl usbctrl-atta=
ch vm1 version=3D3 ports=3D6</span></div><div><span style=3D"color:rgb(23,4=
3,77);font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,Rob=
oto,Oxygen,Ubuntu,&quot;Fira Sans&quot;,&quot;Droid Sans&quot;,&quot;Helvet=
ica Neue&quot;,sans-serif;font-size:14px">host$ sudo xl usbdev-attach vm1 h=
ostbus=3D3 hostaddr=3D2</span></div><div><font color=3D"#172b4d" face=3D"-a=
pple-system, BlinkMacSystemFont, Segoe UI, Roboto, Oxygen, Ubuntu, Fira San=
s, Droid Sans, Helvetica Neue, sans-serif"><span style=3D"font-size:14px"><=
br></span></font></div><div><font color=3D"#172b4d" face=3D"-apple-system, =
BlinkMacSystemFont, Segoe UI, Roboto, Oxygen, Ubuntu, Fira Sans, Droid Sans=
, Helvetica Neue, sans-serif"><span style=3D"font-size:14px"><b>Error Log i=
n DomU</b></span></font></div><div>VM1:~$ sudo dmesg<br>[ =C2=A0152.841566]=
 usb 2-1: new SuperSpeed USB device number 2 using xhci_hcd<br>[ =C2=A0152.=
867164] usb 2-1: New USB device found, idVendor=3D0781, idProduct=3D558c, b=
cdDevice=3D10.12<br>[ =C2=A0152.867173] usb 2-1: New USB device strings: Mf=
r=3D2, Product=3D3, SerialNumber=3D1<br>[ =C2=A0152.867177] usb 2-1: Produc=
t: Extreme SSD<br>[ =C2=A0152.867179] usb 2-1: Manufacturer: SanDisk<br>[ =
=C2=A0152.867182] usb 2-1: SerialNumber: 31393430475A343030363932<br>[ =C2=
=A0152.899103] <b>usb 2-1: USB controller 0000:00:04.0 does not support str=
eams, which are required by the UAS driver.</b><br>[ =C2=A0152.899110] usb =
2-1: Please try an other USB controller if you wish to use UAS.<br>[ =C2=A0=
152.899113] usb-storage 2-1:1.0: USB Mass Storage device detected<br>[ =C2=
=A0152.902033] scsi host2: usb-storage 2-1:1.0<br>[ =C2=A0152.902174] usbco=
re: registered new interface driver usb-storage<div>[ =C2=A0152.908928] usb=
core: registered new interface driver uas<br></div><div>[ =C2=A0174.933399]=
 usb 2-1: reset SuperSpeed USB device number 2 using xhci_hcd<br></div><div=
><br></div><div>Thanks</div><div>Sudheer</div></div></div>

--000000000000fdfb4c05e76edabd--

