Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D302A9A5843
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 02:48:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.822904.1236844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2gb0-0002R6-Sw; Mon, 21 Oct 2024 00:48:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 822904.1236844; Mon, 21 Oct 2024 00:48:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2gb0-0002ON-Oi; Mon, 21 Oct 2024 00:48:30 +0000
Received: by outflank-mailman (input) for mailman id 822904;
 Mon, 21 Oct 2024 00:48:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q0x4=RR=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t2gaz-0001i1-DR
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 00:48:29 +0000
Received: from sender3-of-o58.zoho.com (sender3-of-o58.zoho.com
 [136.143.184.58]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2f295301-8f46-11ef-a0be-8be0dac302b0;
 Mon, 21 Oct 2024 02:48:28 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729471602382953.3963286856804;
 Sun, 20 Oct 2024 17:46:42 -0700 (PDT)
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
X-Inumbo-ID: 2f295301-8f46-11ef-a0be-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1729471603; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ffjeDt3vlGThPv2nGih5zq6NopZoxBvcvG5nslxFWuPr28L4i22uCe1sQvZwCIX85CDHqMwW2Va9QgGRPL6r/ZVd+7rlPTudkLu28MSyu4u89o7JfPL7Id/i0/737PxbZvx7LKlJtIfy/Fh4SSMGuVIyA0fSMnazdMEv+0wzIe8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729471603; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=1DlKXsrl8Pt4Zb3FNGx3fPisFvIcfKzE2I6khDAdJVU=; 
	b=WOeS81PAEGUyIUJI1hRr+RA1Tvfhc4b2EIs7lKgj9qeQVn3a4rSco0Kqz1tfAwvy2OmScMW1dKXwTKDbtwHZfzzE3nc0/CWPp908gXgl5/ueA5/cA+F7UCBwGVsecxb5mGBLT4tEIPSYCJlzxgURm9z4oD1OZSVaxg5nwn/3Ft8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729471603;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=1DlKXsrl8Pt4Zb3FNGx3fPisFvIcfKzE2I6khDAdJVU=;
	b=R7IMpvaeD/MFXuaEPG7e7FHgRQiQbruUh3NpNGB7hrDym0oPyPmRKUNKc6ZtQpdC
	jECE4biceXaQiMp5JX7W3btUEhC56nSa56dUj73Z0b83ioMSZdJyf/0OzwleT4mz2l+
	VEDNn8buWZwMISXBVU/rl6jMrUCbVCcDaAjnDGXA=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v7 16/38] x86/boot: remove module_map usage from microcode loading
Date: Sun, 20 Oct 2024 20:45:51 -0400
Message-Id: <20241021004613.18793-17-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241021004613.18793-1-dpsmith@apertussolutions.com>
References: <20241021004613.18793-1-dpsmith@apertussolutions.com>
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
 xen/arch/x86/cpu/microcode/core.c    | 20 ++++++++------------
 xen/arch/x86/include/asm/microcode.h |  6 ++----
 xen/arch/x86/setup.c                 |  4 ++--
 3 files changed, 12 insertions(+), 18 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 8ea789dceec2..938dfd74a9f1 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -152,8 +152,7 @@ static int __init cf_check parse_ucode(const char *s)
 }
 custom_param("ucode", parse_ucode);
 
-static void __init microcode_scan_module(
-    unsigned long *module_map, struct boot_info *bi)
+static void __init microcode_scan_module(struct boot_info *bi)
 {
     uint64_t *_blob_start;
     unsigned long _blob_size;
@@ -199,19 +198,18 @@ static void __init microcode_scan_module(
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
@@ -815,8 +813,7 @@ static int __init early_update_cache(const void *data, size_t len)
     return rc;
 }
 
-int __init microcode_init_cache(
-    unsigned long *module_map, struct boot_info *bi)
+int __init microcode_init_cache(struct boot_info *bi)
 {
     int rc = 0;
 
@@ -825,7 +822,7 @@ int __init microcode_init_cache(
 
     /* Scan if microcode was not detected earlier */
     if ( !ucode_mod )
-        microcode_scan_module(module_map, bi);
+        microcode_scan_module(bi);
 
     if ( ucode_mod && !ucode_mod->consumed )
         rc = early_update_cache(bootstrap_map_bm(ucode_mod),
@@ -871,8 +868,7 @@ static int __init early_microcode_update_cpu(void)
     return microcode_update_cpu(patch, 0);
 }
 
-int __init early_microcode_init(unsigned long *module_map,
-                                struct boot_info *bi)
+int __init early_microcode_init(struct boot_info *bi)
 {
     const struct cpuinfo_x86 *c = &boot_cpu_data;
     int rc = 0;
@@ -915,7 +911,7 @@ int __init early_microcode_init(unsigned long *module_map,
         return -ENODEV;
     }
 
-    microcode_grab_module(module_map, bi);
+    microcode_grab_module(bi);
 
     if ( ucode_mod || ucode_blob.size )
         rc = early_microcode_update_cpu();
diff --git a/xen/arch/x86/include/asm/microcode.h b/xen/arch/x86/include/asm/microcode.h
index 9e7c7ab004ed..917a861fd8f7 100644
--- a/xen/arch/x86/include/asm/microcode.h
+++ b/xen/arch/x86/include/asm/microcode.h
@@ -26,10 +26,8 @@ DECLARE_PER_CPU(struct cpu_signature, cpu_sig);
 void microcode_set_module(unsigned int idx);
 int microcode_update(
     XEN_GUEST_HANDLE(const_void) buf, unsigned long len, unsigned int flags);
-int early_microcode_init(
-    unsigned long *module_map, struct boot_info *bi);
-int microcode_init_cache(
-    unsigned long *module_map, struct boot_info *bi);
+int early_microcode_init(struct boot_info *bi);
+int microcode_init_cache(struct boot_info *bi);
 int microcode_update_one(void);
 
 #endif /* ASM_X86__MICROCODE_H */
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 153d361793c1..7fdbe57ca1c3 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1409,7 +1409,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
      * TODO: load ucode earlier once multiboot modules become accessible
      * at an earlier stage.
      */
-    early_microcode_init(module_map, bi);
+    early_microcode_init(bi);
 
     if ( xen_phys_start )
     {
@@ -1956,7 +1956,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 
     timer_init();
 
-    microcode_init_cache(module_map, bi); /* Needs xmalloc() */
+    microcode_init_cache(bi); /* Needs xmalloc() */
 
     tsx_init(); /* Needs microcode.  May change HLE/RTM feature bits. */
 
-- 
2.30.2


