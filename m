Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B77AD026F
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 14:44:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008500.1387781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNWQD-00041D-AH; Fri, 06 Jun 2025 12:43:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008500.1387781; Fri, 06 Jun 2025 12:43:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNWQD-0003yu-7V; Fri, 06 Jun 2025 12:43:45 +0000
Received: by outflank-mailman (input) for mailman id 1008500;
 Fri, 06 Jun 2025 12:43:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=La23=YV=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1uNWQB-0003yo-FU
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 12:43:43 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20628.outbound.protection.outlook.com
 [2a01:111:f403:2412::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dfa4c857-42d3-11f0-b894-0df219b8e170;
 Fri, 06 Jun 2025 14:43:40 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by SA3PR12MB9130.namprd12.prod.outlook.com (2603:10b6:806:37f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Fri, 6 Jun
 2025 12:43:36 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%2]) with mapi id 15.20.8792.035; Fri, 6 Jun 2025
 12:43:36 +0000
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
X-Inumbo-ID: dfa4c857-42d3-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Btvxw47Pm4qB/W6gM+nsOGl32mLWbhpu1H6AKzoel2oKfFsoyHND9Rq1Vxj8fnlb5yCbAOzdd92qwKlKbx0LLxcKoYCzBVB27CtNqKZhz45x93na8cLhIVXPHjkdn3u3A0SZ/xWywcfoPsH1kNL+d7/40NkYm3NAMQOufnnukCplouRwplHP9uflurrkQzkTidMFkU+NQ7XrHPqMwLdjUePnqpH+UoBw8SDOzMHXx1cVhkgZ1ZQn9TRBX0x87jBfsKg+TTVz9CWxft6KVnzxXkldAQAUHgxrNW0E4KIqWZyns+L8n3zyHy4bdGPXxdUKwqewr0fm/Kzfpx4QsYDWtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0FXMRtkayhpDdmr07UxFIaSnVNcobeRmDbPAwfEKrCU=;
 b=swwpeMQBiGWPmgdaeK15jkd5AFmgQDqMNRXj7ashAgEaAGxM5RQP+a8a2pAkULsft8eF0hkzkTtYFKH2Imnc+eLQ4m6+ZSJr/g/0U7CAwY720HKR5W1YAgdDQQ6jVOZCAsmpOLA8xmqG1LRu8j8GDq0AYCZyN+iRnkDFPRx1gdahnN13w1jI3gQrCzCfqxcswoWPiRiQ8iBkOvZJdobdshhyMffVwe5RytoECl5OkZBCGhBzr4zIU/7LwNVU/ICcgVBP95HYDRF7IgsJNuklSJj/IyuPOsh29I/TUBvLSdJEuZdHx4acc9PUhAm5/7+TqAOjjxMtjMUhx4IxZvVyxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0FXMRtkayhpDdmr07UxFIaSnVNcobeRmDbPAwfEKrCU=;
 b=DnUEUFNR5rxEKqBSPuoM2e/EJ9ORe6rwuImYmTVWISuL1B9/qyeMDyMmffewSup0DOG8jiL81lgVaIudHGXksDacmwd5WVZuEVlY9YntnAT/AehxHifZX3X+vQcWykK6LL9c3UccqiqgovquymUBxT5OfgiawjW2Rm0xtP2usrk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <253dc1cc-b6b7-4cdc-a0e1-9fbd6be4efa0@amd.com>
Date: Fri, 6 Jun 2025 13:43:32 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] arm/mpu: Introduce MPU memory region map structure
Content-Language: en-GB
To: "Orzel, Michal" <michal.orzel@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250604174311.754899-1-ayan.kumar.halder@amd.com>
 <20250604174311.754899-2-ayan.kumar.halder@amd.com>
 <a2f337f2-1f34-41f1-9728-5f87ef2c7420@amd.com>
 <bb3ce203-de59-41b7-ad7d-3b1f3f1c9833@amd.com>
 <dc8b0afb-aa0a-4ee5-93ef-ca6fa632b616@amd.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <dc8b0afb-aa0a-4ee5-93ef-ca6fa632b616@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0230.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::19) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|SA3PR12MB9130:EE_
X-MS-Office365-Filtering-Correlation-Id: eae483c6-b1f5-442e-6667-08dda4f7c137
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZHY3a3VjdktaNlgzZVYreEg1d3RvU1lxQnVRK1UwNElFMzlvK05LWSthbzJI?=
 =?utf-8?B?MXVMV2xGcXovYUE1SCsvOHVyY3pVS0poN0Raa1JmaHhMMUhIS1JGeG5xRXdP?=
 =?utf-8?B?NHk1ZC92WWc3WXJkM3BIUzRTZzluV3BnS3BVVzNlbjRScG0rZTJyblVldWk3?=
 =?utf-8?B?RVlEUGhkUDVVaURTZWpNOUtnSnc0RHJPaEh5MDlHK1ZOTFk5OG5ydVliajVH?=
 =?utf-8?B?bnE5clptZWFNU3Z4U1Jwa3REcmlmZEgzNU9MOFFSYzFXZG9BZE9VQ3NJQkFX?=
 =?utf-8?B?Q2RFNVF3MTlQckNtQnZER1V5Z3ZFTTFUMi9DTGlzOUI0SHoyUE1YMk9PQktX?=
 =?utf-8?B?dFE4Y0Yya05xNCt4QnJCdHc3YlVyNHhKVVQ0eExLcktXaGdZVWVrQklVV1dp?=
 =?utf-8?B?bkw1emQ4cFAvOUVTcEFidjFzQWs1L1BUUU9vUVlnODNDRjUyTWtaQUw2akFX?=
 =?utf-8?B?bDgxTHZ2YlJHSzJIdmV5ZTB6cC9SZmVIaEl5OWZQL1VVNVN1b3JoY1h3Q1Br?=
 =?utf-8?B?bTE1QUFjSUxocXhBLzhJNFVyQUVQRzFMbHN1Zmp5UjRmTWE2Q3JBeWxRdFBL?=
 =?utf-8?B?ejNjWWRkOXFacnpkdlQ4RDZrcjFNSHdkMW0xQUd2Nm5xWklZZ1JZa2dXeVhZ?=
 =?utf-8?B?NWlZd3J4VzF5aG96MmxsaTlUbDg0SmNxdDNNYXVxQXdXeUFVbzZvSFZFK2xi?=
 =?utf-8?B?UFBSekNxMXpESy9USVVZSVZWcVBuSWgxODJLb3QrNDZrdzNTWElQYUp0K3Zk?=
 =?utf-8?B?b3BBRE15dWpZOFRGcUwvVUo2TVB4TUNFMUdFeE1JNit2R0JjN2liazZJcFlH?=
 =?utf-8?B?UlZGSjlVanczNG5nMGd2VitwN1dQS2ZTN2I5dWhESUEyVEVwWnZnMHNlSjdD?=
 =?utf-8?B?YW5yemJwbUtVOVpnaWJwQ2E2bnNpNmZ6S3NoTnRhZ0QzVytSaTIweXE1YUhT?=
 =?utf-8?B?NW5qcEZwNDVvUUIrMHNETUhSRy9NTkY0M3gwWS9XaWUvUUFiNG9OeDcyelpu?=
 =?utf-8?B?cnlTNWd2bi82c001bGlyUEZkeWx1Q3l6N1BGejFuQjhUMVVGTUhkeTZ1ZlJX?=
 =?utf-8?B?UHRWTjBDa2R0Ym9weSszaks0a3VqL0VqTTFnNVdyVlpZZ254cER5TUU1amk4?=
 =?utf-8?B?VzR5TU8xc2o2M1lIcGozZlIrRDE1elg0RmUzNzN4SE1rc3JVVW5BcGIyaVd2?=
 =?utf-8?B?WWNIR0NGeVVmenB2NXluQlpuVkQ0ZUNva3lyaUhTdXZwQy9EajVlTzE3UGFU?=
 =?utf-8?B?dGFkV1lsUUVPT3B0dzBNNXJHZmJ1eGhMaHVDbHM1cFZYTVFWSWxlUE4xWStK?=
 =?utf-8?B?WktrbytROWx3aFl3ZEhrT1l6UmhoaEhxMGkxRTIyeXNqYUhkVU81UENMYmVO?=
 =?utf-8?B?eHdiZlJtSzI1SVQvOUI5L05kSDRUS1phR3JMME96WHBqOFJzb3JsbTdiZ0Js?=
 =?utf-8?B?RjVEY0JvcW1UVk12MFFYNFIxUkxESVV5N2ViV1RCYmNOOFIyVTJFME44TkY2?=
 =?utf-8?B?YjNGWXFQZGxoK0piUU5vN0lNVURKb3BTdS92U2dJMjVhcHJ0VjlkUWtvRCtx?=
 =?utf-8?B?aXdoWmYrZm1jdmUxSjYyc0NiWXpwdXNqZ3lwdFROcm1lczVVaklSWGgxdC85?=
 =?utf-8?B?SDJ1TnIzNGJINENIWEY0MENLb0FlUVRwYTd5WVJ4d0hMYWI0STQ1d0NlT3NN?=
 =?utf-8?B?NXpzcGRYcjA5S0dEUDZCU0xocUVJN0VqMzNCUjVuWkkzcTlFZ3lzZytOOTA4?=
 =?utf-8?B?WmRiaGtlN2RQQ2NTMFhJaERJcjhWRC8wMDhxd3lMY3VDMzgzcUw3cEtDdk5Y?=
 =?utf-8?B?NXFYRzNZeUZzNWpFK3R4R3lFeGVab3IxZnhRL2xISGxSdGhadE9BNXFHaTEw?=
 =?utf-8?B?U2sxM1dwQk1abjNvbnhsK2NPZ2N6c3JZeHgzRW9wM2VDR3p4ZzdEbEJmcDM4?=
 =?utf-8?Q?0rMH/yMci14=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V3lNUll5MURZRjRLVTF6N0dPaHVqYkxNRTU4eFR2blJCc09IOUsveWtuaXpX?=
 =?utf-8?B?SGZsbC8wbXc1QSthbER4c2xXMjMzODh4WCtEZWZ0MmlmN1ZkYnhmVTN4R0Qz?=
 =?utf-8?B?MUxKTWptOHhsYkhBTCtoSERaeHJ4dnd1eHJ1UHp5TUxtdW1zZzN1b3ljVmNi?=
 =?utf-8?B?ZW9mRVVvdG9jK3hPbnBNWUVVYXUwd0ZRMmtweDdZZy9Yc2NhYUNWNWI1ZEVG?=
 =?utf-8?B?em1IMkExQlNMcGU3ZzBYMXZhTUNWcktvVDc5RStjV1hMZ2VuNjVXNy9YNlY0?=
 =?utf-8?B?K0luaWN6U0JDRnBaaUUrY1VpMnZtKzVtYWVzemRrUjZsU2hhajJjK3h0Q0NM?=
 =?utf-8?B?aGZKY3NkRXplYTQ2M1paUVZZNEtrcWdlRjhFQjRPWDYxeUxuQ2JyNjNya251?=
 =?utf-8?B?bGdGclEwNk1YNW04WUNuME1kRm8xWU9yaVpHQnFqOVdablM1dHVoVlVhQmIv?=
 =?utf-8?B?SVVDR0p3VkFRdXRkMGdRRGFpcnNYZC8rZGJoY3IveDdVMXpUSCtOTDQvM3Nv?=
 =?utf-8?B?NVRlSU5xQXFraUZtaFBoc2Z6a1Q0UmpEb0g0aGxPRWRmUXlaOUxMU0c5V0RI?=
 =?utf-8?B?bWFsZTZCT3Nka29haFZmdkhVTVBmaEd4QXhSQllDaTg3OElaZU5vV0hFT2ZB?=
 =?utf-8?B?UlVxRXhiNElFc3ZhYm5vRHpBTkJUNk15M0V0Rno3WGpxTU1XdVNTVGVORWxU?=
 =?utf-8?B?WWRzSExVeVEwZkdBbTQxMklzUitIV3VIMUNBam5Qc2FxZFlWaitQUElGSDVr?=
 =?utf-8?B?SDI4Rm5XclgxSVRPbVlPL0tXR0FoMC8zaUdlRXM0K2tFdzI2KzFHRU1xVlhn?=
 =?utf-8?B?T2JLK0FuQ0diMzNxYmM5WHkzK2FnbFRhWkJhZlljZXhwdk5iajRoRzJwL0gv?=
 =?utf-8?B?cXRwRWVWRERReW5Jcm4yVHRwMEdBV1dWcFhqK1kwMlA2TVhnSUE1OFFpL2lR?=
 =?utf-8?B?SDZsdTRXK0ZpWlhqL3REc0tKaGRTaWlNYkg5WVFINktZRC84Q205di9WSERu?=
 =?utf-8?B?c0hlK21GOEFIaDlRa2dKV081bk1kNTFzME9MamRNVkJvVGlNaUlvL3h5c2tT?=
 =?utf-8?B?K0p5MjI5WnRoZ2MvOTczOVlxQzF6Vitha0l6dTY5Z3N5VFZKeWRKTHYzeDkv?=
 =?utf-8?B?WkI1b1VhUmRFYXladi9rZ2g4VGtQNW45eW91cEF3b1BOTzE1amVuK25yWFd1?=
 =?utf-8?B?WHlvY2IwaXVDWjNSZUxaaXlTOXU2cm5mYWpnNHVYU205a0hiKytPeU5pZE9Y?=
 =?utf-8?B?Z0ZvZitKRGVLbXp5YWVucjdQZzNMRVZQR3hjVjFVYmxHMkNjQ0VmQi9xUFhD?=
 =?utf-8?B?dUhGSzRjblhoVHdkUGNNV252UEQvaUo5MFdZR00xYmVVcUlCa2NxY1BVTlRi?=
 =?utf-8?B?SWVXMDJrV2RSUkI0SEhZaXgwd1NSVVZWQlVFRS9RNVFtT2lKZmFuUS9XcTk1?=
 =?utf-8?B?TjY0Rm5OU1k3ZUZNbGtJbmNlQkwvU0o2eGtHMDl4RTlHN3VaK0JPd0xDYlhX?=
 =?utf-8?B?c0JjVnlQYTlTOWZzYVZwR3Vtc3c0amVCTllOUnhhcjV2Z1FsNkZsaTRFQmJS?=
 =?utf-8?B?NXJnSVNOcSsxcG9qdjNqS2RMRHJraTBDaVgwVXV4Y1ptOVBoOUJDQU85Qkt6?=
 =?utf-8?B?T2NhNXRlaXZFcVpRLzd2dUppUEpzSnJtc0puLy95T3Z3Qm14MUxEOEtuQ2tB?=
 =?utf-8?B?N0pQVG9SUk5wSzRRR1B4bEJvS0QzZmJESWxqNFZVMFNQWHdtNTE2cjlHV2Ix?=
 =?utf-8?B?aGt3Q0xjNzMzaFZSL290MFQ2a3dZRzZTQ204S2VXclpzTU1seThnSG5JUFVr?=
 =?utf-8?B?WjcwWC9zdVZhdktzejBwd2JTaTUzMGdxcnNmeTdqeGhSYWUwbDBaeHR3TklZ?=
 =?utf-8?B?QmNZeUQ1c0E1NCswZk9FbjJFUnI2UXRVRjlQQ0dtUUtmcW9JNmRlMmhETVNJ?=
 =?utf-8?B?Snd3ZVFMeEQvbU0xbkdzNURFV1BMaEY5cGtRWDlWNnR2ZjZSQUhZQ2orYmpF?=
 =?utf-8?B?YjJqR01hU0RSMVhIK09VNm9pK3RDR0VCSkV0aENOVlN0WjVjU01VU2ttY2NE?=
 =?utf-8?B?OWp0YmUwUGJsK1hjRHRBVGVZS29NY2cxY2xwMVNwT2t2SXpUV01OS2V4eGtl?=
 =?utf-8?Q?zOEhDLa0FiAv1v4XBdgYBypz+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eae483c6-b1f5-442e-6667-08dda4f7c137
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 12:43:36.5092
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U+Z4hd114qmgX9X4+wepgsM5g7TlsS9rgszoQ6iltsi6DIbOdDXnJaXoCvWhJX2dHc9uarxeHRv8M+yTSu5YaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9130

Hi Michal,

On 06/06/2025 11:13, Orzel, Michal wrote:
>
> On 05/06/2025 15:39, Ayan Kumar Halder wrote:
>> Hi Michal,
>>
>> On 05/06/2025 08:06, Orzel, Michal wrote:
>>> On 04/06/2025 19:43, Ayan Kumar Halder wrote:
>>>> Introduce pr_t typedef which is a structure having the prbar and prlar members,
>>>> each being structured as the registers of the AArch32 Armv8-R architecture.
>>>>
>>>> Also, define MPU_REGION_RES0 to 0 as there are no reserved 0 bits beyond the
>>>> BASE or LIMIT bitfields in prbar or prlar respectively.
>>>>
>>>> Move pr_t definition to common code.
>>>> Also, enclose xn_0 within ARM64 as it is not present for ARM32.
>>>>
>>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>>> ---
>>>>    xen/arch/arm/include/asm/arm32/mpu.h | 30 +++++++++++++++++++++++-----
>>>>    xen/arch/arm/include/asm/arm64/mpu.h |  6 ------
>>>>    xen/arch/arm/include/asm/mpu.h       |  6 ++++++
>>>>    xen/arch/arm/mpu/mm.c                |  2 ++
>>>>    4 files changed, 33 insertions(+), 11 deletions(-)
>>>>
>>>> diff --git a/xen/arch/arm/include/asm/arm32/mpu.h b/xen/arch/arm/include/asm/arm32/mpu.h
>>>> index f0d4d4055c..ae3b661fde 100644
>>>> --- a/xen/arch/arm/include/asm/arm32/mpu.h
>>>> +++ b/xen/arch/arm/include/asm/arm32/mpu.h
>>>> @@ -5,11 +5,31 @@
>>>>    
>>>>    #ifndef __ASSEMBLY__
>>>>    
>>>> -/* MPU Protection Region */
>>>> -typedef struct {
>>>> -    uint32_t prbar;
>>>> -    uint32_t prlar;
>>>> -} pr_t;
>>>> +#define MPU_REGION_RES0       0x0
>>> The name of the macro does not make a lot of sense in AArch32 context
>>> and can create a confusion for the reader.
>> I know, but I want to avoid introducing ifdef or have separate
>> implementation (for arm32 and arm64) for the following
>>
>> Refer xen/arch/arm/include/asm/mpu.h
>>
>> static inline void pr_set_base(pr_t *pr, paddr_t base)
>> {
>>       pr->prbar.reg.base = ((base & ~MPU_REGION_RES0) >> MPU_REGION_SHIFT);
>> }
>>
>> Let me know your preference.
> I did not mean #ifdef-ing. I was more like suggesting to use a different macro
> name that would be more meaningful than this one.

Now I understand you. However, I can't thing of a better name to make it 
more meaningful.

I have added a comment on top. Is this helpful ?

/* Unlike arm64, there are no reserved 0 bits beyond base in prbar 
register */

>
>>>> +
>>>> +/* Hypervisor Protection Region Base Address Register */
>>>> +typedef union {
>>>> +    struct {
>>>> +        unsigned int xn:1;       /* Execute-Never */
>>>> +        unsigned int ap_0:1;     /* Acess Permission */
>>> If you write AP[1] below, I would expect here AP[0]
>> Again same reason as before, let me know if you want to have additional
>> ifdef in pr_of_addr() or separate functions for arm32 and arm64
> I don't understand. My comment was only about changing comment to say /* Access
> Permission AP[0] */ because below you have a comment with AP[1].

Ah makes sense now.

- Ayan

>
> ~Michal
>

