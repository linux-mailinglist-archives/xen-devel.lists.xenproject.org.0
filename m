Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E962388FD13
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 11:32:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698879.1091097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpn32-0000q1-Rt; Thu, 28 Mar 2024 10:31:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698879.1091097; Thu, 28 Mar 2024 10:31:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpn32-0000nV-OU; Thu, 28 Mar 2024 10:31:52 +0000
Received: by outflank-mailman (input) for mailman id 698879;
 Thu, 28 Mar 2024 10:31:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JFXD=LC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rpn31-0000nN-OK
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 10:31:51 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62dbac19-ecee-11ee-afe3-a90da7624cb6;
 Thu, 28 Mar 2024 11:31:50 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a2f22bfb4e6so104271366b.0
 for <xen-devel@lists.xenproject.org>; Thu, 28 Mar 2024 03:31:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ak1-20020a170906888100b00a465a012cf1sm598928ejc.18.2024.03.28.03.31.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Mar 2024 03:31:49 -0700 (PDT)
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
X-Inumbo-ID: 62dbac19-ecee-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711621909; x=1712226709; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LOW53gfE3J0/0vkEIoMTDRz8bYw/nTWL30X2lKEyJTc=;
        b=HFjXUW92Qp+Op6HCLCEr/dE4nwcyzPLDkkxI9ynAyXy1hCH64vVMpr18BW9GtfrMdS
         ZObeAVXXZJgzGJeazrTvF+hndbVavypZLx9eSCZ2M+QCfRUQxwCicdAm2qjjvNo3+07w
         X7BOk5CvKgBIaDxeJFinI/IWJQfEYK2CHKXDWNFJ/GOQnRYN5YpATS/RFsmFQ+ADP0YX
         fPUcOii/nfUweD41eZzQ7yLe7XRyH9rBQMLWi82Yi9n0v11yTvJOiRAxXzsHuAu0valR
         /JGAvdZnB6mB5PGtomlryGGkMSlTvfJ6Y7qLglAarDjw94uyb02GVZ8UKgGYnubL1RRm
         Vazw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711621909; x=1712226709;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LOW53gfE3J0/0vkEIoMTDRz8bYw/nTWL30X2lKEyJTc=;
        b=GM1d+t9BLEfuKSmIlKGiZjuHXm21SVwMUsAq1n7O4mSsKd7sgv9JexthKQhMNVrDpK
         yzg0o1GIfi0Z1e4O1wd8OnDCO20zItjAc8yomBogI6phnfA4ez9TmKz5w/PCUjSIcLve
         d9FlrCbEy220VgxfYfeg9zWdv6OT34f1OIb7h23eKX9SGQ7R5DiGu4MJyIkNAGIla07m
         kkIQ5h2DKO8VwuaSuR70KumUTRd4S91sp2aCgggavN/bQR9XtNB2LQc2ib/Wgsvpabjk
         99oTbntyy+VJoJNUzR+rlseu0iDYyEd9hLlTGsoDc7k9V9j7jOfSbPF+aFxhhbRsOODb
         IWYg==
X-Forwarded-Encrypted: i=1; AJvYcCUxivaob0Rn8xd9drrylaecr3q7aFfMnQpfKStktJutV4S17T3OLAq19YtpUjlleln90n0JWgY2hv+rkQOcd/peit/oCYom16m6h1TmzUc=
X-Gm-Message-State: AOJu0Yy2UU6yxaKK1G3nL/KmOebHMzPxg9CrRWdGcDxbAV1oO4G2U1xm
	tG9X0j6QgnIJdAwL+bdWR/08ESrY0iLNF62aMKt269z70GiRrJwbHwkCSQ7cQQ==
X-Google-Smtp-Source: AGHT+IGoL7hzx3sDii5xVzrVhQfqMLBAtTIN778HUccwBr71cx85QRIiCo3iOEQTxjnSkvmx0KtZ/w==
X-Received: by 2002:a17:907:97c5:b0:a4d:f9af:a749 with SMTP id js5-20020a17090797c500b00a4df9afa749mr1664472ejc.34.1711621909545;
        Thu, 28 Mar 2024 03:31:49 -0700 (PDT)
Message-ID: <aa78458b-c106-41fd-bb7b-c088e7a74fdf@suse.com>
Date: Thu, 28 Mar 2024 11:31:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 2/2] MISRA C Rule 20.7 states: "The features of
 `<stdarg.h>' shall not be used"
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1711621080.git.simone.ballarin@bugseng.com>
 <97008d1b28eb922b3c0041830b09e827396aa0ec.1711621080.git.simone.ballarin@bugseng.com>
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
In-Reply-To: <97008d1b28eb922b3c0041830b09e827396aa0ec.1711621080.git.simone.ballarin@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.03.2024 11:29, Simone Ballarin wrote:
> The Xen community wants to avoid using variadic functions except for
> specific circumstances where it feels appropriate by strict code review.

In the title, s/20.7/17.1/ I suppose?

Jan

> Functions hypercall_create_continuation and hypercall_xlat_continuation
> are internal helper functions made to break long running hypercalls into
> multiple calls. They take a variable number of arguments depending on the
> original hypercall they are trying to continue.
> 
> Add SAF deviations for the aforementioned functions.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> 
> ---
> Changes in v3:
> - rebase: change SAF-3-safe to SAF-4-safe.
> Changes in v2:
> - replaced "special hypercalls" with "internal helper functions".
> ---
>  docs/misra/safe.json     | 8 ++++++++
>  xen/arch/arm/domain.c    | 1 +
>  xen/arch/x86/hypercall.c | 2 ++
>  3 files changed, 11 insertions(+)
> 
> diff --git a/docs/misra/safe.json b/docs/misra/safe.json
> index d361d0e65c..fe2bc18509 100644
> --- a/docs/misra/safe.json
> +++ b/docs/misra/safe.json
> @@ -36,6 +36,14 @@
>          },
>          {
>              "id": "SAF-4-safe",
> +            "analyser": {
> +                "eclair": "MC3R1.R17.1"
> +            },
> +            "name": "Rule 17.1: internal helper functions made to break long running hypercalls into multiple calls.",
> +            "text": "They need to take a variable number of arguments depending on the original hypercall they are trying to continue."
> +        },
> +        {
> +            "id": "SAF-5-safe",
>              "analyser": {},
>              "name": "Sentinel",
>              "text": "Next ID to be used"
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index f38cb5e04c..34cbfe699a 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -382,6 +382,7 @@ unsigned long hypercall_create_continuation(
>      const char *p = format;
>      unsigned long arg, rc;
>      unsigned int i;
> +    /* SAF-4-safe allowed variadic function */
>      va_list args;
>  
>      current->hcall_preempted = true;
> diff --git a/xen/arch/x86/hypercall.c b/xen/arch/x86/hypercall.c
> index 01cd73040d..133e9f221c 100644
> --- a/xen/arch/x86/hypercall.c
> +++ b/xen/arch/x86/hypercall.c
> @@ -31,6 +31,7 @@ unsigned long hypercall_create_continuation(
>      const char *p = format;
>      unsigned long arg;
>      unsigned int i;
> +    /* SAF-4-safe allowed variadic function */
>      va_list args;
>  
>      curr->hcall_preempted = true;
> @@ -115,6 +116,7 @@ int hypercall_xlat_continuation(unsigned int *id, unsigned int nr,
>      struct cpu_user_regs *regs;
>      unsigned int i, cval = 0;
>      unsigned long nval = 0;
> +    /* SAF-4-safe allowed variadic function */
>      va_list args;
>  
>      ASSERT(nr <= ARRAY_SIZE(mcs->call.args));


