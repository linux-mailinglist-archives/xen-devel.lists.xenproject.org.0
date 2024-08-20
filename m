Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1643958627
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2024 13:53:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.780318.1189945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgNQ0-0006Iw-OB; Tue, 20 Aug 2024 11:52:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 780318.1189945; Tue, 20 Aug 2024 11:52:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgNQ0-0006Fo-Kl; Tue, 20 Aug 2024 11:52:56 +0000
Received: by outflank-mailman (input) for mailman id 780318;
 Tue, 20 Aug 2024 11:52:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2WjV=PT=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1sgNPy-0006Dx-Kr
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2024 11:52:54 +0000
Received: from sonata.ens-lyon.org (domu-toccata.ens-lyon.fr [140.77.166.138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9504ca1-5eea-11ef-8776-851b0ebba9a2;
 Tue, 20 Aug 2024 13:52:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 7583CA03AE;
 Tue, 20 Aug 2024 13:52:49 +0200 (CEST)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UeHk8AajPhZO; Tue, 20 Aug 2024 13:52:49 +0200 (CEST)
Received: from begin (nat-inria-interne-52-gw-01-bso.bordeaux.inria.fr
 [194.199.1.52])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 53747A0345;
 Tue, 20 Aug 2024 13:52:49 +0200 (CEST)
Received: from samy by begin with local (Exim 4.98)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1sgNPs-00000000FYr-4Bk7; Tue, 20 Aug 2024 13:52:49 +0200
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
X-Inumbo-ID: b9504ca1-5eea-11ef-8776-851b0ebba9a2
Date: Tue, 20 Aug 2024 13:52:48 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 1/3] mini-os: mm: introduce generic page table walk
 function
Message-ID: <20240820115248.34qg23znyx5qoh37@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
References: <20240813134158.580-1-jgross@suse.com>
 <20240813134158.580-2-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240813134158.580-2-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le mar. 13 août 2024 15:41:56 +0200, a ecrit:
> In x86 mm code there are multiple instances of page table walks for
> different purposes.
> 
> Introduce a generic page table walker being able to cover the current
> use cases. It will be used for other cases in future, too.
> 
> The page table walker needs some per-level data, so add a table for
> that data. Merge it with the already existing pt_prot[] array.
> 
> Rewrite get_pgt() to use the new walker.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: SAmuel Thibault <samuel.thibault@ens-lyon.org>

> ---
> V2:
> - add idx_from_va_lvl() helper (Samuel Thibault)
> ---
>  arch/x86/mm.c | 157 +++++++++++++++++++++++++++++++++++++-------------
>  1 file changed, 118 insertions(+), 39 deletions(-)
> 
> diff --git a/arch/x86/mm.c b/arch/x86/mm.c
> index 7ddf16e4..9849b985 100644
> --- a/arch/x86/mm.c
> +++ b/arch/x86/mm.c
> @@ -125,20 +125,30 @@ void arch_mm_preinit(void *p)
>  }
>  #endif
>  
> +static const struct {
> +    unsigned int shift;
> +    unsigned int entries;
> +    pgentry_t prot;
> +} ptdata[PAGETABLE_LEVELS + 1] = {
> +    { 0, 0, 0 },
> +    { L1_PAGETABLE_SHIFT, L1_PAGETABLE_ENTRIES, L1_PROT },
> +    { L2_PAGETABLE_SHIFT, L2_PAGETABLE_ENTRIES, L2_PROT },
> +    { L3_PAGETABLE_SHIFT, L3_PAGETABLE_ENTRIES, L3_PROT },
> +#if defined(__x86_64__)
> +    { L4_PAGETABLE_SHIFT, L4_PAGETABLE_ENTRIES, L4_PROT },
> +#endif
> +};
> +
> +static inline unsigned int idx_from_va_lvl(unsigned long va, unsigned int lvl)
> +{
> +    return (va >> ptdata[lvl].shift) & (ptdata[lvl].entries - 1);
> +}
> +
>  /*
>   * Make pt_pfn a new 'level' page table frame and hook it into the page
>   * table at offset in previous level MFN (pref_l_mfn). pt_pfn is a guest
>   * PFN.
>   */
> -static pgentry_t pt_prot[PAGETABLE_LEVELS] = {
> -    L1_PROT,
> -    L2_PROT,
> -    L3_PROT,
> -#if defined(__x86_64__)
> -    L4_PROT,
> -#endif
> -};
> -
>  static void new_pt_frame(unsigned long *pt_pfn, unsigned long prev_l_mfn, 
>                           unsigned long offset, unsigned long level)
>  {   
> @@ -170,7 +180,7 @@ static void new_pt_frame(unsigned long *pt_pfn, unsigned long prev_l_mfn,
>      mmu_updates[0].ptr = (tab[l2_table_offset(pt_page)] & PAGE_MASK) + 
>          sizeof(pgentry_t) * l1_table_offset(pt_page);
>      mmu_updates[0].val = (pgentry_t)pfn_to_mfn(*pt_pfn) << PAGE_SHIFT | 
> -        (pt_prot[level - 1] & ~_PAGE_RW);
> +        (ptdata[level].prot & ~_PAGE_RW);
>      
>      if ( (rc = HYPERVISOR_mmu_update(mmu_updates, 1, NULL, DOMID_SELF)) < 0 )
>      {
> @@ -183,7 +193,7 @@ static void new_pt_frame(unsigned long *pt_pfn, unsigned long prev_l_mfn,
>      mmu_updates[0].ptr =
>          ((pgentry_t)prev_l_mfn << PAGE_SHIFT) + sizeof(pgentry_t) * offset;
>      mmu_updates[0].val = (pgentry_t)pfn_to_mfn(*pt_pfn) << PAGE_SHIFT |
> -        pt_prot[level];
> +        ptdata[level + 1].prot;
>  
>      if ( (rc = HYPERVISOR_mmu_update(mmu_updates, 1, NULL, DOMID_SELF)) < 0 ) 
>      {
> @@ -192,7 +202,7 @@ static void new_pt_frame(unsigned long *pt_pfn, unsigned long prev_l_mfn,
>      }
>  #else
>      tab = mfn_to_virt(prev_l_mfn);
> -    tab[offset] = (*pt_pfn << PAGE_SHIFT) | pt_prot[level];
> +    tab[offset] = (*pt_pfn << PAGE_SHIFT) | ptdata[level + 1].prot;
>  #endif
>  
>      *pt_pfn += 1;
> @@ -202,6 +212,82 @@ static void new_pt_frame(unsigned long *pt_pfn, unsigned long prev_l_mfn,
>  static mmu_update_t mmu_updates[L1_PAGETABLE_ENTRIES + 1];
>  #endif
>  
> +/*
> + * Walk recursively through all PTEs calling a specified function. The function
> + * is allowed to change the PTE, the walker will follow the new value.
> + * The walk will cover the virtual address range [from_va .. to_va].
> + * The supplied function will be called with the following parameters:
> + * va: base virtual address of the area covered by the current PTE
> + * lvl: page table level of the PTE (1 = lowest level, PAGETABLE_LEVELS =
> + *      PTE in page table addressed by %cr3)
> + * is_leaf: true if PTE doesn't address another page table (it is either at
> + *          level 1, or invalid, or has its PSE bit set)
> + * pte: address of the PTE
> + * par: parameter, passed to walk_pt() by caller
> + * Return value of func() being non-zero will terminate walk_pt(), walk_pt()
> + * will return that value in this case, zero else.
> + */
> +static int walk_pt(unsigned long from_va, unsigned long to_va,
> +                   int (func)(unsigned long va, unsigned int lvl,
> +                              bool is_leaf, pgentry_t *pte, void *par),
> +                   void *par)
> +{
> +    unsigned int lvl = PAGETABLE_LEVELS;
> +    unsigned int ptindex[PAGETABLE_LEVELS + 1];
> +    unsigned long va = round_pgdown(from_va);
> +    unsigned long va_lvl;
> +    pgentry_t *tab[PAGETABLE_LEVELS + 1];
> +    pgentry_t *pte;
> +    bool is_leaf;
> +    int ret;
> +
> +    /* Start at top level page table. */
> +    tab[lvl] = pt_base;
> +    ptindex[lvl] = idx_from_va_lvl(va, lvl);
> +
> +    while ( va < (to_va | (PAGE_SIZE - 1)) )
> +    {
> +        pte = tab[lvl] + ptindex[lvl];
> +        is_leaf = (lvl == L1_FRAME) || (*pte & _PAGE_PSE) ||
> +                  !(*pte & _PAGE_PRESENT);
> +        va_lvl = va & ~((1UL << ptdata[lvl].shift) - 1);
> +        ret = func(va_lvl, lvl, is_leaf, pte, par);
> +        if ( ret )
> +            return ret;
> +
> +        /* PTE might have been modified by func(), reevaluate leaf state. */
> +        is_leaf = (lvl == L1_FRAME) || (*pte & _PAGE_PSE) ||
> +                  !(*pte & _PAGE_PRESENT);
> +
> +        if ( is_leaf )
> +        {
> +            /* Reached a leaf PTE. Advance to next page. */
> +            va += 1UL << ptdata[lvl].shift;
> +            ptindex[lvl]++;
> +
> +            /* Check for the need to traverse up again. */
> +            while ( ptindex[lvl] == ptdata[lvl].entries )
> +            {
> +                /* End of virtual address space? */
> +                if ( lvl == PAGETABLE_LEVELS )
> +                    return 0;
> +                /* Reached end of current page table, one level up. */
> +                lvl++;
> +                ptindex[lvl]++;
> +            }
> +        }
> +        else
> +        {
> +            /* Not a leaf, walk one level down. */
> +            lvl--;
> +            tab[lvl] = mfn_to_virt(pte_to_mfn(*pte));
> +            ptindex[lvl] = idx_from_va_lvl(va, lvl);
> +        }
> +    }
> +
> +    return 0;
> +}
> +
>  /*
>   * Build the initial pagetable.
>   */
> @@ -407,36 +493,29 @@ static void set_readonly(void *text, void *etext)
>  /*
>   * get the PTE for virtual address va if it exists. Otherwise NULL.
>   */
> -static pgentry_t *get_pgt(unsigned long va)
> +static int get_pgt_func(unsigned long va, unsigned int lvl, bool is_leaf,
> +                        pgentry_t *pte, void *par)
>  {
> -    unsigned long mfn;
> -    pgentry_t *tab;
> -    unsigned offset;
> +    pgentry_t **result;
>  
> -    tab = pt_base;
> -    mfn = virt_to_mfn(pt_base);
> +    if ( !(*pte & _PAGE_PRESENT) && lvl > L1_FRAME )
> +        return -1;
>  
> -#if defined(__x86_64__)
> -    offset = l4_table_offset(va);
> -    if ( !(tab[offset] & _PAGE_PRESENT) )
> -        return NULL;
> -    mfn = pte_to_mfn(tab[offset]);
> -    tab = mfn_to_virt(mfn);
> -#endif
> -    offset = l3_table_offset(va);
> -    if ( !(tab[offset] & _PAGE_PRESENT) )
> -        return NULL;
> -    mfn = pte_to_mfn(tab[offset]);
> -    tab = mfn_to_virt(mfn);
> -    offset = l2_table_offset(va);
> -    if ( !(tab[offset] & _PAGE_PRESENT) )
> -        return NULL;
> -    if ( tab[offset] & _PAGE_PSE )
> -        return &tab[offset];
> -    mfn = pte_to_mfn(tab[offset]);
> -    tab = mfn_to_virt(mfn);
> -    offset = l1_table_offset(va);
> -    return &tab[offset];
> +    if ( lvl > L1_FRAME && !(*pte & _PAGE_PSE) )
> +        return 0;
> +
> +    result = par;
> +    *result = pte;
> +
> +    return 0;
> +}
> +
> +static pgentry_t *get_pgt(unsigned long va)
> +{
> +    pgentry_t *tab = NULL;
> +
> +    walk_pt(va, va, get_pgt_func, &tab);
> +    return tab;
>  }
>  
>  
> -- 
> 2.43.0
> 

-- 
Samuel
<N> je déteste import
<N> parce que lorsque tu fais du python et que tu oublies le #!/bin/env python et que tu mets le fichier exécutable
<N> import est exécuté
 -+- #ens-mim - pourquoi mon script python change le curseur de la souris ?! -+-

