Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B997099A0
	for <lists+xen-devel@lfdr.de>; Fri, 19 May 2023 16:27:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537111.835923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q014V-00005w-JE; Fri, 19 May 2023 14:27:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537111.835923; Fri, 19 May 2023 14:27:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q014V-0008U9-GA; Fri, 19 May 2023 14:27:07 +0000
Received: by outflank-mailman (input) for mailman id 537111;
 Fri, 19 May 2023 14:27:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C4tO=BI=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1q014U-0007z3-5f
 for xen-devel@lists.xenproject.org; Fri, 19 May 2023 14:27:06 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062e.outbound.protection.outlook.com
 [2a01:111:f400:7eab::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38c1e270-f651-11ed-8611-37d641c3527e;
 Fri, 19 May 2023 16:27:04 +0200 (CEST)
Received: from BN0PR04CA0021.namprd04.prod.outlook.com (2603:10b6:408:ee::26)
 by BY5PR12MB4193.namprd12.prod.outlook.com (2603:10b6:a03:20c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.21; Fri, 19 May
 2023 14:26:59 +0000
Received: from BN8NAM11FT071.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ee:cafe::8f) by BN0PR04CA0021.outlook.office365.com
 (2603:10b6:408:ee::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19 via Frontend
 Transport; Fri, 19 May 2023 14:26:59 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT071.mail.protection.outlook.com (10.13.177.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.21 via Frontend Transport; Fri, 19 May 2023 14:26:59 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 19 May
 2023 09:26:59 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 19 May
 2023 09:26:58 -0500
Received: from [192.168.137.15] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 19 May 2023 09:26:56 -0500
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
X-Inumbo-ID: 38c1e270-f651-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WRmMyxi3ACUrhjEbgYPTec10eBpkss9ICxf8QIfPYAvzFFmEOOtKdbuAbP2GJ0fHGfV3+j9Jx/qvzmoNlxkrNRQG3yzdWuzApdss05QmBrXOYtK8lAZ+xUdHrpmP0CzS7XYTcrNP4CijqfAAamJ8OrNOfYRKWWQPIi4a3d9FNP1ntimvcnpJeBmgBuBmU7YmK+wllYFRBI0jLjwDwLDKsD4blLznKHsJj3KiplDGUXcaV7coGsjOhpVSsoQIr8qdktcbhhB6kiS+eMEijZqfyiVfntJ03uHmyrNumduYGjr1s85bAmxj8ooEZpFcqbYVw4nnesxdllI9gyqsMnzqEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DHZSfXl2P/H9/KuFs7UN6kolQMT57tk4g/AQSqax9O4=;
 b=lxGN+Cutf4KSGOpPHwRzR6nu+hPPuRn07AUUBHKLYchYuNPjT/hwUigBZZzSm0Yft62iVl1HfRxmDioVx7ozW6aEYShUEs96wvwunmvCU6+ww2rQOCalgpAHq16vcQhiSYq0PxsWabZhZb1wkIt+9Uny+N4T3bXmUM39aCvsQhCA4fPx9MfecU8aYqZrgSvEwIV2IbQIdqh3L9uNBSaB4ncozzfGjZl4kp1lDEjvF+pmLYc0xx4rglgekG0+/bAJMJty7oMxZORMHE2Kb67E8cn6qV1lMydAsy1/RDnCk5SIAHeDCShCNAdumHhdEfN9IKvbzYh4i61kGNbVX3IDjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DHZSfXl2P/H9/KuFs7UN6kolQMT57tk4g/AQSqax9O4=;
 b=JNrgLsekIMHwlnhWDlxQHxBdC/WLHVeZ+4uO18ZHQrs+q2k+alxkRIvX9oAaHRD9oMaJC1PlCryXpwqLlthT96aBNOBRWChqmHTsxatxMp0kD1lECkG2xDQ0oKVJSCi/jEUpNN6O/7b4HPKUr1rdWihNtKq7tJ5xfu76ocxFn/I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <0241103b-4c82-aad3-a7e9-d359d805c675@amd.com>
Date: Fri, 19 May 2023 10:26:51 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 3/6] iommu/arm: Introduce iommu_add_dt_pci_sideband_ids
 API
To: Jan Beulich <jbeulich@suse.com>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Paul Durrant
	<paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
	Rahul Singh <rahul.singh@arm.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, <xen-devel@lists.xenproject.org>
References: <20230518210658.66156-1-stewart.hildebrand@amd.com>
 <20230518210658.66156-4-stewart.hildebrand@amd.com>
 <d9618948-d4da-cfea-ad80-d130dc50d3cb@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <d9618948-d4da-cfea-ad80-d130dc50d3cb@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT071:EE_|BY5PR12MB4193:EE_
X-MS-Office365-Filtering-Correlation-Id: 317cf9b3-11f5-429e-9350-08db58751b30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Lhgzd+wV0QbzKIr1xS8yhbXj9WTEAYOCtM2i7x1SIzQs2YmgsfAnwQ/VewB8uTBGsxkWUkaYhHMhU596Ic88qh3k0rHdsRrreZnpkVirQtxa+whZ4eYvng3ONjj9l0VmjFt34kUAw/sdprTsVePnTvd3T6ugnG2vEyPHlTHRcH3uN49AsMnnGUKyOxcFuZbBpWVjZvG6UzTyiQfg2onFkG21tE8jNH9MafY8M88qExtbYEP+0yt5YX9Lk7CCAIn710jElYVcdlP9qoTD1lvsbAXE877vmk7iZbXYZNSszw6nEBOWhZSdX7icnhJ6VhHngZWvL5xxSPwpjWF6SUuAGx7lcRSBUIgteZmPa7iHgpsMzOw1ju79crgv98BEeSpiYp89ylOLG0Wfpj6rFWvXVvEfHP3OMxxcEnFbJqithlO5V9Y8NWK5rxAbOtXMLnjARbYMCK7F4Kj/tzBnYZuJfSDI6jaI8suD4u45DwSGdva+daRnljDTcYAqeBICBNaTnOLfuAdaXELYlGEm1uHIYoJVkNNPsyR6n5MZUJTjMg5w+20x/Qudkzpsc8ZRSE+zDjXa7wnUGU+Zz5QbSmRee6iaxEe3zhGxNeiLIZveRQhVtdXPbK7Fe56zQrsm7zJlhUXfXPrKF1L1v1GvnbZr4wWBdX65fkoJO3u3/I16g0CMvW+nO95T2+Rb/cCMmtuSAYTZ8eEfbaVKxoJeea8rIeFW4pGBaqd1eFJQlgSu+Y8F7vU0V/ZCftS84yEjIHHebdpOkUV5HaTYy5qASWB9oTT9vWlAXGazIaoBGbC1SI/PG0Z7DS90+DYZoA0xQB/T
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(346002)(396003)(136003)(451199021)(40470700004)(36840700001)(46966006)(70206006)(70586007)(6916009)(4326008)(31686004)(16576012)(54906003)(82740400003)(8936002)(8676002)(40480700001)(478600001)(316002)(6666004)(41300700001)(40460700003)(2906002)(86362001)(31696002)(81166007)(356005)(53546011)(26005)(44832011)(83380400001)(47076005)(2616005)(36860700001)(186003)(426003)(336012)(36756003)(5660300002)(82310400005)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2023 14:26:59.3174
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 317cf9b3-11f5-429e-9350-08db58751b30
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT071.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4193

On 5/19/23 04:45, Jan Beulich wrote:
> On 18.05.2023 23:06, Stewart Hildebrand wrote:
>> --- a/xen/include/xen/iommu.h
>> +++ b/xen/include/xen/iommu.h
>> @@ -26,6 +26,7 @@
>>  #include <xen/spinlock.h>
>>  #include <public/domctl.h>
>>  #include <public/hvm/ioreq.h>
>> +#include <asm/acpi.h>
>>  #include <asm/device.h>
> 
> I view this as problematic: It'll require all architectures with an
> IOMMU implementation to have an asm/acpi.h. I think this wants to go
> inside an "#ifdef CONFIG_ACPI" and then ...

Will do

>> @@ -228,12 +230,25 @@ int iommu_release_dt_devices(struct domain *d);
>>   *      (IOMMU is not enabled/present or device is not connected to it).
>>   */
>>  int iommu_add_dt_device(struct dt_device_node *np);
>> +int iommu_add_dt_pci_sideband_ids(struct pci_dev *pdev);
>>
>>  int iommu_do_dt_domctl(struct xen_domctl *, struct domain *,
>>                         XEN_GUEST_HANDLE_PARAM(xen_domctl_t));
>>
>> +#else /* !HAS_DEVICE_TREE */
>> +static inline int iommu_add_dt_pci_sideband_ids(struct pci_dev *pdev)
>> +{
>> +    return 0;
>> +}
>>  #endif /* HAS_DEVICE_TREE */
>>
>> +static inline int iommu_add_pci_sideband_ids(struct pci_dev *pdev)
>> +{
>> +    if ( acpi_disabled )
> 
> ... the same #ifdef would be added around this if().

Okay. I will take care to avoid an unreachable return 0; by introducing a local variable:

static inline int iommu_add_pci_sideband_ids(struct pci_dev *pdev)
{
    int ret = 0;
#ifdef CONFIG_ACPI
    if ( acpi_disabled )
#endif
        ret = iommu_add_dt_pci_sideband_ids(pdev);
    return ret;
}

> All of this of course only if this is deemed enough to allow co-existance
> of DT and ACPI (which I'm not convinced it is, but I don't know enough
> about DT and e.g. possible mixed configurations).
> 
> Jan

On ARM, we dynamically check for the existence of a valid device tree and set acpi_disabled accordingly. I did some basic testing on ARM with both CONFIG_ACPI=y and # CONFIG_ACPI is not set. My understanding is that it will work, and it should allow ACPI on ARM to be implemented in future.

>> +        return iommu_add_dt_pci_sideband_ids(pdev);
>> +    return 0;
>> +}
>> +
>>  struct page_info;
>>
>>  /*
> 

