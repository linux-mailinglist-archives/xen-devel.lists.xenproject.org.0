Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 406BE78BF0C
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 09:18:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592013.924629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qasyz-0006v6-AF; Tue, 29 Aug 2023 07:17:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592013.924629; Tue, 29 Aug 2023 07:17:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qasyz-0006sX-7V; Tue, 29 Aug 2023 07:17:49 +0000
Received: by outflank-mailman (input) for mailman id 592013;
 Tue, 29 Aug 2023 07:17:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jKbG=EO=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qasyx-0006sR-Rt
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 07:17:47 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f400:7eae::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2604b673-463c-11ee-9b0c-b553b5be7939;
 Tue, 29 Aug 2023 09:17:45 +0200 (CEST)
Received: from CY5PR15CA0039.namprd15.prod.outlook.com (2603:10b6:930:1b::11)
 by MN0PR12MB5763.namprd12.prod.outlook.com (2603:10b6:208:376::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Tue, 29 Aug
 2023 07:17:41 +0000
Received: from CY4PEPF0000E9CE.namprd03.prod.outlook.com
 (2603:10b6:930:1b:cafe::76) by CY5PR15CA0039.outlook.office365.com
 (2603:10b6:930:1b::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.36 via Frontend
 Transport; Tue, 29 Aug 2023 07:17:41 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9CE.mail.protection.outlook.com (10.167.241.141) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.17 via Frontend Transport; Tue, 29 Aug 2023 07:17:40 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 29 Aug
 2023 02:17:39 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Tue, 29 Aug 2023 02:17:38 -0500
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
X-Inumbo-ID: 2604b673-463c-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IH0TTYK1dXr+Z5QIgYmQEgG6LTcvoGYeNVNWzV1770SKd15KJ5Z/0rcme48h4+twFkySaUbaxOzgWTbD5amEr5zZvVxJHTcb1hk1RJEe4hjb2KzvOLD1mZ0CEmqRvV9TnHIAQxXIz0WTmRLCHbR6Cps3whbxDgZeecaxRo5PlQg/Qd5QAmFD9kkP+RaVyiQ3Q1+8b7oQ+fjz9quwS4Yk70NUS956e8RaBqkaTr3Fnxq53zSo8ZcQ03ymAFljiuxqrQS5XlRbcrlpEFlUq5RXGHPifAYiIXkdGYbhYG4Yn+4BuvZOyn8chrkNCA7K42WI9gAwmvSWiVkmLxlBDyfU1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UNenLMt7cnpGmNJGGKmuYR/Mqzbf65+ug7YGgqz6yHw=;
 b=Wiscb1jZ6ocgcc+S13xOo8anUcXL3Co9tnf9Vg7n5x54A7M8iGDmnEyqNCPMeQch62ItotMlyl7xbgZG1IcNmubq0oFkoGux3ToPDBrF3D5TBR2dhZXeGOM4ZK/75IATsVEpRZj4hw+icK9h+AUmXLuBYokM8/sCabHgZlq+qISO3DYSIgSaRQ992wqmG9gQJkYU1Cn3brvqZSHZCiz3Bsc6EzTFmzqsSmzJYtZD8ZT0PiyY5kpXVP0AZ7SXRIkX+WubcekpVlzonpWK21viLeVT9qzfvalSNs8xlRuafhOmJrVX7g3M1/6hdzJ1+XXDniKU14TsxaaUO7IQ1kgjFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UNenLMt7cnpGmNJGGKmuYR/Mqzbf65+ug7YGgqz6yHw=;
 b=LNlL2QKqUOoO5ISUdW/oWgTunUJ0GllcQ5OnWvtvaG+svFnS/V+ko+3E2010G63qj7lmntlzbK8RxGsF0CckAQMbKv58xMi+Lng0VyrnLZv2G0JUALtOmN8fUm762NpigAhuBaEKMAzR4ZEqLgLX9lkIWNTpwPF98wUAcwDoV5g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <64099c1c-42d6-aeb4-6d2f-566dc17580da@amd.com>
Date: Tue, 29 Aug 2023 09:17:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN][PATCH v10 03/20] xen/arm/device: Remove __init from
 function type
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230825080222.14247-1-vikram.garhwal@amd.com>
 <20230825080222.14247-4-vikram.garhwal@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230825080222.14247-4-vikram.garhwal@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CE:EE_|MN0PR12MB5763:EE_
X-MS-Office365-Filtering-Correlation-Id: cd199f72-59a4-4911-fcff-08dba8600830
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	z4TTLRSvK88Ir40eShteulABqxQ8/LDfGh5JSpkAiuFDdEpTMJuvmlUIq9mIpHoH3IsC5VRvXxfs+H4xsaghysrrTCJKJrccLJMIObw5ZxmwzDvMu5aPZoToKCiWGQjuyhgedmNtK0OwQbsESOFRe/U0sBVv90vf7llPAZMdB+KIq/BMMlDX1ELVP710qje9p5clq37Urxb6RKLWLT1StDc9Eg5s5bDkKo4zMpEQXdjAurXzQprq8WDzw4EJDurz5q6l8dhFyuOaLOSGwnXAAnL5lB8OgdduwN/2A5KlSEeOaBtl1zoCMkrW/+BfRMftnV+65JMH7aYZDn73Z2Ph8Z8bVXMepd7ghjfj6r6omxFBL/z48zeTzGBaY0mhEjk8F2rxakEbQYA8G6D8NGlZnr6Qqf5f1LobqV7MFx/inzuBSu/1tneIDdpgwZImtQPIzbktwdMkL033OV1mTT3tT+u9aYFevU4q/6KwJCZsxUnP0R9cL0peEDsULI90ZPyw/782ebfR65rRkdrmBzbrWTc20WK26Xnv4YTOkEcXbzf6959yMqKWcMu15nlCiuYv3DEILfrmKLL05gJBU72tKij4ACN9V+3K+EeptSggGomiXhAsYWZjyPvkzugTgPMUxpVpvgSY6lVQQGycTj+xlSoZjR+SGR3TSe7hy3KzcLVqzTEobYoUqBaOXuQAm/vg7GJhCJJIKSWuNgVeViB6Yn81bVy1fexVDQWI7SCa/fKdEoZy9SyHOrpx886xHtezifQRCyMBjd6ZVethMYvLSNkqE/gzvW9qH+mFnNYXHSmJcWG0hLJVTStvguQOJt18
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(396003)(346002)(39860400002)(451199024)(1800799009)(186009)(82310400011)(36840700001)(40470700004)(46966006)(356005)(81166007)(82740400003)(8936002)(110136005)(53546011)(70206006)(70586007)(31686004)(478600001)(54906003)(16576012)(316002)(41300700001)(40460700003)(36756003)(26005)(44832011)(8676002)(5660300002)(83380400001)(31696002)(2906002)(2616005)(86362001)(47076005)(36860700001)(40480700001)(426003)(336012)(4326008)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 07:17:40.9562
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd199f72-59a4-4911-fcff-08dba8600830
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9CE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5763



On 25/08/2023 10:02, Vikram Garhwal wrote:
> Remove __init from following function to access during runtime:
>     1. map_irq_to_domain()
>     2. handle_device_interrupts()
>     3. map_range_to_domain()
>     4. unflatten_dt_node()
>     5. handle_device()
>     6. map_device_children()
>     7. map_dt_irq_to_domain()
> Move map_irq_to_domain() prototype from domain_build.h to setup.h.
> 
> Above changes will create an error on build as non-init function are still
> in domain_build.c file. So, to avoid build fails, following changes are done:
> 1. Move map_irq_to_domain(), handle_device_interrupts(), map_range_to_domain(),
>     handle_device(), map_device_children() and map_dt_irq_to_domain()
>     to device.c. After removing __init type,  these functions are not specific
>     to domain building, so moving them out of domain_build.c to device.c.
> 2. Remove static type from handle_device_interrupts().
> 
> Overall, these changes are done to support the dynamic programming of a nodes
> where an overlay node will be added to fdt and unflattened node will be added to
> dt_host. Furthermore, IRQ and mmio mapping will be done for the added node.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> 
> ---
> Changes from v9:
>     Move handle_device(), map_device_children() and map_dt_irq_to_domain() out
>         of domain_build.c
> ---
> ---
>  xen/arch/arm/device.c                   | 293 ++++++++++++++++++++++++
>  xen/arch/arm/domain_build.c             | 293 ------------------------
>  xen/arch/arm/include/asm/domain_build.h |   2 -
>  xen/arch/arm/include/asm/setup.h        |   9 +
>  xen/common/device_tree.c                |  12 +-
>  5 files changed, 308 insertions(+), 301 deletions(-)
> 
> diff --git a/xen/arch/arm/device.c b/xen/arch/arm/device.c
> index ca8539dee5..857f171a27 100644
> --- a/xen/arch/arm/device.c
> +++ b/xen/arch/arm/device.c
> @@ -9,8 +9,10 @@
>   */
>  
>  #include <asm/device.h>
> +#include <asm/setup.h>
>  #include <xen/errno.h>
>  #include <xen/init.h>
> +#include <xen/iocap.h>
>  #include <xen/lib.h>
>  
>  extern const struct device_desc _sdevice[], _edevice[];
> @@ -75,6 +77,297 @@ enum device_class device_get_class(const struct dt_device_node *dev)
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
> +        printk(XENLOG_ERR "Unable to permit to %pd access to IRQ %u\n", d, irq);
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
> +            printk(XENLOG_ERR "Unable to map IRQ%u to %pd\n", irq, d);
> +            return res;
> +        }
> +    }
> +
> +    dt_dprintk("  - IRQ: %u\n", irq);
> +    return 0;
> +}
> +
> +int map_range_to_domain(const struct dt_device_node *dev,
> +                        uint64_t addr, uint64_t len, void *data)
> +{
> +    struct map_range_data *mr_data = data;
> +    struct domain *d = mr_data->d;
> +    int res;
> +
> +    if ( (addr != (paddr_t)addr) || (((paddr_t)~0 - addr) < len) )
> +    {
> +        printk(XENLOG_ERR "%s: [0x%"PRIx64", 0x%"PRIx64"] exceeds the maximum allowed PA width (%u bits)",
> +               dt_node_full_name(dev), addr, (addr + len), PADDR_BITS);
> +        return -ERANGE;
> +    }
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
> +                    " 0x%"PRIx64" - 0x%"PRIx64"\n",
> +                    d->domain_id,
> +                    addr & PAGE_MASK, PAGE_ALIGN(addr + len) - 1);
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
This needs to be renamed. AFAIK you agreed on map_device_irqs_to_domain().

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
> +                      i, dt_node_full_name(rirq.controller));
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
> +static int map_dt_irq_to_domain(const struct dt_device_node *dev,
> +                                       const struct dt_irq *dt_irq,
> +                                       void *data)
Parameters are not alligned. Should be:
static int map_dt_irq_to_domain(const struct dt_device_node *dev,
                                const struct dt_irq *dt_irq,
                                void *data)

> +{
> +    struct map_range_data *mr_data = data;
> +    struct domain *d = mr_data->d;
> +    unsigned int irq = dt_irq->irq;
> +    int res;
> +
> +    if ( irq < NR_LOCAL_IRQS )
> +    {
> +        printk(XENLOG_ERR "%s: IRQ%u is not a SPI\n", dt_node_name(dev), irq);
> +        return -EINVAL;
> +    }
> +
> +    /* Setup the IRQ type */
> +    res = irq_set_spi_type(irq, dt_irq->type);
> +    if ( res )
> +    {
> +        printk(XENLOG_ERR "%s: Unable to setup IRQ%u to %pd\n",
> +               dt_node_name(dev), irq, d);
> +        return res;
> +    }
> +
> +    res = map_irq_to_domain(d, irq, !mr_data->skip_mapping, dt_node_name(dev));
> +
> +    return res;
> +}
> +
> +/*
> + * For a node which describes a discoverable bus (such as a PCI bus)
> + * then we may need to perform additional mappings in order to make
> + * the child resources available to domain 0.
> + */
> +static int map_device_children(const struct dt_device_node *dev,
> +                                      struct map_range_data *mr_data)
Parameter is not aligned.

[...]
> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
> index 19dc637d55..1a052ed924 100644
> --- a/xen/arch/arm/include/asm/setup.h
> +++ b/xen/arch/arm/include/asm/setup.h
> @@ -165,9 +165,18 @@ void device_tree_get_reg(const __be32 **cell, uint32_t address_cells,
>  u32 device_tree_get_u32(const void *fdt, int node,
>                          const char *prop_name, u32 dflt);
>  
> +int handle_device(struct domain *d, struct dt_device_node *dev, p2m_type_t p2mt,
> +                  struct rangeset *iomem_ranges, struct rangeset *irq_ranges);
Remove the rangeset parameters. AFAIK you'll introduce it later, so this is a mistake
causing the build to fail.

> +
> +int handle_device_interrupts(struct domain *d, struct dt_device_node *dev,
> +                             bool need_mapping);
Don't forget to rename.


With all the remarks above addressed:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


