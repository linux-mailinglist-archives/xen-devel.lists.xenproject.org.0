Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEBE819109
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 20:47:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657148.1025893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFg3m-0001HA-CU; Tue, 19 Dec 2023 19:47:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657148.1025893; Tue, 19 Dec 2023 19:47:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFg3m-0001Do-9L; Tue, 19 Dec 2023 19:47:22 +0000
Received: by outflank-mailman (input) for mailman id 657148;
 Tue, 19 Dec 2023 19:47:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rFg3k-0001Db-0s
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 19:47:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rFg3j-0001NN-KX; Tue, 19 Dec 2023 19:47:19 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=[192.168.3.234]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rFg3j-0005JD-DM; Tue, 19 Dec 2023 19:47:19 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=Dwfy+DMrUQkECSY70q0X+k07FrLQKGdgbRHDEYB8Z3g=; b=DJjWkVqO8FLpF3Wj8hHe1eu/0c
	XpTkEhYPRiiDeQnVBS6d8MLX5lNM+10qUmyMK/b4zYE6mCBmEpS6hCU6SyRhH7EPIY1aE7OuIq0cK
	OrXTCZM7Pinnlbs52AaiZb+NkoP3RDNyeogCKzmJwA1/uNitpLIJ4ia73LD3B4KPjbEg=;
Message-ID: <f3fac780-2ab2-4d8d-83c6-62b697135064@xen.org>
Date: Tue, 19 Dec 2023 19:47:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 9/9] xen/arm: Map ITS doorbell register to IOMMU page
 tables
Content-Language: en-GB
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231109182716.367119-1-stewart.hildebrand@amd.com>
 <20231109182716.367119-10-stewart.hildebrand@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231109182716.367119-10-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 09/11/2023 18:27, Stewart Hildebrand wrote:
> From: Rahul Singh <rahul.singh@arm.com>
> 
> When ITS is enabled and PCI devices that are behind an SMMU generate an
> MSI interrupt, SMMU fault will be observed as there is currently no
> mapping in p2m table for the ITS translation register (GITS_TRANSLATER).
> 
> A mapping is required in the p2m page tables so that the device can

Not quite. The mapping is required in the device page-table. But not the 
P2M. So this needs to be updated to match what the code is (correctly) 
doing.

> generate the MSI interrupt writing to the GITS_TRANSLATER register.
> 
> The GITS_TRANSLATER register is a 32-bit register, so map a single page.

and there is nothing else critical in the page.

> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> ---
> This patch was originally picked up from [1], and commit description
> loosely borrowed from [2].
> 
> Example SMMUv3 fault (qemu-system-aarch64 virt model), ITS base 0x8080000:
> 
> (XEN) SMMUv3: /smmuv3@9050000: event 0x10 received:
> (XEN) SMMUv3: /smmuv3@9050000:  0x0000000800000010
> (XEN) SMMUv3: /smmuv3@9050000:  0x0000008000000000
> (XEN) SMMUv3: /smmuv3@9050000:  0x0000000008090040
> (XEN) SMMUv3: /smmuv3@9050000:  0x0000000000000000
> 
> Example SMMUv2 fault (AMD/Xilinx Versal), ITS base 0xf9020000:
> 
> (XEN) smmu: /axi/smmu@fd800000: Unhandled context fault: fsr=0x402, iova=0xf9030040, fsynr=0x12, cb=0
> 
> v5->v6:
> * switch to iommu_map() interface
> * fix page_count argument
> * style fixup
> * use gprintk instead of printk
> * add my Signed-off-by
> * move to vgic_v3_its_init_virtual()
> 
> v4->v5:
> * new patch
> 
> [1] https://lists.xenproject.org/archives/html/xen-devel/2023-07/msg00483.html
> [2] https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc/-/commit/6232a0d53377009bb7fbc3c3ab81d0153734be6b
> ---
>   xen/arch/arm/vgic-v3-its.c | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/xen/arch/arm/vgic-v3-its.c b/xen/arch/arm/vgic-v3-its.c
> index 05429030b539..c35d5f9eb53e 100644
> --- a/xen/arch/arm/vgic-v3-its.c
> +++ b/xen/arch/arm/vgic-v3-its.c
> @@ -1477,6 +1477,21 @@ static int vgic_v3_its_init_virtual(struct domain *d, paddr_t guest_addr,
>   
>       register_mmio_handler(d, &vgic_its_mmio_handler, guest_addr, SZ_64K, its);
>   
> +    if ( is_iommu_enabled(its->d) )
> +    {
> +        mfn_t mfn = maddr_to_mfn(its->doorbell_address);
> +        unsigned int flush_flags = 0;
> +        int ret = iommu_map(its->d, _dfn(mfn_x(mfn)), mfn, 1, IOMMUF_writable,
> +                            &flush_flags);


 From a generic perspective, iommu_map() can set flush_flags. Yet you 
are not doing anything with it. Should not we call iommu_iotlb_flush_all()?

Also, coding style: Newline.

> +        if ( ret < 0 )
> +        {
> +            gprintk(XENLOG_ERR,

NIT: gprintk() will print the current domain (e.g. toolstack domain). I 
would consider to use XENLOG_G_ERR instead to avoid unnecessary information.

> +                    "GICv3: Map ITS translation register %pd failed.\n",

Did you miss "for" before "%pd"?

> +                    its->d);
> +            return ret;
> +        }
> +    }
> +
>       /* Register the virtual ITS to be able to clean it up later. */
>       list_add_tail(&its->vits_list, &d->arch.vgic.vits_list);
>   

Cheers,

-- 
Julien Grall

