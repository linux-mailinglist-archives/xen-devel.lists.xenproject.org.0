Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0467A9516AF
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2024 10:36:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776881.1187089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1se9UR-0007UV-Mg; Wed, 14 Aug 2024 08:36:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776881.1187089; Wed, 14 Aug 2024 08:36:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1se9UR-0007Sx-Jj; Wed, 14 Aug 2024 08:36:19 +0000
Received: by outflank-mailman (input) for mailman id 776881;
 Wed, 14 Aug 2024 08:36:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NhoJ=PN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1se9TH-0002t1-Kv
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2024 08:35:07 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c247907-5a18-11ef-a505-bb4a2ccca743;
 Wed, 14 Aug 2024 10:35:07 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5a156557029so7292163a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 14 Aug 2024 01:35:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a80f411af30sm144642066b.131.2024.08.14.01.35.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Aug 2024 01:35:06 -0700 (PDT)
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
X-Inumbo-ID: 1c247907-5a18-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723624506; x=1724229306; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YimU2DNm3SD/n5KZvLqPxRgRTpILHAbZb+waNB5GDPc=;
        b=CgNeta0OvPBrOlhDLB+50K8C5bN31WjtG/GGLh2BTheD+kBO0aw2w3cKw2zwW//706
         dH/yrYqeSMqmZFaXyphSH9GtEN+aqIl+C1srQK60m5EdsrKoE8THA1nmk26v8LxAPq3I
         7xJ8JoDGtv8P2o4ebNcD9qgIiMd9dCa6YgkNxX17ziXlLq9mGRN4EfLr+3oJ6CnMZ/5Q
         6iHHOWx2OGXWR7o+bR17YvyNyW788iM68gXYoy46kjNyI/kheA9lF08f9BlMNQfp8xgk
         L4Hj5tdgUZkp/kEMFrA13zzt7Cm7kQ7DR/uEHM2yM1oYeVXp+PnlAjXDyTee1odFqkQr
         b2fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723624506; x=1724229306;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YimU2DNm3SD/n5KZvLqPxRgRTpILHAbZb+waNB5GDPc=;
        b=ZeqY/3w+m0MbPTZcD8mYyVZ8Qp77fsTrJDv55dyB0eKc0aZAGRF0dfgezA8HNNd2Cy
         rWbnqa2j+A3DQbYvjJcFxxcTRplQWgK0O8PW4jHhlOiL4CC7l7p79Qb5DIg00tvapTHp
         +mohsjw7OAjsr+qi6Bb4AbJ0CCFzNRUCVtdPvVjfbUgW5a85JNBhjS9wl4q0+S+K863J
         uG/0oKvuOok2BHZXs6ThPRoDIk82nI1J8PYazgdC6qVMsZ1KhvDex0abMNnYKseItUIq
         UdKB7b3bTtCn2p9BWH/HXl0hujBhJWdByytVl9cdqtSIIK3gI5Bwi6baXGdDqt2Gyi5N
         DNng==
X-Gm-Message-State: AOJu0YxvcqPMSkXygyyO92MxqJqS258cQOjVf7siISbipOjIwk/BGz+j
	c5zjBwlEE0X24pqyH42dgIAEOe9dzn/+IquacItRVVbZ70kylR7wzqHqLK7r7MutblBSwtIaG3s
	=
X-Google-Smtp-Source: AGHT+IEsGlrcIkp7EAHWdqWTAEUSM/4OCYOArwJwNmmWsFV1hWybwF7FnokKqc1ffFKqyQxpYwlvEA==
X-Received: by 2002:a17:907:3f07:b0:a7a:b561:3564 with SMTP id a640c23a62f3a-a836704a180mr137822866b.61.1723624506315;
        Wed, 14 Aug 2024 01:35:06 -0700 (PDT)
Message-ID: <9653c288-abec-4185-babd-0c197fc249ee@suse.com>
Date: Wed, 14 Aug 2024 10:35:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v5 3/3] x86/CPUID: move bounding of max_{,sub}leaf fields to
 library code
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
@@ -88,6 +89,8 @@ bool emul_test_init(void)
     cp.feat.wrmsrns = true;
     cp.extd.clzero = true;
 
+    x86_cpu_policy_shrink_max_leaves(&cp);
+
     if ( cpu_has_xsave )
     {
         unsigned int tmp, ebx;
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -352,28 +352,19 @@ void calculate_raw_cpu_policy(void)
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


