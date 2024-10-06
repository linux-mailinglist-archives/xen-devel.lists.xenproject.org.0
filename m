Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8E99921D4
	for <lists+xen-devel@lfdr.de>; Sun,  6 Oct 2024 23:56:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.811365.1224010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZEq-0003kX-E7; Sun, 06 Oct 2024 21:56:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 811365.1224010; Sun, 06 Oct 2024 21:56:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZEq-0003al-7y; Sun, 06 Oct 2024 21:56:28 +0000
Received: by outflank-mailman (input) for mailman id 811365;
 Sun, 06 Oct 2024 21:56:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qR5E=RC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sxZBa-00051E-1o
 for xen-devel@lists.xenproject.org; Sun, 06 Oct 2024 21:53:06 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c4c2da6-842d-11ef-99a2-01e77a169b0f;
 Sun, 06 Oct 2024 23:53:04 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1728251430044946.1779583169215;
 Sun, 6 Oct 2024 14:50:30 -0700 (PDT)
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
X-Inumbo-ID: 5c4c2da6-842d-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1728251432; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fi3792AYUyNhvg31Zl86HKd8400o5iQihGwm9Cawmxrkq1DIcmW8ZuLXYrAVZSeRn1jz5fPpWoQ45ue9lgEn2wg3EvixOV2pJqHOU++dozBp5LEgsbSsZ/UqdmWTq+lq3J6jmNH7SzUF0hHaNg/KmDHEqzGzQhikyXhs/BWkykY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728251432; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=bxPxcsxpPK9+pHqiZxrW+JILNThIMZMh2pWKm97OWhk=; 
	b=hcCFcLK+IScnUaCr0rxu4ESp73E3Qh6EJW8tlC/Dd4ywrcVu4evVPAMItudQeVpb84GfE95DqWZSk2/bxm/oa9AwzqK185DqSX9MFV8+qa9DhGyyv5+ZbHmKYabFZ3QjL5gY1Yi2cst2VB3TV/w5TlXD9qE1657Ih0lEnlHIlsE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728251432;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=bxPxcsxpPK9+pHqiZxrW+JILNThIMZMh2pWKm97OWhk=;
	b=M00QmXCBVaGP+mHgTK8ZT73wNfUDOvY1+XY1G5HHQKI24oyqb5aJhsEBvy7rVHQW
	eMUb6TFl4WReUFm/wTIYhwTj626FOlXe6duBu3IDX5horwjcIWTK577wxLKEl6piORp
	Gl7VJCBlkqpo9DhMPcJuCrMPL9nR6EXdLb+2e72I=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 22/44] x86/boot: remove module_map usage from microcode loading
Date: Sun,  6 Oct 2024 17:49:33 -0400
Message-Id: <20241006214956.24339-23-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241006214956.24339-1-dpsmith@apertussolutions.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

With all consumers of module_map converted, remove usage of it
by the microcode loading logic.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/cpu/microcode/core.c    | 22 +++++++++-------------
 xen/arch/x86/include/asm/microcode.h |  6 ++----
 xen/arch/x86/setup.c                 |  4 ++--
 3 files changed, 13 insertions(+), 19 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 5b42aad2fdd0..f7ce2247a33e 100644
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
+         (bi->mods[ucode_mod_idx].type != BOOTMOD_UNKNOWN) )
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
index e42afb0c30cb..90acd4180441 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1382,7 +1382,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
      * TODO: load ucode earlier once multiboot modules become accessible
      * at an earlier stage.
      */
-    early_microcode_init(module_map, bi);
+    early_microcode_init(bi);
 
     if ( xen_phys_start )
     {
@@ -1939,7 +1939,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 
     timer_init();
 
-    microcode_init_cache(module_map, bi); /* Needs xmalloc() */
+    microcode_init_cache(bi); /* Needs xmalloc() */
 
     tsx_init(); /* Needs microcode.  May change HLE/RTM feature bits. */
 
-- 
2.30.2


