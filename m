Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 027C0951730
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2024 10:58:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776965.1187169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1se9pJ-0008HH-5u; Wed, 14 Aug 2024 08:57:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776965.1187169; Wed, 14 Aug 2024 08:57:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1se9pJ-0008EW-1d; Wed, 14 Aug 2024 08:57:53 +0000
Received: by outflank-mailman (input) for mailman id 776965;
 Wed, 14 Aug 2024 08:57:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NhoJ=PN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1se9lW-0004KL-BY
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2024 08:53:58 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be14fb1c-5a1a-11ef-a505-bb4a2ccca743;
 Wed, 14 Aug 2024 10:53:57 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5a1337cfbb5so8321049a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Aug 2024 01:53:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bd187f3306sm3672671a12.17.2024.08.14.01.53.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Aug 2024 01:53:56 -0700 (PDT)
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
X-Inumbo-ID: be14fb1c-5a1a-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723625637; x=1724230437; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VGSyTsew86/TrCcru/Rk7R/2beYcoXHkI1pXLpAyXsw=;
        b=cFwoTxsJOf6h//TszOXsk553mQ7qFbylgD6q9a1XeuNTqO9221CN6Ua6/NuLoy5+Jo
         1t6VWwXsThdhhRiYGq5l1MZLzhf9uQqqYVn21id9gJFxexNOFDLVbAw+JNwbD12dR7S9
         9lIDDV5nSOS2Z1OmKBtieTCrD4aKgMc7vFVel2VcWoPxTL6yUpXF0E2Dln9D4dG8kNeL
         SDZyqBtyRMXSXvF+3VtXYrduKQ+hM+6iGRZLrQ+NonNPqs/mr5qnUZy2ERCIBsdieay1
         c1Nxd5nZfTM/2J1SLDsMeS9QF7816y+9RKN3wL9GWolQYz/ZBoE6ByfJP9A1RIXxO81l
         rVBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723625637; x=1724230437;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VGSyTsew86/TrCcru/Rk7R/2beYcoXHkI1pXLpAyXsw=;
        b=AUEMv/o88rWTLYvkt2zQ3EdGR4RBIhmhRYTK/Uf4pjAdNRx+nYI0fFWc1eMfsWaVNJ
         xc5paLw4Hx/GlTsbmAbR4gi78IhLDSajnlmBoSE6wIgmZUvGvCutsLJwUQt662UulJxc
         Dc8kkvxuE9IOMD8JD32lldym7SAwmyiVPXAhJwKZv2zPakP9KgJG8wbVtbxKq5BZ6Clu
         9mWjWmFP641X03viIc9jkPGou9b0xQtTGMWLTZZ5Vuu7TKEzO/AsCbggzsW0gPcemigG
         GZbWBwzLKVOxB1xa5PEUsWZJ2bUuvNh8j8a5crT6K4HPyaeVyJli4l1ec5RmyhM/DX6G
         yahA==
X-Gm-Message-State: AOJu0YyX0LsV4jyWUGdFfneuAlKClZDCaeWhK/UoruvkfEN0iOn1Ai60
	KoA4VOK1e9urnJMWX92h4eJwBbftT8xrst6e0MWfC+wSnebav43bYoYkyz3FRgMXKbzEJB+ZGK4
	=
X-Google-Smtp-Source: AGHT+IE68HR9zPeYJqpC26k+G87WcAmTROyAjMQ85LwKkgJVPau3FH01EvgH8hL4JVtRtVOGkObRrQ==
X-Received: by 2002:a05:6402:1e91:b0:5a3:a4d7:caf5 with SMTP id 4fb4d7f45d1cf-5bea1cb3857mr1555308a12.36.1723625637144;
        Wed, 14 Aug 2024 01:53:57 -0700 (PDT)
Message-ID: <1791dda8-694b-4ef9-b8f7-86f1eeca7719@suse.com>
Date: Wed, 14 Aug 2024 10:53:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 8/9] x86emul/test: engage AVX512VL via command line option
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
 


