Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 296F59921CC
	for <lists+xen-devel@lfdr.de>; Sun,  6 Oct 2024 23:52:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.811340.1223940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZB8-0008Gq-Vs; Sun, 06 Oct 2024 21:52:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 811340.1223940; Sun, 06 Oct 2024 21:52:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZB8-0008EA-SV; Sun, 06 Oct 2024 21:52:38 +0000
Received: by outflank-mailman (input) for mailman id 811340;
 Sun, 06 Oct 2024 21:52:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qR5E=RC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sxZB7-0007Zk-GS
 for xen-devel@lists.xenproject.org; Sun, 06 Oct 2024 21:52:37 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4bd39301-842d-11ef-a0bb-8be0dac302b0;
 Sun, 06 Oct 2024 23:52:36 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1728251425417792.9443259328399;
 Sun, 6 Oct 2024 14:50:25 -0700 (PDT)
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
X-Inumbo-ID: 4bd39301-842d-11ef-a0bb-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1728251427; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=h/mY93XEW60nPUsutwR7iWiZgS7zET21cJ4yQTyDysiruHKRm8t7wivLjV7959M4/sdkL/q8SnA9U5T8bX9WRgc6YhSh6f/Q/pR3Esq/hlvIkQ21CMpHROlW5AakscV4z3HMXWInpNlfgjPjQ3Y70XuoITs9Yk4jajNMF6gRd5Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728251427; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=8SJ3l6W5Fjze1fW/V5fSHZb+ng2bvJdWFKLTG0JGAVw=; 
	b=g/IbNRwL6A8CwnPXgVAQ/ECGSjSlk7PEmuMGs43D739olVVzdOPJjtWS7ruodofg0LKNKgvp4CJ3MokkwHYuU9Qs/NcSqEWcU8kRCRIOcx4LpQ/YLBTFu7Gydm2XJ8bQ7Mk7l4atB0csRDgz9iKZcRbq+3RezNwyELYlbexvaaE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728251427;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=8SJ3l6W5Fjze1fW/V5fSHZb+ng2bvJdWFKLTG0JGAVw=;
	b=aza6s0qGlurg7cBUEJca7VCER1+nInKzjWvx1cPrFUF8NGpDHDVaWhVHogNDw7D3
	j/V78wUDLrhpr1tcTDfdNpFduw4iQ1koUcd1R3BBRYq8X5ueELxfSVqqzF97rtipF18
	LLVOqO/s6r6HLjkaZRpoidDe938Hl9dLeYQPExzU=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 18/44] x86/boot: convert late microcode loading to struct boot_module
Date: Sun,  6 Oct 2024 17:49:29 -0400
Message-Id: <20241006214956.24339-19-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241006214956.24339-1-dpsmith@apertussolutions.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
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


