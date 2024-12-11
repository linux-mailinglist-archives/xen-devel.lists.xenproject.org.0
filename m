Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9704E9ECA06
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 11:12:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.854283.1267529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLJhn-00052L-Lh; Wed, 11 Dec 2024 10:12:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 854283.1267529; Wed, 11 Dec 2024 10:12:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLJhn-00050V-Ie; Wed, 11 Dec 2024 10:12:31 +0000
Received: by outflank-mailman (input) for mailman id 854283;
 Wed, 11 Dec 2024 10:12:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2HaM=TE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tLJhl-0003z3-OZ
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 10:12:29 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 69d981eb-b7a8-11ef-99a3-01e77a169b0f;
 Wed, 11 Dec 2024 11:12:23 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3862f32a33eso2182391f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Dec 2024 02:12:27 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ef68c07bfcsm9657745a91.12.2024.12.11.02.12.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 02:12:26 -0800 (PST)
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
X-Inumbo-ID: 69d981eb-b7a8-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733911947; x=1734516747; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZqFYw/nizVXDm7kHbUCaTgxJOMEM5PPDM0bi8pFmXx4=;
        b=IOtFSqR1Eul+3lfMhZFJ+muVvqs3eRz6aBpzDN+G4y3jpP1jWyKMR0uDVi8nQoi5/b
         jcUY3E/pVl1jiV/fmjlT3EOQ1X2o8HJZkSnOLQbQk+nmRk5AJ553v5osqzlgnfAJKBS4
         /oVFFjHwb/vHke9NgJI39fcajUyzzTRrBDf7pfHMve45dayLKTJrV6wrXs+vOVJYGURR
         2J9mi8FKcxpDpSoZFZGS4ldvOOJP7rawPDEsKuFrIMXkzQmr2qBloJBfmf+9O8PsLA+m
         esQ87LmNUl/vK9NiPaD9n3qi14oxrTRBfwQHiZ2BoMEOjup+vrMEAFNjqPqvVxPmKmS/
         6cdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733911947; x=1734516747;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZqFYw/nizVXDm7kHbUCaTgxJOMEM5PPDM0bi8pFmXx4=;
        b=er6acMPSlMqs/0uaQ+k81njNF3yIIIcy7FZm6nfVnUbV7z3VJlRfHM42japvkmrZN0
         g3Ibs0gj1Tp0iM5OHo93LX1Oa38U3coDXZhiBy89hEqLPDcIg9WK9LuCjzEyInVSIjHd
         CCZJDZMBeQQ/+BjwemChi3sDPSDpKvPeBxW7Gai0tDjQb6C7z06rIcfuTH0iG6Fbw7wI
         LmJRah+mhtc5Wqkg8IXgZobOwuogjjgNy2Rz/aUe2qjmj+zjgfe8sUV+4n/h3eaxIRvy
         +102ziDO9KkDGxn3LXKuvJ5/vP5/wR+ssxZKhMbkRid1jkxzrwWW4wOSeRCIFn27W2WA
         86cg==
X-Gm-Message-State: AOJu0YxaU14yEP+zuh1gh9E3sC66eky/diCwthEB09540i/E/eWmPiOW
	oK85ap0/M2LnBhaO0fjs3sIm7LrauGT1kJ7u95tSMUsDpko4mo4Z66dWEDllIJqCnTJumA2efCI
	=
X-Gm-Gg: ASbGncv4bdnW5TjxCV7oqZmf8JlH8SBSSpMhVzmz12KV1KOQ0HqC0KrztbG9/Rp2s+G
	3yfOILtSEyfkDL16pVogLamm69JhZk45vdKzmjlkpp/Ku+hpwLRZBRDr20jcpLZ25y5fFLRpmJx
	Lbtxdi5yXNHmbtKFDXvivWeU+PbruMgwLTWMnY80bhk/TC5kFQ3a/XqLsGfK170ElxXNtuKemXE
	Lkbtrxe5V/rtPHiFvIeAQrFjwS4tv/abCVElmbH0EHgBGia5cZwfX/xjtNGOM9cU357yNGbJ6Ze
	eBOiFbf9xJz7cRd37xR8mMUNh31Qpz28rKXyJDA=
X-Google-Smtp-Source: AGHT+IEjw1VR6RvKQ56Pj7s0pHYojoghsUb91BvgzPodD1nm29nl21v8UUvBBmPiK4/ZlBLg7jD27w==
X-Received: by 2002:a5d:47ab:0:b0:385:fb34:d59f with SMTP id ffacd0b85a97d-3864ce86a74mr2122464f8f.11.1733911947260;
        Wed, 11 Dec 2024 02:12:27 -0800 (PST)
Message-ID: <ab8aac20-ac79-4049-b7fb-3337b324fbf8@suse.com>
Date: Wed, 11 Dec 2024 11:12:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 03/16] x86emul/test: use simd_check_avx512*() in main()
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

In preparation for having these also cover AVX10, use the helper
functions in preference of open-coded cpu_has_avx512* for those features
that AVX10 includes. Introduce a couple further helper functions where
they weren't previously needed.

Note that this way simd_check_avx512f_sha_vl() gains an AVX512F check
(which is likely benign) and simd_check_avx512bw_gf_vl() gains an
AVX512BW check (which was clearly missing). 

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Re-base over dropping of Xeon Phi support.

--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -167,6 +167,11 @@ static bool simd_check_avx512vbmi_vl(voi
     return cpu_has_avx512_vbmi && cpu_has_avx512vl;
 }
 
+static bool simd_check_avx512vbmi2(void)
+{
+    return cpu_has_avx512_vbmi2;
+}
+
 static bool simd_check_sse4_sha(void)
 {
     return cpu_has_sha && cpu_has_sse4_2;
@@ -179,7 +184,7 @@ static bool simd_check_avx_sha(void)
 
 static bool simd_check_avx512f_sha_vl(void)
 {
-    return cpu_has_sha && cpu_has_avx512vl;
+    return cpu_has_sha && simd_check_avx512f_vl();
 }
 
 static bool simd_check_avx2_vaes(void)
@@ -189,13 +194,13 @@ static bool simd_check_avx2_vaes(void)
 
 static bool simd_check_avx512bw_vaes(void)
 {
-    return cpu_has_aesni && cpu_has_vaes && cpu_has_avx512bw;
+    return cpu_has_aesni && cpu_has_vaes && simd_check_avx512bw();
 }
 
 static bool simd_check_avx512bw_vaes_vl(void)
 {
     return cpu_has_aesni && cpu_has_vaes &&
-           cpu_has_avx512bw && cpu_has_avx512vl;
+           simd_check_avx512bw_vl();
 }
 
 static bool simd_check_avx2_vpclmulqdq(void)
@@ -205,22 +210,22 @@ static bool simd_check_avx2_vpclmulqdq(v
 
 static bool simd_check_avx512bw_vpclmulqdq(void)
 {
-    return cpu_has_vpclmulqdq && cpu_has_avx512bw;
+    return cpu_has_vpclmulqdq && simd_check_avx512bw();
 }
 
 static bool simd_check_avx512bw_vpclmulqdq_vl(void)
 {
-    return cpu_has_vpclmulqdq && cpu_has_avx512bw && cpu_has_avx512vl;
+    return cpu_has_vpclmulqdq && simd_check_avx512bw_vl();
 }
 
 static bool simd_check_avx512vbmi2_vpclmulqdq(void)
 {
-    return cpu_has_avx512_vbmi2 && simd_check_avx512bw_vpclmulqdq();
+    return simd_check_avx512vbmi2() && simd_check_avx512bw_vpclmulqdq();
 }
 
 static bool simd_check_avx512vbmi2_vpclmulqdq_vl(void)
 {
-    return cpu_has_avx512_vbmi2 && simd_check_avx512bw_vpclmulqdq_vl();
+    return simd_check_avx512vbmi2() && simd_check_avx512bw_vpclmulqdq_vl();
 }
 
 static bool simd_check_sse2_gf(void)
@@ -235,12 +240,17 @@ static bool simd_check_avx2_gf(void)
 
 static bool simd_check_avx512bw_gf(void)
 {
-    return cpu_has_gfni && cpu_has_avx512bw;
+    return cpu_has_gfni && simd_check_avx512bw();
 }
 
 static bool simd_check_avx512bw_gf_vl(void)
 {
-    return cpu_has_gfni && cpu_has_avx512vl;
+    return cpu_has_gfni && simd_check_avx512bw_vl();
+}
+
+static bool simd_check_avx512vnni(void)
+{
+    return cpu_has_avx512_vnni;
 }
 
 static bool simd_check_avx512fp16(void)
@@ -3195,7 +3205,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing {evex} vmovq %xmm1,32(%edx)...");
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(evex_vmovq_to_mem);
 
@@ -3219,7 +3229,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing {evex} vmovq 32(%edx),%xmm0...");
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(evex_vmovq_from_mem);
 
@@ -3342,7 +3352,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing vmovdqu32 %zmm2,(%ecx){%k1}...");
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(vmovdqu32_to_mem);
 
@@ -3372,7 +3382,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing vmovdqu32 64(%edx),%zmm2{%k2}...");
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(vmovdqu32_from_mem);
 
@@ -3397,7 +3407,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing vmovdqu16 %zmm3,(%ecx){%k1}...");
-    if ( stack_exec && cpu_has_avx512bw )
+    if ( stack_exec && simd_check_avx512bw() )
     {
         decl_insn(vmovdqu16_to_mem);
 
@@ -3429,7 +3439,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing vmovdqu16 64(%edx),%zmm3{%k2}...");
-    if ( stack_exec && cpu_has_avx512bw )
+    if ( stack_exec && simd_check_avx512bw() )
     {
         decl_insn(vmovdqu16_from_mem);
 
@@ -3557,7 +3567,7 @@ int main(int argc, char **argv)
     printf("%-40s", "Testing vmovsd %xmm5,16(%ecx){%k3}...");
     memset(res, 0x88, 128);
     memset(res + 20, 0x77, 8);
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(vmovsd_masked_to_mem);
 
@@ -3592,7 +3602,7 @@ int main(int argc, char **argv)
     }
 
     printf("%-40s", "Testing vmovaps (%edx),%zmm7{%k3}{z}...");
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(vmovaps_masked_from_mem);
 
@@ -3775,7 +3785,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing {evex} vmovd %xmm3,32(%ecx)...");
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(evex_vmovd_to_mem);
 
@@ -3800,7 +3810,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing {evex} vmovd 32(%ecx),%xmm4...");
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(evex_vmovd_from_mem);
 
@@ -3990,7 +4000,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing {evex} vmovd %xmm2,%ebx...");
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(evex_vmovd_to_reg);
 
@@ -4016,7 +4026,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing {evex} vmovd %ebx,%xmm1...");
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(evex_vmovd_from_reg);
 
@@ -4118,7 +4128,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing {evex} vmovq %xmm11,32(%ecx)...");
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(evex_vmovq_to_mem2);
 
@@ -4208,7 +4218,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing vmovq %xmm22,%rbx...");
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(evex_vmovq_to_reg);
 
@@ -4401,7 +4411,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing vmovntdqa 64(%ecx),%zmm4...");
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(evex_vmovntdqa);
 
@@ -4997,7 +5007,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing vcvtph2ps 32(%ecx),%zmm7{%k4}...");
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(evex_vcvtph2ps);
         decl_insn(evex_vcvtps2ph);
@@ -5040,7 +5050,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing vfixupimmpd $0,8(%edx){1to8},%zmm3,%zmm4...");
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(vfixupimmpd);
         static const struct {
@@ -5079,7 +5089,7 @@ int main(int argc, char **argv)
 
 
     printf("%-40s", "Testing vfpclasspsz $0x46,64(%edx),%k2...");
-    if ( stack_exec && cpu_has_avx512dq )
+    if ( stack_exec && simd_check_avx512dq() )
     {
         decl_insn(vfpclassps);
 
@@ -5111,7 +5121,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing vfpclassphz $0x46,128(%ecx),%k3...");
-    if ( stack_exec && cpu_has_avx512_fp16 )
+    if ( stack_exec && simd_check_avx512fp16() )
     {
         decl_insn(vfpclassph);
 
@@ -5154,7 +5164,7 @@ int main(int argc, char **argv)
      * on the mapping boundaries) that elements controlled by clear mask
      * bits don't get accessed.
      */
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(vpcompressd);
         decl_insn(vpcompressq);
@@ -5256,7 +5266,7 @@ int main(int argc, char **argv)
     }
 
 #if __GNUC__ > 7 /* can't check for __AVX512VBMI2__ here */
-    if ( stack_exec && cpu_has_avx512_vbmi2 )
+    if ( stack_exec && simd_check_avx512vbmi2() )
     {
         decl_insn(vpcompressb);
         decl_insn(vpcompressw);
@@ -5444,7 +5454,7 @@ int main(int argc, char **argv)
     }
 
     printf("%-40s", "Testing vpdpwssd (%ecx),%{y,z}mmA,%{y,z}mmB...");
-    if ( stack_exec && cpu_has_avx512_vnni && cpu_has_avx_vnni )
+    if ( stack_exec && simd_check_avx512vnni() && cpu_has_avx_vnni )
     {
         /* Do the same operation two ways and compare the results. */
         decl_insn(vpdpwssd_vex1);
@@ -5499,7 +5509,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing vmovsh 8(%ecx),%xmm5...");
-    if ( stack_exec && cpu_has_avx512_fp16 )
+    if ( stack_exec && simd_check_avx512fp16() )
     {
         decl_insn(vmovsh_from_mem);
         decl_insn(vmovw_to_gpr);


