Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD6B82B1A1
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 16:21:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666372.1036976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNwsD-0004bP-Qw; Thu, 11 Jan 2024 15:21:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666372.1036976; Thu, 11 Jan 2024 15:21:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNwsD-0004Yr-MN; Thu, 11 Jan 2024 15:21:37 +0000
Received: by outflank-mailman (input) for mailman id 666372;
 Thu, 11 Jan 2024 15:21:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YFj+=IV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rNwsC-00045k-Js
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 15:21:36 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1aee62fc-b095-11ee-9b0f-b553b5be7939;
 Thu, 11 Jan 2024 16:21:34 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3368b1e056eso4392406f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jan 2024 07:21:34 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 fk10-20020a05600c0cca00b0040e5a0ebabesm4245126wmb.21.2024.01.11.07.21.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jan 2024 07:21:33 -0800 (PST)
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
X-Inumbo-ID: 1aee62fc-b095-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704986494; x=1705591294; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IDNtIkUYBUxOgV95KZo88lsdyxrnB7KdD8z/bx9O3Jo=;
        b=KuoMPEp+YdfeUQ0l/vjBjO0W17k+1CO2Ql7N8hGzcFnaqUZemTda8AbI5XN20aGWG0
         epYfyPJL8kk0vXW2YiyN30w6OiSPYh3VCRPl+a7wj/psMe+E3D+ZUKCcWmnPwYCAx4sU
         tXtffX2KeN8+XAk+0HnfWL+lemdzhr9kmeZTYu29hwgL9UrWqBKWTZBa4mfHgxHZRHIy
         TTY3qdeYMe93gP6Ig7e91n0ezZEtNoUh42iLHihfxa2NbmC551PdIAzIuv+nbx5uDngw
         Fr9OL7bTv/jNnaQOUp9ZhBgdLguhsN6cXiSOfWIT1F7NOpCD9A0KBd1fxYkA5tdWE8SI
         M6HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704986494; x=1705591294;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IDNtIkUYBUxOgV95KZo88lsdyxrnB7KdD8z/bx9O3Jo=;
        b=JpDaONPugbZcIevaikXPn4TvkTGOhNcNi//VIt5fUuGr86ie6LkSYHBlJHGyYy+iU1
         5/kdIaJadtZGH4EqgXXOWnh5mUKuWOJyumLFlnY/VAEEFeOLECCDw6GXIcYXcpd5wZYm
         XRRh/x8WsHclJGU9mGDjYhnXbzSonjcwI7+GJBMOJ+0TMpAXKF3zcgOZ3d00Dx06LjQF
         Y2uiliKuYwAhUDSfsvBjPvEC893O6xUZbS10uqF6DsmU8PXh9Lfrje5n1oIspCk3PHGa
         N/YjFUQTH/8/t9Se+Iz8DOkX80P+kA8X+pPj8Wkx8DNbChFyJ2bNU5siVtCBrl9Xyji1
         Zrmw==
X-Gm-Message-State: AOJu0YzkqhVIypo6jOK8NK2n6fE1m808/h4TWXlfZIYwMLIx33CQwIXY
	N6H55B9eEu6vMF65SromRorY6srpOVDNOSZc3jScSX1iFg==
X-Google-Smtp-Source: AGHT+IHE4kXTzz2CtewNEdVfSDJEr6YgQ+/TSdXpIJybwIWdl5dUCbT29JetAl7KkVHDsK2k0+2T4Q==
X-Received: by 2002:a05:600c:4f8a:b0:40e:3a62:943b with SMTP id n10-20020a05600c4f8a00b0040e3a62943bmr570080wmq.20.1704986493923;
        Thu, 11 Jan 2024 07:21:33 -0800 (PST)
Message-ID: <bb2c30d8-2545-408f-a46f-c819b14eac9f@suse.com>
Date: Thu, 11 Jan 2024 16:21:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 7/8] x86emul: AVX10.1 testing
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

Re-use respective AVX512 tests, by suitably adjusting the predicate
functions. This leaves test names ("Testing ... NN-bit code sequence")
somewhat misleading, but I think we can live with that.

Note that the AVX512{BW,DQ} opmask tests cannot be run as-is for the
AVX10/256 case, as they include 512-bit vector <-> opmask insn tests.

Sadly until a newer SDE version (matching ISE 050 or newer) is
available, one workaround is necessary to be able to run the test
harness on SDE 9.27.0.

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
wouldbe pretty marginal (plus there would again be issues with SDE
9.27.0).

--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -1032,7 +1032,11 @@ static void test_group(const struct test
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
@@ -1083,6 +1087,27 @@ static void test_group(const struct test
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
@@ -1090,8 +1115,8 @@ void evex_disp8_test(void *instr, struct
     emulops.read = read;
     emulops.write = write;
 
-#define RUN(feat, vl) do { \
-    if ( cpu_has_##feat ) \
+#define run(cond, feat, vl) do { \
+    if ( cond ) \
     { \
         printf("%-40s", "Testing " #feat "/" #vl " disp8 handling..."); \
         test_group(feat ## _ ## vl, ARRAY_SIZE(feat ## _ ## vl), \
@@ -1100,6 +1125,12 @@ void evex_disp8_test(void *instr, struct
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
@@ -1127,10 +1158,15 @@ void evex_disp8_test(void *instr, struct
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
@@ -125,26 +125,33 @@ static bool simd_check_avx_pclmul(void)
 
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
 
 static bool simd_check_avx512er(void)
@@ -154,28 +161,30 @@ static bool simd_check_avx512er(void)
 
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
@@ -256,17 +265,23 @@ static bool simd_check_avx512bw_gf_vl(vo
 
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
@@ -439,9 +454,13 @@ static const struct {
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
@@ -533,7 +552,9 @@ static const struct {
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
@@ -3126,7 +3147,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing {evex} vmovq %xmm1,32(%edx)...");
-    if ( stack_exec && simd_check_avx512f() )
+    if ( stack_exec && simd_check_avx512f_sc() )
     {
         decl_insn(evex_vmovq_to_mem);
 
@@ -3150,7 +3171,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing {evex} vmovq 32(%edx),%xmm0...");
-    if ( stack_exec && simd_check_avx512f() )
+    if ( stack_exec && simd_check_avx512f_sc() )
     {
         decl_insn(evex_vmovq_from_mem);
 
@@ -3162,11 +3183,22 @@ int main(int argc, char **argv)
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
@@ -3488,7 +3520,7 @@ int main(int argc, char **argv)
     printf("%-40s", "Testing vmovsd %xmm5,16(%ecx){%k3}...");
     memset(res, 0x88, 128);
     memset(res + 20, 0x77, 8);
-    if ( stack_exec && simd_check_avx512f() )
+    if ( stack_exec && simd_check_avx512f_sc() )
     {
         decl_insn(vmovsd_masked_to_mem);
 
@@ -3706,7 +3738,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing {evex} vmovd %xmm3,32(%ecx)...");
-    if ( stack_exec && simd_check_avx512f() )
+    if ( stack_exec && simd_check_avx512f_sc() )
     {
         decl_insn(evex_vmovd_to_mem);
 
@@ -3731,7 +3763,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing {evex} vmovd 32(%ecx),%xmm4...");
-    if ( stack_exec && simd_check_avx512f() )
+    if ( stack_exec && simd_check_avx512f_sc() )
     {
         decl_insn(evex_vmovd_from_mem);
 
@@ -3744,11 +3776,22 @@ int main(int argc, char **argv)
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
@@ -3921,7 +3964,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing {evex} vmovd %xmm2,%ebx...");
-    if ( stack_exec && simd_check_avx512f() )
+    if ( stack_exec && simd_check_avx512f_sc() )
     {
         decl_insn(evex_vmovd_to_reg);
 
@@ -3947,7 +3990,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing {evex} vmovd %ebx,%xmm1...");
-    if ( stack_exec && simd_check_avx512f() )
+    if ( stack_exec && simd_check_avx512f_sc() )
     {
         decl_insn(evex_vmovd_from_reg);
 
@@ -3961,11 +4004,22 @@ int main(int argc, char **argv)
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
@@ -4049,7 +4103,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing {evex} vmovq %xmm11,32(%ecx)...");
-    if ( stack_exec && simd_check_avx512f() )
+    if ( stack_exec && simd_check_avx512f_sc() )
     {
         decl_insn(evex_vmovq_to_mem2);
 
@@ -4139,7 +4193,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing vmovq %xmm22,%rbx...");
-    if ( stack_exec && simd_check_avx512f() )
+    if ( stack_exec && simd_check_avx512f_sc() )
     {
         decl_insn(evex_vmovq_to_reg);
 
@@ -5505,7 +5559,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing vmovsh 8(%ecx),%xmm5...");
-    if ( stack_exec && simd_check_avx512fp16() )
+    if ( stack_exec && simd_check_avx512fp16_sc() )
     {
         decl_insn(vmovsh_from_mem);
         decl_insn(vmovw_to_gpr);
@@ -5523,14 +5577,28 @@ int main(int argc, char **argv)
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
@@ -243,7 +243,7 @@ int emul_test_get_fpu(
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
@@ -185,6 +185,12 @@ void wrpkru(unsigned int val);
 #define cpu_has_avx_vnni_int8 (cpu_policy.feat.avx_vnni_int8 && xcr0_mask(6))
 #define cpu_has_avx_ne_convert (cpu_policy.feat.avx_ne_convert && xcr0_mask(6))
 #define cpu_has_avx_vnni_int16 (cpu_policy.feat.avx_vnni_int16 && xcr0_mask(6))
+                           /* TBD: Is bit 6 (ZMM_Hi256) really needed here? */
+#define cpu_has_avx10_1    (cpu_policy.feat.avx10 && xcr0_mask(0xe6))
+#define cpu_has_avx10_1_256 (cpu_has_avx10_1 && \
+                             (cpu_policy.avx10.vsz256 || \
+                              cpu_policy.avx10.vsz512))
+#define cpu_has_avx10_1_512 (cpu_has_avx10_1 && cpu_policy.avx10.vsz512)
 
 #define cpu_has_xgetbv1   (cpu_has_xsave && cpu_policy.xstate.xgetbv1)
 
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -1396,6 +1396,14 @@ x86_emulate(
         stb[2] = cp->feat.avx512bw || cp->feat.avx10
                  ? 0xf8 /* L0.NP.W1 - kmovq */
                  : 0x78 /* L0.NP.W0 - kmovw */;
+#ifndef __XEN__
+        /*
+         * SDE 9.27.0 is following ISE 049, where 64-bit opmask insns were
+         * valid only with vsz512.
+         */
+        if ( cp->feat.avx10 && !cp->avx10.vsz512 )
+            stb[2] = 0xf9 /* L0.66.W1 - kmovd */;
+#endif
         stb[3] = 0x91;
         stb[4] = evex.opmsk << 3;
         insn_bytes = 5;


