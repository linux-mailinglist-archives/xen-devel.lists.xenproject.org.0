Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5FA629047
	for <lists+xen-devel@lfdr.de>; Tue, 15 Nov 2022 04:00:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443684.698419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oumBf-0007XT-Fg; Tue, 15 Nov 2022 03:00:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443684.698419; Tue, 15 Nov 2022 03:00:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oumBf-0007VQ-CU; Tue, 15 Nov 2022 03:00:35 +0000
Received: by outflank-mailman (input) for mailman id 443684;
 Tue, 15 Nov 2022 03:00:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pkVF=3P=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1oum4k-0000BJ-TG
 for xen-devel@lists.xenproject.org; Tue, 15 Nov 2022 02:53:27 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id ac712f45-6490-11ed-91b6-6bf2151ebd3b;
 Tue, 15 Nov 2022 03:53:25 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C902C11FB;
 Mon, 14 Nov 2022 18:53:30 -0800 (PST)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EA06A3F73B;
 Mon, 14 Nov 2022 18:53:21 -0800 (PST)
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
X-Inumbo-ID: ac712f45-6490-11ed-91b6-6bf2151ebd3b
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v1 11/13] xen/arm: implement "xen,offset" feature when host address provided
Date: Tue, 15 Nov 2022 10:52:33 +0800
Message-Id: <20221115025235.1378931-12-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221115025235.1378931-1-Penny.Zheng@arm.com>
References: <20221115025235.1378931-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When host address is provided in "xen,shared-mem" property([pbase,
gbase, psize]), it is easy to decide where to map to the borrower
domain if "xen,offset" is also provided.
The partially-shared region shall be starting at pbase + offset, and
ending at pbase + size.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 xen/arch/arm/domain_build.c | 30 +++++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 80d37245a8..95600c640c 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1112,7 +1112,7 @@ static int __init assign_shared_memory(struct domain *d,
 
 static int __init borrower_physmap_add_memory(struct domain *d,
                                               struct shm_membank *shm_membank,
-                                              paddr_t gbase)
+                                              paddr_t gbase, paddr_t offset)
 {
     int ret;
     unsigned int i;
@@ -1141,8 +1141,8 @@ static int __init borrower_physmap_add_memory(struct domain *d,
     }
     else
     {
-        start = shm_membank->mem.bank->start;
-        size = shm_membank->mem.bank->size;
+        start = shm_membank->mem.bank->start + offset;
+        size = shm_membank->mem.bank->size - offset;
         sgfn = _gfn(PFN_UP(gbase));
 
         /* Set up P2M foreign mapping for borrower domain. */
@@ -1157,7 +1157,7 @@ static int __init borrower_physmap_add_memory(struct domain *d,
 
 static int __init append_shm_bank_to_domain(struct kernel_info *kinfo,
                                             paddr_t start, paddr_t size,
-                                            const char *shm_id)
+                                            const char *shm_id, paddr_t offset)
 {
     struct membank *membank;
 
@@ -1170,7 +1170,7 @@ static int __init append_shm_bank_to_domain(struct kernel_info *kinfo,
 
     kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].mem.bank = membank;
     kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].mem.bank->start = start;
-    kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].mem.bank->size = size;
+    kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].mem.bank->size = size - offset;
     safe_strcpy(kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].shm_id, shm_id);
     kinfo->shm_mem.nr_banks++;
 
@@ -1265,6 +1265,7 @@ static int __init process_shm(struct domain *d, struct kernel_info *kinfo,
         const char *shm_id;
         bool owner_dom_io = true, paddr_assigned = true;
         struct shm_membank *shm_membank;
+        uint64_t offset = 0UL;
 
         if ( !dt_device_is_compatible(shm_node, "xen,domain-shared-memory-v1") )
             continue;
@@ -1288,6 +1289,19 @@ static int __init process_shm(struct domain *d, struct kernel_info *kinfo,
         }
         BUG_ON((strlen(shm_id) <= 0) || (strlen(shm_id) >= MAX_SHM_ID_LENGTH));
 
+        /*
+         * If "xen,offset" is provided, then only partial shared memory
+         * shall be mapped to borrower domain.
+         * "xen,offset" is a 64-bit integer and an optional property
+         */
+        dt_property_read_u64(shm_node, "xen,offset", &offset);
+        if ( !IS_ALIGNED(offset, PAGE_SIZE) )
+        {
+            printk("%pd: \"xen,offset\" 0x%lx is not suitably aligned\n",
+                   d, offset);
+            return -EINVAL;
+        }
+
         shm_membank = acquire_shm_membank(shm_id);
         if ( !shm_membank )
         {
@@ -1331,7 +1345,8 @@ static int __init process_shm(struct domain *d, struct kernel_info *kinfo,
 
         if ( owner_dom_io || (strcmp(role_str, "borrower") == 0) )
         {
-            ret = borrower_physmap_add_memory(d, shm_membank, gbase);
+            ret = borrower_physmap_add_memory(d, shm_membank, gbase,
+                                              (paddr_t)offset);
             if ( ret )
             {
                 printk(XENLOG_ERR
@@ -1345,7 +1360,8 @@ static int __init process_shm(struct domain *d, struct kernel_info *kinfo,
          * Record static shared memory region info for later setting
          * up shm-node in guest device tree.
          */
-        ret = append_shm_bank_to_domain(kinfo, gbase, psize, shm_id);
+        ret = append_shm_bank_to_domain(kinfo, gbase, psize, shm_id,
+                                        (paddr_t)offset);
         if ( ret )
             return ret;
     }
-- 
2.25.1


