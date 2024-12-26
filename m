Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3EAD9FCC06
	for <lists+xen-devel@lfdr.de>; Thu, 26 Dec 2024 17:58:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.863236.1274660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tQrBU-0002Ms-NS; Thu, 26 Dec 2024 16:58:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 863236.1274660; Thu, 26 Dec 2024 16:58:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tQrBU-0002LE-KN; Thu, 26 Dec 2024 16:58:04 +0000
Received: by outflank-mailman (input) for mailman id 863236;
 Thu, 26 Dec 2024 16:58:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vkhu=TT=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tQrBT-00026T-Hd
 for xen-devel@lists.xenproject.org; Thu, 26 Dec 2024 16:58:03 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90cdeefc-c3aa-11ef-a0da-8be0dac302b0;
 Thu, 26 Dec 2024 17:58:02 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1735232271045470.01366880994726;
 Thu, 26 Dec 2024 08:57:51 -0800 (PST)
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
X-Inumbo-ID: 90cdeefc-c3aa-11ef-a0da-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1735232272; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NgzhDXiJG2mXhvHErwt9ZqhWeHKIomFe2B2HxnbWBp+5100uNqjMOVCHgHMk4pOJmeGarT7MJhd2hKbUw3lafh44DIgHAOd3pmkzHHhr0j6stIQW3xHLxJc8vsfQ4wQVnhzZ1+pNuRbVF5hJdAmqmKiTzissnh9porFs1YSNrZM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1735232272; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=/JEBs+owbU9zKFMXeF6gl9Ekr8hZ2owuS8MfDWsoy0M=; 
	b=UwZcSTyd04VLLQIVhZ0E5B+jUyfwUq7KN8XIRHMzsQkz4ECRK6wW2jafh4XfofAqMXsvOm4OMgaRtPMvFx0bWtHDCahUOGWvqfi21/nQ7Hv6/6a/vDUJiAfXQFI57QyvBJJ4rpudvc3z8Ir+NwkPM3L0ERjR4yM7rArgAcIWRug=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1735232272;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=/JEBs+owbU9zKFMXeF6gl9Ekr8hZ2owuS8MfDWsoy0M=;
	b=T9LCCGVdlAVM1x1CMLBYcsUhzzdMe50AuAgWKQHWnL2aC0XYz/JVEOmP+9972XMJ
	Y1HGB9jXZF2v36P6pdO7G4Wiprea4ghW9XBG3RKEpQ9vzdiAg+rcj20EiC8jYkBz38u
	iGs6cZr1psDCAGTnrBm5mq7ID1evOXsIAi6z1qUo=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 01/15] x86/boot: introduce boot domain
Date: Thu, 26 Dec 2024 11:57:26 -0500
Message-Id: <20241226165740.29812-2-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241226165740.29812-1-dpsmith@apertussolutions.com>
References: <20241226165740.29812-1-dpsmith@apertussolutions.com>
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
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

---
Changes since dom0 device tree v1:
- dropped unnecessary forward declarations
- moved pvh_load_kernel() changes forward to this commit

Changes since boot modules v9
- dropped unlikely

Changes since v8:
- code style correction
---
 xen/arch/x86/dom0_build.c             |  8 +++++---
 xen/arch/x86/hvm/dom0_build.c         | 23 ++++++++--------------
 xen/arch/x86/include/asm/bootdomain.h | 28 +++++++++++++++++++++++++++
 xen/arch/x86/include/asm/bootinfo.h   |  5 +++++
 xen/arch/x86/include/asm/dom0_build.h |  6 +++---
 xen/arch/x86/include/asm/setup.h      |  4 ++--
 xen/arch/x86/pv/dom0_build.c          | 24 ++++++++---------------
 xen/arch/x86/setup.c                  | 24 ++++++++++-------------
 8 files changed, 69 insertions(+), 53 deletions(-)
 create mode 100644 xen/arch/x86/include/asm/bootdomain.h

diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index e8f5bf5447bc..c231191faec7 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -13,6 +13,7 @@
 #include <xen/softirq.h>
 
 #include <asm/amd.h>
+#include <asm/bootinfo.h>
 #include <asm/dom0_build.h>
 #include <asm/guest.h>
 #include <asm/hpet.h>
@@ -596,9 +597,10 @@ int __init dom0_setup_permissions(struct domain *d)
     return rc;
 }
 
-int __init construct_dom0(struct boot_info *bi, struct domain *d)
+int __init construct_dom0(struct boot_domain *bd)
 {
     int rc;
+    const struct domain *d = bd->d;
 
     /* Sanity! */
     BUG_ON(!pv_shim && d->domain_id != 0);
@@ -608,9 +610,9 @@ int __init construct_dom0(struct boot_info *bi, struct domain *d)
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
index ce5b5c31b318..cbc365d678d2 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -644,9 +644,11 @@ static bool __init check_and_adjust_load_address(
 }
 
 static int __init pvh_load_kernel(
-    struct domain *d, struct boot_module *image, struct boot_module *initrd,
-    paddr_t *entry, paddr_t *start_info_addr)
+    struct boot_domain *bd, paddr_t *entry, paddr_t *start_info_addr)
 {
+    struct domain *d = bd->d;
+    struct boot_module *image = bd->kernel;
+    struct boot_module *initrd = bd->ramdisk;
     void *image_base = bootstrap_map_bm(image);
     void *image_start = image_base + image->headroom;
     unsigned long image_len = image->size;
@@ -1301,26 +1303,17 @@ static void __hwdom_init pvh_setup_mmcfg(struct domain *d)
     }
 }
 
-int __init dom0_construct_pvh(struct boot_info *bi, struct domain *d)
+int __init dom0_construct_pvh(struct boot_domain *bd)
 {
     paddr_t entry, start_info;
-    struct boot_module *image;
-    struct boot_module *initrd = NULL;
-    unsigned int idx;
+    struct domain *d = bd->d;
     int rc;
 
     printk(XENLOG_INFO "*** Building a PVH Dom%d ***\n", d->domain_id);
 
-    idx = first_boot_module_index(bi, BOOTMOD_KERNEL);
-    if ( idx >= bi->nr_modules )
+    if ( bd->kernel == NULL )
         panic("Missing kernel boot module for %pd construction\n", d);
 
-    image = &bi->mods[idx];
-
-    idx = first_boot_module_index(bi, BOOTMOD_RAMDISK);
-    if ( idx < bi->nr_modules )
-        initrd = &bi->mods[idx];
-
     if ( is_hardware_domain(d) )
     {
         /*
@@ -1358,7 +1351,7 @@ int __init dom0_construct_pvh(struct boot_info *bi, struct domain *d)
         return rc;
     }
 
-    rc = pvh_load_kernel(d, image, initrd, &entry, &start_info);
+    rc = pvh_load_kernel(bd, &entry, &start_info);
     if ( rc )
     {
         printk("Failed to load Dom0 kernel\n");
diff --git a/xen/arch/x86/include/asm/bootdomain.h b/xen/arch/x86/include/asm/bootdomain.h
new file mode 100644
index 000000000000..8d0e5c78d426
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
index f8b422913063..9f65e2c8f62d 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -11,10 +11,14 @@
 #include <xen/init.h>
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
@@ -78,6 +82,7 @@ struct boot_info {
 
     unsigned int nr_modules;
     struct boot_module mods[MAX_NR_BOOTMODS + 1];
+    struct boot_domain domains[MAX_NR_BOOTDOMS];
 };
 
 /*
diff --git a/xen/arch/x86/include/asm/dom0_build.h b/xen/arch/x86/include/asm/dom0_build.h
index 2d67b17213dc..8c94e87dc576 100644
--- a/xen/arch/x86/include/asm/dom0_build.h
+++ b/xen/arch/x86/include/asm/dom0_build.h
@@ -13,9 +13,9 @@ unsigned long dom0_compute_nr_pages(struct domain *d,
                                     unsigned long initrd_len);
 int dom0_setup_permissions(struct domain *d);
 
-struct boot_info;
-int dom0_construct_pv(struct boot_info *bi, struct domain *d);
-int dom0_construct_pvh(struct boot_info *bi, struct domain *d);
+struct boot_domain;
+int dom0_construct_pv(struct boot_domain *bd);
+int dom0_construct_pvh(struct boot_domain *bd);
 
 unsigned long dom0_paging_pages(const struct domain *d,
                                 unsigned long nr_pages);
diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index 5c2391a8684b..b517da6144de 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -26,8 +26,8 @@ void subarch_init_memory(void);
 
 void init_IRQ(void);
 
-struct boot_info;
-int construct_dom0(struct boot_info *bi, struct domain *d);
+struct boot_domain;
+int construct_dom0(struct boot_domain *bd);
 
 void setup_io_bitmap(struct domain *d);
 
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index f54d1da5c6f4..e0709a1c1a7a 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -355,7 +355,7 @@ static struct page_info * __init alloc_chunk(struct domain *d,
     return page;
 }
 
-static int __init dom0_construct(struct boot_info *bi, struct domain *d)
+static int __init dom0_construct(struct boot_domain *bd)
 {
     unsigned int i;
     int rc, order, machine;
@@ -371,14 +371,15 @@ static int __init dom0_construct(struct boot_info *bi, struct domain *d)
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
 
     l4_pgentry_t *l4tab = NULL, *l4start = NULL;
     l3_pgentry_t *l3tab = NULL, *l3start = NULL;
@@ -416,22 +417,13 @@ static int __init dom0_construct(struct boot_info *bi, struct domain *d)
 
     printk(XENLOG_INFO "*** Building a PV Dom%d ***\n", d->domain_id);
 
-    i = first_boot_module_index(bi, BOOTMOD_KERNEL);
-    if ( i >= bi->nr_modules )
+    if ( !image )
         panic("Missing kernel boot module for %pd construction\n", d);
 
-    image = &bi->mods[i];
     image_base = bootstrap_map_bm(image);
     image_len = image->size;
     image_start = image_base + image->headroom;
 
-    i = first_boot_module_index(bi, BOOTMOD_RAMDISK);
-    if ( i < bi->nr_modules )
-    {
-        initrd = &bi->mods[i];
-        initrd_len = initrd->size;
-    }
-
     d->max_pages = ~0U;
 
     if ( (rc = bzimage_parse(image_base, &image_start, &image_len)) != 0 )
@@ -1078,7 +1070,7 @@ out:
     return rc;
 }
 
-int __init dom0_construct_pv(struct boot_info *bi, struct domain *d)
+int __init dom0_construct_pv(struct boot_domain *bd)
 {
     unsigned long cr4 = read_cr4();
     int rc;
@@ -1096,7 +1088,7 @@ int __init dom0_construct_pv(struct boot_info *bi, struct domain *d)
         write_cr4(cr4 & ~X86_CR4_SMAP);
     }
 
-    rc = dom0_construct(bi, d);
+    rc = dom0_construct(bd);
 
     if ( cr4 & X86_CR4_SMAP )
     {
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 8ebe5a9443f3..7e4529d6bfb2 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -989,16 +989,9 @@ static struct domain *__init create_dom0(struct boot_info *bi)
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
-    if ( idx >= bi->nr_modules )
-        panic("Missing kernel boot module for building domain\n");
-
-    image = &bi->mods[idx];
 
     if ( opt_dom0_pvh )
     {
@@ -1025,11 +1018,11 @@ static struct domain *__init create_dom0(struct boot_info *bi)
         panic("Error creating d%uv0\n", domid);
 
     /* Grab the DOM0 command line. */
-    if ( image->cmdline_pa || bi->kextra )
+    if ( bd->kernel->cmdline_pa || bi->kextra )
     {
-        if ( image->cmdline_pa )
-            safe_strcpy(
-                cmdline, cmdline_cook(__va(image->cmdline_pa), bi->loader));
+        if ( bd->kernel->cmdline_pa )
+            safe_strcpy(cmdline,
+                        cmdline_cook(__va(bd->kernel->cmdline_pa), bi->loader));
 
         if ( bi->kextra )
             /* kextra always includes exactly one leading space. */
@@ -1051,10 +1044,11 @@ static struct domain *__init create_dom0(struct boot_info *bi)
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
@@ -1261,6 +1255,7 @@ void asmlinkage __init noreturn __start_xen(void)
 
     /* Dom0 kernel is always first */
     bi->mods[0].type = BOOTMOD_KERNEL;
+    bi->domains[0].kernel = &bi->mods[0];
 
     if ( pvh_boot )
     {
@@ -2118,6 +2113,7 @@ void asmlinkage __init noreturn __start_xen(void)
     if ( initrdidx < MAX_NR_BOOTMODS )
     {
         bi->mods[initrdidx].type = BOOTMOD_RAMDISK;
+        bi->domains[0].ramdisk = &bi->mods[initrdidx];
         if ( first_boot_module_index(bi, BOOTMOD_UNKNOWN) < MAX_NR_BOOTMODS )
             printk(XENLOG_WARNING
                    "Multiple initrd candidates, picking module #%u\n",
-- 
2.30.2


