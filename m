Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F8CB3E71C
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 16:29:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1104983.1455981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut5Wx-0000a4-0r; Mon, 01 Sep 2025 14:29:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1104983.1455981; Mon, 01 Sep 2025 14:29:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut5Ww-0000Xn-UM; Mon, 01 Sep 2025 14:29:10 +0000
Received: by outflank-mailman (input) for mailman id 1104983;
 Mon, 01 Sep 2025 14:29:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UGQU=3M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ut5Wv-0000Xh-1Z
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 14:29:09 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0443ecb8-8740-11f0-8dd7-1b34d833f44b;
 Mon, 01 Sep 2025 16:29:06 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-61e8fe26614so2394227a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 07:29:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cfc1c7caesm7206122a12.9.2025.09.01.07.29.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 07:29:05 -0700 (PDT)
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
X-Inumbo-ID: 0443ecb8-8740-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756736946; x=1757341746; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TzOk6SAA6p957knAbsW86a3TWL0WMTG76ApNaL0LRxg=;
        b=gq7yCcNKfmmugQmIUA88/yUDHuRR2w2BE0GZEFmwWomucVQjMnKE2iQWm+Jmkqlt8F
         wDQ3ne17yvWp0k76N1mAf2xDwznMswtyPwNAyjlBzT38VrBlOnngFyuw5aKq3hi6+C+q
         HZGqfqxmsUzy9kYEK6adFGyFCt/utkw93DuCh2vNZSvoa78XutwzcdhfqA5fF6sZpzy0
         JyBpZvvwD7/uFKjCV8Dp88HUPu9jw3WV9Z3JyBZWZsFpCU0+BB+/QrhzWSvfZD+mUNad
         NXrT7IYIoLAGI5CMQ6AnFqQL/J0IA3bEXUFF6awv4RF5Blf85he0UUKTCW+0Q2BIoLzM
         +bAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756736946; x=1757341746;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TzOk6SAA6p957knAbsW86a3TWL0WMTG76ApNaL0LRxg=;
        b=CZueo4pujn0lSb0tdczm3cEtjyXuDhHluw3WL3VNKVWnAM+SAeiymdOxoVhoQGnr9j
         RugRlqMrJhbJUIcRZ4yVoH1/k5NBMlWYja1HfHXM7tYjazSyVe/g/4t/DhNx+3tuqNir
         jLdcQFdDszzE2qY0zZr8jSyf1e4oCAoFkPPf4ozNFoQZVLix6kZ1tJhV6VTGypXKiM56
         Urd5Wpv+drC88AVZM3TXrP4SKyJzw5G2UJHZiC0qODwIVLQxGBBAZVWfHnQJ4aY6Vg2X
         kH+AzwTCjnI4674ewxewXQInk2wz55JTtQZO6evpV+ASta3r6PHTOUonIM1v1tRvDq+A
         z6dA==
X-Forwarded-Encrypted: i=1; AJvYcCVXHRjXwQ0nSWfLzEPhPq/Pi72bVPKhEpVgxdfPqh0IyEd6ntN/LiWx4VCmk4h7yvWohXLFL5PnyEg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yypp8KNE45i9fGhYf55/irEyZmMjtZmh9Dyxok+8Alf8u6Lvv61
	LLN+dGbAjZNg6pCmJLazZaVAl/uZkSzOSoXCIYqh5DNVxpPCw82PAyaaeMqpDyJGsg==
X-Gm-Gg: ASbGncstfXtJcs92fbHU/grCOEIBAterpeKOaVf4YyeNmI90EX72xMQTxUTS1o1jw2s
	Ef5/rK6VQM5A57ayjfgyFFqAMK99urjQAvoWJ1Fwqc62ZfZQihWMp+J3qre7P/qajPy1v86SxtI
	cNSRZ53pXLSI2IK+mQwjuhFjZ4E+hn9NveMMJeT3hWChfHlTH8PV+G7hQ1+DbZgHNE/5SQklUVl
	oCJ+6vRn3InqCB2BorW2KoExzLqbYfCclndvlthoIAf4fwpNBtY9x8kanX0dFp3O1aUlsraUd8M
	ctZhjiB8bNvl6ek868Jb2jkJhG2UU3EBQ9H9jX8uE2PoT+qk6Bn7zMqWOkVXBMKXat+FBEsJ0kT
	Bn+1ZPDc+IbHK+WBVaap6lHyQBsoqPSf/vctgV2KOGBG5LQFE1f+A+LIp6+23/tWCBr96u7Qlsf
	aAQexhBaevcSf/x4hwNg==
X-Google-Smtp-Source: AGHT+IHomgltNeSgGJ37rb5UidC9NcBbWlBsPq4xhYChXEAovcS5A9yVCJ8PstwNTvYWlvkt32ODjw==
X-Received: by 2002:a05:6402:2714:b0:61d:feb:67fb with SMTP id 4fb4d7f45d1cf-61d26d9c672mr6071722a12.34.1756736946254;
        Mon, 01 Sep 2025 07:29:06 -0700 (PDT)
Message-ID: <80c8dbfe-5240-441d-84fc-603e9c5f9812@suse.com>
Date: Mon, 1 Sep 2025 16:29:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for
 guests
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
References: <cover.1756586648.git.mykola_kvach@epam.com>
 <244e5c2bcebad9563595ac7564ffa105d5f568d3.1756586648.git.mykola_kvach@epam.com>
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
In-Reply-To: <244e5c2bcebad9563595ac7564ffa105d5f568d3.1756586648.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.08.2025 00:10, Mykola Kvach wrote:
> --- a/xen/arch/ppc/stubs.c
> +++ b/xen/arch/ppc/stubs.c
> @@ -224,6 +224,11 @@ void arch_domain_creation_finished(struct domain *d)
>      BUG_ON("unimplemented");
>  }
>  
> +int arch_domain_resume(struct domain *d)
> +{
> +    return 0;
> +}
> +
>  int arch_set_info_guest(struct vcpu *v, vcpu_guest_context_u c)
>  {
>      BUG_ON("unimplemented");
> diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
> index 1a8c86cd8d..52532ae14d 100644
> --- a/xen/arch/riscv/stubs.c
> +++ b/xen/arch/riscv/stubs.c
> @@ -198,6 +198,11 @@ void arch_domain_creation_finished(struct domain *d)
>      BUG_ON("unimplemented");
>  }
>  
> +int arch_domain_resume(struct domain *d)
> +{
> +    return 0;
> +}
> +
>  int arch_set_info_guest(struct vcpu *v, vcpu_guest_context_u c)
>  {
>      BUG_ON("unimplemented");
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index 19fd86ce88..94a06bc697 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -1138,6 +1138,11 @@ void arch_domain_creation_finished(struct domain *d)
>          hvm_domain_creation_finished(d);
>  }
>  
> +int arch_domain_resume(struct domain *d)
> +{
> +    return 0;
> +}
> +
>  #ifdef CONFIG_COMPAT
>  #define xen_vcpu_guest_context vcpu_guest_context
>  #define fpu_ctxt fpu_ctxt.x

I definitely don't like this redundancy, and even less so that you introduce out-
of-line calls.

> --- a/xen/include/xen/domain.h
> +++ b/xen/include/xen/domain.h
> @@ -109,6 +109,8 @@ int arch_domain_soft_reset(struct domain *d);
>  
>  void arch_domain_creation_finished(struct domain *d);
>  
> +int arch_domain_resume(struct domain *d);

I think this wants to move to a per-arch header, presence of which is checked by
has_include(), with an inline fallback define once centrally here.

Jan

