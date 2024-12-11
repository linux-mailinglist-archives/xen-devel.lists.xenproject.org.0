Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D42DB9ECA3A
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 11:22:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.854396.1267629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLJrT-0003ij-PJ; Wed, 11 Dec 2024 10:22:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 854396.1267629; Wed, 11 Dec 2024 10:22:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLJrT-0003ft-Jx; Wed, 11 Dec 2024 10:22:31 +0000
Received: by outflank-mailman (input) for mailman id 854396;
 Wed, 11 Dec 2024 10:22:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2HaM=TE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tLJic-0003z3-2s
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 10:13:22 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 88e60d75-b7a8-11ef-99a3-01e77a169b0f;
 Wed, 11 Dec 2024 11:13:15 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-37ed3bd6114so2778937f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Dec 2024 02:13:20 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2162b052ee8sm71237215ad.45.2024.12.11.02.13.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 02:13:18 -0800 (PST)
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
X-Inumbo-ID: 88e60d75-b7a8-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733911999; x=1734516799; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/gKnwhepsCOgjaSpf1xV3UdHomhomuoQ6+ggqo6U/2M=;
        b=PUvpnQuxMxUJkmf5ImqLv1OJc4BfI+odugiKr64+g4ii0ACE6WVAUtK50jRX8YFMN7
         fjN56MLjNyNi5m80uaXlgooL+xL1veIMnRokN4AIL46gO1BAYaxpqFrMFbNQPTNCbQfJ
         5xHRV6VXXf6tmoys7z02eogcyk+nivBrrgoqiw3nVotO1WLvxnHOJ0K82Ic4qGbd3Fti
         UbuUwE/oNhGqTn2NdylBwx6lCVNovlLFl4v9iAHNwOrAIZS1thHBasDS8DAMx0EBTNwz
         1a0mS2G9RV8s3E8ZnX72/5to8zrQPbAaAk+VL4iD6vv0pRwNzqxuWkBivn4dWcKP6VvU
         MAVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733911999; x=1734516799;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/gKnwhepsCOgjaSpf1xV3UdHomhomuoQ6+ggqo6U/2M=;
        b=BH6UIuQKrPEwsuSrythON8hnjPkE4tQ/LXp005jhVteqXl14J55f3KGFTyuYmUNPqW
         /dvq3t6VHwh4VSI8hzeTnqF68IVrvSNHxvPY8xkCAI3+HbYH/GDfA4anLU8nGTr0WfsI
         suEBvqYQgS+JsRZWgNHY/nkAh1H3ARCMiAFGDA5lzb7Orf2RDdoYRXNb+E4URF8hyw3g
         Yrs4Z3byzdFZh/RVkx+eXBTkMLBrvmEDG0Ccn22HuHEPjx8AwyHKu7FW76PVgKEJEHZ7
         chXM1a3l4QqJFwK35Pbx7cnJpMSy6k/eB8N34Ca+5z/l6QzTH5qqIohWkjAVidoPJXKO
         iCdw==
X-Gm-Message-State: AOJu0Yy4OkAb0FBKWIFHBsriHwUsrnzxPSQcOhFNPTy4DfNdgUA/3RlY
	L4n5iT9xFhPOb379JmwL7YrTIuIC1EFYwXvyAX+5KqfcdSlUuonDa/aQnCC4mkZmfmy5wuiqZcQ
	=
X-Gm-Gg: ASbGnctUir6stUT45q3E4tzDgvmbDRoSrGJtY3oy2ZKaKJ/RT5Mk8Dk5StfrPLz/CeM
	Fr81qVmLd4RMHTf9slKoPpnPHRNynI63SbrX/bHw12zxbd9EZbtfIebPImRidQltlqHVPWLU2Sk
	n/rY/+5DIZCnQSlxzdWE6S69dmdiKyH9M96EAfQ1byAt7DfB3d+vLCNPct68dixSxfGx4xve/yR
	8mxDa3XoDtfr8kpwm8nj4R3bfYDsV7zXkkB7/O58KC+GC49Pl4LxZRR3OH14NYcuD4FCe1aE9XT
	0W0NO1QmQCsx9NmP4scMpTLnDK2zSk8C46A3VHU=
X-Google-Smtp-Source: AGHT+IGsZsYbOWcOvFkSsDe/ZCxaKgvyW2utiM0OkHWW3WWFzTJAB9L4DI+w6D8MflzmGvzJcGklqg==
X-Received: by 2002:a5d:47c6:0:b0:385:f062:c2df with SMTP id ffacd0b85a97d-3864ce4968emr1994195f8f.11.1733911999302;
        Wed, 11 Dec 2024 02:13:19 -0800 (PST)
Message-ID: <f8d9cf2a-f83d-4527-afe0-1f3a877057ad@suse.com>
Date: Wed, 11 Dec 2024 11:13:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 05/16] x86emul: AVX10.1 testing
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <516b7f9a-048e-409d-8a4e-89aeb8ffacc4@suse.com>
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
In-Reply-To: <516b7f9a-048e-409d-8a4e-89aeb8ffacc4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Re-use respective AVX512 tests, by suitably adjusting the predicate
functions. This leaves test names ("Testing ... NN-bit code sequence")
somewhat misleading, but I think we can live with that.

Note that the AVX512{BW,DQ} opmask tests cannot be run as-is for the
AVX10/256 case, as they include 512-bit vector <-> opmask insn tests.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
SDE: -gnr / -gnr256
---
TBD: For AVX10.1/256 need to somehow guarantee that the generated blobs
     really don't use 512-bit insns (it's uncertain whether passing
     -mprefer-vector-width= is enough). Right now according to my
     testing on SDE this is all fine. May need to probe for support of
     the new -mno-evex512 compiler option.

The AVX512{BW,DQ} opmask tests could of course be cloned (i.e. rebuilt
another time with -mavx512vl passed) accordingly, but the coverage gain
wouldbe pretty marginal.
---
v2: Drop SDE 9.27.0 workaround. Re-base over dropping of Xeon Phi
    support.

--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -999,7 +999,11 @@ static void test_group(const struct test
         for ( j = 0; j < nr_vl; ++j )
         {
             if ( vl[0] == VL_512 && vl[j] != VL_512 &&
-                 !cpu_policy.feat.avx512vl )
+                 !cpu_policy.feat.avx512vl && !cpu_policy.feat.avx10 )
+                continue;
+
+            if ( vl[j] == VL_512 && !cpu_policy.feat.avx512f &&
+                 !cpu_policy.avx10.vsz512 )
                 continue;
 
             switch ( tests[i].esz )
@@ -1050,6 +1054,27 @@ static void test_group(const struct test
     }
 }
 
+/* AVX512 (sub)features implied by AVX10. */
+#define avx10_has_avx512f             true
+#define avx10_has_avx512bw            true
+#define avx10_has_avx512cd            true
+#define avx10_has_avx512dq            true
+#define avx10_has_avx512_bf16         true
+#define avx10_has_avx512_bitalg       true
+#define avx10_has_avx512_fp16         true
+#define avx10_has_avx512_ifma         true
+#define avx10_has_avx512_vbmi         true
+#define avx10_has_avx512_vbmi2        true
+#define avx10_has_avx512_vnni         true
+#define avx10_has_avx512_vpopcntdq    true
+
+/* AVX512 sub-features /not/ implied by AVX10. */
+#define avx10_has_avx512er            false
+#define avx10_has_avx512pf            false
+#define avx10_has_avx512_4fmaps       false
+#define avx10_has_avx512_4vnniw       false
+#define avx10_has_avx512_vp2intersect false
+
 void evex_disp8_test(void *instr, struct x86_emulate_ctxt *ctxt,
                      const struct x86_emulate_ops *ops)
 {
@@ -1057,8 +1082,8 @@ void evex_disp8_test(void *instr, struct
     emulops.read = read;
     emulops.write = write;
 
-#define RUN(feat, vl) do { \
-    if ( cpu_has_##feat ) \
+#define run(cond, feat, vl) do { \
+    if ( cond ) \
     { \
         printf("%-40s", "Testing " #feat "/" #vl " disp8 handling..."); \
         test_group(feat ## _ ## vl, ARRAY_SIZE(feat ## _ ## vl), \
@@ -1067,6 +1092,12 @@ void evex_disp8_test(void *instr, struct
     } \
 } while ( false )
 
+#define RUN(feat, vl) \
+    run(cpu_has_ ## feat || \
+        (cpu_has_avx10_1 && cpu_policy.avx10.vsz256 && avx10_has_ ## feat && \
+         (ARRAY_SIZE(vl_ ## vl) > 1 || &vl_ ## vl[0] != &vl_512[0])), \
+       feat, vl)
+
     RUN(avx512f, all);
     RUN(avx512f, 128);
     RUN(avx512f, no128);
@@ -1089,10 +1120,15 @@ void evex_disp8_test(void *instr, struct
     RUN(avx512_fp16, all);
     RUN(avx512_fp16, 128);
 
-    if ( cpu_has_avx512f )
+#undef RUN
+
+    if ( cpu_has_avx512f || cpu_has_avx10_1 )
     {
+#define RUN(feat, vl) run(cpu_has_ ## feat, feat, vl)
         RUN(gfni, all);
         RUN(vaes, all);
         RUN(vpclmulqdq, all);
+#undef RUN
     }
+#undef run
 }
--- a/tools/tests/x86_emulator/testcase.mk
+++ b/tools/tests/x86_emulator/testcase.mk
@@ -4,7 +4,27 @@ include $(XEN_ROOT)/tools/Rules.mk
 
 $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
 
-CFLAGS += -fno-builtin -g0 $($(TESTCASE)-cflags)
+ifneq ($(filter -mavx512%,$($(TESTCASE)-cflags)),)
+
+cflags-vsz64 :=
+cflags-vsz32 := -mprefer-vector-width=256
+cflags-vsz16 := -mprefer-vector-width=128
+# Scalar tests don't set VEC_SIZE (and VEC_MAX is used by S/G ones only)
+cflags-vsz   := -mprefer-vector-width=128
+
+ifneq ($(filter -DVEC_SIZE=%,$($(TESTCASE)-cflags)),)
+CFLAGS-VSZ := $(cflags-vsz$(patsubst -DVEC_SIZE=%,%,$(filter -DVEC_SIZE=%,$($(TESTCASE)-cflags))))
+else
+CFLAGS-VSZ := $(cflags-vsz$(patsubst -DVEC_MAX=%,%,$(filter -DVEC_MAX=%,$($(TESTCASE)-cflags))))
+endif
+
+else
+
+CFLAGS-VSZ :=
+
+endif
+
+CFLAGS += -fno-builtin -g0 $($(TESTCASE)-cflags) $(CFLAGS-VSZ)
 
 LDFLAGS_DIRECT += $(shell { $(LD) -v --warn-rwx-segments; } >/dev/null 2>&1 && echo --no-warn-rwx-segments)
 
--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -124,52 +124,61 @@ static bool simd_check_avx_pclmul(void)
 
 static bool simd_check_avx512f(void)
 {
-    return cpu_has_avx512f;
+    return cpu_has_avx512f || cpu_has_avx10_1_512;
 }
-#define simd_check_avx512f_opmask simd_check_avx512f
 #define simd_check_avx512f_sg simd_check_avx512f
 
+static bool simd_check_avx512f_sc(void)
+{
+    return cpu_has_avx512f || cpu_has_avx10_1;
+}
+#define simd_check_avx512f_opmask simd_check_avx512f_sc
+
 static bool simd_check_avx512f_vl(void)
 {
-    return cpu_has_avx512f && cpu_policy.feat.avx512vl;
+    return (cpu_has_avx512f && cpu_policy.feat.avx512vl) ||
+           cpu_has_avx10_1_256;
 }
 #define simd_check_avx512vl_sg simd_check_avx512f_vl
 
 static bool simd_check_avx512dq(void)
 {
-    return cpu_has_avx512dq;
+    return cpu_has_avx512dq || cpu_has_avx10_1_512;
 }
 #define simd_check_avx512dq_opmask simd_check_avx512dq
 
 static bool simd_check_avx512dq_vl(void)
 {
-    return cpu_has_avx512dq && cpu_policy.feat.avx512vl;
+    return (cpu_has_avx512dq && cpu_policy.feat.avx512vl) ||
+           cpu_has_avx10_1_256;
 }
 
 static bool simd_check_avx512bw(void)
 {
-    return cpu_has_avx512bw;
+    return cpu_has_avx512bw || cpu_has_avx10_1_512;
 }
 #define simd_check_avx512bw_opmask simd_check_avx512bw
 
 static bool simd_check_avx512bw_vl(void)
 {
-    return cpu_has_avx512bw && cpu_policy.feat.avx512vl;
+    return (cpu_has_avx512bw && cpu_policy.feat.avx512vl) ||
+           cpu_has_avx10_1_256;
 }
 
 static bool simd_check_avx512vbmi(void)
 {
-    return cpu_has_avx512_vbmi;
+    return cpu_has_avx512_vbmi || cpu_has_avx10_1_512;
 }
 
 static bool simd_check_avx512vbmi_vl(void)
 {
-    return cpu_has_avx512_vbmi && cpu_policy.feat.avx512vl;
+    return (cpu_has_avx512_vbmi && cpu_policy.feat.avx512vl) ||
+           cpu_has_avx10_1_256;
 }
 
 static bool simd_check_avx512vbmi2(void)
 {
-    return cpu_has_avx512_vbmi2;
+    return cpu_has_avx512_vbmi2 || cpu_has_avx10_1_512;
 }
 
 static bool simd_check_sse4_sha(void)
@@ -250,17 +259,23 @@ static bool simd_check_avx512bw_gf_vl(vo
 
 static bool simd_check_avx512vnni(void)
 {
-    return cpu_has_avx512_vnni;
+    return cpu_has_avx512_vnni || cpu_has_avx10_1_512;
 }
 
 static bool simd_check_avx512fp16(void)
 {
-    return cpu_has_avx512_fp16;
+    return cpu_has_avx512_fp16 || cpu_has_avx10_1_512;
+}
+
+static bool simd_check_avx512fp16_sc(void)
+{
+    return cpu_has_avx512_fp16 || cpu_has_avx10_1;
 }
 
 static bool simd_check_avx512fp16_vl(void)
 {
-    return cpu_has_avx512_fp16 && cpu_policy.feat.avx512vl;
+    return (cpu_has_avx512_fp16 && cpu_policy.feat.avx512vl) ||
+           cpu_has_avx10_1_256;
 }
 
 static void simd_set_regs(struct cpu_user_regs *regs)
@@ -433,9 +448,13 @@ static const struct {
     SIMD(OPMASK+DQ/w, avx512dq_opmask,         2),
     SIMD(OPMASK+BW/d, avx512bw_opmask,         4),
     SIMD(OPMASK+BW/q, avx512bw_opmask,         8),
-    SIMD(AVX512F f32 scalar,  avx512f,        f4),
+#define avx512f_sc_x86_32_D_f4 avx512f_x86_32_D_f4
+#define avx512f_sc_x86_64_D_f4 avx512f_x86_64_D_f4
+    SIMD(AVX512F f32 scalar,  avx512f_sc,     f4),
     SIMD(AVX512F f32x16,      avx512f,      64f4),
-    SIMD(AVX512F f64 scalar,  avx512f,        f8),
+#define avx512f_sc_x86_32_D_f8 avx512f_x86_32_D_f8
+#define avx512f_sc_x86_64_D_f8 avx512f_x86_64_D_f8
+    SIMD(AVX512F f64 scalar,  avx512f_sc,     f8),
     SIMD(AVX512F f64x8,       avx512f,      64f8),
     SIMD(AVX512F s32x16,      avx512f,      64i4),
     SIMD(AVX512F u32x16,      avx512f,      64u4),
@@ -523,7 +542,9 @@ static const struct {
     AVX512VL(_VBMI+VL u16x8, avx512vbmi,    16u2),
     AVX512VL(_VBMI+VL s16x16, avx512vbmi,   32i2),
     AVX512VL(_VBMI+VL u16x16, avx512vbmi,   32u2),
-    SIMD(AVX512_FP16 f16 scal,avx512fp16,     f2),
+#define avx512fp16_sc_x86_32_D_f2 avx512fp16_x86_32_D_f2
+#define avx512fp16_sc_x86_64_D_f2 avx512fp16_x86_64_D_f2
+    SIMD(AVX512_FP16 f16 scal,avx512fp16_sc,  f2),
     SIMD(AVX512_FP16 f16x32, avx512fp16,    64f2),
     AVX512VL(_FP16+VL f16x8, avx512fp16,    16f2),
     AVX512VL(_FP16+VL f16x16,avx512fp16,    32f2),
@@ -3205,7 +3226,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing {evex} vmovq %xmm1,32(%edx)...");
-    if ( stack_exec && simd_check_avx512f() )
+    if ( stack_exec && simd_check_avx512f_sc() )
     {
         decl_insn(evex_vmovq_to_mem);
 
@@ -3229,7 +3250,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing {evex} vmovq 32(%edx),%xmm0...");
-    if ( stack_exec && simd_check_avx512f() )
+    if ( stack_exec && simd_check_avx512f_sc() )
     {
         decl_insn(evex_vmovq_from_mem);
 
@@ -3241,11 +3262,22 @@ int main(int argc, char **argv)
         rc = x86_emulate(&ctxt, &emulops);
         if ( rc != X86EMUL_OKAY || !check_eip(evex_vmovq_from_mem) )
             goto fail;
-        asm ( "vmovq %1, %%xmm1\n\t"
-              "vpcmpeqq %%zmm0, %%zmm1, %%k0\n"
-              "kmovw %%k0, %0" : "=r" (rc) : "m" (res[8]) );
-        if ( rc != 0xff )
-            goto fail;
+        if ( simd_check_avx512f() )
+        {
+            asm ( "vmovq %1, %%xmm1\n\t"
+                  "vpcmpeqq %%zmm0, %%zmm1, %%k0\n"
+                  "kmovw %%k0, %0" : "=r" (rc) : "m" (res[8]) );
+            if ( rc != 0x00ff )
+                goto fail;
+        }
+        else
+        {
+            asm ( "vmovq %1, %%xmm1\n\t"
+                  "vpcmpeqq %%xmm0, %%xmm1, %%k0\n"
+                  "kmovb %%k0, %0" : "=r" (rc) : "m" (res[8]) );
+            if ( rc != 0x03 )
+                goto fail;
+        }
         printf("okay\n");
     }
     else
@@ -3567,7 +3599,7 @@ int main(int argc, char **argv)
     printf("%-40s", "Testing vmovsd %xmm5,16(%ecx){%k3}...");
     memset(res, 0x88, 128);
     memset(res + 20, 0x77, 8);
-    if ( stack_exec && simd_check_avx512f() )
+    if ( stack_exec && simd_check_avx512f_sc() )
     {
         decl_insn(vmovsd_masked_to_mem);
 
@@ -3785,7 +3817,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing {evex} vmovd %xmm3,32(%ecx)...");
-    if ( stack_exec && simd_check_avx512f() )
+    if ( stack_exec && simd_check_avx512f_sc() )
     {
         decl_insn(evex_vmovd_to_mem);
 
@@ -3810,7 +3842,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing {evex} vmovd 32(%ecx),%xmm4...");
-    if ( stack_exec && simd_check_avx512f() )
+    if ( stack_exec && simd_check_avx512f_sc() )
     {
         decl_insn(evex_vmovd_from_mem);
 
@@ -3823,11 +3855,22 @@ int main(int argc, char **argv)
         rc = x86_emulate(&ctxt, &emulops);
         if ( rc != X86EMUL_OKAY || !check_eip(evex_vmovd_from_mem) )
             goto fail;
-        asm ( "vmovd %1, %%xmm0\n\t"
-              "vpcmpeqd %%zmm4, %%zmm0, %%k0\n\t"
-              "kmovw %%k0, %0" : "=r" (rc) : "m" (res[8]) );
-        if ( rc != 0xffff )
-            goto fail;
+        if ( simd_check_avx512f() )
+        {
+            asm ( "vmovd %1, %%xmm0\n\t"
+                  "vpcmpeqd %%zmm4, %%zmm0, %%k0\n\t"
+                  "kmovw %%k0, %0" : "=r" (rc) : "m" (res[8]) );
+            if ( rc != 0xffff )
+                goto fail;
+        }
+        else
+        {
+            asm ( "vmovd %1, %%xmm0\n\t"
+                  "vpcmpeqd %%xmm4, %%xmm0, %%k0\n\t"
+                  "kmovb %%k0, %0" : "=r" (rc) : "m" (res[8]) );
+            if ( rc != 0x0f )
+                goto fail;
+        }
         printf("okay\n");
     }
     else
@@ -4000,7 +4043,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing {evex} vmovd %xmm2,%ebx...");
-    if ( stack_exec && simd_check_avx512f() )
+    if ( stack_exec && simd_check_avx512f_sc() )
     {
         decl_insn(evex_vmovd_to_reg);
 
@@ -4026,7 +4069,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing {evex} vmovd %ebx,%xmm1...");
-    if ( stack_exec && simd_check_avx512f() )
+    if ( stack_exec && simd_check_avx512f_sc() )
     {
         decl_insn(evex_vmovd_from_reg);
 
@@ -4040,11 +4083,22 @@ int main(int argc, char **argv)
         rc = x86_emulate(&ctxt, &emulops);
         if ( (rc != X86EMUL_OKAY) || !check_eip(evex_vmovd_from_reg) )
             goto fail;
-        asm ( "vmovd %1, %%xmm0\n\t"
-              "vpcmpeqd %%zmm1, %%zmm0, %%k0\n\t"
-              "kmovw %%k0, %0" : "=r" (rc) : "m" (res[8]) );
-        if ( rc != 0xffff )
-            goto fail;
+        if ( simd_check_avx512f() )
+        {
+            asm ( "vmovd %1, %%xmm0\n\t"
+                  "vpcmpeqd %%zmm1, %%zmm0, %%k0\n\t"
+                  "kmovw %%k0, %0" : "=r" (rc) : "m" (res[8]) );
+            if ( rc != 0xffff )
+                goto fail;
+        }
+        else
+        {
+            asm ( "vmovd %1, %%xmm0\n\t"
+                  "vpcmpeqd %%xmm1, %%xmm0, %%k0\n\t"
+                  "kmovb %%k0, %0" : "=r" (rc) : "m" (res[8]) );
+            if ( rc != 0x0f )
+                goto fail;
+        }
         printf("okay\n");
     }
     else
@@ -4128,7 +4182,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing {evex} vmovq %xmm11,32(%ecx)...");
-    if ( stack_exec && simd_check_avx512f() )
+    if ( stack_exec && simd_check_avx512f_sc() )
     {
         decl_insn(evex_vmovq_to_mem2);
 
@@ -4218,7 +4272,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing vmovq %xmm22,%rbx...");
-    if ( stack_exec && simd_check_avx512f() )
+    if ( stack_exec && simd_check_avx512f_sc() )
     {
         decl_insn(evex_vmovq_to_reg);
 
@@ -5509,7 +5563,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing vmovsh 8(%ecx),%xmm5...");
-    if ( stack_exec && simd_check_avx512fp16() )
+    if ( stack_exec && simd_check_avx512fp16_sc() )
     {
         decl_insn(vmovsh_from_mem);
         decl_insn(vmovw_to_gpr);
@@ -5527,14 +5581,28 @@ int main(int argc, char **argv)
         rc = x86_emulate(&ctxt, &emulops);
         if ( (rc != X86EMUL_OKAY) || !check_eip(vmovsh_from_mem) )
             goto fail;
-        asm volatile ( "kmovw     %2, %%k1\n\t"
-                       "vmovdqu16 %1, %%zmm4%{%%k1%}%{z%}\n\t"
-                       "vpcmpeqw  %%zmm4, %%zmm5, %%k0\n\t"
-                       "kmovw     %%k0, %0"
-                       : "=g" (rc)
-                       : "m" (res[2]), "r" (1) );
-        if ( rc != 0xffff )
-            goto fail;
+        if ( simd_check_avx512fp16() )
+        {
+            asm volatile ( "kmovw     %2, %%k1\n\t"
+                           "vmovdqu16 %1, %%zmm4%{%%k1%}%{z%}\n\t"
+                           "vpcmpeqw  %%zmm4, %%zmm5, %%k0\n\t"
+                           "kmovw     %%k0, %0"
+                           : "=g" (rc)
+                           : "m" (res[2]), "r" (1) );
+            if ( rc != 0xffff )
+                goto fail;
+        }
+        else
+        {
+            asm volatile ( "kmovb     %2, %%k1\n\t"
+                           "vmovdqu16 %1, %%xmm4%{%%k1%}%{z%}\n\t"
+                           "vpcmpeqw  %%xmm4, %%xmm5, %%k0\n\t"
+                           "kmovb     %%k0, %0"
+                           : "=g" (rc)
+                           : "m" (res[2]), "r" (1) );
+            if ( rc != 0xff )
+                goto fail;
+        }
         printf("okay\n");
 
         printf("%-40s", "Testing vmovsh %xmm4,2(%eax){%k3}...");
--- a/tools/tests/x86_emulator/x86-emulate.c
+++ b/tools/tests/x86_emulator/x86-emulate.c
@@ -244,7 +244,7 @@ int emul_test_get_fpu(
             break;
     case X86EMUL_FPU_opmask:
     case X86EMUL_FPU_zmm:
-        if ( cpu_has_avx512f )
+        if ( cpu_has_avx512f || cpu_has_avx10_1 )
             break;
     default:
         return X86EMUL_UNHANDLEABLE;
--- a/tools/tests/x86_emulator/x86-emulate.h
+++ b/tools/tests/x86_emulator/x86-emulate.h
@@ -207,6 +207,12 @@ void wrpkru(unsigned int val);
                                      xcr0_mask(6))
 #define cpu_has_avx_vnni_int16      (cpu_policy.feat.avx_vnni_int16 && \
                                      xcr0_mask(6))
+                                    /* TBD: Is bit 6 (ZMM_Hi256) really needed here? */
+#define cpu_has_avx10_1             (cpu_policy.feat.avx10 && xcr0_mask(0xe6))
+#define cpu_has_avx10_1_256         (cpu_has_avx10_1 && \
+                                     (cpu_policy.avx10.vsz256 || \
+                                      cpu_policy.avx10.vsz512))
+#define cpu_has_avx10_1_512         (cpu_has_avx10_1 && cpu_policy.avx10.vsz512)
 
 #define cpu_has_xgetbv1             (cpu_has_xsave && cpu_policy.xstate.xgetbv1)
 


