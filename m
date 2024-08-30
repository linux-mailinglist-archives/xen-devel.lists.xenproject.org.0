Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A09AD966B87
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 23:50:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786690.1196358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9Va-00025o-Je; Fri, 30 Aug 2024 21:50:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786690.1196358; Fri, 30 Aug 2024 21:50:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9Va-00022U-Fn; Fri, 30 Aug 2024 21:50:18 +0000
Received: by outflank-mailman (input) for mailman id 786690;
 Fri, 30 Aug 2024 21:50:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiG6=P5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sk9VZ-0000Zf-3p
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 21:50:17 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d62f24fe-6719-11ef-99a1-01e77a169b0f;
 Fri, 30 Aug 2024 23:50:15 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: by mx.zohomail.com with SMTPS id 1725054481581187.92876924816562;
 Fri, 30 Aug 2024 14:48:01 -0700 (PDT)
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
X-Inumbo-ID: d62f24fe-6719-11ef-99a1-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1725054483; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MImAxhfwNPeS3w8pWcKg4XRtc6oggkouWyA+B/FXA+UfZHI5QNwG88fQIgbAVE4DgNVLQGltY3LuT4QqILVlht22rkpTdj6mMO4jhPzdVSaXjs+qKhsuGVhW+KC5tqCbwR0+gzwwb21AqlKClpkSY/4easU3xmNdiN0oIOrSPXA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1725054483; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=HBuvBxLu0927SlqbG8RcjS/3s6UZxSTS/pkLGNBX224=; 
	b=Q7BjRw5S14bOAYEyGSFlzxeebkGQJecgUnPtlDQuIOluyU6LMt+UJM51CsScplaQZLcxl17Ya3N+qBBe9VFmzZoB4mgCQ/maSLrSZ9ywYYPpFBY2nf8jbmA3yJeNRqxEQOOHKUrzkTpxzkZU0g33j2lnPHAFsBuR47VUxHtR0NM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725054483;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=HBuvBxLu0927SlqbG8RcjS/3s6UZxSTS/pkLGNBX224=;
	b=aVD2dDfuU1kn0SnndaUHLfFEXQNIof6L+lN7Z97oJQI1DViGz+HiERFQ3I5JoPXv
	JYUUKI0v6VU1/YITg0yn/n5Fqlo+BqGOK4ooymMWQoY5vsk/uLeXavzfzuIJydYk7U9
	XzTy9BZo+dlFeId/fJGhZH89euiM0sZyJTzasB8g=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 20/44] x86/boot: convert xsm policy loading to struct boot_module
Date: Fri, 30 Aug 2024 17:47:05 -0400
Message-Id: <20240830214730.1621-21-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240830214730.1621-1-dpsmith@apertussolutions.com>
References: <20240830214730.1621-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Iterate through the unclaimed struct boot_module to see if any are an XSM FLASK
policy. If one is located, mark it as an xsm policy.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/include/asm/bootinfo.h |  1 +
 xen/arch/x86/setup.c                |  2 +-
 xen/include/xsm/xsm.h               | 11 +++++++----
 xen/xsm/xsm_core.c                  | 13 +++++++++++--
 xen/xsm/xsm_policy.c                | 15 ++++++++-------
 5 files changed, 28 insertions(+), 14 deletions(-)

diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index 1cef48457c66..1a325f66b3ba 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -18,6 +18,7 @@ enum bootmod_type {
     BOOTMOD_KERNEL,
     BOOTMOD_RAMDISK,
     BOOTMOD_MICROCODE,
+    BOOTMOD_XSM_POLICY,
 };
 
 struct boot_module {
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 6495ab393576..28b39d23f644 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1878,7 +1878,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
     mmio_ro_ranges = rangeset_new(NULL, "r/o mmio ranges",
                                   RANGESETF_prettyprint_hex);
 
-    xsm_multiboot_init(module_map, mbi);
+    xsm_multiboot_init(module_map, boot_info);
 
     /*
      * IOMMU-related ACPI table parsing may require some of the system domains
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 627c0d2731af..9e511ef8878c 100644
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
+    unsigned long *module_map, const struct boot_info *bi);
 int xsm_multiboot_policy_init(
-    unsigned long *module_map, const multiboot_info_t *mbi,
+    unsigned long *module_map, const struct boot_info *bi,
     void **policy_buffer, size_t *policy_size);
 #endif
 
@@ -829,7 +832,7 @@ static const inline struct xsm_ops *silo_init(void)
 
 #ifdef CONFIG_MULTIBOOT
 static inline int xsm_multiboot_init (
-    unsigned long *module_map, const multiboot_info_t *mbi)
+    unsigned long *module_map, const struct boot_info *bi)
 {
     return 0;
 }
diff --git a/xen/xsm/xsm_core.c b/xen/xsm/xsm_core.c
index eaa028109bde..9f87ec4f6754 100644
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
+    unsigned long *module_map, const struct boot_info *bi)
 {
     int ret = 0;
     void *policy_buffer = NULL;
@@ -150,7 +151,7 @@ int __init xsm_multiboot_init(
 
     if ( XSM_MAGIC )
     {
-        ret = xsm_multiboot_policy_init(module_map, mbi, &policy_buffer,
+        ret = xsm_multiboot_policy_init(module_map, bi, &policy_buffer,
                                         &policy_size);
         if ( ret )
         {
@@ -161,6 +162,14 @@ int __init xsm_multiboot_init(
     }
 
     ret = xsm_core_init(policy_buffer, policy_size);
+    if ( ret == 0 )
+    {
+        int idx = first_boot_module_index(bi, BOOTMOD_XSM_POLICY);
+
+        /* If the policy was loaded from a boot module, mark it consumed */
+        if ( idx >= 0 )
+            bi->mods[idx].flags |= BOOTMOD_FLAG_X86_CONSUMED;
+    }
     bootstrap_map(NULL);
 
     return 0;
diff --git a/xen/xsm/xsm_policy.c b/xen/xsm/xsm_policy.c
index 8dafbc93810f..e4c94afd108d 100644
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
+    unsigned long *module_map, const struct boot_info *bi,
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
+    for ( i = bi->nr_mods-1; i >= 1; i-- )
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


