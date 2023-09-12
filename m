Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 924F579C19F
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 03:25:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599871.935468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfs9m-000731-Rw; Tue, 12 Sep 2023 01:25:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599871.935468; Tue, 12 Sep 2023 01:25:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfs9m-00070S-Os; Tue, 12 Sep 2023 01:25:34 +0000
Received: by outflank-mailman (input) for mailman id 599871;
 Tue, 12 Sep 2023 01:25:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2+51=E4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qfs9l-00070M-Nk
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 01:25:33 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42e11d22-510b-11ee-9b0d-b553b5be7939;
 Tue, 12 Sep 2023 03:25:31 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 11C236148F;
 Tue, 12 Sep 2023 01:25:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6845BC116AE;
 Tue, 12 Sep 2023 01:25:28 +0000 (UTC)
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
X-Inumbo-ID: 42e11d22-510b-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694481929;
	bh=UC6+C4rmbYHyh4OW18kdXEp+2FY1SLUSc9sd7zNUNoU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=KjZozD3mWO/5Y2JI8b9zK6UzC1OTltsdAukVx3+26tIE0Co5WDUCscvy2qnOQsZHr
	 T1iN/ON2FcsXVPWVc9NjAAAGvz0GKH1TA1Dp8U1rQ8n6svVTbQgYZgFk1qS6ZICZV4
	 qAcBDPcf9P21EdmkidD/LK63lLbEBShxFKZsQz8y0uLSFUCTdDzzWZCrs1QLdXvGmO
	 Cc1KNfNRjoh3GIQfBo8DE2sEDh44zm+Ma29kbUZ3S59A6i3bTSdL0G753H9KRvT4j6
	 CokpgMbtMsLZeU5pgevFJHCtIghnhzpCrnk1cDnhiskTeLC/Sg6QQZ3j9fCmZ1/YtD
	 uhYi/H8D5W2Bw==
Date: Mon, 11 Sep 2023 18:25:26 -0700 (PDT)
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
In-Reply-To: <DM6PR20MB2779BA8D352E566A350844FCC1F2A@DM6PR20MB2779.namprd20.prod.outlook.com>
Message-ID: <alpine.DEB.2.22.394.2309111822330.1847660@ubuntu-linux-20-04-desktop>
References: <DM6PR20MB277971712E5415CB231AEB37C1E7A@DM6PR20MB2779.namprd20.prod.outlook.com> <alpine.DEB.2.22.394.2308291512271.6458@ubuntu-linux-20-04-desktop> <DM6PR20MB27795F4B6C327F7F031BABB0C1E6A@DM6PR20MB2779.namprd20.prod.outlook.com>
 <alpine.DEB.2.22.394.2308301814580.6458@ubuntu-linux-20-04-desktop> <DM6PR20MB2779E6DD63DC5CC9A1FE161AC1E5A@DM6PR20MB2779.namprd20.prod.outlook.com> <alpine.DEB.2.22.394.2309051848590.6458@ubuntu-linux-20-04-desktop>
 <DM6PR20MB2779A22E8CA641F0B2BBF038C1EFA@DM6PR20MB2779.namprd20.prod.outlook.com> <alpine.DEB.2.22.394.2309061629460.6458@ubuntu-linux-20-04-desktop> <DM6PR20MB2779BA8D352E566A350844FCC1F2A@DM6PR20MB2779.namprd20.prod.outlook.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 11 Sep 2023, Anthony Chan wrote:
> On Wed, 6 Sep 2023, Stefano Stabellini wrote:
> > On Wed, 6 Sep 2023, Anthony Chan wrote:
> > > Thanks, I've tried patches that stemmed from that discussion but
> > > unfortunately, doesn't resolve the issue.  In fact, the s2idle_loop
> > > branch might not be the problem at all.  I experimented with Xen to allow the
> > > 'idle-states' into the FDT and prevented xen_guest_init on Linux from disabling
> > > the 'cpuidle' driver (arch/arm/xen/enlighten.c).  When I trigger a suspend, I
> > > can see now another thread (believe it's the idle thread) call into
> > > drivers/firmware/psci/psci.c:__psci_cpu_suspend and then the Xen
> > > counterpart at xen/arch/arm/vpsci.c:do_psci_0_2_cpu_suspend.
> >
> > OK but remember that Xen is not implementing do_psci_0_2_cpu_suspend
> > correctly at the moment. Either we need to fix the Xen implementation, or we
> > need to configure Linux so that it calls WFI instead of __psci_cpu_suspend.
> >
> > As a test, can you try to apply the attached patch to Xen as a tenative fix?  Or
> > you could change drivers/firmware/psci/psci.c:__psci_cpu_suspend to call
> > WFI instead of the PSCI operation (making sure to go to the entry_point
> > instead of returning).
> 
> Tried the patch and substituting a WFI for a PSCI op, but Xen still watchdogs on the VMs in both cases.  I noticed the other Linux generic arm 'cpu-idle' driver which used to do issue a WFI/cpu_do_idle isn't useable anymore either.  I'm not sure if Xen may have used to rely on this generic driver to get the WFI.

I was running out of ideas so I went back to look at the watchdog
console log:

(XEN) do_psci_0_2_cpu_suspend
(XEN) Watchdog timer fired for domain 0
(XEN) Hardware Dom0 shutdown: watchdog rebooting machine

Checking the code, it seems that the Xen watchdog is set by
xen/common/sched/core.c:SCHEDOP_watchdog, which is called by
tools/libs/ctrl/xc_domain.c:xc_watchdog.

xc_watchdog is called by tools/misc/xenwatchdogd.c. Is it possible that
this problem is entirely caused by the daemon xenwatchdogd running in
the background? What happens if you kill xenwatchdogd and try again
without it (even better not start it at all)?

