Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F53569423
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 23:18:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362592.592726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9CPo-0005A6-J4; Wed, 06 Jul 2022 21:18:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362592.592726; Wed, 06 Jul 2022 21:18:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9CPo-00052n-F4; Wed, 06 Jul 2022 21:18:32 +0000
Received: by outflank-mailman (input) for mailman id 362592;
 Wed, 06 Jul 2022 21:18:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJEZ=XL=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1o9CGq-0003HV-3V
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 21:09:16 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e3214e47-fd6f-11ec-924f-1f966e50362f;
 Wed, 06 Jul 2022 23:09:14 +0200 (CEST)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1657141528926584.3775148690877;
 Wed, 6 Jul 2022 14:05:28 -0700 (PDT)
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
X-Inumbo-ID: e3214e47-fd6f-11ec-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; t=1657141530; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=N/FSL553HNCEa+TyNxWgI3ljiv4gg26j+KpjtiAjGUSlauyoUajpteJxNg7Jyy6Af3ugKVX9kpz5eob6Mk9uzLDrLqhu8aXf4wz0/e1JEVpkx6C/Tvvu2jgAp4cpWCfrCzZF+Ho2atm9u11XL7qgUR4dP6DchsYV7VKREwOEN0U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1657141530; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=uq/k8IUdG9nFheQBakIgF1OjCIHV4VLDEfRMPtZOoM8=; 
	b=H5/S1fH1YZaeMcEQ3dOAI6jaIhWA12cDBec+iG1nb+ONKanf1xzIXuAwty+mETeOeFyXetRvjar64iVwKaKUXmG1WraATQ5HoFCaC9a9+dnJNLw581uFvlTn5qIy8iyfS4qC1sPY+8k9/vZRMHlZkM4dWwKxQ8UAQtBzBovWAhM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1657141530;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=uq/k8IUdG9nFheQBakIgF1OjCIHV4VLDEfRMPtZOoM8=;
	b=bTNmAkvNs5MuJJWJBKqoCkjuO2VQ39BIvTeyEFTZb1nuzjCqnnzvEcoWhLsHH0KO
	tOrRcuESCFR2uzzOEPiL+jn2kA/hwybXIbPmTfXuy96Y63G1gmbr8c6JKZHou1MtVtk
	k2sEkZEoLi8N2IKJ617BthcUY51iiE+FGOF9Z+Os=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	scott.davis@starlab.io,
	christopher.clark@starlab.io,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v1 17/18] builder: introduce domain builder hypfs tree
Date: Wed,  6 Jul 2022 17:04:52 -0400
Message-Id: <20220706210454.30096-18-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220706210454.30096-1-dpsmith@apertussolutions.com>
References: <20220706210454.30096-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This enables domain builder to construct a hypfs tree to expose relevant domain
creation information for use by the boot domain and/or the runtime system.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Christopher Clark <christopher.clark@starlab.io>
---
 xen/common/domain-builder/Kconfig  |  11 ++
 xen/common/domain-builder/Makefile |   1 +
 xen/common/domain-builder/core.c   |   3 +
 xen/common/domain-builder/hypfs.c  | 193 +++++++++++++++++++++++++++++
 xen/include/xen/domain_builder.h   |  13 ++
 5 files changed, 221 insertions(+)
 create mode 100644 xen/common/domain-builder/hypfs.c

diff --git a/xen/common/domain-builder/Kconfig b/xen/common/domain-builder/Kconfig
index 0232e1ed8a..4b98cccfab 100644
--- a/xen/common/domain-builder/Kconfig
+++ b/xen/common/domain-builder/Kconfig
@@ -22,4 +22,15 @@ config MULTIDOM_BUILDER
 
 	  If unsure, say N.
 
+config BUILDER_HYPFS
+	bool "Domain builder hypfs support (UNSUPPORTED)" if UNSUPPORTED
+	depends on HYPFS
+	---help---
+	  Exposes the domain builder construction information
+	  through hypfs.
+
+	  This feature is currently experimental.
+
+	  If unsure, say N.
+
 endmenu
diff --git a/xen/common/domain-builder/Makefile b/xen/common/domain-builder/Makefile
index 9561602502..7aa2ea2a53 100644
--- a/xen/common/domain-builder/Makefile
+++ b/xen/common/domain-builder/Makefile
@@ -1,2 +1,3 @@
 obj-$(CONFIG_BUILDER_FDT) += fdt.o
+obj-$(CONFIG_HYPFS) += hypfs.o
 obj-y += core.o
diff --git a/xen/common/domain-builder/core.c b/xen/common/domain-builder/core.c
index c6a268eb96..f41ca3ed35 100644
--- a/xen/common/domain-builder/core.c
+++ b/xen/common/domain-builder/core.c
@@ -134,6 +134,9 @@ uint32_t __init builder_create_domains(struct boot_info *info)
         /* Free temporary buffers. */
         discard_initial_images();
 
+    if ( IS_ENABLED(CONFIG_BUILDER_HYPFS) )
+        builder_hypfs(info);
+
     return build_count;
 }
 
diff --git a/xen/common/domain-builder/hypfs.c b/xen/common/domain-builder/hypfs.c
new file mode 100644
index 0000000000..28f8b13d85
--- /dev/null
+++ b/xen/common/domain-builder/hypfs.c
@@ -0,0 +1,193 @@
+#include <xen/bootinfo.h>
+#include <xen/domain_builder.h>
+#include <xen/hypfs.h>
+#include <xen/init.h>
+#include <xen/lib.h>
+#include <xen/list.h>
+#include <xen/string.h>
+#include <xen/xmalloc.h>
+
+#define INIT_HYPFS_DIR(var, nam)                 \
+    var.e.type = XEN_HYPFS_TYPE_DIR;             \
+    var.e.encoding = XEN_HYPFS_ENC_PLAIN;        \
+    var.e.name = (nam);                          \
+    var.e.size = 0;                              \
+    var.e.max_size = 0;                          \
+    INIT_LIST_HEAD(&var.e.list);                 \
+    var.e.funcs = (&hypfs_dir_funcs);            \
+    INIT_LIST_HEAD(&var.dirlist)
+
+#define INIT_HYPFS_FIXEDSIZE(var, typ, nam, contvar, fn, wr) \
+    var.e.type = (typ);                                      \
+    var.e.encoding = XEN_HYPFS_ENC_PLAIN;                    \
+    var.e.name = (nam);                                      \
+    var.e.size = sizeof(contvar);                            \
+    var.e.max_size = (wr) ? sizeof(contvar) : 0;             \
+    var.e.funcs = (fn);                                      \
+    var.u.content = &(contvar)
+
+#define INIT_HYPFS_UINT(var, nam, contvar)                       \
+    INIT_HYPFS_FIXEDSIZE(var, XEN_HYPFS_TYPE_UINT, nam, contvar, \
+                         &hypfs_leaf_ro_funcs, 0)
+
+#define INIT_HYPFS_BOOL(var, nam, contvar)                       \
+    INIT_HYPFS_FIXEDSIZE(var, XEN_HYPFS_TYPE_BOOL, nam, contvar, \
+                         &hypfs_leaf_ro_funcs, 0)
+
+#define INIT_HYPFS_VARSIZE(var, typ, nam, msz, fn) \
+    var.e.type = (typ) ;                           \
+    var.e.encoding = XEN_HYPFS_ENC_PLAIN;          \
+    var.e.name = (nam);                            \
+    var.e.max_size = (msz);                        \
+    var.e.funcs = (fn)
+
+#define INIT_HYPFS_STRING(var, nam)               \
+    INIT_HYPFS_VARSIZE(var, XEN_HYPFS_TYPE_STRING, nam, 0, &hypfs_leaf_ro_funcs)
+
+struct device_node {
+    struct hypfs_entry_dir dir;
+
+    uint32_t evtchn;
+    struct hypfs_entry_leaf evtchn_leaf;
+
+    xen_pfn_t mfn;
+    struct hypfs_entry_leaf mfn_leaf;
+};
+
+struct domain_node {
+    char dir_name[HYPFS_DYNDIR_ID_NAMELEN];
+    struct hypfs_entry_dir dir;
+
+    char uuid[40];
+    struct hypfs_entry_leaf uuid_leaf;
+
+    uint16_t functions;
+    struct hypfs_entry_leaf func_leaf;
+
+    uint32_t ncpus;
+    struct hypfs_entry_leaf ncpus_leaf;
+
+    uint32_t mem_size;
+    struct hypfs_entry_leaf mem_sz_leaf;
+
+    uint32_t mem_max;
+    struct hypfs_entry_leaf mem_mx_leaf;
+
+    bool constructed;
+    struct hypfs_entry_leaf const_leaf;
+
+    struct device_node xs;
+
+    struct hypfs_entry_dir dev_dir;
+
+    struct device_node con_dev;
+};
+
+static struct hypfs_entry_dir __read_mostly *builder_dir;
+static struct domain_node __read_mostly *entries;
+
+static int __init alloc_hypfs(struct boot_info *info)
+{
+    if ( !(builder_dir = (struct hypfs_entry_dir *)xmalloc_bytes(
+                        sizeof(struct hypfs_entry_dir))) )
+    {
+        printk(XENLOG_WARNING "%s: unable to allocate hypfs dir\n", __func__);
+        return -ENOMEM;
+    }
+
+    builder_dir->e.type = XEN_HYPFS_TYPE_DIR;
+    builder_dir->e.encoding = XEN_HYPFS_ENC_PLAIN;
+    builder_dir->e.name = "builder";
+    builder_dir->e.size = 0;
+    builder_dir->e.max_size = 0;
+    INIT_LIST_HEAD(&builder_dir->e.list);
+    builder_dir->e.funcs = &hypfs_dir_funcs;
+    INIT_LIST_HEAD(&builder_dir->dirlist);
+
+    if ( !(entries = (struct domain_node *)xmalloc_bytes(
+                        sizeof(struct domain_node) * info->builder->nr_doms)) )
+    {
+        printk(XENLOG_WARNING "%s: unable to allocate hypfs nodes\n", __func__);
+        return -ENOMEM;
+    }
+
+    return 0;
+}
+
+void __init builder_hypfs(struct boot_info *info)
+{
+    int i;
+
+    printk("Domain Builder: creating hypfs nodes\n");
+
+    if ( alloc_hypfs(info) != 0 )
+        return;
+
+    for ( i = 0; i < info->builder->nr_doms; i++ )
+    {
+        struct domain_node *e = &entries[i];
+        struct boot_domain *bd = &info->builder->domains[i];
+        uint8_t *uuid = bd->uuid;
+
+        snprintf(e->dir_name, sizeof(e->dir_name), "%d", bd->domid);
+
+        snprintf(e->uuid, sizeof(e->uuid), "%08x-%04x-%04x-%04x-%04x%08x",
+                 *(uint32_t *)uuid, *(uint16_t *)(uuid+4),
+                 *(uint16_t *)(uuid+6), *(uint16_t *)(uuid+8),
+                 *(uint16_t *)(uuid+10), *(uint32_t *)(uuid+12));
+
+        e->functions = bd->functions;
+        e->constructed = bd->constructed;
+
+        e->ncpus = bd->ncpus;
+        e->mem_size = (bd->meminfo.mem_size.nr_pages * PAGE_SIZE)/1024;
+        e->mem_max = (bd->meminfo.mem_max.nr_pages * PAGE_SIZE)/1024;
+
+        e->xs.evtchn = bd->store.evtchn;
+        e->xs.mfn = bd->store.mfn;
+
+        e->con_dev.evtchn = bd->console.evtchn;
+        e->con_dev.mfn = bd->console.mfn;
+
+        /* Initialize and construct builder hypfs tree */
+        INIT_HYPFS_DIR(e->dir, e->dir_name);
+        INIT_HYPFS_DIR(e->xs.dir, "xenstore");
+        INIT_HYPFS_DIR(e->dev_dir, "devices");
+        INIT_HYPFS_DIR(e->con_dev.dir, "console");
+
+        INIT_HYPFS_STRING(e->uuid_leaf, "uuid");
+        hypfs_string_set_reference(&e->uuid_leaf, e->uuid);
+        INIT_HYPFS_UINT(e->func_leaf, "functions", e->functions);
+        INIT_HYPFS_UINT(e->ncpus_leaf, "ncpus", e->ncpus);
+        INIT_HYPFS_UINT(e->mem_sz_leaf, "mem_size", e->mem_size);
+        INIT_HYPFS_UINT(e->mem_mx_leaf, "mem_max", e->mem_max);
+        INIT_HYPFS_BOOL(e->const_leaf, "constructed", e->constructed);
+
+        INIT_HYPFS_UINT(e->xs.evtchn_leaf, "evtchn", e->xs.evtchn);
+        INIT_HYPFS_UINT(e->xs.mfn_leaf, "mfn", e->xs.mfn);
+
+        INIT_HYPFS_UINT(e->con_dev.evtchn_leaf, "evtchn", e->con_dev.evtchn);
+        INIT_HYPFS_UINT(e->con_dev.mfn_leaf, "mfn", e->con_dev.mfn);
+
+        hypfs_add_leaf(&e->con_dev.dir, &e->con_dev.evtchn_leaf, true);
+        hypfs_add_leaf(&e->con_dev.dir, &e->con_dev.mfn_leaf, true);
+        hypfs_add_dir(&e->dev_dir, &e->con_dev.dir, true);
+
+        hypfs_add_dir(&e->dir, &e->dev_dir, true);
+
+        hypfs_add_leaf(&e->xs.dir, &e->xs.evtchn_leaf, true);
+        hypfs_add_leaf(&e->xs.dir, &e->xs.mfn_leaf, true);
+        hypfs_add_dir(&e->dir, &e->xs.dir, true);
+
+        hypfs_add_leaf(&e->dir, &e->uuid_leaf, true);
+        hypfs_add_leaf(&e->dir, &e->func_leaf, true);
+        hypfs_add_leaf(&e->dir, &e->ncpus_leaf, true);
+        hypfs_add_leaf(&e->dir, &e->mem_sz_leaf, true);
+        hypfs_add_leaf(&e->dir, &e->mem_mx_leaf, true);
+        hypfs_add_leaf(&e->dir, &e->const_leaf, true);
+
+        hypfs_add_dir(builder_dir, &e->dir, true);
+    }
+
+    hypfs_add_dir(&hypfs_root, builder_dir, true);
+}
diff --git a/xen/include/xen/domain_builder.h b/xen/include/xen/domain_builder.h
index f9e43c9689..086968b0fe 100644
--- a/xen/include/xen/domain_builder.h
+++ b/xen/include/xen/domain_builder.h
@@ -72,4 +72,17 @@ int alloc_system_evtchn(
     const struct boot_info *info, struct boot_domain *bd);
 void arch_create_dom(const struct boot_info *bi, struct boot_domain *bd);
 
+#ifdef CONFIG_HYPFS
+
+void builder_hypfs(struct boot_info *info);
+
+#else
+
+static inline void builder_hypfs(struct boot_info *info)
+{
+    return;
+}
+
+#endif
+
 #endif /* XEN_DOMAIN_BUILDER_H */
-- 
2.20.1


