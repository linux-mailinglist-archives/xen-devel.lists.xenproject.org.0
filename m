Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD8DA23159
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2025 16:59:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879671.1289889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdWwY-0000rR-J8; Thu, 30 Jan 2025 15:59:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879671.1289889; Thu, 30 Jan 2025 15:59:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdWwY-0000pl-Fn; Thu, 30 Jan 2025 15:59:02 +0000
Received: by outflank-mailman (input) for mailman id 879671;
 Thu, 30 Jan 2025 15:59:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zr8Z=UW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tdWwY-0000pf-1R
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2025 15:59:02 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d8c3927-df23-11ef-99a4-01e77a169b0f;
 Thu, 30 Jan 2025 16:58:58 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-ab6f636d821so16541266b.1
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jan 2025 07:58:58 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e47ceadfsm142424966b.51.2025.01.30.07.58.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2025 07:58:57 -0800 (PST)
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
X-Inumbo-ID: 1d8c3927-df23-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738252738; x=1738857538; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yaxGEw7wpqNZOTN7D5/W+8kGCGRnKxfa7pbUT/Ov1ZM=;
        b=QjaW1m9jBY2tdBYhZ69uSaQrnAgxHIqzjiTIIbEnThTJPPuzl2fIGrk2rJsFXDcwcV
         XapZyxjIN5yqALVh28OekJRkyVXYL61ZaVfPDcfU/AjOaA0TTkaUzCD3RHmc3C6jsGdD
         JvJhpsEAqxMsQLDRAAXgovXQ8b/P5Z9nRrjs1lCe+ONuSrYQ3vsBFztK3D7bLD3d1FYF
         FtxBKGXdLPdExYv2+ky8KssofbEQQv/j0TvD98M/SPEDbf0tKhe9WklmmAQHBF8HZVU1
         VYh3rvfS2ooh6AQTfu5K6lBwiedXPi1cAhEbbkhTSWLoojlgoPDFOBpJrxYzqs+JToLh
         cc+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738252738; x=1738857538;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yaxGEw7wpqNZOTN7D5/W+8kGCGRnKxfa7pbUT/Ov1ZM=;
        b=fX9lDLCrCSlj2uyJlqdeTQylM+9cjyNbEzYz6NQgealSyjev13bRM4xLofQX26DARx
         FJLzrTWraU0a/ITI2F7O9vzyOxlMKOXXO2ICRhzgV5HJLPXhrBicc4y1YBicISrkGQPC
         eA5xze0ltzvPgA5zex4k4lzf9qYVJNX2jfG0LKUdlIsc3X8IGAD5/1kVWQWdo46D0u20
         0N7lXPJ0op6/oklnA+DAiGWIKvszBBNaKnRVD4n92sKM1SVh53BjRtKWFNNwj7NdteqJ
         QuN6XNCGetAB7d1A7/zXwCV9r0NTW58mRs3ARW8zfuZj1pAFrBGUAL+OUR4TAts9ssHq
         wA8g==
X-Forwarded-Encrypted: i=1; AJvYcCVz7QWerXPd37kKZ4BOdEVcG9BjabFWisegrHmO9/D+l+pnJmHQ+z9YnHAKOfNdxgQj+BUyeaTysDg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwAniPMcfA5Mn39gG427h2ON+aybcmpsELOE3p7gJ+qu7erHxtF
	imskbBSaChaBEpgYDMfT/ch9KHOE2rRQM/Y8ot/QncpWYuLsNSUf5n4PqA9oDQ==
X-Gm-Gg: ASbGncsUV45OqMqQI9IMMtgxoxgZBScZmA8MM0yJcpCQN5BdkDt4otzaHCrb1SF61c4
	VEvOvNDuKEvQC3QvCsInazcnhiagk9plJbEJiTlLiGY1xkxwzAzJn4+Xp9kbkf0hsGOVThs7aYw
	/7n5PZHFJ03PViWC7VZ++Dw9OcUEHXSw3VoSPwUhnbi+XDy8ncCJpTC6YWvbL8paA1IGqslGRLA
	hzyso4XSqJmZB7APCyCId9KmC14BWfEzzYJtv18BCkBCrHgsDu2KXvy9BoxZoJ75OJJqgteJyi/
	Ea8aaEtgaqee8asZh9KYnwvlPvmL4BLt+19GPbiSFlKRAWcXPM0qYmF7OgI5siIuGzWCKuldgUF
	L
X-Google-Smtp-Source: AGHT+IF3KDDv/K7Nr7OwVDml9tGrY8ql2DaxyfQz8TvjMhk6/t8ZygHb4yqjxoe2kVERCgzijx51jw==
X-Received: by 2002:a17:907:9622:b0:ab3:3184:6890 with SMTP id a640c23a62f3a-ab6cfceb881mr849455066b.33.1738252737890;
        Thu, 30 Jan 2025 07:58:57 -0800 (PST)
Message-ID: <d062ed3e-0ded-49c2-a4ff-04ba1ae3244a@suse.com>
Date: Thu, 30 Jan 2025 16:58:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/15] x86/hyperlaunch: obtain cmdline from device tree
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
References: <20241226165740.29812-1-dpsmith@apertussolutions.com>
 <20241226165740.29812-10-dpsmith@apertussolutions.com>
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
In-Reply-To: <20241226165740.29812-10-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.12.2024 17:57, Daniel P. Smith wrote:
> If a command line is not provided through the bootloader's mechanism, e.g.
> muiltboot module string field, then use one from the device tree if present.
> The device tree command line is located in the bootargs property of the
> `multiboot,kernel` node.

This reads as if it can be mix-and-match (and the code looks to confirm
this), which doesn't sound quite right. If you deem it right, please add
justification here.

> --- a/xen/arch/x86/domain-builder/core.c
> +++ b/xen/arch/x86/domain-builder/core.c
> @@ -8,9 +8,37 @@
>  #include <xen/lib.h>
>  
>  #include <asm/bootinfo.h>
> +#include <asm/setup.h>
>  
>  #include "fdt.h"
>  
> +size_t __init builder_get_cmdline_size(struct boot_info *bi, int offset)
> +{
> +#ifdef CONFIG_DOMAIN_BUILDER
> +    const void *fdt = bootstrap_map_bm(&bi->mods[HYPERLAUNCH_MODULE_IDX]);
> +    int size = fdt_cmdline_prop_size(fdt, offset);
> +
> +    bootstrap_unmap();
> +    return size < 0 ? 0 : (size_t) size;

Nit: While I wouldn't insist, we don't normally put blanks after casts.
(The cast also isn't really needed here anyway.)

> +#else
> +    return 0;
> +#endif
> +}
> +
> +int __init builder_get_cmdline(
> +    struct boot_info *bi, int offset, char *cmdline, size_t size)
> +{
> +#ifdef CONFIG_DOMAIN_BUILDER
> +    const void *fdt = bootstrap_map_bm(&bi->mods[HYPERLAUNCH_MODULE_IDX]);
> +    int ret = fdt_cmdline_prop_copy(fdt, offset, cmdline, size);
> +
> +    bootstrap_unmap();
> +    return ret;
> +#else
> +    return 0;
> +#endif
> +}

Such #ifdef-ary is better to be avoided by providing stubs in the header.
Which then also works towards not needing to build in domain-builder/ when
COMFIG_DOMAIN_BUILDER=n.

> --- a/xen/arch/x86/domain-builder/fdt.c
> +++ b/xen/arch/x86/domain-builder/fdt.c
> @@ -109,6 +109,16 @@ static int __init process_domain_node(
>              printk("  kernel: boot module %d\n", idx);
>              bi->mods[idx].type = BOOTMOD_KERNEL;
>              bd->kernel = &bi->mods[idx];
> +
> +            /* If bootloader didn't set cmdline, see if FDT provides one. */
> +            if ( bd->kernel->cmdline_pa &&
> +                 !((char *)__va(bd->kernel->cmdline_pa))[0] )
> +            {
> +                int ret = fdt_get_prop_by_offset(
> +                    fdt, node, "bootargs", &bd->kernel->cmdline_pa);
> +                if ( ret > 0 )
> +                    bd->kernel->fdt_cmdline = true;

Is there a guarantee that fdt_get_prop_by_offset() won't alter its output
(passed in by indirection) in case of failure? Otherwise ...

> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -981,7 +981,10 @@ static size_t __init domain_cmdline_size(
>  {
>      size_t s = bi->kextra ? strlen(bi->kextra) : 0;
>  
> -    s += bd->kernel->cmdline_pa ? strlen(__va(bd->kernel->cmdline_pa)) : 0;
> +    if ( bd->kernel->fdt_cmdline )
> +        s += builder_get_cmdline_size(bi, bd->kernel->cmdline_pa);
> +    else
> +        s += strlen(__va(bd->kernel->cmdline_pa));

... you'll be hosed here (and elsewhere).

> --- a/xen/include/xen/libfdt/libfdt-xen.h
> +++ b/xen/include/xen/libfdt/libfdt-xen.h
> @@ -28,6 +28,30 @@ static inline int __init fdt_cell_as_u64(const fdt32_t *cell, uint64_t *val)
>      return 0;
>  }
>  
> +static inline int __init fdt_get_prop_by_offset(
> +    const void *fdt, int node, const char *name, unsigned long *offset)
> +{
> +    int ret, poffset;
> +    const char *pname;
> +    size_t nsize = strlen(name);
> +
> +    fdt_for_each_property_offset(poffset, fdt, node)
> +    {
> +        fdt_getprop_by_offset(fdt, poffset, &pname, &ret);
> +
> +        if ( ret < 0 || strlen(pname) != nsize )
> +            continue;
> +
> +        if ( !strncmp(pname, name, nsize) )

I find this slightly odd: By now we know strlen(name) == strlen(pname) == nsize.
You could then use the usually more efficient memcmp() or the easier to invoke
strcmp().

Jan

