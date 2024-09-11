Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EAE974F36
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2024 12:05:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796368.1205942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soKDU-00040j-Lq; Wed, 11 Sep 2024 10:04:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796368.1205942; Wed, 11 Sep 2024 10:04:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soKDU-0003ux-GN; Wed, 11 Sep 2024 10:04:52 +0000
Received: by outflank-mailman (input) for mailman id 796368;
 Wed, 11 Sep 2024 10:04:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TDmC=QJ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1soKDT-0003dj-DX
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2024 10:04:51 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48b43047-7025-11ef-a0b5-8be0dac302b0;
 Wed, 11 Sep 2024 12:04:50 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2f7502f09fdso6978711fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Sep 2024 03:04:50 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f75bffc9d6sm15338281fa.42.2024.09.11.03.04.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2024 03:04:48 -0700 (PDT)
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
X-Inumbo-ID: 48b43047-7025-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726049089; x=1726653889; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VMfC1nH5jIMgPGUj/YUy4F9FmE7AL/kPpwi07IGIBU8=;
        b=lGOh1Th+Wt8wtii5dGq7Nf3xvCemlqZ41OahSnonTfnJZqbeGtM+kQnfBJ4unQ3TUb
         wory2eZ/AmoHl4XV2eeg219wr4DAqF6M5yXS6ZAVC+w3opsDwkgayAEkvhwAhrWA6oxS
         oRVNHj7y33KZRRH3I0so6dxRHLSbUwR6pwU6PNO9oh6b5IB0ykB7BljifQphtTmfTTif
         06RsbQZY5SU7A+6otzjTJONxOwOcNcAbx+N03kXZWF3y2LUvTt05K9tTVdmxP/I1n+aS
         /xFGjzFTOC7wQlcEHNcJZp/w/6buG2CdFsINcI7Mpac/nqkBmSggf3FVe3owXFpBkqWj
         xm6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726049089; x=1726653889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VMfC1nH5jIMgPGUj/YUy4F9FmE7AL/kPpwi07IGIBU8=;
        b=AC4Qq/X7lZNXVUdQo3DLHbpC6yn84Ey6PWhNtrzCHtfycz9SqPtwEQixgcRn14HzOJ
         KXsS43I6cUuysCwS15lzdz44qaq+YDMLM7wfm+U6RSIXSx2iaG8FKoGAdu5sulU+gJDA
         2dEIxN9uu7WY5st+4mZFgQIaastD4DUTWv4Fz370BKrVKRHRJ46xVvCZhCmwFGYcE38d
         sxk1TXKW/6BH/gHrot+FkoJ7j9igJR7lP4fK3bXhODv+K8u01YZEdBW7iU7jNxlim7VM
         vMzfr62sK4LplE/ErkuHr0nqunsFWYISveUsVtpb2dCzrAnOBy6eg8cRN1ppr3bxsh5f
         drgg==
X-Gm-Message-State: AOJu0YzhbKze4qSTnZqehRar0P1gsSnwzDw6xlG+g9BGaAyiucLkhyHb
	nGH9+8FvmbCYD9KEpokm+p6SsPF+EF6KBAEJDVh0vNIX2EBkiQ8Of7j2uw==
X-Google-Smtp-Source: AGHT+IFlVNdYLqTCu4xkkTDM5I5j2GAnr2QyEZqIxrZ2XCMt1GwMiDLhysDiFKr/rOqZZEWGmvrU9A==
X-Received: by 2002:a2e:be86:0:b0:2f4:f66f:d55a with SMTP id 38308e7fff4ca-2f7727185demr25313671fa.21.1726049089359;
        Wed, 11 Sep 2024 03:04:49 -0700 (PDT)
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
Subject: [PATCH v1 3/3] xen/common: move device initialization code to common code
Date: Wed, 11 Sep 2024 12:04:43 +0200
Message-ID: <128d17f3625807a26875b7a419fb56610424b18c.1726048521.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1726048521.git.oleksii.kurochko@gmail.com>
References: <cover.1726048521.git.oleksii.kurochko@gmail.com>
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

Additionally, the Makefile is updated to compile `device.o` conditionally
based on whether `CONFIG_HAS_DEVICE_TREE` or `CONFIG_HAS_ACPI` is enabled,
ensuring the correct device initialization code is included as needed.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/arm/device.c | 71 ++-----------------------------------
 xen/common/Makefile   |  1 +
 xen/common/device.c   | 82 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 85 insertions(+), 69 deletions(-)
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
index fc52e0857d..703e26de1d 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -6,6 +6,7 @@ obj-$(CONFIG_HYPFS_CONFIG) += config_data.o
 obj-$(CONFIG_CORE_PARKING) += core_parking.o
 obj-y += cpu.o
 obj-$(CONFIG_DEBUG_TRACE) += debugtrace.o
+obj-$(call or,$(CONFIG_HAS_DEVICE_TREE),$(CONFIG_HAS_ACPI)) += device.o
 obj-$(CONFIG_HAS_DEVICE_TREE) += device-tree/
 obj-$(CONFIG_IOREQ_SERVER) += dm.o
 obj-y += domain.o
diff --git a/xen/common/device.c b/xen/common/device.c
new file mode 100644
index 0000000000..e34a7dc88e
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
+#include <asm-generic/device.h>
+
+#ifdef CONFIG_ACPI
+extern const struct acpi_device_desc _asdevice[], _aedevice[];
+#endif
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
+#endif
-- 
2.46.0


