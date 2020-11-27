Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5592B2C690D
	for <lists+xen-devel@lfdr.de>; Fri, 27 Nov 2020 17:03:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.39614.72562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kigCR-0001eo-SP; Fri, 27 Nov 2020 16:02:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 39614.72562; Fri, 27 Nov 2020 16:02:19 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kigCR-0001eP-Oj; Fri, 27 Nov 2020 16:02:19 +0000
Received: by outflank-mailman (input) for mailman id 39614;
 Fri, 27 Nov 2020 16:02:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rmeX=FB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kigCQ-0001eK-2Y
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 16:02:18 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ab2b01bc-604a-4af7-97c8-a92a590696a8;
 Fri, 27 Nov 2020 16:02:16 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C230CAC2D;
 Fri, 27 Nov 2020 16:02:15 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=rmeX=FB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kigCQ-0001eK-2Y
	for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 16:02:18 +0000
X-Inumbo-ID: ab2b01bc-604a-4af7-97c8-a92a590696a8
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id ab2b01bc-604a-4af7-97c8-a92a590696a8;
	Fri, 27 Nov 2020 16:02:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606492935; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NgfoAm+mF4Fjgn0c434j7wnv4MDSiRf0c2pqPYGz+fk=;
	b=tCK8Xcd4QZVmFex0+IWp0UgsWwwdhgT5toB3QMvcareGeoggQr5ZAYwpzJhC1yrCLVeCko
	e2ravUv8RG587zJKI8i15VjkOHRKRAulwBDsq21lXo++KBElPKu1gg/dzOl1F+ZSUAH2O+
	CJkKT5mD7GIdP2IcVEXlGfRJ1ItBQTg=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id C230CAC2D;
	Fri, 27 Nov 2020 16:02:15 +0000 (UTC)
Subject: Re: [PATCH v10 7/7] vtd: use a bit field for dma_pte
To: Paul Durrant <paul@xen.org>, Kevin Tian <kevin.tian@intel.com>
Cc: Paul Durrant <pdurrant@amazon.com>, xen-devel@lists.xenproject.org
References: <20201120132440.1141-1-paul@xen.org>
 <20201120132440.1141-8-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <24774b4e-3ae8-2941-24ee-722acea69657@suse.com>
Date: Fri, 27 Nov 2020 17:02:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201120132440.1141-8-paul@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 20.11.2020 14:24, Paul Durrant wrote:
> @@ -709,20 +709,23 @@ static void dma_pte_clear_one(struct domain *domain, uint64_t addr,
>      page = (struct dma_pte *)map_vtd_domain_page(pg_maddr);
>      pte = page + address_level_offset(addr, 1);
>  
> -    if ( !dma_pte_present(*pte) )
> +    if ( !pte->r && !pte->w )

I think dma_pte_present() wants to stay, so we would have to touch
only one place when adding support for x.

>      {
>          spin_unlock(&hd->arch.mapping_lock);
>          unmap_vtd_domain_page(page);
>          return;
>      }
>  
> -    dma_clear_pte(*pte);
> -    *flush_flags |= IOMMU_FLUSHF_modified;
> +    pte->r = pte->w = false;
> +    smp_wmb();
> +    pte->val = 0;
>  
>      spin_unlock(&hd->arch.mapping_lock);
>      iommu_sync_cache(pte, sizeof(struct dma_pte));

Just as an observation - in an earlier patch I think there was a
code sequence having these the other way around. I think we want
to settle one one way of doing this (flush then unlock, or unlock
then flush). Kevin?

> @@ -1775,15 +1778,12 @@ static int __must_check intel_iommu_map_page(struct domain *d, dfn_t dfn,
>      page = (struct dma_pte *)map_vtd_domain_page(pg_maddr);
>      pte = &page[dfn_x(dfn) & LEVEL_MASK];
>      old = *pte;
> -
> -    dma_set_pte_addr(new, mfn_to_maddr(mfn));
> -    dma_set_pte_prot(new,
> -                     ((flags & IOMMUF_readable) ? DMA_PTE_READ  : 0) |
> -                     ((flags & IOMMUF_writable) ? DMA_PTE_WRITE : 0));
> -
> -    /* Set the SNP on leaf page table if Snoop Control available */
> -    if ( iommu_snoop )
> -        dma_set_pte_snp(new);
> +    new = (struct dma_pte){
> +        .r = flags & IOMMUF_readable,
> +        .w = flags & IOMMUF_writable,
> +        .snp = iommu_snoop,
> +        .addr = mfn_x(mfn),
> +    };

We still haven't settled on a newer gcc baseline, so this kind of
initializer is still not allowed (as in: will break the build) for
struct-s with unnamed sub-struct-s / sub-union-s.

> @@ -2611,18 +2611,18 @@ static void vtd_dump_page_table_level(paddr_t pt_maddr, int level, paddr_t gpa,
>              process_pending_softirqs();
>  
>          pte = &pt_vaddr[i];
> -        if ( !dma_pte_present(*pte) )
> +        if ( !pte->r && !pte->w )
>              continue;
>  
>          address = gpa + offset_level_address(i, level);
>          if ( next_level >= 1 ) 
> -            vtd_dump_page_table_level(dma_pte_addr(*pte), next_level,
> +            vtd_dump_page_table_level(pfn_to_paddr(pte->addr), next_level,
>                                        address, indent + 1);
>          else
>              printk("%*sdfn: %08lx mfn: %08lx\n",
>                     indent, "",
>                     (unsigned long)(address >> PAGE_SHIFT_4K),
> -                   (unsigned long)(dma_pte_addr(*pte) >> PAGE_SHIFT_4K));
> +                   (unsigned long)(pte->addr));

Could you also drop the no longer needed pair of parentheses. I
further suspect the cast isn't needed (anymore?). (Otoh I think
I recall oddities with gcc's printf()-style format checking and
direct passing of bitfields. But if that's a problem, I think
one of the earlier ones already introduced such an issue. So
perhaps we can wait until someone actually confirms there is an
issue - quite likely this someone would be me anyway.)

> --- a/xen/drivers/passthrough/vtd/iommu.h
> +++ b/xen/drivers/passthrough/vtd/iommu.h
> @@ -244,38 +244,21 @@ struct context_entry {
>  #define level_size(l) (1 << level_to_offset_bits(l))
>  #define align_to_level(addr, l) ((addr + level_size(l) - 1) & level_mask(l))
>  
> -/*
> - * 0: readable
> - * 1: writable
> - * 2-6: reserved
> - * 7: super page
> - * 8-11: available
> - * 12-63: Host physcial address
> - */
>  struct dma_pte {
> -    u64 val;
> +    union {
> +        uint64_t val;
> +        struct {
> +            bool r:1;
> +            bool w:1;
> +            unsigned int reserved0:1;
> +            unsigned int ignored0:4;
> +            bool ps:1;
> +            unsigned int ignored1:3;
> +            bool snp:1;
> +            uint64_t addr:52;

As per the doc I look at this extends only to bit 51 at most.
Above are 11 ignored bits and (in leaf entries) the TM one.

Considering the differences between leaf and intermediate
entries, perhaps leaf-only fields could gain a brief comment?

Jan

