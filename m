Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AE3577F5A
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 12:09:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369495.600939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDNgQ-0008Ny-Sz; Mon, 18 Jul 2022 10:08:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369495.600939; Mon, 18 Jul 2022 10:08:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDNgQ-0008Lu-Q6; Mon, 18 Jul 2022 10:08:58 +0000
Received: by outflank-mailman (input) for mailman id 369495;
 Mon, 18 Jul 2022 10:08:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oDNgP-0008Lo-E6
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 10:08:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oDNgM-0003j9-Fb; Mon, 18 Jul 2022 10:08:54 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231] helo=[10.7.237.21])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oDNgM-0000Gy-9w; Mon, 18 Jul 2022 10:08:54 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=gg/eIRBR+2729+QDn3Xu6pAoLH4/146HRGNk99x43K0=; b=oTkJIAk6HBHdfoSRbceft2zpvs
	0UAEEk3lUvnD8yqmECo533fCwVkWHGpS6zOuVVkCKSvCnR/TkaUWp2OTUc4ByyGt9HFXppBA+6X23
	ln0owUgxcsBUSVJqubJJ7M08cqkJBGoALzLbX05lM84LH3MGEg92iw9fAIqBHf3d6BM4=;
Message-ID: <be525e4d-1dd0-bc4d-1b26-c4483e16cc10@xen.org>
Date: Mon, 18 Jul 2022 11:08:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v2 2/3] xen/heap: Split init_heap_pages() in two
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220715170312.13931-1-julien@xen.org>
 <20220715170312.13931-3-julien@xen.org>
 <07304aef-e278-9da9-ebd9-640ac7933268@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <07304aef-e278-9da9-ebd9-640ac7933268@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 18/07/2022 10:31, Jan Beulich wrote:
> On 15.07.2022 19:03, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> At the moment, init_heap_pages() will call free_heap_pages() page
>> by page. To reduce the time to initialize the heap, we will want
>> to provide multiple pages at the same time.
>>
>> init_heap_pages() is now split in two parts:
>>      - init_heap_pages(): will break down the range in multiple set
>>        of contiguous pages. For now, the criteria is the pages should
>>        belong to the same NUMA node.
>>      - _init_heap_pages(): will initialize a set of pages belonging to
>>        the same NUMA node. In a follow-up patch, new requirements will
>>        be added (e.g. pages should belong to the same zone). For now the
>>        pages are still passed one by one to free_heap_pages().
>>
>> Note that the comment before init_heap_pages() is heavily outdated and
>> does not reflect the current code. So update it.
>>
>> This patch is a merge/rework of patches from David Woodhouse and
>> Hongyan Xia.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>> --- a/xen/common/page_alloc.c
>> +++ b/xen/common/page_alloc.c
>> @@ -1778,16 +1778,44 @@ int query_page_offline(mfn_t mfn, uint32_t *status)
>>   }
>>   
>>   /*
>> - * Hand the specified arbitrary page range to the specified heap zone
>> - * checking the node_id of the previous page.  If they differ and the
>> - * latter is not on a MAX_ORDER boundary, then we reserve the page by
>> - * not freeing it to the buddy allocator.
>> + * This function should only be called with valid pages from the same NUMA
>> + * node.
>>    */
>> +static void _init_heap_pages(const struct page_info *pg,
>> +                             unsigned long nr_pages,
>> +                             bool need_scrub)
>> +{
>> +    unsigned long s, e;
>> +    unsigned int nid = phys_to_nid(page_to_maddr(pg));
>> +
>> +    s = mfn_x(page_to_mfn(pg));
>> +    e = mfn_x(mfn_add(page_to_mfn(pg + nr_pages - 1), 1));
>> +    if ( unlikely(!avail[nid]) )
>> +    {
>> +        bool use_tail = IS_ALIGNED(s, 1UL << MAX_ORDER) &&
>> +                        (find_first_set_bit(e) <= find_first_set_bit(s));
>> +        unsigned long n;
>> +
>> +        n = init_node_heap(nid, s, nr_pages, &use_tail);
>> +        BUG_ON(n > nr_pages);
>> +        if ( use_tail )
>> +            e -= n;
>> +        else
>> +            s += n;
>> +    }
>> +
>> +    while ( s < e )
>> +    {
>> +        free_heap_pages(mfn_to_page(_mfn(s)), 0, need_scrub);
>> +        s += 1UL;
> 
> ... the more conventional s++ or ++s used here?

I would prefer to keep using "s += 1UL" here because:
   * it will be replace with a proper order in the follow-up patch. So 
this is temporary.
   * one could argue that if I use "s++" then I should also switch to a 
for loop which would make sense here but not in the next patch.

Cheers,

-- 
Julien Grall

