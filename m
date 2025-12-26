Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 774A7CDFD69
	for <lists+xen-devel@lfdr.de>; Sat, 27 Dec 2025 15:23:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1193526.1512235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vZVC7-0007Y2-9a; Sat, 27 Dec 2025 14:22:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1193526.1512235; Sat, 27 Dec 2025 14:22:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vZVC7-0007Rl-1h; Sat, 27 Dec 2025 14:22:59 +0000
Received: by outflank-mailman (input) for mailman id 1193526;
 Fri, 26 Dec 2025 22:54:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z/ld=7A=gmail.com=21cnbao@srs-se1.protection.inumbo.net>)
 id 1vZGhL-0005PO-LN
 for xen-devel@lists.xenproject.org; Fri, 26 Dec 2025 22:54:15 +0000
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [2607:f8b0:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cbe7e2de-e2ad-11f0-9ccf-f158ae23cfc8;
 Fri, 26 Dec 2025 23:54:13 +0100 (CET)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2a0c20ee83dso95951645ad.2
 for <xen-devel@lists.xenproject.org>; Fri, 26 Dec 2025 14:54:13 -0800 (PST)
Received: from barry-desktop.hub ([47.72.129.29])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34e772ac1acsm9981428a91.9.2025.12.26.14.54.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Dec 2025 14:54:11 -0800 (PST)
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
X-Inumbo-ID: cbe7e2de-e2ad-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766789652; x=1767394452; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9mp0y7L70LQWZn3MNrpl8AtI1agZhiyYjI11ja2HdtI=;
        b=iA9Z0ynNspOq4hSJCu4fV9+mYnLJtXYyW25dkUhEREUlxdQeFDubAKvcFB6pcDa2E3
         /EAXklbQWBf+MdkAyHuU5PbvSYeWjt9HWs8MEC8P/Oyh+qN/YFAKtYxevwZFdAstBre7
         NgvmY38+VuorWIQmppWX3GQjAUCTXoypzbUPt/hOU2C0XkUPrzZwgZUNy4R3aE/KL9s8
         xb8tfn9VekjPmtsK/e+ES+mLR4XJ+pacbAy8nv0yVH37O7SVbi3HDA8t9XRi6bGB3Kk+
         rjfkFVvJSi2zgq4w6HxIOqTzMby49TVSRWjcD8tOQhvSojiZjpxTFWGi/7Nu2wb+ynL7
         mPng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766789652; x=1767394452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9mp0y7L70LQWZn3MNrpl8AtI1agZhiyYjI11ja2HdtI=;
        b=P5ogKQGIHLxywtvHmQVO1q1kMLes/9h1IjUnQrjfTi9oHb7RWpe+D9V3mmN7kZa1yd
         ySFGowo2XcKDd5is5Br3No68PFIupoRkcPk5TqUw6O/Ua1dGcN8I/0CB2nfIDkxixOxO
         xgdsn9SOBsK9dCb3v3MijKFfUAahoOouJ9mnp5BL3ZF6Xg5hF119jGTrKQAjUJ1F5JcM
         7M2m6Oah7x+c9rSL8liVTgUwowFrTe9oggT/IaQJoV9N7Jvgq5TWgPoyrMXRhC5lY1py
         Qerm8eNeuDRa/i8LAMpqfV5QZ8/yolgBz+5cPnhFoETbWP9cOYS162bTMBj69iKZywfC
         XxOA==
X-Forwarded-Encrypted: i=1; AJvYcCXugTLxCNTCQHdWretT6O5e+xMC8tGq28s6z/vD7RifRRmNPhhPRN+e2hMDobPNOnObVrjgq1XVMS4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyh4b6Zuhbhe4MlDyyv7XCn9AoFuoRV7wdGIwObRCdLY2u9Iy4F
	irPmQdgqpWZrjIhr/lfahKQMNVmM3e+GdCUvdBg2Vr31f5APFPwk2Nq1
X-Gm-Gg: AY/fxX6iHU+qnMqSezYHR543BpwV4/g7h2SyT1fkdrlgfvWH5/pnK8C0u3itiY9VwO7
	uhPIi60XFz/SViMiHgLLs+tTHmiNoR7VMJrJG76/XpH+8D5v1ym9OGto6dgEbmg8jVQftlbnfQk
	nMFu66DN41DFO++unmB8AtC8nzq5eqo74DoBzdly37/GVQ9JmXZiXi3XuoqBlyz3SuPAootMKzK
	HmqudFhQLa7DLi4SOzAZPjeCmOUHa+o6BRzbxfYvRhOvse/Wpp8/ETULDhopwMTV4dUveQ3/ieo
	9eyPx1J/WrRQq1nFz/C5tTLtqp/dfLwIwipcrRIf7NvVABizg5kxMrY2FF5am+BeX2zZQHS5b8Q
	WzLeOeq/CqCXwx5YXNeQZpFp2Ff0eQXMcCckKHghFnXcP0fYOwxEBz0gUqZQXy4e08Z0ppnZA8D
	q6LJkkERrrcIOx
X-Google-Smtp-Source: AGHT+IH3Qyivahvz1Re89nhjkOGapFSbuTfRVGKZtZJZOQKn2pFT9vJfuh0AHXHFbf1hI+2p00nHuQ==
X-Received: by 2002:a17:902:f607:b0:2a1:4c31:335 with SMTP id d9443c01a7336-2a2f2717b88mr227808145ad.26.1766789652012;
        Fri, 26 Dec 2025 14:54:12 -0800 (PST)
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
	Joerg Roedel <joro@8bytes.org>,
	Tangquan Zheng <zhengtangquan@oppo.com>
Subject: [PATCH RFC v2 7/8] dma-iommu: Support DMA sync batch mode for IOVA link and unlink
Date: Sat, 27 Dec 2025 11:52:47 +1300
Message-ID: <20251226225254.46197-8-21cnbao@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251226225254.46197-1-21cnbao@gmail.com>
References: <20251226225254.46197-1-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Barry Song <baohua@kernel.org>

Apply batched DMA synchronization to __dma_iova_link() and
iommu_dma_iova_unlink_range_slow(). For multiple
sync_dma_for_device() and sync_dma_for_cpu() calls, we only
need to wait once for the completion of all sync operations,
rather than waiting for each one individually.

I do not have the hardware to test this, so it is marked as
RFC. I would greatly appreciate it if someone could test it.

Suggested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Leon Romanovsky <leon@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: Tangquan Zheng <zhengtangquan@oppo.com>
Signed-off-by: Barry Song <baohua@kernel.org>
---
 drivers/iommu/dma-iommu.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 6827763a3877..ffa940bdbbaf 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -1849,10 +1849,8 @@ static int __dma_iova_link(struct device *dev, dma_addr_t addr,
 	bool coherent = dev_is_dma_coherent(dev);
 	int prot = dma_info_to_prot(dir, coherent, attrs);
 
-	if (!coherent && !(attrs & (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MMIO))) {
+	if (!coherent && !(attrs & (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MMIO)))
 		arch_sync_dma_for_device(phys, size, dir);
-		arch_sync_dma_flush();
-	}
 
 	return iommu_map_nosync(iommu_get_dma_domain(dev), addr, phys, size,
 			prot, GFP_ATOMIC);
@@ -1995,6 +1993,8 @@ int dma_iova_sync(struct device *dev, struct dma_iova_state *state,
 	dma_addr_t addr = state->addr + offset;
 	size_t iova_start_pad = iova_offset(iovad, addr);
 
+	if (!dev_is_dma_coherent(dev))
+		arch_sync_dma_flush();
 	return iommu_sync_map(domain, addr - iova_start_pad,
 		      iova_align(iovad, size + iova_start_pad));
 }
@@ -2008,6 +2008,8 @@ static void iommu_dma_iova_unlink_range_slow(struct device *dev,
 	struct iommu_dma_cookie *cookie = domain->iova_cookie;
 	struct iova_domain *iovad = &cookie->iovad;
 	size_t iova_start_pad = iova_offset(iovad, addr);
+	bool need_sync_dma = !dev_is_dma_coherent(dev) &&
+			!(attrs & (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MMIO));
 	dma_addr_t end = addr + size;
 
 	do {
@@ -2023,16 +2025,17 @@ static void iommu_dma_iova_unlink_range_slow(struct device *dev,
 			end - addr, iovad->granule - iova_start_pad);
 
 		if (!dev_is_dma_coherent(dev) &&
-		    !(attrs & (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MMIO))) {
+		    !(attrs & (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MMIO)))
 			arch_sync_dma_for_cpu(phys, len, dir);
-			arch_sync_dma_flush();
-		}
 
 		swiotlb_tbl_unmap_single(dev, phys, len, dir, attrs);
 
 		addr += len;
 		iova_start_pad = 0;
 	} while (addr < end);
+
+	if (need_sync_dma)
+		arch_sync_dma_flush();
 }
 
 static void __iommu_dma_iova_unlink(struct device *dev,
-- 
2.43.0


