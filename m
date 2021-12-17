Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A02174794E0
	for <lists+xen-devel@lfdr.de>; Fri, 17 Dec 2021 20:34:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248856.429290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myIzI-0002hJ-69; Fri, 17 Dec 2021 19:33:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248856.429290; Fri, 17 Dec 2021 19:33:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myIzI-0002eD-1u; Fri, 17 Dec 2021 19:33:52 +0000
Received: by outflank-mailman (input) for mailman id 248856;
 Fri, 17 Dec 2021 19:33:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qR5E=RC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1myIzG-0008Bq-RP
 for xen-devel@lists.xenproject.org; Fri, 17 Dec 2021 19:33:51 +0000
Received: from sender3-of-o50.zoho.com (sender3-of-o50.zoho.com
 [136.143.184.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 414180b7-5f70-11ec-85d3-df6b77346a89;
 Fri, 17 Dec 2021 20:33:49 +0100 (CET)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1639769533980515.4791303301643;
 Fri, 17 Dec 2021 11:32:13 -0800 (PST)
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
X-Inumbo-ID: 414180b7-5f70-11ec-85d3-df6b77346a89
ARC-Seal: i=1; a=rsa-sha256; t=1639769536; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LRwyF7YjPUIvDIKpwNgdKqs0A5QpKDYz1hbsgNq0OlauuTnag0Juut2BDpHxuKM4N8N4vcPvpEpCAtbFSBmJfnr8ZRAz07gzKbpkhIVX9XB1+GCDWOaHKMsBm3HkZEpDmnAcHSv2v3maxU/iN2s232XcgkdpE6xMfIOwpICToQQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1639769536; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=7qK/q8L3Dj8oS1Z+e7fSt0NndhOrav9jTYYOlCWbcqs=; 
	b=NuhQmMUy4u9uhT32kbAEhrxNEG57dkBmNvi1+QIqmu2UM/mWuT0lIquTSQ8EwJ2aHTTyzgE1pSkYR7o37S/SanD9UB2ddvuwS1vYJ6/7s3xMdJx3U8z4u7s1qa4wv/xMoehiAooD8S7wbXApUb4Cnm7x0ONqi0iOBroPbDpvGB8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1639769536;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=7qK/q8L3Dj8oS1Z+e7fSt0NndhOrav9jTYYOlCWbcqs=;
	b=WfbS9O5T4z2pvcJtWcCoS119bQSahtxTXzmbptpSuh5zuruYweQmyNdNTfcK8OEl
	zqLTXiQcBwomOZnX3+pBicc8JnjspQNwhGYsLYjV6qt4+32rKxReDz2xML2qDPqL2jf
	q2a1QKVS0AD3hzWDwO4zLWYKqgnX7DzsysmRH3m4=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Christopher Clark <christopher.clark@starlab.io>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [RFC 07/10] hyperlaunch: add parsing of dtb
Date: Fri, 17 Dec 2021 18:34:33 -0500
Message-Id: <20211217233437.13791-8-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211217233437.13791-1-dpsmith@apertussolutions.com>
References: <20211217233437.13791-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This commit implements the parsing of a hyperlaunch device tree. It is
implemented to support a device tree containing any number of Config nodes and
Domain nodes.

RFC Note: Xen supports working with flattened device trees (FDT), DTB files,
and unflattened device trees, in-memory structures. The library libfdt provides
low-level interaction with FDTs with higher order functions spread between
arch/arm/bootfdt.c and a few in device_tree.c. While there are some FDT
handlers in device_tree.c, it primarily provides the functionality for handling
unflattened device trees.

For this RFC the general higher order FDT functions in bootfdt.c usable by
hyperlaunch were duplicated into common/setup.c for hyperlaunch usage. Longer
term it would be desired to see all reusable FDT functions centralized in
common separate from the unflattened device tree handling code in
device_tree.c.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Christopher Clark <christopher.clark@starlab.io>
---
 xen/common/setup.c      | 367 +++++++++++++++++++++++++++++++++++++++-
 xen/include/xen/setup.h |  22 ++-
 2 files changed, 387 insertions(+), 2 deletions(-)

diff --git a/xen/common/setup.c b/xen/common/setup.c
index e18ea14fe0..af2b1a422d 100644
--- a/xen/common/setup.c
+++ b/xen/common/setup.c
@@ -1,8 +1,373 @@
-#include <xen/types.h>
+#include <xen/pci.h> /* needed by device_tree.h */
+#include <xen/device_tree.h>
 #include <xen/init.h>
+#include <xen/libfdt/libfdt.h>
+#include <xen/multiboot.h>
+#include <xen/setup.h>
+#include <xen/types.h>
 
 #ifdef CONFIG_HYPERLAUNCH
 
 bool __initdata hyperlaunch_enabled;
+static struct hyperlaunch_config __initdata hl_config;
+
+/* Reusing from arch/arm/bootfdt.c */
+
+static bool __init device_tree_node_compatible(const void *fdt, int node,
+                                               const char *match)
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
+static void __init device_tree_get_reg(
+    const __be32 **cell, uint32_t address_cells, uint32_t size_cells,
+    uint64_t *start, uint64_t *size)
+{
+    *start = dt_next_cell(address_cells, cell);
+    *size = dt_next_cell(size_cells, cell);
+}
+
+static uint32_t __init device_tree_get_u32(
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
+
+/* End reuse */
+
+static bool read_module(
+    const void *fdt, int node, uint32_t address_cells, uint32_t size_cells,
+    struct hyperlaunch_config *config, struct bootmodule *bm)
+{
+    const struct fdt_property *prop;
+    const __be32 *cell;
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
+        kind = BOOTMOD_MICROCODE;
+
+    if ( device_tree_node_compatible(fdt, node, "module,xsm-policy") )
+        kind = BOOTMOD_XSM;
+
+    if ( device_tree_node_compatible(fdt, node, "module,config") )
+        kind = BOOTMOD_GUEST_CONF;
+
+    if ( device_tree_node_compatible(fdt, node, "multiboot,module") )
+    {
+#ifdef CONFIG_MULTIBOOT
+        uint32_t idx;
+
+        idx = (uint32_t)device_tree_get_u32(fdt, node, "mb-index", 0);
+        if ( idx == 0 )
+            return false;
+
+        bm->kind = kind;
+        /* under multiboot, start will just hold pointer to module entry */
+        bm->start = (paddr_t)(&config->mods[idx]);
+
+        return true;
+#else
+        return false;
+#endif
+    }
+
+    prop = fdt_get_property(fdt, node, "module-addr", &len);
+    if ( !prop )
+        return false;
+
+    if ( len < dt_cells_to_size(address_cells + size_cells) )
+        return false;
+
+    cell = (const __be32 *)prop->data;
+    device_tree_get_reg(
+        &cell, address_cells, size_cells, &(bm->start), &(bm->size));
+    bm->kind = kind;
+
+    return true;
+}
+
+static int process_config_node(
+    const void *fdt, int node, const char *name, int depth,
+    uint32_t address_cells, uint32_t size_cells, void *data)
+{
+    struct hyperlaunch_config *config = (struct hyperlaunch_config *)data;
+    uint16_t *count;
+    int node_next;
+
+    if ( !config )
+        return -1;
+
+    for ( node_next = fdt_first_subnode(fdt, node),
+          count = &(config->config.nr_mods);
+          node_next > 0;
+          node_next = fdt_next_subnode(fdt, node_next),
+          (*count)++ )
+    {
+        struct bootmodule *next_bm;
+
+        if ( *count >= HL_MAX_CONFIG_MODULES )
+        {
+            printk("Warning: truncating to %d hyperlaunch config modules\n",
+                   HL_MAX_CONFIG_MODULES);
+            return 0;
+        }
+
+        next_bm = &config->config.mods[*count];
+        read_module(fdt, node_next, address_cells, size_cells, config, next_bm);
+    }
+
+    return 0;
+}
+
+static int process_domain_node(
+    const void *fdt, int node, const char *name, int depth,
+    uint32_t address_cells, uint32_t size_cells, void *data)
+{
+    struct hyperlaunch_config *config = (struct hyperlaunch_config *)data;
+    const struct fdt_property *prop;
+    struct bootdomain *domain;
+    uint16_t *count;
+    const __be32 *cell;
+    int node_next, i, plen;
+
+    if ( !config )
+        return -1;
+
+    domain = &config->domains[config->nr_doms];
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
+    prop = fdt_get_property(fdt, node, "memory", &plen);
+    if ( !prop )
+        panic("node %s missing `memory' property\n", name);
+
+    /* TODO: convert to support reading up to two values from mem prop, min and max */
+    cell = (const __be32 *)prop->data;
+    device_tree_get_reg(&cell, address_cells, size_cells,
+                        &domain->memrange[0].start, &domain->memrange[0].size);
+
+    prop = fdt_get_property(fdt, node, "security-id",
+                                &plen);
+    if ( prop )
+    {
+        int size = fdt32_to_cpu(prop->len);
+        size = size > HL_MAX_SECID_LEN ?
+                HL_MAX_SECID_LEN : size;
+        memcpy(domain->secid, prop->data, size);
+    }
+
+    for ( node_next = fdt_first_subnode(fdt, node),
+          count = &(domain->nr_mods);
+          node_next > 0;
+          node_next = fdt_next_subnode(fdt, node_next),
+          (*count)++ )
+    {
+        struct bootmodule *next_bm;
+
+        if ( name == NULL )
+            continue;
+
+        if ( *count >= HL_MAX_DOMAIN_MODULES )
+        {
+            printk("Warning: truncating to %d hyperlaunch domain modules"
+                   " for %dth domain\n", HL_MAX_DOMAIN_MODULES,
+                   config->nr_doms);
+            break;
+        }
+
+        if ( device_tree_node_compatible(fdt, node_next, "module,kernel") )
+        {
+            prop = fdt_get_property(fdt, node_next, "bootargs", &plen);
+            if ( prop )
+            {
+                int size = fdt32_to_cpu(prop->len);
+                size = size > HL_MAX_CMDLINE_LEN ? HL_MAX_CMDLINE_LEN : size;
+                memcpy(domain->cmdline, prop->data, size);
+            }
+        }
+
+        next_bm = &domain->modules[*count];
+        read_module(fdt, node_next, address_cells, size_cells, config, next_bm);
+    }
+
+    config->nr_doms++;
+
+    return 0;
+}
+
+static int __init hl_scan_node(
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
+        printk("hyperlaunch fdt: node `%s': parsing failed\n", name);
+
+    return rc;
+}
+
+/* hyperlaunch_init:
+ *   Attempts to initialize hyperlaunch config
+ *
+ * Returns:
+ *   -1: Not a valid DTB
+ *    0: Valid DTB but not a valid hyperlaunch device tree
+ *    1: Valid hyperlaunch device tree
+ */
+int __init hyperlaunch_init(const void *fdt)
+{
+    int hl_node, ret;
+
+    ret = fdt_check_header(fdt);
+    if ( ret < 0 )
+        return -1;
+
+    hl_node = fdt_path_offset(fdt, "/chosen/hypervisor");
+    if ( hl_node < 0 )
+        return 0;
+
+    ret = device_tree_for_each_node(fdt, hl_node, hl_scan_node, &hl_config);
+    if ( ret > 0 )
+        return 0;
+
+    hyperlaunch_enabled = true;
+
+    return 1;
+}
+
+#ifdef CONFIG_MULTIBOOT
+bool __init hyperlaunch_mb_init(module_t *mods)
+{
+    bool ret = false;
+    /* fdt is required to be module 0 */
+    void *fdt = _p(mods->mod_start);
+
+    hl_config.mods = mods;
+
+    switch ( hyperlaunch_init(fdt) )
+    {
+    case 1:
+        ret = true;
+    case -1:
+        break;
+    case 0:
+    default:
+        panic("HYPERLAUNCH: nonrecoverable error occured processing DTB\n");
+    }
+
+    return ret;
+}
+#endif
 
 #endif
diff --git a/xen/include/xen/setup.h b/xen/include/xen/setup.h
index 69ea042716..fd4c23c08f 100644
--- a/xen/include/xen/setup.h
+++ b/xen/include/xen/setup.h
@@ -88,8 +88,28 @@ struct hyperlaunch_config {
 
 #ifdef CONFIG_HYPERLAUNCH
 extern bool hyperlaunch_enabled;
-#else
+
+int __init hyperlaunch_init(const void *fdt);
+
+#ifdef CONFIG_MULTIBOOT
+bool __init hyperlaunch_mb_init(module_t *mods);
+#endif
+
+#else /* CONFIG_HYPERLAUNCH */
+
 #define hyperlaunch_enabled false
+
+static inline int __init hyperlaunch_init(const void *fdt)
+{
+    return 0;
+}
+
+#ifdef CONFIG_MULTIBOOT
+static inline bool __init hyperlaunch_mb_init(module_t *mods)
+{
+    return false;
+}
 #endif
 
+#endif /* CONFIG_HYPERLAUNCH */
 #endif /* XEN_SETUP_H */
-- 
2.20.1


