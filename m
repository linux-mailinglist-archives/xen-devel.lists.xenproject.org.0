Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBDB6421BC
	for <lists+xen-devel@lfdr.de>; Mon,  5 Dec 2022 03:59:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.453112.710786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p21gM-0000W1-VZ; Mon, 05 Dec 2022 02:58:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 453112.710786; Mon, 05 Dec 2022 02:58:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p21gM-0000TI-QR; Mon, 05 Dec 2022 02:58:14 +0000
Received: by outflank-mailman (input) for mailman id 453112;
 Mon, 05 Dec 2022 02:58:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IUlJ=4D=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1p21gL-0000CU-Qv
 for xen-devel@lists.xenproject.org; Mon, 05 Dec 2022 02:58:13 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id a83dd8c3-7448-11ed-91b6-6bf2151ebd3b;
 Mon, 05 Dec 2022 03:58:13 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EEF5414BF;
 Sun,  4 Dec 2022 18:58:18 -0800 (PST)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.24])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 32DEE3F73D;
 Sun,  4 Dec 2022 18:58:09 -0800 (PST)
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
X-Inumbo-ID: a83dd8c3-7448-11ed-91b6-6bf2151ebd3b
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 2/3] xen/arm: Extend the memory overlap check to include bootmodules
Date: Mon,  5 Dec 2022 10:57:52 +0800
Message-Id: <20221205025753.2178965-3-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221205025753.2178965-1-Henry.Wang@arm.com>
References: <20221205025753.2178965-1-Henry.Wang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Similarly as the static regions defined in bootinfo.reserved_mem,
the bootmodule regions defined in bootinfo.modules should also not
be overlapping with memory regions in either bootinfo.reserved_mem
or bootinfo.modules.

Therefore, this commit extends the check in function
`check_reserved_regions_overlap()` to include memory regions in
bootinfo.modules, and use `check_reserved_regions_overlap()` in
`add_boot_module()` to return early if any error occurs.

Signed-off-by: Henry Wang <Henry.Wang@arm.com>
---
 xen/arch/arm/setup.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 94d232605e..b43c8e118a 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -282,6 +282,11 @@ static int __init overlap_check(void *bootinfo_type,
         num = bootinfo.reserved_mem.nr_banks;
         type_str = "reserved_mem";
     }
+    else if ( bootinfo_type == &bootinfo.modules )
+    {
+        num = bootinfo.modules.nr_mods;
+        type_str = "bootmodules";
+    }
     else
         panic("Invalid bootinfo type passed to overlap check\n");
 
@@ -292,6 +297,11 @@ static int __init overlap_check(void *bootinfo_type,
             bank_start = bootinfo.reserved_mem.bank[i].start;
             bank_end = bank_start + bootinfo.reserved_mem.bank[i].size;
         }
+        else if ( bootinfo_type == &bootinfo.modules )
+        {
+            bank_start = bootinfo.modules.module[i].start;
+            bank_end = bank_start + bootinfo.modules.module[i].size;
+        }
 
         if ( region_end <= bank_start || region_start >= bank_end )
             continue;
@@ -331,6 +341,10 @@ int __init check_reserved_regions_overlap(paddr_t region_start,
     if ( overlap_check(&bootinfo.reserved_mem, region_start, region_end) )
         return -EINVAL;
 
+    /* Check if input region is overlapping with bootmodules */
+    if ( overlap_check(&bootinfo.modules, region_start, region_end) )
+        return -EINVAL;
+
     return 0;
 }
 
@@ -348,6 +362,10 @@ struct bootmodule __init *add_boot_module(bootmodule_kind kind,
                boot_module_kind_as_string(kind), start, start + size);
         return NULL;
     }
+
+    if ( check_reserved_regions_overlap(start, size) )
+        return NULL;
+
     for ( i = 0 ; i < mods->nr_mods ; i++ )
     {
         mod = &mods->module[i];
-- 
2.25.1


