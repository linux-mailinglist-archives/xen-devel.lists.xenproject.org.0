Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5CF79337D
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 03:51:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596157.929932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdhhR-00073d-UC; Wed, 06 Sep 2023 01:51:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596157.929932; Wed, 06 Sep 2023 01:51:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdhhR-00071K-Qu; Wed, 06 Sep 2023 01:51:21 +0000
Received: by outflank-mailman (input) for mailman id 596157;
 Wed, 06 Sep 2023 01:51:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DwRh=EW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qdhhP-00071E-MF
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 01:51:19 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd076b20-4c57-11ee-9b0d-b553b5be7939;
 Wed, 06 Sep 2023 03:51:16 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id C360ECE10E7;
 Wed,  6 Sep 2023 01:51:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C490BC433C7;
 Wed,  6 Sep 2023 01:51:08 +0000 (UTC)
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
X-Inumbo-ID: dd076b20-4c57-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693965069;
	bh=WIxr+TBAdJUHzBphOPyO9KsAzPrS1mSZCiJ4LNhzUgc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ogM+H9Gc56HhYSI/1IqnJtMMWQJlql8GyG4F1hRstoMZcRAWhW2fPYpl2DUpt0qTE
	 DfPCqM6d3AEdjRD3LyAHc9jOG0msyur1WTZXpRzzYkcOgHCjFluHNWFf5O6c9S4wEd
	 WmYhhjmddRNPuNLXa6gBMM/88aVzYDHDDRSFYjxf6X+vqJC7GkKrZQBrAcsfs0lrVs
	 m5FB/PxZQS6xedQI4wZTzVXSe3RG/MYGD1vnKtDTskExaR8x1qgIhK7w68XUVqKzj2
	 nPqnd83B7JkyBK6xrG7taTRoVPVJfOB//nvouvKTbLLam7jNZ14jmTXMCODyQauzru
	 ZFv4OnQ2QkMEg==
Date: Tue, 5 Sep 2023 18:51:06 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Anthony Chan <anthonychan@nureva.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "bertrand.marquis@arm.com" <bertrand.marquis@arm.com>, 
    "julien@xen.org" <julien@xen.org>, 
    "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>, 
    "michal.orzel@amd.com" <michal.orzel@amd.com>, 
    Dan Waqar <danwaqar@nureva.com>
Subject: RE: [EXT] Re: xen arm64 low power sleep support
In-Reply-To: <DM6PR20MB2779E6DD63DC5CC9A1FE161AC1E5A@DM6PR20MB2779.namprd20.prod.outlook.com>
Message-ID: <alpine.DEB.2.22.394.2309051848590.6458@ubuntu-linux-20-04-desktop>
References: <DM6PR20MB277971712E5415CB231AEB37C1E7A@DM6PR20MB2779.namprd20.prod.outlook.com> <alpine.DEB.2.22.394.2308291512271.6458@ubuntu-linux-20-04-desktop> <DM6PR20MB27795F4B6C327F7F031BABB0C1E6A@DM6PR20MB2779.namprd20.prod.outlook.com>
 <alpine.DEB.2.22.394.2308301814580.6458@ubuntu-linux-20-04-desktop> <DM6PR20MB2779E6DD63DC5CC9A1FE161AC1E5A@DM6PR20MB2779.namprd20.prod.outlook.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 31 Aug 2023, Anthony Chan wrote:
> On Thu, 30 Aug 2023, Stefano Stabellini wrote:
> > On Wed, 30 Aug 2023, Anthony Chan wrote:
> > > On Tue, 29 Aug 2023, Stefano Stabellini wrote:
> > > > On Tue, 29 Aug 2023, Anthony Chan wrote:
> > > > > Hi all,
> > > > >
> > > > > My name is Tony and I've been researching/developing using Xen
> > > > > for potential upcoming uses in our embedded systems.  I started
> > > > > with Xen using Xilinx tools about a year ago and still have lots
> > > > > to learn about what it can to do in the embedded space.  So far,
> > > > > I've managed to integrate Xen and Linux into an existing product
> > > > > that exclusively runs bare-metal code on a ZynqMP SoC and
> > > > > migrate some of the functionality into custom Linux driver/userspace.
> > > > >
> > > > > I'm now looking at low power support, for now at least between
> > > > > Xen
> > > > > (4.16) and Linux (5.15) dom0.  I've tried a few different Linux
> > > > > kernel configs around power management and each time I try to
> > > > > suspend from linux dom0 (via sysfs or systemctl), Xen will
> > > > > watchdog on
> > > > > dom0 guest.
> > > > > AFAIK, Xen should trap on a 'WFI' from guests, but from what I
> > > > > can tell debugging through the linux suspend process is it's
> > > > > spinning in a 'suspend- to-idle' loop before it can get to
> > > > > issuing a 'WFI' or using PSCI interface to notify Xen.  I'm
> > > > > beginning to suspect that 'low power' support for embedded arm64
> > > > > just isn't quite there yet, or am I missing something in the configs?
> > > > >
> > > > > I realize this could very well be a Linux 'issue' but checking
> > > > > here first.  I know Xen presents a flattened device tree to
> > > > > Linux without CPU idle-state nodes and maybe this is causing the
> > > > > linux guest to only do the suspend- to-idle mode?  I should
> > > > > mention that I'm booting up using dom0less feature if that
> > > > > matters.
> > > >
> > > >
> > > > Hi Anthony,
> > > >
> > > > Assuming you are using the default Xen command line parameters for
> > > > Xilinx boards: sched=null vwfi=native, then if the guest uses WFI,
> > > > the CPU will execute WFI directly and go into low power mode.
> > > Yes, using these command line params.
> > >
> > > > Given the issue you are describing, I am suspecting the guest is
> > > > not issuing
> > > > WFI: that is simple and known to work. Instead, I suspect that
> > > > Linux might be trying to use PSCI_suspend in a way that is not
> > > > supported or well- implemented by Xen.
> > > >
> > > > Can you check? You can add a printk in Linux
> > > > drivers/firmware/psci/psci.c:__psci_cpu_suspend or in Xen
> > > > xen/arch/arm/vpsci.c:do_psci_0_2_cpu_suspend
> > > Instrumented both places it doesn't appear to reach there.  In
> > > kernel/power/suspend.c, there's a call to s2idle_loop that it's currently 'stuck'
> > > in and I think it doesn't get to the psci suspend your referring
> > > till afterwards, when suspend_ops->enter is called.  Unfortunately,
> > > without any idle-states nodes in the FDT, the only suspend state
> > > Linux is defaults to is 'suspend to idle'.
> >
> > The fact that Linux uses "suspend to idle" is not a problem because as
> > I mentioned WFI or PSCI_suspent are not different on Xen. That part is OK.
> What if using "suspend to idle" is preventing a WFI/PSCI_suspend?  Which is
> what I believe I'm currently seeing in my setup.  In kernel/power/suspend.c,
> suspend_devices_and_enter(), it gets into the this s2idle_loop and upon
> resuming from idle, it jumps past the point where I believe a
> WFI/PSCI_suspend can happen.
> if (state == PM_SUSPEND_TO_IDLE) {
>                 s2idle_loop();
>                 goto Platform_wake;
> }
 
If that is the case, then it looks like a Linux bug. Maybe something
along these lines?

https://lore.kernel.org/linux-arm-kernel/4665489.GXAFRqVoOG@kreacher/T/#m6edda92d0b5dc09f8e05e7d6db3807501b7249f4

