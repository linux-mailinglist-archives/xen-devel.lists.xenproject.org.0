Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 456A09C7362
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 15:20:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835749.1251607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBEDZ-0004eh-8U; Wed, 13 Nov 2024 14:19:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835749.1251607; Wed, 13 Nov 2024 14:19:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBEDZ-0004c3-4N; Wed, 13 Nov 2024 14:19:37 +0000
Received: by outflank-mailman (input) for mailman id 835749;
 Wed, 13 Nov 2024 14:19:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IlJA=SI=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tBEDX-0004bs-8J
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 14:19:35 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20621.outbound.protection.outlook.com
 [2a01:111:f403:2406::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4861fb43-a1ca-11ef-99a3-01e77a169b0f;
 Wed, 13 Nov 2024 15:19:25 +0100 (CET)
Received: from DS7PR05CA0032.namprd05.prod.outlook.com (2603:10b6:8:2f::31) by
 MW5PR12MB5622.namprd12.prod.outlook.com (2603:10b6:303:198::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Wed, 13 Nov
 2024 14:19:20 +0000
Received: from CY4PEPF0000EE33.namprd05.prod.outlook.com
 (2603:10b6:8:2f:cafe::d0) by DS7PR05CA0032.outlook.office365.com
 (2603:10b6:8:2f::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.16 via Frontend
 Transport; Wed, 13 Nov 2024 14:19:19 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE33.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Wed, 13 Nov 2024 14:19:19 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 13 Nov
 2024 08:19:18 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 13 Nov
 2024 08:19:18 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 13 Nov 2024 08:19:16 -0600
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
X-Inumbo-ID: 4861fb43-a1ca-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQwNjo6NjIxIiwiaGVsbyI6Ik5BTTAyLVNOMS1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjQ4NjFmYjQzLWExY2EtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNTA3NTY1LjQyODE2Niwic2VuZGVyIjoibWljaGFsLm9yemVsQGFtZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kjysmUE9YCGNONQ51p2RiSM9sgPVpjNySdmz+mcqCBp5mA5MF4nvU5LaeFMo5jK3bDMk20L3hpPQlRxTmBjzAWK1guc3chLW4vAY50oWpfKu4BzcddnaAdTV+fdRzG4hveN4ZReoulFwSmlNEJ3jA1isiHexOCf+wv9XGPSa3s0hqOMerSB26ZKZwJkJBPn5Sv4NdpZg3fa2WqhT/JJE1LGzeEXSvRqpmWd8hSrlu6Y2lNAmPqj6d+slnSS/ZAGxW+zoZfoBevm7uQIjZwC8eSOCOhMgLs5zIGdH9DYCC1298JnRReaRz7iUrJV8j/f+KLGLXGNL1kOnKHfZvUqwrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PJKqeXrAls+ee3wBlGOtBpvFHik+dM3ypnTBD2/+KGM=;
 b=Nbk0qxqvRLYPdpDuZKPfYVek2dj2hVihTDC5Q90m+m11ZzA1k6jlo4dTxuBNP+DnprbQdbBLlYbfOCvAIqbJ/0jkZ4JBxl47WdPhJeDPwHtatKSJZ43pz2C43bGCHDHjiIyFauuTpyfR5PLreKSZO8iiRr24/IDb51nzW9kDb5Xu7M9qZAdpyQV/Ff52IJkpiqvAaGJYcLCrq7a4PmlEJqteZlBM2cVuz1THVEFDeF2hjrIHFkdA+E/oSamJI4/amqwwes1gBbcmlSfvWuuH9goj1HQ6pKDzAr58uJTQMm2vHYHt7P/KScwGZAj6OQaa2BPZAEzgQ4+26LGODM8PvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PJKqeXrAls+ee3wBlGOtBpvFHik+dM3ypnTBD2/+KGM=;
 b=Ic0dXlnQumMF0FrjEwHwh115LOeZrGRFVoXO+YXpCXPC0Yxt55Y40WUToNRQ64Ows4EZOq77FGW+rWN+yHIOqDCfQWoYQzG6PkWMTWeIqBv2r+vKO6RUsv3BTfA0mLSlYQ/hwqtkOj21Tj+/vE11xzK0/hZAUHCHqXKbPJS2d3Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <d87bd0a7-0dc8-44a9-b43e-04a166cb0b6d@amd.com>
Date: Wed, 13 Nov 2024 15:19:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/device-tree: Allow exact match for overlapping
 regions
To: Julien Grall <julien@xen.org>, Luca Fancellu <luca.fancellu@arm.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>
References: <20241106134132.2185492-1-luca.fancellu@arm.com>
 <d9ad0972-2fd1-40ef-a11c-d56e102fef38@amd.com>
 <c6ba416c-5781-4f23-8623-5f30ce279a29@xen.org>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <c6ba416c-5781-4f23-8623-5f30ce279a29@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE33:EE_|MW5PR12MB5622:EE_
X-MS-Office365-Filtering-Correlation-Id: 41bc6f8a-ccaf-4926-18d2-08dd03ee299f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cktCcjkyZm84NmhmYnNVVW1mMzBvVUtzMkpSMTBZNk1xUUJaVUhpUk1PTS90?=
 =?utf-8?B?TFVwZzMwNG55V3MrUUFERmdPeVZ5a1E1QkxWN296SlF5a2pvTk82UzNFN0Nj?=
 =?utf-8?B?c2tudU1WM0dJS1BkbTVKM3Q0U2F5NlpVOWIzTnVjWDBkSC9DbGMvdDFmSnBm?=
 =?utf-8?B?NWZ6NGN2OXpSWVBYVlBzNVBOV01BazNseDhGaGVMTTRvd1liNTkyUmxXYVkz?=
 =?utf-8?B?UExTbG12SGIzSVJlZWE3amo0WGlvck5PL1k5MjVZUVFZT29vUGE4WmdyYjh1?=
 =?utf-8?B?M1l6UlQwRTNEY3ZBby9rWmxKODQ3S1FlMnIxZVppcStHeWQ4UlpETUFXSThz?=
 =?utf-8?B?RSt4UHUvSEVmNE1nRzV5NThsemszZmVPY3NNNWhIL01qN29mWTIweHFzSkZX?=
 =?utf-8?B?ZWphUUdvNkhLTEk4NWtIQmdGMEhFV3ZxRS8xeTdJQmplWUp3Z0N1Rmt4UEZB?=
 =?utf-8?B?MHk3VVVlUUpuUmZrdWNJSHUyV2Jtc2hxS0FDQStGWDNobFROei9RVTNLOVBp?=
 =?utf-8?B?VTNUZ1k4YTdmOGtLRlZjMnpWdEt4djhtSXkzSll2NGlvTVdLaVJ0UnBGUUJI?=
 =?utf-8?B?R1pqSVNWQ01zVktQMk5YSWk1YXBNdVJETi9hZTFmWjVCYnlSc3NmNlJOaWhk?=
 =?utf-8?B?MjhHTVduM2RsbXFTdDFGVHRuMURUTFZRWVhQamkyKzF3SkVsc2R2cXhwS0V1?=
 =?utf-8?B?ZS9JZkhMRTMwV1BGclJaSm8vN21Pd0doVm5OWGJxM2doNFZPdGlld2V2eUtR?=
 =?utf-8?B?QW1iZGc5dEtJZEtPTWc0K3RsWG9WVndxWDMvVHg3dWlNbC9ZTnhWbTVYSjk0?=
 =?utf-8?B?TnBSeC80K2xaR0hRdnE1elkrQzhjT1JueFViUjROUE5jMEJ4blhQOGhCcUdp?=
 =?utf-8?B?alhEKzY4MW5UdlNqRjNiUkhiZ3ZDdS8rWXV5dnZUelBNa3ZpemRxWjJDQytB?=
 =?utf-8?B?TzZxREF5Q2dMZGpmaW9FS3R2b1FJRjRnRkgwZlBmVGZhN3JBSmtyM3orVEZC?=
 =?utf-8?B?Tm03ekl5NWk3b3FyZUo5R0d2c1JSY3grMkRnRlRnMEpoWmgyM3dDbG1JOTF0?=
 =?utf-8?B?SERzS09XQTNtYlVUaEJrZVdtQmI3TkYwOVhYN3hvYzlQaS9nTzB4OWl0MTU3?=
 =?utf-8?B?WXJSK1V5cDhSVE5IUHp6a3pwa1NUZVRucHNONmlaQXhuNzRxTDhoU1JQdFlp?=
 =?utf-8?B?UlQxbkZBSm8xRWROd0pPeEp6Y0JhckRNOWU2OVZPY3dXTm5FZGx6S3djenNF?=
 =?utf-8?B?ZzNhdkdES1A0SHdpdlBIV1Rra2t3Q0pCUDZyNFI0ckdwS2FOZzBUM2g0cm4r?=
 =?utf-8?B?QVF2dVozL2tuenhpckkyVmREdU4rOTd5WmVLV2ZpeWFrdEJadU9EYXVkeHEx?=
 =?utf-8?B?czFJVDNVdGxXOHJVaE9EZExRWkYvcEFYTGpxY243Z1AxT1JCbVV6QVVNRXdP?=
 =?utf-8?B?T2orM1kvME1CZElLc0JTYktPVURqK1pmRk1WUjVnaTFiNGxJVXN1Uk5BMzNj?=
 =?utf-8?B?dHVPZ3BRWVBTS0JEclFtN21SbitFMVRRTzlxcmU5UEFMYXNIWTZLTFljYlVL?=
 =?utf-8?B?aENETjdlZnByVUZ6NzBBL3dIQmhLRlM5TXNDUzVoL3U5WUtYVmxWNW9XVXN3?=
 =?utf-8?B?OVE1LzVmdG9uRHZXdmlnMXFmWVpCczJsd2JrcER3Kzc3Q2lBUWZtRGhYSlFm?=
 =?utf-8?B?SXF2bXplUE5Vc3RObVFXejc4OW5hODU3UE9aMFc1cWFobzlidzkrL3JJWG9n?=
 =?utf-8?B?NWFPSENjVjk5VEtDSkxPSkN2OVpvYXJWMFZZMURYUkthRDlvUUd5enI0eHNI?=
 =?utf-8?B?NTZSdW5zRXA2bUtDaDdKeGQ3Q1VKTi9INloyRTZnaFNpZDhWQXM1V1QydFJo?=
 =?utf-8?B?MVI4UGM3Y014emYrY0pRS2UveW9ZYUNPR3A1VkFnTDdMMUE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 14:19:19.0152
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41bc6f8a-ccaf-4926-18d2-08dd03ee299f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE33.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5622



On 13/11/2024 14:50, Julien Grall wrote:
> 
> 
> Hi Michal,
> 
> On 06/11/2024 15:07, Michal Orzel wrote:
>>
>>
>> On 06/11/2024 14:41, Luca Fancellu wrote:
>>>
>>>
>>> There are some cases where the device tree exposes a memory range
>>> in both /memreserve/ and reserved-memory node, in this case the
>>> current code will stop Xen to boot since it will find that the
>>> latter range is clashing with the already recorded /memreserve/
>>> ranges.
>>>
>>> Furthermore, u-boot lists boot modules ranges, such as ramdisk,
>>> in the /memreserve/ part and even in this case this will prevent
>>> Xen to boot since it will see that the module memory range that
>>> it is going to add in 'add_boot_module' clashes with a /memreserve/
>>> range.
>>>
>>> When Xen populate the data structure that tracks the memory ranges,
>>> it also adds a memory type described in 'enum membank_type', so
>>> in order to fix this behavior, allow the 'check_reserved_regions_overlap'
>>> function to check for exact memory range match given a specific memory
>>> type; allowing reserved-memory node ranges and boot modules to have an
>>> exact match with ranges from /memreserve/.
>>>
>>> While there, set a type for the memory recorded during ACPI boot.
>>>
>>> Fixes: 53dc37829c31 ("xen/arm: Add DT reserve map regions to bootinfo.reserved_mem")
>>> Reported-by: Shawn Anastasio <sanastasio@raptorengineering.com>
>>> Reported-by: Grygorii Strashko <grygorii_strashko@epam.com>
>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>> ---
>>> I tested this patch adding the same range in a /memreserve/ entry and
>>> /reserved-memory node, and by letting u-boot pass a ramdisk.
>>> I've also tested that a configuration running static shared memory still works
>>> fine.
>>> ---
>> So we have 2 separate issues. I don't particularly like the concept of introducing MEMBANK_NONE
>> and the changes below look a bit too much for me, given that for boot modules we can only have
>> /memreserve/ matching initrd.
> 
> How so? Is this an observation or part of a specification?
Not sure what specification you would want to see. It's all part of U-Boot and Linux behavior that is not documented (except for code comments).
My statement is based on the U-Boot and Linux behavior. U-Boot part only present for initrd:
https://github.com/u-boot/u-boot/blob/master/boot/fdt_support.c#L249

For things that Xen can be interested in, only region for ramdisk for dom0 can match the /memreserve/ region.
Providing a generic solution (like Luca did) would want providing an example of sth else that can match which I'm not aware of.

~Michal

