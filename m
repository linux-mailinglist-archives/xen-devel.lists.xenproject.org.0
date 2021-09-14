Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB7E40ADC0
	for <lists+xen-devel@lfdr.de>; Tue, 14 Sep 2021 14:32:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.186531.335267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ7bm-0006NL-S3; Tue, 14 Sep 2021 12:32:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 186531.335267; Tue, 14 Sep 2021 12:32:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ7bm-0006KB-Nq; Tue, 14 Sep 2021 12:32:18 +0000
Received: by outflank-mailman (input) for mailman id 186531;
 Tue, 14 Sep 2021 12:32:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jeVa=OE=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mQ7bl-0006K3-1y
 for xen-devel@lists.xenproject.org; Tue, 14 Sep 2021 12:32:17 +0000
Received: from mail-ej1-x635.google.com (unknown [2a00:1450:4864:20::635])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5f7518b5-ac5e-40b6-a3b3-1dd7b1fad4d5;
 Tue, 14 Sep 2021 12:32:14 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id h9so28568950ejs.4
 for <xen-devel@lists.xenproject.org>; Tue, 14 Sep 2021 05:32:14 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id h10sm5616975edf.85.2021.09.14.05.32.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 05:32:12 -0700 (PDT)
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
X-Inumbo-ID: 5f7518b5-ac5e-40b6-a3b3-1dd7b1fad4d5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Zu26EcxSPuA7jpEqSDVCkAl6vo2I+Y3ZS09kAqjLKZ4=;
        b=Rk0AVVB8IdWySleepo3/4SbCEfMxlygxqGT1QlKu9CiPmdO1ghpjezBAkA/RdtMzLp
         99RP2zLow301AuNaYWEG0G4scQ4LcqVdoGkWzkHcWRrP76IOWMRdrTEgkT1b0MpoIzIi
         jeNsdRisHfXtGfbJGkBo8uzwOUhTDjfX9hR4PSCHaooQWmuE/l0TI5FZ4JxkGWbItymt
         sqhNFvwopjeFbSzCD747H7zbIyIOCeVMusILPpRdus36c48ZU6rYR23HtxNBZjfMqJxp
         0IsC2brAW1+lFiCGFmMif7C+tjo2YxC/ZVoseUr5Q8ZrCa5cnawsY1HY49Mkp21o+syl
         ku7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Zu26EcxSPuA7jpEqSDVCkAl6vo2I+Y3ZS09kAqjLKZ4=;
        b=DFsgWYR6M5DZ1FZJPpPv4DyRt6B0VFml4u7dPModRmI/bkD4MvxR950EqY5CAh3JXz
         oH4KqTjrz4iz2J3ta13QzDR8SbQlZ0Nz3IQdK49dfF2sNYx/cg6TXlP0gwVnRzWMrCoF
         6OJK9pk6/6BtVFX28uPRVfEZ6vn0ChaimUrOs93y/k+zCLCNirRbAzf33CLuImg0Cnht
         0EhicW1T0qs7xyi+r/kjsEgLh0bll9Od30uGPAxkYQOSmwd4uqqvAmFDotoXgZdDsV1u
         0jjeTn6bFJECSTOokpQgxJ/So/Nwrh632hNkZ50w1mGszG55EJNDk922O56PkempEioe
         sqDw==
X-Gm-Message-State: AOAM5337SkNzvFxZ10M4x4QLW2/bpdM4F269zPUO6cNJ8VjAmBSpeCDl
	huMspiC5oJfvbJ7cGYStyrOcqVBDs2I=
X-Google-Smtp-Source: ABdhPJz4a8xzITQbQXlcGQhN305ctSA3Vz3/qTIYhmJdb+IWJI9zLYYp5wJkydROuTwCX0G8NE4iag==
X-Received: by 2002:a17:906:410c:: with SMTP id j12mr18577953ejk.161.1631622732785;
        Tue, 14 Sep 2021 05:32:12 -0700 (PDT)
Subject: Re: [RFC PATCH] xen/gnttab: Store frame GFN in struct page_info on
 Arm
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <1631228688-30347-1-git-send-email-olekstysh@gmail.com>
 <398b436a-984a-d6b2-bf88-33e994c95c55@suse.com>
 <c286febc-b7b4-5aa4-5331-f0c2f6a17000@gmail.com>
 <a0ad861c-d8a8-82f0-023b-26c3fd4d50cb@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <de043a0e-e5b1-7f1b-d7c5-6fcc220048cf@gmail.com>
Date: Tue, 14 Sep 2021 15:32:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a0ad861c-d8a8-82f0-023b-26c3fd4d50cb@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 14.09.21 11:31, Jan Beulich wrote:

Hi Jan

> On 13.09.2021 19:09, Oleksandr wrote:
>> On 10.09.21 10:52, Jan Beulich wrote:
>>> On 10.09.2021 01:04, Oleksandr Tyshchenko wrote:
>>>> @@ -731,11 +733,19 @@ static void p2m_put_l3_page(const lpae_t pte)
>>>>         */
>>>>        if ( p2m_is_foreign(pte.p2m.type) )
>>>>        {
>>>> -        mfn_t mfn = lpae_get_mfn(pte);
>>>> -
>>>>            ASSERT(mfn_valid(mfn));
>>>>            put_page(mfn_to_page(mfn));
>>>>        }
>>>> +
>>>> +#ifdef CONFIG_GRANT_TABLE
>>>> +    /*
>>>> +     * Check whether we deal with grant table page. As the grant table page
>>>> +     * is xen_heap page and its entry has known p2m type, detect it and mark
>>>> +     * the stored GFN as invalid.
>>>> +     */
>>>> +    if ( p2m_is_ram(pte.p2m.type) && is_xen_heap_mfn(mfn) )
>>>> +        page_set_frame_gfn(mfn_to_page(mfn), INVALID_GFN);
>>>> +#endif
>>> I take it the write done is benign for other Xen heap pages? I suppose
>>> this would want making very explicit, as such an assumption is easy to
>>> go stale by entirely unrelated changes.
>> Yes, I don't see what bad could happen if we would clear this field for
>> non grant table pages. Except grant table pages I could detect only one
>> page passed this check here which is, I assume, shared_info page. All
>> pages have this field initialized with INVALID_GFN. But *only* grant
>> table pages have this field in use. So, I think, no one will suffer. I
>> will add a comment. Or you meant something more than just a comment?
> The answer here goes hand in hand with the pending question of whether
> you wouldn't better generally introduce recording of the GFN (and hence
> effectively an M2P): The less special casing here, the better imo. The
> more special casing here, the more justification / explanation is imo
> needed in the comment.

I got your point. I think, I am not the right person to judge whether 
the Xen on Arm needs / wants complete M2P support or not (this is a 
question to the maintainers and the community),
but I can't recollect a strong desire or critical need for implementing 
it every time such discussion arose and IIRC only arguments against it. 
Also this activity is not in my list of priorities to do on Xen on Arm. 
But, I agree that having M2P would prevent this (with grant table) and 
similar situations. So, I will add more justification / explanation for 
the current patch.


>
>>>> --- a/xen/include/asm-arm/mm.h
>>>> +++ b/xen/include/asm-arm/mm.h
>>>> @@ -39,7 +39,15 @@ struct page_info
>>>>            /* Page is in use: ((count_info & PGC_count_mask) != 0). */
>>>>            struct {
>>>>                /* Type reference count and various PGT_xxx flags and fields. */
>>>> -            unsigned long type_info;
>>>> +            unsigned long type_info:4;
>>>> +
>>>> +            /*
>>>> +             * Stored GFN if page is used for grant table frame
>>>> +             * (bits 59(27)-0).
>>> Are these bit numbers correct? I thought Arm, like x86, counted bits
>>> from low to high (unlike PPC, for example)?
>> I think, these are correct.  Yes, Little Endian is used.
> Well, the low 4 bits are used by type_info here. Therefore I'm having
> trouble seeing what the 0 refers to.

Now I see that comment is not precise. Probably I should have written 
that "60-bit(28-bit) field is used to store the GFN ..."


>
>>>> @@ -94,12 +102,12 @@ struct page_info
>>>>    #define PG_shift(idx)   (BITS_PER_LONG - (idx))
>>>>    #define PG_mask(x, idx) (x ## UL << PG_shift(idx))
>>>>    
>>>> -#define PGT_none          PG_mask(0, 1)  /* no special uses of this page   */
>>>> -#define PGT_writable_page PG_mask(1, 1)  /* has writable mappings?         */
>>>> -#define PGT_type_mask     PG_mask(1, 1)  /* Bits 31 or 63.                 */
>>>> +#define PGT_none          (0UL << 3)  /* no special uses of this page   */
>>>> +#define PGT_writable_page (1UL << 3)  /* has writable mappings?         */
>>>> +#define PGT_type_mask     (1UL << 3)
>>>>    
>>>>     /* Count of uses of this frame as its current type. */
>>>> -#define PGT_count_width   PG_shift(2)
>>>> +#define PGT_count_width   1
>>>>    #define PGT_count_mask    ((1UL<<PGT_count_width)-1)
>>> Leaving just a single bit seems pretty risky to me, and I can't see
>>> why you do so. You need 52 bits on Arm64. Which means you have 12
>>> bits left. Why not use them in full? Even on Arm32 you have 3 bits
>>> available for the count afaict.
>> Only 1 bit in the type_info field is really used on Arm, but anyway ...
>>
>>
>>> Also there's a disconnect here: If anyone wanted to change the number
>>> of bits used for the various fields, each such change should require
>>> an adjustment in as few independent places as possible. That is, there
>>> shouldn't be multiple uses of literal 4 further up, and there also
>>> shouldn't be a hidden connection between that 4 and the PGT_* values
>>> here. I think you'd better express the GFN as such a PGT_* construct
>>> as well. And you better would keep using PG_mask() and PG_shift().
>> ... I think, this indeed makes sense. If got your request correctly, we
>> can avoid disconnect here
>> and reserve 3-bit field for count for both Arm32 and Arm64. The struct
>> page_info's type_info field remains untouched.
>>
>>
>> diff --git a/xen/include/asm-arm/mm.h b/xen/include/asm-arm/mm.h
>> index ded74d2..8b73e1c 100644
>> --- a/xen/include/asm-arm/mm.h
>> +++ b/xen/include/asm-arm/mm.h
>> @@ -99,8 +99,14 @@ struct page_info
>>    #define PGT_type_mask     PG_mask(1, 1)  /* Bits 31 or
>> 63.                 */
>>
>>     /* Count of uses of this frame as its current type. */
>> -#define PGT_count_width   PG_shift(2)
>> -#define PGT_count_mask    ((1UL<<PGT_count_width)-1)
>> +#define PGT_count_base    PG_shift(4)
>> +#define PGT_count_mask    PG_mask(7, 4)
>> +
>> +/* Stored in bits [27:0] or [59:0] GFN if page is used for grant table
>> frame */
>> +#define PGT_gfn_width     PG_shift(4)
>> +#define PGT_gfn_mask      ((1UL<<PGT_gfn_width)-1)
>> +
>> +#define PGT_INVALID_FRAME_GFN   _gfn(PGT_gfn_mask)
>>
>>     /* Cleared when the owning guest 'frees' this page. */
>>    #define _PGC_allocated    PG_shift(1)
>> @@ -163,6 +169,22 @@ extern unsigned long xenheap_base_pdx;
>>
>>    #define maddr_get_owner(ma) (page_get_owner(maddr_to_page((ma))))
>>
>> +#define page_get_frame_gfn(_p) ({                               \
>> +    gfn_t gfn_ = _gfn((_p)->u.inuse.type_info & PGT_gfn_mask);  \
>> +    gfn_eq(gfn_, PGT_INVALID_FRAME_GFN) ? INVALID_GFN : gfn_;   \
>> +})
>> +
>> +#define page_set_frame_gfn(_p, _gfn) ({                         \
>> +    gfn_t gfn_ = gfn_eq(_gfn, INVALID_GFN) ?                    \
>> +                 PGT_INVALID_FRAME_GFN : _gfn;                  \
>> +    (_p)->u.inuse.type_info &= ~PGT_gfn_mask;                   \
>> +    (_p)->u.inuse.type_info |= gfn_x(gfn_);                     \
>> +})
>>
>> [snip]
>>
>> Is it close to what you keep in mind?
> Yes. Just to be sure - did you check that moving the count up
> from starting at bit 0 is compatible with all present uses? At
> least on x86 I think we have uses where it is assumed to occupy
> the bottom so many bits (and the same also for PGC_count_mask).

ok, thank you. Yes, I checked that (on Arm). I could find only one place 
which would need updating, which was the share_xen_page_with_guest().


>
> Jan
>
-- 
Regards,

Oleksandr Tyshchenko


