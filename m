Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5510782B093
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 15:24:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666320.1036875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNvzC-0003b4-8t; Thu, 11 Jan 2024 14:24:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666320.1036875; Thu, 11 Jan 2024 14:24:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNvzC-0003Z6-52; Thu, 11 Jan 2024 14:24:46 +0000
Received: by outflank-mailman (input) for mailman id 666320;
 Thu, 11 Jan 2024 14:24:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YFj+=IV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rNvzA-0002j1-J1
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 14:24:44 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a050d0f-b08d-11ee-98f0-6d05b1d4d9a1;
 Thu, 11 Jan 2024 15:24:43 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2cd65f803b7so37244841fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jan 2024 06:24:43 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 y7-20020a92d0c7000000b0035fffb69deasm313951ila.81.2024.01.11.06.24.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jan 2024 06:24:42 -0800 (PST)
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
X-Inumbo-ID: 2a050d0f-b08d-11ee-98f0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704983083; x=1705587883; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=l0Cv5+fjR0qcX/c8Gmgh6k588kDC5I5fxICP+UlWs7Y=;
        b=epcatYHemsdCD9Bj5CsDnTAyNwxOPIJR0XYP2GM9n+9/bqlJlNmwTYKCu3+aZ7H/qU
         k1l45NCIjlofL8XVcwRi8mJsauFm+wdRXcPyCeFhGR98azSxhS4u7hp2vC+StD+fTlPP
         faeC0qLnMMuZbBTei+E8D2ix2cO2TIufVV6eQoAbiI+QzaiHTEKXFNvz3E2NvV7KB2gl
         v7CnL/Cj+1Avqzjd+MZxTYftlZwjVbKRLMM6GtvXwKzQOmHsRBYQyzJ+vRJgXmhhJkvr
         gO0o3q99TbOvKdHavDD1sk/GiA81QqKFXSUM9vtVIpFWKlEBDBHmFN1uQem5AeyM5kAb
         1Cqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704983083; x=1705587883;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l0Cv5+fjR0qcX/c8Gmgh6k588kDC5I5fxICP+UlWs7Y=;
        b=lnHy3qCzlvrTTcQhHX5d9QGmPjgpCU9k2L2aCqt7NeHT2QeBOJsuXUQjlwJBvFV9D6
         CVp5rxJXYa9ZA5B5YYV1MYTEJCcc6vJbeZ+bwcuasZGMjkeEudNynNdwHICgDVNC0xLA
         yo8kulv8I4WeoDN38UbkdPCW1YuS0KU2KeIN5CHQwYLaqZmvgdxlfIHOREFPFnrdYUIu
         teO4ONpvKuXnqMyf8dXhLulWLlMeed6MRSCWSk10tXcHeOBajHlOuyCzbg6FhKOwnGob
         21AmApddLJ0bM4eQoC1Pu9KlIQFGFpkyrWDke3KSHDAmc+qr6ckBSm3uRLBKE7etEla0
         FIZQ==
X-Gm-Message-State: AOJu0Yz35qxlIHpES5av2i0X5vjMcQXitI7RUHme0cdgHfY44VrqEF9R
	vSV80yTVxWRWeHkwoGFKKDrWMw5RJSbSk7gztOllY19WoQ==
X-Google-Smtp-Source: AGHT+IG5sZVmGe/lBcq/mtna4QlZvklmrmEHUkbyL9WYNEZyR3Llb5XKaNweos/nFq5lZoxukde9rA==
X-Received: by 2002:a2e:6a12:0:b0:2cc:c377:2baa with SMTP id f18-20020a2e6a12000000b002ccc3772baamr475158ljc.38.1704983083310;
        Thu, 11 Jan 2024 06:24:43 -0800 (PST)
Message-ID: <73296b85-e531-4622-97f9-655c35884df7@suse.com>
Date: Thu, 11 Jan 2024 15:24:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 2/3] x86/CPUID: shrink max_{,sub}leaf fields according to
 actual leaf contents
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <774ece90-296a-4975-a31f-038de45e98bc@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <774ece90-296a-4975-a31f-038de45e98bc@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Zapping leaf data for out of range leaves is just one half of it: To
avoid guests (bogusly or worse) inferring information from mere leaf
presence, also shrink maximum indicators such that the respective
trailing entry is not all blank (unless of course it's the initial
subleaf of a leaf that's not the final one).

This is also in preparation of bumping the maximum basic leaf we
support, to ensure guests not getting exposed related features won't
observe a change in behavior.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
TBD: The use in xc_cpuid_apply_policy() supposedly needs to further
     respect user (or migration source) max (sub)leaf values (i.e. the
     function needs calling unconditionally and then higher inputs need
     putting back); question is where those original values would be
     recorded / come from. (Supposedly there was a patch from Roger's
     under similar or even the same title, which should have eliminated
     the need for the patch here, but upon searching I can't find such a
     patch.)
---
v4: Re-instate with default policy shrinking dropped, and with
    81da2b544cbb folded in. Re-base.
v3: Record the actual non-empty subleaf in p->basic.raw[0x7], rather
    than subleaf 0. Re-base over Viridian leaf 40000005 addition.
v2: New.

--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -783,6 +783,13 @@ int xc_cpuid_apply_policy(xc_interface *
         }
     }
 
+    /*
+     * Do not try to shrink the policy if restoring, as that could cause
+     * guest visible changes in the maximum leaf fields.
+     */
+    if ( !restore )
+        x86_cpu_policy_shrink_max_leaves(&p->policy);
+
     nr_leaves = ARRAY_SIZE(p->leaves);
     rc = x86_cpuid_copy_to_buffer(&p->policy, p->leaves, &nr_leaves);
     if ( rc )
--- a/tools/tests/cpu-policy/test-cpu-policy.c
+++ b/tools/tests/cpu-policy/test-cpu-policy.c
@@ -8,10 +8,13 @@
 #include <err.h>
 
 #include <xen-tools/common-macros.h>
+#include <xen/asm/x86-defns.h>
 #include <xen/asm/x86-vendors.h>
 #include <xen/lib/x86/cpu-policy.h>
 #include <xen/domctl.h>
 
+#define XSTATE_FP_SSE  (X86_XCR0_FP | X86_XCR0_SSE)
+
 static unsigned int nr_failures;
 #define fail(fmt, ...)                          \
 ({                                              \
@@ -576,6 +579,103 @@ static void test_cpuid_out_of_range_clea
     }
 }
 
+static void test_cpuid_maximum_leaf_shrinking(void)
+{
+    static const struct test {
+        const char *name;
+        struct cpu_policy p;
+    } tests[] = {
+        {
+            .name = "basic",
+            .p = {
+                /* Very basic information only. */
+                .basic.max_leaf = 1,
+                .basic.raw_fms = 0xc2,
+            },
+        },
+        {
+            .name = "cache",
+            .p = {
+                /* Cache subleaves present. */
+                .basic.max_leaf = 4,
+                .cache.subleaf[0].type = 1,
+            },
+        },
+        {
+            .name = "feat#0",
+            .p = {
+                /* Subleaf 0 only with some valid bit. */
+                .basic.max_leaf = 7,
+                .feat.max_subleaf = 0,
+                .feat.fsgsbase = 1,
+            },
+        },
+        {
+            .name = "feat#1",
+            .p = {
+                /* Subleaf 1 only with some valid bit. */
+                .basic.max_leaf = 7,
+                .feat.max_subleaf = 1,
+                .feat.avx_vnni = 1,
+            },
+        },
+        {
+            .name = "topo",
+            .p = {
+                /* Topology subleaves present. */
+                .basic.max_leaf = 0xb,
+                .topo.subleaf[0].type = 1,
+            },
+        },
+        {
+            .name = "xstate",
+            .p = {
+                /* First subleaf always valid (and then non-zero). */
+                .basic.max_leaf = 0xd,
+                .xstate.xcr0_low = XSTATE_FP_SSE,
+            },
+        },
+        {
+            .name = "extd",
+            .p = {
+                /* Commonly available information only. */
+                .extd.max_leaf = 0x80000008,
+                .extd.maxphysaddr = 0x28,
+                .extd.maxlinaddr = 0x30,
+            },
+        },
+    };
+
+    printf("Testing CPUID maximum leaf shrinking:\n");
+
+    for ( size_t i = 0; i < ARRAY_SIZE(tests); ++i )
+    {
+        const struct test *t = &tests[i];
+        struct cpu_policy *p = memdup(&t->p);
+
+        p->basic.max_leaf = ARRAY_SIZE(p->basic.raw) - 1;
+        p->feat.max_subleaf = ARRAY_SIZE(p->feat.raw) - 1;
+        p->extd.max_leaf = 0x80000000 | (ARRAY_SIZE(p->extd.raw) - 1);
+
+        x86_cpu_policy_shrink_max_leaves(p);
+
+        /* Check the the resulting max (sub)leaf values against expecations. */
+        if ( p->basic.max_leaf != t->p.basic.max_leaf )
+             fail("  Test %s basic fail - expected %#x, got %#x\n",
+                  t->name, t->p.basic.max_leaf, p->basic.max_leaf);
+
+        if ( p->extd.max_leaf != t->p.extd.max_leaf )
+             fail("  Test %s extd fail - expected %#x, got %#x\n",
+                  t->name, t->p.extd.max_leaf, p->extd.max_leaf);
+
+        if ( p->feat.max_subleaf != t->p.feat.max_subleaf )
+             fail("  Test %s feat fail - expected %#x, got %#x\n",
+                  t->name, t->p.feat.max_subleaf, p->feat.max_subleaf);
+
+        free(p);
+    }
+}
+
 static void test_is_compatible_success(void)
 {
     static struct test {
@@ -671,6 +771,7 @@ int main(int argc, char **argv)
     test_cpuid_serialise_success();
     test_cpuid_deserialise_failure();
     test_cpuid_out_of_range_clearing();
+    test_cpuid_maximum_leaf_shrinking();
 
     test_msr_serialise_success();
     test_msr_deserialise_failure();
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -404,6 +404,8 @@ static void __init calculate_host_policy
                                (1u << SVM_FEATURE_TSCRATEMSR));
     }
 
+    x86_cpu_policy_shrink_max_leaves(p);
+
     /* 0x000000ce  MSR_INTEL_PLATFORM_INFO */
     /* probe_cpuid_faulting() sanity checks presence of MISC_FEATURES_ENABLES */
     p->platform_info.cpuid_faulting = cpu_has_cpuid_faulting;
@@ -548,6 +550,8 @@ static void __init calculate_pv_max_poli
     recalculate_xstate(p);
 
     p->extd.raw[0xa] = EMPTY_LEAF; /* No SVM for PV guests. */
+
+    x86_cpu_policy_shrink_max_leaves(p);
 }
 
 static void __init calculate_pv_def_policy(void)
@@ -682,6 +686,8 @@ static void __init calculate_hvm_max_pol
     x86_cpu_featureset_to_policy(fs, p);
     recalculate_xstate(p);
 
+    x86_cpu_policy_shrink_max_leaves(p);
+
     /* It's always possible to emulate CPUID faulting for HVM guests */
     p->platform_info.cpuid_faulting = true;
 }
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1027,13 +1027,15 @@ void cpuid_hypervisor_leaves(const struc
     uint32_t base = is_viridian_domain(d) ? 0x40000100 : 0x40000000;
     uint32_t idx  = leaf - base;
     unsigned int limit = is_viridian_domain(d) ? p->hv2_limit : p->hv_limit;
+    unsigned int dflt = is_pv_domain(d) ? XEN_CPUID_MAX_PV_NUM_LEAVES
+                                        : XEN_CPUID_MAX_HVM_NUM_LEAVES;
 
     if ( limit == 0 )
         /* Default number of leaves */
-        limit = XEN_CPUID_MAX_NUM_LEAVES;
+        limit = dflt;
     else
         /* Clamp toolstack value between 2 and MAX_NUM_LEAVES. */
-        limit = min(max(limit, 2u), XEN_CPUID_MAX_NUM_LEAVES + 0u);
+        limit = min(max(limit, 2u), dflt);
 
     if ( idx > limit )
         return;
--- a/xen/include/public/arch-x86/cpuid.h
+++ b/xen/include/public/arch-x86/cpuid.h
@@ -117,6 +117,10 @@
 /* Max. address width in bits taking memory hotplug into account. */
 #define XEN_CPUID_MACHINE_ADDRESS_WIDTH_MASK (0xffu << 0)
 
-#define XEN_CPUID_MAX_NUM_LEAVES 5
+#define XEN_CPUID_MAX_PV_NUM_LEAVES 5
+#define XEN_CPUID_MAX_HVM_NUM_LEAVES 4
+#define XEN_CPUID_MAX_NUM_LEAVES \
+    (XEN_CPUID_MAX_PV_NUM_LEAVES > XEN_CPUID_MAX_HVM_NUM_LEAVES ? \
+     XEN_CPUID_MAX_PV_NUM_LEAVES : XEN_CPUID_MAX_HVM_NUM_LEAVES)
 
 #endif /* __XEN_PUBLIC_ARCH_X86_CPUID_H__ */
--- a/xen/include/xen/lib/x86/cpu-policy.h
+++ b/xen/include/xen/lib/x86/cpu-policy.h
@@ -438,6 +438,13 @@ void x86_cpu_policy_fill_native(struct c
  */
 void x86_cpu_policy_clear_out_of_range_leaves(struct cpu_policy *p);
 
+/**
+ * Shrink max leaf/subleaf values such that the last respective valid entry
+ * isn't all blank.  While permitted by the spec, such extraneous leaves may
+ * provide undue "hints" to guests.
+ */
+void x86_cpu_policy_shrink_max_leaves(struct cpu_policy *p);
+
 #ifdef __XEN__
 #include <public/arch-x86/xen.h>
 typedef XEN_GUEST_HANDLE_64(xen_cpuid_leaf_t) cpuid_leaf_buffer_t;
--- a/xen/lib/x86/cpuid.c
+++ b/xen/lib/x86/cpuid.c
@@ -291,6 +291,45 @@ void x86_cpu_policy_clear_out_of_range_l
                 ARRAY_SIZE(p->extd.raw) - 1);
 }
 
+void x86_cpu_policy_shrink_max_leaves(struct cpu_policy *p)
+{
+    unsigned int i;
+
+    p->basic.raw[0x4] = p->cache.raw[0];
+
+    for ( i = p->feat.max_subleaf; i; --i )
+        if ( p->feat.raw[i].a | p->feat.raw[i].b |
+             p->feat.raw[i].c | p->feat.raw[i].d )
+            break;
+    p->feat.max_subleaf = i;
+    p->basic.raw[0x7] = p->feat.raw[i];
+
+    p->basic.raw[0xb] = p->topo.raw[0];
+
+    /*
+     * Due to the way xstate gets handled in the hypervisor (see
+     * recalculate_xstate()) there is (for now at least) no need to fiddle
+     * with the xstate subleaves (IOW we assume they're already in consistent
+     * shape, for coming from either hardware or recalculate_xstate()).
+     */
+    p->basic.raw[0xd] = p->xstate.raw[0];
+
+    for ( i = p->basic.max_leaf; i; --i )
+        if ( p->basic.raw[i].a | p->basic.raw[i].b |
+             p->basic.raw[i].c | p->basic.raw[i].d )
+            break;
+    p->basic.max_leaf = i;
+
+    for ( i = p->extd.max_leaf & 0xffff; i; --i )
+        if ( p->extd.raw[i].a | p->extd.raw[i].b |
+             p->extd.raw[i].c | p->extd.raw[i].d )
+            break;
+    if ( i | p->extd.raw[0].b | p->extd.raw[0].c | p->extd.raw[0].d )
+        p->extd.max_leaf = 0x80000000U | i;
+    else
+        p->extd.max_leaf = 0;
+}
+
 const uint32_t *x86_cpu_policy_lookup_deep_deps(uint32_t feature)
 {
     static const uint32_t deep_features[] = INIT_DEEP_FEATURES;


