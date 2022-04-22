Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C9F50BD94
	for <lists+xen-devel@lfdr.de>; Fri, 22 Apr 2022 18:51:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.311113.528158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhwVA-0006X3-OO; Fri, 22 Apr 2022 16:51:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 311113.528158; Fri, 22 Apr 2022 16:51:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhwVA-0006Ts-Kh; Fri, 22 Apr 2022 16:51:24 +0000
Received: by outflank-mailman (input) for mailman id 311113;
 Fri, 22 Apr 2022 16:51:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hyV/=VA=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nhwV8-0006Cr-Ha
 for xen-devel@lists.xenproject.org; Fri, 22 Apr 2022 16:51:22 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 700a0360-c25c-11ec-8fc2-03012f2f19d4;
 Fri, 22 Apr 2022 18:51:21 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id n17so10333832ljc.11
 for <xen-devel@lists.xenproject.org>; Fri, 22 Apr 2022 09:51:21 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 n2-20020a056512310200b0046e2f507a3asm279742lfb.167.2022.04.22.09.51.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 22 Apr 2022 09:51:19 -0700 (PDT)
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
X-Inumbo-ID: 700a0360-c25c-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=GMgjzuq0mtE7dfPwrz9iyN7XiqhJI/kKUBmloz8CHVM=;
        b=TvogOFhSkVoEFDDp2UyFM5JT+iRsMeAsMM/Ir0HL2o1J+3AsH38OlCvt5oXs8CCV0S
         xnxUElm53fIFEcmFNvNSvMmmh4juZ3+WxRoQAU7gWAgnSyXTv4uRTElLcGlojn+w9rdF
         qDNCuB/K5KxRpOUO1ACvBknXeQucuqYZcVPZzxDWH6TcyWGUucHe6OwZ+exVVrxtH5Wa
         xzdueEOQxmDYRx+fspEs14YJcnhc7fM4o0YNvW4kICFGZc/ebzCbRgyaUk87mgH3Hb+/
         GgKojJu/EjHmouEBcVqfsA7l9jnJtbGlyY8Cf/h0HXmwLUzvJ+uSw/3SbFoXbhRUvmTW
         BPAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=GMgjzuq0mtE7dfPwrz9iyN7XiqhJI/kKUBmloz8CHVM=;
        b=3HUQIvYXwD4/zBrGQua/kQ6Tdkkbn4MSEHzwR1M48DqDW9RINTYcMpV2ZkdYGsyTVz
         TMU1/syq8qoZa24PuGM4udgBuGYdmbcJKO7kkdBVkcH2OmoN8SmcwlktfEcCsIeq+ImB
         GdpDXvPPau1c7CIZXgJ6xI3gLdQQGH2dJIIHvsf3x8Hiy60nwEYqUsuG9kW3kOu7UepT
         f4ncjzYdPzaNELtDtqS0BStk2KKFkkim1dl9nDD6Z37sXQs6N/nlJ45Hm2L+27GfbWc8
         9Zug1ClKRhzIAxdvIG9SZca/GH4pGYylOc9KEkuT5plLYH6f+L2pAaxO4bIziPc1tgfD
         Q3qw==
X-Gm-Message-State: AOAM533kKhaooNWphymSFd4GeVGezsnZsClujHMR615Qa/3YQEr4ycK6
	yA6zoX2HWw0KdPOrsa7f8DCmRLYDnmY=
X-Google-Smtp-Source: ABdhPJxBofHQqIEEOVD/ysfSrlTaHT4d23vVGsnsT2WqL8jP7PaAU3+Os5xoi30E2pyYaSKWwDmonw==
X-Received: by 2002:a2e:8659:0:b0:24d:b379:4cc0 with SMTP id i25-20020a2e8659000000b0024db3794cc0mr3390687ljj.289.1650646279861;
        Fri, 22 Apr 2022 09:51:19 -0700 (PDT)
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
	Julien Grall <julien@xen.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Christoph Hellwig <hch@infradead.org>
Subject: [PATCH V1 1/6] arm/xen: Introduce xen_setup_dma_ops()
Date: Fri, 22 Apr 2022 19:50:58 +0300
Message-Id: <1650646263-22047-2-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1650646263-22047-1-git-send-email-olekstysh@gmail.com>
References: <1650646263-22047-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

This patch introduces new helper and places it in new header.
The helper's purpose is to assign any Xen specific DMA ops in
a single place. For now, we deal with xen-swiotlb DMA ops only.
The one of the subsequent commits in current series will add
xen-grant DMA ops case.

Also re-use the xen_swiotlb_detect() check on Arm32.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
Changes RFC -> V1:
   - update commit description
   - move commit to the beginning of the series
   - move #ifdef CONFIG_XEN from dma-mapping.c to xen-ops.h
---
 arch/arm/include/asm/xen/xen-ops.h   |  1 +
 arch/arm/mm/dma-mapping.c            |  7 ++-----
 arch/arm64/include/asm/xen/xen-ops.h |  1 +
 arch/arm64/mm/dma-mapping.c          |  7 ++-----
 include/xen/arm/xen-ops.h            | 15 +++++++++++++++
 5 files changed, 21 insertions(+), 10 deletions(-)
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
index 00000000..8d2fa24
--- /dev/null
+++ b/arch/arm64/include/asm/xen/xen-ops.h
@@ -0,0 +1 @@
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


