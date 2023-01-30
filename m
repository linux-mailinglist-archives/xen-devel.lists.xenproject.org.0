Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 182AE6804BF
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 05:07:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.486484.753829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMLQc-0004RD-A1; Mon, 30 Jan 2023 04:05:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 486484.753829; Mon, 30 Jan 2023 04:05:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMLQc-0004Oj-7E; Mon, 30 Jan 2023 04:05:58 +0000
Received: by outflank-mailman (input) for mailman id 486484;
 Mon, 30 Jan 2023 04:05:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JFid=53=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pMLQa-0003sz-SE
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 04:05:56 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 650c2efa-a053-11ed-9ec0-891035b88211;
 Mon, 30 Jan 2023 05:05:55 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4ADC81FB;
 Sun, 29 Jan 2023 20:06:37 -0800 (PST)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.24])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D44F53F64C;
 Sun, 29 Jan 2023 20:05:52 -0800 (PST)
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
X-Inumbo-ID: 650c2efa-a053-11ed-9ec0-891035b88211
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Wei Chen <wei.chen@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 2/3] xen/arm: Extend the memory overlap check to include bootmodules
Date: Mon, 30 Jan 2023 12:05:34 +0800
Message-Id: <20230130040535.188236-3-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230130040535.188236-1-Henry.Wang@arm.com>
References: <20230130040535.188236-1-Henry.Wang@arm.com>
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
v2 -> v3:
1. Use "[start, end]" format in printk error message.
2. Change the return type of helper functions to bool.
3. Use 'start' and 'size' in helper functions to describe a region.
v1 -> v2:
1. Split original `overlap_check()` to `bootmodules_overlap_check()`.
2. Rework commit message.
---
 xen/arch/arm/setup.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 636604aafa..98df0baffa 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -287,6 +287,32 @@ static bool __init meminfo_overlap_check(struct meminfo *meminfo,
     return false;
 }
 
+static bool __init bootmodules_overlap_check(struct bootmodules *bootmodules,
+                                             paddr_t region_start,
+                                             paddr_t region_size)
+{
+    paddr_t mod_start = INVALID_PADDR, mod_end = 0;
+    paddr_t region_end = region_start + region_size;
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
+            printk("Region: [%#"PRIpaddr", %#"PRIpaddr"] overlapping with mod[%u]: [%#"PRIpaddr", %#"PRIpaddr"]\n",
+                   region_start, region_end, i, mod_start, mod_end);
+            return true;
+        }
+    }
+
+    return false;
+}
+
 void __init fw_unreserved_regions(paddr_t s, paddr_t e,
                                   void (*cb)(paddr_t, paddr_t),
                                   unsigned int first)
@@ -311,6 +337,11 @@ bool __init check_reserved_regions_overlap(paddr_t region_start,
                                region_start, region_size) )
         return true;
 
+    /* Check if input region is overlapping with bootmodules */
+    if ( bootmodules_overlap_check(&bootinfo.modules,
+                                   region_start, region_size) )
+        return true;
+
     return false;
 }
 
@@ -328,6 +359,10 @@ struct bootmodule __init *add_boot_module(bootmodule_kind kind,
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


