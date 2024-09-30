Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B90DC98A911
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 17:51:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807520.1219045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svIg4-0002Rb-Pv; Mon, 30 Sep 2024 15:51:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807520.1219045; Mon, 30 Sep 2024 15:51:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svIg4-0002PM-N3; Mon, 30 Sep 2024 15:51:12 +0000
Received: by outflank-mailman (input) for mailman id 807520;
 Mon, 30 Sep 2024 15:51:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1QIX=Q4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1svIg3-0001rt-CS
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 15:51:11 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf4f4794-7f43-11ef-a0ba-8be0dac302b0;
 Mon, 30 Sep 2024 17:51:09 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2fac6b3c220so16433941fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2024 08:51:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2783036sm560582366b.15.2024.09.30.08.51.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Sep 2024 08:51:08 -0700 (PDT)
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
X-Inumbo-ID: cf4f4794-7f43-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727711468; x=1728316268; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=73+HHUQzavbWCrLUjMPVriNZk2B9Q5wE/uz776/NDxk=;
        b=W9lIpzg9aWMfcG/N4ZQDAR75uTxZCewvl9UzXA174/ALatLVtmKYgcFBCuOeOxLrKQ
         uXCP+LT4r2hbale853P7EQc1aBkQJyXXe8EtQNZSPp9Gp6Q+WNJlDf/iaO8z7OvE8n1F
         RblNP6V3Q4GX+zZ8mA/gEtQWeQ5YNGpaP6CAYVHqG8NSTLjxT3e18Xi8SUOcXcp4buYO
         favVOVdeyTyEKpv5XY1sB+w9AzXtGIawLDOrrki4hDhcPdc7z+SbMg0cB2CyOHnVgex0
         dK7yIVxTm8iZHKdysN8QyLPy2bpMcQ0eiz2wgtRc/dR7PW84FUn+6gZcBADCmb0Zft9O
         LfJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727711468; x=1728316268;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=73+HHUQzavbWCrLUjMPVriNZk2B9Q5wE/uz776/NDxk=;
        b=U2LGXHxBNdOVEF+hqumys72kMoaaAtJaDsj0sTFi3RrFLcW3UVXvVfWIQ0TuvvZ+nJ
         mTZNQeKhhUN6tvE9ga89c4Fm8QwYhMROsWj0s6FKIulwzgLGo9qw7nPdWGt2XUY5qzdl
         lzYWVF+vPd7MXVzH2344icWh76SKQLAE8iMp8QnRGR9u1teuka3X9+qj15guJbt38l0Z
         8+xxUtq29TG22DSgiGX7sQbRNwq4MlnKH7VFru244ufquMP12wW1rIe4KyHxI3lK4F1C
         Melak35fwPygwFAvEMmmCJF/vXR8KpRtrasCGHidFbLQzv8QsM3+1bVjECfvyWhsAaOP
         xJaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHUkjeueIFjQYW5IjWXAPm0szj4DHBIQWnsU/ia7oHL/x3SephJKGDXayslkYAkUrsxy8PPpzInVI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzsQIt7KsZn6Nt04vNNSiFHij/yWuLbp/HY1ZYNL1SVxrxlOZLm
	LAxAwM/+FsaM9X4ZfMrulYKGldrqReXKq47fAMXanhwD0jFLslx8t0wb+Z2TYw==
X-Google-Smtp-Source: AGHT+IHkEPuyUrNsqFdEvahY0eqUB5+SM0r3as5GO5l5brk1f63ojzmrK4SeMR+AXwrQU6ExyB9hnQ==
X-Received: by 2002:a05:651c:b0f:b0:2fa:be89:3dbe with SMTP id 38308e7fff4ca-2fabe8940fdmr42731351fa.45.1727711468319;
        Mon, 30 Sep 2024 08:51:08 -0700 (PDT)
Message-ID: <e17b2afc-3647-4472-9d37-1510b40ff23d@suse.com>
Date: Mon, 30 Sep 2024 17:51:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] x86/boot: Rewrite EFI/MBI2 code partly in C
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20240926092109.475271-1-frediano.ziglio@cloud.com>
 <20240926092109.475271-3-frediano.ziglio@cloud.com>
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
In-Reply-To: <20240926092109.475271-3-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.09.2024 11:21, Frediano Ziglio wrote:
> @@ -243,7 +234,7 @@ __efi64_mb2_start:
>          /*
>           * Initialize BSS (no nasty surprises!).
>           * It must be done earlier than in BIOS case
> -         * because efi_multiboot2() touches it.
> +         * because efi_multiboot2_prelude() touches it.
>           */
>          mov     %eax, %edx

I think this MOV wants to gain a comment, now that ...

>          lea     __bss_start(%rip), %edi
> @@ -252,36 +243,30 @@ __efi64_mb2_start:
>          shr     $3, %ecx
>          xor     %eax, %eax
>          rep stosq
> -        mov     %edx, %eax

... this one's going away.

> --- a/xen/arch/x86/efi/stub.c
> +++ b/xen/arch/x86/efi/stub.c
> @@ -17,7 +17,8 @@
>   */
>  
>  void __init noreturn efi_multiboot2(EFI_HANDLE ImageHandle,
> -                                    EFI_SYSTEM_TABLE *SystemTable)
> +                                    EFI_SYSTEM_TABLE *SystemTable,
> +                                    const char *cmdline)

While with ...

> --- /dev/null
> +++ b/xen/arch/x86/include/asm/efi.h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef X86_ASM_EFI_H
> +#define X86_ASM_EFI_H
> +
> +#include <xen/types.h>
> +#include <asm/x86_64/efibind.h>
> +#include <efi/efidef.h>
> +#include <efi/eficapsule.h>
> +#include <efi/eficon.h>
> +#include <efi/efidevp.h>
> +#include <efi/efiapi.h>
> +
> +void efi_multiboot2(EFI_HANDLE ImageHandle,
> +                    EFI_SYSTEM_TABLE *SystemTable,
> +                    const char *cmdline);

... the declaration now (supposedly) in scope the need for that earlier
adjustment may be a little more obvious, you still ought to mention it
in the description. If you did, you'd might have noticed that stub.c now
also needs to include the new asm/efi.h, for the declaration to actually
have its full intended effect.

Jan

