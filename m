Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 060A63682CD
	for <lists+xen-devel@lfdr.de>; Thu, 22 Apr 2021 16:54:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115541.220480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZait-0005nL-59; Thu, 22 Apr 2021 14:54:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115541.220480; Thu, 22 Apr 2021 14:54:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZais-0005m8-VZ; Thu, 22 Apr 2021 14:54:30 +0000
Received: by outflank-mailman (input) for mailman id 115541;
 Thu, 22 Apr 2021 14:54:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uib8=JT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZair-0005lu-5y
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 14:54:29 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ba76b396-f023-4d94-ad33-6ee5470be853;
 Thu, 22 Apr 2021 14:54:27 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 29A56AEC6;
 Thu, 22 Apr 2021 14:54:27 +0000 (UTC)
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
X-Inumbo-ID: ba76b396-f023-4d94-ad33-6ee5470be853
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619103267; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hH9PSsalwPjUONIbbOKjEItk1Fxab7kog6ux7w948mE=;
	b=thTtqfwvMmd1dLsc11sQSY7GZ7y6SwDLiyQ3dqx602i/a7p6Q1l1++V40QmVpSgqT4djRa
	OfrzfMLo7m+S0LQs5LoLbR9JkBQsWSGjBo3/aE+RDcumHOLhYaAM+L+Ty1RxdbshCSHwiZ
	VH3LpMmRNJ5mHCkm5o8nFY9D2S7qgck=
Subject: [PATCH v3 17/22] x86emul: support {LD,ST}TILECFG
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <322de6db-e01f-0b57-5777-5d94a13c441a@suse.com>
Message-ID: <bfbd5893-d670-42e5-613d-0f7790f19f5c@suse.com>
Date: Thu, 22 Apr 2021 16:54:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <322de6db-e01f-0b57-5777-5d94a13c441a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

While ver 043 of the ISA extensions doc also specifies
xcr0_supports_palette() returning false as one of the #GP(0) reasons for
LDTILECFG, the earlier #UD / #GP conditions look to make this fully
dead.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: Rebase over struct x86_tilecfg introduction.
v2: New.
---
SDE: -spr

--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -1335,6 +1335,8 @@ static const struct vex {
     { { 0x45 }, 2, T, R, pfx_66, Wn, Ln }, /* vpsrlv{d,q} */
     { { 0x46 }, 2, T, R, pfx_66, W0, Ln }, /* vpsravd */
     { { 0x47 }, 2, T, R, pfx_66, Wn, Ln }, /* vpsllv{d,q} */
+    { { 0x49, 0x00 }, 2, F, R, pfx_no, W0, L0 }, /* ldtilecfg */
+    { { 0x49, 0x00 }, 2, F, W, pfx_66, W0, L0 }, /* sttilecfg */
     { { 0x49, 0xc0 }, 2, F, N, pfx_no, W0, L0 }, /* tilerelease */
     { { 0x50 }, 2, T, R, pfx_66, W0, Ln }, /* vpdpbusd */
     { { 0x51 }, 2, T, R, pfx_66, W0, Ln }, /* vpdpbusds */
--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -898,6 +898,11 @@ int main(int argc, char **argv)
     int rc;
 #ifdef __x86_64__
     unsigned int vendor_native;
+    static const struct x86_tilecfg tilecfg = {
+        .palette = 1,
+        .colsb = { 2, 4, 5, 3 },
+        .rows = { 2, 4, 3, 5 },
+    };
 #else
     unsigned int bcdres_native, bcdres_emul;
 #endif
@@ -4463,6 +4468,74 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
 #ifdef __x86_64__
+    printf("%-40s", "Testing tilerelease;sttilecfg 4(%rcx)...");
+    if ( stack_exec && cpu_has_amx_tile )
+    {
+        decl_insn(tilerelease);
+
+        asm volatile ( put_insn(tilerelease,
+                                /* tilerelease */
+                                ".byte 0xC4, 0xE2, 0x78, 0x49, 0xC0;"
+                                /* sttilecfg 4(%0) */
+                                ".byte 0xC4, 0xE2, 0x79, 0x49, 0x41, 0x04")
+                                :: "c" (NULL) );
+
+        memset(res, ~0, 72);
+        set_insn(tilerelease);
+        regs.ecx = (unsigned long)res;
+        rc = x86_emulate(&ctxt, &emulops);
+        if ( rc == X86EMUL_OKAY )
+            rc = x86_emulate(&ctxt, &emulops);
+        if ( rc != X86EMUL_OKAY || !check_eip(tilerelease) ||
+             ~res[0] || ~res[17] || memchr_inv(res + 1, 0, 64) )
+            goto fail;
+        printf("okay\n");
+    }
+    else
+        printf("skipped\n");
+
+    printf("%-40s", "Testing ldtilecfg (%rdx)...");
+    if ( stack_exec && cpu_has_amx_tile )
+    {
+        decl_insn(ldtilecfg);
+
+        asm volatile ( put_insn(ldtilecfg,
+                                /* ldtilecfg (%0) */
+                                ".byte 0xC4, 0xE2, 0x78, 0x49, 0x02")
+                                :: "d" (NULL) );
+
+        set_insn(ldtilecfg);
+        regs.edx = (unsigned long)&tilecfg;
+        rc = x86_emulate(&ctxt, &emulops);
+        if ( rc != X86EMUL_OKAY || !check_eip(ldtilecfg) )
+            goto fail;
+        printf("pending\n");
+    }
+    else
+        printf("skipped\n");
+
+    printf("%-40s", "Testing sttilecfg -4(%rcx)...");
+    if ( stack_exec && cpu_has_amx_tile )
+    {
+        decl_insn(sttilecfg);
+
+        asm volatile ( put_insn(sttilecfg,
+                                /* sttilecfg -4(%0) */
+                                ".byte 0xC4, 0xE2, 0x79, 0x49, 0x41, 0xFC")
+                                :: "c" (NULL) );
+
+        memset(res, ~0, 72);
+        set_insn(sttilecfg);
+        regs.ecx = (unsigned long)(res + 2);
+        rc = x86_emulate(&ctxt, &emulops);
+        if ( rc != X86EMUL_OKAY || !check_eip(sttilecfg) ||
+             ~res[0] || ~res[17] || memcmp(res + 1, &tilecfg, 64) )
+            goto fail;
+        printf("okay\n");
+    }
+    else
+        printf("skipped\n");
+
     printf("%-40s", "Testing vzeroupper (compat)...");
     if ( cpu_has_avx )
     {
--- a/tools/tests/x86_emulator/x86-emulate.h
+++ b/tools/tests/x86_emulator/x86-emulate.h
@@ -68,6 +68,17 @@
 
 #define is_canonical_address(x) (((int64_t)(x) >> 47) == ((int64_t)(x) >> 63))
 
+static inline void *memchr_inv(const void *s, int c, size_t n)
+{
+    const unsigned char *p = s;
+
+    while ( n-- )
+        if ( (unsigned char)c != *p++ )
+            return (void *)(p - 1);
+
+    return NULL;
+}
+
 extern uint32_t mxcsr_mask;
 extern struct cpuid_policy cp;
 
@@ -171,6 +182,8 @@ static inline bool xcr0_mask(uint64_t ma
 #define cpu_has_avx512_4fmaps (cp.feat.avx512_4fmaps && xcr0_mask(0xe6))
 #define cpu_has_avx512_vp2intersect (cp.feat.avx512_vp2intersect && xcr0_mask(0xe6))
 #define cpu_has_serialize  cp.feat.serialize
+#define cpu_has_amx_tile   (cp.feat.amx_tile && \
+                            xcr0_mask(X86_XCR0_TILECFG | X86_XCR0_TILEDATA))
 #define cpu_has_avx_vnni   (cp.feat.avx_vnni && xcr0_mask(6))
 #define cpu_has_avx512_bf16 (cp.feat.avx512_bf16 && xcr0_mask(0xe6))
 
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -957,6 +957,7 @@ typedef union {
     uint64_t __attribute__ ((aligned(16))) xmm[2];
     uint64_t __attribute__ ((aligned(32))) ymm[4];
     uint64_t __attribute__ ((aligned(64))) zmm[8];
+    struct x86_tilecfg tilecfg;
     uint32_t data32[16];
 } mmval_t;
 
@@ -2880,6 +2881,10 @@ x86_decode_0f38(
         state->simd_size = simd_scalar_vexw;
         break;
 
+    case X86EMUL_OPC_VEX_66(0, 0x49): /* sttilecfg */
+        state->desc = DstMem | SrcImplicit | Mov;
+        break;
+
     case X86EMUL_OPC_EVEX_66(0, 0x7a): /* vpbroadcastb */
     case X86EMUL_OPC_EVEX_66(0, 0x7b): /* vpbroadcastw */
     case X86EMUL_OPC_EVEX_66(0, 0x7c): /* vpbroadcast{d,q} */
@@ -9518,7 +9523,66 @@ x86_emulate(
                 goto unrecognized_insn;
             }
         }
-        goto unimplemented_insn;
+
+        switch ( modrm_reg & 7 )
+        {
+        case 0: /* ldtilecfg mem */
+            generate_exception_if(vex.reg != 0xf, EXC_UD);
+            host_and_vcpu_must_have(amx_tile);
+            get_fpu(X86EMUL_FPU_tilecfg);
+            rc = ops->read(ea.mem.seg, ea.mem.off, mmvalp, 64, ctxt);
+            if ( rc != X86EMUL_OKAY )
+                goto done;
+            generate_exception_if((mmvalp->tilecfg.palette >
+                                   ctxt->cpuid->tile.max_palette),
+                                  EXC_GP, 0);
+            if ( mmvalp->tilecfg.palette )
+            {
+                const typeof(*ctxt->cpuid->tile.palette) *palette;
+
+                generate_exception_if(memchr_inv(mmvalp->tilecfg.res, 0,
+                                                 sizeof(mmvalp->tilecfg.res)),
+                                      EXC_GP, 0);
+
+                /*
+                 * Parameters for valid registers must be within bounds, or
+                 * both be zero at the same time.
+                 */
+                palette = &ctxt->cpuid->tile.palette[mmvalp->tilecfg.palette];
+                for ( i = 0; i < palette->num_regs; ++i )
+                    generate_exception_if(((mmvalp->tilecfg.colsb[i] >
+                                            palette->bytes_per_row) ||
+                                           (mmvalp->tilecfg.rows[i] >
+                                            palette->max_rows) ||
+                                           (!mmvalp->tilecfg.colsb[i] !=
+                                            !mmvalp->tilecfg.rows[i])),
+                                          EXC_GP, 0);
+
+                /* All remaining entries must be zero. */
+                for ( ; i < 16; ++i )
+                    generate_exception_if((mmvalp->tilecfg.colsb[i] ||
+                                           mmvalp->tilecfg.rows[i]),
+                                          EXC_GP, 0);
+            }
+            op_bytes = 64;
+            goto simd_0f_common;
+        }
+        goto unrecognized_insn;
+
+    case X86EMUL_OPC_VEX_66(0x0f38, 0x49):
+        generate_exception_if(!mode_64bit() || vex.l || vex.w, EXC_UD);
+        if ( ea.type == OP_REG )
+            goto unrecognized_insn;
+
+        switch ( modrm_reg & 7 )
+        {
+        case 0: /* sttilecfg mem */
+            host_and_vcpu_must_have(amx_tile);
+            get_fpu(X86EMUL_FPU_tilecfg);
+            op_bytes = 64;
+            goto simd_0f_common;
+        }
+        goto unrecognized_insn;
 
     case X86EMUL_OPC_VEX_66(0x0f38, 0x50): /* vpdpbusd [xy]mm/mem,[xy]mm,[xy]mm */
     case X86EMUL_OPC_VEX_66(0x0f38, 0x51): /* vpdpbusds [xy]mm/mem,[xy]mm,[xy]mm */


