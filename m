Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8638AAD8FE5
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jun 2025 16:44:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1014413.1392520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ5dY-00044r-4Q; Fri, 13 Jun 2025 14:44:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1014413.1392520; Fri, 13 Jun 2025 14:44:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ5dY-00043Q-1Z; Fri, 13 Jun 2025 14:44:08 +0000
Received: by outflank-mailman (input) for mailman id 1014413;
 Fri, 13 Jun 2025 14:44:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OW95=Y4=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1uQ5dW-00043K-Mt
 for xen-devel@lists.xenproject.org; Fri, 13 Jun 2025 14:44:06 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20601.outbound.protection.outlook.com
 [2a01:111:f403:2406::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d8bb9f06-4864-11f0-a309-13f23c93f187;
 Fri, 13 Jun 2025 16:44:03 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by SJ2PR12MB9240.namprd12.prod.outlook.com (2603:10b6:a03:563::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Fri, 13 Jun
 2025 14:43:55 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%2]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 14:43:55 +0000
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
X-Inumbo-ID: d8bb9f06-4864-11f0-a309-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hXDtSQI9ENfs63oi4CbjfUXkFASO7DJLbtk5TxFDUmZHbasGxfUvTj6qlj0G8bbSglyPMaFmaY10NzYxuUitRf8S9IAJ/IKlPpon/06KkmkVvpb+czllzNj5lnDmpNmGxlVXSJyQbHdDgbcx2JbFHbEWr78ndb1M7aSPMpllKb3WuPeEf0whxTcs50XdlpFneJ8Uzur5XmSbl7x9oEGxMtyYTnGUU58lqnYDCAk32VVtv81khhWc5jv6mhlSQSbTF/6MWEuAP0EC8zuORKtC0HsHzBwEMYpSFnquC2u38p/L7ERvRWaR5xqb0uWsKfISIciU0DOtQjbjCo4J5DWVgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vbJRgRNf05snyNeQ/jstq+iPYf5XCECNRfAnFmDvOuA=;
 b=YIuKXoXu0m2rhXA8vvPSWxGCzFM+S3yWToDtTcG0M9wnhQGkKHrn2BzBgLyy14MGYQKGmFKHYLvxeg7QyplqPYt0VIwctvAW7hcb0Hp+nXRW/PYc/ZpmbaE28z+0cbTzQSINDVH+YGnhFzuICdxXuZ+Cu7QgYJbZqp67y4PAqR63SW1nRNJg1aNC2EcfMySoBmjHzWNqSdc0We9OLH3Vy+y763VhSzzTjbjbDfGrFKQGbzDUhp9XO/+8HTjqoxqj/iHOk/TRL3DKugjdnDhRR6fSMxIcCLaVtznla14tWX8zygOltt8E03UOsroZZwDoze1DhU1iTx6kHpOFYlfx6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vbJRgRNf05snyNeQ/jstq+iPYf5XCECNRfAnFmDvOuA=;
 b=wEDeUtfKvPsgZ1fY7gxn5ZRWszmk+V/W2nu6FNH+Yn/6lYxh6KVx8yrRerBc2MTeu0W4LDHGGfEZHBZ+vZwfxCCjC9gTdepPqv3gp1FS3F2cgyPZj0AfvUyfjwoZ5KGR0e20dX9b92x7TZm+hDf4MQkQy+/Do/JQPgaUh/J9lKc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <d489b84d-bf92-4f13-80d6-d6f325eada62@amd.com>
Date: Fri, 13 Jun 2025 15:43:50 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4][PART 2 02/10] xen/arm: Add suspend and resume timer
 helpers
Content-Language: en-GB
To: Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1748848482.git.mykola_kvach@epam.com>
 <d57cba4cfc0944c5483e68440a5675db735805be.1748848482.git.mykola_kvach@epam.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <d57cba4cfc0944c5483e68440a5675db735805be.1748848482.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR02CA0023.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::36) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|SJ2PR12MB9240:EE_
X-MS-Office365-Filtering-Correlation-Id: 98db99d5-3186-4bd1-1a3a-08ddaa88b8f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bk5FN0xvZmFvMDc5OUVtQUdWZVYvZi9HRWx6VVdWVjRoN0g5TWZCcHBWd1BI?=
 =?utf-8?B?UFZwTlF4Y1IxS25ZZWNic2U0U082dzB6NGJySFFxRG1vWjhwOWtPVy9VeTlW?=
 =?utf-8?B?T09oYm9kM1NIazlsd01WbGF5Tzhod1BsdW11TzFNeHJiT2FKNzVnV1FFcXgz?=
 =?utf-8?B?Nk9OczAwakxOU1lCUU5JTWtCM3ZlRS9WWlJOcjhleFlSMzhIcmNMT0pla1No?=
 =?utf-8?B?TUpscjV0VExWc1IyejdYYkpJQlI1cVNYMUk3WU1pc003ZTZBSENjNjVRa05H?=
 =?utf-8?B?MHZkcDBYLzNERnkyL01EOU5yOG5nVk1xc1ppNEs1SnVDRXN6UGJjWVdzZW5m?=
 =?utf-8?B?SU0zMDQ5UU5BMm9uRC9iU2dvL3VXNTYyRkNRcTNQdjgyRjh5NE9RYjVPMUhL?=
 =?utf-8?B?eUNvRE5YeGpqdFdTU3cwKzFYZklNR1o5bTRkeXdzcHJXVVd4bGlLbzhTcW5P?=
 =?utf-8?B?dmlzVytVTDVic0ZIRWpDZkJITCtQMWxmdDJ6eDdnM2hjQ1FCM0FUaFRVMGFW?=
 =?utf-8?B?a0wwMXVQd2Exak50bFlzVnhEKzNDMnEwY3IyRWdXSTJHUmQ2eWg3bUczOWFP?=
 =?utf-8?B?OHRGdHQ0elZvWVo1ZGNsVENobG1yRzE1TDkrMUU2OWFMelcrMXNjbnY3Zjcr?=
 =?utf-8?B?MVZSbGdnRnVtOFNGOEt4UTV2Z3pORnJrYzZ3allOODdzNjBaM1B6aUFzUkt0?=
 =?utf-8?B?RHBEYUdWMTVsaFZKVGNSb2dyVFgwRGJyU1RlbmZFYWNWV2owanJXZGowclZF?=
 =?utf-8?B?d2V5blZ5QW41bTZiM21xSTN0Q2psU3RCOFhNd0hzTFZVTXNicHg4U2U0QzVt?=
 =?utf-8?B?dDduNFhBSC9JU09hL0NZSlVMTDFDclN0UXFMQ0NGUjZZOFVHZ1VvUC9ncEVM?=
 =?utf-8?B?T1RnU3dIMjRjVWozN0Y3cFNtTkYxdndrb1ZDa0k3N0lxWHVjVm1OZHZBSHJB?=
 =?utf-8?B?aklRK016V2RrUXVwTVAxZU5SdkhTdE11VUlpS0ZIazFqVXhZNHdmMUtGNE5h?=
 =?utf-8?B?YlhHQXZEa1N2V2JZM2J0OHBCT0lDbEhseS8xZTIxYlJXTnNqdi9oZmV5dWpE?=
 =?utf-8?B?YVdYSWVoaGlyY1BKZzBTWnVVczhaOUUxa2w1L0hVZWJMYjlIYmJQMGxQQkdL?=
 =?utf-8?B?OC95RUkvTlhqL21RZ1pMNExMMXVUZ1RwSVovM0R0TUIxTVZaRWUyYzRURzlj?=
 =?utf-8?B?QXpWZGh2dHFBMTFLTS9qSWpyc29LMXM4V1g1Q3IrWnVIMEFKa2JqN2MxYXU3?=
 =?utf-8?B?ditMWU1aUG9sUUtkNUpEaEIrclQ5OGF1dDVxTHp0cWRndW5xOW9wT3NXTmIv?=
 =?utf-8?B?cTU3R1dRb0tNYldXZ2c1VzFUbWpwU2o0dHZReWtNK3dsUlpjVnRYTWlrR2F0?=
 =?utf-8?B?UFZncldDaFZyeG4ySWM2QlY1dS9OSVoxNWY0OUFnYWxhNTE2aG83WHFNS01n?=
 =?utf-8?B?OFluYUNaRHV2Y0xZRlBlRTlTaDVoeDVhVW1QemwzMGxUQis1QjEvSUk0THh2?=
 =?utf-8?B?NU1FN1c3Wk9sdHpOZ0pVMnBqNHBValhFdDNiUHZaR21lUWM0ZnlSU0xjSzR3?=
 =?utf-8?B?WXJiL0Q4QnpicjFycTZoQ1FTMU1UbDA2bXNMNzFMVHJLRHp0U0pjWkZoL2Mv?=
 =?utf-8?B?MGlteEVoWXFIc0NLZnN3cko2bXQyQ3p5ZkpZd1dNRGQ2S1RxUVdxNjBobTB3?=
 =?utf-8?B?Y2ErWmd1cnU0a2s0NGFSQUJKcUNDK2d4SUcyeThOcnMwc1ZoWUM3dW9XUDMr?=
 =?utf-8?B?REZFaHJsMTVhT29jYW50MGllUmVPSzF1dFFpcVJNQ253MGV1YytTckdiL0Vq?=
 =?utf-8?B?L3lPTzBBdzh0dFdTZmRoNXRKQ1l3M3E1N3R6Wlp5aFVxUFltWU8xdVJSSzYx?=
 =?utf-8?B?bCt1c0VCTzAvUENWSzV1VUptbWRob0hHUkl5bndsUWNZRVo1bXZXa1hMbG9t?=
 =?utf-8?Q?6Es751pm84M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N2JKb2xPZnZ5cGtaSnJnYVhzeE1keG5NTnJEYllwTmp3MjJOKzVzekpQZnAv?=
 =?utf-8?B?ODJaa1BrejM0WlAxN3RmRXg0bXRpMWV4NFIrb3M1UGJ5Qmo2bWQ2Ym5ESTJo?=
 =?utf-8?B?dXZGOEJHa3psR3VKSHErbFozRWtINEVLbmh2YkN3Y1d2VkV4bDR2L3AyeVVx?=
 =?utf-8?B?N1lvU0RxaWliWFE0elhPZUZLZ2NhS09LRC9GakR5aFAvTHFzRXdHNVd0Q2cy?=
 =?utf-8?B?cWhVakNJT3JwcS9qcmFzcW9iWDhPSnFQWE4vVExFR1JtZGVXOVh2NTU4VzZ1?=
 =?utf-8?B?WXVYTklPZE1uTWtaY1Zha1pORDU0Zk02VlQ1SzFZblVSNjFSdkRMeFBxNUlI?=
 =?utf-8?B?RWVLVEg3SGxZY3NJbnppeWJUNHJiUk5KSGQyZTUzajlocGdyZWtacXM2UFRm?=
 =?utf-8?B?RHlORm1sU1VTZUw2eWl3dldMU0RmWEhXekt1MHdxcnpzWEc2YjVPT0QrQVE0?=
 =?utf-8?B?VUM0QkRoRGJXcnJQNnI2YUpPMlNuQTJscmJFTC9Sd2ljRGh5STdRM2JZN1hP?=
 =?utf-8?B?NFE1Z3VicDFpYTdmWVVQMEtEa3hJRnZCM1IzT3N1bmN3TVRhNmI0SHkrWUZB?=
 =?utf-8?B?VGhGSCtkMnhmZE95cWhEQzRzaG5POGttWm5CSllpWlFBN2NZQ21JMUozYWJn?=
 =?utf-8?B?b1ZsTXVHdkwxZk45N3NlcUV6dW1PQkRmN2RtbFZBaUNDSlphUDlmVUIxZVBF?=
 =?utf-8?B?cktDRzFNbGsvdXZFNWo0Nm9YUjB1d3pSMWJEVlgvd2MvN2lMZlcrZ21pWjh1?=
 =?utf-8?B?Mi9EbkFpb091bE9FMFpydGpEY2E2WXZ2c0tZenpkcXFIcDVpR3A2c2xnUkdC?=
 =?utf-8?B?RTBnQXgxQmd3YVY2REt2SnhUaDV3aE9BYUVQbXVmR09od0V3eXdIZ3pKaTRK?=
 =?utf-8?B?Wk5TWXJXL0pScGJHU3EydWliRWxodWRIbmJ5MGRRMlUwVlhzeEJDZnJjRU50?=
 =?utf-8?B?dXdzNGhTWWxLdlVkQkNkVkZ2OUFOWU9wNG1KeGc0Q090amFGN2J4UGVJRm0w?=
 =?utf-8?B?TS9FZlJTd056THhpWDNUSndJY0cwejdYZ3I2YmNjZE9tOGtlSm1zMHc3NG5x?=
 =?utf-8?B?M2NseFZWWDVvWkxDbGFBUFoxaksvWERqTXpNMHBTOUsrTXFBWk1qeUF6VVNT?=
 =?utf-8?B?ZEVla09zUmZ0UC8vblVZWnVOK2IvZmYyMWRVUVhKYjhKdTRPUlBFRjZ1cDY1?=
 =?utf-8?B?UC80UXcxV25wencrRlpwN0YwNjZvM3Z2bUhxYnIxNFhyeFFpbjhjamRIYkVn?=
 =?utf-8?B?K3VuMlhONm9WSGpTL3hFNEZPSDZ6MmVrdTFxT2Q2VFQ4a25DNGxDNHZUdEhv?=
 =?utf-8?B?cTBjcHZhWkV5RXF3RytqdGVtbjAyeUxlUGxmQ25nWGN5dGdPWVlVbGFNZG1k?=
 =?utf-8?B?WmQzcktvSktlY0JyclYzcnd5VGNFdGpYOFFWdTcvNVRqTGM3OGRNLzZxVHhE?=
 =?utf-8?B?ZHFFbFFrd1lMTzQ0QWQ4WHFxckFiKzFtZjZHbm5ZazZhcmlTb2hKbXpia04x?=
 =?utf-8?B?QWpwdW5DYjF6cHlnbWVBTjV0cWZkRG56aFZucjk0bTlYWElpSzNKbEJ0dEdS?=
 =?utf-8?B?V1NkNFAveGU1cEgrenpKRFlIamd0U2FMOXJBWGE3WTVJem1XZGRwTHlIbUhC?=
 =?utf-8?B?L1JieUtSaWZIOGp0cW53bzlIZnJoaWVaNFFVbXB3blNOQjJ1eThJNlNBOXZ4?=
 =?utf-8?B?ZmwyZ3llUG1TcHB3a3lmekhkMFFWOU5TcVc2cTJkME41d0NaNWhLU2JjcTBG?=
 =?utf-8?B?RUpsWEMwZGtqUlI3NC95TXZETjYyN2puQ2VOUjJSWFVEMXRjOXdabUxoS2ta?=
 =?utf-8?B?cGt4NTUyR3FndC9nczIrVG55aW9CTnNCQzV0cFFSNlQ3SjNLMGJLTTk2Tk1p?=
 =?utf-8?B?L2tveEhidUYveHk1U08vajhYUnc3ZVk2bkgyV01yanJoaHZLRXh5OUdGUGda?=
 =?utf-8?B?bHBDMzZpZW84NzJOQkVPQkhpcm5qNmovMTcrUzBwSHhKTktvMzFNbFJLc2FD?=
 =?utf-8?B?eUNWWFQ0cUFDTWkyWm0zSWlJN1RYeVBWOTNBNDI0T0JxY3JnSEhac0h0Nm0r?=
 =?utf-8?B?aCthVW5Od3VHNkk2YXVseWVrQ1NYRVdNTnhIYURURE5uYm1GN3YwUThqRVhC?=
 =?utf-8?Q?j50Yc++/XKEgqp9gsU7hXNu3p?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98db99d5-3186-4bd1-1a3a-08ddaa88b8f3
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 14:43:55.3319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nxv0I8XawhuWl1xq/DlvC7DDWvjZZsFEbHOWYOO+CaJ6Dl2TdiiTZ8k0UHAaGri3LFf0C6n+ZN6z+96q5XaVFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9240

Hi Mykola,

On 02/06/2025 10:04, Mykola Kvach wrote:
> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
>
>
> From: Mirela Simonovic <mirela.simonovic@aggios.com>
>
> Timer interrupts must be disabled while the system is suspended to prevent
> spurious wake-ups. Suspending the timers involves disabling both the EL1
> physical timer and the EL2 hypervisor timer. Resuming consists of raising
> the TIMER_SOFTIRQ, which prompts the generic timer code to reprogram the
> EL2 timer as needed. Re-enabling of the EL1 timer is left to the entity
> that uses it.
>
> Introduce a new helper, disable_physical_timers, to encapsulate disabling
> of the physical timers.
>
> Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
> Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> Changes in V4:
>    - Rephrased comment and commit message for better clarity
>    - Created separate function for disabling physical timers
>
> Changes in V3:
>    - time_suspend and time_resume are now conditionally compiled
>      under CONFIG_SYSTEM_SUSPEND
> ---
>   xen/arch/arm/include/asm/time.h |  5 +++++
>   xen/arch/arm/time.c             | 38 +++++++++++++++++++++++++++------
>   2 files changed, 37 insertions(+), 6 deletions(-)
>
> diff --git a/xen/arch/arm/include/asm/time.h b/xen/arch/arm/include/asm/time.h
> index 49ad8c1a6d..f4fd0c6af5 100644
> --- a/xen/arch/arm/include/asm/time.h
> +++ b/xen/arch/arm/include/asm/time.h
> @@ -108,6 +108,11 @@ void preinit_xen_time(void);
>
>   void force_update_vcpu_system_time(struct vcpu *v);
>
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +void time_suspend(void);
> +void time_resume(void);
> +#endif /* CONFIG_SYSTEM_SUSPEND */
> +
>   #endif /* __ARM_TIME_H__ */
>   /*
>    * Local variables:
> diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
> index e74d30d258..ad984fdfdd 100644
> --- a/xen/arch/arm/time.c
> +++ b/xen/arch/arm/time.c
> @@ -303,6 +303,14 @@ static void check_timer_irq_cfg(unsigned int irq, const char *which)
>              "WARNING: %s-timer IRQ%u is not level triggered.\n", which, irq);
>   }
>
> +/* Disable physical timers for EL1 and EL2 on the current CPU */
> +static inline void disable_physical_timers(void)
> +{
> +    WRITE_SYSREG(0, CNTP_CTL_EL0);    /* Physical timer disabled */
> +    WRITE_SYSREG(0, CNTHP_CTL_EL2);   /* Hypervisor's timer disabled */
> +    isb();
> +}
> +
>   /* Set up the timer interrupt on this CPU */
>   void init_timer_interrupt(void)
>   {
> @@ -310,9 +318,7 @@ void init_timer_interrupt(void)
>       WRITE_SYSREG64(0, CNTVOFF_EL2);     /* No VM-specific offset */
>       /* Do not let the VMs program the physical timer, only read the physical counter */
>       WRITE_SYSREG(CNTHCTL_EL2_EL1PCTEN, CNTHCTL_EL2);
> -    WRITE_SYSREG(0, CNTP_CTL_EL0);    /* Physical timer disabled */
> -    WRITE_SYSREG(0, CNTHP_CTL_EL2);   /* Hypervisor's timer disabled */
> -    isb();
> +    disable_physical_timers();
>
>       request_irq(timer_irq[TIMER_HYP_PPI], 0, htimer_interrupt,
>                   "hyptimer", NULL);
> @@ -330,9 +336,7 @@ void init_timer_interrupt(void)
>    */
>   static void deinit_timer_interrupt(void)
>   {
> -    WRITE_SYSREG(0, CNTP_CTL_EL0);    /* Disable physical timer */
> -    WRITE_SYSREG(0, CNTHP_CTL_EL2);   /* Disable hypervisor's timer */
> -    isb();
> +    disable_physical_timers();
>
>       release_irq(timer_irq[TIMER_HYP_PPI], NULL);
>       release_irq(timer_irq[TIMER_VIRT_PPI], NULL);
> @@ -372,6 +376,28 @@ void domain_set_time_offset(struct domain *d, int64_t time_offset_seconds)
>       /* XXX update guest visible wallclock time */
>   }
>
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +
> +void time_suspend(void)
> +{
> +    disable_physical_timers();
> +}
> +
> +void time_resume(void)
> +{
> +    /*
> +     * Raising the timer softirq triggers generic code to call reprogram_timer
> +     * with the correct timeout (not known here).
> +     *
> +     * No further action is needed to restore timekeeping after power down,
> +     * since the system counter is unaffected. See ARM DDI 0487 L.a, D12.1.2
> +     * "The system counter must be implemented in an always-on power domain."
> +     */
> +    raise_softirq(TIMER_SOFTIRQ);
> +}
> +
> +#endif /* CONFIG_SYSTEM_SUSPEND */
> +
>   static int cpu_time_callback(struct notifier_block *nfb,
>                                unsigned long action,
>                                void *hcpu)
A question. Do you see CPU_DYING gets invoked during platform suspend ? 
I wonder how this code path is invoked with

time_suspend()

- Ayan

> --
> 2.48.1
>
>

