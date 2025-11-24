Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4D6C7F9D0
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 10:27:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1170141.1495222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNSqG-0006AX-2R; Mon, 24 Nov 2025 09:26:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1170141.1495222; Mon, 24 Nov 2025 09:26:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNSqF-00067X-Vs; Mon, 24 Nov 2025 09:26:39 +0000
Received: by outflank-mailman (input) for mailman id 1170141;
 Mon, 24 Nov 2025 09:26:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CeM5=6A=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vNSqE-00067R-SL
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 09:26:38 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa876ac9-c917-11f0-980a-7dc792cee155;
 Mon, 24 Nov 2025 10:26:33 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-477a219dbcaso36887875e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 01:26:33 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477bf1e868bsm180497855e9.4.2025.11.24.01.26.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 01:26:32 -0800 (PST)
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
X-Inumbo-ID: aa876ac9-c917-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763976393; x=1764581193; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mDjyJRdZ8pZYRtWlWjlBbN7rJy8cfnFU74s+/WsGHo8=;
        b=X2DIUsPCz9SZnVBnAM+9SZGTIRHZIZeFyFYNWL1K5WWqsniB32hrvpdPY1JPC1nYrN
         dW3SHuotqsb9wUTqF8eNE8uFxZjIrCd7oItn4mqPjVPycrBmJqNKOqAyqdXUQob5aBC1
         DIXHa2VudlikyLyhktCtNAJyLEA7UtiHvoRAHwuyqX8ImRWfy2v3F7eRYypoM00EzpCI
         B3bZsyoYxhmf9u477lqq0q5d7PDvdveSL3CasZqV7Fisso0IczAYNJZUo2ZstZPtZBA5
         1N9WYaOtQ+6AQSnvlVmfq7+1HXac29ycvr6dKmCNj/uFClTGSt6Wa3rPOm6zToWvsmdC
         w/qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763976393; x=1764581193;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mDjyJRdZ8pZYRtWlWjlBbN7rJy8cfnFU74s+/WsGHo8=;
        b=J+XCLsMc9FUjfzFR2p6IGxrPWoVbdulvyvCNYp8M6W6l+767c1zoi9M4mljXcemaBX
         dMVmuiyop+OylcpaQXwoxoUNyp2wZ8RObMwFxifJgfPwgb9FkAzldNqjRrVsnNvfwuIO
         mmMUgmKD6RCg/Cj+KbJeTo2U/os7VrqIKqE7kGcaPLNYT9FFQppolM1T26DxiYaBmktR
         HVk1E1Tkb7qciBw+gANyofyOcMUBoLPw0PCwq5ohKa00A/7y/tcsiDzK39uXv1GLj2iB
         hnZxIn6jlI1D3kO9eIET7drCl6qDG3mJc8C/XN1kYOpAu4R9UB2eIRD6vV7sCxNHd4ob
         4p8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVWoWlIB8YFoFkDryDHBj9cCOHgs3S3uCktbRmey35Pt4tG3Id4iehp5xJCjg4Wy7wHlE+96/+r4xg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxvWZZj3csEQmqZn4QgfuWBLAAGrrfof9jb+rKG7lPjpVfhrw+8
	FxwkiFthfx2peZRoAo1k4B29o2YRtsDco1A8rJXwqhdYbxWl34ED7vZs70v/vdayaksdh7mRMK8
	i11M=
X-Gm-Gg: ASbGncsf2xw2N+ZUtHuPTkhr0iVaQa0+IVnRj5IlXHQUZJfvkHfCQzGcym3ridtigFH
	UCV8+DtHgzt9Ut+ob4fFsFqYcyV5nOCED6jjl14/K7jdxWH8SSAgOR6TlJuiL4SxdDV6krQa6gg
	iR7aXn1BvAeLwwcrHhabegE7Qs15y6Q8dzWhuIZWkUwHxs+CMmXJ8WzCJI8xJnTjnI7JzcNWeN1
	wZBzT6qxAyZeupMMZcXDu9KMEPu5Zx9O80FVwrH1KtNa+ZLr457YmKFYA1fjR9LdOMVqCWjz36o
	wE4VeoxCvS/D+vtKaBdUwYCLWz+AsauNVKsab70T3C5MORIoUPMcDb0nPHZXYuT8TjtoC49su1N
	TkzUxBYVofk/Wfe6WxdtwluwyD7DrJPy859R94qk1BgiFXUXUo2LvliHh2kR4nqcZTEFrT6JYuz
	NUD3i7vASveMAdsZhoHHLFVI1ogGGemvdHeg/inN8UWuQQ9RUrWLAdaSeK/4VaK04XlMJYkG/Lu
	+k=
X-Google-Smtp-Source: AGHT+IFN6q/p2wm/avPQPP+e0G4MFcTx0TCi+HF9pSGKJyKFXPrfklbg5y+WADZlMnkrUBNvLXlNYA==
X-Received: by 2002:a05:600c:1993:b0:477:abea:901c with SMTP id 5b1f17b1804b1-477c0184be0mr104377475e9.11.1763976392506;
        Mon, 24 Nov 2025 01:26:32 -0800 (PST)
Message-ID: <8c8b11c7-ba2c-440c-be2b-86a1ff250e0d@suse.com>
Date: Mon, 24 Nov 2025 10:26:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] libxl_nocpuid.c: fix build with json-c
To: Michael Young <m.a.young@durham.ac.uk>,
 Anthony PERARD <anthony.perard@vates.tech>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <94ffdeb1-6826-4c3a-a9c1-3ccc8b129a61@durham.ac.uk>
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
In-Reply-To: <94ffdeb1-6826-4c3a-a9c1-3ccc8b129a61@durham.ac.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.11.2025 22:09, Michael Young wrote:
> The build of xen-4.21.0 with json-c present and yajl not present
> is failing with the error
> 
> libxl_nocpuid.c:43:1: error: unknown type name ‘yajl_gen_status’
>     43 | yajl_gen_status libxl_cpuid_policy_list_gen_json(yajl_gen hand,
>        | ^~~~~~~~~~~~~~~
> libxl_nocpuid.c:43:50: error: unknown type name ‘yajl_gen’
>     43 | yajl_gen_status libxl_cpuid_policy_list_gen_json(yajl_gen hand,
>        |                                                  ^~~~~~~~
> make[6]: *** 
> [/builddir/build/BUILD/xen-4.21.0-build/xen-4.21.0/tools/libs/light/../../../tools/Rules.mk:178: libxl_nocpuid.o] Error 1
> 
> I tested it with the patch below based on libxl_nocpuid.c which did build.
> 
> Signed-off-by: Michael Young <m.a.young@durham.ac.uk>
> ---
>   tools/libs/light/libxl_nocpuid.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/tools/libs/light/libxl_nocpuid.c 
> b/tools/libs/light/libxl_nocpuid.c
> index 0630959e76..71ab49ed61 100644
> --- a/tools/libs/light/libxl_nocpuid.c
> +++ b/tools/libs/light/libxl_nocpuid.c
> @@ -40,11 +40,24 @@ int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t 
> domid, bool restore,
>       return 0;
>   }
> 
> +#ifdef HAVE_LIBJSONC
> +#ifndef _hidden
> +#define _hidden
> +#endif

Why would this be needed? libxl_internal provides a definition afaics.

> +_hidden int libxl_cpuid_policy_list_gen_jso(json_object **jso_r,

Nor should the attribute be needed here, as the function declaration ought
to be in scope.

> +                                libxl_cpuid_policy_list *pcpuid)
> +{
> +    return 0;
> +}
> +#endif
> +
> +#if defined(HAVE_LIBYAJL)
>   yajl_gen_status libxl_cpuid_policy_list_gen_json(yajl_gen hand,
>                                   libxl_cpuid_policy_list *pcpuid)
>   {
>       return 0;
>   }
> +#endif

Maybe unrelated to this build fix, I find it hard to believe that returning
0 (presumably meaning "success") here is appropriate without actually doing
anything. In particular for the new function you add, I think upon success
the caller can expect *jso_r to have got assigned a value. However, without
any commentary it's hard to tell whether there's some "agreement" that the
caller has to pre-set its variable (to, say, NULL).

Also why are the libxl_..._jso() all hidden, while their libxl_..._json()
counterparts aren't? And why would non-exported functions have their
declarations live in a non-private header?

Jan

