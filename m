Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 844117447A5
	for <lists+xen-devel@lfdr.de>; Sat,  1 Jul 2023 09:19:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557775.871438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFUsm-0007YK-Lr; Sat, 01 Jul 2023 07:19:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557775.871438; Sat, 01 Jul 2023 07:19:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFUsm-0007Tv-F7; Sat, 01 Jul 2023 07:19:00 +0000
Received: by outflank-mailman (input) for mailman id 557775;
 Sat, 01 Jul 2023 07:18:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ypVN=CT=gmail.com=christopher.w.clark.io@srs-se1.protection.inumbo.net>)
 id 1qFUsk-00074A-4S
 for xen-devel@lists.xenproject.org; Sat, 01 Jul 2023 07:18:58 +0000
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [2607:f8b0:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a442a66-17df-11ee-b237-6b7b168915f2;
 Sat, 01 Jul 2023 09:18:56 +0200 (CEST)
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-666e97fcc60so1887762b3a.3
 for <xen-devel@lists.xenproject.org>; Sat, 01 Jul 2023 00:18:56 -0700 (PDT)
Received: from cog-dev.home ([70.103.208.83]) by smtp.gmail.com with ESMTPSA id
 s19-20020aa78d53000000b00673e652985bsm4108866pfe.118.2023.07.01.00.18.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Jul 2023 00:18:53 -0700 (PDT)
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
X-Inumbo-ID: 8a442a66-17df-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688195934; x=1690787934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2CCuYNE2IdEGJiRf9KcQxz9oSopCuIZzH05nVBt98V4=;
        b=L/C1FJaAKKXcrKwwbXfoXKbQbJyRAJdJNLqD8rSSdTsYDwF3QnFSP2qbAA042bSu5Z
         OFZIrW0J+Zhh+BmakoPWDH4ZzFTQsvVUEeVlHYaCl918lGW6Wh1jbVC1a924pKTMIMLT
         ixYBYRX9jRyGqkbarfkYRUMvVl5fs3x8ji0pYYcTxKG4Let565+Wt7m4ReGqVoGYWV/Q
         eZAegTnZa6qvgzw7JfcDFp7OBQWvL2j5oe7Y+LfTbHhysp/YtRNS3at1rUL4Y9/Ctk9C
         0nM3B33hMsgll472cqdFo+kHWDEq4HWIonXRH9BcfTq55X2I9HyYK3UkD8bHLjcEwR6W
         CSSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688195934; x=1690787934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2CCuYNE2IdEGJiRf9KcQxz9oSopCuIZzH05nVBt98V4=;
        b=BLwRZZzEoDJzHnnwu9u+6xKgS38426q7sDor8LUo5G9n1xX+eM9GItEq65nOWeUyZ9
         DnWseHP9hzHpvh7FuwDsMogLViTUOEo5qGByRb6dSMrFMZkC9w93CSbdksJDCh1gSwYO
         QLTiXu8vVjsIgHAgDN4PJFCkC5YHDZmMXT/Cmu4LOISBJ5cp0Zo456YUM9LNnCUBWJfT
         GtvSqeAHVPTdzcH+XyaSR7mDpMT7/+k/nEsw2HsczTs5qNWPJJ98BWM+J8AXDZRuIHzV
         UpNTah1Qq6i+qRSYwepddB277+r+5vaWBy+FSDbhlkp3wbar3bkciF99bo+nfk7CLpZw
         j24g==
X-Gm-Message-State: ABy/qLZ9tzvuTjkna5RzisUUdxkxoNud6/YggGePXYZ+Dz2xXuWoOVWN
	OYoRrxonIbDhan10ZXkD8WW8fWvo7zE=
X-Google-Smtp-Source: APBJJlFwakyPH8XJc7p5VcZt6PmkVcFDYaVMV4ECD1CzygH3D1pud2JwVpwTI/RepQYB4r6d0mLbRQ==
X-Received: by 2002:a05:6a00:1792:b0:64d:1c59:6767 with SMTP id s18-20020a056a00179200b0064d1c596767mr4767504pfg.24.1688195934527;
        Sat, 01 Jul 2023 00:18:54 -0700 (PDT)
Sender: Christopher Clark <christopher.w.clark.io@gmail.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Daniel Smith <dpsmith@apertussolutions.com>,
	stefano.stabellini@amd.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Luca Fancellu <luca.fancellu@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Rich Persaud <persaur@gmail.com>
Subject: [PATCH 05/10] xsm: switch XSM init to boot info structures
Date: Sat,  1 Jul 2023 00:18:30 -0700
Message-Id: <20230701071835.41599-6-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230701071835.41599-1-christopher.w.clark@gmail.com>
References: <20230701071835.41599-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change the XSM implementation to use the boot info structure instead of
the multiboot module_map.

Drops a dependency on CONFIG_MULTIBOOT, so boot module logic is now
used whenever the DEVICE_TREE specific logic (for Arm) is not, with the
bootinfo header conditionally included to ensure no change on Arm.

Adds a multiboot header inclusion into guest/xen/pvh-boot.c
since it is no longer provided via transitive inclusion and the source
in that file uses multiboot structures.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

---
Changes since v1: patch is a subset of v1 series patches 2 and 3.
- Added the <xen/multiboot.h> inclusion to pvh-boot.c
- Use conditional inclusion for <xen/bootinfo.h>

 xen/arch/x86/guest/xen/pvh-boot.c |  1 +
 xen/arch/x86/setup.c              |  2 +-
 xen/include/xsm/xsm.h             | 28 +++++++--------
 xen/xsm/xsm_core.c                | 47 +++++++++++++++---------
 xen/xsm/xsm_policy.c              | 59 ++++++++++++++++---------------
 5 files changed, 77 insertions(+), 60 deletions(-)

diff --git a/xen/arch/x86/guest/xen/pvh-boot.c b/xen/arch/x86/guest/xen/pvh-boot.c
index 9cbe87b61b..1ed04d035c 100644
--- a/xen/arch/x86/guest/xen/pvh-boot.c
+++ b/xen/arch/x86/guest/xen/pvh-boot.c
@@ -9,6 +9,7 @@
 #include <xen/init.h>
 #include <xen/lib.h>
 #include <xen/mm.h>
+#include <xen/multiboot.h>
 
 #include <asm/e820.h>
 #include <asm/guest.h>
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index f9b04daebd..a616ccc0a8 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1835,7 +1835,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
     mmio_ro_ranges = rangeset_new(NULL, "r/o mmio ranges",
                                   RANGESETF_prettyprint_hex);
 
-    xsm_multiboot_init(module_map, mbi);
+    xsm_bootmodule_init(boot_info);
 
     /*
      * IOMMU-related ACPI table parsing may require some of the system domains
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 8dad03fd3d..d409c30be6 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -16,8 +16,10 @@
 #define __XSM_H__
 
 #include <xen/alternative-call.h>
+#ifndef CONFIG_HAS_DEVICE_TREE
+# include <xen/bootinfo.h>
+#endif
 #include <xen/sched.h>
-#include <xen/multiboot.h>
 
 /* policy magic number (defined by XSM_MAGIC) */
 typedef uint32_t xsm_magic_t;
@@ -776,15 +778,14 @@ static inline int xsm_argo_send(const struct domain *d, const struct domain *t)
 
 #endif /* XSM_NO_WRAPPERS */
 
-#ifdef CONFIG_MULTIBOOT
-int xsm_multiboot_init(
-    unsigned long *module_map, const multiboot_info_t *mbi);
-int xsm_multiboot_policy_init(
-    unsigned long *module_map, const multiboot_info_t *mbi,
-    void **policy_buffer, size_t *policy_size);
-#endif
+#ifndef CONFIG_HAS_DEVICE_TREE
+int xsm_bootmodule_init(const struct boot_info *info);
+int xsm_bootmodule_policy_init(
+    const struct boot_info *info, const unsigned char **policy_buffer,
+    size_t *policy_size);
+
+#else
 
-#ifdef CONFIG_HAS_DEVICE_TREE
 /*
  * Initialize XSM
  *
@@ -826,15 +827,14 @@ static const inline struct xsm_ops *silo_init(void)
 
 #include <xsm/dummy.h>
 
-#ifdef CONFIG_MULTIBOOT
-static inline int xsm_multiboot_init (
-    unsigned long *module_map, const multiboot_info_t *mbi)
+#ifndef CONFIG_HAS_DEVICE_TREE
+static inline int xsm_bootmodule_init(const struct boot_info *info)
 {
     return 0;
 }
-#endif
 
-#ifdef CONFIG_HAS_DEVICE_TREE
+#else
+
 static inline int xsm_dt_init(void)
 {
     return 0;
diff --git a/xen/xsm/xsm_core.c b/xen/xsm/xsm_core.c
index eaa028109b..301ae4dc8b 100644
--- a/xen/xsm/xsm_core.c
+++ b/xen/xsm/xsm_core.c
@@ -10,8 +10,12 @@
  *  as published by the Free Software Foundation.
  */
 
-#include <xen/init.h>
+#ifndef CONFIG_HAS_DEVICE_TREE
+# include <xen/bootinfo.h>
+#endif
 #include <xen/errno.h>
+#include <xen/hypercall.h>
+#include <xen/init.h>
 #include <xen/lib.h>
 #include <xen/param.h>
 
@@ -138,26 +142,35 @@ static int __init xsm_core_init(const void *policy_buffer, size_t policy_size)
     return 0;
 }
 
-#ifdef CONFIG_MULTIBOOT
-int __init xsm_multiboot_init(
-    unsigned long *module_map, const multiboot_info_t *mbi)
+/*
+ * ifdef'ing this against multiboot is no longer valid as the boot module
+ * is agnostic and it will be possible to dropped the ifndef should Arm
+ * adopt boot info
+ */
+#ifndef CONFIG_HAS_DEVICE_TREE
+int __init xsm_bootmodule_init(const struct boot_info *bootinfo)
 {
     int ret = 0;
-    void *policy_buffer = NULL;
+    const unsigned char *policy_buffer = NULL;
     size_t policy_size = 0;
 
     printk("XSM Framework v" XSM_FRAMEWORK_VERSION " initialized\n");
 
     if ( XSM_MAGIC )
     {
-        ret = xsm_multiboot_policy_init(module_map, mbi, &policy_buffer,
-                                        &policy_size);
-        if ( ret )
-        {
-            bootstrap_map(NULL);
-            printk(XENLOG_ERR "Error %d initializing XSM policy\n", ret);
-            return -EINVAL;
-        }
+        int ret = xsm_bootmodule_policy_init(bootinfo, &policy_buffer,
+                                             &policy_size);
+        bootstrap_map(NULL);
+
+        if ( ret == -ENOENT )
+            /*
+             * The XSM module needs a policy file but one was not located.
+             * Report as a warning and continue as the XSM module may late
+             * load a policy file.
+             */
+            printk(XENLOG_WARNING "xsm: starting without a policy loaded!\n");
+        else if ( ret )
+            panic("Error %d initializing XSM policy\n", ret);
     }
 
     ret = xsm_core_init(policy_buffer, policy_size);
@@ -165,9 +178,9 @@ int __init xsm_multiboot_init(
 
     return 0;
 }
-#endif
 
-#ifdef CONFIG_HAS_DEVICE_TREE
+#else
+
 int __init xsm_dt_init(void)
 {
     int ret = 0;
@@ -215,9 +228,9 @@ bool __init has_xsm_magic(paddr_t start)
 
     return false;
 }
-#endif
+#endif /* CONFIG_HAS_DEVICE_TREE */
 
-#endif
+#endif /* CONFIG_XSM */
 
 long do_xsm_op(XEN_GUEST_HANDLE_PARAM(void) op)
 {
diff --git a/xen/xsm/xsm_policy.c b/xen/xsm/xsm_policy.c
index c6df8c6e06..f1970c8964 100644
--- a/xen/xsm/xsm_policy.c
+++ b/xen/xsm/xsm_policy.c
@@ -18,62 +18,65 @@
  *
  */
 
-#include <xsm/xsm.h>
-#ifdef CONFIG_MULTIBOOT
-#include <asm/boot.h>
-#include <xen/multiboot.h>
-#include <asm/setup.h>
-#endif
 #include <xen/bitops.h>
+#ifndef CONFIG_HAS_DEVICE_TREE
+# include <xen/bootinfo.h>
+#endif
+#include <xsm/xsm.h>
 #ifdef CONFIG_HAS_DEVICE_TREE
-# include <asm/setup.h>
 # include <xen/device_tree.h>
+#else
+#include <asm/boot.h>
 #endif
 
-#ifdef CONFIG_MULTIBOOT
-int __init xsm_multiboot_policy_init(
-    unsigned long *module_map, const multiboot_info_t *mbi,
-    void **policy_buffer, size_t *policy_size)
+#include <asm/setup.h>
+
+#ifndef CONFIG_HAS_DEVICE_TREE
+int __init xsm_bootmodule_policy_init(
+    const struct boot_info *bootinfo, const unsigned char **policy_buffer,
+    size_t *policy_size)
 {
-    int i;
-    module_t *mod = (module_t *)__va(mbi->mods_addr);
-    int rc = 0;
+    unsigned long i;
+    int rc = -ENOENT;
     u32 *_policy_start;
     unsigned long _policy_len;
 
-    /*
-     * Try all modules and see whichever could be the binary policy.
-     * Adjust module_map for the module that is the binary policy.
-     */
-    for ( i = mbi->mods_count-1; i >= 1; i-- )
-    {
-        if ( !test_bit(i, module_map) )
-            continue;
+#ifdef CONFIG_XSM_FLASK_POLICY
+    /* Initially set to builtin policy, overriden if boot module is found. */
+    *policy_buffer = xsm_flask_init_policy;
+    *policy_size = xsm_flask_init_policy_size;
+    rc = 0;
+#endif
 
-        _policy_start = bootstrap_map_multiboot(mod + i);
-        _policy_len   = mod[i].mod_end;
+    i = bootmodule_index(bootinfo, BOOTMOD_UNKNOWN, 0);
+    while ( i < bootinfo->nr_mods )
+    {
+        _policy_start = bootstrap_map(&bootinfo->mods[i]);
+        _policy_len   = bootinfo->mods[i].size;
 
         if ( (xsm_magic_t)(*_policy_start) == XSM_MAGIC )
         {
-            *policy_buffer = _policy_start;
+            *policy_buffer = (unsigned char *)_policy_start;
             *policy_size = _policy_len;
 
             printk("Policy len %#lx, start at %p.\n",
                    _policy_len,_policy_start);
 
-            __clear_bit(i, module_map);
+            bootinfo->mods[i].bootmod_type = BOOTMOD_XSM;
+            rc = 0;
             break;
 
         }
 
         bootstrap_map(NULL);
+        i = bootmodule_index(bootinfo, BOOTMOD_UNKNOWN, ++i);
     }
 
     return rc;
 }
-#endif
 
-#ifdef CONFIG_HAS_DEVICE_TREE
+#else
+
 int __init xsm_dt_policy_init(void **policy_buffer, size_t *policy_size)
 {
     struct bootmodule *mod = boot_module_find_by_kind(BOOTMOD_XSM);
-- 
2.25.1


