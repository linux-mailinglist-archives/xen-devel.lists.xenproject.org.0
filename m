Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4EC190D75
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2020 13:31:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGigo-0005cl-LX; Tue, 24 Mar 2020 12:29:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Lmgi=5J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jGigm-0005cW-8p
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 12:29:48 +0000
X-Inumbo-ID: 25b9d724-6dcb-11ea-bec1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 25b9d724-6dcb-11ea-bec1-bc764e2007e4;
 Tue, 24 Mar 2020 12:29:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 71222AFB2;
 Tue, 24 Mar 2020 12:29:46 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6fa81b4d-528d-5c33-50c5-a18396b4383a@suse.com>
Message-ID: <01414205-1157-9d50-8d45-3e833b430c8e@suse.com>
Date: Tue, 24 Mar 2020 13:29:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <6fa81b4d-528d-5c33-50c5-a18396b4383a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: [Xen-devel] [PATCH v5 02/10] x86emul: support MOVDIRI insn
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

Note that SDM revision 070 doesn't specify exception behavior for
ModRM.mod == 0b11; assuming #UD here.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v4: Split MOVDIRI and MOVDIR64B and move this one ahead. Re-base.
v3: Update description.

--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -2196,6 +2196,18 @@ int main(int argc, char **argv)
         goto fail;
     printf("okay\n");
 
+    printf("%-40s", "Testing movdiri %edx,(%ecx)...");
+    instr[0] = 0x0f; instr[1] = 0x38; instr[2] = 0xf9; instr[3] = 0x11;
+    regs.eip = (unsigned long)&instr[0];
+    regs.ecx = (unsigned long)memset(res, -1, 16);
+    regs.edx = 0x44332211;
+    rc = x86_emulate(&ctxt, &emulops);
+    if ( (rc != X86EMUL_OKAY) ||
+         (regs.eip != (unsigned long)&instr[4]) ||
+         res[0] != 0x44332211 || ~res[1] )
+        goto fail;
+    printf("okay\n");
+
     printf("%-40s", "Testing movq %mm3,(%ecx)...");
     if ( stack_exec && cpu_has_mmx )
     {
--- a/tools/tests/x86_emulator/x86-emulate.c
+++ b/tools/tests/x86_emulator/x86-emulate.c
@@ -76,6 +76,7 @@ bool emul_test_init(void)
     cp.feat.adx = true;
     cp.feat.avx512pf = cp.feat.avx512f;
     cp.feat.rdpid = true;
+    cp.feat.movdiri = true;
     cp.extd.clzero = true;
 
     if ( cpu_has_xsave )
@@ -137,15 +138,15 @@ int emul_test_cpuid(
         res->c |= 1U << 22;
 
     /*
-     * The emulator doesn't itself use ADCX/ADOX/RDPID nor the S/G prefetch
-     * insns, so we can always run the respective tests.
+     * The emulator doesn't itself use ADCX/ADOX/RDPID/MOVDIRI nor the S/G
+     * prefetch insns, so we can always run the respective tests.
      */
     if ( leaf == 7 && subleaf == 0 )
     {
         res->b |= (1U << 10) | (1U << 19);
         if ( res->b & (1U << 16) )
             res->b |= 1U << 26;
-        res->c |= 1U << 22;
+        res->c |= (1U << 22) | (1U << 27);
     }
 
     /*
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -548,6 +548,7 @@ static const struct ext0f38_table {
     [0xf1] = { .to_mem = 1, .two_op = 1 },
     [0xf2 ... 0xf3] = {},
     [0xf5 ... 0xf7] = {},
+    [0xf9] = { .to_mem = 1 },
 };
 
 /* Shift values between src and dst sizes of pmov{s,z}x{b,w,d}{w,d,q}. */
@@ -1902,6 +1903,7 @@ in_protmode(
 #define vcpu_has_avx512_bitalg() (ctxt->cpuid->feat.avx512_bitalg)
 #define vcpu_has_avx512_vpopcntdq() (ctxt->cpuid->feat.avx512_vpopcntdq)
 #define vcpu_has_rdpid()       (ctxt->cpuid->feat.rdpid)
+#define vcpu_has_movdiri()     (ctxt->cpuid->feat.movdiri)
 #define vcpu_has_avx512_4vnniw() (ctxt->cpuid->feat.avx512_4vnniw)
 #define vcpu_has_avx512_4fmaps() (ctxt->cpuid->feat.avx512_4fmaps)
 #define vcpu_has_avx512_bf16() (ctxt->cpuid->feat.avx512_bf16)
@@ -2713,10 +2715,12 @@ x86_decode_0f38(
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
 
@@ -10075,6 +10079,14 @@ x86_emulate(
                             : "0" ((uint32_t)src.val), "rm" (_regs.edx) );
         break;
 
+    case X86EMUL_OPC(0x0f38, 0xf9): /* movdiri mem,r */
+        vcpu_must_have(movdiri);
+        generate_exception_if(dst.type != OP_MEM, EXC_UD);
+        /* Ignore the non-temporal behavior for now. */
+        dst.val = src.val;
+        sfence = true;
+        break;
+
 #ifndef X86EMUL_NO_SIMD
 
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x00): /* vpermq $imm8,ymm/m256,ymm */
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -237,6 +237,7 @@ XEN_CPUFEATURE(AVX512_BITALG, 6*32+12) /
 XEN_CPUFEATURE(AVX512_VPOPCNTDQ, 6*32+14) /*A  POPCNT for vectors of DW/QW */
 XEN_CPUFEATURE(RDPID,         6*32+22) /*A  RDPID instruction */
 XEN_CPUFEATURE(CLDEMOTE,      6*32+25) /*A  CLDEMOTE instruction */
+XEN_CPUFEATURE(MOVDIRI,       6*32+27) /*A  MOVDIRI instruction */
 
 /* AMD-defined CPU features, CPUID level 0x80000007.edx, word 7 */
 XEN_CPUFEATURE(ITSC,          7*32+ 8) /*   Invariant TSC */


