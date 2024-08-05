Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD49947A08
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2024 12:44:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772005.1182440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1savCR-0007Lo-1y; Mon, 05 Aug 2024 10:44:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772005.1182440; Mon, 05 Aug 2024 10:44:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1savCQ-0007JC-V5; Mon, 05 Aug 2024 10:44:22 +0000
Received: by outflank-mailman (input) for mailman id 772005;
 Mon, 05 Aug 2024 10:44:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3WU3=PE=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1savCP-0007Iq-Cs
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2024 10:44:21 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060e.outbound.protection.outlook.com
 [2a01:111:f403:2418::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa884b65-5317-11ef-8776-851b0ebba9a2;
 Mon, 05 Aug 2024 12:44:19 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by IA0PR12MB9047.namprd12.prod.outlook.com (2603:10b6:208:402::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Mon, 5 Aug
 2024 10:44:14 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%4]) with mapi id 15.20.7828.024; Mon, 5 Aug 2024
 10:44:13 +0000
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
X-Inumbo-ID: aa884b65-5317-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bv1OM4tzCsB6lBj5rCNxg1F2c0cFHFzHlbH9Wxof7pe3AeSr0WWDyNXbhgQqSxQmjEMQ2S/Z+pxElZzHcvSoPi/snjJmyjOvFrEAGtaMrde3OPBLvEdz6krKShbRqIC39J+CRcDxEGP3FbKZ+MlZD0pphuMUotobwCE9e1603fogz/C9bB0lorjviAvYuTrbI8Mpdf38LKFRY8CNiEeKo/0K1Jl2OCmV3ggtTJGaprbuTXZBSu/p5oSDm/EXVSjtoV4gZEL1WisCiFf+X13+OK5fuuxxzO3WBG3fEOnMSXdMCCg0hhVpyJVogEczRP61iZD/Nqe8F/x3e73gNEsKlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hco20DxapGbz/qeh7BEKD6UNZGS9ISlQ2qWzNelTuf8=;
 b=TuM7KVGnPtc1qn6LosP09zYB6f5JoGieAf27XpYfSdMFnNF9JVYlJYmmC4azPpXg533RsA34mtr2kHViFCCnbrB6bbsAoEuAikNAqcrdHVy2vnbgA3n70yUMNC3Jw/9V5WJbhkfRRTxl361fvMoUYY3ExJmM3NQXrczE6z4ZiiWDPInq66oT7DhrbJkgbv2N31wgGmtqsRu4YroUgokkuzH74gmNZZKNVRev296v7TPOIqUW4ySFqtmDl3SjC/uNalVcMPVe6UYaBDpijpVHeFu9a7kU8ccTuCVw87pveFF/XvxXvU0xNtrWHVTBPHBnaJqUFCYBBA+8S8amDiOGQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hco20DxapGbz/qeh7BEKD6UNZGS9ISlQ2qWzNelTuf8=;
 b=U9ehBDBakmNTBOSoNAm0Y+016ePInuiPo5GRijyrV1VgXTrkrfC7GDbK6K9Zrd21cytJsd5TFrkIi57AVrmJGSDn3bYLFh0xE4xvpeVSN9jTkrh7nl8Kcep+f3oN2rU13fopjHGVb1O3N+gxugkdLrYs2RV1mBQxOTb2+T8yZJ0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <9587f469-b038-45f3-8931-87e06b273763@amd.com>
Date: Mon, 5 Aug 2024 11:44:07 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] xen: arm: make VMAP only support in MMU system
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, sstabellini@kernel.org,
 bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com
Cc: xen-devel@lists.xenproject.org, Penny Zheng <penny.zheng@arm.com>,
 Wei Chen <wei.chen@arm.com>
References: <20240802121443.1531693-1-ayan.kumar.halder@amd.com>
 <20240802121443.1531693-3-ayan.kumar.halder@amd.com>
 <a17d0c07-3f98-4eab-9f84-77d64b562cbf@xen.org>
Content-Language: en-GB
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <a17d0c07-3f98-4eab-9f84-77d64b562cbf@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0317.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:390::18) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|IA0PR12MB9047:EE_
X-MS-Office365-Filtering-Correlation-Id: cbc65e58-c2e9-4051-5959-08dcb53b8be8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K21HY05keGd5VTRhaW9jNE5WNmlFaTZaeUtBU1dFdFUzNHFlSk5jSXBKYzRN?=
 =?utf-8?B?dzBkNElmVmdaMmt0cUtITWZGMTEzclNjRVRvZHYvUWhXTUY5RUk1cVRvaGRu?=
 =?utf-8?B?VkUvME1LckNlMlN2Q2Y4RDRTczZEM0xNU2hndFJaUncxMGE2U0FRWFVDWWNB?=
 =?utf-8?B?Wit3OEpSeXdEVDA2MFdEakZNc0ExQzArK1RyOE8vTTgwTHlkM0hhYTNtVkND?=
 =?utf-8?B?M0pLZ25nY3Y5a2ZuTFpZc0R2UUM1RDZSUVREQzliM2M2NWsyTGNKdVdSQU9w?=
 =?utf-8?B?c05LdGFQK2tWNnRvTUxMelBMMGZabmx0Ky9qZ01FNlhlcUdqYlFVdk40b29v?=
 =?utf-8?B?SWg1dGU3SkRJQ0duRXkveFYzMllvUHMybXJqQ3Nob214Qmp1Q1F5RU5xQ0FI?=
 =?utf-8?B?dUxVUGhWb0diNGY3cU56U1JmNFRJakcrZmhzQ2xLNVJPSkhaMytUblhYTzZH?=
 =?utf-8?B?VVVCQnZnMFRWcG84QldMZndOdjJtSVlmS25ZZ2xOSTM2VE02NmVBUGJZWjFP?=
 =?utf-8?B?YmVVVHpKS2tpTDlWWkpmWW53YVk2NGZyaWFQcVhzMmgrRFY5ODd6TXgybHRu?=
 =?utf-8?B?OGtZUk1pODFrSEdCeENpSUFJd0cybWxnUVBVOUJlRm1MZEY5cENnbXNrN05C?=
 =?utf-8?B?c0c3UExZOVRZRE5GY210aExiclRCWktZNWl4TzVvWXpLMlZsR0k0K1BjODFB?=
 =?utf-8?B?Ukk1dWp5bE5nQWhyK2kybzZIWnFxQng4Vzc5Z0U4OFh4ZXd0R2Z5MUpMSVlv?=
 =?utf-8?B?NjhhRWdPR3NWNW8zRnpsaW40TXN4blo3SGRZZlBQczgzWUNONE5xREszQkFs?=
 =?utf-8?B?YUg5MzNqaVIvVTY5N0w2Mmc4c3d5VG1XVXV6N0dKK1QwQ29IZzNsVWxrK1Nr?=
 =?utf-8?B?RVVtY2dtdTdOZDROMVJnbVdMZzhuMjUrb3IzSTZDaUJudUM1RmVzdE9Ram5R?=
 =?utf-8?B?NFljYjJuRmNaeWFlcW9kOTVENmFjYkxIcXFxUXpLbmhBcXRDZlROYnNIR3Bt?=
 =?utf-8?B?MUcxZFhvcE5IQVI5NXJVYm45ampidE9WaEFiaE1kc3k2L2l3d1ZlZWlRdzln?=
 =?utf-8?B?czNUNlpkMUNzbnNJd1JKUjQ0R0RHVkhBNVJtRlczMkx3MmtJSkV6Smp2SkdT?=
 =?utf-8?B?K3l4NndzQ3RoQWsyZEphSUdlMUhKK1BGZGFTMVJ0eHNZRVloUnVYQ0djS3lO?=
 =?utf-8?B?WXB4L2IxKzB1L0szUUx5eXZyNm9qaGI0akNLRlNVU2kvYjArYmd2WHFWMXd2?=
 =?utf-8?B?SDBpMTRvakJLK2l6cWhPNC9XUXhKQTgzRkRnaDUybGtoTnYyWVA2L3RFZkxL?=
 =?utf-8?B?QXVHd3cxbTFtWUhMaDF0dTBIcGp1QlFxZHNUNHA1eGYwODdkN2I1UUVwbTV2?=
 =?utf-8?B?aFJxQ2NPOXcyRWh6Y095TFVOSEdrUVFkVllxUmVOdGUybnhYNGN5S2VLMXlo?=
 =?utf-8?B?OXNXN3ZGVGhzV0l5VExlc2JxOXhYRVdlTzBYUDNaRmk1bURzMjZLUDlwaUdh?=
 =?utf-8?B?M0t3bXhuMXNlQ1FRMjgxQ1h2dVBqT2JNMGZ5dHdEdFFZYnFrK3A5NStaSFFh?=
 =?utf-8?B?TlBqRG5KT0RKUW15MkxvckJnWFFrM0R0RTd6MDAzQVdOSkZwSEJNOFpoODBZ?=
 =?utf-8?B?SmIrWW1IbTdZOTMwQ3UvenNLTGZRQlBkeXhJWnVMdkhKUEVzQ1Q2RlJvOUdX?=
 =?utf-8?B?U3oyZ0puRGJZN2NWeko4aHVHQU9RQ1M0YXM5NWpwb3hKdTZzRXZJMUU4czNL?=
 =?utf-8?B?WGxKaG5oYnJDNlgyL2NLQmVvWmVhVTFHNjFCb2Y5cFdRQTA5cDUxNU85VEgv?=
 =?utf-8?B?aW9Ya05YVnpXTkhWK2xxUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bDRiY2VMMUljUEtpL1JrQzIyK3c3MWFXd2ZPNk8xYlBsOTdKTjlPQW1EN1JU?=
 =?utf-8?B?TWpGQlVuM1Q2U3pIVENtc0hzRTFpWWFQUkxSam1jbVh1YWtleGhhSUhRdkl3?=
 =?utf-8?B?bjlLeUxDa0JDTGpJOHgrWGZmVmJ6UXNCYS9wRXRLanBTb25jNDN4T1grQkI5?=
 =?utf-8?B?OElKUlc2eUI5MFUvZ3UxeTlIQm5ETWZZZHYzUmNTOVdzQU94VUptRThRU1l2?=
 =?utf-8?B?NEpkUW8rbk1PQnpaQ0dYM241bmY2R0hwM2w0NmNCZDdLQW52SE5DdktRckQ2?=
 =?utf-8?B?Q0hIdld4dWovS1drejF6cktKQ1lKanJTMVBmdHpsVk81UU40OFBhYXNYT2dn?=
 =?utf-8?B?OEJTbURsOTZkTGVya1NjRnlaak5ycE51bUpldEVqeEg3RTdYR0RRMWpmTkFO?=
 =?utf-8?B?OVhIY3dvMVp4YXpFakVNYWxnUjUycnpHMG03VjExNW9hdTFGa21tWHB6Y0N4?=
 =?utf-8?B?OG5rMU5Yb0hpVGI2cCtLOUdYVThMNk1KRkN0akxpdkFpZ0Y4Y09GY0ZjMDU4?=
 =?utf-8?B?Q3JmdWVtMGo5MmtwQmdKcElyZFNWK1B4WDkxaDQyU3VIdnFLcTJ5Y3NDQXZH?=
 =?utf-8?B?RVd4NzVha2h4c3c3ZWVNY21ZTnlFVkh5MVZMMVMzRms0OVlHUTJ2REprY2Qz?=
 =?utf-8?B?TEdGM2lYemtVcW1DWEtVUUxRbVJmOTZTK3RTQ25mckQxeE0rVk9EQkdkRkts?=
 =?utf-8?B?UlNQbVJGNEJuUW9sa1E4WlZjclRHTDg4QVMwU1RXZURucUowUjZjbFJRdGNJ?=
 =?utf-8?B?czlJSnVEU3dTd2h3ajY4cnBaSnEvODZkL3dXZlBZNjM3QTVkRHM2ZFI1MGdC?=
 =?utf-8?B?SDNTMnNtd281ck9NclhvNXZOL2VGcVBpb2o2KzJiUEl1RmsrbldET2tvRXhL?=
 =?utf-8?B?S05zZnNVOGdWQXRrSjk5RjZIL2wwSUt4cHIyVTZoUlVoaDE1b2tJTWdGNEVl?=
 =?utf-8?B?K3R2VXF0Q1RuWGIyc3ZJcmZ3YzBzQUFKeTRBaWZtVTdvaGpWaTBMQld3YWJz?=
 =?utf-8?B?eWRPdCtZajRPYVdXd1BnSTVPWTJnU3QwYVRmYnJ5WjF2eng4bTMzY1UrUEdo?=
 =?utf-8?B?dVlUV2xKZTNvbnFOWE5Jb1JZQVg2Ty9sN1pTR2I4bEp1b09qMUEvenFFTHdu?=
 =?utf-8?B?Q1k3TzBSZ25qeFArR2RFMGpHakpoZGRFSjlKbXlKd3lYR0JuQXZnaFRpVGFp?=
 =?utf-8?B?a2J6akk5VVlKUlFyWXNMUjVGQ1FySGdQb0EvZ3FSUC9EZXFNZTlEelRyUnF5?=
 =?utf-8?B?YitFKzN3ZitoRHIvU216TS9zVmx5S2hFSW9PRkxXSm5ITWNTZ0VEa1J5OUM1?=
 =?utf-8?B?MG4wVjU1VlRqRmt5alNIMDFib21tdTZSeHZvdXppQjN6T1FCREd5Z0JXT0M0?=
 =?utf-8?B?RXNTdm5wQjh4eVRIMk10WkVaZEFqWXJFYzBRYUptODcxYmNHaGdraGVseTdn?=
 =?utf-8?B?WTMrVnE3emtGSmhaUCsyeWtPRzJmbGs0bXJpK1orMm9wZ2pMakY4dmV4d0tU?=
 =?utf-8?B?dC9iQWtSMzhwYk5XVWphdTVORkxnakhSSEtZZG9nNHF6M1FEWXBiS0VkUGN2?=
 =?utf-8?B?dlMvV0xkTktTS3JOTVgrRGxzVkhCZHZiUEozU1FMbmNoV0k0MzQxTEZ1MXdi?=
 =?utf-8?B?ZWo0c3g1bDZuMnpVYUx0aVBPbkRIditwZ3E0eTNxZC9zM1FTcEJUOGJIR28x?=
 =?utf-8?B?aERIbDErNzdvN2lJQzhYVWpBdDhlT1NYSTJYWE01SGlQd253RlhVLzB0MWVo?=
 =?utf-8?B?RW5SL1gxRWdXak45VStqQjd2TjUwWE9rQ2xVT21DTFFDS2dFc2FzWFZ0bitY?=
 =?utf-8?B?UUNhSlNOa3U5bjk5UFRna1lTWXZvTmdheXQxZmNRVmZETHQrMG91KzVUQUlh?=
 =?utf-8?B?ZEVXWTlwRm5PV2tjbUo5eng1a3BNUXBTU3crR1drMVVjVm5tQ2FqRldCSWlp?=
 =?utf-8?B?L0VWUWxuM1Bwb2szTkxrVGxNVDVsNnBFNmhIYU9OR3pmRlJVZzIvS1R0REE4?=
 =?utf-8?B?dVJHZzJaSkprMGE1NHZNQXpTYmsxSVpLWVBrT1JXOTMwY1BlZ2w4dURTZHVJ?=
 =?utf-8?B?dDFKSlZLcW9QUnNObEpKYmoyaWhaelJpdlJoRlloSHJ2Q0NlN0ZmeHUxVkVG?=
 =?utf-8?Q?23elNkDbBUeOVRP6jmZspkbdA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbc65e58-c2e9-4051-5959-08dcb53b8be8
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 10:44:13.6832
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VFBBv9lL3Fyk6lX90Ypcmm40R3cVNfE18g1S3kK/nKZ/Q7oWpes6qBzn26ev9QMbvh8mheCP9qcYf/6T7Mbh/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB9047


On 02/08/2024 14:27, Julien Grall wrote:
> Hi,
Hi Julien,
>
> On 02/08/2024 13:14, Ayan Kumar Halder wrote:
>> From: Penny Zheng <penny.zheng@arm.com>
>>
>> VMAP is widely used in ALTERNATIVE feature, CPUERRATA feature, etc to
>> remap a range of memory with new memory attributes. Since this is
>> highly dependent on virtual address translation, we choose to fold VMAP
>> in MMU system.
>>
>> In this patch, we introduce a new Kconfig CONFIG_HAS_VMAP, and make it
>> only support in MMU system on ARM architecture. And we make features
>> like ALTERNATIVE, CPUERRATA, etc, now depend on VMAP.
>
> While I agree that alternative should depend on VMAP (for now), I feel 
> this is incorrect for CPUERRATA. Very likely, you will need to deal 
> with them on the MPU.
>
> Before making any suggestion, would you be able to clarify how you 
> envision to deal with errata? Will they be selected at built time or 
> boot time?

TBH, I hadn't thought that through. I am thinking about selecting them 
at built time (like it is been done for Arm64 cpus).

However given that there are lesser number of MPU cpus (only R52 and 
R82) compared to  MMU ones, could there be a simpler approach.

I am open to any suggestions you have.

Also, can we disable the CPUERRATA on MPU until we add support for the 
first errata ?

- Ayan

>
> Cheers,
>

