Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C7C22C577
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jul 2020 14:43:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyx2d-00017A-1F; Fri, 24 Jul 2020 12:43:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hWcK=BD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jyx2b-00016o-2u
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2020 12:43:09 +0000
X-Inumbo-ID: 38f63932-cdab-11ea-880c-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 38f63932-cdab-11ea-880c-bc764e2007e4;
 Fri, 24 Jul 2020 12:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595594588;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LnrKUU0E0L2NEx45muJDP2eR0l7cIb2vvmXBeLMbICs=;
 b=Z2PGy+hbl65phsYQO3vpIS7GNHhVCFYheS1X+igm7nxdlki/ReV1/NhM
 EGMUWvN+kZPogSn9Z8aGvDMBdMJUkhAQQQlqI8rxx1WmnRMXFj4u2XN04
 +htpMVnfglzamuXy9UoAxUAfrIK2sYFSSdNFCnY1pLoJuk5pvQmfg49Mj g=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: WfBQbZ/B8RjixznMe135h8G4op5I57LLr6cNhd+2OlPg5iZoQzntVR2fvI66FzZ1wlsu2aGkR4
 ZTXryKKaEGGOgpNI6NUmNv9sIISAdllRW8pF5Wsw0jnCf0Un1Q0JwhxiUG2N/GLyNmw6VI40PG
 ziD5YP1SssIvYKgACa/1Ty0AuogXr9+achvpsOZqLB9Nwq7ifesdt/ZozyCHzUASG4GdOluU++
 8bvRw7dRXdla4XWmbl7wasqEPit5RMymzZx9vV0MT4FkQlksJDfa6kf7HV3p6eTnXhFRXgyk7p
 3jQ=
X-SBRS: 2.7
X-MesageID: 23139916
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,390,1589256000"; d="scan'208";a="23139916"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 4/4] xen: add helpers to allocate unpopulated memory
Date: Fri, 24 Jul 2020 14:42:41 +0200
Message-ID: <20200724124241.48208-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200724124241.48208-1-roger.pau@citrix.com>
References: <20200724124241.48208-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 David Airlie <airlied@linux.ie>, Yan
 Yankovskyi <yyankovskyi@gmail.com>, David Hildenbrand <david@redhat.com>,
 dri-devel@lists.freedesktop.org, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Daniel
 Vetter <daniel@ffwll.ch>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

To be used in order to create foreign mappings. This is based on the
ZONE_DEVICE facility which is used by persistent memory devices in
order to create struct pages and kernel virtual mappings for the IOMEM
areas of such devices. Note that on kernels without support for
ZONE_DEVICE Xen will fallback to use ballooned pages in order to
create foreign mappings.

The newly added helpers use the same parameters as the existing
{alloc/free}_xenballooned_pages functions, which allows for in-place
replacement of the callers. Once a memory region has been added to be
used as scratch mapping space it will no longer be released, and pages
returned are kept in a linked list. This allows to have a buffer of
pages and prevents resorting to frequent additions and removals of
regions.

If enabled (because ZONE_DEVICE is supported) the usage of the new
functionality untangles Xen balloon and RAM hotplug from the usage of
unpopulated physical memory ranges to map foreign pages, which is the
correct thing to do in order to avoid mappings of foreign pages depend
on memory hotplug.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
I've not added a new memory_type type and just used
MEMORY_DEVICE_DEVDAX which seems to be what we want for such memory
regions. I'm unsure whether abusing this type is fine, or if I should
instead add a specific type, maybe MEMORY_DEVICE_GENERIC? I don't
think we should be using a specific Xen type at all.
---
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>
Cc: Wei Liu <wl@xen.org>
Cc: Yan Yankovskyi <yyankovskyi@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: xen-devel@lists.xenproject.org
Cc: linux-mm@kvack.org
Cc: David Hildenbrand <david@redhat.com>
Cc: Michal Hocko <mhocko@kernel.org>
---
 drivers/gpu/drm/xen/xen_drm_front_gem.c |   8 +-
 drivers/xen/Makefile                    |   1 +
 drivers/xen/balloon.c                   |   4 +-
 drivers/xen/grant-table.c               |   4 +-
 drivers/xen/privcmd.c                   |   4 +-
 drivers/xen/unpopulated-alloc.c         | 222 ++++++++++++++++++++++++
 drivers/xen/xenbus/xenbus_client.c      |   6 +-
 drivers/xen/xlate_mmu.c                 |   4 +-
 include/xen/xen.h                       |   8 +
 9 files changed, 246 insertions(+), 15 deletions(-)
 create mode 100644 drivers/xen/unpopulated-alloc.c

diff --git a/drivers/gpu/drm/xen/xen_drm_front_gem.c b/drivers/gpu/drm/xen/xen_drm_front_gem.c
index f0b85e094111..9dd06eae767a 100644
--- a/drivers/gpu/drm/xen/xen_drm_front_gem.c
+++ b/drivers/gpu/drm/xen/xen_drm_front_gem.c
@@ -99,8 +99,8 @@ static struct xen_gem_object *gem_create(struct drm_device *dev, size_t size)
 		 * allocate ballooned pages which will be used to map
 		 * grant references provided by the backend
 		 */
-		ret = alloc_xenballooned_pages(xen_obj->num_pages,
-					       xen_obj->pages);
+		ret = xen_alloc_unpopulated_pages(xen_obj->num_pages,
+					          xen_obj->pages);
 		if (ret < 0) {
 			DRM_ERROR("Cannot allocate %zu ballooned pages: %d\n",
 				  xen_obj->num_pages, ret);
@@ -152,8 +152,8 @@ void xen_drm_front_gem_free_object_unlocked(struct drm_gem_object *gem_obj)
 	} else {
 		if (xen_obj->pages) {
 			if (xen_obj->be_alloc) {
-				free_xenballooned_pages(xen_obj->num_pages,
-							xen_obj->pages);
+				xen_free_unpopulated_pages(xen_obj->num_pages,
+							   xen_obj->pages);
 				gem_free_pages_array(xen_obj);
 			} else {
 				drm_gem_put_pages(&xen_obj->base,
diff --git a/drivers/xen/Makefile b/drivers/xen/Makefile
index 0d322f3d90cd..788a5d9c8ef0 100644
--- a/drivers/xen/Makefile
+++ b/drivers/xen/Makefile
@@ -42,3 +42,4 @@ xen-gntdev-$(CONFIG_XEN_GNTDEV_DMABUF)	+= gntdev-dmabuf.o
 xen-gntalloc-y				:= gntalloc.o
 xen-privcmd-y				:= privcmd.o privcmd-buf.o
 obj-$(CONFIG_XEN_FRONT_PGDIR_SHBUF)	+= xen-front-pgdir-shbuf.o
+obj-$(CONFIG_ZONE_DEVICE)		+= unpopulated-alloc.o
diff --git a/drivers/xen/balloon.c b/drivers/xen/balloon.c
index b1d8b028bf80..815ef10eb2ff 100644
--- a/drivers/xen/balloon.c
+++ b/drivers/xen/balloon.c
@@ -654,7 +654,7 @@ void free_xenballooned_pages(int nr_pages, struct page **pages)
 }
 EXPORT_SYMBOL(free_xenballooned_pages);
 
-#ifdef CONFIG_XEN_PV
+#if defined(CONFIG_XEN_PV) && !defined(CONFIG_ZONE_DEVICE)
 static void __init balloon_add_region(unsigned long start_pfn,
 				      unsigned long pages)
 {
@@ -708,7 +708,7 @@ static int __init balloon_init(void)
 	register_sysctl_table(xen_root);
 #endif
 
-#ifdef CONFIG_XEN_PV
+#if defined(CONFIG_XEN_PV) && !defined(CONFIG_ZONE_DEVICE)
 	{
 		int i;
 
diff --git a/drivers/xen/grant-table.c b/drivers/xen/grant-table.c
index 8d06bf1cc347..523dcdf39cc9 100644
--- a/drivers/xen/grant-table.c
+++ b/drivers/xen/grant-table.c
@@ -801,7 +801,7 @@ int gnttab_alloc_pages(int nr_pages, struct page **pages)
 {
 	int ret;
 
-	ret = alloc_xenballooned_pages(nr_pages, pages);
+	ret = xen_alloc_unpopulated_pages(nr_pages, pages);
 	if (ret < 0)
 		return ret;
 
@@ -836,7 +836,7 @@ EXPORT_SYMBOL_GPL(gnttab_pages_clear_private);
 void gnttab_free_pages(int nr_pages, struct page **pages)
 {
 	gnttab_pages_clear_private(nr_pages, pages);
-	free_xenballooned_pages(nr_pages, pages);
+	xen_free_unpopulated_pages(nr_pages, pages);
 }
 EXPORT_SYMBOL_GPL(gnttab_free_pages);
 
diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
index a250d118144a..56000ab70974 100644
--- a/drivers/xen/privcmd.c
+++ b/drivers/xen/privcmd.c
@@ -425,7 +425,7 @@ static int alloc_empty_pages(struct vm_area_struct *vma, int numpgs)
 	if (pages == NULL)
 		return -ENOMEM;
 
-	rc = alloc_xenballooned_pages(numpgs, pages);
+	rc = xen_alloc_unpopulated_pages(numpgs, pages);
 	if (rc != 0) {
 		pr_warn("%s Could not alloc %d pfns rc:%d\n", __func__,
 			numpgs, rc);
@@ -900,7 +900,7 @@ static void privcmd_close(struct vm_area_struct *vma)
 
 	rc = xen_unmap_domain_gfn_range(vma, numgfns, pages);
 	if (rc == 0)
-		free_xenballooned_pages(numpgs, pages);
+		xen_free_unpopulated_pages(numpgs, pages);
 	else
 		pr_crit("unable to unmap MFN range: leaking %d pages. rc=%d\n",
 			numpgs, rc);
diff --git a/drivers/xen/unpopulated-alloc.c b/drivers/xen/unpopulated-alloc.c
new file mode 100644
index 000000000000..aaa91cefbbf9
--- /dev/null
+++ b/drivers/xen/unpopulated-alloc.c
@@ -0,0 +1,222 @@
+/*
+ * Helpers to allocate unpopulated memory for foreign mappings
+ *
+ * Copyright (c) 2020, Citrix Systems R&D
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License version 2
+ * as published by the Free Software Foundation; or, when distributed
+ * separately from the Linux kernel or incorporated into other
+ * software packages, subject to the following license:
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this source file (the "Software"), to deal in the Software without
+ * restriction, including without limitation the rights to use, copy, modify,
+ * merge, publish, distribute, sublicense, and/or sell copies of the Software,
+ * and to permit persons to whom the Software is furnished to do so, subject to
+ * the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ */
+
+#include <linux/errno.h>
+#include <linux/gfp.h>
+#include <linux/kernel.h>
+#include <linux/mm.h>
+#include <linux/memremap.h>
+#include <linux/slab.h>
+
+#include <asm/page.h>
+
+#include <xen/page.h>
+#include <xen/xen.h>
+
+static DEFINE_MUTEX(lock);
+static LIST_HEAD(list);
+static unsigned int count;
+
+static int fill(unsigned int nr_pages)
+{
+	struct dev_pagemap *pgmap;
+	void *vaddr;
+	unsigned int i, alloc_pages = round_up(nr_pages, PAGES_PER_SECTION);
+	int nid, ret;
+
+	pgmap = kzalloc(sizeof(*pgmap), GFP_KERNEL);
+	if (!pgmap)
+		return -ENOMEM;
+
+	pgmap->type = MEMORY_DEVICE_DEVDAX;
+	pgmap->res.name = "XEN SCRATCH";
+	pgmap->res.flags = IORESOURCE_MEM | IORESOURCE_BUSY;
+
+	ret = allocate_resource(&iomem_resource, &pgmap->res,
+				alloc_pages * PAGE_SIZE, 0, -1,
+				PAGES_PER_SECTION * PAGE_SIZE, NULL, NULL);
+	if (ret < 0) {
+		pr_err("Cannot allocate new IOMEM resource\n");
+		kfree(pgmap);
+		return ret;
+	}
+
+	nid = memory_add_physaddr_to_nid(pgmap->res.start);
+
+#ifdef CONFIG_XEN_HAVE_PVMMU
+	/*
+	 * We don't support PV MMU when Linux and Xen is using
+	 * different page granularity.
+	 */
+	BUILD_BUG_ON(XEN_PAGE_SIZE != PAGE_SIZE);
+
+        /*
+         * memremap will build page tables for the new memory so
+         * the p2m must contain invalid entries so the correct
+         * non-present PTEs will be written.
+         *
+         * If a failure occurs, the original (identity) p2m entries
+         * are not restored since this region is now known not to
+         * conflict with any devices.
+         */
+	if (!xen_feature(XENFEAT_auto_translated_physmap)) {
+		xen_pfn_t pfn = PFN_DOWN(pgmap->res.start);
+
+		for (i = 0; i < alloc_pages; i++) {
+			if (!set_phys_to_machine(pfn + i, INVALID_P2M_ENTRY)) {
+				pr_warn("set_phys_to_machine() failed, no memory added\n");
+				release_resource(&pgmap->res);
+				kfree(pgmap);
+				return -ENOMEM;
+			}
+                }
+	}
+#endif
+
+	vaddr = memremap_pages(pgmap, nid);
+	if (IS_ERR(vaddr)) {
+		pr_err("Cannot remap memory range\n");
+		release_resource(&pgmap->res);
+		kfree(pgmap);
+		return PTR_ERR(vaddr);
+	}
+
+	for (i = 0; i < alloc_pages; i++) {
+		struct page *pg = virt_to_page(vaddr + PAGE_SIZE * i);
+
+		BUG_ON(!virt_addr_valid(vaddr + PAGE_SIZE * i));
+		list_add(&pg->lru, &list);
+		count++;
+	}
+
+	return 0;
+}
+
+/**
+ * xen_alloc_unpopulated_pages - alloc unpopulated pages
+ * @nr_pages: Number of pages
+ * @pages: pages returned
+ * @return 0 on success, error otherwise
+ */
+int xen_alloc_unpopulated_pages(unsigned int nr_pages, struct page **pages)
+{
+	unsigned int i;
+	int ret = 0;
+
+	mutex_lock(&lock);
+	if (count < nr_pages) {
+		ret = fill(nr_pages);
+		if (ret)
+			goto out;
+	}
+
+	for (i = 0; i < nr_pages; i++) {
+		struct page *pg = list_first_entry_or_null(&list, struct page,
+							   lru);
+
+		BUG_ON(!pg);
+		list_del(&pg->lru);
+		count--;
+		pages[i] = pg;
+
+#ifdef CONFIG_XEN_HAVE_PVMMU
+		/*
+		 * We don't support PV MMU when Linux and Xen is using
+		 * different page granularity.
+		 */
+		BUILD_BUG_ON(XEN_PAGE_SIZE != PAGE_SIZE);
+
+		if (!xen_feature(XENFEAT_auto_translated_physmap)) {
+			ret = xen_alloc_p2m_entry(page_to_pfn(pg));
+			if (ret < 0) {
+				unsigned int j;
+
+				for (j = 0; j <= i; j++) {
+					list_add(&pages[j]->lru, &list);
+					count++;
+				}
+				goto out;
+			}
+		}
+#endif
+	}
+
+out:
+	mutex_unlock(&lock);
+	return ret;
+}
+EXPORT_SYMBOL(xen_alloc_unpopulated_pages);
+
+/**
+ * xen_free_unpopulated_pages - return unpopulated pages
+ * @nr_pages: Number of pages
+ * @pages: pages to return
+ */
+void xen_free_unpopulated_pages(unsigned int nr_pages, struct page **pages)
+{
+	unsigned int i;
+
+	mutex_lock(&lock);
+	for (i = 0; i < nr_pages; i++) {
+		list_add(&pages[i]->lru, &list);
+		count++;
+	}
+	mutex_unlock(&lock);
+}
+EXPORT_SYMBOL(xen_free_unpopulated_pages);
+
+#ifdef CONFIG_XEN_PV
+static int __init init(void)
+{
+	unsigned int i;
+
+	if (!xen_domain())
+		return -ENODEV;
+
+	/*
+	 * Initialize with pages from the extra memory regions (see
+	 * arch/x86/xen/setup.c).
+	 */
+	for (i = 0; i < XEN_EXTRA_MEM_MAX_REGIONS; i++) {
+		unsigned int j;
+
+		for (j = 0; j < xen_extra_mem[i].n_pfns; j++) {
+			struct page *pg =
+				pfn_to_page(xen_extra_mem[i].start_pfn + j);
+
+			list_add(&pg->lru, &list);
+			count++;
+		}
+	}
+
+	return 0;
+}
+subsys_initcall(init);
+#endif
diff --git a/drivers/xen/xenbus/xenbus_client.c b/drivers/xen/xenbus/xenbus_client.c
index 786fbb7d8be0..70b6c4780fbd 100644
--- a/drivers/xen/xenbus/xenbus_client.c
+++ b/drivers/xen/xenbus/xenbus_client.c
@@ -615,7 +615,7 @@ static int xenbus_map_ring_hvm(struct xenbus_device *dev,
 	bool leaked = false;
 	unsigned int nr_pages = XENBUS_PAGES(nr_grefs);
 
-	err = alloc_xenballooned_pages(nr_pages, node->hvm.pages);
+	err = xen_alloc_unpopulated_pages(nr_pages, node->hvm.pages);
 	if (err)
 		goto out_err;
 
@@ -656,7 +656,7 @@ static int xenbus_map_ring_hvm(struct xenbus_device *dev,
 			 addr, nr_pages);
  out_free_ballooned_pages:
 	if (!leaked)
-		free_xenballooned_pages(nr_pages, node->hvm.pages);
+		xen_free_unpopulated_pages(nr_pages, node->hvm.pages);
  out_err:
 	return err;
 }
@@ -852,7 +852,7 @@ static int xenbus_unmap_ring_hvm(struct xenbus_device *dev, void *vaddr)
 			       info.addrs);
 	if (!rv) {
 		vunmap(vaddr);
-		free_xenballooned_pages(nr_pages, node->hvm.pages);
+		xen_free_unpopulated_pages(nr_pages, node->hvm.pages);
 	}
 	else
 		WARN(1, "Leaking %p, size %u page(s)\n", vaddr, nr_pages);
diff --git a/drivers/xen/xlate_mmu.c b/drivers/xen/xlate_mmu.c
index 7b1077f0abcb..34742c6e189e 100644
--- a/drivers/xen/xlate_mmu.c
+++ b/drivers/xen/xlate_mmu.c
@@ -232,7 +232,7 @@ int __init xen_xlate_map_ballooned_pages(xen_pfn_t **gfns, void **virt,
 		kfree(pages);
 		return -ENOMEM;
 	}
-	rc = alloc_xenballooned_pages(nr_pages, pages);
+	rc = xen_alloc_unpopulated_pages(nr_pages, pages);
 	if (rc) {
 		pr_warn("%s Couldn't balloon alloc %ld pages rc:%d\n", __func__,
 			nr_pages, rc);
@@ -249,7 +249,7 @@ int __init xen_xlate_map_ballooned_pages(xen_pfn_t **gfns, void **virt,
 	if (!vaddr) {
 		pr_warn("%s Couldn't map %ld pages rc:%d\n", __func__,
 			nr_pages, rc);
-		free_xenballooned_pages(nr_pages, pages);
+		xen_free_unpopulated_pages(nr_pages, pages);
 		kfree(pages);
 		kfree(pfns);
 		return -ENOMEM;
diff --git a/include/xen/xen.h b/include/xen/xen.h
index 19a72f591e2b..aa33bc0d933c 100644
--- a/include/xen/xen.h
+++ b/include/xen/xen.h
@@ -52,4 +52,12 @@ bool xen_biovec_phys_mergeable(const struct bio_vec *vec1,
 extern u64 xen_saved_max_mem_size;
 #endif
 
+#ifdef CONFIG_ZONE_DEVICE
+int xen_alloc_unpopulated_pages(unsigned int nr_pages, struct page **pages);
+void xen_free_unpopulated_pages(unsigned int nr_pages, struct page **pages);
+#else
+#define xen_alloc_unpopulated_pages alloc_xenballooned_pages
+#define xen_free_unpopulated_pages free_xenballooned_pages
+#endif
+
 #endif	/* _XEN_XEN_H */
-- 
2.27.0


