Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A9294143B
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 16:23:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767848.1178561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYnkl-00047q-HU; Tue, 30 Jul 2024 14:23:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767848.1178561; Tue, 30 Jul 2024 14:23:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYnkl-00044s-Dz; Tue, 30 Jul 2024 14:23:03 +0000
Received: by outflank-mailman (input) for mailman id 767848;
 Tue, 30 Jul 2024 14:23:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hr/k=O6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sYnkj-00044m-To
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 14:23:02 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38c4ffbf-4e7f-11ef-8776-851b0ebba9a2;
 Tue, 30 Jul 2024 16:22:59 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a7a9cf7d3f3so548057266b.1
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jul 2024 07:22:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acab23f21sm650995966b.37.2024.07.30.07.22.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jul 2024 07:22:58 -0700 (PDT)
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
X-Inumbo-ID: 38c4ffbf-4e7f-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722349379; x=1722954179; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7oemiqal2hU/msX9CgwkFk7D5dDNsBoFU2W9tsKJdmY=;
        b=ftooaS1mPOCI+vF4z7Bod9Ef3g5Z97fTv1xBo017SzOCYhEVvlpCTkIddEqAUUvnaH
         qCFXQipr7/dppU8T8aAVJAQXYVx9IOFfIU3QQ+ObvjwMAu0dp8xXjj8K6GDp/h9Vu/Nf
         3ZzFVck0559I6ZyxsxC2tQAG5AvyhtlnIo2Y6zV/U0GnEx81RVnjij4+2ZCSXKsI1QK3
         JiifyTvI7nRKamSWaPApNdPYnwIxugq/5fqCfffQWn2+vBwLQch91UnZQRN+RjCHcTIr
         fIJwa5NbkU+jcM8OhexZ2uMTZ/ITC382LKDr8IIyL3+yG8M1tHJ6rkhFSEEVOQv5y1TL
         ZtFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722349379; x=1722954179;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7oemiqal2hU/msX9CgwkFk7D5dDNsBoFU2W9tsKJdmY=;
        b=wIZGlkx1GvD90Zw/QqFnwEdbFIMxkrhnfJaqZ8XU8c9Lgk5QB/o6hGlPwLscSITSQD
         B8H0bE3gdmqsu6BfbQs5vbRcuypxw03H/hXLHjAiV4p/mQHu3p7ouqgrW2hhzV4s8dEQ
         ZblkpA2TzCAHa0wObhg8lDeIrkkVWws6yEJ0jd1FEr9/ZhlWs1gbc0TqlezFxeaa2cJI
         yoTPM0FIxa7oM1Kj8j4MLGhAAw40UymrWucPtPB36o35XxOGgjNqI12TJuLZUxFN2twN
         MWpCwa/SLnHhrSZjOXkCR1XPuOq/+vHuaGMA/ysTXe5I3GsR/nLd82c+9sQumnXhlPO8
         iSQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXyMeKExpYP6wptHcIirdNdGqFBQYS2whUVHCbH2NweupG6+8NvRnzcfOak9nnMYY/frYHhrXmtsgieD1E6Qj1MqT0pYPSGMtuovbDOIw=
X-Gm-Message-State: AOJu0YzxNYCfRUxXLrDPzsSkFjRQyf9/sDVqBQcTzr7/0RorCV92xKsg
	WyUMXPQhJXLjvPKjQf+pLfiZ6+8dOZCcVDn13hEQr8d6XnzRdmkTQ/b8ByvMIg==
X-Google-Smtp-Source: AGHT+IFCn8VjrE31dTTb3cyzMWsiINYx9sj7xybMzWC/iluICmteL15QFL2oqLUBBDcrGabkh5WWAQ==
X-Received: by 2002:a17:907:998a:b0:a7a:8cb9:7491 with SMTP id a640c23a62f3a-a7d4014a685mr637097266b.54.1722349378366;
        Tue, 30 Jul 2024 07:22:58 -0700 (PDT)
Message-ID: <c2496115-5c42-4cbb-8dde-686a97259609@suse.com>
Date: Tue, 30 Jul 2024 16:22:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/9] xen/riscv: page table handling
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1721834549.git.oleksii.kurochko@gmail.com>
 <595c7b6736d6f718bafc7a677fb13881584ce4dc.1721834549.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <595c7b6736d6f718bafc7a677fb13881584ce4dc.1721834549.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.07.2024 17:31, Oleksii Kurochko wrote:
> Introduces an implementation of map_pages_to_xen() which requires multiple
> functions to work with page tables/entries:
> - xen_pt_update()
> - xen_pt_mapping_level()
> - xen_pt_update_entry()
> - xen_pt_next_level()
> - xen_pt_check_entry()

I question the need for xen_ prefixes here.

> During the mentioned above function it is necessary to create Xen tables
> or map/unmap them. For that it were introduced the following functions:

You start the description with "Introduces ..." (yet better would be
"Introduce ..."), just to switch back to past tense here again. You
want to get used to describing what a patch does in imperative form.
That'll make it easier to tell those parts from parts describing
present / past behavior. (A patch description does specifically not
describe what you did prior to submitting the patch; it describes
what the patch itself does.)

> - create_xen_table()
> - xen_map_table()
> - xen_unmap_table()
> 
> Also it was introduced various internal macros for convience started with
> _PAGE_* which almost duplicate the bits in PTE except _PAGE_BLOCK which
> actually doesn't present in PTE which indicates that page larger then 4k
> is needed. RISC-V doesn't have a specific bit in PTE and it detect if it
> is a superpage or not only by using pte.x and pte.r. From the RISC-V spec:
> ```
>   ...
>   4. Otherwise, the PTE is valid. If pte.r = 1 or pte.x = 1, go to step 5.
>      Otherwise, this PTE is a pointer to the next level of the page table.
>      ... .
>   5. A leaf PTE has been found.
>      ...
>   ...
> ```
> 
> Except that it was introduced flush_xen_tlb_range_va() for TLB flushing
> accross CPUs when PTE for requested mapping was properly updated.

On top of what I said above, I think here you mean "In addition ..." or
"Additionally ...".

> --- a/xen/arch/riscv/Kconfig
> +++ b/xen/arch/riscv/Kconfig
> @@ -2,6 +2,7 @@ config RISCV
>  	def_bool y
>  	select FUNCTION_ALIGNMENT_16B
>  	select GENERIC_BUG_FRAME
> +	select GENERIC_PT
>  	select HAS_DEVICE_TREE
>  	select HAS_PMAP

Stray leftover?

> @@ -27,6 +29,19 @@ static inline void flush_xen_tlb_range_va_local(vaddr_t va,
>      }
>  }
>  
> +/*
> + * Flush a range of VA's hypervisor mappings from the TLB of all
> + * processors in the inner-shareable domain.
> + */
> +static inline void flush_xen_tlb_range_va(vaddr_t va,
> +                                          unsigned long size)
> +{
> +    if ( sbi_has_rfence() )
> +        sbi_remote_sfence_vma(NULL, va, size);
> +    else
> +        BUG_ON("IPI support is need for remote TLB flush");
> +}

static inline void flush_xen_tlb_range_va(vaddr_t va,
                                          size_t size)
{
    BUG_ON(!sbi_has_rfence());
    sbi_remote_sfence_vma(NULL, va, size);
}

? Plus once again I'm uncertain about the usefulness of the "xen" infix.

> --- a/xen/arch/riscv/include/asm/mm.h
> +++ b/xen/arch/riscv/include/asm/mm.h
> @@ -42,6 +42,8 @@ static inline void *maddr_to_virt(paddr_t ma)
>  #define virt_to_mfn(va)     __virt_to_mfn(va)
>  #define mfn_to_virt(mfn)    __mfn_to_virt(mfn)
>  
> +#define pte_get_mfn(pte) maddr_to_mfn(pte_to_paddr(pte))

Along the lines of the naming remark elsewhere: mfn_from_pte()?
pte_to_paddr() is ambiguous, too: What paddr is it that the construct
obtains? The one matching the address of the PTE (which may be of
interest when accessing page tables), or the one encoded in the PTE?
Imo paddr_from_pte() or pte_get_paddr() would again better express
what is being done. You may want to take a look at x86's page.h.

> --- a/xen/arch/riscv/include/asm/page-bits.h
> +++ b/xen/arch/riscv/include/asm/page-bits.h
> @@ -3,6 +3,42 @@
>  #ifndef __RISCV_PAGE_BITS_H__
>  #define __RISCV_PAGE_BITS_H__
>  
> +/*
> + * PTE format:
> + * | XLEN-1  10 | 9             8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0
> + *       PFN      reserved for SW   D   A   G   U   X   W   R   V
> + */
> +
> +#define _PAGE_PRESENT   BIT(0, UL)

The acronym being V, would _PAGE_VALID maybe be a better name? Just
like it's PTE_VALID? Speaking of which: Why do you need both PTE_*
and _PAGE_*? How will one determine which one to use where? Plus imo
page-bits.h is the wrong header to put these in. In fact I notice
abuse of this header has already proliferated: Both PPC and RISC-V
include this header explicitly, when it was introduced for just
xen/page-size.h to include directly (and the definitions to put there
are solely ones related to what xen/page-size.h needs / provides).
The underlying idea what to simplify header dependencies. With what
PPC and RISC-V do, that's being undermined.

> +#define _PAGE_READ      BIT(1, UL)    /* Readable */
> +#define _PAGE_WRITE     BIT(2, UL)    /* Writable */
> +#define _PAGE_EXEC      BIT(3, UL)    /* Executable */
> +#define _PAGE_USER      BIT(4, UL)    /* User */
> +#define _PAGE_GLOBAL    BIT(5, UL)    /* Global */
> +#define _PAGE_ACCESSED  BIT(6, UL)    /* Set by hardware on any access */
> +#define _PAGE_DIRTY     BIT(7, UL)    /* Set by hardware on any write */
> +#define _PAGE_SOFT      BIT(8, UL)    /* Reserved for software */

The diagram says that's two bits.

> +/*
> + * There is no such bits in PTE format for RISC-V.
> + *
> + * _PAGE_BLOCK was introduced to have ability to tell that superpage
> + * should be allocated.
> + */
> +#define _PAGE_BLOCK         BIT(9, UL)

Imo, like on x86, super-page mappings should be the default whenever possible.
Callers _not_ wanting such can request so - see x86'es MAP_SMALL_PAGES.

> +#define _PAGE_W_BIT     2
> +#define _PAGE_XN_BIT    3
> +#define _PAGE_RO_BIT    1
> +
> +/* TODO: move to somewhere generic part/header ? */
> +#define _PAGE_XN        (1U << _PAGE_XN_BIT)
> +#define _PAGE_RO        (1U << _PAGE_RO_BIT)
> +#define _PAGE_W         (1U << _PAGE_W_BIT)
> +#define PAGE_XN_MASK(x) (((x) >> _PAGE_XN_BIT) & 0x1U)
> +#define PAGE_RO_MASK(x) (((x) >> _PAGE_RO_BIT) & 0x1U)
> +#define PAGE_W_MASK(x)  (((x) >> _PAGE_W_BIT) & 0x1U)

What are all of these about? Why PAGE_XN when you have a positive X bit in the
PTEs? And why 0x1U when plain 1 would do? All the PAGE_*_MASK ones are also
badly named. Constructs of that name should extract the bit in its position
(i.e. not shifted to bit 0), or be the name of a constant to use to do so.

> --- a/xen/arch/riscv/include/asm/page.h
> +++ b/xen/arch/riscv/include/asm/page.h
> @@ -34,6 +34,7 @@
>  #define PTE_LEAF_DEFAULT            (PTE_VALID | PTE_READABLE | PTE_WRITABLE)
>  #define PTE_TABLE                   (PTE_VALID)
>  
> +#define PAGE_HYPERVISOR_RO          (PTE_VALID | PTE_READABLE)
>  #define PAGE_HYPERVISOR_RW          (PTE_VALID | PTE_READABLE | PTE_WRITABLE)

No PAGE_HYPERVISOR_RX?

> @@ -43,13 +44,68 @@
>  
>  #define pt_index(lvl, va) (pt_linear_offset((lvl), (va)) & VPN_MASK)
>  
> -/* Page Table entry */
> +#define FIRST_SIZE (XEN_PT_LEVEL_SIZE(2))
> +
> +#define TABLE_OFFSET(offs) (_AT(unsigned int, offs) & ((_AC(1, U) << PAGETABLE_ORDER) - 1))
> +
> +#if RV_STAGE1_MODE > SATP_MODE_SV48
> +#error "need to to update DECLARE_OFFSETS macros"
> +#else
> +
> +#define l0_table_offset(va) TABLE_OFFSET(pt_linear_offset(0, va))
> +#define l1_table_offset(va) TABLE_OFFSET(pt_linear_offset(1, va))
> +#define l2_table_offset(va) TABLE_OFFSET(pt_linear_offset(2, va))
> +#define l3_table_offset(va) TABLE_OFFSET(pt_linear_offset(3, va))
> +
> +/* Generate an array @var containing the offset for each level from @addr */
> +#define DECLARE_OFFSETS(var, addr)          \
> +    const unsigned int var[4] = {           \
> +        l0_table_offset(addr),              \
> +        l1_table_offset(addr),              \
> +        l2_table_offset(addr),              \
> +        l3_table_offset(addr)               \
> +    }

Why would this need to have 4 entries in SV39 mode?

> +#endif
> +
>  typedef struct {
> +    unsigned long v:1;
> +    unsigned long r:1;
> +    unsigned long w:1;
> +    unsigned long x:1;
> +    unsigned long u:1;
> +    unsigned long g:1;
> +    unsigned long a:1;
> +    unsigned long d:1;

bool for all of these?

> +    unsigned long rsw:2;
> +#if RV_STAGE1_MODE == SATP_MODE_SV39
> +    unsigned long ppn0:9;
> +    unsigned long ppn1:9;
> +    unsigned long ppn2:26;
> +    unsigned long rsw2:7;

"rsw" above appear to mean "reserved for software use". What does "rsw" here
mean? Should this field be "rsv"?

> +    unsigned long pbmt:2;
> +    unsigned long n:1;
> +#elif RV_STAGE1_MODE == SATP_MODE_SV48
> +    unsigned long ppn0:9;
> +    unsigned long ppn1:9;
> +    unsigned long ppn2:9;
> +    unsigned long ppn3:17;
> +    unsigned long rsw2:7;
> +    unsigned long pbmt:2;
> +    unsigned long n:1;
> +#else
> +#error "Add proper bits for SATP_MODE"
> +#endif
> +} pt_t;

I can't spot a use anywhere of e.g. ppn0. Would be nice to understand in
what contexts these bitfields are going to be used. I notice you specifically
don't use them in e.g. pte_is_table().

> +/* Page Table entry */
> +typedef union {
>  #ifdef CONFIG_RISCV_64
>      uint64_t pte;
>  #else
>      uint32_t pte;
>  #endif
> +pt_t bits;
>  } pte_t;

Struct field want indenting.

> @@ -70,6 +126,21 @@ static inline bool pte_is_valid(pte_t p)
>      return p.pte & PTE_VALID;
>  }
>  
> +inline bool pte_is_table(const pte_t p, unsigned int level)
> +{
> +    (void) level;
> +
> +    return (((p.pte) & (PTE_VALID

No need to parenthesize p.pte.

> +                       | PTE_READABLE
> +                       | PTE_WRITABLE
> +                       | PTE_EXECUTABLE)) == PTE_VALID);

Indentation of these lines looks to be off by 1.

> +}
> +
> +static inline bool pte_is_mapping(const pte_t pte, unsigned int level)
> +{
> +    return !pte_is_table(pte, level);
> +}

Don't you mean V=1 and (R=1 or X=1) here?

> --- /dev/null
> +++ b/xen/arch/riscv/pt.c
> @@ -0,0 +1,410 @@
> +#include <xen/bug.h>
> +#include <xen/domain_page.h>
> +#include <xen/errno.h>
> +#include <xen/mm.h>
> +#include <xen/mm-frame.h>
> +#include <xen/pmap.h>
> +#include <xen/spinlock.h>
> +
> +#include <asm/flushtlb.h>
> +#include <asm/page.h>
> +
> +static inline const mfn_t get_root_page(void)
> +{
> +    unsigned long root_maddr = csr_read(CSR_SATP) << PAGE_SHIFT;

You want to isolate the PPN part of the register before shifting.

> +    return maddr_to_mfn(root_maddr);
> +}
> +
> +static inline void set_pte_permissions(pte_t *pte, unsigned int flags)
> +{
> +    pte->bits.r = PAGE_RO_MASK(flags);
> +    pte->bits.x = ~PAGE_XN_MASK(flags);
> +    pte->bits.w = PAGE_W_MASK(flags);
> +
> +    pte->pte |= PTE_ACCESSED | PTE_DIRTY;
> +}

As indicated elsewhere, imo objects of type pte_t should not be floating
around in the system without having permissions set on them. The helper
creating a pte_t should take both MFN and (permission) flags.

Further, with "flags" suitably arranged, all you need to do is to OR them
into the shifted PPN; there's no need for a whapping 4 assignments, even
if maybe the compiler can fold some of this.

> +/* Sanity check of the entry */
> +static bool xen_pt_check_entry(pte_t entry, mfn_t mfn, unsigned int level,
> +                               unsigned int flags)

The comment wants extending to indicate what the parameters mean wrt what
is going to be checked. For example, ...

> +{
> +    /* Sanity check when modifying an entry. */
> +    if ( mfn_eq(mfn, INVALID_MFN) )

... it's unclear to me why incoming INVALID_MFN would indicate modification
of an entry, whereas further down _PAGE_PRESENT supposedly indicates
insertion.

> +    {
> +        /* We don't allow modifying an invalid entry. */
> +        if ( !pte_is_valid(entry) )
> +        {
> +            printk("Modifying invalid entry is not allowed.\n");
> +            return false;
> +        }
> +
> +        /* We don't allow modifying a table entry */
> +        if ( !pte_is_mapping(entry, level) )

With what the comment say, why not pte_is_table()?

> +        {
> +            printk("Modifying a table entry is not allowed.\n");
> +            return false;
> +        }
> +    }
> +    /* Sanity check when inserting a mapping */
> +    else if ( flags & _PAGE_PRESENT )
> +    {
> +        /* We should be here with a valid MFN. */
> +        ASSERT(!mfn_eq(mfn, INVALID_MFN));
> +
> +        /*
> +         * We don't allow replacing any valid entry.
> +         *
> +         * Note that the function xen_pt_update() relies on this
> +         * assumption and will skip the TLB flush. The function will need
> +         * to be updated if the check is relaxed.
> +         */
> +        if ( pte_is_valid(entry) )
> +        {
> +            if ( pte_is_mapping(entry, level) )
> +                printk("Changing MFN for a valid entry is not allowed (%#"PRI_mfn" -> %#"PRI_mfn").\n",
> +                          mfn_x(pte_get_mfn(entry)), mfn_x(mfn));

Nit: Indentation. (I'm once again worried by all of these printk()s anyway.)

> +#define XEN_TABLE_MAP_FAILED 0
> +#define XEN_TABLE_SUPER_PAGE 1
> +#define XEN_TABLE_NORMAL_PAGE 2
> +
> +/*
> + * Take the currently mapped table, find the corresponding entry,
> + * and map the next table, if available.
> + *
> + * The read_only parameters indicates whether intermediate tables should
> + * be allocated when not present.

"read_only" would have a different meaning to me. Maybe use inverted sense
with a name like "alloc"?

> + * Return values:
> + *  XEN_TABLE_MAP_FAILED: Either read_only was set and the entry
> + *  was empty, or allocating a new page failed.
> + *  XEN_TABLE_NORMAL_PAGE: next level mapped normally
> + *  XEN_TABLE_SUPER_PAGE: The next entry points to a superpage.
> + */
> +static int xen_pt_next_level(bool read_only, unsigned int level,
> +                             pte_t **table, unsigned int offset)
> +{
> +    pte_t *entry;
> +    int ret;
> +    mfn_t mfn;
> +
> +    entry = *table + offset;
> +
> +    if ( !pte_is_valid(*entry) )
> +    {
> +        if ( read_only )
> +            return XEN_TABLE_MAP_FAILED;
> +
> +        ret = create_xen_table(entry);
> +        if ( ret )
> +            return XEN_TABLE_MAP_FAILED;
> +    }
> +
> +    if ( pte_is_mapping(*entry, level) )
> +    {
> +        return XEN_TABLE_SUPER_PAGE;
> +    }

Please be consistent with braces around single statements.

> +    mfn = pte_get_mfn(*entry);
> +
> +    xen_unmap_table(*table);
> +    *table = xen_map_table(mfn);
> +
> +    return XEN_TABLE_NORMAL_PAGE;
> +}

Normal page? Not normal table?

> +/* Update an entry at the level @target. */
> +static int xen_pt_update_entry(mfn_t root, unsigned long virt,
> +                               mfn_t mfn, unsigned int arch_target,
> +                               unsigned int flags)
> +{
> +    int rc;
> +    unsigned int level = HYP_PT_ROOT_LEVEL;
> +    unsigned int arch_level = level;

Why two level variables?

> +    unsigned int target = arch_target;
> +    pte_t *table;
> +    /*
> +     * The intermediate page tables are read-only when the MFN is not valid
> +     * This means we either modify permissions or remove an entry.
> +     */
> +    bool read_only = mfn_eq(mfn, INVALID_MFN);

I'm afraid I can't make a connection between the incoming MFN being
INVALID_MFN and intermediate tables being intended to remain unaltered.

> +    pte_t pte, *entry;
> +
> +    /* convenience aliases */
> +    DECLARE_OFFSETS(offsets, (paddr_t)virt);

Unless for a mode where translation is disabled, I don't think virtual
addresses should ever be converted to paddr_t.

> +    table = xen_map_table(root);
> +    for ( ; level > target; level--, arch_level = level )
> +    {
> +        rc = xen_pt_next_level(read_only, arch_level, &table, offsets[arch_level]);
> +        if ( rc == XEN_TABLE_MAP_FAILED )
> +        {
> +            /*
> +             * We are here because xen_pt_next_level has failed to map
> +             * the intermediate page table (e.g the table does not exist
> +             * and the pt is read-only). It is a valid case when
> +             * removing a mapping as it may not exist in the page table.
> +             * In this case, just ignore it.
> +             */
> +            if ( flags & _PAGE_PRESENT )
> +            {
> +                printk("%s: Unable to map level %u\n", __func__, arch_level);
> +                rc = -ENOENT;
> +                goto out;
> +            }
> +            else
> +            {
> +                rc = 0;
> +                goto out;
> +            }

Please pull out such identical "goto out".

> +        }
> +        else if ( rc != XEN_TABLE_NORMAL_PAGE ) {

Nit: Brace placement. Initially I was wondering how this would have
compiled for you, until I spotted the opening brace ...

> +            break;
> +        }

... matching this closing one (both of which are really unnecessary).

> +    }
> +
> +    if ( arch_level != arch_target )
> +    {
> +        printk("%s: Shattering superpage is not supported\n", __func__);
> +        rc = -EOPNOTSUPP;
> +        goto out;
> +    }
> +
> +    entry = table + offsets[arch_level];
> +
> +    rc = -EINVAL;
> +    if ( !xen_pt_check_entry(*entry, mfn, arch_level, flags) )
> +        goto out;
> +
> +    /* We are removing the page */
> +    if ( !(flags & _PAGE_PRESENT) )
> +        memset(&pte, 0x00, sizeof(pte));
> +    else
> +    {
> +        /* We are inserting a mapping => Create new pte. */
> +        if ( !mfn_eq(mfn, INVALID_MFN) )
> +        {
> +            pte = mfn_to_xen_entry(mfn, PTE_VALID);
> +        }
> +        else /* We are updating the permission => Copy the current pte. */
> +            pte = *entry;
> +
> +        set_pte_permissions(&pte, flags);
> +    }
> +
> +    write_pte(entry, pte);
> +
> +    rc = 0;
> +
> +out:

Nit: Style (label needs indenting).

> +    xen_unmap_table(table);
> +
> +    return rc;
> +}
> +
> +static DEFINE_SPINLOCK(xen_pt_lock);
> +
> +/* Return the level where mapping should be done */
> +static int xen_pt_mapping_level(unsigned long vfn, mfn_t mfn, unsigned long nr,
> +                                unsigned int flags)
> +{
> +    unsigned int level = 0;
> +    unsigned long mask;
> +    int i;

unsigned int?

> +    /*
> +     * Don't take into account the MFN when removing mapping (i.e
> +     * MFN_INVALID) to calculate the correct target order.
> +     *
> +     * `vfn` and `mfn` must be both superpage aligned.
> +     * They are or-ed together and then checked against the size of
> +     * each level.
> +     *
> +     * `left` is not included and checked separately to allow
> +     * superpage mapping even if it is not properly aligned (the
> +     * user may have asked to map 2MB + 4k).
> +     */
> +    mask = !mfn_eq(mfn, INVALID_MFN) ? mfn_x(mfn) : 0;
> +    mask |= vfn;
> +
> +    /*
> +     * Always use level 0 ( 4k mapping ) mapping unless the caller request
> +     * block mapping.
> +     */
> +    if ( likely(!(flags & _PAGE_BLOCK)) )
> +        return level;

This is independent of the calculation of "mask" and hence can move up.

> +    for ( i = HYP_PT_ROOT_LEVEL; i > 0; i-- )
> +    {
> +        if ( !(mask & (BIT(XEN_PT_LEVEL_ORDER(i), UL) - 1)) &&
> +            (nr >= BIT(XEN_PT_LEVEL_ORDER(i), UL)) )

Nit: Indentation again.

> +        {
> +            level = i;
> +            break;
> +        }
> +    }
> +
> +    return level;
> +}
> +
> +static int xen_pt_update(unsigned long virt,
> +                         mfn_t mfn,
> +                         /* const on purpose as it is used for TLB flush */
> +                         const unsigned long nr_mfns,

I'm afraid I don't see what the comment is actually trying to tell me.
If this is about you wanting to make sure the function arguments aren't
altered prematurely, then why would the same not apply to virt, mfn,
and flags (all of which matter at the time the TLB flush is initiated)?

> +                         unsigned int flags)
> +{
> +    int rc = 0;
> +    unsigned long vfn = virt >> PAGE_SHIFT;
> +    unsigned long left = nr_mfns;
> +
> +    const mfn_t root = get_root_page();
> +
> +    /*
> +     * It is bad idea to have mapping both writeable and
> +     * executable.
> +     * When modifying/creating mapping (i.e _PAGE_PRESENT is set),
> +     * prevent any update if this happen.
> +     */
> +    if ( (flags & _PAGE_PRESENT) && !PAGE_RO_MASK(flags) &&
> +         !PAGE_XN_MASK(flags) )
> +    {
> +        printk("Mappings should not be both Writeable and Executable.\n");
> +        return -EINVAL;
> +    }
> +
> +    if ( !IS_ALIGNED(virt, PAGE_SIZE) )
> +    {
> +        printk("The virtual address is not aligned to the page-size.\n");
> +        return -EINVAL;
> +    }
> +
> +    spin_lock(&xen_pt_lock);
> +
> +    while ( left )
> +    {
> +        unsigned int order, level;
> +
> +        level = xen_pt_mapping_level(vfn, mfn, left, flags);
> +        order = XEN_PT_LEVEL_ORDER(level);
> +
> +        ASSERT(left >= BIT(order, UL));
> +
> +        rc = xen_pt_update_entry(root, vfn << PAGE_SHIFT, mfn, level,
> +                                    flags);
> +        if ( rc )
> +            break;
> +
> +        vfn += 1U << order;
> +        if ( !mfn_eq(mfn, INVALID_MFN) )
> +            mfn = mfn_add(mfn, 1U << order);
> +
> +        left -= (1U << order);
> +
> +        if ( rc )
> +            break;
> +    }
> +
> +    /*
> +     * The TLBs flush can be safely skipped when a mapping is inserted
> +     * as we don't allow mapping replacement (see xen_pt_check_entry()).
> +     *
> +     * For all the other cases, the TLBs will be flushed unconditionally
> +     * even if the mapping has failed. This is because we may have
> +     * partially modified the PT. This will prevent any unexpected
> +     * behavior afterwards.
> +     */
> +    if ( !((flags & _PAGE_PRESENT) && !mfn_eq(mfn, INVALID_MFN)) )
> +        flush_xen_tlb_range_va(virt, PAGE_SIZE * nr_mfns);

See my comments elsewhere towards TLB behavior on RISC-V. The indicated
skipping of a flush is safe only if not-present entries cannot be put
in the TLB.

> +    spin_unlock(&xen_pt_lock);
> +
> +    return rc;
> +}
> +
> +int map_pages_to_xen(unsigned long virt,
> +                     mfn_t mfn,
> +                     unsigned long nr_mfns,
> +                     unsigned int flags)
> +{
> +    return xen_pt_update(virt, mfn, nr_mfns, flags);
> +}

Why this wrapping of two functions taking identical arguments?

Jan

