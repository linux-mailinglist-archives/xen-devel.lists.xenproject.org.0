Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9B81DDA92
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 00:53:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbu4A-0003y1-Ev; Thu, 21 May 2020 22:53:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IBHf=7D=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1jbu48-0003xw-Rd
 for xen-devel@lists.xenproject.org; Thu, 21 May 2020 22:53:28 +0000
X-Inumbo-ID: e1d08404-9bb5-11ea-ab77-12813bfff9fa
Received: from mga09.intel.com (unknown [134.134.136.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e1d08404-9bb5-11ea-ab77-12813bfff9fa;
 Thu, 21 May 2020 22:53:27 +0000 (UTC)
IronPort-SDR: 3hvyuLfT+JCx8wWlRVjScDS6g4Ek2mcx4VT2cpPMPLRvtoNGDdayjm99TLu3GvO2WiIu1VmVlV
 NbNOpgiwuB0A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2020 15:53:26 -0700
IronPort-SDR: w0bSNiQcmLVIv0ZueWiix7Cr6PDZK7pTALGuCNsSNQqTMQe2wDGd8mDXi8pNa6bG55CWSe1fg5
 Z7eY+/HMssTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,419,1583222400"; d="scan'208";a="412567790"
Received: from azehtab-mobl2.amr.corp.intel.com (HELO ubuntu.localdomain)
 ([10.255.68.236])
 by orsmga004.jf.intel.com with ESMTP; 21 May 2020 15:53:25 -0700
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH for-4.14 1/2] x86/mem_sharing: Prohibit interrupt injection
 for forks
Date: Thu, 21 May 2020 15:53:22 -0700
Message-Id: <7666b5bba73a1410446789a0c4ea908376da3487.1590101479.git.tamas.lengyel@intel.com>
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

When running shallow forks without device models it may be undesirable for Xen
to inject interrupts. With Windows forks we have observed the kernel going into
infinite loops when trying to process such interrupts. By disabling interrupt
injection the fuzzer can exercise the target code without interference.

Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
---
 xen/arch/x86/hvm/vmx/intr.c      | 4 ++++
 xen/arch/x86/mm/mem_sharing.c    | 6 +++++-
 xen/include/asm-x86/hvm/domain.h | 2 ++
 xen/include/public/memory.h      | 1 +
 4 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/vmx/intr.c b/xen/arch/x86/hvm/vmx/intr.c
index 000e14af49..3814795e3f 100644
--- a/xen/arch/x86/hvm/vmx/intr.c
+++ b/xen/arch/x86/hvm/vmx/intr.c
@@ -256,6 +256,10 @@ void vmx_intr_assist(void)
     if ( unlikely(v->arch.vm_event) && v->arch.vm_event->sync_event )
         return;
 
+    /* Block event injection for VM fork if requested */
+    if ( unlikely(v->domain->arch.hvm.mem_sharing.prohibit_interrupts) )
+        return;
+
     /* Crank the handle on interrupt state. */
     pt_vector = pt_update_irq(v);
 
diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index 7271e5c90b..7352fce866 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -2106,7 +2106,8 @@ int mem_sharing_memop(XEN_GUEST_HANDLE_PARAM(xen_mem_sharing_op_t) arg)
         rc = -EINVAL;
         if ( mso.u.fork.pad )
             goto out;
-        if ( mso.u.fork.flags & ~XENMEM_FORK_WITH_IOMMU_ALLOWED )
+        if ( mso.u.fork.flags & ~(XENMEM_FORK_WITH_IOMMU_ALLOWED |
+                                  XENMEM_FORK_PROHIBIT_INTERRUPTS) )
             goto out;
 
         rc = rcu_lock_live_remote_domain_by_id(mso.u.fork.parent_domain,
@@ -2134,6 +2135,9 @@ int mem_sharing_memop(XEN_GUEST_HANDLE_PARAM(xen_mem_sharing_op_t) arg)
             rc = hypercall_create_continuation(__HYPERVISOR_memory_op,
                                                "lh", XENMEM_sharing_op,
                                                arg);
+        else if ( !rc && (mso.u.fork.flags & XENMEM_FORK_PROHIBIT_INTERRUPTS) )
+            d->arch.hvm.mem_sharing.prohibit_interrupts = true;
+
         rcu_unlock_domain(pd);
         break;
     }
diff --git a/xen/include/asm-x86/hvm/domain.h b/xen/include/asm-x86/hvm/domain.h
index 95fe18cddc..e114f818d3 100644
--- a/xen/include/asm-x86/hvm/domain.h
+++ b/xen/include/asm-x86/hvm/domain.h
@@ -74,6 +74,8 @@ struct mem_sharing_domain
      * to resume the search.
      */
     unsigned long next_shared_gfn_to_relinquish;
+
+    bool prohibit_interrupts;
 };
 #endif
 
diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h
index dbd35305df..fe2e6caa68 100644
--- a/xen/include/public/memory.h
+++ b/xen/include/public/memory.h
@@ -537,6 +537,7 @@ struct xen_mem_sharing_op {
         struct mem_sharing_op_fork {      /* OP_FORK */
             domid_t parent_domain;        /* IN: parent's domain id */
 #define XENMEM_FORK_WITH_IOMMU_ALLOWED (1u << 0)
+#define XENMEM_FORK_PROHIBIT_INTERRUPTS (1u << 1)
             uint16_t flags;               /* IN: optional settings */
             uint32_t pad;                 /* Must be set to 0 */
         } fork;
-- 
2.25.1


