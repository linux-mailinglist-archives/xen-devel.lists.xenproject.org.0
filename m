Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FACB9BD0EB
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2024 16:46:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830422.1245418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8Lkv-0003oD-Rv; Tue, 05 Nov 2024 15:46:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830422.1245418; Tue, 05 Nov 2024 15:46:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8Lkv-0003lZ-Oi; Tue, 05 Nov 2024 15:46:09 +0000
Received: by outflank-mailman (input) for mailman id 830422;
 Tue, 05 Nov 2024 15:46:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NqUC=SA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t8Lku-0003lT-TB
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2024 15:46:08 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10ca5407-9b8d-11ef-99a3-01e77a169b0f;
 Tue, 05 Nov 2024 16:46:04 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43155abaf0bso49837655e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Nov 2024 07:46:04 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c113e595sm16581025f8f.77.2024.11.05.07.46.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Nov 2024 07:46:03 -0800 (PST)
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
X-Inumbo-ID: 10ca5407-9b8d-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzEiLCJoZWxvIjoibWFpbC13bTEteDMzMS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjEwY2E1NDA3LTliOGQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwODIxNTY0LjgzMzA0Niwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730821564; x=1731426364; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jyhE7GMeszEirIQg38CQZXP8OckigMSkI1OLyIH6s6s=;
        b=cWdiZqC2OOrUux5W9W2HYCug/gLpPz+6ccVThzG3ww+X4C6aU5GQE5O8NmS9NkZO9g
         pQjhAv8pG8EP0zoR24Z4Iu9p0VtbR4DZnWab1MvXSK60GP2RcoYFaTiG4r+pX4wMnF4R
         mqqYYiDS3SMSH0Pc/KO/Wt6w0xuzygwqapxSYMT4JpP6M439ZzKA+C+3VJ+OsPh19rDp
         NxIVC2oztgZHtZwHS+qgfktuKeQsIQhzZWzRmpPSQozuhj6jy3fehICRXwSVcP16JxRT
         AB+es3nlJYu6SmrhmJcuHb8nI0g9ZFKPQcBCsvc0QkJLmoGqIRywuycGxNaYU15SNlco
         D+Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730821564; x=1731426364;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jyhE7GMeszEirIQg38CQZXP8OckigMSkI1OLyIH6s6s=;
        b=pzDrBJSkdOjM1rwDTlLZ2e6CrSQ6fkovEtOT8s0CIOHu7L+SiBl3Y9qKu9IhekH7d+
         VoN2MDty9Fkix3LwYBoRUfJ3ZAwxKZA1kL5niis4cSt/mzt0Usinj/KX9XWWmxBi/oe+
         djVxP5SEvUrpzPD4ZSNFBIrhmwGbkGWmNY/LOvPvbnBR79/mjo+LXYBEUuePoZVG0W3L
         Xz6O2tuHWBh0Cm6akj7oMhgoWb9c0iRRnKiQKdY6ETNk/z0cX0Tn8OPWEP4qkfEQ0WGh
         IHen4ymSWUXsjtNIgWBjkaKF9Ao98fJ1FRzVpyba283LztT9v0/jY/4JOvBZBCxYgUzj
         5i6w==
X-Forwarded-Encrypted: i=1; AJvYcCUD9ssyh00/uVAmiB8hHxm2suUCjUzZ1FDzjQyg2KToqCWgkkJkEXbrEbetzm6pYsyWG6hbdPE0Poo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwRIqw6roU7UNn7PAZj1Ky+8tAl0bzsgzLJKJD9AV+gjtpsIvWe
	finerzx/pcKmIoHCxl9+sFKfUUkp8HvUMwykgIhaRTF99pPrQqF3E2oX8XmM3w==
X-Google-Smtp-Source: AGHT+IGXcQIfxbN5FRUq6FG/rcrXMXwPMM5VbpgPiAuYNsUbZWgapxBDzZQ9qMr+3LtLwnoHtkMKxA==
X-Received: by 2002:a05:6000:2706:b0:381:d88c:d164 with SMTP id ffacd0b85a97d-381d88cd173mr4466854f8f.51.1730821564036;
        Tue, 05 Nov 2024 07:46:04 -0800 (PST)
Message-ID: <6e6f8e2a-ea16-4b48-ac70-23e72ade2b1a@suse.com>
Date: Tue, 5 Nov 2024 16:46:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 01/13] xen/common: add cache coloring common code
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: andrea.bastoni@minervasys.tech, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
References: <20241025095014.42376-1-carlo.nonato@minervasys.tech>
 <20241025095014.42376-2-carlo.nonato@minervasys.tech>
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
In-Reply-To: <20241025095014.42376-2-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.10.2024 11:50, Carlo Nonato wrote:
> Last Level Cache (LLC) coloring allows to partition the cache in smaller
> chunks called cache colors.
> 
> Since not all architectures can actually implement it, add a HAS_LLC_COLORING
> Kconfig option.
> MAX_LLC_COLORS_ORDER Kconfig option has a range maximum of 10 (2^10 = 1024)

Is the MAX_ here stale ...

> because that's the number of colors that fit in a 4 KiB page when integers
> are 4 bytes long.
> 
> LLC colors are a property of the domain, so struct domain has to be extended.
> 
> Based on original work from: Luca Miccio <lucmiccio@gmail.com>
> 
> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
> ---
> v9:
> - dropped _MAX_ from CONFIG_MAX_LLC_COLORS_ORDER

... with this change?

> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -1708,6 +1708,43 @@ This option is intended for debugging purposes only.  Enable MSR_DEBUGCTL.LBR
>  in hypervisor context to be able to dump the Last Interrupt/Exception To/From
>  record with other registers.
>  
> +### llc-coloring (arm64)
> +> `= <boolean>`
> +
> +> Default: `false`
> +
> +Flag to enable or disable LLC coloring support at runtime. This option is
> +available only when `CONFIG_LLC_COLORING` is enabled. See the general
> +cache coloring documentation for more info.
> +
> +### llc-nr-ways (arm64)
> +> `= <integer>`
> +
> +> Default: `Obtained from hardware`
> +
> +Specify the number of ways of the Last Level Cache. This option is available
> +only when `CONFIG_LLC_COLORING` is enabled. LLC size and number of ways are used
> +to find the number of supported cache colors. By default the value is
> +automatically computed by probing the hardware, but in case of specific needs,
> +it can be manually set. Those include failing probing and debugging/testing
> +purposes so that it's possible to emulate platforms with different number of
> +supported colors. If set, also "llc-size" must be set, otherwise the default
> +will be used. Note that using these two options implies "llc-coloring=on".

Nit: Both here and ...

> +### llc-size (arm64)
> +> `= <size>`
> +
> +> Default: `Obtained from hardware`
> +
> +Specify the size of the Last Level Cache. This option is available only when
> +`CONFIG_LLC_COLORING` is enabled. LLC size and number of ways are used to find
> +the number of supported cache colors. By default the value is automatically
> +computed by probing the hardware, but in case of specific needs, it can be
> +manually set. Those include failing probing and debugging/testing purposes so
> +that it's possible to emulate platforms with different number of supported
> +colors. If set, also "llc-nr-ways" must be set, otherwise the default will be
> +used. Note that using these two options implies "llc-coloring=on".

... here, maybe better s/these two/both/?

> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -71,6 +71,9 @@ config HAS_IOPORTS
>  config HAS_KEXEC
>  	bool
>  
> +config HAS_LLC_COLORING
> +	bool
> +
>  config HAS_PIRQ
>  	bool
>  
> @@ -516,4 +519,23 @@ config TRACEBUFFER
>  	  to be collected at run time for debugging or performance analysis.
>  	  Memory and execution overhead when not active is minimal.
>  
> +config LLC_COLORING
> +	bool "Last Level Cache (LLC) coloring" if EXPERT
> +	depends on HAS_LLC_COLORING
> +	depends on !NUMA

Instead of this dependency, wouldn't it be more natural to suppress the
setting of HAS_LLC_COLORING by an arch when NUMA is on?

> --- /dev/null
> +++ b/xen/common/llc-coloring.c
> @@ -0,0 +1,111 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Last Level Cache (LLC) coloring common code
> + *
> + * Copyright (C) 2022 Xilinx Inc.

Does this need updating (if it can't be dropped)?

> + */
> +#include <xen/keyhandler.h>
> +#include <xen/llc-coloring.h>
> +#include <xen/param.h>
> +
> +#define NR_LLC_COLORS          (1U << CONFIG_LLC_COLORS_ORDER)
> +
> +static bool __ro_after_init llc_coloring_enabled;
> +boolean_param("llc-coloring", llc_coloring_enabled);
> +
> +static unsigned int __initdata llc_size;
> +size_param("llc-size", llc_size);
> +static unsigned int __initdata llc_nr_ways;
> +integer_param("llc-nr-ways", llc_nr_ways);
> +/* Number of colors available in the LLC */
> +static unsigned int __ro_after_init max_nr_colors;
> +
> +static void print_colors(const unsigned int *colors, unsigned int num_colors)

Just to mention it here as well (I mentioned it elsewhere in the past):
Personally I think that when function parameters denote array, array
notation would also better be used. I.e. "const unsigned int colors[]"
here. That'll then probably also bring us closer to using the upcoming
(in gcc) counted_by attribute.

> +void __init llc_coloring_init(void)
> +{
> +    unsigned int way_size;
> +
> +    if ( llc_size && llc_nr_ways )
> +    {
> +        llc_coloring_enabled = true;
> +        way_size = llc_size / llc_nr_ways;
> +    }
> +    else if ( !llc_coloring_enabled )
> +        return;
> +    else
> +    {
> +        way_size = get_llc_way_size();
> +        if ( !way_size )
> +            panic("LLC probing failed and 'llc-size' or 'llc-nr-ways' missing\n");
> +    }
> +
> +    /*
> +     * The maximum number of colors must be a power of 2 in order to correctly
> +     * map them to bits of an address.
> +     */
> +    max_nr_colors = way_size >> PAGE_SHIFT;

This discards low bits of the quotient calculated above, bearing a certain
risk that ...

> +    if ( max_nr_colors & (max_nr_colors - 1) )
> +        panic("Number of LLC colors (%u) isn't a power of 2\n", max_nr_colors);

... this panic() wrongly doesn't trigger.

Jan

