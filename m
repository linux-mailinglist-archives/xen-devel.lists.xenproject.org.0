Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F969C3EF66
	for <lists+xen-devel@lfdr.de>; Fri, 07 Nov 2025 09:29:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1157385.1486170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vHHq7-0003h5-Ca; Fri, 07 Nov 2025 08:28:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1157385.1486170; Fri, 07 Nov 2025 08:28:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vHHq7-0003eh-9I; Fri, 07 Nov 2025 08:28:59 +0000
Received: by outflank-mailman (input) for mailman id 1157385;
 Fri, 07 Nov 2025 08:28:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=suI1=5P=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vHHq5-0003eW-Ip
 for xen-devel@lists.xenproject.org; Fri, 07 Nov 2025 08:28:57 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ccb1927c-bbb3-11f0-9d17-b5c5bf9af7f9;
 Fri, 07 Nov 2025 09:28:55 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-b72cbc24637so63920666b.0
 for <xen-devel@lists.xenproject.org>; Fri, 07 Nov 2025 00:28:55 -0800 (PST)
Received: from [192.168.50.2] (pool185-5-253-110.as6723.net. [185.5.253.110])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bdbcaeaasm186291766b.1.2025.11.07.00.28.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Nov 2025 00:28:53 -0800 (PST)
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
X-Inumbo-ID: ccb1927c-bbb3-11f0-9d17-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762504135; x=1763108935; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YEUW8XrmLDdFp+BWOltCb0wOwjstWnLhv+pmruOk46I=;
        b=FpCLy004ffywHcK7ybjZMjjNa8F6etx/qYd5IG5VKVIdSp2cAbL9GHuliiuGno97y+
         Gv6GiRZbmk+bsjSoY1q+tQbpC+T4YGXGKe6XE4iC0l9q+a0FrCgZOg3qOoPbKznaBEiz
         IRXtLgXsB7PRhrQpHhGcI+Zq+UA0hQJx8E5tyZ2XxV//eo6zVU7ARIc2LpGXmySvDVFU
         1+G2wXgNIVMNAkJKg5HI+sCc17K/8djHvXF9crQr0/lhY9r96D0iIxEgGmWpAOfIRcsL
         WUNoNn4GxAAsHpixhGHP32U+1hj+gCLts6IWXzXQv3RlLCXHUguNAtWGcBE/9Ra0zExf
         GKog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762504135; x=1763108935;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YEUW8XrmLDdFp+BWOltCb0wOwjstWnLhv+pmruOk46I=;
        b=K+xZfqIoTWrzPElbQPpf79hM7HfIszzP/DWDcXC94vFj4NU60LPsEX6gT6nWwHNccb
         wGqUvvoClWrMJ4Z8H75vGELnLuCzLvuyFqJFpO3R+xR3wGsUbJLOSyuiwJvgvt5RVimw
         LWYA1wIloTztUTqqr9Wqbb4Q1iz+v9pDzSeDVVQRsCUJp6Ai8eb7jhvzinOtv5osZFPl
         JhVaiSIOIzadNZgo62D+YxBrSUZhE9l4UZgMehRuhqgi0XZobnTnfFQQdMiauqMuZeCp
         QIijK8hSYzw/aQgbi2nXZHI2S/f1FmBGtrElGH93PAKifEiLpay6nT/j7Abq+kJWogdy
         GTJg==
X-Forwarded-Encrypted: i=1; AJvYcCX9Cv81ji9YV0a2CZ3b7pcl4DyCk9ETFBLOo2BQZZ9FtWDAiYLnr9R8/zdHRTp1PdPant4cibPs4JE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzFpjYXo6ulhGXcMB99rKjH3uhSPXegeoaqGq/b7QK0I7bqP5sl
	vMrVokqsZ93tz+G93+Wwiuvsa7IaP6UZsuCnf9kKbZXnACEd/aSiae/v
X-Gm-Gg: ASbGncvtkI/ww2AVwgCqX95iRypllPnPDrBISo6z1aWXI1CxhB/8I2sy3d/SqUpbBN7
	guMePgDlf8s5nfYgL3kTcpLOBcWksoUZ3xU80DbUvqY99hdHGqXxJRnLMskGR+ZTO1B569M1TNC
	jV6PCAaKzkqa7YXneoYsy+veU8oDMef9EXIHy4VG7hcIe21KyFr9icDxIchp3taJInrdC/XqKbX
	WjWDZRMBGZX4/JN6XkGYiTV4UOjR7yi00p7sVCXEvZP5PGbzXp4dOL1bGZIu1aVpaakBDIy72R/
	LIQKBc+cK0bFa3esn2KadifwClxwBIXZajMlalyCF48MdAAs9qegbY57Y4KUbiIBCCkjjbfrOWb
	KcR7RxXZYjT6RdpNaObZAVw//ohZqdguPaukR/0UJvCk0Ihxph9BqeNbupDo74D4wL9KHy7A54n
	RtjW+cNR+HsI4S3ZY1XSzyxIKWWsmXOsFO8Jc=
X-Google-Smtp-Source: AGHT+IGuEKKvUOH/3FDG1PPCofOzzeHdsMEsIJwK7d8mHgsi+nVoMOOQBNHxEPfqbANPxDwmwrxLZw==
X-Received: by 2002:a17:907:9627:b0:b72:56ad:c9c0 with SMTP id a640c23a62f3a-b72c078d329mr242774966b.17.1762504134733;
        Fri, 07 Nov 2025 00:28:54 -0800 (PST)
Message-ID: <db5d6a67-61d9-48d3-b6c4-213c1cbbda21@gmail.com>
Date: Fri, 7 Nov 2025 10:26:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Mykola Kvach <xakep.amatop@gmail.com>
Subject: Re: [PATCH v13 04/12] xen/arm: add Dom0 cache coloring support
To: Carlo Nonato <carlo.nonato@minervasys.tech>,
 xen-devel@lists.xenproject.org
Cc: andrea.bastoni@minervasys.tech, marco.solieri@minervasys.tech,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241217170637.233097-1-carlo.nonato@minervasys.tech>
 <20241217170637.233097-5-carlo.nonato@minervasys.tech>
Content-Language: en-US
In-Reply-To: <20241217170637.233097-5-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Carlo,

Thank you for the patch.

On 17/12/2024 19:06, Carlo Nonato wrote:
> Add a command line parameter to allow the user to set the coloring
> configuration for Dom0.
> A common configuration syntax for cache colors is introduced and
> documented.
> Take the opportunity to also add:
>   - default configuration notion.
>   - function to check well-formed configurations.
> 
> Direct mapping Dom0 isn't possible when coloring is enabled, so
> CDF_directmap flag is removed when creating it.
> 
> Based on original work from: Luca Miccio <lucmiccio@gmail.com>
> 
> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> ---
> v13:
> - no changes
> v12:
> - no changes
> v11:
> - minor changes
> v10:
> - fixed array type for colors parameter in check_colors()
> v9:
> - moved domain_llc_coloring_free() in next patch cause it's never used for dom0
> v8:
> - added bound check on dom0_num_colors
> - default colors array set just once
> v7:
> - parse_color_config() doesn't accept leading/trailing commas anymore
> - removed alloc_colors() helper
> v6:
> - moved domain_llc_coloring_free() in this patch
> - removed domain_alloc_colors() in favor of a more explicit allocation
> - parse_color_config() now accepts the size of the array to be filled
> - allocate_memory() moved in another patch
> v5:
> - Carlo Nonato as the new author
> - moved dom0 colors parsing (parse_colors()) in this patch
> - added dom0_set_llc_colors() to set dom0 colors after creation
> - moved color allocation and checking in this patch
> - error handling when allocating color arrays
> - FIXME: copy pasted allocate_memory() cause it got moved
> v4:
> - dom0 colors are dynamically allocated as for any other domain
>    (colors are duplicated in dom0_colors and in the new array, but logic
>    is simpler)
> ---
>   docs/misc/cache-coloring.rst      |  29 ++++++++
>   docs/misc/xen-command-line.pandoc |   9 +++
>   xen/arch/arm/domain_build.c       |   9 ++-
>   xen/common/llc-coloring.c         | 120 +++++++++++++++++++++++++++++-
>   xen/include/xen/llc-coloring.h    |   1 +
>   5 files changed, 166 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/misc/cache-coloring.rst b/docs/misc/cache-coloring.rst
> index 12972dbb2c..7b47d0ed92 100644
> --- a/docs/misc/cache-coloring.rst
> +++ b/docs/misc/cache-coloring.rst
> @@ -107,6 +107,35 @@ Specific documentation is available at `docs/misc/xen-command-line.pandoc`.
>   +----------------------+-------------------------------+
>   | ``llc-nr-ways``      | Set the LLC number of ways    |
>   +----------------------+-------------------------------+
> +| ``dom0-llc-colors``  | Dom0 color configuration      |
> ++----------------------+-------------------------------+
> +
> +Colors selection format
> +***********************
> +
> +Regardless of the memory pool that has to be colored (Xen, Dom0/DomUs),
> +the color selection can be expressed using the same syntax. In particular a
> +comma-separated list of colors or ranges of colors is used.
> +Ranges are hyphen-separated intervals (such as `0-4`) and are inclusive on both
> +sides.
> +
> +Note that:
> +
> +- no spaces are allowed between values.
> +- no overlapping ranges or duplicated colors are allowed.
> +- values must be written in ascending order.

Should this requirement also be stated for the color list configuration
parameters for Dom0, Xen, and DomUs?

> +
> +Examples:
> +
> ++-------------------+-----------------------------+
> +| **Configuration** | **Actual selection**        |
> ++-------------------+-----------------------------+
> +| 1-2,5-8           | [1, 2, 5, 6, 7, 8]          |
> ++-------------------+-----------------------------+
> +| 4-8,10,11,12      | [4, 5, 6, 7, 8, 10, 11, 12] |
> ++-------------------+-----------------------------+
> +| 0                 | [0]                         |
> ++-------------------+-----------------------------+
>   
>   Auto-probing of LLC specs
>   #########################
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> index ca105ec559..be70d6af61 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -963,6 +963,15 @@ Controls for the dom0 IOMMU setup.
>   
>   Specify a list of IO ports to be excluded from dom0 access.
>   
> +### dom0-llc-colors (arm64)
> +> `= List of [ <integer> | <integer>-<integer> ]`
> +
> +> Default: `All available LLC colors`
> +
> +Specify dom0 LLC color configuration. This option is available only when
> +`CONFIG_LLC_COLORING` is enabled. If the parameter is not set, all available
> +colors are used.
> +
>   ### dom0_max_vcpus
>   
>   Either:
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 17cc76b6f2..b072a16249 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2356,6 +2356,7 @@ void __init create_dom0(void)
>           .max_maptrack_frames = -1,
>           .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
>       };
> +    unsigned int flags = CDF_privileged;
>       int rc;
>   
>       /* The vGIC for DOM0 is exactly emulating the hardware GIC */
> @@ -2383,10 +2384,16 @@ void __init create_dom0(void)
>               panic("SVE vector length error\n");
>       }
>   
> -    dom0 = domain_create(0, &dom0_cfg, CDF_privileged | CDF_directmap);
> +    if ( !llc_coloring_enabled )
> +        flags |= CDF_directmap;
> +
> +    dom0 = domain_create(0, &dom0_cfg, flags);
>       if ( IS_ERR(dom0) )
>           panic("Error creating domain 0 (rc = %ld)\n", PTR_ERR(dom0));
>   
> +    if ( llc_coloring_enabled && (rc = dom0_set_llc_colors(dom0)) )
> +        panic("Error initializing LLC coloring for domain 0 (rc = %d)\n", rc);
> +
>       if ( alloc_dom0_vcpu0(dom0) == NULL )
>           panic("Error creating domain 0 vcpu0\n");
>   
> diff --git a/xen/common/llc-coloring.c b/xen/common/llc-coloring.c
> index b034c0169c..5984ae82e7 100644
> --- a/xen/common/llc-coloring.c
> +++ b/xen/common/llc-coloring.c
> @@ -29,6 +29,66 @@ static unsigned int __initdata llc_nr_ways;
>   integer_param("llc-nr-ways", llc_nr_ways);
>   /* Number of colors available in the LLC */
>   static unsigned int __ro_after_init max_nr_colors;
> +/* Default coloring configuration */
> +static unsigned int __ro_after_init default_colors[NR_LLC_COLORS];
> +
> +static unsigned int __initdata dom0_colors[NR_LLC_COLORS];
> +static unsigned int __initdata dom0_num_colors;
> +
> +/*
> + * Parse the coloring configuration given in the buf string, following the
> + * syntax below.
> + *
> + * COLOR_CONFIGURATION ::= COLOR | RANGE,...,COLOR | RANGE
> + * RANGE               ::= COLOR-COLOR

Configurations like ",COLOR | RANGE,...", interpreted as:
     "0,COLOR | RANGE,..."

and "-10,COLOR | RANGE,...", interpreted as:
"0-10,COLOR | RANGE,..."

also seem to be accepted. If this is intentional, it might be worth 
documenting these shorthand forms here.

> + *
> + * Example: "0,2-6,15-16" represents the set of colors: 0,2,3,4,5,6,15,16.
> + */
> +static int __init parse_color_config(const char *buf, unsigned int colors[],
> +                                     unsigned int max_num_colors,
> +                                     unsigned int *num_colors)
> +{
> +    const char *s = buf;
> +
> +    *num_colors = 0;
> +
> +    while ( *s != '\0' )
> +    {
> +        unsigned int color, start, end;
> +
> +        start = simple_strtoul(s, &s, 0);

Since simple_strtoul(..., 0) accepts decimal, octal (0 prefix), and
hexadecimal (0x prefix), should we document that these formats are
also allowed for color values?

> +
> +        if ( *s == '-' )    /* Range */
> +        {
> +            s++;
> +            end = simple_strtoul(s, &s, 0);
> +        }
> +        else                /* Single value */
> +            end = start;
> +
> +        if ( start > end || (end - start) > (UINT_MAX - *num_colors) ||
> +             (*num_colors + (end - start)) >= max_num_colors )
> +            return -EINVAL;
> +
> +        /* Colors are range checked in check_colors() */
> +        for ( color = start; color <= end; color++ )

A range like (UINT_MAX-1)-UINT_MAX would cause this loop to never
terminate due to color wrapping around, effectively locking the system
during init.

> +            colors[(*num_colors)++] = color;
> +
> +        if ( *s == ',' )
> +            s++;
> +        else if ( *s != '\0' )
> +            break;
> +    }
> +
> +    return *s ? -EINVAL : 0;

In case of a parse error (e.g. [1,w,3-5]), we end up with a partial
configuration like [1,0] and num_colors already updated. Should we
reject the whole configuration here and reset num_colors (or only
update it on success), instead of proceeding with a partially parsed
set of colors?



Best regards,
Mykola

> +}
> +
> +static int __init parse_dom0_colors(const char *s)
> +{
> +    return parse_color_config(s, dom0_colors, ARRAY_SIZE(dom0_colors),
> +                              &dom0_num_colors);
> +}
> +custom_param("dom0-llc-colors", parse_dom0_colors);
>   
>   static void print_colors(const unsigned int colors[], unsigned int num_colors)
>   {
> @@ -53,9 +113,27 @@ static void print_colors(const unsigned int colors[], unsigned int num_colors)
>       printk(" }\n");
>   }
>   
> +static bool __init check_colors(const unsigned int colors[],
> +                                unsigned int num_colors)
> +{
> +    unsigned int i;
> +
> +    for ( i = 0; i < num_colors; i++ )
> +    {
> +        if ( colors[i] >= max_nr_colors )
> +        {
> +            printk(XENLOG_ERR "LLC color %u >= %u (max allowed)\n", colors[i],
> +                   max_nr_colors);
> +            return false;
> +        }
> +    }
> +
> +    return true;
> +}
> +
>   void __init llc_coloring_init(void)
>   {
> -    unsigned int way_size;
> +    unsigned int way_size, i;
>   
>       llc_coloring_enabled = (opt_llc_coloring >= 1);
>       if ( (opt_llc_coloring != 0) && llc_size && llc_nr_ways )
> @@ -94,6 +172,9 @@ void __init llc_coloring_init(void)
>       else if ( max_nr_colors < 2 )
>           panic("Number of LLC colors %u < 2\n", max_nr_colors);
>   
> +    for ( i = 0; i < max_nr_colors; i++ )
> +        default_colors[i] = i;
> +
>       arch_llc_coloring_init();
>   }
>   
> @@ -115,6 +196,43 @@ void domain_dump_llc_colors(const struct domain *d)
>       print_colors(d->llc_colors, d->num_llc_colors);
>   }
>   
> +static void __init domain_set_default_colors(struct domain *d)
> +{
> +    printk(XENLOG_WARNING
> +           "LLC color config not found for %pd, using all colors\n", d);
> +
> +    d->llc_colors = default_colors;
> +    d->num_llc_colors = max_nr_colors;
> +}
> +
> +int __init dom0_set_llc_colors(struct domain *d)
> +{
> +    typeof(*dom0_colors) *colors;
> +
> +    if ( !dom0_num_colors )
> +    {
> +        domain_set_default_colors(d);
> +        return 0;
> +    }
> +
> +    if ( (dom0_num_colors > max_nr_colors) ||
> +         !check_colors(dom0_colors, dom0_num_colors) )
> +    {
> +        printk(XENLOG_ERR "%pd:  bad LLC color config\n", d);
> +        return -EINVAL;
> +    }
> +
> +    colors = xmalloc_array(typeof(*dom0_colors), dom0_num_colors);
> +    if ( !colors )
> +        return -ENOMEM;
> +
> +    memcpy(colors, dom0_colors, sizeof(*colors) * dom0_num_colors);
> +    d->llc_colors = colors;
> +    d->num_llc_colors = dom0_num_colors;
> +
> +    return 0;
> +}
> +
>   /*
>    * Local variables:
>    * mode: C
> diff --git a/xen/include/xen/llc-coloring.h b/xen/include/xen/llc-coloring.h
> index a3ebb17186..d29ebeb4c5 100644
> --- a/xen/include/xen/llc-coloring.h
> +++ b/xen/include/xen/llc-coloring.h
> @@ -28,6 +28,7 @@ static inline void domain_dump_llc_colors(const struct domain *d) {}
>   
>   unsigned int get_llc_way_size(void);
>   void arch_llc_coloring_init(void);
> +int dom0_set_llc_colors(struct domain *d);
>   
>   #endif /* __XEN_LLC_COLORING_H__ */
>  


