Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E72B759265
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 12:10:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565738.884187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM48L-0002IA-Qt; Wed, 19 Jul 2023 10:10:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565738.884187; Wed, 19 Jul 2023 10:10:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM48L-0002GV-Nq; Wed, 19 Jul 2023 10:10:13 +0000
Received: by outflank-mailman (input) for mailman id 565738;
 Wed, 19 Jul 2023 10:10:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8bnZ=DF=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qM48J-0002GN-Nm
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 10:10:11 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 70ccd720-261c-11ee-8611-37d641c3527e;
 Wed, 19 Jul 2023 12:10:09 +0200 (CEST)
Received: from Dell.bugseng.com (unknown [37.163.72.116])
 by support.bugseng.com (Postfix) with ESMTPSA id 9B72A4EE0C89;
 Wed, 19 Jul 2023 12:10:07 +0200 (CEST)
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
X-Inumbo-ID: 70ccd720-261c-11ee-8611-37d641c3527e
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
Subject: [XEN PATCH] x86/HVM: address violations of MISRA C:2012 Rules 8.2 and 8.3
Date: Wed, 19 Jul 2023 12:07:16 +0200
Message-Id: <7c89ac0fe44dbd1ba1436a91024efebf2794db40.1689761143.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Give a name to unnamed parameters thus addressing violations of
MISRA C:2012 Rule 8.2 ("Function types shall be in prototype form with
named parameters").
Keep consistency between parameter names and types used in function
declarations and the ones used in the corresponding function
definitions thus addressing violations of MISRA C:2012 Rule 8.3
("All declarations of an object or function shall use the same names
and type qualifiers").

No functional changes.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/hvm/domain.c              |  2 +-
 xen/arch/x86/hvm/hvm.c                 |  4 ++--
 xen/arch/x86/hvm/rtc.c                 | 12 ++++++------
 xen/arch/x86/hvm/svm/nestedhvm.h       |  2 +-
 xen/arch/x86/hvm/svm/nestedsvm.c       |  2 +-
 xen/arch/x86/hvm/vioapic.c             |  2 +-
 xen/arch/x86/include/asm/hvm/domain.h  |  2 +-
 xen/arch/x86/include/asm/hvm/hvm.h     | 12 ++++++------
 xen/arch/x86/include/asm/hvm/irq.h     | 14 +++++++-------
 xen/arch/x86/include/asm/hvm/save.h    |  4 ++--
 xen/arch/x86/include/asm/hvm/support.h |  2 +-
 11 files changed, 29 insertions(+), 29 deletions(-)

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
index 57363c2ae1..8f19a79f6f 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -319,7 +319,7 @@ static bool pat_valid(uint64_t val)
     return !(any_gt_7 | any_2_or_3);
 }
 
-int hvm_set_guest_pat(struct vcpu *v, uint64_t guest_pat)
+int hvm_set_guest_pat(struct vcpu *v, u64 guest_pat)
 {
     if ( !pat_valid(guest_pat) )
         return 0;
@@ -426,7 +426,7 @@ static void hvm_set_guest_tsc_adjust(struct vcpu *v, u64 tsc_adjust)
         update_vcpu_system_time(v);
 }
 
-u64 hvm_get_guest_tsc_fixed(struct vcpu *v, uint64_t at_tsc)
+u64 hvm_get_guest_tsc_fixed(struct vcpu *v, u64 at_tsc)
 {
     uint64_t tsc;
 
diff --git a/xen/arch/x86/hvm/rtc.c b/xen/arch/x86/hvm/rtc.c
index c1ab6c7d58..4a586342ce 100644
--- a/xen/arch/x86/hvm/rtc.c
+++ b/xen/arch/x86/hvm/rtc.c
@@ -559,17 +559,17 @@ static inline int from_bcd(RTCState *s, int a)
 
 /* Hours in 12 hour mode are in 1-12 range, not 0-11.
  * So we need convert it before using it*/
-static inline int convert_hour(RTCState *s, int raw)
+static inline int convert_hour(RTCState *s, int hour)
 {
-    int hour = from_bcd(s, raw & 0x7f);
+    int ret = from_bcd(s, hour & 0x7f);
 
     if (!(s->hw.cmos_data[RTC_REG_B] & RTC_24H))
     {
-        hour %= 12;
-        if (raw & 0x80)
-            hour += 12;
+        ret %= 12;
+        if (hour & 0x80)
+            ret += 12;
     }
-    return hour;
+    return ret;
 }
 
 static void rtc_set_time(RTCState *s)
diff --git a/xen/arch/x86/hvm/svm/nestedhvm.h b/xen/arch/x86/hvm/svm/nestedhvm.h
index 43245e13de..eb9c416307 100644
--- a/xen/arch/x86/hvm/svm/nestedhvm.h
+++ b/xen/arch/x86/hvm/svm/nestedhvm.h
@@ -42,7 +42,7 @@ int cf_check nsvm_vcpu_initialise(struct vcpu *v);
 int cf_check nsvm_vcpu_reset(struct vcpu *v);
 int nsvm_vcpu_vmrun(struct vcpu *v, struct cpu_user_regs *regs);
 int cf_check nsvm_vcpu_vmexit_event(struct vcpu *v,
-                                    const struct x86_event *event);
+                                    const struct x86_event *trap);
 uint64_t cf_check nsvm_vcpu_hostcr3(struct vcpu *v);
 bool cf_check nsvm_vmcb_guest_intercepts_event(
     struct vcpu *v, unsigned int vector, int errcode);
diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index 5d74863268..9b4595f74a 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
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
index 3c37f522b9..7943e287cf 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -151,8 +151,8 @@ struct hvm_function_table {
 
     void (*fpu_leave)(struct vcpu *v);
 
-    int  (*get_guest_pat)(struct vcpu *v, u64 *);
-    int  (*set_guest_pat)(struct vcpu *v, u64);
+    int  (*get_guest_pat)(struct vcpu *v, u64 *gpat);
+    int  (*set_guest_pat)(struct vcpu *v, u64 gpat);
 
     void (*set_tsc_offset)(struct vcpu *v, u64 offset, u64 at_tsc);
 
@@ -180,8 +180,8 @@ struct hvm_function_table {
     int (*msr_write_intercept)(unsigned int msr, uint64_t msr_content);
     void (*handle_cd)(struct vcpu *v, unsigned long value);
     void (*set_info_guest)(struct vcpu *v);
-    void (*set_rdtsc_exiting)(struct vcpu *v, bool_t);
-    void (*set_descriptor_access_exiting)(struct vcpu *v, bool);
+    void (*set_rdtsc_exiting)(struct vcpu *v, bool_t enable);
+    void (*set_descriptor_access_exiting)(struct vcpu *v, bool enable);
 
     /* Nested HVM */
     int (*nhvm_vcpu_initialise)(struct vcpu *v);
@@ -282,7 +282,7 @@ int vmsi_deliver(
     uint8_t dest, uint8_t dest_mode,
     uint8_t delivery_mode, uint8_t trig_mode);
 struct hvm_pirq_dpci;
-void vmsi_deliver_pirq(struct domain *d, const struct hvm_pirq_dpci *);
+void vmsi_deliver_pirq(struct domain *d, const struct hvm_pirq_dpci *pirq_dpci);
 int hvm_girq_dest_2_vcpu_id(struct domain *d, uint8_t dest, uint8_t dest_mode);
 
 enum hvm_intblk
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
-- 
2.34.1


