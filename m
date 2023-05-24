Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FAB70F536
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 13:26:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538973.839453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1mco-00080O-4m; Wed, 24 May 2023 11:25:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538973.839453; Wed, 24 May 2023 11:25:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1mcn-0007rU-V9; Wed, 24 May 2023 11:25:49 +0000
Received: by outflank-mailman (input) for mailman id 538973;
 Wed, 24 May 2023 11:25:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KTJK=BN=citrix.com=prvs=501cbbf32=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q1mcm-0006nQ-27
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 11:25:48 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba7e82f3-fa25-11ed-b22f-6b7b168915f2;
 Wed, 24 May 2023 13:25:47 +0200 (CEST)
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
X-Inumbo-ID: ba7e82f3-fa25-11ed-b22f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684927546;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ymf2v6YYBhgCHFBQwmR/FNFi4YTX/UtOqLN2xBmhJsQ=;
  b=DZ2hHTbtZLsr0BM8nrRGf2J0kuf3Dn8l9ZibpfQnJypazH26JrYX5OWF
   0AYwF7NQTANWKPVAkdU8H+13fDpIHeU8E8r4Ugbrol3X15QhE96KkO16h
   lIP6RQI06GslSss/F4fVtMl+jS+7+wOFO+jnG2qHQMUI9g+wT+w3uQrM4
   Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 112680540
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:2F2mwq+mIgexGFTb1OHrDrUDiH6TJUtcMsCJ2f8bNWPcYEJGY0x3y
 GUZXGzSMv+CZ2fyet9/PoXn8RsHvcWDzddrSVdr+Sw8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks31BjOkGlA5AdmOKoX5AS2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklyx
 /4yOGlcTCunxO3p4eyDWsh9puE8eZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGOkcUUrsUIMtWcOOAr3/zaTBH7nmSorI6+TP7xw1tyrn9dtHSf7RmQO0MxxzG9
 jqbozyR7hcyC8yS6CCK4FGQrOrij36iSJs+SrSaz6s/6LGU7jNKU0BHPbehmtGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0c/h6HvA+6QqN4rHJ+AvfDW8BJhZebPQ2uclwQiYlv
 mJlhPuwW2Yp6ufMDyvAqPHN92ja1TUpwXEqWR0GZxtcsvvYhMI80TORdsZCAY6QkYigcd3v+
 AyioC87jrQVqMcE0aSn4FzK6w6RSoj1oh0dvVuOAD/8hu9tTMv8PtHztwCHhRpVBNzBJmRtq
 kTojCR3AAomKZiW3BKAT+wWdF1Cz6bUaWaM6bKD8nRIythMx5JBVdoIiN2dDB0zWirhRdMOS
 BG7hO+pzMUPVEZGlIcuC25LN+wkzLL7CfPuXe3OY9xFb/BZLVHXoHEwOx7MhD68yiDAdJ3T3
 r/CK66R4YsyU/w7nFJauc9GuVPU+szO7TyKHs2qp/hW+bGfeGSUWd84Dbd6VchgtPnsiFyMo
 75i2z6il003vBvWPnOGrub+7DkicRAGOHwBg5MKL7Hae1Y3RwnMyZb5mNscRmCspIwN/s+gw
 513chUwJIbX7ZEfFTi3Vw==
IronPort-HdrOrdr: A9a23:kXOuIqPWxvCkt8BcTgWjsMiBIKoaSvp037BK7S1MoH1uA6mlfq
 WV9sjzuiWatN98Yh8dcLO7Scu9qBHnlaKdiLN5VduftWHd01dAR7sSjrcKrQeAJ8X/nNQtr5
 uJccJFeaDN5Y4Rt7eH3OG6eexQv+Vu6MqT9IPjJ+8Gd3ATV0lnhT0JbTqzIwlNayRtI4E2L5
 aY7tovnUvaRZxGBv7LYEXsRoL41qT2qK4=
X-Talos-CUID: 9a23:z8Q0ymFc1Cys3Z/HqmJbxkw+Cpl0UEb5j3iPAhGAGUd4aJiKHAo=
X-Talos-MUID: 9a23:0wJCMAldoRAdPG/QOsZ5dnpdJMpJ+au8K3wnlLgU5pCULAAuMhWk2WE=
X-IronPort-AV: E=Sophos;i="6.00,189,1681185600"; 
   d="scan'208";a="112680540"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 06/10] x86/boot: Expose MSR_ARCH_CAPS data in guest max policies
Date: Wed, 24 May 2023 12:25:22 +0100
Message-ID: <20230524112526.3475200-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230524112526.3475200-1-andrew.cooper3@citrix.com>
References: <20230524112526.3475200-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

We already have common and default feature adjustment helpers.  Introduce one
for max featuresets too.

Offer MSR_ARCH_CAPS unconditionally in the max policy, and stop clobbering the
data inherited from the Host policy.  This will be necessary to level a VM
safely for migration.  Annotate the ARCH_CAPS CPUID bit as special.  Note:
ARCH_CAPS is still max-only for now, so will not be inhereted by the default
policies.

With this done, the special case for dom0 can be shrunk to just resampling the
Host policy (as ARCH_CAPS isn't visible by default yet).

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2:
 * Annotate ARCH_CAPS as special.
---
 xen/arch/x86/cpu-policy.c                   | 42 ++++++++++++---------
 xen/include/public/arch-x86/cpufeatureset.h |  2 +-
 2 files changed, 25 insertions(+), 19 deletions(-)

diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index dfd9abd8564c..74266d30b551 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -408,6 +408,25 @@ static void __init calculate_host_policy(void)
     p->platform_info.cpuid_faulting = cpu_has_cpuid_faulting;
 }
 
+static void __init guest_common_max_feature_adjustments(uint32_t *fs)
+{
+    if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL )
+    {
+        /*
+         * MSR_ARCH_CAPS is just feature data, and we can offer it to guests
+         * unconditionally, although limit it to Intel systems as it is highly
+         * uarch-specific.
+         *
+         * In particular, the RSBA and RRSBA bits mean "you might migrate to a
+         * system where RSB underflow uses alternative predictors (a.k.a
+         * Retpoline not safe)", so these need to be visible to a guest in all
+         * cases, even when it's only some other server in the pool which
+         * suffers the identified behaviour.
+         */
+        __set_bit(X86_FEATURE_ARCH_CAPS, fs);
+    }
+}
+
 static void __init guest_common_default_feature_adjustments(uint32_t *fs)
 {
     /*
@@ -483,6 +502,7 @@ static void __init calculate_pv_max_policy(void)
         __clear_bit(X86_FEATURE_IBRS, fs);
     }
 
+    guest_common_max_feature_adjustments(fs);
     guest_common_feature_adjustments(fs);
 
     sanitise_featureset(fs);
@@ -490,8 +510,6 @@ static void __init calculate_pv_max_policy(void)
     recalculate_xstate(p);
 
     p->extd.raw[0xa] = EMPTY_LEAF; /* No SVM for PV guests. */
-
-    p->arch_caps.raw = 0; /* Not supported yet. */
 }
 
 static void __init calculate_pv_def_policy(void)
@@ -598,6 +616,7 @@ static void __init calculate_hvm_max_policy(void)
     if ( !cpu_has_vmx )
         __clear_bit(X86_FEATURE_PKS, fs);
 
+    guest_common_max_feature_adjustments(fs);
     guest_common_feature_adjustments(fs);
 
     sanitise_featureset(fs);
@@ -606,8 +625,6 @@ static void __init calculate_hvm_max_policy(void)
 
     /* It's always possible to emulate CPUID faulting for HVM guests */
     p->platform_info.cpuid_faulting = true;
-
-    p->arch_caps.raw = 0; /* Not supported yet. */
 }
 
 static void __init calculate_hvm_def_policy(void)
@@ -828,7 +845,10 @@ void __init init_dom0_cpuid_policy(struct domain *d)
      * domain policy logic gains a better understanding of MSRs.
      */
     if ( is_hardware_domain(d) && cpu_has_arch_caps )
+    {
         p->feat.arch_caps = true;
+        p->arch_caps.raw = host_cpu_policy.arch_caps.raw;
+    }
 
     /* Apply dom0-cpuid= command line settings, if provided. */
     if ( dom0_cpuid_cmdline )
@@ -858,20 +878,6 @@ void __init init_dom0_cpuid_policy(struct domain *d)
         p->platform_info.cpuid_faulting = false;
 
     recalculate_cpuid_policy(d);
-
-    if ( is_hardware_domain(d) && cpu_has_arch_caps )
-    {
-        uint64_t val;
-
-        rdmsrl(MSR_ARCH_CAPABILITIES, val);
-
-        p->arch_caps.raw = val &
-            (ARCH_CAPS_RDCL_NO | ARCH_CAPS_IBRS_ALL | ARCH_CAPS_RSBA |
-             ARCH_CAPS_SSB_NO | ARCH_CAPS_MDS_NO | ARCH_CAPS_IF_PSCHANGE_MC_NO |
-             ARCH_CAPS_TAA_NO | ARCH_CAPS_SBDR_SSDP_NO | ARCH_CAPS_FBSDP_NO |
-             ARCH_CAPS_PSDP_NO | ARCH_CAPS_FB_CLEAR | ARCH_CAPS_RRSBA |
-             ARCH_CAPS_BHI_NO | ARCH_CAPS_PBRSB_NO);
-    }
 }
 
 static void __init __maybe_unused build_assertions(void)
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index 033b1a72feea..777041425e0a 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -271,7 +271,7 @@ XEN_CPUFEATURE(AVX512_FP16,   9*32+23) /*   AVX512 FP16 instructions */
 XEN_CPUFEATURE(IBRSB,         9*32+26) /*A  IBRS and IBPB support (used by Intel) */
 XEN_CPUFEATURE(STIBP,         9*32+27) /*A  STIBP */
 XEN_CPUFEATURE(L1D_FLUSH,     9*32+28) /*S  MSR_FLUSH_CMD and L1D flush. */
-XEN_CPUFEATURE(ARCH_CAPS,     9*32+29) /*a  IA32_ARCH_CAPABILITIES MSR */
+XEN_CPUFEATURE(ARCH_CAPS,     9*32+29) /*!a IA32_ARCH_CAPABILITIES MSR */
 XEN_CPUFEATURE(CORE_CAPS,     9*32+30) /*   IA32_CORE_CAPABILITIES MSR */
 XEN_CPUFEATURE(SSBD,          9*32+31) /*A  MSR_SPEC_CTRL.SSBD available */
 
-- 
2.30.2


