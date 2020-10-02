Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 168392813F1
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 15:23:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2105.6254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOL1J-0000SI-CZ; Fri, 02 Oct 2020 13:22:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2105.6254; Fri, 02 Oct 2020 13:22:45 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOL1J-0000Rp-7u; Fri, 02 Oct 2020 13:22:45 +0000
Received: by outflank-mailman (input) for mailman id 2105;
 Fri, 02 Oct 2020 13:17:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c/W5=DJ=suse.com=mhocko@srs-us1.protection.inumbo.net>)
 id 1kOKwb-0007zP-5v
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 13:17:53 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bb73828b-6662-410b-b684-640228c415e3;
 Fri, 02 Oct 2020 13:17:46 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 09108ACAD;
 Fri,  2 Oct 2020 13:17:45 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=c/W5=DJ=suse.com=mhocko@srs-us1.protection.inumbo.net>)
	id 1kOKwb-0007zP-5v
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 13:17:53 +0000
X-Inumbo-ID: bb73828b-6662-410b-b684-640228c415e3
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id bb73828b-6662-410b-b684-640228c415e3;
	Fri, 02 Oct 2020 13:17:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601644665;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CU5N1SfvQtRpkg+8Zog93ExPg0p+BzvwAJwHCdS+2JY=;
	b=FiceQ6Kkjz7QkfPSMSOPtuyU7GKljTHYOsd1o/wNW28hnm2YsFn/XKHbTzs7kr+fWv9n8d
	Oq4lBN4dyXC+WH92QTQt0Mm9h1WVkRPZovHwQIkeec1BNFgADdysKCnh2T56obsi8aM666
	OfC+ku5GWdMUWqNHGo+M0w1MMBJ+bas=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 09108ACAD;
	Fri,  2 Oct 2020 13:17:45 +0000 (UTC)
Date: Fri, 2 Oct 2020 15:17:43 +0200
From: Michal Hocko <mhocko@suse.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-hyperv@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-acpi@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexander Duyck <alexander.h.duyck@linux.intel.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Oscar Salvador <osalvador@suse.de>,
	Mel Gorman <mgorman@techsingularity.net>,
	Dave Hansen <dave.hansen@intel.com>,
	Wei Yang <richard.weiyang@linux.alibaba.com>,
	Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v1 1/5] mm/page_alloc: convert "report" flag of
 __free_one_page() to a proper flag
Message-ID: <20201002131743.GG4555@dhcp22.suse.cz>
References: <20200928182110.7050-1-david@redhat.com>
 <20200928182110.7050-2-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200928182110.7050-2-david@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Mon 28-09-20 20:21:06, David Hildenbrand wrote:
> Let's prepare for additional flags and avoid long parameter lists of bools.
> Follow-up patches will also make use of the flags in __free_pages_ok(),
> however, I wasn't able to come up with a better name for the type - should
> be good enough for internal purposes.
> 
> Reviewed-by: Alexander Duyck <alexander.h.duyck@linux.intel.com>
> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
> Reviewed-by: Oscar Salvador <osalvador@suse.de>
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

Hopefully this will not wrack the generated code. But considering we
would need another parameter there is not much choice left.

Acked-by: Michal Hocko <mhocko@suse.com>

> ---
>  mm/page_alloc.c | 28 ++++++++++++++++++++--------
>  1 file changed, 20 insertions(+), 8 deletions(-)
> 
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index df90e3654f97..daab90e960fe 100644
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
> + * Skip free page reporting notification for the (possibly merged) page. (will
> + * *not* mark the page reported, only skip the notification).
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
> @@ -1379,7 +1390,7 @@ static void free_pcppages_bulk(struct zone *zone, int count,
>  		if (unlikely(isolated_pageblocks))
>  			mt = get_pageblock_migratetype(page);
>  
> -		__free_one_page(page, page_to_pfn(page), zone, 0, mt, true);
> +		__free_one_page(page, page_to_pfn(page), zone, 0, mt, FOP_NONE);
>  		trace_mm_page_pcpu_drain(page, 0, mt);
>  	}
>  	spin_unlock(&zone->lock);
> @@ -1395,7 +1406,7 @@ static void free_one_page(struct zone *zone,
>  		is_migrate_isolate(migratetype))) {
>  		migratetype = get_pfnblock_migratetype(page, pfn);
>  	}
> -	__free_one_page(page, pfn, zone, order, migratetype, true);
> +	__free_one_page(page, pfn, zone, order, migratetype, FOP_NONE);
>  	spin_unlock(&zone->lock);
>  }
>  
> @@ -3288,7 +3299,8 @@ void __putback_isolated_page(struct page *page, unsigned int order, int mt)
>  	lockdep_assert_held(&zone->lock);
>  
>  	/* Return isolated page to tail of freelist. */
> -	__free_one_page(page, page_to_pfn(page), zone, order, mt, false);
> +	__free_one_page(page, page_to_pfn(page), zone, order, mt,
> +			FOP_SKIP_REPORT_NOTIFY);
>  }
>  
>  /*
> -- 
> 2.26.2

-- 
Michal Hocko
SUSE Labs

