Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8A42FF6AA
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 22:02:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72402.130326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2h5N-0002V1-7S; Thu, 21 Jan 2021 21:01:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72402.130326; Thu, 21 Jan 2021 21:01:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2h5N-0002Ub-2z; Thu, 21 Jan 2021 21:01:45 +0000
Received: by outflank-mailman (input) for mailman id 72402;
 Thu, 21 Jan 2021 21:01:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l2h5L-0002UW-IB
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 21:01:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l2h5E-0000eO-Cd; Thu, 21 Jan 2021 21:01:36 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l2h5E-0002Hx-1J; Thu, 21 Jan 2021 21:01:36 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=iXhL/eCStt7EY6FYcLQ/SPkgtow3e6tloMyLcZwewWY=; b=M3We2gUjniyHkFUKm4I0ZLuA48
	qW0LcR8lN8211Eor/Sy9suyolJVKn7BR1rpgpiVCfyRRb7+pR6wQtLU1sCf9PaQshm4hNA3l/916Q
	vrcrgzIoTt2wlJLQhZMzgYi0kgsG6x1EjngcNGKmf31rGEsVrdMe1isGILSKvuEVfZWY=;
Subject: Re: IRQ latency measurements in hypervisor
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Stefano Stabellini <stefano.stabellini@xilinx.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <jgrall@amazon.com>, Dario Faggioli <dario.faggioli@suse.com>,
 "Bertrand.Marquis@arm.com" <Bertrand.Marquis@arm.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
References: <87pn294szv.fsf@epam.com>
 <alpine.DEB.2.21.2101141515230.31265@sstabellini-ThinkPad-T480s>
 <f31c9cca-0275-eaef-5fcd-c8484d4b5da0@xen.org> <87wnwe2ogp.fsf@epam.com>
 <187995c9-78f4-0a1c-d912-ca5100d07321@xen.org> <87im7r2otp.fsf@epam.com>
From: Julien Grall <julien@xen.org>
Message-ID: <db4923e1-e928-824f-1e16-f787de74c53f@xen.org>
Date: Thu, 21 Jan 2021 21:01:34 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <87im7r2otp.fsf@epam.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Volodymir,

On 20/01/2021 23:03, Volodymyr Babchuk wrote:
> Julien Grall writes:
>>>>> This is very interestingi too. Did you get any spikes with the
>>>>> period
>>>>> set to 100us? It would be fantastic if there were none.
>>>>>
>>>>>> 3. Huge latency spike during domain creation. I conducted some
>>>>>>       additional tests, including use of PV drivers, but this didn't
>>>>>>       affected the latency in my "real time" domain. But attempt to
>>>>>>       create another domain with relatively large memory size of 2GB led
>>>>>>       to huge spike in latency. Debugging led to this call path:
>>>>>>
>>>>>>       XENMEM_populate_physmap -> populate_physmap() ->
>>>>>>       alloc_domheap_pages() -> alloc_heap_pages()-> huge
>>>>>>       "for ( i = 0; i < (1 << order); i++ )" loop.
>>>>
>>>> There are two for loops in alloc_heap_pages() using this syntax. Which
>>>> one are your referring to?
>>> I did some tracing with Lautrebach. It pointed to the first loop and
>>> especially to flush_page_to_ram() call if I remember correctly.
>>
>> Thanks, I am not entirely surprised because we are clean and
>> invalidating the region line by line and across all the CPUs.
>>
>> If we are assuming 128 bytes cacheline, we will need to issue 32 cache
>> instructions per page. This going to involve quite a bit of traffic on
>> the system.
>>
>> One possibility would be to defer the cache flush when the domain is
>> created and use the hypercall XEN_DOMCTL_cacheflush to issue the
>> flush.
> 
> Can we flush caches on first access to a page? What I mean - do not
> populate stage 2 tables with allocated memory. Flush caches in abort
> handler and then populate them.

We are using a similar approach for implementing set/way but it only 
works as long as you don't assign a device (with or without an IOMMU).

Currently, it is quite uncommon to have device that are able to restart 
a DMA transaction after faulting. So we would not be able to share the 
P2M with IOMMU if we populate the P2M on the first access (a device may 
be the first to access the memory).

Even if we decided to unshare the P2M, there would still be a trust 
problem if the device is non-coherent (i.e. it cannot snoop the cache).

The same can be said if you are not protecting the device with an IOMMU 
(you may have an MPU or something different on the system).

The only case where we could possibly disable the flush is when your 
memory is statically partionned as the guest would always receive the 
same pages.

[...]

>>
>> Do you have any suggestion how to split it?
>>
> 
> Well, it  is quite complex function and I can't tell right away.
> At this time I don't quite understand why spin_unlock() is called after
> the first (1 << order) loop for instance.

The part after the spin lock will check whether the pages are scrubbed. 
As the content of the pages cannot be touched by someone else (we made 
sure the scrub task removed them from its list). Therefore, the 
operation is fine to be called without the heap_lock held.

> 
> Also, this function does many different things for its simple name.

Everything in this function needs to happen before the page can safely 
be handed out to another part of Xen or a guest. AFAICT, the only thing 
that can possibly be split out is the call to flush_page_to_ram().

> 
>>>
>>>> I think the first step is we need to figure out which part of the
>>>> allocation is slow (see my question above). From there, we can figure
>>>> out if there is a way to reduce the impact.
>>> I'll do more tracing and will return with more accurate numbers.
>>> But as far as I can see, any loop on 262144 pages will take some time..
>> .
>>
>> It really depends on the content of the loop. On any modern
>> processors, you are very likely not going to notice a loop that update
>> just a flag.
>>
>> However, you are likely going to be see an impact if your loop is
>> going to clean & invalidate the cache for each page.
>>
> 
> Totally agree. I used Xen tracing subsystem to do the measurements and I
> can confirm that call to flush_page_to_ram() causes most of the impact.
> 
> 
> There is the details:
> 
> 
> I added number of tracing points to the function:
> 
> static struct page_info *alloc_heap_pages(
>      unsigned int zone_lo, unsigned int zone_hi,
>      unsigned int order, unsigned int memflags,
>      struct domain *d)
> {
>      nodeid_t node;
>      unsigned int i, buddy_order, zone, first_dirty;
>      unsigned long request = 1UL << order;
>      struct page_info *pg;
>      bool need_tlbflush = false;
>      uint32_t tlbflush_timestamp = 0;
>      unsigned int dirty_cnt = 0;
> 
>      /* Make sure there are enough bits in memflags for nodeID. */
>      BUILD_BUG_ON((_MEMF_bits - _MEMF_node) < (8 * sizeof(nodeid_t)));
> 
>      ASSERT(zone_lo <= zone_hi);
>      ASSERT(zone_hi < NR_ZONES);
> 
>      if ( unlikely(order > MAX_ORDER) )
>          return NULL;
> 
>      spin_lock(&heap_lock);
> 
>      TRACE_1D(TRC_PGALLOC_PT1, order); // <=================================
> 
>      /*
>       * Claimed memory is considered unavailable unless the request
>       * is made by a domain with sufficient unclaimed pages.
>       */
>      if ( (outstanding_claims + request > total_avail_pages) &&
>            ((memflags & MEMF_no_refcount) ||
>             !d || d->outstanding_pages < request) )
>      {
>          spin_unlock(&heap_lock);
>          return NULL;
>      }
> 
>      pg = get_free_buddy(zone_lo, zone_hi, order, memflags, d);
>      /* Try getting a dirty buddy if we couldn't get a clean one. */
>      if ( !pg && !(memflags & MEMF_no_scrub) )
>          pg = get_free_buddy(zone_lo, zone_hi, order,
>                              memflags | MEMF_no_scrub, d);
>      if ( !pg )
>      {
>          /* No suitable memory blocks. Fail the request. */
>          spin_unlock(&heap_lock);
>          return NULL;
>      }
> 
>      TRACE_0D(TRC_PGALLOC_PT2); // <=================================
> 
>      node = phys_to_nid(page_to_maddr(pg));
>      zone = page_to_zone(pg);
>      buddy_order = PFN_ORDER(pg);
> 
>      first_dirty = pg->u.free.first_dirty;
> 
>      /* We may have to halve the chunk a number of times. */
>      while ( buddy_order != order )
>      {
>          buddy_order--;
>          page_list_add_scrub(pg, node, zone, buddy_order,
>                              (1U << buddy_order) > first_dirty ?
>                              first_dirty : INVALID_DIRTY_IDX);
>          pg += 1U << buddy_order;
> 
>          if ( first_dirty != INVALID_DIRTY_IDX )
>          {
>              /* Adjust first_dirty */
>              if ( first_dirty >= 1U << buddy_order )
>                  first_dirty -= 1U << buddy_order;
>              else
>                  first_dirty = 0; /* We've moved past original first_dirty */
>          }
>      }
> 
>      TRACE_0D(TRC_PGALLOC_PT3); // <=================================
> 
>      ASSERT(avail[node][zone] >= request);
>      avail[node][zone] -= request;
>      total_avail_pages -= request;
>      ASSERT(total_avail_pages >= 0);
> 
>      check_low_mem_virq();
> 
>      if ( d != NULL )
>          d->last_alloc_node = node;
> 
>      for ( i = 0; i < (1 << order); i++ )
>      {
>          /* Reference count must continuously be zero for free pages. */
>          if ( (pg[i].count_info & ~PGC_need_scrub) != PGC_state_free )
>          {
>              printk(XENLOG_ERR
>                     "pg[%u] MFN %"PRI_mfn" c=%#lx o=%u v=%#lx t=%#x\n",
>                     i, mfn_x(page_to_mfn(pg + i)),
>                     pg[i].count_info, pg[i].v.free.order,
>                     pg[i].u.free.val, pg[i].tlbflush_timestamp);
>              BUG();
>          }
> 
>          /* PGC_need_scrub can only be set if first_dirty is valid */
>          ASSERT(first_dirty != INVALID_DIRTY_IDX || !(pg[i].count_info & PGC_need_scrub));
> 
>          /* Preserve PGC_need_scrub so we can check it after lock is dropped. */
>          pg[i].count_info = PGC_state_inuse | (pg[i].count_info & PGC_need_scrub);
> 
>          if ( !(memflags & MEMF_no_tlbflush) )
>              accumulate_tlbflush(&need_tlbflush, &pg[i],
>                                  &tlbflush_timestamp);
> 
>          /* Initialise fields which have other uses for free pages. */
>          pg[i].u.inuse.type_info = 0;
>          page_set_owner(&pg[i], NULL);
> 
>          /* Ensure cache and RAM are consistent for platforms where the
>           * guest can control its own visibility of/through the cache.
>           */
>          flush_page_to_ram(mfn_x(page_to_mfn(&pg[i])),
>                            !(memflags & MEMF_no_icache_flush));
>      }
> 
>      TRACE_0D(TRC_PGALLOC_PT4); // <=================================
>      spin_unlock(&heap_lock);
> 
>      if ( first_dirty != INVALID_DIRTY_IDX ||
>           (scrub_debug && !(memflags & MEMF_no_scrub)) )
>      {
>          for ( i = 0; i < (1U << order); i++ )
>          {
>              if ( test_bit(_PGC_need_scrub, &pg[i].count_info) )
>              {
>                  if ( !(memflags & MEMF_no_scrub) )
>                      scrub_one_page(&pg[i]);
> 
>                  dirty_cnt++;
> 
>                  spin_lock(&heap_lock);
>                  pg[i].count_info &= ~PGC_need_scrub;
>                  spin_unlock(&heap_lock);
>              }
>              else if ( !(memflags & MEMF_no_scrub) )
>                  check_one_page(&pg[i]);
>          }
> 
>          if ( dirty_cnt )
>          {
>              spin_lock(&heap_lock);
>              node_need_scrub[node] -= dirty_cnt;
>              spin_unlock(&heap_lock);
>          }
>      }
> 
>      TRACE_0D(TRC_PGALLOC_PT5); // <=================================
>      if ( need_tlbflush )
>          filtered_flush_tlb_mask(tlbflush_timestamp);
> 
>      TRACE_0D(TRC_PGALLOC_PT6); // <=================================
> 
>      return pg;
> }
> 
> 
> And wrote a simple Python scripts that parses the output of
> xentrace. There are results for different orders:
> 
>    46.842032: page_alloc trace point 1. Order: 18
>    46.842035: page_alloc trace point 2 (+   0.000003)
>    46.842035: page_alloc trace point 3 (+   0.000000)
>    46.975105: page_alloc trace point 4 (+   0.133069)
>    46.975106: page_alloc trace point 5 (+   0.000001)
>    46.975106: page_alloc trace point 6 (+   0.000000): total:    0.133074
> 
>    46.998536: page_alloc trace point 1. Order: 9
>    46.998538: page_alloc trace point 2 (+   0.000002)
>    46.998540: page_alloc trace point 3 (+   0.000001)
>    46.998799: page_alloc trace point 4 (+   0.000259)
>    46.998800: page_alloc trace point 5 (+   0.000000)
>    46.998800: page_alloc trace point 6 (+   0.000000): total:    0.000264
> 
>    46.835802: page_alloc trace point 1. Order: 3
>    46.835803: page_alloc trace point 2 (+   0.000000)
>    46.835803: page_alloc trace point 3 (+   0.000000)
>    46.835812: page_alloc trace point 4 (+   0.000009)
>    46.835813: page_alloc trace point 5 (+   0.000000)
>    46.835813: page_alloc trace point 6 (+   0.000001): total:    0.000011
> 
>    46.998815: page_alloc trace point 1. Order: 0
>    46.998816: page_alloc trace point 2 (+   0.000002)
>    46.998817: page_alloc trace point 3 (+   0.000000)
>    46.998818: page_alloc trace point 4 (+   0.000002)
>    46.998819: page_alloc trace point 5 (+   0.000001)
>    46.998819: page_alloc trace point 6 (+   0.000000): total:    0.000005
> 
> Then I commented out call to flush_page_to_ram() and got the following
> results:
> 
>   149.561902: page_alloc trace point 1. Order: 18
>   149.561905: page_alloc trace point 2 (+   0.000003)
>   149.561905: page_alloc trace point 3 (+   0.000000)
>   149.569450: page_alloc trace point 4 (+   0.007545)
>   149.569451: page_alloc trace point 5 (+   0.000001)
>   149.569452: page_alloc trace point 6 (+   0.000000): total:    0.007550
> 
>   149.592624: page_alloc trace point 1. Order: 9
>   149.592626: page_alloc trace point 2 (+   0.000003)
>   149.592627: page_alloc trace point 3 (+   0.000001)
>   149.592639: page_alloc trace point 4 (+   0.000012)
>   149.592639: page_alloc trace point 5 (+   0.000000)
>   149.592640: page_alloc trace point 6 (+   0.000000): total:    0.000016
> 
> All time units are seconds, by the way.

That's quite a big improvement! I would definitely consider to defer the 
flush and use the domctl.

However, I am a bit confused with the result. In an earlier, you wrote 
the operation would take a second. The numbers for oder=18, only show 
133ms spent in the alloc_heap_pages(). Would you be able to clarify 
where the rest of the time is spent?

Would it be possible that updating the p2m also take some time?

Cheers,

-- 
Julien Grall

