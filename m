Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA3DC9EA69
	for <lists+xen-devel@lfdr.de>; Wed, 03 Dec 2025 11:11:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1176618.1501074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQjpa-0008Vb-Dm; Wed, 03 Dec 2025 10:11:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1176618.1501074; Wed, 03 Dec 2025 10:11:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQjpa-0008U0-B7; Wed, 03 Dec 2025 10:11:30 +0000
Received: by outflank-mailman (input) for mailman id 1176618;
 Wed, 03 Dec 2025 10:11:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kX12=6J=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vQjpZ-0008Sc-8t
 for xen-devel@lists.xenproject.org; Wed, 03 Dec 2025 10:11:29 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c0208a3-d030-11f0-980a-7dc792cee155;
 Wed, 03 Dec 2025 11:11:23 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-47790b080e4so35460865e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Dec 2025 02:11:23 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42e1ca1a2easm39573250f8f.23.2025.12.03.02.11.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Dec 2025 02:11:22 -0800 (PST)
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
X-Inumbo-ID: 6c0208a3-d030-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764756683; x=1765361483; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oNrxV2QThHFro8YEMtPvvoomOVw3KIbRKSrdS7jyeEU=;
        b=JgEr/5D0UlANWy4c5eKaIDZtouU9UCvnNV23uVeq1WAZHedLc98yRk/3GCATKtcClo
         Inr7q4zDbYMVB322kdCmN1Cu1hrTWXkAmhY1yTjNzBn5M5KyUZZocfrvOomOrNyFtZBY
         0r5O7YIDYytt8Um5sBQQKgkumxEmIkd1tISNsFY0KJde3mM0q/BKLeeQ1o9P8gnZyhV+
         xOnCzNfU6Av34/HI/xdVUR+RPmJeguGNt53+bVJPdta19QfBJqo9zctBbkcSdzc5ZtQ2
         PrkYSoQGjrL5MvqeAz4Dj8jsC+mchl7iDYjzVVhCwLLwMH3v2j7A79ktqQvLwf2/m2tT
         BeXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764756683; x=1765361483;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oNrxV2QThHFro8YEMtPvvoomOVw3KIbRKSrdS7jyeEU=;
        b=MzHuVWqhufuRheVbagEW119z/046BoYFx29aG++eIAimffJ79RnQYLzLqX2I0ROzBl
         Vj29pxwp63cbN9B2PJwgK8qYHx7dZhuxpMBWuQgKna3SCh3u5tsrsxBgzCCWO4Wev0Qt
         t9xFKbjkVd1aSfepyj0mpqCkkoLwuoU4rc8f/UJre/LNcfAqDws29fOnOWAkxB20JbZg
         dwT+lXANgbAtM2GAQxs1LvCLz8Fhv7hE1bSplkUue+yJpUBSGtwTauhvMcCb/bHGhVEr
         chQd8ofhkTNIeaMxoIFAi95MTSuClonldJC/hPVrgc/eEL2CO3243wb8dvzxcKqzci+s
         yzEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsaiufwDLTcZOnk0a5IcjHe/oPmxY5sywdkWwB3PBaNZ5Kfyh1bv9h7ddadHFusR+FALu2kqgA8Nk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyFENVmBxHGhLZflixVhhAIHbn5LsPQI8zuxFx7NIenPq72SkZL
	sc4hPqAcWs86opU820bcnXeWn5wjW8rXjDsyrbGY+W6+L9gyzMARH7Sp2Fp2EZt9UQ==
X-Gm-Gg: ASbGncuGj1yBGqaXJQjGSqMnWhpa5av9ZlqKmzIZr3kO22uT2uP2nMdeo4To8V9M1Y9
	oBnGP67shSyd6q5UJyYU279fBL9DjZ5375WvUORiDHOkBz2KQquiCC2ozhn63SyltJQeMaFB8tt
	sQ1J54sR6brDpiNQ5Z9qGYmUWf8C9YII+GTYf6npJ9QdC2nCL1JtNK3AMVDb59ZANEroeKcFc+y
	cgsbzI0r9soYbm+Zx2SIn2YKFpF7CS0aud6dyJHwGpZ4hjrK6A+M3vr2s1b04Lm137w3hcXoftC
	XTqegBk5CAQfLWREhXboPufFyVp1r/n1QZxvB4FOl711gvwPIeRqLwJL0EiS+KUVm4yFYbVQTkT
	n35/YpL7rGDkU/pzyYZB7pgXdO8WYDUaohML/ToZVBWv6q6CSz0K/FGl92yCB9APFxdUQ1XAplr
	uRMuZfjKIxgVr32l4zcF3O+uqXUiqo+clfx1BOLK4U1Sw5M9hDc4jQa6vcyevL88UxqbuMAfYoq
	UY=
X-Google-Smtp-Source: AGHT+IFUHjSNTvJMGijgzA8DXjfvw5UgkYREerNpoqGAspxs6iw86zeY0AtSSZvQmv4Ug7USX793Mw==
X-Received: by 2002:a05:600c:450a:b0:477:b0b8:4dd0 with SMTP id 5b1f17b1804b1-4792af1b10fmr15908325e9.17.1764756683273;
        Wed, 03 Dec 2025 02:11:23 -0800 (PST)
Message-ID: <63ed70d8-ab4c-4b9e-8884-954f8f8194e4@suse.com>
Date: Wed, 3 Dec 2025 11:11:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for
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
 xen-devel@lists.xenproject.org
References: <cover.1764755558.git.xakep.amatop@gmail.com>
 <f05ece00c276187d764c7539142f29ee3c48987c.1764755558.git.xakep.amatop@gmail.com>
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
In-Reply-To: <f05ece00c276187d764c7539142f29ee3c48987c.1764755558.git.xakep.amatop@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.12.2025 10:57, Mykola Kvach wrote:
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -26,6 +26,7 @@
>  #include <xen/hypercall.h>
>  #include <xen/delay.h>
>  #include <xen/shutdown.h>
> +#include <xen/suspend.h>
>  #include <xen/percpu.h>
>  #include <xen/multicall.h>
>  #include <xen/rcupdate.h>
> @@ -1363,6 +1364,9 @@ void domain_resume(struct domain *d)
>  
>      spin_lock(&d->shutdown_lock);
>  
> +    if ( arch_domain_resume(d) )
> +        goto fail;

In case I didn't ask before: You're after a boolean result here, yet ...

> --- /dev/null
> +++ b/xen/include/xen/suspend.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef XEN_SUSPEND_H
> +#define XEN_SUSPEND_H
> +
> +#if __has_include(<asm/suspend.h>)
> +#include <asm/suspend.h>
> +#else
> +static inline int arch_domain_resume(struct domain *d)
> +{
> +    return 0;
> +}
> +#endif

... int is being returned. Why?

Jan

