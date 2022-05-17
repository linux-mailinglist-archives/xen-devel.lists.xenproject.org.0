Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7888052A9E7
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 20:05:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331382.554898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nr1Yh-0004kP-Mw; Tue, 17 May 2022 18:04:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331382.554898; Tue, 17 May 2022 18:04:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nr1Yh-0004hx-FI; Tue, 17 May 2022 18:04:35 +0000
Received: by outflank-mailman (input) for mailman id 331382;
 Tue, 17 May 2022 18:04:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KpkB=VZ=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nr1Yf-0004Vy-M8
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 18:04:33 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd7906a0-d60b-11ec-bd2c-47488cf2e6aa;
 Tue, 17 May 2022 20:04:32 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 p5-20020a1c2905000000b003970dd5404dso1694971wmp.0
 for <xen-devel@lists.xenproject.org>; Tue, 17 May 2022 11:04:32 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 c3-20020adfc6c3000000b0020c5253d8dasm12978625wrh.38.2022.05.17.11.04.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 17 May 2022 11:04:30 -0700 (PDT)
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
X-Inumbo-ID: cd7906a0-d60b-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=feA34fPwxNphtEeiKXjdqUR+G6zWJkwwZL1pSvCtX0M=;
        b=R9tybJsPD2LXpfmErzHoPXBX5wnEtfuDO/IJAB6QCSqRFyn0tmpyLs+kAw80+IaSbH
         pjiCvnnNRDCffcM9mu3d1ood+LURdpWIFg78PL2VKrwl9A2+kkifa3UGVHKprWGRSwfX
         aJuwVKVPiDt2NhFn2R/zUgVFXVPxPu4aYOjQvc7E2AUAJqRj+Rs9KT9EU49neFZttysM
         434/nYP+gHYgcCFdpQy9EGyZuPKMjwt5uUgjwQHcsN+Xtuwf7j0WR+K35KIBX1GDPKNH
         QtuU5Tp2Hk/cePtJTq5KyBfyFVkEn7SMd5tpbIGwcJuVggfFrSFTTvHd6Oa2KpyhqP4k
         erTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=feA34fPwxNphtEeiKXjdqUR+G6zWJkwwZL1pSvCtX0M=;
        b=XKHENItP3pTvFq5JTg+BtK44LJVPW/PWdHfXwUrGsVryr/4lNjUnyzLgFjwJftPHOj
         bLfPDruWmkX+xtJM2BrBFd6yhr1flCJdzzqENQUYXGaBZMVAjaiJe7Us6/ggsxz/VXe5
         kmnhNBezpFB8bXh4aSSsElWEBlaGIixecTbE+5GIEl7uUXgJpkj9Iv8V9qvvmMORiBSr
         lMOC8P0BUtCsAdp0/GyW+jP0HPpHPcx0LUASyLxBvBr+pGJ4onrBPS8Khoz9tVXZALf0
         urZgFnVP5qDY3eht5FvIqh6ANjJj9773prWO+Lc98pqqEQLv2rahQYryZSgpGDd/bp62
         AMww==
X-Gm-Message-State: AOAM533xYGTVWCdQ119T1nIxD9RSJewXHQYyrSTYWEydz65AjwMFcILJ
	Uw8kkW3BHb/JXl71uyLzkpUPSfgfLkw=
X-Google-Smtp-Source: ABdhPJz7TB36wEMhYWeFrz4ToySZ+jaRfOo1ZPZFJbivzuABi6OYRgg8cTziB7YMzVs5jZu3iWnS7Q==
X-Received: by 2002:a1c:4c06:0:b0:394:65c4:bd03 with SMTP id z6-20020a1c4c06000000b0039465c4bd03mr22488549wmf.8.1652810671355;
        Tue, 17 May 2022 11:04:31 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>
Subject: [RFC PATCH 1/2] xen/unpopulated-alloc: Introduce helpers for DMA allocations
Date: Tue, 17 May 2022 21:04:17 +0300
Message-Id: <1652810658-27810-2-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1652810658-27810-1-git-send-email-olekstysh@gmail.com>
References: <1652810658-27810-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Add ability to allocate unpopulated DMAable (contiguous) pages
suitable for grant mapping into. This is going to be used by gnttab
code (see gnttab_dma_alloc_pages()).

TODO: There is a code duplication in fill_dma_pool(). Also pool
oparations likely need to be protected by the lock.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
 drivers/xen/unpopulated-alloc.c | 167 ++++++++++++++++++++++++++++++++++++++++
 include/xen/xen.h               |  15 ++++
 2 files changed, 182 insertions(+)

diff --git a/drivers/xen/unpopulated-alloc.c b/drivers/xen/unpopulated-alloc.c
index a39f2d3..bca0198 100644
--- a/drivers/xen/unpopulated-alloc.c
+++ b/drivers/xen/unpopulated-alloc.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <linux/errno.h>
+#include <linux/genalloc.h>
 #include <linux/gfp.h>
 #include <linux/kernel.h>
 #include <linux/mm.h>
@@ -16,6 +17,8 @@ static DEFINE_MUTEX(list_lock);
 static struct page *page_list;
 static unsigned int list_count;
 
+static struct gen_pool *dma_pool;
+
 static struct resource *target_resource;
 
 /*
@@ -230,6 +233,161 @@ void xen_free_unpopulated_pages(unsigned int nr_pages, struct page **pages)
 }
 EXPORT_SYMBOL(xen_free_unpopulated_pages);
 
+static int fill_dma_pool(unsigned int nr_pages)
+{
+	struct dev_pagemap *pgmap;
+	struct resource *res, *tmp_res = NULL;
+	void *vaddr;
+	unsigned int alloc_pages = round_up(nr_pages, PAGES_PER_SECTION);
+	struct range mhp_range;
+	int ret;
+
+	res = kzalloc(sizeof(*res), GFP_KERNEL);
+	if (!res)
+		return -ENOMEM;
+
+	res->name = "Xen DMA pool";
+	res->flags = IORESOURCE_MEM | IORESOURCE_BUSY;
+
+	mhp_range = mhp_get_pluggable_range(true);
+
+	ret = allocate_resource(target_resource, res,
+				alloc_pages * PAGE_SIZE, mhp_range.start, mhp_range.end,
+				PAGES_PER_SECTION * PAGE_SIZE, NULL, NULL);
+	if (ret < 0) {
+		pr_err("Cannot allocate new IOMEM resource\n");
+		goto err_resource;
+	}
+
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
+		ret = request_resource(&iomem_resource, tmp_res);
+		if (ret < 0) {
+			pr_err("Cannot request resource %pR (%d)\n", tmp_res, ret);
+			kfree(tmp_res);
+			goto err_insert;
+		}
+	}
+
+	pgmap = kzalloc(sizeof(*pgmap), GFP_KERNEL);
+	if (!pgmap) {
+		ret = -ENOMEM;
+		goto err_pgmap;
+	}
+
+	pgmap->type = MEMORY_DEVICE_GENERIC;
+	pgmap->range = (struct range) {
+		.start = res->start,
+		.end = res->end,
+	};
+	pgmap->nr_range = 1;
+	pgmap->owner = res;
+
+	vaddr = memremap_pages(pgmap, NUMA_NO_NODE);
+	if (IS_ERR(vaddr)) {
+		pr_err("Cannot remap memory range\n");
+		ret = PTR_ERR(vaddr);
+		goto err_memremap;
+	}
+
+	ret = gen_pool_add_virt(dma_pool, (unsigned long)vaddr, res->start,
+			alloc_pages * PAGE_SIZE, NUMA_NO_NODE);
+	if (ret)
+		goto err_pool;
+
+	return 0;
+
+err_pool:
+	memunmap_pages(pgmap);
+err_memremap:
+	kfree(pgmap);
+err_pgmap:
+	if (tmp_res) {
+		release_resource(tmp_res);
+		kfree(tmp_res);
+	}
+err_insert:
+	release_resource(res);
+err_resource:
+	kfree(res);
+	return ret;
+}
+
+/**
+ * xen_alloc_unpopulated_dma_pages - alloc unpopulated DMAable pages
+ * @dev: valid struct device pointer
+ * @nr_pages: Number of pages
+ * @pages: pages returned
+ * @return 0 on success, error otherwise
+ */
+int xen_alloc_unpopulated_dma_pages(struct device *dev, unsigned int nr_pages,
+		struct page **pages)
+{
+	void *vaddr;
+	bool filled = false;
+	unsigned int i;
+	int ret;
+
+	if (!dma_pool)
+		return -ENODEV;
+
+	/* XXX Handle devices which support 64-bit DMA address only for now */
+	if (dma_get_mask(dev) != DMA_BIT_MASK(64))
+		return -EINVAL;
+
+	while (!(vaddr = (void *)gen_pool_alloc(dma_pool, nr_pages * PAGE_SIZE))) {
+		if (filled)
+			return -ENOMEM;
+		else {
+			ret = fill_dma_pool(nr_pages);
+			if (ret)
+				return ret;
+
+			filled = true;
+		}
+	}
+
+	for (i = 0; i < nr_pages; i++)
+		pages[i] = virt_to_page(vaddr + PAGE_SIZE * i);
+
+	return 0;
+}
+EXPORT_SYMBOL(xen_alloc_unpopulated_dma_pages);
+
+/**
+ * xen_free_unpopulated_dma_pages - return unpopulated DMAable pages
+ * @dev: valid struct device pointer
+ * @nr_pages: Number of pages
+ * @pages: pages to return
+ */
+void xen_free_unpopulated_dma_pages(struct device *dev, unsigned int nr_pages,
+		struct page **pages)
+{
+	void *vaddr;
+
+	if (!dma_pool)
+		return;
+
+	vaddr = page_to_virt(pages[0]);
+
+	gen_pool_free(dma_pool, (unsigned long)vaddr, nr_pages * PAGE_SIZE);
+}
+EXPORT_SYMBOL(xen_free_unpopulated_dma_pages);
+
 static int __init unpopulated_init(void)
 {
 	int ret;
@@ -241,8 +399,17 @@ static int __init unpopulated_init(void)
 	if (ret) {
 		pr_err("xen:unpopulated: Cannot initialize target resource\n");
 		target_resource = NULL;
+		return ret;
 	}
 
+	dma_pool = gen_pool_create(PAGE_SHIFT, NUMA_NO_NODE);
+	if (!dma_pool) {
+		pr_err("xen:unpopulated: Cannot create DMA pool\n");
+		return -ENOMEM;
+	}
+
+	gen_pool_set_algo(dma_pool, gen_pool_best_fit, NULL);
+
 	return ret;
 }
 early_initcall(unpopulated_init);
diff --git a/include/xen/xen.h b/include/xen/xen.h
index a99bab8..a6a7a59 100644
--- a/include/xen/xen.h
+++ b/include/xen/xen.h
@@ -52,9 +52,15 @@ bool xen_biovec_phys_mergeable(const struct bio_vec *vec1,
 extern u64 xen_saved_max_mem_size;
 #endif
 
+struct device;
+
 #ifdef CONFIG_XEN_UNPOPULATED_ALLOC
 int xen_alloc_unpopulated_pages(unsigned int nr_pages, struct page **pages);
 void xen_free_unpopulated_pages(unsigned int nr_pages, struct page **pages);
+int xen_alloc_unpopulated_dma_pages(struct device *dev, unsigned int nr_pages,
+		struct page **pages);
+void xen_free_unpopulated_dma_pages(struct device *dev, unsigned int nr_pages,
+		struct page **pages);
 #include <linux/ioport.h>
 int arch_xen_unpopulated_init(struct resource **res);
 #else
@@ -69,6 +75,15 @@ static inline void xen_free_unpopulated_pages(unsigned int nr_pages,
 {
 	xen_free_ballooned_pages(nr_pages, pages);
 }
+static inline int xen_alloc_unpopulated_dma_pages(struct device *dev,
+		unsigned int nr_pages, struct page **pages)
+{
+	return -1;
+}
+static inline void xen_free_unpopulated_dma_pages(struct device *dev,
+		unsigned int nr_pages, struct page **pages)
+{
+}
 #endif
 
 #endif	/* _XEN_XEN_H */
-- 
2.7.4


