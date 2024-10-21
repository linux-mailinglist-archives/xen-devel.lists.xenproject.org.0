Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C139A5848
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 02:49:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.822924.1236884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2gbV-0004RH-VZ; Mon, 21 Oct 2024 00:49:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 822924.1236884; Mon, 21 Oct 2024 00:49:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2gbV-0004OH-RW; Mon, 21 Oct 2024 00:49:01 +0000
Received: by outflank-mailman (input) for mailman id 822924;
 Mon, 21 Oct 2024 00:49:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q0x4=RR=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t2gbU-0003Iq-F1
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 00:49:00 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 40ed903a-8f46-11ef-99a3-01e77a169b0f;
 Mon, 21 Oct 2024 02:48:58 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729471607102166.0182824509185;
 Sun, 20 Oct 2024 17:46:47 -0700 (PDT)
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
X-Inumbo-ID: 40ed903a-8f46-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1729471608; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WO5Zr6CPBrBo9daYaNRGckB7hkc6SsWurLIp5gvxptdINyH8EjibF1Qtim1vnD+rBedp6vUTndyACF0A2qAvVY2rs5Z+ZpEyl4OGmqbc8GiUp2G/dWy/lvZjsueVWj/JgdX0y912qQOWKdHyPReO3qsj189ZdqveYZ9JE9C1I40=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729471608; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=cBjn8qpPRBCnRHHQipv24ZKBHCd3uNn+xt1GGGTjo4k=; 
	b=NSbS3/reyYsemBUu+p9rK7RlHY2gQwziWRUnJzzYuLw2kpAKZzxth8vpMVkvWor9Kfaipess1v2P1OUaRrGc1BbQoFPKOGvzktO4nAjJiUE4QI400fTmXh6r/BxrlYWelWB/jCgJLKQvw98v5j7Bm16f2SbJeU1wf6IphzVaAV4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729471608;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=cBjn8qpPRBCnRHHQipv24ZKBHCd3uNn+xt1GGGTjo4k=;
	b=I/OxuYEX0ItDD1mTenXEOPO3Yc/g//LoyeRo3O3ZbOn05UT6yh/ZD8npdItO9WQI
	U/vFyEIBRDUU1k2kPtZPAGjEqOH2460Pen30jZ5zTJi7Vdd5Vumln7rt3dowp8ZMfrA
	nLqJ6fBONBYP95Im4t7Fadbp7yBtx4Xh5b8UGI8I=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v7 20/38] x86/boot: convert construct_dom0 to use struct boot_module
Date: Sun, 20 Oct 2024 20:45:55 -0400
Message-Id: <20241021004613.18793-21-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241021004613.18793-1-dpsmith@apertussolutions.com>
References: <20241021004613.18793-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The construct_dom0 function is converted to consume struct boot_module
instances for the kernel and ramdisk. With this change, it is no longer
necessary for the internal use of struct mod by create_dom0, so they are
changed to struct boot_module.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
 xen/arch/x86/dom0_build.c        | 12 +++++++-----
 xen/arch/x86/include/asm/setup.h |  6 ++----
 xen/arch/x86/setup.c             | 19 +++++++++----------
 3 files changed, 18 insertions(+), 19 deletions(-)

diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index 8d56705a0861..1eff3192f72d 100644
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
 
@@ -610,9 +610,11 @@ int __init construct_dom0(struct domain *d, const module_t *image,
     process_pending_softirqs();
 
     if ( is_hvm_domain(d) )
-        rc = dom0_construct_pvh(d, image, image_headroom, initrd, cmdline);
+        rc = dom0_construct_pvh(d, image->mod, image->headroom, initrd->mod,
+                                cmdline);
     else if ( is_pv_domain(d) )
-        rc = dom0_construct_pv(d, image, image_headroom, initrd, cmdline);
+        rc = dom0_construct_pv(d, image->mod, image->headroom, initrd->mod,
+                               cmdline);
     else
         panic("Cannot construct Dom0. No guest interface available\n");
 
diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index 729f68ca23b8..72d183e8a4de 100644
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
 
 extern struct boot_info xen_boot_info;
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 347b27ad7c6c..d7f03225bd5a 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -962,7 +962,7 @@ static unsigned int __init copy_bios_e820(struct e820entry *map, unsigned int li
     return n;
 }
 
-static struct domain *__init create_dom0(const struct boot_info *bi,
+static struct domain *__init create_dom0(struct boot_info *bi,
                                          const char *kextra)
 {
     static char __initdata cmdline[MAX_GUEST_CMDLINE];
@@ -978,21 +978,19 @@ static struct domain *__init create_dom0(const struct boot_info *bi,
             .misc_flags = opt_dom0_msr_relaxed ? XEN_X86_MSR_RELAXED : 0,
         },
     };
-    unsigned long headroom;
     unsigned int mod_idx = first_boot_module_index(bi, BOOTMOD_RAMDISK);
-    module_t *image, *initrd;
+    struct boot_module *image, *initrd;
     struct domain *d;
     domid_t domid;
 
     /* Map boot_module to mb1 module for dom0 */
-    image = bi->mods[0].mod;
-    headroom = bi->mods[0].headroom;
+    image = &bi->mods[0];
 
     /* Map boot_module to mb1 module for initrd */
     if ( mod_idx < 0 )
         initrd = NULL;
     else
-        initrd = bi->mods[mod_idx].mod;
+        initrd = &bi->mods[mod_idx];
 
     if ( opt_dom0_pvh )
     {
@@ -1019,10 +1017,11 @@ static struct domain *__init create_dom0(const struct boot_info *bi,
         panic("Error creating d%uv0\n", domid);
 
     /* Grab the DOM0 command line. */
-    if ( image->string || kextra )
+    if ( image->mod->string || kextra )
     {
-        if ( image->string )
-            safe_strcpy(cmdline, cmdline_cook(__va(image->string), bi->loader));
+        if ( image->mod->string )
+            safe_strcpy(cmdline, cmdline_cook(__va(image->mod->string),
+                        bi->loader));
 
         if ( kextra )
             /* kextra always includes exactly one leading space. */
@@ -1045,7 +1044,7 @@ static struct domain *__init create_dom0(const struct boot_info *bi,
         }
     }
 
-    if ( construct_dom0(d, image, headroom, initrd, cmdline) != 0 )
+    if ( construct_dom0(d, image, initrd, cmdline) != 0 )
         panic("Could not construct domain 0\n");
 
     return d;
-- 
2.30.2


