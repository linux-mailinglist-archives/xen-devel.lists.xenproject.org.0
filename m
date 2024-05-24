Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 407308CE56A
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 14:41:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729482.1134666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAUEV-0000PT-Gq; Fri, 24 May 2024 12:41:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729482.1134666; Fri, 24 May 2024 12:41:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAUEV-0000N3-9L; Fri, 24 May 2024 12:41:15 +0000
Received: by outflank-mailman (input) for mailman id 729482;
 Fri, 24 May 2024 12:41:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BPhY=M3=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1sAUET-00082M-C8
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 12:41:13 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id e471831c-19ca-11ef-90a1-e314d9c70b13;
 Fri, 24 May 2024 14:41:08 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9716A1684;
 Fri, 24 May 2024 05:41:31 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A56513F641;
 Fri, 24 May 2024 05:41:06 -0700 (PDT)
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
X-Inumbo-ID: e471831c-19ca-11ef-90a1-e314d9c70b13
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 2/7] xen/arm: Wrap shared memory mapping code in one function
Date: Fri, 24 May 2024 13:40:50 +0100
Message-Id: <20240524124055.3871399-3-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240524124055.3871399-1-luca.fancellu@arm.com>
References: <20240524124055.3871399-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Wrap the code and logic that is calling assign_shared_memory
and map_regions_p2mt into a new function 'handle_shared_mem_bank',
it will become useful later when the code will allow the user to
don't pass the host physical address.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
v3 changes:
 - check return value of dt_property_read_string, add R-by Michal
v2 changes:
 - add blank line, move owner_dom_io computation inside
   handle_shared_mem_bank in order to reduce args count, remove
   not needed BUGON(). (Michal)
---
 xen/arch/arm/static-shmem.c | 86 +++++++++++++++++++++++--------------
 1 file changed, 53 insertions(+), 33 deletions(-)

diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
index 0a1c327e90ea..c15a65130659 100644
--- a/xen/arch/arm/static-shmem.c
+++ b/xen/arch/arm/static-shmem.c
@@ -180,6 +180,53 @@ append_shm_bank_to_domain(struct kernel_info *kinfo, paddr_t start,
     return 0;
 }
 
+static int __init handle_shared_mem_bank(struct domain *d, paddr_t gbase,
+                                         const char *role_str,
+                                         const struct membank *shm_bank)
+{
+    bool owner_dom_io = true;
+    paddr_t pbase, psize;
+    int ret;
+
+    pbase = shm_bank->start;
+    psize = shm_bank->size;
+
+    /*
+     * "role" property is optional and if it is defined explicitly,
+     * then the owner domain is not the default "dom_io" domain.
+     */
+    if ( role_str != NULL )
+        owner_dom_io = false;
+
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
@@ -196,7 +243,6 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
         unsigned int i;
         const char *role_str;
         const char *shm_id;
-        bool owner_dom_io = true;
 
         if ( !dt_device_is_compatible(shm_node, "xen,domain-shared-memory-v1") )
             continue;
@@ -237,39 +283,13 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
                 return -EINVAL;
             }
 
-        /*
-         * "role" property is optional and if it is defined explicitly,
-         * then the owner domain is not the default "dom_io" domain.
-         */
-        if ( dt_property_read_string(shm_node, "role", &role_str) == 0 )
-            owner_dom_io = false;
+        /* "role" property is optional */
+        if ( dt_property_read_string(shm_node, "role", &role_str) != 0 )
+            role_str = NULL;
 
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
+        ret = handle_shared_mem_bank(d, gbase, role_str, boot_shm_bank);
+        if ( ret )
+            return ret;
 
         /*
          * Record static shared memory region info for later setting
-- 
2.34.1


