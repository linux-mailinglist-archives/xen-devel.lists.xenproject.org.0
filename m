Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E28782B19C
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 16:20:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666364.1036955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNwrJ-0003aE-9G; Thu, 11 Jan 2024 15:20:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666364.1036955; Thu, 11 Jan 2024 15:20:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNwrJ-0003XO-6W; Thu, 11 Jan 2024 15:20:41 +0000
Received: by outflank-mailman (input) for mailman id 666364;
 Thu, 11 Jan 2024 15:20:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YFj+=IV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rNwrI-0003X4-18
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 15:20:40 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f9373f9f-b094-11ee-9b0f-b553b5be7939;
 Thu, 11 Jan 2024 16:20:37 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40e5f615a32so7137355e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jan 2024 07:20:37 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 fk10-20020a05600c0cca00b0040e5a0ebabesm4245126wmb.21.2024.01.11.07.20.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jan 2024 07:20:37 -0800 (PST)
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
X-Inumbo-ID: f9373f9f-b094-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704986437; x=1705591237; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RMM3D0iEFifomsZgLJKbjqpOdTn//wfnRPE6nPynBks=;
        b=ZjCqVdCVW9Y0NCK5uhZaiYcB3jcu+w1z5vsmKqoIhJtjuzNDm13fFkPfmr4Vp1l+ej
         U1Yi81UhCtbKIyk/suJe21tSh6Krqcowuq6v4jJ7uUDB7Iy3xDYinA65EVnYpUIv0SIw
         eVSmCfhDPKFedjS8aIDg3wypbH9oU46BJnGD6AIlxhX0cwswhdA+JAwPcpIeeip+r7+0
         1fXrhDHXF53t0ENjvmTq5ZytxVHDU9EEktuXAeyYNTH2wa21lXtCpo0dQCCeh4ImqSCT
         3+I+fufzGzXJkawkVozqgb1qmTbMxUsc/bTx+0mrN/BJWdL9CIq4/O+vCpIfuWuLw1Z0
         MM5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704986437; x=1705591237;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RMM3D0iEFifomsZgLJKbjqpOdTn//wfnRPE6nPynBks=;
        b=wrOvu1capuN9WVHWupPcN7Z35r56Qwt1M77cVHzB3R6UrbImUwQryO1UgbYaUY85fm
         HXBffWTINXW5r2eOXjeiAYQCPN82SqD74Ih4GGuF8W2+gp2XLm+uwrFFCa1cJadxU6VH
         C0dqyzAumFp8vQ4IcSpb1s+H2QN8lvilpEtKcK+d3pn6uR1xClSiF1laHqnJBzOGXib9
         cOFacBNRkeSqcTM4reY2tiAs8jzreybozWBdkBwJXCdO7VNm5EgLNYeNOvuwEDlq8qvl
         Y9kwfAnlw0Cc5cx4gvprJMzu5h4s5YeelfZtdh8ld7N1Y6yPlly+AqClbh4iYOLBw/VL
         vHKQ==
X-Gm-Message-State: AOJu0YxXLDl66I7bGjIdT0P1J29ZiOua5DfhQcdddmZpoe/RMmLF7bsU
	/rgF5k4ETsOD62X5+j4o1FiddEcrgsXZhPl/rEaI6colhA==
X-Google-Smtp-Source: AGHT+IGGByElgH0jNuAB7fFfGGmG5yjZY0ZWUGSc2An3w7p1TrZIoaZOJF72zc85fR9kpZVpTRDpEQ==
X-Received: by 2002:a05:600c:444b:b0:40d:8658:8c0d with SMTP id v11-20020a05600c444b00b0040d86588c0dmr301215wmn.3.1704986437380;
        Thu, 11 Jan 2024 07:20:37 -0800 (PST)
Message-ID: <f4bb147f-2ba4-4f75-a7a3-87d05d9d3450@suse.com>
Date: Thu, 11 Jan 2024 16:20:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 5/8] x86emul/test: use simd_check_avx512*() in main()
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

In preparation for having these also cover AVX10, use the helper
functions in preference of open-coded cpu_has_avx512* for those features
that AVX10 includes. Introduce a couple further helper functions where
they weren't previously needed.

Note that this way simd_check_avx512f_sha_vl() gains an AVX512F check
(which is likely benign) and simd_check_avx512bw_gf_vl() gains an
AVX512BW check (which was clearly missing). 

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -173,6 +173,11 @@ static bool simd_check_avx512vbmi_vl(voi
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
@@ -185,7 +190,7 @@ static bool simd_check_avx_sha(void)
 
 static bool simd_check_avx512f_sha_vl(void)
 {
-    return cpu_has_sha && cpu_has_avx512vl;
+    return cpu_has_sha && simd_check_avx512f_vl();
 }
 
 static bool simd_check_avx2_vaes(void)
@@ -195,13 +200,13 @@ static bool simd_check_avx2_vaes(void)
 
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
@@ -211,22 +216,22 @@ static bool simd_check_avx2_vpclmulqdq(v
 
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
@@ -241,12 +246,17 @@ static bool simd_check_avx2_gf(void)
 
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
@@ -3116,7 +3126,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing {evex} vmovq %xmm1,32(%edx)...");
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(evex_vmovq_to_mem);
 
@@ -3140,7 +3150,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing {evex} vmovq 32(%edx),%xmm0...");
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(evex_vmovq_from_mem);
 
@@ -3263,7 +3273,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing vmovdqu32 %zmm2,(%ecx){%k1}...");
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(vmovdqu32_to_mem);
 
@@ -3293,7 +3303,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing vmovdqu32 64(%edx),%zmm2{%k2}...");
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(vmovdqu32_from_mem);
 
@@ -3318,7 +3328,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing vmovdqu16 %zmm3,(%ecx){%k1}...");
-    if ( stack_exec && cpu_has_avx512bw )
+    if ( stack_exec && simd_check_avx512bw() )
     {
         decl_insn(vmovdqu16_to_mem);
 
@@ -3350,7 +3360,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing vmovdqu16 64(%edx),%zmm3{%k2}...");
-    if ( stack_exec && cpu_has_avx512bw )
+    if ( stack_exec && simd_check_avx512bw() )
     {
         decl_insn(vmovdqu16_from_mem);
 
@@ -3478,7 +3488,7 @@ int main(int argc, char **argv)
     printf("%-40s", "Testing vmovsd %xmm5,16(%ecx){%k3}...");
     memset(res, 0x88, 128);
     memset(res + 20, 0x77, 8);
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(vmovsd_masked_to_mem);
 
@@ -3513,7 +3523,7 @@ int main(int argc, char **argv)
     }
 
     printf("%-40s", "Testing vmovaps (%edx),%zmm7{%k3}{z}...");
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(vmovaps_masked_from_mem);
 
@@ -3696,7 +3706,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing {evex} vmovd %xmm3,32(%ecx)...");
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(evex_vmovd_to_mem);
 
@@ -3721,7 +3731,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing {evex} vmovd 32(%ecx),%xmm4...");
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(evex_vmovd_from_mem);
 
@@ -3911,7 +3921,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing {evex} vmovd %xmm2,%ebx...");
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(evex_vmovd_to_reg);
 
@@ -3937,7 +3947,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing {evex} vmovd %ebx,%xmm1...");
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(evex_vmovd_from_reg);
 
@@ -4039,7 +4049,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing {evex} vmovq %xmm11,32(%ecx)...");
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(evex_vmovq_to_mem2);
 
@@ -4129,7 +4139,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing vmovq %xmm22,%rbx...");
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(evex_vmovq_to_reg);
 
@@ -4322,7 +4332,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing vmovntdqa 64(%ecx),%zmm4...");
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(evex_vmovntdqa);
 
@@ -4918,7 +4928,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing vcvtph2ps 32(%ecx),%zmm7{%k4}...");
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(evex_vcvtph2ps);
         decl_insn(evex_vcvtps2ph);
@@ -4961,7 +4971,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing vfixupimmpd $0,8(%edx){1to8},%zmm3,%zmm4...");
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(vfixupimmpd);
         static const struct {
@@ -5000,7 +5010,7 @@ int main(int argc, char **argv)
 
 
     printf("%-40s", "Testing vfpclasspsz $0x46,64(%edx),%k2...");
-    if ( stack_exec && cpu_has_avx512dq )
+    if ( stack_exec && simd_check_avx512dq() )
     {
         decl_insn(vfpclassps);
 
@@ -5032,7 +5042,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing vfpclassphz $0x46,128(%ecx),%k3...");
-    if ( stack_exec && cpu_has_avx512_fp16 )
+    if ( stack_exec && simd_check_avx512fp16() )
     {
         decl_insn(vfpclassph);
 
@@ -5075,7 +5085,7 @@ int main(int argc, char **argv)
      * on the mapping boundaries) that elements controlled by clear mask
      * bits don't get accessed.
      */
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(vpcompressd);
         decl_insn(vpcompressq);
@@ -5177,7 +5187,7 @@ int main(int argc, char **argv)
     }
 
 #if __GNUC__ > 7 /* can't check for __AVX512VBMI2__ here */
-    if ( stack_exec && cpu_has_avx512_vbmi2 )
+    if ( stack_exec && simd_check_avx512vbmi2() )
     {
         decl_insn(vpcompressb);
         decl_insn(vpcompressw);
@@ -5440,7 +5450,7 @@ int main(int argc, char **argv)
     }
 
     printf("%-40s", "Testing vpdpwssd (%ecx),%{y,z}mmA,%{y,z}mmB...");
-    if ( stack_exec && cpu_has_avx512_vnni && cpu_has_avx_vnni )
+    if ( stack_exec && simd_check_avx512vnni() && cpu_has_avx_vnni )
     {
         /* Do the same operation two ways and compare the results. */
         decl_insn(vpdpwssd_vex1);
@@ -5495,7 +5505,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing vmovsh 8(%ecx),%xmm5...");
-    if ( stack_exec && cpu_has_avx512_fp16 )
+    if ( stack_exec && simd_check_avx512fp16() )
     {
         decl_insn(vmovsh_from_mem);
         decl_insn(vmovw_to_gpr);


