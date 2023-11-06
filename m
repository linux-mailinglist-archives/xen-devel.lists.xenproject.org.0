Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E78247E2E22
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 21:25:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628486.980017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r069R-000493-Ac; Mon, 06 Nov 2023 20:24:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628486.980017; Mon, 06 Nov 2023 20:24:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r069R-000466-7w; Mon, 06 Nov 2023 20:24:49 +0000
Received: by outflank-mailman (input) for mailman id 628486;
 Mon, 06 Nov 2023 20:24:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/fhL=GT=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1r069P-00044m-V8
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 20:24:48 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20614.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85dddb95-7ce2-11ee-98da-6d05b1d4d9a1;
 Mon, 06 Nov 2023 21:24:45 +0100 (CET)
Received: from CYZPR05CA0032.namprd05.prod.outlook.com (2603:10b6:930:a3::14)
 by CH2PR12MB4326.namprd12.prod.outlook.com (2603:10b6:610:af::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Mon, 6 Nov
 2023 20:24:41 +0000
Received: from CY4PEPF0000EDD6.namprd03.prod.outlook.com
 (2603:10b6:930:a3:cafe::5) by CYZPR05CA0032.outlook.office365.com
 (2603:10b6:930:a3::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.16 via Frontend
 Transport; Mon, 6 Nov 2023 20:24:41 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EDD6.mail.protection.outlook.com (10.167.241.210) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.16 via Frontend Transport; Mon, 6 Nov 2023 20:24:41 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Mon, 6 Nov
 2023 14:24:40 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Mon, 6 Nov
 2023 14:24:40 -0600
Received: from [172.28.214.164] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Mon, 6 Nov 2023 14:24:39 -0600
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
X-Inumbo-ID: 85dddb95-7ce2-11ee-98da-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NYnhZk1ABtS9bOI/QjOtzqDXGMlMQ4J+mfGKfg/fIhJu126LOYHsPQtR39EX+dXXlRVw8aDKVFrffMNAvIM9ITAQfuYuiIFGRVI8OaHef9uvM0p21fu+bFeVdK+eO+vJ7d1wLatFHEAyiBDQ2LKq3EXrl1EbHIDH48saYgNHRt8vkEHhZQ0ddK3Nj9GxzdRfG47/qKVZHSwghS33tDVI1gkS/HjVtE1ZMoj9yDdNjU9/MsaLqHJ+dycrx/i/hLjMnwQpRDBY7kM6hHemodXycKxtjmzYbVBr8vSrcSVffXiPKeZkxsT64R6XgasxdcV5x3YVpHyOERoH3I38krQdXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K8iGUZkNGBL474ZwZDGSTdsDCXJ/VRYsDvP6g0IjKuM=;
 b=h3m+T+VFOflmVs0YI0XjiwYy1XLC+ME+Gnxd3Pkfu2FU6erhYm74BkIlGi0naxxF7+gl97tAOkbAgO7zHVHRnj3CpwCBeayggB2xoPngJGsuYhPx80WxB9Jl+WFGxkaNla65Kw5d944lX5QJrpLO6IzS9WDTKIvDvwLFNEFIy79cI4XkBtsA9/mrge/n8XNRyu8BDtwybiT+7FiJ+baXZDjpsoROD7VJLNVdc2iDlyWzp6tGi85I/oYeUp8U32zMjvbIIsvuba7i7yXjE9jSWAK045D2nvWXmARIuF8wZVVO7ak+tPEsjBRLmW7aRFoNnvFiOqawgOG6XuAX5lNg5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K8iGUZkNGBL474ZwZDGSTdsDCXJ/VRYsDvP6g0IjKuM=;
 b=BzogQmf3HtDrwGFP2epF47WkupDXdqVocDHosoyf4g8qNXZN+5vYcznrKezSxJa2rQ2WMjKxqn7cFIfd+eGPMM5p+yT6lpJu8Kfc/NU48zucfEBv5aP5S7xHqEiD0MttbJ0Lv0b3AFZgzWAT8euCpBNUhmWqsOCblZflSfl60P0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <256368a6-77a8-464f-a443-3d4185854bf3@amd.com>
Date: Mon, 6 Nov 2023 15:24:38 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 7/9] xen/arm: Fix mapping for PCI bridge mmio region
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231004145604.1085358-1-stewart.hildebrand@amd.com>
 <20231004145604.1085358-8-stewart.hildebrand@amd.com>
 <7a1bb4f1-4bb1-4592-8ddf-9e97ad4a39f3@xen.org>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <7a1bb4f1-4bb1-4592-8ddf-9e97ad4a39f3@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD6:EE_|CH2PR12MB4326:EE_
X-MS-Office365-Filtering-Correlation-Id: 499ac964-03a6-42d0-0912-08dbdf06682f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/SPE8Oe6E5F4AHY/ZZN310xj20gUggNNxHBPfFrZ12dQNWH8txED7TSWWcLRs6juOrWFQZHRFMH1oXkby47z9H/8MrgQ3msZszqImy6nj9So1tQH49W1qn8ck9OAOOOLnVsDHBD3BrBlmgftYzlrbSPuwXDs8BV3Dl1UOYmCwMDFIU2HWZXJEv7P/1//WVzztfE4Rw/dPvwdvEme7obGMpopHbsCvoNnIw3rZs0ZHwISkmT0CrWjjM8CwKqBTeyRpZsJqEiop1ltxv0U3WER5BLNkIcp9eTsnweL5P8awqHR+rWQC45U2k7BqDaF9TbRy7tjM52aETyZt5GVLGpBOwmmQ3cX5iyRjj8h3wcRPY8/AlRYLWJNPpKL57pdDOw19nMuxcO5OpVfZaw1bJhccC6REDdukPLiuVdvjbDX43QJUZqj1K1JeHVf0ASCNTeG30Lr0ArPoMKsr10UC2MOEuuqKAwGYHa2kxa69KeksMewZCnwm+Oro/IIblbwexrOeZ8D9LmvZMLhQQeGMa2VmWZwEC5eL4M0mmeLvGFOtUY+XE8kWykovfwTD+Fu2WkAwceAfBpcdsvUHaZM84+1ZFyKh488/sK0KCnfB442C8TsX4Cp67XxZWrezGUy1BPsZl2jWMyU1sH8swXJuCu8DhujxHUMB/XO8IV+h6XntqutueDktS776/8kmHzMHbLIqDHldiyEqu0XlY2VP5i29CtFYT3QMxpiGy7071dSJg9kXAuk1jU9j09wb2Zi2Tv6Mr0DxLdonWec86sNc12C3nAMOL0xZnkq+TlLZvS8F+8=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(136003)(376002)(396003)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(82310400011)(46966006)(36840700001)(40470700004)(31686004)(40480700001)(40460700003)(336012)(426003)(53546011)(26005)(41300700001)(47076005)(2616005)(36756003)(81166007)(356005)(82740400003)(31696002)(86362001)(5660300002)(966005)(2906002)(44832011)(36860700001)(83380400001)(4326008)(8936002)(8676002)(70206006)(316002)(16576012)(70586007)(54906003)(478600001)(110136005)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2023 20:24:41.2674
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 499ac964-03a6-42d0-0912-08dbdf06682f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4326

On 10/20/23 14:17, Julien Grall wrote:
> Hi Stewart,
> 
> On 04/10/2023 15:55, Stewart Hildebrand wrote:
>> From: Rahul Singh <rahul.singh@arm.com>
>>
>> Current code skip the mapping for PCI bridge MMIO region to dom0 when
>> pci_passthrough_enabled flag is set. Mapping should be skip when
>> has_vpci(d) is enabled for the domain, as we need to skip the mapping
>> only when VPCI handler are registered for ECAM.
>>
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>> ---
>> v4->v5:
>> * new patch
> 
> I am a bit lost. How is this a new patch but...
> 
>> * rebase on top of "dynamic node programming using overlay dtbo" series
>> * replace !is_pci_passthrough_enabled() check with !IS_ENABLED(CONFIG_HAS_PCI)
>>    instead of removing
> 
> ... there is a changelog. Did you get the patch from somewhere?

Yes, it was picked up from [1]. The changelog is describing what changed since getting the patch from [1]. I'll clarify this here in the next rev.

[1] https://lists.xenproject.org/archives/html/xen-devel/2023-07/msg00483.html

> 
>> ---
>>   xen/arch/arm/device.c       | 2 +-
>>   xen/arch/arm/domain_build.c | 4 ++--
>>   2 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/xen/arch/arm/device.c b/xen/arch/arm/device.c
>> index 1f631d327441..4d69c298858d 100644
>> --- a/xen/arch/arm/device.c
>> +++ b/xen/arch/arm/device.c
>> @@ -330,7 +330,7 @@ int handle_device(struct domain *d, struct dt_device_node *dev, p2m_type_t p2mt,
>>           .d = d,
>>           .p2mt = p2mt,
>>           .skip_mapping = !own_device ||
>> -                        (is_pci_passthrough_enabled() &&
>> +                        (has_vpci(d) &&
>>                           (device_get_class(dev) == DEVICE_PCI_HOSTBRIDGE)),
>>           .iomem_ranges = iomem_ranges,
>>           .irq_ranges = irq_ranges
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index 7da254709d17..2c55528a62d4 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -1064,7 +1064,7 @@ static void __init assign_static_memory_11(struct domain *d,
>>   #endif
>>
>>   /*
>> - * When PCI passthrough is available we want to keep the
>> + * When HAS_PCI is enabled we want to keep the
>>    * "linux,pci-domain" in sync for every host bridge.
>>    *
>>    * Xen may not have a driver for all the host bridges. So we have
>> @@ -1080,7 +1080,7 @@ static int __init handle_linux_pci_domain(struct kernel_info *kinfo,
>>       uint16_t segment;
>>       int res;
>>
>> -    if ( !is_pci_passthrough_enabled() )
>> +    if ( !IS_ENABLED(CONFIG_HAS_PCI) )
> 
> I don't understand why this wants to be HAS_PCI rather than has_vcpi()?
> This also doesn't seem to be mentioned in the commit message.

This particular change was essentially preparation for reverting the pci-passthrough option to ensure we didn't break the ability to bisect. Since we will not revert the pci-passthrough option after all, I will drop this change in domain_build.c for the next rev.

> 
>>           return 0;
>>
>>       if ( !dt_device_type_is_equal(node, "pci") )
> 
> Cheers,
> 
> -- 
> Julien Grall

