Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 714F2A84185
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 13:13:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945290.1343505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2pq0-0003LV-HC; Thu, 10 Apr 2025 11:12:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945290.1343505; Thu, 10 Apr 2025 11:12:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2pq0-0003K2-EE; Thu, 10 Apr 2025 11:12:52 +0000
Received: by outflank-mailman (input) for mailman id 945290;
 Thu, 10 Apr 2025 11:12:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w6Mj=W4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u2ppy-0003Jw-IH
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 11:12:50 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7dcf67c-15fc-11f0-9eac-5ba50f476ded;
 Thu, 10 Apr 2025 13:12:41 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43cfe63c592so7866255e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 04:12:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d893f0b90sm4458007f8f.79.2025.04.10.04.12.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Apr 2025 04:12:40 -0700 (PDT)
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
X-Inumbo-ID: b7dcf67c-15fc-11f0-9eac-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744283560; x=1744888360; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=b1rTF3ApoKDviePPDnw/dfiAu8MktZ0qbVG2g5c1vrA=;
        b=BRQJMACwJOVHYg1AGWah8/VKRTF4FCtWWCjB0RA2a80beYYxq3NoviQZ0G4Umt25Fa
         jlPy2oiwmdrV1fWyxJ4/pvzo+wTP0XiABh5ioH0iomvIVpKVBUkIBa01tkEvvlOy3Vze
         UR+Mc8VomfaOQ14iE22VkNdeqK3oj5ceTiriYAmGdNfqBMs3cuVaH9/8q1nqXIrlxRvA
         fugfSCnkYk9TJI1dqfgxoaIA+6hWOiAZQRGJw9cwu6OVyhsaYgoloMcjIY2d714fbJzz
         +EAdwakg40uxQdHneAsls+jQSJGlEXuDHCSC2zxXs+QWpQG0NOkV51tKf9mLUajdKzvu
         chsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744283560; x=1744888360;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b1rTF3ApoKDviePPDnw/dfiAu8MktZ0qbVG2g5c1vrA=;
        b=e7m+rA/AttZhjzBsL4pjhX4DU6W6oA77J2F0ekgyOYVBTnlZRPSi6BCyWg+dxE/+ot
         kX143ZAhz21feBBdEdfsPGprh9ATDljCMIty/3GlROnxn7lDKxtfasJ4iHDHC1Zf6uqf
         cKr0MUDVplkTPrQDa2VjbBFOQ7KUcVRSNsXWW7nMzpqYR+Ed8TYuLgwicDsIo0KaVKMt
         Vfcd5BGr/IhiFOI5kixHxgG+DPnnUdg+7B0rGwOxR/Wv6mREmNDRht1yA1eho/LSfSs7
         lVwSf9kjh4nYn0j+HL0ng7tzqtkrlX4iV4KoJ/AZnUE9aIdZYC+9QUQ7tj/+355ZS48c
         6W0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUCLW4GQseOWvf28hWUFg7fyeVzUP99ZOYa81qfA28DO71aDWF6omzVcaWJB8ew6K9Qq2GgyjCPqxw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyxjf7MV7WdZb7g19TUfZa3YZXbSSge/hrZYJlupdnS0M9NTHd2
	IQhN0mFbae5MVRkhsrF042Kf+ehyJn5Z8IEtNBd/rOoxAiL8tULAQjt6BGSmIA==
X-Gm-Gg: ASbGncsSiw9UOHV+/ezTnFwPANWmPvEgHQN3DEwiXYSKXeAl6JfWozayNJLs4j1KfrW
	r2mfVDO/ondszjwM6E/EDaWKZL0KAOhbfKhZSeuVoYkV6dxKYLvnp7Ttq2sujtXfQyOsx72kco9
	J6MXsoLQ2FJO9r3K44rpiMxFjWpodjc3ot6w/Y9vVGoZy3fzrH8an2piscc+AA03SIhb/UzBdeF
	eekMavm1Q9QkHhoc/BGAKqKRK0TJWRUiZzm8ecN3+1aVneRoyk9a09MvwDlHgucEJamH5rxe2iY
	mb48PXp9PDfCwLONlbj2/WJmiGkzBjqgcTYVIqknIUaBH8hf8WZxM+ldgJrLCFbDXty5nFVYtT0
	fJCQRViNTmuyMlbISRtZp9DeBOQ==
X-Google-Smtp-Source: AGHT+IE/3GgkNYEfbQKg1nDNuJsJc7lZmt+Su/eHZ8i7kImyY7quLJ01z9ioKF4YTS6EBNdnjLK3Gg==
X-Received: by 2002:a05:600c:1c90:b0:439:6118:c188 with SMTP id 5b1f17b1804b1-43f2ff06141mr14236725e9.19.1744283560327;
        Thu, 10 Apr 2025 04:12:40 -0700 (PDT)
Message-ID: <dccb3dd3-eac8-40b4-8ffb-a0ccb688ac0e@suse.com>
Date: Thu, 10 Apr 2025 13:12:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/16] x86/hyperlaunch: obtain cmdline from device tree
To: Alejandro Vallejo <agarciav@amd.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-11-agarciav@amd.com>
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
In-Reply-To: <20250408160802.49870-11-agarciav@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.04.2025 18:07, Alejandro Vallejo wrote:
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
> +    return size < 0 ? 0 : size;

Use max() instead of open-coding it?

> --- a/xen/arch/x86/domain-builder/fdt.c
> +++ b/xen/arch/x86/domain-builder/fdt.c
> @@ -189,6 +189,12 @@ static int __init process_domain_node(
>              printk("  kernel: boot module %d\n", idx);
>              bi->mods[idx].type = BOOTMOD_KERNEL;
>              bd->kernel = &bi->mods[idx];
> +
> +            /* If bootloader didn't set cmdline, see if FDT provides one. */
> +            if ( bd->kernel->cmdline_pa &&
> +                 !((char *)__va(bd->kernel->cmdline_pa))[0] )
> +                bd->kernel->fdt_cmdline = fdt_get_prop_offset(
> +                    fdt, node, "bootargs", &bd->kernel->cmdline_pa);

Somewhat orthogonal question: Should there perhaps be a way for the boot loader
provided cmdline to go at the tail of the DT provided one?

> --- a/xen/arch/x86/domain-builder/fdt.h
> +++ b/xen/arch/x86/domain-builder/fdt.h
> @@ -12,6 +12,31 @@ struct boot_info;
>  #define HYPERLAUNCH_MODULE_IDX 0
>  
>  #ifdef CONFIG_DOMAIN_BUILDER
> +
> +static inline int __init fdt_cmdline_prop_size(const void *fdt, int offset)
> +{
> +    int ret;
> +
> +    fdt_get_property_by_offset(fdt, offset, &ret);
> +
> +    return ret;
> +}
> +
> +static inline int __init fdt_cmdline_prop_copy(
> +    const void *fdt, int offset, char *cmdline, size_t size)
> +{
> +    int ret;
> +    const struct fdt_property *prop =
> +        fdt_get_property_by_offset(fdt, offset, &ret);
> +
> +    if ( ret < 0 )
> +        return ret;
> +
> +    ASSERT(size > ret);
> +
> +    return strlcpy(cmdline, prop->data, ret);
> +}

What's the rationale for these to be separate functions, rather then the code
being integrated into their sole callers? Especially for the former the extra
layer feels excessive.

> --- a/xen/arch/x86/include/asm/domain-builder.h
> +++ b/xen/arch/x86/include/asm/domain-builder.h
> @@ -3,6 +3,10 @@
>  
>  struct boot_info;
>  
> +size_t __init builder_get_cmdline_size(struct boot_info *bi, int offset);
> +int __init builder_get_cmdline(
> +    struct boot_info *bi, int offset, char *cmdline, size_t size);

No __init on declarations please.

> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -984,7 +984,10 @@ static size_t __init domain_cmdline_size(
>  {
>      size_t s = bi->kextra ? strlen(bi->kextra) : 0;
>  
> -    s += bd->kernel->cmdline_pa ? strlen(__va(bd->kernel->cmdline_pa)) : 0;
> +    if ( bd->kernel->fdt_cmdline )
> +        s += builder_get_cmdline_size(bi, bd->kernel->cmdline_pa);
> +    else
> +        s += strlen(__va(bd->kernel->cmdline_pa));

Why's the check lost for bd->kernel->cmdline_pa being non-zero?

> @@ -1047,9 +1050,12 @@ static struct domain *__init create_dom0(struct boot_info *bi)
>          if ( !(cmdline = xzalloc_array(char, cmdline_size)) )
>              panic("Error allocating cmdline buffer for %pd\n", d);
>  
> -        if ( bd->kernel->cmdline_pa )
> +        if ( bd->kernel->fdt_cmdline )
> +            builder_get_cmdline(
> +                bi, bd->kernel->cmdline_pa, cmdline, cmdline_size);
> +        else

Same here.

>              strlcpy(cmdline,
> -                    cmdline_cook(__va(bd->kernel->cmdline_pa), bi->loader),
> +                    cmdline_cook(__va(bd->kernel->cmdline_pa),bi->loader),

The change to this line is bogus altogether.

> --- a/xen/include/xen/libfdt/libfdt-xen.h
> +++ b/xen/include/xen/libfdt/libfdt-xen.h
> @@ -23,6 +23,29 @@ static inline uint64_t  __init fdt_cell_as_u64(const fdt32_t *cell)
>      return ((uint64_t)fdt32_to_cpu(cell[0]) << 32) | fdt32_to_cpu(cell[1]);
>  }
>  
> +static inline bool __init fdt_get_prop_offset(
> +    const void *fdt, int node, const char *name, unsigned long *offset)
> +{
> +    int ret, poffset;
> +    const char *pname;
> +
> +    fdt_for_each_property_offset(poffset, fdt, node)
> +    {
> +        fdt_getprop_by_offset(fdt, poffset, &pname, &ret);
> +
> +        if ( ret < 0 )
> +            continue;
> +
> +        if ( strcmp(pname, name) == 0 )
> +        {
> +            *offset = poffset;

Variable naming looks backwards here.

Jan

