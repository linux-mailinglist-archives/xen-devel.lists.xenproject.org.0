Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 273269C8672
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2024 10:49:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836176.1252052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBWTS-00058y-NY; Thu, 14 Nov 2024 09:49:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836176.1252052; Thu, 14 Nov 2024 09:49:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBWTS-00056E-K6; Thu, 14 Nov 2024 09:49:14 +0000
Received: by outflank-mailman (input) for mailman id 836176;
 Thu, 14 Nov 2024 09:49:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=81on=SJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tBWTR-000568-PM
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2024 09:49:13 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b229a5f5-a26d-11ef-99a3-01e77a169b0f;
 Thu, 14 Nov 2024 10:49:09 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4314b316495so3848925e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 Nov 2024 01:49:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432da28ce85sm17457885e9.33.2024.11.14.01.49.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Nov 2024 01:49:08 -0800 (PST)
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
X-Inumbo-ID: b229a5f5-a26d-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMmQiLCJoZWxvIjoibWFpbC13bTEteDMyZC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImIyMjlhNWY1LWEyNmQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNTc3NzQ5LjgwMDY1Niwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731577749; x=1732182549; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Up+iFaJHYPNUOeLjA3/ZsmFjnxYtZ+EvrYGxpcojQXs=;
        b=VXRyIZ6eJikagW88lX8IEWgutZVsigglGzIZC/8/A4IFWr/fr+n4WQo4BatHqPvrvZ
         4I7cPo91RDNZ6HJmcqB5D9IdHHtAJspWq0UbGAZmjx6Q4qaJOzwc4A8ui4rLNfiLw1xV
         gGFZZb0d7IazBHWx80V714/ZSNCLgDfIB+dvIWaWMkRStGMFfxuj40enD3d79jqtLhaw
         IJjY8LHzQF+8Vu0oHrlshfNVn/Iu4CPX44X9AVC6fuGWJV7X/DTaEZpNaOODadonuv3F
         ffFeK7n1LOxw3nHUSXouffnhGwTnK5G6K/VIdYozj5Sn7WW7iX39GloMh36h/4V80fnR
         xfcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731577749; x=1732182549;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Up+iFaJHYPNUOeLjA3/ZsmFjnxYtZ+EvrYGxpcojQXs=;
        b=aGrCvAQTBEcPFBeCBz2toAkiGqNJfLtkXYEpKjTrlazAS5L7Z62G6u7QA24K1XXrrs
         CzNCwy5ie9UE3qms+xfNgcct6dId3knrX48c7EiBWl1DIQ4ohufSlFEual6L8ZvElyBf
         FBLKkSMjLH9uYbZhczWmwcgMhRUgVUXBp75aNaUCGPhhO8qln2wij3+teIX3jdCVjebR
         dYRVHzfZPLefVA/Coj82OgQi9zYGeOfYXh41cb4S6y0CkYHsqTSbavD5DisWhhabY4ix
         XV2byhE+bXwPsyWlFdE0phSmrds7EDBdw6mfRjU+SIMuAQHOBfsV1tEfTOXK3S5tI4w9
         +aFA==
X-Forwarded-Encrypted: i=1; AJvYcCUHoMonFq+k/GP4D2aYJ0taOVdluxFhgm/w/gi8Gb5I6VdVEHaXXmYDxetihIyOmPQXhhz/AO1NyZs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxxO+9ZhuZ7drQRKBA4qE1Iq9W9Hz1BA9NZoyOO5UorOwXJwISy
	EhGvlw34sr9ZwViKbnI3fXIYAWRuVSZABHZnJmTOZcZVEMCdNwcVjjKrdyTNCQ==
X-Google-Smtp-Source: AGHT+IGkkZ+Q6WWDX3l5mOvUQWIrWEawfCd4LtQs7KAq32DRAxLdszj1JV10PxynGEO0Aby8SRP8Pg==
X-Received: by 2002:a05:600c:46c8:b0:431:51e5:22fb with SMTP id 5b1f17b1804b1-432d4aaf30fmr58843345e9.14.1731577749021;
        Thu, 14 Nov 2024 01:49:09 -0800 (PST)
Message-ID: <7aaa8eea-247f-43f5-9777-2a3431e0c1a0@suse.com>
Date: Thu, 14 Nov 2024 10:49:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] xen/riscv: introduce setup_mm()
To: oleksii.kurochko@gmail.com
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1731344883.git.oleksii.kurochko@gmail.com>
 <c3640fe453cb8a0eff4d50d21d57535f67f7b92a.1731344883.git.oleksii.kurochko@gmail.com>
 <acd75f3d-da7d-4487-afde-877405c24c2a@suse.com>
 <aec35a326656a2b976b584ea5467f54cd87ca6d6.camel@gmail.com>
Content-Language: en-US
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
In-Reply-To: <aec35a326656a2b976b584ea5467f54cd87ca6d6.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.11.2024 12:39, oleksii.kurochko@gmail.com wrote:
> On Tue, 2024-11-12 at 12:22 +0100, Jan Beulich wrote:
>> On 11.11.2024 19:16, Oleksii Kurochko wrote:
>>> @@ -25,8 +27,11 @@
>>>  
>>>  static inline void *maddr_to_virt(paddr_t ma)
>>>  {
>>> -    BUG_ON("unimplemented");
>>> -    return NULL;
>>> +    unsigned long va_offset = maddr_to_directmapoff(ma);
>>> +
>>> +    ASSERT(va_offset < DIRECTMAP_SIZE);
>>
>> Much like with the consideration towards virt_to_maddr() that was
>> corrected from v4, I think this one also needs adjusting:
>>
>>     ASSERT(va_offset < DIRECTMAP_SIZE + (DIRECTMAP_VIRT_START -
>>                                          directmap_virt_start));
>>
>> This is because ...
>>
>>> +    return (void *)(directmap_virt_start + va_offset);
>>
>> ... you're offsetting the VA here. It may then want accompanying
>> by
>>
>>     ASSERT(va_offset >= DIRECTMAP_VIRT_START - directmap_virt_start);
>>
>> (probably to go first).
> I might be misunderstanding something, but shouldn't the assertions be
> as follows?
>    DIRECTMAP_VIRT_START <= (directmap_virt_start + va_offset) <
>    DIRECTMAP_VIRT_SIZE
> 
> So, va_offset should be in the range:
>    DIRECTMAP_VIRT_START - direcmap_virt_start <= va_offset <
>    DIRECTMAP_VIRT_SIZE - directmap_virt_start
>    
> This would make the assertions look like:
>    ASSERT(va_offset < DIRECTMAP_VIRT_SIZE - directmap_virt_tart)
>    ASSERT(va_offset >= DIRECTMAP_VIRT_START - directmap_virt_start)
> 
> So, we have different check for the first ASSERT. Could you please
> clarify where my calculations are wrong?

First and foremost - you can't compare an address (offset or not) against
a size. You can only ever compare it against start / end (again with
possible offsets applied).

>>> @@ -423,3 +429,147 @@ void * __init early_fdt_map(paddr_t
>>> fdt_paddr)
>>>  
>>>      return fdt_virt;
>>>  }
>>> +
>>> +vaddr_t __ro_after_init directmap_virt_start =
>>> DIRECTMAP_VIRT_START;
>>> +
>>> +struct page_info *__ro_after_init frametable_virt_start =
>>> frame_table;
>>> +
>>> +#ifndef CONFIG_RISCV_32
>>> +
>>> +/* Map a frame table to cover physical addresses ps through pe */
>>> +static void __init setup_frametable_mappings(paddr_t ps, paddr_t
>>> pe)
>>> +{
>>> +    static mfn_t __initdata frametable_mfn_start =
>>> INVALID_MFN_INITIALIZER;
>>> +
>>> +    paddr_t aligned_ps = ROUNDUP(ps, PAGE_SIZE);
>>> +    paddr_t aligned_pe = ROUNDDOWN(pe, PAGE_SIZE);
>>> +    unsigned long nr_mfns = PFN_DOWN(aligned_pe - aligned_ps);
>>> +    unsigned long frametable_size = nr_mfns *
>>> sizeof(*frame_table);
>>> +    mfn_t base_mfn;
>>> +
>>> +    if ( mfn_eq(frametable_mfn_start, INVALID_MFN) )
>>> +    {
>>> +        frametable_mfn_start = maddr_to_mfn(aligned_ps);
>>> +
>>> +        frametable_virt_start -= paddr_to_pfn(aligned_ps);
>>> +    }
>>> +    else
>>> +        panic("%s shouldn't be called twice\n", __func__);
>>
>> As said on the v4 thread - I don't think this is needed. Aiui Misra
>> would
>> actually dislike it, as it's unreachable code. Just to re-iterate: My
>> complaint there wasn't about this missing check, but about the
>> function
>> partly giving the impression of expecting to be called more than
>> once.
> I’ll revert this check, then. Would it be better—and sufficient—to add
> a comment before setup_frametable_mappings() indicating that this
> function should only be called once, to avoid any impression that it
> might be expected to be called multiple times?

You can add such a comment if you like, we we have many functions of this
kind. The important aspect - as said before - is that the function should
not - nowhere - give the impression of possibly expecting to be called
more than once.

>>> +void __init setup_mm(void)
>>> +{
>>> +    const struct membanks *banks = bootinfo_get_mem();
>>> +    paddr_t ram_start = INVALID_PADDR;
>>> +    paddr_t ram_end = 0;
>>> +    unsigned int i;
>>> +
>>> +    /*
>>> +     * We need some memory to allocate the page-tables used for
>>> the directmap
>>> +     * mappings. But some regions may contain memory already
>>> allocated
>>> +     * for other uses (e.g. modules, reserved-memory...).
>>> +     *
>>> +     * For simplicity, add all the free regions in the boot
>>> allocator.
>>> +     */
>>> +    populate_boot_allocator();
>>> +
>>> +    for ( i = 0; i < banks->nr_banks; i++ )
>>> +    {
>>> +        const struct membank *bank = &banks->bank[i];
>>> +        paddr_t bank_start = ROUNDUP(bank->start, PAGE_SIZE);
>>> +        paddr_t bank_end = ROUNDDOWN(bank->start + bank->size,
>>> PAGE_SIZE);
>>> +        unsigned long bank_size = bank_end - bank_start;
>>> +
>>> +        ram_start = min(ram_start, bank_start);
>>> +        ram_end = max(ram_end, bank_end);
>>> +
>>> +        setup_directmap_mappings(PFN_DOWN(bank_start),
>>> PFN_DOWN(bank_size));
>>> +    }
>>> +
>>> +    setup_frametable_mappings(ram_start, ram_end);
>>
>> Just to double check: There is a guarantee that ->nr_banks isn't
>> going to
>> be zero? Else the setup_frametable_mappings() invocation here would
>> badly
>> degenerate.
> Based on the what is mentioned in the device tree spec I would say yes
> but based on the code we have in Xen ( and if I am not confusing
> something ) it is still a chance that ->nr_banks could be zero.
> 
> From the device tree spec:
> ```
> A memory device node is required for all devicetrees and describes the
> physical memory layout for the system. If a system
> has multiple ranges of memory, multiple memory nodes can be created, or
> the ranges can be specified in the reg property
> of a single memory node.
> 
> Property Name  Usage   Value Type           Definition
> device_type     R      <string>             Value shall be “memory”
> reg             R      <prop-encoded-array> ...
> 
> Usage legend: R=Required, O=Optional, OR=Optional but Recommended,
> SD=See Definition
> ```
> 
> So the memory node should present in devicetree ( interesting that few
> years ago I remember that I could build devicetree w/o memory node,
> anyway, Xen cheking a reg property of memory node and panic if
> something wrong ).
> 
> In the same time, based on the code of device_tree_get_meminfo() (
> xen/common/device-tree/bootfdt.c:169 ):
>        prop = fdt_get_property(fdt, node, prop_name, NULL);
>        if ( !prop )
>            return -ENOENT;
>    
>        cell = (const __be32 *)prop->data;
>        banks = fdt32_to_cpu(prop->len) / (reg_cells * sizeof (u32));
>    
>        for ( i = 0; i < banks && mem->nr_banks < mem->max_banks; i++ )
>        {
>            device_tree_get_reg(&cell, address_cells, size_cells,
>    &start, &size);
>            if ( mem == bootinfo_get_reserved_mem() &&
>                 check_reserved_regions_overlap(start, size) )
>                return -EINVAL;
>            /* Some DT may describe empty bank, ignore them */
>            if ( !size )
>                continue;
>            mem->bank[mem->nr_banks].start = start;
>            mem->bank[mem->nr_banks].size = size;
>            mem->bank[mem->nr_banks].type = type;
>            mem->nr_banks++;
>        }
>    
> It is possible that mem->nr_banks is equal to 0 ( when DT describe only
> empty banks? ) but then it sounds to me like something wrong with DT.
> 
> Just to be sure that everything is okay with ->nr_banks I could suggest
> to add BUG_ON(banks->nr_banks) in setup_mm() before the `for` cycle.
> Does it make sense?

As you likely mean BUG_ON(!banks->nr_banks) - yes. Still this is again a
case where I think panic() is preferable over BUG_ON().

Jan

