Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1000E4C298A
	for <lists+xen-devel@lfdr.de>; Thu, 24 Feb 2022 11:34:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278130.475264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNBRr-0005b2-EF; Thu, 24 Feb 2022 10:34:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278130.475264; Thu, 24 Feb 2022 10:34:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNBRr-0005Xc-Ab; Thu, 24 Feb 2022 10:34:11 +0000
Received: by outflank-mailman (input) for mailman id 278130;
 Thu, 24 Feb 2022 10:34:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hD/W=TH=arm.com=anshuman.khandual@srs-se1.protection.inumbo.net>)
 id 1nNBRp-0005XU-IY
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 10:34:09 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 4b69642c-955d-11ec-8539-5f4723681683;
 Thu, 24 Feb 2022 11:34:07 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B8EB31476;
 Thu, 24 Feb 2022 02:34:06 -0800 (PST)
Received: from [10.163.48.178] (unknown [10.163.48.178])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6169E3F70D;
 Thu, 24 Feb 2022 02:34:00 -0800 (PST)
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
X-Inumbo-ID: 4b69642c-955d-11ec-8539-5f4723681683
From: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH 03/11] swiotlb: simplify swiotlb_max_segment
To: Christoph Hellwig <hch@lst.de>, iommu@lists.linux-foundation.org
Cc: x86@kernel.org, Stefano Stabellini <sstabellini@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross
 <jgross@suse.com>, Joerg Roedel <joro@8bytes.org>,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org,
 xen-devel@lists.xenproject.org, linux-ia64@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-hyperv@vger.kernel.org, tboot-devel@lists.sourceforge.net,
 linux-pci@vger.kernel.org
References: <20220222153514.593231-1-hch@lst.de>
 <20220222153514.593231-4-hch@lst.de>
Message-ID: <9ef33986-eba0-01ee-28b6-1104e60c313d@arm.com>
Date: Thu, 24 Feb 2022 16:04:02 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20220222153514.593231-4-hch@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 2/22/22 9:05 PM, Christoph Hellwig wrote:
> Remove the bogus Xen override that was usually larger than the actual
> size and just calculate the value on demand.  Note that
> swiotlb_max_segment still doesn't make sense as an interface and should
> eventually be removed.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/xen/swiotlb-xen.c |  2 --
>  include/linux/swiotlb.h   |  1 -
>  kernel/dma/swiotlb.c      | 20 +++-----------------
>  3 files changed, 3 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
> index 47aebd98f52f5..485cd06ed39e7 100644
> --- a/drivers/xen/swiotlb-xen.c
> +++ b/drivers/xen/swiotlb-xen.c
> @@ -202,7 +202,6 @@ int xen_swiotlb_init(void)
>  	rc = swiotlb_late_init_with_tbl(start, nslabs);
>  	if (rc)
>  		return rc;
> -	swiotlb_set_max_segment(PAGE_SIZE);
>  	return 0;
>  error:
>  	if (nslabs > 1024 && repeat--) {
> @@ -254,7 +253,6 @@ void __init xen_swiotlb_init_early(void)
>  
>  	if (swiotlb_init_with_tbl(start, nslabs, true))
>  		panic("Cannot allocate SWIOTLB buffer");
> -	swiotlb_set_max_segment(PAGE_SIZE);
>  }
>  #endif /* CONFIG_X86 */
>  
> diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
> index f6c3638255d54..9fb3a568f0c51 100644
> --- a/include/linux/swiotlb.h
> +++ b/include/linux/swiotlb.h
> @@ -164,7 +164,6 @@ static inline void swiotlb_adjust_size(unsigned long size)
>  #endif /* CONFIG_SWIOTLB */
>  
>  extern void swiotlb_print_info(void);
> -extern void swiotlb_set_max_segment(unsigned int);
>  
>  #ifdef CONFIG_DMA_RESTRICTED_POOL
>  struct page *swiotlb_alloc(struct device *dev, size_t size);
> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index 36fbf1181d285..519e363097190 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -75,12 +75,6 @@ struct io_tlb_mem io_tlb_default_mem;
>  
>  phys_addr_t swiotlb_unencrypted_base;
>  
> -/*
> - * Max segment that we can provide which (if pages are contingous) will
> - * not be bounced (unless SWIOTLB_FORCE is set).
> - */
> -static unsigned int max_segment;
> -
>  static unsigned long default_nslabs = IO_TLB_DEFAULT_SIZE >> IO_TLB_SHIFT;
>  
>  static int __init
> @@ -104,18 +98,12 @@ early_param("swiotlb", setup_io_tlb_npages);
>  
>  unsigned int swiotlb_max_segment(void)
>  {
> -	return io_tlb_default_mem.nslabs ? max_segment : 0;
> +	if (!io_tlb_default_mem.nslabs)
> +		return 0;
> +	return rounddown(io_tlb_default_mem.nslabs << IO_TLB_SHIFT, PAGE_SIZE);
>  }
>  EXPORT_SYMBOL_GPL(swiotlb_max_segment);
>  
> -void swiotlb_set_max_segment(unsigned int val)
> -{
> -	if (swiotlb_force == SWIOTLB_FORCE)
> -		max_segment = 1;
> -	else
> -		max_segment = rounddown(val, PAGE_SIZE);
> -}
> -
>  unsigned long swiotlb_size_or_default(void)
>  {
>  	return default_nslabs << IO_TLB_SHIFT;
> @@ -267,7 +255,6 @@ int __init swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, int verbose)
>  
>  	if (verbose)
>  		swiotlb_print_info();
> -	swiotlb_set_max_segment(mem->nslabs << IO_TLB_SHIFT);
>  	return 0;
>  }
>  
> @@ -368,7 +355,6 @@ swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs)
>  	swiotlb_init_io_tlb_mem(mem, virt_to_phys(tlb), nslabs, true);
>  
>  	swiotlb_print_info();
> -	swiotlb_set_max_segment(mem->nslabs << IO_TLB_SHIFT);
>  	return 0;
>  }
>  

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

