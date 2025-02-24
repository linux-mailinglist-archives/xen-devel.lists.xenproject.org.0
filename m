Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A39EAA41D12
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2025 12:39:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895130.1303731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmWnL-0005ud-43; Mon, 24 Feb 2025 11:38:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895130.1303731; Mon, 24 Feb 2025 11:38:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmWnL-0005tB-1L; Mon, 24 Feb 2025 11:38:43 +0000
Received: by outflank-mailman (input) for mailman id 895130;
 Mon, 24 Feb 2025 11:38:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1M+p=VP=gmail.com=gragst.linux@srs-se1.protection.inumbo.net>)
 id 1tmWnI-0005t5-UU
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2025 11:38:40 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e3d3a02d-f2a3-11ef-9897-31a8f345e629;
 Mon, 24 Feb 2025 12:38:38 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-5452c29bacfso4769246e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Feb 2025 03:38:38 -0800 (PST)
Received: from epuakyiw0a98.kyiv.epam.com (ll-22.209.223.85.sovam.net.ua.
 [85.223.209.22]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54526745abcsm3180309e87.252.2025.02.24.03.38.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2025 03:38:36 -0800 (PST)
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
X-Inumbo-ID: e3d3a02d-f2a3-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740397118; x=1741001918; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f4HBVl05ipxd1LNSvfkAA7F2OseJq7c+RyctkVnVQG4=;
        b=ktlnpcTueEvCLE6WOLuNmB3+VBRS8oHZ9xDkBQHLaMR6jyGc2eKzzxfmVQbuIeNLcn
         6lst7GjfQVMTIpx6qDx6xnfQvJUhgXkDMErh4yWMlAcuumx8wu93cJQ2dL08NVgxZTyJ
         izUMFAVIA17+6D8igzuIEJBUBvsNtcqNbLg+I69nmd4PLN4aUe7H1RpVsGpiQ5JGzlhX
         hwWIrEooo0+FaTgforjw3UNBRRBfFWnL5lg8VgemD8i/sWUuexybgTkpl/o/oKwMrPeq
         MZ/WarV2MddM+yJNBWp1Gl/u+THQdmzqBhOSxUdm43ji14ZkSdjCQxlvTJGlT5OsS2/B
         c8pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740397118; x=1741001918;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f4HBVl05ipxd1LNSvfkAA7F2OseJq7c+RyctkVnVQG4=;
        b=iiQba7pJY3kOKam+wLWA3FURgxyie8Ip5BqcIadFCSWDy1vnDuqntgtYzYCresz18z
         U17417fGD1yZdFbIDdm95RsGr3ZQmgz0+t5vgr91HeET8hb6mEdXQSAw//zv+xc1p8Zi
         WbtazG6hTBSumQKHnYKXQ7cmbVf43fujx6AW1oBMd7YFh/eb99ZoAzruKsnZFwJluwxo
         heRBxxh/6k2Q+SWs23tNSBH+iHwQY0C8pU1jF3U0zIVgj98gR9apyhzRlUzEzD2pGH7n
         dSuRLPpfTqJdq/HHfxY5ZYUW8HYM2Z3WFe/YM+Vb4BmIv74ezLC/zNIC0o6Y6e12m6OX
         W2mw==
X-Gm-Message-State: AOJu0Yzs6RaVNDbzIF9AsbK1ZtPb7EIoENRjHI9kLAHfj8g3Qy0DWJZq
	s7bqNoadkgM5DzFqHeTi4gSu3bBdrbALuoWKPU7B201MHQvmoQbQbAgFaA==
X-Gm-Gg: ASbGnct0zOX1LKqaKTycCn5cVif312QL1h5nxgREUpieQKgvkQciyFLbVrDHDjXkcFK
	UAuE5EXcyR5aMbgmZlHBiW4IUSjoInV46sUNqLonvgq9H/XmNL7vbDLNsllZEkbz+OG/aDEjGtX
	67Bz5m/Lzyu2HVboeoBtQ1V3hKqQcCx6otXmNGYsWwlzOCH3n5XPAuPatF15+gG2GqBn0M5N81Q
	MZXHvxUVK9utYffjJV4CXDWl3pVEZi8PNGcFjhb06OHILbEY9IJ30aqMNvt5zF+6ybSP4OEeRvH
	gVaNlXigEJ77D2afViS2SLjVA8hVdJUGLWfAPcjqMixYXHNcwmAkQMRdR4gzyBi3eA5Tk5LEPxT
	dLjWfFz7P
X-Google-Smtp-Source: AGHT+IHMtmaegpS+MpNxjKgvy70iWAQ6Z/ghCWn4NQY4Ty+aQWM58g2Tt1ZEdp1BndiVo2TVPY0zbA==
X-Received: by 2002:a05:6512:3f0d:b0:540:1e65:1d7d with SMTP id 2adb3069b0e04-548391440camr5327174e87.23.1740397117487;
        Mon, 24 Feb 2025 03:38:37 -0800 (PST)
From: Grygorii Strashko <gragst.linux@gmail.com>
X-Google-Original-From: Grygorii Strashko <grygorii_strashko@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	"Roger Pau Monne" <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Grygorii Strashko <grygorii_strashko@epam.com>
Subject: [PATCH] xen/iocap.h: add documentation
Date: Mon, 24 Feb 2025 13:38:28 +0200
Message-Id: <20250224113828.151794-1-grygorii_strashko@epam.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change rangeset parameters to "start, last" as proposed in [1],
and add documentation for public interface.

No functional changes.

[1] https://patchwork.kernel.org/comment/26251962/
Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
 xen/include/xen/iocap.h | 134 +++++++++++++++++++++++++++++++++-------
 1 file changed, 112 insertions(+), 22 deletions(-)

diff --git a/xen/include/xen/iocap.h b/xen/include/xen/iocap.h
index ffbc48b60fd5..8845949ab885 100644
--- a/xen/include/xen/iocap.h
+++ b/xen/include/xen/iocap.h
@@ -12,11 +12,21 @@
 #include <asm/iocap.h>
 #include <asm/p2m.h>
 
-static inline int iomem_permit_access(struct domain *d, unsigned long s,
-                                      unsigned long e)
+/**
+ * @brief Gives domain permission to access IOMEM range
+ *
+ * @d: Domain to give IOMEM range access
+ * @start: IOMEM range start address, inclusive
+ * @last: IOMEM range last address, inclusive
+ *
+ * @retval 0 Is successful
+ * @retval -ENOMEM if memory allocation failed
+ */
+static inline int iomem_permit_access(struct domain *d, unsigned long start,
+                                      unsigned long last)
 {
     bool flush = cache_flush_permitted(d);
-    int ret = rangeset_add_range(d->iomem_caps, s, e);
+    int ret = rangeset_add_range(d->iomem_caps, start, last);
 
     if ( !ret && !is_iommu_enabled(d) && !flush )
         /*
@@ -29,10 +39,20 @@ static inline int iomem_permit_access(struct domain *d, unsigned long s,
     return ret;
 }
 
-static inline int iomem_deny_access(struct domain *d, unsigned long s,
-                                    unsigned long e)
+/**
+ * @brief Denies domain permission to access IOMEM range
+ *
+ * @d: Domain to deny IOMEM range access
+ * @start: IOMEM range start address, inclusive
+ * @last: IOMEM range last address, inclusive
+ *
+ * @retval 0 Is successful
+ * @retval -ENOMEM if memory allocation failed
+ */
+static inline int iomem_deny_access(struct domain *d, unsigned long start,
+                                    unsigned long last)
 {
-    int ret = rangeset_remove_range(d->iomem_caps, s, e);
+    int ret = rangeset_remove_range(d->iomem_caps, start, last);
 
     if ( !ret && !is_iommu_enabled(d) && !cache_flush_permitted(d) )
         /*
@@ -45,23 +65,93 @@ static inline int iomem_deny_access(struct domain *d, unsigned long s,
     return ret;
 }
 
-#define iomem_access_permitted(d, s, e)                 \
-    rangeset_contains_range((d)->iomem_caps, s, e)
-
-#define irq_permit_access(d, i)                         \
-    rangeset_add_singleton((d)->irq_caps, i)
-#define irq_deny_access(d, i)                           \
-    rangeset_remove_singleton((d)->irq_caps, i)
-#define irqs_permit_access(d, s, e)                     \
-    rangeset_add_range((d)->irq_caps, s, e)
-#define irqs_deny_access(d, s, e)                       \
-    rangeset_remove_range((d)->irq_caps, s, e)
-#define irq_access_permitted(d, i)                      \
-    rangeset_contains_singleton((d)->irq_caps, i)
-
-#define pirq_access_permitted(d, i) ({                  \
+/**
+ * @brief Checks if domain has permissions to access IOMEM range
+ *
+ * @d: Domain to check IOMEM range access
+ * @start: IOMEM range start address, inclusive
+ * @last: IOMEM range last address, inclusive
+ *
+ * @retval true if access permitted
+ * @retval false if access denied
+ */
+#define iomem_access_permitted(d, start, last)             \
+    rangeset_contains_range((d)->iomem_caps, start, last)
+
+/**
+ * @brief Gives domain permission to access IRQ
+ *
+ * @d: Domain to give IRQ access
+ * @irq: IRQ number
+ *
+ * @retval 0 Is successful
+ * @retval -ENOMEM if memory allocation failed
+ */
+#define irq_permit_access(d, irq)                         \
+    rangeset_add_singleton((d)->irq_caps, irq)
+
+/**
+ * @brief Denies domain permission to access IRQ
+ *
+ * @d: Domain to deny IRQ access
+ * @irq: IRQ number
+ *
+ * @retval 0 Is successful
+ * @retval -ENOMEM if memory allocation failed
+ */
+#define irq_deny_access(d, irq)                           \
+    rangeset_remove_singleton((d)->irq_caps, irq)
+
+/**
+ * @brief Gives domain permission to access IRQ range
+ *
+ * @d: Domain to give IRQ range access
+ * @start_irq: IRQ range start number, inclusive
+ * @last_irq: IRQ range last number, inclusive
+ *
+ * @retval 0 Is successful
+ * @retval -ENOMEM if memory allocation failed
+ */
+#define irqs_permit_access(d, start_irq, last_irq)      \
+    rangeset_add_range((d)->irq_caps, start_irq, last_irq)
+
+/**
+ * @brief Denies domain permission to access IRQ range
+ *
+ * @d: Domain to deny IRQ range access
+ * @start_irq: IRQ range start number, inclusive
+ * @last_irq: IRQ range last number, inclusive
+ *
+ * @retval 0 Is successful
+ * @retval -ENOMEM if memory allocation failed
+ */
+#define irqs_deny_access(d, start_irq, last_irq)        \
+    rangeset_remove_range((d)->irq_caps, start_irq, last_irq)
+
+/**
+ * @brief Checks if domain has permissions to access IRQ
+ *
+ * @d: Domain to check IRQ access
+ * @irq: IRQ number to check
+ *
+ * @retval true if access permitted
+ * @retval false if access denied
+ */
+#define irq_access_permitted(d, irq)                    \
+    rangeset_contains_singleton((d)->irq_caps, irq)
+
+/**
+ * @brief Checks if domain has permissions to access PIRQ
+ *
+ * @d: Domain to check PIRQ access
+ * @pirq: PIRQ number to check
+ *
+ * @retval IRQ number if access permitted
+ * @retval 0 if access denied
+ */
+#define pirq_access_permitted(d, pirq) ({               \
     struct domain *d__ = (d);                           \
-    int irq__ = domain_pirq_to_irq(d__, i);             \
+    int irq__ = domain_pirq_to_irq(d__, pirq);          \
     irq__ > 0 && irq_access_permitted(d__, irq__)       \
     ? irq__ : 0;                                        \
 })
-- 
2.34.1


