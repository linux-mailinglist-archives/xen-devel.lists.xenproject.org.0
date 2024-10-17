Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6989A2AA2
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 19:19:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820991.1234775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1U9g-0000Ro-78; Thu, 17 Oct 2024 17:19:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820991.1234775; Thu, 17 Oct 2024 17:19:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1U9g-0000Ox-2T; Thu, 17 Oct 2024 17:19:20 +0000
Received: by outflank-mailman (input) for mailman id 820991;
 Thu, 17 Oct 2024 17:19:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KqF2=RN=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t1TxW-0008TH-Pd
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 17:06:46 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2fb3dcb7-8caa-11ef-a0be-8be0dac302b0;
 Thu, 17 Oct 2024 19:06:45 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729184643193190.33025190860144;
 Thu, 17 Oct 2024 10:04:03 -0700 (PDT)
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
X-Inumbo-ID: 2fb3dcb7-8caa-11ef-a0be-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1729184645; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aZe4itBBnJA2y9TxgpuNou8I7xD39engfcpAbjXrG+C8EqbJ4vl+doeSIXfiKjkQvwbgPuXe+VRACv/us7s/sY1L1GrnaNwweIdHdfJPKNs3SvF8KiR5PGqYoATKgVEonxNhQ1kvPwWNFT/uJuH+gqAdAH5vzNi6QMYMOJlkTYU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729184645; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=fMkGfujHPoOjChPMwwzqPao8q0VWxzzsdGo5pHHHDFY=; 
	b=kCNym6KselYtzkaoiRE54OKnmGVijOgHVABlUOxI5KU2yWgieDHQqzMv/jrig45TyTpTTBA/wcJlB+KbpHxCnfrw/r9w5JFW6ne0jD3MB641n7JmHdToOiAvBEHXGvHEMEqqy012Jyloh3Sw0+P/5Iq57TC7ZcIm0HQR+H+IzmI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729184645;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=fMkGfujHPoOjChPMwwzqPao8q0VWxzzsdGo5pHHHDFY=;
	b=noYIythe3ulKS3B18DOV2DkKiCX8BtzIW/ZfL3MVh6Sk918EvpHtk2ZE9s+XESi6
	piRf3NFbfZi+01nPJGk1gJukqCh8jwU8KUSRStPWZkj3jzaRuY9dm47ZCBHzWVEXacm
	RuSybzs+4hntfMgvXISl/uNbDs45acJ9Bx3F8zCc=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v6 22/44] x86/boot: remove module_map usage from microcode loading
Date: Thu, 17 Oct 2024 13:03:02 -0400
Message-Id: <20241017170325.3842-23-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241017170325.3842-1-dpsmith@apertussolutions.com>
References: <20241017170325.3842-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

With all consumers of module_map converted, remove usage of it
by the microcode loading logic.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
Changes since v5:
- dropped unnecessary parens
---
 xen/arch/x86/cpu/microcode/core.c    | 22 +++++++++-------------
 xen/arch/x86/include/asm/microcode.h |  6 ++----
 xen/arch/x86/setup.c                 |  4 ++--
 3 files changed, 13 insertions(+), 19 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 5b42aad2fdd0..23984c69bce7 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -152,8 +152,7 @@ static int __init cf_check parse_ucode(const char *s)
 }
 custom_param("ucode", parse_ucode);
 
-static void __init microcode_scan_module(
-    unsigned long *module_map, const struct boot_info *bi)
+static void __init microcode_scan_module(const struct boot_info *bi)
 {
     uint64_t *_blob_start;
     unsigned long _blob_size;
@@ -178,7 +177,7 @@ static void __init microcode_scan_module(
      */
     for ( i = 1 /* Ignore dom0 kernel */; i < bi->nr_modules; i++ )
     {
-        if ( !test_bit(i, module_map) )
+        if ( bi->mods[i].type != BOOTMOD_UNKNOWN )
             continue;
 
         _blob_start = bootstrap_map_bm(&bi->mods[i]);
@@ -202,19 +201,18 @@ static void __init microcode_scan_module(
     }
 }
 
-static void __init microcode_grab_module(
-    unsigned long *module_map, struct boot_info *bi)
+static void __init microcode_grab_module(struct boot_info *bi)
 {
     if ( ucode_mod_idx < 0 )
         ucode_mod_idx += bi->nr_modules;
     if ( ucode_mod_idx <= 0 || ucode_mod_idx >= bi->nr_modules ||
-         !__test_and_clear_bit(ucode_mod_idx, module_map) )
+         bi->mods[ucode_mod_idx].type != BOOTMOD_UNKNOWN )
         goto scan;
     bi->mods[ucode_mod_idx].type = BOOTMOD_MICROCODE;
     ucode_mod = &bi->mods[ucode_mod_idx];
 scan:
     if ( ucode_scan )
-        microcode_scan_module(module_map, bi);
+        microcode_scan_module(bi);
 }
 
 static struct microcode_ops __ro_after_init ucode_ops;
@@ -818,8 +816,7 @@ static int __init early_update_cache(const void *data, size_t len)
     return rc;
 }
 
-int __init microcode_init_cache(
-    unsigned long *module_map, const struct boot_info *bi)
+int __init microcode_init_cache(const struct boot_info *bi)
 {
     int rc = 0;
 
@@ -828,7 +825,7 @@ int __init microcode_init_cache(
 
     /* Scan if microcode was not detected earlier */
     if ( !ucode_mod )
-        microcode_scan_module(module_map, bi);
+        microcode_scan_module(bi);
 
     if ( ucode_mod && !(ucode_mod->flags & BOOTMOD_FLAG_X86_CONSUMED) )
         rc = early_update_cache(bootstrap_map_bm(ucode_mod),
@@ -874,8 +871,7 @@ static int __init early_microcode_update_cpu(void)
     return microcode_update_cpu(patch, 0);
 }
 
-int __init early_microcode_init(unsigned long *module_map,
-                                struct boot_info *bi)
+int __init early_microcode_init(struct boot_info *bi)
 {
     const struct cpuinfo_x86 *c = &boot_cpu_data;
     int rc = 0;
@@ -918,7 +914,7 @@ int __init early_microcode_init(unsigned long *module_map,
         return -ENODEV;
     }
 
-    microcode_grab_module(module_map, bi);
+    microcode_grab_module(bi);
 
     if ( ucode_mod || ucode_blob.size )
         rc = early_microcode_update_cpu();
diff --git a/xen/arch/x86/include/asm/microcode.h b/xen/arch/x86/include/asm/microcode.h
index 495c8f7a7cc5..84e0eb487244 100644
--- a/xen/arch/x86/include/asm/microcode.h
+++ b/xen/arch/x86/include/asm/microcode.h
@@ -26,10 +26,8 @@ DECLARE_PER_CPU(struct cpu_signature, cpu_sig);
 void microcode_set_module(unsigned int idx);
 int microcode_update(
     XEN_GUEST_HANDLE(const_void) buf, unsigned long len, unsigned int flags);
-int early_microcode_init(
-    unsigned long *module_map, struct boot_info *bi);
-int microcode_init_cache(
-    unsigned long *module_map, const struct boot_info *bi);
+int early_microcode_init(struct boot_info *bi);
+int microcode_init_cache(const struct boot_info *bi);
 int microcode_update_one(void);
 
 #endif /* ASM_X86__MICROCODE_H */
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 6ba8a893daf0..e1763d7e6548 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1385,7 +1385,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
      * TODO: load ucode earlier once multiboot modules become accessible
      * at an earlier stage.
      */
-    early_microcode_init(module_map, bi);
+    early_microcode_init(bi);
 
     if ( xen_phys_start )
     {
@@ -1937,7 +1937,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 
     timer_init();
 
-    microcode_init_cache(module_map, bi); /* Needs xmalloc() */
+    microcode_init_cache(bi); /* Needs xmalloc() */
 
     tsx_init(); /* Needs microcode.  May change HLE/RTM feature bits. */
 
-- 
2.30.2


