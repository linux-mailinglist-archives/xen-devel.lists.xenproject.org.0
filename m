Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6454F6276
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 17:00:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299951.511321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc78Q-0002XP-EI; Wed, 06 Apr 2022 14:59:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299951.511321; Wed, 06 Apr 2022 14:59:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc78Q-0002V9-8L; Wed, 06 Apr 2022 14:59:50 +0000
Received: by outflank-mailman (input) for mailman id 299951;
 Wed, 06 Apr 2022 14:59:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xjgL=UQ=intel.com=tamas.lengyel@srs-se1.protection.inumbo.net>)
 id 1nc78O-0002Uy-Gn
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 14:59:48 +0000
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 318b2153-b5ba-11ec-8fbc-03012f2f19d4;
 Wed, 06 Apr 2022 16:59:46 +0200 (CEST)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2022 07:59:43 -0700
Received: from gtomasze-mobl1.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.212.34.72])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2022 07:59:40 -0700
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
X-Inumbo-ID: 318b2153-b5ba-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649257186; x=1680793186;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=m87phGhqUng8DBgUZHPkKJ9RkTLrHt17zXPaorFZAF0=;
  b=aVciBucQnfhEL/AMUPgyueo0mIYtD6tmXBj1uV5mq2q9MkUb5pkehY6f
   H/32ZsIvXknayv/Onsl0eYrIL1P2MXqRGmBiDEW4FI8jFu9MgGV+tHV7O
   FQ09fq2tkhByj33O9veFElDnvnGRZfgxSYBp97egIAkeqF4XJgaIU+ii8
   mx/a+470WHH+VuzzurV5LAXZ/PKvaUqPsNeqcfOnPuFis7+ETKr2xKG/1
   O0clU9DtS8iXJuNL21wntF/l45wmMc5j5KOLydO/RZkpO1HN85WnWCq5u
   8UEzrHdx3tRNYUPHkAMY05ibMPe9I2csFDoDf1PjimMoQycQjMiOKP22T
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10309"; a="258661131"
X-IronPort-AV: E=Sophos;i="5.90,240,1643702400"; 
   d="scan'208";a="258661131"
X-IronPort-AV: E=Sophos;i="5.90,240,1643702400"; 
   d="scan'208";a="658563096"
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
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: [PATCH v3 1/2] x86/mem_sharing: make fork_reset more configurable
Date: Wed,  6 Apr 2022 10:58:21 -0400
Message-Id: <d1a7a48fa2d46c6a6cbf8f93926a8839aaba92e3.1649256134.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow specify distinct parts of the fork VM to be reset. This is useful when a
fuzzing operation involves mapping in only a handful of pages that are known
ahead of time. Throwing these pages away just to be re-copied immediately is
expensive, thus allowing to specify partial resets can speed things up.

Also allow resetting to be initiated from vm_event responses as an
optiomization.

Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
---
v3: Rebase on simpler approach after dropping empty_p2m feature
v2: address review comments and add more sanity checking
---
 tools/include/xenctrl.h                |  3 ++-
 tools/libs/ctrl/xc_memshr.c            |  7 ++++++-
 xen/arch/x86/include/asm/mem_sharing.h |  9 +++++++++
 xen/arch/x86/mm/mem_sharing.c          | 24 +++++++++++++++++++-----
 xen/common/vm_event.c                  | 15 +++++++++++++++
 xen/include/public/memory.h            |  4 +++-
 xen/include/public/vm_event.h          |  8 ++++++++
 7 files changed, 62 insertions(+), 8 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 95bd5eca67..1b089a2c02 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2290,7 +2290,8 @@ int xc_memshr_fork(xc_interface *xch,
  *
  * With VMs that have a lot of memory this call may block for a long time.
  */
-int xc_memshr_fork_reset(xc_interface *xch, uint32_t forked_domain);
+int xc_memshr_fork_reset(xc_interface *xch, uint32_t forked_domain,
+                         bool reset_state, bool reset_memory);
 
 /* Debug calls: return the number of pages referencing the shared frame backing
  * the input argument. Should be one or greater.
diff --git a/tools/libs/ctrl/xc_memshr.c b/tools/libs/ctrl/xc_memshr.c
index a6cfd7dccf..a0d0b894e2 100644
--- a/tools/libs/ctrl/xc_memshr.c
+++ b/tools/libs/ctrl/xc_memshr.c
@@ -257,12 +257,17 @@ int xc_memshr_fork(xc_interface *xch, uint32_t pdomid, uint32_t domid,
     return xc_memshr_memop(xch, domid, &mso);
 }
 
-int xc_memshr_fork_reset(xc_interface *xch, uint32_t domid)
+int xc_memshr_fork_reset(xc_interface *xch, uint32_t domid, bool reset_state,
+                         bool reset_memory)
 {
     xen_mem_sharing_op_t mso;
 
     memset(&mso, 0, sizeof(mso));
     mso.op = XENMEM_sharing_op_fork_reset;
+    if ( reset_state )
+        mso.u.fork.flags |= XENMEM_FORK_RESET_STATE;
+    if ( reset_memory )
+        mso.u.fork.flags |= XENMEM_FORK_RESET_MEMORY;
 
     return xc_memshr_memop(xch, domid, &mso);
 }
diff --git a/xen/arch/x86/include/asm/mem_sharing.h b/xen/arch/x86/include/asm/mem_sharing.h
index cf7a12f4d2..2c00069bc9 100644
--- a/xen/arch/x86/include/asm/mem_sharing.h
+++ b/xen/arch/x86/include/asm/mem_sharing.h
@@ -85,6 +85,9 @@ static inline bool mem_sharing_is_fork(const struct domain *d)
 int mem_sharing_fork_page(struct domain *d, gfn_t gfn,
                           bool unsharing);
 
+int mem_sharing_fork_reset(struct domain *d, bool reset_state,
+                           bool reset_memory);
+
 /*
  * If called by a foreign domain, possible errors are
  *   -EBUSY -> ring full
@@ -148,6 +151,12 @@ static inline int mem_sharing_fork_page(struct domain *d, gfn_t gfn, bool lock)
     return -EOPNOTSUPP;
 }
 
+static inline int mem_sharing_fork_reset(struct domain *d, bool reset_state,
+                                         bool reset_memory)
+{
+    return -EOPNOTSUPP;
+}
+
 #endif
 
 #endif /* __MEM_SHARING_H__ */
diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index 15e6a7ed81..2f447d94ab 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -1879,15 +1879,21 @@ static int fork(struct domain *cd, struct domain *d)
  * footprints the hypercall continuation should be implemented (or if this
  * feature needs to be become "stable").
  */
-static int mem_sharing_fork_reset(struct domain *d)
+int mem_sharing_fork_reset(struct domain *d, bool reset_state,
+                           bool reset_memory)
 {
-    int rc;
+    int rc = 0;
     struct domain *pd = d->parent;
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
     struct page_info *page, *tmp;
 
+    ASSERT(reset_state || reset_memory);
+
     domain_pause(d);
 
+    if ( !reset_memory )
+        goto state;
+
     /* need recursive lock because we will free pages */
     spin_lock_recursive(&d->page_alloc_lock);
     page_list_for_each_safe(page, tmp, &d->page_list)
@@ -1920,7 +1926,9 @@ static int mem_sharing_fork_reset(struct domain *d)
     }
     spin_unlock_recursive(&d->page_alloc_lock);
 
-    rc = copy_settings(d, pd);
+ state:
+    if ( reset_state )
+        rc = copy_settings(d, pd);
 
     domain_unpause(d);
 
@@ -2227,15 +2235,21 @@ int mem_sharing_memop(XEN_GUEST_HANDLE_PARAM(xen_mem_sharing_op_t) arg)
 
     case XENMEM_sharing_op_fork_reset:
     {
+        bool reset_state = mso.u.fork.flags & XENMEM_FORK_RESET_STATE;
+        bool reset_memory = mso.u.fork.flags & XENMEM_FORK_RESET_MEMORY;
+
         rc = -EINVAL;
-        if ( mso.u.fork.pad || mso.u.fork.flags )
+        if ( mso.u.fork.pad || (!reset_state && !reset_memory) )
+            goto out;
+        if ( mso.u.fork.flags &
+             ~(XENMEM_FORK_RESET_STATE | XENMEM_FORK_RESET_MEMORY) )
             goto out;
 
         rc = -ENOSYS;
         if ( !d->parent )
             goto out;
 
-        rc = mem_sharing_fork_reset(d);
+        rc = mem_sharing_fork_reset(d, reset_state, reset_memory);
         break;
     }
 
diff --git a/xen/common/vm_event.c b/xen/common/vm_event.c
index 84cf52636b..d26a6699fc 100644
--- a/xen/common/vm_event.c
+++ b/xen/common/vm_event.c
@@ -28,6 +28,11 @@
 #include <asm/p2m.h>
 #include <asm/monitor.h>
 #include <asm/vm_event.h>
+
+#ifdef CONFIG_MEM_SHARING
+#include <asm/mem_sharing.h>
+#endif
+
 #include <xsm/xsm.h>
 #include <public/hvm/params.h>
 
@@ -394,6 +399,16 @@ static int vm_event_resume(struct domain *d, struct vm_event_domain *ved)
             if ( rsp.reason == VM_EVENT_REASON_MEM_PAGING )
                 p2m_mem_paging_resume(d, &rsp);
 #endif
+#ifdef CONFIG_MEM_SHARING
+            if ( mem_sharing_is_fork(d) )
+            {
+                bool reset_state = rsp.flags & VM_EVENT_FLAG_RESET_FORK_STATE;
+                bool reset_mem = rsp.flags & VM_EVENT_FLAG_RESET_FORK_MEMORY;
+
+                if ( reset_state || reset_mem )
+                    ASSERT(!mem_sharing_fork_reset(d, reset_state, reset_mem));
+            }
+#endif
 
             /*
              * Check emulation flags in the arch-specific handler only, as it
diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h
index a1a0f0233a..f8d26fb77d 100644
--- a/xen/include/public/memory.h
+++ b/xen/include/public/memory.h
@@ -541,12 +541,14 @@ struct xen_mem_sharing_op {
                 uint32_t gref;     /* IN: gref to debug         */
             } u;
         } debug;
-        struct mem_sharing_op_fork {      /* OP_FORK */
+        struct mem_sharing_op_fork {      /* OP_FORK{,_RESET} */
             domid_t parent_domain;        /* IN: parent's domain id */
 /* Only makes sense for short-lived forks */
 #define XENMEM_FORK_WITH_IOMMU_ALLOWED (1u << 0)
 /* Only makes sense for short-lived forks */
 #define XENMEM_FORK_BLOCK_INTERRUPTS   (1u << 1)
+#define XENMEM_FORK_RESET_STATE        (1u << 2)
+#define XENMEM_FORK_RESET_MEMORY       (1u << 3)
             uint16_t flags;               /* IN: optional settings */
             uint32_t pad;                 /* Must be set to 0 */
         } fork;
diff --git a/xen/include/public/vm_event.h b/xen/include/public/vm_event.h
index bb003d21d0..81c2ee28cc 100644
--- a/xen/include/public/vm_event.h
+++ b/xen/include/public/vm_event.h
@@ -127,6 +127,14 @@
  * Reset the vmtrace buffer (if vmtrace is enabled)
  */
 #define VM_EVENT_FLAG_RESET_VMTRACE      (1 << 13)
+/*
+ * Reset the VM state (if VM is fork)
+ */
+#define VM_EVENT_FLAG_RESET_FORK_STATE   (1 << 14)
+/*
+ * Remove unshared entried from physmap (if VM is fork)
+ */
+#define VM_EVENT_FLAG_RESET_FORK_MEMORY  (1 << 15)
 
 /*
  * Reasons for the vm event request
-- 
2.25.1


