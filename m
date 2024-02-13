Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA798532E1
	for <lists+xen-devel@lfdr.de>; Tue, 13 Feb 2024 15:20:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679918.1057714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZtdN-00031W-8H; Tue, 13 Feb 2024 14:19:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679918.1057714; Tue, 13 Feb 2024 14:19:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZtdN-0002zn-5W; Tue, 13 Feb 2024 14:19:41 +0000
Received: by outflank-mailman (input) for mailman id 679918;
 Tue, 13 Feb 2024 14:19:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W/Jz=JW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rZtdL-0002zh-Nk
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2024 14:19:39 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb8c4604-ca7a-11ee-8a4d-1f161083a0e0;
 Tue, 13 Feb 2024 15:19:38 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-411bfe83d11so4724155e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 13 Feb 2024 06:19:38 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 z17-20020a05600c221100b00411d1ce4f9dsm458180wml.34.2024.02.13.06.19.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Feb 2024 06:19:37 -0800 (PST)
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
X-Inumbo-ID: eb8c4604-ca7a-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707833978; x=1708438778; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q28WFJt1gUUX76ctbVk+6aRIcLNdBp2Id4KQAL34lb0=;
        b=OkCzWZQkcrmIEDF2nmWM85Wqa2XWnIUOqV+B4X2gsZpOjL6R0qo7VqkvvwkAdjttmj
         rFJJo6PSId13geWSktVeMZ6jMQlFGf2bG3Z6WJpePF2MkWoGa6/OrJDKGjTvn7yABDNm
         YfT+0GI2dQFhn1wnX6YqEgSePwueO7qu5aZdvxDiidV3mE5ONLtEGG5UMBkYqsHaNEhM
         eeNs/LRzYiSECsPoAiPR+aLBDqLD306p1KPLfrI+tkCsKTJLjBRzPYYb8aE+p3U5CDgz
         JirD3jPyEWpbtbvTG6OovkiEyqD2BF4/3cfg3vtAHLCkiwtsXbvg3L6jExvxV+WgM7VD
         4mOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707833978; x=1708438778;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q28WFJt1gUUX76ctbVk+6aRIcLNdBp2Id4KQAL34lb0=;
        b=sl/4oV+wFYxMgR/BYFLPxPeaR7zseu1OEav76AHkkQKBikGwo0zA2Q2RN8ApR6PVjR
         lO1GvtxDRYLMhCNhxG0U4GFY/7X5CoGyVsTNgjBeHYXtYHb8dq8S0Ycq0nvLxKPoPa1z
         dpkH0fyGnkonarl46zoy/24rbkFcoXuenf3mW4oT/yTg1yurvKb9/4xZexRfsAfISKIC
         zriSVME7AAVFnw5WfMsjfJcbYTbRi04engaDhN1KeScYmjCpRT5N3Y2VyFBvbas2XZPD
         tn7UhPQCyCjCy7n1FhwwnvJlrcefv+9T5M81VJWGxsmFDLHrUuG/QP5KzYc2iJ7sqswu
         MsdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVoySzY4xY3aH0D2B7gAqAeyPa4HMcdWXtlI3Ci2lTvsO/kIMVcLRRw18OXBPEV408/WU/G33WzNoKASKIZEYLGTjMLilJSFGWZJ96Ouw=
X-Gm-Message-State: AOJu0YydIv1sBmQEr9r3e8/xdG0YmrSx7uu5LRFh4wtJec+DltfWZrtn
	+hywEs6bC7HwY4uJSA7aZEIUOI6P0EwqqwvAEopJPms5rAJedIWyibSbsFOa+w==
X-Google-Smtp-Source: AGHT+IFwl/QOPMjPGYr06ECinbuGCEvvReSAXMzYp8VgkZtWMRcMs1iWMZapu42zQ8mqirAN/05VDQ==
X-Received: by 2002:a05:600c:470d:b0:40e:dbdf:9fb4 with SMTP id v13-20020a05600c470d00b0040edbdf9fb4mr8920640wmo.23.1707833977687;
        Tue, 13 Feb 2024 06:19:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW47c1Wmyuw0FQ5fzOVt2h8RAZe5yaTYEF+6Hg5ijmoMZG1SO0EVsbVWS59gQBJCq0PBOHNAZCj1l8Mab0OiwdNBG9vaq3WuTzDBs1p5YGw1MOtfGJ1GmyyqLe/7z+aFjPipNeXF03RuWTvB2hVfHxm8sYA4iNrYv84NURVbBIY0FwStHOe5t577ZC+ev4pd8gLoQyO4cFm63ezcCXGUDtC5t8P0+1KSPZZyKgFJxSw3Yhc0vEIzjxUfeZ2d4+P4HQl2Tr5kh+cY6YyFmpZEGmo6mKcTZ9on8wpTOHnZS25zZXSd9T7y1s=
Message-ID: <6f5e7e21-067e-4323-88bc-f9b5975e95c5@suse.com>
Date: Tue, 13 Feb 2024 15:19:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 26/30] xen/riscv: add minimal stuff to mm.h to build
 full Xen
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
 <369fe9e80d11c5e499810a6819fc1c282ce60628.1707146506.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <369fe9e80d11c5e499810a6819fc1c282ce60628.1707146506.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.02.2024 16:32, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V4:
>  - update an argument name of PFN_ORDERN macros.
>  - drop pad at the end of 'struct page_info'.
>  - Change message -> subject in "Changes in V3"
>  - delete duplicated macros from riscv/mm.h
>  - fix identation in struct page_info

I'm sorry, but how does this fit ...

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
> +                unsigned long val;

... this?

> +        } free;
> +    } u;
> +
> +    union {
> +        /* Page is in use, but not as a shadow. */

I'm also pretty sure I asked before what shadow this comment alludes to.

> +        struct {
> +            /* Owner of this page (zero if page is anonymous). */
> +            struct domain *domain;

Seeing this is a pointer, I find "zero" in the comment a little
misleading. Better say NULL?

> +        } inuse;
> +
> +        /* Page is on a free list. */
> +        struct {
> +            /* Order-size of the free chunk this page is the head of. */
> +            unsigned int order;
> +        } free;
> +    } v;
> +
> +    union {
> +        /*
> +         * Timestamp from 'TLB clock', used to avoid extra safety flushes.
> +         * Only valid for: a) free pages, and b) pages with zero type count
> +         */
> +        uint32_t tlbflush_timestamp;
> +    };
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

Would be nice if this and the inverse function would live closer to
one another.

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
> +}
> +
> +static inline void put_page_and_type(struct page_info *page)
> +{
> +    put_page_type(page);
> +    put_page(page);
> +}
> +
> +/*
> + * RISC-V does not have an M2P, but common code expects a handful of
> + * M2P-related defines and functions. Provide dummy versions of these.
> + */
> +#define INVALID_M2P_ENTRY        (~0UL)
> +#define SHARED_M2P_ENTRY         (~0UL - 1UL)
> +#define SHARED_M2P(_e)           ((_e) == SHARED_M2P_ENTRY)
> +
> +#define set_gpfn_from_mfn(mfn, pfn) do { (void)(mfn), (void)(pfn); } while (0)
> +#define mfn_to_gfn(d, mfn) ((void)(d), _gfn(mfn_x(mfn)))
> +
> +#define PDX_GROUP_SHIFT (16 + 5)

Where are these magic numbers coming from? None of the other three
architectures use literal numbers here, thus making clear what
values are actually meant. If you can't use suitable constants,
please add a comment.

> +static inline unsigned long domain_get_maximum_gpfn(struct domain *d)
> +{
> +    BUG_ON("unimplemented");
> +    return 0;
> +}
> +
> +static inline long arch_memory_op(int op, XEN_GUEST_HANDLE_PARAM(void) arg)
> +{
> +    BUG_ON("unimplemented");
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

Imo the PGC_ related revision log item should have covered this one, too.

> +#define PGT_count_width   PG_shift(2)
> +#define PGT_count_mask    ((1UL << PGT_count_width) - 1)
> +
> +/*
> + * Page needs to be scrubbed. Since this bit can only be set on a page that is
> + * free (i.e. in PGC_state_free) we can reuse PGC_allocated bit.
> + */
> +#define _PGC_need_scrub   _PGC_allocated
> +#define PGC_need_scrub    PGC_allocated
> +
> +/* Cleared when the owning guest 'frees' this page. */
> +#define _PGC_allocated    PG_shift(1)
> +#define PGC_allocated     PG_mask(1, 1)
> +/* Page is Xen heap? */
> +#define _PGC_xen_heap     PG_shift(2)
> +#define PGC_xen_heap      PG_mask(1, 2)
> +/* Page is broken? */
> +#define _PGC_broken       PG_shift(7)
> +#define PGC_broken        PG_mask(1, 7)
> +/* Mutually-exclusive page states: { inuse, offlining, offlined, free }. */
> +#define PGC_state         PG_mask(3, 9)
> +#define PGC_state_inuse   PG_mask(0, 9)
> +#define PGC_state_offlining PG_mask(1, 9)
> +#define PGC_state_offlined PG_mask(2, 9)
> +#define PGC_state_free    PG_mask(3, 9)
> +#define page_state_is(pg, st) (((pg)->count_info&PGC_state) == PGC_state_##st)
> +
> +/* Count of references to this frame. */
> +#define PGC_count_width   PG_shift(9)
> +#define PGC_count_mask    ((1UL << PGC_count_width) - 1)
> +
> +#define _PGC_extra        PG_shift(10)
> +#define PGC_extra         PG_mask(1, 10)
> +
> +#define is_xen_heap_page(page) ((page)->count_info & PGC_xen_heap)
> +#define is_xen_heap_mfn(mfn) \
> +    (mfn_valid(mfn) && is_xen_heap_page(mfn_to_page(mfn)))
> +
> +#define is_xen_fixed_mfn(mfn)                                   \
> +    ((mfn_to_maddr(mfn) >= virt_to_maddr((vaddr_t)_start)) &&   \
> +     (mfn_to_maddr(mfn) <= virt_to_maddr((vaddr_t)_end - 1)))
> +
> +#define page_get_owner(_p)    (_p)->v.inuse.domain
> +#define page_set_owner(_p,_d) ((_p)->v.inuse.domain = (_d))

Unnecessary (leading) underscores again.

Jan

