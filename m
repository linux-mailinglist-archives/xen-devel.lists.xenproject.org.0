Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA8E64C2B1
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 04:17:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461577.719698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5IGg-00064z-En; Wed, 14 Dec 2022 03:17:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461577.719698; Wed, 14 Dec 2022 03:17:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5IGg-00061J-B7; Wed, 14 Dec 2022 03:17:14 +0000
Received: by outflank-mailman (input) for mailman id 461577;
 Wed, 14 Dec 2022 03:17:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LNGa=4M=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1p5IGe-0005ka-KC
 for xen-devel@lists.xenproject.org; Wed, 14 Dec 2022 03:17:12 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id ccc3519a-7b5d-11ed-8fd2-01056ac49cbb;
 Wed, 14 Dec 2022 04:17:11 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CD8CEFEC;
 Tue, 13 Dec 2022 19:17:51 -0800 (PST)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.24])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2AFD53F73B;
 Tue, 13 Dec 2022 19:17:08 -0800 (PST)
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
X-Inumbo-ID: ccc3519a-7b5d-11ed-8fd2-01056ac49cbb
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 2/3] xen/arm: Extend the memory overlap check to include bootmodules
Date: Wed, 14 Dec 2022 11:16:53 +0800
Message-Id: <20221214031654.2815589-3-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221214031654.2815589-1-Henry.Wang@arm.com>
References: <20221214031654.2815589-1-Henry.Wang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Similarly as the static regions defined in bootinfo.reserved_mem,
the bootmodule regions defined in bootinfo.modules should also not
be overlapping with memory regions in either bootinfo.reserved_mem
or bootinfo.modules.

Therefore, this commit introduces a helper `bootmodules_overlap_check()`
and uses this helper to extend the check in function
`check_reserved_regions_overlap()` so that memory regions in
bootinfo.modules are included. Use `check_reserved_regions_overlap()`
in `add_boot_module()` to return early if any error occurs.

Signed-off-by: Henry Wang <Henry.Wang@arm.com>
---
v1 -> v2:
1. Split original `overlap_check()` to `bootmodules_overlap_check()`.
2. Rework commit message.
---
 xen/arch/arm/setup.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index e6eeb3a306..ba0152f868 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -286,6 +286,31 @@ static int __init meminfo_overlap_check(struct meminfo *meminfo,
     return 0;
 }
 
+static int __init bootmodules_overlap_check(struct bootmodules *bootmodules,
+                                            paddr_t region_start,
+                                            paddr_t region_end)
+{
+    paddr_t mod_start = INVALID_PADDR, mod_end = 0;
+    unsigned int i, mod_num = bootmodules->nr_mods;
+
+    for ( i = 0; i < mod_num; i++ )
+    {
+        mod_start = bootmodules->module[i].start;
+        mod_end = mod_start + bootmodules->module[i].size;
+
+        if ( region_end <= mod_start || region_start >= mod_end )
+            continue;
+        else
+        {
+            printk("Region %#"PRIpaddr" - %#"PRIpaddr" overlapping with mod[%u] %#"PRIpaddr" - %#"PRIpaddr"\n",
+                   region_start, region_end, i, mod_start, mod_end);
+            return -EINVAL;
+        }
+    }
+
+    return 0;
+}
+
 void __init fw_unreserved_regions(paddr_t s, paddr_t e,
                                   void (*cb)(paddr_t, paddr_t),
                                   unsigned int first)
@@ -312,6 +337,11 @@ int __init check_reserved_regions_overlap(paddr_t region_start,
                                region_start, region_end) )
         return -EINVAL;
 
+    /* Check if input region is overlapping with bootmodules */
+    if ( bootmodules_overlap_check(&bootinfo.modules,
+                                   region_start, region_end) )
+        return -EINVAL;
+
     return 0;
 }
 
@@ -329,6 +359,10 @@ struct bootmodule __init *add_boot_module(bootmodule_kind kind,
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


