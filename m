Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DB69EE1C3
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2024 09:47:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.855560.1268421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLeqU-0003wj-P2; Thu, 12 Dec 2024 08:46:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 855560.1268421; Thu, 12 Dec 2024 08:46:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLeqU-0003uz-MM; Thu, 12 Dec 2024 08:46:54 +0000
Received: by outflank-mailman (input) for mailman id 855560;
 Thu, 12 Dec 2024 08:46:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N7GE=TF=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tLeqT-0003ur-GJ
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2024 08:46:53 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20608.outbound.protection.outlook.com
 [2a01:111:f403:2409::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a04db2c5-b865-11ef-a0d5-8be0dac302b0;
 Thu, 12 Dec 2024 09:46:50 +0100 (CET)
Received: from MN2PR15CA0059.namprd15.prod.outlook.com (2603:10b6:208:237::28)
 by MN0PR12MB6224.namprd12.prod.outlook.com (2603:10b6:208:3c0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Thu, 12 Dec
 2024 08:46:45 +0000
Received: from BL6PEPF00020E64.namprd04.prod.outlook.com
 (2603:10b6:208:237:cafe::b3) by MN2PR15CA0059.outlook.office365.com
 (2603:10b6:208:237::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.16 via Frontend Transport; Thu,
 12 Dec 2024 08:46:45 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF00020E64.mail.protection.outlook.com (10.167.249.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Thu, 12 Dec 2024 08:46:45 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 12 Dec
 2024 02:46:44 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 12 Dec
 2024 02:46:44 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 12 Dec 2024 02:46:43 -0600
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
X-Inumbo-ID: a04db2c5-b865-11ef-a0d5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j2MwmssHVDexNZRCtHqFDtcmPqwzNTOyFmPD51mdbpiNbaELk91aHktMzXZoNhNh1z/eSSH5nOJKAiFVvCyvlcdodw1IFF7U/LZDadS4fGR+d0I+e9n23t/e653MDzto3VM2Yf5F+lXqBOfCMM2rEj8jzUaInfiLD85P2bKCzIxl1qvtnF64K7koNE0bz0HR3IuwyzBQrsL7uJVqJPho3tu3V4LrVA6d722braLA38MsFNVM5xKcUidFa8XCkmKTkwTAa3C+wYccg5vxWZOSZN7Z9cZergXXTLJSIpmrPd0knwXWActoV+VlxXmcrXPJgEMxxSBprksgzqGraNNsRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O9yoGP7yvMHXuM4AIFczLTZmyq3Qzgx8EZRBPMLyyhU=;
 b=pik9t/A44OIVJA7d7irOLs/Cl7NDyTBuQQeN5HdsIh2zvjHU5dMj03l4Nlp0k4f1udXC0Nst8ho6ySo298Gw+Ipk5d/tyvn3YL9sru6nQZRq4TDy0+M/E1ywR+N25NiFSlIt3r/uJquLAGeGAqtVAC8AnTcnMeIQ4J4Rbo2FUNa5Cdow0lyYqi1AF9FJkdKa/R2wMOQcmGiewcxkx6LWqDI+qvto7098ZmhsXysjfyF1EyibuZjvwEYfzvvcXPVrHzf5EKrUuxRtT74hTDZjoH0S9ZYF2EaWzvvwLN6N3V4QtWNvJRn+k+wCEVsuC2L2USvf88ecmiUaeoJpTQZEQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O9yoGP7yvMHXuM4AIFczLTZmyq3Qzgx8EZRBPMLyyhU=;
 b=VBs1u87URZ1MnPpS3TdIUjmN1+Wy4txeaHvo3iHUyDl2FS8rOT7n6V+3O/P9WlxaTRppst65KQwbhmLzobGjoytrByZJkwwrdllyUO8rulVKzdJiEOlCuvN0NYHnnArvd5D/asLqudQiZcYOUt50dmm+QYVvXF30DEe4cF2Dah0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <c902acd1-6512-49db-81ef-e87a6d10f781@amd.com>
Date: Thu, 12 Dec 2024 09:46:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm/domain_build: Make find_unallocated_memory() more
 generic
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241210101001.91578-1-michal.orzel@amd.com>
 <f91699f4-1c40-44df-abd1-baa7cef7554e@xen.org>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <f91699f4-1c40-44df-abd1-baa7cef7554e@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E64:EE_|MN0PR12MB6224:EE_
X-MS-Office365-Filtering-Correlation-Id: 6113cb88-88e5-4ab5-1578-08dd1a898212
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VW0zSEZySzhZQUtDVW5SVTBiUFFwM2RjMHpXQmNXT2UrVTNjMDYzaDlpWG9m?=
 =?utf-8?B?UUhxSTNJWWNZL3FpOVlaN3Z0QUM5Z2Z5NXlGS3MrSmZWYTZMcGdXM05DdTl3?=
 =?utf-8?B?T2VSSnNLdkJuWVlrSHF2QVN4SDNsMjlUVGUwbndUTXZyeHc5alJZdlczMEJN?=
 =?utf-8?B?SCtEU0cwLys3NjhCc0tGMGh2SjBZeDBad0NlU3l3MmMwNDROUVkwTXQvMm9q?=
 =?utf-8?B?ZkxqQTNXcm9EVFgzNGNrNHk2MUw0RzJSMEZNSSs5RFRoT2F2VWVOY0JPdy9Q?=
 =?utf-8?B?NVZyaENiWXl4K2ZEMGlMcVZDOFIwNHRNaG5vcWRPcy8zYXBlamttNWdVa0NQ?=
 =?utf-8?B?eUtVNXhNTTBtSmFkbHRSL240dkZVbktjOHg4Uzl1N3Rmb1Z0aDRiRnk4dnBU?=
 =?utf-8?B?cmIvMnFqV3lCc1dOKzNvSHFNT1JIcHp5eEFBeVRxdlVsNkZFV0hNd2Z5eE4v?=
 =?utf-8?B?T1UvWlZQcWdBcExBd0IvYW1jamdaSzdzdndxREozNGg4UEUydVZQNTlENFov?=
 =?utf-8?B?cCtNa0ZqR1RiNGdBMi81bndOcWNFQXJjN2VCZ2pwR0RHcm95QlovZ0ozL25S?=
 =?utf-8?B?aEd2YjlHczVHRDJGT3dHWlMzMlMzNHljZnRVTXZIdTdMK3VxbnRWZ1J0dHBZ?=
 =?utf-8?B?YnNHU1BEWXBJMmJCWFNCUys4MEhTdS9scU5xVTVRUG5MUHlSbEV0MDRDWnJH?=
 =?utf-8?B?Z0pyclZHNEE3ZnFtMnhaR3lrSW5KQ0Exb2FoODJUbWgrMEFOU0VGZU9IV3dL?=
 =?utf-8?B?SHVlV043MDFUT01Dbld1UmlTTXFjT3pxSmE1UUlBcmNFZ3pyVXZrOXNDTGNG?=
 =?utf-8?B?UU9XV05zWGtnblBib2ZCbjZnYTJ0SFFJZnNNNTcrdHQzMk11dFFoMWdyTWU2?=
 =?utf-8?B?dXMvYzJpajNDNmpzOUwzdUtLTmhmL1RQbmJVWFlxalBXZ05XQ0p0MStyZTJn?=
 =?utf-8?B?U1ZIYk80Q3kvMzgxMXBrOEpmdlE5L3JYTFJ5YlBGbXJIVk9vYlIvUHVwOUhR?=
 =?utf-8?B?Y2JVcGxqSStTbzFCTXE4bGRLRDZQVnc3SG9BUDRBbHloem9hVE1FRUlRU2Rt?=
 =?utf-8?B?ekVEV2ZYQlROeUQyZVFvUVZIaExBL0U2MVJhL2syQzRGZmE5QWNBbVVya1Jp?=
 =?utf-8?B?OFhkN2lhMVc0U1lyMEROakk2Nm9mWlQ5bzNnUmtIS0FweTU4NGh3MnZJb2RY?=
 =?utf-8?B?NDVrSkwvVHFXR0l0c0NtQWhudkZTL0pjc3RBR1Mzd0JVSGE4VjRsUG91SXBW?=
 =?utf-8?B?c21keDhDOG1UcFVFVzhHQ3hzNXkwNVBlS0xLY3dQWWJKd09xZE1iQ3pmQmU1?=
 =?utf-8?B?SzdkNFc2WS9YN1ZLdlkvNVJEMkRka01pMVhHYU82SnZBY2xkWVRTMFRheW1R?=
 =?utf-8?B?YXVtWE5TdHVoY1JJUVpBV1B6S2ZUM0tycHhJNElYUzc1TEYzNHRVN3ZNY1pN?=
 =?utf-8?B?SnlGUzRIVkdManlhNXpIS3R5WG82V1BxTitHR2Q0TEtleGJQUERySS9SdWcw?=
 =?utf-8?B?UmRKTUx4VzI2dUxsWXNqWnBsT05BN1lmQWRmYm5oaTltekhYdGI3ODJWRFNK?=
 =?utf-8?B?Qi9VVHRMUDJXbDVseDduRmQveFJqdm14VGZMSlJ0NXhscHRXdnBQVzFQdTc3?=
 =?utf-8?B?YWdkcXQwSWJ3NDgwL2U3RGU2ZjdlTWVJdko2Rk4wOWhDdVJrKzAxc3hYNDl5?=
 =?utf-8?B?WlA2TEsxS3U5RFZZUFdUbmRIT0JCaVJzKzIrRERNNTRUbE9adzM4SUtZWXMz?=
 =?utf-8?B?djh0TzVDRFpXenNjVjBsaW93Q0pQZXBNT1pRcVJtMGRaM0NHcklTSGJJSWRl?=
 =?utf-8?B?ZXpvM21WNHcwY3RNTmJyQnplWlhWWGdMY2JlWWVHZGYzZ1pmb2pMeDVOZGg0?=
 =?utf-8?B?dWRZNmZwRmU0Lzh4bVp3ZG00S2djM3A3K0dDbUFOVmo2OGROa01CVHlpREtC?=
 =?utf-8?Q?BaxuV39z3GISrvc6trIx5wfTW/fmmNB9?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 08:46:45.0918
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6113cb88-88e5-4ab5-1578-08dd1a898212
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E64.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6224

Hi Julien,

On 11/12/2024 18:39, Julien Grall wrote:
> 
> 
> Hi Michal,
> 
> On 10/12/2024 10:10, Michal Orzel wrote:
>> At the moment, find_unallocated_memory() is only used to retrieve free
>> memory ranges for direct mapped domains in order to find extended
>> regions. It is not generic as it makes assumptions as for the place at
>> which it's being called (domain memory already allocated, gnttab region
>> already found) and hardcodes the memory banks to be excluded.
>>
>> Make the function more generic, so that it can be used for other
>> purposes whenever there is a need to find free host memory regions (e.g.
>> upcoming LLC coloring series). Allow passing array with memory banks as a
>> parameter together with a callback to populate free regions structure,
>> as the logic may differ depending on the needs.
>>
>> Add find_host_extended_regions() to be called from make_hypervisor_node()
>> to contain the logic to find extended regions for domains using host
>> memory layout that are not permitted to use IOMMU.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> 
> With one remark below:
> 
> Acked-by: Julien Grall <jgrall@amazon.com>
> 
>> ---
>> This is a prerequisite patch for LLC coloring series patch 3.
>> For dom0 LLC coloring, we just need to pass resmem and gnttab in mem_banks.
>> ---
>>   xen/arch/arm/domain_build.c | 97 +++++++++++++++++++++----------------
>>   1 file changed, 55 insertions(+), 42 deletions(-)
>>
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index 2c30792de88b..500005079b88 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -901,31 +901,26 @@ int __init add_ext_regions(unsigned long s_gfn, unsigned long e_gfn,
>>   }
>>
>>   /*
>> - * Find unused regions of Host address space which can be exposed to Dom0
>> - * as extended regions for the special memory mappings. In order to calculate
>> - * regions we exclude every region assigned to Dom0 from the Host RAM:
>> - * - domain RAM
>> - * - reserved-memory
>> - * - static shared memory
>> - * - grant table space
>> + * Find unused regions of Host address space which can be exposed to domain
>> + * using the host memory layout (i.e. direct mapped or hardware domain). In
> 
> NIT: I would use "e.g." rather than "i.e." because in the future we may
> want to expose the host layout to a guest without necessarily having IPA
> == PA. You could also drop the part in () because one could find the
> definition on top of domain_use_host_layout().
I removed () on commit. Thanks.

~Michal


