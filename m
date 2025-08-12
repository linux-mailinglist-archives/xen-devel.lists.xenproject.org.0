Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE25B21D0A
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 07:43:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1078241.1439238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulhmR-00015I-8Y; Tue, 12 Aug 2025 05:42:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1078241.1439238; Tue, 12 Aug 2025 05:42:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulhmR-00013l-5b; Tue, 12 Aug 2025 05:42:39 +0000
Received: by outflank-mailman (input) for mailman id 1078241;
 Tue, 12 Aug 2025 04:53:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Iua9=2Y=linux.dev=lance.yang@srs-se1.protection.inumbo.net>)
 id 1ulh0w-0002yj-4Z
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 04:53:34 +0000
Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com
 [95.215.58.182]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 48e10de0-7738-11f0-b898-0df219b8e170;
 Tue, 12 Aug 2025 06:53:27 +0200 (CEST)
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
X-Inumbo-ID: 48e10de0-7738-11f0-b898-0df219b8e170
Message-ID: <4865af61-7343-4c60-b4e2-f142f92b7c79@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1754974406;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vxkRGPtW/Hy53i4ls2hik5N/SCj/n27xlLut7svn+U8=;
	b=p9Nqks/mlOZN/tGrqRDmjtIpBiBe1xj7j/3hPcPcHoAgdhOSWGsOvQGG4WWQYwUf16ocpN
	/eSOnoYSrPeVJDmil+MF/Q4G88O3SeFZwq9agCDOjLtfcZ875hNUGHK2AXTesoYOVApLl4
	Vj8yiy6OgDEwRzTUKixNKG2ngK13V1Y=
Date: Tue, 12 Aug 2025 12:52:59 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v3 01/11] mm/huge_memory: move more common code into
 insert_pmd()
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>
Cc: linux-mm@kvack.org, xen-devel@lists.xenproject.org,
 linux-fsdevel@vger.kernel.org, nvdimm@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Dan Williams <dan.j.williams@intel.com>, Matthew Wilcox
 <willy@infradead.org>, Jan Kara <jack@suse.cz>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>,
 Hugh Dickins <hughd@google.com>, Oscar Salvador <osalvador@suse.de>,
 Alistair Popple <apopple@nvidia.com>, Wei Yang <richard.weiyang@gmail.com>,
 linux-kernel@vger.kernel.org
References: <20250811112631.759341-1-david@redhat.com>
 <20250811112631.759341-2-david@redhat.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <20250811112631.759341-2-david@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 2025/8/11 19:26, David Hildenbrand wrote:
> Let's clean it all further up.
> 
> No functional change intended.
> 
> Reviewed-by: Oscar Salvador <osalvador@suse.de>
> Reviewed-by: Alistair Popple <apopple@nvidia.com>
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Reviewed-by: Wei Yang <richard.weiyang@gmail.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Nice. Feel free to add:

Reviewed-by: Lance Yang <lance.yang@linux.dev>

Thanks,
Lance

> ---
>   mm/huge_memory.c | 72 ++++++++++++++++--------------------------------
>   1 file changed, 24 insertions(+), 48 deletions(-)
> 
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 2b4ea5a2ce7d2..5314a89d676f1 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -1379,15 +1379,25 @@ struct folio_or_pfn {
>   	bool is_folio;
>   };
>   
> -static int insert_pmd(struct vm_area_struct *vma, unsigned long addr,
> +static vm_fault_t insert_pmd(struct vm_area_struct *vma, unsigned long addr,
>   		pmd_t *pmd, struct folio_or_pfn fop, pgprot_t prot,
> -		bool write, pgtable_t pgtable)
> +		bool write)
>   {
>   	struct mm_struct *mm = vma->vm_mm;
> +	pgtable_t pgtable = NULL;
> +	spinlock_t *ptl;
>   	pmd_t entry;
>   
> -	lockdep_assert_held(pmd_lockptr(mm, pmd));
> +	if (addr < vma->vm_start || addr >= vma->vm_end)
> +		return VM_FAULT_SIGBUS;
>   
> +	if (arch_needs_pgtable_deposit()) {
> +		pgtable = pte_alloc_one(vma->vm_mm);
> +		if (!pgtable)
> +			return VM_FAULT_OOM;
> +	}
> +
> +	ptl = pmd_lock(mm, pmd);
>   	if (!pmd_none(*pmd)) {
>   		const unsigned long pfn = fop.is_folio ? folio_pfn(fop.folio) :
>   					  fop.pfn;
> @@ -1395,15 +1405,14 @@ static int insert_pmd(struct vm_area_struct *vma, unsigned long addr,
>   		if (write) {
>   			if (pmd_pfn(*pmd) != pfn) {
>   				WARN_ON_ONCE(!is_huge_zero_pmd(*pmd));
> -				return -EEXIST;
> +				goto out_unlock;
>   			}
>   			entry = pmd_mkyoung(*pmd);
>   			entry = maybe_pmd_mkwrite(pmd_mkdirty(entry), vma);
>   			if (pmdp_set_access_flags(vma, addr, pmd, entry, 1))
>   				update_mmu_cache_pmd(vma, addr, pmd);
>   		}
> -
> -		return -EEXIST;
> +		goto out_unlock;
>   	}
>   
>   	if (fop.is_folio) {
> @@ -1424,11 +1433,17 @@ static int insert_pmd(struct vm_area_struct *vma, unsigned long addr,
>   	if (pgtable) {
>   		pgtable_trans_huge_deposit(mm, pmd, pgtable);
>   		mm_inc_nr_ptes(mm);
> +		pgtable = NULL;
>   	}
>   
>   	set_pmd_at(mm, addr, pmd, entry);
>   	update_mmu_cache_pmd(vma, addr, pmd);
> -	return 0;
> +
> +out_unlock:
> +	spin_unlock(ptl);
> +	if (pgtable)
> +		pte_free(mm, pgtable);
> +	return VM_FAULT_NOPAGE;
>   }
>   
>   /**
> @@ -1450,9 +1465,6 @@ vm_fault_t vmf_insert_pfn_pmd(struct vm_fault *vmf, unsigned long pfn,
>   	struct folio_or_pfn fop = {
>   		.pfn = pfn,
>   	};
> -	pgtable_t pgtable = NULL;
> -	spinlock_t *ptl;
> -	int error;
>   
>   	/*
>   	 * If we had pmd_special, we could avoid all these restrictions,
> @@ -1464,25 +1476,9 @@ vm_fault_t vmf_insert_pfn_pmd(struct vm_fault *vmf, unsigned long pfn,
>   						(VM_PFNMAP|VM_MIXEDMAP));
>   	BUG_ON((vma->vm_flags & VM_PFNMAP) && is_cow_mapping(vma->vm_flags));
>   
> -	if (addr < vma->vm_start || addr >= vma->vm_end)
> -		return VM_FAULT_SIGBUS;
> -
> -	if (arch_needs_pgtable_deposit()) {
> -		pgtable = pte_alloc_one(vma->vm_mm);
> -		if (!pgtable)
> -			return VM_FAULT_OOM;
> -	}
> -
>   	pfnmap_setup_cachemode_pfn(pfn, &pgprot);
>   
> -	ptl = pmd_lock(vma->vm_mm, vmf->pmd);
> -	error = insert_pmd(vma, addr, vmf->pmd, fop, pgprot, write,
> -			   pgtable);
> -	spin_unlock(ptl);
> -	if (error && pgtable)
> -		pte_free(vma->vm_mm, pgtable);
> -
> -	return VM_FAULT_NOPAGE;
> +	return insert_pmd(vma, addr, vmf->pmd, fop, pgprot, write);
>   }
>   EXPORT_SYMBOL_GPL(vmf_insert_pfn_pmd);
>   
> @@ -1491,35 +1487,15 @@ vm_fault_t vmf_insert_folio_pmd(struct vm_fault *vmf, struct folio *folio,
>   {
>   	struct vm_area_struct *vma = vmf->vma;
>   	unsigned long addr = vmf->address & PMD_MASK;
> -	struct mm_struct *mm = vma->vm_mm;
>   	struct folio_or_pfn fop = {
>   		.folio = folio,
>   		.is_folio = true,
>   	};
> -	spinlock_t *ptl;
> -	pgtable_t pgtable = NULL;
> -	int error;
> -
> -	if (addr < vma->vm_start || addr >= vma->vm_end)
> -		return VM_FAULT_SIGBUS;
>   
>   	if (WARN_ON_ONCE(folio_order(folio) != PMD_ORDER))
>   		return VM_FAULT_SIGBUS;
>   
> -	if (arch_needs_pgtable_deposit()) {
> -		pgtable = pte_alloc_one(vma->vm_mm);
> -		if (!pgtable)
> -			return VM_FAULT_OOM;
> -	}
> -
> -	ptl = pmd_lock(mm, vmf->pmd);
> -	error = insert_pmd(vma, addr, vmf->pmd, fop, vma->vm_page_prot,
> -			   write, pgtable);
> -	spin_unlock(ptl);
> -	if (error && pgtable)
> -		pte_free(mm, pgtable);
> -
> -	return VM_FAULT_NOPAGE;
> +	return insert_pmd(vma, addr, vmf->pmd, fop, vma->vm_page_prot, write);
>   }
>   EXPORT_SYMBOL_GPL(vmf_insert_folio_pmd);
>   


