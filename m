Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D76C70C118
	for <lists+xen-devel@lfdr.de>; Mon, 22 May 2023 16:29:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537990.837689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q16X3-00005d-HF; Mon, 22 May 2023 14:29:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537990.837689; Mon, 22 May 2023 14:29:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q16X3-0008V7-DN; Mon, 22 May 2023 14:29:05 +0000
Received: by outflank-mailman (input) for mailman id 537990;
 Mon, 22 May 2023 14:29:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qrm0=BL=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1q16X1-0008V1-Ob
 for xen-devel@lists.xenproject.org; Mon, 22 May 2023 14:29:04 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061a.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc215821-f8ac-11ed-8611-37d641c3527e;
 Mon, 22 May 2023 16:28:58 +0200 (CEST)
Received: from BY5PR13CA0032.namprd13.prod.outlook.com (2603:10b6:a03:180::45)
 by PH7PR12MB6934.namprd12.prod.outlook.com (2603:10b6:510:1b8::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Mon, 22 May
 2023 14:28:54 +0000
Received: from CO1PEPF000042AE.namprd03.prod.outlook.com
 (2603:10b6:a03:180:cafe::9a) by BY5PR13CA0032.outlook.office365.com
 (2603:10b6:a03:180::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.14 via Frontend
 Transport; Mon, 22 May 2023 14:28:54 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042AE.mail.protection.outlook.com (10.167.243.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6433.8 via Frontend Transport; Mon, 22 May 2023 14:28:54 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 22 May
 2023 09:28:53 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 22 May
 2023 09:28:53 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 22 May 2023 09:28:51 -0500
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
X-Inumbo-ID: fc215821-f8ac-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LLJAT3fs0qV4+OsP9j6emXi+4MIguYmnEJik5m6j4dWlrvPnNE+HG5FmT6wuwrG9MnzdoUIcJ97KUyoRWi9ccBBQbwwr/2dkml7g5ZuKj1/5m+NYvZCON49kX2cZ3NrdiBghFsawFgUqC/OJb6cZ0DyrX1g+80ocapyGRcGXGgZSgdDrOzp6qhM96KxRsZSX8Lgnl2b4x+mZB5QyTvy08KwMkuYtCK15woUMVcTXSO9bQkVQq0YkK2rNh7Kn7SHHLRX+pg89S9G2w7q3gNvi9+aDAVrHxxs3wyhq9MiN8/TpCnQxdlnsstdVZln2ejdx9ibJeFC400yHay16qsRhrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ej/OZGNmH8Ot5qexgjSvxHobfOGZLm5MQXG+MJ/BM50=;
 b=dRlFroS9VdclGVyWqgwJ7USzDnlMStpagTRYtvLFUvE70aS8uEgG/bIIICHVSe4SuXQrN/31DRytB4PAqNBnbE3b01WuPCgfB8+ue+SLBMv/qAgwn2Kvtl0QkkMMa5ixw0XLDUiA6IkS3+nFmHAWif9L+JkD8KjweSVg13xW6lQ8Qumi2tgDdfRQstT2OTq8bmiNMX2pZDFCygOQtd/KiLOp9fq9knIaWJhYxAVQ5N6uy9EXh8wowfehwFKe8gKeaC6Q1Flk4aSOTFGMfzYngeknY8n7sv9n5UpYorSsgzK/eYsqF4UcFmfMYeJ6R+cCuRip4Wm+7c5Rx7Yf/KzwVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ej/OZGNmH8Ot5qexgjSvxHobfOGZLm5MQXG+MJ/BM50=;
 b=JSflcAy1VdLrXc/Iv53YAkY+nF0YUvqeenQdPiwwZsNoXjXfXFhfkht5EjNP4kRabEdqXEraFAids6+GC/6rZ1g7lr2L5SCKMAw6j6TdZqQSSSldFCZVZW/bIpRr4WTya4NXAwM8Mp8462wPlJNzaNY/K7a7JMUJzxeZ1H4hM0k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <0033f950-eacd-6af5-8256-38f4cbea87e3@amd.com>
Date: Mon, 22 May 2023 16:28:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 1/6] xen/arm: Move is_protected flag to struct device
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Rahul Singh <rahul.singh@arm.com>
References: <20230518210658.66156-1-stewart.hildebrand@amd.com>
 <20230518210658.66156-2-stewart.hildebrand@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230518210658.66156-2-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AE:EE_|PH7PR12MB6934:EE_
X-MS-Office365-Filtering-Correlation-Id: 8aa026cd-5cac-4963-b67b-08db5ad0df0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gAUTyg+mSN4IcFq7uDe4YanV5zNDWGDIRb9SK2ZlVrd+MXegNRAGYWXi7SGCPnfvtGXw3IjGaUmTznFqGwfNwCCYpMGg6tR+g36jwcnI5XpvOjE7O483ZjtuLzleGTOa1vIc0qxjccq4xFxWKzNno2DoHaGZqd3ZY1FdAkTNh//2g/owiuGLBqyr7IooGEEOQlxI4KjXadonvk4VlA1DEByPn5lHs/PWS61bYmVLRvZgCUWS3aLqXoYVorBWW0wc4hCurC7OBnqqXtntJHYyoXokNco0EDe//3G1yPcTcWJxH1zZWocGQ3RKdVjP/x1Fxg1V/IET1r1MR4KbGWKKh5WEyEBVy3YT6fiVGrPlrI3Z1f6L7AJ8cZoFbIBWnOt2WhMkrHh3Kb+JyDI9r288EXQDSka/tr10TQJ33KPhVDF2BzkcLxvMtysSTyl0JrD1jSNcsjOOxTcNgONUGDtZrxDRPcXmLA/UqymBhW087LGVkx1D/4lVne1iE40akuCgIRBjHwHHemBbDntALg1aYymfED1+sXFyhYwvOMD8uuMtlwz0GOcwKUVo8oCJoJtzzUgtWMhQGlPcX9twYYgv+4D2nudGVimQJUNTBu7Ie5hPWGlFfJldeayy7O5qiLNxAKdf5PNQzu0rMV784HWoId+mbq5dAz5rXYJUJwEyuqZh2FiUT0K+LEZjK6YGQlXtlTD5WAGjN1+BdCuxYzLrS4ctpvhTa8MUsTwtXN5/89A9JyV5wmzuGO141f3Zn4mLSpy3Qa8IMIy6kMn5lCpkj6jI0q2YgzrWZ+GtwqFzqXs=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(376002)(396003)(346002)(451199021)(36840700001)(40470700004)(46966006)(31686004)(2906002)(110136005)(16576012)(54906003)(5660300002)(44832011)(36860700001)(82310400005)(47076005)(8676002)(8936002)(40460700003)(41300700001)(316002)(70206006)(70586007)(478600001)(4326008)(36756003)(40480700001)(6666004)(966005)(336012)(53546011)(81166007)(31696002)(86362001)(2616005)(26005)(186003)(83380400001)(82740400003)(356005)(426003)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2023 14:28:54.3566
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aa026cd-5cac-4963-b67b-08db5ad0df0d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6934

Hi Stewart,

On 18/05/2023 23:06, Stewart Hildebrand wrote:
> 
> 
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> This flag will be re-used for PCI devices by the subsequent
> patches.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> ---
> v2->v3:
> * no change
> 
> v1->v2:
> * no change
> 
> downstream->v1:
> * rebase
> * s/dev_node->is_protected/dev_node->dev.is_protected/ in smmu.c
> * s/dt_device_set_protected(dev_to_dt(dev))/device_set_protected(dev)/ in smmu-v3.c
> * remove redundant device_is_protected checks in smmu-v3.c/ipmmu-vmsa.c
> 
> (cherry picked from commit 59753aac77528a584d3950936b853ebf264b68e7 from
>  the downstream branch poc/pci-passthrough from
>  https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc.git)
> ---
>  xen/arch/arm/domain_build.c              |  4 ++--
>  xen/arch/arm/include/asm/device.h        | 13 +++++++++++++
>  xen/common/device_tree.c                 |  2 +-
>  xen/drivers/passthrough/arm/ipmmu-vmsa.c |  8 +-------
>  xen/drivers/passthrough/arm/smmu-v3.c    |  7 +------
>  xen/drivers/passthrough/arm/smmu.c       |  2 +-
>  xen/drivers/passthrough/device_tree.c    | 15 +++++++++------
>  xen/include/xen/device_tree.h            | 13 -------------
>  8 files changed, 28 insertions(+), 36 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 71f307a572e9..d228da641367 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2503,7 +2503,7 @@ static int __init handle_device(struct domain *d, struct dt_device_node *dev,
>              return res;
>          }
> 
> -        if ( dt_device_is_protected(dev) )
> +        if ( device_is_protected(dt_to_dev(dev)) )
>          {
>              dt_dprintk("%s setup iommu\n", dt_node_full_name(dev));
>              res = iommu_assign_dt_device(d, dev);
> @@ -3003,7 +3003,7 @@ static int __init handle_passthrough_prop(struct kernel_info *kinfo,
>          return res;
> 
>      /* If xen_force, we allow assignment of devices without IOMMU protection. */
> -    if ( xen_force && !dt_device_is_protected(node) )
> +    if ( xen_force && !device_is_protected(dt_to_dev(node)) )
>          return 0;
> 
>      return iommu_assign_dt_device(kinfo->d, node);
> diff --git a/xen/arch/arm/include/asm/device.h b/xen/arch/arm/include/asm/device.h
> index b5d451e08776..086dde13eb6b 100644
> --- a/xen/arch/arm/include/asm/device.h
> +++ b/xen/arch/arm/include/asm/device.h
> @@ -1,6 +1,8 @@
>  #ifndef __ASM_ARM_DEVICE_H
>  #define __ASM_ARM_DEVICE_H
> 
> +#include <xen/types.h>
> +
>  enum device_type
>  {
>      DEV_DT,
> @@ -20,6 +22,7 @@ struct device
>  #endif
>      struct dev_archdata archdata;
>      struct iommu_fwspec *iommu_fwspec; /* per-device IOMMU instance data */
> +    bool is_protected; /* Shows that device is protected by IOMMU */
This will add 7 bytes of padding on arm64. Did you check if there is a hole you can reuse?

>  };
> 
>  typedef struct device device_t;
> @@ -94,6 +97,16 @@ int device_init(struct dt_device_node *dev, enum device_class class,
>   */
>  enum device_class device_get_class(const struct dt_device_node *dev);
> 
> +static inline void device_set_protected(struct device *device)
> +{
> +    device->is_protected = true;
> +}
> +
> +static inline bool device_is_protected(const struct device *device)
> +{
> +    return device->is_protected;
> +}
> +
>  #define DT_DEVICE_START(_name, _namestr, _class)                    \
>  static const struct device_desc __dev_desc_##_name __used           \
>  __section(".dev.info") = {                                          \
> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
> index 6c9712ab7bda..1d5d7cb5f01b 100644
> --- a/xen/common/device_tree.c
> +++ b/xen/common/device_tree.c
> @@ -1874,7 +1874,7 @@ static unsigned long __init unflatten_dt_node(const void *fdt,
>          /* By default dom0 owns the device */
>          np->used_by = 0;
>          /* By default the device is not protected */
> -        np->is_protected = false;
> +        np->dev.is_protected = false;
>          INIT_LIST_HEAD(&np->domain_list);
> 
>          if ( new_format )
> diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> index 091f09b21752..039212a3a990 100644
> --- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> +++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> @@ -1288,14 +1288,8 @@ static int ipmmu_add_device(u8 devfn, struct device *dev)
>      if ( !to_ipmmu(dev) )
>          return -ENODEV;
> 
> -    if ( dt_device_is_protected(dev_to_dt(dev)) )
> -    {
> -        dev_err(dev, "Already added to IPMMU\n");
> -        return -EEXIST;
> -    }
This removal and in smmuv3 needs to be explained in the commit msg.

> -
>      /* Let Xen know that the master device is protected by an IOMMU. */
> -    dt_device_set_protected(dev_to_dt(dev));
> +    device_set_protected(dev);
> 
>      dev_info(dev, "Added master device (IPMMU %s micro-TLBs %u)\n",
>               dev_name(fwspec->iommu_dev), fwspec->num_ids);
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
> index 4ca55d400a7b..f5910e79922f 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -1521,13 +1521,8 @@ static int arm_smmu_add_device(u8 devfn, struct device *dev)
>          */
>         arm_smmu_enable_pasid(master);
> 
> -       if (dt_device_is_protected(dev_to_dt(dev))) {
> -               dev_err(dev, "Already added to SMMUv3\n");
> -               return -EEXIST;
> -       }
> -
>         /* Let Xen know that the master device is protected by an IOMMU. */
> -       dt_device_set_protected(dev_to_dt(dev));
> +       device_set_protected(dev);
> 
>         dev_info(dev, "Added master device (SMMUv3 %s StreamIds %u)\n",
>                         dev_name(fwspec->iommu_dev), fwspec->num_ids);
> diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
> index 0a514821b336..5b6024d579a8 100644
> --- a/xen/drivers/passthrough/arm/smmu.c
> +++ b/xen/drivers/passthrough/arm/smmu.c
> @@ -838,7 +838,7 @@ static int arm_smmu_dt_add_device_legacy(struct arm_smmu_device *smmu,
>         master->of_node = dev_node;
> 
>         /* Xen: Let Xen know that the device is protected by an SMMU */
> -       dt_device_set_protected(dev_node);
> +       device_set_protected(dev);
> 
>         for (i = 0; i < fwspec->num_ids; ++i) {
>                 if (!(smmu->features & ARM_SMMU_FEAT_STREAM_MATCH) &&
> diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
> index 1c32d7b50cce..b5bd13393b56 100644
> --- a/xen/drivers/passthrough/device_tree.c
> +++ b/xen/drivers/passthrough/device_tree.c
> @@ -34,7 +34,7 @@ int iommu_assign_dt_device(struct domain *d, struct dt_device_node *dev)
>      if ( !is_iommu_enabled(d) )
>          return -EINVAL;
> 
> -    if ( !dt_device_is_protected(dev) )
> +    if ( !device_is_protected(dt_to_dev(dev)) )
>          return -EINVAL;
> 
>      spin_lock(&dtdevs_lock);
> @@ -65,7 +65,7 @@ int iommu_deassign_dt_device(struct domain *d, struct dt_device_node *dev)
>      if ( !is_iommu_enabled(d) )
>          return -EINVAL;
> 
> -    if ( !dt_device_is_protected(dev) )
> +    if ( !device_is_protected(dt_to_dev(dev)) )
>          return -EINVAL;
> 
>      spin_lock(&dtdevs_lock);
> @@ -87,7 +87,7 @@ static bool_t iommu_dt_device_is_assigned(const struct dt_device_node *dev)
>  {
>      bool_t assigned = 0;
> 
> -    if ( !dt_device_is_protected(dev) )
> +    if ( !device_is_protected(dt_to_dev(dev)) )
>          return 0;
> 
>      spin_lock(&dtdevs_lock);
> @@ -141,12 +141,15 @@ int iommu_add_dt_device(struct dt_device_node *np)
>          return -EINVAL;
> 
>      /*
> -     * The device may already have been registered. As there is no harm in
> -     * it just return success early.
> +     * This is needed in case a device has both the iommus property and
> +     * also appears in the mmu-masters list.
>       */
> -    if ( dev_iommu_fwspec_get(dev) )
> +    if ( device_is_protected(dev) )
>          return 0;
> 
> +    if ( dev_iommu_fwspec_get(dev) )
> +        return -EEXIST;
This needs to be explained, because before this change, we were returning 0.

> +
>      /*
>       * According to the Documentation/devicetree/bindings/iommu/iommu.txt
>       * from Linux.
> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
> index 19a74909cece..c1e4751a581f 100644
> --- a/xen/include/xen/device_tree.h
> +++ b/xen/include/xen/device_tree.h
> @@ -90,9 +90,6 @@ struct dt_device_node {
>      struct dt_device_node *next; /* TODO: Remove it. Only use to know the last children */
>      struct dt_device_node *allnext;
> 
> -    /* IOMMU specific fields */
> -    bool is_protected;
> -
>      /* HACK: Remove this if there is a need of space */
>      bool_t static_evtchn_created;
Not your fault (and I don't know if you should do anything about it) but this single field now causes
the whole structure to be 8 bytes larger than it could be on arm64.

~Michal

