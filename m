Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF24F64248E
	for <lists+xen-devel@lfdr.de>; Mon,  5 Dec 2022 09:28:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.453235.710895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p26oq-0004wW-M8; Mon, 05 Dec 2022 08:27:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 453235.710895; Mon, 05 Dec 2022 08:27:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p26oq-0004tw-IS; Mon, 05 Dec 2022 08:27:20 +0000
Received: by outflank-mailman (input) for mailman id 453235;
 Mon, 05 Dec 2022 08:27:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2q+k=4D=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1p26op-0004tq-1T
 for xen-devel@lists.xenproject.org; Mon, 05 Dec 2022 08:27:19 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20618.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a005fa9d-7476-11ed-8fd2-01056ac49cbb;
 Mon, 05 Dec 2022 09:27:17 +0100 (CET)
Received: from CY5PR19CA0114.namprd19.prod.outlook.com (2603:10b6:930:64::7)
 by DM4PR12MB6615.namprd12.prod.outlook.com (2603:10b6:8:8d::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5880.14; Mon, 5 Dec 2022 08:27:13 +0000
Received: from CY4PEPF0000C96B.namprd02.prod.outlook.com
 (2603:10b6:930:64:cafe::17) by CY5PR19CA0114.outlook.office365.com
 (2603:10b6:930:64::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10 via Frontend
 Transport; Mon, 5 Dec 2022 08:27:13 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000C96B.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5880.8 via Frontend Transport; Mon, 5 Dec 2022 08:27:12 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 5 Dec
 2022 02:27:11 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 5 Dec
 2022 02:26:39 -0600
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 5 Dec 2022 02:26:37 -0600
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
X-Inumbo-ID: a005fa9d-7476-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iarFUV2Ez8rlMGcoQdnXlnDlLzAr3hesd67JAv6GQpKuC/dgM8OrD7i6uIG7RvbL9p65UakLuXp1GpCpdf0FV8Uoc0N73XDikYLKBkCsB4CyjBzPOL9OiS+J9b3y2Zn5HnyqHaSMlAD807KN260BwA9DKna53rEgKHXrucBFnu/92sMyzGYC+6LHg6AmeLULOwu+mEP1r7793j6vTBDQnU+7FntA+ndgDRKXHsbS/2gfqI6C7d9YeyX4eyd0uLioUfIsDR7ta4kzSLO0oxIXq4lM6qKWPp80ZBM09cUm73AfFQnXN32Q/a9mr1eNKWCiYFjs83xSoxkSGVLK2X0zZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nLa7MC1/ddGqbPxPkkL5Wfg+tWXdTdlDhCeh5JQzRzQ=;
 b=BHAeNNNvcBW4eXL/ZAdHhJ8SWYq/lot7RKdlSPh3GaDHx9GjkrzYk8oOmHxvJLebqYjDzXvwC9Oai11hmcNLccSCy9YYelRyZRggNQC2tXHXuVSWGcp/X4GGnpiTY3kIyU/BZsoyEpHBovQfzSY8J2Cp8FFrAhjlDia92RpstObRxWLkvv+kM41CFRBMsoxnrNlE17gExIodfMBR2TCSu+1FZcL9l98cTw5HnjfvQbOYriPS+oSGEvpix7zI/YN+9LjiX804iTfipF+4AIvcw2zOe3kTmKtei04J3l4QCQv/ax/P06VVQaMYXbqBWCMg+AM8k9caeBWLtg816J/tPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nLa7MC1/ddGqbPxPkkL5Wfg+tWXdTdlDhCeh5JQzRzQ=;
 b=J99Mqi0XiFUqIWVedo3/lk3zr1VeEre96dSywt4mTy2fM0rUPFBgK/HsIU/iWrvC0eEZRV0S0aGW65nO/45K20pReS0ue5z1FlarIgeM8ZvVDQxIdzZYR/+1PwIUePsd/HPq1zecoMUVRfr4aW+W2JVD1tdQjoieFjkzhTyDHP4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <345d7d3c-e090-356b-1b4e-a9b491a146b5@amd.com>
Date: Mon, 5 Dec 2022 09:26:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH 04/21] xen/arm: vIOMMU: add generic vIOMMU framework
To: Rahul Singh <rahul.singh@arm.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>, "Paul
 Durrant" <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <cover.1669888522.git.rahul.singh@arm.com>
 <505b4566579b65afa0696c3a8772416a4c7cf59f.1669888522.git.rahul.singh@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <505b4566579b65afa0696c3a8772416a4c7cf59f.1669888522.git.rahul.singh@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C96B:EE_|DM4PR12MB6615:EE_
X-MS-Office365-Filtering-Correlation-Id: e01f1aed-0ee1-4c87-b664-08dad69a8284
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	04VrIpev902QnlIbr/xaLjpHOi6S6h59UmtlwfWMbLtC8jLojYBGan5gu3dUn40FIbfExF56OIMOiaUiXnFRJB5H3XzkfNV/mZAevnpqCX99mdzIKh1GxB0/W32E4udnUjS0jr5jqV4WUQUcw6dTRy+ckMAGi/cNWbkEoLp/uyjQSLODrG6DuR4e4aOxvBIoTt3dRJ4BIxr451MZ6ITFly+EZw9LnUlFvCKqwSWtJPpc5B9rDKJFq9udurSeaT0ukNAA540TZSkA9/neqxa32Utvi9swzklxhX49yaMxS0cqMUaoqJUMdeSEeEdrUyFmU2GsCiTP+X5N9iJ/b/z2d19vxiBvWUFGVW8ZvnO+PpiYjJI1oLyzfacdCburYoL9m14JVrQoEv1HNpUB4GEqsir5xwdK3OfUfmcyV5nPb1T7KSf9F2qCVfPcr2vGaIn0vmeUMJcgbfbxQYBcr6QrQ9QddRkFxoDJhYfV6nHSZcyC17M7z8v3YBEkycK5VOjQrjE2pH5Frf1YMycsEhun1mt0usIkWpg9UoKUZfL64hGT75Mj7Ipt69S+Bpv2Ey/ZEThUnc30by5Es4UIXzQS14e2F1SAvbpehwGQEIPNbQbwnIeZlos3jGyUUfQFcm0lcspPShj38JepNLdOODUEW6RHp0txqJfszQoo59A9NbRSNc3h99a3p70+BJ2EJ4Xhw11YcXu8oaWTXvGWI0hWvBDMbXCT/OU65rcQari9jT/Az7VjmffH8/TtEnoEczupEPDP6J8T/3VwACOn1pZGkRbsq6vcJJsoavnG2zleAI4pcACMya5Bs5gsm03YkRyL
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(346002)(396003)(39860400002)(451199015)(36840700001)(40470700004)(46966006)(83380400001)(36860700001)(86362001)(31696002)(81166007)(356005)(82740400003)(44832011)(2906002)(5660300002)(40460700003)(4326008)(41300700001)(8936002)(8676002)(82310400005)(40480700001)(53546011)(26005)(186003)(336012)(47076005)(426003)(16576012)(316002)(54906003)(110136005)(2616005)(70586007)(70206006)(478600001)(31686004)(36756003)(41533002)(21314003)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2022 08:27:12.8295
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e01f1aed-0ee1-4c87-b664-08dad69a8284
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000C96B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6615

Hi Rahul,

On 01/12/2022 17:02, Rahul Singh wrote:
> 
> 
> This patch adds basic framework for vIOMMU.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
>  xen/arch/arm/domain.c                | 17 +++++++
>  xen/arch/arm/domain_build.c          |  3 ++
>  xen/arch/arm/include/asm/viommu.h    | 70 ++++++++++++++++++++++++++++
>  xen/drivers/passthrough/Kconfig      |  6 +++
>  xen/drivers/passthrough/arm/Makefile |  1 +
>  xen/drivers/passthrough/arm/viommu.c | 48 +++++++++++++++++++
>  xen/include/public/arch-arm.h        |  4 ++
>  7 files changed, 149 insertions(+)
>  create mode 100644 xen/arch/arm/include/asm/viommu.h
>  create mode 100644 xen/drivers/passthrough/arm/viommu.c
> 
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 38e22f12af..2a85209736 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -37,6 +37,7 @@
>  #include <asm/tee/tee.h>
>  #include <asm/vfp.h>
>  #include <asm/vgic.h>
> +#include <asm/viommu.h>
>  #include <asm/vtimer.h>
> 
>  #include "vpci.h"
> @@ -691,6 +692,13 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>          return -EINVAL;
>      }
> 
> +    if ( config->arch.viommu_type != XEN_DOMCTL_CONFIG_VIOMMU_NONE )
> +    {
> +        dprintk(XENLOG_INFO,
> +                "vIOMMU type requested not supported by the platform or Xen\n");
Maybe a simpler message like for TEE would be better: "Unsupported vIOMMU type"

> +        return -EINVAL;
> +    }
> +
>      return 0;
>  }
> 
> @@ -783,6 +791,9 @@ int arch_domain_create(struct domain *d,
>      if ( (rc = domain_vpci_init(d)) != 0 )
>          goto fail;
> 
> +    if ( (rc = domain_viommu_init(d, config->arch.viommu_type)) != 0 )
> +        goto fail;
> +
>      return 0;
> 
>  fail:
> @@ -998,6 +1009,7 @@ static int relinquish_memory(struct domain *d, struct page_list_head *list)
>  enum {
>      PROG_pci = 1,
>      PROG_tee,
> +    PROG_viommu,
>      PROG_xen,
>      PROG_page,
>      PROG_mapping,
> @@ -1048,6 +1060,11 @@ int domain_relinquish_resources(struct domain *d)
>          if (ret )
>              return ret;
> 
> +    PROGRESS(viommu):
> +        ret = viommu_relinquish_resources(d);
> +        if (ret )
> +            return ret;
> +
>      PROGRESS(xen):
>          ret = relinquish_memory(d, &d->xenpage_list);
>          if ( ret )
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index bd30d3798c..abbaf37a2e 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -27,6 +27,7 @@
>  #include <asm/setup.h>
>  #include <asm/cpufeature.h>
>  #include <asm/domain_build.h>
> +#include <asm/viommu.h>
>  #include <xen/event.h>
> 
>  #include <xen/irq.h>
> @@ -3858,6 +3859,7 @@ void __init create_domUs(void)
>          struct domain *d;
>          struct xen_domctl_createdomain d_cfg = {
>              .arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE,
> +            .arch.viommu_type = viommu_get_type(),
>              .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
>              /*
>               * The default of 1023 should be sufficient for guests because
> @@ -4052,6 +4054,7 @@ void __init create_dom0(void)
>          printk(XENLOG_WARNING "Maximum number of vGIC IRQs exceeded.\n");
>      dom0_cfg.arch.tee_type = tee_get_type();
>      dom0_cfg.max_vcpus = dom0_max_vcpus();
> +    dom0_cfg.arch.viommu_type = viommu_get_type();
> 
>      if ( iommu_enabled )
>          dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
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
> +     * Should be one of XEN_DOMCTL_CONFIG_VIOMMU_xxx
> +     */
> +    uint16_t viommu_type;
Here the viommu_type is uint16_t ...

> +};
> +
> +int domain_viommu_init(struct domain *d, uint16_t viommu_type);
> +int viommu_relinquish_resources(struct domain *d);
> +uint16_t viommu_get_type(void);
> +
> +#else
> +
> +static inline uint8_t viommu_get_type(void)
Here you are returning uint8_t ...

> +{
> +    return XEN_DOMCTL_CONFIG_VIOMMU_NONE;
> +}
> +
> +static inline int domain_viommu_init(struct domain *d, uint16_t viommu_type)
Here you are taking uint16_t. So it looks like that ...

> +{
> +    if ( likely(viommu_type == XEN_DOMCTL_CONFIG_VIOMMU_NONE) )
> +        return 0;
> +
> +    return -ENODEV;
> +}
> +
> +static inline int viommu_relinquish_resources(struct domain *d)
> +{
> +    return 0;
> +}
> +
> +#endif /* CONFIG_VIRTUAL_IOMMU */
> +
> +#endif /* __ARCH_ARM_VIOMMU_H__ */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/drivers/passthrough/Kconfig b/xen/drivers/passthrough/Kconfig
> index 479d7de57a..19924fa2de 100644
> --- a/xen/drivers/passthrough/Kconfig
> +++ b/xen/drivers/passthrough/Kconfig
> @@ -35,6 +35,12 @@ config IPMMU_VMSA
>           (H3 ES3.0, M3-W+, etc) or Gen4 SoCs which IPMMU hardware supports stage 2
>           translation table format and is able to use CPU's P2M table as is.
> 
> +config VIRTUAL_IOMMU
> +       bool "Virtual IOMMU Support (UNSUPPORTED)" if UNSUPPORTED
> +       default n
> +       help
> +        Support virtual IOMMU infrastructure to implement vIOMMU.
> +
>  endif
> 
>  config IOMMU_FORCE_PT_SHARE
> diff --git a/xen/drivers/passthrough/arm/Makefile b/xen/drivers/passthrough/arm/Makefile
> index c5fb3b58a5..4cc54f3f4d 100644
> --- a/xen/drivers/passthrough/arm/Makefile
> +++ b/xen/drivers/passthrough/arm/Makefile
> @@ -2,3 +2,4 @@ obj-y += iommu.o iommu_helpers.o iommu_fwspec.o
>  obj-$(CONFIG_ARM_SMMU) += smmu.o
>  obj-$(CONFIG_IPMMU_VMSA) += ipmmu-vmsa.o
>  obj-$(CONFIG_ARM_SMMU_V3) += smmu-v3.o
> +obj-$(CONFIG_VIRTUAL_IOMMU) += viommu.o
> diff --git a/xen/drivers/passthrough/arm/viommu.c b/xen/drivers/passthrough/arm/viommu.c
> new file mode 100644
> index 0000000000..7ab6061e34
> --- /dev/null
> +++ b/xen/drivers/passthrough/arm/viommu.c
> @@ -0,0 +1,48 @@
> +/* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
> +
> +#include <xen/errno.h>
> +#include <xen/init.h>
> +#include <xen/types.h>
> +
> +#include <asm/viommu.h>
> +
> +const struct viommu_desc __read_mostly *cur_viommu;
> +
> +int domain_viommu_init(struct domain *d, uint16_t viommu_type)
> +{
> +    if ( viommu_type == XEN_DOMCTL_CONFIG_VIOMMU_NONE )
> +        return 0;
> +
> +    if ( !cur_viommu )
> +        return -ENODEV;
> +
> +    if ( cur_viommu->viommu_type != viommu_type )
> +        return -EINVAL;
> +
> +    return cur_viommu->ops->domain_init(d);
> +}
> +
> +int viommu_relinquish_resources(struct domain *d)
> +{
> +    if ( !cur_viommu )
> +        return 0;
> +
> +    return cur_viommu->ops->relinquish_resources(d);
> +}
> +
> +uint16_t viommu_get_type(void)
> +{
> +    if ( !cur_viommu )
> +        return XEN_DOMCTL_CONFIG_VIOMMU_NONE;
> +
> +    return cur_viommu->viommu_type;
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
> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
> index 1528ced509..33d32835e7 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -297,10 +297,14 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
>  #define XEN_DOMCTL_CONFIG_TEE_NONE      0
>  #define XEN_DOMCTL_CONFIG_TEE_OPTEE     1
> 
> +#define XEN_DOMCTL_CONFIG_VIOMMU_NONE   0
> +
>  struct xen_arch_domainconfig {
>      /* IN/OUT */
>      uint8_t gic_version;
>      /* IN */
> +    uint8_t viommu_type;
this should be uint16_t and not uint8_t 

> +    /* IN */
>      uint16_t tee_type;
>      /* IN */
>      uint32_t nr_spis;
> --
> 2.25.1
> 
> 

~Michal

