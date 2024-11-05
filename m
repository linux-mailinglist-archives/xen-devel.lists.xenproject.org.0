Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 233C29BD043
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2024 16:21:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830399.1245388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8LMm-0006mD-IF; Tue, 05 Nov 2024 15:21:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830399.1245388; Tue, 05 Nov 2024 15:21:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8LMm-0006jH-FC; Tue, 05 Nov 2024 15:21:12 +0000
Received: by outflank-mailman (input) for mailman id 830399;
 Tue, 05 Nov 2024 15:21:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NqUC=SA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t8LMk-0006jB-KI
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2024 15:21:10 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 90b180d9-9b89-11ef-99a3-01e77a169b0f;
 Tue, 05 Nov 2024 16:21:01 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-37d4d1b48f3so3225369f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 05 Nov 2024 07:21:01 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c116a781sm16580401f8f.96.2024.11.05.07.21.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Nov 2024 07:21:00 -0800 (PST)
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
X-Inumbo-ID: 90b180d9-9b89-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MzEiLCJoZWxvIjoibWFpbC13cjEteDQzMS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjkwYjE4MGQ5LTliODktMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwODIwMDYxLjQzNDg5Mywic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730820061; x=1731424861; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=x24M7yawIwD4HEFtjDX5aNZrFyLWkiLDWlhzZa+mDII=;
        b=d79MMVVs0QprwDAX+H+4fexf+ZL1ZiXPk37hYKNErRzsNjueiv8OXmlFqoAI6zs9b+
         /cCtE3PmOwkxsDZ8KffIIC0wXLI9G4r+ooqn/aEdtc9qNqJqN5GzXUWRASQoOQRzaz1g
         QmEU3GIeZ79M9wX2HcOUjYeDKsq+PhYAnSV83HhPqwfeuTZsSQlXyQLuYn2gprwApDAr
         TtSRS4hX8gslfCbvk7L5iiAbF/w3YY0P384bAyUQdlUTG2dbttL2y4ykrggQ2qI/UWwv
         oApVXHA4KnWyYjDUt9p0N+TKI7aznWtXOOCx3ewdb3PlvhDInT6EgW7S+cgXl9f04Op/
         0KiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730820061; x=1731424861;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x24M7yawIwD4HEFtjDX5aNZrFyLWkiLDWlhzZa+mDII=;
        b=KSeZhbUyf+RZEdXszSHa0ogtLBZISbUlMiFfmpAszqxGq9nrwENKhaqHHFRRqS6n8n
         l+/1FJi+ansUfC+ZA/K/aMS0btqaocbPPMoY+fS48noxPDunmhtz6fvWFYArWRyx/YU4
         QfdBayOfU+xNHph7Vz3BOvc7qk2PEbOKQFGZ+nxiUDLLBjd+25YLnJZ3lO5wZpDYFQqT
         A7pc+F8EDOg622EhSjJKiRBP+n+rlnnN/L9Rg6h7mUdhwseVNYtS5dVhFSI8pabt54iM
         TH87E3yF/zJslVDeozvvXXh3Bu/toGVbUND/97ZS5HdoiXPfYaBjHW7H3uQxVzsV6w0f
         0nLw==
X-Forwarded-Encrypted: i=1; AJvYcCWEShKhqYmay3dPmXzIEju5r/BABbIshrLkL2pd5pvcArtQ8PER59f7+ck9P2nbRmSEAt1IclsUFe8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxyP9e0lCAWN7cxE7BijLRRuUnUmAL02ykIfjMdKDA6p6+B9k7t
	NsUuG7GtESPEAtLD7qNd7BpKO4sQya38YNZ6+B4EmnWz0FCp17oZNhsQBhRf+g==
X-Google-Smtp-Source: AGHT+IFOZEQ4VGI8MYYaUHnQ8Qq3Lvj8gHiOhx6qcf8GKxd177NXkOFJy8e4aiFS+PB/AsXsDEjP3g==
X-Received: by 2002:adf:e686:0:b0:37d:3964:e0f1 with SMTP id ffacd0b85a97d-381b70578b3mr18701421f8f.4.1730820060638;
        Tue, 05 Nov 2024 07:21:00 -0800 (PST)
Message-ID: <9e22b5ad-634f-48b7-b64c-fc44319a1d4d@suse.com>
Date: Tue, 5 Nov 2024 16:20:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] xen/riscv: introduce setup_mm()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1730465154.git.oleksii.kurochko@gmail.com>
 <0f7cd809e848607408ff4615e55b847f5a524559.1730465154.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <0f7cd809e848607408ff4615e55b847f5a524559.1730465154.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.11.2024 14:16, Oleksii Kurochko wrote:> @@ -423,3 +429,138 @@ void * __init early_fdt_map(paddr_t fdt_paddr)
>  
>      return fdt_virt;
>  }
> +
> +vaddr_t __ro_after_init directmap_virt_start = DIRECTMAP_VIRT_START;
> +
> +#ifndef CONFIG_RISCV_32
> +
> +/* Map a frame table to cover physical addresses ps through pe */
> +static void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
> +{
> +    paddr_t aligned_ps = ROUNDUP(ps, PAGE_SIZE);
> +    paddr_t aligned_pe = ROUNDDOWN(pe, PAGE_SIZE);
> +    unsigned long nr_mfns = PFN_DOWN(aligned_pe - aligned_ps);
> +    unsigned long frametable_size = nr_mfns * sizeof(*frame_table);
> +    mfn_t base_mfn;
> +
> +    if ( frametable_size > FRAMETABLE_SIZE )
> +        panic("The frametable cannot cover [%#"PRIpaddr", %#"PRIpaddr")\n",
> +              ps, pe);
> +
> +    /*
> +     * align base_mfn and frametable_size to MB(2) to have superpage mapping
> +     * in map_pages_to_xen()
> +     */
> +    frametable_size = ROUNDUP(frametable_size, MB(2));
> +    base_mfn = alloc_boot_pages(frametable_size >> PAGE_SHIFT, PFN_DOWN(MB(2)));
> +
> +    if ( map_pages_to_xen(FRAMETABLE_VIRT_START, base_mfn,
> +                          PFN_DOWN(frametable_size),
> +                          PAGE_HYPERVISOR_RW) )
> +        panic("frametable mappings failed: %#lx -> %#lx\n",
> +              FRAMETABLE_VIRT_START, mfn_x(base_mfn));
> +
> +    memset(&frame_table[0], -1, frametable_size);
> +    memset(&frame_table[PFN_DOWN(aligned_ps)],
> +           0, nr_mfns * sizeof(*frame_table));

Interesting - now you write out a huge amount of -1s, just to then overwrite
most of them with zeroes. I'm not going to insist that you change this yet
another time, but the performance hit from this is going to bite you/us as
soon as Xen is run on bigger-memory systems.

Plus, unless I'm mistaken, the function continues to rely on ps == 0 as
input. Just that the dependency is now better hidden. Specifically if you
calculate nr_mfns from the difference, and then use that for allocation,
then you need to offset the start of the mapping you create accordingly. At
which point you may need to apply extra care to cover the case where
sizeof(*frame_table) is not a power of two, and hence e.g. the first valid
page might have a struct instance straddling a page boundary.

> +/* Map the region in the directmap area. */
> +static void __init setup_directmap_mappings(unsigned long base_mfn,
> +                                            unsigned long nr_mfns)
> +{
> +    static mfn_t __initdata directmap_mfn_start = INVALID_MFN_INITIALIZER;
> +
> +    unsigned long base_addr = mfn_to_maddr(_mfn(base_mfn));
> +    unsigned long high_bits_mask = XEN_PT_LEVEL_MAP_MASK(HYP_PT_ROOT_LEVEL);
> +
> +    /* First call sets the directmap physical and virtual offset. */
> +    if ( mfn_eq(directmap_mfn_start, INVALID_MFN) )
> +    {
> +        directmap_mfn_start = _mfn(base_mfn);
> +
> +        directmap_virt_start -= (base_addr & high_bits_mask);
> +    }
> +
> +    if ( base_mfn < mfn_x(directmap_mfn_start) )
> +        panic("cannot add directmap mapping at %#lx below heap start %#lx\n",
> +              base_mfn, mfn_x(directmap_mfn_start));

Nit: Leftover use of "heap"?

> +    /*
> +     * The base address may not be aligned to the second level
> +     * size in case of Sv39 (e.g. 1GB when using 4KB pages).
> +     * This would prevent superpage mappings for all the regions
> +     * because the virtual address and machine address should
> +     * both be suitably aligned.
> +     *
> +     * Prevent that by offsetting the start of the directmap virtual
> +     * address.
> +     */
> +    if ( map_pages_to_xen(DIRECTMAP_VIRT_START + (base_addr & ~high_bits_mask),

I'm afraid this is correct only for the first invocation of the function.
For any further invocation you'd likely (attempt to) replace previously
established mappings. I think that here you need to use directmap_virt_start
instead.

> +/*
> + * Setup memory management
> + *
> + * RISC-V 64 has a large virtual address space (the minimum supported
> + * MMU mode is Sv39, which provides GBs of VA space).
> + *
> + * The directmap_virt_start is shifted lower in the VA space to
> + * (DIRECTMAP_VIRT_START - masked_low_bits_of_ram_start_address) to avoid
> + * wasting a large portion of the directmap space, this also allows for simple
> + * VA <-> PA translations. Also aligns DIRECTMAP_VIRT_START to a GB boundary
> + * (for Sv39; for other MMU mode boundaries will be bigger ) by masking the
> + * higher bits of the RAM start address to enable the use of superpages in
> + * map_pages_to_xen().
> + *
> + * The frametable is mapped starting from physical address 0, minimizing
> + * wasted VA space and simplifying page_to_mfn() and mfn_to_page()
> + * translations.
> + */
> +void __init setup_mm(void)
> +{
> +    const struct membanks *banks = bootinfo_get_mem();
> +    paddr_t ram_start = INVALID_PADDR;
> +    paddr_t ram_end = 0;
> +    paddr_t ram_size = 0;
> +    unsigned int i;
> +
> +    /*
> +     * We need some memory to allocate the page-tables used for the directmap
> +     * mappings. But some regions may contain memory already allocated
> +     * for other uses (e.g. modules, reserved-memory...).
> +     *
> +     * For simplicity, add all the free regions in the boot allocator.
> +     */
> +    populate_boot_allocator();
> +
> +    total_pages = 0;

Nit: Is this actually necessary?

> +    for ( i = 0; i < banks->nr_banks; i++ )
> +    {
> +        const struct membank *bank = &banks->bank[i];
> +        paddr_t bank_start = ROUNDUP(bank->start, PAGE_SIZE);
> +        paddr_t bank_end = ROUNDDOWN(bank->start + bank->size, PAGE_SIZE);
> +        unsigned long bank_size = bank_end - bank_start;
> +
> +        ram_size += bank_size;
> +        ram_start = min(ram_start, bank_start);
> +        ram_end = max(ram_end, bank_end);
> +
> +        setup_directmap_mappings(PFN_DOWN(bank_start), PFN_DOWN(bank_size));
> +    }

You maintain ram_start in the loop, just to then ...

> +    total_pages = PFN_DOWN(ram_size);
> +
> +    setup_frametable_mappings(0, ram_end);
> +    max_page = PFN_DOWN(ram_end);
> +}

... not use it at all - why?

Jan

