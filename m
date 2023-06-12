Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AEB972CB2B
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 18:13:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547357.854698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8kAU-000250-OF; Mon, 12 Jun 2023 16:13:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547357.854698; Mon, 12 Jun 2023 16:13:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8kAU-00021i-LM; Mon, 12 Jun 2023 16:13:22 +0000
Received: by outflank-mailman (input) for mailman id 547357;
 Mon, 12 Jun 2023 16:13:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=abQ6=CA=citrix.com=prvs=520cb9a4c=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q8kAT-00021a-Fh
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 16:13:21 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09fa18e6-093c-11ee-b232-6b7b168915f2;
 Mon, 12 Jun 2023 18:13:18 +0200 (CEST)
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
X-Inumbo-ID: 09fa18e6-093c-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686586398;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eFTZogDG8jJGUh/dvb+LH3qiXQDXhFneACQkBb0Q/Es=;
  b=bg5kc1ZmrvtRnirllHxi81M70cExVMg0e2qUw+Fb6o+MKhtTM0Gqnpa0
   HUUWhirQFmNb5cq6j8WMdQF5X9NA+swPX+BtUqFc6OjsjZG2WpB5NgLxo
   /VjoHIlcS0IV5yI/oRcO6wwjsGN2I8rLPC8k66wwa4iqSTpCFHLpuOg8d
   k=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 112913012
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:Twy/iqhdSrRPQZWEQyRz7MBRX161GhAKZh0ujC45NGQN5FlHY01je
 htvWWiEaPeNMzb9fopzO9+y8U5Su5SDx9FqGgFp+SpnRCob9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyq0N8klgZmP6sT4gaEzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tRFCDEUQVeMo96mxY+GS7BihZoOB/XSadZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJYw1MYH49tL7Aan3XWjtUsl+K44Ew5HDe1ldZ27nxKtvFPNeNQK25m27B/
 ziXpj+hW0ty2Nq3+SO/82mWm+zzhnnDX5ouHb+g+KdGuQjGroAUIEJPDgbqyRWjsWauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4O88Q5RyJy6HUyx2EHWVCRTlEAPQ5sOcmSDps0
 UWG9+4FHhQ27ufTEyjEsO7J83XrY3N9wXI+iTEsECsE+vakr6UPnhfyc9c6Hq3ro/bJIGSlq
 9yVlxTSl4n/nOZSifXlpwCc2GPxznTaZlVrv1uKBwpJ+is8Pdf4PNLwtDA3+N4adO6kok+9U
 G/ociR0xMQHFtmzmSOEW43h95n5tq/eYFUwbbOCdqTNFghBGFb5J+i8GBkkeC9U3j8sIFcFm
 nP7twJL/4N0N3C3d6JxaI/ZI510nfa9TYS5DqGMMoQmjn1NmOivpngGWKJt9zq1zBhEfV8XZ
 P93jvpA/V5FUP86nVJats8W0KMxxzBW+I8gbcmT8vhT6pLHPCT9Ye5cYDOzghURsPvsTPP9r
 4wOaKNnCnx3DIXDX8Ug2dRDfQlXfCRhVMyeRg4+XrfrHzeK0VoJU5f5qY7NsaQ890iJvo8kJ
 k2AZ3I=
IronPort-HdrOrdr: A9a23:n3rwrqGCQHMcLCdBpLqE7MeALOsnbusQ8zAXPhZKOHhom62j9/
 xG885x6faZslwssRIb+OxoWpPufZqGz+8R3WB5B97LYOCBggaVxepZg7cKrQeNJ8VQnNQtsp
 uJ38JFeb7N5fkRt7eZ3DWF
X-Talos-CUID: 9a23:9BCN/W9TLDhefmW0njaVvxM0G9kKNXL58GfVHnK5UGhqFpC+dWbFrQ==
X-Talos-MUID: 9a23:t376fgSz6G1Ez/GgRXTcnQtjL/114Ji1UngKiakPudGKbABJbmI=
X-IronPort-AV: E=Sophos;i="6.00,236,1681185600"; 
   d="scan'208";a="112913012"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v3 4/4] x86/cpu-policy: Derive RSBA/RRSBA for guest policies
Date: Mon, 12 Jun 2023 17:13:06 +0100
Message-ID: <20230612161306.2739572-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230612161306.2739572-1-andrew.cooper3@citrix.com>
References: <20230612161306.2739572-1-andrew.cooper3@citrix.com>
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
linked, absolutely nothing good can come of letting the guest see RRSBA
without EIBRS.  Nor a guest seeing EIBRS without IBRSB.  Furthermore, we use
this dependency to simplify the max derivation logic.

The max policies gets RSBA and RRSBA unconditionally set (with the EIBRS
dependency maybe hiding RRSBA).  We can run any VM, even if it has been told
"somewhere you might run, Retpoline isn't safe".

The default policies are more complicated.  A guest shouldn't see both bits,
but it needs to see one if the current host suffers from any form of RSBA, and
which bit it needs to see depends on whether eIBRS is visible or not.
Therefore, the calculation must be performed after sanitise_featureset().

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v3:
 * Minor commit message adjustment.
 * Drop changes to recalculate_cpuid_policy().  Deferred to a later series.

v2:
 * Expand/adjust the comment for the max features.
 * Rewrite the default feature derivation in light of new information.
 * Fix up in recalculate_cpuid_policy() too.
---
 xen/arch/x86/cpu-policy.c                   | 39 +++++++++++++++++++++
 xen/include/public/arch-x86/cpufeatureset.h |  4 +--
 xen/tools/gen-cpuid.py                      |  5 ++-
 3 files changed, 45 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index ee256ff5a137..cde7f7605c28 100644
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
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index ea779c29879e..ce7407d6a10c 100644
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


