Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BDB966B89
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 23:50:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786701.1196377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9Vr-0002yR-5x; Fri, 30 Aug 2024 21:50:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786701.1196377; Fri, 30 Aug 2024 21:50:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9Vr-0002uT-1m; Fri, 30 Aug 2024 21:50:35 +0000
Received: by outflank-mailman (input) for mailman id 786701;
 Fri, 30 Aug 2024 21:50:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiG6=P5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sk9Vp-0002pb-Q4
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 21:50:33 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dffef035-6719-11ef-a0b1-8be0dac302b0;
 Fri, 30 Aug 2024 23:50:31 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: by mx.zohomail.com with SMTPS id 1725054483861421.2034253922176;
 Fri, 30 Aug 2024 14:48:03 -0700 (PDT)
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
X-Inumbo-ID: dffef035-6719-11ef-a0b1-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1725054485; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ia6wGt9t5HuBaQqNQZ55WRnAQOdNnd9zqfY1qg9OixdfEMmT1wNje3s6Q/q5BhgBMfDWXZTTN4LYwoEoAigRMgQt275/Gv6+yHbGe1kTnb9GPV7fCOc1+V5D8M+xbfuYC6yAnytFTD+oPN0G6yLo3CQUpsVq7CGSXcqVueFbjNE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1725054485; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=9VY/wyQt4O/me1dGYDFEc+UYgABFvTmTG94v1OX5tlk=; 
	b=KLZYeWk/gNdHKm7R1TsLTdZnnfd8Pqld01RmdseUqYSB4176FVTlWN1YBPRka9dlzAc+cAJ6V2NEl9QZKTnwPuY4m59HUJ57JjTZ3n/feNlfemlOeYXz9GfxWYCtnvzMYcajOzov85JazR5b/M+sB/LFajIHJywr5S6tfrqhVGM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725054485;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=9VY/wyQt4O/me1dGYDFEc+UYgABFvTmTG94v1OX5tlk=;
	b=dF8UFFgbdH1r41iLKSnyhdODKsMso2k76i9ie9JTslPQtsE3jMsvPBNpVZj4g+uK
	uqEJTlaujfMdz+wn+o2J0xj5U6TskKUwhWHmUWqWk937G3c0SPd8vfbHjyWwhrjdblf
	TX7n9XXtYAoQbM4TLZq9EYdpQ2vNTrNF7GkEbBPk=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 22/44] x86/boot: remove module_map usage from microcode loading
Date: Fri, 30 Aug 2024 17:47:07 -0400
Message-Id: <20240830214730.1621-23-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240830214730.1621-1-dpsmith@apertussolutions.com>
References: <20240830214730.1621-1-dpsmith@apertussolutions.com>
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
index 83dd8bbe9fb1..a465a676d176 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -151,8 +151,7 @@ static int __init cf_check parse_ucode(const char *s)
 }
 custom_param("ucode", parse_ucode);
 
-static void __init microcode_scan_module(
-    unsigned long *module_map, const struct boot_info *bi)
+static void __init microcode_scan_module(const struct boot_info *bi)
 {
     uint64_t *_blob_start;
     unsigned long _blob_size;
@@ -177,7 +176,7 @@ static void __init microcode_scan_module(
      */
     for ( i = 1 /* Ignore dom0 kernel */; i < bi->nr_mods; i++ )
     {
-        if ( !test_bit(i, module_map) )
+        if ( bi->mods[i].type != BOOTMOD_UNKNOWN )
             continue;
 
         _blob_start = bootstrap_map_bm(&bi->mods[i]);
@@ -201,19 +200,18 @@ static void __init microcode_scan_module(
     }
 }
 
-static void __init microcode_grab_module(
-    unsigned long *module_map, const struct boot_info *bi)
+static void __init microcode_grab_module(const struct boot_info *bi)
 {
     if ( ucode_mod_idx < 0 )
         ucode_mod_idx += bi->nr_mods;
     if ( ucode_mod_idx <= 0 || ucode_mod_idx >= bi->nr_mods ||
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
@@ -801,8 +799,7 @@ static int __init early_update_cache(const void *data, size_t len)
     return rc;
 }
 
-int __init microcode_init_cache(
-    unsigned long *module_map, const struct boot_info *bi)
+int __init microcode_init_cache(const struct boot_info *bi)
 {
     int rc = 0;
 
@@ -811,7 +808,7 @@ int __init microcode_init_cache(
 
     /* Scan if microcode was not detected earlier */
     if ( !ucode_mod )
-        microcode_scan_module(module_map, bi);
+        microcode_scan_module(bi);
 
     if ( ucode_mod && !(ucode_mod->flags & BOOTMOD_FLAG_X86_CONSUMED) )
         rc = early_update_cache(bootstrap_map_bm(ucode_mod),
@@ -857,8 +854,7 @@ static int __init early_microcode_update_cpu(void)
     return microcode_update_cpu(patch);
 }
 
-int __init early_microcode_init(unsigned long *module_map,
-                                const struct boot_info *bi)
+int __init early_microcode_init(const struct boot_info *bi)
 {
     const struct cpuinfo_x86 *c = &boot_cpu_data;
     int rc = 0;
@@ -901,7 +897,7 @@ int __init early_microcode_init(unsigned long *module_map,
         return -ENODEV;
     }
 
-    microcode_grab_module(module_map, bi);
+    microcode_grab_module(bi);
 
     if ( ucode_mod || ucode_blob.size )
         rc = early_microcode_update_cpu();
diff --git a/xen/arch/x86/include/asm/microcode.h b/xen/arch/x86/include/asm/microcode.h
index 02fdb56bb82b..6abd6c1ff510 100644
--- a/xen/arch/x86/include/asm/microcode.h
+++ b/xen/arch/x86/include/asm/microcode.h
@@ -26,10 +26,8 @@ DECLARE_PER_CPU(struct cpu_signature, cpu_sig);
 void microcode_set_module(unsigned int idx);
 int microcode_update(
     XEN_GUEST_HANDLE(const_void) buf, unsigned long len, unsigned int flags);
-int early_microcode_init(
-    unsigned long *module_map, const struct boot_info *bi);
-int microcode_init_cache(
-    unsigned long *module_map, const struct boot_info *bi);
+int early_microcode_init(const struct boot_info *bi);
+int microcode_init_cache(const struct boot_info *bi);
 int microcode_update_one(void);
 
 #endif /* ASM_X86__MICROCODE_H */
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 189c45302fab..541a956923d3 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1398,7 +1398,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
      * TODO: load ucode earlier once multiboot modules become accessible
      * at an earlier stage.
      */
-    early_microcode_init(module_map, boot_info);
+    early_microcode_init(boot_info);
 
     if ( xen_phys_start )
     {
@@ -1952,7 +1952,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 
     timer_init();
 
-    microcode_init_cache(module_map, boot_info); /* Needs xmalloc() */
+    microcode_init_cache(boot_info); /* Needs xmalloc() */
 
     tsx_init(); /* Needs microcode.  May change HLE/RTM feature bits. */
 
-- 
2.30.2


