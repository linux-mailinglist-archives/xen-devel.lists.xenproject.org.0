Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 012178785C9
	for <lists+xen-devel@lfdr.de>; Mon, 11 Mar 2024 17:55:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691546.1077603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjiuV-0008QQ-TF; Mon, 11 Mar 2024 16:53:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691546.1077603; Mon, 11 Mar 2024 16:53:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjiuV-0008OR-Qk; Mon, 11 Mar 2024 16:53:59 +0000
Received: by outflank-mailman (input) for mailman id 691546;
 Mon, 11 Mar 2024 16:53:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZVPQ=KR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rjiuT-0008OL-Nv
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2024 16:53:57 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f29ded19-dfc7-11ee-afdc-a90da7624cb6;
 Mon, 11 Mar 2024 17:53:55 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a3fb8b0b7acso362654266b.2
 for <xen-devel@lists.xenproject.org>; Mon, 11 Mar 2024 09:53:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d13-20020a170906370d00b00a44e180b9a5sm3018723ejc.1.2024.03.11.09.53.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Mar 2024 09:53:55 -0700 (PDT)
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
X-Inumbo-ID: f29ded19-dfc7-11ee-afdc-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710176035; x=1710780835; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KCuXvdGMlzHVbbFUP+iVfUemSQDFYHFbdrbEPZTW4Ac=;
        b=UcImCZQ3E0PSEydMGCdhtBAcS7ca04tR9farzbJQw188VIzourK7drlnm4Mjmeoco0
         xoI2OlcPOwYroUcvXyit5piQiyqLABOvC0U0USwpI/XuHP+DPZDRMupPLx1pbCp5PvXV
         t3zU4UieXQGrcckpUv6WLw9VIkblQLGjL3oZ4OfuC4ZnberQNPcmi3Yg18Ky2l9iFRFH
         bK9LDAk9aAAg6Sp2swrHRzMNJMcvG7qe3UKmH8VDn4vTAkqfKzbcZYo08WTR0gQbadhN
         EztpQHbpuSbFMlvAgX8DumHj/RMR7aXHvy6ml+vkw/f3kkSM9XNms7ec3J4SN+NC7mqr
         m3Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710176035; x=1710780835;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KCuXvdGMlzHVbbFUP+iVfUemSQDFYHFbdrbEPZTW4Ac=;
        b=e1UJISGgIMhmOeEQn+EYI0KAWRU3aAGWHcmq0R2PRWR1GWrdf7EtCMZeYRjhPKMdMA
         ey9ieusFumCZrht3efy6yWQglPVqbOq/t6q/W7+2fXqUSm+oW2EKlQcJbiuW5f3SpQDL
         mBPMlAgeJ7D6l0O3drUnrqmWLh06eGfKHJKC4XMRjcLsTv20V1Ui2RCyYAFwaMNoL3Bj
         xEgasLf6iJUOCOqskYu8lIGoBpoTb4PnhtKvzEnHYwDYexJlCI+kEVAixM1febNDuD0J
         xvuIaewdlGllIFHXnxANv8wWRzCH7YVCTPm//WbXUBVlTRkzKQ47iZxR3S1kXfTD7s4X
         m9yw==
X-Forwarded-Encrypted: i=1; AJvYcCWbPNCdAxM48mhbYHfrhchQj5RipKudAjGwqyIzBrlMhYyHaZQULPIERMPqJT5e1Ew9HZcycez2DItdzM/3tpipbAK13WTlmFdvYkg7HsY=
X-Gm-Message-State: AOJu0YwXjvppnvBfv1FeWT/s9tMywnUZ/gBytaBumhQ6Fls+uwde0AMa
	84jcq+Q0bGnAjsM2duDuFxachF4VWxralkDXOA97YlhqjI2AqLt7mrknxifxQw==
X-Google-Smtp-Source: AGHT+IHgJzCMeVgLtTAY7EFtMZOfMxMQvPa/Fx3Wbc97SvJp+LUwUayqw1sqd2Bfl0DGcvfJXmkQ4g==
X-Received: by 2002:a17:907:a0cc:b0:a45:f71e:9e49 with SMTP id hw12-20020a170907a0cc00b00a45f71e9e49mr4217287ejc.67.1710176035347;
        Mon, 11 Mar 2024 09:53:55 -0700 (PDT)
Message-ID: <5b4054c0-a5ab-4fc0-9754-8253b12c849d@suse.com>
Date: Mon, 11 Mar 2024 17:53:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] x86/PVH: Support relocatable dom0 kernels
Content-Language: en-US
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20240306185032.103216-1-jason.andryuk@amd.com>
 <20240306185032.103216-4-jason.andryuk@amd.com>
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
In-Reply-To: <20240306185032.103216-4-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.03.2024 19:50, Jason Andryuk wrote:
> --- a/xen/arch/x86/hvm/dom0_build.c
> +++ b/xen/arch/x86/hvm/dom0_build.c
> @@ -537,6 +537,109 @@ static paddr_t __init find_memory(
>      return INVALID_PADDR;
>  }
>  
> +static bool __init check_load_address(
> +    const struct domain *d, const struct elf_binary *elf)
> +{
> +    paddr_t kernel_start = (paddr_t)elf->dest_base & PAGE_MASK;
> +    paddr_t kernel_end = ROUNDUP((paddr_t)elf->dest_base + elf->dest_size,
> +                                 PAGE_SIZE);
> +    unsigned int i;
> +
> +    /*
> +     * The memory map is sorted and all RAM regions starts and sizes are
> +     * aligned to page boundaries.
> +     */
> +    for ( i = 0; i < d->arch.nr_e820; i++ )
> +    {
> +        paddr_t start = d->arch.e820[i].addr;
> +        paddr_t end = d->arch.e820[i].addr + d->arch.e820[i].size;
> +
> +        if ( start <= kernel_start &&
> +             end >= kernel_end &&
> +             d->arch.e820[i].type == E820_RAM )
> +            return true;
> +    }
> +
> +    return false;
> +}
> +
> +/*
> + * Find an e820 RAM region that fits the kernel at a suitable alignment.
> + */
> +static paddr_t find_kernel_memory(

__init ?

Jan

