Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E2B6D5C80
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 11:59:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517745.803562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjdRK-00039l-NU; Tue, 04 Apr 2023 09:58:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517745.803562; Tue, 04 Apr 2023 09:58:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjdRK-00037R-KI; Tue, 04 Apr 2023 09:58:58 +0000
Received: by outflank-mailman (input) for mailman id 517745;
 Tue, 04 Apr 2023 09:58:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Oy2y=73=citrix.com=prvs=4518c43dc=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pjdMR-0005bo-Qm
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 09:53:56 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a1b42c3-d2ce-11ed-85db-49a42c6b2330;
 Tue, 04 Apr 2023 11:53:52 +0200 (CEST)
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
X-Inumbo-ID: 9a1b42c3-d2ce-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680602032;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+gBx+55wWG2Xc8HbkdAE6jzV3hAbtN970XBfRirIXxI=;
  b=UCF0+KPNPzktodWBff3mT/1jmkk0sEMy6VSSA8VMX2UUtV0oh57Ss0sO
   KG3xCyeBEas0u6P0n3/FCXgn8oW4wVG0ROtacZybgn0SYnw3z55kgUjvf
   WxQVDTpi5uYQadEGOEFBSGMI/yiKW+c9mk18QQDhmYNv1PcmoK1OCiEky
   k=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 104656675
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:uS3LlKIe1D1PhJBLFE+RrpUlxSXFcZb7ZxGr2PjKsXjdYENS0mMCm
 2sYXW+OOvnfZ2TxcoxyaYTjpE5XusPdyoc2QAtlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPTwP9TlK6q4mhA4gRiPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c56AFhr5
 P4KDQwqVSyYmfDm5aiSUu9z05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWteGknHTgNRZfr0qYv/Ef6GnP1g1hlrPqNbI5f/TTHZkLwxjG+
 T+uE2LRBwBGbYOGkQS+ryijj8nQsAb8UbkwG+jtnhJtqALKnTFCYPEMbnOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHsljw2VsdUEuY6wBqQ0aeS6AGcbkAbShZRZdpgs9U5LQHGz
 XfQwYmvX2Y29uTIFzTErOz8QS6O1TY9IG47QD4GXy45xOLfu58h3jfVZ85lD/vg5jHqIg0c0
 wxmvQBn2eVL0JFVjfrilbzUq2ny/8aUF2bZ8i2SBzv4tV0hOeZJcqTysTDmAeB8wJF1p7Vrl
 FwNgICg4e8HFvlhfwTdEbxWTNlFCxtoWQAwYGKD/LF7rVxBA1b5IehtDMhWfS+FyPosdz7ze
 1P0sghM/pJVN3bCRfYpM9rsV5p7l/O6S4SNuhXogj1mO8AZSeN61Hs2OR74M57FyyDAbp3Ty
 b/EKJ3xXB72+IxszSasRvd17ILHMhsWnDuJLbiilkTP7FZrTCLNIVvzGAfUP79RAWLtiFm9z
 uuzwOPRlEoDCrSiPXCHmWPRRHhTRUUG6VnNg5Q/Xoa+zsBOQgnN19e5LWsdRrFY
IronPort-HdrOrdr: A9a23:xxqf5a2COqozSHZlDIYQaQqjBHYkLtp133Aq2lEZdPU0SKGlfq
 GV7ZEmPHrP4gr5N0tOpTntAse9qBDnhPxICOsqXYtKNTOO0AeVxelZhrcKqAeQeBEWmNQ96U
 9hGZIOcuEZDzJB/LvHCN/TKadd/DGFmprY+ts31x1WPGVXgzkL1XYANu6ceHcGIzVuNN4CO7
 e3wNFInDakcWR/VLXBOpFUN9KzweEijfjdEGc7OyI=
X-IronPort-AV: E=Sophos;i="5.98,317,1673931600"; 
   d="scan'208";a="104656675"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 11/15] x86/boot: Merge CPUID policy initialisation logic into cpu-policy.c
Date: Tue, 4 Apr 2023 10:52:18 +0100
Message-ID: <20230404095222.1373721-12-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230404095222.1373721-1-andrew.cooper3@citrix.com>
References: <20230404095222.1373721-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Switch to the newer cpu_policy nomenclature.  Do some easy cleanup of
includes.

No practical change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2:
 * New
---
 xen/arch/x86/cpu-policy.c             | 752 ++++++++++++++++++++++++
 xen/arch/x86/cpuid.c                  | 817 +-------------------------
 xen/arch/x86/hvm/hvm.c                |   1 -
 xen/arch/x86/include/asm/cpu-policy.h |   6 +
 xen/arch/x86/include/asm/cpuid.h      |  11 +-
 xen/arch/x86/pv/domain.c              |   1 +
 xen/arch/x86/setup.c                  |   2 -
 7 files changed, 764 insertions(+), 826 deletions(-)

diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index f6a2317ed7bd..83186e940ca7 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -1,13 +1,19 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
 #include <xen/cache.h>
 #include <xen/kernel.h>
+#include <xen/param.h>
 #include <xen/sched.h>
 
 #include <xen/lib/x86/cpu-policy.h>
 
+#include <asm/amd.h>
 #include <asm/cpu-policy.h>
+#include <asm/hvm/nestedhvm.h>
+#include <asm/hvm/svm/svm.h>
 #include <asm/msr-index.h>
+#include <asm/paging.h>
 #include <asm/setup.h>
+#include <asm/xstate.h>
 
 struct cpu_policy __ro_after_init     raw_cpu_policy;
 struct cpu_policy __ro_after_init    host_cpu_policy;
@@ -20,10 +26,332 @@ struct cpu_policy __ro_after_init hvm_max_cpu_policy;
 struct cpu_policy __ro_after_init hvm_def_cpu_policy;
 #endif
 
+const uint32_t known_features[] = INIT_KNOWN_FEATURES;
+
+static const uint32_t __initconst pv_max_featuremask[] = INIT_PV_MAX_FEATURES;
+static const uint32_t hvm_shadow_max_featuremask[] = INIT_HVM_SHADOW_MAX_FEATURES;
+static const uint32_t __initconst hvm_hap_max_featuremask[] =
+    INIT_HVM_HAP_MAX_FEATURES;
+static const uint32_t __initconst pv_def_featuremask[] = INIT_PV_DEF_FEATURES;
+static const uint32_t __initconst hvm_shadow_def_featuremask[] =
+    INIT_HVM_SHADOW_DEF_FEATURES;
+static const uint32_t __initconst hvm_hap_def_featuremask[] =
+    INIT_HVM_HAP_DEF_FEATURES;
+static const uint32_t deep_features[] = INIT_DEEP_FEATURES;
+
+static const struct feature_name {
+    const char *name;
+    unsigned int bit;
+} feature_names[] __initconstrel = INIT_FEATURE_NAMES;
+
+/*
+ * Parse a list of cpuid feature names -> bool, calling the callback for any
+ * matches found.
+ *
+ * always_inline, because this is init code only and we really don't want a
+ * function pointer call in the middle of the loop.
+ */
+static int __init always_inline parse_cpuid(
+    const char *s, void (*callback)(unsigned int feat, bool val))
+{
+    const char *ss;
+    int val, rc = 0;
+
+    do {
+        const struct feature_name *lhs, *rhs, *mid = NULL /* GCC... */;
+        const char *feat;
+
+        ss = strchr(s, ',');
+        if ( !ss )
+            ss = strchr(s, '\0');
+
+        /* Skip the 'no-' prefix for name comparisons. */
+        feat = s;
+        if ( strncmp(s, "no-", 3) == 0 )
+            feat += 3;
+
+        /* (Re)initalise lhs and rhs for binary search. */
+        lhs = feature_names;
+        rhs = feature_names + ARRAY_SIZE(feature_names);
+
+        while ( lhs < rhs )
+        {
+            int res;
+
+            mid = lhs + (rhs - lhs) / 2;
+            res = cmdline_strcmp(feat, mid->name);
+
+            if ( res < 0 )
+            {
+                rhs = mid;
+                continue;
+            }
+            if ( res > 0 )
+            {
+                lhs = mid + 1;
+                continue;
+            }
+
+            if ( (val = parse_boolean(mid->name, s, ss)) >= 0 )
+            {
+                callback(mid->bit, val);
+                mid = NULL;
+            }
+
+            break;
+        }
+
+        /*
+         * Mid being NULL means that the name and boolean were successfully
+         * identified.  Everything else is an error.
+         */
+        if ( mid )
+            rc = -EINVAL;
+
+        s = ss + 1;
+    } while ( *ss );
+
+    return rc;
+}
+
+static void __init cf_check _parse_xen_cpuid(unsigned int feat, bool val)
+{
+    if ( !val )
+        setup_clear_cpu_cap(feat);
+    else if ( feat == X86_FEATURE_RDRAND &&
+              (cpuid_ecx(1) & cpufeat_mask(X86_FEATURE_RDRAND)) )
+        setup_force_cpu_cap(X86_FEATURE_RDRAND);
+}
+
+static int __init cf_check parse_xen_cpuid(const char *s)
+{
+    return parse_cpuid(s, _parse_xen_cpuid);
+}
+custom_param("cpuid", parse_xen_cpuid);
+
+static bool __initdata dom0_cpuid_cmdline;
+static uint32_t __initdata dom0_enable_feat[FSCAPINTS];
+static uint32_t __initdata dom0_disable_feat[FSCAPINTS];
+
+static void __init cf_check _parse_dom0_cpuid(unsigned int feat, bool val)
+{
+    __set_bit  (feat, val ? dom0_enable_feat  : dom0_disable_feat);
+    __clear_bit(feat, val ? dom0_disable_feat : dom0_enable_feat );
+}
+
+static int __init cf_check parse_dom0_cpuid(const char *s)
+{
+    dom0_cpuid_cmdline = true;
+
+    return parse_cpuid(s, _parse_dom0_cpuid);
+}
+custom_param("dom0-cpuid", parse_dom0_cpuid);
+
+#define EMPTY_LEAF ((struct cpuid_leaf){})
+static void zero_leaves(struct cpuid_leaf *l,
+                        unsigned int first, unsigned int last)
+{
+    memset(&l[first], 0, sizeof(*l) * (last - first + 1));
+}
+
+static void sanitise_featureset(uint32_t *fs)
+{
+    /* for_each_set_bit() uses unsigned longs.  Extend with zeroes. */
+    uint32_t disabled_features[
+        ROUNDUP(FSCAPINTS, sizeof(unsigned long)/sizeof(uint32_t))] = {};
+    unsigned int i;
+
+    for ( i = 0; i < FSCAPINTS; ++i )
+    {
+        /* Clamp to known mask. */
+        fs[i] &= known_features[i];
+
+        /*
+         * Identify which features with deep dependencies have been
+         * disabled.
+         */
+        disabled_features[i] = ~fs[i] & deep_features[i];
+    }
+
+    for_each_set_bit(i, (void *)disabled_features,
+                     sizeof(disabled_features) * 8)
+    {
+        const uint32_t *dfs = x86_cpuid_lookup_deep_deps(i);
+        unsigned int j;
+
+        ASSERT(dfs); /* deep_features[] should guarentee this. */
+
+        for ( j = 0; j < FSCAPINTS; ++j )
+        {
+            fs[j] &= ~dfs[j];
+            disabled_features[j] &= ~dfs[j];
+        }
+    }
+}
+
+static void recalculate_xstate(struct cpu_policy *p)
+{
+    uint64_t xstates = XSTATE_FP_SSE;
+    uint32_t xstate_size = XSTATE_AREA_MIN_SIZE;
+    unsigned int i, Da1 = p->xstate.Da1;
+
+    /*
+     * The Da1 leaf is the only piece of information preserved in the common
+     * case.  Everything else is derived from other feature state.
+     */
+    memset(&p->xstate, 0, sizeof(p->xstate));
+
+    if ( !p->basic.xsave )
+        return;
+
+    if ( p->basic.avx )
+    {
+        xstates |= X86_XCR0_YMM;
+        xstate_size = max(xstate_size,
+                          xstate_offsets[X86_XCR0_YMM_POS] +
+                          xstate_sizes[X86_XCR0_YMM_POS]);
+    }
+
+    if ( p->feat.mpx )
+    {
+        xstates |= X86_XCR0_BNDREGS | X86_XCR0_BNDCSR;
+        xstate_size = max(xstate_size,
+                          xstate_offsets[X86_XCR0_BNDCSR_POS] +
+                          xstate_sizes[X86_XCR0_BNDCSR_POS]);
+    }
+
+    if ( p->feat.avx512f )
+    {
+        xstates |= X86_XCR0_OPMASK | X86_XCR0_ZMM | X86_XCR0_HI_ZMM;
+        xstate_size = max(xstate_size,
+                          xstate_offsets[X86_XCR0_HI_ZMM_POS] +
+                          xstate_sizes[X86_XCR0_HI_ZMM_POS]);
+    }
+
+    if ( p->feat.pku )
+    {
+        xstates |= X86_XCR0_PKRU;
+        xstate_size = max(xstate_size,
+                          xstate_offsets[X86_XCR0_PKRU_POS] +
+                          xstate_sizes[X86_XCR0_PKRU_POS]);
+    }
+
+    p->xstate.max_size  =  xstate_size;
+    p->xstate.xcr0_low  =  xstates & ~XSTATE_XSAVES_ONLY;
+    p->xstate.xcr0_high = (xstates & ~XSTATE_XSAVES_ONLY) >> 32;
+
+    p->xstate.Da1 = Da1;
+    if ( p->xstate.xsaves )
+    {
+        p->xstate.xss_low   =  xstates & XSTATE_XSAVES_ONLY;
+        p->xstate.xss_high  = (xstates & XSTATE_XSAVES_ONLY) >> 32;
+    }
+    else
+        xstates &= ~XSTATE_XSAVES_ONLY;
+
+    for ( i = 2; i < min(63ul, ARRAY_SIZE(p->xstate.comp)); ++i )
+    {
+        uint64_t curr_xstate = 1ul << i;
+
+        if ( !(xstates & curr_xstate) )
+            continue;
+
+        p->xstate.comp[i].size   = xstate_sizes[i];
+        p->xstate.comp[i].offset = xstate_offsets[i];
+        p->xstate.comp[i].xss    = curr_xstate & XSTATE_XSAVES_ONLY;
+        p->xstate.comp[i].align  = curr_xstate & xstate_align;
+    }
+}
+
+/*
+ * Misc adjustments to the policy.  Mostly clobbering reserved fields and
+ * duplicating shared fields.  Intentionally hidden fields are annotated.
+ */
+static void recalculate_misc(struct cpu_policy *p)
+{
+    p->basic.raw_fms &= 0x0fff0fff; /* Clobber Processor Type on Intel. */
+    p->basic.apic_id = 0; /* Dynamic. */
+
+    p->basic.raw[0x5] = EMPTY_LEAF; /* MONITOR not exposed to guests. */
+    p->basic.raw[0x6] = EMPTY_LEAF; /* Therm/Power not exposed to guests. */
+
+    p->basic.raw[0x8] = EMPTY_LEAF;
+
+    /* TODO: Rework topology logic. */
+    memset(p->topo.raw, 0, sizeof(p->topo.raw));
+
+    p->basic.raw[0xc] = EMPTY_LEAF;
+
+    p->extd.e1d &= ~CPUID_COMMON_1D_FEATURES;
+
+    /* Most of Power/RAS hidden from guests. */
+    p->extd.raw[0x7].a = p->extd.raw[0x7].b = p->extd.raw[0x7].c = 0;
+
+    p->extd.raw[0x8].d = 0;
+
+    switch ( p->x86_vendor )
+    {
+    case X86_VENDOR_INTEL:
+        p->basic.l2_nr_queries = 1; /* Fixed to 1 query. */
+        p->basic.raw[0x3] = EMPTY_LEAF; /* PSN - always hidden. */
+        p->basic.raw[0x9] = EMPTY_LEAF; /* DCA - always hidden. */
+
+        p->extd.vendor_ebx = 0;
+        p->extd.vendor_ecx = 0;
+        p->extd.vendor_edx = 0;
+
+        p->extd.raw[0x1].a = p->extd.raw[0x1].b = 0;
+
+        p->extd.raw[0x5] = EMPTY_LEAF;
+        p->extd.raw[0x6].a = p->extd.raw[0x6].b = p->extd.raw[0x6].d = 0;
+
+        p->extd.raw[0x8].a &= 0x0000ffff;
+        p->extd.raw[0x8].c = 0;
+        break;
+
+    case X86_VENDOR_AMD:
+    case X86_VENDOR_HYGON:
+        zero_leaves(p->basic.raw, 0x2, 0x3);
+        memset(p->cache.raw, 0, sizeof(p->cache.raw));
+        zero_leaves(p->basic.raw, 0x9, 0xa);
+
+        p->extd.vendor_ebx = p->basic.vendor_ebx;
+        p->extd.vendor_ecx = p->basic.vendor_ecx;
+        p->extd.vendor_edx = p->basic.vendor_edx;
+
+        p->extd.raw_fms = p->basic.raw_fms;
+        p->extd.raw[0x1].b &= 0xff00ffff;
+        p->extd.e1d |= p->basic._1d & CPUID_COMMON_1D_FEATURES;
+
+        p->extd.raw[0x8].a &= 0x0000ffff; /* GuestMaxPhysAddr hidden. */
+        p->extd.raw[0x8].c &= 0x0003f0ff;
+
+        p->extd.raw[0x9] = EMPTY_LEAF;
+
+        zero_leaves(p->extd.raw, 0xb, 0x18);
+
+        /* 0x19 - TLB details.  Pass through. */
+        /* 0x1a - Perf hints.   Pass through. */
+
+        p->extd.raw[0x1b] = EMPTY_LEAF; /* IBS - not supported. */
+        p->extd.raw[0x1c] = EMPTY_LEAF; /* LWP - not supported. */
+        p->extd.raw[0x1d] = EMPTY_LEAF; /* TopoExt Cache */
+        p->extd.raw[0x1e] = EMPTY_LEAF; /* TopoExt APIC ID/Core/Node */
+        p->extd.raw[0x1f] = EMPTY_LEAF; /* SEV */
+        p->extd.raw[0x20] = EMPTY_LEAF; /* Platform QoS */
+        break;
+    }
+}
+
 static void __init calculate_raw_policy(void)
 {
     struct cpu_policy *p = &raw_cpu_policy;
 
+    x86_cpuid_policy_fill_native(p);
+
+    /* Nothing good will come from Xen and libx86 disagreeing on vendor. */
+    ASSERT(p->x86_vendor == boot_cpu_data.x86_vendor);
+
     /* 0x000000ce  MSR_INTEL_PLATFORM_INFO */
     /* Was already added by probe_cpuid_faulting() */
 
@@ -34,9 +362,50 @@ static void __init calculate_raw_policy(void)
 static void __init calculate_host_policy(void)
 {
     struct cpu_policy *p = &host_cpu_policy;
+    unsigned int max_extd_leaf;
 
     *p = raw_cpu_policy;
 
+    p->basic.max_leaf =
+        min_t(uint32_t, p->basic.max_leaf,   ARRAY_SIZE(p->basic.raw) - 1);
+    p->feat.max_subleaf =
+        min_t(uint32_t, p->feat.max_subleaf, ARRAY_SIZE(p->feat.raw) - 1);
+
+    max_extd_leaf = p->extd.max_leaf;
+
+    /*
+     * For AMD/Hygon hardware before Zen3, we unilaterally modify LFENCE to be
+     * dispatch serialising for Spectre mitigations.  Extend max_extd_leaf
+     * beyond what hardware supports, to include the feature leaf containing
+     * this information.
+     */
+    if ( cpu_has_lfence_dispatch )
+        max_extd_leaf = max(max_extd_leaf, 0x80000021);
+
+    p->extd.max_leaf = 0x80000000 | min_t(uint32_t, max_extd_leaf & 0xffff,
+                                          ARRAY_SIZE(p->extd.raw) - 1);
+
+    x86_cpu_featureset_to_policy(boot_cpu_data.x86_capability, p);
+    recalculate_xstate(p);
+    recalculate_misc(p);
+
+    /* When vPMU is disabled, drop it from the host policy. */
+    if ( vpmu_mode == XENPMU_MODE_OFF )
+        p->basic.raw[0xa] = EMPTY_LEAF;
+
+    if ( p->extd.svm )
+    {
+        /* Clamp to implemented features which require hardware support. */
+        p->extd.raw[0xa].d &= ((1u << SVM_FEATURE_NPT) |
+                               (1u << SVM_FEATURE_LBRV) |
+                               (1u << SVM_FEATURE_NRIPS) |
+                               (1u << SVM_FEATURE_PAUSEFILTER) |
+                               (1u << SVM_FEATURE_DECODEASSISTS));
+        /* Enable features which are always emulated. */
+        p->extd.raw[0xa].d |= ((1u << SVM_FEATURE_VMCBCLEAN) |
+                               (1u << SVM_FEATURE_TSCRATEMSR));
+    }
+
     /* 0x000000ce  MSR_INTEL_PLATFORM_INFO */
     /* probe_cpuid_faulting() sanity checks presence of MISC_FEATURES_ENABLES */
     p->platform_info.cpuid_faulting = cpu_has_cpuid_faulting;
@@ -51,11 +420,88 @@ static void __init calculate_host_policy(void)
          ARCH_CAPS_PBRSB_NO);
 }
 
+static void __init guest_common_default_feature_adjustments(uint32_t *fs)
+{
+    /*
+     * IvyBridge client parts suffer from leakage of RDRAND data due to SRBDS
+     * (XSA-320 / CVE-2020-0543), and won't be receiving microcode to
+     * compensate.
+     *
+     * Mitigate by hiding RDRAND from guests by default, unless explicitly
+     * overridden on the Xen command line (cpuid=rdrand).  Irrespective of the
+     * default setting, guests can use RDRAND if explicitly enabled
+     * (cpuid="host,rdrand=1") in the VM's config file, and VMs which were
+     * previously using RDRAND can migrate in.
+     */
+    if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL &&
+         boot_cpu_data.x86 == 6 && boot_cpu_data.x86_model == 0x3a &&
+         cpu_has_rdrand && !is_forced_cpu_cap(X86_FEATURE_RDRAND) )
+        __clear_bit(X86_FEATURE_RDRAND, fs);
+
+    /*
+     * On certain hardware, speculative or errata workarounds can result in
+     * TSX being placed in "force-abort" mode, where it doesn't actually
+     * function as expected, but is technically compatible with the ISA.
+     *
+     * Do not advertise RTM to guests by default if it won't actually work.
+     */
+    if ( rtm_disabled )
+        __clear_bit(X86_FEATURE_RTM, fs);
+}
+
+static void __init guest_common_feature_adjustments(uint32_t *fs)
+{
+    /* Unconditionally claim to be able to set the hypervisor bit. */
+    __set_bit(X86_FEATURE_HYPERVISOR, fs);
+
+    /*
+     * If IBRS is offered to the guest, unconditionally offer STIBP.  It is a
+     * nop on non-HT hardware, and has this behaviour to make heterogeneous
+     * setups easier to manage.
+     */
+    if ( test_bit(X86_FEATURE_IBRSB, fs) )
+        __set_bit(X86_FEATURE_STIBP, fs);
+    if ( test_bit(X86_FEATURE_IBRS, fs) )
+        __set_bit(X86_FEATURE_AMD_STIBP, fs);
+
+    /*
+     * On hardware which supports IBRS/IBPB, we can offer IBPB independently
+     * of IBRS by using the AMD feature bit.  An administrator may wish for
+     * performance reasons to offer IBPB without IBRS.
+     */
+    if ( host_cpu_policy.feat.ibrsb )
+        __set_bit(X86_FEATURE_IBPB, fs);
+}
+
 static void __init calculate_pv_max_policy(void)
 {
     struct cpu_policy *p = &pv_max_cpu_policy;
+    uint32_t fs[FSCAPINTS];
+    unsigned int i;
 
     *p = host_cpu_policy;
+    x86_cpu_policy_to_featureset(p, fs);
+
+    for ( i = 0; i < ARRAY_SIZE(fs); ++i )
+        fs[i] &= pv_max_featuremask[i];
+
+    /*
+     * If Xen isn't virtualising MSR_SPEC_CTRL for PV guests (functional
+     * availability, or admin choice), hide the feature.
+     */
+    if ( !boot_cpu_has(X86_FEATURE_SC_MSR_PV) )
+    {
+        __clear_bit(X86_FEATURE_IBRSB, fs);
+        __clear_bit(X86_FEATURE_IBRS, fs);
+    }
+
+    guest_common_feature_adjustments(fs);
+
+    sanitise_featureset(fs);
+    x86_cpu_featureset_to_policy(fs, p);
+    recalculate_xstate(p);
+
+    p->extd.raw[0xa] = EMPTY_LEAF; /* No SVM for PV guests. */
 
     p->arch_caps.raw = 0; /* Not supported yet. */
 }
@@ -63,15 +509,112 @@ static void __init calculate_pv_max_policy(void)
 static void __init calculate_pv_def_policy(void)
 {
     struct cpu_policy *p = &pv_def_cpu_policy;
+    uint32_t fs[FSCAPINTS];
+    unsigned int i;
 
     *p = pv_max_cpu_policy;
+    x86_cpu_policy_to_featureset(p, fs);
+
+    for ( i = 0; i < ARRAY_SIZE(fs); ++i )
+        fs[i] &= pv_def_featuremask[i];
+
+    guest_common_feature_adjustments(fs);
+    guest_common_default_feature_adjustments(fs);
+
+    sanitise_featureset(fs);
+    x86_cpu_featureset_to_policy(fs, p);
+    recalculate_xstate(p);
 }
 
 static void __init calculate_hvm_max_policy(void)
 {
     struct cpu_policy *p = &hvm_max_cpu_policy;
+    uint32_t fs[FSCAPINTS];
+    unsigned int i;
+    const uint32_t *mask;
 
     *p = host_cpu_policy;
+    x86_cpu_policy_to_featureset(p, fs);
+
+    mask = hvm_hap_supported() ?
+        hvm_hap_max_featuremask : hvm_shadow_max_featuremask;
+
+    for ( i = 0; i < ARRAY_SIZE(fs); ++i )
+        fs[i] &= mask[i];
+
+    /*
+     * Xen can provide an (x2)APIC emulation to HVM guests even if the host's
+     * (x2)APIC isn't enabled.
+     */
+    __set_bit(X86_FEATURE_APIC, fs);
+    __set_bit(X86_FEATURE_X2APIC, fs);
+
+    /*
+     * We don't support EFER.LMSLE at all.  AMD has dropped the feature from
+     * hardware and allocated a CPUID bit to indicate its absence.
+     */
+    __set_bit(X86_FEATURE_NO_LMSL, fs);
+
+    /*
+     * On AMD, PV guests are entirely unable to use SYSENTER as Xen runs in
+     * long mode (and init_amd() has cleared it out of host capabilities), but
+     * HVM guests are able if running in protected mode.
+     */
+    if ( (boot_cpu_data.x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) &&
+         raw_cpu_policy.basic.sep )
+        __set_bit(X86_FEATURE_SEP, fs);
+
+    /*
+     * VIRT_SSBD is exposed in the default policy as a result of
+     * amd_virt_spec_ctrl being set, it also needs exposing in the max policy.
+     */
+    if ( amd_virt_spec_ctrl )
+        __set_bit(X86_FEATURE_VIRT_SSBD, fs);
+
+    /*
+     * If Xen isn't virtualising MSR_SPEC_CTRL for HVM guests (functional
+     * availability, or admin choice), hide the feature.
+     */
+    if ( !boot_cpu_has(X86_FEATURE_SC_MSR_HVM) )
+    {
+        __clear_bit(X86_FEATURE_IBRSB, fs);
+        __clear_bit(X86_FEATURE_IBRS, fs);
+    }
+    else if ( boot_cpu_has(X86_FEATURE_AMD_SSBD) )
+        /*
+         * If SPEC_CTRL.SSBD is available VIRT_SPEC_CTRL.SSBD can be exposed
+         * and implemented using the former. Expose in the max policy only as
+         * the preference is for guests to use SPEC_CTRL.SSBD if available.
+         */
+        __set_bit(X86_FEATURE_VIRT_SSBD, fs);
+
+    /*
+     * With VT-x, some features are only supported by Xen if dedicated
+     * hardware support is also available.
+     */
+    if ( cpu_has_vmx )
+    {
+        if ( !cpu_has_vmx_mpx )
+            __clear_bit(X86_FEATURE_MPX, fs);
+
+        if ( !cpu_has_vmx_xsaves )
+            __clear_bit(X86_FEATURE_XSAVES, fs);
+    }
+
+    /*
+     * Xen doesn't use PKS, so the guest support for it has opted to not use
+     * the VMCS load/save controls for efficiency reasons.  This depends on
+     * the exact vmentry/exit behaviour, so don't expose PKS in other
+     * situations until someone has cross-checked the behaviour for safety.
+     */
+    if ( !cpu_has_vmx )
+        __clear_bit(X86_FEATURE_PKS, fs);
+
+    guest_common_feature_adjustments(fs);
+
+    sanitise_featureset(fs);
+    x86_cpu_featureset_to_policy(fs, p);
+    recalculate_xstate(p);
 
     /* It's always possible to emulate CPUID faulting for HVM guests */
     p->platform_info.cpuid_faulting = true;
@@ -82,8 +625,32 @@ static void __init calculate_hvm_max_policy(void)
 static void __init calculate_hvm_def_policy(void)
 {
     struct cpu_policy *p = &hvm_def_cpu_policy;
+    uint32_t fs[FSCAPINTS];
+    unsigned int i;
+    const uint32_t *mask;
 
     *p = hvm_max_cpu_policy;
+    x86_cpu_policy_to_featureset(p, fs);
+
+    mask = hvm_hap_supported() ?
+        hvm_hap_def_featuremask : hvm_shadow_def_featuremask;
+
+    for ( i = 0; i < ARRAY_SIZE(fs); ++i )
+        fs[i] &= mask[i];
+
+    guest_common_feature_adjustments(fs);
+    guest_common_default_feature_adjustments(fs);
+
+    /*
+     * Only expose VIRT_SSBD if AMD_SSBD is not available, and thus
+     * amd_virt_spec_ctrl is set.
+     */
+    if ( amd_virt_spec_ctrl )
+        __set_bit(X86_FEATURE_VIRT_SSBD, fs);
+
+    sanitise_featureset(fs);
+    x86_cpu_featureset_to_policy(fs, p);
+    recalculate_xstate(p);
 }
 
 void __init init_guest_cpu_policies(void)
@@ -149,3 +716,188 @@ int init_domain_cpu_policy(struct domain *d)
 
     return 0;
 }
+
+void recalculate_cpuid_policy(struct domain *d)
+{
+    struct cpu_policy *p = d->arch.cpuid;
+    const struct cpu_policy *max = is_pv_domain(d)
+        ? (IS_ENABLED(CONFIG_PV)  ?  &pv_max_cpu_policy : NULL)
+        : (IS_ENABLED(CONFIG_HVM) ? &hvm_max_cpu_policy : NULL);
+    uint32_t fs[FSCAPINTS], max_fs[FSCAPINTS];
+    unsigned int i;
+
+    if ( !max )
+    {
+        ASSERT_UNREACHABLE();
+        return;
+    }
+
+    p->x86_vendor = x86_cpuid_lookup_vendor(
+        p->basic.vendor_ebx, p->basic.vendor_ecx, p->basic.vendor_edx);
+
+    p->basic.max_leaf   = min(p->basic.max_leaf,   max->basic.max_leaf);
+    p->feat.max_subleaf = min(p->feat.max_subleaf, max->feat.max_subleaf);
+    p->extd.max_leaf    = 0x80000000 | min(p->extd.max_leaf & 0xffff,
+                                           ((p->x86_vendor & (X86_VENDOR_AMD |
+                                                              X86_VENDOR_HYGON))
+                                            ? CPUID_GUEST_NR_EXTD_AMD
+                                            : CPUID_GUEST_NR_EXTD_INTEL) - 1);
+
+    x86_cpu_policy_to_featureset(p, fs);
+    x86_cpu_policy_to_featureset(max, max_fs);
+
+    if ( is_hvm_domain(d) )
+    {
+        /*
+         * HVM domains using Shadow paging have further restrictions on their
+         * available paging features.
+         */
+        if ( !hap_enabled(d) )
+        {
+            for ( i = 0; i < ARRAY_SIZE(max_fs); i++ )
+                max_fs[i] &= hvm_shadow_max_featuremask[i];
+        }
+
+        /* Hide nested-virt if it hasn't been explicitly configured. */
+        if ( !nestedhvm_enabled(d) )
+        {
+            __clear_bit(X86_FEATURE_VMX, max_fs);
+            __clear_bit(X86_FEATURE_SVM, max_fs);
+        }
+    }
+
+    /*
+     * Allow the toolstack to set HTT, X2APIC and CMP_LEGACY.  These bits
+     * affect how to interpret topology information in other cpuid leaves.
+     */
+    __set_bit(X86_FEATURE_HTT, max_fs);
+    __set_bit(X86_FEATURE_X2APIC, max_fs);
+    __set_bit(X86_FEATURE_CMP_LEGACY, max_fs);
+
+    /*
+     * 32bit PV domains can't use any Long Mode features, and cannot use
+     * SYSCALL on non-AMD hardware.
+     */
+    if ( is_pv_32bit_domain(d) )
+    {
+        __clear_bit(X86_FEATURE_LM, max_fs);
+        if ( !(boot_cpu_data.x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
+            __clear_bit(X86_FEATURE_SYSCALL, max_fs);
+    }
+
+    /* Clamp the toolstacks choices to reality. */
+    for ( i = 0; i < ARRAY_SIZE(fs); i++ )
+        fs[i] &= max_fs[i];
+
+    if ( p->basic.max_leaf < XSTATE_CPUID )
+        __clear_bit(X86_FEATURE_XSAVE, fs);
+
+    sanitise_featureset(fs);
+
+    /* Fold host's FDP_EXCP_ONLY and NO_FPU_SEL into guest's view. */
+    fs[FEATURESET_7b0] &= ~(cpufeat_mask(X86_FEATURE_FDP_EXCP_ONLY) |
+                            cpufeat_mask(X86_FEATURE_NO_FPU_SEL));
+    fs[FEATURESET_7b0] |= (host_cpu_policy.feat._7b0 &
+                           (cpufeat_mask(X86_FEATURE_FDP_EXCP_ONLY) |
+                            cpufeat_mask(X86_FEATURE_NO_FPU_SEL)));
+
+    x86_cpu_featureset_to_policy(fs, p);
+
+    /* Pass host cacheline size through to guests. */
+    p->basic.clflush_size = max->basic.clflush_size;
+
+    p->extd.maxphysaddr = min(p->extd.maxphysaddr, max->extd.maxphysaddr);
+    p->extd.maxphysaddr = min_t(uint8_t, p->extd.maxphysaddr,
+                                paging_max_paddr_bits(d));
+    p->extd.maxphysaddr = max_t(uint8_t, p->extd.maxphysaddr,
+                                (p->basic.pae || p->basic.pse36) ? 36 : 32);
+
+    p->extd.maxlinaddr = p->extd.lm ? 48 : 32;
+
+    recalculate_xstate(p);
+    recalculate_misc(p);
+
+    for ( i = 0; i < ARRAY_SIZE(p->cache.raw); ++i )
+    {
+        if ( p->cache.subleaf[i].type >= 1 &&
+             p->cache.subleaf[i].type <= 3 )
+        {
+            /* Subleaf has a valid cache type. Zero reserved fields. */
+            p->cache.raw[i].a &= 0xffffc3ffu;
+            p->cache.raw[i].d &= 0x00000007u;
+        }
+        else
+        {
+            /* Subleaf is not valid.  Zero the rest of the union. */
+            zero_leaves(p->cache.raw, i, ARRAY_SIZE(p->cache.raw) - 1);
+            break;
+        }
+    }
+
+    if ( vpmu_mode == XENPMU_MODE_OFF ||
+         ((vpmu_mode & XENPMU_MODE_ALL) && !is_hardware_domain(d)) )
+        p->basic.raw[0xa] = EMPTY_LEAF;
+
+    if ( !p->extd.svm )
+        p->extd.raw[0xa] = EMPTY_LEAF;
+
+    if ( !p->extd.page1gb )
+        p->extd.raw[0x19] = EMPTY_LEAF;
+}
+
+void __init init_dom0_cpuid_policy(struct domain *d)
+{
+    struct cpu_policy *p = d->arch.cpuid;
+
+    /* dom0 can't migrate.  Give it ITSC if available. */
+    if ( cpu_has_itsc )
+        p->extd.itsc = true;
+
+    /*
+     * Expose the "hardware speculation behaviour" bits of ARCH_CAPS to dom0,
+     * so dom0 can turn off workarounds as appropriate.  Temporary, until the
+     * domain policy logic gains a better understanding of MSRs.
+     */
+    if ( cpu_has_arch_caps )
+        p->feat.arch_caps = true;
+
+    /* Apply dom0-cpuid= command line settings, if provided. */
+    if ( dom0_cpuid_cmdline )
+    {
+        uint32_t fs[FSCAPINTS];
+        unsigned int i;
+
+        x86_cpu_policy_to_featureset(p, fs);
+
+        for ( i = 0; i < ARRAY_SIZE(fs); ++i )
+        {
+            fs[i] |=  dom0_enable_feat [i];
+            fs[i] &= ~dom0_disable_feat[i];
+        }
+
+        x86_cpu_featureset_to_policy(fs, p);
+
+        recalculate_cpuid_policy(d);
+    }
+}
+
+static void __init __maybe_unused build_assertions(void)
+{
+    BUILD_BUG_ON(ARRAY_SIZE(known_features) != FSCAPINTS);
+    BUILD_BUG_ON(ARRAY_SIZE(pv_max_featuremask) != FSCAPINTS);
+    BUILD_BUG_ON(ARRAY_SIZE(hvm_shadow_max_featuremask) != FSCAPINTS);
+    BUILD_BUG_ON(ARRAY_SIZE(hvm_hap_max_featuremask) != FSCAPINTS);
+    BUILD_BUG_ON(ARRAY_SIZE(deep_features) != FSCAPINTS);
+
+    /* Find some more clever allocation scheme if this trips. */
+    BUILD_BUG_ON(sizeof(struct cpu_policy) > PAGE_SIZE);
+
+    BUILD_BUG_ON(sizeof(raw_cpu_policy.basic) !=
+                 sizeof(raw_cpu_policy.basic.raw));
+    BUILD_BUG_ON(sizeof(raw_cpu_policy.feat) !=
+                 sizeof(raw_cpu_policy.feat.raw));
+    BUILD_BUG_ON(sizeof(raw_cpu_policy.xstate) !=
+                 sizeof(raw_cpu_policy.xstate.raw));
+    BUILD_BUG_ON(sizeof(raw_cpu_policy.extd) !=
+                 sizeof(raw_cpu_policy.extd.raw));
+}
diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 5eb5f1893516..3f20c342fde8 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -1,638 +1,14 @@
-#include <xen/init.h>
-#include <xen/lib.h>
-#include <xen/param.h>
 #include <xen/sched.h>
-#include <xen/nospec.h>
-#include <asm/amd.h>
+#include <xen/types.h>
+
+#include <public/hvm/params.h>
+
 #include <asm/cpu-policy.h>
 #include <asm/cpuid.h>
-#include <asm/hvm/hvm.h>
-#include <asm/hvm/nestedhvm.h>
-#include <asm/hvm/svm/svm.h>
 #include <asm/hvm/viridian.h>
-#include <asm/hvm/vmx/vmcs.h>
-#include <asm/paging.h>
-#include <asm/processor.h>
 #include <asm/xstate.h>
 
-const uint32_t known_features[] = INIT_KNOWN_FEATURES;
-
-static const uint32_t __initconst pv_max_featuremask[] = INIT_PV_MAX_FEATURES;
-static const uint32_t hvm_shadow_max_featuremask[] = INIT_HVM_SHADOW_MAX_FEATURES;
-static const uint32_t __initconst hvm_hap_max_featuremask[] =
-    INIT_HVM_HAP_MAX_FEATURES;
-static const uint32_t __initconst pv_def_featuremask[] = INIT_PV_DEF_FEATURES;
-static const uint32_t __initconst hvm_shadow_def_featuremask[] =
-    INIT_HVM_SHADOW_DEF_FEATURES;
-static const uint32_t __initconst hvm_hap_def_featuremask[] =
-    INIT_HVM_HAP_DEF_FEATURES;
-static const uint32_t deep_features[] = INIT_DEEP_FEATURES;
-
-static const struct feature_name {
-    const char *name;
-    unsigned int bit;
-} feature_names[] __initconstrel = INIT_FEATURE_NAMES;
-
-/*
- * Parse a list of cpuid feature names -> bool, calling the callback for any
- * matches found.
- *
- * always_inline, because this is init code only and we really don't want a
- * function pointer call in the middle of the loop.
- */
-static int __init always_inline parse_cpuid(
-    const char *s, void (*callback)(unsigned int feat, bool val))
-{
-    const char *ss;
-    int val, rc = 0;
-
-    do {
-        const struct feature_name *lhs, *rhs, *mid = NULL /* GCC... */;
-        const char *feat;
-
-        ss = strchr(s, ',');
-        if ( !ss )
-            ss = strchr(s, '\0');
-
-        /* Skip the 'no-' prefix for name comparisons. */
-        feat = s;
-        if ( strncmp(s, "no-", 3) == 0 )
-            feat += 3;
-
-        /* (Re)initalise lhs and rhs for binary search. */
-        lhs = feature_names;
-        rhs = feature_names + ARRAY_SIZE(feature_names);
-
-        while ( lhs < rhs )
-        {
-            int res;
-
-            mid = lhs + (rhs - lhs) / 2;
-            res = cmdline_strcmp(feat, mid->name);
-
-            if ( res < 0 )
-            {
-                rhs = mid;
-                continue;
-            }
-            if ( res > 0 )
-            {
-                lhs = mid + 1;
-                continue;
-            }
-
-            if ( (val = parse_boolean(mid->name, s, ss)) >= 0 )
-            {
-                callback(mid->bit, val);
-                mid = NULL;
-            }
-
-            break;
-        }
-
-        /*
-         * Mid being NULL means that the name and boolean were successfully
-         * identified.  Everything else is an error.
-         */
-        if ( mid )
-            rc = -EINVAL;
-
-        s = ss + 1;
-    } while ( *ss );
-
-    return rc;
-}
-
-static void __init cf_check _parse_xen_cpuid(unsigned int feat, bool val)
-{
-    if ( !val )
-        setup_clear_cpu_cap(feat);
-    else if ( feat == X86_FEATURE_RDRAND &&
-              (cpuid_ecx(1) & cpufeat_mask(X86_FEATURE_RDRAND)) )
-        setup_force_cpu_cap(X86_FEATURE_RDRAND);
-}
-
-static int __init cf_check parse_xen_cpuid(const char *s)
-{
-    return parse_cpuid(s, _parse_xen_cpuid);
-}
-custom_param("cpuid", parse_xen_cpuid);
-
-static bool __initdata dom0_cpuid_cmdline;
-static uint32_t __initdata dom0_enable_feat[FSCAPINTS];
-static uint32_t __initdata dom0_disable_feat[FSCAPINTS];
-
-static void __init cf_check _parse_dom0_cpuid(unsigned int feat, bool val)
-{
-    __set_bit  (feat, val ? dom0_enable_feat  : dom0_disable_feat);
-    __clear_bit(feat, val ? dom0_disable_feat : dom0_enable_feat );
-}
-
-static int __init cf_check parse_dom0_cpuid(const char *s)
-{
-    dom0_cpuid_cmdline = true;
-
-    return parse_cpuid(s, _parse_dom0_cpuid);
-}
-custom_param("dom0-cpuid", parse_dom0_cpuid);
-
 #define EMPTY_LEAF ((struct cpuid_leaf){})
-static void zero_leaves(struct cpuid_leaf *l,
-                        unsigned int first, unsigned int last)
-{
-    memset(&l[first], 0, sizeof(*l) * (last - first + 1));
-}
-
-static void sanitise_featureset(uint32_t *fs)
-{
-    /* for_each_set_bit() uses unsigned longs.  Extend with zeroes. */
-    uint32_t disabled_features[
-        ROUNDUP(FSCAPINTS, sizeof(unsigned long)/sizeof(uint32_t))] = {};
-    unsigned int i;
-
-    for ( i = 0; i < FSCAPINTS; ++i )
-    {
-        /* Clamp to known mask. */
-        fs[i] &= known_features[i];
-
-        /*
-         * Identify which features with deep dependencies have been
-         * disabled.
-         */
-        disabled_features[i] = ~fs[i] & deep_features[i];
-    }
-
-    for_each_set_bit(i, (void *)disabled_features,
-                     sizeof(disabled_features) * 8)
-    {
-        const uint32_t *dfs = x86_cpuid_lookup_deep_deps(i);
-        unsigned int j;
-
-        ASSERT(dfs); /* deep_features[] should guarentee this. */
-
-        for ( j = 0; j < FSCAPINTS; ++j )
-        {
-            fs[j] &= ~dfs[j];
-            disabled_features[j] &= ~dfs[j];
-        }
-    }
-}
-
-static void recalculate_xstate(struct cpuid_policy *p)
-{
-    uint64_t xstates = XSTATE_FP_SSE;
-    uint32_t xstate_size = XSTATE_AREA_MIN_SIZE;
-    unsigned int i, Da1 = p->xstate.Da1;
-
-    /*
-     * The Da1 leaf is the only piece of information preserved in the common
-     * case.  Everything else is derived from other feature state.
-     */
-    memset(&p->xstate, 0, sizeof(p->xstate));
-
-    if ( !p->basic.xsave )
-        return;
-
-    if ( p->basic.avx )
-    {
-        xstates |= X86_XCR0_YMM;
-        xstate_size = max(xstate_size,
-                          xstate_offsets[X86_XCR0_YMM_POS] +
-                          xstate_sizes[X86_XCR0_YMM_POS]);
-    }
-
-    if ( p->feat.mpx )
-    {
-        xstates |= X86_XCR0_BNDREGS | X86_XCR0_BNDCSR;
-        xstate_size = max(xstate_size,
-                          xstate_offsets[X86_XCR0_BNDCSR_POS] +
-                          xstate_sizes[X86_XCR0_BNDCSR_POS]);
-    }
-
-    if ( p->feat.avx512f )
-    {
-        xstates |= X86_XCR0_OPMASK | X86_XCR0_ZMM | X86_XCR0_HI_ZMM;
-        xstate_size = max(xstate_size,
-                          xstate_offsets[X86_XCR0_HI_ZMM_POS] +
-                          xstate_sizes[X86_XCR0_HI_ZMM_POS]);
-    }
-
-    if ( p->feat.pku )
-    {
-        xstates |= X86_XCR0_PKRU;
-        xstate_size = max(xstate_size,
-                          xstate_offsets[X86_XCR0_PKRU_POS] +
-                          xstate_sizes[X86_XCR0_PKRU_POS]);
-    }
-
-    p->xstate.max_size  =  xstate_size;
-    p->xstate.xcr0_low  =  xstates & ~XSTATE_XSAVES_ONLY;
-    p->xstate.xcr0_high = (xstates & ~XSTATE_XSAVES_ONLY) >> 32;
-
-    p->xstate.Da1 = Da1;
-    if ( p->xstate.xsaves )
-    {
-        p->xstate.xss_low   =  xstates & XSTATE_XSAVES_ONLY;
-        p->xstate.xss_high  = (xstates & XSTATE_XSAVES_ONLY) >> 32;
-    }
-    else
-        xstates &= ~XSTATE_XSAVES_ONLY;
-
-    for ( i = 2; i < min(63ul, ARRAY_SIZE(p->xstate.comp)); ++i )
-    {
-        uint64_t curr_xstate = 1ul << i;
-
-        if ( !(xstates & curr_xstate) )
-            continue;
-
-        p->xstate.comp[i].size   = xstate_sizes[i];
-        p->xstate.comp[i].offset = xstate_offsets[i];
-        p->xstate.comp[i].xss    = curr_xstate & XSTATE_XSAVES_ONLY;
-        p->xstate.comp[i].align  = curr_xstate & xstate_align;
-    }
-}
-
-/*
- * Misc adjustments to the policy.  Mostly clobbering reserved fields and
- * duplicating shared fields.  Intentionally hidden fields are annotated.
- */
-static void recalculate_misc(struct cpuid_policy *p)
-{
-    p->basic.raw_fms &= 0x0fff0fff; /* Clobber Processor Type on Intel. */
-    p->basic.apic_id = 0; /* Dynamic. */
-
-    p->basic.raw[0x5] = EMPTY_LEAF; /* MONITOR not exposed to guests. */
-    p->basic.raw[0x6] = EMPTY_LEAF; /* Therm/Power not exposed to guests. */
-
-    p->basic.raw[0x8] = EMPTY_LEAF;
-
-    /* TODO: Rework topology logic. */
-    memset(p->topo.raw, 0, sizeof(p->topo.raw));
-
-    p->basic.raw[0xc] = EMPTY_LEAF;
-
-    p->extd.e1d &= ~CPUID_COMMON_1D_FEATURES;
-
-    /* Most of Power/RAS hidden from guests. */
-    p->extd.raw[0x7].a = p->extd.raw[0x7].b = p->extd.raw[0x7].c = 0;
-
-    p->extd.raw[0x8].d = 0;
-
-    switch ( p->x86_vendor )
-    {
-    case X86_VENDOR_INTEL:
-        p->basic.l2_nr_queries = 1; /* Fixed to 1 query. */
-        p->basic.raw[0x3] = EMPTY_LEAF; /* PSN - always hidden. */
-        p->basic.raw[0x9] = EMPTY_LEAF; /* DCA - always hidden. */
-
-        p->extd.vendor_ebx = 0;
-        p->extd.vendor_ecx = 0;
-        p->extd.vendor_edx = 0;
-
-        p->extd.raw[0x1].a = p->extd.raw[0x1].b = 0;
-
-        p->extd.raw[0x5] = EMPTY_LEAF;
-        p->extd.raw[0x6].a = p->extd.raw[0x6].b = p->extd.raw[0x6].d = 0;
-
-        p->extd.raw[0x8].a &= 0x0000ffff;
-        p->extd.raw[0x8].c = 0;
-        break;
-
-    case X86_VENDOR_AMD:
-    case X86_VENDOR_HYGON:
-        zero_leaves(p->basic.raw, 0x2, 0x3);
-        memset(p->cache.raw, 0, sizeof(p->cache.raw));
-        zero_leaves(p->basic.raw, 0x9, 0xa);
-
-        p->extd.vendor_ebx = p->basic.vendor_ebx;
-        p->extd.vendor_ecx = p->basic.vendor_ecx;
-        p->extd.vendor_edx = p->basic.vendor_edx;
-
-        p->extd.raw_fms = p->basic.raw_fms;
-        p->extd.raw[0x1].b &= 0xff00ffff;
-        p->extd.e1d |= p->basic._1d & CPUID_COMMON_1D_FEATURES;
-
-        p->extd.raw[0x8].a &= 0x0000ffff; /* GuestMaxPhysAddr hidden. */
-        p->extd.raw[0x8].c &= 0x0003f0ff;
-
-        p->extd.raw[0x9] = EMPTY_LEAF;
-
-        zero_leaves(p->extd.raw, 0xb, 0x18);
-
-        /* 0x19 - TLB details.  Pass through. */
-        /* 0x1a - Perf hints.   Pass through. */
-
-        p->extd.raw[0x1b] = EMPTY_LEAF; /* IBS - not supported. */
-        p->extd.raw[0x1c] = EMPTY_LEAF; /* LWP - not supported. */
-        p->extd.raw[0x1d] = EMPTY_LEAF; /* TopoExt Cache */
-        p->extd.raw[0x1e] = EMPTY_LEAF; /* TopoExt APIC ID/Core/Node */
-        p->extd.raw[0x1f] = EMPTY_LEAF; /* SEV */
-        p->extd.raw[0x20] = EMPTY_LEAF; /* Platform QoS */
-        break;
-    }
-}
-
-static void __init calculate_raw_policy(void)
-{
-    struct cpuid_policy *p = &raw_cpu_policy;
-
-    x86_cpuid_policy_fill_native(p);
-
-    /* Nothing good will come from Xen and libx86 disagreeing on vendor. */
-    ASSERT(p->x86_vendor == boot_cpu_data.x86_vendor);
-}
-
-static void __init calculate_host_policy(void)
-{
-    struct cpuid_policy *p = &host_cpu_policy;
-    unsigned int max_extd_leaf;
-
-    *p = raw_cpu_policy;
-
-    p->basic.max_leaf =
-        min_t(uint32_t, p->basic.max_leaf,   ARRAY_SIZE(p->basic.raw) - 1);
-    p->feat.max_subleaf =
-        min_t(uint32_t, p->feat.max_subleaf, ARRAY_SIZE(p->feat.raw) - 1);
-
-    max_extd_leaf = p->extd.max_leaf;
-
-    /*
-     * For AMD/Hygon hardware before Zen3, we unilaterally modify LFENCE to be
-     * dispatch serialising for Spectre mitigations.  Extend max_extd_leaf
-     * beyond what hardware supports, to include the feature leaf containing
-     * this information.
-     */
-    if ( cpu_has_lfence_dispatch )
-        max_extd_leaf = max(max_extd_leaf, 0x80000021);
-
-    p->extd.max_leaf = 0x80000000 | min_t(uint32_t, max_extd_leaf & 0xffff,
-                                          ARRAY_SIZE(p->extd.raw) - 1);
-
-    x86_cpu_featureset_to_policy(boot_cpu_data.x86_capability, p);
-    recalculate_xstate(p);
-    recalculate_misc(p);
-
-    /* When vPMU is disabled, drop it from the host policy. */
-    if ( vpmu_mode == XENPMU_MODE_OFF )
-        p->basic.raw[0xa] = EMPTY_LEAF;
-
-    if ( p->extd.svm )
-    {
-        /* Clamp to implemented features which require hardware support. */
-        p->extd.raw[0xa].d &= ((1u << SVM_FEATURE_NPT) |
-                               (1u << SVM_FEATURE_LBRV) |
-                               (1u << SVM_FEATURE_NRIPS) |
-                               (1u << SVM_FEATURE_PAUSEFILTER) |
-                               (1u << SVM_FEATURE_DECODEASSISTS));
-        /* Enable features which are always emulated. */
-        p->extd.raw[0xa].d |= ((1u << SVM_FEATURE_VMCBCLEAN) |
-                               (1u << SVM_FEATURE_TSCRATEMSR));
-    }
-}
-
-static void __init guest_common_default_feature_adjustments(uint32_t *fs)
-{
-    /*
-     * IvyBridge client parts suffer from leakage of RDRAND data due to SRBDS
-     * (XSA-320 / CVE-2020-0543), and won't be receiving microcode to
-     * compensate.
-     *
-     * Mitigate by hiding RDRAND from guests by default, unless explicitly
-     * overridden on the Xen command line (cpuid=rdrand).  Irrespective of the
-     * default setting, guests can use RDRAND if explicitly enabled
-     * (cpuid="host,rdrand=1") in the VM's config file, and VMs which were
-     * previously using RDRAND can migrate in.
-     */
-    if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL &&
-         boot_cpu_data.x86 == 6 && boot_cpu_data.x86_model == 0x3a &&
-         cpu_has_rdrand && !is_forced_cpu_cap(X86_FEATURE_RDRAND) )
-        __clear_bit(X86_FEATURE_RDRAND, fs);
-
-    /*
-     * On certain hardware, speculative or errata workarounds can result in
-     * TSX being placed in "force-abort" mode, where it doesn't actually
-     * function as expected, but is technically compatible with the ISA.
-     *
-     * Do not advertise RTM to guests by default if it won't actually work.
-     */
-    if ( rtm_disabled )
-        __clear_bit(X86_FEATURE_RTM, fs);
-}
-
-static void __init guest_common_feature_adjustments(uint32_t *fs)
-{
-    /* Unconditionally claim to be able to set the hypervisor bit. */
-    __set_bit(X86_FEATURE_HYPERVISOR, fs);
-
-    /*
-     * If IBRS is offered to the guest, unconditionally offer STIBP.  It is a
-     * nop on non-HT hardware, and has this behaviour to make heterogeneous
-     * setups easier to manage.
-     */
-    if ( test_bit(X86_FEATURE_IBRSB, fs) )
-        __set_bit(X86_FEATURE_STIBP, fs);
-    if ( test_bit(X86_FEATURE_IBRS, fs) )
-        __set_bit(X86_FEATURE_AMD_STIBP, fs);
-
-    /*
-     * On hardware which supports IBRS/IBPB, we can offer IBPB independently
-     * of IBRS by using the AMD feature bit.  An administrator may wish for
-     * performance reasons to offer IBPB without IBRS.
-     */
-    if ( host_cpu_policy.feat.ibrsb )
-        __set_bit(X86_FEATURE_IBPB, fs);
-}
-
-static void __init calculate_pv_max_policy(void)
-{
-    struct cpuid_policy *p = &pv_max_cpu_policy;
-    uint32_t pv_featureset[FSCAPINTS];
-    unsigned int i;
-
-    *p = host_cpu_policy;
-    x86_cpu_policy_to_featureset(p, pv_featureset);
-
-    for ( i = 0; i < ARRAY_SIZE(pv_featureset); ++i )
-        pv_featureset[i] &= pv_max_featuremask[i];
-
-    /*
-     * If Xen isn't virtualising MSR_SPEC_CTRL for PV guests (functional
-     * availability, or admin choice), hide the feature.
-     */
-    if ( !boot_cpu_has(X86_FEATURE_SC_MSR_PV) )
-    {
-        __clear_bit(X86_FEATURE_IBRSB, pv_featureset);
-        __clear_bit(X86_FEATURE_IBRS, pv_featureset);
-    }
-
-    guest_common_feature_adjustments(pv_featureset);
-
-    sanitise_featureset(pv_featureset);
-    x86_cpu_featureset_to_policy(pv_featureset, p);
-    recalculate_xstate(p);
-
-    p->extd.raw[0xa] = EMPTY_LEAF; /* No SVM for PV guests. */
-}
-
-static void __init calculate_pv_def_policy(void)
-{
-    struct cpuid_policy *p = &pv_def_cpu_policy;
-    uint32_t pv_featureset[FSCAPINTS];
-    unsigned int i;
-
-    *p = pv_max_cpu_policy;
-    x86_cpu_policy_to_featureset(p, pv_featureset);
-
-    for ( i = 0; i < ARRAY_SIZE(pv_featureset); ++i )
-        pv_featureset[i] &= pv_def_featuremask[i];
-
-    guest_common_feature_adjustments(pv_featureset);
-    guest_common_default_feature_adjustments(pv_featureset);
-
-    sanitise_featureset(pv_featureset);
-    x86_cpu_featureset_to_policy(pv_featureset, p);
-    recalculate_xstate(p);
-}
-
-static void __init calculate_hvm_max_policy(void)
-{
-    struct cpuid_policy *p = &hvm_max_cpu_policy;
-    uint32_t hvm_featureset[FSCAPINTS];
-    unsigned int i;
-    const uint32_t *hvm_featuremask;
-
-    *p = host_cpu_policy;
-    x86_cpu_policy_to_featureset(p, hvm_featureset);
-
-    hvm_featuremask = hvm_hap_supported() ?
-        hvm_hap_max_featuremask : hvm_shadow_max_featuremask;
-
-    for ( i = 0; i < ARRAY_SIZE(hvm_featureset); ++i )
-        hvm_featureset[i] &= hvm_featuremask[i];
-
-    /*
-     * Xen can provide an (x2)APIC emulation to HVM guests even if the host's
-     * (x2)APIC isn't enabled.
-     */
-    __set_bit(X86_FEATURE_APIC, hvm_featureset);
-    __set_bit(X86_FEATURE_X2APIC, hvm_featureset);
-
-    /*
-     * We don't support EFER.LMSLE at all.  AMD has dropped the feature from
-     * hardware and allocated a CPUID bit to indicate its absence.
-     */
-    __set_bit(X86_FEATURE_NO_LMSL, hvm_featureset);
-
-    /*
-     * On AMD, PV guests are entirely unable to use SYSENTER as Xen runs in
-     * long mode (and init_amd() has cleared it out of host capabilities), but
-     * HVM guests are able if running in protected mode.
-     */
-    if ( (boot_cpu_data.x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) &&
-         raw_cpu_policy.basic.sep )
-        __set_bit(X86_FEATURE_SEP, hvm_featureset);
-
-    /*
-     * VIRT_SSBD is exposed in the default policy as a result of
-     * amd_virt_spec_ctrl being set, it also needs exposing in the max policy.
-     */
-    if ( amd_virt_spec_ctrl )
-        __set_bit(X86_FEATURE_VIRT_SSBD, hvm_featureset);
-
-    /*
-     * If Xen isn't virtualising MSR_SPEC_CTRL for HVM guests (functional
-     * availability, or admin choice), hide the feature.
-     */
-    if ( !boot_cpu_has(X86_FEATURE_SC_MSR_HVM) )
-    {
-        __clear_bit(X86_FEATURE_IBRSB, hvm_featureset);
-        __clear_bit(X86_FEATURE_IBRS, hvm_featureset);
-    }
-    else if ( boot_cpu_has(X86_FEATURE_AMD_SSBD) )
-        /*
-         * If SPEC_CTRL.SSBD is available VIRT_SPEC_CTRL.SSBD can be exposed
-         * and implemented using the former. Expose in the max policy only as
-         * the preference is for guests to use SPEC_CTRL.SSBD if available.
-         */
-        __set_bit(X86_FEATURE_VIRT_SSBD, hvm_featureset);
-
-    /*
-     * With VT-x, some features are only supported by Xen if dedicated
-     * hardware support is also available.
-     */
-    if ( cpu_has_vmx )
-    {
-        if ( !cpu_has_vmx_mpx )
-            __clear_bit(X86_FEATURE_MPX, hvm_featureset);
-
-        if ( !cpu_has_vmx_xsaves )
-            __clear_bit(X86_FEATURE_XSAVES, hvm_featureset);
-    }
-
-    /*
-     * Xen doesn't use PKS, so the guest support for it has opted to not use
-     * the VMCS load/save controls for efficiency reasons.  This depends on
-     * the exact vmentry/exit behaviour, so don't expose PKS in other
-     * situations until someone has cross-checked the behaviour for safety.
-     */
-    if ( !cpu_has_vmx )
-        __clear_bit(X86_FEATURE_PKS, hvm_featureset);
-
-    guest_common_feature_adjustments(hvm_featureset);
-
-    sanitise_featureset(hvm_featureset);
-    x86_cpu_featureset_to_policy(hvm_featureset, p);
-    recalculate_xstate(p);
-}
-
-static void __init calculate_hvm_def_policy(void)
-{
-    struct cpuid_policy *p = &hvm_def_cpu_policy;
-    uint32_t hvm_featureset[FSCAPINTS];
-    unsigned int i;
-    const uint32_t *hvm_featuremask;
-
-    *p = hvm_max_cpu_policy;
-    x86_cpu_policy_to_featureset(p, hvm_featureset);
-
-    hvm_featuremask = hvm_hap_supported() ?
-        hvm_hap_def_featuremask : hvm_shadow_def_featuremask;
-
-    for ( i = 0; i < ARRAY_SIZE(hvm_featureset); ++i )
-        hvm_featureset[i] &= hvm_featuremask[i];
-
-    guest_common_feature_adjustments(hvm_featureset);
-    guest_common_default_feature_adjustments(hvm_featureset);
-
-    /*
-     * Only expose VIRT_SSBD if AMD_SSBD is not available, and thus
-     * amd_virt_spec_ctrl is set.
-     */
-    if ( amd_virt_spec_ctrl )
-        __set_bit(X86_FEATURE_VIRT_SSBD, hvm_featureset);
-
-    sanitise_featureset(hvm_featureset);
-    x86_cpu_featureset_to_policy(hvm_featureset, p);
-    recalculate_xstate(p);
-}
-
-void __init init_guest_cpuid(void)
-{
-    calculate_raw_policy();
-    calculate_host_policy();
-
-    if ( IS_ENABLED(CONFIG_PV) )
-    {
-        calculate_pv_max_policy();
-        calculate_pv_def_policy();
-    }
-
-    if ( hvm_enabled )
-    {
-        calculate_hvm_max_policy();
-        calculate_hvm_def_policy();
-    }
-}
 
 bool recheck_cpu_features(unsigned int cpu)
 {
@@ -656,170 +32,6 @@ bool recheck_cpu_features(unsigned int cpu)
     return okay;
 }
 
-void recalculate_cpuid_policy(struct domain *d)
-{
-    struct cpuid_policy *p = d->arch.cpuid;
-    const struct cpuid_policy *max = is_pv_domain(d)
-        ? (IS_ENABLED(CONFIG_PV)  ?  &pv_max_cpu_policy : NULL)
-        : (IS_ENABLED(CONFIG_HVM) ? &hvm_max_cpu_policy : NULL);
-    uint32_t fs[FSCAPINTS], max_fs[FSCAPINTS];
-    unsigned int i;
-
-    if ( !max )
-    {
-        ASSERT_UNREACHABLE();
-        return;
-    }
-
-    p->x86_vendor = x86_cpuid_lookup_vendor(
-        p->basic.vendor_ebx, p->basic.vendor_ecx, p->basic.vendor_edx);
-
-    p->basic.max_leaf   = min(p->basic.max_leaf,   max->basic.max_leaf);
-    p->feat.max_subleaf = min(p->feat.max_subleaf, max->feat.max_subleaf);
-    p->extd.max_leaf    = 0x80000000 | min(p->extd.max_leaf & 0xffff,
-                                           ((p->x86_vendor & (X86_VENDOR_AMD |
-                                                              X86_VENDOR_HYGON))
-                                            ? CPUID_GUEST_NR_EXTD_AMD
-                                            : CPUID_GUEST_NR_EXTD_INTEL) - 1);
-
-    x86_cpu_policy_to_featureset(p, fs);
-    x86_cpu_policy_to_featureset(max, max_fs);
-
-    if ( is_hvm_domain(d) )
-    {
-        /*
-         * HVM domains using Shadow paging have further restrictions on their
-         * available paging features.
-         */
-        if ( !hap_enabled(d) )
-        {
-            for ( i = 0; i < ARRAY_SIZE(max_fs); i++ )
-                max_fs[i] &= hvm_shadow_max_featuremask[i];
-        }
-
-        /* Hide nested-virt if it hasn't been explicitly configured. */
-        if ( !nestedhvm_enabled(d) )
-        {
-            __clear_bit(X86_FEATURE_VMX, max_fs);
-            __clear_bit(X86_FEATURE_SVM, max_fs);
-        }
-    }
-
-    /*
-     * Allow the toolstack to set HTT, X2APIC and CMP_LEGACY.  These bits
-     * affect how to interpret topology information in other cpuid leaves.
-     */
-    __set_bit(X86_FEATURE_HTT, max_fs);
-    __set_bit(X86_FEATURE_X2APIC, max_fs);
-    __set_bit(X86_FEATURE_CMP_LEGACY, max_fs);
-
-    /*
-     * 32bit PV domains can't use any Long Mode features, and cannot use
-     * SYSCALL on non-AMD hardware.
-     */
-    if ( is_pv_32bit_domain(d) )
-    {
-        __clear_bit(X86_FEATURE_LM, max_fs);
-        if ( !(boot_cpu_data.x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
-            __clear_bit(X86_FEATURE_SYSCALL, max_fs);
-    }
-
-    /* Clamp the toolstacks choices to reality. */
-    for ( i = 0; i < ARRAY_SIZE(fs); i++ )
-        fs[i] &= max_fs[i];
-
-    if ( p->basic.max_leaf < XSTATE_CPUID )
-        __clear_bit(X86_FEATURE_XSAVE, fs);
-
-    sanitise_featureset(fs);
-
-    /* Fold host's FDP_EXCP_ONLY and NO_FPU_SEL into guest's view. */
-    fs[FEATURESET_7b0] &= ~(cpufeat_mask(X86_FEATURE_FDP_EXCP_ONLY) |
-                            cpufeat_mask(X86_FEATURE_NO_FPU_SEL));
-    fs[FEATURESET_7b0] |= (host_cpu_policy.feat._7b0 &
-                           (cpufeat_mask(X86_FEATURE_FDP_EXCP_ONLY) |
-                            cpufeat_mask(X86_FEATURE_NO_FPU_SEL)));
-
-    x86_cpu_featureset_to_policy(fs, p);
-
-    /* Pass host cacheline size through to guests. */
-    p->basic.clflush_size = max->basic.clflush_size;
-
-    p->extd.maxphysaddr = min(p->extd.maxphysaddr, max->extd.maxphysaddr);
-    p->extd.maxphysaddr = min_t(uint8_t, p->extd.maxphysaddr,
-                                paging_max_paddr_bits(d));
-    p->extd.maxphysaddr = max_t(uint8_t, p->extd.maxphysaddr,
-                                (p->basic.pae || p->basic.pse36) ? 36 : 32);
-
-    p->extd.maxlinaddr = p->extd.lm ? 48 : 32;
-
-    recalculate_xstate(p);
-    recalculate_misc(p);
-
-    for ( i = 0; i < ARRAY_SIZE(p->cache.raw); ++i )
-    {
-        if ( p->cache.subleaf[i].type >= 1 &&
-             p->cache.subleaf[i].type <= 3 )
-        {
-            /* Subleaf has a valid cache type. Zero reserved fields. */
-            p->cache.raw[i].a &= 0xffffc3ffu;
-            p->cache.raw[i].d &= 0x00000007u;
-        }
-        else
-        {
-            /* Subleaf is not valid.  Zero the rest of the union. */
-            zero_leaves(p->cache.raw, i, ARRAY_SIZE(p->cache.raw) - 1);
-            break;
-        }
-    }
-
-    if ( vpmu_mode == XENPMU_MODE_OFF ||
-         ((vpmu_mode & XENPMU_MODE_ALL) && !is_hardware_domain(d)) )
-        p->basic.raw[0xa] = EMPTY_LEAF;
-
-    if ( !p->extd.svm )
-        p->extd.raw[0xa] = EMPTY_LEAF;
-
-    if ( !p->extd.page1gb )
-        p->extd.raw[0x19] = EMPTY_LEAF;
-}
-
-void __init init_dom0_cpuid_policy(struct domain *d)
-{
-    struct cpuid_policy *p = d->arch.cpuid;
-
-    /* dom0 can't migrate.  Give it ITSC if available. */
-    if ( cpu_has_itsc )
-        p->extd.itsc = true;
-
-    /*
-     * Expose the "hardware speculation behaviour" bits of ARCH_CAPS to dom0,
-     * so dom0 can turn off workarounds as appropriate.  Temporary, until the
-     * domain policy logic gains a better understanding of MSRs.
-     */
-    if ( cpu_has_arch_caps )
-        p->feat.arch_caps = true;
-
-    /* Apply dom0-cpuid= command line settings, if provided. */
-    if ( dom0_cpuid_cmdline )
-    {
-        uint32_t fs[FSCAPINTS];
-        unsigned int i;
-
-        x86_cpu_policy_to_featureset(p, fs);
-
-        for ( i = 0; i < ARRAY_SIZE(fs); ++i )
-        {
-            fs[i] |=  dom0_enable_feat [i];
-            fs[i] &= ~dom0_disable_feat[i];
-        }
-
-        x86_cpu_featureset_to_policy(fs, p);
-
-        recalculate_cpuid_policy(d);
-    }
-}
-
 void guest_cpuid(const struct vcpu *v, uint32_t leaf,
                  uint32_t subleaf, struct cpuid_leaf *res)
 {
@@ -1190,27 +402,6 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
     }
 }
 
-static void __init __maybe_unused build_assertions(void)
-{
-    BUILD_BUG_ON(ARRAY_SIZE(known_features) != FSCAPINTS);
-    BUILD_BUG_ON(ARRAY_SIZE(pv_max_featuremask) != FSCAPINTS);
-    BUILD_BUG_ON(ARRAY_SIZE(hvm_shadow_max_featuremask) != FSCAPINTS);
-    BUILD_BUG_ON(ARRAY_SIZE(hvm_hap_max_featuremask) != FSCAPINTS);
-    BUILD_BUG_ON(ARRAY_SIZE(deep_features) != FSCAPINTS);
-
-    /* Find some more clever allocation scheme if this trips. */
-    BUILD_BUG_ON(sizeof(struct cpuid_policy) > PAGE_SIZE);
-
-    BUILD_BUG_ON(sizeof(raw_cpu_policy.basic) !=
-                 sizeof(raw_cpu_policy.basic.raw));
-    BUILD_BUG_ON(sizeof(raw_cpu_policy.feat) !=
-                 sizeof(raw_cpu_policy.feat.raw));
-    BUILD_BUG_ON(sizeof(raw_cpu_policy.xstate) !=
-                 sizeof(raw_cpu_policy.xstate.raw));
-    BUILD_BUG_ON(sizeof(raw_cpu_policy.extd) !=
-                 sizeof(raw_cpu_policy.extd.raw));
-}
-
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index d326fa1c0136..675c523d9909 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -77,7 +77,6 @@
 #include <public/memory.h>
 #include <public/vm_event.h>
 #include <public/arch-x86/cpuid.h>
-#include <asm/cpuid.h>
 
 #include <compat/hvm/hvm_op.h>
 
diff --git a/xen/arch/x86/include/asm/cpu-policy.h b/xen/arch/x86/include/asm/cpu-policy.h
index 13e2a1f86d13..b361537a602b 100644
--- a/xen/arch/x86/include/asm/cpu-policy.h
+++ b/xen/arch/x86/include/asm/cpu-policy.h
@@ -18,4 +18,10 @@ void init_guest_cpu_policies(void);
 /* Allocate and initialise a CPU policy suitable for the domain. */
 int init_domain_cpu_policy(struct domain *d);
 
+/* Apply dom0-specific tweaks to the CPUID policy. */
+void init_dom0_cpuid_policy(struct domain *d);
+
+/* Clamp the CPUID policy to reality. */
+void recalculate_cpuid_policy(struct domain *d);
+
 #endif /* X86_CPU_POLICY_H */
diff --git a/xen/arch/x86/include/asm/cpuid.h b/xen/arch/x86/include/asm/cpuid.h
index 7f81b998ce01..b32ba0bbfe5c 100644
--- a/xen/arch/x86/include/asm/cpuid.h
+++ b/xen/arch/x86/include/asm/cpuid.h
@@ -8,14 +8,10 @@
 #include <xen/kernel.h>
 #include <xen/percpu.h>
 
-#include <xen/lib/x86/cpu-policy.h>
-
 #include <public/sysctl.h>
 
 extern const uint32_t known_features[FSCAPINTS];
 
-void init_guest_cpuid(void);
-
 /*
  * Expected levelling capabilities (given cpuid vendor/family information),
  * and levelling capabilities actually available (given MSR probing).
@@ -49,13 +45,8 @@ extern struct cpuidmasks cpuidmask_defaults;
 /* Check that all previously present features are still available. */
 bool recheck_cpu_features(unsigned int cpu);
 
-/* Apply dom0-specific tweaks to the CPUID policy. */
-void init_dom0_cpuid_policy(struct domain *d);
-
-/* Clamp the CPUID policy to reality. */
-void recalculate_cpuid_policy(struct domain *d);
-
 struct vcpu;
+struct cpuid_leaf;
 void guest_cpuid(const struct vcpu *v, uint32_t leaf,
                  uint32_t subleaf, struct cpuid_leaf *res);
 
diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
index f94f28c8e271..95492715d8ad 100644
--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -10,6 +10,7 @@
 #include <xen/param.h>
 #include <xen/sched.h>
 
+#include <asm/cpu-policy.h>
 #include <asm/cpufeature.h>
 #include <asm/invpcid.h>
 #include <asm/spec_ctrl.h>
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 51a19b9019eb..08ade715a3ce 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -51,7 +51,6 @@
 #include <asm/alternative.h>
 #include <asm/mc146818rtc.h>
 #include <asm/cpu-policy.h>
-#include <asm/cpuid.h>
 #include <asm/spec_ctrl.h>
 #include <asm/guest.h>
 #include <asm/microcode.h>
@@ -1991,7 +1990,6 @@ void __init noreturn __start_xen(unsigned long mbi_p)
     if ( !tboot_protect_mem_regions() )
         panic("Could not protect TXT memory regions\n");
 
-    init_guest_cpuid();
     init_guest_cpu_policies();
 
     if ( xen_cpuidle )
-- 
2.30.2


