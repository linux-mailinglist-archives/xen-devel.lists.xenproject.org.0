Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D46033A4576
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jun 2021 17:33:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.140464.259552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrj9i-0005Ui-Qe; Fri, 11 Jun 2021 15:33:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 140464.259552; Fri, 11 Jun 2021 15:33:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrj9i-0005Sr-Mo; Fri, 11 Jun 2021 15:33:10 +0000
Received: by outflank-mailman (input) for mailman id 140464;
 Fri, 11 Jun 2021 15:33:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9xgm=LF=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1lrj6m-0001UV-NE
 for xen-devel@lists.xenproject.org; Fri, 11 Jun 2021 15:30:08 +0000
Received: from mail-pf1-x42a.google.com (unknown [2607:f8b0:4864:20::42a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cdb0ed64-1a85-4480-91e0-857f539f2673;
 Fri, 11 Jun 2021 15:29:17 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id z26so4727633pfj.5
 for <xen-devel@lists.xenproject.org>; Fri, 11 Jun 2021 08:29:17 -0700 (PDT)
Received: from localhost ([2401:fa00:95:205:33c8:8e01:1161:6797])
 by smtp.gmail.com with UTF8SMTPSA id n11sm5376420pfu.29.2021.06.11.08.29.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jun 2021 08:29:16 -0700 (PDT)
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
X-Inumbo-ID: cdb0ed64-1a85-4480-91e0-857f539f2673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/h+uMK5EvTU9y/lCGU3ZvCTAZDjSKC/jtJCWXvTsWEE=;
        b=HhpdzooM/9OahuuJNkXbvXBqmvqw8FUa6EKj2BaW6crQMvq/ScwxDhTvwyC0rkCxs+
         qdWlvtSqQ4JGBA/bijy6bpuQWOxgyJPJ9pxnXvbdvDkSLuKEZ1SJkRU0zubFn6wd3k5G
         bES3BFVcePGohMbxPDI0s9cBVMuc2zmUCtVw8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/h+uMK5EvTU9y/lCGU3ZvCTAZDjSKC/jtJCWXvTsWEE=;
        b=NQOmQO3V/DrSV15Y/VuNejiXKY3yD/K6CW3NnW2hu7lkmHscOrgoaEq5rtpgktlnr4
         gCrP+jeW3j1/Ic8fKXQ1f82TBcUJ4qq1wZIuaYIcs/JAm8RLmhjbzbXe20FVjWdow5iO
         L7w8Z5Im4hnSMwEo6rTTrWQKmzPVrmjKTQ3bb0fRUI0d0NmjY/KCn0q1eumYSaDDlvsM
         q6aj/aYsCmCSEhWWLn2zDtstOifOO+S6OqZOnGalJtBg+rY1Y0yEnmTV8dGn3/RNkEbX
         5PWgu+BYrsBi4JDhP5lsOFgrRPSzFsXMg6EEg4FmFUzfqkuoh8OMuJw0mOdogRAV/4up
         5Nyg==
X-Gm-Message-State: AOAM531iRokt+2kAqYePBPmN3Syh7cN62tD1zCssoetuk5b7mf36X+3u
	AgA+p2F6k4U9KrAiBkDerXAAvA==
X-Google-Smtp-Source: ABdhPJxm0sDDpDqGQ8rNYiECVqpZ7eLqxfJ9mC0qI8JX65WyVERI818aqtVbmfi4eNxIlAsNsotgSA==
X-Received: by 2002:a63:e954:: with SMTP id q20mr1993869pgj.332.1623425356990;
        Fri, 11 Jun 2021 08:29:16 -0700 (PDT)
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
	thomas.hellstrom@linux.intel.com
Subject: [PATCH v9 14/14] of: Add plumbing for restricted DMA pool
Date: Fri, 11 Jun 2021 23:26:59 +0800
Message-Id: <20210611152659.2142983-15-tientzu@chromium.org>
X-Mailer: git-send-email 2.32.0.272.g935e593368-goog
In-Reply-To: <20210611152659.2142983-1-tientzu@chromium.org>
References: <20210611152659.2142983-1-tientzu@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If a device is not behind an IOMMU, we look up the device node and set
up the restricted DMA when the restricted-dma-pool is presented.

Signed-off-by: Claire Chang <tientzu@chromium.org>
---
 drivers/of/address.c    | 33 +++++++++++++++++++++++++++++++++
 drivers/of/device.c     |  3 +++
 drivers/of/of_private.h |  6 ++++++
 3 files changed, 42 insertions(+)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index 3b2acca7e363..c8066d95ff0e 100644
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
@@ -1001,6 +1002,38 @@ int of_dma_get_range(struct device_node *np, const struct bus_dma_region **map)
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
index 1defdf15ba95..ba4656e77502 100644
--- a/drivers/of/device.c
+++ b/drivers/of/device.c
@@ -168,6 +168,9 @@ int of_dma_configure_id(struct device *dev, struct device_node *np,
 	if (IS_ENABLED(CONFIG_SWIOTLB))
 		swiotlb_set_io_tlb_default_mem(dev);
 
+	if (!iommu)
+		return of_dma_set_restricted_buffer(dev, np);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(of_dma_configure_id);
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index 631489f7f8c0..376462798f7e 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -163,12 +163,18 @@ struct bus_dma_region;
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
 
 void fdt_init_reserved_mem(void);
-- 
2.32.0.272.g935e593368-goog


