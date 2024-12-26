Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A5F9FCC0D
	for <lists+xen-devel@lfdr.de>; Thu, 26 Dec 2024 18:00:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.863281.1274722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tQrDq-0006i8-M4; Thu, 26 Dec 2024 17:00:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 863281.1274722; Thu, 26 Dec 2024 17:00:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tQrDq-0006fz-EJ; Thu, 26 Dec 2024 17:00:30 +0000
Received: by outflank-mailman (input) for mailman id 863281;
 Thu, 26 Dec 2024 17:00:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vkhu=TT=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tQrCH-00026T-H5
 for xen-devel@lists.xenproject.org; Thu, 26 Dec 2024 16:58:53 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aebecc99-c3aa-11ef-a0da-8be0dac302b0;
 Thu, 26 Dec 2024 17:58:53 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1735232277910815.1102165773889;
 Thu, 26 Dec 2024 08:57:57 -0800 (PST)
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
X-Inumbo-ID: aebecc99-c3aa-11ef-a0da-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1735232281; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WYIn9XY6vpvXFT5X8bk8CqZfaq6m+vH6VR+LqpDtUylJ8CrfmGej/AHOigsDE2/oIALnm2MkWKFv0ln7NoFIvtPRZPEu7+J1e8qvUFMfu7GivZBdoyLh5dSAzIo9I4jVv/5dKL+Q8awyXUN4HgxYIlU04i2Bh7NiNiBTRmnTUtM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1735232281; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=LG2YwRtPS1LBhMACiQKrmt4rkbz967gy6EJa6rK3Ja8=; 
	b=TcbymdHc2/avL3xTlTq3kMjj2x/Sc8amUCU7VD9roTH+ih43fp3lVW56/QpwAS86bA/jAc+I9LM55cSo7P10b2/qCPLFdpSXC779obFgTlofTRE2vEUH8qDtcNwyFPS0U4paQY9k+sQTgdiEx/FZk0mcguXKzpv1xSc7ChQR/wE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1735232281;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=LG2YwRtPS1LBhMACiQKrmt4rkbz967gy6EJa6rK3Ja8=;
	b=UZN+CVPV/422zdyxIt3TB+cW9hp2YjYet50NMIlJfAlfu8JWWnsu3fI057L142iZ
	h4R8VioyUXZPRDWULFU6/6kwrX6gODUeduDYng6KwHDPiuPXLxj/wUGRZNyoLSXTDQC
	zuJxV86UBFS7xPOBIBKY0AAWUdtvIhkGrJQ9mWzg=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 06/15] x86/hyperlaunch: introduce the domain builder
Date: Thu, 26 Dec 2024 11:57:31 -0500
Message-Id: <20241226165740.29812-7-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241226165740.29812-1-dpsmith@apertussolutions.com>
References: <20241226165740.29812-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Introduce the domain builder which is capable of consuming a device tree as the
first boot module. If it finds a device tree as the first boot module, it will
set its type to BOOTMOD_FDT. This change only detects the boot module and
continues to boot with slight change to the boot convention that the dom0
kernel is no longer first boot module but is the second.

No functional change intended.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
Changes since v1:
- coding style compliance
- removed unnecessary include of rangeset.h
- fixed a missed change from 0 to i
- add missing const
- remove unnecessary first_boot_module_index() usages
---
 xen/arch/x86/Kconfig                     |  2 +-
 xen/arch/x86/Makefile                    |  2 +
 xen/arch/x86/domain-builder/Makefile     |  3 ++
 xen/arch/x86/domain-builder/core.c       | 57 ++++++++++++++++++++++++
 xen/arch/x86/domain-builder/fdt.c        | 37 +++++++++++++++
 xen/arch/x86/domain-builder/fdt.h        | 21 +++++++++
 xen/arch/x86/include/asm/bootinfo.h      |  3 ++
 xen/arch/x86/include/asm/domainbuilder.h |  8 ++++
 xen/arch/x86/setup.c                     | 17 ++++---
 9 files changed, 143 insertions(+), 7 deletions(-)
 create mode 100644 xen/arch/x86/domain-builder/Makefile
 create mode 100644 xen/arch/x86/domain-builder/core.c
 create mode 100644 xen/arch/x86/domain-builder/fdt.c
 create mode 100644 xen/arch/x86/domain-builder/fdt.h
 create mode 100644 xen/arch/x86/include/asm/domainbuilder.h

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 25b9b75423c5..50b4697da565 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -383,7 +383,7 @@ config ALTP2M
 
 	  If unsure, stay with defaults.
 
-source "arch/x86/domain_builder/Kconfig"
+source "arch/x86/domain-builder/Kconfig"
 
 endmenu
 
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index b35fd5196ce2..73b332dd471b 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -81,6 +81,8 @@ obj-$(CONFIG_COMPAT) += x86_64/platform_hypercall.o
 obj-y += sysctl.o
 endif
 
+obj-y += domain-builder/
+
 extra-y += asm-macros.i
 extra-y += xen.lds
 
diff --git a/xen/arch/x86/domain-builder/Makefile b/xen/arch/x86/domain-builder/Makefile
new file mode 100644
index 000000000000..309a0c4bdd9e
--- /dev/null
+++ b/xen/arch/x86/domain-builder/Makefile
@@ -0,0 +1,3 @@
+obj-$(CONFIG_DOMAIN_BUILDER) += fdt.init.o
+obj-y += core.init.o
+
diff --git a/xen/arch/x86/domain-builder/core.c b/xen/arch/x86/domain-builder/core.c
new file mode 100644
index 000000000000..d6ae94f45c72
--- /dev/null
+++ b/xen/arch/x86/domain-builder/core.c
@@ -0,0 +1,57 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2024, Apertus Solutions, LLC
+ */
+#include <xen/err.h>
+#include <xen/init.h>
+#include <xen/kconfig.h>
+#include <xen/lib.h>
+
+#include <asm/bootinfo.h>
+
+#include "fdt.h"
+
+void __init builder_init(struct boot_info *bi)
+{
+    if ( IS_ENABLED(CONFIG_DOMAIN_BUILDER) )
+    {
+        int ret;
+
+        switch ( ret = has_hyperlaunch_fdt(bi) )
+        {
+        case 0:
+            printk("Hyperlaunch device tree detected\n");
+            bi->hyperlaunch_enabled = true;
+            bi->mods[0].type = BOOTMOD_FDT;
+            break;
+
+        case -EINVAL:
+            printk("Hyperlaunch device tree was not detected\n");
+            bi->hyperlaunch_enabled = false;
+            break;
+
+        case -ENOENT:
+        case -ENODATA:
+            printk("Device tree found, but not hyperlaunch (%d)\n", ret);
+            bi->hyperlaunch_enabled = false;
+            bi->mods[0].type = BOOTMOD_FDT;
+            break;
+
+        default:
+            printk("Unknown error (%d) occured checking for hyperlaunch device tree\n",
+                   ret);
+            bi->hyperlaunch_enabled = false;
+            break;
+        }
+    }
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/x86/domain-builder/fdt.c b/xen/arch/x86/domain-builder/fdt.c
new file mode 100644
index 000000000000..4a3f80648f86
--- /dev/null
+++ b/xen/arch/x86/domain-builder/fdt.c
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2024, Apertus Solutions, LLC
+ */
+#include <xen/err.h>
+#include <xen/init.h>
+#include <xen/lib.h>
+#include <xen/libfdt/libfdt.h>
+
+#include <asm/bootinfo.h>
+#include <asm/page.h>
+#include <asm/setup.h>
+
+#include "fdt.h"
+
+int __init has_hyperlaunch_fdt(struct boot_info *bi)
+{
+    int ret = 0;
+    const void *fdt = bootstrap_map_bm(&bi->mods[HYPERLAUNCH_MODULE_IDX]);
+
+    if ( fdt_check_header(fdt) < 0 )
+        ret = -EINVAL;
+
+    bootstrap_unmap();
+
+    return ret;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/x86/domain-builder/fdt.h b/xen/arch/x86/domain-builder/fdt.h
new file mode 100644
index 000000000000..1c1569a9c633
--- /dev/null
+++ b/xen/arch/x86/domain-builder/fdt.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
+#ifndef __XEN_X86_FDT_H__
+#define __XEN_X86_FDT_H__
+
+#include <xen/init.h>
+
+#include <asm/bootinfo.h>
+
+/* hyperlaunch fdt is required to be module 0 */
+#define HYPERLAUNCH_MODULE_IDX 0
+
+#ifdef CONFIG_DOMAIN_BUILDER
+int has_hyperlaunch_fdt(struct boot_info *bi);
+#else
+static inline int __init has_hyperlaunch_fdt(struct boot_info *bi)
+{
+    return -EINVAL;
+}
+#endif
+
+#endif /* __XEN_X86_FDT_H__ */
diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index 9f65e2c8f62d..208bec90913d 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -27,6 +27,7 @@ enum bootmod_type {
     BOOTMOD_RAMDISK,
     BOOTMOD_MICROCODE,
     BOOTMOD_XSM_POLICY,
+    BOOTMOD_FDT,
 };
 
 struct boot_module {
@@ -80,6 +81,8 @@ struct boot_info {
     paddr_t memmap_addr;
     size_t memmap_length;
 
+    bool hyperlaunch_enabled;
+
     unsigned int nr_modules;
     struct boot_module mods[MAX_NR_BOOTMODS + 1];
     struct boot_domain domains[MAX_NR_BOOTDOMS];
diff --git a/xen/arch/x86/include/asm/domainbuilder.h b/xen/arch/x86/include/asm/domainbuilder.h
new file mode 100644
index 000000000000..aedc2b49f7c9
--- /dev/null
+++ b/xen/arch/x86/include/asm/domainbuilder.h
@@ -0,0 +1,8 @@
+#ifndef __XEN_X86_DOMBUILDER_H__
+#define __XEN_X86_DOMBUILDER_H__
+
+#include <asm/bootinfo.h>
+
+void builder_init(struct boot_info *bi);
+
+#endif
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index a61131365477..e1aa9650d22e 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -33,6 +33,7 @@
 #endif
 #include <xen/bitops.h>
 #include <asm/bootinfo.h>
+#include <asm/domainbuilder.h>
 #include <asm/smp.h>
 #include <asm/processor.h>
 #include <asm/mpspec.h>
@@ -1285,9 +1286,12 @@ void asmlinkage __init noreturn __start_xen(void)
                bi->nr_modules);
     }
 
-    /* Dom0 kernel is always first */
-    bi->mods[0].type = BOOTMOD_KERNEL;
-    bi->domains[0].kernel = &bi->mods[0];
+    builder_init(bi);
+
+    /* Find first unknown boot module to use as Dom0 kernel */
+    i = first_boot_module_index(bi, BOOTMOD_UNKNOWN);
+    bi->mods[i].type = BOOTMOD_KERNEL;
+    bi->domains[0].kernel = &bi->mods[i];
 
     if ( pvh_boot )
     {
@@ -1470,8 +1474,9 @@ void asmlinkage __init noreturn __start_xen(void)
         xen->size  = __2M_rwdata_end - _stext;
     }
 
-    bi->mods[0].headroom =
-        bzimage_headroom(bootstrap_map_bm(&bi->mods[0]), bi->mods[0].size);
+    bi->domains[0].kernel->headroom =
+        bzimage_headroom(bootstrap_map_bm(bi->domains[0].kernel),
+                         bi->domains[0].kernel->size);
     bootstrap_unmap();
 
 #ifndef highmem_start
@@ -1595,7 +1600,7 @@ void asmlinkage __init noreturn __start_xen(void)
 #endif
     }
 
-    if ( bi->mods[0].headroom && !bi->mods[0].relocated )
+    if ( bi->domains[0].kernel->headroom && !bi->domains[0].kernel->relocated )
         panic("Not enough memory to relocate the dom0 kernel image\n");
     for ( i = 0; i < bi->nr_modules; ++i )
     {
-- 
2.30.2


