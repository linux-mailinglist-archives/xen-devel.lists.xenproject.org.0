Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 571AE9A5840
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 02:48:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.822902.1236825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2gam-0001ke-Ci; Mon, 21 Oct 2024 00:48:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 822902.1236825; Mon, 21 Oct 2024 00:48:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2gam-0001i9-9G; Mon, 21 Oct 2024 00:48:16 +0000
Received: by outflank-mailman (input) for mailman id 822902;
 Mon, 21 Oct 2024 00:48:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q0x4=RR=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t2gal-0001i1-5z
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 00:48:15 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 265c702e-8f46-11ef-a0be-8be0dac302b0;
 Mon, 21 Oct 2024 02:48:14 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729471600038731.5465299032828;
 Sun, 20 Oct 2024 17:46:40 -0700 (PDT)
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
X-Inumbo-ID: 265c702e-8f46-11ef-a0be-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1729471602; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=R5C/6c72qx+Pv8oreNCXC4DXvp/5JJnmlv/xclSb5BsT0ZdTpN3y4h2M4kFMirySA5JTOFHKNFUEiqU4feYkIjr6+Jv3yU731SSWY6rZRItFchQFW7nv1XxJzyx04RhbxJM6LM70y8a2KbRz6lJWsTBXm1/T6aQXEK0jNGFOGB0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729471602; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=rCqjXfRhQzYVNQ0/zCmbI25PcWcrpjQT5dqAU64Gu4k=; 
	b=lPzVPPQ3chk7ME56/x00Apav5fW5vjhbd9aysGtiPFmTQQQgCmw4zRHqbh3/aK3TFRSt8oDJaAI2WleAUMcdEpsLrAPljTUkARA9g8vQJ2jIK4384oOfiZarTWy9X2O+D1sGY0CJ3BO+FD98oUj7QobgJ6LPfFhp0/+t87tVwCU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729471602;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=rCqjXfRhQzYVNQ0/zCmbI25PcWcrpjQT5dqAU64Gu4k=;
	b=bf4RE0epFdDbi2YeS7igOMlUsKCKEolaFHUl/BiUULa0RFPS60biKwgRqtVSnA5H
	YYniQlmasSFzxiSb40XP/+DNeUn1nK/feS03dbKzNI+6lMbefbF+oWG/37nvQBrukCw
	td96MHar5aOqNCcxHU5R3FRLQd9A4tdidC5JQiP8=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v7 14/38] x86/boot: convert xsm policy loading to struct boot_module
Date: Sun, 20 Oct 2024 20:45:49 -0400
Message-Id: <20241021004613.18793-15-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241021004613.18793-1-dpsmith@apertussolutions.com>
References: <20241021004613.18793-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Iterate through the unclaimed boot modules to see if any are an XSM FLASK
policy. If one is located, mark it as an xsm policy.

To assist with looking up the index of the xsm policy in the boot module array,
an iterator is provided.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
Changes since v6:
- converted boot module walk over to for each helper
- slight reword of commit message
- merged the interator patch with its first usage by XSM
- corrected the short-circuit return value for Xen in the interator
- dropped R-b due to merging with patch not approved.

Changes since v5:
- replaced bootstrap_map with bootstrap_map_bm
- make init function definitions consistent in dropping const on *bi
---
 xen/arch/x86/include/asm/bootinfo.h | 30 ++++++++++++++++++++++++++++-
 xen/arch/x86/setup.c                |  2 +-
 xen/include/xsm/xsm.h               | 11 +++++++----
 xen/xsm/xsm_core.c                  | 17 ++++++++++++----
 xen/xsm/xsm_policy.c                | 20 +++++++++----------
 5 files changed, 59 insertions(+), 21 deletions(-)

diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index e470df48700d..3ca56454c4d7 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -21,6 +21,7 @@ enum bootmod_type {
     BOOTMOD_KERNEL,
     BOOTMOD_RAMDISK,
     BOOTMOD_MICROCODE,
+    BOOTMOD_XSM_POLICY,
 };
 
 struct boot_module {
@@ -94,8 +95,35 @@ static inline struct boot_module *__init next_boot_module_by_type(
 #define boot_module_index(bi, bm)                   \
     (unsigned int)(bm - &bi->mods[0])
 
-#endif /* X86_BOOTINFO_H */
+/*
+ * next_boot_module_index:
+ *     Finds the next boot module of type t, starting at array index start.
+ *
+ * Returns:
+ *      Success - index in boot_module array
+ *      Failure - a value greater than MAX_NR_BOOTMODS
+ */
+static inline unsigned int __init next_boot_module_index(
+    const struct boot_info *bi, enum bootmod_type t, unsigned int start)
+{
+    unsigned int i;
+
+    if ( t == BOOTMOD_XEN )
+        return bi->nr_modules;
+
+    for ( i = start; i < bi->nr_modules; i++ )
+    {
+        if ( bi->mods[i].type == t )
+            return i;
+    }
+
+    return MAX_NR_BOOTMODS + 1;
+}
+
+#define first_boot_module_index(bi, t)              \
+    next_boot_module_index(bi, t, 0)
 
+#endif /* X86_BOOTINFO_H */
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 272d5a725c54..ed1d89ad4bb4 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1882,7 +1882,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
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
index eaa028109bde..234b39de7a1d 100644
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
+            bi->mods[idx].consumed = true;
+    }
+    bootstrap_map_bm(NULL);
 
     return 0;
 }
diff --git a/xen/xsm/xsm_policy.c b/xen/xsm/xsm_policy.c
index 8dafbc93810f..9fb8563eb571 100644
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
@@ -31,26 +32,22 @@
 
 #ifdef CONFIG_MULTIBOOT
 int __init xsm_multiboot_policy_init(
-    unsigned long *module_map, const multiboot_info_t *mbi,
+    unsigned long *module_map, struct boot_info *bi,
     void **policy_buffer, size_t *policy_size)
 {
-    int i;
-    module_t *mod = (module_t *)__va(mbi->mods_addr);
     int rc = 0;
     u32 *_policy_start;
     unsigned long _policy_len;
+    struct boot_module *bm;
 
     /*
      * Try all modules and see whichever could be the binary policy.
      * Adjust module_map for the module that is the binary policy.
      */
-    for ( i = mbi->mods_count-1; i >= 1; i-- )
+    for_each_boot_module(bi, bm, BOOTMOD_UNKNOWN)
     {
-        if ( !test_bit(i, module_map) )
-            continue;
-
-        _policy_start = bootstrap_map(mod + i);
-        _policy_len   = mod[i].mod_end;
+        _policy_start = bootstrap_map_bm(bm);
+        _policy_len   = bm->size;
 
         if ( (xsm_magic_t)(*_policy_start) == XSM_MAGIC )
         {
@@ -60,12 +57,13 @@ int __init xsm_multiboot_policy_init(
             printk("Policy len %#lx, start at %p.\n",
                    _policy_len,_policy_start);
 
-            __clear_bit(i, module_map);
+            __clear_bit(boot_module_index(bi, bm), module_map);
+            bm->type = BOOTMOD_XSM_POLICY;
             break;
 
         }
 
-        bootstrap_map(NULL);
+        bootstrap_map_bm(NULL);
     }
 
     return rc;
-- 
2.30.2


