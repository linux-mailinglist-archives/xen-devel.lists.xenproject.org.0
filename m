Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 407321A7A02
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2020 13:48:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOK2x-0005N4-HK; Tue, 14 Apr 2020 11:48:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=t7Uy=56=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jOK2v-0005Mn-HQ
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2020 11:48:05 +0000
X-Inumbo-ID: cc4e580a-7e45-11ea-8927-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cc4e580a-7e45-11ea-8927-12813bfff9fa;
 Tue, 14 Apr 2020 11:48:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3D8CDADFE;
 Tue, 14 Apr 2020 11:48:02 +0000 (UTC)
Subject: [PATCH v6 06/10] x86emul: support RDPRU
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d9a53b50-472d-477a-6275-ada0cb6e87e6@suse.com>
Message-ID: <6b03308b-3492-de1a-6847-37ceab7d9684@suse.com>
Date: Tue, 14 Apr 2020 13:48:03 +0200
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

While the PM doesn't say so, this assumes that the MPERF value read this
way gets scaled similarly to its reading through RDMSR.

Also introduce the SVM related constants at this occasion.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v6: Re-base.
v5: The CPUID field used is just 8 bits wide.
v4: Add GENERAL2_INTERCEPT_RDPRU and VMEXIT_RDPRU enumerators. Fold
    handling of out of bounds indexes into switch(). Avoid
    recalculate_misc() clobbering what recalculate_cpu_policy() has
    done. Re-base.
v3: New.
---
RFC: Andrew promised to take care of the CPUID side of this; re-base
     over his work once available.

--- a/tools/libxl/libxl_cpuid.c
+++ b/tools/libxl/libxl_cpuid.c
@@ -260,6 +260,7 @@ int libxl_cpuid_parse_config(libxl_cpuid
 
         {"clzero",       0x80000008, NA, CPUID_REG_EBX,  0,  1},
         {"rstr-fp-err-ptrs", 0x80000008, NA, CPUID_REG_EBX, 2, 1},
+        {"rdpru",        0x80000008, NA, CPUID_REG_EBX,  4,  1},
         {"wbnoinvd",     0x80000008, NA, CPUID_REG_EBX,  9,  1},
         {"ibpb",         0x80000008, NA, CPUID_REG_EBX, 12,  1},
         {"ppin",         0x80000008, NA, CPUID_REG_EBX, 23,  1},
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -147,6 +147,8 @@ static const char *const str_e8b[32] =
     [ 0] = "clzero",
     [ 2] = "rstr-fp-err-ptrs",
 
+    [ 4] = "rdpru",
+
     /* [ 8] */            [ 9] = "wbnoinvd",
 
     [12] = "ibpb",
--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -683,6 +683,13 @@ static int read_msr(
 {
     switch ( reg )
     {
+    case 0x000000e8: /* APERF */
+    case 0xc00000e8: /* APERF_RD_ONLY */
+#define APERF_LO_VALUE 0xAEAEAEAE
+#define APERF_HI_VALUE 0xEAEAEAEA
+        *val = ((uint64_t)APERF_HI_VALUE << 32) | APERF_LO_VALUE;
+        return X86EMUL_OKAY;
+
     case 0xc0000080: /* EFER */
         *val = ctxt->addr_size > 32 ? 0x500 /* LME|LMA */ : 0;
         return X86EMUL_OKAY;
@@ -2399,6 +2406,30 @@ int main(int argc, char **argv)
 
     emulops.blk = NULL;
 
+    printf("%-40s", "Testing rdpru...");
+    instr[0] = 0x0f; instr[1] = 0x01; instr[2] = 0xfd;
+    regs.eip = (unsigned long)&instr[0];
+    regs.ecx = 1;
+    regs.eflags = EFLAGS_ALWAYS_SET;
+    rc = x86_emulate(&ctxt, &emulops);
+    if ( (rc != X86EMUL_OKAY) ||
+         (regs.eax != APERF_LO_VALUE) || (regs.edx != APERF_HI_VALUE) ||
+         !(regs.eflags & X86_EFLAGS_CF) ||
+         (regs.eip != (unsigned long)&instr[3]) )
+        goto fail;
+    if ( ctxt.cpuid->extd.rdpru_max < 0xffff )
+    {
+        regs.eip = (unsigned long)&instr[0];
+        regs.ecx = ctxt.cpuid->extd.rdpru_max + 1;
+        regs.eflags = EFLAGS_ALWAYS_SET | X86_EFLAGS_CF;
+        rc = x86_emulate(&ctxt, &emulops);
+        if ( (rc != X86EMUL_OKAY) || regs.eax || regs.edx ||
+             (regs.eflags & X86_EFLAGS_CF) ||
+             (regs.eip != (unsigned long)&instr[3]) )
+            goto fail;
+    }
+    printf("okay\n");
+
     printf("%-40s", "Testing movq %mm3,(%ecx)...");
     if ( stack_exec && cpu_has_mmx )
     {
--- a/tools/tests/x86_emulator/x86-emulate.c
+++ b/tools/tests/x86_emulator/x86-emulate.c
@@ -77,6 +77,8 @@ bool emul_test_init(void)
     cp.feat.avx512pf = cp.feat.avx512f;
     cp.feat.rdpid = true;
     cp.extd.clzero = true;
+    cp.extd.rdpru = true;
+    cp.extd.rdpru_max = 1;
 
     if ( cpu_has_xsave )
     {
@@ -149,11 +151,11 @@ int emul_test_cpuid(
     }
 
     /*
-     * The emulator doesn't itself use CLZERO, so we can always run the
+     * The emulator doesn't itself use CLZERO/RDPRU, so we can always run the
      * respective test(s).
      */
     if ( leaf == 0x80000008 )
-        res->b |= 1U << 0;
+        res->b |= (1U << 0) | (1U << 4);
 
     return X86EMUL_OKAY;
 }
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -243,8 +243,6 @@ static void recalculate_misc(struct cpui
     /* Most of Power/RAS hidden from guests. */
     p->extd.raw[0x7].a = p->extd.raw[0x7].b = p->extd.raw[0x7].c = 0;
 
-    p->extd.raw[0x8].d = 0;
-
     switch ( p->x86_vendor )
     {
     case X86_VENDOR_INTEL:
@@ -263,6 +261,7 @@ static void recalculate_misc(struct cpui
 
         p->extd.raw[0x8].a &= 0x0000ffff;
         p->extd.raw[0x8].c = 0;
+        p->extd.raw[0x8].d = 0;
         break;
 
     case X86_VENDOR_AMD:
@@ -281,6 +280,7 @@ static void recalculate_misc(struct cpui
 
         p->extd.raw[0x8].a &= 0x0000ffff; /* GuestMaxPhysAddr hidden. */
         p->extd.raw[0x8].c &= 0x0003f0ff;
+        p->extd.raw[0x8].d &= 0xffff0000;
 
         p->extd.raw[0x9] = EMPTY_LEAF;
 
@@ -643,6 +643,11 @@ void recalculate_cpuid_policy(struct dom
 
     p->extd.maxlinaddr = p->extd.lm ? 48 : 32;
 
+    if ( p->extd.rdpru )
+        p->extd.rdpru_max = min(p->extd.rdpru_max, max->extd.rdpru_max);
+    else
+        p->extd.rdpru_max = 0;
+
     recalculate_xstate(p);
     recalculate_misc(p);
 
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -1889,6 +1889,7 @@ amd_like(const struct x86_emulate_ctxt *
 #define vcpu_has_fma4()        (ctxt->cpuid->extd.fma4)
 #define vcpu_has_tbm()         (ctxt->cpuid->extd.tbm)
 #define vcpu_has_clzero()      (ctxt->cpuid->extd.clzero)
+#define vcpu_has_rdpru()       (ctxt->cpuid->extd.rdpru)
 #define vcpu_has_wbnoinvd()    (ctxt->cpuid->extd.wbnoinvd)
 
 #define vcpu_has_bmi1()        (ctxt->cpuid->feat.bmi1)
@@ -5725,6 +5726,50 @@ x86_emulate(
                 limit -= sizeof(zero);
             }
             break;
+
+        case 0xfd: /* rdpru */
+            vcpu_must_have(rdpru);
+
+            if ( !mode_ring0() )
+            {
+                fail_if(!ops->read_cr);
+                if ( (rc = ops->read_cr(4, &cr4, ctxt)) != X86EMUL_OKAY )
+                    goto done;
+                generate_exception_if(cr4 & X86_CR4_TSD, EXC_UD);
+            }
+
+            switch ( _regs.ecx | -(_regs.ecx > ctxt->cpuid->extd.rdpru_max) )
+            {
+            case 0:  n = MSR_IA32_MPERF; break;
+            case 1:  n = MSR_IA32_APERF; break;
+            default: n = 0; break;
+            }
+
+            _regs.eflags &= ~EFLAGS_MASK;
+            if ( n )
+            {
+                fail_if(!ops->read_msr);
+                switch ( rc = ops->read_msr(n, &msr_val, ctxt) )
+                {
+                case X86EMUL_OKAY:
+                    _regs.eflags |= X86_EFLAGS_CF;
+                    break;
+
+                case X86EMUL_EXCEPTION:
+                    x86_emul_reset_event(ctxt);
+                    rc = X86EMUL_OKAY;
+                    break;
+
+                default:
+                    goto done;
+                }
+            }
+
+            if ( !(_regs.eflags & X86_EFLAGS_CF) )
+                msr_val = 0;
+            _regs.r(dx) = msr_val >> 32;
+            _regs.r(ax) = (uint32_t)msr_val;
+            break;
         }
 
 #define _GRP7(mod, reg) \
--- a/xen/include/asm-x86/hvm/svm/vmcb.h
+++ b/xen/include/asm-x86/hvm/svm/vmcb.h
@@ -74,7 +74,8 @@ enum GenericIntercept2bits
     GENERAL2_INTERCEPT_MONITOR = 1 << 10,
     GENERAL2_INTERCEPT_MWAIT   = 1 << 11,
     GENERAL2_INTERCEPT_MWAIT_CONDITIONAL = 1 << 12,
-    GENERAL2_INTERCEPT_XSETBV  = 1 << 13
+    GENERAL2_INTERCEPT_XSETBV  = 1 << 13,
+    GENERAL2_INTERCEPT_RDPRU   = 1 << 14,
 };
 
 
@@ -298,6 +299,7 @@ enum VMEXIT_EXITCODE
     VMEXIT_MWAIT            = 139, /* 0x8b */
     VMEXIT_MWAIT_CONDITIONAL= 140, /* 0x8c */
     VMEXIT_XSETBV           = 141, /* 0x8d */
+    VMEXIT_RDPRU            = 142, /* 0x8e */
     VMEXIT_NPF              = 1024, /* 0x400, nested paging fault */
     VMEXIT_INVALID          =  -1
 };
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -248,6 +248,7 @@ XEN_CPUFEATURE(EFRO,          7*32+10) /
 /* AMD-defined CPU features, CPUID level 0x80000008.ebx, word 8 */
 XEN_CPUFEATURE(CLZERO,        8*32+ 0) /*A  CLZERO instruction */
 XEN_CPUFEATURE(RSTR_FP_ERR_PTRS, 8*32+ 2) /*A  (F)X{SAVE,RSTOR} always saves/restores FPU Error pointers */
+XEN_CPUFEATURE(RDPRU,         8*32+ 4) /*A  RDPRU instruction */
 XEN_CPUFEATURE(WBNOINVD,      8*32+ 9) /*   WBNOINVD instruction */
 XEN_CPUFEATURE(IBPB,          8*32+12) /*A  IBPB support only (no IBRS, used by AMD) */
 XEN_CPUFEATURE(AMD_PPIN,      8*32+23) /*   Protected Processor Inventory Number */
--- a/xen/include/xen/lib/x86/cpuid.h
+++ b/xen/include/xen/lib/x86/cpuid.h
@@ -263,7 +263,7 @@ struct cpuid_policy
                 struct { DECL_BITFIELD(e8b); };
             };
             uint32_t nc:8, :4, apic_id_size:4, :16;
-            uint32_t /* d */:32;
+            uint8_t :8, :8, rdpru_max, :8;
         };
     } extd;
 


