Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C8727C225
	for <lists+xen-devel@lfdr.de>; Tue, 29 Sep 2020 12:15:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.5.21 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNCev-0001hQ-Ss; Tue, 29 Sep 2020 10:14:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5.21; Tue, 29 Sep 2020 10:14:57 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNCev-0001h1-Ph; Tue, 29 Sep 2020 10:14:57 +0000
Received: by outflank-mailman (input) for mailman id 5;
 Tue, 29 Sep 2020 10:14:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=A5gt=DG=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1kNCeu-0001gu-Pr
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 10:14:56 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id a94e9a43-fab9-40ce-98af-8aa5a1d126d5;
 Tue, 29 Sep 2020 10:14:54 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-feZXzKz0OVioZCndwW4sww-1; Tue, 29 Sep 2020 06:14:50 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30C081019629;
 Tue, 29 Sep 2020 10:14:48 +0000 (UTC)
Received: from [10.36.112.157] (ovpn-112-157.ams2.redhat.com [10.36.112.157])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AD5FC5C1C4;
 Tue, 29 Sep 2020 10:14:43 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=A5gt=DG=redhat.com=david@srs-us1.protection.inumbo.net>)
	id 1kNCeu-0001gu-Pr
	for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 10:14:56 +0000
X-Inumbo-ID: a94e9a43-fab9-40ce-98af-8aa5a1d126d5
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id a94e9a43-fab9-40ce-98af-8aa5a1d126d5;
	Tue, 29 Sep 2020 10:14:54 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601374494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Qn75nCoqQgcl7F6rl9ofPOkbBShN1UveLnzcyqfdsaw=;
	b=HpaDK+IzpwYkmL8fQptFBtDJxFF75JITMn4PHIp2Jw4BibCbhl+YtBxaJZCNrQiPJBJHgO
	r3Aav2Ig5kJqYF2Z7a4l6b4Zj3IuIC8AdDsX2Xz4FI8RwlYVi2I/qKEqbPUYLczgZzcXPV
	xxExVBuGaAMR1Y7KHvvmQA/5qwHn0ds=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-feZXzKz0OVioZCndwW4sww-1; Tue, 29 Sep 2020 06:14:50 -0400
X-MC-Unique: feZXzKz0OVioZCndwW4sww-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30C081019629;
	Tue, 29 Sep 2020 10:14:48 +0000 (UTC)
Received: from [10.36.112.157] (ovpn-112-157.ams2.redhat.com [10.36.112.157])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AD5FC5C1C4;
	Tue, 29 Sep 2020 10:14:43 +0000 (UTC)
Subject: Re: [PATCH v1 4/5] mm/page_alloc: place pages to tail in
 __free_pages_core()
To: Wei Yang <richard.weiyang@linux.alibaba.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-hyperv@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-acpi@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Mel Gorman <mgorman@techsingularity.net>, Michal Hocko <mhocko@kernel.org>,
 Dave Hansen <dave.hansen@intel.com>, Mike Rapoport <rppt@kernel.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, Wei Liu <wei.liu@kernel.org>
References: <20200928182110.7050-1-david@redhat.com>
 <20200928182110.7050-5-david@redhat.com>
 <20200929093650.GC36904@L-31X9LVDL-1304.local>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 mQINBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABtCREYXZpZCBIaWxk
 ZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT6JAlgEEwEIAEICGwMGCwkIBwMCBhUIAgkKCwQW
 AgMBAh4BAheAAhkBFiEEG9nKrXNcTDpGDfzKTd4Q9wD/g1oFAl8Ox4kFCRKpKXgACgkQTd4Q
 9wD/g1oHcA//a6Tj7SBNjFNM1iNhWUo1lxAja0lpSodSnB2g4FCZ4R61SBR4l/psBL73xktp
 rDHrx4aSpwkRP6Epu6mLvhlfjmkRG4OynJ5HG1gfv7RJJfnUdUM1z5kdS8JBrOhMJS2c/gPf
 wv1TGRq2XdMPnfY2o0CxRqpcLkx4vBODvJGl2mQyJF/gPepdDfcT8/PY9BJ7FL6Hrq1gnAo4
 3Iv9qV0JiT2wmZciNyYQhmA1V6dyTRiQ4YAc31zOo2IM+xisPzeSHgw3ONY/XhYvfZ9r7W1l
 pNQdc2G+o4Di9NPFHQQhDw3YTRR1opJaTlRDzxYxzU6ZnUUBghxt9cwUWTpfCktkMZiPSDGd
 KgQBjnweV2jw9UOTxjb4LXqDjmSNkjDdQUOU69jGMUXgihvo4zhYcMX8F5gWdRtMR7DzW/YE
 BgVcyxNkMIXoY1aYj6npHYiNQesQlqjU6azjbH70/SXKM5tNRplgW8TNprMDuntdvV9wNkFs
 9TyM02V5aWxFfI42+aivc4KEw69SE9KXwC7FSf5wXzuTot97N9Phj/Z3+jx443jo2NR34XgF
 89cct7wJMjOF7bBefo0fPPZQuIma0Zym71cP61OP/i11ahNye6HGKfxGCOcs5wW9kRQEk8P9
 M/k2wt3mt/fCQnuP/mWutNPt95w9wSsUyATLmtNrwccz63W5Ag0EVcufkQEQAOfX3n0g0fZz
 Bgm/S2zF/kxQKCEKP8ID+Vz8sy2GpDvveBq4H2Y34XWsT1zLJdvqPI4af4ZSMxuerWjXbVWb
 T6d4odQIG0fKx4F8NccDqbgHeZRNajXeeJ3R7gAzvWvQNLz4piHrO/B4tf8svmRBL0ZB5P5A
 2uhdwLU3NZuK22zpNn4is87BPWF8HhY0L5fafgDMOqnf4guJVJPYNPhUFzXUbPqOKOkL8ojk
 CXxkOFHAbjstSK5Ca3fKquY3rdX3DNo+EL7FvAiw1mUtS+5GeYE+RMnDCsVFm/C7kY8c2d0G
 NWkB9pJM5+mnIoFNxy7YBcldYATVeOHoY4LyaUWNnAvFYWp08dHWfZo9WCiJMuTfgtH9tc75
 7QanMVdPt6fDK8UUXIBLQ2TWr/sQKE9xtFuEmoQGlE1l6bGaDnnMLcYu+Asp3kDT0w4zYGsx
 5r6XQVRH4+5N6eHZiaeYtFOujp5n+pjBaQK7wUUjDilPQ5QMzIuCL4YjVoylWiBNknvQWBXS
 lQCWmavOT9sttGQXdPCC5ynI+1ymZC1ORZKANLnRAb0NH/UCzcsstw2TAkFnMEbo9Zu9w7Kv
 AxBQXWeXhJI9XQssfrf4Gusdqx8nPEpfOqCtbbwJMATbHyqLt7/oz/5deGuwxgb65pWIzufa
 N7eop7uh+6bezi+rugUI+w6DABEBAAGJAjwEGAEIACYCGwwWIQQb2cqtc1xMOkYN/MpN3hD3
 AP+DWgUCXw7HsgUJEqkpoQAKCRBN3hD3AP+DWrrpD/4qS3dyVRxDcDHIlmguXjC1Q5tZTwNB
 boaBTPHSy/Nksu0eY7x6HfQJ3xajVH32Ms6t1trDQmPx2iP5+7iDsb7OKAb5eOS8h+BEBDeq
 3ecsQDv0fFJOA9ag5O3LLNk+3x3q7e0uo06XMaY7UHS341ozXUUI7wC7iKfoUTv03iO9El5f
 XpNMx/YrIMduZ2+nd9Di7o5+KIwlb2mAB9sTNHdMrXesX8eBL6T9b+MZJk+mZuPxKNVfEQMQ
 a5SxUEADIPQTPNvBewdeI80yeOCrN+Zzwy/Mrx9EPeu59Y5vSJOx/z6OUImD/GhX7Xvkt3kq
 Er5KTrJz3++B6SH9pum9PuoE/k+nntJkNMmQpR4MCBaV/J9gIOPGodDKnjdng+mXliF3Ptu6
 3oxc2RCyGzTlxyMwuc2U5Q7KtUNTdDe8T0uE+9b8BLMVQDDfJjqY0VVqSUwImzTDLX9S4g/8
 kC4HRcclk8hpyhY2jKGluZO0awwTIMgVEzmTyBphDg/Gx7dZU1Xf8HFuE+UZ5UDHDTnwgv7E
 th6RC9+WrhDNspZ9fJjKWRbveQgUFCpe1sa77LAw+XFrKmBHXp9ZVIe90RMe2tRL06BGiRZr
 jPrnvUsUUsjRoRNJjKKA/REq+sAnhkNPPZ/NNMjaZ5b8Tovi8C0tmxiCHaQYqj7G2rgnT0kt
 WNyWQQ==
Organization: Red Hat GmbH
Message-ID: <2a21e515-6cae-5aa1-783b-696d93d348fd@redhat.com>
Date: Tue, 29 Sep 2020 12:14:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200929093650.GC36904@L-31X9LVDL-1304.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16

On 29.09.20 11:36, Wei Yang wrote:
> On Mon, Sep 28, 2020 at 08:21:09PM +0200, David Hildenbrand wrote:
>> __free_pages_core() is used when exposing fresh memory to the buddy
>> during system boot and when onlining memory in generic_online_page().
>>
>> generic_online_page() is used in two cases:
>>
>> 1. Direct memory onlining in online_pages().
>> 2. Deferred memory onlining in memory-ballooning-like mechanisms (HyperV
>>   balloon and virtio-mem), when parts of a section are kept
>>   fake-offline to be fake-onlined later on.
>>
>> In 1, we already place pages to the tail of the freelist. Pages will be
>> freed to MIGRATE_ISOLATE lists first and moved to the tail of the freelists
>> via undo_isolate_page_range().
>>
>> In 2, we currently don't implement a proper rule. In case of virtio-mem,
>> where we currently always online MAX_ORDER - 1 pages, the pages will be
>> placed to the HEAD of the freelist - undesireable. While the hyper-v
>> balloon calls generic_online_page() with single pages, usually it will
>> call it on successive single pages in a larger block.
>>
>> The pages are fresh, so place them to the tail of the freelists and avoid
>> the PCP. In __free_pages_core(), remove the now superflouos call to
>> set_page_refcounted() and add a comment regarding page initialization and
>> the refcount.
>>
>> Note: In 2. we currently don't shuffle. If ever relevant (page shuffling
>> is usually of limited use in virtualized environments), we might want to
>> shuffle after a sequence of generic_online_page() calls in the
>> relevant callers.
>>
>> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
>> Reviewed-by: Oscar Salvador <osalvador@suse.de>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: Alexander Duyck <alexander.h.duyck@linux.intel.com>
>> Cc: Mel Gorman <mgorman@techsingularity.net>
>> Cc: Michal Hocko <mhocko@kernel.org>
>> Cc: Dave Hansen <dave.hansen@intel.com>
>> Cc: Vlastimil Babka <vbabka@suse.cz>
>> Cc: Wei Yang <richard.weiyang@linux.alibaba.com>
>> Cc: Oscar Salvador <osalvador@suse.de>
>> Cc: Mike Rapoport <rppt@kernel.org>
>> Cc: "K. Y. Srinivasan" <kys@microsoft.com>
>> Cc: Haiyang Zhang <haiyangz@microsoft.com>
>> Cc: Stephen Hemminger <sthemmin@microsoft.com>
>> Cc: Wei Liu <wei.liu@kernel.org>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>> mm/page_alloc.c | 37 ++++++++++++++++++++++++-------------
>> 1 file changed, 24 insertions(+), 13 deletions(-)
>>
>> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
>> index d5a5f528b8ca..8a2134fe9947 100644
>> --- a/mm/page_alloc.c
>> +++ b/mm/page_alloc.c
>> @@ -270,7 +270,8 @@ bool pm_suspended_storage(void)
>> unsigned int pageblock_order __read_mostly;
>> #endif
>>
>> -static void __free_pages_ok(struct page *page, unsigned int order);
>> +static void __free_pages_ok(struct page *page, unsigned int order,
>> +			    fop_t fop_flags);
>>
>> /*
>>  * results with 256, 32 in the lowmem_reserve sysctl:
>> @@ -682,7 +683,7 @@ static void bad_page(struct page *page, const char *reason)
>> void free_compound_page(struct page *page)
>> {
>> 	mem_cgroup_uncharge(page);
>> -	__free_pages_ok(page, compound_order(page));
>> +	__free_pages_ok(page, compound_order(page), FOP_NONE);
>> }
>>
>> void prep_compound_page(struct page *page, unsigned int order)
>> @@ -1419,17 +1420,15 @@ static void free_pcppages_bulk(struct zone *zone, int count,
>> 	spin_unlock(&zone->lock);
>> }
>>
>> -static void free_one_page(struct zone *zone,
>> -				struct page *page, unsigned long pfn,
>> -				unsigned int order,
>> -				int migratetype)
>> +static void free_one_page(struct zone *zone, struct page *page, unsigned long pfn,
>> +			  unsigned int order, int migratetype, fop_t fop_flags)
>> {
>> 	spin_lock(&zone->lock);
>> 	if (unlikely(has_isolate_pageblock(zone) ||
>> 		is_migrate_isolate(migratetype))) {
>> 		migratetype = get_pfnblock_migratetype(page, pfn);
>> 	}
>> -	__free_one_page(page, pfn, zone, order, migratetype, FOP_NONE);
>> +	__free_one_page(page, pfn, zone, order, migratetype, fop_flags);
>> 	spin_unlock(&zone->lock);
>> }
>>
>> @@ -1507,7 +1506,8 @@ void __meminit reserve_bootmem_region(phys_addr_t start, phys_addr_t end)
>> 	}
>> }
>>
>> -static void __free_pages_ok(struct page *page, unsigned int order)
>> +static void __free_pages_ok(struct page *page, unsigned int order,
>> +			    fop_t fop_flags)
>> {
>> 	unsigned long flags;
>> 	int migratetype;
>> @@ -1519,7 +1519,8 @@ static void __free_pages_ok(struct page *page, unsigned int order)
>> 	migratetype = get_pfnblock_migratetype(page, pfn);
>> 	local_irq_save(flags);
>> 	__count_vm_events(PGFREE, 1 << order);
>> -	free_one_page(page_zone(page), page, pfn, order, migratetype);
>> +	free_one_page(page_zone(page), page, pfn, order, migratetype,
>> +		      fop_flags);
>> 	local_irq_restore(flags);
>> }
>>
>> @@ -1529,6 +1530,11 @@ void __free_pages_core(struct page *page, unsigned int order)
>> 	struct page *p = page;
>> 	unsigned int loop;
>>
>> +	/*
>> +	 * When initializing the memmap, init_single_page() sets the refcount
> 
> If my code is the latest version.
> 
> s/init_single_page/__init_single_page/

Indeed - thanks!


-- 
Thanks,

David / dhildenb


