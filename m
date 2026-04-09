Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHSFN/q/12mdSQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 17:04:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 528223CC5A0
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 17:04:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1277712.1562845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAqva-0000Xq-9Z; Thu, 09 Apr 2026 15:04:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277712.1562845; Thu, 09 Apr 2026 15:04:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAqva-0000WR-5w; Thu, 09 Apr 2026 15:04:18 +0000
Received: by outflank-mailman (input) for mailman id 1277712;
 Thu, 09 Apr 2026 15:04:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wAqvY-0000Ue-Fm
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 15:04:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAqvX-00EBmu-S3
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 17:04:15 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d7bfe3-2eae-0a2a0a5409dd-0a2a450cc41a-24
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 17:04:15 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d7bfef-f40c-0a2a450c0019-d1558030a9c4-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 17:04:15 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-488b3f8fa2bso12984455e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 08:04:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d538c39bsm1710875e9.14.2026.04.09.08.04.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Apr 2026 08:04:14 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775747055; x=1776351855; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GWE53NAFaxXZ+D0dpPIGZkbsN2k0qydW3rB6bWu53Do=;
        b=N9r8yTQYUGPD+jvpzZsbB083/YGarLKQm4icscPm5xlA0moKBzScU/BVM2QxxA5sjt
         WebiRO4liV8iafaW/Z4tmENLiioGi49HCkm6aD3eIopEHrWLgb/N9ULcg8h25DyV5SRH
         M+SCCxO3iTbLxUdsZ2ATXEEHxWooDtLBg4y2ZVLVsje4NpZYNNBkJXgPv6CR/E1e5i5B
         oLovF9Qk0BxH2R7FR0A6lvE4neH7lqmxZPUnssbXcoFOK3uWOiB9L+3gjXSnqKhvkj3F
         yu8TBaG6duzy/+53c1+buYeJn1sOKbKDoTbsAdd7X5lBIqfDzV7TTsKrlb5+rL41N8Ub
         cA1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775747055; x=1776351855;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GWE53NAFaxXZ+D0dpPIGZkbsN2k0qydW3rB6bWu53Do=;
        b=OBZ0gtUaLWBjJYgME2abCsIHMC3+uS7e/5yV+gXuH2jjxqhP3ZNreZWF1xa8wuUZMh
         FMO6Px53EWH+sPUH2FQtH+qTg6IRJlSLahQAqmbWDTx+aAJhCcL84CKXhT5wP2mlEUt8
         QrnfFAEPB0X7TavuYBIB0TGg8JnYiYDdJ1X6iYk0kwunCCG2MDmt34L9eKbbXGuo7ih8
         XNN4Jjd939tUdEktyDPm9aQBuBWuyY+UFm6TBXBoJCyRlY647OFacyTmmcAyIpv5Aiw8
         CBy/av+eqHgaPAArLEKpP4sTRiWamYOrAkJ8jBZnXz47nQf//SWYaPvX7MKEwxT0Q8EV
         6vuQ==
X-Gm-Message-State: AOJu0YzkRo4obyJIr8oCMWchUsT2/k9uHVV/dXyRyO5dvLOZE+bLTKWE
	bYM43u7EGJdh6lDmnU3+8eRfhBhCb9dsnA/zSzb/pSBpHQLQrk1UDBE1rUT2dn9qq4y01jQtg9I
	ursVNyg==
X-Gm-Gg: AeBDies/ojPIqRUlKclWP5BmbE8IYlKzDpdD5O56uUMq44DDpBkS28tjHywyOFJPTHC
	pnx6dz7X5FZECvr2RpT9Em8tCLWxpNcSHDUJ4dX9G3uO6PBcRrolJ6Dk7ids6X+hxXQyhKF/WIv
	pc8ujMzYmFoR4IAcaRcHfku6uxUGrFOIMzw/AjNih649PUQxHl/oH0VNbcVzA5leGv4R0Vv+HUu
	CokdCGyxN0x93ITa5Ct5rjgubX6E7toCjvzLxOkIVwmi4gdrikbfvzgEeM8/i4qphmrhPJ6QDcH
	PLNpHfkwnxDniuXNRweGK1BJHYIG4zIRFYcavopAGOfAyCeQxUYSC5l8auWUucbqCFEiJeqbKmr
	LwGhKn7kZpYrpu+EpwmG8u6aZvvD5B80hQ4ajF5qmaE00T2fBdphq10omDO0R0n+GcyFV9XmzJd
	rcM3ww0m6CPbDIM8b3ELxIROU6lbTZ9cWS4UUfI2DQHqa3pdiRLgbUocNJAyqH+szecj0RtXhsg
	+57RwUa+DiXLrk=
X-Received: by 2002:a05:600c:c087:b0:485:3c2e:60d5 with SMTP id 5b1f17b1804b1-488cd50f45dmr37248225e9.2.1775747054988;
        Thu, 09 Apr 2026 08:04:14 -0700 (PDT)
Message-ID: <10c2a780-0f19-496b-a88d-5f01371be091@suse.com>
Date: Thu, 9 Apr 2026 17:04:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 04/16] x86emul/test: use simd_check_avx512*() in main()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <1e2ff012-b07a-43be-9ba6-290b38d3c97c@suse.com>
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
In-Reply-To: <1e2ff012-b07a-43be-9ba6-290b38d3c97c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1775747055-81B54A3D-97BFB3F9/0/0
X-purgate-type: clean
X-purgate-size: 10148
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 528223CC5A0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
@@ -3192,7 +3202,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing {evex} vmovq %xmm1,32(%edx)...");
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(evex_vmovq_to_mem);
 
@@ -3216,7 +3226,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing {evex} vmovq 32(%edx),%xmm0...");
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(evex_vmovq_from_mem);
 
@@ -3339,7 +3349,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing vmovdqu32 %zmm2,(%ecx){%k1}...");
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(vmovdqu32_to_mem);
 
@@ -3369,7 +3379,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing vmovdqu32 64(%edx),%zmm2{%k2}...");
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(vmovdqu32_from_mem);
 
@@ -3394,7 +3404,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing vmovdqu16 %zmm3,(%ecx){%k1}...");
-    if ( stack_exec && cpu_has_avx512bw )
+    if ( stack_exec && simd_check_avx512bw() )
     {
         decl_insn(vmovdqu16_to_mem);
 
@@ -3426,7 +3436,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing vmovdqu16 64(%edx),%zmm3{%k2}...");
-    if ( stack_exec && cpu_has_avx512bw )
+    if ( stack_exec && simd_check_avx512bw() )
     {
         decl_insn(vmovdqu16_from_mem);
 
@@ -3554,7 +3564,7 @@ int main(int argc, char **argv)
     printf("%-40s", "Testing vmovsd %xmm5,16(%ecx){%k3}...");
     memset(res, 0x88, 128);
     memset(res + 20, 0x77, 8);
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(vmovsd_masked_to_mem);
 
@@ -3589,7 +3599,7 @@ int main(int argc, char **argv)
     }
 
     printf("%-40s", "Testing vmovaps (%edx),%zmm7{%k3}{z}...");
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(vmovaps_masked_from_mem);
 
@@ -3772,7 +3782,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing {evex} vmovd %xmm3,32(%ecx)...");
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(evex_vmovd_to_mem);
 
@@ -3797,7 +3807,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing {evex} vmovd 32(%ecx),%xmm4...");
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(evex_vmovd_from_mem);
 
@@ -3987,7 +3997,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing {evex} vmovd %xmm2,%ebx...");
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(evex_vmovd_to_reg);
 
@@ -4013,7 +4023,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing {evex} vmovd %ebx,%xmm1...");
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(evex_vmovd_from_reg);
 
@@ -4115,7 +4125,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing {evex} vmovq %xmm11,32(%ecx)...");
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(evex_vmovq_to_mem2);
 
@@ -4205,7 +4215,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing vmovq %xmm22,%rbx...");
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(evex_vmovq_to_reg);
 
@@ -4398,7 +4408,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing vmovntdqa 64(%ecx),%zmm4...");
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(evex_vmovntdqa);
 
@@ -4994,7 +5004,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing vcvtph2ps 32(%ecx),%zmm7{%k4}...");
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(evex_vcvtph2ps);
         decl_insn(evex_vcvtps2ph);
@@ -5037,7 +5047,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing vfixupimmpd $0,8(%edx){1to8},%zmm3,%zmm4...");
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(vfixupimmpd);
         static const struct {
@@ -5076,7 +5086,7 @@ int main(int argc, char **argv)
 
 
     printf("%-40s", "Testing vfpclasspsz $0x46,64(%edx),%k2...");
-    if ( stack_exec && cpu_has_avx512dq )
+    if ( stack_exec && simd_check_avx512dq() )
     {
         decl_insn(vfpclassps);
 
@@ -5108,7 +5118,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing vfpclassphz $0x46,128(%ecx),%k3...");
-    if ( stack_exec && cpu_has_avx512_fp16 )
+    if ( stack_exec && simd_check_avx512fp16() )
     {
         decl_insn(vfpclassph);
 
@@ -5151,7 +5161,7 @@ int main(int argc, char **argv)
      * on the mapping boundaries) that elements controlled by clear mask
      * bits don't get accessed.
      */
-    if ( stack_exec && cpu_has_avx512f )
+    if ( stack_exec && simd_check_avx512f() )
     {
         decl_insn(vpcompressd);
         decl_insn(vpcompressq);
@@ -5253,7 +5263,7 @@ int main(int argc, char **argv)
     }
 
 #if __GNUC__ > 7 /* can't check for __AVX512VBMI2__ here */
-    if ( stack_exec && cpu_has_avx512_vbmi2 )
+    if ( stack_exec && simd_check_avx512vbmi2() )
     {
         decl_insn(vpcompressb);
         decl_insn(vpcompressw);
@@ -5441,7 +5451,7 @@ int main(int argc, char **argv)
     }
 
     printf("%-40s", "Testing vpdpwssd (%ecx),%{y,z}mmA,%{y,z}mmB...");
-    if ( stack_exec && cpu_has_avx512_vnni && cpu_has_avx_vnni )
+    if ( stack_exec && simd_check_avx512vnni() && cpu_has_avx_vnni )
     {
         /* Do the same operation two ways and compare the results. */
         decl_insn(vpdpwssd_vex1);
@@ -5496,7 +5506,7 @@ int main(int argc, char **argv)
         printf("skipped\n");
 
     printf("%-40s", "Testing vmovsh 8(%ecx),%xmm5...");
-    if ( stack_exec && cpu_has_avx512_fp16 )
+    if ( stack_exec && simd_check_avx512fp16() )
     {
         decl_insn(vmovsh_from_mem);
         decl_insn(vmovw_to_gpr);


