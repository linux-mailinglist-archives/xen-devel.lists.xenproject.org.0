Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 803078C74B7
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 12:41:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723109.1127649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7YXx-0001Yg-Di; Thu, 16 May 2024 10:41:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723109.1127649; Thu, 16 May 2024 10:41:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7YXx-0001WP-Az; Thu, 16 May 2024 10:41:13 +0000
Received: by outflank-mailman (input) for mailman id 723109;
 Thu, 16 May 2024 10:41:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LYhW=MT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7YXv-0001UR-8s
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 10:41:11 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce4cf024-1370-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 12:41:09 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a59b81d087aso263430866b.3
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 03:41:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5cdce8f916sm126129866b.223.2024.05.16.03.41.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 May 2024 03:41:08 -0700 (PDT)
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
X-Inumbo-ID: ce4cf024-1370-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715856068; x=1716460868; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8rTbD/cvfzhzDm6OSlrL0nm/TpngG0yb23GR8C0xZtQ=;
        b=RP1SCy46d5ZcHZ4ZYg6pBcORcVlIf37WnfBi2UOv2B7Hs9TD9UKXDzVkg7/2xSRmLH
         9+bduNZOzKeO0+FUNNMNAM9dNqSb1n8ZM6oXvSUwtC3eGFqMDLDdkcdZBIAoY2I/ewwt
         mX+urcDUodWXYYf8ndNpMfZp4eZ4GgkYS5UoPT03I76B1fBy/V/86FcsM1xDtWvXXvBG
         T7+ouJ0N0i5VXTNP8OurhX3u391/3xyHqkcl++HhI6QW+vLbqxB3jWkNsiiZtEPK0+MI
         GenRwNCPM37y3C8SV4wjRLLU9E6Xmt+GYNi6fXgzk0BmrHWvRYWqGygoZSzV6oa+dGQg
         faaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715856068; x=1716460868;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8rTbD/cvfzhzDm6OSlrL0nm/TpngG0yb23GR8C0xZtQ=;
        b=kVuXor1ifeo8iZ3gkqhT5BWXr3saurwjdvyR39z5Ttv8bWzAmsfXq98h4jTzTab4hs
         QWNWv421yJ7gVM+1OcX2ryiBBJ/yOwjoBYK1BHTNbo48tsauBiSzzySuxX0kdB0+ih8F
         YMTq1nzYb+OISkV8wg+pZLWPFPH21dj8zejPXP3S2sfzOPxx9zXemvAfvMU1uv5aoaDJ
         0nC40BXJUWhyzo6LUY4ZENy71OJ7i6P44pkbE02se5yginiY3pGHBDG3qH1zqvtQ22yX
         +KqK7YpH0y0juwO7HScCED+gWDSg4AwZ4z/Rz++rKYRNnYM7rFYu1LmGTG5ygoGDRReo
         ENyw==
X-Forwarded-Encrypted: i=1; AJvYcCW6DpJYG0kzXhr5LQ///Rd6nlIAMQC9HTCyL3+cpjopU8oo7VVYXUUTs0BAW3N++kyJ2ZijLgqNCNXj3vA7nDpPiLi7KuFu8LzTmNFTLJc=
X-Gm-Message-State: AOJu0Yxb9QTVeGSBjYZCJwu4U+T/onXM1Xff2Z8JWbE4m8ip5wbypBuy
	RRRTuiAhhR+NGKOlG91K6ESA1SqoIhsGd1VCDR4CdoNwlUWrWx6myioAjN8Muavbpbq9xXp9U60
	=
X-Google-Smtp-Source: AGHT+IEUJy3Gp2/4Y1gFgIyjekpL4JYgPd9g4eMbL4svhFz0fdbkfyeTwvUtmH3eu4NGQ4XpzxdbYQ==
X-Received: by 2002:a17:906:7f95:b0:a59:c833:d274 with SMTP id a640c23a62f3a-a5a2d5cb2a0mr1858832766b.37.1715856068675;
        Thu, 16 May 2024 03:41:08 -0700 (PDT)
Message-ID: <cc4fb70e-0990-4f61-83a2-7063f3277dee@suse.com>
Date: Thu, 16 May 2024 12:41:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 05/15] x86: introduce CONFIG_ALTP2M Kconfig option
Content-Language: en-US
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, xen-devel@lists.xenproject.org
References: <cover.1715761386.git.Sergiy_Kibrik@epam.com>
 <14a8c523b24c87959941e905bd60933a91144bc7.1715761386.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <14a8c523b24c87959941e905bd60933a91144bc7.1715761386.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.05.2024 11:08, Sergiy Kibrik wrote:
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -358,6 +358,11 @@ config REQUIRE_NX
>  	  was unavailable. However, if enabled, Xen will no longer boot on
>  	  any CPU which is lacking NX support.
>  
> +config ALTP2M
> +	bool "Alternate P2M support"
> +	def_bool y

Since you have "bool" already, here you mean "default".

> +	depends on VMX && EXPERT

This doesn't look right. Typical distro builds will be with EXPERT=n. Such
builds would suddenly end up without altp2m support then. What I think you
mean is a conditional prompt. I.e. overall

config ALTP2M
	bool "Alternate P2M support" if EXPERT
	default y
	depends on VMX
	help
	  ...

Jan

