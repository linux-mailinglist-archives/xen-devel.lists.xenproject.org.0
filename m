Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBC4A84EDC
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 22:57:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.946329.1344267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2yxH-0003lY-8l; Thu, 10 Apr 2025 20:56:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 946329.1344267; Thu, 10 Apr 2025 20:56:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2yxH-0003iQ-5l; Thu, 10 Apr 2025 20:56:59 +0000
Received: by outflank-mailman (input) for mailman id 946329;
 Thu, 10 Apr 2025 20:56:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z2Tv=W4=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1u2yxF-0002gb-UK
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 20:56:57 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20616.outbound.protection.outlook.com
 [2a01:111:f403:2417::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 563dc823-164e-11f0-9eac-5ba50f476ded;
 Thu, 10 Apr 2025 22:56:57 +0200 (CEST)
Received: from MN0PR02CA0030.namprd02.prod.outlook.com (2603:10b6:208:530::20)
 by BL1PR12MB5827.namprd12.prod.outlook.com (2603:10b6:208:396::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.22; Thu, 10 Apr
 2025 20:56:52 +0000
Received: from BN3PEPF0000B06A.namprd21.prod.outlook.com
 (2603:10b6:208:530:cafe::be) by MN0PR02CA0030.outlook.office365.com
 (2603:10b6:208:530::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.26 via Frontend Transport; Thu,
 10 Apr 2025 20:56:52 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B06A.mail.protection.outlook.com (10.167.243.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.0 via Frontend Transport; Thu, 10 Apr 2025 20:56:52 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Apr
 2025 15:56:52 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Apr
 2025 15:56:51 -0500
Received: from [172.25.231.87] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 10 Apr 2025 15:56:51 -0500
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
X-Inumbo-ID: 563dc823-164e-11f0-9eac-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=abPkMZg9bsbotHSUDo8SkRfzcO26NyhKVJjfAHei8a7bXploSUueEfjEfkLWCj7VvgjWZEbcYxC/IiYpqdAW0ged8aRJP7yh4u7AqlArye7sh3B67vVC1rpP0esP4/V/l4sESiszLBNFsdrl3GRS8ysnv08vHIO35NWAi+RoDOvv4i9eo4HWzpaRfQhkpt4Bq3QIXS+1ms+cEGEEIXhDUbEFulonYesfKboWaVEThfqzEu9Bht/sdCLV1tOBvogLNjhAlZ5QiIobzui03cZysPiCJyXf624//B0hO098pC7wuRcZFZvkmITQnhQznuPpaIdfguViRPjP8KC/ranadg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fkcWafqHGra459jcug9ikuMTpM2QJBHZ5SFO2V51cew=;
 b=PEJIEDDgg47qm0oGsV00pYiSUFCMCusKGHDwGXMe9yc75Zkqr1HtVzDrCXIpSX9CxJquSLnC3mSWyNIXySfEeR7PIAcA1mkfVKczeMWvdYkGwxXGxVWkewbkqgW206Jed1qWkGc6D4pDTs+XPrxeVWl9mS8DIYCjD4QKPqLtUORjS8dn6eFtxqsUctBgoJHHXr5wI2t0wjTaPSC12xeia+ywE/2oNMmnFwqVP6eTE+hmJU950CxRevWvjstkUtsYGEkUDU8bfJaffg5UsXk06Jp649uSOLyhh7zfRV0lRnzJqLmu9IDpIQAVXI9v/9tenZ8tcCMqcA0b2t2xPtDYVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fkcWafqHGra459jcug9ikuMTpM2QJBHZ5SFO2V51cew=;
 b=bI8HlYwGTypYw/T+9M4xbg0yxfvj3zRT5zCZV+iQ1mmnimuBrnMJXDwDGw93waGOYun6gBexwd6wVBf1NBlMxwSOrPJADSIM8zV+m+aNfAatHIcvPdQV9rDeIY3/Datv02IXbFiw67ZKcSMebftTkk42Y7U8WCu2vmvJcFm/PX4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <687e8478-6657-4270-931d-8ebee9dafcec@amd.com>
Date: Thu, 10 Apr 2025 16:56:52 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/16] x86/boot: introduce boot domain
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Alejandro Vallejo
	<agarciav@amd.com>, Jan Beulich <jbeulich@suse.com>
CC: Xenia Ragiadakou <xenia.ragiadakou@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-2-agarciav@amd.com>
 <141229a0-2cd2-4886-b5e5-02c85b0ca5ab@suse.com>
 <D921CCFOSV90.2LUNCRRSE6Q5M@amd.com>
 <7e87020b-859e-408a-ae0e-097ef4ee54cd@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <7e87020b-859e-408a-ae0e-097ef4ee54cd@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06A:EE_|BL1PR12MB5827:EE_
X-MS-Office365-Filtering-Correlation-Id: 15322666-3027-4924-a6e6-08dd78723877
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MmF4ZHJTbVpOeUZhNU1wb2NlMlU2Yzl0VkkwbVczUlhLTFpKKzZlOGtBQUNZ?=
 =?utf-8?B?MTAxaklWUmFzdmtRVzI0eFl2KzdWSlorcm4xNm5tMkY5azJ1VEk4YjBaSEgz?=
 =?utf-8?B?OWxzRmpTWno2NktRRzFuVGJPcFFML0ozK044R0xsN3FLbFZodGoyY29kSzhp?=
 =?utf-8?B?UDlaNlhFeEVWV3V6RlBad1JTNzdLTSt6WitacE9YdVQ5MmtSV0lQdEhoMFZp?=
 =?utf-8?B?V2lhYmFRYWIzUGFTVnNEbjVpM3E0K3Q3bGVwcFIwMkE2Zmw4N0ZqSkNrUkRo?=
 =?utf-8?B?WXRvcmxjdHJSOUs0Z1dTY05RWEJsdUR0aTlRaFRUWDVJamZQeE9rRW5MaDdT?=
 =?utf-8?B?UkwvK3JMZnd6bkxScVd4ZEs1cDNHRzBKRGQ0cnpiZExGdndjT2U0LzdWSDdN?=
 =?utf-8?B?TzFDZzI4UE5yMEplSlY4dUF1L1ZNWWs5dVZLSUxFbXZhMnRjUVU1cENZQjRI?=
 =?utf-8?B?NElpcE1WSzRoYmhpWmxWVGptcTVRcGNka1NUeS9PRDl0cjZGMUdxdndQMFor?=
 =?utf-8?B?Y09ERU1PYUQzNHkwVWUxZDhJTm1ha21lQnZzWGpreERiS1hLWk9MTGM1RVVv?=
 =?utf-8?B?aGlkSGRPZVNWSUt3MnJxdmdSNUVhNGQ1bTFsTXZFVXpjYkJNWWFJb0s0VTJZ?=
 =?utf-8?B?L2FIU0JwYTZzWjdFaHZmNTNZY0xoMXN5TmNFNGlrblgyNVlKTm45cldSemFq?=
 =?utf-8?B?YjNlQkFCZmFra1QycFFUTWw1QVNnUHoxMzE0SXBJQ1c3VDgvTS9jUTVLUkRH?=
 =?utf-8?B?NTBYWDVGVjNDcnk4WFhCdEhRQUtuMGNPZkYrUE1MOWFMZjFYYVo5VGJScmxw?=
 =?utf-8?B?dWJKalpKdG13c21NTVhvRjlQcCtvUFNpL24yeXhKZjNSODdKUDNZUFl2c1Fv?=
 =?utf-8?B?cVVoYmk0Nm1EaHVQL0xzaVEyMis0dGRINmpJUGlpL2tPcUVQSnVLVitkTHF4?=
 =?utf-8?B?K2ZHVjYyejIyZDFHNEpBRExBVW1INUVWdEppNzBMUUwvOTl5b25wQVFMZzIw?=
 =?utf-8?B?SmF0MUNXcEhKMkxtdGI2TW5ybTV6bGdJMldzbmI1QkppTXovSlJuZ05jamFm?=
 =?utf-8?B?L0t1cmJ0dlcyYnlFVTF5ZzlLUzV0bEg5UWNIMmNNRS8zNkhsaVJQYVJMNnd0?=
 =?utf-8?B?aG5yWlg2ZVJnQU52K2ZTNzBzUWpaR09YaHBmYkcxMkJrZ0dIOTd2VEdRQlpm?=
 =?utf-8?B?bnJaUFFLN3JjdjdVZE5TYU5icm15OXM0d0NvSlVCODBueXJkd3d4bDdZdkpm?=
 =?utf-8?B?Y3BNYmVwc1h6aU1WaTlZUVI5MG9SQUNsZW8zM1hSRGxDR1crVUhGNXduZU9j?=
 =?utf-8?B?UkdPZjFwMUk1aStqS3Rmd2xuaHJQWFFYcmFDazI1WUU4M3MzWi8vaFF3U08z?=
 =?utf-8?B?YjBYZVo0bXEvRy9Xd0ZoRUFkQzM2SXU3a2Y1eHJLUjVzSDQvZVk5WXlMRVpG?=
 =?utf-8?B?MVhRWjdsWGhGL2c1bW4wcmtSQkQxdVhBNTdJUFVRdHZOOHN3SkFXcTRxZE9q?=
 =?utf-8?B?Rnhxa2RCYXk4S2pRb0tCSUlwMlFJWEJRRERmR0FUYWpMOFlMaFhYTWxVVkRk?=
 =?utf-8?B?RXlRdDF2cDYzSUNoK0E4LzRSdDNma211Zy9mLzVudDNqOVRSc0pBVk5OcTU0?=
 =?utf-8?B?WUZjWDM1cFZYWnFrYnU2Rm5ReXJwR1pmT3p1UTloOU5FZnhqWUNHeWNwYVRy?=
 =?utf-8?B?cmd5MGlJUTMrdDFBa25hazRSemNzSWlRaENLWFFRSkpFUE82NEdEeTh2cGpT?=
 =?utf-8?B?bmFvMHVRaUZNSEVkZHBTSlBYVGVqV0tRM0JqMno4MFc5aVQySE5mUG1yZ2dQ?=
 =?utf-8?B?VTNaTWEra0RnbHNLKzJFZk5KYVpqNGR2WTRRcGg5R2RZMS9JTlVNaXRVRDVP?=
 =?utf-8?B?RVAxTFZRdXlRb3RrQURPV3ZHUUhwWWhla0dkTUEzOGZ5MmhheWpYNEFlcDlY?=
 =?utf-8?B?QUlyRmpWVTkyUy9tRldtNGxsSnBUMTY1T3Z1NFduSHJZb0V5SmNnUGc5M2Y4?=
 =?utf-8?Q?uQLxNhnI/+STXKgW/qhlpZGH/Re4eM=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 20:56:52.5031
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15322666-3027-4924-a6e6-08dd78723877
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06A.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5827

On 2025-04-10 09:13, Daniel P. Smith wrote:
> On 4/9/25 06:28, Alejandro Vallejo wrote:
>> On Wed Apr 9, 2025 at 7:24 AM BST, Jan Beulich wrote:
>>> On 08.04.2025 18:07, Alejandro Vallejo wrote:
>>>> --- /dev/null
>>>> +++ b/xen/arch/x86/include/asm/boot-domain.h
>>>> @@ -0,0 +1,28 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>>>> +/*
>>>> + * Copyright (c) 2024 Apertus Solutions, LLC
>>>> + * Author: Daniel P. Smith <dpsmith@apertussolutions.com>
>>>> + * Copyright (c) 2024 Christopher Clark 
>>>> <christopher.w.clark@gmail.com>
>>>> + */
>>>
>>> I wonder if the 2024-s here shouldn't have been amended by 2025 now.
>>
>> Maybe. I didn't think about it, tbh. One could argue that Daniel and
>> Christopher's original contribution was indeed in 2024 and the fact they
>> weren't committed until (hopefully!) 2025 doesn't remove the fact they
>> did exist in some form in 2024.
>>
>> I don't particularly care either way, but tend to lean on the "it's fine
>> how it is".
> 
> Jan is correct, now that we have moved into 2025, they should be 
> updated. Maybe we can actually get it all committed this year.

These were written in 2024.  Neither Christopher nor Dan touched them in 
2025, so why would the date change?

Regards,
Jason

