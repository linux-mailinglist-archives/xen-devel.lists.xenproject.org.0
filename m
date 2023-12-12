Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B77EF80F3F6
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 18:04:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653342.1019828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD6B9-0000JN-L8; Tue, 12 Dec 2023 17:04:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653342.1019828; Tue, 12 Dec 2023 17:04:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD6B9-0000Fq-Hr; Tue, 12 Dec 2023 17:04:19 +0000
Received: by outflank-mailman (input) for mailman id 653342;
 Tue, 12 Dec 2023 17:04:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=A/PU=HX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rD6B7-0000Fk-LT
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 17:04:17 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b580c5c-9910-11ee-98e8-6d05b1d4d9a1;
 Tue, 12 Dec 2023 18:04:16 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40c339d2b88so45304885e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 12 Dec 2023 09:04:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 g10-20020a05600c4eca00b0040c11fbe581sm17009113wmq.27.2023.12.12.09.04.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Dec 2023 09:04:15 -0800 (PST)
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
X-Inumbo-ID: 7b580c5c-9910-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702400656; x=1703005456; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wn0vb6xtSjIRg20Fe1iG2HJ7YAjdlAATytw2BKVO00A=;
        b=VUwwtkcnEOWdC8A03K7KvfrA6CEDeM/bXfuRVlwynFJbkykA7KB13AYpPAlfWjZ6fC
         w6AXcXRejLttS98Gh7qn/fHr37n0IKoF+OdELplO9LBFXnyXcZCntGPPuu7KeubeqpYC
         yw8GycLLCwBqfoyNVIICFORBjrHVzdhUAbMduQFmE8Djms8egJCPTvfOrtdmLhrNeOFL
         6TYY+ZbRWQPI1XWLjvBY8/oSY//wxg/4HBUYxNTrmCvYA6eVlyvitAG5WwtToqO7sJDn
         eQ6x7X31UKyRJ7R0vxb2Fp8/nIEMVIOrwDkCiq9MOdMUcIKmrJfu2ixUuOVY0LnPJdMU
         iyQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702400656; x=1703005456;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wn0vb6xtSjIRg20Fe1iG2HJ7YAjdlAATytw2BKVO00A=;
        b=gTUyegW90ih8PB6j8GqZBYvLgTjLZO6xh2uzL3qcAnM4/wG5GLCTDj+A7r6xAfeYUk
         t1WU4B+hIkqUUsHlaVHZYhRYTl1mUk1O1FHwlVR7It4SrJ6QtL/XUfVftF9CDiep/7fo
         fjIH5k3/2knF7tjoVMefCou2LFTHeOEpoDegGqDS3Wo0cd0cSya73UEduz0lvL3FFbTY
         /a/nIeWtO9z5pL4NgOHHJkbrwg9Z83HIpSyh+LFTamXUzBDIyJQdKjpqWQDs+XN76IV1
         Y22RL2d7qiv0i35vqx9yZRLy3rE0skqOx0Wfw2It8yR4RLPS4AUkaEra4hQD9G2/zLSv
         u59w==
X-Gm-Message-State: AOJu0YxOPDJLAZq3y0dK/CToTrlMkWOikWkr37SJUPvllhlLOjlGnEWz
	BULe7Iqz8drOkyVNeVzD4u7f
X-Google-Smtp-Source: AGHT+IFTngHwwc/ABPTOe+vX+cH8e3g2UyLQXgMVjqCL9arIT0JqAU05pKcYMBJE3D50qF1fi70wgg==
X-Received: by 2002:a05:600c:46cf:b0:40c:50b4:f44f with SMTP id q15-20020a05600c46cf00b0040c50b4f44fmr770253wmo.63.1702400655912;
        Tue, 12 Dec 2023 09:04:15 -0800 (PST)
Message-ID: <95542550-5f95-4231-8210-79dc2419ce61@suse.com>
Date: Tue, 12 Dec 2023 18:04:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 29/39] xen/riscv: add definition of __read_mostly
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
 <7fec1c9f906ee120ebae606de59f9f70efb79aff.1700761381.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
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
In-Reply-To: <7fec1c9f906ee120ebae606de59f9f70efb79aff.1700761381.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.11.2023 11:30, Oleksii Kurochko wrote:
> The definition of __read_mostly should be removed in:
> https://lore.kernel.org/xen-devel/f25eb5c9-7c14-6e23-8535-2c66772b333e@suse.com/

Andrew, can we settle on what to do with that patch? If you don't like me
putting __read_mostly in xen/cache.h (consistent with __ro_after_init),
would you please make an alternative suggestion? Personally I don't really
understand why that patch hasn't long gone in. If further reorg is wanted,
it can always be done subsequently. In whatever adjustments to the patch
you want me to make to get past your objection, please make sure that it
doesn't end up scope creeping.

Jan

> The patch introduces it in arch-specific header to not
> block enabling of full Xen build for RISC-V.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>  - update the commit message
> ---
>  xen/arch/riscv/include/asm/cache.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/xen/arch/riscv/include/asm/cache.h b/xen/arch/riscv/include/asm/cache.h
> index 69573eb051..94bd94db53 100644
> --- a/xen/arch/riscv/include/asm/cache.h
> +++ b/xen/arch/riscv/include/asm/cache.h
> @@ -3,4 +3,6 @@
>  #ifndef _ASM_RISCV_CACHE_H
>  #define _ASM_RISCV_CACHE_H
>  
> +#define __read_mostly __section(".data.read_mostly")
> +
>  #endif /* _ASM_RISCV_CACHE_H */


