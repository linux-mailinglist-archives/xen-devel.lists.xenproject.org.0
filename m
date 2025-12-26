Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 949EACDFD6A
	for <lists+xen-devel@lfdr.de>; Sat, 27 Dec 2025 15:23:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1193522.1512222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vZVC6-0007MG-QF; Sat, 27 Dec 2025 14:22:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1193522.1512222; Sat, 27 Dec 2025 14:22:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vZVC6-0007Gr-HA; Sat, 27 Dec 2025 14:22:58 +0000
Received: by outflank-mailman (input) for mailman id 1193522;
 Fri, 26 Dec 2025 22:53:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z/ld=7A=gmail.com=21cnbao@srs-se1.protection.inumbo.net>)
 id 1vZGh5-0005LS-MD
 for xen-devel@lists.xenproject.org; Fri, 26 Dec 2025 22:53:59 +0000
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [2607:f8b0:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c2cf0b1d-e2ad-11f0-b15c-2bf370ae4941;
 Fri, 26 Dec 2025 23:53:58 +0100 (CET)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-2a0c20ee83dso95950165ad.2
 for <xen-devel@lists.xenproject.org>; Fri, 26 Dec 2025 14:53:58 -0800 (PST)
Received: from barry-desktop.hub ([47.72.129.29])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34e772ac1acsm9981428a91.9.2025.12.26.14.53.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Dec 2025 14:53:55 -0800 (PST)
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
X-Inumbo-ID: c2cf0b1d-e2ad-11f0-b15c-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766789637; x=1767394437; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6SwUY+FTc0pZhvaABGOEZvH4DFh2qP62P2nENr8WNe8=;
        b=UVmJFTOlGtzAxAt6hordVrb90Q76tvcAk3xlKFe+27k4A1w+Dk6F28KZ622R/4shId
         +l6fHi7oZa+3V5/tb03Ens6SBGE7CI0lhmgRduNjP5eiRZeCJ+cwdAVXETkQAu8KcXYX
         NHD6LRj292RykVYoELrGMzHW3I5cXSz/WsDxzlEXWioKl+SHsUZOEMTsRW2HJui6pm0v
         ZWGYG2LIgLRxyJS4tndGGbsUGdgScJctXnNtTwqYOTGTx2dWmXcFbIVmwIGMuW29/uSv
         dsm9iSR+ppYgdoE1FcotwIbkrb8nzwVDFOeBkdGa0Dx3PwJS4VjGqujmH7cSGDqgwkDh
         O4gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766789637; x=1767394437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6SwUY+FTc0pZhvaABGOEZvH4DFh2qP62P2nENr8WNe8=;
        b=EtUQA+ei9xj/FlpFweGzjAd5CxBVB06Yf/w6TQBSVBwfiMwMQf6Qusf+7UC9PRboWD
         aFShUbYAsPtLDsqvzK4Q+0sKNG0SUoYfTiEXvavBlBZFGEE88nN+/nnn0EzB4m5XEabJ
         QSMY4dC/NUVVONuCHZWVOELWth6L6afP+InavfWhjqh1tBZcMNC+m04N0frMjix8PTZf
         F2VKNbG7KEi8PXVRFPFF7zhvKM4fSKxyBpgrLXF5sTeqqIUgB9hMuh3aiW4sKNrOuIBH
         /2YOy25ogZxHORTq4V4WXdVLFSXh0UqjHAFgeReM5RAYDI5Wd4nrKZDs8zv4HEdAXeYT
         yCaA==
X-Forwarded-Encrypted: i=1; AJvYcCUifogUQ5CV/qrbBs38ZUlGqeq4OZon4SUVJsTxyG8rJJEab/xaeVWZCDMSL252JEZcQ7Yv3NmblMY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwcojJ+GolqUF+WrEiEGF84TnhqtKBVy5ZDsnHzVWide0+GvMdv
	ZOe5hNBlCI9dqszu2ZAHmwY0Qu+/nDa+cKgkd90hFEE1tpnMF4J7s/ov
X-Gm-Gg: AY/fxX63sCuBAAuJ0rfeAUd/ieVrTWUcbNFgqpQeSWsmZuFfe2x98dcfPy8mqR8wGwu
	vARgU6eAZ5nW+2/fspfCNDMij2+IEKixUQ6Z+Jef6jJ2zXFkz216DIT9ueXkwXG0PwFpxBvM+on
	6F4ncqbFdpDRH9TnRauFU3JL8kjOiG/GLNePt6t9gjQ8AXOyff6Ps30nNxwCwcPb67Wl/aUotT2
	2ztRHA07xDN1uwAymBmfgl39uV4/z90Ku+ZIy5zI1yV+ZVlL+96Jq+V08R5/htJeKiGY9Jp6phT
	YkVsjqrSEDrTODnTPbFMN27VXC7N1KJm4zwY2a0eRIkoEvQR7gzC6NH2ep2yGbA1i3Io4mj8PwO
	CI4N/tpYjvimtzWqCvxBmOusS5SthTWLm2mGnU2TzKRy3/bVnPLw/2OUrQ2aHs45Y5yKV9GOWFQ
	n2HnI/jR6B12PffWD/r+2JX/s=
X-Google-Smtp-Source: AGHT+IHzo7zg63L6IUIixvYNdgE1EhLj43E4LWUqmZi99iaSKAA/lUr+ts9Nayt1nnGWbam/Z3t7Yw==
X-Received: by 2002:a17:903:1670:b0:2a2:bff6:42f2 with SMTP id d9443c01a7336-2a2f222b664mr247962585ad.6.1766789636697;
        Fri, 26 Dec 2025 14:53:56 -0800 (PST)
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
Subject: [PATCH v2 5/8] dma-mapping: Support batch mode for dma_direct_sync_sg_for_*
Date: Sat, 27 Dec 2025 11:52:45 +1300
Message-ID: <20251226225254.46197-6-21cnbao@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251226225254.46197-1-21cnbao@gmail.com>
References: <20251226225254.46197-1-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Barry Song <baohua@kernel.org>

Instead of performing a flush per SG entry, issue all cache
operations first and then flush once. This ultimately benefits
__dma_sync_sg_for_cpu() and __dma_sync_sg_for_device().

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
 kernel/dma/direct.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index a219911c7b90..98bacf562ca1 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -402,12 +402,12 @@ void dma_direct_sync_sg_for_device(struct device *dev,
 
 		swiotlb_sync_single_for_device(dev, paddr, sg->length, dir);
 
-		if (!dev_is_dma_coherent(dev)) {
+		if (!dev_is_dma_coherent(dev))
 			arch_sync_dma_for_device(paddr, sg->length,
 					dir);
-			arch_sync_dma_flush();
-		}
 	}
+	if (!dev_is_dma_coherent(dev))
+		arch_sync_dma_flush();
 }
 #endif
 
@@ -423,10 +423,8 @@ void dma_direct_sync_sg_for_cpu(struct device *dev,
 	for_each_sg(sgl, sg, nents, i) {
 		phys_addr_t paddr = dma_to_phys(dev, sg_dma_address(sg));
 
-		if (!dev_is_dma_coherent(dev)) {
+		if (!dev_is_dma_coherent(dev))
 			arch_sync_dma_for_cpu(paddr, sg->length, dir);
-			arch_sync_dma_flush();
-		}
 
 		swiotlb_sync_single_for_cpu(dev, paddr, sg->length, dir);
 
@@ -434,8 +432,10 @@ void dma_direct_sync_sg_for_cpu(struct device *dev,
 			arch_dma_mark_clean(paddr, sg->length);
 	}
 
-	if (!dev_is_dma_coherent(dev))
+	if (!dev_is_dma_coherent(dev)) {
+		arch_sync_dma_flush();
 		arch_sync_dma_for_cpu_all();
+	}
 }
 
 /*
-- 
2.43.0


