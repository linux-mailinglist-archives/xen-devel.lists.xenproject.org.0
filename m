Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D58F89B80E
	for <lists+xen-devel@lfdr.de>; Mon,  8 Apr 2024 09:01:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701750.1096169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtizp-0004KK-Vd; Mon, 08 Apr 2024 07:00:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701750.1096169; Mon, 08 Apr 2024 07:00:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtizp-0004Jd-Sd; Mon, 08 Apr 2024 07:00:49 +0000
Received: by outflank-mailman (input) for mailman id 701750;
 Mon, 08 Apr 2024 07:00:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WYQ4=LN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rtizo-0004Iw-6i
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2024 07:00:48 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b873c503-f575-11ee-a1ef-f123f15fe8a2;
 Mon, 08 Apr 2024 09:00:45 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-415523d9824so41489595e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Apr 2024 00:00:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 l15-20020a05600c4f0f00b004166b960469sm2993855wmq.38.2024.04.08.00.00.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Apr 2024 00:00:44 -0700 (PDT)
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
X-Inumbo-ID: b873c503-f575-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712559645; x=1713164445; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qzh0uZLlPME0mDLBZvF04W6aAV4f0LFx+mRIrnCB6jA=;
        b=fBjSWl6OsUfix4UjOLL/4eZ0DTKiqJNTWmt5+hbgO6C3a1u1wAxviosUJMJhz7MurO
         bGD8ffvgSaOBIkwcTIU58SNj8vGcJc4X0i9MPlvo8X8cZSkDkPA/3JxA35Qb3NgHIC73
         +EPPoPWl2jY5lvzI3vhC0uVJM6x/WqmiSC23ZrDC8Ob09o5x9dnibWpoYhUnxCzc61df
         40MZuVkDKYMyTqUMvTBFDeEQ53uQrIHiOe2DUqW18fqxfkAB/Ocw9yTR/yBhEK6saRMr
         BvUiTYJAu993A0ymeo67NC8mbl41dOubMAmE0SERtkM7mkNUY+q5NhkhoggZoyZwghRl
         1XLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712559645; x=1713164445;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qzh0uZLlPME0mDLBZvF04W6aAV4f0LFx+mRIrnCB6jA=;
        b=AHhgECjnfbHBZevSgcLpOsT/9ZuHynwC5AJN9LjndU4JPz9vdIIj9lZVJ/zdnD7vUB
         4iJyTu/SfKD4FSkxdT9GGGdHvKTsE5mPd0+Eji0KHmXtQHE8KXxvTWYWVnaw/L8stkyb
         ND57dKVw1QLQu+/8fZljpcW7oyUwBJgEI5tthap9VKHGBb2Q0RxqAm+11dizzdN7+CFD
         l3oFhI8jHa46AJ2LGeUJITDnG59I6qx35L2GhKJBseO9feIAf17U12nuHFyeS9Onia2h
         z1s0c/F6G4AsUaSm97fCWwqQp7ojJXYPj45mhngDtnTCHTRKDIHEg+tSPapzM9dYwYKH
         bl9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWIjR9Y54Azoj1QCg++5xFMzmu2DV/nehLDdzi+KhQVeiZrMS8GV8vTiTeIpWwh5yV07FvzCSJVmFJbx5dGhVLo//QkZrW3yw6Jf1orXtQ=
X-Gm-Message-State: AOJu0YzDHhofvPMV20mp9VQcfaZ+UgR6uwNfxHgQ02rrER3SmAampzP5
	B09m98Nm0UIPvurSVO4DMLfhQp3CzZp5pPlWnGYQ9DROCZQXMx/E7bVWQUWTOg==
X-Google-Smtp-Source: AGHT+IGLfZihi8kSZGdQXnuboSLh/ELUXb6wMyhkxiA7jo+O4Tixs+XA/ANLcxiYHKboJE2UVR1eGw==
X-Received: by 2002:a05:600c:b99:b0:416:72a9:96bd with SMTP id fl25-20020a05600c0b9900b0041672a996bdmr1324723wmb.20.1712559644868;
        Mon, 08 Apr 2024 00:00:44 -0700 (PDT)
Message-ID: <70ab0f9d-a451-44a5-8927-4200dbb96a08@suse.com>
Date: Mon, 8 Apr 2024 09:00:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] x86/PVH: Support relocatable dom0 kernels
Content-Language: en-US
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20240404212519.16401-1-jason.andryuk@amd.com>
 <20240404212519.16401-3-jason.andryuk@amd.com>
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
In-Reply-To: <20240404212519.16401-3-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.04.2024 23:25, Jason Andryuk wrote:
> Xen tries to load a PVH dom0 kernel at the fixed guest physical address
> from the elf headers.  For Linux, this defaults to 0x1000000 (16MB), but
> it can be configured.
> 
> Unfortunately there exist firmwares that have reserved regions at this
> address, so Xen fails to load the dom0 kernel since it's not RAM.
> 
> The PVH entry code is not relocatable - it loads from absolute
> addresses, which fail when the kernel is loaded at a different address.
> With a suitably modified kernel, a reloctable entry point is possible.
> 
> Add XEN_ELFNOTE_PHYS32_RELOC which specifies optional alignment,
> minimum, and maximum addresses needed for the kernel.  The presence of
> the NOTE indicates the kernel supports a relocatable entry path.
> 
> Change the loading to check for an acceptable load address.  If the
> kernel is relocatable, support finding an alternate load address.
> 
> The primary motivation for an explicit align field is that Linux has a
> configurable CONFIG_PHYSICAL_ALIGN field.  This value is present in the
> bzImage setup header, but not the ELF program headers p_align, which
> report 2MB even when CONFIG_PHYSICAL_ALIGN is greater.  Since a kernel
> is only considered relocatable if the PHYS32_RELOC elf note is present,
> the alignment contraints can just be specified within the note instead
> of searching for an alignment value via a heuristic.
> 
> Load alignment uses the PHYS32_RELOC note value if specified.
> Otherwise, the maxmum ELF PHDR p_align value is selected if greater than
> or equal to PAGE_SIZE.  Finally, the fallback default is 2MB.
> 
> libelf-private.h includes common-macros.h to satisfy the fuzzer build.
> 
> Link: https://gitlab.com/xen-project/xen/-/issues/180
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
yet still with two remarks:

> --- a/xen/arch/x86/hvm/dom0_build.c
> +++ b/xen/arch/x86/hvm/dom0_build.c
> @@ -537,6 +537,111 @@ static paddr_t __init find_memory(
>      return INVALID_PADDR;
>  }
>  
> +static bool __init check_load_address(
> +    const struct domain *d, const struct elf_binary *elf)
> +{
> +    paddr_t kernel_start = (uintptr_t)elf->dest_base;
> +    paddr_t kernel_end = kernel_start + elf->dest_size;
> +    unsigned int i;

While properly typed here, ...

> +static paddr_t __init find_kernel_memory(
> +    const struct domain *d, struct elf_binary *elf,
> +    const struct elf_dom_parms *parms)
> +{
> +    paddr_t kernel_size = elf->dest_size;
> +    unsigned int align;
> +    int i;

... I must have missed when this was changed to plain int. It should have
been unsigned int here, too, ...

> +    if ( parms->phys_align != UNSET_ADDR32 )
> +        align = parms->phys_align;
> +    else if ( elf->palign >= PAGE_SIZE )
> +        align = elf->palign;
> +    else
> +        align = MB(2);
> +
> +    /* Search backwards to find the highest address. */
> +    for ( i = d->arch.nr_e820 - 1; i >= 0 ; i-- )

... with this suitably adjusted. However, I'm not going to change this while
committing, to avoid screwing up.

> --- a/xen/include/public/elfnote.h
> +++ b/xen/include/public/elfnote.h
> @@ -196,10 +196,28 @@
>   */
>  #define XEN_ELFNOTE_PHYS32_ENTRY 18
>  
> +/*
> + * Physical loading constraints for PVH kernels
> + *
> + * The presence of this note indicates the kernel supports relocating itself.
> + *
> + * The note may include up to three 32bit values to place constraints on the
> + * guest physical loading addresses and alignment for a PVH kernel.  Values
> + * are read in the following order:
> + *  - a required start alignment (default 0x200000)

"... (default 0x200000; see below)", i.e. ...

> + *  - a minimum address for the start of the image (default 0)
> + *  - a maximum address for the last byte of the image (default 0xffffffff)
> + *
> + *  When this note specifies an alignment value, it is used.  Otherwise the
> + *  maximum p_align value from loadable ELF Program Headers is used, if it is
> + *  greater than or equal to 4k (0x1000).  Otherwise, the default is used.

... referring to this (which, btw, has one too many padding blanks on the
entire paragraph). I will take the liberty to make this adjustment while
committing.

Jan

