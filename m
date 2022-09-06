Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 804875AE3A9
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 11:00:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399679.640934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVURC-0001R0-Rd; Tue, 06 Sep 2022 09:00:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399679.640934; Tue, 06 Sep 2022 09:00:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVURC-0001OV-NY; Tue, 06 Sep 2022 09:00:06 +0000
Received: by outflank-mailman (input) for mailman id 399679;
 Tue, 06 Sep 2022 09:00:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YUvx=ZJ=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1oVURA-0007aG-WC
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 09:00:05 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 4bbc61ce-2dc2-11ed-a016-b9edf5238543;
 Tue, 06 Sep 2022 11:00:03 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81ABA139F;
 Tue,  6 Sep 2022 02:00:09 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A70BC3F7B4;
 Tue,  6 Sep 2022 02:00:00 -0700 (PDT)
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
X-Inumbo-ID: 4bbc61ce-2dc2-11ed-a016-b9edf5238543
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v7 3/9] xen/arm: allocate static shared memory to a specific owner domain
Date: Tue,  6 Sep 2022 16:59:35 +0800
Message-Id: <20220906085941.944592-4-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220906085941.944592-1-Penny.Zheng@arm.com>
References: <20220906085941.944592-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If owner property is defined, then owner domain of a static shared memory
region is not the default dom_io anymore, but a specific domain.

This commit implements allocating static shared memory to a specific domain
when owner property is defined.

Coding flow for dealing borrower domain will be introduced later in the
following commits.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
v7 chhanges:
- adapt to the previous commits' changes
---
v6 change:
- fix coding-style
- role_str and owner_dom_io shall be defined within the loop
---
v5 change:
- no change
---
v4 change:
- no changes
---
v3 change:
- simplify the code since o_gbase is not used if the domain is dom_io
---
v2 change:
- P2M mapping is restricted to normal domain
- in-code comment fix
---
 xen/arch/arm/domain_build.c | 36 +++++++++++++++++++++++++++++-------
 1 file changed, 29 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index be98ff83b1..4be8a00171 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -822,9 +822,11 @@ static mfn_t __init acquire_shared_memory_bank(struct domain *d,
 
 static int __init assign_shared_memory(struct domain *d,
                                        uint32_t addr_cells, uint32_t size_cells,
-                                       paddr_t pbase, paddr_t psize)
+                                       paddr_t pbase, paddr_t psize,
+                                       paddr_t gbase)
 {
     mfn_t smfn;
+    int ret = 0;
 
     dprintk(XENLOG_INFO,
             "%pd: allocate static shared memory BANK %#"PRIpaddr"-%#"PRIpaddr".\n",
@@ -838,8 +840,18 @@ static int __init assign_shared_memory(struct domain *d,
      * DOMID_IO is auto-translated (i.e. it seems RAM 1:1). So we do not need
      * to create mapping in the P2M.
      */
-    ASSERT(d == dom_io);
-    return 0;
+    if ( d != dom_io )
+    {
+        ret = guest_physmap_add_pages(d, gaddr_to_gfn(gbase), smfn,
+                                      PFN_DOWN(psize));
+        if ( ret )
+        {
+            printk(XENLOG_ERR "Failed to map shared memory to %pd.\n", d);
+            return ret;
+        }
+    }
+
+    return ret;
 }
 
 static int __init process_shm(struct domain *d,
@@ -855,6 +867,8 @@ static int __init process_shm(struct domain *d,
         paddr_t gbase, pbase, psize;
         int ret = 0;
         unsigned int i;
+        const char *role_str;
+        bool owner_dom_io = true;
 
         if ( !dt_device_is_compatible(shm_node, "xen,domain-shared-memory-v1") )
             continue;
@@ -891,20 +905,28 @@ static int __init process_shm(struct domain *d,
                 return -EINVAL;
             }
 
-        /* TODO: Consider owner domain is not the default dom_io. */
+        /*
+         * "role" property is optional and if it is defined explicitly,
+         * then the owner domain is not the default "dom_io" domain.
+         */
+        if ( dt_property_read_string(shm_node, "role", &role_str) == 0 )
+            owner_dom_io = false;
+
         /*
          * DOMID_IO is a fake domain and is not described in the Device-Tree.
          * Therefore when the owner of the shared region is DOMID_IO, we will
          * only find the borrowers.
          */
-        if ( !is_shm_allocated_to_domio(pbase) )
+        if ( (owner_dom_io && !is_shm_allocated_to_domio(pbase)) ||
+             (!owner_dom_io && strcmp(role_str, "owner") == 0) )
         {
             /*
              * We found the first borrower of the region, the owner was not
              * specified, so they should be assigned to dom_io.
              */
-            ret = assign_shared_memory(dom_io, addr_cells, size_cells,
-                                       pbase, psize);
+            ret = assign_shared_memory(owner_dom_io ? dom_io : d,
+                                       addr_cells, size_cells,
+                                       pbase, psize, gbase);
             if ( ret )
                 return ret;
         }
-- 
2.25.1


