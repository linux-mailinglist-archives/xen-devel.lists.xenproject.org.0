Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C387B9849E3
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 18:42:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803183.1213704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st8cg-00008y-9h; Tue, 24 Sep 2024 16:42:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803183.1213704; Tue, 24 Sep 2024 16:42:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st8cg-0008Nu-33; Tue, 24 Sep 2024 16:42:46 +0000
Received: by outflank-mailman (input) for mailman id 803183;
 Tue, 24 Sep 2024 16:42:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vi3U=QW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1st8ce-0006ag-Jy
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 16:42:44 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05966f9e-7a94-11ef-a0ba-8be0dac302b0;
 Tue, 24 Sep 2024 18:42:44 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5c40942358eso78061a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2024 09:42:44 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c5cf4972f8sm925880a12.36.2024.09.24.09.42.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 09:42:42 -0700 (PDT)
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
X-Inumbo-ID: 05966f9e-7a94-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727196163; x=1727800963; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rd0RKKyPPEB4zhpM6Q59vLfdVoXLAhKMtI06rtQIwhA=;
        b=epqeUwbjslH4INyAQr1IMeKgzanLPHbaDgF+pmgtAsvmvfDlqPYY7+d48VTnCTKpYP
         dVpAAVJ8TT6937C4xet9PA8SQ60imX90rpESq/7+kvWz6yive1G8dzGmJGez/QoLRVdf
         vFcVLEif2kLuuPEFmVmiWmTBComLphw23Y2Apk+3Mfq+995TaPDx96Y+bmpyNTDDVWqM
         J7RbYzWvXqvdvP9ZgWUYBGYtoJiFX4OcPungOgyaHrq3vKK7j1BmxrMzGuQJ+QahA4VB
         wBBqorHk+2UZb4CRswjM90XHiIdA6tVKFsSsBCYr7bMyX6hFUBXaX78OhuK0tr5S0OVh
         hjYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727196163; x=1727800963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rd0RKKyPPEB4zhpM6Q59vLfdVoXLAhKMtI06rtQIwhA=;
        b=slXG26yWRuq0xpImMkWo0OAlSKsWQDopVzCU8mCFvjnDS6RdUQ2ydkvaQTqN03U6+N
         WQefOObYotJOQuyjrI/sFS3LaonxkhEg4/2cZfGtfrY8/yTqtDQL8ias9VRNoprK6tno
         atG4JnkRgdOCCCtJv9zcGoaGvNOJ8Yuv3SU8fMxfnJco4rJXydiFZNUm3iBqGV4WwEmS
         bSP9oSWDuD/DAj0Lt/NCkwtZQy311Rx7QAGaVum1l/wgp7ok7Z7n3J9MlrOEo+oktS7F
         sJJWm4p/gTPvQfq1/U5S+4OjU/SKgzNdrIXhbzVJ7JMNONF3O9NyI8vQr5SXTJGD+6zH
         KMAQ==
X-Gm-Message-State: AOJu0YxmKc5HIBhWt/vDWbnN2SHwGpkLqFLscOSq+lW6eBnuuZEn1pmj
	i6AxEspgbBHx00M0qHDBIrAJhEV/XGNcxdku+4dmm/voTbfvdJovyqxKfw==
X-Google-Smtp-Source: AGHT+IH93gz7SQ7dPE5qtwVgw9JtiTwj8OcCCAzycrxVvN5xbDQC+iyiAmNQmluY17ldHoAXibjqrQ==
X-Received: by 2002:a05:6402:360f:b0:5c4:1372:f5ac with SMTP id 4fb4d7f45d1cf-5c5cdfb7394mr4578760a12.11.1727196163059;
        Tue, 24 Sep 2024 09:42:43 -0700 (PDT)
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
Subject: [PATCH v3 5/5] xen/common: move device initialization code to common code
Date: Tue, 24 Sep 2024 18:42:34 +0200
Message-ID: <6d85c4336b473cfaf41bb7a568c9629e01d80faf.1727193766.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <cover.1727193766.git.oleksii.kurochko@gmail.com>
References: <cover.1727193766.git.oleksii.kurochko@gmail.com>
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

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 - drop DEVICE_INIT config.
 - update the commit message.
---
 xen/arch/arm/device.c | 71 ++-----------------------------------
 xen/common/Makefile   |  2 ++
 xen/common/device.c   | 82 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 86 insertions(+), 69 deletions(-)
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
diff --git a/xen/common/Makefile b/xen/common/Makefile
index fc52e0857d..9d962069f7 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -6,6 +6,8 @@ obj-$(CONFIG_HYPFS_CONFIG) += config_data.o
 obj-$(CONFIG_CORE_PARKING) += core_parking.o
 obj-y += cpu.o
 obj-$(CONFIG_DEBUG_TRACE) += debugtrace.o
+obj-$(CONFIG_HAS_DEVICE_TREE) += device.o
+obj-$(filter-out $(CONFIG_X86),$(CONFIG_ACPI)) += device.o
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
2.46.1


