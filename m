Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C55D79F3A8
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 23:18:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601658.937749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgXF4-0007XD-LH; Wed, 13 Sep 2023 21:17:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601658.937749; Wed, 13 Sep 2023 21:17:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgXF4-0007UG-Hu; Wed, 13 Sep 2023 21:17:46 +0000
Received: by outflank-mailman (input) for mailman id 601658;
 Wed, 13 Sep 2023 21:17:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VxlT=E5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qgXF3-0007UA-GW
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 21:17:45 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa10fc98-527a-11ee-8787-cb3800f73035;
 Wed, 13 Sep 2023 23:17:43 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9929661AB0;
 Wed, 13 Sep 2023 21:17:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0269EC433C7;
 Wed, 13 Sep 2023 21:17:40 +0000 (UTC)
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
X-Inumbo-ID: fa10fc98-527a-11ee-8787-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694639862;
	bh=E5fR+g0xpoWJgu6g2qXicRDEKe8ZE32qBjIIWwqSNck=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jhMeEH0cwvPdtvzU9e/g1l89ZnqblfOSuwpZ67B9V9J/Bb4+bFO8v+PKlmY2BdmkT
	 fIO5oBwrrct1ZH25zmYBkAQLIsOa1RJlvmsDRQI1ROClp9PTUN7wrFP9Z8u84G+wMD
	 viz8oj0Vv3G/AARgkj52mjkMZgLVP3IXzjF5vmQqzWn+8MI/ppWYlpIM6cD6rgsI1z
	 i1x0ZbGK4rOa1+o1oFG0oHgaR0v90OqSxbXjJhNfbEoJ01GqHiYI3jHFbhon0Uoog/
	 iL7CBB81guU44vETZolaFg9XunqUYpIIPd4P7FdVGPJeYKKnxIY1EboJirPkf09UGZ
	 a6Vr5b5N8GS6Q==
Date: Wed, 13 Sep 2023 14:17:38 -0700 (PDT)
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
In-Reply-To: <DM6PR20MB277966FD3886CAFA912A81AEC1F0A@DM6PR20MB2779.namprd20.prod.outlook.com>
Message-ID: <alpine.DEB.2.22.394.2309131417330.2295162@ubuntu-linux-20-04-desktop>
References: <DM6PR20MB277971712E5415CB231AEB37C1E7A@DM6PR20MB2779.namprd20.prod.outlook.com> <alpine.DEB.2.22.394.2308291512271.6458@ubuntu-linux-20-04-desktop> <DM6PR20MB27795F4B6C327F7F031BABB0C1E6A@DM6PR20MB2779.namprd20.prod.outlook.com>
 <alpine.DEB.2.22.394.2308301814580.6458@ubuntu-linux-20-04-desktop> <DM6PR20MB2779E6DD63DC5CC9A1FE161AC1E5A@DM6PR20MB2779.namprd20.prod.outlook.com> <alpine.DEB.2.22.394.2309051848590.6458@ubuntu-linux-20-04-desktop>
 <DM6PR20MB2779A22E8CA641F0B2BBF038C1EFA@DM6PR20MB2779.namprd20.prod.outlook.com> <alpine.DEB.2.22.394.2309061629460.6458@ubuntu-linux-20-04-desktop> <DM6PR20MB2779BA8D352E566A350844FCC1F2A@DM6PR20MB2779.namprd20.prod.outlook.com>
 <alpine.DEB.2.22.394.2309111822330.1847660@ubuntu-linux-20-04-desktop> <DM6PR20MB277966FD3886CAFA912A81AEC1F0A@DM6PR20MB2779.namprd20.prod.outlook.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 13 Sep 2023, Anthony Chan wrote:
> On Mon, 11 Sep 2023, Stefano Stabellini wrote:
> > On Mon, 11 Sep 2023, Anthony Chan wrote:
> > > On Wed, 6 Sep 2023, Stefano Stabellini wrote:
> > > > On Wed, 6 Sep 2023, Anthony Chan wrote:
> > > > > Thanks, I've tried patches that stemmed from that discussion but
> > > > > unfortunately, doesn't resolve the issue.  In fact, the
> > > > > s2idle_loop branch might not be the problem at all.  I
> > > > > experimented with Xen to allow the 'idle-states' into the FDT and
> > > > > prevented xen_guest_init on Linux from disabling the 'cpuidle'
> > > > > driver (arch/arm/xen/enlighten.c).  When I trigger a suspend, I
> > > > > can see now another thread (believe it's the idle thread) call
> > > > > into drivers/firmware/psci/psci.c:__psci_cpu_suspend and then the Xen
> > > > > counterpart at xen/arch/arm/vpsci.c:do_psci_0_2_cpu_suspend.
> > > >
> > > > OK but remember that Xen is not implementing do_psci_0_2_cpu_suspend
> > > > correctly at the moment. Either we need to fix the Xen
> > > > implementation, or we need to configure Linux so that it calls WFI instead
> > > > of __psci_cpu_suspend.
> > > >
> > > > As a test, can you try to apply the attached patch to Xen as a
> > > > tenative fix?  Or you could change
> > > > drivers/firmware/psci/psci.c:__psci_cpu_suspend to call WFI instead
> > > > of the PSCI operation (making sure to go to the entry_point instead of
> > > > returning).
> > >
> > > Tried the patch and substituting a WFI for a PSCI op, but Xen still watchdogs
> > on the VMs in both cases.  I noticed the other Linux generic arm 'cpu-idle'
> > driver which used to do issue a WFI/cpu_do_idle isn't useable anymore either.
> > I'm not sure if Xen may have used to rely on this generic driver to get the WFI.
> >
> > I was running out of ideas so I went back to look at the watchdog console log:
> >
> > (XEN) do_psci_0_2_cpu_suspend
> > (XEN) Watchdog timer fired for domain 0
> > (XEN) Hardware Dom0 shutdown: watchdog rebooting machine
> >
> > Checking the code, it seems that the Xen watchdog is set by
> > xen/common/sched/core.c:SCHEDOP_watchdog, which is called by
> > tools/libs/ctrl/xc_domain.c:xc_watchdog.
> >
> > xc_watchdog is called by tools/misc/xenwatchdogd.c. Is it possible that this
> > problem is entirely caused by the daemon xenwatchdogd running in the
> > background? What happens if you kill xenwatchdogd and try again without it
> > (even better not start it at all)?
> Disabling that daemon resolved the watchdog timing out.  Never noticed that daemon running before.  That clears a lot up and I think I understand what's going on here now, thank you for the help.

That's great! I am glad it got resolved.

