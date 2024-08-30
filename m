Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 370CF966B8B
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 23:50:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786709.1196397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9W4-0003v0-Oa; Fri, 30 Aug 2024 21:50:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786709.1196397; Fri, 30 Aug 2024 21:50:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9W4-0003rr-KP; Fri, 30 Aug 2024 21:50:48 +0000
Received: by outflank-mailman (input) for mailman id 786709;
 Fri, 30 Aug 2024 21:50:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiG6=P5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sk9W3-0002pb-7I
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 21:50:47 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e88aa22b-6719-11ef-a0b1-8be0dac302b0;
 Fri, 30 Aug 2024 23:50:46 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: by mx.zohomail.com with SMTPS id 1725054486005884.6684138233145;
 Fri, 30 Aug 2024 14:48:06 -0700 (PDT)
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
X-Inumbo-ID: e88aa22b-6719-11ef-a0b1-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1725054488; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SNkhcUTb5ljjl2N4k5YOyU3+oI1ILjCxlFunEQS+985K2oo1Yu+xBrLdrDkBJDxLmc2f8rW0DkVOn31d/xaGFBsjtN+u5FJLip4P+ik3GQIxhVbI41HHWntYWnMTBDrw35GjtavGKlfZ8nbhxngiDGjH4VbgJS1m3Yma82oQxLs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1725054488; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4r8bmG5H6VttNyjMx0aG3Heh83MSlb/U7U7R6jqNGbY=; 
	b=VMKWkebmIugSeqsy1YB478K5MVEVqELvz/mT7v+uKnvardBgLfOvaUxAZE4aN0UuqN0tXWortoPkUyoixYwwC94fYrC6CVesl0q5oj68SR9VrU0XdsprkOBSPcGsoXvaF36d0ClD849xYdLug6saTybJXLie4/lQYcSSEllzVco=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725054488;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=4r8bmG5H6VttNyjMx0aG3Heh83MSlb/U7U7R6jqNGbY=;
	b=j63f/8kEFjZLnJwXnEwaZ/+r476pw2tLC0WHdxn5Qz5P9y7hHGmfP3qA+hpNyKde
	nuSZy3mzccLVOIEdnGTaKXemyOWhoJc2r20EWT3fLiceMuUvnhoE9/aZTzcNCQUiCd3
	FjUZTGwcsQWeUS2/ou7R3tUVBdmJJxdh+pvDBqlM=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 24/44] x86/boot: remove module_map usage by ramdisk loading
Date: Fri, 30 Aug 2024 17:47:09 -0400
Message-Id: <20240830214730.1621-25-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240830214730.1621-1-dpsmith@apertussolutions.com>
References: <20240830214730.1621-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The ramdisk loading is the last user of module_map, remove
its usage and any remaining remnants of module_map.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/setup.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 90c2ddb3728a..5f42d1049110 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1053,7 +1053,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
     unsigned int initrdidx, num_parked = 0;
     multiboot_info_t *mbi;
     module_t *mod;
-    unsigned long nr_pages, raw_max_page, module_map[1];
+    unsigned long nr_pages, raw_max_page;
     int i, j, e820_warn = 0, bytes = 0;
     unsigned long eb_start, eb_end;
     bool acpi_boot_table_init_done = false, relocated = false;
@@ -1203,15 +1203,14 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
         panic("dom0 kernel not specified. Check bootloader configuration\n");
 
     /* Check that we don't have a silly number of modules. */
-    if ( boot_info->nr_mods > sizeof(module_map) * 8 )
+    if ( boot_info->nr_mods > MAX_NR_BOOTMODS + 1 )
     {
-        boot_info->nr_mods = sizeof(module_map) * 8;
+        boot_info->nr_mods = MAX_NR_BOOTMODS + 1;
         printk("Excessive multiboot modules - using the first %u only\n",
                boot_info->nr_mods);
     }
 
-    bitmap_fill(module_map, boot_info->nr_mods);
-    __clear_bit(0, module_map); /* Dom0 kernel is always first */
+    /* Dom0 kernel is always first */
     boot_info->mods[0].type = BOOTMOD_KERNEL;
     boot_info->mods[0].flags |= BOOTMOD_FLAG_X86_CONSUMED;
 
-- 
2.30.2


