Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCA34C2999
	for <lists+xen-devel@lfdr.de>; Thu, 24 Feb 2022 11:36:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278137.475275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNBTk-0006Dd-Qr; Thu, 24 Feb 2022 10:36:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278137.475275; Thu, 24 Feb 2022 10:36:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNBTk-0006AK-Mt; Thu, 24 Feb 2022 10:36:08 +0000
Received: by outflank-mailman (input) for mailman id 278137;
 Thu, 24 Feb 2022 10:36:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hD/W=TH=arm.com=anshuman.khandual@srs-se1.protection.inumbo.net>)
 id 1nNBTj-00069Z-9u
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 10:36:07 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 921ea0b1-955d-11ec-8eb8-a37418f5ba1a;
 Thu, 24 Feb 2022 11:36:06 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 560AAED1;
 Thu, 24 Feb 2022 02:36:05 -0800 (PST)
Received: from [10.163.48.178] (unknown [10.163.48.178])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 13A2D3F70D;
 Thu, 24 Feb 2022 02:35:58 -0800 (PST)
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
X-Inumbo-ID: 921ea0b1-955d-11ec-8eb8-a37418f5ba1a
From: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH 04/11] swiotlb: rename swiotlb_late_init_with_default_size
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
 <20220222153514.593231-5-hch@lst.de>
Message-ID: <fa35ecc4-414c-f647-ed96-2baf8282ad5b@arm.com>
Date: Thu, 24 Feb 2022 16:06:01 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20220222153514.593231-5-hch@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 2/22/22 9:05 PM, Christoph Hellwig wrote:
> swiotlb_late_init_with_default_size is an overly verbose name that
> doesn't even catch what the function is doing, given that the size is
> not just a default but the actual requested size.
> 
> Rename it to swiotlb_init_late.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/x86/pci/sta2x11-fixup.c | 2 +-
>  include/linux/swiotlb.h      | 2 +-
>  kernel/dma/swiotlb.c         | 6 ++----
>  3 files changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/x86/pci/sta2x11-fixup.c b/arch/x86/pci/sta2x11-fixup.c
> index 101081ad64b6d..e0c039a75b2db 100644
> --- a/arch/x86/pci/sta2x11-fixup.c
> +++ b/arch/x86/pci/sta2x11-fixup.c
> @@ -57,7 +57,7 @@ static void sta2x11_new_instance(struct pci_dev *pdev)
>  		int size = STA2X11_SWIOTLB_SIZE;
>  		/* First instance: register your own swiotlb area */
>  		dev_info(&pdev->dev, "Using SWIOTLB (size %i)\n", size);
> -		if (swiotlb_late_init_with_default_size(size))
> +		if (swiotlb_init_late(size))
>  			dev_emerg(&pdev->dev, "init swiotlb failed\n");
>  	}
>  	list_add(&instance->list, &sta2x11_instance_list);
> diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
> index 9fb3a568f0c51..b48b26bfa0edb 100644
> --- a/include/linux/swiotlb.h
> +++ b/include/linux/swiotlb.h
> @@ -40,7 +40,7 @@ extern void swiotlb_init(int verbose);
>  int swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, int verbose);
>  unsigned long swiotlb_size_or_default(void);
>  extern int swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs);
> -extern int swiotlb_late_init_with_default_size(size_t default_size);
> +int swiotlb_init_late(size_t size);
>  extern void __init swiotlb_update_mem_attributes(void);
>  
>  phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t phys,
> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index 519e363097190..5f64b02fbb732 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -290,11 +290,9 @@ swiotlb_init(int verbose)
>   * initialize the swiotlb later using the slab allocator if needed.
>   * This should be just like above, but with some error catching.
>   */
> -int
> -swiotlb_late_init_with_default_size(size_t default_size)
> +int swiotlb_init_late(size_t size)
>  {
> -	unsigned long nslabs =
> -		ALIGN(default_size >> IO_TLB_SHIFT, IO_TLB_SEGSIZE);
> +	unsigned long nslabs = ALIGN(size >> IO_TLB_SHIFT, IO_TLB_SEGSIZE);
>  	unsigned long bytes;
>  	unsigned char *vstart = NULL;
>  	unsigned int order;
> 

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

