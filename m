Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7135B5693E4
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 23:08:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362549.592666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9CGC-0000Ee-CM; Wed, 06 Jul 2022 21:08:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362549.592666; Wed, 06 Jul 2022 21:08:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9CGC-00008t-3q; Wed, 06 Jul 2022 21:08:36 +0000
Received: by outflank-mailman (input) for mailman id 362549;
 Wed, 06 Jul 2022 21:08:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJEZ=XL=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1o9CFW-0003HV-9b
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 21:07:54 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b1eea131-fd6f-11ec-924f-1f966e50362f;
 Wed, 06 Jul 2022 23:07:52 +0200 (CEST)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1657141518204185.36893009232347;
 Wed, 6 Jul 2022 14:05:18 -0700 (PDT)
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
X-Inumbo-ID: b1eea131-fd6f-11ec-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; t=1657141520; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ue1eFEAVuXgejFvAA+0yve4SHos8OvlwOoZRAvApcYMSGy+9pBEIMLkrMJiSyhD0HscYiMrbOqu8ZYkcnyyr/gJB0jISG4TDkwqKmpJspwli5Cd1urWnGazn6WLsIJN5PZlJspDbC6CiLa7eUI11SN3HUOHIPMEG956hzP0lfbs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1657141520; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=F4LzAhNPz1Ut05j8lMJsWMf8SmFv3K61ZtdVdpesbfA=; 
	b=gc6mXWqlp7guNMHg/OlgAe8zR8zr9/2z6/Hi3fR9d7Dn5sij9HLJzf3nVKYrM1vEE1M5AMbj59iBJ6ua5DkWYWGZxeij3czMtL4vYS2BhAe1+Fe0b2L39GADKlrdt5PAml8UOfz+iMKtGc2KYMSIL4dbWnyPu+mLQgxVGQvvvVQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1657141520;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=F4LzAhNPz1Ut05j8lMJsWMf8SmFv3K61ZtdVdpesbfA=;
	b=e6xBEFOFce8A+eAooJUkrcJudnW0akQ8Er0WlYkmWnsHROtQYQ50y3+5ETDM1qiv
	mK0gjlizY++GnCuUB+7EG5yKBevt3+AaS7hhI8YHSPQ2ov/mamqP2kXJ/pUbCegif9r
	FR67yWmaULGDF3K0z6yMWppXs+d5NLFunVisrfAQ=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org,
	Wei Liu <wl@xen.org>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	scott.davis@starlab.io,
	christopher.clark@starlab.io,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 10/18] x86: introduce the domain builder
Date: Wed,  6 Jul 2022 17:04:45 -0400
Message-Id: <20220706210454.30096-11-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220706210454.30096-1-dpsmith@apertussolutions.com>
References: <20220706210454.30096-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This commit introduces the domain builder configuration FDT parser along with
the domain builder core for domain creation. To enable domain builder to be a
cross architecture internal API, a new arch domain creation call is introduced
for use by the domain builder.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Christopher Clark <christopher.clark@starlab.io>
---
 xen/arch/x86/setup.c               |   9 +
 xen/common/Makefile                |   1 +
 xen/common/domain-builder/Makefile |   2 +
 xen/common/domain-builder/core.c   |  96 ++++++++++
 xen/common/domain-builder/fdt.c    | 295 +++++++++++++++++++++++++++++
 xen/common/domain-builder/fdt.h    |   7 +
 xen/include/xen/bootinfo.h         |  16 ++
 xen/include/xen/domain_builder.h   |   1 +
 8 files changed, 427 insertions(+)
 create mode 100644 xen/common/domain-builder/Makefile
 create mode 100644 xen/common/domain-builder/core.c
 create mode 100644 xen/common/domain-builder/fdt.c
 create mode 100644 xen/common/domain-builder/fdt.h

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index e4060d6219..28dbfcd209 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1,4 +1,6 @@
+#include <xen/bootdomain.h>
 #include <xen/bootinfo.h>
+#include <xen/domain_builder.h>
 #include <xen/init.h>
 #include <xen/lib.h>
 #include <xen/err.h>
@@ -826,6 +828,13 @@ static struct domain *__init create_dom0(const struct boot_info *bi)
     return d;
 }
 
+void __init arch_create_dom(
+    const struct boot_info *bi, struct boot_domain *bd)
+{
+    if ( builder_is_initdom(bd) )
+        create_dom0(bi);
+}
+
 /* How much of the directmap is prebuilt at compile time. */
 #define PREBUILT_MAP_LIMIT (1 << L2_PAGETABLE_SHIFT)
 
diff --git a/xen/common/Makefile b/xen/common/Makefile
index ebd3e2d659..eb108fa107 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -72,6 +72,7 @@ extra-y := symbols-dummy.o
 obj-$(CONFIG_COVERAGE) += coverage/
 obj-y += sched/
 obj-$(CONFIG_UBSAN) += ubsan/
+obj-y += domain-builder/
 
 obj-$(CONFIG_NEEDS_LIBELF) += libelf/
 obj-$(CONFIG_CORE_DEVICE_TREE) += libfdt/
diff --git a/xen/common/domain-builder/Makefile b/xen/common/domain-builder/Makefile
new file mode 100644
index 0000000000..9561602502
--- /dev/null
+++ b/xen/common/domain-builder/Makefile
@@ -0,0 +1,2 @@
+obj-$(CONFIG_BUILDER_FDT) += fdt.o
+obj-y += core.o
diff --git a/xen/common/domain-builder/core.c b/xen/common/domain-builder/core.c
new file mode 100644
index 0000000000..b030b07d71
--- /dev/null
+++ b/xen/common/domain-builder/core.c
@@ -0,0 +1,96 @@
+#include <xen/bootdomain.h>
+#include <xen/bootinfo.h>
+#include <xen/domain_builder.h>
+#include <xen/init.h>
+#include <xen/types.h>
+
+#include <asm/bzimage.h>
+#include <asm/setup.h>
+
+#include "fdt.h"
+
+static struct domain_builder __initdata builder;
+
+void __init builder_init(struct boot_info *info)
+{
+    struct boot_domain *d = NULL;
+
+    info->builder = &builder;
+
+    if ( IS_ENABLED(CONFIG_BUILDER_FDT) )
+    {
+        /* fdt is required to be module 0 */
+        switch ( check_fdt(info, __va(info->mods[0].start)) )
+        {
+        case 0:
+            printk("Domain Builder: initialized from config\n");
+            info->builder->fdt_enabled = true;
+            return;
+        case -EINVAL:
+            info->builder->fdt_enabled = false;
+            break;
+        case -ENODATA:
+        default:
+            panic("%s: error occured processing DTB\n", __func__);
+        }
+    }
+
+    /*
+     * No FDT config support or an FDT wasn't present, do an initial
+     * domain construction
+     */
+    printk("Domain Builder: falling back to initial domain build\n");
+    info->builder->nr_doms = 1;
+    d = &info->builder->domains[0];
+
+    d->mode = opt_dom0_pvh ? 0 : BUILD_MODE_PARAVIRTUALIZED;
+
+    d->kernel = &info->mods[0];
+    d->kernel->kind = BOOTMOD_KERNEL;
+
+    d->permissions = BUILD_PERMISSION_CONTROL | BUILD_PERMISSION_HARDWARE;
+    d->functions = BUILD_FUNCTION_CONSOLE | BUILD_FUNCTION_XENSTORE |
+                     BUILD_FUNCTION_INITIAL_DOM;
+
+    d->kernel->arch->headroom = bzimage_headroom(bootstrap_map(d->kernel),
+                                                   d->kernel->size);
+    bootstrap_map(NULL);
+
+    if ( d->kernel->string.len )
+        d->kernel->string.kind = BOOTSTR_CMDLINE;
+}
+
+uint32_t __init builder_create_domains(struct boot_info *info)
+{
+    uint32_t build_count = 0, functions_built = 0;
+    int i;
+
+    for ( i = 0; i < info->builder->nr_doms; i++ )
+    {
+        struct boot_domain *d = &info->builder->domains[i];
+
+        if ( ! IS_ENABLED(CONFIG_MULTIDOM_BUILDER) &&
+             ! builder_is_initdom(d) &&
+             functions_built & BUILD_FUNCTION_INITIAL_DOM )
+            continue;
+
+        if ( d->kernel == NULL )
+        {
+            if ( builder_is_initdom(d) )
+                panic("%s: intial domain missing kernel\n", __func__);
+
+            printk(XENLOG_ERR "%s:Dom%d definiton has no kernel\n", __func__,
+                    d->domid);
+            continue;
+        }
+
+        arch_create_dom(info, d);
+        if ( d->domain )
+        {
+            functions_built |= d->functions;
+            build_count++;
+        }
+    }
+
+    return build_count;
+}
diff --git a/xen/common/domain-builder/fdt.c b/xen/common/domain-builder/fdt.c
new file mode 100644
index 0000000000..937cc61e7a
--- /dev/null
+++ b/xen/common/domain-builder/fdt.c
@@ -0,0 +1,295 @@
+#include <xen/bootdomain.h>
+#include <xen/bootinfo.h>
+#include <xen/domain_builder.h>
+#include <xen/fdt.h>
+#include <xen/init.h>
+#include <xen/lib.h>
+#include <xen/libfdt/libfdt.h>
+#include <xen/page-size.h>
+#include <xen/pfn.h>
+#include <xen/types.h>
+
+#include <asm/bzimage.h>
+#include <asm/setup.h>
+
+#include "fdt.h"
+
+#define BUILDER_FDT_TARGET_UNK 0
+#define BUILDER_FDT_TARGET_X86 1
+#define BUILDER_FDT_TARGET_ARM 2
+static int __initdata target_arch = BUILDER_FDT_TARGET_UNK;
+
+static struct boot_module *read_module(
+    const void *fdt, int node, uint32_t address_cells, uint32_t size_cells,
+    struct boot_info *info)
+{
+    const struct fdt_property *prop;
+    const __be32 *cell;
+    struct boot_module *bm;
+    bootmodule_kind kind = BOOTMOD_UNKNOWN;
+    int len;
+
+    if ( device_tree_node_compatible(fdt, node, "module,kernel") )
+        kind = BOOTMOD_KERNEL;
+
+    if ( device_tree_node_compatible(fdt, node, "module,ramdisk") )
+        kind = BOOTMOD_RAMDISK;
+
+    if ( device_tree_node_compatible(fdt, node, "module,microcode") )
+        kind = BOOTMOD_UCODE;
+
+    if ( device_tree_node_compatible(fdt, node, "module,xsm-policy") )
+        kind = BOOTMOD_XSM;
+
+    if ( device_tree_node_compatible(fdt, node, "module,config") )
+        kind = BOOTMOD_GUEST_CONF;
+
+    if ( device_tree_node_compatible(fdt, node, "module,index") )
+    {
+        uint32_t idx;
+
+        idx = (uint32_t)device_tree_get_u32(fdt, node, "module-index", 0);
+        if ( idx == 0 )
+            return NULL;
+
+        bm = &info->mods[idx];
+
+        bm->kind = kind;
+
+        return bm;
+    }
+
+    if ( device_tree_node_compatible(fdt, node, "module,addr") )
+    {
+        uint64_t addr, size;
+
+        prop = fdt_get_property(fdt, node, "module-addr", &len);
+        if ( !prop )
+            return NULL;
+
+        if ( len < dt_cells_to_size(address_cells + size_cells) )
+            return NULL;
+
+        cell = (const __be32 *)prop->data;
+        device_tree_get_reg(
+            &cell, address_cells, size_cells, &addr, &size);
+
+        bm = bootmodule_next_by_addr(info, addr, NULL);
+
+        bm->kind = kind;
+
+        return bm;
+    }
+
+    printk(XENLOG_WARNING
+           "builder fdt: module node %d, no index or addr provided\n",
+           node);
+
+    return NULL;
+}
+
+static int process_config_node(
+    const void *fdt, int node, const char *name, int depth,
+    uint32_t address_cells, uint32_t size_cells, void *data)
+{
+    struct boot_info *info = (struct boot_info *)data;
+    int node_next;
+
+    if ( !info )
+        return -1;
+
+    for ( node_next = fdt_first_subnode(fdt, node);
+          node_next > 0;
+          node_next = fdt_next_subnode(fdt, node_next))
+        read_module(fdt, node_next, address_cells, size_cells, info);
+
+    return 0;
+}
+
+static int process_domain_node(
+    const void *fdt, int node, const char *name, int depth,
+    uint32_t address_cells, uint32_t size_cells, void *data)
+{
+    struct boot_info *info = (struct boot_info *)data;
+    const struct fdt_property *prop;
+    struct boot_domain *domain;
+    int node_next, i, plen;
+
+    if ( !info )
+        return -1;
+
+    if ( info->builder->nr_doms >= BUILD_MAX_BOOT_DOMAINS )
+        return -1;
+
+    domain = &info->builder->domains[info->builder->nr_doms];
+
+    domain->domid = (domid_t)device_tree_get_u32(fdt, node, "domid", 0);
+    domain->permissions = device_tree_get_u32(fdt, node, "permissions", 0);
+    domain->functions = device_tree_get_u32(fdt, node, "functions", 0);
+    domain->mode = device_tree_get_u32(fdt, node, "mode", 0);
+
+    prop = fdt_get_property(fdt, node, "domain-uuid", &plen);
+    if ( prop )
+        for ( i=0; i < sizeof(domain->uuid) % sizeof(uint32_t); i++ )
+            *(domain->uuid + i) = fdt32_to_cpu((uint32_t)prop->data[i]);
+
+    domain->ncpus = device_tree_get_u32(fdt, node, "cpus", 1);
+
+    if ( target_arch == BUILDER_FDT_TARGET_X86 )
+    {
+        prop = fdt_get_property(fdt, node, "memory", &plen);
+        if ( prop )
+        {
+            int sz = fdt32_to_cpu(prop->len);
+            char s[64];
+            unsigned long val;
+
+            if ( sz >= 64 )
+                panic("node %s invalid `memory' property\n", name);
+
+            memcpy(s, prop->data, sz);
+            s[sz] = '\0';
+            val = parse_size_and_unit(s, NULL);
+
+            domain->meminfo.mem_size.nr_pages = PFN_UP(val);
+            domain->meminfo.mem_max.nr_pages = PFN_UP(val);
+        }
+        else
+            panic("node %s missing `memory' property\n", name);
+    }
+    else
+            panic("%s: only x86 memory parsing supported\n", __func__);
+
+    prop = fdt_get_property(fdt, node, "security-id",
+                                &plen);
+    if ( prop )
+    {
+        int sz = fdt32_to_cpu(prop->len);
+        sz = sz > BUILD_MAX_SECID_LEN ?  BUILD_MAX_SECID_LEN : sz;
+        memcpy(domain->secid, prop->data, sz);
+    }
+
+    for ( node_next = fdt_first_subnode(fdt, node);
+          node_next > 0;
+          node_next = fdt_next_subnode(fdt, node_next))
+    {
+        struct boot_module *bm = read_module(fdt, node_next, address_cells,
+                                             size_cells, info);
+
+        switch ( bm->kind )
+        {
+        case BOOTMOD_KERNEL:
+            /* kernel was already found */
+            if ( domain->kernel != NULL )
+                continue;
+
+            bm->arch->headroom = bzimage_headroom(bootstrap_map(bm), bm->size);
+            bootstrap_map(NULL);
+
+            if ( bm->string.len )
+                bm->string.kind = BOOTSTR_CMDLINE;
+            else
+            {
+                prop = fdt_get_property(fdt, node_next, "bootargs", &plen);
+                if ( prop )
+                {
+                    int size = fdt32_to_cpu(prop->len);
+                    size = size > BOOTMOD_MAX_STRING ?
+                           BOOTMOD_MAX_STRING : size;
+                    memcpy(bm->string.bytes, prop->data, size);
+                    bm->string.kind = BOOTSTR_CMDLINE;
+                }
+            }
+
+            domain->kernel = bm;
+
+            break;
+        case BOOTMOD_RAMDISK:
+            /* ramdisk was already found */
+            if ( domain->ramdisk != NULL )
+                continue;
+
+            domain->ramdisk = bm;
+
+            break;
+        case BOOTMOD_GUEST_CONF:
+            /* guest config was already found */
+            if ( domain->configs[BUILD_DOM_CONF_IDX] != NULL )
+                continue;
+
+            domain->configs[BUILD_DOM_CONF_IDX] = bm;
+
+            break;
+        default:
+            continue;
+        }
+    }
+
+    info->builder->nr_doms++;
+
+    return 0;
+}
+
+static int __init scan_node(
+    const void *fdt, int node, const char *name, int depth, u32 address_cells,
+    u32 size_cells, void *data)
+{
+    int rc = -1;
+
+    /* skip nodes that are not direct children of the hyperlaunch node */
+    if ( depth > 1 )
+        return 0;
+
+    if ( device_tree_node_compatible(fdt, node, "xen,config") )
+        rc = process_config_node(fdt, node, name, depth,
+                                 address_cells, size_cells, data);
+    else if ( device_tree_node_compatible(fdt, node, "xen,domain") )
+        rc = process_domain_node(fdt, node, name, depth,
+                                 address_cells, size_cells, data);
+
+    if ( rc < 0 )
+        printk("hyperlaunch fdt: node `%s'failed to parse\n", name);
+
+    return rc;
+}
+
+/* check_fdt
+ *   Attempts to initialize hyperlaunch config
+ *
+ * Returns:
+ *    -EINVAL: Not a valid DTB
+ *   -ENODATA: Valid DTB but not a valid hyperlaunch device tree
+ *          0: Valid hyperlaunch device tree
+ */
+int __init check_fdt(struct boot_info *info, void *fdt)
+{
+    int hv_node, ret;
+
+    ret = fdt_check_header(fdt);
+    if ( ret < 0 )
+        return -EINVAL;
+
+    hv_node = fdt_path_offset(fdt, "/chosen/hypervisor");
+    if ( hv_node < 0 )
+        return -ENODATA;
+
+    if ( !device_tree_node_compatible(fdt, hv_node, "hypervisor,xen") )
+        return -EINVAL;
+
+    if ( IS_ENABLED(CONFIG_X86) &&
+         device_tree_node_compatible(fdt, hv_node, "xen,x86") )
+        target_arch = BUILDER_FDT_TARGET_X86;
+    else if ( IS_ENABLED(CONFIG_ARM) &&
+              device_tree_node_compatible(fdt, hv_node, "xen,arm") )
+        target_arch = BUILDER_FDT_TARGET_ARM;
+
+    if ( target_arch != BUILDER_FDT_TARGET_X86 &&
+         target_arch != BUILDER_FDT_TARGET_ARM )
+        return -EINVAL;
+
+    ret = device_tree_for_each_node(fdt, hv_node, scan_node, boot_info);
+    if ( ret > 0 )
+        return -ENODATA;
+
+    return 0;
+}
diff --git a/xen/common/domain-builder/fdt.h b/xen/common/domain-builder/fdt.h
new file mode 100644
index 0000000000..b185718412
--- /dev/null
+++ b/xen/common/domain-builder/fdt.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef COMMON_BUILDER_FDT_H
+#define COMMON_BUILDER_FDT_H
+
+int __init check_fdt(struct boot_info *info, void *fdt);
+#endif
diff --git a/xen/include/xen/bootinfo.h b/xen/include/xen/bootinfo.h
index 1d76d99a40..07b151e318 100644
--- a/xen/include/xen/bootinfo.h
+++ b/xen/include/xen/bootinfo.h
@@ -101,6 +101,22 @@ static inline struct boot_module *bootmodule_next_by_kind(
     return NULL;
 }
 
+static inline struct boot_module *bootmodule_next_by_addr(
+    const struct boot_info *bi, paddr_t addr, struct boot_module *start)
+{
+    /* point end at the entry for xen */
+    struct boot_module *end = &bi->mods[bi->nr_mods];
+
+    if ( !start )
+        start = bi->mods;
+
+    for ( ; start < end; start++ )
+        if ( start->start == addr )
+            return start;
+
+    return NULL;
+}
+
 static inline void bootmodule_update_start(struct boot_module *b, paddr_t new_start)
 {
     b->start = new_start;
diff --git a/xen/include/xen/domain_builder.h b/xen/include/xen/domain_builder.h
index 79785ef251..c0d997f7bd 100644
--- a/xen/include/xen/domain_builder.h
+++ b/xen/include/xen/domain_builder.h
@@ -51,5 +51,6 @@ static inline struct domain *builder_get_hwdom(struct boot_info *info)
 
 void builder_init(struct boot_info *info);
 uint32_t builder_create_domains(struct boot_info *info);
+void arch_create_dom(const struct boot_info *bi, struct boot_domain *bd);
 
 #endif /* XEN_DOMAIN_BUILDER_H */
-- 
2.20.1


