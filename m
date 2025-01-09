Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3947A07280
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 11:14:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.868019.1279566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVpYO-0001Sv-2I; Thu, 09 Jan 2025 10:14:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 868019.1279566; Thu, 09 Jan 2025 10:14:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVpYN-0001Ps-Vg; Thu, 09 Jan 2025 10:14:15 +0000
Received: by outflank-mailman (input) for mailman id 868019;
 Thu, 09 Jan 2025 10:14:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KjpQ=UB=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tVpYM-0001IB-2j
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 10:14:14 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061a.outbound.protection.outlook.com
 [2a01:111:f403:2416::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 77f4c65b-ce72-11ef-99a4-01e77a169b0f;
 Thu, 09 Jan 2025 11:14:12 +0100 (CET)
Received: from SA1P222CA0061.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2c1::14)
 by DM4PR12MB7694.namprd12.prod.outlook.com (2603:10b6:8:102::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Thu, 9 Jan
 2025 10:14:07 +0000
Received: from SN1PEPF0002BA4E.namprd03.prod.outlook.com
 (2603:10b6:806:2c1:cafe::c2) by SA1P222CA0061.outlook.office365.com
 (2603:10b6:806:2c1::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.12 via Frontend Transport; Thu,
 9 Jan 2025 10:14:07 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002BA4E.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8335.7 via Frontend Transport; Thu, 9 Jan 2025 10:14:06 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 9 Jan
 2025 04:14:06 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 9 Jan
 2025 04:14:06 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 9 Jan 2025 04:14:04 -0600
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
X-Inumbo-ID: 77f4c65b-ce72-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ab02ybmYxKvATToXl40GWYegm2+nZvearUnHEZaMjETGPjiuiPgmMG6LgzuGENMj0PdoGSVgWfNxtlYwNCiNGkxoBNOop3WJWWuGd8Iw/ARDVISGiFSuu5Ya5Qxf8OHZgyGAMYTMd70A4s3XHz7nEUK3WOSV+O8f4YSFW0o/4GIC0bxutHai06rIMDrYAoKmfeqCAEUYC89f4hruY5vTa6ToTbMf61F6y6PsnDWEsUEJ6qvdNEsHNekxINXKAka9lUpcMf8biEb78xCjadY3pORoQknB9o6skj+C5mSxrPVweSnmMCXNj3P0mnKEIwWb9jKoqQGQgMZ2+0zLONuUcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=smSGo7rGlDa4wsFslbLmLVV+xJ4p3skBkc6e49gTV10=;
 b=T1v48u1rfOupiktmUrSpOAD1qvQTxqC4/RvAZM3NPsd6rPn8R4SivgzzCsahpchhgOM/PFW/ckm+mMX00nOUd5KpqaEo9MHUbKwS7sYRr0l5aGbw176bUz67I882C3nPT7YfOoQWSOMJBtu/uuFuqZ7bkXOSCR4hpYeYaggji4jQotBSxDd171JGj6sHVdFR9D10WABjmrQVP47qOWoRm3TVOmYP3EdYh+RufPbWugw+i0TdTaknvP9YPtTc529BYn/TV/6OToqe30ddfWYqskhYj0reLRA/nVdBEiB8IjKRqvxPDtMwJtwPk4i7A3in9Nv9aIaPLIGdZ0opjVvHhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=smSGo7rGlDa4wsFslbLmLVV+xJ4p3skBkc6e49gTV10=;
 b=2NSio8MB4ZUQyQcLSHlYLhyYc9fPf/5VClVofkhjzS4QG3qfifn3P6Ft5EpjM4yG1LaRq6Jz8dtMWa3BcAyjzfeCWb7V7eiH4QZLeamDyoC05Q/vn2rMjQHrGygQ8lXjRxL7j3u8ttHnRlHadHKSn2t1acIpCWsKT2zTFjHJK4U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <822cde40-a4a2-4d25-90e1-5421caa7b334@amd.com>
Date: Thu, 9 Jan 2025 11:14:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/arm: Fully initialise struct membanks_hdr fields
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Stefano Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	"Bertrand Marquis" <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20250109092816.1619834-1-luca.fancellu@arm.com>
 <e9477b85-1c9a-4aa6-b7fe-90286fcd461b@amd.com>
 <7D68D11E-E4EF-4521-9017-112DAA2B9B11@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <7D68D11E-E4EF-4521-9017-112DAA2B9B11@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4E:EE_|DM4PR12MB7694:EE_
X-MS-Office365-Filtering-Correlation-Id: c2acadff-81bf-4aa2-fcc9-08dd30965a0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aGZ2RE00dzlEWHFDTW51YU5YWEgwWW9iemF0RG9GN0RVWWZNU3dMR2s0K3dt?=
 =?utf-8?B?Nnh4emRUQ1VYVnZ4N1ozUTVlZXB5dmEyQWZMQ3d2QUFGLzUzR3RoVlZtK0Qr?=
 =?utf-8?B?ekVVQ25GaCtGWVQ5ZFEwMWNIWUVuVTJ2T2JRYWUxZkc1NmVybXNPU0ZmT0Jm?=
 =?utf-8?B?Q1VyRnNPaUJWQnVHUHpWSWNXZ1M0WTRpVVZab2xkZUw5RmxtYm92a2g5aVlP?=
 =?utf-8?B?NCtiV2E3UTA0NDBUaVNuWHRJU1l3cE13aXBxRnZXenBSK29KNFZidW40N3dE?=
 =?utf-8?B?dHBodVI5WW84RWszTWo2WVZMUTVRbHZTMFdjL1lXMUg5OGZsVmtOVG1ENGps?=
 =?utf-8?B?NGRrSk90MEtZK3Y2MGNVU1NxMklsYlVNRm1udkttVG9kYXkzazlWY1VteGJ3?=
 =?utf-8?B?Mi91N2I1MmtZd2Q5NHB1dGwyTGJNVjJaSWZBL0YrTlc3cUx2M1Fqd25TVGxD?=
 =?utf-8?B?TXNqTXE2dnN1MDIyVENUYTVOZTF3cW9uM0l3MVYxamk4Y21mMERzcllRL1pI?=
 =?utf-8?B?Sm5qS29NZy96WnRNUGk1a3RtUkhTTGthSXpWaXZacWRTelRNa3J4V1YyVzd1?=
 =?utf-8?B?WExDNkQ4ajhYcG96WEVYTTdUZVM0WFphdE5LZVZyVVRFdFZpaHhhSlg0aE1O?=
 =?utf-8?B?M3l6SFNlNVN4VGtTekk0aklJUWpnOWovZXZKSk50YlQ4YzNNd2JoUVprZzZa?=
 =?utf-8?B?L2pKUlJ1YkRlUnY3U09qOGVqMmQyV2k4bHdWeDdjcWdQbXkyY1pCVENrVjNv?=
 =?utf-8?B?S1ZZa2ppQVRFUUtpbEhNNUxwOWJGZ0V5eU1YL2c2TklxLzBJcm1KYmJHYmZm?=
 =?utf-8?B?VUFBb3JDUE1IeFlQbnJJVkVWMmY1QUswUkFwWVFQV2hreVh6dE1Jemx5LzFV?=
 =?utf-8?B?YjN0QVdoN2hXczBQdlJ5dTdCeXFFV0pnR3dIcXlrT2ZobU8vc2QraFA4aXJI?=
 =?utf-8?B?RncxRHVhVldaYWRKMXRSZkhORURBYU93eHdpZGJ2N1ZtSmZQYzkvRlRUK0dI?=
 =?utf-8?B?WW5uMWkwWktoa2J3eGpYbHZVWGZBMzg2S3ludThtV0R0eXFHSGNIcDVOSVZw?=
 =?utf-8?B?OHdzaUc0S3A5YXVzbERxdFlZOWZkQnNTTVVnWHpyNXFaVTBHcDhUT2dhcy9Q?=
 =?utf-8?B?dXYwZWV1UVNoODd0eTc2SzVqUWFaTUg2ZVYxR3dheWFUbmd3WlRLM0QzdUlp?=
 =?utf-8?B?dHhIOUk1M056em5Wbm80bGpHS3Q1VkFXMDl5Q01tNzB3U0dETitwR0p0ZXNI?=
 =?utf-8?B?L3piS3JGa1owS2FYYmR1U2ZCRmo4bS9PVmtJeVR5cUZGODlpZTZuYWhWRlZ1?=
 =?utf-8?B?Z29rZGY1WVJNSWU4ejFPc2Y5VEZvRWlBa212Q202djltUTY1UnlBc3dPRkRB?=
 =?utf-8?B?MUM3MnFTL1B6ZlV2QkdZSi9OdU8rSFJmd3ZnRG1mdXc3UXk3MWtwRUdMNXJ3?=
 =?utf-8?B?b1Vwc2lWWWhtbHg5SU9RcUxHVlY2endUMXQ0aW1iWGw0aWw1Y0Z1c3hoVGdj?=
 =?utf-8?B?VWNFbmduK2krM00xakxGN1pYbkhMUjU2R05WOEZ2eGJLYVdWQWtsVFpUeEV3?=
 =?utf-8?B?ZGNZNG9ZNVpBcDN0UTJIT0V6U0FyUVFHeDlhdWVZVFMyaWduT3N2ZElmUTNq?=
 =?utf-8?B?OUhsOE95N0hweUdOYWhUejl4NDNjbTBraTN0Zk9OZ0NZNGFRL2tSVmtMcGVz?=
 =?utf-8?B?ZUUzVGdyeEZFT3RXa2hjcGpkZ25IQlhSUVBpRWRHaDNJQWZ6QTcraXEyUk1O?=
 =?utf-8?B?SlZIeThiZVRCN1NNRmRZTUlmWVNJbUdnUnFvUzNaYlVKWVI1SUx0cjlMOWFu?=
 =?utf-8?B?WXdkOUxRWUpGdmNaZjBISFA0MWQyZysrMks1MFB2bmpBUFltTDhTcmpBTm1h?=
 =?utf-8?B?dXBVRHYvYmdlNGJwQzYrbG1iWlZHUHA3M0ZUVXUxajI0NFFKN3hrbnhQSlB5?=
 =?utf-8?B?b2d2S0YzYmdJS2cyeVhmSXlOMExyNVhVbnBTUWl0RkxZYW15SXU3Vmx4MHd2?=
 =?utf-8?Q?nsD3DpGqqAIeAcY6VDGraXyljRLVwg=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 10:14:06.9659
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2acadff-81bf-4aa2-fcc9-08dd30965a0b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7694



On 09/01/2025 11:09, Luca Fancellu wrote:
> 
> 
> Hi Michal,
> 
>> On 9 Jan 2025, at 10:00, Michal Orzel <michal.orzel@amd.com> wrote:
>>
>> Hi Luca,
>>
>> Is this patch for 4.20? I would say so, therefore it should have "for-4.20" tag and Oleksii as release manager
>> should be CCed. Doing it now.
> 
> Thanks, I forgot the procedure
> 
>>
>>> ---
>>> ---
>>> xen/arch/arm/domain_build.c       | 13 ++++---------
>>> xen/arch/arm/include/asm/kernel.h |  5 ++++-
>>> xen/arch/arm/static-shmem.c       |  3 ++-
>>> xen/include/xen/bootfdt.h         | 16 ++++++++++++++++
>>> 4 files changed, 26 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>>> index b072a16249fe..9e3132fb21d8 100644
>>> --- a/xen/arch/arm/domain_build.c
>>> +++ b/xen/arch/arm/domain_build.c
>>> @@ -1039,7 +1039,7 @@ void __init allocate_memory(struct domain *d, struct kernel_info *kinfo)
>>>      */
>>>     if ( is_hardware_domain(d) )
>>>     {
>>> -        struct membanks *gnttab = xzalloc_flex_struct(struct membanks, bank, 1);
>>> +        struct membanks *gnttab = membanks_xzalloc(1, RESERVED_MEMORY);
>>>         /*
>>>          * Exclude the following regions:
>>>          * 1) Remove reserved memory
>>> @@ -1057,13 +1057,10 @@ void __init allocate_memory(struct domain *d, struct kernel_info *kinfo)
>>>         gnttab->bank[0].start = kinfo->gnttab_start;
>>>         gnttab->bank[0].size = kinfo->gnttab_size;
>>>
>>> -        hwdom_free_mem = xzalloc_flex_struct(struct membanks, bank,
>>> -                                             NR_MEM_BANKS);
>>> +        hwdom_free_mem = membanks_xzalloc(NR_MEM_BANKS, MEMORY);
>>>         if ( !hwdom_free_mem )
>>>             goto fail;
>>>
>>> -        hwdom_free_mem->max_banks = NR_MEM_BANKS;
>>> -
>>>         if ( find_unallocated_memory(kinfo, mem_banks, ARRAY_SIZE(mem_banks),
>>>                                      hwdom_free_mem, add_hwdom_free_regions) )
>>>             goto fail;
>>> @@ -1293,7 +1290,7 @@ static int __init find_host_extended_regions(const struct kernel_info *kinfo,
>>>                                              struct membanks *ext_regions)
>>> {
>>>     int res;
>>> -    struct membanks *gnttab = xzalloc_flex_struct(struct membanks, bank, 1);
>>> +    struct membanks *gnttab = membanks_xzalloc(1, RESERVED_MEMORY);
>>>
>>>     /*
>>>      * Exclude the following regions:
>>> @@ -1374,12 +1371,10 @@ int __init make_hypervisor_node(struct domain *d,
>>>     }
>>>     else
>>>     {
>>> -        ext_regions = xzalloc_flex_struct(struct membanks, bank, NR_MEM_BANKS);
>>> +        ext_regions = membanks_xzalloc(NR_MEM_BANKS, RESERVED_MEMORY);
>> I'm a bit confused what is the expectations behind using different types of enum region_type, mostly because it can point to
>> different address spaces depending on the context. Above, you marked gnttab as RESERVED_MEMORY (I guess because this
>> region has already been found - but in fact it is still unused) and hwdom_free_mem as MEMORY. So I would at least expect
>> ext_regions to be of MEMORY type as well. After all both hwdom_free_mem and ext_regions contain
>> banks of unused/free memory (although former lists host memory while latter can also contain guest physical
>> memory). Could you please clarify the intended use?
> 
> You are right, that should be MEMORY, my bad! Could it be something addressable on commit or should I send another one?
I can do that on commit but first, can you please answer what is the intended use of enum region_type?
At first I was expecting gnttab to be MEMORY as well. I don't see a difference between a region prepared by Xen
for domain to store gnttab vs extended regions. Both specify regions of unused address space. It's just that the region
for gnttab must always be present but extended regions don't have to.

~Michal


