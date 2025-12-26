Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3224FCDFD5C
	for <lists+xen-devel@lfdr.de>; Sat, 27 Dec 2025 15:23:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1193528.1512245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vZVC7-0007k6-TQ; Sat, 27 Dec 2025 14:22:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1193528.1512245; Sat, 27 Dec 2025 14:22:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vZVC7-0007Xk-Hi; Sat, 27 Dec 2025 14:22:59 +0000
Received: by outflank-mailman (input) for mailman id 1193528;
 Fri, 26 Dec 2025 22:54:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z/ld=7A=gmail.com=21cnbao@srs-se1.protection.inumbo.net>)
 id 1vZGhS-0005PO-Lm
 for xen-devel@lists.xenproject.org; Fri, 26 Dec 2025 22:54:22 +0000
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [2607:f8b0:4864:20::102b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d04d09cc-e2ad-11f0-9ccf-f158ae23cfc8;
 Fri, 26 Dec 2025 23:54:21 +0100 (CET)
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-34c27d14559so5934637a91.2
 for <xen-devel@lists.xenproject.org>; Fri, 26 Dec 2025 14:54:20 -0800 (PST)
Received: from barry-desktop.hub ([47.72.129.29])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34e772ac1acsm9981428a91.9.2025.12.26.14.54.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Dec 2025 14:54:18 -0800 (PST)
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
X-Inumbo-ID: d04d09cc-e2ad-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766789659; x=1767394459; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=beONI3EcXYpecg+Q1bsEm+B77vz1JdIzHQgAsq5N5yU=;
        b=Bi+d2Xe6EpYxalXODCZaNgz1pxYc+/9EgXuB1brz7fM+MjinuVIIO8zW0xOQnN3a3P
         4JO8+ZLoIKPuitnMaSxsmZ5daFpXV/r3zXdLXJ1EQ0kz/1GfCiXbxbLdbtEAofT9czIV
         3DPwNecDjBHeA7QMMIkLpG3Q8bpMrfNb/Ecqoi4XKUwJ4doU4iZdkOi4XgfLiezht/i4
         4m5INJ02Hn6wnb1O09G4MbYS3v+hEaODE28mlJgXBS7Y42FZetQAowA7NYhLrc4wIqUP
         70OW3KOG6ObB/DiFmeASK557lu/jW8XLHsEB88QJvHgXrfwB9T2VMIWZa0/suuOUckas
         nVOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766789659; x=1767394459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=beONI3EcXYpecg+Q1bsEm+B77vz1JdIzHQgAsq5N5yU=;
        b=hWUvpnfuf0G91bIS53viuycXK+nT6P0eKLs7Q8f3eGLZmKg4+vuativTThgoX7K1OZ
         9rWmOxpLl1GGshPuev5qAzs5XTNX7DQTGgkl8vlmXzqTxHCMHPouNbPePexQUVIebakW
         GIC07FPKKd61Ja7jg3R8nuPnsTyoHHmH6vcxSf8KCS/sto1bdrGU8fqmx/XzypQ/fF4c
         KaB3Q+YxQW6ze5zdN0ehKLOlXRghyNM1NNpg8cjfq1gD1OVNLBKSXEeqzv+vk6HSPcdy
         sQYSZ3XF7gfJb2KMUrKGExVv/8QXZjX8Uxo5u/GEAPZ3eQvWOKEfJRjqk/Ll+RKEXrzk
         VApA==
X-Forwarded-Encrypted: i=1; AJvYcCWCdj1ThwzaO8YgkVF5xD61AfUfZ2pJfF6tSG61ONAGcyblinzMFnLKUOCkkVMEOClroswzRlXKm8k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxKy3Phzog8acydMw94lQYXT3bt0MDC03DLhRJL3HJ/S23QvPnc
	xNUa5maNcjrTsDNLtG3cHWfCuyNjjZq6v7FX/bjvWUpfSZTe4vuDkAS4
X-Gm-Gg: AY/fxX5OEfhNguJ920YDimAphHQTYlCBvexY21xzxlUGsd7w7MMU0P+qoule5XIhmWd
	OolVKYUk4l1P/h73jPfd/+obAnO9jrLYg0DKloDS3MUaSu7VKtJq8KQv1LEs96AGdEpD6XRwGoq
	CeUOmAUu09GesIuUKBBuxtf10+f5ogTsWIIt3exyxN0V+VAgN04kEOMIkdtu/Xg1gVYQwsSa73C
	tomTSjyap4kKn3Pp9SFlP94BRTIaAlI9bZOSSvYtTWvindr2/iJ24owVuuaBSpR8ztTkA4SG/PX
	5Fo3HcdzHDrGhKe3YG5Ip4yn3Qtbbcbk7pkvbzCW5070jWx/y1h6Rnp2RXB/3LZNZct1nhWXhrh
	MtMYXXT9vM/JXCMvdk+Ec03kf3Z3vF3scyfNRa3aRLySqpF4eDyBMQIhQMEQ+DJvcIjPzdw4js1
	2QCtOSxHsCsmPU
X-Google-Smtp-Source: AGHT+IF3FBOgnhAE+C4yK80l6tVlXmB4Rfi7fJf1frV3RXQh1+Ry7oysljXY9g9IJMnKqHJpP4IhrA==
X-Received: by 2002:a17:90b:2787:b0:33b:cbb2:31ed with SMTP id 98e67ed59e1d1-34e91f6398cmr20025228a91.0.1766789659345;
        Fri, 26 Dec 2025 14:54:19 -0800 (PST)
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
Subject: [PATCH RFC v2 8/8] dma-iommu: Support DMA sync batch mode for iommu_dma_sync_sg_for_{cpu, device}
Date: Sat, 27 Dec 2025 11:52:48 +1300
Message-ID: <20251226225254.46197-9-21cnbao@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251226225254.46197-1-21cnbao@gmail.com>
References: <20251226225254.46197-1-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Barry Song <baohua@kernel.org>

Apply batched DMA synchronization to iommu_dma_sync_sg_for_cpu() and
iommu_dma_sync_sg_for_device(). For all buffers in an SG list, only
a single flush operation is needed.

I do not have the hardware to test this, so the patch is marked as
RFC. I would greatly appreciate any testing feedback.

Cc: Leon Romanovsky <leon@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
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
 drivers/iommu/dma-iommu.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index ffa940bdbbaf..b68dbfcb7846 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -1131,10 +1131,9 @@ void iommu_dma_sync_sg_for_cpu(struct device *dev, struct scatterlist *sgl,
 			iommu_dma_sync_single_for_cpu(dev, sg_dma_address(sg),
 						      sg->length, dir);
 	} else if (!dev_is_dma_coherent(dev)) {
-		for_each_sg(sgl, sg, nelems, i) {
+		for_each_sg(sgl, sg, nelems, i)
 			arch_sync_dma_for_cpu(sg_phys(sg), sg->length, dir);
-			arch_sync_dma_flush();
-		}
+		arch_sync_dma_flush();
 	}
 }
 
@@ -1144,16 +1143,16 @@ void iommu_dma_sync_sg_for_device(struct device *dev, struct scatterlist *sgl,
 	struct scatterlist *sg;
 	int i;
 
-	if (sg_dma_is_swiotlb(sgl))
+	if (sg_dma_is_swiotlb(sgl)) {
 		for_each_sg(sgl, sg, nelems, i)
 			iommu_dma_sync_single_for_device(dev,
 							 sg_dma_address(sg),
 							 sg->length, dir);
-	else if (!dev_is_dma_coherent(dev))
-		for_each_sg(sgl, sg, nelems, i) {
+	} else if (!dev_is_dma_coherent(dev)) {
+		for_each_sg(sgl, sg, nelems, i)
 			arch_sync_dma_for_device(sg_phys(sg), sg->length, dir);
-			arch_sync_dma_flush();
-		}
+		arch_sync_dma_flush();
+	}
 }
 
 static phys_addr_t iommu_dma_map_swiotlb(struct device *dev, phys_addr_t phys,
-- 
2.43.0


