Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7658C9A2AA5
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 19:19:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820992.1234784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1U9i-0000mT-Fh; Thu, 17 Oct 2024 17:19:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820992.1234784; Thu, 17 Oct 2024 17:19:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1U9i-0000jm-BS; Thu, 17 Oct 2024 17:19:22 +0000
Received: by outflank-mailman (input) for mailman id 820992;
 Thu, 17 Oct 2024 17:19:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KqF2=RN=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t1TxG-0008TH-Pu
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 17:06:30 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2621499d-8caa-11ef-a0be-8be0dac302b0;
 Thu, 17 Oct 2024 19:06:29 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729184640324617.7081638090145;
 Thu, 17 Oct 2024 10:04:00 -0700 (PDT)
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
X-Inumbo-ID: 2621499d-8caa-11ef-a0be-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1729184643; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GudBkxNB4uk1sueWWl+b+OP6jTJXLFAeyzYM8YUWdxnyr+bK/gVchS0QTLyxsKoFxE7DdP5s3e08ZWH7fb6uUN7S12N8Hh8PgvTUXlEqmKLBmJ+K/BUMQD46W5ct7jdJCl/aIzotiZELXhjFVH+YWESa4B/KhlhzXLkyZ1mDrxI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729184643; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=GjWn8P4/iAki6mlp0w0Xm+yUTIZ9w1BAGBcnDQ6vMwM=; 
	b=LpYrwgK9bfZueJBU+SAUDU1e3bU5wodF29i6gi1+jPXnXoZE9ow843hw6Yc9ovQYURESv9FJZig+f94DZ/daVKxVlntlBzTGIYtN6yc4tJRiCTy8GwX+7faLJNoy3xy1ITWMGysEwE6I7qjep+nArvqkLA1wz5yE203zmPzJVLw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729184643;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=GjWn8P4/iAki6mlp0w0Xm+yUTIZ9w1BAGBcnDQ6vMwM=;
	b=TkoQ29bQlwlOP19lG7oy5Zjm46vD9LKMur7RO34njb2dqGPpF02cR1T43nSTDWSP
	c3Q+bGHEPk7vTw70gM5qvW6JCt4KYx6X8Pbl2ZpM54BfMqc2M0uOGjbv3JUZF67V2ez
	9mPBEwPVrlWQPZz8o/kGuKb3nFAhrBKtVsp1Fulg=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v6 20/44] x86/boot: convert xsm policy loading to struct boot_module
Date: Thu, 17 Oct 2024 13:03:00 -0400
Message-Id: <20241017170325.3842-21-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241017170325.3842-1-dpsmith@apertussolutions.com>
References: <20241017170325.3842-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Iterate through the unclaimed struct boot_module to see if any are an XSM FLASK
policy. If one is located, mark it as an xsm policy.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
Changes since v5:
- replaced bootstrap_map with bootstrap_map_bm
- make init function definitions consistent in dropping const on *bi
---
 xen/arch/x86/include/asm/bootinfo.h |  1 +
 xen/arch/x86/setup.c                |  2 +-
 xen/include/xsm/xsm.h               | 11 +++++++----
 xen/xsm/xsm_core.c                  | 17 +++++++++++++----
 xen/xsm/xsm_policy.c                | 15 ++++++++-------
 5 files changed, 30 insertions(+), 16 deletions(-)

diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index 19a0ed16ab27..8b63eb27d6dd 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -21,6 +21,7 @@ enum bootmod_type {
     BOOTMOD_KERNEL,
     BOOTMOD_RAMDISK,
     BOOTMOD_MICROCODE,
+    BOOTMOD_XSM_POLICY,
 };
 
 struct boot_module {
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 04de06ba1400..a4ddcb908626 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1863,7 +1863,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
     mmio_ro_ranges = rangeset_new(NULL, "r/o mmio ranges",
                                   RANGESETF_prettyprint_hex);
 
-    xsm_multiboot_init(module_map, mbi);
+    xsm_multiboot_init(module_map, bi);
 
     /*
      * IOMMU-related ACPI table parsing may require some of the system domains
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 627c0d2731af..f155d10e718c 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -17,7 +17,10 @@
 
 #include <xen/alternative-call.h>
 #include <xen/sched.h>
-#include <xen/multiboot.h>
+
+#ifdef CONFIG_MULTIBOOT
+#include <asm/bootinfo.h>
+#endif
 
 /* policy magic number (defined by XSM_MAGIC) */
 typedef uint32_t xsm_magic_t;
@@ -779,9 +782,9 @@ static inline int xsm_argo_send(const struct domain *d, const struct domain *t)
 
 #ifdef CONFIG_MULTIBOOT
 int xsm_multiboot_init(
-    unsigned long *module_map, const multiboot_info_t *mbi);
+    unsigned long *module_map, struct boot_info *bi);
 int xsm_multiboot_policy_init(
-    unsigned long *module_map, const multiboot_info_t *mbi,
+    unsigned long *module_map, struct boot_info *bi,
     void **policy_buffer, size_t *policy_size);
 #endif
 
@@ -829,7 +832,7 @@ static const inline struct xsm_ops *silo_init(void)
 
 #ifdef CONFIG_MULTIBOOT
 static inline int xsm_multiboot_init (
-    unsigned long *module_map, const multiboot_info_t *mbi)
+    unsigned long *module_map, struct boot_info *bi)
 {
     return 0;
 }
diff --git a/xen/xsm/xsm_core.c b/xen/xsm/xsm_core.c
index eaa028109bde..6f034f70428d 100644
--- a/xen/xsm/xsm_core.c
+++ b/xen/xsm/xsm_core.c
@@ -21,6 +21,7 @@
 #ifdef CONFIG_XSM
 
 #ifdef CONFIG_MULTIBOOT
+#include <asm/bootinfo.h>
 #include <asm/setup.h>
 #endif
 
@@ -140,7 +141,7 @@ static int __init xsm_core_init(const void *policy_buffer, size_t policy_size)
 
 #ifdef CONFIG_MULTIBOOT
 int __init xsm_multiboot_init(
-    unsigned long *module_map, const multiboot_info_t *mbi)
+    unsigned long *module_map, struct boot_info *bi)
 {
     int ret = 0;
     void *policy_buffer = NULL;
@@ -150,18 +151,26 @@ int __init xsm_multiboot_init(
 
     if ( XSM_MAGIC )
     {
-        ret = xsm_multiboot_policy_init(module_map, mbi, &policy_buffer,
+        ret = xsm_multiboot_policy_init(module_map, bi, &policy_buffer,
                                         &policy_size);
         if ( ret )
         {
-            bootstrap_map(NULL);
+            bootstrap_map_bm(NULL);
             printk(XENLOG_ERR "Error %d initializing XSM policy\n", ret);
             return -EINVAL;
         }
     }
 
     ret = xsm_core_init(policy_buffer, policy_size);
-    bootstrap_map(NULL);
+    if ( ret == 0 )
+    {
+        int idx = first_boot_module_index(bi, BOOTMOD_XSM_POLICY);
+
+        /* If the policy was loaded from a boot module, mark it consumed */
+        if ( idx >= 0 )
+            bi->mods[idx].flags |= BOOTMOD_FLAG_X86_CONSUMED;
+    }
+    bootstrap_map_bm(NULL);
 
     return 0;
 }
diff --git a/xen/xsm/xsm_policy.c b/xen/xsm/xsm_policy.c
index 8dafbc93810f..921bb254b9d1 100644
--- a/xen/xsm/xsm_policy.c
+++ b/xen/xsm/xsm_policy.c
@@ -21,6 +21,7 @@
 #include <xsm/xsm.h>
 #ifdef CONFIG_MULTIBOOT
 #include <xen/multiboot.h>
+#include <asm/bootinfo.h>
 #include <asm/setup.h>
 #endif
 #include <xen/bitops.h>
@@ -31,11 +32,10 @@
 
 #ifdef CONFIG_MULTIBOOT
 int __init xsm_multiboot_policy_init(
-    unsigned long *module_map, const multiboot_info_t *mbi,
+    unsigned long *module_map, struct boot_info *bi,
     void **policy_buffer, size_t *policy_size)
 {
     int i;
-    module_t *mod = (module_t *)__va(mbi->mods_addr);
     int rc = 0;
     u32 *_policy_start;
     unsigned long _policy_len;
@@ -44,13 +44,13 @@ int __init xsm_multiboot_policy_init(
      * Try all modules and see whichever could be the binary policy.
      * Adjust module_map for the module that is the binary policy.
      */
-    for ( i = mbi->mods_count-1; i >= 1; i-- )
+    for ( i = bi->nr_modules-1; i >= 1; i-- )
     {
-        if ( !test_bit(i, module_map) )
+        if ( bi->mods[i].type != BOOTMOD_UNKNOWN )
             continue;
 
-        _policy_start = bootstrap_map(mod + i);
-        _policy_len   = mod[i].mod_end;
+        _policy_start = bootstrap_map_bm(&bi->mods[i]);
+        _policy_len   = bi->mods[i].size;
 
         if ( (xsm_magic_t)(*_policy_start) == XSM_MAGIC )
         {
@@ -61,11 +61,12 @@ int __init xsm_multiboot_policy_init(
                    _policy_len,_policy_start);
 
             __clear_bit(i, module_map);
+            bi->mods[i].type = BOOTMOD_XSM_POLICY;
             break;
 
         }
 
-        bootstrap_map(NULL);
+        bootstrap_map_bm(NULL);
     }
 
     return rc;
-- 
2.30.2


