Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FF7511C0C
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 17:51:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.315212.533653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njjwz-0008SE-Vq; Wed, 27 Apr 2022 15:51:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 315212.533653; Wed, 27 Apr 2022 15:51:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njjwz-0008QN-SL; Wed, 27 Apr 2022 15:51:33 +0000
Received: by outflank-mailman (input) for mailman id 315212;
 Wed, 27 Apr 2022 15:51:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CTGo=VF=intel.com=tamas.lengyel@srs-se1.protection.inumbo.net>)
 id 1njjwy-0007rz-8f
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 15:51:32 +0000
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e6585bbd-c641-11ec-a405-831a346695d4;
 Wed, 27 Apr 2022 17:51:30 +0200 (CEST)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 08:34:30 -0700
Received: from esimonso-mobl1.amr.corp.intel.com (HELO ubuntu.localdomain)
 ([10.212.23.42])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 08:34:28 -0700
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
X-Inumbo-ID: e6585bbd-c641-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651074690; x=1682610690;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yu2lLCKrz9AND+oxXtfzZGp0tENLJ9h0P9FY5DkWhk4=;
  b=UOReKctzzFZ6jQLsHR1wFShRZnKkonFOha6THqaX2ZJK80Oogcfxt0Kv
   aA52qehMmpuPi1R5XgMyX7Exghra/G+b1tt5mulix4tkowPXbNEHPYLMZ
   utZNRmQNpslMiuaqF2m2DLe29H7hFRfmTTdiClbO2o9lqRO67hpPB4RBg
   Ho3ksn8WUFGxp9RLmtULeQw/9LFMAD8rZXTRqqJJrjyDr1ztWn6Car0FX
   JPnnoJaTvqnUywC9IxedbOQXhOmEPa1m4xmb/uRcxprTTvwvdCFYvVr36
   bsdoADOTcNrm7s78ykcygwVWXxgyZXhy1R30ZIWyKkeP+14+dvL9d15ib
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10330"; a="328915505"
X-IronPort-AV: E=Sophos;i="5.90,293,1643702400"; 
   d="scan'208";a="328915505"
X-IronPort-AV: E=Sophos;i="5.90,293,1643702400"; 
   d="scan'208";a="680854404"
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
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: [PATCH 1/3] x86/mem_sharing: make fork_reset more configurable
Date: Wed, 27 Apr 2022 11:34:18 -0400
Message-Id: <7f03387eebf9de474f404ef661f80133e3725365.1651073086.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Alow specify distinct parts of the fork VM to be reset. This is useful when a
fuzzing operation involves mapping in only a handful of pages that are known
ahead of time. Throwing these pages away just to be re-copied immediately is
expensive, thus allowing to specify partial resets can speed things up.

Also allow resetting to be initiated from vm_event responses as an
optiomization.

Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com
---
v5: split toolstack part to separate patch and use ASSERT_UNREACHABLE
v4: No change
v3: Rebase on simpler approach after dropping empty_p2m feature
v2: address review comments and add more sanity checking
---
 xen/arch/x86/include/asm/mem_sharing.h |  9 +++++++++
 xen/arch/x86/mm/mem_sharing.c          | 24 +++++++++++++++++++-----
 xen/common/vm_event.c                  | 18 ++++++++++++++++++
 xen/include/public/memory.h            |  4 +++-
 xen/include/public/vm_event.h          |  8 ++++++++
 5 files changed, 57 insertions(+), 6 deletions(-)

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
index a5c16b4429..1e1fb27c1a 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -1881,15 +1881,21 @@ static int fork(struct domain *cd, struct domain *d)
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
@@ -1922,7 +1928,9 @@ static int mem_sharing_fork_reset(struct domain *d)
     }
     spin_unlock_recursive(&d->page_alloc_lock);
 
-    rc = copy_settings(d, pd);
+ state:
+    if ( reset_state )
+        rc = copy_settings(d, pd);
 
     domain_unpause(d);
 
@@ -2229,15 +2237,21 @@ int mem_sharing_memop(XEN_GUEST_HANDLE_PARAM(xen_mem_sharing_op_t) arg)
 
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
index 84cf52636b..cc7d8bf565 100644
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
 
@@ -394,6 +399,19 @@ static int vm_event_resume(struct domain *d, struct vm_event_domain *ved)
             if ( rsp.reason == VM_EVENT_REASON_MEM_PAGING )
                 p2m_mem_paging_resume(d, &rsp);
 #endif
+#ifdef CONFIG_MEM_SHARING
+            if ( mem_sharing_is_fork(d) )
+            {
+                bool reset_state = rsp.flags & VM_EVENT_FLAG_RESET_FORK_STATE;
+                bool reset_mem = rsp.flags & VM_EVENT_FLAG_RESET_FORK_MEMORY;
+
+                if ( (reset_state || reset_mem) &&
+                    mem_sharing_fork_reset(d, reset_state, reset_mem) )
+                {
+                    ASSERT_UNREACHABLE();
+                }
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
index bb003d21d0..1673bb8703 100644
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
+ * Remove unshared entries from physmap (if VM is fork)
+ */
+#define VM_EVENT_FLAG_RESET_FORK_MEMORY  (1 << 15)
 
 /*
  * Reasons for the vm event request
-- 
2.34.1


