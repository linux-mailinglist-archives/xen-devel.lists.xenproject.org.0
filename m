Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8385F9ECA2B
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 11:19:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.854344.1267578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLJnr-0007nl-6P; Wed, 11 Dec 2024 10:18:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 854344.1267578; Wed, 11 Dec 2024 10:18:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLJnr-0007lM-3O; Wed, 11 Dec 2024 10:18:47 +0000
Received: by outflank-mailman (input) for mailman id 854344;
 Wed, 11 Dec 2024 10:18:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2HaM=TE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tLJnp-0006nP-UQ
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 10:18:45 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d895a98-b7a9-11ef-a0d5-8be0dac302b0;
 Wed, 11 Dec 2024 11:18:45 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-38634c35129so3090165f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Dec 2024 02:18:45 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ef4600d14fsm11233196a91.45.2024.12.11.02.18.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 02:18:44 -0800 (PST)
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
X-Inumbo-ID: 4d895a98-b7a9-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733912324; x=1734517124; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JX8A7wpZkzT/ToT7H0QDSiHEuQp9oj/HteeDtBUydIE=;
        b=OsaMjN7iw79ezQKnbqjjzCqfhoFbFBSNtJXk/lOwffLtnwqHMM5rGnUX9F11nxPGKg
         CPTLiv+BQESLFSqAFm84jBAEd2tdH69ncu+vcqeu7sFDsJHafV+XdpwEHJITsSchUy9n
         MGvzn+IWZ1uP2RFJD4O4lX6zU+zjadOIauA32cCbKqDKjeYWIaTnPnXwjTydxcA1ftJ4
         TX4f1hQJBvZN3978sRkafjCWfEbu0zfJCl7jRR6WlG5xoyww4W2jvfrIg2HBteuALcxJ
         JhamPiIWBBnrpsXop5/g9p8xk7lVJUHo0ff56fC60cYV/JrtJgGPRfYriupb4XhN+kbg
         fOdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733912324; x=1734517124;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JX8A7wpZkzT/ToT7H0QDSiHEuQp9oj/HteeDtBUydIE=;
        b=UO6VAwPAXgbLPd46jAf565kcxu7P05pA3o5OZ2g0emmFgzE9shEPTlMUpe37L1fr8c
         aMSqn7Bj10Imq5Mli443+idokWtcYjMBBBss7N+5DH62mXKse0J8uzJxId6f/KChbd9o
         HqNzFc62OTut5Gc7pM+0WVrYnVlkMF8dkupvJ/ltERqCncyv8mXuhfPikNHsvkmAb3BI
         BWlM4+Ei2cbYusRAB4ChFBc8mWNU7JjvVgu25py/zbAxfE3dmD73URyatmq64xzzGjB0
         dvScgHilAhE/dhbwSjWtefmREXoAhr8A61Fsxnd+oxXiEGp2Ey4GjxkvL4gqlIIksizt
         8ikw==
X-Gm-Message-State: AOJu0Yxw8aNnoDlN5dTAKLCII1OoII0YaQOU+zf40eWW5iUUJxbcymXc
	7nyqQze2cmMQXelY1L2vDHHr3oHnx+gVRoWzjM/q781bOlAtY62IHMe7pDybkRJ98upR7aMeQjs
	=
X-Gm-Gg: ASbGncvTpwczlO4NuNjXTByjqQyiRjr4lDfg1OZtFpBA8o3rIaRoJTtuHG8dlgQNErq
	dx59R0qp2qJGhzL2xuE3vMY8sU7uJUTyjo1gQXzNkeRMxjX136J+2CFGS9yrTssbRVlxImv2v32
	BSPi7yMR91x6qLXbX1SZA0MvLiy/ZpmeRDUvLS2VTUnbrXWgXZwHY6aB86X5uhHigilONUWQ4we
	ANCtyX1BRjSUD+tcHf7rpzb1abm4sWD6s8b3GNNJFa5KTUpDS0SxPRQrJUUhOlXqEMPdhjX/1J2
	U4aklf74e1qE9No/XdV7usDU1JiGDHnaK1WH/vw=
X-Google-Smtp-Source: AGHT+IE2HAta4jh6z8md2+tzdwRYLSsgaYg8DUe98j9Af2So7N5jx9qFg0/VCxv+aOXkHhKxHecw2A==
X-Received: by 2002:a5d:5846:0:b0:385:df4e:3645 with SMTP id ffacd0b85a97d-3864cecfaefmr1852440f8f.50.1733912324538;
        Wed, 11 Dec 2024 02:18:44 -0800 (PST)
Message-ID: <953301b9-4cd6-4742-9486-bf31121cb3ef@suse.com>
Date: Wed, 11 Dec 2024 11:18:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 10/16] x86emul: support AVX10.2 media insns
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

These are all very similar to various existing insns.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
SDE: ???
---
v3: New.

--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -717,6 +717,20 @@ static const struct test avx10_2_all[] =
     INSN(comxsd,           f3,   0f, 2f,    el,    q, el),
     INSN(comxsh,           f2, map5, 2f,    el, fp16, el),
     INSN(comxss,           f2,   0f, 2f,    el,    d, el),
+    INSN(dpphps,             , 0f38, 52,    vl,    d, vl),
+    INSN(mpsadbw,          f3, 0f3a, 42,    vl, d_nb, vl),
+    INSN(pdpbssd,          f2, 0f38, 50,    vl,    d, vl),
+    INSN(pdpbssds,         f2, 0f38, 51,    vl,    d, vl),
+    INSN(pdpbsud,          f3, 0f38, 50,    vl,    d, vl),
+    INSN(pdpbsuds,         f3, 0f38, 51,    vl,    d, vl),
+    INSN(pdpbuud,            , 0f38, 50,    vl,    d, vl),
+    INSN(pdpbuuds,           , 0f38, 51,    vl,    d, vl),
+    INSN(pdpwsud,          f3, 0f38, d2,    vl,    d, vl),
+    INSN(pdpwsuds,         f3, 0f38, d3,    vl,    d, vl),
+    INSN(pdpwusd,          66, 0f38, d2,    vl,    d, vl),
+    INSN(pdpwusds,         66, 0f38, d3,    vl,    d, vl),
+    INSN(pdpwuud,            , 0f38, d2,    vl,    d, vl),
+    INSN(pdpwuuds,           , 0f38, d3,    vl,    d, vl),
     INSN(ucomxsd,          f3,   0f, 2e,    el,    q, el),
     INSN(ucomxsh,          f2, map5, 2e,    el, fp16, el),
     INSN(ucomxss,          f2,   0f, 2e,    el,    d, el),
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -1927,8 +1927,15 @@ static const struct evex {
     { { 0x4d }, 2, T, R, pfx_66, Wn, LIG }, /* vrcp14s{s,d} */
     { { 0x4e }, 2, T, R, pfx_66, Wn, Ln }, /* vrsqrt14p{s,d} */
     { { 0x4f }, 2, T, R, pfx_66, Wn, LIG }, /* vrsqrt14s{s,d} */
+    { { 0x50 }, 2, T, R, pfx_no, W0, Ln }, /* vpdpbuud */
     { { 0x50 }, 2, T, R, pfx_66, W0, Ln }, /* vpdpbusd */
+    { { 0x50 }, 2, T, R, pfx_f3, W0, Ln }, /* vpdpbsud */
+    { { 0x50 }, 2, T, R, pfx_f2, W0, Ln }, /* vpdpbssd */
+    { { 0x51 }, 2, T, R, pfx_no, W0, Ln }, /* vpdpbuuds */
     { { 0x51 }, 2, T, R, pfx_66, W0, Ln }, /* vpdpbusds */
+    { { 0x51 }, 2, T, R, pfx_f3, W0, Ln }, /* vpdpbsuds */
+    { { 0x51 }, 2, T, R, pfx_f2, W0, Ln }, /* vpdpbssds */
+    { { 0x52 }, 2, T, R, pfx_no, W0, Ln }, /* vdpphps */
     { { 0x52 }, 2, T, R, pfx_66, W0, Ln }, /* vpdpwssd */
     { { 0x52 }, 2, T, R, pfx_f3, W0, Ln }, /* vdpbf16ps */
     { { 0x52 }, 2, T, R, pfx_f2, W0, L2 }, /* vp4dpwssd */
@@ -2029,6 +2036,12 @@ static const struct evex {
     { { 0xcc }, 2, T, R, pfx_66, Wn, L2 }, /* vrsqrt28p{s,d} */
     { { 0xcd }, 2, T, R, pfx_66, Wn, LIG }, /* vrsqrt28s{s,d} */
     { { 0xcf }, 2, T, R, pfx_66, W0, Ln }, /* vgf2p8mulb */
+    { { 0xd2 }, 2, T, R, pfx_no, W0, Ln }, /* vpdpwuud */
+    { { 0xd2 }, 2, T, R, pfx_66, W0, Ln }, /* vpdpwusd */
+    { { 0xd2 }, 2, T, R, pfx_f3, W0, Ln }, /* vpdpwsud */
+    { { 0xd3 }, 2, T, R, pfx_no, W0, Ln }, /* vpdpwuuds */
+    { { 0xd3 }, 2, T, R, pfx_66, W0, Ln }, /* vpdpwusds */
+    { { 0xd3 }, 2, T, R, pfx_f3, W0, Ln }, /* vpdpwsuds */
     { { 0xdc }, 2, T, R, pfx_66, WIG, Ln }, /* vaesenc */
     { { 0xdd }, 2, T, R, pfx_66, WIG, Ln }, /* vaesenclast */
     { { 0xde }, 2, T, R, pfx_66, WIG, Ln }, /* vaesdec */
@@ -2073,6 +2086,7 @@ static const struct evex {
     { { 0x3e }, 3, T, R, pfx_66, Wn, Ln }, /* vpcmpu{b,w} */
     { { 0x3f }, 3, T, R, pfx_66, Wn, Ln }, /* vpcmp{b,w} */
     { { 0x42 }, 3, T, R, pfx_66, W0, Ln }, /* vdbpsadbw */
+    { { 0x42 }, 3, T, R, pfx_f3, W0, Ln }, /* vmpsadbw */
     { { 0x43 }, 3, T, R, pfx_66, Wn, L1|L2 }, /* vshufi{32x4,64x2} */
     { { 0x44 }, 3, T, R, pfx_66, WIG, Ln }, /* vpclmulqdq */
     { { 0x50 }, 3, T, R, pfx_66, Wn, Ln }, /* vrangep{s,d} */
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -433,8 +433,8 @@ static const struct ext0f38_table {
     [0xcb] = { .simd_size = simd_other, .d8s = d8s_vl },
     [0xcc ... 0xcd] = { .simd_size = simd_other, .two_op = 1, .d8s = d8s_vl },
     [0xcf] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
-    [0xd2] = { .simd_size = simd_other },
-    [0xd3] = { .simd_size = simd_other },
+    [0xd2] = { .simd_size = simd_other, .d8s = d8s_vl },
+    [0xd3] = { .simd_size = simd_other, .d8s = d8s_vl },
     [0xd6] = { .simd_size = simd_other, .d8s = d8s_vl },
     [0xd7] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
     [0xda] = { .simd_size = simd_other },
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -6201,6 +6201,24 @@ x86_emulate(
         avx512_vlen_check(true);
         goto simd_zmm;
 
+    case X86EMUL_OPC_EVEX   (0x0f38, 0x50): /* vpdpbuud [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_F3(0x0f38, 0x50): /* vpdpbsud [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_F2(0x0f38, 0x50): /* vpdpbssd [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX   (0x0f38, 0x51): /* vpdpbuuds [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_F3(0x0f38, 0x51): /* vpdpbsuds [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_F2(0x0f38, 0x51): /* vpdpbssds [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX   (0x0f38, 0xd2): /* vpdpwuud [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(0x0f38, 0xd2): /* vpdpwusd [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_F3(0x0f38, 0xd2): /* vpdpwsud [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX   (0x0f38, 0xd3): /* vpdpwuuds [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(0x0f38, 0xd3): /* vpdpwusds [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_F3(0x0f38, 0xd3): /* vpdpwsuds [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX   (0x0f38, 0x52): /* vdpphps [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+        generate_exception_if(evex.w, X86_EXC_UD);
+        vcpu_must_have(avx10, 2);
+        op_bytes = 16 << evex.lr;
+        goto avx512f_no_sae;
+
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x8f): /* vpshufbitqmb [xyz]mm/mem,[xyz]mm,k{k} */
         generate_exception_if(evex.w || !evex.r || !evex.R || evex.z, X86_EXC_UD);
         /* fall through */
@@ -7660,6 +7678,14 @@ x86_emulate(
         visa_check(bw);
         goto opmask_shift_imm;
 
+    case X86EMUL_OPC_EVEX_F3(0x0f3a, 0x42): /* vmpsadbw $imm8,[xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+        generate_exception_if(evex.w || evex.brs, X86_EXC_UD);
+        vcpu_must_have(avx10, 2);
+        avx512_vlen_check(false);
+        op_bytes = 16 << evex.lr;
+        fault_suppression = false;
+        goto simd_imm8_zmm;
+
     case X86EMUL_OPC_66(0x0f3a, 0x44):     /* pclmulqdq $imm8,xmm/m128,xmm */
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x44): /* vpclmulqdq $imm8,{x,y}mm/mem,{x,y}mm,{x,y}mm */
         host_and_vcpu_must_have(pclmulqdq);


