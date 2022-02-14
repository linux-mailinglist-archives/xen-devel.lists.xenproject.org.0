Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EE64B5118
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:06:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271707.466340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJb3X-0007QA-91; Mon, 14 Feb 2022 13:06:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271707.466340; Mon, 14 Feb 2022 13:06:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJb3W-0007IL-OS; Mon, 14 Feb 2022 13:06:14 +0000
Received: by outflank-mailman (input) for mailman id 271707;
 Mon, 14 Feb 2022 13:06:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJb3D-0008IH-Cm
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:05:55 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d730742f-8d96-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 14:05:53 +0100 (CET)
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
X-Inumbo-ID: d730742f-8d96-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644843953;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=6nZ3O0wdLsQ8m8lXwVCWVEgPWujRaX5DsONJatSODKA=;
  b=G9ZJpayqO9bP82hoaP0FhIAwhSLDB5uKXAieVBXZm7zOHef4mzK1qcTw
   oJVASdUoWjm3dCI1ytz2mgoToabfmS+KTXPkaxVd9ftJquU+QP7LUQR26
   cuLX2E6oSpOSbqgD1mIAUB1Cs1EzlkzrDbhtyHoA3XEJc481YXRmWsPdW
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: GQTUxjXdtz64efFHYVYqhkT4VKeUQpZMdJCuq4Sb/IRQJEhcxYbZOMG5zuSpK645tT5EPt4UUR
 h5HMv3hPz+8PdBFGIRSI9kt7ds36n3JCKgmzfC74Q5jjjwe0pSYJ8koiTnWj2fD5k7uaM8Roy0
 I2C6maIxHplB5oayzM4Dx57jP9AreX1BodhVgNKItg7KwvhlhtEGXBm5CYlvuBYVPj4v86s3cE
 sSBnEXysYO/P8DnHqxw+6TKbYWCV/j1VYU7HdbSl0MFi2BO6IRfUaWxE3rbMB9QEzMkdv7MfGR
 tC/lcu5OYTWxui7SX00mD8iC
X-SBRS: 5.1
X-MesageID: 66374919
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:vmvu3ajx16L7aG6g1ayRceUaX161fhcKZh0ujC45NGQN5FlHY01je
 htvUT/Sb/2CazeneNslPo+/o04AvpbQy99jSwVqqXtmRXwb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0GE/NtTo5w7Rj2tQx3YDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /12kpCxcwVwM5TCs+EcUERSSRg5MPdZreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHCOo8Ft24m5jbeFfs8GrjIQrnQ5M8e1zA17ixLNaiAP
 JVFOGM+BPjGSzsTfVkIFYo7oN6LqGWgaiRVrFOQjpNitgA/yyQuieOwYbI5YOeiVchT20qVu
 G/C12D4GQ0BcsySzyKf9XChjfOJmjn0ML/+D5XhqKQs2gfKgDVOVltGDjNXvMVVlGaFfN5eE
 U5N9xMghq0z9xGhFOC6Uken9SvsUgEnZ/JcFOgz6Qeow6XS4hqECmVscgOteODKp+dtG2V0i
 wbhc8fBQGU27ebLES71GqK88GvqURX5O1PucsPtoeEtx9D46L8+gRvUJjqIOP7k14alcd0cL
 t3jkcTfu1nxpZNRv0lY1Qqe695JmnQuZlRrjjg7pkr/smtEiHeNPuREE2Tz4/daN5q+RVKcp
 nUCkMX2xLlQUc3SxHzQHb1UR+vBCxO53Nr02wAHInXc3271py7LkX54vFmS23uFwu5bIGS0M
 Sc/SCta5YNJPWvCUEOES9nZNije9oC5TY6NfqmNNrJmO8EtHCfarHAGTRPBhAjFzRlz+ZzTz
 L/GKK5A+15BUv85pNd3Ls9AuYIWKtcWmz+CG8Cjl07/uVdcDVbMIYo43JK1RrhRxMu5TM/9q
 r6z7uOGlEdSVvPQeC7S/dJBJFwGNyFjV5v3t9ZWZqiIJQ8/QDMtDPrYwLUAfY15nvsKyreUr
 y/lAkIImkDigXDnKBmRbiwxYr3YQpsi/2kwOjYhPAj01iF7M5qv9qoWa7A+YaIjqL541fdxQ
 vRcI5eAD/1DRy7p4TMYaZWh/oVueA7y3VCFPja/YSh5dJllHlSb9tjhdwrp1S8PEivo6pdu/
 +z+jlvWGMNRSR5jAcDabOOU42mw5XVNyvhvW0boI8VIfBm++oZdNCGs3OQ8JNsBKEufy2LCh
 RqWGxoRucLEv5QxrIvSnamBooqkT7l+E05dEzWJ5Lq6L3CHrG+qwIsGW+eUZzHNEmjz/fz6N
 +lSyvj9NtwBnUpL7NUgQ+o6k/pm6ou9vaJewyRlAG7PPgaiBb5XK3Wb2dVC6/9WzbhDtArqA
 k+C97G241lS1B8JxLLJGDcYUw==
IronPort-HdrOrdr: A9a23:2JFdqKOAtl1h+8BcTsWjsMiBIKoaSvp037Eqv3oRdfU1SL3hqy
 nApoV56faZslkssTQb6LS90cq7MArhHPxOkOss1N6ZNWGM0gbFEGgh1/qE/9SJIVyZygc378
 ddmsZFZuEYdWIK6PrH3A==
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="66374919"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 58/70] x86/stack: CFI hardening
Date: Mon, 14 Feb 2022 12:51:15 +0000
Message-ID: <20220214125127.17985-59-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220214125127.17985-1-andrew.cooper3@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Control Flow Integrity schemes use toolchain and optionally hardware support
to help protect against call/jump/return oriented programming attacks.

Use cf_check to annotate function pointer targets for the toolchain.

The function typecheck in switch_stack_and_jump() is incompatible with control
flow typechecking.  It's ok for reset_stack_and_jump_ind(), but for
reset_stack_and_jump(), it would force us to ENDBR64 the targets which are
branched to directly.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---

v2:
 * Extend reset_stack_and_jump_ind() with ({ })
---
 xen/arch/x86/domain.c                  | 6 +++---
 xen/arch/x86/hvm/svm/svm.c             | 6 +++---
 xen/arch/x86/hvm/vmx/vmcs.c            | 2 +-
 xen/arch/x86/hvm/vmx/vmx.c             | 8 ++++----
 xen/arch/x86/include/asm/current.h     | 6 ++++--
 xen/arch/x86/include/asm/hvm/vmx/vmx.h | 2 +-
 xen/arch/x86/include/asm/pv/domain.h   | 4 ++--
 xen/arch/x86/pv/domain.c               | 2 +-
 xen/arch/x86/x86_64/entry.S            | 1 +
 9 files changed, 20 insertions(+), 17 deletions(-)

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
index dedb2848e6a1..63535a74b504 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -944,7 +944,7 @@ static inline void svm_tsc_ratio_load(struct vcpu *v)
         wrmsrl(MSR_AMD64_TSC_RATIO, hvm_tsc_scaling_ratio(v->domain));
 }
 
-static void svm_ctxt_switch_from(struct vcpu *v)
+static void cf_check svm_ctxt_switch_from(struct vcpu *v)
 {
     int cpu = smp_processor_id();
 
@@ -969,7 +969,7 @@ static void svm_ctxt_switch_from(struct vcpu *v)
     enable_each_ist(idt_tables[cpu]);
 }
 
-static void svm_ctxt_switch_to(struct vcpu *v)
+static void cf_check svm_ctxt_switch_to(struct vcpu *v)
 {
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
     int cpu = smp_processor_id();
@@ -996,7 +996,7 @@ static void svm_ctxt_switch_to(struct vcpu *v)
         wrmsr_tsc_aux(v->arch.msrs->tsc_aux);
 }
 
-static void noreturn svm_do_resume(void)
+static void noreturn cf_check svm_do_resume(void)
 {
     struct vcpu *v = current;
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index 60b506ac3f40..e1e1fa14e65e 100644
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
index 2c4804f9b884..41db538a9e3d 100644
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
@@ -907,7 +907,7 @@ static void cf_check vmx_fpu_leave(struct vcpu *v)
     }
 }
 
-static void vmx_ctxt_switch_from(struct vcpu *v)
+static void cf_check vmx_ctxt_switch_from(struct vcpu *v)
 {
     /*
      * Return early if trying to do a context switch without VMX enabled,
@@ -939,7 +939,7 @@ static void vmx_ctxt_switch_from(struct vcpu *v)
         vmx_pi_switch_from(v);
 }
 
-static void vmx_ctxt_switch_to(struct vcpu *v)
+static void cf_check vmx_ctxt_switch_to(struct vcpu *v)
 {
     vmx_restore_guest_msrs(v);
     vmx_restore_dr(v);
diff --git a/xen/arch/x86/include/asm/current.h b/xen/arch/x86/include/asm/current.h
index dc0edd9ed07d..da5e152a10cc 100644
--- a/xen/arch/x86/include/asm/current.h
+++ b/xen/arch/x86/include/asm/current.h
@@ -173,7 +173,6 @@ unsigned long get_stack_dump_bottom (unsigned long sp);
 #define switch_stack_and_jump(fn, instr, constr)                        \
     ({                                                                  \
         unsigned int tmp;                                               \
-        (void)((fn) == (void (*)(void))NULL);                           \
         BUILD_BUG_ON(!ssaj_has_attr_noreturn(fn));                      \
         __asm__ __volatile__ (                                          \
             SHADOW_STACK_WORK                                           \
@@ -198,7 +197,10 @@ unsigned long get_stack_dump_bottom (unsigned long sp);
 
 /* The constraint may only specify non-call-clobbered registers. */
 #define reset_stack_and_jump_ind(fn)                                    \
-    switch_stack_and_jump(fn, "INDIRECT_JMP %", "b")
+    ({                                                                  \
+        (void)((fn) == (void (*)(void))NULL);                           \
+        switch_stack_and_jump(fn, "INDIRECT_JMP %", "b");               \
+    })
 
 /*
  * Which VCPU's state is currently running on each CPU?
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
index 5284fe931f62..c2ebdd6864a5 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -93,7 +93,7 @@ typedef enum {
 
 void vmx_asm_vmexit_handler(struct cpu_user_regs);
 void vmx_intr_assist(void);
-void noreturn vmx_do_resume(void);
+void noreturn cf_check vmx_do_resume(void);
 void vmx_vlapic_msr_changed(struct vcpu *v);
 struct hvm_emulate_ctxt;
 void vmx_realmode_emulate_one(struct hvm_emulate_ctxt *hvmemul_ctxt);
diff --git a/xen/arch/x86/include/asm/pv/domain.h b/xen/arch/x86/include/asm/pv/domain.h
index 6b16da9d187b..924508bbb4f0 100644
--- a/xen/arch/x86/include/asm/pv/domain.h
+++ b/xen/arch/x86/include/asm/pv/domain.h
@@ -118,8 +118,8 @@ static inline void pv_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
 
 #endif	/* CONFIG_PV */
 
-void paravirt_ctxt_switch_from(struct vcpu *v);
-void paravirt_ctxt_switch_to(struct vcpu *v);
+void cf_check paravirt_ctxt_switch_from(struct vcpu *v);
+void cf_check paravirt_ctxt_switch_to(struct vcpu *v);
 
 #endif	/* __X86_PV_DOMAIN_H__ */
 
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
-- 
2.11.0


