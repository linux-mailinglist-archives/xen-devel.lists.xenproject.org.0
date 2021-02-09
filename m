Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB7D3148AC
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 07:23:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83140.154123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9MQp-0003Np-GP; Tue, 09 Feb 2021 06:23:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83140.154123; Tue, 09 Feb 2021 06:23:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9MQp-0003NK-CQ; Tue, 09 Feb 2021 06:23:27 +0000
Received: by outflank-mailman (input) for mailman id 83140;
 Tue, 09 Feb 2021 06:23:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CyDg=HL=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1l9MQo-0003Ma-5F
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 06:23:26 +0000
Received: from mail-pg1-x534.google.com (unknown [2607:f8b0:4864:20::534])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6423188d-c4c4-448e-a666-2f0ae8d8a268;
 Tue, 09 Feb 2021 06:23:25 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id j5so3022315pgb.11
 for <xen-devel@lists.xenproject.org>; Mon, 08 Feb 2021 22:23:25 -0800 (PST)
Received: from localhost ([2401:fa00:1:10:a106:46e1:a999:81df])
 by smtp.gmail.com with UTF8SMTPSA id c18sm11072205pfo.171.2021.02.08.22.23.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 22:23:24 -0800 (PST)
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
X-Inumbo-ID: 6423188d-c4c4-448e-a666-2f0ae8d8a268
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fCpdetXZbkmTlNt6IWgIQo6qPUhUH6Y1glnHH1TYQ8A=;
        b=m27gPzIn4y36BwdfABPhJctzVcQ+lZFochfhUvq6yh+3RZRwkrsGVp6GPOttVPTYhe
         piJwyWKCXZarFl+5Mgad+/eyxNzq8NXJiZDrHYIevzx3qMO6Yl37ZUAmkcqRBRBt6DSZ
         YohFfsGtKU7yDyK0RzwEYOoKhUHsk0fZc4SIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fCpdetXZbkmTlNt6IWgIQo6qPUhUH6Y1glnHH1TYQ8A=;
        b=XJmiwbJemI5ObNW1pZpZVfppvfdXwUPyN1lZcXINH312KhNBpOpKRPFkEEFZnwL7y/
         UOTcVp7We6GF/zIJRtY0WKsPaqSWyjqsN7Xaz82nv1W720mddpOVtsLplTNYBcR1d0K3
         fzSIx/gFI97oIjvmHZTtbzD7j9LzQ+IpsaFBdo+vku8CfvMANIt2Fe4MwvArNn7ok7ro
         OVZtmSpZUo8mBr9vCewIAvTs8LoD03ikQSWjL7UFaRVrgWpT0ENUmP0qSD53QnVyjdkc
         Y00Vwp3Jrnkaf14oqF6Ki+qURLehFumz75JOoCNuW2VL1HCK8MC/k60S5gycYSboYvRU
         Achg==
X-Gm-Message-State: AOAM5313LXFAcQCzx7csrZqUHq+bqZpDWkEHIIbRaZVEbTN+7JAhUZwC
	JC4RJBo7mnj4OjEhHn8oJo7eUQ==
X-Google-Smtp-Source: ABdhPJzbc6B180HFMEwkww4vcx+xgwf9jKl8iifukr0wO8EhuGUoiPsVkBYDMJ6LpbG7UB75Krtn/A==
X-Received: by 2002:a62:484:0:b029:1b7:878b:c170 with SMTP id 126-20020a6204840000b02901b7878bc170mr21302515pfe.28.1612851804694;
        Mon, 08 Feb 2021 22:23:24 -0800 (PST)
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
	Claire Chang <tientzu@chromium.org>
Subject: [PATCH v4 14/14] of: Add plumbing for restricted DMA pool
Date: Tue,  9 Feb 2021 14:21:31 +0800
Message-Id: <20210209062131.2300005-15-tientzu@chromium.org>
X-Mailer: git-send-email 2.30.0.478.g8a0d178c01-goog
In-Reply-To: <20210209062131.2300005-1-tientzu@chromium.org>
References: <20210209062131.2300005-1-tientzu@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If a device is not behind an IOMMU, we look up the device node and set
up the restricted DMA when the restricted-dma-pool is presented.

Signed-off-by: Claire Chang <tientzu@chromium.org>
---
 drivers/of/address.c    | 25 +++++++++++++++++++++++++
 drivers/of/device.c     |  3 +++
 drivers/of/of_private.h |  5 +++++
 3 files changed, 33 insertions(+)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index 73ddf2540f3f..b6093c9b135d 100644
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
@@ -1094,3 +1095,27 @@ bool of_dma_is_coherent(struct device_node *np)
 	return false;
 }
 EXPORT_SYMBOL_GPL(of_dma_is_coherent);
+
+int of_dma_set_restricted_buffer(struct device *dev)
+{
+	struct device_node *node;
+	int count, i;
+
+	if (!dev->of_node)
+		return 0;
+
+	count = of_property_count_elems_of_size(dev->of_node, "memory-region",
+						sizeof(phandle));
+	for (i = 0; i < count; i++) {
+		node = of_parse_phandle(dev->of_node, "memory-region", i);
+		/* There might be multiple memory regions, but only one
+		 * restriced-dma-pool region is allowed.
+		 */
+		if (of_device_is_compatible(node, "restricted-dma-pool") &&
+		    of_device_is_available(node))
+			return of_reserved_mem_device_init_by_idx(
+				dev, dev->of_node, i);
+	}
+
+	return 0;
+}
diff --git a/drivers/of/device.c b/drivers/of/device.c
index 1122daa8e273..38c631f1fafa 100644
--- a/drivers/of/device.c
+++ b/drivers/of/device.c
@@ -186,6 +186,9 @@ int of_dma_configure_id(struct device *dev, struct device_node *np,
 
 	arch_setup_dma_ops(dev, dma_start, size, iommu, coherent);
 
+	if (!iommu)
+		return of_dma_set_restricted_buffer(dev);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(of_dma_configure_id);
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index d9e6a324de0a..28a2dfa197ba 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -161,12 +161,17 @@ struct bus_dma_region;
 #if defined(CONFIG_OF_ADDRESS) && defined(CONFIG_HAS_DMA)
 int of_dma_get_range(struct device_node *np,
 		const struct bus_dma_region **map);
+int of_dma_set_restricted_buffer(struct device *dev);
 #else
 static inline int of_dma_get_range(struct device_node *np,
 		const struct bus_dma_region **map)
 {
 	return -ENODEV;
 }
+static inline int of_dma_get_restricted_buffer(struct device *dev)
+{
+	return -ENODEV;
+}
 #endif
 
 #endif /* _LINUX_OF_PRIVATE_H */
-- 
2.30.0.478.g8a0d178c01-goog


