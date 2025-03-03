Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32496A4CB7D
	for <lists+xen-devel@lfdr.de>; Mon,  3 Mar 2025 20:00:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.900565.1308438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpB1D-0007Nv-RY; Mon, 03 Mar 2025 18:59:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 900565.1308438; Mon, 03 Mar 2025 18:59:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpB1D-0007Kp-OT; Mon, 03 Mar 2025 18:59:59 +0000
Received: by outflank-mailman (input) for mailman id 900565;
 Mon, 03 Mar 2025 18:59:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5oqO=VW=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1tpB1C-0007Kj-4D
 for xen-devel@lists.xenproject.org; Mon, 03 Mar 2025 18:59:58 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2414::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b16736ed-f861-11ef-9898-31a8f345e629;
 Mon, 03 Mar 2025 19:59:55 +0100 (CET)
Received: from MN2PR03CA0026.namprd03.prod.outlook.com (2603:10b6:208:23a::31)
 by PH8PR12MB6938.namprd12.prod.outlook.com (2603:10b6:510:1bd::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Mon, 3 Mar
 2025 18:59:43 +0000
Received: from BN3PEPF0000B076.namprd04.prod.outlook.com
 (2603:10b6:208:23a:cafe::bc) by MN2PR03CA0026.outlook.office365.com
 (2603:10b6:208:23a::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.28 via Frontend Transport; Mon,
 3 Mar 2025 18:59:43 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B076.mail.protection.outlook.com (10.167.243.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Mon, 3 Mar 2025 18:59:43 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 3 Mar
 2025 12:59:43 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 3 Mar
 2025 12:59:43 -0600
Received: from [172.27.162.189] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 3 Mar 2025 12:59:42 -0600
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
X-Inumbo-ID: b16736ed-f861-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M2va39xmRDTEv2Boclq/KcOyhbt7JSILqceORH/juhP880CZTTc8vjocJJrbUmmIlzi5BxF0xxnqgqV7MQbxaDSipihtZ/KfFhqdLOIu+7wQzz1hy/ofVEfAImEqWUuc4PcJQd9o3OcxZPTbnFP3B+wsgxqCzFN1pVnxssMv/SBLJdqJQRoBeyIB7/WfqCW+F1/mR8t6khxfWQtGcSYqEDyXlyk0oUN4IVAoyehlL/TdeGtjvMUeRk6tgyzIPWxlsngN/LbfUjD8z6UrQNlFlSEb25psLJwfIGGymxvEqu1Sz/bk1Hqlbo2B/vwKMYO7b7V0dZBxIEki0bCHecUumg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gAlKPD8M+QXMM1pKtowLvmg02A1U0SLrlcKtmwC9u2I=;
 b=FtyYEfCXZKTjcnbXnD3uZEC6d3E6za0aYyZcDzX6SE7KvNz1BDnUl1dw3YBPIN8gwRreirMtHDqt5RfYxXnEtE4HYJjDZb/Bh4PKzZTHX9SSv6H46cl0Qn5D6SjBgn1soliQD03LLFTWmhhJ9IZK3CfWQstKMcznSHVQXgQiEQ2QZ6zhjUB16qU3O9ou4ZM3FYvQ+6wCPHiU4shoQJIYFuakEZmA1WLQhGLsumxZIXjhnru+Nz50qkJ2jIknL24uT0kAi3ntWl5fXNcGVXFYt8LZTHqGO4CPedbTlzrLK974aB8Ph3dUosfNXI+50un6INvH2ru2cZneJVuiilmCPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gAlKPD8M+QXMM1pKtowLvmg02A1U0SLrlcKtmwC9u2I=;
 b=I5KoCfRFGwwKYyDLM1wKrz1CBt6TjQjfcHuMvG15NDMD6+VsMetnk3l3DsI4Ez0USThkRkRuq48CkGek7Wl3pvyz5WjwFTKdpWvVLtkQ3Rmd1LCJfDIsvSs3h9D87BT5/UWxQOIjv7Y2Jbd2MCeoHkx3F6xiYrsTMXPcD2Br1lU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <8278d3e0-cba5-41ff-bdb0-199b3657af30@amd.com>
Date: Mon, 3 Mar 2025 13:59:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/x86: fix build with CONFIG_HVM=n and -Og
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20250213185055.711703-1-stewart.hildebrand@amd.com>
 <f5deca6a-313f-4daf-b774-cc05223ab034@citrix.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <f5deca6a-313f-4daf-b774-cc05223ab034@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B076:EE_|PH8PR12MB6938:EE_
X-MS-Office365-Filtering-Correlation-Id: f7146d72-4606-4345-9d63-08dd5a858f33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YVllbVgxcWViZDlwNGtQRVV1RVNmYUp6NjBwQW5UeHB4aVo1ZUQzVnpRcXky?=
 =?utf-8?B?YXdLaFdsNmxWcTFIa1JFQXdsditLU2Jham5Ccldwd25SWGlNa0dPdTAzYTNE?=
 =?utf-8?B?Z0NSd2xWMktSMHBTeGl1R2Q0Ym8wYzlTRytzSGVIYnJ4d0UzUmZEUHlGeTRK?=
 =?utf-8?B?V3kvVUtMd2F5VndZWHBtQkx0QXBYNUU5L2FkQ3FYUy9Pdy9BY28veUJrdHRU?=
 =?utf-8?B?K3V5NWV3T0trbVYrMks3NUFwQ0xJWGViWkE2SVZFMm92L05lOTd3MXF5ajRz?=
 =?utf-8?B?YWVzVWo4RUVzNmZtQklIMjh1eHNXdjlwcVVPQmlIT3U4S2xUa1FXOEY4OURl?=
 =?utf-8?B?ejJqVmcwclN3NWdzaHpkRE5wRFkwQWk2bGNqeFdOR2l6eTVMcFc3UnJDVWJw?=
 =?utf-8?B?a2RHZXh0bGxINlFGR3BpNGU3RFhnQkZ2U1hPdkRaN0ZDTG9oVkVVZE9HQ0Rz?=
 =?utf-8?B?dVVRWFR4dEUydWxBSkRubTNNN0ExZFBMallZUXpiVG1wQlpNbmViRVR4WjlR?=
 =?utf-8?B?WGpuWFR3NEZjSmozMHFCRjRVVUsyWjQyUVZOMXRkVmY4VkcvKzhiaUpzc1dG?=
 =?utf-8?B?d1dXSWpBMTlEQm1CR1daWEcyTkNiRDJnamMyZE1sVTJqUjREaWJsQW5nTEtn?=
 =?utf-8?B?cndhYzJTK2Z5cGsrU25pYytXdUFpZnd6end1cVVWb0JweDlIdHlUS1ZmR2FP?=
 =?utf-8?B?cWExbWJaSGRMZUVhUGtaOHpKL0k5ejRiTXhIOGhRNFpWaXlCU0dEdnovM1hG?=
 =?utf-8?B?RXNUcWdwSmRKTnFiWXozaXNsVTR5UlYyRVQvYU9tSWRRRDdveWhIeDB6MFJG?=
 =?utf-8?B?SHUyenhSb2pFMXdyUlcvMFJDZVgwVmc2RjhObTJ6VVRJTDVhNVpNd2w1UmJj?=
 =?utf-8?B?b3c3OXl1R3k4b3dPK2dIVkdFV2pHVDhkZzV3ZEt2bnpmdi9qTXoraEFNRS8w?=
 =?utf-8?B?T3hxQWtCbEhuZ0w5STlGcFhROVplTk1zYTN4K3o4ZWJDMW1sZkpNNDAyZCtF?=
 =?utf-8?B?TDBucHlMWTJLdStWdmRxem1GdTJ0VFFQSW43RTFXbk1GUFpBQW9mY0dTWTI3?=
 =?utf-8?B?VkpXSXRKMDFEQ1lqdE5Lejk2cHN0YUpFY2FKRUtYZDF0dzFINTBxSlUxbUxF?=
 =?utf-8?B?QXYyUXA2QVVVdnNDb2QzcXVKV0QxVGdIUVFteHNJdXdCM016QkQ1WU9Eamhj?=
 =?utf-8?B?QXJFZDJ5ZkZqRW9mUUFabkVBcjdUdWpoYlpnNmtLVkU5YlY3UnFiTUp2bnoz?=
 =?utf-8?B?TGR3bXc0LzRzeXpHY0RLL0hhc08wZUJjK1lheU0zMU5sYm0yUVF3dG8ydEpp?=
 =?utf-8?B?Sm5YbHBrc2hkRnNNZ1lFZkpjcVQwL2twK3BMb1BNUTFwTk9kNVNyWWh3MnBF?=
 =?utf-8?B?MnIrcXR2K3RETm5MOXd2TGJUOUIxdllLTkxMS2ROZTN6eG10UUMwOUtWVVFB?=
 =?utf-8?B?WXoxTmE3MXl6ZHFUZzZSdjNmTUQ0TnVBUlprSW1IZGJXRzdOVFhMWUMraDZr?=
 =?utf-8?B?b2xDZFE5WSt6QUZrN2V2Vk4rMHpjRXFjR2p2VkUyTTVtUXZ6dmh1WXN2VVlM?=
 =?utf-8?B?NGl0dHBBSGdwdUVYSlBGOUdFWHhEL1UrRmNnUWtXSXdUYmhPWlRFVk92ZG9Q?=
 =?utf-8?B?SWRPY1Bia0U2Qzl1ZXp1NGp4WDB2U3Zha0RhN2JlU3lEYVV1NVJnRGtjR2p6?=
 =?utf-8?B?TW5oRUhsVlFkeU8zL1lad3NVdmFoU2lMeUJaMVRrMlRueWtsbFA1QUFvOVRk?=
 =?utf-8?B?UmZFU09QSlJSWXNUbjN2Y3NwSGxYMEJRci85a0UwanFRTHZ2TUhnbldaKzJs?=
 =?utf-8?B?UlZROHJMSzdHSEk4VC9uV2M0ajZGZHZKRXFkdmZEK3liN2JtamExZE5xL2JT?=
 =?utf-8?B?WkJBeVhTN3R4MzZrNHZQT3RuTHZxRDdkVVBkZXp2c0R0Z3VYaXkxNXlrU2Vx?=
 =?utf-8?B?VGprcEdoSi93WmgwR2pvU1Y1SVlkRFdSQW1YNGMrcFpsTjZnNi9WcHk5T1ZB?=
 =?utf-8?Q?5zyJx3r8wP/aMSxYlhuud2T5a14IbA=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 18:59:43.5528
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7146d72-4606-4345-9d63-08dd5a858f33
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B076.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6938

On 2/13/25 20:05, Andrew Cooper wrote:
> On 13/02/2025 6:50 pm, Stewart Hildebrand wrote:
>> When building with CONFIG_HVM=n and -Og, we encounter:
>>
>> prelink.o: in function `pit_set_gate':
>> xen/xen/arch/x86/emul-i8254.c:195: undefined reference to `destroy_periodic_time'

<snip>

> Is this the singular failure with -Og, or are there others?  I never got
> it working, and there were quite a few failures that failed to get a
> resolution.

This is the only one that I'm aware of, and it only occurs when
CONFIG_HVM=n. I only happened to stumble upon this occurrence because
allyesconfig apparently results in CONFIG_HVM=n. I've been building Xen
with -Og in my development workflow for a couple of releases now.

