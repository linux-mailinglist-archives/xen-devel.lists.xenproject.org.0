Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EDC8C636A
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 11:09:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722042.1125859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Ada-0002PM-4D; Wed, 15 May 2024 09:09:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722042.1125859; Wed, 15 May 2024 09:09:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Ada-0002Nb-0T; Wed, 15 May 2024 09:09:26 +0000
Received: by outflank-mailman (input) for mailman id 722042;
 Wed, 15 May 2024 09:09:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EWeN=MS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7AdY-0002NQ-4q
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 09:09:24 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1fb0662-129a-11ef-909d-e314d9c70b13;
 Wed, 15 May 2024 11:09:23 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a59e4136010so139778666b.3
 for <xen-devel@lists.xenproject.org>; Wed, 15 May 2024 02:09:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17b01501sm828618266b.165.2024.05.15.02.09.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 May 2024 02:09:22 -0700 (PDT)
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
X-Inumbo-ID: d1fb0662-129a-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715764162; x=1716368962; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NwWYu6W19dcNsz5ctSGjawhXFHCqIvASoM6FkqWc5nE=;
        b=H244GmrlFlXTpnc4I0ieW+o62Fctc7l+fs8RK44epGkIDaWHifz1WCRrRXEeRUWblw
         VV49JTEymj7kBYpuZu26va2MO1kPUJDI0Lo2RGA3p5u1o5h05O1I++6+X0STZGu3ChH/
         OJ6cQ6WdaK1tP+TrR3V49tqU4WLsNObpCbGbvwacvLwqMjASghWYdcQ/XDpEcWhkhqx3
         k5muj/1cZuUErVaQe5ItTgdow2cuR3YNXqLL4IlCKJC31kE1kt7qmoljK7tnx2ST7ikO
         +equ+T7wCqPtHbmAIHNFyPu1p6SuGZo6PIVzfFxhiJF41kEU3ICTGVD7SNlsfpKwRCdC
         +ntw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715764162; x=1716368962;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NwWYu6W19dcNsz5ctSGjawhXFHCqIvASoM6FkqWc5nE=;
        b=G+E4CCmIYH83oipS6XL8FQ/kEYmBlUKhIIpN1L2uqV+ivzhJ2bMILA8lyYF+VIaYQv
         yeWfwdf0r1qXeKquvb49W7Lgg4p9jnzpvYi9HXfHza9xrM2y2qPVAitFkkfFwPtFGp15
         WDcD10MTD3s+a6p6qW2H1A5VPiU8LaIO2dgxgw8RUkGBtaeE4ia8D5WIjYv28TKe4PqF
         +hWeNA8zllhAzQ950S+C3569w1aMc1wLAZKmCfjvMWz0ByZesXyMUMMKg+tCZukom1MA
         TapPXbHQKM0PuQKjwomFjQL9n3kOBaQU7OuLx1lVZ5oaD/qb6agcXakZuqS23H0l+JWK
         ZM5w==
X-Forwarded-Encrypted: i=1; AJvYcCV4HWQL3Txtp9l6R/ck5F16ywMdDv8eF4zjgjlYtkOBY5gub+je/C+u7AghSnDFQwRJxAGv6HF/nT3uLwTitiney217EkCKouZm2dVoNhc=
X-Gm-Message-State: AOJu0YwFLj075qx3LE/0O3TiRQ9Vux8d+Bh7fNP+oLynXkbeYVu7vMiQ
	GJJ8J9+jX//wTDGxsO4gwvswFdnXaIolYVnxX4u13RSbm3VOSfNQAlkUxmnoqA==
X-Google-Smtp-Source: AGHT+IFwyo9gv1k9D6Y1o2Dg+qJsvqZWAr7/yB+qqiMomzF1EabSOvY5V46Rf4bj7WK19Pp3GhqY+Q==
X-Received: by 2002:a17:906:d207:b0:a59:bacc:b082 with SMTP id a640c23a62f3a-a5a2d65f32fmr910496566b.60.1715764162415;
        Wed, 15 May 2024 02:09:22 -0700 (PDT)
Message-ID: <c16c0554-c376-41f4-bfe8-04c977702a04@suse.com>
Date: Wed, 15 May 2024 11:09:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 03/15] xen/bitops: implement fls{l}() in common logic
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1714988096.git.oleksii.kurochko@gmail.com>
 <fe183f7e8ada7c3fb00ebf9b38f1fffffcc9c2d7.1714988096.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <fe183f7e8ada7c3fb00ebf9b38f1fffffcc9c2d7.1714988096.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.05.2024 12:15, Oleksii Kurochko wrote:
> Changes in V9:
>  - update return type of fls and flsl() to unsigned int to be aligned with other
>    bit ops.

But this then needs carrying through to ...

> --- a/xen/arch/arm/include/asm/arm64/bitops.h
> +++ b/xen/arch/arm/include/asm/arm64/bitops.h
> @@ -22,17 +22,15 @@ static /*__*/always_inline unsigned long __ffs(unsigned long word)
>   */
>  #define ffz(x)  __ffs(~(x))
>  
> -static inline int flsl(unsigned long x)
> +static inline int arch_flsl(unsigned long x)

... e.g. here. You don't want to introduce signed/unsigned mismatches.

Also why do you keep "inline" here, while ...

> --- a/xen/arch/x86/include/asm/bitops.h
> +++ b/xen/arch/x86/include/asm/bitops.h
> @@ -425,7 +425,7 @@ static always_inline unsigned int arch_ffsl(unsigned long x)
>   *
>   * This is defined the same way as ffs.
>   */
> -static inline int flsl(unsigned long x)
> +static always_inline int arch_flsl(unsigned long x)

... you switch to always_inline here?

(replying out of order)

> --- a/xen/arch/arm/include/asm/arm32/bitops.h
> +++ b/xen/arch/arm/include/asm/arm32/bitops.h
> @@ -1,7 +1,7 @@
>  #ifndef _ARM_ARM32_BITOPS_H
>  #define _ARM_ARM32_BITOPS_H
>  
> -#define flsl fls
> +#define arch_flsl fls

It's the Arm maintainers to ultimately judge, but I'd be inclined to suggest

#define arch_flsl arch_fls

instead. That's not only behaviorally closer to what was there before, but
also reduces (a tiny bit) the amount of work the compiler needs to carry out.

Jan

