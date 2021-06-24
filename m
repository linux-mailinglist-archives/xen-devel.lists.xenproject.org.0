Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4743B3362
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jun 2021 18:02:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.146936.270563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwRnj-0006ys-8R; Thu, 24 Jun 2021 16:01:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146936.270563; Thu, 24 Jun 2021 16:01:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwRnj-0006vM-2C; Thu, 24 Jun 2021 16:01:59 +0000
Received: by outflank-mailman (input) for mailman id 146936;
 Thu, 24 Jun 2021 16:01:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a5fo=LS=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1lwRjl-0002ED-66
 for xen-devel@lists.xenproject.org; Thu, 24 Jun 2021 15:57:53 +0000
Received: from mail-pl1-x62c.google.com (unknown [2607:f8b0:4864:20::62c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f2361213-e94d-44cc-8b8a-3f6e1033fbb4;
 Thu, 24 Jun 2021 15:57:28 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id v12so3171942plo.10
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jun 2021 08:57:28 -0700 (PDT)
Received: from localhost ([2401:fa00:95:205:165a:99ec:42d5:d8b])
 by smtp.gmail.com with UTF8SMTPSA id n6sm2862924pgt.7.2021.06.24.08.57.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jun 2021 08:57:27 -0700 (PDT)
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
X-Inumbo-ID: f2361213-e94d-44cc-8b8a-3f6e1033fbb4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xfRvKXXPDGozL9xpkc2RXgCWY6OxEYfQN41+lxoFnvY=;
        b=kEshnj7M08k1T5XsbOYdzjZbq7nVnmjng6eJnfjl4lHMzaAZWk6m94BUgoAkO9vE9h
         LGUHt/CR+GHi3cdJm3u8om1RbudjT01C0RCIVYBXBb3iKIFLf6Hz/aFd03GLLTot9C9q
         is4g5Rc9w98QwWpmpTahpJ12S/0U2a21x3Eus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xfRvKXXPDGozL9xpkc2RXgCWY6OxEYfQN41+lxoFnvY=;
        b=U1Ls8tjq4mbnKuBMwzbrUV7xNUc+ejem6YHpK5KyHYMr3orK9z8V3mcp8yI2b0xPKm
         1IGz7a5zHGj6LEhga2lFsfIDa0MzBr2QS9+A/Rg8Pyu1u9kMqAFw2Uf9w3RJi5n9sfP+
         /errx3bg0IUhgbdrUhWSHIma5PsXC6s92v1u51g8gMK2NlA3nIv4VyN8eOVbZgorPAv2
         dzlxjXzgrwBLIzcRUEumoAftTy8Xax/g8XhKvYmnhAVV9bkdtvUbzb74reN/yDFSOh/c
         mD3XOCA7EdnDMtdA0OtoC6XhoYqKplNdbZ+h6f3ru1gzBh5lXlt954L++mXz/osmYNzl
         8odw==
X-Gm-Message-State: AOAM530b/VUz+uugWYjzT0YofgLGZt5F4xkTH8Aw8Xys6w8paCU0WBPZ
	1Kab9tNXL1EbKxz6TThV3RYXlA==
X-Google-Smtp-Source: ABdhPJzInUpAy17snFNN0CGcBB/ghyLU73coTfwG0l77wDEHQQH9RWDi8n5UN9ZkYoU3wlPKMD5xpQ==
X-Received: by 2002:a17:90b:2282:: with SMTP id kx2mr5939882pjb.60.1624550248050;
        Thu, 24 Jun 2021 08:57:28 -0700 (PDT)
From: Claire Chang <tientzu@chromium.org>
To: Rob Herring <robh+dt@kernel.org>,
	mpe@ellerman.id.au,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	boris.ostrovsky@oracle.com,
	jgross@suse.com,
	Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>
Cc: benh@kernel.crashing.org,
	paulus@samba.org,
	"list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
	sstabellini@kernel.org,
	Robin Murphy <robin.murphy@arm.com>,
	grant.likely@arm.com,
	xypron.glpk@gmx.de,
	Thierry Reding <treding@nvidia.com>,
	mingo@kernel.org,
	bauerman@linux.ibm.com,
	peterz@infradead.org,
	Greg KH <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	heikki.krogerus@linux.intel.com,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	linux-devicetree <devicetree@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	xen-devel@lists.xenproject.org,
	Nicolas Boichat <drinkcat@chromium.org>,
	Jim Quinlan <james.quinlan@broadcom.com>,
	tfiga@chromium.org,
	bskeggs@redhat.com,
	bhelgaas@google.com,
	chris@chris-wilson.co.uk,
	tientzu@chromium.org,
	daniel@ffwll.ch,
	airlied@linux.ie,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	jani.nikula@linux.intel.com,
	jxgao@google.com,
	joonas.lahtinen@linux.intel.com,
	linux-pci@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	matthew.auld@intel.com,
	rodrigo.vivi@intel.com,
	thomas.hellstrom@linux.intel.com,
	thomas.lendacky@amd.com,
	quic_qiancai@quicinc.com
Subject: [PATCH v15 12/12] of: Add plumbing for restricted DMA pool
Date: Thu, 24 Jun 2021 23:55:26 +0800
Message-Id: <20210624155526.2775863-13-tientzu@chromium.org>
X-Mailer: git-send-email 2.32.0.288.g62a8d224e6-goog
In-Reply-To: <20210624155526.2775863-1-tientzu@chromium.org>
References: <20210624155526.2775863-1-tientzu@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If a device is not behind an IOMMU, we look up the device node and set
up the restricted DMA when the restricted-dma-pool is presented.

Signed-off-by: Claire Chang <tientzu@chromium.org>
Tested-by: Stefano Stabellini <sstabellini@kernel.org>
Tested-by: Will Deacon <will@kernel.org>
---
 drivers/of/address.c    | 33 +++++++++++++++++++++++++++++++++
 drivers/of/device.c     |  3 +++
 drivers/of/of_private.h |  6 ++++++
 3 files changed, 42 insertions(+)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index 73ddf2540f3f..cdf700fba5c4 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -8,6 +8,7 @@
 #include <linux/logic_pio.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/pci.h>
 #include <linux/pci_regs.h>
 #include <linux/sizes.h>
@@ -1022,6 +1023,38 @@ int of_dma_get_range(struct device_node *np, const struct bus_dma_region **map)
 	of_node_put(node);
 	return ret;
 }
+
+int of_dma_set_restricted_buffer(struct device *dev, struct device_node *np)
+{
+	struct device_node *node, *of_node = dev->of_node;
+	int count, i;
+
+	count = of_property_count_elems_of_size(of_node, "memory-region",
+						sizeof(u32));
+	/*
+	 * If dev->of_node doesn't exist or doesn't contain memory-region, try
+	 * the OF node having DMA configuration.
+	 */
+	if (count <= 0) {
+		of_node = np;
+		count = of_property_count_elems_of_size(
+			of_node, "memory-region", sizeof(u32));
+	}
+
+	for (i = 0; i < count; i++) {
+		node = of_parse_phandle(of_node, "memory-region", i);
+		/*
+		 * There might be multiple memory regions, but only one
+		 * restricted-dma-pool region is allowed.
+		 */
+		if (of_device_is_compatible(node, "restricted-dma-pool") &&
+		    of_device_is_available(node))
+			return of_reserved_mem_device_init_by_idx(dev, of_node,
+								  i);
+	}
+
+	return 0;
+}
 #endif /* CONFIG_HAS_DMA */
 
 /**
diff --git a/drivers/of/device.c b/drivers/of/device.c
index 6cb86de404f1..e68316836a7a 100644
--- a/drivers/of/device.c
+++ b/drivers/of/device.c
@@ -165,6 +165,9 @@ int of_dma_configure_id(struct device *dev, struct device_node *np,
 
 	arch_setup_dma_ops(dev, dma_start, size, iommu, coherent);
 
+	if (!iommu)
+		return of_dma_set_restricted_buffer(dev, np);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(of_dma_configure_id);
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index d9e6a324de0a..25cebbed5f02 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -161,12 +161,18 @@ struct bus_dma_region;
 #if defined(CONFIG_OF_ADDRESS) && defined(CONFIG_HAS_DMA)
 int of_dma_get_range(struct device_node *np,
 		const struct bus_dma_region **map);
+int of_dma_set_restricted_buffer(struct device *dev, struct device_node *np);
 #else
 static inline int of_dma_get_range(struct device_node *np,
 		const struct bus_dma_region **map)
 {
 	return -ENODEV;
 }
+static inline int of_dma_set_restricted_buffer(struct device *dev,
+					       struct device_node *np)
+{
+	return -ENODEV;
+}
 #endif
 
 #endif /* _LINUX_OF_PRIVATE_H */
-- 
2.32.0.288.g62a8d224e6-goog


