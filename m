Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BA3629010
	for <lists+xen-devel@lfdr.de>; Tue, 15 Nov 2022 03:53:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443636.698320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oum4J-0000cr-Pw; Tue, 15 Nov 2022 02:52:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443636.698320; Tue, 15 Nov 2022 02:52:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oum4J-0000aI-Mg; Tue, 15 Nov 2022 02:52:59 +0000
Received: by outflank-mailman (input) for mailman id 443636;
 Tue, 15 Nov 2022 02:52:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pkVF=3P=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1oum4I-0008Vs-A3
 for xen-devel@lists.xenproject.org; Tue, 15 Nov 2022 02:52:58 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 9bc7c197-6490-11ed-8fd2-01056ac49cbb;
 Tue, 15 Nov 2022 03:52:57 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E92E411FB;
 Mon, 14 Nov 2022 18:53:02 -0800 (PST)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1700F3F73B;
 Mon, 14 Nov 2022 18:52:53 -0800 (PST)
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
X-Inumbo-ID: 9bc7c197-6490-11ed-8fd2-01056ac49cbb
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v1 02/13] xen/arm: switch to use shm_membank as function parameter
Date: Tue, 15 Nov 2022 10:52:24 +0800
Message-Id: <20221115025235.1378931-3-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221115025235.1378931-1-Penny.Zheng@arm.com>
References: <20221115025235.1378931-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of using multiple function parameters to deliver various shm-related
info, like host physical address, SHMID, etc, and with the introduction
of new struct "shm_membank", we could switch to use "shm_membank" as
function parameter to replace them all, to make codes more clear and
tidy.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 xen/arch/arm/domain_build.c | 46 ++++++++++++++++++-------------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index c0fd13f6ed..d2b9e60b5c 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -751,40 +751,31 @@ static void __init assign_static_memory_11(struct domain *d,
 }
 
 #ifdef CONFIG_STATIC_SHM
-static int __init acquire_nr_borrower_domain(struct domain *d,
-                                             paddr_t pbase, paddr_t psize,
-                                             unsigned long *nr_borrowers)
+static struct shm_membank * __init acquire_shm_membank(const char *shm_id)
 {
     unsigned int bank;
 
     /* Iterate static shared memory to find requested shm bank. */
     for ( bank = 0 ; bank < bootinfo.shm_mem.nr_banks; bank++ )
-    {
-        paddr_t bank_start = bootinfo.shm_mem.bank[bank].membank->start;
-        paddr_t bank_size = bootinfo.shm_mem.bank[bank].membank->size;
-
-        if ( (pbase == bank_start) && (psize == bank_size) )
+        if ( strcmp(shm_id, bootinfo.shm_mem.bank[bank].shm_id) == 0 )
             break;
-    }
 
     if ( bank == bootinfo.shm_mem.nr_banks )
-        return -ENOENT;
-
-    *nr_borrowers = bootinfo.shm_mem.bank[bank].nr_shm_borrowers;
+        return NULL;
 
-    return 0;
+    return &bootinfo.shm_mem.bank[bank];
 }
 
 /*
  * This function checks whether the static shared memory region is
  * already allocated to dom_io.
  */
-static bool __init is_shm_allocated_to_domio(paddr_t pbase)
+static bool __init is_shm_allocated_to_domio(struct shm_membank *shm_membank)
 {
     struct page_info *page;
     struct domain *d;
 
-    page = maddr_to_page(pbase);
+    page = maddr_to_page(shm_membank->membank->start);
     d = page_get_owner_and_reference(page);
     if ( d == NULL )
         return false;
@@ -835,14 +826,17 @@ static mfn_t __init acquire_shared_memory_bank(struct domain *d,
 }
 
 static int __init assign_shared_memory(struct domain *d,
-                                       uint32_t addr_cells, uint32_t size_cells,
-                                       paddr_t pbase, paddr_t psize,
+                                       struct shm_membank *shm_membank,
                                        paddr_t gbase)
 {
     mfn_t smfn;
     int ret = 0;
     unsigned long nr_pages, nr_borrowers, i;
     struct page_info *page;
+    paddr_t pbase, psize;
+
+    pbase = shm_membank->membank->start;
+    psize = shm_membank->membank->size;
 
     printk("%pd: allocate static shared memory BANK %#"PRIpaddr"-%#"PRIpaddr".\n",
            d, pbase, pbase + psize);
@@ -871,9 +865,7 @@ static int __init assign_shared_memory(struct domain *d,
      * Get the right amount of references per page, which is the number of
      * borrower domains.
      */
-    ret = acquire_nr_borrower_domain(d, pbase, psize, &nr_borrowers);
-    if ( ret )
-        return ret;
+    nr_borrowers = shm_membank->nr_shm_borrowers;
 
     /*
      * Instead of letting borrower domain get a page ref, we add as many
@@ -941,6 +933,7 @@ static int __init process_shm(struct domain *d, struct kernel_info *kinfo,
         const char *role_str;
         const char *shm_id;
         bool owner_dom_io = true;
+        struct shm_membank *shm_membank;
 
         if ( !dt_device_is_compatible(shm_node, "xen,domain-shared-memory-v1") )
             continue;
@@ -991,12 +984,20 @@ static int __init process_shm(struct domain *d, struct kernel_info *kinfo,
         }
         BUG_ON((strlen(shm_id) <= 0) || (strlen(shm_id) >= MAX_SHM_ID_LENGTH));
 
+        shm_membank = acquire_shm_membank(shm_id);
+        if ( !shm_membank )
+        {
+            printk("%pd: failed to acquire %s shared memory bank\n",
+                   d, shm_id);
+            return -ENOENT;
+        }
+
         /*
          * DOMID_IO is a fake domain and is not described in the Device-Tree.
          * Therefore when the owner of the shared region is DOMID_IO, we will
          * only find the borrowers.
          */
-        if ( (owner_dom_io && !is_shm_allocated_to_domio(pbase)) ||
+        if ( (owner_dom_io && !is_shm_allocated_to_domio(shm_membank)) ||
              (!owner_dom_io && strcmp(role_str, "owner") == 0) )
         {
             /*
@@ -1004,8 +1005,7 @@ static int __init process_shm(struct domain *d, struct kernel_info *kinfo,
              * specified, so they should be assigned to dom_io.
              */
             ret = assign_shared_memory(owner_dom_io ? dom_io : d,
-                                       addr_cells, size_cells,
-                                       pbase, psize, gbase);
+                                       shm_membank, gbase);
             if ( ret )
                 return ret;
         }
-- 
2.25.1


