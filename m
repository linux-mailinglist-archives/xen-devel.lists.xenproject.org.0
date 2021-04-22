Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E423682D2
	for <lists+xen-devel@lfdr.de>; Thu, 22 Apr 2021 16:55:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115554.220519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZajw-00068t-2l; Thu, 22 Apr 2021 14:55:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115554.220519; Thu, 22 Apr 2021 14:55:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZajv-00068Q-Vo; Thu, 22 Apr 2021 14:55:35 +0000
Received: by outflank-mailman (input) for mailman id 115554;
 Thu, 22 Apr 2021 14:55:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uib8=JT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZaju-000681-FZ
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 14:55:34 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d4822181-164a-43d5-9cf2-1d3d2045b90d;
 Thu, 22 Apr 2021 14:55:33 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D31C5ABB1;
 Thu, 22 Apr 2021 14:55:32 +0000 (UTC)
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
X-Inumbo-ID: d4822181-164a-43d5-9cf2-1d3d2045b90d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619103332; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8Q5FkhdLlmlc3eXCKxLrkqvoccRo5UNs3ZV3phIMfFs=;
	b=RI6y651llBkueekrHXf8xnzFGVhQkclhdphQZbybEakWNTkxa0s0SskApvdyJ073gLXfQ/
	ibmnVxiznO4QPFN0RqiYFRNjB8jBW0WoO8b5fgPsxWY1ysDMfZvbOyC77/b/10WAegArmb
	Xp/T/zC+pYVLm66IqQWfxmA4hMK17ts=
Subject: [PATCH v3 19/22] x86emul: support TILELOADD{,T1} and TILESTORE
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <322de6db-e01f-0b57-5777-5d94a13c441a@suse.com>
Message-ID: <fc272d90-9a3c-98e9-d811-ea9b70f89e22@suse.com>
Date: Thu, 22 Apr 2021 16:55:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <322de6db-e01f-0b57-5777-5d94a13c441a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

In order to be flexible about future growth of tile dimensions, use a
separately allocated scratch buffer to read/write individual rows of a
tile.

Note that the separate write_tilecfg() function is needed because
LDTILECFG wouldn't serve the purpose: It clears various state, unlike
XRSTOR / XRSTORC. To keep things simple, the test harness variant of it
leverages the state save/restore around library calls. To be sure the
actual data gets restored (and not init state put in place), any extra
override for the XSTATE_BV field is introduced.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: New.
---
TBD: ISA extensions document 043 doesn't clarify either way whether
     duplicate stores to the same (linear) memory ranges may get
     squashed by TILESTORED just like is documented for AVX-512
     scatters. For now similar behavior is assumed (or else
     hvm/emulate.c's respective checking would need altering, or we'd
     need to exit back to guest context after every individual row,
     albeit that would mean allowing interrupts to occur in the middle
     of an insn); an inquiry on the public forum [1] was left
     unanswered so far.

[1] https://community.intel.com/t5/Intel-ISA-Extensions/TILESTORED-to-overlapping-addresses/td-p/1226953

--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -1339,6 +1339,9 @@ static const struct vex {
     { { 0x49, 0x00 }, 2, F, W, pfx_66, W0, L0 }, /* sttilecfg */
     { { 0x49, 0xc0 }, 2, F, N, pfx_no, W0, L0 }, /* tilerelease */
     { { 0x49, 0xc0 }, 2, F, N, pfx_f2, W0, L0 }, /* tilezero */
+    { { 0x4b, VSIB(0) }, 3, F, R, pfx_66, W0, L0 }, /* tileloaddt1 */
+    { { 0x4b, VSIB(0) }, 3, F, W, pfx_f3, W0, L0 }, /* tilestored */
+    { { 0x4b, VSIB(0) }, 3, F, R, pfx_f2, W0, L0 }, /* tileloadd */
     { { 0x50 }, 2, T, R, pfx_66, W0, Ln }, /* vpdpbusd */
     { { 0x51 }, 2, T, R, pfx_66, W0, Ln }, /* vpdpbusds */
     { { 0x52 }, 2, T, R, pfx_66, W0, Ln }, /* vpdpwssd */
--- a/tools/tests/x86_emulator/x86-emulate.c
+++ b/tools/tests/x86_emulator/x86-emulate.c
@@ -35,6 +35,8 @@ struct cpuid_policy cp;
 
 static char fpu_save_area[0x4000] __attribute__((__aligned__((64))));
 static bool use_xsave;
+/* This will get OR-ed into xstate_bv prior to restoring state. */
+static uint64_t xstate_bv_or_mask;
 
 /*
  * Re-use the area above also as scratch space for the emulator itself.
@@ -57,13 +59,19 @@ void emul_restore_fpu_state(void)
 {
     /* Older gcc can't deal with "m" array inputs; make them outputs instead. */
     if ( use_xsave )
+    {
+        *(uint64_t *)&fpu_save_area[0x200] |= xstate_bv_or_mask;
+        xstate_bv_or_mask = 0;
         asm volatile ( "xrstor %[ptr]"
                        : [ptr] "+m" (fpu_save_area)
                        : "a" (~0ul), "d" (~0ul) );
+    }
     else
         asm volatile ( "fxrstor %0" : "+m" (fpu_save_area) );
 }
 
+static void *tile_row;
+
 bool emul_test_init(void)
 {
     union {
@@ -121,6 +129,19 @@ bool emul_test_init(void)
     if ( fxs->mxcsr_mask )
         mxcsr_mask = fxs->mxcsr_mask;
 
+    if ( cpu_has_amx_tile )
+    {
+        unsigned int i, max_bytes = 0;
+
+        for ( i = 1; i <= cp.tile.max_palette; ++i )
+            if ( cp.tile.palette[i].bytes_per_row > max_bytes )
+                max_bytes = cp.tile.palette[i].bytes_per_row;
+
+        if ( !cp.xstate.comp[X86_XCR0_TILECFG_POS].offset ||
+             !max_bytes || !(tile_row = malloc(max_bytes)) )
+            cp.feat.amx_tile = false;
+    }
+
     /*
      * Mark the entire stack executable so that the stub executions
      * don't fault
@@ -263,4 +284,22 @@ void emul_test_put_fpu(
     /* TBD */
 }
 
+static void *get_tile_row_buf(void)
+{
+    return tile_row;
+}
+
+WRAPPER(memcpy);
+
+static void write_tilecfg(const struct x86_tilecfg *tilecfg)
+{
+    /*
+     * Leverage the fact that the wrapper (saves and) restores all extended
+     * state around the actual library call.
+     */
+    xstate_bv_or_mask = X86_XCR0_TILECFG;
+    emul_memcpy(fpu_save_area + cp.xstate.comp[X86_XCR0_TILECFG_POS].offset,
+                tilecfg, sizeof(*tilecfg));
+}
+
 #include "x86_emulate/x86_emulate.c"
--- a/tools/tests/x86_emulator/x86-emulate.h
+++ b/tools/tests/x86_emulator/x86-emulate.h
@@ -98,8 +98,9 @@ void emul_restore_fpu_state(void);
 # if 0 /* This only works for explicit calls, not for compiler generated ones. */
 #  define WRAP(x) typeof(x) x asm("emul_" #x)
 # else
-# define WRAP(x) asm(".equ " #x ", emul_" #x)
+#  define WRAP(x) asm(".equ " #x ", emul_" #x)
 # endif
+# define WRAPPER(x) typeof(x) emul_##x
 #endif
 
 WRAP(fwrite);
--- a/xen/arch/x86/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate.c
@@ -9,6 +9,7 @@
  *    Keir Fraser <keir@xen.org>
  */
 
+#include <xen/cpu.h>
 #include <xen/domain_page.h>
 #include <xen/err.h>
 #include <xen/event.h>
@@ -52,6 +53,71 @@
 # define X86EMUL_NO_SIMD
 #endif
 
+#ifndef X86EMUL_NO_SIMD
+
+static DEFINE_PER_CPU_READ_MOSTLY(void *, tile_row);
+static unsigned int __read_mostly tile_row_max_bytes;
+
+static int amx_cpu_init(struct notifier_block *nfb,
+                        unsigned long action, void *hcpu)
+{
+    int rc = 0;
+    void **prow = &per_cpu(tile_row, (unsigned long)hcpu);
+
+    switch ( action )
+    {
+    case CPU_UP_PREPARE:
+        *prow = xmalloc_array(uint8_t, tile_row_max_bytes);
+        if ( !*prow )
+            rc = -ENOMEM;
+        break;
+
+    case CPU_UP_CANCELED:
+    case CPU_DEAD:
+        XFREE(*prow);
+        break;
+    }
+
+    return !rc ? NOTIFY_DONE : notifier_from_errno(rc);
+}
+
+static struct notifier_block amx_cpu_nfb = {
+    .notifier_call = amx_cpu_init,
+};
+
+static int __init amx_init(void)
+{
+    const struct cpuid_policy *p = &host_cpuid_policy;
+    unsigned int i;
+
+    if ( !cpu_has_amx_tile )
+        return 0;
+
+    for ( i = 1; i <= p->tile.max_palette; ++i )
+        if ( p->tile.palette[i].bytes_per_row > tile_row_max_bytes )
+            tile_row_max_bytes = p->tile.palette[i].bytes_per_row;
+
+    if ( !tile_row_max_bytes )
+    {
+        setup_clear_cpu_cap(X86_FEATURE_AMX_TILE);
+        return 0;
+    }
+
+    amx_cpu_init(&amx_cpu_nfb, CPU_UP_PREPARE,
+                 (void *)(unsigned long)smp_processor_id());
+    register_cpu_notifier(&amx_cpu_nfb);
+
+    return 0;
+}
+presmp_initcall(amx_init);
+
+static void *get_tile_row_buf(void)
+{
+    return this_cpu(tile_row);
+}
+
+#endif /* X86EMUL_NO_SIMD */
+
 #include "x86_emulate/x86_emulate.c"
 
 int x86emul_read_xcr(unsigned int reg, uint64_t *val,
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -476,6 +476,7 @@ static const struct ext0f38_table {
     [0x44] = { .simd_size = simd_packed_int, .two_op = 1, .d8s = d8s_vl },
     [0x45 ... 0x47] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
     [0x49] = { .simd_size = simd_other, .two_op = 1 },
+    [0x4b] = { .simd_size = simd_other, .two_op = 1, .vsib = 1 },
     [0x4c] = { .simd_size = simd_packed_fp, .two_op = 1, .d8s = d8s_vl },
     [0x4d] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
     [0x4e] = { .simd_size = simd_packed_fp, .two_op = 1, .d8s = d8s_vl },
@@ -2882,6 +2883,7 @@ x86_decode_0f38(
         break;
 
     case X86EMUL_OPC_VEX_66(0, 0x49): /* sttilecfg */
+    case X86EMUL_OPC_VEX_F3(0, 0x4b): /* tilestored */
         state->desc = DstMem | SrcImplicit | Mov;
         break;
 
@@ -9632,6 +9634,99 @@ x86_emulate(
         }
         goto unrecognized_insn;
 
+    case X86EMUL_OPC_VEX_66(0x0f38, 0x4b): /* tileloaddt1 mem,tmm */
+    case X86EMUL_OPC_VEX_F3(0x0f38, 0x4b): /* tilestored tmm,mem */
+    case X86EMUL_OPC_VEX_F2(0x0f38, 0x4b): /* tileloadd mem,tmm */
+    {
+        struct x86_tilecfg *cfg = &mmvalp->tilecfg;
+        void *row;
+
+        generate_exception_if(!mode_64bit() || vex.l || vex.w || vex.reg != 0xf,
+                              EXC_UD);
+        host_and_vcpu_must_have(amx_tile);
+        get_fpu(X86EMUL_FPU_tile);
+        sttilecfg(cfg);
+        generate_exception_if(!tiles_configured(cfg), EXC_UD);
+        generate_exception_if(!tile_valid(modrm_reg, cfg), EXC_UD);
+        generate_exception_if(cfg->colsb[modrm_reg] & 3, EXC_UD);
+        i = cfg->start_row;
+        n = cfg->rows[modrm_reg];
+        generate_exception_if(i >= n, EXC_UD);
+
+        /* Calculate stride. */
+        if ( state->sib_index != 4 )
+            ea.val = truncate_ea(*decode_gpr(state->regs,
+                                             state->sib_index) <<
+                                 state->sib_scale);
+
+        if ( vex.pfx == vex_f3 )
+        {
+            /*
+             * hvmemul_linear_mmio_access() will find a cache slot based on
+             * linear address. hvmemul_phys_mmio_access() will crash the
+             * domain if observing varying data getting written to the same
+             * cache slot. Assume that squashing earlier writes to fully
+             * overlapping addresses is permitted (like for AVX-512 scatters).
+             */
+            if ( !ea.val )
+                i = n - 1;
+            else if ( !(ea.val &
+                        ((1ul << ((ad_bytes - sizeof(*cfg->rows)) * 8)) - 1)) )
+            {
+                unsigned int clr = __builtin_ffsl(ea.val) - 1;
+                unsigned int iter = 1u << (ad_bytes * 8 - clr);
+
+                if ( iter < n - i )
+                    i = n - iter;
+            }
+        }
+
+        row = get_tile_row_buf();
+        memset(row, -1,
+               ctxt->cpuid->tile.palette[cfg->palette].bytes_per_row);
+
+        /* Set up stub. */
+        opc = init_prefixes(stub);
+        opc[0] = b;
+        /* Convert memory operand to (%rax,%riz,1) */
+        vex.b = 1;
+        vex.x = 1;
+        opc[1] = modrm & 0x3f;
+        opc[2] = 0x20;
+        opc[3] = 0xc3;
+        copy_VEX(opc, vex);
+
+        do {
+            /* Limit rows to just as many to cover the next one to access. */
+            cfg->start_row = i;
+            cfg->rows[modrm_reg] = i + 1;
+            write_tilecfg(cfg);
+
+            if ( vex.pfx != vex_f3 )
+                rc = ops->read(ea.mem.seg,
+                               truncate_ea(ea.mem.off + i * ea.val),
+                               row, cfg->colsb[modrm_reg], ctxt);
+
+            invoke_stub("", "", "=m" (dummy) : "a" (row));
+
+            if ( vex.pfx == vex_f3 )
+                rc = ops->write(ea.mem.seg,
+                                truncate_ea(ea.mem.off + i * ea.val),
+                                row, cfg->colsb[modrm_reg], ctxt);
+        } while ( rc == X86EMUL_OKAY && ++i < n );
+
+        put_stub(stub);
+
+        if ( rc == X86EMUL_OKAY )
+            cfg->start_row = 0;
+        cfg->rows[modrm_reg] = n;
+        write_tilecfg(cfg);
+
+        state->simd_size = simd_none;
+        dst.type = OP_NONE;
+        break;
+    }
+
     case X86EMUL_OPC_VEX_66(0x0f38, 0x50): /* vpdpbusd [xy]mm/mem,[xy]mm,[xy]mm */
     case X86EMUL_OPC_VEX_66(0x0f38, 0x51): /* vpdpbusds [xy]mm/mem,[xy]mm,[xy]mm */
     case X86EMUL_OPC_VEX_66(0x0f38, 0x52): /* vpdpwssd [xy]mm/mem,[xy]mm,[xy]mm */
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -16,6 +16,7 @@
 #include <asm/i387.h>
 #include <asm/xstate.h>
 #include <asm/asm_defns.h>
+#include <asm/x86-types.h>
 
 /*
  * Maximum size (in byte) of the XSAVE/XRSTOR save area required by all
@@ -840,6 +841,37 @@ uint64_t read_bndcfgu(void)
     return xstate->xsave_hdr.xstate_bv & X86_XCR0_BNDCSR ? bndcsr->bndcfgu : 0;
 }
 
+void write_tilecfg(const struct x86_tilecfg *tilecfg)
+{
+    unsigned long cr0 = read_cr0();
+    struct xsave_struct *xstate
+        = idle_vcpu[smp_processor_id()]->arch.xsave_area;
+
+    ASSERT(cpu_has_amx_tile);
+    clts();
+
+    memset(&xstate->xsave_hdr, 0, sizeof(xstate->xsave_hdr));
+    xstate->xsave_hdr.xstate_bv = X86_XCR0_TILECFG;
+
+    if ( cpu_has_xsavec )
+    {
+        xstate->xsave_hdr.xcomp_bv = XSTATE_COMPACTION_ENABLED |
+                                     X86_XCR0_TILECFG;
+
+        memcpy(xstate + 1, tilecfg, sizeof(*tilecfg));
+    }
+    else
+        memcpy((void *)xstate + xstate_offset(X86_XCR0_TILECFG_POS),
+               tilecfg, sizeof(*tilecfg));
+
+    asm volatile ( ".byte 0x0f,0xae,0x2f\n" /* xrstor */
+                   :: "m" (*xstate), "D" (xstate),
+                      "a" (X86_XCR0_TILECFG), "d" (0) );
+
+    if ( cr0 & X86_CR0_TS )
+        write_cr0(cr0);
+}
+
 void xstate_set_init(uint64_t mask)
 {
     unsigned long cr0 = read_cr0();
--- a/xen/include/asm-x86/xstate.h
+++ b/xen/include/asm-x86/xstate.h
@@ -93,6 +93,8 @@ uint64_t get_xcr0(void);
 void set_msr_xss(u64 xss);
 uint64_t get_msr_xss(void);
 uint64_t read_bndcfgu(void);
+struct x86_tilecfg;
+void write_tilecfg(const struct x86_tilecfg *tilecfg);
 void xsave(struct vcpu *v, uint64_t mask);
 void xrstor(struct vcpu *v, uint64_t mask);
 void xstate_set_init(uint64_t mask);


