Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7A38B253F
	for <lists+xen-devel@lfdr.de>; Thu, 25 Apr 2024 17:36:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712148.1112597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s018W-0002ht-IO; Thu, 25 Apr 2024 15:35:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712148.1112597; Thu, 25 Apr 2024 15:35:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s018W-0002fs-F5; Thu, 25 Apr 2024 15:35:48 +0000
Received: by outflank-mailman (input) for mailman id 712148;
 Thu, 25 Apr 2024 15:35:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hfi/=L6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s018V-0002fh-89
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2024 15:35:47 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b9d60f0-0319-11ef-909a-e314d9c70b13;
 Thu, 25 Apr 2024 17:35:45 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a58a36008ceso152611866b.0
 for <xen-devel@lists.xenproject.org>; Thu, 25 Apr 2024 08:35:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a14-20020a1709062b0e00b00a58bcb55704sm614444ejg.165.2024.04.25.08.35.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Apr 2024 08:35:44 -0700 (PDT)
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
X-Inumbo-ID: 7b9d60f0-0319-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714059345; x=1714664145; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fQjtAH0J11Itb67myr50EyZBDMFXRVFSjHG59dRBDwk=;
        b=dEvFArgLcC3H8d1ec5BV9Kus2RrjE5pHvyRXP30vIgVA/TYk2eNfg/jKCRA7Hk7JeD
         M5bu+cS/hyc+1WR4CXR6vslsWftuXima/hzUjncHAIngCeVyQFctjEEhPoqWU4iX9DFA
         9QR0hvmp96hgaTbovBqE59E05o29lM0hx6FkfJbCLRzv2DKq5I/pfL9ChgxOhpQ2N0we
         ziNKEme0Cc7alDVourJ+MBHUSTapOv0hEIq6Peu1z9iugw6Qvfsj4kMeULGKzcIyAx72
         ESb4kfTUSCaLimJvBAYfPjn++yP8848wrQA9fLMU5bEHnk+Ew8iM+DvKpxLo2ok08cSx
         vfNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714059345; x=1714664145;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fQjtAH0J11Itb67myr50EyZBDMFXRVFSjHG59dRBDwk=;
        b=Y93okuZg4Fx8sQ+dADDISpfR3X4854fOfshN+ykSlHAdQ17vyS+0mUkxUSUwYPWONf
         2bnkz9nbfVDG8RuekfOtLRwrJcuQc8yTskzJZJFd5toAo3YDgYboAb2t/YKMkIi+c4Fb
         UJqc1YIsjXpB1RLdmVNMAKg15UBMAXSrsqvQiNWrn+UudumB9ZwgDazU1UdXnPbLlYDi
         YgOrl0uG3q65AVBvuFWKphK/rQq+iQ+TW5n/mKh136zeM3Ij8JPnweS+noIjtJ5dpvNn
         joHbWXnMmAQ0XYy2zP862hD7Q9qIkYVAxPE4Aix2ROJdKs1qvmHefsntqdnXvbUUE799
         WrLg==
X-Forwarded-Encrypted: i=1; AJvYcCWqeA9TDPq3EkDT9yAwov7r7JmYa6BUne75j7jSBaL3cPDih+Q6SrMbjShK4xxgtBezRVlpIFo5B067fl7sP2OwzcIdHZHnaAhJUd3st0g=
X-Gm-Message-State: AOJu0YxuIY5zDJ8pdFEyql7BCQj18NeeH/8DBNMK3QI1/S5xHmYVgwNj
	g37OVa5nINBGrQ4Q0qx4QkmgcIFgcccEZ0JnML7frolPbP2mg/k62eBIp+3RRA==
X-Google-Smtp-Source: AGHT+IHLJ1LWhlSgbnIS3V6Lr0XHlQFipni6ZbqLRmXf1EAJ2xQ5y29azDzm0QSPRCl6Z7jrlv83RQ==
X-Received: by 2002:a17:906:15d7:b0:a46:bfe2:521f with SMTP id l23-20020a17090615d700b00a46bfe2521fmr74247ejd.24.1714059345072;
        Thu, 25 Apr 2024 08:35:45 -0700 (PDT)
Message-ID: <3827c11c-6d47-411d-a356-871def4e5b30@suse.com>
Date: Thu, 25 Apr 2024 17:35:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 02/17] xen: introduce generic non-atomic test_*bit()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1713347222.git.oleksii.kurochko@gmail.com>
 <1a0977e3cf5a2de9f760ca5ec89a0d096894a9e3.1713347222.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <1a0977e3cf5a2de9f760ca5ec89a0d096894a9e3.1713347222.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.04.2024 12:04, Oleksii Kurochko wrote:
> --- a/xen/arch/ppc/include/asm/page.h
> +++ b/xen/arch/ppc/include/asm/page.h
> @@ -4,7 +4,7 @@
>  
>  #include <xen/types.h>
>  
> -#include <asm/bitops.h>
> +#include <xen/bitops.h>
>  #include <asm/byteorder.h>

This wants to move up into the xen/*.h group then, like you have done ...

> --- a/xen/arch/ppc/mm-radix.c
> +++ b/xen/arch/ppc/mm-radix.c
> @@ -1,11 +1,11 @@
>  /* SPDX-License-Identifier: GPL-2.0-or-later */
> +#include <xen/bitops.h>
>  #include <xen/init.h>
>  #include <xen/kernel.h>
>  #include <xen/mm.h>
>  #include <xen/types.h>
>  #include <xen/lib.h>
>  
> -#include <asm/bitops.h>
>  #include <asm/byteorder.h>
>  #include <asm/early_printk.h>
>  #include <asm/page.h>

.. e.g. here.

> --- a/xen/include/xen/bitops.h
> +++ b/xen/include/xen/bitops.h
> @@ -65,10 +65,137 @@ static inline int generic_flsl(unsigned long x)
>   * scope
>   */
>  
> +#define BITOP_MASK(nr)  ((bitop_uint_t)1 << ((nr) % BITOP_BITS_PER_WORD))
> +
> +#define BITOP_WORD(nr)  ((nr) / BITOP_BITS_PER_WORD)
> +
>  /* --------------------- Please tidy above here --------------------- */
>  
>  #include <asm/bitops.h>
>  
> +#ifndef arch_check_bitop_size
> +#define arch_check_bitop_size(addr)

Can this really do nothing? Passing the address of an object smaller than
bitop_uint_t will read past the object in the generic__*_bit() functions.

> +#endif
> +
> +/**
> + * generic__test_and_set_bit - Set a bit and return its old value
> + * @nr: Bit to set
> + * @addr: Address to count from
> + *
> + * This operation is non-atomic and can be reordered.
> + * If two examples of this operation race, one can appear to succeed
> + * but actually fail.  You must protect multiple accesses with a lock.
> + */
> +static always_inline bool
> +generic__test_and_set_bit(unsigned long nr, volatile void *addr)
> +{
> +    bitop_uint_t mask = BITOP_MASK(nr);
> +    volatile bitop_uint_t *p = ((volatile bitop_uint_t *)addr) + BITOP_WORD(nr);

The revision log suggests excess parentheses were dropped from such cast
expressions.

> --- a/xen/include/xen/types.h
> +++ b/xen/include/xen/types.h
> @@ -64,6 +64,11 @@ typedef __u64 __be64;
>  
>  typedef unsigned int __attribute__((__mode__(__pointer__))) uintptr_t;
>  
> +#ifndef BITOP_TYPE
> +    #define BITOP_BITS_PER_WORD 32
> +    typedef uint32_t bitop_uint_t;

Personally I find this indentation odd / misleading. For pre-processor
directives the # preferrably remains first on a line (as was iirc
demanded by earlier C standards), followed by one or more blanks if so
desired. File-scope declarations imo should never be indented.

Jan

