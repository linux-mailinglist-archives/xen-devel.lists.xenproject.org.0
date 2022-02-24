Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FFE4C295F
	for <lists+xen-devel@lfdr.de>; Thu, 24 Feb 2022 11:29:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278116.475229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNBMy-0003tW-KC; Thu, 24 Feb 2022 10:29:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278116.475229; Thu, 24 Feb 2022 10:29:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNBMy-0003qU-FI; Thu, 24 Feb 2022 10:29:08 +0000
Received: by outflank-mailman (input) for mailman id 278116;
 Thu, 24 Feb 2022 10:29:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hD/W=TH=arm.com=anshuman.khandual@srs-se1.protection.inumbo.net>)
 id 1nNBMw-0003qJ-HE
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 10:29:06 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 977fa540-955c-11ec-8eb8-a37418f5ba1a;
 Thu, 24 Feb 2022 11:29:05 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CDCB91509;
 Thu, 24 Feb 2022 02:29:04 -0800 (PST)
Received: from [10.163.48.178] (unknown [10.163.48.178])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5F68A3F70D;
 Thu, 24 Feb 2022 02:28:58 -0800 (PST)
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
X-Inumbo-ID: 977fa540-955c-11ec-8eb8-a37418f5ba1a
From: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH 02/11] swiotlb: make swiotlb_exit a no-op if SWIOTLB_FORCE
 is set
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
 <20220222153514.593231-3-hch@lst.de>
Message-ID: <b769ddc8-5ba3-b7a9-b295-92507a73c0d6@arm.com>
Date: Thu, 24 Feb 2022 15:59:00 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20220222153514.593231-3-hch@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 2/22/22 9:05 PM, Christoph Hellwig wrote:
> If force bouncing is enabled we can't release the bufffers.

typo							^^^^

> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  kernel/dma/swiotlb.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index f1e7ea160b433..36fbf1181d285 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -378,6 +378,9 @@ void __init swiotlb_exit(void)
>  	unsigned long tbl_vaddr;
>  	size_t tbl_size, slots_size;
>  
> +	if (swiotlb_force == SWIOTLB_FORCE)
> +		return;
> +
>  	if (!mem->nslabs)
>  		return;
>  
> 

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

