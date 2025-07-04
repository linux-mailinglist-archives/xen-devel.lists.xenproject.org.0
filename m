Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5676AF962B
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 17:02:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1033446.1406807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXhvN-0007JF-IX; Fri, 04 Jul 2025 15:02:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1033446.1406807; Fri, 04 Jul 2025 15:02:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXhvN-0007Gk-FK; Fri, 04 Jul 2025 15:02:01 +0000
Received: by outflank-mailman (input) for mailman id 1033446;
 Fri, 04 Jul 2025 15:01:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+0l=ZR=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uXhvL-0007Ge-M4
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 15:01:59 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d3fc603a-58e7-11f0-a315-13f23c93f187;
 Fri, 04 Jul 2025 17:01:56 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-60cc11b34f6so3474701a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 04 Jul 2025 08:01:56 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae3f6ac373fsm187364066b.79.2025.07.04.08.01.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jul 2025 08:01:54 -0700 (PDT)
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
X-Inumbo-ID: d3fc603a-58e7-11f0-a315-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751641316; x=1752246116; darn=lists.xenproject.org;
        h=in-reply-to:content-language:references:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pA2iaEPpHVQRXL7ofdLmY5p/yOi7obKq04hAJy7nITk=;
        b=Vz6Qea2hUA1LPOrBe2lDvXQgI+Htv+BDI3juROEdHPh/odx33x0eJltnX6nr5BoDH6
         enMnict5uEOSLNTAfFvjgiDQxsFwX8OjGLaU8OOkJ/GgKSznWobZjo12lPe8+n5Nhj6V
         Jle2lINhUkyvPSfoAJyyqOYjEOjQK4exnJqq6VJdT4YGLg0ZvHGJ36nKlXsYhD6dbxu9
         egwbQV8fD46aO7S1JIDK7j9HGlahNGLa8mtMWyYQfiA7nTCdAYW2UgVCHO8D4PqyAhan
         IVcFJXlDkmdchhv+oYrsIUqGF1f6ICNUhJWCc3bGveyAGEWnlavk4sX8sQSHI5u91e/k
         O/ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751641316; x=1752246116;
        h=in-reply-to:content-language:references:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pA2iaEPpHVQRXL7ofdLmY5p/yOi7obKq04hAJy7nITk=;
        b=gf1mBgfAWnMC9KZpm01a8DrudM6lc4GeNAKHfogS8rFXyUsZf3n2DX/0TLnEehaU8D
         UiU5tHZ/Y0Lgic6xMlEBidKRXxhblDajLGJLSJhMDVJGd/nU4PvZhSC+SOslVokmj6QV
         7C0vRSqr1OUbEAM5vz75qgBtSi4u4SmDKpLV/5vywzV34E+Rs6dvIjB18h6BDx9oBLF/
         51pJM+8tQKkbwOlllvBqM1QsUzxQQb1PXVmahojbj9SDD7l8UTM3T9Aniw+ec614BTRG
         428kdGBi3FfUH7+/zMhDLdudCXuUAXqxUZpEA/ncXpCKD5PtxvfBr6A/iSTNnbAyUwHj
         dIcA==
X-Forwarded-Encrypted: i=1; AJvYcCVNAqRctinvtlcXZNQUJDPfGIVvwfSW3bLdBdZEhLL8sP/VShH1lcJHao8s3b3gxLO+YEPxYIzAj5M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxBhRXlLCJq/alKYd7u2cap6irFSfmIPfwH30mvEbuSAHcOuNXs
	ki/bL2+x2uf9+cXMkL+H34aqk9vLDEXmAGFidismTAmuUFRAnrm1ZMU7
X-Gm-Gg: ASbGncspWsXJRczMNItfFvMJbanDm5ds2WkHnzAi2IE16ib6827llbBwdwh+sIwUAWB
	VNTICWOYos3Fyzo7cIu9WMQi2C/JT59FQq9QusXDS6ahndIpaaYWA41a9EGYu4+gPdbzE49AeJt
	uhgjmJK8bVH00rjqVSFnZOGmFEk/hjd2OChBZXuOfPUDB4hk23uKL+ww8GZwpllZQhWBlBt5coC
	UwCLQkkF8uCa5oz0EcJ1f9HG3r7RTsovHZm38TgABpNmu51ZnA7B8yK2+4dPXxMRg9yUV2psRPq
	jaf1EUY8ABOyD4jSPQlcqVHypH/5pYPielL3LceMa/rK6xFQWPdvU42j44dt7REYq/kYm0QZbrb
	yDaJBpuKDLHKkhgjORqgla8GPxEKsg+MORn8=
X-Google-Smtp-Source: AGHT+IGpqEaLNflVeZMQkiE4MLfkcrTm2eLFCFrD2ogPMfmVW4LPEpQDjCjuDJxonyqR7rDaXGbPAg==
X-Received: by 2002:a17:906:f049:b0:ae3:c777:6e5e with SMTP id a640c23a62f3a-ae3f9ccd7bbmr300137566b.19.1751641314952;
        Fri, 04 Jul 2025 08:01:54 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------gW10OHkRVFayPL0mOXcoX00U"
Message-ID: <674c9f82-f486-4cca-991b-3ac3da3a237d@gmail.com>
Date: Fri, 4 Jul 2025 17:01:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v2 11/17] xen/riscv: implement p2m_set_entry() and
 __p2m_set_entry()
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <7826732d2f6aa5888758942165f0f1e73fa84ffa.1749555949.git.oleksii.kurochko@gmail.com>
 <31811dbc-5fe8-487b-95d4-dd7f5f0868b3@suse.com>
Content-Language: en-US
In-Reply-To: <31811dbc-5fe8-487b-95d4-dd7f5f0868b3@suse.com>

This is a multi-part message in MIME format.
--------------gW10OHkRVFayPL0mOXcoX00U
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 7/1/25 3:49 PM, Jan Beulich wrote:
> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>> This patch introduces p2m_set_entry() and its core helper __p2m_set_entry() for
>> RISC-V, based loosely on the Arm implementation, with several RISC-V-specific
>> modifications.
>>
>> Key differences include:
>> - TLB Flushing: RISC-V allows caching of invalid PTEs and does not require
>>    break-before-make (BBM). As a result, the flushing logic is simplified.
>>    TLB invalidation can be deferred until p2m_write_unlock() is called.
>>    Consequently, the p2m->need_flush flag is always considered true and is
>>    removed.
>> - Page Table Traversal: The order of walking the page tables differs from Arm,
>>    and this implementation reflects that reversed traversal.
>> - Macro Adjustments: The macros P2M_ROOT_LEVEL, P2M_ROOT_ORDER, and
>>    P2M_ROOT_PAGES are updated to align with the new RISC-V implementation.
>>
>> The main functionality is in __p2m_set_entry(), which handles mappings aligned
>> to page table block entries (e.g., 1GB, 2MB, or 4KB with 4KB granularity).
>>
>> p2m_set_entry() breaks a region down into block-aligned mappings and calls
>> __p2m_set_entry() accordingly.
>>
>> Stub implementations (to be completed later) include:
>> - p2m_free_entry()
> What would a function of this name do?

Recursively visiting all leaf PTE's for sub-tree behind an entry, then calls
put_page() (which will free if there is no any reference to this page),
freeing intermediate page table (after all entries were freed) by removing
it from d->arch.paging.freelist, and removes correspondent page of intermediate page
table from p2m->pages list.

> You can clear entries, but you can't
> free them, can you?

Is is a question regarding terminology? I can't free entry itself, but a page table or
a page (if it is a leaf entry) on which it points could free.

>> --- a/xen/arch/riscv/include/asm/p2m.h
>> +++ b/xen/arch/riscv/include/asm/p2m.h
>> @@ -9,8 +9,13 @@
>>   #include <xen/rwlock.h>
>>   #include <xen/types.h>
>>   
>> +#include <asm/page.h>
>>   #include <asm/page-bits.h>
>>   
>> +#define P2M_ROOT_LEVEL  HYP_PT_ROOT_LEVEL
>> +#define P2M_ROOT_ORDER  XEN_PT_LEVEL_ORDER(P2M_ROOT_LEVEL)
> This is confusing, as in patch 6 we see that p2m root table order is 2.
> Something needs doing about the naming, so the two sets of things can't
> be confused.

Agree, confusing enough.

I will define|P2M_ROOT_ORDER| as|get_order_from_bytes(GUEST_ROOT_PAGE_TABLE_SIZE)|
(or declare a new variable to store this value).

Actually, the way it's currently defined was only needed for|p2m_get_root_pointer() |to find the root page table by GFN, but|XEN_PT_LEVEL_ORDER(P2M_ROOT_LEVEL) |is used explicitly there, so I just missed doing a proper cleanup.


>> --- a/xen/arch/riscv/p2m.c
>> +++ b/xen/arch/riscv/p2m.c
>> @@ -231,6 +231,8 @@ int p2m_init(struct domain *d)
>>       INIT_PAGE_LIST_HEAD(&p2m->pages);
>>   
>>       p2m->vmid = INVALID_VMID;
>> +    p2m->max_mapped_gfn = _gfn(0);
>> +    p2m->lowest_mapped_gfn = _gfn(ULONG_MAX);
>>   
>>       p2m->default_access = p2m_access_rwx;
>>   
>> @@ -325,6 +327,214 @@ int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
>>       return 0;
>>   }
>>   
>> +/*
>> + * Find and map the root page table. The caller is responsible for
>> + * unmapping the table.
>> + *
>> + * The function will return NULL if the offset of the root table is
>> + * invalid.
> Don't you mean "offset into ..."?

If you won't suggested that, I will think that the meaning of "of" and "into" is pretty close.
But it seems like semantically "into" is more accurate and better conveys the intent of the code.

>> + */
>> +static pte_t *p2m_get_root_pointer(struct p2m_domain *p2m, gfn_t gfn)
>> +{
>> +    unsigned long root_table_indx;
>> +
>> +    root_table_indx = gfn_x(gfn) >> XEN_PT_LEVEL_ORDER(P2M_ROOT_LEVEL);
>> +    if ( root_table_indx >= P2M_ROOT_PAGES )
>> +        return NULL;
>> +
>> +    return __map_domain_page(p2m->root + root_table_indx);
>> +}
>> +
>> +static inline bool p2me_is_valid(struct p2m_domain *p2m, pte_t pte)
> The rule of thumb is to have inline functions only in header files, leaving
> decisions to the compiler elsewhere.

I am not sure what you mean in the second part (after coma) of your sentence.

>> +{
>> +    panic("%s: isn't implemented for now\n", __func__);
>> +
>> +    return false;
>> +}
> For this function in particular, though: Besides the "p2me" in the name
> being somewhat odd (supposedly page table entries here are simply pte_t),
> how is this going to be different from pte_is_valid()?

pte_is_valid() is checking a real bit of PTE, but p2me_is_valid() is checking
what is a type stored in the radix tree (p2m->p2m_types):
   /*
    * In the case of the P2M, the valid bit is used for other purpose. Use
    * the type to check whether an entry is valid.
    */
   static inline bool p2me_is_valid(struct p2m_domain *p2m, pte_t pte)
   {
       return p2m_type_radix_get(p2m, pte) != p2m_invalid;
   }

It is done to track which page was modified by a guest.


>> +static inline void p2m_write_pte(pte_t *p, pte_t pte, bool clean_pte)
>> +{
>> +    write_pte(p, pte);
>> +    if ( clean_pte )
>> +        clean_dcache_va_range(p, sizeof(*p));
>> +}
>> +
>> +static inline void p2m_remove_pte(pte_t *p, bool clean_pte)
>> +{
>> +    pte_t pte;
>> +
>> +    memset(&pte, 0x00, sizeof(pte));
>> +    p2m_write_pte(p, pte, clean_pte);
>> +}
> May I suggest "clear" instead of "remove" and plain 0 instead of 0x00
> (or simply give the variable a trivial initializer)?

Sure, I will rename and use plain 0.

>
> As to the earlier function that I commented on: Seeing the names here,
> wouldn't p2m_pte_is_valid() be a more consistent name there?

Then all p2me_*() should be updated to p2m_pte_*().

But initial logic was that p2me = p2m entry = p2m page table entry.

Probably we can just return back to the prefix p2m_ as based on arguments
it is clear that it is a function for working with P2M's PTE.

>
>> +static pte_t p2m_entry_from_mfn(struct p2m_domain *p2m, mfn_t mfn,
>> +                                p2m_type_t t, p2m_access_t a)
>> +{
>> +    panic("%s: hasn't been implemented yet\n", __func__);
>> +
>> +    return (pte_t) { .pte = 0 };
>> +}
> And then perhaps p2m_pte_from_mfn() here?
>
>> +#define GUEST_TABLE_MAP_NONE 0
>> +#define GUEST_TABLE_MAP_NOMEM 1
>> +#define GUEST_TABLE_SUPER_PAGE 2
>> +#define GUEST_TABLE_NORMAL 3
> Is GUEST_ a good prefix? The guest doesn't control these tables, and the
> word could also mean the guest's own page tables.

Then P2M_ prefix should be better.

>
>> +/*
>> + * Take the currently mapped table, find the corresponding GFN entry,
> That's not what you mean though, is it? It's more like "the entry
> corresponding to the GFN" (implying "at the given level").

It will be more clear, I'll update the comment.

>
>> + * and map the next table, if available. The previous table will be
>> + * unmapped if the next level was mapped (e.g GUEST_TABLE_NORMAL
>> + * returned).
>> + *
>> + * `alloc_tbl` parameter indicates whether intermediate tables should
>> + * be allocated when not present.
>> + *
>> + * Return values:
>> + *  GUEST_TABLE_MAP_NONE: a table allocation isn't permitted.
>> + *  GUEST_TABLE_MAP_NOMEM: allocating a new page failed.
>> + *  GUEST_TABLE_SUPER_PAGE: next level or leaf mapped normally.
>> + *  GUEST_TABLE_NORMAL: The next entry points to a superpage.
>> + */
>> +static int p2m_next_level(struct p2m_domain *p2m, bool alloc_tbl,
>> +                          unsigned int level, pte_t **table,
>> +                          unsigned int offset)
>> +{
>> +    panic("%s: hasn't been implemented yet\n", __func__);
>> +
>> +    return GUEST_TABLE_MAP_NONE;
>> +}
>> +
>> +/* Free pte sub-tree behind an entry */
>> +static void p2m_free_entry(struct p2m_domain *p2m,
>> +                           pte_t entry, unsigned int level)
>> +{
>> +    panic("%s: hasn't been implemented yet\n", __func__);
>> +}
>> +
>> +/*
>> + * Insert an entry in the p2m. This should be called with a mapping
>> + * equal to a page/superpage.
>> + */
>> +static int __p2m_set_entry(struct p2m_domain *p2m,
> No double leading underscores, please. A single one is fine and will do.
>
>> +                           gfn_t sgfn,
>> +                           unsigned int page_order,
>> +                           mfn_t smfn,
> What are the "s" in "sgfn" and "smfn" indicating? Possibly "start", except
> that you don't process multiple GFNs here (unlike in the caller).

Yes, it stands for "start". I agree that is not so necessary for __p2m_set_entry()
to use "s" prefix. I'll rename them for __p2m_set_entry().

>
>> +                           p2m_type_t t,
>> +                           p2m_access_t a)
>> +{
>> +    unsigned int level;
>> +    unsigned int target = page_order / PAGETABLE_ORDER;
>> +    pte_t *entry, *table, orig_pte;
>> +    int rc;
>> +    /* A mapping is removed if the MFN is invalid. */
>> +    bool removing_mapping = mfn_eq(smfn, INVALID_MFN);
>> +    DECLARE_OFFSETS(offsets, gfn_to_gaddr(sgfn));
>> +
>> +    ASSERT(p2m_is_write_locked(p2m));
>> +
>> +    /*
>> +     * Check if the level target is valid: we only support
>> +     * 4K - 2M - 1G mapping.
>> +     */
>> +    ASSERT(target <= 2);
> No provisions towards the division that produced the value having left
> a remainder?

The way the order is initialized will always result in division without
a remainder.

If it makes sense, the|ASSERT()| could be updated to ensure that the order
is always a multiple of|PAGETABLE_ORDER|:
   ASSERT((target <= 2) && !IS_ALIGNED(page_order, PAGETABLE_ORDER));

>
>> +    table = p2m_get_root_pointer(p2m, sgfn);
>> +    if ( !table )
>> +        return -EINVAL;
>> +
>> +    for ( level = P2M_ROOT_LEVEL; level > target; level-- )
>> +    {
>> +        /*
>> +         * Don't try to allocate intermediate page table if the mapping
>> +         * is about to be removed.
>> +         */
>> +        rc = p2m_next_level(p2m, !removing_mapping,
>> +                            level, &table, offsets[level]);
>> +        if ( (rc == GUEST_TABLE_MAP_NONE) || (rc == GUEST_TABLE_MAP_NOMEM) )
>> +        {
>> +            /*
>> +             * We are here because p2m_next_level has failed to map
>> +             * the intermediate page table (e.g the table does not exist
>> +             * and they p2m tree is read-only). It is a valid case
>> +             * when removing a mapping as it may not exist in the
>> +             * page table. In this case, just ignore it.
>> +             */
>> +            rc = removing_mapping ?  0 : -ENOENT;
> Shouldn't GUEST_TABLE_MAP_NOMEM be transformed to -ENOMEM?

Maybe, but I think that it is not really necessary to be so precise here. -ENOENT
could cover both GUEST_TABLE_MAP_NONE and GUEST_TABLE_MAP_NOMEM.
Anyway. for consistency I will change this code to:
             rc = (rc == P2M_TABLE_MAP_NONE) ? -ENOENT : -ENOMEM;
             /*
              * We are here because p2m_next_level has failed to map
              * the intermediate page table (e.g the table does not exist
              * and they p2m tree is read-only). It is a valid case
              * when removing a mapping as it may not exist in the
              * page table. In this case, just ignore it.
              */
             rc = removing_mapping ?  0 : rc;
             goto out;

>> @@ -332,7 +542,55 @@ static int p2m_set_entry(struct p2m_domain *p2m,
>>                            p2m_type_t t,
>>                            p2m_access_t a)
>>   {
>> -    return -EOPNOTSUPP;
>> +    int rc = 0;
>> +
>> +    /*
>> +     * Any reference taken by the P2M mappings (e.g. foreign mapping) will
>> +     * be dropped in relinquish_p2m_mapping(). As the P2M will still
>> +     * be accessible after, we need to prevent mapping to be added when the
>> +     * domain is dying.
>> +     */
>> +    if ( unlikely(p2m->domain->is_dying) )
>> +        return -ENOMEM;
> Why ENOMEM?

I expect that when a domain is dying, it means there’s no point in using its
memory—either because it's no longer available or it has already been freed.
Basically, no memory.

>
>> +    while ( nr )
> Why's there a loop here? The function name uses singular, i.e. means to
> create exactly one entry.

I will rename the function to  p2m_set_entries().

>
>> +    {
>> +        unsigned long mask;
>> +        unsigned long order = 0;
> unsigned int?
>
>> +        /* 1gb, 2mb, 4k mappings are supported */
>> +        unsigned int i = ( P2M_ROOT_LEVEL > 2 ) ? 2 : P2M_ROOT_LEVEL;
> Not (style): Excess blanks. Yet then aren't you open-coding min() here
> anyway?

Yes, it is open-coded version of min(). I will use min() instead.

> Plus isn't P2M_ROOT_LEVEL always >= 2?

For Sv32, P2M_ROOT_LEVEL is 1; for other modes it is really always >= 2.


>
>> +        /*
>> +         * Don't take into account the MFN when removing mapping (i.e
>> +         * MFN_INVALID) to calculate the correct target order.
>> +         *
>> +         * XXX: Support superpage mappings if nr is not aligned to a
>> +         * superpage size.
>> +         */
> Does this really need leaving as a to-do?

I think so, yes. It won’t break the current workflow if|nr| isn’t aligned,
a smaller order will simply be chosen.

>
>> +        mask = !mfn_eq(smfn, INVALID_MFN) ? mfn_x(smfn) : 0;
>> +        mask |= gfn_x(sgfn) | nr;
>> +
>> +        for ( ; i != 0; i-- )
>> +        {
>> +            if ( !(mask & (BIT(XEN_PT_LEVEL_ORDER(i), UL) - 1)) )
>> +            {
>> +                    order = XEN_PT_LEVEL_ORDER(i);
>> +                    break;
> Nit: Style.
>
>> +            }
>> +        }
>> +
>> +        rc = __p2m_set_entry(p2m, sgfn, order, smfn, t, a);
>> +        if ( rc )
>> +            break;
>> +
>> +        sgfn = gfn_add(sgfn, (1 << order));
>> +        if ( !mfn_eq(smfn, INVALID_MFN) )
>> +           smfn = mfn_add(smfn, (1 << order));
>> +
>> +        nr -= (1 << order);
> Throughout maybe better be safe right away and use 1UL?
>
>> +    }
>> +
>> +    return rc;
>>   }
> How's the caller going to know how much of the range was successfully
> mapped?

There is no such option. Do other arches do that? I mean returns somehow
the number of successfully mapped (sgfn,smfn).

> That part may need undoing (if not here, then in the caller),
> or a caller may want to retry.

So the caller in the case if rc != 0, can just undoing the full range
(by using the same sgfn, nr, smfn).
Or, as an option, just go for range (sgfn, nr), get each entry and if it
was mapped then just clear entry; otherwise just stop.

Yes, it isn't optimal, but should work.

Thanks.

~ Oleksii

--------------gW10OHkRVFayPL0mOXcoX00U
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/1/25 3:49 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:31811dbc-5fe8-487b-95d4-dd7f5f0868b3@suse.com">
      <pre wrap="" class="moz-quote-pre">On 10.06.2025 15:05, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">This patch introduces p2m_set_entry() and its core helper __p2m_set_entry() for
RISC-V, based loosely on the Arm implementation, with several RISC-V-specific
modifications.

Key differences include:
- TLB Flushing: RISC-V allows caching of invalid PTEs and does not require
  break-before-make (BBM). As a result, the flushing logic is simplified.
  TLB invalidation can be deferred until p2m_write_unlock() is called.
  Consequently, the p2m-&gt;need_flush flag is always considered true and is
  removed.
- Page Table Traversal: The order of walking the page tables differs from Arm,
  and this implementation reflects that reversed traversal.
- Macro Adjustments: The macros P2M_ROOT_LEVEL, P2M_ROOT_ORDER, and
  P2M_ROOT_PAGES are updated to align with the new RISC-V implementation.

The main functionality is in __p2m_set_entry(), which handles mappings aligned
to page table block entries (e.g., 1GB, 2MB, or 4KB with 4KB granularity).

p2m_set_entry() breaks a region down into block-aligned mappings and calls
__p2m_set_entry() accordingly.

Stub implementations (to be completed later) include:
- p2m_free_entry()
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">What would a function of this name do? </pre>
    </blockquote>
    <pre>Recursively visiting all leaf PTE's for sub-tree behind an entry, then calls
put_page() (which will free if there is no any reference to this page),
freeing intermediate page table (after all entries were freed) by removing
it from d-&gt;arch.paging.freelist, and removes correspondent page of intermediate page
table from p2m-&gt;pages list.</pre>
    <blockquote type="cite"
      cite="mid:31811dbc-5fe8-487b-95d4-dd7f5f0868b3@suse.com">
      <pre wrap="" class="moz-quote-pre">You can clear entries, but you can't
free them, can you?</pre>
    </blockquote>
    <pre>Is is a question regarding terminology? I can't free entry itself, but a page table or
a page (if it is a leaf entry) on which it points could free.

</pre>
    <blockquote type="cite"
      cite="mid:31811dbc-5fe8-487b-95d4-dd7f5f0868b3@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -9,8 +9,13 @@
 #include &lt;xen/rwlock.h&gt;
 #include &lt;xen/types.h&gt;
 
+#include &lt;asm/page.h&gt;
 #include &lt;asm/page-bits.h&gt;
 
+#define P2M_ROOT_LEVEL  HYP_PT_ROOT_LEVEL
+#define P2M_ROOT_ORDER  XEN_PT_LEVEL_ORDER(P2M_ROOT_LEVEL)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">This is confusing, as in patch 6 we see that p2m root table order is 2.
Something needs doing about the naming, so the two sets of things can't
be confused.</pre>
    </blockquote>
    <pre>Agree, confusing enough.

I will define <code data-start="96" data-end="112" data-is-only-node="">P2M_ROOT_ORDER</code> as <code
    data-start="116" data-end="166">get_order_from_bytes(GUEST_ROOT_PAGE_TABLE_SIZE)</code>
(or declare a new variable to store this value).

Actually, the way it's currently defined was only needed for <code
    data-start="281" data-end="305">p2m_get_root_pointer()
</code>to find the root page table by GFN, but <code data-start="348"
    data-end="384">XEN_PT_LEVEL_ORDER(P2M_ROOT_LEVEL)
</code>is used explicitly there, so I just missed doing a proper cleanup.</pre>
    <br>
    <blockquote type="cite"
      cite="mid:31811dbc-5fe8-487b-95d4-dd7f5f0868b3@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -231,6 +231,8 @@ int p2m_init(struct domain *d)
     INIT_PAGE_LIST_HEAD(&amp;p2m-&gt;pages);
 
     p2m-&gt;vmid = INVALID_VMID;
+    p2m-&gt;max_mapped_gfn = _gfn(0);
+    p2m-&gt;lowest_mapped_gfn = _gfn(ULONG_MAX);
 
     p2m-&gt;default_access = p2m_access_rwx;
 
@@ -325,6 +327,214 @@ int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
     return 0;
 }
 
+/*
+ * Find and map the root page table. The caller is responsible for
+ * unmapping the table.
+ *
+ * The function will return NULL if the offset of the root table is
+ * invalid.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Don't you mean "offset into ..."?</pre>
    </blockquote>
    <pre>If you won't suggested that, I will think that the meaning of "of" and "into" is pretty close.
But it seems like semantically "into" is more accurate and better conveys the intent of the code.

</pre>
    <blockquote type="cite"
      cite="mid:31811dbc-5fe8-487b-95d4-dd7f5f0868b3@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+ */
+static pte_t *p2m_get_root_pointer(struct p2m_domain *p2m, gfn_t gfn)
+{
+    unsigned long root_table_indx;
+
+    root_table_indx = gfn_x(gfn) &gt;&gt; XEN_PT_LEVEL_ORDER(P2M_ROOT_LEVEL);
+    if ( root_table_indx &gt;= P2M_ROOT_PAGES )
+        return NULL;
+
+    return __map_domain_page(p2m-&gt;root + root_table_indx);
+}
+
+static inline bool p2me_is_valid(struct p2m_domain *p2m, pte_t pte)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">The rule of thumb is to have inline functions only in header files, leaving
decisions to the compiler elsewhere.</pre>
    </blockquote>
    <pre>I am not sure what you mean in the second part (after coma) of your sentence.

</pre>
    <blockquote type="cite"
      cite="mid:31811dbc-5fe8-487b-95d4-dd7f5f0868b3@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+{
+    panic("%s: isn't implemented for now\n", __func__);
+
+    return false;
+}
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">For this function in particular, though: Besides the "p2me" in the name
being somewhat odd (supposedly page table entries here are simply pte_t),
how is this going to be different from pte_is_valid()?</pre>
    </blockquote>
    <pre>pte_is_valid() is checking a real bit of PTE, but p2me_is_valid() is checking
what is a type stored in the radix tree (p2m-&gt;p2m_types):
  /*
   * In the case of the P2M, the valid bit is used for other purpose. Use
   * the type to check whether an entry is valid.
   */
  static inline bool p2me_is_valid(struct p2m_domain *p2m, pte_t pte)
  {
      return p2m_type_radix_get(p2m, pte) != p2m_invalid;
  }

It is done to track which page was modified by a guest.


</pre>
    <blockquote type="cite"
      cite="mid:31811dbc-5fe8-487b-95d4-dd7f5f0868b3@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+static inline void p2m_write_pte(pte_t *p, pte_t pte, bool clean_pte)
+{
+    write_pte(p, pte);
+    if ( clean_pte )
+        clean_dcache_va_range(p, sizeof(*p));
+}
+
+static inline void p2m_remove_pte(pte_t *p, bool clean_pte)
+{
+    pte_t pte;
+
+    memset(&amp;pte, 0x00, sizeof(pte));
+    p2m_write_pte(p, pte, clean_pte);
+}
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">May I suggest "clear" instead of "remove" and plain 0 instead of 0x00
(or simply give the variable a trivial initializer)?</pre>
    </blockquote>
    <pre>Sure, I will rename and use plain 0.
</pre>
    <blockquote type="cite"
      cite="mid:31811dbc-5fe8-487b-95d4-dd7f5f0868b3@suse.com">
      <pre wrap="" class="moz-quote-pre">

As to the earlier function that I commented on: Seeing the names here,
wouldn't p2m_pte_is_valid() be a more consistent name there?</pre>
    </blockquote>
    <pre>Then all p2me_*() should be updated to p2m_pte_*().

But initial logic was that p2me = p2m entry = p2m page table entry.

Probably we can just return back to the prefix p2m_ as based on arguments
it is clear that it is a function for working with P2M's PTE.

</pre>
    <blockquote type="cite"
      cite="mid:31811dbc-5fe8-487b-95d4-dd7f5f0868b3@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+static pte_t p2m_entry_from_mfn(struct p2m_domain *p2m, mfn_t mfn,
+                                p2m_type_t t, p2m_access_t a)
+{
+    panic("%s: hasn't been implemented yet\n", __func__);
+
+    return (pte_t) { .pte = 0 };
+}
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">And then perhaps p2m_pte_from_mfn() here?

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+#define GUEST_TABLE_MAP_NONE 0
+#define GUEST_TABLE_MAP_NOMEM 1
+#define GUEST_TABLE_SUPER_PAGE 2
+#define GUEST_TABLE_NORMAL 3
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Is GUEST_ a good prefix? The guest doesn't control these tables, and the
word could also mean the guest's own page tables.</pre>
    </blockquote>
    <pre>Then P2M_ prefix should be better.

</pre>
    <blockquote type="cite"
      cite="mid:31811dbc-5fe8-487b-95d4-dd7f5f0868b3@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+/*
+ * Take the currently mapped table, find the corresponding GFN entry,
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">That's not what you mean though, is it? It's more like "the entry
corresponding to the GFN" (implying "at the given level").</pre>
    </blockquote>
    <pre>It will be more clear, I'll update the comment.

</pre>
    <blockquote type="cite"
      cite="mid:31811dbc-5fe8-487b-95d4-dd7f5f0868b3@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+ * and map the next table, if available. The previous table will be
+ * unmapped if the next level was mapped (e.g GUEST_TABLE_NORMAL
+ * returned).
+ *
+ * `alloc_tbl` parameter indicates whether intermediate tables should
+ * be allocated when not present.
+ *
+ * Return values:
+ *  GUEST_TABLE_MAP_NONE: a table allocation isn't permitted.
+ *  GUEST_TABLE_MAP_NOMEM: allocating a new page failed.
+ *  GUEST_TABLE_SUPER_PAGE: next level or leaf mapped normally.
+ *  GUEST_TABLE_NORMAL: The next entry points to a superpage.
+ */
+static int p2m_next_level(struct p2m_domain *p2m, bool alloc_tbl,
+                          unsigned int level, pte_t **table,
+                          unsigned int offset)
+{
+    panic("%s: hasn't been implemented yet\n", __func__);
+
+    return GUEST_TABLE_MAP_NONE;
+}
+
+/* Free pte sub-tree behind an entry */
+static void p2m_free_entry(struct p2m_domain *p2m,
+                           pte_t entry, unsigned int level)
+{
+    panic("%s: hasn't been implemented yet\n", __func__);
+}
+
+/*
+ * Insert an entry in the p2m. This should be called with a mapping
+ * equal to a page/superpage.
+ */
+static int __p2m_set_entry(struct p2m_domain *p2m,
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">No double leading underscores, please. A single one is fine and will do.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+                           gfn_t sgfn,
+                           unsigned int page_order,
+                           mfn_t smfn,
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">What are the "s" in "sgfn" and "smfn" indicating? Possibly "start", except
that you don't process multiple GFNs here (unlike in the caller).</pre>
    </blockquote>
    <pre>Yes, it stands for "start". I agree that is not so necessary for __p2m_set_entry()
to use "s" prefix. I'll rename them for __p2m_set_entry().

</pre>
    <blockquote type="cite"
      cite="mid:31811dbc-5fe8-487b-95d4-dd7f5f0868b3@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+                           p2m_type_t t,
+                           p2m_access_t a)
+{
+    unsigned int level;
+    unsigned int target = page_order / PAGETABLE_ORDER;
+    pte_t *entry, *table, orig_pte;
+    int rc;
+    /* A mapping is removed if the MFN is invalid. */
+    bool removing_mapping = mfn_eq(smfn, INVALID_MFN);
+    DECLARE_OFFSETS(offsets, gfn_to_gaddr(sgfn));
+
+    ASSERT(p2m_is_write_locked(p2m));
+
+    /*
+     * Check if the level target is valid: we only support
+     * 4K - 2M - 1G mapping.
+     */
+    ASSERT(target &lt;= 2);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">No provisions towards the division that produced the value having left
a remainder?</pre>
    </blockquote>
    <pre>The way the order is initialized will always result in division without
a remainder.

If it makes sense, the <code data-start="106" data-end="116">ASSERT()</code> could be updated to ensure that the order
is always a multiple of <code data-start="183" data-end="200">PAGETABLE_ORDER</code>:
  ASSERT((target &lt;= 2) &amp;&amp; !IS_ALIGNED(page_order, PAGETABLE_ORDER));

</pre>
    <blockquote type="cite"
      cite="mid:31811dbc-5fe8-487b-95d4-dd7f5f0868b3@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    table = p2m_get_root_pointer(p2m, sgfn);
+    if ( !table )
+        return -EINVAL;
+
+    for ( level = P2M_ROOT_LEVEL; level &gt; target; level-- )
+    {
+        /*
+         * Don't try to allocate intermediate page table if the mapping
+         * is about to be removed.
+         */
+        rc = p2m_next_level(p2m, !removing_mapping,
+                            level, &amp;table, offsets[level]);
+        if ( (rc == GUEST_TABLE_MAP_NONE) || (rc == GUEST_TABLE_MAP_NOMEM) )
+        {
+            /*
+             * We are here because p2m_next_level has failed to map
+             * the intermediate page table (e.g the table does not exist
+             * and they p2m tree is read-only). It is a valid case
+             * when removing a mapping as it may not exist in the
+             * page table. In this case, just ignore it.
+             */
+            rc = removing_mapping ?  0 : -ENOENT;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Shouldn't GUEST_TABLE_MAP_NOMEM be transformed to -ENOMEM?</pre>
    </blockquote>
    <pre>Maybe, but I think that it is not really necessary to be so precise here. -ENOENT
could cover both GUEST_TABLE_MAP_NONE and GUEST_TABLE_MAP_NOMEM.
Anyway. for consistency I will change this code to:
            rc = (rc == P2M_TABLE_MAP_NONE) ? -ENOENT : -ENOMEM;
            /*
             * We are here because p2m_next_level has failed to map
             * the intermediate page table (e.g the table does not exist
             * and they p2m tree is read-only). It is a valid case
             * when removing a mapping as it may not exist in the
             * page table. In this case, just ignore it.
             */
            rc = removing_mapping ?  0 : rc;
            goto out;

</pre>
    <blockquote type="cite"
      cite="mid:31811dbc-5fe8-487b-95d4-dd7f5f0868b3@suse.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -332,7 +542,55 @@ static int p2m_set_entry(struct p2m_domain *p2m,
                          p2m_type_t t,
                          p2m_access_t a)
 {
-    return -EOPNOTSUPP;
+    int rc = 0;
+
+    /*
+     * Any reference taken by the P2M mappings (e.g. foreign mapping) will
+     * be dropped in relinquish_p2m_mapping(). As the P2M will still
+     * be accessible after, we need to prevent mapping to be added when the
+     * domain is dying.
+     */
+    if ( unlikely(p2m-&gt;domain-&gt;is_dying) )
+        return -ENOMEM;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Why ENOMEM?</pre>
    </blockquote>
    <pre>I expect that when a domain is dying, it means there’s no point in using its
memory—either because it's no longer available or it has already been freed.
Basically, no memory.

</pre>
    <blockquote type="cite"
      cite="mid:31811dbc-5fe8-487b-95d4-dd7f5f0868b3@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    while ( nr )
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Why's there a loop here? The function name uses singular, i.e. means to
create exactly one entry.</pre>
    </blockquote>
    <pre>I will rename the function to  p2m_set_entries().

</pre>
    <blockquote type="cite"
      cite="mid:31811dbc-5fe8-487b-95d4-dd7f5f0868b3@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    {
+        unsigned long mask;
+        unsigned long order = 0;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">unsigned int?

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+        /* 1gb, 2mb, 4k mappings are supported */
+        unsigned int i = ( P2M_ROOT_LEVEL &gt; 2 ) ? 2 : P2M_ROOT_LEVEL;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Not (style): Excess blanks. Yet then aren't you open-coding min() here
anyway? </pre>
    </blockquote>
    <pre>Yes, it is open-coded version of min(). I will use min() instead.

</pre>
    <blockquote type="cite"
      cite="mid:31811dbc-5fe8-487b-95d4-dd7f5f0868b3@suse.com">
      <pre wrap="" class="moz-quote-pre">Plus isn't P2M_ROOT_LEVEL always &gt;= 2?</pre>
    </blockquote>
    <pre>For Sv32, P2M_ROOT_LEVEL is 1; for other modes it is really always &gt;= 2.


</pre>
    <blockquote type="cite"
      cite="mid:31811dbc-5fe8-487b-95d4-dd7f5f0868b3@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+        /*
+         * Don't take into account the MFN when removing mapping (i.e
+         * MFN_INVALID) to calculate the correct target order.
+         *
+         * XXX: Support superpage mappings if nr is not aligned to a
+         * superpage size.
+         */
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Does this really need leaving as a to-do?</pre>
    </blockquote>
    <pre>I think so, yes. It won’t break the current workflow if <code
    data-start="106" data-end="110">nr</code> isn’t aligned,
a smaller order will simply be chosen.

</pre>
    <blockquote type="cite"
      cite="mid:31811dbc-5fe8-487b-95d4-dd7f5f0868b3@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+        mask = !mfn_eq(smfn, INVALID_MFN) ? mfn_x(smfn) : 0;
+        mask |= gfn_x(sgfn) | nr;
+
+        for ( ; i != 0; i-- )
+        {
+            if ( !(mask &amp; (BIT(XEN_PT_LEVEL_ORDER(i), UL) - 1)) )
+            {
+                    order = XEN_PT_LEVEL_ORDER(i);
+                    break;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Nit: Style.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+            }
+        }
+
+        rc = __p2m_set_entry(p2m, sgfn, order, smfn, t, a);
+        if ( rc )
+            break;
+
+        sgfn = gfn_add(sgfn, (1 &lt;&lt; order));
+        if ( !mfn_eq(smfn, INVALID_MFN) )
+           smfn = mfn_add(smfn, (1 &lt;&lt; order));
+
+        nr -= (1 &lt;&lt; order);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Throughout maybe better be safe right away and use 1UL?

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    }
+
+    return rc;
 }
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">How's the caller going to know how much of the range was successfully
mapped? </pre>
    </blockquote>
    <pre>There is no such option. Do other arches do that? I mean returns somehow
the number of successfully mapped (sgfn,smfn).

</pre>
    <blockquote type="cite"
      cite="mid:31811dbc-5fe8-487b-95d4-dd7f5f0868b3@suse.com">
      <pre wrap="" class="moz-quote-pre">That part may need undoing (if not here, then in the caller),
or a caller may want to retry.</pre>
    </blockquote>
    <pre>So the caller in the case if rc != 0, can just undoing the full range
(by using the same sgfn, nr, smfn).
Or, as an option, just go for range (sgfn, nr), get each entry and if it
was mapped then just clear entry; otherwise just stop.

Yes, it isn't optimal, but should work.

Thanks.

~ Oleksii
</pre>
    <blockquote type="cite"
      cite="mid:31811dbc-5fe8-487b-95d4-dd7f5f0868b3@suse.com"> </blockquote>
  </body>
</html>

--------------gW10OHkRVFayPL0mOXcoX00U--

