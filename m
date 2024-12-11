Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE14E9ECA2F
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 11:20:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.854358.1267589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLJp9-0000xn-Jb; Wed, 11 Dec 2024 10:20:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 854358.1267589; Wed, 11 Dec 2024 10:20:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLJp9-0000vl-Gg; Wed, 11 Dec 2024 10:20:07 +0000
Received: by outflank-mailman (input) for mailman id 854358;
 Wed, 11 Dec 2024 10:20:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2HaM=TE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tLJp8-0000mx-1K
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 10:20:06 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7cee6b84-b7a9-11ef-a0d5-8be0dac302b0;
 Wed, 11 Dec 2024 11:20:04 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-385d7b4da2bso5354183f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Dec 2024 02:20:04 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-725e34bbb22sm6192335b3a.81.2024.12.11.02.20.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 02:20:03 -0800 (PST)
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
X-Inumbo-ID: 7cee6b84-b7a9-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733912404; x=1734517204; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OZVqOnW0T4/VwuftVOiXwu0ymxGzeAMEDZBrCeulqK0=;
        b=Xnp+RTSzifYDM3ChjTDz7SyJS2o/puiHh7Wahyco46XN66+qx7WSfFAEGLLwuIA8d/
         1dWYbvCYlfBVEINUg93BwItV92QYqw0iKgJgn3ri6y/nSBWma+xI8a5O4BaOll6PQgWQ
         yFIxSN3Lyd+9U9dHN3RMRG20v1o8uSD6IRd8p53tHnjA8blhbwr3xmfzxtwjlQmRA8c5
         Abwg5gHruoeIgDvpe5OCPve9y8K+TgOb+gRKcOuCpOvezUFNVl0EW7Lbf6auoTRE1fVz
         NhLYhx1qLN84jtEVQWRXL83I7abaaMWQw0wiJ88cD7canPGjOZlGpBcok8klNXH33fy8
         F32w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733912404; x=1734517204;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OZVqOnW0T4/VwuftVOiXwu0ymxGzeAMEDZBrCeulqK0=;
        b=KvcruY96wi+8ufxT8WV1pYKvUC1EPyT2S8KchwFkrvNnSiZAFa0Sjl+R4mEApoD4Np
         bhzF2kZU8TFLleavmHf1zRYOHK4UftFfoVWp9rOqbVRf2ULPIswwQJK5Sr5EM2e5pK32
         rTm/rvbWiaEsuVzmQkoOWaXJUObpWydoDfcxPTsgDfL9VyjpGoCYYVacXCzdKv5UPVTl
         19cB9CtgRaR+O4OzDTAcsN5OuA8/WjNmdASR/7ubQJFSZS5g+jppnsUtCjzCBbwaJUwc
         L2uljAERNX5K97C/F087SsH6oTTYrksBpUN9UMynV+JSkWJnwNUdMRIlYQFAm3+9Dorg
         epNA==
X-Gm-Message-State: AOJu0YxRxIAvwxKjZbhFGNlh3R2NpnfinDTq7X5KyQ16+BPjy7z+9G8i
	1sTDXCzYRD0FB1j0sj+qxzBU0ZjUlpS0ERxvhQ3rkTBFVEU9Tk+b7d/c2sZ9L5vfQR95XPoEyG4
	=
X-Gm-Gg: ASbGncsp2TcB6JsxI5JbFmVhliv+umRDcmRcqwRHT4ltnBs4l6ptCj3RVh4QG2II0V8
	Zle3r0HTntw54HEzOrG9aBxzSHcboY7Bc+n1BftZTZoO0aLaVVXoY85c3Dg7LNesZ3WyA6NqSaj
	1AdMgsDmyBnMdwk96HH9fbyfAgksumXlYGVZkCxc0lLYZCxRR/1+g0udTHxHSu7VkZWRGrkn73Y
	/jF22g+oy5R7UoT0TQR/oFFe1An544TaXEAXpiwXgnjgVVSaeZH0lz+k77NsdxMuUBeC6PNTqc9
	qSQUq2uxnGhowZALcBTjZMmuZwzClIOkmp8H1ko=
X-Google-Smtp-Source: AGHT+IEnYB0mCxJXoFvqhkvEObE+G0wTsBnjv1+dBmq8FgYKn17WizFNj6MO1LxNR4eYOWGVqUnalw==
X-Received: by 2002:a5d:6da4:0:b0:386:1ab5:f0e1 with SMTP id ffacd0b85a97d-3864ce968c0mr1868450f8f.14.1733912403910;
        Wed, 11 Dec 2024 02:20:03 -0800 (PST)
Message-ID: <dd516bfc-637b-477a-a087-61ee5609713b@suse.com>
Date: Wed, 11 Dec 2024 11:19:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 12/16] x86emul: support AVX10.2 BFloat16 insns
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

These are all very similar to various existing insns. VGETEXPPBF16, not
living in the expected place, benefits from the respective
twobyte_table[] entry already having Mov (aka TwoOp).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
This still follows what spec version 001 says for VGETEXPPBF16. It moved
to map 6 (and be NP), yet so far no SDE is available to run the test
harness there with the changed encoding.

Spec rev 002 says VSCALEFPBF16, yet that's going to change to
VSCALEFNEPBF16.
---
SDE: ???
---
v3: New.

--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -713,16 +713,37 @@ static const struct test vpclmulqdq_all[
 };
 
 static const struct test avx10_2_all[] = {
+    INSN(addnepbf16,       66, map5, 58,    vl, bf16, vl),
+    INSN(cmppbf16,         f2, 0f3a, c2,    vl, bf16, vl),
     INSN(comsbf16,         66, map5, 2f,    el, bf16, el),
     INSN(comxsd,           f3,   0f, 2f,    el,    q, el),
     INSN(comxsh,           f2, map5, 2f,    el, fp16, el),
     INSN(comxss,           f2,   0f, 2f,    el,    d, el),
+    INSN(divnepbf16,       66, map5, 5e,    vl, bf16, vl),
     INSN(dpphps,             , 0f38, 52,    vl,    d, vl),
+    INSN(fmadd132nepbf16,    , map6, 98,    vl, bf16, vl),
+    INSN(fmadd213nepbf16,    , map6, a8,    vl, bf16, vl),
+    INSN(fmadd231nepbf16,    , map6, b8,    vl, bf16, vl),
+    INSN(fmsub132nepbf16,    , map6, 9a,    vl, bf16, vl),
+    INSN(fmsub213nepbf16,    , map6, aa,    vl, bf16, vl),
+    INSN(fmsub231nepbf16,    , map6, ba,    vl, bf16, vl),
+    INSN(fnmadd132nepbf16,   , map6, 9c,    vl, bf16, vl),
+    INSN(fnmadd213nepbf16,   , map6, ac,    vl, bf16, vl),
+    INSN(fnmadd231nepbf16,   , map6, bc,    vl, bf16, vl),
+    INSN(fnmsub132nepbf16,   , map6, 9e,    vl, bf16, vl),
+    INSN(fnmsub213nepbf16,   , map6, ae,    vl, bf16, vl),
+    INSN(fnmsub231nepbf16,   , map6, be,    vl, bf16, vl),
+    INSN(fpclasspbf16,     f2, 0f3a, 66,    vl, bf16, vl),
+    INSN(getexppbf16,      66, map5, 42,    vl, bf16, vl),
+    INSN(getmantpbf16,     f2, 0f3a, 26,    vl, bf16, vl),
+    INSN(maxpbf16,         66, map5, 5f,    vl, bf16, vl),
+    INSN(minpbf16,         66, map5, 5d,    vl, bf16, vl),
     INSN(minmax,           66, 0f3a, 52,    vl,   sd, vl),
     INSN(minmax,           66, 0f3a, 53,    el,   sd, el),
     INSN(minmaxpbf16,      f2, 0f3a, 52,    vl, bf16, vl),
     INSN(minmaxph,           , 0f3a, 52,    vl, fp16, vl),
     INSN(minmaxsh,           , 0f3a, 53,    el, fp16, el),
+    INSN(mulnepbf16,       66, map5, 59,    vl, bf16, vl),
     INSN(mpsadbw,          f3, 0f3a, 42,    vl, d_nb, vl),
     INSN(pdpbssd,          f2, 0f38, 50,    vl,    d, vl),
     INSN(pdpbssds,         f2, 0f38, 51,    vl,    d, vl),
@@ -736,6 +757,13 @@ static const struct test avx10_2_all[] =
     INSN(pdpwusds,         66, 0f38, d3,    vl,    d, vl),
     INSN(pdpwuud,            , 0f38, d2,    vl,    d, vl),
     INSN(pdpwuuds,           , 0f38, d3,    vl,    d, vl),
+    INSN(rcpph,              , map6, 4c,    vl, bf16, vl),
+    INSN(reducenepbf16,    f2, 0f3a, 56,    vl, bf16, vl),
+    INSN(rndscalenepbf16,  f2, 0f3a, 08,    vl, bf16, vl),
+    INSN(rsqrtph,            , map6, 4e,    vl, bf16, vl),
+    INSN(scalefnepbf16,      , map6, 2c,    vl, bf16, vl),
+    INSN(sqrtnepbf16,      66, map5, 51,    vl, bf16, vl),
+    INSN(subnepbf16,       66, map5, 5c,    vl, bf16, vl),
     INSN(ucomxsd,          f3,   0f, 2e,    el,    q, el),
     INSN(ucomxsh,          f2, map5, 2e,    el, fp16, el),
     INSN(ucomxss,          f2,   0f, 2e,    el,    d, el),
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -2054,6 +2054,7 @@ static const struct evex {
     { { 0x05 }, 3, T, R, pfx_66, W1, Ln }, /* vpermilpd */
     { { 0x08 }, 3, T, R, pfx_no, W0, Ln }, /* vrndscaleph */
     { { 0x08 }, 3, T, R, pfx_66, W0, Ln }, /* vrndscaleps */
+    { { 0x08 }, 3, T, R, pfx_f2, W0, Ln }, /* vrndscalenepbf16 */
     { { 0x09 }, 3, T, R, pfx_66, W1, Ln }, /* vrndscalepd */
     { { 0x0a }, 3, T, R, pfx_no, W0, LIG }, /* vrndscalesh */
     { { 0x0a }, 3, T, R, pfx_66, W0, LIG }, /* vrndscaless */
@@ -2077,6 +2078,7 @@ static const struct evex {
     { { 0x25 }, 3, T, R, pfx_66, Wn, Ln }, /* vpternlog{d,q} */
     { { 0x26 }, 3, T, R, pfx_no, W0, Ln }, /* vgetmantph */
     { { 0x26 }, 3, T, R, pfx_66, Wn, Ln }, /* vgetmantp{s,d} */
+    { { 0x26 }, 3, T, R, pfx_f2, W0, Ln }, /* vgetmantpbf16 */
     { { 0x27 }, 3, T, R, pfx_no, W0, LIG }, /* vgetmantsh */
     { { 0x27 }, 3, T, R, pfx_66, Wn, LIG }, /* vgetmants{s,d} */
     { { 0x38 }, 3, T, R, pfx_66, Wn, L1|L2 }, /* vinserti{32x4,64x2} */
@@ -2100,10 +2102,12 @@ static const struct evex {
     { { 0x55 }, 3, T, R, pfx_66, Wn, LIG }, /* vfixumpimms{s,d} */
     { { 0x56 }, 3, T, R, pfx_no, W0, Ln }, /* vreduceph */
     { { 0x56 }, 3, T, R, pfx_66, Wn, Ln }, /* vreducep{s,d} */
+    { { 0x56 }, 3, T, R, pfx_f2, W0, Ln }, /* vreducenepbf16 */
     { { 0x57 }, 3, T, R, pfx_no, W0, LIG }, /* vreducesh */
     { { 0x57 }, 3, T, R, pfx_66, Wn, LIG }, /* vreduces{s,d} */
     { { 0x66 }, 3, T, R, pfx_no, W0, Ln }, /* vfpclassph */
     { { 0x66 }, 3, T, R, pfx_66, Wn, Ln }, /* vfpclassp{s,d} */
+    { { 0x66 }, 3, T, R, pfx_f2, W0, Ln }, /* vfpclasspbf16 */
     { { 0x67 }, 3, T, R, pfx_no, W0, LIG }, /* vfpclasssh */
     { { 0x67 }, 3, T, R, pfx_66, Wn, LIG }, /* vfpclasss{s,d} */
     { { 0x70 }, 3, T, R, pfx_66, W1, Ln }, /* vshldw */
@@ -2112,6 +2116,7 @@ static const struct evex {
     { { 0x73 }, 3, T, R, pfx_66, Wn, Ln }, /* vshrd{d,q} */
     { { 0xc2 }, 3, T, R, pfx_no, W0, Ln }, /* vcmpph */
     { { 0xc2 }, 3, T, R, pfx_f3, W0, LIG }, /* vcmpsh */
+    { { 0xc2 }, 3, T, R, pfx_f2, W0, Ln }, /* vcmppbf16 */
     { { 0xce }, 3, T, R, pfx_66, W1, Ln }, /* vgf2p8affineqb */
     { { 0xcf }, 3, T, R, pfx_66, W1, Ln }, /* vgf2p8affineinvqb */
 }, evex_map5[] = {
@@ -2127,11 +2132,15 @@ static const struct evex {
     { { 0x2f }, 2, T, R, pfx_no, W0, LIG }, /* vcomish */
     { { 0x2f }, 2, T, R, pfx_66, W0, LIG }, /* vcomsbf16 */
     { { 0x2f }, 2, T, R, pfx_f2, W0, LIG }, /* vcomxsh */
+    { { 0x42 }, 2, T, R, pfx_66, W0, Ln }, /* vgetexppbf16 */
     { { 0x51 }, 2, T, R, pfx_no, W0, Ln }, /* vsqrtph */
+    { { 0x51 }, 2, T, R, pfx_66, W0, Ln }, /* vsqrtnepbf16 */
     { { 0x51 }, 2, T, R, pfx_f3, W0, LIG }, /* vsqrtsh */
     { { 0x58 }, 2, T, R, pfx_no, W0, Ln }, /* vaddph */
+    { { 0x58 }, 2, T, R, pfx_66, W0, Ln }, /* vaddnepbf16 */
     { { 0x58 }, 2, T, R, pfx_f3, W0, LIG }, /* vaddsh */
     { { 0x59 }, 2, T, R, pfx_no, W0, Ln }, /* vmulph */
+    { { 0x59 }, 2, T, R, pfx_66, W0, Ln }, /* vmulnepbf16 */
     { { 0x59 }, 2, T, R, pfx_f3, W0, LIG }, /* vmulsh */
     { { 0x5a }, 2, T, R, pfx_no, W0, Ln }, /* vcvtph2pd */
     { { 0x5a }, 2, T, R, pfx_66, W1, Ln }, /* vcvtpd2ph */
@@ -2142,12 +2151,16 @@ static const struct evex {
     { { 0x5b }, 2, T, R, pfx_66, W0, Ln }, /* vcvtph2dq */
     { { 0x5b }, 2, T, R, pfx_f3, W0, Ln }, /* vcvttph2dq */
     { { 0x5c }, 2, T, R, pfx_no, W0, Ln }, /* vsubph */
+    { { 0x5c }, 2, T, R, pfx_66, W0, Ln }, /* vsubnepbf16 */
     { { 0x5c }, 2, T, R, pfx_f3, W0, LIG }, /* vsubsh */
     { { 0x5d }, 2, T, R, pfx_no, W0, Ln }, /* vminph */
+    { { 0x5d }, 2, T, R, pfx_66, W0, Ln }, /* vminpbf16 */
     { { 0x5d }, 2, T, R, pfx_f3, W0, LIG }, /* vminsh */
     { { 0x5e }, 2, T, R, pfx_no, W0, Ln }, /* vdivph */
+    { { 0x5e }, 2, T, R, pfx_66, W0, Ln }, /* vdivnepbf16 */
     { { 0x5e }, 2, T, R, pfx_f3, W0, LIG }, /* vdivsh */
     { { 0x5f }, 2, T, R, pfx_no, W0, Ln }, /* vmaxph */
+    { { 0x5f }, 2, T, R, pfx_66, W0, Ln }, /* vmaxpbf16 */
     { { 0x5f }, 2, T, R, pfx_f3, W0, LIG }, /* vmaxsh */
     { { 0x6e }, 2, T, R, pfx_66, WIG, L0 }, /* vmovw */
     { { 0x6e }, 2, T, R, pfx_f3, W0, L0 }, /* vmovw */
@@ -2173,12 +2186,15 @@ static const struct evex {
 }, evex_map6[] = {
     { { 0x13 }, 2, T, R, pfx_66, W0, Ln }, /* vcvtph2psx */
     { { 0x13 }, 2, T, R, pfx_no, W0, LIG }, /* vcvtsh2ss */
+    { { 0x2c }, 2, T, R, pfx_no, W0, Ln }, /* vscalefnepbf16 */
     { { 0x2c }, 2, T, R, pfx_66, W0, Ln }, /* vscalefph */
     { { 0x2d }, 2, T, R, pfx_66, W0, LIG }, /* vscalefsh */
     { { 0x42 }, 2, T, R, pfx_66, W0, Ln }, /* vgetexpph */
     { { 0x43 }, 2, T, R, pfx_66, W0, LIG }, /* vgetexpsh */
+    { { 0x4c }, 2, T, R, pfx_no, W0, Ln }, /* vrcppbf16 */
     { { 0x4c }, 2, T, R, pfx_66, W0, Ln }, /* vrcpph */
     { { 0x4d }, 2, T, R, pfx_66, W0, LIG }, /* vrcpsh */
+    { { 0x4e }, 2, T, R, pfx_no, W0, Ln }, /* vrsqrtpbf16 */
     { { 0x4e }, 2, T, R, pfx_66, W0, Ln }, /* vrsqrtph */
     { { 0x4f }, 2, T, R, pfx_66, W0, LIG }, /* vrsqrtsh */
     { { 0x56 }, 2, T, R, pfx_f3, W0, Ln }, /* vfmaddcph */
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -1472,31 +1472,34 @@ int x86emul_decode(struct x86_emulate_st
             {
                 switch ( b )
                 {
-                case 0x08: /* vrndscaleph */
+                case 0x08: /* vrndscale{ph,nepbf16} */
+                case 0x26: /* vfpclassp{h,bf16} */
+                case 0x52: /* vminmaxp{h,bf16} */
+                case 0x56: /* vgetmantp{h,bf16} */
+                case 0x66: /* vreduce{ph,nepbf16} */
+                    if ( !s->evex.pfx || s->evex.pfx == vex_f2 )
+                        s->fp16 = true;
+                    break;
+
                 case 0x0a: /* vrndscalesh */
-                case 0x26: /* vfpclassph */
                 case 0x27: /* vfpclasssh */
                 case 0x53: /* vminmaxsh */
-                case 0x56: /* vgetmantph */
                 case 0x57: /* vgetmantsh */
-                case 0x66: /* vreduceph */
                 case 0x67: /* vreducesh */
                     if ( !s->evex.pfx )
                         s->fp16 = true;
                     break;
 
-                case 0x52: /* vminmaxp{h,bf16} */
-                    if ( !s->evex.pfx || s->evex.pfx == vex_f2 )
-                        s->fp16 = true;
-                    break;
-
-                case 0xc2: /* vpcmp{p,s}h */
-                    if ( !(s->evex.pfx & VEX_PREFIX_DOUBLE_MASK) )
+                case 0xc2: /* vpcmp{p,s}h, vcmppbf16 */
+                    if ( s->evex.pfx != vex_66 )
                         s->fp16 = true;
                     break;
                 }
 
-                disp8scale = decode_disp8scale(ext0f3a_table[b].d8s, s);
+                if ( s->fp16 && s->evex.pfx == vex_f2 && !s->evex.brs )
+                    disp8scale = 4 + s->evex.lr;
+                else
+                    disp8scale = decode_disp8scale(ext0f3a_table[b].d8s, s);
             }
             break;
 
@@ -1504,7 +1507,7 @@ int x86emul_decode(struct x86_emulate_st
             switch ( b )
             {
             default:
-                if ( !(s->evex.pfx & VEX_PREFIX_DOUBLE_MASK) )
+                if ( s->evex.pfx != vex_f2 )
                     s->fp16 = true;
                 break;
 
@@ -1534,6 +1537,11 @@ int x86emul_decode(struct x86_emulate_st
                 s->simd_size = simd_none;
                 break;
 
+            case 0x5a: /* vcvt{p,s}d2{p,s}h, vcvt{p,s}h2{p,s}d */
+                if ( !(s->evex.pfx & VEX_PREFIX_DOUBLE_MASK) )
+                    s->fp16 = true;
+                break;
+
             case 0x5b: /* vcvt{d,q}q2ph, vcvt{,t}ph2dq */
                 if ( s->evex.pfx && s->evex.pfx != vex_f2 )
                     s->fp16 = true;
@@ -1586,6 +1594,14 @@ int x86emul_decode(struct x86_emulate_st
                 disp8scale = 1;
                 break;
 
+            case 0x42: /* vgetexppbf16 needs special casing */
+                if ( s->evex.pfx == vex_66 )
+                {
+                    s->simd_size = simd_packed_fp;
+                    disp8scale = s->evex.brs ? 1 : 4 + s->evex.lr;
+                }
+                break;
+
             case 0x5a: /* vcvtph2pd needs special casing */
                 if ( !s->evex.pfx && !s->evex.brs )
                     disp8scale -= 2;
@@ -1618,7 +1634,7 @@ int x86emul_decode(struct x86_emulate_st
             switch ( b )
             {
             default:
-                if ( s->evex.pfx == vex_66 )
+                if ( !(s->evex.pfx & VEX_PREFIX_SCALAR_MASK) )
                     s->fp16 = true;
                 break;
 
@@ -1950,6 +1966,13 @@ int x86emul_decode(struct x86_emulate_st
             s->op_bytes = 4 >> s->fp16;
             break;
         case vex_f2:
+            if ( s->fp16 )
+            {
+                ASSERT(evex_encoded());
+                generate_exception_if(s->evex.w, X86_EXC_UD);
+                s->op_bytes = 0;
+                break;
+            }
             generate_exception_if(evex_encoded() && !s->evex.w, X86_EXC_UD);
             s->op_bytes = 8;
             break;
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -7319,6 +7319,20 @@ x86_emulate(
         avx512_vlen_check(b & 2);
         goto simd_imm8_zmm;
 
+    case X86EMUL_OPC_EVEX_F2(0x0f3a, 0x66): /* vfpclasspbf16 $imm8,[xyz]mm/mem,k{k} */
+    case X86EMUL_OPC_EVEX_F2(0x0f3a, 0xc2): /* vcmppbf16 $imm8,[xyz]mm/mem,[xyz]mm,k{k} */
+        generate_exception_if(!evex.r || !evex.R || evex.z, X86_EXC_UD);
+        /* fall through */
+    case X86EMUL_OPC_EVEX_F2(0x0f3a, 0x08): /* vrndscalenepbf16 $imm8,[xyz]mm/mem,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_F2(0x0f3a, 0x26): /* vgetmantpbf16 $imm8,[xyz]mm/mem,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_F2(0x0f3a, 0x56): /* vreducenepbf16 $imm8,[xyz]mm/mem,[xyz]mm{k} */
+        generate_exception_if(evex.w || (ea.type != OP_MEM && evex.brs),
+                              X86_EXC_UD);
+        vcpu_must_have(avx10, 2);
+        avx512_vlen_check(false);
+        op_bytes = 16 << evex.lr;
+        goto simd_imm8_zmm;
+
 #endif /* X86EMUL_NO_SIMD */
 
     CASE_SIMD_PACKED_INT(0x0f3a, 0x0f): /* palignr $imm8,{,x}mm/mem,{,x}mm */
@@ -7951,6 +7965,36 @@ x86_emulate(
         generate_exception_if(evex.w, X86_EXC_UD);
         goto avx512f_all_fp;
 
+    case X86EMUL_OPC_EVEX_66(5, 0x42): /* vgetexppbf16 [xyz]mm/mem,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(5, 0x51): /* vsqrtnepbf16 [xyz]mm/mem,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(5, 0x58): /* vaddnepbf16 [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(5, 0x59): /* vmulnepbf16 [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(5, 0x5c): /* vsubnepbf16 [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(5, 0x5d): /* vminpbf16 [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(5, 0x5e): /* vdivnepbf16 [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(5, 0x5f): /* vmaxpbf16 [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX(6, 0x2c): /* vscalefnepbf16 [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX(6, 0x4c): /* vrcppbf16 [xyz]mm/mem,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX(6, 0x4e): /* vrsqrtpbf16 [xyz]mm/mem,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX(6, 0x98): /* vfmadd132nepbf16 [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX(6, 0x9a): /* vfmsub132nepbf16 [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX(6, 0x9c): /* vfnmadd132nepbf16 [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX(6, 0x9e): /* vfnmsub132nepbf16 [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX(6, 0xa8): /* vfmadd213nepbf16 [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX(6, 0xaa): /* vfmsub213nepbf16 [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX(6, 0xac): /* vfnmadd213nepbf16 [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX(6, 0xae): /* vfnmsub213nepbf16 [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX(6, 0xb8): /* vfmadd231nepbf16 [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX(6, 0xba): /* vfmsub231nepbf16 [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX(6, 0xbc): /* vfnmadd231nepbf16 [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX(6, 0xbe): /* vfnmsub231nepbf16 [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+        generate_exception_if(evex.w || (ea.type != OP_MEM && evex.brs),
+                              X86_EXC_UD);
+        vcpu_must_have(avx10, 2);
+        avx512_vlen_check(false);
+        op_bytes = 16 << evex.lr;
+        goto simd_zmm;
+
     CASE_SIMD_ALL_FP(_EVEX, 5, 0x5a):  /* vcvtp{h,d}2p{h,d} [xyz]mm/mem,[xyz]mm{k} */
                                        /* vcvts{h,d}2s{h,d} xmm/mem,xmm,xmm{k} */
         visa_check(_fp16);


