Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3D781375E
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 18:09:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654716.1021966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDpBw-0003u1-KI; Thu, 14 Dec 2023 17:08:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654716.1021966; Thu, 14 Dec 2023 17:08:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDpBw-0003rB-GW; Thu, 14 Dec 2023 17:08:08 +0000
Received: by outflank-mailman (input) for mailman id 654716;
 Thu, 14 Dec 2023 17:08:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xmUX=HZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rDpBv-0003pr-12
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 17:08:07 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5709ddb9-9aa3-11ee-9b0f-b553b5be7939;
 Thu, 14 Dec 2023 18:08:02 +0100 (CET)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2c9f099cf3aso125298111fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 Dec 2023 09:08:02 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 o20-20020a17090611d400b00a0d02cfa48bsm9618542eja.213.2023.12.14.09.08.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Dec 2023 09:08:01 -0800 (PST)
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
X-Inumbo-ID: 5709ddb9-9aa3-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702573682; x=1703178482; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lvWck/vkt//fHgws7/hzujTWbo5R8ofID7T5B0xhEfo=;
        b=Y944ZmoBL13Vezey6libb5H1/zSiWBSrhIahy7lY8InMBI2qGMy660WZNQhH9HXdvO
         oycyyFztqkeT4LCq7R21s6YH87vcyfAxleNqxMYRLigQLz3qpfVcYYuC+eXFWQu28d9S
         G7Z6DxJtqpFfnbJUvdSdtSrSZ6vBE2UxQL1skQluxMCrr0nTgmie28G1jZWnh0So54gz
         rwqWzb0bHK4p+wLmfK2r/Km3aaEUpGvwt6kOo0hFvoY+Q6cEHVVFvJDESqyn19r+oWuD
         Vqro6HnrKRDgP3YuAevahB8EDvyCPFZOK0Dtbm1Ni1MALHQfT0onFsEpnPJjE1xM74lc
         z/Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702573682; x=1703178482;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lvWck/vkt//fHgws7/hzujTWbo5R8ofID7T5B0xhEfo=;
        b=oxfUBk4q7/5XByjpYfGsiBg8ePbyhAW/UESDlQLYPwgqOFIux77VHCRihmuUELHI0a
         AZRMdnqEDap/tlaH3shCAqqXuEAFYgYee8xzXI+c09phauGxuQi/jdUVsXqPPywUEcHr
         bXm8pzBJ9knJLAGwHLW2lAmEnNTj6LZnj19z6JTraJMIiTcwXSHyqEh7rKWZ3QTbtMOO
         sF80ZkeMwgb/nXAmHqVvKbz5BCheVA0ILJ1O60nO8rv1vAvKkeYl7MXK+1iszJCHL8mi
         4c0hQoma0FgDe7AS5RB7JtnOIrF1/PgrjQjvqKPRkxkRpNSvfL4HZOe20lJ1BmfBo4on
         euXQ==
X-Gm-Message-State: AOJu0YylMf0M6de8BWTEdnSNs7HBanDyWlIRxZ4Avzvgwk4oIwXcRNCx
	GDDiZNKhtt1xj4JF3x0y2c/9
X-Google-Smtp-Source: AGHT+IHt32bp+QH/eTcGqcb3B0qYtnVWhNosWfwKGBmDNveuhW5yeW2bCzLQLQ82uVDGdCTKRRXDlw==
X-Received: by 2002:a05:6512:ad5:b0:50d:1eb3:7bfd with SMTP id n21-20020a0565120ad500b0050d1eb37bfdmr5550368lfu.13.1702573681998;
        Thu, 14 Dec 2023 09:08:01 -0800 (PST)
Message-ID: <3d8bfead-e18c-4082-a75d-92aa379fa943@suse.com>
Date: Thu, 14 Dec 2023 18:08:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 36/39] xen/riscv: add minimal stuff to asm/mm.h to
 build full Xen
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
 <ec017ed24b1e5274d64d5458e4ab4475c92dece7.1700761381.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <ec017ed24b1e5274d64d5458e4ab4475c92dece7.1700761381.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.11.2023 11:30, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/include/asm/mm.h
> +++ b/xen/arch/riscv/include/asm/mm.h
> @@ -3,10 +3,271 @@
>  #ifndef _ASM_RISCV_MM_H
>  #define _ASM_RISCV_MM_H
>  
> +#include <public/xen.h>
> +#include <xen/pdx.h>
> +#include <xen/types.h>
> +
> +#include <asm/page.h>
>  #include <asm/page-bits.h>
>  
> -#define pfn_to_paddr(pfn) ((paddr_t)(pfn) << PAGE_SHIFT)
> -#define paddr_to_pfn(pa)  ((unsigned long)((pa) >> PAGE_SHIFT))

I'm a little puzzled here: Just a few patches ago you introduced them into
asm/page.h, and (only) now you're removing them here.

> +#define paddr_to_pdx(pa)    mfn_to_pdx(maddr_to_mfn(pa))
> +#define gfn_to_gaddr(gfn)   pfn_to_paddr(gfn_x(gfn))
> +#define gaddr_to_gfn(ga)    _gfn(paddr_to_pfn(ga))
> +#define mfn_to_maddr(mfn)   pfn_to_paddr(mfn_x(mfn))
> +#define maddr_to_mfn(ma)    _mfn(paddr_to_pfn(ma))
> +#define vmap_to_mfn(va)     maddr_to_mfn(virt_to_maddr((vaddr_t)va))
> +#define vmap_to_page(va)    mfn_to_page(vmap_to_mfn(va))
> +#define paddr_to_pdx(pa)    mfn_to_pdx(maddr_to_mfn(pa))
> +#define gfn_to_gaddr(gfn)   pfn_to_paddr(gfn_x(gfn))
> +#define gaddr_to_gfn(ga)    _gfn(paddr_to_pfn(ga))
> +#define mfn_to_maddr(mfn)   pfn_to_paddr(mfn_x(mfn))
> +#define maddr_to_mfn(ma)    _mfn(paddr_to_pfn(ma))
> +#define vmap_to_mfn(va)     maddr_to_mfn(virt_to_maddr((vaddr_t)va))
> +#define vmap_to_page(va)    mfn_to_page(vmap_to_mfn(va))
> +
> +#define virt_to_maddr(va) ((paddr_t)((vaddr_t)(va) & PADDR_MASK))
> +#define maddr_to_virt(pa) ((void *)((paddr_t)(pa) | XEN_VIRT_START))

Is this really XEN_VIRT_START? I.e. does your directmap start there,
right where the Xen image area also starts?

> +/* Convert between Xen-heap virtual addresses and machine frame numbers. */
> +#define __virt_to_mfn(va) (virt_to_maddr(va) >> PAGE_SHIFT)
> +#define __mfn_to_virt(mfn) (maddr_to_virt((paddr_t)(mfn) << PAGE_SHIFT))

Nit: Excess parentheses again.

> +/* Convert between Xen-heap virtual addresses and page-info structures. */
> +static inline struct page_info *virt_to_page(const void *v)
> +{
> +    BUG();
> +    return NULL;
> +}
> +
> +/*
> + * We define non-underscored wrappers for above conversion functions.
> + * These are overriden in various source files while underscored version
> + * remain intact.
> + */
> +#define virt_to_mfn(va)     __virt_to_mfn(va)
> +#define mfn_to_virt(mfn)    __mfn_to_virt(mfn)
> +
> +struct page_info
> +{
> +    /* Each frame can be threaded onto a doubly-linked list. */
> +    struct page_list_entry list;
> +
> +    /* Reference count and various PGC_xxx flags and fields. */
> +    unsigned long count_info;
> +
> +    /* Context-dependent fields follow... */
> +    union {
> +        /* Page is in use: ((count_info & PGC_count_mask) != 0). */
> +        struct {
> +            /* Type reference count and various PGT_xxx flags and fields. */
> +            unsigned long type_info;
> +        } inuse;
> +        /* Page is on a free list: ((count_info & PGC_count_mask) == 0). */
> +        union {
> +            struct {
> +                /*
> +                 * Index of the first *possibly* unscrubbed page in the buddy.
> +                 * One more bit than maximum possible order to accommodate
> +                 * INVALID_DIRTY_IDX.
> +                 */
> +#define INVALID_DIRTY_IDX ((1UL << (MAX_ORDER + 1)) - 1)
> +                unsigned long first_dirty:MAX_ORDER + 1;
> +
> +                /* Do TLBs need flushing for safety before next page use? */
> +                bool need_tlbflush:1;
> +
> +#define BUDDY_NOT_SCRUBBING    0
> +#define BUDDY_SCRUBBING        1
> +#define BUDDY_SCRUB_ABORT      2
> +                unsigned long scrub_state:2;
> +            };
> +
> +            unsigned long val;
> +            } free;

Something's wrong with indentation here.

> +    } u;
> +
> +    union {
> +        /* Page is in use, but not as a shadow. */
> +        struct {
> +            /* Owner of this page (zero if page is anonymous). */
> +            struct domain *domain;
> +        } inuse;
> +
> +        /* Page is on a free list. */
> +        struct {
> +            /* Order-size of the free chunk this page is the head of. */
> +            unsigned int order;
> +        } free;
> +
> +    } v;
> +
> +    union {
> +        /*
> +         * Timestamp from 'TLB clock', used to avoid extra safety flushes.
> +         * Only valid for: a) free pages, and b) pages with zero type count
> +         */
> +        u32 tlbflush_timestamp;

Nit: uint32_t and ...

> +    };
> +    u64 pad;

... uint64_t please in new code. Assuming, for the latter, you really need
the field in the first place: I can't see what it's needed for.

> +};
> +
> +#define frame_table ((struct page_info *)FRAMETABLE_VIRT_START)
> +
> +/* PDX of the first page in the frame table. */
> +extern unsigned long frametable_base_pdx;
> +
> +/* Convert between machine frame numbers and page-info structures. */
> +#define mfn_to_page(mfn)                                            \
> +    (frame_table + (mfn_to_pdx(mfn) - frametable_base_pdx))
> +#define page_to_mfn(pg)                                             \
> +    pdx_to_mfn((unsigned long)((pg) - frame_table) + frametable_base_pdx)
> +
> +static inline void *page_to_virt(const struct page_info *pg)
> +{
> +    return mfn_to_virt(mfn_x(page_to_mfn(pg)));
> +}
> +
> +/*
> + * Common code requires get_page_type and put_page_type.
> + * We don't care about typecounts so we just do the minimum to make it
> + * happy.
> + */
> +static inline int get_page_type(struct page_info *page, unsigned long type)
> +{
> +    return 1;
> +}
> +
> +static inline void put_page_type(struct page_info *page)
> +{
> +    return;

No need for this; the body can ve entirely empty, as we have it elsewhere.

> +}
> +
> +/* TODO */
> +static inline bool get_page_nr(struct page_info *page, const struct domain *domain,
> +                        unsigned long nr)
> +{
> +    BUG();
> +}
> +static inline void put_page_nr(struct page_info *page, unsigned long nr)
> +{
> +    BUG();
> +}

What are these two needed for?

> +static inline void put_page_and_type(struct page_info *page)
> +{
> +    put_page_type(page);
> +    put_page(page);
> +}
> +
> +/*
> + * RISCV does not have an M2P, but common code expects a handful of
> + * M2P-related defines and functions. Provide dummy versions of these.
> + */
> +#define INVALID_M2P_ENTRY        (~0UL)
> +#define SHARED_M2P_ENTRY         (~0UL - 1UL)
> +#define SHARED_M2P(_e)           ((_e) == SHARED_M2P_ENTRY)
> +
> +/* Xen always owns P2M on PPC */

PPC?

> +#define set_gpfn_from_mfn(mfn, pfn) do { (void) (mfn), (void)(pfn); } while (0)
> +#define mfn_to_gfn(d, mfn) ((void)(d), _gfn(mfn_x(mfn)))
> +
> +#define PDX_GROUP_SHIFT (16 + 5)
> +
> +static inline unsigned long domain_get_maximum_gpfn(struct domain *d)
> +{
> +    BUG();
> +    return 0;
> +}
> +
> +static inline long arch_memory_op(int op, XEN_GUEST_HANDLE_PARAM(void) arg)
> +{
> +    BUG();
> +    return 0;
> +}
> +
> +/*
> + * On RISCV, all the RAM is currently direct mapped in Xen.
> + * Hence return always true.
> + */
> +static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
> +{
> +    return true;
> +}
> +
> +#define PG_shift(idx)   (BITS_PER_LONG - (idx))
> +#define PG_mask(x, idx) (x ## UL << PG_shift(idx))
> +
> +#define PGT_none          PG_mask(0, 1)  /* no special uses of this page   */
> +#define PGT_writable_page PG_mask(1, 1)  /* has writable mappings?         */
> +#define PGT_type_mask     PG_mask(1, 1)  /* Bits 31 or 63.                 */
> +
> + /* Count of uses of this frame as its current type. */
> +#define PGT_count_width   PG_shift(2)
> +#define PGT_count_mask    ((1UL<<PGT_count_width)-1)
> +
> +/*
> + * Page needs to be scrubbed. Since this bit can only be set on a page that is
> + * free (i.e. in PGC_state_free) we can reuse PGC_allocated bit.
> + */
> +#define _PGC_need_scrub   _PGC_allocated
> +#define PGC_need_scrub    PGC_allocated
> +
> +//  /* Cleared when the owning guest 'frees' this page. */
> +#define _PGC_allocated    PG_shift(1)
> +#define PGC_allocated     PG_mask(1, 1)
> +  /* Page is Xen heap? */
> +#define _PGC_xen_heap     PG_shift(2)
> +#define PGC_xen_heap      PG_mask(1, 2)
> +#ifdef CONFIG_STATIC_MEMORY
> +/* Page is static memory */
> +#define _PGC_static    PG_shift(3)
> +#define PGC_static     PG_mask(1, 3)
> +#else
> +#define PGC_static     0
> +#endif

Please omit this until you really know whether you're going to support
static memory.

> +/* ... */

???

> +/* Page is broken? */
> +#define _PGC_broken       PG_shift(7)
> +#define PGC_broken        PG_mask(1, 7)
> + /* Mutually-exclusive page states: { inuse, offlining, offlined, free }. */
> +#define PGC_state         PG_mask(3, 9)
> +#define PGC_state_inuse   PG_mask(0, 9)
> +#define PGC_state_offlining PG_mask(1, 9)
> +#define PGC_state_offlined PG_mask(2, 9)
> +#define PGC_state_free    PG_mask(3, 9)
> +// #define page_state_is(pg, st) (((pg)->count_info&PGC_state) == PGC_state_##st)
> +
> +/* Count of references to this frame. */
> +#define PGC_count_width   PG_shift(9)
> +#define PGC_count_mask    ((1UL<<PGC_count_width)-1)
> +
> +#define page_state_is(pg, st) (((pg)->count_info&PGC_state) == PGC_state_##st)
> +
> +#define _PGC_extra        PG_shift(10)
> +#define PGC_extra         PG_mask(1, 10)
> +
> +#define is_xen_heap_page(page) ((page)->count_info & PGC_xen_heap)
> +#define is_xen_heap_mfn(mfn) \
> +    (mfn_valid(mfn) && is_xen_heap_page(mfn_to_page(mfn)))
> +
> +#define is_xen_fixed_mfn(mfn)                                   \
> +    ((mfn_to_maddr(mfn) >= virt_to_maddr(&_start)) &&           \
> +     (mfn_to_maddr(mfn) <= virt_to_maddr((vaddr_t)_end - 1)))
> +
> +#define page_get_owner(_p)    (_p)->v.inuse.domain
> +#define page_set_owner(_p,_d) ((_p)->v.inuse.domain = (_d))
> +
> +/* TODO: implement */
> +#define mfn_valid(mfn) ({ (void) (mfn); 0; })
> +// #define max_page (0UL)

???

> +#define mfn_to_gfn(d, mfn) ((void)(d), _gfn(mfn_x(mfn)))
> +
> +#define domain_set_alloc_bitsize(d) ((void)0)
> +#define domain_clamp_alloc_bitsize(d, b) (b)
> +
> +#define PFN_ORDER(_pfn) ((_pfn)->v.free.order)

No leading underscore needed here, I suppose.

Jan

