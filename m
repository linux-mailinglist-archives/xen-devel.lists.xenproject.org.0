Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D800B1C79F
	for <lists+xen-devel@lfdr.de>; Wed,  6 Aug 2025 16:31:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1071869.1435222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujfAQ-0001Nm-Dd; Wed, 06 Aug 2025 14:30:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1071869.1435222; Wed, 06 Aug 2025 14:30:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujfAQ-0001ML-9b; Wed, 06 Aug 2025 14:30:58 +0000
Received: by outflank-mailman (input) for mailman id 1071869;
 Wed, 06 Aug 2025 14:30:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VUPx=2S=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1ujfAO-0001MF-8l
 for xen-devel@lists.xenproject.org; Wed, 06 Aug 2025 14:30:56 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20609.outbound.protection.outlook.com
 [2a01:111:f403:2412::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f2c36b4f-72d1-11f0-b898-0df219b8e170;
 Wed, 06 Aug 2025 16:30:51 +0200 (CEST)
Received: from BL0PR05CA0021.namprd05.prod.outlook.com (2603:10b6:208:91::31)
 by SJ2PR12MB7895.namprd12.prod.outlook.com (2603:10b6:a03:4c6::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Wed, 6 Aug
 2025 14:30:46 +0000
Received: from BN2PEPF000044AB.namprd04.prod.outlook.com
 (2603:10b6:208:91:cafe::6c) by BL0PR05CA0021.outlook.office365.com
 (2603:10b6:208:91::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.5 via Frontend Transport; Wed, 6
 Aug 2025 14:30:45 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044AB.mail.protection.outlook.com (10.167.243.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Wed, 6 Aug 2025 14:30:45 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 6 Aug
 2025 09:30:44 -0500
Received: from [172.17.35.128] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 6 Aug 2025 09:30:43 -0500
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
X-Inumbo-ID: f2c36b4f-72d1-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oyGyUAJwWOttj1jbLv07A2ojBTr3y45Imnm1x9SJFI8glsnviSv60w1BWkKrAVmIEzA/xBWahsTJlUH67d/+eX3v+1by2T6dCVbNbmfqE7aJeFs+uq7Bqi1M7ihLRvtfsdiJXuxMyiZYCkLe9pAw6hM8YPmNE/zqAnQiEj4rjWuV8tCP8htwIs0lN02zDXYMru9KxuJGe0aT372aoVmF9BUj7u67u/ppBALuk2vJ0eGhri90EDR3fnxdUVY4b+jcPxQyoWnNhEv61NmvyXWmxp2jazpKCQNiT3C9nvViY8ix6eougYKC+7a658PXn3FykA6jxZhBbtsnrqUnI8s3Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VgRG5dns8+PbB+hxJcmrdozUfqf4hWR28q3LJkML9u4=;
 b=M5FAzgHDkqqjtY53aVP6PB1+/ux7Aa6ADfMwCpeep7hppfJV1cY4ENsUi50gjqwzYHR2eKFsWIfMhTNgECMQOXQgXG7sr2XPZM4icDNAonmM45XbM5EF3HjAuAl6pGllNsNVBsFLUe78LOBvBoWkeDA9fKmj9Ks/c5YqNSj7DOa9g7Q290jC+oR/rMpTM7Emj3xeTQKctfFIpocmWp8Xmnzrk+THYuXPCdpVRFyXl+ynxVT+TQIC8jYVfgOG/LdKz3jWFBefLnl4y6KHKbCukwcEZakKxhMMVoRbyByve8nfCJ7Use9NAprUbddI4DPuM7MUe8Ag4icbvkHjJfMU8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VgRG5dns8+PbB+hxJcmrdozUfqf4hWR28q3LJkML9u4=;
 b=vIXwXbjvwGxrsskFkNISF+ureLDr4Y7iila0Kc2A0bCDWSyMxJasWOPvweBl3s16dH2J7qOuxYxLqdDW2gedfXvy1d4q3BTGgC83lqu6gktHfCWS26ObsD1jTQIIF6rSdXjBeDWuw0C0NPbaUhAT0WewdjkmcZm6l9zxd3CgSUc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <0d5b855d-163e-4a4f-b1ba-a41de2dd1070@amd.com>
Date: Wed, 6 Aug 2025 10:30:45 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] xen/arm: fix arm_iommu_map_page after f9f6b22abf1d
To: Stewart Hildebrand <stewart.hildebrand@amd.com>, Julien Grall
	<julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <stefano.stabellini@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	"Michal Orzel" <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20250725140130.4008-1-stewart.hildebrand@amd.com>
 <5fab90b6-7cae-45d0-bb8e-b1ffa0390b6f@xen.org>
 <7a3a08f4-c08e-4490-a033-53e81b261181@amd.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <7a3a08f4-c08e-4490-a033-53e81b261181@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AB:EE_|SJ2PR12MB7895:EE_
X-MS-Office365-Filtering-Correlation-Id: fe895d9e-976e-43b9-9ade-08ddd4f5d475
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OGJwUTVZVkdNckVTcHZHY0Zzdk5TK2dSNDVuM0dIU1pFVnNQaTdhRkxlR0tw?=
 =?utf-8?B?YitzS25pcTlzUG1PVDlKQWlsQ3JUN2I0NW1lS25oTDk0U1RKWGg2Y3RxdVBW?=
 =?utf-8?B?SkZzRS9Wc1c1RnFSZEQxSFh0ZlFQZVdXRm00ZnB1Q01YenRUUjh1Y2pENFVL?=
 =?utf-8?B?dkh2Rm5YSG5EeXFEUVowNHBhVDg4ME1URndVUDZOUjMySXozNU1OZkVrR1ZL?=
 =?utf-8?B?b25CbDhFRi9YVnQ4ZUJMRy9PbHJzTDVkK3hCcUpFMG5ZcWlWcUZ5bmdXVnMv?=
 =?utf-8?B?UzZUa0ZuZlBHemdjUnVVRy9JVWRDQTdjT1dkRU01NlhyMEpvK2VhdG9ZSmJR?=
 =?utf-8?B?L0hpU2dWU0Y4MEZ6NUY2d3JJL2MxUWdDVDRyamlGcHdyZjI3RFRQOE9XUGhh?=
 =?utf-8?B?VWlYZ0hzeG1NLzRLSzZkQjVRemhoRnR4RFVERENPZWFzV0Y1Vnk5WHZSbElm?=
 =?utf-8?B?OHErN0tIVUcwQnNheG4wNnhhVTFhdWJqSEQ4VStOOHIxNVFlbFJZVk8ySEVy?=
 =?utf-8?B?cE5hLzRjTStIMXZvYTJTNTRaQkcxeDFRSU05K3B0MmhjblFIdkFkR3lWMXZW?=
 =?utf-8?B?Mks0TnExOHVSZFRYS0sxUEhDVlZZODhQUEZ0bkpYaEZZL0lpemZadlRpYjYw?=
 =?utf-8?B?WlVqQUsybGg3d1pLampCZ3UxYU0vY0pjWkRiQmlWYjlybzNCSmNnaTZvM3RZ?=
 =?utf-8?B?c1FCeDJydkVneVdTdWlsVjhWNFhoNnlBWGZiamM5OHVobWtMVjA4VUhPdnh6?=
 =?utf-8?B?UkNHeEgvU0lIY1JHZ1BVTEc4VVlucDJWU2FLbStYZml1SERvQitBbVRVUGhP?=
 =?utf-8?B?bGNOVXZGaXp3ZXJRVlRZaitNb0ZhYkFiOW4yeng0Zy92QUNZSDhiVUVVdWlk?=
 =?utf-8?B?S3dvNVhQZ2g3eXlOVE5ZZVdBTUprSkVDWHFrR0Y1VUUxSWQ2M2NrUk9ZSnhO?=
 =?utf-8?B?UVY2MHdzbVFBV3QvVEp1cy9SYU5tRHJ0a25iMDRpYytXdUFxT0NFUWhoNElY?=
 =?utf-8?B?UCtDQkN6ckZZb1ZHL3Frc0djNEtXNmEyRllpbnp4RlI0MlJYV0pWaEY3MUNk?=
 =?utf-8?B?blFvUHF5Z0RjcnlCRFMyUnVuK1FLVHk4YlN3c0xKeHdaRVdFTVE1dTN1Y0tG?=
 =?utf-8?B?VncyOUpVS0VjOGZ6dVkweEVrMUl1ck1TUlZtWk0zU2pteXJsNUtrY3R2ZWs2?=
 =?utf-8?B?VCtWblhSeERhTTRIa1RFZTRVeXFZOEhFU3VQQVRvNEl4T1BEdWR2SWFxY0dG?=
 =?utf-8?B?b1JhWUYramVDd0VSdTRYU3FDN2dmS0N0WTAyZnR0ek5IdE1YNzBJSUx3RHNt?=
 =?utf-8?B?RTZraXFzMS9FR3JnamZXOW9mU2FQYnZwREYvWStudzY2QkVqZFo3NnNFSHZ5?=
 =?utf-8?B?Ukd3MlByam5uVkZWaUNuOHdtVng2OFc0L2JSVHFVekxNdXFBUkZMSE9nM3c0?=
 =?utf-8?B?VUVXYnhJc2VVKzRoM29vM0hwSHF5SElkVjUwMGNEVWpsMUphRlpsR3Bwb09y?=
 =?utf-8?B?TStEcWgwTExCL0R5TWV5SG1HSlJYK291bzVxR0V6S09jZmZJR3pvSitkSHl6?=
 =?utf-8?B?THJCN0Rkekd5NFJSYzdyYXdLVkgzVnhETXlTNURsZFdjZmprRWVjVnJLS1hW?=
 =?utf-8?B?S053Y2pOR09Xb2srTlY4b3RDWjNCZ3ZwZVV0WStlVUFCRjVGK0IwbEI4MSt2?=
 =?utf-8?B?azhZYWJjdFlmZkF6NHlPVFJxaldCaWh5NVQxQTJYZVYzSWlhWXUzWEpveTlV?=
 =?utf-8?B?WUk5aXQ1WkFzRHR6dldkTmdjZ1h0eHJNSDFvTWRmQ1d1YTgzMkl4OGp5aStD?=
 =?utf-8?B?Q0NzaXRFR05qZTQxME04MmVPU3R2cWd5QjBWUnBYcVI0N3hycUdoa3dtampN?=
 =?utf-8?B?RkVteHNSazd3cVUzV3Iyc2ptY0gvMDF0eC9rT2hHa1dQSFd1UURjVlQ0Qy9L?=
 =?utf-8?B?Y2xhY0xvUXM1RE5rZ0FBQ25ad0UwbHJtS0Z6UGVpUmZDSGl5Z2tzN0duL2tw?=
 =?utf-8?B?VjJZYUNBS21LczVBa0c5OGNNeGFPTWU5UkVWMlpvVXhBQ21XYjh6R09TSkxj?=
 =?utf-8?Q?hciJsy?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 14:30:45.2605
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe895d9e-976e-43b9-9ade-08ddd4f5d475
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044AB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7895

On 2025-08-06 09:58, Stewart Hildebrand wrote:
> On 7/26/25 05:23, Julien Grall wrote:
>> Hi,
>>
>> On 25/07/2025 15:01, Stewart Hildebrand wrote:
>>> From: Stefano Stabellini <stefano.stabellini@amd.com>
>>>
>>> Up until f9f6b22abf1d "xen/arm: Map ITS doorbell register to IOMMU page
>>> tables" the only caller of iommu_map on ARM was grant_table.c which has
>>> a specific usage model and restrictions as described by the in-code
>>> comment in arm_iommu_map_page.
>>>
>>> f9f6b22abf1d introduced a second caller to iommu_map on ARM:
>>> vgic_v3_its_init_virtual. This specific statement in the
>>> f9f6b22abf1d commit message is partially wrong:
>>>
>>> "Note that the 1:1 check in arm_iommu_map_page remains for now, as
>>> virtual ITSes are currently only created for hwdom where the doorbell
>>> mapping is always 1:1."
>>>
>>> Leading to crashes any time the hardware domain is not direct-mapped
>>> (e.g. cache coloring and non-Dom0 hardware domain):
>>>
>>> (XEN) Xen BUG at drivers/passthrough/arm/iommu_helpers.c:47
>>> [...]
>>> (XEN) Xen call trace:
>>> (XEN)    [<00000a000024c758>] arm_iommu_map_page+0x80/0x90 (PC)
>>> (XEN)    [<00000a000024c750>] arm_iommu_map_page+0x78/0x90 (LR)
>>> (XEN)    [<00000a0000250884>] iommu_map+0xcc/0x29c
>>> (XEN)    [<00000a0000288024>] vgic_v3_its_init_domain+0x18c/0x1e8
>>> (XEN)    [<00000a0000285228>] vgic-v3.c#vgic_v3_domain_init+0x168/0x21c
>>> (XEN)    [<00000a0000281dcc>] domain_vgic_init+0x14c/0x210
>>> (XEN)    [<00000a00002705a4>] arch_domain_create+0x150/0x1f0
>>> (XEN)    [<00000a00002055e8>] domain_create+0x47c/0x6c0
>>> (XEN)    [<00000a00002cf090>] create_domUs+0x7f8/0x8cc
>>> (XEN)    [<00000a00002eb588>] start_xen+0x8f4/0x998
>>> (XEN)    [<00000a000020018c>] head.o#primary_switched+0x4/0x10
>>>
>>> Specifically, non-1:1 hardware domain exists with cache coloring
>>> enabled. For that, is_domain_direct_mapped(d) is false but
>>> domain_use_host_layout(d) is true.
>>>
>>> Change the is_domain_direct_mapped(d) checks in arm_iommu_map_page and
>>> arm_iommu_unmap_page into domain_use_host_layout(d) checks.
>>>
>>> Drop stale in-code comment specific to grant table mappings.
>>>
>>> Fixes: f9f6b22abf1d ("xen/arm: Map ITS doorbell register to IOMMU page tables")
>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>
>> Reviewed-by: Julien Grall <jgrall@amazon.com>
> 
> Thanks for the review! Is this ready to be committed?

Tested-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks,
Jason

