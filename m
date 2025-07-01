Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6F3AEFB27
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jul 2025 15:49:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029747.1403482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWbMY-0007mG-2f; Tue, 01 Jul 2025 13:49:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029747.1403482; Tue, 01 Jul 2025 13:49:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWbMX-0007k3-W1; Tue, 01 Jul 2025 13:49:29 +0000
Received: by outflank-mailman (input) for mailman id 1029747;
 Tue, 01 Jul 2025 13:49:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=28IZ=ZO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uWbMW-0007jx-1f
 for xen-devel@lists.xenproject.org; Tue, 01 Jul 2025 13:49:28 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 32c49e97-5682-11f0-a313-13f23c93f187;
 Tue, 01 Jul 2025 15:49:24 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a522224582so2987271f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Jul 2025 06:49:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-318c13a20eesm11891181a91.15.2025.07.01.06.49.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jul 2025 06:49:23 -0700 (PDT)
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
X-Inumbo-ID: 32c49e97-5682-11f0-a313-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751377764; x=1751982564; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=T/uKdW1LP2fSumxjsHgMZn6qZZg6ICRullBpD3vr3ps=;
        b=H1wwd6HcR09jm9JG/UavQ9aBG/EjTEbDscTueHJSaYIW2sP+VM+p8r0X66+XCoj8Bm
         /8Etuh6QCz9qFZKgaWGFjllMux+ttM7Sd6gOl4RjuI5xs+Occ20i8axUM05CMKVjglgb
         RtcgQQ/TVoOAyA2Jg1S83uOfu/aUX33z4j8QvFaM+Ri1b9pra3j0pwWzVkiPD3SiZ74G
         EdErkNtex1dYUJ6/fyU8LqJfyiYAueXFB9y+weYefm4BdoKkbL7HGJZwyXURkGdLQpgr
         VgXakyhKIOkvaBUUYpFQefNoFgpXOS3GkhG5utv25D2MaN0WSXQPJ0iqOeAMPHZgewJ+
         5h5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751377764; x=1751982564;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T/uKdW1LP2fSumxjsHgMZn6qZZg6ICRullBpD3vr3ps=;
        b=Z6ZGua8beZJ8pOc1DH/nP9Y0oD7c5+UYTgU6rrLvs2mavugnD5iKx6W5BEjZxGOHPI
         l2qtoBRHhOKp+YfeIuW+hGLMVMIIKzl4giAz/WdisRnBHPtCEKo07KqSY247w8IiRfxH
         pYfrJ0oIiT9kuITpUvt84fKRlF/L6cSE0JKzfbzGQYV0XAsGBub/Lf5IVrIO27vVgdkt
         PuBI1Uy+6EzFdhtZbR6z3JukPmtU58Y5j/n2bCLpEyL3uQ62CFhWfpkupGzQCqSscnCT
         iQIh58IIGjPuzLoJt1Qakp1unTDk7gVr9HjAVQEZB9y/7UO+4wClTUiaTn36+4asydFv
         OnyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUb6DglkECBpmDpCcDiTgcnNLm6E6BCV2aYHfJPFi1S7WTcsEcG6FI08Z1ib6/5nFXGDwA4zZfrJQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxkDfL8gainiwoT2LFGCd1EdfDdICZjdU59D8SqjeRboBVuge6S
	t8wNie/kuV5j3PZTgU+iJBbREj4FGvHDkoEQZ8rlUMzBF5YdZ7SkVI/7Tsh2dRTFpw==
X-Gm-Gg: ASbGncuVa95bo7R1+0MBVRUb61XmOh521wdGeRtpIPoOTs6KpMy/w9Z8QhMHyqEmCSd
	dwSDp21IY+8XwlxjfLktdXKPHmgKmebZIh/2JzyJh3N8jlp7EICoFOafVYhlOtN3csp9+UUrLPX
	0wisq9zvJ1+lP7n2hkVCWAqZB/K1fX3X/12z5uycei62H5p+3CT9oTP/IjkhCXYfzWhxcJqAgsT
	u5PMieYA6DiduiTSutVOSJ++uR7I4zlgNAMidlSDi9TnRiRP7ffQKdq2jJE3xDF4ojOBR3Dyltp
	OuEH3nHtLgNgjKzMxFalWoq8EsxTDOoWTHjaw2DuSMZxB1N6O9G3bn6c05dTJhJ0X29wVOhr+FF
	3en2pdaofKE/2wUg3r1kR7IqFcwOCkwt++YhhBl9HCF8HgVcSOCObXorawg==
X-Google-Smtp-Source: AGHT+IFLif6DNHrszGljre+9uc1aUVlQUIkEecNLCkyWJIrj5fsQId+U5nkDrQc7jxt1RpUchh5LOg==
X-Received: by 2002:a05:6000:70a:b0:3a5:8cdd:c174 with SMTP id ffacd0b85a97d-3a8fea7a5fbmr14183887f8f.26.1751377763797;
        Tue, 01 Jul 2025 06:49:23 -0700 (PDT)
Message-ID: <31811dbc-5fe8-487b-95d4-dd7f5f0868b3@suse.com>
Date: Tue, 1 Jul 2025 15:49:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/17] xen/riscv: implement p2m_set_entry() and
 __p2m_set_entry()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <7826732d2f6aa5888758942165f0f1e73fa84ffa.1749555949.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <7826732d2f6aa5888758942165f0f1e73fa84ffa.1749555949.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.06.2025 15:05, Oleksii Kurochko wrote:
> This patch introduces p2m_set_entry() and its core helper __p2m_set_entry() for
> RISC-V, based loosely on the Arm implementation, with several RISC-V-specific
> modifications.
> 
> Key differences include:
> - TLB Flushing: RISC-V allows caching of invalid PTEs and does not require
>   break-before-make (BBM). As a result, the flushing logic is simplified.
>   TLB invalidation can be deferred until p2m_write_unlock() is called.
>   Consequently, the p2m->need_flush flag is always considered true and is
>   removed.
> - Page Table Traversal: The order of walking the page tables differs from Arm,
>   and this implementation reflects that reversed traversal.
> - Macro Adjustments: The macros P2M_ROOT_LEVEL, P2M_ROOT_ORDER, and
>   P2M_ROOT_PAGES are updated to align with the new RISC-V implementation.
> 
> The main functionality is in __p2m_set_entry(), which handles mappings aligned
> to page table block entries (e.g., 1GB, 2MB, or 4KB with 4KB granularity).
> 
> p2m_set_entry() breaks a region down into block-aligned mappings and calls
> __p2m_set_entry() accordingly.
> 
> Stub implementations (to be completed later) include:
> - p2m_free_entry()

What would a function of this name do? You can clear entries, but you can't
free them, can you?

> --- a/xen/arch/riscv/include/asm/p2m.h
> +++ b/xen/arch/riscv/include/asm/p2m.h
> @@ -9,8 +9,13 @@
>  #include <xen/rwlock.h>
>  #include <xen/types.h>
>  
> +#include <asm/page.h>
>  #include <asm/page-bits.h>
>  
> +#define P2M_ROOT_LEVEL  HYP_PT_ROOT_LEVEL
> +#define P2M_ROOT_ORDER  XEN_PT_LEVEL_ORDER(P2M_ROOT_LEVEL)

This is confusing, as in patch 6 we see that p2m root table order is 2.
Something needs doing about the naming, so the two sets of things can't
be confused.

> @@ -49,6 +54,17 @@ struct p2m_domain {
>  
>      /* Current VMID in use */
>      uint16_t vmid;
> +
> +    /* Highest guest frame that's ever been mapped in the p2m */
> +    gfn_t max_mapped_gfn;
> +
> +    /*
> +     * Lowest mapped gfn in the p2m. When releasing mapped gfn's in a
> +     * preemptible manner this is update to track recall where to
> +     * resume the search. Apart from during teardown this can only
> +     * decrease.
> +     */
> +    gfn_t lowest_mapped_gfn;

When you copied the comment, you surely read it. Yet you copied pretty
obvious flaws as-is. That is s/update/updated/, and something wants
doing about "track recall", which makes no sense to me.

> --- a/xen/arch/riscv/p2m.c
> +++ b/xen/arch/riscv/p2m.c
> @@ -231,6 +231,8 @@ int p2m_init(struct domain *d)
>      INIT_PAGE_LIST_HEAD(&p2m->pages);
>  
>      p2m->vmid = INVALID_VMID;
> +    p2m->max_mapped_gfn = _gfn(0);
> +    p2m->lowest_mapped_gfn = _gfn(ULONG_MAX);
>  
>      p2m->default_access = p2m_access_rwx;
>  
> @@ -325,6 +327,214 @@ int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
>      return 0;
>  }
>  
> +/*
> + * Find and map the root page table. The caller is responsible for
> + * unmapping the table.
> + *
> + * The function will return NULL if the offset of the root table is
> + * invalid.

Don't you mean "offset into ..."?

> + */
> +static pte_t *p2m_get_root_pointer(struct p2m_domain *p2m, gfn_t gfn)
> +{
> +    unsigned long root_table_indx;
> +
> +    root_table_indx = gfn_x(gfn) >> XEN_PT_LEVEL_ORDER(P2M_ROOT_LEVEL);
> +    if ( root_table_indx >= P2M_ROOT_PAGES )
> +        return NULL;
> +
> +    return __map_domain_page(p2m->root + root_table_indx);
> +}
> +
> +static inline bool p2me_is_valid(struct p2m_domain *p2m, pte_t pte)

The rule of thumb is to have inline functions only in header files, leaving
decisions to the compiler elsewhere.

> +{
> +    panic("%s: isn't implemented for now\n", __func__);
> +
> +    return false;
> +}

For this function in particular, though: Besides the "p2me" in the name
being somewhat odd (supposedly page table entries here are simply pte_t),
how is this going to be different from pte_is_valid()?

> +static inline void p2m_write_pte(pte_t *p, pte_t pte, bool clean_pte)
> +{
> +    write_pte(p, pte);
> +    if ( clean_pte )
> +        clean_dcache_va_range(p, sizeof(*p));
> +}
> +
> +static inline void p2m_remove_pte(pte_t *p, bool clean_pte)
> +{
> +    pte_t pte;
> +
> +    memset(&pte, 0x00, sizeof(pte));
> +    p2m_write_pte(p, pte, clean_pte);
> +}

May I suggest "clear" instead of "remove" and plain 0 instead of 0x00
(or simply give the variable a trivial initializer)?

As to the earlier function that I commented on: Seeing the names here,
wouldn't p2m_pte_is_valid() be a more consistent name there?

> +static pte_t p2m_entry_from_mfn(struct p2m_domain *p2m, mfn_t mfn,
> +                                p2m_type_t t, p2m_access_t a)
> +{
> +    panic("%s: hasn't been implemented yet\n", __func__);
> +
> +    return (pte_t) { .pte = 0 };
> +}

And then perhaps p2m_pte_from_mfn() here?

> +#define GUEST_TABLE_MAP_NONE 0
> +#define GUEST_TABLE_MAP_NOMEM 1
> +#define GUEST_TABLE_SUPER_PAGE 2
> +#define GUEST_TABLE_NORMAL 3

Is GUEST_ a good prefix? The guest doesn't control these tables, and the
word could also mean the guest's own page tables.

> +/*
> + * Take the currently mapped table, find the corresponding GFN entry,

That's not what you mean though, is it? It's more like "the entry
corresponding to the GFN" (implying "at the given level").

> + * and map the next table, if available. The previous table will be
> + * unmapped if the next level was mapped (e.g GUEST_TABLE_NORMAL
> + * returned).
> + *
> + * `alloc_tbl` parameter indicates whether intermediate tables should
> + * be allocated when not present.
> + *
> + * Return values:
> + *  GUEST_TABLE_MAP_NONE: a table allocation isn't permitted.
> + *  GUEST_TABLE_MAP_NOMEM: allocating a new page failed.
> + *  GUEST_TABLE_SUPER_PAGE: next level or leaf mapped normally.
> + *  GUEST_TABLE_NORMAL: The next entry points to a superpage.
> + */
> +static int p2m_next_level(struct p2m_domain *p2m, bool alloc_tbl,
> +                          unsigned int level, pte_t **table,
> +                          unsigned int offset)
> +{
> +    panic("%s: hasn't been implemented yet\n", __func__);
> +
> +    return GUEST_TABLE_MAP_NONE;
> +}
> +
> +/* Free pte sub-tree behind an entry */
> +static void p2m_free_entry(struct p2m_domain *p2m,
> +                           pte_t entry, unsigned int level)
> +{
> +    panic("%s: hasn't been implemented yet\n", __func__);
> +}
> +
> +/*
> + * Insert an entry in the p2m. This should be called with a mapping
> + * equal to a page/superpage.
> + */
> +static int __p2m_set_entry(struct p2m_domain *p2m,

No double leading underscores, please. A single one is fine and will do.

> +                           gfn_t sgfn,
> +                           unsigned int page_order,
> +                           mfn_t smfn,

What are the "s" in "sgfn" and "smfn" indicating? Possibly "start", except
that you don't process multiple GFNs here (unlike in the caller).

> +                           p2m_type_t t,
> +                           p2m_access_t a)
> +{
> +    unsigned int level;
> +    unsigned int target = page_order / PAGETABLE_ORDER;
> +    pte_t *entry, *table, orig_pte;
> +    int rc;
> +    /* A mapping is removed if the MFN is invalid. */
> +    bool removing_mapping = mfn_eq(smfn, INVALID_MFN);
> +    DECLARE_OFFSETS(offsets, gfn_to_gaddr(sgfn));
> +
> +    ASSERT(p2m_is_write_locked(p2m));
> +
> +    /*
> +     * Check if the level target is valid: we only support
> +     * 4K - 2M - 1G mapping.
> +     */
> +    ASSERT(target <= 2);

No provisions towards the division that produced the value having left
a remainder?

> +    table = p2m_get_root_pointer(p2m, sgfn);
> +    if ( !table )
> +        return -EINVAL;
> +
> +    for ( level = P2M_ROOT_LEVEL; level > target; level-- )
> +    {
> +        /*
> +         * Don't try to allocate intermediate page table if the mapping
> +         * is about to be removed.
> +         */
> +        rc = p2m_next_level(p2m, !removing_mapping,
> +                            level, &table, offsets[level]);
> +        if ( (rc == GUEST_TABLE_MAP_NONE) || (rc == GUEST_TABLE_MAP_NOMEM) )
> +        {
> +            /*
> +             * We are here because p2m_next_level has failed to map
> +             * the intermediate page table (e.g the table does not exist
> +             * and they p2m tree is read-only). It is a valid case
> +             * when removing a mapping as it may not exist in the
> +             * page table. In this case, just ignore it.
> +             */
> +            rc = removing_mapping ?  0 : -ENOENT;

Shouldn't GUEST_TABLE_MAP_NOMEM be transformed to -ENOMEM?

> +            goto out;
> +        }
> +        else if ( rc != GUEST_TABLE_NORMAL )

No need for "else" here.

> +            break;
> +    }
> +
> +    entry = table + offsets[level];
> +
> +    /*
> +     * If we are here with level > target, we must be at a leaf node,
> +     * and we need to break up the superpage.
> +     */
> +    if ( level > target )
> +    {
> +        panic("Shattering isn't implemented\n");
> +    }
> +
> +    /*
> +     * We should always be there with the correct level because
> +     * all the intermediate tables have been installed if necessary.
> +     */
> +    ASSERT(level == target);
> +
> +    orig_pte = *entry;
> +
> +    /*
> +     * The access type should always be p2m_access_rwx when the mapping
> +     * is removed.
> +     */
> +    ASSERT(!mfn_eq(INVALID_MFN, smfn) || (a == p2m_access_rwx));
> +
> +    if ( removing_mapping )
> +        p2m_remove_pte(entry, p2m->clean_pte);
> +    else {

Nit: Style.

> +        pte_t pte = p2m_entry_from_mfn(p2m, smfn, t, a);
> +
> +        p2m_write_pte(entry, pte, p2m->clean_pte);
> +
> +        p2m->max_mapped_gfn = gfn_max(p2m->max_mapped_gfn,
> +                                      gfn_add(sgfn, (1UL << page_order) - 1));
> +        p2m->lowest_mapped_gfn = gfn_min(p2m->lowest_mapped_gfn, sgfn);
> +    }
> +
> +#ifdef CONFIG_HAS_PASSTHROUGH

See my earlier comment regarding this kind of #ifdef.

> @@ -332,7 +542,55 @@ static int p2m_set_entry(struct p2m_domain *p2m,
>                           p2m_type_t t,
>                           p2m_access_t a)
>  {
> -    return -EOPNOTSUPP;
> +    int rc = 0;
> +
> +    /*
> +     * Any reference taken by the P2M mappings (e.g. foreign mapping) will
> +     * be dropped in relinquish_p2m_mapping(). As the P2M will still
> +     * be accessible after, we need to prevent mapping to be added when the
> +     * domain is dying.
> +     */
> +    if ( unlikely(p2m->domain->is_dying) )
> +        return -ENOMEM;

Why ENOMEM?

> +    while ( nr )

Why's there a loop here? The function name uses singular, i.e. means to
create exactly one entry.

> +    {
> +        unsigned long mask;
> +        unsigned long order = 0;

unsigned int?

> +        /* 1gb, 2mb, 4k mappings are supported */
> +        unsigned int i = ( P2M_ROOT_LEVEL > 2 ) ? 2 : P2M_ROOT_LEVEL;

Not (style): Excess blanks. Yet then aren't you open-coding min() here
anyway? Plus isn't P2M_ROOT_LEVEL always >= 2?

> +        /*
> +         * Don't take into account the MFN when removing mapping (i.e
> +         * MFN_INVALID) to calculate the correct target order.
> +         *
> +         * XXX: Support superpage mappings if nr is not aligned to a
> +         * superpage size.
> +         */

Does this really need leaving as a to-do?

> +        mask = !mfn_eq(smfn, INVALID_MFN) ? mfn_x(smfn) : 0;
> +        mask |= gfn_x(sgfn) | nr;
> +
> +        for ( ; i != 0; i-- )
> +        {
> +            if ( !(mask & (BIT(XEN_PT_LEVEL_ORDER(i), UL) - 1)) )
> +            {
> +                    order = XEN_PT_LEVEL_ORDER(i);
> +                    break;

Nit: Style.

> +            }
> +        }
> +
> +        rc = __p2m_set_entry(p2m, sgfn, order, smfn, t, a);
> +        if ( rc )
> +            break;
> +
> +        sgfn = gfn_add(sgfn, (1 << order));
> +        if ( !mfn_eq(smfn, INVALID_MFN) )
> +           smfn = mfn_add(smfn, (1 << order));
> +
> +        nr -= (1 << order);

Throughout maybe better be safe right away and use 1UL?

> +    }
> +
> +    return rc;
>  }

How's the caller going to know how much of the range was successfully
mapped? That part may need undoing (if not here, then in the caller),
or a caller may want to retry.

Jan

