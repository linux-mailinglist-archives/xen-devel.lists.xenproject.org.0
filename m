Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6429A50303D
	for <lists+xen-devel@lfdr.de>; Sat, 16 Apr 2022 00:02:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.305903.521007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nfU0B-0000Jf-Ru; Fri, 15 Apr 2022 22:01:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 305903.521007; Fri, 15 Apr 2022 22:01:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nfU0B-0000HM-N2; Fri, 15 Apr 2022 22:01:15 +0000
Received: by outflank-mailman (input) for mailman id 305903;
 Fri, 15 Apr 2022 22:01:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JP5O=UZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nfU0A-0000HG-9J
 for xen-devel@lists.xenproject.org; Fri, 15 Apr 2022 22:01:14 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d7846c4-bd07-11ec-8fbe-03012f2f19d4;
 Sat, 16 Apr 2022 00:01:08 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4B89A62113;
 Fri, 15 Apr 2022 22:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 021A7C385A5;
 Fri, 15 Apr 2022 22:01:05 +0000 (UTC)
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
X-Inumbo-ID: 8d7846c4-bd07-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650060066;
	bh=gF05qkj1BV8YRPMKFq8okTDWS2TOnvBdsgGfuKBcUNc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=qkvRQK+cwAX5qxBIrsmll2HBQ6tdyXXOo48j7ThKlxLDK5IqB60sSNQJiU/oIq5Dl
	 20sHI1dQ7J2buTs1iZVfVzMb8qQv9kFEtF060AAgDXgp21wXhfZhVzSJ8KzHuFWHiF
	 QY5bSK01PvE2nT6D5UX8S3AqWikLAnlWrJAARbHYWADztrluf1XJyAYTGZxzsKQ0Tr
	 wxfatIV+KrZ8u0jd34nEX/EUOQbNU7F96vC/7YPuAzQdX9LjnLphr4cb2zuWXL5TAY
	 Nui0tbFH8+eF/1aF2Bl0kxcmRkFg70TWIreWjyFRo02mboDXrwpyr4MOVbnTqlS4nP
	 WClFyObLzhRLg==
Date: Fri, 15 Apr 2022 15:01:05 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
cc: xen-devel@lists.xenproject.org, x86@kernel.org, 
    linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>, 
    Dave Hansen <dave.hansen@linux.intel.com>, 
    Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
    Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
    Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [RFC PATCH 2/6] virtio: add option to restrict memory access
 under Xen
In-Reply-To: <1649963973-22879-3-git-send-email-olekstysh@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2204151235440.915916@ubuntu-linux-20-04-desktop>
References: <1649963973-22879-1-git-send-email-olekstysh@gmail.com> <1649963973-22879-3-git-send-email-olekstysh@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 14 Apr 2022, Oleksandr Tyshchenko wrote:
> From: Juergen Gross <jgross@suse.com>
> 
> In order to support virtio in Xen guests add a config option enabling
> the user to specify whether in all Xen guests virtio should be able to
> access memory via Xen grant mappings only on the host side.
> 
> This applies to fully virtualized guests only, as for paravirtualized
> guests this is mandatory.
> 
> This requires to switch arch_has_restricted_virtio_memory_access()
> from a pure stub to a real function on x86 systems (Arm systems are
> not covered by now).
> 
> Add the needed functionality by providing a special set of DMA ops
> handling the needed grant operations for the I/O pages.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  arch/x86/mm/init.c        |  15 ++++
>  arch/x86/mm/mem_encrypt.c |   5 --
>  arch/x86/xen/Kconfig      |   9 +++
>  drivers/xen/Kconfig       |  20 ++++++
>  drivers/xen/Makefile      |   1 +
>  drivers/xen/xen-virtio.c  | 177 ++++++++++++++++++++++++++++++++++++++++++++++
>  include/xen/xen-ops.h     |   8 +++
>  7 files changed, 230 insertions(+), 5 deletions(-)
>  create mode 100644 drivers/xen/xen-virtio.c
> 
> diff --git a/arch/x86/mm/init.c b/arch/x86/mm/init.c
> index d8cfce2..526a3b2 100644
> --- a/arch/x86/mm/init.c
> +++ b/arch/x86/mm/init.c
> @@ -8,6 +8,8 @@
>  #include <linux/kmemleak.h>
>  #include <linux/sched/task.h>
>  
> +#include <xen/xen.h>
> +
>  #include <asm/set_memory.h>
>  #include <asm/e820/api.h>
>  #include <asm/init.h>
> @@ -1065,3 +1067,16 @@ unsigned long max_swapfile_size(void)
>  	return pages;
>  }
>  #endif
> +
> +#ifdef CONFIG_ARCH_HAS_RESTRICTED_VIRTIO_MEMORY_ACCESS
> +int arch_has_restricted_virtio_memory_access(void)
> +{
> +	if (IS_ENABLED(CONFIG_XEN_PV_VIRTIO) && xen_pv_domain())
> +		return 1;
> +	if (IS_ENABLED(CONFIG_XEN_HVM_VIRTIO_GRANT) && xen_hvm_domain())
> +		return 1;

I think these two checks could be moved to a separate function in a Xen
header, e.g. xen_restricted_virtio_memory_access, and here you could
just

if (xen_restricted_virtio_memory_access())
    return 1;



> +	return cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT);
> +}
> +EXPORT_SYMBOL_GPL(arch_has_restricted_virtio_memory_access);
> +#endif
> diff --git a/arch/x86/mm/mem_encrypt.c b/arch/x86/mm/mem_encrypt.c
> index 50d2099..dda020f 100644
> --- a/arch/x86/mm/mem_encrypt.c
> +++ b/arch/x86/mm/mem_encrypt.c
> @@ -77,8 +77,3 @@ void __init mem_encrypt_init(void)
>  	print_mem_encrypt_feature_info();
>  }
>  
> -int arch_has_restricted_virtio_memory_access(void)
> -{
> -	return cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT);
> -}
> -EXPORT_SYMBOL_GPL(arch_has_restricted_virtio_memory_access);
> diff --git a/arch/x86/xen/Kconfig b/arch/x86/xen/Kconfig
> index 85246dd..dffdffd 100644
> --- a/arch/x86/xen/Kconfig
> +++ b/arch/x86/xen/Kconfig
> @@ -92,3 +92,12 @@ config XEN_DOM0
>  	select X86_X2APIC if XEN_PVH && X86_64
>  	help
>  	  Support running as a Xen Dom0 guest.
> +
> +config XEN_PV_VIRTIO
> +	bool "Xen virtio support for PV guests"
> +	depends on XEN_VIRTIO && XEN_PV
> +	default y
> +	help
> +	  Support virtio for running as a paravirtualized guest. This will
> +	  need support on the backend side (qemu or kernel, depending on the
> +	  virtio device types used).
> diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
> index 120d32f..fc61f7a 100644
> --- a/drivers/xen/Kconfig
> +++ b/drivers/xen/Kconfig
> @@ -335,4 +335,24 @@ config XEN_UNPOPULATED_ALLOC
>  	  having to balloon out RAM regions in order to obtain physical memory
>  	  space to create such mappings.
>  
> +config XEN_VIRTIO
> +	bool "Xen virtio support"
> +	default n
> +	depends on VIRTIO && DMA_OPS
> +	select ARCH_HAS_RESTRICTED_VIRTIO_MEMORY_ACCESS
> +	help
> +	  Enable virtio support for running as Xen guest. Depending on the
> +	  guest type this will require special support on the backend side
> +	  (qemu or kernel, depending on the virtio device types used).
> +
> +config XEN_HVM_VIRTIO_GRANT
> +	bool "Require virtio for fully virtualized guests to use grant mappings"
> +	depends on XEN_VIRTIO && X86_64
> +	default y
> +	help
> +	  Require virtio for fully virtualized guests to use grant mappings.
> +	  This will avoid the need to give the backend the right to map all
> +	  of the guest memory. This will need support on the backend side
> +	  (qemu or kernel, depending on the virtio device types used).

I don't think we need 3 visible kconfig options for this.

In fact, I would only add one: XEN_VIRTIO. We can have any X86 (or ARM)
specific dependencies in the "depends" line under XEN_VIRTIO. And I
don't think we need XEN_HVM_VIRTIO_GRANT as a kconfig option
necessarely. It doesn't seem like some we want as build time option. At
most, it could be a runtime option (like a command line) or a debug
option (like an #define at the top of the source file.)


>  endmenu
> diff --git a/drivers/xen/Makefile b/drivers/xen/Makefile
> index 5aae66e..767009c 100644
> --- a/drivers/xen/Makefile
> +++ b/drivers/xen/Makefile
> @@ -39,3 +39,4 @@ xen-gntalloc-y				:= gntalloc.o
>  xen-privcmd-y				:= privcmd.o privcmd-buf.o
>  obj-$(CONFIG_XEN_FRONT_PGDIR_SHBUF)	+= xen-front-pgdir-shbuf.o
>  obj-$(CONFIG_XEN_UNPOPULATED_ALLOC)	+= unpopulated-alloc.o
> +obj-$(CONFIG_XEN_VIRTIO)		+= xen-virtio.o
> diff --git a/drivers/xen/xen-virtio.c b/drivers/xen/xen-virtio.c
> new file mode 100644
> index 00000000..cfd5eda
> --- /dev/null
> +++ b/drivers/xen/xen-virtio.c
> @@ -0,0 +1,177 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/******************************************************************************
> + * Xen virtio driver - enables using virtio devices in Xen guests.
> + *
> + * Copyright (c) 2021, Juergen Gross <jgross@suse.com>
> + */
> +
> +#include <linux/module.h>
> +#include <linux/dma-map-ops.h>
> +#include <linux/pci.h>
> +#include <linux/pfn.h>
> +#include <linux/virtio_config.h>
> +#include <xen/xen.h>
> +#include <xen/grant_table.h>
> +
> +#define XEN_GRANT_ADDR_OFF	0x8000000000000000ULL

NIT: (1ULL << 31)


> +static inline dma_addr_t grant_to_dma(grant_ref_t grant)
> +{
> +	return XEN_GRANT_ADDR_OFF | ((dma_addr_t)grant << PAGE_SHIFT);
> +}
> +
> +static inline grant_ref_t dma_to_grant(dma_addr_t dma)
> +{
> +	return (grant_ref_t)((dma & ~XEN_GRANT_ADDR_OFF) >> PAGE_SHIFT);
> +}
> +
> +/*
> + * DMA ops for Xen virtio frontends.
> + *
> + * Used to act as a kind of software IOMMU for Xen guests by using grants as
> + * DMA addresses.
> + * Such a DMA address is formed by using the grant reference as a frame
> + * number and setting the highest address bit (this bit is for the backend
> + * to be able to distinguish it from e.g. a mmio address).
> + *
> + * Note that for now we hard wire dom0 to be the backend domain. In order to
> + * support any domain as backend we'd need to add a way to communicate the
> + * domid of this backend, e.g. via Xenstore or via the PCI-device's config
> + * space.

I would add device tree as possible way of domid communication


> + */
> +static void *xen_virtio_dma_alloc(struct device *dev, size_t size,
> +				  dma_addr_t *dma_handle, gfp_t gfp,
> +				  unsigned long attrs)
> +{
> +	unsigned int n_pages = PFN_UP(size);
> +	unsigned int i;
> +	unsigned long pfn;
> +	grant_ref_t grant;
> +	void *ret;
> +
> +	ret = (void *)__get_free_pages(gfp, get_order(size));
> +	if (!ret)
> +		return NULL;
> +
> +	pfn = virt_to_pfn(ret);
> +
> +	if (gnttab_alloc_grant_reference_seq(n_pages, &grant)) {
> +		free_pages((unsigned long)ret, get_order(size));
> +		return NULL;
> +	}
> +
> +	for (i = 0; i < n_pages; i++) {
> +		gnttab_grant_foreign_access_ref(grant + i, 0,
> +						pfn_to_gfn(pfn + i), 0);
> +	}
> +
> +	*dma_handle = grant_to_dma(grant);
> +
> +	return ret;
> +}
> +
> +static void xen_virtio_dma_free(struct device *dev, size_t size, void *vaddr,
> +				dma_addr_t dma_handle, unsigned long attrs)
> +{
> +	unsigned int n_pages = PFN_UP(size);
> +	unsigned int i;
> +	grant_ref_t grant;
> +
> +	grant = dma_to_grant(dma_handle);
> +
> +	for (i = 0; i < n_pages; i++)
> +		gnttab_end_foreign_access_ref(grant + i);
> +
> +	gnttab_free_grant_reference_seq(grant, n_pages);
> +
> +	free_pages((unsigned long)vaddr, get_order(size));
> +}
> +
> +static struct page *xen_virtio_dma_alloc_pages(struct device *dev, size_t size,
> +					       dma_addr_t *dma_handle,
> +					       enum dma_data_direction dir,
> +					       gfp_t gfp)
> +{
> +	WARN_ONCE(1, "xen_virtio_dma_alloc_pages size %ld\n", size);
> +	return NULL;
> +}
> +
> +static void xen_virtio_dma_free_pages(struct device *dev, size_t size,
> +				      struct page *vaddr, dma_addr_t dma_handle,
> +				      enum dma_data_direction dir)
> +{
> +	WARN_ONCE(1, "xen_virtio_dma_free_pages size %ld\n", size);
> +}
> +
> +static dma_addr_t xen_virtio_dma_map_page(struct device *dev, struct page *page,
> +					  unsigned long offset, size_t size,
> +					  enum dma_data_direction dir,
> +					  unsigned long attrs)
> +{
> +	grant_ref_t grant;
> +
> +	if (gnttab_alloc_grant_references(1, &grant))
> +		return 0;
> +
> +	gnttab_grant_foreign_access_ref(grant, 0, xen_page_to_gfn(page),
> +					dir == DMA_TO_DEVICE);
> +	return grant_to_dma(grant) + offset;
> +}
> +
> +static void xen_virtio_dma_unmap_page(struct device *dev, dma_addr_t dma_handle,
> +				      size_t size, enum dma_data_direction dir,
> +				      unsigned long attrs)
> +{
> +	grant_ref_t grant;
> +
> +	grant = dma_to_grant(dma_handle);
> +
> +	gnttab_end_foreign_access_ref(grant);
> +
> +	gnttab_free_grant_reference(grant);
> +}
> +
> +static int xen_virtio_dma_map_sg(struct device *dev, struct scatterlist *sg,
> +				 int nents, enum dma_data_direction dir,
> +				 unsigned long attrs)
> +{
> +	WARN_ONCE(1, "xen_virtio_dma_map_sg nents %d\n", nents);
> +	return -EINVAL;
> +}
> +
> +static void xen_virtio_dma_unmap_sg(struct device *dev, struct scatterlist *sg,
> +				    int nents, enum dma_data_direction dir,
> +				    unsigned long attrs)
> +{
> +	WARN_ONCE(1, "xen_virtio_dma_unmap_sg nents %d\n", nents);
> +}

You can implement xen_virtio_dma_map_sg and xen_virtio_dma_unmap_sg
based on xen_virtio_dma_map_page and xen_virtio_dma_unmap_page, like we
do in drivers/xen/swiotlb-xen.c.


> +static int xen_virtio_dma_dma_supported(struct device *dev, u64 mask)
> +{
> +	return 1;
> +}
> +
> +static const struct dma_map_ops xen_virtio_dma_ops = {
> +	.alloc = xen_virtio_dma_alloc,
> +	.free = xen_virtio_dma_free,
> +	.alloc_pages = xen_virtio_dma_alloc_pages,
> +	.free_pages = xen_virtio_dma_free_pages,
> +	.mmap = dma_common_mmap,
> +	.get_sgtable = dma_common_get_sgtable,
> +	.map_page = xen_virtio_dma_map_page,
> +	.unmap_page = xen_virtio_dma_unmap_page,
> +	.map_sg = xen_virtio_dma_map_sg,
> +	.unmap_sg = xen_virtio_dma_unmap_sg,
> +	.dma_supported = xen_virtio_dma_dma_supported,
> +};
> +
> +void xen_virtio_setup_dma_ops(struct device *dev)
> +{
> +	dev->dma_ops = &xen_virtio_dma_ops;
> +}
> +EXPORT_SYMBOL_GPL(xen_virtio_setup_dma_ops);
> +
> +MODULE_DESCRIPTION("Xen virtio support driver");
> +MODULE_AUTHOR("Juergen Gross <jgross@suse.com>");
> +MODULE_LICENSE("GPL");
> diff --git a/include/xen/xen-ops.h b/include/xen/xen-ops.h
> index a3584a3..ae3c1bc 100644
> --- a/include/xen/xen-ops.h
> +++ b/include/xen/xen-ops.h
> @@ -221,4 +221,12 @@ static inline void xen_preemptible_hcall_end(void) { }
>  
>  #endif /* CONFIG_XEN_PV && !CONFIG_PREEMPTION */
>  
> +#ifdef CONFIG_XEN_VIRTIO
> +void xen_virtio_setup_dma_ops(struct device *dev);
> +#else
> +static inline void xen_virtio_setup_dma_ops(struct device *dev)
> +{
> +}
> +#endif /* CONFIG_XEN_VIRTIO */
> +
>  #endif /* INCLUDE_XEN_OPS_H */
> -- 
> 2.7.4
> 

