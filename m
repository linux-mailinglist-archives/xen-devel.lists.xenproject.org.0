Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7692F9B7717
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2024 10:09:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828492.1243382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6RAJ-0006Kt-2k; Thu, 31 Oct 2024 09:08:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828492.1243382; Thu, 31 Oct 2024 09:08:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6RAI-0006Ic-Ue; Thu, 31 Oct 2024 09:08:26 +0000
Received: by outflank-mailman (input) for mailman id 828492;
 Thu, 31 Oct 2024 09:08:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zW4/=R3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t6RAH-0006IW-Gi
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2024 09:08:25 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad51bd88-9767-11ef-a0c3-8be0dac302b0;
 Thu, 31 Oct 2024 10:08:21 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4315f24a6bbso5377765e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 31 Oct 2024 02:08:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4327d5e7c51sm17838615e9.25.2024.10.31.02.08.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Oct 2024 02:08:20 -0700 (PDT)
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
X-Inumbo-ID: ad51bd88-9767-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzEiLCJoZWxvIjoibWFpbC13bTEteDMzMS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImFkNTFiZDg4LTk3NjctMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMzY1NzAxLjk3MTYwMSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730365701; x=1730970501; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cZEWSP3mjYpMtJHQX7RTabuBeg1mBuVEQL7ca+gHe0E=;
        b=druEu0Eajn399uN6pMp/ywWBfOuCuAedqrHVcTFjgQvvSM6vFClKndOX8BBOD6WVcj
         lyEgZVM3vMG7q3izWdkqrDQP7smiIAQifJnIt2E3sz8y3/VgdS3qUhFyersHCCWdpOH9
         5m/s1Fp+va+cQCYfTfozAT3hKwg8PwxbY/vh79kz9tmv8yIIcAoapECFS/6906P6QW0+
         kEOetHwFxmVOkN+kWuMkAVUX7N6Tv/tN87JbSRIfyA8XdXcJiWwWTeUswAIpjYHu9IYN
         r87GWQ7aYqdY6jDtpk2BWIeYhQ89SiEzch6Nbho9XSpG6QVIpxCQfUenMATan1n7hr8e
         9wQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730365701; x=1730970501;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cZEWSP3mjYpMtJHQX7RTabuBeg1mBuVEQL7ca+gHe0E=;
        b=w7Qx18onoYzo0MzLJY20/Ri2f4OhyGhT4gNGKnOoZS0tYV+C/REWmdn/i+Fjit/qFK
         nur67Shw8mbb/hrrVBM8YafED/guh7mrtfJ3RDEhj8GCgG/1tNfsBX9drRWLvX31ZIvx
         fmnUCoS/3AsBIs+bXjdQ9DcLz2WF7Hc+8eVgEZLvQ6s1U96s7GLfl5U5oYGGjvyEOA/0
         eHlOL9Q9IknN5KEyTHAry2WKkEVcH8UvXlSYKvZ2oaIr5Phc2J9HGto4dW37BdLes5kv
         /7XEYDW8+A9O4K/BwwN5cp8tLGUtngBhLGvKquCClq/YZj3CCIP/+fUtNUIrtBys41tY
         0qbA==
X-Forwarded-Encrypted: i=1; AJvYcCVJxwOHphEf7Cdt7AiS36EFwAtwnq2hnnSpV3txErGxvbGaYxMJgucmCE/Dq8FjORRZcikqHTeFvHw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwoDdD0wgdDWBgoALN3I+dNidyWyKdN8dzHM9uQQ2yFtpJRlllU
	F0V6i2tXwM15KFvbmOXh1Ctj6QJu8kPBVdS8dbG0v1jxzaQdiVNotIce6iTc9w==
X-Google-Smtp-Source: AGHT+IHohCX5UV8MKdZ9JumM9RZH2+TbNsj56rXIhz0v/uN4tOf2x0nyvf18WyY+I9RSVuG7ANgsog==
X-Received: by 2002:a05:600c:358c:b0:431:5522:e009 with SMTP id 5b1f17b1804b1-4319ac9a91cmr157676855e9.12.1730365700918;
        Thu, 31 Oct 2024 02:08:20 -0700 (PDT)
Message-ID: <e067e169-3e63-4d01-963f-9dde3bb8e3b7@suse.com>
Date: Thu, 31 Oct 2024 10:08:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] xen/riscv: introduce setup_mm()
To: oleksii.kurochko@gmail.com
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1729697111.git.oleksii.kurochko@gmail.com>
 <28240dcfc04a11237db553c4e0ecb372aa0fe9ac.1729697111.git.oleksii.kurochko@gmail.com>
 <8ec6463e-40a8-4d60-b4c2-ea964a06c572@suse.com>
 <76fc4999eded2ce74fe73bc81998e92147cf802a.camel@gmail.com>
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
In-Reply-To: <76fc4999eded2ce74fe73bc81998e92147cf802a.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.10.2024 17:50, oleksii.kurochko@gmail.com wrote:
> On Wed, 2024-10-30 at 11:25 +0100, Jan Beulich wrote:
>> On 23.10.2024 17:50, Oleksii Kurochko wrote:
>>> @@ -25,8 +27,11 @@
>>>  
>>>  static inline void *maddr_to_virt(paddr_t ma)
>>>  {
>>> -    BUG_ON("unimplemented");
>>> -    return NULL;
>>> +    unsigned long va_offset = maddr_to_directmapoff(ma);
>>> +
>>> +    ASSERT(va_offset < DIRECTMAP_SIZE);
>>> +
>>> +    return (void *)(XENHEAP_VIRT_START + va_offset);
>>>  }
>>
>> I'm afraid I'm not following why this uses XENHEAP_VIRT_START, when
>> it's all about the directmap. I'm in trouble with XENHEAP_VIRT_START
>> in the first place: You don't have a separate "heap" virtual address
>> range, do you?
> The name may not be ideal for RISC-V. I borrowed it from Arm, intending
> to account for cases where the directmap virtual start might not align
> with DIRECTMAP_VIRT_START due to potential adjustments for superpage
> mapping.
> And my understanding is that XENHEAP == DIRECTMAP in case of Arm64.

Just to mention it: If I looked at Arm64 in isolation (without also
considering Arm32, and hence the desire to keep code common where possible),
I'd consider the mere existence of XENHEAP_VIRT_START (without an
accompanying XENHEAP_VIRT_SIZE) a mistake. Therefore for RISC-V its
introduction may be justified by (remote) plans to also cover RV32 at some
point. Yet such than needs sayin explicitly in the description.

>>> @@ -423,3 +424,123 @@ void * __init early_fdt_map(paddr_t
>>> fdt_paddr)
>>>  
>>>      return fdt_virt;
>>>  }
>>> +
>>> +#ifndef CONFIG_RISCV_32
>>
>> I'd like to ask that you be more selective with this #ifdef (or omit
>> it
>> altogether here). setup_mm() itself, for example, looks good for any
>> mode.
> Regarding setup_mm() as they have pretty different implementations for
> 32 and 64 bit versions.

Not setup_mm() itself, it seems. Its helpers - sure.

>>> +    if ( map_pages_to_xen(FRAMETABLE_VIRT_START, base_mfn,
>>> +                          PFN_DOWN(frametable_size),
>>> +                          PAGE_HYPERVISOR_RW) )
>>> +        panic("Unable to setup the frametable mappings\n");
>>> +
>>> +    memset(&frame_table[0], 0, nr_mfns * sizeof(struct
>>> page_info));
>>> +    memset(&frame_table[nr_mfns], -1,
>>> +           frametable_size - (nr_mfns * sizeof(struct
>>> page_info)));
>>
>> Here (see comments on v1) you're still assuming ps == 0.
> Do you refer to ?
> ```
>> +/* Map a frame table to cover physical addresses ps through pe */
>> +static void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
>> +{
>> +    unsigned long nr_mfns = mfn_x(mfn_add(maddr_to_mfn(pe), -1)) -
> 
> This looks to be accounting for a partial page at the end.
> 
>> +                            mfn_x(maddr_to_mfn(ps)) + 1;
> 
> Whereas this doesn't do the same at the start. The sole present caller
> passes 0, so that's going to be fine for the time being. Yet it's a
> latent pitfall. I'd recommend to either drop the function parameter, or
> to deal with it correctly right away.
> ```
> And I've added aligned_ps to cover the case that ps could be not page
> aligned.

Not this, no, but ...

> Or are you refering to 0 in memset(&frame_table[0],...)?

... this. If the start address wasn't 0, you'd need to invalidate a
region at the start of the table, just as you invalidate a region at the
end.

>>> +/* Map the region in the directmap area. */
>>> +static void __init setup_directmap_mappings(unsigned long
>>> base_mfn,
>>> +                                            unsigned long nr_mfns)
>>> +{
>>> +    int rc;
>>> +
>>> +    /* First call sets the directmap physical and virtual offset.
>>> */
>>> +    if ( mfn_eq(directmap_mfn_start, INVALID_MFN) )
>>> +    {
>>> +        directmap_mfn_start = _mfn(base_mfn);
>>> +
>>> +        /*
>>> +         * The base address may not be aligned to the second level
>>> +         * size (e.g. 1GB when using 4KB pages). This would
>>> prevent
>>> +         * superpage mappings for all the regions because the
>>> virtual
>>> +         * address and machine address should both be suitably
>>> aligned.
>>> +         *
>>> +         * Prevent that by offsetting the start of the directmap
>>> virtual
>>> +         * address.
>>> +         */
>>> +        directmap_virt_start = DIRECTMAP_VIRT_START +
>>> pfn_to_paddr(base_mfn);
>>
>> Don't you need to mask off top bits of the incoming MFN here, or else
>> you
>> may waste a huge part of direct map space?
> Yes, it will result in a loss of direct map space, but we still have a
> considerable amount available in Sv39 mode and higher modes. The
> largest RAM_START I see currently is 0x1000000000, which means we would
> lose 68 GB. However, our DIRECTMAP_SIZE is 308 GB, so there is still
> plenty of free space available, and we can always increase
> DIRECTMAP_SIZE since we have a lot of free virtual address space in
> Sv39.

Wow, 68 out of 308 - that's more than 20%. I'm definitely concerned of
this then.

> Finally, regarding masking off the top bits of mfn, I'm not entirely
> clear on how this should work. If I understand correctly, if I mask off
> certain top bits in mfn, then I would need to unmask those same top
> bits in maddr_to_virt() and virt_to_maddr(). Is that correct?
> 
> Another point I’m unclear on is which specific part of the top bits
> should be masked.

You want to "move" the directmap such that the first legitimate RAM
page is within the first (large/huge) page mapping of the directmap.
IOW the "virtual" start of the directmap would move down in VA space.
That still leaves things at a simple offset calculation when
translating VA <-> PA.

To give an example: Let's assume RAM starts at 61.5 Gb, and you want to
use 1Gb mappings for the bulk of the directmap. Then the "virtual" start
of the directmap would shift down to DIRECTMAP_VIRT_START - 60Gb,
such that the first RAM page would be mapped at
DIRECTMAP_VIRT_START + 1.5Gb. IOW it would be the low 30 address bits of
the start address that you use (30 - PAGE_SHIFT for the MFN), with the
higher bits contributing to the offset involved in the VA <-> PA
translation. Values used depend on the (largest) page size you mean to
use for the direct map: On systems with terabytes of memory (demanding
Sv48 or even Sv57 mode) you may want to use 512Gb mappings, and hence
you'd then need to mask the low 39 bits (or 48 for 256Tb mappings).

>>> +void __init setup_mm(void)
>>> +{
>>> +    const struct membanks *banks = bootinfo_get_mem();
>>> +    paddr_t ram_start = INVALID_PADDR;
>>> +    paddr_t ram_end = 0;
>>> +    paddr_t ram_size = 0;
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
>>> +    total_pages = 0;
>>> +
>>> +    for ( i = 0; i < banks->nr_banks; i++ )
>>> +    {
>>> +        const struct membank *bank = &banks->bank[i];
>>> +        paddr_t bank_end = bank->start + bank->size;
>>> +
>>> +        ram_size += ROUNDDOWN(bank->size, PAGE_SIZE);
>>
>> As before - if a bank doesn't cover full pages, this may give the
>> impression
>> of there being more "total pages" than there are.
> Since it rounds down to PAGE_SIZE, if ram_start is 2K and the total
> size of a bank is 11K, ram_size will end up being 8K, so the "total
> pages" will cover less RAM than the actual size of the RAM bank.

ram_start at 2k but bank size being 13k would yield 2 usable pages
(first partial page of 2k unusable and last partial page of 3k
unusable), yet ram_size of 12k (3 pages). You need to consider the
common case; checking things work for a randomly chosen example isn't
enough.

>>> +        ram_start = min(ram_start, bank->start);
>>> +        ram_end = max(ram_end, bank_end);
>>> +
>>> +        setup_directmap_mappings(PFN_DOWN(bank->start),
>>> +                                 PFN_DOWN(bank->size));
>>
>> Similarly I don't think this is right when both start and size aren't
>> multiple of PAGE_SIZE. You may map an unsuable partial page at the
>> start,
>> and then fail to map a fully usable page at the end.
> ram_size should be a multiple of PAGE_SIZE because we have:
>     ram_size += ROUNDDOWN(bank->size, PAGE_SIZE);
> 
> Do you know of any examples where bank->start isn't aligned to
> PAGE_SIZE?

Question is the other way around: Is it specified anywhere that start (and
size) _need_ to be aligned? And if it is - do all firmware makers play by
that (on x86 at least specifications often mean pretty little to firmware
people, apparently)?

> Should be somewhere mentioned what is legal physical address
> for RAM start? If it’s not PAGE_SIZE-aligned, then it seems we have no
> choice but to use ALIGNUP(..., PAGE_SIZE), which would mean losing part
> of the bank.

Correct - partial pages simply cannot be used (except in adhoc ways, which
likely isn't very desirable).

Jan

