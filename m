Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B991DED56
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 18:34:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jcAcT-0008No-Lv; Fri, 22 May 2020 16:34:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UE2V=7E=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1jcAcS-0008Nj-CG
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 16:34:00 +0000
X-Inumbo-ID: 0891861c-9c4a-11ea-b07b-bc764e2007e4
Received: from mga17.intel.com (unknown [192.55.52.151])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0891861c-9c4a-11ea-b07b-bc764e2007e4;
 Fri, 22 May 2020 16:33:58 +0000 (UTC)
IronPort-SDR: 0GUlAE8WTWb7Nv2TTpTc79aqv9ClrXzTz4m8utzAedEbBB2orqWneWllCFgriE7jgRyzpAQ07J
 DHb/5OnyZzzw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2020 09:33:57 -0700
IronPort-SDR: cp+bdUzCCs1ZaOHkSL95CIMpt6nO1es0ml2hVDZF0p4hoiQPeIrJ5E0erNfpHj9Jym3aaNWHXS
 FQunWTL8V4ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,422,1583222400"; d="scan'208";a="301157055"
Received: from rpenaran-mobl.amr.corp.intel.com (HELO ubuntu.localdomain)
 ([10.212.41.203])
 by orsmga008.jf.intel.com with ESMTP; 22 May 2020 09:33:55 -0700
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v2 for-4.14 1/2] x86/mem_sharing: block interrupt injection
 for forks
Date: Fri, 22 May 2020 09:33:52 -0700
Message-Id: <adfececa3e29a46f5347459a629aa534d61625aa.1590165055.git.tamas.lengyel@intel.com>
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
infinite loops when trying to process such interrupts, likely because it attempts
to interact with devices that are not responding without QEMU running. By
disabling interrupt injection the fuzzer can exercise the target code without
interference.

Forks & memory sharing are only available on Intel CPUs so this only applies
to vmx.

Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
---
v2: prohibit => block
    minor style adjustments
---
 xen/arch/x86/hvm/vmx/intr.c      | 6 ++++++
 xen/arch/x86/mm/mem_sharing.c    | 6 +++++-
 xen/include/asm-x86/hvm/domain.h | 2 ++
 xen/include/public/memory.h      | 1 +
 4 files changed, 14 insertions(+), 1 deletion(-)

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
index 95fe18cddc..37e494d234 100644
--- a/xen/include/asm-x86/hvm/domain.h
+++ b/xen/include/asm-x86/hvm/domain.h
@@ -74,6 +74,8 @@ struct mem_sharing_domain
      * to resume the search.
      */
     unsigned long next_shared_gfn_to_relinquish;
+
+    bool block_interrupts;
 };
 #endif
 
diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h
index dbd35305df..1e4959638d 100644
--- a/xen/include/public/memory.h
+++ b/xen/include/public/memory.h
@@ -537,6 +537,7 @@ struct xen_mem_sharing_op {
         struct mem_sharing_op_fork {      /* OP_FORK */
             domid_t parent_domain;        /* IN: parent's domain id */
 #define XENMEM_FORK_WITH_IOMMU_ALLOWED (1u << 0)
+#define XENMEM_FORK_BLOCK_INTERRUPTS   (1u << 1)
             uint16_t flags;               /* IN: optional settings */
             uint32_t pad;                 /* Must be set to 0 */
         } fork;
-- 
2.25.1


