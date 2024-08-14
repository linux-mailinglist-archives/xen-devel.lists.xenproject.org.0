Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED349516A8
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2024 10:35:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776838.1187019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1se9Sn-0003N6-4u; Wed, 14 Aug 2024 08:34:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776838.1187019; Wed, 14 Aug 2024 08:34:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1se9Sn-0003KB-1F; Wed, 14 Aug 2024 08:34:37 +0000
Received: by outflank-mailman (input) for mailman id 776838;
 Wed, 14 Aug 2024 08:34:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NhoJ=PN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1se9Sl-0002t1-J4
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2024 08:34:35 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08e01e7f-5a18-11ef-a505-bb4a2ccca743;
 Wed, 14 Aug 2024 10:34:34 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5b01af9b0c9so6675055a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Aug 2024 01:34:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a80f411d937sm145127666b.111.2024.08.14.01.34.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Aug 2024 01:34:33 -0700 (PDT)
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
X-Inumbo-ID: 08e01e7f-5a18-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723624474; x=1724229274; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LD7RVoUrYY1rDlKvCdkTHU6WjFnBT4YHFAlrub8IVO4=;
        b=LeNGtusjJsDaGNOCKgMOZKx48z4JIhnNpVYiwTiTlmLNk+BRWM2dstePziFT2ZNCS5
         ceM7YHQIaBeTJDiol5SLOi1N+ITC2VXF0PbzpAYe8w8hha8rV2sEdEq3iF6Pbtdcg7Xx
         6LFdRSrV/5NGqk7riZo3nqDhpgUiTY9ZYN1PkdhSbSvQZU/6aEAc0F7t0RiJI5QSb2lI
         qUA+maaj9BBg5WpYg+GIpZKPiCnWFj7mkSUxBOt7AMFPf/EJ9AW3rI05AACqPm2kScZm
         LC9c4VCls9/TUszbFj+dEQPXP996x0JY6GcAdahZmM8G4tqTJ8cXdQe75PJECTU7A4+O
         2UBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723624474; x=1724229274;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LD7RVoUrYY1rDlKvCdkTHU6WjFnBT4YHFAlrub8IVO4=;
        b=jzaLJmKMdcsfVyt6AHE/cKWT+L4vG4d2TjLYyd5UCNJOEiJkSH2Pxza7ZEly2hwU9S
         3xCq3/nOct7ccu4b7mraNUUTDaBCvBwWZqHTWgN2Qb1TuOTGRPqduoVSbQXR5ci57eEk
         emFykdxPHhlvozcneZ9JgyAwB8NinBJZa7HHFTmugf25qzSe7hzLeGJXrykx5HVp+MrG
         5hKCrPU3if2NhgkSYU9ys5JEKgUYz++He/KEuegJ1UHFl53qZZOZ4zohZTHdkyP53yHg
         xgxH9062zv//rzObhlZCFKN9UNMWdLOqsaWk7cwdHZoAGENpDfFu2QMPcc5FLpKayYDY
         P2Xg==
X-Gm-Message-State: AOJu0YygwmBhFf0leNQyRay3K87KPMP1eW9hPWWQmixsWpGyDAN6t76F
	10D52GNJUxOY0bs3tf/D5T1avnckScgepLHCBIWCasm/KIsQWPIlwWOdf5hE13swQI3TayA8eP8
	=
X-Google-Smtp-Source: AGHT+IHWUaziJt40slXYLfx/zS5l1+3OfS3Z5OEo1sRZe3QlOAtQ2/mTjjFrEby006NjocinUX1CmA==
X-Received: by 2002:a17:907:f765:b0:a7a:c256:3cf with SMTP id a640c23a62f3a-a8366d38ec6mr156646666b.24.1723624474076;
        Wed, 14 Aug 2024 01:34:34 -0700 (PDT)
Message-ID: <44d9ae81-14e4-4ade-adda-32f453e32f87@suse.com>
Date: Wed, 14 Aug 2024 10:34:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v5 2/3] x86/CPUID: shrink max_{,sub}leaf fields according to
 actual leaf contents
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <2500a119-1734-44c2-9868-640bcc8ead2d@suse.com>
Content-Language: en-US
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
In-Reply-To: <2500a119-1734-44c2-9868-640bcc8ead2d@suse.com>
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
     recorded / come from. (Supposedly there was a patch from Roger
     under similar or even the same title, which should have eliminated
     the need for the patch here, but upon searching I can't find such a
     patch.)
---
v5: Re-base.
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
 
+#define XSTATE_FP_SSE  (X86_XCR0_X87 | X86_XCR0_SSE)
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
@@ -383,6 +383,8 @@ static void __init calculate_host_policy
     if ( vpmu_mode == XENPMU_MODE_OFF )
         p->basic.raw[0xa] = EMPTY_LEAF;
 
+    x86_cpu_policy_shrink_max_leaves(p);
+
     /* 0x000000ce  MSR_INTEL_PLATFORM_INFO */
     /* probe_cpuid_faulting() sanity checks presence of MISC_FEATURES_ENABLES */
     p->platform_info.cpuid_faulting = cpu_has_cpuid_faulting;
@@ -576,12 +578,6 @@ static void __init calculate_pv_max_poli
 
     *p = host_cpu_policy;
 
-    /*
-     * Some VMs may have a larger-than-necessary feat max_subleaf.  Allow them
-     * to migrate in.
-     */
-    p->feat.max_subleaf = ARRAY_SIZE(p->feat.raw) - 1;
-
     x86_cpu_policy_to_featureset(p, fs);
 
     for ( i = 0; i < ARRAY_SIZE(fs); ++i )
@@ -613,6 +609,14 @@ static void __init calculate_pv_max_poli
     recalculate_xstate(p);
 
     p->extd.raw[0xa] = EMPTY_LEAF; /* No SVM for PV guests. */
+
+    x86_cpu_policy_shrink_max_leaves(p);
+
+    /*
+     * Some VMs may have a larger-than-necessary feat max_subleaf.  Allow them
+     * to migrate in.
+     */
+    p->feat.max_subleaf = ARRAY_SIZE(p->feat.raw) - 1;
 }
 
 static void __init calculate_pv_def_policy(void)
@@ -663,12 +667,6 @@ static void __init calculate_hvm_max_pol
 
     *p = host_cpu_policy;
 
-    /*
-     * Some VMs may have a larger-than-necessary feat max_subleaf.  Allow them
-     * to migrate in.
-     */
-    p->feat.max_subleaf = ARRAY_SIZE(p->feat.raw) - 1;
-
     x86_cpu_policy_to_featureset(p, fs);
 
     mask = hvm_hap_supported() ?
@@ -774,6 +772,14 @@ static void __init calculate_hvm_max_pol
     x86_cpu_featureset_to_policy(fs, p);
     recalculate_xstate(p);
 
+    x86_cpu_policy_shrink_max_leaves(p);
+
+    /*
+     * Some VMs may have a larger-than-necessary feat max_subleaf.  Allow them
+     * to migrate in.
+     */
+    p->feat.max_subleaf = ARRAY_SIZE(p->feat.raw) - 1;
+
     /* It's always possible to emulate CPUID faulting for HVM guests */
     p->platform_info.cpuid_faulting = true;
 }
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1060,13 +1060,15 @@ void cpuid_hypervisor_leaves(const struc
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
 #include <public/xen.h>
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


