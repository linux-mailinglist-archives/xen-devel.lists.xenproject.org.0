Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 086BCACFE82
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 10:48:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008200.1387433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNSkB-0006SD-3N; Fri, 06 Jun 2025 08:48:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008200.1387433; Fri, 06 Jun 2025 08:48:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNSkB-0006QV-0U; Fri, 06 Jun 2025 08:48:07 +0000
Received: by outflank-mailman (input) for mailman id 1008200;
 Fri, 06 Jun 2025 08:48:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Fse=YV=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uNSk9-0006QP-Jd
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 08:48:05 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20608.outbound.protection.outlook.com
 [2a01:111:f403:2408::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f2d70955-42b2-11f0-b894-0df219b8e170;
 Fri, 06 Jun 2025 10:48:00 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by SN7PR12MB7249.namprd12.prod.outlook.com (2603:10b6:806:2a9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Fri, 6 Jun
 2025 08:47:57 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8792.034; Fri, 6 Jun 2025
 08:47:56 +0000
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
X-Inumbo-ID: f2d70955-42b2-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VQkxvSoQ8nFiO1r1jXsoXDKEQOUt3rJwhb8gsbUf2h7MzXKSseOyFYhLbvDiySDBlKDuALoYoWgriEK6TXQRpYLxwf8efOLT/VOCXK7WTBYMMfgUBy2CYaP0zu56laWOqcW2k4H0UinDKo3K/YJMIM1QK67qZSbfWrQLTQ14TlCu47TVNXJE67iav7b+12/TeIClnzrYSmGLy64t5UZOHbNWwfdhQj67RTb57dNfqyJR5EAYKSSyDQ/eIR2A8jk780B4jwZkoH8R1wkubvDloSX5XdnkJqCxG/0Zhx9OsihZdSiypwiUK8QSdeC4m+XbM+dyDngU/WRA4WZ/10Z2RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ewidhrATVjlQ/N+7yA9RGXlYoqwFSBej2a0wTWBTJM=;
 b=cII7FjI28Q2Y1R2Oqw4ablIoFQw7QustwfS1NL4GHMGyMZZ+0VCHI7P6f9ARRt/ckd4jkKVkpGLoNuAgKWOxLMuBoHIOymRz5M3ltbvcvCaghqlAbYamkWh2cojri7yvG/uIZUvs50Nk9Pa7RNuWVcq8VoUOG3IR1pdpfNQiBq84+2Wli8xyXQiDeou4iukO/orzUL96YWnspzKvzGWW/b6mCnRQFJkAJna+VW6jTsWy44r2Tj94yC4XU9jYAT5hGuXDqDcDTSKhgNgIueAUgbLyoGO9R2u0m/wlEreKNpwSlFWHh5thiQN520HTUc664xkM7ts3h/vrO5UsE//SUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ewidhrATVjlQ/N+7yA9RGXlYoqwFSBej2a0wTWBTJM=;
 b=larG2uQ8yGqBjNL4R0iM5qpNsl/HQm3QneVDA4vZpH8aT9Ykx4sL//BwlIZIT5fj0xBAWCbJIlZwMlD4qyLfperrCtpapTicTdXxXSdlRZE46TkLy+BrAPvoZHMIPz7ehPT35Ed59TnO0pqv+8S115QE3N74NAyKSb8uHWYxE0s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <bc2decbd-2dba-4a96-8550-9b6a716971b4@amd.com>
Date: Fri, 6 Jun 2025 10:47:51 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/15] xen/dt: Add BOOTMOD_MICROCODE
To: Alejandro Vallejo <agarciav@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <20250605194810.2782031-1-agarciav@amd.com>
 <20250605194810.2782031-4-agarciav@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250605194810.2782031-4-agarciav@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0062.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::20) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|SN7PR12MB7249:EE_
X-MS-Office365-Filtering-Correlation-Id: 24959e41-5079-44aa-540a-08dda4d6d56b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M09pWnViZHdCZXVwSzZ0UEE1YU9WTHlPaVA3NDZ0Zk5EVXdKV2R6SGJ3THVq?=
 =?utf-8?B?Uk81d2ZYMno0emF1L2lxQ1M1L09EWHZ0YnNxb1BqWEl6aURObkJ0bWZYUnBi?=
 =?utf-8?B?ejhIUjJLWU83cnZaS3FhQlJ1WHVyeWxIQkFicjJFZzRyTk1MYzNaSXlwSVlF?=
 =?utf-8?B?bkc4QmR4Nlg1NHYwK2c4SVp6L3B4QXlweG1ZK2I4WHhJYTd5R085MGxzamxY?=
 =?utf-8?B?alVqc3hUNGhweXRjNE1KbkMxZ1I3cmtrL3ZENmhwWlg3c3Z3dHAxcTRkMGla?=
 =?utf-8?B?SkFwRzM2Z0puSGcxeENWbTM3bTZkNmNqdEJyam5nbUJFUUFaUVdXcGJFNVl6?=
 =?utf-8?B?dmw0aGdSUlF3NTlGWEt0cEdTTnB4VG5rd0h0Mlhyc2ZJOUdoN3ZVaWNaNVBz?=
 =?utf-8?B?TlZrQmRDTEZEbURjWi82QXVqZDkvaUQ2NTBTRU84ZnR6bVh0UWJwcVhib1pZ?=
 =?utf-8?B?dlQwUFlSQTBQTDd4VnU0ZnhCZGYwQ3dWS3dtYjd3ZTB5Z0tMbDZNYjcvTnpT?=
 =?utf-8?B?aU9iQ04xTlZsb0pHdEQ1Y25rK21QQjVUUkhCRlUzNEE1akFpTmVVRm9FS0ho?=
 =?utf-8?B?blpEOXBPQjl0aDhDWjZNOFplV2ZkODFxOGNKTEpUM0liMytCMGhhSWtjcEs1?=
 =?utf-8?B?cVVYTlJlZkZWSDJFeWhVY2Zib2pmQzI1bWdSWWMrWlZEQVZ1Nk1pekVCQy9N?=
 =?utf-8?B?bUV1ckdJd3ZBa1V0dUprcGtvRnN1VUg1bVZRc1hxV2xqZTREYkxjdlN3b1NM?=
 =?utf-8?B?Wk1vUVlNOWJsMWVCUWhVRHE5bjRyN1RVM2J4QkxJZW1pZDRyQzdKcHNHMzQ1?=
 =?utf-8?B?T0h4YXFST2N4NnFwYnhDbEltYWZ5Y2RseGkwQXhjTVJiYWl6ZTNqeVlteTVY?=
 =?utf-8?B?aUE4ZlE1cmptcmNhbFRCaGZnbXZvVGNtNDU2ZjdMZnNleFcrTGxSdUpUazNU?=
 =?utf-8?B?WmNsd0JNcVdqTjVsVy9TRnVzZmlRVE1JVE05QXVqSnRtWnVuK1cxd0dEN2Vj?=
 =?utf-8?B?WE0vc29Pc3NHVHM5dXU4eWd2YWgycWhJVXNFVVA2REFKN3JTeVJZWEFhYytD?=
 =?utf-8?B?K1Rzb0VEd1lhci9lL2h3OXlBTUovSzg0Qy9rb0NFK3dEUVVjYUIvcWh6QU4v?=
 =?utf-8?B?R09ac0VvbTNHcnZrUDNQcHNtUjZTd1dvc2RXK2NSckR3S1pTOExNQ1ZVVFNR?=
 =?utf-8?B?a3pjbzNxYlZIMktRK0N6a0p2WmcvQkhBUTNIT0JRRFdOL2ZpRjRsUjZhMXdl?=
 =?utf-8?B?ejlQL2ZVcUZ1OGF6aTdLVG1KREN4UkY0UjFXVjhhUkQzdFhibnhLNkxUVG5k?=
 =?utf-8?B?dWtaV1R6U0Job0F2UUdvcWluc0R4YjNSckRPbnRuNXVnK3k0SWhSWGpWMkJU?=
 =?utf-8?B?NXRpSS85b1Ivd0RxZHRaYWlTemkxV2V0ak1ER3A5YXpFeEhvdGo4RU5mZUI2?=
 =?utf-8?B?NTJybXRVYTQ5ckwzT0NRbE9kL0pIQ0dNWFcrMy96bjVyd21tNkJRL1pJQTlG?=
 =?utf-8?B?dDZLRjNlMjdCMlNDUDdpM0JITGlaVlRiZFBRSjBQUzF6dVV5elBML05zcGRZ?=
 =?utf-8?B?S3JLVE5maVFuL1dZWnNqSGxTOGtXU0lTVVVaRGt4SUxLL0hOdzAzaXJraWNn?=
 =?utf-8?B?VVZLeHZ3cmhWNWVMWmUrRzlncklEaU1sOTU4NUkrQWZYOHVNV2pIZ1I4WVJ1?=
 =?utf-8?B?SC91L3Z3cW5qMnB0RGJWSWxxK2RGRWxlOThhRkQzM1J5aGJ3OXZvWFI0SVhF?=
 =?utf-8?B?NDE2NHVtU3dDS0RPMzBBYlh6eUpyNlhlbE5WajBtUFdiMTVmYkRTTHowZnl5?=
 =?utf-8?B?YnhsdUQ3WlFxT1dIRUh5K2xvSlJVUGh5UnRPbURjUVBVS3BOSlZ1TFRpYko1?=
 =?utf-8?B?UkNGdzZlcHRNRDJ6cE5OdnRhUHFvZlFwSndocWlQbnIzZGp5cnhyY1oya21s?=
 =?utf-8?Q?uLLkyvhi92g=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cklzTVhvNGk3K1pkd2VwKzk4M3FabHkzMGUzTmR3Z2RVdUZodTZPbFFhOXMz?=
 =?utf-8?B?OURadFFFaTlEVllKNU5Pa0Y3bC9jQ2czRmJINkVicjc5WmV1U0VwYkRsVzkz?=
 =?utf-8?B?aTBNOWQ5dlJUUUFlQVRtOWlod215NXhrYjJVZkhhUS9SdVY5bEcrN2drZzFC?=
 =?utf-8?B?ZG50dHFyUHF1a29VRFhNOE1Ec3BWRTZJMWlMbXZSME5wS3lDckRuZjU2R2Zu?=
 =?utf-8?B?NElwZlBPclJzYWtkTnp4cVdBUUFzYWxlMWJyRno3djFrODg5Mi93WStvdWNj?=
 =?utf-8?B?WHlkNS8veEJTYjVZZWx3Y0szMm9YcE1xRlJMbHBjK3UxcmJxN0JpRWp0VXQ0?=
 =?utf-8?B?NVR0ZEJqNzdTanYzNjB2VjExT2Y0S3hQSlZ6TEVGMlhZSWcwRWNia3lqd1pj?=
 =?utf-8?B?LzVMR1ZQQ3BhYSs2ckN6RTZGbTNldnpxV3V1R2VZTzg0Q2ZibTdNa0lPdzRM?=
 =?utf-8?B?L1FUVEVJeUdTNlVuSk0xUU5uTjJGMEFXdlhITHE5QnRLV2J4WnJuZ2JldTRP?=
 =?utf-8?B?QURpMWExZjNsTE56bG1RRW90RmNTZWR6bTlTRmluampKbXh3NzFIVU1tTUdO?=
 =?utf-8?B?UFpLSUlWeTUzZ0p5MzNTZm9vTXNGVkw2eENVK0Vjcng5cThQN0dsREoxY29Q?=
 =?utf-8?B?bE5ZSHVXUjRlKzJBaU9ad2FSQUxwbytYQzVBNVljWHRDbkcvR0hIZ2M4R1hT?=
 =?utf-8?B?NmFxMkVtYThOdGc2MFdaYVZydWQ0SXYxaFQ0c2VEVGtLb251UUlTQmpZRnVz?=
 =?utf-8?B?RVpOR1E3bnNWUTJCR2ZtMFpZYktSaVF0YVp6ZmtBU0dBQVV2T1ZnL1ZHdFhw?=
 =?utf-8?B?blRtNjlOOVJGMTZjRGNKaXBRRDRtcEhMRHRQWi9nSXdmeGFjQjFmM1hrN2Yy?=
 =?utf-8?B?eUtlUmd3Qk5CWFAwRGFKWDltVkRnbDUva0R0bkk3TWh1cm1jaW5zUzRha3FP?=
 =?utf-8?B?UytkdFFLN2NCTTMrR0RWbU0vQzl5Z2lvQWY4d0pnbTFKejE2Y1dDcDFyZ2dX?=
 =?utf-8?B?MXREajZnQldZeEEzYXVqS2lTdXhVclFwc1g3SW5hdDJnWVhMUDg2dmN1dnZF?=
 =?utf-8?B?LzBhZWVWS1hKMldzb0hQcTVEZzNQcWE2aU5qSE94VmVmaGhwVVM5aTJNUU9O?=
 =?utf-8?B?dytJaGVTOXpsdFU0dkFFSHJiNWREVnJEbm81MUU4eUk5a0QwRVdraDZ6VlBV?=
 =?utf-8?B?STNZUU9IZ2RHYUpJUXJlQWZrRmo2QkpnbWF1TnJSMFA3ODFqMkwxMER2d3ls?=
 =?utf-8?B?RzB5dEM1eTlkQ0VJb0Q2bm5sWmt3YnN4ZCtwYVN2cXN6QkI4bVdhbVBLaW15?=
 =?utf-8?B?dHcvVFdNRkFHVXpXOVFvanZKNjR4TmxKS1NXZlpKaVdkSkV1akxQNVhXV0RS?=
 =?utf-8?B?MC9JOGh6ejU5UFpvZGYvcnMySHZ6TGFXS09PZWpLQmRoeWtMWDRqNVNkRmd0?=
 =?utf-8?B?cDNXNk92anRPdVhpK3ZEcVZ2c0ZvL1REd09yVkNIcCtUQS9BenFXNmM2MERi?=
 =?utf-8?B?N2FVRUErZmR3T214UzJkakJyNm5VRUJlbEVSeGhsa0tuQWdMOFRNYnBVWEZZ?=
 =?utf-8?B?ZUpQL3FlRW9RQXhIYkNIR3lISDBnZG1nN2REQ1ZBSFZuZHI2TjRtam5KN2FL?=
 =?utf-8?B?ak01elpRN2ZoVWN5NWMycTZKQ01iTEhzYXpDazA2djJCTERyaWptQTRpWmhJ?=
 =?utf-8?B?QkZKcUIxdUNrV0ZRaE9VTHdqT09uUnBJYXpMN0VMalhzcEVsQ051UmxWT1ZS?=
 =?utf-8?B?NHh5RlJFWXlmbXNFU1FTdmRrZjJXQVM1c1JYa1k1T2sxaTNsWnBnUFdsY2Q4?=
 =?utf-8?B?RXp1TkdkeUNjNjJ4QzQzQ2Rocmh0eTNwcFl3Ly9kb0d0WjdQRG9PbnJJTXZ5?=
 =?utf-8?B?MTgrK0hKRmcxMW5LWHBabVRPdnJWWXo5TzZxRS91WDlNMWFocEZwUW9YRkdu?=
 =?utf-8?B?WGlyQXQ4azNLZzhoMWIwdnhWTkI3aWJaVlFqTnBjdW9xWGhleW9zdWZOaTdt?=
 =?utf-8?B?ZVYzT3BxcGhweXRWeUtqTmg2RytId2NiUkU2THNlWWVEbTdyQ3hXZnhVWjJY?=
 =?utf-8?B?MXZMNXJNR0RBaE9FOU5kclVCT3FDdjR5SS9HUVllTFBmVkRpT1pKSy9EakEv?=
 =?utf-8?Q?kiI0=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24959e41-5079-44aa-540a-08dda4d6d56b
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 08:47:56.9187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lj2oHsgR8yoqH4wAXyooG1SJ96Q0vVz0ZAmATTGLCET8icmG8zFThHBHH+RcjNc0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7249



On 05/06/2025 21:47, Alejandro Vallejo wrote:
> In preparation for x86 to start using bootmodule instead of boot_module
> 
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


