Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB6EA3B735
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 10:13:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892489.1301457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkg8x-0005ih-Fl; Wed, 19 Feb 2025 09:13:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892489.1301457; Wed, 19 Feb 2025 09:13:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkg8x-0005h8-Av; Wed, 19 Feb 2025 09:13:23 +0000
Received: by outflank-mailman (input) for mailman id 892489;
 Wed, 19 Feb 2025 09:13:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EceQ=VK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tkg8v-0005h2-JU
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 09:13:21 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c279acea-eea1-11ef-9896-31a8f345e629;
 Wed, 19 Feb 2025 10:13:19 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5ded1395213so10543960a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 01:13:19 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dece1b4e3bsm10050347a12.11.2025.02.19.01.13.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2025 01:13:18 -0800 (PST)
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
X-Inumbo-ID: c279acea-eea1-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739956399; x=1740561199; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6Ofu5MAI8//O07z+I/APMySENOGQx38HJUtr22Se2ZQ=;
        b=XjI5RsL0xtBOxuTeBdHFc/7EVk+C9ZhE0k606L5qiLHoSxPLMCgeFnWpzzYqRgaUxP
         OCPAeKSYe/Tva5phnD5fMn07TOew8YLUJlMqgqr7KshqfiOOiXZ1dweyhjLjlmm/TwTY
         F0qHXwvfUBD0cucH7jJyxm3SuuTfix7wdFg+Ke26u8xAu1ENDpt42gklv14zOIabUVco
         oVFM3Iw4vPxOBphLyXQp409c6fnY9fB9EmED8YDCys//71L4cz4Ivk9Vza94yEwsDowB
         MhnUDTpaunT0REVdnmsbJZp2ceTq8zgto9mHEd1I2ZBrq08wuxwT1CHSyosLNfGeDilN
         3/Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739956399; x=1740561199;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Ofu5MAI8//O07z+I/APMySENOGQx38HJUtr22Se2ZQ=;
        b=QcNKRkrqMvxzSZY1v2beFvgS9gn/YuImnKxqL3nxgFhki3kxAmHWH7hkBC1vpO5Bxs
         BFYMyvFp9mFZSnRTrjnE6pFYO2E1bxuuxVfjLfM+hYE7G6a5/x0k4ikK5oqSFFFwmzsL
         NRi8wevvipctn/SqDp4ExNa7BnF/rpePn9KivbiFNahoBV8OmZPqOp/PmfvkTC+InfTr
         5CMYCUffPkZhOS+T5UiFGAlGI4okqRG9/dlWQdA4RrnAfZkkK4V3HR2taHqi1Q9wMtV7
         DvPicqIhvsfDDYu0LLNCEFbs/WJN6aIYacuDp260AZQhssl6Dlb4TgHxY8hozweHb1fn
         +Xdg==
X-Forwarded-Encrypted: i=1; AJvYcCXfxaG9c78lO1MsytRq81MyFX2RKFbOx9U6CKl654KI4gCRv4OSHq8Pv/Jon3K+cyzUoPYdna1htSs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyCktu12wm9tFEjuSNmFnWokuL4ca4p9da+9slNrPSaM+ewAoze
	wIhp86QVwzv4gmMYxvsaRdvSg/kczwM4bdEIzhyq9ClvesdauHfKo19l9UQ6hA==
X-Gm-Gg: ASbGncutB6kp4wg/XG6B6CvIagWF1Ie0T4+E92DzhkP/NAhmFwk+EkFg/0KnaR6HqiJ
	T8Ph4GVx6dywgxgNjAuNk0ScM0c9TxsN/Rhau+EksTq2IKg8DVKjDMpTxs9uuLmOmNvuH9kfdOX
	AbA4iyo3+z1aoftu4syf01igkK5dl9dw0K+9eiW3t9rdgp23/ubiWIKjQjgp4gGSUsCHdmKm5mQ
	U1jOEbO/UWWHd8wqdJg6plVK0whtjxdcVR0m15/oudNOlvo3oVb5pAUJYPFtdsZs+yv+odBPApK
	JPYX+tkXoR+kz7jQIy+oCSwhXHHgjNEQK6UoTe8IjyRkVGUkNmfCbh1vd67BfhzbDc1IR5qkzvS
	p
X-Google-Smtp-Source: AGHT+IH9MTcu+X77uxqn1Wy23rBheN6k3LCj6aezjT0D4hAwcRwJS9XGMCN+gl98uNckIH2N4KWHdQ==
X-Received: by 2002:a05:6402:42d6:b0:5dc:c9ce:b022 with SMTP id 4fb4d7f45d1cf-5e03608c94cmr16820795a12.9.1739956398598;
        Wed, 19 Feb 2025 01:13:18 -0800 (PST)
Message-ID: <b36bd403-8d8f-4ced-8080-4b9fe130d76a@suse.com>
Date: Wed, 19 Feb 2025 10:13:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/11] xen/amd: export processor max frequency value
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>, "Andryuk, Jason"
 <Jason.Andryuk@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250206083255.1296363-1-Penny.Zheng@amd.com>
 <20250206083255.1296363-5-Penny.Zheng@amd.com>
 <5d19f9a6-2be8-4a69-a9c8-19a0e4196e44@suse.com>
 <DM4PR12MB8451598930C730001060B1DEE1FA2@DM4PR12MB8451.namprd12.prod.outlook.com>
 <6200aaee-25cf-4fe1-b71b-b8a0a3798afc@suse.com>
 <DM4PR12MB84519B5C5A16AAD9E695DBCCE1C52@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB84519B5C5A16AAD9E695DBCCE1C52@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.02.2025 08:32, Penny, Zheng wrote:
> I've written the following codes to let amd_log_freq() also adapt for 1a+
> ```
> --- a/xen/arch/x86/cpu/amd.c
> +++ b/xen/arch/x86/cpu/amd.c
> @@ -579,8 +579,7 @@ void amd_log_freq(const struct cpuinfo_x86 *c)
>         unsigned int idx = 0, h;
>         uint64_t hi, lo, val;
> 
> -       if (c->x86 < 0x10 || c->x86 > 0x19 ||
> -           (c != &boot_cpu_data &&
> +       if (c->x86 < 0x10 || (c != &boot_cpu_data &&
>              (!opt_cpu_info || (c->apicid & (c->x86_num_siblings - 1)))))
>                 return;

On what basis do you drop the upper bound here altogether? Is there some
guarantee given somewhere that the MSR layout isn't going to change again?
You also want to pay attention to style (indentation here in particular)
when making such adjustments.

The conditional here also continues to mean the rest of the function won't
normally be executed for all CPUs. Maybe that was intentional, with the
goal of just adding Fam1A support here. Hard to tell without a patch
description.

> @@ -653,21 +652,23 @@ void amd_log_freq(const struct cpuinfo_x86 *c)
>                 wrmsrl(MSR_AMD64_NB_CFG, nbcfg);
>         }
> 
> +#define VALIDATE_FID(v) (c->x86 < 0x19 ? true : ((v & 0xfff) > 0x0f))

Please be sure to parenthesize macro arguments when used in expressions.
Not doing so violates at least one Misra rule. At the same time, seeing
how many parentheses there are already in e.g. FREQ(), please try to
avoid adding excess ones (here and there).

Also, if you add such validation, Wouldn't that be equally needed for e.g.
Fam19 (didn't check others)? Plus if you validate FID there, wouldn't it
be yet more important to validate the divisor, too? (So far we've gone
from the assumption that firmware will put sane values in when setting
PstateEn.)

>         lo = 0; /* gcc may not recognize the loop having at least 5 iterations */
>         for (h = c->x86 == 0x10 ? 5 : 8; h--; )
> -               if (!rdmsr_safe(0xC0010064 + h, lo) && (lo >> 63))
> -                       break;
> +               if (!rdmsr_safe(0xC0010064 + h, lo) && (lo >> 63) && VALIDATE_FID(lo))
> +                               break;
>         if (!(lo >> 63))
>                 return;
> 
> -#define FREQ(v) (c->x86 < 0x17 ? ((((v) & 0x3f) + 0x10) * 100) >> (((v) >> 6) & 7) \
> -                                    : (((v) & 0xff) * 25 * 8) / (((v) >> 8) & 0x3f))
> +#define FREQ(v) (c->x86 > 0x19 ? ((v & 0xfff) * 5) :                                             \
> +                               c->x86 < 0x17 ? ((((v) & 0x3f) + 0x10) * 100) >> (((v) >> 6) & 7) \
> +                               : (((v) & 0xff) * 25 * 8) / (((v) >> 8) & 0x3f))

This is getting unwieldy, I'm afraid. We may need to introduce a helper
function here. Or it would need re-wrapping / re-indentation to become
halfway readable again. Plus can we please arrange things so we handle
families in either consistently ascending order, or consistently
descending one?

Jan

