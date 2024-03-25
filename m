Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9470E88A6E4
	for <lists+xen-devel@lfdr.de>; Mon, 25 Mar 2024 16:39:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697794.1088926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1romPq-00086m-DL; Mon, 25 Mar 2024 15:39:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697794.1088926; Mon, 25 Mar 2024 15:39:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1romPq-00084q-AX; Mon, 25 Mar 2024 15:39:14 +0000
Received: by outflank-mailman (input) for mailman id 697794;
 Mon, 25 Mar 2024 15:39:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x9L4=K7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1romPp-00084k-3j
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2024 15:39:13 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d32b72ef-eabd-11ee-afe3-a90da7624cb6;
 Mon, 25 Mar 2024 16:39:11 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-515a86daf09so2017311e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 25 Mar 2024 08:39:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 k11-20020a1709067acb00b00a4a36e4c3fbsm1089189ejo.182.2024.03.25.08.39.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Mar 2024 08:39:09 -0700 (PDT)
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
X-Inumbo-ID: d32b72ef-eabd-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711381150; x=1711985950; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wfnK3jW8pfZ76J+659Erv1jkv6D8oNEGgAQsZk2zsxs=;
        b=ZNLAbRl4WP8wxDTLuWBZG4b2ch54hlBUaUUZR+WU3DTqPxk56rzvjYV96gTNLpcs/3
         VpXux+d9YU8ZQEw9f8ZBlagLEMu88Cz2uwK0n5Rve7gMGaxVxGuv1/VxQmcpiPzvELUk
         0bRLTUcyCGJoki1FAbMs1VElxkPfYDY+GqvdL50qN36Wc45mAyOUWwoxRr3IrXkIxPG8
         Io0rzP6NKKVv5erDDZyl2RD2Plo8P5pS8KdF1BT04SvqCR4a++q4OZ9SH4/Eiv6N5YCJ
         yDl3HuhGiPTl6TAorgTJIFmmH0DfdxIqNlkq+++vj0/A8XDdg0WrqGFO7hUVRIn8FVCx
         emMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711381150; x=1711985950;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wfnK3jW8pfZ76J+659Erv1jkv6D8oNEGgAQsZk2zsxs=;
        b=oDPQENDRQZp2oFCon6QsEOuYRL3fh0Bw8Lbw2hTOJ5gcMjDis5CSbPt83PzRunDXAr
         Ha2zbd0Y5D676JcZlUzYSKLOzuu13uh5fh1QZ2Eg4GxgetEODNjIluMu2X3q4Uxpdb78
         LizTF3nvbwAkuAWnPlVJJRa1L/e+JCs4aSqPVSWVoafjB3XCEpwQcgkurpj5qksBv1HN
         2H7A5G615VuH5nPqBwdf6UTXbfbjpSjRqW8MVAdVEGnSimKKzXEBgaoeoMZLckHjvHnT
         AsfQR1qKGmX5p34C+cs2yNUQfbhk1m8M4qsrNOWEal/WNH5Je1cAB3XN2xvtklAYC5s3
         N0hw==
X-Forwarded-Encrypted: i=1; AJvYcCVbO9Y3dmg1fP1XpkfNjmnWynxwPqCPs2EBFpV/hs9dzFuqPZcnnskJs07pzUKf3Cm2Hbb82QLBLiIDAxFjMcMyTSaWgJEuvEm8wT3KXWw=
X-Gm-Message-State: AOJu0YzMS4ZSFmWcHFIUV187I5xTLVXOYRZs/Q/NESmgoJO5Kwe4dyCL
	jvUn52D8yzs1npEZi7vC2gEZYH5LohNh9MImeflPEAuPJKFHYKs1tqwdi6WqTQ==
X-Google-Smtp-Source: AGHT+IFo01yy2+F2mDoW8OCiTTkAD/qXP/cwIsd5WWOmsIPCFqd/MkEkMo6CJD9K5dFJEP09OjBZZQ==
X-Received: by 2002:ac2:4db6:0:b0:514:88df:88b9 with SMTP id h22-20020ac24db6000000b0051488df88b9mr4686201lfe.45.1711381150234;
        Mon, 25 Mar 2024 08:39:10 -0700 (PDT)
Message-ID: <beab0b2a-b8ff-475c-885f-dec8518b9a8f@suse.com>
Date: Mon, 25 Mar 2024 16:39:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 9/9] xen/ppc: mm-radix: Allocate all paging structures
 at runtime
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: tpearson@raptorengineering.com, xen-devel@lists.xenproject.org
References: <cover.1710443965.git.sanastasio@raptorengineering.com>
 <00f22a6a08451614179219fd430539fbb1e6e8cf.1710443965.git.sanastasio@raptorengineering.com>
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
In-Reply-To: <00f22a6a08451614179219fd430539fbb1e6e8cf.1710443965.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.03.2024 23:15, Shawn Anastasio wrote:
> --- a/xen/arch/ppc/mm-radix.c
> +++ b/xen/arch/ppc/mm-radix.c
> @@ -21,69 +21,101 @@ void enable_mmu(void);
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
> +    mfn_last = _mfn(mfn_x(mfn_first) + nr_pfns - 1);

Please can you use mfn_add() here?

> -static __init struct lvl2_pd *lvl2_pd_pool_alloc(void)
> -{
> -    if ( initial_lvl2_lvl3_pd_pool_used >= INITIAL_LVL2_LVL3_PD_COUNT )
> -    {
> -        early_printk("Ran out of space for LVL2/3 PD!\n");
> -        die();
> -    }
> +    min_alloc_mfn = _mfn(min(mfn_x(min_alloc_mfn), mfn_x(mfn_first)));
> +    max_alloc_mfn = _mfn(max(mfn_x(max_alloc_mfn), mfn_x(mfn_last)));

Together with the comment ahead of the function - is there some kind of
assumption here that this range won't span almost all of system memory?
E.g. expecting allocations to be almost contiguous? If so, I wonder how
reliable this is, and whether using a rangeset wouldn't be better here.

> @@ -105,81 +138,47 @@ static void __init setup_initial_mapping(struct lvl1_pd *lvl1,
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
> +     */
> +    for ( page_addr = (vaddr_t)__va(mfn_to_maddr(max_alloc_mfn));
> +          mfn_to_maddr(min_alloc_mfn) <= __pa(page_addr);
> +          page_addr -= PAGE_SIZE)
> +    {
> +        map_page_initial(lvl1, page_addr, __pa(page_addr), PTE_XEN_RW);
>      }
> +
> +    if ( mfn_x(previous_max_alloc_mfn) != mfn_x(max_alloc_mfn) )
> +        panic("Early page heap unexpectedly grew upwards\n");
>  }

Oh, yet another assumption on allocator behavior.

Jan

