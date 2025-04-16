Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 937DDA8B72C
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 12:52:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.955542.1349293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u50Np-00039a-FN; Wed, 16 Apr 2025 10:52:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 955542.1349293; Wed, 16 Apr 2025 10:52:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u50Np-00037g-CP; Wed, 16 Apr 2025 10:52:45 +0000
Received: by outflank-mailman (input) for mailman id 955542;
 Wed, 16 Apr 2025 10:52:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1u50No-00037Y-A6
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 10:52:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1u50Nn-001XpC-2E;
 Wed, 16 Apr 2025 10:52:43 +0000
Received: from [143.198.24.140] (helo=[100.81.22.8])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1u50Nn-0008Nx-0X;
 Wed, 16 Apr 2025 10:52:43 +0000
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
	bh=D/IEy4yh5dVjMju6xyGOnj6zhFQJ+YuK7p3dR8BLgLA=; b=fR7vGl1sZ0qDBiKDWDodNrPUvz
	iMieY/6KLqCbMg00/qPRqlKjUozjkwI7QdzrtgbLnBcsLS0IZUJiCU/CVi7nu0iO5pQICaBokF7Nf
	NR4m2VdQxctNX7H7gFMR1vQJECDTUpIH6/bhGvfBssz+pEX6qIkbqvfjPNqr0UJFZgek=;
Message-ID: <73766cd2-e157-4fff-943f-91e71fa6b01d@xen.org>
Date: Wed, 16 Apr 2025 19:52:37 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 8/8] xen/arm: Map ITS doorbell register to IOMMU page
 tables
Content-Language: en-GB
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
References: <cover.1741958647.git.mykyta_poturai@epam.com>
 <e5072a66707b70892f60bb5e0757ae3f74c2d601.1741958647.git.mykyta_poturai@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <e5072a66707b70892f60bb5e0757ae3f74c2d601.1741958647.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Mykyta,

On 14/03/2025 22:34, Mykyta Poturai wrote:
> From: Rahul Singh <rahul.singh@arm.com>
> 
> When ITS is enabled and PCI devices that are behind an SMMU generate an
> MSI interrupt, SMMU fault will be observed as there is currently no
> mapping in p2m table for the ITS translation register (GITS_TRANSLATER).
> 
> A mapping is required in the iommu page tables so that the device can
> generate the MSI interrupt writing to the GITS_TRANSLATER register.
> 
> The GITS_TRANSLATER register is a 32-bit register, and there is nothing
> else in a page containing it, so map that page.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
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
> v8->v9:
> * no changes
> 
> v7->v8:
> * no changes
> 
> v6->v7:
> * add tlb flush after mapping
> * style: update formatting
> * revert back to printk with XENLOG_G_ERR
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
>   xen/arch/arm/vgic-v3-its.c | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
> 
> diff --git a/xen/arch/arm/vgic-v3-its.c b/xen/arch/arm/vgic-v3-its.c
> index c65c1dbf52..376254f206 100644
> --- a/xen/arch/arm/vgic-v3-its.c
> +++ b/xen/arch/arm/vgic-v3-its.c
> @@ -1478,6 +1478,26 @@ static int vgic_v3_its_init_virtual(struct domain *d, paddr_t guest_addr,
>   
>       register_mmio_handler(d, &vgic_its_mmio_handler, guest_addr, SZ_64K, its);
>   
> +    if ( is_iommu_enabled(its->d) )
> +    {
> +        mfn_t mfn = maddr_to_mfn(its->doorbell_address);
> +        unsigned int flush_flags = 0;
> +        int ret = iommu_map(its->d, _dfn(mfn_x(mfn)), mfn, 1, IOMMUF_writable,
> +                            &flush_flags);

While looking at your patches for the guest vITS support. I noticed this 
line is not updated for domU. Regardless of the one vs many vITS 
discussion, I don't think this wants to be mapped 1:1. Instead, you want 
to map the guest doorbell page to the host doorbell page.

The flush would need to be updated accordingly.

Cheers,

> +
> +        if ( ret < 0 )
> +        {
> +            printk(XENLOG_G_ERR
> +                    "GICv3: Map ITS translation register for %pd failed.\n",
> +                    its->d);
> +            return ret;
> +        }
> +
> +        ret = iommu_iotlb_flush(its->d, _dfn(mfn_x(mfn)), 1, flush_flags);
> +        if ( ret < 0 )
> +            return ret;
> +    }
> +
>       /* Register the virtual ITS to be able to clean it up later. */
>       list_add_tail(&its->vits_list, &d->arch.vgic.vits_list);
>   

-- 
Julien Grall


