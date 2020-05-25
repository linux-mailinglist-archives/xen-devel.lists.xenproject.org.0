Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9295F1E1084
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2020 16:29:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdE67-0008K9-UW; Mon, 25 May 2020 14:28:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MLe6=7H=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jdE66-0008Jp-Ja
 for xen-devel@lists.xenproject.org; Mon, 25 May 2020 14:28:58 +0000
X-Inumbo-ID: 10e9585d-9e94-11ea-aee4-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 10e9585d-9e94-11ea-aee4-12813bfff9fa;
 Mon, 25 May 2020 14:28:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 14A0DAC9F;
 Mon, 25 May 2020 14:28:59 +0000 (UTC)
Subject: [PATCH v10 6/9] x86emul: support ENQCMD insns
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d2375ecb-f662-99d8-84c2-e9f9c5cf7b9e@suse.com>
Message-ID: <ec0c3d44-b6dc-0d75-870e-c1b6fb1ce834@suse.com>
Date: Mon, 25 May 2020 16:28:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <d2375ecb-f662-99d8-84c2-e9f9c5cf7b9e@suse.com>
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

Note that the ISA extensions document revision 038 doesn't specify
exception behavior for ModRM.mod == 0b11; assuming #UD here.

No tests are being added to the harness - this would be quite hard,
we can't just issue the insns against RAM. Their similarity with
MOVDIR64B should have the test case there be god enough to cover any
fundamental flaws.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
TBD: This doesn't (can't) consult PASID translation tables yet, as we
     have no VMX code for this so far. I guess for this we will want to
     replace the direct ->read_msr(MSR_PASID, ...) with a new
     ->read_pasid() hook.
---
v10: Re-base over changes earlier in the series as well as later parts
     comitted already.
v9: Consistently use named asm() operands. Also adjust
    x86_insn_is_mem_write(). A -> a in public header. Move
    asm-x86/msr-index.h addition and drop _IA32 from their names.
    Introduce _AC() into the emulator harness as a result.
v7: Re-base.
v6: Re-base.
v5: New.

--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -511,6 +511,8 @@ static const struct {
     { { 0xf6 }, { 2, 2 }, T, R, pfx_66 }, /* adcx */
     { { 0xf6 }, { 2, 2 }, T, R, pfx_f3 }, /* adox */
     { { 0xf8 }, { 2, 2 }, F, W, pfx_66 }, /* movdir64b */
+    { { 0xf8 }, { 2, 2 }, F, W, pfx_f3 }, /* enqcmds */
+    { { 0xf8 }, { 2, 2 }, F, W, pfx_f2 }, /* enqcmd */
     { { 0xf9 }, { 2, 2 }, F, W }, /* movdiri */
 };
 #undef CND
--- a/tools/tests/x86_emulator/x86-emulate.h
+++ b/tools/tests/x86_emulator/x86-emulate.h
@@ -59,6 +59,9 @@
     (type *)((char *)mptr__ - offsetof(type, member)); \
 })
 
+#define AC_(n,t) (n##t)
+#define _AC(n,t) AC_(n,t)
+
 #define hweight32 __builtin_popcount
 #define hweight64 __builtin_popcountll
 
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -48,6 +48,7 @@ $(call as-option-add,CFLAGS,CC,"clwb (%r
 $(call as-option-add,CFLAGS,CC,".equ \"x\"$$(comma)1",-DHAVE_AS_QUOTED_SYM)
 $(call as-option-add,CFLAGS,CC,"invpcid (%rax)$$(comma)%rax",-DHAVE_AS_INVPCID)
 $(call as-option-add,CFLAGS,CC,"movdiri %rax$$(comma)(%rax)",-DHAVE_AS_MOVDIR)
+$(call as-option-add,CFLAGS,CC,"enqcmd (%rax)$$(comma)%rax",-DHAVE_AS_ENQCMD)
 
 # GAS's idea of true is -1.  Clang's idea is 1
 $(call as-option-add,CFLAGS,CC,\
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -855,6 +855,7 @@ struct x86_emulate_state {
     } rmw;
     enum {
         blk_NONE,
+        blk_enqcmd,
         blk_movdir,
     } blk;
     uint8_t modrm, modrm_mod, modrm_reg, modrm_rm;
@@ -901,6 +902,7 @@ typedef union {
     uint64_t __attribute__ ((aligned(16))) xmm[2];
     uint64_t __attribute__ ((aligned(32))) ymm[4];
     uint64_t __attribute__ ((aligned(64))) zmm[8];
+    uint32_t data32[16];
 } mmval_t;
 
 /*
@@ -1923,6 +1925,7 @@ amd_like(const struct x86_emulate_ctxt *
 #define vcpu_has_rdpid()       (ctxt->cpuid->feat.rdpid)
 #define vcpu_has_movdiri()     (ctxt->cpuid->feat.movdiri)
 #define vcpu_has_movdir64b()   (ctxt->cpuid->feat.movdir64b)
+#define vcpu_has_enqcmd()      (ctxt->cpuid->feat.enqcmd)
 #define vcpu_has_avx512_4vnniw() (ctxt->cpuid->feat.avx512_4vnniw)
 #define vcpu_has_avx512_4fmaps() (ctxt->cpuid->feat.avx512_4fmaps)
 #define vcpu_has_serialize()   (ctxt->cpuid->feat.serialize)
@@ -10245,6 +10248,36 @@ x86_emulate(
         state->simd_size = simd_none;
         break;
 
+    case X86EMUL_OPC_F2(0x0f38, 0xf8): /* enqcmd r,m512 */
+    case X86EMUL_OPC_F3(0x0f38, 0xf8): /* enqcmds r,m512 */
+        host_and_vcpu_must_have(enqcmd);
+        generate_exception_if(ea.type != OP_MEM, EXC_UD);
+        generate_exception_if(vex.pfx != vex_f2 && !mode_ring0(), EXC_GP, 0);
+        src.val = truncate_ea(*dst.reg);
+        generate_exception_if(!is_aligned(x86_seg_es, src.val, 64, ctxt, ops),
+                              EXC_GP, 0);
+        fail_if(!ops->blk);
+        BUILD_BUG_ON(sizeof(*mmvalp) < 64);
+        if ( (rc = ops->read(ea.mem.seg, ea.mem.off, mmvalp, 64,
+                             ctxt)) != X86EMUL_OKAY )
+            goto done;
+        if ( vex.pfx == vex_f2 ) /* enqcmd */
+        {
+            fail_if(!ops->read_msr);
+            if ( (rc = ops->read_msr(MSR_PASID, &msr_val,
+                                     ctxt)) != X86EMUL_OKAY )
+                goto done;
+            generate_exception_if(!(msr_val & PASID_VALID), EXC_GP, 0);
+            mmvalp->data32[0] = MASK_EXTR(msr_val, PASID_PASID_MASK);
+        }
+        mmvalp->data32[0] &= ~0x7ff00000;
+        state->blk = blk_enqcmd;
+        if ( (rc = ops->blk(x86_seg_es, src.val, mmvalp, 64, &_regs.eflags,
+                            state, ctxt)) != X86EMUL_OKAY )
+            goto done;
+        state->simd_size = simd_none;
+        break;
+
     case X86EMUL_OPC(0x0f38, 0xf9): /* movdiri mem,r */
         host_and_vcpu_must_have(movdiri);
         generate_exception_if(dst.type != OP_MEM, EXC_UD);
@@ -11525,11 +11558,36 @@ int x86_emul_blk(
 {
     switch ( state->blk )
     {
+        bool zf;
+
         /*
          * Throughout this switch(), memory clobbers are used to compensate
          * that other operands may not properly express the (full) memory
          * ranges covered.
          */
+    case blk_enqcmd:
+        ASSERT(bytes == 64);
+        if ( ((unsigned long)ptr & 0x3f) )
+        {
+            ASSERT_UNREACHABLE();
+            return X86EMUL_UNHANDLEABLE;
+        }
+        *eflags &= ~EFLAGS_MASK;
+#ifdef HAVE_AS_ENQCMD
+        asm ( "enqcmds (%[src]), %[dst]" ASM_FLAG_OUT(, "; setz %[zf]")
+              : [zf] ASM_FLAG_OUT("=@ccz", "=qm") (zf)
+              : [src] "r" (data), [dst] "r" (ptr) : "memory" );
+#else
+        /* enqcmds (%rsi), %rdi */
+        asm ( ".byte 0xf3, 0x0f, 0x38, 0xf8, 0x3e"
+              ASM_FLAG_OUT(, "; setz %[zf]")
+              : [zf] ASM_FLAG_OUT("=@ccz", "=qm") (zf)
+              : "S" (data), "D" (ptr) : "memory" );
+#endif
+        if ( zf )
+            *eflags |= X86_EFLAGS_ZF;
+        break;
+
     case blk_movdir:
         switch ( bytes )
         {
@@ -11870,6 +11928,8 @@ x86_insn_is_mem_write(const struct x86_e
             return !mode_64bit();
 
         case X86EMUL_OPC_66(0x0f38, 0xf8): /* MOVDIR64B */
+        case X86EMUL_OPC_F2(0x0f38, 0xf8): /* ENQCMD */
+        case X86EMUL_OPC_F3(0x0f38, 0xf8): /* ENQCMDS */
             return true;
         }
 
--- a/xen/include/asm-x86/cpufeature.h
+++ b/xen/include/asm-x86/cpufeature.h
@@ -120,6 +120,7 @@
 #define cpu_has_rdpid           boot_cpu_has(X86_FEATURE_RDPID)
 #define cpu_has_movdiri         boot_cpu_has(X86_FEATURE_MOVDIRI)
 #define cpu_has_movdir64b       boot_cpu_has(X86_FEATURE_MOVDIR64B)
+#define cpu_has_enqcmd          boot_cpu_has(X86_FEATURE_ENQCMD)
 
 /* CPUID level 0x80000007.edx */
 #define cpu_has_itsc            boot_cpu_has(X86_FEATURE_ITSC)
--- a/xen/include/asm-x86/msr-index.h
+++ b/xen/include/asm-x86/msr-index.h
@@ -74,6 +74,10 @@
 #define MSR_PL3_SSP                         0x000006a7
 #define MSR_INTERRUPT_SSP_TABLE             0x000006a8
 
+#define MSR_PASID                           0x00000d93
+#define  PASID_PASID_MASK                   0x000fffff
+#define  PASID_VALID                        (_AC(1, ULL) << 31)
+
 /*
  * Legacy MSR constants in need of cleanup.  No new MSRs below this comment.
  */
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -243,6 +243,7 @@ XEN_CPUFEATURE(RDPID,         6*32+22) /
 XEN_CPUFEATURE(CLDEMOTE,      6*32+25) /*A  CLDEMOTE instruction */
 XEN_CPUFEATURE(MOVDIRI,       6*32+27) /*A  MOVDIRI instruction */
 XEN_CPUFEATURE(MOVDIR64B,     6*32+28) /*A  MOVDIR64B instruction */
+XEN_CPUFEATURE(ENQCMD,        6*32+29) /*   ENQCMD{,S} instructions */
 
 /* AMD-defined CPU features, CPUID level 0x80000007.edx, word 7 */
 XEN_CPUFEATURE(ITSC,          7*32+ 8) /*   Invariant TSC */


