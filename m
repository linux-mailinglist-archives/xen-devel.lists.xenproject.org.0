Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4CA53886C
	for <lists+xen-devel@lfdr.de>; Mon, 30 May 2022 23:01:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.338744.563559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvmV5-0007TM-Pq; Mon, 30 May 2022 21:00:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 338744.563559; Mon, 30 May 2022 21:00:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvmV5-0007Nl-Ix; Mon, 30 May 2022 21:00:31 +0000
Received: by outflank-mailman (input) for mailman id 338744;
 Mon, 30 May 2022 21:00:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pxv1=WG=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nvmV4-0007Kr-9R
 for xen-devel@lists.xenproject.org; Mon, 30 May 2022 21:00:30 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 88138123-e05b-11ec-837f-e5687231ffcc;
 Mon, 30 May 2022 23:00:27 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id s6so2496158lfo.13
 for <xen-devel@lists.xenproject.org>; Mon, 30 May 2022 14:00:27 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 k21-20020a2ea275000000b0025550e2693asm581541ljm.38.2022.05.30.14.00.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 30 May 2022 14:00:26 -0700 (PDT)
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
X-Inumbo-ID: 88138123-e05b-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=bgYTJywCKcz2eZ3BdKiVmZnlK+gFcRjkQ0C/gcc8wL0=;
        b=WPbadUUFeZwVP4k9WAfhTLe83VpVBG119TgUz++U+jcFCuUBznYGsIC2lzKm27XdmH
         yXFP5yObX14uURGpzK7F5mfOnsgB0r/BmzpoUM+jVBTGg80yZgw9XLdeLfgwp9ErLoVW
         Q1TnTWrqcB0sDwHHSjrR/52HWB1qz43VoDo1QHHh9ceNvr40y+w6erOOroKP7WNK9jCV
         dGTfhe/dXDLi/T7GIkeydYCCaMf+TjgeRFjPvJnOV+kHivKBp/t3pH1T36Vqg8+3uxjR
         MnAy+xzObuU1AJa9GbSqXq88uHtnxJw/NER+9Xb7clISz49J9BSIQt8o8DWDArCwlTH1
         WvpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=bgYTJywCKcz2eZ3BdKiVmZnlK+gFcRjkQ0C/gcc8wL0=;
        b=7j/UclqJnDDuf4KbhQl9Rruk+2ZtuG8QzLH3gK/+/4kgDJBi3rLTR/SxzTXiqq/lvm
         RrrWpbzoYndQ1uyPDPnsBDOWFqXEJEWPHYatQLjou1npHVJSc7D3RVkrv4qt7i8DpsPH
         SMEXCBcs00Jn8psviLyGy42fcvSxlOueLpQ6Lu9uIHti+VCgz5sDAiYJLSpr+r7JKbyO
         eqSudO1e2EpSaCyNkFe4M6ExLTQme9bO79iqddDqh2imZLq7WD337aY+1w65I8avVnnj
         HxrCZgaG0CHdNkxv7wX2+4jfi5T9TSwtyiEJZMYLeo5TOsoAeGpDCiHDjjwqphYN/LBt
         iiQQ==
X-Gm-Message-State: AOAM531hPzpVW6x+Qd4vyFSUcZLT1FKCbI8wGzNelNRywsQMRsLi7xhN
	nXbxzacAb49gJfjH/UU0LDaL5yea7k4=
X-Google-Smtp-Source: ABdhPJxg9WbJjJF17bN45E1W6bO0HJs4dzI7IisXFVPM5nHpQcExbUbGQhg/zR9oTx50h6uUKqfR1w==
X-Received: by 2002:a05:6512:20c9:b0:477:cc4f:b816 with SMTP id u9-20020a05651220c900b00477cc4fb816mr38993759lfr.521.1653944426468;
        Mon, 30 May 2022 14:00:26 -0700 (PDT)
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
Subject: [PATCH V3 1/8] arm/xen: Introduce xen_setup_dma_ops()
Date: Tue, 31 May 2022 00:00:10 +0300
Message-Id: <1653944417-17168-2-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1653944417-17168-1-git-send-email-olekstysh@gmail.com>
References: <1653944417-17168-1-git-send-email-olekstysh@gmail.com>

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


