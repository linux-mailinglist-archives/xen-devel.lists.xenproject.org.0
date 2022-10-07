Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8D15F77CC
	for <lists+xen-devel@lfdr.de>; Fri,  7 Oct 2022 14:03:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.417903.662661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogm3n-000447-C8; Fri, 07 Oct 2022 12:02:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 417903.662661; Fri, 07 Oct 2022 12:02:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogm3n-00040r-8q; Fri, 07 Oct 2022 12:02:35 +0000
Received: by outflank-mailman (input) for mailman id 417903;
 Fri, 07 Oct 2022 12:02:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4A9H=2I=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1ogm3l-0003ad-Ad
 for xen-devel@lists.xenproject.org; Fri, 07 Oct 2022 12:02:33 +0000
Received: from sonic313-19.consmr.mail.gq1.yahoo.com
 (sonic313-19.consmr.mail.gq1.yahoo.com [98.137.65.82])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e9db2266-4637-11ed-964a-05401a9f4f97;
 Fri, 07 Oct 2022 14:02:29 +0200 (CEST)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic313.consmr.mail.gq1.yahoo.com with HTTP; Fri, 7 Oct 2022 12:02:27 +0000
Received: by hermes--production-bf1-5fb9f4c8b8-vstzd (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 1814f366ff002f5ae1c77cd5f5a8908b; 
 Fri, 07 Oct 2022 12:02:23 +0000 (UTC)
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
X-Inumbo-ID: e9db2266-4637-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048; t=1665144147; bh=BaQVWS/lf5ppT0XBzHXr8peU0CSPHk6KcpftB9KDuco=; h=Date:Subject:To:References:From:Cc:In-Reply-To:From:Subject:Reply-To; b=e45Znb/baVsQOpVKGHVSSURztZzzvPevdDJ+KBsBf88pF0bxP+GqWBJ0FsjamLcKIoFXZE/YDJNtBLa9s4crBIBn/9rCwHeC05zN6N7uC61vrq/HyeWkckENtiYj0Kfx8PMFSkvTqm6RmPNboZ6MFjQswVZ2XDyQj/itOwqI9wESBKneHKjQwTJkdgGObFj87EhuyBdo9G6Lv3tL0nIsYYWx6xvzBx0blk+Xkka8Hrb/rXukq67s3baWu/RkyXYjBHSg12ohRjOk1cfKZvjZVqoA6nfLFTp0vdgu+TzM7tqPatPjoM4SfTYoD2kuIEocUTGSnVlc1j9H0fLioWSjSg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1665144147; bh=8CNL3oWyvkWpK+R9IcJC829+0YKX9dUViPD/v0Rn/H5=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=R1ykvspUvOtsWzxvOSA7mHpo3Aj+vmFAFXqkGkURyw3vHW9hSuPm+U5AYOcFaTfQp2v2s/4UQOF7w5swkeLliZE1LElcexq2nYRM/19fw29O/ChRu46RhOsOBJFIn7dhF/K2ONo733au7f2DsZVnqz1vgMJY7jDlIcQvv7uJBnjM4bU/S/ZSQh+kYA5JhxzQnCky5wkcK5AsrayMAXVJLMVCPMi7yI15rSBgY7m8kamCJhI/Fp+QYkoh1rjWTxJ7xIbnFahh3/jaKViOy06DaYKtm+baaSgHX03W1GtOdqwQ/6SuonOxyzxCb9rA4jVpty6Lh6J5B1ZCMQ0xwyTv4g==
X-YMail-OSG: mvrcGyAVM1kZ8qTLfHRikMX2W5jKMI4Lkq3HvkH.btG2yVVHHsd4b9nCmJYX7FD
 4byaWFIenBeIDFLoN4S6D5pj2h46rhDYok8066pAZaZroqS.Z56F4rMFUN0BDTLgCpiy3D_iHEhL
 RTVy9AibH7A0jXdDKwNtcj4PkJ4hDcFTBoviulGd4GrEuORP6Qs1R7ChuNHmHYA2HEf4zi0FdGbb
 TQDr41onVw8Ogr5xjBo2RbmSVDUvn4f3SA9tb5vgRjz1dGdzR2OfkOpE7vvuFAd.gSLmPxe7RukZ
 4ag6Aiv68M6BHYJMNVqTvlfbFft1v4V3QoCoAE7U0Ml4gCu6T2mMpo1UFH_lTWZ3g4MNx6Pwmhnv
 DOPHbf4.geOibdt_W6Q49p3z6dFbhaI9vJ5XhBzSS_vV14zzFvSnmKsXquLjzsyWSgHgfTOIV20M
 8RvSWKWlsLAYc1hGUAnljmzPb5guWkC_yeQT_DrHoIUvlN5bKoUwN9bE7ADjV0nozh1latr9H72U
 nEmUZ2DZ3oE_3M4XRvaB_ro.Aoo6fLEoehQo738hz_7ptpUo80kOr0em3PSJaQfNYgcE4cKRBqaY
 LA0VG_wJbWXKOkg.nzyVW5crAjq8a4dpO3TKXHMoo5K9V11s0jrdTunqc.s6a1t0x2PTbsWl7Y0f
 sIta9W.rQtKav1begHGF6v88wGkwUXz7DsiM7di2XdJn7YetI.5lmKQwXBdKxspGGw3GaOKvE_QT
 FStbRqmGoIzBMfyFpb.nv1yI_Hsz_B2VqBBIsRv_LjXQWXREHMS9GwnRxs9lpyf2K4sWi1RzgVrd
 Q3JajU08IgBJ5gN73ILttjoaTahOH1Tacc9bRKfgKllH9kGpUaWMaAorHZ.cpPfJZSgDm50mJGn5
 D7ajnNH41CPuCF.Btzh_7FwJHrnJoNvz.R2ifnJHJPDnqLVNNvUB23qlpLNudQCXtcqIkYo1MDeX
 xJ3AidUD5M5dcy9gQs.AgO7tpRbMJaEB7knlCgq87HFvFBbsmHpYxXcNubHomd1QrAcSTEgtnfTs
 KB84dlaMgTfPaYzRwlzOeyqf4dghpPVX5MxOq95InU4WOqdVNVanuOIO2mZsnET0y_aCDQLyb1ot
 oBJ_MjHTc4JeFM.nQNVpmA2I_HHiRgdVhn3vg087Q_58PhTmtes.zkM28ogcrqBz6DOlY12NBsJ2
 qb1uqHrOJ0TVW6.1VwmQDFvOctgBLXKiimA_wt.GTlP5.iZ1jJyYFVeINgoM_uaMMpavH.89uuMS
 _rfWlt3keszvZxOL3p8g4zRAI68k9TiMdIMqxEPWthA10D11uZGLKsbzdCQvw0XTzki7tHg0PKol
 xsMsfwnQCLLEwE8ZBw1iwG6rOXr1YuYnQAc0qI8FhYw9MvOmUTbOYGJYcaLaB8xIlRKhZ.M3yhsV
 k.zrSmIVsOA1XsSK216htiyl2QRhfkr_.qEBd5nPlvYA41epOADdNU8.bSxiuIdTmKMw8SHCbTAw
 Oy6TwI.g34tqLZU6jb_YatdBhC5urK1RbeH4Sxc8Hn3FEP2zfMfvz7Kv_G5WF45qTXGPF82aUWCu
 OVlEPDauW4PX1D4Zv8vTo79q.U4NhgAveIF29BOoDQDr3UWn0SLHmv6wrL2ViTTefmQCF5mq.z81
 gbcJRxC7RzfhYmtEMcHblY8M9tMGlBIfs7UaLW8Z7C5EwKmDtxvZey_P8voicCgytZBcBr6T0KU5
 ASnX_NAInVHtjzcn0Jb1.fxGEZd4bs352i3m3MWS.ekUzBLdp.E3WwrvoKQzyOIh0lbzYhA1FHx.
 .oGn2zohQQIifvsBbCTcTcNUTc15S5BKBRFL9t4Gqbj5_3VfwldlvyItm8bHUAaAdbgotMEXwmYs
 5KtX1y4pSWprekGnZNZtUWGDCm1pfJMvfXVWZ.CLScJtqAWfm.UZEsHVXCo3BE3NiDbRWCevYR7_
 ooWE4ajapGtgnrMdo8qi8qrBddsPVoPEjlQW_cuV0tbKHCk8fQtNKWBxT.QSHgtRfsCbBH112BOz
 Qkz3264f4ZiZQLh9U6_R59c28iI0FMehVsmLsEGuTe3egC3oK6MTOMyXBQbkdLzIEQLTOvqwxCz1
 eT7rD_28lM1nZigaVG7qtzxnCmLuqqGNfuZLt9f4cHqzUNq4fbYoLgjHnn8FjxSUDOXMQgJK7gcc
 Nlmquo058u5R7jp3TfVazUeW5AIklP7Rc4XxFRIsStomqioafsgKEUew1W4Pgqm5tfrn4MY8GLmD
 sH53g
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <9639a6cb-8e9b-6c67-4ed7-7df2e84d6f25@netscape.net>
Date: Fri, 7 Oct 2022 08:02:21 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: xen ovmf/uefi firmware does not save screen resolution
Content-Language: en-US
To: xen-users@lists.xenproject.org
References: <mailman.3.1663934401.4493.xen-users@lists.xenproject.org>
 <423215ee-fac0-06c5-1156-3c74e98cff12@liberaliatempus.com>
From: Chuck Zmudzinski <brchuckz@netscape.net>
Cc: xen-devel <xen-devel@lists.xenproject.org>
In-Reply-To: <423215ee-fac0-06c5-1156-3c74e98cff12@liberaliatempus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.20702 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 10/6/2022 9:38 AM, Liberalia Tempus, S.L. wrote:
> Thank you very much for your answers.
>
> Finally, after trying some of the solutions proposed by Chuck, I have 
> made the decision to delete the UEFI partition and move it to a normal 
> MBR system.

Did you know you can keep the GPT partitions and the EFI partition and boot HVM guests
using MBR (seabios) with a GPT BIOS Boot partition present in the guest's virtual boot disk?
I implemented that by stealing the last 1 MB of the EFI GPT partition and assigned that 1 MB
to be a BIOS boot GPT partition, and grub2 is smart enough to install its own MBR bootcode
into that partition and it works fine in Xen HVMs by using seabios instead of ovmf as the
firmware/bios for the guest in the xl.cfg guest configuration file. But that's not necessary if
you are going to give up on using the EFI partition and GPT partitions and go back to the
legacy MBR partitioning scheme. What you are doing is a sensible option also given Xen's
current lack of support for UEFI booting of Xen HVM guests that actually works.

> I think it's too cumbersome all this xen and UEFI booting stuff and 
> there's no point in spending more time on it. At the end of the day what 
> matters in a virtual environment is that the machine works, regardless 
> of the system used to boot.
> As of today, UEFI booting does not work properly in xen/qemu, at least 
> not for people who are not experts in xen code.
> Best regards.
>
> PS: Chuck, what you say about version 4.14 I have not been able to apply 
> in a vm with windows 10. It seems to work with a hvm vm with linux, but 
> not with a windows vm.

That may be true, because I have only tried UEFI booting of a Linux HVM guest. I have always
used MBR booting of Windows HVM guests with either the stdvga Qemu emulated graphics
device as the Windows HVM guest's primary graphics device or VGA passthrough of the Intel
IGD graphics device to the HVM Windows guest as the guest's primary graphics device.

I will in the meantime try to get UEFI booting working for both Windows and Linux HVM guests
for the future and at the same time use the BIOS boot GPT partition hack to give me the option to
use MBR booting with seabios instead of ovmf as the firmware/bios for the HVM guest until
Xen works well enough with UEFI booting of HVM guests. Obviously the MBR technology is legacy
tech and Xen needs to eventually be updated to support the UEFI booting method of HVM guests
going forward. I am not aware of much work in this area being done by the Xen developers, but
I am not subscribed to xen-devel so I could be wrong about that and I would welcome any
Xen developer who could explain to Xen users what work is being done to support UEFI booting
of Xen HVM guests in the future.

Best regards,

Chuck

>
> -------------------------
> MhBeyle __
> > Date: Thu, 22 Sep 2022 11:25:41 -0400
> > From: Chuck Zmudzinski <brchuckz@netscape.net>
> >
> >
> > On 9/22/2022 4:37 AM, mhbeyle@yahoo.es wrote:
> >> Thanks for the answers.
> >>
> >> Chuck, I tried at the time to apply suggested patches to the software
> >> with no results. It is not clear that any of the current patches solve
> >> the problem.
> >>
> >> I think there are two problems here: One, the virtual machine that
> >> creates xen uses QEMU and the UEFI bios is not able to communicate the
> >> resolution data to the system. Two, this kind of problem would be easily
> >> solved by virtualizing a more modern vga instead of the current cards
> >> (cirrus etc.)
> > Actually, this might be a bug in Xen 4.16 that was not in Xen 4.14.
> >
> > On Debian 11 (bullseye/stable for Dom0) booting HVM with Tiano Core
> > UEFI works for me using vga = stdvga and videoram = 16:
> >
> > With Debian 11.x stable for dom0, the Xen version is 4.14 and the Qemu
> > version is a bit old, 5.2, but booting with ovmf/uefi works:
> >
> > I boot Debian 11.x (stable) in a Xen HVM using ovmf using vga = stdvga in the
> > xl.cfg and it seems to work in a VNC window. I can get 1920x1080 resolution
> > (with videoram = 16 in the xl.cfg), but this only works on Debian stable dom0
> > with Xen version 4.14.x and Qemu version 5.1 (haven't checked if Debian
> > backported Qemu version 7.0 for Debian 11 also works).
> >
> > After login, use the gnome display settings and it gives the option of up
> > to 1920x1080 resolution with videoram = 16. I presume KDE, XFCE, MATE, etc.
> > also would allow this.
> >
> > It is true the Tiano Core UEFI boot configuration setup screen and the grub
> > screen resolution is low (I think only 800x600) at the beginning of booting.
> >
> > Here is my xl config for ovmf (UEFI booting with vga = stdvga, videoram = 16)
> > and a VNC display and Debian stable with Xen 4.14.x dom0 and Qemu 5.2 in
> > dom0 on Debian stable:
> >
> > --- domain configuration file ---
> > builder = 'hvm'
> > bios = 'ovmf'
> > memory = '6144'
> > vcpus = '4'
> > disk = ['/dev/linux/bullseye,,xvda,w']
> > name = 'bullseye-hvm'
> > vif = [ 'mac=<redacted>,type=vif,script=vif-route,ip=<redacted>' ]
> > on_poweroff = 'destroy'
> > on_reboot = 'restart'
> > on_crash = 'restart'
> > boot = 'c'
> > acpi = '1'
> > apic = '1'
> > viridian = '1'
> > xen_platform_pci = '1'
> > serial = 'pty'
> > vga = 'stdvga'
> > videoram = '16'
> > sdl = '0'
> > vnc = '1'
> > vnclisten = '0.0.0.0'
> > vncdisplay = '1'
> > usb = '1'
> > usbdevice = 'tablet'
> > --- End of domain configuration file ---
> >
> > But the same configuration with Xen 4.16 and Qemu 7.1 in dom0 that is in Debian
> > unstable, and also in Fedora 36 with Xen 4.16 and Qemu 6.2 I think, I get a crash at
> > boot - it does show the Tiano Core configuration screen and grub screen at 800x600
> > resolution but crashes soon after. When trying to boot Fedora 36 in a Xen HVM with
> > ovmf, I got this in the journal of the guest:
> >
> > xen-qemu-system-i386: relocate_memory 4096 pages from GFN bf000 to GFN c1000 failed: Invalid argument
> >
> > Also, with a good boot (using seabios) I get this in the journal of the guest,
> > but is missing from the boot that crashes:
> >
> > fedora kernel: BIOS-e820: [mem 0x00000000fc000000-0x00000000fcffffff] reserved
> >
> > The size of this missing entry is 4096 pages, which is probably what Qemu is trying to
> > relocate but cannot with ovmf/uefi boot because it is missing. 4096 pages is 16 MB,
> > which is probably the video shared memory.
> >
> > This is probably a bug/regression in Xen somewhere between Xen 4.14 and 4.16
> > and I will try to bisect it when I have time.
> >
> > Best regards,
> >
> > Chuck
> >
> >> that are not recognized by the operating system when using
> >> UEFI and do not load specific drivers. For example, the problem is
> >> solved using qxl and a driver in Windows, but the qxl development is not
> >> complete and fails.
> >>
> >> With limitations, it seems that the problem in QEMU is solved by
> >> changing the parameters in the BIOS and doing a warm/soft reboot. I
> >> don't know why, this can't be done in xen. The settings are never saved
> >> and the reboot, at least in windows 10, is always a cold one (xen
> >> destroys the virtual machine and recreates it. The soft reboot parameter
> >> hangs the vm).
> >>
> >> Regards.
> >>
> >> __________
> >> MhBeyle ___
> >>
> >>
> >>
> >
>
>


