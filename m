Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B141CEA05
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2020 03:12:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYJRZ-0008PS-2l; Tue, 12 May 2020 01:10:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4tCB=62=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jYJRY-0008PN-9w
 for xen-devel@lists.xenproject.org; Tue, 12 May 2020 01:10:48 +0000
X-Inumbo-ID: 696d9652-93ed-11ea-ae69-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 696d9652-93ed-11ea-ae69-bc764e2007e4;
 Tue, 12 May 2020 01:10:47 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A204320722;
 Tue, 12 May 2020 01:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589245847;
 bh=cSFwD1+I8gzgQ6JIea/1dIP90y0woUlDtgmTMw5D0xM=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=AfNUWN+eHXwrPKR8FX/olDTjta3/5LcQk8tqZcyhZcyeX8N5RQ6EGcKTSrpQuvdXk
 WrkiaPVmgRnCvAGrAFmrPzYIBEyP9wcO8zzfeyISn/8hvT0pu3mOxkX0Ih5lssOi7t
 Xvz/yO4ZpjVVup5B36zErOZ/VMkXYmZkeQXyWTvU=
Date: Mon, 11 May 2020 18:10:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH 05/12] xen: introduce reserve_heap_pages
In-Reply-To: <86e8fa89-c6f5-6c9e-4f3e-7f98e8e12c6a@xen.org>
Message-ID: <alpine.DEB.2.21.2005111750240.26167@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2004141746350.8746@sstabellini-ThinkPad-T480s>
 <20200415010255.10081-5-sstabellini@kernel.org>
 <3129ab49-5898-9d2e-8fbb-d1fcaf6cdec7@suse.com>
 <alpine.DEB.2.21.2004291510270.28941@sstabellini-ThinkPad-T480s>
 <a316ed70-da35-8be0-a092-d992e56563d2@xen.org>
 <alpine.DEB.2.21.2004300928240.28941@sstabellini-ThinkPad-T480s>
 <86e8fa89-c6f5-6c9e-4f3e-7f98e8e12c6a@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 andrew.cooper3@citrix.com, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>, Volodymyr_Babchuk@epam.com,
 "Woodhouse, David" <dwmw@amazon.co.uk>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, 30 Apr 2020, Julien Grall wrote:
> On 30/04/2020 18:00, Stefano Stabellini wrote:
> > On Thu, 30 Apr 2020, Julien Grall wrote:
> > > > > > +    pg = maddr_to_page(start);
> > > > > > +    node = phys_to_nid(start);
> > > > > > +    zone = page_to_zone(pg);
> > > > > > +    page_list_del(pg, &heap(node, zone, order));
> > > > > > +
> > > > > > +    __alloc_heap_pages(pg, order, memflags, d);
> > > > > 
> > > > > I agree with Julien in not seeing how this can be safe / correct.
> > > > 
> > > > I haven't seen any issues so far in my testing -- I imagine it is
> > > > because there aren't many memory allocations after setup_mm() and before
> > > > create_domUs()  (which on ARM is called just before
> > > > domain_unpause_by_systemcontroller at the end of start_xen.)
> > > 
> > > I am not sure why you exclude setup_mm(). Any memory allocated (boot
> > > allocator, xenheap) can clash with your regions. The main memory
> > > allocations
> > > are for the frametable and dom0. I would say you were lucky to not hit
> > > them.
> > 
> > Maybe it is because Xen typically allocates memory top-down? So if I
> > chose a high range then I would see a failure? But I have been mostly
> > testing with ranges close to the begin of RAM (as opposed to
> > ranges close to the end of RAM.)
> 
> I haven't looked at the details of the implementation, but you can try to
> specify dom0 addresses for your domU. You should see a failure.

I managed to reproduce a failure by choosing the top address range. On
Xilinx ZynqMP the memory is:

  reg = <0x0 0x0 0x0 0x7ff00000 0x8 0x0 0x0 0x80000000>;

And I chose:

  fdt set /chosen/domU0 direct-map <0x0 0x10000000 0x10000000 0x8 0x70000000 0x10000000>

Resulting in:

(XEN) *** LOADING DOMU cpus=1 memory=80000KB ***
(XEN) Loading d1 kernel from boot module @ 0000000007200000
(XEN) Loading ramdisk from boot module @ 0000000008200000
(XEN) direct_map start=0x00000010000000 size=0x00000010000000
(XEN) direct_map start=0x00000870000000 size=0x00000010000000
(XEN) Data Abort Trap. Syndrome=0x5
(XEN) Walking Hypervisor VA 0x2403480018 on CPU0 via TTBR 0x0000000000f05000
(XEN) 0TH[0x0] = 0x0000000000f08f7f
(XEN) 1ST[0x90] = 0x0000000000000000
(XEN) CPU0: Unexpected Trap: Data Abort

[...]

(XEN) Xen call trace:
(XEN)    [<000000000021a65c>] page_alloc.c#alloc_pages_from_buddy+0x15c/0x5d0 (PC)
(XEN)    [<000000000021b43c>] reserve_domheap_pages+0xc4/0x148 (LR)

Anything other than the very top of memory works.


> > > > - in construct_domU, add the range to xenheap and reserve it with
> > > > reserve_heap_pages
> > > 
> > > I am afraid you can't give the regions to the allocator and then allocate
> > > them. The allocator is free to use any page for its own purpose or exclude
> > > them.
> > > 
> > > AFAICT, the allocator doesn't have a list of page in use. It only keeps
> > > track
> > > of free pages. So we can make the content of struct page_info to look like
> > > it
> > > was allocated by the allocator.
> > > 
> > > We would need to be careful when giving a page back to allocator as the
> > > page
> > > would need to be initialized (see [1]). This may not be a concern for
> > > Dom0less
> > > as the domain may never be destroyed but will be for correctness PoV.
> > > 
> > > For LiveUpdate, the original Xen will carve out space to use by the boot
> > > allocator in the new Xen. But I think this is not necessary in your
> > > context.
> > > 
> > > It should be sufficient to exclude the page from the boot allocators (as
> > > we do
> > > for other modules).
> > > 
> > > One potential issue that can arise is there is no easy way today to
> > > differentiate between pages allocated and pages not yet initialized. To
> > > make
> > > the code robust, we need to prevent a page to be used in two places. So
> > > for
> > > LiveUpdate we are marking them with a special value, this is used
> > > afterwards
> > > to check we are effictively using a reserved page.
> > > 
> > > I hope this helps.
> > 
> > Thanks for writing all of this down but I haven't understood some of it.
> > 
> > For the sake of this discussion let's say that we managed to "reserve"
> > the range early enough like we do for other modules, as you wrote.
> > 
> > At the point where we want to call reserve_heap_pages() we would call
> > init_heap_pages() just before it. We are still relatively early at boot
> > so there aren't any concurrent memory operations. Why this doesn't work?
> 
> Because init_heap_pages() may exclude some pages (for instance MFN 0 is carved
> out) or use pages for its internal structure (see init_node_heap()). So you
> can't expect to be able to allocate the exact same region by
> reserve_heap_pages().

But it can't possibly use of any of pages it is trying to add to the
heap, right?

We have reserved a certain range, we tell init_heap_pages to add the
range to the heap, init_node_heap gets called and it ends up calling
xmalloc. There is no way xmalloc can use any memory from that
particular range because it is not in the heap yet. That should be safe.

The init_node_heap code is a bit hard to follow but I went through it
and couldn't spot anything that could cause any issues (MFN 0 aside
which is a bit special). Am I missing something?

