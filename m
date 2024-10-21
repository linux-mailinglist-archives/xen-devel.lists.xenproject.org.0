Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA959A5849
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 02:50:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.822930.1236894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2gcr-0006VO-7T; Mon, 21 Oct 2024 00:50:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 822930.1236894; Mon, 21 Oct 2024 00:50:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2gcr-0006Sl-4k; Mon, 21 Oct 2024 00:50:25 +0000
Received: by outflank-mailman (input) for mailman id 822930;
 Mon, 21 Oct 2024 00:50:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q0x4=RR=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t2gcq-0006SZ-8Y
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 00:50:24 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72bfce43-8f46-11ef-99a3-01e77a169b0f;
 Mon, 21 Oct 2024 02:50:22 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729471619758245.98953686943776;
 Sun, 20 Oct 2024 17:46:59 -0700 (PDT)
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
X-Inumbo-ID: 72bfce43-8f46-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1729471622; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=IRqZaQ4+kh/HRypaOU5C5US+K0CJvsmhAIFWyD4SbQ8osnR2ivVgxks1gf52rW3J2X0mJo2rMgB2BGKmwXXv2L5/BS73P9i/kGlW1NwFIu75IrEFeObVnwUlJ3pYuvAmjswTJb3XLfBrO0j0ih+YdavyQ6rwLusYmr1qrzpIyJw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729471622; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Jx51Zf1zwygUUllbZAd+b9gYxFDST6JrxccGSqHc+vc=; 
	b=HUbtKCinlxiyjKm2U/HqD/m266ijeF9U5/81vdsyTWqjHOqgbkAx/LAmHW1dZCOpBAdliHhYUZlqy4lFa4ggk+3AZZ5soxbVzrQdpi5EcYIudxSTlzj/mvDOZ1l5UpjfCZ80pz0fABAOtkP59VRcR01UVyvRYyxA5avq25Aj8kI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729471622;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=Jx51Zf1zwygUUllbZAd+b9gYxFDST6JrxccGSqHc+vc=;
	b=IHCOGVlafenqtX/hDFMkmGm89FkiB7nolG3pT236cn0cBDr3plYLAuXefKNoLmkA
	24ZAizCLX6VUoFKVKdblOYxo/YUNTRHjRs0moa23Ueoch/K9FoyVVvwAzBCavaBF1qK
	TagzaIh3wBeZES4/3Iz2BoHDZEQHEcTRf884iBpI=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v7 31/38] x86/boot: remove mod from struct boot_module
Date: Sun, 20 Oct 2024 20:46:06 -0400
Message-Id: <20241021004613.18793-32-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241021004613.18793-1-dpsmith@apertussolutions.com>
References: <20241021004613.18793-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

With all references to mod field removed, remove the mod field from struct
boot_module.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
 xen/arch/x86/include/asm/bootinfo.h | 4 ----
 xen/arch/x86/setup.c                | 3 ---
 2 files changed, 7 deletions(-)

diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index 941363601db7..eaed99b64e57 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -8,7 +8,6 @@
 #ifndef X86_BOOTINFO_H
 #define X86_BOOTINFO_H
 
-#include <xen/multiboot.h>
 #include <xen/types.h>
 
 /* Max number of boot modules a bootloader can provide in addition to Xen */
@@ -25,9 +24,6 @@ enum bootmod_type {
 };
 
 struct boot_module {
-    /* Transitionary only */
-    module_t *mod;
-
     /*
      * A boot module may contain a compressed kernel that will require
      * additional space, before the module data, into which the kernel will be
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 2102923cd510..1fda462ba1d0 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -314,8 +314,6 @@ static struct boot_info *__init multiboot_fill_boot_info(unsigned long mbi_p)
      */
     for ( i = 0; i < MAX_NR_BOOTMODS && i < bi->nr_modules; i++ )
     {
-        bi->mods[i].mod = &mods[i];
-
         bi->mods[i].cmdline = (paddr_t)mods[i].string;
 
         if ( !efi_enabled(EFI_LOADER) )
@@ -331,7 +329,6 @@ static struct boot_info *__init multiboot_fill_boot_info(unsigned long mbi_p)
     }
 
     /* Variable 'i' should be one entry past the last module. */
-    bi->mods[i].mod = &mods[bi->nr_modules];
     bi->mods[i].start = mods[i].mod_start;
     bi->mods[i].size = mods[i].mod_end - mods[i].mod_start;
     bi->mods[i].type = BOOTMOD_XEN;
-- 
2.30.2


