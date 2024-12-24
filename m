Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF579FBA71
	for <lists+xen-devel@lfdr.de>; Tue, 24 Dec 2024 09:21:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.863015.1274514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tQ08x-0000DE-0R; Tue, 24 Dec 2024 08:19:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 863015.1274514; Tue, 24 Dec 2024 08:19:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tQ08w-0000Ar-Sl; Tue, 24 Dec 2024 08:19:54 +0000
Received: by outflank-mailman (input) for mailman id 863015;
 Tue, 24 Dec 2024 08:19:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w2ar=TR=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tQ08u-0000Aj-H3
 for xen-devel@lists.xenproject.org; Tue, 24 Dec 2024 08:19:52 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20622.outbound.protection.outlook.com
 [2a01:111:f403:2407::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d6ecb9a7-c1cf-11ef-99a3-01e77a169b0f;
 Tue, 24 Dec 2024 09:19:49 +0100 (CET)
Received: from CH0PR04CA0109.namprd04.prod.outlook.com (2603:10b6:610:75::24)
 by CH3PR12MB9283.namprd12.prod.outlook.com (2603:10b6:610:1cd::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.22; Tue, 24 Dec
 2024 08:19:40 +0000
Received: from CH2PEPF0000009D.namprd02.prod.outlook.com
 (2603:10b6:610:75:cafe::cb) by CH0PR04CA0109.outlook.office365.com
 (2603:10b6:610:75::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8272.21 via Frontend Transport; Tue,
 24 Dec 2024 08:19:40 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF0000009D.mail.protection.outlook.com (10.167.244.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8293.12 via Frontend Transport; Tue, 24 Dec 2024 08:19:40 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 24 Dec
 2024 02:19:39 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 24 Dec
 2024 02:19:39 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 24 Dec 2024 02:19:37 -0600
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
X-Inumbo-ID: d6ecb9a7-c1cf-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YsV+dursBR1/SezNDHnvcNzxmil0ZYBWodzakA1FuoxzV89UHphpmyx7UjMt8Xk/b8Mw6Ofvu7KtCbX5I69q0FmjNMlF55+eSIrSugpxUjMIF2rXxnlQCF6dl2ELUxCoTnq41ZjJk8tLuAHUQY3uqmC4HRPM1ma3BETimvRxzooIGqx6L+30To25LGERULEMaxn3OYCoBGZe4TmUVJF3lcYjlykOKeyqyzSHx2vOkrz3xjCGNxu3/bb14A/T30kte2Dcdc86GudLQ8mfJJVfVD0xEQRZ0g7ESAbtfF56VVaxjVeJIptf//cXTU9zO1sbyuIMOf+Pj3e1BtKhFlREQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IheoD8T6WcmNHBP/Bf8uWiJ8G5C3kdzfrXuT7wmxoJw=;
 b=T74uB5NzefsxTZOtO/fycWvIdpVLzFnAJ5CffQGsK0mzFEZ0d2XyQNZLsksSwXG6/8kUQoV9G8irqEA9nJ/PSzYfVLrfYE/eoCs11ktol+TiWTJ/wCbHEpCF0iI/En1kmbobChGRifkdIjfpN+PaB5opXfmctaY0kReA+Z+KM+QWnt/TlToPP70jl0QSDw11l2l8oNgzZrpYQGzob6we2HTClBQlcA11rHEF0jDNUAD/LQAPMhOcVWhqNLay1FGlykxQCmkBU5DkiCGaHykRMrTbzrjHt2tSwuXZ2ouwZfn0IfMnukbDCIBlQRHP8KU6vkg5BbGKxZ7vEdINV+V32g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IheoD8T6WcmNHBP/Bf8uWiJ8G5C3kdzfrXuT7wmxoJw=;
 b=lkSOYYzQcZ87/W8bdlr647Ngo6cl64oCq8dW6iNWc754Piub2yeBYBWT+iDj9DeRLOLn20fHeousWVjK1KS3UBxaIr+iQD2eJJBvrHuDDsXsRd15B4H5BTbqDxNxubFL4/GaxPp9gfa9Zs1pGefyX1N+IKBFjQIOz7Zo4x36WDY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <e66b92b8-1732-4e45-a54c-c266e2ec2504@amd.com>
Date: Tue, 24 Dec 2024 09:19:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Initialise memory type for struct kernel_info
To: Luca Fancellu <Luca.Fancellu@arm.com>, Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Stefano Stabellini" <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241220151941.4192864-1-luca.fancellu@arm.com>
 <2a7ac358-7f43-4e32-9e1e-9ce1cd45304a@amd.com>
 <c39709e1-bbdb-4995-b507-212eec7c84e6@xen.org>
 <a9df74ea-38ef-4f20-be26-1c519bb9c269@amd.com>
 <7b7d4606-86fe-45c1-9aa0-48ddfacabafb@xen.org>
 <3188C56B-6BF1-4488-9036-33014B469A01@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <3188C56B-6BF1-4488-9036-33014B469A01@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009D:EE_|CH3PR12MB9283:EE_
X-MS-Office365-Filtering-Correlation-Id: 439908a4-758a-4337-7a0d-08dd23f3b66d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MjhnMzRUQk56aU92aGxNbjl0dnJPK2o1amFpckdmZDl1RjlLalJmTzFDdHZm?=
 =?utf-8?B?bFl2MTloR2lKZXl6aXVXMDNJbFlYUThOU0I0WC84cFZwUHN6RG9VR0tjd2Vh?=
 =?utf-8?B?cTVHWUhJTm8vYjdFRGNLQzlPbTBsbVh0MWt6OVJFT3dJK2o2WmpuVmtUa2Zi?=
 =?utf-8?B?VUpTS1BJcEZzS1FFNDJpZzJmUEE1ZkRRL01tQmdRRkhaR3RQL0h1VlBLelRs?=
 =?utf-8?B?ZU9PMk10cTczOTlUbEZCM21QMFJXdk53Z2M3WlI5M242OSthTWlQMGxiRUd1?=
 =?utf-8?B?Q3Z5ZnVIZU5uS1NqODIvQ3lvdnFoQTFMQUIxcUcxeVZxckVxSmtQMTNFSWhl?=
 =?utf-8?B?SzBueGxseEcwbzgxNHpIeENPWStXVmpUOUlUWWN0ZFFZR0dKemJyZnZRZEF5?=
 =?utf-8?B?NUZ0czB1S2VTWGVPZzJJbGUraEhMUERBbVdOSjNyQlJBaVFQbENRWHQvVita?=
 =?utf-8?B?d2pmQXZ4MWZSdDlzTXF2U3dlNTgxb21idjNSVVk4S0x3S3lQcXZVZTl0SnhQ?=
 =?utf-8?B?UkZZZ3FGZGtXWnQyc3pGYXNackl5dlVkc3FITjh2WVh5aG5rVjZ5VU9kaE5Q?=
 =?utf-8?B?aG9DM0JEZHVTbUVyVEtTK3JCaDQ3YitHZ29ZL2FvWjd3U05WVCtKSEFpOTFY?=
 =?utf-8?B?ODZvcWJMYUZjbzV6K0FsVXVsc3JiNmdKTXc0bGRLbmNVbVR5VEowaURPbDVi?=
 =?utf-8?B?a3d5eG5WQWVraFVkMzh2OFlXSktPb2tJcFhmQXgweUEraGRFQU9laDd6M3h5?=
 =?utf-8?B?YzVqY1owRlQvY2FWaUhpUG5TOUhRQjl1ZmNrNC9CZ3VmUlZQWFFKZmJTL2xl?=
 =?utf-8?B?Wm1nRGwxR3EwcjB0aXFNTjFSNFVHKzZDTjYrbTVQU3ZuUUM3dXFsaVJWakF5?=
 =?utf-8?B?WTFqZGE0dGIya1pZVXR1blVuZVZUMkN6dERTT09mZ2t5WDJTV25FWkpLWTRB?=
 =?utf-8?B?eXNabWhvWFZOa1MwcVhyVU1ydEdHemk5V2srT2hRY09xY0NYVWtPTlF1WnJR?=
 =?utf-8?B?RHZ5ckQyd2NGN2p6V1ZtZEtXbFlKUExDRnFUM2N4c2l1VHVaL3dRWFRMOVJK?=
 =?utf-8?B?NmorbFhDNHFkTE84L0JublIrRTE2RWp0R3B6cVZLcWllVTBVOEp0ZHJQTDFZ?=
 =?utf-8?B?SE1vcXdxdlp5SGcvRk9mai9pT2g4SDhONVphc2w3MEJtSVl5d0R3WVh4dmhS?=
 =?utf-8?B?Q3R1Q3NGZXEwaWtSZTRkQkdNTitCOG4rcDlycm5uckZuclJFSFhTckh3Yjhw?=
 =?utf-8?B?Qm5ZOUNNZEp3Vk5sOEVrTUxtWG4xN3dhZ2h4RERUU2ZKcG42U2FiakhsV1Zp?=
 =?utf-8?B?QXJBNzFDMWNNaU9UNmdXS3lSekZZM1ZmZllmdExkMXJ1RERQUkd4QjVKaXBZ?=
 =?utf-8?B?MFh5K1p1Q1Rtb3h4MElMb2E3MUtpeDRPZ1Aybmo4NCt5WFY3cFl6TUVaS1lF?=
 =?utf-8?B?Zkprc3U3L2xEVWkxTWxVRGtYc3MvZUd2cFVpeWkzSFhUU2ZzZDloM2JETlNR?=
 =?utf-8?B?M2RzZ01vMWY1NkxoUXVYaEcwU2ptenNKc0prRXJhTWdNMGRTSmJ0SzIxVC93?=
 =?utf-8?B?Yms4VWQ5aVRLcit0TUNVWkFKdFg4alczUjJ4eDB0ODRlTmhrSjZFUmZIQUkw?=
 =?utf-8?B?TWxjVGJrSnhuMlVQVUtYVEJ1SUcyR3p0YVkwbUZKdjlaMDJzVnVudWNEV2pY?=
 =?utf-8?B?R0hGVTc5bWJUWFk3VDF0UkFnVk56VVhvazk3V2ExaEd4SWIyU1ZFR3hDLzdm?=
 =?utf-8?B?R3pJeTlmeHorUExhdStMT043cmYyQ1ZycGJaeXdUazN6Mm1HZmtxVmpzMzJs?=
 =?utf-8?B?SHJaYjVOK3premZNNjZ4ekZ6YTd1V1A3QS81U2EySmVURXBId1F5SUtaVlls?=
 =?utf-8?B?YVArczcyNHdidGdXZkdvWWFGUjZoWmh0dlNFODIxcXRuUEI0bzdoM3F1OW1B?=
 =?utf-8?B?TkZndXFaRm1wb1h1M2hJVi81K2JxaTdGOWFkc2lZdFMrZ0lPRU11eGN0Vlo2?=
 =?utf-8?Q?GfZZ/lq3XGyaZNyfELcHNB4MYw85w4=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2024 08:19:40.0193
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 439908a4-758a-4337-7a0d-08dd23f3b66d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000009D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9283



On 23/12/2024 11:52, Luca Fancellu wrote:
> 
> 
> Hi Julien and Michal,
> 
>> On 23 Dec 2024, at 10:45, Julien Grall <julien@xen.org> wrote:
>>
>> Hi,
>>
>> On 23/12/2024 10:42, Michal Orzel wrote:
>>> On 23/12/2024 11:06, Julien Grall wrote:
>>>>
>>>>
>>>> Hi Michal,
>>>>
>>>> On 23/12/2024 07:58, Michal Orzel wrote:
>>>>>
>>>>>
>>>>> On 20/12/2024 16:19, Luca Fancellu wrote:
>>>>>>
>>>>>>
>>>>>> Commit a14593e3995a ("xen/device-tree: Allow region overlapping with
>>>>>> /memreserve/ ranges") introduced a type in the 'struct membanks_hdr'
>>>>>> but forgot to update the 'struct kernel_info' initialiser, while
>>>>>> it doesn't lead to failures because the field is not currently
>>>>>> used while managing kernel_info structures, it's good to have it
>>>>>> for completeness.
>>>>> The last part "good to have it" does not sound like we need a Fixes tag.
>>>>
>>>> Reading the discussion, it sounds like ".type" is not always set and
>>>> this is not properly documented. This means that in the future we may
>>>> write a patch that requires to use ".type" and needs backported.
>>>>
>>>> But this would depend on this patch which was not tagged appropriately.
>>>> Therefore, I would argue it needs a fixes tag (even though this is a
>>>> latent bug) or at least a backport request.
>>> Setting explicitly a type for structures not requiring it, does not seem beneficial for me.
>>
>> I have to disagree. If we set type everywhere, then the developer doesn't need to think whether ".type" is garbagge or not.
> 
> So, my thought was to at least initialise it on the structures that goes around in the codebase,
> gnttab in find_host_extended_regions and shm_heap_banks in static-shmem.c usage are less
> spreaded.
> 
> However I have no objection to always initialise them all, so that anyone sending patches that
> use them, don’t need to think if the field is initialised or not.
> 
> I’m currently on leave, is it ok to wait until new year if any change is required?
Hi Luca, yes, please send a new revision once you're back.

~Michal


