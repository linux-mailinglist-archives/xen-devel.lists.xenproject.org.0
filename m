Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 643107B2126
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 17:25:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609919.949108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlssy-0003SH-Ud; Thu, 28 Sep 2023 15:25:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609919.949108; Thu, 28 Sep 2023 15:25:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlssy-0003MT-Mj; Thu, 28 Sep 2023 15:25:04 +0000
Received: by outflank-mailman (input) for mailman id 609919;
 Thu, 28 Sep 2023 15:25:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QRba=FM=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qlssx-00032t-FK
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 15:25:03 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3164e8e3-5e13-11ee-878a-cb3800f73035;
 Thu, 28 Sep 2023 17:25:02 +0200 (CEST)
Received: from beta.station (net-188-218-250-245.cust.vodafonedsl.it
 [188.218.250.245])
 by support.bugseng.com (Postfix) with ESMTPSA id 9E3544EE073C;
 Thu, 28 Sep 2023 17:25:01 +0200 (CEST)
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
X-Inumbo-ID: 3164e8e3-5e13-11ee-878a-cb3800f73035
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	sstabellini@kernel.org,
	jbeulich@suse.com,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Gianluca Luparini <gianluca.luparini@bugseng.com>
Subject: [XEN PATCH v7 4/4] xen/x86: address violations of MISRA C:2012 Rule 7.2
Date: Thu, 28 Sep 2023 17:23:04 +0200
Message-Id: <bdd904ece02fdd6365db4911b411ba8b20b7debc.1695913900.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695913900.git.simone.ballarin@bugseng.com>
References: <cover.1695913900.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The xen sources contains violations of MISRA C:2012 Rule 7.2 whose
headline states:
"A 'u' or 'U' suffix shall be applied to all integer constants
that are represented in an unsigned type".

Add the 'U' suffix to integers literals with unsigned type.

For the sake of uniformity, the following change is made:
- add the 'U' suffix to switch cases in 'cpuid.c'

Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
---
Changes in v7:
- change cast to long in a cast to unsigned long in INVALID_PERCPU_AREA
  to match the type of the first operand
- add missing Signed-off-by tags
Changes in v6:
- new patch obtained by splitting X86 related changes from
"xen/x86: address violations of MISRA C:2012 Rule 7.2 (v5)"
---
 xen/arch/x86/apic.c       |  2 +-
 xen/arch/x86/cpu-policy.c | 18 +++++++++---------
 xen/arch/x86/cpuid.c      |  8 ++++----
 xen/arch/x86/extable.c    |  2 +-
 xen/arch/x86/percpu.c     |  2 +-
 xen/arch/x86/psr.c        |  2 +-
 xen/arch/x86/spec_ctrl.c  | 12 ++++++------
 7 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/xen/arch/x86/apic.c b/xen/arch/x86/apic.c
index f1264ce7ed..6a43d81d2a 100644
--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -1191,7 +1191,7 @@ static void __init calibrate_APIC_clock(void)
      * Setup the APIC counter to maximum. There is no way the lapic
      * can underflow in the 100ms detection time frame.
      */
-    __setup_APIC_LVTT(0xffffffff);
+    __setup_APIC_LVTT(0xffffffffU);
 
     bus_freq = calibrate_apic_timer();
     if ( !bus_freq )
diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index 81e574390f..423932bc13 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -321,7 +321,7 @@ static void recalculate_misc(struct cpu_policy *p)
         p->extd.vendor_edx = p->basic.vendor_edx;
 
         p->extd.raw_fms = p->basic.raw_fms;
-        p->extd.raw[0x1].b &= 0xff00ffff;
+        p->extd.raw[0x1].b &= 0xff00ffffU;
         p->extd.e1d |= p->basic._1d & CPUID_COMMON_1D_FEATURES;
 
         p->extd.raw[0x8].a &= 0x0000ffff; /* GuestMaxPhysAddr hidden. */
@@ -378,10 +378,10 @@ static void __init calculate_host_policy(void)
      * this information.
      */
     if ( cpu_has_lfence_dispatch )
-        max_extd_leaf = max(max_extd_leaf, 0x80000021);
+        max_extd_leaf = max(max_extd_leaf, 0x80000021U);
 
-    p->extd.max_leaf = 0x80000000 | min_t(uint32_t, max_extd_leaf & 0xffff,
-                                          ARRAY_SIZE(p->extd.raw) - 1);
+    p->extd.max_leaf = 0x80000000U | min_t(uint32_t, max_extd_leaf & 0xffff,
+                                           ARRAY_SIZE(p->extd.raw) - 1);
 
     x86_cpu_featureset_to_policy(boot_cpu_data.x86_capability, p);
     recalculate_xstate(p);
@@ -793,11 +793,11 @@ void recalculate_cpuid_policy(struct domain *d)
 
     p->basic.max_leaf   = min(p->basic.max_leaf,   max->basic.max_leaf);
     p->feat.max_subleaf = min(p->feat.max_subleaf, max->feat.max_subleaf);
-    p->extd.max_leaf    = 0x80000000 | min(p->extd.max_leaf & 0xffff,
-                                           ((p->x86_vendor & (X86_VENDOR_AMD |
-                                                              X86_VENDOR_HYGON))
-                                            ? CPUID_GUEST_NR_EXTD_AMD
-                                            : CPUID_GUEST_NR_EXTD_INTEL) - 1);
+    p->extd.max_leaf    = 0x80000000U | min(p->extd.max_leaf & 0xffff,
+                                            ((p->x86_vendor & (X86_VENDOR_AMD |
+                                                               X86_VENDOR_HYGON))
+                                             ? CPUID_GUEST_NR_EXTD_AMD
+                                             : CPUID_GUEST_NR_EXTD_INTEL) - 1);
 
     x86_cpu_policy_to_featureset(p, fs);
     x86_cpu_policy_to_featureset(max, max_fs);
diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 455a09b2dd..7290a979c6 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -93,7 +93,7 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
         }
         break;
 
-    case 0x40000000 ... 0x400000ff:
+    case 0x40000000U ... 0x400000ffU:
         if ( is_viridian_domain(d) )
             return cpuid_viridian_leaves(v, leaf, subleaf, res);
 
@@ -103,10 +103,10 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
          * Intel reserve up until 0x4fffffff for hypervisor use.  AMD reserve
          * only until 0x400000ff, but we already use double that.
          */
-    case 0x40000100 ... 0x400001ff:
+    case 0x40000100U ... 0x400001ffU:
         return cpuid_hypervisor_leaves(v, leaf, subleaf, res);
 
-    case 0x80000000 ... 0x80000000 + CPUID_GUEST_NR_EXTD - 1:
+    case 0x80000000U ... 0x80000000U + CPUID_GUEST_NR_EXTD - 1:
         ASSERT((p->extd.max_leaf & 0xffff) < ARRAY_SIZE(p->extd.raw));
         if ( (leaf & 0xffff) > min_t(uint32_t, p->extd.max_leaf & 0xffff,
                                      ARRAY_SIZE(p->extd.raw) - 1) )
@@ -352,7 +352,7 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
         }
         break;
 
-    case 0x80000001:
+    case 0x80000001U:
         /* SYSCALL is hidden outside of long mode on Intel. */
         if ( p->x86_vendor == X86_VENDOR_INTEL &&
              is_hvm_domain(d) && !hvm_long_mode_active(v) )
diff --git a/xen/arch/x86/extable.c b/xen/arch/x86/extable.c
index 74b14246e9..652010f413 100644
--- a/xen/arch/x86/extable.c
+++ b/xen/arch/x86/extable.c
@@ -141,7 +141,7 @@ static int __init cf_check stub_selftest(void)
           .rax = 0x0123456789abcdef,
           .res.fields.trapnr = X86_EXC_GP },
         { .opc = { endbr64, 0x02, 0x04, 0x04, 0xc3 }, /* add (%rsp,%rax),%al */
-          .rax = 0xfedcba9876543210,
+          .rax = 0xfedcba9876543210UL,
           .res.fields.trapnr = X86_EXC_SS },
         { .opc = { endbr64, 0xcc, 0xc3, 0xc3, 0xc3 }, /* int3 */
           .res.fields.trapnr = X86_EXC_BP },
diff --git a/xen/arch/x86/percpu.c b/xen/arch/x86/percpu.c
index 288050cdba..3205eacea6 100644
--- a/xen/arch/x86/percpu.c
+++ b/xen/arch/x86/percpu.c
@@ -12,7 +12,7 @@ unsigned long __per_cpu_offset[NR_CPUS];
  * possible #PF at (NULL + a little) which has security implications in the
  * context of PV guests.
  */
-#define INVALID_PERCPU_AREA (0x8000000000000000L - (long)__per_cpu_start)
+#define INVALID_PERCPU_AREA (0x8000000000000000UL - (unsigned long)__per_cpu_start)
 #define PERCPU_ORDER get_order_from_bytes(__per_cpu_data_end - __per_cpu_start)
 
 void __init percpu_init_areas(void)
diff --git a/xen/arch/x86/psr.c b/xen/arch/x86/psr.c
index 4c01813c4b..0b9631ac44 100644
--- a/xen/arch/x86/psr.c
+++ b/xen/arch/x86/psr.c
@@ -191,7 +191,7 @@ static struct feat_node *feat_l2_cat;
 static struct feat_node *feat_mba;
 
 /* Common functions */
-#define cat_default_val(len) (0xffffffff >> (32 - (len)))
+#define cat_default_val(len) (0xffffffffU >> (32 - (len)))
 
 /*
  * get_cdp_data - get DATA COS register value from input COS ID.
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index 6fd7d44ce4..c53632089e 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -406,10 +406,10 @@ static void __init print_details(enum ind_thunk thunk)
         cpuid_count(7, 0, &max, &tmp, &tmp, &_7d0);
     if ( max >= 2 )
         cpuid_count(7, 2, &tmp, &tmp, &tmp, &_7d2);
-    if ( boot_cpu_data.extended_cpuid_level >= 0x80000008 )
-        cpuid(0x80000008, &tmp, &e8b, &tmp, &tmp);
-    if ( boot_cpu_data.extended_cpuid_level >= 0x80000021 )
-        cpuid(0x80000021, &e21a, &tmp, &tmp, &tmp);
+    if ( boot_cpu_data.extended_cpuid_level >= 0x80000008U )
+        cpuid(0x80000008U, &tmp, &e8b, &tmp, &tmp);
+    if ( boot_cpu_data.extended_cpuid_level >= 0x80000021U )
+        cpuid(0x80000021U, &e21a, &tmp, &tmp, &tmp);
     if ( cpu_has_arch_caps )
         rdmsrl(MSR_ARCH_CAPABILITIES, caps);
 
@@ -1612,8 +1612,8 @@ void __init init_speculation_mitigations(void)
          * TODO: Adjust cpu_has_svm_spec_ctrl to be usable earlier on boot.
          */
         if ( opt_msr_sc_hvm &&
-             (boot_cpu_data.extended_cpuid_level >= 0x8000000a) &&
-             (cpuid_edx(0x8000000a) & (1u << SVM_FEATURE_SPEC_CTRL)) )
+             (boot_cpu_data.extended_cpuid_level >= 0x8000000aU) &&
+             (cpuid_edx(0x8000000aU) & (1u << SVM_FEATURE_SPEC_CTRL)) )
             setup_force_cpu_cap(X86_FEATURE_SC_MSR_HVM);
     }
 
-- 
2.34.1


