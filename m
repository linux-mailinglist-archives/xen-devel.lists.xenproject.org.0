Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3155693E3
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 23:08:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362546.592639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9CG1-0007ME-Ev; Wed, 06 Jul 2022 21:08:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362546.592639; Wed, 06 Jul 2022 21:08:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9CG1-0007Iu-5H; Wed, 06 Jul 2022 21:08:25 +0000
Received: by outflank-mailman (input) for mailman id 362546;
 Wed, 06 Jul 2022 21:08:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJEZ=XL=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1o9CES-0003HV-Iv
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 21:06:48 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b0347d4-fd6f-11ec-924f-1f966e50362f;
 Wed, 06 Jul 2022 23:06:47 +0200 (CEST)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1657141512149369.82004181151626;
 Wed, 6 Jul 2022 14:05:12 -0700 (PDT)
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
X-Inumbo-ID: 8b0347d4-fd6f-11ec-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; t=1657141514; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=AODrPQsGitTUc7ZsIrIKbdIQa6xWtcDmC6BK+chBmc+swcdHPajSLVx5jV/R1hPrR4dQqrrMSykfgyZu0oa+ikEIuYMa9ow7IODBaHHTyNYiWMdS/4D/lphTFwtjtOGY4z25kIRmdhC1xkIs9U65WiS+1Q6S82dxgv4bKphD7X0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1657141514; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=Rrvu8k3I40Yg9tyliHrdCDkFpt7JnYcfPTHvIPVr/5k=; 
	b=eWvjAAp/PHtnXwC5AvtBUaLEcij1Ks1iaHLsJtJAs+DUFcbS4c3nS/yqosD8whlzwfcPF2uRx+i02QgAuIsJn9SNACDfFzRv7j/5ke4vGGlNsAyX34LZIc6qaxFQtG+Wz+YeIJT7ZY5uXZIc/0usrp5rTGOH/8k97VkOYMfLyXk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1657141514;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=Rrvu8k3I40Yg9tyliHrdCDkFpt7JnYcfPTHvIPVr/5k=;
	b=FFl9IBi7r3Mtikob3O2PQ2vXENqfnpaqW4alNDMGkB4v5T+OWnYywPb/6ISTOLTs
	cKOSjO+Adt7DQVz5SuZR2tpvdckxGm1flVmsWtaH2/KRwwb38HTuRME0PgLSk30999N
	KGHKhtDy9EA8B6X3CJx2gGeN3KB3piigHb8wQovQ=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	scott.davis@starlab.io,
	christopher.clark@starlab.io,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v1 06/18] fdt: make fdt handling reusable across arch
Date: Wed,  6 Jul 2022 17:04:41 -0400
Message-Id: <20220706210454.30096-7-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220706210454.30096-1-dpsmith@apertussolutions.com>
References: <20220706210454.30096-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This refactors reusable code from Arm's bootfdt.c and device-tree.h that is
general fdt handling code.  The Kconfig parameter CORE_DEVICE_TREE is
introduced for when the ability of parsing DTB files is needed by a capability
such as hyperlaunch.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Christopher Clark <christopher.clark@starlab.io>
---
 xen/arch/arm/bootfdt.c        | 115 +----------------------------
 xen/common/Kconfig            |   4 ++
 xen/common/Makefile           |   3 +-
 xen/common/fdt.c              | 131 ++++++++++++++++++++++++++++++++++
 xen/include/xen/device_tree.h |  50 +------------
 xen/include/xen/fdt.h         |  79 ++++++++++++++++++++
 6 files changed, 218 insertions(+), 164 deletions(-)
 create mode 100644 xen/common/fdt.c
 create mode 100644 xen/include/xen/fdt.h

diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index ec81a45de9..ddedb55fe7 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/arch/arm/bootfdt.c
@@ -14,53 +14,11 @@
 #include <xen/efi.h>
 #include <xen/device_tree.h>
 #include <xen/libfdt/libfdt.h>
+#include <xen/fdt.h>
 #include <xen/sort.h>
 #include <xsm/xsm.h>
 #include <asm/setup.h>
 
-static bool __init device_tree_node_matches(const void *fdt, int node,
-                                            const char *match)
-{
-    const char *name;
-    size_t match_len;
-
-    name = fdt_get_name(fdt, node, NULL);
-    match_len = strlen(match);
-
-    /* Match both "match" and "match@..." patterns but not
-       "match-foo". */
-    return strncmp(name, match, match_len) == 0
-        && (name[match_len] == '@' || name[match_len] == '\0');
-}
-
-static bool __init device_tree_node_compatible(const void *fdt, int node,
-                                               const char *match)
-{
-    int len, l;
-    const void *prop;
-
-    prop = fdt_getprop(fdt, node, "compatible", &len);
-    if ( prop == NULL )
-        return false;
-
-    while ( len > 0 ) {
-        if ( !dt_compat_cmp(prop, match) )
-            return true;
-        l = strlen(prop) + 1;
-        prop += l;
-        len -= l;
-    }
-
-    return false;
-}
-
-void __init device_tree_get_reg(const __be32 **cell, u32 address_cells,
-                                u32 size_cells, u64 *start, u64 *size)
-{
-    *start = dt_next_cell(address_cells, cell);
-    *size = dt_next_cell(size_cells, cell);
-}
-
 static int __init device_tree_get_meminfo(const void *fdt, int node,
                                           const char *prop_name,
                                           u32 address_cells, u32 size_cells,
@@ -108,77 +66,6 @@ static int __init device_tree_get_meminfo(const void *fdt, int node,
     return 0;
 }
 
-u32 __init device_tree_get_u32(const void *fdt, int node,
-                               const char *prop_name, u32 dflt)
-{
-    const struct fdt_property *prop;
-
-    prop = fdt_get_property(fdt, node, prop_name, NULL);
-    if ( !prop || prop->len < sizeof(u32) )
-        return dflt;
-
-    return fdt32_to_cpu(*(uint32_t*)prop->data);
-}
-
-/**
- * device_tree_for_each_node - iterate over all device tree sub-nodes
- * @fdt: flat device tree.
- * @node: parent node to start the search from
- * @func: function to call for each sub-node.
- * @data: data to pass to @func.
- *
- * Any nodes nested at DEVICE_TREE_MAX_DEPTH or deeper are ignored.
- *
- * Returns 0 if all nodes were iterated over successfully.  If @func
- * returns a value different from 0, that value is returned immediately.
- */
-int __init device_tree_for_each_node(const void *fdt, int node,
-                                     device_tree_node_func func,
-                                     void *data)
-{
-    /*
-     * We only care about relative depth increments, assume depth of
-     * node is 0 for simplicity.
-     */
-    int depth = 0;
-    const int first_node = node;
-    u32 address_cells[DEVICE_TREE_MAX_DEPTH];
-    u32 size_cells[DEVICE_TREE_MAX_DEPTH];
-    int ret;
-
-    do {
-        const char *name = fdt_get_name(fdt, node, NULL);
-        u32 as, ss;
-
-        if ( depth >= DEVICE_TREE_MAX_DEPTH )
-        {
-            printk("Warning: device tree node `%s' is nested too deep\n",
-                   name);
-            continue;
-        }
-
-        as = depth > 0 ? address_cells[depth-1] : DT_ROOT_NODE_ADDR_CELLS_DEFAULT;
-        ss = depth > 0 ? size_cells[depth-1] : DT_ROOT_NODE_SIZE_CELLS_DEFAULT;
-
-        address_cells[depth] = device_tree_get_u32(fdt, node,
-                                                   "#address-cells", as);
-        size_cells[depth] = device_tree_get_u32(fdt, node,
-                                                "#size-cells", ss);
-
-        /* skip the first node */
-        if ( node != first_node )
-        {
-            ret = func(fdt, node, name, depth, as, ss, data);
-            if ( ret != 0 )
-                return ret;
-        }
-
-        node = fdt_next_node(fdt, node, &depth);
-    } while ( node >= 0 && depth > 0 );
-
-    return 0;
-}
-
 static int __init process_memory_node(const void *fdt, int node,
                                       const char *name, int depth,
                                       u32 address_cells, u32 size_cells,
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 41a67891bc..9fc6683932 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -31,8 +31,12 @@ config HAS_ALTERNATIVE
 config HAS_COMPAT
 	bool
 
+config CORE_DEVICE_TREE
+	bool
+
 config HAS_DEVICE_TREE
 	bool
+	select CORE_DEVICE_TREE
 
 config HAS_EX_TABLE
 	bool
diff --git a/xen/common/Makefile b/xen/common/Makefile
index 3baf83d527..ebd3e2d659 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -10,6 +10,7 @@ obj-y += domain.o
 obj-y += event_2l.o
 obj-y += event_channel.o
 obj-y += event_fifo.o
+obj-$(CONFIG_CORE_DEVICE_TREE) += fdt.o
 obj-$(CONFIG_CRASH_DEBUG) += gdbstub.o
 obj-$(CONFIG_GRANT_TABLE) += grant_table.o
 obj-y += guestcopy.o
@@ -73,7 +74,7 @@ obj-y += sched/
 obj-$(CONFIG_UBSAN) += ubsan/
 
 obj-$(CONFIG_NEEDS_LIBELF) += libelf/
-obj-$(CONFIG_HAS_DEVICE_TREE) += libfdt/
+obj-$(CONFIG_CORE_DEVICE_TREE) += libfdt/
 
 CONF_FILE := $(if $(patsubst /%,,$(KCONFIG_CONFIG)),$(objtree)/)$(KCONFIG_CONFIG)
 $(obj)/config.gz: $(CONF_FILE)
diff --git a/xen/common/fdt.c b/xen/common/fdt.c
new file mode 100644
index 0000000000..ed9347e5f7
--- /dev/null
+++ b/xen/common/fdt.c
@@ -0,0 +1,131 @@
+/*
+ * Flattened Device Tree
+ *
+ * Copyright (C) 2012-2014 Citrix Systems, Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+#include <xen/fdt.h>
+#include <xen/init.h>
+#include <xen/lib.h>
+#include <xen/libfdt/libfdt.h>
+#include <xen/types.h>
+
+bool __init device_tree_node_matches(
+    const void *fdt, int node, const char *match)
+{
+    const char *name;
+    size_t match_len;
+
+    name = fdt_get_name(fdt, node, NULL);
+    match_len = strlen(match);
+
+    /* Match both "match" and "match@..." patterns but not
+       "match-foo". */
+    return strncmp(name, match, match_len) == 0
+        && (name[match_len] == '@' || name[match_len] == '\0');
+}
+
+bool __init device_tree_node_compatible(
+    const void *fdt, int node, const char *match)
+{
+    int len, l;
+    int mlen;
+    const void *prop;
+
+    mlen = strlen(match);
+
+    prop = fdt_getprop(fdt, node, "compatible", &len);
+    if ( prop == NULL )
+        return false;
+
+    while ( len > 0 ) {
+        if ( !dt_compat_cmp(prop, match) )
+            return true;
+        l = strlen(prop) + 1;
+        prop += l;
+        len -= l;
+    }
+
+    return false;
+}
+
+void __init device_tree_get_reg(
+    const __be32 **cell, u32 address_cells, u32 size_cells, u64 *start,
+    u64 *size)
+{
+    *start = dt_next_cell(address_cells, cell);
+    *size = dt_next_cell(size_cells, cell);
+}
+
+u32 __init device_tree_get_u32(
+    const void *fdt, int node, const char *prop_name, u32 dflt)
+{
+    const struct fdt_property *prop;
+
+    prop = fdt_get_property(fdt, node, prop_name, NULL);
+    if ( !prop || prop->len < sizeof(u32) )
+        return dflt;
+
+    return fdt32_to_cpu(*(uint32_t*)prop->data);
+}
+
+/**
+ * device_tree_for_each_node - iterate over all device tree sub-nodes
+ * @fdt: flat device tree.
+ * @node: parent node to start the search from
+ * @func: function to call for each sub-node.
+ * @data: data to pass to @func.
+ *
+ * Any nodes nested at DEVICE_TREE_MAX_DEPTH or deeper are ignored.
+ *
+ * Returns 0 if all nodes were iterated over successfully.  If @func
+ * returns a value different from 0, that value is returned immediately.
+ */
+int __init device_tree_for_each_node(
+    const void *fdt, int node, device_tree_node_func func, void *data)
+{
+    /*
+     * We only care about relative depth increments, assume depth of
+     * node is 0 for simplicity.
+     */
+    int depth = 0;
+    const int first_node = node;
+    u32 address_cells[DEVICE_TREE_MAX_DEPTH];
+    u32 size_cells[DEVICE_TREE_MAX_DEPTH];
+    int ret;
+
+    do {
+        const char *name = fdt_get_name(fdt, node, NULL);
+        u32 as, ss;
+
+        if ( depth >= DEVICE_TREE_MAX_DEPTH )
+        {
+            printk("Warning: device tree node `%s' is nested too deep\n",
+                   name);
+            continue;
+        }
+
+        as = depth > 0 ? address_cells[depth-1] : DT_ROOT_NODE_ADDR_CELLS_DEFAULT;
+        ss = depth > 0 ? size_cells[depth-1] : DT_ROOT_NODE_SIZE_CELLS_DEFAULT;
+
+        address_cells[depth] = device_tree_get_u32(fdt, node,
+                                                   "#address-cells", as);
+        size_cells[depth] = device_tree_get_u32(fdt, node,
+                                                "#size-cells", ss);
+
+        /* skip the first node */
+        if ( node != first_node )
+        {
+            ret = func(fdt, node, name, depth, as, ss, data);
+            if ( ret != 0 )
+                return ret;
+        }
+
+        node = fdt_next_node(fdt, node, &depth);
+    } while ( node >= 0 && depth > 0 );
+
+    return 0;
+}
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index 430a1ef445..c98c898ffc 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -14,13 +14,12 @@
 #include <asm/device.h>
 #include <public/xen.h>
 #include <public/device_tree_defs.h>
+#include <xen/fdt.h>
 #include <xen/kernel.h>
 #include <xen/string.h>
 #include <xen/types.h>
 #include <xen/list.h>
 
-#define DEVICE_TREE_MAX_DEPTH 16
-
 /*
  * Struct used for matching a device
  */
@@ -158,17 +157,8 @@ struct dt_raw_irq {
 #define dt_irq(irq) ((irq)->irq)
 #define dt_irq_flags(irq) ((irq)->flags)
 
-typedef int (*device_tree_node_func)(const void *fdt,
-                                     int node, const char *name, int depth,
-                                     u32 address_cells, u32 size_cells,
-                                     void *data);
-
 extern const void *device_tree_flattened;
 
-int device_tree_for_each_node(const void *fdt, int node,
-                              device_tree_node_func func,
-                              void *data);
-
 /**
  * dt_unflatten_host_device_tree - Unflatten the host device tree
  *
@@ -213,14 +203,6 @@ extern const struct dt_device_node *dt_interrupt_controller;
 struct dt_device_node *
 dt_find_interrupt_controller(const struct dt_device_match *matches);
 
-#define dt_prop_cmp(s1, s2) strcmp((s1), (s2))
-#define dt_node_cmp(s1, s2) strcasecmp((s1), (s2))
-#define dt_compat_cmp(s1, s2) strcasecmp((s1), (s2))
-
-/* Default #address and #size cells */
-#define DT_ROOT_NODE_ADDR_CELLS_DEFAULT 2
-#define DT_ROOT_NODE_SIZE_CELLS_DEFAULT 1
-
 #define dt_for_each_property_node(dn, pp)                   \
     for ( pp = dn->properties; pp != NULL; pp = pp->next )
 
@@ -230,36 +212,6 @@ dt_find_interrupt_controller(const struct dt_device_match *matches);
 #define dt_for_each_child_node(dt, dn)                      \
     for ( dn = dt->child; dn != NULL; dn = dn->sibling )
 
-/* Helper to read a big number; size is in cells (not bytes) */
-static inline u64 dt_read_number(const __be32 *cell, int size)
-{
-    u64 r = 0;
-
-    while ( size-- )
-        r = (r << 32) | be32_to_cpu(*(cell++));
-    return r;
-}
-
-/* Helper to convert a number of cells to bytes */
-static inline int dt_cells_to_size(int size)
-{
-    return (size * sizeof (u32));
-}
-
-/* Helper to convert a number of bytes to cells, rounds down */
-static inline int dt_size_to_cells(int bytes)
-{
-    return (bytes / sizeof(u32));
-}
-
-static inline u64 dt_next_cell(int s, const __be32 **cellp)
-{
-    const __be32 *p = *cellp;
-
-    *cellp = p + s;
-    return dt_read_number(p, s);
-}
-
 static inline const char *dt_node_full_name(const struct dt_device_node *np)
 {
     return (np && np->full_name) ? np->full_name : "<no-node>";
diff --git a/xen/include/xen/fdt.h b/xen/include/xen/fdt.h
new file mode 100644
index 0000000000..00f9f3792f
--- /dev/null
+++ b/xen/include/xen/fdt.h
@@ -0,0 +1,79 @@
+/*
+ * Flattened Device Tree
+ *
+ * Copyright (C) 2012 Citrix Systems, Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+#ifndef __XEN_FDT_H__
+#define __XEN_FDT_H__
+
+#include <xen/init.h>
+#include <xen/libfdt/libfdt.h>
+#include <xen/types.h>
+
+#define DEVICE_TREE_MAX_DEPTH 16
+
+/* Default #address and #size cells */
+#define DT_ROOT_NODE_ADDR_CELLS_DEFAULT 2
+#define DT_ROOT_NODE_SIZE_CELLS_DEFAULT 1
+
+#define dt_prop_cmp(s1, s2) strcmp((s1), (s2))
+#define dt_node_cmp(s1, s2) strcasecmp((s1), (s2))
+#define dt_compat_cmp(s1, s2) strcasecmp((s1), (s2))
+
+/* Helper to read a big number; size is in cells (not bytes) */
+static inline u64 dt_read_number(const __be32 *cell, int size)
+{
+    u64 r = 0;
+
+    while ( size-- )
+        r = (r << 32) | be32_to_cpu(*(cell++));
+    return r;
+}
+
+/* Helper to convert a number of cells to bytes */
+static inline int dt_cells_to_size(int size)
+{
+    return (size * sizeof (u32));
+}
+
+/* Helper to convert a number of bytes to cells, rounds down */
+static inline int dt_size_to_cells(int bytes)
+{
+    return (bytes / sizeof(u32));
+}
+
+static inline u64 dt_next_cell(int s, const __be32 **cellp)
+{
+    const __be32 *p = *cellp;
+
+    *cellp = p + s;
+    return dt_read_number(p, s);
+}
+
+
+bool __init device_tree_node_matches(
+    const void *fdt, int node, const char *match);
+
+bool __init device_tree_node_compatible(
+    const void *fdt, int node, const char *match);
+
+void __init device_tree_get_reg(
+    const __be32 **cell, u32 address_cells, u32 size_cells, u64 *start,
+    u64 *size);
+
+u32 __init device_tree_get_u32(
+    const void *fdt, int node, const char *prop_name, u32 dflt);
+
+typedef int (*device_tree_node_func)(
+    const void *fdt, int node, const char *name, int depth, u32 address_cells,
+    u32 size_cells, void *data);
+
+int device_tree_for_each_node(
+    const void *fdt, int node, device_tree_node_func func, void *data);
+
+
+#endif /* __XEN_FDT_H__ */
-- 
2.20.1


