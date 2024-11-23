Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E89A9D6AD3
	for <lists+xen-devel@lfdr.de>; Sat, 23 Nov 2024 19:31:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.842192.1257666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEuuG-0004XO-Lj; Sat, 23 Nov 2024 18:30:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 842192.1257666; Sat, 23 Nov 2024 18:30:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEuuG-0004To-HC; Sat, 23 Nov 2024 18:30:56 +0000
Received: by outflank-mailman (input) for mailman id 842192;
 Sat, 23 Nov 2024 18:30:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=waGT=SS=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tEumP-0006MT-7t
 for xen-devel@lists.xenproject.org; Sat, 23 Nov 2024 18:22:49 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef8dcde2-a9c7-11ef-a0cc-8be0dac302b0;
 Sat, 23 Nov 2024 19:22:46 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1732386066952250.35025180529567;
 Sat, 23 Nov 2024 10:21:06 -0800 (PST)
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
X-Inumbo-ID: ef8dcde2-a9c7-11ef-a0cc-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg4LjUxIiwiaGVsbyI6InNlbmRlcjQtb2YtbzUxLnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6ImVmOGRjZGUyLWE5YzctMTFlZi1hMGNjLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMzg2MTY3LjEyMDI3NCwic2VuZGVyIjoiZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; t=1732386071; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nW7sXvRohpjbWo9DOULba7c3yNZXlSaTIi6cPllaObd24azcYKZy9UD8gkMqIod7vOTnfhmFFN5hZO/PHETfD1K8pMLRcB97CL4cmLU03haha1F5MpVoGX4j1Dz3dv1H/dUyioNrS2L+dp+di1DzqHDI0Zn54nuRHlJg0cM5jTI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1732386071; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=6nktQzed9lDrO9uE3JtQT7owTGCSLDNcsYsfTAI8TMA=; 
	b=UVkq2JeulPhigV6ZmU1QmwTo6m3L+QCzMxf/fEJPG0olKftcIpqniOC6EDCTo+KpNuRu0BJ6B6K1OGSzLwpnexyQ3hYTBM+ki1VGu5kL+CZ0viAIKe8N9w2VWo/oRNbg1+3XcfI+XvOnheqAWAJqFNFnDpt/3cUhy6GSTOIUzWI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732386071;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=6nktQzed9lDrO9uE3JtQT7owTGCSLDNcsYsfTAI8TMA=;
	b=molRG/TKbVQA+zX3mdPTgB1F02AjyWJbd50jFynNFlgXrIsNqv4UcrjEaghqozcc
	Of2hmdwC8XZ/VPvd+6XJOyzP/q3dlyArtycuO0FZnxIESPh+CdEijCgkOgJAFq0aSy6
	8WjludgyR2X9ciI+9qJXw1EHfk4hVnShywAqE1WQ=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 09/15] x86/hyperlaunch: obtain cmdline from device tree
Date: Sat, 23 Nov 2024 13:20:38 -0500
Message-Id: <20241123182044.30687-10-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241123182044.30687-1-dpsmith@apertussolutions.com>
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

If a command line is not provided through the bootloader's mechanism, e.g.
muiltboot module string field, then use one from the device tree if present.
The device tree command line is located in the bootargs property of the
`multiboot,kernel` node.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/domain_builder/core.c       | 28 +++++++++++++++++++
 xen/arch/x86/domain_builder/fdt.c        | 34 ++++++++++++++++++++++++
 xen/arch/x86/domain_builder/fdt.h        | 24 +++++++++++++++++
 xen/arch/x86/include/asm/bootinfo.h      |  6 +++--
 xen/arch/x86/include/asm/domainbuilder.h |  4 +++
 xen/arch/x86/setup.c                     | 10 +++++--
 6 files changed, 102 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/domain_builder/core.c b/xen/arch/x86/domain_builder/core.c
index 9335f3a9ebef..95cab06e6159 100644
--- a/xen/arch/x86/domain_builder/core.c
+++ b/xen/arch/x86/domain_builder/core.c
@@ -8,9 +8,37 @@
 #include <xen/lib.h>
 
 #include <asm/bootinfo.h>
+#include <asm/setup.h>
 
 #include "fdt.h"
 
+size_t __init builder_get_cmdline_size(struct boot_info *bi, int offset)
+{
+#ifdef CONFIG_DOMAIN_BUILDER
+    const void *fdt = bootstrap_map_bm(&bi->mods[HYPERLAUNCH_MODULE_IDX]);
+    int size = fdt_cmdline_prop_size(fdt, offset);
+
+    bootstrap_unmap();
+    return size < 0 ? 0 : (size_t) size;
+#else
+    return 0;
+#endif
+}
+
+int __init builder_get_cmdline(
+    struct boot_info *bi, int offset, char *cmdline, size_t size)
+{
+#ifdef CONFIG_DOMAIN_BUILDER
+    const void *fdt = bootstrap_map_bm(&bi->mods[HYPERLAUNCH_MODULE_IDX]);
+    int ret = fdt_cmdline_prop_copy(fdt, offset, cmdline, size);
+
+    bootstrap_unmap();
+    return ret;
+#else
+    return 0;
+#endif
+}
+
 void __init builder_init(struct boot_info *bi)
 {
     if ( IS_ENABLED(CONFIG_DOMAIN_BUILDER) )
diff --git a/xen/arch/x86/domain_builder/fdt.c b/xen/arch/x86/domain_builder/fdt.c
index 6bf1c4a297fe..f8ddb11b339e 100644
--- a/xen/arch/x86/domain_builder/fdt.c
+++ b/xen/arch/x86/domain_builder/fdt.c
@@ -57,6 +57,30 @@ static inline int __init fdt_get_prop_as_reg(
     return 0;
 }
 
+static int __init fdt_get_prop_as_offset(
+    const void *fdt, int node, const char *name, unsigned long *a)
+{
+    int ret, poffset;
+    const char *pname;
+    size_t nsize = strlen(name);
+
+    fdt_for_each_property_offset(poffset, fdt, node)
+    {
+        fdt_getprop_by_offset(fdt, poffset, &pname, &ret);
+
+        if ( ret < 0 || strlen(pname) != nsize )
+            continue;
+
+        if ( !strncmp(pname, name, nsize) )
+        {
+            *a = poffset;
+            return nsize;
+        }
+    }
+
+    return -ENOENT;
+}
+
 static int __init dom0less_module_node(
     void *fdt, int node, int size_size, int address_size)
 {
@@ -118,6 +142,16 @@ static int __init process_domain_node(
             printk("  kernel: boot module %d\n", idx);
             bi->mods[idx].type = BOOTMOD_KERNEL;
             bd->kernel = &bi->mods[idx];
+
+            /* If bootloader didn't set cmdline, see if FDT provides one. */
+            if ( bd->kernel->cmdline_pa &&
+                 !((char *)__va(bd->kernel->cmdline_pa))[0] )
+            {
+                int ret = fdt_get_prop_as_offset(
+                    fdt, node, "bootargs", &bd->kernel->cmdline_pa);
+                if ( ret > 0 )
+                    bd->kernel->fdt_cmdline = true;
+            }
         }
     }
 
diff --git a/xen/arch/x86/domain_builder/fdt.h b/xen/arch/x86/domain_builder/fdt.h
index 558d00a994fa..ab2b43872e25 100644
--- a/xen/arch/x86/domain_builder/fdt.h
+++ b/xen/arch/x86/domain_builder/fdt.h
@@ -27,6 +27,30 @@ static inline int __init fdt_cell_as_u64(const fdt32_t *cell, uint64_t *val)
     return 0;
 }
 
+static inline int __init fdt_cmdline_prop_size(const void *fdt, int offset)
+{
+    int ret;
+
+    fdt_get_property_by_offset(fdt, offset, &ret);
+
+    return ret;
+}
+
+static inline int __init fdt_cmdline_prop_copy(
+    const void *fdt, int offset, char *cmdline, size_t size)
+{
+    int ret;
+    const struct fdt_property *prop =
+        fdt_get_property_by_offset(fdt, offset, &ret);
+
+    if ( ret < 0 )
+        return ret;
+
+    ASSERT(size > ret);
+
+    return strlcpy(cmdline, prop->data, ret);
+}
+
 int has_hyperlaunch_fdt(struct boot_info *bi);
 int walk_hyperlaunch_fdt(struct boot_info *bi);
 #else
diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index 683ca9dbe2e0..433a0e66121b 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -35,11 +35,13 @@ struct boot_module {
 
     /*
      * Module State Flags:
-     *   relocated: indicates module has been relocated in memory.
-     *   released:  indicates module's pages have been freed.
+     *   relocated:   indicates module has been relocated in memory.
+     *   released:    indicates module's pages have been freed.
+     *   fdt_cmdline: indicates module's cmdline is in the FDT.
      */
     bool relocated:1;
     bool released:1;
+    bool fdt_cmdline:1;
 
     /*
      * A boot module may need decompressing by Xen.  Headroom is an estimate of
diff --git a/xen/arch/x86/include/asm/domainbuilder.h b/xen/arch/x86/include/asm/domainbuilder.h
index aedc2b49f7c9..21221d8df8ec 100644
--- a/xen/arch/x86/include/asm/domainbuilder.h
+++ b/xen/arch/x86/include/asm/domainbuilder.h
@@ -3,6 +3,10 @@
 
 #include <asm/bootinfo.h>
 
+size_t __init builder_get_cmdline_size(struct boot_info *bi, int offset);
+int __init builder_get_cmdline(
+    struct boot_info *bi, int offset, char *cmdline, size_t size);
+
 void builder_init(struct boot_info *bi);
 
 #endif
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index d6e9d4c1769c..fda4fc71e205 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -971,7 +971,10 @@ static size_t __init domain_cmdline_size(
 {
     size_t s = bi->kextra ? strlen(bi->kextra) : 0;
 
-    s += bd->kernel->cmdline_pa ? strlen(__va(bd->kernel->cmdline_pa)) : 0;
+    if ( bd->kernel->fdt_cmdline )
+        s += builder_get_cmdline_size(bi, bd->kernel->cmdline_pa);
+    else
+        s += strlen(__va(bd->kernel->cmdline_pa));
 
     if ( s == 0 )
         return s;
@@ -1040,7 +1043,10 @@ static struct domain *__init create_dom0(struct boot_info *bi)
         if ( !(cmdline = xzalloc_array(char, cmdline_size)) )
             panic("Error allocating cmdline buffer for %pd\n", d);
 
-        if ( bd->kernel->cmdline_pa )
+        if ( bd->kernel->fdt_cmdline )
+            builder_get_cmdline(
+                bi, bd->kernel->cmdline_pa, cmdline, cmdline_size);
+        else
             strlcpy(cmdline,
                     cmdline_cook(__va(bd->kernel->cmdline_pa),bi->loader),
                     cmdline_size);
-- 
2.30.2


