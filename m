Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 553CB966BAE
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 23:56:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786798.1196611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9bm-0007UF-2J; Fri, 30 Aug 2024 21:56:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786798.1196611; Fri, 30 Aug 2024 21:56:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9bl-0007Gp-GK; Fri, 30 Aug 2024 21:56:41 +0000
Received: by outflank-mailman (input) for mailman id 786798;
 Fri, 30 Aug 2024 21:56:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiG6=P5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sk9WI-0002pb-3U
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 21:51:02 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f162e06d-6719-11ef-a0b1-8be0dac302b0;
 Fri, 30 Aug 2024 23:51:01 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: by mx.zohomail.com with SMTPS id 1725054488141373.37797061577385;
 Fri, 30 Aug 2024 14:48:08 -0700 (PDT)
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
X-Inumbo-ID: f162e06d-6719-11ef-a0b1-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1725054490; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=S4WCJwe9XVjYfg9SYILGNDE2sLz+Fy8ozFBIUpBe/WlTznKzyhhLGYtS1b3CKgmLNjAKvugxhxjndWMhapjUB5Bb50EmtTMHaPAQwjnDRLmeI/92Cp0Y9UcE/uQkJoMveQzWlpVFAT7xXJPOq9mPOTaoTsfUfUrDzTjVLHQuApM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1725054490; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=L5tz0lT7C2k6e608u4s5wJilake7jMdmn/z/xN+eCro=; 
	b=exqOAKBMLEALMZSYZhdyG09tTYe0Ugv/3VBzCdFP4j1oYhvKROwZd3KKWCk7q26nxqVCYQjV928oYzAkwZVJeQpZHNzR6QaZvvz79AEb1PGCodQdgyq3dc4fAkuelA1uX6R1SEYyKNBD1SEXtPGW6uKXcDQzpZE1OIFBW3yblWQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725054490;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=L5tz0lT7C2k6e608u4s5wJilake7jMdmn/z/xN+eCro=;
	b=nrRFsyM5UInTlstUVsEl0V9mKlmIzQ5GB7oNPvl0tI8pA2iD0DVY1ZkM87bXUrRl
	qB92yUjPt9ufulSH/3sN+PrzkkTfbUoXzp/bYdXD5eXa5vbgEtgHX1O/DshJ82qL6Ib
	/ekXHXojlFbeIrRCyHvvDDZdgsspcCyoXrOw+Wa4=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 26/44] x86/boot: convert construct_dom0 to use struct boot_module
Date: Fri, 30 Aug 2024 17:47:11 -0400
Message-Id: <20240830214730.1621-27-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240830214730.1621-1-dpsmith@apertussolutions.com>
References: <20240830214730.1621-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The construct_dom0 function is converted to consume struct boot_module
instances for the kernel and ramdisk. With this change, it is no longer
necessary for the internal use of struct mod by create_dom0, so they are
changed to struct boot_module.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/dom0_build.c        | 10 +++++-----
 xen/arch/x86/include/asm/setup.h |  6 ++----
 xen/arch/x86/setup.c             | 17 ++++++++---------
 3 files changed, 15 insertions(+), 18 deletions(-)

diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index 8d56705a0861..fb1b7e5d11cf 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -13,6 +13,7 @@
 #include <xen/softirq.h>
 
 #include <asm/amd.h>
+#include <asm/bootinfo.h>
 #include <asm/dom0_build.h>
 #include <asm/guest.h>
 #include <asm/hpet.h>
@@ -596,9 +597,8 @@ int __init dom0_setup_permissions(struct domain *d)
     return rc;
 }
 
-int __init construct_dom0(struct domain *d, const module_t *image,
-                          unsigned long image_headroom, module_t *initrd,
-                          const char *cmdline)
+int __init construct_dom0(struct domain *d, const struct boot_module *image,
+                          struct boot_module *initrd, const char *cmdline)
 {
     int rc;
 
@@ -610,9 +610,9 @@ int __init construct_dom0(struct domain *d, const module_t *image,
     process_pending_softirqs();
 
     if ( is_hvm_domain(d) )
-        rc = dom0_construct_pvh(d, image, image_headroom, initrd, cmdline);
+        rc = dom0_construct_pvh(d, image->early_mod, image->headroom, initrd->early_mod, cmdline);
     else if ( is_pv_domain(d) )
-        rc = dom0_construct_pv(d, image, image_headroom, initrd, cmdline);
+        rc = dom0_construct_pv(d, image->early_mod, image->headroom, initrd->early_mod, cmdline);
     else
         panic("Cannot construct Dom0. No guest interface available\n");
 
diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index 165ca744ba34..19e2ad95b523 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -27,10 +27,8 @@ void subarch_init_memory(void);
 void init_IRQ(void);
 
 int construct_dom0(
-    struct domain *d,
-    const module_t *image, unsigned long image_headroom,
-    module_t *initrd,
-    const char *cmdline);
+    struct domain *d, const struct boot_module *image,
+    struct boot_module *initrd, const char *cmdline);
 void setup_io_bitmap(struct domain *d);
 
 unsigned long initial_images_nrpages(nodeid_t node);
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 6a613c4847b0..f58eb21d00d7 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -962,20 +962,19 @@ static struct domain *__init create_dom0(const struct boot_info *bi,
             .misc_flags = opt_dom0_msr_relaxed ? XEN_X86_MSR_RELAXED : 0,
         },
     };
-    int headroom, mod_idx = first_boot_module_index(bi, BOOTMOD_RAMDISK);
-    module_t *image, *initrd;
+    int mod_idx = first_boot_module_index(bi, BOOTMOD_RAMDISK);
+    struct boot_module *image, *initrd;
     struct domain *d;
     domid_t domid;
 
     /* Map boot_module to mb1 module for dom0 */
-    image = bi->mods[0].early_mod;
-    headroom = bi->mods[0].headroom;
+    image = &bi->mods[0];
 
     /* Map boot_module to mb1 module for initrd */
     if ( mod_idx < 0 )
         initrd = NULL;
     else
-        initrd = bi->mods[mod_idx].early_mod;
+        initrd = &bi->mods[mod_idx];
 
     if ( opt_dom0_pvh )
     {
@@ -1002,10 +1001,10 @@ static struct domain *__init create_dom0(const struct boot_info *bi,
         panic("Error creating d%uv0\n", domid);
 
     /* Grab the DOM0 command line. */
-    if ( image->string || kextra )
+    if ( image->early_mod->string || kextra )
     {
-        if ( image->string )
-            safe_strcpy(cmdline, cmdline_cook(__va(image->string),
+        if ( image->early_mod->string )
+            safe_strcpy(cmdline, cmdline_cook(__va(image->early_mod->string),
                         bi->boot_loader_name));
 
         if ( kextra )
@@ -1040,7 +1039,7 @@ static struct domain *__init create_dom0(const struct boot_info *bi,
         write_cr4(read_cr4() & ~X86_CR4_SMAP);
     }
 
-    if ( construct_dom0(d, image, headroom, initrd, cmdline) != 0 )
+    if ( construct_dom0(d, image, initrd, cmdline) != 0 )
         panic("Could not construct domain 0\n");
 
     if ( cpu_has_smap )
-- 
2.30.2


