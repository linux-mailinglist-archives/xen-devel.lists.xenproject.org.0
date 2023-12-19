Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16ED2818D5D
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 18:03:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657057.1025704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFdV3-0001Iu-0s; Tue, 19 Dec 2023 17:03:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657057.1025704; Tue, 19 Dec 2023 17:03:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFdV2-0001G0-Tv; Tue, 19 Dec 2023 17:03:20 +0000
Received: by outflank-mailman (input) for mailman id 657057;
 Tue, 19 Dec 2023 17:03:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z0wA=H6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFdV1-0001FR-Iz
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 17:03:19 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 814953f7-9e90-11ee-9b0f-b553b5be7939;
 Tue, 19 Dec 2023 18:03:17 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40c39ef63d9so52508765e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 19 Dec 2023 09:03:17 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 o2-20020a5d6842000000b003367147831csm2326730wrw.108.2023.12.19.09.03.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Dec 2023 09:03:16 -0800 (PST)
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
X-Inumbo-ID: 814953f7-9e90-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1703005397; x=1703610197; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RHYMrshFYG8j7X/tY401lflfVLA/pbGCMTFvTiPbRK0=;
        b=Kc1QTCsW7Ydg7TOlOlBjXGT2U6s+W/bnVtTQ+DquRA0V+1kDmq2txJUbmV5S5hJo7w
         /a1N0Tso60HUDqhGsDqPiEW2zcdbQ/cTmI8wUQsa0QZHbBgSWdF74E1GvcnKaCEdKFej
         peVS4kGUG/HN3g6uLF0h6Uvhg8gbg/dHxN9uhWTIcYVjjehMGVVtc/b6QGj8PA13dirU
         NA7qmYehfr68zxSSc1AHSJLs7dlyLJkH2sDFxzMzkhWvdM2vlv7x1m+Euo1i1Z6NOw1c
         jgfkfMN5e72pAbEDYTzMJQsuURmyFpLS5KRdeGDSjKDK1lUgtZiLTrXtNRyo0/6nnDJy
         jVng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703005397; x=1703610197;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RHYMrshFYG8j7X/tY401lflfVLA/pbGCMTFvTiPbRK0=;
        b=ON39LAXdGWu/P37FmT3dX53t/N7ie9kogYDjuaIbstR7DkkxcJHQ/Lyc0S1fmwDf2l
         tPaXntmVYBCuh3mEc0jFCtdp4mq1coqGXPMtEC/nldsYQ1BYTtyDwOtmCF2CllJOsuSU
         zpe/8UF3ZsjPfNqjMSpZNpy4IJGAFsKtX4VzSkNyZ3af2u3rw9uIywtdeWxJEY/aiiPZ
         xJVwXQWEzAjuIyhxu94O7pdKOBWFkgEucVAp1wlTAeWlzuA4hIQNdn87v3NWzaFs/Ouw
         0h2hHrpj90ZcZ3Okl0a3ye84YhzB4iguOyEsgQv+CqgY6UTyY/fsyN3KxhhhKhKAuROM
         0Z2A==
X-Gm-Message-State: AOJu0YwtPIn974+/ISNnqNEpAdgZqtWlbRWrexq0lp2Bm8/8V5CMdMbt
	wO5mNEUWNYuni6C4J3LfZjRv
X-Google-Smtp-Source: AGHT+IH3ESTA3zmGaiNkYli0dVlpahFcpWdAsyI+ag5e09M0YvALCMXcBUiyJs8o+Mu9iCtEmFaUkA==
X-Received: by 2002:a05:600c:4ece:b0:40c:6ff4:8edf with SMTP id g14-20020a05600c4ece00b0040c6ff48edfmr3172587wmq.107.1703005397248;
        Tue, 19 Dec 2023 09:03:17 -0800 (PST)
Message-ID: <3546ec55-3e0c-4fdc-9697-0105d20bacfd@suse.com>
Date: Tue, 19 Dec 2023 18:03:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] xen/common: Move Arm's bootfdt to common
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1702607884.git.sanastasio@raptorengineering.com>
 <b26a07209b54cd036e42a8b00f036201821eb775.1702607884.git.sanastasio@raptorengineering.com>
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
In-Reply-To: <b26a07209b54cd036e42a8b00f036201821eb775.1702607884.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.12.2023 03:43, Shawn Anastasio wrote:
> Move Arm's bootfdt.c to xen/common so that it can be used by other
> device tree architectures like PPC and RISCV. Only a minor change to
> conditionalize a call to a function only available on EFI-supporting
> targets was made to the code itself.
> 
> Suggested-by: Julien Grall <julien@xen.org>
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> ---
>  xen/arch/arm/Makefile                          |  1 -
>  xen/common/Makefile                            |  1 +
>  xen/common/device-tree/Makefile                |  1 +
>  xen/{arch/arm => common/device-tree}/bootfdt.c | 15 +++++++++------
>  4 files changed, 11 insertions(+), 7 deletions(-)
>  create mode 100644 xen/common/device-tree/Makefile
>  rename xen/{arch/arm => common/device-tree}/bootfdt.c (98%)

I think this wants to come with an update to ./MAINTAINERS, such that
the file doesn't change maintainership.

> --- a/xen/arch/arm/bootfdt.c
> +++ b/xen/common/device-tree/bootfdt.c
> @@ -431,12 +431,15 @@ static int __init early_scan_node(const void *fdt,
>  {
>      int rc = 0;
>  
> -    /*
> -     * If Xen has been booted via UEFI, the memory banks are
> -     * populated. So we should skip the parsing.
> -     */
> -    if ( !efi_enabled(EFI_BOOT) &&
> -         device_tree_node_matches(fdt, node, "memory") )
> +    if ( device_tree_node_matches(fdt, node, "memory") )
> +#if defined(CONFIG_ARM_EFI)
> +        /*
> +         * If Xen has been booted via UEFI, the memory banks are
> +         * populated. So we should skip the parsing.
> +         */
> +        if ( efi_enabled(EFI_BOOT) )
> +            return rc;
> +#endif

I'm not a DT maintainer, but I don't like this kind of #ifdef, the more
that maybe PPC and quite likely RISC-V are likely to also want to support
EFI boot. But of course there may be something inherently Arm-specific
here that I'm unaware of.

Jan

