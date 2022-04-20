Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F08285091BE
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 23:09:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309613.525983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhHYZ-0002g3-02; Wed, 20 Apr 2022 21:08:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309613.525983; Wed, 20 Apr 2022 21:08:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhHYY-0002d4-Sr; Wed, 20 Apr 2022 21:08:10 +0000
Received: by outflank-mailman (input) for mailman id 309613;
 Wed, 20 Apr 2022 21:08:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HBwa=U6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nhHYX-0002cy-Ju
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 21:08:09 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f9ffd04e-c0ed-11ec-8fbf-03012f2f19d4;
 Wed, 20 Apr 2022 23:08:07 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 374B0B81F90;
 Wed, 20 Apr 2022 21:08:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81C08C385A1;
 Wed, 20 Apr 2022 21:08:05 +0000 (UTC)
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
X-Inumbo-ID: f9ffd04e-c0ed-11ec-8fbf-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650488885;
	bh=T8FKDQt3bZsBb8hU4ZLoS/4/8NT9b2cS2wm/0Bs1j+M=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Kp2YGvH+3VAOmrfNzD8QpIePG7wvghskoMvnRGSrtctcrwtg4+FJqY2GcFcTZpQ+f
	 F6Mu2nE2/ILMWaGzjBASz9GNEzynddJgoudO7moRSXd9U5gNAybUWgKZhA2+OstjB0
	 6HUmOkiECKdkTGzDA1NvIDcjFdacxEhF/EwsnsN9BHwemBZhYSIfShxtO/VNieOJIu
	 lfJV24B4w8QHYvkU5PJiNq0Qqba5d7q6IoDWBsRrDWLrNRTHuOLimferlcBxF0GHUM
	 oTLcfTsrbk3nTvQmQnhOXE8lwIOUbo2poZdB8pFoTZRRgRI17xTNhq1akablbs0DDQ
	 j3hZ2GsZLN9EA==
Date: Wed, 20 Apr 2022 14:08:04 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Wei Chen <Wei.Chen@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "julien@xen.org" <julien@xen.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Penny Zheng <Penny.Zheng@arm.com>
Subject: RE: Proposal for Porting Xen to Armv8-R64 - DraftB
In-Reply-To: <PAXPR08MB742058D3041BA2D97AA05F1D9EF59@PAXPR08MB7420.eurprd08.prod.outlook.com>
Message-ID: <alpine.DEB.2.22.394.2204201403180.915916@ubuntu-linux-20-04-desktop>
References: <PAXPR08MB742064F5F00A18E09DEF66B69E1A9@PAXPR08MB7420.eurprd08.prod.outlook.com> <alpine.DEB.2.22.394.2204141613340.915916@ubuntu-linux-20-04-desktop> <PAXPR08MB7420786607A15FA5027BF4579EF29@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2204191752390.915916@ubuntu-linux-20-04-desktop> <PAXPR08MB742058D3041BA2D97AA05F1D9EF59@PAXPR08MB7420.eurprd08.prod.outlook.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 20 Apr 2022, Wei Chen wrote:
> > On Tue, 19 Apr 2022, Wei Chen wrote:
> > > > > ### 3.2. Xen Event Channel Support
> > > > >     In Current RFC patches we haven't enabled the event channel
> > support.
> > > > >     But I think it's good opportunity to do some discussion in
> > advanced.
> > > > >     On Armv8-R, all VMs are native direct-map, because there is no
> > > > stage2
> > > > >     MMU translation. Current event channel implementation depends on
> > > > some
> > > > >     shared pages between Xen and guest: `shared_info` and per-cpu
> > > > `vcpu_info`.
> > > > >
> > > > >     For `shared_info`, in current implementation, Xen will allocate
> > a
> > > > page
> > > > >     from heap for `shared_info` to store initial meta data. When
> > guest
> > > > is
> > > > >     trying to setup `shared_info`, it will allocate a free gfn and
> > use a
> > > > >     hypercall to setup P2M mapping between gfn and `shared_info`.
> > > > >
> > > > >     For direct-mapping VM, this will break the direct-mapping
> > concept.
> > > > >     And on an MPU based system, like Armv8-R system, this operation
> > will
> > > > >     be very unfriendly. Xen need to pop `shared_info` page from Xen
> > heap
> > > > >     and insert it to VM P2M pages. If this page is in the middle of
> > > > >     Xen heap, this means Xen need to split current heap and use
> > extra
> > > > >     MPU regions. Also for the P2M part, this page is unlikely to
> > form
> > > > >     a new continuous memory region with the existing p2m pages, and
> > Xen
> > > > >     is likely to need another additional MPU region to set it up,
> > which
> > > > >     is obviously a waste for limited MPU regions. And This kind of
> > > > dynamic
> > > > >     is quite hard to imagine on an MPU system.
> > > >
> > > > Yeah, it doesn't make any sense for MPU systems
> > > >
> > > >
> > > > >     For `vcpu_info`, in current implementation, Xen will store
> > > > `vcpu_info`
> > > > >     meta data for all vCPUs in `shared_info`. When guest is trying
> > to
> > > > setup
> > > > >     `vcpu_info`, it will allocate memory for `vcpu_info` from guest
> > side.
> > > > >     And then guest will use hypercall to copy meta data from
> > > > `shared_info`
> > > > >     to guest page. After that both Xen `vcpu_info` and guest
> > `vcpu_info`
> > > > >     are pointed to the same page that allocated by guest.
> > > > >
> > > > >     This implementation has serval benifits:
> > > > >     1. There is no waste memory. No extra memory will be allocated
> > from
> > > > Xen heap.
> > > > >     2. There is no P2M remap. This will not break the direct-mapping,
> > > > and
> > > > >        is MPU system friendly.
> > > > >     So, on Armv8-R system, we can still keep current implementation
> > for
> > > > >     per-cpu `vcpu_info`.
> > > > >
> > > > >     So, our proposal is that, can we reuse current implementation
> > idea
> > > > of
> > > > >     `vcpu_info` for `shared_info`? We still allocate one page for
> > > > >     `d->shared_info` at domain construction for holding some initial
> > > > meta-data,
> > > > >     using alloc_domheap_pages instead of alloc_xenheap_pages and
> > > > >     share_xen_page_with_guest. And when guest allocates a page for
> > > > >     `shared_info` and use hypercall to setup it,  We copy the
> > initial
> > > > data from
> > > > >     `d->shared_info` to it. And after copy we can update `d-
> > > > >shared_info` to point
> > > > >     to guest allocated 'shared_info' page. In this case, we don't
> > have
> > > > to think
> > > > >     about the fragmentation of Xen heap and p2m and the extra MPU
> > > > regions.
> > > >
> > > > Yes, I think that would work.
> > > >
> > > > Also I think it should be possible to get rid of the initial
> > > > d->shared_info allocation in Xen, given that d->shared_info is for the
> > > > benefit of the guest and the guest cannot access it until it makes the
> > > > XENMAPSPACE_shared_info hypercall.
> > > >
> > >
> > > While we're working on event channel PoC work on Xen Armv8-R, we found
> > > another issue after we dropped d->shared_info allocation in Xen. Both
> > > shared_info and vcpu_info are allocated from Guest in runtime. That
> > > means the addresses of shared_info and vcpu_info are random. For MMU
> > > system, this is OK, because Xen has a full view of system memory in
> > > runtime. But for MPU system, the situation becomes a little tricky.
> > > We have to setup extra MPU regions for remote domains' shared_info
> > > and vcpu_info in event channel hypercall runtime. That's because
> > > in current Xen hypercall concept, hypercall will not cause vCPU
> > > context switch. When hypercall trap to EL2, it will keep vCPU's
> > > P2M view. For MMU system, we have vttbr_el2 for vCPU P2M view and
> > > ttbr_el2 for Xen view. So in EL2 Xen has full permissions to access
> > > any memory it wants. But for MPU system, we only have one EL2 MPU.
> > > Before entering guest, Xen will setup vCPU P2M view in EL2 MPU.
> > > In this case, when system entry EL2 through hypercall, the EL2
> > > MPU still keeps current vCPU P2M view and with Xen essential
> > > memory (code, data, heap) access permissions. But current EL2 MPU
> > > doesn't have the access permissions for EL2 to access other
> > > domain's memory. For an event channel hypercall, if we want to
> > > update the pending bitmap in remote domain's vcpu_info, it will
> > > cause a dataabort in EL2. To solve this dataabort, we may have
> > > two methods:
> > > 1. Map remote domain's whole memory or pages for shared_info +
> > >    vcpu_info in EL2 MPU temporarily for hypercall to update
> > >    pending bits or other accesses.
> > >
> > >    This method doesn't need to do context switch for EL2 MPU,
> > >    But this method has some disadvantages:
> > >    1. We have to reserve MPU regions for hypercall.
> > >    2. Different hypercall may have different reservation of
> > >       MPU regions.
> > >    3. We have to handle hypercall one by one for existed and
> > >       new in future.
> > >
> > > 2. Switch to Xen's memory view in EL2 MPU when trap from EL1 to
> > >    EL2. In this case, Xen will have full memory access permissions
> > >    to update pending bits in EL2. This only changes the EL2 MPU
> > >    context, does not need to do vCPU context switch. Because the
> > >    trapped vCPU will be used in the full flow of hypercall. After
> > >    the hypercall, before returning to EL2, the EL2 MPU will switch
> > >    to scheduled vCPU' P2M view.
> > >    This method needs to do EL2 MPU context switch, but:
> > >    1. We don't need to reserve MPU regions for Xen's memory view.
> > >       (Xen's memory view has been setup while initialization)
> > >    2. We don't need to handle pages' mapping in hypercall level.
> > >    3. Apply to other EL1 to EL2 traps, like dataabort, IRQ, etc.
> > 
> > 
> > Both approach 1) and 2) are acceptable and in fact I think we'll
> > probably have to do a combination of both.
> > 
> > We don't need to do a full MPU context switch every time we enter Xen.
> > We can be flexible. Only when Xen needs to access another guest memory,
> > if the memory is not mappable using approach 1), Xen could do a full MPU
> > context switch. Basically, try 1) first, if it is not possible, do 2).
> > 
> > This also solves the problem of "other hypercalls". We can always do 2)
> > if we cannot do 1).
> > 
> > So do we need to do 1) at all? It really depends on performance data.
> > Not all hypercalls are made equal. Some are very rare and it is fine if
> > they are slow. Some hypercalls are actually on the hot path. The event
> > channels hypercalls are on the hot path so they need to be fast. It
> > makes sense to implement 1) just for event channels hypercalls if the
> > MPU context switch is slow.
> > 
> > Data would help a lot here to make a good decision. Specifically, how
> > much more expensive is an EL2 MPU context switch compared to add/remove
> > of an MPU region in nanosec or cpu cycles?
> > 
> 
> We will do it when we get a proper platform.
> 
> > 
> > The other aspect is how many extra MPU regions do we need for each guest
> > to implement 1). Do we need one extra MPU region for each domU? If so, I
> > don't think approach 1) if feasible unless we come up with a smart
> > memory allocation scheme for shared_info and vcpu_info. For instance, if
> > shared_info and vcpu_info of all guests were part of the Xen data or
> > heap region, or 1 other special MPU region, then they could become
> > immediately accessible without need for extra mappings when switching to
> > EL2.
> > 
> 
> Allocate shared_info and vcpu_info from Xen data or heap will cause memory
> fragmentation. We have to split the Xen data or heap and populate the pages
> for shared_info and vcpu_info, And insert them to Guest P2M. Because Armv8-R
> MPU doesn't allow memory overlap, this will cause at least 2 extra MPU
> regions usage. One page could not exist in Xen MPU region and Guest P2M
> MPU region at the same time. And we definitely don't want to make the entire
> Xen data and heap accessible to EL1. And this approach does not solve the
> 100% direct mapping problem. A special MPU region might have the same issues.
> Except we make this special MPU region can be accessed in EL1 and EL2 at
> runtime (it's unsafe), and update hypercall to use pages from this special
> region for shared_info and vcpu_info (every guest can see this region, so
> it's still 1:1 mapping).
> 
> For 1), the concern is caused by our current rough PoC, we used extra MPU
> regions to map the whole memory of remote domain, whose may have serval
> memory blocks in the worst case. We have thought it further, we can reduce
> the map granularity to page. For example, Xen wants to update shared_info
> or vcpu_info, Xen must know the address of it. So we can just map this
> one page temporarily. So I think only reserve 1 MPU region for runtime
> mapping is feasible on most platforms.

Actually I think that it would be great if we can do that. It looks like
the best way forward.


> But the additional problem with this is that if the hypercall are
> modifying multiple variables, Xen may need to do multiple mappings if
> they are not on the same page (or a proper MPU region range).

There are not that many hypercalls that require Xen to map multiple
pages, and those might be OK if they are slow.

