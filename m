Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 876A550C266
	for <lists+xen-devel@lfdr.de>; Sat, 23 Apr 2022 01:00:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.311275.528422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ni2Fr-00026C-6b; Fri, 22 Apr 2022 22:59:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 311275.528422; Fri, 22 Apr 2022 22:59:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ni2Fr-00024B-2p; Fri, 22 Apr 2022 22:59:59 +0000
Received: by outflank-mailman (input) for mailman id 311275;
 Fri, 22 Apr 2022 22:59:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N0EE=VA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ni2Fp-000241-GQ
 for xen-devel@lists.xenproject.org; Fri, 22 Apr 2022 22:59:57 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ed52526b-c28f-11ec-a405-831a346695d4;
 Sat, 23 Apr 2022 00:59:56 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9FF62B832FF;
 Fri, 22 Apr 2022 22:59:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81619C385A4;
 Fri, 22 Apr 2022 22:59:53 +0000 (UTC)
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
X-Inumbo-ID: ed52526b-c28f-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650668394;
	bh=M7V1x3+dW0OrON/J4gjnWwch4NqKEpkTbtbZGq9n8Ds=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=QohgQHLzztT0SIwKMxTyP1z4XMJ5yxThvDyiQXdXw5R9vEhb1vIQoOPFBA4vMDmp7
	 OMXSxeoQZPdSRsYBxP6lNveMG6mN71h9ljeHiyhlpi/JE8n/ahpBv5rA297OdfD3m8
	 HHK67H6zwN4EyeCZgH1FN5Uk5vizPpcotPFjYvEbbBSvYm6gGnkuABqm9TF1YeELcW
	 dZxik/y3nacGdEG+7JlHx0QMJgfEE4t/k3UBooyvCEvN3vWl00th8B2WdhSt0OXQy3
	 GaxYCztJOy1KwmrjIyLwOtFbI06hD3+pGKZrqMWLJyXHiH0diFy04HgYZUZFVIcB/p
	 fhGy9MUJZMx3Q==
Date: Fri, 22 Apr 2022 15:59:53 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Russell King <linux@armlinux.org.uk>, 
    Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
    Juergen Gross <jgross@suse.com>, Logan Gunthorpe <logang@deltatee.com>, 
    David Hildenbrand <david@redhat.com>, 
    Martin Oliveira <martin.oliveira@eideticom.com>, 
    Kees Cook <keescook@chromium.org>, 
    Jean-Philippe Brucker <jean-philippe@linaro.org>, 
    Julien Grall <julien@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>, 
    Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH V1 1/6] arm/xen: Introduce xen_setup_dma_ops()
In-Reply-To: <1650646263-22047-2-git-send-email-olekstysh@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2204221509220.915916@ubuntu-linux-20-04-desktop>
References: <1650646263-22047-1-git-send-email-olekstysh@gmail.com> <1650646263-22047-2-git-send-email-olekstysh@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 22 Apr 2022, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> This patch introduces new helper and places it in new header.
> The helper's purpose is to assign any Xen specific DMA ops in
> a single place. For now, we deal with xen-swiotlb DMA ops only.
> The one of the subsequent commits in current series will add
> xen-grant DMA ops case.
> 
> Also re-use the xen_swiotlb_detect() check on Arm32.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes RFC -> V1:
>    - update commit description
>    - move commit to the beginning of the series
>    - move #ifdef CONFIG_XEN from dma-mapping.c to xen-ops.h
> ---
>  arch/arm/include/asm/xen/xen-ops.h   |  1 +
>  arch/arm/mm/dma-mapping.c            |  7 ++-----
>  arch/arm64/include/asm/xen/xen-ops.h |  1 +
>  arch/arm64/mm/dma-mapping.c          |  7 ++-----
>  include/xen/arm/xen-ops.h            | 15 +++++++++++++++
>  5 files changed, 21 insertions(+), 10 deletions(-)
>  create mode 100644 arch/arm/include/asm/xen/xen-ops.h
>  create mode 100644 arch/arm64/include/asm/xen/xen-ops.h
>  create mode 100644 include/xen/arm/xen-ops.h
> 
> diff --git a/arch/arm/include/asm/xen/xen-ops.h b/arch/arm/include/asm/xen/xen-ops.h
> new file mode 100644
> index 00000000..8d2fa24
> --- /dev/null
> +++ b/arch/arm/include/asm/xen/xen-ops.h
> @@ -0,0 +1 @@
> +#include <xen/arm/xen-ops.h>
> diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
> index 82ffac6..059cce0 100644
> --- a/arch/arm/mm/dma-mapping.c
> +++ b/arch/arm/mm/dma-mapping.c
> @@ -33,7 +33,7 @@
>  #include <asm/dma-iommu.h>
>  #include <asm/mach/map.h>
>  #include <asm/system_info.h>
> -#include <xen/swiotlb-xen.h>
> +#include <asm/xen/xen-ops.h>
>  
>  #include "dma.h"
>  #include "mm.h"
> @@ -2287,10 +2287,7 @@ void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
>  
>  	set_dma_ops(dev, dma_ops);
>  
> -#ifdef CONFIG_XEN
> -	if (xen_initial_domain())
> -		dev->dma_ops = &xen_swiotlb_dma_ops;
> -#endif
> +	xen_setup_dma_ops(dev);
>  	dev->archdata.dma_ops_setup = true;
>  }
>  
> diff --git a/arch/arm64/include/asm/xen/xen-ops.h b/arch/arm64/include/asm/xen/xen-ops.h
> new file mode 100644
> index 00000000..8d2fa24
> --- /dev/null
> +++ b/arch/arm64/include/asm/xen/xen-ops.h
> @@ -0,0 +1 @@
> +#include <xen/arm/xen-ops.h>
> diff --git a/arch/arm64/mm/dma-mapping.c b/arch/arm64/mm/dma-mapping.c
> index 6719f9e..6099c81 100644
> --- a/arch/arm64/mm/dma-mapping.c
> +++ b/arch/arm64/mm/dma-mapping.c
> @@ -9,9 +9,9 @@
>  #include <linux/dma-map-ops.h>
>  #include <linux/dma-iommu.h>
>  #include <xen/xen.h>
> -#include <xen/swiotlb-xen.h>
>  
>  #include <asm/cacheflush.h>
> +#include <asm/xen/xen-ops.h>
>  
>  void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
>  		enum dma_data_direction dir)
> @@ -52,8 +52,5 @@ void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
>  	if (iommu)
>  		iommu_setup_dma_ops(dev, dma_base, dma_base + size - 1);
>  
> -#ifdef CONFIG_XEN
> -	if (xen_swiotlb_detect())
> -		dev->dma_ops = &xen_swiotlb_dma_ops;
> -#endif
> +	xen_setup_dma_ops(dev);
>  }
> diff --git a/include/xen/arm/xen-ops.h b/include/xen/arm/xen-ops.h
> new file mode 100644
> index 00000000..288deb1
> --- /dev/null
> +++ b/include/xen/arm/xen-ops.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_ARM_XEN_OPS_H
> +#define _ASM_ARM_XEN_OPS_H
> +
> +#include <xen/swiotlb-xen.h>
> +
> +static inline void xen_setup_dma_ops(struct device *dev)
> +{
> +#ifdef CONFIG_XEN
> +	if (xen_swiotlb_detect())
> +		dev->dma_ops = &xen_swiotlb_dma_ops;
> +#endif
> +}
> +
> +#endif /* _ASM_ARM_XEN_OPS_H */
> -- 
> 2.7.4
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 

