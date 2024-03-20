Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3838814B8
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 16:39:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696007.1086483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmy23-0006BN-LF; Wed, 20 Mar 2024 15:39:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696007.1086483; Wed, 20 Mar 2024 15:39:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmy23-00069Y-IT; Wed, 20 Mar 2024 15:39:11 +0000
Received: by outflank-mailman (input) for mailman id 696007;
 Wed, 20 Mar 2024 15:39:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LUpO=K2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmy21-000682-CF
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 15:39:09 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd806087-e6cf-11ee-afdd-a90da7624cb6;
 Wed, 20 Mar 2024 16:39:08 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a46d0a8399aso185282366b.1
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 08:39:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 dt22-20020a170906b79600b00a4669f6c2e2sm7364250ejb.44.2024.03.20.08.39.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Mar 2024 08:39:07 -0700 (PDT)
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
X-Inumbo-ID: fd806087-e6cf-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710949148; x=1711553948; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sr6KrqljbfsGwtYhah3+YpUsKXZC0JiQScbtLwgpKMA=;
        b=AmvcJXE3+t0IWNXnJ05zkpD0x9U/zvCDy93ubcVlMIhQIyTiw8t8c5hgjbYFdY196H
         rKx4daNBuqBCBjpFE8iEMy+Im4MvUWipKX3jEThtet3rPrliY5qIimHDxoqWm5ZhTfcv
         Glns/E4HcBx8kXg+Dd7iuUes5+EezvghhllaTzoO+WcXttCdQUl3QGHsOnhMumkDP4YS
         MxQyXYfwL8mJUD0lskY0/UBK38c/kFMvp+tc10f1+9s/Fcwl3B1+piMnAcvQva3FPa41
         zX3B2l0Oln8+d31xDwIT/YPfDDvgjCBd4ENfMxcCPK8ZcTzxzLjwlWDefGSqR9+Grq2f
         ilTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710949148; x=1711553948;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sr6KrqljbfsGwtYhah3+YpUsKXZC0JiQScbtLwgpKMA=;
        b=hpO9/+A4gbH6CghePF+1A9k/pt1VwaBL9UGSxqBAhQ12zBH7DtTHnbJwTvM3qV6tgz
         kBoJZSkBJiYURx73K1kfRgR8wWoriCf3Bdf2wG4nLT3o3QWUFk8pEP1lBtCpArJ6pywv
         BJLe16EXEfz9ySJZnbJGgcwW4Ih5IkREv9ZHPLPg3D/WFJUNWZ5MpIFsFBxz0oyiLJb8
         cP7/Jhvs7Xdp1H5Sgz9cHvjiimI3f10ljoWsLo09OTeMoMI4xsvR4vsMZhWN7AxN8Vcs
         m++VM+HaWkQHdEEZL76fWuBtgKv8k59wqIJV5Uo0JMAk2mdr8eyzGgoezesuFnR5r/wd
         rOgA==
X-Forwarded-Encrypted: i=1; AJvYcCXwyfDAnCa58iDQQ7ym6vV5qXWvb2awQyPnId9neLSQcqt8Na2oqSnfTPlB0amfkHkunqYmNB6fVwMuuAo4YA1Cy555BJSsFalS0A9MFig=
X-Gm-Message-State: AOJu0YyM7FR1TfKx09JlvAXlZ4cenwXgGVWcS/2tAUY66D1dlSnVlx0z
	XkFZHO2Rz4fkioTBdlMxT5WRvSkTuFCT/sJ/CfKBPmYTJqqZDpAD3tVkwD9ijQ==
X-Google-Smtp-Source: AGHT+IFsBa/nkQrm62YC41Vb9H8Z9+gkCInx2JlJdqtODLldg4dLfA5Pt6yPyq+Mt8F6S7wI8neiZg==
X-Received: by 2002:a17:907:76c5:b0:a45:f9c5:3024 with SMTP id kf5-20020a17090776c500b00a45f9c53024mr37350ejc.11.1710949147752;
        Wed, 20 Mar 2024 08:39:07 -0700 (PDT)
Message-ID: <0f1dccc2-ef5e-40de-91de-c5ba70a09c42@suse.com>
Date: Wed, 20 Mar 2024 16:39:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/20] xen/bitops: implement fls{l}() in common logic
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1710517542.git.oleksii.kurochko@gmail.com>
 <e7fc769a4f08ca00972faf4ce99e562d2eb3c00c.1710517542.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <e7fc769a4f08ca00972faf4ce99e562d2eb3c00c.1710517542.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.03.2024 19:06, Oleksii Kurochko wrote:
> Return type was left 'int' because of the following compilation error:
> 
> ./include/xen/kernel.h:18:21: error: comparison of distinct pointer types lacks a cast [-Werror]
>        18 |         (void) (&_x == &_y);            \
>           |                     ^~
>     common/page_alloc.c:1843:34: note: in expansion of macro 'min'
>      1843 |         unsigned int inc_order = min(MAX_ORDER, flsl(e - s) - 1);
> 
> generic_fls{l} was used instead of __builtin_clz{l}(x) as if x is 0,
> the result in undefined.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Assuming Andrew's pending change goes in as posted, I'm okay with this to
(as simply following suit). Without that having happened, I can't very
well offer an ack here. Just one nit:

> --- a/xen/include/xen/bitops.h
> +++ b/xen/include/xen/bitops.h
> @@ -69,6 +69,30 @@ static inline int generic_flsl(unsigned long x)
>  
>  #include <asm/bitops.h>
>  
> +static always_inline __pure int fls(unsigned int x)
> +{
> +    if (__builtin_constant_p(x))

Style (missing blanks immediately inside the parentheses), also again ...

> +        return generic_fls(x);
> +
> +#ifndef arch_fls
> +#define arch_fls generic_fls
> +#endif
> +
> +    return arch_fls(x);
> +}
> +
> +static always_inline __pure int flsl(unsigned long x)
> +{
> +    if (__builtin_constant_p(x))

... here.

Jan

