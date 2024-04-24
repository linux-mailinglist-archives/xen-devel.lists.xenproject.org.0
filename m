Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5157C8B0D08
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 16:47:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711497.1111502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzdtS-0002Cq-Jm; Wed, 24 Apr 2024 14:46:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711497.1111502; Wed, 24 Apr 2024 14:46:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzdtS-0002BJ-Gt; Wed, 24 Apr 2024 14:46:42 +0000
Received: by outflank-mailman (input) for mailman id 711497;
 Wed, 24 Apr 2024 14:46:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rzdtQ-0002BD-PC
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 14:46:40 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 746d3b37-0249-11ef-909a-e314d9c70b13;
 Wed, 24 Apr 2024 16:46:38 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-345b857d7adso5553767f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Apr 2024 07:46:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a12-20020adfed0c000000b0034635bd6ba5sm17331996wro.92.2024.04.24.07.46.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Apr 2024 07:46:37 -0700 (PDT)
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
X-Inumbo-ID: 746d3b37-0249-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713969998; x=1714574798; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bz/YhIzGhuFRShO/LmesSR0Y6BDwd1h8Ja1h9kYKipQ=;
        b=Ml65lNCoxrhYEwOyRdm5qai90cNkrKf/X1CGiWokf+mE0BDY6VWxcB6FcjrXcSSls6
         cshKLZiq7etl/Asg+7DkfvhOLs7e7UzDBZsl1KhOXUqEGfJAPQkmSRnabtMsk89u0J0b
         SlGR8ouZBT/Hqc13L/k9gE19zvQYqYQMHC53h3fEle14Qun+anacnSH2yrH4NydkGW9R
         NT0hMWiNy/H0rPyxar9YF+EfmB1qjLZfbV9ZNjn3B9r356/XjaDBs8toxLGYBkzGxgR8
         3huFxj05L96Wx0zFfIi+wRAjo/2gDk0oKxEovTrfkobbJ39T9R9lIyG+8ToaLz4kfkD7
         bp2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713969998; x=1714574798;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bz/YhIzGhuFRShO/LmesSR0Y6BDwd1h8Ja1h9kYKipQ=;
        b=c1f8DZq8AQ1h55ttDk7Vr8PcB2BP1YqvXNMxm9c/gdwoqNYnpiMudsCNqgXh53bi7R
         7r3czP6xlMFE1aqgXrJsnW5j46rDpa7j5CEiHtcWbCwJOXSwB3SXNd8NlC1kUM4N86Oz
         agH4G/6MyXExgmFHGIpx6Fp+zYkxxdYmawCgIqmWj51Ap3Byvgjm2EoL/FQ28WFG3XDf
         TVOclueoVH3Qy9VxSKBmKe3qhrXa07ySYhuC8hXL2khCXNE0mUpEAqLlJWC4DJdUG0Vb
         0kfLKCU3zDpGFX+5RsEnOfTsRYWcQ5qdQcyk+IcdWn8syvrcNsV71Mj/MEMFmMSqgwKC
         wMuw==
X-Forwarded-Encrypted: i=1; AJvYcCXIh5SRrw7vwA5vsHYWxWcDK3LexMqZZwkzo4WUc39P4apm/kmtbpC/oC333rAFJ/fDEzpPUQ8oaqNUSEspVXsrKL6Ky2Wt9OM2Qz3z4oE=
X-Gm-Message-State: AOJu0YwIp29aCa4HXZW90u+T6jWTCzLtGfEJrzy0ws0V+vmwjRy+5LFF
	7C7hL4Leru9a4bjCzT1T9aiESXbIxXFBC/Tf4Lw6AQ+XiIbJhMr7RSw5RhMj/KKX8YZ4S4Z3+Sg
	=
X-Google-Smtp-Source: AGHT+IFZVCaLgRtPZQUjV3dvx3F5LXmG/3po5Xx/k2YZosyNuczE8vBOk0jg819LYOKang6+ER6mAA==
X-Received: by 2002:adf:e80e:0:b0:343:a368:f792 with SMTP id o14-20020adfe80e000000b00343a368f792mr1974871wrm.52.1713969997569;
        Wed, 24 Apr 2024 07:46:37 -0700 (PDT)
Message-ID: <742d3499-208a-4650-bc95-fa59e334bd25@suse.com>
Date: Wed, 24 Apr 2024 16:46:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] xen/ppc: mm-radix: Allocate all paging structures
 at runtime
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: tpearson@raptorengineering.com, xen-devel@lists.xenproject.org
References: <cover.1712893887.git.sanastasio@raptorengineering.com>
 <d7263aaef3bd59255a84bd78c4ea4c09c78a5902.1712893887.git.sanastasio@raptorengineering.com>
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
In-Reply-To: <d7263aaef3bd59255a84bd78c4ea4c09c78a5902.1712893887.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.04.2024 05:55, Shawn Anastasio wrote:
> In the initial mm-radix implementation, the in-memory partition and
> process tables required to configure the MMU, as well as the page tables
> themselves were all allocated statically since the boot allocator was
> not yet available.
> 
> Now that it is, allocate these structures at runtime and bump the size
> of the Process Table to its maximum supported value (on POWER9).
> 
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> ---
> Changes in v4:
>   - use mfn_add in initial_page_alloc()
>   - zero pages returned by initial_page_alloc()
> 
>  xen/arch/ppc/mm-radix.c | 231 +++++++++++++++++++++-------------------
>  1 file changed, 123 insertions(+), 108 deletions(-)
> 
> diff --git a/xen/arch/ppc/mm-radix.c b/xen/arch/ppc/mm-radix.c
> index ab5a10695c..8f4bfa87c0 100644
> --- a/xen/arch/ppc/mm-radix.c
> +++ b/xen/arch/ppc/mm-radix.c
> @@ -21,69 +21,105 @@ void enable_mmu(void);
>  #define radix_dprintk(...)
>  #endif
> 
> -#define INITIAL_LVL1_PD_COUNT      1
> -#define INITIAL_LVL2_LVL3_PD_COUNT 2
> -#define INITIAL_LVL4_PT_COUNT      256
> -
> -static size_t __initdata initial_lvl1_pd_pool_used;
> -static struct lvl1_pd initial_lvl1_pd_pool[INITIAL_LVL1_PD_COUNT];
> -
> -static size_t __initdata initial_lvl2_lvl3_pd_pool_used;
> -static struct lvl2_pd initial_lvl2_lvl3_pd_pool[INITIAL_LVL2_LVL3_PD_COUNT];
> -
> -static size_t __initdata initial_lvl4_pt_pool_used;
> -static struct lvl4_pt initial_lvl4_pt_pool[INITIAL_LVL4_PT_COUNT];
> -
> -/* Only reserve minimum Partition and Process tables  */
>  #define PATB_SIZE_LOG2 16 /* Only supported partition table size on POWER9 */
>  #define PATB_SIZE      (1UL << PATB_SIZE_LOG2)
> -#define PRTB_SIZE_LOG2 12
> +#define PRTB_SIZE_LOG2 24 /* Maximum process table size on POWER9 */
>  #define PRTB_SIZE      (1UL << PRTB_SIZE_LOG2)
> 
> -static struct patb_entry
> -    __aligned(PATB_SIZE) initial_patb[PATB_SIZE / sizeof(struct patb_entry)];
> +static struct patb_entry *initial_patb;
> +static struct prtb_entry *initial_prtb;
> 
> -static struct prtb_entry
> -    __aligned(PRTB_SIZE) initial_prtb[PRTB_SIZE / sizeof(struct prtb_entry)];
> +static mfn_t __initdata min_alloc_mfn = {-1};
> +static mfn_t __initdata max_alloc_mfn = {0};
> 
> -static __init struct lvl1_pd *lvl1_pd_pool_alloc(void)
> +/*
> + * A thin wrapper for alloc_boot_pages that keeps track of the maximum and
> + * minimum mfns that have been allocated. This information is used by
> + * setup_initial_mapping to include the allocated pages in the initial
> + * page mapping.

Plus everything in between. Together with the further comment below I'm
afraid I still think that the constraints (and the justification for them
being tolerable at least for the time being) aren't made sufficiently
clear (perhaps in another code comment next to the respective two
variables' definitions).

> + * Additionally, allocated pages are zeroed before return.
> + */
> +static mfn_t __init initial_page_alloc(unsigned long nr_pfns,
> +                                       unsigned long pfn_align)
>  {
> -    if ( initial_lvl1_pd_pool_used >= INITIAL_LVL1_PD_COUNT )
> -    {
> -        early_printk("Ran out of space for LVL1 PD!\n");
> -        die();
> -    }
> +    mfn_t mfn_first, mfn_last;
> 
> -    return &initial_lvl1_pd_pool[initial_lvl1_pd_pool_used++];
> -}
> +    mfn_first = alloc_boot_pages(nr_pfns, pfn_align);
> +    mfn_last = mfn_add(mfn_first, nr_pfns - 1);
> 
> -static __init struct lvl2_pd *lvl2_pd_pool_alloc(void)
> -{
> -    if ( initial_lvl2_lvl3_pd_pool_used >= INITIAL_LVL2_LVL3_PD_COUNT )
> -    {
> -        early_printk("Ran out of space for LVL2/3 PD!\n");
> -        die();
> -    }
> +    min_alloc_mfn = _mfn(min(mfn_x(min_alloc_mfn), mfn_x(mfn_first)));
> +    max_alloc_mfn = _mfn(max(mfn_x(max_alloc_mfn), mfn_x(mfn_last)));
> 
> -    return &initial_lvl2_lvl3_pd_pool[initial_lvl2_lvl3_pd_pool_used++];
> +    memset(__va(mfn_to_maddr(mfn_first)), 0, nr_pfns << PAGE_SHIFT);
> +
> +    return mfn_first;
>  }
> 
> -static __init struct lvl3_pd *lvl3_pd_pool_alloc(void)
> +static __init void *initial_pd_pt_alloc(void)
>  {
> -    BUILD_BUG_ON(sizeof(struct lvl3_pd) != sizeof(struct lvl2_pd));
> +    BUILD_BUG_ON(sizeof(struct lvl1_pd) > PAGE_SIZE);
> +    BUILD_BUG_ON(sizeof(struct lvl2_pd) > PAGE_SIZE);
> +    BUILD_BUG_ON(sizeof(struct lvl3_pd) > PAGE_SIZE);
> +    BUILD_BUG_ON(sizeof(struct lvl4_pt) > PAGE_SIZE);
> 
> -    return (struct lvl3_pd *) lvl2_pd_pool_alloc();
> +    return __va(mfn_to_maddr(initial_page_alloc(1, 1)));
>  }
> 
> -static __init struct lvl4_pt *lvl4_pt_pool_alloc(void)
> +static void map_page_initial(struct lvl1_pd *lvl1, vaddr_t virt, paddr_t phys,
> +                             unsigned long flags)
>  {
> -    if ( initial_lvl4_pt_pool_used >= INITIAL_LVL4_PT_COUNT )
> +    struct lvl2_pd *lvl2;
> +    struct lvl3_pd *lvl3;
> +    struct lvl4_pt *lvl4;
> +    pde_t *pde;
> +    pte_t *pte;
> +
> +    /* Allocate LVL 2 PD if necessary */
> +    pde = pt_entry(lvl1, virt);
> +    if ( !pde_is_valid(*pde) )
>      {
> -        early_printk("Ran out of space for LVL4 PT!\n");
> -        die();
> +        lvl2 = initial_pd_pt_alloc();
> +        *pde = paddr_to_pde(__pa(lvl2), PDE_VALID,
> +                            XEN_PT_ENTRIES_LOG2_LVL_2);
> +    }
> +    else
> +        lvl2 = __va(pde_to_paddr(*pde));
> +
> +    /* Allocate LVL 3 PD if necessary */
> +    pde = pt_entry(lvl2, virt);
> +    if ( !pde_is_valid(*pde) )
> +    {
> +        lvl3 = initial_pd_pt_alloc();
> +        *pde = paddr_to_pde(__pa(lvl3), PDE_VALID,
> +                            XEN_PT_ENTRIES_LOG2_LVL_3);
> +    }
> +    else
> +        lvl3 = __va(pde_to_paddr(*pde));
> +
> +    /* Allocate LVL 4 PT if necessary */
> +    pde = pt_entry(lvl3, virt);
> +    if ( !pde_is_valid(*pde) )
> +    {
> +        lvl4 = initial_pd_pt_alloc();
> +        *pde = paddr_to_pde(__pa(lvl4), PDE_VALID,
> +                            XEN_PT_ENTRIES_LOG2_LVL_4);
>      }
> +    else
> +        lvl4 = __va(pde_to_paddr(*pde));
> 
> -    return &initial_lvl4_pt_pool[initial_lvl4_pt_pool_used++];
> +    /* Finally, create PTE in LVL 4 PT */
> +    pte = pt_entry(lvl4, virt);
> +    if ( !pte_is_valid(*pte) )
> +    {
> +        radix_dprintk("%016lx being mapped to %016lx\n", phys, virt);
> +        *pte = paddr_to_pte(phys, flags);
> +    }
> +    else
> +    {
> +        early_printk("BUG: Tried to create PTE for already-mapped page!");
> +        die();
> +    }
>  }
> 
>  static void __init setup_initial_mapping(struct lvl1_pd *lvl1,
> @@ -92,6 +128,7 @@ static void __init setup_initial_mapping(struct lvl1_pd *lvl1,
>                                           paddr_t phys_base)
>  {
>      uint64_t page_addr;
> +    mfn_t previous_max_alloc_mfn;
> 
>      if ( map_start & ~PAGE_MASK )
>      {
> @@ -105,81 +142,47 @@ static void __init setup_initial_mapping(struct lvl1_pd *lvl1,
>          die();
>      }
> 
> +    /* Identity map Xen itself */
>      for ( page_addr = map_start; page_addr < map_end; page_addr += PAGE_SIZE )
>      {
> -        struct lvl2_pd *lvl2;
> -        struct lvl3_pd *lvl3;
> -        struct lvl4_pt *lvl4;
> -        pde_t *pde;
> -        pte_t *pte;
> -
> -        /* Allocate LVL 2 PD if necessary */
> -        pde = pt_entry(lvl1, page_addr);
> -        if ( !pde_is_valid(*pde) )
> -        {
> -            lvl2 = lvl2_pd_pool_alloc();
> -            *pde = paddr_to_pde(__pa(lvl2), PDE_VALID,
> -                                XEN_PT_ENTRIES_LOG2_LVL_2);
> -        }
> -        else
> -            lvl2 = __va(pde_to_paddr(*pde));
> +        unsigned long flags;
> 
> -        /* Allocate LVL 3 PD if necessary */
> -        pde = pt_entry(lvl2, page_addr);
> -        if ( !pde_is_valid(*pde) )
> +        if ( is_kernel_text(page_addr) || is_kernel_inittext(page_addr) )
>          {
> -            lvl3 = lvl3_pd_pool_alloc();
> -            *pde = paddr_to_pde(__pa(lvl3), PDE_VALID,
> -                                XEN_PT_ENTRIES_LOG2_LVL_3);
> +            radix_dprintk("%016lx being marked as TEXT (RX)\n", page_addr);
> +            flags = PTE_XEN_RX;
>          }
> -        else
> -            lvl3 = __va(pde_to_paddr(*pde));
> -
> -        /* Allocate LVL 4 PT if necessary */
> -        pde = pt_entry(lvl3, page_addr);
> -        if ( !pde_is_valid(*pde) )
> +        else if ( is_kernel_rodata(page_addr) )
>          {
> -            lvl4 = lvl4_pt_pool_alloc();
> -            *pde = paddr_to_pde(__pa(lvl4), PDE_VALID,
> -                                XEN_PT_ENTRIES_LOG2_LVL_4);
> +            radix_dprintk("%016lx being marked as RODATA (RO)\n", page_addr);
> +            flags = PTE_XEN_RO;
>          }
>          else
> -            lvl4 = __va(pde_to_paddr(*pde));
> -
> -        /* Finally, create PTE in LVL 4 PT */
> -        pte = pt_entry(lvl4, page_addr);
> -        if ( !pte_is_valid(*pte) )
>          {
> -            unsigned long paddr = (page_addr - map_start) + phys_base;
> -            unsigned long flags;
> -
> -            radix_dprintk("%016lx being mapped to %016lx\n", paddr, page_addr);
> -            if ( is_kernel_text(page_addr) || is_kernel_inittext(page_addr) )
> -            {
> -                radix_dprintk("%016lx being marked as TEXT (RX)\n", page_addr);
> -                flags = PTE_XEN_RX;
> -            }
> -            else if ( is_kernel_rodata(page_addr) )
> -            {
> -                radix_dprintk("%016lx being marked as RODATA (RO)\n", page_addr);
> -                flags = PTE_XEN_RO;
> -            }
> -            else
> -            {
> -                radix_dprintk("%016lx being marked as DEFAULT (RW)\n", page_addr);
> -                flags = PTE_XEN_RW;
> -            }
> -
> -            *pte = paddr_to_pte(paddr, flags);
> -            radix_dprintk("%016lx is the result of PTE map\n",
> -                paddr_to_pte(paddr, flags).pte);
> -        }
> -        else
> -        {
> -            early_printk("BUG: Tried to create PTE for already-mapped page!");
> -            die();
> +            radix_dprintk("%016lx being marked as DEFAULT (RW)\n", page_addr);
> +            flags = PTE_XEN_RW;
>          }
> +
> +        map_page_initial(lvl1, page_addr, (page_addr - map_start) + phys_base, flags);
> +    }
> +
> +    previous_max_alloc_mfn = max_alloc_mfn;
> +
> +    /*
> +     * Identity map all pages we've allocated for paging structures. This act
> +     * itself will allocate more pages, so continue until we've mapped from
> +     * `max_alloc_mfn` down to `min_alloc_mfn`. This assumes that the heap grows
> +     * downwards, which matches the behavior of alloc_boot_pages.

... as long as you only ever allocate individual pages (which looks
to be the case for such incremental allocations, but that imo doesn't
go without saying).

Jan

