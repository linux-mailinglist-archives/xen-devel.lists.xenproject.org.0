Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2F869F3D3
	for <lists+xen-devel@lfdr.de>; Wed, 22 Feb 2023 13:01:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499402.770580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUnnh-00021y-VJ; Wed, 22 Feb 2023 12:00:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499402.770580; Wed, 22 Feb 2023 12:00:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUnnh-0001xh-Qa; Wed, 22 Feb 2023 12:00:45 +0000
Received: by outflank-mailman (input) for mailman id 499402;
 Wed, 22 Feb 2023 12:00:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Q6c=6S=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pUnnf-0000FF-MZ
 for xen-devel@lists.xenproject.org; Wed, 22 Feb 2023 12:00:44 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87acfda0-b2a8-11ed-a089-e9535cc0f9c3;
 Wed, 22 Feb 2023 13:00:41 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id cq23so29076041edb.1
 for <xen-devel@lists.xenproject.org>; Wed, 22 Feb 2023 04:00:41 -0800 (PST)
Received: from uni.router.wind (adsl-161.109.242.137.tellas.gr.
 [109.242.137.161]) by smtp.googlemail.com with ESMTPSA id
 br4-20020a170906d14400b008de729c8a03sm2133171ejb.38.2023.02.22.04.00.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 04:00:40 -0800 (PST)
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
X-Inumbo-ID: 87acfda0-b2a8-11ed-a089-e9535cc0f9c3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xp171KZwAsQPheQj1isQUJOpmjl0rnTHo3TSkhKp2Vw=;
        b=V2rIPUjwGNvwRg78f+GhjCgSIj10KrPxE4n4XoWeMss3nzcqv9ZS1YggLYJXMo2eMI
         Ax5FYfdARKZTNMSSAhWDNAwG8Cwejtw48khVC7jBJqutZlXzbJWK4m9cCfK5Tt/tpUNR
         YDhtlHpyyAXfMsnoO+NbtY3DK0n7eExbzB9jROhjrP2w+mKnRcuttZRDsgSVvZQGwwX9
         26WJMUUSvyYemYhC12/OgIiHRfQz+5OuidW1cP9GfASOJEt0T54SINYG8x4mtuRFbx+t
         WlG2tnzP9WxGvpkmbfo4jJrFtEcCXOPXVV5DGBvi2PO8s7AIMU0oruur7db5TgKgObDQ
         RXSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xp171KZwAsQPheQj1isQUJOpmjl0rnTHo3TSkhKp2Vw=;
        b=UJg5s55k5oP5jIOO6QFjvDXjK2DTJ6xWEH0zaz/sAX47PoEcTr2pajt2h56t7EOvoX
         Q7nOxQX1J8/zaemiMbwLBSbsZ9PagsM8BOH3DPkV76RMNuy6uZ4wg6+KqM8krlhy+/rO
         2cDMDDvOccu5oNQaowAiDKLSH+q6xxqUWNVSZM9kQLinyxUXJNyK+AGdlxZYOCg6uBam
         CQ8TcvumWZdCrFDB90qxBukeZq8+UzFmneBhIrkinDc8X95xjSJhmRchV7K3D+40KsLe
         D8hMiBqTmpQdpKFQUiSn4H1xppEVPlhGXDMDRHs1ahP7BQv/MgVrPfszE/OkbaY47raX
         hzbQ==
X-Gm-Message-State: AO0yUKV3e7/FznEgqYTWt41orrTIQ3GTXWiJnkm9+OaMudatxLS5uQoB
	aIAIUzXZYRSpyOBDFskRZCLP1DPAHD0=
X-Google-Smtp-Source: AK7set+XvXtK8ytTooDGm52VZHOAV0d8NoMNS9SxIK5Oon99fXTKbbunblABqPQgOWrdOs1hZ8J16w==
X-Received: by 2002:a17:907:7f0d:b0:87b:d2b3:67ca with SMTP id qf13-20020a1709077f0d00b0087bd2b367camr18847740ejc.75.1677067241085;
        Wed, 22 Feb 2023 04:00:41 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 6/9] x86/vmx: move declations used only by vmx code from vmx.h to private header
Date: Wed, 22 Feb 2023 14:00:20 +0200
Message-Id: <20230222120023.3004624-7-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230222120023.3004624-1-burzalodowa@gmail.com>
References: <20230222120023.3004624-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Create a new private header in arch/x86/hvm/vmx/ called vmx.h and move there
all definitions and declarations that are used solely by vmx code.

EPT related declarations and definitions stay in asm/hvm/vmx/vmx.h because
they are used in arch/x86/mm and drivers/passthrough/vtd.

Also, __vmread(), used in arch/x86/cpu, and consequently the opcodes stay in
asm/hvm/vmx/vmx.h.

Take the opportunity to remove a trailing white space from __vmxon().

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---

Changes in v2:
  - new patch, creation of private header for holding declarations and
    definitions consumed only by vmx code, suggested by Andrew and Jan

I have not added #ifndef guards as it is a private and it should not be
included by other headers. However, this is considered a MISRA-C violation
... I 'm not sure what to do.

 xen/arch/x86/hvm/vmx/intr.c            |   2 +
 xen/arch/x86/hvm/vmx/realmode.c        |   2 +
 xen/arch/x86/hvm/vmx/vmcs.c            |   2 +
 xen/arch/x86/hvm/vmx/vmx.c             |   2 +
 xen/arch/x86/hvm/vmx/vmx.h             | 459 ++++++++++++++++++++++++
 xen/arch/x86/hvm/vmx/vvmx.c            |   2 +
 xen/arch/x86/include/asm/hvm/vmx/vmx.h | 463 +------------------------
 7 files changed, 479 insertions(+), 453 deletions(-)
 create mode 100644 xen/arch/x86/hvm/vmx/vmx.h

diff --git a/xen/arch/x86/hvm/vmx/intr.c b/xen/arch/x86/hvm/vmx/intr.c
index 6a8316de0e..c8db501759 100644
--- a/xen/arch/x86/hvm/vmx/intr.c
+++ b/xen/arch/x86/hvm/vmx/intr.c
@@ -38,6 +38,8 @@
 #include <asm/hvm/trace.h>
 #include <asm/vm_event.h>
 
+#include "vmx.h"
+
 /*
  * A few notes on virtual NMI and INTR delivery, and interactions with
  * interruptibility states:
diff --git a/xen/arch/x86/hvm/vmx/realmode.c b/xen/arch/x86/hvm/vmx/realmode.c
index 4ac93e0810..5591660230 100644
--- a/xen/arch/x86/hvm/vmx/realmode.c
+++ b/xen/arch/x86/hvm/vmx/realmode.c
@@ -23,6 +23,8 @@
 #include <asm/hvm/vmx/vmx.h>
 #include <asm/hvm/vmx/vmcs.h>
 
+#include "vmx.h"
+
 static void realmode_deliver_exception(
     unsigned int vector,
     unsigned int insn_len,
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index e1c268789e..bc2acd3063 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -43,6 +43,8 @@
 #include <asm/tboot.h>
 #include <asm/apic.h>
 
+#include "vmx.h"
+
 static bool_t __read_mostly opt_vpid_enabled = 1;
 boolean_param("vpid", opt_vpid_enabled);
 
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index a0297e8c6c..a19ece90fc 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -62,6 +62,8 @@
 #include <asm/prot-key.h>
 #include <public/arch-x86/cpuid.h>
 
+#include "vmx.h"
+
 static bool_t __initdata opt_force_ept;
 boolean_param("force-ept", opt_force_ept);
 
diff --git a/xen/arch/x86/hvm/vmx/vmx.h b/xen/arch/x86/hvm/vmx/vmx.h
new file mode 100644
index 0000000000..ffc19539bc
--- /dev/null
+++ b/xen/arch/x86/hvm/vmx/vmx.h
@@ -0,0 +1,459 @@
+#include <xen/sched.h>
+
+#include <asm/asm_defns.h>
+#include <asm/hvm/vmx/vmcs.h>
+#include <asm/hvm/vmx/vmx.h>
+#include <asm/types.h>
+
+extern int8_t opt_ept_exec_sp;
+
+#define PI_xAPIC_NDST_MASK      0xFF00
+
+void vmx_asm_vmexit_handler(struct cpu_user_regs);
+void vmx_intr_assist(void);
+void noreturn cf_check vmx_do_resume(void);
+void cf_check vmx_vlapic_msr_changed(struct vcpu *v);
+void vmx_realmode(struct cpu_user_regs *regs);
+void vmx_update_debug_state(struct vcpu *v);
+void vmx_update_exception_bitmap(struct vcpu *v);
+void vmx_update_cpu_exec_control(struct vcpu *v);
+void vmx_update_secondary_exec_control(struct vcpu *v);
+
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
+/*
+ * Interruption-information format
+ *
+ * Note INTR_INFO_NMI_UNBLOCKED_BY_IRET is also used with Exit Qualification
+ * field for EPT violations, PML full and SPP-related event vmexits.
+ */
+#define INTR_INFO_VECTOR_MASK           0xff            /* 7:0 */
+#define INTR_INFO_INTR_TYPE_MASK        0x700           /* 10:8 */
+#define INTR_INFO_DELIVER_CODE_MASK     0x800           /* 11 */
+#define INTR_INFO_NMI_UNBLOCKED_BY_IRET 0x1000          /* 12 */
+#define INTR_INFO_VALID_MASK            0x80000000      /* 31 */
+#define INTR_INFO_RESVD_BITS_MASK       0x7ffff000
+
+/*
+ * Exit Qualifications for NOTIFY VM EXIT
+ */
+#define NOTIFY_VM_CONTEXT_INVALID       1u
+
+/*
+ * Exit Qualifications for MOV for Control Register Access
+ */
+enum {
+    VMX_CR_ACCESS_TYPE_MOV_TO_CR,
+    VMX_CR_ACCESS_TYPE_MOV_FROM_CR,
+    VMX_CR_ACCESS_TYPE_CLTS,
+    VMX_CR_ACCESS_TYPE_LMSW,
+};
+typedef union cr_access_qual {
+    unsigned long raw;
+    struct {
+        uint16_t cr:4,
+                 access_type:2,  /* VMX_CR_ACCESS_TYPE_* */
+                 lmsw_op_type:1, /* 0 => reg, 1 => mem   */
+                 :1,
+                 gpr:4,
+                 :4;
+        uint16_t lmsw_data;
+        uint32_t :32;
+    };
+} __transparent__ cr_access_qual_t;
+
+/*
+ * Access Rights
+ */
+#define X86_SEG_AR_SEG_TYPE     0xf        /* 3:0, segment type */
+#define X86_SEG_AR_DESC_TYPE    (1u << 4)  /* 4, descriptor type */
+#define X86_SEG_AR_DPL          0x60       /* 6:5, descriptor privilege level */
+#define X86_SEG_AR_SEG_PRESENT  (1u << 7)  /* 7, segment present */
+#define X86_SEG_AR_AVL          (1u << 12) /* 12, available for system software */
+#define X86_SEG_AR_CS_LM_ACTIVE (1u << 13) /* 13, long mode active (CS only) */
+#define X86_SEG_AR_DEF_OP_SIZE  (1u << 14) /* 14, default operation size */
+#define X86_SEG_AR_GRANULARITY  (1u << 15) /* 15, granularity */
+#define X86_SEG_AR_SEG_UNUSABLE (1u << 16) /* 16, segment unusable */
+
+extern uint8_t posted_intr_vector;
+
+#define INVEPT_SINGLE_CONTEXT   1
+#define INVEPT_ALL_CONTEXT      2
+
+#define INVVPID_INDIVIDUAL_ADDR                 0
+#define INVVPID_SINGLE_CONTEXT                  1
+#define INVVPID_ALL_CONTEXT                     2
+#define INVVPID_SINGLE_CONTEXT_RETAINING_GLOBAL 3
+
+static always_inline void __vmptrld(u64 addr)
+{
+    asm volatile (
+#ifdef HAVE_AS_VMX
+                   "vmptrld %0\n"
+#else
+                   VMPTRLD_OPCODE MODRM_EAX_06
+#endif
+                   /* CF==1 or ZF==1 --> BUG() */
+                   UNLIKELY_START(be, vmptrld)
+                   _ASM_BUGFRAME_TEXT(0)
+                   UNLIKELY_END_SECTION
+                   :
+#ifdef HAVE_AS_VMX
+                   : "m" (addr),
+#else
+                   : "a" (&addr),
+#endif
+                     _ASM_BUGFRAME_INFO(BUGFRAME_bug, __LINE__, __FILE__, 0)
+                   : "memory");
+}
+
+static always_inline void __vmpclear(u64 addr)
+{
+    asm volatile (
+#ifdef HAVE_AS_VMX
+                   "vmclear %0\n"
+#else
+                   VMCLEAR_OPCODE MODRM_EAX_06
+#endif
+                   /* CF==1 or ZF==1 --> BUG() */
+                   UNLIKELY_START(be, vmclear)
+                   _ASM_BUGFRAME_TEXT(0)
+                   UNLIKELY_END_SECTION
+                   :
+#ifdef HAVE_AS_VMX
+                   : "m" (addr),
+#else
+                   : "a" (&addr),
+#endif
+                     _ASM_BUGFRAME_INFO(BUGFRAME_bug, __LINE__, __FILE__, 0)
+                   : "memory");
+}
+
+static always_inline void __vmwrite(unsigned long field, unsigned long value)
+{
+    asm volatile (
+#ifdef HAVE_AS_VMX
+                   "vmwrite %1, %0\n"
+#else
+                   VMWRITE_OPCODE MODRM_EAX_ECX
+#endif
+                   /* CF==1 or ZF==1 --> BUG() */
+                   UNLIKELY_START(be, vmwrite)
+                   _ASM_BUGFRAME_TEXT(0)
+                   UNLIKELY_END_SECTION
+                   :
+#ifdef HAVE_AS_VMX
+                   : "r" (field) , "rm" (value),
+#else
+                   : "a" (field) , "c" (value),
+#endif
+                     _ASM_BUGFRAME_INFO(BUGFRAME_bug, __LINE__, __FILE__, 0)
+        );
+}
+
+
+#ifdef HAVE_AS_VMX
+# define GAS_VMX_OP(yes, no) yes
+#else
+# define GAS_VMX_OP(yes, no) no
+#endif
+
+static inline enum vmx_insn_errno vmread_safe(unsigned long field,
+                                              unsigned long *value)
+{
+    unsigned long ret = VMX_INSN_SUCCEED;
+    bool fail_invalid, fail_valid;
+
+    asm volatile ( GAS_VMX_OP("vmread %[field], %[value]\n\t",
+                              VMREAD_OPCODE MODRM_EAX_ECX)
+                   ASM_FLAG_OUT(, "setc %[invalid]\n\t")
+                   ASM_FLAG_OUT(, "setz %[valid]\n\t")
+                   : ASM_FLAG_OUT("=@ccc", [invalid] "=rm") (fail_invalid),
+                     ASM_FLAG_OUT("=@ccz", [valid] "=rm") (fail_valid),
+                     [value] GAS_VMX_OP("=rm", "=c") (*value)
+                   : [field] GAS_VMX_OP("r", "a") (field));
+
+    if ( unlikely(fail_invalid) )
+        ret = VMX_INSN_FAIL_INVALID;
+    else if ( unlikely(fail_valid) )
+        __vmread(VM_INSTRUCTION_ERROR, &ret);
+
+    return ret;
+}
+
+static inline enum vmx_insn_errno vmwrite_safe(unsigned long field,
+                                               unsigned long value)
+{
+    unsigned long ret = VMX_INSN_SUCCEED;
+    bool fail_invalid, fail_valid;
+
+    asm volatile ( GAS_VMX_OP("vmwrite %[value], %[field]\n\t",
+                              VMWRITE_OPCODE MODRM_EAX_ECX)
+                   ASM_FLAG_OUT(, "setc %[invalid]\n\t")
+                   ASM_FLAG_OUT(, "setz %[valid]\n\t")
+                   : ASM_FLAG_OUT("=@ccc", [invalid] "=rm") (fail_invalid),
+                     ASM_FLAG_OUT("=@ccz", [valid] "=rm") (fail_valid)
+                   : [field] GAS_VMX_OP("r", "a") (field),
+                     [value] GAS_VMX_OP("rm", "c") (value));
+
+    if ( unlikely(fail_invalid) )
+        ret = VMX_INSN_FAIL_INVALID;
+    else if ( unlikely(fail_valid) )
+        __vmread(VM_INSTRUCTION_ERROR, &ret);
+
+    return ret;
+}
+
+#undef GAS_VMX_OP
+
+
+static always_inline void __invept(unsigned long type, uint64_t eptp)
+{
+    struct {
+        uint64_t eptp, rsvd;
+    } operand = { eptp };
+
+    /*
+     * If single context invalidation is not supported, we escalate to
+     * use all context invalidation.
+     */
+    if ( (type == INVEPT_SINGLE_CONTEXT) &&
+         !cpu_has_vmx_ept_invept_single_context )
+        type = INVEPT_ALL_CONTEXT;
+
+    asm volatile (
+#ifdef HAVE_AS_EPT
+                   "invept %0, %1\n"
+#else
+                   INVEPT_OPCODE MODRM_EAX_08
+#endif
+                   /* CF==1 or ZF==1 --> BUG() */
+                   UNLIKELY_START(be, invept)
+                   _ASM_BUGFRAME_TEXT(0)
+                   UNLIKELY_END_SECTION
+                   :
+#ifdef HAVE_AS_EPT
+                   : "m" (operand), "r" (type),
+#else
+                   : "a" (&operand), "c" (type),
+#endif
+                     _ASM_BUGFRAME_INFO(BUGFRAME_bug, __LINE__, __FILE__, 0)
+                   : "memory" );
+}
+
+static always_inline void __invvpid(unsigned long type, u16 vpid, u64 gva)
+{
+    struct __packed {
+        u64 vpid:16;
+        u64 rsvd:48;
+        u64 gva;
+    }  operand = {vpid, 0, gva};
+
+    /* Fix up #UD exceptions which occur when TLBs are flushed before VMXON. */
+    asm volatile ( "1: "
+#ifdef HAVE_AS_EPT
+                   "invvpid %0, %1\n"
+#else
+                   INVVPID_OPCODE MODRM_EAX_08
+#endif
+                   /* CF==1 or ZF==1 --> BUG() */
+                   UNLIKELY_START(be, invvpid)
+                   _ASM_BUGFRAME_TEXT(0)
+                   UNLIKELY_END_SECTION "\n"
+                   "2:"
+                   _ASM_EXTABLE(1b, 2b)
+                   :
+#ifdef HAVE_AS_EPT
+                   : "m" (operand), "r" (type),
+#else
+                   : "a" (&operand), "c" (type),
+#endif
+                     _ASM_BUGFRAME_INFO(BUGFRAME_bug, __LINE__, __FILE__, 0)
+                   : "memory" );
+}
+
+static inline void ept_sync_all(void)
+{
+    __invept(INVEPT_ALL_CONTEXT, 0);
+}
+
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
+static inline void vpid_sync_all(void)
+{
+    __invvpid(INVVPID_ALL_CONTEXT, 0, 0);
+}
+
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
+int cf_check vmx_guest_x86_mode(struct vcpu *v);
+unsigned int vmx_get_cpl(void);
+void vmx_inject_extint(int trap, uint8_t source);
+void vmx_inject_nmi(void);
+
+void update_guest_eip(void);
+
+void vmx_pi_per_cpu_init(unsigned int cpu);
+void vmx_pi_desc_fixup(unsigned int cpu);
+
+void vmx_sync_exit_bitmap(struct vcpu *v);
+
+#define APIC_INVALID_DEST           0xffffffff
+
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
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
index 674cdabb07..0bda8430b9 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -29,6 +29,8 @@
 #include <asm/hvm/vmx/vvmx.h>
 #include <asm/hvm/nestedhvm.h>
 
+#include "vmx.h"
+
 static DEFINE_PER_CPU(u64 *, vvmcs_buf);
 
 static void nvmx_purge_vvmcs(struct vcpu *v);
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
index 1ba2937c23..c81d76e4eb 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -20,13 +20,9 @@
 
 #include <xen/sched.h>
 
-#include <asm/asm_defns.h>
-#include <asm/hvm/vmx/vmcs.h>
 #include <asm/p2m.h>
 #include <asm/types.h>
 
-extern int8_t opt_ept_exec_sp;
-
 typedef union {
     struct {
         u64 r       :   1,  /* bit 0 - Read permission */
@@ -77,71 +73,8 @@ typedef enum {
 #define EPTE_RWX_MASK           0x7
 #define EPTE_FLAG_MASK          0x7f
 
-#define PI_xAPIC_NDST_MASK      0xFF00
-
-void vmx_asm_vmexit_handler(struct cpu_user_regs);
-void vmx_intr_assist(void);
-void noreturn cf_check vmx_do_resume(void);
-void cf_check vmx_vlapic_msr_changed(struct vcpu *v);
 struct hvm_emulate_ctxt;
 void vmx_realmode_emulate_one(struct hvm_emulate_ctxt *hvmemul_ctxt);
-void vmx_realmode(struct cpu_user_regs *regs);
-void vmx_update_debug_state(struct vcpu *v);
-void vmx_update_exception_bitmap(struct vcpu *v);
-void vmx_update_cpu_exec_control(struct vcpu *v);
-void vmx_update_secondary_exec_control(struct vcpu *v);
-
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
 
 /*
  * Exit Reasons
@@ -212,60 +145,6 @@ static inline void pi_clear_sn(struct pi_desc *pi_desc)
 #define EXIT_REASON_NOTIFY              75
 /* Remember to also update VMX_PERF_EXIT_REASON_SIZE! */
 
-/*
- * Interruption-information format
- *
- * Note INTR_INFO_NMI_UNBLOCKED_BY_IRET is also used with Exit Qualification
- * field for EPT violations, PML full and SPP-related event vmexits.
- */
-#define INTR_INFO_VECTOR_MASK           0xff            /* 7:0 */
-#define INTR_INFO_INTR_TYPE_MASK        0x700           /* 10:8 */
-#define INTR_INFO_DELIVER_CODE_MASK     0x800           /* 11 */
-#define INTR_INFO_NMI_UNBLOCKED_BY_IRET 0x1000          /* 12 */
-#define INTR_INFO_VALID_MASK            0x80000000      /* 31 */
-#define INTR_INFO_RESVD_BITS_MASK       0x7ffff000
-
-/*
- * Exit Qualifications for NOTIFY VM EXIT
- */
-#define NOTIFY_VM_CONTEXT_INVALID       1u
-
-/*
- * Exit Qualifications for MOV for Control Register Access
- */
-enum {
-    VMX_CR_ACCESS_TYPE_MOV_TO_CR,
-    VMX_CR_ACCESS_TYPE_MOV_FROM_CR,
-    VMX_CR_ACCESS_TYPE_CLTS,
-    VMX_CR_ACCESS_TYPE_LMSW,
-};
-typedef union cr_access_qual {
-    unsigned long raw;
-    struct {
-        uint16_t cr:4,
-                 access_type:2,  /* VMX_CR_ACCESS_TYPE_* */
-                 lmsw_op_type:1, /* 0 => reg, 1 => mem   */
-                 :1,
-                 gpr:4,
-                 :4;
-        uint16_t lmsw_data;
-        uint32_t :32;
-    };
-} __transparent__ cr_access_qual_t;
-
-/*
- * Access Rights
- */
-#define X86_SEG_AR_SEG_TYPE     0xf        /* 3:0, segment type */
-#define X86_SEG_AR_DESC_TYPE    (1u << 4)  /* 4, descriptor type */
-#define X86_SEG_AR_DPL          0x60       /* 6:5, descriptor privilege level */
-#define X86_SEG_AR_SEG_PRESENT  (1u << 7)  /* 7, segment present */
-#define X86_SEG_AR_AVL          (1u << 12) /* 12, available for system software */
-#define X86_SEG_AR_CS_LM_ACTIVE (1u << 13) /* 13, long mode active (CS only) */
-#define X86_SEG_AR_DEF_OP_SIZE  (1u << 14) /* 14, default operation size */
-#define X86_SEG_AR_GRANULARITY  (1u << 15) /* 15, granularity */
-#define X86_SEG_AR_SEG_UNUSABLE (1u << 16) /* 16, segment unusable */
-
 #define VMCALL_OPCODE   ".byte 0x0f,0x01,0xc1\n"
 #define VMCLEAR_OPCODE  ".byte 0x66,0x0f,0xc7\n"        /* reg/opcode: /6 */
 #define VMLAUNCH_OPCODE ".byte 0x0f,0x01,0xc2\n"
@@ -284,8 +163,6 @@ typedef union cr_access_qual {
 #define MODRM_EAX_07    ".byte 0x38\n" /* [EAX], with reg/opcode: /7 */
 #define MODRM_EAX_ECX   ".byte 0xc1\n" /* EAX, ECX */
 
-extern uint8_t posted_intr_vector;
-
 #define cpu_has_vmx_ept_exec_only_supported        \
     (vmx_ept_vpid_cap & VMX_EPT_EXEC_ONLY_SUPPORTED)
 
@@ -299,70 +176,6 @@ extern uint8_t posted_intr_vector;
 #define cpu_has_vmx_ept_invept_single_context   \
     (vmx_ept_vpid_cap & VMX_EPT_INVEPT_SINGLE_CONTEXT)
 
-#define EPT_2MB_SHIFT     16
-#define EPT_1GB_SHIFT     17
-#define ept_has_2mb(c)    ((c >> EPT_2MB_SHIFT) & 1)
-#define ept_has_1gb(c)    ((c >> EPT_1GB_SHIFT) & 1)
-
-#define INVEPT_SINGLE_CONTEXT   1
-#define INVEPT_ALL_CONTEXT      2
-
-#define cpu_has_vmx_vpid_invvpid_individual_addr                    \
-    (vmx_ept_vpid_cap & VMX_VPID_INVVPID_INDIVIDUAL_ADDR)
-#define cpu_has_vmx_vpid_invvpid_single_context                     \
-    (vmx_ept_vpid_cap & VMX_VPID_INVVPID_SINGLE_CONTEXT)
-#define cpu_has_vmx_vpid_invvpid_single_context_retaining_global    \
-    (vmx_ept_vpid_cap & VMX_VPID_INVVPID_SINGLE_CONTEXT_RETAINING_GLOBAL)
-
-#define INVVPID_INDIVIDUAL_ADDR                 0
-#define INVVPID_SINGLE_CONTEXT                  1
-#define INVVPID_ALL_CONTEXT                     2
-#define INVVPID_SINGLE_CONTEXT_RETAINING_GLOBAL 3
-
-static always_inline void __vmptrld(u64 addr)
-{
-    asm volatile (
-#ifdef HAVE_AS_VMX
-                   "vmptrld %0\n"
-#else
-                   VMPTRLD_OPCODE MODRM_EAX_06
-#endif
-                   /* CF==1 or ZF==1 --> BUG() */
-                   UNLIKELY_START(be, vmptrld)
-                   _ASM_BUGFRAME_TEXT(0)
-                   UNLIKELY_END_SECTION
-                   :
-#ifdef HAVE_AS_VMX
-                   : "m" (addr),
-#else
-                   : "a" (&addr),
-#endif
-                     _ASM_BUGFRAME_INFO(BUGFRAME_bug, __LINE__, __FILE__, 0)
-                   : "memory");
-}
-
-static always_inline void __vmpclear(u64 addr)
-{
-    asm volatile (
-#ifdef HAVE_AS_VMX
-                   "vmclear %0\n"
-#else
-                   VMCLEAR_OPCODE MODRM_EAX_06
-#endif
-                   /* CF==1 or ZF==1 --> BUG() */
-                   UNLIKELY_START(be, vmclear)
-                   _ASM_BUGFRAME_TEXT(0)
-                   UNLIKELY_END_SECTION
-                   :
-#ifdef HAVE_AS_VMX
-                   : "m" (addr),
-#else
-                   : "a" (&addr),
-#endif
-                     _ASM_BUGFRAME_INFO(BUGFRAME_bug, __LINE__, __FILE__, 0)
-                   : "memory");
-}
-
 static always_inline void __vmread(unsigned long field, unsigned long *value)
 {
     asm volatile (
@@ -386,215 +199,20 @@ static always_inline void __vmread(unsigned long field, unsigned long *value)
         );
 }
 
-static always_inline void __vmwrite(unsigned long field, unsigned long value)
-{
-    asm volatile (
-#ifdef HAVE_AS_VMX
-                   "vmwrite %1, %0\n"
-#else
-                   VMWRITE_OPCODE MODRM_EAX_ECX
-#endif
-                   /* CF==1 or ZF==1 --> BUG() */
-                   UNLIKELY_START(be, vmwrite)
-                   _ASM_BUGFRAME_TEXT(0)
-                   UNLIKELY_END_SECTION
-                   :
-#ifdef HAVE_AS_VMX
-                   : "r" (field) , "rm" (value),
-#else
-                   : "a" (field) , "c" (value),
-#endif
-                     _ASM_BUGFRAME_INFO(BUGFRAME_bug, __LINE__, __FILE__, 0)
-        );
-}
-
-#ifdef HAVE_AS_VMX
-# define GAS_VMX_OP(yes, no) yes
-#else
-# define GAS_VMX_OP(yes, no) no
-#endif
-
-static inline enum vmx_insn_errno vmread_safe(unsigned long field,
-                                              unsigned long *value)
-{
-    unsigned long ret = VMX_INSN_SUCCEED;
-    bool fail_invalid, fail_valid;
-
-    asm volatile ( GAS_VMX_OP("vmread %[field], %[value]\n\t",
-                              VMREAD_OPCODE MODRM_EAX_ECX)
-                   ASM_FLAG_OUT(, "setc %[invalid]\n\t")
-                   ASM_FLAG_OUT(, "setz %[valid]\n\t")
-                   : ASM_FLAG_OUT("=@ccc", [invalid] "=rm") (fail_invalid),
-                     ASM_FLAG_OUT("=@ccz", [valid] "=rm") (fail_valid),
-                     [value] GAS_VMX_OP("=rm", "=c") (*value)
-                   : [field] GAS_VMX_OP("r", "a") (field));
-
-    if ( unlikely(fail_invalid) )
-        ret = VMX_INSN_FAIL_INVALID;
-    else if ( unlikely(fail_valid) )
-        __vmread(VM_INSTRUCTION_ERROR, &ret);
-
-    return ret;
-}
-
-static inline enum vmx_insn_errno vmwrite_safe(unsigned long field,
-                                               unsigned long value)
-{
-    unsigned long ret = VMX_INSN_SUCCEED;
-    bool fail_invalid, fail_valid;
-
-    asm volatile ( GAS_VMX_OP("vmwrite %[value], %[field]\n\t",
-                              VMWRITE_OPCODE MODRM_EAX_ECX)
-                   ASM_FLAG_OUT(, "setc %[invalid]\n\t")
-                   ASM_FLAG_OUT(, "setz %[valid]\n\t")
-                   : ASM_FLAG_OUT("=@ccc", [invalid] "=rm") (fail_invalid),
-                     ASM_FLAG_OUT("=@ccz", [valid] "=rm") (fail_valid)
-                   : [field] GAS_VMX_OP("r", "a") (field),
-                     [value] GAS_VMX_OP("rm", "c") (value));
-
-    if ( unlikely(fail_invalid) )
-        ret = VMX_INSN_FAIL_INVALID;
-    else if ( unlikely(fail_valid) )
-        __vmread(VM_INSTRUCTION_ERROR, &ret);
-
-    return ret;
-}
-
-#undef GAS_VMX_OP
-
-static always_inline void __invept(unsigned long type, uint64_t eptp)
-{
-    struct {
-        uint64_t eptp, rsvd;
-    } operand = { eptp };
-
-    /*
-     * If single context invalidation is not supported, we escalate to
-     * use all context invalidation.
-     */
-    if ( (type == INVEPT_SINGLE_CONTEXT) &&
-         !cpu_has_vmx_ept_invept_single_context )
-        type = INVEPT_ALL_CONTEXT;
-
-    asm volatile (
-#ifdef HAVE_AS_EPT
-                   "invept %0, %1\n"
-#else
-                   INVEPT_OPCODE MODRM_EAX_08
-#endif
-                   /* CF==1 or ZF==1 --> BUG() */
-                   UNLIKELY_START(be, invept)
-                   _ASM_BUGFRAME_TEXT(0)
-                   UNLIKELY_END_SECTION
-                   :
-#ifdef HAVE_AS_EPT
-                   : "m" (operand), "r" (type),
-#else
-                   : "a" (&operand), "c" (type),
-#endif
-                     _ASM_BUGFRAME_INFO(BUGFRAME_bug, __LINE__, __FILE__, 0)
-                   : "memory" );
-}
-
-static always_inline void __invvpid(unsigned long type, u16 vpid, u64 gva)
-{
-    struct __packed {
-        u64 vpid:16;
-        u64 rsvd:48;
-        u64 gva;
-    }  operand = {vpid, 0, gva};
-
-    /* Fix up #UD exceptions which occur when TLBs are flushed before VMXON. */
-    asm volatile ( "1: "
-#ifdef HAVE_AS_EPT
-                   "invvpid %0, %1\n"
-#else
-                   INVVPID_OPCODE MODRM_EAX_08
-#endif
-                   /* CF==1 or ZF==1 --> BUG() */
-                   UNLIKELY_START(be, invvpid)
-                   _ASM_BUGFRAME_TEXT(0)
-                   UNLIKELY_END_SECTION "\n"
-                   "2:"
-                   _ASM_EXTABLE(1b, 2b)
-                   :
-#ifdef HAVE_AS_EPT
-                   : "m" (operand), "r" (type),
-#else
-                   : "a" (&operand), "c" (type),
-#endif
-                     _ASM_BUGFRAME_INFO(BUGFRAME_bug, __LINE__, __FILE__, 0)
-                   : "memory" );
-}
+#define EPT_2MB_SHIFT     16
+#define EPT_1GB_SHIFT     17
+#define ept_has_2mb(c)    ((c >> EPT_2MB_SHIFT) & 1)
+#define ept_has_1gb(c)    ((c >> EPT_1GB_SHIFT) & 1)
 
-static inline void ept_sync_all(void)
-{
-    __invept(INVEPT_ALL_CONTEXT, 0);
-}
+#define cpu_has_vmx_vpid_invvpid_individual_addr                    \
+    (vmx_ept_vpid_cap & VMX_VPID_INVVPID_INDIVIDUAL_ADDR)
+#define cpu_has_vmx_vpid_invvpid_single_context                     \
+    (vmx_ept_vpid_cap & VMX_VPID_INVVPID_SINGLE_CONTEXT)
+#define cpu_has_vmx_vpid_invvpid_single_context_retaining_global    \
+    (vmx_ept_vpid_cap & VMX_VPID_INVVPID_SINGLE_CONTEXT_RETAINING_GLOBAL)
 
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
-static inline void vpid_sync_all(void)
-{
-    __invvpid(INVVPID_ALL_CONTEXT, 0, 0);
-}
-
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
-int cf_check vmx_guest_x86_mode(struct vcpu *v);
-unsigned int vmx_get_cpl(void);
-
-void vmx_inject_extint(int trap, uint8_t source);
-void vmx_inject_nmi(void);
-
 void ept_walk_table(struct domain *d, unsigned long gfn);
 bool_t ept_handle_misconfig(uint64_t gpa);
 int epte_get_entry_emt(struct domain *d, gfn_t gfn, mfn_t mfn,
@@ -603,13 +221,6 @@ void setup_ept_dump(void);
 /* Locate an alternate p2m by its EPTP */
 unsigned int p2m_find_altp2m_by_eptp(struct domain *d, uint64_t eptp);
 
-void update_guest_eip(void);
-
-void vmx_pi_per_cpu_init(unsigned int cpu);
-void vmx_pi_desc_fixup(unsigned int cpu);
-
-void vmx_sync_exit_bitmap(struct vcpu *v);
-
 #ifdef CONFIG_HVM
 void vmx_pi_hooks_assign(struct domain *d);
 void vmx_pi_hooks_deassign(struct domain *d);
@@ -618,8 +229,6 @@ static inline void vmx_pi_hooks_assign(struct domain *d) {}
 static inline void vmx_pi_hooks_deassign(struct domain *d) {}
 #endif
 
-#define APIC_INVALID_DEST           0xffffffff
-
 /* EPT violation qualifications definitions */
 typedef union ept_qual {
     unsigned long raw;
@@ -635,56 +244,4 @@ typedef union ept_qual {
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


