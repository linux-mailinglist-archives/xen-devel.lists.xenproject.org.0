Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1077AA3A33
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 23:52:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.973074.1361292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9ssI-0005dI-0m; Tue, 29 Apr 2025 21:52:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 973074.1361292; Tue, 29 Apr 2025 21:52:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9ssH-0005bq-UJ; Tue, 29 Apr 2025 21:52:21 +0000
Received: by outflank-mailman (input) for mailman id 973074;
 Tue, 29 Apr 2025 21:52:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZtOk=XP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u9ssG-0005bg-ML
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 21:52:20 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 37f385cf-2544-11f0-9eb4-5ba50f476ded;
 Tue, 29 Apr 2025 23:52:19 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8EA964AA42;
 Tue, 29 Apr 2025 21:52:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97749C4CEE3;
 Tue, 29 Apr 2025 21:52:15 +0000 (UTC)
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
X-Inumbo-ID: 37f385cf-2544-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745963536;
	bh=eFANkW49h87SVxM1Q7mVloY3PW0u5y38ALV1rvbouD8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=J/C34LBbZX6qg82VeGtQw8kcGg6EZOGI6mnHjBYZZJ5a6EziHFY2JFyffIA07PV3K
	 tzVRzaLmNSWDcUVEhU95f6QRMmxvbs+kYjztbV0QRvOy9yniHeebTxtyY4yx1IKiMH
	 4qHX1euAwVRwj5zoywXv5cS5GbEXuZAq+qVxk2d5W92gFUGgkeP50p1NCtD8tsCmGX
	 Lr/YjDfspLZUcoinxdmtyTi/eMdjADUWXbwKQ3cnl1h9eZDX121N9ZFO5iaK3uA+eu
	 iX6e0kT13O5A6yMDNY8TaCrB8w82Qqg0opXn0CGuXqkCLvJ+R/53Jujdi71xi0TGFD
	 cHxwoMPVKK7Nw==
Date: Tue, 29 Apr 2025 14:52:14 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    jason.andryuk@amd.com, agarciav@amd.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/x86: allow Dom0 PVH to call XENMEM_exchange
In-Reply-To: <06b66971-d8db-456f-8e83-a20ff7df8f5e@suse.com>
Message-ID: <alpine.DEB.2.22.394.2504291425320.3879245@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2504251314050.785180@ubuntu-linux-20-04-desktop> <19d9aec4-c21a-47a9-9c58-6bfcadbd22e0@suse.com> <alpine.DEB.2.22.394.2504281242240.785180@ubuntu-linux-20-04-desktop> <06b66971-d8db-456f-8e83-a20ff7df8f5e@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 29 Apr 2025, Jan Beulich wrote:
> On 28.04.2025 22:00, Stefano Stabellini wrote:
> > On Mon, 28 Apr 2025, Jan Beulich wrote:
> >> On 25.04.2025 22:19, Stefano Stabellini wrote:
> >>> From: Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>
> >>>
> >>> Dom0 PVH might need XENMEM_exchange when passing contiguous memory
> >>> addresses to firmware or co-processors not behind an IOMMU.
> >>
> >> I definitely don't understand the firmware part: It's subject to the
> >> same transparent P2M translations as the rest of the VM; it's just
> >> another piece of software running there.
> >>
> >> "Co-processors not behind an IOMMU" is also interesting; a more
> >> concrete scenario might be nice, yet I realize you may be limited in
> >> what you're allowed to say.
> > 
> > Sure. On AMD x86 platforms there is a co-processor called PSP running
> > TEE firmware. The PSP is not behind an IOMMU. Dom0 needs occasionally to
> > pass addresses to it.  See drivers/tee/amdtee/ and
> > include/linux/psp-tee.h in Linux.
> > 
> > This is not a new problem. On ARM we have been dealing with this kind of
> > issues for more than a decade and it is the reason why originally the
> > decision was to run Dom0 1:1 mapped on ARM. I am not suggesting to map
> > Dom0 PVH 1:1; I am only providing context and highlighting that we
> > have been lucky on x86 :-)
> > 
> > 
> >>> XENMEM_exchange was blocked for HVM/PVH DomUs, and accidentally it
> >>> impacted Dom0 PVH as well.
> >>
> >> This wasn't accidental at all, I don't think.
> > 
> > You as the original author of the patch (fae7d5be8bb) in question would
> > surely know better. But the way the commit message was written was
> > pointing toward a Dom0/DeviceModel problem:
> > 
> > "The operation's success can't be controlled by the guest, as the device
> > model may have an active mapping of the page."
> 
> It's the problem mentioned at the bottom: MFNs (in principle) are entirely
> meaningless to HVM and PVH domains. With, as you point out there, an
> apparently important exception.
> 
> >>> --- a/xen/arch/x86/mm.c
> >>> +++ b/xen/arch/x86/mm.c
> >>> @@ -4401,7 +4401,7 @@ int steal_page(
> >>>      const struct domain *owner;
> >>>      int rc;
> >>>  
> >>> -    if ( paging_mode_external(d) )
> >>> +    if ( paging_mode_external(d) && !is_hardware_domain(d) )
> >>>          return -EOPNOTSUPP;
> >>>  
> >>>      /* Grab a reference to make sure the page doesn't change under our feet */
> >>
> >> Is this (in particular the code following below here) a safe thing to do
> >> when we don't properly refcount page references from the P2M, yet? It's
> >> Dom0, yes, but even there I might see potential security implications (as
> >> top violating privacy of a guest).
> > 
> > I don't think I am following, could you please elaborate more? The
> > change I am proposing is to allow Dom0 to share its own pages to the
> > co-processor. DomUs are not in the picture. I would be happy to add
> > further restriction to that effect. Is there something else you have in
> > mind?
> 
> Once "shared" with the PSP, how would Xen know that this sharing has stopped?
> Without knowing, how could it safely give the same page to a DomU later on?
> ("Safely" in both directions: Without compromising privacy of the DomU and
> without compromising host safety / security.)

Why would Xen later assign the same page to a DomU? The page comes
from the hardware domain, which, as of today, cannot be destroyed. BTW I
realize it is a bit different, but we have been doing the same thing
with Dom0 1:1 mapped on ARM since the start of the project.

Additionally, the TEE is considered a more trusted component in the
system than the hypervisor.


> >> Furthermore cleanup_page_mappings() (called later in the function) has a
> >> PV-only aspect which would apparently need widening to PVH Dom0 then,
> >> too.
> > 
> > You are referring to:
> > 
> >         if ( d && unlikely(need_iommu_pt_sync(d)) && is_pv_domain(d) )
> >             rc = iommu_legacy_unmap(d, _dfn(mfn), 1u << PAGE_ORDER_4K);
> > 
> > is that correct?
> 
> Yes, that's what immediately caught my eye. I didn't look carefully whether
> there might be more.
> 
> >>> --- a/xen/common/memory.c
> >>> +++ b/xen/common/memory.c
> >>> @@ -794,7 +794,7 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
> >>>              rc = guest_physmap_add_page(d, _gfn(gpfn), mfn,
> >>>                                          exch.out.extent_order) ?: rc;
> >>>  
> >>> -            if ( !paging_mode_translate(d) &&
> >>> +            if ( (!paging_mode_translate(d) || is_hardware_domain(d)) &&
> >>>                   __copy_mfn_to_guest_offset(exch.out.extent_start,
> >>>                                              (i << out_chunk_order) + j,
> >>>                                              mfn) )
> >>
> >> Wait, no: A PVH domain (Dom0 or not) can't very well make use of MFNs, can
> >> it?
> > 
> > One way or another Dom0 PVH needs to know the MFN to pass it to the
> > co-processor.
> 
> I see. That's pretty odd, though. I'm then further concerned of the order of
> the chunks. At present we're rather lax, in permitting PVH and PV Dom0 the
> same upper bound. With both CPU and I/O side translation there is, in
> principle, no reason to permit any kind of contiguity. Of course there's a
> performance aspect, but that hardly matters in the specific case here. Yet at
> the same time, once we expose MFNs, contiguity will start mattering as soon
> as any piece of memory needs to be larger than PAGE_SIZE. Which means it will
> make tightening of the presently lax handling prone to regressions in this
> new behavior you're introducing. What chunk size does the PSP driver require?

I don't know. The memory returned by XENMEM_exchange is contiguous,
right? Are you worried that Xen cannot allocate the requested amount of
memory contiguously? We have been using this patch for months now and it
has been working correctly to this day.


> One further thought here: Is it really the hardware domain which is most
> logical to drive the PSP? Interaction is (just guessing) perhaps needed
> primarily when creating / managing guests? Then having the control domain
> talk to a driver in the hardware domain would make the overall picture more
> complicated.

On AMD the interactions are more related to access to hardware or
controlling other peripherals so it is a good fit for the hardware
domain.

