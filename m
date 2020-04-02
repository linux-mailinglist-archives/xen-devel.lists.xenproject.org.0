Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E1A19CCB9
	for <lists+xen-devel@lfdr.de>; Fri,  3 Apr 2020 00:19:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jK8Ai-0003hZ-Gc; Thu, 02 Apr 2020 22:18:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8h32=5S=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jK8Ag-0003hU-VG
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2020 22:18:47 +0000
X-Inumbo-ID: ea9e8290-752f-11ea-9e09-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ea9e8290-752f-11ea-9e09-bc764e2007e4;
 Thu, 02 Apr 2020 22:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585865926;
 h=subject:from:to:cc:references:message-id:date:
 mime-version:in-reply-to;
 bh=V+BYlDbt5VaX6l7UurX0dqUtIwbbe8/5zu3+rWVzfT4=;
 b=EC8o0UJ27/JTOKizZ4d58AjXYQrlFCgup1T3immFx85HOHKKJpE6wx42
 Qh4EZLHB1wO71DkDi3Bz317WbrFBS5ElwAgkuyEfMxFlYJMVSTJwa5U9X
 GomfTX+c6DC0gGfzXEpvoAquLjSr75d3qvqOfu49WJeDf99tir2PlUAN2 U=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 4XDBMQlsE9wvKWjYTz3TcE/hfLAEvWQsoQBrG0lf9GrrblY5xDXUiE3yWo0m21cA+SY7Pa2mqv
 vn5xiogpx+lxFt54wY4ayVwTrkC4PCXk0Nb2eGw7q2cMJ+VBBXNZW2/kWQOzB19/ofaeoV+9y1
 IFS4iDxii5fUk2NBnhAdFcP68WmJv68or4nMt5oUJFzmLXOW4axwdAaoDEDE/fnIhoxQeubI1x
 mhy1cUox6cFSF33Q2sE/7SvQb3Mghy3CqYtW9tCiLoj2jV+oXiJQX7NqMtklqQL7Tiq7ChIE6q
 P1Y=
X-SBRS: 2.7
X-MesageID: 15083595
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,337,1580792400"; d="scan'208,223";a="15083595"
Subject: Re: [Xen-devel] [PATCH 5/5] x86emul: disable FPU/MMX/SIMD insn
 emulation when !HVM
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <7f7a6ba3-7308-b079-2df1-f5b8501b3cc6@suse.com>
 <87154c20-c60e-a215-f7f4-0290fadd90e4@suse.com>
 <dbc03c9d-bfc2-3313-1ffe-8ffe79b2c1e1@citrix.com>
Message-ID: <a016ba7f-f860-9372-caab-d9400c064fd9@citrix.com>
Date: Thu, 2 Apr 2020 23:18:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <dbc03c9d-bfc2-3313-1ffe-8ffe79b2c1e1@citrix.com>
Content-Type: multipart/mixed; boundary="------------9B8F09996F1F184A31746144"
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--------------9B8F09996F1F184A31746144
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 20/12/2019 16:01, Andrew Cooper wrote:
>> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> I'll be happy to take suggestions allowing to avoid -Wno-unused-label.
> I think I'm going to need a little while to figure out how this works.

So, after having had an evening playing with this, things get massively
simpler when NO_MMX is folded with NO_SIMD.

MMX is a SIMD technology, and I can't see a compelling reason to control
their inclusion separately.  We're either going to want everything or
nothing.

The attached incremental works for me without a single out-of-place
label.  There is some further cleanup which can be done such as not
making the CASE_ macros conditional.  (OTOH, the compile error from
might be helpful to keep in some form).

Thoughts?

~Andrew

--------------9B8F09996F1F184A31746144
Content-Type: text/x-patch; charset="UTF-8"; name="0001-incremental.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="0001-incremental.patch"

From aa8ea9998c643bc518ec8b4208e20da352a54129 Mon Sep 17 00:00:00 2001
From: Andrew Cooper <andrew.cooper3@citrix.com>
Date: Thu, 2 Apr 2020 23:11:58 +0100
Subject: incremental


diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 71f1d7784e..e954edbc2e 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -72,9 +72,6 @@ obj-y += hpet.o
 obj-y += vm_event.o
 obj-y += xstate.o
 
-ifneq ($(CONFIG_HVM),y)
-x86_emulate.o: CFLAGS += -Wno-unused-label
-endif
 x86_emulate.o: x86_emulate/x86_emulate.c x86_emulate/x86_emulate.h
 
 efi-y := $(shell if [ ! -r $(BASEDIR)/include/xen/compile.h -o \
diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c b/xen/arch/x86/x86_emulate/x86_emulate.c
index 6d5e5b8b2a..21c57941ef 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -6172,6 +6172,8 @@ x86_emulate(
 
 #endif
 
+#ifndef X86EMUL_NO_SIMD
+
     CASE_SIMD_SCALAR_FP(, 0x0f, 0x2b):     /* movnts{s,d} xmm,mem */
         host_and_vcpu_must_have(sse4a);
         /* fall through */
@@ -6309,8 +6311,6 @@ x86_emulate(
         insn_bytes = EVEX_PFX_BYTES + 2;
         break;
 
-#ifndef X86EMUL_NO_SIMD
-
     case X86EMUL_OPC_66(0x0f, 0x12):       /* movlpd m64,xmm */
     case X86EMUL_OPC_VEX_66(0x0f, 0x12):   /* vmovlpd m64,xmm,xmm */
     CASE_SIMD_PACKED_FP_VEX(0x0f, 0x13):   /* movlp{s,d} xmm,m64 */
@@ -6445,7 +6445,7 @@ x86_emulate(
             goto done;
         break;
 
-#if !defined(X86EMUL_NO_MMX) && !defined(X86EMUL_NO_SIMD)
+#ifndef X86EMUL_NO_SIMD
 
     case X86EMUL_OPC_66(0x0f, 0x2a):       /* cvtpi2pd mm/m64,xmm */
         if ( ea.type == OP_REG )
@@ -6458,8 +6458,6 @@ x86_emulate(
         op_bytes = (b & 4) && (vex.pfx & VEX_PREFIX_DOUBLE_MASK) ? 16 : 8;
         goto simd_0f_fp;
 
-#endif /* !X86EMUL_NO_MMX && !X86EMUL_NO_SIMD */
-
     CASE_SIMD_SCALAR_FP_VEX(0x0f, 0x2a):   /* {,v}cvtsi2s{s,d} r/m,xmm */
         if ( vex.opcx == vex_none )
         {
@@ -6681,6 +6679,8 @@ x86_emulate(
         op_bytes = 4 << evex.w;
         goto vcomi;
 
+#endif /* !X86EMUL_NO_SIMD */
+
     case X86EMUL_OPC(0x0f, 0x30): /* wrmsr */
         generate_exception_if(!mode_ring0(), EXC_GP, 0);
         fail_if(ops->write_msr == NULL);
@@ -6862,8 +6862,6 @@ x86_emulate(
         generate_exception_if(!vex.l || vex.w, EXC_UD);
         goto opmask_common;
 
-#endif /* X86EMUL_NO_SIMD */
-
     CASE_SIMD_PACKED_FP_VEX(0x0f, 0x50):   /* movmskp{s,d} xmm,reg */
                                            /* vmovmskp{s,d} {x,y}mm,reg */
     CASE_SIMD_PACKED_INT_VEX(0x0f, 0xd7):  /* pmovmskb {,x}mm,reg */
@@ -6947,8 +6945,6 @@ x86_emulate(
                          evex.w);
         goto avx512f_all_fp;
 
-#ifndef X86EMUL_NO_SIMD
-
     CASE_SIMD_PACKED_FP_VEX(0x0f, 0x5b):   /* cvt{ps,dq}2{dq,ps} xmm/mem,xmm */
                                            /* vcvt{ps,dq}2{dq,ps} {x,y}mm/mem,{x,y}mm */
     case X86EMUL_OPC_F3(0x0f, 0x5b):       /* cvttps2dq xmm/mem,xmm */
@@ -6979,8 +6975,6 @@ x86_emulate(
         op_bytes = 16 << evex.lr;
         goto simd_zmm;
 
-#endif /* !X86EMUL_NO_SIMD */
-
     CASE_SIMD_PACKED_INT_VEX(0x0f, 0x60): /* punpcklbw {,x}mm/mem,{,x}mm */
                                           /* vpunpcklbw {x,y}mm/mem,{x,y}mm,{x,y}mm */
     CASE_SIMD_PACKED_INT_VEX(0x0f, 0x61): /* punpcklwd {,x}mm/mem,{,x}mm */
@@ -7007,7 +7001,6 @@ x86_emulate(
                                           /* vpackusbw {x,y}mm/mem,{x,y}mm,{x,y}mm */
     CASE_SIMD_PACKED_INT_VEX(0x0f, 0x6b): /* packsswd {,x}mm/mem,{,x}mm */
                                           /* vpacksswd {x,y}mm/mem,{x,y}mm,{x,y}mm */
-#ifndef X86EMUL_NO_SIMD
     case X86EMUL_OPC_66(0x0f, 0x6c):     /* punpcklqdq xmm/m128,xmm */
     case X86EMUL_OPC_VEX_66(0x0f, 0x6c): /* vpunpcklqdq {x,y}mm/mem,{x,y}mm,{x,y}mm */
     case X86EMUL_OPC_66(0x0f, 0x6d):     /* punpckhqdq xmm/m128,xmm */
@@ -7092,7 +7085,6 @@ x86_emulate(
                                           /* vpsubd {x,y}mm/mem,{x,y}mm,{x,y}mm */
     case X86EMUL_OPC_66(0x0f, 0xfb):     /* psubq xmm/m128,xmm */
     case X86EMUL_OPC_VEX_66(0x0f, 0xfb): /* vpsubq {x,y}mm/mem,{x,y}mm,{x,y}mm */
-#endif /* !X86EMUL_NO_SIMD */
     CASE_SIMD_PACKED_INT_VEX(0x0f, 0xfc): /* paddb {,x}mm/mem,{,x}mm */
                                           /* vpaddb {x,y}mm/mem,{x,y}mm,{x,y}mm */
     CASE_SIMD_PACKED_INT_VEX(0x0f, 0xfd): /* paddw {,x}mm/mem,{,x}mm */
@@ -7100,7 +7092,6 @@ x86_emulate(
     CASE_SIMD_PACKED_INT_VEX(0x0f, 0xfe): /* paddd {,x}mm/mem,{,x}mm */
                                           /* vpaddd {x,y}mm/mem,{x,y}mm,{x,y}mm */
     simd_0f_int:
-#ifndef X86EMUL_NO_SIMD
         if ( vex.opcx != vex_none )
         {
     case X86EMUL_OPC_VEX_66(0x0f38, 0x00): /* vpshufb {x,y}mm/mem,{x,y}mm,{x,y}mm */
@@ -7142,14 +7133,11 @@ x86_emulate(
         }
         if ( vex.pfx )
             goto simd_0f_sse2;
-#endif /* !X86EMUL_NO_SIMD */
     simd_0f_mmx:
         host_and_vcpu_must_have(mmx);
         get_fpu(X86EMUL_FPU_mmx);
         goto simd_0f_common;
 
-#ifndef X86EMUL_NO_SIMD
-
     case X86EMUL_OPC_EVEX_66(0x0f, 0xf6): /* vpsadbw [xyz]mm/mem,[xyz]mm,[xyz]mm */
         generate_exception_if(evex.opmsk, EXC_UD);
         /* fall through */
@@ -7243,8 +7231,6 @@ x86_emulate(
         generate_exception_if(!evex.w, EXC_UD);
         goto avx512f_no_sae;
 
-#endif /* X86EMUL_NO_SIMD */
-
     CASE_SIMD_PACKED_INT_VEX(0x0f, 0x6e): /* mov{d,q} r/m,{,x}mm */
                                           /* vmov{d,q} r/m,xmm */
     CASE_SIMD_PACKED_INT_VEX(0x0f, 0x7e): /* mov{d,q} {,x}mm,r/m */
@@ -7286,8 +7272,6 @@ x86_emulate(
         ASSERT(!state->simd_size);
         break;
 
-#ifndef X86EMUL_NO_SIMD
-
     case X86EMUL_OPC_EVEX_66(0x0f, 0x6e): /* vmov{d,q} r/m,xmm */
     case X86EMUL_OPC_EVEX_66(0x0f, 0x7e): /* vmov{d,q} xmm,r/m */
         generate_exception_if((evex.lr || evex.opmsk || evex.brs ||
@@ -7360,15 +7344,11 @@ x86_emulate(
         d |= TwoOp;
         /* fall through */
     case X86EMUL_OPC_66(0x0f, 0xd6):     /* movq xmm,xmm/m64 */
-#endif /* !X86EMUL_NO_SIMD */
-#ifndef X86EMUL_NO_MMX
     case X86EMUL_OPC(0x0f, 0x6f):        /* movq mm/m64,mm */
     case X86EMUL_OPC(0x0f, 0x7f):        /* movq mm,mm/m64 */
-#endif
         op_bytes = 8;
         goto simd_0f_int;
 
-#ifndef X86EMUL_NO_SIMD
     CASE_SIMD_PACKED_INT_VEX(0x0f, 0x70):/* pshuf{w,d} $imm8,{,x}mm/mem,{,x}mm */
                                          /* vpshufd $imm8,{x,y}mm/mem,{x,y}mm */
     case X86EMUL_OPC_F3(0x0f, 0x70):     /* pshufhw $imm8,xmm/m128,xmm */
@@ -7377,15 +7357,12 @@ x86_emulate(
     case X86EMUL_OPC_VEX_F2(0x0f, 0x70): /* vpshuflw $imm8,{x,y}mm/mem,{x,y}mm */
         d = (d & ~SrcMask) | SrcMem | TwoOp;
         op_bytes = vex.pfx ? 16 << vex.l : 8;
-#endif
     simd_0f_int_imm8:
         if ( vex.opcx != vex_none )
         {
-#ifndef X86EMUL_NO_SIMD
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x0e): /* vpblendw $imm8,{x,y}mm/mem,{x,y}mm,{x,y}mm */
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x0f): /* vpalignr $imm8,{x,y}mm/mem,{x,y}mm,{x,y}mm */
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x42): /* vmpsadbw $imm8,{x,y}mm/mem,{x,y}mm,{x,y}mm */
-#endif
             if ( vex.l )
             {
     simd_0f_imm8_avx2:
@@ -7393,7 +7370,6 @@ x86_emulate(
             }
             else
             {
-#ifndef X86EMUL_NO_SIMD
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x08): /* vroundps $imm8,{x,y}mm/mem,{x,y}mm */
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x09): /* vroundpd $imm8,{x,y}mm/mem,{x,y}mm */
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x0a): /* vroundss $imm8,{x,y}mm/mem,{x,y}mm,{x,y}mm */
@@ -7401,7 +7377,6 @@ x86_emulate(
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x0c): /* vblendps $imm8,{x,y}mm/mem,{x,y}mm,{x,y}mm */
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x0d): /* vblendpd $imm8,{x,y}mm/mem,{x,y}mm,{x,y}mm */
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x40): /* vdpps $imm8,{x,y}mm/mem,{x,y}mm,{x,y}mm */
-#endif
     simd_0f_imm8_avx:
                 host_and_vcpu_must_have(avx);
             }
@@ -7435,8 +7410,6 @@ x86_emulate(
         insn_bytes = PFX_BYTES + 3;
         break;
 
-#ifndef X86EMUL_NO_SIMD
-
     case X86EMUL_OPC_EVEX_66(0x0f, 0x70): /* vpshufd $imm8,[xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_F3(0x0f, 0x70): /* vpshufhw $imm8,[xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_F2(0x0f, 0x70): /* vpshuflw $imm8,[xyz]mm/mem,[xyz]mm{k} */
@@ -8320,6 +8293,8 @@ x86_emulate(
         }
         goto add;
 
+#ifndef X86EMUL_NO_SIMD
+
     CASE_SIMD_ALL_FP_VEX(0x0f, 0xc2):      /* cmp{p,s}{s,d} $imm8,xmm/mem,xmm */
                                            /* vcmp{p,s}{s,d} $imm8,{x,y}mm/mem,{x,y}mm,{x,y}mm */
     CASE_SIMD_PACKED_FP_VEX(0x0f, 0xc6):   /* shufp{s,d} $imm8,xmm/mem,xmm */
@@ -8335,8 +8310,6 @@ x86_emulate(
         }
         goto simd_0f_imm8_avx;
 
-#ifndef X86EMUL_NO_SIMD
-
     CASE_SIMD_ALL_FP(_EVEX, 0x0f, 0xc2): /* vcmp{p,s}{s,d} $imm8,[xyz]mm/mem,[xyz]mm,k{k} */
         generate_exception_if((evex.w != (evex.pfx & VEX_PREFIX_DOUBLE_MASK) ||
                                (ea.type != OP_REG && evex.brs &&
@@ -8372,6 +8345,8 @@ x86_emulate(
         sfence = true;
         break;
 
+#ifndef X86EMUL_NO_SIMD
+
     CASE_SIMD_PACKED_INT_VEX(0x0f, 0xc4):  /* pinsrw $imm8,r32/m16,{,x}mm */
                                            /* vpinsrw $imm8,r32/m16,xmm,xmm */
         generate_exception_if(vex.l, EXC_UD);
@@ -8379,8 +8354,6 @@ x86_emulate(
         ea.type = OP_MEM;
         goto simd_0f_int_imm8;
 
-#ifndef X86EMUL_NO_SIMD
-
     case X86EMUL_OPC_EVEX_66(0x0f, 0xc4):   /* vpinsrw $imm8,r32/m16,xmm,xmm */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x20): /* vpinsrb $imm8,r32/m8,xmm,xmm */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x22): /* vpinsr{d,q} $imm8,r/m,xmm,xmm */
@@ -8398,8 +8371,6 @@ x86_emulate(
         state->simd_size = simd_other;
         goto avx512f_imm8_no_sae;
 
-#endif /* !X86EMUL_NO_SIMD */
-
     CASE_SIMD_PACKED_INT_VEX(0x0f, 0xc5):  /* pextrw $imm8,{,x}mm,reg */
                                            /* vpextrw $imm8,xmm,reg */
         generate_exception_if(vex.l, EXC_UD);
@@ -8415,8 +8386,6 @@ x86_emulate(
         insn_bytes = PFX_BYTES + 3;
         goto simd_0f_to_gpr;
 
-#ifndef X86EMUL_NO_SIMD
-
     CASE_SIMD_PACKED_FP(_EVEX, 0x0f, 0xc6): /* vshufp{s,d} $imm8,[xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
         generate_exception_if(evex.w != (evex.pfx & VEX_PREFIX_DOUBLE_MASK),
                               EXC_UD);
@@ -8706,8 +8675,6 @@ x86_emulate(
         op_bytes = 8 << (!!(vex.pfx & VEX_PREFIX_DOUBLE_MASK) + vex.l);
         goto simd_0f_cvt;
 
-#endif /* !X86EMUL_NO_SIMD */
-
     CASE_SIMD_PACKED_INT_VEX(0x0f, 0xf7): /* {,v}maskmov{q,dqu} {,x}mm,{,x}mm */
         generate_exception_if(ea.type != OP_REG, EXC_UD);
         if ( vex.opcx != vex_none )
@@ -8811,8 +8778,6 @@ x86_emulate(
         insn_bytes = PFX_BYTES + 3;
         break;
 
-#ifndef X86EMUL_NO_SIMD
-
     case X86EMUL_OPC_VEX_66(0x0f38, 0x19): /* vbroadcastsd xmm/m64,ymm */
     case X86EMUL_OPC_VEX_66(0x0f38, 0x1a): /* vbroadcastf128 m128,ymm */
         generate_exception_if(!vex.l, EXC_UD);
@@ -10233,8 +10198,6 @@ x86_emulate(
         avx512_vlen_check(b & 2);
         goto simd_imm8_zmm;
 
-#endif /* X86EMUL_NO_SIMD */
-
     CASE_SIMD_PACKED_INT(0x0f3a, 0x0f): /* palignr $imm8,{,x}mm/mem,{,x}mm */
         host_and_vcpu_must_have(ssse3);
         if ( vex.pfx )
@@ -10262,8 +10225,6 @@ x86_emulate(
         insn_bytes = PFX_BYTES + 4;
         break;
 
-#ifndef X86EMUL_NO_SIMD
-
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x42): /* vdbpsadbw $imm8,[xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
         generate_exception_if(evex.w, EXC_UD);
         /* fall through */
@@ -11613,9 +11574,11 @@ x86_insn_is_mem_access(const struct x86_emulate_state *state,
     case 0xa4 ... 0xa7: /* MOVS / CMPS */
     case 0xaa ... 0xaf: /* STOS / LODS / SCAS */
     case 0xd7:          /* XLAT */
+#ifndef X86EMUL_NO_SIMD
     CASE_SIMD_PACKED_INT_VEX(0x0f, 0xf7): /* MASKMOV{Q,DQU} */
                                           /* VMASKMOVDQU */
         return true;
+#endif
 
     case X86EMUL_OPC(0x0f, 0x01):
         /* Cover CLZERO. */

--------------9B8F09996F1F184A31746144--

