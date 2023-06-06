Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23920724575
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jun 2023 16:14:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544092.849618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6XS2-0003r0-5v; Tue, 06 Jun 2023 14:14:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544092.849618; Tue, 06 Jun 2023 14:14:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6XS2-0003nh-2w; Tue, 06 Jun 2023 14:14:22 +0000
Received: by outflank-mailman (input) for mailman id 544092;
 Tue, 06 Jun 2023 14:14:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xMXh=B2=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1q6XS0-0003nb-OK
 for xen-devel@lists.xenproject.org; Tue, 06 Jun 2023 14:14:21 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061a.outbound.protection.outlook.com
 [2a01:111:f400:7e88::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b2bd148-0474-11ee-8611-37d641c3527e;
 Tue, 06 Jun 2023 16:14:16 +0200 (CEST)
Received: from BN8PR16CA0002.namprd16.prod.outlook.com (2603:10b6:408:4c::15)
 by DM6PR12MB4386.namprd12.prod.outlook.com (2603:10b6:5:28f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Tue, 6 Jun
 2023 14:14:12 +0000
Received: from BN8NAM11FT092.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:4c:cafe::75) by BN8PR16CA0002.outlook.office365.com
 (2603:10b6:408:4c::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33 via Frontend
 Transport; Tue, 6 Jun 2023 14:14:12 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT092.mail.protection.outlook.com (10.13.176.180) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.33 via Frontend Transport; Tue, 6 Jun 2023 14:14:12 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 6 Jun
 2023 09:14:11 -0500
Received: from [192.168.137.15] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 6 Jun 2023 09:14:09 -0500
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
X-Inumbo-ID: 6b2bd148-0474-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Su4qvsz0Vov3h3UhCgQlVC8ibj0+uP9nE7rPodIMYJpHbfBmS6VSsHMOqkhUVorIlHyiqKxDgpy8I0cpQm7vQaHpTYF/UBnf+ZZctxESl2MimAE42o9kYbo4xfj/HrDOLrAsc9aQR2tRbXmrshrPRXWbdH66QCw+N2pYDiPBVncgEeopVbeMx3wX4Rrn0cGeSu4LvSlrpvdD3lSa7C2mDc/tAk/FhiusWLUkamTo9hOHWUhWO5UapFq18CUs8owjVsfr/oUv14A4gd66xRCX3/IR2Bsr0iAhk2TFxlDF3MnIGikcL0JjM3YsCLIf1KDVYYqUW6fhTNUAwDobWJGNzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TCKehh3+He4fHifYne+4pjQWmcv0PpElUQM8G7cNuoo=;
 b=DBqlWNvZVTVPgD29J2pgQpHAYpfhpDdWMe6vQT06NSIiKkzMpDaQ0yLR9VQSefAfLKF90WwTPKjkdssxC8n8RxpTiGlZslHzS4vPnb6/29z58UeIQw8l4zRGjYv66uVysxZmFip8pF5SBgsR6JfhpNOpTrTSADV0VDoi5oR0X6oV2yam8hYeB3OT8cv/DrVqoCZk/Bj4CDlkV1X4xJIuz7HHYDRSpE7yX6Ynvo3AtJ1aLeJ4VlOzaS1T6H3p139Z4k3RsZrxyeuebnx9XZeEwGb7nJKPHNn2O5gqF5mjaRdTeax/C7JtOcB3KcfSOzECQ4EogmIICohGJ1yFU4mvUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TCKehh3+He4fHifYne+4pjQWmcv0PpElUQM8G7cNuoo=;
 b=ojioXGU6HwpX9STAQLKQ6w++4tfLKWRagcA+Y+O/Bb/qZWh0BqvJN4rwoGnEVLwKuV6JFzUH7lsxed/R/xcMIsPaPUyyGGdnV1bJyqpEU3E5DrXnyDzWR385U0ZzRzWNzD9zsMaWC/qTePMlMDUTn6vhW3K+S8Ge3pwTj82b+FE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <dd58c81f-1d52-6dd4-d1af-7a46458bdceb@amd.com>
Date: Tue, 6 Jun 2023 10:14:09 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 3/6] iommu/arm: Introduce iommu_add_dt_pci_sideband_ids
 API
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, <xen-devel@lists.xenproject.org>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Jan Beulich
	<jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Rahul Singh
	<rahul.singh@arm.com>, Bertrand Marquis <bertrand.marquis@arm.com>
References: <20230518210658.66156-1-stewart.hildebrand@amd.com>
 <20230518210658.66156-4-stewart.hildebrand@amd.com>
 <0b842e78-a206-7434-f7a9-d8021dd66731@amd.com>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <0b842e78-a206-7434-f7a9-d8021dd66731@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT092:EE_|DM6PR12MB4386:EE_
X-MS-Office365-Filtering-Correlation-Id: 143fdfa2-2e2d-4450-7cf3-08db66984d52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/YzcOPevgTkzzpaeM39oLWGF1PVCUBzq0ARqBpo3p+qYotDb1rdMDqV0iTnT2696JulbLISDOhmumwX6HWapTRwM8H3Tx5K27yLvQiRJUVrB3d/QAtyB5PfMP8NZajl0UsH2BQCyBUr7aITBrhweRZB/lJd375t/s1bfF5orn9rYxCNhf1NZV+L5I0xNpVGWCh95Yx3pk2r0Gf5o3fFTyDGC7X8j6tId6vHscY5dgUE0DTsxyBkX+DTPM0AeqpdYMtLfUWxgwA1aTbSBCSe/T8adtKMv/kahZddvKtOcyouw/ySyDOsi0GSMgHNzxXI/rt1QIEljlHQ6IlVMZ67/zxBJUoZsPhlXEDEnXAo9k0WZR/YN4Xgatr+Cb3sEnEwewYQL5NJczMKrm3dp7LbIsEn1kNFb5B5UXIgeKEEaFhAFGkT5aV6gv4V88jxjgt+8ro31BpkZ9kODd3BvEZ/qmzy07XjaWuuBgC3oEf/TTTedPKXfti6LzNeyxgwe7zHDHrzOoTSZ/LA8FAqImwDNsj22QsW+BFU1eqdUseJnLI+CozKy78BbmhMwtQAsFA4s4LHpObjpVXwSvYSIW6i0qGO7dUqopQVSrSeGKXt8ICLFAjEBuFQCv7tl0ySOpkG9dMpFHqjLX40QbbBLU1WlHH+Qo2UoHmzEHQ/5sr8iP1eLy2AUoHf7g81WtRBMPj+0vz6rtA1KSP6mW4zCUVhsT1x8DPtByVfLW5OiCFxZCO5Rw+CM9Q2Flxg+MQNz7u+B08P4F8ZVrHaam3QzvD/cxa/AZaz4A79Ya5DF2qxVnQ8cetgWqrZm7PZs0zrmZLJv
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(396003)(39860400002)(376002)(451199021)(36840700001)(40470700004)(46966006)(40460700003)(966005)(83380400001)(36860700001)(336012)(186003)(36756003)(2616005)(426003)(86362001)(82310400005)(81166007)(356005)(31696002)(47076005)(82740400003)(26005)(53546011)(40480700001)(316002)(54906003)(110136005)(16576012)(70586007)(70206006)(8676002)(4326008)(8936002)(5660300002)(31686004)(44832011)(30864003)(41300700001)(2906002)(478600001)(21314003)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2023 14:14:12.0902
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 143fdfa2-2e2d-4450-7cf3-08db66984d52
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT092.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4386

On 5/24/23 03:49, Michal Orzel wrote:
> Hi Stewart,
> 
> On 18/05/2023 23:06, Stewart Hildebrand wrote:
>>
>>
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> The main purpose of this patch is to add a way to register PCI device
>> (which is behind the IOMMU) using the generic PCI-IOMMU DT bindings [1]
>> before assigning that device to a domain.
>>
>> This behaves in almost the same way as existing iommu_add_dt_device API,
>> the difference is in devices to handle and DT bindings to use.
>>
>> The function of_map_id to translate an ID through a downstream mapping
>> (which is also suitable for mapping Requester ID) was borrowed from Linux
>> (v5.10-rc6) and updated according to the Xen code base.
>>
>> XXX: I don't port pci_for_each_dma_alias from Linux which is a part
>> of PCI-IOMMU bindings infrastucture as I don't have a good understanding
>> for how it is expected to work in Xen environment.
>> Also it is not completely clear whether we need to distinguish between
>> different PCI types here (DEV_TYPE_PCI, DEV_TYPE_PCI_HOST_BRIDGE, etc).
>> For example, how we should behave here if the host bridge doesn't have
>> a stream ID (so not described in iommu-map property) just simple
>> fail or bypasses translation?
>>
>> [1] https://www.kernel.org/doc/Documentation/devicetree/bindings/pci/pci-iommu.txt
>>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>> ---
>> v2->v3:
>> * new patch title (was: iommu/arm: Introduce iommu_add_dt_pci_device API)
>> * renamed function
>>   from: iommu_add_dt_pci_device
>>   to: iommu_add_dt_pci_sideband_ids
>> * removed stale ops->add_device check
>> * iommu.h: add empty stub iommu_add_dt_pci_sideband_ids for !HAS_DEVICE_TREE
>> * iommu.h: add iommu_add_pci_sideband_ids helper
>> * iommu.h: don't wrap prototype in #ifdef CONFIG_HAS_PCI
>> * s/iommu_fwspec_free(pci_to_dev(pdev))/iommu_fwspec_free(dev)/
>>
>> v1->v2:
>> * remove extra devfn parameter since pdev fully describes the device
>> * remove ops->add_device() call from iommu_add_dt_pci_device(). Instead, rely on
>>   the existing iommu call in iommu_add_device().
>> * move the ops->add_device and ops->dt_xlate checks earlier
>>
>> downstream->v1:
>> * rebase
>> * add const qualifier to struct dt_device_node *np arg in dt_map_id()
>> * add const qualifier to struct dt_device_node *np declaration in iommu_add_pci_device()
>> * use stdint.h types instead of u8/u32/etc...
>> * rename functions:
>>   s/dt_iommu_xlate/iommu_dt_xlate/
>>   s/dt_map_id/iommu_dt_pci_map_id/
>>   s/iommu_add_pci_device/iommu_add_dt_pci_device/
>> * add device_is_protected check in iommu_add_dt_pci_device
>> * wrap prototypes in CONFIG_HAS_PCI
>>
>> (cherry picked from commit 734e3bf6ee77e7947667ab8fa96c25b349c2e1da from
>>  the downstream branch poc/pci-passthrough from
>>  https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc.git)
>> ---
>>  xen/drivers/passthrough/device_tree.c | 140 ++++++++++++++++++++++++++
>>  xen/include/xen/device_tree.h         |  25 +++++
>>  xen/include/xen/iommu.h               |  17 +++-
>>  3 files changed, 181 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
>> index 1b50f4670944..d568166e19ec 100644
>> --- a/xen/drivers/passthrough/device_tree.c
>> +++ b/xen/drivers/passthrough/device_tree.c
>> @@ -151,6 +151,146 @@ static int iommu_dt_xlate(struct device *dev,
>>      return ops->dt_xlate(dev, iommu_spec);
>>  }
>>
>> +#ifdef CONFIG_HAS_PCI
>> +int iommu_dt_pci_map_id(const struct dt_device_node *np, uint32_t id,
>> +                        const char *map_name, const char *map_mask_name,
>> +                        struct dt_device_node **target, uint32_t *id_out)
>> +{
>> +    uint32_t map_mask, masked_id, map_len;
>> +    const __be32 *map = NULL;
>> +
>> +    if ( !np || !map_name || (!target && !id_out) )
>> +        return -EINVAL;
>> +
>> +    map = dt_get_property(np, map_name, &map_len);
>> +    if ( !map )
>> +    {
>> +        if ( target )
>> +            return -ENODEV;
> empty line here

OK

>> +        /* Otherwise, no map implies no translation */
>> +        *id_out = id;
>> +        return 0;
>> +    }
>> +
>> +    if ( !map_len || map_len % (4 * sizeof(*map)) )
> could you enclose the second expression in parantheses?

Yes

>> +    {
>> +        printk(XENLOG_ERR "%pOF: Error: Bad %s length: %d\n", np,
> %pOF is a Linux special printk format to print full name of the node.
> We do not have this in Xen (see printk-formats.txt). If you want to achieve the same, use np->full_name.
> This applies to all the uses below.

OK

> Also, use %u for map_len as it is unsigned.

OK

>> +            map_name, map_len);
> incorrect alignment

OK

>> +        return -EINVAL;
>> +    }
>> +
>> +    /* The default is to select all bits. */
>> +    map_mask = 0xffffffff;
>> +
>> +    /*
>> +     * Can be overridden by "{iommu,msi}-map-mask" property.
>> +     * If of_property_read_u32() fails, the default is used.
> s/of_property_read_u32/dt_property_read_u32

OK

>> +     */
>> +    if ( map_mask_name )
>> +        dt_property_read_u32(np, map_mask_name, &map_mask);
>> +
>> +    masked_id = map_mask & id;
>> +    for ( ; (int)map_len > 0; map_len -= 4 * sizeof(*map), map += 4 )
>> +    {
>> +        struct dt_device_node *phandle_node;
>> +        uint32_t id_base = be32_to_cpup(map + 0);
>> +        uint32_t phandle = be32_to_cpup(map + 1);
>> +        uint32_t out_base = be32_to_cpup(map + 2);
>> +        uint32_t id_len = be32_to_cpup(map + 3);
>> +
>> +        if ( id_base & ~map_mask )
>> +        {
>> +            printk(XENLOG_ERR "%pOF: Invalid %s translation - %s-mask (0x%x) ignores id-base (0x%x)\n",
> we tend to use PRIx32 to print uint32_t values.

OK

>> +                   np, map_name, map_name, map_mask, id_base);
>> +            return -EFAULT;
>> +        }
>> +
>> +        if ( masked_id < id_base || masked_id >= id_base + id_len )
> could you enclose the expressions in parantheses?

Yes, I will follow MISRA C:2012 Rule 12.1

>> +            continue;
>> +
>> +        phandle_node = dt_find_node_by_phandle(phandle);
>> +        if ( !phandle_node )
>> +            return -ENODEV;
>> +
>> +        if ( target )
>> +        {
>> +            if ( !*target )
>> +                *target = phandle_node;
>> +
>> +            if ( *target != phandle_node )
>> +                continue;
>> +        }
>> +
>> +        if ( id_out )
>> +            *id_out = masked_id - id_base + out_base;
>> +
>> +        printk(XENLOG_DEBUG "%pOF: %s, using mask %08x, id-base: %08x, out-base: %08x, length: %08x, id: %08x -> %08x\n",
> %08"PRIx32"

OK

>> +               np, map_name, map_mask, id_base, out_base, id_len, id,
>> +               masked_id - id_base + out_base);
>> +        return 0;
>> +    }
>> +
>> +    printk(XENLOG_ERR "%pOF: no %s translation for id 0x%x on %pOF\n",
>> +           np, map_name, id, target && *target ? *target : NULL);
>> +
>> +    /*
>> +     * NOTE: Linux bypasses translation without returning an error here,
>> +     * but should we behave in the same way on Xen? Restrict for now.
>> +     */
>> +    return -EFAULT;
>> +}
>> +
>> +int iommu_add_dt_pci_sideband_ids(struct pci_dev *pdev)
>> +{
>> +    const struct iommu_ops *ops = iommu_get_ops();
>> +    struct dt_phandle_args iommu_spec = { .args_count = 1 };
>> +    struct device *dev = pci_to_dev(pdev);
>> +    const struct dt_device_node *np;
>> +    int rc = NO_IOMMU;
>> +
>> +    if ( !iommu_enabled )
>> +        return NO_IOMMU;
>> +
>> +    if ( !ops )
>> +        return -EINVAL;
>> +
>> +    if ( device_is_protected(dev) )
>> +        return 0;
>> +
>> +    if ( dev_iommu_fwspec_get(dev) )
>> +        return -EEXIST;
>> +
>> +    np = pci_find_host_bridge_node(pdev);
>> +    if ( !np )
>> +        return -ENODEV;
>> +
>> +    /*
>> +     * The driver which supports generic PCI-IOMMU DT bindings must have
>> +     * these callback implemented.
>> +     */
>> +    if ( !ops->dt_xlate )
>> +        return -EINVAL;
> See my comment in previous patch. This could be moved to iommu_dt_xlate().

OK

>> +
>> +    /*
>> +     * According to the Documentation/devicetree/bindings/pci/pci-iommu.txt
>> +     * from Linux.
>> +     */
>> +    rc = iommu_dt_pci_map_id(np, PCI_BDF(pdev->bus, pdev->devfn), "iommu-map",
>> +                             "iommu-map-mask", &iommu_spec.np, iommu_spec.args);
>> +    if ( rc )
>> +        return rc == -ENODEV ? NO_IOMMU : rc;
>> +
>> +    rc = iommu_dt_xlate(dev, &iommu_spec);
>> +    if ( rc < 0 )
>> +    {
>> +        iommu_fwspec_free(dev);
>> +        return -EINVAL;
>> +    }
>> +
>> +    return rc;
>> +}
>> +#endif /* CONFIG_HAS_PCI */
>> +
>>  int iommu_add_dt_device(struct dt_device_node *np)
>>  {
>>      const struct iommu_ops *ops = iommu_get_ops();
>> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
>> index c1e4751a581f..dc40fdfb9231 100644
>> --- a/xen/include/xen/device_tree.h
>> +++ b/xen/include/xen/device_tree.h
>> @@ -852,6 +852,31 @@ int dt_count_phandle_with_args(const struct dt_device_node *np,
>>   */
>>  int dt_get_pci_domain_nr(struct dt_device_node *node);
>>
>> +#ifdef CONFIG_HAS_PCI
>> +/**
>> + * iommu_dt_pci_map_id - Translate an ID through a downstream mapping.
>> + * @np: root complex device node.
>> + * @id: device ID to map.
>> + * @map_name: property name of the map to use.
>> + * @map_mask_name: optional property name of the mask to use.
>> + * @target: optional pointer to a target device node.
>> + * @id_out: optional pointer to receive the translated ID.
>> + *
>> + * Given a device ID, look up the appropriate implementation-defined
>> + * platform ID and/or the target device which receives transactions on that
>> + * ID, as per the "iommu-map" and "msi-map" bindings. Either of @target or
>> + * @id_out may be NULL if only the other is required. If @target points to
>> + * a non-NULL device node pointer, only entries targeting that node will be
>> + * matched; if it points to a NULL value, it will receive the device node of
>> + * the first matching target phandle, with a reference held.
>> + *
>> + * Return: 0 on success or a standard error code on failure.
>> + */
>> +int iommu_dt_pci_map_id(const struct dt_device_node *np, uint32_t id,
>> +                        const char *map_name, const char *map_mask_name,
>> +                        struct dt_device_node **target, uint32_t *id_out);
> Why is the iommu function prototype in device_tree.h and not in iommu.h where all rest of the iommu
> dt related prototypes are placed?

The function was borrowed from Linux's of_map_id, and it can be used to parse both "iommu-map" and "msi-map" properties.  So it is not necessarily iommu specific. I'm considering renaming it back to dt_map_id in v4.

> Furthermore, do you need to expose globally this function?
> Looking at this series it could be static as it is only used by iommu_add_dt_pci_sideband_ids().
> Will there be any use of it later on?

Not in this series, but in the future MSI series it will be used with the "msi-map" binding. See [1]

[1] https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc/-/commit/a8af686c327c2f2bdde321027abfda0b9ba4469c#15fe36652149e3439a60b50d9672982ca3de755e_290_301

