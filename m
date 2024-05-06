Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B768BCCA2
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 13:10:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717550.1119875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3wEC-0004YC-1Q; Mon, 06 May 2024 11:09:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717550.1119875; Mon, 06 May 2024 11:09:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3wEB-0004Uh-U5; Mon, 06 May 2024 11:09:51 +0000
Received: by outflank-mailman (input) for mailman id 717550;
 Mon, 06 May 2024 11:09:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gbjR=MJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s3wEA-0004By-Gr
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 11:09:50 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 272a9598-0b99-11ef-b4bb-af5377834399;
 Mon, 06 May 2024 13:09:48 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-34d8f6cfe5bso1283991f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 04:09:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 dn2-20020a0560000c0200b0034e14d59f07sm10491751wrb.73.2024.05.06.04.09.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 May 2024 04:09:48 -0700 (PDT)
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
X-Inumbo-ID: 272a9598-0b99-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714993788; x=1715598588; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gsHoXsKWZlQKbQRTc+3UPbRnjtnVIkWe+22IWxBFW7c=;
        b=aXKzGEL4QcLdu7fqOe5y4ZJ9cGqrOpRfbTGHL5ZgMKuvZyGzevpbZeRvwVuHpfZmTU
         qiIFXE0xDSUTwXB8gixRxdjNThRedOx+6HbS1cHzAx0roWp/58fB2OXS9mAZFWzlxRkK
         yC+JmrAyLVhsm6/E20cHNC21GwlhEd9L02j0cgYUgi5l8jH1xchw0BZnu3ciQoyeUl1f
         /ZS5eYm8X+8jfDz1w08KFNKq58jjdN+dPqSr2Q5Z1Bs2opD08mj15MPOgzTPD+8Jc8kw
         5MaWCgFW1HiPxU78KJrugz0pP0B6j4gtqFWls1F4J85HDl9Pec4SudDLVePUSu6dEjMQ
         JDtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714993788; x=1715598588;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gsHoXsKWZlQKbQRTc+3UPbRnjtnVIkWe+22IWxBFW7c=;
        b=jLauXhwW9hjp13UG3cUsLHxaODuow1yQP1DkrfdzKLkHp6xz105m9WiTl9YSf9J/cb
         jAN+pm/OxLgAADeQgOAv7ibLJhWSBTgE9RiLbgTjCzzwa02yNIyi5QTIiVSkER+gJ0iJ
         1qcCuOsOX+wzLkdZJBM46vVSglmabUjPuLkMx6grWXD9YYzQCD+bnBpNUMgQs/Oo7RfW
         Pdu7Qb34ZY1USI7HUr7vSwUntRvqeJFeFu7fCsaCKYusyVkZVwziLBCZZdEsPn6OCHms
         IdxYwV+db0b+b+ax0yL8RsALA/hTvyiMk9E0GLXANf9oDl+Agte8v3w1eizg3fxHUKvP
         GUmA==
X-Forwarded-Encrypted: i=1; AJvYcCVUZk2GTisMD5ipGtW8P9hKCIBHRkmFNwa5MnT3LCfJcZ9htDgv2FhJWM8ksIXl5m7kQqAlNOLUBSKEEzfzhE6QXYkVfOfU0QOOwuqJEuU=
X-Gm-Message-State: AOJu0Yw8ONpzJ5otubWXVdbKCNWjdNnbTZFElLCbatCV1pKkQlqKUM8p
	Bj6y/wxHrc3keVWJbX8Jj1nzI80lArvDrPuAupsp20JMWqEhmSvRKMzpJCFcgA==
X-Google-Smtp-Source: AGHT+IHxA4I7mEO4IbqZAXu4j8B+iLCzfpQGSRpqTch6z6IlewZWOsSKErblzLKw4zhR0fVIDXc28g==
X-Received: by 2002:a5d:6503:0:b0:349:fc93:1e2 with SMTP id x3-20020a5d6503000000b00349fc9301e2mr7454624wru.9.1714993788282;
        Mon, 06 May 2024 04:09:48 -0700 (PDT)
Message-ID: <326643bc-2d8c-4cff-87ff-e1abb7b78e8d@suse.com>
Date: Mon, 6 May 2024 13:09:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 1/5] x86/vpmu: separate amd/intel vPMU code
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1714640459.git.Sergiy_Kibrik@epam.com>
 <ddbf4e24c41f48832bba4b11368cd5e6e9f79a20.1714640459.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <ddbf4e24c41f48832bba4b11368cd5e6e9f79a20.1714640459.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.05.2024 11:12, Sergiy Kibrik wrote:
> Build AMD vPMU when CONFIG_AMD is on, and Intel vPMU when CONFIG_INTEL
> is on respectively, allowing for a plaftorm-specific build.
> 
> No functional change intended.
> 
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

I can only guess that Stefano is likely fine with

> changes in v2:
>  - drop static inline stubs, use #idef/#endif in vpmu_init)()

this.

Acked-by: Jan Beulich <jbeulich@suse.com>
with ...

> --- a/xen/arch/x86/cpu/vpmu.c
> +++ b/xen/arch/x86/cpu/vpmu.c
> @@ -827,6 +827,7 @@ static int __init cf_check vpmu_init(void)
>  
>      switch ( vendor )
>      {
> +#ifdef CONFIG_AMD
>      case X86_VENDOR_AMD:
>          ops = amd_vpmu_init();
>          break;
> @@ -834,11 +835,12 @@ static int __init cf_check vpmu_init(void)
>      case X86_VENDOR_HYGON:
>          ops = hygon_vpmu_init();
>          break;
> -
> +#endif
> +#ifdef CONFIG_INTEL
>      case X86_VENDOR_INTEL:
>          ops = core2_vpmu_init();
>          break;
> -
> +#endif
>      default:
>          printk(XENLOG_WARNING "VPMU: Unknown CPU vendor: %d. "
>                 "Turning VPMU off.\n", vendor);

... neither of the blank lines dropped.

Jan

