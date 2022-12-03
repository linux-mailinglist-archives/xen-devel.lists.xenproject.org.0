Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5793F64194B
	for <lists+xen-devel@lfdr.de>; Sat,  3 Dec 2022 22:55:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.452853.710657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p1aTG-0001ri-9T; Sat, 03 Dec 2022 21:54:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 452853.710657; Sat, 03 Dec 2022 21:54:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p1aTG-0001pI-6S; Sat, 03 Dec 2022 21:54:54 +0000
Received: by outflank-mailman (input) for mailman id 452853;
 Sat, 03 Dec 2022 21:54:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p1aTE-0001pB-Tj
 for xen-devel@lists.xenproject.org; Sat, 03 Dec 2022 21:54:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p1aTE-0004nO-8h; Sat, 03 Dec 2022 21:54:52 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p1aTE-0005nA-1V; Sat, 03 Dec 2022 21:54:52 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=1KWVxk35bn8Yhx88QoQGrkJyqaO8q0xTERewyP6vN7E=; b=c7aVW/zpwLkd8ysrUktC1RpCe5
	WpuIVGWAgh6TSgWkJ5xUKR6+nxy13qe/1yi9NwIAIgCUa9KhbmBPA8BnKDsJCGrBTYnhZNWqS2OHF
	qS8Fbs+XSma9Zh3Kfh/ooNLBwj0aKxCbd6usZpfKLgD5iaC1f3xls42wTtGYAH1x7WFM=;
Message-ID: <e4e25940-9637-2046-18e0-82a863c2737e@xen.org>
Date: Sat, 3 Dec 2022 21:54:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
To: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <cover.1669888522.git.rahul.singh@arm.com>
 <505b4566579b65afa0696c3a8772416a4c7cf59f.1669888522.git.rahul.singh@arm.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [RFC PATCH 04/21] xen/arm: vIOMMU: add generic vIOMMU framework
In-Reply-To: <505b4566579b65afa0696c3a8772416a4c7cf59f.1669888522.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Rahul,

On 01/12/2022 16:02, Rahul Singh wrote:
> This patch adds basic framework for vIOMMU.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
>   xen/arch/arm/domain.c                | 17 +++++++
>   xen/arch/arm/domain_build.c          |  3 ++
>   xen/arch/arm/include/asm/viommu.h    | 70 ++++++++++++++++++++++++++++
>   xen/drivers/passthrough/Kconfig      |  6 +++
>   xen/drivers/passthrough/arm/Makefile |  1 +
>   xen/drivers/passthrough/arm/viommu.c | 48 +++++++++++++++++++
>   xen/include/public/arch-arm.h        |  4 ++
>   7 files changed, 149 insertions(+)
>   create mode 100644 xen/arch/arm/include/asm/viommu.h
>   create mode 100644 xen/drivers/passthrough/arm/viommu.c
> 
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 38e22f12af..2a85209736 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -37,6 +37,7 @@
>   #include <asm/tee/tee.h>
>   #include <asm/vfp.h>
>   #include <asm/vgic.h>
> +#include <asm/viommu.h>
>   #include <asm/vtimer.h>
>   
>   #include "vpci.h"
> @@ -691,6 +692,13 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>           return -EINVAL;
>       }
>   
> +    if ( config->arch.viommu_type != XEN_DOMCTL_CONFIG_VIOMMU_NONE )
> +    {
> +        dprintk(XENLOG_INFO,
> +                "vIOMMU type requested not supported by the platform or Xen\n");
> +        return -EINVAL;
> +    }
> +
>       return 0;
>   }
>   
> @@ -783,6 +791,9 @@ int arch_domain_create(struct domain *d,
>       if ( (rc = domain_vpci_init(d)) != 0 )
>           goto fail;
>   
> +    if ( (rc = domain_viommu_init(d, config->arch.viommu_type)) != 0 )
> +        goto fail;
> +
>       return 0;
>   
>   fail:
> @@ -998,6 +1009,7 @@ static int relinquish_memory(struct domain *d, struct page_list_head *list)
>   enum {
>       PROG_pci = 1,
>       PROG_tee,
> +    PROG_viommu,
>       PROG_xen,
>       PROG_page,
>       PROG_mapping,
> @@ -1048,6 +1060,11 @@ int domain_relinquish_resources(struct domain *d)
>           if (ret )
>               return ret;
>   
> +    PROGRESS(viommu):
> +        ret = viommu_relinquish_resources(d);
> +        if (ret )
> +            return ret;

I would have expected us to relinquish the vIOMMU resources *before* we 
detach the devices. So can you explain the ordering?

> +
>       PROGRESS(xen):
>           ret = relinquish_memory(d, &d->xenpage_list);
>           if ( ret )
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index bd30d3798c..abbaf37a2e 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -27,6 +27,7 @@
>   #include <asm/setup.h>
>   #include <asm/cpufeature.h>
>   #include <asm/domain_build.h>
> +#include <asm/viommu.h>
>   #include <xen/event.h>
>   
>   #include <xen/irq.h>
> @@ -3858,6 +3859,7 @@ void __init create_domUs(void)
>           struct domain *d;
>           struct xen_domctl_createdomain d_cfg = {
>               .arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE,
> +            .arch.viommu_type = viommu_get_type(),

I don't think the vIOMMU should be enabled to dom0less domU by default.

>               .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
>               /*
>                * The default of 1023 should be sufficient for guests because
> @@ -4052,6 +4054,7 @@ void __init create_dom0(void)
>           printk(XENLOG_WARNING "Maximum number of vGIC IRQs exceeded.\n");
>       dom0_cfg.arch.tee_type = tee_get_type();
>       dom0_cfg.max_vcpus = dom0_max_vcpus();
> +    dom0_cfg.arch.viommu_type = viommu_get_type();

Same here.

>   
>       if ( iommu_enabled )
>           dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
> diff --git a/xen/arch/arm/include/asm/viommu.h b/xen/arch/arm/include/asm/viommu.h
> new file mode 100644
> index 0000000000..7cd3818a12
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/viommu.h
> @@ -0,0 +1,70 @@
> +/* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
> +#ifndef __ARCH_ARM_VIOMMU_H__
> +#define __ARCH_ARM_VIOMMU_H__
> +
> +#ifdef CONFIG_VIRTUAL_IOMMU
> +
> +#include <xen/lib.h>
> +#include <xen/types.h>
> +#include <public/xen.h>
> +
> +struct viommu_ops {
> +    /*
> +     * Called during domain construction if toolstack requests to enable
> +     * vIOMMU support.
> +     */
> +    int (*domain_init)(struct domain *d);
> +
> +    /*
> +     * Called during domain destruction to free resources used by vIOMMU.
> +     */
> +    int (*relinquish_resources)(struct domain *d);
> +};
> +
> +struct viommu_desc {
> +    /* vIOMMU domains init/free operations described above. */
> +    const struct viommu_ops *ops;
> +
> +    /*
> +     * ID of vIOMMU. Corresponds to xen_arch_domainconfig.viommu_type.

Did you mean ID rather than type?

> +     * Should be one of XEN_DOMCTL_CONFIG_VIOMMU_xxx
> +     */
> +    uint16_t viommu_type;

The domctl is uint8_t.

Cheers,

-- 
Julien Grall

