Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 752C32FDE2B
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 01:53:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71832.128965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2ODV-0008Jc-KT; Thu, 21 Jan 2021 00:52:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71832.128965; Thu, 21 Jan 2021 00:52:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2ODV-0008JD-HA; Thu, 21 Jan 2021 00:52:53 +0000
Received: by outflank-mailman (input) for mailman id 71832;
 Thu, 21 Jan 2021 00:52:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mrjv=GY=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l2ODT-0008J8-U0
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 00:52:52 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f5f32c94-0729-45f4-96ba-64d55a571c50;
 Thu, 21 Jan 2021 00:52:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CBB8A2342C;
 Thu, 21 Jan 2021 00:52:49 +0000 (UTC)
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
X-Inumbo-ID: f5f32c94-0729-45f4-96ba-64d55a571c50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611190370;
	bh=ub9lNgY+BafGj6DquS5fah7lla91R+VkLKD8ZoqVsKQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HqZesjpW/Oi9Z48XnboCbY53zOQ2J69aiwAMA5myNOUTeZkBmTfFWThFiyDI24pKD
	 4SX7/Hv5V2B2BNwhvv8hgxiw4Zo22P7IjWIUlfVLA1SSdincwD2p/fU/2y34nkoVOa
	 mToBeCkjYLVympnxxNbxotxC6Ga3POAdt0cE1RhP0tsTfTFwVWTkZyx2UbSOvYfFYr
	 LYvXhkJcNOxwjzO8SlQErjvxQsbFzWORyP0YRrPrX/onNp13OxLhwwaJlIp3MC1Kn8
	 gJ466y75W0EkxJRb4ImKruwItuznShaJnC+mklw7jDzsRcjOIuanFtHQP9eRy6ZF3s
	 AW268eHi+ALyw==
Date: Wed, 20 Jan 2021 16:52:49 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
cc: Julien Grall <julien@xen.org>, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Julien Grall <jgrall@amazon.com>, Dario Faggioli <dario.faggioli@suse.com>, 
    "Bertrand.Marquis@arm.com" <Bertrand.Marquis@arm.com>, 
    "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Subject: Re: IRQ latency measurements in hypervisor
In-Reply-To: <87im7r2otp.fsf@epam.com>
Message-ID: <alpine.DEB.2.21.2101201645540.14528@sstabellini-ThinkPad-T480s>
References: <87pn294szv.fsf@epam.com> <alpine.DEB.2.21.2101141515230.31265@sstabellini-ThinkPad-T480s> <f31c9cca-0275-eaef-5fcd-c8484d4b5da0@xen.org> <87wnwe2ogp.fsf@epam.com> <187995c9-78f4-0a1c-d912-ca5100d07321@xen.org> <87im7r2otp.fsf@epam.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 20 Jan 2021, Volodymyr Babchuk wrote:
> > On 15/01/2021 15:45, Volodymyr Babchuk wrote:
> >> Hi Julien,
> >> Julien Grall writes:
> >> 
> >>> Hi Volodymyr, Stefano,
> >>>
> >>> On 14/01/2021 23:33, Stefano Stabellini wrote:
> >>>> + Bertrand, Andrew (see comment on alloc_heap_pages())
> >>>
> >>> Long running hypercalls are usually considered security issues.
> >>>
> >>> In this case, only the control domain can issue large memory
> >>> allocation (2GB at a time). Guest, would only be able to allocate 2MB
> >>> at the time, so from the numbers below, it would only take 1ms max.
> >>>
> >>> So I think we are fine here. Next time, you find a large loop, please
> >>> provide an explanation why they are not security issues (e.g. cannot
> >>> be used by guests) or send an email to the Security Team in doubt.
> >> Sure. In this case I took into account that only control domain can
> >> issue this call, I just didn't stated this explicitly. Next time will
> >> do.
> >
> > I am afraid that's not correct. The guest can request to populate a
> > region. This is used for instance in the ballooning case.
> >
> > The main difference is a non-privileged guest will not be able to do
> > allocation larger than 2MB.
> 
> I did some measurements. According to them allocation of order 9 takes
> about 265us on my HW. I covered this in detail at the end of email.

That's really a lot! :-(


> >>>> This is very interestingi too. Did you get any spikes with the
> >>>> period
> >>>> set to 100us? It would be fantastic if there were none.
> >>>>
> >>>>> 3. Huge latency spike during domain creation. I conducted some
> >>>>>      additional tests, including use of PV drivers, but this didn't
> >>>>>      affected the latency in my "real time" domain. But attempt to
> >>>>>      create another domain with relatively large memory size of 2GB led
> >>>>>      to huge spike in latency. Debugging led to this call path:
> >>>>>
> >>>>>      XENMEM_populate_physmap -> populate_physmap() ->
> >>>>>      alloc_domheap_pages() -> alloc_heap_pages()-> huge
> >>>>>      "for ( i = 0; i < (1 << order); i++ )" loop.
> >>>
> >>> There are two for loops in alloc_heap_pages() using this syntax. Which
> >>> one are your referring to?
> >> I did some tracing with Lautrebach. It pointed to the first loop and
> >> especially to flush_page_to_ram() call if I remember correctly.
> >
> > Thanks, I am not entirely surprised because we are clean and
> > invalidating the region line by line and across all the CPUs.
> >
> > If we are assuming 128 bytes cacheline, we will need to issue 32 cache
> > instructions per page. This going to involve quite a bit of traffic on 
> > the system.
> >
> > One possibility would be to defer the cache flush when the domain is
> > created and use the hypercall XEN_DOMCTL_cacheflush to issue the
> > flush.
> 
> Can we flush caches on first access to a page? What I mean - do not
> populate stage 2 tables with allocated memory. Flush caches in abort
> handler and then populate them.

Yes, it should be possible with populate on demand. I'll let Julien
reply as he has direct experience with it on ARM.


> > Note that XEN_DOMCTL_cacheflush would need some modification to be
> > preemptible. But at least, it will work on a GFN which is easier to
> > track.

XEN_DOMCTL_cacheflush is a very viable option. The memory allocation is
requested by the toolstack, right? So adding one more call to do the
cacheflush after the memory allocation should be easy. Then, we could
turn the one massive XEN_DOMCTL_cacheflush hypercall into multiple
smaller calls to solve the latency issue.
 
 
> >>>>> I managed to overcome the issue #3 by commenting out all calls to
> >>>>> populate_one_size() except the populate_one_size(PFN_4K_SHIFT) in
> >>>>> xg_dom_arm.c. This lengthened domain construction, but my "RT" domain
> >>>>> didn't experienced so big latency issues. Apparently all other
> >>>>> hypercalls which are used during domain creation are either fast or
> >>>>> preemptible. No doubts that my hack lead to page tables inflation and
> >>>>> overall performance drop.
> >>>> I think we need to follow this up and fix this. Maybe just by adding
> >>>> a hypercall continuation to the loop.
> >>>
> >>> When I read "hypercall continuation", I read we will return to the
> >>> guest context so it can process interrupts and potentially switch to
> >>> another task.
> >>>
> >>> This means that the guest could issue a second populate_physmap() from
> >>> the vCPU. Therefore any restart information should be part of the
> >>> hypercall parameters. So far, I don't see how this would be possible.
> >>>
> >>> Even if we overcome that part, this can be easily abuse by a guest as
> >>> the memory is not yet accounted to the domain. Imagine a guest that
> >>> never request the continuation of the populate_physmap(). So we would
> >>> need to block the vCPU until the allocation is finished.
> >> Moreover, most of the alloc_heap_pages() sits under spinlock, so
> >> first
> >> step would be to split this function into smaller atomic parts.
> >
> > Do you have any suggestion how to split it?
> >
> 
> Well, it  is quite complex function and I can't tell right away.
> At this time I don't quite understand why spin_unlock() is called after
> the first (1 << order) loop for instance.
> 
> Also, this function does many different things for its simple name.
> 
> >> 
> >>> I think the first step is we need to figure out which part of the
> >>> allocation is slow (see my question above). From there, we can figure
> >>> out if there is a way to reduce the impact.
> >> I'll do more tracing and will return with more accurate numbers. 
> >> But as far as I can see, any loop on 262144 pages will take some time..
> > .
> >
> > It really depends on the content of the loop. On any modern
> > processors, you are very likely not going to notice a loop that update
> > just a flag.
> >
> > However, you are likely going to be see an impact if your loop is
> > going to clean & invalidate the cache for each page.
> >
> 
> Totally agree. I used Xen tracing subsystem to do the measurements and I
> can confirm that call to flush_page_to_ram() causes most of the impact.

Thanks for verifying it, this is very useful. Now we know the biggest
issue to tackle.


 
> There is the details:
> 
> 
> I added number of tracing points to the function:
> 
> static struct page_info *alloc_heap_pages(
>     unsigned int zone_lo, unsigned int zone_hi,
>     unsigned int order, unsigned int memflags,
>     struct domain *d)
> {
>     nodeid_t node;
>     unsigned int i, buddy_order, zone, first_dirty;
>     unsigned long request = 1UL << order;
>     struct page_info *pg;
>     bool need_tlbflush = false;
>     uint32_t tlbflush_timestamp = 0;
>     unsigned int dirty_cnt = 0;
> 
>     /* Make sure there are enough bits in memflags for nodeID. */
>     BUILD_BUG_ON((_MEMF_bits - _MEMF_node) < (8 * sizeof(nodeid_t)));
> 
>     ASSERT(zone_lo <= zone_hi);
>     ASSERT(zone_hi < NR_ZONES);
> 
>     if ( unlikely(order > MAX_ORDER) )
>         return NULL;
> 
>     spin_lock(&heap_lock);
> 
>     TRACE_1D(TRC_PGALLOC_PT1, order); // <=================================
> 
>     /*
>      * Claimed memory is considered unavailable unless the request
>      * is made by a domain with sufficient unclaimed pages.
>      */
>     if ( (outstanding_claims + request > total_avail_pages) &&
>           ((memflags & MEMF_no_refcount) ||
>            !d || d->outstanding_pages < request) )
>     {
>         spin_unlock(&heap_lock);
>         return NULL;
>     }
> 
>     pg = get_free_buddy(zone_lo, zone_hi, order, memflags, d);
>     /* Try getting a dirty buddy if we couldn't get a clean one. */
>     if ( !pg && !(memflags & MEMF_no_scrub) )
>         pg = get_free_buddy(zone_lo, zone_hi, order,
>                             memflags | MEMF_no_scrub, d);
>     if ( !pg )
>     {
>         /* No suitable memory blocks. Fail the request. */
>         spin_unlock(&heap_lock);
>         return NULL;
>     }
> 
>     TRACE_0D(TRC_PGALLOC_PT2); // <=================================
> 
>     node = phys_to_nid(page_to_maddr(pg));
>     zone = page_to_zone(pg);
>     buddy_order = PFN_ORDER(pg);
> 
>     first_dirty = pg->u.free.first_dirty;
> 
>     /* We may have to halve the chunk a number of times. */
>     while ( buddy_order != order )
>     {
>         buddy_order--;
>         page_list_add_scrub(pg, node, zone, buddy_order,
>                             (1U << buddy_order) > first_dirty ?
>                             first_dirty : INVALID_DIRTY_IDX);
>         pg += 1U << buddy_order;
> 
>         if ( first_dirty != INVALID_DIRTY_IDX )
>         {
>             /* Adjust first_dirty */
>             if ( first_dirty >= 1U << buddy_order )
>                 first_dirty -= 1U << buddy_order;
>             else
>                 first_dirty = 0; /* We've moved past original first_dirty */
>         }
>     }
> 
>     TRACE_0D(TRC_PGALLOC_PT3); // <=================================
> 
>     ASSERT(avail[node][zone] >= request);
>     avail[node][zone] -= request;
>     total_avail_pages -= request;
>     ASSERT(total_avail_pages >= 0);
> 
>     check_low_mem_virq();
> 
>     if ( d != NULL )
>         d->last_alloc_node = node;
> 
>     for ( i = 0; i < (1 << order); i++ )
>     {
>         /* Reference count must continuously be zero for free pages. */
>         if ( (pg[i].count_info & ~PGC_need_scrub) != PGC_state_free )
>         {
>             printk(XENLOG_ERR
>                    "pg[%u] MFN %"PRI_mfn" c=%#lx o=%u v=%#lx t=%#x\n",
>                    i, mfn_x(page_to_mfn(pg + i)),
>                    pg[i].count_info, pg[i].v.free.order,
>                    pg[i].u.free.val, pg[i].tlbflush_timestamp);
>             BUG();
>         }
> 
>         /* PGC_need_scrub can only be set if first_dirty is valid */
>         ASSERT(first_dirty != INVALID_DIRTY_IDX || !(pg[i].count_info & PGC_need_scrub));
> 
>         /* Preserve PGC_need_scrub so we can check it after lock is dropped. */
>         pg[i].count_info = PGC_state_inuse | (pg[i].count_info & PGC_need_scrub);
> 
>         if ( !(memflags & MEMF_no_tlbflush) )
>             accumulate_tlbflush(&need_tlbflush, &pg[i],
>                                 &tlbflush_timestamp);
> 
>         /* Initialise fields which have other uses for free pages. */
>         pg[i].u.inuse.type_info = 0;
>         page_set_owner(&pg[i], NULL);
> 
>         /* Ensure cache and RAM are consistent for platforms where the
>          * guest can control its own visibility of/through the cache.
>          */
>         flush_page_to_ram(mfn_x(page_to_mfn(&pg[i])),
>                           !(memflags & MEMF_no_icache_flush));
>     }
> 
>     TRACE_0D(TRC_PGALLOC_PT4); // <=================================
>     spin_unlock(&heap_lock);
> 
>     if ( first_dirty != INVALID_DIRTY_IDX ||
>          (scrub_debug && !(memflags & MEMF_no_scrub)) )
>     {
>         for ( i = 0; i < (1U << order); i++ )
>         {
>             if ( test_bit(_PGC_need_scrub, &pg[i].count_info) )
>             {
>                 if ( !(memflags & MEMF_no_scrub) )
>                     scrub_one_page(&pg[i]);
> 
>                 dirty_cnt++;
> 
>                 spin_lock(&heap_lock);
>                 pg[i].count_info &= ~PGC_need_scrub;
>                 spin_unlock(&heap_lock);
>             }
>             else if ( !(memflags & MEMF_no_scrub) )
>                 check_one_page(&pg[i]);
>         }
> 
>         if ( dirty_cnt )
>         {
>             spin_lock(&heap_lock);
>             node_need_scrub[node] -= dirty_cnt;
>             spin_unlock(&heap_lock);
>         }
>     }
> 
>     TRACE_0D(TRC_PGALLOC_PT5); // <=================================
>     if ( need_tlbflush )
>         filtered_flush_tlb_mask(tlbflush_timestamp);
> 
>     TRACE_0D(TRC_PGALLOC_PT6); // <=================================
> 
>     return pg;
> }
> 
> 
> And wrote a simple Python scripts that parses the output of
> xentrace. There are results for different orders:
> 
>   46.842032: page_alloc trace point 1. Order: 18
>   46.842035: page_alloc trace point 2 (+   0.000003)
>   46.842035: page_alloc trace point 3 (+   0.000000)
>   46.975105: page_alloc trace point 4 (+   0.133069)
>   46.975106: page_alloc trace point 5 (+   0.000001)
>   46.975106: page_alloc trace point 6 (+   0.000000): total:    0.133074
> 
>   46.998536: page_alloc trace point 1. Order: 9
>   46.998538: page_alloc trace point 2 (+   0.000002)
>   46.998540: page_alloc trace point 3 (+   0.000001)
>   46.998799: page_alloc trace point 4 (+   0.000259)
>   46.998800: page_alloc trace point 5 (+   0.000000)
>   46.998800: page_alloc trace point 6 (+   0.000000): total:    0.000264
> 
>   46.835802: page_alloc trace point 1. Order: 3
>   46.835803: page_alloc trace point 2 (+   0.000000)
>   46.835803: page_alloc trace point 3 (+   0.000000)
>   46.835812: page_alloc trace point 4 (+   0.000009)
>   46.835813: page_alloc trace point 5 (+   0.000000)
>   46.835813: page_alloc trace point 6 (+   0.000001): total:    0.000011
> 
>   46.998815: page_alloc trace point 1. Order: 0
>   46.998816: page_alloc trace point 2 (+   0.000002)
>   46.998817: page_alloc trace point 3 (+   0.000000)
>   46.998818: page_alloc trace point 4 (+   0.000002)
>   46.998819: page_alloc trace point 5 (+   0.000001)
>   46.998819: page_alloc trace point 6 (+   0.000000): total:    0.000005
> 
> Then I commented out call to flush_page_to_ram() and got the following
> results:
> 
>  149.561902: page_alloc trace point 1. Order: 18
>  149.561905: page_alloc trace point 2 (+   0.000003)
>  149.561905: page_alloc trace point 3 (+   0.000000)
>  149.569450: page_alloc trace point 4 (+   0.007545)
>  149.569451: page_alloc trace point 5 (+   0.000001)
>  149.569452: page_alloc trace point 6 (+   0.000000): total:    0.007550
> 
>  149.592624: page_alloc trace point 1. Order: 9
>  149.592626: page_alloc trace point 2 (+   0.000003)
>  149.592627: page_alloc trace point 3 (+   0.000001)
>  149.592639: page_alloc trace point 4 (+   0.000012)
>  149.592639: page_alloc trace point 5 (+   0.000000)
>  149.592640: page_alloc trace point 6 (+   0.000000): total:    0.000016
> 
> All time units are seconds, by the way.
> 
> 
> -- 
> Volodymyr Babchuk at EPAM

