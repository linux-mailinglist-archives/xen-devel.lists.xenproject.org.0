Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C83D50C267
	for <lists+xen-devel@lfdr.de>; Sat, 23 Apr 2022 01:00:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.311278.528432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ni2G8-0003Hf-Ej; Fri, 22 Apr 2022 23:00:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 311278.528432; Fri, 22 Apr 2022 23:00:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ni2G8-0003FS-At; Fri, 22 Apr 2022 23:00:16 +0000
Received: by outflank-mailman (input) for mailman id 311278;
 Fri, 22 Apr 2022 23:00:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N0EE=VA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ni2G6-0002xN-A9
 for xen-devel@lists.xenproject.org; Fri, 22 Apr 2022 23:00:14 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6b8d5e9-c28f-11ec-8fc2-03012f2f19d4;
 Sat, 23 Apr 2022 01:00:12 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 23D3C6122B;
 Fri, 22 Apr 2022 23:00:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D664C385A0;
 Fri, 22 Apr 2022 23:00:09 +0000 (UTC)
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
X-Inumbo-ID: f6b8d5e9-c28f-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650668410;
	bh=1hOEPpI8cgRF5lLEd0hRrdz++am9bOEonoN37TkAAbI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=qvtO0QBvf2gPsezSOqygGD6dJE+dthIsm1w7wXkaMBrZs0gs9oD+AxlnXkhLjiqs7
	 gKDkyswYaircah8jWoZUPGNpmL/K7x9N2dNrScFMF1+kMcwdA/R2NfbeZIwUkm0imp
	 8jwV76BGmyO2pEAltatSqWd+fNAGqEGEmmOCqtAYHfmFQURnyUbgnH0TWRK4ZhlBY9
	 bOowUtxJMbPC++4+K1YIWDHFzlk7lybdNmcYJtl4T25gVuaFE1/l5+MuYhzUDe5Kz3
	 7SMXk7iZteBj86eHZhPDALgK+h5aF+9fdP5OFe0Erz5YZw9zSswHiXPk709P/j/0bd
	 iPMjkwdQj7Z2g==
Date: Fri, 22 Apr 2022 16:00:09 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
cc: xen-devel@lists.xenproject.org, x86@kernel.org, 
    linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
    Juergen Gross <jgross@suse.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
    Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
    Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
    Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    "Michael S. Tsirkin" <mst@redhat.com>, 
    Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH V1 3/6] xen/virtio: Add option to restrict memory access
 under Xen
In-Reply-To: <1650646263-22047-4-git-send-email-olekstysh@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2204221526221.915916@ubuntu-linux-20-04-desktop>
References: <1650646263-22047-1-git-send-email-olekstysh@gmail.com> <1650646263-22047-4-git-send-email-olekstysh@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1577086982-1650666424=:915916"
Content-ID: <alpine.DEB.2.22.394.2204221527222.915916@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1577086982-1650666424=:915916
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2204221527223.915916@ubuntu-linux-20-04-desktop>

On Fri, 22 Apr 2022, Oleksandr Tyshchenko wrote:
> From: Juergen Gross <jgross@suse.com>
> 
> Introduce Xen grant DMA-mapping layer which contains special DMA-mapping
> routines for providing grant references as DMA addresses to be used by
> frontends (e.g. virtio) in Xen guests.
> 
> In order to support virtio in Xen guests add a config option XEN_VIRTIO
> enabling the user to specify whether in all Xen guests virtio should
> be able to access memory via Xen grant mappings only on the host side.
> 
> As this also requires providing arch_has_restricted_virtio_memory_access
> implementation, switch from a pure stub to a real function on Arm
> and combine with existing implementation for the SEV guests on x86.
> 
> Add the needed functionality by providing a special set of DMA ops
> handling the needed grant operations for the I/O pages.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

There are a couple of minor things that checkpatch.pl reports, but aside
from those the patch looks fine to me.


> ---
> Changes RFC -> V1:
>    - squash with almost all changes from commit (except handling "xen,dev-domid"
>      property):
>      "[PATCH 4/6] virtio: Various updates to xen-virtio DMA ops layer"
>    - update commit subject/description and comments in code
>    - leave only single Kconfig option XEN_VIRTIO and remove architectural
>      dependencies
>    - introduce common xen_has_restricted_virtio_memory_access() in xen.h
>      and update arch_has_restricted_virtio_memory_access() for both
>      Arm and x86 to call new helper
>    - use (1ULL << 63) instead of 0x8000000000000000ULL for XEN_GRANT_ADDR_OFF
>    - implement xen_virtio_dma_map(unmap)_sg() using example in swiotlb-xen.c
>    - optimize padding by moving "broken" field in struct xen_virtio_data
>    - remove unneeded per-device spinlock
>    - remove the inclusion of virtio_config.h
>    - remane everything according to the new naming scheme:
>      s/virtio/grant_dma
>    - add new hidden config option XEN_GRANT_DMA_OPS
> ---
>  arch/arm/xen/enlighten.c    |   8 ++
>  arch/x86/mm/init.c          |  11 ++
>  arch/x86/mm/mem_encrypt.c   |   5 -
>  drivers/xen/Kconfig         |  15 +++
>  drivers/xen/Makefile        |   1 +
>  drivers/xen/grant-dma-ops.c | 317 ++++++++++++++++++++++++++++++++++++++++++++
>  include/xen/xen-ops.h       |   8 ++
>  include/xen/xen.h           |   5 +
>  8 files changed, 365 insertions(+), 5 deletions(-)
>  create mode 100644 drivers/xen/grant-dma-ops.c
> 
> diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
> index ec5b082..49af493 100644
> --- a/arch/arm/xen/enlighten.c
> +++ b/arch/arm/xen/enlighten.c
> @@ -409,6 +409,14 @@ int __init arch_xen_unpopulated_init(struct resource **res)
>  }
>  #endif
>  
> +#ifdef CONFIG_ARCH_HAS_RESTRICTED_VIRTIO_MEMORY_ACCESS
> +int arch_has_restricted_virtio_memory_access(void)
> +{
> +	return xen_has_restricted_virtio_memory_access();
> +}
> +EXPORT_SYMBOL_GPL(arch_has_restricted_virtio_memory_access);
> +#endif
> +
>  static void __init xen_dt_guest_init(void)
>  {
>  	struct device_node *xen_node;
> diff --git a/arch/x86/mm/init.c b/arch/x86/mm/init.c
> index d8cfce2..fe84a3e 100644
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
> @@ -1065,3 +1067,12 @@ unsigned long max_swapfile_size(void)
>  	return pages;
>  }
>  #endif
> +
> +#ifdef CONFIG_ARCH_HAS_RESTRICTED_VIRTIO_MEMORY_ACCESS
> +int arch_has_restricted_virtio_memory_access(void)
> +{
> +	return (xen_has_restricted_virtio_memory_access() ||
> +			cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT));
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
> diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
> index 120d32f..b95581f 100644
> --- a/drivers/xen/Kconfig
> +++ b/drivers/xen/Kconfig
> @@ -335,4 +335,19 @@ config XEN_UNPOPULATED_ALLOC
>  	  having to balloon out RAM regions in order to obtain physical memory
>  	  space to create such mappings.
>  
> +config XEN_GRANT_DMA_OPS
> +	bool
> +	select DMA_OPS
> +
> +config XEN_VIRTIO
> +	bool "Xen virtio support"
> +	default n
> +	depends on VIRTIO
> +	select ARCH_HAS_RESTRICTED_VIRTIO_MEMORY_ACCESS
> +	select XEN_GRANT_DMA_OPS
> +	help
> +	  Enable virtio support for running as Xen guest. Depending on the
> +	  guest type this will require special support on the backend side
> +	  (qemu or kernel, depending on the virtio device types used).
> +
>  endmenu
> diff --git a/drivers/xen/Makefile b/drivers/xen/Makefile
> index 5aae66e..1a23cb0 100644
> --- a/drivers/xen/Makefile
> +++ b/drivers/xen/Makefile
> @@ -39,3 +39,4 @@ xen-gntalloc-y				:= gntalloc.o
>  xen-privcmd-y				:= privcmd.o privcmd-buf.o
>  obj-$(CONFIG_XEN_FRONT_PGDIR_SHBUF)	+= xen-front-pgdir-shbuf.o
>  obj-$(CONFIG_XEN_UNPOPULATED_ALLOC)	+= unpopulated-alloc.o
> +obj-$(CONFIG_XEN_GRANT_DMA_OPS)		+= grant-dma-ops.o
> diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
> new file mode 100644
> index 00000000..0e69aa8
> --- /dev/null
> +++ b/drivers/xen/grant-dma-ops.c
> @@ -0,0 +1,317 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/******************************************************************************
> + * Xen grant DMA-mapping layer - contains special DMA-mapping routines
> + * for providing grant references as DMA addresses to be used by frontends
> + * (e.g. virtio) in Xen guests
> + *
> + * Copyright (c) 2021, Juergen Gross <jgross@suse.com>
> + */
> +
> +#include <linux/module.h>
> +#include <linux/dma-map-ops.h>
> +#include <linux/of.h>
> +#include <linux/pci.h>
> +#include <linux/pfn.h>
> +#include <xen/xen.h>
> +#include <xen/grant_table.h>
> +
> +struct xen_grant_dma_data {
> +	/* The ID of backend domain */
> +	domid_t dev_domid;
> +	/* Is device behaving sane? */
> +	bool broken;
> +	struct device *dev;
> +	struct list_head list;
> +};
> +
> +static LIST_HEAD(xen_grant_dma_devices);
> +static DEFINE_SPINLOCK(xen_grant_dma_lock);
> +
> +#define XEN_GRANT_DMA_ADDR_OFF	(1ULL << 63)
> +
> +static inline dma_addr_t grant_to_dma(grant_ref_t grant)
> +{
> +	return XEN_GRANT_DMA_ADDR_OFF | ((dma_addr_t)grant << PAGE_SHIFT);
> +}
> +
> +static inline grant_ref_t dma_to_grant(dma_addr_t dma)
> +{
> +	return (grant_ref_t)((dma & ~XEN_GRANT_DMA_ADDR_OFF) >> PAGE_SHIFT);
> +}
> +
> +static struct xen_grant_dma_data *find_xen_grant_dma_data(struct device *dev)
> +{
> +	struct xen_grant_dma_data *data = NULL;
> +	bool found = false;
> +
> +	spin_lock(&xen_grant_dma_lock);
> +
> +	list_for_each_entry(data, &xen_grant_dma_devices, list) {
> +		if (data->dev == dev) {
> +			found = true;
> +			break;
> +		}
> +	}
> +
> +	spin_unlock(&xen_grant_dma_lock);
> +
> +	return found ? data : NULL;
> +}
> +
> +/*
> + * DMA ops for Xen frontends (e.g. virtio).
> + *
> + * Used to act as a kind of software IOMMU for Xen guests by using grants as
> + * DMA addresses.
> + * Such a DMA address is formed by using the grant reference as a frame
> + * number and setting the highest address bit (this bit is for the backend
> + * to be able to distinguish it from e.g. a mmio address).
> + *
> + * Note that for now we hard wire dom0 to be the backend domain. In order
> + * to support any domain as backend we'd need to add a way to communicate
> + * the domid of this backend, e.g. via Xenstore, via the PCI-device's
> + * config space or DT/ACPI.
> + */
> +static void *xen_grant_dma_alloc(struct device *dev, size_t size,
> +				 dma_addr_t *dma_handle, gfp_t gfp,
> +				 unsigned long attrs)
> +{
> +	struct xen_grant_dma_data *data;
> +	unsigned int i, n_pages = PFN_UP(size);
> +	unsigned long pfn;
> +	grant_ref_t grant;
> +	void *ret;
> +
> +	data = find_xen_grant_dma_data(dev);
> +	if (!data)
> +		return NULL;
> +
> +	if (unlikely(data->broken))
> +		return NULL;
> +
> +	ret = alloc_pages_exact(n_pages * PAGE_SIZE, gfp);
> +	if (!ret)
> +		return NULL;
> +
> +	pfn = virt_to_pfn(ret);
> +
> +	if (gnttab_alloc_grant_reference_seq(n_pages, &grant)) {
> +		free_pages_exact(ret, n_pages * PAGE_SIZE);
> +		return NULL;
> +	}
> +
> +	for (i = 0; i < n_pages; i++) {
> +		gnttab_grant_foreign_access_ref(grant + i, data->dev_domid,
> +				pfn_to_gfn(pfn + i), 0);
> +	}
> +
> +	*dma_handle = grant_to_dma(grant);
> +
> +	return ret;
> +}
> +
> +static void xen_grant_dma_free(struct device *dev, size_t size, void *vaddr,
> +			       dma_addr_t dma_handle, unsigned long attrs)
> +{
> +	struct xen_grant_dma_data *data;
> +	unsigned int i, n_pages = PFN_UP(size);
> +	grant_ref_t grant;
> +
> +	data = find_xen_grant_dma_data(dev);
> +	if (!data)
> +		return;
> +
> +	if (unlikely(data->broken))
> +		return;
> +
> +	grant = dma_to_grant(dma_handle);
> +
> +	for (i = 0; i < n_pages; i++) {
> +		if (unlikely(!gnttab_end_foreign_access_ref(grant + i))) {
> +			dev_alert(dev, "Grant still in use by backend domain, disabled for further use\n");
> +			data->broken = true;
> +			return;
> +		}
> +	}
> +
> +	gnttab_free_grant_reference_seq(grant, n_pages);
> +
> +	free_pages_exact(vaddr, n_pages * PAGE_SIZE);
> +}
> +
> +static struct page *xen_grant_dma_alloc_pages(struct device *dev, size_t size,
> +					      dma_addr_t *dma_handle,
> +					      enum dma_data_direction dir,
> +					      gfp_t gfp)
> +{
> +	WARN_ONCE(1, "xen_grant_dma_alloc_pages size %zu\n", size);
> +	return NULL;
> +}
> +
> +static void xen_grant_dma_free_pages(struct device *dev, size_t size,
> +				     struct page *vaddr, dma_addr_t dma_handle,
> +				     enum dma_data_direction dir)
> +{
> +	WARN_ONCE(1, "xen_grant_dma_free_pages size %zu\n", size);
> +}
> +
> +static dma_addr_t xen_grant_dma_map_page(struct device *dev, struct page *page,
> +					 unsigned long offset, size_t size,
> +					 enum dma_data_direction dir,
> +					 unsigned long attrs)
> +{
> +	struct xen_grant_dma_data *data;
> +	unsigned int i, n_pages = PFN_UP(size);
> +	grant_ref_t grant;
> +	dma_addr_t dma_handle;
> +
> +	BUG_ON(dir == DMA_NONE);
> +
> +	data = find_xen_grant_dma_data(dev);
> +	if (!data)
> +		return DMA_MAPPING_ERROR;
> +
> +	if (unlikely(data->broken))
> +		return DMA_MAPPING_ERROR;
> +
> +	if (gnttab_alloc_grant_reference_seq(n_pages, &grant))
> +		return DMA_MAPPING_ERROR;
> +
> +	for (i = 0; i < n_pages; i++) {
> +		gnttab_grant_foreign_access_ref(grant + i, data->dev_domid,
> +				xen_page_to_gfn(page) + i, dir == DMA_TO_DEVICE);
> +	}
> +
> +	dma_handle = grant_to_dma(grant) + offset;
> +
> +	return dma_handle;
> +}
> +
> +static void xen_grant_dma_unmap_page(struct device *dev, dma_addr_t dma_handle,
> +				     size_t size, enum dma_data_direction dir,
> +				     unsigned long attrs)
> +{
> +	struct xen_grant_dma_data *data;
> +	unsigned int i, n_pages = PFN_UP(size);
> +	grant_ref_t grant;
> +
> +	BUG_ON(dir == DMA_NONE);
> +
> +	data = find_xen_grant_dma_data(dev);
> +	if (!data)
> +		return;
> +
> +	if (unlikely(data->broken))
> +		return;
> +
> +	grant = dma_to_grant(dma_handle);
> +
> +	for (i = 0; i < n_pages; i++) {
> +		if (unlikely(!gnttab_end_foreign_access_ref(grant + i))) {
> +			dev_alert(dev, "Grant still in use by backend domain, disabled for further use\n");
> +			data->broken = true;
> +			return;
> +		}
> +	}
> +
> +	gnttab_free_grant_reference_seq(grant, n_pages);
> +}
> +
> +static void xen_grant_dma_unmap_sg(struct device *dev, struct scatterlist *sg,
> +				   int nents, enum dma_data_direction dir,
> +				   unsigned long attrs)
> +{
> +	struct scatterlist *s;
> +	unsigned int i;
> +
> +	BUG_ON(dir == DMA_NONE);
> +
> +	for_each_sg(sg, s, nents, i)
> +		xen_grant_dma_unmap_page(dev, s->dma_address, sg_dma_len(s), dir,
> +				attrs);
> +}
> +
> +static int xen_grant_dma_map_sg(struct device *dev, struct scatterlist *sg,
> +				int nents, enum dma_data_direction dir,
> +				unsigned long attrs)
> +{
> +	struct scatterlist *s;
> +	unsigned int i;
> +
> +	BUG_ON(dir == DMA_NONE);
> +
> +	for_each_sg(sg, s, nents, i) {
> +		s->dma_address = xen_grant_dma_map_page(dev, sg_page(s), s->offset,
> +				s->length, dir, attrs);
> +		if (s->dma_address == DMA_MAPPING_ERROR)
> +			goto out;
> +
> +		sg_dma_len(s) = s->length;
> +	}
> +
> +	return nents;
> +
> +out:
> +	xen_grant_dma_unmap_sg(dev, sg, i, dir, attrs | DMA_ATTR_SKIP_CPU_SYNC);
> +	sg_dma_len(sg) = 0;
> +
> +	return -EIO;
> +}
> +
> +static int xen_grant_dma_supported(struct device *dev, u64 mask)
> +{
> +	return mask == DMA_BIT_MASK(64);
> +}
> +
> +static const struct dma_map_ops xen_grant_dma_ops = {
> +	.alloc = xen_grant_dma_alloc,
> +	.free = xen_grant_dma_free,
> +	.alloc_pages = xen_grant_dma_alloc_pages,
> +	.free_pages = xen_grant_dma_free_pages,
> +	.mmap = dma_common_mmap,
> +	.get_sgtable = dma_common_get_sgtable,
> +	.map_page = xen_grant_dma_map_page,
> +	.unmap_page = xen_grant_dma_unmap_page,
> +	.map_sg = xen_grant_dma_map_sg,
> +	.unmap_sg = xen_grant_dma_unmap_sg,
> +	.dma_supported = xen_grant_dma_supported,
> +};
> +
> +void xen_grant_setup_dma_ops(struct device *dev)
> +{
> +	struct xen_grant_dma_data *data;
> +	uint32_t dev_domid;
> +
> +	data = find_xen_grant_dma_data(dev);
> +	if (data) {
> +		dev_err(dev, "Xen grant DMA data is already created\n");
> +		return;
> +	}
> +
> +	/* XXX The dom0 is hardcoded as the backend domain for now */
> +	dev_domid = 0;
> +
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data) {
> +		dev_err(dev, "Сannot allocate Xen grant DMA data\n");
> +		goto err;
> +	}
> +	data->dev_domid = dev_domid;
> +	data->dev = dev;
> +
> +	spin_lock(&xen_grant_dma_lock);
> +	list_add(&data->list, &xen_grant_dma_devices);
> +	spin_unlock(&xen_grant_dma_lock);
> +
> +	dev->dma_ops = &xen_grant_dma_ops;
> +
> +	return;
> +
> +err:
> +	dev_err(dev, "Сannot set up Xen grant DMA ops, retain platform DMA ops\n");
> +}
> +EXPORT_SYMBOL_GPL(xen_grant_setup_dma_ops);
> +
> +MODULE_DESCRIPTION("Xen grant DMA-mapping layer");
> +MODULE_AUTHOR("Juergen Gross <jgross@suse.com>");
> +MODULE_LICENSE("GPL");
> diff --git a/include/xen/xen-ops.h b/include/xen/xen-ops.h
> index a3584a3..4f9fad5 100644
> --- a/include/xen/xen-ops.h
> +++ b/include/xen/xen-ops.h
> @@ -221,4 +221,12 @@ static inline void xen_preemptible_hcall_end(void) { }
>  
>  #endif /* CONFIG_XEN_PV && !CONFIG_PREEMPTION */
>  
> +#ifdef CONFIG_XEN_GRANT_DMA_OPS
> +void xen_grant_setup_dma_ops(struct device *dev);
> +#else
> +static inline void xen_grant_setup_dma_ops(struct device *dev)
> +{
> +}
> +#endif /* CONFIG_XEN_GRANT_DMA_OPS */
> +
>  #endif /* INCLUDE_XEN_OPS_H */
> diff --git a/include/xen/xen.h b/include/xen/xen.h
> index a99bab8..fe6e6bb 100644
> --- a/include/xen/xen.h
> +++ b/include/xen/xen.h
> @@ -52,6 +52,11 @@ bool xen_biovec_phys_mergeable(const struct bio_vec *vec1,
>  extern u64 xen_saved_max_mem_size;
>  #endif
>  
> +static inline int xen_has_restricted_virtio_memory_access(void)
> +{
> +	return IS_ENABLED(CONFIG_XEN_VIRTIO) && xen_domain();
> +}
> +
>  #ifdef CONFIG_XEN_UNPOPULATED_ALLOC
>  int xen_alloc_unpopulated_pages(unsigned int nr_pages, struct page **pages);
>  void xen_free_unpopulated_pages(unsigned int nr_pages, struct page **pages);
> -- 
> 2.7.4
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 
--8323329-1577086982-1650666424=:915916--

