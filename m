Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 397BCA2D354
	for <lists+xen-devel@lfdr.de>; Sat,  8 Feb 2025 03:55:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884254.1294051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgazR-0001Z7-Rw; Sat, 08 Feb 2025 02:54:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884254.1294051; Sat, 08 Feb 2025 02:54:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgazR-0001WT-OE; Sat, 08 Feb 2025 02:54:41 +0000
Received: by outflank-mailman (input) for mailman id 884254;
 Sat, 08 Feb 2025 02:54:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=45zg=U7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tgazQ-0001WN-3Q
 for xen-devel@lists.xenproject.org; Sat, 08 Feb 2025 02:54:40 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 089d1c44-e5c8-11ef-b3ef-695165c68f79;
 Sat, 08 Feb 2025 03:54:37 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D9AC2A43C64;
 Sat,  8 Feb 2025 02:52:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C493BC4CED1;
 Sat,  8 Feb 2025 02:54:34 +0000 (UTC)
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
X-Inumbo-ID: 089d1c44-e5c8-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738983276;
	bh=JUDM+x8gKZLHg4GKAHXgQ6RsXsgYWRC3aj3NZtpGw8I=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=X9935EnaWnq8eOFaLydynh36K9XpYexR22Nn3FtPsNfzTDcz8MOuKP02k1I98Hgmi
	 eH9X4wNB/QPehDnH8eDIyZp3XKdjAkej+zCs75Z23+FjGqfCoCi5HB7GrRn+TkX5AM
	 Da6UHp2QACfgFV9hKUQNAPRJ3YsYixyRg04BSK8lTSZ5fe2SPDXhGgX3aAfYXfpIY1
	 NzksUwrSE3oYwFOmA5mS1Hcep8DcKb92RkrNz1apWj55BFKmJLIzFNVCddcusPUn7H
	 wzXGWCuF9LD0uoJyEBzcaIbahEEnc9c+mgHGZyBDcmJ+faCJ4LF9RUOctjcv8hLNyf
	 Ps08EmyvoEdLA==
Date: Fri, 7 Feb 2025 18:54:33 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmkhn@proton.me
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
    dmukhin@ford.com
Subject: Re: [PATCH] xen/include: introduce resource.h
In-Reply-To: <20250207231814.3863449-1-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2502071854231.619090@ubuntu-linux-20-04-desktop>
References: <20250207231814.3863449-1-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 7 Feb 2025, dmkhn@proton.me wrote:
> Move resource definitions to a new architecture-agnostic shared header file.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Link to the original patch:
>   https://lore.kernel.org/xen-devel/20250103-vuart-ns8250-v3-v1-18-c5d36b31d66c@ford.com/
> ---
> ---
>  xen/common/device-tree/device-tree.c | 21 +----------------
>  xen/drivers/passthrough/arm/smmu.c   | 15 +-----------
>  xen/include/xen/resource.h           | 34 ++++++++++++++++++++++++++++
>  3 files changed, 36 insertions(+), 34 deletions(-)
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
> index 03d22bce1e..aa6a968b57 100644
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
> @@ -70,22 +71,8 @@
>  #define of_property_read_u32(np, pname, out) (!dt_property_read_u32(np, pname, out))
>  #define of_property_read_bool dt_property_read_bool
>  #define of_parse_phandle_with_args dt_parse_phandle_with_args
> -
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
>  #define platform_device dt_device_node
>  
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

