Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A12085B974
	for <lists+xen-devel@lfdr.de>; Tue, 20 Feb 2024 11:47:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683390.1062880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcNeA-0005MK-Ip; Tue, 20 Feb 2024 10:46:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683390.1062880; Tue, 20 Feb 2024 10:46:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcNeA-0005Ko-Fy; Tue, 20 Feb 2024 10:46:46 +0000
Received: by outflank-mailman (input) for mailman id 683390;
 Tue, 20 Feb 2024 10:46:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YSgb=J5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rcNeA-0005Kg-0o
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2024 10:46:46 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56d9420d-cfdd-11ee-8a52-1f161083a0e0;
 Tue, 20 Feb 2024 11:46:44 +0100 (CET)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-512bd533be0so2011006e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 20 Feb 2024 02:46:44 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 t22-20020a7bc3d6000000b0040d5ae2906esm14112971wmj.30.2024.02.20.02.46.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Feb 2024 02:46:44 -0800 (PST)
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
X-Inumbo-ID: 56d9420d-cfdd-11ee-8a52-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708426004; x=1709030804; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dQcOrtuylbWlfTWy7gczAjM/7k/LP7uMPpGxr5wNk0Y=;
        b=YtH/cIdtINxIqOUd7Qw3Y0iV4znWNNHRMRiA3xYX20vCksKkwWUXB0vkVKwjJZztz9
         G9EEBgQrvyxLbgXJzbF4NB1tIW6RnOmXQjzUhLQTORZaVayx3nQBcOc68vMLj2OxaDPn
         +YDKrLm3WkX3tfbTuiC8ZrQUQyALZaIW2YGYDqywJZs0YQXxK0j6mFXHwZHMsaT1Q0hz
         A/jfrm+d9WWoSuFNHZIi4Sn7oT0B/Dx+7mn6Q8lk0d5mudIlW9+oofiyZEZEHgsRus5z
         imieaxNtY1XrxRdLM7RMh5Ct3vHlcUjyGHcAcb4WEaOv3mElKAcr5l/wdufBDSohDs23
         gO/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708426004; x=1709030804;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dQcOrtuylbWlfTWy7gczAjM/7k/LP7uMPpGxr5wNk0Y=;
        b=HJ/fVpBjCrxmV/6rlb4zfwC03Edyii2GBd5XRvtn7nhkcRmf6vPwQ5tWXXl2MX49/Z
         x37uktUZppo7akq2AiJYZhdkAtIvetqdVgTyM1kC7fdXOrc7Jws3FkILx8fPmUrs6Gki
         q3Z4xJAC+fXFfR40aBo/zQvoYvc/J5PIb8W0tQyjhX2MknaRY2NnPxbMKVJDzWkET7Rr
         vkRkc0caTy+099+KII/841IpIpq+tGY8JeS/GOBZ9QEpVbwaEiQYRD7IP3vtEpDBp57v
         sOrVpaagbi/rUWcKcOO4NIE4n8F4sHlYs5j9pdBZ80PeyyXHs3W6cKCq1gIYCM86DINs
         jAsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrXcqhv2gExU7tCJejdMWCpw3TkCM91nWb9GXPdLO8HG2GVv41K/yJXfah5K5dX0PuKCUWxH7hFu+T5+aL9Ki2Y/Qh1rFT/ZSelc3TYHE=
X-Gm-Message-State: AOJu0Yx1LoDcMVOJbiI5FlfSSig26YoGFgOIJLnuVCYedYeSOGOJUpg7
	3/F8XD5ZyEcETBjX+Xyu0Mui9s7uFKlV6f5c8588WfdYKcRGfEo572POipFDDw==
X-Google-Smtp-Source: AGHT+IEnOfoAYwiGeiHYmc7AhHgRvCnVWzG9BwbqYNLwlhWn8jA0qa/qXNLLcOOqDAkxrhACkecOEw==
X-Received: by 2002:a05:6512:3f10:b0:512:b57d:10da with SMTP id y16-20020a0565123f1000b00512b57d10damr3349218lfa.19.1708426004469;
        Tue, 20 Feb 2024 02:46:44 -0800 (PST)
Message-ID: <1ff19cb2-851d-40cf-bb12-5b7074eee0b8@suse.com>
Date: Tue, 20 Feb 2024 11:46:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 (resend) 11/27] x86: Lift mapcache variable to the arch
 level
Content-Language: en-US
To: Elias El Yandouzi <eliasely@amazon.com>
Cc: julien@xen.org, pdurrant@amazon.com, dwmw@amazon.com,
 Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Wei Wang <wawei@amazon.de>, Hongyan Xia <hongyxia@amazon.com>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
References: <20240116192611.41112-1-eliasely@amazon.com>
 <20240116192611.41112-12-eliasely@amazon.com>
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
In-Reply-To: <20240116192611.41112-12-eliasely@amazon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.01.2024 20:25, Elias El Yandouzi wrote:
> From: Wei Liu <wei.liu2@citrix.com>
> 
> It is going to be needed by HVM and idle domain as well, because without
> the direct map, both need a mapcache to map pages.
> 
> This only lifts the mapcache variable up. Whether we populate the
> mapcache for a domain is unchanged in this patch.

Is it? I wonder because of ...

> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -843,6 +843,8 @@ int arch_domain_create(struct domain *d,
>  
>      psr_domain_init(d);
>  
> +    mapcache_domain_init(d);
> +
>      if ( is_hvm_domain(d) )
>      {
>          if ( (rc = hvm_domain_initialise(d, config)) != 0 )
> @@ -850,8 +852,6 @@ int arch_domain_create(struct domain *d,
>      }
>      else if ( is_pv_domain(d) )
>      {
> -        mapcache_domain_init(d);
> -
>          if ( (rc = pv_domain_initialise(d)) != 0 )
>              goto fail;
>      }

... this and ...

> --- a/xen/arch/x86/domain_page.c
> +++ b/xen/arch/x86/domain_page.c
> @@ -82,11 +82,11 @@ void *map_domain_page(mfn_t mfn)
>  #endif
>  
>      v = mapcache_current_vcpu();
> -    if ( !v || !is_pv_vcpu(v) )
> +    if ( !v )
>          return mfn_to_virt(mfn_x(mfn));

... this and yet more changes indicating otherwise.

Yet if which domains have a mapcache set up is already changed here, I
wonder whether the idle domain shouldn't be taken care of here as well.

Jan

