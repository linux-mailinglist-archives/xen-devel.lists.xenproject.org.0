Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5642B7FE345
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 23:38:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644315.1005133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8TB2-0008Ob-KT; Wed, 29 Nov 2023 22:37:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644315.1005133; Wed, 29 Nov 2023 22:37:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8TB2-0008Md-Hq; Wed, 29 Nov 2023 22:37:04 +0000
Received: by outflank-mailman (input) for mailman id 644315;
 Wed, 29 Nov 2023 22:37:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W+r8=HK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r8TB1-0008LC-Jc
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 22:37:03 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf88866c-8f07-11ee-98e4-6d05b1d4d9a1;
 Wed, 29 Nov 2023 23:37:01 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DC63661D34;
 Wed, 29 Nov 2023 22:36:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27407C433C7;
 Wed, 29 Nov 2023 22:36:58 +0000 (UTC)
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
X-Inumbo-ID: cf88866c-8f07-11ee-98e4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701297419;
	bh=ufYR0g7/oU9Dc3xz32l8vsuDnNfO7FYekhjSBXyR73I=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=tcbm7zvAhp1Y3pDZeuWj7vrQa3lwHHXJjXrarALVwUgl3LUPvLKMnyPx7s3tU7i3z
	 0YJWd8EFSZEi0u2mXbU57kCCbBH6s0e5tbb3T6yE50jMubh3gnGbN/kB+CA9GKhGiV
	 x07Ph4nhic0d+Y4lDOSPye8H8YES3fV7YB2w+cfi0V3cZ+g/eYbthHSMUClCEvVsJk
	 JeXgJU/PR36Wmp548ZsqjtOrVX0ynX2BCl8lVSPNSKgRtS/e76ij1uF4uVy9E18ePt
	 RpfC7VJ5G5P2eYqsm/AT7MSfTHxp/K8704KMdW2cSwD3mLjwH+6D+I6AvoEPszx0FD
	 UhU/Dr8rpEbMg==
Date: Wed, 29 Nov 2023 14:36:56 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Mario Marietto <marietto2008@gmail.com>
cc: Elliott Mitchell <ehem+freebsd@m5p.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Chuck Zmudzinski <brchuckz@netscape.net>, 
    Demi Marie Obenour <demi@invisiblethingslab.com>, 
    Anthony PERARD <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>
Subject: Re: We are not able to virtualize FreeBSD using xen 4.17 on Arm 32
 bit
In-Reply-To: <CA+1FSiiPOJOWkqGm_yATWyiZCDFgHYkHT0CVBqdcvK78AdeFoA@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2311291432350.3533093@ubuntu-linux-20-04-desktop>
References: <CA+1FSigM1PZc4WfZNUJSMsZbNPPTyThRJ7MMQwQ9TWn6VnSUTg@mail.gmail.com> <C0A0E9FA-5AAB-4324-BBBD-D07412CD7F32@arm.com> <ZWR1v5Y3EpRK817B@macbook> <CA+1FSij2Q9f9Vj0A06HUYeUxTddrEyF=Q8X5fbs96CRr83_BPg@mail.gmail.com> <4fc95518-7e46-4f82-b540-afdbc941508a@netscape.net>
 <f606be07-c4ff-43c6-acf9-42065a84b594@netscape.net> <ZWUgfkP4U5kOmQNj@mattapan.m5p.com> <ZWXvBMaRJ5Lbb5S9@macbook> <CA+1FSii4WeKQBuzW9TS_AkHD2nbm=Q+iL9j3wkfu+ZsC0V_=1w@mail.gmail.com> <ZWYC-omtTOxIHNwF@macbook> <ZWZyEtGMhjRba/Z2@mattapan.m5p.com>
 <CA+1FSiiPOJOWkqGm_yATWyiZCDFgHYkHT0CVBqdcvK78AdeFoA@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1138682156-1701297419=:3533093"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1138682156-1701297419=:3533093
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

Hi Mario,

I suggest to do one step at a time and first to get it fully working
using "xl" to create the FreeBSD guest. And afterwords to try to get
libvirt to work. Both xl and libvirt call the same library underneath
(libxl) to create guests, but xl is tested a lot more with Xen on ARM.

I am not going to comment on how to create a FreeBSD xenvm.img as I
don't have any knowledge on FreeBSD.



On Wed, 29 Nov 2023, Mario Marietto wrote:
> Hello to everyone.
> 
> I tried to use xen as a hypervisor instead of kvm + libvirt + virt-manager to boot FreeBSD on my ARM Chromebook where I have installed
> Devuan 5,since Stefano said : 
> 
> "That might work. libvirt + virt-manager with the xen accelerator might work on the ARM Chromebook. That's because as far as I know Xen
> integration in libvirt is done via linking to libxl directly and libxl is supported and working on ARM" 
> 
> Unfortunately something is not working properly. What I did has been to reboot the machine in xen,enable libvirtd & and virtlogd & and
> virt-manager &,but this is what happened :
> 
> Traceback (most recent call last):
>   File "/usr/lib/xen-4.17/bin/pygrub", line 884, in <module>
>     raise RuntimeError("Unable to find partition containing kernel")
> RuntimeError: Unable to find partition containing kernel
> 
> I think it does not recognize the FreeBSD file system structure and its kernel. Libvirt seems to have been programmed to boot Linux,not
> FreeBSD. 
> 
> In Fact,I did the counterproof and it seems to be like this :
> 
> 
> According with this post :
> 
> https://blog.roberthallam.org/2020/05/solving-unable-to-find-partition-containing-kernel/
> 
> I've created a file called menu.lst inside the boot directory of the image file called "debian.img",adding the following content inside :
> 
> default 0
> timeout 10
> title Debian
> root (hd0,1)
> kernel /boot/vmlinux-6.1.59-stb-xen-cbe+ root=/dev/xvda
> initrd /boot/initrd.img-6.1.59-stb-xen-cbe+
> 
> and I tried again to boot the image using virt-manager. It gave this error again :
> 
> root@devuan-bunsen:/mnt/zroot2/zroot2/OS/Chromebook/FreeBSD-guestOS/linux-xen/debian2/boot# 2023-11-29 15:21:09.266+0000: 2467: error :
> libxlDomainStartPerform:1256 : internal error: libxenlight failed to create new domain 'debian12'
> 
> but giving a look inside the log file and I found this interesting situation ;
> 
> Using <class 'grub.GrubConf.GrubConfigFile'> to parse /boot/grub/menu.lst
> (B )0 [1;24r [m [?7h [?1h = [H [J [?1h = [1B    pyGRUB  version 0.6
> [1B [0m lqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqk
> [1B [0m x [0;7m Debian 12                                                             [m [0m x
> [1B [0m x [72C [0m x
> [1B [0m x [72C [0m x
> [1B [0m x [72C [0m x
> [1B [0m x [72C [0m x
> [1B [0m x [72C [0m x
> [1B [0m x [72C [0m x
> [1B [0m x [72C [0m x
> [1B [0m mqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqj [1B [70D [0m Use the ↑ and ↓ keys to select which
> entry is highlighted. [1B [58DPress enter to boot the selected OS, 'e' to edit the [1B [52Dcommands before booting, 'a' to modify the
> kernel arguments [1B [59Dbefore booting, or 'c' for a command line. [12A [26C [17B [68DWill boot selected entry in 10 seconds [?1h =
> [J [17A [73C [17B [68DWill boot selected entry in  9 seconds [?1h =
> [J [17A [73C [17B [68DWill boot selected entry in  8 seconds [?1h =
> [J [17A [73C [17B [68DWill boot selected entry in  7 seconds [?1h =
> [J [17A [73C [17B [68DWill boot selected entry in  6 seconds [?1h =
> [J [17A [73C [17B [68DWill boot selected entry in  5 seconds [?1h =
> [J [17A [73C [17B [68DWill boot selected entry in  4 seconds [?1h =
> [J [17A [73C [17B [68DWill boot selected entry in  3 seconds [?1h =
> [J [17A [73C [17B [68DWill boot selected entry in  2 seconds [?1h =
> [J [17A [73C [17B [68DWill boot selected entry in  1 seconds [?1l > [24;1H
> [?1l >
> 
> so,it seems that it tried to boot,but for an unknown reason,it still gives the error.
>  
> Anyway : My xen setup is not broken anymore ; Using Libvirt Linux seems to be able to boot,FreeBSD does not. Using the "raw" method of
> booting FreeBSD as domU could be another story that I will try soon.
> 
> But before trying to compile the correct freebsd kernel that's recognized by xen using the Elliott Michell code,I need to understand well
> what's the procedure that will work. So below you can read what I will try to do :
> 
> $ truncate -s 100G xenvm.img
> $ mdconfig -f xenvm.img -u 0 
> $ newfs /dev/md0 
> $ mount /dev/md0 /mnt
> $ git clone https://gitlab.com/ehem/freebsd-src.git
> $ cd freebsd-src
> $ make  -DNO_MODULES   KERNCONF=GENERIC TARGET=arm TARGET_ARCH=armv7 DESTDIR=/build buildkernel
> $ echo "/dev/xbd0       /       ufs     rw      1 
> 1" > /mnt/etc/fstab  
> 
> $ nano /build/etc/ttys (add the line 'xc0 "/usr/libexec/getty Pc" xterm on secure")
> $ umount /build
> $ mdconfig -d -u 0
> 
> Do you see errors ? some missing ?
> ---> I've only ever tried arm64, but since arm32 didn't appear to need much to be operational I tried to
> make it possible.  In theory it /should/ work on arm32, but I've never tried it.  What was missing was 
> I had never added it to the configuration and one link was needed. Updated "submit" branch has a tiny 
> adjustment.
> 
> I didn't understand how to apply the patch that's inside the "submit" branch. 
> 
> 
> On Wed, Nov 29, 2023 at 12:05 AM Elliott Mitchell <ehem+freebsd@m5p.com> wrote:
>       On Tue, Nov 28, 2023 at 04:10:50PM +0100, Roger Pau Monné wrote:
>       > On Tue, Nov 28, 2023 at 03:09:14PM +0100, Mario Marietto wrote:
>       > > For booting a FreeBSD kernel as a guest OS on XEN,should we install xen
>       > > 4.18 from source ?
> 
>       > I don't think so, I'm not aware of the FreeBSD port requiring a
>       > specific version of Xen.  I do think the work is limited to aarch64
>       > however, so there's no support in sight for arm32 FreeBSD guests as
>       > far as I'm aware.
> 
>       I've only ever tried arm64, but since arm32 didn't appear to need much
>       to have operational I tried to make it possible.  In theory it /should/
>       work on arm32, but I've never tried it.  What was missing was I had never
>       added it to the configuration and one link was needed.  Updated "submit"
>       branch has the tiny adjustment.
> 
>       (the only difference is the hypercall wrappers, register naming and where
>       the op code goes, very simple compatibility)
> 
> 
>       On Tue, Nov 28, 2023 at 02:45:40PM +0100, Roger Pau Monné wrote:
>       > On Mon, Nov 27, 2023 at 03:04:30PM -0800, Elliott Mitchell wrote:
>       > > BTW Roger Pau Monné, now that Xen 4.18 is out, take a look at the
>       > > "royger" branch?
>       >
>       > I've pushed a bunch of those, there are still some, I've made comments
>       > on the branch.
>       >
>       > I think there isn't much left after the swept I've done.
>       >
>       > If you can rebase and reply to the comments I will take a look at
>       > what's remaining.
> 
>       Done.  I'm unsure you'll like the xs_attach_children() approach.  Thing
>       is that really is appropriate given the situation.  #2 is the urgent one
>       as that is the handy approach to the hypercall declarations.
> 
> 
>       --
>       (\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
>        \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
>         \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
>       8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445
> 
> 
> 
> 
> --
> Mario.
> 
> 
--8323329-1138682156-1701297419=:3533093--

