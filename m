Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5551BEC28
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 00:47:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTvTB-0007SR-B1; Wed, 29 Apr 2020 22:46:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hWzR=6N=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jTvT9-0007SM-Qk
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2020 22:46:19 +0000
X-Inumbo-ID: 3d9bb134-8a6b-11ea-99d1-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3d9bb134-8a6b-11ea-99d1-12813bfff9fa;
 Wed, 29 Apr 2020 22:46:19 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1415320757;
 Wed, 29 Apr 2020 22:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588200378;
 bh=oedlrQGaxlAcZq0TWpE/UHeneElBWnwqThY9pMSIxW8=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=N6cX7XWLvD8dMTs9Npwfe6WZQQwp4SCCf92uriYplgYfZaSgbfz1z7C+tnuHLVs77
 eTyNOjJeRJK+W30+ULFIpsjhz/XqbLiGaXhXlwFqnwa9hkqNDPK4UjsDg48CF3oRhd
 XVtw2jeBJsGmvdT5ZQ5xaKczoZRofRJy0MNhGi3U=
Date: Wed, 29 Apr 2020 15:46:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 05/12] xen: introduce reserve_heap_pages
In-Reply-To: <3129ab49-5898-9d2e-8fbb-d1fcaf6cdec7@suse.com>
Message-ID: <alpine.DEB.2.21.2004291510270.28941@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2004141746350.8746@sstabellini-ThinkPad-T480s>
 <20200415010255.10081-5-sstabellini@kernel.org>
 <3129ab49-5898-9d2e-8fbb-d1fcaf6cdec7@suse.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, julien@xen.org,
 Wei Liu <wl@xen.org>, andrew.cooper3@citrix.com,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>, Volodymyr_Babchuk@epam.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, 17 Apr 2020, Jan Beulich wrote:
> On 15.04.2020 03:02, Stefano Stabellini wrote:
> > Introduce a function named reserve_heap_pages (similar to
> > alloc_heap_pages) that allocates a requested memory range. Call
> > __alloc_heap_pages for the implementation.
> > 
> > Change __alloc_heap_pages so that the original page doesn't get
> > modified, giving back unneeded memory top to bottom rather than bottom
> > to top.
> 
> While it may be less of a problem within a zone, doing so is
> against our general "return high pages first" policy.

Is this something you'd be OK with anyway?

If not, do you have a suggestion on how to do it better? I couldn't find
a nice way to do it without code duplication, or a big nasty 'if' in the
middle of the function.


> > @@ -1073,7 +1073,42 @@ static struct page_info *alloc_heap_pages(
> >          return NULL;
> >      }
> >  
> > -    __alloc_heap_pages(&pg, order, memflags, d);
> > +    __alloc_heap_pages(pg, order, memflags, d);
> > +    return pg;
> > +}
> > +
> > +static struct page_info *reserve_heap_pages(struct domain *d,
> > +                                            paddr_t start,
> > +                                            unsigned int order,
> > +                                            unsigned int memflags)
> > +{
> > +    nodeid_t node;
> > +    unsigned int zone;
> > +    struct page_info *pg;
> > +
> > +    if ( unlikely(order > MAX_ORDER) )
> > +        return NULL;
> > +
> > +    spin_lock(&heap_lock);
> > +
> > +    /*
> > +     * Claimed memory is considered unavailable unless the request
> > +     * is made by a domain with sufficient unclaimed pages.
> > +     */
> > +    if ( (outstanding_claims + (1UL << order) > total_avail_pages) &&
> > +          ((memflags & MEMF_no_refcount) ||
> > +           !d || d->outstanding_pages < (1UL << order)) )
> > +    {
> > +        spin_unlock(&heap_lock);
> > +        return NULL;
> > +    }
> 
> Where would such a claim come from? Given the purpose I'd assume
> the function (as well as reserve_domheap_pages()) can actually be
> __init. With that I'd then also be okay with them getting built
> unconditionally, i.e. even on x86.

Yes, you are right, I'll make the function __init and also remove this
check on claimed memory.


> > +    pg = maddr_to_page(start);
> > +    node = phys_to_nid(start);
> > +    zone = page_to_zone(pg);
> > +    page_list_del(pg, &heap(node, zone, order));
> > +
> > +    __alloc_heap_pages(pg, order, memflags, d);
> 
> I agree with Julien in not seeing how this can be safe / correct.

I haven't seen any issues so far in my testing -- I imagine it is
because there aren't many memory allocations after setup_mm() and before
create_domUs()  (which on ARM is called just before
domain_unpause_by_systemcontroller at the end of start_xen.)


I gave a quick look at David's series. Is the idea that I should add a
patch to do the following:

- avoiding adding these ranges to xenheap in setup_mm, wait for later
  (a bit like reserved_mem regions)

- in construct_domU, add the range to xenheap and reserve it with reserve_heap_pages

Is that right?

