Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F95B38757
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 18:07:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1096468.1451160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urIgB-00071r-IO; Wed, 27 Aug 2025 16:07:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1096468.1451160; Wed, 27 Aug 2025 16:07:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urIgB-000708-F2; Wed, 27 Aug 2025 16:07:19 +0000
Received: by outflank-mailman (input) for mailman id 1096468;
 Wed, 27 Aug 2025 16:07:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dVpB=3H=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1urIg9-000702-B3
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 16:07:17 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2061f.outbound.protection.outlook.com
 [2a01:111:f403:2405::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e5a32145-835f-11f0-aeb2-fb57b961d000;
 Wed, 27 Aug 2025 18:07:15 +0200 (CEST)
Received: from CYZPR20CA0010.namprd20.prod.outlook.com (2603:10b6:930:a2::18)
 by PH0PR12MB8774.namprd12.prod.outlook.com (2603:10b6:510:28e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Wed, 27 Aug
 2025 16:07:10 +0000
Received: from CY4PEPF0000EE3B.namprd03.prod.outlook.com
 (2603:10b6:930:a2:cafe::8f) by CYZPR20CA0010.outlook.office365.com
 (2603:10b6:930:a2::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.24 via Frontend Transport; Wed,
 27 Aug 2025 16:07:10 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE3B.mail.protection.outlook.com (10.167.242.14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Wed, 27 Aug 2025 16:07:09 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 27 Aug
 2025 11:07:09 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 27 Aug
 2025 11:07:09 -0500
Received: from [10.252.147.171] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 27 Aug 2025 11:07:07 -0500
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
X-Inumbo-ID: e5a32145-835f-11f0-aeb2-fb57b961d000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X3BGrh9Ve32atBDytrATuoNpuuKvgxOH11rQarV5Fo1PcNc3NgLff1JL5WM1zVDF6tM9WeHntnvb20vKVaeMzE1K3I3x7K3+KDpQIDHKQF7JyWIJRUcBLoJCi+k+xeeiLXkRcidnEtAWs902sneJ2iIdJiw5qaaPpcgmB5tEE4FWY9Br5fXDjiMhf/RghdQgDIAoW0E6fzPx2m/EeDbxLee8MF+xWlA1o2SpOp1Hz7h4B9nMG+rL+6lj/UDKtkCoNmGm9t9fPYivniC3+jOPsNnUtMyqF43XqC7dRUiCDnDD34+3jy98p+GzD3MwlidnLKfuaAjdhQaAUPV6CD6xmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NLHpF2zNeYT9+317lnCMJPv7NbijK5Wkd9pq9dYrJkw=;
 b=UoA9T85LjcTC0s8EeoqZDkEHgXnVaC77U+5TeiP5nzJ7NL2AhncEa/HnOX6W7KmDf/getLJ854idJwy96xovwYWmJjNBBx5skdSY7NiINjZ7imBIkBLZA2t14+u7/WaVZVnyllRarmdqMWkENpnBURZ/jrHW/JpYz4S2HCPXd90dbLT0Yn/Pm8O16f4rHZCZwOHxsIG+5yFFwtL7rdv2mFhYGmRY8TB4gFEiU0mMHESv7GDsVIuXlvBrK6Thr38YdIy0D9s7ARdyjzEHVQTDpObbyPUoUTdU0N3+2GpwhRZMSaMh3XvtIYAyKAoLZ43K1tth+4hnkAVshWGe/IcooQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NLHpF2zNeYT9+317lnCMJPv7NbijK5Wkd9pq9dYrJkw=;
 b=xfjuxpSX0D3rGpbZKo7nEaTFQkfCQO4yuVKZm0C1jE16SSlg88LA5nVs3+jlNogvDGdRUpY6C50bPYALdaBDLefoy41k6YCoE5nNcmLVGXohqV2df1uqpuHQwaI9zkh1IsrdKZlYvIX090lpt8007hwzLOpz8C2eocwhAKIQiDU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <3ae27fc6-dea3-4f61-abd5-4cad45d07b6b@amd.com>
Date: Wed, 27 Aug 2025 18:07:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] xen/arm: map static memory on demand
To: Hari Limaye <Hari.Limaye@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Luca
 Fancellu" <Luca.Fancellu@arm.com>, Penny Zheng <Penny.Zheng@arm.com>,
	"Stefano Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	"Bertrand Marquis" <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Chen
	<Wei.Chen@arm.com>
References: <cover.1753864612.git.hari.limaye@arm.com>
 <c85ac9d6da3c13dabd26627faac90ea95feb3f95.1753864612.git.hari.limaye@arm.com>
 <b12b9c9c-069c-4c45-adc6-5b7026f812f7@amd.com>
 <7EDCD060-4EC7-4727-B524-225A5FB7A0B7@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <7EDCD060-4EC7-4727-B524-225A5FB7A0B7@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3B:EE_|PH0PR12MB8774:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a44ff2b-b1d4-4b19-1522-08dde583c715
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VHhxUWVla1U3ajNYcmNBWnJhV3cyeEFzYUVPMVNvbjNUc1c5UjBaaG00dEhj?=
 =?utf-8?B?WlFNNG5nZzZkN3JOZUVPeThndDc5NXJycytLS0hnNjZVMmNCNExzNzhtK29u?=
 =?utf-8?B?RC96VnNwZEkwRWI0VXkxTGV4Vkdwdk5jL2pqamRMcytwd3VUeGtmd2N6QUtm?=
 =?utf-8?B?QndNVlRDUVdqVzRvb3dlZXl4SVY1M0ZwZGQ2bGwrYWY2amswbk1aNUlGcHlS?=
 =?utf-8?B?aDNBbER1ODZXQ2p0TEZRN1FCWVMzYjZmenl4RWNScnI0RFEvSWJ0UHhSbnZ4?=
 =?utf-8?B?RUFwV012ZXdsbG13TU8xdEwvT2RTeWtrSTlhdDBqMkFQVjNkMW5LQjYxbi9Z?=
 =?utf-8?B?S3pEa3NVNVpabUFIQkFvL3hnMzFURzdBbXVIUWxyOGFGUXNUODBQZGZ6eVV6?=
 =?utf-8?B?NGVLa2V3aFpJQjNFb3E0K0pmdGU0N0h5V2lNTG5KT3B5R2FXWmlNK3VaTVB5?=
 =?utf-8?B?a3FGRUdBREs2YUEzSkhDbHRwdkEvNTB0TW80TVZaeXJrU2NSTW9MS0hHNkpY?=
 =?utf-8?B?bi9NOGl6SG5yUCtYSXNMcTl1R3JGNjljOWFoRXNXcWRxRjBTSnNwY3pHWjZa?=
 =?utf-8?B?NTVaa29XLzg3TjNGK2dERGxoaFBPTEFjeElLUU5ySWx5UUJUQnE0NFN3TW1Y?=
 =?utf-8?B?bE9jdUFiTDN3d0s1cFk3c0tabS84YzlOaFBOWm11UWgrV24wdDBrWWZjay9h?=
 =?utf-8?B?TWZqQzFVZFRyZXZjaGhTQ216UGZsS2VOT0I0MSsveUxmS25LL1ZQSFR6S0RL?=
 =?utf-8?B?NEp3Z3pVTm9ZNEtxTGxEQmRZYk9hYWFYK2xHRXlWRzBLSmZyQjJ4MEZlK0tP?=
 =?utf-8?B?aVZpbWxOeWJYNGd5N0YwVjE1bldhSVF5SkZySjVOOW9vRkNaVnNjcmxoUVFX?=
 =?utf-8?B?T0hSZ05sRVYxNm96WTcvbWF5STF0ZnV1TVcrYjVDcmpEZ0gzUDRNMDdseGhr?=
 =?utf-8?B?YktldU4rK0RNZlVGeFJHY2d4TURBcmVFVzlOWXpDanljWU9jZlR2TzdrZ3RN?=
 =?utf-8?B?MVUvQ1lVZEkxQVhPa0MxMEFTNWhMencvZ2c3RnkzZzBEbDQ1UzlxOStrVVVu?=
 =?utf-8?B?cTRKTVZqd2NkRDNSeHVaQitqVkN2VVZrS0lrUWFQU2lJMWpjMWNZS2RZa3RP?=
 =?utf-8?B?RGVVVXFQaG5WaGFWTlova1RVdzVyb0xBa0hNb25wZVVDRDJUakJJOTI1S25p?=
 =?utf-8?B?a0RUa0J3ckkwSWFTRmZ5Q1AvS3d3MVlRU2hsSnJaOTY1Wi9vRkVDMTkxWGF5?=
 =?utf-8?B?ZXVldmFDeE91bGNaWnFPK1hWbWpKZlVJdjVDNzZpMFlPQmpzR1FPTXpWTHVV?=
 =?utf-8?B?SHUyaHhhUTJLVEkvUWNaZ3hmbEcyOHlhc09LbDRjRDI4ajVtdDZUcmlqNTRx?=
 =?utf-8?B?MG8zeHF0Y2drT3BKUnBjUzd6TjA1Ri9OUmlrZkdTdjk4aytya1UyazBPSzc5?=
 =?utf-8?B?VStDYmMyd3lPOXNMb1hWQjI1REtiQzBrT1pZY0dnTDNzdm02Zm9aQ0lyeWJF?=
 =?utf-8?B?ZkNGR0JHK1ZWcDZ4Sm80ZURoZ2RNNU9iR2NVMGRaU0RYUWVVTWZNdHNrd1Fy?=
 =?utf-8?B?Z2FjU1NTeWQxZmJrODBaRXpIeHZmT3VqVXZYSWwwMHBRTFlwY1ozbXZxaW1T?=
 =?utf-8?B?bUdvZXVsUitaYnBKeWQydk1CZDJ1VWEyV2ttYzVYWThmUmkvdXBsK2JDUFBF?=
 =?utf-8?B?MW1MRUswVHlvZEZWMDFCUW9WU3pwR3hmVjZOd3l2Sk8rTVFSZ1lKZ0pGMWZr?=
 =?utf-8?B?eEpBNGZld21aSUMzT3VrL21YTndMWGQvbEZLUE1iK29ZTHEvOVVoTlB0Wi9L?=
 =?utf-8?B?WndKME9pK2pYZkRUSWNRQWh4U0N0LzZPTVIwdFZ4N1QyVVdOYmhNanc0N3ZN?=
 =?utf-8?B?Q0lzcWp0NGZlU0I1MTgyQ3ZyZWFIeWUyRWtmbEV3MCs4ajl5UmtQeFB1S0Iy?=
 =?utf-8?B?bWRRUHd3TEkvZ3FCZjNKOHdyZUpuakxHUnFXaC9LM01iS3RaT3daTDdXMHEx?=
 =?utf-8?B?NkJDMWpKS24yVDkra0E4TmYyeFlJc2xoR0FaWTRzVmNSbUVUem9HeCt5NlZs?=
 =?utf-8?Q?xa6EFJ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 16:07:09.9121
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a44ff2b-b1d4-4b19-1522-08dde583c715
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8774



On 27/08/2025 14:31, Hari Limaye wrote:
> Hi Michal,
> 
>> On 22 Aug 2025, at 08:50, Orzel, Michal <michal.orzel@amd.com> wrote:
>>
>>
>>
>> On 30/07/2025 10:45, Hari Limaye wrote:
>>> From: Penny Zheng <Penny.Zheng@arm.com>
>>>
>>> In the function `init_staticmem_pages` we need to have mapped static
>>> memory banks for initialization. Unlike on an MMU system, we cannot map
>>> the entire RAM on an MPU system as we have a limited number of MPU
>>> memory regions. To solve this, transiently map the static memory banks
>>> for initialization.
>> How does this correspond to Arm32 MPU (R52), where all of the RAM will be
>> covered? I don't think 'transient' mappings will be needed there but all of your
>> work targets common (i.e. not only Arm64) MPU code.
>>
>> ~Michal
>>
> 
> Hm fair point - when this series was submitted to the ML, I had no knowledge of the intention for all of the RAM to be mapped on Arm32 MPU systems and imagined that things would be more aligned here. 
> 
> Are happy for this to remain common for now? Or would you prefer it to be split off?
Let it be common for now. We can revisit it after the release to align on the
final approach.

~Michal


