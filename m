Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A23812E6C
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 12:19:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654445.1021374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDjjO-0001iz-Od; Thu, 14 Dec 2023 11:18:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654445.1021374; Thu, 14 Dec 2023 11:18:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDjjO-0001g6-LT; Thu, 14 Dec 2023 11:18:18 +0000
Received: by outflank-mailman (input) for mailman id 654445;
 Thu, 14 Dec 2023 11:18:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xmUX=HZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rDjjN-0001g0-4W
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 11:18:17 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79945258-9a72-11ee-98e9-6d05b1d4d9a1;
 Thu, 14 Dec 2023 12:18:15 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-54c7744a93fso11052816a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 Dec 2023 03:18:15 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 hw18-20020a170907a0d200b00a1cbe52300csm9243152ejc.56.2023.12.14.03.18.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Dec 2023 03:18:14 -0800 (PST)
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
X-Inumbo-ID: 79945258-9a72-11ee-98e9-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702552695; x=1703157495; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bk3hkXb4nxoYgE1ftEY+4BzIcQQbOAkFV6q6EsHsQXA=;
        b=IBz0/pYTZlov59fMMiztLpfX6xqTTcWP1RQhh6m0/gGHSwpmvEuL1K4P8HSo8vO1YE
         H6JRMkFra/EdvGi1r54cZB0pW7HtX0KKNChNP3RpNzChqAQ94xckFeOKyYWdrClg3Ceu
         7JWhcCzGcSkMgF/7n4XbQm5nH17tnFdBpNGKBUrEN9IkG0eLMTWruNr25fH+L5TgJO0/
         goPe6h7UmCBKAwLluGfO6200bQsz33p+IjXK87osFjD5Oc7R2dNPOnE66k3qeG5tf28A
         JEu27GzEjfBR2+877pg99ANZ9od3/G8z3Zxz3qShQXGJ328oD6MeIPl49H4h4PKAI7+N
         m2Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702552695; x=1703157495;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bk3hkXb4nxoYgE1ftEY+4BzIcQQbOAkFV6q6EsHsQXA=;
        b=nS0u7xFF949gCsN7h95rERrfTG5ziMgrNWsFrnuoKfhVJOXicwcmpHRFNxGtUXlY0E
         bvbXx8XiQz9ldb2VxUR72lJMStUZc4AB95AJSqlBCPYvU6h/k1BrMFoOZ80knnOWTqBZ
         5z40TwcDE8G6brPsqAnbdVqG/DttuTY00NFGKK59UJEyGjI5kgwT9UX3aKOWhI43OiOd
         rpwf71xqEC3whgUZ9YGP30881v+vAxrWGBBRr7mI9yJEdPlm472HyapOeMos6D99B6Tt
         7Im8ZwuiiQALyL1k2//mMz20wiaj8P859X9bO6j0sTrUfZYsmsKKCTlTOIBWoXU/yPo0
         MA0A==
X-Gm-Message-State: AOJu0YzAyn8Nti883+3GT/8tJnFPDUXgEOzExKpGXKMZzujm8aw4RS3J
	WxivpiQlNg+oqL2NZlQ7RiYU
X-Google-Smtp-Source: AGHT+IH3/ZBtQuiCeqLzc1uFJ7ENzFBXkEm8wFVeXGfj7shAh5ojkCujzqTuplRf0l1IYuMu/apChg==
X-Received: by 2002:a17:907:e8f:b0:a18:b240:915f with SMTP id ho15-20020a1709070e8f00b00a18b240915fmr5572321ejc.69.1702552694831;
        Thu, 14 Dec 2023 03:18:14 -0800 (PST)
Message-ID: <4f6c3481-a44c-4176-a414-b32639556bb0@suse.com>
Date: Thu, 14 Dec 2023 12:18:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] x86/livepatch: align functions to ensure minimal
 distance between entry points
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20231214101719.18770-1-roger.pau@citrix.com>
 <20231214101719.18770-2-roger.pau@citrix.com>
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
In-Reply-To: <20231214101719.18770-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.12.2023 11:17, Roger Pau Monne wrote:
> The minimal function size requirements for livepatch are either 5 bytes (for
> jmp) or 9 bytes (for endbr + jmp) on x86, and always 4 bytes on Arm.  Ensure
> that distance between functions entry points is always at least of the minimal
> required size for livepatch instruction replacement to be successful.
> 
> Add an additional align directive to the linker script, in order to ensure that
> the next section placed after the .text.* (per-function sections) is also
> aligned to the required boundary, so that the distance of the last function
> entry point with the next symbol is also of minimal size.
> 
> Note that it's possible for the compiler to end up using a higher function
> alignment regardless of the passed value, so this change just make sure that
> the minimum required for livepatch to work is present.

That's a possibility which we don't need to be concerned about. Yet isn't it
also possible that we override a larger, deemed better (e.g. performance-wise)
value? I'm somewhat concerned of that case. IOW is -falign-functions= really
the right option to use here? (There may not be one which we would actually
prefer to use.) Specifically -falign-functions (without a value, i.e. using a
machine dependent default) is implied by -O2 and -O3, as per 13.2 gcc doc.

> --- a/xen/Kconfig
> +++ b/xen/Kconfig
> @@ -37,6 +37,24 @@ config CC_HAS_VISIBILITY_ATTRIBUTE
>  config CC_SPLIT_SECTIONS
>  	bool
>  
> +# Set function alignment.
> +#
> +# Allow setting on a boolean basis, and then convert such selection to an
> +# integer for the build system and code to consume more easily.
> +config CC_HAS_FUNCTION_ALIGNMENT
> +	def_bool $(cc-option,-falign-functions=8)

How does this check make sure 4- or 16-byte alignment are also accepted as
valid? (Requesting 8-byte alignment would be at least bogus on e.g. IA-64.)

> +config FUNCTION_ALIGNMENT_4B
> +	bool
> +config FUNCTION_ALIGNMENT_8B
> +	bool
> +config FUNCTION_ALIGNMENT_16B
> +	bool
> +config FUNCTION_ALIGNMENT
> +	int
> +	default 16 if FUNCTION_ALIGNMENT_16B
> +	default  8 if  FUNCTION_ALIGNMENT_8B
> +	default  4 if  FUNCTION_ALIGNMENT_4B

While for the immediate purpose here no "depends on CC_HAS_FUNCTION_ALIGNMENT"
is okay, I still wonder if it wouldn't better be added in case further
"select"s appear.

> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -390,6 +390,9 @@ CFLAGS += -fomit-frame-pointer
>  endif
>  
>  CFLAGS-$(CONFIG_CC_SPLIT_SECTIONS) += -ffunction-sections -fdata-sections
> +ifdef CONFIG_FUNCTION_ALIGNMENT

... e.g. this meaningless? Or is the lack of a default value leading to
the option remaining undefined (rather than assigning some "default"
default, e.g. 0)?

> --- a/xen/arch/arm/xen.lds.S
> +++ b/xen/arch/arm/xen.lds.S
> @@ -44,6 +44,10 @@ SECTIONS
>  #ifdef CONFIG_CC_SPLIT_SECTIONS
>         *(.text.*)
>  #endif
> +#ifdef CONFIG_FUNCTION_ALIGNMENT
> +       /* Ensure enough distance with the next placed section. */
> +       . = ALIGN(CONFIG_FUNCTION_ALIGNMENT);
> +#endif
>  
>         *(.fixup)

Seeing .fixup nicely in context - can't that (and other specialized
sections containing code) also be patched?

Jan

