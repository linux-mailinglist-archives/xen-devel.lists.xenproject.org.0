Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0AF82B18A
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 16:17:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666347.1036916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNwoR-0000NJ-V1; Thu, 11 Jan 2024 15:17:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666347.1036916; Thu, 11 Jan 2024 15:17:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNwoR-0000Lb-QY; Thu, 11 Jan 2024 15:17:43 +0000
Received: by outflank-mailman (input) for mailman id 666347;
 Thu, 11 Jan 2024 15:17:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YFj+=IV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rNwoR-0000LM-4H
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 15:17:43 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ff68640-b094-11ee-98f0-6d05b1d4d9a1;
 Thu, 11 Jan 2024 16:17:41 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40e6297a00fso2509235e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jan 2024 07:17:41 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 fk10-20020a05600c0cca00b0040e5a0ebabesm4245126wmb.21.2024.01.11.07.17.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jan 2024 07:17:40 -0800 (PST)
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
X-Inumbo-ID: 8ff68640-b094-11ee-98f0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704986261; x=1705591061; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=R+dSy1p/6rzNzLV5se8Gs5M7zoR769dXJ05ONyzPn2E=;
        b=gGV7S1ZZzWqjnTzhWnjpFfJrW5UkMB63vh1Hu6WDYKOcHqsGhms6EjcvzyNFQwfYC7
         O2tXjC+7Orp9ST9yYc5FkNSz/lDNle6Gfp5nAXAQBSX38WDUfHvQDTO8Rm+gbXYSD0jI
         5Sb/7LHNx5sBRJW1kvE1cgewBbSl4QELckBdchX0Br9UjQ1P71ZtHgFs9Pfuz0XTBGCx
         5mHG38mLyCKnCDzL5yJ0FG/HYEstmq/l+022CmLlvmeMxaCXdIDRjiD6di29iCwHFCX8
         2hqROXwoEuPLDtG6bxve3vX/IQuA1LQrV2ptj8eFwb2+9boDMvgfPl4G9Sn7x+VIIRkI
         ZISw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704986261; x=1705591061;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R+dSy1p/6rzNzLV5se8Gs5M7zoR769dXJ05ONyzPn2E=;
        b=b/t0uxNNWHaey/88KQeLg4DXWLLoHr4PCuqra+2YT7VhJrFXaUtPKgQUXF9KFaROJ3
         yOUclJaAGw/K31o6nFwMQ1GUXnxbgYeBOd/QKgzcJypZlyXr+bLc2a83vIX4p0CbDCDr
         +7k3HrZ/YYAumm4a/ZN0uKp0GGm8aMAn4kN1w98sWHnHPB8OYRlgos6WDq3NJjecZO/h
         A6hqVCRxJd1b5/SrHki0yOd6GcIpIf9KDrlrg4+9AVVNEEF2WhcXFRI0/0IhZS4Oi/dH
         yxtqSU/m3RCHLuK8mFk+7vErSOikBI0lN2F/1RAXd6CAbH+Ec/0zuju+eoL/qV/XC4IP
         O5Pw==
X-Gm-Message-State: AOJu0YxAj8CerPrtCfYg8E5vrYFoeEBO2eEt3opa1C+2Qi+3CC41hyLD
	gP/0pw6jajxw6WU1kmLEihrnoTHsmMarKHsb7jkJQ6Jd6w==
X-Google-Smtp-Source: AGHT+IGQf7cRqqNV5GtlcBMvz4JCVgxMu6XWgsbg6v+x1tjn6FFdoqHDIIj1yS0f1YKAl1rNC1CSVw==
X-Received: by 2002:a05:600c:154d:b0:40e:6207:2eb8 with SMTP id f13-20020a05600c154d00b0040e62072eb8mr263634wmg.47.1704986260722;
        Thu, 11 Jan 2024 07:17:40 -0800 (PST)
Message-ID: <253a35dd-d6e3-46fd-b629-999c88a4b88f@suse.com>
Date: Thu, 11 Jan 2024 16:17:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/8] x86/CPUID: enable AVX10 leaf
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <298db76f-d0ee-4d47-931f-1baa1a7546cf@suse.com>
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
In-Reply-To: <298db76f-d0ee-4d47-931f-1baa1a7546cf@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

This requires bumping the number of basic leaves we support. Apart from
this the logic is modeled as closely as possible after that of leaf 7
handling.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
The gen-cpuid.py adjustment is merely the minimum needed. It's not
really clear to me whether someone turning off e.g. AVX512BW might then
also validly expect AVX10 to be turned off.

Spec version 2 leaves unclear what the xstate components are which would
need enabling for AVX10/256. recalculate_{xstate,misc}() are therefore
conservative for now.

Do we want to synthesize AVX10 in the policy when all necessary AVX512*
features are available, thus allowing migration from an AVX10 host to a
suitable non-AVX10 one?

--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -230,7 +230,7 @@ static const char *const str_7d1[32] =
 
     [14] = "prefetchi",           [15] = "user-msr",
 
-    [18] = "cet-sss",
+    [18] = "cet-sss",             [19] = "avx10",
 };
 
 static const char *const str_7d2[32] =
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -221,7 +221,7 @@ static void recalculate_xstate(struct cp
                           xstate_sizes[X86_XCR0_BNDCSR_POS]);
     }
 
-    if ( p->feat.avx512f )
+    if ( p->feat.avx512f || (p->feat.avx10 && p->avx10.vsz512) )
     {
         xstates |= X86_XCR0_OPMASK | X86_XCR0_ZMM | X86_XCR0_HI_ZMM;
         xstate_size = max(xstate_size,
@@ -283,6 +283,16 @@ static void recalculate_misc(struct cpu_
 
     p->basic.raw[0xc] = EMPTY_LEAF;
 
+    zero_leaves(p->basic.raw, 0xe, 0x23);
+
+    p->avx10.raw[0].b &= 0x000700ff;
+    p->avx10.raw[0].c = p->avx10.raw[0].d = 0;
+    if ( !p->feat.avx10 || !p->avx10.version || !p->avx10.vsz512 )
+    {
+        p->feat.avx10 = false;
+        memset(p->avx10.raw, 0, sizeof(p->avx10.raw));
+    }
+
     p->extd.e1d &= ~CPUID_COMMON_1D_FEATURES;
 
     /* Most of Power/RAS hidden from guests. */
@@ -800,6 +810,7 @@ void recalculate_cpuid_policy(struct dom
 
     p->basic.max_leaf   = min(p->basic.max_leaf,   max->basic.max_leaf);
     p->feat.max_subleaf = min(p->feat.max_subleaf, max->feat.max_subleaf);
+    p->avx10.max_subleaf = min(p->avx10.max_subleaf, max->avx10.max_subleaf);
     p->extd.max_leaf    = 0x80000000U | min(p->extd.max_leaf & 0xffff,
                                             ((p->x86_vendor & (X86_VENDOR_AMD |
                                                                X86_VENDOR_HYGON))
@@ -854,6 +865,8 @@ void recalculate_cpuid_policy(struct dom
 
     if ( p->basic.max_leaf < XSTATE_CPUID )
         __clear_bit(X86_FEATURE_XSAVE, fs);
+    if ( p->basic.max_leaf < 0x24 )
+        __clear_bit(X86_FEATURE_AVX10, fs);
 
     sanitise_featureset(fs);
 
@@ -967,6 +980,8 @@ static void __init __maybe_unused build_
                  sizeof(raw_cpu_policy.feat.raw));
     BUILD_BUG_ON(sizeof(raw_cpu_policy.xstate) !=
                  sizeof(raw_cpu_policy.xstate.raw));
+    BUILD_BUG_ON(sizeof(raw_cpu_policy.avx10) !=
+                 sizeof(raw_cpu_policy.avx10.raw));
     BUILD_BUG_ON(sizeof(raw_cpu_policy.extd) !=
                  sizeof(raw_cpu_policy.extd.raw));
 }
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -87,6 +87,15 @@ void guest_cpuid(const struct vcpu *v, u
             *res = array_access_nospec(p->xstate.raw, subleaf);
             break;
 
+        case 0x24:
+            ASSERT(p->avx10.max_subleaf < ARRAY_SIZE(p->avx10.raw));
+            if ( subleaf > min_t(uint32_t, p->avx10.max_subleaf,
+                                 ARRAY_SIZE(p->avx10.raw) - 1) )
+                return;
+
+            *res = array_access_nospec(p->avx10.raw, subleaf);
+            break;
+
         default:
             *res = array_access_nospec(p->basic.raw, leaf);
             break;
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -321,6 +321,7 @@ XEN_CPUFEATURE(AVX_VNNI_INT16,     15*32
 XEN_CPUFEATURE(PREFETCHI,          15*32+14) /*A  PREFETCHIT{0,1} Instructions */
 XEN_CPUFEATURE(USER_MSR,           15*32+15) /*s  U{RD,WR}MSR Instructions */
 XEN_CPUFEATURE(CET_SSS,            15*32+18) /*   CET Supervisor Shadow Stacks safe to use */
+XEN_CPUFEATURE(AVX10,              15*32+19) /*   AVX10 Converged Vector ISA */
 
 /* Intel-defined CPU features, MSR_ARCH_CAPS 0x10a.eax, word 16 */
 XEN_CPUFEATURE(RDCL_NO,            16*32+ 0) /*A  No Rogue Data Cache Load (Meltdown) */
--- a/xen/include/xen/lib/x86/cpu-policy.h
+++ b/xen/include/xen/lib/x86/cpu-policy.h
@@ -85,11 +85,12 @@ unsigned int x86_cpuid_lookup_vendor(uin
  */
 const char *x86_cpuid_vendor_to_str(unsigned int vendor);
 
-#define CPUID_GUEST_NR_BASIC      (0xdu + 1)
+#define CPUID_GUEST_NR_BASIC      (0x24u + 1)
 #define CPUID_GUEST_NR_CACHE      (5u + 1)
 #define CPUID_GUEST_NR_FEAT       (2u + 1)
 #define CPUID_GUEST_NR_TOPO       (1u + 1)
 #define CPUID_GUEST_NR_XSTATE     (62u + 1)
+#define CPUID_GUEST_NR_AVX10      (0u + 1)
 #define CPUID_GUEST_NR_EXTD_INTEL (0x8u + 1)
 #define CPUID_GUEST_NR_EXTD_AMD   (0x21u + 1)
 #define CPUID_GUEST_NR_EXTD       MAX(CPUID_GUEST_NR_EXTD_INTEL, \
@@ -255,6 +256,19 @@ struct cpu_policy
         } comp[CPUID_GUEST_NR_XSTATE];
     } xstate;
 
+    /* Structured AVX10 information leaf: 0x000000024[xx] */
+    union {
+        struct cpuid_leaf raw[CPUID_GUEST_NR_AVX10];
+        struct {
+            /* Subleaf 0. */
+            uint32_t max_subleaf;
+            uint32_t version:8, :8;
+            bool vsz128:1, vsz256:1, vsz512:1;
+            uint32_t :13;
+            uint32_t /* c */:32, /* d */:32;
+        };
+    } avx10;
+
     /* Extended leaves: 0x800000xx */
     union {
         struct cpuid_leaf raw[CPUID_GUEST_NR_EXTD];
--- a/xen/lib/x86/cpuid.c
+++ b/xen/lib/x86/cpuid.c
@@ -123,6 +123,7 @@ void x86_cpu_policy_fill_native(struct c
         switch ( i )
         {
         case 0x4: case 0x7: case 0xb: case 0xd:
+        case 0x24:
             /* Multi-invocation leaves.  Deferred. */
             continue;
         }
@@ -216,6 +217,15 @@ void x86_cpu_policy_fill_native(struct c
         }
     }
 
+    if ( p->basic.max_leaf >= 0x24 )
+    {
+        cpuid_count_leaf(0x24, 0, &p->avx10.raw[0]);
+
+        for ( i = 1; i <= MIN(p->avx10.max_subleaf,
+                              ARRAY_SIZE(p->avx10.raw) - 1); ++i )
+            cpuid_count_leaf(0x24, i, &p->avx10.raw[i]);
+    }
+
     /* Extended leaves. */
     cpuid_leaf(0x80000000U, &p->extd.raw[0]);
     for ( i = 1; i <= MIN(p->extd.max_leaf & 0xffffU,
@@ -285,6 +295,9 @@ void x86_cpu_policy_clear_out_of_range_l
                     ARRAY_SIZE(p->xstate.raw) - 1);
     }
 
+    if ( p->basic.max_leaf < 0x24 )
+        memset(p->avx10.raw, 0, sizeof(p->avx10.raw));
+
     zero_leaves(p->extd.raw,
                 ((p->extd.max_leaf >> 16) == 0x8000
                  ? (p->extd.max_leaf & 0xffff) + 1 : 0),
@@ -297,6 +310,8 @@ void __init x86_cpu_policy_bound_max_lea
         min_t(uint32_t, p->basic.max_leaf, ARRAY_SIZE(p->basic.raw) - 1);
     p->feat.max_subleaf =
         min_t(uint32_t, p->feat.max_subleaf, ARRAY_SIZE(p->feat.raw) - 1);
+    p->avx10.max_subleaf =
+        min_t(uint32_t, p->avx10.max_subleaf, ARRAY_SIZE(p->avx10.raw) - 1);
     p->extd.max_leaf = 0x80000000U | min_t(uint32_t, p->extd.max_leaf & 0xffff,
                                            ARRAY_SIZE(p->extd.raw) - 1);
 }
@@ -324,6 +339,8 @@ void x86_cpu_policy_shrink_max_leaves(st
      */
     p->basic.raw[0xd] = p->xstate.raw[0];
 
+    p->basic.raw[0x24] = p->avx10.raw[0];
+
     for ( i = p->basic.max_leaf; i; --i )
         if ( p->basic.raw[i].a | p->basic.raw[i].b |
              p->basic.raw[i].c | p->basic.raw[i].d )
@@ -457,6 +474,13 @@ int x86_cpuid_copy_to_buffer(const struc
             break;
         }
 
+        case 0x24:
+            for ( subleaf = 0;
+                  subleaf <= MIN(p->avx10.max_subleaf,
+                                 ARRAY_SIZE(p->avx10.raw) - 1); ++subleaf )
+                COPY_LEAF(leaf, subleaf, &p->avx10.raw[subleaf]);
+            break;
+
         default:
             COPY_LEAF(leaf, XEN_CPUID_NO_SUBLEAF, &p->basic.raw[leaf]);
             break;
@@ -549,6 +573,13 @@ int x86_cpuid_copy_from_buffer(struct cp
                 array_access_nospec(p->xstate.raw, data.subleaf) = l;
                 break;
 
+            case 0x24:
+                if ( data.subleaf >= ARRAY_SIZE(p->avx10.raw) )
+                    goto out_of_range;
+
+                array_access_nospec(p->avx10.raw, data.subleaf) = l;
+                break;
+
             default:
                 if ( data.subleaf != XEN_CPUID_NO_SUBLEAF )
                     goto out_of_range;
--- a/xen/lib/x86/policy.c
+++ b/xen/lib/x86/policy.c
@@ -21,6 +21,14 @@ int x86_cpu_policies_are_compatible(cons
     if ( guest->feat.max_subleaf > host->feat.max_subleaf )
         FAIL_CPUID(7, 0);
 
+    if ( guest->avx10.version > host->avx10.version ||
+         (guest->avx10.vsz512
+          ? !host->avx10.vsz512
+          : guest->avx10.vsz256
+            ? !host->avx10.vsz256
+            : guest->avx10.vsz128 && !host->avx10.vsz128 ) )
+        FAIL_CPUID(0x24, 0);
+
     if ( guest->extd.max_leaf > host->extd.max_leaf )
         FAIL_CPUID(0x80000000U, NA);
 
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -286,7 +286,7 @@ def crunch_numbers(state):
         # enabled.  Certain later extensions, acting on 256-bit vectors of
         # integers, better depend on AVX2 than AVX.
         AVX2: [AVX512F, VAES, VPCLMULQDQ, AVX_VNNI, AVX_IFMA, AVX_VNNI_INT8,
-               AVX_VNNI_INT16, SHA512, SM4],
+               AVX_VNNI_INT16, SHA512, SM4, AVX10],
 
         # AVX512F is taken to mean hardware support for 512bit registers
         # (which in practice depends on the EVEX prefix to encode) as well


