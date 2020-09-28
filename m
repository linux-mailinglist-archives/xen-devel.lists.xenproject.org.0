Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A696127B609
	for <lists+xen-devel@lfdr.de>; Mon, 28 Sep 2020 22:13:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMzVU-000163-73; Mon, 28 Sep 2020 20:12:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MzHa=DF=gmail.com=pankaj.gupta.linux@srs-us1.protection.inumbo.net>)
 id 1kMzVS-00015y-OP
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 20:12:18 +0000
X-Inumbo-ID: a889facf-6d70-4356-980b-038cabdc906e
Received: from mail-io1-xd42.google.com (unknown [2607:f8b0:4864:20::d42])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a889facf-6d70-4356-980b-038cabdc906e;
 Mon, 28 Sep 2020 20:12:11 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id z25so2477117iol.10
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2020 13:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xZKymCvf/3hB0NedV8stXCWKWuXrWGW8+XBJgCfh+LE=;
 b=TDPgclhnBlWg5VXfidWvaVODif2Ky2Ysrfbe6qlsall+wU6K4b9E0/tbX04SDmq9EQ
 jTaWRxt9S1JvFQXXdGnFm2JLjA3fOSc827Wdz7c3b27/bT7K90mdObWR39grRzS2YgWk
 CwpRDvAOYYt8KmZNc0+eN5dqSXCAtB+9sjeZ+WDr1ClzwF20lChfVuJSdvGqhsu4ujlC
 R4VXPQ8KsQM0k/4GV8k2EEPRsNcwIcBrzAn0s+XXZ/iBi+b2galei+43oEog2fHYBSJF
 qEQZ/wcEqdEq0I0im8TxSAzTKEpZns5PrYvPNIEtTSuSjQ+vkU5R1ArhwXV4hkv6K+BB
 1c7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xZKymCvf/3hB0NedV8stXCWKWuXrWGW8+XBJgCfh+LE=;
 b=jOUwN8nX7ng9BEdW/37ypN0S4JLgqdUFL3btvOYDXLqHUhztUIvutkW+2/d2L+z7ip
 11wQRMx7paPQcay1K+3QToGXkh/kK56J6Jn264PNcODH5QQfb+Q7lZJLiyPtZ11tff+7
 OrR1Xi9lK5MAT+pffrc9PgpoUfbaGL0wGfFE9X6i4TR2OxpHfHUbjB2lXshFPMAgraAI
 HuoRC4wYzSxKiUJV+OcH0RF/+sovY7badhDW3EJ6XcYDa1uX56W2e7QSKSa91sgJqzwf
 K5Ix8FEvoMK+yyVuZdSfoXMnZjpAaCrs0JrTH0lU08Vy+fBFFYVXLT74lQCMrISuF2cV
 WObw==
X-Gm-Message-State: AOAM532TI2S/A/gzwun8CiEMCuY7beY4u24Zx45vt06dZq3ihjPHhEwY
 nheI8RthxpgFpAiOHETbj4iF8WJwfMjKVUn3MF8=
X-Google-Smtp-Source: ABdhPJwRZYvxUM8BpdXgvXa6N707vOvCxbfH4iYi81EiZ5QMYe/87ZNldkSa6kbFMWFqlFO15K6N5K6tS6C14JIcttA=
X-Received: by 2002:a6b:2b45:: with SMTP id r66mr8189635ior.159.1601323930836; 
 Mon, 28 Sep 2020 13:12:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200928182110.7050-1-david@redhat.com>
 <20200928182110.7050-2-david@redhat.com>
In-Reply-To: <20200928182110.7050-2-david@redhat.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Mon, 28 Sep 2020 22:11:59 +0200
Message-ID: <CAM9Jb+iwkhvxudiNas8m2B_qXFitF-8_9N5=WxvPPWKSzEGcCA@mail.gmail.com>
Subject: Re: [PATCH v1 1/5] mm/page_alloc: convert "report" flag of
 __free_one_page() to a proper flag
To: David Hildenbrand <david@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Linux MM <linux-mm@kvack.org>, 
 linux-hyperv@vger.kernel.org, xen-devel@lists.xenproject.org, 
 linux-acpi@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Vlastimil Babka <vbabka@suse.cz>, 
 Oscar Salvador <osalvador@suse.de>, Mel Gorman <mgorman@techsingularity.net>, 
 Michal Hocko <mhocko@kernel.org>, Dave Hansen <dave.hansen@intel.com>, 
 Wei Yang <richard.weiyang@linux.alibaba.com>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
> +#define FOP_NONE               ((__force fop_t)0)
> +
> +/*
> + * Skip free page reporting notification for the (possibly merged) page. (will
> + * *not* mark the page reported, only skip the notification).
> + */
> +#define FOP_SKIP_REPORT_NOTIFY ((__force fop_t)BIT(0))
> +
>  /* prevent >1 _updater_ of zone percpu pageset ->high and ->batch fields */
>  static DEFINE_MUTEX(pcp_batch_high_lock);
>  #define MIN_PERCPU_PAGELIST_FRACTION   (8)
> @@ -948,10 +960,9 @@ buddy_merge_likely(unsigned long pfn, unsigned long buddy_pfn,
>   * -- nyc
>   */
>
> -static inline void __free_one_page(struct page *page,
> -               unsigned long pfn,
> -               struct zone *zone, unsigned int order,
> -               int migratetype, bool report)
> +static inline void __free_one_page(struct page *page, unsigned long pfn,
> +                                  struct zone *zone, unsigned int order,
> +                                  int migratetype, fop_t fop_flags)
>  {
>         struct capture_control *capc = task_capc(zone);
>         unsigned long buddy_pfn;
> @@ -1038,7 +1049,7 @@ static inline void __free_one_page(struct page *page,
>                 add_to_free_list(page, zone, order, migratetype);
>
>         /* Notify page reporting subsystem of freed page */
> -       if (report)
> +       if (!(fop_flags & FOP_SKIP_REPORT_NOTIFY))
>                 page_reporting_notify_free(order);
>  }
>
> @@ -1379,7 +1390,7 @@ static void free_pcppages_bulk(struct zone *zone, int count,
>                 if (unlikely(isolated_pageblocks))
>                         mt = get_pageblock_migratetype(page);
>
> -               __free_one_page(page, page_to_pfn(page), zone, 0, mt, true);
> +               __free_one_page(page, page_to_pfn(page), zone, 0, mt, FOP_NONE);
>                 trace_mm_page_pcpu_drain(page, 0, mt);
>         }
>         spin_unlock(&zone->lock);
> @@ -1395,7 +1406,7 @@ static void free_one_page(struct zone *zone,
>                 is_migrate_isolate(migratetype))) {
>                 migratetype = get_pfnblock_migratetype(page, pfn);
>         }
> -       __free_one_page(page, pfn, zone, order, migratetype, true);
> +       __free_one_page(page, pfn, zone, order, migratetype, FOP_NONE);
>         spin_unlock(&zone->lock);
>  }
>
> @@ -3288,7 +3299,8 @@ void __putback_isolated_page(struct page *page, unsigned int order, int mt)
>         lockdep_assert_held(&zone->lock);
>
>         /* Return isolated page to tail of freelist. */
> -       __free_one_page(page, page_to_pfn(page), zone, order, mt, false);
> +       __free_one_page(page, page_to_pfn(page), zone, order, mt,
> +                       FOP_SKIP_REPORT_NOTIFY);
>  }

Reviewed-by: Pankaj Gupta <pankaj.gupta.linux@gmail.com>

