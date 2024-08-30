Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B496966BB8
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 23:57:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786849.1196683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9c5-0003u4-Ce; Fri, 30 Aug 2024 21:57:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786849.1196683; Fri, 30 Aug 2024 21:57:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9c5-0003ml-1G; Fri, 30 Aug 2024 21:57:01 +0000
Received: by outflank-mailman (input) for mailman id 786849;
 Fri, 30 Aug 2024 21:56:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiG6=P5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sk9X8-0000Zf-E8
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 21:51:54 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 105c3a69-671a-11ef-99a1-01e77a169b0f;
 Fri, 30 Aug 2024 23:51:52 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: by mx.zohomail.com with SMTPS id 1725054495605114.11610584368918;
 Fri, 30 Aug 2024 14:48:15 -0700 (PDT)
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
X-Inumbo-ID: 105c3a69-671a-11ef-99a1-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1725054497; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Gcr2dQXwBERTqwQcwuFqX+lzCerzO8XkQcP00CFR8FHA7WkZsU5OZl/tSbJ6xokX8yIQaqPwbKPnnKSFU3+FDmPYrroMmTT7EIbRSB1hCj1B2F7Dqdp6jIvuHC+d1QeaBg3Wg3PbaQgGy6VBirYlHZG+6LOLWAGblN6I4dvpv+w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1725054497; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=mt1dRXz36GBmL3hIsTAQ0JnOmkyCwzbvQkCGLSUmMkc=; 
	b=FJ8YmX0BEzPNKHpNrYWufWrkbbnWhojfiAR5cey0btEdiFOHYip0W0ffEuvAY174ypyu2eOCRDns8f6ZAfNj3oLNotBXqL0kwk3GA5ts+k1c4PfDBkejJF2nJSZff5K5FHNqp8fEXbmnhLDygJa+DA0p+3oB4EXKiyQwHbTQzfM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725054497;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=mt1dRXz36GBmL3hIsTAQ0JnOmkyCwzbvQkCGLSUmMkc=;
	b=udtZAvomEEfPM104ld7VCW2/Vcvybqvg17RTZGeXlJUmmEtv78yAg9+YoYmY5I0b
	nFjPqtKy6uhuyaFQdP8t+XcumC4aBwlLf+vkU9uSeeMaiY7Y7YAGuCN7JJODmzftQRb
	uRl3pd0TEkpUAx1nw1gvZZVORxrF6uJCXzpTx3qY=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 33/44] x86/boot: convert initial_images to struct boot_module
Date: Fri, 30 Aug 2024 17:47:18 -0400
Message-Id: <20240830214730.1621-34-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240830214730.1621-1-dpsmith@apertussolutions.com>
References: <20240830214730.1621-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The variable initial_images is used for tracking the boot modules passed in by
the boot loader. Convert to a struct boot_module and adjust the code that uses
it accordingly.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/setup.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 8ba32c6b6bfa..77c0833dd441 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -281,7 +281,7 @@ static const char *cmdline_cook(const char *p, const char *loader_name);
 /* Max number of boot modules a bootloader can provide in addition to Xen */
 #define MAX_NR_BOOTMODS 63
 
-static const module_t *__initdata initial_images;
+static const struct boot_module *__initdata initial_images;
 static struct boot_info __initdata *boot_info;
 
 static void __init multiboot_to_bootinfo(multiboot_info_t *mbi, module_t *mods)
@@ -337,8 +337,9 @@ unsigned long __init initial_images_nrpages(nodeid_t node)
 
     for ( nr = i = 0; i < boot_info->nr_mods; ++i )
     {
-        unsigned long start = initial_images[i].mod_start;
-        unsigned long end = start + PFN_UP(initial_images[i].mod_end);
+        unsigned long start = initial_images[i].early_mod->mod_start;
+        unsigned long end = start +
+                            PFN_UP(initial_images[i].early_mod->mod_end);
 
         if ( end > node_start && node_end > start )
             nr += min(node_end, end) - max(node_start, start);
@@ -353,10 +354,12 @@ void __init discard_initial_images(void)
 
     for ( i = 0; i < boot_info->nr_mods; ++i )
     {
-        uint64_t start = (uint64_t)initial_images[i].mod_start << PAGE_SHIFT;
+        uint64_t start =
+            (uint64_t)initial_images[i].early_mod->mod_start << PAGE_SHIFT;
 
         init_domheap_pages(start,
-                           start + PAGE_ALIGN(initial_images[i].mod_end));
+                           start +
+                           PAGE_ALIGN(initial_images[i].early_mod->mod_end));
     }
 
     boot_info->nr_mods = 0;
@@ -1396,7 +1399,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
     set_kexec_crash_area_size((u64)nr_pages << PAGE_SHIFT);
     kexec_reserve_area();
 
-    initial_images = boot_info->mods[0].early_mod;
+    initial_images = boot_info->mods;
 
     for ( i = 0; !efi_enabled(EFI_LOADER) && i < boot_info->nr_mods; i++ )
     {
-- 
2.30.2


