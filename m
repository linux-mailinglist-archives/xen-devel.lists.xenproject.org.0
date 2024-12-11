Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 587C09ECA36
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 11:21:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.854376.1267608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLJqV-0002FZ-6q; Wed, 11 Dec 2024 10:21:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 854376.1267608; Wed, 11 Dec 2024 10:21:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLJqV-0002Eg-45; Wed, 11 Dec 2024 10:21:31 +0000
Received: by outflank-mailman (input) for mailman id 854376;
 Wed, 11 Dec 2024 10:21:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2HaM=TE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tLJqU-0002Dh-3e
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 10:21:30 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id abdf14bb-b7a9-11ef-99a3-01e77a169b0f;
 Wed, 11 Dec 2024 11:21:23 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-385e06af753so2882868f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Dec 2024 02:21:28 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-728e8c46a84sm1880755b3a.130.2024.12.11.02.21.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 02:21:27 -0800 (PST)
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
X-Inumbo-ID: abdf14bb-b7a9-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733912487; x=1734517287; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nCKajekOUINBVbNX77/s6Kb1O6XuDQGofayJhNlpP6I=;
        b=JxYOjeyJVsuDril8zvJ3nsmKvGS30lgUCqRmLP4kFYNM8GWsFPZ7X3FDD9VqWTisTu
         tNzeXUDbX9jTLKsSknfCUwxRaM1AKzilYSOVTRQ/PY3fOlD0R1b83tRYXLFsHXnYC+Ru
         dj4jJepDLqZWlck8p+mXVufIksIGMjMpiuCHIbPgT4IPCp/jQI5VaX383iKCkiARvzlp
         /I2I8kqVz8xx4rbzBu1u4T5n8bpW93olY+M/LZ7TuNS87nl1wJPwYWIvNwLT7yhSPTiv
         5tZayctyJXT8VzK+561dKEPvzq+7O66id/zbxEyBF3WCRSMrI9QSp563uj4IFYqR+F8j
         uLWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733912487; x=1734517287;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nCKajekOUINBVbNX77/s6Kb1O6XuDQGofayJhNlpP6I=;
        b=JFpQgFTGCxsgvEFpggjRDS8Hy/2S+xhhcLGYRx+ZWccTVxGRMw/C6VAtjSS7qMHUiA
         AUrbGCVtRwLMQzKZYXYBmE62oaDkKXtBwMwvmpKJKq2Vfnz3jy19LNxMIfU5NiLnPifL
         tfMzCcVfwENvEAj4WZ1vqQexvqxmQ5Hwv+TPe+xkTL7Z4YHJ4MEn1L9ZBpumRYUodDO3
         VlROCiX7F/kTscRBi5uLwanmm9zPXbLu0wbzsnPW8LVW9yxKhhDFjanT0g7hMTES+vSZ
         40TtjVcs9wYA5opqHCq2LopXpal1zuOKODiNg0foEbS8q3J+Jkn/gsOCOYZbSYzejD2F
         0IiA==
X-Gm-Message-State: AOJu0Yy2m5FcW9EnLgkCNMp82PszKUjr/pNKYufkFHql1cxqflJjMEUe
	cfSaj3bLB4wLLM3RuMOCca37exBi9Qwtf5TfzfqqXSV63gMm7Yn3dcZ3Uzc/kBNaRxb7FZXOJLo
	=
X-Gm-Gg: ASbGncuGOTbXeMlqkyKLfvKJcOjek2M5Nuc5/1xmEzwfhJlHNBy9saANwTF5EN3KtZ3
	+vlMWLgyr3kNBObTU9CsMj3K6R32utZ8lT5taaclO6Zf9jQQagvyUoem457CvFdmsNP2O3dfeo3
	awqe8kqdMTLhFLmkf59OUs3EwV9+m+Eytiwl4eFEPePfxotACn6gzhoPM5TFieKRvxPtznhtgye
	Bopu8ls4r/jR34Gl2MRe6QL7kzgj7ii8kXXeKAmX0sWXDFJUg1CaT13hq3SqHaKjI6qm79ygz2Q
	ycReD/CnaTRpfqZD4bOyTWbpYcAusldlFjcXnMs=
X-Google-Smtp-Source: AGHT+IHS2U2/7bxUzfRckX1RsUkJ6lGs3X+OPidIK3ypTK+HqRiConptVoA2lOKWVperV7Xm98ZOmA==
X-Received: by 2002:a5d:59a7:0:b0:382:4926:98fa with SMTP id ffacd0b85a97d-3864cec56f0mr1823654f8f.40.1733912487589;
        Wed, 11 Dec 2024 02:21:27 -0800 (PST)
Message-ID: <6252b702-d204-4e10-acb9-9e8b3e06e5b4@suse.com>
Date: Wed, 11 Dec 2024 11:21:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 15/16] x86emul: support SIMD MOVRS
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

As we ignore cachability aspects of insns, they're treated like simple
VMOVs.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
SDE: -???
---
v3: New.

--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -814,6 +814,13 @@ static const struct test avx10_2_128[] =
     INSN(movw, f3, map5, 7e, el, fp16, el),
 };
 
+static const struct test movrs_all[] = {
+    INSN(movrsb, f2, map5, 6f, vl,    b, vl),
+    INSN(movrsd, f3, map5, 6f, vl, d_nb, vl),
+    INSN(movrsq, f3, map5, 6f, vl, q_nb, vl),
+    INSN(movrsw, f2, map5, 6f, vl,    w, vl),
+};
+
 static const unsigned char vl_all[] = { VL_512, VL_128, VL_256 };
 static const unsigned char vl_128[] = { VL_128 };
 static const unsigned char vl_no128[] = { VL_512, VL_256 };
@@ -1236,6 +1243,10 @@ void evex_disp8_test(void *instr, struct
 
     run(cpu_has_avx10_2, avx10_2, all);
     run(cpu_has_avx10_2, avx10_2, 128);
+    if ( cpu_has_avx10_2 )
+    {
+        run(ctxt->addr_size == 64 && cpu_has_movrs, movrs, all);
+    }
 
 #undef run
 }
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -2195,6 +2195,8 @@ static const struct evex {
     { { 0x6d }, 2, T, R, pfx_f2, Wn, LIG }, /* vcvttsd2sis */
     { { 0x6e }, 2, T, R, pfx_66, WIG, L0 }, /* vmovw */
     { { 0x6e }, 2, T, R, pfx_f3, W0, L0 }, /* vmovw */
+    { { 0x6f }, 2, T, R, pfx_f3, Wn, Ln }, /* vmovrs{d,q} */
+    { { 0x6f }, 2, T, R, pfx_f2, Wn, Ln }, /* vmovrs{b,w} */
     { { 0x74 }, 2, T, R, pfx_no, W0, Ln }, /* vcvtbiasph2bf8s */
     { { 0x74 }, 2, T, R, pfx_f3, W0, Ln }, /* vcvtneph2bf8s */
     { { 0x74 }, 2, T, R, pfx_f2, W0, Ln }, /* vcvtne2ph2bf8s */
--- a/tools/tests/x86_emulator/x86-emulate.h
+++ b/tools/tests/x86_emulator/x86-emulate.h
@@ -201,6 +201,7 @@ void wrpkru(unsigned int val);
                                      xcr0_mask(0xe6))
 #define cpu_has_cmpccxadd            cpu_policy.feat.cmpccxadd
 #define cpu_has_avx_ifma            (cpu_policy.feat.avx_ifma && xcr0_mask(6))
+#define cpu_has_movrs                cpu_policy.feat.movrs
 #define cpu_has_avx_vnni_int8       (cpu_policy.feat.avx_vnni_int8 && \
                                      xcr0_mask(6))
 #define cpu_has_avx_ne_convert      (cpu_policy.feat.avx_ne_convert && \
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -6298,6 +6298,17 @@ x86_emulate(
         op_bytes = 16 << evex.lr;
         goto avx512f_no_sae;
 
+    case X86EMUL_OPC_EVEX_F2(0x0f38, 0x6f): /* vmovrs{b,w} mem,[xyz]mm{k} */
+        elem_bytes = 1 << evex.w;
+        /* fall through */
+    case X86EMUL_OPC_EVEX_F3(0x0f38, 0x6f): /* vmovrs{d,q} mem,[xyz]mm{k} */
+        generate_exception_if(ea.type != OP_MEM || evex.brs, X86_EXC_UD);
+        vcpu_must_have(avx10, 2);
+        vcpu_must_have(movrs);
+        avx512_vlen_check(false);
+        op_bytes = 16 << evex.lr;
+        goto simd_zmm;
+
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x70): /* vpshldvw [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x72): /* vpshrdvw [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
         generate_exception_if(!evex.w, X86_EXC_UD);


