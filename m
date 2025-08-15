Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CACB27D89
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 11:52:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1083161.1442810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umr6W-0008M1-HI; Fri, 15 Aug 2025 09:52:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1083161.1442810; Fri, 15 Aug 2025 09:52:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umr6W-0008KM-DQ; Fri, 15 Aug 2025 09:52:08 +0000
Received: by outflank-mailman (input) for mailman id 1083161;
 Fri, 15 Aug 2025 09:52:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N6kI=23=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1umr6U-0007rp-Ic
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 09:52:06 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f53f9bd-79bd-11f0-b898-0df219b8e170;
 Fri, 15 Aug 2025 11:52:04 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-afcb7ae6ed0so230885766b.3
 for <xen-devel@lists.xenproject.org>; Fri, 15 Aug 2025 02:52:04 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdce53e04sm103919166b.14.2025.08.15.02.52.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Aug 2025 02:52:02 -0700 (PDT)
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
X-Inumbo-ID: 7f53f9bd-79bd-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755251523; x=1755856323; darn=lists.xenproject.org;
        h=in-reply-to:content-language:references:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qujfu2sdvE2/Ze1R09kpCTYkoKJ6ymyyxG7SkC2RS+U=;
        b=nUFy/HXtq+nKhCOdz5v4L18Dc8HcObmFmKmbbM1SJEBpdZ3zN+njBYgdZQRP56s/KN
         nhfZ9JCRjq6uIieLzqEJheZtl4y0o8haf2Z6z9wSzqDSH0oTDzq1WAHpSD88XoKa8PSu
         DGMGRAnxauuChiYKL8OSRNAhyhetOxuf16UDNs0plhQCMD0IZCb+QdYAzcWjP2kCZFtH
         mfWZo8dyUeLP8bKK5wxkHLaVt+fiAhfOb/yARVVHUb6PpLy2C/z6xCd8WOyqtjSqfGGi
         wzmmkiHdR6mSb4N87k6faQW7bw4zWHm5ntfEZdUYKdxNVO7iq1odD7wlCmmhzAMYx0uL
         ACzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755251524; x=1755856324;
        h=in-reply-to:content-language:references:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qujfu2sdvE2/Ze1R09kpCTYkoKJ6ymyyxG7SkC2RS+U=;
        b=RLaHoivXU1A54IQfCFiH72F64Y/ExTGJVmi0byhUJ2Vve+T6CG/5qZWyWQ5OM27CKV
         FXGNXfSnyEWBf9e4Ho8fQC3tzVQ0p0RZxtWkt885GuRtd0Y0hxDp6g+m1JtYgeri7Fxk
         Nld/ESvF9upoAgjnxgNaunDnCYwUtfizORD+XU9/CzUsOPSS31YAFik2LjNoRu9IFSF5
         OXX1VKyx7LcEGwqgPVa0hX+CHoTfP9TW/wQ9ez9e2+X2Go5tqU0ZoTRmJR0eXvhHZLja
         WksFDMeJ5Roj95noSZY/qp+k9/EVTrD26zcM6SL25/EcfpHn2bxKLmIuR+bZhDWBVxTq
         KuPA==
X-Forwarded-Encrypted: i=1; AJvYcCUTPXkBKk+ftzWxeCs/8v7fwFmirYMAP+yot5rHQ0/2DQeGVMcvDffnaBlkaVgYlmURkW1R8Fu4wdk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx5H32UxhUOQPOlDDY3VeSkXJt61YOcCHz84iv0MPVjU1vgCRAK
	xEcIvwqc7QCHof3Hon7EbSmSWboxPTd9ok55j9jehwY3jWjn+yDA5rKb
X-Gm-Gg: ASbGncvIQBINas3L53BCbk3YPynARD2StT1mzNDpbSo+14zMwARAG/SfpL/D1oRc1nG
	uVSIQmkZdeX7C98WRzXarn3cLFjFMZvYSgtCZeWm/fcPGoUjcloum/aXvcKMJScS4tQXTL8AvTh
	hKAAoNFF6nEX4WFLtkJRyPUvwhx0Eu6ei1UtZnUwyBivWKL7TnF+sOo38hqAa2RAfs/k+ZbtWRy
	8vyW2lsmWbXoW6i/j9BI4xhLoMQhe1LW/bbK/Wt3itNx1zOvJ5qyDpKPHkUPNsRZC+zwH10HmlM
	CuX0XcEy0KHZ57fy/CVYpYmDLTxm8pc3/jxLikiX5QaiVHaZluyHHQc1RNJk4hzXkB+F7qx1wQJ
	anL+ItEzW97fzjbMkhBGLP/n2o4/j+08WR2WjZZiSkkeBYtMsj1ULXLU26+2F7Hi/ZgNDGRs=
X-Google-Smtp-Source: AGHT+IECjzF2wZAZN5+wr1ghQnQulolsCtLyU2RU76Bm2YD5ayh2albmtbJLsd/mYdYqHhEN1BJ40g==
X-Received: by 2002:a17:907:1b28:b0:af8:f9e8:6fae with SMTP id a640c23a62f3a-afcdc2bbd8amr149282866b.46.1755251523164;
        Fri, 15 Aug 2025 02:52:03 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------HROQljmCX0Yx6E9D50dJ1CoZ"
Message-ID: <62a3c3ef-1f19-4fac-b967-f7730e8f235f@gmail.com>
Date: Fri, 15 Aug 2025 11:52:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v3 12/20] xen/riscv: implement p2m_set_range()
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
 <ea69584222a4c41eac276de1ec8eed25b13642d3.1753973161.git.oleksii.kurochko@gmail.com>
 <f217021e-1fef-4324-a56e-529fd29b4c69@suse.com>
Content-Language: en-US
In-Reply-To: <f217021e-1fef-4324-a56e-529fd29b4c69@suse.com>

This is a multi-part message in MIME format.
--------------HROQljmCX0Yx6E9D50dJ1CoZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 8/5/25 6:04 PM, Jan Beulich wrote:
> On 31.07.2025 17:58, Oleksii Kurochko wrote:
>> This patch introduces p2m_set_range() and its core helper p2m_set_entry() for
> Nit: This patch doesn't introduce p2m_set_range(); it merely fleshes it out.
>
>> --- a/xen/arch/riscv/include/asm/p2m.h
>> +++ b/xen/arch/riscv/include/asm/p2m.h
>> @@ -7,11 +7,13 @@
>>   #include <xen/rwlock.h>
>>   #include <xen/types.h>
>>   
>> +#include <asm/page.h>
>>   #include <asm/page-bits.h>
>>   
>>   extern unsigned int p2m_root_order;
>>   #define P2M_ROOT_ORDER  p2m_root_order
>>   #define P2M_ROOT_PAGES  BIT(P2M_ROOT_ORDER, U)
>> +#define P2M_ROOT_LEVEL  HYP_PT_ROOT_LEVEL
> I think I commented on this before, and I would have hoped for at least a remark
> in the description to appear (perhaps even a comment here): It's okay(ish) to tie
> these together for now, but in the longer run I don't expect this is going to be
> wanted. If e.g. we ran Xen in Sv57 mode, there would be no reason at all to force
> all P2Ms to use 5 levels of page tables.

Do you mean that for G-stage it could be chosen any SvXX mode to limit an amount
of page tables necessary for G-stage? If yes, then, at least, I agree that a
comment should be added or, probably, "#warning optimize an amount of p2m root level
for MMU mode > Sv48" (or maybe >=).

Or do you mean if we set hgatp.mode=Sv57 then it is possible to limit an amount of
page table's levels to use? In this case I think hardware still will expect to see
5 levels of page tables.


>> @@ -175,13 +179,257 @@ int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
>>       return 0;
>>   }
>>   
>> +/*
>> + * Find and map the root page table. The caller is responsible for
>> + * unmapping the table.
>> + *
>> + * The function will return NULL if the offset into the root table is
>> + * invalid.
>> + */
>> +static pte_t *p2m_get_root_pointer(struct p2m_domain *p2m, gfn_t gfn)
>> +{
>> +    unsigned long root_table_indx;
>> +
>> +    root_table_indx = gfn_x(gfn) >> XEN_PT_LEVEL_ORDER(P2M_ROOT_LEVEL);
> Right now page table layouts / arrangements are indeed similar enough to
> share accessor constructs. Nevertheless I find it problematic (doc-wise
> at the very least) that a Xen page table construct is used to access a
> P2M page table. If and when these needed to be decoupled, it would likely
> help of the distinction was already made, by - for now - simply
> introducing aliases (here e.g. P2M_LEVEL_ORDER(), expanding to
> XEN_PT_LEVEL_ORDER() for the time being).

I think it's better to define this correctly now, as I initially missed
that only non-root page tables and all page table entries (PTEs) share
the same format as their corresponding Sv39, Sv48, or Sv57 modes
(i.e., corresponding to SvXXx4).

However, in this case, we're dealing with the*root level*, which is extended
by 2 extra bits. Therefore, using|XEN_PT_LEVEL_ORDER()| would be incorrect
if those two extra bits are actually used.

We're just fortunate that no one currently uses these extra 2 bits.

>> +    if ( root_table_indx >= P2M_ROOT_PAGES )
>> +        return NULL;
>> +
>> +    return __map_domain_page(p2m->root + root_table_indx);
>> +}
>> +
>> +static inline void p2m_write_pte(pte_t *p, pte_t pte, bool clean_pte)
>> +{
>> +    write_pte(p, pte);
>> +    if ( clean_pte )
>> +        clean_dcache_va_range(p, sizeof(*p));
> Not necessarily for right away, but if multiple adjacent PTEs are
> written without releasing the lock, this then redundant cache flushing
> can be a performance issue.

Can't it be resolved on a caller side? Something like:
   p2m_write_pte(p1, pte1, false);
   p2m_write_pte(p2, pte2, false);
   p2m_write_pte(p3, pte3, false);
   p2m_write_pte(p4, pte4, true);
where p1-p4 are adjacent.

  

>> +}
>> +
>> +static inline void p2m_clean_pte(pte_t *p, bool clean_pte)
>> +{
>> +    pte_t pte;
>> +
>> +    memset(&pte, 0, sizeof(pte));
> Why memset()? Why not simply give the variable an appropriate initializer?

Good point. It would be much better just to use an appropriate initializer.

> Or use ...
>
>> +    p2m_write_pte(p, pte, clean_pte);
> ... a compound literal here, like you do ...
>
>> +}
>> +
>> +static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t)
>> +{
>> +    panic("%s: hasn't been implemented yet\n", __func__);
>> +
>> +    return (pte_t) { .pte = 0 };
> ... here? (Just {} would also do, if I'm not mistaken.)

According to C99 it will be enough {}, but {.pte = 0} is more obvious and
clearer, IMO.

>> +}
>> +
>> +#define P2M_TABLE_MAP_NONE 0
>> +#define P2M_TABLE_MAP_NOMEM 1
>> +#define P2M_TABLE_SUPER_PAGE 2
>> +#define P2M_TABLE_NORMAL 3
>> +
>> +/*
>> + * Take the currently mapped table, find the corresponding the entry
>> + * corresponding to the GFN, and map the next table, if available.
> Nit: Double "corresponding".
>
>> + * The previous table will be unmapped if the next level was mapped
>> + * (e.g P2M_TABLE_NORMAL returned).
>> + *
>> + * `alloc_tbl` parameter indicates whether intermediate tables should
>> + * be allocated when not present.
>> + *
>> + * Return values:
>> + *  P2M_TABLE_MAP_NONE: a table allocation isn't permitted.
>> + *  P2M_TABLE_MAP_NOMEM: allocating a new page failed.
>> + *  P2M_TABLE_SUPER_PAGE: next level or leaf mapped normally.
>> + *  P2M_TABLE_NORMAL: The next entry points to a superpage.
>> + */
>> +static int p2m_next_level(struct p2m_domain *p2m, bool alloc_tbl,
>> +                          unsigned int level, pte_t **table,
>> +                          unsigned int offset)
>> +{
>> +    panic("%s: hasn't been implemented yet\n", __func__);
>> +
>> +    return P2M_TABLE_MAP_NONE;
>> +}
>> +
>> +/* Free pte sub-tree behind an entry */
>> +static void p2m_free_subtree(struct p2m_domain *p2m,
>> +                             pte_t entry, unsigned int level)
>> +{
>> +    panic("%s: hasn't been implemented yet\n", __func__);
>> +}
>> +
>> +/*
>> + * Insert an entry in the p2m. This should be called with a mapping
>> + * equal to a page/superpage.
>> + */
>> +static int p2m_set_entry(struct p2m_domain *p2m,
>> +                           gfn_t gfn,
>> +                           unsigned long page_order,
>> +                           mfn_t mfn,
>> +                           p2m_type_t t)
>> +{
>> +    unsigned int level;
>> +    unsigned int target = page_order / PAGETABLE_ORDER;
>> +    pte_t *entry, *table, orig_pte;
>> +    int rc;
>> +    /* A mapping is removed if the MFN is invalid. */
>> +    bool removing_mapping = mfn_eq(mfn, INVALID_MFN);
> Comment and code don't fit together. Many MFNs are invalid (any for which
> mfn_valid() returns false), yet you only check for INVALID_MFN here.

Probably, it makes sense to add an|ASSERT()| here for the case when
|mfn_valid(mfn)| is false, but the MFN is not explicitly equal to|INVALID_MFN|.
This would indicate that someone attempted to perform a mapping with an
incorrect MFN, which, IMO, is entirely wrong.
In the case where the MFN is explicitly set to|INVALID_MFN|, I believe it's
enough to indicate that a mapping is being removed.

>> +    DECLARE_OFFSETS(offsets, gfn_to_gaddr(gfn));
>> +
>> +    ASSERT(p2m_is_write_locked(p2m));
>> +
>> +    /*
>> +     * Check if the level target is valid: we only support
>> +     * 4K - 2M - 1G mapping.
>> +     */
>> +    ASSERT((target <= 2) && !(page_order % PAGETABLE_ORDER));
> If you think you need to check this, don't you also want to check that
> GFN and MFN (the latter if it isn't INVALID_MFN) fit the requested order?

I'm not 100% sure it makes sense to check|page_order|, as in IMO, proper
alignment is already guaranteed by|p2m_mapping_order(sgfn, smfn, left)|,
and thus both GFN and MFN are aligned accordingly.
So, I think this part of the check could be dropped.

>> +    table = p2m_get_root_pointer(p2m, gfn);
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
>> +        if ( (rc == P2M_TABLE_MAP_NONE) || (rc == P2M_TABLE_MAP_NOMEM) )
>> +        {
>> +            rc = (rc == P2M_TABLE_MAP_NONE) ? -ENOENT : -ENOMEM;
>> +            /*
>> +             * We are here because p2m_next_level has failed to map
>> +             * the intermediate page table (e.g the table does not exist
>> +             * and they p2m tree is read-only). It is a valid case
>> +             * when removing a mapping as it may not exist in the
>> +             * page table. In this case, just ignore it.
>> +             */
>> +            rc = removing_mapping ?  0 : rc;
> Nit: Stray blank.
>
>> +            goto out;
>> +        }
>> +
>> +        if ( rc != P2M_TABLE_NORMAL )
>> +            break;
>> +    }
>> +
>> +    entry = table + offsets[level];
>> +
>> +    /*
>> +     * If we are here with level > target, we must be at a leaf node,
>> +     * and we need to break up the superpage.
>> +     */
>> +    if ( level > target )
>> +    {
>> +        panic("Shattering isn't implemented\n");
>> +    }
>> +
>> +    /*
>> +     * We should always be there with the correct level because all the
>> +     * intermediate tables have been installed if necessary.
>> +     */
>> +    ASSERT(level == target);
>> +
>> +    orig_pte = *entry;
>> +
>> +    if ( removing_mapping )
>> +        p2m_clean_pte(entry, p2m->clean_pte);
>> +    else
>> +    {
>> +        pte_t pte = p2m_pte_from_mfn(mfn, t);
>> +
>> +        p2m_write_pte(entry, pte, p2m->clean_pte);
>> +
>> +        p2m->max_mapped_gfn = gfn_max(p2m->max_mapped_gfn,
>> +                                      gfn_add(gfn, BIT(page_order, UL) - 1));
>> +        p2m->lowest_mapped_gfn = gfn_min(p2m->lowest_mapped_gfn, gfn);
>> +    }
>> +
>> +    p2m->need_flush = true;
>> +
>> +    /*
>> +     * Currently, the infrastructure required to enable CONFIG_HAS_PASSTHROUGH
>> +     * is not ready for RISC-V support.
>> +     *
>> +     * When CONFIG_HAS_PASSTHROUGH=y, iommu_iotlb_flush() should be done
>> +     * here.
>> +     */
>> +#ifdef CONFIG_HAS_PASSTHROUGH
>> +#   error "add code to flush IOMMU TLB"
>> +#endif
>> +
>> +    rc = 0;
>> +
>> +    /*
>> +     * Free the entry only if the original pte was valid and the base
>> +     * is different (to avoid freeing when permission is changed).
>> +     */
>> +    if ( pte_is_valid(orig_pte) &&
>> +         !mfn_eq(pte_get_mfn(*entry), pte_get_mfn(orig_pte)) )
> I'm puzzled by this 2nd check: A permission change would - I expect - only
> occur to a leaf entry. If the new entry is a super-page one and the old
> wasn't, don't you still need to free the sub-tree, no matter whether the
> MFNs are the same?

I expect the MFNs to differ in this scenario, so the old sub-tree will be freed.

Based on your example (new entry is super-page and old entry isn't):
For old mapping (lets say, 4 KiB leaf) p2m_set_entry() walks all levels down
to L0, so we will have the following MMU page table walks:
   L2 PTE -> L1 PTE (MFN of L0 page table) -> L0 PTE -> RAM

When new mapping (lets say, 2 MiB superpage) will be requested, p2m_set_entry()
will stop at L1 (the superpage level):
  L2 PTE -> L1 PTE (at this moment, L1 PTE points to L0 page table, which
                    points to RAM)
Then the old L1 PTE will be saved in 'orig_pte', then writes 'entry' with
the RAM MFN for the 2 MiB mapping. The walk becomes:
   L2 PTE -> L1 PTE -> RAM

Therefore, 'entry' now holds an MFN pointing to RAM (superpage leaf). 'orig_pte'
still holds an MFN pointing to the L0 table (the old sub-tree). Since these MFNs
differ, the code calls p2m_free_subtree(p2m, orig_pte, …) and frees the old L0
sub-tree.

     

>   Plus consider the special case of MFN 0: If you clear
> an entry using MFN 0, you will find old and new PTEs' both having the same
> MFN.

Isn't this happen only when a mapping removal is explicitly requested?
In the case of a mapping removal it seems to me it is enough just to
clear PTE with all zeroes.

>   static int p2m_set_range(struct p2m_domain *p2m,
>                            gfn_t sgfn,
>                            unsigned long nr,
>                            mfn_t smfn,
>                            p2m_type_t t)
>   {
> -    return -EOPNOTSUPP;
> +    int rc = 0;
> +    unsigned long left = nr;
> +
> +    /*
> +     * Any reference taken by the P2M mappings (e.g. foreign mapping) will
> +     * be dropped in relinquish_p2m_mapping(). As the P2M will still
> +     * be accessible after, we need to prevent mapping to be added when the
> +     * domain is dying.
> +     */
> +    if ( unlikely(p2m->domain->is_dying) )
> +        return -EACCES;
> +
> +    while ( left )
> +    {
> +        unsigned long order = p2m_mapping_order(sgfn, smfn, left);
> +
> +        rc = p2m_set_entry(p2m, sgfn, order, smfn, t);
> +        if ( rc )
> +            break;
> +
> +        sgfn = gfn_add(sgfn, BIT(order, UL));
> +        if ( !mfn_eq(smfn, INVALID_MFN) )
> +           smfn = mfn_add(smfn, BIT(order, UL));
> +
> +        left -= BIT(order, UL);
> +    }
> +
> +    return !left ? 0 : left == nr ? rc : (nr - left);
> The function returning "int", you may be truncating the return value here.
> In the worst case indicating success (0) or an error (negative) when some
> of the upper bits were set.

I think what will be better:
or (1) Return long instead of int and the following check:
    long result = nr - left;
    if (result < 0 || result > LONG_MAX)
       return -ERANGE;
or (2) Just add new `left_to_map` (or just left) argument to p2m_set_range().

> Also looks like you could get away with a single conditional operator here:
>
>      return !left || left == nr ? rc : (nr - left);

Thanks.

~ Oleksii

--------------HROQljmCX0Yx6E9D50dJ1CoZ
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
    <div class="moz-cite-prefix">On 8/5/25 6:04 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:f217021e-1fef-4324-a56e-529fd29b4c69@suse.com">
      <pre wrap="" class="moz-quote-pre">On 31.07.2025 17:58, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">This patch introduces p2m_set_range() and its core helper p2m_set_entry() for
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Nit: This patch doesn't introduce p2m_set_range(); it merely fleshes it out.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -7,11 +7,13 @@
 #include &lt;xen/rwlock.h&gt;
 #include &lt;xen/types.h&gt;
 
+#include &lt;asm/page.h&gt;
 #include &lt;asm/page-bits.h&gt;
 
 extern unsigned int p2m_root_order;
 #define P2M_ROOT_ORDER  p2m_root_order
 #define P2M_ROOT_PAGES  BIT(P2M_ROOT_ORDER, U)
+#define P2M_ROOT_LEVEL  HYP_PT_ROOT_LEVEL
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">I think I commented on this before, and I would have hoped for at least a remark
in the description to appear (perhaps even a comment here): It's okay(ish) to tie
these together for now, but in the longer run I don't expect this is going to be
wanted. If e.g. we ran Xen in Sv57 mode, there would be no reason at all to force
all P2Ms to use 5 levels of page tables.</pre>
    </blockquote>
    <pre>Do you mean that for G-stage it could be chosen any SvXX mode to limit an amount
of page tables necessary for G-stage? If yes, then, at least, I agree that a
comment should be added or, probably, "#warning optimize an amount of p2m root level
for MMU mode &gt; Sv48" (or maybe &gt;=).

Or do you mean if we set hgatp.mode=Sv57 then it is possible to limit an amount of
page table's levels to use? In this case I think hardware still will expect to see
5 levels of page tables.


</pre>
    <blockquote type="cite"
      cite="mid:f217021e-1fef-4324-a56e-529fd29b4c69@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -175,13 +179,257 @@ int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
     return 0;
 }
 
+/*
+ * Find and map the root page table. The caller is responsible for
+ * unmapping the table.
+ *
+ * The function will return NULL if the offset into the root table is
+ * invalid.
+ */
+static pte_t *p2m_get_root_pointer(struct p2m_domain *p2m, gfn_t gfn)
+{
+    unsigned long root_table_indx;
+
+    root_table_indx = gfn_x(gfn) &gt;&gt; XEN_PT_LEVEL_ORDER(P2M_ROOT_LEVEL);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Right now page table layouts / arrangements are indeed similar enough to
share accessor constructs. Nevertheless I find it problematic (doc-wise
at the very least) that a Xen page table construct is used to access a
P2M page table. If and when these needed to be decoupled, it would likely
help of the distinction was already made, by - for now - simply
introducing aliases (here e.g. P2M_LEVEL_ORDER(), expanding to
XEN_PT_LEVEL_ORDER() for the time being).</pre>
    </blockquote>
    <pre data-start="59" data-end="299">I think it's better to define this correctly now, as I initially missed
that only non-root page tables and all page table entries (PTEs) share
the same format as their corresponding Sv39, Sv48, or Sv57 modes
(i.e., corresponding to SvXXx4).</pre>
    <pre data-start="301" data-end="501">However, in this case, we're dealing with the <strong
    data-start="347" data-end="361">root level</strong>, which is extended
by 2 extra bits. Therefore, using <code data-start="415" data-end="437">XEN_PT_LEVEL_ORDER()</code> would be incorrect
if those two extra bits are actually used.</pre>
    <pre data-start="503" data-end="570">We're just fortunate that no one currently uses these extra 2 bits.
</pre>
    <blockquote type="cite"
      cite="mid:f217021e-1fef-4324-a56e-529fd29b4c69@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    if ( root_table_indx &gt;= P2M_ROOT_PAGES )
+        return NULL;
+
+    return __map_domain_page(p2m-&gt;root + root_table_indx);
+}
+
+static inline void p2m_write_pte(pte_t *p, pte_t pte, bool clean_pte)
+{
+    write_pte(p, pte);
+    if ( clean_pte )
+        clean_dcache_va_range(p, sizeof(*p));
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Not necessarily for right away, but if multiple adjacent PTEs are
written without releasing the lock, this then redundant cache flushing
can be a performance issue.</pre>
    </blockquote>
    <pre>Can't it be resolved on a caller side? Something like:
  p2m_write_pte(p1, pte1, false);
  p2m_write_pte(p2, pte2, false);
  p2m_write_pte(p3, pte3, false);
  p2m_write_pte(p4, pte4, true);
where p1-p4 are adjacent.

 
</pre>
    <blockquote type="cite"
      cite="mid:f217021e-1fef-4324-a56e-529fd29b4c69@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+}
+
+static inline void p2m_clean_pte(pte_t *p, bool clean_pte)
+{
+    pte_t pte;
+
+    memset(&amp;pte, 0, sizeof(pte));
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Why memset()? Why not simply give the variable an appropriate initializer?</pre>
    </blockquote>
    <pre>Good point. It would be much better just to use an appropriate initializer.

</pre>
    <blockquote type="cite"
      cite="mid:f217021e-1fef-4324-a56e-529fd29b4c69@suse.com">
      <pre wrap="" class="moz-quote-pre">Or use ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    p2m_write_pte(p, pte, clean_pte);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">... a compound literal here, like you do ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+}
+
+static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t)
+{
+    panic("%s: hasn't been implemented yet\n", __func__);
+
+    return (pte_t) { .pte = 0 };
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">... here? (Just {} would also do, if I'm not mistaken.)</pre>
    </blockquote>
    <pre>According to C99 it will be enough {}, but {.pte = 0} is more obvious and
clearer, IMO.

</pre>
    <blockquote type="cite"
      cite="mid:f217021e-1fef-4324-a56e-529fd29b4c69@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+}
+
+#define P2M_TABLE_MAP_NONE 0
+#define P2M_TABLE_MAP_NOMEM 1
+#define P2M_TABLE_SUPER_PAGE 2
+#define P2M_TABLE_NORMAL 3
+
+/*
+ * Take the currently mapped table, find the corresponding the entry
+ * corresponding to the GFN, and map the next table, if available.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Nit: Double "corresponding".

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+ * The previous table will be unmapped if the next level was mapped
+ * (e.g P2M_TABLE_NORMAL returned).
+ *
+ * `alloc_tbl` parameter indicates whether intermediate tables should
+ * be allocated when not present.
+ *
+ * Return values:
+ *  P2M_TABLE_MAP_NONE: a table allocation isn't permitted.
+ *  P2M_TABLE_MAP_NOMEM: allocating a new page failed.
+ *  P2M_TABLE_SUPER_PAGE: next level or leaf mapped normally.
+ *  P2M_TABLE_NORMAL: The next entry points to a superpage.
+ */
+static int p2m_next_level(struct p2m_domain *p2m, bool alloc_tbl,
+                          unsigned int level, pte_t **table,
+                          unsigned int offset)
+{
+    panic("%s: hasn't been implemented yet\n", __func__);
+
+    return P2M_TABLE_MAP_NONE;
+}
+
+/* Free pte sub-tree behind an entry */
+static void p2m_free_subtree(struct p2m_domain *p2m,
+                             pte_t entry, unsigned int level)
+{
+    panic("%s: hasn't been implemented yet\n", __func__);
+}
+
+/*
+ * Insert an entry in the p2m. This should be called with a mapping
+ * equal to a page/superpage.
+ */
+static int p2m_set_entry(struct p2m_domain *p2m,
+                           gfn_t gfn,
+                           unsigned long page_order,
+                           mfn_t mfn,
+                           p2m_type_t t)
+{
+    unsigned int level;
+    unsigned int target = page_order / PAGETABLE_ORDER;
+    pte_t *entry, *table, orig_pte;
+    int rc;
+    /* A mapping is removed if the MFN is invalid. */
+    bool removing_mapping = mfn_eq(mfn, INVALID_MFN);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Comment and code don't fit together. Many MFNs are invalid (any for which
mfn_valid() returns false), yet you only check for INVALID_MFN here.</pre>
    </blockquote>
    <pre>Probably, it makes sense to add an <code data-start="84"
    data-end="94">ASSERT()</code> here for the case when
<code data-start="118" data-end="134">mfn_valid(mfn)</code> is false, but the MFN is not explicitly equal to <code
    data-start="184" data-end="197">INVALID_MFN</code>.
This would indicate that someone attempted to perform a mapping with an
incorrect MFN, which, IMO, is entirely wrong.
In the case where the MFN is explicitly set to <code data-start="374"
    data-end="387">INVALID_MFN</code>, I believe it's
enough to indicate that a mapping is being removed.

</pre>
    <blockquote type="cite"
      cite="mid:f217021e-1fef-4324-a56e-529fd29b4c69@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    DECLARE_OFFSETS(offsets, gfn_to_gaddr(gfn));
+
+    ASSERT(p2m_is_write_locked(p2m));
+
+    /*
+     * Check if the level target is valid: we only support
+     * 4K - 2M - 1G mapping.
+     */
+    ASSERT((target &lt;= 2) &amp;&amp; !(page_order % PAGETABLE_ORDER));
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">If you think you need to check this, don't you also want to check that
GFN and MFN (the latter if it isn't INVALID_MFN) fit the requested order?</pre>
    </blockquote>
    <pre>I'm not 100% sure it makes sense to check <code data-start="91"
    data-end="103">page_order</code>, as in IMO, proper
alignment is already guaranteed by <code data-start="165" data-end="202">p2m_mapping_order(sgfn, smfn, left)</code>,
and thus both GFN and MFN are aligned accordingly.
So, I think this part of the check could be dropped.</pre>
    <blockquote type="cite"
      cite="mid:f217021e-1fef-4324-a56e-529fd29b4c69@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    table = p2m_get_root_pointer(p2m, gfn);
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
+        if ( (rc == P2M_TABLE_MAP_NONE) || (rc == P2M_TABLE_MAP_NOMEM) )
+        {
+            rc = (rc == P2M_TABLE_MAP_NONE) ? -ENOENT : -ENOMEM;
+            /*
+             * We are here because p2m_next_level has failed to map
+             * the intermediate page table (e.g the table does not exist
+             * and they p2m tree is read-only). It is a valid case
+             * when removing a mapping as it may not exist in the
+             * page table. In this case, just ignore it.
+             */
+            rc = removing_mapping ?  0 : rc;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Nit: Stray blank.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+            goto out;
+        }
+
+        if ( rc != P2M_TABLE_NORMAL )
+            break;
+    }
+
+    entry = table + offsets[level];
+
+    /*
+     * If we are here with level &gt; target, we must be at a leaf node,
+     * and we need to break up the superpage.
+     */
+    if ( level &gt; target )
+    {
+        panic("Shattering isn't implemented\n");
+    }
+
+    /*
+     * We should always be there with the correct level because all the
+     * intermediate tables have been installed if necessary.
+     */
+    ASSERT(level == target);
+
+    orig_pte = *entry;
+
+    if ( removing_mapping )
+        p2m_clean_pte(entry, p2m-&gt;clean_pte);
+    else
+    {
+        pte_t pte = p2m_pte_from_mfn(mfn, t);
+
+        p2m_write_pte(entry, pte, p2m-&gt;clean_pte);
+
+        p2m-&gt;max_mapped_gfn = gfn_max(p2m-&gt;max_mapped_gfn,
+                                      gfn_add(gfn, BIT(page_order, UL) - 1));
+        p2m-&gt;lowest_mapped_gfn = gfn_min(p2m-&gt;lowest_mapped_gfn, gfn);
+    }
+
+    p2m-&gt;need_flush = true;
+
+    /*
+     * Currently, the infrastructure required to enable CONFIG_HAS_PASSTHROUGH
+     * is not ready for RISC-V support.
+     *
+     * When CONFIG_HAS_PASSTHROUGH=y, iommu_iotlb_flush() should be done
+     * here.
+     */
+#ifdef CONFIG_HAS_PASSTHROUGH
+#   error "add code to flush IOMMU TLB"
+#endif
+
+    rc = 0;
+
+    /*
+     * Free the entry only if the original pte was valid and the base
+     * is different (to avoid freeing when permission is changed).
+     */
+    if ( pte_is_valid(orig_pte) &amp;&amp;
+         !mfn_eq(pte_get_mfn(*entry), pte_get_mfn(orig_pte)) )
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">I'm puzzled by this 2nd check: A permission change would - I expect - only
occur to a leaf entry. If the new entry is a super-page one and the old
wasn't, don't you still need to free the sub-tree, no matter whether the
MFNs are the same?</pre>
    </blockquote>
    <pre>I expect the MFNs to differ in this scenario, so the old sub-tree will be freed.

Based on your example (new entry is super-page and old entry isn't):
For old mapping (lets say, 4 KiB leaf) p2m_set_entry() walks all levels down
to L0, so we will have the following MMU page table walks:
  L2 PTE -&gt; L1 PTE (MFN of L0 page table) -&gt; L0 PTE -&gt; RAM

When new mapping (lets say, 2 MiB superpage) will be requested, p2m_set_entry()
will stop at L1 (the superpage level):
 L2 PTE -&gt; L1 PTE (at this moment, L1 PTE points to L0 page table, which
                   points to RAM)
Then the old L1 PTE will be saved in 'orig_pte', then writes 'entry' with
the RAM MFN for the 2 MiB mapping. The walk becomes:
  L2 PTE -&gt; L1 PTE -&gt; RAM

Therefore, 'entry' now holds an MFN pointing to RAM (superpage leaf). 'orig_pte'
still holds an MFN pointing to the L0 table (the old sub-tree). Since these MFNs
differ, the code calls p2m_free_subtree(p2m, orig_pte, …) and frees the old L0
sub-tree.</pre>
    <pre>    </pre>
    <blockquote type="cite"
      cite="mid:f217021e-1fef-4324-a56e-529fd29b4c69@suse.com">
      <pre wrap="" class="moz-quote-pre"> Plus consider the special case of MFN 0: If you clear
an entry using MFN 0, you will find old and new PTEs' both having the same
MFN.</pre>
    </blockquote>
    <pre>Isn't this happen only when a mapping removal is explicitly requested?
In the case of a mapping removal it seems to me it is enough just to
clear PTE with all zeroes.

</pre>
    <blockquote type="cite"
      cite="mid:f217021e-1fef-4324-a56e-529fd29b4c69@suse.com">
      <pre wrap="" class="moz-quote-pre"> static int p2m_set_range(struct p2m_domain *p2m,
                          gfn_t sgfn,
                          unsigned long nr,
                          mfn_t smfn,
                          p2m_type_t t)
 {
-    return -EOPNOTSUPP;
+    int rc = 0;
+    unsigned long left = nr;
+
+    /*
+     * Any reference taken by the P2M mappings (e.g. foreign mapping) will
+     * be dropped in relinquish_p2m_mapping(). As the P2M will still
+     * be accessible after, we need to prevent mapping to be added when the
+     * domain is dying.
+     */
+    if ( unlikely(p2m-&gt;domain-&gt;is_dying) )
+        return -EACCES;
+
+    while ( left )
+    {
+        unsigned long order = p2m_mapping_order(sgfn, smfn, left);
+
+        rc = p2m_set_entry(p2m, sgfn, order, smfn, t);
+        if ( rc )
+            break;
+
+        sgfn = gfn_add(sgfn, BIT(order, UL));
+        if ( !mfn_eq(smfn, INVALID_MFN) )
+           smfn = mfn_add(smfn, BIT(order, UL));
+
+        left -= BIT(order, UL);
+    }
+
+    return !left ? 0 : left == nr ? rc : (nr - left);
</pre>
    </blockquote>
    <blockquote type="cite"
      cite="mid:f217021e-1fef-4324-a56e-529fd29b4c69@suse.com">
      <blockquote type="cite"> </blockquote>
      <pre wrap="" class="moz-quote-pre">The function returning "int", you may be truncating the return value here.
In the worst case indicating success (0) or an error (negative) when some
of the upper bits were set.</pre>
    </blockquote>
    <pre>I think what will be better:
or (1) Return long instead of int and the following check:
   long result = nr - left;
   if (result &lt; 0 || result &gt; LONG_MAX)
      return -ERANGE;
or (2) Just add new `left_to_map` (or just left) argument to p2m_set_range().

</pre>
    <blockquote type="cite"
      cite="mid:f217021e-1fef-4324-a56e-529fd29b4c69@suse.com">
      <pre wrap="" class="moz-quote-pre">Also looks like you could get away with a single conditional operator here:

    return !left || left == nr ? rc : (nr - left);</pre>
    </blockquote>
    <pre>Thanks. 

~ Oleksii</pre>
  </body>
</html>

--------------HROQljmCX0Yx6E9D50dJ1CoZ--

