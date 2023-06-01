Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 419CE71A0DA
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 16:49:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542600.846656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4jbo-0006fB-HG; Thu, 01 Jun 2023 14:49:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542600.846656; Thu, 01 Jun 2023 14:49:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4jbo-0006ce-DP; Thu, 01 Jun 2023 14:49:00 +0000
Received: by outflank-mailman (input) for mailman id 542600;
 Thu, 01 Jun 2023 14:48:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bFRJ=BV=citrix.com=prvs=509590c99=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q4jbm-0005t4-Py
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 14:48:58 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f7be821-008b-11ee-8611-37d641c3527e;
 Thu, 01 Jun 2023 16:48:56 +0200 (CEST)
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
X-Inumbo-ID: 6f7be821-008b-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685630936;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0Huqnszf3sCeFY36VmVwYFe6YJQ79qu8pbuCZc31GcY=;
  b=ThLVIgkcCQgUucE+PbmfD90P8Pr4ewj31zBlJeKT5iIda3FzY1XJxN6Y
   UP7KwmYV7SqjxBzwMeB4+1jdW3lAQLjRXwPExG9vJpGnA0SbVT31K/7BE
   yYMNBYX7KhPFv5++vy875Ya29oVcWlM0CnsJ/cB6+QxkLVSA03e4VyC0F
   8=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 113728657
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:6Z+78q5pkiOxUOH8adAHDQxRtCTHchMFZxGqfqrLsTDasY5as4F+v
 jFOXm+AbvaLYjT1fYhyO42w9E8CvpPRyoAyGgU6pCwyHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU35JwehBtC5gZlPa4T5QeF/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m7
 P8HBypKSzW/tcmTnLulYPQ22+0sM5y+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJUQVYT/7C7pn9AusrlD5fydVtxS+oq0v7nKI5AdwzKLsIJzefdniqcB9xx/D+
 TiWoTmmav0cHOzD+xmJ6lOuurXKkX/4doM1KJOezsc/1TV/wURMUUZLBDNXu8KRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM/JyOeAn7ACGyoLP/h2UQGMDS1Zpd9gOpMIwAzsw2
 Te0c8jBXGI19ufPEDTEq+nS9GnpUcQIEYMcTTYHUiQfpPzGnLMYq07GUPx+SvOcgcKgTFkc3
 Au2hCQ5grwSi+sC2KO64U3LjlqQm3TZcuImzl6JBzz4t2uVcKbgPtX1sgaDsZ6sOa7DFjG8U
 G44d99yBQzkJbWEj2SzTeoEB9lFDN7VYWSH0TaD83TMnglBGkJPn6gJsVmSx28zaK7onAMFh
 2eN0T69HLcJYBOXgVZfOupd8fgCw6n6DsjCXfvJdNdIaZUZXFbZrHwzOBHAgji1zRhEfUQD1
 XGzK5zE4ZEyUPUP8dZLb71Fje9DKt4WmAs/uqwXPzz4iOHDNRZ5uJ8OMUeUb/BR0U93iFy9z
 jqrDOPTk083eLSnMkHqHXs7cQhiwY4TWcqn9KS6t4erfmJbJY3WI6SKme1xK904xvg9eyWh1
 ijVZ3K0AWHX3RXvQThmoFg/AF8zdf6TdU4GABE=
IronPort-HdrOrdr: A9a23:srP37aldqolmakWOKiRMBtaA14vpDfOnimdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcIi7SdC9qXO1z+8X3WBjB8bbYOCGghrhEGgG1+ffKlLbakrDH4JmtJ
 uIEJIOQ+EYb2IK6/oSiTPQe7lP/DDtytHLuQ6q9QYIcegcUdAE0+4WMGamO3wzYDMDKYsyFZ
 Ka6MYCjSGnY24rYsOyAWRAd/TfpvXQ/aiWLCIuNloC0k2jnDmo4Ln1H1yzxREFSQ5Cxr8k7C
 zsjxH53KO+qPu2oyWsm1M7rq4m1+cJ+OEzRfBkufJlagkETTzYJ7iJbofy8gzdZtvfqmrC3u
 O85ivIdP4DkE85NlvF2ycFnTOQmgrGokWStWNxjRbY0LHEbSN/BMxbiY1DdBzFr0ImodFnya
 pOm3mUrpxNEHr77VPADnfzJmFXf2eP0A8feNQo/ghieJpbbKUUoZ0U/UtTHptFFCXm6Jo/GO
 0rCM3H/v5ZfV6Tcnic5wBUsZWRd2V2Gg3DTlkJu8ST3TQTlHdlz1EAzMhamnsb7poyR5RN+u
 yBOKV1k7NFSNMQcMtGdZE8aNryDnaITQPHMWqUL1iiHKYbO2jVo5qy+7kx7PHCQu178HLzou
 WzbLp1jx9CR6u1M7zw4HRiyGGyfFmA
X-Talos-CUID: 9a23:1kdhTmF3Hcaf1Q6lqmJ+91E7AIcAV0Hv51KMKlGSFDw0YbKKHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AkuKL2Q7X4UQgx3yuUPcor6FqxoxYv5aNBFgsk6l?=
 =?us-ascii?q?cvsXYNgJxHAuzqgyOF9o=3D?=
X-IronPort-AV: E=Sophos;i="6.00,210,1681185600"; 
   d="scan'208";a="113728657"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 3/3] x86/cpu-policy: Derive RSBA/RRSBA for guest policies
Date: Thu, 1 Jun 2023 15:48:45 +0100
Message-ID: <20230601144845.1554589-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230601144845.1554589-1-andrew.cooper3@citrix.com>
References: <20230601144845.1554589-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The RSBA bit, "RSB Alternative", means that the RSB may use alternative
predictors when empty.  From a practical point of view, this mean "Retpoline
not safe".

Enhanced IBRS (officially IBRS_ALL in Intel's docs, previously IBRS_ATT) is a
statement that IBRS is implemented in hardware (as opposed to the form
retrofitted to existing CPUs in microcode).

The RRSBA bit, "Restricted-RSBA", is a combination of RSBA, and the eIBRS
property that predictions are tagged with the mode in which they were learnt.
Therefore, it means "when eIBRS is active, the RSB may fall back to
alternative predictors but restricted to the current prediction mode".  As
such, it's stronger statement than RSBA, but still means "Retpoline not safe".

CPUs are not expected to enumerate both RSBA and RRSBA.

Add feature dependencies for EIBRS and RRSBA.  While technically they're not
linked, absolutely nothing good can of letting the guest see RRSBA without
EIBRS.  Nor can anything good come of a guest seeing EIBRS without IBRSB.
Furthermore, we use this dependency to simplify the max derivation logic.

The max policies gets RSBA and RRSBA unconditionally set (with the EIBRS
dependency maybe hiding RRSBA).  We can run any VM, even if it has been told
"somewhere you might run, Retpoline isn't safe".

The default policies are more complicated.  A guest shouldn't see both bits,
but it needs to see one if the current host suffers from any form of RSBA, and
which bit it needs to see depends on whether eIBRS is visible or not.
Therefore, the calculation must be performed after sanitise_featureset().

Finally, apply the same logic in recalculate_cpuid_policy(), as we do for
other safety settings while we're still overhauling the toolstack logic in
this area.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2:
 * Expand/adjust the comment for the max features.
 * Rewrite the default feature derivation in light of new information.
 * Fix up in recalculate_cpuid_policy() too.
---
 xen/arch/x86/cpu-policy.c                   | 53 +++++++++++++++++++++
 xen/include/public/arch-x86/cpufeatureset.h |  4 +-
 xen/tools/gen-cpuid.py                      |  5 +-
 3 files changed, 59 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index ee256ff5a137..f3bcb1ea4101 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -423,8 +423,17 @@ static void __init guest_common_max_feature_adjustments(uint32_t *fs)
          * Retpoline not safe)", so these need to be visible to a guest in all
          * cases, even when it's only some other server in the pool which
          * suffers the identified behaviour.
+         *
+         * We can always run any VM which has previously (or will
+         * subsequently) run on hardware where Retpoline is not safe.
+         * Note:
+         *  - The dependency logic may hide RRSBA for other reasons.
+         *  - The max policy does not contitute a sensible configuration to
+         *    run a guest in.
          */
         __set_bit(X86_FEATURE_ARCH_CAPS, fs);
+        __set_bit(X86_FEATURE_RSBA, fs);
+        __set_bit(X86_FEATURE_RRSBA, fs);
     }
 }
 
@@ -532,6 +541,21 @@ static void __init calculate_pv_def_policy(void)
     guest_common_default_feature_adjustments(fs);
 
     sanitise_featureset(fs);
+
+    /*
+     * If the host suffers from RSBA of any form, and the guest can see
+     * MSR_ARCH_CAPS, reflect the appropriate RSBA/RRSBA property to the guest
+     * depending on the visibility of eIBRS.
+     */
+    if ( test_bit(X86_FEATURE_ARCH_CAPS, fs) &&
+         (cpu_has_rsba || cpu_has_rrsba) )
+    {
+        bool eibrs = test_bit(X86_FEATURE_EIBRS, fs);
+
+        __set_bit(eibrs ? X86_FEATURE_RRSBA
+                        : X86_FEATURE_RSBA, fs);
+    }
+
     x86_cpu_featureset_to_policy(fs, p);
     recalculate_xstate(p);
 }
@@ -664,6 +688,21 @@ static void __init calculate_hvm_def_policy(void)
         __set_bit(X86_FEATURE_VIRT_SSBD, fs);
 
     sanitise_featureset(fs);
+
+    /*
+     * If the host suffers from RSBA of any form, and the guest can see
+     * MSR_ARCH_CAPS, reflect the appropriate RSBA/RRSBA property to the guest
+     * depending on the visibility of eIBRS.
+     */
+    if ( test_bit(X86_FEATURE_ARCH_CAPS, fs) &&
+         (cpu_has_rsba || cpu_has_rrsba) )
+    {
+        bool eibrs = test_bit(X86_FEATURE_EIBRS, fs);
+
+        __set_bit(eibrs ? X86_FEATURE_RRSBA
+                        : X86_FEATURE_RSBA, fs);
+    }
+
     x86_cpu_featureset_to_policy(fs, p);
     recalculate_xstate(p);
 }
@@ -786,6 +825,20 @@ void recalculate_cpuid_policy(struct domain *d)
 
     sanitise_featureset(fs);
 
+    /*
+     * If the host suffers from RSBA of any form, and the guest can see
+     * MSR_ARCH_CAPS, reflect the appropriate RSBA/RRSBA property to the guest
+     * depending on the visibility of eIBRS.
+     */
+    if ( test_bit(X86_FEATURE_ARCH_CAPS, fs) &&
+         (cpu_has_rsba || cpu_has_rrsba) )
+    {
+        bool eibrs = test_bit(X86_FEATURE_EIBRS, fs);
+
+        __set_bit(eibrs ? X86_FEATURE_RRSBA
+                        : X86_FEATURE_RSBA, fs);
+    }
+
     /* Fold host's FDP_EXCP_ONLY and NO_FPU_SEL into guest's view. */
     fs[FEATURESET_7b0] &= ~(cpufeat_mask(X86_FEATURE_FDP_EXCP_ONLY) |
                             cpufeat_mask(X86_FEATURE_NO_FPU_SEL));
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index 4edf9aba7ff6..a0e46138d763 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -311,7 +311,7 @@ XEN_CPUFEATURE(CET_SSS,            15*32+18) /*   CET Supervisor Shadow Stacks s
 /* Intel-defined CPU features, MSR_ARCH_CAPS 0x10a.eax, word 16 */
 XEN_CPUFEATURE(RDCL_NO,            16*32+ 0) /*A  No Rogue Data Cache Load (Meltdown) */
 XEN_CPUFEATURE(EIBRS,              16*32+ 1) /*A  Enhanced IBRS */
-XEN_CPUFEATURE(RSBA,               16*32+ 2) /*!A RSB Alternative (Retpoline not safe) */
+XEN_CPUFEATURE(RSBA,               16*32+ 2) /*!  RSB Alternative (Retpoline not safe) */
 XEN_CPUFEATURE(SKIP_L1DFL,         16*32+ 3) /*   Don't need to flush L1D on VMEntry */
 XEN_CPUFEATURE(INTEL_SSB_NO,       16*32+ 4) /*A  No Speculative Store Bypass */
 XEN_CPUFEATURE(MDS_NO,             16*32+ 5) /*A  No Microarchitectural Data Sampling */
@@ -327,7 +327,7 @@ XEN_CPUFEATURE(FBSDP_NO,           16*32+14) /*A  No Fill Buffer Stale Data Prop
 XEN_CPUFEATURE(PSDP_NO,            16*32+15) /*A  No Primary Stale Data Propagation */
 XEN_CPUFEATURE(FB_CLEAR,           16*32+17) /*A  Fill Buffers cleared by VERW */
 XEN_CPUFEATURE(FB_CLEAR_CTRL,      16*32+18) /*   MSR_OPT_CPU_CTRL.FB_CLEAR_DIS */
-XEN_CPUFEATURE(RRSBA,              16*32+19) /*!A Restricted RSB Alternative */
+XEN_CPUFEATURE(RRSBA,              16*32+19) /*!  Restricted RSB Alternative */
 XEN_CPUFEATURE(BHI_NO,             16*32+20) /*A  No Branch History Injection  */
 XEN_CPUFEATURE(XAPIC_STATUS,       16*32+21) /*   MSR_XAPIC_DISABLE_STATUS */
 XEN_CPUFEATURE(OVRCLK_STATUS,      16*32+23) /*   MSR_OVERCLOCKING_STATUS */
diff --git a/xen/tools/gen-cpuid.py b/xen/tools/gen-cpuid.py
index 973fcc1c64e8..72cf11654ba9 100755
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -318,7 +318,7 @@ def crunch_numbers(state):
         # IBRSB/IBRS, and we pass this MSR directly to guests.  Treating them
         # as dependent features simplifies Xen's logic, and prevents the guest
         # from seeing implausible configurations.
-        IBRSB: [STIBP, SSBD, INTEL_PSFD],
+        IBRSB: [STIBP, SSBD, INTEL_PSFD, EIBRS],
         IBRS: [AMD_STIBP, AMD_SSBD, PSFD, AUTO_IBRS,
                IBRS_ALWAYS, IBRS_FAST, IBRS_SAME_MODE],
         AMD_STIBP: [STIBP_ALWAYS],
@@ -328,6 +328,9 @@ def crunch_numbers(state):
 
         # The ARCH_CAPS CPUID bit enumerates the availability of the whole register.
         ARCH_CAPS: list(range(RDCL_NO, RDCL_NO + 64)),
+
+        # The behaviour described by RRSBA depend on eIBRS being active.
+        EIBRS: [RRSBA],
     }
 
     deep_features = tuple(sorted(deps.keys()))
-- 
2.30.2


