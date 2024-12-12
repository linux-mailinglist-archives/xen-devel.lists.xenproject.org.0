Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F35E9EFAD2
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2024 19:24:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.856260.1268934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLnqN-00038p-N4; Thu, 12 Dec 2024 18:23:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 856260.1268934; Thu, 12 Dec 2024 18:23:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLnqN-00037D-K0; Thu, 12 Dec 2024 18:23:23 +0000
Received: by outflank-mailman (input) for mailman id 856260;
 Thu, 12 Dec 2024 18:23:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JW8/=TF=minervasys.tech=andrea.bastoni@srs-se1.protection.inumbo.net>)
 id 1tLnqL-000377-D0
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2024 18:23:21 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 29600a5c-b8b6-11ef-99a3-01e77a169b0f;
 Thu, 12 Dec 2024 19:23:19 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-aa66ead88b3so168153766b.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Dec 2024 10:23:19 -0800 (PST)
Received: from ?IPV6:2001:4ca0:0:f293:dc1b:7733:c3ba:a819?
 ([2001:4ca0:0:f293:dc1b:7733:c3ba:a819])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa68f70cc47sm571518866b.123.2024.12.12.10.23.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Dec 2024 10:23:18 -0800 (PST)
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
X-Inumbo-ID: 29600a5c-b8b6-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1734027798; x=1734632598; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4XUi4a7hE2rmXI8Ng6fxTd+T/FbjYkCmbPSpum5eWW4=;
        b=pMv9lrhHMTC9EkWuzh2Gwe3DywnZ/nrH79/i+A4JMjMqnJZZH9aRzcZLGQfMbHiMrv
         +N+cmcqEEyjN1bwBHx8R5HYxVD+1xVAIffYACzUIenSmOJrZJA9hcVxRnpjEWbqK1CPb
         LbFnFsWLPGzM+oAxQlTKQXR6kLCZv+Mhmvke9fLWyk+hsVG4Nxv9WrkHsm0PcI0y74cM
         Rh35qsw1a3T/Xw5v0yWwGLuyWhJpejGj4zfmKzoOgkGU0C6O2KT782CuK/bujBcIZ7Ly
         IfJpWukrp2MgWXpkCvulI7SPDzOp6MIrE7VM/Jg3fl6axNZCsiMUTXMct0k7vw5Gs2bh
         pJSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734027798; x=1734632598;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4XUi4a7hE2rmXI8Ng6fxTd+T/FbjYkCmbPSpum5eWW4=;
        b=HVw8G9smUll8R7qCd4pV+LHvJaQpi30/EkjFTm8DUW/yXTUCEdf346tCYAafHrvFvn
         n1ds1fB1z6/S5JKQd8ftsno/jmRKg0lf6D9Afb1lH+kmrH8G/gvFUme1XSxkZKeyBbM1
         V9eUhLncPQblbW7Rb7jyWKu9MA7WL5zv/gseiZicKy9zSNQdqGEvtFPE3Acdg2BI5HbT
         LkqRoSXJzjwJjZq5mB5yRyVc+AnxxqU4yt/KR3caIXhAeBYDBMErzBdVhl7VT5sHhS/J
         CvaGueWVgnrCB9rBP/EJnEmDR4OChs/ejXlX6HL4xyVyp3CUKGpDAlA4zf+CmJMF+QFy
         AKsA==
X-Forwarded-Encrypted: i=1; AJvYcCWrtzxtkoe9qvmhfWlWeVB7LMa5hyZsMfpoW7DlPkMRgKiYSVJ31EyBunFW8wQRHhGLV/XLaFgJ3q0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzoUf+cw35+3nXMGzbHs/lodyC0Z+tIHzRDtjKYKbD1DV3mvrO3
	7Uq1jXIhIu6NVEoIXwbsN1WVoDkcmG85KhP7vlf1cRsr8uTyHzNUYWxDlNtq36I=
X-Gm-Gg: ASbGncspj/eHLK8XjGG5Yr7/VBavVbhRVe+92EHOEyA9D/o8l8UFdQ8LCmRAMP5/Mvh
	4EZmPXahAbnm2j/KPgh4VcelUiKIv9Hizw+VNsEFx+/Jre6n/OCDrkau2YRNjeADIftubKINJuH
	da6zO+t3MjiS48TmV0UgX0m2pYeWFG79ZSE5fz1qrFQ+hfSAaNuOenHds2TTWZWhZd7H3wioU9/
	lWv8nXg40GliK9P6iQ7y0t43hOdqB0F7sOaBrElrgcWIXH/jtEHzWfRUF0HqXA1v1xDXVXqO6Zk
	D5LVCa91QuNQY2lU9wtVAOtN2KL1lKnMwWJPbw==
X-Google-Smtp-Source: AGHT+IHnvxfPvEAhz++HPBKL7nc9OF5D2iH8j6tW64b2Tsi49u5SaB8EgOWUVsOG/LOJrJJ/B8pjew==
X-Received: by 2002:a17:906:314e:b0:aa6:b5d8:d5c4 with SMTP id a640c23a62f3a-aa6b5d8d617mr807141066b.17.1734027798457;
        Thu, 12 Dec 2024 10:23:18 -0800 (PST)
Message-ID: <dbab9581-2059-4662-b684-163343b61d0d@minervasys.tech>
Date: Thu, 12 Dec 2024 19:22:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 03/12] xen/arm: permit non direct-mapped Dom0
 construction
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>, Julien Grall <julien@xen.org>
Cc: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org,
 marco.solieri@minervasys.tech, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241202165921.249585-1-carlo.nonato@minervasys.tech>
 <20241202165921.249585-4-carlo.nonato@minervasys.tech>
 <bc40c381-0998-4dd2-b5c9-5b70b45805ce@amd.com>
 <7ecc99c5-0cb5-4351-bede-cb03c9a4ac7e@xen.org>
 <293004fa-c87e-4a45-aa4c-b02456aaecea@amd.com>
 <0bacfdb6-d4ad-4dea-85d4-2851873dca4e@xen.org>
 <CAG+AhRUtMy=WckZaeWGBDSQEh_09p4cTVFWSSCxaEXv6vnLk4Q@mail.gmail.com>
From: Andrea Bastoni <andrea.bastoni@minervasys.tech>
Autocrypt: addr=andrea.bastoni@minervasys.tech; keydata=
 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
 Id5SuAU=
In-Reply-To: <CAG+AhRUtMy=WckZaeWGBDSQEh_09p4cTVFWSSCxaEXv6vnLk4Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/12/2024 18:48, Carlo Nonato wrote:
> Hi,
> 
> On Mon, Dec 9, 2024 at 8:17 PM Julien Grall <julien@xen.org> wrote:
>>
>> Hi Michal,
>>
>> On 07/12/2024 15:04, Michal Orzel wrote:
>>>
>>>
>>> On 06/12/2024 19:37, Julien Grall wrote:
>>>>
>>>>
>>>> Hi,
>>>>
>>>> Sorry for the late answer.
>>>>
>>>> On 05/12/2024 09:40, Michal Orzel wrote:
>>>>>
>>>>>
>>>>> On 02/12/2024 17:59, Carlo Nonato wrote:
>>>>>>
>>>>>>
>>>>>> Cache coloring requires Dom0 not to be direct-mapped because of its non
>>>>>> contiguous mapping nature, so allocate_memory() is needed in this case.
>>>>>> 8d2c3ab18cc1 ("arm/dom0less: put dom0less feature code in a separate module")
>>>>>> moved allocate_memory() in dom0less_build.c. In order to use it
>>>>>> in Dom0 construction bring it back to domain_build.c and declare it in
>>>>>> domain_build.h.
>>>>>>
>>>>>> Take the opportunity to adapt the implementation of allocate_memory() so
>>>>>> that it uses the host layout when called on the hwdom, via
>>>>>> find_unallocated_memory().
>>>>>>
>>>>>> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
>>>>>> ---
>>>>>> v11:
>>>>>> - GUEST_RAM_BANKS instead of hardcoding the number of banks in allocate_memory()
>>>>>> - hwdom_ext_regions -> hwdom_free_mem in allocate_memory()
>>>>>> - added a comment in allocate_memory() when skipping small banks
>>>>>> v10:
>>>>>> - fixed a compilation bug that happened when dom0less support was disabled
>>>>>> v9:
>>>>>> - no changes
>>>>>> v8:
>>>>>> - patch adapted to new changes to allocate_memory()
>>>>>> v7:
>>>>>> - allocate_memory() now uses the host layout when called on the hwdom
>>>>>> v6:
>>>>>> - new patch
>>>>>> ---
>>>>>>    xen/arch/arm/dom0less-build.c           | 44 -----------
>>>>>>    xen/arch/arm/domain_build.c             | 97 ++++++++++++++++++++++++-
>>>>>>    xen/arch/arm/include/asm/domain_build.h |  1 +
>>>>>>    3 files changed, 94 insertions(+), 48 deletions(-)
>>>>>>
>>>>>> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
>>>>>> index d93a85434e..67b1503647 100644
>>>>>> --- a/xen/arch/arm/dom0less-build.c
>>>>>> +++ b/xen/arch/arm/dom0less-build.c
>>>>>> @@ -49,50 +49,6 @@ bool __init is_dom0less_mode(void)
>>>>>>        return ( !dom0found && domUfound );
>>>>>>    }
>>>>>>
>>>>>> -static void __init allocate_memory(struct domain *d, struct kernel_info *kinfo)
>>>>>> -{
>>>>>> -    struct membanks *mem = kernel_info_get_mem(kinfo);
>>>>>> -    unsigned int i;
>>>>>> -    paddr_t bank_size;
>>>>>> -
>>>>>> -    printk(XENLOG_INFO "Allocating mappings totalling %ldMB for %pd:\n",
>>>>>> -           /* Don't want format this as PRIpaddr (16 digit hex) */
>>>>>> -           (unsigned long)(kinfo->unassigned_mem >> 20), d);
>>>>>> -
>>>>>> -    mem->nr_banks = 0;
>>>>>> -    bank_size = MIN(GUEST_RAM0_SIZE, kinfo->unassigned_mem);
>>>>>> -    if ( !allocate_bank_memory(kinfo, gaddr_to_gfn(GUEST_RAM0_BASE),
>>>>>> -                               bank_size) )
>>>>>> -        goto fail;
>>>>>> -
>>>>>> -    bank_size = MIN(GUEST_RAM1_SIZE, kinfo->unassigned_mem);
>>>>>> -    if ( !allocate_bank_memory(kinfo, gaddr_to_gfn(GUEST_RAM1_BASE),
>>>>>> -                               bank_size) )
>>>>>> -        goto fail;
>>>>>> -
>>>>>> -    if ( kinfo->unassigned_mem )
>>>>>> -        goto fail;
>>>>>> -
>>>>>> -    for( i = 0; i < mem->nr_banks; i++ )
>>>>>> -    {
>>>>>> -        printk(XENLOG_INFO "%pd BANK[%d] %#"PRIpaddr"-%#"PRIpaddr" (%ldMB)\n",
>>>>>> -               d,
>>>>>> -               i,
>>>>>> -               mem->bank[i].start,
>>>>>> -               mem->bank[i].start + mem->bank[i].size,
>>>>>> -               /* Don't want format this as PRIpaddr (16 digit hex) */
>>>>>> -               (unsigned long)(mem->bank[i].size >> 20));
>>>>>> -    }
>>>>>> -
>>>>>> -    return;
>>>>>> -
>>>>>> -fail:
>>>>>> -    panic("Failed to allocate requested domain memory."
>>>>>> -          /* Don't want format this as PRIpaddr (16 digit hex) */
>>>>>> -          " %ldKB unallocated. Fix the VMs configurations.\n",
>>>>>> -          (unsigned long)kinfo->unassigned_mem >> 10);
>>>>>> -}
>>>>>> -
>>>>>>    #ifdef CONFIG_VGICV2
>>>>>>    static int __init make_gicv2_domU_node(struct kernel_info *kinfo)
>>>>>>    {
>>>>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>>>>>> index 2c30792de8..2b8cba9b2f 100644
>>>>>> --- a/xen/arch/arm/domain_build.c
>>>>>> +++ b/xen/arch/arm/domain_build.c
>>>>>> @@ -416,7 +416,6 @@ static void __init allocate_memory_11(struct domain *d,
>>>>>>        }
>>>>>>    }
>>>>>>
>>>>>> -#ifdef CONFIG_DOM0LESS_BOOT
>>>>>>    bool __init allocate_domheap_memory(struct domain *d, paddr_t tot_size,
>>>>>>                                        alloc_domheap_mem_cb cb, void *extra)
>>>>>>    {
>>>>>> @@ -508,7 +507,6 @@ bool __init allocate_bank_memory(struct kernel_info *kinfo, gfn_t sgfn,
>>>>>>
>>>>>>        return true;
>>>>>>    }
>>>>>> -#endif
>>>>>>
>>>>>>    /*
>>>>>>     * When PCI passthrough is available we want to keep the
>>>>>> @@ -1003,6 +1001,94 @@ out:
>>>>>>        return res;
>>>>>>    }
>>>>>>
>>>>>> +void __init allocate_memory(struct domain *d, struct kernel_info *kinfo)
>>>>>> +{
>>>>>> +    struct membanks *mem = kernel_info_get_mem(kinfo);
>>>>>> +    unsigned int i, nr_banks = GUEST_RAM_BANKS;
>>>>>> +    paddr_t bank_start, bank_size;
>>>>> Limit the scope
>>>>>
>>>>>> +    struct membanks *hwdom_free_mem = NULL;
>>>>>> +    const uint64_t bankbase[] = GUEST_RAM_BANK_BASES;
>>>>>> +    const uint64_t banksize[] = GUEST_RAM_BANK_SIZES;
>>>>> Limit the scope
>>>>>
>>>>>> +
>>>>>> +    printk(XENLOG_INFO "Allocating mappings totalling %ldMB for %pd:\n",
>>>>>> +           /* Don't want format this as PRIpaddr (16 digit hex) */
>>>>>> +           (unsigned long)(kinfo->unassigned_mem >> 20), d);
>>>>>> +
>>>>>> +    mem->nr_banks = 0;
>>>>>> +    /*
>>>>>> +     * Use host memory layout for hwdom. Only case for this is when LLC coloring
>>>>>> +     * is enabled.
>>>>>> +     */
>>>>>> +    if ( is_hardware_domain(d) )
>>>>>> +    {
>>>>>> +        ASSERT(llc_coloring_enabled);
>>>>> This patch does not build because of declaration not being visible. You must include <xen/llc-coloring.h>.
>>>>
>>>> Piggying back on this comment. AFAICT, the code below would work also in
>>>> the non cache coloring case. So what's the assert is for?
>>>>
>>>>>
>>>>>> +
>>>>>> +        hwdom_free_mem = xzalloc_flex_struct(struct membanks, bank,
>>>>>> +                                             NR_MEM_BANKS);
>>>>>> +        if ( !hwdom_free_mem )
>>>>>> +            goto fail;
>>>>>> +
>>>>>> +        hwdom_free_mem->max_banks = NR_MEM_BANKS;
>>>>>> +
>>>>>> +        if ( find_unallocated_memory(kinfo, hwdom_free_mem) )
>>>>> My remarks for the use of find_unallocated_memory() 1:1 have not been addressed. You did not even
>>>>> change the comments inside the function. The problem is that the function is specifically designed
>>>>> for finding extended regions and assumes being called at certain point i.e. dom0 RAM allocated, gnttab
>>>>> region allocated, etc.
>>>>
>>>> So I agree that the function should be updated if we plan to use it for
>>>> other purpose.
>>>>
>>>> My opinion is that we should attempt to make the function generic so
>>>> that in your
>>>>> case you can choose which regions to exclude, define even your own function to grab free regions (at the moment
>>>>> add_ext_regions grabs banks >= 64M but you still discards banks >= 128M, so it's a bit wasteful.
>>>>>
>>>>> My very short attempt to make the function as generic as possible in the first iteration:
>>>>> https://paste.debian.net/1338334/
>>>>
>>>> This looks better, but I wonder why we need still need to exclude the
>>>> static regions? Wouldn't it be sufficient to exclude just reserved regions?
>>> Static shared memory banks are not part of reserved memory (i.e. bootinfo.reserved_mem) if that's what you're asking.
>>> They are stored in bootinfo.shmem, hence we need to take them into account when searching for unused address space.
>>
>> Oh I missed the fact you now pass "mem_banks" as a parameter. I thought
>> they would still get excluded for cache coloring case.
>>
>>>
>>> If you and Carlo are ok with my proposed solution for making the function generic, I can send a patch as a prerequisite
>>> patch for Carlo series.
>>
>> I am fine with the approach.
>>
>> Cheers,
>>
>> --
>> Julien Grall
>>
> 
>> @@ -2152,7 +2238,10 @@ static int __init construct_dom0(struct domain *d)
>>      /* type must be set before allocate_memory */
>>      d->arch.type = kinfo.type;
>>  #endif
>> -    allocate_memory_11(d, &kinfo);
>> +    if ( is_domain_direct_mapped(d) )
>> +        allocate_memory_11(d, &kinfo);
>> +    else
>> +        allocate_memory(d, &kinfo);
>>      find_gnttab_region(d, &kinfo);
> 
> Since find_gnttab_region() is called after allocate_memory(), kinfo->gnttab_*
> fields aren't initialized and the call to find_unallocated_memory() with
> gnttab as the region to exclude, fails ending in a crash since memory for
> dom0 can't be allocated.
> 
> Can the solution be to call find_gnttab_region() before the above if?

The function is called find, but currently it only initializes kinfo->gnttab_start
and kinfo->gnttab_size and we tested that moving it before allocate_memory* doesn't
cause fallouts.

If moving before allocate_memory*, would it be better to rename it e.g., init_gnttab_region()?

Thanks,
Andrea

> Or should I just call it before allocate_memory() in one case, but still after
> allocate_memory_11() in the other?
> 
> Thanks.


