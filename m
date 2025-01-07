Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A9BA04728
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2025 17:52:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866695.1278036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVCo3-0006Si-II; Tue, 07 Jan 2025 16:51:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866695.1278036; Tue, 07 Jan 2025 16:51:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVCo3-0006RF-Eb; Tue, 07 Jan 2025 16:51:51 +0000
Received: by outflank-mailman (input) for mailman id 866695;
 Tue, 07 Jan 2025 16:51:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FVI7=T7=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tVCo1-0006Pn-C9
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2025 16:51:49 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062a.outbound.protection.outlook.com
 [2a01:111:f403:2413::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id add88d12-cd17-11ef-99a4-01e77a169b0f;
 Tue, 07 Jan 2025 17:51:47 +0100 (CET)
Received: from SA9PR13CA0086.namprd13.prod.outlook.com (2603:10b6:806:23::31)
 by IA1PR12MB6626.namprd12.prod.outlook.com (2603:10b6:208:3a2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Tue, 7 Jan
 2025 16:51:38 +0000
Received: from SN1PEPF0002636D.namprd02.prod.outlook.com
 (2603:10b6:806:23:cafe::96) by SA9PR13CA0086.outlook.office365.com
 (2603:10b6:806:23::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.10 via Frontend Transport; Tue,
 7 Jan 2025 16:51:38 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002636D.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8335.7 via Frontend Transport; Tue, 7 Jan 2025 16:51:37 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 7 Jan
 2025 10:51:37 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 7 Jan
 2025 10:51:36 -0600
Received: from [10.71.192.184] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 7 Jan 2025 10:51:34 -0600
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
X-Inumbo-ID: add88d12-cd17-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M1//WkqFWFrLQ37qdUoWZT/1WQJRpNgjY36df5KeoT1Y7OPPQn9RWKtYrqGVngnuPrEBQQPTNr1ypXaOvk6TCZbFUfo2WcR+GjsLvhjBdkwlXv1aYpZ4eMR308qJKvr2FtXl38UxHU/Pl+MQUnbdqk21HE/KCyvO3aBJERm3esDRntOEuafieG6o/NOQRfJP/ZkP8TgmaXhgoQ6DLjqnTRylMzRtBEJw79SKtteZSaiTpyqtACdB2psVFz7UsFYqV66x0+rLv6VpXrhjF2n0lFdxTbAu2u/L+VU5/yBtLuH9AA3erWCcUsCYiXePdNdJAnWqi8JrfCaQ8ZE7h18RWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pMNDAyDegdFg5HceiyDc3R+eEYZtHl+PLMdUQ/z85EU=;
 b=BhrSGpJ1qId8Tz2sDZ+F35j6955hPYf6V6j2uN5zRfm/QjDfU1lguLk2E5v8JsimHBde5c6xVeO0GrerkkOdNUUcZ6HckpqR442GoMQltLVEpQI7wePGADcVjToxZdmtlF8TMezO3XvMfV1a6TwpMWJE1Hwf9r0DSufhPtb756gGB40U7wMQxGB+EqYN3Rdz4f93qyoQA5Vc/2E4PY6cJ49CfeF+n3dDosiJkpzpGQyeflgm6O8zD27Wcl0+6E5crtSImJg+2pmCR/2cIj/55gruvmCz62M7HO6+IK/RT2Jjhk7apV3yu2zC55UBI1TKuQy05/LfLBYymprrC6wNvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pMNDAyDegdFg5HceiyDc3R+eEYZtHl+PLMdUQ/z85EU=;
 b=cIrotDcezjp9ovb3YchOcm/qPPkAHVbyKPA31/Q9ZP6t/zjkG6Gk/lODcvxH8V6T0qY1Rtn/Bjq/vgw/nh+sxgxeD/Xk99EzCRe1kv0/QaN0tFwp0dhVDJsnpx4xuHkGSdXIVxORJ5I53/8pfTZw23ImCxzYS4p9VjBX3SrHB+s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <5c153764-4a1d-4233-a9d2-fa5ec0aff6ac@amd.com>
Date: Tue, 7 Jan 2025 17:51:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [for-4.20] Re: [PATCH v12 12/12] xen/arm: add cache coloring
 support for Xen image
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>, "Carlo
 Nonato" <carlo.nonato@minervasys.tech>
CC: <xen-devel@lists.xenproject.org>, <andrea.bastoni@minervasys.tech>,
	<marco.solieri@minervasys.tech>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Oleksii <oleksii.kurochko@gmail.com>
References: <20241213162815.9196-1-carlo.nonato@minervasys.tech>
 <20241213162815.9196-13-carlo.nonato@minervasys.tech>
 <dbbc649f-b705-46b5-a071-760d688aa2cd@amd.com>
 <CAG+AhRWrXAYfKXXKfp6949vNMdGDy9qWOY11SKAigJuC8oUvDw@mail.gmail.com>
 <df0f831f-378f-4fa3-ae4f-b065f2ea566d@suse.com>
 <0062e0cf-0830-4d16-942d-348e6d33a2c4@xen.org>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <0062e0cf-0830-4d16-942d-348e6d33a2c4@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636D:EE_|IA1PR12MB6626:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fc6eb61-09c4-49fb-3f44-08dd2f3b8d74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|7416014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RUl3bER3NFgrNkllN3FyOHlrVnh1NGJNTW5oa295WDAxWWJ6Tm91ZDBqVFRN?=
 =?utf-8?B?NFdRR2xuQk1TY05HdkUzMVpONVVhRlRSc1lhMDBVVFVPVDh5Q3lrTUdOa3hq?=
 =?utf-8?B?MW5GNFM4eTA0QmlOaDEwK2FnekVNKzVHWVlycTZRMVd4d2lpSVFaMXJkaUpN?=
 =?utf-8?B?a1Z0WVVYNjFEVllXWkpHUWp1eVp6MjZCdzdja2Y3aUtvMEtabnhjOUVldlhU?=
 =?utf-8?B?ajRRdmlDWEY1VDZDbU9UUEoyNnpQRVRzNTJFNUpEVk5mVVVDV2JFU2x5Wjgx?=
 =?utf-8?B?WXpEa2R4VXE4bVRVZllGdXA2b2hkeXZvMURUWEIzbkd4VFpuS2R3ODUxcmNT?=
 =?utf-8?B?b2pZejJyZTkydGR3NWNCUUppNnIwNFlIRUpZYUJrb0JWZVpQanJjeHZsRys0?=
 =?utf-8?B?RjY2OXUyMUJTSVRiUWJBVlJjNVNabEVpWU5HanVqelVGTGZxd1Arb0NkcnJw?=
 =?utf-8?B?NWNuNnVRZ1V6bTZnaWd5VkZMRVdTL3VKc3JHR0VGNkxKcmc0MzErQUlaZy9F?=
 =?utf-8?B?T2Yvc1hvcEVCVnVIR1Yyay9MYnYzMjlLSlZVOUY5bGx5MlJ0TXZyVk94Sits?=
 =?utf-8?B?bklTYjI4alVOeE9vR0FJNU9xcGZETlVYMG1aZ0V1Sm1pMklZaUFFZlIzcUpa?=
 =?utf-8?B?Y3UzNFZBRVZhUGkzdzBWZTY3SFVBci83TmUvVTBKVkFZVlkrMjV5c1lZTHJt?=
 =?utf-8?B?eUVxRDZ5SU5UQzgyY0NuUEowc3AwRVptU3NwNE5tcmE5QUNFMExFQTB0YUJj?=
 =?utf-8?B?VVFoSzJIdnF1dGVxdTJ5TGtEdnUyL2RvdzNVUWZzUG1lV1hHU3F4RkZwUE9O?=
 =?utf-8?B?VWdHdW5EdDZRK3FNYVVYOHlaOVA5V05tWUJrYTd1QUZhQm42eGluTFJycGFw?=
 =?utf-8?B?enF4NG1Rdno5aTl6dGR0K05GMFdhRm1rSEg3L0VSbUNRTkZscEFKajg3VWFp?=
 =?utf-8?B?dGdxZGxEclRORFRlWHFFbWMybXQ5YjB4bVQ5OHducGt3K2ZTQTA1cmFTY2Zk?=
 =?utf-8?B?bTJhS2s4cTVTMHppS0FMV1pYWURzUW51VDU2NjRqK1NwZVdQUDlFclkzdnBk?=
 =?utf-8?B?TUNTdzlSME9zcTJHRVR1dy9XU0pzTmtEWkc3eG0ySkZqRFVZT3k4NUpPcUJj?=
 =?utf-8?B?Ry8rQWg2WEtmT0ZmenBrYkc5ZE0vMGh5MkR2WkdSS3hjUFdkekx5cHBzd0FG?=
 =?utf-8?B?MklQUVgwL25FU2lpTWZzcDYxc0RVU2xNZG9PemlWTnJHemZPQ0krVktjZkk0?=
 =?utf-8?B?bDFCUXpzVERKQnN6cE1OVHZtSysxMHN0bUlER1J4bXNFWVp3UkhsMjBUQVNz?=
 =?utf-8?B?aTN2RVU5WkJPQVM3ckkxTWFHUkhhMXpjd2lRL0plUTBqNWJwdmtubVUzYjZ3?=
 =?utf-8?B?d0c4cjM5YXA4VmgwQzNhNHFwQkl2ZGdCbnA3RWsrVVZ2M1l3MTBHS0ZBcjYz?=
 =?utf-8?B?WTA2N1BxelBiSVlJTExoRkFRQ3NrUC9IUVo5b1hTaGUyZkxySEZEZFB4UDVt?=
 =?utf-8?B?Rlo1cGxGWkRsUEhSb3pmUVp5K3dVbnVvUkJvL3dGM2pKNm5Md2hkUTluV1M3?=
 =?utf-8?B?WDV0ZSsvZTRYYjNFWStqdk85UGhxM01vVDBYVmVCMTZIZTlleVBPUDh1MHRo?=
 =?utf-8?B?OThQMllrajBmWEhMRkRTdWhwcWQza1huOENFT010TWxMaEppK0t0Y3pWVENm?=
 =?utf-8?B?Q2E0Q05iRiswanBWM1RNcU5CcHJRQWFjS1ZYUnlsY1orRG9McmFoSjZnTHlx?=
 =?utf-8?B?cjlwbUFidHNqYWh4dnhYQzRqVmFvRmZSZk85RTRGUm1lYjRiNlZmaVhUQWRl?=
 =?utf-8?B?dlhOQnpvU0tPZTRQWnlDbEtzNDljS3pYMFdYMEJrWElscUp2Q2dTNGxZZjd1?=
 =?utf-8?B?OGtKVDRiblVLaUFTZGFoS3QzalNxQXRuTDU4Y0s2VU9HTER0a0QzeWtVR0tN?=
 =?utf-8?B?REs3YTBueW9MSFhINmNGQWJWczJVckVoOUZiVnUxcm12VTNmTkF4UWpVNlJS?=
 =?utf-8?Q?AhOJ7Fd+oHpAwcp6U/JVa+51bfVj2w=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 16:51:37.8478
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fc6eb61-09c4-49fb-3f44-08dd2f3b8d74
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6626



On 07/01/2025 17:42, Julien Grall wrote:
> 
> 
> Hi,
> 
> On 16/12/2024 14:36, Jan Beulich wrote:
>> On 16.12.2024 15:28, Carlo Nonato wrote:
>>> On Mon, Dec 16, 2024 at 2:56 PM Michal Orzel <michal.orzel@amd.com> wrote:
>>>> On 13/12/2024 17:28, Carlo Nonato wrote:
>>>>> --- a/xen/arch/arm/arm64/mmu/mm.c
>>>>> +++ b/xen/arch/arm/arm64/mmu/mm.c
>>>>> @@ -1,6 +1,7 @@
>>>>>   /* SPDX-License-Identifier: GPL-2.0-only */
>>>>>
>>>>>   #include <xen/init.h>
>>>>> +#include <xen/llc-coloring.h>
>>>>>   #include <xen/mm.h>
>>>>>   #include <xen/pfn.h>
>>>>>
>>>>> @@ -138,8 +139,36 @@ void update_boot_mapping(bool enable)
>>>>>   }
>>>>>
>>>>>   extern void switch_ttbr_id(uint64_t ttbr);
>>>>> +extern void relocate_xen(uint64_t ttbr, void *src, void *dst, size_t len);
>>>>>
>>>>>   typedef void (switch_ttbr_fn)(uint64_t ttbr);
>>>>> +typedef void (relocate_xen_fn)(uint64_t ttbr, void *src, void *dst, size_t len);
>>>>> +
>>>>> +void __init relocate_and_switch_ttbr(uint64_t ttbr) {
>>>> CODING_STYLE: { needs to be on its own line
>>>>
>>>> Also, this function is only executed in case of LLC coloring, so shouldn't it
>>>> be #ifdef protected.
>>>
>>> Here and in other places (patch #8) I'm relying on DCE to remove functions
>>> that are not called. This was a suggestion from Jan in that patch. Can we
>>> adopt the same here?
>>
>> Yet how would the compiler spot that the function is unused? That would only
>> work with LTO / WPO. DCE (as I did suggest elsewhere) requires the functions
>> in question to be static (allowing the compiler to see enough of the whole
>> picture).
> 
> Sorry for the late answer. I was away with limited e-mail access. While
> looking what was committing recently, I noticed that a dummy function
> was introduced:
> 
> void __init relocate_and_switch_ttbr(uint64_t ttbr) {}
> 
> If a function is not supposed to be called, then it should contain a
> BUG_ON() to catch any misusage. Otherwise, this is a recipe for
> disaster. In this case, it would not be trivial to notice the TTBR was
> not switched...
> 
> That said I would have actually considered to remove the empty stub. I
> am a bit surprised that DCE wouldn't work in this case because the call
> is protected with "if ( llc_coloring_enabled )". When cache coloring is
> not enabled, this would turn to an "if ( false )" and therefore all the
> code should be removed. What did I miss?
> 
> Note that this is what we already rely on for arm32 because there is no
> stub... So if this is problem then we definitely need to fix it on arm32
> as well...
> 
> IOW, we either introduce a stub (including the BUG_ON) for both arm32
> and arm64 in the header or we remove the stub completely.
> 
> Marco, Michal, can you have a look? Ideally, this should be fixed for 4.20.
I did a test with GCC 13.2 and I can compile it fine with stub removed. That said,
I'm not a compiler expert and I'm not sure if this behavior stays the same with different
compiler options/optimizations. So it's more like a question to Jan. I'm happy either way.

~Michal


