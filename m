Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D59897E989
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 12:10:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.801828.1211853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssg0o-0006eL-76; Mon, 23 Sep 2024 10:09:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 801828.1211853; Mon, 23 Sep 2024 10:09:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssg0o-0006bW-4S; Mon, 23 Sep 2024 10:09:46 +0000
Received: by outflank-mailman (input) for mailman id 801828;
 Mon, 23 Sep 2024 10:09:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aZUN=QV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ssg0m-0006bQ-RM
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2024 10:09:44 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3c0bf8e-7993-11ef-99a2-01e77a169b0f;
 Mon, 23 Sep 2024 12:09:43 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5c24c92f699so4076467a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2024 03:09:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c42bb497adsm10038665a12.14.2024.09.23.03.09.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Sep 2024 03:09:42 -0700 (PDT)
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
X-Inumbo-ID: f3c0bf8e-7993-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727086182; x=1727690982; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DCIcXnPwBAjgzJP+shBF9R83cSHaLmTyzMsIiA+ky2E=;
        b=dZGDms50587B79G0ijFvQAmRi1UOhkEmmigrEO3nISiKnQo0Euf2i4rLijw/6U0S+5
         k7ywy8cLw5R1kqZACE19l27gSg8OU8FgKKaUThgAbPBwvBSQYuvCKvHNCY0fQBXWfUrt
         Lw9zV+lOrF3iWH/yzceMxbnqrpiivcDwbnYEfuPJJZZlAYyXUYZALIEum0cTcG784kg9
         KSAnwStnK7hPIirc0xZQxCHqIJnLEh9SwNKufuyuy1AvXuweB0R7Zd53OljroEJ3hWxh
         etOexaUmIklig7KNEkke6y89/HlZDUXaP970n+jpMRq5AyhFjTJjEuamM8mRaZoWxZoZ
         nxSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727086182; x=1727690982;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DCIcXnPwBAjgzJP+shBF9R83cSHaLmTyzMsIiA+ky2E=;
        b=gJKuwJCbkeWrzdMEPSGb3LeIA6DuZaZ29rcOWqS+XoxCxR+Y1m3rDjF23ahUBdavF+
         Yjwh1/NRmdos/b4RyROU+/U2AYXLauBS7gO/FhdM6St4/hgwwJIE28jNauE7JRLMYTsZ
         0cnoJPgsrU2MupISn3OyJaojNeKdhZnRfG9Z4R7JoIl4zTiiy7Ij9UY5l/YEcGPaLd61
         Ga9nkqgIJaanbwj2TzRj1PWPmR4FLY5vN7ymFq7uMj4Gb0tjdoHql4Tinp1VdZ7pAHPJ
         26UoEF/XfdSWPB4ZapqwJT7qoo3CxO+WnMvvaYGpfmHaNReUbr/mBSYxM52a64DPD9NS
         yusw==
X-Forwarded-Encrypted: i=1; AJvYcCVq0HM664/UlY/TsktnRvssk0BI4sUaUnIyn69fY01ji81nXC1jFj7zrMymi5r2ntidDKlWZA2cffI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyVr1cWzligNMjU/z4HKpxCFg+e20Kj2D3nmr8X9nSvFKp1k5n4
	IOinPp0ujFwZI/T+rRzdXEYEVMCBxI2yhm/yJh0Oi3GgmpOe3p+Ek3x1DPXYYw==
X-Google-Smtp-Source: AGHT+IEvlVt+JP3ZI/4P8A3jsVQqcIY2mS3cJLjjQngum02ZG05E0ceI7G9MalBv3sQqOOI2veHltw==
X-Received: by 2002:a05:6402:2553:b0:5c5:b90a:5b78 with SMTP id 4fb4d7f45d1cf-5c5b90a5bf9mr5550997a12.5.1727086182308;
        Mon, 23 Sep 2024 03:09:42 -0700 (PDT)
Message-ID: <b9320c6b-9827-4826-b99e-585e0328b35a@suse.com>
Date: Mon, 23 Sep 2024 12:08:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] xen: define ACPI and DT device info sections
 macros
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1726579819.git.oleksii.kurochko@gmail.com>
 <3049dd691f79c688751abaae63c0ccdc36680fbb.1726579819.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <3049dd691f79c688751abaae63c0ccdc36680fbb.1726579819.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.09.2024 18:15, Oleksii Kurochko wrote:
> --- a/xen/include/xen/xen.lds.h
> +++ b/xen/include/xen/xen.lds.h
> @@ -114,6 +114,21 @@
>  
>  /* List of constructs other than *_SECTIONS in alphabetical order. */
>  
> +#define USE_DECL_SECTION(x) DECL_SECTION(x)
> +
> +#define NOUSE_DECL_SECTION(x) x :
> +
> +#ifdef CONFIG_ACPI
> +#define ACPI_DEV_INFO_SEC(secname, DECL_SECTION_MACROS_NAME)  \
> +    DECL_SECTION_MACROS_NAME(secname) {                     \
> +      _asdevice = .;                                        \
> +      *(secname)                                            \
> +      _aedevice = .;                                        \
> +    } :text
> +#else
> +#define ACPI_DEV_INFO_SEC(secname, DECL_SECTION_MACROS_NAME)
> +#endif /* CONFIG_ACPI */
> +
>  #define BUGFRAMES                               \
>      __start_bug_frames_0 = .;                   \
>      *(.bug_frames.0)                            \
> @@ -131,6 +146,17 @@
>      *(.bug_frames.3)                            \
>      __stop_bug_frames_3 = .;
>  
> +#ifdef CONFIG_HAS_DEVICE_TREE
> +#define DT_DEV_INFO_SEC(secname, DECL_SECTION_MACROS_NAME)  \
> +    DECL_SECTION_MACROS_NAME(secname) {                     \
> +      _sdevice = .;                                         \
> +      *(secname)                                            \
> +      _edevice = .;                                         \
> +    } :text
> +#else
> +#define DECL_DT_DEV_INFO_SEC(secname, DECL_SECTION_MACROS_NAME)
> +#endif /* CONFIG_HAS_DEVICE_TREE */

Any specific reason for the _SEC suffixes in the names? We don't have
such elsewhere, as can be seen (by example) ...

>  #ifdef CONFIG_HYPFS
>  #define HYPFS_PARAM              \
>         . = ALIGN(POINTER_ALIGN); \

... even in context here.

Jan

