Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA9651BC76
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 11:49:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.321906.543055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmY6X-0003sU-3v; Thu, 05 May 2022 09:49:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 321906.543055; Thu, 05 May 2022 09:49:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmY6X-0003qb-0u; Thu, 05 May 2022 09:49:01 +0000
Received: by outflank-mailman (input) for mailman id 321906;
 Thu, 05 May 2022 09:48:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iwW6=VN=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nmY6V-0003qV-Ak
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 09:48:59 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95822f1e-cc58-11ec-a406-831a346695d4;
 Thu, 05 May 2022 11:48:58 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 v64-20020a1cac43000000b0038cfd1b3a6dso4740439wme.5
 for <xen-devel@lists.xenproject.org>; Thu, 05 May 2022 02:48:58 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 7-20020a05600c230700b003942a244edbsm1122594wmo.32.2022.05.05.02.48.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 02:48:56 -0700 (PDT)
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
X-Inumbo-ID: 95822f1e-cc58-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=pSvw9K1FYxiVG0Z10oAKU+AQrsUSBrFUaiCoJdmHWuc=;
        b=KoRvUAl+/qpGx0yGTKaAV/486S+mgxPNc9P1T2dlsR0k7NOVOYCy07czgeRefxC49z
         bh7r9O95uA8InAHWJYZWaHqG7z97dS/OLHrpxLAOHhl4NYncqV+XHwxLCpanNisHNCBh
         2rBm+q1k8rAcGZeSdEoaJ/K6jQCkZUjqnUIspD+TYmodURIbi+92ZchDDS77U7uU9xnq
         5npoDYKvl1WtDC+b9ayjQmUL7E6oGHdEWKcJsFer+ZXW68a9sGPcDOwt3ZfCE5F56SrR
         w8U8aDyCkW9CevOt1wevF4PalQweXdeo+vSNKgzqE5YZuAxwL6IXrZwUQ1MVydVjUnSO
         gFwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=pSvw9K1FYxiVG0Z10oAKU+AQrsUSBrFUaiCoJdmHWuc=;
        b=wj4RPNIPjeox0qBOFFP5b6oCCqUaknQD3wgQ171oo7qqNUahhYvx4IAPhcIYRtQWmX
         CC7UdiKkc77SWz5/uUe1PzwR8VcORlCrkmp687OOPm7WN502mC9E7QtR/x2xE0DP27LL
         0hOdu04pRtdzTP7yfwQG8Ptd6XxYunbTldQPRj7V7rncLQ6NlbFZ6a7MEoT4sCb5cEfd
         bAA4+ccFKC0XWED2NQyI03CRDcG6J6kFKe0zhZHZ080I9ALHtGSJG7hGPcx+jxcL9kfo
         pl90FPKytfuUCcIqN90Wk0/lrU4ZT0seAdpvyjuMqeJDKlpDjiATayf1vV8Foi3gtEhx
         y6zw==
X-Gm-Message-State: AOAM530ndC/KBotq2/56PyVnIrzgzPGagRYkskC+qmiQve+IFjxHiOxO
	txQRV7bSQwegaWJ6+UKCiq5IHtoJTmQ=
X-Google-Smtp-Source: ABdhPJw2ZpARWggm0W0a3xNvR1XD67CV3GZ8YCbaGcTimHSLTXqOArruatu5KcghWtvXGScNTUE9mw==
X-Received: by 2002:a05:600c:1f1a:b0:394:29c1:6d82 with SMTP id bd26-20020a05600c1f1a00b0039429c16d82mr3634809wmb.111.1651744137436;
        Thu, 05 May 2022 02:48:57 -0700 (PDT)
Subject: Re: [PATCH v6 2/7] xen/arm: implement domU extended regions
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: jgross@suse.com, Bertrand.Marquis@arm.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Luca Fancellu <luca.fancellu@arm.com>
References: <alpine.DEB.2.22.394.2205041715320.43560@ubuntu-linux-20-04-desktop>
 <20220505001656.395419-2-sstabellini@kernel.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <ef5c6ec9-503c-b853-6fb6-51ae7cb8de55@gmail.com>
Date: Thu, 5 May 2022 12:48:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20220505001656.395419-2-sstabellini@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 05.05.22 03:16, Stefano Stabellini wrote:

Hello Stefano


> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
>
> Implement extended regions for dom0less domUs. The implementation is
> based on the libxl implementation.
>
> Also update docs for the ext_regions command line option.
>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> CC: olekstysh@gmail.com


Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>


Thanks!


> ---
> Changes in v6:
> - add reviewed-by
> - address 2 NITs
> - update docs
>
> Changes in v5:
> - print the domain
> - coding style
> - simplify the code in find_domU_holes
> - return error if no regions allocated in find_domU_holes
> - use ROUNDUP
> - uint64_t/paddr_t
> ---
>   docs/misc/xen-command-line.pandoc |  9 ++---
>   xen/arch/arm/domain_build.c       | 60 ++++++++++++++++++++++++++-----
>   2 files changed, 56 insertions(+), 13 deletions(-)
>
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> index 1dc7e1ca07..881fe409ac 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -1110,11 +1110,12 @@ to use the default.
>   
>   > Default : `true`
>   
> -Flag to enable or disable support for extended regions for Dom0.
> +Flag to enable or disable support for extended regions for Dom0 and
> +Dom0less DomUs.
>   
> -Extended regions are ranges of unused address space exposed to Dom0 as
> -"safe to use" for special memory mappings. Disable if your board device
> -tree is incomplete.
> +Extended regions are ranges of unused address space exposed to the guest
> +as "safe to use" for special memory mappings. Disable if your board
> +device tree is incomplete.
>   
>   ### flask
>   > `= permissive | enforcing | late | disabled`
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 1472ca4972..f22450b4b7 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -35,7 +35,10 @@
>   static unsigned int __initdata opt_dom0_max_vcpus;
>   integer_param("dom0_max_vcpus", opt_dom0_max_vcpus);
>   
> -/* If true, the extended regions support is enabled for dom0 */
> +/*
> + * If true, the extended regions support is enabled for dom0 and
> + * dom0less domUs.
> + */
>   static bool __initdata opt_ext_regions = true;
>   boolean_param("ext_regions", opt_ext_regions);
>   
> @@ -1324,6 +1327,36 @@ out:
>       return res;
>   }
>   
> +static int __init find_domU_holes(const struct kernel_info *kinfo,
> +                                  struct meminfo *ext_regions)
> +{
> +    unsigned int i;
> +    paddr_t bankend;
> +    const paddr_t bankbase[] = GUEST_RAM_BANK_BASES;
> +    const paddr_t banksize[] = GUEST_RAM_BANK_SIZES;
> +    int res = -ENOENT;
> +
> +    for ( i = 0; i < GUEST_RAM_BANKS; i++ )
> +    {
> +        struct membank *ext_bank = &(ext_regions->bank[ext_regions->nr_banks]);
> +
> +        ext_bank->start = ROUNDUP(bankbase[i] + kinfo->mem.bank[i].size, SZ_2M);
> +
> +        bankend = ~0ULL >> (64 - p2m_ipa_bits);
> +        bankend = min(bankend, bankbase[i] + banksize[i] - 1);
> +        if ( bankend > ext_bank->start )
> +            ext_bank->size = bankend - ext_bank->start + 1;
> +
> +        /* 64MB is the minimum size of an extended region */
> +        if ( ext_bank->size < MB(64) )
> +            continue;
> +        ext_regions->nr_banks++;
> +        res = 0;
> +    }
> +
> +    return res;
> +}
> +
>   static int __init make_hypervisor_node(struct domain *d,
>                                          const struct kernel_info *kinfo,
>                                          int addrcells, int sizecells)
> @@ -1360,12 +1393,13 @@ static int __init make_hypervisor_node(struct domain *d,
>   
>       if ( !opt_ext_regions )
>       {
> -        printk(XENLOG_INFO "The extended regions support is disabled\n");
> +        printk(XENLOG_INFO "%pd: extended regions support is disabled\n", d);
>           nr_ext_regions = 0;
>       }
>       else if ( is_32bit_domain(d) )
>       {
> -        printk(XENLOG_WARNING "The extended regions are only supported for 64-bit guest currently\n");
> +        printk(XENLOG_WARNING
> +               "%pd: extended regions not supported for 32-bit guests\n", d);
>           nr_ext_regions = 0;
>       }
>       else
> @@ -1374,13 +1408,21 @@ static int __init make_hypervisor_node(struct domain *d,
>           if ( !ext_regions )
>               return -ENOMEM;
>   
> -        if ( !is_iommu_enabled(d) )
> -            res = find_unallocated_memory(kinfo, ext_regions);
> +        if ( is_domain_direct_mapped(d) )
> +        {
> +            if ( !is_iommu_enabled(d) )
> +                res = find_unallocated_memory(kinfo, ext_regions);
> +            else
> +                res = find_memory_holes(kinfo, ext_regions);
> +        }
>           else
> -            res = find_memory_holes(kinfo, ext_regions);
> +        {
> +            res = find_domU_holes(kinfo, ext_regions);
> +        }
>   
>           if ( res )
> -            printk(XENLOG_WARNING "Failed to allocate extended regions\n");
> +            printk(XENLOG_WARNING "%pd: failed to allocate extended regions\n",
> +                   d);
>           nr_ext_regions = ext_regions->nr_banks;
>       }
>   
> @@ -1401,8 +1443,8 @@ static int __init make_hypervisor_node(struct domain *d,
>           u64 start = ext_regions->bank[i].start;
>           u64 size = ext_regions->bank[i].size;
>   
> -        printk("Extended region %d: %#"PRIx64"->%#"PRIx64"\n",
> -               i, start, start + size);
> +        printk("%pd: extended region %d: %#"PRIx64"->%#"PRIx64"\n",
> +               d, i, start, start + size);
>   
>           dt_child_set_range(&cells, addrcells, sizecells, start, size);
>       }

-- 
Regards,

Oleksandr Tyshchenko


