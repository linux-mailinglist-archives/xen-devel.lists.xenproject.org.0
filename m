Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0998F62900A
	for <lists+xen-devel@lfdr.de>; Tue, 15 Nov 2022 03:53:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443642.698374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oum4Z-0002Vs-Jc; Tue, 15 Nov 2022 02:53:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443642.698374; Tue, 15 Nov 2022 02:53:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oum4Z-0002Pl-FU; Tue, 15 Nov 2022 02:53:15 +0000
Received: by outflank-mailman (input) for mailman id 443642;
 Tue, 15 Nov 2022 02:53:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pkVF=3P=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1oum4X-0008Vs-QU
 for xen-devel@lists.xenproject.org; Tue, 15 Nov 2022 02:53:13 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id a509e63a-6490-11ed-8fd2-01056ac49cbb;
 Tue, 15 Nov 2022 03:53:12 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 69FF711FB;
 Mon, 14 Nov 2022 18:53:18 -0800 (PST)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8C2373F73B;
 Mon, 14 Nov 2022 18:53:09 -0800 (PST)
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
X-Inumbo-ID: a509e63a-6490-11ed-8fd2-01056ac49cbb
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v1 07/13] xen/arm: map shared memory to borrower when host address not provided
Date: Tue, 15 Nov 2022 10:52:29 +0800
Message-Id: <20221115025235.1378931-8-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221115025235.1378931-1-Penny.Zheng@arm.com>
References: <20221115025235.1378931-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the introduction of new scenario where host address is not provided
in "xen,shared-mem", the function "map_regions_p2mt" for setting up
P2M foreign mapping for borrower domain shall be adapted to it too.

Here we implement a new helper "borrower_physmap_add_memory" to
cover both scenarios.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 xen/arch/arm/domain_build.c | 54 ++++++++++++++++++++++++++++++++++---
 1 file changed, 51 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index faf0784bb0..d0f7fc8fd7 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1110,6 +1110,51 @@ static int __init assign_shared_memory(struct domain *d,
     return ret;
 }
 
+static int __init borrower_physmap_add_memory(struct domain *d,
+                                              struct shm_membank *shm_membank,
+                                              paddr_t gbase)
+{
+    int ret;
+    unsigned int i;
+    paddr_t start, size;
+    gfn_t sgfn;
+    struct meminfo *meminfo;
+
+    /* Host address is not provided in "xen,shared-mem" */
+    if ( shm_membank->mem.banks.meminfo )
+    {
+        meminfo = shm_membank->mem.banks.meminfo;
+        for ( i = 0; i < meminfo->nr_banks; i++ )
+        {
+            start = meminfo->bank[i].start;
+            size = meminfo->bank[i].size;
+            sgfn = _gfn(PFN_UP(gbase));
+
+            /* Set up P2M foreign mapping for borrower domain. */
+            ret = map_regions_p2mt(d, sgfn, PFN_DOWN(size), _mfn(PFN_UP(start)),
+                                   p2m_map_foreign_rw);
+            if ( ret )
+                return ret;
+
+            sgfn = gfn_add(sgfn, PFN_DOWN(size));
+        }
+    }
+    else
+    {
+        start = shm_membank->mem.bank->start;
+        size = shm_membank->mem.bank->size;
+        sgfn = _gfn(PFN_UP(gbase));
+
+        /* Set up P2M foreign mapping for borrower domain. */
+        ret = map_regions_p2mt(d, sgfn, PFN_DOWN(size), _mfn(PFN_UP(start)),
+                               p2m_map_foreign_rw);
+        if ( ret )
+            return ret;
+    }
+
+    return 0;
+}
+
 static int __init append_shm_bank_to_domain(struct kernel_info *kinfo,
                                             paddr_t start, paddr_t size,
                                             const char *shm_id)
@@ -1242,11 +1287,14 @@ static int __init process_shm(struct domain *d, struct kernel_info *kinfo,
 
         if ( owner_dom_io || (strcmp(role_str, "borrower") == 0) )
         {
-            /* Set up P2M foreign mapping for borrower domain. */
-            ret = map_regions_p2mt(d, _gfn(PFN_UP(gbase)), PFN_DOWN(psize),
-                                   _mfn(PFN_UP(pbase)), p2m_map_foreign_rw);
+            ret = borrower_physmap_add_memory(d, shm_membank, gbase);
             if ( ret )
+            {
+                printk(XENLOG_ERR
+                       "%pd: Failed to map foreign memory to borrower domain: %d",
+                       d, ret);
                 return ret;
+            }
         }
 
         /*
-- 
2.25.1


