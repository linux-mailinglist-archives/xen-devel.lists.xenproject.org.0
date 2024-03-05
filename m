Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D1D8716F8
	for <lists+xen-devel@lfdr.de>; Tue,  5 Mar 2024 08:34:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688611.1073003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhPJf-0004oA-9H; Tue, 05 Mar 2024 07:34:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688611.1073003; Tue, 05 Mar 2024 07:34:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhPJf-0004mC-6V; Tue, 05 Mar 2024 07:34:23 +0000
Received: by outflank-mailman (input) for mailman id 688611;
 Tue, 05 Mar 2024 07:34:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mek3=KL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rhPJe-0004m1-5e
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2024 07:34:22 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c8214330-dac2-11ee-afda-a90da7624cb6;
 Tue, 05 Mar 2024 08:34:21 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-565c6cf4819so10634571a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 04 Mar 2024 23:34:21 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d8-20020a50fe88000000b005673e29cc0fsm2351194edt.54.2024.03.04.23.34.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Mar 2024 23:34:20 -0800 (PST)
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
X-Inumbo-ID: c8214330-dac2-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709624061; x=1710228861; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YkXHRLwqQQen41Vh/I0b74Fe81BXlt/sJghwfIeKq5o=;
        b=CX5LwFWxSjYEBP3gAynKz4IK9IbalVr6oBXNgPcp/82aFUP/6hKqxIqhOCtVXEWJ76
         r/klmUpsl3DSbBRTNWVzoRRw56YO4cjak6mnKkcocsKh1eFlteaBbDcy9yhVYkV1HGEC
         UYXuErtcaFFmzXXkDOtqRmr5ymleRmuel3jTgGIQXl7llmcjKmkGmR6guGmd/DLdN/mn
         GAiJ+8HqxNv1rHpp9mWv0Ey/BnoXR6qxNOMyPe2JZcAUMKbm7kc0XHNRpyd0TrsgRr33
         3A5pWV9aFY26CPhs8Yo6C7ob97VqRZ1AM7Pts1Wjn5rUy8AN9mWfIhzp3wrJ/o0h2lcf
         tY7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709624061; x=1710228861;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YkXHRLwqQQen41Vh/I0b74Fe81BXlt/sJghwfIeKq5o=;
        b=TOuV+2a362lgYYzVFUaDwwUXQ+swbHDa7wXkhYQSUo4ZAy+L0/xHbh7/ND4Sik9/43
         pd1c8599c+bY1mcZnRA/DkFfOrvUmjWQ0EBHKKjvGAKyGA7qeMLgTsoPHHjW9/D3cFUi
         gFgAmorhi63yLXMajDbYvf7rzn34B5vdQuE/bvEG+n0cjvpiyB4SG6eSOgEDn8nYTTTv
         wZqO+eCVE1YwXJlQJxO2CGUaKt8HYmpc7KVXmuqwcBG6WGlkM6aZz+FMTkMQVdml0xSz
         UHUK6Yq5s7txbNOaoeuEXrsS60V/GfDL3tAulxW3LijIW7YDMcyBDlwYZTJe86Hy9mvh
         90Xw==
X-Forwarded-Encrypted: i=1; AJvYcCWnKn+rskCzUrBm3b2A0F4e9s1Cb8cgWB5gnaifFmfMZQ7J9QYcBU4epLwK08E9F0AUpKh/k3BD3eKUvxpLPn9mq8aNsmt4uyIXGdaGWuQ=
X-Gm-Message-State: AOJu0Ywj6y9Nskbo1jWPUWChCnW1x7gpAWGJENXkRFosmtSSy6oLRnIh
	uEa82VocyCcpFAijfBxoMnPG66vklJhYr8Eu9dfOoPlDdrf6+jKADdVf0pgrNA==
X-Google-Smtp-Source: AGHT+IGtJrkWOuhbmki2x0qWHxgbqKKmw1E4KTXBNI0U/UMOPzHkDv+Gh8psZ+DDlMt4xrZBzFdeYw==
X-Received: by 2002:a05:6402:31f3:b0:567:dd5:7afc with SMTP id dy19-20020a05640231f300b005670dd57afcmr1902733edb.8.1709624060725;
        Mon, 04 Mar 2024 23:34:20 -0800 (PST)
Message-ID: <beb4414f-99d9-4015-b438-83e2d475f2a0@suse.com>
Date: Tue, 5 Mar 2024 08:34:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/*/nospec: Provide common versions of
 evaluate_nospec/block_speculation
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240304161041.3465897-1-andrew.cooper3@citrix.com>
 <20240304161041.3465897-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240304161041.3465897-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.03.2024 17:10, Andrew Cooper wrote:
> --- a/xen/include/xen/nospec.h
> +++ b/xen/include/xen/nospec.h
> @@ -9,6 +9,29 @@
>  
>  #include <asm/nospec.h>
>  
> +/*
> + * Protect a conditional branch from bad speculation.  Architectures *must*
> + * provide arch_evaluate_nospec() for this to be effective.
> + */
> +static always_inline bool evaluate_nospec(bool cond)
> +{
> +#ifndef arch_evaluate_nospec
> +#define arch_evaluate_nospec(cond) cond

Hmm, noticed only while replying to patch 2: If the #define is to be kept
(see my reply there) it needs to be one of

#define arch_evaluate_nospec(cond) (cond)

or

#define arch_evaluate_nospec

Or it ought to be #undef-ed after use (thus preventing use in a context
where "cond" may expand to other than "cond").

Jan

> +#endif
> +    return arch_evaluate_nospec(cond);
> +}
> +
> +/*
> + * Halt speculation unconditonally.  Architectures *must* provide
> + * arch_block_speculation() for this to be effective.
> + */
> +static always_inline void block_speculation(void)
> +{
> +#ifdef arch_block_speculation
> +    arch_block_speculation();
> +#endif
> +}
> +
>  /**
>   * array_index_mask_nospec() - generate a ~0 mask when index < size, 0 otherwise
>   * @index: array element index


