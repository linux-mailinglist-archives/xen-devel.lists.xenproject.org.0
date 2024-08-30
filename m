Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 120B1966B9D
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 23:56:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786747.1196477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9bJ-0000jx-6q; Fri, 30 Aug 2024 21:56:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786747.1196477; Fri, 30 Aug 2024 21:56:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9bJ-0000hE-3X; Fri, 30 Aug 2024 21:56:13 +0000
Received: by outflank-mailman (input) for mailman id 786747;
 Fri, 30 Aug 2024 21:56:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiG6=P5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sk9Xm-0000Zf-Fv
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 21:52:34 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2836cd3a-671a-11ef-99a1-01e77a169b0f;
 Fri, 30 Aug 2024 23:52:32 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: by mx.zohomail.com with SMTPS id 1725054501101460.90423645474493;
 Fri, 30 Aug 2024 14:48:21 -0700 (PDT)
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
X-Inumbo-ID: 2836cd3a-671a-11ef-99a1-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1725054503; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lMGZs8SIDtJtI131S+0ymMPmMbm9ZrRmIfMPtzovliVyRoavvu25Qd+y+OFcQ0d2D3/m4cBHKYWobvDQ1UUqSWgDS5S/va6mEdgjq4urQuiSO3BAdXLkyHaWQy26CDvUIfcVS4+wrJ7uxFGH5NQ3VOpLQC9wJA9M+IBJUvXUygQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1725054503; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=R/MzkWoN4ISAq+3iGJhqemI2sorOj7/J8EPT75xG/08=; 
	b=JNgYY8qoj7tkrn2MgvM4Qp2r8jm/4q+yUnjOdVb6gTLYpEZ9b9nRs5455sStAqo4AkvwBvxw1yy0yyyR2yzsF6BK5ByL3CSR3lxppX29hzZIIft0JT9jqCdrVn0dcemP1u0Z7VR5+g8kUoHk9B3L7HUuAa9TgzYkJ6t4hcZYmqU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725054503;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=R/MzkWoN4ISAq+3iGJhqemI2sorOj7/J8EPT75xG/08=;
	b=TwTSDY3tQjVwTmmgBSrXGW7hpH82mM7D7QOwNJU3BO2zmz87+6jWWN/bDP0NiZxQ
	+MCTnu4tbq8KehJzvjegdmtakDUDr/oxw3ux6ugKVTegxKeaRbrdQOfLTCFtD0kGvvM
	88mHGE1ZkNxFWHxDAiEvBxDOMb3kHgICmFO1QRic=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 38/44] x86/boot: introduce boot domain
Date: Fri, 30 Aug 2024 17:47:23 -0400
Message-Id: <20240830214730.1621-39-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240830214730.1621-1-dpsmith@apertussolutions.com>
References: <20240830214730.1621-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

To begin moving toward allowing the hypervisor to construct more than one
domain at boot, a container is needed for a domain's build information.

Introduce a new header, <xen/asm/bootdomain.h>, that contains the initial
struct boot_domain that encapsulate the build information for a domain.

No functional change intended.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/include/asm/bootdomain.h | 28 +++++++++++++++++++++++++++
 xen/arch/x86/include/asm/bootinfo.h   |  7 +++++++
 xen/arch/x86/setup.c                  | 27 +++++++++++---------------
 3 files changed, 46 insertions(+), 16 deletions(-)
 create mode 100644 xen/arch/x86/include/asm/bootdomain.h

diff --git a/xen/arch/x86/include/asm/bootdomain.h b/xen/arch/x86/include/asm/bootdomain.h
new file mode 100644
index 000000000000..4285223ac5ab
--- /dev/null
+++ b/xen/arch/x86/include/asm/bootdomain.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2024 Apertus Solutions, LLC
+ * Author: Daniel P. Smith <dpsmith@apertussolutions.com>
+ * Copyright (c) 2024 Christopher Clark <christopher.w.clark@gmail.com>
+ */
+
+#ifndef __XEN_X86_BOOTDOMAIN_H__
+#define __XEN_X86_BOOTDOMAIN_H__
+
+struct boot_module;
+
+struct boot_domain {
+    struct boot_module *kernel;
+    struct boot_module *ramdisk;
+};
+
+#endif
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
diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index 59755ef42e53..b135aaebd25e 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -10,6 +10,11 @@
 
 #include <xen/types.h>
 
+#include <asm/bootdomain.h>
+
+/* Max number of boot domains that Xen can construct */
+#define MAX_NR_BOOTDOMS 1
+
 /* Boot module binary type / purpose */
 enum bootmod_type {
     BOOTMOD_UNKNOWN,
@@ -45,6 +50,8 @@ struct boot_info {
 
     paddr_t mmap_addr;
     uint32_t mmap_length;
+
+    struct boot_domain *domains;
 };
 
 static inline int __init next_boot_module_index(
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index a6fbaecee9ed..77abed637ff2 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -287,6 +287,7 @@ static void __init multiboot_to_bootinfo(multiboot_info_t *mbi, module_t *mods)
 {
     static struct boot_info __initdata info;
     static struct boot_module __initdata boot_mods[MAX_NR_BOOTMODS + 1];
+    static struct boot_domain __initdata boot_doms[MAX_NR_BOOTDOMS];
     unsigned int i;
 
     info.nr_mods = mbi->mods_count;
@@ -321,6 +322,8 @@ static void __init multiboot_to_bootinfo(multiboot_info_t *mbi, module_t *mods)
     boot_mods[info.nr_mods].type = BOOTMOD_XEN;
     boot_mods[info.nr_mods].flags |= BOOTMOD_FLAG_X86_CONSUMED;
 
+    info.domains = boot_doms;
+
     boot_info = &info;
 }
 
@@ -958,20 +961,10 @@ static struct domain *__init create_dom0(const struct boot_info *bi)
             .misc_flags = opt_dom0_msr_relaxed ? XEN_X86_MSR_RELAXED : 0,
         },
     };
-    int mod_idx = first_boot_module_index(bi, BOOTMOD_RAMDISK);
-    struct boot_module *image, *initrd;
+    struct boot_domain *bd = &bi->domains[0];
     struct domain *d;
     domid_t domid;
 
-    /* Map boot_module to mb1 module for dom0 */
-    image = &bi->mods[0];
-
-    /* Map boot_module to mb1 module for initrd */
-    if ( mod_idx < 0 )
-        initrd = NULL;
-    else
-        initrd = &bi->mods[mod_idx];
-
     if ( opt_dom0_pvh )
     {
         dom0_cfg.flags |= (XEN_DOMCTL_CDF_hvm |
@@ -997,11 +990,11 @@ static struct domain *__init create_dom0(const struct boot_info *bi)
         panic("Error creating d%uv0\n", domid);
 
     /* Grab the DOM0 command line. */
-    if ( image->cmdline || bi->kextra )
+    if ( bd->kernel->cmdline || bi->kextra )
     {
-        if ( image->cmdline )
-            safe_strcpy(cmdline,
-                        cmdline_cook(__va((unsigned long)image->cmdline),
+        if ( bd->kernel->cmdline )
+            safe_strcpy(cmdline, cmdline_cook(
+                        __va((unsigned long)bd->kernel->cmdline),
                         bi->boot_loader_name));
 
         if ( bi->kextra )
@@ -1036,7 +1029,7 @@ static struct domain *__init create_dom0(const struct boot_info *bi)
         write_cr4(read_cr4() & ~X86_CR4_SMAP);
     }
 
-    if ( construct_dom0(d, image, initrd, cmdline) != 0 )
+    if ( construct_dom0(d, bd->kernel, bd->ramdisk, cmdline) != 0 )
         panic("Could not construct domain 0\n");
 
     if ( cpu_has_smap )
@@ -1221,6 +1214,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
     /* Dom0 kernel is always first */
     boot_info->mods[0].type = BOOTMOD_KERNEL;
     boot_info->mods[0].flags |= BOOTMOD_FLAG_X86_CONSUMED;
+    boot_info->domains[0].kernel = &boot_info->mods[0];
 
     if ( pvh_boot )
     {
@@ -2112,6 +2106,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
     {
         boot_info->mods[initrdidx].type = BOOTMOD_RAMDISK;
         boot_info->mods[initrdidx].flags |= BOOTMOD_FLAG_X86_CONSUMED;
+        boot_info->domains[0].ramdisk = &boot_info->mods[initrdidx];
         if ( first_boot_module_index(boot_info, BOOTMOD_UNKNOWN) >= 0 )
             printk(XENLOG_WARNING
                    "Multiple initrd candidates, picking module #%u\n",
-- 
2.30.2


