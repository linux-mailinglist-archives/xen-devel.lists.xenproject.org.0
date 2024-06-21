Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D765912AF6
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2024 18:09:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.745385.1152504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKgop-00030T-6R; Fri, 21 Jun 2024 16:08:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 745385.1152504; Fri, 21 Jun 2024 16:08:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKgop-0002yH-3O; Fri, 21 Jun 2024 16:08:55 +0000
Received: by outflank-mailman (input) for mailman id 745385;
 Fri, 21 Jun 2024 16:08:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BRiO=NX=bounce.vates.tech=bounce-md_30504962.6675a590.v1-5926d64768ab4ac794063f0d056f783f@srs-se1.protection.inumbo.net>)
 id 1sKgon-0002wx-El
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2024 16:08:53 +0000
Received: from mail187-10.suw11.mandrillapp.com
 (mail187-10.suw11.mandrillapp.com [198.2.187.10])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8bdcac4f-2fe8-11ef-b4bb-af5377834399;
 Fri, 21 Jun 2024 18:08:50 +0200 (CEST)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-10.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4W5MjX4ZP0z5QkLm5
 for <xen-devel@lists.xenproject.org>; Fri, 21 Jun 2024 16:08:48 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 5926d64768ab4ac794063f0d056f783f; Fri, 21 Jun 2024 16:08:48 +0000
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
X-Inumbo-ID: 8bdcac4f-2fe8-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1718986128; x=1719246628;
	bh=rk8qCgsNjgkmAX/pojUQbJPkI3R/bP9yagRBiEKnV0s=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=ZWvlm09KloYruoqr5ZxISN1mpApznROnS2qaMjWkjWUgl2WZ6geGeCyHk/WQgutNP
	 Hi0wtebQDwX9ZrYf2Ul9RI3IJRw6PmEOVxqx1gQk0AM24nMat8AQI3/RyZiIaW0x6t
	 F9Y3U72nU0NoMGXGXHUC7FRTGDHEVtr+U/XdIy7Bn4ZcIHDWe4WTQENLH7wYUo6c4M
	 wAAxRFqTM682bOfnu7iDxdBsx7EBRU+oSeUrFtRfVqYh8Ro9Bak/7aJQv7ZKXw9ntR
	 Mn7ro0m/lMNHPjPIv1zrwAtrpzNB9kPxUAUCBkX+qlwBXRdRXRoPEXu4swrN8EBDxa
	 NzMjccKh82OCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1718986128; x=1719246628; i=teddy.astie@vates.tech;
	bh=rk8qCgsNjgkmAX/pojUQbJPkI3R/bP9yagRBiEKnV0s=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=wXBHRiB2j/zmp7/N/IUbIJSCxYxvhsk+nuichfdQ2K6pPG534V3ANh6bsRCZeKkpG
	 IUB/+0XAwWlBNnc8uQNq55iH6coDn4tbvif8gEZBc0iMQY8EVC0Vz4N39HSNZltLcK
	 /6REDWjuOoBf40k7ge1t67+LGc9Ti/2FXWuswHjiHsG+XaULSfC1OrCkVRSmd9pZ/9
	 BSt+T+mA7GpQBVH1p7S77pBDnifd1x4jpKAFNTzUQvRfoZLPRSbkWfVXZUiyB7jXoM
	 2+dGht5vmSZ73RU23HJV4HfOvDQhgkNN0dCB2SJ3Wt52/renVsMnwugx30Q8xxqPEC
	 mqJikToK/KBpQ==
From: TSnake41 <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=20v2]=20iommu/xen:=20Add=20Xen=20PV-IOMMU=20driver?=
X-Mailer: git-send-email 2.45.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1718986126719
To: xen-devel@lists.xenproject.org, iommu@lists.linux.dev
Cc: Teddy Astie <teddy.astie@vates.tech>, Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, =?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Message-Id: <24d7ec005e77e4e0127995ba6f4ad16f33737fa5.1718981216.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.5926d64768ab4ac794063f0d056f783f?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240621:md
Date: Fri, 21 Jun 2024 16:08:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

From: Teddy Astie <teddy.astie@vates.tech>

In the context of Xen, Linux runs as Dom0 and doesn't have access to the
machine IOMMU. Although, a IOMMU is mandatory to use some kernel features
such as VFIO or DMA protection.

In Xen, we added a paravirtualized IOMMU with iommu_op hypercall in order to
allow Dom0 to implement such feature. This commit introduces a new IOMMU driver
that uses this new hypercall interface.

Signed-off-by Teddy Astie <teddy.astie@vates.tech>
---
Changes since v1 :
* formatting changes
* applied Jan Beulich proposed changes : removed vim notes at end of pv-iommu.h
* applied Jason Gunthorpe proposed changes : use new ops and remove redundant
checks
---
 arch/x86/include/asm/xen/hypercall.h |   6 +
 drivers/iommu/Kconfig                |   9 +
 drivers/iommu/Makefile               |   1 +
 drivers/iommu/xen-iommu.c            | 489 +++++++++++++++++++++++++++
 include/xen/interface/memory.h       |  33 ++
 include/xen/interface/pv-iommu.h     | 104 ++++++
 include/xen/interface/xen.h          |   1 +
 7 files changed, 643 insertions(+)
 create mode 100644 drivers/iommu/xen-iommu.c
 create mode 100644 include/xen/interface/pv-iommu.h

diff --git a/arch/x86/include/asm/xen/hypercall.h b/arch/x86/include/asm/xen/hypercall.h
index a2dd24947eb8..6b1857f27c14 100644
--- a/arch/x86/include/asm/xen/hypercall.h
+++ b/arch/x86/include/asm/xen/hypercall.h
@@ -490,6 +490,12 @@ HYPERVISOR_xenpmu_op(unsigned int op, void *arg)
 	return _hypercall2(int, xenpmu_op, op, arg);
 }
 
+static inline int
+HYPERVISOR_iommu_op(void *arg)
+{
+	return _hypercall1(int, iommu_op, arg);
+}
+
 static inline int
 HYPERVISOR_dm_op(
 	domid_t dom, unsigned int nr_bufs, struct xen_dm_op_buf *bufs)
diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index 0af39bbbe3a3..242cefac77c9 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -480,6 +480,15 @@ config VIRTIO_IOMMU
 
 	  Say Y here if you intend to run this kernel as a guest.
 
+config XEN_IOMMU
+	bool "Xen IOMMU driver"
+	depends on XEN_DOM0
+	select IOMMU_API
+	help
+		Xen PV-IOMMU driver for Dom0.
+
+		Say Y here if you intend to run this guest as Xen Dom0.
+
 config SPRD_IOMMU
 	tristate "Unisoc IOMMU Support"
 	depends on ARCH_SPRD || COMPILE_TEST
diff --git a/drivers/iommu/Makefile b/drivers/iommu/Makefile
index 542760d963ec..393afe22c901 100644
--- a/drivers/iommu/Makefile
+++ b/drivers/iommu/Makefile
@@ -30,3 +30,4 @@ obj-$(CONFIG_IOMMU_SVA) += iommu-sva.o
 obj-$(CONFIG_IOMMU_IOPF) += io-pgfault.o
 obj-$(CONFIG_SPRD_IOMMU) += sprd-iommu.o
 obj-$(CONFIG_APPLE_DART) += apple-dart.o
+obj-$(CONFIG_XEN_IOMMU) += xen-iommu.o
\ No newline at end of file
diff --git a/drivers/iommu/xen-iommu.c b/drivers/iommu/xen-iommu.c
new file mode 100644
index 000000000000..b765445d27cd
--- /dev/null
+++ b/drivers/iommu/xen-iommu.c
@@ -0,0 +1,489 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Xen PV-IOMMU driver.
+ *
+ * Copyright (C) 2024 Vates SAS
+ *
+ * Author: Teddy Astie <teddy.astie@vates.tech>
+ *
+ */
+
+#define pr_fmt(fmt)	"xen-iommu: " fmt
+
+#include <linux/kernel.h>
+#include <linux/init.h>
+#include <linux/types.h>
+#include <linux/iommu.h>
+#include <linux/dma-map-ops.h>
+#include <linux/pci.h>
+#include <linux/list.h>
+#include <linux/string.h>
+#include <linux/device/driver.h>
+#include <linux/slab.h>
+#include <linux/err.h>
+#include <linux/printk.h>
+#include <linux/stddef.h>
+#include <linux/spinlock.h>
+#include <linux/minmax.h>
+#include <linux/string.h>
+#include <asm/iommu.h>
+
+#include <xen/xen.h>
+#include <xen/page.h>
+#include <xen/interface/memory.h>
+#include <xen/interface/physdev.h>
+#include <xen/interface/pv-iommu.h>
+#include <asm/xen/hypercall.h>
+#include <asm/xen/page.h>
+
+MODULE_DESCRIPTION("Xen IOMMU driver");
+MODULE_AUTHOR("Teddy Astie <teddy.astie@vates.tech>");
+MODULE_LICENSE("GPL");
+
+#define MSI_RANGE_START		(0xfee00000)
+#define MSI_RANGE_END		(0xfeefffff)
+
+#define XEN_IOMMU_PGSIZES       (0x1000)
+
+struct xen_iommu_domain {
+	struct iommu_domain domain;
+
+	u16 ctx_no; /* Xen PV-IOMMU context number */
+};
+
+static struct iommu_device xen_iommu_device;
+
+static uint32_t max_nr_pages;
+static uint64_t max_iova_addr;
+
+static spinlock_t lock;
+
+static inline struct xen_iommu_domain *to_xen_iommu_domain(struct iommu_domain *dom)
+{
+	return container_of(dom, struct xen_iommu_domain, domain);
+}
+
+static inline u64 addr_to_pfn(u64 addr)
+{
+	return addr >> 12;
+}
+
+static inline u64 pfn_to_addr(u64 pfn)
+{
+	return pfn << 12;
+}
+
+bool xen_iommu_capable(struct device *dev, enum iommu_cap cap)
+{
+	switch (cap) {
+	case IOMMU_CAP_CACHE_COHERENCY:
+		return true;
+
+	default:
+		return false;
+	}
+}
+
+struct iommu_domain *xen_iommu_domain_alloc_paging(struct device *dev)
+{
+	struct xen_iommu_domain *domain;
+	int ret;
+
+	struct pv_iommu_op op = {
+		.ctx_no = 0,
+		.flags = 0,
+		.subop_id = IOMMUOP_alloc_context
+	};
+
+	ret = HYPERVISOR_iommu_op(&op);
+
+	if (ret) {
+		pr_err("Unable to create Xen IOMMU context (%d)", ret);
+		return ERR_PTR(ret);
+	}
+
+	domain = kzalloc(sizeof(*domain), GFP_KERNEL);
+
+	domain->ctx_no = op.ctx_no;
+
+	domain->domain.geometry.aperture_start = 0;
+	domain->domain.geometry.aperture_end = max_iova_addr;
+	domain->domain.geometry.force_aperture = true;
+
+	return &domain->domain;
+}
+
+static struct iommu_device *xen_iommu_probe_device(struct device *dev)
+{
+	if (!dev_is_pci(dev))
+		return ERR_PTR(-ENODEV);
+
+	return &xen_iommu_device;
+}
+
+static void xen_iommu_probe_finalize(struct device *dev)
+{
+	set_dma_ops(dev, NULL);
+	iommu_setup_dma_ops(dev, 0, max_iova_addr);
+}
+
+static int xen_iommu_map_pages(struct iommu_domain *domain, unsigned long iova,
+			       phys_addr_t paddr, size_t pgsize, size_t pgcount,
+			       int prot, gfp_t gfp, size_t *mapped)
+{
+	size_t xen_pg_count = (pgsize / XEN_PAGE_SIZE) * pgcount;
+	struct xen_iommu_domain *dom = to_xen_iommu_domain(domain);
+	struct pv_iommu_op op = {
+		.subop_id = IOMMUOP_map_pages,
+		.flags = 0,
+		.ctx_no = dom->ctx_no
+	};
+	/* NOTE: paddr is actually bound to pfn, not gfn */
+	uint64_t pfn = addr_to_pfn(paddr);
+	uint64_t dfn = addr_to_pfn(iova);
+	int ret = 0;
+
+	//pr_info("Mapping to %lx %zu %zu paddr %x\n", iova, pgsize, pgcount, paddr);
+
+	if (prot & IOMMU_READ)
+		op.flags |= IOMMU_OP_readable;
+
+	if (prot & IOMMU_WRITE)
+		op.flags |= IOMMU_OP_writeable;
+
+	while (xen_pg_count) {
+		size_t to_map = min(xen_pg_count, max_nr_pages);
+		uint64_t gfn = pfn_to_gfn(pfn);
+
+		//pr_info("Mapping %lx-%lx at %lx-%lx\n", gfn, gfn + to_map - 1, dfn, dfn + to_map - 1);
+
+		op.map_pages.gfn = gfn;
+		op.map_pages.dfn = dfn;
+
+		op.map_pages.nr_pages = to_map;
+
+		ret = HYPERVISOR_iommu_op(&op);
+
+		//pr_info("map_pages.mapped = %u\n", op.map_pages.mapped);
+
+		if (mapped)
+			*mapped += XEN_PAGE_SIZE * op.map_pages.mapped;
+
+		if (ret)
+			break;
+
+		xen_pg_count -= to_map;
+
+		pfn += to_map;
+		dfn += to_map;
+	}
+
+	return ret;
+}
+
+static size_t xen_iommu_unmap_pages(struct iommu_domain *domain, unsigned long iova,
+				    size_t pgsize, size_t pgcount,
+				    struct iommu_iotlb_gather *iotlb_gather)
+{
+	size_t xen_pg_count = (pgsize / XEN_PAGE_SIZE) * pgcount;
+	struct xen_iommu_domain *dom = to_xen_iommu_domain(domain);
+	struct pv_iommu_op op = {
+		.subop_id = IOMMUOP_unmap_pages,
+		.ctx_no = dom->ctx_no,
+		.flags = 0,
+	};
+	uint64_t dfn = addr_to_pfn(iova);
+	int ret = 0;
+
+	if (WARN(!dom->ctx_no, "Tried to unmap page to default context"))
+		return -EINVAL;
+
+	while (xen_pg_count) {
+		size_t to_unmap = min(xen_pg_count, max_nr_pages);
+
+		//pr_info("Unmapping %lx-%lx\n", dfn, dfn + to_unmap - 1);
+
+		op.unmap_pages.dfn = dfn;
+		op.unmap_pages.nr_pages = to_unmap;
+
+		ret = HYPERVISOR_iommu_op(&op);
+
+		if (ret)
+			pr_warn("Unmap failure (%lx-%lx)\n", dfn, dfn + to_unmap - 1);
+
+		xen_pg_count -= to_unmap;
+
+		dfn += to_unmap;
+	}
+
+	return pgcount * pgsize;
+}
+
+int xen_iommu_attach_dev(struct iommu_domain *domain, struct device *dev)
+{
+	struct pci_dev *pdev;
+	struct xen_iommu_domain *dom = to_xen_iommu_domain(domain);
+	struct pv_iommu_op op = {
+		.subop_id = IOMMUOP_reattach_device,
+		.flags = 0,
+		.ctx_no = dom->ctx_no,
+	};
+
+	pdev = to_pci_dev(dev);
+
+	op.reattach_device.dev.seg = pci_domain_nr(pdev->bus);
+	op.reattach_device.dev.bus = pdev->bus->number;
+	op.reattach_device.dev.devfn = pdev->devfn;
+
+	return HYPERVISOR_iommu_op(&op);
+}
+
+static void xen_iommu_free(struct iommu_domain *domain)
+{
+	int ret;
+	struct xen_iommu_domain *dom = to_xen_iommu_domain(domain);
+
+	if (dom->ctx_no != 0) {
+		struct pv_iommu_op op = {
+			.ctx_no = dom->ctx_no,
+			.flags = 0,
+			.subop_id = IOMMUOP_free_context
+		};
+
+		ret = HYPERVISOR_iommu_op(&op);
+
+		if (ret)
+			pr_err("Context %hu destruction failure\n", dom->ctx_no);
+	}
+
+	kfree(domain);
+}
+
+static phys_addr_t xen_iommu_iova_to_phys(struct iommu_domain *domain, dma_addr_t iova)
+{
+	int ret;
+	struct xen_iommu_domain *dom = to_xen_iommu_domain(domain);
+
+	struct pv_iommu_op op = {
+		.ctx_no = dom->ctx_no,
+		.flags = 0,
+		.subop_id = IOMMUOP_lookup_page,
+	};
+
+	op.lookup_page.dfn = addr_to_pfn(iova);
+
+	ret = HYPERVISOR_iommu_op(&op);
+
+	if (ret)
+		return 0;
+
+	phys_addr_t page_addr = pfn_to_addr(gfn_to_pfn(op.lookup_page.gfn));
+
+	/* Consider non-aligned iova */
+	return page_addr + (iova & 0xFFF);
+}
+
+static void xen_iommu_get_resv_regions(struct device *dev, struct list_head *head)
+{
+	struct iommu_resv_region *reg;
+	struct xen_reserved_device_memory *entries;
+	struct xen_reserved_device_memory_map map;
+	struct pci_dev *pdev;
+	int ret, i;
+
+	pdev = to_pci_dev(dev);
+
+	reg = iommu_alloc_resv_region(MSI_RANGE_START,
+				      MSI_RANGE_END - MSI_RANGE_START + 1,
+				      0, IOMMU_RESV_MSI, GFP_KERNEL);
+
+	if (!reg)
+		return;
+
+	list_add_tail(&reg->list, head);
+
+	/* Map xen-specific entries */
+
+	/* First, get number of entries to map */
+	map.buffer = NULL;
+	map.nr_entries = 0;
+	map.flags = 0;
+
+	map.dev.pci.seg = pci_domain_nr(pdev->bus);
+	map.dev.pci.bus = pdev->bus->number;
+	map.dev.pci.devfn = pdev->devfn;
+
+	ret = HYPERVISOR_memory_op(XENMEM_reserved_device_memory_map, &map);
+
+	if (ret == 0)
+		/* No reserved region, nothing to do */
+		return;
+
+	if (ret != -ENOBUFS) {
+		pr_err("Unable to get reserved region count (%d)\n", ret);
+		return;
+	}
+
+	/* Assume a reasonable number of entries, otherwise, something is probably wrong */
+	if (WARN_ON(map.nr_entries > 256))
+		pr_warn("Xen reporting many reserved regions (%u)\n", map.nr_entries);
+
+	/* And finally get actual mappings */
+	entries = kcalloc(map.nr_entries, sizeof(struct xen_reserved_device_memory),
+					  GFP_KERNEL);
+
+	if (!entries) {
+		pr_err("No memory for map entries\n");
+		return;
+	}
+
+	map.buffer = entries;
+
+	ret = HYPERVISOR_memory_op(XENMEM_reserved_device_memory_map, &map);
+
+	if (ret != 0) {
+		pr_err("Unable to get reserved regions (%d)\n", ret);
+		kfree(entries);
+		return;
+	}
+
+	for (i = 0; i < map.nr_entries; i++) {
+		struct xen_reserved_device_memory entry = entries[i];
+
+		reg = iommu_alloc_resv_region(pfn_to_addr(entry.start_pfn),
+					      pfn_to_addr(entry.nr_pages),
+					      0, IOMMU_RESV_RESERVED, GFP_KERNEL);
+
+		if (!reg)
+			break;
+
+		list_add_tail(&reg->list, head);
+	}
+
+	kfree(entries);
+}
+
+static int default_domain_attach_dev(struct iommu_domain *domain,
+				     struct device *dev)
+{
+	int ret;
+	struct pci_dev *pdev;
+	struct pv_iommu_op op = {
+		.subop_id = IOMMUOP_reattach_device,
+		.flags = 0,
+		.ctx_no = 0 /* reattach device back to default context */
+	};
+
+	pdev = to_pci_dev(dev);
+
+	op.reattach_device.dev.seg = pci_domain_nr(pdev->bus);
+	op.reattach_device.dev.bus = pdev->bus->number;
+	op.reattach_device.dev.devfn = pdev->devfn;
+
+	ret = HYPERVISOR_iommu_op(&op);
+
+	if (ret)
+		pr_warn("Unable to release device %p\n", &op.reattach_device.dev);
+
+	return ret;
+}
+
+static struct iommu_domain default_domain = {
+	.ops = &(const struct iommu_domain_ops){
+		.attach_dev = default_domain_attach_dev
+	}
+};
+
+static struct iommu_ops xen_iommu_ops = {
+	.identity_domain = &default_domain,
+	.release_domain = &default_domain,
+	.capable = xen_iommu_capable,
+	.domain_alloc_paging = xen_iommu_domain_alloc_paging,
+	.probe_device = xen_iommu_probe_device,
+	.probe_finalize = xen_iommu_probe_finalize,
+	.device_group = pci_device_group,
+	.get_resv_regions = xen_iommu_get_resv_regions,
+	.pgsize_bitmap = XEN_IOMMU_PGSIZES,
+	.default_domain_ops = &(const struct iommu_domain_ops) {
+		.map_pages = xen_iommu_map_pages,
+		.unmap_pages = xen_iommu_unmap_pages,
+		.attach_dev = xen_iommu_attach_dev,
+		.iova_to_phys = xen_iommu_iova_to_phys,
+		.free = xen_iommu_free,
+	},
+};
+
+int __init xen_iommu_init(void)
+{
+	int ret;
+	struct pv_iommu_op op = {
+		.subop_id = IOMMUOP_query_capabilities
+	};
+
+	if (!xen_domain())
+		return -ENODEV;
+
+	/* Check if iommu_op is supported */
+	if (HYPERVISOR_iommu_op(&op) == -ENOSYS)
+		return -ENODEV; /* No Xen IOMMU hardware */
+
+	pr_info("Initialising Xen IOMMU driver\n");
+	pr_info("max_nr_pages=%d\n", op.cap.max_nr_pages);
+	pr_info("max_ctx_no=%d\n", op.cap.max_ctx_no);
+	pr_info("max_iova_addr=%llx\n", op.cap.max_iova_addr);
+
+	if (op.cap.max_ctx_no == 0) {
+		pr_err("Unable to use IOMMU PV driver (no context available)\n");
+		return -ENOTSUPP; /* Unable to use IOMMU PV ? */
+	}
+
+	if (xen_domain_type == XEN_PV_DOMAIN)
+		/* TODO: In PV domain, due to the existing pfn-gfn mapping we need to
+		 * consider that under certains circonstances, we have :
+		 *   pfn_to_gfn(x + 1) != pfn_to_gfn(x) + 1
+		 *
+		 * In these cases, we would want to separate the subop into several calls.
+		 * (only doing the grouped operation when the mapping is actually contigous)
+		 * Only map operation would be affected, as unmap actually uses dfn which
+		 * doesn't have this kind of mapping.
+		 *
+		 * Force single-page operations to work arround this issue for now.
+		 */
+		max_nr_pages = 1;
+	else
+		/* With HVM domains, pfn_to_gfn is identity, there is no issue regarding this. */
+		max_nr_pages = op.cap.max_nr_pages;
+
+	max_iova_addr = op.cap.max_iova_addr;
+
+	spin_lock_init(&lock);
+
+	ret = iommu_device_sysfs_add(&xen_iommu_device, NULL, NULL, "xen-iommu");
+	if (ret) {
+		pr_err("Unable to add Xen IOMMU sysfs\n");
+		return ret;
+	}
+
+	ret = iommu_device_register(&xen_iommu_device, &xen_iommu_ops, NULL);
+	if (ret) {
+		pr_err("Unable to register Xen IOMMU device %d\n", ret);
+		iommu_device_sysfs_remove(&xen_iommu_device);
+		return ret;
+	}
+
+	/* swiotlb is redundant when IOMMU is active. */
+	x86_swiotlb_enable = false;
+
+	return 0;
+}
+
+void __exit xen_iommu_fini(void)
+{
+	pr_info("Unregistering Xen IOMMU driver\n");
+
+	iommu_device_unregister(&xen_iommu_device);
+	iommu_device_sysfs_remove(&xen_iommu_device);
+}
+
+module_init(xen_iommu_init);
+module_exit(xen_iommu_fini);
diff --git a/include/xen/interface/memory.h b/include/xen/interface/memory.h
index 1a371a825c55..c860acaf4b0e 100644
--- a/include/xen/interface/memory.h
+++ b/include/xen/interface/memory.h
@@ -10,6 +10,7 @@
 #ifndef __XEN_PUBLIC_MEMORY_H__
 #define __XEN_PUBLIC_MEMORY_H__
 
+#include <xen/interface/physdev.h>
 #include <linux/spinlock.h>
 
 /*
@@ -214,6 +215,38 @@ struct xen_add_to_physmap_range {
 };
 DEFINE_GUEST_HANDLE_STRUCT(xen_add_to_physmap_range);
 
+/*
+ * With some legacy devices, certain guest-physical addresses cannot safely
+ * be used for other purposes, e.g. to map guest RAM.  This hypercall
+ * enumerates those regions so the toolstack can avoid using them.
+ */
+#define XENMEM_reserved_device_memory_map   27
+struct xen_reserved_device_memory {
+    xen_pfn_t start_pfn;
+    xen_ulong_t nr_pages;
+};
+DEFINE_GUEST_HANDLE_STRUCT(xen_reserved_device_memory);
+
+struct xen_reserved_device_memory_map {
+#define XENMEM_RDM_ALL 1 /* Request all regions (ignore dev union). */
+    /* IN */
+    uint32_t flags;
+    /*
+     * IN/OUT
+     *
+     * Gets set to the required number of entries when too low,
+     * signaled by error code -ERANGE.
+     */
+    unsigned int nr_entries;
+    /* OUT */
+    GUEST_HANDLE(xen_reserved_device_memory) buffer;
+    /* IN */
+    union {
+        struct physdev_pci_device pci;
+    } dev;
+};
+DEFINE_GUEST_HANDLE_STRUCT(xen_reserved_device_memory_map);
+
 /*
  * Returns the pseudo-physical memory map as it was when the domain
  * was started (specified by XENMEM_set_memory_map).
diff --git a/include/xen/interface/pv-iommu.h b/include/xen/interface/pv-iommu.h
new file mode 100644
index 000000000000..8a8d366e5f4c
--- /dev/null
+++ b/include/xen/interface/pv-iommu.h
@@ -0,0 +1,104 @@
+/* SPDX-License-Identifier: MIT */
+/******************************************************************************
+ * pv-iommu.h
+ *
+ * Paravirtualized IOMMU driver interface.
+ *
+ * Copyright (c) 2024 Teddy Astie <teddy.astie@vates.tech>
+ */
+
+#ifndef __XEN_PUBLIC_PV_IOMMU_H__
+#define __XEN_PUBLIC_PV_IOMMU_H__
+
+#include "xen.h"
+#include "physdev.h"
+
+#define IOMMU_DEFAULT_CONTEXT (0)
+
+/**
+ * Query PV-IOMMU capabilities for this domain.
+ */
+#define IOMMUOP_query_capabilities    1
+
+/**
+ * Allocate an IOMMU context, the new context handle will be written to ctx_no.
+ */
+#define IOMMUOP_alloc_context         2
+
+/**
+ * Destroy a IOMMU context.
+ * All devices attached to this context are reattached to default context.
+ *
+ * The default context can't be destroyed (0).
+ */
+#define IOMMUOP_free_context          3
+
+/**
+ * Reattach the device to IOMMU context.
+ */
+#define IOMMUOP_reattach_device       4
+
+#define IOMMUOP_map_pages             5
+#define IOMMUOP_unmap_pages           6
+
+/**
+ * Get the GFN associated to a specific DFN.
+ */
+#define IOMMUOP_lookup_page           7
+
+struct pv_iommu_op {
+    uint16_t subop_id;
+    uint16_t ctx_no;
+
+/**
+ * Create a context that is cloned from default.
+ * The new context will be populated with 1:1 mappings covering the entire guest memory.
+ */
+#define IOMMU_CREATE_clone (1 << 0)
+
+#define IOMMU_OP_readable (1 << 0)
+#define IOMMU_OP_writeable (1 << 1)
+    uint32_t flags;
+
+    union {
+        struct {
+            uint64_t gfn;
+            uint64_t dfn;
+            /* Number of pages to map */
+            uint32_t nr_pages;
+            /* Number of pages actually mapped after sub-op */
+            uint32_t mapped;
+        } map_pages;
+
+        struct {
+            uint64_t dfn;
+            /* Number of pages to unmap */
+            uint32_t nr_pages;
+            /* Number of pages actually unmapped after sub-op */
+            uint32_t unmapped;
+        } unmap_pages;
+
+        struct {
+            struct physdev_pci_device dev;
+        } reattach_device;
+
+        struct {
+            uint64_t gfn;
+            uint64_t dfn;
+        } lookup_page;
+
+        struct {
+            /* Maximum number of IOMMU context this domain can use. */
+            uint16_t max_ctx_no;
+            /* Maximum number of pages that can be modified in a single map/unmap operation. */
+            uint32_t max_nr_pages;
+            /* Maximum device address (iova) that the guest can use for mappings. */
+            uint64_t max_iova_addr;
+        } cap;
+    };
+};
+
+typedef struct pv_iommu_op pv_iommu_op_t;
+DEFINE_GUEST_HANDLE_STRUCT(pv_iommu_op_t);
+
+#endif
diff --git a/include/xen/interface/xen.h b/include/xen/interface/xen.h
index 0ca23eca2a9c..8b1daf3fecc6 100644
--- a/include/xen/interface/xen.h
+++ b/include/xen/interface/xen.h
@@ -65,6 +65,7 @@
 #define __HYPERVISOR_xc_reserved_op       39 /* reserved for XenClient */
 #define __HYPERVISOR_xenpmu_op            40
 #define __HYPERVISOR_dm_op                41
+#define __HYPERVISOR_iommu_op 					  43
 
 /* Architecture-specific hypercall definitions. */
 #define __HYPERVISOR_arch_0               48
-- 
2.45.2



Teddy Astie | Vates XCP-ng Intern

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

