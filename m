Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8A7538902
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 00:41:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.338872.563719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvo4S-0008Jy-Nc; Mon, 30 May 2022 22:41:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 338872.563719; Mon, 30 May 2022 22:41:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvo4S-0008Hh-I6; Mon, 30 May 2022 22:41:08 +0000
Received: by outflank-mailman (input) for mailman id 338872;
 Mon, 30 May 2022 22:41:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=epuh=WG=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nvo4R-000799-Jk
 for xen-devel@lists.xenproject.org; Mon, 30 May 2022 22:41:07 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 96a334e7-e069-11ec-837f-e5687231ffcc;
 Tue, 31 May 2022 00:41:05 +0200 (CEST)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1653950422129887.0158623525535;
 Mon, 30 May 2022 15:40:22 -0700 (PDT)
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
X-Inumbo-ID: 96a334e7-e069-11ec-837f-e5687231ffcc
ARC-Seal: i=1; a=rsa-sha256; t=1653950424; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mbmVHmKKxaCOIAv8wvakvVru164Uh3L/bS0tJI2/mGHlQb3VMW2HlZ536yC2dVMIuXSTjpaxJqcfoMtBtXbL/kayV4zZMB5mHt07Pvo8OLBS7xG2TwTi+K2KqAUVqcUbXfNNt6o6OHDORmgAfDnxyRosSFQNSbNcXC+eFooqNuQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1653950424; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=527tT9WU0HgntC22WaUmTxYXfawaS2vBXUjSXSJ4Fmo=; 
	b=B5qP2MX2+v3cK1Ur12RXPLY4Wg4T4GhcTVEB2HsIsg/HQIZlp3RHFQ5IJCbEHFOkQq3i1yViWrrZPmQ9zq1B4uEU+AlANFwsjXuy+XI+Ug/6GYEiEhlRbm/BmZGcOpzdGxzvQgZPBtyyz5eZ9KLPoHWfslpXlo6bM94wZuiJyE0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1653950424;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=527tT9WU0HgntC22WaUmTxYXfawaS2vBXUjSXSJ4Fmo=;
	b=pfnpokIbgJE+lrYnquFN1jbTz8b4QZYQar4suUwlwJ4BIiSWxBM2eJ/90KNobZjL
	2Aw4Y1Sy/0R4rTFWtk8wy2C/0JL3NjF7eseY8J+NepStbb7UrERop93HnWhjRuhknat
	3opZAsh2XkNmj4FRJlLG0ZlJsXyEUb4XepnWYP1A=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: scott.davis@starlab.io,
	christopher.clark@starlab.io,
	jandryuk@gmail.com,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: [v2 2/3] xsm: refactor policy loading
Date: Mon, 30 May 2022 22:39:44 -0400
Message-Id: <20220531023945.22196-5-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220531023945.22196-1-dpsmith@apertussolutions.com>
References: <20220531023945.22196-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Previously initializing the policy buffer was split between two functions,
xsm_{multiboot,dt}_policy_init() and xsm_core_init(). The latter for loading
the policy from boot modules and the former for falling back to built-in policy.

This patch moves all policy buffer initialization logic under the
xsm_{multiboot,dt}_policy_init() functions. It then ensures that an error
message is printed for every error condition that may occur in the functions.
With all policy buffer init contained and only called when the policy buffer
must be populated, the respective xsm_{mb,dt}_init() functions will panic if an
error occurs attempting to populate the policy buffer.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/include/xsm/xsm.h |  2 +-
 xen/xsm/xsm_core.c    | 18 +++---------------
 xen/xsm/xsm_policy.c  | 31 +++++++++++++++++++++++++++----
 3 files changed, 31 insertions(+), 20 deletions(-)

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
index 4a29ee9558..8f6c3de8a6 100644
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
@@ -155,7 +147,7 @@ int __init xsm_multiboot_init(
     unsigned long *module_map, const multiboot_info_t *mbi)
 {
     int ret = 0;
-    void *policy_buffer = NULL;
+    const unsigned char *policy_buffer;
     size_t policy_size = 0;
 
     printk("XSM Framework v" XSM_FRAMEWORK_VERSION " initialized\n");
@@ -167,8 +159,7 @@ int __init xsm_multiboot_init(
         if ( ret )
         {
             bootstrap_map(NULL);
-            printk(XENLOG_ERR "Error %d initializing XSM policy\n", ret);
-            return -EINVAL;
+            panic(XENLOG_ERR "Error %d initializing XSM policy\n", ret);
         }
     }
 
@@ -192,10 +183,7 @@ int __init xsm_dt_init(void)
     {
         ret = xsm_dt_policy_init(&policy_buffer, &policy_size);
         if ( ret )
-        {
-            printk(XENLOG_ERR "Error %d initializing XSM policy\n", ret);
-            return -EINVAL;
-        }
+            panic(XENLOG_ERR "Error %d initializing XSM policy\n", ret);
     }
 
     ret = xsm_core_init(policy_buffer, policy_size);
diff --git a/xen/xsm/xsm_policy.c b/xen/xsm/xsm_policy.c
index 8dafbc9381..6a4f769aec 100644
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
+    const unsigned char *policy_buffer[], size_t *policy_size)
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
@@ -68,6 +76,9 @@ int __init xsm_multiboot_policy_init(
         bootstrap_map(NULL);
     }
 
+    if ( rc == -ENOENT )
+        printk(XENLOG_ERR "xsm: Unable to locate policy file\n");
+
     return rc;
 }
 #endif
@@ -79,7 +90,16 @@ int __init xsm_dt_policy_init(void **policy_buffer, size_t *policy_size)
     paddr_t paddr, len;
 
     if ( !mod || !mod->size )
+    {
+#ifdef CONFIG_XSM_FLASK_POLICY
+        *policy_buffer = (void *)xsm_flask_init_policy;
+        *policy_size = xsm_flask_init_policy_size;
         return 0;
+#else
+        printk(XENLOG_ERR "xsm: Unable to locate policy file\n");
+        return -ENOENT;
+#endif
+    }
 
     paddr = mod->start;
     len = mod->size;
@@ -95,7 +115,10 @@ int __init xsm_dt_policy_init(void **policy_buffer, size_t *policy_size)
 
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


