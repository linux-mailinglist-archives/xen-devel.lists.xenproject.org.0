Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7223CFB5C
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jul 2021 15:55:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.158781.292114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5qCs-0003HR-Fm; Tue, 20 Jul 2021 13:54:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 158781.292114; Tue, 20 Jul 2021 13:54:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5qCs-0003Ej-Ck; Tue, 20 Jul 2021 13:54:46 +0000
Received: by outflank-mailman (input) for mailman id 158781;
 Tue, 20 Jul 2021 13:54:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CKIv=MM=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1m5qCr-0003Ed-1P
 for xen-devel@lists.xenproject.org; Tue, 20 Jul 2021 13:54:45 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 08742c82-e962-11eb-8b7e-12813bfff9fa;
 Tue, 20 Jul 2021 13:54:42 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id C76616736F; Tue, 20 Jul 2021 15:54:37 +0200 (CEST)
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
X-Inumbo-ID: 08742c82-e962-11eb-8b7e-12813bfff9fa
Date: Tue, 20 Jul 2021 15:54:37 +0200
From: Christoph Hellwig <hch@lst.de>
To: Tianyu Lan <ltykernel@gmail.com>
Cc: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
	wei.liu@kernel.org, decui@microsoft.com, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
	dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
	konrad.wilk@oracle.com, boris.ostrovsky@oracle.com, jgross@suse.com,
	sstabellini@kernel.org, joro@8bytes.org, will@kernel.org,
	davem@davemloft.net, kuba@kernel.org, jejb@linux.ibm.com,
	martin.petersen@oracle.com, arnd@arndb.de, hch@lst.de,
	m.szyprowski@samsung.com, robin.murphy@arm.com,
	kirill.shutemov@linux.intel.com, akpm@linux-foundation.org,
	rppt@kernel.org, Tianyu.Lan@microsoft.com, thomas.lendacky@amd.com,
	ardb@kernel.org, robh@kernel.org, nramas@linux.microsoft.com,
	pgonda@google.com, martin.b.radev@gmail.com, david@redhat.com,
	krish.sadhukhan@oracle.com, saravanand@fb.com,
	xen-devel@lists.xenproject.org, keescook@chromium.org,
	rientjes@google.com, hannes@cmpxchg.org,
	michael.h.kelley@microsoft.com, iommu@lists.linux-foundation.org,
	linux-arch@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
	netdev@vger.kernel.org, vkuznets@redhat.com, brijesh.singh@amd.com,
	anparri@microsoft.com
Subject: Re: [Resend RFC PATCH V4 09/13] x86/Swiotlb/HV: Add Swiotlb bounce
 buffer remap function for HV IVM
Message-ID: <20210720135437.GA13554@lst.de>
References: <20210707154629.3977369-1-ltykernel@gmail.com> <20210707154629.3977369-10-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210707154629.3977369-10-ltykernel@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)


Please split the swiotlb changes into a separate patch from the
consumer.

>  }
> +
> +/*
> + * hv_map_memory - map memory to extra space in the AMD SEV-SNP Isolation VM.
> + */
> +unsigned long hv_map_memory(unsigned long addr, unsigned long size)
> +{
> +	unsigned long *pfns = kcalloc(size / HV_HYP_PAGE_SIZE,
> +				      sizeof(unsigned long),
> +		       GFP_KERNEL);
> +	unsigned long vaddr;
> +	int i;
> +
> +	if (!pfns)
> +		return (unsigned long)NULL;
> +
> +	for (i = 0; i < size / HV_HYP_PAGE_SIZE; i++)
> +		pfns[i] = virt_to_hvpfn((void *)addr + i * HV_HYP_PAGE_SIZE) +
> +			(ms_hyperv.shared_gpa_boundary >> HV_HYP_PAGE_SHIFT);
> +
> +	vaddr = (unsigned long)vmap_pfn(pfns, size / HV_HYP_PAGE_SIZE,
> +					PAGE_KERNEL_IO);
> +	kfree(pfns);
> +
> +	return vaddr;

This seems to miss a 'select VMAP_PFN'.  But more importantly I don't
think this actually works.  Various DMA APIs do expect a struct page
backing, so how is this going to work with say dma_mmap_attrs or
dma_get_sgtable_attrs?

> +static unsigned long __map_memory(unsigned long addr, unsigned long size)
> +{
> +	if (hv_is_isolation_supported())
> +		return hv_map_memory(addr, size);
> +
> +	return addr;
> +}
> +
> +static void __unmap_memory(unsigned long addr)
> +{
> +	if (hv_is_isolation_supported())
> +		hv_unmap_memory(addr);
> +}
> +
> +unsigned long set_memory_decrypted_map(unsigned long addr, unsigned long size)
> +{
> +	if (__set_memory_enc_dec(addr, size / PAGE_SIZE, false))
> +		return (unsigned long)NULL;
> +
> +	return __map_memory(addr, size);
> +}
> +
> +int set_memory_encrypted_unmap(unsigned long addr, unsigned long size)
> +{
> +	__unmap_memory(addr);
> +	return __set_memory_enc_dec(addr, size / PAGE_SIZE, true);
> +}

Why this obsfucation into all kinds of strange helpers?  Also I think
we want an ops vectors (or alternative calls) instead of the random
if checks here.

> + * @vstart:	The virtual start address of the swiotlb memory pool. The swiotlb
> + *		memory pool may be remapped in the memory encrypted case and store

Normall we'd call this vaddr or cpu_addr.

> -	set_memory_decrypted((unsigned long)vaddr, bytes >> PAGE_SHIFT);
> -	memset(vaddr, 0, bytes);
> +	mem->vstart = (void *)set_memory_decrypted_map((unsigned long)vaddr, bytes);

Please always pass kernel virtual addresses as pointers.

And I think these APIs might need better names, e.g.

arch_dma_map_decrypted and arch_dma_unmap_decrypted.

Also these will need fallback versions for non-x86 architectures that
currently use memory encryption.

