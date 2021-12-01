Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49598465358
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 17:49:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236146.409600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msSnU-00057p-NE; Wed, 01 Dec 2021 16:49:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236146.409600; Wed, 01 Dec 2021 16:49:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msSnU-00056B-K9; Wed, 01 Dec 2021 16:49:32 +0000
Received: by outflank-mailman (input) for mailman id 236146;
 Wed, 01 Dec 2021 16:49:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eN/C=QS=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1msSnT-000565-97
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 16:49:31 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a70723b6-52c6-11ec-976b-d102b41d0961;
 Wed, 01 Dec 2021 17:49:30 +0100 (CET)
Received: by mail-lj1-x234.google.com with SMTP id v15so49501305ljc.0
 for <xen-devel@lists.xenproject.org>; Wed, 01 Dec 2021 08:49:30 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id t4sm39766lfe.220.2021.12.01.08.49.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Dec 2021 08:49:29 -0800 (PST)
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
X-Inumbo-ID: a70723b6-52c6-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=8G18hI2ky4bxAF/KRCEZ36EC8LhS1rBUquGKdNmmToM=;
        b=nRtwxg045sSdYF71Kn0vqyU9YiLmoTsXa0Sc4qIX2WpzXVwbbYeUKpyz32FHd30Uto
         95wKzGzXzn1RvfW1Rk71JiWFZparIbrv6aZV47weZxWMMx65fkqAC3b3t5ItLa0TC1EV
         RNNcTKDMpV5urr/kPUk6k22+bQPX/g+z1kmLHUGohF2laJc5t6lP7hPRlqJZ39XUCXeC
         c3q5bev6p1JWd4CBMWaQVkbl33bnbRtp/BzGd/67yabQ/xFnq2H87SZb1+rMs2qNZsfA
         ZvIHXTTnNOtj9PMwmuSOkM42nkmJ044zHYrkLrw1bbavGDvbvHKoUTgakNPfGZUfTD3b
         Hyew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=8G18hI2ky4bxAF/KRCEZ36EC8LhS1rBUquGKdNmmToM=;
        b=Zs8XMPzEi4XQjgXbCRMfDFriML1E6djLfemoSBUAgxqUr0q+XDm7lpSz4YVX1coZ5L
         HcJg1VgHzSBpwZ7Up8qbLIxJDwpHYFCPKJVo6DwXVaGOyfeMJCGVdEC6sB+2i6vgBAFw
         RWnoLTRY+JeM/JiaFRqIlgNFL4gsKDOj2ENwMxB62nKKdliMnQ0fK0qAsJ+J/8jFk9Sp
         QrbueeZQ1UxN7kqWTP1Spn/mKMS38I8/If9h8iA0sFDZbh0UyJwtn2VgEA2sIACdI5e7
         GbRXmTi2vcN/NBnUmVtkjhE7m80w2XCQ/l4pJKPHACvMM7HmQ/kjXNRptr4KFUkQXtag
         pHZw==
X-Gm-Message-State: AOAM533qBahxbMMK/DnJDoX+Qid92waNI7TEAh1PosSIBeSheACQRJIq
	KHV2nzVnNBNMwbd3PmByClI=
X-Google-Smtp-Source: ABdhPJwWPFcYwJQZ3apo97MxlA0T1IqxmT72JdiZEfqZKSMTt3gISUwDb1lkVsJXB/s1zn3xpFqoiA==
X-Received: by 2002:a2e:390c:: with SMTP id g12mr6704212lja.118.1638377369701;
        Wed, 01 Dec 2021 08:49:29 -0800 (PST)
Subject: Re: [RFC PATCH V3] xen/gnttab: Store frame GFN in struct page_info on
 Arm
To: Julien Grall <julien@xen.org>
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
 <d64d4bdc-a8bb-349c-b4b5-7c3a887e1621@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <ddbf632a-cf46-bdd8-d5c3-b19233fe56a3@gmail.com>
Date: Wed, 1 Dec 2021 18:49:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d64d4bdc-a8bb-349c-b4b5-7c3a887e1621@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 01.12.21 18:32, Julien Grall wrote:
> Hi Oleksandr,


Hi Julien


>
> On 26/11/2021 13:51, Oleksandr wrote:
>> On 25.11.21 21:04, Julien Grall wrote:
>>>>   {
>>>> +    mfn_t mfn = lpae_get_mfn(pte);
>>>> +
>>>>       ASSERT(p2m_is_valid(pte));
>>>>         /*
>>>> @@ -731,11 +733,22 @@ static void p2m_put_l3_page(const lpae_t pte)
>>>>        */
>>>>       if ( p2m_is_foreign(pte.p2m.type) )
>>>>       {
>>>> -        mfn_t mfn = lpae_get_mfn(pte);
>>>> -
>>>>           ASSERT(mfn_valid(mfn));
>>>>           put_page(mfn_to_page(mfn));
>>>>       }
>>>> +
>>>> +#ifdef CONFIG_GRANT_TABLE
>>>> +    /*
>>>> +     * Check whether we deal with grant table page. As the grant 
>>>> table page
>>>> +     * is xen_heap page and its entry has known p2m type, detect 
>>>> it and mark
>>>> +     * the stored GFN as invalid. Although this check is not 
>>>> precise and we
>>>> +     * might end up updating this for other xen_heap pages, this 
>>>> action is
>>>> +     * harmless to these pages since only grant table pages have 
>>>> this field
>>>> +     * in use. So, at worst, unnecessary action might be performed.
>>>> +     */
>>>> +    if ( (pte.p2m.type == p2m_ram_rw) && is_xen_heap_mfn(mfn) )
>>>
>>> I would use p2m_is_ram() to cover read-only mapping. I think it 
>>> would also be better to use an ``else if`` so it is clear that this 
>>> doesn't cover foreign mapping (it is possible to map xenheap page 
>>> from another domain).
>>
>> ok, will use p2m_is_ram() and ``else if`` construct, however I don't 
>> entirely understand why we also want/need to include read-only pages 
>> (as type is set to p2m_ram_rw in xenmem_add_to_physmap_one() for case 
>> XENMAPSPACE_grant_table)?
>
> Most of this code is already ready to be used by other xenheap pages 
> (see other part of the discussion). So I would like to use p2m_is_ram()
> as it reduces the risk of us forgetting that read-only are not handled.

ok, got it, thank you for the explanation.


>
>  [...]
>
>>>> + page_get_frame_gfn(pg_); \
>>>> +})
>>>>     #define gnttab_need_iommu_mapping(d) \
>>>>       (is_domain_direct_mapped(d) && is_iommu_enabled(d))
>>>> diff --git a/xen/include/asm-arm/mm.h b/xen/include/asm-arm/mm.h
>>>> index 7b5e7b7..a00c5f5 100644
>>>> --- a/xen/include/asm-arm/mm.h
>>>> +++ b/xen/include/asm-arm/mm.h
>>>> @@ -98,9 +98,17 @@ struct page_info
>>>>   #define PGT_writable_page PG_mask(1, 1)  /* has writable 
>>>> mappings?         */
>>>>   #define PGT_type_mask     PG_mask(1, 1)  /* Bits 31 or 
>>>> 63.                 */
>>>>   - /* Count of uses of this frame as its current type. */
>>>> -#define PGT_count_width   PG_shift(2)
>>>> -#define PGT_count_mask    ((1UL<<PGT_count_width)-1)
>>>> + /* 2-bit count of uses of this frame as its current type. */
>>>> +#define PGT_count_mask    PG_mask(3, 3)
>>>> +
>>>> +/*
>>>> + * Stored in bits [28:0] or [60:0] GFN if page is used for grant 
>>>> table frame.
>>>
>>> I think this wording is conflicting with ...
>>>
>>>> + * This only valid for the xenheap pages.
>>>
>>> ... this becase xen heap pages are used in other situations. But I 
>>> would prefer if the comment doesn't mention grant-table frame. This 
>>> would allow use to repurpose the field for other xenheap if needed.
>>>
>>> Typo: This *is* only valid
>>
>>
>> ok, so how about to simply mention it's purpose as xenheap GFN here 
>> and down this header?
>>
>> For example,
>> Stored in bits [28:0] or [60:0] GFN if page is xenheap page.
>>
>> BTW, shall I rename the access helpers page_set(get)_frame_gfn() as 
>> well? For me the frame is associated with grant-table.
>> Something to: page_set(get)_xenheap_gfn() or even page_set(get)_gfn().
>
> Naming them to page_{set, get)_xenheap_gfn() sounds like a good idea.
> It would be clearer what is the purpose of the two helpers.

agree, will rename


>
>
>>>> +#define arch_alloc_xenheap_page(p) page_set_frame_gfn(p, INVALID_GFN)
>>>> +#define arch_free_xenheap_page(p) \
>>>> +    BUG_ON(!gfn_eq(page_get_frame_gfn(p), INVALID_GFN))
>>>
>>> I believe this BUG_ON() could be triggered if gnttab_map_frame() 
>>> succeeds but then we fail to insert the entry in the P2M. This means 
>>> we would need to revert changes done in gnttab_map_frame() in case 
>>> of failure.
>>>
>>> However, I am still a bit unease with the BUG_ON(). A domain will 
>>> not necessarily remove the grant-table mapping from its P2M before 
>>> shutting down. So you are relying on Xen to go through the P2M 
>>> before we free the page.
>>>
>>> This is the case today, but I am not sure we would want to rely on 
>>> it because it will be hard to remember this requirement if we decide 
>>> to optimize p2m_relinquish().
>>>
>>> One possibility would be to add a comment in p2m_relinquish(). 
>>> That's assuming there are no other places which could lead to false 
>>> positively hit the BUG().
>>
>> These make me think that it would be better (safer and simpler) to 
>> just remove this BUG_ON() for now. Do you agree?
> I would drop the BUG_ON() here.

ok, will drop. So arch_free_xenheap_page will become dummy on both Arm 
and x86, the question is should we retain it with all call sites in 
free_xenheap_pages() variants?


>
>
> Cheers,
>
-- 
Regards,

Oleksandr Tyshchenko


