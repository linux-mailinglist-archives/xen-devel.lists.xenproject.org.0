Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1AE27E2E3
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 09:48:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.460.1445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNWqi-00076g-2L; Wed, 30 Sep 2020 07:48:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460.1445; Wed, 30 Sep 2020 07:48:28 +0000
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
	id 1kNWqh-00076H-V6; Wed, 30 Sep 2020 07:48:27 +0000
Received: by outflank-mailman (input) for mailman id 460;
 Wed, 30 Sep 2020 07:48:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XJGA=DH=linux.alibaba.com=richard.weiyang@srs-us1.protection.inumbo.net>)
 id 1kNWqg-00076C-Hx
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 07:48:26 +0000
Received: from out30-54.freemail.mail.aliyun.com (unknown [115.124.30.54])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f5893384-c70e-479a-9a20-47f4b71eb9d6;
 Wed, 30 Sep 2020 07:48:22 +0000 (UTC)
Received: from localhost(mailfrom:richard.weiyang@linux.alibaba.com
 fp:SMTPD_---0UAYdEKG_1601452096) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 30 Sep 2020 15:48:16 +0800
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=XJGA=DH=linux.alibaba.com=richard.weiyang@srs-us1.protection.inumbo.net>)
	id 1kNWqg-00076C-Hx
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 07:48:26 +0000
X-Inumbo-ID: f5893384-c70e-479a-9a20-47f4b71eb9d6
Received: from out30-54.freemail.mail.aliyun.com (unknown [115.124.30.54])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id f5893384-c70e-479a-9a20-47f4b71eb9d6;
	Wed, 30 Sep 2020 07:48:22 +0000 (UTC)
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04423;MF=richard.weiyang@linux.alibaba.com;NM=1;PH=DS;RN=17;SR=0;TI=SMTPD_---0UAYdEKG_1601452096;
Received: from localhost(mailfrom:richard.weiyang@linux.alibaba.com fp:SMTPD_---0UAYdEKG_1601452096)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 30 Sep 2020 15:48:16 +0800
Date: Wed, 30 Sep 2020 15:48:16 +0800
From: Wei Yang <richard.weiyang@linux.alibaba.com>
To: David Hildenbrand <david@redhat.com>
Cc: Wei Yang <richard.weiyang@linux.alibaba.com>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-hyperv@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-acpi@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>,
	Alexander Duyck <alexander.h.duyck@linux.intel.com>,
	Mel Gorman <mgorman@techsingularity.net>,
	Michal Hocko <mhocko@kernel.org>,
	Dave Hansen <dave.hansen@intel.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Scott Cheloha <cheloha@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v1 3/5] mm/page_alloc: always move pages to the tail of
 the freelist in unset_migratetype_isolate()
Message-ID: <20200930074816.GA40431@L-31X9LVDL-1304.local>
Reply-To: Wei Yang <richard.weiyang@linux.alibaba.com>
References: <20200928182110.7050-1-david@redhat.com>
 <20200928182110.7050-4-david@redhat.com>
 <20200929091803.GB36904@L-31X9LVDL-1304.local>
 <21d9ea16-863b-19fe-e5b7-841bb4228c6d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <21d9ea16-863b-19fe-e5b7-841bb4228c6d@redhat.com>

On Tue, Sep 29, 2020 at 12:12:14PM +0200, David Hildenbrand wrote:
>On 29.09.20 11:18, Wei Yang wrote:
>> On Mon, Sep 28, 2020 at 08:21:08PM +0200, David Hildenbrand wrote:
>>> Page isolation doesn't actually touch the pages, it simply isolates
>>> pageblocks and moves all free pages to the MIGRATE_ISOLATE freelist.
>>>
>>> We already place pages to the tail of the freelists when undoing
>>> isolation via __putback_isolated_page(), let's do it in any case
>>> (e.g., if order <= pageblock_order) and document the behavior.
>>>
>>> Add a "to_tail" parameter to move_freepages_block() but introduce a
>>> a new move_to_free_list_tail() - similar to add_to_free_list_tail().
>
>s/a a/a/
>
>>>
>>> This change results in all pages getting onlined via online_pages() to
>>> be placed to the tail of the freelist.
>>>
>>> Reviewed-by: Oscar Salvador <osalvador@suse.de>
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
>>> include/linux/page-isolation.h |  4 ++--
>>> mm/page_alloc.c                | 35 +++++++++++++++++++++++-----------
>>> mm/page_isolation.c            | 12 +++++++++---
>>> 3 files changed, 35 insertions(+), 16 deletions(-)
>>>
>>> diff --git a/include/linux/page-isolation.h b/include/linux/page-isolation.h
>>> index 572458016331..3eca9b3c5305 100644
>>> --- a/include/linux/page-isolation.h
>>> +++ b/include/linux/page-isolation.h
>>> @@ -36,8 +36,8 @@ static inline bool is_migrate_isolate(int migratetype)
>>> struct page *has_unmovable_pages(struct zone *zone, struct page *page,
>>> 				 int migratetype, int flags);
>>> void set_pageblock_migratetype(struct page *page, int migratetype);
>>> -int move_freepages_block(struct zone *zone, struct page *page,
>>> -				int migratetype, int *num_movable);
>>> +int move_freepages_block(struct zone *zone, struct page *page, int migratetype,
>>> +			 bool to_tail, int *num_movable);
>>>
>>> /*
>>>  * Changes migrate type in [start_pfn, end_pfn) to be MIGRATE_ISOLATE.
>>> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
>>> index 9e3ed4a6f69a..d5a5f528b8ca 100644
>>> --- a/mm/page_alloc.c
>>> +++ b/mm/page_alloc.c
>>> @@ -905,6 +905,15 @@ static inline void move_to_free_list(struct page *page, struct zone *zone,
>>> 	list_move(&page->lru, &area->free_list[migratetype]);
>>> }
>>>
>>> +/* Used for pages which are on another list */
>>> +static inline void move_to_free_list_tail(struct page *page, struct zone *zone,
>>> +					  unsigned int order, int migratetype)
>>> +{
>>> +	struct free_area *area = &zone->free_area[order];
>>> +
>>> +	list_move_tail(&page->lru, &area->free_list[migratetype]);
>>> +}
>>> +
>> 
>> Would it be better to pass the *to_tail* to move_to_free_list(), so we won't
>> have a new function?
>
>Hi,
>
>thanks for the review!
>
>See discussion in RFC + cover letter:
>
>"Add a "to_tail" parameter to move_freepages_block() but introduce a new
>move_to_free_list_tail() - similar to add_to_free_list_tail()."

Hmm, sounds reasonable.

Reviewed-by: Wei Yang <richard.weiyang@linux.alibaba.com>

-- 
Wei Yang
Help you, Help me

