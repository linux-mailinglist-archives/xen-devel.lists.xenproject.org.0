Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5DE86CB23
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 15:14:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687164.1070159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfhB9-0006vI-Jl; Thu, 29 Feb 2024 14:14:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687164.1070159; Thu, 29 Feb 2024 14:14:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfhB9-0006tR-Gr; Thu, 29 Feb 2024 14:14:31 +0000
Received: by outflank-mailman (input) for mailman id 687164;
 Thu, 29 Feb 2024 14:14:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x8AV=KG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rfhB7-0006s5-SB
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 14:14:29 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d99185ca-d70c-11ee-afd8-a90da7624cb6;
 Thu, 29 Feb 2024 15:14:28 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a446b5a08f0so1934866b.1
 for <xen-devel@lists.xenproject.org>; Thu, 29 Feb 2024 06:14:28 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 gx9-20020a170906f1c900b00a42ec389486sm722879ejb.207.2024.02.29.06.14.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 06:14:27 -0800 (PST)
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
X-Inumbo-ID: d99185ca-d70c-11ee-afd8-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709216068; x=1709820868; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FMxTJoPxKdLtIXOcRWfGkvIL94Wu4mm3XYfDwuO8Ruo=;
        b=JTT3r0TJiDi6AMacoUfF+bGoOW40sdMbo0+8VKmO+K2fiGAT7Nc5HqHpQY0EzQm8y1
         8hkdWyryE7+t5rCmbj/02dciwSxoYOKswO9qzNiKNoUnOZ2O336HXXoHetsvWE1UEhMF
         FkuG2+r52sZIdqPFd5MK/oN6FNSGl3DXxCmuceMitNeQDDGvyopTEAwS/4BFc/2qNFcx
         UzayHgy+owRZoWXZ7jhTvfIaDtcHLsN+zGlwlKvP+jjaj1cm889vWlKF4qtpXnTAaNoV
         2JeJBXDai9B0N20Y/Ok+KuciF5HBVrSwdr14rHPf1Fc6s0g4H+bXvTLAlKuvOYz9oMAh
         cjDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709216068; x=1709820868;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FMxTJoPxKdLtIXOcRWfGkvIL94Wu4mm3XYfDwuO8Ruo=;
        b=Wpz+qVN6tNv1F6KyUmUlBzTwnKONTxz28zYEX1tK+dhWFpDj/GSdtak2gWVuKP9RD4
         5oZB7geb8H/WKdAqD65Lx6NtMj5YAuQMZ1RiSerjIdY8WygvB8S9sUFzqZAMEcU2LqCA
         iwnlTttKCuuQuv5pshJO6NhExeoaGLfp9aczJoZxkg//XaUMV9YyNnbWM62VpspseLFn
         pMpCkq2Zm4lfwkLO6ZADSwumynRqJ/8/VdpqeNPns7C+0EMi825hSBY7tz+egbGoYhhP
         c5xVXm6+tsNJeRVdv3bNOJUydO2tjfFW/kIMoEnLHP/bgfqcf9tc6epa58qYQG3SkgBL
         Xm2Q==
X-Forwarded-Encrypted: i=1; AJvYcCW3FbnF6r2y7f058BW3x7W5qc2FvLmhdVcxoXwDh0cxgf6L4xY9yD14K7OAdBuRhEr/VKrypUmbuOOnmhMqKscpxXbhetYMxhIV3siG3J4=
X-Gm-Message-State: AOJu0Yy8lzWJdBgEUfqTNsAGGIr1WbG5f5NnOoEG4QcIG8e2XXk57uud
	GiRrU6wetLMojKl0plVRErqKU7R8+n6c6uZzuwrH5ojsusxfWnftVQWQZyg/jA==
X-Google-Smtp-Source: AGHT+IFfr8izmvpp9Hh4ziCV8USLe7+E0TqUZq/CsJsRjICkXSWqCZgtM/Kl8KNb68JPwCEs3uyP4Q==
X-Received: by 2002:a17:906:2354:b0:a3f:c32:7b0c with SMTP id m20-20020a170906235400b00a3f0c327b0cmr1569047eja.22.1709216068237;
        Thu, 29 Feb 2024 06:14:28 -0800 (PST)
Message-ID: <1517146f-8bd9-4c8c-95d6-10b754e85d75@suse.com>
Date: Thu, 29 Feb 2024 15:14:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/12] xen/spinlock: add missing rspin_is_locked() and
 rspin_barrier()
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <20231212094725.22184-1-jgross@suse.com>
 <20231212094725.22184-10-jgross@suse.com>
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
In-Reply-To: <20231212094725.22184-10-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.12.2023 10:47, Juergen Gross wrote:
> --- a/xen/common/spinlock.c
> +++ b/xen/common/spinlock.c
> @@ -458,6 +458,23 @@ void _spin_barrier(spinlock_t *lock)
>      spin_barrier_common(&lock->tickets, &lock->debug, LOCK_PROFILE_PAR);
>  }
>  
> +int rspin_is_locked(const rspinlock_t *lock)
> +{
> +    /*
> +     * Recursive locks may be locked by another CPU, yet we return
> +     * "false" here, making this function suitable only for use in
> +     * ASSERT()s and alike.
> +     */
> +    return lock->recurse_cpu == SPINLOCK_NO_CPU
> +           ? spin_is_locked_common(&lock->tickets)
> +           : lock->recurse_cpu == smp_processor_id();
> +}
> +
> +void rspin_barrier(rspinlock_t *lock)
> +{
> +    spin_barrier_common(&lock->tickets, &lock->debug, LOCK_PROFILE_PAR);
> +}

Ah, here we go. Looks all okay to me, but needs re-ordering such that the
earlier patch won't transiently introduce a regression.

Jan

