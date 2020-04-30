Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FDC1C0366
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 19:01:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUCYD-0001Fy-0K; Thu, 30 Apr 2020 17:00:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kEmr=6O=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jUCYB-0001Ft-TJ
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 17:00:39 +0000
X-Inumbo-ID: 1e27506c-8b04-11ea-9a80-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1e27506c-8b04-11ea-9a80-12813bfff9fa;
 Thu, 30 Apr 2020 17:00:39 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 533F620661;
 Thu, 30 Apr 2020 17:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588266038;
 bh=B93+UsnDv7RgSAjrT+Hkx5AcpSSaxP4darVD6tkMveE=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=2gZE6lvI+9otreOVVbZCl0tunJWtx0+yqXV0Q7iFjKHbbAM97MigfaKbIrDKCbS29
 vWnAWeGg7zomEbyKTeVcXc295bPQs5tZ9B0UePAx6M11xvYt9qfNOG37DYF/iVRKHm
 Q0SONajevEhxfAwYnNxcgLy2CU0VOQQwylbODj0s=
Date: Thu, 30 Apr 2020 10:00:37 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH 05/12] xen: introduce reserve_heap_pages
In-Reply-To: <a316ed70-da35-8be0-a092-d992e56563d2@xen.org>
Message-ID: <alpine.DEB.2.21.2004300928240.28941@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2004141746350.8746@sstabellini-ThinkPad-T480s>
 <20200415010255.10081-5-sstabellini@kernel.org>
 <3129ab49-5898-9d2e-8fbb-d1fcaf6cdec7@suse.com>
 <alpine.DEB.2.21.2004291510270.28941@sstabellini-ThinkPad-T480s>
 <a316ed70-da35-8be0-a092-d992e56563d2@xen.org>
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
> > > > +    pg = maddr_to_page(start);
> > > > +    node = phys_to_nid(start);
> > > > +    zone = page_to_zone(pg);
> > > > +    page_list_del(pg, &heap(node, zone, order));
> > > > +
> > > > +    __alloc_heap_pages(pg, order, memflags, d);
> > > 
> > > I agree with Julien in not seeing how this can be safe / correct.
> > 
> > I haven't seen any issues so far in my testing -- I imagine it is
> > because there aren't many memory allocations after setup_mm() and before
> > create_domUs()  (which on ARM is called just before
> > domain_unpause_by_systemcontroller at the end of start_xen.)
> 
> I am not sure why you exclude setup_mm(). Any memory allocated (boot
> allocator, xenheap) can clash with your regions. The main memory allocations
> are for the frametable and dom0. I would say you were lucky to not hit them.

Maybe it is because Xen typically allocates memory top-down? So if I
chose a high range then I would see a failure? But I have been mostly
testing with ranges close to the begin of RAM (as opposed to
ranges close to the end of RAM.)

 
> > I gave a quick look at David's series. Is the idea that I should add a
> > patch to do the following:
> > 
> > - avoiding adding these ranges to xenheap in setup_mm, wait for later
> >    (a bit like reserved_mem regions)
> 
> I guess by xenheap, you mean domheap? But the problem is not only for domheap,
> it is also for any memory allocated via the boot allocator. So you need to
> exclude those regions from any possible allocations.

OK, I think we are saying the same thing but let me check.

By boot allocator you mean alloc_boot_pages, right? That boot allocator
operates on ranges given to it by init_boot_pages calls.
init_boot_pages is called from setup_mm. I didn't write it clearly but
I also meant not calling init_boot_pages on them from setup_mm.

Are we saying the same thing?



> > - in construct_domU, add the range to xenheap and reserve it with
> > reserve_heap_pages
> 
> I am afraid you can't give the regions to the allocator and then allocate
> them. The allocator is free to use any page for its own purpose or exclude
> them.
>
> AFAICT, the allocator doesn't have a list of page in use. It only keeps track
> of free pages. So we can make the content of struct page_info to look like it
> was allocated by the allocator.
> 
> We would need to be careful when giving a page back to allocator as the page
> would need to be initialized (see [1]). This may not be a concern for Dom0less
> as the domain may never be destroyed but will be for correctness PoV.
> 
> For LiveUpdate, the original Xen will carve out space to use by the boot
> allocator in the new Xen. But I think this is not necessary in your context.
> 
> It should be sufficient to exclude the page from the boot allocators (as we do
> for other modules).
> 
> One potential issue that can arise is there is no easy way today to
> differentiate between pages allocated and pages not yet initialized. To make
> the code robust, we need to prevent a page to be used in two places. So for
> LiveUpdate we are marking them with a special value, this is used afterwards
> to check we are effictively using a reserved page.
> 
> I hope this helps.

Thanks for writing all of this down but I haven't understood some of it.

For the sake of this discussion let's say that we managed to "reserve"
the range early enough like we do for other modules, as you wrote.

At the point where we want to call reserve_heap_pages() we would call
init_heap_pages() just before it. We are still relatively early at boot
so there aren't any concurrent memory operations. Why this doesn't work?

If it doesn't work, I am not following what is your alternative
suggestion about making "the content of struct page_info to look like it
was allocated by the allocator."

