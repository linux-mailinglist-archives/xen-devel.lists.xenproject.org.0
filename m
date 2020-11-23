Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 945952C0D9D
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 15:37:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34558.65692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khCxl-0001SX-GN; Mon, 23 Nov 2020 14:37:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34558.65692; Mon, 23 Nov 2020 14:37:05 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khCxl-0001S7-Cn; Mon, 23 Nov 2020 14:37:05 +0000
Received: by outflank-mailman (input) for mailman id 34558;
 Mon, 23 Nov 2020 14:37:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khCxk-0001S2-DU
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 14:37:04 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f6836569-30e1-4496-bef1-0b7b2567b3f6;
 Mon, 23 Nov 2020 14:37:03 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6769AAD1E;
 Mon, 23 Nov 2020 14:37:02 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khCxk-0001S2-DU
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 14:37:04 +0000
X-Inumbo-ID: f6836569-30e1-4496-bef1-0b7b2567b3f6
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id f6836569-30e1-4496-bef1-0b7b2567b3f6;
	Mon, 23 Nov 2020 14:37:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606142222; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5oy8cDRDAJz5j/V8PTEeRrB9FvSG2sdhoCKudh+oRWk=;
	b=EtCE+v8PnSPfcTbvFkK/x8NivyV4ijk+LCq9YRH/DGAlzG/XN1dSz4f6bagw6diqex9B1V
	frJ748136zv9LBo53esfod8TWvqXk+W4Q314nbBGdyEuqgxGnrlFvlD9e3XKDEqOlR0w6x
	3Wegc4g58syJ5/n+/Q4NfVpnXSKiF2M=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 6769AAD1E;
	Mon, 23 Nov 2020 14:37:02 +0000 (UTC)
Subject: [PATCH v2 17/17] x86emul: support {LD,ST}TILECFG
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <255f466c-3c95-88c5-3e55-0f04c9ae1b12@suse.com>
Message-ID: <9e10e975-7a5a-8ac9-219f-ebc9a5e373ee@suse.com>
Date: Mon, 23 Nov 2020 15:37:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <255f466c-3c95-88c5-3e55-0f04c9ae1b12@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

While ver 041 of the ISA extensions doc also specifies
xcr0_supports_palette() returning false as one of the #GP(0) reasons for
LDTILECFG, the earlier #UD conditions look to make this fully dead.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
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
@@ -898,6 +898,16 @@ int main(int argc, char **argv)
     int rc;
 #ifdef __x86_64__
     unsigned int vendor_native;
+    static const struct {
+        uint8_t palette, start_row;
+        uint8_t res[14];
+        uint16_t colsb[16];
+        uint8_t rows[16];
+    } tilecfg = {
+        .palette = 1,
+        .colsb = { 2, 4, 5, 3 },
+        .rows = { 2, 4, 3, 5 },
+    };
 #else
     unsigned int bcdres_native, bcdres_emul;
 #endif
@@ -4463,6 +4473,74 @@ int main(int argc, char **argv)
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
+                                /* sttilecfg 4(%0) */
+                                ".byte 0xC4, 0xE2, 0x79, 0x49, 0x41, 0xfc")
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
@@ -67,6 +67,17 @@
 
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
 
@@ -170,6 +181,8 @@ static inline bool xcr0_mask(uint64_t ma
 #define cpu_has_avx512_4fmaps (cp.feat.avx512_4fmaps && xcr0_mask(0xe6))
 #define cpu_has_avx512_vp2intersect (cp.feat.avx512_vp2intersect && xcr0_mask(0xe6))
 #define cpu_has_serialize  cp.feat.serialize
+#define cpu_has_amx_tile   (cp.feat.amx_tile && \
+                            xcr0_mask(X86_XCR0_TILECFG | X86_XCR0_TILEDATA))
 #define cpu_has_avx_vnni   (cp.feat.avx_vnni && xcr0_mask(6))
 #define cpu_has_avx512_bf16 (cp.feat.avx512_bf16 && xcr0_mask(0xe6))
 
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -957,6 +957,12 @@ typedef union {
     uint64_t __attribute__ ((aligned(16))) xmm[2];
     uint64_t __attribute__ ((aligned(32))) ymm[4];
     uint64_t __attribute__ ((aligned(64))) zmm[8];
+    struct {
+        uint8_t palette, start_row;
+        uint8_t res[14];
+        uint16_t colsb[16];
+        uint8_t rows[16];
+    } tilecfg;
     uint32_t data32[16];
 } mmval_t;
 
@@ -2848,6 +2854,10 @@ x86_decode_0f38(
         state->simd_size = simd_scalar_vexw;
         break;
 
+    case X86EMUL_OPC_VEX_66(0, 0x49): /* sttilecfg */
+        state->desc = DstMem | SrcImplicit | Mov;
+        break;
+
     case X86EMUL_OPC_EVEX_66(0, 0x7a): /* vpbroadcastb */
     case X86EMUL_OPC_EVEX_66(0, 0x7b): /* vpbroadcastw */
     case X86EMUL_OPC_EVEX_66(0, 0x7c): /* vpbroadcast{d,q} */
@@ -9478,7 +9488,66 @@ x86_emulate(
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
+            get_fpu(X86EMUL_FPU_tile);
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
+            get_fpu(X86EMUL_FPU_tile);
+            op_bytes = 64;
+            goto simd_0f_common;
+        }
+        goto unrecognized_insn;
 
     case X86EMUL_OPC_VEX_66(0x0f38, 0x50): /* vpdpbusd [xy]mm/mem,[xy]mm,[xy]mm */
     case X86EMUL_OPC_VEX_66(0x0f38, 0x51): /* vpdpbusds [xy]mm/mem,[xy]mm,[xy]mm */


