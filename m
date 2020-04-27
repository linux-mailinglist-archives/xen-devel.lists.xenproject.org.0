Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D761BA219
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2020 13:14:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jT1iW-0005xA-87; Mon, 27 Apr 2020 11:14:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7OvG=6L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jT1iU-0005wo-Lr
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2020 11:14:26 +0000
X-Inumbo-ID: 40f9c7f2-8878-11ea-9761-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 40f9c7f2-8878-11ea-9761-12813bfff9fa;
 Mon, 27 Apr 2020 11:14:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 60DD7ADE3;
 Mon, 27 Apr 2020 11:14:24 +0000 (UTC)
Subject: [PATCH v7 05/11] x86emul: support X{SUS,RES}LDTRK
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e28f9cdf-00bc-4a48-c5bf-96f5055c7291@suse.com>
Message-ID: <53feebc9-4596-0698-486a-219c97b0580d@suse.com>
Date: Mon, 27 Apr 2020 13:14:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <e28f9cdf-00bc-4a48-c5bf-96f5055c7291@suse.com>
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

There's nothing to be done by the emulator, as we unconditionally abort
any XBEGIN.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v6: New.

--- a/tools/libxl/libxl_cpuid.c
+++ b/tools/libxl/libxl_cpuid.c
@@ -208,6 +208,7 @@ int libxl_cpuid_parse_config(libxl_cpuid
         {"avx512-vnni",  0x00000007,  0, CPUID_REG_ECX, 11,  1},
         {"avx512-bitalg",0x00000007,  0, CPUID_REG_ECX, 12,  1},
         {"avx512-vpopcntdq",0x00000007,0,CPUID_REG_ECX, 14,  1},
+        {"tsxldtrk",     0x00000007,  0, CPUID_REG_ECX, 16,  1},
         {"rdpid",        0x00000007,  0, CPUID_REG_ECX, 22,  1},
         {"cldemote",     0x00000007,  0, CPUID_REG_ECX, 25,  1},
 
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -128,6 +128,7 @@ static const char *const str_7c0[32] =
     [10] = "vpclmulqdq",       [11] = "avx512_vnni",
     [12] = "avx512_bitalg",
     [14] = "avx512_vpopcntdq",
+    [16] = "tsxldtrk",
 
     [22] = "rdpid",
     /* 24 */                   [25] = "cldemote",
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -1921,6 +1921,7 @@ amd_like(const struct x86_emulate_ctxt *
 #define vcpu_has_avx512_vnni() (ctxt->cpuid->feat.avx512_vnni)
 #define vcpu_has_avx512_bitalg() (ctxt->cpuid->feat.avx512_bitalg)
 #define vcpu_has_avx512_vpopcntdq() (ctxt->cpuid->feat.avx512_vpopcntdq)
+#define vcpu_has_tsxldtrk()    (ctxt->cpuid->feat.tsxldtrk)
 #define vcpu_has_rdpid()       (ctxt->cpuid->feat.rdpid)
 #define vcpu_has_movdiri()     (ctxt->cpuid->feat.movdiri)
 #define vcpu_has_movdir64b()   (ctxt->cpuid->feat.movdir64b)
@@ -5668,6 +5669,20 @@ x86_emulate(
                 host_and_vcpu_must_have(serialize);
                 asm volatile ( ".byte 0x0f, 0x01, 0xe8" );
                 break;
+            case vex_f2: /* xsusldtrk */
+                vcpu_must_have(tsxldtrk);
+                break;
+            default:
+                goto unimplemented_insn;
+            }
+            break;
+
+        case 0xe9:
+            switch ( vex.pfx )
+            {
+            case vex_f2: /* xresldtrk */
+                vcpu_must_have(tsxldtrk);
+                break;
             default:
                 goto unimplemented_insn;
             }
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -236,6 +236,7 @@ XEN_CPUFEATURE(VPCLMULQDQ,    6*32+10) /
 XEN_CPUFEATURE(AVX512_VNNI,   6*32+11) /*A  Vector Neural Network Instrs */
 XEN_CPUFEATURE(AVX512_BITALG, 6*32+12) /*A  Support for VPOPCNT[B,W] and VPSHUFBITQMB */
 XEN_CPUFEATURE(AVX512_VPOPCNTDQ, 6*32+14) /*A  POPCNT for vectors of DW/QW */
+XEN_CPUFEATURE(TSXLDTRK,      6*32+16) /*A  TSX load tracking suspend/resume insns */
 XEN_CPUFEATURE(RDPID,         6*32+22) /*A  RDPID instruction */
 XEN_CPUFEATURE(CLDEMOTE,      6*32+25) /*A  CLDEMOTE instruction */
 XEN_CPUFEATURE(MOVDIRI,       6*32+27) /*A  MOVDIRI instruction */
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -284,6 +284,9 @@ def crunch_numbers(state):
         # as dependent features simplifies Xen's logic, and prevents the guest
         # from seeing implausible configurations.
         IBRSB: [STIBP, SSBD],
+
+        # In principle the TSXLDTRK insns could also be considered independent.
+        RTM: [TSXLDTRK],
     }
 
     deep_features = tuple(sorted(deps.keys()))


