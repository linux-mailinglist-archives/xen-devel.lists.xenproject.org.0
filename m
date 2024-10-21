Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD959A5854
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 02:56:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.822984.1236995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2giy-0002Sq-Iu; Mon, 21 Oct 2024 00:56:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 822984.1236995; Mon, 21 Oct 2024 00:56:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2giy-0002Px-Dz; Mon, 21 Oct 2024 00:56:44 +0000
Received: by outflank-mailman (input) for mailman id 822984;
 Mon, 21 Oct 2024 00:56:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q0x4=RR=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t2gad-0000Dk-MG
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 00:48:07 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 210e2bd8-8f46-11ef-99a3-01e77a169b0f;
 Mon, 21 Oct 2024 02:48:05 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729471598854865.3394944103438;
 Sun, 20 Oct 2024 17:46:38 -0700 (PDT)
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
X-Inumbo-ID: 210e2bd8-8f46-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1729471600; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HKsQ+Zjc8MHAZ9nbxHOQxCY2PCzIFFbWhfNagWs5LlGQst96aMMpOka9UCGu7jv82KF6qsk+Rhbyo9rXF6znIFMHWkJMFnk/iwn5n71hgNw+5X0uUyLIQyNLyeXPro0G+pZ+oUFtWfuWhOJJ81o0GAxsBn0u+KR/LcsIIXX0K4c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729471600; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=iJYAb243RSTcsTIRrMAmS03Q6YE6d276D7BTcoq1ZCs=; 
	b=K3fNOycSd7lD+iBLFIiHKDgbwMEF/AoUhruFNoxHxLElYjJhusdvZV3XLVOkSwxGEfvEpW/DxZ1vZOyoC3v0pbSMiyPRJ3JbYkf2NXbzEJx8cNLAU2yDAqn5/3WrAYry8aE4LuoorKTYG9nIpHR3wPp7UVj89l0F3CHP+8+meC0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729471600;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=iJYAb243RSTcsTIRrMAmS03Q6YE6d276D7BTcoq1ZCs=;
	b=C1f/HYbThMei6aNxR4f+zW5r+znqk5ySicMDC6HNothbMqcr1bXAB1d0PObo/MuZ
	tjf44f+RFmHGSEEF595OxYbQVN0nxo/dxGWg9yImIsAuOb0RObq1qcxG+O3YhHrIzsu
	Cdl0Kc/Nc51+I2WdiOYtjtlFUGxPeNIq4R+9XREg=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v7 13/38] x86/boot: use consumed boot module flag for microcode
Date: Sun, 20 Oct 2024 20:45:48 -0400
Message-Id: <20241021004613.18793-14-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241021004613.18793-1-dpsmith@apertussolutions.com>
References: <20241021004613.18793-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

To track if the microcode boot module was loaded, a copy of the boot module is
kept. The size element of this copy is set to zero as the indicator that the
microcode was loaded. A side effect is that the modules have to be rescanned to
find the boot module post-relocation, so the cache copy can be created.

Use the consumed boot module flag to track the loading of the microcode boot
module. This removes the need to manipulate the boot module size element, no
longer requiring the copy, thus allowing it to be replaced by a reference. As a
result it is no longer necessary to rescan the boot modules after relocation
has occurred.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
Changes since v6:
- adjust logic to the change of consumed flag to being a bitfield
---
 xen/arch/x86/cpu/microcode/core.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index b6badd9afdb2..8ea789dceec2 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -58,7 +58,7 @@
  */
 #define MICROCODE_UPDATE_TIMEOUT_US 1000000
 
-static struct boot_module __initdata ucode_mod;
+static struct boot_module __initdata *ucode_mod;
 static signed int __initdata ucode_mod_idx;
 static bool __initdata ucode_mod_forced;
 static unsigned int nr_cores;
@@ -208,7 +208,7 @@ static void __init microcode_grab_module(
          !__test_and_clear_bit(ucode_mod_idx, module_map) )
         goto scan;
     bi->mods[ucode_mod_idx].type = BOOTMOD_MICROCODE;
-    ucode_mod = bi->mods[ucode_mod_idx];
+    ucode_mod = &bi->mods[ucode_mod_idx];
 scan:
     if ( ucode_scan )
         microcode_scan_module(module_map, bi);
@@ -766,10 +766,10 @@ static int __init cf_check microcode_init(void)
         ucode_blob.size = 0;
         ucode_blob.data = NULL;
     }
-    else if ( ucode_mod.size )
+    else if ( ucode_mod && !ucode_mod->consumed )
     {
         bootstrap_map_bm(NULL);
-        ucode_mod.size = 0;
+        ucode_mod->consumed = true;
     }
 
     return 0;
@@ -823,14 +823,14 @@ int __init microcode_init_cache(
     if ( !ucode_ops.apply_microcode )
         return -ENODEV;
 
-    if ( ucode_scan )
-        /* Need to rescan the modules because they might have been relocated */
+    /* Scan if microcode was not detected earlier */
+    if ( !ucode_mod )
         microcode_scan_module(module_map, bi);
 
-    if ( ucode_mod.size )
-        rc = early_update_cache(bootstrap_map_bm(&ucode_mod),
-                                ucode_mod.size);
-    else if ( ucode_blob.size )
+    if ( ucode_mod && !ucode_mod->consumed )
+        rc = early_update_cache(bootstrap_map_bm(ucode_mod),
+                                ucode_mod->size);
+    else if ( ucode_mod && ucode_blob.size )
         rc = early_update_cache(ucode_blob.data, ucode_blob.size);
 
     return rc;
@@ -848,10 +848,10 @@ static int __init early_microcode_update_cpu(void)
         len = ucode_blob.size;
         data = ucode_blob.data;
     }
-    else if ( ucode_mod.size )
+    else if ( ucode_mod && !ucode_mod->consumed )
     {
-        len = ucode_mod.size;
-        data = bootstrap_map_bm(&ucode_mod);
+        len = ucode_mod->size;
+        data = bootstrap_map_bm(ucode_mod);
     }
 
     if ( !data )
@@ -917,7 +917,7 @@ int __init early_microcode_init(unsigned long *module_map,
 
     microcode_grab_module(module_map, bi);
 
-    if ( ucode_mod.size || ucode_blob.size )
+    if ( ucode_mod || ucode_blob.size )
         rc = early_microcode_update_cpu();
 
     /*
-- 
2.30.2


