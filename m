Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCEA6D5C62
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 11:53:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517716.803523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjdLP-00073e-L4; Tue, 04 Apr 2023 09:52:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517716.803523; Tue, 04 Apr 2023 09:52:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjdLP-0006y7-C8; Tue, 04 Apr 2023 09:52:51 +0000
Received: by outflank-mailman (input) for mailman id 517716;
 Tue, 04 Apr 2023 09:52:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Oy2y=73=citrix.com=prvs=4518c43dc=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pjdLN-0005bo-Ai
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 09:52:49 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 742f8e97-d2ce-11ed-85db-49a42c6b2330;
 Tue, 04 Apr 2023 11:52:47 +0200 (CEST)
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
X-Inumbo-ID: 742f8e97-d2ce-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680601967;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9UHULmNeog4OHP6x3IyWXzySNECyTqt0kgFmTV9Rc0k=;
  b=IK9AzNLBAoh2XvuW4teqM9D3HYqjy1lkNvNy4Fijj04eQXjLcHu2yzSW
   pHu2QuGXLqUJ9+Pw+ApWjcAxbbDuS03H6pVlniQhg89SGTkQQKep/nf7p
   99JlWV0xEreuhWI+/TI5u1qy6xEm8P+DNdJkoUwfINPRhdRG8LtkXJ0zB
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 106670672
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:I3hCz6wXoWh3baxkQiN6t+dIxirEfRIJ4+MujC+fZmUNrF6WrkUFz
 TYWUDyGOqrcN2X0eYsiYIXj80gPusSHz9Y1TFNoriAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UMHUMja4mtC5QRiPawT5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KXlM2
 Ow+OD8vVEySvOW82Jfic7k9ptt2eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKZOUYn1lQ/UfrSmM+BgHXlfiIeg1WSvactuEDYzRBr0airO93QEjCPbZwNwBjH/
 jyZpQwVBDk5C5+BmAWeo0muufDU3grwY4EdHqa3o6sCbFq7mTVIVUx+uUGAiea9ol6zXZRYM
 UN80jojq+0++VKmSvH5XgakuziUsxgEQd1SHuYmrgaXxcL84QyUG2wFRT5pc8E9uYk9QjlC6
 7OSt4q3X3o16uTTEC/DsO7O9lteJBT5M0caZwIUaxsKweO/sbo0hArqF+8zQY6q24id9S7L/
 9yakMQvr+xN3ZZWiPvhogmvbyGE/caQEFNsjunDdif8t14iOtb4D2C9wQKDhcusOrp1WbVoU
 JIsv8GFpN4DApiW/MBmaLVcRer5jxpp3dC1vLKOI3XC3273k5JbVdoMiAyS3W8wWir+RRfnY
 VXIpSRa74JJMX2hYMdfOtzhU5l2k/m6To67Bpg4i+aihbAoLGe6ENxGPxbMjwgBbmB3+U3AB
 XtrWZn1VitLYUiW5DG3W/0cwdcW+8zK/kuKHcqT503+gdKjiIu9Fe9t3K2mMrpos8tpYWz9r
 75iCid9404AD7GkO3WIqN57wJJjBSFTOK0aYvd/LoarSjeK0kl4YxMN6dvNo7BYopk=
IronPort-HdrOrdr: A9a23:ZQBS36OH2TnlpcBcTgWjsMiBIKoaSvp037BK7S1MoH1uA6mlfq
 WV9sjzuiWatN98Yh8dcLO7Scu9qBHnlaKdiLN5VduftWHd01dAR7sSjrcKrQeAJ8X/nNQtr5
 uJccJFeaDN5Y4Rt7eH3OG6eexQv+Vu6MqT9IPjJ+8Gd3ATV0lnhT0JbTqzIwlNayRtI4E2L5
 aY7tovnUvaRZxGBv7LYEXsRoL41qT2qK4=
X-IronPort-AV: E=Sophos;i="5.98,317,1673931600"; 
   d="scan'208";a="106670672"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v2 07/15] x86: Merge xc_cpu_policy's cpuid and msr objects
Date: Tue, 4 Apr 2023 10:52:14 +0100
Message-ID: <20230404095222.1373721-8-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230404095222.1373721-1-andrew.cooper3@citrix.com>
References: <20230404095222.1373721-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Right now, they're the same underlying type, containing disjoint information.

Use a single object instead.  Also take the opportunity to rename 'entries' to
'msrs' which is more descriptive, and more in line with nr_msrs being the
count of MSR entries in the API.

test-tsx uses xg_private.h to access the internals of xc_cpu_policy, so needs
updating at the same time.  Take the opportunity to improve the code clarity
by passing a cpu_policy rather than an xc_cpu_policy into some functions.

No practical change.  This undoes the transient doubling of storage space from
earlier patches.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2:
 * Reword the commit message.
 * Clean up test-tsx a bit more.
---
 tools/libs/guest/xg_cpuid_x86.c | 36 ++++++++---------
 tools/libs/guest/xg_private.h   |  5 +--
 tools/tests/tsx/test-tsx.c      | 71 +++++++++++++++------------------
 3 files changed, 53 insertions(+), 59 deletions(-)

diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 5fae06e77804..5061fe357767 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -431,7 +431,7 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
     xc_dominfo_t di;
     unsigned int i, nr_leaves, nr_msrs;
     xen_cpuid_leaf_t *leaves = NULL;
-    struct cpuid_policy *p = NULL;
+    struct cpu_policy *p = NULL;
     uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
     uint32_t host_featureset[FEATURESET_NR_ENTRIES] = {};
     uint32_t len = ARRAY_SIZE(host_featureset);
@@ -692,7 +692,7 @@ static int deserialize_policy(xc_interface *xch, xc_cpu_policy_t *policy,
     uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
     int rc;
 
-    rc = x86_cpuid_copy_from_buffer(&policy->cpuid, policy->leaves,
+    rc = x86_cpuid_copy_from_buffer(&policy->policy, policy->leaves,
                                     nr_leaves, &err_leaf, &err_subleaf);
     if ( rc )
     {
@@ -702,7 +702,7 @@ static int deserialize_policy(xc_interface *xch, xc_cpu_policy_t *policy,
         return rc;
     }
 
-    rc = x86_msr_copy_from_buffer(&policy->msr, policy->entries,
+    rc = x86_msr_copy_from_buffer(&policy->policy, policy->msrs,
                                   nr_entries, &err_msr);
     if ( rc )
     {
@@ -719,18 +719,18 @@ int xc_cpu_policy_get_system(xc_interface *xch, unsigned int policy_idx,
                              xc_cpu_policy_t *policy)
 {
     unsigned int nr_leaves = ARRAY_SIZE(policy->leaves);
-    unsigned int nr_entries = ARRAY_SIZE(policy->entries);
+    unsigned int nr_msrs = ARRAY_SIZE(policy->msrs);
     int rc;
 
     rc = get_system_cpu_policy(xch, policy_idx, &nr_leaves, policy->leaves,
-                               &nr_entries, policy->entries);
+                               &nr_msrs, policy->msrs);
     if ( rc )
     {
         PERROR("Failed to obtain %u policy", policy_idx);
         return rc;
     }
 
-    rc = deserialize_policy(xch, policy, nr_leaves, nr_entries);
+    rc = deserialize_policy(xch, policy, nr_leaves, nr_msrs);
     if ( rc )
     {
         errno = -rc;
@@ -744,18 +744,18 @@ int xc_cpu_policy_get_domain(xc_interface *xch, uint32_t domid,
                              xc_cpu_policy_t *policy)
 {
     unsigned int nr_leaves = ARRAY_SIZE(policy->leaves);
-    unsigned int nr_entries = ARRAY_SIZE(policy->entries);
+    unsigned int nr_msrs = ARRAY_SIZE(policy->msrs);
     int rc;
 
     rc = get_domain_cpu_policy(xch, domid, &nr_leaves, policy->leaves,
-                               &nr_entries, policy->entries);
+                               &nr_msrs, policy->msrs);
     if ( rc )
     {
         PERROR("Failed to obtain domain %u policy", domid);
         return rc;
     }
 
-    rc = deserialize_policy(xch, policy, nr_leaves, nr_entries);
+    rc = deserialize_policy(xch, policy, nr_leaves, nr_msrs);
     if ( rc )
     {
         errno = -rc;
@@ -770,16 +770,16 @@ int xc_cpu_policy_set_domain(xc_interface *xch, uint32_t domid,
 {
     uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
     unsigned int nr_leaves = ARRAY_SIZE(policy->leaves);
-    unsigned int nr_entries = ARRAY_SIZE(policy->entries);
+    unsigned int nr_msrs = ARRAY_SIZE(policy->msrs);
     int rc;
 
     rc = xc_cpu_policy_serialise(xch, policy, policy->leaves, &nr_leaves,
-                                 policy->entries, &nr_entries);
+                                 policy->msrs, &nr_msrs);
     if ( rc )
         return rc;
 
     rc = xc_set_domain_cpu_policy(xch, domid, nr_leaves, policy->leaves,
-                                  nr_entries, policy->entries,
+                                  nr_msrs, policy->msrs,
                                   &err_leaf, &err_subleaf, &err_msr);
     if ( rc )
     {
@@ -802,7 +802,7 @@ int xc_cpu_policy_serialise(xc_interface *xch, const xc_cpu_policy_t *p,
 
     if ( leaves )
     {
-        rc = x86_cpuid_copy_to_buffer(&p->cpuid, leaves, nr_leaves);
+        rc = x86_cpuid_copy_to_buffer(&p->policy, leaves, nr_leaves);
         if ( rc )
         {
             ERROR("Failed to serialize CPUID policy");
@@ -813,7 +813,7 @@ int xc_cpu_policy_serialise(xc_interface *xch, const xc_cpu_policy_t *p,
 
     if ( msrs )
     {
-        rc = x86_msr_copy_to_buffer(&p->msr, msrs, nr_msrs);
+        rc = x86_msr_copy_to_buffer(&p->policy, msrs, nr_msrs);
         if ( rc )
         {
             ERROR("Failed to serialize MSR policy");
@@ -831,7 +831,7 @@ int xc_cpu_policy_update_cpuid(xc_interface *xch, xc_cpu_policy_t *policy,
                                uint32_t nr)
 {
     unsigned int err_leaf = -1, err_subleaf = -1;
-    int rc = x86_cpuid_copy_from_buffer(&policy->cpuid, leaves, nr,
+    int rc = x86_cpuid_copy_from_buffer(&policy->policy, leaves, nr,
                                         &err_leaf, &err_subleaf);
 
     if ( rc )
@@ -850,7 +850,7 @@ int xc_cpu_policy_update_msrs(xc_interface *xch, xc_cpu_policy_t *policy,
                               const xen_msr_entry_t *msrs, uint32_t nr)
 {
     unsigned int err_msr = -1;
-    int rc = x86_msr_copy_from_buffer(&policy->msr, msrs, nr, &err_msr);
+    int rc = x86_msr_copy_from_buffer(&policy->policy, msrs, nr, &err_msr);
 
     if ( rc )
     {
@@ -868,8 +868,8 @@ bool xc_cpu_policy_is_compatible(xc_interface *xch, xc_cpu_policy_t *host,
                                  xc_cpu_policy_t *guest)
 {
     struct cpu_policy_errors err = INIT_CPU_POLICY_ERRORS;
-    struct old_cpu_policy h = { &host->cpuid, &host->msr };
-    struct old_cpu_policy g = { &guest->cpuid, &guest->msr };
+    struct old_cpu_policy h = { &host->policy, &host->policy };
+    struct old_cpu_policy g = { &guest->policy, &guest->policy };
     int rc = x86_cpu_policies_are_compatible(&h, &g, &err);
 
     if ( !rc )
diff --git a/tools/libs/guest/xg_private.h b/tools/libs/guest/xg_private.h
index 09e24f122760..e729a8106c3e 100644
--- a/tools/libs/guest/xg_private.h
+++ b/tools/libs/guest/xg_private.h
@@ -173,10 +173,9 @@ int pin_table(xc_interface *xch, unsigned int type, unsigned long mfn,
 #include <xen/lib/x86/cpu-policy.h>
 
 struct xc_cpu_policy {
-    struct cpuid_policy cpuid;
-    struct msr_policy msr;
+    struct cpu_policy policy;
     xen_cpuid_leaf_t leaves[CPUID_MAX_SERIALISED_LEAVES];
-    xen_msr_entry_t entries[MSR_MAX_SERIALISED_ENTRIES];
+    xen_msr_entry_t msrs[MSR_MAX_SERIALISED_ENTRIES];
 };
 #endif /* x86 */
 
diff --git a/tools/tests/tsx/test-tsx.c b/tools/tests/tsx/test-tsx.c
index d6d98c299bf9..b7e1972ce8a7 100644
--- a/tools/tests/tsx/test-tsx.c
+++ b/tools/tests/tsx/test-tsx.c
@@ -151,15 +151,15 @@ static void test_tsx_msrs(void)
 {
     printf("Testing MSR_TSX_FORCE_ABORT consistency\n");
     test_tsx_msr_consistency(
-        MSR_TSX_FORCE_ABORT, host.cpuid.feat.tsx_force_abort);
+        MSR_TSX_FORCE_ABORT, host.policy.feat.tsx_force_abort);
 
     printf("Testing MSR_TSX_CTRL consistency\n");
     test_tsx_msr_consistency(
-        MSR_TSX_CTRL, host.msr.arch_caps.tsx_ctrl);
+        MSR_TSX_CTRL, host.policy.arch_caps.tsx_ctrl);
 
     printf("Testing MSR_MCU_OPT_CTRL consistency\n");
     test_tsx_msr_consistency(
-        MSR_MCU_OPT_CTRL, host.cpuid.feat.srbds_ctrl);
+        MSR_MCU_OPT_CTRL, host.policy.feat.srbds_ctrl);
 }
 
 /*
@@ -281,7 +281,7 @@ static void test_rtm_behaviour(void)
     else
         return fail("  Got unexpected behaviour %d\n", rtm_behaviour);
 
-    if ( host.cpuid.feat.rtm )
+    if ( host.policy.feat.rtm )
     {
         if ( rtm_behaviour == RTM_UD )
             fail("  Host reports RTM, but appears unavailable\n");
@@ -293,57 +293,52 @@ static void test_rtm_behaviour(void)
     }
 }
 
-static void dump_tsx_details(const struct xc_cpu_policy *p, const char *pref)
+static void dump_tsx_details(const struct cpu_policy *p, const char *pref)
 {
     printf("  %s RTM %u, HLE %u, TSX_FORCE_ABORT %u, RTM_ALWAYS_ABORT %u, TSX_CTRL %u\n",
            pref,
-           p->cpuid.feat.rtm,
-           p->cpuid.feat.hle,
-           p->cpuid.feat.tsx_force_abort,
-           p->cpuid.feat.rtm_always_abort,
-           p->msr.arch_caps.tsx_ctrl);
+           p->feat.rtm,
+           p->feat.hle,
+           p->feat.tsx_force_abort,
+           p->feat.rtm_always_abort,
+           p->arch_caps.tsx_ctrl);
 }
 
 /* Sanity test various invariants we expect in the default/max policies. */
-static void test_guest_policies(const struct xc_cpu_policy *max,
-                                const struct xc_cpu_policy *def)
+static void test_guest_policies(const struct cpu_policy *max,
+                                const struct cpu_policy *def)
 {
-    const struct cpuid_policy *cm = &max->cpuid;
-    const struct cpuid_policy *cd = &def->cpuid;
-    const struct msr_policy *mm = &max->msr;
-    const struct msr_policy *md = &def->msr;
-
     dump_tsx_details(max, "Max:");
     dump_tsx_details(def, "Def:");
 
-    if ( ((cm->feat.raw[0].d | cd->feat.raw[0].d) &
+    if ( ((max->feat.raw[0].d | def->feat.raw[0].d) &
           (bitmaskof(X86_FEATURE_TSX_FORCE_ABORT) |
            bitmaskof(X86_FEATURE_RTM_ALWAYS_ABORT) |
            bitmaskof(X86_FEATURE_SRBDS_CTRL))) ||
-         ((mm->arch_caps.raw | md->arch_caps.raw) & ARCH_CAPS_TSX_CTRL) )
+         ((max->arch_caps.raw | def->arch_caps.raw) & ARCH_CAPS_TSX_CTRL) )
         fail("  Xen-only TSX controls offered to guest\n");
 
     switch ( rtm_behaviour )
     {
     case RTM_UD:
-        if ( (cm->feat.raw[0].b | cd->feat.raw[0].b) &
+        if ( (max->feat.raw[0].b | def->feat.raw[0].b) &
              (bitmaskof(X86_FEATURE_HLE) | bitmaskof(X86_FEATURE_RTM)) )
              fail("  HLE/RTM offered to guests despite not being available\n");
         break;
 
     case RTM_ABORT:
-        if ( cd->feat.raw[0].b &
+        if ( def->feat.raw[0].b &
              (bitmaskof(X86_FEATURE_HLE) | bitmaskof(X86_FEATURE_RTM)) )
              fail("  HLE/RTM offered to guests by default despite not being usable\n");
         break;
 
     case RTM_OK:
-        if ( !cm->feat.rtm || !cd->feat.rtm )
+        if ( !max->feat.rtm || !def->feat.rtm )
              fail("  RTM not offered to guests despite being available\n");
         break;
     }
 
-    if ( cd->feat.hle )
+    if ( def->feat.hle )
         fail("  Fail: HLE offered in default policy\n");
 }
 
@@ -352,13 +347,13 @@ static void test_def_max_policies(void)
     if ( xen_has_pv )
     {
         printf("Testing PV default/max policies\n");
-        test_guest_policies(&pv_max, &pv_default);
+        test_guest_policies(&pv_max.policy, &pv_default.policy);
     }
 
     if ( xen_has_hvm )
     {
         printf("Testing HVM default/max policies\n");
-        test_guest_policies(&hvm_max, &hvm_default);
+        test_guest_policies(&hvm_max.policy, &hvm_default.policy);
     }
 }
 
@@ -382,23 +377,23 @@ static void test_guest(struct xen_domctl_createdomain *c)
         goto out;
     }
 
-    dump_tsx_details(&guest_policy, "Cur:");
+    dump_tsx_details(&guest_policy.policy, "Cur:");
 
     /*
      * Check defaults given to the guest.
      */
-    if ( guest_policy.cpuid.feat.rtm != (rtm_behaviour == RTM_OK) )
+    if ( guest_policy.policy.feat.rtm != (rtm_behaviour == RTM_OK) )
         fail("  RTM %u in guest, despite rtm behaviour\n",
-             guest_policy.cpuid.feat.rtm);
+             guest_policy.policy.feat.rtm);
 
-    if ( guest_policy.cpuid.feat.hle ||
-         guest_policy.cpuid.feat.tsx_force_abort ||
-         guest_policy.cpuid.feat.rtm_always_abort ||
-         guest_policy.cpuid.feat.srbds_ctrl ||
-         guest_policy.msr.arch_caps.tsx_ctrl )
+    if ( guest_policy.policy.feat.hle ||
+         guest_policy.policy.feat.tsx_force_abort ||
+         guest_policy.policy.feat.rtm_always_abort ||
+         guest_policy.policy.feat.srbds_ctrl ||
+         guest_policy.policy.arch_caps.tsx_ctrl )
         fail("  Unexpected features advertised\n");
 
-    if ( host.cpuid.feat.rtm )
+    if ( host.policy.feat.rtm )
     {
         unsigned int _7b0;
 
@@ -406,7 +401,7 @@ static void test_guest(struct xen_domctl_createdomain *c)
          * If host RTM is available, all combinations of guest flags should be
          * possible.  Flip both HLE/RTM to check non-default settings.
          */
-        _7b0 = (guest_policy.cpuid.feat.raw[0].b ^=
+        _7b0 = (guest_policy.policy.feat.raw[0].b ^=
                 (bitmaskof(X86_FEATURE_HLE) | bitmaskof(X86_FEATURE_RTM)));
 
         /* Set the new policy. */
@@ -427,12 +422,12 @@ static void test_guest(struct xen_domctl_createdomain *c)
             goto out;
         }
 
-        dump_tsx_details(&guest_policy, "Cur:");
+        dump_tsx_details(&guest_policy.policy, "Cur:");
 
-        if ( guest_policy.cpuid.feat.raw[0].b != _7b0 )
+        if ( guest_policy.policy.feat.raw[0].b != _7b0 )
         {
             fail("  Expected CPUID.7[1].b 0x%08x differs from actual 0x%08x\n",
-                 _7b0, guest_policy.cpuid.feat.raw[0].b);
+                 _7b0, guest_policy.policy.feat.raw[0].b);
             goto out;
         }
     }
-- 
2.30.2


