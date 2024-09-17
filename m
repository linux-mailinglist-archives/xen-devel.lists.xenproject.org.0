Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C446897B2DB
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2024 18:16:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800027.1209977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqas1-0002EE-4t; Tue, 17 Sep 2024 16:16:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800027.1209977; Tue, 17 Sep 2024 16:16:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqas0-00029M-Vn; Tue, 17 Sep 2024 16:16:04 +0000
Received: by outflank-mailman (input) for mailman id 800027;
 Tue, 17 Sep 2024 16:16:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fqUh=QP=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sqarz-0001Mb-4C
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2024 16:16:03 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2223370e-7510-11ef-a0b7-8be0dac302b0;
 Tue, 17 Sep 2024 18:16:02 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-52f01b8738dso4061621e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 17 Sep 2024 09:16:02 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5368704da27sm1234574e87.83.2024.09.17.09.16.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 09:16:01 -0700 (PDT)
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
X-Inumbo-ID: 2223370e-7510-11ef-a0b7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726589762; x=1727194562; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZV/z++s6J65vsQnlFGFo5cA2p/9dImYXd2ub5JW3o9k=;
        b=XqdliA17rLpwamkjKqwp/JRbCz2BtgMXawMU2BULC3pKn7PbkGQ5gKMcX+VoIdGixr
         zNAjDI5EIt7og+FUQMWDProVeHX2bjgfL2ACTB//BeBj3y7ZqRoeWOv6njDOCVV8QdCA
         WgQAmxtdWatxntYxlkDgdbsXtNX59RZQLhsa7XZgHlRVfDXsezj0JQ8p57+pfRKruFiy
         Gzjvk+sRrJfzrAy4SwA/lIsk1s90uzrQvBM3QI+Zs9K66U7mbLoA9VIrNHLaYLf6fBZj
         OLxxTS+VGYak12ZpF2z4dg2PC6oq0sMartTGkG1VO6xv955JDDCZFJ3kKhjdipqaJP0q
         arMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726589762; x=1727194562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZV/z++s6J65vsQnlFGFo5cA2p/9dImYXd2ub5JW3o9k=;
        b=EwNb7dw+Wp16BaVwUYQl6X/VAABgd4RLrC05h8KBg/7IR30WvL9APlmzB7HA3VFIxS
         TCwyglG+UlT+s4SLkNrw5NozrYJkh0clnJQb+UD2BCmon9SanXqC3hATWE+sD1ifv8zd
         qvtuLcxdP5YH9tpfX64MTCdW+sqCCRjtms25NxKKMKp5qEI1pEl1OicFI9VQ8c3GrWU4
         YF9NPDqOjJh8VdYGFDwRG8DoUrz+R20zLDMT9RusQeKKUy/wXzPCgKkG2keExxTcKN9l
         wsFyr4Qejo7x3kJ9n9Z7IegANaITQ6uqeMHdrd1aByNrDkloj/4e7qEZf2IHjfN2o6st
         uCSg==
X-Gm-Message-State: AOJu0YwCm55hThL+I1Fj3qnYz73J+gwBSgq0hCwLT80ZEnctlxVmOrIl
	PMRhsYEwssW5ZqxltLpPsXEXojNs20/qIpe/2WdRlu1DdWj8pTDfF9emDQ==
X-Google-Smtp-Source: AGHT+IGWVi29ZiUxnxGSyX4/sW8gW6/cNzd8sB6+hmt9dqALFma3EAYWbSlfljUTW8UySNLFVXTYsQ==
X-Received: by 2002:a05:6512:39ce:b0:536:5530:af46 with SMTP id 2adb3069b0e04-53678ff3226mr10453617e87.52.1726589761721;
        Tue, 17 Sep 2024 09:16:01 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 5/5] xen/common: move device initialization code to common code
Date: Tue, 17 Sep 2024 18:15:55 +0200
Message-ID: <0b4d49742f58549ec644944ce1e02c98d7551845.1726579819.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1726579819.git.oleksii.kurochko@gmail.com>
References: <cover.1726579819.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the device initialization code from `xen/arch/arm/device.c`
and move it to the common code to avoid duplication and make it accessible
for both ARM and other architectures.
device_get_class(), device_init(), _sdevice[] and _edevice[] are wrapped by
"#ifdef CONFIG_HAS_DEVICE_TREE" for the case if an arch doesn't support
device tree.

Remove unnecessary inclusions of <asm/device.h> and <xen/init.h> from
`xen/arch/arm/device.c` as no code in the file relies on these headers.
Fix the inclusion order by moving <asm/setup.h> after <xen/*> headers to
resolve a compilation error:
   ./include/public/xen.h:968:35: error: unknown type name 'uint64_t'
    968 | __DEFINE_XEN_GUEST_HANDLE(uint64, uint64_t);
        |                                   ^~~~~~~~
   ./include/public/arch-arm.h:191:21: note: in definition of macro '___DEFINE_XEN_GUEST_HANDLE'
   191 |     typedef union { type *p; uint64_aligned_t q; }              \
       |                     ^~~~
   ./include/public/xen.h:968:1: note: in expansion of macro '__DEFINE_XEN_GUEST_HANDLE'
   968 | __DEFINE_XEN_GUEST_HANDLE(uint64, uint64_t);
because <asm/setup.h> includes <public/version.h>, which in turn includes
"xen.h", which requires <xen/types.h> to be processed correctly.
Additionally, add <xen/device_tree.h> to `device.c` as functions from this
header are used within the file.

Introduce new CONFIG_DEVICE_INIT to compile `device.o` conditionally,
ensuring the correct device initialization code is included as needed.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - Introduce CONFIG_DEVICE_INIT to make common/device.o compilable only for Arm,
   PPC and RIS-V.
 - Move declaration of acpi_device_desc _asdevice[], _aedevice[] inside
   #ifdef CONFIG_ACPI ... #endif.
 - Include <asm/device.h> instead of <asm-generic/device.h> as <asm/device.h>
   will be included <asm-generic/device.h> anyway.
---
 xen/arch/arm/device.c | 71 ++-----------------------------------
 xen/common/Kconfig    |  8 +++++
 xen/common/Makefile   |  1 +
 xen/common/device.c   | 82 +++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 93 insertions(+), 69 deletions(-)
 create mode 100644 xen/common/device.c

diff --git a/xen/arch/arm/device.c b/xen/arch/arm/device.c
index 3e02cff008..5610cddcba 100644
--- a/xen/arch/arm/device.c
+++ b/xen/arch/arm/device.c
@@ -8,79 +8,12 @@
  * Copyright (C) 2013 Linaro Limited.
  */
 
-#include <asm/device.h>
-#include <asm/setup.h>
+#include <xen/device_tree.h>
 #include <xen/errno.h>
-#include <xen/init.h>
 #include <xen/iocap.h>
 #include <xen/lib.h>
 
-extern const struct device_desc _sdevice[], _edevice[];
-
-#ifdef CONFIG_ACPI
-extern const struct acpi_device_desc _asdevice[], _aedevice[];
-#endif
-
-int __init device_init(struct dt_device_node *dev, enum device_class class,
-                       const void *data)
-{
-    const struct device_desc *desc;
-
-    ASSERT(dev != NULL);
-
-    if ( !dt_device_is_available(dev) || dt_device_for_passthrough(dev) )
-        return  -ENODEV;
-
-    for ( desc = _sdevice; desc != _edevice; desc++ )
-    {
-        if ( desc->class != class )
-            continue;
-
-        if ( dt_match_node(desc->dt_match, dev) )
-        {
-            ASSERT(desc->init != NULL);
-
-            return desc->init(dev, data);
-        }
-
-    }
-
-    return -EBADF;
-}
-
-#ifdef CONFIG_ACPI
-int __init acpi_device_init(enum device_class class, const void *data, int class_type)
-{
-    const struct acpi_device_desc *desc;
-
-    for ( desc = _asdevice; desc != _aedevice; desc++ )
-    {
-        if ( ( desc->class != class ) || ( desc->class_type != class_type ) )
-            continue;
-
-        ASSERT(desc->init != NULL);
-
-        return desc->init(data);
-    }
-
-    return -EBADF;
-}
-#endif
-
-enum device_class device_get_class(const struct dt_device_node *dev)
-{
-    const struct device_desc *desc;
-
-    ASSERT(dev != NULL);
-
-    for ( desc = _sdevice; desc != _edevice; desc++ )
-    {
-        if ( dt_match_node(desc->dt_match, dev) )
-            return desc->class;
-    }
-
-    return DEVICE_UNKNOWN;
-}
+#include <asm/setup.h>
 
 int map_irq_to_domain(struct domain *d, unsigned int irq,
                       bool need_mapping, const char *devname)
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 90268d9249..6c6ad30d99 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -12,6 +12,14 @@ config CORE_PARKING
 	bool
 	depends on NR_CPUS > 1
 
+config DEVICE_INIT
+	bool
+	default !X86
+	depends on !X86 && (ACPI || HAS_DEVICE_TREE)
+	help
+	  Enable support for device initialization using device tree or ACPI.
+	  It is not available for X86 systems.
+
 config GRANT_TABLE
 	bool "Grant table support" if EXPERT
 	default y
diff --git a/xen/common/Makefile b/xen/common/Makefile
index fc52e0857d..1d5a4bb18d 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -6,6 +6,7 @@ obj-$(CONFIG_HYPFS_CONFIG) += config_data.o
 obj-$(CONFIG_CORE_PARKING) += core_parking.o
 obj-y += cpu.o
 obj-$(CONFIG_DEBUG_TRACE) += debugtrace.o
+obj-$(CONFIG_DEVICE_INIT) += device.o
 obj-$(CONFIG_HAS_DEVICE_TREE) += device-tree/
 obj-$(CONFIG_IOREQ_SERVER) += dm.o
 obj-y += domain.o
diff --git a/xen/common/device.c b/xen/common/device.c
new file mode 100644
index 0000000000..33e0d58f2f
--- /dev/null
+++ b/xen/common/device.c
@@ -0,0 +1,82 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Based on the code from:
+ *   xen/arch/arm/device.c
+ */
+
+#include <xen/bug.h>
+#include <xen/device_tree.h>
+#include <xen/errno.h>
+#include <xen/init.h>
+
+#include <asm/device.h>
+
+#ifdef CONFIG_HAS_DEVICE_TREE
+
+extern const struct device_desc _sdevice[], _edevice[];
+
+int __init device_init(struct dt_device_node *dev, enum device_class class,
+                       const void *data)
+{
+    const struct device_desc *desc;
+
+    ASSERT(dev != NULL);
+
+    if ( !dt_device_is_available(dev) || dt_device_for_passthrough(dev) )
+        return  -ENODEV;
+
+    for ( desc = _sdevice; desc != _edevice; desc++ )
+    {
+        if ( desc->class != class )
+            continue;
+
+        if ( dt_match_node(desc->dt_match, dev) )
+        {
+            ASSERT(desc->init != NULL);
+
+            return desc->init(dev, data);
+        }
+    }
+
+    return -EBADF;
+}
+
+enum device_class device_get_class(const struct dt_device_node *dev)
+{
+    const struct device_desc *desc;
+
+    ASSERT(dev != NULL);
+
+    for ( desc = _sdevice; desc != _edevice; desc++ )
+    {
+        if ( dt_match_node(desc->dt_match, dev) )
+            return desc->class;
+    }
+
+    return DEVICE_UNKNOWN;
+}
+
+#endif
+
+#ifdef CONFIG_ACPI
+
+extern const struct acpi_device_desc _asdevice[], _aedevice[];
+
+int __init acpi_device_init(enum device_class class, const void *data, int class_type)
+{
+    const struct acpi_device_desc *desc;
+
+    for ( desc = _asdevice; desc != _aedevice; desc++ )
+    {
+        if ( ( desc->class != class ) || ( desc->class_type != class_type ) )
+            continue;
+
+        ASSERT(desc->init != NULL);
+
+        return desc->init(data);
+    }
+
+    return -EBADF;
+}
+
+#endif
-- 
2.46.0


