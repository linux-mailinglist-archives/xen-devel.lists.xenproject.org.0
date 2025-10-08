Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D277ABC5EF8
	for <lists+xen-devel@lfdr.de>; Wed, 08 Oct 2025 18:04:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1139978.1475147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6Wea-00061l-Dz; Wed, 08 Oct 2025 16:04:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1139978.1475147; Wed, 08 Oct 2025 16:04:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6Wea-0005z6-98; Wed, 08 Oct 2025 16:04:36 +0000
Received: by outflank-mailman (input) for mailman id 1139978;
 Wed, 08 Oct 2025 16:04:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eGu8=4R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v6WeZ-0005z0-88
 for xen-devel@lists.xenproject.org; Wed, 08 Oct 2025 16:04:35 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a24de92-a460-11f0-9d15-b5c5bf9af7f9;
 Wed, 08 Oct 2025 18:04:32 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-421b93ee372so49388f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 08 Oct 2025 09:04:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b48652ad839sm1685547766b.1.2025.10.08.09.04.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Oct 2025 09:04:31 -0700 (PDT)
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
X-Inumbo-ID: 7a24de92-a460-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759939472; x=1760544272; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MR+IwM0TNK+OJaN/TxLDLmqN4bJqeT8TJo4rcx3EOyQ=;
        b=JdgIb1fjmFBCJl3Ax+AEG6c1TjFmlLHo6ZvrQ69OeVbkLhNuPquNF4sSVml99eLF75
         Caabkex8T5Ys4rHrC3mdF1YeQa2ohsxWpz9FTZLERXGKWhOjJPEj8xTGEkWcaigy7I9g
         GfISQXKHYBRxl23+ys27ZRcstIBtoUdEEGPD2zsCk08AFAZNWi8fV6v/xU2eBo7YMtOl
         Uj3CZNs7O9BjmfnTINhCtR2kxAWn7K20xVfIfbwQPs51HdJaJfxDKO6JQRjFrVdLFene
         TSWqraKLBmB2FxDGeOj47zbvJMjs83lR/OCxgsyZO/D/F2sjg3uRCxXXtHjv2w/bybcJ
         iJ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759939472; x=1760544272;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MR+IwM0TNK+OJaN/TxLDLmqN4bJqeT8TJo4rcx3EOyQ=;
        b=d2DzClJFiZp7dVbqRLzZ7SIO0wZoaja3yJHNASiJmiYYRi+ZYD35VvynDaQ7SWKUK9
         /FDxYuYMof+pGpBtmcLujgVju8g3IrOOBZ8CFBF5KF2eVEvI/k3k0VGERNOx7vRHUJzv
         MlJdInmwQdoAsaxu+0iwz3KGZON1QcvfSZKIX+wPpkmo3zaUf1ps54eN1dQyTvM5OWrG
         qP9m/ighKwkUKsv9BwDcdsC5N3vdscv8Lvi/coQDJBPXYGuyI8hcwTJhNKBfci0fSdz2
         7CcrflDLFy9UuP8ZrXpwiyo2FfZB1jTmB8Ap2+JnqyO78FOM2G41ZL+WaC6zl+zwxCEm
         AXgw==
X-Forwarded-Encrypted: i=1; AJvYcCV4X7FImm8uB0eN07wrzDJQaWOlvIbIWlu/EsiJ7UrGKKb9OnMs/huQTufTIo9ZbOE78Dgr03CRyDY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzHB+X1ZYkp6ePctgntf2eDIzWcC7NE9wemJSAgQYgUGClNBAqO
	C6IfHRI+OaW80mjlZzXMXL4baeuEO0auv1H6E6LuOVCn5iY1+jzGiF01YZlfYm3oBw==
X-Gm-Gg: ASbGncuWDNQJsLGIYh1GmCb0uw/ZXJ75SQ22N/gaAYRDCEIK/m+e4ufWvPgJv2Pk3Ud
	IC0YHhmHVNyeT7c5uyMC79rdT4A6GvEKxRKdPqYJ8CmBuBOaxCZfO9lUQe+Y6+KE8STl0Y1EXAr
	FLlRfAdK9BhJaM7neA0ohSSwphW6lGxCumAbhejEr38kervZl5di6fFkrKC0xTpsHdZrG75ck8L
	WHgKCHWATYJddISFIL4cIpimJTyT7sJENLBhW662ajiNdcM03dwUBzVCEB4Ya7BmrdSxN06cwDg
	RGMhl8wl32ch3SR2p4ZUWUKKnh6s9EFvsGIcwc7kkjnjbtdq6ngRgu8echyTi6LykzAbPXGUkiu
	/+Uh5t+Wl8Gd1KMD033Njmlrvuf1ybaMEYztXrC4iXpeY90teQZxqflLNiz8cgws04WD3XyMKtb
	qx5SAAIoTz4KCBeZRmL9mwXCQZU6fw63s10Eyv2p6iWQ==
X-Google-Smtp-Source: AGHT+IElZJNS9XNJiITX3lgrOT/8bCHSHKApfcH8iEZ0vzeYdA86JW2vLRMwC/P9Wlz7WPO5MZlkGw==
X-Received: by 2002:a5d:5d03:0:b0:3d1:6d7a:ab24 with SMTP id ffacd0b85a97d-42667177c28mr2828438f8f.17.1759939471584;
        Wed, 08 Oct 2025 09:04:31 -0700 (PDT)
Message-ID: <3e4e4bc5-aa47-4357-9327-df2a9b9c9a1b@suse.com>
Date: Wed, 8 Oct 2025 18:04:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] x86: make Viridian support optional
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250930125215.1087214-1-grygorii_strashko@epam.com>
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
In-Reply-To: <20250930125215.1087214-1-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.09.2025 14:52, Grygorii Strashko wrote:
> --- a/xen/arch/x86/hvm/Kconfig
> +++ b/xen/arch/x86/hvm/Kconfig
> @@ -62,6 +62,16 @@ config ALTP2M
>  
>  	  If unsure, stay with defaults.
>  
> +config VIRIDIAN
> +	bool "Hyper-V enlightenments for guests" if EXPERT
> +	default y
> +	help
> +	  Support optimizations for Hyper-V guests such as faster hypercalls,
> +	  efficient timer and interrupt handling, and enhanced paravirtualized
> +	  I/O. This is to improve performance and compatibility of Windows VMs.

What is "paravirtualized I/O" about in this context?

> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -701,9 +701,12 @@ int hvm_domain_initialise(struct domain *d,
>      if ( hvm_tsc_scaling_supported )
>          d->arch.hvm.tsc_scaling_ratio = hvm_default_tsc_scaling_ratio;
>  
> -    rc = viridian_domain_init(d);
> -    if ( rc )
> -        goto fail2;
> +    if ( is_viridian_domain(d) )
> +    {
> +        rc = viridian_domain_init(d);
> +        if ( rc )
> +            goto fail2;
> +    }

While this looks okay to me, ...

> @@ -739,7 +742,8 @@ void hvm_domain_relinquish_resources(struct domain *d)
>      if ( hvm_funcs.nhvm_domain_relinquish_resources )
>          alternative_vcall(hvm_funcs.nhvm_domain_relinquish_resources, d);
>  
> -    viridian_domain_deinit(d);
> +    if ( is_viridian_domain(d) )
> +        viridian_domain_deinit(d);

... I wonder if viridian_{domain,vcpu}_deinit() better wouldn't be tolerant
to be called anyway, thus avoiding the need for conditionals here and below
(and perhaps being a little more robust overall). Thoughts?

Jan

