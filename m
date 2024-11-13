Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00EFB9C7968
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 17:57:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835930.1251796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBGfa-0004VM-8M; Wed, 13 Nov 2024 16:56:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835930.1251796; Wed, 13 Nov 2024 16:56:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBGfa-0004Ts-5f; Wed, 13 Nov 2024 16:56:42 +0000
Received: by outflank-mailman (input) for mailman id 835930;
 Wed, 13 Nov 2024 16:56:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IlJA=SI=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tBGfY-0004Tj-BH
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 16:56:40 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20605.outbound.protection.outlook.com
 [2a01:111:f403:2009::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 39e0b514-a1e0-11ef-a0c7-8be0dac302b0;
 Wed, 13 Nov 2024 17:56:30 +0100 (CET)
Received: from MW4PR04CA0253.namprd04.prod.outlook.com (2603:10b6:303:88::18)
 by CH3PR12MB8903.namprd12.prod.outlook.com (2603:10b6:610:17a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Wed, 13 Nov
 2024 16:56:23 +0000
Received: from SJ5PEPF000001CE.namprd05.prod.outlook.com
 (2603:10b6:303:88:cafe::72) by MW4PR04CA0253.outlook.office365.com
 (2603:10b6:303:88::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17 via Frontend
 Transport; Wed, 13 Nov 2024 16:56:22 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001CE.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Wed, 13 Nov 2024 16:56:22 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 13 Nov
 2024 10:56:19 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 13 Nov
 2024 10:56:19 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 13 Nov 2024 10:56:18 -0600
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
X-Inumbo-ID: 39e0b514-a1e0-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjAwOTo6NjA1IiwiaGVsbyI6Ik5BTTEwLUJONy1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjM5ZTBiNTE0LWExZTAtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNTE2OTkwLjI2MTM3Miwic2VuZGVyIjoibWljaGFsLm9yemVsQGFtZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hjf9/3eAVc/G0Z39vGpRaT6RtcbW+jNDTnc0f1i/Cy7C74hhAnyUZa1qBCt3s0o2KW2Dj5Gd/ZMQVAwxBgi+8fhde1LT3fTuV7MOi6rJwcpxRuiz1Wfnxn5vtDt413kJ35l6FWHuBLGMPue6jviMzEdcgnBhbWcKoUpb9KYbebOgDju2A1eeeKk7ee66Vre6Skip3Th1kCevxBKUIk2Ou0DXr7GF3MIqcvB6tDc3n3mE+yswd7m8oLugCyMhUV5SPAIglJog5X3Y50KPRgOTLjPVN5IG8vJs5BCEgVjNFjUTeIg5RMsWotpIFM0qPhY4uXYW7evZU25rSFaGqNxRvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jzwFEEcm+JKqaqUNoLGC42+3zmQ28sPUCt15psim9BQ=;
 b=fOY5VMnwERC5oTnVhJ147M4hxY0tynSyYEwn184ohhXerJtk91naeqhnh48hWi7tyQ+S9EFDsZOgBlHdwJQAu+9L5klF7aAPsgBNABfwLYozdnmAXQ5mTNmB8JFXrJiIDpt1KjS8FJt2OEUWqQVeEyzuC0M7CtyMLDwc+u/PR6XMfnn4MeTksjRyOfpBxxZFgtk7qV3Rj9dEjyjhnQH2A3noFsKB/HdGueUGpxq6zCSqVdMLLmq65+iQzjQ2R+be4YHS0TfE++APW78yG0edcu6Ak3Td5hmEzk14PPh8VYgfKN9jcLfSo3sY3PWdbBDQMY+oNmwC6N2W9S0Qes0e2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jzwFEEcm+JKqaqUNoLGC42+3zmQ28sPUCt15psim9BQ=;
 b=FSC7q3DxEqvsdsX4pbnllW/fg2ICtBzB8ksyUFrRPzU7gf0ZFjr55UYgnM8vH49VHsAN4XAOrLGFN5pvSXZcGw08ZogxzI/vIjE3BjjsLwUTu8VEzHVx3p1UADmoIwyYSmwxBLIM3frKM6Yc+/vqpeZH63jAfL5B0fFoKQx9t3U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <3cef1b1a-d17c-498c-a482-6ef01d781392@amd.com>
Date: Wed, 13 Nov 2024 17:56:17 +0100
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
 <d87bd0a7-0dc8-44a9-b43e-04a166cb0b6d@amd.com>
 <91140571-9237-42dc-8eb1-2263bbb23b07@xen.org>
 <51c04e42-105b-4452-8dd1-dcc1f02c54a2@amd.com>
 <8d04f515-ae46-4b30-8a98-7822b0d221ed@xen.org>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <8d04f515-ae46-4b30-8a98-7822b0d221ed@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CE:EE_|CH3PR12MB8903:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c377ebe-3ba3-45f6-9b29-08dd04041a5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RC9TTmJwR2g0bEl1SjRwS1hGNnp0YlBmZm1iRkExK1hick1MWGVWeWpaUlBK?=
 =?utf-8?B?ODVsYmtvdTlTc0IwSXZya0c0a0FkN0plSmx3b1hWZERNeHQvSk5yRXZuR2dH?=
 =?utf-8?B?VDZUcmYzUkQxc1ladmJGZFNiVFBEcVYyaFJyaVNiV3dFR01JZTJsODV6a1lu?=
 =?utf-8?B?S0FPREN3WHBIbmRHM3VmMGVDYW0zUkh2QXc1aXFBRkZiaU5PRm9hWDc0VGdX?=
 =?utf-8?B?d3hxVk5ubGhPRkp3OXhJeGlCeU1wOWpuTXZkOXdBZENJZnRsQW9JeDJWZHVL?=
 =?utf-8?B?S2lTSlM4ZmpuSWd5UUZURXpXcml5SmIzVjlyS2wvVHFsaGE3bXgrMkcreVRq?=
 =?utf-8?B?a3AvY1FRYnQzUzVQcHNsRG5xZ3I1eDdJNWdSWHArMXNacXl6UDFOSjlwTVRo?=
 =?utf-8?B?NXpqSGZlWjQ3cTR0ZmQxYzFONyt2SEZUbk4xbGRmUG56V2EyRUNjWHNMOTdK?=
 =?utf-8?B?V2ZCdndMclQ4TkxnRGRmKzJqWld5Y0lKYVkrSGN5ZDVva1RnU0laNG9VMm1U?=
 =?utf-8?B?NWhzRytQK1h5dWhORmpIdEtzRFk1Zy9hSkI1VTViSHJDM0NYWkpqUmFBUnJq?=
 =?utf-8?B?eTU2LzFjYVVMNm5HVlFQL3o3d0JzMm5xR2ZhTW5lU29uZkFhQkdmTWJkU2xN?=
 =?utf-8?B?TzRxYUVTeVN5cGdGdkcrZW5YblJKbHFPWVlxOG5TeTBORmdDckFIamxQcGYw?=
 =?utf-8?B?ZnRCZXZLbFdaYnQrZ3ZQdzhja3pFYjV6bGRidFlFTlFCOWI2Q0VoRmI0S0Ry?=
 =?utf-8?B?T1kzRmhodDlUV3ZHQjB3cGlNU2dFK09aMFhMMFJSdVN2K3Jud1FjTDFFK3My?=
 =?utf-8?B?VHEvVmhveW1aUGdYalRtdHRzWUNMQlNBVXFTRkhPTHBUNXlOT3RpUFc1V1dX?=
 =?utf-8?B?bVpsTHRMWGgzaXptcjZsYi90VVl2Ui92ZzFVOThOeHcyZStLeEdrRmh4RCty?=
 =?utf-8?B?VlRxMEZONEg0UXVrVml2MFV5WkRmUDBYeDRjMTczSlZTMXJZRnd6RjdkVHZt?=
 =?utf-8?B?RmF2b1Q4WUY5TU5YenlXSGZNMjBXUGNhN1B2NlZ1cFRSL2MwREhQQ1l2YWJ3?=
 =?utf-8?B?b3YreG5reHF4VEhnMm44VG9Xb1I0dEZKNnBsUnA1dDNQclR2eUN3SVJCMVZL?=
 =?utf-8?B?ZmJJaTQ1OHM5bTFjbW9oZERVNWJWTjFvVGdqVkxEcGJVRGdoWk1GN01iaGJm?=
 =?utf-8?B?eXllOCtSeHEreDZhejVvVG1xUW1tSnQ4UzR2V0NYYUNQdzFKdnRxVUF0cFRG?=
 =?utf-8?B?QytzcUR6ei9tVnExRjVIdXVnYjIrQlBKcFQyQmlLVU5NREo3ZnhDOE9BYjJS?=
 =?utf-8?B?ZkRsOTE1UlRzT21GazlSSnhYbXhadEk4TVFSNDlZbWZlQWhxb2tiTUViNXAw?=
 =?utf-8?B?YWY1aWVSVzhjYnY0MHdxVCtLaU85ejlsbldaS2s5VXJRM2ZRa3FZazlDandv?=
 =?utf-8?B?T2MvLzBjOEtLL1FENnVsUGQ1d29BNUN4VCs0UzEwL2J6MjYxNzlUMlRGQVVW?=
 =?utf-8?B?VjIvS285dzZGQkdwZ01xZlJLdG5xRlBmckRGeWRKNG5weHN6eHkxRkovclNI?=
 =?utf-8?B?R0hnOWtLMFBNOHZTam9HaGpid3FTTFhzR0h0c2pSQmFjTGhoZ3VxN2hLOUYz?=
 =?utf-8?B?djl4RG1STEtGMkduajhCNzQxMmtLS1l6NkwzOGUvYnY5SzNQSWNXZ3Q0RUpq?=
 =?utf-8?B?NHM4bG45bFBjOGFiSzQ0LzVZRVdpcVk0dWhOc01LdkVJMUNGc3N5ZVZLY0Z5?=
 =?utf-8?B?dHQ4clVvUDZGN2F5cFBhOGMxem1zOTFrWDluQmRzV0h1TkxTU1RCVm1Ibm9D?=
 =?utf-8?B?ZnY3Qk5vVjlpdThqbTJ1dHVFK0RXOFFSbUtTS3ZqdUZ4WTJEQXZQKzM1cUpP?=
 =?utf-8?B?N0Vyc1NLZG1BU3NSQTdxMlBPaHM2VEhwTW10aERIV1hudWtJRnVJZTVZSnln?=
 =?utf-8?Q?MpBugm88UrA=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 16:56:22.3547
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c377ebe-3ba3-45f6-9b29-08dd04041a5e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8903



On 13/11/2024 17:41, Julien Grall wrote:
> 
> 
> Hi,
> 
> On 13/11/2024 15:40, Michal Orzel wrote:
>>
>>
>> On 13/11/2024 15:40, Julien Grall wrote:
>>>
>>>
>>> Hi,
>>>
>>> On 13/11/2024 14:19, Michal Orzel wrote:
>>>>
>>>>
>>>> On 13/11/2024 14:50, Julien Grall wrote:
>>>>>
>>>>>
>>>>> Hi Michal,
>>>>>
>>>>> On 06/11/2024 15:07, Michal Orzel wrote:
>>>>>>
>>>>>>
>>>>>> On 06/11/2024 14:41, Luca Fancellu wrote:
>>>>>>>
>>>>>>>
>>>>>>> There are some cases where the device tree exposes a memory range
>>>>>>> in both /memreserve/ and reserved-memory node, in this case the
>>>>>>> current code will stop Xen to boot since it will find that the
>>>>>>> latter range is clashing with the already recorded /memreserve/
>>>>>>> ranges.
>>>>>>>
>>>>>>> Furthermore, u-boot lists boot modules ranges, such as ramdisk,
>>>>>>> in the /memreserve/ part and even in this case this will prevent
>>>>>>> Xen to boot since it will see that the module memory range that
>>>>>>> it is going to add in 'add_boot_module' clashes with a /memreserve/
>>>>>>> range.
>>>>>>>
>>>>>>> When Xen populate the data structure that tracks the memory ranges,
>>>>>>> it also adds a memory type described in 'enum membank_type', so
>>>>>>> in order to fix this behavior, allow the 'check_reserved_regions_overlap'
>>>>>>> function to check for exact memory range match given a specific memory
>>>>>>> type; allowing reserved-memory node ranges and boot modules to have an
>>>>>>> exact match with ranges from /memreserve/.
>>>>>>>
>>>>>>> While there, set a type for the memory recorded during ACPI boot.
>>>>>>>
>>>>>>> Fixes: 53dc37829c31 ("xen/arm: Add DT reserve map regions to bootinfo.reserved_mem")
>>>>>>> Reported-by: Shawn Anastasio <sanastasio@raptorengineering.com>
>>>>>>> Reported-by: Grygorii Strashko <grygorii_strashko@epam.com>
>>>>>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>>>>>> ---
>>>>>>> I tested this patch adding the same range in a /memreserve/ entry and
>>>>>>> /reserved-memory node, and by letting u-boot pass a ramdisk.
>>>>>>> I've also tested that a configuration running static shared memory still works
>>>>>>> fine.
>>>>>>> ---
>>>>>> So we have 2 separate issues. I don't particularly like the concept of introducing MEMBANK_NONE
>>>>>> and the changes below look a bit too much for me, given that for boot modules we can only have
>>>>>> /memreserve/ matching initrd.
>>>>>
>>>>> How so? Is this an observation or part of a specification?
>>>> Not sure what specification you would want to see.
>>>
>>> Anything that you bake your observation. My concern with observation is ...
>>>
>>>    It's all part of U-Boot and Linux behavior that is not documented
>>> (except for code comments).
>>>> My statement is based on the U-Boot and Linux behavior. U-Boot part only present for initrd:
>>>> https://github.com/u-boot/u-boot/blob/master/boot/fdt_support.c#L249
>>>
>>> ... a user is not forced to use U-boot. So this is not a good reason to
>> I thought that this behavior is solely down to u-boot playing tricks with memreserve.
> 
> Sure we noticed that U-boot is doing some we didn't expect. But this
> really doesn't mean there are not other interesting behavior happening.
> 
>>
>>> rely on it. If Linux starts to rely on it, then it is probably a better
>>> argument, but first I would need to see the code. Can you paste a link?
>> Not sure how I would do that given that it is all scattered.
> 
> There are no requirements to be all scattered.
> 
>  > But if it means sth, here is kexec code> to create fdt. It is clear
> they do the same trick as u-boot.
>> https://github.com/torvalds/linux/blob/master/drivers/of/kexec.c#L355
> 
> Yet this doesn't provide any information why this only has to be an
> exact region... It only tells me the current behavior.
> 
>>
>>>
>>>>
>>>> For things that Xen can be interested in, only region for ramdisk for dom0 can match the /memreserve/ region.
>>>> Providing a generic solution (like Luca did) would want providing an example of sth else that can match which I'm not aware of.
>>>
>>> I would argue this is the other way around. If we are not certain that
>>> /memreserve/ will not be used for any other boot module, then we should
>>> have a generic solution. Otherwise, we will end up with similar weird
>>> issue in the future.
>> We have 3 possible modules for bootloader->kernel workflow: kernel, dtb and ramdisk. The first 2 are not described in DT so I'm not sure
>> what are your examples of bootmodules for which you want kernel know about memory reservation other than ramdisk.
> 
> The DTB is not described but the kernel is. We also have XSM modules.
> All of which could in theory be in memreserve if for some reasons the
> bootloader wanted to preserve the modules for future use (think
> Live-Update)...
> 
> Anyway, to be honest, I don't understand why you are pushing back at a
> more generic solution... Yes this may be what we just notice today, but
> I haven't seen any evidence that it never happen.
> 
> So I would rather go with the generic solution.
My reluctance comes from the fact that it's difficult for me to later justify (if someone asks) a code like that
in the port we maintain because I can't answer the question about the rationale of other modules.
All you wrote is just a theory. Neither you nor anyone seen a code where a bootloader sets up /memreserve/
for sth else than initrd. That's it. I understand that generic solution solves the possible future problems
(the current u-boot behavior dates back to 2014 and nothing new happened since that time) but at least I find
it more difficult to reason about. I can see you might not see it the same way I do, therefore I am fine with
the generic solution.

~Michal

