Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF4582B09C
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 15:25:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666325.1036886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNvzt-0004Dd-KT; Thu, 11 Jan 2024 14:25:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666325.1036886; Thu, 11 Jan 2024 14:25:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNvzt-0004Bw-GM; Thu, 11 Jan 2024 14:25:29 +0000
Received: by outflank-mailman (input) for mailman id 666325;
 Thu, 11 Jan 2024 14:25:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YFj+=IV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rNvzs-0004Bg-06
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 14:25:28 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43e263df-b08d-11ee-98f0-6d05b1d4d9a1;
 Thu, 11 Jan 2024 15:25:27 +0100 (CET)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2cd17a979bcso60507511fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jan 2024 06:25:27 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 y7-20020a92d0c7000000b0035fffb69deasm313951ila.81.2024.01.11.06.25.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jan 2024 06:25:26 -0800 (PST)
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
X-Inumbo-ID: 43e263df-b08d-11ee-98f0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704983127; x=1705587927; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nxlZsfY9nRps0k+Fd9YTdSyalzLKovC0rZ6cYhnCGsA=;
        b=TUrIKiyfoa9pOZldEbhvxkS1X+A0ETMqyuAILpCrunryT1K8eZ3f5nTF7GOruUYOgh
         /4t6rtH8vRY3RSZT3OfPjzLSZmrkbbosHoWLXpPxoF24beDh5bWrOW+nGF8rB7PhbqSm
         lTgBmtClk3kBInwHnTvSiimhpTPREqNyu8GxubIvjVbFE7080TnCXV055EoS1wWBxIR/
         19IYn5zfSbB4dECYvD0J2eBVs966zS2clWYihxORDhmhHkHsgwAoJ+E0Ll9MqSWGws5X
         PSd1abJdeybHAIL0jzFV6LFEA5rZa14R+CL02MTMsiBxR/jEVBgaB2ZI/fZGF1qGyIFm
         bmyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704983127; x=1705587927;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nxlZsfY9nRps0k+Fd9YTdSyalzLKovC0rZ6cYhnCGsA=;
        b=ke52WiYcLb3ZxbjTwb42OeJjKoJZu3JoNrSzLFIBIFNKt4zKO3lM34xE7+KVlWr60U
         IQiB1h8czgcZ0ysvy8wll/zHNQNDDVbOxL4FAOtABadYOCSXMM/nha+16ivhdDBmL+lc
         ALnc5Gryy7idz7xcEvM+Q3wYab6crxfoRFlpdzjtzclt+5JQYYrYOdqnhpXdXqVmRLKV
         dNhjj7gOvOdcQMAFfhs1RaPVOi0kr2tVm0Sj6DyJFk2B5CFUkojLLCC8rGgFe5nMZBxP
         At993IEF5NL9h0STkszyXhc2y+meqwpQbLfW2FRrpV+9sncE4UGw0HYWGfh3Q2NUF8gP
         0ODQ==
X-Gm-Message-State: AOJu0YzRloeOOxKdjMQ9j0NAu1M684WLsClwiEyWHMdVzJ1P3eQ+BzPQ
	xpjPqYewKk5MlN2T7AH+ecqj2G/liSy0+U9qD3FyvDLDJw==
X-Google-Smtp-Source: AGHT+IE4PbMPuuaYzzQPcjxeukvtifuQVaL5qy6GJZkf0FGZoMXpgGrvD4LAEWRz9W2Chc1aMD0v/A==
X-Received: by 2002:a2e:9685:0:b0:2cc:ad9b:8803 with SMTP id q5-20020a2e9685000000b002ccad9b8803mr222265lji.168.1704983126772;
        Thu, 11 Jan 2024 06:25:26 -0800 (PST)
Message-ID: <aaf21c66-909b-4fcd-a671-1020ee1ae8f3@suse.com>
Date: Thu, 11 Jan 2024 15:25:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 3/3] x86/CPUID: move bounding of max_{,sub}leaf fields to
 library code
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

Break out this logic from calculate_host_policy() to also use it in the
x86 emulator harness, where subsequently we'll want to avoid open-coding
AMX maximum palette bounding as well as AVX10 sub-feature pruning.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v4: Mark x86_cpu_policy_bound_max_leaves() __init. Add U suffixes.
    Re-base.
v2: New.

--- a/tools/tests/x86_emulator/x86-emulate.c
+++ b/tools/tests/x86_emulator/x86-emulate.c
@@ -76,6 +76,7 @@ bool emul_test_init(void)
     unsigned long sp;
 
     x86_cpu_policy_fill_native(&cp);
+    x86_cpu_policy_bound_max_leaves(&cp);
 
     /*
      * The emulator doesn't use these instructions, so can always emulate
@@ -89,6 +90,8 @@ bool emul_test_init(void)
     cp.feat.wrmsrns = true;
     cp.extd.clzero = true;
 
+    x86_cpu_policy_shrink_max_leaves(&cp);
+
     if ( cpu_has_xsave )
     {
         unsigned int tmp, ebx;
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -360,28 +360,19 @@ void calculate_raw_cpu_policy(void)
 static void __init calculate_host_policy(void)
 {
     struct cpu_policy *p = &host_cpu_policy;
-    unsigned int max_extd_leaf;
 
     *p = raw_cpu_policy;
 
-    p->basic.max_leaf =
-        min_t(uint32_t, p->basic.max_leaf,   ARRAY_SIZE(p->basic.raw) - 1);
-    p->feat.max_subleaf =
-        min_t(uint32_t, p->feat.max_subleaf, ARRAY_SIZE(p->feat.raw) - 1);
-
-    max_extd_leaf = p->extd.max_leaf;
-
     /*
      * For AMD/Hygon hardware before Zen3, we unilaterally modify LFENCE to be
      * dispatch serialising for Spectre mitigations.  Extend max_extd_leaf
      * beyond what hardware supports, to include the feature leaf containing
      * this information.
      */
-    if ( cpu_has_lfence_dispatch )
-        max_extd_leaf = max(max_extd_leaf, 0x80000021U);
+    if ( cpu_has_lfence_dispatch && p->extd.max_leaf < 0x80000021U )
+        p->extd.max_leaf = 0x80000021U;
 
-    p->extd.max_leaf = 0x80000000U | min_t(uint32_t, max_extd_leaf & 0xffff,
-                                           ARRAY_SIZE(p->extd.raw) - 1);
+    x86_cpu_policy_bound_max_leaves(p);
 
     x86_cpu_featureset_to_policy(boot_cpu_data.x86_capability, p);
     recalculate_xstate(p);
--- a/xen/include/xen/lib/x86/cpu-policy.h
+++ b/xen/include/xen/lib/x86/cpu-policy.h
@@ -439,6 +439,12 @@ void x86_cpu_policy_fill_native(struct c
 void x86_cpu_policy_clear_out_of_range_leaves(struct cpu_policy *p);
 
 /**
+ * Bound max leaf/subleaf values according to the capacity of the respective
+ * arrays in struct cpu_policy.
+ */
+void x86_cpu_policy_bound_max_leaves(struct cpu_policy *p);
+
+/**
  * Shrink max leaf/subleaf values such that the last respective valid entry
  * isn't all blank.  While permitted by the spec, such extraneous leaves may
  * provide undue "hints" to guests.
--- a/xen/lib/x86/cpuid.c
+++ b/xen/lib/x86/cpuid.c
@@ -291,6 +291,16 @@ void x86_cpu_policy_clear_out_of_range_l
                 ARRAY_SIZE(p->extd.raw) - 1);
 }
 
+void __init x86_cpu_policy_bound_max_leaves(struct cpu_policy *p)
+{
+    p->basic.max_leaf =
+        min_t(uint32_t, p->basic.max_leaf, ARRAY_SIZE(p->basic.raw) - 1);
+    p->feat.max_subleaf =
+        min_t(uint32_t, p->feat.max_subleaf, ARRAY_SIZE(p->feat.raw) - 1);
+    p->extd.max_leaf = 0x80000000U | min_t(uint32_t, p->extd.max_leaf & 0xffff,
+                                           ARRAY_SIZE(p->extd.raw) - 1);
+}
+
 void x86_cpu_policy_shrink_max_leaves(struct cpu_policy *p)
 {
     unsigned int i;
--- a/xen/lib/x86/private.h
+++ b/xen/lib/x86/private.h
@@ -5,6 +5,7 @@
 
 #include <xen/bitops.h>
 #include <xen/guest_access.h>
+#include <xen/init.h>
 #include <xen/kernel.h>
 #include <xen/lib.h>
 #include <xen/nospec.h>
@@ -28,6 +29,11 @@
 
 #include <xen-tools/common-macros.h>
 
+#define __init
+#define __initdata
+#define __initconst
+#define __initconstrel
+
 static inline bool test_bit(unsigned int bit, const void *vaddr)
 {
     const char *addr = vaddr;


