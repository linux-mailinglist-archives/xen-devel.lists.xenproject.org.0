Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDB8278236
	for <lists+xen-devel@lfdr.de>; Fri, 25 Sep 2020 10:06:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLijr-000868-7n; Fri, 25 Sep 2020 08:05:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tfUW=DC=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1kLijp-000860-7y
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2020 08:05:53 +0000
X-Inumbo-ID: 5383086c-198b-4142-877a-0edaa6242b38
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 5383086c-198b-4142-877a-0edaa6242b38;
 Fri, 25 Sep 2020 08:05:51 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601021151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=vidvUR1epLIvF1mD3Tgv/ZZzHmZGAlTY9AzQCmTllmA=;
 b=ELfK+bPJetN5PSlQetsG9UG8+2QGoKyP0dIei5WQXFta++ZmPDb3lsvITXz22f5baz8QkR
 H0kBF36V6kDux5XguE23t0olTQGVT5GXATBHcPcBf1kN2fP9YzvIZRsKm5uoCkkx38jMfp
 VhP0bcR0RLR0A31jT5UrRKfZ+2RkjQs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-cDJODdgCMf-2m7MzQdnr5w-1; Fri, 25 Sep 2020 04:05:48 -0400
X-MC-Unique: cDJODdgCMf-2m7MzQdnr5w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E89288CE5F;
 Fri, 25 Sep 2020 08:05:46 +0000 (UTC)
Received: from [10.36.112.211] (ovpn-112-211.ams2.redhat.com [10.36.112.211])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D6B117B7A3;
 Fri, 25 Sep 2020 08:05:42 +0000 (UTC)
Subject: Re: [PATCH RFC 3/4] mm/page_alloc: always move pages to the tail of
 the freelist in unset_migratetype_isolate()
To: Wei Yang <richard.weiyang@linux.alibaba.com>,
 Vlastimil Babka <vbabka@suse.cz>
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
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
 WNyWQQ==
Organization: Red Hat GmbH
Message-ID: <dc550ba3-6b65-bb4e-30a3-2740b1e21be9@redhat.com>
Date: Fri, 25 Sep 2020 10:05:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200925024552.GA13540@L-31X9LVDL-1304.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

On 25.09.20 04:45, Wei Yang wrote:
> On Thu, Sep 24, 2020 at 01:13:29PM +0200, Vlastimil Babka wrote:
>> On 9/16/20 8:34 PM, David Hildenbrand wrote:
>>> Page isolation doesn't actually touch the pages, it simply isolates
>>> pageblocks and moves all free pages to the MIGRATE_ISOLATE freelist.
>>>
>>> We already place pages to the tail of the freelists when undoing
>>> isolation via __putback_isolated_page(), let's do it in any case
>>> (e.g., if order == pageblock_order) and document the behavior.
>>>
>>> This change results in all pages getting onlined via online_pages() to
>>> be placed to the tail of the freelist.
>>>
>>> Cc: Andrew Morton <akpm@linux-foundation.org>
>>> Cc: Alexander Duyck <alexander.h.duyck@linux.intel.com>
>>> Cc: Mel Gorman <mgorman@techsingularity.net>
>>> Cc: Michal Hocko <mhocko@kernel.org>
>>> Cc: Dave Hansen <dave.hansen@intel.com>
>>> Cc: Vlastimil Babka <vbabka@suse.cz>
>>> Cc: Wei Yang <richard.weiyang@linux.alibaba.com>
>>> Cc: Oscar Salvador <osalvador@suse.de>
>>> Cc: Mike Rapoport <rppt@kernel.org>
>>> Cc: Scott Cheloha <cheloha@linux.ibm.com>
>>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>> ---
>>>  include/linux/page-isolation.h |  2 ++
>>>  mm/page_alloc.c                | 36 +++++++++++++++++++++++++++++-----
>>>  mm/page_isolation.c            |  8 ++++++--
>>>  3 files changed, 39 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/include/linux/page-isolation.h b/include/linux/page-isolation.h
>>> index 572458016331..a36be2cf4dbb 100644
>>> --- a/include/linux/page-isolation.h
>>> +++ b/include/linux/page-isolation.h
>>> @@ -38,6 +38,8 @@ struct page *has_unmovable_pages(struct zone *zone, struct page *page,
>>>  void set_pageblock_migratetype(struct page *page, int migratetype);
>>>  int move_freepages_block(struct zone *zone, struct page *page,
>>>  				int migratetype, int *num_movable);
>>> +int move_freepages_block_tail(struct zone *zone, struct page *page,
>>> +			      int migratetype);
>>>  
>>>  /*
>>>   * Changes migrate type in [start_pfn, end_pfn) to be MIGRATE_ISOLATE.
>>> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
>>> index bba9a0f60c70..75b0f49b4022 100644
>>> --- a/mm/page_alloc.c
>>> +++ b/mm/page_alloc.c
>>> @@ -899,6 +899,15 @@ static inline void move_to_free_list(struct page *page, struct zone *zone,
>>>  	list_move(&page->lru, &area->free_list[migratetype]);
>>>  }
>>>  
>>> +/* Used for pages which are on another list */
>>> +static inline void move_to_free_list_tail(struct page *page, struct zone *zone,
>>> +					  unsigned int order, int migratetype)
>>> +{
>>> +	struct free_area *area = &zone->free_area[order];
>>> +
>>> +	list_move_tail(&page->lru, &area->free_list[migratetype]);
>>> +}
>>
>> There are just 3 callers of move_to_free_list() before this patch, I would just
>> add the to_tail parameter there instead of new wrapper. For callers with
>> constant parameter, the inline will eliminate it anyway.
> 
> Got the same feeling :-)

I once was told boolean parameters are the root of all evil, so I tried
to keep them file-local :)

One thing to be aware of is, that inline optimizations won't help as
long as this function is in mm/page_alloc.c, see below.

> 
>>
>>>  static inline void del_page_from_free_list(struct page *page, struct zone *zone,
>>>  					   unsigned int order)
>>>  {
>>> @@ -2323,7 +2332,7 @@ static inline struct page *__rmqueue_cma_fallback(struct zone *zone,
>>>   */
>>>  static int move_freepages(struct zone *zone,
>>>  			  struct page *start_page, struct page *end_page,
>>> -			  int migratetype, int *num_movable)
>>> +			  int migratetype, int *num_movable, bool to_tail)
>>>  {
>>>  	struct page *page;
>>>  	unsigned int order;
>>> @@ -2354,7 +2363,10 @@ static int move_freepages(struct zone *zone,
>>>  		VM_BUG_ON_PAGE(page_zone(page) != zone, page);
>>>  
>>>  		order = page_order(page);
>>> -		move_to_free_list(page, zone, order, migratetype);
>>> +		if (to_tail)
>>> +			move_to_free_list_tail(page, zone, order, migratetype);
>>> +		else
>>> +			move_to_free_list(page, zone, order, migratetype);
>>>  		page += 1 << order;
>>>  		pages_moved += 1 << order;
>>>  	}
>>> @@ -2362,8 +2374,9 @@ static int move_freepages(struct zone *zone,
>>>  	return pages_moved;
>>>  }
>>>  
>>> -int move_freepages_block(struct zone *zone, struct page *page,
>>> -				int migratetype, int *num_movable)
>>> +static int __move_freepages_block(struct zone *zone, struct page *page,
>>> +				  int migratetype, int *num_movable,
>>> +				  bool to_tail)
>>>  {
>>>  	unsigned long start_pfn, end_pfn;
>>>  	struct page *start_page, *end_page;
>>> @@ -2384,7 +2397,20 @@ int move_freepages_block(struct zone *zone, struct page *page,
>>>  		return 0;
>>>  
>>>  	return move_freepages(zone, start_page, end_page, migratetype,
>>> -								num_movable);
>>> +			      num_movable, to_tail);
>>> +}
>>> +
>>> +int move_freepages_block(struct zone *zone, struct page *page,
>>> +			 int migratetype, int *num_movable)
>>> +{
>>> +	return __move_freepages_block(zone, page, migratetype, num_movable,
>>> +				      false);
>>> +}
>>> +
>>> +int move_freepages_block_tail(struct zone *zone, struct page *page,
>>> +			      int migratetype)
>>> +{
>>> +	return __move_freepages_block(zone, page, migratetype, NULL, true);
>>>  }
>>
>> Likewise, just 5 callers of move_freepages_block(), all in the files you're
>> already changing, so no need for this wrappers IMHO.

As long as we don't want to move the implementation to the header, we'll
need it for the constant propagation to work at compile time (we don't
really have link-time optimizations). Or am I missing something?

Thanks!

-- 
Thanks,

David / dhildenb


