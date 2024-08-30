Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E50A966B7E
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 23:48:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786657.1196287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9Td-0005iR-FI; Fri, 30 Aug 2024 21:48:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786657.1196287; Fri, 30 Aug 2024 21:48:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9Td-0005di-8o; Fri, 30 Aug 2024 21:48:17 +0000
Received: by outflank-mailman (input) for mailman id 786657;
 Fri, 30 Aug 2024 21:48:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiG6=P5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sk9Tc-0004BO-3H
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 21:48:16 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e3c4ba0-6719-11ef-99a1-01e77a169b0f;
 Fri, 30 Aug 2024 23:48:14 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: by mx.zohomail.com with SMTPS id 1725054464189234.4870791649007;
 Fri, 30 Aug 2024 14:47:44 -0700 (PDT)
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
X-Inumbo-ID: 8e3c4ba0-6719-11ef-99a1-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1725054466; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GCB88FNkVAkVJ4OErzRK+V0XldeNho6qax4qz6noXdyBPG+ZAZnwX9dhj0fBKxmgtsHfJryPRpR2X8e/kS/NQzK3rnNmBK8tJ71U1lZjsHcNWa8EVJeVFlTI9PXxEdql7U7vIId4Tg21Fnj8GUmNAV2SC0fslgMKHqHBQ5jy1/8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1725054466; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=AHDLb8T/b80h/7jv5pdrXG2adOVOnBNwTs0CHWLNuOc=; 
	b=Scg75RdV6n6c7HabrT/rBUhqT/e7pXIXZnfox1qAgmkzEhp3nkLluGFwHQGv5mlTEO603hc5MbAAvLhtFhtQMJegvxX218U/sCfc3dzGWL8H+j+O6ZVXHRQOymGekBx7CmyPbe0Wn9nJOgPdxTEqqDg3UvnoOzZG8lNQvcsOkpM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725054466;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=AHDLb8T/b80h/7jv5pdrXG2adOVOnBNwTs0CHWLNuOc=;
	b=X1YUFfg/0Gkk09gpid6a1UXiO/0l3eDj08+fSxYHIxheOGJHh8uxik4mGZemS9X7
	DhfYvj6pFSP7crpfiAvd/PKM0yQgmQ3X9bnI1Kzg+VT6NK/fIkdOIFrKqu791PxFD6E
	LEKVCa7zdRbCstp3wa9P0IFqhuOrmwZ8vpm3WzAs=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 04/44] x86/boot: move mmap info to boot info
Date: Fri, 30 Aug 2024 17:46:49 -0400
Message-Id: <20240830214730.1621-5-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240830214730.1621-1-dpsmith@apertussolutions.com>
References: <20240830214730.1621-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Transition the memory map info to be held in struct boot_info.

No functional change intended.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/include/asm/bootinfo.h |  5 +++++
 xen/arch/x86/setup.c                | 12 +++++++++---
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index d2ca077d2356..e785ed1c5982 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -8,11 +8,16 @@
 #ifndef __XEN_X86_BOOTINFO_H__
 #define __XEN_X86_BOOTINFO_H__
 
+#include <xen/types.h>
+
 struct boot_info {
     unsigned int nr_mods;
 
     const char *boot_loader_name;
     const char *cmdline;
+
+    paddr_t mmap_addr;
+    uint32_t mmap_length;
 };
 
 #endif
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index a945fa10555f..c6b45ced00ae 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -297,6 +297,12 @@ static void __init multiboot_to_bootinfo(multiboot_info_t *mbi)
     else
         info.cmdline = "";
 
+    if ( mbi->flags & MBI_MEMMAP )
+    {
+        info.mmap_addr = mbi->mmap_addr;
+        info.mmap_length = mbi->mmap_length;
+    }
+
     boot_info = &info;
 }
 
@@ -1200,13 +1206,13 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
     {
         memmap_type = "Xen-e820";
     }
-    else if ( mbi->flags & MBI_MEMMAP )
+    else if ( boot_info->mmap_addr )
     {
         memmap_type = "Multiboot-e820";
-        while ( bytes < mbi->mmap_length &&
+        while ( bytes < boot_info->mmap_length &&
                 e820_raw.nr_map < ARRAY_SIZE(e820_raw.map) )
         {
-            memory_map_t *map = __va(mbi->mmap_addr + bytes);
+            memory_map_t *map = __va(boot_info->mmap_addr + bytes);
 
             /*
              * This is a gross workaround for a BIOS bug. Some bootloaders do
-- 
2.30.2


