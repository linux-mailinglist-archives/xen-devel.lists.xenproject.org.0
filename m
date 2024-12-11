Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F609ECA3C
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 11:23:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.854417.1267639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLJrw-0004aB-2a; Wed, 11 Dec 2024 10:23:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 854417.1267639; Wed, 11 Dec 2024 10:23:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLJrv-0004Yi-W1; Wed, 11 Dec 2024 10:22:59 +0000
Received: by outflank-mailman (input) for mailman id 854417;
 Wed, 11 Dec 2024 10:22:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2HaM=TE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tLJoF-00076S-9d
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 10:19:11 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 594722d0-b7a9-11ef-99a3-01e77a169b0f;
 Wed, 11 Dec 2024 11:19:04 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3862d6d5765so2860917f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Dec 2024 02:19:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-725e4b13545sm6224682b3a.126.2024.12.11.02.19.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 02:19:08 -0800 (PST)
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
X-Inumbo-ID: 594722d0-b7a9-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733912349; x=1734517149; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Zb0r/1KGI0Knl/6PQXuJWXBeJ6RFMwkqP6qhC8BvpLo=;
        b=b0yYPgrMW9B/O9aMBKenRzu672l5dWYTyE5kJPw0g+Sng4ISfuOMCVw5Jk/82yVcmq
         HOKggKMSBKUQ+qthlsV6BJp0/oUFn73UPE2U80UyNmUHb5ix0WY0qLNHVY+/kqiBSw48
         cgtgI+lsR7C5jfvdk78mOFDY5ZTP8t05QXfMPI+Odwm0rQoc3hPbUADUHR/3rSgeU2oB
         0+cm78ADRL9dNBnnhgXMz+CJOcSvi5K6qmftU+CDpPJLyqYLIHQJ9TMaE8PRye6CHBhH
         +WMhL8fz0G6PsVThj+45PladPvxsRrii+tg2ko/0U+1vQaZIFlK5VD9xB6sb8k/BEjl9
         rSlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733912349; x=1734517149;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zb0r/1KGI0Knl/6PQXuJWXBeJ6RFMwkqP6qhC8BvpLo=;
        b=AfRcEeKffOSo1GuatKlNwRH1T/1M4xjLMEx8hrj5kta1iGhUQOedhhV1w8+epuJMZX
         OKsr0g1G4ABOzWTvaMMkUjkbfZDCp3vx5KUka95YSaZPSLZc8hZPlcjBBCFIpwP5Lw7t
         MyfLBuVZOzzkAu+5XHUb22NH+F3lrkRSvXyLnW3tSIz1chBGMEJWL9D5PA9PcLYUXLdq
         VCkbmj7XCxNfsQj//XsqYUx/29Svf2aJiWPdqRa+p6m7G9hX9KiN7ps1N9NRGzkmQKIL
         NSNSYnr1EvKTNs/bRGtr5Et4gTQMF+jsyKUPu8kHvATyAD9jMeBAbO7NVp9vrB75FB6a
         0iWA==
X-Gm-Message-State: AOJu0YzjT6n8JE0nvEElMNO5mOVTs+Vz+fF3YaZyha5oi9pNxxwtM4Kz
	LwL7dfs6QDGDXKIWvEl1kMGmJCHcDxBZb0W1hIRawjJKZagSrd1vAnwqFeV6PnBOrUI9oQWSqnU
	=
X-Gm-Gg: ASbGncu/+axGyXfOVYWv8uhN7K6kKgkLTckOXz46ZwUFz3+vSAu6+6Q3o+YcF6C6Kgu
	Ev5OaZqBKVzWLkb8TCvbtKYTqYaQgd7KSeNIJGeobr2ttuD1LSKaanEnwN3SeSJIpci5P87smX5
	b+xA97b3S21/4gvwPSCXPSALNWOxqTIBz4NUhSwQ2U/X9Wf2n3KKr6wRCDndO/lP7Dqcy9zD8F8
	6vICKbnl+bEvFht5OPkmIk5AcNYLPEnRjAi8x4+1LXrJ7bmIPh2l/Pph97qXcGhX/XYAfc3iM6D
	UtdgY4ha2Alwcpw5ArMLLEhbg3ONMu5qOE0/B0Y=
X-Google-Smtp-Source: AGHT+IGboT55AhabOdd2V6EwEZ/3tiKMObX482bdzmGsnPOVsItqG7tYDEPePdf8k2BNhmZSelFdew==
X-Received: by 2002:a5d:584c:0:b0:382:4115:1ccb with SMTP id ffacd0b85a97d-3864ce49607mr1940850f8f.7.1733912349031;
        Wed, 11 Dec 2024 02:19:09 -0800 (PST)
Message-ID: <add25cfb-1281-41cc-acfb-d12f3e9ae9ab@suse.com>
Date: Wed, 11 Dec 2024 11:19:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 11/16] x86emul: support AVX10.2 minmax insns
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

While they use new major opcodes, they are still pretty similar to
various existing insns.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Spec rev 002 says VMINMAXNEPBF16, yet that's going to change to
VMINMAXPBF16.
---
SDE: ???
---
v3: New.

--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -718,6 +718,11 @@ static const struct test avx10_2_all[] =
     INSN(comxsh,           f2, map5, 2f,    el, fp16, el),
     INSN(comxss,           f2,   0f, 2f,    el,    d, el),
     INSN(dpphps,             , 0f38, 52,    vl,    d, vl),
+    INSN(minmax,           66, 0f3a, 52,    vl,   sd, vl),
+    INSN(minmax,           66, 0f3a, 53,    el,   sd, el),
+    INSN(minmaxpbf16,      f2, 0f3a, 52,    vl, bf16, vl),
+    INSN(minmaxph,           , 0f3a, 52,    vl, fp16, vl),
+    INSN(minmaxsh,           , 0f3a, 53,    el, fp16, el),
     INSN(mpsadbw,          f3, 0f3a, 42,    vl, d_nb, vl),
     INSN(pdpbssd,          f2, 0f38, 50,    vl,    d, vl),
     INSN(pdpbssds,         f2, 0f38, 51,    vl,    d, vl),
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -2091,6 +2091,11 @@ static const struct evex {
     { { 0x44 }, 3, T, R, pfx_66, WIG, Ln }, /* vpclmulqdq */
     { { 0x50 }, 3, T, R, pfx_66, Wn, Ln }, /* vrangep{s,d} */
     { { 0x51 }, 3, T, R, pfx_66, Wn, LIG }, /* vranges{s,d} */
+    { { 0x52 }, 3, T, R, pfx_no, W0, Ln }, /* vminmaxph */
+    { { 0x52 }, 3, T, R, pfx_66, Wn, Ln }, /* vminmaxp{s,d} */
+    { { 0x52 }, 3, T, R, pfx_f2, W0, Ln }, /* vminmaxpbf16 */
+    { { 0x53 }, 3, T, R, pfx_no, W0, LIG }, /* vminmaxsh */
+    { { 0x53 }, 3, T, R, pfx_66, Wn, LIG }, /* vminmaxs{s,d} */
     { { 0x54 }, 3, T, R, pfx_66, Wn, Ln }, /* vfixupimmp{s,d} */
     { { 0x55 }, 3, T, R, pfx_66, Wn, LIG }, /* vfixumpimms{s,d} */
     { { 0x56 }, 3, T, R, pfx_no, W0, Ln }, /* vreduceph */
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -499,6 +499,8 @@ static const struct ext0f3a_table {
     [0x4c] = { .simd_size = simd_packed_int, .four_op = 1 },
     [0x50] = { .simd_size = simd_packed_fp, .d8s = d8s_vl },
     [0x51] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
+    [0x52] = { .simd_size = simd_packed_fp, .d8s = d8s_vl },
+    [0x53] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
     [0x54] = { .simd_size = simd_packed_fp, .d8s = d8s_vl },
     [0x55] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
     [0x56] = { .simd_size = simd_packed_fp, .two_op = 1, .d8s = d8s_vl },
@@ -1474,6 +1476,7 @@ int x86emul_decode(struct x86_emulate_st
                 case 0x0a: /* vrndscalesh */
                 case 0x26: /* vfpclassph */
                 case 0x27: /* vfpclasssh */
+                case 0x53: /* vminmaxsh */
                 case 0x56: /* vgetmantph */
                 case 0x57: /* vgetmantsh */
                 case 0x66: /* vreduceph */
@@ -1482,6 +1485,11 @@ int x86emul_decode(struct x86_emulate_st
                         s->fp16 = true;
                     break;
 
+                case 0x52: /* vminmaxp{h,bf16} */
+                    if ( !s->evex.pfx || s->evex.pfx == vex_f2 )
+                        s->fp16 = true;
+                    break;
+
                 case 0xc2: /* vpcmp{p,s}h */
                     if ( !(s->evex.pfx & VEX_PREFIX_DOUBLE_MASK) )
                         s->fp16 = true;
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -7716,6 +7716,21 @@ x86_emulate(
         generate_exception_if(vex.w, X86_EXC_UD);
         goto simd_0f_int_imm8;
 
+    case X86EMUL_OPC_EVEX_F2(0x0f3a, 0x52): /* vminmaxpbf16 $imm8,[xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+        generate_exception_if(ea.type != OP_MEM && evex.brs, X86_EXC_UD);
+        op_bytes = 16 << evex.lr;
+        /* fall through */
+    case X86EMUL_OPC_EVEX(0x0f3a, 0x52): /* vminmaxph $imm8,[xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX(0x0f3a, 0x53): /* vminmaxsh $imm,xmm/m16,xmm,xmm,xmm{k} */
+        generate_exception_if(vex.w, X86_EXC_UD);
+        /* fall through */
+    case X86EMUL_OPC_EVEX_66(0x0f3a, 0x52): /* vminmaxp{s,d} $imm8,[xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(0x0f3a, 0x53): /* vminmaxs{s,d} $imm8,xmm/mem,xmm,xmm{k} */
+        vcpu_must_have(avx10, 2);
+        if ( ea.type != OP_REG || !evex.brs )
+            avx512_vlen_check(b & 1);
+        goto simd_imm8_zmm;
+
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x5c): /* vfmaddsubps {x,y}mm,{x,y}mm/mem,{x,y}mm,{x,y}mm */
                                            /* vfmaddsubps {x,y}mm/mem,{x,y}mm,{x,y}mm,{x,y}mm */
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x5d): /* vfmaddsubpd {x,y}mm,{x,y}mm/mem,{x,y}mm,{x,y}mm */


