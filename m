Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2261C8458EE
	for <lists+xen-devel@lfdr.de>; Thu,  1 Feb 2024 14:32:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674420.1049300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVXAr-0004Vt-Aj; Thu, 01 Feb 2024 13:32:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674420.1049300; Thu, 01 Feb 2024 13:32:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVXAr-0004TV-7D; Thu, 01 Feb 2024 13:32:13 +0000
Received: by outflank-mailman (input) for mailman id 674420;
 Thu, 01 Feb 2024 13:32:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFwQ=JK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rVXAq-0004Sp-Ew
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2024 13:32:12 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4d5c9c05-c106-11ee-98f5-efadbce2ee36;
 Thu, 01 Feb 2024 14:32:10 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a363961b96aso116845466b.3
 for <xen-devel@lists.xenproject.org>; Thu, 01 Feb 2024 05:32:10 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ty8-20020a170907c70800b00a353d1a19a9sm6117061ejc.191.2024.02.01.05.32.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Feb 2024 05:32:09 -0800 (PST)
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
X-Inumbo-ID: 4d5c9c05-c106-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706794330; x=1707399130; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HSbL1ahC/OCghSLFI8J5zchzx+wbFweFqGoB6NFWkk0=;
        b=Ljpcmgj0HULTlfTyQ9R7Ih1X+PniRoaty+B++Yx+LI51aO6024FMTqKoSrInPRokTt
         kjdwW0BfWxuOB0i5nzV3jLF2GR6ZePD7PV56YiZLwRGVCEQrzHdDpnhCKVLqSPLqUavp
         4oEmgxRweQTatxB7ZtiHl6mDj9WD0rLaTTzTnhTFcv0RatWDl6rUJLNxBlxRL3j15voc
         CKsiXH9kKuMVTQXdFFCnIQ6A8A6pu4FVlq96BM2tyJTx5BUvHrASSb54MCyXQeCzEy5I
         lKx43WGf5+GCYKgm96E6B8QLie6VfQomeqtjI44Z5BJGsEMj4GJoihu5kQBh2WLdL4FG
         TnKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706794330; x=1707399130;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HSbL1ahC/OCghSLFI8J5zchzx+wbFweFqGoB6NFWkk0=;
        b=FxUelkZ8egffsAkwpS8UcrYhtzZE3aXgIaS7tNim1govlgQkPnDNPtq/Memr+WRblb
         KJXr78YBvySGxLd8qEbNEa8uKkakAMxCW5LutUeEqJWrQgdHyAtwEhILjCnkL697gEzo
         5wuCik62CboY0Zu7yVTNb0iRN8HncXCz2y8CynDJSGFi1lZlZbDTQVjJW2nhnWgoXwJp
         vh/evaZJaLmGDcmmSh5oFTltf5r73RYPh59EHVoiWBqpDbPbZCqSm2cLOsB1ZTgEzpE5
         FlxpQCR390kV6tLcyQ1S0A/b08UUlZ/TSB0sZu1QNJ04ktn74uFPuJg5s8aJzDw3RaSE
         1dyQ==
X-Gm-Message-State: AOJu0YxAQ1KCY6tQtgasi3RMSVnar39CBHbKdgndpnuMi3arabTUDi5v
	/o+I8XeS+KfSR+TX1vrj4fRxzDS2daxVKfzkwLLelEB2rc5v/pMHFYGSJzl6nA==
X-Google-Smtp-Source: AGHT+IEYlUuzvJFTDcaly8PjGRwlnOCmuFO1sYrOi/L1Dkaf3e95uQwbB+VihWBnrzyKOJ2wIBdaLQ==
X-Received: by 2002:a17:906:c78b:b0:a33:1d7d:912f with SMTP id cw11-20020a170906c78b00b00a331d7d912fmr4014306ejb.8.1706794330225;
        Thu, 01 Feb 2024 05:32:10 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUXS1Fst4W2B5k+letico01XszACO8b/dq/eXMxAKOsAT/y74D9/t8FH9vpIIg9fhsm6aUhaYGsfyFUcqdE0mZ5Z3gdSPIqIE+8px36tptwSre2bO7nByoFXGPHc5er9fBy4t3Bu7vy26112MA+XewsIM0NTjW7J1/LcojUbRYoLJ2fSLOhN14JCaB9yuZvQufBYG96/mzei2KN2q21ehXCpViGMMMG/wRew2Amr89uPNVQ/x5hdfLinkAyg18ixRbcArcBMc2pKNdhCCqdS1qWW5OswPWE
Message-ID: <5e309560-51a8-4b9a-962d-819470375f62@suse.com>
Date: Thu, 1 Feb 2024 14:32:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/15] xen/common: add cache coloring common code
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: andrea.bastoni@minervasys.tech, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Marco Solieri <marco.solieri@minervasys.tech>,
 xen-devel@lists.xenproject.org
References: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
 <20240129171811.21382-2-carlo.nonato@minervasys.tech>
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
In-Reply-To: <20240129171811.21382-2-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.01.2024 18:17, Carlo Nonato wrote:
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -626,6 +626,11 @@ struct domain
>  
>      /* Holding CDF_* constant. Internal flags for domain creation. */
>      unsigned int cdf;
> +
> +#ifdef CONFIG_LLC_COLORING
> +    unsigned const int *llc_colors;
> +    unsigned int num_llc_colors;
> +#endif
>  };

Btw, at this point flipping the order of the two fields will be more
efficient for 64-bit architectures (consuming a padding hole rather
than adding yet another one).

Jan

