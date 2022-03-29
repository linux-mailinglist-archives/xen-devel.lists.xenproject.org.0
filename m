Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 160E84EAF02
	for <lists+xen-devel@lfdr.de>; Tue, 29 Mar 2022 16:04:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295841.503590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZCSG-0008T1-ON; Tue, 29 Mar 2022 14:04:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295841.503590; Tue, 29 Mar 2022 14:04:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZCSG-0008Pp-Ko; Tue, 29 Mar 2022 14:04:16 +0000
Received: by outflank-mailman (input) for mailman id 295841;
 Tue, 29 Mar 2022 14:04:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EyIC=UI=intel.com=tamas.lengyel@srs-se1.protection.inumbo.net>)
 id 1nZCSE-0008Pe-Pb
 for xen-devel@lists.xenproject.org; Tue, 29 Mar 2022 14:04:15 +0000
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1929a52e-af69-11ec-8fbc-03012f2f19d4;
 Tue, 29 Mar 2022 16:04:09 +0200 (CEST)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 07:04:08 -0700
Received: from tlengyel-mobl3.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.212.29.163])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 07:04:06 -0700
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
X-Inumbo-ID: 1929a52e-af69-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648562651; x=1680098651;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=r2hq6EJ3nE5Ns7N1HiuCsO/GX8EEWS3F/6vdp4nzR2w=;
  b=AAHm23MmhpIiDz6JOVt1KeWjt6VMMWL6vveOXJy5Rya2y/TWSJvnIQj1
   rMj0bvEr9MRth12hCLV1Y6g263mth2MvKYzzFnZD32rIJZs8k1NzpkQiO
   ftt4zownwLHodcSBpfsr1L+4T6Mw1vCa9+XlYFCRHg5uiayYdrCtzHSX0
   7eCb+YJKdoPXrawfqbX4LZjgC4biiK6qvytFJUB4lLdeutwHfngLin9Rg
   D1TGyIUliwCrErX4tNJjLVGLHpTK8BPvgeOeTWREqsvudy7Pw4OvnueBe
   Jh0hD0O7HjJDRcZ878p1QYToj9RLsaIbOwzH6V06ZMm32YNK0qk3Lba3M
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="239853158"
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; 
   d="scan'208";a="239853158"
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; 
   d="scan'208";a="652987555"
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Tamas K Lengyel <tamas@tklengyel.com>
Subject: [PATCH v2 1/3] x86/mem_sharing: option to enforce fork starting with empty p2m
Date: Tue, 29 Mar 2022 10:03:20 -0400
Message-Id: <ab6bb88e90e5649c60e08a1680b3a2390441031b.1648561546.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add option to the fork memop to enforce a start with an empty p2m.
Pre-populating special pages to the fork tend to be necessary only when setting
up forks to be fully functional with a toolstack or if the fork makes use of
them in some way. For short-lived forks these pages are optional and starting
with an empty p2m has advantages both in terms of reset performance as well as
easier reasoning about the state of the fork after creation.

Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
---
v2: rename flag to empty_p2m, add assert at the end and move
     vAPIC page mapping skipping logic into where its mapped
---
 tools/include/xenctrl.h               |  3 ++-
 tools/libs/ctrl/xc_memshr.c           |  5 +++-
 xen/arch/x86/hvm/vmx/vmx.c            |  5 ++++
 xen/arch/x86/include/asm/hvm/domain.h |  4 +++-
 xen/arch/x86/mm/mem_sharing.c         | 33 +++++++++++++++++----------
 xen/include/public/memory.h           |  4 ++--
 6 files changed, 37 insertions(+), 17 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 95bd5eca67..26766ec19f 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2281,7 +2281,8 @@ int xc_memshr_fork(xc_interface *xch,
                    uint32_t source_domain,
                    uint32_t client_domain,
                    bool allow_with_iommu,
-                   bool block_interrupts);
+                   bool block_interrupts,
+                   bool empty_p2m);
 
 /*
  * Note: this function is only intended to be used on short-lived forks that
diff --git a/tools/libs/ctrl/xc_memshr.c b/tools/libs/ctrl/xc_memshr.c
index a6cfd7dccf..0143f9ddea 100644
--- a/tools/libs/ctrl/xc_memshr.c
+++ b/tools/libs/ctrl/xc_memshr.c
@@ -240,7 +240,8 @@ int xc_memshr_debug_gref(xc_interface *xch,
 }
 
 int xc_memshr_fork(xc_interface *xch, uint32_t pdomid, uint32_t domid,
-                   bool allow_with_iommu, bool block_interrupts)
+                   bool allow_with_iommu, bool block_interrupts,
+                   bool empty_p2m)
 {
     xen_mem_sharing_op_t mso;
 
@@ -253,6 +254,8 @@ int xc_memshr_fork(xc_interface *xch, uint32_t pdomid, uint32_t domid,
         mso.u.fork.flags |= XENMEM_FORK_WITH_IOMMU_ALLOWED;
     if ( block_interrupts )
         mso.u.fork.flags |= XENMEM_FORK_BLOCK_INTERRUPTS;
+    if ( empty_p2m )
+        mso.u.fork.flags |= XENMEM_FORK_EMPTY_P2M;
 
     return xc_memshr_memop(xch, domid, &mso);
 }
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index c075370f64..5e60c92d5c 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -424,6 +424,11 @@ static void cf_check domain_creation_finished(struct domain *d)
     if ( !has_vlapic(d) || mfn_eq(apic_access_mfn, INVALID_MFN) )
         return;
 
+#ifdef CONFIG_MEM_SHARING
+    if ( d->arch.hvm.mem_sharing.empty_p2m )
+        return;
+#endif
+
     ASSERT(epte_get_entry_emt(d, gfn, apic_access_mfn, 0, &ipat,
                               p2m_mmio_direct) == MTRR_TYPE_WRBACK);
     ASSERT(ipat);
diff --git a/xen/arch/x86/include/asm/hvm/domain.h b/xen/arch/x86/include/asm/hvm/domain.h
index 698455444e..22a17c36c5 100644
--- a/xen/arch/x86/include/asm/hvm/domain.h
+++ b/xen/arch/x86/include/asm/hvm/domain.h
@@ -31,7 +31,9 @@
 #ifdef CONFIG_MEM_SHARING
 struct mem_sharing_domain
 {
-    bool enabled, block_interrupts;
+    bool enabled;
+    bool block_interrupts;
+    bool empty_p2m;
 
     /*
      * When releasing shared gfn's in a preemptible manner, recall where
diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index 15e6a7ed81..ef67285a98 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -1643,7 +1643,8 @@ static int bring_up_vcpus(struct domain *cd, struct domain *d)
     return 0;
 }
 
-static int copy_vcpu_settings(struct domain *cd, const struct domain *d)
+static int copy_vcpu_settings(struct domain *cd, const struct domain *d,
+                              bool empty_p2m)
 {
     unsigned int i;
     struct p2m_domain *p2m = p2m_get_hostp2m(cd);
@@ -1660,7 +1661,7 @@ static int copy_vcpu_settings(struct domain *cd, const struct domain *d)
 
         /* Copy & map in the vcpu_info page if the guest uses one */
         vcpu_info_mfn = d_vcpu->vcpu_info_mfn;
-        if ( !mfn_eq(vcpu_info_mfn, INVALID_MFN) )
+        if ( !empty_p2m && !mfn_eq(vcpu_info_mfn, INVALID_MFN) )
         {
             mfn_t new_vcpu_info_mfn = cd_vcpu->vcpu_info_mfn;
 
@@ -1807,17 +1808,18 @@ static int copy_special_pages(struct domain *cd, struct domain *d)
     return 0;
 }
 
-static int copy_settings(struct domain *cd, struct domain *d)
+static int copy_settings(struct domain *cd, struct domain *d,
+                         bool empty_p2m)
 {
     int rc;
 
-    if ( (rc = copy_vcpu_settings(cd, d)) )
+    if ( (rc = copy_vcpu_settings(cd, d, empty_p2m)) )
         return rc;
 
     if ( (rc = hvm_copy_context_and_params(cd, d)) )
         return rc;
 
-    if ( (rc = copy_special_pages(cd, d)) )
+    if ( !empty_p2m && (rc = copy_special_pages(cd, d)) )
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
+    bool empty_p2m = flags & XENMEM_FORK_EMPTY_P2M;
 
     if ( !cd->controller_pause_count )
         return rc;
@@ -1856,7 +1860,13 @@ static int fork(struct domain *cd, struct domain *d)
     if ( (rc = bring_up_vcpus(cd, d)) )
         goto done;
 
-    rc = copy_settings(cd, d);
+    if ( !(rc = copy_settings(cd, d, empty_p2m)) )
+    {
+        cd->arch.hvm.mem_sharing.block_interrupts = block_interrupts;
+
+        if ( (cd->arch.hvm.mem_sharing.empty_p2m = empty_p2m) )
+            ASSERT(page_list_empty(&cd->page_list));
+    }
 
  done:
     if ( rc && rc != -ERESTART )
@@ -1920,7 +1930,7 @@ static int mem_sharing_fork_reset(struct domain *d)
     }
     spin_unlock_recursive(&d->page_alloc_lock);
 
-    rc = copy_settings(d, pd);
+    rc = copy_settings(d, pd, d->arch.hvm.mem_sharing.empty_p2m);
 
     domain_unpause(d);
 
@@ -2190,7 +2200,8 @@ int mem_sharing_memop(XEN_GUEST_HANDLE_PARAM(xen_mem_sharing_op_t) arg)
         if ( mso.u.fork.pad )
             goto out;
         if ( mso.u.fork.flags &
-             ~(XENMEM_FORK_WITH_IOMMU_ALLOWED | XENMEM_FORK_BLOCK_INTERRUPTS) )
+             ~(XENMEM_FORK_WITH_IOMMU_ALLOWED | XENMEM_FORK_BLOCK_INTERRUPTS |
+               XENMEM_FORK_EMPTY_P2M) )
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
index a1a0f0233a..d44c256b3c 100644
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
+#define XENMEM_FORK_EMPTY_P2M          (1u << 2)
             uint16_t flags;               /* IN: optional settings */
             uint32_t pad;                 /* Must be set to 0 */
         } fork;
-- 
2.25.1


