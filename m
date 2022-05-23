Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FA0532448
	for <lists+xen-devel@lfdr.de>; Tue, 24 May 2022 09:42:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336194.560518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntPAk-00048U-NL; Tue, 24 May 2022 07:41:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336194.560518; Tue, 24 May 2022 07:41:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntPAk-00045Q-JX; Tue, 24 May 2022 07:41:42 +0000
Received: by outflank-mailman (input) for mailman id 336194;
 Tue, 24 May 2022 07:41:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6c9/=WA=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1ntP6E-0003DA-QQ
 for xen-devel@lists.xenproject.org; Tue, 24 May 2022 07:37:02 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id abe7e49f-daae-11ec-837e-e5687231ffcc;
 Mon, 23 May 2022 17:40:30 +0200 (CEST)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1653320431089155.22680033498602;
 Mon, 23 May 2022 08:40:31 -0700 (PDT)
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
X-Inumbo-ID: abe7e49f-daae-11ec-837e-e5687231ffcc
ARC-Seal: i=1; a=rsa-sha256; t=1653320432; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QuXS1HEj0dvBJR2U8ihqk8BbN7rGuPNp/rtmwBU+gH2/qXMXK5PT76NWyjeLHhuQZBbZbpBDFfoSODSLdAiIQjTy24l35m5/Fm0cWbMipDhAw4anJj1yB94Ni/n9h5tFse0yTg1l8zLQ+mqwjmn57fgVtt8oP+VUCavy4GI8VoM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1653320432; h=Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=98v0UwvujcfL6C9tx4e5oAX1065dOOeYtIhzPpau0Tw=; 
	b=kZeAUtQNwaAvJEu13sFORdPqc7Soy50h7EmXs3G5DlLoaqHnIqTzoBRxueR7g71kFGpO/BMdYIvkii1aoJP/gbCWj7xkItT95rz8h3SnWbpnR4bTvikCQJacAqvVWaZxRr1QowMYBpOcTYBnsPAW9q1ffD7QmK3syozF1biZlmw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1653320432;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=98v0UwvujcfL6C9tx4e5oAX1065dOOeYtIhzPpau0Tw=;
	b=BQKPur29NhqC4YNELGVJO0XHUthYhshfF2F2vX5d8boDvAexBYDFDGJULF95kyca
	yNBi92rvLbiI4/ssoIs0fIOtq6TSjLT6ZOFw76bQd5a+BrW4uzeWmnrOSCQXNPnPEdA
	V2iyTrkldPiZbwX/EnZNICAywEd94uXHdo0o8Yas=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: scott.davis@starlab.io,
	jandryuk@gmail.com,
	christopher.clark@starlab.io,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: [PATCH] xsm: refactor and optimize policy loading
Date: Mon, 23 May 2022 11:40:24 -0400
Message-Id: <20220523154024.1947-1-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

It is possible to select a few different build configurations that results in
the unnecessary walking of the boot module list looking for a policy module.
This specifically occurs when the flask policy is enabled but either the dummy
or the SILO policy is selected as the enforcing policy. This is not ideal for
configurations like hyperlaunch and dom0less when there could be a number of
modules to be walked or unnecessary device tree lookups

This patch does two things, it moves all policy initialization logic under the
xsm_XXXX_policy_init() functions and introduces the init_policy flag.  The
init_policy flag will be set based on which enforcing policy is selected and
gates whether the boot modules should be checked for a policy file.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/xsm/xsm_core.c   | 30 +++++++++++++++++++-----------
 xen/xsm/xsm_policy.c | 21 +++++++++++++++++++--
 2 files changed, 38 insertions(+), 13 deletions(-)

diff --git a/xen/xsm/xsm_core.c b/xen/xsm/xsm_core.c
index 2286a502e3..0dfc970283 100644
--- a/xen/xsm/xsm_core.c
+++ b/xen/xsm/xsm_core.c
@@ -55,19 +55,35 @@ static enum xsm_bootparam __initdata xsm_bootparam =
     XSM_BOOTPARAM_DUMMY;
 #endif
 
+static bool __initdata init_policy =
+#ifdef CONFIG_XSM_FLASK_DEFAULT
+    true;
+#else
+    false;
+#endif
+
 static int __init cf_check parse_xsm_param(const char *s)
 {
     int rc = 0;
 
     if ( !strcmp(s, "dummy") )
+    {
         xsm_bootparam = XSM_BOOTPARAM_DUMMY;
+        init_policy = false;
+    }
 #ifdef CONFIG_XSM_FLASK
     else if ( !strcmp(s, "flask") )
+    {
         xsm_bootparam = XSM_BOOTPARAM_FLASK;
+        init_policy = true;
+    }
 #endif
 #ifdef CONFIG_XSM_SILO
     else if ( !strcmp(s, "silo") )
+    {
         xsm_bootparam = XSM_BOOTPARAM_SILO;
+        init_policy = false;
+    }
 #endif
     else
         rc = -EINVAL;
@@ -80,14 +96,6 @@ static int __init xsm_core_init(const void *policy_buffer, size_t policy_size)
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
@@ -148,11 +156,11 @@ int __init xsm_multiboot_init(
 
     printk("XSM Framework v" XSM_FRAMEWORK_VERSION " initialized\n");
 
-    if ( XSM_MAGIC )
+    if ( init_policy && XSM_MAGIC )
     {
         ret = xsm_multiboot_policy_init(module_map, mbi, &policy_buffer,
                                         &policy_size);
-        if ( ret )
+        if ( ret != 0 )
         {
             bootstrap_map(NULL);
             printk(XENLOG_ERR "Error %d initializing XSM policy\n", ret);
@@ -176,7 +184,7 @@ int __init xsm_dt_init(void)
 
     printk("XSM Framework v" XSM_FRAMEWORK_VERSION " initialized\n");
 
-    if ( XSM_MAGIC )
+    if ( init_policy && XSM_MAGIC )
     {
         ret = xsm_dt_policy_init(&policy_buffer, &policy_size);
         if ( ret )
diff --git a/xen/xsm/xsm_policy.c b/xen/xsm/xsm_policy.c
index 8dafbc9381..0e32418999 100644
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
@@ -36,10 +36,17 @@ int __init xsm_multiboot_policy_init(
 {
     int i;
     module_t *mod = (module_t *)__va(mbi->mods_addr);
-    int rc = 0;
+    int rc = -ENOENT;
     u32 *_policy_start;
     unsigned long _policy_len;
 
+#ifdef CONFIG_XSM_FLASK_POLICY
+    /* Initially set to builtin policy, overriden if boot module is found. */
+    *policy_buffer = (void *)xsm_flask_init_policy;
+    *policy_size = xsm_flask_init_policy_size;
+    rc = 0;
+#endif
+
     /*
      * Try all modules and see whichever could be the binary policy.
      * Adjust module_map for the module that is the binary policy.
@@ -61,6 +68,7 @@ int __init xsm_multiboot_policy_init(
                    _policy_len,_policy_start);
 
             __clear_bit(i, module_map);
+            rc = 0;
             break;
 
         }
@@ -79,7 +87,16 @@ int __init xsm_dt_policy_init(void **policy_buffer, size_t *policy_size)
     paddr_t paddr, len;
 
     if ( !mod || !mod->size )
+#ifdef CONFIG_XSM_FLASK_POLICY
+    {
+        *policy_buffer = (void *)xsm_flask_init_policy;
+        *policy_size = xsm_flask_init_policy_size;
         return 0;
+    }
+#else
+        /* No policy was loaded */
+        return -ENOENT;
+#endif
 
     paddr = mod->start;
     len = mod->size;
-- 
2.20.1


