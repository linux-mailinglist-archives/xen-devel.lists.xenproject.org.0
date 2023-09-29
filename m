Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E98317B3BBD
	for <lists+xen-devel@lfdr.de>; Fri, 29 Sep 2023 23:04:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610729.950258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qmKeG-0004l5-5u; Fri, 29 Sep 2023 21:03:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610729.950258; Fri, 29 Sep 2023 21:03:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qmKeG-0004jM-2p; Fri, 29 Sep 2023 21:03:44 +0000
Received: by outflank-mailman (input) for mailman id 610729;
 Fri, 29 Sep 2023 21:03:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w1P3=FN=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qmKeD-0004h1-T8
 for xen-devel@lists.xenproject.org; Fri, 29 Sep 2023 21:03:42 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060e.outbound.protection.outlook.com
 [2a01:111:f400:7e89::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9308afa-5f0b-11ee-9b0d-b553b5be7939;
 Fri, 29 Sep 2023 23:03:38 +0200 (CEST)
Received: from DS7PR03CA0265.namprd03.prod.outlook.com (2603:10b6:5:3b3::30)
 by PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Fri, 29 Sep
 2023 21:03:32 +0000
Received: from DS3PEPF000099DF.namprd04.prod.outlook.com
 (2603:10b6:5:3b3:cafe::29) by DS7PR03CA0265.outlook.office365.com
 (2603:10b6:5:3b3::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.27 via Frontend
 Transport; Fri, 29 Sep 2023 21:03:32 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099DF.mail.protection.outlook.com (10.167.17.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Fri, 29 Sep 2023 21:03:31 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 29 Sep
 2023 16:03:31 -0500
Received: from [172.20.57.36] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 29 Sep 2023 16:03:29 -0500
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
X-Inumbo-ID: a9308afa-5f0b-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UOBNdEOTz95gaXmyvqCq04B9FZ0IDafvXZmaXM/scL3hxK03QCs2TqfgX1Fd8sTp8m8A+GF2KXJIOk9aM2bldSc5Bljgmu+/Zu/aO7SLiOxS6vc9f0YRZ/YmZ66Yt2aAWOHrX3q+gohd0q+B2AAoGceupsIKb8VsRduyopIvuNeerrz/Ea6pJah6EGKhdeGYfd/MtXWGUZQy/Q8EbS/kHFVNW0nlgokn/QaBfJUYQYi1VZ+8iXF+AB3ED3ozTw9J6HJzn5XVgK0SsVxoORMoKla8gB7/PSQs/E7gHHG5AGeuXnWqMICXhrMKi7k3qPknEU+tV/ovXRKUC6miHgeX6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+faOQx7oloYsx/+3vWU/dQDWIUfjbXsWX7LCct0P9Z4=;
 b=XDZaQV7evpE6KC0NZjC2lxVFIsVPQ7wagOkPPfj/Ak3Vc3HOHAvt9O5xMr6XanAmEc22NVCwqCgaNIYko1CyRPyNlw/xG0yAbDE83X9KC8tkNPI9PLJ1titQnirrXoKkDGPwrQ99hrv18OyuzS+34VBK0ziwZdtR4DL9hrrP3gUOIOYAcEy++k5XQt9dHGLtSxV/v87WWnrkbWYOgCV2BiPuxYI1w/PnwGVcyj1b9VMKaFJMbjdTu0/ZLsqMukwfV91jb9sjNxGAT2Ns4G2KUMobEj7VEWdljkXueu7jg89p6nyZGBAUS/GeVwySgEEWRBdlhflOyyWnPle4swp29g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+faOQx7oloYsx/+3vWU/dQDWIUfjbXsWX7LCct0P9Z4=;
 b=m2fvy6iUP4HdhUf/RYIcigYBUwYQmZAPU+LjYEZn5AzhEydK0q2WmDQszSzjroutaPRnSrMJKWUlE7Earl7NP7+ZZ8TsWjVtH8iilNuE0Fd/fO5sx5xmPxmutK12hleOvOfHmxcmL5S/KlTt8iXzioNph5pv+wDSxrAwLzgtQOQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <21d58a9f-5563-b745-7938-70db6b7e10f2@amd.com>
Date: Fri, 29 Sep 2023 17:03:29 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 4/7] iommu/arm: Introduce iommu_add_dt_pci_sideband_ids
 API
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>, Paul Durrant
	<paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
	Rahul Singh <rahul.singh@arm.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>
References: <20230607030220.22698-1-stewart.hildebrand@amd.com>
 <20230607030220.22698-5-stewart.hildebrand@amd.com>
 <855fd25d-07bb-0b08-4c25-75e652c142a6@xen.org>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <855fd25d-07bb-0b08-4c25-75e652c142a6@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DF:EE_|PH8PR12MB7326:EE_
X-MS-Office365-Filtering-Correlation-Id: 38aadaa5-b455-4e47-59aa-08dbc12f89a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	s+q/4+cXkbQDyN5WoyCnv39YKz8b8wUPsCrprZbTgEd6vdkeVz7vS2hJYy2VFWXCHfTkEnN/HBmLcYmnu+fkNVr/fWha5a2GhhV6eon0z9h9p6Sn5Z82VcKckas7XVfU/Imlq4EVxpgt8xnUbqEbRzk+GvaN69gSyvDXDT6zUZTN5E70eRE3dgK2oo8EzhdgUzVF+SVG55hBGLxSLEkbyGruDvLlNzfyLKiehQC86nJ3qTu4Q9SmZCyA6yYOB5kgbY+8Blxa+z7VDSH6wFKIP+YuoHy0Pw47EExmdNwDWR7EjrMEbY2aahwPtLnz17zSVHTEQd6z8kKxgaucd2b6lx18edfgbNvgoN5YNKW/sHbcJi9nri2MEltpsp+lmxflYvnQS6DEBtWfdutNoJeXxRgKfG3UuZjQnIgp5xi/ZNXqt21x1NCJ07zY2dcudYIVpz6bdneiQkAYICtuIb1xP0g65WUZ3je6+bBne3A50X6VzDiQlovgvI1jAgd7X5x9ZHP00tsnc4b67L5V1PoSEihDKHeqAlVXsXNv+vBMdCKMrrB//tFjAWAhlQ+GKMIUMVpZJM9o+/hjhYQPmicUaW26VdsYlcxmpIljDr+/v3DRQuOArYbfUgOsgrI0hAmp0T6JxRzXSbKswv3JWHive4AyHYUHNvGzIkth2orMr6PXE32DTwdZQxrBQFJsr0aIQSuu2A5hWEhha5OpWcILWH4h1dFJE/vSVMlobrwh/w8fYARpt47IKTaDX7sjQ9AuJyo9Nad0PYqjj2YED5s8aPy1/8h+rdNQKc4joJI647z10AQhQwwp5n/Q0tvnZVhrma6qzQJJ590D2L0sbcLZHw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(39860400002)(396003)(346002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(82310400011)(36840700001)(40470700004)(46966006)(4326008)(54906003)(110136005)(40480700001)(16576012)(5660300002)(70586007)(70206006)(41300700001)(44832011)(8936002)(316002)(45080400002)(8676002)(47076005)(2906002)(40460700003)(31686004)(30864003)(356005)(82740400003)(426003)(478600001)(36860700001)(966005)(26005)(2616005)(81166007)(86362001)(53546011)(83380400001)(31696002)(36756003)(336012)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 21:03:31.8120
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38aadaa5-b455-4e47-59aa-08dbc12f89a5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7326

On 7/4/23 05:35, Julien Grall wrote:
> Hi,
> 
> On 07/06/2023 04:02, Stewart Hildebrand wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> The main purpose of this patch is to add a way to register PCI device
>> (which is behind the IOMMU) using the generic PCI-IOMMU DT bindings [1]
>> before assigning that device to a domain.
>>
>> This behaves similarly to the existing iommu_add_dt_device API, except it
>> handles PCI devices, and it is to be invoked from the add_device hook in the
>> SMMU driver.
>>
>> The function of_map_id to translate an ID through a downstream mapping
> 
> You called the function dt_map_id in Xen.

I will fix

>> (which is also suitable for mapping Requester ID) was borrowed from Linux
>> (v5.10-rc6) and updated according to the Xen code base.
>>
>> [1] https://www.kernel.org/doc/Documentation/devicetree/bindings/pci/pci-iommu.txt
>>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>> ---
>> v3->v4:
>> * wrap #include <asm/acpi.h> and if ( acpi_disabled ) in #ifdef CONFIG_ACPI
>> * fix Michal's remarks about style, parenthesis, and print formats
>> * remove !ops->dt_xlate check since it is already in iommu_dt_xlate helper
>> * rename s/iommu_dt_pci_map_id/dt_map_id/ because it is generic, not specific
>>    to iommu
>> * update commit description
>>
>> v2->v3:
>> * new patch title (was: iommu/arm: Introduce iommu_add_dt_pci_device API)
>> * renamed function
>>    from: iommu_add_dt_pci_device
>>    to: iommu_add_dt_pci_sideband_ids
>> * removed stale ops->add_device check
>> * iommu.h: add empty stub iommu_add_dt_pci_sideband_ids for !HAS_DEVICE_TREE
>> * iommu.h: add iommu_add_pci_sideband_ids helper
>> * iommu.h: don't wrap prototype in #ifdef CONFIG_HAS_PCI
>> * s/iommu_fwspec_free(pci_to_dev(pdev))/iommu_fwspec_free(dev)/
>>
>> v1->v2:
>> * remove extra devfn parameter since pdev fully describes the device
>> * remove ops->add_device() call from iommu_add_dt_pci_device(). Instead, rely on
>>    the existing iommu call in iommu_add_device().
>> * move the ops->add_device and ops->dt_xlate checks earlier
>>
>> downstream->v1:
>> * rebase
>> * add const qualifier to struct dt_device_node *np arg in dt_map_id()
>> * add const qualifier to struct dt_device_node *np declaration in iommu_add_pci_device()
>> * use stdint.h types instead of u8/u32/etc...
>> * rename functions:
>>    s/dt_iommu_xlate/iommu_dt_xlate/
>>    s/dt_map_id/iommu_dt_pci_map_id/
>>    s/iommu_add_pci_device/iommu_add_dt_pci_device/
>> * add device_is_protected check in iommu_add_dt_pci_device
>> * wrap prototypes in CONFIG_HAS_PCI
>>
>> (cherry picked from commit 734e3bf6ee77e7947667ab8fa96c25b349c2e1da from
>>   the downstream branch poc/pci-passthrough from
>>   https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc.git)
>> ---
>>   xen/drivers/passthrough/device_tree.c | 134 ++++++++++++++++++++++++++
>>   xen/include/xen/device_tree.h         |  25 +++++
>>   xen/include/xen/iommu.h               |  22 ++++-
>>   3 files changed, 180 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
>> index ff9e66ebf92a..bd0aed5df651 100644
>> --- a/xen/drivers/passthrough/device_tree.c
>> +++ b/xen/drivers/passthrough/device_tree.c
>> @@ -154,6 +154,140 @@ static int iommu_dt_xlate(struct device *dev,
>>       return ops->dt_xlate(dev, iommu_spec);
>>   }
>>
>> +#ifdef CONFIG_HAS_PCI
> 
> The code below doesn't seem to be specific to PCI.

I will move dt_map_id() outside the #ifdef CONFIG_HAS_PCI ...

> 
>> +int dt_map_id(const struct dt_device_node *np, uint32_t id,
>> +              const char *map_name, const char *map_mask_name,
>> +              struct dt_device_node **target, uint32_t *id_out)
> 
> AFAICT, this function can also be used outside of the IOMMU code. So
> shouldn't this be implemented in common/device_tree.c?

... to common/device_tree.c.

>> +{
>> +    uint32_t map_mask, masked_id, map_len;
>> +    const __be32 *map = NULL;
>> +
>> +    if ( !np || !map_name || (!target && !id_out) )
>> +        return -EINVAL;
>> +
>> +    map = dt_get_property(np, map_name, &map_len);
>> +    if ( !map )
>> +    {
>> +        if ( target )
>> +            return -ENODEV;
>> +
>> +        /* Otherwise, no map implies no translation */
>> +        *id_out = id;
>> +        return 0;
>> +    }
>> +
>> +    if ( !map_len || (map_len % (4 * sizeof(*map))) )
>> +    {
>> +        printk(XENLOG_ERR "%s: Error: Bad %s length: %u\n", np->full_name,
>> +               map_name, map_len);
> 
> I think it would be helpful if you add the function name in the error
> message.

Will do

>> +        return -EINVAL;
>> +    }
>> +
>> +    /* The default is to select all bits. */
>> +    map_mask = 0xffffffff;
> 
> Please add a U. That said, I would switch to GENMASK(31, 0) so it is
> easier to check the value.

OK, I will use GENMASK and add #include <xen/bitops.h>.

>> +
>> +    /*
>> +     * Can be overridden by "{iommu,msi}-map-mask" property.
>> +     * If df_property_read_u32() fails, the default is used.
> 
> s/df/dt/

Will fix, thanks for spotting this

>> +     */
>> +    if ( map_mask_name )
>> +        dt_property_read_u32(np, map_mask_name, &map_mask);
>> +
>> +    masked_id = map_mask & id;
>> +    for ( ; (int)map_len > 0; map_len -= 4 * sizeof(*map), map += 4 )
> 
> Why do you cast map_len to 'int'?

No good reason, I will remove the cast.

>> +    {
>> +        struct dt_device_node *phandle_node;
>> +        uint32_t id_base = be32_to_cpup(map + 0);
>> +        uint32_t phandle = be32_to_cpup(map + 1);
>> +        uint32_t out_base = be32_to_cpup(map + 2);
>> +        uint32_t id_len = be32_to_cpup(map + 3);
>> +
>> +        if ( id_base & ~map_mask )
>> +        {
>> +            printk(XENLOG_ERR "%s: Invalid %s translation - %s-mask (0x%"PRIx32") ignores id-base (0x%"PRIx32")\n",
>> +                   np->full_name, map_name, map_name, map_mask, id_base);
> 
> Same here about adding the function name.

Will do

>> +            return -EFAULT;
>> +        }
>> +
>> +        if ( (masked_id < id_base) || (masked_id >= (id_base + id_len)) )
>> +            continue;
>> +
>> +        phandle_node = dt_find_node_by_phandle(phandle);
>> +        if ( !phandle_node )
>> +            return -ENODEV;
>> +
>> +        if ( target )
>> +        {
>> +            if ( !*target )
>> +                *target = phandle_node;
>> +
>> +            if ( *target != phandle_node )
>> +                continue;
>> +        }
>> +
>> +        if ( id_out )
>> +            *id_out = masked_id - id_base + out_base;
>> +
>> +        printk(XENLOG_DEBUG "%s: %s, using mask %08"PRIx32", id-base: %08"PRIx32", out-base: %08"PRIx32", length: %08"PRIx32", id: %08"PRIx32" -> %08"PRIx32"\n",
> 
> How about using dprintk()?

OK

>> +               np->full_name, map_name, map_mask, id_base, out_base, id_len, id,
>> +               masked_id - id_base + out_base);
>> +        return 0;
>> +    }
>> +
>> +    printk(XENLOG_ERR "%s: no %s translation for id 0x%"PRIx32" on %s\n",
>> +           np->full_name, map_name, id, (target && *target) ? (*target)->full_name : NULL);
> 
> Same here about adding the function name.

I'll change this one to dprintk too, since it's not necessarily an error condition to reach here (see below).

>> +
>> +    /*
>> +     * NOTE: Linux bypasses translation without returning an error here,
>> +     * but should we behave in the same way on Xen? Restrict for now.
>> +     */
> 
> Can you outline why we would want to bypass the translation?

We can reach here if the iommu-map property doesn't cover all possible RIDs, or is otherwise malformed in some way. E.g. you might have iommu-map = <0x0 &smmu 0x8000 0x8000>;. RIDs 0x0-0x7fff will get translated, but RIDs 0x8000-0xffff won't. Also, RIDs 0x8000-0xffff won't have the &smmu phandle reference.

Reference the iommu-map DT binding [1] linked in the commit message for more info.

On an ARM platform, it would probably be an error to not apply a RID -> stream ID translation. However, this code is not ARM specific. Also, in case of no translation, the SMMU driver will fail to add the device, because the *target = phandle_node; line above would not get executed. So I think we can safely change it to return 0, which is the same as of_map_id in Linux.

>> +    return -EFAULT;
>> +}
>> +
>> +int iommu_add_dt_pci_sideband_ids(struct pci_dev *pdev)
>> +{
>> +    const struct iommu_ops *ops = iommu_get_ops();
>> +    struct dt_phandle_args iommu_spec = { .args_count = 1 };
>> +    struct device *dev = pci_to_dev(pdev);
>> +    const struct dt_device_node *np;
>> +    int rc = NO_IOMMU;
> 
> AFAICT, the initial value will never be read. So is it necessary?

You're right, no need to initialize. I will fix.

>> +
>> +    if ( !iommu_enabled )
>> +        return NO_IOMMU;
>> +
>> +    if ( !ops )
>> +        return -EINVAL;
>> +
>> +    if ( device_is_protected(dev) )
>> +        return 0;
> 
> These two lines are a bit odd to read because you would think that if
> the device is protected, then you want to continue translation. So can
> you add a comment explaining what this check means?

Since dropping ("xen/arm: Move is_protected flag to struct device") the is_protected check is no longer relevant. I will remove it.

>> +
>> +    if ( dev_iommu_fwspec_get(dev) )
>> +        return -EEXIST;
>> +
>> +    np = pci_find_host_bridge_node(pdev);
>> +    if ( !np )
>> +        return -ENODEV;
>> +
>> +    /*
>> +     * According to the Documentation/devicetree/bindings/pci/pci-iommu.txt
>> +     * from Linux.
>> +     */
>> +    rc = dt_map_id(np, PCI_BDF(pdev->bus, pdev->devfn), "iommu-map",
>> +                   "iommu-map-mask", &iommu_spec.np, iommu_spec.args);
>> +    if ( rc )
>> +        return (rc == -ENODEV) ? NO_IOMMU : rc;
>> +
>> +    rc = iommu_dt_xlate(dev, &iommu_spec);
>> +    if ( rc < 0 )
>> +    {
>> +        iommu_fwspec_free(dev);
>> +        return -EINVAL;
>> +    }
>> +
>> +    return rc;
>> +}
>> +#endif /* CONFIG_HAS_PCI */
>> +
>>   int iommu_add_dt_device(struct dt_device_node *np)
>>   {
>>       const struct iommu_ops *ops = iommu_get_ops();
>> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
>> index c2f315140560..8385cd538a58 100644
>> --- a/xen/include/xen/device_tree.h
>> +++ b/xen/include/xen/device_tree.h
>> @@ -892,6 +892,31 @@ int dt_count_phandle_with_args(const struct dt_device_node *np,
>>    */
>>   int dt_get_pci_domain_nr(struct dt_device_node *node);
>>
>> +#ifdef CONFIG_HAS_PCI
> 
> In Xen, we don't usually add #ifdef for prototype only.

OK, I will remove the #ifdef

>> +/**
>> + * dt_map_id - Translate an ID through a downstream mapping.
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
>> +int dt_map_id(const struct dt_device_node *np, uint32_t id,
>> +              const char *map_name, const char *map_mask_name,
>> +              struct dt_device_node **target, uint32_t *id_out);
>> +#endif /* CONFIG_HAS_PCI */
>> +
>>   struct dt_device_node *dt_find_node_by_phandle(dt_phandle handle);
>>
>>   #ifdef CONFIG_DEVICE_TREE_DEBUG
>> diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
>> index 405db59971c5..3cac177840f7 100644
>> --- a/xen/include/xen/iommu.h
>> +++ b/xen/include/xen/iommu.h
>> @@ -26,6 +26,9 @@
>>   #include <xen/spinlock.h>
>>   #include <public/domctl.h>
>>   #include <public/hvm/ioreq.h>
>> +#ifdef CONFIG_ACPI
>> +#include <asm/acpi.h>
>> +#endif
>>   #include <asm/device.h>
>>
>>   TYPE_SAFE(uint64_t, dfn);
>> @@ -219,7 +222,8 @@ int iommu_dt_domain_init(struct domain *d);
>>   int iommu_release_dt_devices(struct domain *d);
>>
>>   /*
>> - * Helper to add master device to the IOMMU using generic IOMMU DT bindings.
>> + * Helpers to add master device to the IOMMU using generic (PCI-)IOMMU
>> + * DT bindings.
>>    *
>>    * Return values:
>>    *  0 : device is protected by an IOMMU
>> @@ -228,12 +232,28 @@ int iommu_release_dt_devices(struct domain *d);
>>    *      (IOMMU is not enabled/present or device is not connected to it).
>>    */
>>   int iommu_add_dt_device(struct dt_device_node *np);
>> +int iommu_add_dt_pci_sideband_ids(struct pci_dev *pdev);
>>
>>   int iommu_do_dt_domctl(struct xen_domctl *, struct domain *,
>>                          XEN_GUEST_HANDLE_PARAM(xen_domctl_t));
>>
>> +#else /* !HAS_DEVICE_TREE */
>> +static inline int iommu_add_dt_pci_sideband_ids(struct pci_dev *pdev)
>> +{
>> +    return 0;
> Shouldn't this return an error because we wouldn't be able to add the
> Device?

Yep, I will fix

>> +}
>>   #endif /* HAS_DEVICE_TREE */
>>
>> +static inline int iommu_add_pci_sideband_ids(struct pci_dev *pdev)
>> +{
>> +    int ret = 0;
> 
> Same here.

OK

>> +#ifdef CONFIG_ACPI
>> +    if ( acpi_disabled )
>> +#endif
>> +        ret = iommu_add_dt_pci_sideband_ids(pdev);
>> +    return ret;
>> +}
>> +
>>   struct page_info;
>>
>>   /*
> 
> Cheers,
> 
> -- 
> Julien Grall

