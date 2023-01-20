Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E62D96754BC
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 13:39:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481735.746820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIqft-0006K0-5P; Fri, 20 Jan 2023 12:39:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481735.746820; Fri, 20 Jan 2023 12:39:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIqft-0006HS-2V; Fri, 20 Jan 2023 12:39:17 +0000
Received: by outflank-mailman (input) for mailman id 481735;
 Fri, 20 Jan 2023 12:39:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nUaQ=5R=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pIqfr-0006HM-8h
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 12:39:15 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2045.outbound.protection.outlook.com [40.107.92.45])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 704109b3-98bf-11ed-b8d1-410ff93cb8f0;
 Fri, 20 Jan 2023 13:39:11 +0100 (CET)
Received: from BN0PR04CA0041.namprd04.prod.outlook.com (2603:10b6:408:e8::16)
 by SA1PR12MB7040.namprd12.prod.outlook.com (2603:10b6:806:24f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.27; Fri, 20 Jan
 2023 12:39:07 +0000
Received: from BN8NAM11FT105.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e8:cafe::f9) by BN0PR04CA0041.outlook.office365.com
 (2603:10b6:408:e8::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.27 via Frontend
 Transport; Fri, 20 Jan 2023 12:39:07 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT105.mail.protection.outlook.com (10.13.176.183) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6023.16 via Frontend Transport; Fri, 20 Jan 2023 12:39:06 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 20 Jan
 2023 06:39:06 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 20 Jan
 2023 06:39:06 -0600
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 20 Jan 2023 06:39:04 -0600
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
X-Inumbo-ID: 704109b3-98bf-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Osg/Ri+/dqRcBCpMcwcbm5u19orSqWPNuD2Cw4HEQqP8BkcRVmzrYtBDnwBKBkQ/qEyc5NDA7n/RiKSUU9EKzI1p5SHyqZACWU+yf7MLzsc8+Tt2AdktWsh6q0WHa3eQsXpGpdlIHBGgArRoJNGUhDYkw5iO+B0biAlsdOxwaOg4n4p8QD2X7uCldXcGkxMNzJVipKffsJBgEd+PB0cic7ZiNZjvGW9Y54A1LAGx3GopOVOJ+iP/VLwsCuWJ23oUA+7ay0cuJ+FqrOSt3G3snv2NQPAkLyZFfgHITBSFKuFcZf6OXbcRK94jRAKOoA7vjp3IukTibANNhhhD+C6gdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WygvesPP9qGuUZ5mS+MGnn3SK4/VQvog47EiJyqJOwA=;
 b=NGAjowdHNhaGmBgg/0T2zNQ3U+7uIF5IpWDC9elxEJB3Wt90lKnbkgMzg7xP42S/oUZyEwPokV6N3rsWum1gFh1jIEt/fdp0G9gTVVljnSNgNfTLbDr/fCiF5H/U0MBsbOCxss8f6ycXGfFb5OTDzfTS/viyjU3DqIQ5KP15YPsnX7g5iItRnhPiz6Xab7LMzLUuPsfpLpuTGM2VRqXZWwj7INTMqv40+3UBbISLQgJFY/az3NG4kqtYJuO3ta5qTDpAPbp6dNtkQZaOd1R45jpP+gdoEqnx2fSi8Ah8SO0h/RGnzjLSe1UBbRIZ9ClGnkDzc6P2cxtXmn4q0HDe3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WygvesPP9qGuUZ5mS+MGnn3SK4/VQvog47EiJyqJOwA=;
 b=iWYsG3Up71LcISDWTmMWTTGu1e6hOJPefRJurjVhuY3Ckaz/eH/rxwHzXYHRpkFJ2MTJ/selrVAzijXwTukLzu8NyaYBU2f7GUs5ygBfaC3tE27/aQ8c4lJjWM1vU0v+eTvsO2xFRvdGmnGqkMowJquYogv/rvyHRB+ANAyByf8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <1be7ea27-aec5-e2ae-48c1-fe0c1f099181@amd.com>
Date: Fri, 20 Jan 2023 13:39:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [XEN][RFC PATCH v4 01/16] xen/arm/device: Remove __init from
 function type
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221207061537.7266-1-vikram.garhwal@amd.com>
 <20221207061537.7266-2-vikram.garhwal@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20221207061537.7266-2-vikram.garhwal@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT105:EE_|SA1PR12MB7040:EE_
X-MS-Office365-Filtering-Correlation-Id: 61a2d8dc-7305-4f1d-ce8d-08dafae35216
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UkFLMFtKsIjw01hWqzukifKbumpx33VpIhi784xu1Wqu7FsXWusIubTG/ycgUCx2qWbF0DR5b2r1JsKgCirX1XFJotvQfP18bFPhR3o0zoQHnSs+vUa1Wj2bI+RJGkX2x72zl5Q/oeGqgeKsLn+FYizFjYSIysNXZZcGeSMAAWq/iWjAdDcC68iLqxSY7ShgsMkLo5N8HByPnYrHqlZZRHRw4zT63qGKPKW8G5beCQOgcON12wUx2icfCTiV38OPIrDObYdl2FKML1UCc+x7BCvFHlSBMQwXLULZHeKnRIh8eF9MYbHOAdg4wZcrNOAHemh5wzX5gup8hgLhJ16C9Ar++ywuUksJ53QUSowG/xjKmyu2qh4g82Y3gzpzIIqmY+0NTQsxQwp3c5VT72N8hL7Bi2qyp/lcv73cBz6LAzn+nIw1wUu7knjszlXh44dG0/E1nDqdu7nK6TAEddenz6+iSn59uKhWIz43pc4FY8V62jnpLWemXY2AR2YFHcPah8m2NsUI6OynQVLNnqWgZrNpDADc+ABDE4V1tSSdtcgEJ0Um2cfN+dYi+pNvHW2TKQhFm11jzczwc1/vjFhKUHXfulqMybPC3T1pSBsRRFwBKvE8NJIWYzqwHjBYbtCexJ+GckJjPLgtlSLuJhDHnvr3GwGxDAepS2cKx7tqB/1keNg0XD4uuwmRPNv5uweX2yWOJ0zqKaefZmMFm7MsEPwp4+4Qqc/ZhvX1pPtMulHuKbIEYh3Lr8J9+c80bqVlVcPEhZavZzLUAlI4kubJzA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(136003)(376002)(396003)(451199015)(36840700001)(40470700004)(46966006)(2616005)(36756003)(41300700001)(336012)(5660300002)(8936002)(30864003)(16576012)(316002)(4326008)(70586007)(70206006)(8676002)(26005)(186003)(82740400003)(82310400005)(356005)(81166007)(86362001)(44832011)(2906002)(83380400001)(47076005)(40460700003)(426003)(31696002)(36860700001)(40480700001)(478600001)(31686004)(110136005)(54906003)(53546011)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 12:39:06.7624
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61a2d8dc-7305-4f1d-ce8d-08dafae35216
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT105.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7040

Hi Vikram,

On 07/12/2022 07:15, Vikram Garhwal wrote:
> 
> 
> Change function type of following function to access during runtime:
>     1. map_irq_to_domain()
>     2. handle_device_interrupt()
>     3. map_range_to_domain()
>     4. unflatten_dt_node()
>     5. unflatten_device_tree()
If you do not want to do this at first use, then this should be a separate patch.
> 
> Move map_irq_to_domain(), handle_device_interrupt() and map_range_to_domain() to
> device.c.
This should be a separate patch (without removing __init) to make the comparison easier.

> 
> unflatten_device_tree(): Add handling of memory allocation failure.
Apart from that you also renamed __unflatten_device_tree to unflatten_device_tree
and you did not mention it.

> 
> These changes are done to support the dynamic programming of a nodes where an
> overlay node will be added to fdt and unflattened node will be added to dt_host.
> Furthermore, IRQ and mmio mapping will be done for the added node.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> ---
>  xen/arch/arm/device.c            | 145 +++++++++++++++++++++++++++++++
>  xen/arch/arm/domain_build.c      | 142 ------------------------------
>  xen/arch/arm/include/asm/setup.h |   3 +
>  xen/common/device_tree.c         |  27 +++---
>  xen/include/xen/device_tree.h    |   5 ++
>  5 files changed, 170 insertions(+), 152 deletions(-)
> 
> diff --git a/xen/arch/arm/device.c b/xen/arch/arm/device.c
> index 70cd6c1a19..d299c04e62 100644
> --- a/xen/arch/arm/device.c
> +++ b/xen/arch/arm/device.c
> @@ -21,6 +21,9 @@
>  #include <xen/errno.h>
>  #include <xen/init.h>
>  #include <xen/lib.h>
> +#include <xen/iocap.h>
> +#include <asm/domain_build.h>
> +#include <asm/setup.h>
> 
>  extern const struct device_desc _sdevice[], _edevice[];
>  extern const struct acpi_device_desc _asdevice[], _aedevice[];
> @@ -84,6 +87,148 @@ enum device_class device_get_class(const struct dt_device_node *dev)
>      return DEVICE_UNKNOWN;
>  }
> 
> +int map_irq_to_domain(struct domain *d, unsigned int irq,
> +                      bool need_mapping, const char *devname)
> +{
> +    int res;
> +
> +    res = irq_permit_access(d, irq);
> +    if ( res )
> +    {
> +        printk(XENLOG_ERR "Unable to permit to dom%u access to IRQ %u\n",
> +               d->domain_id, irq);
> +        return res;
> +    }
> +
> +    if ( need_mapping )
> +    {
> +        /*
> +         * Checking the return of vgic_reserve_virq is not
> +         * necessary. It should not fail except when we try to map
> +         * the IRQ twice. This can legitimately happen if the IRQ is shared
> +         */
> +        vgic_reserve_virq(d, irq);
> +
> +        res = route_irq_to_guest(d, irq, irq, devname);
> +        if ( res < 0 )
> +        {
> +            printk(XENLOG_ERR "Unable to map IRQ%"PRId32" to dom%d\n",
> +                   irq, d->domain_id);
> +            return res;
> +        }
> +    }
> +
> +    dt_dprintk("  - IRQ: %u\n", irq);
> +    return 0;
> +}
> +
> +int map_range_to_domain(const struct dt_device_node *dev,
> +                        u64 addr, u64 len, void *data)
> +{
> +    struct map_range_data *mr_data = data;
> +    struct domain *d = mr_data->d;
> +    int res;
> +
> +    /*
> +     * reserved-memory regions are RAM carved out for a special purpose.
> +     * They are not MMIO and therefore a domain should not be able to
> +     * manage them via the IOMEM interface.
> +     */
> +    if ( strncasecmp(dt_node_full_name(dev), "/reserved-memory/",
> +                     strlen("/reserved-memory/")) != 0 )
> +    {
> +        res = iomem_permit_access(d, paddr_to_pfn(addr),
> +                paddr_to_pfn(PAGE_ALIGN(addr + len - 1)));
> +        if ( res )
> +        {
> +            printk(XENLOG_ERR "Unable to permit to dom%d access to"
> +                   " 0x%"PRIx64" - 0x%"PRIx64"\n",
> +                   d->domain_id,
> +                   addr & PAGE_MASK, PAGE_ALIGN(addr + len) - 1);
> +            return res;
> +        }
> +    }
> +
> +    if ( !mr_data->skip_mapping )
> +    {
> +        res = map_regions_p2mt(d,
> +                               gaddr_to_gfn(addr),
> +                               PFN_UP(len),
> +                               maddr_to_mfn(addr),
> +                               mr_data->p2mt);
> +
> +        if ( res < 0 )
> +        {
> +            printk(XENLOG_ERR "Unable to map 0x%"PRIx64
> +                   " - 0x%"PRIx64" in domain %d\n",
> +                   addr & PAGE_MASK, PAGE_ALIGN(addr + len) - 1,
> +                   d->domain_id);
> +            return res;
> +        }
> +    }
> +
> +    dt_dprintk("  - MMIO: %010"PRIx64" - %010"PRIx64" P2MType=%x\n",
> +               addr, addr + len, mr_data->p2mt);
> +
> +    return 0;
> +}
> +
> +/*
> + * handle_device_interrupts retrieves the interrupts configuration from
> + * a device tree node and maps those interrupts to the target domain.
> + *
> + * Returns:
> + *   < 0 error
> + *   0   success
> + */
> +int handle_device_interrupts(struct domain *d,
> +                             struct dt_device_node *dev,
> +                             bool need_mapping)
> +{
> +    unsigned int i, nirq;
> +    int res;
> +    struct dt_raw_irq rirq;
> +
> +    nirq = dt_number_of_irq(dev);
> +
> +    /* Give permission and map IRQs */
> +    for ( i = 0; i < nirq; i++ )
> +    {
> +        res = dt_device_get_raw_irq(dev, i, &rirq);
> +        if ( res )
> +        {
> +            printk(XENLOG_ERR "Unable to retrieve irq %u for %s\n",
> +                   i, dt_node_full_name(dev));
> +            return res;
> +        }
> +
> +        /*
> +         * Don't map IRQ that have no physical meaning
> +         * ie: IRQ whose controller is not the GIC
> +         */
> +        if ( rirq.controller != dt_interrupt_controller )
> +        {
> +            dt_dprintk("irq %u not connected to primary controller. Connected to %s\n",
> +                       i, dt_node_full_name(rirq.controller));
> +            continue;
> +        }
> +
> +        res = platform_get_irq(dev, i);
> +        if ( res < 0 )
> +        {
> +            printk(XENLOG_ERR "Unable to get irq %u for %s\n",
> +                   i, dt_node_full_name(dev));
> +            return res;
> +        }
> +
> +        res = map_irq_to_domain(d, res, need_mapping, dt_node_name(dev));
> +        if ( res )
> +            return res;
> +    }
> +
> +    return 0;
> +}
> +
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 4fb5c20b13..acde8e714e 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2229,41 +2229,6 @@ int __init make_chosen_node(const struct kernel_info *kinfo)
>      return res;
>  }
> 
> -int __init map_irq_to_domain(struct domain *d, unsigned int irq,
> -                             bool need_mapping, const char *devname)
> -{
> -    int res;
> -
> -    res = irq_permit_access(d, irq);
> -    if ( res )
> -    {
> -        printk(XENLOG_ERR "Unable to permit to dom%u access to IRQ %u\n",
> -               d->domain_id, irq);
> -        return res;
> -    }
> -
> -    if ( need_mapping )
> -    {
> -        /*
> -         * Checking the return of vgic_reserve_virq is not
> -         * necessary. It should not fail except when we try to map
> -         * the IRQ twice. This can legitimately happen if the IRQ is shared
> -         */
> -        vgic_reserve_virq(d, irq);
> -
> -        res = route_irq_to_guest(d, irq, irq, devname);
> -        if ( res < 0 )
> -        {
> -            printk(XENLOG_ERR "Unable to map IRQ%"PRId32" to dom%d\n",
> -                   irq, d->domain_id);
> -            return res;
> -        }
> -    }
> -
> -    dt_dprintk("  - IRQ: %u\n", irq);
> -    return 0;
> -}
If you move map_irq_to_domain from domain_build.c to device.c, then the prototype needs to also
be moved from domain_build.h to setup.h

> -
>  static int __init map_dt_irq_to_domain(const struct dt_device_node *dev,
>                                         const struct dt_irq *dt_irq,
>                                         void *data)
> @@ -2295,57 +2260,6 @@ static int __init map_dt_irq_to_domain(const struct dt_device_node *dev,
>      return 0;
>  }
> 
> -int __init map_range_to_domain(const struct dt_device_node *dev,
> -                               u64 addr, u64 len, void *data)
> -{
> -    struct map_range_data *mr_data = data;
> -    struct domain *d = mr_data->d;
> -    int res;
> -
> -    /*
> -     * reserved-memory regions are RAM carved out for a special purpose.
> -     * They are not MMIO and therefore a domain should not be able to
> -     * manage them via the IOMEM interface.
> -     */
> -    if ( strncasecmp(dt_node_full_name(dev), "/reserved-memory/",
> -                     strlen("/reserved-memory/")) != 0 )
> -    {
> -        res = iomem_permit_access(d, paddr_to_pfn(addr),
> -                paddr_to_pfn(PAGE_ALIGN(addr + len - 1)));
> -        if ( res )
> -        {
> -            printk(XENLOG_ERR "Unable to permit to dom%d access to"
> -                    " 0x%"PRIx64" - 0x%"PRIx64"\n",
> -                    d->domain_id,
> -                    addr & PAGE_MASK, PAGE_ALIGN(addr + len) - 1);
> -            return res;
> -        }
> -    }
> -
> -    if ( !mr_data->skip_mapping )
> -    {
> -        res = map_regions_p2mt(d,
> -                               gaddr_to_gfn(addr),
> -                               PFN_UP(len),
> -                               maddr_to_mfn(addr),
> -                               mr_data->p2mt);
> -
> -        if ( res < 0 )
> -        {
> -            printk(XENLOG_ERR "Unable to map 0x%"PRIx64
> -                   " - 0x%"PRIx64" in domain %d\n",
> -                   addr & PAGE_MASK, PAGE_ALIGN(addr + len) - 1,
> -                   d->domain_id);
> -            return res;
> -        }
> -    }
> -
> -    dt_dprintk("  - MMIO: %010"PRIx64" - %010"PRIx64" P2MType=%x\n",
> -               addr, addr + len, mr_data->p2mt);
> -
> -    return 0;
> -}
> -
>  /*
>   * For a node which describes a discoverable bus (such as a PCI bus)
>   * then we may need to perform additional mappings in order to make
> @@ -2373,62 +2287,6 @@ static int __init map_device_children(const struct dt_device_node *dev,
>      return 0;
>  }
> 
> -/*
> - * handle_device_interrupts retrieves the interrupts configuration from
> - * a device tree node and maps those interrupts to the target domain.
> - *
> - * Returns:
> - *   < 0 error
> - *   0   success
> - */
> -static int __init handle_device_interrupts(struct domain *d,
> -                                           struct dt_device_node *dev,
> -                                           bool need_mapping)
> -{
> -    unsigned int i, nirq;
> -    int res;
> -    struct dt_raw_irq rirq;
> -
> -    nirq = dt_number_of_irq(dev);
> -
> -    /* Give permission and map IRQs */
> -    for ( i = 0; i < nirq; i++ )
> -    {
> -        res = dt_device_get_raw_irq(dev, i, &rirq);
> -        if ( res )
> -        {
> -            printk(XENLOG_ERR "Unable to retrieve irq %u for %s\n",
> -                   i, dt_node_full_name(dev));
> -            return res;
> -        }
> -
> -        /*
> -         * Don't map IRQ that have no physical meaning
> -         * ie: IRQ whose controller is not the GIC
> -         */
> -        if ( rirq.controller != dt_interrupt_controller )
> -        {
> -            dt_dprintk("irq %u not connected to primary controller. Connected to %s\n",
> -                      i, dt_node_full_name(rirq.controller));
> -            continue;
> -        }
> -
> -        res = platform_get_irq(dev, i);
> -        if ( res < 0 )
> -        {
> -            printk(XENLOG_ERR "Unable to get irq %u for %s\n",
> -                   i, dt_node_full_name(dev));
> -            return res;
> -        }
> -
> -        res = map_irq_to_domain(d, res, need_mapping, dt_node_name(dev));
> -        if ( res )
> -            return res;
> -    }
> -
> -    return 0;
> -}
> -
>  /*
>   * For a given device node:
>   *  - Give permission to the guest to manage IRQ and MMIO range
> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
> index fdbf68aadc..ec050848aa 100644
> --- a/xen/arch/arm/include/asm/setup.h
> +++ b/xen/arch/arm/include/asm/setup.h
> @@ -163,6 +163,9 @@ void device_tree_get_reg(const __be32 **cell, u32 address_cells,
>  u32 device_tree_get_u32(const void *fdt, int node,
>                          const char *prop_name, u32 dflt);
> 
> +int handle_device_interrupts(struct domain *d, struct dt_device_node *dev,
> +                             bool need_mapping);
> +
>  int map_range_to_domain(const struct dt_device_node *dev,
>                          u64 addr, u64 len, void *data);
> 
> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
> index 6c9712ab7b..6518eff9b0 100644
> --- a/xen/common/device_tree.c
> +++ b/xen/common/device_tree.c
> @@ -1811,12 +1811,12 @@ int dt_count_phandle_with_args(const struct dt_device_node *np,
>   * @allnextpp: pointer to ->allnext from last allocated device_node
>   * @fpsize: Size of the node path up at the current depth.
>   */
> -static unsigned long __init unflatten_dt_node(const void *fdt,
> -                                              unsigned long mem,
> -                                              unsigned long *p,
> -                                              struct dt_device_node *dad,
> -                                              struct dt_device_node ***allnextpp,
> -                                              unsigned long fpsize)
> +static unsigned long unflatten_dt_node(const void *fdt,
> +                                       unsigned long mem,
> +                                       unsigned long *p,
> +                                       struct dt_device_node *dad,
> +                                       struct dt_device_node ***allnextpp,
> +                                       unsigned long fpsize)
>  {
>      struct dt_device_node *np;
>      struct dt_property *pp, **prev_pp = NULL;
> @@ -2047,7 +2047,7 @@ static unsigned long __init unflatten_dt_node(const void *fdt,
>  }
> 
>  /**
> - * __unflatten_device_tree - create tree of device_nodes from flat blob
> + * unflatten_device_tree - create tree of device_nodes from flat blob
>   *
>   * unflattens a device-tree, creating the
>   * tree of struct device_node. It also fills the "name" and "type"
> @@ -2056,8 +2056,7 @@ static unsigned long __init unflatten_dt_node(const void *fdt,
>   * @fdt: The fdt to expand
>   * @mynodes: The device_node tree created by the call
>   */
> -static void __init __unflatten_device_tree(const void *fdt,
> -                                           struct dt_device_node **mynodes)
> +int unflatten_device_tree(const void *fdt, struct dt_device_node **mynodes)
>  {
>      unsigned long start, mem, size;
>      struct dt_device_node **allnextp = mynodes;
> @@ -2079,6 +2078,12 @@ static void __init __unflatten_device_tree(const void *fdt,
>      /* Allocate memory for the expanded device tree */
>      mem = (unsigned long)_xmalloc (size + 4, __alignof__(struct dt_device_node));
> 
> +    if ( mem == 0 )
NIT: !mem would be preffered.

> +    {
> +        printk(XENLOG_ERR "Cannot allocate memory for unflatten device tree\n");
> +        return -ENOMEM;
What is the point of modifying the function to return a value if ...
> +    }
> +
>      ((__be32 *)mem)[size / 4] = cpu_to_be32(0xdeadbeef);
> 
>      dt_dprintk("  unflattening %lx...\n", mem);
> @@ -2095,6 +2100,8 @@ static void __init __unflatten_device_tree(const void *fdt,
>      *allnextp = NULL;
> 
>      dt_dprintk(" <- unflatten_device_tree()\n");
> +
> +    return 0;
>  }
> 
>  static void dt_alias_add(struct dt_alias_prop *ap,
> @@ -2179,7 +2186,7 @@ dt_find_interrupt_controller(const struct dt_device_match *matches)
> 
>  void __init dt_unflatten_host_device_tree(void)
>  {
> -    __unflatten_device_tree(device_tree_flattened, &dt_host);
> +    unflatten_device_tree(device_tree_flattened, &dt_host);
... you do not check it anyway?

>      dt_alias_scan();
>  }
> 
> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
> index a28937d12a..bde46d7120 100644
> --- a/xen/include/xen/device_tree.h
> +++ b/xen/include/xen/device_tree.h
> @@ -181,6 +181,11 @@ int device_tree_for_each_node(const void *fdt, int node,
>   */
>  void dt_unflatten_host_device_tree(void);
> 
> +/**
> + * unflatten any device tree.
> + */
> +int unflatten_device_tree(const void *fdt, struct dt_device_node **mynodes);
> +
>  /**
>   * IRQ translation callback
>   * TODO: For the moment we assume that we only have ONE
> --
> 2.17.1
> 
> 

~Michal


