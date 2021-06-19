Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7602A3AD72C
	for <lists+xen-devel@lfdr.de>; Sat, 19 Jun 2021 05:41:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.145043.266911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luRrh-0003Qr-KP; Sat, 19 Jun 2021 03:41:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 145043.266911; Sat, 19 Jun 2021 03:41:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luRrh-0003Ou-G7; Sat, 19 Jun 2021 03:41:49 +0000
Received: by outflank-mailman (input) for mailman id 145043;
 Sat, 19 Jun 2021 03:41:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Oaj8=LN=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1luRrg-0001Ok-Dz
 for xen-devel@lists.xenproject.org; Sat, 19 Jun 2021 03:41:48 +0000
Received: from mail-pj1-x102c.google.com (unknown [2607:f8b0:4864:20::102c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dceb24c6-72c9-40ef-8dd7-2491c2e17815;
 Sat, 19 Jun 2021 03:41:39 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 m15-20020a17090a5a4fb029016f385ffad0so4212034pji.0
 for <xen-devel@lists.xenproject.org>; Fri, 18 Jun 2021 20:41:39 -0700 (PDT)
Received: from localhost ([2401:fa00:95:205:4a46:e208:29e8:e076])
 by smtp.gmail.com with UTF8SMTPSA id bp2sm2313035pjb.20.2021.06.18.20.41.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jun 2021 20:41:38 -0700 (PDT)
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
X-Inumbo-ID: dceb24c6-72c9-40ef-8dd7-2491c2e17815
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zrGk5vL3UOmfV1+EKp1h1m3lS/SKJ23U3aRYavMW2u4=;
        b=BFagvH2d1+jFVqk3x7a7fdtcLbrA9KLeqPaRYxC4m59HXZlMztmGwqO1z/ykJ+WJpd
         rqzzg+qqfiWUljkrHR8vXBZX5jVlUpgiPPNGLjiy1t1keidN2x6SJq30tTtRjxGdPJAQ
         PUvDTKjTiAO4Ppj2mMNYS/gDAl5l3ULKGYSQo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zrGk5vL3UOmfV1+EKp1h1m3lS/SKJ23U3aRYavMW2u4=;
        b=TS+k6QklYz4jKOc9XYYj5WjZbdu28+2WCslAakPGQpF6KqLNb3d7bMEtd/XYsiydS+
         zQwguFCv6wWMXUpSzMN4RvD6pTIKITfKmPFX+syJK/TmYjviHFCn3hIfcIKRVG7/2+w/
         TMdFOINLYhM+t7nSCQp1CUZBPwg3ruVuCJo4a/Lqr83DuUeK11+V5KS807VAr0ijN9v3
         rB+E1E/zgBh/ZgPuNTHb/gNrlAQkY+/t2dtAKXtgtU5E6sQ179fEwZu3knfeIGr6Q9Pj
         FjiFxthMFLdiU92EzhjUewI4qhRsAkoUycJAkFczvGQSj2GuuRdEdBvUdaVYTo08jS0+
         VSRQ==
X-Gm-Message-State: AOAM532DR0lilbaXsKfV7hUvwLTy/ZKD70qBMMRop7xWjj6+PKw9lgUl
	wzX1BWT2fTCaQt18hx73HYXFqA==
X-Google-Smtp-Source: ABdhPJySL8LyiFJgKMn6YIK1rQRoUoEueFH5Ee9/KPNH8Svj2cORHQyHhlJVtqo/KSLaIk9InLr0HQ==
X-Received: by 2002:a17:90a:aa05:: with SMTP id k5mr25005023pjq.117.1624074098672;
        Fri, 18 Jun 2021 20:41:38 -0700 (PDT)
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
	thomas.lendacky@amd.com
Subject: [PATCH v14 05/12] swiotlb: Update is_swiotlb_active to add a struct device argument
Date: Sat, 19 Jun 2021 11:40:36 +0800
Message-Id: <20210619034043.199220-6-tientzu@chromium.org>
X-Mailer: git-send-email 2.32.0.288.g62a8d224e6-goog
In-Reply-To: <20210619034043.199220-1-tientzu@chromium.org>
References: <20210619034043.199220-1-tientzu@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update is_swiotlb_active to add a struct device argument. This will be
useful later to allow for different pools.

Signed-off-by: Claire Chang <tientzu@chromium.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Tested-by: Stefano Stabellini <sstabellini@kernel.org>
Tested-by: Will Deacon <will@kernel.org>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
---
 drivers/gpu/drm/i915/gem/i915_gem_internal.c | 2 +-
 drivers/gpu/drm/nouveau/nouveau_ttm.c        | 2 +-
 drivers/pci/xen-pcifront.c                   | 2 +-
 include/linux/swiotlb.h                      | 4 ++--
 kernel/dma/direct.c                          | 2 +-
 kernel/dma/swiotlb.c                         | 4 ++--
 6 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_internal.c b/drivers/gpu/drm/i915/gem/i915_gem_internal.c
index a9d65fc8aa0e..4b7afa0fc85d 100644
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
index 9662522aa066..be15bfd9e0ee 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
@@ -321,7 +321,7 @@ nouveau_ttm_init(struct nouveau_drm *drm)
 	}
 
 #if IS_ENABLED(CONFIG_SWIOTLB) && IS_ENABLED(CONFIG_X86)
-	need_swiotlb = is_swiotlb_active();
+	need_swiotlb = is_swiotlb_active(dev->dev);
 #endif
 
 	ret = ttm_bo_device_init(&drm->ttm.bdev, &nouveau_bo_driver,
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
index d1f3d95881cd..dd1c30a83058 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -112,7 +112,7 @@ static inline bool is_swiotlb_buffer(struct device *dev, phys_addr_t paddr)
 void __init swiotlb_exit(void);
 unsigned int swiotlb_max_segment(void);
 size_t swiotlb_max_mapping_size(struct device *dev);
-bool is_swiotlb_active(void);
+bool is_swiotlb_active(struct device *dev);
 void __init swiotlb_adjust_size(unsigned long size);
 #else
 #define swiotlb_force SWIOTLB_NO_FORCE
@@ -132,7 +132,7 @@ static inline size_t swiotlb_max_mapping_size(struct device *dev)
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
index 72a4289faed1..8a120f42340b 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -664,9 +664,9 @@ size_t swiotlb_max_mapping_size(struct device *dev)
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
2.32.0.288.g62a8d224e6-goog


