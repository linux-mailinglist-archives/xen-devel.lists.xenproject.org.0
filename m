Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 273013D9367
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jul 2021 18:44:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.161736.296826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8mfP-0008KY-Js; Wed, 28 Jul 2021 16:44:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161736.296826; Wed, 28 Jul 2021 16:44:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8mfP-0008I6-GP; Wed, 28 Jul 2021 16:44:23 +0000
Received: by outflank-mailman (input) for mailman id 161736;
 Wed, 28 Jul 2021 16:44:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tdfR=MU=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1m8mfO-0008I0-1Q
 for xen-devel@lists.xenproject.org; Wed, 28 Jul 2021 16:44:22 +0000
Received: from mail-lf1-x12a.google.com (unknown [2a00:1450:4864:20::12a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 15d1b7fb-43fe-440f-a3a3-64c41c8e4ef2;
 Wed, 28 Jul 2021 16:44:20 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id a26so5089591lfr.11
 for <xen-devel@lists.xenproject.org>; Wed, 28 Jul 2021 09:44:20 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id r200sm45673lff.208.2021.07.28.09.44.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Jul 2021 09:44:18 -0700 (PDT)
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
X-Inumbo-ID: 15d1b7fb-43fe-440f-a3a3-64c41c8e4ef2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=KhGe66mH1C8SgD0PmxdZ1hQPjbpO/mlMpncwwJDf0+s=;
        b=PrEhdIol9ZVCwfjLO+T24RAJsIvKBuL/LjmIUe01PSA0pEadP1xwiPPufhtAndieW/
         o9P8WvwEQO+oEua9nl8gncCjKGXisvA0jDHnSRtJ1ZjNPgry4TirFpXp1F5TQjM25HaK
         6cA5KuRqk7LWG4WceE51Uf1yT0tJiqdvcpekg0FdONU7GCzIzqx2GCPwWJuFOv0AHkRD
         NZT/1b+FPpWkV55T0uUTvNaXcUOCC9RPUjNQXkZlPDncB7JLQWhxxc28SEDGL1WVCIy0
         DNsg9rt7mhHe0XbE+2ZVNiEXSG/YwZUpLEaW0WTNmdxYVOUmA5cITX9eFZxtofqZJTUT
         IAmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=KhGe66mH1C8SgD0PmxdZ1hQPjbpO/mlMpncwwJDf0+s=;
        b=RK9SLykF323Au9W/X515NSB3b9vapBKHaqcFHqTPldVWsYAlmbZ7GN3lQgrWhoiCR8
         z0GgPhqL6p+XRJ3UtyW+wjSty+fYAfLFliEBno27VBgxExNI5LnZSjcMyFNRsCebnNr3
         bI1dHSYUQjMh7DbR+NI5u2qao+p1hxKk8oDwrhvbFXz67WFB2Kp7d68alpcFHjguv50e
         /Y5IR0I9tuOmkkkqTR16Y8aRZ+HaW9K/rja76k7qVROARymBlCNcMHx+1Rh73uN6z7wG
         FrKdLgwYTzV908Hr+RoRe5PTCeS+mucw5p/rASBzAxKi+dbtlcrVsLrC0mml6hAG1vIQ
         EZYg==
X-Gm-Message-State: AOAM533vsvnyBiVkKkuLOYzC3u8fbKQ5r3BTIErWTzLVektOzoVuJurp
	Ag/SHT1SbqtrQDC9bFVh25o=
X-Google-Smtp-Source: ABdhPJzX9eIMuK2QbEFtzfMJ/58kozDZ7Dk8Sfa4eT982nHkyAEpSJ94DDuDQBhHzdzb3VbWAsa2Fg==
X-Received: by 2002:a05:6512:20c1:: with SMTP id u1mr361060lfr.35.1627490658896;
        Wed, 28 Jul 2021 09:44:18 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Russell King <linux@armlinux.org.uk>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Wei Chen <Wei.Chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [RFC PATCH 2/2] xen/unpopulated-alloc: Query hypervisor to provide unallocated space
Date: Wed, 28 Jul 2021 19:44:16 +0300
Message-Id: <1627490656-1267-2-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1627490656-1267-1-git-send-email-olekstysh@gmail.com>
References: <1627490656-1267-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Add a logic to query hypervisor to find regions of guest physical
address space which are unused and can be safely used to create
grant/foreign mappings. Without that the XEN_UNPOPULATED_ALLOC
feature can't be used on Arm.

Introduce new helper arch_xen_unpopulated_init_resource() which
purpose is to create specific Xen resource based on the unused
memory regions provided by the hypervisor to be used as unallocated
address space for Xen scratch pages.
Re-use new XENMEM_get_unallocated_space hypercall on Arm to query
for the unallocated space. In case if arch doesn't offer Xen resource
the default IOMEM resource will be used in fill_list(). Since this
patch only implements Arm part, the behavior on x86 won't be changed.

The "unallocated space" can't be figured out precisely by
the domain on Arm without hypervisor involvement:
- not all device I/O regions are known by the time domain starts
  creating grant/foreign mappings
- the Dom0 is not aware of memory regions used for the identity
  mappings needed for the PV drivers to work
In both cases we might end up re-using these regions by
a mistake. So, the hypervisor which maintains the P2M for the domain
is in the best position to provide "unallocated space".

This patch also removes XEN_UNPOPULATED_ALLOC dependency on x86.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
TODO: Likely we would need to fall back to alloc_xenballooned_pages
if xen_alloc_unpopulated_pages fails on Arm, to be able to run
old hypervisor (without unallocated space support), but the next
question would be how to implement such "fallback" properly?

The corresponding Xen changes you can find at:
https://lore.kernel.org/xen-devel/1627489110-25633-1-git-send-email-olekstysh@gmail.com/
---
 arch/arm/xen/enlighten.c        | 94 +++++++++++++++++++++++++++++++++++++++++
 drivers/xen/Kconfig             |  2 +-
 drivers/xen/unpopulated-alloc.c | 62 +++++++++++++++++++++++++--
 include/xen/interface/memory.h  | 33 +++++++++++++++
 include/xen/xen.h               |  2 +
 5 files changed, 189 insertions(+), 4 deletions(-)

diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
index 7f1c106b..838696d 100644
--- a/arch/arm/xen/enlighten.c
+++ b/arch/arm/xen/enlighten.c
@@ -300,6 +300,100 @@ static void __init xen_acpi_guest_init(void)
 #endif
 }
 
+#ifdef CONFIG_XEN_UNPOPULATED_ALLOC
+int arch_xen_unpopulated_init_resource(struct resource *res)
+{
+	struct xen_get_unallocated_space xgus;
+	struct xen_unallocated_region *regions;
+	xen_pfn_t min_gpfn = -1, max_gpfn = 0;
+	unsigned int i, nr_regions;
+	struct resource *tmp_res;
+	int rc;
+
+	if (!xen_domain())
+		return -ENODEV;
+
+	/* Query hypervisor to find as many unused memory regions as possible */
+	nr_regions = XEN_MAX_UNALLOCATED_REGIONS;
+	regions = kcalloc(nr_regions, sizeof(regions[0]), GFP_KERNEL);
+	if (!regions)
+		return -ENOMEM;
+
+	xgus.domid = DOMID_SELF;
+	xgus.nr_regions = nr_regions;
+	set_xen_guest_handle(xgus.buffer, regions);
+
+	rc = HYPERVISOR_memory_op(XENMEM_get_unallocated_space, &xgus);
+	if (rc) {
+		pr_warn("XENMEM_get_unallocated_space failed, err=%d\n", rc);
+		goto err;
+	}
+
+	if (WARN_ON(xgus.nr_regions == 0)) {
+		rc = -EINVAL;
+		goto err;
+	}
+	nr_regions = xgus.nr_regions;
+
+	/*
+	 * Create resource from memory regions provided by the hypervisor to be
+	 * used as unallocated address space for Xen scratch pages.
+	 */
+	for (i = 0; i < nr_regions; i++) {
+		if (max_gpfn < regions[i].start_gpfn + regions[i].nr_gpfns)
+			max_gpfn = regions[i].start_gpfn + regions[i].nr_gpfns;
+		if (min_gpfn > regions[i].start_gpfn)
+			min_gpfn = regions[i].start_gpfn;
+	}
+	res->start = min_gpfn << PAGE_SHIFT;
+	res->end = (max_gpfn << PAGE_SHIFT) - 1;
+
+	/*
+	 * As memory regions are not necessarily completely sequential calculate
+	 * and reserve the possible holes. The rest of that address space will be
+	 * available for the allocation.
+	 */
+	for (i = 1; i < nr_regions; i++) {
+		resource_size_t start, end;
+
+		start = (regions[i - 1].start_gpfn << PAGE_SHIFT) +
+				regions[i - 1].nr_gpfns * PAGE_SIZE;
+		end = regions[i].start_gpfn << PAGE_SHIFT;
+
+		if (WARN_ON(start > end)) {
+			rc = -EINVAL;
+			goto err;
+		}
+
+		if (start == end)
+			continue;
+
+		tmp_res = kzalloc(sizeof(*tmp_res), GFP_KERNEL);
+		if (!tmp_res) {
+			rc = -ENOMEM;
+			goto err;
+		}
+
+		tmp_res->name = "Unavailable space";
+		tmp_res->start = start;
+		tmp_res->end = end - 1;
+
+		rc = request_resource(res, tmp_res);
+		if (rc) {
+			pr_err("Cannot insert IOMEM resource [%llx - %llx]\n",
+			       tmp_res->start, tmp_res->end);
+			kfree(tmp_res);
+			goto err;
+		}
+	}
+
+err:
+	kfree(regions);
+
+	return rc;
+}
+#endif
+
 static void __init xen_dt_guest_init(void)
 {
 	struct device_node *xen_node;
diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
index 5f1ce59..86aa1ab 100644
--- a/drivers/xen/Kconfig
+++ b/drivers/xen/Kconfig
@@ -296,7 +296,7 @@ config XEN_FRONT_PGDIR_SHBUF
 
 config XEN_UNPOPULATED_ALLOC
 	bool "Use unpopulated memory ranges for guest mappings"
-	depends on X86 && ZONE_DEVICE
+	depends on ZONE_DEVICE
 	default XEN_BACKEND || XEN_GNTDEV || XEN_DOM0
 	help
 	  Use unpopulated memory ranges in order to create mappings for guest
diff --git a/drivers/xen/unpopulated-alloc.c b/drivers/xen/unpopulated-alloc.c
index 87e6b7d..ebf7d23 100644
--- a/drivers/xen/unpopulated-alloc.c
+++ b/drivers/xen/unpopulated-alloc.c
@@ -15,13 +15,39 @@ static DEFINE_MUTEX(list_lock);
 static struct page *page_list;
 static unsigned int list_count;
 
+static struct resource *target_resource;
+static struct resource xen_resource = {
+	.name = "Xen unallocated space",
+};
+
+int __weak arch_xen_unpopulated_init_resource(struct resource *res)
+{
+	return -ENOSYS;
+}
+
 static int fill_list(unsigned int nr_pages)
 {
 	struct dev_pagemap *pgmap;
-	struct resource *res;
+	struct resource *res, *tmp_res = NULL;
 	void *vaddr;
 	unsigned int i, alloc_pages = round_up(nr_pages, PAGES_PER_SECTION);
-	int ret = -ENOMEM;
+	int ret;
+
+	/*
+	 * Try to use Xen resource the first and fall back to default resource
+	 * if arch doesn't offer one.
+	 */
+	if (!target_resource) {
+		ret = arch_xen_unpopulated_init_resource(&xen_resource);
+		if (!ret) {
+			target_resource = &xen_resource;
+		} else if (ret == -ENOSYS) {
+			target_resource = &iomem_resource;
+		} else {
+			pr_err("Cannot initialize Xen resource\n");
+			return ret;
+		}
+	}
 
 	res = kzalloc(sizeof(*res), GFP_KERNEL);
 	if (!res)
@@ -30,7 +56,7 @@ static int fill_list(unsigned int nr_pages)
 	res->name = "Xen scratch";
 	res->flags = IORESOURCE_MEM | IORESOURCE_BUSY;
 
-	ret = allocate_resource(&iomem_resource, res,
+	ret = allocate_resource(target_resource, res,
 				alloc_pages * PAGE_SIZE, 0, -1,
 				PAGES_PER_SECTION * PAGE_SIZE, NULL, NULL);
 	if (ret < 0) {
@@ -38,6 +64,31 @@ static int fill_list(unsigned int nr_pages)
 		goto err_resource;
 	}
 
+	/*
+	 * Reserve the region previously allocated from Xen resource to avoid
+	 * re-using it by someone else.
+	 */
+	if (target_resource != &iomem_resource) {
+		tmp_res = kzalloc(sizeof(*tmp_res), GFP_KERNEL);
+		if (!res) {
+			ret = -ENOMEM;
+			goto err_insert;
+		}
+
+		tmp_res->name = res->name;
+		tmp_res->start = res->start;
+		tmp_res->end = res->end;
+		tmp_res->flags = res->flags;
+
+		ret = insert_resource(&iomem_resource, tmp_res);
+		if (ret < 0) {
+			pr_err("Cannot insert IOMEM resource [%llx - %llx]\n",
+			       tmp_res->start, tmp_res->end);
+			kfree(tmp_res);
+			goto err_insert;
+		}
+	}
+
 	pgmap = kzalloc(sizeof(*pgmap), GFP_KERNEL);
 	if (!pgmap) {
 		ret = -ENOMEM;
@@ -96,6 +147,11 @@ static int fill_list(unsigned int nr_pages)
 err_memremap:
 	kfree(pgmap);
 err_pgmap:
+	if (tmp_res) {
+		release_resource(tmp_res);
+		kfree(tmp_res);
+	}
+err_insert:
 	release_resource(res);
 err_resource:
 	kfree(res);
diff --git a/include/xen/interface/memory.h b/include/xen/interface/memory.h
index 4470048..c6a2a63 100644
--- a/include/xen/interface/memory.h
+++ b/include/xen/interface/memory.h
@@ -325,4 +325,37 @@ struct xen_mem_acquire_resource {
 };
 DEFINE_GUEST_HANDLE_STRUCT(xen_mem_acquire_resource);
 
+/*
+ * Get the unallocated space (regions of guest physical address space which
+ * are unused) and can be used to create grant/foreign mappings.
+ */
+#define XENMEM_get_unallocated_space 29
+struct xen_unallocated_region {
+    xen_pfn_t start_gpfn;
+    xen_ulong_t nr_gpfns;
+};
+DEFINE_GUEST_HANDLE_STRUCT(xen_unallocated_region);
+
+#define XEN_MAX_UNALLOCATED_REGIONS 32
+
+struct xen_get_unallocated_space {
+    /* IN - Which domain to provide unallocated space for */
+    domid_t domid;
+
+    /*
+     * IN/OUT - As an IN parameter number of memory regions which
+     *          can be written to the buffer (maximum size of the array)
+     *          As OUT parameter number of memory regions which
+     *          have been written to the buffer
+     */
+    unsigned int nr_regions;
+
+    /*
+     * OUT - An array of memory regions, the regions must be placed in
+     *       ascending order, there must be no overlap between them.
+     */
+    GUEST_HANDLE(xen_unallocated_region) buffer;
+};
+DEFINE_GUEST_HANDLE_STRUCT(xen_get_unallocated_space);
+
 #endif /* __XEN_PUBLIC_MEMORY_H__ */
diff --git a/include/xen/xen.h b/include/xen/xen.h
index 43efba0..f623905 100644
--- a/include/xen/xen.h
+++ b/include/xen/xen.h
@@ -55,6 +55,8 @@ extern u64 xen_saved_max_mem_size;
 #ifdef CONFIG_XEN_UNPOPULATED_ALLOC
 int xen_alloc_unpopulated_pages(unsigned int nr_pages, struct page **pages);
 void xen_free_unpopulated_pages(unsigned int nr_pages, struct page **pages);
+struct resource;
+int arch_xen_unpopulated_init_resource(struct resource *res);
 #else
 #define xen_alloc_unpopulated_pages alloc_xenballooned_pages
 #define xen_free_unpopulated_pages free_xenballooned_pages
-- 
2.7.4


