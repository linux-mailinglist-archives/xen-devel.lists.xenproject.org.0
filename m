Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9001A79F0
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2020 13:46:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOK0s-00053w-6F; Tue, 14 Apr 2020 11:45:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=t7Uy=56=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jOK0q-00053m-HS
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2020 11:45:56 +0000
X-Inumbo-ID: 7fe57dfe-7e45-11ea-b4f4-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7fe57dfe-7e45-11ea-b4f4-bc764e2007e4;
 Tue, 14 Apr 2020 11:45:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 10066ADFE;
 Tue, 14 Apr 2020 11:45:54 +0000 (UTC)
Subject: [PATCH v6 04/10] x86emul: support ENQCMD insn
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d9a53b50-472d-477a-6275-ada0cb6e87e6@suse.com>
Message-ID: <d73a52d8-6835-3489-a351-8608789504fc@suse.com>
Date: Tue, 14 Apr 2020 13:45:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <d9a53b50-472d-477a-6275-ada0cb6e87e6@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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

Note that the ISA extensions document revision 037 doesn't specify
exception behavior for ModRM.mod == 0b11; assuming #UD here.

No tests are being added to the harness - this would be quite hard,
we can't just issue the insns against RAM. Their similarity with
MOVDIR64B should have the test case there be god enough to cover any
fundamental flaws.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
TBD: This doesn't (can't) consult PASID translation tables yet, as we
     have no VMX code for this so far. I guess for this we will want to
     replace the direct ->read_msr(MSR_IA32_PASID, ...) with a new
     ->read_pasid() hook.
---
v6: Re-base.
v5: New.

--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -250,13 +250,14 @@ $(BASEDIR)/include/asm-x86/asm-macros.h:
 # sure we pick up changes when the compiler used has changed.)
 ifeq ($(MAKECMDGOALS),asm-offsets.s)
 
-as-ISA-list := CLWB EPT FSGSBASE INVPCID MOVDIR RDRAND RDSEED SSE4_2 VMX XSAVEOPT
+as-ISA-list := CLWB ENQCMD EPT FSGSBASE INVPCID MOVDIR RDRAND RDSEED SSE4_2 VMX XSAVEOPT
 
 CLWB-insn	:= clwb (%rax)
 EPT-insn	:= invept (%rax),%rax
 FSGSBASE-insn	:= rdfsbase %rax
 INVPCID-insn	:= invpcid (%rax),%rax
 MOVDIR-insn	:= movdiri %rax,(%rax)
+ENQCMD-insn	:= enqcmd (%rax),%rax
 RDRAND-insn	:= rdrand %eax
 RDSEED-insn	:= rdseed %eax
 SSE4_2-insn	:= crc32 %eax,%eax
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -854,6 +854,7 @@ struct x86_emulate_state {
         rmw_xor,
     } rmw;
     enum {
+        blk_enqcmd,
         blk_movdir,
     } blk;
     uint8_t modrm, modrm_mod, modrm_reg, modrm_rm;
@@ -900,6 +901,7 @@ typedef union {
     uint64_t __attribute__ ((aligned(16))) xmm[2];
     uint64_t __attribute__ ((aligned(32))) ymm[4];
     uint64_t __attribute__ ((aligned(64))) zmm[8];
+    uint32_t data32[16];
 } mmval_t;
 
 /*
@@ -1921,6 +1923,7 @@ amd_like(const struct x86_emulate_ctxt *
 #define vcpu_has_rdpid()       (ctxt->cpuid->feat.rdpid)
 #define vcpu_has_movdiri()     (ctxt->cpuid->feat.movdiri)
 #define vcpu_has_movdir64b()   (ctxt->cpuid->feat.movdir64b)
+#define vcpu_has_enqcmd()      (ctxt->cpuid->feat.enqcmd)
 #define vcpu_has_avx512_4vnniw() (ctxt->cpuid->feat.avx512_4vnniw)
 #define vcpu_has_avx512_4fmaps() (ctxt->cpuid->feat.avx512_4fmaps)
 #define vcpu_has_avx512_bf16() (ctxt->cpuid->feat.avx512_bf16)
@@ -10197,6 +10200,36 @@ x86_emulate(
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
+            if ( (rc = ops->read_msr(MSR_IA32_PASID,
+                                     &msr_val, ctxt)) != X86EMUL_OKAY )
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
@@ -11477,11 +11510,36 @@ int x86_emul_blk(
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
+        asm ( "enqcmds (%[src]), %[dst]" ASM_FLAG_OUT(, "; setz %0")
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
--- a/xen/include/asm-x86/cpufeature.h
+++ b/xen/include/asm-x86/cpufeature.h
@@ -122,6 +122,7 @@
 #define cpu_has_rdpid           boot_cpu_has(X86_FEATURE_RDPID)
 #define cpu_has_movdiri         boot_cpu_has(X86_FEATURE_MOVDIRI)
 #define cpu_has_movdir64b       boot_cpu_has(X86_FEATURE_MOVDIR64B)
+#define cpu_has_enqcmd          boot_cpu_has(X86_FEATURE_ENQCMD)
 
 /* CPUID level 0x80000007.edx */
 #define cpu_has_itsc            boot_cpu_has(X86_FEATURE_ITSC)
--- a/xen/include/asm-x86/msr-index.h
+++ b/xen/include/asm-x86/msr-index.h
@@ -412,6 +412,10 @@
 #define MSR_IA32_TSC_DEADLINE		0x000006E0
 #define MSR_IA32_ENERGY_PERF_BIAS	0x000001b0
 
+#define MSR_IA32_PASID			0x00000d93
+#define  PASID_PASID_MASK		0x000fffff
+#define  PASID_VALID			0x80000000
+
 /* Platform Shared Resource MSRs */
 #define MSR_IA32_CMT_EVTSEL		0x00000c8d
 #define MSR_IA32_CMT_EVTSEL_UE_MASK	0x0000ffff
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -239,6 +239,7 @@ XEN_CPUFEATURE(RDPID,         6*32+22) /
 XEN_CPUFEATURE(CLDEMOTE,      6*32+25) /*A  CLDEMOTE instruction */
 XEN_CPUFEATURE(MOVDIRI,       6*32+27) /*A  MOVDIRI instruction */
 XEN_CPUFEATURE(MOVDIR64B,     6*32+28) /*A  MOVDIR64B instruction */
+XEN_CPUFEATURE(ENQCMD,        6*32+29) /*   ENQCMD{,S} instructions */
 
 /* AMD-defined CPU features, CPUID level 0x80000007.edx, word 7 */
 XEN_CPUFEATURE(ITSC,          7*32+ 8) /*   Invariant TSC */

