Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AE56A853A
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 16:35:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505056.777649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXkxP-0002xx-Ts; Thu, 02 Mar 2023 15:34:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505056.777649; Thu, 02 Mar 2023 15:34:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXkxP-0002h9-Ca; Thu, 02 Mar 2023 15:34:59 +0000
Received: by outflank-mailman (input) for mailman id 505056;
 Thu, 02 Mar 2023 15:34:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZMsQ=62=desiato.srs.infradead.org=BATV+9a0490e5ac528e462c30+7130+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1pXkxM-0001Jv-5b
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 15:34:56 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c2cf51aa-b90f-11ed-96ad-2f268f93b82a;
 Thu, 02 Mar 2023 16:34:49 +0100 (CET)
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pXkx4-00FL3k-2L; Thu, 02 Mar 2023 15:34:41 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pXkx4-004uzJ-1z; Thu, 02 Mar 2023 15:34:38 +0000
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
X-Inumbo-ID: c2cf51aa-b90f-11ed-96ad-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=n8LLYMrAYAzp3JCDi83tNu3v9ZoLlZOiuyoSpRezh9U=; b=hbNt5x2HZSwFDzDoMeCTo7KHqy
	hvUNdOYMbYAvX1tdmAeimolbpy8c0iQ4O6rivnIrLKZCuoPZOSBpksukOo598V0UFGtf8011+G5DE
	G2tOuvaiUEKdQmZSPGYzBO8Ewd1XAVdvWhdjtFf/jGxl0SnDV03hUUsVyPN0Zo4AZzgBugN9az7Gc
	7ZGVXFjDSqzfXAqYXHDVBz6PfA18iLoydLUWAQO9d84Q5FbHU/5yJ9xQPTWFk974Rh4dqD3u6euqy
	9Z3OQ6YyHTfkajon+fO/fH5STM2GcoRo6pEhA5xKAyVhi1Zh9+cGcep+hrIeD0xoYxU1r8pvxjq+i
	btkx84Jg==;
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Paul Durrant <paul@xen.org>,
	Joao Martins <joao.m.martins@oracle.com>,
	Ankur Arora <ankur.a.arora@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	vikram.garhwal@amd.com,
	Anthony Perard <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: [RFC PATCH v1 16/25] hw/xen: Rename xen_common.h to xen_native.h
Date: Thu,  2 Mar 2023 15:34:26 +0000
Message-Id: <20230302153435.1170111-17-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230302153435.1170111-1-dwmw2@infradead.org>
References: <20230302153435.1170111-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

This header is now only for native Xen code, not PV backends that may be
used in Xen emulation. Since the toolstack libraries may depend on the
specific version of Xen headers that they pull in (and will set the
__XEN_TOOLS__ macro to enable internal definitions that they depend on),
the rule is that xen_native.h (and thus the toolstack library headers)
must be included *before* any of the headers in include/hw/xen/interface.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 accel/xen/xen-all.c                           |  1 +
 hw/9pfs/xen-9p-backend.c                      |  1 +
 hw/block/dataplane/xen-block.c                |  3 ++-
 hw/block/xen-block.c                          |  1 -
 hw/i386/pc_piix.c                             |  4 ++--
 hw/i386/xen/xen-hvm.c                         | 11 +++++-----
 hw/i386/xen/xen-mapcache.c                    |  2 +-
 hw/i386/xen/xen_platform.c                    |  7 +++---
 hw/xen/trace-events                           |  2 +-
 hw/xen/xen-operations.c                       |  2 +-
 hw/xen/xen_pt.c                               |  2 +-
 hw/xen/xen_pt.h                               |  2 +-
 hw/xen/xen_pt_config_init.c                   |  2 +-
 hw/xen/xen_pt_msi.c                           |  4 ++--
 include/hw/xen/xen.h                          | 22 ++++++++++++-------
 include/hw/xen/{xen_common.h => xen_native.h} | 10 ++++++---
 include/hw/xen/xen_pvdev.h                    |  3 ++-
 17 files changed, 47 insertions(+), 32 deletions(-)
 rename include/hw/xen/{xen_common.h => xen_native.h} (98%)

diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
index 2d51c41e40..00221e23c5 100644
--- a/accel/xen/xen-all.c
+++ b/accel/xen/xen-all.c
@@ -12,6 +12,7 @@
 #include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "qapi/error.h"
+#include "hw/xen/xen_native.h"
 #include "hw/xen/xen-legacy-backend.h"
 #include "hw/xen/xen_pt.h"
 #include "chardev/char.h"
diff --git a/hw/9pfs/xen-9p-backend.c b/hw/9pfs/xen-9p-backend.c
index d8bb0e847c..74f3a05f88 100644
--- a/hw/9pfs/xen-9p-backend.c
+++ b/hw/9pfs/xen-9p-backend.c
@@ -22,6 +22,7 @@
 #include "qemu/config-file.h"
 #include "qemu/main-loop.h"
 #include "qemu/option.h"
+#include "qemu/iov.h"
 #include "fsdev/qemu-fsdev.h"
 
 #define VERSIONS "1"
diff --git a/hw/block/dataplane/xen-block.c b/hw/block/dataplane/xen-block.c
index 8322a1de82..734da42ea7 100644
--- a/hw/block/dataplane/xen-block.c
+++ b/hw/block/dataplane/xen-block.c
@@ -23,8 +23,9 @@
 #include "qemu/main-loop.h"
 #include "qemu/memalign.h"
 #include "qapi/error.h"
-#include "hw/xen/xen_common.h"
+#include "hw/xen/xen.h"
 #include "hw/block/xen_blkif.h"
+#include "hw/xen/interface/io/ring.h"
 #include "sysemu/block-backend.h"
 #include "sysemu/iothread.h"
 #include "xen-block.h"
diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
index 345b284d70..87299615e3 100644
--- a/hw/block/xen-block.c
+++ b/hw/block/xen-block.c
@@ -19,7 +19,6 @@
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qstring.h"
 #include "qom/object_interfaces.h"
-#include "hw/xen/xen_common.h"
 #include "hw/block/xen_blkif.h"
 #include "hw/qdev-properties.h"
 #include "hw/xen/xen-block.h"
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 126b6c11df..e0f768b664 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -47,8 +47,6 @@
 #include "hw/kvm/clock.h"
 #include "hw/sysbus.h"
 #include "hw/i2c/smbus_eeprom.h"
-#include "hw/xen/xen-x86.h"
-#include "hw/xen/xen.h"
 #include "exec/memory.h"
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/piix4.h"
@@ -60,6 +58,8 @@
 #include <xen/hvm/hvm_info_table.h>
 #include "hw/xen/xen_pt.h"
 #endif
+#include "hw/xen/xen-x86.h"
+#include "hw/xen/xen.h"
 #include "migration/global_state.h"
 #include "migration/misc.h"
 #include "sysemu/numa.h"
diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index cb1d24f592..56641a550e 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -18,7 +18,7 @@
 #include "hw/irq.h"
 #include "hw/hw.h"
 #include "hw/i386/apic-msidef.h"
-#include "hw/xen/xen_common.h"
+#include "hw/xen/xen_native.h"
 #include "hw/xen/xen-legacy-backend.h"
 #include "hw/xen/xen-bus.h"
 #include "hw/xen/xen-x86.h"
@@ -52,10 +52,11 @@ static bool xen_in_migration;
 
 /* Compatibility with older version */
 
-/* This allows QEMU to build on a system that has Xen 4.5 or earlier
- * installed.  This here (not in hw/xen/xen_common.h) because xen/hvm/ioreq.h
- * needs to be included before this block and hw/xen/xen_common.h needs to
- * be included before xen/hvm/ioreq.h
+/*
+ * This allows QEMU to build on a system that has Xen 4.5 or earlier installed.
+ * This is here (not in hw/xen/xen_native.h) because xen/hvm/ioreq.h needs to
+ * be included before this block and hw/xen/xen_native.h needs to be included
+ * before xen/hvm/ioreq.h
  */
 #ifndef IOREQ_TYPE_VMWARE_PORT
 #define IOREQ_TYPE_VMWARE_PORT  3
diff --git a/hw/i386/xen/xen-mapcache.c b/hw/i386/xen/xen-mapcache.c
index 1d0879d234..f7d974677d 100644
--- a/hw/i386/xen/xen-mapcache.c
+++ b/hw/i386/xen/xen-mapcache.c
@@ -14,7 +14,7 @@
 
 #include <sys/resource.h>
 
-#include "hw/xen/xen-legacy-backend.h"
+#include "hw/xen/xen_native.h"
 #include "qemu/bitmap.h"
 
 #include "sysemu/runstate.h"
diff --git a/hw/i386/xen/xen_platform.c b/hw/i386/xen/xen_platform.c
index 539f7da374..57f1d742c1 100644
--- a/hw/i386/xen/xen_platform.c
+++ b/hw/i386/xen/xen_platform.c
@@ -28,7 +28,6 @@
 #include "hw/ide/pci.h"
 #include "hw/pci/pci.h"
 #include "migration/vmstate.h"
-#include "hw/xen/xen.h"
 #include "net/net.h"
 #include "trace.h"
 #include "sysemu/xen.h"
@@ -38,10 +37,12 @@
 #include "qom/object.h"
 
 #ifdef CONFIG_XEN
-#include "hw/xen/xen_common.h"
-#include "hw/xen/xen-legacy-backend.h"
+#include "hw/xen/xen_native.h"
 #endif
 
+/* The rule is that xen_native.h must come first */
+#include "hw/xen/xen.h"
+
 //#define DEBUG_PLATFORM
 
 #ifdef DEBUG_PLATFORM
diff --git a/hw/xen/trace-events b/hw/xen/trace-events
index 3da3fd8348..55c9e1df68 100644
--- a/hw/xen/trace-events
+++ b/hw/xen/trace-events
@@ -1,6 +1,6 @@
 # See docs/devel/tracing.rst for syntax documentation.
 
-# ../../include/hw/xen/xen_common.h
+# ../../include/hw/xen/xen_native.h
 xen_default_ioreq_server(void) ""
 xen_ioreq_server_create(uint32_t id) "id: %u"
 xen_ioreq_server_destroy(uint32_t id) "id: %u"
diff --git a/hw/xen/xen-operations.c b/hw/xen/xen-operations.c
index 80c8fbede6..2b229f722f 100644
--- a/hw/xen/xen-operations.c
+++ b/hw/xen/xen-operations.c
@@ -13,8 +13,8 @@
 #include "qemu/uuid.h"
 #include "qapi/error.h"
 
+#include "hw/xen/xen_native.h"
 #include "hw/xen/xen_backend_ops.h"
-#include "hw/xen/xen_common.h"
 
 /*
  * If we have new enough libxenctrl then we do not want/need these compat
diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
index 8db0532632..b705aff724 100644
--- a/hw/xen/xen_pt.c
+++ b/hw/xen/xen_pt.c
@@ -59,9 +59,9 @@
 #include "hw/pci/pci.h"
 #include "hw/qdev-properties.h"
 #include "hw/qdev-properties-system.h"
+#include "xen_pt.h"
 #include "hw/xen/xen.h"
 #include "hw/xen/xen-legacy-backend.h"
-#include "xen_pt.h"
 #include "qemu/range.h"
 
 static bool has_igd_gfx_passthru;
diff --git a/hw/xen/xen_pt.h b/hw/xen/xen_pt.h
index cf10fc7bbf..27fc7bb585 100644
--- a/hw/xen/xen_pt.h
+++ b/hw/xen/xen_pt.h
@@ -1,7 +1,7 @@
 #ifndef XEN_PT_H
 #define XEN_PT_H
 
-#include "hw/xen/xen_common.h"
+#include "hw/xen/xen_native.h"
 #include "xen-host-pci-device.h"
 #include "qom/object.h"
 
diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
index cde898b744..0cd9fbd22c 100644
--- a/hw/xen/xen_pt_config_init.c
+++ b/hw/xen/xen_pt_config_init.c
@@ -15,8 +15,8 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu/timer.h"
-#include "hw/xen/xen-legacy-backend.h"
 #include "xen_pt.h"
+#include "hw/xen/xen-legacy-backend.h"
 
 #define XEN_PT_MERGE_VALUE(value, data, val_mask) \
     (((value) & (val_mask)) | ((data) & ~(val_mask)))
diff --git a/hw/xen/xen_pt_msi.c b/hw/xen/xen_pt_msi.c
index b71563f98a..09cca4eecb 100644
--- a/hw/xen/xen_pt_msi.c
+++ b/hw/xen/xen_pt_msi.c
@@ -11,9 +11,9 @@
 
 #include "qemu/osdep.h"
 
-#include "hw/xen/xen-legacy-backend.h"
-#include "xen_pt.h"
 #include "hw/i386/apic-msidef.h"
+#include "xen_pt.h"
+#include "hw/xen/xen-legacy-backend.h"
 
 
 #define XEN_PT_AUTO_ASSIGN -1
diff --git a/include/hw/xen/xen.h b/include/hw/xen/xen.h
index 56b1c2a827..2bd8ec742d 100644
--- a/include/hw/xen/xen.h
+++ b/include/hw/xen/xen.h
@@ -8,15 +8,21 @@
 #define QEMU_HW_XEN_H
 
 /*
- * As a temporary measure while the headers are being untangled, define
- * __XEN_TOOLS__ here before any Xen headers are included. Otherwise, if
- * the Xen toolstack library headers are later included, they will find
- * some of the "internal" definitions missing and the build will fail. In
- * later commits, we'll end up with a rule that the native libraries have
- * to be included first, which will ensure that the libraries get the
- * version of Xen libraries that they expect.
+ * C files using Xen toolstack libraries will have included those headers
+ * already via xen_native.h, and having __XEM_TOOLS__ defined will have
+ * automatically set __XEN_INTERFACE_VERSION__ to the latest supported
+ * by the *system* Xen headers which were transitively included.
+ *
+ * C files which are part of the internal emulation, and which did not
+ * include xen_native.h, may need this defined so that the Xen headers
+ * imported to include/hw/xen/interface/ will expose the appropriate API
+ * version.
+ *
+ * This is why there's a rule that xen_native.h must be included first.
  */
-#define __XEN_TOOLS__ 1
+#ifndef __XEN_INTERFACE_VERSION__
+#define __XEN_INTERFACE_VERSION__ 0x00040e00
+#endif
 
 #include "exec/cpu-common.h"
 
diff --git a/include/hw/xen/xen_common.h b/include/hw/xen/xen_native.h
similarity index 98%
rename from include/hw/xen/xen_common.h
rename to include/hw/xen/xen_native.h
index 7edcf3eb25..6bcc83baf9 100644
--- a/include/hw/xen/xen_common.h
+++ b/include/hw/xen/xen_native.h
@@ -1,5 +1,9 @@
-#ifndef QEMU_HW_XEN_COMMON_H
-#define QEMU_HW_XEN_COMMON_H
+#ifndef QEMU_HW_XEN_NATIVE_H
+#define QEMU_HW_XEN_NATIVE_H
+
+#ifdef __XEN_INTERFACE_VERSION__
+#error In Xen native files, include xen_native.h before other Xen headers
+#endif
 
 /*
  * If we have new enough libxenctrl then we do not want/need these compat
@@ -622,4 +626,4 @@ static inline int xen_set_ioreq_server_state(domid_t dom,
 
 #endif
 
-#endif /* QEMU_HW_XEN_COMMON_H */
+#endif /* QEMU_HW_XEN_NATIVE_H */
diff --git a/include/hw/xen/xen_pvdev.h b/include/hw/xen/xen_pvdev.h
index d8eea353b8..ddad4b9f36 100644
--- a/include/hw/xen/xen_pvdev.h
+++ b/include/hw/xen/xen_pvdev.h
@@ -1,8 +1,9 @@
 #ifndef QEMU_HW_XEN_PVDEV_H
 #define QEMU_HW_XEN_PVDEV_H
 
+#include "hw/qdev-core.h"
 #include "hw/xen/xen_backend_ops.h"
-#include "hw/xen/xen_common.h"
+
 /* ------------------------------------------------------------- */
 
 #define XEN_BUFSIZE 1024
-- 
2.39.0


