Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD006917D9E
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 12:18:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748698.1156498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMPiW-0004y8-Gl; Wed, 26 Jun 2024 10:17:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748698.1156498; Wed, 26 Jun 2024 10:17:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMPiW-0004we-Dy; Wed, 26 Jun 2024 10:17:32 +0000
Received: by outflank-mailman (input) for mailman id 748698;
 Wed, 26 Jun 2024 10:17:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WUJr=N4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sMPiV-0004wI-1O
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 10:17:31 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4b3d3757-33a5-11ef-90a3-e314d9c70b13;
 Wed, 26 Jun 2024 12:17:30 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2ec5779b423so43402881fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 03:17:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7069e0a78e2sm2466990b3a.186.2024.06.26.03.17.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jun 2024 03:17:28 -0700 (PDT)
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
X-Inumbo-ID: 4b3d3757-33a5-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719397049; x=1720001849; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VNVUwNDUsFpGA9TMOS6Vumq0S3nackh6fEFU2xxP9vY=;
        b=REw7vk6FlxEDi/lTk5EY4D8cls7l2XPGqYBtdcB0VKjUkEbnRvkHaLwPnKUe1YzW7o
         c6XO8POelwR5yZ4sIoRqaNIfivu55qHi+UdTXKsRgssdCwxQwJBAmzs53cPTuyNkorOh
         5gwALbwqWD0lBTxQjdTFlc044f8nsYbvqiMclshjHyNyknDpLXwpU9K+wtrfebOxe/R4
         xN4L3VAd3JVvHFmlOWWxeJKdRvDywPAtjWTB/CFmR4eBK70ZH1+DvUut0g8MVu3sPzmK
         ahWLlqYRZR9VHXgqRbLUnBeEHqEyTaOlzL9BCI21d4owu4dV0ze5mpQ9R2zaZu5Tf4D2
         oz9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719397049; x=1720001849;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VNVUwNDUsFpGA9TMOS6Vumq0S3nackh6fEFU2xxP9vY=;
        b=CQiRZZdIDuvdedgEUjRy7nHI9ZaurJCvqwt37+nDEdctHxnubFb0oUvR90QdPP9RLj
         RhzHYqK7XcJAaEhZ6ynQ4xh8OlXlL6BXhzEvDhU4cJnWS3Aqoc1r8Pbsm3/JLor/zt6W
         j+UdDDlm/7n1dTsvN0gEPZC3wlLHjPVUqw8nO7QYU4cizMckoRFo1cq+0daviZPVDW1n
         L9zwuqwSpEfJbambzM8HNoO7AzWqlw2p7ZO90uReo4twIQE2kKCsF2XouIGtMwhayAec
         ahqRlPy6RpU+Sjlw5gKi0kD6sLEn2Ehpke+CRhL4w9o8hcuTbTGA4pvB5h21ZIYi9zqm
         ZTbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbU3EKk8c8/W5PGR3CpfsV94+Fx5Dr//L+soHvcQJxPuy1dWxdWtI78k/BRpyIiEC72z9fMo+ogrJcY/OSk5ifMge/TwaK3EDH2SCUvsQ=
X-Gm-Message-State: AOJu0Yzz7uiPy8pJVk1EJzYpic1f9f9VoBf8q8V9DDaNVFDqlaOb9f9Y
	e9twbDYbPk+06jtp3pilOpG1HDlQJOTc864mbogdOjVsGZNiNpc9OrGxf1ubyw==
X-Google-Smtp-Source: AGHT+IFyWGNtOXooXhPnrJW1cU19yjqA5r9VfHb9Ejyi7RLk9ARtyQD2CBk0NvweL3eIUXzO0xINRQ==
X-Received: by 2002:a2e:8089:0:b0:2ec:2d75:509c with SMTP id 38308e7fff4ca-2ec5938a5cbmr76255111fa.46.1719397049237;
        Wed, 26 Jun 2024 03:17:29 -0700 (PDT)
Message-ID: <950da1fb-3df6-4962-b1fe-07e853507e37@suse.com>
Date: Wed, 26 Jun 2024 12:17:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] xen/bitops: Introduce for_each_set_bit()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240625190719.788643-1-andrew.cooper3@citrix.com>
 <20240625190719.788643-5-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240625190719.788643-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.06.2024 21:07, Andrew Cooper wrote:
> The prior version (renamed to bitmap_for_each()) was inefficeint when used
> over a scalar, but this is the more common usage even before accounting for
> the many opencoded forms.
> 
> Introduce a new version which operates on scalars only and does so without
> spilling them to memory.  This in turn requires the addition of a type-generic
> form of ffs().
> 
> Add testing for the new construct alongside the ffs/fls testing.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with two remarks:

> The naming of ffs_g() is taken from the new compiler builtins which are using
> a g suffix to mean type-generic.

As you say, a g suffix, not a _g one; gcc14 documents __builtin_ffsg().
(Seeing it exists I wonder whether we wouldn't want to use it when
available, and only fall back to the macro for older versions.) Any
specific reason you use _g?

> --- a/xen/include/xen/bitops.h
> +++ b/xen/include/xen/bitops.h
> @@ -56,6 +56,16 @@ static always_inline __pure unsigned int ffs64(uint64_t x)
>          return !x || (uint32_t)x ? ffs(x) : ffs(x >> 32) + 32;
>  }
>  
> +/*
> + * A type-generic ffs() which picks the appropriate ffs{,l,64}() based on it's
> + * argument.
> + */
> +#define ffs_g(x)                                        \
> +    sizeof(x) <= sizeof(int) ? ffs(x) :                 \
> +        sizeof(x) <= sizeof(long) ? ffsl(x) :           \
> +        sizeof(x) <= sizeof(uint64_t) ? ffs64(x) :      \
> +        ({ BUILD_ERROR("ffs_g() Bad input type"); 0; })

Related to the patch introducing it: I can see how BUILD_ERROR_ON() may
be deemed sub-optimal here. Nevertheless I think we should be able to
find some common ground there.

Jan

