Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9629E9921E3
	for <lists+xen-devel@lfdr.de>; Sun,  6 Oct 2024 23:57:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.811403.1224179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZFV-0002xe-4H; Sun, 06 Oct 2024 21:57:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 811403.1224179; Sun, 06 Oct 2024 21:57:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZFU-0002ud-Uv; Sun, 06 Oct 2024 21:57:08 +0000
Received: by outflank-mailman (input) for mailman id 811403;
 Sun, 06 Oct 2024 21:57:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qR5E=RC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sxZ9U-0006RM-VL
 for xen-devel@lists.xenproject.org; Sun, 06 Oct 2024 21:50:56 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e969338-842d-11ef-a0bb-8be0dac302b0;
 Sun, 06 Oct 2024 23:50:54 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1728251410008152.1502674267898;
 Sun, 6 Oct 2024 14:50:10 -0700 (PDT)
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
X-Inumbo-ID: 0e969338-842d-11ef-a0bb-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1728251412; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VTL42CyW2Td8CIuc8CEiCsM7s42uJYyrxQuZwcET4dOSm2LMiogBUUrD/mYhwRTPSHdD9ew9s0MigvGLbLu8+rMSinr578ZaiWjjJRR60yHcnpy9GP8UxuUpg4eQEWKvnzBOrVvsxMOiSjd3JaF/Jrmd3YfKWFHFE16GJYv5EmI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728251412; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=x/0pbSRKvsD7gGf1XEw1gxRP4YoiCChfwLPAVJ7btAM=; 
	b=K29Tpnma1Y/rrhq2MO2DDBPuSBvMxy+s18+q9EFUD8UCqxJlEhg4Z3ZQUH4WdQF8DIeOGtzSHKYTrGbkzoK36IM5KB98KfMe30/P14pUgbXozOpi3Xv6ZqKeDCy9ZYUU50u4Kt2y4aTA97ipRCP+ZrJ+vRvgrGujdpReo/dxFqU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728251412;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=x/0pbSRKvsD7gGf1XEw1gxRP4YoiCChfwLPAVJ7btAM=;
	b=srtDDtbUkOrvDVA12dRaCHk/xDFPGWM4XYGwGQKn4yQY84azTqhzog5sOGUhT9SU
	ShyNKLmxyCyliVtn2WYt73Q7xcS4/lqjcNUjOGLWjv8VA83cB2qu4w3vuL77y0s12cH
	QDDhnUyjkZMcxj9aChka9jB0sDOEJcyOKANgFv6U=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 05/44] x86/boot: introduce struct boot_module
Date: Sun,  6 Oct 2024 17:49:16 -0400
Message-Id: <20241006214956.24339-6-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241006214956.24339-1-dpsmith@apertussolutions.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This will introduce a new struct boot_module to provide a rich state
representation around modules provided by the boot loader. Support is for 64
boot modules, one held in reserve for Xen, and up to 63 can be provided by the
boot loader. The array of struct boot_modules will be accessible via a
reference held in struct boot_info.

A temporary `mod` parameter is included in struct boot_module to ease the
transition from using Multiboot v1 structures over to struct boot_module. Once
the transition is complete, the parameter will be dropped from the structure.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/include/asm/bootinfo.h | 14 ++++++++++++--
 xen/arch/x86/setup.c                |  9 +++++++++
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index 87d311ac1399..d19473d8941e 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -8,20 +8,30 @@
 #ifndef __XEN_X86_BOOTINFO_H__
 #define __XEN_X86_BOOTINFO_H__
 
+#include <xen/multiboot.h>
 #include <xen/types.h>
 
+/* Max number of boot modules a bootloader can provide in addition to Xen */
+#define MAX_NR_BOOTMODS 63
+
+struct boot_module {
+    /* Transitionary only */
+    module_t *mod;
+};
+
 /*
  * Xen internal representation of information provided by the
  * bootloader/environment, or derived from the information.
  */
 struct boot_info {
-    unsigned int nr_modules;
-
     const char *loader;
     const char *cmdline;
 
     paddr_t memmap_addr;
     size_t memmap_length;
+
+    unsigned int nr_modules;
+    struct boot_module mods[MAX_NR_BOOTMODS + 1];
 };
 
 #endif /* __XEN_X86_BOOTINFO_H__ */
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index f0482ca8cc55..68eb4c848ae8 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -284,6 +284,8 @@ static struct boot_info __init *multiboot_fill_boot_info(unsigned long mbi_p)
 {
     struct boot_info *bi = &xen_boot_info;
     const multiboot_info_t *mbi = __va(mbi_p);
+    module_t *mods = __va(mbi->mods_addr);
+    unsigned int i;
 
     bi->nr_modules = (mbi->flags & MBI_MODULES) ? mbi->mods_count : 0;
 
@@ -302,6 +304,13 @@ static struct boot_info __init *multiboot_fill_boot_info(unsigned long mbi_p)
         bi->memmap_length = mbi->mmap_length;
     }
 
+    /*
+     * This will iterate over all modules to include an extra mb module, which
+     * should have been reserved to hold an entry for Xen.
+     */
+    for ( i = 0; i <= bi->nr_modules; i++ )
+        bi->mods[i].mod = &mods[i];
+
     return bi;
 }
 
-- 
2.30.2


