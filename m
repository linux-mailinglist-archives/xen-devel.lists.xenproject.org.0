Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C5B9ECA62
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 11:33:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.854497.1267690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLK1x-0001Ak-25; Wed, 11 Dec 2024 10:33:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 854497.1267690; Wed, 11 Dec 2024 10:33:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLK1w-00017q-Th; Wed, 11 Dec 2024 10:33:20 +0000
Received: by outflank-mailman (input) for mailman id 854497;
 Wed, 11 Dec 2024 10:33:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2HaM=TE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tLJpV-00076S-TC
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 10:20:30 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 881658d2-b7a9-11ef-99a3-01e77a169b0f;
 Wed, 11 Dec 2024 11:20:23 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-385deda28b3so4861984f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Dec 2024 02:20:28 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21654207719sm46391835ad.48.2024.12.11.02.20.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 02:20:27 -0800 (PST)
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
X-Inumbo-ID: 881658d2-b7a9-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733912427; x=1734517227; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Qs9XBOYAp6IPbLweUtrtvMK28FTozTB4amhvJ+Ev7XE=;
        b=EFy3BIdPkxdw2hPS9QoXek5Gke1/idor5PwcfdtIpmtbpwAmcHlmwxbkKNTH3XJNrH
         q3wkLOJe4fWL4daEyFAaeQUTz+T4xQcMjtMm/etm/0T2xCSDLiuzg2CLJnoCrojeQmOr
         kBqMdvF6uNGwJAL5R/4ysnPkKgg1NnhnK0hF6SVpznM0sRVcUGnvDUtWiESZkz8B2ANn
         BivG7mEmb/vyUNLXOZrST84BpW8HaF2can0herkk4JLwrrs+tC6DY38VLYM2R3fg+rbZ
         JOZUckDyaI5DTDB1c+8nYccS3yD5u+iswYiGOpW3C24aDIbRT/BNdni8dTJd1MsCuSSz
         ODSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733912427; x=1734517227;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qs9XBOYAp6IPbLweUtrtvMK28FTozTB4amhvJ+Ev7XE=;
        b=p5hef0F3Aoe1TXczAnn0XohVkLVVSpUpNioWpfc3oJsFXcUGPVYpjAwkupcMspQ9B4
         5U/rNSVUXwBLQQoXpO3iPWY/ojSoCJ3DWHQGMXijREbSJ5aWCYjowCRCb0Kqx9g2AoXR
         mtspx+xOiMQrLvPz8vpLyP3BYi+PIfxs1fYXIzbdGnwJ6TkDelZueu0Ib1SofVUz6ljw
         3eZvRPJlfx6H+xFHsPPy3jPe1NcetgLldGnJuSd7JxRKjgpNL9QgyuRJyZcRYoRMGiC/
         yreA3mXLvxzAuv6CJhpHQ+XIvZ/h/dwB2+ChjM0yLKpIgql826WHKN5i1kCyYCMqfUnY
         hpGQ==
X-Gm-Message-State: AOJu0YwFipWu+uEYs3JAJ76zmkG0ueIJZROZWsWH0YcxmxvhxOI4reqj
	0/JQTOi0pomkbwH0mCxTsmUuecuyXHBULHa7sv4dXenYkgTibpoa4OOWXipE859ub2++y1QUipM
	=
X-Gm-Gg: ASbGncu5lD8caThvxmdV7uQjhFQ3GntpqI9LFXUhKuHisS3efZB4qXSSOi0y/AX0wdu
	JCAxMgewNUVZJwAIgEBtTzgnCvqhgcvMSwuiNifs3EQdhx0lo5+NUWaUNHTzVE84C3yEUrM+ro7
	i9D4SUypvTL5FPbOVy28jM7SiT975++a/XOwEG7yeoJJCCa+C5hGp025MBokhqP5fpQv6eFj0PU
	J4CJr2isKkmN7E08vVMaV/N6NA0iiVvPHOiUnlWD3ehB/MAc2/O111+F/W1rDpxHIJfkkP4BGba
	GxnhhIF4Gj53M0yFT7roj2mDK21U2fs2GkCXNvw=
X-Google-Smtp-Source: AGHT+IHAgKRVLhZdPu84qjCA+WUGRppKHkhPCiergvw2aQApDglRU+3P8PqJnD8kte/0JD8RAwKvCg==
X-Received: by 2002:a05:6000:144f:b0:385:f60b:f5c4 with SMTP id ffacd0b85a97d-3864cea3ca5mr1737545f8f.29.1733912427525;
        Wed, 11 Dec 2024 02:20:27 -0800 (PST)
Message-ID: <9ea8d2d5-632a-465c-852f-47b0feeda69b@suse.com>
Date: Wed, 11 Dec 2024 11:20:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 13/16] x86emul: support AVX10.2 saturating convert insns
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

While the to-byte ones are somewhat different from what has been there
(yet then nicely regular from an operands perspective), the others are
pretty similar to various existing insns.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Spec rev 002 says VCVTTNEBF162I{,U}BS, yet that's going to change to
VCVTTBF162I{,U}BS.
---
SDE: ???
---
v3: New.

--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -719,6 +719,30 @@ static const struct test avx10_2_all[] =
     INSN(comxsd,           f3,   0f, 2f,    el,    q, el),
     INSN(comxsh,           f2, map5, 2f,    el, fp16, el),
     INSN(comxss,           f2,   0f, 2f,    el,    d, el),
+    INSN(cvtnebf162ibs,    f2, map5, 69,    vl, bf16, vl),
+    INSN(cvtnebf162iubs,   f2, map5, 6b,    vl, bf16, vl),
+    INSN(cvtph2ibs,          , map5, 69,    vl, fp16, vl),
+    INSN(cvtph2iubs,         , map5, 6b,    vl, fp16, vl),
+    INSN(cvtps2ibs,        66, map5, 69,    vl,    d, vl),
+    INSN(cvtps2iubs,       66, map5, 6b,    vl,    d, vl),
+    INSN(cvttbf162ibs,     f2, map5, 68,    vl, bf16, vl),
+    INSN(cvttbf162iubs,    f2, map5, 6a,    vl, bf16, vl),
+    INSN(cvttpd2dqs,         , map5, 6d,    vl,    q, vl),
+    INSN(cvttpd2qqs,       66, map5, 6d,    vl,    q, vl),
+    INSN(cvttpd2udqs,        , map5, 6c,    vl,    q, vl),
+    INSN(cvttpd2uqqs,      66, map5, 6c,    vl,    q, vl),
+    INSN(cvttph2ibs,         , map5, 68,    vl, fp16, vl),
+    INSN(cvttph2iubs,        , map5, 6a,    vl, fp16, vl),
+    INSN(cvttps2dqs,         , map5, 6d,    vl,    d, vl),
+    INSN(cvttps2ibs,       66, map5, 68,    vl,    d, vl),
+    INSN(cvttps2iubs,      66, map5, 6a,    vl,    d, vl),
+    INSN(cvttps2qqs,       66, map5, 6d,  vl_2,    d, vl),
+    INSN(cvttps2udqs,        , map5, 6c,    vl,    d, vl),
+    INSN(cvttps2uqqs,      66, map5, 6c,  vl_2,    d, vl),
+    INSN(cvttsd2sis,       f2, map5, 6d,    el,    q, el),
+    INSN(cvttsd2usis,      f2, map5, 6c,    el,    q, el),
+    INSN(cvttss2sis,       f3, map5, 6d,    el,    d, el),
+    INSN(cvttss2usis,      f3, map5, 6c,    el,    d, el),
     INSN(divnepbf16,       66, map5, 5e,    vl, bf16, vl),
     INSN(dpphps,             , 0f38, 52,    vl,    d, vl),
     INSN(fmadd132nepbf16,    , map6, 98,    vl, bf16, vl),
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -2162,6 +2162,26 @@ static const struct evex {
     { { 0x5f }, 2, T, R, pfx_no, W0, Ln }, /* vmaxph */
     { { 0x5f }, 2, T, R, pfx_66, W0, Ln }, /* vmaxpbf16 */
     { { 0x5f }, 2, T, R, pfx_f3, W0, LIG }, /* vmaxsh */
+    { { 0x68 }, 2, T, R, pfx_no, W0, Ln }, /* vcvttph2ibs */
+    { { 0x68 }, 2, T, R, pfx_66, W0, Ln }, /* vcvttps2ibs */
+    { { 0x68 }, 2, T, R, pfx_f2, W0, Ln }, /* vcvttbf162ibs */
+    { { 0x69 }, 2, T, R, pfx_no, W0, Ln }, /* vcvtph2ibs */
+    { { 0x69 }, 2, T, R, pfx_66, W0, Ln }, /* vcvtps2ibs */
+    { { 0x69 }, 2, T, R, pfx_f2, W0, Ln }, /* vcvtnebf162ibs */
+    { { 0x6a }, 2, T, R, pfx_no, W0, Ln }, /* vcvttph2iubs */
+    { { 0x6a }, 2, T, R, pfx_66, W0, Ln }, /* vcvttps2iubs */
+    { { 0x6a }, 2, T, R, pfx_f2, W0, Ln }, /* vcvttbf162iubs */
+    { { 0x6b }, 2, T, R, pfx_no, W0, Ln }, /* vcvtph2iubs */
+    { { 0x6b }, 2, T, R, pfx_66, W0, Ln }, /* vcvtps2iubs */
+    { { 0x6b }, 2, T, R, pfx_f2, W0, Ln }, /* vcvtnebf162iubs */
+    { { 0x6c }, 2, T, R, pfx_no, Wn, Ln }, /* vcvttp{s,d}2udqs */
+    { { 0x6c }, 2, T, R, pfx_66, Wn, Ln }, /* vcvttp{s,d}2uqqs */
+    { { 0x6c }, 2, T, R, pfx_f3, Wn, LIG }, /* vcvttss2usis */
+    { { 0x6c }, 2, T, R, pfx_f2, Wn, LIG }, /* vcvttsd2usis */
+    { { 0x6d }, 2, T, R, pfx_no, Wn, Ln }, /* vcvttp{s,d}2dqs */
+    { { 0x6d }, 2, T, R, pfx_66, Wn, Ln }, /* vcvttp{s,d}2qqs */
+    { { 0x6d }, 2, T, R, pfx_f3, Wn, LIG }, /* vcvttss2sis */
+    { { 0x6d }, 2, T, R, pfx_f2, Wn, LIG }, /* vcvttsd2sis */
     { { 0x6e }, 2, T, R, pfx_66, WIG, L0 }, /* vmovw */
     { { 0x6e }, 2, T, R, pfx_f3, W0, L0 }, /* vmovw */
     { { 0x78 }, 2, T, R, pfx_no, W0, Ln }, /* vcvttph2udq */
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -1547,6 +1547,19 @@ int x86emul_decode(struct x86_emulate_st
                     s->fp16 = true;
                 break;
 
+            case 0x68: /* vcvtt{ph,ps,bf16}2ibs */
+            case 0x69: /* vcvt{ph,ps,nebf16}2ibs */
+            case 0x6a: /* vcvtt{ph,ps,bf16}2iubs */
+            case 0x6b: /* vcvt{ph,ps,nebf16}2iubs */
+                if ( !s->evex.pfx || s->evex.pfx == vex_f2 )
+                    s->fp16 = true;
+                /* fall through */
+            case 0x6c: /* vcvttp{s,d}2u{d,q}qs, vcvtts{s,d}2usis */
+            case 0x6d: /* vcvttp{s,d}2{d,q}qs, vcvtts{s,d}2sis */
+                d |= TwoOp;
+                s->simd_size = simd_other;
+                break;
+
             case 0x6e: /* vmovw r/x/m16, xmm */
                 d = (d & ~SrcMask) | SrcMem16;
                 /* fall through */
@@ -1612,6 +1625,14 @@ int x86emul_decode(struct x86_emulate_st
                     --disp8scale;
                 break;
 
+            case 0x6c: /* vcvttps2uqqs and vcvts{s,d}2usi need special casing */
+            case 0x6d: /* vcvttps2qqs and vcvts{s,d}2si need special casing */
+                if ( s->evex.pfx == vex_66 && !s->evex.w && !s->evex.brs )
+                    --disp8scale;
+                else if ( s->evex.pfx & VEX_PREFIX_SCALAR_MASK )
+                    disp8scale = s->evex.pfx & VEX_PREFIX_DOUBLE_MASK ? 3 : 2;
+                break;
+
             case 0x7a: case 0x7b: /* vcvt{,t}ph2qq need special casing */
                 if ( s->evex.pfx == vex_66 && !s->evex.brs )
                     disp8scale = s->evex.brs ? 1 : 2 + s->evex.lr;
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -8025,6 +8025,55 @@ x86_emulate(
         op_bytes = 8 << evex.lr;
         goto simd_zmm;
 
+    case X86EMUL_OPC_EVEX_F2(5, 0x68): /* vcvttbf162ibs [xyz]mm/mem,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_F2(5, 0x69): /* vcvtnebf162ibs [xyz]mm/mem,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_F2(5, 0x6a): /* vcvttbf162iubs [xyz]mm/mem,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_F2(5, 0x6b): /* vcvtnebf162iubs [xyz]mm/mem,[xyz]mm{k} */
+        generate_exception_if(ea.type != OP_MEM && evex.brs, X86_EXC_UD);
+        /* fall through */
+    case X86EMUL_OPC_EVEX   (5, 0x68): /* vcvttph2ibs [xyz]mm/mem,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(5, 0x68): /* vcvttps2ibs [xyz]mm/mem,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX   (5, 0x69): /* vcvtph2ibs [xyz]mm/mem,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(5, 0x69): /* vcvtps2ibs [xyz]mm/mem,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX   (5, 0x6a): /* vcvttph2iubs [xyz]mm/mem,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(5, 0x6a): /* vcvttps2iubs [xyz]mm/mem,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX   (5, 0x6b): /* vcvtph2iubs [xyz]mm/mem,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(5, 0x6b): /* vcvtps2iubs [xyz]mm/mem,[xyz]mm{k} */
+        generate_exception_if(evex.w, X86_EXC_UD);
+        vcpu_must_have(avx10, 2);
+        if ( ea.type != OP_REG || !evex.brs )
+            avx512_vlen_check(false);
+        op_bytes = 16 << evex.lr;
+        goto simd_zmm;
+
+    case X86EMUL_OPC_EVEX   (5, 0x6c): /* vcvttps2udqs [xyz]mm/mem,[xyz]mm{k} */
+                                       /* vcvttpd2udqs [xyz]mm/mem,{x,y}mm{k} */
+    case X86EMUL_OPC_EVEX_66(5, 0x6c): /* vcvttps2uqqs {x,y}mm/mem,[xyz]mm{k} */
+                                       /* vcvttpd2uqqs [xyz]mm/mem,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX   (5, 0x6d): /* vcvttps2dqs [xyz]mm/mem,[xyz]mm{k} */
+                                       /* vcvttpd2dqs [xyz]mm/mem,{x,y}mm{k} */
+    case X86EMUL_OPC_EVEX_66(5, 0x6d): /* vcvttps2qqs {x,y}mm/mem,[xyz]mm{k} */
+                                       /* vcvttpd2qqs [xyz]mm/mem,[xyz]mm{k} */
+        vcpu_must_have(avx10, 2);
+        if ( ea.type != OP_REG || !evex.brs )
+            avx512_vlen_check(false);
+        op_bytes = 8 << ((evex.w || !evex.pfx) + evex.lr);
+        goto simd_zmm;
+
+    CASE_SIMD_SCALAR_FP(_EVEX, 5, 0x6c): /* vcvtts{s,d}2usis xmm/mem,reg */
+    CASE_SIMD_SCALAR_FP(_EVEX, 5, 0x6d): /* vcvtts{s,d}2sis xmm/mem,reg */
+        generate_exception_if((evex.reg != 0xf || !evex.RX || !evex.R ||
+                               evex.opmsk),
+                              X86_EXC_UD);
+        vcpu_must_have(avx10, 2);
+        if ( !evex.brs )
+            avx512_vlen_check(true);
+        else
+            generate_exception_if(ea.type != OP_REG || !evex.u, X86_EXC_UD);
+        get_fpu(X86EMUL_FPU_zmm);
+        opc = init_evex(stub);
+        goto cvts_2si;
+
     case X86EMUL_OPC_EVEX_66(5, 0x78): /* vcvttph2uqq xmm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(5, 0x79): /* vcvtph2uqq xmm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(5, 0x7a): /* vcvttph2qq xmm/mem,[xyz]mm{k} */


