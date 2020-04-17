Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 992921ADABD
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2020 12:12:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPNy0-0002jZ-BQ; Fri, 17 Apr 2020 10:11:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=x8HM=6B=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jPNxy-0002jU-K2
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2020 10:11:22 +0000
X-Inumbo-ID: c955db0a-8093-11ea-b58d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c955db0a-8093-11ea-b58d-bc764e2007e4;
 Fri, 17 Apr 2020 10:11:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EABB6B031;
 Fri, 17 Apr 2020 10:11:19 +0000 (UTC)
Subject: Re: [PATCH 05/12] xen: introduce reserve_heap_pages
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.2004141746350.8746@sstabellini-ThinkPad-T480s>
 <20200415010255.10081-5-sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3129ab49-5898-9d2e-8fbb-d1fcaf6cdec7@suse.com>
Date: Fri, 17 Apr 2020 12:11:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200415010255.10081-5-sstabellini@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: julien@xen.org, Wei Liu <wl@xen.org>, andrew.cooper3@citrix.com,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>, Volodymyr_Babchuk@epam.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 15.04.2020 03:02, Stefano Stabellini wrote:
> Introduce a function named reserve_heap_pages (similar to
> alloc_heap_pages) that allocates a requested memory range. Call
> __alloc_heap_pages for the implementation.
> 
> Change __alloc_heap_pages so that the original page doesn't get
> modified, giving back unneeded memory top to bottom rather than bottom
> to top.

While it may be less of a problem within a zone, doing so is
against our general "return high pages first" policy.

> @@ -1073,7 +1073,42 @@ static struct page_info *alloc_heap_pages(
>          return NULL;
>      }
>  
> -    __alloc_heap_pages(&pg, order, memflags, d);
> +    __alloc_heap_pages(pg, order, memflags, d);
> +    return pg;
> +}
> +
> +static struct page_info *reserve_heap_pages(struct domain *d,
> +                                            paddr_t start,
> +                                            unsigned int order,
> +                                            unsigned int memflags)
> +{
> +    nodeid_t node;
> +    unsigned int zone;
> +    struct page_info *pg;
> +
> +    if ( unlikely(order > MAX_ORDER) )
> +        return NULL;
> +
> +    spin_lock(&heap_lock);
> +
> +    /*
> +     * Claimed memory is considered unavailable unless the request
> +     * is made by a domain with sufficient unclaimed pages.
> +     */
> +    if ( (outstanding_claims + (1UL << order) > total_avail_pages) &&
> +          ((memflags & MEMF_no_refcount) ||
> +           !d || d->outstanding_pages < (1UL << order)) )
> +    {
> +        spin_unlock(&heap_lock);
> +        return NULL;
> +    }

Where would such a claim come from? Given the purpose I'd assume
the function (as well as reserve_domheap_pages()) can actually be
__init. With that I'd then also be okay with them getting built
unconditionally, i.e. even on x86.

> +    pg = maddr_to_page(start);
> +    node = phys_to_nid(start);
> +    zone = page_to_zone(pg);
> +    page_list_del(pg, &heap(node, zone, order));
> +
> +    __alloc_heap_pages(pg, order, memflags, d);

I agree with Julien in not seeing how this can be safe / correct.

Jan

