Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6031A62900D
	for <lists+xen-devel@lfdr.de>; Tue, 15 Nov 2022 03:53:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443635.698308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oum4I-0000NN-DZ; Tue, 15 Nov 2022 02:52:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443635.698308; Tue, 15 Nov 2022 02:52:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oum4I-0000Kf-Ar; Tue, 15 Nov 2022 02:52:58 +0000
Received: by outflank-mailman (input) for mailman id 443635;
 Tue, 15 Nov 2022 02:52:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pkVF=3P=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1oum4G-0000BJ-RK
 for xen-devel@lists.xenproject.org; Tue, 15 Nov 2022 02:52:56 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 99feff1e-6490-11ed-91b6-6bf2151ebd3b;
 Tue, 15 Nov 2022 03:52:55 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D1B9913D5;
 Mon, 14 Nov 2022 18:52:59 -0800 (PST)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F37B13F73B;
 Mon, 14 Nov 2022 18:52:50 -0800 (PST)
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
X-Inumbo-ID: 99feff1e-6490-11ed-91b6-6bf2151ebd3b
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v1 01/13] xen/arm: re-arrange the static shared memory region
Date: Tue, 15 Nov 2022 10:52:23 +0800
Message-Id: <20221115025235.1378931-2-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221115025235.1378931-1-Penny.Zheng@arm.com>
References: <20221115025235.1378931-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit re-arranges the static shared memory regions into a separate array
shm_meminfo. And static shared memory region now would have its own structure
'shm_membank' to hold all shm-related members, like shm_id, etc, and a pointer
to the normal memory bank 'membank'. This will avoid continuing to grow
'membank'.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 xen/arch/arm/bootfdt.c            | 40 +++++++++++++++++++------------
 xen/arch/arm/domain_build.c       | 35 ++++++++++++++++-----------
 xen/arch/arm/include/asm/kernel.h |  2 +-
 xen/arch/arm/include/asm/setup.h  | 16 +++++++++----
 4 files changed, 59 insertions(+), 34 deletions(-)

diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index 6014c0f852..ccf281cd37 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/arch/arm/bootfdt.c
@@ -384,6 +384,7 @@ static int __init process_shm_node(const void *fdt, int node,
     const __be32 *cell;
     paddr_t paddr, gaddr, size;
     struct meminfo *mem = &bootinfo.reserved_mem;
+    struct shm_meminfo *shm_mem = &bootinfo.shm_mem;
     unsigned int i;
     int len;
     bool owner = false;
@@ -455,17 +456,21 @@ static int __init process_shm_node(const void *fdt, int node,
         return -EINVAL;
     }
 
-    for ( i = 0; i < mem->nr_banks; i++ )
+    for ( i = 0; i < shm_mem->nr_banks; i++ )
     {
+        paddr_t bank_start = shm_mem->bank[i].membank->start;
+        paddr_t bank_size = shm_mem->bank[i].membank->size;
+
         /*
          * Meet the following check:
          * 1) The shm ID matches and the region exactly match
          * 2) The shm ID doesn't match and the region doesn't overlap
          * with an existing one
          */
-        if ( paddr == mem->bank[i].start && size == mem->bank[i].size )
+        if ( paddr == bank_start && size == bank_size )
         {
-            if ( strncmp(shm_id, mem->bank[i].shm_id, MAX_SHM_ID_LENGTH) == 0 )
+            if ( strncmp(shm_id,
+                         shm_mem->bank[i].shm_id, MAX_SHM_ID_LENGTH) == 0 )
                 break;
             else
             {
@@ -477,17 +482,17 @@ static int __init process_shm_node(const void *fdt, int node,
         else
         {
             paddr_t end = paddr + size;
-            paddr_t bank_end = mem->bank[i].start + mem->bank[i].size;
+            paddr_t bank_end = bank_start + bank_size;
 
-            if ( (end <= paddr) || (bank_end <= mem->bank[i].start) )
+            if ( (end <= paddr) || (bank_end <= bank_start) )
             {
                 printk("fdt: static shared memory region %s overflow\n", shm_id);
                 return -EINVAL;
             }
 
-            if ( (end <= mem->bank[i].start) || (paddr >= bank_end) )
+            if ( (end <= bank_start) || (paddr >= bank_end) )
             {
-                if ( strcmp(shm_id, mem->bank[i].shm_id) != 0 )
+                if ( strcmp(shm_id, shm_mem->bank[i].shm_id) != 0 )
                     continue;
                 else
                 {
@@ -499,22 +504,27 @@ static int __init process_shm_node(const void *fdt, int node,
             else
             {
                 printk("fdt: shared memory region overlap with an existing entry %#"PRIpaddr" - %#"PRIpaddr"\n",
-                        mem->bank[i].start, bank_end);
+                        bank_start, bank_end);
                 return -EINVAL;
             }
         }
     }
 
-    if ( i == mem->nr_banks )
+    if ( i == shm_mem->nr_banks )
     {
-        if ( i < NR_MEM_BANKS )
+        if ( (i < NR_MEM_BANKS) && (mem->nr_banks < NR_MEM_BANKS) )
         {
             /* Static shared memory shall be reserved from any other use. */
-            safe_strcpy(mem->bank[mem->nr_banks].shm_id, shm_id);
-            mem->bank[mem->nr_banks].start = paddr;
-            mem->bank[mem->nr_banks].size = size;
-            mem->bank[mem->nr_banks].type = MEMBANK_STATIC_DOMAIN;
+            struct membank *membank = &mem->bank[mem->nr_banks];
+
+            membank->start = paddr;
+            membank->size = size;
+            membank->type = MEMBANK_STATIC_DOMAIN;
             mem->nr_banks++;
+
+            safe_strcpy(shm_mem->bank[i].shm_id, shm_id);
+            shm_mem->bank[i].membank = membank;
+            shm_mem->nr_banks++;
         }
         else
         {
@@ -527,7 +537,7 @@ static int __init process_shm_node(const void *fdt, int node,
      * to calculate the reference count.
      */
     if ( !owner )
-        mem->bank[i].nr_shm_borrowers++;
+        shm_mem->bank[i].nr_shm_borrowers++;
 
     return 0;
 }
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index bd30d3798c..c0fd13f6ed 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -757,20 +757,20 @@ static int __init acquire_nr_borrower_domain(struct domain *d,
 {
     unsigned int bank;
 
-    /* Iterate reserved memory to find requested shm bank. */
-    for ( bank = 0 ; bank < bootinfo.reserved_mem.nr_banks; bank++ )
+    /* Iterate static shared memory to find requested shm bank. */
+    for ( bank = 0 ; bank < bootinfo.shm_mem.nr_banks; bank++ )
     {
-        paddr_t bank_start = bootinfo.reserved_mem.bank[bank].start;
-        paddr_t bank_size = bootinfo.reserved_mem.bank[bank].size;
+        paddr_t bank_start = bootinfo.shm_mem.bank[bank].membank->start;
+        paddr_t bank_size = bootinfo.shm_mem.bank[bank].membank->size;
 
         if ( (pbase == bank_start) && (psize == bank_size) )
             break;
     }
 
-    if ( bank == bootinfo.reserved_mem.nr_banks )
+    if ( bank == bootinfo.shm_mem.nr_banks )
         return -ENOENT;
 
-    *nr_borrowers = bootinfo.reserved_mem.bank[bank].nr_shm_borrowers;
+    *nr_borrowers = bootinfo.shm_mem.bank[bank].nr_shm_borrowers;
 
     return 0;
 }
@@ -907,11 +907,18 @@ static int __init append_shm_bank_to_domain(struct kernel_info *kinfo,
                                             paddr_t start, paddr_t size,
                                             const char *shm_id)
 {
+    struct membank *membank;
+
     if ( kinfo->shm_mem.nr_banks >= NR_MEM_BANKS )
         return -ENOMEM;
 
-    kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].start = start;
-    kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].size = size;
+    membank = xmalloc_bytes(sizeof(struct membank));
+    if ( membank == NULL )
+        return -ENOMEM;
+
+    kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].membank = membank;
+    kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].membank->start = start;
+    kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].membank->size = size;
     safe_strcpy(kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].shm_id, shm_id);
     kinfo->shm_mem.nr_banks++;
 
@@ -1355,7 +1362,7 @@ static int __init make_memory_node(const struct domain *d,
 static int __init make_shm_memory_node(const struct domain *d,
                                        void *fdt,
                                        int addrcells, int sizecells,
-                                       const struct meminfo *mem)
+                                       const struct shm_meminfo *mem)
 {
     unsigned int i = 0;
     int res = 0;
@@ -1372,8 +1379,8 @@ static int __init make_shm_memory_node(const struct domain *d,
 
     for ( ; i < mem->nr_banks; i++ )
     {
-        uint64_t start = mem->bank[i].start;
-        uint64_t size = mem->bank[i].size;
+        uint64_t start = mem->bank[i].membank->start;
+        uint64_t size = mem->bank[i].membank->size;
         /* Placeholder for xen-shmem@ + a 64-bit number + \0 */
         char buf[27];
         const char compat[] = "xen,shared-memory-v1";
@@ -1382,7 +1389,7 @@ static int __init make_shm_memory_node(const struct domain *d,
         __be32 *cells;
         unsigned int len = (addrcells + sizecells) * sizeof(__be32);
 
-        snprintf(buf, sizeof(buf), "xen-shmem@%"PRIx64, mem->bank[i].start);
+        snprintf(buf, sizeof(buf), "xen-shmem@%"PRIx64, start);
         res = fdt_begin_node(fdt, buf);
         if ( res )
             return res;
@@ -1426,7 +1433,7 @@ static int __init make_shm_memory_node(const struct domain *d,
 static int __init make_shm_memory_node(const struct domain *d,
                                        void *fdt,
                                        int addrcells, int sizecells,
-                                       const struct meminfo *mem)
+                                       const struct shm_meminfo *mem)
 {
     ASSERT_UNREACHABLE();
     return -EOPNOTSUPP;
@@ -1436,7 +1443,7 @@ static int __init make_shm_memory_node(const struct domain *d,
 static int __init make_resv_memory_node(const struct domain *d,
                                         void *fdt,
                                         int addrcells, int sizecells,
-                                        const struct meminfo *mem)
+                                        const struct shm_meminfo *mem)
 {
     int res = 0;
     /* Placeholder for reserved-memory\0 */
diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/asm/kernel.h
index 5bb30c3f2f..f47ba9d619 100644
--- a/xen/arch/arm/include/asm/kernel.h
+++ b/xen/arch/arm/include/asm/kernel.h
@@ -38,7 +38,7 @@ struct kernel_info {
     void *fdt; /* flat device tree */
     paddr_t unassigned_mem; /* RAM not (yet) assigned to a bank */
     struct meminfo mem;
-    struct meminfo shm_mem;
+    struct shm_meminfo shm_mem;
 
     /* kernel entry point */
     paddr_t entry;
diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index fdbf68aadc..2d4ae0f00a 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -50,10 +50,6 @@ struct membank {
     paddr_t start;
     paddr_t size;
     enum membank_type type;
-#ifdef CONFIG_STATIC_SHM
-    char shm_id[MAX_SHM_ID_LENGTH];
-    unsigned int nr_shm_borrowers;
-#endif
 };
 
 struct meminfo {
@@ -61,6 +57,17 @@ struct meminfo {
     struct membank bank[NR_MEM_BANKS];
 };
 
+struct shm_membank {
+    char shm_id[MAX_SHM_ID_LENGTH];
+    unsigned int nr_shm_borrowers;
+    struct membank *membank;
+};
+
+struct shm_meminfo {
+    unsigned int nr_banks;
+    struct shm_membank bank[NR_MEM_BANKS];
+};
+
 /*
  * The domU flag is set for kernels and ramdisks of "xen,domain" nodes.
  * The purpose of the domU flag is to avoid getting confused in
@@ -105,6 +112,7 @@ struct bootinfo {
     struct meminfo acpi;
 #endif
     bool static_heap;
+    struct shm_meminfo shm_mem;
 };
 
 struct map_range_data
-- 
2.25.1


