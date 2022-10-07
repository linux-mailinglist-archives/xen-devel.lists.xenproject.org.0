Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D365F7966
	for <lists+xen-devel@lfdr.de>; Fri,  7 Oct 2022 16:03:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.418034.662812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ognwx-0007Oz-AQ; Fri, 07 Oct 2022 14:03:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 418034.662812; Fri, 07 Oct 2022 14:03:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ognwx-0007MZ-7Z; Fri, 07 Oct 2022 14:03:39 +0000
Received: by outflank-mailman (input) for mailman id 418034;
 Fri, 07 Oct 2022 14:03:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4A9H=2I=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1ognwv-0007MT-PE
 for xen-devel@lists.xenproject.org; Fri, 07 Oct 2022 14:03:38 +0000
Received: from sonic316-54.consmr.mail.gq1.yahoo.com
 (sonic316-54.consmr.mail.gq1.yahoo.com [98.137.69.30])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d4d2d36e-4648-11ed-9377-c1cf23e5d27e;
 Fri, 07 Oct 2022 16:03:35 +0200 (CEST)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic316.consmr.mail.gq1.yahoo.com with HTTP; Fri, 7 Oct 2022 14:03:33 +0000
Received: by hermes--production-ne1-6944b4579f-8xbfz (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 6c531180527f65d2a4b3d734797c933b; 
 Fri, 07 Oct 2022 14:03:27 +0000 (UTC)
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
X-Inumbo-ID: d4d2d36e-4648-11ed-9377-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048; t=1665151413; bh=T9kVCstbl5ELaapgtMaHCSmWDUTJT+1+RInIVz8Z/Vw=; h=Date:Subject:From:To:Cc:References:In-Reply-To:From:Subject:Reply-To; b=ptbu+gpXbie762iHNGuc2mCBhF/ILqbAXeoRC/ZbxM9FBPBox38UbjNkmhU0TnCp3hgbL0F/AdRvh6XrxMFODqOXQPcvwn1yGpI75pFd6IK+8tdaYt6EXn+q+AZ1A084NF9SEkfU8xyV3u8RD0NWoybSnCNOZNLwXT6NTKZrcjunU5srRme0fZ4VOq7zL72byL38ryrkLSOQ7zHurs3PEz5FJzU5KRfgVWiWlw/1CqamfoVe49E86jYoCNaqG7ZOJAwRD3SyeRwq13BqFvu3N/OFRFl/rh5Dw3xUrmViH8OKVW4+sMgGflmBpa1nIzLt8zZ2THn1iDwCJiXSL6Z8Aw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1665151413; bh=fpHJhdJ2Jl0cn4d/t/rIO0lfB4X0ZVQsFaOkMTozNIm=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=M1UMMrHacvoO/XmmX4k0TMvZBpcXCfb2aDLTHVmoJ9KHGCLZb0UFjIpDODRRVxCZ4zkCcD0m6WMZIAVexRw0A6ev+wqNrohkutGwiC7nZ3WktlbYnKol1LwqLiTWd1Pj8gF61UYXwEslTXxCRxcPGq4FCCh06sT8CGCMhvH0ciWh5fuyDR9VBUhZVmLPeLMq4UDR4Cy15INf58YdioKMI9L619FpQJUDwbvsDn4sQHLZmEtMufnG1jaXTOdBJxFKRzDHZONSiwr+huRCadpXpSNS8P57vWSJIVnhhdNHGOB6CV+OjjJjamOlZFxaQ89BJ5zcmKm8CE/p7AJbm6gIWg==
X-YMail-OSG: 562pW9sVM1mBDkIbeVFt7wj0_DvsTm0Iiv8pBLZjH6eKtDhgu9XP7.d6STN3KO5
 sAcPOpQNsXmUYCkMzgwvfkqH3U8otpwVgDdeUjWYsxe403zv9iNuTuk1IzvdVg_GkSGh0FZxVQyR
 mrKB.j2iFdmbEj.j7BMbLL27ayIxK0pAkYTHEW4IM4p2HrYhVVJ1OPpz4GxQ5JX9HpTsKAq1iocP
 kxKuELWj7EQz3BY4XiNPnjnrX87W.Dguool3qrjYzglEvskx3pxUt94J4ck7o_gsUEH32IRUPGIK
 Lu_TPBMAelfebUpdSECZBsSmiprsLQXBmFLQmSEGi.CaqpaaTVQu2.gMBe5giv_qoTeiPXy2W.5D
 cRePK6mlBrRp3sFBRn6R30rEruve0Zy_x5zWGNuP9BVibKa8N47EalbVJ2o93655b.db8qTl528i
 _AkI4tTNspv5V8N2o_zZ14pf03JlarADtHdgNrn.fccCPKvm1Zp.wfAhP7RD8wvKWRZcHrP89N8M
 z1QE78_NjNvBYwaSMP3uDCGdzCbZWnWf8mQ5QR773fzOKs2S7Aqg33qtR29pGbSSQiTgNSsuEeDa
 Vq0CNq5cc5.nKPhG.y7ckhTiZFqy4uLIqiXhhyt1.njhuFj.LG_Xpy288XGW9t8SgbEWCMpKjECC
 4ke_LKVmExJvLm8ejJp7p3Qdh4_VDYG7T3GtHd7IDxyxl8UgPFkMesJdVn4K2wIZeVHvo.9yLZi5
 GkMKYY8n_KE5zqsqVb3_dl3qY7tXivp60B8mQJSfde_UE93fGf96EULKzwsHg3uDuvYsjFELAift
 JlixFV70ZndO4uG4DZJGi8ozFCFgo7SyVcImYn9AgDbxb7rVVCG_RhKg.CurKu9cGXdlwrnxLKPd
 Bjq3IqEQRHSdBjnLyUGUNjh2ejlMXNshf_5QWdJDoh.FL4bdTXFWcVUoLs4zPpJ1eTRYoocWqsto
 _Hrvh1.HzriKDLfA7o0TrXU0aWhqk3Fad.8Fv7Zc4y.cVvtJUD4dLkr637MPk8Ni63AkPIpatyp_
 oXJw3JFdgkS0tHynjfIouekaugqwA2KX8e5bcbH1SrSAQpRwWPMKMjmFW9N4cQQsbasTxtKQpKrv
 fOXpzE6AxCKwVsRy84AvF7.DZlC0WekD2ihFn70nWLS87kqA.McwSB24GYQb6hS4uXkJpeQjX_wx
 UqygF48jYuNcPrpnQll2ue6CEnUTrFIry9f20sWL_cRFa9ITQU.Sb_y6Njx5XfyH.Vy10PiBl3_6
 pOAM24ux_0IHMq9LJOWN.chBzBEywXNc2anIGGJhHa2mfu.PDOLvMlCKaT8iJweIPnz2JaAbpTPe
 R0aHwJuK6MepWpQFh7qWQIOBouW5JQ7iO.PIK7YRJOQ03QYF8gO3mffNuZdqhHIn4UBZA9YTHchs
 Qw1EQp_g2822zNdzgBFO9T._I0H1vYuQGZfHQrdYWqX9xsePdR1tm4aUyasNfhAA3qsMN.dJ297n
 nwQRpISQmCGI2FP1jbx.U2hBq9N4dA9_EYCr9xCp85pXcOuonC5lhrc3oTORDmsiXRQ3Hz8x_6dx
 rdC_aY2RCHtVhnRW82HDHJqEesTrPqBEa8fCtGPWeeIRuEETvJunC7hNmr5hfCMANcMp3EiAxMi2
 2GTFeqB6RirPZICebIMWc_Ei41m44VS6GZnmqPmYim0YHg9Yesbs8aDfGoCVP_hmRLEjcJcvt8zy
 _VWrYXhipjMGaUdqk224aoPx_mx3y01.ZMLamwgmzVW97tRpFql5NI5oJ5qb76_s4PT.goHygm9B
 3gyHIK22ccqwyJ_oMPNv.P9INvPX51b5oG9AJJRsQ9juh_TaQcx51p9nI5J1dbP_fUqTIpkMS4x3
 pQoxyPAr7jgIboZ.Si4wVaPOZdkDDANgOXcorwoMlBRq.kgm_HAiOAbt6gpWKaXd.46L657fjvso
 6beWS8Xvz.ntt5Oh7ffPtPoXBWDRdNBoM9rwwXoyrDqf_hNZi_BRaQBtwXNfkQDr0ESkeGu9P74H
 z7PC2rjl7pZ1Fg1V4k0EO9Bt63HDH1pxo0h.bc1UgBDjGGQV2s06y2TUS5JDHIDgja1SIvMih9aS
 Jv3L92gYrEZcx06.yQLAxrmXYehlbBdU6iDSArtJpS1mb95m8PpS42q3dZZ7q0XNfuc772.qq0OB
 pieEuj2d2iL70A1Wyi6qyeHMidItAcMcOSQsmP9Tyw46xRYLia507yFbckbWj9iqqnRvH_A9hNZi
 nYR9EvGfB01tY
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <93c05893-6058-4e5e-9d5a-d127ceb52f2e@netscape.net>
Date: Fri, 7 Oct 2022 10:03:26 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Support for UEFI guest booting on Xen x86 (Was: Re: xen ovmf/uefi
 firmware does not save screen resolution)
From: Chuck Zmudzinski <brchuckz@netscape.net>
To: xen-users@lists.xenproject.org
Cc: xen-devel <xen-devel@lists.xenproject.org>
References: <mailman.3.1663934401.4493.xen-users@lists.xenproject.org>
 <423215ee-fac0-06c5-1156-3c74e98cff12@liberaliatempus.com>
 <9639a6cb-8e9b-6c67-4ed7-7df2e84d6f25@netscape.net>
Content-Language: en-US
In-Reply-To: <9639a6cb-8e9b-6c67-4ed7-7df2e84d6f25@netscape.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.20702 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 10/7/2022 8:02 AM, Chuck Zmudzinski wrote:
> On 10/6/2022 9:38 AM, Liberalia Tempus, S.L. wrote:
> > Thank you very much for your answers.
> >
> > Finally, after trying some of the solutions proposed by Chuck, I have 
> > made the decision to delete the UEFI partition and move it to a normal 
> > MBR system.
>
> Did you know you can keep the GPT partitions and the EFI partition and boot HVM guests
> using MBR (seabios) with a GPT BIOS Boot partition present in the guest's virtual boot disk?
> I implemented that by stealing the last 1 MB of the EFI GPT partition and assigned that 1 MB
> to be a BIOS boot GPT partition, and grub2 is smart enough to install its own MBR bootcode
> into that partition and it works fine in Xen HVMs by using seabios instead of ovmf as the
> firmware/bios for the guest in the xl.cfg guest configuration file. But that's not necessary if
> you are going to give up on using the EFI partition and GPT partitions and go back to the
> legacy MBR partitioning scheme. What you are doing is a sensible option also given Xen's
> current lack of support for UEFI booting of Xen HVM guests that actually works.
>
> > I think it's too cumbersome all this xen and UEFI booting stuff and 
> > there's no point in spending more time on it. At the end of the day what 
> > matters in a virtual environment is that the machine works, regardless 
> > of the system used to boot.
> > As of today, UEFI booting does not work properly in xen/qemu, at least 
> > not for people who are not experts in xen code.
> > Best regards.
> >
> > PS: Chuck, what you say about version 4.14 I have not been able to apply 
> > in a vm with windows 10. It seems to work with a hvm vm with linux, but 
> > not with a windows vm.
>
> That may be true, because I have only tried UEFI booting of a Linux HVM guest. I have always
> used MBR booting of Windows HVM guests with either the stdvga Qemu emulated graphics
> device as the Windows HVM guest's primary graphics device or VGA passthrough of the Intel
> IGD graphics device to the HVM Windows guest as the guest's primary graphics device.
>
> I will in the meantime try to get UEFI booting working for both Windows and Linux HVM guests
> for the future and at the same time use the BIOS boot GPT partition hack to give me the option to
> use MBR booting with seabios instead of ovmf as the firmware/bios for the HVM guest until
> Xen works well enough with UEFI booting of HVM guests. Obviously the MBR technology is legacy
> tech and Xen needs to eventually be updated to support the UEFI booting method of HVM guests
> going forward. I am not aware of much work in this area being done by the Xen developers, but
> I am not subscribed to xen-devel so I could be wrong about that and I would welcome any
> Xen developer who could explain to Xen users what work is being done to support UEFI booting
> of Xen HVM guests in the future.

Specifically, what is Xen's current strategy for supporting UEFI booting of guests (Windows, Linux, etc.)
on the x86 Xen hypervisor?

For example, is using HVM guests with the upstream Qemu device model considered legacy tech and
the work to develop support for UEFI booting in the future should be done using PVH guests instead
of HVM guests?

Kind regards,

Chuck

>
> Best regards,
>
> Chuck
>
> >
> > -------------------------
> > MhBeyle __
> > > Date: Thu, 22 Sep 2022 11:25:41 -0400
> > > From: Chuck Zmudzinski <brchuckz@netscape.net>
> > >
> > >
> > > On 9/22/2022 4:37 AM, mhbeyle@yahoo.es wrote:
> > >> Thanks for the answers.
> > >>
> > >> Chuck, I tried at the time to apply suggested patches to the software
> > >> with no results. It is not clear that any of the current patches solve
> > >> the problem.
> > >>
> > >> I think there are two problems here: One, the virtual machine that
> > >> creates xen uses QEMU and the UEFI bios is not able to communicate the
> > >> resolution data to the system. Two, this kind of problem would be easily
> > >> solved by virtualizing a more modern vga instead of the current cards
> > >> (cirrus etc.)
> > > Actually, this might be a bug in Xen 4.16 that was not in Xen 4.14.
> > >
> > > On Debian 11 (bullseye/stable for Dom0) booting HVM with Tiano Core
> > > UEFI works for me using vga = stdvga and videoram = 16:
> > >
> > > With Debian 11.x stable for dom0, the Xen version is 4.14 and the Qemu
> > > version is a bit old, 5.2, but booting with ovmf/uefi works:
> > >
> > > I boot Debian 11.x (stable) in a Xen HVM using ovmf using vga = stdvga in the
> > > xl.cfg and it seems to work in a VNC window. I can get 1920x1080 resolution
> > > (with videoram = 16 in the xl.cfg), but this only works on Debian stable dom0
> > > with Xen version 4.14.x and Qemu version 5.1 (haven't checked if Debian
> > > backported Qemu version 7.0 for Debian 11 also works).
> > >
> > > After login, use the gnome display settings and it gives the option of up
> > > to 1920x1080 resolution with videoram = 16. I presume KDE, XFCE, MATE, etc.
> > > also would allow this.
> > >
> > > It is true the Tiano Core UEFI boot configuration setup screen and the grub
> > > screen resolution is low (I think only 800x600) at the beginning of booting.
> > >
> > > Here is my xl config for ovmf (UEFI booting with vga = stdvga, videoram = 16)
> > > and a VNC display and Debian stable with Xen 4.14.x dom0 and Qemu 5.2 in
> > > dom0 on Debian stable:
> > >
> > > --- domain configuration file ---
> > > builder = 'hvm'
> > > bios = 'ovmf'
> > > memory = '6144'
> > > vcpus = '4'
> > > disk = ['/dev/linux/bullseye,,xvda,w']
> > > name = 'bullseye-hvm'
> > > vif = [ 'mac=<redacted>,type=vif,script=vif-route,ip=<redacted>' ]
> > > on_poweroff = 'destroy'
> > > on_reboot = 'restart'
> > > on_crash = 'restart'
> > > boot = 'c'
> > > acpi = '1'
> > > apic = '1'
> > > viridian = '1'
> > > xen_platform_pci = '1'
> > > serial = 'pty'
> > > vga = 'stdvga'
> > > videoram = '16'
> > > sdl = '0'
> > > vnc = '1'
> > > vnclisten = '0.0.0.0'
> > > vncdisplay = '1'
> > > usb = '1'
> > > usbdevice = 'tablet'
> > > --- End of domain configuration file ---
> > >
> > > But the same configuration with Xen 4.16 and Qemu 7.1 in dom0 that is in Debian
> > > unstable, and also in Fedora 36 with Xen 4.16 and Qemu 6.2 I think, I get a crash at
> > > boot - it does show the Tiano Core configuration screen and grub screen at 800x600
> > > resolution but crashes soon after. When trying to boot Fedora 36 in a Xen HVM with
> > > ovmf, I got this in the journal of the guest:
> > >
> > > xen-qemu-system-i386: relocate_memory 4096 pages from GFN bf000 to GFN c1000 failed: Invalid argument
> > >
> > > Also, with a good boot (using seabios) I get this in the journal of the guest,
> > > but is missing from the boot that crashes:
> > >
> > > fedora kernel: BIOS-e820: [mem 0x00000000fc000000-0x00000000fcffffff] reserved
> > >
> > > The size of this missing entry is 4096 pages, which is probably what Qemu is trying to
> > > relocate but cannot with ovmf/uefi boot because it is missing. 4096 pages is 16 MB,
> > > which is probably the video shared memory.
> > >
> > > This is probably a bug/regression in Xen somewhere between Xen 4.14 and 4.16
> > > and I will try to bisect it when I have time.
> > >
> > > Best regards,
> > >
> > > Chuck
> > >
> > >> that are not recognized by the operating system when using
> > >> UEFI and do not load specific drivers. For example, the problem is
> > >> solved using qxl and a driver in Windows, but the qxl development is not
> > >> complete and fails.
> > >>
> > >> With limitations, it seems that the problem in QEMU is solved by
> > >> changing the parameters in the BIOS and doing a warm/soft reboot. I
> > >> don't know why, this can't be done in xen. The settings are never saved
> > >> and the reboot, at least in windows 10, is always a cold one (xen
> > >> destroys the virtual machine and recreates it. The soft reboot parameter
> > >> hangs the vm).
> > >>
> > >> Regards.
> > >>
> > >> __________
> > >> MhBeyle ___
> > >>
> > >>
> > >>
> > >
> >
> >
>
>


