Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27265966B7B
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 23:48:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786652.1196267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9TN-0004mF-QS; Fri, 30 Aug 2024 21:48:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786652.1196267; Fri, 30 Aug 2024 21:48:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9TN-0004iu-NN; Fri, 30 Aug 2024 21:48:01 +0000
Received: by outflank-mailman (input) for mailman id 786652;
 Fri, 30 Aug 2024 21:48:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiG6=P5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sk9TM-0004BO-Ro
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 21:48:00 +0000
Received: from sender3-of-o57.zoho.com (sender3-of-o57.zoho.com
 [136.143.184.57]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8533de97-6719-11ef-99a1-01e77a169b0f;
 Fri, 30 Aug 2024 23:47:59 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: by mx.zohomail.com with SMTPS id 17250544619691020.6911507983529;
 Fri, 30 Aug 2024 14:47:41 -0700 (PDT)
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
X-Inumbo-ID: 8533de97-6719-11ef-99a1-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1725054464; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=k1d4FRK7F8uwIJpTqyE+y8FsdfwNHiKb4oG6Oj8svyS1Mx4mDuDzj19fAv+wcAmM2M39G8drszEFyHOiFTG6mwqy/QERRlEgF81z7KCQw7mU3Xf6zYH1p0TLX6TEiA8XknDnJoM8tH/ySx3fLc6rBSm9qZ4BxHP7hOuO2tnqc+g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1725054464; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=KAESHRPaE5VWyf1xY+l5m4fxgSkS1FQVX7bHFI04M2Y=; 
	b=R7s9lqaXfp3RhPrhyRGwVnNU8DPAuxC7iNMeymPgEDC+t5G3AHbojj351+eycFhBc+e0SosR6a2pyhOva+H1Dqt1qn5JLxJgzXdsZFWVLTfRMkdhmzw9Uvl0H0PVdLaElz6gYLi+/bSAjBeFu7i5vli00Qx3ueakrcGNnb/VQQw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725054464;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=KAESHRPaE5VWyf1xY+l5m4fxgSkS1FQVX7bHFI04M2Y=;
	b=T0tOh+gFQViOt10PluDy2w7iaysThBZ5A1a3OMU14qMJs2f9DaSBNrdVV6804hfw
	QcuGVnmJzdePaI7RlJ+/Db2p7hKfPkZGl17xOBGQJy/12DhpRvcoHJC2foVDCAqqv56
	TC0Ns/xjvRu1xtGzSXiQkbOA1dVPIYtPo8FEEhmY=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 02/44] x86/boot: move boot loader name to boot info
Date: Fri, 30 Aug 2024 17:46:47 -0400
Message-Id: <20240830214730.1621-3-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240830214730.1621-1-dpsmith@apertussolutions.com>
References: <20240830214730.1621-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Transition the incoming boot loader name to be held in struct boot_info.

No functional change intended.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/include/asm/bootinfo.h |  2 ++
 xen/arch/x86/setup.c                | 15 ++++++++-------
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index e850f80d26a7..e69feb1bb8be 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -10,6 +10,8 @@
 
 struct boot_info {
     unsigned int nr_mods;
+
+    const char *boot_loader_name;
 };
 
 #endif
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index dd94ee2e736b..432b7d1701e4 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -285,6 +285,9 @@ static void __init multiboot_to_bootinfo(multiboot_info_t *mbi)
 
     info.nr_mods = mbi->mods_count;
 
+    info.boot_loader_name = (mbi->flags & MBI_LOADERNAME) ?
+                            __va(mbi->boot_loader_name) : "unknown";
+
     boot_info = &info;
 }
 
@@ -993,7 +996,7 @@ static struct domain *__init create_dom0(const module_t *image,
 
 void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 {
-    const char *memmap_type = NULL, *loader, *cmdline = "";
+    const char *memmap_type = NULL, *cmdline = "";
     char *kextra;
     void *bsp_stack;
     struct cpu_info *info = get_cpu_info(), *bsp_info;
@@ -1046,11 +1049,9 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 
     multiboot_to_bootinfo(mbi);
 
-    loader = (mbi->flags & MBI_LOADERNAME) ? __va(mbi->boot_loader_name)
-                                           : "unknown";
     /* Parse the command-line options. */
     if ( mbi->flags & MBI_CMDLINE )
-        cmdline = cmdline_cook(__va(mbi->cmdline), loader);
+        cmdline = cmdline_cook(__va(mbi->cmdline), boot_info->boot_loader_name);
 
     if ( (kextra = strstr(cmdline, " -- ")) != NULL )
     {
@@ -1091,7 +1092,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
     if ( pvh_boot )
         pvh_print_info();
 
-    printk("Bootloader: %s\n", loader);
+    printk("Bootloader: %s\n", boot_info->boot_loader_name);
 
     printk("Command line: %s\n", cmdline);
 
@@ -1184,7 +1185,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
         l3_bootmap[l3_table_offset(BOOTSTRAP_MAP_BASE)] =
             l3e_from_paddr(__pa(l2_bootmap), __PAGE_HYPERVISOR);
 
-        memmap_type = loader;
+        memmap_type = boot_info->boot_loader_name;
     }
     else if ( efi_enabled(EFI_BOOT) )
         memmap_type = "EFI";
@@ -2054,7 +2055,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
      */
     dom0 = create_dom0(mod, modules_headroom,
                        initrdidx < boot_info->nr_mods ? mod + initrdidx : NULL,
-                       kextra, loader);
+                       kextra, boot_info->boot_loader_name);
     if ( !dom0 )
         panic("Could not set up DOM0 guest OS\n");
 
-- 
2.30.2


