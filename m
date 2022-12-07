Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 981656463FD
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 23:22:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.456658.714434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p32oF-0001oU-W4; Wed, 07 Dec 2022 22:22:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 456658.714434; Wed, 07 Dec 2022 22:22:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p32oF-0001l1-T1; Wed, 07 Dec 2022 22:22:35 +0000
Received: by outflank-mailman (input) for mailman id 456658;
 Wed, 07 Dec 2022 22:22:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CKq1=4F=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1p32oF-0001kt-0y
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 22:22:35 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4e05830-767d-11ed-8fd2-01056ac49cbb;
 Wed, 07 Dec 2022 23:22:33 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 462CC61CCC;
 Wed,  7 Dec 2022 22:22:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5129C433D7;
 Wed,  7 Dec 2022 22:22:30 +0000 (UTC)
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
X-Inumbo-ID: a4e05830-767d-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670451751;
	bh=iPpYzhbp/o4m8YJReB493RBO9tzVlgCvxW1PUlDshJE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=o2yrIrsOvxI4qRMfmV9aqiA1Ak2qe0lwmiwoGW9O7nRHTQvGDxDe3eAiCv9dNcXY3
	 haoLBIucNPIoZWsxO3wifR3fZUf+KWiIa1iPJQnFGnOEiZNa8mL/AeFC1jnEFQW15z
	 aKXW+znltiD2HDgPedcofnYHdLeVgSGPMOHrqQEizGLRvPPOTKel/LML8VsdmuJQn4
	 gqqh9RXMqUfN6KMHg5vUGX1f5pgMAJSB7ag49uxzY5zdIlV0no4j4jyd9+O2YZ0nYN
	 VAdSuKP748oAUhvuJsnUumLhr/U1jAztuqlNjFecMiakjY1BBvDBDQaE/CYoCFD5cM
	 qv/YOGKIPFuqg==
Date: Wed, 7 Dec 2022 14:22:29 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Rahul Singh <Rahul.Singh@arm.com>, sisyphean <sisyphean@zlw.email>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [BUG]SMMU-V3 queue need no-cache memory
In-Reply-To: <fe0f90fa-84aa-54b2-1e12-98baff7fcaf7@xen.org>
Message-ID: <alpine.DEB.2.22.394.2212071418570.4039@ubuntu-linux-20-04-desktop>
References: <e1e0e347-6530-7b68-92f7-ef52defa55ac@zlw.email> <75D89B2C-BBE4-419A-80B7-FEE39445ABB2@arm.com> <fe0f90fa-84aa-54b2-1e12-98baff7fcaf7@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-239578259-1670451751=:4039"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-239578259-1670451751=:4039
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 7 Dec 2022, Julien Grall wrote:
> Hi,
> 
> I only noticed this e-mail because I was skimming xen-devel. If you want to
> get our attention, then I would suggest to CC both of us because I (and I
> guess Stefano) have filter rules so those e-mails land directly in my inbox.
> 
> On 07/12/2022 10:24, Rahul Singh wrote:
> > > On 7 Dec 2022, at 2:04 am, sisyphean <sisyphean@zlw.email> wrote:
> > > 
> > > Hi,
> > > 
> > >      I try to run XEN on my ARM board(Sorry, for some commercial reasons,
> > > I can't tell you
> > >      on which platform I run XEN)  and enable SMMU-V3, but all cmds in
> > > cmdq failed when XEN started.
> > > 
> > >      After using the debugger to track debugging, the reason for this
> > > problem is that
> > >      the queue in the smmu-v3 driver is not no-cache, so after the
> > > function arm_smmu_cmdq_build_cmd
> > >      is executed, the cmd is still in cache.Therefore, the SMMU-V3
> > > hardware cannot obtain the correct cmd
> > >      from the memory for execution.
> > 
> > Yes you are right as of now we are allocating the memory for cmdqueue via
> > _xzalloc() which is cached
> > memory because of that you are observing the issue. We have tested the Xen
> > SMMUv3 driver on SOC
> > where SMMUv3 HW is in the coherency domain, and because of that we have not
> > encountered this issue.
> > 
> > I think In your case SMMUv3 HW is not in the coherency domain. Please
> > confirm from your side if the
> > "dma-coherent” property is not set in DT.
> > 
> > I think there is no function available as of now to request Xen to allocate
> > memory that is not cached.
> 
> You are correct.
> 
> > 
> > @Julien and @Stefano do you have any suggestion on how we can request memory
> > from Xen that is not
> > cached something like dma_alloc_coherent() in Linux.
> 
> At the moment all the RAM is mapped cacheable in Xen. So it will require some
> work to have some memory uncacheable.
> 
> There are two options:
>  1) Allocate a pool of memory at boot time that will be mapped with different
> memory attribute. This means we would need a separate pool and the user will
> have to size it.
>  2) Modify after the allocation the caching attribute in the memory and then
> revert back after freeing. The cons is we would end up to shatter superpage.
> We also can't re-create superpage (yet), but that might be fine if the memory
> is never freed.
> 
> Option two would probably the best. But before going that route I have one
> question...
> 
> > The temporary solution I use is to execute function clean_dcache every
> > time cmd is copied to cmdq in function queue_write. But it is obvious
> > that this will seriously affect the efficiency.
> 
> I agree you will see some performance impact in micro-benchmark. But I am not
> sure about normal use-cases. How often do you expect the command queue to be
> used?

That is a good question. But even for the micro-benchmark, is the
difference significant? 

My gut feeling (to be discussed and confirmed) is that for this use-case
it might not be worth to do option 1) or option 2) above. Clean_dcache
as needed might be good enough?


> Also, I am a bit surprised you are seing issue with the command queue but not
> with the stage-2 page-tables. Does your SMMU support coherent walk but cannot
> snoop for the command queue?

--8323329-239578259-1670451751=:4039--

