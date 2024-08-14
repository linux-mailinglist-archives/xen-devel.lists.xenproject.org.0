Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 813C6951705
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2024 10:53:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776941.1187148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1se9ka-00063w-Dk; Wed, 14 Aug 2024 08:53:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776941.1187148; Wed, 14 Aug 2024 08:53:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1se9ka-00061Q-9x; Wed, 14 Aug 2024 08:53:00 +0000
Received: by outflank-mailman (input) for mailman id 776941;
 Wed, 14 Aug 2024 08:52:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NhoJ=PN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1se9kX-0004KL-SZ
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2024 08:52:57 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99f0b1bc-5a1a-11ef-a505-bb4a2ccca743;
 Wed, 14 Aug 2024 10:52:57 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5ba482282d3so7908450a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 14 Aug 2024 01:52:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bd187f3306sm3671889a12.17.2024.08.14.01.52.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Aug 2024 01:52:56 -0700 (PDT)
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
X-Inumbo-ID: 99f0b1bc-5a1a-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723625576; x=1724230376; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZnNv/Ji9QwDXDDtnpehfNwAdKNqWREph7EusWegGIOY=;
        b=VFsOG1NfkhtDRjWb2Hdhu3yz8v6KkNbvoWwZxwOQjQ7LbC/uOEX0hcEBEWclvBCBZB
         QPVdRyUH6SO7PQ2fCpZvEsj0BHeqWPKhWRnJACAz/3cDEAdDm0Y5Cw1zcGSj6cGk5dsE
         G1QpqQhHxtT+OQjl1fTDvdzBL2KbFc6FkEGArD4NCl7sOuA3O9JGuGv0/e64uZPTcyLl
         HU7hOjsoLrqnsRMX2F/9FbIWma5RIevaGFpM2P+HfDL/2/7oXBwWM5oxXsG2xNfhSkH1
         ky9aT1fgIqi9zWb/4QusyGwRExDgQOaWo9iB2eT5x48A5vAKlKsNtp5jT8MpY/VeE0dV
         YaYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723625576; x=1724230376;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZnNv/Ji9QwDXDDtnpehfNwAdKNqWREph7EusWegGIOY=;
        b=SzWPpoFvnAyUEcUXBpUFpQ87wS6HkxqmvrnRSd41ZPLvA1XX/E5HoErdeycJEHA9TZ
         mHNtXn9APyxq7AvA60ryonW2RS/hxGH1IMDy3g0etJLt6hjwSgcCIDugjHTJxkZWwe/0
         0CZ2SB9vbv7i7qUt6FpPeDm1+ubcxqgV94cChly11h0roBEtyRtVCXxnf4K9Jk5X75Py
         HLAAFfASJWnncsr43rCWckCVHzzQT7mOc2JnnVuPmxL3/k+AFyVzh4LVGuqnNvqXu9MX
         gM0vlKMSrdf+MNbwouf1zYdfwJHuYH+oQBZ2RHTJua0i9Y8rvoNVy3tVZrvmlW35ZVFT
         eaCw==
X-Gm-Message-State: AOJu0Yy/MbFTILtTYAD+R9Y1tqhxWNmGbASD3RgzOTdpM8y5e/ZyVgGs
	9dCSnWtH28sRoG/pvZBmeKHaNpRcac3hIwT4tlZ2+S/fKsCVt33y4vGCpZzH2DCl0B5HA2CID5Y
	=
X-Google-Smtp-Source: AGHT+IFSX9nfFHp2Nmtb5zXDICfD7E8j/0oPb7tJYbK+SldtJqquczrLewxcZ48Qwnec6LtqNgJiog==
X-Received: by 2002:a05:6402:2811:b0:5a2:68a2:ae57 with SMTP id 4fb4d7f45d1cf-5bea1cb2b95mr1220347a12.31.1723625576496;
        Wed, 14 Aug 2024 01:52:56 -0700 (PDT)
Message-ID: <e173ccd6-7bd2-4bea-a4af-bc2b4d442c0c@suse.com>
Date: Wed, 14 Aug 2024 10:52:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 5/9] x86emul/test: use simd_check_avx512*() in main()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <bcfea345-57c1-43d9-82b3-240b685486cc@suse.com>
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
In-Reply-To: <bcfea345-57c1-43d9-82b3-240b685486cc@suse.com>
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
@@ -2800,7 +2810,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing {evex} vmovq %xmm1,32(%edx)...");
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(evex_vmovq_to_mem);
 
@@ -2824,7 +2834,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing {evex} vmovq 32(%edx),%xmm0...");
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(evex_vmovq_from_mem);
 
@@ -2947,7 +2957,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing vmovdqu32 %zmm2,(%ecx){%k1}...");
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(vmovdqu32_to_mem);
 
@@ -2977,7 +2987,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing vmovdqu32 64(%edx),%zmm2{%k2}...");
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(vmovdqu32_from_mem);
 
@@ -3002,7 +3012,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing vmovdqu16 %zmm3,(%ecx){%k1}...");
-    if ( stack_exec && cpu_has_avx512bw )
+    if ( stack_exec && simd_check_avx512bw() )
     {
         decl_insn(vmovdqu16_to_mem);
 
@@ -3034,7 +3044,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing vmovdqu16 64(%edx),%zmm3{%k2}...");
-    if ( stack_exec && cpu_has_avx512bw )
+    if ( stack_exec && simd_check_avx512bw() )
     {
         decl_insn(vmovdqu16_from_mem);
 
@@ -3162,7 +3172,7 @@ int main(int argc, char **argv)
     printf("%-40s", "Testing vmovsd %xmm5,16(%ecx){%k3}...");
     memset(res, 0x88, 128);
     memset(res + 20, 0x77, 8);
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(vmovsd_masked_to_mem);
 
@@ -3197,7 +3207,7 @@ int main(int argc, char **argv)
     }
 
     printf("%-40s", "Testing vmovaps (%edx),%zmm7{%k3}{z}...");
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(vmovaps_masked_from_mem);
 
@@ -3380,7 +3390,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing {evex} vmovd %xmm3,32(%ecx)...");
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(evex_vmovd_to_mem);
 
@@ -3405,7 +3415,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing {evex} vmovd 32(%ecx),%xmm4...");
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(evex_vmovd_from_mem);
 
@@ -3595,7 +3605,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing {evex} vmovd %xmm2,%ebx...");
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(evex_vmovd_to_reg);
 
@@ -3621,7 +3631,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing {evex} vmovd %ebx,%xmm1...");
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(evex_vmovd_from_reg);
 
@@ -3723,7 +3733,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing {evex} vmovq %xmm11,32(%ecx)...");
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(evex_vmovq_to_mem2);
 
@@ -3813,7 +3823,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing vmovq %xmm22,%rbx...");
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(evex_vmovq_to_reg);
 
@@ -4006,7 +4016,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing vmovntdqa 64(%ecx),%zmm4...");
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(evex_vmovntdqa);
 
@@ -4602,7 +4612,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing vcvtph2ps 32(%ecx),%zmm7{%k4}...");
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(evex_vcvtph2ps);
         decl_insn(evex_vcvtps2ph);
@@ -4645,7 +4655,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing vfixupimmpd $0,8(%edx){1to8},%zmm3,%zmm4...");
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(vfixupimmpd);
         static const struct {
@@ -4684,7 +4694,7 @@ int main(int argc, char **argv)
 
 
     printf("%-40s", "Testing vfpclasspsz $0x46,64(%edx),%k2...");
-    if ( stack_exec && cpu_has_avx512dq )
+    if ( stack_exec && simd_check_avx512dq() )
     {
         decl_insn(vfpclassps);
 
@@ -4716,7 +4726,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing vfpclassphz $0x46,128(%ecx),%k3...");
-    if ( stack_exec && cpu_has_avx512_fp16 )
+    if ( stack_exec && simd_check_avx512fp16() )
     {
         decl_insn(vfpclassph);
 
@@ -4759,7 +4769,7 @@ int main(int argc, char **argv)
      * on the mapping boundaries) that elements controlled by clear mask
      * bits don't get accessed.
      */
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(vpcompressd);
         decl_insn(vpcompressq);
@@ -4861,7 +4871,7 @@ int main(int argc, char **argv)
     }
 
 #if __GNUC__ > 7 /* can't check for __AVX512VBMI2__ here */
-    if ( stack_exec && cpu_has_avx512_vbmi2 )
+    if ( stack_exec && simd_check_avx512vbmi2() )
     {
         decl_insn(vpcompressb);
         decl_insn(vpcompressw);
@@ -5049,7 +5059,7 @@ int main(int argc, char **argv)
     }
 
     printf("%-40s", "Testing vpdpwssd (%ecx),%{y,z}mmA,%{y,z}mmB...");
-    if ( stack_exec && cpu_has_avx512_vnni && cpu_has_avx_vnni )
+    if ( stack_exec && simd_check_avx512vnni() && cpu_has_avx_vnni )
     {
         /* Do the same operation two ways and compare the results. */
         decl_insn(vpdpwssd_vex1);
@@ -5104,7 +5114,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing vmovsh 8(%ecx),%xmm5...");
-    if ( stack_exec && cpu_has_avx512_fp16 )
+    if ( stack_exec && simd_check_avx512fp16() )
     {
         decl_insn(vmovsh_from_mem);
         decl_insn(vmovw_to_gpr);


