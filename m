Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF907FB012
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 03:28:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642709.1002360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7npy-0008I5-7W; Tue, 28 Nov 2023 02:28:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642709.1002360; Tue, 28 Nov 2023 02:28:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7npy-0008FC-4m; Tue, 28 Nov 2023 02:28:34 +0000
Received: by outflank-mailman (input) for mailman id 642709;
 Tue, 28 Nov 2023 02:28:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tf5Q=HJ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r7npw-0008Eq-7S
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 02:28:32 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0513e38-8d95-11ee-9b0e-b553b5be7939;
 Tue, 28 Nov 2023 03:28:29 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id EF5DECE18E3;
 Tue, 28 Nov 2023 02:28:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAF7AC433C8;
 Tue, 28 Nov 2023 02:28:21 +0000 (UTC)
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
X-Inumbo-ID: d0513e38-8d95-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701138505;
	bh=z4wzH3qpdfJ/JKkQFVb6J45z+sFez+5zYfb5QLGMN7M=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=YapOFRPLjMjPmPfU7m578MnirLLI1qVz/Tn24qp1mWiwuiJEjpL2sbMxecTOyR1jh
	 R5+tLReqBYVGqo4+G2c+/ZpN2tEPsk8UrNa+zHbafk7LHU8M/w9+V7yxmN4U+IBWCH
	 bN2S1Uj1Aby9eElDsActoM9eLdnxftNLUe3FrSq+ANFQZyKQgAwUwwy9MLl9o5wk9o
	 4E0DQHS9oicoVtvs/t+KOXbRA1YaMkhNcwAbfl1nviGdUYTxSKeAWKdRZuq8fYc05W
	 AkPjal45KnZXn1gn7NjPzo4+/iV4wIx/TOEBjfSo0nsI4O32IY3aZrt3T72oo67nSQ
	 mgWAB9iMi607g==
Date: Mon, 27 Nov 2023 18:28:20 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Chuck Zmudzinski <brchuckz@netscape.net>
cc: Mario Marietto <marietto2008@gmail.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Demi Marie Obenour <demi@invisiblethingslab.com>, 
    Anthony PERARD <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Elliott Mitchell <ehem+freebsd@m5p.com>
Subject: Re: We are not able to virtualize FreeBSD using xen 4.17 on Arm 32
 bit
In-Reply-To: <f606be07-c4ff-43c6-acf9-42065a84b594@netscape.net>
Message-ID: <alpine.DEB.2.22.394.2311271826370.3533093@ubuntu-linux-20-04-desktop>
References: <CA+1FSiggg=XZmif6c3pY0+jz7i9caU-OTwFy80gwO7MVpXiwcA@mail.gmail.com> <CA+1FSigM1PZc4WfZNUJSMsZbNPPTyThRJ7MMQwQ9TWn6VnSUTg@mail.gmail.com> <C0A0E9FA-5AAB-4324-BBBD-D07412CD7F32@arm.com> <ZWR1v5Y3EpRK817B@macbook>
 <CA+1FSij2Q9f9Vj0A06HUYeUxTddrEyF=Q8X5fbs96CRr83_BPg@mail.gmail.com> <4fc95518-7e46-4f82-b540-afdbc941508a@netscape.net> <f606be07-c4ff-43c6-acf9-42065a84b594@netscape.net>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1230342751-1701138505=:3533093"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1230342751-1701138505=:3533093
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 27 Nov 2023, Chuck Zmudzinski wrote:
> On 11/27/2023 10:22 AM, Chuck Zmudzinski wrote:
> > On 11/27/2023 7:45 AM, Mario Marietto wrote:
> >> @Chuck Zmudzinski <mailto:brchuckz@netscape.net> : Stay tuned. They want to help us. The xen developers are great. Very good support for us. I'm sure that you can give a good contribution to understand what's our problem and how to implement a fix with the help of all those good guys.
> >> 
> >> On Mon, Nov 27, 2023 at 11:56 AM Roger Pau Monné <roger.pau@citrix.com <mailto:roger.pau@citrix.com>> wrote:
> >> 
> >>     On Mon, Nov 27, 2023 at 10:28:13AM +0000, Henry Wang wrote:
> >>     > +(xen-devel and Arm maintainers, including Julien)
> >>     >
> >>     > > On Nov 27, 2023, at 18:03, Mario Marietto <marietto2008@gmail.com <mailto:marietto2008@gmail.com>>
> >>     > > wrote:
> >>     > >
> >>     > > Hello.  We have just virtualized Debian 12 on our arm (32 bit)
> >>     > > Chromebook model xe303c12 . As host / dom0 we have chosen Devuan
> >>     > > 5,and for guest / domU,Debian 12. It works great. But our goal is
> >>     > > different. We want to virtualize FreeBSD as domU. Can we have a
> >>     > > working Xen PV network driver for a FreeBSD arm guest ?. I found
> >>     > > that Julien Grall has ported the Xen drivers to FreeBSD on arm. I
> >>     > > would like to know if Julien's work was accepted upstream by
> >>     > > FreeBSD, in which case FreeBSD as a Xen guest on arm should work
> >>     > > if we enable the Xen PV drivers in the FreeBSD on arm kernel. If
> >>     > > Julien's work was not accepted upstream by FreeBSD, we will have
> >>     > > to find his patches and apply them ourselves to the FreeBSD on arm
> >>     > > kernel.
> >> 
> >>     I've added Elliot on Cc as he is working on upstreaming the patches to
> >>     FreeBSD.  He will be able to provide a better update than myself.
> >> 
> >>     Regards, Roger.
> > 
> > I have been collaborating with Mario, and I can explain what we have done so far :
> > 
> > We are using Julien's patch set against an old development version of FreeBSD 11
> > from 2014-12-03 :
> > 
> > https://xenbits.xen.org/gitweb/?p=people/julieng/freebsd.git;a=shortlog;h=refs/heads/xen-arm-v2.2
> > 
> > We successfully built the XENVIRT kernel and FreeBSD world, and created the
> > FreeBSD rootfs according to Julien's instructions here :
> > 
> > https://lists.freebsd.org/pipermail/freebsd-xen/2014-November/002202.html
> > 
> > There were some adjustments to the instructions :
> > 
> > To build the kernel, we used :
> > 
> > $ sudo make TARGET_ARCH=armv6 KERNCONF=XENVIRT buildkernel
> > 
> > instead of
> > 
> > $ sudo make TARGET_ARCH=armv6 KERNCONF=XENHVM buildkernel
> > 
> > The FreeBSD 'kernel' file is in ELF format and did not work, and we spent
> > some time trying to convert it to the zImage format without realizing the
> > build of the FreeBSD kernel creates the 'kernel.bin' file in the zImage format.
> > So when booting with the 'kernel.bin' file instead, it actually boots :
> > 
> > user@devuan-bunsen ~ % sudo xl create freebsd.cfg
> > Parsing config from freebsd.cfg
> > user@devuan-bunsen ~ % sudo xl li
> > Name                                        ID   Mem VCPUs	State	Time(s)
> > Domain-0                                     0   768     2     r-----    1439.4
> > freebsd                                      1  1152     1     r-----       3.0
> > user@devuan-bunsen ~ %
> > 
> > However, the guest is still not working correctly :
> > 
> > 1. Attaching the console with the -c option at creation or with
> >    'xl console freebsd' results in no output to the console.
> > 
> > 2. The timestamp on the virtual disk image file shows that the filesystem
> >    was at best mounted read-only, if it was mounted at all by the guest
> >    FreeBSD kernel.
> > 
> > 3. The 'xl shutdown freebsd' command does not work, it just hangs. To stop
> >    the guest, you need to do 'xl destroy freebsd'.
> > 
> > However, I think we can get the console to work and the rootfs to mount because I
> > just realized I forgot to do the steps from Julien's instructions of editing the
> > /etc/fstab and /etc/ttys files in the FreeBSD rootfs :
> > 
> > $ echo "/dev/xbd0       /       ufs     rw      1       1" > /mnt/etc/fstab
> > $ vi /mnt/etc/ttys (add the line 'xc0 "/usr/libexec/getty Pc" xterm on secure")
> > 
> > I will add those and see if the console and disk are working.
> 
> Unfortunately, adding xc0 to /etc/ttys and /dev/xbd0 as the root device in
> /etc/fstab did not make the console or disk work. Still no output on the
> xen console from the guest kernel, and the timestamp on the rootfs image
> file did not change so it did not mount read-write.
> 
> We could use some advice for troubleshooting this. Now, we are blind because
> we are not getting any xen console output But I am pleased we were able to
> demonstrate that Julien's old patch set for FreeBSD 11 allows us to boot
> FreeBSD 11 on a modern version of Xen on arm - we are using the Debian
> stable Xen 4.17 packages.

You can use the DEBUG hypercalls to check how far we got into the
booting process:
https://wiki.xenproject.org/wiki/Xen_ARM_DEBUG_hypercalls

For instance add the following to FreeBSD code:

asm volatile("hvc 0xfffd");


--8323329-1230342751-1701138505=:3533093--

