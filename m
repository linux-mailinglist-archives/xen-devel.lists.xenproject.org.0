Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C323270514E
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 16:54:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535264.832967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyw3n-00072v-VJ; Tue, 16 May 2023 14:53:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535264.832967; Tue, 16 May 2023 14:53:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyw3n-000709-S7; Tue, 16 May 2023 14:53:55 +0000
Received: by outflank-mailman (input) for mailman id 535264;
 Tue, 16 May 2023 14:53:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7WEk=BF=citrix.com=prvs=493b78b38=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pyw3m-00067V-3y
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 14:53:54 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 77c9e0d8-f3f9-11ed-8611-37d641c3527e;
 Tue, 16 May 2023 16:53:51 +0200 (CEST)
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
X-Inumbo-ID: 77c9e0d8-f3f9-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684248831;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GMlRcLDKg4s3arvBRJ23Or4PyYQ1A2vHuJYymPBgPdQ=;
  b=g5d17d/MDvxEdSn4VBia7e5xijAqo6pfM8Qztt3gQzSUG5ejSOie1jHV
   z2m33jhDv4f30j0JWu98Y7iwkFb+jTH7nH2I8yLQyLCsMxE27GVexr273
   JE121N8rHXAWQpGxsq+Si64I9MVLalZ59RVhJSdlmHUQ+1zdTKXblS3/R
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 111689025
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:Gf2vtK5WG0SBXkUkBV+1PQxRtDHHchMFZxGqfqrLsTDasY5as4F+v
 mBJCGzXaaqOMTCnL4siYdjlpkoHup/cmNVnQARlqSk9Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+7ZwehBtC5gZlPa0S4geE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m/
 /VEMj8jTxm/g92v6qLhY8Nuj/4eFZy+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJUQVYT/7C7pn9AusrlD5fydVtxS+oq0v7nKI5AdwzKLsIJzefdniqcB9xx/B+
 DKXpz6kav0cHI2VkCrCwnDxv8/CoifYAaIZE7rn6fE/1TV/wURMUUZLBDNXu8KRlUqWS99Zb
 UsO9UIGvaU0sUCmUNT5dxm5u2Kf+A4RXcJKFO834x3LzbDbiy67LGUZSj9KaPQ9qdQ7Azct0
 ze0c8jBXGI19ufPEDTEq+nS9GnpUcQIEYMcTSUNEREKzfjqnIUMlzjfFP9JEqePs+SgTFkc3
 Au2hCQ5grwSi+sC2KO64U3LjlqQm3TZcuImzl6JBzz4t2uVcKbgPtX1sgaDsZ6sOa7DFjG8U
 G44d99yBQzkJbWEj2SzTeoEB9lFDN7VYWSH0TaD83TMnglBGkJPn6gKuFmSx28zaK7onAMFh
 2eN0T69HLcJYBOXgVZfOupd8fgCw6n6DsjCXfvJdNdIaZUZXFbZrH03OhPOjjmxzxJEfUQD1
 XCzIK6R4YsyU/w7nFJauc9HuVPU+szO7TyKHs2qp/hW+bGfeGSUWd84Dbd6VchgtPnsiFyMo
 75i2z6il003vBvWPnOGrub+7DkicRAGOHwBg5IHKbPTflU/QwnMyZb5mNscRmCspIwN/s+gw
 513chUwJIbX7ZEfFTi3Vw==
IronPort-HdrOrdr: A9a23:0aSzw6CKhgtfj0blHeiksseALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPEfP+VAssQIb6Km90ci7MDrhHPtOjbX5Uo3SODUO1FHIEGgA1/qr/9SDIVyYygc178
 4JHMZD4bbLfDtHZLPBkWyF+qEbsbu6Gc6T5dv2/jNId0VHeqtg5wB2BkKyFVB3fhBPAd4UBY
 eR/c1OohunYDAyYt6gDncIcuDfr5mT/aiWKyIuNloC0k2jnDmo4Ln1H1yx2QofaSpGxfMP4H
 XIiAvw44SkqrWexgXH32HewpxKkJ/Ky8dFBuaLls8JQw+cwTqAVcBEYfmvrTo1qOag5BIBi9
 /XuSotOMx19jf4Yny1iQGF4Xit7B8er1vZjXOIi3rqpsL0ABggDdBauI5fehzFr2I9odBH1r
 5R1W7xjesZMfqAplWy2zH7bWArqqOGmwtgrQfVtQ0cbWIqUs4RkWXYxjIRLH5PJlO/1GltKp
 gXMCiV3ocsTbrdVQGVgoAn+q3QYpw+cy32OHQqq4ib1SNbk2t+yFZdzMsDnm0Y/JZ4UJVc4f
 /YW54Y4I2mY/VmH56VPt1xNPefGyjIW1bBIWiSKVPoGOUOPG/MsYf+5PEw6PuxcJIFwZMukN
 CZOWkow1IaagbrE4mDzZdL+hfCTCG0Wins0NhX49x8tqfnTLTmPCWfQBQlktemof8YHsrHMs
 zDT65+ErvmNy/jCIxJ1wrxV91bLmQfStQcvpIhV1eHsqvwW/7XXyzgAYbuzZbWYEgZsznEcw
 c+tRDIVbp9x1HuXGPkix7MXH6oclDj/PtLYdnnw9Q=
X-Talos-CUID: =?us-ascii?q?9a23=3Aje1LP2nciwB3gSQFdYCAlOOoDY/XOXfUkG3fDW6?=
 =?us-ascii?q?xNWJWUZeFE3a6+qpervM7zg=3D=3D?=
X-Talos-MUID: 9a23:3Iz8Ogr1Q3nKBlX8FPIez2Bobdcv06bzMWAArpEl4umPMisvJDjI2Q==
X-IronPort-AV: E=Sophos;i="5.99,278,1677560400"; 
   d="scan'208";a="111689025"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 4/4] x86/spec-ctrl: Remove opencoded MSR_ARCH_CAPS check
Date: Tue, 16 May 2023 15:53:34 +0100
Message-ID: <20230516145334.1271347-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230516145334.1271347-1-andrew.cooper3@citrix.com>
References: <20230516145334.1271347-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

MSR_ARCH_CAPS data is now included in featureset information.  Replace
opencoded checks with regular feature ones.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/include/asm/cpufeature.h |  7 ++++
 xen/arch/x86/spec_ctrl.c              | 56 +++++++++++++--------------
 2 files changed, 33 insertions(+), 30 deletions(-)

diff --git a/xen/arch/x86/include/asm/cpufeature.h b/xen/arch/x86/include/asm/cpufeature.h
index deca5bfc2629..00a43123ac82 100644
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -184,8 +184,15 @@ static inline bool boot_cpu_has(unsigned int feat)
 #define cpu_has_avx_ne_convert  boot_cpu_has(X86_FEATURE_AVX_NE_CONVERT)
 
 /* MSR_ARCH_CAPS 10A */
+#define cpu_has_rdcl_no         boot_cpu_has(X86_FEATURE_RDCL_NO)
+#define cpu_has_eibrs           boot_cpu_has(X86_FEATURE_EIBRS)
+#define cpu_has_rsba            boot_cpu_has(X86_FEATURE_RSBA)
+#define cpu_has_skip_l1dfl      boot_cpu_has(X86_FEATURE_SKIP_L1DFL)
+#define cpu_has_mds_no          boot_cpu_has(X86_FEATURE_MDS_NO)
 #define cpu_has_if_pschange_mc_no boot_cpu_has(X86_FEATURE_IF_PSCHANGE_MC_NO)
 #define cpu_has_tsx_ctrl        boot_cpu_has(X86_FEATURE_TSX_CTRL)
+#define cpu_has_taa_no          boot_cpu_has(X86_FEATURE_TAA_NO)
+#define cpu_has_fb_clear        boot_cpu_has(X86_FEATURE_FB_CLEAR)
 
 /* Synthesized. */
 #define cpu_has_arch_perfmon    boot_cpu_has(X86_FEATURE_ARCH_PERFMON)
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index f81db2143328..50d467f74cf8 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -282,12 +282,10 @@ custom_param("spec-ctrl", parse_spec_ctrl);
 int8_t __read_mostly opt_xpti_hwdom = -1;
 int8_t __read_mostly opt_xpti_domu = -1;
 
-static __init void xpti_init_default(uint64_t caps)
+static __init void xpti_init_default(void)
 {
-    if ( boot_cpu_data.x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON) )
-        caps = ARCH_CAPS_RDCL_NO;
-
-    if ( caps & ARCH_CAPS_RDCL_NO )
+    if ( (boot_cpu_data.x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) ||
+         cpu_has_rdcl_no )
     {
         if ( opt_xpti_hwdom < 0 )
             opt_xpti_hwdom = 0;
@@ -390,9 +388,10 @@ static int __init cf_check parse_pv_l1tf(const char *s)
 }
 custom_param("pv-l1tf", parse_pv_l1tf);
 
-static void __init print_details(enum ind_thunk thunk, uint64_t caps)
+static void __init print_details(enum ind_thunk thunk)
 {
     unsigned int _7d0 = 0, _7d2 = 0, e8b = 0, max = 0, tmp;
+    uint64_t caps = 0;
 
     /* Collect diagnostics about available mitigations. */
     if ( boot_cpu_data.cpuid_level >= 7 )
@@ -401,6 +400,8 @@ static void __init print_details(enum ind_thunk thunk, uint64_t caps)
         cpuid_count(7, 2, &tmp, &tmp, &tmp, &_7d2);
     if ( boot_cpu_data.extended_cpuid_level >= 0x80000008 )
         cpuid(0x80000008, &tmp, &e8b, &tmp, &tmp);
+    if ( cpu_has_arch_caps )
+        rdmsrl(MSR_ARCH_CAPABILITIES, caps);
 
     printk("Speculative mitigation facilities:\n");
 
@@ -578,7 +579,7 @@ static bool __init check_smt_enabled(void)
 }
 
 /* Calculate whether Retpoline is known-safe on this CPU. */
-static bool __init retpoline_safe(uint64_t caps)
+static bool __init retpoline_safe(void)
 {
     unsigned int ucode_rev = this_cpu(cpu_sig).rev;
 
@@ -596,7 +597,7 @@ static bool __init retpoline_safe(uint64_t caps)
      * Processors offering Enhanced IBRS are not guarenteed to be
      * repoline-safe.
      */
-    if ( caps & (ARCH_CAPS_RSBA | ARCH_CAPS_IBRS_ALL) )
+    if ( cpu_has_rsba || cpu_has_eibrs )
         return false;
 
     switch ( boot_cpu_data.x86_model )
@@ -845,7 +846,7 @@ static void __init ibpb_calculations(void)
 }
 
 /* Calculate whether this CPU is vulnerable to L1TF. */
-static __init void l1tf_calculations(uint64_t caps)
+static __init void l1tf_calculations(void)
 {
     bool hit_default = false;
 
@@ -933,7 +934,7 @@ static __init void l1tf_calculations(uint64_t caps)
     }
 
     /* Any processor advertising RDCL_NO should be not vulnerable to L1TF. */
-    if ( caps & ARCH_CAPS_RDCL_NO )
+    if ( cpu_has_rdcl_no )
         cpu_has_bug_l1tf = false;
 
     if ( cpu_has_bug_l1tf && hit_default )
@@ -992,7 +993,7 @@ static __init void l1tf_calculations(uint64_t caps)
 }
 
 /* Calculate whether this CPU is vulnerable to MDS. */
-static __init void mds_calculations(uint64_t caps)
+static __init void mds_calculations(void)
 {
     /* MDS is only known to affect Intel Family 6 processors at this time. */
     if ( boot_cpu_data.x86_vendor != X86_VENDOR_INTEL ||
@@ -1000,7 +1001,7 @@ static __init void mds_calculations(uint64_t caps)
         return;
 
     /* Any processor advertising MDS_NO should be not vulnerable to MDS. */
-    if ( caps & ARCH_CAPS_MDS_NO )
+    if ( cpu_has_mds_no )
         return;
 
     switch ( boot_cpu_data.x86_model )
@@ -1113,10 +1114,6 @@ void __init init_speculation_mitigations(void)
     enum ind_thunk thunk = THUNK_DEFAULT;
     bool has_spec_ctrl, ibrs = false, hw_smt_enabled;
     bool cpu_has_bug_taa;
-    uint64_t caps = 0;
-
-    if ( cpu_has_arch_caps )
-        rdmsrl(MSR_ARCH_CAPABILITIES, caps);
 
     hw_smt_enabled = check_smt_enabled();
 
@@ -1163,7 +1160,7 @@ void __init init_speculation_mitigations(void)
              * On all hardware, we'd like to use retpoline in preference to
              * IBRS, but only if it is safe on this hardware.
              */
-            if ( retpoline_safe(caps) )
+            if ( retpoline_safe() )
                 thunk = THUNK_RETPOLINE;
             else if ( has_spec_ctrl )
                 ibrs = true;
@@ -1392,13 +1389,13 @@ void __init init_speculation_mitigations(void)
      * threads.  Activate this if SMT is enabled, and Xen is using a non-zero
      * MSR_SPEC_CTRL setting.
      */
-    if ( boot_cpu_has(X86_FEATURE_IBRSB) && !(caps & ARCH_CAPS_IBRS_ALL) &&
+    if ( boot_cpu_has(X86_FEATURE_IBRSB) && !cpu_has_eibrs &&
          hw_smt_enabled && default_xen_spec_ctrl )
         setup_force_cpu_cap(X86_FEATURE_SC_MSR_IDLE);
 
-    xpti_init_default(caps);
+    xpti_init_default();
 
-    l1tf_calculations(caps);
+    l1tf_calculations();
 
     /*
      * By default, enable PV domU L1TF mitigations on all L1TF-vulnerable
@@ -1419,7 +1416,7 @@ void __init init_speculation_mitigations(void)
     if ( !boot_cpu_has(X86_FEATURE_L1D_FLUSH) )
         opt_l1d_flush = 0;
     else if ( opt_l1d_flush == -1 )
-        opt_l1d_flush = cpu_has_bug_l1tf && !(caps & ARCH_CAPS_SKIP_L1DFL);
+        opt_l1d_flush = cpu_has_bug_l1tf && !cpu_has_skip_l1dfl;
 
     /* We compile lfence's in by default, and nop them out if requested. */
     if ( !opt_branch_harden )
@@ -1442,7 +1439,7 @@ void __init init_speculation_mitigations(void)
             "enabled.  Please assess your configuration and choose an\n"
             "explicit 'smt=<bool>' setting.  See XSA-273.\n");
 
-    mds_calculations(caps);
+    mds_calculations();
 
     /*
      * Parts which enumerate FB_CLEAR are those which are post-MDS_NO and have
@@ -1454,7 +1451,7 @@ void __init init_speculation_mitigations(void)
      * the return-to-guest path.
      */
     if ( opt_unpriv_mmio )
-        opt_fb_clear_mmio = caps & ARCH_CAPS_FB_CLEAR;
+        opt_fb_clear_mmio = cpu_has_fb_clear;
 
     /*
      * By default, enable PV and HVM mitigations on MDS-vulnerable hardware.
@@ -1484,7 +1481,7 @@ void __init init_speculation_mitigations(void)
      */
     if ( opt_md_clear_pv || opt_md_clear_hvm || opt_fb_clear_mmio )
         setup_force_cpu_cap(X86_FEATURE_SC_VERW_IDLE);
-    opt_md_clear_hvm &= !(caps & ARCH_CAPS_SKIP_L1DFL) && !opt_l1d_flush;
+    opt_md_clear_hvm &= !cpu_has_skip_l1dfl && !opt_l1d_flush;
 
     /*
      * Warn the user if they are on MLPDS/MFBDS-vulnerable hardware with HT
@@ -1515,8 +1512,7 @@ void __init init_speculation_mitigations(void)
      *       we check both to spot TSX in a microcode/cmdline independent way.
      */
     cpu_has_bug_taa =
-        (cpu_has_rtm || (caps & ARCH_CAPS_TSX_CTRL)) &&
-        (caps & (ARCH_CAPS_MDS_NO | ARCH_CAPS_TAA_NO)) == ARCH_CAPS_MDS_NO;
+        (cpu_has_rtm || cpu_has_tsx_ctrl) && cpu_has_mds_no && !cpu_has_taa_no;
 
     /*
      * On TAA-affected hardware, disabling TSX is the preferred mitigation, vs
@@ -1535,7 +1531,7 @@ void __init init_speculation_mitigations(void)
      * plausibly value TSX higher than Hyperthreading...), disable TSX to
      * mitigate TAA.
      */
-    if ( opt_tsx == -1 && cpu_has_bug_taa && (caps & ARCH_CAPS_TSX_CTRL) &&
+    if ( opt_tsx == -1 && cpu_has_bug_taa && cpu_has_tsx_ctrl &&
          ((hw_smt_enabled && opt_smt) ||
           !boot_cpu_has(X86_FEATURE_SC_VERW_IDLE)) )
     {
@@ -1560,15 +1556,15 @@ void __init init_speculation_mitigations(void)
     if ( cpu_has_srbds_ctrl )
     {
         if ( opt_srb_lock == -1 && !opt_unpriv_mmio &&
-             (caps & (ARCH_CAPS_MDS_NO|ARCH_CAPS_TAA_NO)) == ARCH_CAPS_MDS_NO &&
-             (!cpu_has_hle || ((caps & ARCH_CAPS_TSX_CTRL) && rtm_disabled)) )
+             cpu_has_mds_no && !cpu_has_taa_no &&
+             (!cpu_has_hle || (cpu_has_tsx_ctrl && rtm_disabled)) )
             opt_srb_lock = 0;
 
         set_in_mcu_opt_ctrl(MCU_OPT_CTRL_RNGDS_MITG_DIS,
                             opt_srb_lock ? 0 : MCU_OPT_CTRL_RNGDS_MITG_DIS);
     }
 
-    print_details(thunk, caps);
+    print_details(thunk);
 
     /*
      * If MSR_SPEC_CTRL is available, apply Xen's default setting and discard
-- 
2.30.2


