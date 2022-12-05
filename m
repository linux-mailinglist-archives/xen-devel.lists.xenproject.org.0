Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 490986424AC
	for <lists+xen-devel@lfdr.de>; Mon,  5 Dec 2022 09:34:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.453242.710906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p26vH-0006sT-C3; Mon, 05 Dec 2022 08:33:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 453242.710906; Mon, 05 Dec 2022 08:33:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p26vH-0006ps-8V; Mon, 05 Dec 2022 08:33:59 +0000
Received: by outflank-mailman (input) for mailman id 453242;
 Mon, 05 Dec 2022 08:33:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2q+k=4D=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1p26vF-0006pm-8J
 for xen-devel@lists.xenproject.org; Mon, 05 Dec 2022 08:33:57 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062d.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d584ffa-7477-11ed-91b6-6bf2151ebd3b;
 Mon, 05 Dec 2022 09:33:55 +0100 (CET)
Received: from DS7PR03CA0261.namprd03.prod.outlook.com (2603:10b6:5:3b3::26)
 by CY5PR12MB6105.namprd12.prod.outlook.com (2603:10b6:930:2a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.13; Mon, 5 Dec
 2022 08:33:51 +0000
Received: from DS1PEPF0000E646.namprd02.prod.outlook.com
 (2603:10b6:5:3b3:cafe::48) by DS7PR03CA0261.outlook.office365.com
 (2603:10b6:5:3b3::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14 via Frontend
 Transport; Mon, 5 Dec 2022 08:33:51 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF0000E646.mail.protection.outlook.com (10.167.18.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5880.8 via Frontend Transport; Mon, 5 Dec 2022 08:33:51 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 5 Dec
 2022 02:33:50 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 5 Dec
 2022 00:33:50 -0800
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 5 Dec 2022 02:33:48 -0600
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
X-Inumbo-ID: 8d584ffa-7477-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G8ocH2z5+2VUT7Rbkyeo4G8EhS97h7CIkCzjA4gypGX0iQw2COtOjhS7+k3ic5wIYqvbXg8yb8/jrll8NvX0MCMr2RkmRgwMqLIQV9CJl/8wyQlehNJ2L7dKlwFyyJxkbgAMhQcnQoO8uUA5k/hmjCVqtqJJ1TvHKBcThoXVXHo4pFN8LD1gfIn9dCdSozWFqzP+d2f/1dgr6upgDUs75HUlvHFUhOScW+hOKHYhq5UseObWJS6JUIu2GwxHNG7704r1/jX4AedSeOEYzCbH1zmKaRo6IuHg8GIe6hPLX2vFyKT5YX1ZxQpW/FfJnVx8AqXv+VR+PabqaimgL3Jx+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UfnKvgmSXh7uogqoOgpmz8V+dyTYMKsbUoFYAOyUNSs=;
 b=WsvgbKp3OPYNUXum4MqZKT1MuY40rUhMv1k+4lppPf+wzrQkr/HCZ5bMGiq23M5ZPGfROkfEQSqY2KaUStGt4JEjOPMeq2BJIUDGLgXHf7DQBlsy+xc1I8HHIVN3w48NpiMmya2+he14oe/HSm5r9wssI0su8dgpMk8wSx+U9iunbjHQV1VXj7YSrofBXBOGoDmgDTVTEBcO3+1njHmbSne5XcaypNNIEnjOji8cqJWy6hOEM7/osX4WhPtJFn2ZXhsUMBdmAYj4pVKqUT2hW6VjfAIfHvynNx+vAndJcMmC0m3tiJc5Fq1P7qk+Y/Acnz4JpJaT3IWFocLncfzmUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UfnKvgmSXh7uogqoOgpmz8V+dyTYMKsbUoFYAOyUNSs=;
 b=QYGKRSYGJS2pel26Zl9h93ficK/O6UxWgmUq5olw+0jFMiVCGLshf9QPAgM0D2l3EI4NA9WJXCi1lvlrsYv8Gsg3LofORBZNbV7qejPDYJWXZ/2HkNWZRGhvFhcWe1z2YTc2kDvWRsgmP/lHwqsqH9BI9Vsx+panQiCBmLUmfbc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <b4cd1b34-3aa4-1f8c-b6f1-2ce4214fe2ed@amd.com>
Date: Mon, 5 Dec 2022 09:33:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH 05/21] xen/arm: vsmmuv3: Add dummy support for virtual
 SMMUv3 for guests
Content-Language: en-US
To: Rahul Singh <rahul.singh@arm.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>, "Paul
 Durrant" <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <cover.1669888522.git.rahul.singh@arm.com>
 <6d25bcb543190d78c26db15a0f07e9af79349884.1669888522.git.rahul.singh@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <6d25bcb543190d78c26db15a0f07e9af79349884.1669888522.git.rahul.singh@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E646:EE_|CY5PR12MB6105:EE_
X-MS-Office365-Filtering-Correlation-Id: e97bc1a5-d7cf-4157-ef92-08dad69b7008
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Aee5ndfnm3uK+V7unvnBRsrfLAPCsOaxBgvOaQBjaxHHRHDFIgTa8u5iHEqPad26pzWIrBSK+mCyh5uJ1A6XJLNUjjj5b5u1crWRXznWI97oH4fxAsTOIebEWaGxDW5vIQoKJbfrhRzJJozsGwnKyl1HMtbUiMNIqgjhsblRB/xnGZrJKCuAsO8y6znwZVoD03pqrjM4mh5QHRPxre+8ihQnXcOFIOPnJwbiP7+FrCSIDyL1ET0COz2G6Cye4Inb3hMCOISskt7sIdK4oKz88SAYCicn70uyZl4biZlHWUcz9oYHHuZ0S5DKxixH8pSP88iLpqG0yMybU32wHhOMX4XMNZSX5dPwVZeWDzYu8kRtYniCZqvXFIZq1Q670yiDd+HI4BJAyZQ1hYwPNKJ0t2NMmF9dBXGbucPIpA7/C+xNaLPlLCvTct+qPL4RgjsCBDb0iYy/5HW4heNjdAifMXGG0hUiqwHTbEokke5TxUsmcHKsFXwVdponHZbGlfn92tupnunapV7T3mjWwOstn6l85lDNhESKAvogD+XTfTK/cILkf6FAXW/FY3wPqhR4Zusqw5pPgqZ/juwDzj5bS64iCvJRDWMRsTAFi7iG/xJ+MxGvFN4/ez7IfxyMzzLdrfu8jK7RAwhOP+whdWyG9eZhJGM0InAJb5xBT/maUuM8kxw8Yb0JU9QAnoKiNRD+kZo0XuW1hfo+LwKmr3lQMV213yR7x0N4jEUsnUogFqVfrxjYP13lwti9jtujVNDRiM8wQP2GSEnnAruOm9oRnw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(136003)(39860400002)(396003)(451199015)(36840700001)(40470700004)(46966006)(336012)(186003)(31686004)(316002)(16576012)(54906003)(110136005)(478600001)(40480700001)(81166007)(82740400003)(356005)(36756003)(40460700003)(86362001)(31696002)(83380400001)(47076005)(53546011)(426003)(82310400005)(26005)(30864003)(5660300002)(2616005)(44832011)(2906002)(4326008)(41300700001)(36860700001)(70206006)(70586007)(8676002)(8936002)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2022 08:33:51.3317
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e97bc1a5-d7cf-4157-ef92-08dad69b7008
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0000E646.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6105

Hi Rahul,

On 01/12/2022 17:02, Rahul Singh wrote:
> 
> 
> domain_viommu_init() will be called during domain creation and will add
> the dummy trap handler for virtual IOMMUs for guests.
> 
> A host IOMMU list will be created when host IOMMU devices are probed
> and this list will be used to create the IOMMU device tree node for
> dom0. For dom0, 1-1 mapping will be established between vIOMMU in dom0
> and physical IOMMU.
> 
> For domUs, the 1-N mapping will be established between domU and physical
> IOMMUs. A new area has been reserved in the arm guest physical map at
> which the emulated vIOMMU node is created in the device tree.
> 
> Also set the vIOMMU type to vSMMUv3 to enable vIOMMU framework to call
> vSMMUv3 domain creation/destroy functions.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
>  xen/arch/arm/domain.c                  |   3 +-
>  xen/arch/arm/include/asm/domain.h      |   4 +
>  xen/arch/arm/include/asm/viommu.h      |  20 ++++
>  xen/drivers/passthrough/Kconfig        |   8 ++
>  xen/drivers/passthrough/arm/Makefile   |   1 +
>  xen/drivers/passthrough/arm/smmu-v3.c  |   7 ++
>  xen/drivers/passthrough/arm/viommu.c   |  30 ++++++
>  xen/drivers/passthrough/arm/vsmmu-v3.c | 124 +++++++++++++++++++++++++
>  xen/drivers/passthrough/arm/vsmmu-v3.h |  20 ++++
>  xen/include/public/arch-arm.h          |   7 +-
>  10 files changed, 222 insertions(+), 2 deletions(-)
>  create mode 100644 xen/drivers/passthrough/arm/vsmmu-v3.c
>  create mode 100644 xen/drivers/passthrough/arm/vsmmu-v3.h
> 
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 2a85209736..9a2b613500 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -692,7 +692,8 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>          return -EINVAL;
>      }
> 
> -    if ( config->arch.viommu_type != XEN_DOMCTL_CONFIG_VIOMMU_NONE )
> +    if ( config->arch.viommu_type != XEN_DOMCTL_CONFIG_VIOMMU_NONE &&
> +         config->arch.viommu_type != viommu_get_type() )
>      {
>          dprintk(XENLOG_INFO,
>                  "vIOMMU type requested not supported by the platform or Xen\n");
> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
> index 2ce6764322..8eb4eb5fd6 100644
> --- a/xen/arch/arm/include/asm/domain.h
> +++ b/xen/arch/arm/include/asm/domain.h
> @@ -114,6 +114,10 @@ struct arch_domain
>      void *tee;
>  #endif
> 
> +#ifdef CONFIG_VIRTUAL_IOMMU
> +    struct list_head viommu_list;     /* List of virtual IOMMUs */
> +#endif
> +
>  }  __cacheline_aligned;
> 
>  struct arch_vcpu
> diff --git a/xen/arch/arm/include/asm/viommu.h b/xen/arch/arm/include/asm/viommu.h
> index 7cd3818a12..4785877e2a 100644
> --- a/xen/arch/arm/include/asm/viommu.h
> +++ b/xen/arch/arm/include/asm/viommu.h
> @@ -5,9 +5,21 @@
>  #ifdef CONFIG_VIRTUAL_IOMMU
> 
>  #include <xen/lib.h>
> +#include <xen/list.h>
>  #include <xen/types.h>
>  #include <public/xen.h>
> 
> +extern struct list_head host_iommu_list;
> +
> +/* data structure for each hardware IOMMU */
> +struct host_iommu {
> +    struct list_head entry;
> +    const struct dt_device_node *dt_node;
> +    paddr_t addr;
> +    paddr_t size;
> +    uint32_t irq;
You want this to be int and not unsigned. The reason is ...

> +};
> +
>  struct viommu_ops {
>      /*
>       * Called during domain construction if toolstack requests to enable
> @@ -35,6 +47,8 @@ struct viommu_desc {
>  int domain_viommu_init(struct domain *d, uint16_t viommu_type);
>  int viommu_relinquish_resources(struct domain *d);
>  uint16_t viommu_get_type(void);
> +void add_to_host_iommu_list(paddr_t addr, paddr_t size,
> +                            const struct dt_device_node *node);
> 
>  #else
> 
> @@ -56,6 +70,12 @@ static inline int viommu_relinquish_resources(struct domain *d)
>      return 0;
>  }
> 
> +static inline void add_to_host_iommu_list(paddr_t addr, paddr_t size,
> +                                          const struct dt_device_node *node)
> +{
> +    return;
> +}
> +
>  #endif /* CONFIG_VIRTUAL_IOMMU */
> 
>  #endif /* __ARCH_ARM_VIOMMU_H__ */
> diff --git a/xen/drivers/passthrough/Kconfig b/xen/drivers/passthrough/Kconfig
> index 19924fa2de..4c725f5f67 100644
> --- a/xen/drivers/passthrough/Kconfig
> +++ b/xen/drivers/passthrough/Kconfig
> @@ -41,6 +41,14 @@ config VIRTUAL_IOMMU
>         help
>          Support virtual IOMMU infrastructure to implement vIOMMU.
> 
> +config VIRTUAL_ARM_SMMU_V3
> +       bool "ARM Ltd. Virtual SMMUv3 Support (UNSUPPORTED)" if UNSUPPORTED
> +       depends on ARM_SMMU_V3 && VIRTUAL_IOMMU
> +       help
> +        Support for implementations of the virtual ARM System MMU architecture
> +        version 3. Virtual SMMUv3 is unsupported feature and should not be used
> +        in production.
> +
>  endif
> 
>  config IOMMU_FORCE_PT_SHARE
> diff --git a/xen/drivers/passthrough/arm/Makefile b/xen/drivers/passthrough/arm/Makefile
> index 4cc54f3f4d..e758a9d6aa 100644
> --- a/xen/drivers/passthrough/arm/Makefile
> +++ b/xen/drivers/passthrough/arm/Makefile
> @@ -3,3 +3,4 @@ obj-$(CONFIG_ARM_SMMU) += smmu.o
>  obj-$(CONFIG_IPMMU_VMSA) += ipmmu-vmsa.o
>  obj-$(CONFIG_ARM_SMMU_V3) += smmu-v3.o
>  obj-$(CONFIG_VIRTUAL_IOMMU) += viommu.o
> +obj-$(CONFIG_VIRTUAL_ARM_SMMU_V3) += vsmmu-v3.o
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
> index 9174d2dedd..4f96fdb92f 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -91,6 +91,7 @@
>  #include <asm/platform.h>
> 
>  #include "smmu-v3.h"
> +#include "vsmmu-v3.h"
> 
>  #define ARM_SMMU_VTCR_SH_IS            3
>  #define ARM_SMMU_VTCR_RGN_WBWA         1
> @@ -2680,6 +2681,9 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>         list_add(&smmu->devices, &arm_smmu_devices);
>         spin_unlock(&arm_smmu_devices_lock);
> 
> +    /* Add to host IOMMU list to initialize vIOMMU for dom0 */
> +       add_to_host_iommu_list(ioaddr, iosize, dev_to_dt(pdev));
> +
>         return 0;
> 
> 
> @@ -2936,6 +2940,9 @@ static __init int arm_smmu_dt_init(struct dt_device_node *dev,
> 
>         iommu_set_ops(&arm_smmu_iommu_ops);
> 
> +       /* Set vIOMMU type to SMMUv3 */
> +       vsmmuv3_set_type();
> +
>         return 0;
>  }
> 
> diff --git a/xen/drivers/passthrough/arm/viommu.c b/xen/drivers/passthrough/arm/viommu.c
> index 7ab6061e34..53ae46349a 100644
> --- a/xen/drivers/passthrough/arm/viommu.c
> +++ b/xen/drivers/passthrough/arm/viommu.c
> @@ -2,12 +2,42 @@
> 
>  #include <xen/errno.h>
>  #include <xen/init.h>
> +#include <xen/irq.h>
>  #include <xen/types.h>
> 
>  #include <asm/viommu.h>
> 
> +/* List of all host IOMMUs */
> +LIST_HEAD(host_iommu_list);
> +
>  const struct viommu_desc __read_mostly *cur_viommu;
> 
> +/* Common function for adding to host_iommu_list */
> +void add_to_host_iommu_list(paddr_t addr, paddr_t size,
> +                            const struct dt_device_node *node)
> +{
> +    struct host_iommu *iommu_data;
> +
> +    iommu_data = xzalloc(struct host_iommu);
> +    if ( !iommu_data )
> +        panic("vIOMMU: Cannot allocate memory for host IOMMU data\n");
> +
> +    iommu_data->addr = addr;
> +    iommu_data->size = size;
> +    iommu_data->dt_node = node;
> +    iommu_data->irq = platform_get_irq(node, 0);
you are assigning platform_get_irq to it which can return a negative number in case of failure.
In your current implementation, the following check does not make sense as unsigned can never be negative.

> +    if ( iommu_data->irq < 0 )
> +    {
> +        gdprintk(XENLOG_ERR,
> +                 "vIOMMU: Cannot find a valid IOMMU irq\n");
> +        return;
> +    }
> +
> +    printk("vIOMMU: Found IOMMU @0x%"PRIx64"\n", addr);
> +
> +    list_add_tail(&iommu_data->entry, &host_iommu_list);
> +}
> +
>  int domain_viommu_init(struct domain *d, uint16_t viommu_type)
>  {
>      if ( viommu_type == XEN_DOMCTL_CONFIG_VIOMMU_NONE )
> diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/passthrough/arm/vsmmu-v3.c
> new file mode 100644
> index 0000000000..6b4009e5ef
> --- /dev/null
> +++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
> @@ -0,0 +1,124 @@
> +/* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
> +
> +#include <xen/param.h>
> +#include <xen/sched.h>
> +#include <asm/mmio.h>
> +#include <asm/viommu.h>
> +
> +/* Struct to hold the vIOMMU ops and vIOMMU type */
> +extern const struct viommu_desc __read_mostly *cur_viommu;
> +
> +struct virt_smmu {
> +    struct      domain *d;
> +    struct      list_head viommu_list;
> +};
> +
> +static int vsmmuv3_mmio_write(struct vcpu *v, mmio_info_t *info,
> +                              register_t r, void *priv)
> +{
> +    return IO_HANDLED;
> +}
> +
> +static int vsmmuv3_mmio_read(struct vcpu *v, mmio_info_t *info,
> +                             register_t *r, void *priv)
> +{
> +    return IO_HANDLED;
> +}
> +
> +static const struct mmio_handler_ops vsmmuv3_mmio_handler = {
> +    .read  = vsmmuv3_mmio_read,
> +    .write = vsmmuv3_mmio_write,
> +};
> +
> +static int vsmmuv3_init_single(struct domain *d, paddr_t addr, paddr_t size)
> +{
> +    struct virt_smmu *smmu;
> +
> +    smmu = xzalloc(struct virt_smmu);
> +    if ( !smmu )
> +        return -ENOMEM;
> +
> +    smmu->d = d;
> +
> +    register_mmio_handler(d, &vsmmuv3_mmio_handler, addr, size, smmu);
> +
> +    /* Register the vIOMMU to be able to clean it up later. */
> +    list_add_tail(&smmu->viommu_list, &d->arch.viommu_list);
> +
> +    return 0;
> +}
> +
> +int domain_vsmmuv3_init(struct domain *d)
> +{
> +    int ret;
> +    INIT_LIST_HEAD(&d->arch.viommu_list);
> +
> +    if ( is_hardware_domain(d) )
> +    {
> +        struct host_iommu *hw_iommu;
> +
> +        list_for_each_entry(hw_iommu, &host_iommu_list, entry)
> +        {
> +            ret = vsmmuv3_init_single(d, hw_iommu->addr, hw_iommu->size);
> +            if ( ret )
> +                return ret;
> +        }
> +    }
> +    else
> +    {
> +        ret = vsmmuv3_init_single(d, GUEST_VSMMUV3_BASE, GUEST_VSMMUV3_SIZE);
> +        if ( ret )
> +            return ret;
> +    }
> +
> +    return 0;
> +}
> +
> +int vsmmuv3_relinquish_resources(struct domain *d)
> +{
> +    struct virt_smmu *pos, *temp;
> +
> +    /* Cope with unitialized vIOMMU */
> +    if ( list_head_is_null(&d->arch.viommu_list) )
> +        return 0;
> +
> +    list_for_each_entry_safe(pos, temp, &d->arch.viommu_list, viommu_list )
> +    {
> +        list_del(&pos->viommu_list);
> +        xfree(pos);
> +    }
> +
> +    return 0;
> +}
> +
> +static const struct viommu_ops vsmmuv3_ops = {
> +    .domain_init = domain_vsmmuv3_init,
> +    .relinquish_resources = vsmmuv3_relinquish_resources,
> +};
> +
> +static const struct viommu_desc vsmmuv3_desc = {
> +    .ops = &vsmmuv3_ops,
> +    .viommu_type = XEN_DOMCTL_CONFIG_VIOMMU_SMMUV3,
> +};
> +
> +void __init vsmmuv3_set_type(void)
> +{
> +    const struct viommu_desc *desc = &vsmmuv3_desc;
> +
> +    if ( cur_viommu && (cur_viommu != desc) )
> +    {
> +        printk("WARNING: Cannot set vIOMMU, already set to a different value\n");
> +        return;
> +    }
> +
> +    cur_viommu = desc;
> +}
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.h b/xen/drivers/passthrough/arm/vsmmu-v3.h
> new file mode 100644
> index 0000000000..e11f85b431
> --- /dev/null
> +++ b/xen/drivers/passthrough/arm/vsmmu-v3.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
> +#ifndef __ARCH_ARM_VSMMU_V3_H__
> +#define __ARCH_ARM_VSMMU_V3_H__
> +
> +#include <asm/viommu.h>
> +
> +#ifdef CONFIG_VIRTUAL_ARM_SMMU_V3
> +
> +void vsmmuv3_set_type(void);
> +
> +#else
> +
> +static inline void vsmmuv3_set_type(void)
> +{
> +    return;
> +}
> +
> +#endif /* CONFIG_VIRTUAL_ARM_SMMU_V3 */
> +
> +#endif /* __ARCH_ARM_VSMMU_V3_H__ */
> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
> index 33d32835e7..24b52fa017 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -297,7 +297,8 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
>  #define XEN_DOMCTL_CONFIG_TEE_NONE      0
>  #define XEN_DOMCTL_CONFIG_TEE_OPTEE     1
> 
> -#define XEN_DOMCTL_CONFIG_VIOMMU_NONE   0
> +#define XEN_DOMCTL_CONFIG_VIOMMU_NONE       0
> +#define XEN_DOMCTL_CONFIG_VIOMMU_SMMUV3     1
> 
>  struct xen_arch_domainconfig {
>      /* IN/OUT */
> @@ -418,6 +419,10 @@ typedef uint64_t xen_callback_t;
>  #define GUEST_GICV3_GICR0_BASE     xen_mk_ullong(0x03020000) /* vCPU0..127 */
>  #define GUEST_GICV3_GICR0_SIZE     xen_mk_ullong(0x01000000)
> 
> +/* vsmmuv3 ITS mappings */
> +#define GUEST_VSMMUV3_BASE     xen_mk_ullong(0x04040000)
> +#define GUEST_VSMMUV3_SIZE     xen_mk_ullong(0x00040000)
> +
>  /*
>   * 256 MB is reserved for VPCI configuration space based on calculation
>   * 256 buses x 32 devices x 8 functions x 4 KB = 256 MB
> --
> 2.25.1
> 
> 

~Michal


