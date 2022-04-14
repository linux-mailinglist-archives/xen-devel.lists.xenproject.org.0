Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAA9501BAE
	for <lists+xen-devel@lfdr.de>; Thu, 14 Apr 2022 21:20:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.305050.519910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nf50N-0006O9-Bi; Thu, 14 Apr 2022 19:19:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 305050.519910; Thu, 14 Apr 2022 19:19:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nf50N-0006J6-3T; Thu, 14 Apr 2022 19:19:47 +0000
Received: by outflank-mailman (input) for mailman id 305050;
 Thu, 14 Apr 2022 19:19:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RCiM=UY=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nf50L-0005Nh-I8
 for xen-devel@lists.xenproject.org; Thu, 14 Apr 2022 19:19:45 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d788765a-bc27-11ec-a405-831a346695d4;
 Thu, 14 Apr 2022 21:19:44 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id b21so10777111lfb.5
 for <xen-devel@lists.xenproject.org>; Thu, 14 Apr 2022 12:19:44 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a194943000000b0046b928d2795sm85001lfj.67.2022.04.14.12.19.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 14 Apr 2022 12:19:43 -0700 (PDT)
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
X-Inumbo-ID: d788765a-bc27-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=lMGcVfKV8sctWGleZvUOf73V/MSGq5S+Npr1qVNtBaA=;
        b=HouaAb9VHQFNGxR9MIu6VzU91fVp9m4H9MFuGHWemt2O82W51Jf7w0svknXQnp9eoL
         Goijg/CjOJm12gw7O79o4tOKKi3VWVpFlGcCExQrgrgWjTLybck87oaBE8839ZFvqsgt
         PHA9UIv4u9ZIJ0KRv79B8BNi7Ma48plv0i8Ikw6DPDjZOba9itZELQd6iL42ER4Do5KC
         KnGW1lDf5sUT5lSWC5BOctu4TM3VkGzNie7bvNS2Bn7x53eayd0Dgb1qqP6phAjj3tzd
         uRuUa2wtuEaXrTf/kpJoJpqL9whQiLU0m+UmApeEsmIl/mWjegT0468noSCexcMl91FI
         NpKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=lMGcVfKV8sctWGleZvUOf73V/MSGq5S+Npr1qVNtBaA=;
        b=MLZV1woHGMPXjj97f21iis6hTFiZ4Sb+0Kp3cFo1vnj6cEWqpeujGqjL311nWBhNX2
         t/rRh8b2dxzKAqf85apkDW47KT4ahAuVuu9wNbm1YuyJpZVl4pmbWESeQ2cxjPyV8DFr
         2oCrqk0Qyo/6unaR39nGvzjttwU0fiWhBAiwc3QZvnluq6DboqYrw8U9MQfvLunPmi1U
         ioUCk8CP1IkDEV5h+EuaJK54SE8/BLJ0NKqiqAoYMoqte1fWRxsd0GWrs+kbNMkPMej2
         h8PvDkJgrUhDYRImSTUQWcroXBVBXMLVMuqGmORoARMLlL+MVz/fClLoMkfFLMSVYrUH
         Y3Ng==
X-Gm-Message-State: AOAM530zbh5ClJsjSXhwi+UeZ92gQFR0ayKC/Ndxu0/ADc+wOK8+28Pv
	gIE2FT39txPv/j6kzn1I7M2jzPrKubM=
X-Google-Smtp-Source: ABdhPJyqpKzQq/8peqyhT0SdO2Fz0WkprUG2NmtNhK+vB9NhUMwVEFgX8mPVozIXpha113okS20X4g==
X-Received: by 2002:a05:6512:3f97:b0:44a:f67d:7d8 with SMTP id x23-20020a0565123f9700b0044af67d07d8mr2755017lfa.81.1649963984241;
        Thu, 14 Apr 2022 12:19:44 -0700 (PDT)
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
	Logan Gunthorpe <logang@deltatee.com>,
	David Hildenbrand <david@redhat.com>,
	Martin Oliveira <martin.oliveira@eideticom.com>,
	Kees Cook <keescook@chromium.org>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Julien Grall <julien@xen.org>
Subject: [RFC PATCH 5/6] arm/xen: Introduce xen_setup_dma_ops()
Date: Thu, 14 Apr 2022 22:19:32 +0300
Message-Id: <1649963973-22879-6-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1649963973-22879-1-git-send-email-olekstysh@gmail.com>
References: <1649963973-22879-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

This patch introduces new helper and places it in new header.
The helper's purpose is to assign any Xen specific DMA ops in
a single place. For now, we deal with xen-swiotlb DMA ops only.
The subsequent patch will add xen-virtio DMA ops case.

Also re-use the xen_swiotlb_detect() check on Arm32.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
 arch/arm/include/asm/xen/xen-ops.h   |  1 +
 arch/arm/mm/dma-mapping.c            |  5 ++---
 arch/arm64/include/asm/xen/xen-ops.h |  1 +
 arch/arm64/mm/dma-mapping.c          |  5 ++---
 include/xen/arm/xen-ops.h            | 13 +++++++++++++
 5 files changed, 19 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm/include/asm/xen/xen-ops.h
 create mode 100644 arch/arm64/include/asm/xen/xen-ops.h
 create mode 100644 include/xen/arm/xen-ops.h

diff --git a/arch/arm/include/asm/xen/xen-ops.h b/arch/arm/include/asm/xen/xen-ops.h
new file mode 100644
index 00000000..8d2fa24
--- /dev/null
+++ b/arch/arm/include/asm/xen/xen-ops.h
@@ -0,0 +1 @@
+#include <xen/arm/xen-ops.h>
diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
index 82ffac6..a1bf9dd 100644
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
@@ -2288,8 +2288,7 @@ void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
 	set_dma_ops(dev, dma_ops);
 
 #ifdef CONFIG_XEN
-	if (xen_initial_domain())
-		dev->dma_ops = &xen_swiotlb_dma_ops;
+	xen_setup_dma_ops(dev);
 #endif
 	dev->archdata.dma_ops_setup = true;
 }
diff --git a/arch/arm64/include/asm/xen/xen-ops.h b/arch/arm64/include/asm/xen/xen-ops.h
new file mode 100644
index 00000000..8d2fa24
--- /dev/null
+++ b/arch/arm64/include/asm/xen/xen-ops.h
@@ -0,0 +1 @@
+#include <xen/arm/xen-ops.h>
diff --git a/arch/arm64/mm/dma-mapping.c b/arch/arm64/mm/dma-mapping.c
index 6719f9e..831e673 100644
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
@@ -53,7 +53,6 @@ void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
 		iommu_setup_dma_ops(dev, dma_base, dma_base + size - 1);
 
 #ifdef CONFIG_XEN
-	if (xen_swiotlb_detect())
-		dev->dma_ops = &xen_swiotlb_dma_ops;
+	xen_setup_dma_ops(dev);
 #endif
 }
diff --git a/include/xen/arm/xen-ops.h b/include/xen/arm/xen-ops.h
new file mode 100644
index 00000000..621da05
--- /dev/null
+++ b/include/xen/arm/xen-ops.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_ARM_XEN_OPS_H
+#define _ASM_ARM_XEN_OPS_H
+
+#include <xen/swiotlb-xen.h>
+
+static inline void xen_setup_dma_ops(struct device *dev)
+{
+	if (xen_swiotlb_detect())
+		dev->dma_ops = &xen_swiotlb_dma_ops;
+}
+
+#endif /* _ASM_ARM_XEN_OPS_H */
-- 
2.7.4


