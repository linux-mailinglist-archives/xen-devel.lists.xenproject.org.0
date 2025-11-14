Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E62C5F76A
	for <lists+xen-devel@lfdr.de>; Fri, 14 Nov 2025 23:05:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1162874.1490357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vK1tW-0002YN-7M; Fri, 14 Nov 2025 22:03:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1162874.1490357; Fri, 14 Nov 2025 22:03:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vK1tW-0002WU-4Q; Fri, 14 Nov 2025 22:03:50 +0000
Received: by outflank-mailman (input) for mailman id 1162874;
 Fri, 14 Nov 2025 22:03:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UC5Z=5W=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vK1tU-0002WO-Qz
 for xen-devel@lists.xenproject.org; Fri, 14 Nov 2025 22:03:48 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c8b2e3a8-c1a5-11f0-9d18-b5c5bf9af7f9;
 Fri, 14 Nov 2025 23:03:44 +0100 (CET)
Received: from CH0PR04CA0083.namprd04.prod.outlook.com (2603:10b6:610:74::28)
 by DS7PR12MB5813.namprd12.prod.outlook.com (2603:10b6:8:75::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Fri, 14 Nov
 2025 22:03:38 +0000
Received: from CH1PEPF0000AD7F.namprd04.prod.outlook.com
 (2603:10b6:610:74:cafe::71) by CH0PR04CA0083.outlook.office365.com
 (2603:10b6:610:74::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Fri,
 14 Nov 2025 22:03:21 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD7F.mail.protection.outlook.com (10.167.244.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 22:03:38 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 14:03:37 -0800
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 14:03:37 -0800
Received: from [172.28.100.6] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 14 Nov 2025 14:03:36 -0800
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
X-Inumbo-ID: c8b2e3a8-c1a5-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=luUjtaDArpkZ9ZXHOsxuOhKcVwTIpU8YQO2kmgDXlneP2eNCdT9qtBMufwAJfNnkRI9P5ZRDQlvUYVuumTk9HE5CovkVNKLcCwCfODN8nm8vA31zG2U+fPk2UxW1zCj0SQizXWdMJERjuiaRFcHdvTWb5Zeb5+O4JE+Y+QxFPL4uXtK8amT8MItpSM9NUVr5D0r7Qp83VvegVvYONIwoyuFq2v+8metEH9bhC2nPdFUyCLEc4GYr3kFP0sDHq+eHteTqfBMV/k6j08ar7GUnxvxG4qM2/nCpBDgmMdhADQEvEL8047t3nzQmkNaRdOQhhRU661krudKbA7pevoGxLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1UVjjIpebxIDHSiTuv5xTrYzyOfC+bHZHWpJ9uY0R0A=;
 b=ctTiibpPLYC9QN875W+vGh18LhGGOIHzdgVwvz4KBvXGleclkjI3+Jy3jj0qXEXzyPQ23Y0muU2mEqZC2u68mmcmp7WMzfJN0AThYxWYZkpq+YuSuaEiTvG4Foq/wupjoHr14cuTYSN9rrc36Myt5VhVPjTZTrQrO1xRG3WWW72RzGtwYbUSVlZfXFedRmKMrBs0HD5MMQNM4HlQFwteXVKlzfhU1VPvlAr31NIeCFhK+ZVTQmJFQ2WHQqmJTsN1HNP5Us+nuUfMFKwWCBlCJVkRvHGhN/C6SyXZeJD97c0i9ysNbu50JBAuPBQrT7oKjNuMC5+PP/ie3Hr4c2mQIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1UVjjIpebxIDHSiTuv5xTrYzyOfC+bHZHWpJ9uY0R0A=;
 b=k9Yp7m5EVGP7hvo8nImVdQ9HKKM1Zb/KRkA01rltIWYQhyQ5ul4GESXT9dGUpshzpwYQpG7ZVmrSRNtYPcKO+dXn3m3BRHoJu/0QF7I29N166BpF9FxL063E+702kqPiirCN4dbAm6b2JE4kqAms3Zqh84AORSUhsyUrmtTBqLo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <9bb95ea9-2ab9-41e8-878f-af8de270c375@amd.com>
Date: Fri, 14 Nov 2025 15:45:48 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] amd/iommu: Remove dead non-atomic update checking
To: Jan Beulich <jbeulich@suse.com>, Teddy Astie <teddy.astie@vates.tech>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
References: <cover.1762961527.git.teddy.astie@vates.tech>
 <b0e81bd67c3f135a4102d12ed95a52ce56482992.1762961527.git.teddy.astie@vates.tech>
 <367dc942-7113-46cf-9c54-fa77dc6b4c53@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <367dc942-7113-46cf-9c54-fa77dc6b4c53@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7F:EE_|DS7PR12MB5813:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d8ead4d-9eae-4565-4582-08de23c9aa09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZWtjRUZ5M0UwYVg3d1hONGtiYXN4RW55WGc3V2xyWUowelcrUnFWck96dVdq?=
 =?utf-8?B?alNRVWFnb2VENXZNdDJmdlAvbFczK1pkbzJtYjVKOVFzMmxoYlBMVCtFZmlZ?=
 =?utf-8?B?WkpFdnVObXpNWXNzaktxN21nTTlaUlpUMldUZWJjMHd4V2dDTWh0T1ZVbmk4?=
 =?utf-8?B?YVFWZ2Zia1lCbFBOc3lzejRmWGVSRHUxMHpqR0xrYU1qTFExTkx4ZDF1VGVj?=
 =?utf-8?B?TkEwc1dmTkhmUjgrd0c5ajdveW5hUS85b3U1U1BlTXRQVFc1bmJpWklvdmcz?=
 =?utf-8?B?bVNJdEFXdUJrZW92cDgxVUZPMlJFWDJ0RHFkRHhtSC9HbzN1Ti9oS25yZjl2?=
 =?utf-8?B?N05RZ0VjWmRrdjF4d0dYUzIrVytwOHB5Y2RxbTM5dE4rancxR3RmbkxxRlZR?=
 =?utf-8?B?Z1dRNXdCdktxK25pbzZoeDkzWHFDUWhLR0t1aGxvWk1wbVQyM2JLV3o3NDM1?=
 =?utf-8?B?SjlOSUhWdWJKU0tyYWJvQ1ZaMWJHSmRvM0VkQmh2bzZhNGQzb28xUnNkdGtv?=
 =?utf-8?B?d0NOUFlZTWxVZXh5QzkrWktFNG5hL0VoVXA1U0p1eWJ0ZVhRR1JvUHBSb21Y?=
 =?utf-8?B?K1Niblk1MTFVbWwvMWlVNzVzVHJNT3hIOUN1aEZnNWpwNk9xWTBZR05kUmhT?=
 =?utf-8?B?bll3aFpFRnhXclE1L0FnaXFDSVVMOS8rV2ZHZTlaeDJOM1p4ZTgwUFoyZUND?=
 =?utf-8?B?c2p3N2FGdjZGa0tUUGdzd2JSZCtNS0VlQzFEbkZCZjQ2R1Y5WmdKMXFVdGgy?=
 =?utf-8?B?cGdMazdHdnA0RTh5ZERmVmFDdjBHTWcvZDFhWEw1VnFGUC9HRW9rdkhSeGNY?=
 =?utf-8?B?d3l1NDB2ZHBXaW9Wb2tURklxQkY2cU8rNkdMeUFpM04rU0NxZ0M0SDg2bkU5?=
 =?utf-8?B?YkhCd2VtZm9lczRkcjdTNGYwT1ZsVHVPZnJoeWYydjFyVVdHRjlKdVVBVWtq?=
 =?utf-8?B?U21mWXE5ODI5SlNrNGJLd2JPaHRhWFB0ZTlvQnU2eURvVVk5dGluR3Y1TUV4?=
 =?utf-8?B?RjZFR1JhREg5MDJxYUk0dFI0OUNNK3psUjhXZWo3SUdDYVFYNm9UM1F4blhz?=
 =?utf-8?B?QlF5ZTJSR0x0NVlPNGU1N3RYQUJSWGNLcG5EUitOT04rSHgzSVBTSGE5dzlr?=
 =?utf-8?B?TkhaWmNDM0EzMnFSYUpJbllPN2FTaWpUdlYvUkFrN3g2ZWZDZ3dSbG0zUEJy?=
 =?utf-8?B?REoyU3NHUmROa1lsWGMwbGVFTlB3L2RoS2tCQmh6RnRic2hvUFNyZVp2dFUv?=
 =?utf-8?B?ejJuUm1US2NUb3lZdTFYc0lSUmdFTzlqeGNwNFFpTXQ3M2ZmT1o0WVV4Uzkw?=
 =?utf-8?B?dzBBM3pURC8veHB6bm1MV3pOQ2l1UDYzUU1ZZHJkTjJQclVYZmN4WE93K2VE?=
 =?utf-8?B?a1FZVFBYQ3FxRzF3QmY0SmIvZWRQUzcyWHd5Y0dBVC9sS1RxSnlzWGZMcmdK?=
 =?utf-8?B?ZDZaWEVvVFlWVWhNYzQ1TDBZYjRwdThHSVd5SVVRL3NPa2lkakVuNTdhUitI?=
 =?utf-8?B?dXFXT0dvcmhiTXE4WVlNWEptc2lGOCtXNndoMCt3dGkvTFZBT1cxRWZPYzZT?=
 =?utf-8?B?ZHMyZkFZV2JxY1hPTnFsUXIvQkpseHZBZnN3S2lkTmdtc1FpaWNCaHBvUnRs?=
 =?utf-8?B?VktMVzRHUCs4aWp2TGI3QkkxTkNJcTNVVGtWTTA1bXJHakM2SmkyNDFPeUhw?=
 =?utf-8?B?TUlCUVpiS0tFakMvbm5ZUFJLQllnSW9iQ0daSGdEQmRFQ1Z3T0xTclZvcmFE?=
 =?utf-8?B?MTFqVXdDeE14WE9SclRnK0U2VFVBU0tsRFlxUm80eXgvdWlaaXNEUWVQQzht?=
 =?utf-8?B?TnNYL1VwWUlBZXlPclJKRlhOOGdtN0luRERnd2NWSmhaY0pMTFNnb00yWFUz?=
 =?utf-8?B?TExLMDZiWmM3YW1lUGF6dnRITWRjU3V1SEF3ZGErZzZVUEhVc2xQQWFMWHg2?=
 =?utf-8?B?TVRJTkdHYmN6Q3BGWGphNm9sYnlwaWVTRk1KS0tiZUZlQ1NMdWo1S1hTbGJs?=
 =?utf-8?B?czdqTmJRTkYwZGovbFhPOXE5ZTFQK2lTWk1wYWRUaXBSdlo0eklHcWRHcVQx?=
 =?utf-8?B?dDhvN0hQWFUzQldDcWlTOVhXK1FYSGx5WEhwcW5aZXduR1FMM29lcTR6bTV2?=
 =?utf-8?Q?mn28=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 22:03:38.0766
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d8ead4d-9eae-4565-4582-08de23c9aa09
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5813

On 2025-11-13 06:37, Jan Beulich wrote:
> On 12.11.2025 16:37, Teddy Astie wrote:
>> When updating a DTE, amd_iommu_setup_domain_device() would check if
>> the update had been non-atomic (i.e rc > 0) and throw a warning if
>> such non-atomic update could be dangerous.  However since commit
>> 3fc44151d83d, rc can no longer be positive, making this branch
>> unreachable code.
> 
> I.e. it addresses a Misra concern and hence ...
> 
>> No functional change intended.
>>
>> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> 
> ... wants at least an Amends: tag, likely a Fixes: one. Then:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

