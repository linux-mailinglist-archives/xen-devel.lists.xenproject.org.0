Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C456653BEB4
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jun 2022 21:24:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.341180.566370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwqQf-0008SF-81; Thu, 02 Jun 2022 19:24:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 341180.566370; Thu, 02 Jun 2022 19:24:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwqQf-0008PN-52; Thu, 02 Jun 2022 19:24:21 +0000
Received: by outflank-mailman (input) for mailman id 341180;
 Thu, 02 Jun 2022 19:24:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2EeJ=WJ=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nwqQd-00089L-4f
 for xen-devel@lists.xenproject.org; Thu, 02 Jun 2022 19:24:19 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 98b1a4dd-e2a9-11ec-837f-e5687231ffcc;
 Thu, 02 Jun 2022 21:24:18 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id q21so11856781ejm.1
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jun 2022 12:24:18 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 eg13-20020a056402288d00b0042dce73168csm2938301edb.13.2022.06.02.12.24.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 Jun 2022 12:24:16 -0700 (PDT)
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
X-Inumbo-ID: 98b1a4dd-e2a9-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/L1IBgi9+X4DxS9TjixiTB4nno95/1qL4aRB/Scae3U=;
        b=PdMHt1DvZ7GZsF7P5quJKwTE1RemEmJBXxcg/aCxYvaydLb4PFeaY8Y6CVo4/M9GgY
         LNyj2unnT6aDkt+8WZrYPgzMfhGhVS2C2Ofj4o5wz+4WmSS0NbOYsWq+JExbrA7VxMNZ
         Ig4sZQo92K4+ePFs4E+3BXTSh1I0fUku9zsxxNzN9VD7wEPxoMpdEKttAxh41dbGxpfk
         aKzfERQE2/K4Vktnpj+ymUwmiqfjIfHIaPZJy9RB8VjwUUQ263jJq7ghMhG+Saaqh8z/
         qUljmEwqX5BdWF3vI+z6/YOFY0Dva333dCwiwx/SubCsLzwilyOWqaHsRp9VxXhS5BZD
         HPGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/L1IBgi9+X4DxS9TjixiTB4nno95/1qL4aRB/Scae3U=;
        b=nSWabWPFdxVNmNJ+b/SAw+R8Hy90Fs0sAUTfdLS+/N29/3lXXml1b1bS0Zfb1xe0WU
         Hs4QuMQNen4HnKXW9542pWPMkHIVmEkFgR7cipYl7BdaAUrpgFcdCIddQDkYaXtchODo
         yktXH38O9I/56aKwOVGLwraatd0Vzl2IdJy/MyDlkixVjAoPEXgMKGPUtlXlf9Oi2JX7
         GnffavpmEw/9lpt7jWCb2GXbfQ0j6P+dKkdfgsS4YHf9lgc4mYHAYZsNnODo7rRqX6Sr
         SG4WeX06+DIyT8X0hnf68f8X41UbfKCJAuEntfltwcqdovadzNdWbQ8E3EoQd28hTWsN
         3U9Q==
X-Gm-Message-State: AOAM530znBfVHWDuDNxLXxhKNf6aX67vpA6D9MvEyQuWqg9ShxaGh+bP
	zj0GHT2ij1abPTME3XNKAsktyAKqfaM=
X-Google-Smtp-Source: ABdhPJwkE0CY+6aNgdFvX0fyrcHX18bhVxjbK2OvCM9lOWCS4spnr1FzK55RdPxwGJ6AbQ3Ea+5Sgg==
X-Received: by 2002:a17:907:2d86:b0:6ff:14d1:b29d with SMTP id gt6-20020a1709072d8600b006ff14d1b29dmr5508138ejc.17.1654197857434;
        Thu, 02 Jun 2022 12:24:17 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Christoph Hellwig <hch@infradead.org>
Subject: [PATCH V4 1/8] arm/xen: Introduce xen_setup_dma_ops()
Date: Thu,  2 Jun 2022 22:23:46 +0300
Message-Id: <1654197833-25362-2-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1654197833-25362-1-git-send-email-olekstysh@gmail.com>
References: <1654197833-25362-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

This patch introduces new helper and places it in new header.
The helper's purpose is to assign any Xen specific DMA ops in
a single place. For now, we deal with xen-swiotlb DMA ops only.
The one of the subsequent commits in current series will add
xen-grant DMA ops case.

Also re-use the xen_swiotlb_detect() check on Arm32.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
[For arm64]
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
---
Changes RFC -> V1:
   - update commit description
   - move commit to the beginning of the series
   - move #ifdef CONFIG_XEN from dma-mapping.c to xen-ops.h

Changes V1 -> V2:
   - add Stefano's R-b
   - add missing SPDX-License-Identifier to xen-ops.h

Changes V2 -> V3:
   - add Catalin's A-b

Changes V3 -> V4:
   - no changes
---
 arch/arm/include/asm/xen/xen-ops.h   |  2 ++
 arch/arm/mm/dma-mapping.c            |  7 ++-----
 arch/arm64/include/asm/xen/xen-ops.h |  2 ++
 arch/arm64/mm/dma-mapping.c          |  7 ++-----
 include/xen/arm/xen-ops.h            | 15 +++++++++++++++
 5 files changed, 23 insertions(+), 10 deletions(-)
 create mode 100644 arch/arm/include/asm/xen/xen-ops.h
 create mode 100644 arch/arm64/include/asm/xen/xen-ops.h
 create mode 100644 include/xen/arm/xen-ops.h

diff --git a/arch/arm/include/asm/xen/xen-ops.h b/arch/arm/include/asm/xen/xen-ops.h
new file mode 100644
index 00000000..7ebb7eb
--- /dev/null
+++ b/arch/arm/include/asm/xen/xen-ops.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <xen/arm/xen-ops.h>
diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
index 82ffac6..059cce0 100644
--- a/arch/arm/mm/dma-mapping.c
+++ b/arch/arm/mm/dma-mapping.c
@@ -33,7 +33,7 @@
 #include <asm/dma-iommu.h>
 #include <asm/mach/map.h>
 #include <asm/system_info.h>
-#include <xen/swiotlb-xen.h>
+#include <asm/xen/xen-ops.h>
 
 #include "dma.h"
 #include "mm.h"
@@ -2287,10 +2287,7 @@ void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
 
 	set_dma_ops(dev, dma_ops);
 
-#ifdef CONFIG_XEN
-	if (xen_initial_domain())
-		dev->dma_ops = &xen_swiotlb_dma_ops;
-#endif
+	xen_setup_dma_ops(dev);
 	dev->archdata.dma_ops_setup = true;
 }
 
diff --git a/arch/arm64/include/asm/xen/xen-ops.h b/arch/arm64/include/asm/xen/xen-ops.h
new file mode 100644
index 00000000..7ebb7eb
--- /dev/null
+++ b/arch/arm64/include/asm/xen/xen-ops.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <xen/arm/xen-ops.h>
diff --git a/arch/arm64/mm/dma-mapping.c b/arch/arm64/mm/dma-mapping.c
index 6719f9e..6099c81 100644
--- a/arch/arm64/mm/dma-mapping.c
+++ b/arch/arm64/mm/dma-mapping.c
@@ -9,9 +9,9 @@
 #include <linux/dma-map-ops.h>
 #include <linux/dma-iommu.h>
 #include <xen/xen.h>
-#include <xen/swiotlb-xen.h>
 
 #include <asm/cacheflush.h>
+#include <asm/xen/xen-ops.h>
 
 void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
 		enum dma_data_direction dir)
@@ -52,8 +52,5 @@ void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
 	if (iommu)
 		iommu_setup_dma_ops(dev, dma_base, dma_base + size - 1);
 
-#ifdef CONFIG_XEN
-	if (xen_swiotlb_detect())
-		dev->dma_ops = &xen_swiotlb_dma_ops;
-#endif
+	xen_setup_dma_ops(dev);
 }
diff --git a/include/xen/arm/xen-ops.h b/include/xen/arm/xen-ops.h
new file mode 100644
index 00000000..288deb1
--- /dev/null
+++ b/include/xen/arm/xen-ops.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_ARM_XEN_OPS_H
+#define _ASM_ARM_XEN_OPS_H
+
+#include <xen/swiotlb-xen.h>
+
+static inline void xen_setup_dma_ops(struct device *dev)
+{
+#ifdef CONFIG_XEN
+	if (xen_swiotlb_detect())
+		dev->dma_ops = &xen_swiotlb_dma_ops;
+#endif
+}
+
+#endif /* _ASM_ARM_XEN_OPS_H */
-- 
2.7.4


