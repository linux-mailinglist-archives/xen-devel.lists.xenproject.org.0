Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1365485D57A
	for <lists+xen-devel@lfdr.de>; Wed, 21 Feb 2024 11:28:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683926.1063548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcjov-00075K-82; Wed, 21 Feb 2024 10:27:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683926.1063548; Wed, 21 Feb 2024 10:27:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcjov-00073K-3p; Wed, 21 Feb 2024 10:27:21 +0000
Received: by outflank-mailman (input) for mailman id 683926;
 Wed, 21 Feb 2024 10:27:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TA2L=J6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rcjot-00073E-IL
 for xen-devel@lists.xenproject.org; Wed, 21 Feb 2024 10:27:19 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c970d564-d0a3-11ee-98f5-efadbce2ee36;
 Wed, 21 Feb 2024 11:27:17 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5650ac9a440so474931a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 21 Feb 2024 02:27:17 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ev24-20020a056402541800b0056163b46393sm4443346edb.64.2024.02.21.02.27.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Feb 2024 02:27:16 -0800 (PST)
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
X-Inumbo-ID: c970d564-d0a3-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708511237; x=1709116037; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pJTa6YW+NtX8rkgi+1nHxJa7bodneRdIU2pBJkxOBgo=;
        b=IWPyDHSEBXHzmdLR4zjxNnOGQ06uXKBDDzWZxQ5IaJIMjN/8lmZr8ZRMQzoA5T6bR7
         yMcBIFWmZ4mSHKSJ5LwOIaTNymrZT2z5RyJkpBDGKtxdjSX7OPp6dnqzX5EaQAgghmb3
         uNtksK0fGtqpTtirps4HP7058dpFBVMNabBP7ufXQQQq8lIWcz9rTfebCLSOHx4qOX0g
         X7raQqB9zBGHQTbUXYyDpN7VP7+cfYgfFY0KunH/H+FO5bhHeYLoqC5jXKk644iUP48c
         obJIzCzQG9W9n4cm1STvUQ34m+s1fOgRL2Rf4Do8p85G23GILi14Waq1UHhUUoQRHAZS
         HT6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708511237; x=1709116037;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pJTa6YW+NtX8rkgi+1nHxJa7bodneRdIU2pBJkxOBgo=;
        b=lA7kM6xtuEDulPJxavKwujCWhSrAJ23qwqs1GZEuubGL/5NgqMMLCdFr1kTo0XyLNp
         9Wny+OLwm/c4VbNEoFXDOsyXKyKvPiKf97maiVnBodp6jbXG/7H+xT6PklRWgzl+pjtS
         j8mQZYXqotcaCb6rpHArHF+y6Yg2pbRSv0JDlRu5EVI+ym3ajuNo4CuoGh5YJ5ORd28P
         oncmFr0Td5dpexslPsdTFy8/soOI5XOnU2msnUK4Gub+sI1pGyeImfCBhCBOmrVun6L0
         HddwmECfgSdZByn8szuFSLZM8FYWzxpx4Trm89MItpu/pdbO93x0CJzN6zPxx8SSG6LC
         /BfA==
X-Gm-Message-State: AOJu0YxxoQNPK5gUWIFGiGVh3yzACUFwFM4njwPS8dB8VYe/bETys/W6
	v5R3YicFnxSzi+ArwoAKwN+mIw2F47c/R5Uxvg5uqlVGR5+YRqLe257P3Hn0VxkkLfyh0sVj4Uo
	=
X-Google-Smtp-Source: AGHT+IHfD1H/dIIewbpyDmudEspruYyxzjEhxGnQbtYtGGWudeJdT8Q0aKoBqyRPcvIk9xO3C8gj1w==
X-Received: by 2002:a05:6402:14d0:b0:564:66c1:d527 with SMTP id f16-20020a05640214d000b0056466c1d527mr6144651edx.36.1708511236934;
        Wed, 21 Feb 2024 02:27:16 -0800 (PST)
Message-ID: <52d2b102-1285-41fc-a550-ca9437df612b@suse.com>
Date: Wed, 21 Feb 2024 11:27:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul: add missing EVEX.R' checks
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

EVEX.R' is not ignored in 64-bit code when encoding a GPR or mask
register. While for mask registers suitable checks are in place (there
also covering EVEX.R), they were missing for the few cases where in
EVEX-encoded instructions ModR/M.reg encodes a GPR. While for VPEXTRW
the bit is replaced before an emulation stub is invoked, for
VCVT{,T}{S,D,H}2{,U}SI this actually would have led to #UD from inside
an emulation stub, in turn raising #UD to the guest, but accompanied by
log messages indicating something's wrong in Xen nevertheless.

Fixes: 001bd91ad864 ("x86emul: support AVX512{F,BW,DQ} extract insns")
Fixes: baf4a376f550 ("x86emul: support AVX512F legacy-equivalent scalar int/FP conversion insns")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
As to Fixes: tags - there are more affected commits, but they both only
re-use the expression introduced by the 2nd of the ones mentioned.

--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -3686,7 +3686,8 @@ x86_emulate(
     CASE_SIMD_SCALAR_FP(_EVEX, 0x0f, 0x2d): /* vcvts{s,d}2si xmm/mem,reg */
     CASE_SIMD_SCALAR_FP(_EVEX, 0x0f, 0x78): /* vcvtts{s,d}2usi xmm/mem,reg */
     CASE_SIMD_SCALAR_FP(_EVEX, 0x0f, 0x79): /* vcvts{s,d}2usi xmm/mem,reg */
-        generate_exception_if((evex.reg != 0xf || !evex.RX || evex.opmsk ||
+        generate_exception_if((evex.reg != 0xf || !evex.RX || !evex.R ||
+                               evex.opmsk ||
                                (ea.type != OP_REG && evex.brs)),
                               X86_EXC_UD);
         host_and_vcpu_must_have(avx512f);
@@ -7327,7 +7328,7 @@ x86_emulate(
         goto pextr;
 
     case X86EMUL_OPC_EVEX_66(0x0f, 0xc5):   /* vpextrw $imm8,xmm,reg */
-        generate_exception_if(ea.type != OP_REG, X86_EXC_UD);
+        generate_exception_if(ea.type != OP_REG || !evex.R, X86_EXC_UD);
         /* Convert to alternative encoding: We want to use a memory operand. */
         evex.opcx = ext_0f3a;
         b = 0x15;

