Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDC278E446
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 03:19:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593293.926268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbWJl-0001rf-Js; Thu, 31 Aug 2023 01:17:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593293.926268; Thu, 31 Aug 2023 01:17:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbWJl-0001ol-Ge; Thu, 31 Aug 2023 01:17:53 +0000
Received: by outflank-mailman (input) for mailman id 593293;
 Thu, 31 Aug 2023 01:17:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IFXE=EQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qbWJk-0001of-Bd
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 01:17:52 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 32068f88-479c-11ee-9b0d-b553b5be7939;
 Thu, 31 Aug 2023 03:17:47 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1265AB80B84;
 Thu, 31 Aug 2023 01:17:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0FE5C433C7;
 Thu, 31 Aug 2023 01:17:44 +0000 (UTC)
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
X-Inumbo-ID: 32068f88-479c-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693444665;
	bh=icNpqFJCEV7X9EWTYSuktLYvwdnbF4HWzVQfNNUvFL4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HPEDj8piWxwBjPOTjSrt3vcA62AdkljS5u0puFiNJDWEDd6g68qZskRtrDvEHqPLC
	 B+RKIAx74CS3lKiMz6GPflA/QKtYs8eCqHQbm0nt6GfptqHzJ1Ye5FXqBFUJY6ARNV
	 MuTq4kY+Ni4BbAswU/Ffd1lseWkwszqdK9IY1+OL+YoA0CTr1n3qpanmkQ243RWPov
	 q5HrSGqf7riAKSU5w6Fo/3dC2cipJ91qo8nwyALzXw0ZX/nNZwHMgIJTZ6GCUWs0LG
	 jVJtXxQ8FdKxWKXUK/WepeyVTDSEjZB+E2D0WhJxYUden16WrXyhjXDSljEiCsryOU
	 mSE1VwqhogB/w==
Date: Wed, 30 Aug 2023 18:17:42 -0700 (PDT)
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
In-Reply-To: <DM6PR20MB27795F4B6C327F7F031BABB0C1E6A@DM6PR20MB2779.namprd20.prod.outlook.com>
Message-ID: <alpine.DEB.2.22.394.2308301814580.6458@ubuntu-linux-20-04-desktop>
References: <DM6PR20MB277971712E5415CB231AEB37C1E7A@DM6PR20MB2779.namprd20.prod.outlook.com> <alpine.DEB.2.22.394.2308291512271.6458@ubuntu-linux-20-04-desktop> <DM6PR20MB27795F4B6C327F7F031BABB0C1E6A@DM6PR20MB2779.namprd20.prod.outlook.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 30 Aug 2023, Anthony Chan wrote:
> On Tue, 29 Aug 2023, Stefano Stabellini wrote:
> > On Tue, 29 Aug 2023, Anthony Chan wrote:
> > > Hi all,
> > >
> > > My name is Tony and I've been researching/developing using Xen for
> > potential upcoming uses in our embedded systems.  I started with Xen
> > using Xilinx tools about a year ago and still have lots to learn about what it
> > can to do in the embedded space.  So far, I've managed to integrate Xen
> > and Linux into an existing product that exclusively runs bare-metal code on
> > a ZynqMP SoC and migrate some of the functionality into custom Linux
> > driver/userspace.
> > >
> > > I'm now looking at low power support, for now at least between Xen
> > (4.16) and Linux (5.15) dom0.  I've tried a few different Linux kernel
> > configs around power management and each time I try to suspend from
> > linux dom0 (via sysfs or systemctl), Xen will watchdog on dom0 guest.
> > AFAIK, Xen should trap on a 'WFI' from guests, but from what I can tell
> > debugging through the linux suspend process is it's spinning in a 'suspend-
> > to-idle' loop before it can get to issuing a 'WFI' or using PSCI interface to
> > notify Xen.  I'm beginning to suspect that 'low power' support for
> > embedded arm64 just isn't quite there yet, or am I missing something in
> > the configs?
> > >
> > > I realize this could very well be a Linux 'issue' but checking here first.  I
> > know Xen presents a flattened device tree to Linux without CPU idle-state
> > nodes and maybe this is causing the linux guest to only do the suspend-
> > to-idle mode?  I should mention that I'm booting up using dom0less
> > feature if that matters.
> >
> >
> > Hi Anthony,
> >
> > Assuming you are using the default Xen command line parameters for
> > Xilinx boards: sched=null vwfi=native, then if the guest uses WFI, the CPU
> > will execute WFI directly and go into low power mode.
> Yes, using these command line params.
> 
> > Given the issue you are describing, I am suspecting the guest is not issuing
> > WFI: that is simple and known to work. Instead, I suspect that Linux might
> > be trying to use PSCI_suspend in a way that is not supported or well-
> > implemented by Xen.
> >
> > Can you check? You can add a printk in Linux
> > drivers/firmware/psci/psci.c:__psci_cpu_suspend or in Xen
> > xen/arch/arm/vpsci.c:do_psci_0_2_cpu_suspend
> Instrumented both places it doesn't appear to reach there.  In kernel/power/suspend.c, there's a call to s2idle_loop that it's currently 'stuck' in and I think it doesn't get to the psci suspend your referring till afterwards, when suspend_ops->enter is called.  Unfortunately, without any idle-states nodes in the FDT, the only suspend state Linux is defaults to is 'suspend to idle'.
 
The fact that Linux uses "suspend to idle" is not a problem because as I
mentioned WFI or PSCI_suspent are not different on Xen. That part is OK.

However, if the issue is not PSCI_suspend then I don't have another easy
guess. Please post a full stack trace or more information about the
error in Linux and I might be able to see where it is coming from.

