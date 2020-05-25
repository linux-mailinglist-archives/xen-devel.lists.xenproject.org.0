Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AEC1E113E
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2020 17:05:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdEeT-0003nv-5C; Mon, 25 May 2020 15:04:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MLe6=7H=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jdEeR-0003nq-8E
 for xen-devel@lists.xenproject.org; Mon, 25 May 2020 15:04:27 +0000
X-Inumbo-ID: 061da4b4-9e99-11ea-9887-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 061da4b4-9e99-11ea-9887-bc764e2007e4;
 Mon, 25 May 2020 15:04:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C225CAC52;
 Mon, 25 May 2020 15:04:27 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] VT-x: extend LBR Broadwell errata coverage
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <c43b9d43-2e37-d2a8-ba32-dd06062a05e2@suse.com>
Date: Mon, 25 May 2020 17:04:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

For lbr_tsx_fixup_check() simply name a few more specific erratum
numbers.

For bdf93_fixup_check(), however, more models are affected. Oddly enough
despite being the same model and stepping, the erratum is listed for
Xeon E3 but not its Core counterpart. Apply the workaround uniformly,
and also for Xeon D, which only has the LBR-from one listed in its spec
update.

Seeing this broader applicability, rename anything BDF93-related to more
generic names.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Name yet another pair of errata. Speculatively cover Xeon D also
    in the 2nd case. Identifier renaming.

--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2380,7 +2380,7 @@ static void pi_notification_interrupt(st
 }
 
 static void __init lbr_tsx_fixup_check(void);
-static void __init bdf93_fixup_check(void);
+static void __init ler_to_fixup_check(void);
 
 /*
  * Calculate whether the CPU is vulnerable to Instruction Fetch page
@@ -2554,7 +2554,7 @@ const struct hvm_function_table * __init
     }
 
     lbr_tsx_fixup_check();
-    bdf93_fixup_check();
+    ler_to_fixup_check();
 
     return &vmx_function_table;
 }
@@ -2832,11 +2832,11 @@ enum
 
 #define LBR_MSRS_INSERTED      (1u << 0)
 #define LBR_FIXUP_TSX          (1u << 1)
-#define LBR_FIXUP_BDF93        (1u << 2)
-#define LBR_FIXUP_MASK         (LBR_FIXUP_TSX | LBR_FIXUP_BDF93)
+#define LBR_FIXUP_LER_TO       (1u << 2)
+#define LBR_FIXUP_MASK         (LBR_FIXUP_TSX | LBR_FIXUP_LER_TO)
 
 static bool __read_mostly lbr_tsx_fixup_needed;
-static bool __read_mostly bdf93_fixup_needed;
+static bool __read_mostly ler_to_fixup_needed;
 
 static void __init lbr_tsx_fixup_check(void)
 {
@@ -2844,7 +2844,7 @@ static void __init lbr_tsx_fixup_check(v
     uint32_t lbr_format;
 
     /*
-     * HSM182, HSD172, HSE117, BDM127, BDD117, BDF85, BDE105:
+     * Haswell erratum HSM182 et al, Broadwell erratum BDM127 et al:
      *
      * On processors that do not support Intel Transactional Synchronization
      * Extensions (Intel TSX) (CPUID.07H.EBX bits 4 and 11 are both zero),
@@ -2868,8 +2868,11 @@ static void __init lbr_tsx_fixup_check(v
     case 0x45: /* HSM182 - 4th gen Core */
     case 0x46: /* HSM182, HSD172 - 4th gen Core (GT3) */
     case 0x3d: /* BDM127 - 5th gen Core */
-    case 0x47: /* BDD117 - 5th gen Core (GT3) */
-    case 0x4f: /* BDF85  - Xeon E5-2600 v4 */
+    case 0x47: /* BDD117 - 5th gen Core (GT3)
+                  BDW117 - Xeon E3-1200 v4 */
+    case 0x4f: /* BDF85  - Xeon E5-2600 v4
+                  BDH75  - Core-i7 for LGA2011-v3 Socket
+                  BDX88  - Xeon E7-x800 v4 */
     case 0x56: /* BDE105 - Xeon D-1500 */
         break;
     default:
@@ -2890,18 +2893,31 @@ static void __init lbr_tsx_fixup_check(v
         lbr_tsx_fixup_needed = true;
 }
 
-static void __init bdf93_fixup_check(void)
+static void __init ler_to_fixup_check(void)
 {
     /*
-     * Broadwell erratum BDF93:
+     * Broadwell erratum BDF93 et al:
      *
      * Reads from MSR_LER_TO_LIP (MSR 1DEH) may return values for bits[63:61]
      * that are not equal to bit[47].  Attempting to context switch this value
      * may cause a #GP.  Software should sign extend the MSR.
      */
-    if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL &&
-         boot_cpu_data.x86 == 6 && boot_cpu_data.x86_model == 0x4f )
-        bdf93_fixup_needed = true;
+    if ( boot_cpu_data.x86_vendor != X86_VENDOR_INTEL ||
+         boot_cpu_data.x86 != 6 )
+        return;
+
+    switch ( boot_cpu_data.x86_model )
+    {
+    case 0x3d: /* BDM131 - 5th gen Core */
+    case 0x47: /* BDD??? - 5th gen Core (H-Processor line)
+                  BDW120 - Xeon E3-1200 v4 */
+    case 0x4f: /* BDF93  - Xeon E5-2600 v4
+                  BDH80  - Core-i7 for LGA2011-v3 Socket
+                  BDX93  - Xeon E7-x800 v4 */
+    case 0x56: /* BDE??? - Xeon D-1500 */
+        ler_to_fixup_needed = true;
+        break;
+    }
 }
 
 static int is_last_branch_msr(u32 ecx)
@@ -3276,8 +3292,8 @@ static int vmx_msr_write_intercept(unsig
             v->arch.hvm.vmx.lbr_flags |= LBR_MSRS_INSERTED;
             if ( lbr_tsx_fixup_needed )
                 v->arch.hvm.vmx.lbr_flags |= LBR_FIXUP_TSX;
-            if ( bdf93_fixup_needed )
-                v->arch.hvm.vmx.lbr_flags |= LBR_FIXUP_BDF93;
+            if ( ler_to_fixup_needed )
+                v->arch.hvm.vmx.lbr_flags |= LBR_FIXUP_LER_TO;
         }
 
         __vmwrite(GUEST_IA32_DEBUGCTL, msr_content);
@@ -4338,7 +4354,7 @@ static void sign_extend_msr(struct vcpu
         entry->data = canonicalise_addr(entry->data);
 }
 
-static void bdf93_fixup(void)
+static void ler_to_fixup(void)
 {
     struct vcpu *curr = current;
 
@@ -4351,8 +4367,8 @@ static void lbr_fixup(void)
 
     if ( curr->arch.hvm.vmx.lbr_flags & LBR_FIXUP_TSX )
         lbr_tsx_fixup();
-    if ( curr->arch.hvm.vmx.lbr_flags & LBR_FIXUP_BDF93 )
-        bdf93_fixup();
+    if ( curr->arch.hvm.vmx.lbr_flags & LBR_FIXUP_LER_TO )
+        ler_to_fixup();
 }
 
 /* Returns false if the vmentry has to be restarted */

