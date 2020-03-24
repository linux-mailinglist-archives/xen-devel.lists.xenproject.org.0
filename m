Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B30190DB8
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2020 13:36:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGil2-0006gD-76; Tue, 24 Mar 2020 12:34:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Lmgi=5J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jGikz-0006fu-SN
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 12:34:09 +0000
X-Inumbo-ID: c1a9d508-6dcb-11ea-b34e-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c1a9d508-6dcb-11ea-b34e-bc764e2007e4;
 Tue, 24 Mar 2020 12:34:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 13243AE3C;
 Tue, 24 Mar 2020 12:34:08 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6fa81b4d-528d-5c33-50c5-a18396b4383a@suse.com>
Message-ID: <81e7aade-9dfb-313a-ad81-30b2703c2136@suse.com>
Date: Tue, 24 Mar 2020 13:34:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <6fa81b4d-528d-5c33-50c5-a18396b4383a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: [Xen-devel] [PATCH v5 05/10] x86emul: support MOVDIR64B insn
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <Paul.Durrant@citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Introduce a new blk() hook, paralleling the rmw() on in certain way, but
being intended for larger data sizes, and hence its HVM intermediate
handling function doesn't fall back to splitting the operation if the
requested virtual address can't be mapped.

Note that SDM revision 071 doesn't specify exception behavior for
ModRM.mod == 0b11; assuming #UD here.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
TBD: If we want to avoid depending on correct MTRR settings,
     hvmemul_map_linear_addr() may need to gain a parameter to allow
     controlling cachability of the produced mapping(s). Of course the
     function will also need to be made capable of mapping at least
     p2m_mmio_direct pages for this and the two ENQCMD insns to be
     actually useful.
---
v5: Introduce/use ->blk() hook. Correct asm() operands.
v4: Split MOVDIRI and MOVDIR64B. Switch to using ->rmw(). Re-base.
v3: Update description.
---
(SDE: -tnt)

--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -652,6 +652,18 @@ static int cmpxchg(
     return X86EMUL_OKAY;
 }
 
+static int blk(
+    enum x86_segment seg,
+    unsigned long offset,
+    void *p_data,
+    unsigned int bytes,
+    uint32_t *eflags,
+    struct x86_emulate_state *state,
+    struct x86_emulate_ctxt *ctxt)
+{
+    return x86_emul_blk((void *)offset, p_data, bytes, eflags, state, ctxt);
+}
+
 static int read_segment(
     enum x86_segment seg,
     struct segment_register *reg,
@@ -2208,6 +2220,35 @@ int main(int argc, char **argv)
         goto fail;
     printf("okay\n");
 
+    printf("%-40s", "Testing movdir64b 144(%edx),%ecx...");
+    if ( stack_exec && cpu_has_movdir64b )
+    {
+        emulops.blk = blk;
+
+        instr[0] = 0x66; instr[1] = 0x0f; instr[2] = 0x38; instr[3] = 0xf8;
+        instr[4] = 0x8a; instr[5] = 0x90; instr[8] = instr[7] = instr[6] = 0;
+
+        regs.eip = (unsigned long)&instr[0];
+        for ( i = 0; i < 64; ++i )
+            res[i] = i - 20;
+        regs.edx = (unsigned long)res;
+        regs.ecx = (unsigned long)(res + 16);
+
+        rc = x86_emulate(&ctxt, &emulops);
+        if ( (rc != X86EMUL_OKAY) ||
+             (regs.eip != (unsigned long)&instr[9]) ||
+             res[15] != -5 || res[32] != 12 )
+            goto fail;
+        for ( i = 16; i < 32; ++i )
+            if ( res[i] != i )
+                goto fail;
+        printf("okay\n");
+
+        emulops.blk = NULL;
+    }
+    else
+        printf("skipped\n");
+
     printf("%-40s", "Testing movq %mm3,(%ecx)...");
     if ( stack_exec && cpu_has_mmx )
     {
--- a/tools/tests/x86_emulator/x86-emulate.h
+++ b/tools/tests/x86_emulator/x86-emulate.h
@@ -154,6 +154,7 @@ static inline bool xcr0_mask(uint64_t ma
 #define cpu_has_avx512_vnni (cp.feat.avx512_vnni && xcr0_mask(0xe6))
 #define cpu_has_avx512_bitalg (cp.feat.avx512_bitalg && xcr0_mask(0xe6))
 #define cpu_has_avx512_vpopcntdq (cp.feat.avx512_vpopcntdq && xcr0_mask(0xe6))
+#define cpu_has_movdir64b  cp.feat.movdir64b
 #define cpu_has_avx512_4vnniw (cp.feat.avx512_4vnniw && xcr0_mask(0xe6))
 #define cpu_has_avx512_4fmaps (cp.feat.avx512_4fmaps && xcr0_mask(0xe6))
 #define cpu_has_avx512_bf16 (cp.feat.avx512_bf16 && xcr0_mask(0xe6))
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -250,12 +250,13 @@ $(BASEDIR)/include/asm-x86/asm-macros.h:
 # sure we pick up changes when the compiler used has changed.)
 ifeq ($(MAKECMDGOALS),asm-offsets.s)
 
-as-ISA-list := CLWB EPT FSGSBASE INVPCID RDRAND RDSEED SSE4_2 VMX XSAVEOPT
+as-ISA-list := CLWB EPT FSGSBASE INVPCID MOVDIR64B RDRAND RDSEED SSE4_2 VMX XSAVEOPT
 
 CLWB-insn	:= clwb (%rax)
 EPT-insn	:= invept (%rax),%rax
 FSGSBASE-insn	:= rdfsbase %rax
 INVPCID-insn	:= invpcid (%rax),%rax
+MOVDIR64B-insn	:= movdir64b (%rax),%rax
 RDRAND-insn	:= rdrand %eax
 RDSEED-insn	:= rdseed %eax
 SSE4_2-insn	:= crc32 %eax,%eax
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -1409,6 +1409,44 @@ static int hvmemul_rmw(
     return rc;
 }
 
+static int hvmemul_blk(
+    enum x86_segment seg,
+    unsigned long offset,
+    void *p_data,
+    unsigned int bytes,
+    uint32_t *eflags,
+    struct x86_emulate_state *state,
+    struct x86_emulate_ctxt *ctxt)
+{
+    struct hvm_emulate_ctxt *hvmemul_ctxt =
+        container_of(ctxt, struct hvm_emulate_ctxt, ctxt);
+    unsigned long addr;
+    uint32_t pfec = PFEC_page_present | PFEC_write_access;
+    int rc;
+    void *mapping = NULL;
+
+    rc = hvmemul_virtual_to_linear(
+        seg, offset, bytes, NULL, hvm_access_write, hvmemul_ctxt, &addr);
+    if ( rc != X86EMUL_OKAY || !bytes )
+        return rc;
+
+    if ( is_x86_system_segment(seg) )
+        pfec |= PFEC_implicit;
+    else if ( hvmemul_ctxt->seg_reg[x86_seg_ss].dpl == 3 )
+        pfec |= PFEC_user_mode;
+
+    mapping = hvmemul_map_linear_addr(addr, bytes, pfec, hvmemul_ctxt);
+    if ( IS_ERR(mapping) )
+        return ~PTR_ERR(mapping);
+    if ( !mapping )
+        return X86EMUL_UNHANDLEABLE;
+
+    rc = x86_emul_blk(mapping, p_data, bytes, eflags, state, ctxt);
+    hvmemul_unmap_linear_addr(mapping, addr, bytes, hvmemul_ctxt);
+
+    return rc;
+}
+
 static int hvmemul_write_discard(
     enum x86_segment seg,
     unsigned long offset,
@@ -2475,6 +2513,7 @@ static const struct x86_emulate_ops hvm_
     .write         = hvmemul_write,
     .rmw           = hvmemul_rmw,
     .cmpxchg       = hvmemul_cmpxchg,
+    .blk           = hvmemul_blk,
     .validate      = hvmemul_validate,
     .rep_ins       = hvmemul_rep_ins,
     .rep_outs      = hvmemul_rep_outs,
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -548,6 +548,7 @@ static const struct ext0f38_table {
     [0xf1] = { .to_mem = 1, .two_op = 1 },
     [0xf2 ... 0xf3] = {},
     [0xf5 ... 0xf7] = {},
+    [0xf8] = { .simd_size = simd_other },
     [0xf9] = { .to_mem = 1 },
 };
 
@@ -852,6 +853,9 @@ struct x86_emulate_state {
         rmw_xchg,
         rmw_xor,
     } rmw;
+    enum {
+        blk_movdir,
+    } blk;
     uint8_t modrm, modrm_mod, modrm_reg, modrm_rm;
     uint8_t sib_index, sib_scale;
     uint8_t rex_prefix;
@@ -1904,6 +1908,7 @@ in_protmode(
 #define vcpu_has_avx512_vpopcntdq() (ctxt->cpuid->feat.avx512_vpopcntdq)
 #define vcpu_has_rdpid()       (ctxt->cpuid->feat.rdpid)
 #define vcpu_has_movdiri()     (ctxt->cpuid->feat.movdiri)
+#define vcpu_has_movdir64b()   (ctxt->cpuid->feat.movdir64b)
 #define vcpu_has_avx512_4vnniw() (ctxt->cpuid->feat.avx512_4vnniw)
 #define vcpu_has_avx512_4fmaps() (ctxt->cpuid->feat.avx512_4fmaps)
 #define vcpu_has_avx512_bf16() (ctxt->cpuid->feat.avx512_bf16)
@@ -10079,6 +10084,23 @@ x86_emulate(
                             : "0" ((uint32_t)src.val), "rm" (_regs.edx) );
         break;
 
+    case X86EMUL_OPC_66(0x0f38, 0xf8): /* movdir64b r,m512 */
+        host_and_vcpu_must_have(movdir64b);
+        generate_exception_if(ea.type != OP_MEM, EXC_UD);
+        src.val = truncate_ea(*dst.reg);
+        generate_exception_if(!is_aligned(x86_seg_es, src.val, 64, ctxt, ops),
+                              EXC_GP, 0);
+        fail_if(!ops->blk);
+        state->blk = blk_movdir;
+        BUILD_BUG_ON(sizeof(*mmvalp) < 64);
+        if ( (rc = ops->read(ea.mem.seg, ea.mem.off, mmvalp, 64,
+                             ctxt)) != X86EMUL_OKAY ||
+             (rc = ops->blk(x86_seg_es, src.val, mmvalp, 64, &_regs.eflags,
+                            state, ctxt)) != X86EMUL_OKAY )
+            goto done;
+        state->simd_size = simd_none;
+        break;
+
     case X86EMUL_OPC(0x0f38, 0xf9): /* movdiri mem,r */
         vcpu_must_have(movdiri);
         generate_exception_if(dst.type != OP_MEM, EXC_UD);
@@ -11345,6 +11367,45 @@ int x86_emul_rmw(
 
     return X86EMUL_OKAY;
 }
+
+int x86_emul_blk(
+    void *ptr,
+    void *data,
+    unsigned int bytes,
+    uint32_t *eflags,
+    struct x86_emulate_state *state,
+    struct x86_emulate_ctxt *ctxt)
+{
+    switch ( state->blk )
+    {
+        /*
+         * Throughout this switch(), memory clobbers are used to compensate
+         * that other operands may not properly express the (full) memory
+         * ranges covered.
+         */
+    case blk_movdir:
+        ASSERT(bytes == 64);
+        if ( ((unsigned long)ptr & 0x3f) )
+        {
+            ASSERT_UNREACHABLE();
+            return X86EMUL_UNHANDLEABLE;
+        }
+#ifdef HAVE_AS_MOVDIR64B
+        asm ( "movdir64b (%0), %1" :: "r" (data), "r" (ptr) : "memory" );
+#else
+        /* movdir64b (%rsi), %rdi */
+        asm ( ".byte 0x66, 0x0f, 0x38, 0xf8, 0x3e"
+              :: "S" (data), "D" (ptr) : "memory" );
+#endif
+        break;
+
+    default:
+        ASSERT_UNREACHABLE();
+        return X86EMUL_UNHANDLEABLE;
+    }
+
+    return X86EMUL_OKAY;
+}
 
 static void __init __maybe_unused build_assertions(void)
 {
--- a/xen/arch/x86/x86_emulate/x86_emulate.h
+++ b/xen/arch/x86/x86_emulate/x86_emulate.h
@@ -310,6 +310,22 @@ struct x86_emulate_ops
         struct x86_emulate_ctxt *ctxt);
 
     /*
+     * blk: Emulate a large (block) memory access.
+     * @p_data: [IN/OUT] (optional) Pointer to source/destination buffer.
+     * @eflags: [IN/OUT] Pointer to EFLAGS to be updated according to
+     *                   instruction effects.
+     * @state:  [IN/OUT] Pointer to (opaque) emulator state.
+     */
+    int (*blk)(
+        enum x86_segment seg,
+        unsigned long offset,
+        void *p_data,
+        unsigned int bytes,
+        uint32_t *eflags,
+        struct x86_emulate_state *state,
+        struct x86_emulate_ctxt *ctxt);
+
+    /*
      * validate: Post-decode, pre-emulate hook to allow caller controlled
      * filtering.
      */
@@ -793,6 +809,14 @@ x86_emul_rmw(
     unsigned int bytes,
     uint32_t *eflags,
     struct x86_emulate_state *state,
+    struct x86_emulate_ctxt *ctxt);
+int
+x86_emul_blk(
+    void *ptr,
+    void *data,
+    unsigned int bytes,
+    uint32_t *eflags,
+    struct x86_emulate_state *state,
     struct x86_emulate_ctxt *ctxt);
 
 static inline void x86_emul_hw_exception(
--- a/xen/include/asm-x86/cpufeature.h
+++ b/xen/include/asm-x86/cpufeature.h
@@ -120,6 +120,7 @@
 #define cpu_has_avx512_bitalg   boot_cpu_has(X86_FEATURE_AVX512_BITALG)
 #define cpu_has_avx512_vpopcntdq boot_cpu_has(X86_FEATURE_AVX512_VPOPCNTDQ)
 #define cpu_has_rdpid           boot_cpu_has(X86_FEATURE_RDPID)
+#define cpu_has_movdir64b       boot_cpu_has(X86_FEATURE_MOVDIR64B)
 
 /* CPUID level 0x80000007.edx */
 #define cpu_has_itsc            boot_cpu_has(X86_FEATURE_ITSC)
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -238,6 +238,7 @@ XEN_CPUFEATURE(AVX512_VPOPCNTDQ, 6*32+14
 XEN_CPUFEATURE(RDPID,         6*32+22) /*A  RDPID instruction */
 XEN_CPUFEATURE(CLDEMOTE,      6*32+25) /*A  CLDEMOTE instruction */
 XEN_CPUFEATURE(MOVDIRI,       6*32+27) /*A  MOVDIRI instruction */
+XEN_CPUFEATURE(MOVDIR64B,     6*32+28) /*A  MOVDIR64B instruction */
 
 /* AMD-defined CPU features, CPUID level 0x80000007.edx, word 7 */
 XEN_CPUFEATURE(ITSC,          7*32+ 8) /*   Invariant TSC */


