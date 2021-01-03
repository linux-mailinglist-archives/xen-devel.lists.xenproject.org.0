Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 829202E8DCE
	for <lists+xen-devel@lfdr.de>; Sun,  3 Jan 2021 19:41:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.60969.106952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kw8Ji-0004dk-Ne; Sun, 03 Jan 2021 18:41:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 60969.106952; Sun, 03 Jan 2021 18:41:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kw8Ji-0004dN-Kb; Sun, 03 Jan 2021 18:41:26 +0000
Received: by outflank-mailman (input) for mailman id 60969;
 Sun, 03 Jan 2021 18:41:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SG+r=GG=tklengyel.com=tamas@srs-us1.protection.inumbo.net>)
 id 1kw8Jg-0004dI-QM
 for xen-devel@lists.xenproject.org; Sun, 03 Jan 2021 18:41:24 +0000
Received: from MTA-10-1.privateemail.com (unknown [68.65.122.30])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id db1bbd50-3250-41fc-b1c8-baba657d0818;
 Sun, 03 Jan 2021 18:41:23 +0000 (UTC)
Received: from MTA-10.privateemail.com (localhost [127.0.0.1])
 by MTA-10.privateemail.com (Postfix) with ESMTP id F191A60071;
 Sun,  3 Jan 2021 13:41:21 -0500 (EST)
Received: from t9.localdomain (unknown [10.20.151.215])
 by MTA-10.privateemail.com (Postfix) with ESMTPA id C6CB760033;
 Sun,  3 Jan 2021 18:41:20 +0000 (UTC)
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
X-Inumbo-ID: db1bbd50-3250-41fc-b1c8-baba657d0818
From: Tamas K Lengyel <tamas@tklengyel.com>
To: xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] x86/vm_event: transfer nested p2m base info
Date: Sun,  3 Jan 2021 11:41:17 -0700
Message-Id: <20210103184117.57692-1-tamas@tklengyel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

Required to introspect events originating from nested VMs.

Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
---
 xen/arch/x86/hvm/monitor.c    | 32 ++++++++++++++++++++++++++++++--
 xen/include/public/vm_event.h |  7 ++++++-
 2 files changed, 36 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/hvm/monitor.c b/xen/arch/x86/hvm/monitor.c
index e4a09964a0..eb4afe81b3 100644
--- a/xen/arch/x86/hvm/monitor.c
+++ b/xen/arch/x86/hvm/monitor.c
@@ -26,6 +26,7 @@
 #include <xen/mem_access.h>
 #include <xen/monitor.h>
 #include <asm/hvm/monitor.h>
+#include <asm/hvm/nestedhvm.h>
 #include <asm/altp2m.h>
 #include <asm/monitor.h>
 #include <asm/p2m.h>
@@ -33,6 +34,15 @@
 #include <asm/vm_event.h>
 #include <public/vm_event.h>
 
+static inline void set_npt_base(struct vcpu *curr, vm_event_request_t *req)
+{
+    if ( nestedhvm_enabled(curr->domain) && nestedhvm_vcpu_in_guestmode(curr) )
+    {
+        req->flags |= VM_EVENT_FLAG_NESTED_P2M;
+        req->data.regs.x86.npt_base = nhvm_vcpu_p2m_base(curr);
+    }
+}
+
 bool hvm_monitor_cr(unsigned int index, unsigned long value, unsigned long old)
 {
     struct vcpu *curr = current;
@@ -53,6 +63,8 @@ bool hvm_monitor_cr(unsigned int index, unsigned long value, unsigned long old)
             .u.write_ctrlreg.old_value = old
         };
 
+        set_npt_base(curr, &req);
+
         return monitor_traps(curr, sync, &req) >= 0 &&
                curr->domain->arch.monitor.control_register_values;
     }
@@ -73,6 +85,8 @@ bool hvm_monitor_emul_unimplemented(void)
         .vcpu_id  = curr->vcpu_id,
     };
 
+    set_npt_base(curr, &req);
+
     return curr->domain->arch.monitor.emul_unimplemented_enabled &&
         monitor_traps(curr, true, &req) == 1;
 }
@@ -92,6 +106,8 @@ bool hvm_monitor_msr(unsigned int msr, uint64_t new_value, uint64_t old_value)
             .u.mov_to_msr.old_value = old_value
         };
 
+        set_npt_base(curr, &req);
+
         return monitor_traps(curr, 1, &req) >= 0 &&
                curr->domain->arch.monitor.control_register_values;
     }
@@ -103,6 +119,7 @@ void hvm_monitor_descriptor_access(uint64_t exit_info,
                                    uint64_t vmx_exit_qualification,
                                    uint8_t descriptor, bool is_write)
 {
+    struct vcpu *curr = current;
     vm_event_request_t req = {
         .reason = VM_EVENT_REASON_DESCRIPTOR_ACCESS,
         .u.desc_access.descriptor = descriptor,
@@ -115,7 +132,9 @@ void hvm_monitor_descriptor_access(uint64_t exit_info,
         req.u.desc_access.arch.vmx.exit_qualification = vmx_exit_qualification;
     }
 
-    monitor_traps(current, true, &req);
+    set_npt_base(curr, &req);
+
+    monitor_traps(curr, true, &req);
 }
 
 static inline unsigned long gfn_of_rip(unsigned long rip)
@@ -189,6 +208,8 @@ int hvm_monitor_debug(unsigned long rip, enum hvm_monitor_debug_type type,
         return -EOPNOTSUPP;
     }
 
+    set_npt_base(curr, &req);
+
     return monitor_traps(curr, sync, &req);
 }
 
@@ -207,12 +228,15 @@ int hvm_monitor_cpuid(unsigned long insn_length, unsigned int leaf,
     req.u.cpuid.leaf = leaf;
     req.u.cpuid.subleaf = subleaf;
 
+    set_npt_base(curr, &req);
+
     return monitor_traps(curr, 1, &req);
 }
 
 void hvm_monitor_interrupt(unsigned int vector, unsigned int type,
                            unsigned int err, uint64_t cr2)
 {
+    struct vcpu *curr = current;
     vm_event_request_t req = {
         .reason = VM_EVENT_REASON_INTERRUPT,
         .u.interrupt.x86.vector = vector,
@@ -221,7 +245,9 @@ void hvm_monitor_interrupt(unsigned int vector, unsigned int type,
         .u.interrupt.x86.cr2 = cr2,
     };
 
-    monitor_traps(current, 1, &req);
+    set_npt_base(curr, &req);
+
+    monitor_traps(curr, 1, &req);
 }
 
 /*
@@ -297,6 +323,8 @@ bool hvm_monitor_check_p2m(unsigned long gla, gfn_t gfn, uint32_t pfec,
     req.u.mem_access.gla = gla;
     req.u.mem_access.offset = gpa & ~PAGE_MASK;
 
+    set_npt_base(curr, &req);
+
     return monitor_traps(curr, true, &req) >= 0;
 }
 
diff --git a/xen/include/public/vm_event.h b/xen/include/public/vm_event.h
index fdd3ad8a30..8415bc7618 100644
--- a/xen/include/public/vm_event.h
+++ b/xen/include/public/vm_event.h
@@ -29,7 +29,7 @@
 
 #include "xen.h"
 
-#define VM_EVENT_INTERFACE_VERSION 0x00000006
+#define VM_EVENT_INTERFACE_VERSION 0x00000007
 
 #if defined(__XEN__) || defined(__XEN_TOOLS__)
 
@@ -119,6 +119,10 @@
  * which singlestep gets automatically disabled.
  */
 #define VM_EVENT_FLAG_FAST_SINGLESTEP    (1 << 11)
+/*
+ * Set if the event comes from a nested VM and thus npt_base is valid.
+ */
+#define VM_EVENT_FLAG_NESTED_P2M         (1 << 12)
 
 /*
  * Reasons for the vm event request
@@ -208,6 +212,7 @@ struct vm_event_regs_x86 {
     uint64_t msr_star;
     uint64_t msr_lstar;
     uint64_t gdtr_base;
+    uint64_t npt_base;
     uint32_t cs_base;
     uint32_t ss_base;
     uint32_t ds_base;
-- 
2.25.1


