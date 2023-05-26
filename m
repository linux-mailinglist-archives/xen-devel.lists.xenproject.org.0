Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6860712540
	for <lists+xen-devel@lfdr.de>; Fri, 26 May 2023 13:08:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540057.841503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2VIG-0006g4-Uz; Fri, 26 May 2023 11:07:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540057.841503; Fri, 26 May 2023 11:07:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2VIG-0006dl-S6; Fri, 26 May 2023 11:07:36 +0000
Received: by outflank-mailman (input) for mailman id 540057;
 Fri, 26 May 2023 11:07:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gDTS=BP=citrix.com=prvs=5031e17c9=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q2VIF-0006de-GA
 for xen-devel@lists.xenproject.org; Fri, 26 May 2023 11:07:35 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 822189af-fbb5-11ed-8611-37d641c3527e;
 Fri, 26 May 2023 13:07:32 +0200 (CEST)
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
X-Inumbo-ID: 822189af-fbb5-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685099252;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=anpmt4luKppeT0MDr6VWEfx6VCbmSawCR46DmW0f5Hg=;
  b=dvJg3jA4R6QyLT8roDDUsv6TxrgBVbrMVBc30EnK7PTmIqpCh+lhwjf6
   B5IVdmZX71+kzkGxsm1pXYoJu7vgS4plMl/BfB9txlH9NvhjXgAG5tNd3
   B/VSD1dOqWpBndMfPndATRmuyzK+Clnt0SB1Ez9UfcIUXPWr1WHJ84prr
   Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 113007427
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:cickcK/WINsFFjzDL4PlDrUD836TJUtcMsCJ2f8bNWPcYEJGY0x3x
 msdDG/UOfaKYmP0eo0nO97loExTuZSGx4Q3SAtupS88E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks31BjOkGlA5AdmOKoV5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkkS5
 M4oMWs2ayvS3c6sxou7WM1Vq8k8eZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGOkcUUrsUIMtWcOOAr3/zaTBH7nmSorI6+TP7xw1tyrn9dtHSf7RmQO0Mxx3A/
 j2apTuR7hcyLfvHlhS94HiVp8DQuT/Ad6gCJJr/z6s/6LGU7jNKU0BHPbehmtGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0ZjZLO7RkskfXkPOSulvHQDFeFVatdeDKqudqVA4az
 wSymui4XxB1toSVW1ak27qL+Gba1TcuEUcOYioNTA0g6tbloZ0ugh+ncuuPAJJZnfWuR2iun
 mniQDwWwuxK0JVVj/nTEUXv2WrEm3TfcuIiCuw7tEqB5xgxWoOqbpfABbPzvacZd9bxorVsU
 RE5dymiAAImV8nleM+lGr9l8FSVCxGtblXhbaZHRcVJythU0yfLkXpsyD9/Plx1Fc0PZCXkZ
 kTe0SsIus8OZCD7MfMuPdPrYyjP8UQGPY65PhwzRoMUCqWdiSfdpH0+DaJu9zyFfLcQfVEXZ
 s7ALJfE4YcyAqV71jumL9ogPUsQ7nlmnwv7HMmrpylLJJLCPBZ5v59ZagrRBg34hYvYyDjoH
 yF3bZbSkEkHC7SvO0E6M+c7dDg3EJTyPriuw+Q/SwJJClE5cI39I5c9GY8cRrE=
IronPort-HdrOrdr: A9a23:Yx0NpK1fMEVRptAoccEy6AqjBEQkLtp133Aq2lEZdPU0SKGlfg
 6V/MjztCWE7gr5PUtLpTnuAsa9qB/nm6KdpLNhX4tKPzOW31dATrsSjrcKqgeIc0HDH6xmpM
 JdmsBFY+EYZmIK6foSjjPYLz4hquP3j5xBh43lvglQpdcBUdAQ0+97YDzrYnGfXGN9dOME/A
 L33Ls7m9KnE05nFviTNz0+cMXogcbEr57iaQ5uPW9a1OHf5QnYk4ITCnKjr20jbw8=
X-Talos-CUID: 9a23:cGaxMW9suFZKIxMsw72VvxIFKPA8KUbY9yaKD1W+MGZ7bIS4REDFrQ==
X-Talos-MUID: 9a23:FStVZgt3Zg1Ra3R0I82nnRY6a+lQ8a6XKW8StYk9lOOUBQs3AmLI
X-IronPort-AV: E=Sophos;i="6.00,194,1681185600"; 
   d="scan'208";a="113007427"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 2/4] x86/spec-ctrl: Synthesize missing RSBA/RRSBA bits
Date: Fri, 26 May 2023 12:06:53 +0100
Message-ID: <20230526110656.4018711-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230526110656.4018711-1-andrew.cooper3@citrix.com>
References: <20230526110656.4018711-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

---
 xen/arch/x86/include/asm/cpufeature.h |  1 +
 xen/arch/x86/spec_ctrl.c              | 50 +++++++++++++++++++++++----
 2 files changed, 44 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/include/asm/cpufeature.h b/xen/arch/x86/include/asm/cpufeature.h
index 50235f098d70..08e3eedd1280 100644
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -192,6 +192,7 @@ static inline bool boot_cpu_has(unsigned int feat)
 #define cpu_has_tsx_ctrl        boot_cpu_has(X86_FEATURE_TSX_CTRL)
 #define cpu_has_taa_no          boot_cpu_has(X86_FEATURE_TAA_NO)
 #define cpu_has_fb_clear        boot_cpu_has(X86_FEATURE_FB_CLEAR)
+#define cpu_has_rrsba           boot_cpu_has(X86_FEATURE_RRSBA)
 
 /* Synthesized. */
 #define cpu_has_arch_perfmon    boot_cpu_has(X86_FEATURE_ARCH_PERFMON)
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index 0774d40627dd..daf77d77e139 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -578,7 +578,10 @@ static bool __init check_smt_enabled(void)
     return false;
 }
 
-/* Calculate whether Retpoline is known-safe on this CPU. */
+/*
+ * Calculate whether Retpoline is known-safe on this CPU.  Fixes up missing
+ * RSBA/RRSBA enumeration from older microcode versions.
+ */
 static bool __init retpoline_calculations(void)
 {
     unsigned int ucode_rev = this_cpu(cpu_sig).rev;
@@ -592,13 +595,18 @@ static bool __init retpoline_calculations(void)
         return false;
 
     /*
-     * RSBA may be set by a hypervisor to indicate that we may move to a
-     * processor which isn't retpoline-safe.
-     *
      * Processors offering Enhanced IBRS are not guarenteed to be
      * repoline-safe.
      */
-    if ( cpu_has_rsba || cpu_has_eibrs )
+    if ( cpu_has_eibrs )
+        goto unsafe_maybe_fixup_rrsba;
+
+    /*
+     * RSBA is explicitly enumerated in some cases, but may also be set by a
+     * hypervisor to indicate that we may move to a processor which isn't
+     * retpoline-safe.
+     */
+    if ( cpu_has_rsba )
         return false;
 
     switch ( boot_cpu_data.x86_model )
@@ -648,6 +656,8 @@ static bool __init retpoline_calculations(void)
 
         /*
          * Skylake, Kabylake and Cannonlake processors are not retpoline-safe.
+         * Note: the eIBRS-capable steppings are filtered out earlier, so the
+         * remainder here are the ones which suffer only RSBA behaviour.
          */
     case 0x4e: /* Skylake M */
     case 0x55: /* Skylake X */
@@ -656,7 +666,7 @@ static bool __init retpoline_calculations(void)
     case 0x67: /* Cannonlake? */
     case 0x8e: /* Kabylake M */
     case 0x9e: /* Kabylake D */
-        return false;
+        goto unsafe_maybe_fixup_rsba;
 
         /*
          * Atom processors before Goldmont Plus/Gemini Lake are retpoline-safe.
@@ -687,6 +697,32 @@ static bool __init retpoline_calculations(void)
     if ( safe )
         return true;
 
+    /*
+     * The meaning of the RSBA and RRSBA bits have evolved over time.  The
+     * agreed upon meaning at the time of writing (May 2023) is thus:
+     *
+     * - RSBA (RSB Alterantive) means that an RSB may fall back to an
+     *   alternative predictor on underflow.  Skylake uarch and later all have
+     *   this property.  Broadwell too, when running microcode versions prior
+     *   to Jan 2018.
+     *
+     * - All eIBRS-capable processors suffer RSBA, but eIBRS also introduces
+     *   tagging of predictions with the mode in which they were learned.  So
+     *   when eIBRS is active, RSBA becomes RRSBA (Restricted RSBA).
+     *
+     * Some parts (Broadwell) are not expected to ever enumerate this
+     * behaviour directly.  Other parts have differing enumeration with
+     * microcode version.  Fix up Xen's idea, so we can advertise them safely
+     * to guests, and so toolstacks can level a VM safelty for migration.
+     */
+ unsafe_maybe_fixup_rrsba:
+    if ( !cpu_has_rrsba )
+        setup_force_cpu_cap(X86_FEATURE_RRSBA);
+
+ unsafe_maybe_fixup_rsba:
+    if ( !cpu_has_rsba )
+        setup_force_cpu_cap(X86_FEATURE_RSBA);
+
     return false;
 }
 
@@ -1146,7 +1182,7 @@ void __init init_speculation_mitigations(void)
             thunk = THUNK_JMP;
     }
 
-    /* Determine if retpoline is safe on this CPU. */
+    /* Determine if retpoline is safe on this CPU.  Fix up RSBA/RRSBA enumerations. */
     retpoline_safe = retpoline_calculations();
 
     /*
-- 
2.30.2


