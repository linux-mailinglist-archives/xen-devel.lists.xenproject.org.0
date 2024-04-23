Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F3C8ADFAB
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 10:26:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710381.1109570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzBTJ-0002nX-Jw; Tue, 23 Apr 2024 08:25:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710381.1109570; Tue, 23 Apr 2024 08:25:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzBTJ-0002k4-Gw; Tue, 23 Apr 2024 08:25:49 +0000
Received: by outflank-mailman (input) for mailman id 710381;
 Tue, 23 Apr 2024 08:25:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eHxu=L4=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1rzBTH-0002VX-TS
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 08:25:47 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 14d33859-014b-11ef-909a-e314d9c70b13;
 Tue, 23 Apr 2024 10:25:46 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 31EBE1476;
 Tue, 23 Apr 2024 01:26:13 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4E6313F64C;
 Tue, 23 Apr 2024 01:25:44 -0700 (PDT)
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
X-Inumbo-ID: 14d33859-014b-11ef-909a-e314d9c70b13
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 2/7] xen/arm: Wrap shared memory mapping code in one function
Date: Tue, 23 Apr 2024 09:25:27 +0100
Message-Id: <20240423082532.776623-3-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240423082532.776623-1-luca.fancellu@arm.com>
References: <20240423082532.776623-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Wrap the code and logic that is calling assign_shared_memory
and map_regions_p2mt into a new function 'handle_shared_mem_bank',
it will become useful later when the code will allow the user to
don't pass the host physical address.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/arch/arm/static-shmem.c | 71 +++++++++++++++++++++++--------------
 1 file changed, 45 insertions(+), 26 deletions(-)

diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
index f6cf74e58a83..24e40495a481 100644
--- a/xen/arch/arm/static-shmem.c
+++ b/xen/arch/arm/static-shmem.c
@@ -185,6 +185,47 @@ append_shm_bank_to_domain(struct shared_meminfo *kinfo_shm_mem, paddr_t start,
     return 0;
 }
 
+static int __init handle_shared_mem_bank(struct domain *d, paddr_t gbase,
+                                         bool owner_dom_io,
+                                         const char *role_str,
+                                         const struct membank *shm_bank)
+{
+    paddr_t pbase, psize;
+    int ret;
+
+    BUG_ON(!shm_bank);
+
+    pbase = shm_bank->start;
+    psize = shm_bank->size;
+    /*
+     * DOMID_IO is a fake domain and is not described in the Device-Tree.
+     * Therefore when the owner of the shared region is DOMID_IO, we will
+     * only find the borrowers.
+     */
+    if ( (owner_dom_io && !is_shm_allocated_to_domio(pbase)) ||
+         (!owner_dom_io && strcmp(role_str, "owner") == 0) )
+    {
+        /*
+         * We found the first borrower of the region, the owner was not
+         * specified, so they should be assigned to dom_io.
+         */
+        ret = assign_shared_memory(owner_dom_io ? dom_io : d, gbase, shm_bank);
+        if ( ret )
+            return ret;
+    }
+
+    if ( owner_dom_io || (strcmp(role_str, "borrower") == 0) )
+    {
+        /* Set up P2M foreign mapping for borrower domain. */
+        ret = map_regions_p2mt(d, _gfn(PFN_UP(gbase)), PFN_DOWN(psize),
+                               _mfn(PFN_UP(pbase)), p2m_map_foreign_rw);
+        if ( ret )
+            return ret;
+    }
+
+    return 0;
+}
+
 int __init process_shm(struct domain *d, struct kernel_info *kinfo,
                        const struct dt_device_node *node)
 {
@@ -249,32 +290,10 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
         if ( dt_property_read_string(shm_node, "role", &role_str) == 0 )
             owner_dom_io = false;
 
-        /*
-         * DOMID_IO is a fake domain and is not described in the Device-Tree.
-         * Therefore when the owner of the shared region is DOMID_IO, we will
-         * only find the borrowers.
-         */
-        if ( (owner_dom_io && !is_shm_allocated_to_domio(pbase)) ||
-             (!owner_dom_io && strcmp(role_str, "owner") == 0) )
-        {
-            /*
-             * We found the first borrower of the region, the owner was not
-             * specified, so they should be assigned to dom_io.
-             */
-            ret = assign_shared_memory(owner_dom_io ? dom_io : d, gbase,
-                                       boot_shm_bank);
-            if ( ret )
-                return ret;
-        }
-
-        if ( owner_dom_io || (strcmp(role_str, "borrower") == 0) )
-        {
-            /* Set up P2M foreign mapping for borrower domain. */
-            ret = map_regions_p2mt(d, _gfn(PFN_UP(gbase)), PFN_DOWN(psize),
-                                   _mfn(PFN_UP(pbase)), p2m_map_foreign_rw);
-            if ( ret )
-                return ret;
-        }
+        ret = handle_shared_mem_bank(d, gbase, owner_dom_io, role_str,
+                                     boot_shm_bank);
+        if ( ret )
+            return ret;
 
         /*
          * Record static shared memory region info for later setting
-- 
2.34.1


