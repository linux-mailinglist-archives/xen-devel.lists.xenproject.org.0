Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 376292C0D93
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 15:34:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34530.65656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khCvB-00011w-Dv; Mon, 23 Nov 2020 14:34:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34530.65656; Mon, 23 Nov 2020 14:34:25 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khCvB-00011W-AV; Mon, 23 Nov 2020 14:34:25 +0000
Received: by outflank-mailman (input) for mailman id 34530;
 Mon, 23 Nov 2020 14:34:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khCv9-00011G-Rx
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 14:34:23 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 09dbe9db-f991-4003-a1a4-1a94be257658;
 Mon, 23 Nov 2020 14:34:22 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 35739AC23;
 Mon, 23 Nov 2020 14:34:21 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khCv9-00011G-Rx
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 14:34:23 +0000
X-Inumbo-ID: 09dbe9db-f991-4003-a1a4-1a94be257658
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 09dbe9db-f991-4003-a1a4-1a94be257658;
	Mon, 23 Nov 2020 14:34:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606142061; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QxKWZSZRQygyQ3FnflcgF2rPGZueav8ba8ZpNwpn4ek=;
	b=I4TGxMkXXysN7+oG1cIUayExp/6JStkvdjjLqsNeT7Ha2cgwMDrCjsdGxQ+CcurTuR0173
	YZPOSYTpbTvtFjVyrA1lN0ICKpEPoqiw8lv+FPloNZI6+SargsJLHovr4z18G1STHWqs09
	1w0OSU8ybrq49i7KH43ffSNOn/qvZu8=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 35739AC23;
	Mon, 23 Nov 2020 14:34:21 +0000 (UTC)
Subject: [PATCH v2 14/17] x86/CPUID: enable AMX leaves
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <255f466c-3c95-88c5-3e55-0f04c9ae1b12@suse.com>
Message-ID: <e083de34-bd5d-7059-8e69-66129974cb55@suse.com>
Date: Mon, 23 Nov 2020 15:34:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <255f466c-3c95-88c5-3e55-0f04c9ae1b12@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

This requires bumping the number of basic leaves we support. Apart from
this the logic is modeled as closely as possible to that of leaf 7
handling.

The checks in x86_cpu_policies_are_compatible() may be more strict than
they ultimately need to be, but I'd rather start being on the safe side.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.
---
It's not clear to me in how far libxl_cpuid.c would want extending: It
doesn't look to offer a way to override the maximum subleaf of leaf 7.
In fact I can't seem to be able to spot a max extended leaf override
mechanism either.

--- a/tools/tests/cpu-policy/test-cpu-policy.c
+++ b/tools/tests/cpu-policy/test-cpu-policy.c
@@ -190,6 +190,40 @@ static void test_cpuid_serialise_success
             },
             .nr_leaves = 4 + 0xd + 1 + 1,
         },
+
+        /* Leaf 0x1d serialisation stops at max_palette. */
+        {
+            .name = "empty leaf 0x1d",
+            .p = {
+                .basic.max_leaf = 0x1d,
+            },
+            .nr_leaves = 4 + 0x1d + 1,
+        },
+        {
+            .name = "partial leaf 0x1d",
+            .p = {
+                .basic.max_leaf = 0x1d,
+                .tile.max_palette = 1,
+            },
+            .nr_leaves = 4 + 0x1d + 1 + 1,
+        },
+
+        /* Leaf 0x1e serialisation stops at 0. */
+        {
+            .name = "empty leaf 0x1e",
+            .p = {
+                .basic.max_leaf = 0x1e,
+            },
+            .nr_leaves = 4 + 0x1e + 1,
+        },
+        {
+            .name = "partial leaf 0x1e",
+            .p = {
+                .basic.max_leaf = 0x1e,
+                .tmul.maxk = 16,
+            },
+            .nr_leaves = 4 + 0x1e + 1,
+        },
     };
 
     printf("Testing CPUID serialise success:\n");
@@ -321,6 +355,14 @@ static void test_cpuid_deserialise_failu
             .leaf = { .leaf = 0xd, .subleaf = CPUID_GUEST_NR_XSTATE },
         },
         {
+            .name = "OoB tile leaf",
+            .leaf = { .leaf = 0x1d, .subleaf = CPUID_GUEST_NR_PALETTE },
+        },
+        {
+            .name = "OoB tmul leaf",
+            .leaf = { .leaf = 0x1e, .subleaf = CPUID_GUEST_NR_TMUL },
+        },
+        {
             .name = "OoB extd leaf",
             .leaf = { .leaf = 0x80000000 | CPUID_GUEST_NR_EXTD },
         },
@@ -432,6 +474,8 @@ static void test_cpuid_out_of_range_clea
                 .topo.raw[0].a = 0xc2,
                 .xstate.raw[0].a = 0xc2,
                 .xstate.raw[1].a = 0xc2,
+                .tile.raw[0].a = 0xc2,
+                .tmul.raw[0].a = 0xc2,
             },
         },
         {
@@ -447,6 +491,8 @@ static void test_cpuid_out_of_range_clea
                 .topo.raw[0].a = 0xc2,
                 .xstate.raw[0].a = 0xc2,
                 .xstate.raw[1].a = 0xc2,
+                .tile.raw[0].a = 0xc2,
+                .tmul.raw[0].a = 0xc2,
             },
         },
         {
@@ -461,6 +507,8 @@ static void test_cpuid_out_of_range_clea
                 .topo.raw[0].a = 0xc2,
                 .xstate.raw[0].a = 0xc2,
                 .xstate.raw[1].a = 0xc2,
+                .tile.raw[0].a = 0xc2,
+                .tmul.raw[0].a = 0xc2,
             },
         },
         {
@@ -474,6 +522,8 @@ static void test_cpuid_out_of_range_clea
                 .topo.raw[1].b = 0xc2,
                 .xstate.raw[0].a = 0xc2,
                 .xstate.raw[1].a = 0xc2,
+                .tile.raw[0].a = 0xc2,
+                .tmul.raw[0].a = 0xc2,
             },
         },
         {
@@ -488,6 +538,8 @@ static void test_cpuid_out_of_range_clea
 
                 .xstate.raw[2].b = 0xc2,
                 .xstate.raw[3].b = 0xc2,
+                .tile.raw[0].a = 0xc2,
+                .tmul.raw[0].a = 0xc2,
             },
         },
         {
@@ -530,6 +582,34 @@ static void test_cpuid_out_of_range_clea
             },
         },
         {
+            .name = "tile no palette",
+            .nr_markers = 0,
+            .p = {
+                /* First two subleaves invalid as a pair.  Others cleared. */
+                .basic.max_leaf = 0x1d,
+                .xstate.xcr0_low = XSTATE_FP_SSE,
+
+                .tile.raw[0].a = 0xc2,
+                .tile.raw[1].b = 0xc2,
+                .tmul.raw[0].a = 0xc2,
+            },
+        },
+        {
+            .name = "tile palette 1",
+            .nr_markers = 1,
+            .p = {
+                /* First two subleaves valid as a pair.  Others cleared. */
+                .basic.max_leaf = 0x1d,
+                .feat.amx_tile = 1,
+                .xstate.xcr0_low = XSTATE_FP_SSE | X86_XCR0_TILECFG |
+                                   X86_XCR0_TILEDATA,
+                .tile.raw[0].a = 1,
+                .tile.raw[1].b = 0xc2,
+
+                .tmul.raw[0].a = 0xc2,
+            },
+        },
+        {
             .name = "extd",
             .nr_markers = 1,
             .p = {
@@ -624,6 +704,24 @@ static void test_cpuid_maximum_leaf_shri
             },
         },
         {
+            .name = "tile",
+            .p = {
+                /* Subleaf 1 only with some valid value. */
+                .basic.max_leaf = 0x1d,
+                .tile.raw[0].a = 1,
+                .tile.raw[1].a = 1024,
+            },
+        },
+        {
+            .name = "tmul",
+            .p = {
+                /* Subleaf 0 only with some valid values. */
+                .basic.max_leaf = 0x1e,
+                .tmul.maxk = 16,
+                .tmul.maxn = 16,
+            },
+        },
+        {
             .name = "extd",
             .p = {
                 /* Commonly available information only. */
@@ -643,6 +741,7 @@ static void test_cpuid_maximum_leaf_shri
 
         p->basic.max_leaf = ARRAY_SIZE(p->basic.raw) - 1;
         p->feat.max_subleaf = ARRAY_SIZE(p->feat.raw) - 1;
+        p->tile.max_palette = ARRAY_SIZE(p->tile.raw) - 1;
         p->extd.max_leaf = 0x80000000 | (ARRAY_SIZE(p->extd.raw) - 1);
 
         x86_cpuid_policy_shrink_max_leaves(p);
@@ -660,6 +759,10 @@ static void test_cpuid_maximum_leaf_shri
              fail("  Test %s feat fail - expected %#x, got %#x\n",
                   t->name, t->p.feat.max_subleaf, p->feat.max_subleaf);
 
+        if ( p->tile.max_palette != t->p.tile.max_palette )
+             fail("  Test %s tile fail - expected %#x, got %#x\n",
+                  t->name, t->p.tile.max_palette, p->tile.max_palette);
+
         free(p);
     }
 }
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -230,6 +230,29 @@ static void recalculate_xstate(struct cp
     }
 }
 
+static void recalculate_tile(struct cpuid_policy *p)
+{
+    unsigned int i;
+
+    if ( !p->feat.amx_tile )
+    {
+        memset(&p->tile, 0, sizeof(p->tile));
+        memset(&p->tmul, 0, sizeof(p->tmul));
+        return;
+    }
+
+    p->tile.raw[0].b = p->tile.raw[0].c = p->tile.raw[0].d = 0;
+
+    for ( i = 1; i <= p->tile.max_palette; ++i )
+    {
+        p->tile.raw[i].c &= 0x0000ffff;
+        p->tile.raw[i].d = 0;
+    }
+
+    p->tmul.raw[0].a = p->tmul.raw[0].c = p->tmul.raw[0].d = 0;
+    p->tmul.raw[0].b &= 0x00ffffff;
+}
+
 /*
  * Misc adjustments to the policy.  Mostly clobbering reserved fields and
  * duplicating shared fields.  Intentionally hidden fields are annotated.
@@ -249,6 +272,8 @@ static void recalculate_misc(struct cpui
 
     p->basic.raw[0xc] = EMPTY_LEAF;
 
+    zero_leaves(p->basic.raw, 0xe, 0x1c);
+
     p->extd.e1d &= ~CPUID_COMMON_1D_FEATURES;
 
     /* Most of Power/RAS hidden from guests. */
@@ -323,6 +348,7 @@ static void __init calculate_host_policy
 
     cpuid_featureset_to_policy(boot_cpu_data.x86_capability, p);
     recalculate_xstate(p);
+    recalculate_tile(p);
     recalculate_misc(p);
 
     /* When vPMU is disabled, drop it from the host policy. */
@@ -410,6 +436,7 @@ static void __init calculate_pv_max_poli
     sanitise_featureset(pv_featureset);
     cpuid_featureset_to_policy(pv_featureset, p);
     recalculate_xstate(p);
+    recalculate_tile(p);
 
     p->extd.raw[0xa] = EMPTY_LEAF; /* No SVM for PV guests. */
 
@@ -434,6 +461,7 @@ static void __init calculate_pv_def_poli
     sanitise_featureset(pv_featureset);
     cpuid_featureset_to_policy(pv_featureset, p);
     recalculate_xstate(p);
+    recalculate_tile(p);
 
     x86_cpuid_policy_shrink_max_leaves(p);
 }
@@ -495,6 +523,7 @@ static void __init calculate_hvm_max_pol
     sanitise_featureset(hvm_featureset);
     cpuid_featureset_to_policy(hvm_featureset, p);
     recalculate_xstate(p);
+    recalculate_tile(p);
 
     x86_cpuid_policy_shrink_max_leaves(p);
 }
@@ -521,6 +550,7 @@ static void __init calculate_hvm_def_pol
     sanitise_featureset(hvm_featureset);
     cpuid_featureset_to_policy(hvm_featureset, p);
     recalculate_xstate(p);
+    recalculate_tile(p);
 
     x86_cpuid_policy_shrink_max_leaves(p);
 }
@@ -591,6 +621,7 @@ void recalculate_cpuid_policy(struct dom
 
     p->basic.max_leaf   = min(p->basic.max_leaf,   max->basic.max_leaf);
     p->feat.max_subleaf = min(p->feat.max_subleaf, max->feat.max_subleaf);
+    p->tile.max_palette = min(p->tile.max_palette, max->tile.max_palette);
     p->extd.max_leaf    = 0x80000000 | min(p->extd.max_leaf & 0xffff,
                                            ((p->x86_vendor & (X86_VENDOR_AMD |
                                                               X86_VENDOR_HYGON))
@@ -681,6 +712,7 @@ void recalculate_cpuid_policy(struct dom
     p->extd.maxlinaddr = p->extd.lm ? 48 : 32;
 
     recalculate_xstate(p);
+    recalculate_tile(p);
     recalculate_misc(p);
 
     for ( i = 0; i < ARRAY_SIZE(p->cache.raw); ++i )
@@ -803,6 +835,22 @@ void guest_cpuid(const struct vcpu *v, u
             *res = array_access_nospec(p->xstate.raw, subleaf);
             break;
 
+        case 0x1d:
+            ASSERT(p->tile.max_palette < ARRAY_SIZE(p->tile.raw));
+            if ( subleaf > min_t(uint32_t, p->tile.max_palette,
+                                 ARRAY_SIZE(p->tile.raw) - 1) )
+                return;
+
+            *res = array_access_nospec(p->tile.raw, subleaf);
+            break;
+
+        case 0x1e:
+            if ( subleaf >= ARRAY_SIZE(p->tmul.raw) )
+                return;
+
+            *res = array_access_nospec(p->tmul.raw, subleaf);
+            break;
+
         default:
             *res = array_access_nospec(p->basic.raw, leaf);
             break;
@@ -1136,6 +1184,8 @@ static void __init __maybe_unused build_
                  sizeof(raw_cpuid_policy.feat.raw));
     BUILD_BUG_ON(sizeof(raw_cpuid_policy.xstate) !=
                  sizeof(raw_cpuid_policy.xstate.raw));
+    BUILD_BUG_ON(sizeof(raw_cpuid_policy.tile) !=
+                 sizeof(raw_cpuid_policy.tile.raw));
     BUILD_BUG_ON(sizeof(raw_cpuid_policy.extd) !=
                  sizeof(raw_cpuid_policy.extd.raw));
 }
--- a/xen/include/xen/lib/x86/cpuid.h
+++ b/xen/include/xen/lib/x86/cpuid.h
@@ -78,11 +78,13 @@ unsigned int x86_cpuid_lookup_vendor(uin
  */
 const char *x86_cpuid_vendor_to_str(unsigned int vendor);
 
-#define CPUID_GUEST_NR_BASIC      (0xdu + 1)
+#define CPUID_GUEST_NR_BASIC      (0x1eu + 1)
 #define CPUID_GUEST_NR_CACHE      (5u + 1)
 #define CPUID_GUEST_NR_FEAT       (1u + 1)
 #define CPUID_GUEST_NR_TOPO       (1u + 1)
 #define CPUID_GUEST_NR_XSTATE     (62u + 1)
+#define CPUID_GUEST_NR_PALETTE    (1u + 1)
+#define CPUID_GUEST_NR_TMUL       (0u + 1)
 #define CPUID_GUEST_NR_EXTD_INTEL (0x8u + 1)
 #define CPUID_GUEST_NR_EXTD_AMD   (0x1cu + 1)
 #define CPUID_GUEST_NR_EXTD       MAX(CPUID_GUEST_NR_EXTD_INTEL, \
@@ -225,6 +227,35 @@ struct cpuid_policy
         } comp[CPUID_GUEST_NR_XSTATE];
     } xstate;
 
+    /* Structured tile information leaf: 0x00000001d[xx] */
+    union {
+        struct cpuid_leaf raw[CPUID_GUEST_NR_PALETTE];
+        struct {
+            /* Subleaf 0. */
+            uint32_t max_palette;
+            uint32_t /* b */:32, /* c */:32, /* d */:32;
+        };
+
+        /* Per-palette common state.  Valid for i >= 1. */
+        struct {
+            uint16_t tot_bytes, bytes_per_tile;
+            uint16_t bytes_per_row, num_regs;
+            uint16_t max_rows, :16;
+            uint32_t /* d */:32;
+        } palette[CPUID_GUEST_NR_PALETTE];
+    } tile;
+
+    /* Structured tmul information leaf: 0x00000001e[xx] */
+    union {
+        struct cpuid_leaf raw[CPUID_GUEST_NR_TMUL];
+        struct {
+            /* Subleaf 0. */
+            uint32_t /* a */:32;
+            uint32_t maxk:8, maxn:16, :8;
+            uint32_t /* c */:32, /* d */:32;
+        };
+    } tmul;
+
     /* Extended leaves: 0x800000xx */
     union {
         struct cpuid_leaf raw[CPUID_GUEST_NR_EXTD];
--- a/xen/lib/x86/cpuid.c
+++ b/xen/lib/x86/cpuid.c
@@ -170,6 +170,18 @@ void x86_cpuid_policy_fill_native(struct
         }
     }
 
+    if ( p->basic.max_leaf >= 0x1d )
+    {
+        cpuid_count_leaf(0x1d, 0, &p->tile.raw[0]);
+
+        for ( i = 1; i <= MIN(p->tile.max_palette,
+                              ARRAY_SIZE(p->tile.raw) - 1); ++i )
+            cpuid_count_leaf(0x1d, i, &p->tile.raw[i]);
+    }
+
+    if ( p->basic.max_leaf >= 0x1e )
+        cpuid_count_leaf(0x1e, 0, &p->tmul.raw[0]);
+
     /* Extended leaves. */
     cpuid_leaf(0x80000000, &p->extd.raw[0]);
     for ( i = 1; i <= MIN(p->extd.max_leaf & 0xffffU,
@@ -232,6 +244,19 @@ void x86_cpuid_policy_clear_out_of_range
                     ARRAY_SIZE(p->xstate.raw) - 1);
     }
 
+    if ( p->basic.max_leaf < 0x1d ||
+         (cpuid_policy_xstates(p) &
+          (X86_XCR0_TILECFG | X86_XCR0_TILEDATA)) !=
+         (X86_XCR0_TILECFG | X86_XCR0_TILEDATA) )
+        memset(p->tile.raw, 0, sizeof(p->tile.raw));
+    else
+        zero_leaves(p->tile.raw, p->tile.max_palette + 1,
+                    ARRAY_SIZE(p->tile.raw) - 1);
+
+    if ( p->basic.max_leaf < 0x1e || !p->tile.max_palette ||
+         (!p->feat.amx_int8 && !p->feat.amx_bf16) )
+        memset(p->tmul.raw, 0, sizeof(p->tmul.raw));
+
     zero_leaves(p->extd.raw,
                 ((p->extd.max_leaf >> 16) == 0x8000
                  ? (p->extd.max_leaf & 0xffff) + 1 : 0),
@@ -244,6 +269,8 @@ void x86_cpuid_policy_bound_max_leaves(s
         min_t(uint32_t, p->basic.max_leaf, ARRAY_SIZE(p->basic.raw) - 1);
     p->feat.max_subleaf =
         min_t(uint32_t, p->feat.max_subleaf, ARRAY_SIZE(p->feat.raw) - 1);
+    p->tile.max_palette =
+        min_t(uint32_t, p->tile.max_palette, ARRAY_SIZE(p->tile.raw) - 1);
     p->extd.max_leaf = 0x80000000 | min_t(uint32_t, p->extd.max_leaf & 0xffff,
                                           ARRAY_SIZE(p->extd.raw) - 1);
 }
@@ -271,6 +298,21 @@ void x86_cpuid_policy_shrink_max_leaves(
      */
     p->basic.raw[0xd] = p->xstate.raw[0];
 
+    for ( i = p->tile.max_palette; i; --i )
+        if ( p->tile.raw[i].a | p->tile.raw[i].b |
+             p->tile.raw[i].c | p->tile.raw[i].d )
+            break;
+    if ( i )
+        p->tile.max_palette = i;
+    else
+    {
+        ASSERT(!p->feat.amx_tile);
+        zero_leaves(p->tile.raw, 0, 0);
+    }
+    p->basic.raw[0x1d] = p->tile.raw[0];
+
+    p->basic.raw[0x1e] = p->tmul.raw[0];
+
     for ( i = p->basic.max_leaf; i; --i )
         if ( p->basic.raw[i].a | p->basic.raw[i].b |
              p->basic.raw[i].c | p->basic.raw[i].d )
@@ -404,6 +446,19 @@ int x86_cpuid_copy_to_buffer(const struc
             break;
         }
 
+        case 0x1d:
+            for ( subleaf = 0;
+                  subleaf <= MIN(p->tile.max_palette,
+                                 ARRAY_SIZE(p->tile.raw) - 1); ++subleaf )
+                COPY_LEAF(leaf, subleaf, &p->tile.raw[subleaf]);
+            break;
+
+        case 0x1e:
+            for ( subleaf = 0;
+                  subleaf <= ARRAY_SIZE(p->tmul.raw) - 1; ++subleaf )
+                COPY_LEAF(leaf, subleaf, &p->tmul.raw[subleaf]);
+            break;
+
         default:
             COPY_LEAF(leaf, XEN_CPUID_NO_SUBLEAF, &p->basic.raw[leaf]);
             break;
@@ -496,6 +551,20 @@ int x86_cpuid_copy_from_buffer(struct cp
                 array_access_nospec(p->xstate.raw, data.subleaf) = l;
                 break;
 
+            case 0x1d:
+                if ( data.subleaf >= ARRAY_SIZE(p->tile.raw) )
+                    goto out_of_range;
+
+                array_access_nospec(p->tile.raw, data.subleaf) = l;
+                break;
+
+            case 0x1e:
+                if ( data.subleaf >= ARRAY_SIZE(p->tmul.raw) )
+                    goto out_of_range;
+
+                array_access_nospec(p->tmul.raw, data.subleaf) = l;
+                break;
+
             default:
                 if ( data.subleaf != XEN_CPUID_NO_SUBLEAF )
                     goto out_of_range;
--- a/xen/lib/x86/policy.c
+++ b/xen/lib/x86/policy.c
@@ -7,6 +7,7 @@ int x86_cpu_policies_are_compatible(cons
                                     struct cpu_policy_errors *err)
 {
     struct cpu_policy_errors e = INIT_CPU_POLICY_ERRORS;
+    unsigned int i;
     int ret = -EINVAL;
 
 #define NA XEN_CPUID_NO_SUBLEAF
@@ -21,6 +22,31 @@ int x86_cpu_policies_are_compatible(cons
     if ( guest->cpuid->feat.max_subleaf > host->cpuid->feat.max_subleaf )
         FAIL_CPUID(7, 0);
 
+    if ( (guest->cpuid->feat.amx_tile && !guest->cpuid->tile.max_palette) ||
+         guest->cpuid->tile.max_palette > host->cpuid->tile.max_palette )
+        FAIL_CPUID(0x1d, 0);
+
+    for ( i = 1; i <= guest->cpuid->tile.max_palette; ++i )
+    {
+        const typeof(guest->cpuid->tile.palette[0]) *gt, *ht;
+
+        gt = &guest->cpuid->tile.palette[i];
+        ht = &host->cpuid->tile.palette[i];
+
+        if ( gt->tot_bytes != ht->tot_bytes ||
+             gt->bytes_per_tile != ht->bytes_per_tile ||
+             gt->bytes_per_row != ht->bytes_per_row ||
+             !gt->num_regs || gt->num_regs > ht->num_regs ||
+             !gt->max_rows || gt->max_rows > ht->max_rows )
+            FAIL_CPUID(0x1d, i);
+    }
+
+    if ( ((guest->cpuid->feat.amx_int8 || guest->cpuid->feat.amx_bf16) &&
+          (!guest->cpuid->tmul.maxk || !guest->cpuid->tmul.maxn)) ||
+         guest->cpuid->tmul.maxk > host->cpuid->tmul.maxk ||
+         guest->cpuid->tmul.maxn > host->cpuid->tmul.maxn )
+        FAIL_CPUID(0x1e, 0);
+
     if ( guest->cpuid->extd.max_leaf > host->cpuid->extd.max_leaf )
         FAIL_CPUID(0x80000000, NA);
 
--- a/xen/lib/x86/private.h
+++ b/xen/lib/x86/private.h
@@ -17,13 +17,17 @@
 
 #else
 
+#include <assert.h>
 #include <errno.h>
 #include <inttypes.h>
 #include <stdbool.h>
 #include <stddef.h>
 #include <string.h>
 
+#define ASSERT assert
+
 #include <xen/asm/msr-index.h>
+#include <xen/asm/x86-defns.h>
 #include <xen/asm/x86-vendors.h>
 
 #include <xen-tools/libs.h>


