Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D13BE1E107A
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2020 16:28:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdE57-00084C-OS; Mon, 25 May 2020 14:27:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MLe6=7H=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jdE56-00083w-Hj
 for xen-devel@lists.xenproject.org; Mon, 25 May 2020 14:27:56 +0000
X-Inumbo-ID: ebcc606e-9e93-11ea-9887-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ebcc606e-9e93-11ea-9887-bc764e2007e4;
 Mon, 25 May 2020 14:27:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 762FDB117;
 Mon, 25 May 2020 14:27:56 +0000 (UTC)
Subject: [PATCH v10 4/9] x86emul: disable FPU/MMX/SIMD insn emulation when !HVM
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d2375ecb-f662-99d8-84c2-e9f9c5cf7b9e@suse.com>
Message-ID: <a2c36be0-03f0-00ca-33e9-9915773ccb0f@suse.com>
Date: Mon, 25 May 2020 16:27:52 +0200
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

In a pure PV environment (the PV shim in particular) we don't really
need emulation of all these. To limit #ifdef-ary utilize some of the
CASE_*() macros we have, by providing variants expanding to
(effectively) nothing (really a label, which in turn requires passing
-Wno-unused-label to the compiler when build such configurations).

Due to the mixture of macro and #ifdef use, the placement of some of
the #ifdef-s is a little arbitrary.

The resulting object file's .text is less than half the size of the
original, and looks to also be compiling a little more quickly.

This is meant as a first step; more parts can likely be disabled down
the road.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v7: Integrate into this series. Re-base.
---
I'll be happy to take suggestions allowing to avoid -Wno-unused-label.

--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -73,6 +73,9 @@ obj-y += vm_event.o
 obj-y += xstate.o
 extra-y += asm-macros.i
 
+ifneq ($(CONFIG_HVM),y)
+x86_emulate.o: CFLAGS-y += -Wno-unused-label
+endif
 x86_emulate.o: x86_emulate/x86_emulate.c x86_emulate/x86_emulate.h
 
 efi-y := $(shell if [ ! -r $(BASEDIR)/include/xen/compile.h -o \
--- a/xen/arch/x86/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate.c
@@ -43,6 +43,12 @@
     }                                                      \
 })
 
+#ifndef CONFIG_HVM
+# define X86EMUL_NO_FPU
+# define X86EMUL_NO_MMX
+# define X86EMUL_NO_SIMD
+#endif
+
 #include "x86_emulate/x86_emulate.c"
 
 int x86emul_read_xcr(unsigned int reg, uint64_t *val,
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -3506,6 +3506,7 @@ x86_decode(
             op_bytes = 4;
         break;
 
+#ifndef X86EMUL_NO_SIMD
     case simd_packed_int:
         switch ( vex.pfx )
         {
@@ -3571,6 +3572,7 @@ x86_decode(
     case simd_256:
         op_bytes = 32;
         break;
+#endif /* !X86EMUL_NO_SIMD */
 
     default:
         op_bytes = 0;
@@ -3725,6 +3727,7 @@ x86_emulate(
         break;
     }
 
+#ifndef X86EMUL_NO_SIMD
     /* With a memory operand, fetch the mask register in use (if any). */
     if ( ea.type == OP_MEM && evex.opmsk &&
          _get_fpu(fpu_type = X86EMUL_FPU_opmask, ctxt, ops) == X86EMUL_OKAY )
@@ -3755,6 +3758,7 @@ x86_emulate(
         put_fpu(X86EMUL_FPU_opmask, false, state, ctxt, ops);
         fpu_type = X86EMUL_FPU_none;
     }
+#endif /* !X86EMUL_NO_SIMD */
 
     /* Decode (but don't fetch) the destination operand: register or memory. */
     switch ( d & DstMask )
@@ -4400,11 +4404,13 @@ x86_emulate(
         singlestep = _regs.eflags & X86_EFLAGS_TF;
         break;
 
+#ifndef X86EMUL_NO_FPU
     case 0x9b:  /* wait/fwait */
         host_and_vcpu_must_have(fpu);
         get_fpu(X86EMUL_FPU_wait);
         emulate_fpu_insn_stub(b);
         break;
+#endif
 
     case 0x9c: /* pushf */
         if ( (_regs.eflags & X86_EFLAGS_VM) &&
@@ -4814,6 +4820,7 @@ x86_emulate(
         break;
     }
 
+#ifndef X86EMUL_NO_FPU
     case 0xd8: /* FPU 0xd8 */
         host_and_vcpu_must_have(fpu);
         get_fpu(X86EMUL_FPU_fpu);
@@ -5148,6 +5155,7 @@ x86_emulate(
             }
         }
         break;
+#endif /* !X86EMUL_NO_FPU */
 
     case 0xe0 ... 0xe2: /* loop{,z,nz} */ {
         unsigned long count = get_loop_count(&_regs, ad_bytes);
@@ -6124,6 +6132,8 @@ x86_emulate(
     case X86EMUL_OPC(0x0f, 0x19) ... X86EMUL_OPC(0x0f, 0x1f): /* nop */
         break;
 
+#ifndef X86EMUL_NO_MMX
+
     case X86EMUL_OPC(0x0f, 0x0e): /* femms */
         host_and_vcpu_must_have(3dnow);
         asm volatile ( "femms" );
@@ -6144,39 +6154,71 @@ x86_emulate(
         state->simd_size = simd_other;
         goto simd_0f_imm8;
 
-#define CASE_SIMD_PACKED_INT(pfx, opc)       \
+#endif /* !X86EMUL_NO_MMX */
+
+#if !defined(X86EMUL_NO_SIMD) && !defined(X86EMUL_NO_MMX)
+# define CASE_SIMD_PACKED_INT(pfx, opc)      \
     case X86EMUL_OPC(pfx, opc):              \
     case X86EMUL_OPC_66(pfx, opc)
-#define CASE_SIMD_PACKED_INT_VEX(pfx, opc)   \
+#elif !defined(X86EMUL_NO_SIMD)
+# define CASE_SIMD_PACKED_INT(pfx, opc)      \
+    case X86EMUL_OPC_66(pfx, opc)
+#elif !defined(X86EMUL_NO_MMX)
+# define CASE_SIMD_PACKED_INT(pfx, opc)      \
+    case X86EMUL_OPC(pfx, opc)
+#else
+# define CASE_SIMD_PACKED_INT(pfx, opc) C##pfx##_##opc
+#endif
+
+#ifndef X86EMUL_NO_SIMD
+
+# define CASE_SIMD_PACKED_INT_VEX(pfx, opc)  \
     CASE_SIMD_PACKED_INT(pfx, opc):          \
     case X86EMUL_OPC_VEX_66(pfx, opc)
 
-#define CASE_SIMD_ALL_FP(kind, pfx, opc)     \
+# define CASE_SIMD_ALL_FP(kind, pfx, opc)    \
     CASE_SIMD_PACKED_FP(kind, pfx, opc):     \
     CASE_SIMD_SCALAR_FP(kind, pfx, opc)
-#define CASE_SIMD_PACKED_FP(kind, pfx, opc)  \
+# define CASE_SIMD_PACKED_FP(kind, pfx, opc) \
     case X86EMUL_OPC##kind(pfx, opc):        \
     case X86EMUL_OPC##kind##_66(pfx, opc)
-#define CASE_SIMD_SCALAR_FP(kind, pfx, opc)  \
+# define CASE_SIMD_SCALAR_FP(kind, pfx, opc) \
     case X86EMUL_OPC##kind##_F3(pfx, opc):   \
     case X86EMUL_OPC##kind##_F2(pfx, opc)
-#define CASE_SIMD_SINGLE_FP(kind, pfx, opc)  \
+# define CASE_SIMD_SINGLE_FP(kind, pfx, opc) \
     case X86EMUL_OPC##kind(pfx, opc):        \
     case X86EMUL_OPC##kind##_F3(pfx, opc)
 
-#define CASE_SIMD_ALL_FP_VEX(pfx, opc)       \
+# define CASE_SIMD_ALL_FP_VEX(pfx, opc)      \
     CASE_SIMD_ALL_FP(, pfx, opc):            \
     CASE_SIMD_ALL_FP(_VEX, pfx, opc)
-#define CASE_SIMD_PACKED_FP_VEX(pfx, opc)    \
+# define CASE_SIMD_PACKED_FP_VEX(pfx, opc)   \
     CASE_SIMD_PACKED_FP(, pfx, opc):         \
     CASE_SIMD_PACKED_FP(_VEX, pfx, opc)
-#define CASE_SIMD_SCALAR_FP_VEX(pfx, opc)    \
+# define CASE_SIMD_SCALAR_FP_VEX(pfx, opc)   \
     CASE_SIMD_SCALAR_FP(, pfx, opc):         \
     CASE_SIMD_SCALAR_FP(_VEX, pfx, opc)
-#define CASE_SIMD_SINGLE_FP_VEX(pfx, opc)    \
+# define CASE_SIMD_SINGLE_FP_VEX(pfx, opc)   \
     CASE_SIMD_SINGLE_FP(, pfx, opc):         \
     CASE_SIMD_SINGLE_FP(_VEX, pfx, opc)
 
+#else
+
+# define CASE_SIMD_PACKED_INT_VEX(pfx, opc)  \
+    CASE_SIMD_PACKED_INT(pfx, opc)
+
+# define CASE_SIMD_ALL_FP(kind, pfx, opc)    C##kind##pfx##_##opc
+# define CASE_SIMD_PACKED_FP(kind, pfx, opc) Cp##kind##pfx##_##opc
+# define CASE_SIMD_SCALAR_FP(kind, pfx, opc) Cs##kind##pfx##_##opc
+# define CASE_SIMD_SINGLE_FP(kind, pfx, opc) C##kind##pfx##_##opc
+
+# define CASE_SIMD_ALL_FP_VEX(pfx, opc)    CASE_SIMD_ALL_FP(, pfx, opc)
+# define CASE_SIMD_PACKED_FP_VEX(pfx, opc) CASE_SIMD_PACKED_FP(, pfx, opc)
+# define CASE_SIMD_SCALAR_FP_VEX(pfx, opc) CASE_SIMD_SCALAR_FP(, pfx, opc)
+# define CASE_SIMD_SINGLE_FP_VEX(pfx, opc) CASE_SIMD_SINGLE_FP(, pfx, opc)
+
+#endif
+
     CASE_SIMD_SCALAR_FP(, 0x0f, 0x2b):     /* movnts{s,d} xmm,mem */
         host_and_vcpu_must_have(sse4a);
         /* fall through */
@@ -6314,6 +6356,8 @@ x86_emulate(
         insn_bytes = EVEX_PFX_BYTES + 2;
         break;
 
+#ifndef X86EMUL_NO_SIMD
+
     case X86EMUL_OPC_66(0x0f, 0x12):       /* movlpd m64,xmm */
     case X86EMUL_OPC_VEX_66(0x0f, 0x12):   /* vmovlpd m64,xmm,xmm */
     CASE_SIMD_PACKED_FP_VEX(0x0f, 0x13):   /* movlp{s,d} xmm,m64 */
@@ -6420,6 +6464,8 @@ x86_emulate(
         avx512_vlen_check(false);
         goto simd_zmm;
 
+#endif /* !X86EMUL_NO_SIMD */
+
     case X86EMUL_OPC(0x0f, 0x20): /* mov cr,reg */
     case X86EMUL_OPC(0x0f, 0x21): /* mov dr,reg */
     case X86EMUL_OPC(0x0f, 0x22): /* mov reg,cr */
@@ -6446,6 +6492,8 @@ x86_emulate(
             goto done;
         break;
 
+#if !defined(X86EMUL_NO_MMX) && !defined(X86EMUL_NO_SIMD)
+
     case X86EMUL_OPC_66(0x0f, 0x2a):       /* cvtpi2pd mm/m64,xmm */
         if ( ea.type == OP_REG )
         {
@@ -6457,6 +6505,8 @@ x86_emulate(
         op_bytes = (b & 4) && (vex.pfx & VEX_PREFIX_DOUBLE_MASK) ? 16 : 8;
         goto simd_0f_fp;
 
+#endif /* !X86EMUL_NO_MMX && !X86EMUL_NO_SIMD */
+
     CASE_SIMD_SCALAR_FP_VEX(0x0f, 0x2a):   /* {,v}cvtsi2s{s,d} r/m,xmm */
         if ( vex.opcx == vex_none )
         {
@@ -6803,6 +6853,8 @@ x86_emulate(
             dst.val = src.val;
         break;
 
+#ifndef X86EMUL_NO_SIMD
+
     case X86EMUL_OPC_VEX(0x0f, 0x4a):    /* kadd{w,q} k,k,k */
         if ( !vex.w )
             host_and_vcpu_must_have(avx512dq);
@@ -6857,6 +6909,8 @@ x86_emulate(
         generate_exception_if(!vex.l || vex.w, EXC_UD);
         goto opmask_common;
 
+#endif /* X86EMUL_NO_SIMD */
+
     CASE_SIMD_PACKED_FP_VEX(0x0f, 0x50):   /* movmskp{s,d} xmm,reg */
                                            /* vmovmskp{s,d} {x,y}mm,reg */
     CASE_SIMD_PACKED_INT_VEX(0x0f, 0xd7):  /* pmovmskb {,x}mm,reg */
@@ -6940,6 +6994,8 @@ x86_emulate(
                          evex.w);
         goto avx512f_all_fp;
 
+#ifndef X86EMUL_NO_SIMD
+
     CASE_SIMD_PACKED_FP_VEX(0x0f, 0x5b):   /* cvt{ps,dq}2{dq,ps} xmm/mem,xmm */
                                            /* vcvt{ps,dq}2{dq,ps} {x,y}mm/mem,{x,y}mm */
     case X86EMUL_OPC_F3(0x0f, 0x5b):       /* cvttps2dq xmm/mem,xmm */
@@ -6970,6 +7026,8 @@ x86_emulate(
         op_bytes = 16 << evex.lr;
         goto simd_zmm;
 
+#endif /* !X86EMUL_NO_SIMD */
+
     CASE_SIMD_PACKED_INT_VEX(0x0f, 0x60): /* punpcklbw {,x}mm/mem,{,x}mm */
                                           /* vpunpcklbw {x,y}mm/mem,{x,y}mm,{x,y}mm */
     CASE_SIMD_PACKED_INT_VEX(0x0f, 0x61): /* punpcklwd {,x}mm/mem,{,x}mm */
@@ -6996,6 +7054,7 @@ x86_emulate(
                                           /* vpackusbw {x,y}mm/mem,{x,y}mm,{x,y}mm */
     CASE_SIMD_PACKED_INT_VEX(0x0f, 0x6b): /* packsswd {,x}mm/mem,{,x}mm */
                                           /* vpacksswd {x,y}mm/mem,{x,y}mm,{x,y}mm */
+#ifndef X86EMUL_NO_SIMD
     case X86EMUL_OPC_66(0x0f, 0x6c):     /* punpcklqdq xmm/m128,xmm */
     case X86EMUL_OPC_VEX_66(0x0f, 0x6c): /* vpunpcklqdq {x,y}mm/mem,{x,y}mm,{x,y}mm */
     case X86EMUL_OPC_66(0x0f, 0x6d):     /* punpckhqdq xmm/m128,xmm */
@@ -7080,6 +7139,7 @@ x86_emulate(
                                           /* vpsubd {x,y}mm/mem,{x,y}mm,{x,y}mm */
     case X86EMUL_OPC_66(0x0f, 0xfb):     /* psubq xmm/m128,xmm */
     case X86EMUL_OPC_VEX_66(0x0f, 0xfb): /* vpsubq {x,y}mm/mem,{x,y}mm,{x,y}mm */
+#endif /* !X86EMUL_NO_SIMD */
     CASE_SIMD_PACKED_INT_VEX(0x0f, 0xfc): /* paddb {,x}mm/mem,{,x}mm */
                                           /* vpaddb {x,y}mm/mem,{x,y}mm,{x,y}mm */
     CASE_SIMD_PACKED_INT_VEX(0x0f, 0xfd): /* paddw {,x}mm/mem,{,x}mm */
@@ -7087,6 +7147,7 @@ x86_emulate(
     CASE_SIMD_PACKED_INT_VEX(0x0f, 0xfe): /* paddd {,x}mm/mem,{,x}mm */
                                           /* vpaddd {x,y}mm/mem,{x,y}mm,{x,y}mm */
     simd_0f_int:
+#ifndef X86EMUL_NO_SIMD
         if ( vex.opcx != vex_none )
         {
     case X86EMUL_OPC_VEX_66(0x0f38, 0x00): /* vpshufb {x,y}mm/mem,{x,y}mm,{x,y}mm */
@@ -7128,11 +7189,14 @@ x86_emulate(
         }
         if ( vex.pfx )
             goto simd_0f_sse2;
+#endif /* !X86EMUL_NO_SIMD */
     simd_0f_mmx:
         host_and_vcpu_must_have(mmx);
         get_fpu(X86EMUL_FPU_mmx);
         goto simd_0f_common;
 
+#ifndef X86EMUL_NO_SIMD
+
     case X86EMUL_OPC_EVEX_66(0x0f, 0xf6): /* vpsadbw [xyz]mm/mem,[xyz]mm,[xyz]mm */
         generate_exception_if(evex.opmsk, EXC_UD);
         /* fall through */
@@ -7226,6 +7290,8 @@ x86_emulate(
         generate_exception_if(!evex.w, EXC_UD);
         goto avx512f_no_sae;
 
+#endif /* X86EMUL_NO_SIMD */
+
     CASE_SIMD_PACKED_INT_VEX(0x0f, 0x6e): /* mov{d,q} r/m,{,x}mm */
                                           /* vmov{d,q} r/m,xmm */
     CASE_SIMD_PACKED_INT_VEX(0x0f, 0x7e): /* mov{d,q} {,x}mm,r/m */
@@ -7267,6 +7333,8 @@ x86_emulate(
         ASSERT(!state->simd_size);
         break;
 
+#ifndef X86EMUL_NO_SIMD
+
     case X86EMUL_OPC_EVEX_66(0x0f, 0x6e): /* vmov{d,q} r/m,xmm */
     case X86EMUL_OPC_EVEX_66(0x0f, 0x7e): /* vmov{d,q} xmm,r/m */
         generate_exception_if((evex.lr || evex.opmsk || evex.brs ||
@@ -7339,11 +7407,15 @@ x86_emulate(
         d |= TwoOp;
         /* fall through */
     case X86EMUL_OPC_66(0x0f, 0xd6):     /* movq xmm,xmm/m64 */
+#endif /* !X86EMUL_NO_SIMD */
+#ifndef X86EMUL_NO_MMX
     case X86EMUL_OPC(0x0f, 0x6f):        /* movq mm/m64,mm */
     case X86EMUL_OPC(0x0f, 0x7f):        /* movq mm,mm/m64 */
+#endif
         op_bytes = 8;
         goto simd_0f_int;
 
+#ifndef X86EMUL_NO_SIMD
     CASE_SIMD_PACKED_INT_VEX(0x0f, 0x70):/* pshuf{w,d} $imm8,{,x}mm/mem,{,x}mm */
                                          /* vpshufd $imm8,{x,y}mm/mem,{x,y}mm */
     case X86EMUL_OPC_F3(0x0f, 0x70):     /* pshufhw $imm8,xmm/m128,xmm */
@@ -7352,12 +7424,15 @@ x86_emulate(
     case X86EMUL_OPC_VEX_F2(0x0f, 0x70): /* vpshuflw $imm8,{x,y}mm/mem,{x,y}mm */
         d = (d & ~SrcMask) | SrcMem | TwoOp;
         op_bytes = vex.pfx ? 16 << vex.l : 8;
+#endif
     simd_0f_int_imm8:
         if ( vex.opcx != vex_none )
         {
+#ifndef X86EMUL_NO_SIMD
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x0e): /* vpblendw $imm8,{x,y}mm/mem,{x,y}mm,{x,y}mm */
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x0f): /* vpalignr $imm8,{x,y}mm/mem,{x,y}mm,{x,y}mm */
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x42): /* vmpsadbw $imm8,{x,y}mm/mem,{x,y}mm,{x,y}mm */
+#endif
             if ( vex.l )
             {
     simd_0f_imm8_avx2:
@@ -7365,6 +7440,7 @@ x86_emulate(
             }
             else
             {
+#ifndef X86EMUL_NO_SIMD
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x08): /* vroundps $imm8,{x,y}mm/mem,{x,y}mm */
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x09): /* vroundpd $imm8,{x,y}mm/mem,{x,y}mm */
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x0a): /* vroundss $imm8,{x,y}mm/mem,{x,y}mm,{x,y}mm */
@@ -7372,6 +7448,7 @@ x86_emulate(
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x0c): /* vblendps $imm8,{x,y}mm/mem,{x,y}mm,{x,y}mm */
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x0d): /* vblendpd $imm8,{x,y}mm/mem,{x,y}mm,{x,y}mm */
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x40): /* vdpps $imm8,{x,y}mm/mem,{x,y}mm,{x,y}mm */
+#endif
     simd_0f_imm8_avx:
                 host_and_vcpu_must_have(avx);
             }
@@ -7405,6 +7482,8 @@ x86_emulate(
         insn_bytes = PFX_BYTES + 3;
         break;
 
+#ifndef X86EMUL_NO_SIMD
+
     case X86EMUL_OPC_EVEX_66(0x0f, 0x70): /* vpshufd $imm8,[xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_F3(0x0f, 0x70): /* vpshufhw $imm8,[xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_F2(0x0f, 0x70): /* vpshuflw $imm8,[xyz]mm/mem,[xyz]mm{k} */
@@ -7463,6 +7542,9 @@ x86_emulate(
         opc[1] = modrm;
         opc[2] = imm1;
         insn_bytes = PFX_BYTES + 3;
+
+#endif /* X86EMUL_NO_SIMD */
+
     simd_0f_reg_only:
         opc[insn_bytes - PFX_BYTES] = 0xc3;
 
@@ -7473,6 +7555,8 @@ x86_emulate(
         ASSERT(!state->simd_size);
         break;
 
+#ifndef X86EMUL_NO_SIMD
+
     case X86EMUL_OPC_EVEX_66(0x0f, 0x71): /* Grp12 */
         switch ( modrm_reg & 7 )
         {
@@ -7504,6 +7588,9 @@ x86_emulate(
         }
         goto unrecognized_insn;
 
+#endif /* !X86EMUL_NO_SIMD */
+#ifndef X86EMUL_NO_MMX
+
     case X86EMUL_OPC(0x0f, 0x73):        /* Grp14 */
         switch ( modrm_reg & 7 )
         {
@@ -7513,6 +7600,9 @@ x86_emulate(
         }
         goto unrecognized_insn;
 
+#endif /* !X86EMUL_NO_MMX */
+#ifndef X86EMUL_NO_SIMD
+
     case X86EMUL_OPC_66(0x0f, 0x73):
     case X86EMUL_OPC_VEX_66(0x0f, 0x73):
         switch ( modrm_reg & 7 )
@@ -7543,7 +7633,12 @@ x86_emulate(
         }
         goto unrecognized_insn;
 
+#endif /* !X86EMUL_NO_SIMD */
+
+#ifndef X86EMUL_NO_MMX
     case X86EMUL_OPC(0x0f, 0x77):        /* emms */
+#endif
+#ifndef X86EMUL_NO_SIMD
     case X86EMUL_OPC_VEX(0x0f, 0x77):    /* vzero{all,upper} */
         if ( vex.opcx != vex_none )
         {
@@ -7589,6 +7684,7 @@ x86_emulate(
 #endif
         }
         else
+#endif /* !X86EMUL_NO_SIMD */
         {
             host_and_vcpu_must_have(mmx);
             get_fpu(X86EMUL_FPU_mmx);
@@ -7602,6 +7698,8 @@ x86_emulate(
         insn_bytes = PFX_BYTES + 1;
         goto simd_0f_reg_only;
 
+#ifndef X86EMUL_NO_SIMD
+
     case X86EMUL_OPC_66(0x0f, 0x78):     /* Grp17 */
         switch ( modrm_reg & 7 )
         {
@@ -7699,6 +7797,8 @@ x86_emulate(
         op_bytes = 8;
         goto simd_zmm;
 
+#endif /* !X86EMUL_NO_SIMD */
+
     case X86EMUL_OPC(0x0f, 0x80) ... X86EMUL_OPC(0x0f, 0x8f): /* jcc (near) */
         if ( test_cc(b, _regs.eflags) )
             jmp_rel((int32_t)src.val);
@@ -7709,6 +7809,8 @@ x86_emulate(
         dst.val = test_cc(b, _regs.eflags);
         break;
 
+#ifndef X86EMUL_NO_SIMD
+
     case X86EMUL_OPC_VEX(0x0f, 0x91):    /* kmov{w,q} k,mem */
     case X86EMUL_OPC_VEX_66(0x0f, 0x91): /* kmov{b,d} k,mem */
         generate_exception_if(ea.type != OP_MEM, EXC_UD);
@@ -7857,6 +7959,8 @@ x86_emulate(
         dst.type = OP_NONE;
         break;
 
+#endif /* !X86EMUL_NO_SIMD */
+
     case X86EMUL_OPC(0x0f, 0xa2): /* cpuid */
         msr_val = 0;
         fail_if(ops->cpuid == NULL);
@@ -7953,6 +8057,7 @@ x86_emulate(
     case X86EMUL_OPC(0x0f, 0xae): case X86EMUL_OPC_66(0x0f, 0xae): /* Grp15 */
         switch ( modrm_reg & 7 )
         {
+#ifndef X86EMUL_NO_SIMD
         case 2: /* ldmxcsr */
             generate_exception_if(vex.pfx, EXC_UD);
             vcpu_must_have(sse);
@@ -7971,6 +8076,7 @@ x86_emulate(
             get_fpu(vex.opcx ? X86EMUL_FPU_ymm : X86EMUL_FPU_xmm);
             asm volatile ( "stmxcsr %0" : "=m" (dst.val) );
             break;
+#endif /* X86EMUL_NO_SIMD */
 
         case 5: /* lfence */
             fail_if(modrm_mod != 3);
@@ -8019,6 +8125,8 @@ x86_emulate(
         }
         break;
 
+#ifndef X86EMUL_NO_SIMD
+
     case X86EMUL_OPC_VEX(0x0f, 0xae): /* Grp15 */
         switch ( modrm_reg & 7 )
         {
@@ -8033,6 +8141,8 @@ x86_emulate(
         }
         goto unrecognized_insn;
 
+#endif /* !X86EMUL_NO_SIMD */
+
     case X86EMUL_OPC_F3(0x0f, 0xae): /* Grp15 */
         fail_if(modrm_mod != 3);
         generate_exception_if((modrm_reg & 4) || !mode_64bit(), EXC_UD);
@@ -8272,6 +8382,8 @@ x86_emulate(
         }
         goto simd_0f_imm8_avx;
 
+#ifndef X86EMUL_NO_SIMD
+
     CASE_SIMD_ALL_FP(_EVEX, 0x0f, 0xc2): /* vcmp{p,s}{s,d} $imm8,[xyz]mm/mem,[xyz]mm,k{k} */
         generate_exception_if((evex.w != (evex.pfx & VEX_PREFIX_DOUBLE_MASK) ||
                                (ea.type != OP_REG && evex.brs &&
@@ -8298,6 +8410,8 @@ x86_emulate(
         insn_bytes = EVEX_PFX_BYTES + 3;
         break;
 
+#endif /* !X86EMUL_NO_SIMD */
+
     case X86EMUL_OPC(0x0f, 0xc3): /* movnti */
         /* Ignore the non-temporal hint for now. */
         vcpu_must_have(sse2);
@@ -8312,6 +8426,8 @@ x86_emulate(
         ea.type = OP_MEM;
         goto simd_0f_int_imm8;
 
+#ifndef X86EMUL_NO_SIMD
+
     case X86EMUL_OPC_EVEX_66(0x0f, 0xc4):   /* vpinsrw $imm8,r32/m16,xmm,xmm */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x20): /* vpinsrb $imm8,r32/m8,xmm,xmm */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x22): /* vpinsr{d,q} $imm8,r/m,xmm,xmm */
@@ -8329,6 +8445,8 @@ x86_emulate(
         state->simd_size = simd_other;
         goto avx512f_imm8_no_sae;
 
+#endif /* !X86EMUL_NO_SIMD */
+
     CASE_SIMD_PACKED_INT_VEX(0x0f, 0xc5):  /* pextrw $imm8,{,x}mm,reg */
                                            /* vpextrw $imm8,xmm,reg */
         generate_exception_if(vex.l, EXC_UD);
@@ -8344,6 +8462,8 @@ x86_emulate(
         insn_bytes = PFX_BYTES + 3;
         goto simd_0f_to_gpr;
 
+#ifndef X86EMUL_NO_SIMD
+
     CASE_SIMD_PACKED_FP(_EVEX, 0x0f, 0xc6): /* vshufp{s,d} $imm8,[xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
         generate_exception_if(evex.w != (evex.pfx & VEX_PREFIX_DOUBLE_MASK),
                               EXC_UD);
@@ -8358,6 +8478,8 @@ x86_emulate(
         avx512_vlen_check(false);
         goto simd_imm8_zmm;
 
+#endif /* X86EMUL_NO_SIMD */
+
     case X86EMUL_OPC(0x0f, 0xc7): /* Grp9 */
     {
         union {
@@ -8548,6 +8670,8 @@ x86_emulate(
         }
         break;
 
+#ifndef X86EMUL_NO_SIMD
+
     case X86EMUL_OPC_EVEX_66(0x0f, 0xd2): /* vpsrld xmm/m128,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f, 0xd3): /* vpsrlq xmm/m128,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f, 0xe2): /* vpsra{d,q} xmm/m128,[xyz]mm,[xyz]mm{k} */
@@ -8569,12 +8693,18 @@ x86_emulate(
         generate_exception_if(evex.w != (b & 1), EXC_UD);
         goto avx512f_no_sae;
 
+#endif /* !X86EMUL_NO_SIMD */
+#ifndef X86EMUL_NO_MMX
+
     case X86EMUL_OPC(0x0f, 0xd4):        /* paddq mm/m64,mm */
     case X86EMUL_OPC(0x0f, 0xf4):        /* pmuludq mm/m64,mm */
     case X86EMUL_OPC(0x0f, 0xfb):        /* psubq mm/m64,mm */
         vcpu_must_have(sse2);
         goto simd_0f_mmx;
 
+#endif /* !X86EMUL_NO_MMX */
+#if !defined(X86EMUL_NO_MMX) && !defined(X86EMUL_NO_SIMD)
+
     case X86EMUL_OPC_F3(0x0f, 0xd6):     /* movq2dq mm,xmm */
     case X86EMUL_OPC_F2(0x0f, 0xd6):     /* movdq2q xmm,mm */
         generate_exception_if(ea.type != OP_REG, EXC_UD);
@@ -8582,6 +8712,9 @@ x86_emulate(
         host_and_vcpu_must_have(mmx);
         goto simd_0f_int;
 
+#endif /* !X86EMUL_NO_MMX && !X86EMUL_NO_SIMD */
+#ifndef X86EMUL_NO_MMX
+
     case X86EMUL_OPC(0x0f, 0xe7):        /* movntq mm,m64 */
         generate_exception_if(ea.type != OP_MEM, EXC_UD);
         sfence = true;
@@ -8597,6 +8730,9 @@ x86_emulate(
         vcpu_must_have(mmxext);
         goto simd_0f_mmx;
 
+#endif /* !X86EMUL_NO_MMX */
+#ifndef X86EMUL_NO_SIMD
+
     case X86EMUL_OPC_EVEX_66(0x0f, 0xda): /* vpminub [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f, 0xde): /* vpmaxub [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f, 0xe4): /* vpmulhuw [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
@@ -8617,6 +8753,8 @@ x86_emulate(
         op_bytes = 8 << (!!(vex.pfx & VEX_PREFIX_DOUBLE_MASK) + vex.l);
         goto simd_0f_cvt;
 
+#endif /* !X86EMUL_NO_SIMD */
+
     CASE_SIMD_PACKED_INT_VEX(0x0f, 0xf7): /* {,v}maskmov{q,dqu} {,x}mm,{,x}mm */
         generate_exception_if(ea.type != OP_REG, EXC_UD);
         if ( vex.opcx != vex_none )
@@ -8720,6 +8858,8 @@ x86_emulate(
         insn_bytes = PFX_BYTES + 3;
         break;
 
+#ifndef X86EMUL_NO_SIMD
+
     case X86EMUL_OPC_VEX_66(0x0f38, 0x19): /* vbroadcastsd xmm/m64,ymm */
     case X86EMUL_OPC_VEX_66(0x0f38, 0x1a): /* vbroadcastf128 m128,ymm */
         generate_exception_if(!vex.l, EXC_UD);
@@ -9302,6 +9442,8 @@ x86_emulate(
         ASSERT(!state->simd_size);
         break;
 
+#endif /* !X86EMUL_NO_SIMD */
+
     case X86EMUL_OPC_66(0x0f38, 0x82): /* invpcid reg,m128 */
         vcpu_must_have(invpcid);
         generate_exception_if(ea.type != OP_MEM, EXC_UD);
@@ -9344,6 +9486,8 @@ x86_emulate(
         state->simd_size = simd_none;
         break;
 
+#ifndef X86EMUL_NO_SIMD
+
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x83): /* vpmultishiftqb [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
         generate_exception_if(!evex.w, EXC_UD);
         host_and_vcpu_must_have(avx512_vbmi);
@@ -9907,6 +10051,8 @@ x86_emulate(
         generate_exception_if(evex.brs || evex.opmsk, EXC_UD);
         goto avx512f_no_sae;
 
+#endif /* !X86EMUL_NO_SIMD */
+
     case X86EMUL_OPC(0x0f38, 0xf0): /* movbe m,r */
     case X86EMUL_OPC(0x0f38, 0xf1): /* movbe r,m */
         vcpu_must_have(movbe);
@@ -10072,6 +10218,8 @@ x86_emulate(
                             : "0" ((uint32_t)src.val), "rm" (_regs.edx) );
         break;
 
+#ifndef X86EMUL_NO_SIMD
+
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x00): /* vpermq $imm8,ymm/m256,ymm */
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x01): /* vpermpd $imm8,ymm/m256,ymm */
         generate_exception_if(!vex.l || !vex.w, EXC_UD);
@@ -10132,6 +10280,8 @@ x86_emulate(
         avx512_vlen_check(b & 2);
         goto simd_imm8_zmm;
 
+#endif /* X86EMUL_NO_SIMD */
+
     CASE_SIMD_PACKED_INT(0x0f3a, 0x0f): /* palignr $imm8,{,x}mm/mem,{,x}mm */
         host_and_vcpu_must_have(ssse3);
         if ( vex.pfx )
@@ -10159,6 +10309,8 @@ x86_emulate(
         insn_bytes = PFX_BYTES + 4;
         break;
 
+#ifndef X86EMUL_NO_SIMD
+
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x42): /* vdbpsadbw $imm8,[xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
         generate_exception_if(evex.w, EXC_UD);
         /* fall through */
@@ -10657,6 +10809,8 @@ x86_emulate(
         generate_exception_if(vex.l, EXC_UD);
         goto simd_0f_imm8_avx;
 
+#endif /* X86EMUL_NO_SIMD */
+
     case X86EMUL_OPC_VEX_F2(0x0f3a, 0xf0): /* rorx imm,r/m,r */
         vcpu_must_have(bmi2);
         generate_exception_if(vex.l || vex.reg != 0xf, EXC_UD);
@@ -10671,6 +10825,8 @@ x86_emulate(
             asm ( "rorl %b1,%k0" : "=g" (dst.val) : "c" (imm1), "0" (src.val) );
         break;
 
+#ifndef X86EMUL_NO_SIMD
+
     case X86EMUL_OPC_XOP(08, 0x85): /* vpmacssww xmm,xmm/m128,xmm,xmm */
     case X86EMUL_OPC_XOP(08, 0x86): /* vpmacsswd xmm,xmm/m128,xmm,xmm */
     case X86EMUL_OPC_XOP(08, 0x87): /* vpmacssdql xmm,xmm/m128,xmm,xmm */
@@ -10706,6 +10862,8 @@ x86_emulate(
         host_and_vcpu_must_have(xop);
         goto simd_0f_imm8_ymm;
 
+#endif /* X86EMUL_NO_SIMD */
+
     case X86EMUL_OPC_XOP(09, 0x01): /* XOP Grp1 */
         switch ( modrm_reg & 7 )
         {
@@ -10765,6 +10923,8 @@ x86_emulate(
         }
         goto unrecognized_insn;
 
+#ifndef X86EMUL_NO_SIMD
+
     case X86EMUL_OPC_XOP(09, 0x82): /* vfrczss xmm/m128,xmm */
     case X86EMUL_OPC_XOP(09, 0x83): /* vfrczsd xmm/m128,xmm */
         generate_exception_if(vex.l, EXC_UD);
@@ -10820,6 +10980,8 @@ x86_emulate(
         host_and_vcpu_must_have(xop);
         goto simd_0f_ymm;
 
+#endif /* X86EMUL_NO_SIMD */
+
     case X86EMUL_OPC_XOP(0a, 0x10): /* bextr imm,r/m,r */
     {
         uint8_t *buf = get_stub(stub);


