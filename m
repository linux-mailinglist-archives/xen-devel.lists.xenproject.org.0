Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8FE6D5C89
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 11:59:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517772.803614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjdRn-0005De-KU; Tue, 04 Apr 2023 09:59:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517772.803614; Tue, 04 Apr 2023 09:59:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjdRn-000582-EH; Tue, 04 Apr 2023 09:59:27 +0000
Received: by outflank-mailman (input) for mailman id 517772;
 Tue, 04 Apr 2023 09:59:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Oy2y=73=citrix.com=prvs=4518c43dc=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pjdM5-0005bo-SB
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 09:53:34 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8dd3c787-d2ce-11ed-85db-49a42c6b2330;
 Tue, 04 Apr 2023 11:53:32 +0200 (CEST)
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
X-Inumbo-ID: 8dd3c787-d2ce-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680602012;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=S9rrbCEYs4IT9bqKPV/iJx2K9DkXe5RcZyCTKB2nQ9U=;
  b=OYDADpeDP5cEnFRW6GUiK3sGMYpY8eqSwL2Ynnejkj/FXDgApxclEytm
   slgEqR2VE/GZsSnLewg1GrazG8oitkZVgC++JrgWoc2OW8rb82hn+vaTb
   WsTsSRHvgd0DlV0iSeHuyMjBSFZOr+tHHR4GfzzfnkRkwCs99iGWT8EWr
   I=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 104656599
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:Fsg6SaOJIj2cUo7vrR3al8FynXyQoLVcMsEvi/4bfWQNrUolhT1Ty
 2JMX2yGbvjZNGX1edklbYq0pksH65LRndQ2GQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvLrRC9H5qyo42tE5gBmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0ut4C0Bc/
 qETEzkIdA6fuNir4by7cuY506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w2Nk+ojx5nYz/7DLoXmuuyi2a5WDpfsF+P/oI84nTJzRw327/oWDbQUoXSGZsIwBvJ9
 woq+UymDD0CCs2P1wamzWj1rOv0jSH7fpIdQejQGvlC3wTImz175ActfUu2p7y1h1CzX/pbK
 lcI4Ww+oK4q7kupQ9LhGRqirxasnDQRRt5RGO0S8xyWx+zf5APxLncAZi5MbpohrsBeeNAx/
 gbXxZWzX2Up6eDLDyvHrd94sA9eJwAYImUjdyRZRjAM5sP9vL4JkzPBTu5sRfvdYsLOJd3g/
 9ybhHFg1+1O0pBRiPzTEUPv2Gz1+MWQJuIhzkCOBz/+sFskDGKwT9bwgWU3+8qsO2pworOpm
 HEf0/aT4+kVZX1mvHzcGb5ddF1FChvsDdE9vbKMN8N7n9hV0yT/Fb28GRknTKuTDu4KeCXyf
 GjYsh5L6ZlYMROCNPEnO9/tVZVwlvK+RbwJs8w4ifIXOvBMmPKvpnkyNSZ8IUi2+KTTrU3PE
 cjCKpv9ZZrrIa9m0CC3V48g7FPf/QhnnTm7bcmin3yaPU+2OCb9pUEtbAHfMYjULcqs/G3oz
 jqoH5DVlEkFCbGhO3m/HEx6BQliEEXXzKve86R/HtNv6CI/cI39I5c9GY8cRrE=
IronPort-HdrOrdr: A9a23:ujXFI61ilrIcMTIDVr7uEwqjBHYkLtp133Aq2lEZdPU0SKGlfq
 GV7ZEmPHrP4gr5N0tOpTntAse9qBDnhPxICOsqXYtKNTOO0AeVxelZhrcKqAeQeBEWmNQ96U
 9hGZIOcuEZDzJB/LvHCN/TKadd/DGFmprY+ts31x1WPGVXgzkL1XYANu6ceHcGIzVuNN4CO7
 e3wNFInDakcWR/VLXBOpFUN9KzweEijfjdEGc7OyI=
X-IronPort-AV: E=Sophos;i="5.98,317,1673931600"; 
   d="scan'208";a="104656599"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 14/15] libx86: Update library API for cpu_policy
Date: Tue, 4 Apr 2023 10:52:21 +0100
Message-ID: <20230404095222.1373721-15-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230404095222.1373721-1-andrew.cooper3@citrix.com>
References: <20230404095222.1373721-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Adjust the API and comments appropriately.

x86_cpu_policy_fill_native() will eventually contain MSR reads, but leave a
TODO in the short term.

No practical change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2:
 * New
---
 tools/fuzz/cpu-policy/afl-policy-fuzzer.c |  4 +--
 tools/tests/cpu-policy/test-cpu-policy.c  |  4 +--
 tools/tests/x86_emulator/x86-emulate.c    |  2 +-
 xen/arch/x86/cpu-policy.c                 |  2 +-
 xen/arch/x86/domctl.c                     |  2 +-
 xen/arch/x86/xstate.c                     |  4 +--
 xen/include/xen/lib/x86/cpu-policy.h      | 42 ++++++++++++-----------
 xen/lib/x86/cpuid.c                       | 24 +++++++------
 xen/lib/x86/msr.c                         |  4 +--
 9 files changed, 46 insertions(+), 42 deletions(-)

diff --git a/tools/fuzz/cpu-policy/afl-policy-fuzzer.c b/tools/fuzz/cpu-policy/afl-policy-fuzzer.c
index 466bdbb1d91a..7d8467b4b258 100644
--- a/tools/fuzz/cpu-policy/afl-policy-fuzzer.c
+++ b/tools/fuzz/cpu-policy/afl-policy-fuzzer.c
@@ -48,8 +48,8 @@ static void check_policy(struct cpu_policy *cp)
      * Fix up the data in the source policy which isn't expected to survive
      * serialisation.
      */
-    x86_cpuid_policy_clear_out_of_range_leaves(cp);
-    x86_cpuid_policy_recalc_synth(cp);
+    x86_cpu_policy_clear_out_of_range_leaves(cp);
+    x86_cpu_policy_recalc_synth(cp);
 
     /* Serialise... */
     rc = x86_cpuid_copy_to_buffer(cp, leaves, &nr_leaves);
diff --git a/tools/tests/cpu-policy/test-cpu-policy.c b/tools/tests/cpu-policy/test-cpu-policy.c
index a4ca07f33973..f1d968adfc39 100644
--- a/tools/tests/cpu-policy/test-cpu-policy.c
+++ b/tools/tests/cpu-policy/test-cpu-policy.c
@@ -105,7 +105,7 @@ static void test_cpuid_current(void)
 
     printf("Testing CPUID on current CPU\n");
 
-    x86_cpuid_policy_fill_native(&p);
+    x86_cpu_policy_fill_native(&p);
 
     rc = x86_cpuid_copy_to_buffer(&p, leaves, &nr);
     if ( rc != 0 )
@@ -554,7 +554,7 @@ static void test_cpuid_out_of_range_clearing(void)
         void *ptr;
         unsigned int nr_markers;
 
-        x86_cpuid_policy_clear_out_of_range_leaves(p);
+        x86_cpu_policy_clear_out_of_range_leaves(p);
 
         /* Count the number of 0xc2's still remaining. */
         for ( ptr = p, nr_markers = 0;
diff --git a/tools/tests/x86_emulator/x86-emulate.c b/tools/tests/x86_emulator/x86-emulate.c
index 2692404df906..7d2d57f7591a 100644
--- a/tools/tests/x86_emulator/x86-emulate.c
+++ b/tools/tests/x86_emulator/x86-emulate.c
@@ -75,7 +75,7 @@ bool emul_test_init(void)
 
     unsigned long sp;
 
-    x86_cpuid_policy_fill_native(&cp);
+    x86_cpu_policy_fill_native(&cp);
 
     /*
      * The emulator doesn't use these instructions, so can always emulate
diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index 83186e940ca7..1140f0b365cd 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -347,7 +347,7 @@ static void __init calculate_raw_policy(void)
 {
     struct cpu_policy *p = &raw_cpu_policy;
 
-    x86_cpuid_policy_fill_native(p);
+    x86_cpu_policy_fill_native(p);
 
     /* Nothing good will come from Xen and libx86 disagreeing on vendor. */
     ASSERT(p->x86_vendor == boot_cpu_data.x86_vendor);
diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index c02528594102..1a8b4cff48ee 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -66,7 +66,7 @@ static int update_domain_cpu_policy(struct domain *d,
         goto out;
 
     /* Trim any newly-stale out-of-range leaves. */
-    x86_cpuid_policy_clear_out_of_range_leaves(new);
+    x86_cpu_policy_clear_out_of_range_leaves(new);
 
     /* Audit the combined dataset. */
     ret = x86_cpu_policies_are_compatible(sys, new, &err);
diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
index d481e1db3e7e..92496f379546 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -684,7 +684,7 @@ void xstate_init(struct cpuinfo_x86 *c)
 int validate_xstate(const struct domain *d, uint64_t xcr0, uint64_t xcr0_accum,
                     const struct xsave_hdr *hdr)
 {
-    uint64_t xcr0_max = cpuid_policy_xcr0_max(d->arch.cpuid);
+    uint64_t xcr0_max = cpu_policy_xcr0_max(d->arch.cpuid);
     unsigned int i;
 
     if ( (hdr->xstate_bv & ~xcr0_accum) ||
@@ -708,7 +708,7 @@ int validate_xstate(const struct domain *d, uint64_t xcr0, uint64_t xcr0_accum,
 int handle_xsetbv(u32 index, u64 new_bv)
 {
     struct vcpu *curr = current;
-    uint64_t xcr0_max = cpuid_policy_xcr0_max(curr->domain->arch.cpuid);
+    uint64_t xcr0_max = cpu_policy_xcr0_max(curr->domain->arch.cpuid);
     u64 mask;
 
     if ( index != XCR_XFEATURE_ENABLED_MASK )
diff --git a/xen/include/xen/lib/x86/cpu-policy.h b/xen/include/xen/lib/x86/cpu-policy.h
index 57b4633c861e..dee46adeff17 100644
--- a/xen/include/xen/lib/x86/cpu-policy.h
+++ b/xen/include/xen/lib/x86/cpu-policy.h
@@ -399,12 +399,12 @@ void x86_cpu_policy_to_featureset(const struct cpu_policy *p,
 void x86_cpu_featureset_to_policy(const uint32_t fs[FEATURESET_NR_ENTRIES],
                                   struct cpu_policy *p);
 
-static inline uint64_t cpuid_policy_xcr0_max(const struct cpuid_policy *p)
+static inline uint64_t cpu_policy_xcr0_max(const struct cpu_policy *p)
 {
     return ((uint64_t)p->xstate.xcr0_high << 32) | p->xstate.xcr0_low;
 }
 
-static inline uint64_t cpuid_policy_xstates(const struct cpuid_policy *p)
+static inline uint64_t cpu_policy_xstates(const struct cpu_policy *p)
 {
     uint64_t val = p->xstate.xcr0_high | p->xstate.xss_high;
 
@@ -414,18 +414,18 @@ static inline uint64_t cpuid_policy_xstates(const struct cpuid_policy *p)
 const uint32_t *x86_cpuid_lookup_deep_deps(uint32_t feature);
 
 /**
- * Recalculate the content in a CPUID policy which is derived from raw data.
+ * Recalculate the content in a CPU policy which is derived from raw data.
  */
-void x86_cpuid_policy_recalc_synth(struct cpuid_policy *p);
+void x86_cpu_policy_recalc_synth(struct cpu_policy *p);
 
 /**
- * Fill a CPUID policy using the native CPUID instruction.
+ * Fill CPU policy using the native CPUID/RDMSR instruction.
  *
  * No sanitisation is performed, but synthesised values are calculated.
  * Values may be influenced by a hypervisor or from masking/faulting
  * configuration.
  */
-void x86_cpuid_policy_fill_native(struct cpuid_policy *p);
+void x86_cpu_policy_fill_native(struct cpu_policy *p);
 
 /**
  * Clear leaf data beyond the policies max leaf/subleaf settings.
@@ -436,7 +436,7 @@ void x86_cpuid_policy_fill_native(struct cpuid_policy *p);
  * with out-of-range leaves with stale content in them.  This helper clears
  * them.
  */
-void x86_cpuid_policy_clear_out_of_range_leaves(struct cpuid_policy *p);
+void x86_cpu_policy_clear_out_of_range_leaves(struct cpu_policy *p);
 
 #ifdef __XEN__
 #include <public/arch-x86/xen.h>
@@ -449,9 +449,10 @@ typedef xen_msr_entry_t msr_entry_buffer_t[];
 #endif
 
 /**
- * Serialise a cpuid_policy object into an array of cpuid leaves.
+ * Serialise the CPUID leaves of a cpu_policy object into an array of cpuid
+ * leaves.
  *
- * @param policy     The cpuid_policy to serialise.
+ * @param policy     The cpu_policy to serialise.
  * @param leaves     The array of leaves to serialise into.
  * @param nr_entries The number of entries in 'leaves'.
  * @returns -errno
@@ -460,13 +461,14 @@ typedef xen_msr_entry_t msr_entry_buffer_t[];
  * leaves array is too short.  On success, nr_entries is updated with the
  * actual number of leaves written.
  */
-int x86_cpuid_copy_to_buffer(const struct cpuid_policy *policy,
+int x86_cpuid_copy_to_buffer(const struct cpu_policy *policy,
                              cpuid_leaf_buffer_t leaves, uint32_t *nr_entries);
 
 /**
- * Unserialise a cpuid_policy object from an array of cpuid leaves.
+ * Unserialise the CPUID leaves of a cpu_policy object into an array of cpuid
+ * leaves.
  *
- * @param policy      The cpuid_policy to unserialise into.
+ * @param policy      The cpu_policy to unserialise into.
  * @param leaves      The array of leaves to unserialise from.
  * @param nr_entries  The number of entries in 'leaves'.
  * @param err_leaf    Optional hint for error diagnostics.
@@ -474,21 +476,21 @@ int x86_cpuid_copy_to_buffer(const struct cpuid_policy *policy,
  * @returns -errno
  *
  * Reads at most CPUID_MAX_SERIALISED_LEAVES.  May return -ERANGE if an
- * incoming leaf is out of range of cpuid_policy, in which case the optional
+ * incoming leaf is out of range of cpu_policy, in which case the optional
  * err_* pointers will identify the out-of-range indicies.
  *
  * No content validation of in-range leaves is performed.  Synthesised data is
  * recalculated.
  */
-int x86_cpuid_copy_from_buffer(struct cpuid_policy *policy,
+int x86_cpuid_copy_from_buffer(struct cpu_policy *policy,
                                const cpuid_leaf_buffer_t leaves,
                                uint32_t nr_entries, uint32_t *err_leaf,
                                uint32_t *err_subleaf);
 
 /**
- * Serialise an msr_policy object into an array.
+ * Serialise the MSRs of a cpu_policy object into an array.
  *
- * @param policy     The msr_policy to serialise.
+ * @param policy     The cpu_policy to serialise.
  * @param msrs       The array of msrs to serialise into.
  * @param nr_entries The number of entries in 'msrs'.
  * @returns -errno
@@ -497,13 +499,13 @@ int x86_cpuid_copy_from_buffer(struct cpuid_policy *policy,
  * buffer array is too short.  On success, nr_entries is updated with the
  * actual number of msrs written.
  */
-int x86_msr_copy_to_buffer(const struct msr_policy *policy,
+int x86_msr_copy_to_buffer(const struct cpu_policy *policy,
                            msr_entry_buffer_t msrs, uint32_t *nr_entries);
 
 /**
- * Unserialise an msr_policy object from an array of msrs.
+ * Unserialise the MSRs of a cpu_policy object from an array of msrs.
  *
- * @param policy     The msr_policy object to unserialise into.
+ * @param policy     The cpu_policy object to unserialise into.
  * @param msrs       The array of msrs to unserialise from.
  * @param nr_entries The number of entries in 'msrs'.
  * @param err_msr    Optional hint for error diagnostics.
@@ -517,7 +519,7 @@ int x86_msr_copy_to_buffer(const struct msr_policy *policy,
  *
  * No content validation is performed on the data stored in the policy object.
  */
-int x86_msr_copy_from_buffer(struct msr_policy *policy,
+int x86_msr_copy_from_buffer(struct cpu_policy *policy,
                              const msr_entry_buffer_t msrs, uint32_t nr_entries,
                              uint32_t *err_msr);
 
diff --git a/xen/lib/x86/cpuid.c b/xen/lib/x86/cpuid.c
index 734e90823a63..7c7b092736ff 100644
--- a/xen/lib/x86/cpuid.c
+++ b/xen/lib/x86/cpuid.c
@@ -102,13 +102,13 @@ void x86_cpu_featureset_to_policy(
     p->feat._7d1             = fs[FEATURESET_7d1];
 }
 
-void x86_cpuid_policy_recalc_synth(struct cpuid_policy *p)
+void x86_cpu_policy_recalc_synth(struct cpu_policy *p)
 {
     p->x86_vendor = x86_cpuid_lookup_vendor(
         p->basic.vendor_ebx, p->basic.vendor_ecx, p->basic.vendor_edx);
 }
 
-void x86_cpuid_policy_fill_native(struct cpuid_policy *p)
+void x86_cpu_policy_fill_native(struct cpu_policy *p)
 {
     unsigned int i;
 
@@ -199,7 +199,7 @@ void x86_cpuid_policy_fill_native(struct cpuid_policy *p)
         cpuid_count_leaf(0xd, 0, &p->xstate.raw[0]);
         cpuid_count_leaf(0xd, 1, &p->xstate.raw[1]);
 
-        xstates = cpuid_policy_xstates(p);
+        xstates = cpu_policy_xstates(p);
 
         /* This logic will probably need adjusting when XCR0[63] gets used. */
         BUILD_BUG_ON(ARRAY_SIZE(p->xstate.raw) > 63);
@@ -222,10 +222,12 @@ void x86_cpuid_policy_fill_native(struct cpuid_policy *p)
     p->hv_limit = 0;
     p->hv2_limit = 0;
 
-    x86_cpuid_policy_recalc_synth(p);
+    /* TODO MSRs */
+
+    x86_cpu_policy_recalc_synth(p);
 }
 
-void x86_cpuid_policy_clear_out_of_range_leaves(struct cpuid_policy *p)
+void x86_cpu_policy_clear_out_of_range_leaves(struct cpu_policy *p)
 {
     unsigned int i;
 
@@ -260,7 +262,7 @@ void x86_cpuid_policy_clear_out_of_range_leaves(struct cpuid_policy *p)
         zero_leaves(p->topo.raw, i, ARRAY_SIZE(p->topo.raw) - 1);
     }
 
-    if ( p->basic.max_leaf < 0xd || !cpuid_policy_xstates(p) )
+    if ( p->basic.max_leaf < 0xd || !cpu_policy_xstates(p) )
         memset(p->xstate.raw, 0, sizeof(p->xstate.raw));
     else
     {
@@ -268,7 +270,7 @@ void x86_cpuid_policy_clear_out_of_range_leaves(struct cpuid_policy *p)
         BUILD_BUG_ON(ARRAY_SIZE(p->xstate.raw) > 63);
 
         /* First two leaves always valid.  Rest depend on xstates. */
-        i = max(2, 64 - __builtin_clzll(cpuid_policy_xstates(p)));
+        i = max(2, 64 - __builtin_clzll(cpu_policy_xstates(p)));
 
         zero_leaves(p->xstate.raw, i,
                     ARRAY_SIZE(p->xstate.raw) - 1);
@@ -333,7 +335,7 @@ static int copy_leaf_to_buffer(uint32_t leaf, uint32_t subleaf,
     return 0;
 }
 
-int x86_cpuid_copy_to_buffer(const struct cpuid_policy *p,
+int x86_cpuid_copy_to_buffer(const struct cpu_policy *p,
                              cpuid_leaf_buffer_t leaves, uint32_t *nr_entries_p)
 {
     const uint32_t nr_entries = *nr_entries_p;
@@ -383,7 +385,7 @@ int x86_cpuid_copy_to_buffer(const struct cpuid_policy *p,
 
         case 0xd:
         {
-            uint64_t xstates = cpuid_policy_xstates(p);
+            uint64_t xstates = cpu_policy_xstates(p);
 
             COPY_LEAF(leaf, 0, &p->xstate.raw[0]);
             COPY_LEAF(leaf, 1, &p->xstate.raw[1]);
@@ -419,7 +421,7 @@ int x86_cpuid_copy_to_buffer(const struct cpuid_policy *p,
     return 0;
 }
 
-int x86_cpuid_copy_from_buffer(struct cpuid_policy *p,
+int x86_cpuid_copy_from_buffer(struct cpu_policy *p,
                                const cpuid_leaf_buffer_t leaves,
                                uint32_t nr_entries, uint32_t *err_leaf,
                                uint32_t *err_subleaf)
@@ -522,7 +524,7 @@ int x86_cpuid_copy_from_buffer(struct cpuid_policy *p,
         }
     }
 
-    x86_cpuid_policy_recalc_synth(p);
+    x86_cpu_policy_recalc_synth(p);
 
     return 0;
 
diff --git a/xen/lib/x86/msr.c b/xen/lib/x86/msr.c
index c4d885e7b568..e04b9ca01302 100644
--- a/xen/lib/x86/msr.c
+++ b/xen/lib/x86/msr.c
@@ -23,7 +23,7 @@ static int copy_msr_to_buffer(uint32_t idx, uint64_t val,
     return 0;
 }
 
-int x86_msr_copy_to_buffer(const struct msr_policy *p,
+int x86_msr_copy_to_buffer(const struct cpu_policy *p,
                            msr_entry_buffer_t msrs, uint32_t *nr_entries_p)
 {
     const uint32_t nr_entries = *nr_entries_p;
@@ -48,7 +48,7 @@ int x86_msr_copy_to_buffer(const struct msr_policy *p,
     return 0;
 }
 
-int x86_msr_copy_from_buffer(struct msr_policy *p,
+int x86_msr_copy_from_buffer(struct cpu_policy *p,
                              const msr_entry_buffer_t msrs, uint32_t nr_entries,
                              uint32_t *err_msr)
 {
-- 
2.30.2


