Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D56966BAF
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 23:56:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786797.1196606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9bl-0007HB-4y; Fri, 30 Aug 2024 21:56:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786797.1196606; Fri, 30 Aug 2024 21:56:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9bk-0007DG-JA; Fri, 30 Aug 2024 21:56:40 +0000
Received: by outflank-mailman (input) for mailman id 786797;
 Fri, 30 Aug 2024 21:56:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiG6=P5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sk9XF-0000Zf-FX
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 21:52:01 +0000
Received: from sender3-of-o57.zoho.com (sender3-of-o57.zoho.com
 [136.143.184.57]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1499de74-671a-11ef-99a1-01e77a169b0f;
 Fri, 30 Aug 2024 23:51:59 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: by mx.zohomail.com with SMTPS id 1725054496865249.05797085453992;
 Fri, 30 Aug 2024 14:48:16 -0700 (PDT)
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
X-Inumbo-ID: 1499de74-671a-11ef-99a1-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1725054498; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aGjcaSKDQL6x6+3QXUmV2Efhk+Exo2aZVhqZKyiTLSvnpZoEV1d7orOqC+I/1CHv3YTpdq/AFhRB+xnYdPzoHTUjCLqe7t6bLZ/WGGgY6KSbSrrxUxjiySvnldRwfLvngOGKiFyQxJgj/goM6cVMlWPBjqW26UKsvLgdbHyeABg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1725054498; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=p5o3cV7jLCbs9cI7Hw5PLo3huoAejKeUL5qr3Pk5iyM=; 
	b=SHVdUAjdxF3eFlZ44wPBx//nBDmPRuqv3dIURtO5dEgYYIVGTA4e0Zs6Xg5/KfwtqXyXvGWrgZTnBq1fVI44JCeFqHkFrN4T1st/7Y5YCJJ/HPCDYJx6u98d3ykVfVHTdkJZKnKkbzHZ2zVQMkj14VgbDI3VjY1vHR2INhr00Uc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725054498;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=p5o3cV7jLCbs9cI7Hw5PLo3huoAejKeUL5qr3Pk5iyM=;
	b=rT6h3CC64FDRJJ0kWqC7zOjjBZg+0sL5owrewS3VPHxPEazX5lxfySujcSw5+Zzs
	xi8P1bRN4n+QH+8Kw2Up/BZzdGSqRAoF2G6k/0D684i5BurXgnV19f/jwbaNGDuSuCR
	NbhBYLJccCfj7AaVYZVLwdqz9ieuDDLM2nHL1cXQ=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 34/44] x86/boot: drop the use of initial_images unit global
Date: Fri, 30 Aug 2024 17:47:19 -0400
Message-Id: <20240830214730.1621-35-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240830214730.1621-1-dpsmith@apertussolutions.com>
References: <20240830214730.1621-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/setup.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 77c0833dd441..977b68098694 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -281,7 +281,6 @@ static const char *cmdline_cook(const char *p, const char *loader_name);
 /* Max number of boot modules a bootloader can provide in addition to Xen */
 #define MAX_NR_BOOTMODS 63
 
-static const struct boot_module *__initdata initial_images;
 static struct boot_info __initdata *boot_info;
 
 static void __init multiboot_to_bootinfo(multiboot_info_t *mbi, module_t *mods)
@@ -337,9 +336,9 @@ unsigned long __init initial_images_nrpages(nodeid_t node)
 
     for ( nr = i = 0; i < boot_info->nr_mods; ++i )
     {
-        unsigned long start = initial_images[i].early_mod->mod_start;
+        unsigned long start = boot_info->mods[i].early_mod->mod_start;
         unsigned long end = start +
-                            PFN_UP(initial_images[i].early_mod->mod_end);
+                            PFN_UP(boot_info->mods[i].early_mod->mod_end);
 
         if ( end > node_start && node_end > start )
             nr += min(node_end, end) - max(node_start, start);
@@ -355,15 +354,14 @@ void __init discard_initial_images(void)
     for ( i = 0; i < boot_info->nr_mods; ++i )
     {
         uint64_t start =
-            (uint64_t)initial_images[i].early_mod->mod_start << PAGE_SHIFT;
+            (uint64_t)boot_info->mods[i].early_mod->mod_start << PAGE_SHIFT;
 
         init_domheap_pages(start,
                            start +
-                           PAGE_ALIGN(initial_images[i].early_mod->mod_end));
+                           PAGE_ALIGN(boot_info->mods[i].early_mod->mod_end));
     }
 
     boot_info->nr_mods = 0;
-    initial_images = NULL;
 }
 
 static void __init init_idle_domain(void)
@@ -1399,8 +1397,6 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
     set_kexec_crash_area_size((u64)nr_pages << PAGE_SHIFT);
     kexec_reserve_area();
 
-    initial_images = boot_info->mods;
-
     for ( i = 0; !efi_enabled(EFI_LOADER) && i < boot_info->nr_mods; i++ )
     {
         if ( boot_info->mods[i].early_mod->mod_start & (PAGE_SIZE - 1) )
-- 
2.30.2


