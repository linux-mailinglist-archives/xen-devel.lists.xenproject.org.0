Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3DC69B286
	for <lists+xen-devel@lfdr.de>; Fri, 17 Feb 2023 19:48:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.497258.768202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pT5mj-00069P-Ou; Fri, 17 Feb 2023 18:48:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 497258.768202; Fri, 17 Feb 2023 18:48:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pT5mj-00065U-J6; Fri, 17 Feb 2023 18:48:41 +0000
Received: by outflank-mailman (input) for mailman id 497258;
 Fri, 17 Feb 2023 18:48:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DzBr=6N=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pT5mh-0005Js-T1
 for xen-devel@lists.xenproject.org; Fri, 17 Feb 2023 18:48:40 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b0528209-aef3-11ed-93b5-47a8fe42b414;
 Fri, 17 Feb 2023 19:48:37 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id g29so2886341eda.5
 for <xen-devel@lists.xenproject.org>; Fri, 17 Feb 2023 10:48:37 -0800 (PST)
Received: from uni.router.wind (adsl-65.109.242.225.tellas.gr.
 [109.242.225.65]) by smtp.googlemail.com with ESMTPSA id
 z61-20020a509e43000000b004ad03b18ae3sm2641585ede.62.2023.02.17.10.48.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 10:48:36 -0800 (PST)
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
X-Inumbo-ID: b0528209-aef3-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vmN2USvrN1K54LlFANjHxHXDe4FU6hMjam29RFhTkrI=;
        b=Q4rE8RNmecwb1UKXu4brc0nEgQHPSEBhwgpYJ63H3TBgZB05WtEY8djILUkcLh3F4j
         hYftS8WIaID35dgLYvmLS/XSvj7qEOlGgk7hWKLRP6++cTHfwMF+CKdiQjPXrAI+RlYo
         KvCuO6VYtOCdlgxmkZU7y0VyGq0oWVkz40T9Iv1Ne87eqZGZZ+zxlkHvDBL8wmr2kjmB
         sEdwNA9AjutDr9uo3SaKpRpmP1g4inK9DynBYs08DJV+d8o5OaEinvQk8Wu+m50Lzi4f
         PBGjk8mJTC1nNmpWJT9uzvWbL1WG+dxCUk1vY+c+g90NFT/WWadjPV6gneWpdcCWFj6P
         S5Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vmN2USvrN1K54LlFANjHxHXDe4FU6hMjam29RFhTkrI=;
        b=NUCPdHx+lFwZWxoPEYiNBYxrOM1/ipGXHINxjg4gGren/JFmteNfGw6696QQ5SKHzx
         GKSKnA5PXAtk54ygHsCQ8qZufMXgGhulCQfRv7YzViFbkaFqwKBJCE3ZPqfB76t7/s0L
         HZBYcBRdoKOafcoP504gskDQ7TeM1GeQd6X09fwJcH1EcJlKuAjdqIzxF81LzPPHCjOF
         AZE5CGl+E1mZnsDVHqmnRVvCU/6yjkVTRK1Vdbi/FPGJa7W6A2a1PItt4hTeOAvlf60H
         vr30xcbwhOX8zheWSPFm1DZfz0FCNNHDWLCd5DQziOoJQq5PRwPnRWxoYYoqZk34gcVI
         NmPg==
X-Gm-Message-State: AO0yUKV0V3Yuv/4qws+DjI0XDWh5ZsvsWfhkk1E5Fp5iA7KA1nQSsIUt
	BReYysAsBk6/kiNh2l6dZPgV71C2YKA=
X-Google-Smtp-Source: AK7set+c6uRy9FDIC/+PTu5e6DqjDc15EfYzl1hvke7wcPEhaTIGnGlg+IoN6Q6cu24gtvLJBzR8MA==
X-Received: by 2002:aa7:d513:0:b0:4aa:a9c7:4224 with SMTP id y19-20020aa7d513000000b004aaa9c74224mr2082197edq.30.1676659717028;
        Fri, 17 Feb 2023 10:48:37 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 4/4] x86/vmx: cleanup vmx.h
Date: Fri, 17 Feb 2023 20:48:14 +0200
Message-Id: <20230217184814.1243046-5-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230217184814.1243046-1-burzalodowa@gmail.com>
References: <20230217184814.1243046-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Do not include the headers:
  asm/i387.h
  asm/hvm/trace.h
  asm/processor.h
  asm/regs.h
because none of the declarations and macro definitions in them is used in
this file. Sort alphabetically the rest of the headers.
Fix build by including asm/i387.h in vmx.c, needed for vcpu_restore_fpu_lazy().

Move the definition of GAS_VMX_OP just above the functions that use it and
undefine it after its usage.

Move in vmcs.c the definitions of:
  ept_sync_all()
  __vmxoff()
  __vmxon()
because they are used only in this file. Take the opportunity to remove a
trailing white space.

Move in vmx.c the definitions of:
  pi_test_and_set_pir()
  pi_test_pir()
  pi_test_and_set_on()
  pi_set_on()
  pi_test_and_clear_on()
  pi_test_on()
  pi_get_pir()
  pi_test_sn()
  pi_set_sn()
  pi_clear_sn()
  vpid_sync_vcpu_gva()
because they are used only in this file.

Move in vmx.c the declarations of:
  ve_info_t
  ept_qual_t
  idt_or_gdt_instr_info_t
  ldt_or_tr_instr_info_t
because they are used only in this file.

No functional change intended.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
 xen/arch/x86/hvm/vmx/vmcs.c            |  31 ++++
 xen/arch/x86/hvm/vmx/vmx.c             | 141 ++++++++++++++++++
 xen/arch/x86/include/asm/hvm/vmx/vmx.h | 193 ++-----------------------
 3 files changed, 182 insertions(+), 183 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index c46bb55f05..a4de21d5dc 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -691,6 +691,37 @@ void cf_check vmx_cpu_dead(unsigned int cpu)
     vmx_pi_desc_fixup(cpu);
 }
 
+static inline void __vmxoff(void)
+{
+    asm volatile (
+        VMXOFF_OPCODE
+        : : : "memory" );
+}
+
+static inline int __vmxon(u64 addr)
+{
+    int rc;
+
+    asm volatile (
+        "1: " VMXON_OPCODE MODRM_EAX_06 "\n"
+        "   setna %b0 ; neg %0\n" /* CF==1 or ZF==1 --> rc = -1 */
+        "2:\n"
+        ".section .fixup,\"ax\"\n"
+        "3: sub $2,%0 ; jmp 2b\n"    /* #UD or #GP --> rc = -2 */
+        ".previous\n"
+        _ASM_EXTABLE(1b, 3b)
+        : "=q" (rc)
+        : "0" (0), "a" (&addr)
+        : "memory");
+
+    return rc;
+}
+
+static inline void ept_sync_all(void)
+{
+    __invept(INVEPT_ALL_CONTEXT, 0);
+}
+
 static int _vmx_cpu_up(bool bsp)
 {
     u32 eax, edx;
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index d02ad01b9b..4eade64fd6 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -43,6 +43,7 @@
 #include <asm/hvm/vmx/vmcs.h>
 #include <asm/hvm/vmx/vmx.h>
 #include <asm/iocap.h>
+#include <asm/i387.h>
 #include <asm/monitor.h>
 #include <asm/msr.h>
 #include <asm/processor.h>
@@ -245,6 +246,58 @@ struct vmx_pi_blocking_vcpu {
  */
 static DEFINE_PER_CPU(struct vmx_pi_blocking_vcpu, vmx_pi_blocking);
 
+#define POSTED_INTR_ON  0
+#define POSTED_INTR_SN  1
+static inline int pi_test_and_set_pir(uint8_t vector, struct pi_desc *pi_desc)
+{
+    return test_and_set_bit(vector, pi_desc->pir);
+}
+
+static inline int pi_test_pir(uint8_t vector, const struct pi_desc *pi_desc)
+{
+    return test_bit(vector, pi_desc->pir);
+}
+
+static inline int pi_test_and_set_on(struct pi_desc *pi_desc)
+{
+    return test_and_set_bit(POSTED_INTR_ON, &pi_desc->control);
+}
+
+static inline void pi_set_on(struct pi_desc *pi_desc)
+{
+    set_bit(POSTED_INTR_ON, &pi_desc->control);
+}
+
+static inline int pi_test_and_clear_on(struct pi_desc *pi_desc)
+{
+    return test_and_clear_bit(POSTED_INTR_ON, &pi_desc->control);
+}
+
+static inline int pi_test_on(struct pi_desc *pi_desc)
+{
+    return pi_desc->on;
+}
+
+static inline unsigned long pi_get_pir(struct pi_desc *pi_desc, int group)
+{
+    return xchg(&pi_desc->pir[group], 0);
+}
+
+static inline int pi_test_sn(struct pi_desc *pi_desc)
+{
+    return pi_desc->sn;
+}
+
+static inline void pi_set_sn(struct pi_desc *pi_desc)
+{
+    set_bit(POSTED_INTR_SN, &pi_desc->control);
+}
+
+static inline void pi_clear_sn(struct pi_desc *pi_desc)
+{
+    clear_bit(POSTED_INTR_SN, &pi_desc->control);
+}
+
 static void vmx_pi_switch_from(struct vcpu *v)
 {
     struct pi_desc *pi_desc = &v->arch.hvm.vmx.pi_desc;
@@ -1329,6 +1382,30 @@ gp_fault:
     return X86EMUL_EXCEPTION;
 }
 
+static inline void vpid_sync_vcpu_gva(struct vcpu *v, unsigned long gva)
+{
+    int type = INVVPID_INDIVIDUAL_ADDR;
+
+    /*
+     * If individual address invalidation is not supported, we escalate to
+     * use single context invalidation.
+     */
+    if ( likely(cpu_has_vmx_vpid_invvpid_individual_addr) )
+        goto execute_invvpid;
+
+    type = INVVPID_SINGLE_CONTEXT;
+
+    /*
+     * If single context invalidation is not supported, we escalate to
+     * use all context invalidation.
+     */
+    if ( !cpu_has_vmx_vpid_invvpid_single_context )
+        type = INVVPID_ALL_CONTEXT;
+
+execute_invvpid:
+    __invvpid(type, v->arch.hvm.n1asid.asid, (u64)gva);
+}
+
 static void cf_check vmx_invlpg(struct vcpu *v, unsigned long linear)
 {
     if ( cpu_has_vmx_vpid )
@@ -2941,6 +3018,16 @@ static int cf_check vmx_vcpu_emulate_vmfunc(const struct cpu_user_regs *regs)
     return rc;
 }
 
+/* #VE information page */
+typedef struct {
+    u32 exit_reason;
+    u32 semaphore;
+    u64 exit_qualification;
+    u64 gla;
+    u64 gpa;
+    u16 eptp_index;
+} ve_info_t;
+
 static bool cf_check vmx_vcpu_emulate_ve(struct vcpu *v)
 {
     const struct page_info *pg = vcpu_altp2m(v).veinfo_pg;
@@ -3700,6 +3787,18 @@ static void vmx_do_extint(struct cpu_user_regs *regs)
     do_IRQ(regs);
 }
 
+/* EPT violation qualifications definitions */
+typedef union ept_qual {
+    unsigned long raw;
+    struct {
+        bool read:1, write:1, fetch:1,
+            eff_read:1, eff_write:1, eff_exec:1, /* eff_user_exec */:1,
+            gla_valid:1,
+            gla_fault:1; /* Valid iff gla_valid. */
+        unsigned long /* pad */:55;
+    };
+} __transparent__ ept_qual_t;
+
 static void ept_handle_violation(ept_qual_t q, paddr_t gpa)
 {
     unsigned long gla, gfn = gpa >> PAGE_SHIFT;
@@ -3956,6 +4055,48 @@ static void vmx_handle_xrstors(void)
     domain_crash(current->domain);
 }
 
+/* VM-Exit instruction info for LIDT, LGDT, SIDT, SGDT */
+typedef union idt_or_gdt_instr_info {
+    unsigned long raw;
+    struct {
+        unsigned long scaling   :2,  /* bits 0:1 - Scaling */
+                                :5,  /* bits 6:2 - Undefined */
+        addr_size               :3,  /* bits 9:7 - Address size */
+                                :1,  /* bit 10 - Cleared to 0 */
+        operand_size            :1,  /* bit 11 - Operand size */
+                                :3,  /* bits 14:12 - Undefined */
+        segment_reg             :3,  /* bits 17:15 - Segment register */
+        index_reg               :4,  /* bits 21:18 - Index register */
+        index_reg_invalid       :1,  /* bit 22 - Index register invalid */
+        base_reg                :4,  /* bits 26:23 - Base register */
+        base_reg_invalid        :1,  /* bit 27 - Base register invalid */
+        instr_identity          :1,  /* bit 28 - 0:GDT, 1:IDT */
+        instr_write             :1,  /* bit 29 - 0:store, 1:load */
+                                :34; /* bits 30:63 - Undefined */
+    };
+} idt_or_gdt_instr_info_t;
+
+/* VM-Exit instruction info for LLDT, LTR, SLDT, STR */
+typedef union ldt_or_tr_instr_info {
+    unsigned long raw;
+    struct {
+        unsigned long scaling   :2,  /* bits 0:1 - Scaling */
+                                :1,  /* bit 2 - Undefined */
+        reg1                    :4,  /* bits 6:3 - Reg1 */
+        addr_size               :3,  /* bits 9:7 - Address size */
+        mem_reg                 :1,  /* bit 10 - Mem/Reg */
+                                :4,  /* bits 14:11 - Undefined */
+        segment_reg             :3,  /* bits 17:15 - Segment register */
+        index_reg               :4,  /* bits 21:18 - Index register */
+        index_reg_invalid       :1,  /* bit 22 - Index register invalid */
+        base_reg                :4,  /* bits 26:23 - Base register */
+        base_reg_invalid        :1,  /* bit 27 - Base register invalid */
+        instr_identity          :1,  /* bit 28 - 0:LDT, 1:TR */
+        instr_write             :1,  /* bit 29 - 0:store, 1:load */
+                                :34; /* bits 31:63 - Undefined */
+    };
+} ldt_or_tr_instr_info_t;
+
 static void vmx_handle_descriptor_access(uint32_t exit_reason)
 {
     uint64_t instr_info;
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
index 5c748d5b09..2520be0824 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -19,14 +19,10 @@
 #define __ASM_X86_HVM_VMX_VMX_H__
 
 #include <xen/sched.h>
-#include <asm/types.h>
-#include <asm/regs.h>
 #include <asm/asm_defns.h>
-#include <asm/processor.h>
-#include <asm/p2m.h>
-#include <asm/i387.h>
-#include <asm/hvm/trace.h>
 #include <asm/hvm/vmx/vmcs.h>
+#include <asm/p2m.h>
+#include <asm/types.h>
 
 extern int8_t opt_ept_exec_sp;
 
@@ -93,58 +89,6 @@ void vmx_update_exception_bitmap(struct vcpu *v);
 void vmx_update_cpu_exec_control(struct vcpu *v);
 void vmx_update_secondary_exec_control(struct vcpu *v);
 
-#define POSTED_INTR_ON  0
-#define POSTED_INTR_SN  1
-static inline int pi_test_and_set_pir(uint8_t vector, struct pi_desc *pi_desc)
-{
-    return test_and_set_bit(vector, pi_desc->pir);
-}
-
-static inline int pi_test_pir(uint8_t vector, const struct pi_desc *pi_desc)
-{
-    return test_bit(vector, pi_desc->pir);
-}
-
-static inline int pi_test_and_set_on(struct pi_desc *pi_desc)
-{
-    return test_and_set_bit(POSTED_INTR_ON, &pi_desc->control);
-}
-
-static inline void pi_set_on(struct pi_desc *pi_desc)
-{
-    set_bit(POSTED_INTR_ON, &pi_desc->control);
-}
-
-static inline int pi_test_and_clear_on(struct pi_desc *pi_desc)
-{
-    return test_and_clear_bit(POSTED_INTR_ON, &pi_desc->control);
-}
-
-static inline int pi_test_on(struct pi_desc *pi_desc)
-{
-    return pi_desc->on;
-}
-
-static inline unsigned long pi_get_pir(struct pi_desc *pi_desc, int group)
-{
-    return xchg(&pi_desc->pir[group], 0);
-}
-
-static inline int pi_test_sn(struct pi_desc *pi_desc)
-{
-    return pi_desc->sn;
-}
-
-static inline void pi_set_sn(struct pi_desc *pi_desc)
-{
-    set_bit(POSTED_INTR_SN, &pi_desc->control);
-}
-
-static inline void pi_clear_sn(struct pi_desc *pi_desc)
-{
-    clear_bit(POSTED_INTR_SN, &pi_desc->control);
-}
-
 /*
  * Exit Reasons
  */
@@ -321,12 +265,6 @@ extern uint8_t posted_intr_vector;
 #define INVVPID_ALL_CONTEXT                     2
 #define INVVPID_SINGLE_CONTEXT_RETAINING_GLOBAL 3
 
-#ifdef HAVE_AS_VMX
-# define GAS_VMX_OP(yes, no) yes
-#else
-# define GAS_VMX_OP(yes, no) no
-#endif
-
 static always_inline void __vmptrld(u64 addr)
 {
     asm volatile (
@@ -416,6 +354,12 @@ static always_inline void __vmwrite(unsigned long field, unsigned long value)
         );
 }
 
+#ifdef HAVE_AS_VMX
+# define GAS_VMX_OP(yes, no) yes
+#else
+# define GAS_VMX_OP(yes, no) no
+#endif
+
 static inline enum vmx_insn_errno vmread_safe(unsigned long field,
                                               unsigned long *value)
 {
@@ -462,6 +406,8 @@ static inline enum vmx_insn_errno vmwrite_safe(unsigned long field,
     return ret;
 }
 
+#undef GAS_VMX_OP
+
 static always_inline void __invept(unsigned long type, uint64_t eptp)
 {
     struct {
@@ -527,68 +473,13 @@ static always_inline void __invvpid(unsigned long type, u16 vpid, u64 gva)
                    : "memory" );
 }
 
-static inline void ept_sync_all(void)
-{
-    __invept(INVEPT_ALL_CONTEXT, 0);
-}
-
 void ept_sync_domain(struct p2m_domain *p2m);
 
-static inline void vpid_sync_vcpu_gva(struct vcpu *v, unsigned long gva)
-{
-    int type = INVVPID_INDIVIDUAL_ADDR;
-
-    /*
-     * If individual address invalidation is not supported, we escalate to
-     * use single context invalidation.
-     */
-    if ( likely(cpu_has_vmx_vpid_invvpid_individual_addr) )
-        goto execute_invvpid;
-
-    type = INVVPID_SINGLE_CONTEXT;
-
-    /*
-     * If single context invalidation is not supported, we escalate to
-     * use all context invalidation.
-     */
-    if ( !cpu_has_vmx_vpid_invvpid_single_context )
-        type = INVVPID_ALL_CONTEXT;
-
-execute_invvpid:
-    __invvpid(type, v->arch.hvm.n1asid.asid, (u64)gva);
-}
-
 static inline void vpid_sync_all(void)
 {
     __invvpid(INVVPID_ALL_CONTEXT, 0, 0);
 }
 
-static inline void __vmxoff(void)
-{
-    asm volatile (
-        VMXOFF_OPCODE
-        : : : "memory" );
-}
-
-static inline int __vmxon(u64 addr)
-{
-    int rc;
-
-    asm volatile ( 
-        "1: " VMXON_OPCODE MODRM_EAX_06 "\n"
-        "   setna %b0 ; neg %0\n" /* CF==1 or ZF==1 --> rc = -1 */
-        "2:\n"
-        ".section .fixup,\"ax\"\n"
-        "3: sub $2,%0 ; jmp 2b\n"    /* #UD or #GP --> rc = -2 */
-        ".previous\n"
-        _ASM_EXTABLE(1b, 3b)
-        : "=q" (rc)
-        : "0" (0), "a" (&addr)
-        : "memory");
-
-    return rc;
-}
-
 int cf_check vmx_guest_x86_mode(struct vcpu *v);
 unsigned int vmx_get_cpl(void);
 
@@ -620,71 +511,7 @@ static inline void vmx_pi_hooks_deassign(struct domain *d) {}
 
 #define APIC_INVALID_DEST           0xffffffff
 
-/* EPT violation qualifications definitions */
-typedef union ept_qual {
-    unsigned long raw;
-    struct {
-        bool read:1, write:1, fetch:1,
-            eff_read:1, eff_write:1, eff_exec:1, /* eff_user_exec */:1,
-            gla_valid:1,
-            gla_fault:1; /* Valid iff gla_valid. */
-        unsigned long /* pad */:55;
-    };
-} __transparent__ ept_qual_t;
-
 #define EPT_L4_PAGETABLE_SHIFT      39
 #define EPT_PAGETABLE_ENTRIES       512
 
-/* #VE information page */
-typedef struct {
-    u32 exit_reason;
-    u32 semaphore;
-    u64 exit_qualification;
-    u64 gla;
-    u64 gpa;
-    u16 eptp_index;
-} ve_info_t;
-
-/* VM-Exit instruction info for LIDT, LGDT, SIDT, SGDT */
-typedef union idt_or_gdt_instr_info {
-    unsigned long raw;
-    struct {
-        unsigned long scaling   :2,  /* bits 0:1 - Scaling */
-                                :5,  /* bits 6:2 - Undefined */
-        addr_size               :3,  /* bits 9:7 - Address size */
-                                :1,  /* bit 10 - Cleared to 0 */
-        operand_size            :1,  /* bit 11 - Operand size */
-                                :3,  /* bits 14:12 - Undefined */
-        segment_reg             :3,  /* bits 17:15 - Segment register */
-        index_reg               :4,  /* bits 21:18 - Index register */
-        index_reg_invalid       :1,  /* bit 22 - Index register invalid */
-        base_reg                :4,  /* bits 26:23 - Base register */
-        base_reg_invalid        :1,  /* bit 27 - Base register invalid */
-        instr_identity          :1,  /* bit 28 - 0:GDT, 1:IDT */
-        instr_write             :1,  /* bit 29 - 0:store, 1:load */
-                                :34; /* bits 30:63 - Undefined */
-    };
-} idt_or_gdt_instr_info_t;
-
-/* VM-Exit instruction info for LLDT, LTR, SLDT, STR */
-typedef union ldt_or_tr_instr_info {
-    unsigned long raw;
-    struct {
-        unsigned long scaling   :2,  /* bits 0:1 - Scaling */
-                                :1,  /* bit 2 - Undefined */
-        reg1                    :4,  /* bits 6:3 - Reg1 */
-        addr_size               :3,  /* bits 9:7 - Address size */
-        mem_reg                 :1,  /* bit 10 - Mem/Reg */
-                                :4,  /* bits 14:11 - Undefined */
-        segment_reg             :3,  /* bits 17:15 - Segment register */
-        index_reg               :4,  /* bits 21:18 - Index register */
-        index_reg_invalid       :1,  /* bit 22 - Index register invalid */
-        base_reg                :4,  /* bits 26:23 - Base register */
-        base_reg_invalid        :1,  /* bit 27 - Base register invalid */
-        instr_identity          :1,  /* bit 28 - 0:LDT, 1:TR */
-        instr_write             :1,  /* bit 29 - 0:store, 1:load */
-                                :34; /* bits 31:63 - Undefined */
-    };
-} ldt_or_tr_instr_info_t;
-
 #endif /* __ASM_X86_HVM_VMX_VMX_H__ */
-- 
2.37.2


