Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEAF51E0EEE
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2020 15:00:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdCiL-00006w-Sv; Mon, 25 May 2020 13:00:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=arI+=7H=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1jdCiJ-00006r-Nj
 for xen-devel@lists.xenproject.org; Mon, 25 May 2020 13:00:19 +0000
X-Inumbo-ID: acb92ec2-9e87-11ea-aecf-12813bfff9fa
Received: from mga18.intel.com (unknown [134.134.136.126])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id acb92ec2-9e87-11ea-aecf-12813bfff9fa;
 Mon, 25 May 2020 13:00:15 +0000 (UTC)
IronPort-SDR: S3R7iCJlP0t0cJ0AblaCDF+4C5KhDzTKGYAXIziOALNcsX2Fhu6f1FL+8jvrZEeZB5sFnEjPLn
 uLQN/LDCziGA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2020 06:00:13 -0700
IronPort-SDR: YjREmtBNF/KTsshmsp6hSNW1/dSLa83eOThGjEH6MT6BD7q40jsToTeQGvPxLvSb0MjD3hTfy9
 9AfA5f/u71zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,433,1583222400"; d="scan'208";a="266140632"
Received: from dmaltesx-mobl.amr.corp.intel.com (HELO ubuntu.localdomain)
 ([10.209.105.3])
 by orsmga003.jf.intel.com with ESMTP; 25 May 2020 06:00:11 -0700
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v3 for-4.14 1/2] x86/mem_sharing: block interrupt injection
 for forks
Date: Mon, 25 May 2020 06:00:08 -0700
Message-Id: <a3b3410c707636aa201641e14b1ab43d4b8821e1.1590411162.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

When running shallow forks, ie. VM forks without device models (QEMU), it may
be undesirable for Xen to inject interrupts. When creating such forks from
Windows VMs we have observed the kernel trying to process interrupts
immediately after the fork is executed. However without QEMU running such
interrupt handling may not be possible because it may attempt to interact with
devices that are not emulated by a backend. In the best case scenario such
interrupt handling would only present a detour in the VM forks' execution
flow, but in the worst case as we actually observed can completely stall it.
By disabling interrupt injection a fuzzer can exercise the target code without
interference. For other use-cases this option probably doesn't make sense,
that's why this is not enabled by default.

Forks & memory sharing are only available on Intel CPUs so this only applies
to vmx. Note that this is part of the experimental VM forking feature that's
completely disabled by default and can only be enabled by using
XEN_CONFIG_EXPERT during compile time.

Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
---
v3: add comments in the public header how this option only makes sense for
     short lived forks
    minor style adjustment
v2: prohibit => block
    minor style adjustments
---
 xen/arch/x86/hvm/vmx/intr.c      | 6 ++++++
 xen/arch/x86/mm/mem_sharing.c    | 6 +++++-
 xen/include/asm-x86/hvm/domain.h | 2 +-
 xen/include/public/memory.h      | 3 +++
 4 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/intr.c b/xen/arch/x86/hvm/vmx/intr.c
index 000e14af49..80bfbb4787 100644
--- a/xen/arch/x86/hvm/vmx/intr.c
+++ b/xen/arch/x86/hvm/vmx/intr.c
@@ -256,6 +256,12 @@ void vmx_intr_assist(void)
     if ( unlikely(v->arch.vm_event) && v->arch.vm_event->sync_event )
         return;
 
+#ifdef CONFIG_MEM_SHARING
+    /* Block event injection for VM fork if requested */
+    if ( unlikely(v->domain->arch.hvm.mem_sharing.block_interrupts) )
+        return;
+#endif
+
     /* Crank the handle on interrupt state. */
     pt_vector = pt_update_irq(v);
 
diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index 7271e5c90b..0c45a8d67e 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -2106,7 +2106,8 @@ int mem_sharing_memop(XEN_GUEST_HANDLE_PARAM(xen_mem_sharing_op_t) arg)
         rc = -EINVAL;
         if ( mso.u.fork.pad )
             goto out;
-        if ( mso.u.fork.flags & ~XENMEM_FORK_WITH_IOMMU_ALLOWED )
+        if ( mso.u.fork.flags &
+             ~(XENMEM_FORK_WITH_IOMMU_ALLOWED | XENMEM_FORK_BLOCK_INTERRUPTS) )
             goto out;
 
         rc = rcu_lock_live_remote_domain_by_id(mso.u.fork.parent_domain,
@@ -2134,6 +2135,9 @@ int mem_sharing_memop(XEN_GUEST_HANDLE_PARAM(xen_mem_sharing_op_t) arg)
             rc = hypercall_create_continuation(__HYPERVISOR_memory_op,
                                                "lh", XENMEM_sharing_op,
                                                arg);
+        else if ( !rc && (mso.u.fork.flags & XENMEM_FORK_BLOCK_INTERRUPTS) )
+            d->arch.hvm.mem_sharing.block_interrupts = true;
+
         rcu_unlock_domain(pd);
         break;
     }
diff --git a/xen/include/asm-x86/hvm/domain.h b/xen/include/asm-x86/hvm/domain.h
index 95fe18cddc..9d247baf4d 100644
--- a/xen/include/asm-x86/hvm/domain.h
+++ b/xen/include/asm-x86/hvm/domain.h
@@ -67,7 +67,7 @@ struct hvm_ioreq_server {
 #ifdef CONFIG_MEM_SHARING
 struct mem_sharing_domain
 {
-    bool enabled;
+    bool enabled, block_interrupts;
 
     /*
      * When releasing shared gfn's in a preemptible manner, recall where
diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h
index dbd35305df..850bd72c52 100644
--- a/xen/include/public/memory.h
+++ b/xen/include/public/memory.h
@@ -536,7 +536,10 @@ struct xen_mem_sharing_op {
         } debug;
         struct mem_sharing_op_fork {      /* OP_FORK */
             domid_t parent_domain;        /* IN: parent's domain id */
+/* Only makes sense for short-lived forks */
 #define XENMEM_FORK_WITH_IOMMU_ALLOWED (1u << 0)
+/* Only makes sense for short-lived forks */
+#define XENMEM_FORK_BLOCK_INTERRUPTS   (1u << 1)
             uint16_t flags;               /* IN: optional settings */
             uint32_t pad;                 /* Must be set to 0 */
         } fork;
-- 
2.25.1


