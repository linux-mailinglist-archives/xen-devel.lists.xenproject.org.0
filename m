Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8449FCC12
	for <lists+xen-devel@lfdr.de>; Thu, 26 Dec 2024 18:01:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.863299.1274750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tQrE2-00081F-E1; Thu, 26 Dec 2024 17:00:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 863299.1274750; Thu, 26 Dec 2024 17:00:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tQrE2-0007yp-8D; Thu, 26 Dec 2024 17:00:42 +0000
Received: by outflank-mailman (input) for mailman id 863299;
 Thu, 26 Dec 2024 17:00:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vkhu=TT=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tQrCo-00026T-NR
 for xen-devel@lists.xenproject.org; Thu, 26 Dec 2024 16:59:26 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c281d457-c3aa-11ef-a0da-8be0dac302b0;
 Thu, 26 Dec 2024 17:59:26 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1735232282410325.37290437121055;
 Thu, 26 Dec 2024 08:58:02 -0800 (PST)
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
X-Inumbo-ID: c281d457-c3aa-11ef-a0da-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1735232286; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RhWPoK4NIZjG4E6p6yzvJNhXjnhRAFyLWbXD1p759QmS2lQ4o+8HKYWJ+A0KaW3xHq1y6I4hpvEvH+uNpoa0e0Dp8TjGJByXcixe6KF4rWpaM7Yhj8DlO/M5vUWzfks/YwG43Jd9cnUXFVDYf3HL5UTBks7KFBJuEhHpM1ItkhY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1735232286; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=52qJQbf7jF223erY8P2R8ITOq6qxtcd4OGVYfyMQ2rc=; 
	b=GncS5m+hbU/SzMPAasNByTvqrnpV4itEGqfvBJhsgOkofnxJYL2kPb+i9wXtMeOmZOAn22oPJ2SJULTJ+oJNhBEIBqq5kW9W3DNFQs3amjRgDsXDw8198CLrliKId+I7iSvBbDgqjBKHkcg0bnpT9SJnj0JKhlRimWMS8ZwUc/c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1735232286;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=52qJQbf7jF223erY8P2R8ITOq6qxtcd4OGVYfyMQ2rc=;
	b=lOE1cm+9M1fTjj2O6PTdvk0lnczYdaSKhativ/JPZ9g4EBEOUCfBOSNu2SY3IaPK
	rxsWqwxkbhqDXuTAQJ8goejj0AOAbVlJjZPoGXuLJ6KdufWig6aA7LtSdQoIvxyXuW7
	zjI5bYOIZWq4tVO1TNK4ajz7lWQOyBeOUjadQe0c=
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
Subject: [PATCH v2 09/15] x86/hyperlaunch: obtain cmdline from device tree
Date: Thu, 26 Dec 2024 11:57:34 -0500
Message-Id: <20241226165740.29812-10-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241226165740.29812-1-dpsmith@apertussolutions.com>
References: <20241226165740.29812-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

If a command line is not provided through the bootloader's mechanism, e.g.
muiltboot module string field, then use one from the device tree if present.
The device tree command line is located in the bootargs property of the
`multiboot,kernel` node.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
Changes since v1:
- moved common fdt functions to libfdt
- rename prop_as_offset to more correct prop_by_offset
---
 xen/arch/x86/domain-builder/core.c       | 28 ++++++++++++++++++++++++
 xen/arch/x86/domain-builder/fdt.c        | 10 +++++++++
 xen/arch/x86/domain-builder/fdt.h        | 24 ++++++++++++++++++++
 xen/arch/x86/include/asm/bootinfo.h      |  6 +++--
 xen/arch/x86/include/asm/domainbuilder.h |  4 ++++
 xen/arch/x86/setup.c                     | 15 +++++++++----
 xen/include/xen/libfdt/libfdt-xen.h      | 24 ++++++++++++++++++++
 7 files changed, 105 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/domain-builder/core.c b/xen/arch/x86/domain-builder/core.c
index eda7fa7a8ffa..91d1b7367e76 100644
--- a/xen/arch/x86/domain-builder/core.c
+++ b/xen/arch/x86/domain-builder/core.c
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
diff --git a/xen/arch/x86/domain-builder/fdt.c b/xen/arch/x86/domain-builder/fdt.c
index bcaee50689a6..1094c8dc8838 100644
--- a/xen/arch/x86/domain-builder/fdt.c
+++ b/xen/arch/x86/domain-builder/fdt.c
@@ -109,6 +109,16 @@ static int __init process_domain_node(
             printk("  kernel: boot module %d\n", idx);
             bi->mods[idx].type = BOOTMOD_KERNEL;
             bd->kernel = &bi->mods[idx];
+
+            /* If bootloader didn't set cmdline, see if FDT provides one. */
+            if ( bd->kernel->cmdline_pa &&
+                 !((char *)__va(bd->kernel->cmdline_pa))[0] )
+            {
+                int ret = fdt_get_prop_by_offset(
+                    fdt, node, "bootargs", &bd->kernel->cmdline_pa);
+                if ( ret > 0 )
+                    bd->kernel->fdt_cmdline = true;
+            }
         }
     }
 
diff --git a/xen/arch/x86/domain-builder/fdt.h b/xen/arch/x86/domain-builder/fdt.h
index 0be4ac771bc4..3938b0d2619b 100644
--- a/xen/arch/x86/domain-builder/fdt.h
+++ b/xen/arch/x86/domain-builder/fdt.h
@@ -13,6 +13,30 @@
 
 #ifdef CONFIG_DOMAIN_BUILDER
 
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
index 71ce9315d3ac..3dd04b9afca7 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -981,7 +981,10 @@ static size_t __init domain_cmdline_size(
 {
     size_t s = bi->kextra ? strlen(bi->kextra) : 0;
 
-    s += bd->kernel->cmdline_pa ? strlen(__va(bd->kernel->cmdline_pa)) : 0;
+    if ( bd->kernel->fdt_cmdline )
+        s += builder_get_cmdline_size(bi, bd->kernel->cmdline_pa);
+    else
+        s += strlen(__va(bd->kernel->cmdline_pa));
 
     if ( s == 0 )
         return s;
@@ -1039,7 +1042,8 @@ static struct domain *__init create_dom0(struct boot_info *bi)
 
     /* Grab the DOM0 command line. */
     if ( (bd->kernel->cmdline_pa &&
-          ((char *)__va(bd->kernel->cmdline_pa))[0]) ||
+          (bd->kernel->fdt_cmdline ||
+           ((char *)__va(bd->kernel->cmdline_pa))[0])) ||
          bi->kextra )
     {
         size_t cmdline_size = domain_cmdline_size(bi, bd);
@@ -1049,9 +1053,12 @@ static struct domain *__init create_dom0(struct boot_info *bi)
             if ( !(cmdline = xzalloc_array(char, cmdline_size)) )
                 panic("Error allocating cmdline buffer for %pd\n", d);
 
-            if ( bd->kernel->cmdline_pa )
+            if ( bd->kernel->fdt_cmdline )
+                builder_get_cmdline(
+                    bi, bd->kernel->cmdline_pa, cmdline, cmdline_size);
+            else
                 strlcpy(cmdline,
-                        cmdline_cook(__va(bd->kernel->cmdline_pa), bi->loader),
+                        cmdline_cook(__va(bd->kernel->cmdline_pa),bi->loader),
                         cmdline_size);
 
             if ( bi->kextra )
diff --git a/xen/include/xen/libfdt/libfdt-xen.h b/xen/include/xen/libfdt/libfdt-xen.h
index 27d23df03af3..0e54aeeb6cc2 100644
--- a/xen/include/xen/libfdt/libfdt-xen.h
+++ b/xen/include/xen/libfdt/libfdt-xen.h
@@ -28,6 +28,30 @@ static inline int __init fdt_cell_as_u64(const fdt32_t *cell, uint64_t *val)
     return 0;
 }
 
+static inline int __init fdt_get_prop_by_offset(
+    const void *fdt, int node, const char *name, unsigned long *offset)
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
+            *offset = poffset;
+            return nsize;
+        }
+    }
+
+    return -ENOENT;
+}
+
 /*
  * Property: reg
  *
-- 
2.30.2


