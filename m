Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5826966B86
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 23:50:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786688.1196346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9VS-0001dl-AC; Fri, 30 Aug 2024 21:50:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786688.1196346; Fri, 30 Aug 2024 21:50:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9VS-0001bq-77; Fri, 30 Aug 2024 21:50:10 +0000
Received: by outflank-mailman (input) for mailman id 786688;
 Fri, 30 Aug 2024 21:50:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiG6=P5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sk9VR-0000Zf-FW
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 21:50:09 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d1d1e673-6719-11ef-99a1-01e77a169b0f;
 Fri, 30 Aug 2024 23:50:07 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: by mx.zohomail.com with SMTPS id 172505448043769.83491652747614;
 Fri, 30 Aug 2024 14:48:00 -0700 (PDT)
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
X-Inumbo-ID: d1d1e673-6719-11ef-99a1-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1725054482; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XTnfnMMm4v6l8bgXkrImzcmzW4zs0WOeye4Wvyn/3qtPDFmtYslJfbzmsHztcRJrBrXcUdp8HkyNIxuXbyT6L6h5ZRs80F8cn2GJBR1F/wlCulfd042UqUvOqfSMaIt3jtqczW34RQ0BpB+IcoVlZ6k9S8z5j9tjtdAsa92owW0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1725054482; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=LvQN4/ZeUGHQXB1oFQeKAxyDBFEc9pZ1Jq2e0h2a0EA=; 
	b=PwZwn/ShaCUjoquhIDwC/pWauonn6EskybZSDF0kJECtc4ykfm8siRTP2Hu7yuBVPejf15P6bJKNFHopZdLQZiiTrUjFaUij77/nGSR2yjIKVgj5uh0iMmucnKSUfJVZGdnQycXXReNKz+e8i6sBiu8gvAvTIxYDuTqdoxV4xzE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725054482;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=LvQN4/ZeUGHQXB1oFQeKAxyDBFEc9pZ1Jq2e0h2a0EA=;
	b=W/Gl4cgwewEQRRVLEyJntP9FHXJtsY8Bg50wNRAiItjTUSUQ4QV4d/aJmgozlJdt
	2pUEavy2UhYy5r/kroq/mqALqBSw4r2+wFArYhplNMjL4QjZWsNJRWSEuwexTL3ESRe
	fGvhnScPUX3CVOece3XxRKakOQrReni3BC+MSiB0=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 19/44] x86/boot: use consumed boot module flag for microcode
Date: Fri, 30 Aug 2024 17:47:04 -0400
Message-Id: <20240830214730.1621-20-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240830214730.1621-1-dpsmith@apertussolutions.com>
References: <20240830214730.1621-1-dpsmith@apertussolutions.com>
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
 xen/arch/x86/cpu/microcode/core.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index cedb03beea54..83dd8bbe9fb1 100644
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
@@ -210,7 +210,7 @@ static void __init microcode_grab_module(
          !__test_and_clear_bit(ucode_mod_idx, module_map) )
         goto scan;
     bi->mods[ucode_mod_idx].type = BOOTMOD_MICROCODE;
-    ucode_mod = bi->mods[ucode_mod_idx];
+    ucode_mod = &bi->mods[ucode_mod_idx];
 scan:
     if ( ucode_scan )
         microcode_scan_module(module_map, bi);
@@ -752,10 +752,10 @@ static int __init cf_check microcode_init(void)
         ucode_blob.size = 0;
         ucode_blob.data = NULL;
     }
-    else if ( ucode_mod.size )
+    else if ( ucode_mod && !(ucode_mod->flags & BOOTMOD_FLAG_X86_CONSUMED) )
     {
         bootstrap_map_bm(NULL);
-        ucode_mod.size = 0;
+        ucode_mod->flags |= BOOTMOD_FLAG_X86_CONSUMED;
     }
 
     return 0;
@@ -809,14 +809,14 @@ int __init microcode_init_cache(
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
+    if ( ucode_mod && !(ucode_mod->flags & BOOTMOD_FLAG_X86_CONSUMED) )
+        rc = early_update_cache(bootstrap_map_bm(ucode_mod),
+                                ucode_mod->size);
+    else if ( ucode_mod && ucode_blob.size )
         rc = early_update_cache(ucode_blob.data, ucode_blob.size);
 
     return rc;
@@ -834,10 +834,10 @@ static int __init early_microcode_update_cpu(void)
         len = ucode_blob.size;
         data = ucode_blob.data;
     }
-    else if ( ucode_mod.size )
+    else if ( ucode_mod && !(ucode_mod->flags & BOOTMOD_FLAG_X86_CONSUMED) )
     {
-        len = ucode_mod.size;
-        data = bootstrap_map_bm(&ucode_mod);
+        len = ucode_mod->size;
+        data = bootstrap_map_bm(ucode_mod);
     }
 
     if ( !data )
@@ -903,7 +903,7 @@ int __init early_microcode_init(unsigned long *module_map,
 
     microcode_grab_module(module_map, bi);
 
-    if ( ucode_mod.size || ucode_blob.size )
+    if ( ucode_mod || ucode_blob.size )
         rc = early_microcode_update_cpu();
 
     /*
-- 
2.30.2


