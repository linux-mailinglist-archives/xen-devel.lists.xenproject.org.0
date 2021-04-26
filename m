Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFC536B35C
	for <lists+xen-devel@lfdr.de>; Mon, 26 Apr 2021 14:46:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.117617.223537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lb0cc-0000q8-L7; Mon, 26 Apr 2021 12:45:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 117617.223537; Mon, 26 Apr 2021 12:45:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lb0cc-0000pi-Gl; Mon, 26 Apr 2021 12:45:54 +0000
Received: by outflank-mailman (input) for mailman id 117617;
 Mon, 26 Apr 2021 12:45:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rjXZ=JX=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lb0ca-0000pd-OY
 for xen-devel@lists.xenproject.org; Mon, 26 Apr 2021 12:45:52 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id daf02e7f-7fd6-453d-992a-8e0288d52f8a;
 Mon, 26 Apr 2021 12:45:45 +0000 (UTC)
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
X-Inumbo-ID: daf02e7f-7fd6-453d-992a-8e0288d52f8a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619441145;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=iuzlso4pBC+TdOlXUDjNTwBIVsTCvj5+Vrzx6ippOp8=;
  b=djFn0uVpl2GCiY5k2iU2w6XrcmTewfk6Fm7Qok1MAFd122FkGVDmF9d5
   AN+25Ez46lwNloYriELVwCMUREW1AFH6kljkD+RAOrye6z7n6NqqjCi9v
   RGrvuLAsjLvtdV8MB/K2IDd0r0urCnRsGkwpYydfrv9iIeMlPXRsd1gST
   Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Stay24yxzxFeQLWaerg5VHIFgtIxDx842leqzcXLhOdubOtSsjfF9tjvxKo8IuBAs4LvqJnO36
 KsZ4LzxFa9Io6YzgKhp6LAzjPUJ3kzoe9EXmMWXKFJyCQiZFIA5kE7vSSqK6DM3QJ3GjjhkbQk
 p0Z4DC62O289vkORh6kqJEUGGZzOq7WdSQ5UAxBGICQeXhJE5U+67EqDA+Puco1P1KCQNFeJe0
 Fl5EIAEFQctcDHo3D43DrfLho+mXqkViYomwCTpmI4YRARSQUkwkPGNT3PZbNRkmbVr35g119/
 JNM=
X-SBRS: 4.0
X-MesageID: 42521308
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:t0zDoaoYRP9VGNb49kpVDeAaV5vXL9V00zAX/kB9WHVpW+STnc
 y2gbA/3Rj7lD4eVBgb6Le9EYOHRm7R8oMwxIEXM6urUgWOghrPEKhJ64z+zzr8XxDv7+I179
 YQT4FSAMD9ZGIK7vrSzxK/F78brOWv0KftvuvGymcocAcCUdAF0y5cKiK2VnJ7XxNHA51RLu
 vt2uNiqyC7cXoaKuSXb0N1PdTrnNHAmJL4bRNuPXdOg2PisRqS5LH3CBSe1BsFOgk/pIsKy3
 TPkADy+8yY3c2T9x7G22ffq7RQldfxo+EiOOWwi9MYIjiptwCwZI4JYdy/lQ0yydvB1H8a1P
 PLpAotONk20XnYeWa4rHLWqnrd+Qdrz0Wn6FeDxVP/vMTyRVsBerN8rLMcViGc1m0Nk5VX1r
 lR02eQqpxNZCmw5BjV6t3QEwhwkEepq2dKq59vs1VTVJJbc7NYp5Ee+kQ9KuZ7IAv27ZliD+
 V0FsHb459tACinRmGctDJ329qnUm4oEhqBWUZqgL3q7xFG2HRyx0QVyMEbhzMc/JwyR5Qs3Z
 W5Do140LdUTsEXaqphBOAOBcuvY1a9Pi7xDA==
X-IronPort-AV: E=Sophos;i="5.82,252,1613451600"; 
   d="scan'208";a="42521308"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/emul: Use existing X86_EXC_* constants
Date: Mon, 26 Apr 2021 13:45:35 +0100
Message-ID: <20210426124535.23814-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

... rather than having separate definitions locally.  EXC_HAS_EC in particular
is missing #CP, #VC and #SX vs X86_EXC_HAVE_EC.

Also switch a raw 14 for X86_EXC_PF in x86_emul_pagefault().

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/x86_emulate/x86_emulate.c | 739 ++++++++++++++++-----------------
 xen/arch/x86/x86_emulate/x86_emulate.h |   4 +-
 2 files changed, 361 insertions(+), 382 deletions(-)

diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c b/xen/arch/x86/x86_emulate/x86_emulate.c
index 4a33fe9613..138b85c4bf 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -1005,28 +1005,6 @@ struct x86_fxsr {
 /* MXCSR bit definitions. */
 #define MXCSR_MM  (1U << 17)
 
-/* Exception definitions. */
-#define EXC_DE  0
-#define EXC_DB  1
-#define EXC_BP  3
-#define EXC_OF  4
-#define EXC_BR  5
-#define EXC_UD  6
-#define EXC_NM  7
-#define EXC_DF  8
-#define EXC_TS 10
-#define EXC_NP 11
-#define EXC_SS 12
-#define EXC_GP 13
-#define EXC_PF 14
-#define EXC_MF 16
-#define EXC_AC 17
-#define EXC_XM 19
-
-#define EXC_HAS_EC                                                      \
-    ((1u << EXC_DF) | (1u << EXC_TS) | (1u << EXC_NP) |                 \
-     (1u << EXC_SS) | (1u << EXC_GP) | (1u << EXC_PF) | (1u << EXC_AC))
-
 /* Segment selector error code bits. */
 #define ECODE_EXT (1 << 0)
 #define ECODE_IDT (1 << 1)
@@ -1240,7 +1218,7 @@ do {                                                    \
 
 static inline int mkec(uint8_t e, int32_t ec, ...)
 {
-    return (e < 32 && ((1u << e) & EXC_HAS_EC)) ? ec : X86_EVENT_NO_EC;
+    return (e < 32 && ((1u << e) & X86_EXC_HAVE_EC)) ? ec : X86_EVENT_NO_EC;
 }
 
 #define generate_exception_if(p, e, ec...)                                \
@@ -1293,7 +1271,7 @@ static inline int mkec(uint8_t e, int32_t ec, ...)
    state->ip += (_size); /* real hardware doesn't truncate */           \
    generate_exception_if((uint8_t)(state->ip -                          \
                                    ctxt->regs->r(ip)) > MAX_INST_LEN,   \
-                         EXC_GP, 0);                                    \
+                         X86_EXC_GP, 0);                                \
    rc = ops->insn_fetch(x86_seg_cs, _ip, &_x, (_size), ctxt);           \
    if ( rc ) goto done;                                                 \
    _x;                                                                  \
@@ -1371,11 +1349,11 @@ do {                                                                    \
 #define validate_far_branch(cs, ip) ({                                  \
     if ( sizeof(ip) <= 4 ) {                                            \
         ASSERT(!ctxt->lma);                                             \
-        generate_exception_if((ip) > (cs)->limit, EXC_GP, 0);           \
+        generate_exception_if((ip) > (cs)->limit, X86_EXC_GP, 0);       \
     } else                                                              \
         generate_exception_if(ctxt->lma && (cs)->l                      \
                               ? !is_canonical_address(ip)               \
-                              : (ip) > (cs)->limit, EXC_GP, 0);         \
+                              : (ip) > (cs)->limit, X86_EXC_GP, 0);     \
 })
 
 #define commit_far_branch(cs, newip) ({                                 \
@@ -1442,7 +1420,7 @@ static int _get_fpu(
                 return rc;
             generate_exception_if(!(cr4 & ((type == X86EMUL_FPU_xmm)
                                            ? X86_CR4_OSFXSR : X86_CR4_OSXSAVE)),
-                                  EXC_UD);
+                                  X86_EXC_UD);
         }
 
         rc = ops->read_cr(0, &cr0, ctxt);
@@ -1455,13 +1433,13 @@ static int _get_fpu(
         }
         if ( cr0 & X86_CR0_EM )
         {
-            generate_exception_if(type == X86EMUL_FPU_fpu, EXC_NM);
-            generate_exception_if(type == X86EMUL_FPU_mmx, EXC_UD);
-            generate_exception_if(type == X86EMUL_FPU_xmm, EXC_UD);
+            generate_exception_if(type == X86EMUL_FPU_fpu, X86_EXC_NM);
+            generate_exception_if(type == X86EMUL_FPU_mmx, X86_EXC_UD);
+            generate_exception_if(type == X86EMUL_FPU_xmm, X86_EXC_UD);
         }
         generate_exception_if((cr0 & X86_CR0_TS) &&
                               (type != X86EMUL_FPU_wait || (cr0 & X86_CR0_MP)),
-                              EXC_NM);
+                              X86_EXC_NM);
     }
 
  done:
@@ -1861,7 +1839,7 @@ static int ioport_access_check(
         return rc == X86EMUL_DONE ? X86EMUL_OKAY : rc;
 
     /* Ensure the TSS has an io-bitmap-offset field. */
-    generate_exception_if(tr.type != 0xb, EXC_GP, 0);
+    generate_exception_if(tr.type != 0xb, X86_EXC_GP, 0);
 
     switch ( rc = read_ulong(x86_seg_tr, 0x66, &iobmp, 2, ctxt, ops) )
     {
@@ -1869,7 +1847,7 @@ static int ioport_access_check(
         break;
 
     case X86EMUL_EXCEPTION:
-        generate_exception_if(!ctxt->event_pending, EXC_GP, 0);
+        generate_exception_if(!ctxt->event_pending, X86_EXC_GP, 0);
         /* fallthrough */
 
     default:
@@ -1884,7 +1862,7 @@ static int ioport_access_check(
         break;
 
     case X86EMUL_EXCEPTION:
-        generate_exception_if(!ctxt->event_pending, EXC_GP, 0);
+        generate_exception_if(!ctxt->event_pending, X86_EXC_GP, 0);
         /* fallthrough */
 
     default:
@@ -1892,7 +1870,7 @@ static int ioport_access_check(
     }
 
     generate_exception_if(iobmp & (((1 << bytes) - 1) << (first_port & 7)),
-                          EXC_GP, 0);
+                          X86_EXC_GP, 0);
 
  done:
     return rc;
@@ -2012,7 +1990,7 @@ amd_like(const struct x86_emulate_ctxt *ctxt)
 #define vcpu_has_avx512_bf16() (ctxt->cpuid->feat.avx512_bf16)
 
 #define vcpu_must_have(feat) \
-    generate_exception_if(!vcpu_has_##feat(), EXC_UD)
+    generate_exception_if(!vcpu_has_##feat(), X86_EXC_UD)
 
 #ifdef __XEN__
 /*
@@ -2022,7 +2000,7 @@ amd_like(const struct x86_emulate_ctxt *ctxt)
  * the actual operation.
  */
 #define host_and_vcpu_must_have(feat) ({ \
-    generate_exception_if(!cpu_has_##feat, EXC_UD); \
+    generate_exception_if(!cpu_has_##feat, X86_EXC_UD); \
     vcpu_must_have(feat); \
 })
 #else
@@ -2082,7 +2060,7 @@ protmode_load_seg(
     uint8_t dpl, rpl;
     int cpl = get_cpl(ctxt, ops);
     uint32_t a_flag = 0x100;
-    int rc, fault_type = EXC_GP;
+    int rc, fault_type = X86_EXC_GP;
 
     if ( cpl < 0 )
         return X86EMUL_UNHANDLEABLE;
@@ -2210,7 +2188,7 @@ protmode_load_seg(
     /* Segment present in memory? */
     if ( !(desc.b & (1 << 15)) && seg != x86_seg_none )
     {
-        fault_type = seg != x86_seg_ss ? EXC_NP : EXC_SS;
+        fault_type = seg != x86_seg_ss ? X86_EXC_NP : X86_EXC_SS;
         goto raise_exn;
     }
 
@@ -2436,7 +2414,7 @@ static unsigned int decode_disp8scale(enum disp8scale scale,
     switch ( evex.lr ) \
     { \
     default: \
-        generate_exception(EXC_UD); \
+        generate_exception(X86_EXC_UD); \
     case 2: \
         break; \
     case 0: case 1: \
@@ -2596,7 +2574,7 @@ x86_decode_onebyte(
 
     case 0x9a: /* call (far, absolute) */
     case 0xea: /* jmp (far, absolute) */
-        generate_exception_if(mode_64bit(), EXC_UD);
+        generate_exception_if(mode_64bit(), X86_EXC_UD);
 
         imm1 = insn_fetch_bytes(op_bytes);
         imm2 = insn_fetch_type(uint16_t);
@@ -2710,7 +2688,7 @@ x86_decode_twobyte(
         /* fall through */
     case 0x21: case 0x23: /* mov to/from dr */
         ASSERT(ea.type == OP_REG); /* Early operand adjustment ensures this. */
-        generate_exception_if(lock_prefix, EXC_UD);
+        generate_exception_if(lock_prefix, X86_EXC_UD);
         op_bytes = mode_64bit() ? 8 : 4;
         break;
 
@@ -3062,7 +3040,7 @@ x86_decode(
                 /* fall through */
             case 8:
                 /* VEX / XOP / EVEX */
-                generate_exception_if(rex_prefix || vex.pfx, EXC_UD);
+                generate_exception_if(rex_prefix || vex.pfx, X86_EXC_UD);
                 /*
                  * With operand size override disallowed (see above), op_bytes
                  * should not have changed from its default.
@@ -3108,8 +3086,8 @@ x86_decode(
                         evex.raw[1] = vex.raw[1];
                         evex.raw[2] = insn_fetch_type(uint8_t);
 
-                        generate_exception_if(!evex.mbs || evex.mbz, EXC_UD);
-                        generate_exception_if(!evex.opmsk && evex.z, EXC_UD);
+                        generate_exception_if(!evex.mbs || evex.mbz, X86_EXC_UD);
+                        generate_exception_if(!evex.opmsk && evex.z, X86_EXC_UD);
 
                         if ( !mode_64bit() )
                             evex.R = 1;
@@ -3369,7 +3347,7 @@ x86_decode(
 
         if ( modrm_mod == 3 )
         {
-            generate_exception_if(d & vSIB, EXC_UD);
+            generate_exception_if(d & vSIB, X86_EXC_UD);
             modrm_rm |= ((rex_prefix & 1) << 3) |
                         ((evex_encoded() && !evex.x) << 4);
             ea.type = OP_REG;
@@ -3377,7 +3355,7 @@ x86_decode(
         else if ( ad_bytes == 2 )
         {
             /* 16-bit ModR/M decode. */
-            generate_exception_if(d & vSIB, EXC_UD);
+            generate_exception_if(d & vSIB, X86_EXC_UD);
             ea.type = OP_MEM;
             switch ( modrm_rm )
             {
@@ -3465,7 +3443,7 @@ x86_decode(
             }
             else
             {
-                generate_exception_if(d & vSIB, EXC_UD);
+                generate_exception_if(d & vSIB, X86_EXC_UD);
                 modrm_rm |= (rex_prefix & 1) << 3;
                 ea.mem.off = *decode_gpr(state->regs, modrm_rm);
                 if ( (modrm_rm == 5) && (modrm_mod != 0) )
@@ -3639,11 +3617,11 @@ x86_decode(
             op_bytes = 16 << evex.lr;
             break;
         case vex_f3:
-            generate_exception_if(evex_encoded() && evex.w, EXC_UD);
+            generate_exception_if(evex_encoded() && evex.w, X86_EXC_UD);
             op_bytes = 4;
             break;
         case vex_f2:
-            generate_exception_if(evex_encoded() && !evex.w, EXC_UD);
+            generate_exception_if(evex_encoded() && !evex.w, X86_EXC_UD);
             op_bytes = 8;
             break;
         }
@@ -3718,7 +3696,7 @@ x86_emulate(
     generate_exception_if((mode_vif() &&
                            (_regs.eflags & X86_EFLAGS_VIF) &&
                            (_regs.eflags & X86_EFLAGS_VIP)),
-                          EXC_GP, 0);
+                          X86_EXC_GP, 0);
 
     rc = x86_decode(&state, ctxt, ops);
     if ( rc != X86EMUL_OKAY )
@@ -3747,7 +3725,7 @@ x86_emulate(
 #define state (&state)
     elem_bytes = 4 << evex.w;
 
-    generate_exception_if(state->not_64bit && mode_64bit(), EXC_UD);
+    generate_exception_if(state->not_64bit && mode_64bit(), X86_EXC_UD);
 
     if ( ea.type == OP_REG )
         ea.reg = _decode_gpr(&_regs, modrm_rm, (d & ByteOp) && !rex_prefix && !vex.opcx);
@@ -3864,12 +3842,12 @@ x86_emulate(
         generate_exception_if(lock_prefix &&
                               (vex.opcx || ext != ext_0f || b != 0xc7 ||
                                (modrm_reg & 7) != 1 || ea.type != OP_MEM),
-                              EXC_UD);
+                              X86_EXC_UD);
         dst.type = OP_NONE;
         break;
 
     case DstReg:
-        generate_exception_if(lock_prefix, EXC_UD);
+        generate_exception_if(lock_prefix, X86_EXC_UD);
         dst.type = OP_REG;
         if ( d & ByteOp )
         {
@@ -3921,17 +3899,17 @@ x86_emulate(
         d = (d & ~DstMask) | DstMem;
         /* Becomes a normal DstMem operation from here on. */
     case DstMem:
-        generate_exception_if(ea.type == OP_MEM && evex.z, EXC_UD);
+        generate_exception_if(ea.type == OP_MEM && evex.z, X86_EXC_UD);
         if ( state->simd_size )
         {
-            generate_exception_if(lock_prefix, EXC_UD);
+            generate_exception_if(lock_prefix, X86_EXC_UD);
             break;
         }
         ea.bytes = (d & ByteOp) ? 1 : op_bytes;
         dst = ea;
         if ( dst.type == OP_REG )
         {
-            generate_exception_if(lock_prefix, EXC_UD);
+            generate_exception_if(lock_prefix, X86_EXC_UD);
             switch ( dst.bytes )
             {
             case 1: dst.val = *(uint8_t  *)dst.reg; break;
@@ -3943,7 +3921,7 @@ x86_emulate(
         else if ( d & Mov ) /* optimisation - avoid slow emulated read */
         {
             /* Lock prefix is allowed only on RMW instructions. */
-            generate_exception_if(lock_prefix, EXC_UD);
+            generate_exception_if(lock_prefix, X86_EXC_UD);
             fail_if(!ops->write);
         }
         else if ( !ops->rmw )
@@ -4174,14 +4152,14 @@ x86_emulate(
     case 0x62: /* bound */ {
         int lb, ub, idx;
 
-        generate_exception_if(src.type != OP_MEM, EXC_UD);
+        generate_exception_if(src.type != OP_MEM, X86_EXC_UD);
         if ( (rc = read_ulong(src.mem.seg, truncate_ea(src.mem.off + op_bytes),
                               &ea.val, op_bytes, ctxt, ops)) )
             goto done;
         ub  = (op_bytes == 2) ? (int16_t)ea.val   : (int32_t)ea.val;
         lb  = (op_bytes == 2) ? (int16_t)src.val  : (int32_t)src.val;
         idx = (op_bytes == 2) ? (int16_t)dst.val  : (int32_t)dst.val;
-        generate_exception_if((idx < lb) || (idx > ub), EXC_BR);
+        generate_exception_if((idx < lb) || (idx > ub), X86_EXC_BR);
         dst.type = OP_NONE;
         break;
     }
@@ -4204,7 +4182,7 @@ x86_emulate(
             /* arpl */
             unsigned int src_rpl = dst.val & 3;
 
-            generate_exception_if(!in_protmode(ctxt, ops), EXC_UD);
+            generate_exception_if(!in_protmode(ctxt, ops), X86_EXC_UD);
 
             dst = ea;
             dst.bytes = 2;
@@ -4399,7 +4377,7 @@ x86_emulate(
             dst.type = OP_NONE;
             break;
         }
-        generate_exception_if((modrm_reg & 7) != 0, EXC_UD);
+        generate_exception_if((modrm_reg & 7) != 0, X86_EXC_UD);
     case 0x88 ... 0x8b: /* mov */
     case 0xa0 ... 0xa1: /* mov mem.offs,{%al,%ax,%eax,%rax} */
     case 0xa2 ... 0xa3: /* mov {%al,%ax,%eax,%rax},mem.offs */
@@ -4408,7 +4386,7 @@ x86_emulate(
 
     case 0x8c: /* mov Sreg,r/m */
         seg = modrm_reg & 7; /* REX.R is ignored. */
-        generate_exception_if(!is_x86_user_segment(seg), EXC_UD);
+        generate_exception_if(!is_x86_user_segment(seg), X86_EXC_UD);
     store_selector:
         fail_if(ops->read_segment == NULL);
         if ( (rc = ops->read_segment(seg, &sreg, ctxt)) != 0 )
@@ -4419,14 +4397,14 @@ x86_emulate(
         break;
 
     case 0x8d: /* lea */
-        generate_exception_if(ea.type != OP_MEM, EXC_UD);
+        generate_exception_if(ea.type != OP_MEM, X86_EXC_UD);
         dst.val = ea.mem.off;
         break;
 
     case 0x8e: /* mov r/m,Sreg */
         seg = modrm_reg & 7; /* REX.R is ignored. */
         generate_exception_if(!is_x86_user_segment(seg) ||
-                              seg == x86_seg_cs, EXC_UD);
+                              seg == x86_seg_cs, X86_EXC_UD);
         if ( (rc = load_seg(seg, src.val, 0, NULL, ctxt, ops)) != 0 )
             goto done;
         if ( seg == x86_seg_ss )
@@ -4435,7 +4413,7 @@ x86_emulate(
         break;
 
     case 0x8f: /* pop (sole member of Grp1a) */
-        generate_exception_if((modrm_reg & 7) != 0, EXC_UD);
+        generate_exception_if((modrm_reg & 7) != 0, X86_EXC_UD);
         /* 64-bit mode: POP defaults to a 64-bit operand. */
         if ( mode_64bit() && (dst.bytes == 4) )
             dst.bytes = 8;
@@ -4516,7 +4494,7 @@ x86_emulate(
                 if ( rc != X86EMUL_OKAY )
                     goto done;
             }
-            generate_exception_if(!(cr4 & X86_CR4_VME), EXC_GP, 0);
+            generate_exception_if(!(cr4 & X86_CR4_VME), X86_EXC_GP, 0);
             src.val = (_regs.flags & ~X86_EFLAGS_IF) | X86_EFLAGS_IOPL;
             if ( _regs.eflags & X86_EFLAGS_VIF )
                 src.val |= X86_EFLAGS_IF;
@@ -4546,7 +4524,7 @@ x86_emulate(
                 /* All IOPL != 3 POPFs fail, except in vm86 mode. */
                 generate_exception_if(!(cr4 & X86_CR4_VME) &&
                                       MASK_EXTR(_regs.eflags, X86_EFLAGS_IOPL) != 3,
-                                      EXC_GP, 0);
+                                      X86_EXC_GP, 0);
             }
             /*
              * IOPL cannot be modified outside of CPL 0.  IF cannot be
@@ -4570,11 +4548,11 @@ x86_emulate(
             if ( (cr4 & X86_CR4_VME) &&
                  MASK_EXTR(_regs.eflags, X86_EFLAGS_IOPL) != 3 )
             {
-                generate_exception_if(dst.val & X86_EFLAGS_TF, EXC_GP, 0);
+                generate_exception_if(dst.val & X86_EFLAGS_TF, X86_EXC_GP, 0);
                 if ( dst.val & X86_EFLAGS_IF )
                 {
                     generate_exception_if(_regs.eflags & X86_EFLAGS_VIP,
-                                          EXC_GP, 0);
+                                          X86_EXC_GP, 0);
                     dst.val |= X86_EFLAGS_VIF;
                 }
                 else
@@ -4709,7 +4687,7 @@ x86_emulate(
         break;
 
     case 0xc0 ... 0xc1: grp2: /* Grp2 */
-        generate_exception_if(lock_prefix, EXC_UD);
+        generate_exception_if(lock_prefix, X86_EXC_UD);
 
         switch ( modrm_reg & 7 )
         {
@@ -4749,7 +4727,7 @@ x86_emulate(
     case 0xc5: /* lds */
         seg = (b & 1) * 3; /* es = 0, ds = 3 */
     les:
-        generate_exception_if(src.type != OP_MEM, EXC_UD);
+        generate_exception_if(src.type != OP_MEM, X86_EXC_UD);
         if ( (rc = read_ulong(src.mem.seg, truncate_ea(src.mem.off + src.bytes),
                               &dst.val, 2, ctxt, ops)) != X86EMUL_OKAY )
             goto done;
@@ -4828,7 +4806,7 @@ x86_emulate(
         switch ( ctxt->opcode )
         {
         case 0xcc: /* int3 */
-            ctxt->event.vector = EXC_BP;
+            ctxt->event.vector = X86_EXC_BP;
             ctxt->event.type = X86_EVENTTYPE_SW_EXCEPTION;
             break;
         case 0xcd: /* int imm8 */
@@ -4836,11 +4814,11 @@ x86_emulate(
             ctxt->event.type = X86_EVENTTYPE_SW_INTERRUPT;
             break;
         case 0xce: /* into */
-            ctxt->event.vector = EXC_OF;
+            ctxt->event.vector = X86_EXC_OF;
             ctxt->event.type = X86_EVENTTYPE_SW_EXCEPTION;
             break;
         case 0xf1: /* icebp */
-            ctxt->event.vector = EXC_DB;
+            ctxt->event.vector = X86_EXC_DB;
             ctxt->event.type = X86_EVENTTYPE_PRI_SW_EXCEPTION;
             break;
         }
@@ -4889,7 +4867,7 @@ x86_emulate(
             _regs.ax = (uint8_t)(_regs.al + (_regs.ah * n));
         else
         {
-            generate_exception_if(!n, EXC_DE);
+            generate_exception_if(!n, X86_EXC_DE);
             _regs.al = _regs.al % n;
             _regs.ah = _regs.al / n;
         }
@@ -4981,7 +4959,7 @@ x86_emulate(
             emulate_fpu_insn_stub(0xd9, modrm);
             break;
         default:
-            generate_exception_if(ea.type != OP_MEM, EXC_UD);
+            generate_exception_if(ea.type != OP_MEM, X86_EXC_UD);
             switch ( modrm_reg & 7 )
             {
             case 0: /* fld m32fp */
@@ -5029,7 +5007,7 @@ x86_emulate(
                 emulate_fpu_insn_memdst(b, modrm_reg & 7, dst.val);
                 break;
             default:
-                generate_exception(EXC_UD);
+                generate_exception(X86_EXC_UD);
             }
             /*
              * Control instructions can't raise FPU exceptions, so we need
@@ -5056,7 +5034,7 @@ x86_emulate(
             emulate_fpu_insn_stub(0xda, modrm);
             break;
         default:
-            generate_exception_if(ea.type != OP_MEM, EXC_UD);
+            generate_exception_if(ea.type != OP_MEM, X86_EXC_UD);
             goto fpu_memsrc32;
         }
         break;
@@ -5085,7 +5063,7 @@ x86_emulate(
             emulate_fpu_insn_stub(0xdb, modrm);
             break;
         default:
-            generate_exception_if(ea.type != OP_MEM, EXC_UD);
+            generate_exception_if(ea.type != OP_MEM, X86_EXC_UD);
             switch ( modrm_reg & 7 )
             {
             case 0: /* fild m32i */
@@ -5113,7 +5091,7 @@ x86_emulate(
                     goto done;
                 break;
             default:
-                generate_exception(EXC_UD);
+                generate_exception(X86_EXC_UD);
             }
         }
         break;
@@ -5158,7 +5136,7 @@ x86_emulate(
             emulate_fpu_insn_stub(0xdd, modrm);
             break;
         default:
-            generate_exception_if(ea.type != OP_MEM, EXC_UD);
+            generate_exception_if(ea.type != OP_MEM, X86_EXC_UD);
             switch ( modrm_reg & 7 )
             {
             case 0: /* fld m64fp */;
@@ -5197,7 +5175,7 @@ x86_emulate(
                 state->fpu_ctrl = true;
                 goto fpu_memdst16;
             default:
-                generate_exception(EXC_UD);
+                generate_exception(X86_EXC_UD);
             }
             /*
              * Control instructions can't raise FPU exceptions, so we need
@@ -5224,7 +5202,7 @@ x86_emulate(
             emulate_fpu_insn_stub(0xde, modrm);
             break;
         default:
-            generate_exception_if(ea.type != OP_MEM, EXC_UD);
+            generate_exception_if(ea.type != OP_MEM, X86_EXC_UD);
             emulate_fpu_insn_memsrc(b, modrm_reg & 7, src.val);
             break;
         }
@@ -5255,7 +5233,7 @@ x86_emulate(
             emulate_fpu_insn_stub(0xdf, modrm);
             break;
         default:
-            generate_exception_if(ea.type != OP_MEM, EXC_UD);
+            generate_exception_if(ea.type != OP_MEM, X86_EXC_UD);
             switch ( modrm_reg & 7 )
             {
             case 0: /* fild m16i */
@@ -5360,7 +5338,7 @@ x86_emulate(
         break;
 
     case 0xf4: /* hlt */
-        generate_exception_if(!mode_ring0(), EXC_GP, 0);
+        generate_exception_if(!mode_ring0(), X86_EXC_GP, 0);
         ctxt->retire.hlt = true;
         break;
 
@@ -5479,7 +5457,7 @@ x86_emulate(
                 v    = (uint8_t)src.val;
                 generate_exception_if(
                     div_dbl(u, v) || ((uint8_t)u[0] != (uint16_t)u[0]),
-                    EXC_DE);
+                    X86_EXC_DE);
                 dst.val = (uint8_t)u[0];
                 _regs.ah = u[1];
                 break;
@@ -5489,7 +5467,7 @@ x86_emulate(
                 v    = (uint16_t)src.val;
                 generate_exception_if(
                     div_dbl(u, v) || ((uint16_t)u[0] != (uint32_t)u[0]),
-                    EXC_DE);
+                    X86_EXC_DE);
                 dst.val = (uint16_t)u[0];
                 _regs.dx = u[1];
                 break;
@@ -5500,7 +5478,7 @@ x86_emulate(
                 v    = (uint32_t)src.val;
                 generate_exception_if(
                     div_dbl(u, v) || ((uint32_t)u[0] != u[0]),
-                    EXC_DE);
+                    X86_EXC_DE);
                 dst.val   = (uint32_t)u[0];
                 _regs.rdx = (uint32_t)u[1];
                 break;
@@ -5509,7 +5487,7 @@ x86_emulate(
                 u[0] = _regs.r(ax);
                 u[1] = _regs.r(dx);
                 v    = src.val;
-                generate_exception_if(div_dbl(u, v), EXC_DE);
+                generate_exception_if(div_dbl(u, v), X86_EXC_DE);
                 dst.val     = u[0];
                 _regs.r(dx) = u[1];
                 break;
@@ -5524,7 +5502,7 @@ x86_emulate(
                 v    = (int8_t)src.val;
                 generate_exception_if(
                     idiv_dbl(u, v) || ((int8_t)u[0] != (int16_t)u[0]),
-                    EXC_DE);
+                    X86_EXC_DE);
                 dst.val = (int8_t)u[0];
                 _regs.ah = u[1];
                 break;
@@ -5534,7 +5512,7 @@ x86_emulate(
                 v    = (int16_t)src.val;
                 generate_exception_if(
                     idiv_dbl(u, v) || ((int16_t)u[0] != (int32_t)u[0]),
-                    EXC_DE);
+                    X86_EXC_DE);
                 dst.val = (int16_t)u[0];
                 _regs.dx = u[1];
                 break;
@@ -5545,7 +5523,7 @@ x86_emulate(
                 v    = (int32_t)src.val;
                 generate_exception_if(
                     idiv_dbl(u, v) || ((int32_t)u[0] != u[0]),
-                    EXC_DE);
+                    X86_EXC_DE);
                 dst.val   = (int32_t)u[0];
                 _regs.rdx = (uint32_t)u[1];
                 break;
@@ -5554,7 +5532,7 @@ x86_emulate(
                 u[0] = _regs.r(ax);
                 u[1] = _regs.r(dx);
                 v    = src.val;
-                generate_exception_if(idiv_dbl(u, v), EXC_DE);
+                generate_exception_if(idiv_dbl(u, v), X86_EXC_DE);
                 dst.val     = u[0];
                 _regs.r(dx) = u[1];
                 break;
@@ -5576,7 +5554,7 @@ x86_emulate(
             _regs.eflags &= ~X86_EFLAGS_IF;
         else
         {
-            generate_exception_if(!mode_vif(), EXC_GP, 0);
+            generate_exception_if(!mode_vif(), X86_EXC_GP, 0);
             _regs.eflags &= ~X86_EFLAGS_VIF;
         }
         break;
@@ -5591,8 +5569,7 @@ x86_emulate(
         else
         {
             generate_exception_if((_regs.eflags & X86_EFLAGS_VIP) ||
-				  !mode_vif(),
-                                  EXC_GP, 0);
+				  !mode_vif(), X86_EXC_GP, 0);
             if ( !(_regs.eflags & X86_EFLAGS_VIF) )
                 ctxt->retire.sti = true;
             _regs.eflags |= X86_EFLAGS_VIF;
@@ -5608,7 +5585,7 @@ x86_emulate(
         break;
 
     case 0xfe: /* Grp4 */
-        generate_exception_if((modrm_reg & 7) >= 2, EXC_UD);
+        generate_exception_if((modrm_reg & 7) >= 2, X86_EXC_UD);
         /* Fallthrough. */
     case 0xff: /* Grp5 */
         switch ( modrm_reg & 7 )
@@ -5642,7 +5619,7 @@ x86_emulate(
             break;
         case 3: /* call (far, absolute indirect) */
         case 5: /* jmp (far, absolute indirect) */
-            generate_exception_if(src.type != OP_MEM, EXC_UD);
+            generate_exception_if(src.type != OP_MEM, X86_EXC_UD);
 
             if ( (rc = read_ulong(src.mem.seg,
                                   truncate_ea(src.mem.off + op_bytes),
@@ -5655,20 +5632,20 @@ x86_emulate(
         case 6: /* push */
             goto push;
         case 7:
-            generate_exception(EXC_UD);
+            generate_exception(X86_EXC_UD);
         }
         break;
 
     case X86EMUL_OPC(0x0f, 0x00): /* Grp6 */
         seg = (modrm_reg & 1) ? x86_seg_tr : x86_seg_ldtr;
-        generate_exception_if(!in_protmode(ctxt, ops), EXC_UD);
+        generate_exception_if(!in_protmode(ctxt, ops), X86_EXC_UD);
         switch ( modrm_reg & 6 )
         {
         case 0: /* sldt / str */
-            generate_exception_if(umip_active(ctxt, ops), EXC_GP, 0);
+            generate_exception_if(umip_active(ctxt, ops), X86_EXC_GP, 0);
             goto store_selector;
         case 2: /* lldt / ltr */
-            generate_exception_if(!mode_ring0(), EXC_GP, 0);
+            generate_exception_if(!mode_ring0(), X86_EXC_GP, 0);
             if ( (rc = load_seg(seg, src.val, 0, NULL, ctxt, ops)) != 0 )
                 goto done;
             break;
@@ -5686,7 +5663,7 @@ x86_emulate(
             case X86EMUL_EXCEPTION:
                 if ( ctxt->event_pending )
                 {
-                    ASSERT(ctxt->event.vector == EXC_PF);
+                    ASSERT(ctxt->event.vector == X86_EXC_PF);
             default:
                     goto done;
                 }
@@ -5696,7 +5673,7 @@ x86_emulate(
             }
             break;
         default:
-            generate_exception_if(true, EXC_UD);
+            generate_exception_if(true, X86_EXC_UD);
             break;
         }
         break;
@@ -5712,7 +5689,7 @@ x86_emulate(
         case 0xca: /* clac */
         case 0xcb: /* stac */
             vcpu_must_have(smap);
-            generate_exception_if(vex.pfx || !mode_ring0(), EXC_UD);
+            generate_exception_if(vex.pfx || !mode_ring0(), X86_EXC_UD);
 
             _regs.eflags &= ~X86_EFLAGS_AC;
             if ( modrm == 0xcb )
@@ -5720,11 +5697,11 @@ x86_emulate(
             break;
 
         case 0xd0: /* xgetbv */
-            generate_exception_if(vex.pfx, EXC_UD);
+            generate_exception_if(vex.pfx, X86_EXC_UD);
             if ( !ops->read_cr || !ops->read_xcr ||
                  ops->read_cr(4, &cr4, ctxt) != X86EMUL_OKAY )
                 cr4 = 0;
-            generate_exception_if(!(cr4 & X86_CR4_OSXSAVE), EXC_UD);
+            generate_exception_if(!(cr4 & X86_CR4_OSXSAVE), X86_EXC_UD);
             rc = ops->read_xcr(_regs.ecx, &msr_val, ctxt);
             if ( rc != X86EMUL_OKAY )
                 goto done;
@@ -5733,12 +5710,12 @@ x86_emulate(
             break;
 
         case 0xd1: /* xsetbv */
-            generate_exception_if(vex.pfx, EXC_UD);
+            generate_exception_if(vex.pfx, X86_EXC_UD);
             if ( !ops->read_cr || !ops->write_xcr ||
                  ops->read_cr(4, &cr4, ctxt) != X86EMUL_OKAY )
                 cr4 = 0;
-            generate_exception_if(!(cr4 & X86_CR4_OSXSAVE), EXC_UD);
-            generate_exception_if(!mode_ring0(), EXC_GP, 0);
+            generate_exception_if(!(cr4 & X86_CR4_OSXSAVE), X86_EXC_UD);
+            generate_exception_if(!mode_ring0(), X86_EXC_GP, 0);
             rc = ops->write_xcr(_regs.ecx,
                                 _regs.eax | ((uint64_t)_regs.edx << 32), ctxt);
             if ( rc != X86EMUL_OKAY )
@@ -5746,22 +5723,22 @@ x86_emulate(
             break;
 
         case 0xd4: /* vmfunc */
-            generate_exception_if(vex.pfx, EXC_UD);
+            generate_exception_if(vex.pfx, X86_EXC_UD);
             fail_if(!ops->vmfunc);
             if ( (rc = ops->vmfunc(ctxt)) != X86EMUL_OKAY )
                 goto done;
             break;
 
         case 0xd5: /* xend */
-            generate_exception_if(vex.pfx, EXC_UD);
-            generate_exception_if(!vcpu_has_rtm(), EXC_UD);
-            generate_exception_if(vcpu_has_rtm(), EXC_GP, 0);
+            generate_exception_if(vex.pfx, X86_EXC_UD);
+            generate_exception_if(!vcpu_has_rtm(), X86_EXC_UD);
+            generate_exception_if(vcpu_has_rtm(), X86_EXC_GP, 0);
             break;
 
         case 0xd6: /* xtest */
-            generate_exception_if(vex.pfx, EXC_UD);
+            generate_exception_if(vex.pfx, X86_EXC_UD);
             generate_exception_if(!vcpu_has_rtm() && !vcpu_has_hle(),
-                                  EXC_UD);
+                                  X86_EXC_UD);
             /* Neither HLE nor RTM can be active when we get here. */
             _regs.eflags |= X86_EFLAGS_ZF;
             break;
@@ -5773,8 +5750,8 @@ x86_emulate(
                 goto done;
             /* Finding SVME set implies vcpu_has_svm(). */
             generate_exception_if(!(msr_val & EFER_SVME) ||
-                                  !in_protmode(ctxt, ops), EXC_UD);
-            generate_exception_if(!mode_ring0(), EXC_GP, 0);
+                                  !in_protmode(ctxt, ops), X86_EXC_UD);
+            generate_exception_if(!mode_ring0(), X86_EXC_GP, 0);
             fail_if(!ops->tlb_op);
             if ( (rc = ops->tlb_op(x86emul_invlpga, truncate_ea(_regs.r(ax)),
                                    _regs.ecx, ctxt)) != X86EMUL_OKAY )
@@ -5816,8 +5793,8 @@ x86_emulate(
             break;
 
         case 0xf8: /* swapgs */
-            generate_exception_if(!mode_64bit(), EXC_UD);
-            generate_exception_if(!mode_ring0(), EXC_GP, 0);
+            generate_exception_if(!mode_64bit(), X86_EXC_UD);
+            generate_exception_if(!mode_ring0(), X86_EXC_GP, 0);
             fail_if(!ops->read_segment || !ops->read_msr ||
                     !ops->write_segment || !ops->write_msr);
             if ( (rc = ops->read_segment(x86_seg_gs, &sreg,
@@ -5855,7 +5832,7 @@ x86_emulate(
                    ad_bytes == 4 ? _regs.eax : _regs.ax;
             limit = ctxt->cpuid->basic.clflush_size * 8;
             generate_exception_if(limit < sizeof(long) ||
-                                  (limit & (limit - 1)), EXC_UD);
+                                  (limit & (limit - 1)), X86_EXC_UD);
             base &= ~(limit - 1);
             if ( ops->rep_stos )
             {
@@ -5891,7 +5868,7 @@ x86_emulate(
         case GRP7_MEM(0): /* sgdt */
         case GRP7_MEM(1): /* sidt */
             ASSERT(ea.type == OP_MEM);
-            generate_exception_if(umip_active(ctxt, ops), EXC_GP, 0);
+            generate_exception_if(umip_active(ctxt, ops), X86_EXC_GP, 0);
             fail_if(!ops->read_segment || !ops->write);
             if ( (rc = ops->read_segment(seg, &sreg, ctxt)) )
                 goto done;
@@ -5912,7 +5889,7 @@ x86_emulate(
         case GRP7_MEM(2): /* lgdt */
         case GRP7_MEM(3): /* lidt */
             ASSERT(ea.type == OP_MEM);
-            generate_exception_if(!mode_ring0(), EXC_GP, 0);
+            generate_exception_if(!mode_ring0(), X86_EXC_GP, 0);
             fail_if(ops->write_segment == NULL);
             memset(&sreg, 0, sizeof(sreg));
             if ( (rc = read_ulong(ea.mem.seg, ea.mem.off,
@@ -5920,7 +5897,7 @@ x86_emulate(
                  (rc = read_ulong(ea.mem.seg, truncate_ea(ea.mem.off + 2),
                                   &base, mode_64bit() ? 8 : 4, ctxt, ops)) )
                 goto done;
-            generate_exception_if(!is_canonical_address(base), EXC_GP, 0);
+            generate_exception_if(!is_canonical_address(base), X86_EXC_GP, 0);
             sreg.base = base;
             sreg.limit = limit;
             if ( !mode_64bit() && op_bytes == 2 )
@@ -5930,7 +5907,7 @@ x86_emulate(
             break;
 
         case GRP7_ALL(4): /* smsw */
-            generate_exception_if(umip_active(ctxt, ops), EXC_GP, 0);
+            generate_exception_if(umip_active(ctxt, ops), X86_EXC_GP, 0);
             if ( ea.type == OP_MEM )
             {
                 fail_if(!ops->write);
@@ -5948,7 +5925,7 @@ x86_emulate(
         case GRP7_ALL(6): /* lmsw */
             fail_if(ops->read_cr == NULL);
             fail_if(ops->write_cr == NULL);
-            generate_exception_if(!mode_ring0(), EXC_GP, 0);
+            generate_exception_if(!mode_ring0(), X86_EXC_GP, 0);
             if ( (rc = ops->read_cr(0, &cr0, ctxt)) )
                 goto done;
             if ( ea.type == OP_REG )
@@ -5964,7 +5941,7 @@ x86_emulate(
 
         case GRP7_MEM(7): /* invlpg */
             ASSERT(ea.type == OP_MEM);
-            generate_exception_if(!mode_ring0(), EXC_GP, 0);
+            generate_exception_if(!mode_ring0(), X86_EXC_GP, 0);
             fail_if(!ops->tlb_op);
             if ( (rc = ops->tlb_op(x86emul_invlpg, ea.mem.off, ea.mem.seg,
                                    ctxt)) != X86EMUL_OKAY )
@@ -5982,7 +5959,7 @@ x86_emulate(
     }
 
     case X86EMUL_OPC(0x0f, 0x02): /* lar */
-        generate_exception_if(!in_protmode(ctxt, ops), EXC_UD);
+        generate_exception_if(!in_protmode(ctxt, ops), X86_EXC_UD);
         _regs.eflags &= ~X86_EFLAGS_ZF;
         switch ( rc = protmode_load_seg(x86_seg_none, src.val, false, &sreg,
                                         ctxt, ops) )
@@ -6013,7 +5990,7 @@ x86_emulate(
         case X86EMUL_EXCEPTION:
             if ( ctxt->event_pending )
             {
-                ASSERT(ctxt->event.vector == EXC_PF);
+                ASSERT(ctxt->event.vector == X86_EXC_PF);
         default:
                 goto done;
             }
@@ -6030,7 +6007,7 @@ x86_emulate(
         break;
 
     case X86EMUL_OPC(0x0f, 0x03): /* lsl */
-        generate_exception_if(!in_protmode(ctxt, ops), EXC_UD);
+        generate_exception_if(!in_protmode(ctxt, ops), X86_EXC_UD);
         _regs.eflags &= ~X86_EFLAGS_ZF;
         switch ( rc = protmode_load_seg(x86_seg_none, src.val, false, &sreg,
                                         ctxt, ops) )
@@ -6058,7 +6035,7 @@ x86_emulate(
         case X86EMUL_EXCEPTION:
             if ( ctxt->event_pending )
             {
-                ASSERT(ctxt->event.vector == EXC_PF);
+                ASSERT(ctxt->event.vector == X86_EXC_PF);
         default:
                 goto done;
             }
@@ -6081,8 +6058,8 @@ x86_emulate(
         fail_if(ops->read_msr == NULL);
         if ( (rc = ops->read_msr(MSR_EFER, &msr_val, ctxt)) != X86EMUL_OKAY )
             goto done;
-        generate_exception_if((msr_val & EFER_SCE) == 0, EXC_UD);
-        generate_exception_if(!amd_like(ctxt) && !mode_64bit(), EXC_UD);
+        generate_exception_if((msr_val & EFER_SCE) == 0, X86_EXC_UD);
+        generate_exception_if(!amd_like(ctxt) && !mode_64bit(), X86_EXC_UD);
 
         if ( (rc = ops->read_msr(MSR_STAR, &msr_val, ctxt)) != X86EMUL_OKAY )
             goto done;
@@ -6150,7 +6127,7 @@ x86_emulate(
         break;
 
     case X86EMUL_OPC(0x0f, 0x06): /* clts */
-        generate_exception_if(!mode_ring0(), EXC_GP, 0);
+        generate_exception_if(!mode_ring0(), X86_EXC_GP, 0);
         fail_if((ops->read_cr == NULL) || (ops->write_cr == NULL));
         if ( (rc = ops->read_cr(0, &dst.val, ctxt)) != X86EMUL_OKAY ||
              (rc = ops->write_cr(0, dst.val & ~X86_CR0_TS, ctxt)) != X86EMUL_OKAY )
@@ -6166,10 +6143,10 @@ x86_emulate(
         fail_if(!ops->read_msr);
         if ( (rc = ops->read_msr(MSR_EFER, &msr_val, ctxt)) != X86EMUL_OKAY )
             goto done;
-        generate_exception_if(!(msr_val & EFER_SCE), EXC_UD);
-        generate_exception_if(!amd_like(ctxt) && !mode_64bit(), EXC_UD);
-        generate_exception_if(!mode_ring0(), EXC_GP, 0);
-        generate_exception_if(!in_protmode(ctxt, ops), EXC_GP, 0);
+        generate_exception_if(!(msr_val & EFER_SCE), X86_EXC_UD);
+        generate_exception_if(!amd_like(ctxt) && !mode_64bit(), X86_EXC_UD);
+        generate_exception_if(!mode_ring0(), X86_EXC_GP, 0);
+        generate_exception_if(!in_protmode(ctxt, ops), X86_EXC_GP, 0);
 #ifdef __x86_64__
         /*
          * Doing this for just Intel (rather than e.g. !amd_like()) as this is
@@ -6178,7 +6155,7 @@ x86_emulate(
          */
         generate_exception_if(ctxt->cpuid->x86_vendor == X86_VENDOR_INTEL &&
                               op_bytes == 8 && !is_canonical_address(_regs.rcx),
-                              EXC_GP, 0);
+                              X86_EXC_GP, 0);
 #endif
 
         if ( (rc = ops->read_msr(MSR_STAR, &msr_val, ctxt)) != X86EMUL_OKAY )
@@ -6237,7 +6214,7 @@ x86_emulate(
 
     case X86EMUL_OPC(0x0f, 0x08): /* invd */
     case X86EMUL_OPC(0x0f, 0x09): /* wbinvd / wbnoinvd */
-        generate_exception_if(!mode_ring0(), EXC_GP, 0);
+        generate_exception_if(!mode_ring0(), X86_EXC_GP, 0);
         fail_if(!ops->cache_op);
         if ( (rc = ops->cache_op(b == 0x09 ? !repe_prefix() ||
                                              !vcpu_has_wbnoinvd()
@@ -6252,7 +6229,7 @@ x86_emulate(
     case X86EMUL_OPC(0x0f, 0x0b): /* ud2 */
     case X86EMUL_OPC(0x0f, 0xb9): /* ud1 */
     case X86EMUL_OPC(0x0f, 0xff): /* ud0 */
-        generate_exception(EXC_UD);
+        generate_exception(X86_EXC_UD);
 
     case X86EMUL_OPC(0x0f, 0x0d): /* GrpP (prefetch) */
     case X86EMUL_OPC(0x0f, 0x18): /* Grp16 (prefetch/nop) */
@@ -6272,7 +6249,7 @@ x86_emulate(
         else if ( _3dnow_ext_table[(imm1 >> 4) & 0xf] & (1 << (imm1 & 0xf)) )
             host_and_vcpu_must_have(3dnow_ext);
         else
-            generate_exception(EXC_UD);
+            generate_exception(X86_EXC_UD);
 
         get_fpu(X86EMUL_FPU_mmx);
 
@@ -6351,7 +6328,7 @@ x86_emulate(
         /* fall through */
     CASE_SIMD_PACKED_FP_VEX(0x0f, 0x2b):   /* movntp{s,d} xmm,m128 */
                                            /* vmovntp{s,d} {x,y}mm,mem */
-        generate_exception_if(ea.type != OP_MEM, EXC_UD);
+        generate_exception_if(ea.type != OP_MEM, X86_EXC_UD);
         sfence = true;
         /* fall through */
     CASE_SIMD_ALL_FP_VEX(0x0f, 0x10):      /* mov{up,s}{s,d} xmm/mem,xmm */
@@ -6437,7 +6414,7 @@ x86_emulate(
         break;
 
     CASE_SIMD_PACKED_FP(_EVEX, 0x0f, 0x2b): /* vmovntp{s,d} [xyz]mm,mem */
-        generate_exception_if(ea.type != OP_MEM || evex.opmsk, EXC_UD);
+        generate_exception_if(ea.type != OP_MEM || evex.opmsk, X86_EXC_UD);
         sfence = true;
         /* fall through */
     CASE_SIMD_PACKED_FP(_EVEX, 0x0f, 0x10): /* vmovup{s,d} [xyz]mm/mem,[xyz]mm{k} */
@@ -6451,7 +6428,7 @@ x86_emulate(
         /* vmovs{s,d} to/from memory have only two operands. */
         if ( (b & ~1) == 0x10 && ea.type == OP_MEM )
             d |= TwoOp;
-        generate_exception_if(evex.brs, EXC_UD);
+        generate_exception_if(evex.brs, X86_EXC_UD);
         /* fall through */
     CASE_SIMD_ALL_FP(_EVEX, 0x0f, 0x51):    /* vsqrtp{s,d} [xyz]mm/mem,[xyz]mm{k} */
                                             /* vsqrts{s,d} xmm/m32,xmm,xmm{k} */
@@ -6465,7 +6442,7 @@ x86_emulate(
         generate_exception_if((evex.w != (evex.pfx & VEX_PREFIX_DOUBLE_MASK) ||
                                (ea.type != OP_REG && evex.brs &&
                                 (evex.pfx & VEX_PREFIX_SCALAR_MASK))),
-                              EXC_UD);
+                              X86_EXC_UD);
         host_and_vcpu_must_have(avx512f);
         if ( ea.type != OP_REG || !evex.brs )
             avx512_vlen_check(evex.pfx & VEX_PREFIX_SCALAR_MASK);
@@ -6493,7 +6470,7 @@ x86_emulate(
     case X86EMUL_OPC_VEX_66(0x0f, 0x16):   /* vmovhpd m64,xmm,xmm */
     CASE_SIMD_PACKED_FP_VEX(0x0f, 0x17):   /* movhp{s,d} xmm,m64 */
                                            /* vmovhp{s,d} xmm,m64 */
-        generate_exception_if(ea.type != OP_MEM, EXC_UD);
+        generate_exception_if(ea.type != OP_MEM, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC(0x0f, 0x12):          /* movlps m64,xmm */
                                            /* movhlps xmm,xmm */
@@ -6503,7 +6480,7 @@ x86_emulate(
                                            /* movlhps xmm,xmm */
     case X86EMUL_OPC_VEX(0x0f, 0x16):      /* vmovhps m64,xmm,xmm */
                                            /* vmovlhps xmm,xmm,xmm */
-        generate_exception_if(vex.l, EXC_UD);
+        generate_exception_if(vex.l, X86_EXC_UD);
         if ( (d & DstMask) != DstMem )
             d &= ~TwoOp;
         op_bytes = 8;
@@ -6513,7 +6490,7 @@ x86_emulate(
     CASE_SIMD_PACKED_FP(_EVEX, 0x0f, 0x13): /* vmovlp{s,d} xmm,m64 */
     case X86EMUL_OPC_EVEX_66(0x0f, 0x16):   /* vmovhpd m64,xmm,xmm */
     CASE_SIMD_PACKED_FP(_EVEX, 0x0f, 0x17): /* vmovhp{s,d} xmm,m64 */
-        generate_exception_if(ea.type != OP_MEM, EXC_UD);
+        generate_exception_if(ea.type != OP_MEM, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_EVEX(0x0f, 0x12):      /* vmovlps m64,xmm,xmm */
                                             /* vmovhlps xmm,xmm,xmm */
@@ -6521,7 +6498,7 @@ x86_emulate(
                                             /* vmovlhps xmm,xmm,xmm */
         generate_exception_if((evex.lr || evex.opmsk || evex.brs ||
                                evex.w != (evex.pfx & VEX_PREFIX_DOUBLE_MASK)),
-                              EXC_UD);
+                              X86_EXC_UD);
         host_and_vcpu_must_have(avx512f);
         if ( (d & DstMask) != DstMem )
             d &= ~TwoOp;
@@ -6548,7 +6525,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_F3(0x0f, 0x16):   /* vmovshdup [xyz]mm/mem,[xyz]mm{k} */
         generate_exception_if((evex.brs ||
                                evex.w != (evex.pfx & VEX_PREFIX_DOUBLE_MASK)),
-                              EXC_UD);
+                              X86_EXC_UD);
         host_and_vcpu_must_have(avx512f);
         avx512_vlen_check(false);
         d |= TwoOp;
@@ -6560,7 +6537,7 @@ x86_emulate(
     CASE_SIMD_PACKED_FP(_EVEX, 0x0f, 0x14): /* vunpcklp{s,d} [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     CASE_SIMD_PACKED_FP(_EVEX, 0x0f, 0x15): /* vunpckhp{s,d} [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
         generate_exception_if(evex.w != (evex.pfx & VEX_PREFIX_DOUBLE_MASK),
-                              EXC_UD);
+                              X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x76): /* vpermi2{d,q} [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x77): /* vpermi2p{s,d} [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
@@ -6587,7 +6564,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x65): /* vblendmp{s,d} [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     avx512f_no_sae:
         host_and_vcpu_must_have(avx512f);
-        generate_exception_if(ea.type != OP_MEM && evex.brs, EXC_UD);
+        generate_exception_if(ea.type != OP_MEM && evex.brs, X86_EXC_UD);
         avx512_vlen_check(false);
         goto simd_zmm;
 
@@ -6597,7 +6574,7 @@ x86_emulate(
     case X86EMUL_OPC(0x0f, 0x21): /* mov dr,reg */
     case X86EMUL_OPC(0x0f, 0x22): /* mov reg,cr */
     case X86EMUL_OPC(0x0f, 0x23): /* mov reg,dr */
-        generate_exception_if(!mode_ring0(), EXC_GP, 0);
+        generate_exception_if(!mode_ring0(), X86_EXC_GP, 0);
         if ( b & 2 )
         {
             /* Write to CR/DR. */
@@ -6665,7 +6642,7 @@ x86_emulate(
     CASE_SIMD_SCALAR_FP(_EVEX, 0x0f, 0x2a): /* vcvtsi2s{s,d} r/m,xmm,xmm */
     CASE_SIMD_SCALAR_FP(_EVEX, 0x0f, 0x7b): /* vcvtusi2s{s,d} r/m,xmm,xmm */
         generate_exception_if(evex.opmsk || (ea.type != OP_REG && evex.brs),
-                              EXC_UD);
+                              X86_EXC_UD);
         host_and_vcpu_must_have(avx512f);
         if ( !evex.brs )
             avx512_vlen_check(true);
@@ -6717,7 +6694,7 @@ x86_emulate(
         }
         else
         {
-            generate_exception_if(vex.reg != 0xf, EXC_UD);
+            generate_exception_if(vex.reg != 0xf, X86_EXC_UD);
             host_and_vcpu_must_have(avx);
             get_fpu(X86EMUL_FPU_ymm);
 
@@ -6776,7 +6753,7 @@ x86_emulate(
     CASE_SIMD_SCALAR_FP(_EVEX, 0x0f, 0x79): /* vcvts{s,d}2usi xmm/mem,reg */
         generate_exception_if((evex.reg != 0xf || !evex.RX || evex.opmsk ||
                                (ea.type != OP_REG && evex.brs)),
-                              EXC_UD);
+                              X86_EXC_UD);
         host_and_vcpu_must_have(avx512f);
         if ( !evex.brs )
             avx512_vlen_check(true);
@@ -6796,7 +6773,7 @@ x86_emulate(
         }
         else
         {
-            generate_exception_if(vex.reg != 0xf, EXC_UD);
+            generate_exception_if(vex.reg != 0xf, X86_EXC_UD);
             host_and_vcpu_must_have(avx);
             get_fpu(X86EMUL_FPU_ymm);
         }
@@ -6845,7 +6822,7 @@ x86_emulate(
         generate_exception_if((evex.reg != 0xf || !evex.RX || evex.opmsk ||
                                (ea.type != OP_REG && evex.brs) ||
                                evex.w != evex.pfx),
-                              EXC_UD);
+                              X86_EXC_UD);
         host_and_vcpu_must_have(avx512f);
         if ( !evex.brs )
             avx512_vlen_check(true);
@@ -6856,7 +6833,7 @@ x86_emulate(
         goto vcomi;
 
     case X86EMUL_OPC(0x0f, 0x30): /* wrmsr */
-        generate_exception_if(!mode_ring0(), EXC_GP, 0);
+        generate_exception_if(!mode_ring0(), X86_EXC_GP, 0);
         fail_if(ops->write_msr == NULL);
         if ( (rc = ops->write_msr(_regs.ecx,
                                   ((uint64_t)_regs.r(dx) << 32) | _regs.eax,
@@ -6870,7 +6847,7 @@ x86_emulate(
             fail_if(ops->read_cr == NULL);
             if ( (rc = ops->read_cr(4, &cr4, ctxt)) )
                 goto done;
-            generate_exception_if(cr4 & X86_CR4_TSD, EXC_GP, 0);
+            generate_exception_if(cr4 & X86_CR4_TSD, X86_EXC_GP, 0);
         }
         fail_if(ops->read_msr == NULL);
         if ( (rc = ops->read_msr(MSR_IA32_TSC,
@@ -6881,7 +6858,7 @@ x86_emulate(
         break;
 
     case X86EMUL_OPC(0x0f, 0x32): /* rdmsr */
-        generate_exception_if(!mode_ring0(), EXC_GP, 0);
+        generate_exception_if(!mode_ring0(), X86_EXC_GP, 0);
         fail_if(ops->read_msr == NULL);
         if ( (rc = ops->read_msr(_regs.ecx, &msr_val, ctxt)) != X86EMUL_OKAY )
             goto done;
@@ -6891,15 +6868,15 @@ x86_emulate(
 
     case X86EMUL_OPC(0x0f, 0x34): /* sysenter */
         vcpu_must_have(sep);
-        generate_exception_if(amd_like(ctxt) && ctxt->lma, EXC_UD);
-        generate_exception_if(!in_protmode(ctxt, ops), EXC_GP, 0);
+        generate_exception_if(amd_like(ctxt) && ctxt->lma, X86_EXC_UD);
+        generate_exception_if(!in_protmode(ctxt, ops), X86_EXC_GP, 0);
 
         fail_if(ops->read_msr == NULL);
         if ( (rc = ops->read_msr(MSR_IA32_SYSENTER_CS,
                                  &msr_val, ctxt)) != X86EMUL_OKAY )
             goto done;
 
-        generate_exception_if(!(msr_val & 0xfffc), EXC_GP, 0);
+        generate_exception_if(!(msr_val & 0xfffc), X86_EXC_GP, 0);
 
         _regs.eflags &= ~(X86_EFLAGS_VM | X86_EFLAGS_IF | X86_EFLAGS_RF);
 
@@ -6940,20 +6917,20 @@ x86_emulate(
 
     case X86EMUL_OPC(0x0f, 0x35): /* sysexit */
         vcpu_must_have(sep);
-        generate_exception_if(amd_like(ctxt) && ctxt->lma, EXC_UD);
-        generate_exception_if(!mode_ring0(), EXC_GP, 0);
-        generate_exception_if(!in_protmode(ctxt, ops), EXC_GP, 0);
+        generate_exception_if(amd_like(ctxt) && ctxt->lma, X86_EXC_UD);
+        generate_exception_if(!mode_ring0(), X86_EXC_GP, 0);
+        generate_exception_if(!in_protmode(ctxt, ops), X86_EXC_GP, 0);
 
         fail_if(ops->read_msr == NULL);
         if ( (rc = ops->read_msr(MSR_IA32_SYSENTER_CS,
                                  &msr_val, ctxt)) != X86EMUL_OKAY )
             goto done;
 
-        generate_exception_if(!(msr_val & 0xfffc), EXC_GP, 0);
+        generate_exception_if(!(msr_val & 0xfffc), X86_EXC_GP, 0);
         generate_exception_if(op_bytes == 8 &&
                               (!is_canonical_address(_regs.r(dx)) ||
                                !is_canonical_address(_regs.r(cx))),
-                              EXC_GP, 0);
+                              X86_EXC_GP, 0);
 
         cs.sel = (msr_val | 3) + /* SELECTOR_RPL_MASK */
                  (op_bytes == 8 ? 32 : 16);
@@ -7001,7 +6978,7 @@ x86_emulate(
     case X86EMUL_OPC_VEX(0x0f, 0x47):    /* kxor{w,q} k,k,k */
     case X86EMUL_OPC_VEX_66(0x0f, 0x47): /* kxor{b,d} k,k,k */
     case X86EMUL_OPC_VEX_66(0x0f, 0x4a): /* kadd{b,d} k,k,k */
-        generate_exception_if(!vex.l, EXC_UD);
+        generate_exception_if(!vex.l, X86_EXC_UD);
     opmask_basic:
         if ( vex.w )
             host_and_vcpu_must_have(avx512bw);
@@ -7010,7 +6987,7 @@ x86_emulate(
     opmask_common:
         host_and_vcpu_must_have(avx512f);
         generate_exception_if(!vex.r || (mode_64bit() && !(vex.reg & 8)) ||
-                              ea.type != OP_REG, EXC_UD);
+                              ea.type != OP_REG, X86_EXC_UD);
 
         vex.reg |= 8;
         d &= ~TwoOp;
@@ -7028,16 +7005,16 @@ x86_emulate(
 
     case X86EMUL_OPC_VEX(0x0f, 0x44):    /* knot{w,q} k,k */
     case X86EMUL_OPC_VEX_66(0x0f, 0x44): /* knot{b,d} k,k */
-        generate_exception_if(vex.l || vex.reg != 0xf, EXC_UD);
+        generate_exception_if(vex.l || vex.reg != 0xf, X86_EXC_UD);
         goto opmask_basic;
 
     case X86EMUL_OPC_VEX(0x0f, 0x4b):    /* kunpck{w,d}{d,q} k,k,k */
-        generate_exception_if(!vex.l, EXC_UD);
+        generate_exception_if(!vex.l, X86_EXC_UD);
         host_and_vcpu_must_have(avx512bw);
         goto opmask_common;
 
     case X86EMUL_OPC_VEX_66(0x0f, 0x4b): /* kunpckbw k,k,k */
-        generate_exception_if(!vex.l || vex.w, EXC_UD);
+        generate_exception_if(!vex.l || vex.w, X86_EXC_UD);
         goto opmask_common;
 
 #endif /* X86EMUL_NO_SIMD */
@@ -7058,7 +7035,7 @@ x86_emulate(
     simd_0f_to_gpr:
         opc[insn_bytes - PFX_BYTES] = 0xc3;
 
-        generate_exception_if(ea.type != OP_REG, EXC_UD);
+        generate_exception_if(ea.type != OP_REG, X86_EXC_UD);
 
         if ( vex.opcx == vex_none )
         {
@@ -7081,7 +7058,7 @@ x86_emulate(
         }
         else
         {
-            generate_exception_if(vex.reg != 0xf, EXC_UD);
+            generate_exception_if(vex.reg != 0xf, X86_EXC_UD);
             if ( b == 0x50 || !vex.l )
                 host_and_vcpu_must_have(avx);
             else
@@ -7104,7 +7081,7 @@ x86_emulate(
     CASE_SIMD_PACKED_FP(_EVEX, 0x0f, 0x57): /* vxorp{s,d} [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
         generate_exception_if((evex.w != (evex.pfx & VEX_PREFIX_DOUBLE_MASK) ||
                                (ea.type != OP_MEM && evex.brs)),
-                              EXC_UD);
+                              X86_EXC_UD);
         host_and_vcpu_must_have(avx512dq);
         avx512_vlen_check(false);
         goto simd_zmm;
@@ -7137,7 +7114,7 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX_66(0x0f, 0x5b): /* vcvtps2dq [xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_F3(0x0f, 0x5b): /* vcvttps2dq [xyz]mm/mem,[xyz]mm{k} */
-        generate_exception_if(evex.w, EXC_UD);
+        generate_exception_if(evex.w, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_EVEX(0x0f, 0x5b):    /* vcvtdq2ps [xyz]mm/mem,[xyz]mm{k} */
                                           /* vcvtqq2ps [xyz]mm/mem,{x,y}mm{k} */
@@ -7329,7 +7306,7 @@ x86_emulate(
 #ifndef X86EMUL_NO_SIMD
 
     case X86EMUL_OPC_EVEX_66(0x0f, 0xf6): /* vpsadbw [xyz]mm/mem,[xyz]mm,[xyz]mm */
-        generate_exception_if(evex.opmsk, EXC_UD);
+        generate_exception_if(evex.opmsk, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f, 0x60): /* vpunpcklbw [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f, 0x61): /* vpunpcklwd [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
@@ -7368,13 +7345,13 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x1d): /* vpabsw [xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x66): /* vpblendm{b,w} [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
         host_and_vcpu_must_have(avx512bw);
-        generate_exception_if(evex.brs, EXC_UD);
+        generate_exception_if(evex.brs, X86_EXC_UD);
         elem_bytes = 1 << (b & 1);
         goto avx512f_no_sae;
 
     case X86EMUL_OPC_EVEX_66(0x0f, 0x62): /* vpunpckldq [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f, 0x6a): /* vpunpckhdq [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
-        generate_exception_if(evex.w, EXC_UD);
+        generate_exception_if(evex.w, X86_EXC_UD);
         fault_suppression = false;
         op_bytes = 16 << evex.lr;
         goto avx512f_no_sae;
@@ -7393,21 +7370,21 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x27): /* vptestm{d,q} [xyz]mm/mem,[xyz]mm,k{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x29): /* vpcmpeqq [xyz]mm/mem,[xyz]mm,k{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x37): /* vpcmpgtq [xyz]mm/mem,[xyz]mm,k{k} */
-        generate_exception_if(!evex.r || !evex.R || evex.z, EXC_UD);
+        generate_exception_if(!evex.r || !evex.R || evex.z, X86_EXC_UD);
         if ( b & (ext == ext_0f38 ? 1 : 2) )
         {
-            generate_exception_if(b != 0x27 && evex.w != (b & 1), EXC_UD);
+            generate_exception_if(b != 0x27 && evex.w != (b & 1), X86_EXC_UD);
             goto avx512f_no_sae;
         }
         host_and_vcpu_must_have(avx512bw);
-        generate_exception_if(evex.brs, EXC_UD);
+        generate_exception_if(evex.brs, X86_EXC_UD);
         elem_bytes = 1 << (ext == ext_0f ? b & 1 : evex.w);
         avx512_vlen_check(false);
         goto simd_zmm;
 
     case X86EMUL_OPC_EVEX_66(0x0f, 0x6b): /* vpackssdw [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x2b): /* vpackusdw [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
-        generate_exception_if(evex.w || evex.brs, EXC_UD);
+        generate_exception_if(evex.w || evex.brs, X86_EXC_UD);
         fault_suppression = false;
         goto avx512f_no_sae;
 
@@ -7418,7 +7395,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f, 0xd4): /* vpaddq [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f, 0xf4): /* vpmuludq [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x28): /* vpmuldq [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
-        generate_exception_if(!evex.w, EXC_UD);
+        generate_exception_if(!evex.w, X86_EXC_UD);
         goto avx512f_no_sae;
 
 #endif /* X86EMUL_NO_SIMD */
@@ -7429,7 +7406,7 @@ x86_emulate(
                                           /* vmov{d,q} xmm,r/m */
         if ( vex.opcx != vex_none )
         {
-            generate_exception_if(vex.l || vex.reg != 0xf, EXC_UD);
+            generate_exception_if(vex.l || vex.reg != 0xf, X86_EXC_UD);
             host_and_vcpu_must_have(avx);
             get_fpu(X86EMUL_FPU_ymm);
         }
@@ -7470,7 +7447,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f, 0x7e): /* vmov{d,q} xmm,r/m */
         generate_exception_if((evex.lr || evex.opmsk || evex.brs ||
                                evex.reg != 0xf || !evex.RX),
-                              EXC_UD);
+                              X86_EXC_UD);
         host_and_vcpu_must_have(avx512f);
         get_fpu(X86EMUL_FPU_zmm);
 
@@ -7494,7 +7471,7 @@ x86_emulate(
 
     case X86EMUL_OPC_66(0x0f, 0xe7):     /* movntdq xmm,m128 */
     case X86EMUL_OPC_VEX_66(0x0f, 0xe7): /* vmovntdq {x,y}mm,mem */
-        generate_exception_if(ea.type != OP_MEM, EXC_UD);
+        generate_exception_if(ea.type != OP_MEM, X86_EXC_UD);
         sfence = true;
         /* fall through */
     case X86EMUL_OPC_66(0x0f, 0x6f):     /* movdqa xmm/m128,xmm */
@@ -7514,7 +7491,7 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX_66(0x0f, 0xe7): /* vmovntdq [xyz]mm,mem */
         generate_exception_if(ea.type != OP_MEM || evex.opmsk || evex.w,
-                              EXC_UD);
+                              X86_EXC_UD);
         sfence = true;
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f, 0x6f): /* vmovdqa{32,64} [xyz]mm/mem,[xyz]mm{k} */
@@ -7522,7 +7499,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f, 0x7f): /* vmovdqa{32,64} [xyz]mm,[xyz]mm/mem{k} */
     case X86EMUL_OPC_EVEX_F3(0x0f, 0x7f): /* vmovdqu{32,64} [xyz]mm,[xyz]mm/mem{k} */
     vmovdqa:
-        generate_exception_if(evex.brs, EXC_UD);
+        generate_exception_if(evex.brs, X86_EXC_UD);
         d |= TwoOp;
         op_bytes = 16 << evex.lr;
         goto avx512f_no_sae;
@@ -7534,7 +7511,7 @@ x86_emulate(
         goto vmovdqa;
 
     case X86EMUL_OPC_VEX_66(0x0f, 0xd6): /* vmovq xmm,xmm/m64 */
-        generate_exception_if(vex.l, EXC_UD);
+        generate_exception_if(vex.l, X86_EXC_UD);
         d |= TwoOp;
         /* fall through */
     case X86EMUL_OPC_66(0x0f, 0xd6):     /* movq xmm,xmm/m64 */
@@ -7619,11 +7596,11 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_F3(0x0f, 0x70): /* vpshufhw $imm8,[xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_F2(0x0f, 0x70): /* vpshuflw $imm8,[xyz]mm/mem,[xyz]mm{k} */
         if ( evex.pfx == vex_66 )
-            generate_exception_if(evex.w, EXC_UD);
+            generate_exception_if(evex.w, X86_EXC_UD);
         else
         {
             host_and_vcpu_must_have(avx512bw);
-            generate_exception_if(evex.brs, EXC_UD);
+            generate_exception_if(evex.brs, X86_EXC_UD);
         }
         d = (d & ~SrcMask) | SrcMem | TwoOp;
         op_bytes = 16 << evex.lr;
@@ -7647,7 +7624,7 @@ x86_emulate(
             goto unrecognized_insn;
         }
     simd_0f_shift_imm:
-        generate_exception_if(ea.type != OP_REG, EXC_UD);
+        generate_exception_if(ea.type != OP_REG, X86_EXC_UD);
 
         if ( vex.opcx != vex_none )
         {
@@ -7707,7 +7684,7 @@ x86_emulate(
         {
         case 2: /* vpsrld $imm8,[xyz]mm/mem,[xyz]mm{k} */
         case 6: /* vpslld $imm8,[xyz]mm/mem,[xyz]mm{k} */
-            generate_exception_if(evex.w, EXC_UD);
+            generate_exception_if(evex.w, X86_EXC_UD);
             /* fall through */
         case 0: /* vpror{d,q} $imm8,[xyz]mm/mem,[xyz]mm{k} */
         case 1: /* vprol{d,q} $imm8,[xyz]mm/mem,[xyz]mm{k} */
@@ -7755,11 +7732,11 @@ x86_emulate(
         {
         case 2: /* vpsrlq $imm8,[xyz]mm/mem,[xyz]mm{k} */
         case 6: /* vpsllq $imm8,[xyz]mm/mem,[xyz]mm{k} */
-            generate_exception_if(!evex.w, EXC_UD);
+            generate_exception_if(!evex.w, X86_EXC_UD);
             goto avx512f_shift_imm;
         case 3: /* vpsrldq $imm8,[xyz]mm/mem,[xyz]mm */
         case 7: /* vpslldq $imm8,[xyz]mm/mem,[xyz]mm */
-            generate_exception_if(evex.opmsk, EXC_UD);
+            generate_exception_if(evex.opmsk, X86_EXC_UD);
             goto avx512bw_shift_imm;
         }
         goto unrecognized_insn;
@@ -7773,7 +7750,7 @@ x86_emulate(
     case X86EMUL_OPC_VEX(0x0f, 0x77):    /* vzero{all,upper} */
         if ( vex.opcx != vex_none )
         {
-            generate_exception_if(vex.reg != 0xf, EXC_UD);
+            generate_exception_if(vex.reg != 0xf, X86_EXC_UD);
             host_and_vcpu_must_have(avx);
             get_fpu(X86EMUL_FPU_ymm);
 
@@ -7841,7 +7818,7 @@ x86_emulate(
         }
         /* fall through */
     case X86EMUL_OPC_F2(0x0f, 0x78):     /* insertq $imm8,$imm8,xmm,xmm */
-        generate_exception_if(ea.type != OP_REG, EXC_UD);
+        generate_exception_if(ea.type != OP_REG, X86_EXC_UD);
 
         host_and_vcpu_must_have(sse4a);
         get_fpu(X86EMUL_FPU_xmm);
@@ -7856,14 +7833,14 @@ x86_emulate(
 
     case X86EMUL_OPC_66(0x0f, 0x79):     /* extrq xmm,xmm */
     case X86EMUL_OPC_F2(0x0f, 0x79):     /* insertq xmm,xmm */
-        generate_exception_if(ea.type != OP_REG, EXC_UD);
+        generate_exception_if(ea.type != OP_REG, X86_EXC_UD);
         host_and_vcpu_must_have(sse4a);
         op_bytes = 8;
         goto simd_0f_xmm;
 
     case X86EMUL_OPC_EVEX_66(0x0f, 0xe6):   /* vcvttpd2dq [xyz]mm/mem,{x,y}mm{k} */
     case X86EMUL_OPC_EVEX_F2(0x0f, 0xe6):   /* vcvtpd2dq [xyz]mm/mem,{x,y}mm{k} */
-        generate_exception_if(!evex.w, EXC_UD);
+        generate_exception_if(!evex.w, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_EVEX_F3(0x0f, 0x7a):   /* vcvtudq2pd {x,y}mm/mem,[xyz]mm{k} */
                                             /* vcvtuqq2pd [xyz]mm/mem,[xyz]mm{k} */
@@ -7886,7 +7863,7 @@ x86_emulate(
         else
         {
             host_and_vcpu_must_have(avx512f);
-            generate_exception_if(ea.type != OP_MEM && evex.brs, EXC_UD);
+            generate_exception_if(ea.type != OP_MEM && evex.brs, X86_EXC_UD);
         }
         if ( ea.type != OP_REG || !evex.brs )
             avx512_vlen_check(false);
@@ -7896,7 +7873,7 @@ x86_emulate(
 
     case X86EMUL_OPC_F2(0x0f, 0xf0):     /* lddqu m128,xmm */
     case X86EMUL_OPC_VEX_F2(0x0f, 0xf0): /* vlddqu mem,{x,y}mm */
-        generate_exception_if(ea.type != OP_MEM, EXC_UD);
+        generate_exception_if(ea.type != OP_MEM, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_66(0x0f, 0x7c):     /* haddpd xmm/m128,xmm */
     case X86EMUL_OPC_F2(0x0f, 0x7c):     /* haddps xmm/m128,xmm */
@@ -7915,14 +7892,14 @@ x86_emulate(
 
     case X86EMUL_OPC_F3(0x0f, 0x7e):     /* movq xmm/m64,xmm */
     case X86EMUL_OPC_VEX_F3(0x0f, 0x7e): /* vmovq xmm/m64,xmm */
-        generate_exception_if(vex.l, EXC_UD);
+        generate_exception_if(vex.l, X86_EXC_UD);
         op_bytes = 8;
         goto simd_0f_int;
 
     case X86EMUL_OPC_EVEX_F3(0x0f, 0x7e): /* vmovq xmm/m64,xmm */
     case X86EMUL_OPC_EVEX_66(0x0f, 0xd6): /* vmovq xmm,xmm/m64 */
         generate_exception_if(evex.lr || !evex.w || evex.opmsk || evex.brs,
-                              EXC_UD);
+                              X86_EXC_UD);
         host_and_vcpu_must_have(avx512f);
         d |= TwoOp;
         op_bytes = 8;
@@ -7944,11 +7921,11 @@ x86_emulate(
 
     case X86EMUL_OPC_VEX(0x0f, 0x91):    /* kmov{w,q} k,mem */
     case X86EMUL_OPC_VEX_66(0x0f, 0x91): /* kmov{b,d} k,mem */
-        generate_exception_if(ea.type != OP_MEM, EXC_UD);
+        generate_exception_if(ea.type != OP_MEM, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_VEX(0x0f, 0x90):    /* kmov{w,q} k/mem,k */
     case X86EMUL_OPC_VEX_66(0x0f, 0x90): /* kmov{b,d} k/mem,k */
-        generate_exception_if(vex.l || !vex.r, EXC_UD);
+        generate_exception_if(vex.l || !vex.r, X86_EXC_UD);
         host_and_vcpu_must_have(avx512f);
         if ( vex.w )
         {
@@ -7981,14 +7958,14 @@ x86_emulate(
     case X86EMUL_OPC_VEX_66(0x0f, 0x92): /* kmovb r32,k */
     case X86EMUL_OPC_VEX_F2(0x0f, 0x92): /* kmov{d,q} reg,k */
         generate_exception_if(vex.l || !vex.r || vex.reg != 0xf ||
-                              ea.type != OP_REG, EXC_UD);
+                              ea.type != OP_REG, X86_EXC_UD);
 
         host_and_vcpu_must_have(avx512f);
         if ( vex.pfx == vex_f2 )
             host_and_vcpu_must_have(avx512bw);
         else
         {
-            generate_exception_if(vex.w, EXC_UD);
+            generate_exception_if(vex.w, X86_EXC_UD);
             if ( vex.pfx )
                 host_and_vcpu_must_have(avx512dq);
         }
@@ -8018,7 +7995,7 @@ x86_emulate(
     case X86EMUL_OPC_VEX_66(0x0f, 0x93): /* kmovb k,r32 */
     case X86EMUL_OPC_VEX_F2(0x0f, 0x93): /* kmov{d,q} k,reg */
         generate_exception_if(vex.l || vex.reg != 0xf || ea.type != OP_REG,
-                              EXC_UD);
+                              X86_EXC_UD);
         dst = ea;
         dst.reg = decode_gpr(&_regs, modrm_reg);
 
@@ -8030,7 +8007,7 @@ x86_emulate(
         }
         else
         {
-            generate_exception_if(vex.w, EXC_UD);
+            generate_exception_if(vex.w, X86_EXC_UD);
             dst.bytes = 4;
             if ( vex.pfx )
                 host_and_vcpu_must_have(avx512dq);
@@ -8063,7 +8040,7 @@ x86_emulate(
     case X86EMUL_OPC_VEX_66(0x0f, 0x98): /* kortest{b,d} k,k */
     case X86EMUL_OPC_VEX_66(0x0f, 0x99): /* ktest{b,d} k,k */
         generate_exception_if(vex.l || !vex.r || vex.reg != 0xf ||
-                              ea.type != OP_REG, EXC_UD);
+                              ea.type != OP_REG, X86_EXC_UD);
         host_and_vcpu_must_have(avx512f);
         if ( vex.w )
             host_and_vcpu_must_have(avx512bw);
@@ -8109,7 +8086,7 @@ x86_emulate(
             goto done;
 
         generate_exception_if((msr_val & MSR_MISC_FEATURES_CPUID_FAULTING),
-                              EXC_GP, 0); /* Faulting active? (Inc. CPL test) */
+                              X86_EXC_GP, 0); /* Faulting active? (Inc. CPL test) */
 
         rc = ops->cpuid(_regs.eax, _regs.ecx, &cpuid_leaf, ctxt);
         if ( rc != X86EMUL_OKAY )
@@ -8121,7 +8098,7 @@ x86_emulate(
         break;
 
     case X86EMUL_OPC(0x0f, 0xa3): bt: /* bt */
-        generate_exception_if(lock_prefix, EXC_UD);
+        generate_exception_if(lock_prefix, X86_EXC_UD);
 
         if ( ops->rmw && dst.type == OP_MEM &&
              (rc = read_ulong(dst.mem.seg, dst.mem.off, &dst.val,
@@ -8138,7 +8115,7 @@ x86_emulate(
     case X86EMUL_OPC(0x0f, 0xad): /* shrd %%cl,r,r/m */ {
         uint8_t shift, width = dst.bytes << 3;
 
-        generate_exception_if(lock_prefix, EXC_UD);
+        generate_exception_if(lock_prefix, X86_EXC_UD);
 
         if ( b & 1 )
             shift = _regs.cl;
@@ -8192,12 +8169,12 @@ x86_emulate(
     !defined(X86EMUL_NO_SIMD)
         case 0: /* fxsave */
         case 1: /* fxrstor */
-            generate_exception_if(vex.pfx, EXC_UD);
+            generate_exception_if(vex.pfx, X86_EXC_UD);
             vcpu_must_have(fxsr);
-            generate_exception_if(ea.type != OP_MEM, EXC_UD);
+            generate_exception_if(ea.type != OP_MEM, X86_EXC_UD);
             generate_exception_if(!is_aligned(ea.mem.seg, ea.mem.off, 16,
                                               ctxt, ops),
-                                  EXC_GP, 0);
+                                  X86_EXC_GP, 0);
             fail_if(!ops->blk);
             op_bytes =
 #ifdef __x86_64__
@@ -8233,20 +8210,20 @@ x86_emulate(
 
 #ifndef X86EMUL_NO_SIMD
         case 2: /* ldmxcsr */
-            generate_exception_if(vex.pfx, EXC_UD);
+            generate_exception_if(vex.pfx, X86_EXC_UD);
             vcpu_must_have(sse);
         ldmxcsr:
-            generate_exception_if(src.type != OP_MEM, EXC_UD);
+            generate_exception_if(src.type != OP_MEM, X86_EXC_UD);
             get_fpu(vex.opcx ? X86EMUL_FPU_ymm : X86EMUL_FPU_xmm);
-            generate_exception_if(src.val & ~mxcsr_mask, EXC_GP, 0);
+            generate_exception_if(src.val & ~mxcsr_mask, X86_EXC_GP, 0);
             asm volatile ( "ldmxcsr %0" :: "m" (src.val) );
             break;
 
         case 3: /* stmxcsr */
-            generate_exception_if(vex.pfx, EXC_UD);
+            generate_exception_if(vex.pfx, X86_EXC_UD);
             vcpu_must_have(sse);
         stmxcsr:
-            generate_exception_if(dst.type != OP_MEM, EXC_UD);
+            generate_exception_if(dst.type != OP_MEM, X86_EXC_UD);
             get_fpu(vex.opcx ? X86EMUL_FPU_ymm : X86EMUL_FPU_xmm);
             asm volatile ( "stmxcsr %0" : "=m" (dst.val) );
             break;
@@ -8254,14 +8231,14 @@ x86_emulate(
 
         case 5: /* lfence */
             fail_if(modrm_mod != 3);
-            generate_exception_if(vex.pfx, EXC_UD);
+            generate_exception_if(vex.pfx, X86_EXC_UD);
             vcpu_must_have(sse2);
             asm volatile ( "lfence" ::: "memory" );
             break;
         case 6:
             if ( modrm_mod == 3 ) /* mfence */
             {
-                generate_exception_if(vex.pfx, EXC_UD);
+                generate_exception_if(vex.pfx, X86_EXC_UD);
                 vcpu_must_have(sse2);
                 asm volatile ( "mfence" ::: "memory" );
                 break;
@@ -8277,7 +8254,7 @@ x86_emulate(
         case 7:
             if ( modrm_mod == 3 ) /* sfence */
             {
-                generate_exception_if(vex.pfx, EXC_UD);
+                generate_exception_if(vex.pfx, X86_EXC_UD);
                 vcpu_must_have(mmxext);
                 asm volatile ( "sfence" ::: "memory" );
                 break;
@@ -8305,11 +8282,11 @@ x86_emulate(
         switch ( modrm_reg & 7 )
         {
         case 2: /* vldmxcsr */
-            generate_exception_if(vex.l || vex.reg != 0xf, EXC_UD);
+            generate_exception_if(vex.l || vex.reg != 0xf, X86_EXC_UD);
             vcpu_must_have(avx);
             goto ldmxcsr;
         case 3: /* vstmxcsr */
-            generate_exception_if(vex.l || vex.reg != 0xf, EXC_UD);
+            generate_exception_if(vex.l || vex.reg != 0xf, X86_EXC_UD);
             vcpu_must_have(avx);
             goto stmxcsr;
         }
@@ -8319,11 +8296,11 @@ x86_emulate(
 
     case X86EMUL_OPC_F3(0x0f, 0xae): /* Grp15 */
         fail_if(modrm_mod != 3);
-        generate_exception_if((modrm_reg & 4) || !mode_64bit(), EXC_UD);
+        generate_exception_if((modrm_reg & 4) || !mode_64bit(), X86_EXC_UD);
         fail_if(!ops->read_cr);
         if ( (rc = ops->read_cr(4, &cr4, ctxt)) != X86EMUL_OKAY )
             goto done;
-        generate_exception_if(!(cr4 & X86_CR4_FSGSBASE), EXC_UD);
+        generate_exception_if(!(cr4 & X86_CR4_FSGSBASE), X86_EXC_UD);
         seg = modrm_reg & 1 ? x86_seg_gs : x86_seg_fs;
         fail_if(!ops->read_segment);
         if ( (rc = ops->read_segment(seg, &sreg, ctxt)) != X86EMUL_OKAY )
@@ -8343,7 +8320,7 @@ x86_emulate(
             {
                 sreg.base = *dst.reg;
                 generate_exception_if(!is_canonical_address(sreg.base),
-                                      EXC_GP, 0);
+                                      X86_EXC_GP, 0);
             }
             else
                 sreg.base = (uint32_t)*dst.reg;
@@ -8445,7 +8422,7 @@ x86_emulate(
         case 5: goto bts;
         case 6: goto btr;
         case 7: goto btc;
-        default: generate_exception(EXC_UD);
+        default: generate_exception(X86_EXC_UD);
         }
         break;
 
@@ -8563,7 +8540,7 @@ x86_emulate(
                                (ea.type != OP_REG && evex.brs &&
                                 (evex.pfx & VEX_PREFIX_SCALAR_MASK)) ||
                                !evex.r || !evex.R || evex.z),
-                              EXC_UD);
+                              X86_EXC_UD);
         host_and_vcpu_must_have(avx512f);
         if ( ea.type != OP_REG || !evex.brs )
             avx512_vlen_check(evex.pfx & VEX_PREFIX_SCALAR_MASK);
@@ -8595,7 +8572,7 @@ x86_emulate(
 
     CASE_SIMD_PACKED_INT_VEX(0x0f, 0xc4):  /* pinsrw $imm8,r32/m16,{,x}mm */
                                            /* vpinsrw $imm8,r32/m16,xmm,xmm */
-        generate_exception_if(vex.l, EXC_UD);
+        generate_exception_if(vex.l, X86_EXC_UD);
         memcpy(mmvalp, &src.val, 2);
         ea.type = OP_MEM;
         state->simd_size = simd_other;
@@ -8606,7 +8583,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f, 0xc4):   /* vpinsrw $imm8,r32/m16,xmm,xmm */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x20): /* vpinsrb $imm8,r32/m8,xmm,xmm */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x22): /* vpinsr{d,q} $imm8,r/m,xmm,xmm */
-        generate_exception_if(evex.lr || evex.opmsk || evex.brs, EXC_UD);
+        generate_exception_if(evex.lr || evex.opmsk || evex.brs, X86_EXC_UD);
         if ( b & 2 )
             host_and_vcpu_must_have(avx512dq);
         else
@@ -8623,7 +8600,7 @@ x86_emulate(
 
     CASE_SIMD_PACKED_INT_VEX(0x0f, 0xc5):  /* pextrw $imm8,{,x}mm,reg */
                                            /* vpextrw $imm8,xmm,reg */
-        generate_exception_if(vex.l, EXC_UD);
+        generate_exception_if(vex.l, X86_EXC_UD);
         opc = init_prefixes(stub);
         opc[0] = b;
         /* Convert GPR destination to %rAX. */
@@ -8640,7 +8617,7 @@ x86_emulate(
 
     CASE_SIMD_PACKED_FP(_EVEX, 0x0f, 0xc6): /* vshufp{s,d} $imm8,[xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
         generate_exception_if(evex.w != (evex.pfx & VEX_PREFIX_DOUBLE_MASK),
-                              EXC_UD);
+                              X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x03): /* valign{d,q} $imm8,[xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
         fault_suppression = false;
@@ -8648,7 +8625,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x25): /* vpternlog{d,q} $imm8,[xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     avx512f_imm8_no_sae:
         host_and_vcpu_must_have(avx512f);
-        generate_exception_if(ea.type != OP_MEM && evex.brs, EXC_UD);
+        generate_exception_if(ea.type != OP_MEM && evex.brs, X86_EXC_UD);
         avx512_vlen_check(false);
         goto simd_imm8_zmm;
 
@@ -8672,7 +8649,7 @@ x86_emulate(
 
             case 6: /* rdrand */
 #ifdef HAVE_AS_RDRAND
-                generate_exception_if(rep_prefix(), EXC_UD);
+                generate_exception_if(rep_prefix(), X86_EXC_UD);
                 host_and_vcpu_must_have(rdrand);
                 dst = ea;
                 switch ( op_bytes )
@@ -8703,7 +8680,7 @@ x86_emulate(
             case 7: /* rdseed / rdpid */
                 if ( repe_prefix() ) /* rdpid */
                 {
-                    generate_exception_if(ea.type != OP_REG, EXC_UD);
+                    generate_exception_if(ea.type != OP_REG, X86_EXC_UD);
                     vcpu_must_have(rdpid);
                     fail_if(!ops->read_msr);
                     if ( (rc = ops->read_msr(MSR_TSC_AUX, &msr_val,
@@ -8715,7 +8692,7 @@ x86_emulate(
                     break;
                 }
 #ifdef HAVE_AS_RDSEED
-                generate_exception_if(rep_prefix(), EXC_UD);
+                generate_exception_if(rep_prefix(), X86_EXC_UD);
                 host_and_vcpu_must_have(rdseed);
                 dst = ea;
                 switch ( op_bytes )
@@ -8745,14 +8722,14 @@ x86_emulate(
         }
 
         /* cmpxchg8b/cmpxchg16b */
-        generate_exception_if((modrm_reg & 7) != 1, EXC_UD);
+        generate_exception_if((modrm_reg & 7) != 1, X86_EXC_UD);
         fail_if(!ops->cmpxchg);
         if ( rex_prefix & REX_W )
         {
             host_and_vcpu_must_have(cx16);
             generate_exception_if(!is_aligned(ea.mem.seg, ea.mem.off, 16,
                                               ctxt, ops),
-                                  EXC_GP, 0);
+                                  X86_EXC_GP, 0);
             op_bytes = 16;
         }
         else
@@ -8851,7 +8828,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f, 0xe2): /* vpsra{d,q} xmm/m128,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f, 0xf2): /* vpslld xmm/m128,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f, 0xf3): /* vpsllq xmm/m128,[xyz]mm,[xyz]mm{k} */
-        generate_exception_if(evex.brs, EXC_UD);
+        generate_exception_if(evex.brs, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x0c): /* vpermilps [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x0d): /* vpermilpd [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
@@ -8864,7 +8841,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f, 0xfe): /* vpaddd [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x1e): /* vpabsd [xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x1f): /* vpabsq [xyz]mm/mem,[xyz]mm{k} */
-        generate_exception_if(evex.w != (b & 1), EXC_UD);
+        generate_exception_if(evex.w != (b & 1), X86_EXC_UD);
         goto avx512f_no_sae;
 
 #endif /* !X86EMUL_NO_SIMD */
@@ -8881,7 +8858,7 @@ x86_emulate(
 
     case X86EMUL_OPC_F3(0x0f, 0xd6):     /* movq2dq mm,xmm */
     case X86EMUL_OPC_F2(0x0f, 0xd6):     /* movdq2q xmm,mm */
-        generate_exception_if(ea.type != OP_REG, EXC_UD);
+        generate_exception_if(ea.type != OP_REG, X86_EXC_UD);
         op_bytes = 8;
         host_and_vcpu_must_have(mmx);
         goto simd_0f_int;
@@ -8890,7 +8867,7 @@ x86_emulate(
 #ifndef X86EMUL_NO_MMX
 
     case X86EMUL_OPC(0x0f, 0xe7):        /* movntq mm,m64 */
-        generate_exception_if(ea.type != OP_MEM, EXC_UD);
+        generate_exception_if(ea.type != OP_MEM, X86_EXC_UD);
         sfence = true;
         /* fall through */
     case X86EMUL_OPC(0x0f, 0xda):        /* pminub mm/m64,mm */
@@ -8913,7 +8890,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f, 0xea): /* vpminsw [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f, 0xee): /* vpmaxsw [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
         host_and_vcpu_must_have(avx512bw);
-        generate_exception_if(evex.brs, EXC_UD);
+        generate_exception_if(evex.brs, X86_EXC_UD);
         elem_bytes = b & 0x10 ? 1 : 2;
         goto avx512f_no_sae;
 
@@ -8930,10 +8907,10 @@ x86_emulate(
 #endif /* !X86EMUL_NO_SIMD */
 
     CASE_SIMD_PACKED_INT_VEX(0x0f, 0xf7): /* {,v}maskmov{q,dqu} {,x}mm,{,x}mm */
-        generate_exception_if(ea.type != OP_REG, EXC_UD);
+        generate_exception_if(ea.type != OP_REG, X86_EXC_UD);
         if ( vex.opcx != vex_none )
         {
-            generate_exception_if(vex.l || vex.reg != 0xf, EXC_UD);
+            generate_exception_if(vex.l || vex.reg != 0xf, X86_EXC_UD);
             d |= TwoOp;
             host_and_vcpu_must_have(avx);
             get_fpu(X86EMUL_FPU_ymm);
@@ -9036,23 +9013,23 @@ x86_emulate(
 
     case X86EMUL_OPC_VEX_66(0x0f38, 0x19): /* vbroadcastsd xmm/m64,ymm */
     case X86EMUL_OPC_VEX_66(0x0f38, 0x1a): /* vbroadcastf128 m128,ymm */
-        generate_exception_if(!vex.l, EXC_UD);
+        generate_exception_if(!vex.l, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_VEX_66(0x0f38, 0x18): /* vbroadcastss xmm/m32,{x,y}mm */
         if ( ea.type != OP_MEM )
         {
-            generate_exception_if(b & 2, EXC_UD);
+            generate_exception_if(b & 2, X86_EXC_UD);
             host_and_vcpu_must_have(avx2);
         }
         /* fall through */
     case X86EMUL_OPC_VEX_66(0x0f38, 0x0c): /* vpermilps {x,y}mm/mem,{x,y}mm,{x,y}mm */
     case X86EMUL_OPC_VEX_66(0x0f38, 0x0d): /* vpermilpd {x,y}mm/mem,{x,y}mm,{x,y}mm */
-        generate_exception_if(vex.w, EXC_UD);
+        generate_exception_if(vex.w, X86_EXC_UD);
         goto simd_0f_avx;
 
     case X86EMUL_OPC_VEX_66(0x0f38, 0x0e): /* vtestps {x,y}mm/mem,{x,y}mm */
     case X86EMUL_OPC_VEX_66(0x0f38, 0x0f): /* vtestpd {x,y}mm/mem,{x,y}mm */
-        generate_exception_if(vex.w, EXC_UD);
+        generate_exception_if(vex.w, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_66(0x0f38, 0x17):     /* ptest xmm/m128,xmm */
     case X86EMUL_OPC_VEX_66(0x0f38, 0x17): /* vptest {x,y}mm/mem,{x,y}mm */
@@ -9063,7 +9040,7 @@ x86_emulate(
         }
         else
         {
-            generate_exception_if(vex.reg != 0xf, EXC_UD);
+            generate_exception_if(vex.reg != 0xf, X86_EXC_UD);
             host_and_vcpu_must_have(avx);
             get_fpu(X86EMUL_FPU_ymm);
         }
@@ -9138,7 +9115,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x11): /* vpsravw [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x12): /* vpsllvw [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
         host_and_vcpu_must_have(avx512bw);
-        generate_exception_if(!evex.w || evex.brs, EXC_UD);
+        generate_exception_if(!evex.w || evex.brs, X86_EXC_UD);
         elem_bytes = 2;
         goto avx512f_no_sae;
 
@@ -9160,7 +9137,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x33): /* vpmovzxwd {x,y}mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x34): /* vpmovzxwq xmm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x35): /* vpmovzxdq {x,y}mm/mem,[xyz]mm{k} */
-            generate_exception_if(evex.w && (b & 7) == 5, EXC_UD);
+            generate_exception_if(evex.w && (b & 7) == 5, X86_EXC_UD);
         }
         else
         {
@@ -9179,22 +9156,22 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_F3(0x0f38, 0x33): /* vpmovdw [xyz]mm,{x,y}mm/mem{k} */
     case X86EMUL_OPC_EVEX_F3(0x0f38, 0x34): /* vpmovqw [xyz]mm,xmm/mem{k} */
     case X86EMUL_OPC_EVEX_F3(0x0f38, 0x35): /* vpmovqd [xyz]mm,{x,y}mm/mem{k} */
-            generate_exception_if(evex.w || (ea.type != OP_REG && evex.z), EXC_UD);
+            generate_exception_if(evex.w || (ea.type != OP_REG && evex.z), X86_EXC_UD);
             d = DstMem | SrcReg | TwoOp;
         }
-        generate_exception_if(evex.brs, EXC_UD);
+        generate_exception_if(evex.brs, X86_EXC_UD);
         op_bytes = 32 >> (pmov_convert_delta[b & 7] + 1 - evex.lr);
         elem_bytes = (b & 7) < 3 ? 1 : (b & 7) != 5 ? 2 : 4;
         goto avx512f_no_sae;
 
     case X86EMUL_OPC_VEX_66(0x0f38, 0x13): /* vcvtph2ps xmm/mem,{x,y}mm */
-        generate_exception_if(vex.w, EXC_UD);
+        generate_exception_if(vex.w, X86_EXC_UD);
         host_and_vcpu_must_have(f16c);
         op_bytes = 8 << vex.l;
         goto simd_0f_ymm;
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x13): /* vcvtph2ps {x,y}mm/mem,[xyz]mm{k} */
-        generate_exception_if(evex.w || (ea.type != OP_REG && evex.brs), EXC_UD);
+        generate_exception_if(evex.w || (ea.type != OP_REG && evex.brs), X86_EXC_UD);
         host_and_vcpu_must_have(avx512f);
         if ( !evex.brs )
             avx512_vlen_check(false);
@@ -9204,19 +9181,19 @@ x86_emulate(
 
     case X86EMUL_OPC_VEX_66(0x0f38, 0x16): /* vpermps ymm/m256,ymm,ymm */
     case X86EMUL_OPC_VEX_66(0x0f38, 0x36): /* vpermd ymm/m256,ymm,ymm */
-        generate_exception_if(!vex.l || vex.w, EXC_UD);
+        generate_exception_if(!vex.l || vex.w, X86_EXC_UD);
         goto simd_0f_avx2;
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x16): /* vpermp{s,d} {y,z}mm/mem,{y,z}mm,{y,z}mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x36): /* vperm{d,q} {y,z}mm/mem,{y,z}mm,{y,z}mm{k} */
-        generate_exception_if(!evex.lr, EXC_UD);
+        generate_exception_if(!evex.lr, X86_EXC_UD);
         fault_suppression = false;
         goto avx512f_no_sae;
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x18): /* vbroadcastss xmm/m32,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x58): /* vpbroadcastd xmm/m32,[xyz]mm{k} */
         op_bytes = elem_bytes;
-        generate_exception_if(evex.w || evex.brs, EXC_UD);
+        generate_exception_if(evex.w || evex.brs, X86_EXC_UD);
     avx512_broadcast:
         /*
          * For the respective code below the main switch() to work we need to
@@ -9237,17 +9214,17 @@ x86_emulate(
                                             /* vbroadcastf64x4 m256,zmm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x5b): /* vbroadcasti32x8 m256,zmm{k} */
                                             /* vbroadcasti64x4 m256,zmm{k} */
-        generate_exception_if(ea.type != OP_MEM || evex.lr != 2, EXC_UD);
+        generate_exception_if(ea.type != OP_MEM || evex.lr != 2, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x19): /* vbroadcastsd xmm/m64,{y,z}mm{k} */
                                             /* vbroadcastf32x2 xmm/m64,{y,z}mm{k} */
-        generate_exception_if(!evex.lr, EXC_UD);
+        generate_exception_if(!evex.lr, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x59): /* vpbroadcastq xmm/m64,[xyz]mm{k} */
                                             /* vbroadcasti32x2 xmm/m64,[xyz]mm{k} */
         if ( b == 0x59 )
             op_bytes = 8;
-        generate_exception_if(evex.brs, EXC_UD);
+        generate_exception_if(evex.brs, X86_EXC_UD);
         if ( !evex.w )
             host_and_vcpu_must_have(avx512dq);
         goto avx512_broadcast;
@@ -9257,7 +9234,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x5a): /* vbroadcasti32x4 m128,{y,z}mm{k} */
                                             /* vbroadcasti64x2 m128,{y,z}mm{k} */
         generate_exception_if(ea.type != OP_MEM || !evex.lr || evex.brs,
-                              EXC_UD);
+                              X86_EXC_UD);
         if ( evex.w )
             host_and_vcpu_must_have(avx512dq);
         goto avx512_broadcast;
@@ -9279,7 +9256,7 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX_F3(0x0f38, 0x29): /* vpmov{b,w}2m [xyz]mm,k */
     case X86EMUL_OPC_EVEX_F3(0x0f38, 0x39): /* vpmov{d,q}2m [xyz]mm,k */
-        generate_exception_if(!evex.r || !evex.R, EXC_UD);
+        generate_exception_if(!evex.r || !evex.R, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_EVEX_F3(0x0f38, 0x28): /* vpmovm2{b,w} k,[xyz]mm */
     case X86EMUL_OPC_EVEX_F3(0x0f38, 0x38): /* vpmovm2{d,q} k,[xyz]mm */
@@ -9287,14 +9264,14 @@ x86_emulate(
             host_and_vcpu_must_have(avx512dq);
         else
             host_and_vcpu_must_have(avx512bw);
-        generate_exception_if(evex.opmsk || ea.type != OP_REG, EXC_UD);
+        generate_exception_if(evex.opmsk || ea.type != OP_REG, X86_EXC_UD);
         d |= TwoOp;
         op_bytes = 16 << evex.lr;
         goto avx512f_no_sae;
 
     case X86EMUL_OPC_66(0x0f38, 0x2a):     /* movntdqa m128,xmm */
     case X86EMUL_OPC_VEX_66(0x0f38, 0x2a): /* vmovntdqa mem,{x,y}mm */
-        generate_exception_if(ea.type != OP_MEM, EXC_UD);
+        generate_exception_if(ea.type != OP_MEM, X86_EXC_UD);
         /* Ignore the non-temporal hint for now, using movdqa instead. */
         asm volatile ( "mfence" ::: "memory" );
         b = 0x6f;
@@ -9310,7 +9287,7 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x2a): /* vmovntdqa mem,[xyz]mm */
         generate_exception_if(ea.type != OP_MEM || evex.opmsk || evex.w,
-                              EXC_UD);
+                              X86_EXC_UD);
         /* Ignore the non-temporal hint for now, using vmovdqa32 instead. */
         asm volatile ( "mfence" ::: "memory" );
         b = 0x6f;
@@ -9321,7 +9298,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_F3(0x0f38, 0x3a): /* vpbroadcastmw2d k,[xyz]mm */
         generate_exception_if((ea.type != OP_REG || evex.opmsk ||
                                evex.w == ((b >> 4) & 1)),
-                              EXC_UD);
+                              X86_EXC_UD);
         d |= TwoOp;
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0xc4): /* vpconflict{d,q} [xyz]mm/mem,[xyz]mm{k} */
@@ -9338,7 +9315,7 @@ x86_emulate(
     {
         typeof(vex) *pvex;
 
-        generate_exception_if(ea.type != OP_MEM || vex.w, EXC_UD);
+        generate_exception_if(ea.type != OP_MEM || vex.w, X86_EXC_UD);
         host_and_vcpu_must_have(avx);
         elem_bytes = 4 << (b & 1);
     vmaskmov:
@@ -9425,7 +9402,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f38, 0xbf): /* vfnmsub231s{s,d} xmm/mem,xmm,xmm{k} */
         host_and_vcpu_must_have(avx512f);
     simd_zmm_scalar_sae:
-        generate_exception_if(ea.type != OP_REG && evex.brs, EXC_UD);
+        generate_exception_if(ea.type != OP_REG && evex.brs, X86_EXC_UD);
         if ( !evex.brs )
             avx512_vlen_check(true);
         goto simd_zmm;
@@ -9439,7 +9416,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x3c): /* vpmaxsb [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x3e): /* vpmaxuw [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
         host_and_vcpu_must_have(avx512bw);
-        generate_exception_if(evex.brs, EXC_UD);
+        generate_exception_if(evex.brs, X86_EXC_UD);
         elem_bytes = b & 2 ?: 1;
         goto avx512f_no_sae;
 
@@ -9459,7 +9436,7 @@ x86_emulate(
             goto simd_0f38_common;
         /* fall through */
     case X86EMUL_OPC_VEX_66(0x0f38, 0x41): /* vphminposuw xmm/m128,xmm,xmm */
-        generate_exception_if(vex.l, EXC_UD);
+        generate_exception_if(vex.l, X86_EXC_UD);
         goto simd_0f_avx;
 
     case X86EMUL_OPC_VEX_66(0x0f38, 0x50): /* vpdpbusd [xy]mm/mem,[xy]mm,[xy]mm */
@@ -9467,7 +9444,7 @@ x86_emulate(
     case X86EMUL_OPC_VEX_66(0x0f38, 0x52): /* vpdpwssd [xy]mm/mem,[xy]mm,[xy]mm */
     case X86EMUL_OPC_VEX_66(0x0f38, 0x53): /* vpdpwssds [xy]mm/mem,[xy]mm,[xy]mm */
         host_and_vcpu_must_have(avx_vnni);
-        generate_exception_if(vex.w, EXC_UD);
+        generate_exception_if(vex.w, X86_EXC_UD);
         goto simd_0f_avx;
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x50): /* vpdpbusd [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
@@ -9475,7 +9452,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x52): /* vpdpwssd [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x53): /* vpdpwssds [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
         host_and_vcpu_must_have(avx512_vnni);
-        generate_exception_if(evex.w, EXC_UD);
+        generate_exception_if(evex.w, X86_EXC_UD);
         goto avx512f_no_sae;
 
     case X86EMUL_OPC_EVEX_F2(0x0f38, 0x72): /* vcvtne2ps2bf16 [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
@@ -9487,7 +9464,7 @@ x86_emulate(
         /* fall through */
     case X86EMUL_OPC_EVEX_F3(0x0f38, 0x52): /* vdpbf16ps [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
         host_and_vcpu_must_have(avx512_bf16);
-        generate_exception_if(evex.w, EXC_UD);
+        generate_exception_if(evex.w, X86_EXC_UD);
         op_bytes = 16 << evex.lr;
         goto avx512f_no_sae;
 
@@ -9498,13 +9475,13 @@ x86_emulate(
         op_bytes = 1 << ((!(b & 0x20) * 2) + (b & 1));
         /* fall through */
     case X86EMUL_OPC_VEX_66(0x0f38, 0x46): /* vpsravd {x,y}mm/mem,{x,y}mm,{x,y}mm */
-        generate_exception_if(vex.w, EXC_UD);
+        generate_exception_if(vex.w, X86_EXC_UD);
         goto simd_0f_avx2;
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x4d): /* vrcp14s{s,d} xmm/mem,xmm,xmm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x4f): /* vrsqrt14s{s,d} xmm/mem,xmm,xmm{k} */
         host_and_vcpu_must_have(avx512f);
-        generate_exception_if(evex.brs, EXC_UD);
+        generate_exception_if(evex.brs, X86_EXC_UD);
         avx512_vlen_check(true);
         goto simd_zmm;
 
@@ -9513,16 +9490,16 @@ x86_emulate(
         host_and_vcpu_must_have(avx512_4vnniw);
         generate_exception_if((ea.type != OP_MEM || evex.w || evex.brs ||
                                evex.lr != 2),
-                              EXC_UD);
+                              X86_EXC_UD);
         op_mask = op_mask & 0xffff ? 0xf : 0;
         goto simd_zmm;
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x8f): /* vpshufbitqmb [xyz]mm/mem,[xyz]mm,k{k} */
-        generate_exception_if(evex.w || !evex.r || !evex.R || evex.z, EXC_UD);
+        generate_exception_if(evex.w || !evex.r || !evex.R || evex.z, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x54): /* vpopcnt{b,w} [xyz]mm/mem,[xyz]mm{k} */
         host_and_vcpu_must_have(avx512_bitalg);
-        generate_exception_if(evex.brs, EXC_UD);
+        generate_exception_if(evex.brs, X86_EXC_UD);
         elem_bytes = 1 << evex.w;
         goto avx512f_no_sae;
 
@@ -9531,7 +9508,7 @@ x86_emulate(
         goto avx512f_no_sae;
 
     case X86EMUL_OPC_VEX_66(0x0f38, 0x5a): /* vbroadcasti128 m128,ymm */
-        generate_exception_if(ea.type != OP_MEM || !vex.l || vex.w, EXC_UD);
+        generate_exception_if(ea.type != OP_MEM || !vex.l || vex.w, X86_EXC_UD);
         goto simd_0f_avx2;
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x62): /* vpexpand{b,w} [xyz]mm/mem,[xyz]mm{k} */
@@ -9544,7 +9521,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x8a): /* vcompressp{s,d} [xyz]mm,[xyz]mm/mem{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x8b): /* vpcompress{d,q} [xyz]mm,[xyz]mm/mem{k} */
         host_and_vcpu_must_have(avx512f);
-        generate_exception_if(evex.brs, EXC_UD);
+        generate_exception_if(evex.brs, X86_EXC_UD);
         avx512_vlen_check(false);
         /*
          * For the respective code below the main switch() to work we need to
@@ -9566,13 +9543,13 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX_F2(0x0f38, 0x68): /* vp2intersect{d,q} [xyz]mm/mem,[xyz]mm,k+1 */
         host_and_vcpu_must_have(avx512_vp2intersect);
-        generate_exception_if(evex.opmsk || !evex.r || !evex.R, EXC_UD);
+        generate_exception_if(evex.opmsk || !evex.r || !evex.R, X86_EXC_UD);
         op_bytes = 16 << evex.lr;
         goto avx512f_no_sae;
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x70): /* vpshldvw [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x72): /* vpshrdvw [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
-        generate_exception_if(!evex.w, EXC_UD);
+        generate_exception_if(!evex.w, X86_EXC_UD);
         elem_bytes = 2;
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x71): /* vpshldv{d,q} [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
@@ -9587,14 +9564,14 @@ x86_emulate(
             host_and_vcpu_must_have(avx512_vbmi);
         else
             host_and_vcpu_must_have(avx512bw);
-        generate_exception_if(evex.brs, EXC_UD);
+        generate_exception_if(evex.brs, X86_EXC_UD);
         fault_suppression = false;
         goto avx512f_no_sae;
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x78): /* vpbroadcastb xmm/m8,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x79): /* vpbroadcastw xmm/m16,[xyz]mm{k} */
         host_and_vcpu_must_have(avx512bw);
-        generate_exception_if(evex.w || evex.brs, EXC_UD);
+        generate_exception_if(evex.w || evex.brs, X86_EXC_UD);
         op_bytes = elem_bytes = 1 << (b & 1);
         /* See the comment at the avx512_broadcast label. */
         op_mask |= !(b & 1 ? !(uint32_t)op_mask : !op_mask);
@@ -9603,12 +9580,12 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x7a): /* vpbroadcastb r32,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x7b): /* vpbroadcastw r32,[xyz]mm{k} */
         host_and_vcpu_must_have(avx512bw);
-        generate_exception_if(evex.w, EXC_UD);
+        generate_exception_if(evex.w, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x7c): /* vpbroadcast{d,q} reg,[xyz]mm{k} */
         generate_exception_if((ea.type != OP_REG || evex.brs ||
                                evex.reg != 0xf || !evex.RX),
-                              EXC_UD);
+                              X86_EXC_UD);
         host_and_vcpu_must_have(avx512f);
         avx512_vlen_check(false);
         get_fpu(X86EMUL_FPU_zmm);
@@ -9634,21 +9611,21 @@ x86_emulate(
 
     case X86EMUL_OPC_66(0x0f38, 0x82): /* invpcid reg,m128 */
         vcpu_must_have(invpcid);
-        generate_exception_if(ea.type != OP_MEM, EXC_UD);
-        generate_exception_if(!mode_ring0(), EXC_GP, 0);
+        generate_exception_if(ea.type != OP_MEM, X86_EXC_UD);
+        generate_exception_if(!mode_ring0(), X86_EXC_GP, 0);
 
         if ( (rc = ops->read(ea.mem.seg, ea.mem.off, mmvalp, 16,
                              ctxt)) != X86EMUL_OKAY )
             goto done;
 
-        generate_exception_if(mmvalp->xmm[0] & ~0xfff, EXC_GP, 0);
+        generate_exception_if(mmvalp->xmm[0] & ~0xfff, X86_EXC_GP, 0);
         dst.val = mode_64bit() ? *dst.reg : (uint32_t)*dst.reg;
 
         switch ( dst.val )
         {
         case X86_INVPCID_INDIV_ADDR:
              generate_exception_if(!is_canonical_address(mmvalp->xmm[1]),
-                                   EXC_GP, 0);
+                                   X86_EXC_GP, 0);
              /* fall through */
         case X86_INVPCID_SINGLE_CTXT:
              if ( !mode_64bit() || !ops->read_cr )
@@ -9656,13 +9633,13 @@ x86_emulate(
              else if ( (rc = ops->read_cr(4, &cr4, ctxt)) != X86EMUL_OKAY )
                  goto done;
              generate_exception_if(!(cr4 & X86_CR4_PCIDE) && mmvalp->xmm[0],
-                                   EXC_GP, 0);
+                                   X86_EXC_GP, 0);
              break;
         case X86_INVPCID_ALL_INCL_GLOBAL:
         case X86_INVPCID_ALL_NON_GLOBAL:
              break;
         default:
-             generate_exception(EXC_GP, 0);
+             generate_exception(X86_EXC_GP, 0);
         }
 
         fail_if(!ops->tlb_op);
@@ -9677,14 +9654,14 @@ x86_emulate(
 #ifndef X86EMUL_NO_SIMD
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x83): /* vpmultishiftqb [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
-        generate_exception_if(!evex.w, EXC_UD);
+        generate_exception_if(!evex.w, X86_EXC_UD);
         host_and_vcpu_must_have(avx512_vbmi);
         fault_suppression = false;
         goto avx512f_no_sae;
 
     case X86EMUL_OPC_VEX_66(0x0f38, 0x8c): /* vpmaskmov{d,q} mem,{x,y}mm,{x,y}mm */
     case X86EMUL_OPC_VEX_66(0x0f38, 0x8e): /* vpmaskmov{d,q} {x,y}mm,{x,y}mm,mem */
-        generate_exception_if(ea.type != OP_MEM, EXC_UD);
+        generate_exception_if(ea.type != OP_MEM, X86_EXC_UD);
         host_and_vcpu_must_have(avx2);
         elem_bytes = 4 << vex.w;
         goto vmaskmov;
@@ -9705,8 +9682,8 @@ x86_emulate(
         ASSERT(ea.type == OP_MEM);
         generate_exception_if(modrm_reg == state->sib_index ||
                               modrm_reg == mask_reg ||
-                              state->sib_index == mask_reg, EXC_UD);
-        generate_exception_if(!cpu_has_avx, EXC_UD);
+                              state->sib_index == mask_reg, X86_EXC_UD);
+        generate_exception_if(!cpu_has_avx, X86_EXC_UD);
         vcpu_must_have(avx2);
         get_fpu(X86EMUL_FPU_ymm);
 
@@ -9825,7 +9802,7 @@ x86_emulate(
         generate_exception_if((!evex.opmsk || evex.brs || evex.z ||
                                evex.reg != 0xf ||
                                modrm_reg == state->sib_index),
-                              EXC_UD);
+                              X86_EXC_UD);
         avx512_vlen_check(false);
         host_and_vcpu_must_have(avx512f);
         get_fpu(X86EMUL_FPU_zmm);
@@ -9975,7 +9952,7 @@ x86_emulate(
         host_and_vcpu_must_have(avx512_4fmaps);
         generate_exception_if((ea.type != OP_MEM || evex.w || evex.brs ||
                                evex.lr != 2),
-                              EXC_UD);
+                              X86_EXC_UD);
         op_mask = op_mask & 0xffff ? 0xf : 0;
         goto simd_zmm;
 
@@ -9984,7 +9961,7 @@ x86_emulate(
         host_and_vcpu_must_have(avx512_4fmaps);
         generate_exception_if((ea.type != OP_MEM || evex.w || evex.brs ||
                                evex.lr == 3),
-                              EXC_UD);
+                              X86_EXC_UD);
         op_mask = op_mask & 1 ? 0xf : 0;
         goto simd_zmm;
 
@@ -10005,7 +9982,7 @@ x86_emulate(
         generate_exception_if((!evex.opmsk || evex.brs || evex.z ||
                                evex.reg != 0xf ||
                                modrm_reg == state->sib_index),
-                              EXC_UD);
+                              X86_EXC_UD);
         avx512_vlen_check(false);
         host_and_vcpu_must_have(avx512f);
         get_fpu(X86EMUL_FPU_zmm);
@@ -10091,7 +10068,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f38, 0xb4): /* vpmadd52luq [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0xb5): /* vpmadd52huq [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
         host_and_vcpu_must_have(avx512_ifma);
-        generate_exception_if(!evex.w, EXC_UD);
+        generate_exception_if(!evex.w, X86_EXC_UD);
         goto avx512f_no_sae;
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0xc6):
@@ -10108,7 +10085,7 @@ x86_emulate(
         ASSERT(ea.type == OP_MEM);
         generate_exception_if((!cpu_has_avx512f || !evex.opmsk || evex.brs ||
                                evex.z || evex.reg != 0xf || evex.lr != 2),
-                              EXC_UD);
+                              X86_EXC_UD);
 
         switch ( modrm_reg & 7 )
         {
@@ -10119,7 +10096,7 @@ x86_emulate(
             vcpu_must_have(avx512pf);
             break;
         default:
-            generate_exception(EXC_UD);
+            generate_exception(X86_EXC_UD);
         }
 
         get_fpu(X86EMUL_FPU_zmm);
@@ -10200,7 +10177,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f38, 0xcc): /* vrsqrt28p{s,d} zmm/mem,zmm{k} */
         host_and_vcpu_must_have(avx512er);
         generate_exception_if((ea.type != OP_REG || !evex.brs) && evex.lr != 2,
-                              EXC_UD);
+                              X86_EXC_UD);
         goto simd_zmm;
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0xcb): /* vrcp28s{s,d} xmm/mem,xmm,xmm{k} */
@@ -10214,12 +10191,12 @@ x86_emulate(
 
     case X86EMUL_OPC_VEX_66(0x0f38, 0xcf):  /* vgf2p8mulb {x,y}mm/mem,{x,y}mm,{x,y}mm */
         host_and_vcpu_must_have(gfni);
-        generate_exception_if(vex.w, EXC_UD);
+        generate_exception_if(vex.w, X86_EXC_UD);
         goto simd_0f_avx;
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0xcf): /* vgf2p8mulb [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
         host_and_vcpu_must_have(gfni);
-        generate_exception_if(evex.w || evex.brs, EXC_UD);
+        generate_exception_if(evex.w || evex.brs, X86_EXC_UD);
         elem_bytes = 1;
         goto avx512f_no_sae;
 
@@ -10238,7 +10215,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f38, 0xde): /* vaesdec [xyz]mm/mem,[xyz]mm,[xyz]mm */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0xdf): /* vaesdeclast [xyz]mm/mem,[xyz]mm,[xyz]mm */
         host_and_vcpu_must_have(vaes);
-        generate_exception_if(evex.brs || evex.opmsk, EXC_UD);
+        generate_exception_if(evex.brs || evex.opmsk, X86_EXC_UD);
         goto avx512f_no_sae;
 
 #endif /* !X86EMUL_NO_SIMD */
@@ -10311,7 +10288,7 @@ x86_emulate(
             host_and_vcpu_must_have(bmi2);
         else
             host_and_vcpu_must_have(bmi1);
-        generate_exception_if(vex.l, EXC_UD);
+        generate_exception_if(vex.l, X86_EXC_UD);
 
         buf[0] = 0xc4;
         *pvex = vex;
@@ -10345,7 +10322,7 @@ x86_emulate(
             goto unrecognized_insn;
         }
 
-        generate_exception_if(vex.l, EXC_UD);
+        generate_exception_if(vex.l, X86_EXC_UD);
 
         buf[0] = 0xc4;
         *pvex = vex;
@@ -10398,7 +10375,7 @@ x86_emulate(
 
     case X86EMUL_OPC_VEX_F2(0x0f38, 0xf6): /* mulx r/m,r,r */
         vcpu_must_have(bmi2);
-        generate_exception_if(vex.l, EXC_UD);
+        generate_exception_if(vex.l, X86_EXC_UD);
         ea.reg = decode_vex_gpr(vex.reg, &_regs, ctxt);
         if ( mode_64bit() && vex.w )
             asm ( "mulq %3" : "=a" (*ea.reg), "=d" (dst.val)
@@ -10410,10 +10387,10 @@ x86_emulate(
 
     case X86EMUL_OPC_66(0x0f38, 0xf8): /* movdir64b r,m512 */
         host_and_vcpu_must_have(movdir64b);
-        generate_exception_if(ea.type != OP_MEM, EXC_UD);
+        generate_exception_if(ea.type != OP_MEM, X86_EXC_UD);
         src.val = truncate_ea(*dst.reg);
         generate_exception_if(!is_aligned(x86_seg_es, src.val, 64, ctxt, ops),
-                              EXC_GP, 0);
+                              X86_EXC_GP, 0);
         fail_if(!ops->blk);
         state->blk = blk_movdir;
         BUILD_BUG_ON(sizeof(*mmvalp) < 64);
@@ -10428,11 +10405,11 @@ x86_emulate(
     case X86EMUL_OPC_F2(0x0f38, 0xf8): /* enqcmd r,m512 */
     case X86EMUL_OPC_F3(0x0f38, 0xf8): /* enqcmds r,m512 */
         host_and_vcpu_must_have(enqcmd);
-        generate_exception_if(ea.type != OP_MEM, EXC_UD);
-        generate_exception_if(vex.pfx != vex_f2 && !mode_ring0(), EXC_GP, 0);
+        generate_exception_if(ea.type != OP_MEM, X86_EXC_UD);
+        generate_exception_if(vex.pfx != vex_f2 && !mode_ring0(), X86_EXC_GP, 0);
         src.val = truncate_ea(*dst.reg);
         generate_exception_if(!is_aligned(x86_seg_es, src.val, 64, ctxt, ops),
-                              EXC_GP, 0);
+                              X86_EXC_GP, 0);
         fail_if(!ops->blk);
         BUILD_BUG_ON(sizeof(*mmvalp) < 64);
         if ( (rc = ops->read(ea.mem.seg, ea.mem.off, mmvalp, 64,
@@ -10444,7 +10421,7 @@ x86_emulate(
             if ( (rc = ops->read_msr(MSR_PASID, &msr_val,
                                      ctxt)) != X86EMUL_OKAY )
                 goto done;
-            generate_exception_if(!(msr_val & PASID_VALID), EXC_GP, 0);
+            generate_exception_if(!(msr_val & PASID_VALID), X86_EXC_GP, 0);
             mmvalp->data32[0] = MASK_EXTR(msr_val, PASID_PASID_MASK);
         }
         mmvalp->data32[0] &= ~0x7ff00000;
@@ -10457,7 +10434,7 @@ x86_emulate(
 
     case X86EMUL_OPC(0x0f38, 0xf9): /* movdiri mem,r */
         host_and_vcpu_must_have(movdiri);
-        generate_exception_if(dst.type != OP_MEM, EXC_UD);
+        generate_exception_if(dst.type != OP_MEM, X86_EXC_UD);
         fail_if(!ops->blk);
         state->blk = blk_movdir;
         if ( (rc = ops->blk(dst.mem.seg, dst.mem.off, &src.val, op_bytes,
@@ -10470,37 +10447,37 @@ x86_emulate(
 
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x00): /* vpermq $imm8,ymm/m256,ymm */
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x01): /* vpermpd $imm8,ymm/m256,ymm */
-        generate_exception_if(!vex.l || !vex.w, EXC_UD);
+        generate_exception_if(!vex.l || !vex.w, X86_EXC_UD);
         goto simd_0f_imm8_avx2;
 
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x00): /* vpermq $imm8,{y,z}mm/mem,{y,z}mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x01): /* vpermpd $imm8,{y,z}mm/mem,{y,z}mm{k} */
-        generate_exception_if(!evex.lr || !evex.w, EXC_UD);
+        generate_exception_if(!evex.lr || !evex.w, X86_EXC_UD);
         fault_suppression = false;
         goto avx512f_imm8_no_sae;
 
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x38): /* vinserti128 $imm8,xmm/m128,ymm,ymm */
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x39): /* vextracti128 $imm8,ymm,xmm/m128 */
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x46): /* vperm2i128 $imm8,ymm/m256,ymm,ymm */
-        generate_exception_if(!vex.l, EXC_UD);
+        generate_exception_if(!vex.l, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x02): /* vpblendd $imm8,{x,y}mm/mem,{x,y}mm,{x,y}mm */
-        generate_exception_if(vex.w, EXC_UD);
+        generate_exception_if(vex.w, X86_EXC_UD);
         goto simd_0f_imm8_avx2;
 
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x06): /* vperm2f128 $imm8,ymm/m256,ymm,ymm */
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x18): /* vinsertf128 $imm8,xmm/m128,ymm,ymm */
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x19): /* vextractf128 $imm8,ymm,xmm/m128 */
-        generate_exception_if(!vex.l, EXC_UD);
+        generate_exception_if(!vex.l, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x04): /* vpermilps $imm8,{x,y}mm/mem,{x,y}mm */
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x05): /* vpermilpd $imm8,{x,y}mm/mem,{x,y}mm */
-        generate_exception_if(vex.w, EXC_UD);
+        generate_exception_if(vex.w, X86_EXC_UD);
         goto simd_0f_imm8_avx;
 
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x04): /* vpermilps $imm8,[xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x05): /* vpermilpd $imm8,[xyz]mm/mem,[xyz]mm{k} */
-        generate_exception_if(evex.w != (b & 1), EXC_UD);
+        generate_exception_if(evex.w != (b & 1), X86_EXC_UD);
         fault_suppression = false;
         goto avx512f_imm8_no_sae;
 
@@ -10519,12 +10496,12 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x0a): /* vrndscaless $imm8,[xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x0b): /* vrndscalesd $imm8,[xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
-        generate_exception_if(ea.type != OP_REG && evex.brs, EXC_UD);
+        generate_exception_if(ea.type != OP_REG && evex.brs, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x08): /* vrndscaleps $imm8,[xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x09): /* vrndscalepd $imm8,[xyz]mm/mem,[xyz]mm{k} */
         host_and_vcpu_must_have(avx512f);
-        generate_exception_if(evex.w != (b & 1), EXC_UD);
+        generate_exception_if(evex.w != (b & 1), X86_EXC_UD);
         avx512_vlen_check(b & 2);
         goto simd_imm8_zmm;
 
@@ -10560,7 +10537,7 @@ x86_emulate(
 #ifndef X86EMUL_NO_SIMD
 
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x42): /* vdbpsadbw $imm8,[xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
-        generate_exception_if(evex.w, EXC_UD);
+        generate_exception_if(evex.w, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x0f): /* vpalignr $imm8,[xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
         fault_suppression = false;
@@ -10608,7 +10585,7 @@ x86_emulate(
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x15): /* vpextrw $imm8,xmm,r/m */
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x16): /* vpextr{d,q} $imm8,xmm,r/m */
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x17): /* vextractps $imm8,xmm,r/m */
-        generate_exception_if(vex.l || vex.reg != 0xf, EXC_UD);
+        generate_exception_if(vex.l || vex.reg != 0xf, X86_EXC_UD);
         host_and_vcpu_must_have(avx);
         get_fpu(X86EMUL_FPU_ymm);
 
@@ -10620,7 +10597,7 @@ x86_emulate(
         goto pextr;
 
     case X86EMUL_OPC_EVEX_66(0x0f, 0xc5):   /* vpextrw $imm8,xmm,reg */
-        generate_exception_if(ea.type != OP_REG, EXC_UD);
+        generate_exception_if(ea.type != OP_REG, X86_EXC_UD);
         /* Convert to alternative encoding: We want to use a memory operand. */
         evex.opcx = ext_0f3a;
         b = 0x15;
@@ -10634,7 +10611,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x17): /* vextractps $imm8,xmm,r/m */
         generate_exception_if((evex.lr || evex.reg != 0xf || !evex.RX ||
                                evex.opmsk || evex.brs),
-                              EXC_UD);
+                              X86_EXC_UD);
         if ( !(b & 2) )
             host_and_vcpu_must_have(avx512bw);
         else if ( !(b & 1) )
@@ -10655,13 +10632,13 @@ x86_emulate(
                                             /* vextracti64x2 $imm8,{y,z}mm,xmm/m128{k} */
         if ( evex.w )
             host_and_vcpu_must_have(avx512dq);
-        generate_exception_if(evex.brs, EXC_UD);
+        generate_exception_if(evex.brs, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x23): /* vshuff32x4 $imm8,{y,z}mm/mem,{y,z}mm,{y,z}mm{k} */
                                             /* vshuff64x2 $imm8,{y,z}mm/mem,{y,z}mm,{y,z}mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x43): /* vshufi32x4 $imm8,{y,z}mm/mem,{y,z}mm,{y,z}mm{k} */
                                             /* vshufi64x2 $imm8,{y,z}mm/mem,{y,z}mm,{y,z}mm{k} */
-        generate_exception_if(!evex.lr, EXC_UD);
+        generate_exception_if(!evex.lr, X86_EXC_UD);
         fault_suppression = false;
         goto avx512f_imm8_no_sae;
 
@@ -10675,7 +10652,7 @@ x86_emulate(
                                             /* vextracti64x4 $imm8,zmm,ymm/m256{k} */
         if ( !evex.w )
             host_and_vcpu_must_have(avx512dq);
-        generate_exception_if(evex.lr != 2 || evex.brs, EXC_UD);
+        generate_exception_if(evex.lr != 2 || evex.brs, X86_EXC_UD);
         fault_suppression = false;
         goto avx512f_imm8_no_sae;
 
@@ -10689,14 +10666,14 @@ x86_emulate(
         {
             generate_exception_if((evex.w || evex.reg != 0xf || !evex.RX ||
                                    (ea.type != OP_REG && (evex.z || evex.brs))),
-                                  EXC_UD);
+                                  X86_EXC_UD);
             host_and_vcpu_must_have(avx512f);
             avx512_vlen_check(false);
             opc = init_evex(stub);
         }
         else
         {
-            generate_exception_if(vex.w || vex.reg != 0xf, EXC_UD);
+            generate_exception_if(vex.w || vex.reg != 0xf, X86_EXC_UD);
             host_and_vcpu_must_have(f16c);
             opc = init_prefixes(stub);
         }
@@ -10778,12 +10755,12 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x1f): /* vpcmp{d,q} $imm8,[xyz]mm/mem,[xyz]mm,k{k} */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x3e): /* vpcmpu{b,w} $imm8,[xyz]mm/mem,[xyz]mm,k{k} */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x3f): /* vpcmp{b,w} $imm8,[xyz]mm/mem,[xyz]mm,k{k} */
-        generate_exception_if(!evex.r || !evex.R || evex.z, EXC_UD);
+        generate_exception_if(!evex.r || !evex.R || evex.z, X86_EXC_UD);
         if ( !(b & 0x20) )
             goto avx512f_imm8_no_sae;
     avx512bw_imm:
         host_and_vcpu_must_have(avx512bw);
-        generate_exception_if(evex.brs, EXC_UD);
+        generate_exception_if(evex.brs, X86_EXC_UD);
         elem_bytes = 1 << evex.w;
         avx512_vlen_check(false);
         goto simd_imm8_zmm;
@@ -10799,7 +10776,7 @@ x86_emulate(
 
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x20): /* vpinsrb $imm8,r32/m8,xmm,xmm */
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x22): /* vpinsr{d,q} $imm8,r/m,xmm,xmm */
-        generate_exception_if(vex.l, EXC_UD);
+        generate_exception_if(vex.l, X86_EXC_UD);
         if ( !mode_64bit() )
             vex.w = 0;
         memcpy(mmvalp, &src.val, src.bytes);
@@ -10817,13 +10794,13 @@ x86_emulate(
         op_bytes = 4;
         /* fall through */
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x41): /* vdppd $imm8,{x,y}mm/mem,{x,y}mm,{x,y}mm */
-        generate_exception_if(vex.l, EXC_UD);
+        generate_exception_if(vex.l, X86_EXC_UD);
         goto simd_0f_imm8_avx;
 
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x21): /* vinsertps $imm8,xmm/m32,xmm,xmm */
         host_and_vcpu_must_have(avx512f);
         generate_exception_if(evex.lr || evex.w || evex.opmsk || evex.brs,
-                              EXC_UD);
+                              X86_EXC_UD);
         op_bytes = 4;
         goto simd_imm8_zmm;
 
@@ -10845,7 +10822,7 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x27): /* vgetmants{s,d} $imm8,xmm/mem,xmm,xmm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x55): /* vfixupimms{s,d} $imm8,xmm/mem,xmm,xmm{k} */
         host_and_vcpu_must_have(avx512f);
-        generate_exception_if(ea.type != OP_REG && evex.brs, EXC_UD);
+        generate_exception_if(ea.type != OP_REG && evex.brs, X86_EXC_UD);
         if ( !evex.brs )
             avx512_vlen_check(true);
         goto simd_imm8_zmm;
@@ -10856,7 +10833,7 @@ x86_emulate(
             host_and_vcpu_must_have(avx512dq);
     opmask_shift_imm:
         generate_exception_if(vex.l || !vex.r || vex.reg != 0xf ||
-                              ea.type != OP_REG, EXC_UD);
+                              ea.type != OP_REG, X86_EXC_UD);
         host_and_vcpu_must_have(avx512f);
         get_fpu(X86EMUL_FPU_opmask);
         op_bytes = 1; /* Any non-zero value will do. */
@@ -10878,7 +10855,7 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x44): /* vpclmulqdq $imm8,[xyz]mm/mem,[xyz]mm,[xyz]mm */
         host_and_vcpu_must_have(vpclmulqdq);
-        generate_exception_if(evex.brs || evex.opmsk, EXC_UD);
+        generate_exception_if(evex.brs || evex.opmsk, X86_EXC_UD);
         goto avx512f_imm8_no_sae;
 
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x48): /* vpermil2ps $imm,{x,y}mm/mem,{x,y}mm,{x,y}mm,{x,y}mm */
@@ -10890,11 +10867,11 @@ x86_emulate(
 
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x4a): /* vblendvps {x,y}mm,{x,y}mm/mem,{x,y}mm,{x,y}mm */
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x4b): /* vblendvpd {x,y}mm,{x,y}mm/mem,{x,y}mm,{x,y}mm */
-        generate_exception_if(vex.w, EXC_UD);
+        generate_exception_if(vex.w, X86_EXC_UD);
         goto simd_0f_imm8_avx;
 
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x4c): /* vpblendvb {x,y}mm,{x,y}mm/mem,{x,y}mm,{x,y}mm */
-        generate_exception_if(vex.w, EXC_UD);
+        generate_exception_if(vex.w, X86_EXC_UD);
         goto simd_0f_int_imm8;
 
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x5c): /* vfmaddsubps {x,y}mm,{x,y}mm/mem,{x,y}mm,{x,y}mm */
@@ -10955,7 +10932,7 @@ x86_emulate(
         }
         else
         {
-            generate_exception_if(vex.l || vex.reg != 0xf, EXC_UD);
+            generate_exception_if(vex.l || vex.reg != 0xf, X86_EXC_UD);
             host_and_vcpu_must_have(avx);
             get_fpu(X86EMUL_FPU_ymm);
         }
@@ -11006,16 +10983,16 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x66): /* vfpclassp{s,d} $imm8,[xyz]mm/mem,k{k} */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x67): /* vfpclasss{s,d} $imm8,[xyz]mm/mem,k{k} */
         host_and_vcpu_must_have(avx512dq);
-        generate_exception_if(!evex.r || !evex.R || evex.z, EXC_UD);
+        generate_exception_if(!evex.r || !evex.R || evex.z, X86_EXC_UD);
         if ( !(b & 1) )
             goto avx512f_imm8_no_sae;
-        generate_exception_if(evex.brs, EXC_UD);
+        generate_exception_if(evex.brs, X86_EXC_UD);
         avx512_vlen_check(true);
         goto simd_imm8_zmm;
 
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x70): /* vpshldw $imm8,[xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x72): /* vpshrdw $imm8,[xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
-        generate_exception_if(!evex.w, EXC_UD);
+        generate_exception_if(!evex.w, X86_EXC_UD);
         elem_bytes = 2;
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x71): /* vpshld{d,q} $imm8,[xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
@@ -11036,13 +11013,13 @@ x86_emulate(
     case X86EMUL_OPC_VEX_66(0x0f3a, 0xce):  /* vgf2p8affineqb $imm8,{x,y}mm/mem,{x,y}mm,{x,y}mm */
     case X86EMUL_OPC_VEX_66(0x0f3a, 0xcf):  /* vgf2p8affineinvqb $imm8,{x,y}mm/mem,{x,y}mm,{x,y}mm */
         host_and_vcpu_must_have(gfni);
-        generate_exception_if(!vex.w, EXC_UD);
+        generate_exception_if(!vex.w, X86_EXC_UD);
         goto simd_0f_imm8_avx;
 
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0xce): /* vgf2p8affineqb $imm8,[xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0xcf): /* vgf2p8affineinvqb $imm8,[xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
         host_and_vcpu_must_have(gfni);
-        generate_exception_if(!evex.w, EXC_UD);
+        generate_exception_if(!evex.w, X86_EXC_UD);
         fault_suppression = false;
         goto avx512f_imm8_no_sae;
 
@@ -11051,14 +11028,14 @@ x86_emulate(
         host_and_vcpu_must_have(aesni);
         if ( vex.opcx == vex_none )
             goto simd_0f3a_common;
-        generate_exception_if(vex.l, EXC_UD);
+        generate_exception_if(vex.l, X86_EXC_UD);
         goto simd_0f_imm8_avx;
 
 #endif /* X86EMUL_NO_SIMD */
 
     case X86EMUL_OPC_VEX_F2(0x0f3a, 0xf0): /* rorx imm,r/m,r */
         vcpu_must_have(bmi2);
-        generate_exception_if(vex.l || vex.reg != 0xf, EXC_UD);
+        generate_exception_if(vex.l || vex.reg != 0xf, X86_EXC_UD);
         if ( ea.type == OP_REG )
             src.val = *ea.reg;
         else if ( (rc = read_ulong(ea.mem.seg, ea.mem.off, &src.val, op_bytes,
@@ -11096,11 +11073,11 @@ x86_emulate(
     case X86EMUL_OPC_XOP(08, 0xed): /* vpcomuw $imm,xmm/m128,xmm,xmm */
     case X86EMUL_OPC_XOP(08, 0xee): /* vpcomud $imm,xmm/m128,xmm,xmm */
     case X86EMUL_OPC_XOP(08, 0xef): /* vpcomuq $imm,xmm/m128,xmm,xmm */
-        generate_exception_if(vex.w, EXC_UD);
+        generate_exception_if(vex.w, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_XOP(08, 0xa3): /* vpperm xmm/m128,xmm,xmm,xmm */
                                     /* vpperm xmm,xmm/m128,xmm,xmm */
-        generate_exception_if(vex.l, EXC_UD);
+        generate_exception_if(vex.l, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_XOP(08, 0xa2): /* vpcmov {x,y}mm/mem,{x,y}mm,{x,y}mm,{x,y}mm */
                                     /* vpcmov {x,y}mm,{x,y}mm/mem,{x,y}mm,{x,y}mm */
@@ -11130,7 +11107,7 @@ x86_emulate(
         uint8_t *buf = get_stub(stub);
         typeof(vex) *pxop = container_of(buf + 1, typeof(vex), raw[0]);
 
-        generate_exception_if(vex.l, EXC_UD);
+        generate_exception_if(vex.l, X86_EXC_UD);
 
         buf[0] = 0x8f;
         *pxop = vex;
@@ -11164,7 +11141,7 @@ x86_emulate(
         case 0: /* llwpcb r */
         case 1: /* slwpcb r */
             /* LWP is unsupported, so produce #UD unconditionally. */
-            generate_exception(EXC_UD);
+            generate_exception(X86_EXC_UD);
         }
         goto unrecognized_insn;
 
@@ -11172,12 +11149,12 @@ x86_emulate(
 
     case X86EMUL_OPC_XOP(09, 0x82): /* vfrczss xmm/m128,xmm */
     case X86EMUL_OPC_XOP(09, 0x83): /* vfrczsd xmm/m128,xmm */
-        generate_exception_if(vex.l, EXC_UD);
+        generate_exception_if(vex.l, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_XOP(09, 0x80): /* vfrczps {x,y}mm/mem,{x,y}mm */
     case X86EMUL_OPC_XOP(09, 0x81): /* vfrczpd {x,y}mm/mem,{x,y}mm */
         host_and_vcpu_must_have(xop);
-        generate_exception_if(vex.w, EXC_UD);
+        generate_exception_if(vex.w, X86_EXC_UD);
         goto simd_0f_ymm;
 
     case X86EMUL_OPC_XOP(09, 0xc1): /* vphaddbw xmm/m128,xmm */
@@ -11195,7 +11172,7 @@ x86_emulate(
     case X86EMUL_OPC_XOP(09, 0xe2): /* vphsubwd xmm/m128,xmm */
     case X86EMUL_OPC_XOP(09, 0xe3): /* vphsubdq xmm/m128,xmm */
     case X86EMUL_OPC_XOP(09, 0xe1): /* vphsubbw xmm/m128,xmm */
-        generate_exception_if(vex.w, EXC_UD);
+        generate_exception_if(vex.w, X86_EXC_UD);
         /* fall through */
     case X86EMUL_OPC_XOP(09, 0x90): /* vprotb xmm/m128,xmm,xmm */
                                     /* vprotb xmm,xmm/m128,xmm */
@@ -11221,7 +11198,7 @@ x86_emulate(
                                     /* vpshad xmm,xmm/m128,xmm */
     case X86EMUL_OPC_XOP(09, 0x9b): /* vpshaq xmm/m128,xmm,xmm */
                                     /* vpshaq xmm,xmm/m128,xmm */
-        generate_exception_if(vex.l, EXC_UD);
+        generate_exception_if(vex.l, X86_EXC_UD);
         host_and_vcpu_must_have(xop);
         goto simd_0f_ymm;
 
@@ -11233,7 +11210,7 @@ x86_emulate(
         typeof(vex) *pxop = container_of(buf + 1, typeof(vex), raw[0]);
 
         host_and_vcpu_must_have(tbm);
-        generate_exception_if(vex.l || vex.reg != 0xf, EXC_UD);
+        generate_exception_if(vex.l || vex.reg != 0xf, X86_EXC_UD);
 
         if ( ea.type == OP_REG )
             src.val = *ea.reg;
@@ -11262,7 +11239,7 @@ x86_emulate(
         case 0: /* lwpins $imm32,r/m,r */
         case 1: /* lwpval $imm32,r/m,r */
             /* LWP is unsupported, so produce #UD unconditionally. */
-            generate_exception(EXC_UD);
+            generate_exception(X86_EXC_UD);
         }
         goto unrecognized_insn;
 
@@ -11306,10 +11283,10 @@ x86_emulate(
     }
     else if ( state->simd_size )
     {
-        generate_exception_if(!op_bytes, EXC_UD);
+        generate_exception_if(!op_bytes, X86_EXC_UD);
         generate_exception_if((vex.opcx && (d & TwoOp) &&
                                (vex.reg != 0xf || (evex_encoded() && !evex.RX))),
-                              EXC_UD);
+                              X86_EXC_UD);
 
         if ( !opc )
             BUG();
@@ -11348,7 +11325,7 @@ x86_emulate(
             generate_exception_if(!(mxcsr & MXCSR_MM) &&
                                   !is_aligned(ea.mem.seg, ea.mem.off, op_bytes,
                                               ctxt, ops),
-                                  EXC_GP, 0);
+                                  X86_EXC_GP, 0);
 
             EXPECT(elem_bytes > 0);
             if ( evex.brs )
@@ -11519,14 +11496,14 @@ x86_emulate(
 
 #ifdef __XEN__
  emulation_stub_failure:
-    generate_exception_if(stub_exn.info.fields.trapnr == EXC_MF, EXC_MF);
-    if ( stub_exn.info.fields.trapnr == EXC_XM )
+    generate_exception_if(stub_exn.info.fields.trapnr == X86_EXC_MF, X86_EXC_MF);
+    if ( stub_exn.info.fields.trapnr == X86_EXC_XM )
     {
         unsigned long cr4;
 
         if ( !ops->read_cr || ops->read_cr(4, &cr4, ctxt) != X86EMUL_OKAY )
             cr4 = X86_CR4_OSXMMEXCPT;
-        generate_exception(cr4 & X86_CR4_OSXMMEXCPT ? EXC_XM : EXC_UD);
+        generate_exception(cr4 & X86_CR4_OSXMMEXCPT ? X86_EXC_XM : X86_EXC_UD);
     }
     gprintk(XENLOG_WARNING,
             "exception %u (ec=%04x) in emulation stub (line %u)\n",
@@ -11534,7 +11511,7 @@ x86_emulate(
             stub_exn.line);
     gprintk(XENLOG_INFO, "  stub: %"__stringify(MAX_INST_LEN)"ph\n",
             stub.func);
-    generate_exception_if(stub_exn.info.fields.trapnr == EXC_UD, EXC_UD);
+    generate_exception_if(stub_exn.info.fields.trapnr == X86_EXC_UD, X86_EXC_UD);
     domain_crash(current->domain);
 #endif
 
@@ -11987,7 +11964,7 @@ int x86_emul_blk(
                               (unsigned int)offsetof(struct x86_fxsr, rsvd)));
         memset(fxsr->rsvd, 0, sizeof(*fxsr) - offsetof(struct x86_fxsr, rsvd));
 
-        generate_exception_if(fxsr->mxcsr & ~mxcsr_mask, EXC_GP, 0);
+        generate_exception_if(fxsr->mxcsr & ~mxcsr_mask, X86_EXC_GP, 0);
 
         if ( state->rex_prefix & REX_W )
         {
diff --git a/xen/arch/x86/x86_emulate/x86_emulate.h b/xen/arch/x86/x86_emulate/x86_emulate.h
index d8fb3a9909..041cb040c1 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.h
+++ b/xen/arch/x86/x86_emulate/x86_emulate.h
@@ -25,6 +25,8 @@
 
 #include <xen/lib/x86/cpuid.h>
 
+#include <asm/x86-defns.h>
+
 #define MAX_INST_LEN 15
 
 #if defined(__i386__)
@@ -836,7 +838,7 @@ static inline void x86_emul_pagefault(
 {
     ASSERT(!ctxt->event_pending);
 
-    ctxt->event.vector = 14; /* TRAP_page_fault */
+    ctxt->event.vector = X86_EXC_PF;
     ctxt->event.type = X86_EVENTTYPE_HW_EXCEPTION;
     ctxt->event.error_code = error_code;
     ctxt->event.cr2 = cr2;
-- 
2.11.0


