Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F5E45CEC7
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 22:12:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230577.398620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpzYl-0003uS-Vo; Wed, 24 Nov 2021 21:12:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230577.398620; Wed, 24 Nov 2021 21:12:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpzYl-0003rq-RD; Wed, 24 Nov 2021 21:12:07 +0000
Received: by outflank-mailman (input) for mailman id 230577;
 Wed, 24 Nov 2021 21:12:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T8bs=QL=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mpzYk-0003rk-Kt
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 21:12:06 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b115bd2-4d6b-11ec-9787-a32c541c8605;
 Wed, 24 Nov 2021 22:12:04 +0100 (CET)
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
X-Inumbo-ID: 2b115bd2-4d6b-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637788324;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=LrisarM+zh4xGyEaCTVkU64TlzUug60nIJTVDqVZ8Ik=;
  b=bfFmUM2xY9UYL6lAmOSKLM9EKAbxdHTf/KLdpYtwkbtDKKQ/hNh/jxx/
   jl+Sa+pWZOnC9cIbPiXNQXjtZJOTx6l9MsECKp0zLAH0hd+gf1qb7oZQx
   DELQNFg8VU3Mb9shLKK/5nzAJ/9nN9le7uDItAdnPTvCThnddSJZznKDZ
   0=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 20ObPTLwTJ46KltzQ0Kcgcx8Gn3h0eI5spFskynwBr1ZoxsessY+BMVTFR5Pt4cgOcz/GLKqQ+
 GvOa0WVvaHd7UY3cn9oCwyIwGUl5lTY8p9RWoXM9yE7AEeju/fW6sLozuXQYhW/GMwfujWrPzt
 QtsBWU0iirO2bt4ZS0sCqneH7Sjve34BDJ7a/FjEapLe4lDsilKXnVPP7TUrU0ce81MaJ78HIq
 /k+ogBhXO2Pv4StNKim15/Avm5ctFFRlIF/2rN0TGeOLmS1KObamUPAQniDDA/X+fmUMkqyY/f
 TwwDSE7tok6UnVxzAtsRHC0u
X-SBRS: 5.1
X-MesageID: 58595209
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:vOVV0KCqy5NcnBVW//zkw5YqxClBgxIJ4kV8jS/XYbTApDsq32ZSx
 zEbW2zVPqyOYmH9LdEga4uz9E4CvZXQnIBjQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLGs1hxZH1c+EX540047wIbVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/sR+1n9NBj
 /x0nMbgEiE4BbTsmMUUekwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTY+9gnMk8auLsO5sSoCpIxjDFF/c2B5vERs0m4PcFjGph25oWTJ4yY
 eJCOX1eaRjjbCdqGXEZMZkGoeKWhz7wJmgwRFW9+vNsvjm7IBZK+KfpGMrYfJqNX8o9tkeHp
 ErW8mLhGBYYOdeDjz2f/RqEluLJ2C/2Ro8WPLm57eJxxk2ewHQJDx8bXkf9puO24maccd9CL
 00f+gI1sLM/skesS7HAswaQ+SDe+ERGApwJTrN8uFrlJrfoDxixPEI4Tj1xL/UfnZVmHho77
 Uapn/LgLGk62FGKck61+rCRpDK0HCEaK24eeCMJJTc4D8nfTJIb1UyWEIs6eEKhppisQGyrn
 WjWxMQrr+xL1ZZj6kmtwbzQb9tATLDtRxV92AjYV3nNAuhRNN/8PNzABbQ2AJ99wGelorup4
 Cdsdyu2trlm4XSxeMulGrhlIV1Rz6zZWAAweHY2d3Xbyxyj+mS4Yadb6yxkKUFiP64sIGGyP
 xCM6FMBtcUNbRNGiJObhKrrVawXIVXIT4y5Bpg4kPISCnSOSON31H43PhPBt4wcuEMtjbs+K
 f+mnTWEVh4n5VBc5GPuHY81iOZzrghnnD+7bc2rnnyPjOvFDFbIGOhtDbd7Rr1ghE9yiF6Oq
 Ig32grj40g3bdASlQGLq9NOdg5TciBgbX00wuQOHtO+zsNdMDlJI5fsLXkJIuSJRoxZybXF+
 G+TQEhdxAatjHHLM1zSOHtidKnuTdB0qndiZX4gOlOh2n4CZ4ez7fhAK8trLOd/rOEzn+RpS
 /QletmbBqgdQDrw5DlAP4L2q5ZvdUr3iFvWbTalejU2Y7VpWxfNpo3/ZgLq+SRXVni3uMIyr
 qeOzATeRZZfFQ1uANyPMKCkzk+rvGhbk+V3BhOaLt5WcUTq0Y5rNy2u0aNnf5BScU3On2LI2
 RyXDBEUofj2j7U0qNSZ17qZq4qJEvdlGhYIFWfs8rvrZzLR+XCuwNEcXb/QLyzdTm795I6re
 f5Rk6PnKPQCkVtH79h8HrJswf5s7tfjveYHnAFtHXGNZFW3ELJwZHKB2JAX5KFKw7ZYvyqwW
 16OpYYGaenYZpu9HQ5DPhchY8SCyeoQy2vb4vkCKUnn4DN6oeicWkJIMhjQ0CFQIdOZ6m/+L
 TvNbCLO1zGCtw==
IronPort-HdrOrdr: A9a23:rO8yT66FUw5XLiRKVgPXwMTXdLJyesId70hD6qhwISY6TiX+rb
 HIoB17726RtN9/YhEdcLy7VJVoIkmskKKdg7NhXotKNTOO0ADDQb2KhbGSpQEIcBeeygcy78
 hdmtBFeb/NMWQ=
X-IronPort-AV: E=Sophos;i="5.87,261,1631592000"; 
   d="scan'208";a="58595209"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>
Subject: [PATCH for-4.16] Revert "x86/CPUID: shrink max_{,sub}leaf fields according to actual leaf contents"
Date: Wed, 24 Nov 2021 21:11:52 +0000
Message-ID: <20211124211152.1142-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

OSSTest has identified a 3rd regression caused by this change.  Migration
between Xen 4.15 and 4.16 on the nocera pair of machines (AMD Opteron 4133)
fails with:

  xc: error: Failed to set CPUID policy: leaf 00000000, subleaf ffffffff, msr ffffffff (22 = Invalid argument): Internal error
  xc: error: Restore failed (22 = Invalid argument): Internal error

which is a safety check to prevent resuming the guest when the CPUID data has
been truncated.  The problem is caused by shrinking of the max policies, which
is an ABI that needs handling compatibly between different versions of Xen.

Furthermore, shrinking of the default policies also breaks things in some
cases, because certain cpuid= settings in a VM config file which used to have
an effect will now be silently discarded.

This reverts commit 540d911c2813c3d8f4cdbb3f5672119e5e768a3d, as well as the
partial fix attempt in 81da2b544cbb003a5447c9b14d275746ad22ab37 (which added
one new case where cpuid= settings might not apply correctly) and restores the
same behaviour as Xen 4.15.

Fixes: 540d911c2813 ("x86/CPUID: shrink max_{,sub}leaf fields according to actual leaf contents")
Fixes: 81da2b544cbb ("x86/cpuid: prevent shrinking migrated policies max leaves")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Ian Jackson <iwj@xenproject.org>

Passing CI runs:
  https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/415822110
  https://cirrus-ci.com/build/4915643318272000

This supercedes
https://lore.kernel.org/xen-devel/20211124161649.83189-1-roger.pau@citrix.com/
which is a step in the right direction (it fixes the OSSTest breakage), but
incomplete (doesn't fix the potential cpuid= breakage).

For 4.16.  This is the 3rd breakage caused by 540d911c2813, and there is no
reasonable workaround.  Obviously, this revert isn't completely without risk,
but going wholesale back to the 4.15 behaviour is by far the safest option at
this point.
---
 tools/libs/guest/xg_cpuid_x86.c          |   7 ---
 tools/tests/cpu-policy/test-cpu-policy.c | 101 -------------------------------
 xen/arch/x86/cpuid.c                     |  10 ---
 xen/include/xen/lib/x86/cpuid.h          |   7 ---
 xen/lib/x86/cpuid.c                      |  39 ------------
 5 files changed, 164 deletions(-)

diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 3ffd5f683bec..198892ebdf45 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -638,13 +638,6 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
         }
     }
 
-    /*
-     * Do not try to shrink the policy if restoring, as that could cause
-     * guest visible changes in the maximum leaf fields.
-     */
-    if ( !restore )
-        x86_cpuid_policy_shrink_max_leaves(p);
-
     rc = x86_cpuid_copy_to_buffer(p, leaves, &nr_leaves);
     if ( rc )
     {
diff --git a/tools/tests/cpu-policy/test-cpu-policy.c b/tools/tests/cpu-policy/test-cpu-policy.c
index 75973298dfd5..ed450a099709 100644
--- a/tools/tests/cpu-policy/test-cpu-policy.c
+++ b/tools/tests/cpu-policy/test-cpu-policy.c
@@ -8,13 +8,10 @@
 #include <err.h>
 
 #include <xen-tools/libs.h>
-#include <xen/asm/x86-defns.h>
 #include <xen/asm/x86-vendors.h>
 #include <xen/lib/x86/cpu-policy.h>
 #include <xen/domctl.h>
 
-#define XSTATE_FP_SSE  (X86_XCR0_FP | X86_XCR0_SSE)
-
 static unsigned int nr_failures;
 #define fail(fmt, ...)                          \
 ({                                              \
@@ -573,103 +570,6 @@ static void test_cpuid_out_of_range_clearing(void)
     }
 }
 
-static void test_cpuid_maximum_leaf_shrinking(void)
-{
-    static const struct test {
-        const char *name;
-        struct cpuid_policy p;
-    } tests[] = {
-        {
-            .name = "basic",
-            .p = {
-                /* Very basic information only. */
-                .basic.max_leaf = 1,
-                .basic.raw_fms = 0xc2,
-            },
-        },
-        {
-            .name = "cache",
-            .p = {
-                /* Cache subleaves present. */
-                .basic.max_leaf = 4,
-                .cache.subleaf[0].type = 1,
-            },
-        },
-        {
-            .name = "feat#0",
-            .p = {
-                /* Subleaf 0 only with some valid bit. */
-                .basic.max_leaf = 7,
-                .feat.max_subleaf = 0,
-                .feat.fsgsbase = 1,
-            },
-        },
-        {
-            .name = "feat#1",
-            .p = {
-                /* Subleaf 1 only with some valid bit. */
-                .basic.max_leaf = 7,
-                .feat.max_subleaf = 1,
-                .feat.avx_vnni = 1,
-            },
-        },
-        {
-            .name = "topo",
-            .p = {
-                /* Topology subleaves present. */
-                .basic.max_leaf = 0xb,
-                .topo.subleaf[0].type = 1,
-            },
-        },
-        {
-            .name = "xstate",
-            .p = {
-                /* First subleaf always valid (and then non-zero). */
-                .basic.max_leaf = 0xd,
-                .xstate.xcr0_low = XSTATE_FP_SSE,
-            },
-        },
-        {
-            .name = "extd",
-            .p = {
-                /* Commonly available information only. */
-                .extd.max_leaf = 0x80000008,
-                .extd.maxphysaddr = 0x28,
-                .extd.maxlinaddr = 0x30,
-            },
-        },
-    };
-
-    printf("Testing CPUID maximum leaf shrinking:\n");
-
-    for ( size_t i = 0; i < ARRAY_SIZE(tests); ++i )
-    {
-        const struct test *t = &tests[i];
-        struct cpuid_policy *p = memdup(&t->p);
-
-        p->basic.max_leaf = ARRAY_SIZE(p->basic.raw) - 1;
-        p->feat.max_subleaf = ARRAY_SIZE(p->feat.raw) - 1;
-        p->extd.max_leaf = 0x80000000 | (ARRAY_SIZE(p->extd.raw) - 1);
-
-        x86_cpuid_policy_shrink_max_leaves(p);
-
-        /* Check the the resulting max (sub)leaf values against expecations. */
-        if ( p->basic.max_leaf != t->p.basic.max_leaf )
-             fail("  Test %s basic fail - expected %#x, got %#x\n",
-                  t->name, t->p.basic.max_leaf, p->basic.max_leaf);
-
-        if ( p->extd.max_leaf != t->p.extd.max_leaf )
-             fail("  Test %s extd fail - expected %#x, got %#x\n",
-                  t->name, t->p.extd.max_leaf, p->extd.max_leaf);
-
-        if ( p->feat.max_subleaf != t->p.feat.max_subleaf )
-             fail("  Test %s feat fail - expected %#x, got %#x\n",
-                  t->name, t->p.feat.max_subleaf, p->feat.max_subleaf);
-
-        free(p);
-    }
-}
-
 static void test_is_compatible_success(void)
 {
     static struct test {
@@ -785,7 +685,6 @@ int main(int argc, char **argv)
     test_cpuid_serialise_success();
     test_cpuid_deserialise_failure();
     test_cpuid_out_of_range_clearing();
-    test_cpuid_maximum_leaf_shrinking();
 
     test_msr_serialise_success();
     test_msr_deserialise_failure();
diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 8ac55f0806d0..151944f65702 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -353,8 +353,6 @@ static void __init calculate_host_policy(void)
         p->extd.raw[0xa].d |= ((1u << SVM_FEATURE_VMCBCLEAN) |
                                (1u << SVM_FEATURE_TSCRATEMSR));
     }
-
-    x86_cpuid_policy_shrink_max_leaves(p);
 }
 
 static void __init guest_common_default_feature_adjustments(uint32_t *fs)
@@ -434,8 +432,6 @@ static void __init calculate_pv_max_policy(void)
     recalculate_xstate(p);
 
     p->extd.raw[0xa] = EMPTY_LEAF; /* No SVM for PV guests. */
-
-    x86_cpuid_policy_shrink_max_leaves(p);
 }
 
 static void __init calculate_pv_def_policy(void)
@@ -456,8 +452,6 @@ static void __init calculate_pv_def_policy(void)
     sanitise_featureset(pv_featureset);
     cpuid_featureset_to_policy(pv_featureset, p);
     recalculate_xstate(p);
-
-    x86_cpuid_policy_shrink_max_leaves(p);
 }
 
 static void __init calculate_hvm_max_policy(void)
@@ -523,8 +517,6 @@ static void __init calculate_hvm_max_policy(void)
     sanitise_featureset(hvm_featureset);
     cpuid_featureset_to_policy(hvm_featureset, p);
     recalculate_xstate(p);
-
-    x86_cpuid_policy_shrink_max_leaves(p);
 }
 
 static void __init calculate_hvm_def_policy(void)
@@ -549,8 +541,6 @@ static void __init calculate_hvm_def_policy(void)
     sanitise_featureset(hvm_featureset);
     cpuid_featureset_to_policy(hvm_featureset, p);
     recalculate_xstate(p);
-
-    x86_cpuid_policy_shrink_max_leaves(p);
 }
 
 void __init init_guest_cpuid(void)
diff --git a/xen/include/xen/lib/x86/cpuid.h b/xen/include/xen/lib/x86/cpuid.h
index 2300faf03e2b..a4d254ea96e0 100644
--- a/xen/include/xen/lib/x86/cpuid.h
+++ b/xen/include/xen/lib/x86/cpuid.h
@@ -386,13 +386,6 @@ void x86_cpuid_policy_fill_native(struct cpuid_policy *p);
  */
 void x86_cpuid_policy_clear_out_of_range_leaves(struct cpuid_policy *p);
 
-/**
- * Shrink max leaf/subleaf values such that the last respective valid entry
- * isn't all blank.  While permitted by the spec, such extraneous leaves may
- * provide undue "hints" to guests.
- */
-void x86_cpuid_policy_shrink_max_leaves(struct cpuid_policy *p);
-
 #ifdef __XEN__
 #include <public/arch-x86/xen.h>
 typedef XEN_GUEST_HANDLE_64(xen_cpuid_leaf_t) cpuid_leaf_buffer_t;
diff --git a/xen/lib/x86/cpuid.c b/xen/lib/x86/cpuid.c
index 1409c254c8ea..8eb88314f53c 100644
--- a/xen/lib/x86/cpuid.c
+++ b/xen/lib/x86/cpuid.c
@@ -236,45 +236,6 @@ void x86_cpuid_policy_clear_out_of_range_leaves(struct cpuid_policy *p)
                 ARRAY_SIZE(p->extd.raw) - 1);
 }
 
-void x86_cpuid_policy_shrink_max_leaves(struct cpuid_policy *p)
-{
-    unsigned int i;
-
-    p->basic.raw[0x4] = p->cache.raw[0];
-
-    for ( i = p->feat.max_subleaf; i; --i )
-        if ( p->feat.raw[i].a | p->feat.raw[i].b |
-             p->feat.raw[i].c | p->feat.raw[i].d )
-            break;
-    p->feat.max_subleaf = i;
-    p->basic.raw[0x7] = p->feat.raw[i];
-
-    p->basic.raw[0xb] = p->topo.raw[0];
-
-    /*
-     * Due to the way xstate gets handled in the hypervisor (see
-     * recalculate_xstate()) there is (for now at least) no need to fiddle
-     * with the xstate subleaves (IOW we assume they're already in consistent
-     * shape, for coming from either hardware or recalculate_xstate()).
-     */
-    p->basic.raw[0xd] = p->xstate.raw[0];
-
-    for ( i = p->basic.max_leaf; i; --i )
-        if ( p->basic.raw[i].a | p->basic.raw[i].b |
-             p->basic.raw[i].c | p->basic.raw[i].d )
-            break;
-    p->basic.max_leaf = i;
-
-    for ( i = p->extd.max_leaf & 0xffff; i; --i )
-        if ( p->extd.raw[i].a | p->extd.raw[i].b |
-             p->extd.raw[i].c | p->extd.raw[i].d )
-            break;
-    if ( i | p->extd.raw[0].b | p->extd.raw[0].c | p->extd.raw[0].d )
-        p->extd.max_leaf = 0x80000000 | i;
-    else
-        p->extd.max_leaf = 0;
-}
-
 const uint32_t *x86_cpuid_lookup_deep_deps(uint32_t feature)
 {
     static const uint32_t deep_features[] = INIT_DEEP_FEATURES;
-- 
2.11.0


