Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BF1CCC71D
	for <lists+xen-devel@lfdr.de>; Thu, 18 Dec 2025 16:23:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1189805.1510515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWFpu-00043X-QG; Thu, 18 Dec 2025 15:22:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1189805.1510515; Thu, 18 Dec 2025 15:22:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWFpu-00040Q-Mj; Thu, 18 Dec 2025 15:22:38 +0000
Received: by outflank-mailman (input) for mailman id 1189805;
 Thu, 18 Dec 2025 15:22:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rjMb=6Y=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vWFps-00040K-EU
 for xen-devel@lists.xenproject.org; Thu, 18 Dec 2025 15:22:36 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6080ad8f-dc25-11f0-9cce-f158ae23cfc8;
 Thu, 18 Dec 2025 16:22:34 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4775ae5684fso3339495e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 18 Dec 2025 07:22:34 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47be273f147sm48137355e9.7.2025.12.18.07.22.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Dec 2025 07:22:33 -0800 (PST)
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
X-Inumbo-ID: 6080ad8f-dc25-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766071353; x=1766676153; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gbKhiEjso363HPfXjBY0CYwBedfDXFTFr72Ds1gRcEc=;
        b=bym74cVYOsLmDOdV2IJpJ28aMJrENUGDIh+mSOBQ2J5822C2rFYI1hUydUPkpGYsGW
         WFaegq8aUDV0VjhVmDaYkMcEM2oNxGRhoDiLVUL33yJGN/JTZ2GGn7ITmczhdom+nl5q
         0LK8dBdGlo4iT7RLCBHKOmnimS9LpfvKzyDcxlx4OJ/Q0aqjHIFcDH7dsjdHyZ8N7YuD
         JUjsLHIMdz/nqxpK/fSAsUEHv4PYXzfNltKsLCcgoQ5XvWiqMrxrfxixYH+m0SLeLASS
         MC0jgacHi0r8R3ZPHAf9MUJWpSvt+YV/8r8EOZke/kPR0YsVUI6s1+PSMHj3Nv/Xo0wj
         iFqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766071353; x=1766676153;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gbKhiEjso363HPfXjBY0CYwBedfDXFTFr72Ds1gRcEc=;
        b=Pf4Xh0jsfOXjwo0YUZw13QNsn/rso5s9m0w2veUatzIghZnfzd6ab44Z82+yIQs8KD
         ksk23uuh3GG+UA4ZkUg7aUmVbAFVifdQsoXvoU69hkEV+yBhdVbnXD/ncNHMXZQoAUlD
         bUMa8ZLwQx7/jcTQKqUlPuGu67ICLVh2fYobrqoetS+5fhH+Av6tzfJN3irBOKZ0h7OZ
         JJp+LgM7KLmxfmwS/MrBOchgrX/pLASy3Mmknj9htKG6TiYmWMSfNSnPFAj9EGJHs6fO
         4ms8WsI9r0kyZgPglYlndvHBXY8vU0SVeDKxJPhCpnsFcDBwvon+NWY/r1GIMlqN/htu
         HMmg==
X-Forwarded-Encrypted: i=1; AJvYcCVRFTziwc9V208g3vMftAoDX4GV6cmMJIytVgWOFobxa00awcDz0pOgNJ+K/hk4UR/7sw7cMtAvzWY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyx6yQD2uj30C3mH292ypbvwC5Khl/hjbhLnzuSDc5vHb860Dzx
	dfmT2lEtBcq1eW1fP1xR82So/rQ9fTfMauzRRvp7Ggo6Go1+CX4E+sM4FFnDqgHynQ==
X-Gm-Gg: AY/fxX7leylsmYDF2USO8WgF43knABU9f4alARg4dMpo89EWhlEu89puODJGCIjcvVG
	/+yAhT73GxehCEqkWPPpYUb5VK0pLZjAZhx82S/GUPzsQYQWIWivuglItzpHYi8Uhisx2cYlNem
	l9XH6DbhGE933OEpRx3kUgwSyUBvHCWtVuSk7X2l4sgprCxaskmreRkUNPrnkOM4J9Gs50CX+2d
	DglnUzicQrac721bJ3rMum3O6XAvkcW1hmog6j9AIACoIJL/FaMQUft+bp0i8WQ6DPG/G5OTJtG
	sUTQ3lhND+ov7kOtCGWw+Qh3DRXM7rtsHhFZ80yfrKsBYMADq3wXF+LsyXMvXuHs5ix0RgSJg7e
	P5U9btoGtyLl/q1os6pyciJa2NWt4YBKNxEj8IARUdO5BxVQk5t2TvMswhuiMpMldIQoFG1e7dW
	oSbYHUywZhbeG8eahG7gpuuJ9qPXUA0qeTQpQdv7t25Ojfzi3JHqENGf/Dwvi7EGZXHd+2TeifA
	72b/X4jg539lA==
X-Google-Smtp-Source: AGHT+IGTg9t9Y+M4wJ1tKEgpRBAKwEg389Ww5+v6PcEDF5PqkaUzzIimuPR6FdvVmpHbDJ0kKAzi/w==
X-Received: by 2002:a05:600c:a00f:b0:477:97c7:9be7 with SMTP id 5b1f17b1804b1-47a8f8a6adamr229562335e9.1.1766071353426;
        Thu, 18 Dec 2025 07:22:33 -0800 (PST)
Message-ID: <eb7d910d-8fe1-453c-933d-9b2f208c8b12@suse.com>
Date: Thu, 18 Dec 2025 16:22:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v5] xen/x86: guest_access: optimize raw_x_guest() for
 PV and HVM combinations
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251218135926.188059-1-grygorii_strashko@epam.com>
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
In-Reply-To: <20251218135926.188059-1-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.12.2025 14:59, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> Xen uses below pattern for raw_x_guest() functions:
> 
> define raw_copy_to_guest(dst, src, len)        \
>     (is_hvm_vcpu(current) ?                     \
>      copy_to_user_hvm((dst), (src), (len)) :    \
>      copy_to_guest_pv(dst, src, len))
> 
> This pattern works depending on CONFIG_PV/CONFIG_HVM as:
> - PV=y and HVM=y
>   Proper guest access function is selected depending on domain type.
> - PV=y and HVM=n
>   Only PV domains are possible. is_hvm_domain/vcpu() will constify to "false"
>   and compiler will optimize code and skip HVM specific part.
> - PV=n and HVM=y
>   Only HVM domains are possible. is_hvm_domain/vcpu() will not be constified.
>   No PV specific code will be optimized by compiler.
> - PV=n and HVM=n
>   No guests should possible. The code will still follow PV path.
> 
> Rework raw_x_guest() code to use static inline functions which account for
> above PV/HVM possible configurations with main intention to optimize code
> for (PV=n and HVM=y) case.
> 
> For the case (PV=n and HVM=n) return "len" value indicating a failure (no
> guests should be possible in this case, which means no access to guest
> memory should ever happen).

I agree with Teddy's sentiment towards HVM={y,n} not really mattering when
PV=n, as far as non-HVM domains go.

> --- a/xen/arch/x86/include/asm/guest_access.h
> +++ b/xen/arch/x86/include/asm/guest_access.h
> @@ -13,26 +13,64 @@
>  #include <asm/hvm/guest_access.h>
>  
>  /* Raw access functions: no type checking. */
> -#define raw_copy_to_guest(dst, src, len)        \
> -    (is_hvm_vcpu(current) ?                     \
> -     copy_to_user_hvm((dst), (src), (len)) :    \
> -     copy_to_guest_pv(dst, src, len))
> -#define raw_copy_from_guest(dst, src, len)      \
> -    (is_hvm_vcpu(current) ?                     \
> -     copy_from_user_hvm((dst), (src), (len)) :  \
> -     copy_from_guest_pv(dst, src, len))
> -#define raw_clear_guest(dst,  len)              \
> -    (is_hvm_vcpu(current) ?                     \
> -     clear_user_hvm((dst), (len)) :             \
> -     clear_guest_pv(dst, len))
> -#define __raw_copy_to_guest(dst, src, len)      \
> -    (is_hvm_vcpu(current) ?                     \
> -     copy_to_user_hvm((dst), (src), (len)) :    \
> -     __copy_to_guest_pv(dst, src, len))
> -#define __raw_copy_from_guest(dst, src, len)    \
> -    (is_hvm_vcpu(current) ?                     \
> -     copy_from_user_hvm((dst), (src), (len)) :  \
> -     __copy_from_guest_pv(dst, src, len))
> +static inline unsigned int raw_copy_to_guest(void *dst, const void *src,
> +                                             unsigned int len)

A side effect of the converting to inline functions, besides being more
intrusive, is that now you will want to add proper __user modifiers.
See lib/copy-guest.c's use of them. That said, ..._user_hvm() functions
also don't have them, but imo wrongly so. Really I question the use of
pointers in that case, because they "point" into a different address
space, entirely inaccessible via use of those pointers. Hence adding
__user is going to be only a marginal improvement for the HVM case, but
is going to be wanted for the PV side of things.

Jan

