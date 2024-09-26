Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 813F4986C68
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 08:24:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804910.1215880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sthuO-00078r-Ol; Thu, 26 Sep 2024 06:23:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804910.1215880; Thu, 26 Sep 2024 06:23:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sthuO-00077A-Kn; Thu, 26 Sep 2024 06:23:24 +0000
Received: by outflank-mailman (input) for mailman id 804910;
 Thu, 26 Sep 2024 06:23:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J7u3=QY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sthuM-000771-O5
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 06:23:22 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d2708137-7bcf-11ef-99a2-01e77a169b0f;
 Thu, 26 Sep 2024 08:23:19 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5c40aea5c40so1113481a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 23:23:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c5cf4d7926sm2756610a12.93.2024.09.25.23.23.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Sep 2024 23:23:17 -0700 (PDT)
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
X-Inumbo-ID: d2708137-7bcf-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727331799; x=1727936599; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1hEH3ESYmZdhGK9b5Zr5K7sOCMwI55aB30tq5Zx8rP0=;
        b=FC2j0vzxg5be1PxvmTHEvgIpJwXbuq5Wl7Cqa5XzeEWAv+7mHhHW1FVyQduQY3Fpn2
         i8oyxaj12cjnDSjCALm1fJyga5O2uOkyrMaZVh5JqvHScSVymvG+nF+vgYlRtmf+z2Jm
         NRJ2aTOWQPXz7nHRmK2Yv92ZaMA1srFYq7db9iGY+N/Z73/BLBi7QRWHslcPJyszIHXH
         tKT/lZa1M6hKwsW5wAc/59N+PtcO+Y8V4EziOA3oWSx0TJe6/U/8m6eP410PZBp6KPfY
         f517qpzH1QUQtQBYzcP4KEkQb5AJ1PMumPG+REy9NanLlVvNJvCcAn/ZnxEBfIg7lqiz
         i7Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727331799; x=1727936599;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1hEH3ESYmZdhGK9b5Zr5K7sOCMwI55aB30tq5Zx8rP0=;
        b=pPZTfzy1ZE7cYDtxkaOTvV/2+ZqYCM57epgtQFcztJE4bwzkdRXD3mIM3fF9eiQZAx
         R1qUi0gAgn98sc39tIfHnXJZEtmzkE5rmXD2iYb/W9oGdA9qm5bjAfjO3eDAbPZ67Btc
         STcYBkiQvxFVIwraO+LSwz+OT9mN6FvYZbw/Y8nCpqc2XN1DARIQlqSa1pXCtsjlrf6j
         3vDHhdhXLB1Cz5Dqxes6oLPiDGdVwQc/VEDk0XqjD3LFRw1kOVzL2YXkaNbl/T+4hJc3
         0zWmzE1SES17ISvEukOVLXNkJ/SOpdo/gc+5SLSgiPjFVszwn3SA+YXW29dbDtwpKbl5
         NuCg==
X-Forwarded-Encrypted: i=1; AJvYcCWUMe+fIVKfVuVvcBm3rg/xkPg+yBarsDBpHSQWzhwlEQ7qdkang2Uuup29nGp44eOF+4WXEWgdAWw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxSXUd8djCI5EoZhsBd1QWrsZHXgFdkaODprQzgyMesQGzZpoXL
	YN85lCOoAF7NndBQYmC2pUd40CYwMHedwuZW+/OyNIu1komxEftpfcQ5qYGBiUUVpN8k/lBMUa4
	=
X-Google-Smtp-Source: AGHT+IE1kuT5Oe9xW+022jtvT+eAPKYsPciMvCjZqhChqL94o6m9oJtkRfOT2bKOXs6D8rImSt+Tww==
X-Received: by 2002:a05:6402:35d0:b0:5c3:d8fb:df6a with SMTP id 4fb4d7f45d1cf-5c8777d3471mr1995701a12.14.1727331798541;
        Wed, 25 Sep 2024 23:23:18 -0700 (PDT)
Message-ID: <540a900e-9bff-40d0-8ace-6b443bbfca41@suse.com>
Date: Thu, 26 Sep 2024 08:23:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] xen: define ACPI and DT device info sections
 macros
To: oleksii.kurochko@gmail.com
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <cover.1727193766.git.oleksii.kurochko@gmail.com>
 <7521839bd265e0520fc448adf50361d18dfe53df.1727193766.git.oleksii.kurochko@gmail.com>
 <82125953-99b5-4fde-83b8-51643cce793b@suse.com>
 <81b676ae5958d93ecbc3a552c1c0a208dfa2d18a.camel@gmail.com>
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
In-Reply-To: <81b676ae5958d93ecbc3a552c1c0a208dfa2d18a.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.09.2024 18:08, oleksii.kurochko@gmail.com wrote:
> On Wed, 2024-09-25 at 10:36 +0200, Jan Beulich wrote:
>> PPC's desire to use DECL_SECTION() can certainly be covered by
>> providing
>> a (trivial) DECL_SECTION() also for Arm and RISC-V. Seeing that even
>> x86
>> overrides the default to the trivial form for building xen.efi, I'm
>> inclined to suggest we should actually have a way for an arch to
>> indicate
>> to xen.lds.h that it wants just the trivial form (avoiding a later
>> #undef).
> If to go with what I suggested before then x86 will look like:
> 
> diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
> index d48de67cfd..911585541e 100644
> --- a/xen/arch/x86/xen.lds.S
> +++ b/xen/arch/x86/xen.lds.S
> @@ -3,6 +3,10 @@
>  
>  #include <xen/cache.h>
>  #include <xen/lib.h>
> +
> +#ifdef EFI
> +#define SIMPLE_DECL_SECTION
> +#endif
>  #include <xen/xen.lds.h>
>  #include <asm/page.h>
>  #undef ENTRY
> @@ -12,9 +16,7 @@
>  
>  #define FORMAT "pei-x86-64"
>  #undef __XEN_VIRT_START
> -#undef DECL_SECTION
>  #define __XEN_VIRT_START __image_base__
> -#define DECL_SECTION(x) x :
>  
>  ENTRY(efi_start)
>  
> diff --git a/xen/include/xen/xen.lds.h b/xen/include/xen/xen.lds.h
> index a17810bb28..fb11ba7357 100644
> --- a/xen/include/xen/xen.lds.h
> +++ b/xen/include/xen/xen.lds.h
> @@ -5,6 +5,8 @@
>   * Common macros to be used in architecture specific linker scripts.
>   */
>  
> +#ifdef SIMPLE_DECL_SECTION

#ifndef I guess?

> @@ -15,6 +17,10 @@
>  # define DECL_SECTION(x) x : AT(ADDR(x) - __XEN_VIRT_START)
>  #endif
>  
> +#else /* SIMPLE_DECL_SECION */
> +# define DECL_SECTION(x) x :
> +#endif
> +
>  /*
>   * To avoid any confusion, please note that the EFI macro does not
> correspond
>   * to EFI support and is used when linking a native EFI (i.e. PE/COFF)
> binary,
> 
> Does it make sense? Or it would be better to follow way for each
> architecture:
>    #undef DECL_SECTION
>    #define DECL_SECTION(x) x :

Hard to tell which one's better; I was asking myself that same question
when writing an earlier reply. I'm slightly in favor of the form you have
now.

Jan

