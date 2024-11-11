Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A859C3BF0
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 11:30:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833490.1248649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tARgD-0000sr-1c; Mon, 11 Nov 2024 10:29:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833490.1248649; Mon, 11 Nov 2024 10:29:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tARgC-0000qm-VJ; Mon, 11 Nov 2024 10:29:56 +0000
Received: by outflank-mailman (input) for mailman id 833490;
 Mon, 11 Nov 2024 10:29:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/YTX=SG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tARgB-0000qg-D5
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 10:29:55 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e22a2918-a017-11ef-99a3-01e77a169b0f;
 Mon, 11 Nov 2024 11:29:51 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4315c1c7392so37841565e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 11 Nov 2024 02:29:51 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381eda03696sm12665718f8f.87.2024.11.11.02.29.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Nov 2024 02:29:50 -0800 (PST)
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
X-Inumbo-ID: e22a2918-a017-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzYiLCJoZWxvIjoibWFpbC13bTEteDMzNi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImUyMmEyOTE4LWEwMTctMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxMzIwOTkxLjI5MTAxNSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731320991; x=1731925791; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pgoMsRdbc7KWdOCT6+/Kw78cgpOaPo4acsg+NBH4R9I=;
        b=OE0ZIT62zHPabjLsRaqyK5nOH4ep+RGuHhSJ4+q7uXRFzy9XaqPeo0xpUSh2n27wSi
         5K4NfIJEvjc6C8MbEzpNRePgZR1yehcl+aLtY9hSr8AX4eE9xnnLAVIigetINaSy655p
         JEnbvib/j3bA5xqBdqK+GKar6bzZcKEO+I1cc3Fa0zBzmxNMLG78CQfT5wwDIUBI5D+/
         wyRFoLCmLMJV/4HtCy0zxXGpwCCh89D/gyrXQpLKvVyY3Gz3F9Mbqb6nEkMVpqpLXhtf
         oN2B9dUaVPXYojSi1wHpsvZiOIBlNr4QSewcqsLU9UsLP5TF8G9usCAYeVtXanaq3C3U
         WHBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731320991; x=1731925791;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pgoMsRdbc7KWdOCT6+/Kw78cgpOaPo4acsg+NBH4R9I=;
        b=qQevkfoh7VldH9Gv+ftcEuOCdraboiqGbyxL8HRDHaouEBhN4SVkt74BkrMROowUeX
         3vPEi78V2hbKrokza6CHY28Vg5dV7UjYRaXSG7WEH2otogYDrzr9YfFBWQTKzIrIXOPY
         c06lb74HDhzDHFTdF5CwF0q302vGNkbbrzlXnoBTl7V8zv2gjtvBTPDwJBVm2AKX6utz
         OehiAjWO8bcwFhSYhUm+KNehgJCVnJu0HndSgewbe17W7qsTfN1Tps4Dk3BPrfCmnVqp
         lmgGkhG6RnEsPqq4KCq6t6bVphSM/dwmF8U3i0cA5uvA5SizUo+ybm5tvlIFUvh3QpNt
         IgNA==
X-Forwarded-Encrypted: i=1; AJvYcCUmo5Wb0bDvqgEw7UqAbXljri5F+zwR+6KhAAma8s9h8rvnQ894wT7CyXKXDlsmM03xQWLGRmNq9+s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyUoTFyVtg/LiLd+lYwQT7nQhk1TXtkbHnz2++ZjAdx7688JcRp
	1+PZ9aHQeYOwydWtJKFoM/ZmXMAv55U2xH4BbO12k1a1dS7QbQ93NP09Lyqg/g==
X-Google-Smtp-Source: AGHT+IGXUIolPBafr6Sno6s0vf41gh0by72nm1ccrLB4PxVtXG/yyz0/UdbsxGZbTsCtOOCAUmFs6Q==
X-Received: by 2002:a05:600c:3b05:b0:431:537d:b3b4 with SMTP id 5b1f17b1804b1-432b7503540mr95769675e9.11.1731320990672;
        Mon, 11 Nov 2024 02:29:50 -0800 (PST)
Message-ID: <9eeb11a3-df72-4a77-9235-6a872b365ecd@suse.com>
Date: Mon, 11 Nov 2024 11:29:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] xen/riscv: introduce setup_mm()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1731069334.git.oleksii.kurochko@gmail.com>
 <2a9262165c71733792974f5e27795625013bc656.1731069334.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <2a9262165c71733792974f5e27795625013bc656.1731069334.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.11.2024 13:51, Oleksii Kurochko wrote:
> @@ -37,9 +42,9 @@ static inline void *maddr_to_virt(paddr_t ma)
>   */
>  static inline unsigned long virt_to_maddr(unsigned long va)
>  {
> -    if ((va >= DIRECTMAP_VIRT_START) &&
> +    if ((va >= directmap_virt_start) &&

Is this a valid / necessary change to make? Right now there looks to be
nothing immediately below the directmap, yet that would need guaranteeing
(e.g. by some BUILD_BIG_ON() or whatever else) if code builds upon that.

>          (va < (DIRECTMAP_VIRT_START + DIRECTMAP_SIZE)))
> -        return directmapoff_to_maddr(va - DIRECTMAP_VIRT_START);
> +        return directmapoff_to_maddr(va - directmap_virt_start);

FTAOD - no question about this part of the change.

> @@ -423,3 +429,140 @@ void * __init early_fdt_map(paddr_t fdt_paddr)
>  
>      return fdt_virt;
>  }
> +
> +vaddr_t __ro_after_init directmap_virt_start = DIRECTMAP_VIRT_START;
> +
> +struct page_info *__ro_after_init frametable_virt_start;

As for directmap_virt_start - perhaps better with initializer?

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
> +    if ( !frametable_virt_start )
> +        frametable_virt_start = frame_table - paddr_to_pfn(aligned_ps);

If you make this conditional, then you need an "else" (or something that's
effectively one) just like you have in setup_directmap_mappings(). Like
for the earlier assumption on ps being zero: Assumptions you make on how
a function is used want to at least be self-consistent. I.e. here either
you assume the function may be called more than once, or you don't.

> +static void __init setup_directmap_mappings(unsigned long base_mfn,
> +                                            unsigned long nr_mfns)
> +{
> +    static mfn_t __initdata directmap_mfn_start = INVALID_MFN_INITIALIZER;
> +
> +    unsigned long base_addr = mfn_to_maddr(_mfn(base_mfn));

Seeing this and ...

> +    unsigned long high_bits_mask = XEN_PT_LEVEL_MAP_MASK(HYP_PT_ROOT_LEVEL);
> +
> +    /* First call sets the directmap physical and virtual offset. */
> +    if ( mfn_eq(directmap_mfn_start, INVALID_MFN) )
> +    {
> +        directmap_mfn_start = _mfn(base_mfn);

... this (and more further down) - perhaps better to have the function take
mfn_t right away?

> +       /*
> +        * The base address may not be aligned to the second level
> +        * size in case of Sv39 (e.g. 1GB when using 4KB pages).
> +        * This would prevent superpage mappings for all the regions
> +        * because the virtual address and machine address should
> +        * both be suitably aligned.
> +        *
> +        * Prevent that by offsetting the start of the directmap virtual
> +        * address.
> +        */
> +        directmap_virt_start -=
> +            (base_addr & high_bits_mask) + (base_addr & ~high_bits_mask);

Isn't this the same as

        directmap_virt_start -= base_addr;

i.e. no different from what you had a few revisions back? I continue to
think that only the low bits matter for the offsetting.

> +    }
> +
> +    if ( base_mfn < mfn_x(directmap_mfn_start) )
> +        panic("can't add directmap mapping at %#lx below directmap start %#lx\n",
> +              base_mfn, mfn_x(directmap_mfn_start));
> +
> +    if ( map_pages_to_xen((vaddr_t)mfn_to_virt(base_mfn),
> +                          _mfn(base_mfn), nr_mfns,
> +                          PAGE_HYPERVISOR_RW) )
> +        panic("Directmap mappings for [%#"PRIpaddr", %#"PRIpaddr") failed\n",
> +              mfn_to_maddr(_mfn(base_mfn)),
> +              mfn_to_maddr(_mfn(base_mfn + nr_mfns)));

Maybe worth also logging the error code?

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
> +    for ( i = 0; i < banks->nr_banks; i++ )
> +    {
> +        const struct membank *bank = &banks->bank[i];
> +        paddr_t bank_start = ROUNDUP(bank->start, PAGE_SIZE);
> +        paddr_t bank_end = ROUNDDOWN(bank->start + bank->size, PAGE_SIZE);
> +        unsigned long bank_size = bank_end - bank_start;
> +
> +        ram_size += bank_size;

As before - you maintain ram_size here, ...

> +        ram_start = min(ram_start, bank_start);
> +        ram_end = max(ram_end, bank_end);
> +
> +        setup_directmap_mappings(PFN_DOWN(bank_start), PFN_DOWN(bank_size));
> +    }
> +
> +    setup_frametable_mappings(ram_start, ram_end);
> +    max_page = PFN_DOWN(ram_end);
> +}

... without ever using the value. Why?

Jan

