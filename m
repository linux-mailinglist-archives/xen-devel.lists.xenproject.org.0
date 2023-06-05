Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC002722DD8
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jun 2023 19:47:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543836.849145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6EHw-0008LL-Ae; Mon, 05 Jun 2023 17:46:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543836.849145; Mon, 05 Jun 2023 17:46:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6EHw-0008I5-7d; Mon, 05 Jun 2023 17:46:40 +0000
Received: by outflank-mailman (input) for mailman id 543836;
 Mon, 05 Jun 2023 17:46:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8u0v=BZ=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1q6EHu-0008Hz-UI
 for xen-devel@lists.xenproject.org; Mon, 05 Jun 2023 17:46:39 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20622.outbound.protection.outlook.com
 [2a01:111:f400:7eab::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e93628ba-03c8-11ee-8611-37d641c3527e;
 Mon, 05 Jun 2023 19:46:35 +0200 (CEST)
Received: from BN9PR03CA0157.namprd03.prod.outlook.com (2603:10b6:408:f4::12)
 by SJ2PR12MB7962.namprd12.prod.outlook.com (2603:10b6:a03:4c2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Mon, 5 Jun
 2023 17:46:30 +0000
Received: from BN8NAM11FT070.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f4:cafe::e6) by BN9PR03CA0157.outlook.office365.com
 (2603:10b6:408:f4::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33 via Frontend
 Transport; Mon, 5 Jun 2023 17:46:28 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT070.mail.protection.outlook.com (10.13.177.50) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.33 via Frontend Transport; Mon, 5 Jun 2023 17:46:27 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 5 Jun
 2023 12:46:27 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 5 Jun
 2023 12:46:27 -0500
Received: from [192.168.137.15] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 5 Jun 2023 12:46:25 -0500
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
X-Inumbo-ID: e93628ba-03c8-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZPEpeoUQNd1k4Li/JcMqF6lgsmCKNBDYRiyUiA6HOdSPU3S9GvGUPseHM7wcZk/vzpFCXXlgep4420qsKUQ/y0xlpVJcj//fua0iqAyfi0pTWBTHcuCbTfKDcSp8XQsR0GdFksX/nbfNUp3eKDvhKy+lWFrRUIbz4eJAVjGGQJHBU+5OvAMjuSlieEZa9XLQ2tb8LdnCjd/nnb0eUAUj8vhczMKUoOE1X3rWmF6EXZzHUHxFZjBFPXQQpVueEOf7S18RU2xDqSNCIoP/pM616Ck4U5yYDDvuaoSitJ/pV0d0oVbAuLco3kg9szZU+UJawjv9Tx8DnbqPWvxVwbpw8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SbzyvZL8aCV5a2eymcurHtTMQBQNjLKlJNuFXPDiFAY=;
 b=Y/lU44pGjy7gRsc2KyIy7H7LSrZXw1BNcruuUgXiTrb+lAJ62wqpUAxbdH2ZhrYRa0FZkczsYyCuSco9jSe0IgHkaHg5+KR3pl6mCcQEdRz9QK1DKhDUZtHkIkmd939leoUteGkWv3P9aXiwqdX/MJMAGp/KW3x9qIIGvfGVvSaqSyjzrRQdK7h9dKMksUbMGmP2g/DepLplyHujrmy1IWAQ2LmHJT7vIrO/R4U1Ka1dz4Ko6TGO2LUIF0byzZvuVTznLMLzQse6aWW9Crf3tEpugfhMVB5AAl5IUnZ1UEDfnO/To7QCoIitmfThMkDWpUp6d8bsMyHNPNJzgXlBww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SbzyvZL8aCV5a2eymcurHtTMQBQNjLKlJNuFXPDiFAY=;
 b=m/07xgUEpnMS/kDmKySDyKRbuUJ1e/3rEYKtMipc58Nco4sDEDX26VoswiMMVCEvThndu/7/jUdnpNkHLqvMiHcibzKCSY7Cs1hce9RHUZ3VcIIWq47nz484bg1KJTxy9Qca371u6nyuHHkbB3INARy5+Sw9XIkpvbQe4diTwp8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <8b433e63-9647-d217-115d-995c6ba176c5@amd.com>
Date: Mon, 5 Jun 2023 13:46:25 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 1/6] xen/arm: Move is_protected flag to struct device
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, <xen-devel@lists.xenproject.org>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Rahul Singh <rahul.singh@arm.com>
References: <20230518210658.66156-1-stewart.hildebrand@amd.com>
 <20230518210658.66156-2-stewart.hildebrand@amd.com>
 <0033f950-eacd-6af5-8256-38f4cbea87e3@amd.com>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <0033f950-eacd-6af5-8256-38f4cbea87e3@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT070:EE_|SJ2PR12MB7962:EE_
X-MS-Office365-Filtering-Correlation-Id: 532958f6-9689-47aa-d6e0-08db65ecc9d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9xxnAWTGKqhWaPJwaIcde3/X8lJHTpcFhhlfX+gODqdaZSsljxmNHJOBaVnfMIofUhItx4K4zNajv2qaO1BwjaxaOd6tHmNmkL6/TGRaUuMJW+pAkWklhWov6R6gLI58ldV6QEyFaexCuKJt2/bZNLAeesnwhz8IPEn9l0LH0Zi/e4RCPMhLqtBm368FO9A8TFGzzXQMYCx519oHZ0oezumgfgDUqXuuBg/qxzWaTlWanwpfKaJ+lUdEhiSpvfIKqQp2sHPUpPHxTntT5cSZ7wQ0iAy/DjyOduNqXCFPDoSrbgfNH0Z0706QvS0dQToQmkmZxfl25fBYBx4z7/Rd3MyGKaHTnmLp7+c+2Nryw8VuDYUJPY4XCpptLtZx1DMi9y4Z7ioQIzcM+SqriiD3wTvBDinXPu/FQ1KHhgHWbCYa1VKrYM4l5rpU7G60sqCVBcltcssZtOWBvR3ooyl7RZ1xpgVf+Cx+rev16kbOO1F3XbzW3tJgg1dYnRqbD7IlTTP+beRTHk1C1OckBdUXWtWGyzuvoVENa0cBuh9sv625fCBVn6K6BR16uBo33ZovpMucCLE12aG0qzKVV3SEON+06EUa0P9H5n0YVAmU5L/Y0sih7adJa4BOqKxE9UohIOZULKLQJAm5ZwJOteMWuU1mpyxpLzF0w1jpGxiT3KNgXfkLWd/1oXTp2qdX3UIVSogO7bcH82e46gTC/LpPw4ygc9LEPMiLHyr26igpjiNt65CMBBUWQAmz5xBnwJH/OXxhZwTwf+z0rcRAe/d49NrHenZqBdZHL/0tE99f28w=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(376002)(346002)(136003)(451199021)(46966006)(40470700004)(36840700001)(70586007)(70206006)(30864003)(2906002)(478600001)(31686004)(316002)(4326008)(8936002)(8676002)(41300700001)(54906003)(110136005)(16576012)(44832011)(5660300002)(53546011)(40460700003)(26005)(966005)(356005)(82740400003)(81166007)(2616005)(40480700001)(186003)(47076005)(426003)(336012)(83380400001)(36860700001)(36756003)(82310400005)(86362001)(31696002)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 17:46:27.5575
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 532958f6-9689-47aa-d6e0-08db65ecc9d6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT070.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7962

On 5/22/23 10:28, Michal Orzel wrote:
> Hi Stewart,
> 
> On 18/05/2023 23:06, Stewart Hildebrand wrote:
>>
>>
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> This flag will be re-used for PCI devices by the subsequent
>> patches.
>>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>> ---
>> v2->v3:
>> * no change
>>
>> v1->v2:
>> * no change
>>
>> downstream->v1:
>> * rebase
>> * s/dev_node->is_protected/dev_node->dev.is_protected/ in smmu.c
>> * s/dt_device_set_protected(dev_to_dt(dev))/device_set_protected(dev)/ in smmu-v3.c
>> * remove redundant device_is_protected checks in smmu-v3.c/ipmmu-vmsa.c
>>
>> (cherry picked from commit 59753aac77528a584d3950936b853ebf264b68e7 from
>>  the downstream branch poc/pci-passthrough from
>>  https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc.git)
>> ---
>>  xen/arch/arm/domain_build.c              |  4 ++--
>>  xen/arch/arm/include/asm/device.h        | 13 +++++++++++++
>>  xen/common/device_tree.c                 |  2 +-
>>  xen/drivers/passthrough/arm/ipmmu-vmsa.c |  8 +-------
>>  xen/drivers/passthrough/arm/smmu-v3.c    |  7 +------
>>  xen/drivers/passthrough/arm/smmu.c       |  2 +-
>>  xen/drivers/passthrough/device_tree.c    | 15 +++++++++------
>>  xen/include/xen/device_tree.h            | 13 -------------
>>  8 files changed, 28 insertions(+), 36 deletions(-)
>>
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index 71f307a572e9..d228da641367 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -2503,7 +2503,7 @@ static int __init handle_device(struct domain *d, struct dt_device_node *dev,
>>              return res;
>>          }
>>
>> -        if ( dt_device_is_protected(dev) )
>> +        if ( device_is_protected(dt_to_dev(dev)) )
>>          {
>>              dt_dprintk("%s setup iommu\n", dt_node_full_name(dev));
>>              res = iommu_assign_dt_device(d, dev);
>> @@ -3003,7 +3003,7 @@ static int __init handle_passthrough_prop(struct kernel_info *kinfo,
>>          return res;
>>
>>      /* If xen_force, we allow assignment of devices without IOMMU protection. */
>> -    if ( xen_force && !dt_device_is_protected(node) )
>> +    if ( xen_force && !device_is_protected(dt_to_dev(node)) )
>>          return 0;
>>
>>      return iommu_assign_dt_device(kinfo->d, node);
>> diff --git a/xen/arch/arm/include/asm/device.h b/xen/arch/arm/include/asm/device.h
>> index b5d451e08776..086dde13eb6b 100644
>> --- a/xen/arch/arm/include/asm/device.h
>> +++ b/xen/arch/arm/include/asm/device.h
>> @@ -1,6 +1,8 @@
>>  #ifndef __ASM_ARM_DEVICE_H
>>  #define __ASM_ARM_DEVICE_H
>>
>> +#include <xen/types.h>
>> +
>>  enum device_type
>>  {
>>      DEV_DT,
>> @@ -20,6 +22,7 @@ struct device
>>  #endif
>>      struct dev_archdata archdata;
>>      struct iommu_fwspec *iommu_fwspec; /* per-device IOMMU instance data */
>> +    bool is_protected; /* Shows that device is protected by IOMMU */
> This will add 7 bytes of padding on arm64. Did you check if there is a hole you can reuse?

Good point, I'll move it to save space (on arm64). With is_protected located in the hole after the enum, there will be no change in sizeof(struct device) on arm64. BTW, how do we feel about explicit padding?

 struct device

 {

     enum device_type type;

+    bool is_protected; /* Shows that device is protected by IOMMU */

+    uint8_t _pad[3];
 /* unused padding - can be removed to make room for future data */
 #ifdef CONFIG_HAS_DEVICE_TREE

     struct dt_device_node *of_node; /* Used by drivers imported from Linux */

 #endif

     struct dev_archdata archdata;

     struct iommu_fwspec *iommu_fwspec; /* per-device IOMMU instance data */

 };

>>  };
>>
>>  typedef struct device device_t;
>> @@ -94,6 +97,16 @@ int device_init(struct dt_device_node *dev, enum device_class class,
>>   */
>>  enum device_class device_get_class(const struct dt_device_node *dev);
>>
>> +static inline void device_set_protected(struct device *device)
>> +{
>> +    device->is_protected = true;
>> +}
>> +
>> +static inline bool device_is_protected(const struct device *device)
>> +{
>> +    return device->is_protected;
>> +}
>> +
>>  #define DT_DEVICE_START(_name, _namestr, _class)                    \
>>  static const struct device_desc __dev_desc_##_name __used           \
>>  __section(".dev.info") = {                                          \
>> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
>> index 6c9712ab7bda..1d5d7cb5f01b 100644
>> --- a/xen/common/device_tree.c
>> +++ b/xen/common/device_tree.c
>> @@ -1874,7 +1874,7 @@ static unsigned long __init unflatten_dt_node(const void *fdt,
>>          /* By default dom0 owns the device */
>>          np->used_by = 0;
>>          /* By default the device is not protected */
>> -        np->is_protected = false;
>> +        np->dev.is_protected = false;
>>          INIT_LIST_HEAD(&np->domain_list);
>>
>>          if ( new_format )
>> diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
>> index 091f09b21752..039212a3a990 100644
>> --- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
>> +++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
>> @@ -1288,14 +1288,8 @@ static int ipmmu_add_device(u8 devfn, struct device *dev)
>>      if ( !to_ipmmu(dev) )
>>          return -ENODEV;
>>
>> -    if ( dt_device_is_protected(dev_to_dt(dev)) )
>> -    {
>> -        dev_err(dev, "Already added to IPMMU\n");
>> -        return -EEXIST;
>> -    }
> This removal and in smmuv3 needs to be explained in the commit msg.

I think the rationale for the removal is no longer valid.

In v1 of this series, we had:

pci_add_device()                                        pci.c

    iommu_add_device()                                  pci.c
        iommu_add_dt_pci_device()                       device_tree.c

            if ( device_is_protected(dev) ) return 0;

            ops->add_device()

                device_set_protected()


So in v1 of this series, the device_is_protected checks inside the add_device hooks were redundant because there was already such a check before calling the add_device hook.

Now in v3 we don't have a device_is_protected check before calling ops->add_device:

pci_add_device()                                        pci.c

    iommu_add_device()                                  pci.c

        ops->add_device()

            device_set_protected()


So in v3 of this series, the checks in smmu-v3.c/ipmmu-vmsa.c aren't redundant anymore. I'll re-add the checks in v4.

>> -
>>      /* Let Xen know that the master device is protected by an IOMMU. */
>> -    dt_device_set_protected(dev_to_dt(dev));
>> +    device_set_protected(dev);
>>
>>      dev_info(dev, "Added master device (IPMMU %s micro-TLBs %u)\n",
>>               dev_name(fwspec->iommu_dev), fwspec->num_ids);
>> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
>> index 4ca55d400a7b..f5910e79922f 100644
>> --- a/xen/drivers/passthrough/arm/smmu-v3.c
>> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
>> @@ -1521,13 +1521,8 @@ static int arm_smmu_add_device(u8 devfn, struct device *dev)
>>          */
>>         arm_smmu_enable_pasid(master);
>>
>> -       if (dt_device_is_protected(dev_to_dt(dev))) {
>> -               dev_err(dev, "Already added to SMMUv3\n");
>> -               return -EEXIST;
>> -       }
>> -
>>         /* Let Xen know that the master device is protected by an IOMMU. */
>> -       dt_device_set_protected(dev_to_dt(dev));
>> +       device_set_protected(dev);
>>
>>         dev_info(dev, "Added master device (SMMUv3 %s StreamIds %u)\n",
>>                         dev_name(fwspec->iommu_dev), fwspec->num_ids);
>> diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
>> index 0a514821b336..5b6024d579a8 100644
>> --- a/xen/drivers/passthrough/arm/smmu.c
>> +++ b/xen/drivers/passthrough/arm/smmu.c
>> @@ -838,7 +838,7 @@ static int arm_smmu_dt_add_device_legacy(struct arm_smmu_device *smmu,
>>         master->of_node = dev_node;
>>
>>         /* Xen: Let Xen know that the device is protected by an SMMU */
>> -       dt_device_set_protected(dev_node);
>> +       device_set_protected(dev);
>>
>>         for (i = 0; i < fwspec->num_ids; ++i) {
>>                 if (!(smmu->features & ARM_SMMU_FEAT_STREAM_MATCH) &&
>> diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
>> index 1c32d7b50cce..b5bd13393b56 100644
>> --- a/xen/drivers/passthrough/device_tree.c
>> +++ b/xen/drivers/passthrough/device_tree.c
>> @@ -34,7 +34,7 @@ int iommu_assign_dt_device(struct domain *d, struct dt_device_node *dev)
>>      if ( !is_iommu_enabled(d) )
>>          return -EINVAL;
>>
>> -    if ( !dt_device_is_protected(dev) )
>> +    if ( !device_is_protected(dt_to_dev(dev)) )
>>          return -EINVAL;
>>
>>      spin_lock(&dtdevs_lock);
>> @@ -65,7 +65,7 @@ int iommu_deassign_dt_device(struct domain *d, struct dt_device_node *dev)
>>      if ( !is_iommu_enabled(d) )
>>          return -EINVAL;
>>
>> -    if ( !dt_device_is_protected(dev) )
>> +    if ( !device_is_protected(dt_to_dev(dev)) )
>>          return -EINVAL;
>>
>>      spin_lock(&dtdevs_lock);
>> @@ -87,7 +87,7 @@ static bool_t iommu_dt_device_is_assigned(const struct dt_device_node *dev)
>>  {
>>      bool_t assigned = 0;
>>
>> -    if ( !dt_device_is_protected(dev) )
>> +    if ( !device_is_protected(dt_to_dev(dev)) )
>>          return 0;
>>
>>      spin_lock(&dtdevs_lock);
>> @@ -141,12 +141,15 @@ int iommu_add_dt_device(struct dt_device_node *np)
>>          return -EINVAL;
>>
>>      /*
>> -     * The device may already have been registered. As there is no harm in
>> -     * it just return success early.
>> +     * This is needed in case a device has both the iommus property and
>> +     * also appears in the mmu-masters list.
>>       */
>> -    if ( dev_iommu_fwspec_get(dev) )
>> +    if ( device_is_protected(dev) )
>>          return 0;
>>
>> +    if ( dev_iommu_fwspec_get(dev) )
>> +        return -EEXIST;
> This needs to be explained, because before this change, we were returning 0.

Since this change is not related to moving the is_protected flag, I prefer to move it to a separate patch (with an appropriate explanation). Then we will keep this patch focused on actually moving the is_protected flag as the title suggests.

>> +
>>      /*
>>       * According to the Documentation/devicetree/bindings/iommu/iommu.txt
>>       * from Linux.
>> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
>> index 19a74909cece..c1e4751a581f 100644
>> --- a/xen/include/xen/device_tree.h
>> +++ b/xen/include/xen/device_tree.h
>> @@ -90,9 +90,6 @@ struct dt_device_node {
>>      struct dt_device_node *next; /* TODO: Remove it. Only use to know the last children */
>>      struct dt_device_node *allnext;
>>
>> -    /* IOMMU specific fields */
>> -    bool is_protected;
>> -
>>      /* HACK: Remove this if there is a need of space */
>>      bool_t static_evtchn_created;
> Not your fault (and I don't know if you should do anything about it) but this single field now causes
> the whole structure to be 8 bytes larger than it could be on arm64.
> 
> ~Michal

