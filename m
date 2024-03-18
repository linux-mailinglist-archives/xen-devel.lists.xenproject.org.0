Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD87287EE38
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 17:58:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694963.1084436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGJZ-0004KM-JY; Mon, 18 Mar 2024 16:58:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694963.1084436; Mon, 18 Mar 2024 16:58:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGJZ-0004IP-Gs; Mon, 18 Mar 2024 16:58:21 +0000
Received: by outflank-mailman (input) for mailman id 694963;
 Mon, 18 Mar 2024 16:58:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=emy9=KY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmGJX-0004ID-IV
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 16:58:19 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b80143d9-e548-11ee-afdd-a90da7624cb6;
 Mon, 18 Mar 2024 17:58:18 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-513d212f818so5404519e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 09:58:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 y24-20020a170906471800b00a46be85684bsm1288358ejq.223.2024.03.18.09.58.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Mar 2024 09:58:17 -0700 (PDT)
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
X-Inumbo-ID: b80143d9-e548-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710781098; x=1711385898; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yrU0QqhRFrnpV1OS8+/Gxyvv/Y+9Ge7jCEayRTOxEbY=;
        b=OxEI06BILFXZxzM55uFUmXwR/QzgdDBzfCcOn4ZI6ON7GYmWmUcMpoLMh3yfqMZCtx
         AOkpC6X60IT+mteG3A63Ac7jpBUkXX2Pe+9grq+X+f9ii68KZIEV1TEC3OdZD3Xo7q1U
         ku7YQI/wnNWUt6uNgqdlCUierI7+3lOlHkmJsQ78ceE4m6xbXLevNBHRFWQgPq2+gUiz
         DgqgXTXHxO0pKRHQPjIA3RLjBiBXa10ZaETKPAx+/NW1B6yVnNmYD3Q6QeDzVmcTm9Rl
         AEmCOsg4myyc6DMOfCUyI6+K3L99UwIv7HVKJjLJ7mRbfpC+s1l0pphJIRf6abTFomtj
         lOKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710781098; x=1711385898;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yrU0QqhRFrnpV1OS8+/Gxyvv/Y+9Ge7jCEayRTOxEbY=;
        b=nZki3DwRsMqnP31HrOPDjn2XZ+kYOZnYTmfeWTjKplOYns5sGKB+GsRQc3r85Gwz3I
         X7iavv/7GM4rmZx1zqiKvmVzzIWpyNHLjNJHS903MUHNZm8Z3f34ayQIxaxRZiMQqK65
         JYx4/dQlPZ1f6HyQv3ruyxgL7IrgB+KW9XJ9+gjTKpiVLkKtHw6hoUWlNFdLKVZL2/Mp
         6N+PoMLBibuirCYd3D0dTjJDD3uI0i7AZp3kA1HN3RTazBIlWOivyhRtN5LGyeInGMkn
         YtonsDfKNkVXMVDOaTng3xCsKm/H5XzQKAq7S0hSrc/rqcyry/aKnddGZQHBJQGSLJhs
         SiAA==
X-Forwarded-Encrypted: i=1; AJvYcCVhtJjBuA7uqi7USqknu1YtjZDhrP8GJf+9wWSg4rhVWBtLuhBnXMCmaXrRZaikcq3D7ibj5K+98akE3hJFWQ7Q2bzKxUOVpWe0jmjTMWY=
X-Gm-Message-State: AOJu0YxiYJ70x7jPH1aoz1MGghQyz/vUIYlpBKeoEiataX5bRI26N8VP
	ncOOWpkGvgbhmEroTElRO44/v6XgUwCIpfGHWr5r5CNJpLzwa6qzPbr3Vl0HUA==
X-Google-Smtp-Source: AGHT+IEfEDJ6vGdSBY1ZgwN/IBSpXAa/NGnO+pHDNB5tPDFRrab3NYZEWtrFkQQbbLBn/bZ3Cb5atA==
X-Received: by 2002:a05:6512:559:b0:513:d3cb:249f with SMTP id h25-20020a056512055900b00513d3cb249fmr7379379lfl.52.1710781097893;
        Mon, 18 Mar 2024 09:58:17 -0700 (PDT)
Message-ID: <6ddc9d8a-20e7-4e4d-ae1a-d2ea01479b38@suse.com>
Date: Mon, 18 Mar 2024 17:58:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/20] xen/riscv: introduce extenstion support check by
 compiler
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1710517542.git.oleksii.kurochko@gmail.com>
 <d4df95eb7a30df3f882b67f200964232fee9d6c1.1710517542.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <d4df95eb7a30df3f882b67f200964232fee9d6c1.1710517542.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.03.2024 19:05, Oleksii Kurochko wrote:
> Currently, RISC-V requires two extensions: _zbb and _zihintpause.

Do we really require Zbb already?

> This patch introduces a compiler check to check if these extensions
> are supported.
> Additionally, it introduces the riscv/booting.txt file, which contains
> information about the extensions that should be supported by the platform.
> 
> In the future, a feature will be introduced to check whether an extension
> is supported at runtime.
> However, this feature requires functionality for parsing device tree
> source (DTS), which is not yet available.

Can't you query the CPU for its features?

> --- a/xen/arch/riscv/arch.mk
> +++ b/xen/arch/riscv/arch.mk
> @@ -3,16 +3,22 @@
>  
>  $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
>  
> -CFLAGS-$(CONFIG_RISCV_64) += -mabi=lp64
> +riscv-abi-$(CONFIG_RISCV_32) := -mabi=ilp32
> +riscv-abi-$(CONFIG_RISCV_64) := -mabi=lp64
>  
>  riscv-march-$(CONFIG_RISCV_ISA_RV64G) := rv64g
>  riscv-march-$(CONFIG_RISCV_ISA_C)       := $(riscv-march-y)c
>  
> +extensions := $(call as-insn,$(CC) $(riscv-abi-y) -march=$(riscv-march-y)_zbb,"",_zbb) \
> +              $(call as-insn,$(CC) $(riscv-abi-y) -march=$(riscv-march-y)_zihintpause,"pause",_zihintpause)

Imo you want another helper macro here, where all one needs to pass in is
the extension name (i.e. zbb and zihintpause as per above). That'll also
help with line length, I hope.

Jan

