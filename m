Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B75CCB99661
	for <lists+xen-devel@lfdr.de>; Wed, 24 Sep 2025 12:17:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1129265.1469296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1MYt-0007Pp-J3; Wed, 24 Sep 2025 10:17:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1129265.1469296; Wed, 24 Sep 2025 10:17:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1MYt-0007O9-FN; Wed, 24 Sep 2025 10:17:23 +0000
Received: by outflank-mailman (input) for mailman id 1129265;
 Wed, 24 Sep 2025 10:17:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uXxj=4D=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1v1MYr-0007O3-NB
 for xen-devel@lists.xenproject.org; Wed, 24 Sep 2025 10:17:21 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a797ec9d-992f-11f0-9d14-b5c5bf9af7f9;
 Wed, 24 Sep 2025 12:17:20 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by FRWPR03MB11125.eurprd03.prod.outlook.com (2603:10a6:d10:1a4::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 10:17:17 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 10:17:17 +0000
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
X-Inumbo-ID: a797ec9d-992f-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yuZy2FejwKYYkFobmrhLti8dx4dRKfxJI4mBQRXi0VxnnLY6VuxsrGwcCvCYImNjcAZ/hkelz4rzqEWl9gLNoKM8xKYIHzNZRWyrYQP1HKI44qmJxapmRfMd7Hu7WiibR6R12613elnNZ1dkYmV1i6fu9SFnhjRHMRHEi6wbexhDGKy+8e20uCI5YbvK/SxHETjQ2fZkXlPTKQPeQocc9BRyD4PCAkAEC2AvzI4QQ3zCb5qw98N5MC0nlCfllz5XJ//kPX5ihLibIbET6CEFtY6A+n1danOC0CxOSc9r+yUFbIriy25t6YkPEUEpB4vMiUQMvNq1rrfrpuu/QsAGrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7yUNZknybc/BOz4wBSL9nDmCm9z+DxWnWzRIYOEnah0=;
 b=EtLiiR1r4MPb7lqIJt0rShSPvLvlcd7ShoxcDcn7UhXFMxvTe1VOfH/0T6BhZaaSx3hKnGWFd4z6ceeskKhBb9kLWqXrUU03g6mtBS+h8tUFaYL+gKxftC1ibDjZZOzCB9MZELLBXZ4eLeNeOI8ExMVmpBHubkGsJISPu5HpR2yrzT+NiuZF7yRgiMttw3fDkheRr3nUK0KG4Pm8TDfzxJZlC09Cyk0vk3InQMqwW6MK8kD7w6ywumeCva+t1W6VaDRUXPe1hszHWaWH2ggiBOZ5sRGcrO4B3LA0I/0iqHHnTKXRxnOW5Q66zMmmXhNvjJ6uYLyw0cNHuyh1I5FI+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7yUNZknybc/BOz4wBSL9nDmCm9z+DxWnWzRIYOEnah0=;
 b=TaruePPWzsxsZwW8URLsTJ7XG8nYeGpRgf+tf5bGSmfj+8zvOt8s2ZgKRJcrOmCD4nHwHY5Cr4W0EuaITicaPD3PDKNTcB4nVnkoS8CvxcC2/fCADMaDTlH85RtxsGNDtSgmZhMVAWY52fhQB3+QIEZNiQ9d1fq3Vi0w7Iu4qqfHaLLb4IRHgw7yaOn42VgSjR/I1KQit8niRgxQuM8j7p7i7RKUzkKA2fCrX4Ykm+OY+z7RGlhMWTpLFIYCUDVzP4a5HTrxmWNzm3pGeG8KUj/ALjYWVTYhjX6nG3HGYGlQINvim42OypjZfZRlcVCXos+YbvUOXNwhZedwlCp7Yw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <8f6b8f08-ca62-467b-a6be-4d33208e5393@epam.com>
Date: Wed, 24 Sep 2025 13:17:15 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: domU suspend issue - freeze processes failed - Linux 6.16
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <aKiBJeqsYx_4Top5@mail-itl> <aKiBwEsogK420kwo@mail-itl>
 <05e9628d-83e5-4feb-881d-5854b72bd560@suse.com> <aKi6Foj-Lx_n0L6l@mail-itl>
 <aNEgTgis2JeyQ4HA@mail-itl>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <aNEgTgis2JeyQ4HA@mail-itl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0237.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e9::12) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|FRWPR03MB11125:EE_
X-MS-Office365-Filtering-Correlation-Id: cfd9f5f1-7a3d-4de7-9b0a-08ddfb5389dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eWZFN253eERUSmpOcktNejhXVDJMZldKK05pSEhZTnhmUkQ3aDlXQkJ5TG9s?=
 =?utf-8?B?cWNSZ2l5RUU5UHh6RE5rZkgvMWRITGFpV0R5NzBTWXVYUERYbDhzZVE0cEF6?=
 =?utf-8?B?QVcvblZkMCtlNUFPOUlzdG0rTkZxQUdZZnBHNFd0bEJ1THRUY3ZYdDVWTlp0?=
 =?utf-8?B?UlJTcGtKdUZWazA3TGdwcklVT0dOWEpqdjloYzdUSWtjZVFXMHUrbVl2aFpw?=
 =?utf-8?B?ZFJXaDU0b3dDOWZLSUZNbGhhL29oN1gxZGVlaXhOOTNWTUF4dlZvUmwzc1ph?=
 =?utf-8?B?OWxLWE1lLzlNeDJuMEVQbGtSWWlSRk9Ca2llWDlxYUFjUFp5NU0vZU8ybHgy?=
 =?utf-8?B?bEVCYmMwTTN4dUtaSXBKSTRDRElydXVwTzRpMG1aU295QlBDWTN4V1Y0Ri94?=
 =?utf-8?B?NktqblhTQThNTUh3RU5xUUFmRjh0N1lqeFIyenl1VmhqSnB4LzJMajluZE4x?=
 =?utf-8?B?U2xUVDlJbW1rQkpiUXBpVkJXajNodmZIdU5hcVRIVm95ZFU3aGZGcVMvSGxz?=
 =?utf-8?B?eERWRXpBaitSVkRXZDlPb2FBMmhoTC9ZVzJ2SURnMmdFNWdMNGhFWWwxbnRH?=
 =?utf-8?B?b3luMXc5NWlKTVF0Ump2cDFLcjZjcVNZQzQ0Ri9mbVFjTUNJTDZkdGwrUnBB?=
 =?utf-8?B?Um9qOU1kblgzSXNsZ1VpVUhoWTR5K3ZlZjVNUkt4MStJYTkvQmh2V3JzWGFW?=
 =?utf-8?B?ME0wOHk1bStTTkJlWGZxcWpabGZBQ1Q1alFCZVpSNmd4VnVtUERDMGd5V0hr?=
 =?utf-8?B?Y003Znp2Zk9vWm11UUVKVDRJbFVtWWpvSkJvWHJUWENIZmdkekFHOW5jU2N5?=
 =?utf-8?B?dDh6ZnZ1QzJFS01tdlV0L3dCMGVQTTY5cURMVUpoSk55TC9jVWx1ZEZGdUxG?=
 =?utf-8?B?MjZxK2NsaGZGTkdTL1VWeXFteXVvS2tzNFhjT3M0Kyt0WlAxWlFmbU8vdzhC?=
 =?utf-8?B?VnlQbVEzdXhMa21JckNTWHU0V1F1eVJJZC9DZURsL3gxd1VoR1JlcFEvZ0lo?=
 =?utf-8?B?eTZVWjYySkNUWVVDNTl4dkdQK2FMUVRCNGdKalk0U2NmVS9aVjltNkJVY2N4?=
 =?utf-8?B?RHFMMGZLZ1JlSFV6Ym16clAvdW1RSmtFZGpiZjg3anRYSXNBd1VIQUFtL2ZS?=
 =?utf-8?B?MFdNelN4b29DRjBDZFp3bE1yTUtWd1FHRGJQTXVqN0dOMCtvNE02c0ZIRHlk?=
 =?utf-8?B?eGhUZE52ZkpPSFZJMTN3RmNSQytpRW5QczVZcDNhTHdZL00yd1ZNR21DMkNN?=
 =?utf-8?B?bk9VZkFwdmlWUjdTSnRTTC9ZR2VuaDkxc0dWMC9SQlRMOGE2TitGYnI3RVhv?=
 =?utf-8?B?c3N2Yk9tVWZ3dW9tL3hHMnBCWGtKUmVHWEc5ZDNQNWl1YXJFUVhkOUMxZEV3?=
 =?utf-8?B?anNKbmVWSjNhL1hYaXdlNDVkSVQ4RlFBcXMxdFNYUmFOaEVzSXozMFphcmZL?=
 =?utf-8?B?WU82b3I0MW5EaWplb3FEeTVUd0dZeklSRnA0WlM0aE5kZ21xZ09CY0xJcXJs?=
 =?utf-8?B?OHptUHd3YWdzNFNpanFuVFNBN29vWVZ5OXFJWkFwekZYVWMzV0h4UzV4enBq?=
 =?utf-8?B?TmdvVW45ZE1CbzJiRDQxcEdLVDRxYlNqUUN1NENoMkFpeGVmY3E2T2tsN1lz?=
 =?utf-8?B?dkFYbm53OWNsc0xxQnFVSGttdTY3dmJqemNFMkprQ0VPek5mbVFXZ2NlUEc5?=
 =?utf-8?B?RndXY0ZpbnhNRXhPR3BYOXpTNlU1S3ZkeXB0RndyZDZqOFpvQXRha2huS0Y5?=
 =?utf-8?B?SWxkVCtMVVhTWEZ2S1laSmU5dUpFQ0FtbTdKVVd3Ymd3NjZxMnU1RzhMRlB1?=
 =?utf-8?B?YldhYlhRRWRCVUZsWHJ1UTBoTVBMOUFwbkY3T3lNUUNGYy9WUm5vZUkvNkg0?=
 =?utf-8?B?ZU52WXNodW1uS1FySkhlV1lHcVBGUUQ5NTZTMnY0by9OQk14K2V5blRTKzNl?=
 =?utf-8?Q?+suTgYPVPn8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eHFWZzBDSGUwa1JYV256TXNJL3pLeXRFZnNzaEYvT1VacWxFVEE4MUlTcW04?=
 =?utf-8?B?eTdpN1BiTjljZEF5SUFOdmJzdmh3cW0zcE4rS3RkaEJpUmhZbm14eXpiMkRt?=
 =?utf-8?B?MGt4TytxbFFqYVRYLzVwY09obERQQ1FwUnVWMUx0RFRLSWxGMjI4MlowSWpK?=
 =?utf-8?B?ZENBSFBBaVB1citBd2xOc1BSUzNJVFVPWkRGeXFqdGVqU0NnMUhQOVI0VzJD?=
 =?utf-8?B?VE13aE5vaHdBUWNzeUorRlVYNGxOVyt2ck5GMHozUjZDSy9wM3l5MzJVbyt6?=
 =?utf-8?B?eUlRd2t5c1VPSTdxMlkrSjZVUTRlWGMySW1OaW5ScDU4QkRGUHkrNlE5VlNU?=
 =?utf-8?B?TDhFS1JpaGdYaktuU3dQR1dpZTZieTFyT2Y1TW1kZit4VjVEeE9UbkJVWWs5?=
 =?utf-8?B?US9IVWtML0JzekYvVkhpRFkwQ01HWVN4TVR2bTN4QTBtUmZoTjFPTElLOUc2?=
 =?utf-8?B?SlJvUkRCMm8vQm13c0E3aEp2bjUvQ2F0OFA0WEpJLzl1dUJzOXNhUHY3NWU1?=
 =?utf-8?B?UUhXdVZJL2VQempKRUh1eXNNMDVaamMrdk9GRkRDSGVqRDhXMytFZTRRa2lD?=
 =?utf-8?B?MzRvVXVPUUdOQ3VzME5WRkNuY21qbktyZTlia0tDUTNnVWt4Q21RVUZlWm1C?=
 =?utf-8?B?QWpHcC9iMTNJVTFaWEluTGg4cGtyR0xHditRQVg1d1JDSmJCQU40elZoZnZH?=
 =?utf-8?B?cXQxQzViNG5IdC9xNXhBLzdqMjBGY3VadXg5WlB4VXhnUnhpVUE1MUFpWDZG?=
 =?utf-8?B?OEFPRHppcDlmWXJNWjVUakRwM1AwU2hkM0JLK2IvRXRwRGhpckc4UnkraWMv?=
 =?utf-8?B?ekZFdUNoQVM5TStmUDF0cExxcjZ5Q0NmUDVOZU1TQlhaV0RqQnlvdGhEcE13?=
 =?utf-8?B?QWo2SFdlQ05oVzBoS2ZjcGVpQzhuY25VTDZ1K1NMbldtR3ZaK09obCsyL2x3?=
 =?utf-8?B?SGc4RFBtSFhzT2c4YUVsMElPKzFqRWRHbnZuMkg1U05jMFloQlBjd1grQ05S?=
 =?utf-8?B?ekQrR1NNKzF1b2tYbnJoZDBRWUk3aW52VExodHF2YmFOSi9EVk5zZGpBUEYv?=
 =?utf-8?B?QUpicktYdEdGQWhJUGNYSmw1Y3ZpWXNEbnp6ckd3cWhRWGZ0aXB0N2cwUHlU?=
 =?utf-8?B?VTJnVjA5YjJVWUZROG12SW5takVqM0szZ1JaRTJOOW56aVVQY09Sc1NaMWdJ?=
 =?utf-8?B?VGVKZEVXQWdaVEdpZTR4OTNxV1pRRk1IZE9EWjBHampFazNORk5hNjdTSEhT?=
 =?utf-8?B?N1lYOFRYNUtwT0ZyTkxxVFhQaEI4MkszQmZ1a2JlTlYrZXJlKzF3eHAxKy96?=
 =?utf-8?B?ck1xZW94K3VTTS9mR05nMjkrWk5ubnFwMEl1ZSsvaC9oSkZQVmdiQ244YzE0?=
 =?utf-8?B?UGE2OTVFbk50TlhJMDI4UVhMaldHT3VrU28wVHZIYkorOHpZZFpYTVRETFI4?=
 =?utf-8?B?MmpyL2NnMmh3a2YwUytVNFNmeHFXNTZLUmpCbDZKenJqUHJSSEpSZzlONFFQ?=
 =?utf-8?B?dDNRU3VndXQvb2hoK2tDRFpDRXM3bnlnZlZJTlFTUTVwTUNOVkJ2TTRGeDM5?=
 =?utf-8?B?MXhpd2JSbHY4V0FzWDdxbnY0cnNGYTY4a2N5aHJIUmZzS2E2STdpUmFmVjVp?=
 =?utf-8?B?ekdPbXVWMkN5WjF0RUhvSzVudWVQMVYvVEFiUE54Z2ZKOUVzdmNHMEdnMml3?=
 =?utf-8?B?VlRMQ2ptUHFncHgzWmpERGxMNi81MGIzRUlnd01oaEh0YUxJY1J0T0pXYUZB?=
 =?utf-8?B?bXNLZXlzT04ybksxd00zcThOeTdVN2ZlTWJLSFNBT1ROL1pVRnFoeHRTN25s?=
 =?utf-8?B?R1VJcDk3YTl4RTZYQmRhdnpYM0JmZndncVdJWVYyZWJxNnRWTTc4cUF6MmMz?=
 =?utf-8?B?N1RDMUZzNW91R012ZXNKVDdXNi84TkFsdHFDRk81SVI3Nk9nQW1XVGZsL2pP?=
 =?utf-8?B?bTE0MzlWZHhTL29CT0JhSGp1Y3AvKzl3SmFCVDdXNUxaMW82L1hTQ3FsREpn?=
 =?utf-8?B?UzBiRVZZWnJuc1M0Ymg1TzhLVTFvem1FKzZDT1VFVkM2aEtDZjZjTlhHcW1H?=
 =?utf-8?B?eFZhVTRqOFNHQUJleHpRT2JUTjFxaVZjN1c1VzFHS3lrN0VXenNQVC9HUDhN?=
 =?utf-8?B?Nlc1ZlQzUXdrSVgwQ1FPT2s0YUN1YzEyOUJlYm85ZlVrS0g2L0VGN0Z4dzFQ?=
 =?utf-8?B?N3c9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfd9f5f1-7a3d-4de7-9b0a-08ddfb5389dd
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 10:17:17.3485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y2clFY4uTsbvWumjHEUBxjIGDVdeD0t/2JHbIOc1ZzPlophC4vIuABCO1ENaP0VmffGbnbvdYvXPewazTBlS7ZPk+vmcg46bA1/SMEWTpLI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR03MB11125



On 22.09.25 13:09, Marek Marczykowski-Górecki wrote:
> On Fri, Aug 22, 2025 at 08:42:30PM +0200, Marek Marczykowski-Górecki wrote:
>> On Fri, Aug 22, 2025 at 05:27:20PM +0200, Jürgen Groß wrote:
>>> On 22.08.25 16:42, Marek Marczykowski-Górecki wrote:
>>>> On Fri, Aug 22, 2025 at 04:39:33PM +0200, Marek Marczykowski-Górecki wrote:
>>>>> Hi,
>>>>>
>>>>> When suspending domU I get the following issue:
>>>>>
>>>>>       Freezing user space processes
>>>>>       Freezing user space processes failed after 20.004 seconds (1 tasks refusing to freeze, wq_busy=0):
>>>>>       task:xl              state:D stack:0     pid:466   tgid:466   ppid:1      task_flags:0x400040 flags:0x00004006
>>>>>       Call Trace:
>>>>>        <TASK>
>>>>>        __schedule+0x2f3/0x780
>>>>>        schedule+0x27/0x80
>>>>>        schedule_preempt_disabled+0x15/0x30
>>>>>        __mutex_lock.constprop.0+0x49f/0x880
>>>>>        unregister_xenbus_watch+0x216/0x230
>>>>>        xenbus_write_watch+0xb9/0x220
>>>>>        xenbus_file_write+0x131/0x1b0
>>>>>        vfs_writev+0x26c/0x3d0
>>>>>        ? do_writev+0xeb/0x110
>>>>>        do_writev+0xeb/0x110
>>>>>        do_syscall_64+0x84/0x2c0
>>>>>        ? do_syscall_64+0x200/0x2c0
>>>>>        ? generic_handle_irq+0x3f/0x60
>>>>>        ? syscall_exit_work+0x108/0x140
>>>>>        ? do_syscall_64+0x200/0x2c0
>>>>>        ? __irq_exit_rcu+0x4c/0xe0
>>>>>        entry_SYSCALL_64_after_hwframe+0x76/0x7e
>>>>>       RIP: 0033:0x79b618138642
>>>>>       RSP: 002b:00007fff9a192fc8 EFLAGS: 00000246 ORIG_RAX: 0000000000000014
>>>>>       RAX: ffffffffffffffda RBX: 00000000024fd490 RCX: 000079b618138642
>>>>>       RDX: 0000000000000003 RSI: 00007fff9a193120 RDI: 0000000000000014
>>>>>       RBP: 00007fff9a193000 R08: 0000000000000000 R09: 0000000000000000
>>>>>       R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000014
>>>>>       R13: 00007fff9a193120 R14: 0000000000000003 R15: 0000000000000000
>>>>>        </TASK>
>>>>>       OOM killer enabled.
>>>>>       Restarting tasks: Starting
>>>>>       Restarting tasks: Done
>>>>>       xen:manage: do_suspend: freeze processes failed -16
>>>>>
>>>>> The process in question is `xl devd` daemon. It's a domU serving a
>>>>> xenvif backend.
>>>>>
>>>>> I noticed it on 6.16.1, but looking at earlier test logs I see it with
>>>>> 6.16-rc6 already (but interestingly, not 6.16-rc2 yet? feels weird given
>>>>> seemingly no relevant changes between rc2 and rc6).
>>>>
>>>> I forgot to include link for (a little) more details:
>>>> https://github.com/QubesOS/qubes-linux-kernel/pull/1157
>>>>
>>>> Especially, there is another call trace with panic_on_warn enabled -
>>>> slightly different, but looks related.
>>>>
>>>
>>> I'm pretty sure the PV variant for suspending is just wrong: it is calling
>>> dpm_suspend_start() from do_suspend() without taking the required
>>> system_transition_mutex, resulting in the WARN() in pm_restrict_gfp_mask().
>>>
>>> It might be as easy as just adding the mutex() call to do_suspend(), but I'm
>>> really not sure that will be a proper fix.
>>
>> Hm, this might explain the second call trace, but not the freeze failure
>> quoted here above, I think?
> 
> While the patch I sent appears to fix this particular issue, it made me
> wonder: is there any fundamental reason why do_suspend() is not using
> pm_suspend() and register Xen-specific actions via platform_suspend_ops
> (and maybe syscore_ops)? From a brief look at the code, it should
> theoretically be possible, and should avoid issues like this.
> 
> I tried to do a quick&dirty attempt at that[1], and it failed (panic). I
> surely made several mistakes there (and also left a ton of todo
> comments). But before spending any more time at that, I'd like to ask
> if this is a viable option at all.

I think it might, but be careful with this, because there are two "System Low power" paths in Linux
1) Suspend2RAM and Co
2) Hybernation

While "Suspend2RAM and Co" path is relatively straight forward and expected to be always
started through pm_suspend(). In general, it's expected to happen
  - from sysfs (User space)
  - from autosuspend (wakelocks).

the "hibernation" path is more complicated:(
- Genuine Linux hybernation hibernate()/hibernate_quiet_exec()

I'm not sure what path Xen originally implemented :( It seems like "suspend2RAM",
but, at the same time "hybernation" specific staff is used, like PMSG_FREEZE/PMSG_THAW/PMSG_RESTORE.
As result, Linux suspend/hybernation code moves forward while Xen stays behind and unsync.

So it sounds reasonable to avoid custom implementation, but may be not easy :(

Suspending Xen features can be split between suspend stages, but
not sure if platform_suspend_ops can be used.

Generic suspend stages list
- freeze
- prepare
- suspend
- suspend_late
- suspend_noirq (SPIs disabled, except wakeups)
   [most of Xen specific staff has to be suspended at this point]
- disable_secondary_cpus
- arch disable IRQ (from this point no IRQs allowed, no timers, no scheduling)
- syscore_suspend
   [rest here]
- platform->enter() (suspended)

You can't just overwrite platform_suspend_ops, because ARM64 is expected to enter
suspend through PSCI FW interface:
drivers/firmware/psci/psci.c
  static const struct platform_suspend_ops psci_suspend_ops = {

As an option, some Xen components could be converted to use syscore_ops (but not xenstore),
and some might need to use DD(dev_pm_ops).

> 
> [1] https://github.com/marmarek/linux/commit/47cfdb991c85566c9c333570511e67bf477a5da6

-- 
Best regards,
-grygorii


