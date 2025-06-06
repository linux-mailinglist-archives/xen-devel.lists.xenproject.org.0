Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD91ACFE59
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 10:32:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008138.1387352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNSUm-0000lf-4f; Fri, 06 Jun 2025 08:32:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008138.1387352; Fri, 06 Jun 2025 08:32:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNSUm-0000kC-1k; Fri, 06 Jun 2025 08:32:12 +0000
Received: by outflank-mailman (input) for mailman id 1008138;
 Fri, 06 Jun 2025 08:32:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Fse=YV=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uNSUk-0000k2-UD
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 08:32:10 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20613.outbound.protection.outlook.com
 [2a01:111:f403:2412::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb4a64ba-42b0-11f0-b894-0df219b8e170;
 Fri, 06 Jun 2025 10:32:08 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by PH0PR12MB7931.namprd12.prod.outlook.com (2603:10b6:510:289::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Fri, 6 Jun
 2025 08:32:04 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8792.034; Fri, 6 Jun 2025
 08:32:04 +0000
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
X-Inumbo-ID: bb4a64ba-42b0-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=niKRyPSuas780ImQN6DcoiH0q5HCS+NAlwTr8/8Zu3YC0TALwiOUHkQsm6qRtCnLvxjeDjdA9lFVOeTPgarK7K0sn1ognbHVH80VyPxJXtDXxGOTGrgBaOJNHTosvplqRH2QA4fSR+ooAZdaZi1DyWF4EYqS9ZOZidwANFDMWdvi7j/A3UIHPoDORlfwVbODAGm/6t0sMuIDlweqfvc4Tu2vAb5wreInVsb4gBYRh1UEqmrr88R2DfwPKIepw16VAqHJ4RA1SQA1WCBxTGUD98fqMfXlCzyAeHiB+Q6xr7fXtWi98uroZpMf47GvZ95Asj035ioy2JUsfjRizdJqgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N/TCQW1pd3VI+rRHtffuWj3s8ar1Gu95HAPmXHB6XyI=;
 b=DHy1401XYBIKaSnVIS94Gm9Dy6zRAfXQA75WkAfm4fiQNqW2apuPUMPTexCBpWd3E63ZiXb9fzopmX7Hqz9sZjHUc/0YzdoBRfSmUtn2XjG7RK5yBq/NYsZp1AUP5fBwqxHM9NKzD32b+iQWQnZUy49AXAe2q+wv3/Xu6fhKOofn/VEK8z2PE/ybwBrIez6b7zqTRkLgSYzIzzSzelH4IWm81SmsY4ByHAEFZVqZSV9fzCDqTkAXg81bhseJZ5AaALwopkNPgrHSaC1Rhl84+o0LfnyEtj4q6FjaJWauwbf8aA0gOQJ7p6wlzcvWuXjHL460Y3Kh+KQbes4vQw8iPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N/TCQW1pd3VI+rRHtffuWj3s8ar1Gu95HAPmXHB6XyI=;
 b=Jn5NooB6ZjWQoXfhaPGtRnm1CYbePKZKCkZYgmLbkgiH64JEnhDZ+5/gtJ6XlIqeNp39508L6z+kO9KaEVtFTvhJwBrHlPF691W6QCpOIQSQxgiWiAjQttyod3XF1E5MP64uoQsL4WdAEqD2DH96f0CYKGhqpxfqdooDdV1Wor8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <caeabd0f-75bf-4f87-b1c7-076b5183741c@amd.com>
Date: Fri, 6 Jun 2025 10:32:01 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/arm: Standardize R-Car platform Kconfig
 descriptions
To: Jahan Murudi <jahan.murudi.zg@renesas.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250606082735.3475058-1-jahan.murudi.zg@renesas.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250606082735.3475058-1-jahan.murudi.zg@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU2PR04CA0296.eurprd04.prod.outlook.com
 (2603:10a6:10:28c::31) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|PH0PR12MB7931:EE_
X-MS-Office365-Filtering-Correlation-Id: ab03fdd6-4c3a-49fa-021e-08dda4d49de3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M0R4TnZQUjN4dk5Rbjc0Q0lGWWJMcmY0RWdnY3cwb05wemRCTXF2bFY5clZQ?=
 =?utf-8?B?MDF4S3ZQUEtDYjN2a0VFanVqSkRrdy9mdHB5Tm9rSjZhYlI1Wit6bms0Mkh5?=
 =?utf-8?B?Q1FEV0c1akMyVDhXUkJzOVZobEVqMkY1N3YrTlJZOGRGb01INWY4NHZXZDR2?=
 =?utf-8?B?cnVmMmRMQ20zZmFXNCtQRVBLaWwyRXFidDZyeGV3emw5Ymk2YVVNcnRLZ0cz?=
 =?utf-8?B?VWhoZURNeFUzS1FPZE0ydkMyVnlKR1llMTQybWZ2V2pVc0RaM2hZMElsME1s?=
 =?utf-8?B?R0VlZzF0akJwallMVldXeEFJYlR6VlQxVlRuMDMxL3VKMXNOTmJJOGNIbyth?=
 =?utf-8?B?NGQ5LzJDRkhoeTVtblZXZ1J2Zm9lTWRQRTA4amhiN0hid1QyclNhb0lJQWxE?=
 =?utf-8?B?QWNwZFRZMkd4VHZsbzF0MEpzVmxjT0tNbHJDZk1SVHVTMk1IUUJmd2VDMC9x?=
 =?utf-8?B?N2ZhTGtMS3ZKd0xmOHpOTGhIUjkzUnMxZVhwb3Y5dmxzK2lNMU01MERheElJ?=
 =?utf-8?B?SVJCbFI2S2lxT2VUNUhBKzBQNm9RTkhvaXg0bk4xS1ZUejBXNUg0b3EvaHJE?=
 =?utf-8?B?Z0xzWTllSEZqeHlSUHVXN3FOdVdEc05Xd3J4OVQreWN6REJweGtxL1dKSUV2?=
 =?utf-8?B?Ymx0b2FydjNZbHRObVlqQ0lXWHJkMnFSbkdrdlRkTUFIbUhXUHY4ZUVaRHNH?=
 =?utf-8?B?azltdmZXS0ZBcm1ZWWUwS0trWE1xQU5hanVMc2dVaWV6ZEwrdnBiR2lOTHB3?=
 =?utf-8?B?NHVkZmw5bmRsRW05K3NGVE1qeHJJOEVMbjBzU1FkcWxqazZOVlZFbUJHZ21T?=
 =?utf-8?B?L3JXakcyRHRvOXMvMHBpMlExbzVWWTZmZG92MjVNSGppcUpxeW5EQ1NyYWhn?=
 =?utf-8?B?VGNYMTl2REFDNytLbmdMc2doYnYyRlhSRDR0cDVRMG1jYzgvZFZGZEg0Z1dt?=
 =?utf-8?B?VzRXSks5RWoyVlUvejZsMVRSR2ZranhocTRSNDNKS2VWSVJvRGpIVzJHQ1BD?=
 =?utf-8?B?Z0ZLajkvM2FDL3dieTN2b1dFbTM2UStBVjBtU1hQYzRXMDNJYU1seGZsUWVt?=
 =?utf-8?B?Q1VLMkVzZThmZkFXQ3VodzZSS3lBYTdWTGtKbmtITzNtY04rRXFQR0hSb0NF?=
 =?utf-8?B?WDdWWkhMVXozaG1VeDZud2FMMk9sT2JlQTRxaTBPemJibFc0T2NCbG5iTlQ0?=
 =?utf-8?B?bDhRZzVQVHhERFMzWUV3NFQ3eFFnQS9Zd1BzcWhYV1dUa0w1c29teHRML2RW?=
 =?utf-8?B?SzQvZFB2VFVDUmlIQmhPcFV1dDhPaEJuQ25xMmtKejBuREF2am9GOVNIcHk3?=
 =?utf-8?B?MFVmSHJ1bm5MNXdPbkN5SHNIdGpVaVdTVFVTa3RycllFVlQyQ1diZ0lQdXVK?=
 =?utf-8?B?b1NFUHArcGtLUjcxY0JOVjA3UHlNQnRzUk4vZXFqclZHU3pIMll6cjJmTFQ5?=
 =?utf-8?B?N2xrdmxhTTBFYUtzK0JSUXBWUnIya2hUMXZpWnJwdzQ3M2k5NFdqTUY3TCtQ?=
 =?utf-8?B?MnBJeGlUT0JTb0NVUk1MbHJXSC9wOEsrcE4rRS9NTVh6YjFOYWdCeE1rMERM?=
 =?utf-8?B?cDdvTzlKZ21IbnlOaHhsOTRadHFGek1haVZCYjF2OGMzblU0VVAvQ2s0MFZZ?=
 =?utf-8?B?cUlrNCt5KzU4Tllsbm9lem9RWnRyR2o5ZHZteFR5SGdwMGNZQzZLMjBMSi9l?=
 =?utf-8?B?STNFUkNpZ2JMcEVmYUZTQVRkcE9HME52anI3eVorcTVIWDBjbjBaaEJBa21o?=
 =?utf-8?B?aGpOcVMrQStUcUl2RmEzT091bjM3c2dKMWJzVWY2NmF4aHdLWXlkYTdmbFhX?=
 =?utf-8?B?bmVFOEppdlp5K3N2bHg2WUNSK3d2R2V0RzhIZ2pCb3RQZjRVL0NxSWNrUmtF?=
 =?utf-8?B?bjNQSFJBVldEZDJNWXROZ21vUHBSbmoxTGNSQmx0TXJGTE5sRjR2cVBFZml6?=
 =?utf-8?Q?b0x5Kip6Qf0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dXRvMFlBNUphRlZpblpyWk1kQ1lyOW96cjYyTVBZTXpHRFFxMGFaZEpqcE1h?=
 =?utf-8?B?bmdGZkgwZVRsQ0RoRHE0d2UyNUhoeVFZQXhvU0kzeWlJRHRmMEFnby9hSzl1?=
 =?utf-8?B?R3hXMi9JUDFBak9nUW0xSUhseG82UTJjMCtneU0wYzBzNHExTDVsSFZlUnBz?=
 =?utf-8?B?cUpwaENQWFVWMHl3R1ljVWdJYXg2b1N3WStDNmd2WXEzbThjTUtNcWx0YnJ0?=
 =?utf-8?B?Y3JjV2FISTNnOHMyYW0xUG9FMjBWckMwb0pxWFZCU1puWGZDSEp5VlNmaERO?=
 =?utf-8?B?SE1rRlhtS3hLNkZCVmpFRUpONHlORllLcTVsYXNtMTFiOVpBbHNqdlV5R1RI?=
 =?utf-8?B?SGxBTTdGbUNrMFZGOWZkdDVzVXN1T1BzYXFEdHEzNkhIMjRHVkhDOFRkWVdw?=
 =?utf-8?B?UXFscEhlbndKMjJuaHlSZXlWdkF0Uy8xN0FDNUx2Zm1UUG5jM3BvTWdTTk9U?=
 =?utf-8?B?Q3Z2eFdlR1Y0QmwyOExUM3hpOWFtVlFlWno5RThvTEVEeDV6NDRNK0pNa3Bp?=
 =?utf-8?B?YlFoQmZLTXZtNHBEbHR4ZkZGbml3bXVpREZGTUx3MzRDVEtWRjEzYndkUkhi?=
 =?utf-8?B?amdqQ3hrQkw3cmxFZUlWclJkSmRKdnRLV3FxeEVVTjgyUllRS0hhK295T1V6?=
 =?utf-8?B?WHFxVUhBUE5oR1l4NzNwQUtQdEpPSStVeVhrMXprcTl6ajNwL25OdTZPRTZw?=
 =?utf-8?B?YmVlZENRY1ZaQlZzMmN6cFlSNUQ2OUZBaFhvUHl0dVZnY1ZSL25DeHFHVWJG?=
 =?utf-8?B?dWl3K29pZHZ1aUkwYlpxUmhQajJHRHV5VU0relRnTktWRm5pbmpiTXI4Znp5?=
 =?utf-8?B?bld0akhtYzlmWUk2V1FabHZOeW1ZQzhWRTUzN3NXdzZ0eDBrVFFjQmV6dE04?=
 =?utf-8?B?SjdpOU5taWRXSWlCNWhkRU5BcHF5UFl1a3cwTkRHZllsQUxZYnJ6UWJscmlU?=
 =?utf-8?B?VUNjNHQzMm1VRjQ5V0xpbmF5djluNlcxOW5OZ1hHODNNTnBKd2E1NU9QWVVT?=
 =?utf-8?B?SGswT0JKZXFsUUsxek1OeGowWWlKekJXME4vWjM2TnRlUlh2S01rMnNhcVNV?=
 =?utf-8?B?VnczdGhQTWl1MS9URVdQNDIrQXZNeTJtSkFhN1k5bWZqa1h2c1ZSalBRM2Ns?=
 =?utf-8?B?ZDgxeU1RcHk2cnpHeWdRYkFSUWhCRGk4OU9wYmxZS3M4aGlNU3RLYVg0a1Yr?=
 =?utf-8?B?V21yOTl5VlQxdUx3UThuczZDL1ByRHZUUEoxRDBUWGxLOGlGS3hxRmVBYzYr?=
 =?utf-8?B?ZVR4NkRtT2FFYkNlTCt5WU5oelVEU0VOWmxsTGw2cFpJVnhjRUl4ZmdUbUl6?=
 =?utf-8?B?M3ArdXdKaWNvS0o4ZmIrdzgxcFZ3UGJGU1ROUFhxZlVkdHRvR3JNVXArZEhn?=
 =?utf-8?B?emNNcThvVjQvb2dxTnROZmNSZlN5OEN2M2EzVS94Z2MyYWhqay9Zc2JDSjNj?=
 =?utf-8?B?MDBxbWl6Ym1RMmtaY3c4bHphWEhSQmNKRHoxdXNFbnZTbm1EL1BPUmdkdytR?=
 =?utf-8?B?R05NN2pZV3QyUzF6L0lRMFVoSnBIMkQ5R00xakNDbTJhSTRNWmlvUEVPelFt?=
 =?utf-8?B?azdqS3pia0FQcWdKMWF3ZndnYWhCVG9Yb1BkbFJxTnZwd0lkVjBFMWNSYWFJ?=
 =?utf-8?B?c1NYYnlBVGFYWjAvODM0OGpxNk53eHBmenJlTzMzb0U0SHY5eEFPOWUrQ3ZD?=
 =?utf-8?B?bm1wOHFnL0FabGtKWThQbFhLN1NIOTU4WEF0RnhMaWJaOXBkMkRwWXgxVEth?=
 =?utf-8?B?K1VDNFhncHhTRTN2S2J2ZDAzSTVLQ1oyY3lLUWdYeWxLZXdaRmw4K2U3Ukc2?=
 =?utf-8?B?MFhiMlNyWFFFWHREV2lMNWlyZ09DbVo0d1RQL2h6dGIvRnlVSUtRclIyNW4z?=
 =?utf-8?B?MVFsdlF4TmZWNmpNRkdST1B1SGpkbkdKNkM2aVVsejgwMnhldW1Nci9HdWxw?=
 =?utf-8?B?VDZvR2RZMWd1UDJPN3p0QjNodHB5STF5cThJaXFOeUg2cXpLdVhsN3VzbGpV?=
 =?utf-8?B?MlFpUHUwbkpDQ05nNkxSdTU5Y25MWXpManpYZVkvbzlVS0pFU1VFRTQvK2Rr?=
 =?utf-8?B?RDJsZ3RyOU4yMFg3bjdKL1ZXTmI5VzFWR3RVK1hqbUxwL3RrNUs5Zm1aTWhX?=
 =?utf-8?Q?ooxU=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab03fdd6-4c3a-49fa-021e-08dda4d49de3
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 08:32:04.6752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QnYi7GRuIEtD3YwxeSdXjBllTPc/uBUXxDzg0xL4xejiWEzCPIpkAp7YooSwV3zH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7931



On 06/06/2025 10:27, Jahan Murudi wrote:
> Change "RCar3/RCar4" to "R-Car Gen3/Gen4" to match official Renesas branding.
> Aligns with documentation and industry-standard terminology.
> 
> Signed-off-by: Jahan Murudi <jahan.murudi.zg@renesas.com>
I already gave Rb in v1, so you should have picked it.

Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

> ---
>  xen/arch/arm/platforms/Kconfig | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/arm/platforms/Kconfig b/xen/arch/arm/platforms/Kconfig
> index 87bf614788..c8bc0bfae3 100644
> --- a/xen/arch/arm/platforms/Kconfig
> +++ b/xen/arch/arm/platforms/Kconfig
> @@ -22,21 +22,23 @@ config QEMU
>  	  machine.
>  
>  config RCAR3
> -	bool "Renesas RCar3 support"
> +	bool "Renesas R-Car Gen3 support"
>  	depends on ARM_64
>  	select HAS_SCIF
>  	select IPMMU_VMSA
>  	help
> -	  Enable all the required drivers for Renesas RCar3
> +	  Enable support for Renesas R-Car Generation 3 SoCs (H3, M3, etc.).
> +	  Includes all required drivers and platform-specific features.
>  
>  config RCAR4
> -	bool "Renesas RCar4 support"
> +	bool "Renesas R-Car Gen4 support"
>  	depends on ARM_64
>  	select HAS_SCIF
>  	select HAS_ITS
>  	select IPMMU_VMSA
>  	help
> -	Enable all the required drivers for Renesas RCar4
> +	  Enable support for Renesas R-Car Generation 4 SoCs (V4H, V4M, etc.).
> +	  Includes all required drivers and platform-specific features.
>  
>  config MPSOC
>  	bool "Xilinx Ultrascale+ MPSoC support"


