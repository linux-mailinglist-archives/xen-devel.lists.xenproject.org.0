Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB50966B7F
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 23:48:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786664.1196297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9Tn-0006Gy-RE; Fri, 30 Aug 2024 21:48:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786664.1196297; Fri, 30 Aug 2024 21:48:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9Tn-0006FR-Me; Fri, 30 Aug 2024 21:48:27 +0000
Received: by outflank-mailman (input) for mailman id 786664;
 Fri, 30 Aug 2024 21:48:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiG6=P5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sk9Tm-00065G-3m
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 21:48:26 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 93724ef6-6719-11ef-a0b1-8be0dac302b0;
 Fri, 30 Aug 2024 23:48:23 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: by mx.zohomail.com with SMTPS id 1725054465277157.3636748835229;
 Fri, 30 Aug 2024 14:47:45 -0700 (PDT)
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
X-Inumbo-ID: 93724ef6-6719-11ef-a0b1-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1725054467; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hkPK0sEs6w6MyzjfL5eePRMtOl+7XRDZXnXEysR6hOmPZQp0i+YqQHaopu079OxveECVPhSL9jqzwNax5Z6hyI/xw7d+eXO3fthnnZvNpKjEgS2jUHN9zBOn3s63OpOYSh6m1JBYxXOg1cSJCvophvdgaza9z47Fv6XREhpyMEM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1725054467; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=mTJb7A779pFDFU65rSxPgwx1Pg9D5EASEmZIOVhMBEs=; 
	b=hFIlEOzWBo5HwsMzBvPdqr6stCKeAeAK6RteSAIa2+Mom5JQSymXgd+e3NkL7xp4uNTCJfbq6+7SMcpb0gxazsElqTTzrnIKKBKRyxK/Ak5LIY3O42T9Ua+Fn5o9shioPpyU0mO8GS2psmjELq94h+lwxz/uwrnlZRKLiSzUSyY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725054467;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=mTJb7A779pFDFU65rSxPgwx1Pg9D5EASEmZIOVhMBEs=;
	b=BnDNhT6E9IBxgN1VXSPCDDdxGikEmeMUGoqL9KYXIeObS5b5kpkTR5msUBxhNbmy
	6kY/dk05jjaEQVwq9gL2a0Mp/UtNVS8+m03p9EhZx1PCitPVB+iuHxGyPD7VLCKGwC6
	xiACIYvbAf4JE8euEXCZAB7GkkYX+m8PGb/3Ftms=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 05/44] x86/boot: introduce struct boot_module
Date: Fri, 30 Aug 2024 17:46:50 -0400
Message-Id: <20240830214730.1621-6-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240830214730.1621-1-dpsmith@apertussolutions.com>
References: <20240830214730.1621-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This will introduce a new struct boot_module to provide a rich state
representation around modules provided by the boot loader. Support is for 64
boot modules, one held in reserve for Xen, and up to 63 can be provided by the
boot loader. The array of struct boot_modules will be accessible via a
reference held in struct boot_info.

A temporary `early_mod` parameter is included in struct boot_module to ease the
transition from using Multiboot v1 structures over to struct boot_module. Once
the transition is complete, the parameter will be dropped from the structure.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/include/asm/bootinfo.h |  6 ++++++
 xen/arch/x86/setup.c                | 19 ++++++++++++++++---
 2 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index e785ed1c5982..844262495962 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -8,10 +8,16 @@
 #ifndef __XEN_X86_BOOTINFO_H__
 #define __XEN_X86_BOOTINFO_H__
 
+#include <xen/multiboot.h>
 #include <xen/types.h>
 
+struct boot_module {
+    module_t *early_mod;
+};
+
 struct boot_info {
     unsigned int nr_mods;
+    struct boot_module *mods;
 
     const char *boot_loader_name;
     const char *cmdline;
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index c6b45ced00ae..28fdbf4d4c2b 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -278,12 +278,17 @@ custom_param("acpi", parse_acpi_param);
 
 static const char *cmdline_cook(const char *p, const char *loader_name);
 
+/* Max number of boot modules a bootloader can provide in addition to Xen */
+#define MAX_NR_BOOTMODS 63
+
 static const module_t *__initdata initial_images;
 static struct boot_info __initdata *boot_info;
 
-static void __init multiboot_to_bootinfo(multiboot_info_t *mbi)
+static void __init multiboot_to_bootinfo(multiboot_info_t *mbi, module_t *mods)
 {
     static struct boot_info __initdata info;
+    static struct boot_module __initdata boot_mods[MAX_NR_BOOTMODS + 1];
+    unsigned int i;
 
     info.nr_mods = mbi->mods_count;
 
@@ -303,6 +308,14 @@ static void __init multiboot_to_bootinfo(multiboot_info_t *mbi)
         info.mmap_length = mbi->mmap_length;
     }
 
+    info.mods = boot_mods;
+
+    for ( i=0; i < info.nr_mods; i++ )
+        boot_mods[i].early_mod = &mods[i];
+
+    /* map the last mb module for xen entry */
+    boot_mods[info.nr_mods].early_mod = &mods[info.nr_mods];
+
     boot_info = &info;
 }
 
@@ -1062,7 +1075,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
         mod = __va(mbi->mods_addr);
     }
 
-    multiboot_to_bootinfo(mbi);
+    multiboot_to_bootinfo(mbi, mod);
 
     if ( (kextra = strstr(boot_info->cmdline, " -- ")) != NULL )
     {
@@ -1164,7 +1177,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
            bootsym(boot_edd_info_nr));
 
     /* Check that we have at least one Multiboot module. */
-    if ( !(mbi->flags & MBI_MODULES) || (boot_info->nr_mods == 0) )
+    if ( boot_info->nr_mods == 0 )
         panic("dom0 kernel not specified. Check bootloader configuration\n");
 
     /* Check that we don't have a silly number of modules. */
-- 
2.30.2


