Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EA3A3186A
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 23:14:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885975.1295740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thyVT-0001Jm-6a; Tue, 11 Feb 2025 22:13:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885975.1295740; Tue, 11 Feb 2025 22:13:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thyVT-0001HC-3A; Tue, 11 Feb 2025 22:13:27 +0000
Received: by outflank-mailman (input) for mailman id 885975;
 Tue, 11 Feb 2025 22:13:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YqFZ=VC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1thyVR-0001H6-Iv
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 22:13:25 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 688a0cd4-e8c5-11ef-a075-877d107080fb;
 Tue, 11 Feb 2025 23:13:23 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 31CACA40433;
 Tue, 11 Feb 2025 22:11:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C5E6C4CEDD;
 Tue, 11 Feb 2025 22:13:20 +0000 (UTC)
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
X-Inumbo-ID: 688a0cd4-e8c5-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739312002;
	bh=lIFIkDT/zbbUxb7mpR22q7vFnsyKNuSSZdkEe7dJvUI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=I34gPA9a91Rh8Sqj6iX+KjOcFWXklrXLDBLgrbwHtWYFrUBM8nnXXHWHCqT29RrBi
	 9d0VQUmtjW6Y80YCqL8BgBw42xrQ1h7tzMGXksvbQrjekw0As12BxKK19LJT5p6H0Z
	 XBzwqb56/TCEXa/ql+AR3jPwaJFA1hBFOe3aSr8pWykzLa6zUcFzaTGemSyx7wXq7o
	 q/UUM/yA4v/Ejpz/R2RYCV4gv7w/O0l+HTxVFLzrYv03fzWXIwFsBmSm4QuUpvV9/v
	 0q6vtIPsR4xTmXbjC5kWHlvq+8+kSFjg/u2kC48IN84mMKiBPc76Tt9IKJj/QnfkZ/
	 tS6r9xN7z2qxg==
Date: Tue, 11 Feb 2025 14:13:19 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmkhn@proton.me
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
    dmukhin@ford.com
Subject: Re: [PATCH v2] xen/include: introduce resource.h
In-Reply-To: <20250211155517.237048-1-dmkhn@proton.me>
Message-ID: <alpine.DEB.2.22.394.2502111413140.619090@ubuntu-linux-20-04-desktop>
References: <20250211155517.237048-1-dmkhn@proton.me>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 11 Feb 2025, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Move resource definitions to a new architecture-agnostic shared header file.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in v2:
> - Formatting fixes
> - Link to v1: https://lore.kernel.org/xen-devel/20250207231814.3863449-1-dmukhin@ford.com/
> ---
>  xen/common/device-tree/device-tree.c | 21 +----------------
>  xen/drivers/passthrough/arm/smmu.c   | 18 +++------------
>  xen/include/xen/resource.h           | 34 ++++++++++++++++++++++++++++
>  3 files changed, 38 insertions(+), 35 deletions(-)
>  create mode 100644 xen/include/xen/resource.h
> 
> diff --git a/xen/common/device-tree/device-tree.c b/xen/common/device-tree/device-tree.c
> index d0528c5825..e8f810b2fe 100644
> --- a/xen/common/device-tree/device-tree.c
> +++ b/xen/common/device-tree/device-tree.c
> @@ -24,6 +24,7 @@
>  #include <xen/ctype.h>
>  #include <asm/setup.h>
>  #include <xen/err.h>
> +#include <xen/resource.h>
>  
>  const void *device_tree_flattened;
>  dt_irq_xlate_func dt_irq_xlate;
> @@ -535,26 +536,6 @@ int dt_child_n_size_cells(const struct dt_device_node *parent)
>      return __dt_n_size_cells(parent, true);
>  }
>  
> -/*
> - * These are defined in Linux where much of this code comes from, but
> - * are currently unused outside this file in the context of Xen.
> - */
> -#define IORESOURCE_BITS         0x000000ff      /* Bus-specific bits */
> -
> -#define IORESOURCE_TYPE_BITS    0x00001f00      /* Resource type */
> -#define IORESOURCE_IO           0x00000100      /* PCI/ISA I/O ports */
> -#define IORESOURCE_MEM          0x00000200
> -#define IORESOURCE_REG          0x00000300      /* Register offsets */
> -#define IORESOURCE_IRQ          0x00000400
> -#define IORESOURCE_DMA          0x00000800
> -#define IORESOURCE_BUS          0x00001000
> -
> -#define IORESOURCE_PREFETCH     0x00002000      /* No side effects */
> -#define IORESOURCE_READONLY     0x00004000
> -#define IORESOURCE_CACHEABLE    0x00008000
> -#define IORESOURCE_RANGELENGTH  0x00010000
> -#define IORESOURCE_SHADOWABLE   0x00020000
> -
>  /*
>   * Default translator (generic bus)
>   */
> diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
> index 03d22bce1e..0f8d47dc98 100644
> --- a/xen/drivers/passthrough/arm/smmu.c
> +++ b/xen/drivers/passthrough/arm/smmu.c
> @@ -50,6 +50,7 @@
>  #include <xen/rbtree.h>
>  #include <xen/sched.h>
>  #include <xen/sizes.h>
> +#include <xen/resource.h>
>  #include <asm/atomic.h>
>  #include <asm/device.h>
>  #include <asm/io.h>
> @@ -64,6 +65,8 @@
>  
>  /* Alias to Xen device tree helpers */
>  #define device_node dt_device_node
> +#define platform_device dt_device_node
> +
>  #define of_phandle_args dt_phandle_args
>  #define of_device_id dt_device_match
>  #define of_match_node dt_match_node
> @@ -71,21 +74,6 @@
>  #define of_property_read_bool dt_property_read_bool
>  #define of_parse_phandle_with_args dt_parse_phandle_with_args
>  
> -/* Xen: Helpers to get device MMIO and IRQs */
> -struct resource
> -{
> -	paddr_t addr;
> -	paddr_t size;
> -	unsigned int type;
> -};
> -
> -#define resource_size(res) (res)->size;
> -
> -#define platform_device dt_device_node
> -
> -#define IORESOURCE_MEM 0
> -#define IORESOURCE_IRQ 1
> -
>  static struct resource *platform_get_resource(struct platform_device *pdev,
>  					      unsigned int type,
>  					      unsigned int num)
> diff --git a/xen/include/xen/resource.h b/xen/include/xen/resource.h
> new file mode 100644
> index 0000000000..5d10363128
> --- /dev/null
> +++ b/xen/include/xen/resource.h
> @@ -0,0 +1,34 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * System resource description.
> + */
> +#ifndef XEN__RESOURCE_H
> +#define XEN__RESOURCE_H
> +
> +#define IORESOURCE_BITS         0x000000FFU      /* Bus-specific bits */
> +
> +#define IORESOURCE_TYPE_BITS    0x00001F00U      /* Resource type */
> +#define IORESOURCE_IO           0x00000100U      /* PCI/ISA I/O ports */
> +#define IORESOURCE_MEM          0x00000200U
> +#define IORESOURCE_REG          0x00000300U      /* Register offsets */
> +#define IORESOURCE_IRQ          0x00000400U
> +#define IORESOURCE_DMA          0x00000800U
> +#define IORESOURCE_BUS          0x00001000U
> +
> +#define IORESOURCE_PREFETCH     0x00002000U      /* No side effects */
> +#define IORESOURCE_READONLY     0x00004000U
> +#define IORESOURCE_CACHEABLE    0x00008000U
> +#define IORESOURCE_RANGELENGTH  0x00010000U
> +#define IORESOURCE_SHADOWABLE   0x00020000U
> +
> +#define IORESOURCE_UNKNOWN      (~0U)
> +
> +struct resource {
> +    paddr_t addr;
> +    paddr_t size;
> +    unsigned int type;
> +};
> +
> +#define resource_size(res)      ((res)->size)
> +
> +#endif /* XEN__RESOURCE_H */
> -- 
> 2.34.1
> 
> 

