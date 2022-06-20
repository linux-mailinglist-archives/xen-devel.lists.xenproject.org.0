Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32396550FA2
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jun 2022 07:12:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.352302.579068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o39hP-0001SF-J6; Mon, 20 Jun 2022 05:11:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 352302.579068; Mon, 20 Jun 2022 05:11:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o39hP-0001PQ-El; Mon, 20 Jun 2022 05:11:43 +0000
Received: by outflank-mailman (input) for mailman id 352302;
 Mon, 20 Jun 2022 05:11:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dqE0=W3=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1o39hN-0000ky-KP
 for xen-devel@lists.xenproject.org; Mon, 20 Jun 2022 05:11:41 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 77c55544-f057-11ec-bd2d-47488cf2e6aa;
 Mon, 20 Jun 2022 07:11:40 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 11D5E113E;
 Sun, 19 Jun 2022 22:11:40 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3FB2D3F7D7;
 Sun, 19 Jun 2022 22:11:36 -0700 (PDT)
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
X-Inumbo-ID: 77c55544-f057-11ec-bd2d-47488cf2e6aa
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v5 3/8] xen/arm: allocate static shared memory to a specific owner domain
Date: Mon, 20 Jun 2022 13:11:09 +0800
Message-Id: <20220620051114.210118-4-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220620051114.210118-1-Penny.Zheng@arm.com>
References: <20220620051114.210118-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If owner property is defined, then owner domain of a static shared memory
region is not the default dom_io anymore, but a specific domain.

This commit implements allocating static shared memory to a specific domain
when owner property is defined.

Coding flow for dealing borrower domain will be introduced later in the
following commits.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
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
 xen/arch/arm/domain_build.c | 44 +++++++++++++++++++++++++++----------
 1 file changed, 33 insertions(+), 11 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 91a5ace851..d4fd64e2bd 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -805,9 +805,11 @@ static mfn_t __init acquire_shared_memory_bank(struct domain *d,
  */
 static int __init allocate_shared_memory(struct domain *d,
                                          u32 addr_cells, u32 size_cells,
-                                         paddr_t pbase, paddr_t psize)
+                                         paddr_t pbase, paddr_t psize,
+                                         paddr_t gbase)
 {
     mfn_t smfn;
+    int ret = 0;
 
     dprintk(XENLOG_INFO,
             "Allocate static shared memory BANK %#"PRIpaddr"-%#"PRIpaddr".\n",
@@ -822,8 +824,18 @@ static int __init allocate_shared_memory(struct domain *d,
      * DOMID_IO is the domain, like DOMID_XEN, that is not auto-translated.
      * It sees RAM 1:1 and we do not need to create P2M mapping for it
      */
-    ASSERT(d == dom_io);
-    return 0;
+    if ( d != dom_io )
+    {
+        ret = guest_physmap_add_pages(d, gaddr_to_gfn(gbase), smfn, PFN_DOWN(psize));
+        if ( ret )
+        {
+            printk(XENLOG_ERR
+                   "Failed to map shared memory to %pd.\n", d);
+            return ret;
+        }
+    }
+
+    return ret;
 }
 
 static int __init process_shm(struct domain *d,
@@ -836,6 +848,8 @@ static int __init process_shm(struct domain *d,
     u32 shm_id;
     u32 addr_cells, size_cells;
     paddr_t gbase, pbase, psize;
+    const char *role_str;
+    bool owner_dom_io = true;
 
     dt_for_each_child_node(node, shm_node)
     {
@@ -862,19 +876,27 @@ static int __init process_shm(struct domain *d,
         ASSERT(IS_ALIGNED(pbase, PAGE_SIZE) && IS_ALIGNED(psize, PAGE_SIZE));
         gbase = dt_read_number(cells, addr_cells);
 
-        /* TODO: Consider owner domain is not the default dom_io. */
+        /*
+         * "role" property is optional and if it is defined explicitly,
+         * then the owner domain is not the default "dom_io" domain.
+         */
+        if ( dt_property_read_string(shm_node, "role", &role_str) == 0 )
+            owner_dom_io = false;
+
         /*
          * Per static shared memory region could be shared between multiple
          * domains.
-         * In case re-allocating the same shared memory region, we check
-         * if it is already allocated to the default owner dom_io before
-         * the actual allocation.
+         * So when owner domain is the default dom_io, in case re-allocating
+         * the same shared memory region, we check if it is already allocated
+         * to the default owner dom_io before the actual allocation.
          */
-        if ( !is_shm_allocated_to_domio(pbase) )
+        if ( (owner_dom_io && !is_shm_allocated_to_domio(pbase)) ||
+             (!owner_dom_io && strcmp(role_str, "owner") == 0) )
         {
-            /* Allocate statically shared pages to the default owner dom_io. */
-            ret = allocate_shared_memory(dom_io, addr_cells, size_cells,
-                                         pbase, psize);
+            /* Allocate statically shared pages to the owner domain. */
+            ret = allocate_shared_memory(owner_dom_io ? dom_io : d,
+                                         addr_cells, size_cells,
+                                         pbase, psize, gbase);
             if ( ret )
                 return ret;
         }
-- 
2.25.1


