Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 633D9A4D60B
	for <lists+xen-devel@lfdr.de>; Tue,  4 Mar 2025 09:18:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.900845.1308820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpNTQ-0006FN-Nb; Tue, 04 Mar 2025 08:17:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 900845.1308820; Tue, 04 Mar 2025 08:17:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpNTQ-0006CP-Kb; Tue, 04 Mar 2025 08:17:56 +0000
Received: by outflank-mailman (input) for mailman id 900845;
 Tue, 04 Mar 2025 08:17:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8kcs=VX=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tpNTP-0006C1-KY
 for xen-devel@lists.xenproject.org; Tue, 04 Mar 2025 08:17:55 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20628.outbound.protection.outlook.com
 [2a01:111:f403:2418::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2aa178aa-f8d1-11ef-9ab4-95dc52dad729;
 Tue, 04 Mar 2025 09:17:53 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by PH8PR12MB6747.namprd12.prod.outlook.com (2603:10b6:510:1c3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.29; Tue, 4 Mar
 2025 08:17:49 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 08:17:42 +0000
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
X-Inumbo-ID: 2aa178aa-f8d1-11ef-9ab4-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pXQAMk/EEav/DPgDxpLDovb8ywfzt8jGYAMjYAqCEYOPSBkCO/vgKaAhwJ23yGC+1MNE2fTbQlQdrbOJ7U+1N+jglZvaOtaGcKerZ6HdGHdJ4ZXfSc5boqY9MzYblfz4U4EMtHDUzuApiPgB9xzQr2oQyKWOBMt0GCqt78ADkLPKWhuBxxGC4X6AoXV7JH+4ZFia0/jK/7IdSF0opz4Bb9xxC7znf3IRrF2yHFX2LSbSDZochRFY+OvcPbOb5P4Iwc30+LzkZ2zy4mWZpvnaeKoDG7tEzfXWIPhpyiHay6Im5WHwhjOGNOgCLuFn1XIJ+R3oZEzQ/k60rJPiH8RCJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SsAWZfdnJqXz0aa5cY6heaifmfkbOH7pvqDehqhz9ug=;
 b=ePlY6N3ASF3WsgHdn9VmNCQToZJeD5wDcJpqJUpCk7V3DESKRiFh3sPF4eXfNY8hgpe6Uo28V5Pu25cP34E3yWRNgSLuOUr0Xzqf063T6RnUdCO5c6JYuKX8XGGgXRcZvKZhAI63Mvx9PUp3HPq/6Ce8zSAfeJ5EfcIXwf6VS8Q2o/uBqRwOaO1sHBPdec87CSBrKulbVUvjufOR0f4xStGHxlgWCC41RjZsR42Amdi8BAL/IDUo3G1q2htsyQRRsSsTbhid/p2iFkBzRxhd9Tc++cN0kPwWOks4MxNjceGyGAA39sP6iBjtnqlJR3xxdaLQUFX01ijupPQA/XjWrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SsAWZfdnJqXz0aa5cY6heaifmfkbOH7pvqDehqhz9ug=;
 b=3osShgR4IgS1glt7+ZTEHJjZy1OToGdKPFvfNQw98JLgoApYIEu+T40qLi3hXXqY7EYguwj88Rn4PjGAjlBrtPjl+FmXDCz4AIa8lldCTSW8LUV2/BRu+ien0BRedOolhvHUOKDRkixMddes8Bd8ZgyfHQ3XEkinCR5xAEoOcHM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <83f16516-9c81-495d-8d56-eb299e8e10d8@amd.com>
Date: Tue, 4 Mar 2025 09:17:31 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/arm: Don't use copy_from_paddr for DTB relocation
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250226215256.2713698-1-luca.fancellu@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250226215256.2713698-1-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: JN3P275CA0018.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:71::6)
 To BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|PH8PR12MB6747:EE_
X-MS-Office365-Filtering-Correlation-Id: b067dd8e-a99f-4414-387b-08dd5af50940
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZFJ1Wnpva2FMS1J2NXpIeElySEdFcUhSL2pDYmlJOXR5ZEhKWmoxekowTUd2?=
 =?utf-8?B?L204eWlBa2xmMDJ1YThkRDRmalIwN1MwME1lZnU5ZFZEY0RYVkc4bDdHK1dE?=
 =?utf-8?B?M0VxUFpuQW9FOGFJbGJpSGpwbFM1c2F0anBBMTBjdkpFRFVZa2ZHczBQS0tW?=
 =?utf-8?B?SFh1VWs4UFlLaFRlOGZMeDkvaVp2SmRQZStWenp0YTcrWklLUGFhSWNzdkJE?=
 =?utf-8?B?cVhsM21zcEwrSGV2Vys5dlNIMnpaSHFCZ2ZEdFBvK25mM3ErYjkvWWFWbWVZ?=
 =?utf-8?B?VjFKSXFSc2YwazhNMGNpZTdsQzBJQjBnOVVnSTBYTnExOG9OdkJuVURoNmw4?=
 =?utf-8?B?WXdBVnE3dTlQMkFLZzNSTVNBR3dCMWdRWUpVWmlTNFdaVmJodUtaNllKT01X?=
 =?utf-8?B?V3BpY3lzdWZWYWpNZVpuZW5GNFpJcnZGbVBFM29pL3p0UlFNdUNjalNIVkZK?=
 =?utf-8?B?MnI2Tlh0UGY4eG1xelRCem0xUG0rajdNMnpvS1N4bEVSWVEzNjlOTzlKT1hl?=
 =?utf-8?B?M0xNOVlIRFRWN3h1d1NoU1J6ZjVWSDMwSTNOZ0tySFhucm9KWGlUaFZZL3ND?=
 =?utf-8?B?YU91T3pZckZxSUxibWVQWEF1bU50TlZmSUFCWDFNUGJoSFpCbHBXTlNHMkx5?=
 =?utf-8?B?OHllb0t2TW1mZFlOeVA5bmNtOFlBRzZsTWpzZXlKK09PM3RnbU1ZS3VWQmw5?=
 =?utf-8?B?MlZVYU5SRnFTMjFWdVBVQ0xvOW9lQW1YWlA1ZWx3NUkvNkRON0w0VDB2MkpW?=
 =?utf-8?B?aldwM1RCTng3NVVhbFhkK1hDRzRDZTJyY3NWZEx2YkQ2VGh2WnZJUDVMODJG?=
 =?utf-8?B?ZVpRRThRdTVzQjNiN2t1blVPUVhRQWNXaGU5RWkvN3BiaEM2TDNUOW1kSWZJ?=
 =?utf-8?B?ZWtadC9zL1NuOVZIcmwrU1RCQTdzcnNqVHNKOTJwMXE4ZWtBZGFxVlhWWloy?=
 =?utf-8?B?NGRuYncxdWhnbmJxdUVsb2d1V1l0dlBYRjFUMVVIS094T2U0Wkg5a1BtM1Z3?=
 =?utf-8?B?WUNRQVJvQ3BXbXI1V3dZMjViZy80eWxrZHZMeDdCenRNZW82SW5RVmExc0Ex?=
 =?utf-8?B?ejhaQUt5d3d3c3FYVmJZNERaRFc1OHBJVE9pbUJGR3JuYTc4WDQwcDNCRFBV?=
 =?utf-8?B?SkU0aU4weDg2SlpTRTF6QmFUcWx2S1VOWnNGc3E4ZE9wTEpsMWdIVzY0RmZB?=
 =?utf-8?B?cHZ6dGJKN0dSWWdDbzdOUEV5b0c5Wnd6L3RxbWRWK08vNlI2NWoxL0trY21i?=
 =?utf-8?B?ODB2N3A0a0R3Z3pIaCtLMXBpWFpvR0x3SlFwZHAyUHcvK0VyL2R2MlFzN21O?=
 =?utf-8?B?Z0Z5R2g2cHlNSTErS2lOSmVIb1BMQ083OExRSkpoWTN0RWQ2SkFuSENYSk5V?=
 =?utf-8?B?MXlGSFNFSkoxdFQ5WXVOWUpyYjlGQ2tKQ3JIT3lDK2FnVHJmajJadGhyRDZw?=
 =?utf-8?B?ZkVGakEydi9rQSs0ZG4zSE5Ob09Oc242SjRWaFFDOTZlMU5Ua0NFZm9WaXRL?=
 =?utf-8?B?UW1STWRPQnd2L25wMmZlcHZFU25PSVhNNU1MQ0dXMUVmVEc4LzFpWmNiWnhV?=
 =?utf-8?B?QVVNY09pYStXNnlsSEk5cFRkZVZTMUduZjhCL2pMd2RHRnM5RDlvZXM2ektx?=
 =?utf-8?B?T2x2cXdTTzk4UUYzWGhzQklPMnhrZC9rYlp3M0RUR1B6WGNURldPUE1BUXVE?=
 =?utf-8?B?T0dVR0xGUC9hWEZRWnQ2Y1Y2REpLSVN0dDUzU0FqYmV3R2xIckg2SkpnLzZn?=
 =?utf-8?B?cms4NVU0MGtCT1dEcksvanB3Z0pwaWZ5bUFIWm5aVDRiWDhVSUZpUks2eFov?=
 =?utf-8?B?U1hacVUrSWVqUzFZNUVUbStKVFlDZVRsQWI3dzRDb24xYnl4UHpSbGY0aHRU?=
 =?utf-8?Q?ypA0VXE15Fpvg?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bTlBU1lIVHFzN1ZDWlB5K2VyNzlqSTFTTnpVWkpkdFRKQVR4K2VwZURCbHh2?=
 =?utf-8?B?RHBIRzRxU1JrZjRVWjVydUFkWDF6N1BKeXY0TytEanJob0ZJMkU1SndMMWJr?=
 =?utf-8?B?VUs5UUM4MW1QQjcvRG9NTTYwSmUwU3cwVU5GWkprOElvMUgxcGtHWmF2RGNF?=
 =?utf-8?B?TUIwUUtISTlhY3lWOHI4M3poVnBQN0VQUjVmbUhRUUxldjhLZTRxSFBValMx?=
 =?utf-8?B?UnpGakZwcVBiOUJPUjdWSXJJNUltSTJ6RmR6WTM0aUZ1K2xxMUhvbzFIUDZN?=
 =?utf-8?B?WXd3L05sdHpkVE9heDY0cmM2WUloYyt6YjhDTXNSNEZRYk5uQWlRbFJFMVRt?=
 =?utf-8?B?TzVXMkxkd2VYVXBuMTlvOU5sdU1PdUhlVDRWemtKRUZCcVM5UW1SNGNmU09q?=
 =?utf-8?B?NVFYZFZMNzhxZmdLWG1YWU5WbzNVY0Npczdxc3lQQ1orSmRnaXVjRFBlQlNE?=
 =?utf-8?B?RkRmSjZPVGZTdDVsMjA2cVBNOFNhQkM0bHlScCs4N2xkQVJSTEwzYlk2QlVU?=
 =?utf-8?B?ajh1UTVIdGg0VmZPeDNsb28rNzZCWWJ6M0NsYzlHOXliL0doS1UyK2JvVUxi?=
 =?utf-8?B?MkJmNjlxVEFkbXF0S01HTkRYSWRWcVFvU2kwOGl0anpXblk4RE5VQ0RqRXZj?=
 =?utf-8?B?VUFGckI2ZFcrTEdRS0NFR1o4MVlqWkFGdkNmKzl3WmpwWWtITXRRZVYwc25I?=
 =?utf-8?B?VHpOdUZBWjM1NXd5ZzhMeUZycURvZm9NZndieWgvK25pbDAvZ2o3d0RYeGJp?=
 =?utf-8?B?VXhDRlZqNzQrNzRURFV6a0dkckdGemJ4dmZSNjNyenVYMmRuOE5JSnJhMm4x?=
 =?utf-8?B?b2dWVFJOQitxUW5Pam9vUDV4Yld5RVRteGIzRitPV1dCNUdJcFdhTWRTKytm?=
 =?utf-8?B?bCt3TFkzWUhhbEh1N1p0bHNFR0lEYkNkaTZZOWdJU1h3OHFnckNHQzJWTElW?=
 =?utf-8?B?R0ZYUzFydUxzVmhtSjkyZDJpa3JlRFpVUjJmdzJYS3VXeC8ra2hFTFVHRys5?=
 =?utf-8?B?MmFTcXUvTGtWeVRRYW1QV0d4U2RZKy9ZcTJkM1BTMDFHdlNTRzF1Z0VQZm50?=
 =?utf-8?B?bU9DaC9FWmF3eXJTRTc3Wkg3RXM1OXFPWkhNVTBKOE00RUE1TzVCOUNRUmt1?=
 =?utf-8?B?dzRyY255dkxabXdwbmdwK0RmZ1lXN3VpcC9EUkQxVkxNeFhDY1dlb0tQa2NB?=
 =?utf-8?B?djdSMHFrcDdkRWpHdjZ0czZRZVI5OEZ1NW13b0FNdlFsbDMwSTBIclJUcFVZ?=
 =?utf-8?B?Wkp2bkhGTVBLMDMrOWtnTC9HK0lsUHBrRDdsSzl2OGVpQk5TSFpoaWEvcmZE?=
 =?utf-8?B?UnlXN3ZacnNwYTBNazI0TEV4WlB3UDZIczl6ZnYwNHRYeGthd3hIa3UreWNr?=
 =?utf-8?B?aHhXTzNkSlNaOUhaQmVJTEJlTWw2VHlFL0JMWER6VXliNHFGNEpiamE1bk1r?=
 =?utf-8?B?eDI3TlFzN3dmRWIvYkdQZlpVa0hCUGE2dHNxMHU1TERVZkordDdnd003eitV?=
 =?utf-8?B?NWh6VkgxakJndXVNYkQ0MWNaenI2aHoxYUR6OTJLQzNDUGpLV0RMVmd4c3ZV?=
 =?utf-8?B?aFZwNGVEZjVNcWdJUzhTTFlNdDFDZ3pFaFl6U1ZQbktVb1crTG5FRDJiTWRZ?=
 =?utf-8?B?dWYvVGRlT285dmtuK3VnM3BraEg0b3NGRVM2NVFMQ0NIaTlja0NLc1RRRzhR?=
 =?utf-8?B?dC9oMFRpWkthRjBTNkl0S2JJcXkzNDRSMEM0N21nckx2bXdBcDlxemlFQlBs?=
 =?utf-8?B?R3grRWl2Y3NYcHR6ZStKQi8vRW41ZU9tRExRWFQ5NkpTWFlxeVZVOVpKWnJN?=
 =?utf-8?B?eUVhVHRCOWEzU0xSS2NUdmtKU3Q5NDI2WEFQVW53ZlI3Vjl4T0x0TERwY0ND?=
 =?utf-8?B?b1p0T3VjUWNsLzUzZWMvaXZOL2FUN254YnRzajd5cmxpSmlSQzFKNG5DMm4v?=
 =?utf-8?B?L1dmckNSbFRwdTVvdjVOcTNqaE1MSHlGUlVVbWREQVF6bUlDdUNVTmZmNkcz?=
 =?utf-8?B?aENMK3Q1dkhkUld2NkV6U3c0V0FRMlFENWtrQ1NoUzRjb2JoTWV0bTRKNXZD?=
 =?utf-8?B?VUp3NHprcnQwL1ZvK1M2ajlLcmh0RmhMWFlSMUdpeFpoWGpDWklMaTU3TlNH?=
 =?utf-8?Q?WqxNex6S6RAkvUk+0Dv2pfBd6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b067dd8e-a99f-4414-387b-08dd5af50940
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 08:17:42.6846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dxdX3GLUOBdeQRxd5tqgsQWKdRll6Za3ePSXgfWSTIru3LuJJVyAGZXqMcVfpviU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6747



On 26/02/2025 22:52, Luca Fancellu wrote:
> 
> 
> Currently the early stage of the Arm boot maps the DTB using
> early_fdt_map() using PAGE_HYPERVISOR_RO which is cacheable
> read-only memory, later during DTB relocation the function
> copy_from_paddr() is used to map pages in the same range on
> the fixmap but using PAGE_HYPERVISOR_WC which is non-cacheable
> read-write memory.
> 
> The Arm specifications, ARM DDI0487L.a, section B2.11 "Mismatched
> memory attributes" discourage using mismatched attributes for
> aliases of the same location.
> 
> Given that there is nothing preventing the relocation since the region
> is already mapped, fix that by open-coding copy_from_paddr inside
> relocate_fdt, without mapping on the fixmap.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


