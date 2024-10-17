Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C21299A2A41
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 19:07:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820885.1234582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1TyU-0005O0-AS; Thu, 17 Oct 2024 17:07:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820885.1234582; Thu, 17 Oct 2024 17:07:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1TyU-0005Ln-6c; Thu, 17 Oct 2024 17:07:46 +0000
Received: by outflank-mailman (input) for mailman id 820885;
 Thu, 17 Oct 2024 17:07:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KqF2=RN=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t1TvD-0006TN-4t
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 17:04:23 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d968c908-8ca9-11ef-99a3-01e77a169b0f;
 Thu, 17 Oct 2024 19:04:21 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729184621129703.1852929433529;
 Thu, 17 Oct 2024 10:03:41 -0700 (PDT)
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
X-Inumbo-ID: d968c908-8ca9-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1729184623; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SEAYWKE7xL9UY82MEuvzA+0SxasmSBKqYzgwbNc4g+lHlj6PMoU7SXxUHjRtw51ROIuh8WlqoChZK7Jkw2+yZyCzgbK4Be3uYG2+0htFRojgMzbGfK8zMkqf36nsd05QpQ5NAGS4JEfYnFmdT8agqiBBuwpL97B4+gmveO3Ctzs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729184623; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=8Nn0zA/RVfT8SY13G0Olhb8w8UWUndxx4zU/53Bq7j4=; 
	b=g32lLWqhURhiuSQlrlAiS++0ytl8QPj1Bi/OBsolv/ARRyFCfT2Yt1YY8EspgvwyjdBoNhhS+CgqocxCrsqyBkF6XQVKokkNMcViZCPyxkbsbMujR5xEJg2603tX5oaUnYHgQok21ZpmzAXBuBHKMR82XDy7KQbarykCg8+vb3Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729184623;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=8Nn0zA/RVfT8SY13G0Olhb8w8UWUndxx4zU/53Bq7j4=;
	b=cS8x22pegiJZg6bepZsRpT6NPWts2WLIAgAEFSXUS569tIWPsS28dRaepcjcvri4
	cEghTfCdame0vVv/i0DaV477S/SsegqiftYncKJuIwbw1VrEVQ3ANQOzQgthGdyUUfl
	ZM5sqHkdwS8hfUzy214zQcZuIr6nvSZqM+TCReKg=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v6 05/44] x86/boot: introduce struct boot_module
Date: Thu, 17 Oct 2024 13:02:45 -0400
Message-Id: <20241017170325.3842-6-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241017170325.3842-1-dpsmith@apertussolutions.com>
References: <20241017170325.3842-1-dpsmith@apertussolutions.com>
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
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
Changes since v5:
- reword comment
---
 xen/arch/x86/include/asm/bootinfo.h | 10 ++++++++++
 xen/arch/x86/setup.c                |  9 +++++++++
 2 files changed, 19 insertions(+)

diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index f75a7e72a700..d19473d8941e 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -8,8 +8,17 @@
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
@@ -22,6 +31,7 @@ struct boot_info {
     size_t memmap_length;
 
     unsigned int nr_modules;
+    struct boot_module mods[MAX_NR_BOOTMODS + 1];
 };
 
 #endif /* __XEN_X86_BOOTINFO_H__ */
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index f7ea482920ef..d8ee5741740a 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -284,6 +284,8 @@ static struct boot_info *__init multiboot_fill_boot_info(unsigned long mbi_p)
 {
     struct boot_info *bi = &xen_boot_info;
     const multiboot_info_t *mbi = __va(mbi_p);
+    module_t *mods = __va(mbi->mods_addr);
+    unsigned int i;
 
     bi->nr_modules = (mbi->flags & MBI_MODULES) ? mbi->mods_count : 0;
 
@@ -302,6 +304,13 @@ static struct boot_info *__init multiboot_fill_boot_info(unsigned long mbi_p)
         bi->memmap_length = mbi->mmap_length;
     }
 
+    /*
+     * Iterate over all modules, including the extra one which should have been
+     * reserved for Xen itself
+     */
+    for ( i = 0; i <= bi->nr_modules; i++ )
+        bi->mods[i].mod = &mods[i];
+
     return bi;
 }
 
-- 
2.30.2


