Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E50998E47
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 19:25:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.816376.1230594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sywtO-0004Lz-2E; Thu, 10 Oct 2024 17:24:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 816376.1230594; Thu, 10 Oct 2024 17:24:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sywtN-0004JS-VZ; Thu, 10 Oct 2024 17:24:01 +0000
Received: by outflank-mailman (input) for mailman id 816376;
 Thu, 10 Oct 2024 17:24:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hg9/=RG=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1sywtM-0004JM-R2
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 17:24:00 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20622.outbound.protection.outlook.com
 [2a01:111:f403:2415::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e753e57-872c-11ef-99a2-01e77a169b0f;
 Thu, 10 Oct 2024 19:23:57 +0200 (CEST)
Received: from PH0P220CA0017.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:d3::24)
 by CY8PR12MB8298.namprd12.prod.outlook.com (2603:10b6:930:7c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Thu, 10 Oct
 2024 17:23:53 +0000
Received: from CY4PEPF0000E9D4.namprd03.prod.outlook.com
 (2603:10b6:510:d3:cafe::e2) by PH0P220CA0017.outlook.office365.com
 (2603:10b6:510:d3::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18 via Frontend
 Transport; Thu, 10 Oct 2024 17:23:53 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D4.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Thu, 10 Oct 2024 17:23:52 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Oct
 2024 12:23:52 -0500
Received: from [172.21.103.178] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 10 Oct 2024 12:23:51 -0500
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
X-Inumbo-ID: 6e753e57-872c-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CX1/Uu8k/GQXcNbk3kFbsBCmw1R/iiPjhMBP6Krd8C6XYeQsAZCly5rbVBGauaKG2JYUnDNL/0v8Jso9cDjg4rVgY1AwqX+46iqrTPgC3prjoqKJIyaCEBnDX4dVaa3j5jw3ZiSfImAAL7YELSITCrjPoVUN9f272Wh9e+Ki0ixLT2k+rfOMVpqhlJlLCWLJt9A60AoloUrWzWP/iTisYa1NK714FpEfOa+/kvfe4uKru1jR/t3gjBZP+1OCLX2By895u1Zm8P7f6ji3X+Pa7HLN6Q7sRoNoGFoWNeVQkWIyzrJI+X35cqtf8cLafUnlfzUg4SeA/BchqageM4s+Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=leP4gX5/SNqQhOp0D9s9bo127bam98/WJ0aUgDJozjY=;
 b=bdhkQxN1MCdrmkPw3NsTDeFPGc1gHfiX6Vx6GBVJkLhzuXm16vNiBih+y16dO7uuiK+Mvp7AbsuyQB9QRWrOa7dgVLXUfrHPdIKhexz+13UDsIPpNziHV4uJ46EwzOpAQiaqryd+2jFFnlIYUyV9Lnc1qsj0Xx5o8i6oA9dXCZ3n25fpggUvtej+VHyZrkW5yaM074qtN5BYNGbbJ8tqcKP/tp9FeQug/KMiBCRluwwvZ2j6eJEh323tehnuCnVhFma29QnMHeWUEV9aKaoad7AbGeLpZ3rP7kulx0froJnX+NFv/TS3PjN6QlIsDtJHAnWrmadfzRsvztl8d8kaNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=leP4gX5/SNqQhOp0D9s9bo127bam98/WJ0aUgDJozjY=;
 b=eklD0RAGzp2uhk7NoLQHy49Kt3/rkjLUvSx9xkSRP+p2FjLnsR2sh1xZRCUNp5R+C6t8CJUTHqJhU1QToFLgkTKclG6DGSLIFDfhpp4ypYs0i8S4O/xKVkw+wT91rL+7tMyG51fbUX50nSwrCRWzZt0Bd5xoILcX19JSXR/d2As=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <62f223fc-acc3-4a65-a093-2d5f6bfe00a3@amd.com>
Date: Thu, 10 Oct 2024 13:23:51 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 20/44] x86/boot: convert xsm policy loading to struct
 boot_module
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-21-dpsmith@apertussolutions.com>
 <eaa648a6-c34a-47c5-a4fb-a3e56982abba@amd.com>
 <fa2789d7-d9d6-49e5-8108-cf26ecfca618@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <fa2789d7-d9d6-49e5-8108-cf26ecfca618@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D4:EE_|CY8PR12MB8298:EE_
X-MS-Office365-Filtering-Correlation-Id: e5a5ef58-a3d6-40b5-1a37-08dce950502d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RXVKNDdUeGlVN2ZtUG9GZyt5REg5T2NycVdHWis4Sml2ZHBOeFFNM2l0aHVl?=
 =?utf-8?B?bWxrQ2NOY1hiT1lKMlAzeWZRQlhRaWltRWRwVFZFZGxPRWpseFVvdWhRRlZQ?=
 =?utf-8?B?ZWJZRUxBNUxYWGZMUU8rVHMwN1JobWpyT1JqRmZvc1R6dVAwanZ3bW9ia3Z5?=
 =?utf-8?B?KzdOM2VnWWEvdzZhdEc0TnJORGNxMkR4cnowMlZMTk5xVDZVaTd4ZHJUUGtK?=
 =?utf-8?B?MEZWZDVyb2RRY0kwazBMeXZKSEV6dDYyL0gxOTV6T2UraS9pQy9kVVcwVis4?=
 =?utf-8?B?d3hCa29sVU43NmlPLzVsdjdwdmRmN0N2dk5ONHkrNi8yUitpNlQzOTNHd3Fi?=
 =?utf-8?B?cTZYdEViSmRwVWozS1FJNHhaeFVhNjI3aWJzM3BYQlo2YW9OZzcxNGllajNM?=
 =?utf-8?B?aHU1WUFOSWw1djJ0WUIwclk3d0srMGFCZlhTZmhjNDcwVTJzelhyUk1GNWYy?=
 =?utf-8?B?bldEeFdEZ1dpbWRpUFZLZUlhTGpzSlJTamU0MDF3L2RIbkZJZEdXKzVSV2Iv?=
 =?utf-8?B?SnFXQTZzb2xDcUgxMjd0cU0rMnp3RjlUdDRyTEZFZjkza0psV1V1L0JFR1k5?=
 =?utf-8?B?SHJaelFQM3FtM2puKythRFJBWVpWTVBKZzVkeGR0WXlQRnBSSUUzWUkxL0ZN?=
 =?utf-8?B?Wkx2N2tLZ2I3bjNvZlZIeklyMG1MWFA3b0c0U0xYRWZBN0Uwdk9NQm1oOGph?=
 =?utf-8?B?Mml3OExkUkE0dTBUZFJPbU1HK1dpbFdXOGQ5WWFBNnJBZk9ENjZ6dU5mY1Fz?=
 =?utf-8?B?NERLS09Fcmd1dGJQRituRHZRV0V1aVA2d0JQMXFtZ3RoYndVelJkTjdzSy9i?=
 =?utf-8?B?MEpvVkwwRWh3R0dWZHBQVGRpekkrTWdvcjNDYXI4MEdMcDFQQ01jNnIvTmxB?=
 =?utf-8?B?a085NGtDUFNIc1VKYmF4VHBwODRNaVZ4TjdQZ0F4T3ZFOG83a295ZkE1RnRv?=
 =?utf-8?B?bWp0MjFWNXZrQlZlb3E4YlcydmF2aitsNEIvMEhSblFQamVNRUZyTU5GM2Y1?=
 =?utf-8?B?YmFJMnFvbVhyT2E2TjZxR0N0YitKUlNXK3ovTlV5YmtUU3IxMzVBVS82WUU1?=
 =?utf-8?B?bzZqUHBqNVZCK084ZGVYMzJ4cjdBd0dPTGtKZWFNZWZWK0RLb0tqSkJFdE5H?=
 =?utf-8?B?UERlY0Y5eXQ1Qkk3ckYvRkt0am02QktjdGUrcFQ2cEZuYUkzL0FlNS9GcDFq?=
 =?utf-8?B?VDVyR2d5NW1hQy9Tc0lMMS9yS1B0QVVmdTJVeHJSQWZwTjlSaUxZSTN0NGp2?=
 =?utf-8?B?bllxNGtRVmNGVlJsdTNZYjdQWnZoRXBvYUViWW5aVFVmTlg1UmVmeTZJYVVo?=
 =?utf-8?B?WUgxZE5QL3dad2Z0YXE0SnFpbk41aFU3dnhDOTZJdUhYWktCd2t0ait2ZmdU?=
 =?utf-8?B?eEhKaE1tTzl6azVxUHBWU29NUTlCaUlBMXFJTmFKUVJLY09ydm5VNWFwTWM5?=
 =?utf-8?B?T1ZGRytqWmdiMnVpRTd4TjMzcXJkZ2E3NnJHbHJqZnBOSDR5cC9uM3JtOXR3?=
 =?utf-8?B?QXBFRU9PT3BhQ3NlSXRIa2l0R2F1TkRCWW1DVGJmOW90RTZzVFdZakNKZEd0?=
 =?utf-8?B?Z1ZSRVN6WVJPS0h4dy82S24zY1ZNenhXdnE4UFJvQW9rcm1qcTd1YkZ1OXlD?=
 =?utf-8?B?Z1FyZGJNMnNNYkVuYzlVcEVEajJaeTY0cVl0VlYwMkVtS05ia05SdGRMSTlX?=
 =?utf-8?B?ZGJITTY3N2dtRmhpdHFPemJnaDVhcjR2V2IxekxHbEgxdy9MTTdRZmZrN1JY?=
 =?utf-8?B?dmVXMngrQzNxZTJQSnBRN2pISE9vZ1Exd2JnaGRZa0xJZmhSL2haRGg3ajAy?=
 =?utf-8?B?Vkw0dGorR21RNGhvNWtwckw2OVFEQUFvNnJJUktYemRYdEVlaWJxSlpHb0VP?=
 =?utf-8?Q?/b5kfCIOuHZnY?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 17:23:52.9837
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5a5ef58-a3d6-40b5-1a37-08dce950502d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8298

On 2024-10-09 13:21, Daniel P. Smith wrote:
> On 10/8/24 12:13, Jason Andryuk wrote:
>> On 2024-10-06 17:49, Daniel P. Smith wrote:
>>> Iterate through the unclaimed struct boot_module to see if any are an 
>>> XSM FLASK
>>> policy. If one is located, mark it as an xsm policy.
>>>
>>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>>
>>> @@ -161,6 +162,14 @@ int __init xsm_multiboot_init(
>>>       }
>>>       ret = xsm_core_init(policy_buffer, policy_size);
>>> +    if ( ret == 0 )
>>> +    {
>>> +        int idx = first_boot_module_index(bi, BOOTMOD_XSM_POLICY);
>>> +
>>> +        /* If the policy was loaded from a boot module, mark it 
>>> consumed */
>>> +        if ( idx >= 0 )
>>> +            bi->mods[idx].flags |= BOOTMOD_FLAG_X86_CONSUMED;
>> Maybe xsm_multiboot_policy_init() should return the idx used instead 
>> of having a second search?  (Also, xsm_multiboot_policy_init() can't 
>> fail?)
> 
> I was debating on whether to make similar changes because the existing 
> logic just seems sub-optimal. Currently I am looking to just write an 
> independent XSM patch that looks at both this function and the device 
> tree version of the function. Specifically, looking to use the 
> IS_ENABLED() macro instead of #ifdef to reduce code, provide better code 
> coverage, and to refine the logic.

Ok.

>>> +    }
>>>       bootstrap_map(NULL);
>>>       return 0;
>>
>> The other changes look okay.
> 
> R-b then?

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Regards,
Jason

