Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA802ACFD3B
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 09:06:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007973.1387173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNR9M-00040V-Ug; Fri, 06 Jun 2025 07:06:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007973.1387173; Fri, 06 Jun 2025 07:06:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNR9M-0003xj-RJ; Fri, 06 Jun 2025 07:06:00 +0000
Received: by outflank-mailman (input) for mailman id 1007973;
 Fri, 06 Jun 2025 07:05:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U7n3=YV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uNR9L-0003Um-CY
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 07:05:59 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b299b98b-42a4-11f0-a301-13f23c93f187;
 Fri, 06 Jun 2025 09:05:58 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3a36748920cso1712655f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 06 Jun 2025 00:05:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7482b085085sm663614b3a.88.2025.06.06.00.05.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jun 2025 00:05:57 -0700 (PDT)
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
X-Inumbo-ID: b299b98b-42a4-11f0-a301-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749193558; x=1749798358; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fnQ/mq9SNiuCv2qjezEcnkEkN+zpWwHyLhaamzituXE=;
        b=e38gpIMK5vAJ7kO+VhiNUuWibKziQHixaAZsIuAmZdnRqPn/pCnVXBcpAla2CN3x75
         e8eslfkHS0Yzjvj2X0a4sCxV7J0kBjxVBwgb0L/7d+xEYwmzq2Gx6E7q3QckJMLGPF/8
         XBPPVsOJ9kyZpYgJxEixwtxvloTU4pTCp6M7spEjUFbjlmzT3bqnpS8CAc3XsqjXNchG
         8ELpRLtbduB6mBK5WmIPWZO/l4IV3C+suBZ6OpFojXwrDHGOYSiNnmyadtoEBdnkwM+G
         txg9r69kz7F1TvR9eFYdkZOZOkK+vWYOdOHj8XReNWy38F9meyDzBs6wcH7Hiww5vP80
         2Lkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749193558; x=1749798358;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fnQ/mq9SNiuCv2qjezEcnkEkN+zpWwHyLhaamzituXE=;
        b=mrFO2kqjwopd8a3kg3XqdR6lYcJbQ9Z7GTE3G67rJ5Y/ugKnSyZPxDQzWqBehCmSuU
         nz57pVSjHJMAeLRGJeL/79DAehByj0Xe7szbBubEpsHgf2gUz+inSxB/mLlUa0FEv+gh
         Sjhc/vuP83qh1Sct4RC3dt4t8+q0+2YjTS33sRxqYIa0b/JyR0tunAlupnPplAyQyLDa
         XObphe+18JM+as/7k9Yb0ylxRauT6xJ68ZF0K1drnuwJC4RSpAtzRF6dcIXHE+fPRFNn
         Iz6IrXSkxTTM4JnQCcfPFHL4j3erQ9vOwqUBcUPz6E+PlonAlH8XPCLafX5LcM0vqvWY
         lk6w==
X-Gm-Message-State: AOJu0YxlC8LUy+fENDq9qNyGTLecrJGMBs9p7ltXaXf7g+EgnZeDEE7t
	71oiH6zug3Bmh+eR984f5zJ6iIvHAAEgBUvd/kfa2CDZPeZNzR0JCC4MuidVky7rGw==
X-Gm-Gg: ASbGnctr4QXJrJuWcDnmbuosgeLOtialBnd14eKYf7eAnpDIFjUgMx8vHyaQgVBZiX9
	JqXoFXLEWezjmGvJWegdju7CZ1H7TBGuWI5fyOWkwxB2HBtSTCazU1XzOvTl6zBAXBgYppNmAms
	GF1YafNVZOePx+Fxnp3wzlfD1mw9VXZGlCTrSA3vYXQgbczgstsMa2J5V9Ffm8PKygpQRbDgBA6
	+nyRzbw5uYoezbYJMzQ4o9UmUi5iW0QRZouWy4MKGuZ0DSjROjediOO7jIl4GBPcWCQ2mUm1XrR
	0SYi0OBrH6dCY0UxxhaSUCuCu1uWFdXEscRmIhwNziHxXiYp+IpReNhDrr4QMyBYBxnpYjjyVj4
	tLO31jEEVw8Oe/sw8fEF7hH0qBFgPsoFNxZDz
X-Google-Smtp-Source: AGHT+IEzuJp6p463iTNdzvc9StdbTn6acCO3dRsCzqcd4eGRyzf1Ozy5A1CmBnB4i2Jyu+dpO30wpg==
X-Received: by 2002:a05:6000:2001:b0:3a4:f7dd:234b with SMTP id ffacd0b85a97d-3a531450c6dmr1787084f8f.0.1749193558149;
        Fri, 06 Jun 2025 00:05:58 -0700 (PDT)
Message-ID: <752cff02-cef6-4a4c-80b9-eba3bbf9b264@suse.com>
Date: Fri, 6 Jun 2025 09:05:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/10] vpci: Refactor REGISTER_VPCI_INIT
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 "Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250526094559.140423-1-Jiqian.Chen@amd.com>
 <20250526094559.140423-5-Jiqian.Chen@amd.com>
 <aEGSp-LKerGb-wIW@macbook.local>
 <BL1PR12MB58497C341C79658B7221A67FE76EA@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB58497C341C79658B7221A67FE76EA@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.06.2025 08:29, Chen, Jiqian wrote:
> On 2025/6/5 20:50, Roger Pau Monné wrote:
>> On Mon, May 26, 2025 at 05:45:53PM +0800, Jiqian Chen wrote: 
>>> +  }; \
>>> +  static vpci_capability_t *const finit##_entry  \
>>> +               __used_section(".data.vpci") = &finit##_t
>>
>> IMO this should better use .rodata instead of .data. 
> Is below change correct?
> 
> +    static const vpci_capability_t *const finit##_entry  \
> +        __used_section(".rodata") = &finit##_t

No, specifically because ...

>> Not that it matters much in practice, as we place it in .rodata anyway.  Note
>> however you will have to move the placement of the VPCI_ARRAY in the
>> linker script ahead of *(.rodata.*), otherwise that section match will
>> consume the vPCI data.
> I am sorry, how to move it ahead of *(.rodata.*) ?
> Is below change correct?
> 
> diff --git a/xen/include/xen/xen.lds.h b/xen/include/xen/xen.lds.h
> index 793d0e11450c..3817642135aa 100644
> --- a/xen/include/xen/xen.lds.h
> +++ b/xen/include/xen/xen.lds.h
> @@ -188,7 +188,7 @@
>  #define VPCI_ARRAY               \
>         . = ALIGN(POINTER_ALIGN); \
>         __start_vpci_array = .;   \
> -       *(SORT(.data.vpci.*))     \
> +       *(.rodata)             \

... this isn't - you'd move _all_ of .rodata into here, which definitely
isn't what you want. What I understand Roger meant was a .rodata-like
section, e.g. .rodata.vpci.* (much like it was .data.vpci.* before).

Jan

