Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4446481AF1C
	for <lists+xen-devel@lfdr.de>; Thu, 21 Dec 2023 08:07:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658502.1027678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGD8d-0001vR-De; Thu, 21 Dec 2023 07:06:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658502.1027678; Thu, 21 Dec 2023 07:06:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGD8d-0001t8-As; Thu, 21 Dec 2023 07:06:35 +0000
Received: by outflank-mailman (input) for mailman id 658502;
 Thu, 21 Dec 2023 07:06:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vttA=IA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rGD8b-0001t2-6v
 for xen-devel@lists.xenproject.org; Thu, 21 Dec 2023 07:06:33 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77fe73dc-9fcf-11ee-98eb-6d05b1d4d9a1;
 Thu, 21 Dec 2023 08:06:31 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40c3ca9472dso5149335e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 23:06:31 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 c5-20020a05600c0a4500b0040c411da99csm10023197wmq.48.2023.12.20.23.06.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Dec 2023 23:06:30 -0800 (PST)
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
X-Inumbo-ID: 77fe73dc-9fcf-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1703142391; x=1703747191; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=okWSJFha35PAlZL8Va5HIRdiQ8mlHhSOTDfpX214hK0=;
        b=QqNpphlAfjGPK1Owty7aI1J+5c6mwLLOeg0nfVJZc5S4jVAKPoLtaUx7WbNHvXRFmF
         LmIAj5D+k/HDWytv+ew9231HvMOhvZLBCLpPrlXzOYadvINjQLPyWQFEdYkuRzvoQW08
         w0oF0I9owcyyKozgXt77QgQQdcX0GParsoKDask9xA6qZgQAM3pelAkVGfINyvNPYebi
         fwwEXspM07sLJbifIo4Fdw2vM+OuwF+0CEoMScrux3S/wAg9W1igq07T66TAh0Dv1G9d
         OicEk5qIas2DJbUWY3EAHIfxvq0MPQKRmse6Lkw1T10OMtSc7xcqFATc7+i8EHLUekM5
         1T9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703142391; x=1703747191;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=okWSJFha35PAlZL8Va5HIRdiQ8mlHhSOTDfpX214hK0=;
        b=CcmO4i9aGLdlyx8B/ZWkaMJtli3fx1A2HbHztnNgGiAx7BemRqcb1mL8KZhE111U3J
         Kw0qGcMP9vmjtL2qhaVeehugk4V3a4BA3HsG82iENxRHvdz/HJ3ykQoaZ0SNh5cu9gB4
         npAb/OJRDyyBYgevM6gWjSxa5Z9zSjiEHRBThlXG0klNQwiLiMeyzWlvK2otl8bBdvki
         GczRETY36aQidLpjK0Nc5SdrHpOBPMzc8kSSvgUq9SBKkiYDg1e6Ulg45hA7J1eQY/0B
         jNItWIYyKahgVfCqgpTcSzmjF9FjdYkw9VWVMOePoCucuUU4mc6woJ2m/oXBkHl2b9hH
         prww==
X-Gm-Message-State: AOJu0YyXA8XnGyg7DHYPKz9vFZVWhAk/rUph8H952S4cPHY96HxRguP4
	fZAYAERXsUAMAKXb1moopCJ2ouVIM4qbAivk/Pc3
X-Google-Smtp-Source: AGHT+IELV4LAEXpXC34ySFzfYc/6X3jy9yrugxzisFxLKtcRMgC/MIxdUQ0I0qupZUG0tShTj4BLzA==
X-Received: by 2002:a05:600c:6028:b0:40c:357e:27b with SMTP id az40-20020a05600c602800b0040c357e027bmr294589wmb.162.1703142391060;
        Wed, 20 Dec 2023 23:06:31 -0800 (PST)
Message-ID: <6ba01b31-fc51-4d12-83a2-4754ccfb6339@suse.com>
Date: Thu, 21 Dec 2023 08:06:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] xen/ppc: mm-radix: Allocate Partition and Process
 Tables at runtime
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1702607884.git.sanastasio@raptorengineering.com>
 <f49a4a372a9f82e217fa56ba0dc3068deff32ef5.1702607884.git.sanastasio@raptorengineering.com>
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
In-Reply-To: <f49a4a372a9f82e217fa56ba0dc3068deff32ef5.1702607884.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.12.2023 03:44, Shawn Anastasio wrote:
> In the initial mm-radix implementation, the in-memory partition and
> process tables required to configure the MMU were allocated statically
> since the boot allocator was not yet available.
> 
> Now that it is, allocate these tables at runtime and bump the size of
> the Process Table to its maximum supported value (on POWER9). Also bump
> the number of static LVL2/3 PD frames to tolerate cases where the boot
> allocator returns an address outside of the range of the LVL2 frame used
> for Xen.

Don't you need to bump to 4, in case PATB and PRTB end up sufficiently
far apart? Or even further, considering that you may need distinct L2
and L3 for each of Xen, PATB, and PRTB?

However, with there being memory to allocate now, is there a reason you
still reserve (perhaps more than necessary) static memory for the
page tables, rather than allocating those dynamically as well?

> @@ -105,80 +157,43 @@ static void __init setup_initial_mapping(struct lvl1_pd *lvl1,
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
> -        {
> -            lvl4 = lvl4_pt_pool_alloc();
> -            *pde = paddr_to_pde(__pa(lvl4), PDE_VALID,
> -                                XEN_PT_ENTRIES_LOG2_LVL_4);
> -        }
> -        else
> -            lvl4 = __va(pde_to_paddr(*pde));
> -
> -        /* Finally, create PTE in LVL 4 PT */
> -        pte = pt_entry(lvl4, page_addr);
> -        if ( !pte_is_valid(*pte) )
> +        else if ( is_kernel_rodata(page_addr) )
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
> +            radix_dprintk("%016lx being marked as RODATA (RO)\n", page_addr);
> +            flags = PTE_XEN_RO;
>          }
>          else
>          {
> -            early_printk("BUG: Tried to create PTE for already-mapped page!");
> -            die();
> +            radix_dprintk("%016lx being marked as DEFAULT (RW)\n", page_addr);
> +            flags = PTE_XEN_RW;
>          }
> +
> +        map_page_initial(lvl1, page_addr, (page_addr - map_start) + phys_base, flags);
> +    }
> +
> +    /* Map runtime-allocated PATB, PRTB */
> +    for ( page_addr = (uint64_t)initial_patb;
> +          page_addr < (uint64_t)initial_patb + PATB_SIZE;

While technically not an issue, casting pointers to fixed width types is
generally bogus. page_addr itself would likely better also be of a
different type (unsigned long, uintptr_t, or vaddr_t; the latter only if
that's meant to represent hypervisor virtual addresses, not guest ones).

> +          page_addr += PAGE_SIZE )
> +    {
> +        map_page_initial(lvl1, page_addr, __pa(page_addr), PTE_XEN_RW);
> +    }
> +
> +    for ( page_addr = (uint64_t)initial_prtb;
> +          page_addr < (uint64_t)initial_prtb + PRTB_SIZE;
> +          page_addr += PAGE_SIZE )
> +    {
> +        map_page_initial(lvl1, page_addr, __pa(page_addr), PTE_XEN_RW);
>      }

Just as a remark (you're the maintainer) - in cases like these we generally
prefer to omit the braces.

> @@ -210,6 +225,16 @@ void __init setup_initial_pagetables(void)
>  {
>      struct lvl1_pd *root = lvl1_pd_pool_alloc();
>      unsigned long lpcr;
> +    mfn_t patb_mfn, prtb_mfn;
> +
> +    /* Allocate mfns for in-memory tables using the boot allocator */
> +    prtb_mfn = alloc_boot_pages(PRTB_SIZE / PAGE_SIZE,
> +                                max(1, PRTB_SIZE_LOG2 - PAGE_SHIFT));
> +    patb_mfn = alloc_boot_pages(PATB_SIZE / PAGE_SIZE,
> +                                max(1, PATB_SIZE_LOG2 - PAGE_SHIFT));
> +
> +    initial_patb = __va(mfn_to_maddr(patb_mfn));
> +    initial_prtb = __va(mfn_to_maddr(prtb_mfn));

Overall, what's the plan wrt directmap: Are you meaning to not have one
covering all memory? If you do, I wonder if you wouldn't be better off
mapping memory as you pass it to the boot allocator, such that you
won't need to map things piecemeal like you're doing here.

Jan

