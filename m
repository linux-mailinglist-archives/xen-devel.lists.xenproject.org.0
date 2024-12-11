Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A66699ECA0A
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 11:14:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.854293.1267539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLJjG-0005eO-VD; Wed, 11 Dec 2024 10:14:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 854293.1267539; Wed, 11 Dec 2024 10:14:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLJjG-0005c6-S1; Wed, 11 Dec 2024 10:14:02 +0000
Received: by outflank-mailman (input) for mailman id 854293;
 Wed, 11 Dec 2024 10:14:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2HaM=TE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tLJjE-0005bt-Rp
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 10:14:00 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a016e5b8-b7a8-11ef-99a3-01e77a169b0f;
 Wed, 11 Dec 2024 11:13:54 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-385f06d0c8eso3045246f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Dec 2024 02:13:58 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-725d3dd4cbasm7469337b3a.142.2024.12.11.02.13.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 02:13:57 -0800 (PST)
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
X-Inumbo-ID: a016e5b8-b7a8-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733912038; x=1734516838; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VGSyTsew86/TrCcru/Rk7R/2beYcoXHkI1pXLpAyXsw=;
        b=WUB+Wcy01N562dCQj3yuiN1GKPumclfXSSO3WNIMZwNJcXIpGhmiB2snCwO0LbIpK8
         Mc+A+m6DwKqNNJdjH7wSEMozx6ULv4/Dl9OXms0u/koTvJt002Pjp4XKIIBBxrrZKfxM
         E8qaG8hHR7U8MSopH9lhqMct1MlHruOu3FiNWsV0WovoWEoYIcW14L1aQL9rkcHWS36n
         hb1gvKiO1MoW5OXsAJt/v/mrDBZ9lxDhG4/3QUkLmceUdbcOe77JcejavlPVdjW6gcag
         jpTwy4vRtkEAw6mz/nIX4HYvWH/PCwuLto6EHyypHCVUw0PMMXXFhPPd3L+GlJWu5FeM
         vK5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733912038; x=1734516838;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VGSyTsew86/TrCcru/Rk7R/2beYcoXHkI1pXLpAyXsw=;
        b=I0j0qeAUxsY0ng9lLDTWv6PQLiOZgAU3unYahakOVxIxRTQ5DBpED7WextOF/Ubr4q
         N/Frm94zLN2pzs6r6brqd1ZfsNAj78iKhuH2ZLg+MP9reKbjVLnXXXeZdODD0VBSVetS
         vigcvK5FZQ1nmkYrGP9OHQpyzsu+5K3fntUBz/v90jDKLXHLo1RD3wqbSo/4Yv587jSn
         DFavvwaQx/Xty1uab6rKQJDAPay4thd1XfnqwrtvaS5xJDEgNRjm4lUM2enQaNJl5WBN
         RYx3m9RaZWk+CfFsYx1U5K/ZRvzRLmxR/JJzMD9oSefjwZtMYP/mi2WbZ4au20y4NO9g
         asVg==
X-Gm-Message-State: AOJu0Yz5L3Ce1H7/nW2+BFiZ51b0o/v030FSZUH+GJPyFXTaJUgLFHgH
	+PRnbqmLmmdLIh7vZtQ5Myv9cRTBfdYmn+RN+p2xAbTSrqxAVeRt51Hhkt7U32/xLVYeu2iSXa8
	=
X-Gm-Gg: ASbGncuRqgpUEyTMmBukUKYGnz989KGgsr+aThy4Ek2t+t6sUd3Uoj5KWNoIp25gpNQ
	BwiuPB+DuXv7Az+k+XmOdHPzBUORAcEJJkH5Jiyf7AKdsa7wfixxoAIwEoNgK8IR/fk86wNh2OF
	6pNM87WvzFp8qwnwxpajrEc9WCLKoa8tlWHsKvQfsXaiApDTfpVuEaQvTLGcLJURENB02Ari82V
	Pbhqr35aXxELuG2LPXTg+xsL6N/tQ5AjTUzh2TWMt9/crnL3gg2TZiKOlj8VgRmOdwCWBm28p8j
	lwtf4mjkrimeaBg3bjYDjAAf28CiAf2zmQl5ZsE=
X-Google-Smtp-Source: AGHT+IFAUVdTKd07IUIk75oNNDJmg2YpV/i6O60WN6iY0a4ljixpKTvnt8a9OaU/jl5nY+M/q+dXzw==
X-Received: by 2002:a5d:6c64:0:b0:385:fab3:c56d with SMTP id ffacd0b85a97d-3864cdc1132mr1836657f8f.0.1733912038370;
        Wed, 11 Dec 2024 02:13:58 -0800 (PST)
Message-ID: <59222198-afca-4ff4-8a47-8c3e6d3e922c@suse.com>
Date: Wed, 11 Dec 2024 11:13:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 06/16] x86emul/test: engage AVX512VL via command line
 option
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

Now that we have machinery in testcase.mk to set vector length dependent
flags for AVX512 tests, let's avoid using a pragma to enable AVX512VL
insns for the compiler. This way, correct settings are in place from the
very beginning of compilation.

No change to the generated test blobs, and hence no functional change.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/tests/x86_emulator/simd.h
+++ b/tools/tests/x86_emulator/simd.h
@@ -215,10 +215,6 @@ DECL_OCTET(half);
 # define __builtin_ia32_shuf_i32x4_512_mask __builtin_ia32_shuf_i32x4_mask
 # define __builtin_ia32_shuf_i64x2_512_mask __builtin_ia32_shuf_i64x2_mask
 
-# if VEC_SIZE > ELEM_SIZE && (defined(VEC_MAX) ? VEC_MAX : VEC_SIZE) < 64
-#  pragma GCC target ( "avx512vl" )
-# endif
-
 # define REN(insn, old, new)                     \
     asm ( ".macro v" #insn #old " o:vararg \n\t" \
           "v" #insn #new " \\o             \n\t" \
--- a/tools/tests/x86_emulator/testcase.mk
+++ b/tools/tests/x86_emulator/testcase.mk
@@ -7,8 +7,8 @@ $(call cc-options-add,CFLAGS,CC,$(EMBEDD
 ifneq ($(filter -mavx512%,$($(TESTCASE)-cflags)),)
 
 cflags-vsz64 :=
-cflags-vsz32 := -mprefer-vector-width=256
-cflags-vsz16 := -mprefer-vector-width=128
+cflags-vsz32 := -mavx512vl -mprefer-vector-width=256
+cflags-vsz16 := -mavx512vl -mprefer-vector-width=128
 # Scalar tests don't set VEC_SIZE (and VEC_MAX is used by S/G ones only)
 cflags-vsz   := -mprefer-vector-width=128
 


