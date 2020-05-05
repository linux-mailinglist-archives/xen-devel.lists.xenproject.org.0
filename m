Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E596A1C500D
	for <lists+xen-devel@lfdr.de>; Tue,  5 May 2020 10:17:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVsl0-0004Xu-9V; Tue, 05 May 2020 08:16:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5wz9=6T=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jVskz-0004Xd-7j
 for xen-devel@lists.xenproject.org; Tue, 05 May 2020 08:16:49 +0000
X-Inumbo-ID: c3af7990-8ea8-11ea-ae69-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c3af7990-8ea8-11ea-ae69-bc764e2007e4;
 Tue, 05 May 2020 08:16:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7EE74AFF3;
 Tue,  5 May 2020 08:16:49 +0000 (UTC)
Subject: [PATCH v8 09/12] x86emul: support FXSAVE/FXRSTOR
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <60cc730f-2a1c-d7a6-74fe-64f3c9308831@suse.com>
Message-ID: <ea1db2c5-3dd7-f1c8-c051-e39f0dffc94e@suse.com>
Date: Tue, 5 May 2020 10:16:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <60cc730f-2a1c-d7a6-74fe-64f3c9308831@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Note that FPU selector handling as well as MXCSR mask saving for now
does not honor differences between host and guest visible featuresets.

While for Intel operation of the insns with CR4.OSFXSR=0 is
implementation dependent, use the easiest solution there: Simply don't
look at the bit in the first place. For AMD and alike the behavior is
well defined, so it gets handled together with FFXSR.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v8: Respect EFER.FFXSE and CR4.OSFXSR. Correct wrong X86EMUL_NO_*
    dependencies. Reduce #ifdef-ary.
v7: New.

--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -767,6 +767,12 @@ static void zap_fpsel(unsigned int *env,
     }
 }
 
+static void zap_xfpsel(unsigned int *env)
+{
+    env[3] &= ~0xffff;
+    env[5] &= ~0xffff;
+}
+
 #ifdef __x86_64__
 # define STKVAL_DISP 64
 static const struct {
@@ -2517,6 +2523,91 @@ int main(int argc, char **argv)
     else
         printf("skipped\n");
 
+    printf("%-40s", "Testing fxsave 4(%ecx)...");
+    if ( stack_exec && cpu_has_fxsr )
+    {
+        const uint16_t nine = 9;
+
+        memset(res + 0x80, 0xcc, 0x400);
+        if ( cpu_has_sse2 )
+            asm volatile ( "pcmpeqd %xmm7, %xmm7\n\t"
+                           "pxor %xmm6, %xmm6\n\t"
+                           "psubw %xmm7, %xmm6" );
+        asm volatile ( "fninit\n\t"
+                       "fld1\n\t"
+                       "fidivs %1\n\t"
+                       "fxsave %0"
+                       : "=m" (res[0x100]) : "m" (nine) : "memory" );
+        zap_xfpsel(&res[0x100]);
+        instr[0] = 0x0f; instr[1] = 0xae; instr[2] = 0x41; instr[3] = 0x04;
+        regs.eip = (unsigned long)&instr[0];
+        regs.ecx = (unsigned long)(res + 0x7f);
+        memset(res + 0x100 + 0x74, 0x33, 0x30);
+        memset(res + 0x80 + 0x74, 0x33, 0x30);
+        rc = x86_emulate(&ctxt, &emulops);
+        zap_xfpsel(&res[0x80]);
+        if ( (rc != X86EMUL_OKAY) ||
+             memcmp(res + 0x80, res + 0x100, 0x200) ||
+             (regs.eip != (unsigned long)&instr[4]) )
+            goto fail;
+        printf("okay\n");
+    }
+    else
+        printf("skipped\n");
+
+    printf("%-40s", "Testing fxrstor -4(%ecx)...");
+    if ( stack_exec && cpu_has_fxsr )
+    {
+        const uint16_t eleven = 11;
+
+        memset(res + 0x80, 0xcc, 0x400);
+        asm volatile ( "fxsave %0" : "=m" (res[0x80]) :: "memory" );
+        zap_xfpsel(&res[0x80]);
+        if ( cpu_has_sse2 )
+            asm volatile ( "pxor %xmm7, %xmm6\n\t"
+                           "pxor %xmm7, %xmm3\n\t"
+                           "pxor %xmm7, %xmm0\n\t"
+                           "pxor %xmm7, %xmm7" );
+        asm volatile ( "fninit\n\t"
+                       "fld1\n\t"
+                       "fidivs %0\n\t"
+                       :: "m" (eleven) );
+        instr[0] = 0x0f; instr[1] = 0xae; instr[2] = 0x49; instr[3] = 0xfc;
+        regs.eip = (unsigned long)&instr[0];
+        regs.ecx = (unsigned long)(res + 0x81);
+        rc = x86_emulate(&ctxt, &emulops);
+        asm volatile ( "fxsave %0" : "=m" (res[0x100]) :: "memory" );
+        if ( (rc != X86EMUL_OKAY) ||
+             memcmp(res + 0x100, res + 0x80, 0x200) ||
+             (regs.eip != (unsigned long)&instr[4]) )
+            goto fail;
+        printf("okay\n");
+    }
+    else
+        printf("skipped\n");
+
+#ifdef __x86_64__
+    printf("%-40s", "Testing fxsaveq 8(%edx)...");
+    if ( stack_exec && cpu_has_fxsr )
+    {
+        memset(res + 0x80, 0xcc, 0x400);
+        asm volatile ( "fxsaveq %0" : "=m" (res[0x100]) :: "memory" );
+        instr[0] = 0x48; instr[1] = 0x0f; instr[2] = 0xae; instr[3] = 0x42; instr[4] = 0x08;
+        regs.eip = (unsigned long)&instr[0];
+        regs.edx = (unsigned long)(res + 0x7e);
+        memset(res + 0x100 + 0x74, 0x33, 0x30);
+        memset(res + 0x80 + 0x74, 0x33, 0x30);
+        rc = x86_emulate(&ctxt, &emulops);
+        if ( (rc != X86EMUL_OKAY) ||
+             memcmp(res + 0x80, res + 0x100, 0x200) ||
+             (regs.eip != (unsigned long)&instr[5]) )
+            goto fail;
+        printf("okay\n");
+    }
+    else
+        printf("skipped\n");
+#endif
+
     printf("%-40s", "Testing movq %mm3,(%ecx)...");
     if ( stack_exec && cpu_has_mmx )
     {
--- a/tools/tests/x86_emulator/x86-emulate.c
+++ b/tools/tests/x86_emulator/x86-emulate.c
@@ -30,6 +30,13 @@ struct cpuid_policy cp;
 static char fpu_save_area[4096] __attribute__((__aligned__((64))));
 static bool use_xsave;
 
+/*
+ * Re-use the area above also as scratch space for the emulator itself.
+ * (When debugging the emulator, care needs to be taken when inserting
+ * printf() or alike function calls into regions using this.)
+ */
+#define FXSAVE_AREA ((struct x86_fxsr *)fpu_save_area)
+
 void emul_save_fpu_state(void)
 {
     if ( use_xsave )
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -860,6 +860,11 @@ struct x86_emulate_state {
         blk_fld, /* FLDENV, FRSTOR */
         blk_fst, /* FNSTENV, FNSAVE */
 #endif
+#if !defined(X86EMUL_NO_FPU) || !defined(X86EMUL_NO_MMX) || \
+    !defined(X86EMUL_NO_SIMD)
+        blk_fxrstor,
+        blk_fxsave,
+#endif
         blk_movdir,
     } blk;
     uint8_t modrm, modrm_mod, modrm_reg, modrm_rm;
@@ -953,6 +958,29 @@ typedef union {
     uint32_t data32[16];
 } mmval_t;
 
+struct x86_fxsr {
+    uint16_t fcw;
+    uint16_t fsw;
+    uint16_t ftw:8, :8;
+    uint16_t fop;
+    union {
+        struct {
+            uint32_t offs;
+            uint32_t sel:16, :16;
+        };
+        uint64_t addr;
+    } fip, fdp;
+    uint32_t mxcsr;
+    uint32_t mxcsr_mask;
+    struct {
+        uint8_t data[10];
+        uint8_t _[6];
+    } fpreg[8];
+    uint64_t __attribute__ ((aligned(16))) xmm[16][2];
+    uint64_t _[6];
+    uint64_t avl[6];
+};
+
 /*
  * While proper alignment gets specified above, this doesn't get honored by
  * the compiler for automatic variables. Use this helper to instantiate a
@@ -1910,6 +1938,7 @@ amd_like(const struct x86_emulate_ctxt *
 #define vcpu_has_cmov()        (ctxt->cpuid->basic.cmov)
 #define vcpu_has_clflush()     (ctxt->cpuid->basic.clflush)
 #define vcpu_has_mmx()         (ctxt->cpuid->basic.mmx)
+#define vcpu_has_fxsr()        (ctxt->cpuid->basic.fxsr)
 #define vcpu_has_sse()         (ctxt->cpuid->basic.sse)
 #define vcpu_has_sse2()        (ctxt->cpuid->basic.sse2)
 #define vcpu_has_sse3()        (ctxt->cpuid->basic.sse3)
@@ -8125,6 +8154,47 @@ x86_emulate(
     case X86EMUL_OPC(0x0f, 0xae): case X86EMUL_OPC_66(0x0f, 0xae): /* Grp15 */
         switch ( modrm_reg & 7 )
         {
+#if !defined(X86EMUL_NO_FPU) || !defined(X86EMUL_NO_MMX) || \
+    !defined(X86EMUL_NO_SIMD)
+        case 0: /* fxsave */
+        case 1: /* fxrstor */
+            generate_exception_if(vex.pfx, EXC_UD);
+            vcpu_must_have(fxsr);
+            generate_exception_if(ea.type != OP_MEM, EXC_UD);
+            generate_exception_if(!is_aligned(ea.mem.seg, ea.mem.off, 16,
+                                              ctxt, ops),
+                                  EXC_GP, 0);
+            fail_if(!ops->blk);
+            op_bytes =
+#ifdef __x86_64__
+                !mode_64bit() ? offsetof(struct x86_fxsr, xmm[8]) :
+#endif
+                sizeof(struct x86_fxsr);
+            if ( amd_like(ctxt) )
+            {
+                if ( !ops->read_cr ||
+                     ops->read_cr(4, &cr4, ctxt) != X86EMUL_OKAY )
+                    cr4 = X86_CR4_OSFXSR;
+                if ( !ops->read_msr ||
+                     ops->read_msr(MSR_EFER, &msr_val, ctxt) != X86EMUL_OKAY )
+                    msr_val = 0;
+                if ( !(cr4 & X86_CR4_OSFXSR) ||
+                     (mode_64bit() && mode_ring0() && (msr_val & EFER_FFXSE)) )
+                    op_bytes = offsetof(struct x86_fxsr, xmm[0]);
+            }
+            /*
+             * This could also be X86EMUL_FPU_mmx, but it shouldn't be
+             * X86EMUL_FPU_xmm, as we don't want CR4.OSFXSR checked.
+             */
+            get_fpu(X86EMUL_FPU_fpu);
+            state->blk = modrm_reg & 1 ? blk_fxrstor : blk_fxsave;
+            if ( (rc = ops->blk(ea.mem.seg, ea.mem.off, NULL,
+                                sizeof(struct x86_fxsr), &_regs.eflags,
+                                state, ctxt)) != X86EMUL_OKAY )
+                goto done;
+            break;
+#endif /* X86EMUL_NO_{FPU,MMX,SIMD} */
+
 #ifndef X86EMUL_NO_SIMD
         case 2: /* ldmxcsr */
             generate_exception_if(vex.pfx, EXC_UD);
@@ -11611,6 +11681,8 @@ int x86_emul_blk(
     struct x86_emulate_state *state,
     struct x86_emulate_ctxt *ctxt)
 {
+    int rc = X86EMUL_OKAY;
+
     switch ( state->blk )
     {
         bool zf;
@@ -11819,6 +11891,77 @@ int x86_emul_blk(
 
 #endif /* X86EMUL_NO_FPU */
 
+#if !defined(X86EMUL_NO_FPU) || !defined(X86EMUL_NO_MMX) || \
+    !defined(X86EMUL_NO_SIMD)
+
+    case blk_fxrstor:
+    {
+        struct x86_fxsr *fxsr = FXSAVE_AREA;
+
+        ASSERT(!data);
+        ASSERT(bytes == sizeof(*fxsr));
+        ASSERT(state->op_bytes <= bytes);
+
+        if ( state->op_bytes < sizeof(*fxsr) )
+        {
+            if ( state->rex_prefix & REX_W )
+            {
+                /*
+                 * The only way to force fxsaveq on a wide range of gas
+                 * versions. On older versions the rex64 prefix works only if
+                 * we force an addressing mode that doesn't require extended
+                 * registers.
+                 */
+                asm volatile ( ".byte 0x48; fxsave (%1)"
+                               : "=m" (*fxsr) : "R" (fxsr) );
+            }
+            else
+                asm volatile ( "fxsave %0" : "=m" (*fxsr) );
+        }
+
+        memcpy(fxsr, ptr, min(state->op_bytes,
+                              (unsigned int)offsetof(struct x86_fxsr, _)));
+        memset(fxsr->_, 0, sizeof(*fxsr) - offsetof(struct x86_fxsr, _));
+
+        generate_exception_if(fxsr->mxcsr & ~mxcsr_mask, EXC_GP, 0);
+
+        if ( state->rex_prefix & REX_W )
+        {
+            /* See above for why operand/constraints are this way. */
+            asm volatile ( ".byte 0x48; fxrstor (%0)"
+                           :: "R" (fxsr), "m" (*fxsr) );
+        }
+        else
+            asm volatile ( "fxrstor %0" :: "m" (*fxsr) );
+        break;
+    }
+
+    case blk_fxsave:
+    {
+        struct x86_fxsr *fxsr = FXSAVE_AREA;
+
+        ASSERT(!data);
+        ASSERT(bytes == sizeof(*fxsr));
+        ASSERT(state->op_bytes <= bytes);
+
+        if ( state->rex_prefix & REX_W )
+        {
+            /* See above for why operand/constraint are this way. */
+            asm volatile ( ".byte 0x48; fxsave (%0)"
+                           :: "R" (state->op_bytes < sizeof(*fxsr) ? fxsr : ptr)
+                           : "memory" );
+        }
+        else
+            asm volatile ( "fxsave (%0)"
+                           :: "r" (state->op_bytes < sizeof(*fxsr) ? fxsr : ptr)
+                           : "memory" );
+        if ( state->op_bytes < sizeof(*fxsr) )
+            memcpy(ptr, fxsr, state->op_bytes);
+        break;
+    }
+
+#endif /* X86EMUL_NO_{FPU,MMX,SIMD} */
+
     case blk_movdir:
         switch ( bytes )
         {
@@ -11872,7 +12015,8 @@ int x86_emul_blk(
         return X86EMUL_UNHANDLEABLE;
     }
 
-    return X86EMUL_OKAY;
+ done:
+    return rc;
 }
 
 static void __init __maybe_unused build_assertions(void)
--- a/xen/arch/x86/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate.c
@@ -42,6 +42,8 @@
     }                                                      \
 })
 
+#define FXSAVE_AREA current->arch.fpu_ctxt
+
 #ifndef CONFIG_HVM
 # define X86EMUL_NO_FPU
 # define X86EMUL_NO_MMX


