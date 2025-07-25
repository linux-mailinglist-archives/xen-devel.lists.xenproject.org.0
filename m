Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA8BB115C2
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 03:22:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056791.1424787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uf77q-0007lN-GQ; Fri, 25 Jul 2025 01:21:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056791.1424787; Fri, 25 Jul 2025 01:21:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uf77q-0007jC-De; Fri, 25 Jul 2025 01:21:30 +0000
Received: by outflank-mailman (input) for mailman id 1056791;
 Fri, 25 Jul 2025 01:21:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=swpo=2G=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uf77p-0007j5-5j
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 01:21:29 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af4fbc10-68f5-11f0-a31e-13f23c93f187;
 Fri, 25 Jul 2025 03:21:27 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 189605C67F5;
 Fri, 25 Jul 2025 01:21:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FCA7C4CEED;
 Fri, 25 Jul 2025 01:21:24 +0000 (UTC)
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
X-Inumbo-ID: af4fbc10-68f5-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753406485;
	bh=UtSYEnIleD+9Ur6V+wQToeEvBppMAGYpMZ1mRhhnvrc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hNzp0pXi8DOXKo5NvKkmq9PwhdqFEAsWhYzz6EFCxAhZZQKrH6LOnjUqjp7MBGeDx
	 bCG4NXqfXo62eKjM68pfZ37VDJX7I9lN7l0n4JXlS5AbVfKq3aXCcVjA0T0DPIRYU7
	 IVggqbR+893v9tJOtK0136qEQ9WIDqu6TgW1oi1dMNGwLZKgC3osqvhloa6Jp5YSz2
	 0aHYy5HLQ8uWS5oSt+NFfNEDhyOD6tjjFQRGSj7QPNUeVm5re2SisR0eDlimdAk9x+
	 PPix/Hp5octeA3BT8nCmqnSbJvwTkM/8/1qzCNS0Vs0AFW7ZJIicR+A7kDxG22FE9W
	 I19QQwHKaqaxA==
Date: Thu, 24 Jul 2025 18:21:22 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Penny Zheng <Penny.Zheng@amd.com>, ray.huang@amd.com, 
    Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1] xen: move getdomaininfo() to domain.c
In-Reply-To: <89b615e1-3ed4-4cc9-9222-4149b5a27e2e@suse.com>
Message-ID: <alpine.DEB.2.22.394.2507241820560.2549622@ubuntu-linux-20-04-desktop>
References: <20250722050410.853783-1-Penny.Zheng@amd.com> <0939219f-1c06-4d0d-a427-6b95b5943513@suse.com> <alpine.DEB.2.22.394.2507221738090.7043@ubuntu-linux-20-04-desktop> <f75df6d6-ede6-41a6-9412-1a9b073902b5@suse.com> <alpine.DEB.2.22.394.2507231327280.7043@ubuntu-linux-20-04-desktop>
 <89b615e1-3ed4-4cc9-9222-4149b5a27e2e@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 24 Jul 2025, Jan Beulich wrote:
> On 23.07.2025 22:30, Stefano Stabellini wrote:
> > On Wed, 23 Jul 2025, Jan Beulich wrote:
> >> On 23.07.2025 02:46, Stefano Stabellini wrote:
> >>> On Tue, 22 Jul 2025, Jan Beulich wrote:
> >>>> On 22.07.2025 07:04, Penny Zheng wrote:
> >>>>> Function getdomaininfo() is not only invoked by domctl-op, but also sysctl-op,
> >>>>> so it shall better live in domain.c, rather than domctl.c. Which is also
> >>>>> applied for arch_get_domain_info(). Style corrections shall be applied at
> >>>>> the same time while moving these functions, such as converting u64 to
> >>>>> uint64_t.
> >>>>>
> >>>>> The movement could also fix CI error of a randconfig picking both SYSCTL=y
> >>>>> and PV_SHIM_EXCLUSIVE=y results in sysctl.c being built, but domctl.c not
> >>>>> being built, which leaves getdomaininfo() undefined, causing linking to fail.
> >>>>>
> >>>>> Fixes: 34317c508294 ("xen/sysctl: wrap around sysctl hypercall")
> >>>>> Reported-by: Jan Beulich <jbeulich@suse.com>
> >>>>> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> >>>>
> >>>> I'm not convinced of this approach. In the longer run this would mean wrapping
> >>>> everything you move in "#if defined(CONFIG_SYSCTL) || defined(CONFIG_DOMCTL)",
> >>>> which I consider undesirable. Without DOMCTL, the usefulness of
> >>>> XEN_SYSCTL_getdomaininfolist is at least questionable. Therefore adding more
> >>>> isolated "#ifdef CONFIG_DOMCTL" just there may be an option. Similarly, as
> >>>> mentioned on the other thread, having SYSCTL depend on DOMCTL is an approach
> >>>> which imo wants at least considering. And there surely are further options.
> >>>>
> >>>> As indicated elsewhere, my preference goes towards reverting the final one or
> >>>> two patches of that series. They can be re-applied once the dependencies were
> >>>> properly sorted, which may (as per above) involve properly introducing a
> >>>> DOMCTL Kconfig setting first.
> >>>
> >>> I don't think this is a good idea.
> >>
> >> And implicitly you say that what I put under question in the first paragraph
> >> is a good way forward?
> > 
> > I think it is OK.
> > 
> > I also think "having SYSCTL depend on DOMCTL" is certainly worth
> > thinking about. In terms of privilege and potential for interference
> > with other domains sysctl and domctl don't seem different so it is
> > unlikely one would want to disable one but not the other.
> > 
> > Another idea is to have a single kconfig for both SYSCTL and DOMCTL: we
> > don't necessarily need to offer individual kconfig for every feature.
> > From a safety point of view, we want to disable them both.
> 
> Then again (and going against the thought of making SYSCTL depend on DOMCTL)
> there may be a desire to query / alter certain properties of the system as
> a whole, without also having that need for individual domains. But yes,
> covering both with a single control also is an option to consider.

If making SYSCTL depend on DOMCTL and/or a single kconfig for both
SYSCTL and DOMCTL are both way forward, then we can take this patch as
is?

