Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E94893B1D7
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 15:42:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764241.1174600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWcG9-0005qT-3V; Wed, 24 Jul 2024 13:42:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764241.1174600; Wed, 24 Jul 2024 13:42:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWcG9-0005nt-0o; Wed, 24 Jul 2024 13:42:25 +0000
Received: by outflank-mailman (input) for mailman id 764241;
 Wed, 24 Jul 2024 13:42:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D33k=OY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sWcG7-0005nk-6g
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 13:42:23 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d9bb430-49c2-11ef-bbfe-fd08da9f4363;
 Wed, 24 Jul 2024 15:42:22 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2ef2d7d8854so38820511fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jul 2024 06:42:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5a7f0bf7489sm4338777a12.57.2024.07.24.06.42.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jul 2024 06:42:20 -0700 (PDT)
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
X-Inumbo-ID: 8d9bb430-49c2-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721828541; x=1722433341; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sZTOPwnQLlYN6U49shl5ZdC1sX9d5RXW2BJovdiRU0A=;
        b=FGlmsdTGhXSMV+5vH3PYxIxVHErEr2NoCVCvYa6yHzWBFZ291sI8Yb9/5rv0KMg59G
         4zatGLSZ2mXDwJggL0Fut1N+saWR1SYyUHSgOA+LVugtjjz04j2d5ojFbveViOLd47Mh
         S/y0nZHvs/d3A3anGmJ/88A3T2CXQ2eiCs5uEOls24gSJ5MQUd0IDCAmQivIx7EaOqye
         5BH1fbq9J42+f2OlgliimS9NYRLsiZjj3lSwnXFpS6kMX7JsBguNsTIEATM7+9+56u2g
         g52kIS8+S0WRC3ZWTmtFjE+kPeapxj9nLJs7foPhm1tZKcU/iniF4sCAICzTgypYjfbb
         /H5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721828541; x=1722433341;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sZTOPwnQLlYN6U49shl5ZdC1sX9d5RXW2BJovdiRU0A=;
        b=oBIA+RT4EU/ExLgAbLc3o56N2GOCCJwb2eFCdc+9C1vkWMrYUpvqCzoN1JOXNsID7S
         91bEGjupP6ooDA8Y7lTYvXX7IqPf7n58+2cWxl6XdDbtytR6K5nWMSunzKvipciTr7jT
         YCJJBKKwj1Fk0cI57jqgPXPV9SsS7Wr33RF2IVLpjvaYpDWvKy8vSFTQHdJad7waot2U
         Ar4RboXBF7m3bdK6W+de6msMQbFCkFeG5GaRsXLF7yDTdd1J8DRQMBy9OXiitMYJwRwi
         /PGjWhd6wsFYCxSvjm+Niqm6P9oD7vkGXPhRnxWhnCPdUyqHSO0qBBBpafP5QIsbKCXt
         7lcw==
X-Forwarded-Encrypted: i=1; AJvYcCVlhBrU7ffKGkS3SbgjONeYl3WL67dKsjdZ0I2ANWAj90br1wCN0oBN4HhN0t8xLTLHJuJBNkscOMIaKCTOvl7V5bv5E/bRPOZCm9s8JFQ=
X-Gm-Message-State: AOJu0YyYyzBBRv8/oi+9c4Gmee4c9tcL/Wh7WwqIOd6xr7kNwEQrMvl5
	QBQieaNJguE/JC70IQnQewLt4gOX+z7f5V+jU+88KYbPnyF/8fS/GLxdDC1tug==
X-Google-Smtp-Source: AGHT+IHJHkAm0khRRJ5m5LkQaD4bCxferwRBEZG16xRjpq6rJzLlI4s+e/Lwm+h3UFBZVV6mnroHSw==
X-Received: by 2002:a2e:8697:0:b0:2ef:2d3d:3cc3 with SMTP id 38308e7fff4ca-2f0324d88f3mr14591001fa.4.1721828541464;
        Wed, 24 Jul 2024 06:42:21 -0700 (PDT)
Message-ID: <5e20a7c7-d369-4be2-a9e4-63de8ef4e5c7@suse.com>
Date: Wed, 24 Jul 2024 15:42:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/efi: Simplify efi_arch_cpu() a little
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Gene Bright <gene@cyberlight.us>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20240722101838.3946983-1-andrew.cooper3@citrix.com>
 <20240722101838.3946983-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240722101838.3946983-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.07.2024 12:18, Andrew Cooper wrote:
> --- a/xen/arch/x86/efi/efi-boot.h
> +++ b/xen/arch/x86/efi/efi-boot.h
> @@ -738,29 +738,30 @@ static void __init efi_arch_handle_module(const struct file *file,
>  
>  static void __init efi_arch_cpu(void)
>  {
> -    uint32_t eax = cpuid_eax(0x80000000U);
> +    uint32_t eax;
>      uint32_t *caps = boot_cpu_data.x86_capability;
>  
>      boot_tsc_stamp = rdtsc();
>  
>      caps[FEATURESET_1c] = cpuid_ecx(1);
>  
> -    if ( (eax >> 16) == 0x8000 && eax > 0x80000000U )
> -    {
> -        caps[FEATURESET_e1d] = cpuid_edx(0x80000001U);
> +    eax = cpuid_eax(0x80000000U);
> +    if ( (eax >> 16) != 0x8000 || eax < 0x80000000U )

Only in the context of the further discussion with Alejandro I've spotted
that the rhs of the || is now dead code. A proper transformation of the
earlier condition would have required <= in place of <.

Jan

