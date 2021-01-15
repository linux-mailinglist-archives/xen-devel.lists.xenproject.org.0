Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 977E62F8980
	for <lists+xen-devel@lfdr.de>; Sat, 16 Jan 2021 00:42:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68862.123408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0YjC-000170-7q; Fri, 15 Jan 2021 23:42:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68862.123408; Fri, 15 Jan 2021 23:42:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0YjC-00016b-4X; Fri, 15 Jan 2021 23:42:02 +0000
Received: by outflank-mailman (input) for mailman id 68862;
 Fri, 15 Jan 2021 23:42:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yB8v=GS=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l0YjA-00016W-Ce
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 23:42:00 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d0c1cc1a-3608-4540-a979-09ebd232b650;
 Fri, 15 Jan 2021 23:41:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BD0E423A5E;
 Fri, 15 Jan 2021 23:41:58 +0000 (UTC)
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
X-Inumbo-ID: d0c1cc1a-3608-4540-a979-09ebd232b650
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610754119;
	bh=Kk0JV80Ic8d4/yDaGek5gS90hcYfMbXQ6TA5sMyHfSI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rYLWa3bGm5YNd9hwl5s+j3yy3pkC7l0HqtnpmDMzkfBG7cirKvSy7Kz6/a7uFmFFp
	 MupML5ArT3K506Bm8bfdkWZVcTAzcAyQI3n1E2zvC9NyT5zebI1I9SnepXecHdeFVR
	 rHagGkON0y/8J5LkQ0ci7hwlJqjaUMpNjvuBL6y5FRw8yisRhG2xG/C5xOFb1wZ5zx
	 p6gdCYxIeXq5Vkq3NQwX3/+Kc6GVfLV8K8Bl24rVIMqLDICnOuslmOBmlMj2EIpCUx
	 dEMmSOQ8YvOS3UN+M6nPnev7UcKzruxqqkfZi/vtn4/16i1BdGBqJ3p2omWp+G5UP7
	 RSsvKGZRsPVsA==
Date: Fri, 15 Jan 2021 15:41:58 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Julien Grall <jgrall@amazon.com>, Dario Faggioli <dario.faggioli@suse.com>, 
    "Bertrand.Marquis@arm.com" <Bertrand.Marquis@arm.com>, 
    "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Subject: Re: IRQ latency measurements in hypervisor
In-Reply-To: <187995c9-78f4-0a1c-d912-ca5100d07321@xen.org>
Message-ID: <alpine.DEB.2.21.2101151459280.31265@sstabellini-ThinkPad-T480s>
References: <87pn294szv.fsf@epam.com> <alpine.DEB.2.21.2101141515230.31265@sstabellini-ThinkPad-T480s> <f31c9cca-0275-eaef-5fcd-c8484d4b5da0@xen.org> <87wnwe2ogp.fsf@epam.com> <187995c9-78f4-0a1c-d912-ca5100d07321@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 15 Jan 2021, Julien Grall wrote:
> On 15/01/2021 15:45, Volodymyr Babchuk wrote:
> > 
> > Hi Julien,
> > 
> > Julien Grall writes:
> > 
> > > Hi Volodymyr, Stefano,
> > > 
> > > On 14/01/2021 23:33, Stefano Stabellini wrote:
> > > > + Bertrand, Andrew (see comment on alloc_heap_pages())
> > > 
> > > Long running hypercalls are usually considered security issues.
> > > 
> > > In this case, only the control domain can issue large memory
> > > allocation (2GB at a time). Guest, would only be able to allocate 2MB
> > > at the time, so from the numbers below, it would only take 1ms max.
> > > 
> > > So I think we are fine here. Next time, you find a large loop, please
> > > provide an explanation why they are not security issues (e.g. cannot
> > > be used by guests) or send an email to the Security Team in doubt.
> > 
> > Sure. In this case I took into account that only control domain can
> > issue this call, I just didn't stated this explicitly. Next time will
> > do.
> 
> I am afraid that's not correct. The guest can request to populate a region.
> This is used for instance in the ballooning case.
> 
> The main difference is a non-privileged guest will not be able to do
> allocation larger than 2MB.
> 
> [...]
> 
> > > > This is very interestingi too. Did you get any spikes with the
> > > > period
> > > > set to 100us? It would be fantastic if there were none.
> > > > 
> > > > > 3. Huge latency spike during domain creation. I conducted some
> > > > >      additional tests, including use of PV drivers, but this didn't
> > > > >      affected the latency in my "real time" domain. But attempt to
> > > > >      create another domain with relatively large memory size of 2GB
> > > > > led
> > > > >      to huge spike in latency. Debugging led to this call path:
> > > > > 
> > > > >      XENMEM_populate_physmap -> populate_physmap() ->
> > > > >      alloc_domheap_pages() -> alloc_heap_pages()-> huge
> > > > >      "for ( i = 0; i < (1 << order); i++ )" loop.
> > > 
> > > There are two for loops in alloc_heap_pages() using this syntax. Which
> > > one are your referring to?
> > 
> > I did some tracing with Lautrebach. It pointed to the first loop and
> > especially to flush_page_to_ram() call if I remember correctly.
> 
> Thanks, I am not entirely surprised because we are clean and invalidating the
> region line by line and across all the CPUs.
> 
> If we are assuming 128 bytes cacheline, we will need to issue 32 cache
> instructions per page. This going to involve quite a bit of traffic on the
> system.

I think Julien is most likely right. It would be good to verify this
with an experiment. For instance, you could remove the
flush_page_to_ram() call for one test and see if you see any latency
problems.


> One possibility would be to defer the cache flush when the domain is created
> and use the hypercall XEN_DOMCTL_cacheflush to issue the flush.
> 
> Note that XEN_DOMCTL_cacheflush would need some modification to be
> preemptible. But at least, it will work on a GFN which is easier to track.
 
This looks like a solid suggestion. XEN_DOMCTL_cacheflush is already
used by the toolstack in a few places. 

I am also wondering if we can get away with fewer flush_page_to_ram()
calls from alloc_heap_pages() for memory allocations done at boot time
soon after global boot memory scrubbing.


> > > > > I managed to overcome the issue #3 by commenting out all calls to
> > > > > populate_one_size() except the populate_one_size(PFN_4K_SHIFT) in
> > > > > xg_dom_arm.c. This lengthened domain construction, but my "RT" domain
> > > > > didn't experienced so big latency issues. Apparently all other
> > > > > hypercalls which are used during domain creation are either fast or
> > > > > preemptible. No doubts that my hack lead to page tables inflation and
> > > > > overall performance drop.
> > > > I think we need to follow this up and fix this. Maybe just by adding
> > > > a hypercall continuation to the loop.
> > > 
> > > When I read "hypercall continuation", I read we will return to the
> > > guest context so it can process interrupts and potentially switch to
> > > another task.
> > > 
> > > This means that the guest could issue a second populate_physmap() from
> > > the vCPU. Therefore any restart information should be part of the
> > > hypercall parameters. So far, I don't see how this would be possible.
> > > 
> > > Even if we overcome that part, this can be easily abuse by a guest as
> > > the memory is not yet accounted to the domain. Imagine a guest that
> > > never request the continuation of the populate_physmap(). So we would
> > > need to block the vCPU until the allocation is finished.
> > 
> > Moreover, most of the alloc_heap_pages() sits under spinlock, so first
> > step would be to split this function into smaller atomic parts.
> 
> Do you have any suggestion how to split it?
> 
> > 
> > > I think the first step is we need to figure out which part of the
> > > allocation is slow (see my question above). From there, we can figure
> > > out if there is a way to reduce the impact.
> > 
> > I'll do more tracing and will return with more accurate numbers. But as far
> > as I can see, any loop on 262144 pages will take some time..
> .
> 
> It really depends on the content of the loop. On any modern processors, you
> are very likely not going to notice a loop that update just a flag.
> 
> However, you are likely going to be see an impact if your loop is going to
> clean & invalidate the cache for each page.

