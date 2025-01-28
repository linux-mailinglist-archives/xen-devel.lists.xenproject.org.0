Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28998A20AB6
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2025 13:47:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878477.1288668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcl0B-0001Fv-NC; Tue, 28 Jan 2025 12:47:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878477.1288668; Tue, 28 Jan 2025 12:47:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcl0B-0001EJ-J6; Tue, 28 Jan 2025 12:47:35 +0000
Received: by outflank-mailman (input) for mailman id 878477;
 Tue, 28 Jan 2025 12:47:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WhQb=UU=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tcl0A-0001ED-6j
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2025 12:47:34 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061b.outbound.protection.outlook.com
 [2a01:111:f403:2417::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0943e6fa-dd76-11ef-99a4-01e77a169b0f;
 Tue, 28 Jan 2025 13:47:31 +0100 (CET)
Received: from BN1PR13CA0002.namprd13.prod.outlook.com (2603:10b6:408:e2::7)
 by MN0PR12MB5787.namprd12.prod.outlook.com (2603:10b6:208:376::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.18; Tue, 28 Jan
 2025 12:47:26 +0000
Received: from BN3PEPF0000B371.namprd21.prod.outlook.com
 (2603:10b6:408:e2:cafe::55) by BN1PR13CA0002.outlook.office365.com
 (2603:10b6:408:e2::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.16 via Frontend Transport; Tue,
 28 Jan 2025 12:47:26 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B371.mail.protection.outlook.com (10.167.243.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.0 via Frontend Transport; Tue, 28 Jan 2025 12:47:25 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 28 Jan
 2025 06:47:23 -0600
Received: from [10.71.192.184] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 28 Jan 2025 06:47:22 -0600
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
X-Inumbo-ID: 0943e6fa-dd76-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rqID3iwABaaDsz0PXiQ6z2StZqt4xjFneudxCUtVeI3ha69dbht1QenGw311DsChHTXJ+ppJLsnAzZgl+9W86Jn4MCW/4FXLeGywkG7gXk/QO2QlrO7i4ctLMIJVxOusOPg6uRkneR8iUnwQKyIRe7Jw8c8thd9/ai5EQSJxnAG2synf7y6WTo5LuIJGTmNbjkiasqbPMmZvREKQTy857NTylE9vean9InBqNijk8pbCTvyza3xpnV9zvhCHaQ8wzWpiQjB7masBdwkDuSKu1HDlVGU5uvVbQpySX8qEbT01dpFakHNEfmoLZLMxKo8SqMWUmxzpYMRZQ9QFSSsGRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DhPMKeECd02T38yDKxfsOGlxSn4aHlbIGrUoYAI3mDg=;
 b=hAKqrsUjNPGxsMMb/wpAG1ddk6T4OiEZK5cYZMC/KOMSZwdf36cmO8RUZckqvt6+eNqkHatOa7+q0lLHYzF1y0jJ/3OMcdW3Wl65KZpVJkF9dpyq1l8cyMoM/8u3Cm2qJAF2szyRw9DRF2AVt+9nbu9VJfGBJZqyMIIe/XHml5bisOQlSjjpodxQCzNg2RERNl7rCShkWyhp14Zn/q7Y4n+paQcgYpVX5rI39LIOKGgFq7vP4RhgIF/bUbHp8sozisn/oHA8T+2ClVemSjCC6Kuyp+fsSsuXZR4OEX9Cbxsh108CozZO8r4hNKgIUQZwxJTFmrjcztIaQbZ3DpKAFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DhPMKeECd02T38yDKxfsOGlxSn4aHlbIGrUoYAI3mDg=;
 b=Idoi+F9VSXHWQL16hTV8Iy01HwC4KQfFCjSGiwY3QFbWo+FUJIZyT89/PNCLch8SJNcm/+yJqqdJh8gwVQYEt1wc2tLVg8F3fvQgtVyQs/DlX1YJwlyj85VPETc/DfJuNYJnMw75hTU8tGZkWYS+ie/Qa7zyhxhvZKQxwOEVZ3c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <18a57617-7ae5-4a7d-a7b6-61cd5643ff22@amd.com>
Date: Tue, 28 Jan 2025 13:47:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [for-4.20][PATCH v2 1/2] device-tree: bootfdt: Fix build issue
 when CONFIG_PHYS_ADDR_T_32=y
To: Luca Fancellu <Luca.Fancellu@arm.com>, Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, "oleksii.kurochko@gmail.com"
	<oleksii.kurochko@gmail.com>
References: <20250128094002.145755-1-michal.orzel@amd.com>
 <20250128094002.145755-2-michal.orzel@amd.com>
 <4A4FAE76-59FF-4DBD-92A7-5158B0404C7F@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <4A4FAE76-59FF-4DBD-92A7-5158B0404C7F@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B371:EE_|MN0PR12MB5787:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ec32337-8ce1-40b0-6994-08dd3f99eae6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NE5OanpzQzNhSUVBUGEwMnBMamp2QlFhN2QrZnphdlJUWHVIVTl4ZmEyYS95?=
 =?utf-8?B?K2ZxY1FGQm9sdXBrSnpWZGhIRUNia1U2L3EzOHE2YlJCVVVVYldWOG9DNVN2?=
 =?utf-8?B?UFBSWXhaUVRWUC9PZGFrZmlNSHFTUHRadGlEaVRwMjF0Ymg3WUEzWks1Yk5Q?=
 =?utf-8?B?R3N0c1hTcHU2ZnlNTGhVK2t3Q3dMdkRYcW0wQTA5dXV6T0kyWVRUbGNKa3p0?=
 =?utf-8?B?T1Y2czB1RHY3WExzbVhxcklkL2JlUXZhREVXcVgrWWpvNDFCeFM3bVRLeTEr?=
 =?utf-8?B?azBBVjBkVE92MWF3eGw2YndaTGFMRVFjbXVWbE92VUJSNkwzakk4cFdtWWRX?=
 =?utf-8?B?WERkZlBHWGtRemNqYVUxaGorY2luY3ZmOUdzbmlSbzBWVXkvMXNpODdMbEZu?=
 =?utf-8?B?VmZzbG9INUl0TWt2dVlrVDYzTXR3eDZnK0tqaDVtRXNTMndHMFp4dTVtdVhJ?=
 =?utf-8?B?UmFBNFplYUh3QTZPdmtabCtjY3VScndrRG03Z094bzhJcktMenN2ZzM0VzVK?=
 =?utf-8?B?cVl4VHYxdTdUSDZiR2svUHRWZzFmR1dwSTUrcVp6MlFKV2M0ckp5VllhMHZS?=
 =?utf-8?B?eUMyVUc1VFFCbmIyazNiS1FzT2hMNWJUV3ZxbUZXaEFOMzRBbGZMZ0FoL1pB?=
 =?utf-8?B?YmRNWkxQNkhkVldnWDhOcFhQMTllMUxSRzM4eXduY1lWSVJueU5mZGhsMTJq?=
 =?utf-8?B?bFRtWER1NThtUHBoUGI1bEw4MU05OHk4V0lBb0FIUjFhY0VEWlhSY1hGalFM?=
 =?utf-8?B?Uk9LNG5SZm1GVkxIOHU3UnFvc0dDN1R3TTU2cG5NcVJHZWNGa2RES0VOdnRM?=
 =?utf-8?B?V1FUaDdVNUJaZUxpZkNxR0dzdlBsVElSVU9Sc1d4T3FDS25zMHp0bWVDZFRN?=
 =?utf-8?B?WVNMdVBGVXN3b3ZlZ095LzNTTzRKNkxpWCtYTXBoZzVkU3hDMEZ2eXQwdGJa?=
 =?utf-8?B?ZmdXWXhjb3JOVGdFK1ROWE44UWhTYU1tVWJPdkgrZHlPblczeFBvbmpEUHpO?=
 =?utf-8?B?NWFST3I4dDBuYk9POG0waTRJbjYzSFZMcG5lRFlKMVpocHI4a0FOZkNZam9R?=
 =?utf-8?B?V3FpWmFpN3o1bjNKWElOMDhEbkZIekdkVjdVTktaaVhwVm4yd25YdnJqcVNL?=
 =?utf-8?B?WnRpZFZuRHloR0ZvSlNNOWxCYUpXdjdzblZmQnYrc3ZSR3l5M3FWR3BmOEps?=
 =?utf-8?B?VUpVN3gzdTFnbStQejQwWXo5YkI5OG5ubytKWGYrS1c0NWN3SDZrOHFkSVI0?=
 =?utf-8?B?eGxyMUZhTTl0aHV4ejg4ejd6T0YrTzNML3h6OS9NVSs2VDFFdHQwdjlkVFZR?=
 =?utf-8?B?TlVkZFN3cUZUQkIra0x1OHZRUTBaNWQwUGtzRlU5T3lQWitpbjNkNDRYUWJS?=
 =?utf-8?B?eGM0S2lxQW1wdzZsdHd3TUNQbndYWkQySHhmT0lTcFlPL1NEWEZVT1ltS05w?=
 =?utf-8?B?c2t4dllDdEpwRHptcUc4S2RuZWlHbkJKM3VZSjJRdXhGNzhnMlVhbmx6Q1R3?=
 =?utf-8?B?blo4QXNxWjZ5cWI0T1M4K2t6MWpqdzJuWjVhMmpvb2ZnTW9MTUs5L01Hd3pL?=
 =?utf-8?B?SnQrbktPTlhSMzNDZGN2OHFZNVB5YjdLREFFWm51WnlBcmQrQnZhZk5saTZn?=
 =?utf-8?B?RzR1OFpvVzZjRTgrdDZocDFXdDkvdW96d2lZTWJHUTliemVyTTUwaGFha3J3?=
 =?utf-8?B?TkJPRVBUSDZoRVlRd2RjUEVwd1NsdHByQXB3bm9RZTFWUFBJdlhKQlhjckww?=
 =?utf-8?B?M3lsWXpoeExTNHFwTkVsOU5aWkVRQWtsMlhXZHBsNVhyOG1QSzEzamgvWHFF?=
 =?utf-8?B?OGMwWTU3YnNmMHRlTllCbEs0bnhOaEpQcVJ6YU5iYzQyZE1yUHc0S3hLd2ln?=
 =?utf-8?B?QU1RZG5Ed2I5T1ZNaXEyNTRzM1lWTk1ocU05WlY1VzRtU2NqbnRtOXI0QkYy?=
 =?utf-8?B?QlJuM3duWTU4YVI4MHBOQXNyWGVTbUpEWThrMWxRYTU3anhZOEQ4WlpWdGJB?=
 =?utf-8?Q?4oB/NNxb32oGbVTyu42hvnykQmysyk=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 12:47:25.9212
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ec32337-8ce1-40b0-6994-08dd3f99eae6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B371.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5787



On 28/01/2025 11:34, Luca Fancellu wrote:
> 
> 
> Hi Michal, Julien,
> 
>> On 28 Jan 2025, at 09:40, Michal Orzel <michal.orzel@amd.com> wrote:
>>
>> On Arm32, when CONFIG_PHYS_ADDR_T_32 is set, a build failure is observed:
>> common/device-tree/bootfdt.c: In function 'build_assertions':
>> ./include/xen/macros.h:47:31: error: static assertion failed: "!(alignof(struct membanks) != 8)"
>>   47 | #define BUILD_BUG_ON(cond) ({ _Static_assert(!(cond), "!(" #cond ")"); })
>>      |                               ^~~~~~~~~~~~~~
>> common/device-tree/bootfdt.c:31:5: note: in expansion of macro 'BUILD_BUG_ON'
>>   31 |     BUILD_BUG_ON(alignof(struct membanks) != 8);
>>
>> When CONFIG_PHYS_ADDR_T_32 is set, paddr_t is defined as unsigned long,
>> therefore the struct membanks alignment is 4B and not 8B. The check is
>> there to ensure the struct membanks and struct membank, which is a
>> member of the former, are equally aligned. Therefore modify the check to
>> compare alignments obtained via alignof not to rely on hardcoded
>> values.
>>
>> Fixes: 2209c1e35b47 ("xen/arm: Introduce a generic way to access memory bank structures")
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> ---
>> Changes in v2:
>> - modify the check to test against alignment of struct membank
>> ---
>> xen/common/device-tree/bootfdt.c | 4 ++--
>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/bootfdt.c
>> index 47386d4fffea..529c91e603ab 100644
>> --- a/xen/common/device-tree/bootfdt.c
>> +++ b/xen/common/device-tree/bootfdt.c
>> @@ -27,8 +27,8 @@ static void __init __maybe_unused build_assertions(void)
>>      */
>>     BUILD_BUG_ON((offsetof(struct membanks, bank) !=
>>                  offsetof(struct meminfo, bank)));
>> -    /* Ensure "struct membanks" is 8-byte aligned */
>> -    BUILD_BUG_ON(alignof(struct membanks) != 8);
>> +    /* Ensure "struct membanks" and "struct membank" are equally aligned */
>> +    BUILD_BUG_ON(alignof(struct membanks) != alignof(struct membank));
> 
> Apologies for not catching the issue for your v1, probably I didn't understand very well the test itself,
> why are we checking that the structure have the same alignment?
> I see we check the offset of `(struct membanks).bank` against `(struct meminfo|struct shared_meminfo).bank`,
> isn't that enough?
> For sure I’m missing something...
In my understanding it's to prevent issues when casting between these structures. It's not that FAM (flexible array member)
requires the same alignment but if you consider casting this member to a type with a stricter alignment requirement you may
encounter alignment issues.

> 
> Anyway I tested this:
> 
> Tested-by: Luca Fancellu <luca.fancellu@arm.com>
> 

~Michal

