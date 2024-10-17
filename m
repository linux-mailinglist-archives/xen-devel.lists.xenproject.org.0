Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D28E69A2A3C
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 19:07:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820879.1234552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1TyF-0004FZ-K4; Thu, 17 Oct 2024 17:07:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820879.1234552; Thu, 17 Oct 2024 17:07:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1TyF-0004Dr-GW; Thu, 17 Oct 2024 17:07:31 +0000
Received: by outflank-mailman (input) for mailman id 820879;
 Thu, 17 Oct 2024 17:07:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KqF2=RN=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t1Tvn-0006TN-8i
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 17:04:59 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eefa78a0-8ca9-11ef-99a3-01e77a169b0f;
 Thu, 17 Oct 2024 19:04:57 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729184626209754.6375868347845;
 Thu, 17 Oct 2024 10:03:46 -0700 (PDT)
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
X-Inumbo-ID: eefa78a0-8ca9-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1729184628; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EhQ00uV5KWcXLb7ZAuzSAi6b9ej2Wl3tJ3B+8kjvf7b6mDzZoeQ8pJaEMRYmYY6CsusInTHpK0D1ZgGhP8ctXlBTjve44IwhZbRqEQl/wxY3ZA7KZFmHpSt35Gv1LKxhvGsKpLU0XDtsjooMe2BgYaWS5cZ32LdogXvHPBHDXMs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729184628; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Gn+NgukrSZNmUBqbS3h19LnxMuHuw+P3qAI40MVL2NA=; 
	b=WeBY9Xq/Qo1W/Abt/lIT3RCAH5yPe01/M3J5tk3+bX0ZzZtyrvtUMuJTV6Crw0R6j3o9YZ+8+Z/8FQI23XOQITWat55/aPT2qmZl4q//5ylQYEu65DPRjQpK2BEo+R0orN3A76XbTBHa41vV4JiGMXYD8Qv/Upfnr1rZZ6MOytU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729184628;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=Gn+NgukrSZNmUBqbS3h19LnxMuHuw+P3qAI40MVL2NA=;
	b=mwJ7JW/xMrsbow9/Z7dd+HrZF1KFwGE7GS2qLwrof2NHO4zBojx07XP5HLcuq7Ay
	WF+W6hJM6aE5JLNTmmgQswClDlGbC6S9NyPNntm/Tabn3km51o/EM/8uFcrxvRQp1Az
	yO78/fPqEKa4UH739OfXByt0xtybdiFXJDNU1yf4=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v6 09/44] x86/boot: introduce boot module types
Date: Thu, 17 Oct 2024 13:02:49 -0400
Message-Id: <20241017170325.3842-10-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241017170325.3842-1-dpsmith@apertussolutions.com>
References: <20241017170325.3842-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This commit introduces module types of xen, kernel, and ramdisk to allow boot
module detect code to tag the purpose of a boot module. This reduces the need
for hard coded order assumptions and global variables to be used by consumers
of boot modules, such as domain construction.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
Changes since v5:
- added guard around initrd type assignment
- removed a missed rebase artifact
---
 xen/arch/x86/include/asm/bootinfo.h | 9 +++++++++
 xen/arch/x86/setup.c                | 6 ++++++
 2 files changed, 15 insertions(+)

diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index 5fe4f1387d03..18281d80fa97 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -14,6 +14,14 @@
 /* Max number of boot modules a bootloader can provide in addition to Xen */
 #define MAX_NR_BOOTMODS 63
 
+/* Boot module binary type / purpose */
+enum bootmod_type {
+    BOOTMOD_UNKNOWN,
+    BOOTMOD_XEN,
+    BOOTMOD_KERNEL,
+    BOOTMOD_RAMDISK,
+};
+
 struct boot_module {
     /* Transitionary only */
     module_t *mod;
@@ -30,6 +38,7 @@ struct boot_module {
      *     [ decompressed kernel ][ unused rounding ]
      */
     unsigned long headroom;
+    enum bootmod_type type;
 };
 
 /*
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 1b56eaf26efe..fed9bef16305 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -311,6 +311,9 @@ static struct boot_info *__init multiboot_fill_boot_info(unsigned long mbi_p)
     for ( i = 0; i <= bi->nr_modules; i++ )
         bi->mods[i].mod = &mods[i];
 
+    /* map the last mb module for xen entry */
+    bi->mods[bi->nr_modules].type = BOOTMOD_XEN;
+
     return bi;
 }
 
@@ -1171,6 +1174,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 
     bitmap_fill(module_map, bi->nr_modules);
     __clear_bit(0, module_map); /* Dom0 kernel is always first */
+    bi->mods[0].type = BOOTMOD_KERNEL;
 
     if ( pvh_boot )
     {
@@ -2059,6 +2063,8 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
            cpu_has_nx ? "" : "not ");
 
     initrdidx = find_first_bit(module_map, bi->nr_modules);
+    if ( initrdidx < bi->nr_modules )
+        bi->mods[initrdidx].type = BOOTMOD_RAMDISK;
     if ( bitmap_weight(module_map, bi->nr_modules) > 1 )
         printk(XENLOG_WARNING
                "Multiple initrd candidates, picking module #%u\n",
-- 
2.30.2


