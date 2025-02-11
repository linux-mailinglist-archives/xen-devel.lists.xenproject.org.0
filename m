Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BEAA30AE4
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 12:58:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885473.1295284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thotP-0004L2-KF; Tue, 11 Feb 2025 11:57:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885473.1295284; Tue, 11 Feb 2025 11:57:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thotP-0004Iy-G3; Tue, 11 Feb 2025 11:57:31 +0000
Received: by outflank-mailman (input) for mailman id 885473;
 Tue, 11 Feb 2025 11:57:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WDw9=VC=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1thotN-0004Ir-1Y
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 11:57:29 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20600.outbound.protection.outlook.com
 [2a01:111:f403:2407::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c4dc743-e86f-11ef-a075-877d107080fb;
 Tue, 11 Feb 2025 12:57:26 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by IA1PR12MB6649.namprd12.prod.outlook.com (2603:10b6:208:3a2::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Tue, 11 Feb
 2025 11:57:23 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8422.010; Tue, 11 Feb 2025
 11:57:23 +0000
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
X-Inumbo-ID: 5c4dc743-e86f-11ef-a075-877d107080fb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pje75oF7oOIwcsxoaw//lsHv6sd9FGn3K2AA2PPyPN5j/pVqpfNEiUvWZMZc+UyLNzWA9H8NLiGbOzHp7xOzqeWp6zq7OPTa2N6wkKMo2lnRCmYnFX9nNcBSfIli6vY+wjdDfMGIVjBLZAlUIconx4ErVFhfPikXu4xOyIKL10X3xcWMroDbGkGDdHxjXNv6Ua7xO8lNaHBVNkZOl0Tz4A5/AqcIV70gDeX+PDKdzM0fsq3p1doljYDB3fVzB6+CjM8mNLyDL2RFYN3B67CCNvWGRXKN/7S+wU9kyQMIG+2eQVmHi1PFOpG2/3owg0a3zheI1UJJ6TKl0UfLWRUNgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fMrPWyRZ3wVAw21prAg2l7jZTD3l0RnkBu91+GreTYA=;
 b=uhIcEj/tVS5MO4c10+MRtSGfRtmtOP3PRTkr6Lws+MauAK9aKgsij/bm4KxDX9+tl6Qidb828KnmJ8BxMeZIl4qUZo0GZPiFa4FEV9EjHPabdv6D2nIQ+/TmA0FkOZedX1wpYop955gVfTvP+sVVtcjHAhbES1HxBpjjXUb5wTdfZaACYGzDOD+Fq0KGh/KmpusXJlK3oESCxlB25UXODhVbanCtLYU+pzRWDHxK0kw8BVWZbnrVp0l5HJ1Hbws7ctY9q4WQ36p0S3qJ997d95qfTIwTXOjxjvdT31OqRqCoJdT2kpWx5pWxMvxa2qdLRiTEo7Cl7LnNqvs81WxvdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fMrPWyRZ3wVAw21prAg2l7jZTD3l0RnkBu91+GreTYA=;
 b=r+oS0odA75K50htQ8cntovI1eB745mP1ea5Vohc1pZ9BdEPxX8UTf5tt6cJEXOZ0EMrAEoRjnfRcqIxNPIWeAxIHxdUnsmE/nHiEZj8Pu1lOVxIlXqj3+YDwQPo/wuDhIKUZme5omhVJt6fcEXpgHiLi0hzPS5nZgQ/8bihAt1w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <d5f00c3a-81a8-4221-acc2-de90fb92deee@amd.com>
Date: Tue, 11 Feb 2025 12:57:19 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] device-tree: optimize dt_device_for_passthrough()
To: Grygorii Strashko <gragst.linux@gmail.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>
References: <20250211111853.2199764-1-grygorii_strashko@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250211111853.2199764-1-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0315.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f6::11) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|IA1PR12MB6649:EE_
X-MS-Office365-Filtering-Correlation-Id: d168c2df-6cf0-4bde-77fe-08dd4a933ea5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MXB6UWMyRUVYRlI0Nm5YZWZZbWFNM3h4OVV5cmtPVFdvcjRud1RSMk10VzlV?=
 =?utf-8?B?SHVJMlAyK1gxLzRnTkpyT2hXeUhiRS9vWDVXckJnL2xNcWxURmFNNldpaWJL?=
 =?utf-8?B?MkVkTmhWc3RrUktHaHNyUis2NVRocUdYNStpVWxUMzFtK0hmdzdReEowdHV3?=
 =?utf-8?B?Q3FDajNHbmlqQWNnWmlna3dUT2NvSzdnbm1mV2FWWkhNdFVyNHIvZzNaVWpQ?=
 =?utf-8?B?MFkzbjZuNnA2Ymd4ZGJWS1FkM0RubnhIa09TZWlYaEt0Sk1QZEkvczRDT2tw?=
 =?utf-8?B?UGFHV3FtOEtVelNmbTdtN1dSb1Z4MjlMQ0RiZ1RDVzRNSWt4V3FiOHltSzdG?=
 =?utf-8?B?MkVsaUlZeE5oczhUMGpCSTNjL2xmUnFnTjRpeklCK3RRUURnelpYK3cxczZa?=
 =?utf-8?B?WnV4aWttL2FHVnpIVFMrc3VKUGRKbzJqT3pRSGd3NHV4elFBK3lxeHdRNUV0?=
 =?utf-8?B?bDZnODRGQ1Z2MTNua3d1eTNabGZJeVZ2dnZlZEJyYmVvWFNmc2NTcGNXSlNk?=
 =?utf-8?B?WHNaak5CektLRGFvdFRqck41akM4MGI0Q2RRT0U3UDBBWlJDWXl3VG05UDlB?=
 =?utf-8?B?Umo3bDcza3pHUWRBSEVsc0RDYStJUHFadk1FQTRKS3JOWFdNMG9lZExQNFZl?=
 =?utf-8?B?VXE0amo4MGVWb1pBOCt0TldUZVZzdGw2QVhKbFdrV3RtNFhTTk9OVU9qVU43?=
 =?utf-8?B?UFF2Z0tPMVNXODJxZFlOT1YwWU9yR0dLU2kzb3R3OCtpSUMxRTRkNm5ZL3Bq?=
 =?utf-8?B?NVlxVUFVNS9nNitwaFgwdzd5VjN1aENaV2ExNjRFMG5TMnhRV3VLVXZwcmdG?=
 =?utf-8?B?V2xDdWdMc2RPNDJQdGhQNFU0cnVDMDJBenl1UnRza2NTam84WXQ4dDV4cXNB?=
 =?utf-8?B?SVVhQ2NtYVNjNEF1QVBzQi9mSHJrRTRCTy9oaHR3VHphOHRLaUdrOHdCT0Vn?=
 =?utf-8?B?OFlDVkF3VjFxM1VLTUxCSUhtUFdRUHZlaUdFUUh6MHVlTjNiMHpuOG81VDlD?=
 =?utf-8?B?dlhMT0VlMzhIT000K0VpYStpUWxWVGVIenNYTm45RUxlWE81S25hRmRJSmZB?=
 =?utf-8?B?MVZwNzByOUszc2tWK1NQeDN6YnI4SWdrb0JkVUFQTUFOamh1MGNadlppQUlu?=
 =?utf-8?B?N3NPaStmZk5Wd1hsSHdPRWlDdUZuR011aUZwbTRHRElKa2Q1NzI2WXRpQW1K?=
 =?utf-8?B?MXk4b1QwaTNjTk5UMGVBRXNUL2pZWUtkcy9COGpRYXZkTFFONXVtUlQxSEwx?=
 =?utf-8?B?RmZVd2c5dzJtejFHV2xDOE5RMjVIZmV0ZUdZQVJzZURyMWVHZ1F0L0l0ZTcx?=
 =?utf-8?B?Z1NiVkxHNHFieUJ1L1EwQ2pXUGdtaXIrdVE3NElkRHcyZlIrc25MMHJIdXVD?=
 =?utf-8?B?V1NYVGlROWlUYjNSeStaZFFvQXhJTzljMzlUSWYvMFEvbjBocUkycE9qV0lH?=
 =?utf-8?B?N012ZE5ua1J0dnYrNGpjY0MrakNDY1A3dGxkVkNYdlhnL2lGS29Wc3BrbUJn?=
 =?utf-8?B?ZEovU2N6NkhvQjV5bzRsNS9XSlVQdDhaVW93aWs1eWh3ZFdRT0hOTUZmK3hi?=
 =?utf-8?B?bnUxQkNIZm1oVCs5Z0lLYnN3Q21SZWM2RncxWDZpMDRQcGdBanVoT1AzNFVO?=
 =?utf-8?B?Sm9NVlB5dkVETWZha1lkQkV6NXhvYkJSR1lrbEVmZXlNMFRtdENESmJyVk4r?=
 =?utf-8?B?Ym5hdnN4RjBwMloyakZxYlNYUWlGRGtYN3k3MkVFeWxCcXlBN2hDNEhDRTY2?=
 =?utf-8?B?dlVkdXdzM1NYcEtiZk5hYW1sRXp5VWd3SlVVM3RDQ3NQY042bzhXRnc4c2lh?=
 =?utf-8?B?RjBiMFBzZjBvM2EyNmtybmp2OHJ3UjlxQTJyTkFrdXlqU1p5NGdqME91aXBF?=
 =?utf-8?Q?DbYRO6d6gRIL7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bTN4VnBCcWhtNVM4SGVaUUY5aWxZSWdreHJoTUFsQVBSRFV2WHQ1Sm9lUGxR?=
 =?utf-8?B?NXMxMElQMUtpcVUrQkxuTXhUaGExbTFRa0VEVHlJTGI1b05JNjBxd2YxbzQ2?=
 =?utf-8?B?NHVwcVRCWWJxTHc5VTViajd0YzlvWHQ2L1Q4L0FpM1FoZHI1QmowLzdmNDla?=
 =?utf-8?B?cTBZUm8zN2Q2clM5WWlOekZSQzV6bkRvSTRIUUtDY2FvVmE0Ky9JNTNJR0hN?=
 =?utf-8?B?UkV1ZnRsaGhERjYzaXg3aEd1dUsxbGNYeHNzTm9kMUpzejBRc0Q4RVFWVGw3?=
 =?utf-8?B?cUlUMDIybVIwM2F1N1M2S0V0bDVzTTBOQzRrS2V6ZVljMHYyOEJHVHE1USto?=
 =?utf-8?B?QzVDNmxqY1RxZkgrbEpIdi82ZThmOW1IUG9FeEFQbVVka3NUWFlSY0pxVVo1?=
 =?utf-8?B?MDZMS0xNOFEwMEhHUUJrSExtM09vUjZyckdzTENRQlc2WUZvRGFLNDJ0U3hq?=
 =?utf-8?B?cm5ETTMwUWtnYkVhNmRYdDJSTVVIaXpjcFNYa0V1WWV6UU54bjdqNGVhN3A2?=
 =?utf-8?B?djZ2LytLSXVXcW9SNnFVSzNRczZYNG1lY0xzZFJMVUZIQk5teGRMVDluK0kv?=
 =?utf-8?B?T0JQaWQwV2lEZlRtdWx2KzVCNlNFR243TWVjaGxiMHpycmFQZ2FJSVhkUk5H?=
 =?utf-8?B?MXRPbHUrc0Y2eTlUYUJxUU4xOUNXRFlhNnp6a2NoTnpjWldxR1BkSFM1VnZH?=
 =?utf-8?B?Mit1RW1uQmlkelZQWW1SZEgvRFUvWE1lUE5SSkxEYXcxZDZaai9JcHUvUjdo?=
 =?utf-8?B?cnpZOHpmN0hjbzEvaTIyendhYWRWM0J3aUlGZER6eHo0dmdmazhHKzhzTlBX?=
 =?utf-8?B?c3BWZmk4Rk0rNER5aXMxSGVxdVVEVUZpeTE1VEFkaitPR1ZRNUJwYWFNN0po?=
 =?utf-8?B?OGROUSs5NjVYNjZEcWV6WVl3VjlIa2V1NVFNdkJxMGZYN1ZseFhZOXJzQlZp?=
 =?utf-8?B?a0tGMXJCazQyV2ZtNTJFOUc0M2Z6SkczRzlUSGp4QTdvWDZpTzl1bVdrUnBE?=
 =?utf-8?B?OGV0UUkzZ1I5VHlnR3pZTGJoRVg3R0pZdHhnTHF6RXFUZGwzY3RTUG5LUFg3?=
 =?utf-8?B?VkFIdzNyZTdsUXI0ditzVTZ3c2w4dWhnS0IrMHMrZExYQmxQUm0rdmxNZlN3?=
 =?utf-8?B?QUVCMjVRMXpPZk5KWUpTRDVmUXNoZ25Kc09QaW9NNTIwT2J4anJSK2ZTVFdE?=
 =?utf-8?B?UndaZWxTd3l0OWZYaFZreHpjTjhyU1hWQ3M0b3VQb2MwMGtqaTdYeFltWkcy?=
 =?utf-8?B?eWt2M3k2YnlLSHdJamdNOXJ5L2g0ZTB6VWRBbG5SYkx2NnJucGQ0Z3Nac29H?=
 =?utf-8?B?cVRqdW5NTnhvRzVMdjFiUHJWZFhLaUxpY2VQL2k2amRYcUpza0V5Ni9vaCt2?=
 =?utf-8?B?QklxdC9ZcXF6ek1tWGFLelVyZHFSVTdYR2ZkZS8xRmI2QWVYZ3VMOVVBb2xq?=
 =?utf-8?B?S2pSRWdVWTloUDlIZ0paKzVmQXdLUHBQZnkzMUlJcGpnNXdVN0h2TjFhUFNF?=
 =?utf-8?B?K1c1STRvRnpWR3FJVkxicG1aWmpMWUpDc0pVeUJHQ25tUUczVXRDSFlpcWZF?=
 =?utf-8?B?b29RS1BVUS9pVDFEQkp6R2IxTnQ0N05WR2cvU1FEY1d1Q3RzNlFJYzJtaWli?=
 =?utf-8?B?K0ZwZ3lYQnZRWnpNc2Zuaml5SmhJUS9CSUdnME1MWDB4eDhxY0hWWnZTQ0lJ?=
 =?utf-8?B?MXRJeHg1Y1dLM0lTK1dkcENDbDIwclkxUStQb3RMK0IrN0ljTEk4Y2pjMzgw?=
 =?utf-8?B?NXRpWXJRb1QzQ3l1QXN3TlY4eU1meEFzRW9XS1NyTjhZOXc2c3Q4UUtkWXJ6?=
 =?utf-8?B?aDVwL0JHTVl6TDF4OGtCSjlhUXRVOUdzRVprRVJWT0hzLzdwdVZWb0ZUSENM?=
 =?utf-8?B?eDlnM29UVGZ1TzNEMHhkRWVHVUxMTzJVclp1TTN6SlNPUC9hTk9lR29GQ3Q4?=
 =?utf-8?B?WExaUEJnOWhPNVAxVGtwcXFIZzFMMkh5cU04UUN0QmMrM2ZQQlpKYlZHS2s3?=
 =?utf-8?B?Q0kwZ1NnQUVYd3l2UWFMUlNVUXJSSVovUThyOTRNSndVWnJlSHhQYkFXZ0J4?=
 =?utf-8?B?R0VkOXJQUUJMUGFLNy9GUStzNUZWMlQrNXpTQlRkcEFJRzRiVEtHa0lYd3NW?=
 =?utf-8?Q?Sic4=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d168c2df-6cf0-4bde-77fe-08dd4a933ea5
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 11:57:23.0217
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QhlIuFNZIL+IpECiTQTd2+RpeqSt+DQPlNmh3u5KucfL8f/WSruGW0A6psK/y5ik
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6649



On 11/02/2025 12:18, Grygorii Strashko wrote:
> 
> 
> The dt_device_for_passthrough() is called many times during Xen
> initialization and Dom0 creation. On every call it traverses struct
> dt_device_node properties list and compares compares properties name with
double "compares"

> "xen,passthrough" which is runtime overhead. This can be optimized by
Are you sure? Looking at the calls, it's almost only used at boot except for dt
overlay.

> marking dt_device_node as passthrough while unflattening DT.
> 
> This patch introduced new struct dt_device_node property "is_passthrough"
> which is filled if "xen,passthrough" property is present while unflattening
> DT and dt_device_for_passthrough() just return it's value.
In the past we were skeptical about adding new fields to the dt_device_node
structure for use cases like this one. I would say this optimization is not
worth it. Also, why would you optimize dt_device_for_passthrough but not
e.g. dt_device_is_available.

You can check with other Arm maintainers.

~Michal

> 
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> ---
>  xen/common/device-tree/device-tree.c | 7 +++++--
>  xen/include/xen/device_tree.h        | 2 ++
>  2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/common/device-tree/device-tree.c b/xen/common/device-tree/device-tree.c
> index d0528c582565..a329aaf576da 100644
> --- a/xen/common/device-tree/device-tree.c
> +++ b/xen/common/device-tree/device-tree.c
> @@ -1682,8 +1682,7 @@ bool dt_device_is_available(const struct dt_device_node *device)
> 
>  bool dt_device_for_passthrough(const struct dt_device_node *device)
>  {
> -    return (dt_find_property(device, "xen,passthrough", NULL) != NULL);
> -
> +    return device->is_passthrough;
>  }
> 
>  static int __dt_parse_phandle_with_args(const struct dt_device_node *np,
> @@ -1913,6 +1912,7 @@ static unsigned long unflatten_dt_node(const void *fdt,
>          np->used_by = 0;
>          /* By default the device is not protected */
>          np->is_protected = false;
> +        np->is_passthrough = false;
>          INIT_LIST_HEAD(&np->domain_list);
> 
>          if ( new_format )
> @@ -2001,6 +2001,9 @@ static unsigned long unflatten_dt_node(const void *fdt,
>               * stuff */
>              if ( strcmp(pname, "ibm,phandle") == 0 )
>                  np->phandle = be32_to_cpup((__be32 *)*p);
> +
> +            if ( strcmp(pname, "xen,passthrough") == 0 )
> +                np->is_passthrough = true;
>              pp->name = pname;
>              pp->length = sz;
>              pp->value = (void *)*p;
> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
> index 5ff763bb80bb..96001d5b7843 100644
> --- a/xen/include/xen/device_tree.h
> +++ b/xen/include/xen/device_tree.h
> @@ -94,6 +94,8 @@ struct dt_device_node {
> 
>      /* IOMMU specific fields */
>      bool is_protected;
> +    /* Indicates DT device is for passthrough */
> +    bool is_passthrough;
> 
>  #ifdef CONFIG_STATIC_EVTCHN
>      /* HACK: Remove this if there is a need of space */
> --
> 2.34.1
> 


