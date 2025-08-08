Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D97B1E20D
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 08:17:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1074032.1436737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukGPJ-0007w0-7o; Fri, 08 Aug 2025 06:16:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1074032.1436737; Fri, 08 Aug 2025 06:16:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukGPJ-0007st-4b; Fri, 08 Aug 2025 06:16:49 +0000
Received: by outflank-mailman (input) for mailman id 1074032;
 Fri, 08 Aug 2025 06:16:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=illN=2U=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ukGPH-0007sn-Dl
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 06:16:47 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4227adfe-741f-11f0-b898-0df219b8e170;
 Fri, 08 Aug 2025 08:16:45 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-af93381a1d2so297798666b.3
 for <xen-devel@lists.xenproject.org>; Thu, 07 Aug 2025 23:16:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0753f9sm1442856666b.20.2025.08.07.23.16.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Aug 2025 23:16:42 -0700 (PDT)
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
X-Inumbo-ID: 4227adfe-741f-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754633805; x=1755238605; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZS60Uo2sFNWjxbmJGMlyR/21UXwOhQn9J3EviXRfFMQ=;
        b=dTGMul0R8wMaYeamiGsTZeiO8hOCqz785W2hONlc/0F6mkKxQlBRADRh42fDyq6efR
         lq0TyeZYaijWEm2DTVsKHCFCJyg2Y9zo3oPMksNSA2wxKEKljJ47fSfxyQdpQKq8NYuQ
         rH2hE5i/9tOPJa6MA1kyo0YWpasA82tya8X+nR+2eU875miT16PBtfx4tjhMZcqz9d8V
         lg3rFovBjn5aUFI0r6AkPuA6B3ME2ZpU3G2TunRtPC32PbAsQ5zc3bs5s6Tyz5WIOQOn
         NuwvPhvzwBtEcArqOWEV21Wsxh3BPgXghD5nj/XXuNoHRSUFrufflLYFO4FbwN0IW++r
         nXqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754633805; x=1755238605;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZS60Uo2sFNWjxbmJGMlyR/21UXwOhQn9J3EviXRfFMQ=;
        b=vlkA4SsCEiGcOa95kmp5Q4nSssqoc00Zin1Lk7fpHsvqnMSOfxek3ywVtU3Xz0pesX
         CcoXu/BCmtQeYaMYPcDX1tz3ahsaM7dYko4CNrl0HeHssb/VKYNL0f+H61grofeQQ8Wd
         Smm+vn1UxQj6IDmv+0vVYQPI8nRCMEMGumejgQ2OqVhr53Hr4EGYFHNQib2Birmx0sKE
         4wWw1HCkKpt3tu9JJHyOKQQfeDnwBIj6L580sfJSxzE2zYvlvhHO4BAZMDlq4kutZxnS
         iF+usSEU0yFO+oseT6Czb8X9AL6UgL4kINZINW569vNcQQRfvM0eFIMgdpdmuGmzwtv1
         acjg==
X-Forwarded-Encrypted: i=1; AJvYcCX6BE4XvR16GU+ntklN+Kp2YtJ6qO7YDCd21aX4h3y3Rh5IBpyTIy38AfzhxhwjF3mzCamUpMUVy8o=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzQ/9FmOQGNZ28UVbXaCoa2TA+f0m51tGBF4I35BOiln9Dm20jo
	4b2Ilkk6lFf8BI4Xn0vk/EhECQmX5xD89MoD3IhVKeXLix/GKOkpuk/mOLhi84hiAA==
X-Gm-Gg: ASbGnctU4QPg3WmY1LgiqxG6cURy0KbITvxrTy6J/an/wFVVQxn2j+0Ulan6AfEFc+d
	E9QSATxPWWuvEsNfewwMX+UrUbAJK/0Fv+Rmu47lIwVZ0uw+VZGzJXedEVQwR9CwnhF5QDj+HHt
	GKeOw2I3xmpNI7oRGpxngRNolzWn6RwJHvEFuaS6S35lJ98V2AT5b0v+eSZeLxl+c4/2hXqoJqe
	srcELK/SfCe1RovH7BAZhrJFcNr9dLPoj4hMA+kxOgqyizH0PJ8oTdmJy5sxjSVp7AFmwsLIrct
	N6/0ye2G0H1KGfVrgyxi9QKGUuWvZwucjtBM2m5e7Ex+VXI9hY0LNMCkcTy1u47lM6ULRE/DzGD
	eTzgLLAGIh3q7bsdy6hVeqbRRixNyqYK33MSCW9YK
X-Google-Smtp-Source: AGHT+IELrwjx5Giwps2KtMXrkboo7Rc8fb347vTgghjcfjn76CRv9gOyT/bmhoOGKXG5dw0Z9PnMtQ==
X-Received: by 2002:a17:907:1c98:b0:af9:57ae:dbb3 with SMTP id a640c23a62f3a-af9c6375f2fmr148678366b.22.1754633802737;
        Thu, 07 Aug 2025 23:16:42 -0700 (PDT)
Message-ID: <d0d09d33-669f-4e38-8e9b-4131ca7c3e79@suse.com>
Date: Fri, 8 Aug 2025 08:16:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/20] xen/arm: vIOMMU: add generic vIOMMU framework
To: Milan Djokic <milan_djokic@epam.com>
Cc: Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1754580687.git.milan_djokic@epam.com>
 <87b001cfc0555192435967b32190f75783ffa746.1754580688.git.milan_djokic@epam.com>
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
In-Reply-To: <87b001cfc0555192435967b32190f75783ffa746.1754580688.git.milan_djokic@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.08.2025 18:59, Milan Djokic wrote:
> --- a/xen/drivers/passthrough/Kconfig
> +++ b/xen/drivers/passthrough/Kconfig
> @@ -35,6 +35,12 @@ config IPMMU_VMSA
>  	  (H3 ES3.0, M3-W+, etc) or Gen4 SoCs which IPMMU hardware supports stage 2
>  	  translation table format and is able to use CPU's P2M table as is.
>  
> +config VIRTUAL_IOMMU
> +	bool "Virtual IOMMU Support (UNSUPPORTED)" if UNSUPPORTED
> +	default n

Nit: Please omit this redundant line.

Jan

