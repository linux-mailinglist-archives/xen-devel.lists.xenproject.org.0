Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2919C3A4522
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jun 2021 17:28:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.140435.259519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrj51-0002XC-Lc; Fri, 11 Jun 2021 15:28:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 140435.259519; Fri, 11 Jun 2021 15:28:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrj51-0002SK-I1; Fri, 11 Jun 2021 15:28:19 +0000
Received: by outflank-mailman (input) for mailman id 140435;
 Fri, 11 Jun 2021 15:28:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9xgm=LF=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1lrj50-0001UV-JQ
 for xen-devel@lists.xenproject.org; Fri, 11 Jun 2021 15:28:18 +0000
Received: from mail-pg1-x534.google.com (unknown [2607:f8b0:4864:20::534])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dc172d26-5ff1-4637-b8fd-7db3b49771ed;
 Fri, 11 Jun 2021 15:28:07 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id e20so2797948pgg.0
 for <xen-devel@lists.xenproject.org>; Fri, 11 Jun 2021 08:28:07 -0700 (PDT)
Received: from localhost ([2401:fa00:95:205:33c8:8e01:1161:6797])
 by smtp.gmail.com with UTF8SMTPSA id h12sm5753859pgn.54.2021.06.11.08.27.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jun 2021 08:28:06 -0700 (PDT)
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
X-Inumbo-ID: dc172d26-5ff1-4637-b8fd-7db3b49771ed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MalV2CJ985iagzNSMyE2gpGad3UeVZNg8z2N/3AvmfA=;
        b=eCBgbtVRpMlNoTp3Qb9z3igfLg56XJvLlX9C35Jsgr3nIsZb4Kok6rgN/bbLfD80Qy
         e3Pgw0kbSJakGzAv3QSsIgmZpc78a08an5Bw5pXx6xrZWrIDvAnZhP9zKwZq+J6CORqn
         K0fF06KCx7SV0W5IFjWZ5axcloQj/KU2Qc5g0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MalV2CJ985iagzNSMyE2gpGad3UeVZNg8z2N/3AvmfA=;
        b=JCbBNtM9zjO5IK4VUTxGQiOUu5weiNRmUi8r4QO8bqyJsol4XShc89a4Td5CaUW8sl
         voP4nqB08paN3VJiS2GserkocgkcDGPEqIzlfxSWCoGkL4GxyUuztT51Ag2RK169nxTF
         8ybZgIz9xbCWt1V0t2gb80DoojbeHMr1jTHmt4Z/LiCg32Kt+aQ/c0+TQB21PTqpSbKX
         UTfHqapG4eZ+g/5t7UaT6NkBDNYnb2AlECi74LqaIHwKWV036okGvQiBxSAXtzYMgrvt
         yby9MYmkfEc4+RXMOSY5m1fPMLO53ii4rEAJHZFHbwzqHLyRi9Nfo0ji3ADa4BDCkr5W
         dL3Q==
X-Gm-Message-State: AOAM531q6qGW9kdgtpLO6Sx/TgYGN33UE/p/HveSruM1GjTZ8WgMnrK+
	HphrYHWn2IzwBwd9KW0IFFxH4g==
X-Google-Smtp-Source: ABdhPJzlQenh9k0nqVW0E8ub36FyXOThaRF1VbV2QslYPlfabmGDPoR8tL9zv2YKB/OJ0Pgomd7a2w==
X-Received: by 2002:a63:5d52:: with SMTP id o18mr4196807pgm.440.1623425286584;
        Fri, 11 Jun 2021 08:28:06 -0700 (PDT)
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
Subject: [PATCH v9 06/14] swiotlb: Update is_swiotlb_active to add a struct device argument
Date: Fri, 11 Jun 2021 23:26:51 +0800
Message-Id: <20210611152659.2142983-7-tientzu@chromium.org>
X-Mailer: git-send-email 2.32.0.272.g935e593368-goog
In-Reply-To: <20210611152659.2142983-1-tientzu@chromium.org>
References: <20210611152659.2142983-1-tientzu@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update is_swiotlb_active to add a struct device argument. This will be
useful later to allow for restricted DMA pool.

Signed-off-by: Claire Chang <tientzu@chromium.org>
---
 drivers/gpu/drm/i915/gem/i915_gem_internal.c | 2 +-
 drivers/gpu/drm/nouveau/nouveau_ttm.c        | 2 +-
 drivers/pci/xen-pcifront.c                   | 2 +-
 include/linux/swiotlb.h                      | 4 ++--
 kernel/dma/direct.c                          | 2 +-
 kernel/dma/swiotlb.c                         | 4 ++--
 6 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_internal.c b/drivers/gpu/drm/i915/gem/i915_gem_internal.c
index ce6b664b10aa..89a894354263 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_internal.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_internal.c
@@ -42,7 +42,7 @@ static int i915_gem_object_get_pages_internal(struct drm_i915_gem_object *obj)
 
 	max_order = MAX_ORDER;
 #ifdef CONFIG_SWIOTLB
-	if (is_swiotlb_active()) {
+	if (is_swiotlb_active(obj->base.dev->dev)) {
 		unsigned int max_segment;
 
 		max_segment = swiotlb_max_segment();
diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
index f4c2e46b6fe1..2ca9d9a9e5d5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
@@ -276,7 +276,7 @@ nouveau_ttm_init(struct nouveau_drm *drm)
 	}
 
 #if IS_ENABLED(CONFIG_SWIOTLB) && IS_ENABLED(CONFIG_X86)
-	need_swiotlb = is_swiotlb_active();
+	need_swiotlb = is_swiotlb_active(dev->dev);
 #endif
 
 	ret = ttm_device_init(&drm->ttm.bdev, &nouveau_bo_driver, drm->dev->dev,
diff --git a/drivers/pci/xen-pcifront.c b/drivers/pci/xen-pcifront.c
index b7a8f3a1921f..0d56985bfe81 100644
--- a/drivers/pci/xen-pcifront.c
+++ b/drivers/pci/xen-pcifront.c
@@ -693,7 +693,7 @@ static int pcifront_connect_and_init_dma(struct pcifront_device *pdev)
 
 	spin_unlock(&pcifront_dev_lock);
 
-	if (!err && !is_swiotlb_active()) {
+	if (!err && !is_swiotlb_active(&pdev->xdev->dev)) {
 		err = pci_xen_swiotlb_init_late();
 		if (err)
 			dev_err(&pdev->xdev->dev, "Could not setup SWIOTLB!\n");
diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 921b469c6ad2..06cf17a80f5c 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -118,7 +118,7 @@ static inline void swiotlb_set_io_tlb_default_mem(struct device *dev)
 void __init swiotlb_exit(void);
 unsigned int swiotlb_max_segment(void);
 size_t swiotlb_max_mapping_size(struct device *dev);
-bool is_swiotlb_active(void);
+bool is_swiotlb_active(struct device *dev);
 void __init swiotlb_adjust_size(unsigned long size);
 #else
 #define swiotlb_force SWIOTLB_NO_FORCE
@@ -141,7 +141,7 @@ static inline size_t swiotlb_max_mapping_size(struct device *dev)
 	return SIZE_MAX;
 }
 
-static inline bool is_swiotlb_active(void)
+static inline bool is_swiotlb_active(struct device *dev)
 {
 	return false;
 }
diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 84c9feb5474a..7a88c34d0867 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -495,7 +495,7 @@ int dma_direct_supported(struct device *dev, u64 mask)
 size_t dma_direct_max_mapping_size(struct device *dev)
 {
 	/* If SWIOTLB is active, use its maximum mapping size */
-	if (is_swiotlb_active() &&
+	if (is_swiotlb_active(dev) &&
 	    (dma_addressing_limited(dev) || swiotlb_force == SWIOTLB_FORCE))
 		return swiotlb_max_mapping_size(dev);
 	return SIZE_MAX;
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index c4a071d6a63f..21e99907edd6 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -666,9 +666,9 @@ size_t swiotlb_max_mapping_size(struct device *dev)
 	return ((size_t)IO_TLB_SIZE) * IO_TLB_SEGSIZE;
 }
 
-bool is_swiotlb_active(void)
+bool is_swiotlb_active(struct device *dev)
 {
-	return io_tlb_default_mem != NULL;
+	return dev->dma_io_tlb_mem != NULL;
 }
 EXPORT_SYMBOL_GPL(is_swiotlb_active);
 
-- 
2.32.0.272.g935e593368-goog


