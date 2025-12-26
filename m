Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FF4CDFD57
	for <lists+xen-devel@lfdr.de>; Sat, 27 Dec 2025 15:23:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1193524.1512232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vZVC7-0007T2-7P; Sat, 27 Dec 2025 14:22:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1193524.1512232; Sat, 27 Dec 2025 14:22:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vZVC6-0007Li-Ob; Sat, 27 Dec 2025 14:22:58 +0000
Received: by outflank-mailman (input) for mailman id 1193524;
 Fri, 26 Dec 2025 22:54:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z/ld=7A=gmail.com=21cnbao@srs-se1.protection.inumbo.net>)
 id 1vZGhD-0005LS-4R
 for xen-devel@lists.xenproject.org; Fri, 26 Dec 2025 22:54:07 +0000
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [2607:f8b0:4864:20::102a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c781b412-e2ad-11f0-b15c-2bf370ae4941;
 Fri, 26 Dec 2025 23:54:06 +0100 (CET)
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-34ccbf37205so5620298a91.2
 for <xen-devel@lists.xenproject.org>; Fri, 26 Dec 2025 14:54:06 -0800 (PST)
Received: from barry-desktop.hub ([47.72.129.29])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34e772ac1acsm9981428a91.9.2025.12.26.14.53.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Dec 2025 14:54:03 -0800 (PST)
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
X-Inumbo-ID: c781b412-e2ad-11f0-b15c-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766789645; x=1767394445; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pcGdIc/9DJZ3V/5WVf7vUUbl5wTlCyMzFQWvUiTQ7kw=;
        b=WU9Q8GH05agHSbpliYDlixm9kYzc2GJD5b+CNpwHkuD9RkdM7ZEDeqwOjJzLTi9Cqk
         VUG6Mv/20juTkabkrzKq6gfUJFQQ9umTrnge3PGasPe8PIszDGmp9VADCaJFeG7QtI6S
         uqCrmXJTcyMDZ4KhUn9h8VNxzeBYmo1sao2JmWpBYXsC1i4FhHklDFs1m9AjePRNogkJ
         ErP7LszBf0PMskExJjTK03HN4rI4JzyZpuO2IpS8tFIpEW+PbfnWe/6wiK4BrDMsQqLi
         sMziLQVQiRpZ6JOm4iqZ4Tr58Y+bONY2Ywq1AzOrcdu5HesGKCfsONFt3VVDHkhuaMR1
         zuXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766789645; x=1767394445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pcGdIc/9DJZ3V/5WVf7vUUbl5wTlCyMzFQWvUiTQ7kw=;
        b=hdQW4oYsCkkk2yG6IGZs5LVFzekNWzkcX+MnO4+63e9+Sqo9pFyk/EdNVzeg9PefF1
         I9XjQeBnXva+iz1eYKITcdSpYosRePSjcPhvOyVsPCniQvJ0hmLJQfbsPM8wKcdlVFun
         1fWiQ+Dcb2uxwLdPGmZA7/cwWgaOS4jV9EcAjGbXdv613wKvIBNnbW9F4lnkZf/V4mlv
         lNAhwfho7tt10DtwllKPpj24PMhbXppkOJNjGRpddtp4c9ZTUcO+paaARQKJ4Lli+/DJ
         H+gzIP7Ru0VSqeBgSz3vr6qg0nPzJBW2KJ4fGh1xPd/jNRP8Mp96mH/8eckEwnCsIZCF
         NU9w==
X-Forwarded-Encrypted: i=1; AJvYcCVhPYkL7GlgcIaUNedRs4J6ctrvPirGvn+Oa46ktJyJ2ItGzbwsphrgnvfVhr6RpRIybKgjEhKnbHs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyLMqyi06bIp9pW1nGwg/WeosihDVWw8w+XHC3pFbq3auQ473p2
	drImO8ewk3G8wJd6szolKMcTSo6KVKMRKQ4MX5BDuhmuAAPVzQSlu3Hk
X-Gm-Gg: AY/fxX51h9wc4dq/xOTTRXbv0CTlujdIMp/deX6EGViXuj9X8Xke9gYohJvoMUCJlAU
	f6Wd4f/h3AaDBQEihMrvH4tYWSbJVT8hWh7eSugzh04QLt27cLlOj7DCyPLz0kIe24LNcwj0/E/
	q6BnN56EVldqC2HnS/cDT1ux9nNOOBY3OJKrrVWSq+mzbsitkAlRR1uGBCsHVcLfl5g/AnBwwnd
	rKxee1rxQfevl0eVFPFqgVwvpl14RCW1PKL3Eu5J4OIp9Jt5DKhqdHKXkIgz/w19Mw8ep0GuZ90
	HBeepZuaRiiKkwfBoyswoU89sOF1t1l3OhEvWYRbDh4wTy3Pq+jn3PZ9SOfMKNMNm/KOQT9TRSI
	mV1xNBB6Ez8JiG69mumw6+sx+pyE65ZmcdOmdVY1ZmlPP777SB0tHfQZXeHGPnd5YR28w8C4LEd
	O684jQ+d74z9Sw
X-Google-Smtp-Source: AGHT+IE+oJ1Ft1XOQ1XU6OeA4rerw4thrh1Pz4yYg+rxMS7HW6pD48/QipbV6W5OVknyxXIG+nvg1w==
X-Received: by 2002:a17:90b:5804:b0:34a:b459:bd10 with SMTP id 98e67ed59e1d1-34e921bf172mr21139744a91.24.1766789644533;
        Fri, 26 Dec 2025 14:54:04 -0800 (PST)
From: Barry Song <21cnbao@gmail.com>
To: catalin.marinas@arm.com,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	will@kernel.org,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	Barry Song <baohua@kernel.org>,
	Leon Romanovsky <leon@kernel.org>,
	Ada Couprie Diaz <ada.coupriediaz@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Tangquan Zheng <zhengtangquan@oppo.com>
Subject: [PATCH v2 6/8] dma-mapping: Support batch mode for dma_direct_{map,unmap}_sg
Date: Sat, 27 Dec 2025 11:52:46 +1300
Message-ID: <20251226225254.46197-7-21cnbao@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251226225254.46197-1-21cnbao@gmail.com>
References: <20251226225254.46197-1-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Barry Song <baohua@kernel.org>

Leon suggested extending a flush argument to
dma_direct_unmap_phys(), dma_direct_map_phys(), and
dma_direct_sync_single_for_cpu(). For single-buffer cases, this
would use flush=true, while for SG cases flush=false would be
used, followed by a single flush after all cache operations are
issued in dma_direct_{map,unmap}_sg().

This ultimately benefits dma_map_sg() and dma_unmap_sg().

Cc: Leon Romanovsky <leon@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Tangquan Zheng <zhengtangquan@oppo.com>
Signed-off-by: Barry Song <baohua@kernel.org>
---
 kernel/dma/direct.c  | 17 +++++++++++++----
 kernel/dma/direct.h  | 16 ++++++++++------
 kernel/dma/mapping.c |  6 +++---
 3 files changed, 26 insertions(+), 13 deletions(-)

diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 98bacf562ca1..550a1a13148d 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -447,14 +447,19 @@ void dma_direct_unmap_sg(struct device *dev, struct scatterlist *sgl,
 {
 	struct scatterlist *sg;
 	int i;
+	bool need_sync = false;
 
 	for_each_sg(sgl,  sg, nents, i) {
-		if (sg_dma_is_bus_address(sg))
+		if (sg_dma_is_bus_address(sg)) {
 			sg_dma_unmark_bus_address(sg);
-		else
+		} else {
+			need_sync = true;
 			dma_direct_unmap_phys(dev, sg->dma_address,
-					      sg_dma_len(sg), dir, attrs);
+					      sg_dma_len(sg), dir, attrs, false);
+		}
 	}
+	if (need_sync && !dev_is_dma_coherent(dev))
+		arch_sync_dma_flush();
 }
 #endif
 
@@ -464,6 +469,7 @@ int dma_direct_map_sg(struct device *dev, struct scatterlist *sgl, int nents,
 	struct pci_p2pdma_map_state p2pdma_state = {};
 	struct scatterlist *sg;
 	int i, ret;
+	bool need_sync = false;
 
 	for_each_sg(sgl, sg, nents, i) {
 		switch (pci_p2pdma_state(&p2pdma_state, dev, sg_page(sg))) {
@@ -475,8 +481,9 @@ int dma_direct_map_sg(struct device *dev, struct scatterlist *sgl, int nents,
 			 */
 			break;
 		case PCI_P2PDMA_MAP_NONE:
+			need_sync = true;
 			sg->dma_address = dma_direct_map_phys(dev, sg_phys(sg),
-					sg->length, dir, attrs);
+					sg->length, dir, attrs, false);
 			if (sg->dma_address == DMA_MAPPING_ERROR) {
 				ret = -EIO;
 				goto out_unmap;
@@ -495,6 +502,8 @@ int dma_direct_map_sg(struct device *dev, struct scatterlist *sgl, int nents,
 		sg_dma_len(sg) = sg->length;
 	}
 
+	if (need_sync && !dev_is_dma_coherent(dev))
+		arch_sync_dma_flush();
 	return nents;
 
 out_unmap:
diff --git a/kernel/dma/direct.h b/kernel/dma/direct.h
index a69326eed266..d4ad79828090 100644
--- a/kernel/dma/direct.h
+++ b/kernel/dma/direct.h
@@ -67,13 +67,15 @@ static inline void dma_direct_sync_single_for_device(struct device *dev,
 }
 
 static inline void dma_direct_sync_single_for_cpu(struct device *dev,
-		dma_addr_t addr, size_t size, enum dma_data_direction dir)
+		dma_addr_t addr, size_t size, enum dma_data_direction dir,
+		bool flush)
 {
 	phys_addr_t paddr = dma_to_phys(dev, addr);
 
 	if (!dev_is_dma_coherent(dev)) {
 		arch_sync_dma_for_cpu(paddr, size, dir);
-		arch_sync_dma_flush();
+		if (flush)
+			arch_sync_dma_flush();
 		arch_sync_dma_for_cpu_all();
 	}
 
@@ -85,7 +87,7 @@ static inline void dma_direct_sync_single_for_cpu(struct device *dev,
 
 static inline dma_addr_t dma_direct_map_phys(struct device *dev,
 		phys_addr_t phys, size_t size, enum dma_data_direction dir,
-		unsigned long attrs)
+		unsigned long attrs, bool flush)
 {
 	dma_addr_t dma_addr;
 
@@ -114,7 +116,8 @@ static inline dma_addr_t dma_direct_map_phys(struct device *dev,
 	if (!dev_is_dma_coherent(dev) &&
 	    !(attrs & (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MMIO))) {
 		arch_sync_dma_for_device(phys, size, dir);
-		arch_sync_dma_flush();
+		if (flush)
+			arch_sync_dma_flush();
 	}
 	return dma_addr;
 
@@ -127,7 +130,8 @@ static inline dma_addr_t dma_direct_map_phys(struct device *dev,
 }
 
 static inline void dma_direct_unmap_phys(struct device *dev, dma_addr_t addr,
-		size_t size, enum dma_data_direction dir, unsigned long attrs)
+		size_t size, enum dma_data_direction dir, unsigned long attrs,
+		bool flush)
 {
 	phys_addr_t phys;
 
@@ -137,7 +141,7 @@ static inline void dma_direct_unmap_phys(struct device *dev, dma_addr_t addr,
 
 	phys = dma_to_phys(dev, addr);
 	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC))
-		dma_direct_sync_single_for_cpu(dev, addr, size, dir);
+		dma_direct_sync_single_for_cpu(dev, addr, size, dir, flush);
 
 	swiotlb_tbl_unmap_single(dev, phys, size, dir,
 					 attrs | DMA_ATTR_SKIP_CPU_SYNC);
diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index 37163eb49f9f..d8cfa56a3cbb 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -166,7 +166,7 @@ dma_addr_t dma_map_phys(struct device *dev, phys_addr_t phys, size_t size,
 
 	if (dma_map_direct(dev, ops) ||
 	    (!is_mmio && arch_dma_map_phys_direct(dev, phys + size)))
-		addr = dma_direct_map_phys(dev, phys, size, dir, attrs);
+		addr = dma_direct_map_phys(dev, phys, size, dir, attrs, true);
 	else if (use_dma_iommu(dev))
 		addr = iommu_dma_map_phys(dev, phys, size, dir, attrs);
 	else if (ops->map_phys)
@@ -207,7 +207,7 @@ void dma_unmap_phys(struct device *dev, dma_addr_t addr, size_t size,
 	BUG_ON(!valid_dma_direction(dir));
 	if (dma_map_direct(dev, ops) ||
 	    (!is_mmio && arch_dma_unmap_phys_direct(dev, addr + size)))
-		dma_direct_unmap_phys(dev, addr, size, dir, attrs);
+		dma_direct_unmap_phys(dev, addr, size, dir, attrs, true);
 	else if (use_dma_iommu(dev))
 		iommu_dma_unmap_phys(dev, addr, size, dir, attrs);
 	else if (ops->unmap_phys)
@@ -373,7 +373,7 @@ void __dma_sync_single_for_cpu(struct device *dev, dma_addr_t addr, size_t size,
 
 	BUG_ON(!valid_dma_direction(dir));
 	if (dma_map_direct(dev, ops))
-		dma_direct_sync_single_for_cpu(dev, addr, size, dir);
+		dma_direct_sync_single_for_cpu(dev, addr, size, dir, true);
 	else if (use_dma_iommu(dev))
 		iommu_dma_sync_single_for_cpu(dev, addr, size, dir);
 	else if (ops->sync_single_for_cpu)
-- 
2.43.0


