Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 236BF8C6818
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 15:59:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722393.1126292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7FAJ-0001kd-Fw; Wed, 15 May 2024 13:59:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722393.1126292; Wed, 15 May 2024 13:59:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7FAJ-0001iU-Cy; Wed, 15 May 2024 13:59:31 +0000
Received: by outflank-mailman (input) for mailman id 722393;
 Wed, 15 May 2024 13:59:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EWeN=MS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7FAI-0001gO-Kj
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 13:59:30 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 589b0c98-12c3-11ef-b4bb-af5377834399;
 Wed, 15 May 2024 15:59:28 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-572e48f91e9so1946478a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 15 May 2024 06:59:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a179263d9sm867656566b.95.2024.05.15.06.59.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 May 2024 06:59:28 -0700 (PDT)
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
X-Inumbo-ID: 589b0c98-12c3-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715781568; x=1716386368; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OFQIoriKADdLf2q2ccnXgAC/FxAXTbJKGfE/7oPxiDI=;
        b=YPpPS9EaEUEX6hnghacYp40zPqL6SaneKuD9qIisXwT2/5r0nL6sg3vP3s+TGmyphq
         pSY/upWUrEGzFbh0AjUR0sSXrL24U+DNT2BILg09J9I0NKCc9bsntIVwM4TXUFyg9FYe
         odWo1ayPP65zZSkPs2P/sSyclBR8EClQQnFAXu/zzAzaaM5f3/es8xt8QIwRBg4O2moA
         lGgbKl6tjfZW6vLl2K+Ec/5mUYhi+VOK6qf+2apEIC7BKgFGp2z5+cNeXHdCoYkocQCH
         akRVB8CGTbvwtJ/08uYYozNAY5NM1Z1sQSB1aZKodU4tKelOFfviLjl/Eqq3lnJy+DJy
         D4Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715781568; x=1716386368;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OFQIoriKADdLf2q2ccnXgAC/FxAXTbJKGfE/7oPxiDI=;
        b=g+/jstCQNKmzkPZfR96Y7RWgInEzy0JRvKlLPKPTKwtueN/P0TuqRk8u93vQpNK70w
         4yrRK+L55G79ZHoo980SPU89xJfEzseBZNOjmh/zMQpiEDNjWDhDJHvLhOWhCPZdhzug
         N0Z7cdejIBXnCfZEFlclviiRTGqLzmZTy2Rl+TukNnFK/QctVwic4kIfOBPu64tvjG0k
         cjjvEYLFKKH4t7MKL4806OoEPF2YHD3TA7F9WWKD3GFdEmqAWfXOaGLt/jPafzT8eBWw
         eegvG/7GVsEW5SBz6Sjs5/ihtSIfK+j8u2+U3wpQd2d2wheFhVbechZouQQxRt1Y58AH
         x3Cg==
X-Forwarded-Encrypted: i=1; AJvYcCUPyII6wXqh+u6sSav6Looz7pAA7v84NevVmwKeUvADDWxR/+bupPQG+Jg14QdcT9VjzPPMdtO/o1hnkoaXwQV4t2D1CnlhJRiw/PpC/EU=
X-Gm-Message-State: AOJu0YwD6S+V5E/uzRe/5baTSD3Hh6Ok7NZK+eaeWmiJZcSpfj5pbxu1
	xGqi3FO+VbllOkCwb6vkxxOB8QNTr92DJKM6OFmE7eDjUUWGLsdgvgTWtmfn5A==
X-Google-Smtp-Source: AGHT+IFGtIs9iUISP5QhtW8k7pZuc5sctlyQjyTv+C90iyu5OGJ4e6aqq2HggArriRAEqsfQ1q2XZw==
X-Received: by 2002:a17:907:31c2:b0:a58:eba0:6716 with SMTP id a640c23a62f3a-a5a2d66a40bmr1400994366b.60.1715781568238;
        Wed, 15 May 2024 06:59:28 -0700 (PDT)
Message-ID: <34e1d27b-efc9-495e-b88a-2720997ed9da@suse.com>
Date: Wed, 15 May 2024 15:59:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 (resend) 06/19] x86: Add a boot option to enable and
 disable the direct map
Content-Language: en-US
To: Elias El Yandouzi <eliasely@amazon.com>
Cc: julien@xen.org, pdurrant@amazon.com, dwmw@amazon.com,
 Hongyan Xia <hongyxia@amazon.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
References: <20240513134046.82605-1-eliasely@amazon.com>
 <20240513134046.82605-7-eliasely@amazon.com>
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
In-Reply-To: <20240513134046.82605-7-eliasely@amazon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.05.2024 15:40, Elias El Yandouzi wrote:
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -80,12 +80,29 @@ config HAS_PMAP
>  config HAS_SCHED_GRANULARITY
>  	bool
>  
> +config HAS_SECRET_HIDING
> +	bool
> +
>  config HAS_UBSAN
>  	bool
>  
>  config MEM_ACCESS_ALWAYS_ON
>  	bool
>  
> +config SECRET_HIDING
> +    bool "Secret hiding"
> +    depends on HAS_SECRET_HIDING
> +    help
> +		The directmap contains mapping for most of the RAM which makes domain
> +		memory easily accessible. While making the performance better, it also makes
> +		the hypervisor more vulnerable to speculation attacks.
> +
> +		Enabling this feature will allow the user to decide whether the memory
> +		is always mapped at boot or mapped only on demand (see the command line
> +		option "directmap").
> +
> +		If unsure, say N.
> +
>  config MEM_ACCESS
>  	def_bool MEM_ACCESS_ALWAYS_ON
>  	prompt "Memory Access and VM events" if !MEM_ACCESS_ALWAYS_ON

Surely there's a better place to add this new setting than between two
dependent options (MEM_ACCESS_ALWAYS_ON and MEM_ACCESS).

> --- a/xen/include/xen/mm.h
> +++ b/xen/include/xen/mm.h
> @@ -167,6 +167,13 @@ extern unsigned long max_page;
>  extern unsigned long total_pages;
>  extern paddr_t mem_hotplug;
>  
> +extern bool opt_directmap;
> +
> +static inline bool has_directmap(void)
> +{
> +    return opt_directmap;
> +}

As indicated before, with the Kconfig setting off I think we want to
have an alternative

#define opt_directmap true

There's no need to impact generated code by needing to look at a "variable"
which is never going to change value.

Jan

