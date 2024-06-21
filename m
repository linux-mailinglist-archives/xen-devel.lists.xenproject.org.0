Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 525C19130DA
	for <lists+xen-devel@lfdr.de>; Sat, 22 Jun 2024 01:28:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.745681.1152835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKngM-0002Q0-R6; Fri, 21 Jun 2024 23:28:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 745681.1152835; Fri, 21 Jun 2024 23:28:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKngM-0002NR-Nr; Fri, 21 Jun 2024 23:28:38 +0000
Received: by outflank-mailman (input) for mailman id 745681;
 Fri, 21 Jun 2024 23:28:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ur4z=NX=arm.com=robin.murphy@srs-se1.protection.inumbo.net>)
 id 1sKngK-0002NL-MY
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2024 23:28:36 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id f98ccb12-3025-11ef-b4bb-af5377834399;
 Sat, 22 Jun 2024 01:28:33 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 88123DA7;
 Fri, 21 Jun 2024 16:28:57 -0700 (PDT)
Received: from [10.57.90.59] (unknown [10.57.90.59])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 268703F6A8;
 Fri, 21 Jun 2024 16:28:30 -0700 (PDT)
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
X-Inumbo-ID: f98ccb12-3025-11ef-b4bb-af5377834399
Message-ID: <da3ec316-b001-4711-b323-70af3e6bb014@arm.com>
Date: Sat, 22 Jun 2024 00:28:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2] iommu/xen: Add Xen PV-IOMMU driver
To: TSnake41 <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org,
 iommu@lists.linux.dev
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <24d7ec005e77e4e0127995ba6f4ad16f33737fa5.1718981216.git.teddy.astie@vates.tech>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <24d7ec005e77e4e0127995ba6f4ad16f33737fa5.1718981216.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024-06-21 5:08 pm, TSnake41 wrote:
> From: Teddy Astie <teddy.astie@vates.tech>
> 
> In the context of Xen, Linux runs as Dom0 and doesn't have access to the
> machine IOMMU. Although, a IOMMU is mandatory to use some kernel features
> such as VFIO or DMA protection.
> 
> In Xen, we added a paravirtualized IOMMU with iommu_op hypercall in order to
> allow Dom0 to implement such feature. This commit introduces a new IOMMU driver
> that uses this new hypercall interface.
> 
> Signed-off-by Teddy Astie <teddy.astie@vates.tech>
> ---
> Changes since v1 :
> * formatting changes
> * applied Jan Beulich proposed changes : removed vim notes at end of pv-iommu.h
> * applied Jason Gunthorpe proposed changes : use new ops and remove redundant
> checks
> ---
>   arch/x86/include/asm/xen/hypercall.h |   6 +
>   drivers/iommu/Kconfig                |   9 +
>   drivers/iommu/Makefile               |   1 +
>   drivers/iommu/xen-iommu.c            | 489 +++++++++++++++++++++++++++
>   include/xen/interface/memory.h       |  33 ++
>   include/xen/interface/pv-iommu.h     | 104 ++++++
>   include/xen/interface/xen.h          |   1 +
>   7 files changed, 643 insertions(+)
>   create mode 100644 drivers/iommu/xen-iommu.c
>   create mode 100644 include/xen/interface/pv-iommu.h
> 
> diff --git a/arch/x86/include/asm/xen/hypercall.h b/arch/x86/include/asm/xen/hypercall.h
> index a2dd24947eb8..6b1857f27c14 100644
> --- a/arch/x86/include/asm/xen/hypercall.h
> +++ b/arch/x86/include/asm/xen/hypercall.h
> @@ -490,6 +490,12 @@ HYPERVISOR_xenpmu_op(unsigned int op, void *arg)
>   	return _hypercall2(int, xenpmu_op, op, arg);
>   }
>   
> +static inline int
> +HYPERVISOR_iommu_op(void *arg)
> +{
> +	return _hypercall1(int, iommu_op, arg);
> +}
> +
>   static inline int
>   HYPERVISOR_dm_op(
>   	domid_t dom, unsigned int nr_bufs, struct xen_dm_op_buf *bufs)
> diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> index 0af39bbbe3a3..242cefac77c9 100644
> --- a/drivers/iommu/Kconfig
> +++ b/drivers/iommu/Kconfig
> @@ -480,6 +480,15 @@ config VIRTIO_IOMMU
>   
>   	  Say Y here if you intend to run this kernel as a guest.
>   
> +config XEN_IOMMU
> +	bool "Xen IOMMU driver"
> +	depends on XEN_DOM0

Clearly this depends on X86 as well.

> +	select IOMMU_API
> +	help
> +		Xen PV-IOMMU driver for Dom0.
> +
> +		Say Y here if you intend to run this guest as Xen Dom0.
> +
>   config SPRD_IOMMU
>   	tristate "Unisoc IOMMU Support"
>   	depends on ARCH_SPRD || COMPILE_TEST
> diff --git a/drivers/iommu/Makefile b/drivers/iommu/Makefile
> index 542760d963ec..393afe22c901 100644
> --- a/drivers/iommu/Makefile
> +++ b/drivers/iommu/Makefile
> @@ -30,3 +30,4 @@ obj-$(CONFIG_IOMMU_SVA) += iommu-sva.o
>   obj-$(CONFIG_IOMMU_IOPF) += io-pgfault.o
>   obj-$(CONFIG_SPRD_IOMMU) += sprd-iommu.o
>   obj-$(CONFIG_APPLE_DART) += apple-dart.o
> +obj-$(CONFIG_XEN_IOMMU) += xen-iommu.o
> \ No newline at end of file
> diff --git a/drivers/iommu/xen-iommu.c b/drivers/iommu/xen-iommu.c
> new file mode 100644
> index 000000000000..b765445d27cd
> --- /dev/null
> +++ b/drivers/iommu/xen-iommu.c
> @@ -0,0 +1,489 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Xen PV-IOMMU driver.
> + *
> + * Copyright (C) 2024 Vates SAS
> + *
> + * Author: Teddy Astie <teddy.astie@vates.tech>
> + *
> + */
> +
> +#define pr_fmt(fmt)	"xen-iommu: " fmt
> +
> +#include <linux/kernel.h>
> +#include <linux/init.h>
> +#include <linux/types.h>
> +#include <linux/iommu.h>
> +#include <linux/dma-map-ops.h>

Please drop this; it's a driver, not a DMA ops implementation.

> +#include <linux/pci.h>
> +#include <linux/list.h>
> +#include <linux/string.h>
> +#include <linux/device/driver.h>
> +#include <linux/slab.h>
> +#include <linux/err.h>
> +#include <linux/printk.h>
> +#include <linux/stddef.h>
> +#include <linux/spinlock.h>
> +#include <linux/minmax.h>
> +#include <linux/string.h>
> +#include <asm/iommu.h>
> +
> +#include <xen/xen.h>
> +#include <xen/page.h>
> +#include <xen/interface/memory.h>
> +#include <xen/interface/physdev.h>
> +#include <xen/interface/pv-iommu.h>
> +#include <asm/xen/hypercall.h>
> +#include <asm/xen/page.h>
> +
> +MODULE_DESCRIPTION("Xen IOMMU driver");
> +MODULE_AUTHOR("Teddy Astie <teddy.astie@vates.tech>");
> +MODULE_LICENSE("GPL");
> +
> +#define MSI_RANGE_START		(0xfee00000)
> +#define MSI_RANGE_END		(0xfeefffff)
> +
> +#define XEN_IOMMU_PGSIZES       (0x1000)
> +
> +struct xen_iommu_domain {
> +	struct iommu_domain domain;
> +
> +	u16 ctx_no; /* Xen PV-IOMMU context number */
> +};
> +
> +static struct iommu_device xen_iommu_device;
> +
> +static uint32_t max_nr_pages;
> +static uint64_t max_iova_addr;
> +
> +static spinlock_t lock;

Not a great name - usually it's good to name a lock after what it 
protects. Although perhaps it is already, since AFAICS this isn't 
actually used anywhere anyway.

> +static inline struct xen_iommu_domain *to_xen_iommu_domain(struct iommu_domain *dom)
> +{
> +	return container_of(dom, struct xen_iommu_domain, domain);
> +}
> +
> +static inline u64 addr_to_pfn(u64 addr)
> +{
> +	return addr >> 12;
> +}
> +
> +static inline u64 pfn_to_addr(u64 pfn)
> +{
> +	return pfn << 12;
> +}
> +
> +bool xen_iommu_capable(struct device *dev, enum iommu_cap cap)
> +{
> +	switch (cap) {
> +	case IOMMU_CAP_CACHE_COHERENCY:
> +		return true;

Will the PV-IOMMU only ever be exposed on hardware where that really is 
always true?

> +
> +	default:
> +		return false;
> +	}
> +}
> +
> +struct iommu_domain *xen_iommu_domain_alloc_paging(struct device *dev)
> +{
> +	struct xen_iommu_domain *domain;
> +	int ret;
> +
> +	struct pv_iommu_op op = {
> +		.ctx_no = 0,
> +		.flags = 0,
> +		.subop_id = IOMMUOP_alloc_context
> +	};
> +
> +	ret = HYPERVISOR_iommu_op(&op);
> +
> +	if (ret) {
> +		pr_err("Unable to create Xen IOMMU context (%d)", ret);
> +		return ERR_PTR(ret);
> +	}
> +
> +	domain = kzalloc(sizeof(*domain), GFP_KERNEL);
> +
> +	domain->ctx_no = op.ctx_no;
> +
> +	domain->domain.geometry.aperture_start = 0;
> +	domain->domain.geometry.aperture_end = max_iova_addr;
> +	domain->domain.geometry.force_aperture = true;
> +
> +	return &domain->domain;
> +}
> +
> +static struct iommu_device *xen_iommu_probe_device(struct device *dev)
> +{
> +	if (!dev_is_pci(dev))
> +		return ERR_PTR(-ENODEV);
> +
> +	return &xen_iommu_device;

Even emulated PCI devices have to have an (emulated, presumably) IOMMU?

> +}
> +
> +static void xen_iommu_probe_finalize(struct device *dev)
> +{
> +	set_dma_ops(dev, NULL);
> +	iommu_setup_dma_ops(dev, 0, max_iova_addr);

This shouldn't even compile... anyway, core code does this now, please 
drop the whole callback.

> +}
> +
> +static int xen_iommu_map_pages(struct iommu_domain *domain, unsigned long iova,
> +			       phys_addr_t paddr, size_t pgsize, size_t pgcount,
> +			       int prot, gfp_t gfp, size_t *mapped)
> +{
> +	size_t xen_pg_count = (pgsize / XEN_PAGE_SIZE) * pgcount;

You only advertise the one page size, so you'll always get that back, 
and this seems a bit redundant.

> +	struct xen_iommu_domain *dom = to_xen_iommu_domain(domain);
> +	struct pv_iommu_op op = {
> +		.subop_id = IOMMUOP_map_pages,
> +		.flags = 0,
> +		.ctx_no = dom->ctx_no
> +	};
> +	/* NOTE: paddr is actually bound to pfn, not gfn */
> +	uint64_t pfn = addr_to_pfn(paddr);
> +	uint64_t dfn = addr_to_pfn(iova);
> +	int ret = 0;
> +
> +	//pr_info("Mapping to %lx %zu %zu paddr %x\n", iova, pgsize, pgcount, paddr);

Please try to clean up debugging leftovers before posting the patch (but 
also note that there are already tracepoints and debug messages which 
can be enabled in the core code to give visibility of most of this.)

> +
> +	if (prot & IOMMU_READ)
> +		op.flags |= IOMMU_OP_readable;
> +
> +	if (prot & IOMMU_WRITE)
> +		op.flags |= IOMMU_OP_writeable;
> +
> +	while (xen_pg_count) {

Unless you're super-concerned about performance already, you don't 
really need to worry about looping here - you can happily return short 
as long as you've mapped *something*, and the core code will call you 
back again with the remainder. But it also doesn't complicate things 
*too* much as it is, so feel free to leave it in if you want to.

> +		size_t to_map = min(xen_pg_count, max_nr_pages);
> +		uint64_t gfn = pfn_to_gfn(pfn);
> +
> +		//pr_info("Mapping %lx-%lx at %lx-%lx\n", gfn, gfn + to_map - 1, dfn, dfn + to_map - 1);
> +
> +		op.map_pages.gfn = gfn;
> +		op.map_pages.dfn = dfn;
> +
> +		op.map_pages.nr_pages = to_map;
> +
> +		ret = HYPERVISOR_iommu_op(&op);
> +
> +		//pr_info("map_pages.mapped = %u\n", op.map_pages.mapped);
> +
> +		if (mapped)
> +			*mapped += XEN_PAGE_SIZE * op.map_pages.mapped;
> +
> +		if (ret)
> +			break;
> +
> +		xen_pg_count -= to_map;
> +
> +		pfn += to_map;
> +		dfn += to_map;
> +	}
> +
> +	return ret;
> +}
> +
> +static size_t xen_iommu_unmap_pages(struct iommu_domain *domain, unsigned long iova,
> +				    size_t pgsize, size_t pgcount,
> +				    struct iommu_iotlb_gather *iotlb_gather)
> +{
> +	size_t xen_pg_count = (pgsize / XEN_PAGE_SIZE) * pgcount;
> +	struct xen_iommu_domain *dom = to_xen_iommu_domain(domain);
> +	struct pv_iommu_op op = {
> +		.subop_id = IOMMUOP_unmap_pages,
> +		.ctx_no = dom->ctx_no,
> +		.flags = 0,
> +	};
> +	uint64_t dfn = addr_to_pfn(iova);
> +	int ret = 0;
> +
> +	if (WARN(!dom->ctx_no, "Tried to unmap page to default context"))
> +		return -EINVAL;

This would go hilariously wrong... the return value here is bytes 
successfully unmapped, a total failure should return 0. But then how 
would it ever happen anyway? Unmap is a domain op, so a domain which 
doesn't allow unmapping shouldn't offer it in the first place...

> +	while (xen_pg_count) {
> +		size_t to_unmap = min(xen_pg_count, max_nr_pages);
> +
> +		//pr_info("Unmapping %lx-%lx\n", dfn, dfn + to_unmap - 1);
> +
> +		op.unmap_pages.dfn = dfn;
> +		op.unmap_pages.nr_pages = to_unmap;
> +
> +		ret = HYPERVISOR_iommu_op(&op);
> +
> +		if (ret)
> +			pr_warn("Unmap failure (%lx-%lx)\n", dfn, dfn + to_unmap - 1);

In this case I'd argue that you really *do* want to return short, in the 
hope of propagating the error back up and letting the caller know the 
address space is now messed up before things start blowing up even more 
if they keep going and subsequently try to map new pages into 
not-actually-unmapped VAs.

> +
> +		xen_pg_count -= to_unmap;
> +
> +		dfn += to_unmap;
> +	}
> +
> +	return pgcount * pgsize;
> +}
> +
> +int xen_iommu_attach_dev(struct iommu_domain *domain, struct device *dev)
> +{
> +	struct pci_dev *pdev;
> +	struct xen_iommu_domain *dom = to_xen_iommu_domain(domain);
> +	struct pv_iommu_op op = {
> +		.subop_id = IOMMUOP_reattach_device,
> +		.flags = 0,
> +		.ctx_no = dom->ctx_no,
> +	};
> +
> +	pdev = to_pci_dev(dev);
> +
> +	op.reattach_device.dev.seg = pci_domain_nr(pdev->bus);
> +	op.reattach_device.dev.bus = pdev->bus->number;
> +	op.reattach_device.dev.devfn = pdev->devfn;
> +
> +	return HYPERVISOR_iommu_op(&op);
> +}
> +
> +static void xen_iommu_free(struct iommu_domain *domain)
> +{
> +	int ret;
> +	struct xen_iommu_domain *dom = to_xen_iommu_domain(domain);
> +
> +	if (dom->ctx_no != 0) {

Much like unmap above, this not being true would imply that someone's 
managed to go round the back of the core code to get the .free op from a 
validly-allocated domain and then pass something other than that domain 
to it. Personally I'd consider that a level of brokenness that's not 
even worth trying to consider at all, but if you want to go as far as 
determining that you *have* clearly been given something you couldn't 
have allocated, then trying to kfree() it probably isn't wise either.

> +		struct pv_iommu_op op = {
> +			.ctx_no = dom->ctx_no,
> +			.flags = 0,
> +			.subop_id = IOMMUOP_free_context
> +		};
> +
> +		ret = HYPERVISOR_iommu_op(&op);
> +
> +		if (ret)
> +			pr_err("Context %hu destruction failure\n", dom->ctx_no);
> +	}
> +
> +	kfree(domain);
> +}
> +
> +static phys_addr_t xen_iommu_iova_to_phys(struct iommu_domain *domain, dma_addr_t iova)
> +{
> +	int ret;
> +	struct xen_iommu_domain *dom = to_xen_iommu_domain(domain);
> +
> +	struct pv_iommu_op op = {
> +		.ctx_no = dom->ctx_no,
> +		.flags = 0,
> +		.subop_id = IOMMUOP_lookup_page,
> +	};
> +
> +	op.lookup_page.dfn = addr_to_pfn(iova);
> +
> +	ret = HYPERVISOR_iommu_op(&op);
> +
> +	if (ret)
> +		return 0;
> +
> +	phys_addr_t page_addr = pfn_to_addr(gfn_to_pfn(op.lookup_page.gfn));
> +
> +	/* Consider non-aligned iova */
> +	return page_addr + (iova & 0xFFF);
> +}
> +
> +static void xen_iommu_get_resv_regions(struct device *dev, struct list_head *head)
> +{
> +	struct iommu_resv_region *reg;
> +	struct xen_reserved_device_memory *entries;
> +	struct xen_reserved_device_memory_map map;
> +	struct pci_dev *pdev;
> +	int ret, i;
> +
> +	pdev = to_pci_dev(dev);
> +
> +	reg = iommu_alloc_resv_region(MSI_RANGE_START,
> +				      MSI_RANGE_END - MSI_RANGE_START + 1,
> +				      0, IOMMU_RESV_MSI, GFP_KERNEL);
> +
> +	if (!reg)
> +		return;
> +
> +	list_add_tail(&reg->list, head);
> +
> +	/* Map xen-specific entries */
> +
> +	/* First, get number of entries to map */
> +	map.buffer = NULL;
> +	map.nr_entries = 0;
> +	map.flags = 0;
> +
> +	map.dev.pci.seg = pci_domain_nr(pdev->bus);
> +	map.dev.pci.bus = pdev->bus->number;
> +	map.dev.pci.devfn = pdev->devfn;
> +
> +	ret = HYPERVISOR_memory_op(XENMEM_reserved_device_memory_map, &map);
> +
> +	if (ret == 0)
> +		/* No reserved region, nothing to do */
> +		return;
> +
> +	if (ret != -ENOBUFS) {
> +		pr_err("Unable to get reserved region count (%d)\n", ret);
> +		return;
> +	}
> +
> +	/* Assume a reasonable number of entries, otherwise, something is probably wrong */
> +	if (WARN_ON(map.nr_entries > 256))
> +		pr_warn("Xen reporting many reserved regions (%u)\n", map.nr_entries);
> +
> +	/* And finally get actual mappings */
> +	entries = kcalloc(map.nr_entries, sizeof(struct xen_reserved_device_memory),
> +					  GFP_KERNEL);
> +
> +	if (!entries) {
> +		pr_err("No memory for map entries\n");
> +		return;
> +	}
> +
> +	map.buffer = entries;
> +
> +	ret = HYPERVISOR_memory_op(XENMEM_reserved_device_memory_map, &map);
> +
> +	if (ret != 0) {
> +		pr_err("Unable to get reserved regions (%d)\n", ret);
> +		kfree(entries);
> +		return;
> +	}
> +
> +	for (i = 0; i < map.nr_entries; i++) {
> +		struct xen_reserved_device_memory entry = entries[i];
> +
> +		reg = iommu_alloc_resv_region(pfn_to_addr(entry.start_pfn),
> +					      pfn_to_addr(entry.nr_pages),
> +					      0, IOMMU_RESV_RESERVED, GFP_KERNEL);
> +
> +		if (!reg)
> +			break;
> +
> +		list_add_tail(&reg->list, head);
> +	}
> +
> +	kfree(entries);
> +}
> +
> +static int default_domain_attach_dev(struct iommu_domain *domain,
> +				     struct device *dev)
> +{
> +	int ret;
> +	struct pci_dev *pdev;
> +	struct pv_iommu_op op = {
> +		.subop_id = IOMMUOP_reattach_device,
> +		.flags = 0,
> +		.ctx_no = 0 /* reattach device back to default context */
> +	};
> +
> +	pdev = to_pci_dev(dev);
> +
> +	op.reattach_device.dev.seg = pci_domain_nr(pdev->bus);
> +	op.reattach_device.dev.bus = pdev->bus->number;
> +	op.reattach_device.dev.devfn = pdev->devfn;
> +
> +	ret = HYPERVISOR_iommu_op(&op);
> +
> +	if (ret)
> +		pr_warn("Unable to release device %p\n", &op.reattach_device.dev);
> +
> +	return ret;
> +}
> +
> +static struct iommu_domain default_domain = {
> +	.ops = &(const struct iommu_domain_ops){
> +		.attach_dev = default_domain_attach_dev
> +	}
> +};

Looks like you could make it a static xen_iommu_domain and just use the 
normal attach callback? Either way please name it something less 
confusing like xen_iommu_identity_domain - "default" is far too 
overloaded round here already...

> +static struct iommu_ops xen_iommu_ops = {
> +	.identity_domain = &default_domain,
> +	.release_domain = &default_domain,
> +	.capable = xen_iommu_capable,
> +	.domain_alloc_paging = xen_iommu_domain_alloc_paging,
> +	.probe_device = xen_iommu_probe_device,
> +	.probe_finalize = xen_iommu_probe_finalize,
> +	.device_group = pci_device_group,
> +	.get_resv_regions = xen_iommu_get_resv_regions,
> +	.pgsize_bitmap = XEN_IOMMU_PGSIZES,
> +	.default_domain_ops = &(const struct iommu_domain_ops) {
> +		.map_pages = xen_iommu_map_pages,
> +		.unmap_pages = xen_iommu_unmap_pages,
> +		.attach_dev = xen_iommu_attach_dev,
> +		.iova_to_phys = xen_iommu_iova_to_phys,
> +		.free = xen_iommu_free,
> +	},
> +};
> +
> +int __init xen_iommu_init(void)
> +{
> +	int ret;
> +	struct pv_iommu_op op = {
> +		.subop_id = IOMMUOP_query_capabilities
> +	};
> +
> +	if (!xen_domain())
> +		return -ENODEV;
> +
> +	/* Check if iommu_op is supported */
> +	if (HYPERVISOR_iommu_op(&op) == -ENOSYS)
> +		return -ENODEV; /* No Xen IOMMU hardware */
> +
> +	pr_info("Initialising Xen IOMMU driver\n");
> +	pr_info("max_nr_pages=%d\n", op.cap.max_nr_pages);
> +	pr_info("max_ctx_no=%d\n", op.cap.max_ctx_no);
> +	pr_info("max_iova_addr=%llx\n", op.cap.max_iova_addr);
> +
> +	if (op.cap.max_ctx_no == 0) {
> +		pr_err("Unable to use IOMMU PV driver (no context available)\n");
> +		return -ENOTSUPP; /* Unable to use IOMMU PV ? */
> +	}
> +
> +	if (xen_domain_type == XEN_PV_DOMAIN)
> +		/* TODO: In PV domain, due to the existing pfn-gfn mapping we need to
> +		 * consider that under certains circonstances, we have :
> +		 *   pfn_to_gfn(x + 1) != pfn_to_gfn(x) + 1
> +		 *
> +		 * In these cases, we would want to separate the subop into several calls.
> +		 * (only doing the grouped operation when the mapping is actually contigous)
> +		 * Only map operation would be affected, as unmap actually uses dfn which
> +		 * doesn't have this kind of mapping.
> +		 *
> +		 * Force single-page operations to work arround this issue for now.
> +		 */
> +		max_nr_pages = 1;
> +	else
> +		/* With HVM domains, pfn_to_gfn is identity, there is no issue regarding this. */
> +		max_nr_pages = op.cap.max_nr_pages;
> +
> +	max_iova_addr = op.cap.max_iova_addr;
> +
> +	spin_lock_init(&lock);
> +
> +	ret = iommu_device_sysfs_add(&xen_iommu_device, NULL, NULL, "xen-iommu");
> +	if (ret) {
> +		pr_err("Unable to add Xen IOMMU sysfs\n");
> +		return ret;
> +	}
> +
> +	ret = iommu_device_register(&xen_iommu_device, &xen_iommu_ops, NULL);
> +	if (ret) {
> +		pr_err("Unable to register Xen IOMMU device %d\n", ret);
> +		iommu_device_sysfs_remove(&xen_iommu_device);
> +		return ret;
> +	}
> +
> +	/* swiotlb is redundant when IOMMU is active. */
> +	x86_swiotlb_enable = false;

That's not always true, but either way if this is at 
module_init/device_initcall time then it's too late to make any 
difference anyway.

> +
> +	return 0;
> +}
> +
> +void __exit xen_iommu_fini(void)
> +{
> +	pr_info("Unregistering Xen IOMMU driver\n");
> +
> +	iommu_device_unregister(&xen_iommu_device);
> +	iommu_device_sysfs_remove(&xen_iommu_device);
> +}

This is dead code since the Kconfig is only "bool". Either allow it to 
be an actual module (and make sure that works), or drop the pretence 
altogether.

Thanks,
Robin.

