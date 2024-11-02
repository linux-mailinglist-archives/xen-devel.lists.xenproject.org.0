Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F899BA1BC
	for <lists+xen-devel@lfdr.de>; Sat,  2 Nov 2024 18:37:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.829599.1244613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7I31-0001Ew-Lq; Sat, 02 Nov 2024 17:36:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 829599.1244613; Sat, 02 Nov 2024 17:36:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7I31-0001BQ-HC; Sat, 02 Nov 2024 17:36:27 +0000
Received: by outflank-mailman (input) for mailman id 829599;
 Sat, 02 Nov 2024 17:36:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RajI=R5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t7Hud-0004r4-H4
 for xen-devel@lists.xenproject.org; Sat, 02 Nov 2024 17:27:47 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c42a77d5-993f-11ef-99a3-01e77a169b0f;
 Sat, 02 Nov 2024 18:27:43 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1730568374182907.7832620165392;
 Sat, 2 Nov 2024 10:26:14 -0700 (PDT)
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
X-Inumbo-ID: c42a77d5-993f-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg4LjUxIiwiaGVsbyI6InNlbmRlcjQtb2YtbzUxLnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6ImM0MmE3N2Q1LTk5M2YtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwNTY4NDY0LjA5MTg2Mywic2VuZGVyIjoiZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; t=1730568384; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EbK0LHLHm1J7bAzjzo7Yq0KlmM0opYOILP4NhGcy0cwwqFRBQK2+5R0mpXzZwwzGX3lURjW1Db4ASb43mRKQ6pXMkwpSXtbhgMBGfhw+zzoQ7h1LxGFq4Fiv6CI4Kc2/Q+Tc/XEH33WPwCTfMe0iA6wXIMdONmEMRs0KJBWgIYQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1730568384; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=BanyZbKdg0T0KbDMwIGAn8rkRguFwufoO5593eI1GXs=; 
	b=BYsMCPPaXAqIEOSH+Bxy87ZozWFsiuQMSxCDdu4CXUOdQX5/rnIAwc0rCE6dVNsFZ36uNeFXH/oSGNhVp+lC2Gk/oDAsV+XWifK18dxvKOLDNEZd5B0ejsukrw1Mvj7e/2/KUDD26OoWjhRsunSNwLR0I1WV9ZlM31OIpAGtb1I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1730568384;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=BanyZbKdg0T0KbDMwIGAn8rkRguFwufoO5593eI1GXs=;
	b=Bnhb55YJbsmVlMOpcw5lXSIo/drVPSpd1rV5mCpptVvnBl7DgNo78EwSsIeF0wzx
	iafTEied21NF7aM85DFkp+diElAhHuGfV7begn+qlntOx9/Z4pSg9ZfEgnm2wKjZOpx
	baPbBCu8XJvp1m0OWRB+cN/bRJ2o9BZBpOUEA+Uk=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 10/12] x86/boot: introduce boot domain
Date: Sat,  2 Nov 2024 13:25:49 -0400
Message-Id: <20241102172551.17233-11-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241102172551.17233-1-dpsmith@apertussolutions.com>
References: <20241102172551.17233-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

To begin moving toward allowing the hypervisor to construct more than one
domain at boot, a container is needed for a domain's build information.
Introduce a new header, <xen/asm/bootdomain.h>, that contains the initial
struct boot_domain that encapsulate the build information for a domain.

Add a kernel and ramdisk boot module reference along with a struct domain
reference to the new struct boot_domain. This allows a struct boot_domain
reference to be the only parameter necessary to pass down through the domain
construction call chain.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
Changes since v7
- collapsed the incremental changes to the call chain into this commit
---
 xen/arch/x86/dom0_build.c             |  7 +++---
 xen/arch/x86/hvm/dom0_build.c         | 16 +++++---------
 xen/arch/x86/include/asm/bootdomain.h | 31 +++++++++++++++++++++++++++
 xen/arch/x86/include/asm/bootinfo.h   |  5 +++++
 xen/arch/x86/include/asm/dom0_build.h |  6 +++---
 xen/arch/x86/include/asm/setup.h      |  6 ++----
 xen/arch/x86/pv/dom0_build.c          | 24 +++++++--------------
 xen/arch/x86/setup.c                  | 24 +++++++++------------
 8 files changed, 68 insertions(+), 51 deletions(-)
 create mode 100644 xen/arch/x86/include/asm/bootdomain.h

diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index 2276965c02bd..2f71d01a03e2 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -597,9 +597,10 @@ int __init dom0_setup_permissions(struct domain *d)
     return rc;
 }
 
-int __init construct_dom0(struct boot_info *bi, struct domain *d)
+int __init construct_dom0(struct boot_domain *bd)
 {
     int rc;
+    const struct domain *d = bd->d;
 
     /* Sanity! */
     BUG_ON(!pv_shim && d->domain_id != 0);
@@ -609,9 +610,9 @@ int __init construct_dom0(struct boot_info *bi, struct domain *d)
     process_pending_softirqs();
 
     if ( is_hvm_domain(d) )
-        rc = dom0_construct_pvh(bi, d);
+        rc = dom0_construct_pvh(bd);
     else if ( is_pv_domain(d) )
-        rc = dom0_construct_pv(bi, d);
+        rc = dom0_construct_pv(bd);
     else
         panic("Cannot construct Dom0. No guest interface available\n");
 
diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index e74684f10b12..5aacfeb21fcf 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -1302,25 +1302,19 @@ static void __hwdom_init pvh_setup_mmcfg(struct domain *d)
     }
 }
 
-int __init dom0_construct_pvh(struct boot_info *bi, struct domain *d)
+int __init dom0_construct_pvh(struct boot_domain *bd)
 {
     paddr_t entry, start_info;
-    struct boot_module *image;
-    struct boot_module *initrd = NULL;
+    struct boot_module *image = bd->kernel;
+    struct boot_module *initrd = bd->ramdisk;
+    struct domain *d = bd->d;
     int rc;
 
     printk(XENLOG_INFO "*** Building a PVH Dom%d ***\n", d->domain_id);
 
-    rc = first_boot_module_index(bi, BOOTMOD_KERNEL);
-    if ( unlikely(rc < 0 || rc > bi->nr_modules) )
+    if ( unlikely(image == NULL) )
         panic("Missing kernel boot module for %pd construction\n", d);
 
-    image = &bi->mods[rc];
-
-    rc = first_boot_module_index(bi, BOOTMOD_RAMDISK);
-    if ( rc > 0 || rc < bi->nr_modules )
-        initrd = &bi->mods[rc];
-
     if ( is_hardware_domain(d) )
     {
         /*
diff --git a/xen/arch/x86/include/asm/bootdomain.h b/xen/arch/x86/include/asm/bootdomain.h
new file mode 100644
index 000000000000..12c19ab37bd8
--- /dev/null
+++ b/xen/arch/x86/include/asm/bootdomain.h
@@ -0,0 +1,31 @@
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
+struct domain;
+
+struct boot_domain {
+    struct boot_module *kernel;
+    struct boot_module *ramdisk;
+
+    struct domain *d;
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
index a5ee90a36607..7b793ca62f19 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -10,10 +10,14 @@
 
 #include <xen/multiboot.h>
 #include <xen/types.h>
+#include <asm/bootdomain.h>
 
 /* Max number of boot modules a bootloader can provide in addition to Xen */
 #define MAX_NR_BOOTMODS 63
 
+/* Max number of boot domains that Xen can construct */
+#define MAX_NR_BOOTDOMS 1
+
 /* Boot module binary type / purpose */
 enum bootmod_type {
     BOOTMOD_UNKNOWN,
@@ -77,6 +81,7 @@ struct boot_info {
 
     unsigned int nr_modules;
     struct boot_module mods[MAX_NR_BOOTMODS + 1];
+    struct boot_domain domains[MAX_NR_BOOTDOMS];
 };
 
 /*
diff --git a/xen/arch/x86/include/asm/dom0_build.h b/xen/arch/x86/include/asm/dom0_build.h
index 4c2193c4a982..4a75fb25a801 100644
--- a/xen/arch/x86/include/asm/dom0_build.h
+++ b/xen/arch/x86/include/asm/dom0_build.h
@@ -13,10 +13,10 @@ unsigned long dom0_compute_nr_pages(struct domain *d,
                                     unsigned long initrd_len);
 int dom0_setup_permissions(struct domain *d);
 
-struct boot_info;
-int dom0_construct_pv(struct boot_info *bi, struct domain *d);
+struct boot_domain;
+int dom0_construct_pv(struct boot_domain *bd);
 
-int dom0_construct_pvh(struct boot_info *bi, struct domain *d);
+int dom0_construct_pvh(struct boot_domain *bd);
 
 unsigned long dom0_paging_pages(const struct domain *d,
                                 unsigned long nr_pages);
diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index 0591847c57e6..4968ac38398b 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -26,10 +26,8 @@ void subarch_init_memory(void);
 
 void init_IRQ(void);
 
-struct boot_info;
-int construct_dom0(
-    struct boot_info *bi,
-    struct domain *d);
+struct boot_domain;
+int construct_dom0(struct boot_domain *bd);
 void setup_io_bitmap(struct domain *d);
 
 extern struct boot_info xen_boot_info;
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index 5efc650eeff0..28257bf13127 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -355,7 +355,7 @@ static struct page_info * __init alloc_chunk(struct domain *d,
     return page;
 }
 
-static int __init dom0_construct(struct boot_info *bi, struct domain *d)
+static int __init dom0_construct(struct boot_domain *bd)
 {
     int i, rc, order, machine;
     bool compatible, compat;
@@ -370,13 +370,14 @@ static int __init dom0_construct(struct boot_info *bi, struct domain *d)
     struct page_info *page = NULL;
     unsigned int flush_flags = 0;
     start_info_t *si;
+    struct domain *d = bd->d;
     struct vcpu *v = d->vcpu[0];
-    struct boot_module *image;
-    struct boot_module *initrd = NULL;
+    struct boot_module *image = bd->kernel;
+    struct boot_module *initrd = bd->ramdisk;
     void *image_base;
     unsigned long image_len;
     void *image_start;
-    unsigned long initrd_len = 0;
+    unsigned long initrd_len = initrd ? initrd->size : 0;
     const char *cmdline;
     l4_pgentry_t *l4tab = NULL, *l4start = NULL;
     l3_pgentry_t *l3tab = NULL, *l3start = NULL;
@@ -414,23 +415,14 @@ static int __init dom0_construct(struct boot_info *bi, struct domain *d)
 
     printk(XENLOG_INFO "*** Building a PV Dom%d ***\n", d->domain_id);
 
-    i = first_boot_module_index(bi, BOOTMOD_KERNEL);
-    if ( unlikely(i < 0 || i > bi->nr_modules) )
+    if ( unlikely(image == NULL) )
         panic("Missing kernel boot module for %pd construction\n", d);
 
-    image = &bi->mods[i];
     image_base = bootstrap_map_bm(image);
     image_len = image->size;
     image_start = image_base + image->headroom;
     cmdline = __va(image->cmdline_pa);
 
-    i = first_boot_module_index(bi, BOOTMOD_RAMDISK);
-    if ( i > 0 || i < bi->nr_modules )
-    {
-        initrd = &bi->mods[i];
-        initrd_len = initrd->size;
-    }
-
     d->max_pages = ~0U;
 
     if ( (rc = bzimage_parse(image_base, &image_start, &image_len)) != 0 )
@@ -1066,7 +1058,7 @@ out:
     return rc;
 }
 
-int __init dom0_construct_pv(struct boot_info *bi, struct domain *d)
+int __init dom0_construct_pv(struct boot_domain *bd)
 {
     unsigned long cr4 = read_cr4();
     int rc;
@@ -1084,7 +1076,7 @@ int __init dom0_construct_pv(struct boot_info *bi, struct domain *d)
         write_cr4(cr4 & ~X86_CR4_SMAP);
     }
 
-    rc = dom0_construct(bi, d);
+    rc = dom0_construct(bd);
 
     if ( cr4 & X86_CR4_SMAP )
     {
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 18b93d6a272a..6e25a9f726c7 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -990,16 +990,9 @@ static struct domain *__init create_dom0(struct boot_info *bi)
             .misc_flags = opt_dom0_msr_relaxed ? XEN_X86_MSR_RELAXED : 0,
         },
     };
+    struct boot_domain *bd = &bi->domains[0];
     struct domain *d;
     domid_t domid;
-    struct boot_module *image;
-    unsigned int idx;
-
-    idx = first_boot_module_index(bi, BOOTMOD_KERNEL);
-    if ( unlikely(idx < 0 || idx > bi->nr_modules) )
-        panic("Missing kernel boot module for building Dom0\n");
-
-    image = &bi->mods[idx];
 
     if ( opt_dom0_pvh )
     {
@@ -1026,11 +1019,11 @@ static struct domain *__init create_dom0(struct boot_info *bi)
         panic("Error creating d%uv0\n", domid);
 
     /* Grab the DOM0 command line. */
-    if ( image->cmdline_pa || bi->kextra )
+    if ( bd->kernel->cmdline_pa || bi->kextra )
     {
-        if ( image->cmdline_pa )
-            safe_strcpy(
-                cmdline, cmdline_cook(__va(image->cmdline_pa), bi->loader));
+        if ( bd->kernel->cmdline_pa )
+            safe_strcpy(cmdline, cmdline_cook(__va(bd->kernel->cmdline_pa),
+                        bi->loader));
 
         if ( bi->kextra )
             /* kextra always includes exactly one leading space. */
@@ -1052,10 +1045,11 @@ static struct domain *__init create_dom0(struct boot_info *bi)
             safe_strcat(cmdline, acpi_param);
         }
 
-        image->cmdline_pa = __pa(cmdline);
+        bd->kernel->cmdline_pa = __pa(cmdline);
     }
 
-    if ( construct_dom0(bi, d) != 0 )
+    bd->d = d;
+    if ( construct_dom0(bd) != 0 )
         panic("Could not construct domain 0\n");
 
     return d;
@@ -1255,6 +1249,7 @@ void asmlinkage __init noreturn __start_xen(void)
 
     /* Dom0 kernel is always first */
     bi->mods[0].type = BOOTMOD_KERNEL;
+    bi->domains[0].kernel = &bi->mods[0];
 
     if ( pvh_boot )
     {
@@ -2125,6 +2120,7 @@ void asmlinkage __init noreturn __start_xen(void)
     if ( initrdidx < MAX_NR_BOOTMODS )
     {
         bi->mods[initrdidx].type = BOOTMOD_RAMDISK;
+        bi->domains[0].ramdisk = &bi->mods[initrdidx];
         if ( first_boot_module_index(bi, BOOTMOD_UNKNOWN) < MAX_NR_BOOTMODS )
             printk(XENLOG_WARNING
                    "Multiple initrd candidates, picking module #%u\n",
-- 
2.30.2


