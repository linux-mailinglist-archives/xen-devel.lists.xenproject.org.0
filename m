Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D434652CA
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 17:32:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236129.409568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msSWc-0002Wp-Nw; Wed, 01 Dec 2021 16:32:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236129.409568; Wed, 01 Dec 2021 16:32:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msSWc-0002Tw-Ka; Wed, 01 Dec 2021 16:32:06 +0000
Received: by outflank-mailman (input) for mailman id 236129;
 Wed, 01 Dec 2021 16:32:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1msSWb-0002Tq-Ro
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 16:32:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1msSWa-0008Ew-IF; Wed, 01 Dec 2021 16:32:04 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.22.155]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1msSWa-0001AJ-BI; Wed, 01 Dec 2021 16:32:04 +0000
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
	bh=rukXyaclqelQPFJHpnYvXG9RfVg4W/YjdsyAKr3PS3Q=; b=tXYqg6XIMoGXKG2i0GDIkR8AIc
	LcLd5tnoDSU75hoIqpDahsPFMUZokCUGkHGsLNV5o7T35DePWp4efMyeDasA5qrFMxLJM8eMrOH7V
	EVG/jiw8rWvPq865iZ7W5mC4xLQhYUaVXTP/3oKkOpuFFn3aL2FqtOWqO1Lf+iRn8wtc=;
Message-ID: <d64d4bdc-a8bb-349c-b4b5-7c3a887e1621@xen.org>
Date: Wed, 1 Dec 2021 16:32:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [RFC PATCH V3] xen/gnttab: Store frame GFN in struct page_info on
 Arm
To: Oleksandr <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <1632425551-18910-1-git-send-email-olekstysh@gmail.com>
 <863c9a06-f0af-eac1-fb04-e059e4ce0a09@xen.org>
 <89f27a30-187c-6223-9dbb-1e3f52213868@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <89f27a30-187c-6223-9dbb-1e3f52213868@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Oleksandr,

On 26/11/2021 13:51, Oleksandr wrote:
> On 25.11.21 21:04, Julien Grall wrote:
>>>   {
>>> +    mfn_t mfn = lpae_get_mfn(pte);
>>> +
>>>       ASSERT(p2m_is_valid(pte));
>>>         /*
>>> @@ -731,11 +733,22 @@ static void p2m_put_l3_page(const lpae_t pte)
>>>        */
>>>       if ( p2m_is_foreign(pte.p2m.type) )
>>>       {
>>> -        mfn_t mfn = lpae_get_mfn(pte);
>>> -
>>>           ASSERT(mfn_valid(mfn));
>>>           put_page(mfn_to_page(mfn));
>>>       }
>>> +
>>> +#ifdef CONFIG_GRANT_TABLE
>>> +    /*
>>> +     * Check whether we deal with grant table page. As the grant 
>>> table page
>>> +     * is xen_heap page and its entry has known p2m type, detect it 
>>> and mark
>>> +     * the stored GFN as invalid. Although this check is not precise 
>>> and we
>>> +     * might end up updating this for other xen_heap pages, this 
>>> action is
>>> +     * harmless to these pages since only grant table pages have 
>>> this field
>>> +     * in use. So, at worst, unnecessary action might be performed.
>>> +     */
>>> +    if ( (pte.p2m.type == p2m_ram_rw) && is_xen_heap_mfn(mfn) )
>>
>> I would use p2m_is_ram() to cover read-only mapping. I think it would 
>> also be better to use an ``else if`` so it is clear that this doesn't 
>> cover foreign mapping (it is possible to map xenheap page from another 
>> domain).
> 
> ok, will use p2m_is_ram() and ``else if`` construct, however I don't 
> entirely understand why we also want/need to include read-only pages (as 
> type is set to p2m_ram_rw in xenmem_add_to_physmap_one() for case 
> XENMAPSPACE_grant_table)?

Most of this code is already ready to be used by other xenheap pages 
(see other part of the discussion). So I would like to use p2m_is_ram()
as it reduces the risk of us forgetting that read-only are not handled.
  [...]

>>> + page_get_frame_gfn(pg_); \
>>> +})
>>>     #define gnttab_need_iommu_mapping(d)                    \
>>>       (is_domain_direct_mapped(d) && is_iommu_enabled(d))
>>> diff --git a/xen/include/asm-arm/mm.h b/xen/include/asm-arm/mm.h
>>> index 7b5e7b7..a00c5f5 100644
>>> --- a/xen/include/asm-arm/mm.h
>>> +++ b/xen/include/asm-arm/mm.h
>>> @@ -98,9 +98,17 @@ struct page_info
>>>   #define PGT_writable_page PG_mask(1, 1)  /* has writable 
>>> mappings?         */
>>>   #define PGT_type_mask     PG_mask(1, 1)  /* Bits 31 or 
>>> 63.                 */
>>>   - /* Count of uses of this frame as its current type. */
>>> -#define PGT_count_width   PG_shift(2)
>>> -#define PGT_count_mask    ((1UL<<PGT_count_width)-1)
>>> + /* 2-bit count of uses of this frame as its current type. */
>>> +#define PGT_count_mask    PG_mask(3, 3)
>>> +
>>> +/*
>>> + * Stored in bits [28:0] or [60:0] GFN if page is used for grant 
>>> table frame.
>>
>> I think this wording is conflicting with ...
>>
>>> + * This only valid for the xenheap pages.
>>
>> ... this becase xen heap pages are used in other situations. But I 
>> would prefer if the comment doesn't mention grant-table frame. This 
>> would allow use to repurpose the field for other xenheap if needed.
>>
>> Typo: This *is* only valid
> 
> 
> ok, so how about to simply mention it's purpose as xenheap GFN here and 
> down this header?
> 
> For example,
> Stored in bits [28:0] or [60:0] GFN if page is xenheap page.
> 
> BTW, shall I rename the access helpers page_set(get)_frame_gfn() as 
> well? For me the frame is associated with grant-table.
> Something to: page_set(get)_xenheap_gfn() or even page_set(get)_gfn().

Naming them to page_{set, get)_xenheap_gfn() sounds like a good idea.
It would be clearer what is the purpose of the two helpers.

>>> +#define arch_alloc_xenheap_page(p) page_set_frame_gfn(p, INVALID_GFN)
>>> +#define arch_free_xenheap_page(p) \
>>> +    BUG_ON(!gfn_eq(page_get_frame_gfn(p), INVALID_GFN))
>>
>> I believe this BUG_ON() could be triggered if gnttab_map_frame() 
>> succeeds but then we fail to insert the entry in the P2M. This means 
>> we would need to revert changes done in gnttab_map_frame() in case of 
>> failure.
>>
>> However, I am still a bit unease with the BUG_ON(). A domain will not 
>> necessarily remove the grant-table mapping from its P2M before 
>> shutting down. So you are relying on Xen to go through the P2M before 
>> we free the page.
>>
>> This is the case today, but I am not sure we would want to rely on it 
>> because it will be hard to remember this requirement if we decide to 
>> optimize p2m_relinquish().
>>
>> One possibility would be to add a comment in p2m_relinquish(). That's 
>> assuming there are no other places which could lead to false 
>> positively hit the BUG().
> 
> These make me think that it would be better (safer and simpler) to just 
> remove this BUG_ON() for now. Do you agree?
I would drop the BUG_ON() here.

Cheers,

-- 
Julien Grall

