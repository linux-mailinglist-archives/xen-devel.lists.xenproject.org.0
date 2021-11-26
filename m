Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE1445EEB5
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 14:07:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232845.404011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqax7-0005gc-Rw; Fri, 26 Nov 2021 13:07:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232845.404011; Fri, 26 Nov 2021 13:07:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqax7-0005Ac-55; Fri, 26 Nov 2021 13:07:45 +0000
Received: by outflank-mailman (input) for mailman id 232845;
 Fri, 26 Nov 2021 13:07:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+gV=QN=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mqavW-0003W9-4X
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 13:06:06 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c0b457b-4eb9-11ec-a9d2-d9f7a1cc8784;
 Fri, 26 Nov 2021 14:06:04 +0100 (CET)
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
X-Inumbo-ID: 9c0b457b-4eb9-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637931964;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hONvnroaH0E3hbObIHELnWwYtV3ug1ZhmACYEbr++xc=;
  b=CHZdsg2L+iRHfERqQu9SZhvywjaYMQkOXP6zqcyEWuMRIszgOsW+9mcG
   ti+ojR66TPCnwQM+f+LoB7l2ohojJa4T+QKCMU8KwHVY5mjNkKljGNQCh
   vdF6PYkn5jWrk07i4dRcc2YEv5XWwv8sOdBXoudoDFC1VfMF8ZI9eqaeq
   Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: fQ25UPOTu+fu01MWoH/vgj3u2zGbsKKD7QCLJWNp0kziqNHAAuOedr34hC0a7jgA23XdznJ+rF
 cBz0fcKSzLGXI9BuS7KlTBfjBs/+Pzsu8q2eNjD1XAsKIYIdL7KcgkCUw9d0uAZJNQOtoOHfj7
 C0Qqy83/e0e+fuMRAqYmAi0kCvzm4NEntLz87ennNnd0z1ENb1F7B89xEpuFNZ/ERLET2Vj6k5
 IgfLFL8VHDR5FvpYR9at5f3YtgIywWSOZapEQy/G5F13WgE2crQCAgvt5bFrdhmM9o1Rc9Iszc
 DapEFMsz1/4tWt7Q1aasqCdW
X-SBRS: 5.1
X-MesageID: 58676436
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:aAWv7apRmnzaiiC08hoOrVifxaBeBmLVYhIvgKrLsJaIsI4StFCzt
 garIBmFafiCM2TyKd8gPdi0/UoB6sTSy9YyHgRlrC89FykR8puZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dnd+4f5fs7Rh2Ncx2ILnW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCncCWFgJ1O4HhpL02fyNxCRlcA51s/ZaSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFKoZtmtt0nfyCvE+TIqYa67L+cVZzHE7gcUm8fP2O
 ppHNmQzN0qojxtnAA5KGJMEl8eUo0LCInpbpWOkgqMJ7D2GpOB2+Oe0a4eEEjCQfu1Kmm6Iq
 2SA+H72ajk4HtGCzTuO8lq3m/TC2yj8Xeo6BLC+s/JnnlCX7mgSEwENE0u2p+GjjUyzUM4ZL
 FYbkhfCtoBrqhbtFIOkGUTl/jjU5XbwRua8DcVmzl6Ilq/4zjrALUQ+ZyR5SuIWnsofEGlCO
 kCyo/vlAjlmsbuwQH2b96uJoT7aBRX5PVPudgdfE1JbvoCLTJUby0uWE409SPLdYsjdQGmom
 1i3QD4Ca6L/ZCLh/4Gy5hj5jj2lvfAlpSZlt1yMDgpJAu6UDbNJhrBEC3CHsp6sz67DFzFtW
 UTofeDFt4ji6rnXyUSwrB0lRu3B2hp8GGS0baRTN5cg7S+x3HWoYJpd5jpzTG8wbJ1bKWG0P
 x6P518KjHO2AJdMRfQsC25WI553pZUM6Py/DqyEBjawSsQZmPC7ENFGOhfLgjGFfLkEmqAjI
 5aLGftA/l5BYZmLOAGeHr9HuZdyn3hW7TqKGfjTkkT2uZLDNSX9YepUbzOzghURsfrsTPP9q
 I0EaaNnCnx3DYXDX8Ug2dJJcA1RcyFkXcueRg4+XrfrHzeK0VoJU5f5qY7NsaQ890iMvuuXr
 Hy7RGFCz1/z2S/OJQmQMygxY7LzR5dv63k8OHV0b1qv3nEiZ6ep7bseKMRrLeV2qrQ7wK4mV
 eQBduWBHu9LFmbN9QMCYMSvt4dlbhmq216DZnL3fDglcpd8bAXV4du4LBD3/SwDA3Pv58szq
 rGtzC3BRp8HS1gwBcracqv3nViwoWIciKR5WE6Reotff0Dl8Y5LLS3tj6Bof5FQeEubnjbDj
 lSYGxYVo+XJsrQZytiRiPDWtZqtHst/AlFeQzvR44GpOHSI5WGk24JBDrqFJGiPSGPu9ay+T
 uxJ1PWgYuYflVNHvocgQbZmyaUyu4nmq7NAl1k2GXzKaxKgC696I2nA1s5K7/UfyrhcsAqwe
 0SO5tgFZunZZJK7SAYcdFg/c+CO9fAIgT2Dv/06LXLz6DJz4LfaA15ZOAOBiXAFIbZ4WG//L
 TzNZCLCB9SDtycX
IronPort-HdrOrdr: A9a23:bGlimapMfcIEts7cDGVDhYcaV5oTeYIsimQD101hICG8cqSj+f
 xG+85rrCMc6QxhPk3I9urhBEDtex/hHNtOkOws1NSZLW7bUQmTXeJfBOLZqlWKcUDDH6xmpM
 NdmsBFeaXN5DNB7PoSjjPWLz9Z+qjkzJyV
X-IronPort-AV: E=Sophos;i="5.87,266,1631592000"; 
   d="scan'208";a="58676436"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 54/65] x86/stack: Annotate fnptr targets
Date: Fri, 26 Nov 2021 12:34:35 +0000
Message-ID: <20211126123446.32324-55-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211126123446.32324-1-andrew.cooper3@citrix.com>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The function typecheck in switch_stack_and_jump() is incompatible with control
flow typechecking.  It's ok for reset_stack_and_jump_ind(), but for
reset_stack_and_jump(), it would force us to ENDBR64 the targets which are
branched to directly.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

Honestly, the control flow typechecking is distinctly sub-par, but it's too
late to do anything now.
---
 xen/arch/x86/domain.c             | 6 +++---
 xen/arch/x86/hvm/svm/svm.c        | 6 +++---
 xen/arch/x86/hvm/vmx/vmcs.c       | 2 +-
 xen/arch/x86/hvm/vmx/vmx.c        | 8 ++++----
 xen/arch/x86/pv/domain.c          | 2 +-
 xen/arch/x86/x86_64/entry.S       | 1 +
 xen/include/asm-x86/current.h     | 2 +-
 xen/include/asm-x86/hvm/vmx/vmx.h | 2 +-
 xen/include/asm-x86/pv/domain.h   | 4 ++--
 9 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index ae7c88b51af1..afccc1525f8b 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -132,7 +132,7 @@ void play_dead(void)
         dead_idle();
 }
 
-static void noreturn idle_loop(void)
+static void noreturn cf_check idle_loop(void)
 {
     unsigned int cpu = smp_processor_id();
     /*
@@ -1790,7 +1790,7 @@ static void save_segments(struct vcpu *v)
     }
 }
 
-void paravirt_ctxt_switch_from(struct vcpu *v)
+void cf_check paravirt_ctxt_switch_from(struct vcpu *v)
 {
     save_segments(v);
 
@@ -1804,7 +1804,7 @@ void paravirt_ctxt_switch_from(struct vcpu *v)
         write_debugreg(7, 0);
 }
 
-void paravirt_ctxt_switch_to(struct vcpu *v)
+void cf_check paravirt_ctxt_switch_to(struct vcpu *v)
 {
     root_pgentry_t *root_pgt = this_cpu(root_pgt);
 
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index c01477c97c09..2d81e4256455 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -940,7 +940,7 @@ static inline void svm_tsc_ratio_load(struct vcpu *v)
         wrmsrl(MSR_AMD64_TSC_RATIO, hvm_tsc_scaling_ratio(v->domain));
 }
 
-static void svm_ctxt_switch_from(struct vcpu *v)
+static void cf_check svm_ctxt_switch_from(struct vcpu *v)
 {
     int cpu = smp_processor_id();
 
@@ -965,7 +965,7 @@ static void svm_ctxt_switch_from(struct vcpu *v)
     enable_each_ist(idt_tables[cpu]);
 }
 
-static void svm_ctxt_switch_to(struct vcpu *v)
+static void cf_check svm_ctxt_switch_to(struct vcpu *v)
 {
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
     int cpu = smp_processor_id();
@@ -992,7 +992,7 @@ static void svm_ctxt_switch_to(struct vcpu *v)
         wrmsr_tsc_aux(v->arch.msrs->tsc_aux);
 }
 
-static void noreturn svm_do_resume(void)
+static void noreturn cf_check svm_do_resume(void)
 {
     struct vcpu *v = current;
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index 441be8127148..6dc4833aadd2 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -1865,7 +1865,7 @@ void vmx_vmentry_failure(void)
 
 void noreturn vmx_asm_do_vmentry(void);
 
-void vmx_do_resume(void)
+void cf_check vmx_do_resume(void)
 {
     struct vcpu *v = current;
     bool_t debug_state;
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 88a6a5ec824b..594de04568ea 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -63,8 +63,8 @@
 static bool_t __initdata opt_force_ept;
 boolean_param("force-ept", opt_force_ept);
 
-static void vmx_ctxt_switch_from(struct vcpu *v);
-static void vmx_ctxt_switch_to(struct vcpu *v);
+static void cf_check vmx_ctxt_switch_from(struct vcpu *v);
+static void cf_check vmx_ctxt_switch_to(struct vcpu *v);
 
 static int alloc_vlapic_mapping(void);
 static void vmx_install_vlapic_mapping(struct vcpu *v);
@@ -885,7 +885,7 @@ static void cf_check vmx_fpu_leave(struct vcpu *v)
     }
 }
 
-static void vmx_ctxt_switch_from(struct vcpu *v)
+static void cf_check vmx_ctxt_switch_from(struct vcpu *v)
 {
     /*
      * Return early if trying to do a context switch without VMX enabled,
@@ -917,7 +917,7 @@ static void vmx_ctxt_switch_from(struct vcpu *v)
         vmx_pi_switch_from(v);
 }
 
-static void vmx_ctxt_switch_to(struct vcpu *v)
+static void cf_check vmx_ctxt_switch_to(struct vcpu *v)
 {
     vmx_restore_guest_msrs(v);
     vmx_restore_dr(v);
diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
index 55146c15c853..f94f28c8e271 100644
--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -351,7 +351,7 @@ void pv_domain_destroy(struct domain *d)
     FREE_XENHEAP_PAGE(d->arch.pv.gdt_ldt_l1tab);
 }
 
-void noreturn continue_pv_domain(void);
+void noreturn cf_check continue_pv_domain(void);
 
 int pv_domain_initialise(struct domain *d)
 {
diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index 3eaf0e67b2b9..8494b97a54a2 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -625,6 +625,7 @@ ENTRY(dom_crash_sync_extable)
 /* No special register assumptions. */
 #ifdef CONFIG_PV
 ENTRY(continue_pv_domain)
+        ENDBR64
         call  check_wakeup_from_wait
 ret_from_intr:
         GET_CURRENT(bx)
diff --git a/xen/include/asm-x86/current.h b/xen/include/asm-x86/current.h
index a74ad4bc4c44..d423f2fd82ca 100644
--- a/xen/include/asm-x86/current.h
+++ b/xen/include/asm-x86/current.h
@@ -173,7 +173,6 @@ unsigned long get_stack_dump_bottom (unsigned long sp);
 #define switch_stack_and_jump(fn, instr, constr)                        \
     ({                                                                  \
         unsigned int tmp;                                               \
-        (void)((fn) == (void (*)(void))NULL);                           \
         BUILD_BUG_ON(!ssaj_has_attr_noreturn(fn));                      \
         __asm__ __volatile__ (                                          \
             SHADOW_STACK_WORK                                           \
@@ -198,6 +197,7 @@ unsigned long get_stack_dump_bottom (unsigned long sp);
 
 /* The constraint may only specify non-call-clobbered registers. */
 #define reset_stack_and_jump_ind(fn)                                    \
+    (void)((fn) == (void (*)(void))NULL);                               \
     switch_stack_and_jump(fn, "INDIRECT_JMP %", "b")
 
 /*
diff --git a/xen/include/asm-x86/hvm/vmx/vmx.h b/xen/include/asm-x86/hvm/vmx/vmx.h
index 459c84dd9f09..4bb8d08f2ed9 100644
--- a/xen/include/asm-x86/hvm/vmx/vmx.h
+++ b/xen/include/asm-x86/hvm/vmx/vmx.h
@@ -93,7 +93,7 @@ typedef enum {
 
 void vmx_asm_vmexit_handler(struct cpu_user_regs);
 void vmx_intr_assist(void);
-void noreturn vmx_do_resume(void);
+void noreturn cf_check vmx_do_resume(void);
 void vmx_vlapic_msr_changed(struct vcpu *v);
 struct hvm_emulate_ctxt;
 void vmx_realmode_emulate_one(struct hvm_emulate_ctxt *hvmemul_ctxt);
diff --git a/xen/include/asm-x86/pv/domain.h b/xen/include/asm-x86/pv/domain.h
index df9716ff26a8..68aec0b5a3fa 100644
--- a/xen/include/asm-x86/pv/domain.h
+++ b/xen/include/asm-x86/pv/domain.h
@@ -104,8 +104,8 @@ static inline unsigned long pv_make_cr4(const struct vcpu *v) { return ~0ul; }
 
 #endif	/* CONFIG_PV */
 
-void paravirt_ctxt_switch_from(struct vcpu *v);
-void paravirt_ctxt_switch_to(struct vcpu *v);
+void cf_check paravirt_ctxt_switch_from(struct vcpu *v);
+void cf_check paravirt_ctxt_switch_to(struct vcpu *v);
 
 #endif	/* __X86_PV_DOMAIN_H__ */
 
-- 
2.11.0


