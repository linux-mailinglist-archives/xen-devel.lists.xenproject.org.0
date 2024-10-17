Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FB39A2A91
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 19:17:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820960.1234705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1U7z-0005Yh-0v; Thu, 17 Oct 2024 17:17:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820960.1234705; Thu, 17 Oct 2024 17:17:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1U7y-0005Vn-Tt; Thu, 17 Oct 2024 17:17:34 +0000
Received: by outflank-mailman (input) for mailman id 820960;
 Thu, 17 Oct 2024 17:17:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KqF2=RN=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t1Tze-0008TH-L2
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 17:08:58 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e4aa548-8caa-11ef-a0be-8be0dac302b0;
 Thu, 17 Oct 2024 19:08:57 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729184662893105.18560154820727;
 Thu, 17 Oct 2024 10:04:22 -0700 (PDT)
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
X-Inumbo-ID: 7e4aa548-8caa-11ef-a0be-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1729184665; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fBe4WLb7EHSW3PylVLEICC3qQRDDiKHL+H0c+uF7mjXUy5PcrmKf+qG1f+lFY1FaTEm+rJdYCMxDPGRJVX/zTJsxy+pLukTSOLLDgnmyVLq5xFzEX6up4Uope85qacc6qakYc9V2YNGofkbqt+JkPuydUFfn31tClzqBDC92t9E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729184665; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=S1LW22pFbnxH5JGQ8//MfzLwShQxKtqrPZfaGz84Hgg=; 
	b=Osbbkoh/MPisEEZO+D7hShf3v40EoYGbEGjI6M3dRnpeoX55IQeNvxjd9Jx4ydAjCk71cBZd0stqBiPJ0WZBxqqFDvRnjiNbzWoyF262aBb579DcVinw+ZX1OykfpqBjGwWONu6eZkKHIzC91ulhOJoBpvnSNjip6pLwrN7OD1w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729184665;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=S1LW22pFbnxH5JGQ8//MfzLwShQxKtqrPZfaGz84Hgg=;
	b=is4MgpcB2Qw7lJR60I4biW7RtZlThCKyy2HlGdCtygnA1/Dnl/VtyJOQ5nQ3qnIo
	x0O/4vni9MAKVmUNEGCWt8jMAhmfvQ8W86OUoQKWUDLaINyE/BzXyvbgI95CPlYSDDY
	ip+F2EqrX5YhPQ68F5dW77QqzYrrfLoRphOVPLiY=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v6 38/44] x86/boot: introduce boot domain
Date: Thu, 17 Oct 2024 13:03:18 -0400
Message-Id: <20241017170325.3842-39-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241017170325.3842-1-dpsmith@apertussolutions.com>
References: <20241017170325.3842-1-dpsmith@apertussolutions.com>
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
index b65b55c0a2c2..476f71a7633b 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -9,10 +9,14 @@
 #define __XEN_X86_BOOTINFO_H__
 
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
@@ -63,6 +67,7 @@ struct boot_info {
 
     unsigned int nr_modules;
     struct boot_module mods[MAX_NR_BOOTMODS + 1];
+    struct boot_domain domains[MAX_NR_BOOTDOMS];
 };
 
 /*
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index ae027667eb82..ccb5052e18be 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -956,20 +956,10 @@ static struct domain *__init create_dom0(struct boot_info *bi)
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
@@ -995,11 +985,10 @@ static struct domain *__init create_dom0(struct boot_info *bi)
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
@@ -1023,7 +1012,7 @@ static struct domain *__init create_dom0(struct boot_info *bi)
         }
     }
 
-    if ( construct_dom0(d, image, initrd, cmdline) != 0 )
+    if ( construct_dom0(d, bd->kernel, bd->ramdisk, cmdline) != 0 )
         panic("Could not construct domain 0\n");
 
     return d;
@@ -1203,6 +1192,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
     /* Dom0 kernel is always first */
     bi->mods[0].type = BOOTMOD_KERNEL;
     bi->mods[0].flags = BOOTMOD_FLAG_X86_CONSUMED;
+    bi->domains[0].kernel = &bi->mods[0];
 
     if ( pvh_boot )
     {
@@ -2086,6 +2076,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
     {
         bi->mods[initrdidx].type = BOOTMOD_RAMDISK;
         bi->mods[initrdidx].flags |= BOOTMOD_FLAG_X86_CONSUMED;
+        bi->domains[0].ramdisk = &bi->mods[initrdidx];
         if ( first_boot_module_index(bi, BOOTMOD_UNKNOWN) < MAX_NR_BOOTMODS )
             printk(XENLOG_WARNING
                    "Multiple initrd candidates, picking module #%u\n",
-- 
2.30.2


