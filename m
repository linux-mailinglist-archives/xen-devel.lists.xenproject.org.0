Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A66BCCC7B6
	for <lists+xen-devel@lfdr.de>; Thu, 18 Dec 2025 16:32:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1189827.1510534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWFzE-0006Ll-TH; Thu, 18 Dec 2025 15:32:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1189827.1510534; Thu, 18 Dec 2025 15:32:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWFzE-0006Ji-P0; Thu, 18 Dec 2025 15:32:16 +0000
Received: by outflank-mailman (input) for mailman id 1189827;
 Thu, 18 Dec 2025 15:32:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ars1=6Y=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vWFzD-0006Ja-Ty
 for xen-devel@lists.xenproject.org; Thu, 18 Dec 2025 15:32:15 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba7e6f72-dc26-11f0-b15b-2bf370ae4941;
 Thu, 18 Dec 2025 16:32:14 +0100 (CET)
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com (2603:10a6:208:c8::27)
 by PA1PR03MB11112.eurprd03.prod.outlook.com (2603:10a6:102:4f8::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 15:32:10 +0000
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae]) by AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae%6]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 15:32:10 +0000
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
X-Inumbo-ID: ba7e6f72-dc26-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w3G6Fh3mWgzsUL+iuZKmkaW+btnj0zJ34W7hhfIWImUYmt56Kk5vUzlAFZ/ejN8I7tW2WLfNcSd/K2suIIyyUlLTSNqJEIeYGdvCeuHodLFa/LjmZg8E1+cnSsKMug468N7YTSnLtd8kDNFWJP/gzvc9qi+/vYUQCJCVVRz+fYh6QzbRjlSYGK5Mc9UVK/u4f8/sak5f+e/TiGu5DnTfPOPV1sfe0hRZyCpwrBOva6A9uneJWWEYq9eFUQwJDYU6rHLXeFXdsMTJpsKD1esb5bXKXeKZF/cBtN5lpAnwg6a8tvTddNkVE5+hYsQZTmR2jldBx3t0keEi4O5d80RX7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HwiQrMJ0YMOGMTAKoMwurYyUSuy64Assjc3mpAtl4V0=;
 b=CqY5mdlE+Sg12LXIEvPtMkQOlL9HHwKcDRHw0Z0ZEqmYQ+oZgI0mntfBBL6Tcp0ANR1I5KqpkHaNFAobInCO1Yy6Gc+Et62Fn60IGpum3HLqzEftbLRI+tz6JNm+rB0wkBHVgkXHeYFFoe+SFSw5PiGwIsPSF+VlN2y4ccypy/rOm8/6KXTdYi6vcIyHJhFAGQT5YSMCdGoPbcMHOOJnaqrn8MdQe00sLgv1Jw0C+bZMN0SIDEHURUKbbLooVtl/IkePsWMTsssQOBNPWsONiuajB5zdjUser08J2VM8++V7XzNXNIxlEv6VZf6MiOHd8jQh8jf0bXgeBMdNuXb7Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HwiQrMJ0YMOGMTAKoMwurYyUSuy64Assjc3mpAtl4V0=;
 b=ovCdagV8OWizJzximjdiMjthh5AW0Sa2Pag5yI/qNjYpBUQhDWAnwPxB/H+Bgcwup/ggvtTgH7ksXeLpImHfK2YDEotjuUrtDJiThn0FAaqtgXqjRC6WBrt0Fml1y8gR8DaUMq6qt6zN946zsMUdnstXZSdy1fIamI1l7DQKSViUbiKSMDdJwT7zJNiwbW/KGfwBrlDzS2LGDPN4fAj3UQue67hgdkszLL6a6seusLoomIfkNGv5WnI6ut2Ga4Icl9JCOk3/UfN/GpLNkMjv6lH5BJ8EilhRBJHvV2HQikaZpdrArYwsgGslr16gzE9Zwkjlz4OMA/9CQwn9dZbTVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <26376311-33fb-42fd-a346-417b4faba55e@epam.com>
Date: Thu, 18 Dec 2025 17:32:09 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/hvm: vlapic: fix RO bits emulation in LVTx regs
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>
References: <20250930190550.1166875-1-grygorii_strashko@epam.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <20250930190550.1166875-1-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0012.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::27) To AM0PR03MB4594.eurprd03.prod.outlook.com
 (2603:10a6:208:c8::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR03MB4594:EE_|PA1PR03MB11112:EE_
X-MS-Office365-Filtering-Correlation-Id: 05e1aeb0-44a8-4b01-ef4c-08de3e4a9c58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y3RaZHVJWmRQL1VNSzg1MFpySG5mVzNheCtxSDZ0b0ZTMkFHRkhRazhOelBL?=
 =?utf-8?B?N2pVMDV3S1ZPL1JVaVVIV1hNS0t3Z1dNWms3Yk92TDBmaXJsQlBDWEVhcC9r?=
 =?utf-8?B?YU1CSG1JN0xpMmR3blovRWMzRG9mZjlBWXRzVm1GOVh1V0pnYk41dmt1bTFn?=
 =?utf-8?B?Vm1HdEN6cENIbUQxT2tLS0tsYXpBWFRselZKSHo0UzRIQkdNT0dEY3FCdmVL?=
 =?utf-8?B?Rm9yZzliN2Y3S0RIeHpvUFJqL05zWDd3TE53NEVwMnRzZmpjS2RqSWoyMlRH?=
 =?utf-8?B?R083SWpEZjdyYi81RGJmWm5vTUNZd1d4K3gzcVhBZmZ6eFVUVlp1anhwM3Z3?=
 =?utf-8?B?cElmbEcwaDBkYUszOGFBZ3NZdXpkWFltdHorbDlaVG9McCt6ZkZqUGpLRHlm?=
 =?utf-8?B?djcySDNVZncrcFM5dTNpbmJTeVFTUmZGUVhwZlV6dDZBUHgzRjBSRUVuaFpK?=
 =?utf-8?B?KzVxSmY3SXFzSXJoWlBRYUhCQXdOQmlWR1ZHNlZTNm1mS29pbDNPWmhtL3Q0?=
 =?utf-8?B?ZTZPWDJ0TzRsWkpGdzAvMXJHRmtEMnFEWFMzT1Q1SUdOK1kvalBYbVpvTVkv?=
 =?utf-8?B?WEtHbDdEM0dMSUwxY09ERXY5cmtzaE5saHVVUWJZY0VuTHpZYmI2c2NYOVMr?=
 =?utf-8?B?L0VQYU04QmdBcXFSRGRJSTZxeDIyOU5jd1ZQOEhxSENDajkrTFJHSXNJbkdN?=
 =?utf-8?B?NlJXTDVhWHNWUFc3YkxUK0hYeHpncVJOVS9HK1dmb29EYzBPU1B2WUxHelpl?=
 =?utf-8?B?VmFZalB0UVV1RXNVUlNuZmdLWUV1SkZEc0dJUitYYXRqZy95dXBuK0gwMEVs?=
 =?utf-8?B?M0U5Y2Q4T2FFUWF2V0JNancvRFF2S0U3MGRaeDR3MSsveGpoSXdibzNkTDJw?=
 =?utf-8?B?UVpySCsrbDlsZFRXK1FHamxOWnZ4WnZ4V294NGkyZGx0WjlHUDFTV1p3WFNi?=
 =?utf-8?B?K0doRmxzSEZLRnZjT1hSVHdmWjVhQW1JZ3BRcmNleW9vQk9IcHNXSkhMY0tI?=
 =?utf-8?B?eTIzbVpXMVdycVZlaUFXUmRuZ3VXMUN6ZXVpNkFpdyt5TlM4cjNGUDlQMkF3?=
 =?utf-8?B?bEE5TitjSnRzcnd5TnNPTkR1di82WFNkN1p6OUpQVjV5Wmh4SGtFY3czeXhM?=
 =?utf-8?B?ZGRpdmkyVG96amhZVG1CNnV0ODhHSW5RZ3d6RS9ING5EaUVlMVJyN3A5T3dM?=
 =?utf-8?B?emlQSXV4d1VZZFZOSW5PN0pFblhRZy8wUVpWUlpYdXJ0dG90cEtTOVFFeWd6?=
 =?utf-8?B?MmVwamd0cDVnL00wQVIvVisrdzV0Q2g4SXAwRFRsdVVnZmFWZERtTHpFTTRD?=
 =?utf-8?B?ay84Yk5xWGtNcmhQdUZSSnhXNmwvOWRlT1FNM29MZkV4YWhDakJhOVVCQ21q?=
 =?utf-8?B?Q2xoRUNRSWdpS1lnd2JwRzZGVWdXaWZYcUhzNVkxWndPVDcvd1hXNjZoTlBy?=
 =?utf-8?B?RG16UkRyQzhDZlZVeTgwNTIrQjhCLzVaempMV241NmFWSFgyUis3ZWUyZGZw?=
 =?utf-8?B?d2dIcW10TXJmUUpVTHZ5NmJsOHZMSUI4S2ZsZlptTm56RWFkVnZPRU4yQkFD?=
 =?utf-8?B?VzgyUW9NazEvYnZXQ2lySkFNV1FEMWttV1diRzM2ckplckxKSU1YOXRKdEVs?=
 =?utf-8?B?U2ExZnBaeVJYYmk3MWszYVdlMEtLWEV2ZXlJc29qTFBUODIvbTU2QmhQNjAy?=
 =?utf-8?B?UDhWKzlrSlZUZlQ2Q1NSUGZLK3g3b3lOK29qS1VSbDk2Zll3aEVEZ3VRd29H?=
 =?utf-8?B?cm92SDlCM3NxRloxQys4SGpMcSt3RWNTZjFTRHRMNHBiY3FSKzhud3VIcE5z?=
 =?utf-8?B?MHZiQ1dYT3Y5cE1yY05zbGFDdW00aW0xRFN6SFEycnZvbEFSclhVMXdObW9S?=
 =?utf-8?B?UTladHpJVDlveHd1eVY1SDJ4dzAxUUlqTjRPMFUvY0RhNFVSUWVMdzFDSXVU?=
 =?utf-8?B?SU9KZ2ZBT29CUDlWcCt2WjdtVFpzK094RUJyN2d3NDJIY0o3emhrNEZRc2ZL?=
 =?utf-8?B?QzZXOFpwNlpBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SS9lUksyT1RMOThuRXhQLzNLUUtvdWMyZVAwdXYvQmxGenhuNDNnWXhOQ0hw?=
 =?utf-8?B?V3BPcFh4VUJyV3NhcUhrMEhWVnd5MlA4QlNwSi92cE42cExlN2xvV3NCdm16?=
 =?utf-8?B?a2I2UDNpVy9qekwxMDN5ODZYODBGbTJOb1cxT0k2MXZUNTFSYTZWaEMzSytY?=
 =?utf-8?B?VzVkb0lsZHlLbkwzU3R4d2hqeVJ5VW9pSDBleDVUbnZyT2hraExRd0tsMlhZ?=
 =?utf-8?B?UlVqOFJuZzd5b3ByUjZnYWsvMzVrSDBVWlBvTUttK0pkNlp2Z3B0L2JyOTZk?=
 =?utf-8?B?aFVMenhOOUtLbnIzbXM3aHFGQXVEK2tFN3NXQ0ZYN1EzMVZkeklmbHJPZU9y?=
 =?utf-8?B?NUcvVTV2SG51eUxKOWlnbDFjQlYyeW85N0VnWVVNWWYrNkxxNWlZcTRmOFJI?=
 =?utf-8?B?cGFueUFmeXZab1RJZlNsd0U0WGhycVREdGxPOUJYSmxzWWVoRWZoNXY0cnZG?=
 =?utf-8?B?SjVqUjQ3ejRCQkkzM1dUVmxhTVpiSzlRN3hxeEk2UnhLQUlEbS8wYjE3blhC?=
 =?utf-8?B?aGpySVd2ZHR1ZysxRUxkOStUNkYxSHFQT1AwY25ZZi92ZzV4dklHTndRclRl?=
 =?utf-8?B?QVB0NTgrQUlNWGRHU3dDMzM3T091V1BPQ1JNVWFhZ1k1b3lJOW5pbm5ibEpE?=
 =?utf-8?B?OVhFZ3hCRXR6QnJIU05sb1puM3UwUHBMQjNabTVwRVU0Ny81ZzZRWm5Zci9t?=
 =?utf-8?B?d3VYWmt4QkgzYytzN2MzZXRGWVlIRzkrMkFUQmN4TTFHRjZLd2VKeGMzZzJw?=
 =?utf-8?B?dUlJcXpHdUl6N0xrNWhiQXZuanNJTjg1S3FWZUpMTXRMMkRraWZvc1VYZW9i?=
 =?utf-8?B?U2orMENNWFdxOVI4MFBJZDVRNFNCYTF4TUt2a2ljNSs1UW1sWHEwTlFwMGcr?=
 =?utf-8?B?NDNxRHdya2RDZ0FJeTU3bUpqR2hJUU5ROEtGSHc3YmhCbkNRZXhRNkdTQTJ4?=
 =?utf-8?B?dVQvNUM5andWM0hWend5ajRYdDlkWVkvdFhpamxoWWhSSkJXUEp0ZVBJbUJF?=
 =?utf-8?B?L2hLaFZQYWVjRnMyS3JlZVJGL3dER0psdVZWenJzTHVTMUt6RGZ1NW9oQmRJ?=
 =?utf-8?B?T2VLemdvYm8xbDBhR0VBUWxaYjhrN0FOTURqY2Z3UkJBTDZTK290VkFmZmxO?=
 =?utf-8?B?Y05MZjBzOVBUVkdtUUkyR3dlZDVNU0g5aEhqWEFvU0dlZ2pjc3I2TWZ3Rkdu?=
 =?utf-8?B?dXp6ME9PNzRGMWZ6VlErdUVqaFBjWVd3UDdxc1Y2WlFaZHdDUUpwZW1vZ1Vv?=
 =?utf-8?B?eEdBOWZBTjhreVJkQk9nSWVBYjBKTklwbENDVlVzN2ZLSUlIV2RLcjNsVXNR?=
 =?utf-8?B?Nk1sbnF3eFJUNFFFMUQ5UnAxUVdUdlhYbzlmNlBHNnk4czNpOXRFYytLb2tY?=
 =?utf-8?B?WGRuYUY5NW5IMmJiVGQwQTNnZ1BlK3kwMjdjMEMxU1E5V1ZZcFRwbHhGUlpW?=
 =?utf-8?B?bnVpcVN4eG0ybG1mSE9CWFlQMjkxV0JzSUc0SU44TFR1L3dyWEhlY2E0RGpx?=
 =?utf-8?B?cnNWQzNPcmNiUm5LMnhFSkRWVlpDMlJwd3VWK29iNU13MExFcG8yV1dGeGtG?=
 =?utf-8?B?SG1POWRjb0NLWUQrNmRHK1V5THg1UVZLOFlyRDk2VFpwdjMrbTh0bkZ3VDhq?=
 =?utf-8?B?djJYK0dabVdDR2kydHRQNUNreWg0T0x3c1YweTJvakxjMTNWMkRSUHZtaE92?=
 =?utf-8?B?NHYwK2ZmU29DR2sva1VWUktOQmdzT2ZsVkdvemE2U1dCQUpYYjRlN2FXV0gr?=
 =?utf-8?B?ZnI2WEhyclNRdmVZZWo2L1kvYzJMV3dqMWFlY1ZsL2JMbGxSbzVBTzIrR25k?=
 =?utf-8?B?Y2dJZnoyamN4cW8zT0hqbXdJVEtLbTVkRjZuMXF2Q0xJS3FvWkdlK2R4MDF1?=
 =?utf-8?B?ZUc3a25La3N2YU81QlFGODExdlFLYkNNK0lWVUozbGgxNUdEUGRyMUxEZ3Zj?=
 =?utf-8?B?L2xmZG1wRFJzMSt0c0xiSHBoSU01NGh5T2l4algwN0NHeTlrdndDTENLQTJ3?=
 =?utf-8?B?RnRuUStvQjV5emZQUzNacW1USnh0ZDlORDFjOGF1clI3ZHJQSU5pVmwrZXUy?=
 =?utf-8?B?QTc4dnpuZmxJTDEraU0zQ2JiWUlBSW9VR212NVBWVjM1QWtjdEdHUFVkaXMr?=
 =?utf-8?B?ZkZjbDlNcHRvS3ZRbXhtRnlJRDFxVHh0VzlKY1Y4S1hLdDhSZDVnUGVNWG9M?=
 =?utf-8?B?aGc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05e1aeb0-44a8-4b01-ef4c-08de3e4a9c58
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 15:32:10.6649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8NNSZCmkisPvSa4f5miHjlPYeCw3d8yZO7nTFtaXI2g/o+Kg9B8BiwVeMeFyqPvjKhBSW1Bj7O1IpWnVFsZI7PsTBH/7ATG9RBkO46V7pwI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR03MB11112

Hi Jan,

On 30.09.25 22:05, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> The LAPIC LVTx registers have two RO bits:
> - all: Delivery Status (DS) bit 12
> - LINT0/LINT1: Remote IRR Flag (RIR) bit 14.
> 
> The Delivery Status (DS) is not emulated by Xen - there is no IRQ msg bus,
> and the IRQ is:
> - or accepted at destination and appears as pending
>    (vLAPIC Interrupt Request Register (IRR))
> - or get rejected immediately.
> 
> The Remote IRR Flag (RIR) behavior emulation is not implemented for
> LINT0/LINT1 in Xen for now.
> 
> The current vLAPIC implementations allows guest to write to these RO bits.
> 
> The vLAPIC LVTx registers write happens in vlapic_reg_write() which expect
> to implement "Write ignore" access type for RO bits by applying masks from
> vlapic_lvt_mask[], but vlapic_lvt_mask[] contains incorrect masks which
> allows writing to RO fields.
> 
> Hence it is definitely wrong to allow guest to write to LVTx regs RO bits,
> fix it by fixing LVTx registers masks in vlapic_lvt_mask[].
> 
> In case of WRMSR (guest_wrmsr_x2apic()) access to LVTx registers, the SDM
> clearly defines access type for "Reserved" bits as RsvdZ (Non-zero writes
> to reserved bits should cause #GP exception), but contains no statements
> for RO bits except that they are not "Reserved". So, guest_wrmsr_x2apic()
> now uses different masks (than vlapic_reg_write()) for checking LVTx
> registers values for "Reserved" bit settings, which include RO bits and
> do not cause #GP exception.
> 
> Fixes: d1bd157fbc9b ("Big merge the HVM full-virtualisation abstractions.")
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> ---
> Changes in v2:
> - masks fixed in vlapic_lvt_mask[]
> - commit msg reworded
> 
> v1: https://patchwork.kernel.org/project/xen-devel/patch/20250925195558.519568-1-grygorii_strashko@epam.com/>   xen/arch/x86/hvm/vlapic.c | 14 ++++++++------
>   1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
> index 79697487ba90..2ecba8163f48 100644
> --- a/xen/arch/x86/hvm/vlapic.c
> +++ b/xen/arch/x86/hvm/vlapic.c
> @@ -44,15 +44,17 @@
>   static const unsigned int vlapic_lvt_mask[VLAPIC_LVT_NUM] =
>   {
>        /* LVTT */
> -     LVT_MASK | APIC_TIMER_MODE_MASK,
> +     (LVT_MASK | APIC_TIMER_MODE_MASK) & ~APIC_SEND_PENDING,
>        /* LVTTHMR */
> -     LVT_MASK | APIC_DM_MASK,
> +     (LVT_MASK | APIC_DM_MASK) & ~APIC_SEND_PENDING,
>        /* LVTPC */
> -     LVT_MASK | APIC_DM_MASK,
> -     /* LVT0-1 */
> -     LINT_MASK, LINT_MASK,
> +     (LVT_MASK | APIC_DM_MASK) & ~APIC_SEND_PENDING,
> +     /* LVT0 */
> +     LINT_MASK & ~(APIC_LVT_REMOTE_IRR | APIC_SEND_PENDING),
> +     /* LVT1 */
> +     LINT_MASK & ~(APIC_LVT_REMOTE_IRR | APIC_SEND_PENDING),
>        /* LVTERR */
> -     LVT_MASK
> +     LVT_MASK & ~APIC_SEND_PENDING,
>   };
>   
>   #define vlapic_lvtt_period(vlapic)                              \

I'd like to return back here and finally get this issue fixed (and make tests green again).

So could this simple fix be merged?

There is also follow up patch [1] which can be still a "follow up" patch or can be made prerequisite patch.

[XEN] x86: hvm: vlapic: rework WR/rsvdz masks for LVTx regs
[1] https://patchwork.kernel.org/project/xen-devel/patch/20251009114249.1964387-1-grygorii_strashko@epam.com/

-- 
Best regards,
-grygorii


