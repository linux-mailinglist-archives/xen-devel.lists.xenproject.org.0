Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB7150303F
	for <lists+xen-devel@lfdr.de>; Sat, 16 Apr 2022 00:02:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.305913.521038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nfU1W-0001qI-NY; Fri, 15 Apr 2022 22:02:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 305913.521038; Fri, 15 Apr 2022 22:02:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nfU1W-0001nk-JO; Fri, 15 Apr 2022 22:02:38 +0000
Received: by outflank-mailman (input) for mailman id 305913;
 Fri, 15 Apr 2022 22:02:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JP5O=UZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nfU1U-0001ST-K3
 for xen-devel@lists.xenproject.org; Fri, 15 Apr 2022 22:02:36 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c15a1619-bd07-11ec-a405-831a346695d4;
 Sat, 16 Apr 2022 00:02:35 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 37B6162197;
 Fri, 15 Apr 2022 22:02:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E20BCC385A5;
 Fri, 15 Apr 2022 22:02:32 +0000 (UTC)
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
X-Inumbo-ID: c15a1619-bd07-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650060153;
	bh=PeF6Zc0nAV5VY/+eiewggzupF5+3PeXMBsC5arnyfGg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZonlUzR62i2dx/H/zmKML/zbXZLoU8bNTM3Qo+bpEHOIhO/tl1vChpFxc9FnNP7tI
	 iBrLaRmWNGkok98HLRW8srCFNX3xB7D1iWQIOgVUcV8UkQ277gin7i1//XVYoKSh45
	 aRQ4+ryHCPnZ2fAzxeGFqksQQsvOdKw1nuio5BBDTGrma/qwnv5GiYuI0i5X7csc9r
	 0gNi+/kkolFIBJqlZnMu1kI/DPk6O1MPcvIOY7eNNR3H5HVRMadEBHjhYdnCb2DIkm
	 H9QclxzfOEk+uBt3Cn9nvDI6q/6E8InTJypsEJFNEZcel7WomzKZfHLtMTWMymCF/i
	 /k3KqskBJ6ayg==
Date: Fri, 15 Apr 2022 15:02:32 -0700 (PDT)
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
    Julien Grall <julien@xen.org>
Subject: Re: [RFC PATCH 5/6] arm/xen: Introduce xen_setup_dma_ops()
In-Reply-To: <1649963973-22879-6-git-send-email-olekstysh@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2204151303340.915916@ubuntu-linux-20-04-desktop>
References: <1649963973-22879-1-git-send-email-olekstysh@gmail.com> <1649963973-22879-6-git-send-email-olekstysh@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 14 Apr 2022, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> This patch introduces new helper and places it in new header.
> The helper's purpose is to assign any Xen specific DMA ops in
> a single place. For now, we deal with xen-swiotlb DMA ops only.
> The subsequent patch will add xen-virtio DMA ops case.
> 
> Also re-use the xen_swiotlb_detect() check on Arm32.

Thanks for the patch, this is good to have in any case. I would move it
to the beginning of the series.


> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> ---
>  arch/arm/include/asm/xen/xen-ops.h   |  1 +
>  arch/arm/mm/dma-mapping.c            |  5 ++---
>  arch/arm64/include/asm/xen/xen-ops.h |  1 +
>  arch/arm64/mm/dma-mapping.c          |  5 ++---
>  include/xen/arm/xen-ops.h            | 13 +++++++++++++
>  5 files changed, 19 insertions(+), 6 deletions(-)
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
> index 82ffac6..a1bf9dd 100644
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
> @@ -2288,8 +2288,7 @@ void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
>  	set_dma_ops(dev, dma_ops);
>  
>  #ifdef CONFIG_XEN
> -	if (xen_initial_domain())
> -		dev->dma_ops = &xen_swiotlb_dma_ops;
> +	xen_setup_dma_ops(dev);
>  #endif

You can take this opportunity to also remove the #ifdef, by providing an
empty stub implemention of xen_setup_dma_ops for the !CONFIG_XEN case.


>  	dev->archdata.dma_ops_setup = true;
>  }
> diff --git a/arch/arm64/include/asm/xen/xen-ops.h b/arch/arm64/include/asm/xen/xen-ops.h
> new file mode 100644
> index 00000000..8d2fa24
> --- /dev/null
> +++ b/arch/arm64/include/asm/xen/xen-ops.h
> @@ -0,0 +1 @@
> +#include <xen/arm/xen-ops.h>
> diff --git a/arch/arm64/mm/dma-mapping.c b/arch/arm64/mm/dma-mapping.c
> index 6719f9e..831e673 100644
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
> @@ -53,7 +53,6 @@ void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
>  		iommu_setup_dma_ops(dev, dma_base, dma_base + size - 1);
>  
>  #ifdef CONFIG_XEN
> -	if (xen_swiotlb_detect())
> -		dev->dma_ops = &xen_swiotlb_dma_ops;
> +	xen_setup_dma_ops(dev);
>  #endif

same here


>  }
> diff --git a/include/xen/arm/xen-ops.h b/include/xen/arm/xen-ops.h
> new file mode 100644
> index 00000000..621da05
> --- /dev/null
> +++ b/include/xen/arm/xen-ops.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_ARM_XEN_OPS_H
> +#define _ASM_ARM_XEN_OPS_H
> +
> +#include <xen/swiotlb-xen.h>
> +
> +static inline void xen_setup_dma_ops(struct device *dev)
> +{
> +	if (xen_swiotlb_detect())
> +		dev->dma_ops = &xen_swiotlb_dma_ops;
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

