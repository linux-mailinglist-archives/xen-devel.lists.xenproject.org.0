Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7582BA23265
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2025 18:04:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879724.1289938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdXxo-0003yn-03; Thu, 30 Jan 2025 17:04:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879724.1289938; Thu, 30 Jan 2025 17:04:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdXxn-0003wV-Tl; Thu, 30 Jan 2025 17:04:23 +0000
Received: by outflank-mailman (input) for mailman id 879724;
 Thu, 30 Jan 2025 17:04:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zr8Z=UW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tdXxl-0003wP-Ln
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2025 17:04:21 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3eb98a5e-df2c-11ef-99a4-01e77a169b0f;
 Thu, 30 Jan 2025 18:04:19 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5d414b8af7bso2009121a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jan 2025 09:04:19 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dc72404537sm1351473a12.35.2025.01.30.09.04.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2025 09:04:18 -0800 (PST)
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
X-Inumbo-ID: 3eb98a5e-df2c-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738256659; x=1738861459; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PC47WVyukDJfXb7iaySshoMITKzOO/itxgUqAubfeXc=;
        b=IarxStwS/XIoBMGgNPbWTiMrKIZ+8jzelX7aO7FGUT3ivsTfdK+2AffVrFgCl8nw3J
         a9k134QdZT0j2yLdkPamAnp0OdriUuwcw7JlGLzRhVfGfK9z891bGXZmm2QWWy8BlVKP
         XeFhiBMEXDwf+eM+ogUvq3Zwr/3KV6GIOS0RuBI8hUv7oNhlaszB5CJ/jiJL+LSStZpK
         QHg/QYiK6xZ1P4jok2wSvX/JFdQCECD674/B9VNuqqbyBZgfHUEIq9vj2q+GON/BqJ82
         wNl/i6B7zELSysfRoPwZt67JBvh1MjYYMRrOxdDhzi53//tFSJHsAMMcE+oR9YJE53dA
         WcPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738256659; x=1738861459;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PC47WVyukDJfXb7iaySshoMITKzOO/itxgUqAubfeXc=;
        b=b5YEsizEe+5GUUcFbrgzkvwd7OFQn5Tz69uDh6Yxjloqx/rGM7s/VJzjvk9nl4LxAU
         mxYOQc2c9Et/rK/UPg4+SKl0Np2VfuCox2pzoXLkhBU9QsA5EUZUm41NIH7LADAdBZuj
         urfwJhp7/kZLLbWYnlqq3mekZTFC6zzbIZ90aQwevcNpiyplyBrE6MaR0Mky3F1GGaMh
         CxdpR29Oa1hT7m11a4GNVH5gL9rJZDgMevEZy/z602m6ctgRpmMNhk6zQmFqdrItoh+G
         yOBMfNnpTg9ppudTALSO2sxVVXPCXu8tNa4kedBjIW1WeV+1IlIJ7AmIx2kHT6uwWZB0
         tu1g==
X-Forwarded-Encrypted: i=1; AJvYcCUK5+ci0qZg7qjuS6zCepCuhFCopAkCCMJHLc/39naZKmCuukaKje758eE3vz0KOhBUM52awc7kB1s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxOzYH7mlX4s/Uy4fbmuw5wH2oxfeeFwgHoAqSzVGqq990HQ29f
	QLZiLTTjmg+Ph30IQHUgqPccbnJBGsD74iLyqfEoIDj0bNGvDvlBlhCl+oOqFw==
X-Gm-Gg: ASbGncubzjtFqYlavkaHLmYsZy20YyLG8ILlPB2b7gZIfEYl4Kjpk24az9hN7lbfSdy
	rmesQcJWvkeWTOaL1vT3qq2hsxTaQZ42Yusz9H+/Mbx4vcq6xt3+WC7uEJqScrlf+oIWuYQEI2T
	y8qn11khbCSqln1p+Yhj91dBvANsFZ6uCACdRGf6VBwlbpIZjFdwW3t+thJmqbQHlJuH0WwBzfV
	DMaITFtG2txi/riIk3ZMTBKemsnDE3y8gq+3GWTbmBD1d2V9NSTsXh5MIE5JIAkAKbZKe+gWW6r
	8rOh6/FC7ZO8S3c+qIz9aLs/qmkE+C554f8qiRiIyvE449Hyyj7abLkm+iUplhtlma3hSlWUHLM
	h
X-Google-Smtp-Source: AGHT+IHX4RrZ/YQf7/2vnz5JmKaTw6yyPmnpPjqbCFDKmTkPhVVt1Lh4C62dX9pGdoxrNh6ix4W7xQ==
X-Received: by 2002:a05:6402:2812:b0:5d3:ba42:e9f4 with SMTP id 4fb4d7f45d1cf-5dc5f00850fmr8323957a12.23.1738256659124;
        Thu, 30 Jan 2025 09:04:19 -0800 (PST)
Message-ID: <9282f971-a500-4c05-b99b-c7bae72709ff@suse.com>
Date: Thu, 30 Jan 2025 18:04:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/15] x86/hyperlaunch: add max vcpu parsing of
 hyperlaunch device tree
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241226165740.29812-1-dpsmith@apertussolutions.com>
 <20241226165740.29812-15-dpsmith@apertussolutions.com>
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
In-Reply-To: <20241226165740.29812-15-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.12.2024 17:57, Daniel P. Smith wrote:
> --- a/xen/arch/x86/domain-builder/fdt.c
> +++ b/xen/arch/x86/domain-builder/fdt.c
> @@ -147,6 +147,17 @@ static int __init process_domain_node(
>              bd->max_pages = PFN_DOWN(kb * SZ_1K);
>              printk("  max memory: %ld kb\n", kb);
>          }
> +        else if ( strncmp(prop_name, "cpus", name_len) == 0 )
> +        {
> +            uint32_t val = UINT_MAX;

It's not the first time I see such an initializer, yet it's even more
pronounced here, as the call ...

> +            if ( fdt_prop_as_u32(prop, &val) != 0 )

... is coming right next. If that function succeeds, it surely should
set its output? And if it didn't, you're as hosed with initializer as
you're without.

Jan

