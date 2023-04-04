Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A646D5C5F
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 11:52:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517710.803460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjdLH-0005FQ-SK; Tue, 04 Apr 2023 09:52:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517710.803460; Tue, 04 Apr 2023 09:52:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjdLH-00058c-NI; Tue, 04 Apr 2023 09:52:43 +0000
Received: by outflank-mailman (input) for mailman id 517710;
 Tue, 04 Apr 2023 09:52:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Oy2y=73=citrix.com=prvs=4518c43dc=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pjdLG-00056d-Dy
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 09:52:42 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e4dedd2-d2ce-11ed-b464-930f4c7d94ae;
 Tue, 04 Apr 2023 11:52:38 +0200 (CEST)
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
X-Inumbo-ID: 6e4dedd2-d2ce-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680601958;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=26klonSMws4SwwrhUJvMYhga9nBaQ/a3jGXfpoulioI=;
  b=d/YAm3j1rzvxGBlaOJyg/vwXopWL36Ba0QNi1HIbUXHH7iL0mrvYZLpp
   +TAzt9ErqBxZXnoG1sgg2q92GP7hsgLNiGzKKLJD1L0PZUuEcfNbC+01e
   7jFMCfdD5uS76SeyBKeA0i5pHqvJdwOfpuo+H4sH2ADdHOmzOl6963T/X
   s=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 104161361
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:vNzrr606nWyAYg4k/PbD5axxkn2cJEfYwER7XKvMYLTBsI5bp2NVz
 TQcCm2OO/3YZWqje9AkPNjipBkG7JbQzddrG1RspC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+HuDgNyo4GlD5gBmOagS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfJ3Fny
 f0oBxQ0bjOSmcmMx6jqd+triZF2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKk2aOHWjOX9OYH46tM6uimPybHtzr1WNqLBsy2PS0BZwwP7mN9+9ltmiHJ0JxxjB/
 Tyfl4j/KgoIEd+55DeYy0qLtP3VwmDXSbsNE4Tto5aGh3XMnzdOWXX6T2CTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1jY+cddNF+wx6CmW17HZpQ2eAwAsUTppeNEg8sgsSlQXO
 kShxo2zQ2Y16fvMFCzbr+3Pxd+vBcQLBUkSTBMFfSQh2tnAsZ8YtBXVH+thF6Hg27UZBgrML
 yC2QDkW3utD1ZNUif/kpDgrkBr3+MGXE1ddChH/Gzv8s1gnPNPNi5mAswCz0BpWEGqOorBtV
 lAgktPW0u0BBIrleMelELRUR+HBCxpo3VThbb9T83oJrW7FF4aLJ9w43d2HDB4B3jw4UTHoe
 lTPngha+YVeOnCnBYcuPdLpVph0nPK7T4q1PhwxUjapSsEpHDJrAQk0PRLAt4wTuBNEfV4D1
 WezLp/3UCdy5VVPxzuqXeYNuYIWKtQF7TqLH/jTlk33uYdykVbJEd/pxnPSNLFmhE5FyS2Jm
 +ti2zyikEoADLenPnaOoeb+7zkidBAGOHw/kOQPHsbrH+asMDhJ5yP5qV/5R7FYog==
IronPort-HdrOrdr: A9a23:9DL2QqBOw0rCwfjlHelo55DYdb4zR+YMi2TDt3oddfU1SL38qy
 nKpp4mPHDP5wr5NEtPpTniAtjjfZq/z/5ICOAqVN/PYOCPggCVxepZnOjfKlPbehEX9oRmpN
 1dm6oVMqyMMbCt5/yKnDVRELwbsaa6GLjDv5a785/0JzsaE52J6W1Ce2GmO3wzfiZqL7wjGq
 GR48JWzgDQAkj+PqyAdx84t/GonayzqK7b
X-IronPort-AV: E=Sophos;i="5.98,317,1673931600"; 
   d="scan'208";a="104161361"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 09/15] x86: Out-of-inline the policy<->featureset convertors
Date: Tue, 4 Apr 2023 10:52:16 +0100
Message-ID: <20230404095222.1373721-10-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230404095222.1373721-1-andrew.cooper3@citrix.com>
References: <20230404095222.1373721-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

These are already getting over-large for being inline functions, and are only
going to grow more over time.  Out of line them, yielding the following net
delta from bloat-o-meter:

  add/remove: 2/0 grow/shrink: 0/4 up/down: 276/-1877 (-1601)

Switch to the newer cpu_policy terminology while doing so.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2:
 * New
---
 tools/libs/guest/xg_cpuid_x86.c      |  2 +-
 xen/arch/x86/cpuid.c                 | 28 +++++++--------
 xen/arch/x86/sysctl.c                |  2 +-
 xen/include/xen/lib/x86/cpu-policy.h | 52 ++++++----------------------
 xen/lib/x86/cpuid.c                  | 42 ++++++++++++++++++++++
 5 files changed, 68 insertions(+), 58 deletions(-)

diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 259029be8b36..33d366a8eb43 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -565,7 +565,7 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
             }
         }
 
-        cpuid_featureset_to_policy(feat, p);
+        x86_cpu_featureset_to_policy(feat, p);
     }
     else
     {
diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index df3e503ced9d..5eb5f1893516 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -368,7 +368,7 @@ static void __init calculate_host_policy(void)
     p->extd.max_leaf = 0x80000000 | min_t(uint32_t, max_extd_leaf & 0xffff,
                                           ARRAY_SIZE(p->extd.raw) - 1);
 
-    cpuid_featureset_to_policy(boot_cpu_data.x86_capability, p);
+    x86_cpu_featureset_to_policy(boot_cpu_data.x86_capability, p);
     recalculate_xstate(p);
     recalculate_misc(p);
 
@@ -450,7 +450,7 @@ static void __init calculate_pv_max_policy(void)
     unsigned int i;
 
     *p = host_cpu_policy;
-    cpuid_policy_to_featureset(p, pv_featureset);
+    x86_cpu_policy_to_featureset(p, pv_featureset);
 
     for ( i = 0; i < ARRAY_SIZE(pv_featureset); ++i )
         pv_featureset[i] &= pv_max_featuremask[i];
@@ -468,7 +468,7 @@ static void __init calculate_pv_max_policy(void)
     guest_common_feature_adjustments(pv_featureset);
 
     sanitise_featureset(pv_featureset);
-    cpuid_featureset_to_policy(pv_featureset, p);
+    x86_cpu_featureset_to_policy(pv_featureset, p);
     recalculate_xstate(p);
 
     p->extd.raw[0xa] = EMPTY_LEAF; /* No SVM for PV guests. */
@@ -481,7 +481,7 @@ static void __init calculate_pv_def_policy(void)
     unsigned int i;
 
     *p = pv_max_cpu_policy;
-    cpuid_policy_to_featureset(p, pv_featureset);
+    x86_cpu_policy_to_featureset(p, pv_featureset);
 
     for ( i = 0; i < ARRAY_SIZE(pv_featureset); ++i )
         pv_featureset[i] &= pv_def_featuremask[i];
@@ -490,7 +490,7 @@ static void __init calculate_pv_def_policy(void)
     guest_common_default_feature_adjustments(pv_featureset);
 
     sanitise_featureset(pv_featureset);
-    cpuid_featureset_to_policy(pv_featureset, p);
+    x86_cpu_featureset_to_policy(pv_featureset, p);
     recalculate_xstate(p);
 }
 
@@ -502,7 +502,7 @@ static void __init calculate_hvm_max_policy(void)
     const uint32_t *hvm_featuremask;
 
     *p = host_cpu_policy;
-    cpuid_policy_to_featureset(p, hvm_featureset);
+    x86_cpu_policy_to_featureset(p, hvm_featureset);
 
     hvm_featuremask = hvm_hap_supported() ?
         hvm_hap_max_featuremask : hvm_shadow_max_featuremask;
@@ -581,7 +581,7 @@ static void __init calculate_hvm_max_policy(void)
     guest_common_feature_adjustments(hvm_featureset);
 
     sanitise_featureset(hvm_featureset);
-    cpuid_featureset_to_policy(hvm_featureset, p);
+    x86_cpu_featureset_to_policy(hvm_featureset, p);
     recalculate_xstate(p);
 }
 
@@ -593,7 +593,7 @@ static void __init calculate_hvm_def_policy(void)
     const uint32_t *hvm_featuremask;
 
     *p = hvm_max_cpu_policy;
-    cpuid_policy_to_featureset(p, hvm_featureset);
+    x86_cpu_policy_to_featureset(p, hvm_featureset);
 
     hvm_featuremask = hvm_hap_supported() ?
         hvm_hap_def_featuremask : hvm_shadow_def_featuremask;
@@ -612,7 +612,7 @@ static void __init calculate_hvm_def_policy(void)
         __set_bit(X86_FEATURE_VIRT_SSBD, hvm_featureset);
 
     sanitise_featureset(hvm_featureset);
-    cpuid_featureset_to_policy(hvm_featureset, p);
+    x86_cpu_featureset_to_policy(hvm_featureset, p);
     recalculate_xstate(p);
 }
 
@@ -682,8 +682,8 @@ void recalculate_cpuid_policy(struct domain *d)
                                             ? CPUID_GUEST_NR_EXTD_AMD
                                             : CPUID_GUEST_NR_EXTD_INTEL) - 1);
 
-    cpuid_policy_to_featureset(p, fs);
-    cpuid_policy_to_featureset(max, max_fs);
+    x86_cpu_policy_to_featureset(p, fs);
+    x86_cpu_policy_to_featureset(max, max_fs);
 
     if ( is_hvm_domain(d) )
     {
@@ -740,7 +740,7 @@ void recalculate_cpuid_policy(struct domain *d)
                            (cpufeat_mask(X86_FEATURE_FDP_EXCP_ONLY) |
                             cpufeat_mask(X86_FEATURE_NO_FPU_SEL)));
 
-    cpuid_featureset_to_policy(fs, p);
+    x86_cpu_featureset_to_policy(fs, p);
 
     /* Pass host cacheline size through to guests. */
     p->basic.clflush_size = max->basic.clflush_size;
@@ -806,7 +806,7 @@ void __init init_dom0_cpuid_policy(struct domain *d)
         uint32_t fs[FSCAPINTS];
         unsigned int i;
 
-        cpuid_policy_to_featureset(p, fs);
+        x86_cpu_policy_to_featureset(p, fs);
 
         for ( i = 0; i < ARRAY_SIZE(fs); ++i )
         {
@@ -814,7 +814,7 @@ void __init init_dom0_cpuid_policy(struct domain *d)
             fs[i] &= ~dom0_disable_feat[i];
         }
 
-        cpuid_featureset_to_policy(fs, p);
+        x86_cpu_featureset_to_policy(fs, p);
 
         recalculate_cpuid_policy(d);
     }
diff --git a/xen/arch/x86/sysctl.c b/xen/arch/x86/sysctl.c
index 43a241f2090f..c107f40c6283 100644
--- a/xen/arch/x86/sysctl.c
+++ b/xen/arch/x86/sysctl.c
@@ -338,7 +338,7 @@ long arch_do_sysctl(
             ret = -EINVAL;
 
         if ( !ret )
-            cpuid_policy_to_featureset(p, featureset);
+            x86_cpu_policy_to_featureset(p, featureset);
 
         /* Copy the requested featureset into place. */
         if ( !ret && copy_to_guest(sysctl->u.cpu_featureset.features,
diff --git a/xen/include/xen/lib/x86/cpu-policy.h b/xen/include/xen/lib/x86/cpu-policy.h
index 8b27a0725b8e..57b4633c861e 100644
--- a/xen/include/xen/lib/x86/cpu-policy.h
+++ b/xen/include/xen/lib/x86/cpu-policy.h
@@ -387,49 +387,17 @@ struct cpu_policy_errors
 
 #define INIT_CPU_POLICY_ERRORS { -1, -1, -1 }
 
-/* Fill in a featureset bitmap from a CPUID policy. */
-static inline void cpuid_policy_to_featureset(
-    const struct cpuid_policy *p, uint32_t fs[FEATURESET_NR_ENTRIES])
-{
-    fs[FEATURESET_1d]  = p->basic._1d;
-    fs[FEATURESET_1c]  = p->basic._1c;
-    fs[FEATURESET_e1d] = p->extd.e1d;
-    fs[FEATURESET_e1c] = p->extd.e1c;
-    fs[FEATURESET_Da1] = p->xstate.Da1;
-    fs[FEATURESET_7b0] = p->feat._7b0;
-    fs[FEATURESET_7c0] = p->feat._7c0;
-    fs[FEATURESET_e7d] = p->extd.e7d;
-    fs[FEATURESET_e8b] = p->extd.e8b;
-    fs[FEATURESET_7d0] = p->feat._7d0;
-    fs[FEATURESET_7a1] = p->feat._7a1;
-    fs[FEATURESET_e21a] = p->extd.e21a;
-    fs[FEATURESET_7b1] = p->feat._7b1;
-    fs[FEATURESET_7d2] = p->feat._7d2;
-    fs[FEATURESET_7c1] = p->feat._7c1;
-    fs[FEATURESET_7d1] = p->feat._7d1;
-}
+/**
+ * Copy the featureset words out of a cpu_policy object.
+ */
+void x86_cpu_policy_to_featureset(const struct cpu_policy *p,
+                                  uint32_t fs[FEATURESET_NR_ENTRIES]);
 
-/* Fill in a CPUID policy from a featureset bitmap. */
-static inline void cpuid_featureset_to_policy(
-    const uint32_t fs[FEATURESET_NR_ENTRIES], struct cpuid_policy *p)
-{
-    p->basic._1d  = fs[FEATURESET_1d];
-    p->basic._1c  = fs[FEATURESET_1c];
-    p->extd.e1d   = fs[FEATURESET_e1d];
-    p->extd.e1c   = fs[FEATURESET_e1c];
-    p->xstate.Da1 = fs[FEATURESET_Da1];
-    p->feat._7b0  = fs[FEATURESET_7b0];
-    p->feat._7c0  = fs[FEATURESET_7c0];
-    p->extd.e7d   = fs[FEATURESET_e7d];
-    p->extd.e8b   = fs[FEATURESET_e8b];
-    p->feat._7d0  = fs[FEATURESET_7d0];
-    p->feat._7a1  = fs[FEATURESET_7a1];
-    p->extd.e21a  = fs[FEATURESET_e21a];
-    p->feat._7b1  = fs[FEATURESET_7b1];
-    p->feat._7d2  = fs[FEATURESET_7d2];
-    p->feat._7c1  = fs[FEATURESET_7c1];
-    p->feat._7d1  = fs[FEATURESET_7d1];
-}
+/**
+ * Copy the featureset words back into a cpu_policy object.
+ */
+void x86_cpu_featureset_to_policy(const uint32_t fs[FEATURESET_NR_ENTRIES],
+                                  struct cpu_policy *p);
 
 static inline uint64_t cpuid_policy_xcr0_max(const struct cpuid_policy *p)
 {
diff --git a/xen/lib/x86/cpuid.c b/xen/lib/x86/cpuid.c
index e81f76c779c0..734e90823a63 100644
--- a/xen/lib/x86/cpuid.c
+++ b/xen/lib/x86/cpuid.c
@@ -60,6 +60,48 @@ const char *x86_cpuid_vendor_to_str(unsigned int vendor)
     }
 }
 
+void x86_cpu_policy_to_featureset(
+    const struct cpu_policy *p, uint32_t fs[FEATURESET_NR_ENTRIES])
+{
+    fs[FEATURESET_1d]        = p->basic._1d;
+    fs[FEATURESET_1c]        = p->basic._1c;
+    fs[FEATURESET_e1d]       = p->extd.e1d;
+    fs[FEATURESET_e1c]       = p->extd.e1c;
+    fs[FEATURESET_Da1]       = p->xstate.Da1;
+    fs[FEATURESET_7b0]       = p->feat._7b0;
+    fs[FEATURESET_7c0]       = p->feat._7c0;
+    fs[FEATURESET_e7d]       = p->extd.e7d;
+    fs[FEATURESET_e8b]       = p->extd.e8b;
+    fs[FEATURESET_7d0]       = p->feat._7d0;
+    fs[FEATURESET_7a1]       = p->feat._7a1;
+    fs[FEATURESET_e21a]      = p->extd.e21a;
+    fs[FEATURESET_7b1]       = p->feat._7b1;
+    fs[FEATURESET_7d2]       = p->feat._7d2;
+    fs[FEATURESET_7c1]       = p->feat._7c1;
+    fs[FEATURESET_7d1]       = p->feat._7d1;
+}
+
+void x86_cpu_featureset_to_policy(
+    const uint32_t fs[FEATURESET_NR_ENTRIES], struct cpu_policy *p)
+{
+    p->basic._1d             = fs[FEATURESET_1d];
+    p->basic._1c             = fs[FEATURESET_1c];
+    p->extd.e1d              = fs[FEATURESET_e1d];
+    p->extd.e1c              = fs[FEATURESET_e1c];
+    p->xstate.Da1            = fs[FEATURESET_Da1];
+    p->feat._7b0             = fs[FEATURESET_7b0];
+    p->feat._7c0             = fs[FEATURESET_7c0];
+    p->extd.e7d              = fs[FEATURESET_e7d];
+    p->extd.e8b              = fs[FEATURESET_e8b];
+    p->feat._7d0             = fs[FEATURESET_7d0];
+    p->feat._7a1             = fs[FEATURESET_7a1];
+    p->extd.e21a             = fs[FEATURESET_e21a];
+    p->feat._7b1             = fs[FEATURESET_7b1];
+    p->feat._7d2             = fs[FEATURESET_7d2];
+    p->feat._7c1             = fs[FEATURESET_7c1];
+    p->feat._7d1             = fs[FEATURESET_7d1];
+}
+
 void x86_cpuid_policy_recalc_synth(struct cpuid_policy *p)
 {
     p->x86_vendor = x86_cpuid_lookup_vendor(
-- 
2.30.2


