Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AA29C6DB1
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 12:21:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835400.1251271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBBRB-0008NL-Mp; Wed, 13 Nov 2024 11:21:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835400.1251271; Wed, 13 Nov 2024 11:21:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBBRB-0008LQ-Gw; Wed, 13 Nov 2024 11:21:29 +0000
Received: by outflank-mailman (input) for mailman id 835400;
 Wed, 13 Nov 2024 11:21:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=REvy=SI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tBBRA-0008K3-F1
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 11:21:28 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a0faefe-a1b1-11ef-a0c7-8be0dac302b0;
 Wed, 13 Nov 2024 12:21:23 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3807dd08cfcso6356970f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 13 Nov 2024 03:21:23 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381eda03e42sm18418731f8f.89.2024.11.13.03.21.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Nov 2024 03:21:22 -0800 (PST)
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
X-Inumbo-ID: 6a0faefe-a1b1-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MzYiLCJoZWxvIjoibWFpbC13cjEteDQzNi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjZhMGZhZWZlLWExYjEtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNDk2ODgzLjUzOTg2NCwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731496883; x=1732101683; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WgyamnwBW/NroMdOkv1kV3RRKC/pIbtp4FG9e+3AD4o=;
        b=ZTVgiyqixMDdmsPWhiVmltIl16UqbixYif+OdajgEKOEgtUFV+PPn66/pBLewsNQxP
         X5qZ1Xf7quc1/aikvqIR+hmgfX5ZLcxt/YnwT9AuntUX2PSIaeWi9jR9vyh3H+6ozD4X
         iUOrH+COnkeMzBEAXs3c38O2tbZ0rGp/VmBzHv3Z6xBbhaNnR9b7/D54ojIRwi0ge1BS
         M8loPlnQsk6WQi0hEr1kvt1XqPXivZI3rL/Zen3VMue2zuVw2hz3fqDrJD18m1Hr11+y
         u7xGfrKAoe26so4Js/VX8/lODJoCtK757mk8wKgqVnX3MHdjIbBS14RiNIRjanfLL0Yc
         SbYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731496883; x=1732101683;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WgyamnwBW/NroMdOkv1kV3RRKC/pIbtp4FG9e+3AD4o=;
        b=tmqtqlcQSUk8/KFcB7xW19/EnKmGwjXKDuV1hkOF23t6wNLgbT8JtFTsmPk4mm7jKx
         rjsDETjw6YFfymthmf3kIy0ooUhNvjCUBRlwT4/v3yJU8NKnGCaGTpogf75kZzaXyHzU
         d+Nz9kSb4r3aTH/CNK6XY1nAWDbWTH/YMvW323KcFRkAMlgwUS9NpYdGyhQOLDVkGEnv
         FEIMkRKe5An51ncdlzSBftyyZcF3Wp25kV/82hA5n/wegkOU+YrDjsRqdIm3PJMfbh9D
         1sW3FM5BwX1Ohnsk/XFXh5r2F0SBxjk/KiyhEnDDnGBcTsD9C4Y0xDezLgQ791QjHHcj
         Da5Q==
X-Gm-Message-State: AOJu0Yzbp1yjD3Ik0c/5kf6fov/uVrs9gGdeHyBeFxowlsGPS2HIV5J5
	4zYeobLrqBBJRj0+/KxX0uwEa26evSV+6iZ5y+NWpDn5vlAujKhIIUaUP2bg+ga62dcAG6LmaLw
	=
X-Google-Smtp-Source: AGHT+IFiSoCIBYQDdZUd/KBebnUsbAuy+2LUQzy+YpExvSsDZSZuEBb/uHUPrm18fYs381cYCGKSRQ==
X-Received: by 2002:a05:6000:480d:b0:381:ebf5:8180 with SMTP id ffacd0b85a97d-381f1889d5bmr22802272f8f.50.1731496882768;
        Wed, 13 Nov 2024 03:21:22 -0800 (PST)
Message-ID: <655bd278-b3b4-4c7c-876c-ff5af335b4f1@suse.com>
Date: Wed, 13 Nov 2024 12:21:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul: avoid double memory read for RORX
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

Originally only twobyte_table[0x3a] determined what part of generic
operand fetching (near the top of x86_emulate()) comes into play. When
ext0f3a_table[] was added, ->desc was updated to properly describe the
ModR/M byte's function. With that generic source operand fetching came
into play for RORX, rendering the explicit fetching in the respective
case block redundant (and wrong at the very least when MMIO with side
effects is accessed).

While there also make a purely cosmetic / documentary adjustment to
ext0f3a_table[]: RORX really is a 2-operand insn, MOV-like in that it
only writes its destination register.

Fixes: 9f7f5f6bc95b ("x86emul: add tables for 0f38 and 0f3a extension space")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -521,7 +521,7 @@ static const struct ext0f3a_table {
     [0xce ... 0xcf] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
     [0xde] = { .simd_size = simd_other },
     [0xdf] = { .simd_size = simd_packed_int, .two_op = 1 },
-    [0xf0] = {},
+    [0xf0] = { .two_op = 1 /* Mov */ },
 };
 
 static const opcode_desc_t xop_table[] = {
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -7693,11 +7693,6 @@ x86_emulate(
     case X86EMUL_OPC_VEX_F2(0x0f3a, 0xf0): /* rorx imm,r/m,r */
         vcpu_must_have(bmi2);
         generate_exception_if(vex.l || vex.reg != 0xf, X86_EXC_UD);
-        if ( ea.type == OP_REG )
-            src.val = *ea.reg;
-        else if ( (rc = read_ulong(ea.mem.seg, ea.mem.off, &src.val, op_bytes,
-                                   ctxt, ops)) != X86EMUL_OKAY )
-            goto done;
         if ( mode_64bit() && vex.w )
             asm ( "rorq %b1,%0" : "=g" (dst.val) : "c" (imm1), "0" (src.val) );
         else

