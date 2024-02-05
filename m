Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B27849A88
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 13:39:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676006.1051736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWyF6-0008Js-IF; Mon, 05 Feb 2024 12:38:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676006.1051736; Mon, 05 Feb 2024 12:38:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWyF6-0008Hg-F6; Mon, 05 Feb 2024 12:38:32 +0000
Received: by outflank-mailman (input) for mailman id 676006;
 Mon, 05 Feb 2024 12:38:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8/S5=JO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rWyF4-0008GM-Hp
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 12:38:30 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 76cf4bf9-c423-11ee-8a45-1f161083a0e0;
 Mon, 05 Feb 2024 13:38:29 +0100 (CET)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2d09faadba5so18844191fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 04:38:29 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 eo12-20020a056122388c00b004b725f7854esm1068290vkb.8.2024.02.05.04.38.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 04:38:28 -0800 (PST)
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
X-Inumbo-ID: 76cf4bf9-c423-11ee-8a45-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707136709; x=1707741509; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3trfr1/jd87pTRlJejfRRX3tevYM6vuwk7UV2QsR7MI=;
        b=HdOZO+Vi7ZS6xW1qdmD8E8I9PdyleqGoSjqRxpX+Z3kF17ajqK26q6PTqPUr6ePwG1
         pTrg045gE2lVAiM5Tt6A+dvQMhpwbvKD9le5dkNIbfm1KcZIgGU4SmNvyp7AD1HYgmMp
         3DaD47S6fHQYEJCNzb/SuufThXDiaqTSQaDCqAeOXKIt5FiUcB8Ec2kMl9lQH23nj6dn
         z5Th0lFOcuhqe0BUJZBu1sN0laA3q8NTNJJpsXTXwlfpCrZaQZ/4LaNG5uxD6RVvdeCd
         Kh/vsAWkzsJ3sQBlvzPcid9V1zIvvbZU+sMCjbB8mYOCbiwwR+u5nnXETKpm4isX7oA0
         OV2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707136709; x=1707741509;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3trfr1/jd87pTRlJejfRRX3tevYM6vuwk7UV2QsR7MI=;
        b=JudMBrVCod+5ALfUl61nn0OePizK5xQF5yEARmVrNOzAWeh5qnOjCnxsuhWvtx2Sdx
         eD3cUG0L5d1rOTxriU7kz0j/KzaayD/ey3+qhYekfavrJKT4RxSSSuN1f0lqQu7xgnlD
         3lr9wmPvnWaD2f5jdS0V15RbZ7ZDmukfamQiqJxO/akNAETzEHXToXS/8kPnk5JcBVWh
         qFkYTn5MPN9ZziSqRISgrwzzwzilbggjMmb7qijhX6DB+REVgudWpw2XCXF58SUWDH16
         haz1haOKBSAxaJ1haoKH74QVs1bwKIv0+ONq3a/c69QDb6k7iIfm4qGr2NtVfsfS3S0k
         t1Ng==
X-Gm-Message-State: AOJu0YwsWiclEgKhG9IPJLZYr0FA64/kcWtP+EytVHKorHjRSmZ4LCS6
	Js5URfIhlh1gld7+GgEhZzgPKdk+Z3w718ewQqPW6ou+Bi4eoT7p4F2oS057Yw==
X-Google-Smtp-Source: AGHT+IFTon0ZzyaEZE9dOphyfso7CpiT/BnWMJ5IfT8T3zeYmlCw0H5+yPGw+oe1hWdr0l9wVC4ADA==
X-Received: by 2002:a2e:a4a4:0:b0:2d0:7fea:2920 with SMTP id g4-20020a2ea4a4000000b002d07fea2920mr5529873ljm.37.1707136708726;
        Mon, 05 Feb 2024 04:38:28 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVg08DLOELWkH0AzCWtG/rxVM1Y/cmnhlsHcrWOZ3fITOnbhkZTIR5ZkTM8MiXxhMB/sf1+xwdpEZflaWJlzgbCzb24XCUGeVVj3RIAQJk2basfFN9q0lX8YORD6zt017w6fm30+Jt9pyXQsC0iFeBJjj6bu7c4grFV09ZMAA9x3yUasNbvJPzjW3/g5hmJrzNyb/LQz9G2MeSFw1yiGGuNz4EFclcLi7K/jVjaofl1kminf2P1V0tiBNavvwExcAWHq8pN1sv9E2hV0SqTkE7I/xdW5y8krmbIUYccj8Lq/XaEYfkkdUOJGhSwDdsVDkKvIdKeBefFK0Q0bxIOSwxQUTR2wLi9SYbH31q819Ojs22cGxWuE1RZKHFAhnz3LFmIaw==
Message-ID: <0ef140da-77d3-411f-8f19-eee0aaf1fa9d@suse.com>
Date: Mon, 5 Feb 2024 13:38:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 10/15] xen: add cache coloring allocator for domains
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: andrea.bastoni@minervasys.tech, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
References: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
 <20240129171811.21382-11-carlo.nonato@minervasys.tech>
 <1739dbb4-5d7e-4d84-8d4b-bfb13c4041d8@suse.com>
 <CAG+AhRUJysNCrUXLiu8tvh2d7oL2hNAtkM3A2-Hy73f=+PxkTA@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <CAG+AhRUJysNCrUXLiu8tvh2d7oL2hNAtkM3A2-Hy73f=+PxkTA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.02.2024 12:59, Carlo Nonato wrote:
> On Thu, Feb 1, 2024 at 4:53 PM Jan Beulich <jbeulich@suse.com> wrote:
>> On 29.01.2024 18:18, Carlo Nonato wrote:
>>> @@ -157,7 +158,11 @@
>>>  #define PGC_static 0
>>>  #endif
>>>
>>> -#define PGC_preserved (PGC_extra | PGC_static)
>>> +#ifndef PGC_colored
>>> +#define PGC_colored 0
>>> +#endif
>>> +
>>> +#define PGC_preserved (PGC_extra | PGC_static | PGC_colored)
>>>
>>>  #ifndef PGT_TYPE_INFO_INITIALIZER
>>>  #define PGT_TYPE_INFO_INITIALIZER 0
>>> @@ -1504,6 +1509,7 @@ static void free_heap_pages(
>>>              if ( !mfn_valid(page_to_mfn(predecessor)) ||
>>>                   !page_state_is(predecessor, free) ||
>>>                   (predecessor->count_info & PGC_static) ||
>>> +                 (predecessor->count_info & PGC_colored) ||
>>
>> How about a 2nd #define (e.g. PGC_no_buddy_merge) to use here and ...
>>
>>>                   (PFN_ORDER(predecessor) != order) ||
>>>                   (page_to_nid(predecessor) != node) )
>>>                  break;
>>> @@ -1528,6 +1534,7 @@ static void free_heap_pages(
>>>              if ( !mfn_valid(page_to_mfn(successor)) ||
>>>                   !page_state_is(successor, free) ||
>>>                   (successor->count_info & PGC_static) ||
>>> +                 (successor->count_info & PGC_colored) ||
>>
>> ... here? That'll then also avoid me commenting that I don't see why
>> these two PGC_* checks aren't folded.
> 
> Yes for me it's ok (I even suggested that in v5). Do you want this change to
> be merged with the previous patch? Or should they all belong to this one?

Or make yet another small prereq patch?

>>> +static void free_color_heap_page(struct page_info *pg, bool need_scrub)
>>> +{
>>> +    unsigned int color = page_to_llc_color(pg);
>>> +    struct page_list_head *head = color_heap(color);
>>> +
>>> +    spin_lock(&heap_lock);
>>> +
>>> +    mark_page_free(pg, page_to_mfn(pg));
>>> +
>>> +    if ( need_scrub )
>>> +    {
>>> +        pg->count_info |= PGC_need_scrub;
>>> +        poison_one_page(pg);
>>> +    }
>>> +
>>> +    pg->count_info |= PGC_colored;
>>
>> The page transiently losing PGC_colored is not an issue then (presumably
>> because of holding the heap lock)? Did you consider having mark_page_free()
>> also use PGC_preserved?
> 
> I did something similar to what it's done in unprepare_staticmem_pages():
> first mark_page_free() is called and then PGC_static is added to count_info.

I had guessed this would have been served as reference, yet by saying what
you did you don't really answer my question. (Really I'm not entirely sure
the similar staticmem behavior is entirely correct.)

>>> +    if ( !pg )
>>> +    {
>>> +        spin_unlock(&heap_lock);
>>> +        return NULL;
>>> +    }
>>> +
>>> +    pg->count_info = PGC_state_inuse | PGC_colored |
>>> +                     (pg->count_info & PGC_need_scrub);
>>
>> Isn't PGC_colored already set on the page?
> 
> Yes but here I need to make sure that only PGC_state_inuse | PGC_colored are
> used so an assignment seems legit.

Well, yes, you won't be able to avoid an assignment, but couldn't you
preserve PGC_colored just like PGC_need_scrub is preserved? Or else
at least assert the flag is set, to avoid giving the impression that
right here pages can suddenly become "colored" ones? Then again them
becoming so _may_ be needed during initialization.

>> Together with ...
>>
>>> +    free_colored_pages[color]--;
>>> +    page_list_del(pg, color_heap(color));
>>> +
>>> +    if ( !(memflags & MEMF_no_tlbflush) )
>>> +        accumulate_tlbflush(&need_tlbflush, pg, &tlbflush_timestamp);
>>> +
>>> +    init_free_page_fields(pg);
>>> +
>>> +    spin_unlock(&heap_lock);
>>> +
>>> +    if ( test_and_clear_bit(_PGC_need_scrub, &pg->count_info) && scrub )
>>
>> ... this, can't the above be simplified?
> 
> I tried to replicate what happens in alloc_heap_pages() where:
> 
>>  /* Preserve PGC_need_scrub so we can check it after lock is dropped. */
>>  pg[i].count_info = PGC_state_inuse | (pg[i].count_info & PGC_need_scrub);
> 
> and then after the unlock the bit is tested.

Again I was indeed assuming that you used existing code as reference.
Yet again my question was whether that's actually what is needed here
(which then may or may not mean that it could be done differently
also there).

>>> @@ -2458,7 +2626,14 @@ struct page_info *alloc_domheap_pages(
>>>      if ( memflags & MEMF_no_owner )
>>>          memflags |= MEMF_no_refcount;
>>>
>>> -    if ( !dma_bitsize )
>>> +    /* Only domains are supported for coloring */
>>> +    if ( d && llc_coloring_enabled )
>>> +    {
>>> +        /* Colored allocation must be done on 0 order */
>>> +        if ( order || (pg = alloc_color_heap_page(memflags, d)) == NULL )
>>> +            return NULL;
>>> +    }
>>
>> I think I had asked before: What about MEMF_node() or MEMF_bits()
>> having been used by the caller?
> 
> MEMF_node() is used for NUMA, right? I think that for the moment, since cache
> coloring is supported only on arm64 and NUMA is not yet supported, it's safe
> to ignore it.

NUMA or not, I'm wary of silent ignoring of inputs. I'd rather request
that, just like with staticmem, precautions are then taken to avoid
coloring and NUMA to be used together. Recall that much like your work,
work to support NUMA is also in progress (unless it was canceled, but
not so announced).

> I'm not sure I understood what MEMF_bits() is for. It restricts the allocator
> to return pages in some range, right?

Correct.

Jan

