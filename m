Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A4A2782FF
	for <lists+xen-devel@lfdr.de>; Fri, 25 Sep 2020 10:40:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLjGU-0002aT-Sp; Fri, 25 Sep 2020 08:39:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZApu=DC=suse.cz=vbabka@srs-us1.protection.inumbo.net>)
 id 1kLjGT-0002aO-JY
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2020 08:39:37 +0000
X-Inumbo-ID: 1533e940-fd70-4093-ae10-cd3780f53958
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1533e940-fd70-4093-ae10-cd3780f53958;
 Fri, 25 Sep 2020 08:39:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 511CDB29D;
 Fri, 25 Sep 2020 08:39:35 +0000 (UTC)
Subject: Re: [PATCH RFC 3/4] mm/page_alloc: always move pages to the tail of
 the freelist in unset_migratetype_isolate()
To: David Hildenbrand <david@redhat.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-hyperv@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-acpi@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Mel Gorman <mgorman@techsingularity.net>, Michal Hocko <mhocko@kernel.org>,
 Dave Hansen <dave.hansen@intel.com>, Oscar Salvador <osalvador@suse.de>,
 Mike Rapoport <rppt@kernel.org>, Scott Cheloha <cheloha@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <20200916183411.64756-1-david@redhat.com>
 <20200916183411.64756-4-david@redhat.com>
 <9c6cc094-b02a-ac6c-e1ca-370ce7257881@suse.cz>
 <20200925024552.GA13540@L-31X9LVDL-1304.local>
 <dc550ba3-6b65-bb4e-30a3-2740b1e21be9@redhat.com>
From: Vlastimil Babka <vbabka@suse.cz>
Message-ID: <8e9a4427-3c95-22f5-1e0b-5e3c9fa86592@suse.cz>
Date: Fri, 25 Sep 2020 10:39:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <dc550ba3-6b65-bb4e-30a3-2740b1e21be9@redhat.com>
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

On 9/25/20 10:05 AM, David Hildenbrand wrote:
>>>>  static inline void del_page_from_free_list(struct page *page, struct zone *zone,
>>>>  					   unsigned int order)
>>>>  {
>>>> @@ -2323,7 +2332,7 @@ static inline struct page *__rmqueue_cma_fallback(struct zone *zone,
>>>>   */
>>>>  static int move_freepages(struct zone *zone,
>>>>  			  struct page *start_page, struct page *end_page,
>>>> -			  int migratetype, int *num_movable)
>>>> +			  int migratetype, int *num_movable, bool to_tail)
>>>>  {
>>>>  	struct page *page;
>>>>  	unsigned int order;
>>>> @@ -2354,7 +2363,10 @@ static int move_freepages(struct zone *zone,
>>>>  		VM_BUG_ON_PAGE(page_zone(page) != zone, page);
>>>>  
>>>>  		order = page_order(page);
>>>> -		move_to_free_list(page, zone, order, migratetype);
>>>> +		if (to_tail)
>>>> +			move_to_free_list_tail(page, zone, order, migratetype);
>>>> +		else
>>>> +			move_to_free_list(page, zone, order, migratetype);
>>>>  		page += 1 << order;
>>>>  		pages_moved += 1 << order;
>>>>  	}
>>>> @@ -2362,8 +2374,9 @@ static int move_freepages(struct zone *zone,
>>>>  	return pages_moved;
>>>>  }
>>>>  
>>>> -int move_freepages_block(struct zone *zone, struct page *page,
>>>> -				int migratetype, int *num_movable)
>>>> +static int __move_freepages_block(struct zone *zone, struct page *page,
>>>> +				  int migratetype, int *num_movable,
>>>> +				  bool to_tail)
>>>>  {
>>>>  	unsigned long start_pfn, end_pfn;
>>>>  	struct page *start_page, *end_page;
>>>> @@ -2384,7 +2397,20 @@ int move_freepages_block(struct zone *zone, struct page *page,
>>>>  		return 0;
>>>>  
>>>>  	return move_freepages(zone, start_page, end_page, migratetype,
>>>> -								num_movable);
>>>> +			      num_movable, to_tail);
>>>> +}
>>>> +
>>>> +int move_freepages_block(struct zone *zone, struct page *page,
>>>> +			 int migratetype, int *num_movable)
>>>> +{
>>>> +	return __move_freepages_block(zone, page, migratetype, num_movable,
>>>> +				      false);
>>>> +}
>>>> +
>>>> +int move_freepages_block_tail(struct zone *zone, struct page *page,
>>>> +			      int migratetype)
>>>> +{
>>>> +	return __move_freepages_block(zone, page, migratetype, NULL, true);
>>>>  }
>>>
>>> Likewise, just 5 callers of move_freepages_block(), all in the files you're
>>> already changing, so no need for this wrappers IMHO.
> 
> As long as we don't want to move the implementation to the header, we'll
> need it for the constant propagation to work at compile time (we don't
> really have link-time optimizations). Or am I missing something?

I guess move_freepages_block() is not exactly fast path, so we could do without it.

> Thanks!
> 


