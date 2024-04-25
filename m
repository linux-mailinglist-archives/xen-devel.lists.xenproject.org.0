Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FCA8B2CF8
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 00:19:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712298.1112896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s07Q6-00037k-Ly; Thu, 25 Apr 2024 22:18:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712298.1112896; Thu, 25 Apr 2024 22:18:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s07Q6-00035d-JK; Thu, 25 Apr 2024 22:18:22 +0000
Received: by outflank-mailman (input) for mailman id 712298;
 Thu, 25 Apr 2024 22:18:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N29f=L6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s07Q5-00035X-Qs
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2024 22:18:21 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4c7d2f6-0351-11ef-909a-e314d9c70b13;
 Fri, 26 Apr 2024 00:18:19 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D4AF0CE1A71;
 Thu, 25 Apr 2024 22:18:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B827C113CC;
 Thu, 25 Apr 2024 22:18:09 +0000 (UTC)
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
X-Inumbo-ID: b4c7d2f6-0351-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714083491;
	bh=HkR9w6SMx5QH4SAZEV5jRP6eaVLcquTZ3zZHKcsIC6o=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=OTP7mx4Z/iIMjhqHvZz/Z5i9kliHVpmihpuKHQa1/k1Dgx4moZjXpboJsMMwNwmTn
	 he3XIdVUnkShoezgYUXibY1gZazH19/vy2q5Xbcc4IMmOEQa3aKlUXzflTthFyp6YU
	 nzIFJce23FaYMa+VNtWHr51T84WZUxEEi2bBK+T4rKUsASaQiCfFFAm1zUJ4JmWh+L
	 s2EuG0Lg5R/ebfs6AtuWwnb2iPljhYIa2Vtmi5kch2gtPBjdCDag2Qx1t0ZY7mQNDJ
	 3ficknvghff7Xg8jt6ufiCqqc9OaiG1whEZMUc94NARrKhS3+Z2NYVYrpeUWq6bjao
	 lzNi7qLSqq7KQ==
Date: Thu, 25 Apr 2024 15:18:08 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
cc: Henry Wang <xin.wang2@amd.com>, xen-devel@lists.xenproject.org, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 0/5] DOMCTL-based guest magic region allocation for
 11 domUs
In-Reply-To: <c7857223-eab8-409a-b618-6ec70f6165aa@apertussolutions.com>
Message-ID: <alpine.DEB.2.22.394.2404251508470.3940@ubuntu-linux-20-04-desktop>
References: <20240409045357.236802-1-xin.wang2@amd.com> <c7857223-eab8-409a-b618-6ec70f6165aa@apertussolutions.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 18 Apr 2024, Daniel P. Smith wrote:
> On 4/9/24 00:53, Henry Wang wrote:
> > An error message can seen from the init-dom0less application on
> > direct-mapped 1:1 domains:
> > ```
> > Allocating magic pages
> > memory.c:238:d0v0 mfn 0x39000 doesn't belong to d1
> > Error on alloc magic pages
> > ```
> > 
> > This is because populate_physmap() automatically assumes gfn == mfn
> > for direct mapped domains. This cannot be true for the magic pages
> > that are allocated later for 1:1 Dom0less DomUs from the init-dom0less
> > helper application executed in Dom0. For domain using statically
> > allocated memory but not 1:1 direct-mapped, similar error "failed to
> > retrieve a reserved page" can be seen as the reserved memory list
> > is empty at that time.
> > 
> > This series tries to fix this issue using a DOMCTL-based approach,
> > because for 1:1 direct-mapped domUs, we need to avoid the RAM regions
> > and inform the toolstack about the region found by hypervisor for
> > mapping the magic pages. Patch 1 introduced a new DOMCTL to get the
> > guest memory map, currently only used for the magic page regions.
> > Patch 2 generalized the extended region finding logic so that it can
> > be reused for other use cases such as finding 1:1 domU magic regions.
> > Patch 3 uses the same approach as finding the extended regions to find
> > the guest magic page regions for direct-mapped DomUs. Patch 4 avoids
> > hardcoding all base addresses of guest magic region in the init-dom0less
> > application by consuming the newly introduced DOMCTL. Patch 5 is a
> > simple patch to do some code duplication clean-up in xc.
> 
> Hey Henry,
> 
> To help provide some perspective, these issues are not experienced with
> hyperlaunch. This is because we understood early on that you cannot move a
> lightweight version of the toolstack into hypervisor init and not provide a
> mechanism to communicate what it did to the runtime control plane. We
> evaluated the possible mechanism, to include introducing a new hypercall op,
> and ultimately settled on using hypfs. The primary reason is this information
> is static data that, while informative later, is only necessary for the
> control plane to understand the state of the system. As a result, hyperlaunch
> is able to allocate any and all special pages required as part of domain
> construction and communicate their addresses to the control plane. As for XSM,
> hypfs is already protected and at this time we do not see any domain builder
> information needing to be restricted separately from the data already present
> in hypfs.
> 
> I would like to make the suggestion that instead of continuing down this path,
> perhaps you might consider adopting the hyperlaunch usage of hypfs. Then
> adjust dom0less domain construction to allocate the special pages at
> construction time. The original hyperlaunch series includes a patch that
> provides the helper app for the xenstore announcement. And I can provide you
> with updated versions if that would be helpful.

I also think that the new domctl is not needed and that the dom0less
domain builder should allocate the magic pages. On ARM, we already
allocate HVM_PARAM_CALLBACK_IRQ during dom0less domain build and set
HVM_PARAM_STORE_PFN to ~0ULL. I think it would be only natural to extend
that code to also allocate the magic pages and set HVM_PARAM_STORE_PFN
(and others) correctly. If we do it that way it is simpler and
consistent with the HVM_PARAM_CALLBACK_IRQ allocation, and we don't even
need hypfs. Currently we do not enable hypfs in our safety
certifiability configuration.

