Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDA44E456C
	for <lists+xen-devel@lfdr.de>; Tue, 22 Mar 2022 18:45:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293618.498834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWiYv-0001hS-6y; Tue, 22 Mar 2022 17:44:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293618.498834; Tue, 22 Mar 2022 17:44:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWiYv-0001fd-3e; Tue, 22 Mar 2022 17:44:53 +0000
Received: by outflank-mailman (input) for mailman id 293618;
 Tue, 22 Mar 2022 17:44:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dCW+=UB=intel.com=tamas.lengyel@srs-se1.protection.inumbo.net>)
 id 1nWiYt-0001fS-Ew
 for xen-devel@lists.xenproject.org; Tue, 22 Mar 2022 17:44:51 +0000
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c3536900-aa07-11ec-8fbc-03012f2f19d4;
 Tue, 22 Mar 2022 18:44:48 +0100 (CET)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2022 10:41:58 -0700
Received: from pinedahx-mobl.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.212.28.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2022 10:41:56 -0700
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
X-Inumbo-ID: c3536900-aa07-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647971088; x=1679507088;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Xhk57vQMBQZ8sZcCs2TYjPxJVd9VK6VDSHI+BKv+lWo=;
  b=XAgMH1FL9Bognn3WStYE6NdcKXgl6bDiUDuB6rWZ7vEYxCVg0o34d6yW
   kPJP4oSbJ5AShEBescGh05GGo0vcFOOIpfWXaNHXyNsLz+q6Z9+zBu4vd
   yWt649EB1/agZGzabDQoi0+jonrTB8mlOoMStBalnKY3MrWMtrKpv4G3O
   84NbkQgL8nWXKMKlJEctpzEU280me9UJOLh9ma9Jzn3qnzW7OVYbgFz1J
   iqIZGRvGrhSiS9quHjlnLHNTR67Y2OaTuPUEHUOp7fGr+F9EMh+Om+cr4
   uX4srKbBXdaNFzuQbsYnVidlMxBwQVsAEfaVzwZGT4UPS1k9yLrwGLcPJ
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10294"; a="321097366"
X-IronPort-AV: E=Sophos;i="5.90,202,1643702400"; 
   d="scan'208";a="321097366"
X-IronPort-AV: E=Sophos;i="5.90,202,1643702400"; 
   d="scan'208";a="717039014"
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Tamas K Lengyel <tamas@tklengyel.com>
Subject: [PATCH 1/3] x86/mem_sharing: option to skip populating special pages during fork
Date: Tue, 22 Mar 2022 13:41:37 -0400
Message-Id: <fb927228a8f68ce983ae0b46e6665b5b8dd0764e.1647970630.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add option to the fork memop to skip populating the fork with special pages.
These special pages are only necessary when setting up forks to be fully
functional with a toolstack. For short-lived forks where no toolstack is active
these pages are uneccesary.

Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
---
 xen/arch/x86/include/asm/hvm/domain.h |  4 +++-
 xen/arch/x86/mm/mem_sharing.c         | 33 +++++++++++++++++----------
 xen/include/public/memory.h           |  4 ++--
 3 files changed, 26 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/include/asm/hvm/domain.h b/xen/arch/x86/include/asm/hvm/domain.h
index 698455444e..446cd06411 100644
--- a/xen/arch/x86/include/asm/hvm/domain.h
+++ b/xen/arch/x86/include/asm/hvm/domain.h
@@ -31,7 +31,9 @@
 #ifdef CONFIG_MEM_SHARING
 struct mem_sharing_domain
 {
-    bool enabled, block_interrupts;
+    bool enabled;
+    bool block_interrupts;
+    bool skip_special_pages;
 
     /*
      * When releasing shared gfn's in a preemptible manner, recall where
diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index 15e6a7ed81..84c04ddfa3 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -1643,7 +1643,8 @@ static int bring_up_vcpus(struct domain *cd, struct domain *d)
     return 0;
 }
 
-static int copy_vcpu_settings(struct domain *cd, const struct domain *d)
+static int copy_vcpu_settings(struct domain *cd, const struct domain *d,
+                              bool skip_special_pages)
 {
     unsigned int i;
     struct p2m_domain *p2m = p2m_get_hostp2m(cd);
@@ -1660,7 +1661,7 @@ static int copy_vcpu_settings(struct domain *cd, const struct domain *d)
 
         /* Copy & map in the vcpu_info page if the guest uses one */
         vcpu_info_mfn = d_vcpu->vcpu_info_mfn;
-        if ( !mfn_eq(vcpu_info_mfn, INVALID_MFN) )
+        if ( !skip_special_pages && !mfn_eq(vcpu_info_mfn, INVALID_MFN) )
         {
             mfn_t new_vcpu_info_mfn = cd_vcpu->vcpu_info_mfn;
 
@@ -1807,17 +1808,18 @@ static int copy_special_pages(struct domain *cd, struct domain *d)
     return 0;
 }
 
-static int copy_settings(struct domain *cd, struct domain *d)
+static int copy_settings(struct domain *cd, struct domain *d,
+                         bool skip_special_pages)
 {
     int rc;
 
-    if ( (rc = copy_vcpu_settings(cd, d)) )
+    if ( (rc = copy_vcpu_settings(cd, d, skip_special_pages)) )
         return rc;
 
     if ( (rc = hvm_copy_context_and_params(cd, d)) )
         return rc;
 
-    if ( (rc = copy_special_pages(cd, d)) )
+    if ( !skip_special_pages && (rc = copy_special_pages(cd, d)) )
         return rc;
 
     copy_tsc(cd, d);
@@ -1826,9 +1828,11 @@ static int copy_settings(struct domain *cd, struct domain *d)
     return rc;
 }
 
-static int fork(struct domain *cd, struct domain *d)
+static int fork(struct domain *cd, struct domain *d, uint16_t flags)
 {
     int rc = -EBUSY;
+    bool block_interrupts = flags & XENMEM_FORK_BLOCK_INTERRUPTS;
+    bool skip_special_pages = flags & XENMEM_FORK_SKIP_SPECIAL_PAGES;
 
     if ( !cd->controller_pause_count )
         return rc;
@@ -1856,7 +1860,13 @@ static int fork(struct domain *cd, struct domain *d)
     if ( (rc = bring_up_vcpus(cd, d)) )
         goto done;
 
-    rc = copy_settings(cd, d);
+    if ( !(rc = copy_settings(cd, d, skip_special_pages)) )
+    {
+        cd->arch.hvm.mem_sharing.block_interrupts = block_interrupts;
+        cd->arch.hvm.mem_sharing.skip_special_pages = skip_special_pages;
+        /* skip mapping the vAPIC page on unpause if skipping special pages */
+        cd->creation_finished = skip_special_pages;
+    }
 
  done:
     if ( rc && rc != -ERESTART )
@@ -1920,7 +1930,7 @@ static int mem_sharing_fork_reset(struct domain *d)
     }
     spin_unlock_recursive(&d->page_alloc_lock);
 
-    rc = copy_settings(d, pd);
+    rc = copy_settings(d, pd, d->arch.hvm.mem_sharing.skip_special_pages);
 
     domain_unpause(d);
 
@@ -2190,7 +2200,8 @@ int mem_sharing_memop(XEN_GUEST_HANDLE_PARAM(xen_mem_sharing_op_t) arg)
         if ( mso.u.fork.pad )
             goto out;
         if ( mso.u.fork.flags &
-             ~(XENMEM_FORK_WITH_IOMMU_ALLOWED | XENMEM_FORK_BLOCK_INTERRUPTS) )
+             ~(XENMEM_FORK_WITH_IOMMU_ALLOWED | XENMEM_FORK_BLOCK_INTERRUPTS |
+               XENMEM_FORK_SKIP_SPECIAL_PAGES) )
             goto out;
 
         rc = rcu_lock_live_remote_domain_by_id(mso.u.fork.parent_domain,
@@ -2212,14 +2223,12 @@ int mem_sharing_memop(XEN_GUEST_HANDLE_PARAM(xen_mem_sharing_op_t) arg)
             goto out;
         }
 
-        rc = fork(d, pd);
+        rc = fork(d, pd, mso.u.fork.flags);
 
         if ( rc == -ERESTART )
             rc = hypercall_create_continuation(__HYPERVISOR_memory_op,
                                                "lh", XENMEM_sharing_op,
                                                arg);
-        else if ( !rc && (mso.u.fork.flags & XENMEM_FORK_BLOCK_INTERRUPTS) )
-            d->arch.hvm.mem_sharing.block_interrupts = true;
 
         rcu_unlock_domain(pd);
         break;
diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h
index a1a0f0233a..208d8dcbd9 100644
--- a/xen/include/public/memory.h
+++ b/xen/include/public/memory.h
@@ -543,10 +543,10 @@ struct xen_mem_sharing_op {
         } debug;
         struct mem_sharing_op_fork {      /* OP_FORK */
             domid_t parent_domain;        /* IN: parent's domain id */
-/* Only makes sense for short-lived forks */
+/* These flags only makes sense for short-lived forks */
 #define XENMEM_FORK_WITH_IOMMU_ALLOWED (1u << 0)
-/* Only makes sense for short-lived forks */
 #define XENMEM_FORK_BLOCK_INTERRUPTS   (1u << 1)
+#define XENMEM_FORK_SKIP_SPECIAL_PAGES (1u << 2)
             uint16_t flags;               /* IN: optional settings */
             uint32_t pad;                 /* Must be set to 0 */
         } fork;
-- 
2.25.1


