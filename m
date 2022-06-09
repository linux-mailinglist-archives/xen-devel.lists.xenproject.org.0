Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57827544D56
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 15:19:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.345483.571046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzI3U-0000TB-JX; Thu, 09 Jun 2022 13:18:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 345483.571046; Thu, 09 Jun 2022 13:18:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzI3U-0000Pu-GK; Thu, 09 Jun 2022 13:18:32 +0000
Received: by outflank-mailman (input) for mailman id 345483;
 Thu, 09 Jun 2022 13:18:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nzI3T-0000Pn-5a
 for xen-devel@lists.xenproject.org; Thu, 09 Jun 2022 13:18:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nzI3N-0007uV-JX; Thu, 09 Jun 2022 13:18:25 +0000
Received: from [54.239.6.190] (helo=[10.85.101.129])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nzI3N-0006MY-CO; Thu, 09 Jun 2022 13:18:25 +0000
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
	bh=efunnnPbqK4GXOt7CvuhUtWV5yBMfFXIffr2EMXOBSE=; b=BgcCHPoPzx6RtMOgmi05Y3zoD/
	TxeeF1zAKY61i2uXtB4sz/7MIxL3oIJDAnGQ3pG2MV4PdXXfptzt94+a2MOkdGwYvZEsdL60DiY8X
	nz8s5nve1uIxXICW/MbSgE7C0o5I2ZvtyZN6Tj+05TpbwFPH2ppThAQkfxRPaIhlU10U=;
Message-ID: <d18ddf8e-7829-4e88-afaf-684b47d8f180@xen.org>
Date: Thu, 9 Jun 2022 14:18:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH 1/2] xen/heap: Split init_heap_pages() in two
To: Jan Beulich <jbeulich@suse.com>
Cc: bertrand.marquis@arm.com, Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220609083039.76667-1-julien@xen.org>
 <20220609083039.76667-2-julien@xen.org>
 <23552ac7-7548-9dad-fe41-7dc581c78585@suse.com>
 <b3d82607-a7ae-52b3-a9e4-d50780d35b9c@xen.org>
 <f4e6c1a2-639e-d9e0-5cac-c34cf5f148d7@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <f4e6c1a2-639e-d9e0-5cac-c34cf5f148d7@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 09/06/2022 14:12, Jan Beulich wrote:
> On 09.06.2022 14:33, Julien Grall wrote:
>> On 09/06/2022 13:09, Jan Beulich wrote:
>>> On 09.06.2022 10:30, Julien Grall wrote:
>>>> From: Julien Grall <jgrall@amazon.com>
>>>>
>>>> At the moment, init_heap_pages() will call free_heap_pages() page
>>>> by page. To reduce the time to initialize the heap, we will want
>>>> to provide multiple pages at the same time.
>>>>
>>>> init_heap_pages() is now split in two parts:
>>>>       - init_heap_pages(): will break down the range in multiple set
>>>>         of contiguous pages. For now, the criteria is the pages should
>>>>         belong to the same NUMA node.
>>>>       - init_contig_pages(): will initialize a set of contiguous pages.
>>>>         For now the pages are still passed one by one to free_heap_pages().
>>>
>>> Hmm, the common use of "contiguous" is to describe address correlation.
>>> Therefore I'm afraid I'd like to see "contig" avoided when you mean
>>> "same node". Perhaps init_node_pages()?
>>
>> After the next patch, it will not only be the same node, It will also be
>> the same zone at least. Also, in the future, I would like to
>> re-submitting David Woodhouse patch to exclude broken pages (see [1]).
>>
>> Therefore, I think the name init_node_pages() would not be suitable.
>> Please suggest a different name.
> 
> _init_heap_pages() then, as a helper of init_heap_pages()?

I am fine with your proposed named. That said...

> 
>>>> --- a/xen/common/page_alloc.c
>>>> +++ b/xen/common/page_alloc.c
>>>> @@ -1778,16 +1778,55 @@ int query_page_offline(mfn_t mfn, uint32_t *status)
>>>>    }
>>>>    
>>>>    /*
>>>> - * Hand the specified arbitrary page range to the specified heap zone
>>>> - * checking the node_id of the previous page.  If they differ and the
>>>> - * latter is not on a MAX_ORDER boundary, then we reserve the page by
>>>> - * not freeing it to the buddy allocator.
>>>> + * init_contig_heap_pages() is intended to only take pages from the same
>>>> + * NUMA node.
>>>>     */
>>>> +static bool is_contig_page(struct page_info *pg, unsigned int nid)
>>>> +{
>>>> +    return (nid == (phys_to_nid(page_to_maddr(pg))));
>>>> +}
>>>
>>> If such a helper is indeed needed, then I think it absolutely wants
>>> pg to be pointer-to-const. And imo it would also help readability if
>>> the extra pair of parentheses around the nested function calls was
>>> omitted. Given the naming concern, though, I wonder whether this
>>> wouldn't better be open-coded in the one place it is used. Actually
>>> naming is quite odd here beyond what I'd said further up: "Is this
>>> page contiguous?" Such a question requires two pages, i.e. "Are these
>>> two pages contiguous?" What you want to know is "Is this page on the
>>> given node?"
>>
>> There will be more check in the future (see next patch). I created an
>> helper because it reduces the size of the loop init_heap_pages(). I
>> would be OK to fold it if you strongly prefer that.
> 
> I don't "strongly" prefer that; I'd also be okay with a suitably named
> helper. Just that I can't seem to be able to come up with any good name.

... I am not sure what could be a suitable name for this helper. I will 
have a look how bad the fold version look like.

> 
>>>> +/*
>>>> + * This function should only be called with valid pages from the same NUMA
>>>> + * node.
>>>> + *
>>>> + * Callers should use is_contig_page() first to check if all the pages
>>>> + * in a range are contiguous.
>>>> + */
>>>> +static void init_contig_heap_pages(struct page_info *pg, unsigned long nr_pages,
>>>> +                                   bool need_scrub)
>>>> +{
>>>> +    unsigned long s, e;
>>>> +    unsigned int nid = phys_to_nid(page_to_maddr(pg));
>>>> +
>>>> +    s = mfn_x(page_to_mfn(pg));
>>>> +    e = mfn_x(mfn_add(page_to_mfn(pg + nr_pages - 1), 1));
>>>> +    if ( unlikely(!avail[nid]) )
>>>> +    {
>>>> +        bool use_tail = !(s & ((1UL << MAX_ORDER) - 1)) &&
>>>
>>> IS_ALIGNED(s, 1UL << MAX_ORDER) to "describe" what's meant?
>>
>> This is existing code and it is quite complex. So I would prefer if we
>> avoid to simplify and move the code in the same patch. I would be happy
>> to write a follow-up patch to switch to IS_ALIGNED().
> 
> I do realize it's code you move, but I can accept your desire to merely
> move the code without any cleanup. Personally I think that rather than a
> follow-up patch (which doesn't help the reviewing of this one) such an
> adjustment would better be a prereq one.

I will look for a prereq.

> 
>>>> @@ -1812,35 +1851,24 @@ static void init_heap_pages(
>>>>        spin_unlock(&heap_lock);
>>>>    
>>>>        if ( system_state < SYS_STATE_active && opt_bootscrub == BOOTSCRUB_IDLE )
>>>> -        idle_scrub = true;
>>>> +        need_scrub = true;
>>>>    
>>>> -    for ( i = 0; i < nr_pages; i++ )
>>>> +    for ( i = 0; i < nr_pages; )
>>>>        {
>>>> -        unsigned int nid = phys_to_nid(page_to_maddr(pg+i));
>>>> +        unsigned int nid = phys_to_nid(page_to_maddr(pg));
>>>> +        unsigned long left = nr_pages - i;
>>>> +        unsigned long contig_pages;
>>>>    
>>>> -        if ( unlikely(!avail[nid]) )
>>>> +        for ( contig_pages = 1; contig_pages < left; contig_pages++ )
>>>>            {
>>>> -            unsigned long s = mfn_x(page_to_mfn(pg + i));
>>>> -            unsigned long e = mfn_x(mfn_add(page_to_mfn(pg + nr_pages - 1), 1));
>>>> -            bool use_tail = (nid == phys_to_nid(pfn_to_paddr(e - 1))) &&
>>>> -                            !(s & ((1UL << MAX_ORDER) - 1)) &&
>>>> -                            (find_first_set_bit(e) <= find_first_set_bit(s));
>>>> -            unsigned long n;
>>>> -
>>>> -            n = init_node_heap(nid, mfn_x(page_to_mfn(pg + i)), nr_pages - i,
>>>> -                               &use_tail);
>>>> -            BUG_ON(i + n > nr_pages);
>>>> -            if ( n && !use_tail )
>>>> -            {
>>>> -                i += n - 1;
>>>> -                continue;
>>>> -            }
>>>> -            if ( i + n == nr_pages )
>>>> +            if ( !is_contig_page(pg + contig_pages, nid) )
>>>>                    break;
>>>> -            nr_pages -= n;
>>>>            }
>>>
>>> Isn't doing this page by page in a loop quite inefficient? Can't you
>>> simply obtain the end of the node's range covering the first page, and
>>> then adjust "left" accordingly?
>>
>> The page by page is necessary because we may need to exclude some pages
>> (see [1]) or the range may cross multiple-zone (see [2]).
> 
> If you want/need to do this for "future" reasons (aiui [1] was never
> committed

You are correct. I would like to revive it at some point.

, and you forgot to supply [2], but yes, splitting at zone
> boundaries is of course necessary)

Sorry. I was meant to write patch #2:

20220609083039.76667-3-julien@xen.org


> , then I think this wants making quite
> clear in the description.

Good point. I will update the commit message.

Cheers,

-- 
Julien Grall

