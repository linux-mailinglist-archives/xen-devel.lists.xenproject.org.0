Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8F5947C29
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2024 15:47:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772179.1182612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1say2o-0003Ds-V0; Mon, 05 Aug 2024 13:46:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772179.1182612; Mon, 05 Aug 2024 13:46:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1say2o-0003Bc-RQ; Mon, 05 Aug 2024 13:46:38 +0000
Received: by outflank-mailman (input) for mailman id 772179;
 Mon, 05 Aug 2024 13:46:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I4ub=PE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1say2n-0003BW-HI
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2024 13:46:37 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 223aee22-5331-11ef-bc03-fd08da9f4363;
 Mon, 05 Aug 2024 15:46:36 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-52f025ab3a7so14463903e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 05 Aug 2024 06:46:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9ec4875sm452370766b.191.2024.08.05.06.46.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Aug 2024 06:46:35 -0700 (PDT)
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
X-Inumbo-ID: 223aee22-5331-11ef-bc03-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722865596; x=1723470396; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=He/VNCUucT/Fwk6jTYK47AImSamRG/7DWHnSj9sWCVw=;
        b=KDoeMq7vxjkajdYcWIsLfZnHzhauV2ORSZmhUOjcPkmwEQBObUPSmCFKAq4YwCn/wH
         x6+3M8+0gReSYVYP/POzmnLp5JZrTBk+ge0rwIJXofqC4emN/tq0Mv+oabejbGjfsZPt
         5TaDxKaSBow2PPl3gxzSBfAcAJHRFYVcK0Xn1W9RYVIDcaTKKQuVMw1rzDEslzXzSUJN
         y9Zx0mVBOBzLY6MqR75hlRCmK8OwXrszWdddpjGOXqsKtguZOWj2tuWIhkdRnoyv/FvR
         k7KcQJo6OUZ37tbor5mDyoB/1izZe+sZdl4GyooEnkO+OZ6Q4epETP+3Hr2STRZwfzih
         Q4ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722865596; x=1723470396;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=He/VNCUucT/Fwk6jTYK47AImSamRG/7DWHnSj9sWCVw=;
        b=vEIaGA7+NE+Is/ARG75fdx1k9zeKYDqe9eSVuf48rZt9VeCNJghRB0iD5+XNoYZmXV
         EOEaeR94UEynWcvPtKoDBOZpJ0nY/ROt0zjMwkQHbDUtz3lI68VG3W0PEPlYw7W5TlcP
         plGHrOLQYl2SEVqqs+N/PwG9d3rsoX1pzgDvhywEt8+Wqn0DJxXEGFgfyxwZH1bt9tDb
         ftAm/aYVc3hx7EQ+orK0TFT2NsMKv/Y64o9TKQ5pe65kKkUwHqCvyz7aCfHoZIbUjQS1
         01KCcoZ1BGXS8smX6qecojcBtBPd46fcOSDluLPjy/ESdiT0eCKpS+5ITU28Env1PUTF
         ginw==
X-Gm-Message-State: AOJu0Yya1s+1TKzNnI32y7KYGDdXva5JXvlR+geQX+uj/Fci+ffKrdkD
	9wU7xtLK1DD9gtOx4Vv87vWsD8JHSHL6NPX752QMlzOtQic5x+AD31kaayd7NGCnohXuQupjAms
	=
X-Google-Smtp-Source: AGHT+IGy9jZ7RLTGmvjzn0RBpgGWrPBiXl/l3d9ErdNVjjA70cR6cjXQkd6yFekvTpn3cmZdM8ccGQ==
X-Received: by 2002:a05:6512:3a6:b0:530:d088:2348 with SMTP id 2adb3069b0e04-530d09aac9dmr1316004e87.54.1722865595714;
        Mon, 05 Aug 2024 06:46:35 -0700 (PDT)
Message-ID: <9f73c7bd-4aa3-4a66-a12c-4bfda6aa233a@suse.com>
Date: Mon, 5 Aug 2024 15:46:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul: avoid UB shift in AVX512 VPMOV* handling
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

For widening and narrowing moves, operand (vector) size is calculated
from a table. This calculation, for the AVX512 cases, lives ahead of
validation of EVEX.L'L (which cannot be 3 without raising #UD). Account
for the later checking by adjusting the constants in the expression such
that even EVEX.L'L == 3 will yield a non-UB shift (read: shift count
reliably >= 0).

Fixes: 3988beb08 ("x86emul: support AVX512{F,BW} zero- and sign-extending moves")
Oss-fuzz: 70914
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -5788,7 +5788,7 @@ x86_emulate(
             d = DstMem | SrcReg | TwoOp;
         }
         generate_exception_if(evex.brs, X86_EXC_UD);
-        op_bytes = 32 >> (pmov_convert_delta[b & 7] + 1 - evex.lr);
+        op_bytes = 64 >> (pmov_convert_delta[b & 7] + 2 - evex.lr);
         elem_bytes = (b & 7) < 3 ? 1 : (b & 7) != 5 ? 2 : 4;
         goto avx512f_no_sae;
 

