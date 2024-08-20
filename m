Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A0195862F
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2024 13:54:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.780329.1189959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgNRh-0006v9-4G; Tue, 20 Aug 2024 11:54:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 780329.1189959; Tue, 20 Aug 2024 11:54:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgNRg-0006so-WB; Tue, 20 Aug 2024 11:54:41 +0000
Received: by outflank-mailman (input) for mailman id 780329;
 Tue, 20 Aug 2024 11:54:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2WjV=PT=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1sgNRf-0006qh-UP
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2024 11:54:39 +0000
Received: from sonata.ens-lyon.org (domu-toccata.ens-lyon.fr [140.77.166.138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f941f859-5eea-11ef-a507-bb4a2ccca743;
 Tue, 20 Aug 2024 13:54:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id CB27CA03AF;
 Tue, 20 Aug 2024 13:54:36 +0200 (CEST)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jJVVtPd4cGEY; Tue, 20 Aug 2024 13:54:36 +0200 (CEST)
Received: from begin (nat-inria-interne-52-gw-01-bso.bordeaux.inria.fr
 [194.199.1.52])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id B0A72A03AE;
 Tue, 20 Aug 2024 13:54:36 +0200 (CEST)
Received: from samy by begin with local (Exim 4.98)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1sgNRc-00000000FaV-1YWr; Tue, 20 Aug 2024 13:54:36 +0200
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
X-Inumbo-ID: f941f859-5eea-11ef-a507-bb4a2ccca743
Date: Tue, 20 Aug 2024 13:54:36 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 2/3] mini-os: mm: switch need_pgt() to use walk_pt()
Message-ID: <20240820115436.hnrh5abr66rf6hhc@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
References: <20240813134158.580-1-jgross@suse.com>
 <20240813134158.580-3-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240813134158.580-3-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le mar. 13 août 2024 15:41:57 +0200, a ecrit:
> Instead of open coding a page table walk, use walk_pt() in need_pgt().
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
> V2:
> - add comment and ASSERT() (Samuel Thibault)
> ---
>  arch/x86/mm.c | 72 +++++++++++++++++++++------------------------------
>  1 file changed, 30 insertions(+), 42 deletions(-)
> 
> diff --git a/arch/x86/mm.c b/arch/x86/mm.c
> index 9849b985..84a6d7f0 100644
> --- a/arch/x86/mm.c
> +++ b/arch/x86/mm.c
> @@ -523,57 +523,45 @@ static pgentry_t *get_pgt(unsigned long va)
>   * return a valid PTE for a given virtual address. If PTE does not exist,
>   * allocate page-table pages.
>   */
> -pgentry_t *need_pgt(unsigned long va)
> +static int need_pgt_func(unsigned long va, unsigned int lvl, bool is_leaf,
> +                         pgentry_t *pte, void *par)
>  {
> +    pgentry_t **result = par;
>      unsigned long pt_mfn;
> -    pgentry_t *tab;
>      unsigned long pt_pfn;
> -    unsigned offset;
> +    unsigned int idx;
>  
> -    tab = pt_base;
> -    pt_mfn = virt_to_mfn(pt_base);
> +    if ( !is_leaf )
> +        return 0;
>  
> -#if defined(__x86_64__)
> -    offset = l4_table_offset(va);
> -    if ( !(tab[offset] & _PAGE_PRESENT) )
> -    {
> -        pt_pfn = virt_to_pfn(alloc_page());
> -        if ( !pt_pfn )
> -            return NULL;
> -        new_pt_frame(&pt_pfn, pt_mfn, offset, L3_FRAME);
> -    }
> -    ASSERT(tab[offset] & _PAGE_PRESENT);
> -    pt_mfn = pte_to_mfn(tab[offset]);
> -    tab = mfn_to_virt(pt_mfn);
> -#endif
> -    offset = l3_table_offset(va);
> -    if ( !(tab[offset] & _PAGE_PRESENT) ) 
> -    {
> -        pt_pfn = virt_to_pfn(alloc_page());
> -        if ( !pt_pfn )
> -            return NULL;
> -        new_pt_frame(&pt_pfn, pt_mfn, offset, L2_FRAME);
> -    }
> -    ASSERT(tab[offset] & _PAGE_PRESENT);
> -    pt_mfn = pte_to_mfn(tab[offset]);
> -    tab = mfn_to_virt(pt_mfn);
> -    offset = l2_table_offset(va);
> -    if ( !(tab[offset] & _PAGE_PRESENT) )
> +    if ( lvl == L1_FRAME || (*pte & _PAGE_PRESENT) )
>      {
> -        pt_pfn = virt_to_pfn(alloc_page());
> -        if ( !pt_pfn )
> -            return NULL;
> -        new_pt_frame(&pt_pfn, pt_mfn, offset, L1_FRAME);
> +        /*
> +         * The PTE is not addressing a page table (is_leaf is true). If we are
> +         * either at the lowest level or we have a valid large page, we don't
> +         * need to allocate a page table.
> +         */
> +        ASSERT(lvl == L1_FRAME || (*pte & _PAGE_PSE));
> +        *result = pte;
> +        return 1;
>      }
> -    ASSERT(tab[offset] & _PAGE_PRESENT);
> -    if ( tab[offset] & _PAGE_PSE )
> -        return &tab[offset];
>  
> -    pt_mfn = pte_to_mfn(tab[offset]);
> -    tab = mfn_to_virt(pt_mfn);
> +    pt_mfn = virt_to_mfn(pte);
> +    pt_pfn = virt_to_pfn(alloc_page());
> +    if ( !pt_pfn )
> +        return -1;
> +    idx = idx_from_va_lvl(va, lvl);
> +    new_pt_frame(&pt_pfn, pt_mfn, idx, lvl - 1);
>  
> -    offset = l1_table_offset(va);
> -    return &tab[offset];
> +    return 0;
> +}
> +
> +pgentry_t *need_pgt(unsigned long va)
> +{
> +    pgentry_t *tab = NULL;
> +
> +    walk_pt(va, va, need_pgt_func, &tab);
> +    return tab;
>  }
>  EXPORT_SYMBOL(need_pgt);
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

