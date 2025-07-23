Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C675EB0F1FD
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 14:12:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053900.1422688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueYL1-0003m9-C0; Wed, 23 Jul 2025 12:12:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053900.1422688; Wed, 23 Jul 2025 12:12:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueYL1-0003jn-80; Wed, 23 Jul 2025 12:12:47 +0000
Received: by outflank-mailman (input) for mailman id 1053900;
 Wed, 23 Jul 2025 12:12:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3SBI=2E=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1ueYKz-0003jg-Tr
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 12:12:45 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56e16e86-67be-11f0-a31d-13f23c93f187;
 Wed, 23 Jul 2025 14:12:45 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by DB9PR03MB8799.eurprd03.prod.outlook.com (2603:10a6:10:3c4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Wed, 23 Jul
 2025 12:12:42 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8922.037; Wed, 23 Jul 2025
 12:12:42 +0000
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
X-Inumbo-ID: 56e16e86-67be-11f0-a31d-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lJx4AxP4xrVsjvsvLp+m0d5M/DVX3eeQTNbmWZF4HKPKwOfuZ70sk/eM55JqJbHjzxuC/w55tp7E8OD3nIsCPTq6iiTc1Gm6RkGUR8V4grJi1t2FEqisHklTW5ZFw2G+NUoAfCstAMQcJQ0sj5XLSpWrADlUgZZcuV+VWOT5GP1+PYxGR6AJXpd9VbhtOFCAha88cE8lMhqtkrqcDVE5KZklrqZrSX7gOL2RMlhrswTnIGl8YTOw5Qdqzis3oeC5So6xaylJhrmwCr8wMWwvGw8fSr9cqBrUIcegYjSWWV6sSTWSC6gUM6BEKW9QEqB7fhyKHkxSA8e97/90Ze6P1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mr9E2tTXV2xWAk92JaADXJPR/lhZP6TH56F8ch5FU+8=;
 b=B15+5JAC31iqBMpz0Itb4OKBs/tX117Bcm7o31ayv3pLW4CDmTI6awhszoki0yhZhFChO5ovq7KQOdHm26zg2gAndGq+xhLXFz//wHMvJ+xYom8Ysbmni+HTJMGfeNjzYUAv1clKQP9i98P0CP5xU9524S/igtKAwv3Qnx71uoCncsju8o1dRSI/HrOvCUGNR8shTYHk44rWLrgs5NVL+/uPvGD82Bixx68LLguhBdymnTOpZlKXs1Nm8Om/x6UKk+8gF4/af+vMSTaCjv6YCOsu/ja0F9n3YnaK6R2lhWW1ER6YkAhSRq3SbvknCSZGjCmsmG+EYkTGehM97d+7Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mr9E2tTXV2xWAk92JaADXJPR/lhZP6TH56F8ch5FU+8=;
 b=newPmrUfNFRMIVCafg8l7RHbkcMAkOrfRZBLYhe6Tc6NJtbC0T/M1oFpZ4WGAgRNzasq05E7MjsFdRhvE6Mq7IjFcDoxAicjpdBpkC2fkz6YlsjPyrW5TIbKUaccIvFkFhJtNLrqIxbDKrV7ewRcADGx38FfQb5hj4fp+C+wTBdNA8u9zcCkbszZH+MDjTZ7bXOYUvVLM7u/phSjchj/dOYdYHUn+1PMuYI6EoJ0zLGoc4NMNGDsqNwEvwIMxKt3oGJkTfLEfezHVJHoVMfrNUeWgKTApjDvgBpx+7ygp/eRszM+ENnmQOZlFbMLXwsk71RkLnorSM7/FJ7y1HSotA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <10bc21a4-77ac-4c5b-8c2c-0022936b19df@epam.com>
Date: Wed, 23 Jul 2025 15:12:40 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH 0/8] xen/arm64: make aarch32 support optional
To: Julien Grall <julien@xen.org>, "Orzel, Michal" <michal.orzel@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
References: <20250723075835.3993182-1-grygorii_strashko@epam.com>
 <b968715b-20e5-4a63-8ad3-d4250e796c5d@xen.org>
 <e35822cc-d8a0-49c1-a4b1-2765e0e6cb6c@amd.com>
 <add27fd8-aaa2-453a-b502-fd505ec77f94@epam.com>
 <71fa14e0-83d7-48ec-8bd9-258ec8f6cedf@xen.org>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <71fa14e0-83d7-48ec-8bd9-258ec8f6cedf@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::17) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|DB9PR03MB8799:EE_
X-MS-Office365-Filtering-Correlation-Id: 837b5865-d847-4338-294c-08ddc9e23992
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cG85bHM0cjNxNEk0ckhGZXlRaGlTSGlwSTJNM1RQcXdUdGJ3Q2JYWENPT2t5?=
 =?utf-8?B?TkxDNzN3M2lXUGNKUXE4RWJYOFlKQUZVWGw1MWxEK2lrSFJFcUZTRm5JYjV6?=
 =?utf-8?B?cVpKMytUaVJZMTE4Y3ZsTjBBSFN2TnI4TWE4d2JhMi9EUnVha2dhdEdhSTNu?=
 =?utf-8?B?b0NwNE8rMjRPM25RbVpMemN1ZnRMdTZrUDNrYStrSm1xK0I3WGpnTUJ6RTk3?=
 =?utf-8?B?L3d3TVBYSUw1YnYzWTNRRkMzRGU1bmNaV0FIWmU5S0RlSjZNT1hFWDdxamFX?=
 =?utf-8?B?SXcwcDMrWVVrMzgyY2h2UDZUN3dvWFhDOE1GdnpXY3NJMGViVm5aUUNVdmtp?=
 =?utf-8?B?dkFDcUNaZ042UXVFcy9oUkp5Q0lodWN1NWFPMkdYMENyOTZJbVJzcmtNY2k2?=
 =?utf-8?B?VEpoUlFPejdiR1RYb1JwcjVVOEMyTlQySXVNSDFYMXZmUkl6UnQ2c29HRk94?=
 =?utf-8?B?clFxcG9kdEw5dDExNE1oMDNMMXZwTEFsM1JESXdGK2FwRkhzRFV3Q2U0Qjlu?=
 =?utf-8?B?NHhsRUVQTFo1eUxSV2JXOTdIdTBMY2RTekRJS3llYWtDK0RjSWoyNHZzMlFJ?=
 =?utf-8?B?UkJoTlJQZlRUcWNlZFY3WTBKUG5yRU5qWWJsd2FPeU90RHNBUWIxRFZvSVo4?=
 =?utf-8?B?ZVNHTWFNaFdWbHRTSTlTdDNkVDZlS0hVWVFDQ2RPL2R2T3EyQlFncDFVS0tk?=
 =?utf-8?B?TnprRDQycVpxNmowTER1ajJyZ1ZyYVJiWk5URE9vazcxVzQ1blpwRzZxTnh3?=
 =?utf-8?B?WmxlVlg4ZXRqT1ZWdm5GNHBMODdLdmd5MVZmZXlPenpESXdwaTYybEJWVGt3?=
 =?utf-8?B?N0dzQXhRQTVGRXNMbW5uczIrRDcwdUFuMHRGSFMyUWRXTW1BRGYvS3BmRmFK?=
 =?utf-8?B?VXlvT2dxRmtCRkx3MVlnRzBzZE8raTNBTHZpakxkUFVKNjlvN05rN0dyeVBN?=
 =?utf-8?B?VjhQaDZjYmV3SVBwNWppdi9sQ2VRUUtDODdrNnRveGdoSUV5QVlUd1JGSmZN?=
 =?utf-8?B?V3c0eS9CQlRlU3RiVC84WEl2TnIzRXkvc3JGSU8vS0h4L2tKdmc4aUFhdjRG?=
 =?utf-8?B?MUxDVjk5K2hOOEkvQXo3MFhUbDhMLzFPYjc1NnlLdm1FalI1bXFnam5KVVNJ?=
 =?utf-8?B?eEhSdlF0T0prZU1ZNXU2cnhkZ3FTL0NTbHdMTXI4d3EzNDRmVitqdkZmU0pW?=
 =?utf-8?B?eTdxb1lqYkR0VUluSzE2Qkp1cXp6Q2xlblN2K3E5dDlCUVV3UjR5MFJXZHlS?=
 =?utf-8?B?TWFMNEo2WFJMZDZhTXdCTGxMWFo2RkwvTkR4cnN1Y2hOalBJTU1VVWN3cUtX?=
 =?utf-8?B?aCtiWTdDTElUd08wd1JoR2NSSEk2RVEzVk1OeFJ5L2VNSkUrTGltcDE2Z0lD?=
 =?utf-8?B?aEI1MDduYWJrVVptSytDT0dzS09FQlRsZWtOQi9ZTy9RMlQ2Z1o0UzQvS2ZU?=
 =?utf-8?B?QzVxQWlzZjVtK1g4NStVaUdGREE3bmlDbHJkWkVaWVRIM2tYNC9JazljbGNQ?=
 =?utf-8?B?ZWZZRlU4TEVIZmk3eGdiWUhGV21kUkNuVDZtZXowWWxvZ1U1TGo4cFRNWEJs?=
 =?utf-8?B?cXVwelphU0N1VWo0RVlvTktVT3hhcjgrZVBYcEZOUlRBTWZBU05QNFNKZm4x?=
 =?utf-8?B?QkxjTTZNWFdrQStmdGtCN2xkMitpLzQ2bk9KOWVUK21Ea1hQUTQzZTRzbXRC?=
 =?utf-8?B?Q25uektRc212MzdrdzIrVW9XVktCc3lyN3lydW1odERhcFRwTk93cEFYdmxv?=
 =?utf-8?B?ODNjV0JLeGtldFN5NUpFd1c3dlJ1SmR3d3NPaktZUTEvTUVQUVR0aEl6cjBm?=
 =?utf-8?B?TEJTcXpCejlXbkx6NXgxRW5YK0tpTVZ6SEVIOEVBbDB6WDVqK0lpd2VSaUF3?=
 =?utf-8?B?TUE0UEhsVHlNTzVxYTRJcnIwS1NUVHFWb0gyQURodGNzVW1lQXZjeml2VmtP?=
 =?utf-8?Q?8ktSlxnWFTo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RkxNYXNrdGlITWc5UUpPdG9SaUNwOHgzcVZVWVdWRHpoNERvT2hYUHBBakVt?=
 =?utf-8?B?NGZ3TmlGMmJZMW1iQzFyYUtpZmphWTkrdURSUXlyQWpRTmZ6YVJLbXhGZVUy?=
 =?utf-8?B?N25QaU44U1BEb256amgzRjV4azdvaVpCOHZvRUZzS0ZuVUlIdVM0TTBTOTk1?=
 =?utf-8?B?dTZUam9hVUw5YUNLK2VjTllYbTZia2QyVlkreGp1R2dwb1JDRjFPR3A4UGhO?=
 =?utf-8?B?SGhCcTFZOVQrSzNmbjAvTFpaUGVVMHlmSjNvU2NNMlIvellxWkNyMk8xMmNn?=
 =?utf-8?B?MnNpMmVHWWU4TjlXREVYaWZIam1qYk5sNUN3T1VEZEJud1BVUnVlUDAwTkRP?=
 =?utf-8?B?RU5IdERTQjIweVNOOGRGSUN2WUwwVW05amhzR2ExV3lkc1o5aUZEOXQrNEVY?=
 =?utf-8?B?ZmNnT1BYZkxTZndabFBucTB3TmV3TDI0bnlSbHF2bmc4MGIyeHZVZ1lVbSti?=
 =?utf-8?B?aWhmVkMwUzh2ejVMQk54RWp4cDNZclBYeWVKOGVONHBQWmlVcG5jYkdNc3pW?=
 =?utf-8?B?SWZMVXJOT0hHRVI0WDgxZGFxTmJOc1l1M1IyZ2RubWhIbEFUK2FiMlYzR2s0?=
 =?utf-8?B?ZHFOWjJtTG9haTduVkNqYm00L1dQdFpUMVN3Z3ZkQTNLUkdEM0JScDh0ZXZF?=
 =?utf-8?B?M0RJeHE1dUQwVHZMeE9sd3RkU1lJRTg5TUJHbzJobTRFd2U5SWdwNnlmU0gw?=
 =?utf-8?B?VWduWGFLTmJDeWl0WmtZbXBxa1hzMllSU21ycE9SSUxvUU0raXNJVDR0Wmxo?=
 =?utf-8?B?OTNsUXpiYzZaekN1UTBZSzVwelBvL2kxSnFLaHVUdVhxQWxuM2NkMUlCQWRj?=
 =?utf-8?B?S3hpV21ZVzd2Mk1JYnZXRTg2UVFLRDMxSFBzRkw0WDF1d204dlJqVTAyMStH?=
 =?utf-8?B?NWJqUWZJMWtPa3FQaVdhYnlxTjhOM3dTM0poREw3UzlKRCtnQVFvOEYxS0Yx?=
 =?utf-8?B?ZlFpdGRFQ1VBeFUyVzU4NVJhMXNmVmR0OHpNUjBVVnpYalFVOGlBYWxTdUsr?=
 =?utf-8?B?R1BKaHJNNlRuMEdyRVBNMDhGTlV4V3dGRzd5cXNKeDRUTU50K0pscTd6c1BL?=
 =?utf-8?B?WitKczdwdjVHbTRteW9SNTY2a09HaUJhZWdteFhza1YwSy9ZVFAvL1RRZ2Fi?=
 =?utf-8?B?WEJ1WVluVzAwL2FWZlNXRWgzRkRDblVGVmVYeXFKcmZVNjU4QStCdWdLWHRV?=
 =?utf-8?B?c1Z6ZmU5Q05Sa21HN2dKMWdoUm9XcGJFMnFyclgzSThrTy9wVkxJLzhsR2g5?=
 =?utf-8?B?VjQzay9BMjhuNk1teG1lM2xPb2ZXQTJFZXJ1OE5heGpKY3ZoTlNiYlhhTDdT?=
 =?utf-8?B?cVJqZlMxdWEwKzUyVVY3VkVQUGRzWmpPTUpjQThxdDFteExpZ3hCeFFwWm1O?=
 =?utf-8?B?MEVSN3lJRm5XNkIraEdqVmZoaVFiTTVSbDByYTloaEtncVVlZ3IyQlpRSmp2?=
 =?utf-8?B?c3pVSEhiUlUwS0ZZemNuVVJ3NTA2cVhadEJtUUZuU0ljY0t1STZ4OHBjeUtO?=
 =?utf-8?B?MWZKeHFBeWFHbkovUERTY1Q4ay9UUmFSODNXSlhhZUczTjF1SHZTQm5va001?=
 =?utf-8?B?RVBMR21EU2xaazh4K0EwVjg2YXE3Qmhqa3ZlVHA3bXRFWkRmYjdwT00zUWtF?=
 =?utf-8?B?Q1YvdUQ3cS9DTEFQU1JGcXBHZUVyRFU3bG1LdmRjbTBocTd4TFZvS3hoeURZ?=
 =?utf-8?B?WUlGbzlPM0dlTk43cm9DTENTWEY5REI2ZklDQVdTb0JDT0tBb0dUWDY4bERV?=
 =?utf-8?B?eEROQUlqTWRjWnBHSVNQRkJRNlNJTE90UTQ1RWlZM0drWUd6SXd5VWlJaENy?=
 =?utf-8?B?Tmsvc1lpL1dxcjg2Wmtab3hkR1pFMmo1NWxJWjc1dy8yNHJzdEF2WFpHdkFW?=
 =?utf-8?B?SnhxVkZZWEtmZ2dBaVQ2SzdueFJMNVJzVnVJazFQalJDM1F2S3JoeGhFZTRY?=
 =?utf-8?B?UVVaa09SQmRqSVNHVXJTOG9KVG5IZnI3VDRyQmtBSDY1RWxSaTc4bE9jVXlG?=
 =?utf-8?B?SHZ5WjBwMEUxMFEzNnJGS2wzQ0FhS2Y2UzViOGZlbzdLN3E0bVlGR3BCRFlV?=
 =?utf-8?B?Nnlpd3hjOHVReVY2bVk5OTR6OWIvd285S0sxT3hXZ0UrNmV4SGFjOVFqN3Fx?=
 =?utf-8?B?RVR3bGtLTDM0UmxZVDB0V3FGR0dzNFRPd2RIUUZTSDRPakl3VkNOaG1LVU5R?=
 =?utf-8?B?VUE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 837b5865-d847-4338-294c-08ddc9e23992
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 12:12:42.3113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vF0vU/E7bSFTQ/3ZL+FrVIsWpG6pYdxje8WSh+TktInqEQS4esW2xPm2DmdvW6syCIQEPM5lmMOI1euN5LzXxb1ivVbmDuZfo8JtfDZ4ej8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB8799



On 23.07.25 15:02, Julien Grall wrote:
> Hi,
> 
> On 23/07/2025 12:48, Grygorii Strashko wrote:
>>
>>
>> On 23.07.25 13:54, Orzel, Michal wrote:
>>>
>>>
>>> On 23/07/2025 10:06, Julien Grall wrote:
>>>>
>>>>
>>>> On 23/07/2025 08:58, Grygorii Strashko wrote:
>>>>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>>>>
>>>>> Hi,
>>>>
>>>> Hi Grygorii,
>>>>
>>>>> Now Arm64 AArch32 guest support is always enabled and built-in while not
>>>>> all Arm64 platforms supports AArch32 or this support might not be needed.
>>>>
>>>> I am not entirely sure I like the proliferation of using CONFIG_* for
>>>> every single feature. This makes the testing a bit more complicated.
>>>>
>>>> Can you clarify what the goal with this patch?
>>> AArch32 is used quite rarely in embedded systems. Also, in Armv9A it might only
>>> be implemented at EL0 if at all. When focusing on safety certification, AArch32
>>> related code in Xen leaves a gap in terms of coverage that cannot really be
>>> justified in words. This leaves us with two options: either support it (lots of
>>> additional testing, requirements and documents would be needed) or compile it out.
>>
>> FYI. bloat-o-meter report for this series with CONFIG_ARM64_AARCH32=n, CONFIG_EXPERT=y
> 
> Thanks for sharing the bloat-o-meter. But I don't think the result below warrant a new config.
  The reason provided by Michal is a better reason as the impact on safety certification is more significant.

It just an additional info to illustrate achieved build-time optimization results
which reduces coverage gaps.

-- 
Best regards,
-grygorii

