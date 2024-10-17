Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF0D9A2A35
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 19:06:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820874.1234541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1TxD-0002xK-7W; Thu, 17 Oct 2024 17:06:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820874.1234541; Thu, 17 Oct 2024 17:06:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1TxD-0002v7-4r; Thu, 17 Oct 2024 17:06:27 +0000
Received: by outflank-mailman (input) for mailman id 820874;
 Thu, 17 Oct 2024 17:06:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KqF2=RN=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t1Tw4-0006TN-Dx
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 17:05:16 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f9430893-8ca9-11ef-99a3-01e77a169b0f;
 Thu, 17 Oct 2024 19:05:14 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729184628693714.7111287097858;
 Thu, 17 Oct 2024 10:03:48 -0700 (PDT)
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
X-Inumbo-ID: f9430893-8ca9-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1729184631; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PqX/pyk6X/pI9ldvPH5cVFcVKKcRotmmkSVyyRetCm6EY+W+GXe6GedXJqODel6E9ZT8IDERd6OGwVB5khKFsmUCJdcfzHUU5J4vO0PK2f/LHOIZmn7utQmGiXHmN9DlrhxNOXViMoaIhNb8zpEYX2YsIHr5oos83ioy7rL1YD4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729184631; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=jMznZ4/Qnb47L6uS5Mep6oH/AOXeu1gaoH+gJ/apC6A=; 
	b=Q7XLJYKaSTBdJ9nU9OIJaOLc3CZ3xZDIQHHUK1kfIM0nJeKEwWWJUThvg14rZ8r9j8MkwN5xPdPz+UfBZsPUV7E1xPZ2/kviJ116leNKlWNCwZ9W3kFMAKju+ssNUq3R9QeFZyY2e/p0ouTmmYFf3y+iBejLwMWVNp/9MnIAz1k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729184631;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=jMznZ4/Qnb47L6uS5Mep6oH/AOXeu1gaoH+gJ/apC6A=;
	b=oqszHDl5zgvb+fvQ1+Ix9i1lHgNhHIGLAdOVfg+SmLYzC9AKX6dssJ9UAeXeL2fX
	08zzCNWIm4+p5swcAYigZJ5ZdxN2Bs+KyRKNgcA9aBnfa9LkuxcTRAuKFTk4I1X7OR4
	9MiXrP+4fcXYknOl5YFxo2fKGJGavMpZBraj76Vw=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: Jan Beulich <jbeulich@suse.com>,
	xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v6 11/44] x86/boot: add start and size fields to struct boot_module
Date: Thu, 17 Oct 2024 13:02:51 -0400
Message-Id: <20241017170325.3842-12-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241017170325.3842-1-dpsmith@apertussolutions.com>
References: <20241017170325.3842-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This commit introduces the start and size fields to struct boot_module and
assigns their value during boot_info construction.

The EFI entry point special cased itself, and pre-converted mod_start and
mod_end to mfn and size respectively. This required an additional test
in the coversion loop to not convert mod_start and mod_end when the conversion
was done for both the multiboot and PVH boot entry points. To simplify the
logic populating the start and size fields, the EFI module population logic
was coverted to using start and end addresses.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
Changes since v5:
- switched EFI population of mod_start/mod_end to addresses
---
 xen/arch/x86/efi/efi-boot.h         | 4 ++--
 xen/arch/x86/include/asm/bootinfo.h | 3 +++
 xen/arch/x86/setup.c                | 7 ++++++-
 3 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index 94f34433640f..779f101c3de7 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -732,8 +732,8 @@ static void __init efi_arch_handle_module(const struct file *file,
     if ( options )
         place_string(&mb_modules[mbi.mods_count].string, options);
     place_string(&mb_modules[mbi.mods_count].string, local_name.s);
-    mb_modules[mbi.mods_count].mod_start = file->addr >> PAGE_SHIFT;
-    mb_modules[mbi.mods_count].mod_end = file->size;
+    mb_modules[mbi.mods_count].mod_start = file->addr;
+    mb_modules[mbi.mods_count].mod_end = file->addr + file->size;
     ++mbi.mods_count;
     efi_bs->FreePool(ptr);
 }
diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index e8ba9390a51f..5862054b8cef 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -42,6 +42,9 @@ struct boot_module {
 
     uint32_t flags;
 #define BOOTMOD_FLAG_X86_RELOCATED     (1U << 0)
+
+    paddr_t start;
+    size_t size;
 };
 
 /*
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index f87faa31a2cf..6ee352fc0cde 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -309,8 +309,13 @@ static struct boot_info *__init multiboot_fill_boot_info(unsigned long mbi_p)
      * reserved for Xen itself
      */
     for ( i = 0; i <= bi->nr_modules; i++ )
+    {
         bi->mods[i].mod = &mods[i];
 
+        bi->mods[i].start = (paddr_t)mods[i].mod_start;
+        bi->mods[i].size = mods[i].mod_end - mods[i].mod_start;
+    }
+
     /* map the last mb module for xen entry */
     bi->mods[bi->nr_modules].type = BOOTMOD_XEN;
 
@@ -1351,7 +1356,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
      */
     initial_images = bi->mods[0].mod;
 
-    for ( i = 0; !efi_enabled(EFI_LOADER) && i < bi->nr_modules; i++ )
+    for ( i = 0; i < bi->nr_modules; i++ )
     {
         if ( bi->mods[i].mod->mod_start & (PAGE_SIZE - 1) )
             panic("Bootloader didn't honor module alignment request\n");
-- 
2.30.2


