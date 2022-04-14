Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C711501BB2
	for <lists+xen-devel@lfdr.de>; Thu, 14 Apr 2022 21:20:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.305049.519894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nf50L-0005z6-W9; Thu, 14 Apr 2022 19:19:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 305049.519894; Thu, 14 Apr 2022 19:19:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nf50L-0005v5-NB; Thu, 14 Apr 2022 19:19:45 +0000
Received: by outflank-mailman (input) for mailman id 305049;
 Thu, 14 Apr 2022 19:19:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RCiM=UY=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nf50K-00054x-KR
 for xen-devel@lists.xenproject.org; Thu, 14 Apr 2022 19:19:44 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d6d29c6f-bc27-11ec-8fbe-03012f2f19d4;
 Thu, 14 Apr 2022 21:19:43 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id o16so7264762ljp.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 Apr 2022 12:19:43 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a194943000000b0046b928d2795sm85001lfj.67.2022.04.14.12.19.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 14 Apr 2022 12:19:42 -0700 (PDT)
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
X-Inumbo-ID: d6d29c6f-bc27-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HH0lNJhCKrn1KVzcgV/uI3rqOPkxUwMay92nkSrAjww=;
        b=CSmQsWmMPhKn65VWOLhlyWUk/5YwfpW6oHGmDgSr8oyIRtln1bgL/FxXCzwqOQ2scW
         Kul15jhG/xUMsrq9hwxgzV7VZ+jj3hupZRanvoSdnRr8nY+F8D9bVK1bhDZDRzNimT23
         LAh7fUHs+YKWYCqE86acY6uO/YWr6KZAKVBtZxwCRFor0ambo4hAmrApMjmGMTo04/Vx
         omjZqW9FpYwni3wQwXilVmnhhBiTL44fcofN4KwMa0r/naLAzWmPO9D0cVR9OT/QkH7A
         h4d5ucGnzxq/vZwtYADqFA6IbCHPqfZ2O1SM0pyYOBrcVF6qgnYeOnQS+OhyTtG8dwru
         XDgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HH0lNJhCKrn1KVzcgV/uI3rqOPkxUwMay92nkSrAjww=;
        b=C45vKP/KXwWMnkBsnGoT9PkvB8ww3PfQgr0HsOvcUR8+2LI2TRnE/I2ZZtmSw3uBs4
         pzfpUGNjqW584lp93FohXlmcRBiIwSYZRXooztWmRGbNT6LEUT6r6lKJiaaxgHWbmOhX
         TZhxbf66R5j2i1Ok6L57UGLMjQi9xzX4cFdmVDBpP43fn9mi6UGj8hkOmjQNRX8aOuCP
         Hc1S7w6AYeQJ00YaGsfSjuWMXejW2nM0sKOvAHn1HO/FFWr4oIphFs7L5dEgBlTQf+2e
         pVt1V904IdslXAkRbKCrZBcBc8pqSIceJTWkqC7joxKN/ntrt/aY4ncjLdZuqHN2cTfm
         xaHw==
X-Gm-Message-State: AOAM532kWm62D2QwoAqF8ETnuLrkLgLn4WPPibAL5uM+gRlrMTu9aKMm
	5tEKWdcqQfY3o85r/APcaYMWeFWeHX0=
X-Google-Smtp-Source: ABdhPJyqaIJqLPokLPf5w1P1n+RXHoKfPPFHkJ8cRMG0ZDENL1jq4zsAVzAnYaGGBHo3X65+xfsMjQ==
X-Received: by 2002:a2e:9c2:0:b0:24a:c757:b9bb with SMTP id 185-20020a2e09c2000000b0024ac757b9bbmr2493120ljj.360.1649963982965;
        Thu, 14 Apr 2022 12:19:42 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>
Subject: [RFC PATCH 4/6] virtio: Various updates to xen-virtio DMA ops layer
Date: Thu, 14 Apr 2022 22:19:31 +0300
Message-Id: <1649963973-22879-5-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1649963973-22879-1-git-send-email-olekstysh@gmail.com>
References: <1649963973-22879-1-git-send-email-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

In the context of current patch do the following:
1. Update code to support virtio-mmio devices
2. Introduce struct xen_virtio_data and account passed virtio devices
   (using list) as we need to store some per-device data
3. Add multi-page support for xen_virtio_dma_map(unmap)_page callbacks
4. Harden code against malicious backend
5. Change to use alloc_pages_exact() instead of __get_free_pages()
6. Introduce locking scheme to protect mappings (I am not 100% sure
   whether per-device lock is really needed)
7. Handle virtio device's DMA mask
8. Retrieve the ID of backend domain from DT for virtio-mmio device
   instead of hardcoding it.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
 arch/arm/xen/enlighten.c |  11 +++
 drivers/xen/Kconfig      |   2 +-
 drivers/xen/xen-virtio.c | 200 ++++++++++++++++++++++++++++++++++++++++++-----
 include/xen/xen-ops.h    |   5 ++
 4 files changed, 196 insertions(+), 22 deletions(-)

diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
index ec5b082..870d92f 100644
--- a/arch/arm/xen/enlighten.c
+++ b/arch/arm/xen/enlighten.c
@@ -409,6 +409,17 @@ int __init arch_xen_unpopulated_init(struct resource **res)
 }
 #endif
 
+#ifdef CONFIG_ARCH_HAS_RESTRICTED_VIRTIO_MEMORY_ACCESS
+int arch_has_restricted_virtio_memory_access(void)
+{
+	if (IS_ENABLED(CONFIG_XEN_HVM_VIRTIO_GRANT) && xen_hvm_domain())
+		return 1;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(arch_has_restricted_virtio_memory_access);
+#endif
+
 static void __init xen_dt_guest_init(void)
 {
 	struct device_node *xen_node;
diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
index fc61f7a..56afe6a 100644
--- a/drivers/xen/Kconfig
+++ b/drivers/xen/Kconfig
@@ -347,7 +347,7 @@ config XEN_VIRTIO
 
 config XEN_HVM_VIRTIO_GRANT
 	bool "Require virtio for fully virtualized guests to use grant mappings"
-	depends on XEN_VIRTIO && X86_64
+	depends on XEN_VIRTIO && (X86_64 || ARM || ARM64)
 	default y
 	help
 	  Require virtio for fully virtualized guests to use grant mappings.
diff --git a/drivers/xen/xen-virtio.c b/drivers/xen/xen-virtio.c
index cfd5eda..c5b2ec9 100644
--- a/drivers/xen/xen-virtio.c
+++ b/drivers/xen/xen-virtio.c
@@ -7,12 +7,26 @@
 
 #include <linux/module.h>
 #include <linux/dma-map-ops.h>
+#include <linux/of.h>
 #include <linux/pci.h>
 #include <linux/pfn.h>
 #include <linux/virtio_config.h>
 #include <xen/xen.h>
 #include <xen/grant_table.h>
 
+struct xen_virtio_data {
+	/* The ID of backend domain */
+	domid_t dev_domid;
+	struct device *dev;
+	struct list_head list;
+	spinlock_t lock;
+	/* Is device behaving sane? */
+	bool broken;
+};
+
+static LIST_HEAD(xen_virtio_devices);
+static DEFINE_SPINLOCK(xen_virtio_lock);
+
 #define XEN_GRANT_ADDR_OFF	0x8000000000000000ULL
 
 static inline dma_addr_t grant_to_dma(grant_ref_t grant)
@@ -25,6 +39,25 @@ static inline grant_ref_t dma_to_grant(dma_addr_t dma)
 	return (grant_ref_t)((dma & ~XEN_GRANT_ADDR_OFF) >> PAGE_SHIFT);
 }
 
+static struct xen_virtio_data *find_xen_virtio_data(struct device *dev)
+{
+	struct xen_virtio_data *data = NULL;
+	bool found = false;
+
+	spin_lock(&xen_virtio_lock);
+
+	list_for_each_entry( data, &xen_virtio_devices, list) {
+		if (data->dev == dev) {
+			found = true;
+			break;
+		}
+	}
+
+	spin_unlock(&xen_virtio_lock);
+
+	return found ? data : NULL;
+}
+
 /*
  * DMA ops for Xen virtio frontends.
  *
@@ -43,48 +76,78 @@ static void *xen_virtio_dma_alloc(struct device *dev, size_t size,
 				  dma_addr_t *dma_handle, gfp_t gfp,
 				  unsigned long attrs)
 {
-	unsigned int n_pages = PFN_UP(size);
-	unsigned int i;
+	struct xen_virtio_data *data;
+	unsigned int i, n_pages = PFN_UP(size);
 	unsigned long pfn;
 	grant_ref_t grant;
-	void *ret;
+	void *ret = NULL;
 
-	ret = (void *)__get_free_pages(gfp, get_order(size));
-	if (!ret)
+	data = find_xen_virtio_data(dev);
+	if (!data)
 		return NULL;
 
+	spin_lock(&data->lock);
+
+	if (unlikely(data->broken))
+		goto out;
+
+	ret = alloc_pages_exact(n_pages * PAGE_SIZE, gfp);
+	if (!ret)
+		goto out;
+
 	pfn = virt_to_pfn(ret);
 
 	if (gnttab_alloc_grant_reference_seq(n_pages, &grant)) {
-		free_pages((unsigned long)ret, get_order(size));
-		return NULL;
+		free_pages_exact(ret, n_pages * PAGE_SIZE);
+		ret = NULL;
+		goto out;
 	}
 
 	for (i = 0; i < n_pages; i++) {
-		gnttab_grant_foreign_access_ref(grant + i, 0,
+		gnttab_grant_foreign_access_ref(grant + i, data->dev_domid,
 						pfn_to_gfn(pfn + i), 0);
 	}
 
 	*dma_handle = grant_to_dma(grant);
 
+out:
+	spin_unlock(&data->lock);
+
 	return ret;
 }
 
 static void xen_virtio_dma_free(struct device *dev, size_t size, void *vaddr,
 				dma_addr_t dma_handle, unsigned long attrs)
 {
-	unsigned int n_pages = PFN_UP(size);
-	unsigned int i;
+	struct xen_virtio_data *data;
+	unsigned int i, n_pages = PFN_UP(size);
 	grant_ref_t grant;
 
+	data = find_xen_virtio_data(dev);
+	if (!data)
+		return;
+
+	spin_lock(&data->lock);
+
+	if (unlikely(data->broken))
+		goto out;
+
 	grant = dma_to_grant(dma_handle);
 
-	for (i = 0; i < n_pages; i++)
-		gnttab_end_foreign_access_ref(grant + i);
+	for (i = 0; i < n_pages; i++) {
+		if (unlikely(!gnttab_end_foreign_access_ref(grant + i))) {
+			dev_alert(dev, "Grant still in use by backend domain, disabled for further use\n");
+			data->broken = true;
+			goto out;
+		}
+	}
 
 	gnttab_free_grant_reference_seq(grant, n_pages);
 
-	free_pages((unsigned long)vaddr, get_order(size));
+	free_pages_exact(vaddr, n_pages * PAGE_SIZE);
+
+out:
+	spin_unlock(&data->lock);
 }
 
 static struct page *xen_virtio_dma_alloc_pages(struct device *dev, size_t size,
@@ -108,28 +171,71 @@ static dma_addr_t xen_virtio_dma_map_page(struct device *dev, struct page *page,
 					  enum dma_data_direction dir,
 					  unsigned long attrs)
 {
+	struct xen_virtio_data *data;
+	unsigned int i, n_pages = PFN_UP(size);
 	grant_ref_t grant;
+	dma_addr_t dma_handle = DMA_MAPPING_ERROR;
+
+	BUG_ON(dir == DMA_NONE);
+
+	data = find_xen_virtio_data(dev);
+	if (!data)
+		return DMA_MAPPING_ERROR;
+
+	spin_lock(&data->lock);
 
-	if (gnttab_alloc_grant_references(1, &grant))
-		return 0;
+	if (unlikely(data->broken))
+		goto out;
 
-	gnttab_grant_foreign_access_ref(grant, 0, xen_page_to_gfn(page),
-					dir == DMA_TO_DEVICE);
+	if (gnttab_alloc_grant_reference_seq(n_pages, &grant))
+		goto out;
 
-	return grant_to_dma(grant) + offset;
+	for (i = 0; i < n_pages; i++) {
+		gnttab_grant_foreign_access_ref(grant + i, data->dev_domid,
+				xen_page_to_gfn(page) + i, dir == DMA_TO_DEVICE);
+	}
+
+	dma_handle = grant_to_dma(grant) + offset;
+
+out:
+	spin_unlock(&data->lock);
+
+	return dma_handle;
 }
 
 static void xen_virtio_dma_unmap_page(struct device *dev, dma_addr_t dma_handle,
 				      size_t size, enum dma_data_direction dir,
 				      unsigned long attrs)
 {
+	struct xen_virtio_data *data;
+	unsigned int i, n_pages = PFN_UP(size);
 	grant_ref_t grant;
 
+	BUG_ON(dir == DMA_NONE);
+
+	data = find_xen_virtio_data(dev);
+	if (!data)
+		return;
+
+	spin_lock(&data->lock);
+
+	if (unlikely(data->broken))
+		goto out;
+
 	grant = dma_to_grant(dma_handle);
 
-	gnttab_end_foreign_access_ref(grant);
+	for (i = 0; i < n_pages; i++) {
+		if (unlikely(!gnttab_end_foreign_access_ref(grant + i))) {
+			dev_alert(dev, "Grant still in use by backend domain, disabled for further use\n");
+			data->broken = true;
+			goto out;
+		}
+	}
+
+	gnttab_free_grant_reference_seq(grant, n_pages);
 
-	gnttab_free_grant_reference(grant);
+out:
+	spin_unlock(&data->lock);
 }
 
 static int xen_virtio_dma_map_sg(struct device *dev, struct scatterlist *sg,
@@ -149,7 +255,7 @@ static void xen_virtio_dma_unmap_sg(struct device *dev, struct scatterlist *sg,
 
 static int xen_virtio_dma_dma_supported(struct device *dev, u64 mask)
 {
-	return 1;
+	return mask == DMA_BIT_MASK(64);
 }
 
 static const struct dma_map_ops xen_virtio_dma_ops = {
@@ -166,9 +272,61 @@ static const struct dma_map_ops xen_virtio_dma_ops = {
 	.dma_supported = xen_virtio_dma_dma_supported,
 };
 
+bool xen_is_virtio_device(struct device *dev)
+{
+	/* XXX Handle only DT devices for now */
+	if (!dev->of_node)
+		return false;
+
+	if (!of_device_is_compatible(dev->of_node, "virtio,mmio"))
+		return false;
+
+	return of_property_read_bool(dev->of_node, "xen,dev-domid");
+}
+EXPORT_SYMBOL_GPL(xen_is_virtio_device);
+
 void xen_virtio_setup_dma_ops(struct device *dev)
 {
+	struct xen_virtio_data *data;
+	uint32_t dev_domid;
+
+	data = find_xen_virtio_data(dev);
+	if (data) {
+		dev_err(dev, "xen_virtio data is already created\n");
+		return;
+	}
+
+	if (dev_is_pci(dev)) {
+		/* XXX Leave it hard wired to dom0 for now */
+		dev_domid = 0;
+	} else if (dev->of_node) {
+		if (of_property_read_u32(dev->of_node, "xen,dev-domid", &dev_domid)) {
+			dev_err(dev, "xen,dev-domid property is not present\n");
+			goto err;
+		}
+	} else
+		/* The ACPI case is not supported */
+		goto err;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data) {
+		dev_err(dev, "Сannot allocate xen_virtio data\n");
+		goto err;
+	}
+	data->dev_domid = dev_domid;
+	data->dev = dev;
+	spin_lock_init(&data->lock);
+
+	spin_lock(&xen_virtio_lock);
+	list_add(&data->list, &xen_virtio_devices);
+	spin_unlock(&xen_virtio_lock);
+
 	dev->dma_ops = &xen_virtio_dma_ops;
+
+	return;
+
+err:
+	dev_err(dev, "Сannot set up xen_virtio DMA ops, retain platform DMA ops\n");
 }
 EXPORT_SYMBOL_GPL(xen_virtio_setup_dma_ops);
 
diff --git a/include/xen/xen-ops.h b/include/xen/xen-ops.h
index ae3c1bc..fdbcb99 100644
--- a/include/xen/xen-ops.h
+++ b/include/xen/xen-ops.h
@@ -223,10 +223,15 @@ static inline void xen_preemptible_hcall_end(void) { }
 
 #ifdef CONFIG_XEN_VIRTIO
 void xen_virtio_setup_dma_ops(struct device *dev);
+bool xen_is_virtio_device(struct device *dev);
 #else
 static inline void xen_virtio_setup_dma_ops(struct device *dev)
 {
 }
+static inline bool xen_is_virtio_device(struct device *dev)
+{
+	return false;
+}
 #endif /* CONFIG_XEN_VIRTIO */
 
 #endif /* INCLUDE_XEN_OPS_H */
-- 
2.7.4


