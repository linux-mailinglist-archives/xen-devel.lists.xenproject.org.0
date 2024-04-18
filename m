Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 603788A9315
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 08:29:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707935.1106379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxLGP-0007I1-0q; Thu, 18 Apr 2024 06:28:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707935.1106379; Thu, 18 Apr 2024 06:28:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxLGO-0007G1-UU; Thu, 18 Apr 2024 06:28:52 +0000
Received: by outflank-mailman (input) for mailman id 707935;
 Thu, 18 Apr 2024 06:28:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wA62=LX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rxLGN-0007Fv-SP
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 06:28:51 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea21aa17-fd4c-11ee-94a3-07e782e9044d;
 Thu, 18 Apr 2024 08:28:49 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-418dc00a31aso3465195e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 17 Apr 2024 23:28:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 e13-20020a05600c4e4d00b00418e869f896sm709193wmq.17.2024.04.17.23.28.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Apr 2024 23:28:47 -0700 (PDT)
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
X-Inumbo-ID: ea21aa17-fd4c-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713421728; x=1714026528; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S7mhzDfM/DGG9UmyDmdHuMtqTkvIkhj5Aeq6DEqLhwc=;
        b=Ou3oknHR36nA0zVGUEGMAY6TSdRFAfD31YcflXidxMlFBAyrGTJD2BI17LesHvKiJw
         eNjBULXQH40USONK2luCThS8dVPwP5UVk6L3feVvaYds5rclfogO1kbLc53XXK4thQIy
         SQ7xAG0qjz6Cavm6IlsSXpfDPHms7lhSyWXxZvVEnjYfhJ+AehJYmcakVuMdZ2skRHUm
         4XCwvmSDZRiOWdvP36+JhPR7GXrhC0OyE2g2pyNwY6eNMmio23L6tOf+H0iiJysyKCHi
         9rBp2V0D1UjoswRDf2MwXVzkmgajs/oPnO/85/3X/x9mt0+8Q8HFC8cEDAjNNHDkUnza
         EQdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713421728; x=1714026528;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S7mhzDfM/DGG9UmyDmdHuMtqTkvIkhj5Aeq6DEqLhwc=;
        b=VoeW2hV1YTtnf2yCJ4I7k6EEePueU+ljNaDXBJCRv88f4tOVbncx7/tj7hZ0B5QIQK
         SIp3YQjMeW29vxoOiCfbqN611pv8J3qHocrJ6KaEXywilT/UUahnsfCFrkCz1s8lpEOY
         Px7Qhm3cqIByr6FUDVeRCdr4zvZGKoEnlMUizNEwZxQ/lKIccG55xKxE7anza7gDmP+i
         dR0zEU3MbPvzIqLrP/av2gLwm+wwFv6k7HgI+lCQfNhfaeH6QnS9FpJ4xWJmuDssMALr
         xPWVSK39JEvAy7EZO9Zrh4JT/M7uBaKqvP3fy/yuW/6iKgSDnIOubp3kgaLMoV3iW47U
         1Ogw==
X-Forwarded-Encrypted: i=1; AJvYcCUaIxCIXoD/cj9Bud2FnU4h8cqAr2kBS6v+BePsIjRclzerav9ql04iBcREpxanfbk7zBDV8sD6WWSg7KjfxbD+6hiNXJvDzEBJuhHyGw4=
X-Gm-Message-State: AOJu0Yzw3H/PTOuugHZ/8lQWOkZ3aK9C+klTkaIZLCci2dqbMYikIz6P
	vUtkoKWNS/YtfyEGfyTTJijEtS8p37yazcMQhw9j076/+xgTITSIHuS2IkANVQ==
X-Google-Smtp-Source: AGHT+IHpjuYNeXsiQsmtIbmFq09mMLCDna9NMumgygMPiHcEZ+PMTVUwpeqpKKsOE5/rGPxLA7Mvkw==
X-Received: by 2002:a05:600c:4586:b0:418:4841:162a with SMTP id r6-20020a05600c458600b004184841162amr1093746wmo.15.1713421727909;
        Wed, 17 Apr 2024 23:28:47 -0700 (PDT)
Message-ID: <930fcf9b-2ce3-4477-88f0-e3881cacdae7@suse.com>
Date: Thu, 18 Apr 2024 08:28:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/13] xen/device_tree: Introduce function to merge
 overlapping intervals
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20240409114543.3332150-1-luca.fancellu@arm.com>
 <20240409114543.3332150-13-luca.fancellu@arm.com>
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
In-Reply-To: <20240409114543.3332150-13-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.04.2024 13:45, Luca Fancellu wrote:
> --- a/xen/arch/x86/extable.c
> +++ b/xen/arch/x86/extable.c
> @@ -23,7 +23,8 @@ static inline unsigned long ex_cont(const struct exception_table_entry *x)
>  	return EX_FIELD(x, cont);
>  }
>  
> -static int init_or_livepatch cf_check cmp_ex(const void *a, const void *b)
> +static int init_or_livepatch cf_check cmp_ex(const void *a, const void *b,
> +                                             const void *data)
>  {
>  	const struct exception_table_entry *l = a, *r = b;
>  	unsigned long lip = ex_addr(l);
> @@ -53,7 +54,7 @@ void init_or_livepatch sort_exception_table(struct exception_table_entry *start,
>                                   const struct exception_table_entry *stop)
>  {
>      sort(start, stop - start,
> -         sizeof(struct exception_table_entry), cmp_ex, swap_ex);
> +         sizeof(struct exception_table_entry), cmp_ex, swap_ex, NULL);
>  }

Not the least because of this addition of an entirely useless parameter / argument
I'm not in favor of ...

> --- a/xen/include/xen/sort.h
> +++ b/xen/include/xen/sort.h
> @@ -23,8 +23,8 @@
>  extern gnu_inline
>  #endif
>  void sort(void *base, size_t num, size_t size,
> -          int (*cmp)(const void *a, const void *b),
> -          void (*swap)(void *a, void *b, size_t size))
> +          int (*cmp)(const void *a, const void *b, const void *data),
> +          void (*swap)(void *a, void *b, size_t size), const void *cmp_data)
>  {

... this change. Consider you were doing this on a C library you cannot change.
You'd have to find a different solution anyway. And the way we have sort()
right now is matching the C spec. The change to do renders things unexpected to
anyone wanting to use this function in a spec-compliant way. One approach may
be to make an adjustment to data representation, such that the extra reference
data is accessible through the pointers already being passed.

Jan

