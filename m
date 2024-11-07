Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9E29C00FC
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 10:19:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831540.1246854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8yfl-0003B5-VB; Thu, 07 Nov 2024 09:19:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831540.1246854; Thu, 07 Nov 2024 09:19:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8yfl-00038r-S5; Thu, 07 Nov 2024 09:19:25 +0000
Received: by outflank-mailman (input) for mailman id 831540;
 Thu, 07 Nov 2024 09:19:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aElt=SC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t8yfj-00038l-V9
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 09:19:23 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ec3d822-9ce9-11ef-a0c6-8be0dac302b0;
 Thu, 07 Nov 2024 10:19:20 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43193678216so6633235e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 Nov 2024 01:19:20 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381eda137cesm1130698f8f.108.2024.11.07.01.19.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Nov 2024 01:19:19 -0800 (PST)
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
X-Inumbo-ID: 5ec3d822-9ce9-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMmQiLCJoZWxvIjoibWFpbC13bTEteDMyZC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjVlYzNkODIyLTljZTktMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwOTcxMTYwLjQ4ODQxLCJzZW5kZXIiOiJqYmV1bGljaEBzdXNlLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730971160; x=1731575960; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8t8No/UVl29MEUMNuXPjvD4eBIQShE/o7jicsd79qPI=;
        b=D4REkJGAMGlYOUG4sbtayrGeem6/V/LCtbhzKdHOy0qY6qUkdiyJqABEiSVUcViRov
         7nCmABlalzTd7ns5F3UamCjdMIqRNPJK5KgQP4uz/8mv5wkv8Wvcq7AR0Iq+H9PHI/gc
         1mwIvPK+cVj2eyMd7HPw/HjvdkPIQ4jdcUaB5xvSBlCD/27OPCmZNUBovZwyq6I0F4aM
         xkREuZYDN6mMOCdVHOT+5m0AsZ2xw3XBM9eKmwolKnsr8OF6h21yFOFvp7r3FNGB9v02
         I5DBmIdwFQSGNkcQc3TJ+rn3/zI8cONZ2cx7M8pwoFYw4FwewX18KHane+S3NcbY6lYc
         Km+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730971160; x=1731575960;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8t8No/UVl29MEUMNuXPjvD4eBIQShE/o7jicsd79qPI=;
        b=eecs4JTbfdMjy5mdZVWuhFPZrZmXwguubwal6032qFnAhg8drYLy9Eojlyy8dS2GE/
         nJDNhnzeGx4whgrAgi6Jaj9vUBXqsyXmoHyw5N9QTFtEbJi8uq6MERjiF4637Q5w3W7F
         B43CAS+ZxRQ5NbQLvFbUaHnJc/q1R1//Y92Bn7wCJ1seDO71TeyJRXS7PvL9b6RPgjAh
         yUMDeK81OV5osm/q3T49WUozksDhG11wKpggm2FQRrsZvg/I0e2Z9QkOllDQwZH92i2U
         2/tIH3QbpWKI3diPnMk4zmgYjLmRW95XZ5VdSMp2lDeKfgVe5Ckt4QVBlRpknZc0Uh0X
         UZPg==
X-Forwarded-Encrypted: i=1; AJvYcCXNc54uzasFjx1c6jJ58SOwCXIWnAVDgHKFp/OT8+SnLgrrTPEXq3thyn/V3w/LgXH7RfOcZ2eIrcM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz7cXLB6u147GmpC3/zEyahvT6DKBYYqd3bRDcoig0BQg+hxqfx
	XtKksdbrUOu5vSUcgJmtjXH+ChwHaDYQDmsSOI1u2DGecthCUFXM4PC4LAGpOQ==
X-Google-Smtp-Source: AGHT+IFivhK52z6qr6NBni8n/5Tg3I6D7y3agLASvSpWI6OIVMQe+1U+pjm4D2zlbjbkn4rMjVC+bg==
X-Received: by 2002:a5d:6943:0:b0:37d:4e74:68a with SMTP id ffacd0b85a97d-380611e0f5bmr27798608f8f.46.1730971160022;
        Thu, 07 Nov 2024 01:19:20 -0800 (PST)
Message-ID: <15f8c4d9-bd90-4b1e-9cea-53e62d601a58@suse.com>
Date: Thu, 7 Nov 2024 10:19:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] xen/riscv: introduce setup_mm()
To: oleksii.kurochko@gmail.com
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1730465154.git.oleksii.kurochko@gmail.com>
 <0f7cd809e848607408ff4615e55b847f5a524559.1730465154.git.oleksii.kurochko@gmail.com>
 <9e22b5ad-634f-48b7-b64c-fc44319a1d4d@suse.com>
 <8380261d24388e453e74514dad8216c97e3bebee.camel@gmail.com>
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
In-Reply-To: <8380261d24388e453e74514dad8216c97e3bebee.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.11.2024 13:44, oleksii.kurochko@gmail.com wrote:
> On Tue, 2024-11-05 at 16:20 +0100, Jan Beulich wrote:
>> On 01.11.2024 14:16, Oleksii Kurochko wrote:> @@ -423,3 +429,138 @@
>> void * __init early_fdt_map(paddr_t fdt_paddr)
>>>  
>>>      return fdt_virt;
>>>  }
>>> +
>>> +vaddr_t __ro_after_init directmap_virt_start =
>>> DIRECTMAP_VIRT_START;
>>> +
>>> +#ifndef CONFIG_RISCV_32
>>> +
>>> +/* Map a frame table to cover physical addresses ps through pe */
>>> +static void __init setup_frametable_mappings(paddr_t ps, paddr_t
>>> pe)
>>> +{
>>> +    paddr_t aligned_ps = ROUNDUP(ps, PAGE_SIZE);
>>> +    paddr_t aligned_pe = ROUNDDOWN(pe, PAGE_SIZE);
>>> +    unsigned long nr_mfns = PFN_DOWN(aligned_pe - aligned_ps);
>>> +    unsigned long frametable_size = nr_mfns *
>>> sizeof(*frame_table);
>>> +    mfn_t base_mfn;
>>> +
>>> +    if ( frametable_size > FRAMETABLE_SIZE )
>>> +        panic("The frametable cannot cover [%#"PRIpaddr",
>>> %#"PRIpaddr")\n",
>>> +              ps, pe);
>>> +
>>> +    /*
>>> +     * align base_mfn and frametable_size to MB(2) to have
>>> superpage mapping
>>> +     * in map_pages_to_xen()
>>> +     */
>>> +    frametable_size = ROUNDUP(frametable_size, MB(2));
>>> +    base_mfn = alloc_boot_pages(frametable_size >> PAGE_SHIFT,
>>> PFN_DOWN(MB(2)));
>>> +
>>> +    if ( map_pages_to_xen(FRAMETABLE_VIRT_START, base_mfn,
>>> +                          PFN_DOWN(frametable_size),
>>> +                          PAGE_HYPERVISOR_RW) )
>>> +        panic("frametable mappings failed: %#lx -> %#lx\n",
>>> +              FRAMETABLE_VIRT_START, mfn_x(base_mfn));
>>> +
>>> +    memset(&frame_table[0], -1, frametable_size);
>>> +    memset(&frame_table[PFN_DOWN(aligned_ps)],
>>> +           0, nr_mfns * sizeof(*frame_table));
>>
>> Interesting - now you write out a huge amount of -1s, just to then
>> overwrite
>> most of them with zeroes. I'm not going to insist that you change
>> this yet
>> another time, but the performance hit from this is going to bite
>> you/us as
>> soon as Xen is run on bigger-memory systems.
> I agree that validating or invalidating frames in a single pass would
> be preferable to nearly two passes. I’m considering whether there’s a
> way to ensure that frame_table is set to -1 at compile time.

How would that work, if the entire frame table is allocated dynamically?

> It seems
> the best approach (and only one?) might be to initialize frame_table in
> one pass as follows:
> 1) [0, aligned_ps) = -1
> 2) [aligned_ps, nr_mfns * sizeof(*frame_table)) = 0
> 3) [nr_mfns * sizeof(*frame_table), frame_table_size) = -1
> Does this approach seem optimal?

That's what I would have expected, yes.

>> Plus, unless I'm mistaken, the function continues to rely on ps == 0
>> as
>> input. Just that the dependency is now better hidden. Specifically if
>> you
>> calculate nr_mfns from the difference, and then use that for
>> allocation,
>> then you need to offset the start of the mapping you create
>> accordingly.
> I'm not quite understanding why the method of calculating nr_mfns
> affects how the frame_table is mapped. Isn’t it only necessary to
> calculate the correct size of the frame_table that needs to be
> allocated?

Assume there's 4G of memory actually starting at 16G. Afaict you'll
allocate a frame table for those 4G, but you'll map it right at
FRAMETABLE_VIRT_START. Hence it'll cover the first 4G of physical
addresses, but _none_ of the actual memory you've got.

> I assume by the offset you mean something similar to what was done for
> directmap mapping?

Kind of, yes.

>>  At
>> which point you may need to apply extra care to cover the case where
>> sizeof(*frame_table) is not a power of two, and hence e.g. the first
>> valid
>> page might have a struct instance straddling a page boundary.
> The first valid page is aligned_ps ( which is aligned on a page
> boundary ) so assuming that sizeof(*frame_table) < PAGE_SIZE we can't
> straddle a page boundary, can we?

But sizeof(*frame_table) < PAGE_SIZE means nothing as to the alignment
of an individual struct instance in memory. Iirc sizeof(*frame_table)
is 48 for RISC-V, so the common alignment across struct instances isn't
going to be better than 8, and there _will_ be instances straddling
page boundaries.

>>> +    /*
>>> +     * The base address may not be aligned to the second level
>>> +     * size in case of Sv39 (e.g. 1GB when using 4KB pages).
>>> +     * This would prevent superpage mappings for all the regions
>>> +     * because the virtual address and machine address should
>>> +     * both be suitably aligned.
>>> +     *
>>> +     * Prevent that by offsetting the start of the directmap
>>> virtual
>>> +     * address.
>>> +     */
>>> +    if ( map_pages_to_xen(DIRECTMAP_VIRT_START + (base_addr &
>>> ~high_bits_mask),
>>
>> I'm afraid this is correct only for the first invocation of the
>> function.
>> For any further invocation you'd likely (attempt to) replace
>> previously
>> established mappings. I think that here you need to use
>> directmap_virt_start
>> instead.
> Banks are sorted by bank start address ( common/device-
> tree/bootfdt.c:623 ):
>        /*
>         * On Arm64 setup_directmap_mappings() expects to be called with
>    the lowest
>         * bank in memory first. There is no requirement that the DT will
>    provide
>         * the banks sorted in ascending order. So sort them through.
>         */
>        sort(mem->bank, mem->nr_banks, sizeof(struct membank),
>             cmp_memory_node, swap_memory_node);
> ( btw, comment is needed to be updated ... )
> 
> Thereby no replacement should happen if I don't miss something.

I don't see how banks being sorted matters here. On the 2nd invocation
you'll start mapping pages again from DIRECTMAP_VIRT_START plus an at
most 1G (for SV39) offset. If both banks have 2G, the resulting mappings
will necessarily overlap, if I'm not mistaken.

>>> +    for ( i = 0; i < banks->nr_banks; i++ )
>>> +    {
>>> +        const struct membank *bank = &banks->bank[i];
>>> +        paddr_t bank_start = ROUNDUP(bank->start, PAGE_SIZE);
>>> +        paddr_t bank_end = ROUNDDOWN(bank->start + bank->size,
>>> PAGE_SIZE);
>>> +        unsigned long bank_size = bank_end - bank_start;
>>> +
>>> +        ram_size += bank_size;
>>> +        ram_start = min(ram_start, bank_start);
>>> +        ram_end = max(ram_end, bank_end);
>>> +
>>> +        setup_directmap_mappings(PFN_DOWN(bank_start),
>>> PFN_DOWN(bank_size));
>>> +    }
>>
>> You maintain ram_start in the loop, just to then ...
>>
>>> +    total_pages = PFN_DOWN(ram_size);
>>> +
>>> +    setup_frametable_mappings(0, ram_end);
>>> +    max_page = PFN_DOWN(ram_end);
>>> +}
>>
>> ... not use it at all - why?
> ram_start was needed for the case when setup_frametable_mappings() used
> it as the first argument. Now it isn't true anymore so should be
> dropped.

As per above it may actually be necessary (or at least desirable) to pass
it into there again, if nothing else then to know how much of the initial
part of the (mapped) frame table to invalidate.

Jan

