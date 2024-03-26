Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4859B88BBAA
	for <lists+xen-devel@lfdr.de>; Tue, 26 Mar 2024 08:50:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697938.1089207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rp1ZU-0005eB-Nw; Tue, 26 Mar 2024 07:50:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697938.1089207; Tue, 26 Mar 2024 07:50:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rp1ZU-0005bL-JR; Tue, 26 Mar 2024 07:50:12 +0000
Received: by outflank-mailman (input) for mailman id 697938;
 Tue, 26 Mar 2024 07:50:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NDFk=LA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rp1ZT-0005bF-2t
 for xen-devel@lists.xenproject.org; Tue, 26 Mar 2024 07:50:11 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7825fa13-eb45-11ee-afe3-a90da7624cb6;
 Tue, 26 Mar 2024 08:50:09 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-55a179f5fa1so6642592a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 26 Mar 2024 00:50:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ef3-20020a05640228c300b0056bfb4a94e9sm3400666edb.59.2024.03.26.00.50.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Mar 2024 00:50:08 -0700 (PDT)
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
X-Inumbo-ID: 7825fa13-eb45-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711439409; x=1712044209; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f/jmwi6rAQXG/0H9SKQLSZy/Ddk3hDPj7z/9OHxZvmk=;
        b=YeIYakldCyl+VQcY7HhjP9+EsiMjGWPOfjds8Eb4kdZpH3sZP/VRGafITzRcE8T/zb
         rXoudVMZ/TtrgoCrVe+ZlA917mx+HBh6sgBGIVLc5j8jLUALquSqf+yXoOOjBpvx1UXc
         vkr+JZT9inQ3hDOizqeo1i/pl8QEv228zQJdnhyR3ymQGUgcHYVrZ27yZlv/Zc9zbkzb
         ebt/Z+N03An+/GzM8A0SbLZVETvsojRCV9xINimGhjBnS8H50Zk8/Xpa9f+TGq85bl2I
         GgpMnUx4Qk1hSbJ68pqrOkof+cdalCP9jyc56CWgrkh3KbcHejCpwVUBmkUgcYLts6bn
         0ZdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711439409; x=1712044209;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f/jmwi6rAQXG/0H9SKQLSZy/Ddk3hDPj7z/9OHxZvmk=;
        b=c8HVR9BxM8sMdnF5ByJfZgO9SdhTFkq/kSo01lhpqxkxiXJfxxOW+ffv6uKXqXE+Qz
         swIhLmB5jAtOV0X0rOtE6ud+E5rHvqoDUpHwljRX1bLu4N734fIr0iIlx6IYwOa3chr2
         wPfy5ajvzMQmSwLZ8u6RR1qNfYuAqMM78ek+wM9+4DHNBPzxu6hEp4Cs1be3Ok+RX8bT
         21wYg6TE5Kp6vvaR/ZlaFf6Q1NiOOGPvJP2GaKOg8DGsQuHQfOAGAHmGCGNp8GwRtXoR
         PlX/y72d4EsoWz8fTbsGme3V5O/uwllbqCUcRwoW8e7qOkiYAZ9H4roNJfN6nY4ePS/H
         w6ig==
X-Forwarded-Encrypted: i=1; AJvYcCVcf/3OW+/EIVNValkcQBuYoUIW6efsP8ZR6jTdGVvh3/Y8Sg2MLlhDlUGrCVO/Hh1RvfXtZzCOY2vQtZvtJeKRtFxOCT5b27tT68KlzM8=
X-Gm-Message-State: AOJu0YyV6v3EgwoS9v3RF3nHEAZuMOI7d8gZOfAfoqPZpQ8LbyXQzzhI
	I7XrbM08qoEmZHXuILShV6EAZOVcdWrtjMAFTV1Dyrg82iAR7mlJjTENQU89iOtXey2Enu6yzDI
	=
X-Google-Smtp-Source: AGHT+IHVuPyI/ClmafiKfWlADKP95sUlVrInKalfasJJi55vx8p9g4k30SwpFGD5vMAFT6ASfaBmjQ==
X-Received: by 2002:a50:9341:0:b0:566:e3c7:921f with SMTP id n1-20020a509341000000b00566e3c7921fmr7865313eda.22.1711439409197;
        Tue, 26 Mar 2024 00:50:09 -0700 (PDT)
Message-ID: <770d3292-34cf-4e21-acb6-bd1f9caf5fef@suse.com>
Date: Tue, 26 Mar 2024 08:50:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] x86/PVH: Support relocatable dom0 kernels
Content-Language: en-US
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20240325204515.250203-1-jason.andryuk@amd.com>
 <20240325204515.250203-6-jason.andryuk@amd.com>
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
In-Reply-To: <20240325204515.250203-6-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.03.2024 21:45, Jason Andryuk wrote:
> +/* Find an e820 RAM region that fits the kernel at a suitable alignment. */
> +static paddr_t __init find_kernel_memory(
> +    const struct domain *d, struct elf_binary *elf,
> +    const struct elf_dom_parms *parms)
> +{
> +    paddr_t kernel_size = elf->dest_size;
> +    unsigned int i;
> +
> +    for ( i = 0; i < d->arch.nr_e820; i++ )
> +    {
> +        paddr_t start = d->arch.e820[i].addr;
> +        paddr_t end = start + d->arch.e820[i].size;
> +        paddr_t kstart, kend;
> +
> +        if ( d->arch.e820[i].type != E820_RAM ||
> +             d->arch.e820[i].size < kernel_size )
> +            continue;
> +
> +        kstart = ROUNDUP(start, parms->phys_align);
> +        kstart = max_t(paddr_t, kstart, parms->phys_min);
> +        kend = kstart + kernel_size;
> +
> +        if ( kend - 1 > parms->phys_max )
> +            return 0;
> +
> +        if ( kend <= end )
> +            return kstart;

IOW within a suitable region the lowest suitable part is selected. Often
low memory is deemed more precious than higher one, so if this choice is
indeed intentional, I'd like to ask for a brief comment towards the
reasons.

> --- a/xen/common/libelf/libelf-dominfo.c
> +++ b/xen/common/libelf/libelf-dominfo.c
> @@ -17,6 +17,16 @@
>  
>  #include "libelf-private.h"
>  
> +#if defined(__i386__) || defined(__x86_64__)
> +#define ARCH_PHYS_MIN_DEFAULT   0;
> +#define ARCH_PHYS_MAX_DEFAULT   (GB(4) - 1);
> +#define ARCH_PHYS_ALIGN_DEFAULT MB(2);
> +#else
> +#define ARCH_PHYS_MIN_DEFAULT   0;
> +#define ARCH_PHYS_MAX_DEFAULT   0;
> +#define ARCH_PHYS_ALIGN_DEFAULT 0;
> +#endif

None of the semicolons should really be here.

> @@ -227,6 +239,27 @@ elf_errorstatus elf_xen_parse_note(struct elf_binary *elf,
>      case XEN_ELFNOTE_PHYS32_ENTRY:
>          parms->phys_entry = val;
>          break;
> +
> +    case XEN_ELFNOTE_PHYS32_RELOC:
> +        parms->phys_reloc = true;
> +
> +        if ( descsz >= 4 )
> +        {
> +            parms->phys_max = elf_note_numeric_array(elf, note, 4, 0);
> +            elf_msg(elf, " = max: %#"PRIx32, parms->phys_max);

As indicated before, I consider the = here a little odd.

> +        }
> +        if ( descsz >= 8 )
> +        {
> +            parms->phys_min = elf_note_numeric_array(elf, note, 4, 1);
> +            elf_msg(elf, " min: %#"PRIx32, parms->phys_min);
> +        }
> +        if ( descsz >= 12 )
> +        {
> +            parms->phys_align = elf_note_numeric_array(elf, note, 4, 2);
> +            elf_msg(elf, " align: %#"PRIx32, parms->phys_align);
> +        }

I'd like us to reconsider this ordering: I'm inclined to say that MAX isn't
the most likely one a guest may find a need to use. Instead I'd expect both
MIN and ALIGN wanting to be given higher priority; what I'm less certain
about is the ordering between the two. To keep MIN and MAX adjacent, how
about ALIGN, MIN, MAX?

> --- a/xen/include/public/elfnote.h
> +++ b/xen/include/public/elfnote.h
> @@ -194,10 +194,27 @@
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
> + *  - a maximum address for the entire image to be loaded below (default
> + *      0xffffffff)

"below" isn't exactly true anymore with this now being an inclusive value.
Perhaps "up to", or perhaps more of a re-wording.

I also think the wrapped line's indentation is too deep (by 2 blanks).

> + *  - a minimum address for the start of the image (default 0)
> + *  - a required start alignment (default 0x200000)
> + *
> + *  This note is only valid for x86 binaries.

Maybe s/valid/recognized/ (or honored or some such)?

Jan

