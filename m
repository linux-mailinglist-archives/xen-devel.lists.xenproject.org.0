Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0A094103B
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 13:07:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767601.1178285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYkhA-0004De-JM; Tue, 30 Jul 2024 11:07:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767601.1178285; Tue, 30 Jul 2024 11:07:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYkhA-0004Ay-Fv; Tue, 30 Jul 2024 11:07:08 +0000
Received: by outflank-mailman (input) for mailman id 767601;
 Tue, 30 Jul 2024 11:07:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hr/k=O6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sYkh9-0003nv-63
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 11:07:07 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id daddb330-4e63-11ef-8776-851b0ebba9a2;
 Tue, 30 Jul 2024 13:07:05 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a77ec5d3b0dso537514766b.0
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jul 2024 04:07:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acab236c2sm631750566b.31.2024.07.30.04.07.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jul 2024 04:07:04 -0700 (PDT)
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
X-Inumbo-ID: daddb330-4e63-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722337625; x=1722942425; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6RQ+w0Ug9ZM/A42hRx5PoW7PJtGUX4wP+Uhkm7ftIzo=;
        b=eG0d7E6ta7oeVptzRboEbXh37N78DQICT7PnKQ+4lYv9HNcJd8QWpbWVSGHU/excSA
         unJ/V83W7dPgfU6dubk9SABIczBEZDgrl7qTgzNLPoKf/7ZZNEIqME1zaMSPwzf0i7kD
         uGJeEEBDJgU8jdJLg5UravYPBf3OtDlRf1HxXri7MwijVC1iVMoECXQAtuVitH7Ch79l
         hj3VFgxy/rU75fklShfLu4VkbMBqdIQ4m+MRorsvMcw/QWuMlJdJJBj7scYFS6L58WEB
         etF0qnPRxLIWDf6iFLSmrzdN4RiNCU3Dn6I12D7wTtUCl+TjQXusx2n2hWe1DHoC90qU
         IsUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722337625; x=1722942425;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6RQ+w0Ug9ZM/A42hRx5PoW7PJtGUX4wP+Uhkm7ftIzo=;
        b=ctetvMcDFAiwge5tX7P/kADAisk9X97WsVHeVmilMtjusohWLqaKLuR6ceG++6+7d7
         ikTAlxFLpDGibdbFzvelLIVLDmbHidSTVHMGr2ZuI/FKOTjkW/tn6sTAI+Ywt36D7AcA
         gT/bgc2um8ucpbB+oNNOawXuzGF2M4I23oV/QMSNPqAdlTGUbJFqTxQCRsOsI4uVIheX
         N9eQdLd1PbHF7y6tFBg1Rh82HgOLNq0FoW0yG/QwhhXPENAT3uVzOax55EM1VPj4PCoL
         43C1+emcX7ta+boLQ0so9En7GWD6VkkGUrY9uuGI50ayxJoZYHB9IkgCbDLFX4xadBCl
         DcmA==
X-Gm-Message-State: AOJu0YzIuaSV7JmzyZodsipYrNs8t/ui3ewEIAlVLFEgLzsjIOhUrlV6
	aB1PKx/4xBeFa8HNVOOLr3gNHT2cSvXSRA7VgAQHS8ViA2j5pNLYQ9wpMc3xG2sm//9yGyNK3Vk
	=
X-Google-Smtp-Source: AGHT+IF1kkjSuGXaz1LmQS3R73F+42MdduuR9szbanVrYKhEDitUQBWkE9OmpwsUB6mTWqp4GaSbIQ==
X-Received: by 2002:a17:907:2cc6:b0:a7d:4dc4:3d8 with SMTP id a640c23a62f3a-a7d4dc40564mr660738766b.54.1722337624445;
        Tue, 30 Jul 2024 04:07:04 -0700 (PDT)
Message-ID: <44147507-65a4-4f21-aada-fa647f53ffd0@suse.com>
Date: Tue, 30 Jul 2024 13:07:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "community.manager@xenproject.org" <community.manager@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: drop Xeon Phi support
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Do as was decided in Lisbon. Reportedly Xen hasn't been working very
well on those processors anyway.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
One file I left untouched is the test harness'es predicates.c: Those
tests are imo fine to retain. Plus of course the dependencies in
gen-cpuid.py also want leaving in place imo (unless we were to remove
the respective 4 lines from the public header).

--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -11,6 +11,8 @@ The format is based on [Keep a Changelog
 ### Added
 
 ### Removed
+ - On x86:
+   - Support for running on Xeon Phi processors.
 
 ## [4.19.0](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.19.0) - 2024-07-29
 
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -30,6 +30,7 @@ if the related features are marked as su
 ### x86-64
 
     Status: Supported
+    Status, Xeon Phi: Not supported.
 
 ### ARM v7 + Virtualization Extensions
 
--- a/tools/tests/x86_emulator/Makefile
+++ b/tools/tests/x86_emulator/Makefile
@@ -16,7 +16,7 @@ vpath %.c $(XEN_ROOT)/xen/lib/x86
 
 CFLAGS += $(CFLAGS_xeninclude)
 
-SIMD := 3dnow sse sse2 sse4 avx avx2 xop avx512f avx512bw avx512dq avx512er avx512vbmi avx512fp16
+SIMD := 3dnow sse sse2 sse4 avx avx2 xop avx512f avx512bw avx512dq avx512vbmi avx512fp16
 FMA := fma4 fma
 SG := avx2-sg avx512f-sg
 AES := ssse3-aes avx-aes avx2-vaes avx512bw-vaes
@@ -80,9 +80,6 @@ avx512bw-flts :=
 avx512dq-vecs := $(avx512f-vecs)
 avx512dq-ints := $(avx512f-ints)
 avx512dq-flts := $(avx512f-flts)
-avx512er-vecs := 64
-avx512er-ints :=
-avx512er-flts := 4 8
 avx512vbmi-vecs := $(avx512bw-vecs)
 avx512vbmi-ints := $(avx512bw-ints)
 avx512vbmi-flts := $(avx512bw-flts)
--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -524,37 +524,6 @@ static const struct test avx512dq_512[]
     INSN(inserti32x8,    66, 0f3a, 3a, el_8, d, vl),
 };
 
-static const struct test avx512er_512[] = {
-    INSN(exp2,    66, 0f38, c8, vl, sd, vl),
-    INSN(rcp28,   66, 0f38, ca, vl, sd, vl),
-    INSN(rcp28,   66, 0f38, cb, el, sd, el),
-    INSN(rsqrt28, 66, 0f38, cc, vl, sd, vl),
-    INSN(rsqrt28, 66, 0f38, cd, el, sd, el),
-};
-
-static const struct test avx512pf_512[] = {
-    INSNX(gatherpf0d,  66, 0f38, c6, 1, vl, sd, el),
-    INSNX(gatherpf0q,  66, 0f38, c7, 1, vl, sd, el),
-    INSNX(gatherpf1d,  66, 0f38, c6, 2, vl, sd, el),
-    INSNX(gatherpf1q,  66, 0f38, c7, 2, vl, sd, el),
-    INSNX(scatterpf0d, 66, 0f38, c6, 5, vl, sd, el),
-    INSNX(scatterpf0q, 66, 0f38, c7, 5, vl, sd, el),
-    INSNX(scatterpf1d, 66, 0f38, c6, 6, vl, sd, el),
-    INSNX(scatterpf1q, 66, 0f38, c7, 6, vl, sd, el),
-};
-
-static const struct test avx512_4fmaps_512[] = {
-    INSN(4fmaddps,  f2, 0f38, 9a, el_4, d, vl),
-    INSN(4fmaddss,  f2, 0f38, 9b, el_4, d, vl),
-    INSN(4fnmaddps, f2, 0f38, aa, el_4, d, vl),
-    INSN(4fnmaddss, f2, 0f38, ab, el_4, d, vl),
-};
-
-static const struct test avx512_4vnniw_512[] = {
-    INSN(p4dpwssd,  f2, 0f38, 52, el_4, d, vl),
-    INSN(p4dpwssds, f2, 0f38, 53, el_4, d, vl),
-};
-
 static const struct test avx512_bf16_all[] = {
     INSN(cvtne2ps2bf16, f2, 0f38, 72, vl, d, vl),
     INSN(cvtneps2bf16,  f3, 0f38, 72, vl, d, vl),
@@ -1110,11 +1079,6 @@ void evex_disp8_test(void *instr, struct
     RUN(avx512dq, 128);
     RUN(avx512dq, no128);
     RUN(avx512dq, 512);
-    RUN(avx512er, 512);
-#define cpu_has_avx512pf cpu_has_avx512f
-    RUN(avx512pf, 512);
-    RUN(avx512_4fmaps, 512);
-    RUN(avx512_4vnniw, 512);
     RUN(avx512_bf16, all);
     RUN(avx512_bitalg, all);
     RUN(avx512_ifma, all);
--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -39,7 +39,6 @@ asm ( ".pushsection .test, \"ax\", @prog
 #include "avx512bw-vpclmulqdq.h"
 #include "avx512bw-gf.h"
 #include "avx512dq.h"
-#include "avx512er.h"
 #include "avx512vbmi.h"
 #include "avx512vbmi2-vpclmulqdq.h"
 #include "avx512fp16.h"
@@ -147,11 +146,6 @@ static bool simd_check_avx512dq_vl(void)
     return cpu_has_avx512dq && cpu_has_avx512vl;
 }
 
-static bool simd_check_avx512er(void)
-{
-    return cpu_has_avx512er;
-}
-
 static bool simd_check_avx512bw(void)
 {
     return cpu_has_avx512bw;
@@ -507,10 +501,6 @@ static const struct {
     AVX512VL(DQ+VL u64x2,    avx512dq,      16u8),
     AVX512VL(DQ+VL s64x4,    avx512dq,      32i8),
     AVX512VL(DQ+VL u64x4,    avx512dq,      32u8),
-    SIMD(AVX512ER f32 scalar,avx512er,        f4),
-    SIMD(AVX512ER f32x16,    avx512er,      64f4),
-    SIMD(AVX512ER f64 scalar,avx512er,        f8),
-    SIMD(AVX512ER f64x8,     avx512er,      64f8),
     SIMD(AVX512_VBMI s8x64,  avx512vbmi,    64i1),
     SIMD(AVX512_VBMI u8x64,  avx512vbmi,    64u1),
     SIMD(AVX512_VBMI s16x32, avx512vbmi,    64i2),
@@ -4983,81 +4973,6 @@ int main(int argc, char **argv)
     }
 #endif
 
-    printf("%-40s", "Testing v4fmaddps 32(%ecx),%zmm4,%zmm4{%k5}...");
-    if ( stack_exec && cpu_has_avx512_4fmaps )
-    {
-        decl_insn(v4fmaddps);
-        static const struct {
-            float f[16];
-        } in = {{
-            1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
-        }}, out = {{
-            1 + 1 * 9 + 2 * 10 + 3 * 11 + 4 * 12,
-            2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15,
-            16 + 16 * 9 + 17 * 10 + 18 * 11 + 19 * 12
-        }};
-
-        asm volatile ( "vmovups %1, %%zmm4\n\t"
-                       "vbroadcastss %%xmm4, %%zmm7\n\t"
-                       "vaddps %%zmm4, %%zmm7, %%zmm5\n\t"
-                       "vaddps %%zmm5, %%zmm7, %%zmm6\n\t"
-                       "vaddps %%zmm6, %%zmm7, %%zmm7\n\t"
-                       "kmovw %2, %%k5\n"
-                       put_insn(v4fmaddps,
-                                "v4fmaddps 32(%0), %%zmm4, %%zmm4%{%%k5%}")
-                       :: "c" (NULL), "m" (in), "rmk" (0x8001) );
-
-        set_insn(v4fmaddps);
-        regs.ecx = (unsigned long)&in;
-        rc = x86_emulate(&ctxt, &emulops);
-        if ( rc != X86EMUL_OKAY || !check_eip(v4fmaddps) )
-            goto fail;
-
-        asm ( "vcmpeqps %1, %%zmm4, %%k0\n\t"
-              "kmovw %%k0, %0" : "=g" (rc) : "m" (out) );
-        if ( rc != 0xffff )
-            goto fail;
-        printf("okay\n");
-    }
-    else
-        printf("skipped\n");
-
-    printf("%-40s", "Testing v4fnmaddss 16(%edx),%zmm4,%zmm4{%k3}...");
-    if ( stack_exec && cpu_has_avx512_4fmaps )
-    {
-        decl_insn(v4fnmaddss);
-        static const struct {
-            float f[16];
-        } in = {{
-            1, 2, 3, 4, 5, 6, 7, 8
-        }}, out = {{
-            1 - 1 * 5 - 2 * 6 - 3 * 7 - 4 * 8, 2, 3, 4
-        }};
-
-        asm volatile ( "vmovups %1, %%xmm4\n\t"
-                       "vaddss %%xmm4, %%xmm4, %%xmm5\n\t"
-                       "vaddss %%xmm5, %%xmm4, %%xmm6\n\t"
-                       "vaddss %%xmm6, %%xmm4, %%xmm7\n\t"
-                       "kmovw %2, %%k3\n"
-                       put_insn(v4fnmaddss,
-                                "v4fnmaddss 16(%0), %%xmm4, %%xmm4%{%%k3%}")
-                       :: "d" (NULL), "m" (in), "rmk" (1) );
-
-        set_insn(v4fnmaddss);
-        regs.edx = (unsigned long)&in;
-        rc = x86_emulate(&ctxt, &emulops);
-        if ( rc != X86EMUL_OKAY || !check_eip(v4fnmaddss) )
-            goto fail;
-
-        asm ( "vcmpeqps %1, %%zmm4, %%k0\n\t"
-              "kmovw %%k0, %0" : "=g" (rc) : "m" (out) );
-        if ( rc != 0xffff )
-            goto fail;
-        printf("okay\n");
-    }
-    else
-        printf("skipped\n");
-
     if ( stack_exec && cpu_has_avx512_bf16 )
     {
         decl_insn(vcvtne2ps2bf16);
--- a/tools/tests/x86_emulator/x86-emulate.c
+++ b/tools/tests/x86_emulator/x86-emulate.c
@@ -84,7 +84,6 @@ bool emul_test_init(void)
     cp.basic.movbe = true;
     cp.feat.invpcid = true;
     cp.feat.adx = true;
-    cp.feat.avx512pf = cp.feat.avx512f;
     cp.feat.rdpid = true;
     cp.feat.wrmsrns = true;
     cp.extd.clzero = true;
--- a/tools/tests/x86_emulator/x86-emulate.h
+++ b/tools/tests/x86_emulator/x86-emulate.h
@@ -156,7 +156,6 @@ void wrpkru(unsigned int val);
 #define cpu_has_avx512f   (cp.feat.avx512f  && xcr0_mask(0xe6))
 #define cpu_has_avx512dq  (cp.feat.avx512dq && xcr0_mask(0xe6))
 #define cpu_has_avx512_ifma (cp.feat.avx512_ifma && xcr0_mask(0xe6))
-#define cpu_has_avx512er  (cp.feat.avx512er && xcr0_mask(0xe6))
 #define cpu_has_avx512cd  (cp.feat.avx512cd && xcr0_mask(0xe6))
 #define cpu_has_sha        cp.feat.sha
 #define cpu_has_avx512bw  (cp.feat.avx512bw && xcr0_mask(0xe6))
@@ -171,8 +170,6 @@ void wrpkru(unsigned int val);
 #define cpu_has_avx512_vpopcntdq (cp.feat.avx512_vpopcntdq && xcr0_mask(0xe6))
 #define cpu_has_movdiri    cp.feat.movdiri
 #define cpu_has_movdir64b  cp.feat.movdir64b
-#define cpu_has_avx512_4vnniw (cp.feat.avx512_4vnniw && xcr0_mask(0xe6))
-#define cpu_has_avx512_4fmaps (cp.feat.avx512_4fmaps && xcr0_mask(0xe6))
 #define cpu_has_avx512_vp2intersect (cp.feat.avx512_vp2intersect && xcr0_mask(0xe6))
 #define cpu_has_serialize  cp.feat.serialize
 #define cpu_has_avx512_fp16 (cp.feat.avx512_fp16 && xcr0_mask(0xe6))
--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -73,7 +73,6 @@
 #define GET_CC3_RES(val)  GET_HW_RES_IN_NS(0x3FC, val)
 #define GET_CC6_RES(val)  GET_HW_RES_IN_NS(0x3FD, val)
 #define GET_CC7_RES(val)  GET_HW_RES_IN_NS(0x3FE, val) /* SNB onwards */
-#define PHI_CC6_RES(val)  GET_HW_RES_IN_NS(0x3FF, val) /* Xeon Phi only */
 
 static void cf_check lapic_timer_nop(void) { }
 void (*__read_mostly lapic_timer_off)(void);
@@ -222,18 +221,6 @@ static void cf_check do_get_hw_residenci
         GET_CC6_RES(hw_res->cc6);
         GET_CC7_RES(hw_res->cc7);
         break;
-    /* Xeon Phi Knights Landing */
-    case 0x57:
-    /* Xeon Phi Knights Mill */
-    case 0x85:
-        GET_CC3_RES(hw_res->mc0); /* abusing GET_CC3_RES */
-        GET_CC6_RES(hw_res->mc6); /* abusing GET_CC6_RES */
-        GET_PC2_RES(hw_res->pc2);
-        GET_PC3_RES(hw_res->pc3);
-        GET_PC6_RES(hw_res->pc6);
-        GET_PC7_RES(hw_res->pc7);
-        PHI_CC6_RES(hw_res->cc6);
-        break;
     /* various Atoms */
     case 0x27:
         GET_PC3_RES(hw_res->pc2); /* abusing GET_PC3_RES */
--- a/xen/arch/x86/cpu/mcheck/mce_intel.c
+++ b/xen/arch/x86/cpu/mcheck/mce_intel.c
@@ -875,10 +875,8 @@ static void intel_init_ppin(const struct
     case 0x4f: /* Broadwell X */
     case 0x55: /* Skylake X */
     case 0x56: /* Broadwell Xeon D */
-    case 0x57: /* Knights Landing */
     case 0x6a: /* Icelake X */
     case 0x6c: /* Icelake D */
-    case 0x85: /* Knights Mill */
     case 0x8f: /* Sapphire Rapids X */
 
         if ( (c != &boot_cpu_data && !ppin_msr) ||
--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -778,22 +778,6 @@ static const struct cpuidle_state avn_cs
 	{}
 };
 
-static const struct cpuidle_state knl_cstates[] = {
-	{
-		.name = "C1",
-		.flags = MWAIT2flg(0x00),
-		.exit_latency = 1,
-		.target_residency = 2,
-	},
-	{
-		.name = "C6",
-		.flags = MWAIT2flg(0x10) | CPUIDLE_FLAG_TLB_FLUSHED,
-		.exit_latency = 120,
-		.target_residency = 500,
-	},
-	{}
-};
-
 static struct cpuidle_state __read_mostly bxt_cstates[] = {
 	{
 		.name = "C1",
@@ -1121,10 +1105,6 @@ static const struct idle_cpu idle_cpu_av
 	.c1e_promotion = C1E_PROMOTION_DISABLE,
 };
 
-static const struct idle_cpu idle_cpu_knl = {
-	.state_table = knl_cstates,
-};
-
 static const struct idle_cpu idle_cpu_bxt = {
 	.state_table = bxt_cstates,
 	.c1e_promotion = C1E_PROMOTION_DISABLE,
@@ -1181,8 +1161,6 @@ static const struct x86_cpu_id intel_idl
 	ICPU(ALDERLAKE,			adl),
 	ICPU(ALDERLAKE_L,		adl_l),
 	ICPU(SAPPHIRERAPIDS_X,		spr),
-	ICPU(XEON_PHI_KNL,		knl),
-	ICPU(XEON_PHI_KNM,		knl),
 	ICPU(ATOM_GOLDMONT,		bxt),
 	ICPU(ATOM_GOLDMONT_PLUS,	bxt),
 	ICPU(ATOM_GOLDMONT_D,		dnv),
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -533,10 +533,6 @@ static const struct lbr_info *__init get
             return at_lbr;
         /* Silvermont */
         case 0x37: case 0x4a: case 0x4d: case 0x5a: case 0x5d:
-        /* Xeon Phi Knights Landing */
-        case 0x57:
-        /* Xeon Phi Knights Mill */
-        case 0x85:
         /* Airmont */
         case 0x4c:
             return sm_lbr;
@@ -2984,13 +2980,6 @@ static bool __init has_if_pschange_mc(vo
     case 0x7a: /* Gemini Lake */
     case 0x86: /* Jacobsville */
 
-        /*
-         * Knights processors are not vulnerable.
-         */
-    case 0x57: /* Knights Landing */
-    case 0x85: /* Knights Mill */
-        return false;
-
     default:
         printk("Unrecognised CPU model %#x - assuming vulnerable to IF_PSCHANGE_MC\n",
                boot_cpu_data.x86_model);
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -140,7 +140,6 @@ static inline bool boot_cpu_has(unsigned
 #define cpu_has_avx512_ifma     boot_cpu_has(X86_FEATURE_AVX512_IFMA)
 #define cpu_has_clflushopt      boot_cpu_has(X86_FEATURE_CLFLUSHOPT)
 #define cpu_has_clwb            boot_cpu_has(X86_FEATURE_CLWB)
-#define cpu_has_avx512er        boot_cpu_has(X86_FEATURE_AVX512ER)
 #define cpu_has_avx512cd        boot_cpu_has(X86_FEATURE_AVX512CD)
 #define cpu_has_proc_trace      boot_cpu_has(X86_FEATURE_PROC_TRACE)
 #define cpu_has_sha             boot_cpu_has(X86_FEATURE_SHA)
@@ -174,8 +173,6 @@ static inline bool boot_cpu_has(unsigned
 #define cpu_has_auto_ibrs       boot_cpu_has(X86_FEATURE_AUTO_IBRS)
 
 /* CPUID level 0x00000007:0.edx */
-#define cpu_has_avx512_4vnniw   boot_cpu_has(X86_FEATURE_AVX512_4VNNIW)
-#define cpu_has_avx512_4fmaps   boot_cpu_has(X86_FEATURE_AVX512_4FMAPS)
 #define cpu_has_avx512_vp2intersect boot_cpu_has(X86_FEATURE_AVX512_VP2INTERSECT)
 #define cpu_has_srbds_ctrl      boot_cpu_has(X86_FEATURE_SRBDS_CTRL)
 #define cpu_has_md_clear        boot_cpu_has(X86_FEATURE_MD_CLEAR)
--- a/xen/arch/x86/include/asm/intel-family.h
+++ b/xen/arch/x86/include/asm/intel-family.h
@@ -13,8 +13,8 @@
  *	INTEL_FAM6{OPTFAMILY}_{MICROARCH}{OPTDIFF}
  * where:
  * OPTFAMILY	Describes the family of CPUs that this belongs to. Default
- *		is assumed to be "_CORE" (and should be omitted). Other values
- *		currently in use are _ATOM and _XEON_PHI
+ *		is assumed to be "_CORE" (and should be omitted). The other
+ *		value currently in use is _ATOM.
  * MICROARCH	Is the code name for the micro-architecture for this core.
  *		N.B. Not the platform name.
  * OPTDIFF	If needed, a short string to differentiate by market segment.
@@ -164,11 +164,6 @@
 
 #define INTEL_FAM6_ATOM_DARKMONT_X	0xDD /* Clearwater Forest */
 
-/* Xeon Phi */
-
-#define INTEL_FAM6_XEON_PHI_KNL		0x57 /* Knights Landing */
-#define INTEL_FAM6_XEON_PHI_KNM		0x85 /* Knights Mill */
-
 /* Family 5 */
 #define INTEL_FAM5_QUARK_X1000		0x09 /* Quark X1000 SoC */
 
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -887,11 +887,9 @@ static bool __init retpoline_calculation
     case 0x4d: /* Avaton / Rangely (Silvermont) */
     case 0x4c: /* Cherrytrail / Brasswell */
     case 0x4a: /* Merrifield */
-    case 0x57: /* Knights Landing */
     case 0x5a: /* Moorefield */
     case 0x5c: /* Goldmont */
     case 0x5f: /* Denverton */
-    case 0x85: /* Knights Mill */
         safe = true;
         break;
 
@@ -1005,13 +1003,6 @@ static bool __init should_use_eager_fpu(
     case 0x7a: /* Gemini Lake */
         return false;
 
-        /*
-         * Knights processors are not vulnerable.
-         */
-    case 0x57: /* Knights Landing */
-    case 0x85: /* Knights Mill */
-        return false;
-
     default:
         printk("Unrecognised CPU model %#x - assuming vulnerable to LazyFPU\n",
                boot_cpu_data.x86_model);
@@ -1259,13 +1250,6 @@ static __init void l1tf_calculations(voi
         case 0x7a: /* Gemini Lake */
             break;
 
-            /*
-             * Knights processors are not vulnerable.
-             */
-        case 0x57: /* Knights Landing */
-        case 0x85: /* Knights Mill */
-            break;
-
         default:
             /* Defer printk() until we've accounted for RDCL_NO. */
             hit_default = true;
@@ -1416,13 +1400,6 @@ static __init void mds_calculations(void
     case 0x65: /* SoFIA LTE AOSP */
     case 0x6e: /* Cougar Mountain */
     case 0x75: /* Lightning Mountain */
-        /*
-         * Knights processors (which are based on the Silvermont/Airmont
-         * microarchitecture) are similarly only affected by the Store Buffer
-         * aspect.
-         */
-    case 0x57: /* Knights Landing */
-    case 0x85: /* Knights Mill */
         cpu_has_bug_msbds_only = true;
         break;
 
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -564,8 +564,6 @@ amd_like(const struct x86_emulate_ctxt *
 #define vcpu_has_avx512_ifma() (ctxt->cpuid->feat.avx512_ifma)
 #define vcpu_has_clflushopt()  (ctxt->cpuid->feat.clflushopt)
 #define vcpu_has_clwb()        (ctxt->cpuid->feat.clwb)
-#define vcpu_has_avx512pf()    (ctxt->cpuid->feat.avx512pf)
-#define vcpu_has_avx512er()    (ctxt->cpuid->feat.avx512er)
 #define vcpu_has_avx512cd()    (ctxt->cpuid->feat.avx512cd)
 #define vcpu_has_sha()         (ctxt->cpuid->feat.sha)
 #define vcpu_has_avx512bw()    (ctxt->cpuid->feat.avx512bw)
@@ -582,8 +580,6 @@ amd_like(const struct x86_emulate_ctxt *
 #define vcpu_has_movdiri()     (ctxt->cpuid->feat.movdiri)
 #define vcpu_has_movdir64b()   (ctxt->cpuid->feat.movdir64b)
 #define vcpu_has_enqcmd()      (ctxt->cpuid->feat.enqcmd)
-#define vcpu_has_avx512_4vnniw() (ctxt->cpuid->feat.avx512_4vnniw)
-#define vcpu_has_avx512_4fmaps() (ctxt->cpuid->feat.avx512_4fmaps)
 #define vcpu_has_avx512_vp2intersect() (ctxt->cpuid->feat.avx512_vp2intersect)
 #define vcpu_has_serialize()   (ctxt->cpuid->feat.serialize)
 #define vcpu_has_tsxldtrk()    (ctxt->cpuid->feat.tsxldtrk)
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -6029,7 +6029,6 @@ x86_emulate(
     case X86EMUL_OPC_EVEX_66(0x0f38, 0xbd): /* vfnmadd231s{s,d} xmm/mem,xmm,xmm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0xbf): /* vfnmsub231s{s,d} xmm/mem,xmm,xmm{k} */
         host_and_vcpu_must_have(avx512f);
-    simd_zmm_scalar_sae:
         generate_exception_if(ea.type != OP_REG && evex.brs, X86_EXC_UD);
         if ( !evex.brs )
             avx512_vlen_check(true);
@@ -6123,15 +6122,6 @@ x86_emulate(
         avx512_vlen_check(true);
         goto simd_zmm;
 
-    case X86EMUL_OPC_EVEX_F2(0x0f38, 0x52): /* vp4dpwssd m128,zmm+3,zmm{k} */
-    case X86EMUL_OPC_EVEX_F2(0x0f38, 0x53): /* vp4dpwssds m128,zmm+3,zmm{k} */
-        host_and_vcpu_must_have(avx512_4vnniw);
-        generate_exception_if((ea.type != OP_MEM || evex.w || evex.brs ||
-                               evex.lr != 2),
-                              X86_EXC_UD);
-        op_mask = op_mask & 0xffff ? 0xf : 0;
-        goto simd_zmm;
-
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x8f): /* vpshufbitqmb [xyz]mm/mem,[xyz]mm,k{k} */
         generate_exception_if(evex.w || !evex.r || !evex.R || evex.z, X86_EXC_UD);
         /* fall through */
@@ -6601,24 +6591,6 @@ x86_emulate(
         host_and_vcpu_must_have(fma);
         goto simd_0f_ymm;
 
-    case X86EMUL_OPC_EVEX_F2(0x0f38, 0x9a): /* v4fmaddps m128,zmm+3,zmm{k} */
-    case X86EMUL_OPC_EVEX_F2(0x0f38, 0xaa): /* v4fnmaddps m128,zmm+3,zmm{k} */
-        host_and_vcpu_must_have(avx512_4fmaps);
-        generate_exception_if((ea.type != OP_MEM || evex.w || evex.brs ||
-                               evex.lr != 2),
-                              X86_EXC_UD);
-        op_mask = op_mask & 0xffff ? 0xf : 0;
-        goto simd_zmm;
-
-    case X86EMUL_OPC_EVEX_F2(0x0f38, 0x9b): /* v4fmaddss m128,xmm+3,xmm{k} */
-    case X86EMUL_OPC_EVEX_F2(0x0f38, 0xab): /* v4fnmaddss m128,xmm+3,xmm{k} */
-        host_and_vcpu_must_have(avx512_4fmaps);
-        generate_exception_if((ea.type != OP_MEM || evex.w || evex.brs ||
-                               evex.lr == 3),
-                              X86_EXC_UD);
-        op_mask = op_mask & 1 ? 0xf : 0;
-        goto simd_zmm;
-
     case X86EMUL_OPC_EVEX_66(0x0f38, 0xa0): /* vpscatterd{d,q} [xyz]mm,mem{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0xa1): /* vpscatterq{d,q} [xyz]mm,mem{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0xa2): /* vscatterdp{s,d} [xyz]mm,mem{k} */
@@ -6759,97 +6731,6 @@ x86_emulate(
         generate_exception_if(!evex.w, X86_EXC_UD);
         goto avx512f_no_sae;
 
-    case X86EMUL_OPC_EVEX_66(0x0f38, 0xc6):
-    case X86EMUL_OPC_EVEX_66(0x0f38, 0xc7):
-    {
-#ifndef __XEN__
-        typeof(evex) *pevex;
-        union {
-            int32_t dw[16];
-            int64_t qw[8];
-        } index;
-#endif
-
-        ASSERT(ea.type == OP_MEM);
-        generate_exception_if((!cpu_has_avx512f || !evex.opmsk || evex.brs ||
-                               evex.z || evex.reg != 0xf || evex.lr != 2),
-                              X86_EXC_UD);
-
-        switch ( modrm_reg & 7 )
-        {
-        case 1: /* vgatherpf0{d,q}p{s,d} mem{k} */
-        case 2: /* vgatherpf1{d,q}p{s,d} mem{k} */
-        case 5: /* vscatterpf0{d,q}p{s,d} mem{k} */
-        case 6: /* vscatterpf1{d,q}p{s,d} mem{k} */
-            vcpu_must_have(avx512pf);
-            break;
-        default:
-            generate_exception(X86_EXC_UD);
-        }
-
-        get_fpu(X86EMUL_FPU_zmm);
-
-#ifndef __XEN__
-        /*
-         * For the test harness perform zero byte memory accesses, such that
-         * in particular correct Disp8 scaling can be verified.
-         */
-        fail_if((modrm_reg & 4) && !ops->write);
-
-        /* Read index register. */
-        opc = init_evex(stub);
-        pevex = copy_EVEX(opc, evex);
-        pevex->opcx = vex_0f;
-        /* vmovdqu{32,64} */
-        opc[0] = 0x7f;
-        pevex->pfx = vex_f3;
-        pevex->w = b & 1;
-        /* Use (%rax) as destination and sib_index as source. */
-        pevex->b = 1;
-        opc[1] = (state->sib_index & 7) << 3;
-        pevex->r = !mode_64bit() || !(state->sib_index & 0x08);
-        pevex->R = !mode_64bit() || !(state->sib_index & 0x10);
-        pevex->RX = 1;
-        opc[2] = 0xc3;
-
-        invoke_stub("", "", "=m" (index) : "a" (&index));
-        put_stub(stub);
-
-        /* Clear untouched parts of the mask value. */
-        n = 1 << (4 - ((b & 1) | evex.w));
-        op_mask &= (1 << n) - 1;
-
-        for ( i = 0; rc == X86EMUL_OKAY && op_mask; ++i )
-        {
-            long idx = b & 1 ? index.qw[i] : index.dw[i];
-
-            if ( !(op_mask & (1 << i)) )
-                continue;
-
-            rc = (modrm_reg & 4
-                  ? ops->write
-                  : ops->read)(ea.mem.seg,
-                               truncate_ea(ea.mem.off +
-                                           idx * (1 << state->sib_scale)),
-                               NULL, 0, ctxt);
-            if ( rc == X86EMUL_EXCEPTION )
-            {
-                /* Squash memory access related exceptions. */
-                x86_emul_reset_event(ctxt);
-                rc = X86EMUL_OKAY;
-            }
-
-            op_mask &= ~(1 << i);
-        }
-
-        if ( rc != X86EMUL_OKAY )
-            goto done;
-#endif
-
-        state->simd_size = simd_none;
-        break;
-    }
-
     case X86EMUL_OPC(0x0f38, 0xc8):     /* sha1nexte xmm/m128,xmm */
     case X86EMUL_OPC(0x0f38, 0xc9):     /* sha1msg1 xmm/m128,xmm */
     case X86EMUL_OPC(0x0f38, 0xca):     /* sha1msg2 xmm/m128,xmm */
@@ -6860,19 +6741,6 @@ x86_emulate(
         op_bytes = 16;
         goto simd_0f38_common;
 
-    case X86EMUL_OPC_EVEX_66(0x0f38, 0xc8): /* vexp2p{s,d} zmm/mem,zmm{k} */
-    case X86EMUL_OPC_EVEX_66(0x0f38, 0xca): /* vrcp28p{s,d} zmm/mem,zmm{k} */
-    case X86EMUL_OPC_EVEX_66(0x0f38, 0xcc): /* vrsqrt28p{s,d} zmm/mem,zmm{k} */
-        host_and_vcpu_must_have(avx512er);
-        generate_exception_if((ea.type != OP_REG || !evex.brs) && evex.lr != 2,
-                              X86_EXC_UD);
-        goto simd_zmm;
-
-    case X86EMUL_OPC_EVEX_66(0x0f38, 0xcb): /* vrcp28s{s,d} xmm/mem,xmm,xmm{k} */
-    case X86EMUL_OPC_EVEX_66(0x0f38, 0xcd): /* vrsqrt28s{s,d} xmm/mem,xmm,xmm{k} */
-        host_and_vcpu_must_have(avx512er);
-        goto simd_zmm_scalar_sae;
-
     case X86EMUL_OPC_VEX_F2(0x0f38, 0xcb): /* vsha512rnds2 xmm,ymm,ymm */
     case X86EMUL_OPC_VEX_F2(0x0f38, 0xcc): /* vsha512msg1 xmm,ymm */
     case X86EMUL_OPC_VEX_F2(0x0f38, 0xcd): /* vsha512msg2 ymm,ymm */
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -208,8 +208,8 @@ XEN_CPUFEATURE(AVX512_IFMA,   5*32+21) /
 XEN_CPUFEATURE(CLFLUSHOPT,    5*32+23) /*A  CLFLUSHOPT instruction */
 XEN_CPUFEATURE(CLWB,          5*32+24) /*!A CLWB instruction */
 XEN_CPUFEATURE(PROC_TRACE,    5*32+25) /*   Processor Trace */
-XEN_CPUFEATURE(AVX512PF,      5*32+26) /*A  AVX-512 Prefetch Instructions */
-XEN_CPUFEATURE(AVX512ER,      5*32+27) /*A  AVX-512 Exponent & Reciprocal Instrs */
+XEN_CPUFEATURE(AVX512PF,      5*32+26) /*   Xeon Phi AVX-512 Prefetch Instructions */
+XEN_CPUFEATURE(AVX512ER,      5*32+27) /*   Xeon Phi AVX-512 Exponent & Reciprocal Instrs */
 XEN_CPUFEATURE(AVX512CD,      5*32+28) /*A  AVX-512 Conflict Detection Instrs */
 XEN_CPUFEATURE(SHA,           5*32+29) /*A  SHA1 & SHA256 instructions */
 XEN_CPUFEATURE(AVX512BW,      5*32+30) /*A  AVX-512 Byte and Word Instructions */
@@ -264,8 +264,8 @@ XEN_CPUFEATURE(BTC_NO,        8*32+29) /
 XEN_CPUFEATURE(IBPB_RET,      8*32+30) /*A  IBPB clears RSB/RAS too. */
 
 /* Intel-defined CPU features, CPUID level 0x00000007:0.edx, word 9 */
-XEN_CPUFEATURE(AVX512_4VNNIW, 9*32+ 2) /*A  AVX512 Neural Network Instructions */
-XEN_CPUFEATURE(AVX512_4FMAPS, 9*32+ 3) /*A  AVX512 Multiply Accumulation Single Precision */
+XEN_CPUFEATURE(AVX512_4VNNIW, 9*32+ 2) /*   Xeon Phi AVX512 Neural Network Instructions */
+XEN_CPUFEATURE(AVX512_4FMAPS, 9*32+ 3) /*   Xeon Phi AVX512 Multiply Accumulation Single Precision */
 XEN_CPUFEATURE(FSRM,          9*32+ 4) /*A  Fast Short REP MOVS */
 XEN_CPUFEATURE(UINTR,         9*32+ 5) /*   User-mode Interrupts */
 XEN_CPUFEATURE(AVX512_VP2INTERSECT, 9*32+8) /*a  VP2INTERSECT{D,Q} insns */

