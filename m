Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D798B1842
	for <lists+xen-devel@lfdr.de>; Thu, 25 Apr 2024 03:02:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711753.1111978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rznVL-0004xX-Pe; Thu, 25 Apr 2024 01:02:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711753.1111978; Thu, 25 Apr 2024 01:02:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rznVL-0004vT-M5; Thu, 25 Apr 2024 01:02:27 +0000
Received: by outflank-mailman (input) for mailman id 711753;
 Thu, 25 Apr 2024 01:02:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HNrt=L6=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1rznVK-0004vN-0Y
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2024 01:02:26 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20601.outbound.protection.outlook.com
 [2a01:111:f403:2407::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79ebeb4e-029f-11ef-909a-e314d9c70b13;
 Thu, 25 Apr 2024 03:02:25 +0200 (CEST)
Received: from PH8PR20CA0024.namprd20.prod.outlook.com (2603:10b6:510:23c::19)
 by LV8PR12MB9264.namprd12.prod.outlook.com (2603:10b6:408:1e8::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.23; Thu, 25 Apr
 2024 01:02:22 +0000
Received: from CY4PEPF0000E9D0.namprd03.prod.outlook.com
 (2603:10b6:510:23c:cafe::1c) by PH8PR20CA0024.outlook.office365.com
 (2603:10b6:510:23c::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.23 via Frontend
 Transport; Thu, 25 Apr 2024 01:02:21 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D0.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.19 via Frontend Transport; Thu, 25 Apr 2024 01:02:21 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 24 Apr
 2024 20:02:19 -0500
Received: from [172.31.124.47] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 24 Apr 2024 20:02:08 -0500
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
X-Inumbo-ID: 79ebeb4e-029f-11ef-909a-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XdcClE37D9+/RPsLwTD7M7MKE4g7b2ELbZJIhEE2RnY9qPy0Yi8qRaXd0PvxFGDrrJzQ452+7pqOU/qgignYbIrmsY25iyikHHAsDbjo2Xtt9/3T30z6wQyGS1SesncIoPDeKVUhovYAX5XtaVh2IMVCn5nNC2gp7jfXX19f6RjqrfbGuzHMfaSjE2rAiX0CH0jCS9NvoA879axrq4nrrZh5SjGfCAk/VzSX+YrXhxt/ZDSxlYf59u6jgKjkWyFZqSrHRkx75FNTv7U5HviaiSq+bEMfe9BvyiwJzjqhlIs8/0YEmOFs8JVQyOvccGAl8BZVo5znwSm/trKtP1h5Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XsgmqaFZXQKMwMS2Vv/ByvyZpviQmVP6xXgrWBRj1G4=;
 b=gNK8cZrErClZPNMHexzfFKTq8mjYaf9Jsg1JYxk5ekiVjYvN4oxUg35nsbztw3iP3FhObEloVNsQ7Pe3EHo6d6NmznboM0e4/WcUNClfqIqnpBiXB4BxoTd4gPMMa90z1WtTTU5zOgV3ar36ojReYj32Ow0Jbx2JBMimQozMgliH4UTUgxOo00DQT+eFnwsz/7J/zDrLYiAbzwFgyopCG4PDHUwj7ovjXbqRB7LoKJzsTnmQOLp8UnA3MMzRAZGEQTDoBJs2Lma8WNdT1hXdPKjcZ7iEVDKuF1MWjQTA44UAWleB2gmP96v7yBA9ECfKr8Bp3GgMHw9xEmk258iiMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XsgmqaFZXQKMwMS2Vv/ByvyZpviQmVP6xXgrWBRj1G4=;
 b=L4YLo18YRecpqQmsb8Jl/7u3zrkB52G52GHKdDRwasSSAfe8oCHsA2uSnkVMByq7GGUNTKjpQHIklvSODnAUqx4UwlsOYFjYcDyi+H2i/MlJT8UeK1tIj3FoB3bNFPt0eE1PmMCnF32h2JmxkY4hKeCIvmXSpwf5vXz+sTVqCIA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <00da7b6f-5712-44e5-8325-258dfdd0dfd3@amd.com>
Date: Thu, 25 Apr 2024 09:02:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/15] xen/arm: Always enable IOMMU
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>
References: <20240424033449.168398-1-xin.wang2@amd.com>
 <20240424033449.168398-4-xin.wang2@amd.com>
 <fe0a39f3-f737-4df3-85bf-836b51fc8942@xen.org>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <fe0a39f3-f737-4df3-85bf-836b51fc8942@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D0:EE_|LV8PR12MB9264:EE_
X-MS-Office365-Filtering-Correlation-Id: a32164d4-dd69-4d16-57ba-08dc64c35c65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|36860700004|1800799015|82310400014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YUdMbi90TXIram9aeGV2eUlZUUt6Q3JtYS84Ynk5TkIwOENGNkJiTXhpdSto?=
 =?utf-8?B?dnRBNGVtTlpVTGd6RVhJbnVNTk9rZDNDYTBSdXI3Z1poQVAwOGU3S1M0VUpn?=
 =?utf-8?B?NjcyNklGRmx0cldpN3AwWEwwd3h3VU9VdXBiT3hkZ04xVFhvNFF2T0V5L0xt?=
 =?utf-8?B?UEh4VkNERW5qYVY5elRTVWhHdE9BKzB6SHFVWnE0NlBxY0V3S0lXUElmR2Rq?=
 =?utf-8?B?Mytid0g4MmQ4K2dQenc2OEx0WW9Jd3NRRk00V0daOUk4b1kxNkFGU2N6cEs0?=
 =?utf-8?B?ZzE0eFpEbTM5ZDg2VXpCRkIwMkdYaXhvckh1eS91U3NlTXh4NDhyaWV5RU5J?=
 =?utf-8?B?eHNVV2lLNHFmVkNkclkwMG5tRFdHS1prVE12WHZ2YmJZVVhQWFQ1TU1VTkN2?=
 =?utf-8?B?SU5PZC9qRFZhY3VUZzFoeFB5VGhVemx0aGxrN2pwNWRnOE9PYVlWL0NXOW1h?=
 =?utf-8?B?NWhBeWVZdWw0UE90eFNhMzhtNnRHK0dyQXlleVJtb0JkOHMvU0praGlMbWJR?=
 =?utf-8?B?OHI2aTNBV2xRVlFlOTJmK2VETHR4Smw2K1l3dGd0M2FJMGhmU1JNc2ora3RM?=
 =?utf-8?B?Z3lBVm5WRWFzbklQdlZ1aXAxODYvZUFSQ3Q3Z203S3lqbFR3WTRqKytRdncr?=
 =?utf-8?B?Y3RyUVZnQW81OVIyVkx5cXVhNURnVG1XQi9SWmFSWWF1R0MzQ3Fha2k0eHRU?=
 =?utf-8?B?OFpsODBvTXd4UHVYTmNHNEZsWTlwMEZBMGhaZjh6amQwcEJJTWl4aTRKYits?=
 =?utf-8?B?aHlyc2hVR0xwQldXalFOTXVoSCt6QVp0b0prQWNzci9wQXIxZmxBVW9ad1Uw?=
 =?utf-8?B?bmhJaEJYd3lhL0NLYkQzYTNnTDFQWFE2WVR6UzNONE9xSW9BVjdPM3BGOFA3?=
 =?utf-8?B?cUp4STFrU1FzYkk3WE5XL01WUjcrb0FySkZqSytVeGxwKzlzNFZqbElGd3c4?=
 =?utf-8?B?SFJtV2g1VXEyd0VxTUNFZmVHSTQwNjBJaktMN3gwcmZBR0J1a1U4b21scDdR?=
 =?utf-8?B?UXNoN2ZvVHVWTWVoekpiS0M2TlVuWTd1SDZWSkcyNG55S0c5RTF5QTFoM2sz?=
 =?utf-8?B?NDRwdEVqNGJRRWg3Z1NacFhZenVUUVBORWpQRzZ6NG1aaEttMHBFSkRNMUJY?=
 =?utf-8?B?cDdsdzIvbnduMmc2S0hLRVM5WEdaZVM3NkgxQU9hK1NSQmxISW5ZL1h6UEZl?=
 =?utf-8?B?bEhyZ2ZQTnhPRFVSelIvdE1UMHFJUE5sUStKWE9yNnc4dEUrNGVWb0h0Wkta?=
 =?utf-8?B?WW1DQUc0MUQ3cFpvZTV4bUh4NXgvRnl3ZFBzYUhUQ1RreHFLOTZoTGIyTGZI?=
 =?utf-8?B?eW43aFpIczhOMDlGZlRSbjVHa0ZoL0kwTXFqOVlZN3g3Qm8wZHFLZ2dySW9S?=
 =?utf-8?B?RFp3b09lS2VnTm9ZNitlSEc4NW5FSEZqNWc4dWhHaktDNWtSOWVHc1hQTWVm?=
 =?utf-8?B?a1pQdGhCK3habW5lZjhjTHhSY0lEQ015cWpoQWJ5T0N3YkNOYUhRemlMYzdv?=
 =?utf-8?B?blFhZENoMnYwd2FoYkd0TWhtWkVsS2RsMUQ0blFQK1lLRTRTb3c1ZXIxS01F?=
 =?utf-8?B?blA0TEdoeTJUemJSdDNYT3pNNm1wTnhvQ0E5MC8za1pWRGw1aEN5a1ZkamJ5?=
 =?utf-8?B?RG03Um11QUNxSnJuVGhQaWJBd1VQNmh1Nm5zVjZ3RGsydGxxQjJoS3JRcHV4?=
 =?utf-8?B?YTUyQ0ErUXZCZGRzNVliVmtpNENPNWZycnNvQkhmM0JxM3VjTjVjajhTdlZZ?=
 =?utf-8?B?UHlpdXRJOURJdWY0SmszaTlpMGxIOWNCTHY0SUVHS0tueW1Xc2NqZ2xKUm1u?=
 =?utf-8?Q?LVdY6C8i6K9T+dxsPEdDnXyYpJG+Y7VU88lhw=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(36860700004)(1800799015)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2024 01:02:21.0219
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a32164d4-dd69-4d16-57ba-08dc64c35c65
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9264

Hi Julien,

On 4/24/2024 9:03 PM, Julien Grall wrote:
> Hi Henry,
>
> On 24/04/2024 04:34, Henry Wang wrote:
>> From: Vikram Garhwal <fnu.vikram@xilinx.com>
>>
>> For overlay with iommu functionality to work with running VMs, we 
>> need to enable
>> IOMMU by default for the domains.
>>
>> Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
>> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
>> Signed-off-by: Henry Wang <xin.wang2@amd.com>
>> ---
>>   xen/arch/arm/dom0less-build.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/arm/dom0less-build.c 
>> b/xen/arch/arm/dom0less-build.c
>> index fb63ec6fd1..2d1fd1e214 100644
>> --- a/xen/arch/arm/dom0less-build.c
>> +++ b/xen/arch/arm/dom0less-build.c
>> @@ -894,7 +894,8 @@ void __init create_domUs(void)
>>               panic("Missing property 'cpus' for domain %s\n",
>>                     dt_node_name(node));
>>   -        if ( dt_find_compatible_node(node, NULL, 
>> "multiboot,device-tree") &&
>> +        if ( (IS_ENABLED(CONFIG_OVERLAY_DTB) ||
>
> Similar to the first patch, building Xen with the DTB overlay doesn't 
> mean the user will want to use it (think of distros that may want to 
> provide a generic Xen).
>
> Instead, we should introduce a new DT property "passthrough" that 
> would indicate whether the IOMMU should be used.
>
> To be futureproof, I would match the values used by xl.cfg (see 
> docs/man/xl.cfg.5.pod.in).

That sounds good. I can introduce a new DT property as suggested. Thanks 
for the suggestion!

Kind regards,
Henry

>
>> + dt_find_compatible_node(node, NULL, "multiboot,device-tree")) &&
>>                iommu_enabled )
>>               d_cfg.flags |= XEN_DOMCTL_CDF_iommu;
>
> Cheers,
>


