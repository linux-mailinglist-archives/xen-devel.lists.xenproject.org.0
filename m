Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 565FE9CDD4D
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 12:12:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837131.1253055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBuFo-0007DJ-1W; Fri, 15 Nov 2024 11:12:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837131.1253055; Fri, 15 Nov 2024 11:12:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBuFn-0007Aa-V4; Fri, 15 Nov 2024 11:12:43 +0000
Received: by outflank-mailman (input) for mailman id 837131;
 Fri, 15 Nov 2024 11:12:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OZ3N=SK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tBuFm-0007AU-RL
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 11:12:42 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86ca8edd-a342-11ef-a0c7-8be0dac302b0;
 Fri, 15 Nov 2024 12:12:39 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4316f3d3c21so13662715e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2024 03:12:39 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3821adadf8fsm4063720f8f.39.2024.11.15.03.12.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Nov 2024 03:12:38 -0800 (PST)
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
X-Inumbo-ID: 86ca8edd-a342-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMmIiLCJoZWxvIjoibWFpbC13bTEteDMyYi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6Ijg2Y2E4ZWRkLWEzNDItMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNjY5MTU5LjgyMDc0MSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731669159; x=1732273959; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BbVP8REjDP3YFBb8kBKqp5foVT680lWYOhwfdDAe80Y=;
        b=N/fpfwf7lEPTVKcUQoLoxPAb60M5QX0yj8gyi33tRndraVXB3JRnf9Wwd+ckYZ7cBk
         Pt/lUltN4lZVeu8jJAQI2OEacLG/x/tkZIEbo1FER7S21Ljm2LqmXR5IibD1UWBW63Jb
         cYCUCGp3CcIwjkOn+NsjMAWusCUVjhQn+sLMMJq6FIBVl69mEiHWfJXzvKQdV69//Ddt
         cFd/m2EoGqel30DmnKBqjIMJG7tsbLkaPva6sk9XuQ3JYFicguJ4GduA0E6bbFJsYCVK
         sxoWOyazjav0IQr4Ht7Dl9N87h5dTbZFz2gHhpcpm446MoDMuovDcLUd+w6hT7ANS0YS
         IDvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731669159; x=1732273959;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BbVP8REjDP3YFBb8kBKqp5foVT680lWYOhwfdDAe80Y=;
        b=bJuQ62q6h7JwWmjF8a+a08vl3aaQoSfdgFbP6McjD2DmMmQWlogFRsuS822EUf+FtQ
         UFo9VRxNvUII2+ZB16eWkvMS00U9hG+vp+e47SQmPTnf1e5Xo8IcGb5Rl3CRLRTHUPHZ
         zdrWZE6GqumC8hNVVyceiN3riS7gMxQhhEqjpAVB11UZ4uZTu5gksKpK27GY4XoTysD9
         WqMJa0Gfy36dkYyPcGU74/iTDxqydTyWUXojTTqfs/3NPIt2G/a+sP010ko3yJg/PKLz
         nH9zJHwsHLUn6OSh++5NEg+FukW1lTd0/oqLNI7lM+avSjLkyBeJDnaaHzj1YTJfGIW4
         ct0A==
X-Forwarded-Encrypted: i=1; AJvYcCWfG4FimtGW5YcWMsiSVU5jovaDRiTn2kMg5ISlSD8Fx8NveN4FFfBbKWKfJe9juloJR+2Y4MhUrXQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxx3d+JkTSKA3qw9wLGj/5EczCKtUyXyH+H89tmNbTynia/t81u
	E+axLyMt4nrOh51NSV/C2CFcR+uTyW+3viICELxLw8t0seOgtvI/xs/k5z0MTg==
X-Google-Smtp-Source: AGHT+IGZ/UvUArAtJWT1nwuyuQJi8Kb5qTYQYE87bTDQY3yX/hqWrt1eMGjlW4owcKtBb5su++NQFA==
X-Received: by 2002:a05:6000:460d:b0:381:bf27:e845 with SMTP id ffacd0b85a97d-382258f8155mr1834373f8f.1.1731669159215;
        Fri, 15 Nov 2024 03:12:39 -0800 (PST)
Message-ID: <3a57e277-5fd2-4400-86b9-29479b3dfda1@suse.com>
Date: Fri, 15 Nov 2024 12:12:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] common/vmap: Fall back to simple allocator when
 !HAS_VMAP
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241115105036.218418-1-luca.fancellu@arm.com>
 <20241115105036.218418-2-luca.fancellu@arm.com>
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
In-Reply-To: <20241115105036.218418-2-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.11.2024 11:50, Luca Fancellu wrote:
> --- a/xen/common/vmap.c
> +++ b/xen/common/vmap.c
> @@ -426,3 +426,10 @@ void *_xvrealloc(void *va, size_t size, unsigned int align)
>  
>      return ptr;
>  }
> +
> +void iounmap(void __iomem *va)
> +{
> +    unsigned long addr = (unsigned long)(void __force *)va;
> +
> +    vunmap((void *)(addr & PAGE_MASK));
> +}

Why is this being moved here, and converted from inline to out-of-line?
What the description says is insufficient imo, as even if you mean to
only support vmap_contig() and ioremap() on MPU systems, you'll still
need both vunmap() and iounmap().

Plus, if it really needs converting, I don't think it should live at the
very end of the file, past _xvmalloc() and friends. Better suitable places
may then be next to vunmap() itself, or between vfree() and xvfree().

> --- a/xen/include/xen/vmap.h
> +++ b/xen/include/xen/vmap.h
> @@ -5,7 +5,7 @@
>   * purpose area (VMAP_DEFAULT) and a livepatch-specific area (VMAP_XEN). The
>   * latter is used when loading livepatches and the former for everything else.
>   */
> -#if !defined(__XEN_VMAP_H__) && defined(VMAP_VIRT_START)
> +#if !defined(__XEN_VMAP_H__)
>  #define __XEN_VMAP_H__

With this adjustment, where are the functions defined that you "unhide"
the declarations of, in the MPU case? As you say in the description,
vmap.c won't be built in that case.

Also both here and ...

> --- a/xen/include/xen/xvmalloc.h
> +++ b/xen/include/xen/xvmalloc.h
> @@ -40,20 +40,46 @@
>      ((typeof(ptr))_xvrealloc(ptr, offsetof(typeof(*(ptr)), field[nr]), \
>                               __alignof__(typeof(*(ptr)))))
>  
> +#if defined(CONFIG_HAS_VMAP)

... here: Please use the shorter #ifdef when possible.

Jan

