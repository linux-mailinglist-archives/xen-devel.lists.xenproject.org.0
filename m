Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0205CA4FC47
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 11:37:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.902162.1310109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpm8A-0000VZ-Dm; Wed, 05 Mar 2025 10:37:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 902162.1310109; Wed, 05 Mar 2025 10:37:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpm8A-0000TE-B5; Wed, 05 Mar 2025 10:37:38 +0000
Received: by outflank-mailman (input) for mailman id 902162;
 Wed, 05 Mar 2025 10:37:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2gZc=VY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tpm88-0000T8-Lz
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 10:37:36 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d95d5253-f9ad-11ef-9898-31a8f345e629;
 Wed, 05 Mar 2025 11:37:34 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-439ac3216dcso44932895e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 02:37:34 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bd42c5b33sm13818045e9.22.2025.03.05.02.37.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Mar 2025 02:37:33 -0800 (PST)
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
X-Inumbo-ID: d95d5253-f9ad-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741171054; x=1741775854; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lb7mvAggtx7iYpOd/sm/9W0BwekAkv1/DCEZvYlqoTQ=;
        b=b5Rc3rFhzbc/QwLnT8nSsdiepvmhrHR6EBfmshY6CVDm3u6aC15ofXB9azbtoVGCQ+
         08IKCSIazwENEE1wXby3m650yCWpxc8/1JDlACJgT9/u4y+pdeuO859fO2hwUGJW+wj8
         slOs+OH9aj5ZSMAvlS2TgW6Nl/VmErlxRj+G5EQ7tsLF9J9KsCu3BZW4KUrEEoSYLpmp
         pP9WTmhNYegEiMfF9dsY9oI3QGYfS5GtIEZMKUptS6/69UhFOenkPuuzBLZ+UB3WuE4m
         1BjdvDWqIlyQIyArzZqQBiLfT1IJiabT771XjF6vcMurBxuRrSS+qpD0SlwN1dGubJQF
         Hd/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741171054; x=1741775854;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lb7mvAggtx7iYpOd/sm/9W0BwekAkv1/DCEZvYlqoTQ=;
        b=R463/2PvFpMPprwXFP+c/nP91WlyB1mBLRi7bnsjR16pFGTsZpC5bObaTZYqPqYBtK
         Hyn+oMOfthbvc7ZfO0rci+frV8I5eSNimNLIdGCh/GxVaKysQTzU7hLCGItoNdU/9UXa
         emhklvgu3LtzhHYCBxBpgyrgbDIQXRHWIm8ZmtAZS3PaiWOj8Q86TskFmH2cfiO0znaJ
         YBBxSgxqH5Lo2eN2R+zQBKyvU6lRDN1nzvq8ip/2tMzB7aAeegEZbB9qGZ6PZ/RNJx7G
         h9UkqhT9s5O8G+XN3aczjcioEog0hvhGoHLUuKpLLA4HnO8o3pmUQHUcrUT80mVS3wAV
         c/4w==
X-Forwarded-Encrypted: i=1; AJvYcCX+8IzlnDpMpWsemZT25NdEvgKxG9JoK47v/H1T3J/F+fiRF5Q8dP6T8j6fySb7jgE3z8RbpfTHXcA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyFh+2xIRAt84aE2CQkDMdUxb1kU0kmPU9btiPMa1ttuiVvDQ6z
	ojCMjMKNQSDHBmd23RfEKtwYeL3A/4pCEklrp/+oM8AAI5vPpBkH4ErySWCEaQ==
X-Gm-Gg: ASbGncvSPg6W0ve+35IID5VKdbtw+gNwxXp1Qn8VBTxt5XipwdIvoLD/CrfvN+Hcf/1
	84pnzuNuRCitM3Hlwb6taDq4/O+UcX14Rt5h8mPqPnJRzIdlREaRpFN2FGlvsq17LUCmNF/vbLl
	cbFZ9bJf38/RlzWjL0KHRpHXqxVegqulrBDBq2HxMzd1SLaWF+PaXGrKLlefshKl2uywgIoqWDj
	CaUzgQGMWJksLZk9Z1udMAOu1OrR4mKsa86EK0u2LQmhb/BOXb7/Q44iA1R43kOZhICyzPBl+0u
	EeDXpKYqdvxMSlFQfRslsh6jn/YbdGDlZzmYL+6oqW0RylV4bKNmGkfeA2TKTqoThbw66N0vMuS
	JiwpMbSsLz+MKx3NeUi/3xRQ/jXRsWg==
X-Google-Smtp-Source: AGHT+IFSv4q1UjMpdfCP3nRajVxfRsZ9pO8lNPvA/qK4DrP5myjf2pdUc99pejTvn4RoOlVoWDXtaA==
X-Received: by 2002:a05:600c:4e8b:b0:43b:d0fe:b8be with SMTP id 5b1f17b1804b1-43bd29d8d45mr20262785e9.30.1741171053843;
        Wed, 05 Mar 2025 02:37:33 -0800 (PST)
Message-ID: <83d5d612-2f6a-430a-8aee-4738f43204e0@suse.com>
Date: Wed, 5 Mar 2025 11:37:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/iocap.h: add documentation
To: Grygorii Strashko <gragst.linux@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Roger Pau Monne <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20250224113828.151794-1-grygorii_strashko@epam.com>
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
In-Reply-To: <20250224113828.151794-1-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.02.2025 12:38, Grygorii Strashko wrote:
> Change rangeset parameters to "start, last" as proposed in [1],
> and add documentation for public interface.
> 
> No functional changes.
> 
> [1] https://patchwork.kernel.org/comment/26251962/
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>

To be honest, this is getting too verbose for my taste. I also don't think
title and description fit together: One says the main thing the patch does
is add doc, the other says the main thing is the parameter renaming. When
then there's at least one further parameter which is also renamed, despite
not fitting the description.

Jan

> --- a/xen/include/xen/iocap.h
> +++ b/xen/include/xen/iocap.h
> @@ -12,11 +12,21 @@
>  #include <asm/iocap.h>
>  #include <asm/p2m.h>
>  
> -static inline int iomem_permit_access(struct domain *d, unsigned long s,
> -                                      unsigned long e)
> +/**
> + * @brief Gives domain permission to access IOMEM range
> + *
> + * @d: Domain to give IOMEM range access
> + * @start: IOMEM range start address, inclusive
> + * @last: IOMEM range last address, inclusive
> + *
> + * @retval 0 Is successful
> + * @retval -ENOMEM if memory allocation failed
> + */
> +static inline int iomem_permit_access(struct domain *d, unsigned long start,
> +                                      unsigned long last)
>  {
>      bool flush = cache_flush_permitted(d);
> -    int ret = rangeset_add_range(d->iomem_caps, s, e);
> +    int ret = rangeset_add_range(d->iomem_caps, start, last);
>  
>      if ( !ret && !is_iommu_enabled(d) && !flush )
>          /*
> @@ -29,10 +39,20 @@ static inline int iomem_permit_access(struct domain *d, unsigned long s,
>      return ret;
>  }
>  
> -static inline int iomem_deny_access(struct domain *d, unsigned long s,
> -                                    unsigned long e)
> +/**
> + * @brief Denies domain permission to access IOMEM range
> + *
> + * @d: Domain to deny IOMEM range access
> + * @start: IOMEM range start address, inclusive
> + * @last: IOMEM range last address, inclusive
> + *
> + * @retval 0 Is successful
> + * @retval -ENOMEM if memory allocation failed
> + */
> +static inline int iomem_deny_access(struct domain *d, unsigned long start,
> +                                    unsigned long last)
>  {
> -    int ret = rangeset_remove_range(d->iomem_caps, s, e);
> +    int ret = rangeset_remove_range(d->iomem_caps, start, last);
>  
>      if ( !ret && !is_iommu_enabled(d) && !cache_flush_permitted(d) )
>          /*
> @@ -45,23 +65,93 @@ static inline int iomem_deny_access(struct domain *d, unsigned long s,
>      return ret;
>  }
>  
> -#define iomem_access_permitted(d, s, e)                 \
> -    rangeset_contains_range((d)->iomem_caps, s, e)
> -
> -#define irq_permit_access(d, i)                         \
> -    rangeset_add_singleton((d)->irq_caps, i)
> -#define irq_deny_access(d, i)                           \
> -    rangeset_remove_singleton((d)->irq_caps, i)
> -#define irqs_permit_access(d, s, e)                     \
> -    rangeset_add_range((d)->irq_caps, s, e)
> -#define irqs_deny_access(d, s, e)                       \
> -    rangeset_remove_range((d)->irq_caps, s, e)
> -#define irq_access_permitted(d, i)                      \
> -    rangeset_contains_singleton((d)->irq_caps, i)
> -
> -#define pirq_access_permitted(d, i) ({                  \
> +/**
> + * @brief Checks if domain has permissions to access IOMEM range
> + *
> + * @d: Domain to check IOMEM range access
> + * @start: IOMEM range start address, inclusive
> + * @last: IOMEM range last address, inclusive
> + *
> + * @retval true if access permitted
> + * @retval false if access denied
> + */
> +#define iomem_access_permitted(d, start, last)             \
> +    rangeset_contains_range((d)->iomem_caps, start, last)
> +
> +/**
> + * @brief Gives domain permission to access IRQ
> + *
> + * @d: Domain to give IRQ access
> + * @irq: IRQ number
> + *
> + * @retval 0 Is successful
> + * @retval -ENOMEM if memory allocation failed
> + */
> +#define irq_permit_access(d, irq)                         \
> +    rangeset_add_singleton((d)->irq_caps, irq)
> +
> +/**
> + * @brief Denies domain permission to access IRQ
> + *
> + * @d: Domain to deny IRQ access
> + * @irq: IRQ number
> + *
> + * @retval 0 Is successful
> + * @retval -ENOMEM if memory allocation failed
> + */
> +#define irq_deny_access(d, irq)                           \
> +    rangeset_remove_singleton((d)->irq_caps, irq)
> +
> +/**
> + * @brief Gives domain permission to access IRQ range
> + *
> + * @d: Domain to give IRQ range access
> + * @start_irq: IRQ range start number, inclusive
> + * @last_irq: IRQ range last number, inclusive
> + *
> + * @retval 0 Is successful
> + * @retval -ENOMEM if memory allocation failed
> + */
> +#define irqs_permit_access(d, start_irq, last_irq)      \
> +    rangeset_add_range((d)->irq_caps, start_irq, last_irq)
> +
> +/**
> + * @brief Denies domain permission to access IRQ range
> + *
> + * @d: Domain to deny IRQ range access
> + * @start_irq: IRQ range start number, inclusive
> + * @last_irq: IRQ range last number, inclusive
> + *
> + * @retval 0 Is successful
> + * @retval -ENOMEM if memory allocation failed
> + */
> +#define irqs_deny_access(d, start_irq, last_irq)        \
> +    rangeset_remove_range((d)->irq_caps, start_irq, last_irq)
> +
> +/**
> + * @brief Checks if domain has permissions to access IRQ
> + *
> + * @d: Domain to check IRQ access
> + * @irq: IRQ number to check
> + *
> + * @retval true if access permitted
> + * @retval false if access denied
> + */
> +#define irq_access_permitted(d, irq)                    \
> +    rangeset_contains_singleton((d)->irq_caps, irq)
> +
> +/**
> + * @brief Checks if domain has permissions to access PIRQ
> + *
> + * @d: Domain to check PIRQ access
> + * @pirq: PIRQ number to check
> + *
> + * @retval IRQ number if access permitted
> + * @retval 0 if access denied
> + */
> +#define pirq_access_permitted(d, pirq) ({               \
>      struct domain *d__ = (d);                           \
> -    int irq__ = domain_pirq_to_irq(d__, i);             \
> +    int irq__ = domain_pirq_to_irq(d__, pirq);          \
>      irq__ > 0 && irq_access_permitted(d__, irq__)       \
>      ? irq__ : 0;                                        \
>  })


