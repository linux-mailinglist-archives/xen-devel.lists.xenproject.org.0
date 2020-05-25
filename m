Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC3B1E1083
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2020 16:28:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdE5i-0008Du-JM; Mon, 25 May 2020 14:28:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MLe6=7H=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jdE5g-0008DM-D5
 for xen-devel@lists.xenproject.org; Mon, 25 May 2020 14:28:32 +0000
X-Inumbo-ID: 00e74cf2-9e94-11ea-aee4-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 00e74cf2-9e94-11ea-aee4-12813bfff9fa;
 Mon, 25 May 2020 14:28:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B3BB1B13D;
 Mon, 25 May 2020 14:28:31 +0000 (UTC)
Subject: [PATCH v10 5/9] x86emul: support MOVDIR{I,64B} insns
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d2375ecb-f662-99d8-84c2-e9f9c5cf7b9e@suse.com>
Message-ID: <ae7ff12a-edf9-45b5-b7c9-6c5b5d0739c0@suse.com>
Date: Mon, 25 May 2020 16:28:28 +0200
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

Introduce a new blk() hook, paralleling the rmw() one in a certain way,
but being intended for larger data sizes, and hence its HVM intermediate
handling function doesn't fall back to splitting the operation if the
requested virtual address can't be mapped.

Note that SDM revision 071 doesn't specify exception behavior for
ModRM.mod == 0b11; assuming #UD here.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Paul Durrant <paul@xen.org>
---
v10: Re-base over changes earlier in the series as well as later parts
     comitted already.
v9: Fold in "x86/HVM: make hvmemul_blk() capable of handling r/o
    operations". Also adjust x86_insn_is_mem_write().
v7: Add blk_NONE. Move  harness'es setting of .blk. Correct indentation.
    Re-base.
v6: Fold MOVDIRI and MOVDIR64B changes again. Use blk() for both. All
    tags dropped.
v5: Introduce/use ->blk() hook. Correct asm() operands.
v4: Split MOVDIRI and MOVDIR64B and move this one ahead. Re-base.
v3: Update description.
---
(SDE: -tnt)

--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -510,6 +510,8 @@ static const struct {
     /*{ 0xf6 }, { 2, 2 }, F, W }, wrss */
     { { 0xf6 }, { 2, 2 }, T, R, pfx_66 }, /* adcx */
     { { 0xf6 }, { 2, 2 }, T, R, pfx_f3 }, /* adox */
+    { { 0xf8 }, { 2, 2 }, F, W, pfx_66 }, /* movdir64b */
+    { { 0xf9 }, { 2, 2 }, F, W }, /* movdiri */
 };
 #undef CND
 #undef REG
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
@@ -721,6 +733,7 @@ static struct x86_emulate_ops emulops =
     .insn_fetch = fetch,
     .write      = write,
     .cmpxchg    = cmpxchg,
+    .blk        = blk,
     .read_segment = read_segment,
     .cpuid      = emul_test_cpuid,
     .read_cr    = emul_test_read_cr,
@@ -2339,6 +2352,50 @@ int main(int argc, char **argv)
         goto fail;
     printf("okay\n");
 
+    printf("%-40s", "Testing movdiri %edx,(%ecx)...");
+    if ( stack_exec && cpu_has_movdiri )
+    {
+        instr[0] = 0x0f; instr[1] = 0x38; instr[2] = 0xf9; instr[3] = 0x11;
+
+        regs.eip = (unsigned long)&instr[0];
+        regs.ecx = (unsigned long)memset(res, -1, 16);
+        regs.edx = 0x44332211;
+
+        rc = x86_emulate(&ctxt, &emulops);
+        if ( (rc != X86EMUL_OKAY) ||
+             (regs.eip != (unsigned long)&instr[4]) ||
+             res[0] != 0x44332211 || ~res[1] )
+            goto fail;
+        printf("okay\n");
+    }
+    else
+        printf("skipped\n");
+
+    printf("%-40s", "Testing movdir64b 144(%edx),%ecx...");
+    if ( stack_exec && cpu_has_movdir64b )
+    {
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
+    }
+    else
+        printf("skipped\n");
+
     printf("%-40s", "Testing movq %mm3,(%ecx)...");
     if ( stack_exec && cpu_has_mmx )
     {
--- a/tools/tests/x86_emulator/x86-emulate.h
+++ b/tools/tests/x86_emulator/x86-emulate.h
@@ -160,6 +160,8 @@ static inline bool xcr0_mask(uint64_t ma
 #define cpu_has_avx512_vnni (cp.feat.avx512_vnni && xcr0_mask(0xe6))
 #define cpu_has_avx512_bitalg (cp.feat.avx512_bitalg && xcr0_mask(0xe6))
 #define cpu_has_avx512_vpopcntdq (cp.feat.avx512_vpopcntdq && xcr0_mask(0xe6))
+#define cpu_has_movdiri    cp.feat.movdiri
+#define cpu_has_movdir64b  cp.feat.movdir64b
 #define cpu_has_avx512_4vnniw (cp.feat.avx512_4vnniw && xcr0_mask(0xe6))
 #define cpu_has_avx512_4fmaps (cp.feat.avx512_4fmaps && xcr0_mask(0xe6))
 #define cpu_has_serialize  cp.feat.serialize
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -47,6 +47,7 @@ $(call as-option-add,CFLAGS,CC,"rdseed %
 $(call as-option-add,CFLAGS,CC,"clwb (%rax)",-DHAVE_AS_CLWB)
 $(call as-option-add,CFLAGS,CC,".equ \"x\"$$(comma)1",-DHAVE_AS_QUOTED_SYM)
 $(call as-option-add,CFLAGS,CC,"invpcid (%rax)$$(comma)%rax",-DHAVE_AS_INVPCID)
+$(call as-option-add,CFLAGS,CC,"movdiri %rax$$(comma)(%rax)",-DHAVE_AS_MOVDIR)
 
 # GAS's idea of true is -1.  Clang's idea is 1
 $(call as-option-add,CFLAGS,CC,\
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -1441,6 +1441,47 @@ static int hvmemul_rmw(
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
+    uint32_t pfec = PFEC_page_present;
+    int rc;
+    void *mapping = NULL;
+
+    rc = hvmemul_virtual_to_linear(
+        seg, offset, bytes, NULL, hvm_access_write, hvmemul_ctxt, &addr);
+    if ( rc != X86EMUL_OKAY || !bytes )
+        return rc;
+
+    if ( x86_insn_is_mem_write(state, ctxt) )
+        pfec |= PFEC_write_access;
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
@@ -2518,6 +2559,7 @@ static const struct x86_emulate_ops hvm_
     .write         = hvmemul_write,
     .rmw           = hvmemul_rmw,
     .cmpxchg       = hvmemul_cmpxchg,
+    .blk           = hvmemul_blk,
     .validate      = hvmemul_validate,
     .rep_ins       = hvmemul_rep_ins,
     .rep_outs      = hvmemul_rep_outs,
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -548,6 +548,8 @@ static const struct ext0f38_table {
     [0xf1] = { .to_mem = 1, .two_op = 1 },
     [0xf2 ... 0xf3] = {},
     [0xf5 ... 0xf7] = {},
+    [0xf8] = { .simd_size = simd_other },
+    [0xf9] = { .to_mem = 1, .two_op = 1 /* Mov */ },
 };
 
 /* Shift values between src and dst sizes of pmov{s,z}x{b,w,d}{w,d,q}. */
@@ -851,6 +853,10 @@ struct x86_emulate_state {
         rmw_xchg,
         rmw_xor,
     } rmw;
+    enum {
+        blk_NONE,
+        blk_movdir,
+    } blk;
     uint8_t modrm, modrm_mod, modrm_reg, modrm_rm;
     uint8_t sib_index, sib_scale;
     uint8_t rex_prefix;
@@ -1915,6 +1921,8 @@ amd_like(const struct x86_emulate_ctxt *
 #define vcpu_has_avx512_vpopcntdq() (ctxt->cpuid->feat.avx512_vpopcntdq)
 #define vcpu_has_tsxldtrk()    (ctxt->cpuid->feat.tsxldtrk)
 #define vcpu_has_rdpid()       (ctxt->cpuid->feat.rdpid)
+#define vcpu_has_movdiri()     (ctxt->cpuid->feat.movdiri)
+#define vcpu_has_movdir64b()   (ctxt->cpuid->feat.movdir64b)
 #define vcpu_has_avx512_4vnniw() (ctxt->cpuid->feat.avx512_4vnniw)
 #define vcpu_has_avx512_4fmaps() (ctxt->cpuid->feat.avx512_4fmaps)
 #define vcpu_has_serialize()   (ctxt->cpuid->feat.serialize)
@@ -2736,10 +2744,12 @@ x86_decode_0f38(
     {
     case 0x00 ... 0xef:
     case 0xf2 ... 0xf5:
-    case 0xf7 ... 0xff:
+    case 0xf7 ... 0xf8:
+    case 0xfa ... 0xff:
         op_bytes = 0;
         /* fall through */
     case 0xf6: /* adcx / adox */
+    case 0xf9: /* movdiri */
         ctxt->opcode |= MASK_INSR(vex.pfx, X86EMUL_OPC_PFX_MASK);
         break;
 
@@ -10218,6 +10228,34 @@ x86_emulate(
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
+    case X86EMUL_OPC(0x0f38, 0xf9): /* movdiri mem,r */
+        host_and_vcpu_must_have(movdiri);
+        generate_exception_if(dst.type != OP_MEM, EXC_UD);
+        fail_if(!ops->blk);
+        state->blk = blk_movdir;
+        if ( (rc = ops->blk(dst.mem.seg, dst.mem.off, &src.val, op_bytes,
+                            &_regs.eflags, state, ctxt)) != X86EMUL_OKAY )
+            goto done;
+        dst.type = OP_NONE;
+        break;
+
 #ifndef X86EMUL_NO_SIMD
 
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x00): /* vpermq $imm8,ymm/m256,ymm */
@@ -11477,6 +11515,77 @@ int x86_emul_rmw(
     return X86EMUL_OKAY;
 }
 
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
+        switch ( bytes )
+        {
+#ifdef __x86_64__
+        case sizeof(uint32_t):
+# ifdef HAVE_AS_MOVDIR
+            asm ( "movdiri %0, (%1)"
+                  :: "r" (*(uint32_t *)data), "r" (ptr) : "memory" );
+# else
+            /* movdiri %esi, (%rdi) */
+            asm ( ".byte 0x0f, 0x38, 0xf9, 0x37"
+                  :: "S" (*(uint32_t *)data), "D" (ptr) : "memory" );
+# endif
+            break;
+#endif
+
+        case sizeof(unsigned long):
+#ifdef HAVE_AS_MOVDIR
+            asm ( "movdiri %0, (%1)"
+                  :: "r" (*(unsigned long *)data), "r" (ptr) : "memory" );
+#else
+            /* movdiri %rsi, (%rdi) */
+            asm ( ".byte 0x48, 0x0f, 0x38, 0xf9, 0x37"
+                  :: "S" (*(unsigned long *)data), "D" (ptr) : "memory" );
+#endif
+            break;
+
+        case 64:
+            if ( ((unsigned long)ptr & 0x3f) )
+            {
+                ASSERT_UNREACHABLE();
+                return X86EMUL_UNHANDLEABLE;
+            }
+#ifdef HAVE_AS_MOVDIR
+            asm ( "movdir64b (%0), %1" :: "r" (data), "r" (ptr) : "memory" );
+#else
+            /* movdir64b (%rsi), %rdi */
+            asm ( ".byte 0x66, 0x0f, 0x38, 0xf8, 0x3e"
+                  :: "S" (data), "D" (ptr) : "memory" );
+#endif
+            break;
+
+        default:
+            ASSERT_UNREACHABLE();
+            return X86EMUL_UNHANDLEABLE;
+        }
+        break;
+
+    default:
+        ASSERT_UNREACHABLE();
+        return X86EMUL_UNHANDLEABLE;
+    }
+
+    return X86EMUL_OKAY;
+}
+
 static void __init __maybe_unused build_assertions(void)
 {
     /* Check the values against SReg3 encoding in opcode/ModRM bytes. */
@@ -11759,6 +11868,9 @@ x86_insn_is_mem_write(const struct x86_e
         {
         case 0x63:                         /* ARPL */
             return !mode_64bit();
+
+        case X86EMUL_OPC_66(0x0f38, 0xf8): /* MOVDIR64B */
+            return true;
         }
 
         return false;
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
@@ -118,6 +118,8 @@
 #define cpu_has_avx512_bitalg   boot_cpu_has(X86_FEATURE_AVX512_BITALG)
 #define cpu_has_avx512_vpopcntdq boot_cpu_has(X86_FEATURE_AVX512_VPOPCNTDQ)
 #define cpu_has_rdpid           boot_cpu_has(X86_FEATURE_RDPID)
+#define cpu_has_movdiri         boot_cpu_has(X86_FEATURE_MOVDIRI)
+#define cpu_has_movdir64b       boot_cpu_has(X86_FEATURE_MOVDIR64B)
 
 /* CPUID level 0x80000007.edx */
 #define cpu_has_itsc            boot_cpu_has(X86_FEATURE_ITSC)
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -241,6 +241,8 @@ XEN_CPUFEATURE(AVX512_VPOPCNTDQ, 6*32+14
 XEN_CPUFEATURE(TSXLDTRK,      6*32+16) /*a  TSX load tracking suspend/resume insns */
 XEN_CPUFEATURE(RDPID,         6*32+22) /*A  RDPID instruction */
 XEN_CPUFEATURE(CLDEMOTE,      6*32+25) /*A  CLDEMOTE instruction */
+XEN_CPUFEATURE(MOVDIRI,       6*32+27) /*A  MOVDIRI instruction */
+XEN_CPUFEATURE(MOVDIR64B,     6*32+28) /*A  MOVDIR64B instruction */
 
 /* AMD-defined CPU features, CPUID level 0x80000007.edx, word 7 */
 XEN_CPUFEATURE(ITSC,          7*32+ 8) /*   Invariant TSC */


