Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB43C30B4CA
	for <lists+xen-devel@lfdr.de>; Tue,  2 Feb 2021 02:41:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80256.146718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6kgC-0006jF-FB; Tue, 02 Feb 2021 01:40:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80256.146718; Tue, 02 Feb 2021 01:40:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6kgC-0006iw-AX; Tue, 02 Feb 2021 01:40:32 +0000
Received: by outflank-mailman (input) for mailman id 80256;
 Tue, 02 Feb 2021 01:40:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gsWk=HE=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l6kgA-0006ir-TW
 for xen-devel@lists.xenproject.org; Tue, 02 Feb 2021 01:40:30 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c301a209-cc2a-4ba4-87d9-4e7eaf9f0244;
 Tue, 02 Feb 2021 01:40:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A59FC64E8D;
 Tue,  2 Feb 2021 01:40:28 +0000 (UTC)
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
X-Inumbo-ID: c301a209-cc2a-4ba4-87d9-4e7eaf9f0244
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612230028;
	bh=MhpsANIwunldzDBQYrWg2ZUdOzY9nRyWcaPYT5HqPaw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mzpDfLCWRZqVZ91GLne+hgLf3ncIWgz2bt69rkg1/7QooDWGzMBisMaW3zHhkxTXo
	 SiGbz9AtHbUAq3se1FFcJorJWMAb1oaaUlnRA1ysIUDbK3LTVMUbpw+iAJUlaXdyfX
	 6uDa5CXpzCamq+fe3UcgTHEmqAQtNcTtVmigzb/+H0AbFHgLQu7BQmAnXkUBaVG+QM
	 i1W7wKplMFjIifeEn0i584ELxMzX5P4U4gxgRc9TpjD4pf82mm/QmFuhZI6QQThd7T
	 tzlk0yr25RbK7PhYGEtx1yGPO+Nj2kbTlmCED488R9CJofeJrQXppS8p7OSrKVFGnf
	 YQbbDdz37u88Q==
Date: Mon, 1 Feb 2021 17:40:28 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
cc: Elliott Mitchell <ehem+xen@m5p.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: Xen 4.14.1 on RPI4: device tree generation failed
In-Reply-To: <CABfawhktGwwXNdMrm4uShKSs5MvaUz2hG63wzcDA97z9pGL=Ug@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2102011737010.29047@sstabellini-ThinkPad-T480s>
References: <CABfawhnvgFLU=VmaqmKyf8DNeVcXoXTD2=XpiwnL0OikC1_z4w@mail.gmail.com> <YBc+Iaf1CCgXO0Aj@mattapan.m5p.com> <CABfawhncPyDKy_G2Lz7MaEb_ZoPadHef7S7KAj-fbCbQq6YNGA@mail.gmail.com> <YBdgf4KKcDn0SCOw@mattapan.m5p.com> <CABfawhmrWX6tO-bESuF5oGec5cLbkHdyjdCGsfwX5AVrwQBsKA@mail.gmail.com>
 <YBeXfWf8lQ2nwMtI@mattapan.m5p.com> <CABfawhn74W88nJz5bCvA=VMxX_QqKv1ZaDQxOEtNZu5Pr8mFag@mail.gmail.com> <CABfawhktGwwXNdMrm4uShKSs5MvaUz2hG63wzcDA97z9pGL=Ug@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 1 Feb 2021, Tamas K Lengyel wrote:
> On Mon, Feb 1, 2021 at 10:23 AM Tamas K Lengyel
> <tamas.k.lengyel@gmail.com> wrote:
> >
> > On Mon, Feb 1, 2021 at 12:54 AM Elliott Mitchell <ehem+xen@m5p.com> wrote:
> > >
> > > On Sun, Jan 31, 2021 at 10:06:21PM -0500, Tamas K Lengyel wrote:
> > > > With rpi-4.19.y kernel and dtbs
> > > > (cc39f1c9f82f6fe5a437836811d906c709e0661c) Xen boots fine and the
> > > > previous error is not present. I get the boot log on the serial with
> > > > just console=hvc0 from dom0 but the kernel ends up in a panic down the
> > > > line:
> > >
> > > > This seems to have been caused by a monitor being attached to the HDMI
> > > > port, with HDMI unplugged dom0 boots OK.
> > >
> > > The balance of reports seem to suggest 5.10 is the way to go if you want
> > > graphics on a RP4 with Xen.  Even without Xen 4.19 is looking rickety on
> > > RP4.
> > >
> > >
> > > On Sun, Jan 31, 2021 at 09:43:13PM -0500, Tamas K Lengyel wrote:
> > > > On Sun, Jan 31, 2021 at 8:59 PM Elliott Mitchell <ehem+xen@m5p.com> wrote:
> > > > >
> > > > > On Sun, Jan 31, 2021 at 06:50:36PM -0500, Tamas K Lengyel wrote:
> > > > > > On Sun, Jan 31, 2021 at 6:33 PM Elliott Mitchell <ehem+undef@m5p.com> wrote:
> > > > > > > Presently the rpixen script is grabbing the RPF's 4.19 branch, dates
> > > > > > > point to that last being touched last year.  Their tree is at
> > > > > > > cc39f1c9f82f6fe5a437836811d906c709e0661c.
> > > > > >
> > > > > > I've moved the Linux branch up to 5.10 because there had been a fair
> > > > > > amount of work that went into fixing Xen on RPI4, which got merged
> > > > > > into 5.9 and I would like to be able to build upstream everything
> > > > > > without the custom patches coming with the rpixen script repo.
> > > > >
> > > > > Please keep track of where your kernel source is checked out at since
> > > > > there was a desire to figure out what was going on with the device-trees.
> > > > >
> > > > >
> > > > > Including "console=hvc0 console=AMA0 console=ttyS0 console=tty0" in the
> > > > > kernel command-line should ensure you get output from the kernel if it
> > > > > manages to start (yes, Linux does support having multiple consoles at the
> > > > > same time).
> > > >
> > > > No output from dom0 received even with the added console options
> > > > (+earlyprintk=xen). The kernel build was from rpi-5.10.y
> > > > c9226080e513181ffb3909a905e9c23b8a6e8f62. I'll check if it still boots
> > > > with 4.19 next.
> > >
> > > So, their current HEAD.  This reads like you've got a problematic kernel
> > > configuration.  What procedure are you following to generate the
> > > configuration you use?
> > >
> > > Using their upstream as a base and then adding the configuration options
> > > for Xen has worked fairly well for me (`make bcm2711_defconfig`,
> > > `make menuconfig`, `make zImage`).
> > >
> > > Notably the options:
> > > CONFIG_PARAVIRT
> > > CONFIG_XEN_DOM0
> > > CONFIG_XEN
> > > CONFIG_XEN_BLKDEV_BACKEND
> > > CONFIG_XEN_NETDEV_BACKEND
> > > CONFIG_HVC_XEN
> > > CONFIG_HVC_XEN_FRONTEND
> > >
> > > Should be set to "y".
> >
> > Yes, these configs are all set the same way for all Linux builds by the script:
> >         make O=.build-arm64 ARCH=arm64
> > CROSS_COMPILE=aarch64-none-linux-gnu- bcm2711_defconfig xen.config
> >
> > I tried with both the rpi-5.10.y and rpi-5.9.y, neither boot up as
> > dom0. So far only 4.19 boots.
> 
> rpi-5.4.y boots but ends up in yet another different kernel panic:

That's an interesting error. However, I can tell you that I can boot
rpi-5.9.y just fine (without a monitor attached) with:

cd linux
KERNEL=kernel7l
make bcm2711_defconfig

As mentioned here:

https://www.raspberrypi.org/documentation/linux/kernel/building.md

and also taking the device tree from arch/arm64/boot/dts/broadcom/.

