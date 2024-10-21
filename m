Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9109A583A
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 02:47:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.822888.1236815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2gZg-0000cK-4B; Mon, 21 Oct 2024 00:47:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 822888.1236815; Mon, 21 Oct 2024 00:47:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2gZg-0000Zk-0I; Mon, 21 Oct 2024 00:47:08 +0000
Received: by outflank-mailman (input) for mailman id 822888;
 Mon, 21 Oct 2024 00:47:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q0x4=RR=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t2gZe-000738-Cw
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 00:47:06 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd092f93-8f45-11ef-a0be-8be0dac302b0;
 Mon, 21 Oct 2024 02:47:04 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729471589554240.44779013138236;
 Sun, 20 Oct 2024 17:46:29 -0700 (PDT)
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
X-Inumbo-ID: fd092f93-8f45-11ef-a0be-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1729471591; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RjyG3Vl5JYgQf2EuO5BGJO/EDHuK5ukSioKgYb6ErZM+kTzXA+uePusSxVb2MUnMHFfBnHHYPRfHkI5MRsV/hUgFDMxJFYuCdZvxuJNkYTt7a0cx2bsd12x1ISxMf0Scfozz7fs0OG6qGD6bmCy2dbACedBfW7AUg5e9qtG94rY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729471591; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=34cklPGzHZTKAMY1dl5kem1MkF+P5eeKqClixrNkoNU=; 
	b=KlhbN00pLjObScO62rZchS/gTiN13VlWMA/HEhY8BfmozMGQoHnEAi8yLpRxwnm1Euy7YpXjiHHVIsJ69/SXazXXiF64E4SC8ectKeMWSmIH6kUv5i7/STWDlTi6WMufuJ/3KFKBPLwzRa76YxJZdvZAU5tOu9Fnl/inCAmjr+k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729471591;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=34cklPGzHZTKAMY1dl5kem1MkF+P5eeKqClixrNkoNU=;
	b=FkpQN5mXrg2DRKxDTzJeKotzle/sZQgnDI4dWg9Cr6XjbiHQkhBVZzaXR49IRhOY
	krMouJM4kUM9qsfnOE36k4w+vEgQ9TBXX+TWKXAl6PyUUA+TbO+bx4OHQhY2Ocxhq9R
	mlLftEc4ne5OKziKrIMVH5gMXlHb90FUjWJ/fu/I=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v7 05/38] x86/boot: introduce boot module types
Date: Sun, 20 Oct 2024 20:45:40 -0400
Message-Id: <20241021004613.18793-6-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241021004613.18793-1-dpsmith@apertussolutions.com>
References: <20241021004613.18793-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This commit introduces module types of xen, kernel, and ramdisk to allow boot
module detect code to tag the purpose of a boot module. This reduces the need
for hard coded order assumptions and global variables to be used by consumers
of boot modules, such as domain construction.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
Changes since v5:
- added guard around initrd type assignment
- removed a missed rebase artifact
---
 xen/arch/x86/include/asm/bootinfo.h | 9 +++++++++
 xen/arch/x86/setup.c                | 4 ++++
 2 files changed, 13 insertions(+)

diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index 59e6696f9671..ec005a97d6d5 100644
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
@@ -31,6 +39,7 @@ struct boot_module {
      *     [ decompressed kernel ][ unused rounding ]
      */
     unsigned long headroom;
+    enum bootmod_type type;
 };
 
 /*
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index b6d688f8fe5e..496f0900890d 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -319,6 +319,7 @@ static struct boot_info *__init multiboot_fill_boot_info(unsigned long mbi_p)
 
     /* Variable 'i' should be one entry past the last module. */
     bi->mods[i].mod = &mods[bi->nr_modules];
+    bi->mods[i].type = BOOTMOD_XEN;
 
     return bi;
 }
@@ -1194,6 +1195,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 
     bitmap_fill(module_map, bi->nr_modules);
     __clear_bit(0, module_map); /* Dom0 kernel is always first */
+    bi->mods[0].type = BOOTMOD_KERNEL;
 
     if ( pvh_boot )
     {
@@ -2080,6 +2082,8 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
            cpu_has_nx ? "" : "not ");
 
     initrdidx = find_first_bit(module_map, bi->nr_modules);
+    if ( initrdidx < bi->nr_modules )
+        bi->mods[initrdidx].type = BOOTMOD_RAMDISK;
     if ( bitmap_weight(module_map, bi->nr_modules) > 1 )
         printk(XENLOG_WARNING
                "Multiple initrd candidates, picking module #%u\n",
-- 
2.30.2


