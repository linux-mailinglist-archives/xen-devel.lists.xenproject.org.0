Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03874539632
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 20:23:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339944.564879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw6Vu-00021P-Tk; Tue, 31 May 2022 18:22:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339944.564879; Tue, 31 May 2022 18:22:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw6Vu-0001xU-PX; Tue, 31 May 2022 18:22:42 +0000
Received: by outflank-mailman (input) for mailman id 339944;
 Tue, 31 May 2022 18:22:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xfyb=WH=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nw6Vt-0001Bv-CO
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 18:22:41 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6f22442-e10e-11ec-837f-e5687231ffcc;
 Tue, 31 May 2022 20:22:40 +0200 (CEST)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 165402133284993.92840751191375;
 Tue, 31 May 2022 11:22:12 -0700 (PDT)
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
X-Inumbo-ID: a6f22442-e10e-11ec-837f-e5687231ffcc
ARC-Seal: i=1; a=rsa-sha256; t=1654021335; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dZ2eIA7qYawzC7eXfN54pWpsHSrDuTSItfpDqYJH51vXEYT14cPu9aZtLpSv2BRRJ3Rcb4IBjoMy3I8hoDDxeia5TRSBgpngtfYFlcg2qcMyFYBzlcRldApF8hmnBJc49GgQnlkxLIK78ULJJkrH98G6uFF8rOBh+qg+2Nka7/Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1654021335; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=GFL69TM/rWsqG1UsJSNR/jCSJfExay3yhIv9zgA8Pao=; 
	b=bLn4+sSit+K4cdsBFDWYS1YYgpM3CWSfbO0+xxuX1xOZEMTQrBLsTliq/mdI8UJHoPUq3IhhZ2ODLL3ujYS/FqkJA4nG5pdz5LltzxOlHreuZndl3KWc5F21inW7Scs9w0chpRZVlpgRX83jF9sDTUxgQ1s8QwE/E8w8Ym4p+7k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1654021335;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=GFL69TM/rWsqG1UsJSNR/jCSJfExay3yhIv9zgA8Pao=;
	b=MEDSOWUA/M8+0Ai3mt2vDAMtVkNEBTqym6nm4+wd4L2wfmPdMtDt5VE/ZwgZ9wEs
	PZFkUdbCofs7OEHyBcF1+Our8fRvmpI8HyIVCutxYO6BjuEZqY/0VxVMBBD3K63QG+w
	2R9FBNUJR8DeqpzvF2cu3Jzia/E+uqiwbzHeYLd0=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: scott.davis@starlab.io,
	christopher.clark@starlab.io,
	jandryuk@gmail.com,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: [PATCH v4 2/3] xsm: consolidate loading the policy buffer
Date: Tue, 31 May 2022 14:20:40 -0400
Message-Id: <20220531182041.10640-3-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220531182041.10640-1-dpsmith@apertussolutions.com>
References: <20220531182041.10640-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Previously, initializing the policy buffer was split between two functions,
xsm_{multiboot,dt}_policy_init() and xsm_core_init(). The latter for loading
the policy from boot modules and the former for falling back to built-in
policy.

This patch moves all policy buffer initialization logic under the
xsm_{multiboot,dt}_policy_init() functions. It then ensures that an error
message is printed for every error condition that may occur in the functions.
With all policy buffer init contained and only called when the policy buffer
must be populated, the respective xsm_{mb,dt}_init() functions will panic for
all errors except ENOENT. An ENOENT signifies that a policy file could not be
located. Since it is not possible to know if late loading of the policy file is
intended, a warning is reported and XSM initialization is continued.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/include/xsm/xsm.h |  2 +-
 xen/xsm/xsm_core.c    | 51 ++++++++++++++++++++-----------------------
 xen/xsm/xsm_policy.c  | 34 ++++++++++++++++++++++++-----
 3 files changed, 54 insertions(+), 33 deletions(-)

diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 3e2b7fe3db..1676c261c9 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -775,7 +775,7 @@ int xsm_multiboot_init(
     unsigned long *module_map, const multiboot_info_t *mbi);
 int xsm_multiboot_policy_init(
     unsigned long *module_map, const multiboot_info_t *mbi,
-    void **policy_buffer, size_t *policy_size);
+    const unsigned char *policy_buffer[], size_t *policy_size);
 #endif
 
 #ifdef CONFIG_HAS_DEVICE_TREE
diff --git a/xen/xsm/xsm_core.c b/xen/xsm/xsm_core.c
index 675e4f552c..a3715fa239 100644
--- a/xen/xsm/xsm_core.c
+++ b/xen/xsm/xsm_core.c
@@ -92,14 +92,6 @@ static int __init xsm_core_init(const void *policy_buffer, size_t policy_size)
 {
     const struct xsm_ops *ops = NULL;
 
-#ifdef CONFIG_XSM_FLASK_POLICY
-    if ( policy_size == 0 )
-    {
-        policy_buffer = xsm_flask_init_policy;
-        policy_size = xsm_flask_init_policy_size;
-    }
-#endif
-
     if ( xsm_ops_registered != XSM_OPS_UNREGISTERED )
     {
         printk(XENLOG_ERR
@@ -154,28 +146,29 @@ static int __init xsm_core_init(const void *policy_buffer, size_t policy_size)
 int __init xsm_multiboot_init(
     unsigned long *module_map, const multiboot_info_t *mbi)
 {
-    int ret = 0;
-    void *policy_buffer = NULL;
+    const unsigned char *policy_buffer;
     size_t policy_size = 0;
 
     printk("XSM Framework v" XSM_FRAMEWORK_VERSION " initialized\n");
 
     if ( policy_file_required )
     {
-        ret = xsm_multiboot_policy_init(module_map, mbi, &policy_buffer,
+        int ret = xsm_multiboot_policy_init(module_map, mbi, &policy_buffer,
                                         &policy_size);
-        if ( ret )
-        {
-            bootstrap_map(NULL);
-            printk(XENLOG_ERR "Error %d initializing XSM policy\n", ret);
-            return -EINVAL;
-        }
+        bootstrap_map(NULL);
+
+        if ( ret == -ENOENT )
+            /*
+             * The XSM module needs a policy file but one was not located.
+             * Report as a warning and continue as the XSM module may late
+             * load a policy file.
+             */
+            printk(XENLOG_WARNING "xsm: starting without a policy loaded!\n");
+        else
+            panic("Error %d initializing XSM policy\n", ret);
     }
 
-    ret = xsm_core_init(policy_buffer, policy_size);
-    bootstrap_map(NULL);
-
-    return 0;
+    return xsm_core_init(policy_buffer, policy_size);
 }
 #endif
 
@@ -183,7 +176,7 @@ int __init xsm_multiboot_init(
 int __init xsm_dt_init(void)
 {
     int ret = 0;
-    void *policy_buffer = NULL;
+    const unsigned char *policy_buffer;
     size_t policy_size = 0;
 
     printk("XSM Framework v" XSM_FRAMEWORK_VERSION " initialized\n");
@@ -191,11 +184,15 @@ int __init xsm_dt_init(void)
     if ( policy_file_required )
     {
         ret = xsm_dt_policy_init(&policy_buffer, &policy_size);
-        if ( ret )
-        {
-            printk(XENLOG_ERR "Error %d initializing XSM policy\n", ret);
-            return -EINVAL;
-        }
+        if ( ret == -ENOENT )
+            /*
+             * The XSM module needs a policy file but one was not located.
+             * Report as a warning and continue as the XSM module may late
+             * load a policy file.
+             */
+            printk(XENLOG_WARNING "xsm: starting without a policy loaded!\n");
+        else
+            panic("Error %d initializing XSM policy\n", ret);
     }
 
     ret = xsm_core_init(policy_buffer, policy_size);
diff --git a/xen/xsm/xsm_policy.c b/xen/xsm/xsm_policy.c
index 8dafbc9381..690fd23e9f 100644
--- a/xen/xsm/xsm_policy.c
+++ b/xen/xsm/xsm_policy.c
@@ -8,7 +8,7 @@
  *  Contributors:
  *  Michael LeMay, <mdlemay@epoch.ncsc.mil>
  *  George Coker, <gscoker@alpha.ncsc.mil>
- *  
+ *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License version 2,
  *  as published by the Free Software Foundation.
@@ -32,14 +32,21 @@
 #ifdef CONFIG_MULTIBOOT
 int __init xsm_multiboot_policy_init(
     unsigned long *module_map, const multiboot_info_t *mbi,
-    void **policy_buffer, size_t *policy_size)
+    const unsigned char **policy_buffer, size_t *policy_size)
 {
     int i;
     module_t *mod = (module_t *)__va(mbi->mods_addr);
-    int rc = 0;
+    int rc = -ENOENT;
     u32 *_policy_start;
     unsigned long _policy_len;
 
+#ifdef CONFIG_XSM_FLASK_POLICY
+    /* Initially set to builtin policy, overriden if boot module is found. */
+    *policy_buffer = xsm_flask_init_policy;
+    *policy_size = xsm_flask_init_policy_size;
+    rc = 0;
+#endif
+
     /*
      * Try all modules and see whichever could be the binary policy.
      * Adjust module_map for the module that is the binary policy.
@@ -54,13 +61,14 @@ int __init xsm_multiboot_policy_init(
 
         if ( (xsm_magic_t)(*_policy_start) == XSM_MAGIC )
         {
-            *policy_buffer = _policy_start;
+            *policy_buffer = (unsigned char *)_policy_start;
             *policy_size = _policy_len;
 
             printk("Policy len %#lx, start at %p.\n",
                    _policy_len,_policy_start);
 
             __clear_bit(i, module_map);
+            rc = 0;
             break;
 
         }
@@ -68,18 +76,31 @@ int __init xsm_multiboot_policy_init(
         bootstrap_map(NULL);
     }
 
+    if ( rc == -ENOENT )
+        printk(XENLOG_ERR "xsm: Unable to locate policy file\n");
+
     return rc;
 }
 #endif
 
 #ifdef CONFIG_HAS_DEVICE_TREE
-int __init xsm_dt_policy_init(void **policy_buffer, size_t *policy_size)
+int __init xsm_dt_policy_init(
+    const unsigned char **policy_buffer, size_t *policy_size)
 {
     struct bootmodule *mod = boot_module_find_by_kind(BOOTMOD_XSM);
     paddr_t paddr, len;
 
     if ( !mod || !mod->size )
+    {
+#ifdef CONFIG_XSM_FLASK_POLICY
+        *policy_buffer = xsm_flask_init_policy;
+        *policy_size = xsm_flask_init_policy_size;
         return 0;
+#else
+        printk(XENLOG_ERR "xsm: Unable to locate policy file\n");
+        return -ENOENT;
+#endif
+    }
 
     paddr = mod->start;
     len = mod->size;
@@ -95,7 +116,10 @@ int __init xsm_dt_policy_init(void **policy_buffer, size_t *policy_size)
 
     *policy_buffer = xmalloc_bytes(len);
     if ( !*policy_buffer )
+    {
+        printk(XENLOG_ERR "xsm: Unable to allocate memory for XSM policy\n");
         return -ENOMEM;
+    }
 
     copy_from_paddr(*policy_buffer, paddr, len);
     *policy_size = len;
-- 
2.20.1


