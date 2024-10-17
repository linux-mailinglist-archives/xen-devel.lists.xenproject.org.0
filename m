Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA619A2A0E
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 19:04:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820832.1234471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1Tup-0007RO-Aw; Thu, 17 Oct 2024 17:03:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820832.1234471; Thu, 17 Oct 2024 17:03:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1Tup-0007Of-7o; Thu, 17 Oct 2024 17:03:59 +0000
Received: by outflank-mailman (input) for mailman id 820832;
 Thu, 17 Oct 2024 17:03:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KqF2=RN=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t1Tun-0006TN-0H
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 17:03:57 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9f0b45f-8ca9-11ef-99a3-01e77a169b0f;
 Thu, 17 Oct 2024 19:03:55 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729184617025693.5091672796183;
 Thu, 17 Oct 2024 10:03:37 -0700 (PDT)
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
X-Inumbo-ID: c9f0b45f-8ca9-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1729184619; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Gmtj6AN39W5taH+ZtDAgTM9cSAB3DsnuX0gmnoywqsFxdXHlLJ5cJsU3GtKhgZ3rc3wK+WFzOblQXuIHhbGRJnCQEIKhvTV49Nareno5T4bncVyOiOS67dDZX66glaBvQ3/pcTgT2FRFRr4XvRH4Smo61hPApzcAG5jE4V9jIs8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729184619; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ioXQiGftZuaa2y3+MlFiiL8tR31atQ3yfwKB0el8GZ8=; 
	b=VaJcEyEJjFdnj/N4MA3zPIYriY3qvUdSJQRZxarLxrJx4T1H5Uroq8obavFfiXf5maVkuwqQQ7IsVEogrxsB3zFwfZfMuV1VeTackddCBjmxxcbmOi4tyVzV12kBR+caetQJ5i7YxuBRZm47HenEJ4iio1AZ7Ng2vbIDRZ8k44Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729184619;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=ioXQiGftZuaa2y3+MlFiiL8tR31atQ3yfwKB0el8GZ8=;
	b=YGE1uQkAKaI6cNbuiw4DONdSlNhrnrPRcDhutefcGVvqF/us9MxGP8PD2Xerv1V4
	/eZCmxBWPa2Hi9Fv8+BqxxHtszqNRxDe9xeFfSBeiQUXa1aOhvKAeqWWd6TfUy753mw
	iKQrqN1W9yqhMz8KKCXKzMZpvTZ2FHTrwjHreD+c=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v6 02/44] x86/boot: move boot loader name to boot info
Date: Thu, 17 Oct 2024 13:02:42 -0400
Message-Id: <20241017170325.3842-3-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241017170325.3842-1-dpsmith@apertussolutions.com>
References: <20241017170325.3842-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Transition the incoming boot loader name to be held in struct boot_info.

No functional change intended.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
Changes since v5:
- reorder struct boot_module fields
- code style changes
---
 xen/arch/x86/include/asm/bootinfo.h |  2 ++
 xen/arch/x86/setup.c                | 16 ++++++++--------
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index a649500ee3a2..bec35e7c2f23 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -13,6 +13,8 @@
  * bootloader/environment, or derived from the information.
  */
 struct boot_info {
+    const char *loader;
+
     unsigned int nr_modules;
 };
 
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 6201ca0fad19..eac0954f42b8 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -285,6 +285,9 @@ static struct boot_info *__init multiboot_fill_boot_info(unsigned long mbi_p)
 
     bi->nr_modules = (mbi->flags & MBI_MODULES) ? mbi->mods_count : 0;
 
+    bi->loader = (mbi->flags & MBI_LOADERNAME) ? __va(mbi->boot_loader_name)
+                                               : "unknown";
+
     return bi;
 }
 
@@ -978,7 +981,7 @@ static struct domain *__init create_dom0(const module_t *image,
 
 void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 {
-    const char *memmap_type = NULL, *loader, *cmdline = "";
+    const char *memmap_type = NULL, *cmdline = "";
     char *kextra;
     void *bsp_stack;
     struct cpu_info *info = get_cpu_info(), *bsp_info;
@@ -1032,12 +1035,9 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 
     bi = multiboot_fill_boot_info(mbi_p);
 
-    loader = (mbi->flags & MBI_LOADERNAME) ? __va(mbi->boot_loader_name)
-                                           : "unknown";
-
     /* Parse the command-line options. */
     if ( mbi->flags & MBI_CMDLINE )
-        cmdline = cmdline_cook(__va(mbi->cmdline), loader);
+        cmdline = cmdline_cook(__va(mbi->cmdline), bi->loader);
 
     if ( (kextra = strstr(cmdline, " -- ")) != NULL )
     {
@@ -1078,7 +1078,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
     if ( pvh_boot )
         pvh_print_info();
 
-    printk("Bootloader: %s\n", loader);
+    printk("Bootloader: %s\n", bi->loader);
 
     printk("Command line: %s\n", cmdline);
 
@@ -1171,7 +1171,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
         l3_bootmap[l3_table_offset(BOOTSTRAP_MAP_BASE)] =
             l3e_from_paddr(__pa(l2_bootmap), __PAGE_HYPERVISOR);
 
-        memmap_type = loader;
+        memmap_type = bi->loader;
     }
     else if ( efi_enabled(EFI_BOOT) )
         memmap_type = "EFI";
@@ -2039,7 +2039,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
      */
     dom0 = create_dom0(mod, modules_headroom,
                        initrdidx < bi->nr_modules ? mod + initrdidx : NULL,
-                       kextra, loader);
+                       kextra, bi->loader);
     if ( !dom0 )
         panic("Could not set up DOM0 guest OS\n");
 
-- 
2.30.2


