Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E0575A84A
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 09:53:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566417.885194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMOTW-0000M5-L4; Thu, 20 Jul 2023 07:53:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566417.885194; Thu, 20 Jul 2023 07:53:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMOTW-0000Jm-Hy; Thu, 20 Jul 2023 07:53:26 +0000
Received: by outflank-mailman (input) for mailman id 566417;
 Thu, 20 Jul 2023 07:53:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o2HW=DG=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qMOTU-0000Je-Oh
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 07:53:24 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f1a568b-26d2-11ee-8611-37d641c3527e;
 Thu, 20 Jul 2023 09:53:21 +0200 (CEST)
Received: from Dell.bugseng.com (unknown [37.162.143.190])
 by support.bugseng.com (Postfix) with ESMTPSA id 0FCF64EE0C89;
 Thu, 20 Jul 2023 09:53:19 +0200 (CEST)
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
X-Inumbo-ID: 7f1a568b-26d2-11ee-8611-37d641c3527e
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: [XEN PATCH v3] x86/HVM: address violations of MISRA C:2012 Rules 8.2 and 8.3
Date: Thu, 20 Jul 2023 09:53:13 +0200
Message-Id: <129cc9919d8664e95812791a91ecb14fcc70b946.1689839462.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Give a name to unnamed parameters thus addressing violations of
MISRA C:2012 Rule 8.2 ("Function types shall be in prototype form with
named parameters").
Keep consistency between parameter names and types used in function
declarations and the ones used in the corresponding function
definitions, thus addressing violations of MISRA C:2012 Rule 8.3
("All declarations of an object or function shall use the same names
and type qualifiers").

No functional changes.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
Changes in v3:
  - removed changes to convert_hour() (Jan took care of it);
  - modified also hvm_set_rdtsc_exiting() declaration;
  - modified also svm_intercept_msr() declaration.
---
Changes in v2:
  - u64 vs uint64_t mismatches are solved in favor of the stdint types;
  - adapted parameter names of nsvm_vcpu_vmexit_event() definition to
    the names used in its declaration.
---

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/hvm/domain.c               |  2 +-
 xen/arch/x86/hvm/hvm.c                  |  6 +++---
 xen/arch/x86/hvm/svm/nestedsvm.c        |  8 ++++----
 xen/arch/x86/hvm/vioapic.c              |  2 +-
 xen/arch/x86/include/asm/hvm/domain.h   |  2 +-
 xen/arch/x86/include/asm/hvm/hvm.h      | 20 ++++++++++----------
 xen/arch/x86/include/asm/hvm/irq.h      | 14 +++++++-------
 xen/arch/x86/include/asm/hvm/save.h     |  4 ++--
 xen/arch/x86/include/asm/hvm/support.h  |  2 +-
 xen/arch/x86/include/asm/hvm/svm/vmcb.h |  2 +-
 10 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/xen/arch/x86/hvm/domain.c b/xen/arch/x86/hvm/domain.c
index 7692ee24c2..7f6e362a70 100644
--- a/xen/arch/x86/hvm/domain.c
+++ b/xen/arch/x86/hvm/domain.c
@@ -100,7 +100,7 @@ static int check_segment(struct segment_register *reg, enum x86_segment seg)
 }
 
 /* Called by VCPUOP_initialise for HVM guests. */
-int arch_set_info_hvm_guest(struct vcpu *v, const vcpu_hvm_context_t *ctx)
+int arch_set_info_hvm_guest(struct vcpu *v, const struct vcpu_hvm_context *ctx)
 {
     const struct domain *d = v->domain;
     struct cpu_user_regs *uregs = &v->arch.user_regs;
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 57363c2ae1..28d131a202 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -272,7 +272,7 @@ uint8_t hvm_combine_hw_exceptions(uint8_t vec1, uint8_t vec2)
     return X86_EXC_DF;
 }
 
-void hvm_set_rdtsc_exiting(struct domain *d, bool_t enable)
+void hvm_set_rdtsc_exiting(struct domain *d, bool enable)
 {
     struct vcpu *v;
 
@@ -280,7 +280,7 @@ void hvm_set_rdtsc_exiting(struct domain *d, bool_t enable)
         alternative_vcall(hvm_funcs.set_rdtsc_exiting, v, enable);
 }
 
-void hvm_get_guest_pat(struct vcpu *v, u64 *guest_pat)
+void hvm_get_guest_pat(struct vcpu *v, uint64_t *guest_pat)
 {
     if ( !alternative_call(hvm_funcs.get_guest_pat, v, guest_pat) )
         *guest_pat = v->arch.hvm.pat_cr;
@@ -426,7 +426,7 @@ static void hvm_set_guest_tsc_adjust(struct vcpu *v, u64 tsc_adjust)
         update_vcpu_system_time(v);
 }
 
-u64 hvm_get_guest_tsc_fixed(struct vcpu *v, uint64_t at_tsc)
+uint64_t hvm_get_guest_tsc_fixed(struct vcpu *v, uint64_t at_tsc)
 {
     uint64_t tsc;
 
diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index 5d74863268..a09b6abaae 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -837,12 +837,12 @@ nsvm_vcpu_vmexit_inject(struct vcpu *v, struct cpu_user_regs *regs,
 }
 
 int cf_check nsvm_vcpu_vmexit_event(
-    struct vcpu *v, const struct x86_event *trap)
+    struct vcpu *v, const struct x86_event *event)
 {
     ASSERT(vcpu_nestedhvm(v).nv_vvmcx != NULL);
 
-    nestedsvm_vmexit_defer(v, VMEXIT_EXCEPTION_DE + trap->vector,
-                           trap->error_code, trap->cr2);
+    nestedsvm_vmexit_defer(v, VMEXIT_EXCEPTION_DE + event->vector,
+                           event->error_code, event->cr2);
     return NESTEDHVM_VMEXIT_DONE;
 }
 
@@ -1538,7 +1538,7 @@ nestedsvm_vcpu_interrupt(struct vcpu *v, const struct hvm_intack intack)
     return NSVM_INTR_NOTINTERCEPTED;
 }
 
-bool_t
+bool
 nestedsvm_gif_isset(struct vcpu *v)
 {
     struct nestedsvm *svm = &vcpu_nestedsvm(v);
diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
index 41e3c4d5e4..4e40d3609a 100644
--- a/xen/arch/x86/hvm/vioapic.c
+++ b/xen/arch/x86/hvm/vioapic.c
@@ -43,7 +43,7 @@
 /* HACK: Route IRQ0 only to VCPU0 to prevent time jumps. */
 #define IRQ0_SPECIAL_ROUTING 1
 
-static void vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int irq);
+static void vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int pin);
 
 static struct hvm_vioapic *addr_vioapic(const struct domain *d,
                                         unsigned long addr)
diff --git a/xen/arch/x86/include/asm/hvm/domain.h b/xen/arch/x86/include/asm/hvm/domain.h
index 02c32cf26d..6e53ce4449 100644
--- a/xen/arch/x86/include/asm/hvm/domain.h
+++ b/xen/arch/x86/include/asm/hvm/domain.h
@@ -47,7 +47,7 @@ struct hvm_pi_ops {
      * Hook into arch_vcpu_block(), which is called
      * from vcpu_block() and vcpu_do_poll().
      */
-    void (*vcpu_block)(struct vcpu *);
+    void (*vcpu_block)(struct vcpu *v);
 };
 
 struct hvm_domain {
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index 3c37f522b9..6d53713fc3 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -151,8 +151,8 @@ struct hvm_function_table {
 
     void (*fpu_leave)(struct vcpu *v);
 
-    int  (*get_guest_pat)(struct vcpu *v, u64 *);
-    int  (*set_guest_pat)(struct vcpu *v, u64);
+    int  (*get_guest_pat)(struct vcpu *v, uint64_t *gpat);
+    int  (*set_guest_pat)(struct vcpu *v, uint64_t gpat);
 
     void (*set_tsc_offset)(struct vcpu *v, u64 offset, u64 at_tsc);
 
@@ -180,8 +180,8 @@ struct hvm_function_table {
     int (*msr_write_intercept)(unsigned int msr, uint64_t msr_content);
     void (*handle_cd)(struct vcpu *v, unsigned long value);
     void (*set_info_guest)(struct vcpu *v);
-    void (*set_rdtsc_exiting)(struct vcpu *v, bool_t);
-    void (*set_descriptor_access_exiting)(struct vcpu *v, bool);
+    void (*set_rdtsc_exiting)(struct vcpu *v, bool enable);
+    void (*set_descriptor_access_exiting)(struct vcpu *v, bool enable);
 
     /* Nested HVM */
     int (*nhvm_vcpu_initialise)(struct vcpu *v);
@@ -265,10 +265,10 @@ int hvm_vcpu_cacheattr_init(struct vcpu *v);
 void hvm_vcpu_cacheattr_destroy(struct vcpu *v);
 void hvm_vcpu_reset_state(struct vcpu *v, uint16_t cs, uint16_t ip);
 
-void hvm_get_guest_pat(struct vcpu *v, u64 *guest_pat);
-int hvm_set_guest_pat(struct vcpu *v, u64 guest_pat);
+void hvm_get_guest_pat(struct vcpu *v, uint64_t *guest_pat);
+int hvm_set_guest_pat(struct vcpu *v, uint64_t guest_pat);
 
-u64 hvm_get_guest_tsc_fixed(struct vcpu *v, u64 at_tsc);
+uint64_t hvm_get_guest_tsc_fixed(struct vcpu *v, uint64_t at_tsc);
 
 u64 hvm_scale_tsc(const struct domain *d, u64 tsc);
 u64 hvm_get_tsc_scaling_ratio(u32 gtsc_khz);
@@ -282,7 +282,7 @@ int vmsi_deliver(
     uint8_t dest, uint8_t dest_mode,
     uint8_t delivery_mode, uint8_t trig_mode);
 struct hvm_pirq_dpci;
-void vmsi_deliver_pirq(struct domain *d, const struct hvm_pirq_dpci *);
+void vmsi_deliver_pirq(struct domain *d, const struct hvm_pirq_dpci *pirq_dpci);
 int hvm_girq_dest_2_vcpu_id(struct domain *d, uint8_t dest, uint8_t dest_mode);
 
 enum hvm_intblk
@@ -309,7 +309,7 @@ int hvm_event_needs_reinjection(uint8_t type, uint8_t vector);
 
 uint8_t hvm_combine_hw_exceptions(uint8_t vec1, uint8_t vec2);
 
-void hvm_set_rdtsc_exiting(struct domain *d, bool_t enable);
+void hvm_set_rdtsc_exiting(struct domain *d, bool enable);
 
 enum hvm_task_switch_reason { TSW_jmp, TSW_iret, TSW_call_or_int };
 void hvm_task_switch(
@@ -350,7 +350,7 @@ void *hvm_map_guest_frame_rw(unsigned long gfn, bool_t permanent,
                              bool_t *writable);
 void *hvm_map_guest_frame_ro(unsigned long gfn, bool_t permanent);
 void hvm_unmap_guest_frame(void *p, bool_t permanent);
-void hvm_mapped_guest_frames_mark_dirty(struct domain *);
+void hvm_mapped_guest_frames_mark_dirty(struct domain *d);
 
 int hvm_debug_op(struct vcpu *v, int32_t op);
 
diff --git a/xen/arch/x86/include/asm/hvm/irq.h b/xen/arch/x86/include/asm/hvm/irq.h
index 2d136ab99b..1817ca6e2d 100644
--- a/xen/arch/x86/include/asm/hvm/irq.h
+++ b/xen/arch/x86/include/asm/hvm/irq.h
@@ -160,17 +160,17 @@ struct hvm_pirq_dpci {
     struct list_head softirq_list;
 };
 
-void pt_pirq_init(struct domain *, struct hvm_pirq_dpci *);
-bool pt_pirq_cleanup_check(struct hvm_pirq_dpci *);
+void pt_pirq_init(struct domain *d, struct hvm_pirq_dpci *dpci);
+bool pt_pirq_cleanup_check(struct hvm_pirq_dpci *dpci);
 int pt_pirq_iterate(struct domain *d,
-                    int (*cb)(struct domain *,
-                              struct hvm_pirq_dpci *, void *arg),
+                    int (*cb)(struct domain *d,
+                              struct hvm_pirq_dpci *dpci, void *arg),
                     void *arg);
 
 #ifdef CONFIG_HVM
-bool pt_pirq_softirq_active(struct hvm_pirq_dpci *);
+bool pt_pirq_softirq_active(struct hvm_pirq_dpci *pirq_dpci);
 #else
-static inline bool pt_pirq_softirq_active(struct hvm_pirq_dpci *dpci)
+static inline bool pt_pirq_softirq_active(struct hvm_pirq_dpci *pirq_dpci)
 {
     return false;
 }
@@ -211,6 +211,6 @@ void hvm_assert_evtchn_irq(struct vcpu *v);
 void hvm_set_callback_via(struct domain *d, uint64_t via);
 
 struct pirq;
-bool hvm_domain_use_pirq(const struct domain *, const struct pirq *);
+bool hvm_domain_use_pirq(const struct domain *d, const struct pirq *pirq);
 
 #endif /* __ASM_X86_HVM_IRQ_H__ */
diff --git a/xen/arch/x86/include/asm/hvm/save.h b/xen/arch/x86/include/asm/hvm/save.h
index 9d838c48e3..535cf68ed2 100644
--- a/xen/arch/x86/include/asm/hvm/save.h
+++ b/xen/arch/x86/include/asm/hvm/save.h
@@ -36,8 +36,8 @@ void _hvm_write_entry(struct hvm_domain_context *h,
     r; })
 
 /* Unmarshalling: test an entry's size and typecode and record the instance */
-int _hvm_check_entry(struct hvm_domain_context *h, 
-                     uint16_t type, uint32_t len, bool_t strict_length);
+int _hvm_check_entry(struct hvm_domain_context *h,
+                     uint16_t type, uint32_t len, bool strict_length);
 
 /* Unmarshalling: copy the contents in a type-safe way */
 void _hvm_read_entry(struct hvm_domain_context *h,
diff --git a/xen/arch/x86/include/asm/hvm/support.h b/xen/arch/x86/include/asm/hvm/support.h
index 8d4707e58c..ab7de0a43b 100644
--- a/xen/arch/x86/include/asm/hvm/support.h
+++ b/xen/arch/x86/include/asm/hvm/support.h
@@ -135,7 +135,7 @@ int hvm_descriptor_access_intercept(uint64_t exit_info,
                                     unsigned int descriptor, bool is_write);
 int hvm_mov_to_cr(unsigned int cr, unsigned int gpr);
 int hvm_mov_from_cr(unsigned int cr, unsigned int gpr);
-void hvm_ud_intercept(struct cpu_user_regs *);
+void hvm_ud_intercept(struct cpu_user_regs *regs);
 
 /*
  * May return X86EMUL_EXCEPTION, at which point the caller is responsible for
diff --git a/xen/arch/x86/include/asm/hvm/svm/vmcb.h b/xen/arch/x86/include/asm/hvm/svm/vmcb.h
index a1a8a7fd25..91221ff4e2 100644
--- a/xen/arch/x86/include/asm/hvm/svm/vmcb.h
+++ b/xen/arch/x86/include/asm/hvm/svm/vmcb.h
@@ -607,7 +607,7 @@ void setup_vmcb_dump(void);
 #define MSR_INTERCEPT_READ    1
 #define MSR_INTERCEPT_WRITE   2
 #define MSR_INTERCEPT_RW      (MSR_INTERCEPT_WRITE | MSR_INTERCEPT_READ)
-void svm_intercept_msr(struct vcpu *v, uint32_t msr, int enable);
+void svm_intercept_msr(struct vcpu *v, uint32_t msr, int flags);
 #define svm_disable_intercept_for_msr(v, msr) svm_intercept_msr((v), (msr), MSR_INTERCEPT_NONE)
 #define svm_enable_intercept_for_msr(v, msr) svm_intercept_msr((v), (msr), MSR_INTERCEPT_RW)
 
-- 
2.34.1


