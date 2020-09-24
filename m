Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE39276E84
	for <lists+xen-devel@lfdr.de>; Thu, 24 Sep 2020 12:20:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLOLv-00042g-HL; Thu, 24 Sep 2020 10:19:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Y/Bv=DB=suse.cz=vbabka@srs-us1.protection.inumbo.net>)
 id 1kLOLu-00042T-Gh
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2020 10:19:50 +0000
X-Inumbo-ID: f82bdad7-2bf8-422a-bdfd-5b1942aeddcd
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f82bdad7-2bf8-422a-bdfd-5b1942aeddcd;
 Thu, 24 Sep 2020 10:19:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9A3F0AF1F;
 Thu, 24 Sep 2020 10:20:26 +0000 (UTC)
Subject: Re: [PATCH RFC 1/4] mm/page_alloc: convert "report" flag of
 __free_one_page() to a proper flag
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, linux-hyperv@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Mel Gorman <mgorman@techsingularity.net>, Michal Hocko <mhocko@kernel.org>,
 Dave Hansen <dave.hansen@intel.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>
References: <20200916183411.64756-1-david@redhat.com>
 <20200916183411.64756-2-david@redhat.com>
From: Vlastimil Babka <vbabka@suse.cz>
Message-ID: <82ba4aec-0c69-2461-485a-fa4a7777e5c3@suse.cz>
Date: Thu, 24 Sep 2020 12:19:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200916183411.64756-2-david@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 9/16/20 8:34 PM, David Hildenbrand wrote:
> Let's prepare for additional flags and avoid long parameter lists of bools.
> Follow-up patches will also make use of the flags in __free_pages_ok(),
> however, I wasn't able to come up with a better name for the type - should
> be good enough for internal purposes.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Alexander Duyck <alexander.h.duyck@linux.intel.com>
> Cc: Mel Gorman <mgorman@techsingularity.net>
> Cc: Michal Hocko <mhocko@kernel.org>
> Cc: Dave Hansen <dave.hansen@intel.com>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Wei Yang <richard.weiyang@linux.alibaba.com>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: Mike Rapoport <rppt@kernel.org>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Vlastimil Babka <vbabka@suse.cz>

> ---
>  mm/page_alloc.c | 28 ++++++++++++++++++++--------
>  1 file changed, 20 insertions(+), 8 deletions(-)
> 
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 6b699d273d6e..91cefb8157dd 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -77,6 +77,18 @@
>  #include "shuffle.h"
>  #include "page_reporting.h"
>  
> +/* Free One Page flags: for internal, non-pcp variants of free_pages(). */
> +typedef int __bitwise fop_t;
> +
> +/* No special request */
> +#define FOP_NONE		((__force fop_t)0)
> +
> +/*
> + * Skip free page reporting notification after buddy merging (will *not* mark
> + * the page reported, only skip the notification).
> + */
> +#define FOP_SKIP_REPORT_NOTIFY	((__force fop_t)BIT(0))
> +
>  /* prevent >1 _updater_ of zone percpu pageset ->high and ->batch fields */
>  static DEFINE_MUTEX(pcp_batch_high_lock);
>  #define MIN_PERCPU_PAGELIST_FRACTION	(8)
> @@ -948,10 +960,9 @@ buddy_merge_likely(unsigned long pfn, unsigned long buddy_pfn,
>   * -- nyc
>   */
>  
> -static inline void __free_one_page(struct page *page,
> -		unsigned long pfn,
> -		struct zone *zone, unsigned int order,
> -		int migratetype, bool report)
> +static inline void __free_one_page(struct page *page, unsigned long pfn,
> +				   struct zone *zone, unsigned int order,
> +				   int migratetype, fop_t fop_flags)
>  {
>  	struct capture_control *capc = task_capc(zone);
>  	unsigned long buddy_pfn;
> @@ -1038,7 +1049,7 @@ static inline void __free_one_page(struct page *page,
>  		add_to_free_list(page, zone, order, migratetype);
>  
>  	/* Notify page reporting subsystem of freed page */
> -	if (report)
> +	if (!(fop_flags & FOP_SKIP_REPORT_NOTIFY))
>  		page_reporting_notify_free(order);
>  }
>  
> @@ -1368,7 +1379,7 @@ static void free_pcppages_bulk(struct zone *zone, int count,
>  		if (unlikely(isolated_pageblocks))
>  			mt = get_pageblock_migratetype(page);
>  
> -		__free_one_page(page, page_to_pfn(page), zone, 0, mt, true);
> +		__free_one_page(page, page_to_pfn(page), zone, 0, mt, FOP_NONE);
>  		trace_mm_page_pcpu_drain(page, 0, mt);
>  	}
>  	spin_unlock(&zone->lock);
> @@ -1384,7 +1395,7 @@ static void free_one_page(struct zone *zone,
>  		is_migrate_isolate(migratetype))) {
>  		migratetype = get_pfnblock_migratetype(page, pfn);
>  	}
> -	__free_one_page(page, pfn, zone, order, migratetype, true);
> +	__free_one_page(page, pfn, zone, order, migratetype, FOP_NONE);
>  	spin_unlock(&zone->lock);
>  }
>  
> @@ -3277,7 +3288,8 @@ void __putback_isolated_page(struct page *page, unsigned int order, int mt)
>  	lockdep_assert_held(&zone->lock);
>  
>  	/* Return isolated page to tail of freelist. */
> -	__free_one_page(page, page_to_pfn(page), zone, order, mt, false);
> +	__free_one_page(page, page_to_pfn(page), zone, order, mt,
> +			FOP_SKIP_REPORT_NOTIFY);
>  }
>  
>  /*
> 


