Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B69CC3EF57
	for <lists+xen-devel@lfdr.de>; Fri, 07 Nov 2025 09:29:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1157386.1486177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vHHq7-0003lx-ND; Fri, 07 Nov 2025 08:28:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1157386.1486177; Fri, 07 Nov 2025 08:28:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vHHq7-0003hA-IH; Fri, 07 Nov 2025 08:28:59 +0000
Received: by outflank-mailman (input) for mailman id 1157386;
 Fri, 07 Nov 2025 08:28:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=suI1=5P=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vHHq6-0003eW-5o
 for xen-devel@lists.xenproject.org; Fri, 07 Nov 2025 08:28:58 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd983019-bbb3-11f0-9d17-b5c5bf9af7f9;
 Fri, 07 Nov 2025 09:28:57 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b7272012d30so74360166b.2
 for <xen-devel@lists.xenproject.org>; Fri, 07 Nov 2025 00:28:57 -0800 (PST)
Received: from [192.168.50.2] (pool185-5-253-110.as6723.net. [185.5.253.110])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bdbcaeaasm186291766b.1.2025.11.07.00.28.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Nov 2025 00:28:55 -0800 (PST)
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
X-Inumbo-ID: cd983019-bbb3-11f0-9d17-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762504137; x=1763108937; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PkwNcN7lNA8yjMuppF3gbnvT8EESBLGSdHJNmN1pAvM=;
        b=Cs/MrhVUiujLLr2GVqmo1fReW20T3N9zVpLIOrJ8o+S/gz9HYLQenqMFXcoRY2HBO1
         SYcj51inaoNTzQvEwvY3mnL5qa4TIs/LQoN3E/Ghur97KdqW4T6EQQDV5ZteV5WW/jld
         l6Mkq4yGWKxP58yj+XPbNPGDWT+A2n5ZPik1NbxoA24xxXF0DlfsL80wlEi8DwwqRygK
         CrNThA5xqbrHZc1Q7N6SYruVkN9dC7UYxz7ZAzmY4G62Jd5ATyzzD9E5SU11wnO4JF11
         J3JCm7bt+dLgAD0KHDadGCpt7fKwewFgxM3we+TUORzMAl8VTMcZAgBnMW/uVIpp8mjF
         0OQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762504137; x=1763108937;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PkwNcN7lNA8yjMuppF3gbnvT8EESBLGSdHJNmN1pAvM=;
        b=JFJyye25ZgWOfrVJBNIhgnqftxslLPqMSB/4kRYHZLboCeW/awvPwDYiNtQLbZdHQJ
         s5PUxOgPeUD+e3U7HX6JvZM0UWjgb7NjiY4/RTR1ZDxk0dTqwt8RLIIp9gjyF32kCG7A
         liYQxoIBNPzYmKojVX6yHd8ajEtoa/0G6SryMld2mNe9mdK5MiBVwnaJc3hc5CcY/SSt
         jRKsALeVCT1Rgjkxe/li1Q82o4Yy2qi+6CZQsR8Ot/m/xPztP3m5hNfbusK9zqI+kN6H
         1WJIUl8gyF1ACPyvudUY+Z+Q2b/5EzCBpQaerI2Kn+gVyPRXAE+iREppkb3M82axkZOr
         MKGw==
X-Forwarded-Encrypted: i=1; AJvYcCWEVrxTgjM4XGe3O0EgJa9Ao1Z+Q3MFpw4HLCSPeF3qFBdkqUqvBYDzDjQFP/1/9qLvlZY8D6je0gU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx0pdC8+n3iAc7H6KRZTcje3aP73wrBbRIMQlNdylHXssRJI+wt
	Cti1cnQktIsB9VEaTJQwRMkujcjRTuUkrqFQE0JB9pvsDJqDsYWuuRjk
X-Gm-Gg: ASbGncuTeSnErP9KpaNbb+EOYujtPyVOkUx7i9vqfJ9MIM0S8EDYuDJKieDiiQnPeBl
	ppRDSQjaBhAXR9ee7Hqy81jUgJ3nZz2rkBuHEkzkOAFWtcDBmXPQvvSBNno/tihYn/EfN5OvC4x
	hvYBrIk5gzROmizAqhoVs+oHPA+EHYmbwuUWmJmI160zGIdPUiFBdB9qejv2a3/JP4V3e4aOCgE
	Hdf5x5OXs+7khElwEd/8tN/5tCpJvrkFpJ+C19NiufDbX/l5WiXvA1wchd+btsM+E8q/HnGYELT
	K3sDGJZe5KkngTyCncKbqhcWzdKRgImI70d1Dm5tyEZlpSiTo1vYowikozIyIXG0Ei5JYnamTR3
	OTrb/d/9p3Hr8hloLq22KdvjmKvC58JK3mRsJylhY/OO0o0zz4p/zGr2oSWc1+r5aFWZZTELVGC
	cwe6Vw+0LJwNOoQTtXeK+FRdAWySlAPfncSJY=
X-Google-Smtp-Source: AGHT+IGmi7Nd+1V1HB78WrfR2YaCRGz4GK08rmvtSx2BEaCkuYcoSwWry59kZ1MddyZubeYDuz8urA==
X-Received: by 2002:a17:906:dc92:b0:b6d:95b3:5881 with SMTP id a640c23a62f3a-b72c0d5d85emr211485866b.33.1762504136401;
        Fri, 07 Nov 2025 00:28:56 -0800 (PST)
Message-ID: <c3d0dbc8-559d-4393-842a-617532a52e21@gmail.com>
Date: Fri, 7 Nov 2025 10:26:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Mykola Kvach <xakep.amatop@gmail.com>
Subject: Re: [PATCH v13 07/12] xen/arm: add support for cache coloring
 configuration via device-tree
To: Carlo Nonato <carlo.nonato@minervasys.tech>,
 xen-devel@lists.xenproject.org
Cc: andrea.bastoni@minervasys.tech, marco.solieri@minervasys.tech,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241217170637.233097-1-carlo.nonato@minervasys.tech>
 <20241217170637.233097-8-carlo.nonato@minervasys.tech>
Content-Language: en-US
In-Reply-To: <20241217170637.233097-8-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Carlo,

Thank you for the patch.

On 17/12/2024 19:06, Carlo Nonato wrote:
> Add the "llc-colors" Device Tree property to express DomUs and Dom0less
> color configurations.
> 
> Based on original work from: Luca Miccio <lucmiccio@gmail.com>
> 
> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
> Reviewed-by: Jan Beulich <jbeulich@suse.com> # non-Arm
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> ---
> v13:
> - no changes
> v12:
> - no changes
> v11:
> - made clear that llc-colors device-tree property is Arm64-only in booting.txt
> v10:
> - no changes
> v9:
> - use best-effort allocation in domain_set_llc_colors_from_str()
> v8:
> - fixed memory leak on error path of domain_set_llc_colors_from_str()
> - realloc colors array after parsing from string to reduce memory usage
> v7:
> - removed alloc_colors() helper usage from domain_set_llc_colors_from_str()
> v6:
> - rewrote domain_set_llc_colors_from_str() to be more explicit
> v5:
> - static-mem check has been moved in a previous patch
> - added domain_set_llc_colors_from_str() to set colors after domain creation
> ---
>   docs/misc/arm/device-tree/booting.txt |  5 +++
>   docs/misc/cache-coloring.rst          | 48 +++++++++++++++++++++++++++
>   xen/arch/arm/dom0less-build.c         | 10 ++++++
>   xen/common/llc-coloring.c             | 40 ++++++++++++++++++++++
>   xen/include/xen/llc-coloring.h        |  1 +
>   xen/include/xen/xmalloc.h             | 12 +++++++
>   6 files changed, 116 insertions(+)
> 
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> index 3a04f5c57f..9c881baccc 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -162,6 +162,11 @@ with the following properties:
>   
>       An integer specifying the number of vcpus to allocate to the guest.
>   
> +- llc-colors
> +    A string specifying the LLC color configuration for the guest.
> +    Refer to docs/misc/cache_coloring.rst for syntax. This option is applicable
> +    only to Arm64 guests.
> +
>   - vpl011
>   
>       An empty property to enable/disable a virtual pl011 for the guest to
> diff --git a/docs/misc/cache-coloring.rst b/docs/misc/cache-coloring.rst
> index 7b47d0ed92..e097e74032 100644
> --- a/docs/misc/cache-coloring.rst
> +++ b/docs/misc/cache-coloring.rst
> @@ -14,6 +14,7 @@ If needed, change the maximum number of colors with
>   ``CONFIG_LLC_COLORS_ORDER=<n>``.
>   
>   Runtime configuration is done via `Command line parameters`_.
> +For DomUs follow `DomUs configuration`_.
>   
>   Background
>   **********
> @@ -149,6 +150,53 @@ LLC specs can be manually set via the above command line parameters. This
>   bypasses any auto-probing and it's used to overcome failing situations, such as
>   flawed probing logic, or for debugging/testing purposes.
>   
> +DomUs configuration
> +*******************
> +
> +DomUs colors can be set either in the ``xl`` configuration file (documentation
> +at `docs/man/xl.cfg.pod.5.in`) or via Device Tree (documentation at
> +`docs/misc/arm/device-tree/booting.txt`) using the ``llc-colors`` option.
> +For example:
> +
> +::
> +
> +    xen,xen-bootargs = "console=dtuart dtuart=serial0 dom0_mem=1G dom0_max_vcpus=1 sched=null llc-coloring=on dom0-llc-colors=2-6";
> +    xen,dom0-bootargs "console=hvc0 earlycon=xen earlyprintk=xen root=/dev/ram0"
> +
> +    dom0 {
> +        compatible = "xen,linux-zimage" "xen,multiboot-module";
> +        reg = <0x0 0x1000000 0x0 15858176>;
> +    };
> +
> +    dom0-ramdisk {
> +        compatible = "xen,linux-initrd" "xen,multiboot-module";
> +        reg = <0x0 0x2000000 0x0 20638062>;
> +    };
> +
> +    domU0 {
> +        #address-cells = <0x1>;
> +        #size-cells = <0x1>;
> +        compatible = "xen,domain";
> +        memory = <0x0 0x40000>;
> +        llc-colors = "4-8,10,11,12";
> +        cpus = <0x1>;
> +        vpl011 = <0x1>;
> +
> +        module@2000000 {
> +            compatible = "multiboot,kernel", "multiboot,module";
> +            reg = <0x2000000 0xffffff>;
> +            bootargs = "console=ttyAMA0";
> +        };
> +
> +        module@30000000 {
> +            compatible = "multiboot,ramdisk", "multiboot,module";
> +            reg = <0x3000000 0xffffff>;
> +        };
> +    };
> +
> +**Note:** If no color configuration is provided for a domain, the default one,
> +which corresponds to all available colors is used instead.
> +
>   Known issues and limitations
>   ****************************
>   
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index 67b1503647..49d1f14d65 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -817,6 +817,7 @@ void __init create_domUs(void)
>       bool iommu = false;
>       const struct dt_device_node *cpupool_node,
>                                   *chosen = dt_find_node_by_path("/chosen");
> +    const char *llc_colors_str = NULL;
>   
>       BUG_ON(chosen == NULL);
>       dt_for_each_child_node(chosen, node)
> @@ -965,6 +966,10 @@ void __init create_domUs(void)
>   #endif
>           }
>   
> +        dt_property_read_string(node, "llc-colors", &llc_colors_str);
> +        if ( !llc_coloring_enabled && llc_colors_str )
> +            panic("'llc-colors' found, but LLC coloring is disabled\n");
> +
>           /*
>            * The variable max_init_domid is initialized with zero, so here it's
>            * very important to use the pre-increment operator to call
> @@ -975,6 +980,11 @@ void __init create_domUs(void)
>               panic("Error creating domain %s (rc = %ld)\n",
>                     dt_node_name(node), PTR_ERR(d));
>   
> +        if ( llc_coloring_enabled &&
> +             (rc = domain_set_llc_colors_from_str(d, llc_colors_str)) )
> +            panic("Error initializing LLC coloring for domain %s (rc = %d)\n",
> +                  dt_node_name(node), rc);
> +
>           d->is_console = true;
>           dt_device_set_used_by(node, d->domain_id);
>   
> diff --git a/xen/common/llc-coloring.c b/xen/common/llc-coloring.c
> index 3dd1aaa4df..5a0e3bac59 100644
> --- a/xen/common/llc-coloring.c
> +++ b/xen/common/llc-coloring.c
> @@ -282,6 +282,46 @@ void domain_llc_coloring_free(struct domain *d)
>       xfree(__va(__pa(d->llc_colors)));
>   }
>   
> +int __init domain_set_llc_colors_from_str(struct domain *d, const char *str)
> +{
> +    int err;
> +    unsigned int *colors, num_colors;
> +
> +    if ( !str )
> +    {
> +        domain_set_default_colors(d);
> +        return 0;
> +    }
> +
> +    colors = xmalloc_array(unsigned int, max_nr_colors);
> +    if ( !colors )
> +        return -ENOMEM;
> +
> +    err = parse_color_config(str, colors, max_nr_colors, &num_colors);
> +    if ( err )
> +    {
> +        printk(XENLOG_ERR "Error parsing LLC color configuration");

Missing \n at the end of this printk.

> +        xfree(colors);
> +        return err;
> +    }
> +
> +    if ( !check_colors(colors, num_colors) )
> +    {
> +        printk(XENLOG_ERR "%pd: bad LLC color config\n", d);
> +        xfree(colors);
> +        return -EINVAL;
> +    }
> +
> +    /* Adjust the size cause it was initially set to max_nr_colors */
> +    d->llc_colors = xrealloc_array(colors, num_colors);
> +    if ( !d->llc_colors )
> +        d->llc_colors = colors;
> +
> +    d->num_llc_colors = num_colors;
> +
> +    return 0;
> +}
> +
>   /*
>    * Local variables:
>    * mode: C
> diff --git a/xen/include/xen/llc-coloring.h b/xen/include/xen/llc-coloring.h
> index 26353c808a..5d1355b3c9 100644
> --- a/xen/include/xen/llc-coloring.h
> +++ b/xen/include/xen/llc-coloring.h
> @@ -34,6 +34,7 @@ void arch_llc_coloring_init(void);
>   int dom0_set_llc_colors(struct domain *d);
>   int domain_set_llc_colors(struct domain *d,
>                             const struct xen_domctl_set_llc_colors *config);
> +int domain_set_llc_colors_from_str(struct domain *d, const char *str);
>   
>   #endif /* __XEN_LLC_COLORING_H__ */
>   
> diff --git a/xen/include/xen/xmalloc.h b/xen/include/xen/xmalloc.h
> index b903fa2e26..f0412fb4e0 100644
> --- a/xen/include/xen/xmalloc.h
> +++ b/xen/include/xen/xmalloc.h
> @@ -37,6 +37,9 @@
>       ((_type *)_xmalloc_array(sizeof(_type), __alignof__(_type), _num))
>   #define xzalloc_array(_type, _num) \
>       ((_type *)_xzalloc_array(sizeof(_type), __alignof__(_type), _num))
> +#define xrealloc_array(_ptr, _num)                                  \
> +    ((typeof(_ptr))_xrealloc_array(_ptr, sizeof(typeof(*(_ptr))),   \
> +                                   __alignof__(typeof(*(_ptr))), _num))
>   
>   /* Allocate space for a structure with a flexible array of typed objects. */
>   #define xzalloc_flex_struct(type, field, nr) \
> @@ -98,6 +101,15 @@ static inline void *_xzalloc_array(
>       return _xzalloc(size * num, align);
>   }
>   
> +static inline void *_xrealloc_array(
> +    void *ptr, unsigned long size, unsigned long align, unsigned long num)
> +{
> +    /* Check for overflow. */
> +    if ( size && num > UINT_MAX / size )
> +        return NULL;
> +    return _xrealloc(ptr, size * num, align);
> +}
> +
>   /*
>    * Pooled allocator interface.
>    */

Best regards,
Mykola


