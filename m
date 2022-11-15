Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44EB262900C
	for <lists+xen-devel@lfdr.de>; Tue, 15 Nov 2022 03:53:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443638.698342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oum4Q-0001Fi-CD; Tue, 15 Nov 2022 02:53:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443638.698342; Tue, 15 Nov 2022 02:53:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oum4Q-0001C3-8P; Tue, 15 Nov 2022 02:53:06 +0000
Received: by outflank-mailman (input) for mailman id 443638;
 Tue, 15 Nov 2022 02:53:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pkVF=3P=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1oum4O-0008Vs-GT
 for xen-devel@lists.xenproject.org; Tue, 15 Nov 2022 02:53:04 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 9f775f60-6490-11ed-8fd2-01056ac49cbb;
 Tue, 15 Nov 2022 03:53:03 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2473F11FB;
 Mon, 14 Nov 2022 18:53:09 -0800 (PST)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 460DE3F73B;
 Mon, 14 Nov 2022 18:53:00 -0800 (PST)
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
X-Inumbo-ID: 9f775f60-6490-11ed-8fd2-01056ac49cbb
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v1 04/13] xen/arm: expand shm_membank for unprovided host address
Date: Tue, 15 Nov 2022 10:52:26 +0800
Message-Id: <20221115025235.1378931-5-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221115025235.1378931-1-Penny.Zheng@arm.com>
References: <20221115025235.1378931-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When host address is not provided in "xen,shared-mem", we let Xen
automatically allocate requested static shared memory from heap, and it
stands good chance of having multiple host memory banks allocated for the
requested static shared memory as a result. Therefore current membank is not
going to cover it.

This commit introduces a new field "mem" to cover both scenarios.
"struct membank" is used when host address is provided, whereas
"struct meminfo" shall be used when host address not provided.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 xen/arch/arm/bootfdt.c           |  6 +++---
 xen/arch/arm/domain_build.c      | 16 ++++++++--------
 xen/arch/arm/include/asm/setup.h | 17 ++++++++++++++++-
 3 files changed, 27 insertions(+), 12 deletions(-)

diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index ccf281cd37..2f34a8ea83 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/arch/arm/bootfdt.c
@@ -458,8 +458,8 @@ static int __init process_shm_node(const void *fdt, int node,
 
     for ( i = 0; i < shm_mem->nr_banks; i++ )
     {
-        paddr_t bank_start = shm_mem->bank[i].membank->start;
-        paddr_t bank_size = shm_mem->bank[i].membank->size;
+        paddr_t bank_start = shm_mem->bank[i].mem.bank->start;
+        paddr_t bank_size = shm_mem->bank[i].mem.bank->size;
 
         /*
          * Meet the following check:
@@ -523,7 +523,7 @@ static int __init process_shm_node(const void *fdt, int node,
             mem->nr_banks++;
 
             safe_strcpy(shm_mem->bank[i].shm_id, shm_id);
-            shm_mem->bank[i].membank = membank;
+            shm_mem->bank[i].mem.bank = membank;
             shm_mem->nr_banks++;
         }
         else
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 92763e96fc..fbb196d8a4 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -818,7 +818,7 @@ static bool __init is_shm_allocated_to_domio(struct shm_membank *shm_membank)
     struct page_info *page;
     struct domain *d;
 
-    page = maddr_to_page(shm_membank->membank->start);
+    page = maddr_to_page(shm_membank->mem.bank->start);
     d = page_get_owner_and_reference(page);
     if ( d == NULL )
         return false;
@@ -878,8 +878,8 @@ static int __init assign_shared_memory(struct domain *d,
     struct page_info *page;
     paddr_t pbase, psize;
 
-    pbase = shm_membank->membank->start;
-    psize = shm_membank->membank->size;
+    pbase = shm_membank->mem.bank->start;
+    psize = shm_membank->mem.bank->size;
 
     printk("%pd: allocate static shared memory BANK %#"PRIpaddr"-%#"PRIpaddr".\n",
            d, pbase, pbase + psize);
@@ -951,9 +951,9 @@ static int __init append_shm_bank_to_domain(struct kernel_info *kinfo,
     if ( membank == NULL )
         return -ENOMEM;
 
-    kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].membank = membank;
-    kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].membank->start = start;
-    kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].membank->size = size;
+    kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].mem.bank = membank;
+    kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].mem.bank->start = start;
+    kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].mem.bank->size = size;
     safe_strcpy(kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].shm_id, shm_id);
     kinfo->shm_mem.nr_banks++;
 
@@ -1422,8 +1422,8 @@ static int __init make_shm_memory_node(const struct domain *d,
 
     for ( ; i < mem->nr_banks; i++ )
     {
-        uint64_t start = mem->bank[i].membank->start;
-        uint64_t size = mem->bank[i].membank->size;
+        uint64_t start = mem->bank[i].mem.bank->start;
+        uint64_t size = mem->bank[i].mem.bank->size;
         /* Placeholder for xen-shmem@ + a 64-bit number + \0 */
         char buf[27];
         const char compat[] = "xen,shared-memory-v1";
diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index 2d4ae0f00a..c54ffc8a5b 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -60,7 +60,22 @@ struct meminfo {
 struct shm_membank {
     char shm_id[MAX_SHM_ID_LENGTH];
     unsigned int nr_shm_borrowers;
-    struct membank *membank;
+    struct {
+        /*
+         * When host address is provided in "xen,shared-mem", then only one
+         * consistent host memory bank is behind each shared memory node.
+         */
+        struct membank *bank;
+        struct {
+            /*
+             * When host address is not provided in "xen,shared-mem", then
+             * we let Xen allocate requested memory from heap, and a shared
+             * memory bank could be consisted of multiple host memory banks.
+             */
+            struct meminfo *meminfo;
+            unsigned long total_size;
+        } banks;
+    } mem;
 };
 
 struct shm_meminfo {
-- 
2.25.1


