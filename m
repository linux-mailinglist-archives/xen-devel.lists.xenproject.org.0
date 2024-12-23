Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BF59FADD7
	for <lists+xen-devel@lfdr.de>; Mon, 23 Dec 2024 12:44:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.862878.1274414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tPgqe-0002Ma-CI; Mon, 23 Dec 2024 11:43:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 862878.1274414; Mon, 23 Dec 2024 11:43:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tPgqe-0002KX-8U; Mon, 23 Dec 2024 11:43:44 +0000
Received: by outflank-mailman (input) for mailman id 862878;
 Mon, 23 Dec 2024 11:43:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k7Xy=TQ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tPgqb-0002KR-Sj
 for xen-devel@lists.xenproject.org; Mon, 23 Dec 2024 11:43:42 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20631.outbound.protection.outlook.com
 [2a01:111:f403:2406::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 254ef884-c123-11ef-99a3-01e77a169b0f;
 Mon, 23 Dec 2024 12:43:37 +0100 (CET)
Received: from CH0PR03CA0009.namprd03.prod.outlook.com (2603:10b6:610:b0::14)
 by MW4PR12MB7015.namprd12.prod.outlook.com (2603:10b6:303:218::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.20; Mon, 23 Dec
 2024 11:43:27 +0000
Received: from CH2PEPF0000009E.namprd02.prod.outlook.com
 (2603:10b6:610:b0:cafe::9) by CH0PR03CA0009.outlook.office365.com
 (2603:10b6:610:b0::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.12 via Frontend Transport; Mon,
 23 Dec 2024 11:43:27 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF0000009E.mail.protection.outlook.com (10.167.244.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8293.12 via Frontend Transport; Mon, 23 Dec 2024 11:43:27 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 23 Dec
 2024 05:43:26 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 23 Dec 2024 05:43:25 -0600
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
X-Inumbo-ID: 254ef884-c123-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H5ZxpH8xpfHQAL1Hu/N+GPzLC2hClhEYG4ZJt0rPepWpbimmGB/knadr1Q+txYOgt2eY02n3a98bwBgtImrnH3BGbAJeHP3JiN/TLo1Q5dZIdOzbkgnjL+5LOMMRwCplxKK2kfF3vTwknbjkeHkbr5qN0ZLqmwl9d/n1gtipo1WhJ0jxVOeMFtni2reCSXNsu2z8G9Y7NtVKV6e9nlYvkGu90k9ixJnus/5e51/10BDuJWVAMsvkd/G4GpQ8Ca5n4Yrdci32yMLSnCHp+3tL1b0Zw9LJ8VLOPyaacovbrvNefeui0qU4dmnKU4Avx0r95Wnzhfs8X9xFdTIUTPUt5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Quml13rmf6up0g8BqPhn79ieOGfKN8syZE/6HM6Pkw=;
 b=PROcQeBV4ZXYy0Fc3vm8j+ax9RwcEdyuEVvPnw7FPd875latskh/NW8c8/0UMWdW/fST4N3yGjxmXN3R/wvdWJMGSxv7nwwiymidLsm3GoFSCLuJc4vpdrUd/KQZBinK52NwBSPiG4Rjqf5td1aouoTQay6rFYNMCh+Cmz4NtrMrC9rrazOA8b/dGgKkDKkopuxCbiwkpHjmq7Fn7Z2LQmqnGic3mdQP7ndApVtT/MJb064z74hzXoVx0bikfikXJWrD6SfL/rpWmTltx546s2xmMXs6a6Z5W1tHXxso4dC7F709PLmPe3nnWvVqE5XJcAjsnMXo1uBQAti15ncwlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Quml13rmf6up0g8BqPhn79ieOGfKN8syZE/6HM6Pkw=;
 b=ZBDv57SYYiEVxdGLMyFqiyssDUZacVMomOvuF9Qn+G9aMJcLhQRZMO5yD9nUNDZADD8ysgjjeOZK2Ungo3Vv7QlkcP1fejQ3TXTts3cQf+kIPpw7Nwxs1VXC5GACUikTPvCj8ioEeLa0KrjjaDc0fmaNHCJFYNyFQh7FNymym7U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <90072069-7776-4131-9409-9e74db9c87d9@amd.com>
Date: Mon, 23 Dec 2024 12:43:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Initialise memory type for struct kernel_info
To: Julien Grall <julien@xen.org>, Luca Fancellu <luca.fancellu@arm.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241220151941.4192864-1-luca.fancellu@arm.com>
 <2a7ac358-7f43-4e32-9e1e-9ce1cd45304a@amd.com>
 <c39709e1-bbdb-4995-b507-212eec7c84e6@xen.org>
 <a9df74ea-38ef-4f20-be26-1c519bb9c269@amd.com>
 <7b7d4606-86fe-45c1-9aa0-48ddfacabafb@xen.org>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <7b7d4606-86fe-45c1-9aa0-48ddfacabafb@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009E:EE_|MW4PR12MB7015:EE_
X-MS-Office365-Filtering-Correlation-Id: c745df64-9503-44ca-eb26-08dd234703ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M25IZnJCYXpHdG15Y1VTMmRCdUs5RjJsTUhYa1FRb0FQeW1LVnp6NVdWRlll?=
 =?utf-8?B?OVpFQ3lFamVMc3ppMWU2allwUldyVmx5VDlVMUF4SmZrOFEyMFZmTGlmcFZn?=
 =?utf-8?B?MTRaeTVaZGQ2U08wSDlheURaZjQrNVRnTG40VFQzaDdsN2Erdm90UzBUV2hh?=
 =?utf-8?B?RDVZanZ6K3o0bHdJWlZCOThId0U5c1ZzUUVPYVlqOWE2UVI0dWJlTkpoTk1C?=
 =?utf-8?B?dDBySTh1dEVzN2F1Yk02ZSswbTRCN05vUFMzRkVBMGFsdHVvb292cFpydVpa?=
 =?utf-8?B?ZjljbDlJSXlLOXNBd3h2c0VsMlVrcTltOXhzcGRPSWZKOVRPTTNMNUllMG5y?=
 =?utf-8?B?VGtTOWpLL3lGMms0ZFNkSklWOWM1TkdVWTM5MVZHSFlwYjBGRlZSK3l4bVFm?=
 =?utf-8?B?QWhhbWh1OC9IYUxzZ2FIbDNDbktGT0xFekJwdkpUUzlBRU4vZ1FXUzYzR2ZU?=
 =?utf-8?B?NDBmeUVCL2w1SDNuWTFtekJZdTlLeEIyai94VTduNjIvZjYwZDlkY0pnd2dE?=
 =?utf-8?B?NzdGL0N4V01oSEtwM096bkdPN1BvcHFUZlYraGxWSGlzNW9KbTJDZ0xHM2xJ?=
 =?utf-8?B?cVpuT1QvRndGMzVBbDJ2bnNRRCt6NnpvbUxFRHlYZzNyUGI4V1JwUmx1bVph?=
 =?utf-8?B?cWZDbHJwdUQ4eTNPazcxZm1LWEJoU09UNDdWM1A2V1Q4S28zSEllMzlnQWY2?=
 =?utf-8?B?aXloTFUzQTFQZldpT2djaEdtUWtZR0RGYUphNS9SbUdoRlVQYW5wTTNaWnpn?=
 =?utf-8?B?Qjd6OERuaExyVDdlc2hXWHM4NXZ5a0ZkdDFxUStrdUNMeTMyaXJ6UFA0NUhv?=
 =?utf-8?B?QzhTTEJCd2ZLaG5INGQ4UkhuMllyV1lxNExIeVh1TExhZHN3Y2ZiQnFoUGtw?=
 =?utf-8?B?L0JyNWlYcExNSktFaGFNYTFJSTlaZ28zclRSMkp0SHhXVXlZRXNKbXBmU2tX?=
 =?utf-8?B?VlRDaHdDMEtvZHZHR2kwdk0wYnhWS2lhdm5NZW8xQ0F1cEJBL0czOTU4aUt6?=
 =?utf-8?B?elhJRDFtSGovSFlzLzNtRHJBR1hDNGx5Zk0yUGJGRlRuWHFtTGJCREpaeVNU?=
 =?utf-8?B?dGZXay9hQk5iNFp5R0R4M3o3alJBNUREZy9hbkhVeXlYT0VRbzZqSFJOdVJo?=
 =?utf-8?B?Wk5zQlBHY0NjMHlXNTBtdTgrRmlkcGVvbDI3aXBQMHcwb3k4UlRuajQzTTV2?=
 =?utf-8?B?YUhvVFpFRGRLVTBRb0RpdXpEenArdGoxL0tmRHpxYjFLcS9scFRPd0xGcU1S?=
 =?utf-8?B?VE4wV3Z2aytDcENMc3NnRjMyMUF4dXVONDR0ejgvV2R4UXkyMDMramhaWkpR?=
 =?utf-8?B?dlMzSGt2WitFZmlsRzJPSkRZSHR0SXpnajRyeEF4Wnh2YlVJNmhQZk1XaHZ3?=
 =?utf-8?B?MFRIUGhqVVpsa0Z0L3NxTW1kUGxKY21kOC9Pb1R3eWhIbUl6ZkU4MStxWnBs?=
 =?utf-8?B?TW5MTFlvUjFibGZjbVlGUVJpR0kzNXVBVVpHMk92MHdRZUE2eEFMSm40NklI?=
 =?utf-8?B?LzgzQU44dzBydFhwV0RKaW1sTjJRT09NVk5wZjAzMXB4RnQ0cSsya0pRTXZi?=
 =?utf-8?B?Mk9mUW5yQjNZSUhiakhTbE5aRDc5eVR6OXFmcHJSZkpWbGtGZXNzU0h3Y3JN?=
 =?utf-8?B?ckxsTkFkbTBsaDdmTXQvVE1KZ0lYWGxWeUpCaldwZDRFSDhJR3ZuMTRKVnIz?=
 =?utf-8?B?ejZxeXFCdlEwaDN1ZVNlU2F5Sm8rTzNyQW42TzdjUTlLdFBMSHJtbnNja0R5?=
 =?utf-8?B?OUgyVWwvUkRtblpyNEJUVzF5UVloeko4VjBHMGlOVXdERFZCcjBTNmpNcDhX?=
 =?utf-8?B?c2ZmSGxrdWQ3MHIrQlRrMnliNUlVMll3TnZVNTRKZzNkaDRHYjZteFBTQlZq?=
 =?utf-8?B?ZityUW0xREJGYTV5eWFGU1hKcktCSlFjNWYzZ01adiszeWFyWlBaZ3QzSiti?=
 =?utf-8?B?d1VwVmJNMU9NQ3R6cHloMGd2S3VxcTNXbnJXMU85Ty81NHIrVWdBL1Y5TWg1?=
 =?utf-8?Q?04Jw7H7/Xtfw9MlnFc2aK5QWJoWhcc=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2024 11:43:27.1180
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c745df64-9503-44ca-eb26-08dd234703ee
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000009E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7015



On 23/12/2024 11:45, Julien Grall wrote:
> 
> 
> Hi,
> 
> On 23/12/2024 10:42, Michal Orzel wrote:
>>
>>
>> On 23/12/2024 11:06, Julien Grall wrote:
>>>
>>>
>>> Hi Michal,
>>>
>>> On 23/12/2024 07:58, Michal Orzel wrote:
>>>>
>>>>
>>>> On 20/12/2024 16:19, Luca Fancellu wrote:
>>>>>
>>>>>
>>>>> Commit a14593e3995a ("xen/device-tree: Allow region overlapping with
>>>>> /memreserve/ ranges") introduced a type in the 'struct membanks_hdr'
>>>>> but forgot to update the 'struct kernel_info' initialiser, while
>>>>> it doesn't lead to failures because the field is not currently
>>>>> used while managing kernel_info structures, it's good to have it
>>>>> for completeness.
>>>> The last part "good to have it" does not sound like we need a Fixes tag.
>>>
>>> Reading the discussion, it sounds like ".type" is not always set and
>>> this is not properly documented. This means that in the future we may
>>> write a patch that requires to use ".type" and needs backported.
>>>
>>> But this would depend on this patch which was not tagged appropriately.
>>> Therefore, I would argue it needs a fixes tag (even though this is a
>>> latent bug) or at least a backport request.
>> Setting explicitly a type for structures not requiring it, does not seem beneficial for me.
> 
> I have to disagree. If we set type everywhere, then the developer
> doesn't need to think whether ".type" is garbagge or not.
I see, I have nothing against this proposal. But in that case I do think that the same needs to apply to max_banks
member.

~Michal


