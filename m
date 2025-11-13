Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B02C59458
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 18:53:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1162020.1489828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJbVC-0004d4-Je; Thu, 13 Nov 2025 17:52:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1162020.1489828; Thu, 13 Nov 2025 17:52:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJbVC-0004ad-GA; Thu, 13 Nov 2025 17:52:58 +0000
Received: by outflank-mailman (input) for mailman id 1162020;
 Thu, 13 Nov 2025 17:52:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X5Bi=5V=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vJbVA-0004aS-GG
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 17:52:56 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 949f5721-c0b9-11f0-9d18-b5c5bf9af7f9;
 Thu, 13 Nov 2025 18:52:55 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MW4PR03MB6458.namprd03.prod.outlook.com (2603:10b6:303:121::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 17:52:51 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 17:52:51 +0000
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
X-Inumbo-ID: 949f5721-c0b9-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tmKaHfgjX0sXZs7ISmevSlPAnlUrDyI0s0D1f7LQbQErnZ0ZcYXAZfDCNyAof5X9uSOX6KmxWaX1SopI1Cx8BWeNUlH8uO4hhlK2dYZPipE+CdI3AKqrEOFG6V8ExeXCpu+Ltl6zJ0Iw3OVmWyuQHPtbvdPktd/yMPHTi3XUEYf2J2eoCK1J6wXaykJ82z5w32oYNpNrMqhtwhsuXgVOZyrTIjlyP1CwFXDAYdwIwUu80kU9Of6sxdFLCujwkVvqTyTMMX+WIi6o+nvulcobmAl2RjxFcY+IFL143V6/nNvdmLBpBlJhs5/Eo21Nd0xic4Z7DM8gTosEV1dehPcJ6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kMasDfIjg8bN3ujfx/TxuwJZUVWjx8Bj0EkDnMZ/Btg=;
 b=hzci9K4QnfgIDoImGtSl97fYLidQK9GcR281qXX+NMi7gtxB3YjnkOEuDUqdBVAGiBbqJA9hnX0JEcwvRdPigc3zfotB6WkRulw1+Z6ep8w4sgp9ksN8P50TwDXPuFu6ZiCYU3RxN63zwGZaZh67/PH1dBMyfEIaHCHYzx3z7pV8uQz8uVC5TTF2AcoFd7zpbI1oMPhlLyeIDZke3KoPatQRRlRymd1APbBv9YyfVdkq1xZNVAmPbP+pewx4Y2bKl6YOpHn5qdQJHmvYG6f0WibMi1yLv8weqvzNQCufvAeuMP3Hspy30ypZCdw/SincGoYK5ihAa8srQz0bX37wCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kMasDfIjg8bN3ujfx/TxuwJZUVWjx8Bj0EkDnMZ/Btg=;
 b=XTpb+x6Qpm5/S303u5sfbxeZBTe1bwwPzElR/ila8WfbRq7CcYgQ7cjfksIW7AIeM6qiI7loyt5qcKc2nTuiSlSfWwwPgxUv2uOKYHTVspJe6lhpJ2VRgXGctKo2yPhpIkMSIoa172saQAKX9waFAy48qcZLL3waWA1G5T3NngI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <353236f2-2864-48c2-ae9c-e3d4a2aa5537@citrix.com>
Date: Thu, 13 Nov 2025 17:52:47 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/viridian: use hv_timer_message_payload struct
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Paul Durrant <paul@xen.org>, Jan Beulich <jbeulich@suse.com>
References: <20251113172413.87938-1-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20251113172413.87938-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0435.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::15) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MW4PR03MB6458:EE_
X-MS-Office365-Filtering-Correlation-Id: 726f5b07-72e0-4aad-4bd1-08de22dd76ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YXhQaE15cUVsYTZ4Q1k1R3dabG10aVFtd2l0OFRFNWFrbWhIeEMxckJ4Z0do?=
 =?utf-8?B?WXczb2tVTnhobXBXOTRQZnd3bFk2ZU1rRWVrdHdqK1RMMTJ1dUNuWG9nZ3Rs?=
 =?utf-8?B?RWxlYm1NOWxXQzNFeVIralEzM1ZmQ1VMb2YrQUtYcGxmNDZLWGU2ak84aW1p?=
 =?utf-8?B?eU4rcGhBY25CUC9NY0JmamxyM2dpZHdwRXptRkdOWG0xcVBzcFdZdHkxRmcr?=
 =?utf-8?B?M2ZhM2dEbjdueVpUd1h2bWMxMGc2cDNmZ2kxaG9OVG1vdWxHQ0d6NXRhTjVZ?=
 =?utf-8?B?OGhwaFF1c3lSZkVlZXpLUUZSZzBocVVmOHVobkpRZVFKdG1ycVRoR2h1aU5x?=
 =?utf-8?B?bkRaVjJieWszejNhYTQ3cWgxdVBlcFVQelFRUHhXOWhza3hDcnZqM2JOZTRJ?=
 =?utf-8?B?N2xFTjNpRzhqWnFMUDh5QUtBWGR1M01GSUlkYlhUOG81VFdObWhhYURPQjc1?=
 =?utf-8?B?NmpqU3VKRTkzdmJJR3VzeVFqRnowVGNmR2JUNm5KYTdxZzFVN0xoQkhlTDRP?=
 =?utf-8?B?d3p3ckswUFVvaVUrZjRJa1pZRGNJaGJyYUs1VXljcTJyb21yUU4vd1lJWkRV?=
 =?utf-8?B?SXYyNnhJZkYreUIyT0NrN0VPRnc5ODlJMWVBS0FFNVl0NkoxU0RNY0ZuZ0Vt?=
 =?utf-8?B?SGwwOGVaZDZuckdvSkZMMmI1ZC83eE8veXZUQ2p4Uk8zV0hlYWxIYXdjenNy?=
 =?utf-8?B?TWZ1Mk9KR0pqdzlUTkhpTEt6ME96Q082NEFYZzlGMGlQVXBTUmkxQTRKeTln?=
 =?utf-8?B?eUJqODZIbTdlQVR3dnFoUEtJNHplZTVVejB0a0ZoemZ4cFlYaTJaQ0NJYWJh?=
 =?utf-8?B?UDJPNjV3VDFrKzFIZnVlMXg1T3VqT1lZOHEwUmdFSStLTUVCVEc1eVVxVW1r?=
 =?utf-8?B?OWJQaXZnV3VFWks0M0Q3QUtsdFdIMWl3bjVSYXZsQU56aDZKWnFvWi9VM2I0?=
 =?utf-8?B?bGhCSG9kREhTa1BPOGZzbm40aXhmTGhmWkZqQjZpemd6WlhIOGxSSngxUFpa?=
 =?utf-8?B?YkJHQWxsZWZVbDA4RFRPRi9jQzBZRU9jbVdNRXF3ZDZkcUFLdEw0ZUd4Wmh1?=
 =?utf-8?B?ODdsNVJQc01wT2FBaVZ5QU1uNys3V1AwT3Z0Z1BocTFwOFQ3QmxoeWxBRmtY?=
 =?utf-8?B?aHVWMzJ4NEtzMnQrekZ6VThvRGV6T2t6Umh5QkttNUNWL0tWZ0xkSVkwS1Z4?=
 =?utf-8?B?TlREZWs0VWZpeTEyQVZkUXlGUm5UVVRWMmNxV1VwYThueHFGQVdva2J1OU4x?=
 =?utf-8?B?Q3J3VStjVzRPNDY3dlovMnlVSTB3NWpJdFYzN3l6Rkd4VitoT0F3aE15dG1D?=
 =?utf-8?B?V2UvMXFkMnY3UW1vTnZEOW9lc2tsaW5VMmJNZ3pNYW93Vk93VWUyK2pISUVx?=
 =?utf-8?B?U3pzcFV1eTN3NU5Tdy9ocHBMeTNCS20yMTdTdG0rbXI0YWFsZldPZXQwa3pZ?=
 =?utf-8?B?OUw4Ry9BWGdrUmlXa0x3Q0pJNCtSSkNXbjJGdEF1QlZOa2tXMWtvclVmaDVR?=
 =?utf-8?B?b0dCWlBYaFN6bVU5Szc4NS9VM0VsaWtEQlpqTUdJbHVpRmI3ZnhFcnNNZFk3?=
 =?utf-8?B?RFpDbndyYUthbGR4UjNqeDV1K2RrUXV6cUZkT3JmQ2p5cE9rSG9JK3dvbW1U?=
 =?utf-8?B?UzQrbGlUZUlpdTIwR2V0UGdkbkJIT3UwU0ZyZHlEeTg0QllVc3RYOUZVWHNx?=
 =?utf-8?B?VWZFVlRkWktKOCtaUTRiR2JXbDVIUWRjamRtYjZCUVpBNTRDazRWNUEzek9l?=
 =?utf-8?B?anFGTFREdDFoLzdOdzJxTVQ0ZHNlSUJWcWlGWG9tMU1GN0grdStRUFplKzh5?=
 =?utf-8?B?YllZNFV4TmhJZnVQT1ltSGlORVZDMkI0MzVEbGsydDdrd0NpcUlkRXRDUjFB?=
 =?utf-8?B?NEtzWDFqeFZlQUZ5STljQUlhZTZISlN0UnJTbzFiS2lkR3phVk1HQllEZzFm?=
 =?utf-8?Q?0GByo9wy6zIRfMRtF4G1rtNX7qQGBhm9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YkIyVDE4NkJObi9TNU9kZjFPL1RuWi9yemZyZXM5ZUhmaVcybmhxelRKODI0?=
 =?utf-8?B?WWZ1dUZFaFYvVERLRE9wb280dEZQOVZ5YWhHV1dCbGp3S0ZjZUJMVmZ5YVVm?=
 =?utf-8?B?dnBxNnJpWDc0QmV1SUJnT3VWMDkvaEFFM3ZuYjByYXJLaG94VW45K2l1NTVx?=
 =?utf-8?B?Z2lEYkhhMFpGNDF0QVhxbWpBbDQ2elRPL3VtcGJkN1VzS1VUTWIrRUllTjVr?=
 =?utf-8?B?SE80eWp6enljVk56Z3psd1JacnhYQXU2LytxVHZFZzVMZ0ZSWHFoVW5DcFo5?=
 =?utf-8?B?b3hXdkF4dStFT3hxQm1HNDErVEVUQ093SVVqcTJSdk5zbGFvVUlGaXdXczVi?=
 =?utf-8?B?UUZRTzU2OVY2eEdaczlqVUh6ajRQZWJCdHNBY1hTQ0RUNjB6TWFJN1REMDJy?=
 =?utf-8?B?aGV6RU5GMnJZc090YjhTZ0ZCSlhGTnlsdXo4MHZqVnZwUjdRMit0K1p3bk1V?=
 =?utf-8?B?RjdQV3lOWU1obXNhMndneExHQXk0aVVoc1VCakVpSXFQSS9Kd2J6dDN1ZFZq?=
 =?utf-8?B?NkRIYlRTbmhWYlZvNi9PMFcrYWw5RjJNcHF6SWJHU3Z6eUVKRVZ3cURWNVpT?=
 =?utf-8?B?OGsvTXpWNjlBbFhmVUVoZk9UdnJ2SkloU21tMHV5SzcrUFRZaENrNU54MHZT?=
 =?utf-8?B?VXFTWURDT2w2VzhaMnhRdzNDSkx2SFUwNXhQbDROSXZUbDAyYlRQTjN2Qis2?=
 =?utf-8?B?OFNkTENVUVV5a01aNGhtYy9ibGhhN1ptSXgwcjlIOEtCbkgvdjN0K2t3OEl1?=
 =?utf-8?B?c2NnYkN5UmNZVXVKakw2TFFvTU5Cb1g5cTdTWXdHanlmS3VSeG1Sa1Ezd0t0?=
 =?utf-8?B?QUdiMW1FbFRsTzJpLzlmakh4V1VOY0cwd0J6cUY2ZzJwTForL2M1ZEtIN0hn?=
 =?utf-8?B?bnI1OThRMlBRZlRlWnloclVQSXBPSDRsd0pkalFHanBhVHRMWWd6NGdVSWZQ?=
 =?utf-8?B?RkVrU3V0bXJ4NjUvek04clUzUFNGdEYreHhXQmowR3hqNnRqWEljVHNUMVM5?=
 =?utf-8?B?ZVhUa0N0YlpSaHk4V0t6UEdLUjhmMjVLOWFUNGpPOXZncVNaVUpZdFh3RGEr?=
 =?utf-8?B?anNlUXRtTXZveE1nOHZ2WDZ1ZmxWNG10VUlOdzZJVFJlcWlKajR4aFBWMEtw?=
 =?utf-8?B?SVJhWFRrT2VhT2FiVnhCZzM0ZW9wNW0xYlcxbTFxZWJNWGRTdlNPV29OY3Nr?=
 =?utf-8?B?c2xTaWNrL0F0cGVNUlMrblFSR2hHU3R3Q3VWcUgyMDJHY0ljVDVHVWxEQVdz?=
 =?utf-8?B?ZDZjS2ZkaElWaGFMYXNaMTRNeldXOEltNE5FdnZhNzhWejgzWXY4by82Nm1p?=
 =?utf-8?B?cCt3QUg0bUhtS3ZBMGZ5TlRQMWlQKzY4bENVdUZVUEp2QXpQRTkrTGQySlBQ?=
 =?utf-8?B?a0gveDFJYnA5NkhjK2lUNzFuR3hLY1hteGFUVXNYS25Kb0Jxd0RUblh0M1JY?=
 =?utf-8?B?NU91ZWdvcHVCdWsyRHEyWU5tRXhhVWdvSm1CY0FBYjdPTlgrU1pTczNMUEln?=
 =?utf-8?B?RVAzNG1ENTRFQ0RSdnZKVENJVlNQNGllS2hSc2xSZEZpT1NkRHd5enJLdVhO?=
 =?utf-8?B?azlXeTVTNmNSYlRDWkROa0o5SUhYUTVwMzh6b1RWZmc1UkUvQWUrRExwVC9K?=
 =?utf-8?B?eFliVXBPN3B5MVd2b0dyWFZ3M29taEY0eDRUakM4T1grcVlIcjR3bTNRREtT?=
 =?utf-8?B?cEQ3dzZEVjV5L2l1RlhhYnpzU0twazFjdWJXd0QvZVp2OHVjRjczdTI1QXZN?=
 =?utf-8?B?YlptMGdQdzl3QVZjRmtITUtpdXRXTk5WUUw5WWZuUDFNaDV4bUYrbGluVDht?=
 =?utf-8?B?VWx5RDZGaU9xakdxRHBMZDNtTGpzNFFBT2RWdkVWM0lNL2xwS1UyTzhsMmxx?=
 =?utf-8?B?NHJzS0tQT2xBNzc5NlUzWDY0dmtBM2dLYlIrTGJxdGg5dVNOTWFKcW1TbWhP?=
 =?utf-8?B?bXVtVDVxNXAwMnRGVVJEQ3NPUi9yakJVMDkvYU5LcEJZQi9WbFM3d1l0c3dJ?=
 =?utf-8?B?UmdjU0o1RUdXWFNvdDRJbXhGUDBjbC9wNjZDRVZGR3dMOFJyZ2N2RjR2WktN?=
 =?utf-8?B?aHhielRVQXpxZndMYnJWV2JMcWtudUtmMGcxQS9kTDgwOW1md0JseEJ5ZzZC?=
 =?utf-8?B?NDdubTJZZlRtSDdRdjBkUUkxZ25GTEo3cDl5QjAxbThmTGtaMjROaDhRRjQ1?=
 =?utf-8?B?ZUE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 726f5b07-72e0-4aad-4bd1-08de22dd76ba
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 17:52:50.9931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 90oZMZWuGqplYzJj6or9aLi3vbiyvzbpOkX/ulby65MMlGSLNgfgcEqG1L4ZmEuzH9dzcdpKv7k8G0VAVLqunKSDB69TyKpwBgvl8c/Coso=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6458

On 13/11/2025 5:24 pm, Roger Pau Monne wrote:
> diff --git a/xen/arch/x86/hvm/viridian/synic.c b/xen/arch/x86/hvm/viridian/synic.c
> index e6cba7548f1b..6d7b6bd0eda2 100644
> --- a/xen/arch/x86/hvm/viridian/synic.c
> +++ b/xen/arch/x86/hvm/viridian/synic.c
> @@ -327,15 +327,10 @@ bool viridian_synic_deliver_timer_msg(struct vcpu *v, unsigned int sintx,
>      struct viridian_vcpu *vv = v->arch.hvm.viridian;
>      const union hv_synic_sint *vs = &vv->sint[sintx];
>      struct hv_message *msg = vv->simp.ptr;
> -    struct {
> -        uint32_t TimerIndex;
> -        uint32_t Reserved;
> -        uint64_t ExpirationTime;
> -        uint64_t DeliveryTime;
> -    } payload = {
> -        .TimerIndex = index,
> -        .ExpirationTime = expiration,
> -        .DeliveryTime = delivery,
> +    const struct hv_timer_message_payload payload = {
> +        .timer_index = index,
> +        .expiration_time = expiration,
> +        .delivery_time = delivery,

Align these = for readability?

>      };
>  
>      /* Don't assume SIM page to be mapped. */
> @@ -359,8 +354,8 @@ bool viridian_synic_deliver_timer_msg(struct vcpu *v, unsigned int sintx,
>      msg->header.message_flags.msg_pending = 0;
>      msg->header.payload_size = sizeof(payload);
>  
> -    BUILD_BUG_ON(sizeof(payload) > sizeof(msg->u.payload));
> -    memcpy(msg->u.payload, &payload, sizeof(payload));
> +    BUILD_BUG_ON(sizeof(msg->payload.timer) > sizeof(msg->payload.raw));

This BUILD_BUG_ON() was only needed because of the memcpy() between
different types.  With structure assignment, the compiler will tell you
if the type mismatches.

Therefore, it's safe to drop.

Otherwise, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

