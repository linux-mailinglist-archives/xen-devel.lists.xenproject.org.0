Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CE2199608
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2020 14:13:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJFjE-0003Xq-LG; Tue, 31 Mar 2020 12:10:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=DP+J=5Q=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jJFjD-0003Xl-Df
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2020 12:10:47 +0000
X-Inumbo-ID: a63872a7-7348-11ea-ba17-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a63872a7-7348-11ea-ba17-12813bfff9fa;
 Tue, 31 Mar 2020 12:10:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A6ABAAF31;
 Tue, 31 Mar 2020 12:10:45 +0000 (UTC)
Subject: Re: [PATCH 2/2] xen/mm: Introduce PGC_state_uninitialised
To: David Woodhouse <dwmw2@infradead.org>
References: <759b48cc361af1136e3cf1658f3dcb1d2937db9c.camel@infradead.org>
 <20200319212150.2651419-1-dwmw2@infradead.org>
 <20200319212150.2651419-2-dwmw2@infradead.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f55be78b-85fc-c4d3-03dc-a2229b3fd53b@suse.com>
Date: Tue, 31 Mar 2020 14:10:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200319212150.2651419-2-dwmw2@infradead.org>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, hongyxia@amazon.com,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 19.03.2020 22:21, David Woodhouse wrote:
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -491,7 +491,8 @@ void share_xen_page_with_guest(struct page_info *page, struct domain *d,
>  
>      page_set_owner(page, d);
>      smp_wmb(); /* install valid domain ptr before updating refcnt. */
> -    ASSERT((page->count_info & ~PGC_xen_heap) == 0);
> +    ASSERT((page->count_info & ~PGC_xen_heap) == PGC_state_inuse ||
> +           (page->count_info & ~PGC_xen_heap) == PGC_state_uninitialised);

Like for patch 1, there's a risk of the page transitioning from
uninitialised to inuse between these two comparisons, making the
ASSERT() trigger when it shouldn't. As you've got two more
similar constructs further down in the patch, maybe this also
warrants a helper function/macro?

> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -252,6 +252,8 @@ struct bootmem_region {
>  static struct bootmem_region __initdata
>      bootmem_region_list[PAGE_SIZE / sizeof(struct bootmem_region)];
>  static unsigned int __initdata nr_bootmem_regions;
> +static void init_heap_pages(struct page_info *pg, unsigned long nr_pages,
> +                            bool scrub);
>  
>  struct scrub_region {
>      unsigned long offset;
> @@ -1390,6 +1392,17 @@ static void free_heap_pages(
>      ASSERT(order <= MAX_ORDER);
>      ASSERT(node >= 0);
>  
> +    if ( page_state_is(pg, uninitialised) )
> +    {
> +        init_heap_pages(pg, 1 << order, need_scrub);

While, at least for now, it shouldn't matter in practice, and
while code overall is very inconsistent in this regard, with
the respective parameter type being "unsigned long" may I
suggest to use 1UL here?

Jan

