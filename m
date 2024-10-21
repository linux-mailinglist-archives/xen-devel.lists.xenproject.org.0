Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E129A583B
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 02:47:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.822875.1236774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2gZC-0007KQ-Td; Mon, 21 Oct 2024 00:46:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 822875.1236774; Mon, 21 Oct 2024 00:46:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2gZC-0007Hk-Qd; Mon, 21 Oct 2024 00:46:38 +0000
Received: by outflank-mailman (input) for mailman id 822875;
 Mon, 21 Oct 2024 00:46:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q0x4=RR=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t2gZB-000738-Vl
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 00:46:37 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec7b1db2-8f45-11ef-a0be-8be0dac302b0;
 Mon, 21 Oct 2024 02:46:37 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729471584878605.8210982846448;
 Sun, 20 Oct 2024 17:46:24 -0700 (PDT)
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
X-Inumbo-ID: ec7b1db2-8f45-11ef-a0be-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1729471587; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mtYfdajC466EsrRkIugo5XkE5Sbcn0nEWOwxgeFNWIBOjJwjv5YKUtENqGzroxTEp7n0y3SS/DcIDfeK3pHrVJ8a7znXwSCwqmsDYi+D/V12euOLBrNKEHdJRSCtnP5y1qY83yAps35G8TtYPCMy+ImWnviaQj5Tp6NLJzCQZ3w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729471587; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=VV/xki6IWbJcCiOta+71vA6COU5u0Y4wCmksjgvwz50=; 
	b=De0yF6l4trKCbWupE0SIWHu4Pa0XxVuLY0whkTnpQjM1RpuYpdFvY/Wimrwb69IdtFDm6XEWHE/BK29GxGTjdclDenAfZDXhIBkJSBDLJYTJafzhZ0bq3jgDzR7WeAxNL3yyoLJJfqZWx+GsT0TKMixlml6tOgEFDel6j2OZXo8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729471587;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=VV/xki6IWbJcCiOta+71vA6COU5u0Y4wCmksjgvwz50=;
	b=kmbCr/1XhspE9MpwHoFLyV7m5ulNl43qmvPk2PI3NZ7EmjjLW9g2pMB5hqgUv+4D
	qwdZ9lJ/HETKhBD62lyjSBxFX4Y/m4wharIuY6H4wuY8+roqpLjLCuYxaxOAsnb8UOI
	fRga7vrvDWpmmwdH2I4aIgHPxuN5pc0tV+jzk4fM=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v7 01/38] x86/boot: introduce struct boot_module
Date: Sun, 20 Oct 2024 20:45:36 -0400
Message-Id: <20241021004613.18793-2-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241021004613.18793-1-dpsmith@apertussolutions.com>
References: <20241021004613.18793-1-dpsmith@apertussolutions.com>
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
Changes since v6:
- add guard to prevent OOB access of the boot module array
- pulled the setting of the Xen entry back out as independently set
- updated comment to understand why Xen entry has to be explicitly set

Changes since v5:
- reword comment
---
 xen/arch/x86/include/asm/bootinfo.h | 10 ++++++++++
 xen/arch/x86/setup.c                | 26 ++++++++++++++++++++++++--
 2 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index e7821e0603f8..ffa443406747 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -8,8 +8,17 @@
 #ifndef X86_BOOTINFO_H
 #define X86_BOOTINFO_H
 
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
 
 #endif /* X86_BOOTINFO_H */
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index bfede5064e8c..db670258d650 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -287,6 +287,8 @@ static struct boot_info *__init multiboot_fill_boot_info(unsigned long mbi_p)
 {
     struct boot_info *bi = &xen_boot_info;
     const multiboot_info_t *mbi = __va(mbi_p);
+    module_t *mods = __va(mbi->mods_addr);
+    unsigned int i;
 
     if ( mbi->flags & MBI_MODULES )
         bi->nr_modules = mbi->mods_count;
@@ -303,6 +305,21 @@ static struct boot_info *__init multiboot_fill_boot_info(unsigned long mbi_p)
         bi->memmap_length = mbi->mmap_length;
     }
 
+    /*
+     * The multiboot entry point will reserve mods_count + 1 instances of
+     * module_t, with the last one being for Xen. First iterate over nr_modules
+     * module_t entries, or MAX_NR_BOOTMODS if more than the max was passed.
+     *
+     * As the Xen entry may be beyond MAX_NR_BOOTMODS, explicitly set the last
+     * entry in mods to point at the last module_t entry which the entry point
+     * reserved for Xen.
+     */
+    for ( i = 0; i < MAX_NR_BOOTMODS && i < bi->nr_modules; i++ )
+        bi->mods[i].mod = &mods[i];
+
+    /* Variable 'i' should be one entry past the last module. */
+    bi->mods[i].mod = &mods[bi->nr_modules];
+
     return bi;
 }
 
@@ -1163,9 +1180,14 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
         panic("dom0 kernel not specified. Check bootloader configuration\n");
 
     /* Check that we don't have a silly number of modules. */
-    if ( bi->nr_modules > sizeof(module_map) * 8 )
+    if ( bi->nr_modules > MAX_NR_BOOTMODS )
     {
-        bi->nr_modules = sizeof(module_map) * 8;
+        /*
+         * Only MAX_NR_BOOTMODS were populated in bootinfo, truncate nr_modules
+         * now that it can be report that an excess number of modules were
+         * passed.
+         */
+        bi->nr_modules = MAX_NR_BOOTMODS;
         printk("Excessive boot modules - using the first %u only\n",
                bi->nr_modules);
     }
-- 
2.30.2


