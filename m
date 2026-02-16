Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILvRKq7hkmknzgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 10:21:50 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 198CC141EC6
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 10:21:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1233828.1537184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrunP-0002ky-MY; Mon, 16 Feb 2026 09:21:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1233828.1537184; Mon, 16 Feb 2026 09:21:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrunP-0002j0-JQ; Mon, 16 Feb 2026 09:21:35 +0000
Received: by outflank-mailman (input) for mailman id 1233828;
 Mon, 16 Feb 2026 09:21:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qFbs=AU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vrunO-0002iu-UU
 for xen-devel@lists.xenproject.org; Mon, 16 Feb 2026 09:21:34 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e0b18583-0b18-11f1-b163-2bf370ae4941;
 Mon, 16 Feb 2026 10:21:30 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-43622089851so2708747f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Feb 2026 01:21:30 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796ac8d46sm26459061f8f.32.2026.02.16.01.21.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Feb 2026 01:21:29 -0800 (PST)
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
X-Inumbo-ID: e0b18583-0b18-11f1-b163-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771233690; x=1771838490; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=W81xnfpHRwoMBRiamvuCCJFZJB55LQeDPaRc8bvII1U=;
        b=ENc6pQ//TlTR1hvN/36Z+JNCgieWZPcKQ35RYF7+EVq0voOTuXFJbtuitM7eV0f8NM
         IiTAb8JoeMF32GRRvmySXWgZahWf5m/jy6TJUt4RnudduJ55PfpBx9Cgmur7x86Dfxr8
         4DIzO4VK18/ZMsuGdPSbBZeeT03FGnhCHQtydD/gfeYbmLl+GbPOMwLuDy4GMyOcx/7K
         T10NTtd7RXD9JZR/Iytn7E0S+uJNuHL8hVW8EePrmJXVdb37aPXnUiLeEjgnG/KOsC1G
         M0GqbKkPLx2vOJN+7yOMrm+HpVC8DKhdjWxaJq6UF3hAz0Lp6zU6NMjG2e0qQ5sjXSq0
         5R5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771233690; x=1771838490;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W81xnfpHRwoMBRiamvuCCJFZJB55LQeDPaRc8bvII1U=;
        b=thiIm2r6tn34VjuXmBXf5M0ePSZJRngC3T6t7U2p/UR4h3Dv3QOdPa6Huiagh4lBah
         f8fWvqKVndXDgGgrvsQnQiVOgKAAiJGk+BBGx8bSfAaOmiH9P6GlWzOQqvrLG+chIptv
         Xim4+X7GLnghGii0Ln4p5cUpNh080sF1kycq6avSH+TE7+EL2E5xu4nYKJr62+DNPEYq
         +GgBCG1z8fxSAfgJen069NcaZfml62Fb9CW2l4kNiRxM02rvChltvbGlqfvXpXQDCvjf
         9rAp/zr9gmgfW+SOR83cNBq23onwNtCQvzIBuzH7aLOF9ShTEnRYd6iWh206qKO6vxmU
         yGkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQuSyghC5m6DoMaLRCvI0Qa1HwLuXSlMidVbEZdULTsD73uqNNbeBuLzrtc88LveA0WaxcQhU2RS4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzUW2lQHG6mrHvlOHxpBff4L6/WKOikWhqxms2ZgNftCmZRvlNE
	7o1CH8gu8rOkJBHIM0DDBqTT/TtQMel6wU1P0ZT7FYnijDpjsjfcvLzm07+rUcQlOw==
X-Gm-Gg: AZuq6aKmRJDrJ80j5fWvNVjA4ArZq+qmG+ard4pq+jL0qbTOFSpG8G7c8Oo1zFw3E23
	2S0SnZFykmhbPEtWSatwPSbRy/8GDrS3HYdTDTtDRixb5Imk2L9ecgfMk/cxyZlt/SmgYXRGO2H
	+lcxGp6Uu9YSgMaz7j1ZIIoFp4m8Sgwb481ne7IhSRocZtdVme/wqlM2FjzveQExkKbq3uqAkWp
	BmimkGaQ6kWL1PxD9QOr5DkJj6xgFvb16dx7agVU11BqNXNdio2oz1YVRC5nYQGpfH1gzIEOptn
	9UcUj7MED2cOR+NPWZOV7HSu/gfFlV4I+U1Qzo3YWlWXLnlYaSCmojvpak2CEe8+pngRozNCXmE
	p1tLfrURI8PwQ+hI0u10PAUiQyqoTEVFivjeTyPFCsPmVs/GhsZoq3FUlTw1H7psat7CFwvs9Yz
	QOsqt/SIN9usbk20boi4rC7ziP9LAYepir1ILKXMnYYBfBpWxuPJAsYmQ8NKp6fooweDBFuhi9n
	m9poOI54kdy9C4=
X-Received: by 2002:a05:6000:22c5:b0:437:69c0:9612 with SMTP id ffacd0b85a97d-437978c194cmr18068693f8f.13.1771233689712;
        Mon, 16 Feb 2026 01:21:29 -0800 (PST)
Message-ID: <3bbc408d-d16d-473e-81bf-6ea1f78290af@suse.com>
Date: Mon, 16 Feb 2026 10:21:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: smccc: Preserve argument types in v1.1 SMC
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
References: <0e2ba0af683fa5e53a3d2b4b625703751cf7ce54.1771228001.git.bertrand.marquis@arm.com>
Content-Language: en-US
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
In-Reply-To: <0e2ba0af683fa5e53a3d2b4b625703751cf7ce54.1771228001.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bertrand.marquis@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,arm.com:email];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 198CC141EC6
X-Rspamd-Action: no action

On 16.02.2026 08:47, Bertrand Marquis wrote:
> The SMCCC v1.1 inline helper currently forces a1-a4 into
> unsigned long and uses in/out constraints for r0-r3. In
> contrast, a5-a7 are passed with their original types via
> read-only constraints. On arm64 this means a 32-bit signed
> value in a1-a4 is converted to a 64-bit unsigned value, while
> the same value in a5-a7 keeps its signed 32-bit form. For
> example, a negative int in a2 is widened to unsigned long, but
> a negative int in a5 is passed as a 32-bit signed value, so the
> SMC sees different encodings depending on argument position.
> 
> Switch the helper to use typed input registers arg0-arg7
> derived from the call arguments (keeping a0 cast to u32) and
> separate output registers r0-r3. This preserves argument types
> consistently across all positions. Argument evaluation order
> is unchanged, so we do not reintroduce the issue fixed in
> "e00dc325bd9e" ("xen/arm: smccc-1.1: Handle function result as
> parameters").
> 
> This also aligns Xen's SMCCC parameter handling with Linux's type-
> preserving behavior (same externally visible argument handling,
> independent implementation) to avoid surprising differences
> between a1-a4 and a5-a7.
> 
> Current callers (PSCI, SCMI, platform SMC pass-through, OP-TEE,
> and exynos5) pass unsigned values; exynos5 passes an int CPU id
> which should always be > 0.

Reported-by: Andrew ?

> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>  xen/arch/arm/include/asm/smccc.h | 69 +++++++++++++-------------------
>  1 file changed, 27 insertions(+), 42 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/smccc.h b/xen/arch/arm/include/asm/smccc.h
> index 441b3ab65dee..5b30dd57b69d 100644
> --- a/xen/arch/arm/include/asm/smccc.h
> +++ b/xen/arch/arm/include/asm/smccc.h
> @@ -99,87 +99,68 @@ struct arm_smccc_res {
>  #define __count_args(...)                               \
>      ___count_args(__VA_ARGS__, 7, 6, 5, 4, 3, 2, 1, 0)
>  
> -#define __constraint_write_0                        \
> -    "+r" (r0), "=&r" (r1), "=&r" (r2), "=&r" (r3)
> -#define __constraint_write_1                        \
> -    "+r" (r0), "+r" (r1), "=&r" (r2), "=&r" (r3)
> -#define __constraint_write_2                        \
> -    "+r" (r0), "+r" (r1), "+r" (r2), "=&r" (r3)
> -#define __constraint_write_3                        \
> -    "+r" (r0), "+r" (r1), "+r" (r2), "+r" (r3)
> -#define __constraint_write_4    __constraint_write_3
> -#define __constraint_write_5    __constraint_write_4
> -#define __constraint_write_6    __constraint_write_5
> -#define __constraint_write_7    __constraint_write_6
> -
> -#define __constraint_read_0
> -#define __constraint_read_1
> -#define __constraint_read_2
> -#define __constraint_read_3
> -#define __constraint_read_4 "r" (r4)
> -#define __constraint_read_5 __constraint_read_4, "r" (r5)
> -#define __constraint_read_6 __constraint_read_5, "r" (r6)
> -#define __constraint_read_7 __constraint_read_6, "r" (r7)
> +#define __constraint_read_0 "r" (arg0)
> +#define __constraint_read_1 __constraint_read_0, "r" (arg1)
> +#define __constraint_read_2 __constraint_read_1, "r" (arg2)
> +#define __constraint_read_3 __constraint_read_2, "r" (arg3)
> +#define __constraint_read_4 __constraint_read_3, "r" (arg4)
> +#define __constraint_read_5 __constraint_read_4, "r" (arg5)
> +#define __constraint_read_6 __constraint_read_5, "r" (arg6)
> +#define __constraint_read_7 __constraint_read_6, "r" (arg7)
>  
>  #define __declare_arg_0(a0, res)                            \
>      struct arm_smccc_res    *___res = (res);                \
> -    register unsigned long  r0 ASM_REG(0) = (uint32_t)(a0); \
> -    register unsigned long  r1 ASM_REG(1);                  \
> -    register unsigned long  r2 ASM_REG(2);                  \
> -    register unsigned long  r3 ASM_REG(3)
> +    register unsigned long  arg0 ASM_REG(0) = (uint32_t)(a0)
>  
>  #define __declare_arg_1(a0, a1, res)                        \
>      typeof(a1) __a1 = (a1);                                 \
>      struct arm_smccc_res    *___res = (res);                \
> -    register unsigned long  r0 ASM_REG(0) = (uint32_t)(a0); \
> -    register unsigned long  r1 ASM_REG(1) = __a1;           \
> -    register unsigned long  r2 ASM_REG(2);                  \
> -    register unsigned long  r3 ASM_REG(3)
> +    register unsigned long  arg0 ASM_REG(0) = (uint32_t)(a0);\
> +    register typeof(a1)     arg1 ASM_REG(1) = __a1

Is it intentional that you switch to typeof() rather than directly going
to auto? This was it'll be more churn, aiui. And if deliberately going
only half a step, perhaps worth saying so in the description?

Jan

