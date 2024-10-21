Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B65F9A584A
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 02:50:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.822931.1236905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2gcz-0006nz-Iw; Mon, 21 Oct 2024 00:50:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 822931.1236905; Mon, 21 Oct 2024 00:50:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2gcz-0006mB-FY; Mon, 21 Oct 2024 00:50:33 +0000
Received: by outflank-mailman (input) for mailman id 822931;
 Mon, 21 Oct 2024 00:50:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q0x4=RR=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t2gcy-0006SZ-Ek
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 00:50:32 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 77c4f1ae-8f46-11ef-99a3-01e77a169b0f;
 Mon, 21 Oct 2024 02:50:30 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729471620910870.5614994718397;
 Sun, 20 Oct 2024 17:47:00 -0700 (PDT)
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
X-Inumbo-ID: 77c4f1ae-8f46-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1729471623; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DuBhDV9LR43EjSEDrWxffmCR7i6UHowBWr7l+kg6XwSINeRtJOd86N/zKlBiTw6oKnTRsFsHyDMwXYVn8UkTFjCtfaC2eL7ftbeYf+1H1U7dkixblKhFPQ+Pkj6P8a/B00wHAeB9pLlhHO1uNEjq+IAgZjD1Xs9+fc3sCH76i0I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729471623; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Oopo77OjyZyLSeSBhv9zVkD0fLALdVYLRGVHW2cBbWA=; 
	b=bCNVar2zNjEBdjfjwPaH/BnBHAqljrdLZgyXO9wfANN245/I36u7c+600KnPRklNsWYEZ5O6Mgw3O1NOrNwIdNS1XVRmWHDgYzdgi4G8HC6PnjVveLP1+v5GlLIEdZxiIakAABDAVisSwV2fHttpXGsuAmo+0h9+cyeBCizSyMY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729471623;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=Oopo77OjyZyLSeSBhv9zVkD0fLALdVYLRGVHW2cBbWA=;
	b=UQhe8Ua9gqNAY8peiLoAJNH5hlB8ScDqnGV6yIMJVUg48TBWhzqY8jcyxykrEQyU
	p6doLUX1OO2C3fYyPHOAMC9lUyrbrbcVHAr/7neHRHqsUjd+F5FDnS7JKSAlM0cPaJd
	v/CMUXFMwAA8qI04KEdtE4t8/zfqowB5xct30V2k=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v7 32/38] x86/boot: introduce boot domain
Date: Sun, 20 Oct 2024 20:46:07 -0400
Message-Id: <20241021004613.18793-33-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241021004613.18793-1-dpsmith@apertussolutions.com>
References: <20241021004613.18793-1-dpsmith@apertussolutions.com>
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
 xen/arch/x86/include/asm/bootinfo.h   |  5 +++++
 xen/arch/x86/setup.c                  | 23 +++++++---------------
 3 files changed, 40 insertions(+), 16 deletions(-)
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
index eaed99b64e57..3fb23e90d712 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -9,10 +9,14 @@
 #define X86_BOOTINFO_H
 
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
@@ -68,6 +72,7 @@ struct boot_info {
 
     unsigned int nr_modules;
     struct boot_module mods[MAX_NR_BOOTMODS + 1];
+    struct boot_domain domains[MAX_NR_BOOTDOMS];
 };
 
 static inline struct boot_module *__init next_boot_module_by_type(
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 1fda462ba1d0..9b2a16863eae 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -972,20 +972,10 @@ static struct domain *__init create_dom0(struct boot_info *bi)
             .misc_flags = opt_dom0_msr_relaxed ? XEN_X86_MSR_RELAXED : 0,
         },
     };
-    unsigned int mod_idx = first_boot_module_index(bi, BOOTMOD_RAMDISK);
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
@@ -1011,11 +1001,10 @@ static struct domain *__init create_dom0(struct boot_info *bi)
         panic("Error creating d%uv0\n", domid);
 
     /* Grab the DOM0 command line. */
-    if ( image->cmdline || bi->kextra )
+    if ( bd->kernel->cmdline || bi->kextra )
     {
-        if ( image->cmdline )
-            safe_strcpy(cmdline,
-                        cmdline_cook(__va(image->cmdline),
+        if ( bd->kernel->cmdline )
+            safe_strcpy(cmdline, cmdline_cook(__va(bd->kernel->cmdline),
                         bi->loader));
 
         if ( bi->kextra )
@@ -1039,7 +1028,7 @@ static struct domain *__init create_dom0(struct boot_info *bi)
         }
     }
 
-    if ( construct_dom0(d, image, initrd, cmdline) != 0 )
+    if ( construct_dom0(d, bd->kernel, bd->ramdisk, cmdline) != 0 )
         panic("Could not construct domain 0\n");
 
     return d;
@@ -1226,6 +1215,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
     /* Dom0 kernel is always first */
     bi->mods[0].type = BOOTMOD_KERNEL;
     bi->mods[0].consumed = true;
+    bi->domains[0].kernel = &bi->mods[0];
 
     if ( pvh_boot )
     {
@@ -2104,6 +2094,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
     {
         bi->mods[initrdidx].type = BOOTMOD_RAMDISK;
         bi->mods[initrdidx].consumed = true;
+        bi->domains[0].ramdisk = &bi->mods[initrdidx];
         if ( first_boot_module_index(bi, BOOTMOD_UNKNOWN) < MAX_NR_BOOTMODS )
             printk(XENLOG_WARNING
                    "Multiple initrd candidates, picking module #%u\n",
-- 
2.30.2


