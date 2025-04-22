Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84286A95A37
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 02:32:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.961613.1352986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u71YW-0001PW-4C; Tue, 22 Apr 2025 00:32:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 961613.1352986; Tue, 22 Apr 2025 00:32:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u71YW-0001MQ-19; Tue, 22 Apr 2025 00:32:08 +0000
Received: by outflank-mailman (input) for mailman id 961613;
 Tue, 22 Apr 2025 00:32:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eQRL=XI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u71YU-0001MH-7c
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 00:32:06 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3437a3df-1f11-11f0-9ffb-bf95429c2676;
 Tue, 22 Apr 2025 02:32:00 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id CFA2661166;
 Tue, 22 Apr 2025 00:31:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBC5FC4CEE4;
 Tue, 22 Apr 2025 00:31:57 +0000 (UTC)
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
X-Inumbo-ID: 3437a3df-1f11-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745281918;
	bh=AQ6JGaQKHVgdA+ZMSKPEwbyjxki9McwGNS0rdB2xuUE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=TYt4iJh93lU5SExECnCUq1OAdrdae/gy9USb+rx/fS8IyyNxWrpjGgebeyu+9MxaE
	 3zStH4sko5/k1lyjBcf+PBVCQqaCPoMPjfnwfrnE7+CMDxiNgFDFBa5K2gJwsFeVSd
	 p5pYdrJHPDga916iowaUtr+gPd140sw2mqnmapUmE7RaxZTtWMnI/FHCkaxDlGmtHz
	 AIg7i2FpwtdywbDhnfZkmGbiyqjfVC944gCpBmFWH+7SVwTZnhyuBKcmGmkYTuHZS1
	 b72nFI4byMhiksC1UlknxuyQtFwpl5HWcuyqoiaVpIQ6NjuJMPHpaQHJXm4U4k1AbR
	 b35pavrLbDSnQ==
Date: Mon, 21 Apr 2025 17:31:56 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Rahul Singh <rahul.singh@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: [PATCH v9 8/8] xen/arm: Map ITS doorbell register to IOMMU page
 tables
In-Reply-To: <e5072a66707b70892f60bb5e0757ae3f74c2d601.1741958647.git.mykyta_poturai@epam.com>
Message-ID: <alpine.DEB.2.22.394.2504211728560.785180@ubuntu-linux-20-04-desktop>
References: <cover.1741958647.git.mykyta_poturai@epam.com> <e5072a66707b70892f60bb5e0757ae3f74c2d601.1741958647.git.mykyta_poturai@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 14 Mar 2025, Mykyta Poturai wrote:
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
>  xen/arch/arm/vgic-v3-its.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/xen/arch/arm/vgic-v3-its.c b/xen/arch/arm/vgic-v3-its.c
> index c65c1dbf52..376254f206 100644
> --- a/xen/arch/arm/vgic-v3-its.c
> +++ b/xen/arch/arm/vgic-v3-its.c
> @@ -1478,6 +1478,26 @@ static int vgic_v3_its_init_virtual(struct domain *d, paddr_t guest_addr,
>  
>      register_mmio_handler(d, &vgic_its_mmio_handler, guest_addr, SZ_64K, its);
>  
> +    if ( is_iommu_enabled(its->d) )
> +    {
> +        mfn_t mfn = maddr_to_mfn(its->doorbell_address);
> +        unsigned int flush_flags = 0;
> +        int ret = iommu_map(its->d, _dfn(mfn_x(mfn)), mfn, 1, IOMMUF_writable,
> +                            &flush_flags);

Should this be:

        int ret = iommu_map(its->d, _dfn(PFN_DOWN(its->doorbell_address)), mfn, 1, IOMMUF_writable,
                            &flush_flags);

?


> +        if ( ret < 0 )
> +        {
> +            printk(XENLOG_G_ERR
> +                    "GICv3: Map ITS translation register for %pd failed.\n",
> +                    its->d);
> +            return ret;
> +        }
> +
> +        ret = iommu_iotlb_flush(its->d, _dfn(mfn_x(mfn)), 1, flush_flags);

And this:

       ret = iommu_iotlb_flush(its->d, _dfn(PFN_DOWN(its->doorbell_address)), 1, flush_flags);

?

The original code in this patch assumes that the mapping is 1:1 but
actually its->doorbell_address is set to guest_addr +
ITS_DOORBELL_OFFSET and could potentially be not 1:1 ?

> +        if ( ret < 0 )
> +            return ret;
> +    }
> +
>      /* Register the virtual ITS to be able to clean it up later. */
>      list_add_tail(&its->vits_list, &d->arch.vgic.vits_list);
>  
> -- 
> 2.34.1
> 

