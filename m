Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B8C966B85
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 23:50:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786687.1196336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9VM-0000xR-3h; Fri, 30 Aug 2024 21:50:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786687.1196336; Fri, 30 Aug 2024 21:50:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9VM-0000t8-12; Fri, 30 Aug 2024 21:50:04 +0000
Received: by outflank-mailman (input) for mailman id 786687;
 Fri, 30 Aug 2024 21:50:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiG6=P5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sk9VK-0000Zf-8u
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 21:50:02 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd2154f2-6719-11ef-99a1-01e77a169b0f;
 Fri, 30 Aug 2024 23:50:00 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: by mx.zohomail.com with SMTPS id 1725054479373585.778896678308;
 Fri, 30 Aug 2024 14:47:59 -0700 (PDT)
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
X-Inumbo-ID: cd2154f2-6719-11ef-99a1-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1725054481; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FEGmLK6fu+9wYmYqWZCJ3D208mCbv5w+ovSDVze+c93yVuEgwNzEFii9v59Wx5bpIEEMGUgbHjCAdvfj7aNsUmqk2mOtCqz97RxBYjVJmYp09LSaPwrUzP9kJ3xhNB6cS8sJxCePDWzNOQhqaJ0di9OUGRr3dUsi0tg8FaKN3Dw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1725054481; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=x7EA1HjwHFmnd4GnZ7Gub2RJOomQt0q62OXf51BcXpM=; 
	b=VTWhRAdCMXgT8oyOCjAtvVXa52eqKZG3JRjIxN7XwVgt7uj7MIzsvWHQpT26VvERP+105AzH6hlMz+/vDnTZO/x1BqPi//6ndjGHYzLmzswtQbWPzlnXocPsG+uKw8NLffuyZBnHLfAQ/0Qdex4AZeMhpaw7GPRK8OAxdCz8fIQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725054481;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=x7EA1HjwHFmnd4GnZ7Gub2RJOomQt0q62OXf51BcXpM=;
	b=pSth6LFRIXPSZKfgsmM1u9uCXbxqB+1eHdVwKjkXPw+NDTySyaXzTiji8PL5zIyr
	vro1JEqgTsOTLFlxGB0xBSEvQQsdASY1ErOql689Syj+lq3sch1gJ2Aim2iZy47/eCZ
	BuzKKeWDSuwqp02/CvQHW4cdaGGTaVthiIpWXFBo=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 18/44] x86/boot: convert late microcode loading to struct boot_module
Date: Fri, 30 Aug 2024 17:47:03 -0400
Message-Id: <20240830214730.1621-19-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240830214730.1621-1-dpsmith@apertussolutions.com>
References: <20240830214730.1621-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Remove the use of struct mod to hold the reference for the microcode,
converting the code to work with a struct boot_module.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/cpu/microcode/core.c | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 653a725173ba..cedb03beea54 100644
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
@@ -93,7 +92,7 @@ struct ucode_mod_blob {
 
 static struct ucode_mod_blob __initdata ucode_blob;
 /*
- * By default we will NOT parse the multiboot modules to see if there is
+ * By default we will NOT parse the boot modules to see if there is
  * cpio image with the microcode images.
  */
 static bool __initdata ucode_scan;
@@ -198,7 +197,7 @@ static void __init microcode_scan_module(
             ucode_blob.data = cd.data;
             break;
         }
-        bootstrap_map(NULL);
+        bootstrap_map_bm(NULL);
     }
 }
 
@@ -211,7 +210,7 @@ static void __init microcode_grab_module(
          !__test_and_clear_bit(ucode_mod_idx, module_map) )
         goto scan;
     bi->mods[ucode_mod_idx].type = BOOTMOD_MICROCODE;
-    ucode_mod = *bi->mods[ucode_mod_idx].early_mod;
+    ucode_mod = bi->mods[ucode_mod_idx];
 scan:
     if ( ucode_scan )
         microcode_scan_module(module_map, bi);
@@ -749,14 +748,14 @@ static int __init cf_check microcode_init(void)
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
@@ -814,9 +813,9 @@ int __init microcode_init_cache(
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
 
@@ -835,10 +834,10 @@ static int __init early_microcode_update_cpu(void)
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
@@ -904,7 +903,7 @@ int __init early_microcode_init(unsigned long *module_map,
 
     microcode_grab_module(module_map, bi);
 
-    if ( ucode_mod.mod_end || ucode_blob.size )
+    if ( ucode_mod.size || ucode_blob.size )
         rc = early_microcode_update_cpu();
 
     /*
-- 
2.30.2


