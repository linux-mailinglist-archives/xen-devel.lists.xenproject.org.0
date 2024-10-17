Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F679A2A3F
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 19:07:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820881.1234561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1TyG-0004Ux-Q3; Thu, 17 Oct 2024 17:07:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820881.1234561; Thu, 17 Oct 2024 17:07:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1TyG-0004SW-Ml; Thu, 17 Oct 2024 17:07:32 +0000
Received: by outflank-mailman (input) for mailman id 820881;
 Thu, 17 Oct 2024 17:07:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KqF2=RN=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t1Tx1-00014B-Fz
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 17:06:15 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c96bce4-8caa-11ef-99a3-01e77a169b0f;
 Thu, 17 Oct 2024 19:06:13 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729184637493451.84421739071854;
 Thu, 17 Oct 2024 10:03:57 -0700 (PDT)
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
X-Inumbo-ID: 1c96bce4-8caa-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1729184639; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ER0ju3p2fPTCk6jegIRIWVHZCZiFqjUM0aihbhLMWQK0hQ2/Ur+sM9Yv/gJYYEHALYcOCVQDNwI0xZFjFXXHiIlb/rzwQpER173Y4eslYDMawLfmG157QePXP6Ux8bWtt/KXW0VajU5bDbhXZFkvRLlFXgbDSRcP2ld/p8sZhl8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729184639; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=IYHnqAORfDi1eC8Y7S7zVhUJU72K5GjJXVS7llgVqYI=; 
	b=DctUKoEGuoA8Rdr9m63PNBizaKu5a4n2j/hCYDvddsc3z2F56vCUjzRlsxvgAlp1rLozQMSWC7D9zReEToZpdlbJOeOzJUjVTQA+YWcM3hJGxWGbnyW4bGq9xC4ZFGvHa6ZtNCnFyANbeLEu1+JcCdwE5+AWKIpiDjepXmISV88=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729184639;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=IYHnqAORfDi1eC8Y7S7zVhUJU72K5GjJXVS7llgVqYI=;
	b=Gky6augRufFxhCCGQoCHMsQCCvAVH1Ed2IHZ2UOnHu95P5BAUqqfPDkplBb0OqZl
	usAn+3rUYty4DhUMfO2ScdDvbuekt2MBsOe+i1DDUloVskaIJRMo4pY5g+qhbgUJPyh
	4zlbbZviL6xtvzyOXglv3VQPHV8DCPeKo2opNFmk=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v6 18/44] x86/boot: convert late microcode loading to struct boot_module
Date: Thu, 17 Oct 2024 13:02:58 -0400
Message-Id: <20241017170325.3842-19-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241017170325.3842-1-dpsmith@apertussolutions.com>
References: <20241017170325.3842-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Remove the use of struct mod to hold the reference for the microcode,
converting the code to work with a struct boot_module.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
 xen/arch/x86/cpu/microcode/core.c | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 22fea80bc97e..7bcc17e0ab2f 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -28,7 +28,6 @@
 #include <xen/err.h>
 #include <xen/guest_access.h>
 #include <xen/init.h>
-#include <xen/multiboot.h>
 #include <xen/param.h>
 #include <xen/spinlock.h>
 #include <xen/stop_machine.h>
@@ -59,7 +58,7 @@
  */
 #define MICROCODE_UPDATE_TIMEOUT_US 1000000
 
-static module_t __initdata ucode_mod;
+static struct boot_module __initdata ucode_mod;
 static signed int __initdata ucode_mod_idx;
 static bool __initdata ucode_mod_forced;
 static unsigned int nr_cores;
@@ -98,7 +97,7 @@ struct patch_with_flags {
 
 static struct ucode_mod_blob __initdata ucode_blob;
 /*
- * By default we will NOT parse the multiboot modules to see if there is
+ * By default we will NOT parse the boot modules to see if there is
  * cpio image with the microcode images.
  */
 static bool __initdata ucode_scan;
@@ -199,7 +198,7 @@ static void __init microcode_scan_module(
             ucode_blob.data = cd.data;
             break;
         }
-        bootstrap_map(NULL);
+        bootstrap_map_bm(NULL);
     }
 }
 
@@ -212,7 +211,7 @@ static void __init microcode_grab_module(
          !__test_and_clear_bit(ucode_mod_idx, module_map) )
         goto scan;
     bi->mods[ucode_mod_idx].type = BOOTMOD_MICROCODE;
-    ucode_mod = *bi->mods[ucode_mod_idx].mod;
+    ucode_mod = bi->mods[ucode_mod_idx];
 scan:
     if ( ucode_scan )
         microcode_scan_module(module_map, bi);
@@ -766,14 +765,14 @@ static int __init cf_check microcode_init(void)
      */
     if ( ucode_blob.size )
     {
-        bootstrap_map(NULL);
+        bootstrap_map_bm(NULL);
         ucode_blob.size = 0;
         ucode_blob.data = NULL;
     }
-    else if ( ucode_mod.mod_end )
+    else if ( ucode_mod.size )
     {
-        bootstrap_map(NULL);
-        ucode_mod.mod_end = 0;
+        bootstrap_map_bm(NULL);
+        ucode_mod.size = 0;
     }
 
     return 0;
@@ -831,9 +830,9 @@ int __init microcode_init_cache(
         /* Need to rescan the modules because they might have been relocated */
         microcode_scan_module(module_map, bi);
 
-    if ( ucode_mod.mod_end )
-        rc = early_update_cache(bootstrap_map(&ucode_mod),
-                                ucode_mod.mod_end);
+    if ( ucode_mod.size )
+        rc = early_update_cache(bootstrap_map_bm(&ucode_mod),
+                                ucode_mod.size);
     else if ( ucode_blob.size )
         rc = early_update_cache(ucode_blob.data, ucode_blob.size);
 
@@ -852,10 +851,10 @@ static int __init early_microcode_update_cpu(void)
         len = ucode_blob.size;
         data = ucode_blob.data;
     }
-    else if ( ucode_mod.mod_end )
+    else if ( ucode_mod.size )
     {
-        len = ucode_mod.mod_end;
-        data = bootstrap_map(&ucode_mod);
+        len = ucode_mod.size;
+        data = bootstrap_map_bm(&ucode_mod);
     }
 
     if ( !data )
@@ -921,7 +920,7 @@ int __init early_microcode_init(unsigned long *module_map,
 
     microcode_grab_module(module_map, bi);
 
-    if ( ucode_mod.mod_end || ucode_blob.size )
+    if ( ucode_mod.size || ucode_blob.size )
         rc = early_microcode_update_cpu();
 
     /*
-- 
2.30.2


