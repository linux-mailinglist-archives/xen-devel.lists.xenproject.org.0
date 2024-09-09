Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCBF971C6D
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 16:24:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794579.1203578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snfJU-0004ei-Ue; Mon, 09 Sep 2024 14:24:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794579.1203578; Mon, 09 Sep 2024 14:24:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snfJU-0004cP-Rd; Mon, 09 Sep 2024 14:24:20 +0000
Received: by outflank-mailman (input) for mailman id 794579;
 Mon, 09 Sep 2024 14:24:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qOm0=QH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1snfJT-0004cJ-7t
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 14:24:19 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 320665de-6eb7-11ef-99a1-01e77a169b0f;
 Mon, 09 Sep 2024 16:24:17 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a8d13b83511so294778366b.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 07:24:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25835d87sm349725466b.6.2024.09.09.07.24.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Sep 2024 07:24:16 -0700 (PDT)
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
X-Inumbo-ID: 320665de-6eb7-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725891856; x=1726496656; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wUDdhcMdolYuQscO5HiMfLgD9HUEOvzKcpV4fn/yu9U=;
        b=Uk6lR5+3H0FXN+hbFSUgLXXRvAsND7T/kap+m5dUjF3o0VPHGQzAT3/BJwjNAiLg+a
         a2JialyHj95VI7gCH8/SMgkM8gyAicXOCr3MTDMVBkhFmDtKWKKrx1hY3aKS+KsqGFcf
         hp7Fe1XSbXz7GgEY6GIP825fm87kMsMI/UZyLsl0v/cotk9HVyyVh5/XIR+jL6BuQ5lN
         cmhBtxAL1BySsuWXMdbstuf8Y8mgr2Y3WZwjkeU4o8o7ZcVbxXjKuFXv/vzeIb87Z31Z
         1RiVP4uDmkloxBWpVZz+ouy3vQk7ThxPX40YoRfwZkTTxofHgGHicHYgbvSdbEwwICDV
         urFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725891856; x=1726496656;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wUDdhcMdolYuQscO5HiMfLgD9HUEOvzKcpV4fn/yu9U=;
        b=cP34Jp0Rqq9W2WP3p93sagXis58Nv2Iz+CdWT908iSKGf13X1+SF09lh16DWlA1VTr
         LUFdnkBNk1SRhVDN17Jpy0+m3VZA9W74MhF35dxnA1cWMobgaFZwRQIFMU+zwa3UZHSi
         0mFPaeYpWkvsRdUXrKY84NK///lB6C7ZZ7HbUIeoR8hv4EUWs/MrcbmOMQRAcTztJWqz
         UPB1CX5H86NMUd+y1vGLgw6BbtJxA/egt0fJo+zF53ME64yMn/ww9b7U8ZqhznxzHVeR
         KELXVibiKHIyorquTsIR4+c9xZGILZxJRyZxN3xL18JCpZuiE5E88if3hdk6QGdxRwEP
         dLzg==
X-Forwarded-Encrypted: i=1; AJvYcCW9CcQgZ36dfD51aktRT3Vw9yEXdshCjHgcGQ4I2hPYITtTSMBQkPAytRBuuwApCsnMUkxAxZqcGiI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyj6hmBdSnAbV6UzyLZafet0cSuIEA4lEV423//abeam7F0f7CA
	qFEW6RvP3u1T+5ZjRoTLu3F7W8+v49AE6rD7SiqNwDy3Byy9vypqOtulKTaMsg==
X-Google-Smtp-Source: AGHT+IF1EJODyZJzPOiA41M/9GU1DBH3MuyvQpGlscEAYukqh6X5zSBiTv4dnTZGmrlac+/Fy7FNwQ==
X-Received: by 2002:a17:907:29d3:b0:a8a:8ff6:838a with SMTP id a640c23a62f3a-a8a8ff686femr560646366b.64.1725891856412;
        Mon, 09 Sep 2024 07:24:16 -0700 (PDT)
Message-ID: <2808764b-e1e4-4557-96d7-dc771be8a837@suse.com>
Date: Mon, 9 Sep 2024 16:24:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v4] x86/intel: optional build of PSR support
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20240903072614.291048-1-Sergiy_Kibrik@epam.com>
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
In-Reply-To: <20240903072614.291048-1-Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.09.2024 09:26, Sergiy Kibrik wrote:
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -284,6 +284,9 @@ endchoice
>  config GUEST
>  	bool
>  
> +config PSR
> +	bool
> +
>  config XEN_GUEST
>  	bool "Xen Guest"
>  	select GUEST

Inserting in the middle of guest related setting is a little odd.

> --- a/xen/arch/x86/Kconfig.cpu
> +++ b/xen/arch/x86/Kconfig.cpu
> @@ -13,6 +13,7 @@ config AMD
>  config INTEL
>  	bool "Support Intel CPUs"
>  	default y
> +	select PSR

I realize Andrew suggested it like this, so the question goes to him as
much as to you: If already we can isolate this code, is there a reason
not to make this a user visible option (with a "depends on" rather than a
"select") right away?

> --- a/xen/arch/x86/include/asm/psr.h
> +++ b/xen/arch/x86/include/asm/psr.h
> @@ -69,12 +69,11 @@ extern struct psr_cmt *psr_cmt;
>  
>  static inline bool psr_cmt_enabled(void)
>  {
> -    return !!psr_cmt;
> +    return IS_ENABLED(CONFIG_PSR) ? !!psr_cmt : false;

Perhaps just

    return IS_ENABLED(CONFIG_PSR) && psr_cmt;

?

Jan

