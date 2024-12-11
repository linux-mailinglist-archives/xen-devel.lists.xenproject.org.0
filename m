Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 910349ECA65
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 11:34:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.854508.1267698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLK2K-0001nN-D9; Wed, 11 Dec 2024 10:33:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 854508.1267698; Wed, 11 Dec 2024 10:33:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLK2K-0001k1-92; Wed, 11 Dec 2024 10:33:44 +0000
Received: by outflank-mailman (input) for mailman id 854508;
 Wed, 11 Dec 2024 10:33:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2HaM=TE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tLJr6-00024A-3C
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 10:22:08 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c5c4e683-b7a9-11ef-a0d5-8be0dac302b0;
 Wed, 11 Dec 2024 11:22:07 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-385e27c75f4so4774851f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Dec 2024 02:22:07 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7fd35331cf8sm7308250a12.44.2024.12.11.02.22.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 02:22:05 -0800 (PST)
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
X-Inumbo-ID: c5c4e683-b7a9-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733912526; x=1734517326; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hO8Qikz+f0D+oVjxqRCd7QOvjmKJ9NgkZPKMop33tuo=;
        b=fKt9Oy2QezJGe/jtR8oZ32NVgN1yGkuUvcraO7rDdbDWNuVuFG0pE/PfArof6BMyAy
         WtADKRkc9Oa3+PUBPbpw4ZUx+jn3zRkodU2WJKrWkImc+OJnWssXgkkG7NmllXsJ4gq6
         bC0QrkKj78NSxxLX2QGTQLuSIAyt/pmUNn/6Uts3RR/R4KCkpFBmnAGZqDNIDYytwC8E
         PdpZUb6SIsfYigDiDVY65kwbWaB9w6Sqek5eK9TuNLWg3kvVUH54UGfTCEo+ji1DDjzB
         vB2mJ71ti/F/gTRdXMGOik8Nr3TRizsBvrPo5A8bXVv5/p6MuGwhGYi8mdDVw84dprim
         UIYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733912526; x=1734517326;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hO8Qikz+f0D+oVjxqRCd7QOvjmKJ9NgkZPKMop33tuo=;
        b=Fr63OCGfCQovIra6UOOwAvtc4WLJv0AWPMmUyWODqVIfQR/lmcf7aB0sigkC8VQbCN
         59W2Pb1iXtoCxrqtgLK6ed00nqLJXLEypQcyAz2UOQaPXLmykHh1ZczRoJwA2TA4yMhZ
         fAVV2pqheQUzbWhXVxhm4+MUyKRy+Jpjmkk0p8FNMFeCRYp3+MDnNmSuQ/9v8cHa1dcD
         h4uqTi7QdbwmKGtVCfV/DryZaXiNn3Y7AjFivFwwGjWkAeisiTPI61d7UnwiiVJRhdLP
         e9LXxucc76PgNkAmYnRlKOBagx8qWDTiPkTHUFakLv/4YAp4ji855zRNRCxlmU3ECn4T
         mqJg==
X-Gm-Message-State: AOJu0YyLqi3NHR4gHuFqE6JcL1PGqO1/ITfFUPqLWa1ZdC6aTc9c1UNF
	1NloJQ4p67zEpNFSKMxOHgPM9qzMSfG79033w8oX4EyopfUq9PtxHZk5HuMuAvLtP3ccTptxRu8
	=
X-Gm-Gg: ASbGncvxXLF3xkPoxwPpyFRVYluUNXhEM+U4cbtkaSX8FPY6gsbnyctIs0UwLi8Qgos
	krZ/dpus3+IGCUXBAmlEVzLnIUsUrcU32X0WPQ+JyHO2VUYuciJY5W6ZtQkdxVQyn9bSTKwuoiy
	TeMqCofsxCs7c0nvcNe2jLL2waT737ypRTdFV6X13GzW92ll4e5511gWX90TTB2VAswjJCogJwH
	nz5rNFld+2tddd7SgaRh+odty8h20ntHtTqB8B8BSyo1I774H3sFTSqnfr/04dNPkkEURbWquGk
	xkGGXXDko2m+YRMCJarEZCCR9SzXJCw++MoGcys=
X-Google-Smtp-Source: AGHT+IEJfMcOa7CTrg2kHbvf5IWOAllNdNS6uSJAV6DeZb0RyD3Ak294+pH58jQrJQ1zlKlOi47rUw==
X-Received: by 2002:a5d:47a1:0:b0:386:3a8e:64c1 with SMTP id ffacd0b85a97d-3864ce90f89mr1695738f8f.19.1733912526329;
        Wed, 11 Dec 2024 02:22:06 -0800 (PST)
Message-ID: <9da1258a-86dd-46fb-9d38-95a2c2f3d902@suse.com>
Date: Wed, 11 Dec 2024 11:22:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 16/16] x86emul: support AVX10.2 forms of SM4 insns
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

Simply clone the VEX-encoded handling to cover the EVEX forms.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
There's a TODO left due to lack of SDE support. Invoking the test would
fail at present, for SDE 9.44.0 advertising both AVX10.2 and SM4, while
not supporting the new EVEX encodings just yet.
---
SDE: -???
---
v3: New.

--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -821,6 +821,11 @@ static const struct test movrs_all[] = {
     INSN(movrsw, f2, map5, 6f, vl,    w, vl),
 };
 
+static const struct test sm4_all[] = {
+    INSN(sm4key4,  f3, 0f38, da, vl, d_nb, vl),
+    INSN(sm4rnds4, f2, 0f38, da, vl, d_nb, vl),
+};
+
 static const unsigned char vl_all[] = { VL_512, VL_128, VL_256 };
 static const unsigned char vl_128[] = { VL_128 };
 static const unsigned char vl_no128[] = { VL_512, VL_256 };
@@ -1246,6 +1251,7 @@ void evex_disp8_test(void *instr, struct
     if ( cpu_has_avx10_2 )
     {
         run(ctxt->addr_size == 64 && cpu_has_movrs, movrs, all);
+        (void)sm4_all;//todo run(cpu_has_sm4, sm4, all);
     }
 
 #undef run
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -2046,6 +2046,8 @@ static const struct evex {
     { { 0xd3 }, 2, T, R, pfx_no, W0, Ln }, /* vpdpwuuds */
     { { 0xd3 }, 2, T, R, pfx_66, W0, Ln }, /* vpdpwusds */
     { { 0xd3 }, 2, T, R, pfx_f3, W0, Ln }, /* vpdpwsuds */
+    { { 0xda }, 2, T, R, pfx_f3, W0, Ln }, /* vsm4key4 */
+    { { 0xda }, 2, T, R, pfx_f2, W0, Ln }, /* vsm4rnds4 */
     { { 0xdc }, 2, T, R, pfx_66, WIG, Ln }, /* vaesenc */
     { { 0xdd }, 2, T, R, pfx_66, WIG, Ln }, /* vaesenclast */
     { { 0xde }, 2, T, R, pfx_66, WIG, Ln }, /* vaesdec */
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -439,7 +439,7 @@ static const struct ext0f38_table {
     [0xd3] = { .simd_size = simd_other, .d8s = d8s_vl },
     [0xd6] = { .simd_size = simd_other, .d8s = d8s_vl },
     [0xd7] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
-    [0xda] = { .simd_size = simd_other },
+    [0xda] = { .simd_size = simd_other, .d8s = d8s_vl },
     [0xdb] = { .simd_size = simd_packed_int, .two_op = 1 },
     [0xdc ... 0xdf] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
     [0xe0 ... 0xef] = { .to_mem = 1 },
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -6928,6 +6928,14 @@ x86_emulate(
         op_bytes = 16 << vex.l;
         goto simd_0f_ymm;
 
+    case X86EMUL_OPC_EVEX_F3(0x0f38, 0xda): /* vsm4key4 [xyz]mm/mem,[xyz]mm,[xyz]mm */
+    case X86EMUL_OPC_EVEX_F2(0x0f38, 0xda): /* vsm4rnds4 [xyz]mm/mem,[xyz]mm,[xyz]mm */
+        vcpu_must_have(avx10, 2);
+        host_and_vcpu_must_have(sm4);
+        generate_exception_if(evex.w || evex.brs || evex.opmsk, X86_EXC_UD);
+        op_bytes = 16 << evex.lr;
+        goto simd_zmm;
+
     case X86EMUL_OPC_VEX_66(0x0f38, 0xdc):  /* vaesenc {x,y}mm/mem,{x,y}mm,{x,y}mm */
     case X86EMUL_OPC_VEX_66(0x0f38, 0xdd):  /* vaesenclast {x,y}mm/mem,{x,y}mm,{x,y}mm */
     case X86EMUL_OPC_VEX_66(0x0f38, 0xde):  /* vaesdec {x,y}mm/mem,{x,y}mm,{x,y}mm */


