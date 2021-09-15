Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8149F40CF3F
	for <lists+xen-devel@lfdr.de>; Thu, 16 Sep 2021 00:14:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187942.336972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQdA9-0007oQ-TE; Wed, 15 Sep 2021 22:13:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187942.336972; Wed, 15 Sep 2021 22:13:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQdA9-0007kz-PU; Wed, 15 Sep 2021 22:13:53 +0000
Received: by outflank-mailman (input) for mailman id 187942;
 Wed, 15 Sep 2021 22:13:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hLCT=OF=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mQdA7-0007kt-SW
 for xen-devel@lists.xenproject.org; Wed, 15 Sep 2021 22:13:51 +0000
Received: from mail-ed1-x536.google.com (unknown [2a00:1450:4864:20::536])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c823cd46-a93b-4691-88ea-e924fb5a4d00;
 Wed, 15 Sep 2021 22:13:50 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id v24so9105451eda.3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Sep 2021 15:13:50 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id y5sm570302edt.21.2021.09.15.15.13.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 15:13:49 -0700 (PDT)
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
X-Inumbo-ID: c823cd46-a93b-4691-88ea-e924fb5a4d00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=z6s8HekUJoDb2a5ktczkdXRA12eitQ0ypYAE0sp77L0=;
        b=U4Z7xNlUBo3eb+qaiZt3wOT9cJbCBvKNfaqd+4N3h4n+7t2w7iPDOBO1645+7lbrsA
         6wtfmjay53SXDK7Efu4EoQNHwjt4OVu/iCDyZD9s8Dq2x9gbes+if6nbP3kRVmBplyZw
         E6gk74PMk5Q4xXiKmn2MIIn3HUW31U5+GTUkqGTfnD6SguA3ccR88EyXC3pN4myrSsPC
         NMXzywxRClj1di1b34XS0AUWBGV1d9F2no6Gf5RUVYIO6eYzAik3YqP+VVxyblXYbyUN
         PSzsu7Pw8/yy6ZAJ16so6b/NfCQMuXzQc/xCL7BhpvWkGCG5Xa05ljCDrJJYR4iK9p1W
         01QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=z6s8HekUJoDb2a5ktczkdXRA12eitQ0ypYAE0sp77L0=;
        b=fcO/uv/8SRD9zSR450EjLe1p2a9G2ZNXk45VIH/oe+9KEPQTGlSYW0MTup8Htt1OSr
         h36fSz8nbTDIFfLVKrGOZFo07CxZIWasx0tyrVRxEX5ozUjMmXxV+S8Yzf+J6EYiCwUG
         8y/GZj4KkEZnOR6Pc3B9oSQSy82i7I0CLheuxeJY9LIz/bGVr35vWMxDJK/SI+08JRk1
         bj7l4n2TvWkMoUADvT6Y+/2dl4A6Jii5WHR2vVZyhblkB3XEzjnX1DjK8CEocDBz0NWg
         JJsIODydboUIMvLVvqpkTO1tsBrU7U6gy9Ip1Tzff7nQilwyu4bwCNYnto072EHuYJ99
         7Wbw==
X-Gm-Message-State: AOAM533lAH5byOu5GN5I5Yc/tbw7LmgxrWDnrpY3HBelzvn5YzyWrFH0
	De+vvWn5++r6oTsIHKWWsr46IImdjRT8agZy
X-Google-Smtp-Source: ABdhPJwsl8nXr+Q2TiUjOgek+P48TbmnNOA4dG6PDzIAOORzrpS+25CzoOCEfVOfrWuYfRSD4u2GOw==
X-Received: by 2002:a05:6402:1808:: with SMTP id g8mr2545894edy.188.1631744029320;
        Wed, 15 Sep 2021 15:13:49 -0700 (PDT)
Subject: Re: [RFC PATCH V2] xen/gnttab: Store frame GFN in struct page_info on
 Arm
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <1631652245-30746-1-git-send-email-olekstysh@gmail.com>
 <b6744333-4d43-ef24-0f9b-b5cd54680660@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <86cdc577-7085-48cd-c417-85b20afc9bf1@gmail.com>
Date: Thu, 16 Sep 2021 01:13:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b6744333-4d43-ef24-0f9b-b5cd54680660@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 15.09.21 13:06, Jan Beulich wrote:

Hi Jan

> On 14.09.2021 22:44, Oleksandr Tyshchenko wrote:
>> --- a/xen/arch/arm/mm.c
>> +++ b/xen/arch/arm/mm.c
>> @@ -1376,14 +1376,18 @@ unsigned long domain_get_maximum_gpfn(struct domain *d)
>>   void share_xen_page_with_guest(struct page_info *page, struct domain *d,
>>                                  enum XENSHARE_flags flags)
>>   {
>> +    unsigned long type_info;
>> +
>>       if ( page_get_owner(page) == d )
>>           return;
>>   
>>       spin_lock(&d->page_alloc_lock);
>>   
>>       /* The incremented type count pins as writable or read-only. */
>> -    page->u.inuse.type_info =
>> -        (flags == SHARE_ro ? PGT_none : PGT_writable_page) | 1;
>> +    type_info = page->u.inuse.type_info & ~(PGT_type_mask | PGT_count_mask);
>> +    page->u.inuse.type_info = type_info |
>> +        (flags == SHARE_ro ? PGT_none : PGT_writable_page) |
>> +        (1UL << PGT_count_base);
> Just as a note: If this was x86 code, I'd request the redundant
> PGT_count_base to be dropped. Constructs like the above is what we
> have MASK_INSR() for.

I got it, I will look at it.


>
>> --- a/xen/common/page_alloc.c
>> +++ b/xen/common/page_alloc.c
>> @@ -2204,7 +2204,10 @@ void *alloc_xenheap_pages(unsigned int order, unsigned int memflags)
>>           return NULL;
>>   
>>       for ( i = 0; i < (1u << order); i++ )
>> +    {
>>           pg[i].count_info |= PGC_xen_heap;
>> +        arch_alloc_xenheap_page(&pg[i]);
>> +    }
>>   
>>       return page_to_virt(pg);
>>   }
>> @@ -2222,7 +2225,10 @@ void free_xenheap_pages(void *v, unsigned int order)
>>       pg = virt_to_page(v);
>>   
>>       for ( i = 0; i < (1u << order); i++ )
>> +    {
>>           pg[i].count_info &= ~PGC_xen_heap;
>> +        arch_free_xenheap_page(&pg[i]);
>> +    }
>>   
>>       free_heap_pages(pg, order, true);
>>   }
> You look to only be adjusting the !SEPARATE_XENHEAP instances of the
> functions. Isn't 32-bit Arm using SEPARATE_XENHEAP?

Hmm, looks like yes, thank you. At least config.h defines that on Arm32. 
I will update the instances.


>
>> --- a/xen/include/asm-arm/mm.h
>> +++ b/xen/include/asm-arm/mm.h
>> @@ -98,9 +98,18 @@ struct page_info
>>   #define PGT_writable_page PG_mask(1, 1)  /* has writable mappings?         */
>>   #define PGT_type_mask     PG_mask(1, 1)  /* Bits 31 or 63.                 */
>>   
>> - /* Count of uses of this frame as its current type. */
>> -#define PGT_count_width   PG_shift(2)
>> -#define PGT_count_mask    ((1UL<<PGT_count_width)-1)
>> + /* 3-bit count of uses of this frame as its current type. */
>> +#define PGT_count_base    PG_shift(4)
>> +#define PGT_count_mask    PG_mask(7, 4)
>> +
>> +/*
>> + * Stored in bits [27:0] or [59:0] GFN if page is used for grant table frame.
> I don't know enough Arm details to tell whether this is properly
> one bit more than the maximum number of physical address bits.
> Without the extra bit you wouldn't be able to tell apart a
> guest specified GFN matching the value of PGT_INVALID_FRAME_GFN
> from an entry which was set from INVALID_GFN.
Really good point.

1. On Arm64 the p2m_ipa_bits could (theoretically) be 64-bit which, I 
assume, corresponds to the maximum guest physical address (1 << 64) - 1 
= 0xFFFFFFFFFFFFFFFF.
To store that GFN we need 52-bit. But, we provide 60-bit field which is 
more than enough, I think. Practically, the maximum supported 
p2m_ipa_bits is 48-bit, so the maximum supported GFN will occupy 36-bit 
only. Everything is ok here.
2. On Arm32 the p2m_ipa_bits is 40-bit which, I assume, corresponds to 
the maximum guest physical address (1 << 40) - 1 = 0xFFFFFFFFFF. To 
store that GFN we need 28-bit. If I did the calculation correctly, what 
we have on Arm32 is that PGT_INVALID_FRAME_GFN == maximum guest physical 
address and it looks like we need and extra bit on Arm32. Do you think 
we need to borrow one more bit from the count portion to stay on the 
safe side?


>
>> + * This only valid for the xenheap pages.
>> + */
>> +#define PGT_gfn_width     PG_shift(4)
>> +#define PGT_gfn_mask      ((1UL<<PGT_gfn_width)-1)
> Any reason you don't use PG_mask() here? Any open-coding is prone
> to people later making mistakes.
I failed to come up with idea how to do that without #ifdef. As GFN 
starts at bit 0 different first parameter would be needed for PG_mask on 
32-bit and 64-bit systems.
I wonder whether PGC_count_mask/PGT_count_mask are open-coded on Arm/x86 
because of the same reason.


-- 
Regards,

Oleksandr Tyshchenko


