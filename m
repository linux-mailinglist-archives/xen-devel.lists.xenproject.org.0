Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7419D62900F
	for <lists+xen-devel@lfdr.de>; Tue, 15 Nov 2022 03:53:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443639.698353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oum4S-0001Zs-O1; Tue, 15 Nov 2022 02:53:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443639.698353; Tue, 15 Nov 2022 02:53:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oum4S-0001Vm-JD; Tue, 15 Nov 2022 02:53:08 +0000
Received: by outflank-mailman (input) for mailman id 443639;
 Tue, 15 Nov 2022 02:53:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pkVF=3P=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1oum4R-0008Vs-Mu
 for xen-devel@lists.xenproject.org; Tue, 15 Nov 2022 02:53:07 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id a15477b6-6490-11ed-8fd2-01056ac49cbb;
 Tue, 15 Nov 2022 03:53:06 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B75611FB;
 Mon, 14 Nov 2022 18:53:12 -0800 (PST)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5DBA03F73B;
 Mon, 14 Nov 2022 18:53:03 -0800 (PST)
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
X-Inumbo-ID: a15477b6-6490-11ed-8fd2-01056ac49cbb
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v1 05/13] xen/arm: allocate shared memory from heap when host address not provided
Date: Tue, 15 Nov 2022 10:52:27 +0800
Message-Id: <20221115025235.1378931-6-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221115025235.1378931-1-Penny.Zheng@arm.com>
References: <20221115025235.1378931-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

when host address is not provided in "xen,shared-mem", we let Xen
allocate requested shared memory from heap, and once the shared memory is
allocated, it will be marked as static(PGC_static), which means that it will be
reserved as static memory, and will not go back to heap even on freeing.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 xen/arch/arm/domain_build.c | 83 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 82 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index fbb196d8a4..3de96882a5 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -835,6 +835,72 @@ static bool __init is_shm_allocated_to_domio(struct shm_membank *shm_membank)
     return true;
 }
 
+static int __init mark_shared_memory_static(struct shm_membank *shm_membank)
+{
+    unsigned int bank;
+    unsigned long i, nr_mfns;
+    struct page_info *pg;
+    struct meminfo *meminfo;
+
+    BUG_ON(!shm_membank->mem.banks.meminfo);
+    meminfo = shm_membank->mem.banks.meminfo;
+    for ( bank = 0; bank < meminfo->nr_banks; bank++ )
+    {
+        pg = mfn_to_page(maddr_to_mfn(meminfo->bank[bank].start));
+        nr_mfns = PFN_DOWN(meminfo->bank[bank].size);
+
+        for ( i = 0; i < nr_mfns; i++ )
+        {
+            /* The page should be already allocated from heap. */
+            if ( !pg[i].count_info & PGC_state_inuse )
+            {
+                printk(XENLOG_ERR
+                       "pg[%lu] MFN %"PRI_mfn" c=%#lx\n",
+                       i, mfn_x(page_to_mfn(pg)) + i, pg[i].count_info);
+                goto fail;
+            }
+
+           pg[i].count_info |= PGC_static;
+        }
+    }
+
+    return 0;
+
+ fail:
+    while ( bank >= 0 )
+    {
+        while ( --i >= 0 )
+            pg[i].count_info &= ~PGC_static;
+        i = PFN_DOWN(meminfo->bank[--bank].size);
+    }
+
+    return -EINVAL;
+}
+
+static int __init allocate_shared_memory(struct shm_membank *shm_membank,
+                                         paddr_t psize)
+{
+    struct meminfo *banks;
+    int ret;
+
+    BUG_ON(shm_membank->mem.banks.meminfo != NULL);
+
+    banks = xmalloc_bytes(sizeof(struct meminfo));
+    if ( banks == NULL )
+        return -ENOMEM;
+    shm_membank->mem.banks.meminfo = banks;
+    memset(shm_membank->mem.banks.meminfo, 0, sizeof(struct meminfo));
+
+    if ( !allocate_domheap_memory(NULL, psize, shm_membank->mem.banks.meminfo) )
+        return -EINVAL;
+
+    ret = mark_shared_memory_static(shm_membank);
+    if ( ret )
+        return ret;
+
+    return 0;
+}
+
 static mfn_t __init acquire_shared_memory_bank(struct domain *d,
                                                paddr_t pbase, paddr_t psize)
 {
@@ -975,7 +1041,7 @@ static int __init process_shm(struct domain *d, struct kernel_info *kinfo,
         unsigned int i;
         const char *role_str;
         const char *shm_id;
-        bool owner_dom_io = true;
+        bool owner_dom_io = true, paddr_assigned = true;
         struct shm_membank *shm_membank;
 
         if ( !dt_device_is_compatible(shm_node, "xen,domain-shared-memory-v1") )
@@ -1035,6 +1101,21 @@ static int __init process_shm(struct domain *d, struct kernel_info *kinfo,
             return -ENOENT;
         }
 
+        /*
+         * When host address is not provided in "xen,shared-mem",
+         * we let Xen allocate requested memory from heap at first domain.
+         */
+        if ( !paddr_assigned && !shm_membank->mem.banks.meminfo )
+        {
+            ret = allocate_shared_memory(shm_membank, psize);
+            if ( ret )
+            {
+                printk("%pd: failed to allocate shared memory bank(%"PRIpaddr"MB) from heap: %d\n",
+                       d, psize >> 20, ret);
+                return ret;
+            }
+        }
+
         /*
          * DOMID_IO is a fake domain and is not described in the Device-Tree.
          * Therefore when the owner of the shared region is DOMID_IO, we will
-- 
2.25.1


