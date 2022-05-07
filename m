Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DA851E926
	for <lists+xen-devel@lfdr.de>; Sat,  7 May 2022 20:20:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.323755.545577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nnP1Y-0006lZ-35; Sat, 07 May 2022 18:19:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 323755.545577; Sat, 07 May 2022 18:19:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nnP1X-0006jM-W2; Sat, 07 May 2022 18:19:23 +0000
Received: by outflank-mailman (input) for mailman id 323755;
 Sat, 07 May 2022 18:19:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y6lb=VP=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nnP1V-0006Tm-Ow
 for xen-devel@lists.xenproject.org; Sat, 07 May 2022 18:19:21 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 36f9c426-ce32-11ec-a406-831a346695d4;
 Sat, 07 May 2022 20:19:21 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 m2-20020a1ca302000000b003943bc63f98so6129843wme.4
 for <xen-devel@lists.xenproject.org>; Sat, 07 May 2022 11:19:20 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 b10-20020a5d4d8a000000b0020c5253d8f3sm8198457wru.63.2022.05.07.11.19.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 07 May 2022 11:19:19 -0700 (PDT)
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
X-Inumbo-ID: 36f9c426-ce32-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=JdehnkGLqTKFFqJmno6u7ZfWHrdJGNPcR0+Jk9IE3ng=;
        b=W2CM1/+K9Zk1Kt7dirJgx2bl5Gzq0zuZnPN5BVRpPATox1liMddFAgkXT9YhMEJKJW
         3O660mwRMAf8TC005txxxBgmgrS9oiMeZwotoJPeew+vIvCdOm765wKV5c9x0BQ00/qM
         lOgnr6KN7alyGkPQQDDUnMJeacpkc2gh1QJmK01mhUdDzdgbsOjUoKte+pU3cJeipEuf
         YSvs0HkqOPU6wQ5cIxg7hJrG1hxCK2aJ4ZjSYAp3T1krrkp7p1CUCOkmJSjmRJV2FUhp
         N7Fr3JhClK19P4klrT/48MqsDShlu0CI9z8qoywZr6bhKFckl2kixdga3Z5rYAdM4lNL
         NeOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=JdehnkGLqTKFFqJmno6u7ZfWHrdJGNPcR0+Jk9IE3ng=;
        b=KJaxT8T12HeSmZK9j2tBWHIlTGJsmkd9MS4knL28sOpMmBfHi+265HQCtpvfS6CSx+
         jo3d1+W8kMiAeD4EUgxU3bUBrtsprPpDeVESpjMgKvI3FOWIVZ8mlRSEGh6C/6JYyxCx
         +It6wyniH31NSKtmgy5+XU48+B/gtpCYclL82nKMSS4bjwKxDPOxYngZ2hhiApZutMu1
         Adi3rpdxtRK5Q5Emr8zJbPDbI6E0rCemPH+RNVYG7vvHo1k3PpnTN1bOlMLim6otYj+0
         tbERcAJWLEDlW7lZVJO/6ZyKNPph3F6bsxU1XwdraeuYBTDU2KUsv5hgZJyWzCH7lDxs
         Txrg==
X-Gm-Message-State: AOAM531rKDnJgUwpnhw2iqbzm4QhteuDaLcLwm1yhqFhqstFUAfM9Fr9
	MsSFBsAIsnygeWlGihgxCu5JqxsA248=
X-Google-Smtp-Source: ABdhPJwcoJACAJIOBQsEykFr9K/bH+BLZEo0MgY60F8IfPkFfRkCVpyNg4ZkPrg0s2ewaX0SV0R9DQ==
X-Received: by 2002:a7b:c446:0:b0:394:3293:a88f with SMTP id l6-20020a7bc446000000b003943293a88fmr8943853wmi.22.1651947559848;
        Sat, 07 May 2022 11:19:19 -0700 (PDT)
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
Subject: [PATCH V2 1/7] arm/xen: Introduce xen_setup_dma_ops()
Date: Sat,  7 May 2022 21:19:02 +0300
Message-Id: <1651947548-4055-2-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1651947548-4055-1-git-send-email-olekstysh@gmail.com>
References: <1651947548-4055-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

This patch introduces new helper and places it in new header.
The helper's purpose is to assign any Xen specific DMA ops in
a single place. For now, we deal with xen-swiotlb DMA ops only.
The one of the subsequent commits in current series will add
xen-grant DMA ops case.

Also re-use the xen_swiotlb_detect() check on Arm32.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes RFC -> V1:
   - update commit description
   - move commit to the beginning of the series
   - move #ifdef CONFIG_XEN from dma-mapping.c to xen-ops.h

Changes V1 -> V2:
   - add Stefano's R-b
   - add missing SPDX-License-Identifier to xen-ops.h
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


