Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0389D6AD4
	for <lists+xen-devel@lfdr.de>; Sat, 23 Nov 2024 19:31:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.842208.1257676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEuuS-0005WO-VA; Sat, 23 Nov 2024 18:31:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 842208.1257676; Sat, 23 Nov 2024 18:31:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEuuS-0005TO-QB; Sat, 23 Nov 2024 18:31:08 +0000
Received: by outflank-mailman (input) for mailman id 842208;
 Sat, 23 Nov 2024 18:31:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=waGT=SS=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tEumF-0006MT-7b
 for xen-devel@lists.xenproject.org; Sat, 23 Nov 2024 18:22:39 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e98ddbdb-a9c7-11ef-a0cc-8be0dac302b0;
 Sat, 23 Nov 2024 19:22:36 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1732386065328293.98410454837483;
 Sat, 23 Nov 2024 10:21:05 -0800 (PST)
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
X-Inumbo-ID: e98ddbdb-a9c7-11ef-a0cc-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg4LjUxIiwiaGVsbyI6InNlbmRlcjQtb2YtbzUxLnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6ImU5OGRkYmRiLWE5YzctMTFlZi1hMGNjLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMzg2MTU3LjA2MDMwNSwic2VuZGVyIjoiZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; t=1732386069; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Vwle6eevgHpVpwva1S5/KjZzrgrwePyomr2PCP5A9cXSVI1k9uMR996qaHiUA3QSRPeGcGrsor6FzgVGbOxzieotIB9HM/AGm+CifFLukqMHjC6/seNTsM8lej+szxqBbPVjoXT9y+M+j/qJvskmrhIfNGpV1XFMTZEuBqrYIX4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1732386069; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ZWZK/83JdulzZ9aZB923YFMwC874tCiPARHq42V04YE=; 
	b=dv/6J1B6t7xkTRyk8Xo2an2jKddwFkKuLr2uHjeDTi7hIsSb+yzWivACghLc12WLwjzmr6DPnMio3qM8YCY9V1StFr9j5HK0auUKwzk/HPhpK5PPvQ19oXuZbHyvJBcKVrQJ4cLuouUCrq1EY15MMib1Sdkxam6U0snjUmTpycI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732386069;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=ZWZK/83JdulzZ9aZB923YFMwC874tCiPARHq42V04YE=;
	b=uPhrkV4TmISWfSUjqeji4UWrKAWKAmGlU2b62L6lskCmIOAWT4UGMsTmmSS5ghOF
	ibTjpWt4LW8NHMijieoZ60MQ8S+guAS5reeRSWIcjU8eSvyRLgI6Xl2I6TVUV6R/1AO
	BL8GK94FbqJNwOVIKGQdPbJna3MKdrYciVx8PHcw=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 08/15] x86/hyperlaunch: locate dom0 kernel with hyperlaunch
Date: Sat, 23 Nov 2024 13:20:37 -0500
Message-Id: <20241123182044.30687-9-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241123182044.30687-1-dpsmith@apertussolutions.com>
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Look for a subnode of type `multiboot,kernel` within a domain node. If found,
process the reg property for the MB1 module index. If the bootargs property is
present and there was not an MB1 string, then use the command line from the
device tree definition.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/domain_builder/core.c |  12 +++
 xen/arch/x86/domain_builder/fdt.c  | 126 +++++++++++++++++++++++++++++
 xen/arch/x86/domain_builder/fdt.h  |  17 ++++
 xen/arch/x86/setup.c               |   5 --
 4 files changed, 155 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/domain_builder/core.c b/xen/arch/x86/domain_builder/core.c
index a80f3711c306..9335f3a9ebef 100644
--- a/xen/arch/x86/domain_builder/core.c
+++ b/xen/arch/x86/domain_builder/core.c
@@ -56,6 +56,18 @@ void __init builder_init(struct boot_info *bi)
 
         printk(XENLOG_INFO "  Number of domains: %d\n", bi->nr_domains);
     }
+    else
+    {
+        int i;
+
+        /* Find first unknown boot module to use as Dom0 kernel */
+        printk("Falling back to using first boot module as dom0\n");
+        i = first_boot_module_index(bi, BOOTMOD_UNKNOWN);
+        bi->mods[i].type = BOOTMOD_KERNEL;
+        bi->domains[0].kernel = &bi->mods[i];
+        bi->nr_domains = 1;
+    }
+
 }
 
 /*
diff --git a/xen/arch/x86/domain_builder/fdt.c b/xen/arch/x86/domain_builder/fdt.c
index ff1ba58b6907..6bf1c4a297fe 100644
--- a/xen/arch/x86/domain_builder/fdt.c
+++ b/xen/arch/x86/domain_builder/fdt.c
@@ -14,6 +14,122 @@
 
 #include "fdt.h"
 
+static inline int __init fdt_get_prop_as_reg(
+    const void *fdt, int node, const char *name, unsigned int ssize,
+    unsigned int asize, uint64_t *size, uint64_t *addr)
+{
+    int ret;
+    const struct fdt_property *prop;
+    fdt32_t *cell;
+
+    /* FDT spec max size is 4 (128bit int), but largest arch int size is 64 */
+    if ( ssize > 2 || asize > 2 )
+        return -EINVAL;
+
+    prop = fdt_get_property(fdt, node, name, &ret);
+    if ( !prop || ret < sizeof(u32) )
+        return ret < 0 ? ret : -EINVAL;
+
+    /* read address field */
+    cell = (fdt32_t *)prop->data;
+
+    if ( asize == 1 )
+    {
+        uint32_t val;
+        fdt_cell_as_u32(cell, &val);
+        *addr = (uint64_t)val;
+    }
+    else
+        fdt_cell_as_u64(cell, addr);
+
+    /* read size field */
+    cell += asize;
+
+    if ( ssize == 1 )
+    {
+        uint32_t val;
+        fdt_cell_as_u32(cell, &val);
+        *size = (uint64_t)val;
+    }
+    else
+        fdt_cell_as_u64(cell, size);
+
+    return 0;
+}
+
+static int __init dom0less_module_node(
+    void *fdt, int node, int size_size, int address_size)
+{
+    uint64_t size, addr;
+    int ret = fdt_get_prop_as_reg(fdt, node, "reg", size_size, address_size,
+                                  &size, &addr);
+    /* An FDT error value may have been returned, translate to -EINVAL */
+    if ( ret < 0 )
+        return -EINVAL;
+
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
+    return (int)addr;
+}
+
+static int __init process_domain_node(
+    struct boot_info *bi, void *fdt, int dom_node)
+{
+    int node;
+    struct boot_domain *bd = &bi->domains[bi->nr_domains];
+    const char *name = fdt_get_name(fdt, dom_node, NULL);
+    int address_size = fdt_address_cells(fdt, dom_node);
+    int size_size = fdt_size_cells(fdt, dom_node);
+
+    if ( address_size < 0 || size_size < 0 )
+    {
+        printk("  failed processing #address or #size for domain %s)\n",
+               name == NULL ? "unknown" : name);
+        return -EINVAL;
+    }
+
+    fdt_for_each_subnode(node, fdt, dom_node)
+    {
+        if ( fdt_node_check_compatible(fdt, node, "multiboot,kernel") == 0 )
+        {
+            int idx = dom0less_module_node(fdt, node, size_size, address_size);
+            if ( idx < 0 )
+            {
+                printk("  failed processing kernel module for domain %s)\n",
+                       name == NULL ? "unknown" : name);
+                return idx;
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
 static int __init find_hyperlaunch_node(void *fdt)
 {
     int hv_node = fdt_path_offset(fdt, "/chosen/hypervisor");
@@ -74,9 +190,19 @@ int __init walk_hyperlaunch_fdt(struct boot_info *bi)
 
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
diff --git a/xen/arch/x86/domain_builder/fdt.h b/xen/arch/x86/domain_builder/fdt.h
index 84126db208ea..558d00a994fa 100644
--- a/xen/arch/x86/domain_builder/fdt.h
+++ b/xen/arch/x86/domain_builder/fdt.h
@@ -3,6 +3,7 @@
 #define __XEN_X86_FDT_H__
 
 #include <xen/init.h>
+#include <xen/libfdt/libfdt.h>
 
 #include <asm/bootinfo.h>
 
@@ -10,6 +11,22 @@
 #define HYPERLAUNCH_MODULE_IDX 0
 
 #ifdef CONFIG_DOMAIN_BUILDER
+
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
 int has_hyperlaunch_fdt(struct boot_info *bi);
 int walk_hyperlaunch_fdt(struct boot_info *bi);
 #else
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 8041aeb3dcfd..d6e9d4c1769c 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1280,11 +1280,6 @@ void asmlinkage __init noreturn __start_xen(void)
 
     builder_init(bi);
 
-    /* Find first unknown boot module to use as Dom0 kernel */
-    i = first_boot_module_index(bi, BOOTMOD_UNKNOWN);
-    bi->mods[i].type = BOOTMOD_KERNEL;
-    bi->domains[0].kernel = &bi->mods[i];
-
     if ( pvh_boot )
     {
         /* pvh_init() already filled in e820_raw */
-- 
2.30.2


