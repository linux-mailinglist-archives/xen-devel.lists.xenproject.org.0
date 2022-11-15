Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D07A8629049
	for <lists+xen-devel@lfdr.de>; Tue, 15 Nov 2022 04:00:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443689.698429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oumBg-0007pt-PA; Tue, 15 Nov 2022 03:00:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443689.698429; Tue, 15 Nov 2022 03:00:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oumBg-0007mH-M8; Tue, 15 Nov 2022 03:00:36 +0000
Received: by outflank-mailman (input) for mailman id 443689;
 Tue, 15 Nov 2022 03:00:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pkVF=3P=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1oum4p-0000BJ-U2
 for xen-devel@lists.xenproject.org; Tue, 15 Nov 2022 02:53:31 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id ae41efa1-6490-11ed-91b6-6bf2151ebd3b;
 Tue, 15 Nov 2022 03:53:28 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E07E911FB;
 Mon, 14 Nov 2022 18:53:33 -0800 (PST)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0E26B3F73B;
 Mon, 14 Nov 2022 18:53:24 -0800 (PST)
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
X-Inumbo-ID: ae41efa1-6490-11ed-91b6-6bf2151ebd3b
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v1 12/13] xen/arm: implement "xen,offset" feature when host address not provided
Date: Tue, 15 Nov 2022 10:52:34 +0800
Message-Id: <20221115025235.1378931-13-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221115025235.1378931-1-Penny.Zheng@arm.com>
References: <20221115025235.1378931-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When host address is not provided in "xen,shared-mem" property, shared
memory region is allocated from heap by Xen. It is normally not
contiguous and consisted of multiple memory blocks.
Under above scenario, when "xen,offset" is also offered, we need to find at
which memory block the offset locates, and the borrower memory map shall start
at this block offset.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 xen/arch/arm/domain_build.c | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 95600c640c..494f6aff2e 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -48,6 +48,10 @@ boolean_param("ext_regions", opt_ext_regions);
 static u64 __initdata dom0_mem;
 static bool __initdata dom0_mem_set;
 
+#ifdef CONFIG_STATIC_SHM
+static uint64_t __initdata allocated = 0UL;
+#endif
+
 static int __init parse_dom0_mem(const char *s)
 {
     dom0_mem_set = true;
@@ -1110,6 +1114,26 @@ static int __init assign_shared_memory(struct domain *d,
     return ret;
 }
 
+static bool __init find_anchor_offset(paddr_t *bank_start, paddr_t *bank_size,
+                                      uint64_t offset)
+{
+    uint64_t bank_offset;
+
+    allocated += *bank_size;
+    if ( allocated <= offset )
+        return false;
+
+    /* Find the bank when offset locates */
+    bank_offset = *bank_size - (allocated - offset);
+    *bank_start += bank_offset;
+    *bank_size = allocated - offset;
+
+    /* Reset after finding the anchor */
+    allocated = 0UL;
+
+    return true;
+}
+
 static int __init borrower_physmap_add_memory(struct domain *d,
                                               struct shm_membank *shm_membank,
                                               paddr_t gbase, paddr_t offset)
@@ -1123,12 +1147,17 @@ static int __init borrower_physmap_add_memory(struct domain *d,
     /* Host address is not provided in "xen,shared-mem" */
     if ( shm_membank->mem.banks.meminfo )
     {
+        bool found = false;
         meminfo = shm_membank->mem.banks.meminfo;
+        sgfn = _gfn(PFN_UP(gbase));
+
         for ( i = 0; i < meminfo->nr_banks; i++ )
         {
             start = meminfo->bank[i].start;
             size = meminfo->bank[i].size;
-            sgfn = _gfn(PFN_UP(gbase));
+
+            if ( offset && !found )
+                found = find_anchor_offset(&start, &size, offset);
 
             /* Set up P2M foreign mapping for borrower domain. */
             ret = map_regions_p2mt(d, sgfn, PFN_DOWN(size), _mfn(PFN_UP(start)),
-- 
2.25.1


