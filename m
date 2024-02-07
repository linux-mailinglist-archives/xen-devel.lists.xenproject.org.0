Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F148484C8C8
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 11:39:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677359.1053909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXfL4-0001mC-H9; Wed, 07 Feb 2024 10:39:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677359.1053909; Wed, 07 Feb 2024 10:39:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXfL4-0001jw-EI; Wed, 07 Feb 2024 10:39:34 +0000
Received: by outflank-mailman (input) for mailman id 677359;
 Wed, 07 Feb 2024 10:39:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EHwQ=JQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rXfL2-0001jU-QQ
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 10:39:32 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ce76f7e-c5a5-11ee-8a49-1f161083a0e0;
 Wed, 07 Feb 2024 11:39:31 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4101fc00832so29125e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 02:39:31 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 q18-20020a05600c46d200b0040ff2933959sm1659650wmo.7.2024.02.07.02.39.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Feb 2024 02:39:30 -0800 (PST)
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
X-Inumbo-ID: 2ce76f7e-c5a5-11ee-8a49-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707302370; x=1707907170; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WT0YfbOyND1R+V/f2LYn++s/QuD8BooAGB1/mezQFbQ=;
        b=Yjs/YblvLAZAO6JM7bj9bMpsYmY+k+XHktbjxmnHLy98KrOnnG5Z2H0RBX19DL2/oY
         OG9fyHfRMxcgjUtqKENYkgGQau1KM//311ajnwNfiSWBl4xCcFfNEI3MxPMHqbzZ9ycW
         ZRP0lvo24WZegyNyDz04SDoNvjEDA6s8fClYwOuFkK9pV3oudEUUGuNFl3MkHc0X1kEn
         Ctn/LGJVEoG9y1G0R/uYIrSjQ8mLsGh/IfWglocNUPHbE9q57Ir6OkEt+iKR6eqggcd0
         cTmD3lNtYeFLktuf0u6Kc8pEKsxm27hV90CNqw3J166FmimaO+xrPL3P/yOueBq3qWp+
         S2Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707302370; x=1707907170;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WT0YfbOyND1R+V/f2LYn++s/QuD8BooAGB1/mezQFbQ=;
        b=lDaZGk9YdYGV+YYFLCSZ4XE5pLfPTwJWzlHhugnfg/ZtSV1V90bu8Do7Sk7GZiBGiC
         h/kXdINQ9b8OwTmXAoA/27ovDrMXQkUjgltQUoc/p5Su45OaZh9a2Hoc8iQCDaRZvlHH
         J/yQ5GcKWp5lWjSa15h6GwE5mnb+1AbZ4qrsor77SWkxgwVjvYE8K2TVmMYgkBVy/XdW
         f7z4Z2P+7E7wa9YY2J5VK5amYJ6PvsBb1aj4gk7xJ7IZ3uvPxyNZQeHn0b4Y0gtev/C9
         a4G/QrTK1BuTGnSrCW3IaOGC3P5X4d3u3on7glCJheZTvw8zPRzjwKjLl8vtSyu+mYO8
         TiTA==
X-Forwarded-Encrypted: i=1; AJvYcCXVXaZapBjW3jcByiXbKE+Rym90X8e1MjkYp/XpXXc0mkv8+7nlBHSAsMvB7fofu5wNH4KrMquAxF6dgRwxaLFKaP5sPzyLF8TGEDkbGUk=
X-Gm-Message-State: AOJu0YzqyLP51QF3fcV47OUrmeD35pShEs6w80TQGQsuNJ/iN41vcM+2
	/RucV0NBggiTuVsiwQR9m97iE0JuH/DMITbitmM93ZJ79aSUfqjbZ3ZXa/4fvj/vhSASoOhwxAo
	=
X-Google-Smtp-Source: AGHT+IEPVrLZc7pb1qrYFWrkO/5oBB5XuvZfLjlscw3zYHX7FvhClmgJXGZQhs3J8Ywd6Sy7kkflmQ==
X-Received: by 2002:a05:600c:511f:b0:40e:d425:85a with SMTP id o31-20020a05600c511f00b0040ed425085amr4155663wms.17.1707302370449;
        Wed, 07 Feb 2024 02:39:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXgAH1rCCulBF6TxhZN0zix0vD42yIbGoFuIh9JlsvfBDjN00X3f0Lm0IFysT0GxR6DhhDRRwpRs13J0WOJvXgz7MCeSSM0aEGteBrid7wmkDxCaZPHtcscWOqDSbj27XStGw3b4Kn7eu3tXvm4TVvu0cnYzcyp/axwf+xyTA==
Message-ID: <6ba32907-2d35-4dcf-ba3b-409984f1d877@suse.com>
Date: Wed, 7 Feb 2024 11:39:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Mini-OS: x86: zero out .bss segment at boot
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: samuel.thibault@ens-lyon.org, wl@xen.org,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org
References: <20240207103138.26901-1-jgross@suse.com>
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
In-Reply-To: <20240207103138.26901-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.02.2024 11:31, Juergen Gross wrote:
> --- a/arch/x86/setup.c
> +++ b/arch/x86/setup.c
> @@ -184,6 +184,8 @@ arch_init(void *par)
>  {
>  	static char hello[] = "Bootstrapping...\n";
>  
> +	memset(&__bss_start, 0, &_end - &__bss_start);

Doesn't / shouldn't the loader guarantee this? I ask in particular
because doing this here implies earlier assembly code may not write
to any variable in .bss (nothing like that looks to exist right now,
but who knows what may be added at some point).

> --- a/include/mm.h
> +++ b/include/mm.h
> @@ -46,6 +46,8 @@
>  #define round_pgdown(_p)  ((_p) & PAGE_MASK)
>  #define round_pgup(_p)    (((_p) + (PAGE_SIZE - 1)) & PAGE_MASK)
>  
> +extern char _text, _etext, _erodata, _edata, _end, __bss_start;

Maybe use the more conventional array form? Thus also eliminating
the need for & at the use sites?

Jan

