Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F09759FCC13
	for <lists+xen-devel@lfdr.de>; Thu, 26 Dec 2024 18:01:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.863305.1274764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tQrE4-0008T5-2g; Thu, 26 Dec 2024 17:00:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 863305.1274764; Thu, 26 Dec 2024 17:00:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tQrE3-0008O1-SU; Thu, 26 Dec 2024 17:00:43 +0000
Received: by outflank-mailman (input) for mailman id 863305;
 Thu, 26 Dec 2024 17:00:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vkhu=TT=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tQrCY-00026T-1D
 for xen-devel@lists.xenproject.org; Thu, 26 Dec 2024 16:59:10 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b8856058-c3aa-11ef-a0da-8be0dac302b0;
 Thu, 26 Dec 2024 17:59:09 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1735232280794596.6459264057604;
 Thu, 26 Dec 2024 08:58:00 -0800 (PST)
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
X-Inumbo-ID: b8856058-c3aa-11ef-a0da-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1735232284; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fNRrtQrI4DnLHPrEcf1U+eHVnfStHjVP44ovOqBH2sOpYuVnxB8iH8lGKPeahmO8iIq8bM9aXmWgLjfFfD2zCcqfdgTyjYJgSTTduZg+ZcAQS4YOSMXT3fxmRHkGik4DqT6+cWchfzFlp7OalGlC4O7MB2RtoznH1d/VOEbnj3M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1735232284; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=mhot9LKP2slvPRYXK9WmRlmz+pSAHze4P+sLwHMCIo4=; 
	b=PiygxbmYUe/JmcDlQnBi6Veoy/MMasnF1vd85GYDBtVA3VAMIcbDNVR2jERNEIl7wVDWEs3m8ehuaLpbsK+FT4rCNPYtmH/y1A9rgiUScGEXAYpjbCb+zAu8d/gTNrydsm0V5qZha8K3TtALflXNkZFUttagnt9PxXcN1hei+mM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1735232284;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=mhot9LKP2slvPRYXK9WmRlmz+pSAHze4P+sLwHMCIo4=;
	b=HJF5SrIgBMp8tPpth61zvRqaU+pZ4DjCS2NMyovsHNXnL+qoP3lNyGPQMbQ3oNvS
	UP+9ut71tRtTqU6Ow8B9/F1nMGXQSSLRT33mTaZykIuih2y5ebCRwrbRyGiOW47pxTI
	YsWURxWrjFd/NRbhfR9DmpkGeKQIKp16sHbQI+cs=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v2 08/15] x86/hyperlaunch: locate dom0 kernel with hyperlaunch
Date: Thu, 26 Dec 2024 11:57:33 -0500
Message-Id: <20241226165740.29812-9-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241226165740.29812-1-dpsmith@apertussolutions.com>
References: <20241226165740.29812-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Look for a subnode of type `multiboot,kernel` within a domain node. If found,
process the reg property for the MB1 module index. If the bootargs property is
present and there was not an MB1 string, then use the command line from the
device tree definition.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
Changes since v1:
- moved low-level fdt handlers to libfdt-xen.h
- coding style changes
- moved default to "unknown" up to a local declaration
- moved the general fdt parsing code out to libfdt
- reworked device tree property parsing for module index
  - reworked parsers to take index as parameter
  - parsers now return success or error value
- added check if kernel was already located, warn and continue
---
 xen/arch/x86/domain-builder/core.c  |  11 +++
 xen/arch/x86/domain-builder/fdt.c   | 118 ++++++++++++++++++++++++++++
 xen/arch/x86/domain-builder/fdt.h   |   3 +
 xen/arch/x86/setup.c                |   5 --
 xen/include/xen/libfdt/libfdt-xen.h |  76 ++++++++++++++++++
 5 files changed, 208 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/domain-builder/core.c b/xen/arch/x86/domain-builder/core.c
index c50eff34fb68..eda7fa7a8ffa 100644
--- a/xen/arch/x86/domain-builder/core.c
+++ b/xen/arch/x86/domain-builder/core.c
@@ -59,6 +59,17 @@ void __init builder_init(struct boot_info *bi)
 
         printk(XENLOG_INFO "  Number of domains: %d\n", bi->nr_domains);
     }
+    else
+    {
+        unsigned int i;
+
+        /* Find first unknown boot module to use as Dom0 kernel */
+        printk("Falling back to using first boot module as dom0\n");
+        i = first_boot_module_index(bi, BOOTMOD_UNKNOWN);
+        bi->mods[i].type = BOOTMOD_KERNEL;
+        bi->domains[0].kernel = &bi->mods[i];
+        bi->nr_domains = 1;
+    }
 }
 
 /*
diff --git a/xen/arch/x86/domain-builder/fdt.c b/xen/arch/x86/domain-builder/fdt.c
index 5793bdc9fd47..bcaee50689a6 100644
--- a/xen/arch/x86/domain-builder/fdt.c
+++ b/xen/arch/x86/domain-builder/fdt.c
@@ -13,6 +13,114 @@
 
 #include "fdt.h"
 
+static int __init hl_module_index(void *fdt, int node, uint32_t *idx)
+{
+    int ret = 0;
+    const struct fdt_property *prop =
+        fdt_get_property(fdt, node, "module-index", &ret);
+
+    /* FDT error or bad idx pointer, translate to -EINVAL */
+    if ( ret < 0 || idx == NULL )
+        return -EINVAL;
+
+    fdt_cell_as_u32((fdt32_t *)prop->data, idx);
+
+    if ( *idx > MAX_NR_BOOTMODS )
+        return -ERANGE;
+
+    return 0;
+}
+
+static int __init dom0less_module_index(
+    void *fdt, int node, int size_size, int address_size, uint32_t *idx)
+{
+    uint64_t size = ~0UL, addr = ~0UL;
+    int ret =
+        fdt_get_reg_prop(fdt, node, address_size, size_size, &addr, &size, 1);
+
+    /* FDT error or bad idx pointer, translate to -EINVAL */
+    if ( ret < 0 || idx == NULL )
+        return -EINVAL;
+
+    /* Convention is that zero size indicates address is an index */
+    if ( size != 0 )
+        return -EOPNOTSUPP;
+
+    if ( addr > MAX_NR_BOOTMODS )
+        return -ERANGE;
+
+    /*
+     * MAX_NR_BOOTMODS cannot exceed the max for MB1, represented by a u32,
+     * thus the cast down to a u32 will be safe due to the prior check.
+     */
+    *idx = (uint32_t)addr;
+
+    return 0;
+}
+
+static int __init process_domain_node(
+    struct boot_info *bi, void *fdt, int dom_node)
+{
+    int node;
+    struct boot_domain *bd = &bi->domains[bi->nr_domains];
+    const char *name = fdt_get_name(fdt, dom_node, NULL) ?: "unknown";
+
+    fdt_for_each_subnode(node, fdt, dom_node)
+    {
+        if ( fdt_node_check_compatible(fdt, node, "multiboot,kernel") == 0 )
+        {
+            unsigned int idx;
+            int ret = 0;
+
+            if ( bd->kernel )
+            {
+                printk(XENLOG_ERR "Duplicate kernel module for domain %s)\n",
+                       name);
+                continue;
+            }
+
+            /* Try hyperlaunch property, fall back to dom0less property. */
+            if ( hl_module_index(fdt, node, &idx) < 0 )
+            {
+                int address_size = fdt_address_cells(fdt, dom_node);
+                int size_size = fdt_size_cells(fdt, dom_node);
+
+                if ( address_size < 0 || size_size < 0 )
+                    ret = -EINVAL;
+                else
+                    ret = dom0less_module_index(
+                            fdt, node, size_size, address_size, &idx);
+            }
+
+            if ( ret < 0 )
+            {
+                printk("  failed processing kernel module for domain %s)\n",
+                       name);
+                return ret;
+            }
+
+            if ( idx > bi->nr_modules )
+            {
+                printk("  invalid kernel module index for domain node (%d)\n",
+                       bi->nr_domains);
+                return -EINVAL;
+            }
+
+            printk("  kernel: boot module %d\n", idx);
+            bi->mods[idx].type = BOOTMOD_KERNEL;
+            bd->kernel = &bi->mods[idx];
+        }
+    }
+
+    if ( !bd->kernel )
+    {
+        printk(XENLOG_ERR "ERR: no kernel assigned to domain\n");
+        return -EFAULT;
+    }
+
+    return 0;
+}
+
 static int __init find_hyperlaunch_node(const void *fdt)
 {
     int hv_node = fdt_path_offset(fdt, "/chosen/hypervisor");
@@ -74,9 +182,19 @@ int __init walk_hyperlaunch_fdt(struct boot_info *bi)
 
     fdt_for_each_subnode(node, fdt, hv_node)
     {
+        if ( bi->nr_domains >= MAX_NR_BOOTDOMS )
+        {
+            printk(XENLOG_WARNING "WARN: more domains defined than max allowed");
+            break;
+        }
+
         ret = fdt_node_check_compatible(fdt, node, "xen,domain");
         if ( ret == 0 )
+        {
+            if ( (ret = process_domain_node(bi, fdt, node)) < 0 )
+                break;
             bi->nr_domains++;
+        }
     }
 
     /* Until multi-domain construction is added, throw an error */
diff --git a/xen/arch/x86/domain-builder/fdt.h b/xen/arch/x86/domain-builder/fdt.h
index f5b89cb54b29..0be4ac771bc4 100644
--- a/xen/arch/x86/domain-builder/fdt.h
+++ b/xen/arch/x86/domain-builder/fdt.h
@@ -3,6 +3,8 @@
 #define __XEN_X86_FDT_H__
 
 #include <xen/init.h>
+#include <xen/libfdt/libfdt.h>
+#include <xen/libfdt/libfdt-xen.h>
 
 #include <asm/bootinfo.h>
 
@@ -10,6 +12,7 @@
 #define HYPERLAUNCH_MODULE_IDX 0
 
 #ifdef CONFIG_DOMAIN_BUILDER
+
 int has_hyperlaunch_fdt(struct boot_info *bi);
 int walk_hyperlaunch_fdt(struct boot_info *bi);
 #else
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index e1aa9650d22e..71ce9315d3ac 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1288,11 +1288,6 @@ void asmlinkage __init noreturn __start_xen(void)
 
     builder_init(bi);
 
-    /* Find first unknown boot module to use as Dom0 kernel */
-    i = first_boot_module_index(bi, BOOTMOD_UNKNOWN);
-    bi->mods[i].type = BOOTMOD_KERNEL;
-    bi->domains[0].kernel = &bi->mods[i];
-
     if ( pvh_boot )
     {
         /* pvh_init() already filled in e820_raw */
diff --git a/xen/include/xen/libfdt/libfdt-xen.h b/xen/include/xen/libfdt/libfdt-xen.h
index a5340bc9f4e1..27d23df03af3 100644
--- a/xen/include/xen/libfdt/libfdt-xen.h
+++ b/xen/include/xen/libfdt/libfdt-xen.h
@@ -13,6 +13,82 @@
 
 #include <xen/libfdt/libfdt.h>
 
+static inline int __init fdt_cell_as_u32(const fdt32_t *cell, uint32_t *val)
+{
+    *val = fdt32_to_cpu(*cell);
+
+    return 0;
+}
+
+static inline int __init fdt_cell_as_u64(const fdt32_t *cell, uint64_t *val)
+{
+    *val = ((uint64_t)fdt32_to_cpu(cell[0]) << 32) |
+           (uint64_t)fdt32_to_cpu(cell[1]);
+
+    return 0;
+}
+
+/*
+ * Property: reg
+ *
+ * Defined in Section 2.3.6 of the Device Tree Specification is the "reg"
+ * standard property. The property is a prop-encoded-array that is encoded as
+ * an arbitrary number of (address, length) pairs.
+ */
+static inline int __init fdt_get_reg_prop(
+    const void *fdt, int node, unsigned int asize, unsigned int ssize,
+    uint64_t *addr, uint64_t *size, unsigned int pairs)
+{
+    int ret;
+    unsigned int i, count;
+    const struct fdt_property *prop;
+    fdt32_t *cell;
+
+    /* FDT spec max size is 4 (128bit int), but largest arch int size is 64 */
+    if ( ssize > 2 || asize > 2 )
+        return -EINVAL;
+
+    prop = fdt_get_property(fdt, node, "reg", &ret);
+    if ( !prop || ret < sizeof(u32) )
+        return ret < 0 ? ret : -EINVAL;
+
+    /* Get the number of (addr, size) pairs and clamp down. */
+    count = fdt32_to_cpu(prop->len) / (ssize + asize);
+    count = count < pairs ? count : pairs;
+
+    cell = (fdt32_t *)prop->data;
+
+    for ( i = 0; i < count; i++ )
+    {
+        /* read address field */
+        if ( asize == 1 )
+        {
+            uint32_t val;
+            fdt_cell_as_u32(cell, &val);
+            addr[i] = val;
+        }
+        else
+            fdt_cell_as_u64(cell, &addr[i]);
+
+        /* read size field */
+        cell += asize;
+
+        if ( ssize == 1 )
+        {
+            uint32_t val;
+            fdt_cell_as_u32(cell, &val);
+            size[i] = val;
+        }
+        else
+            fdt_cell_as_u64(cell, &size[i]);
+
+        /* move to next pair */
+        cell += ssize;
+    }
+
+    return count;
+}
+
 static inline int fdt_get_mem_rsv_paddr(const void *fdt, int n,
                                         paddr_t *address,
                                         paddr_t *size)
-- 
2.30.2


