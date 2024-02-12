Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CB68517AC
	for <lists+xen-devel@lfdr.de>; Mon, 12 Feb 2024 16:11:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679632.1057177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZXxL-00037X-VP; Mon, 12 Feb 2024 15:10:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679632.1057177; Mon, 12 Feb 2024 15:10:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZXxL-00034r-Sf; Mon, 12 Feb 2024 15:10:51 +0000
Received: by outflank-mailman (input) for mailman id 679632;
 Mon, 12 Feb 2024 15:10:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6iVD=JV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rZXxK-00034l-JD
 for xen-devel@lists.xenproject.org; Mon, 12 Feb 2024 15:10:50 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e7159183-c9b8-11ee-98f5-efadbce2ee36;
 Mon, 12 Feb 2024 16:10:48 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-410ed9f8621so5077925e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 Feb 2024 07:10:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 jp25-20020a05600c559900b00410c7912c6esm3977735wmb.14.2024.02.12.07.10.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Feb 2024 07:10:47 -0800 (PST)
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
X-Inumbo-ID: e7159183-c9b8-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707750648; x=1708355448; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PWeD61159hXUGcIsdFXpvkgqfedGul7/HeNUVYarMMQ=;
        b=KQev6PZH+sQqZrmzo2KgMF03SPk+2IuzU2KamJY5oM9IsY2p1ZJTS/M1M4lCbH8plh
         1VY++XzNB7RAkRXZhpQBysPCDvjCDkww24EvQJnqphVdUO9JL3IWz7SNPFq025CF+qE8
         RD9Icy8yzj/lV/KY7i60+rQqY0i2WvQEZfyNdGvEGHRKcmy5R0xldXCeGjCM2D1fTjyy
         7aNz1rBZy5+lq8mIqutZYwqXZi8AOCCu2c2g4d/6XJTVWpPjfeB5DMI3GSexh1kcOCct
         C6D0eWjBX5U0T+gNhELyu+iB5efZwpF7fAnFMBCl84C9kulrD90Aicxj1KpQMJGMkBqy
         bRWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707750648; x=1708355448;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PWeD61159hXUGcIsdFXpvkgqfedGul7/HeNUVYarMMQ=;
        b=ATzslDNKj7OMQ7TjLo+iRdJgAV3aqfsU8Day0w6DLJH2e2pVG+23YrnBxXzOIXyvsf
         VHUchgxUT4fVS/pRVpN+4S5nRIUky2ieSK/AmxswDcWvifwY5EnznKzxLvmb3sWi0fE7
         os6Uon6kwmo/lEEJWPIRf3zHJrAbXuBF8DBr+h/AoQ04MHVLVQrefN8l1BMvJdg9kV86
         6a7VPLshutQNXWJs7AQXCH1eXJyqlvUAR8ERS0VasF9cnzbU84Q67+r2c3za8esB+tcO
         eK3ow+t3sHxt0yQL+NvmkEkJtuAwnQqgTibP1Ez1Tb0J8z+rQep10NFFpLwvTkLDPmGq
         /Bqg==
X-Gm-Message-State: AOJu0YxWUxF7uuT9RjIjapY5ToBEXeq/hNtxGZeKyf7Jc6PAC7C2Jb7E
	t5IUZkT9eq11Od4CVX6Ki4b7bPaaXrB6RCsxZysf7wpJqh7v5JCRGKxAMZ+GFg==
X-Google-Smtp-Source: AGHT+IHTBWN9pEuUnMEI8ckRbRAmLZVeM2ltdT/fSBmjMK/yfMnWAdKozXOnY+uyNQfBOxDcvAfvGw==
X-Received: by 2002:a05:600c:314b:b0:410:f5d2:cbe5 with SMTP id h11-20020a05600c314b00b00410f5d2cbe5mr1173620wmo.37.1707750647934;
        Mon, 12 Feb 2024 07:10:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWLRMd+lCfigK2sOdzukez4iwfcFBG5W7IpKgHUurK/roAWrSNqZxe7OcDoh1acFtgzYrX8RebpWh0Aeh6vDC3bQNtNuwCk7TZ/IltQgglhApD/DOfJthekbXJHN3Oncwhzu5ZZ
Message-ID: <81593ac4-7714-4dd1-89f9-c22e88223d34@suse.com>
Date: Mon, 12 Feb 2024 16:10:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/30] xen: avoid generation of empty asm/iommu.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
 <a94aba19d32bbe8d2fa78d6d8931f9f0ca51160a.1707146506.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <a94aba19d32bbe8d2fa78d6d8931f9f0ca51160a.1707146506.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.02.2024 16:32, Oleksii Kurochko wrote:
> asm/iommu.h shouldn't

... need to ...

> be included when CONFIG_HAS_PASSTHROUGH
> isn't enabled.
> As <asm/iommu.h> is ifdef-ed by CONFIG_HAS_PASSTHROUGH it should
> be also ifdef-ed field "struct arch_iommu arch" in struct domain_iommu
> as definition of arch_iommu is located in <asm/iommu.h>.
> 
> These amount of changes are enough to avoid generation of empty
> asm/iommu.h for now.

I'm also inclined to insert "just" here, to make more obvious why e.g.
...

> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V4:
>  - Update the commit message.
> ---
> Changes in V3:
>  - new patch.
> ---
>  xen/include/xen/iommu.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
> index a21f25df9f..7aa6a77209 100644
> --- a/xen/include/xen/iommu.h
> +++ b/xen/include/xen/iommu.h
> @@ -337,7 +337,9 @@ extern int iommu_add_extra_reserved_device_memory(unsigned long start,
>  extern int iommu_get_extra_reserved_device_memory(iommu_grdm_t *func,
>                                                    void *ctxt);
>  
> +#ifdef CONFIG_HAS_PASSTHROUGH
>  #include <asm/iommu.h>
> +#endif
>  
>  #ifndef iommu_call
>  # define iommu_call(ops, fn, args...) ((ops)->fn(args))
> @@ -345,7 +347,9 @@ extern int iommu_get_extra_reserved_device_memory(iommu_grdm_t *func,
>  #endif
>  
>  struct domain_iommu {
> +#ifdef CONFIG_HAS_PASSTHROUGH
>      struct arch_iommu arch;
> +#endif
>  
>      /* iommu_ops */
>      const struct iommu_ops *platform_ops;

... this is left visible despite quite likely being meaningless without
HAS_PASSTHROUGH.

Then (happy to make the small edits while committing):
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

