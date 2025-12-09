Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A19A3CAFD8F
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 13:02:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1181542.1504575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSwP2-0003BV-Jp; Tue, 09 Dec 2025 12:01:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1181542.1504575; Tue, 09 Dec 2025 12:01:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSwP2-00038q-H7; Tue, 09 Dec 2025 12:01:12 +0000
Received: by outflank-mailman (input) for mailman id 1181542;
 Tue, 09 Dec 2025 12:01:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2qC9=6P=epam.com=milan_djokic@srs-se1.protection.inumbo.net>)
 id 1vSwP1-00035D-1r
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 12:01:11 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf2e9bd9-d4f6-11f0-9cce-f158ae23cfc8;
 Tue, 09 Dec 2025 13:01:08 +0100 (CET)
Received: from AS8PR03MB8322.eurprd03.prod.outlook.com (2603:10a6:20b:509::16)
 by GVXPR03MB10351.eurprd03.prod.outlook.com (2603:10a6:150:14b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 12:01:06 +0000
Received: from AS8PR03MB8322.eurprd03.prod.outlook.com
 ([fe80::e577:995:fb9d:38fb]) by AS8PR03MB8322.eurprd03.prod.outlook.com
 ([fe80::e577:995:fb9d:38fb%5]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 12:01:06 +0000
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
X-Inumbo-ID: bf2e9bd9-d4f6-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AuHcQVJXtOEcx6PrRzST/fJnbC3YM3hsciF5Z1nzlKm9CXMyo18VqwVQutnqCcYRxyHmW0w91bMu34VKxeoD+vWBvQUEYGDQHOSFTKxnPOjSiT9jOOud/6+Z4bKRvxU/LbmQ1qwkyDHaobHp69LI0qvKK22x/7grYwpkTasnpnd/+KtuVeOCjKyfd/X3Vq81Lu8KwCczOhtOpurznteUq8KrPeiMiDmHu4uUWixaV51XijrrBe3ZFR9FfQtqsZym+TCO6v7WWWYqKxllLLblwf58zEdUeNyCVXWTbnsDfcybXCb4UKFLq5Zf7rgezPOYmk06WvXrkOSa407FUjMZVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IicpKq8m7wEjLkAUtdbc0GuZ+Ne/rMdDMiMWbB4c140=;
 b=kMcxze3qfGI2fBbjJCC/g4uMkv78m9UIy0boEXc3QlFFTjxMxCKoHISrejrSKRNWLI1xZpq9uHpP98EzyY1AxBh+85ODsG2yrAmm0+5Bj6SsfdzgULBc05n0SescF+6hb7G1n0AQSyx8UtX2VK+R0Djsy91cK7wJgbyuGiwSs1BM0s4ty9Y4oTezS/yb4EAJmhEzH6NnUEXJk1J6PSt6GbPKabtIed5JPE05JPrkUmuhk5P0UhzM0lVCAQUFD1R9mhkNFfMsCvna8/z3ICbenR/xu0hewYXzU7xvfUWh89O6tTXHzvCGU8Wu3WBRb3aHT51Yt16VNSZj2FyMVOeKdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IicpKq8m7wEjLkAUtdbc0GuZ+Ne/rMdDMiMWbB4c140=;
 b=D0o/817ze2u8DbQqadXjDZ0TTN/1qw4mHzPCJ91BsznRQMJKe+F6F+mdH+OTYBEopo1ToqHzJWyDFhEzjof7fBhSHHMGlC89F2Ck2M43o8s7qjFIpWe01dLBxGZ9uABNCfx1sHNS/Hg1KSlVYFvWtvV8i+gHZIcHmtZBZgBNtiuxn9ZjIjlSJRAmKhFs+36tz+cNnUGR1Gnpv6WbPyWIPfoI1jFZyDIsg5T4RdGeZg8sasnS2h9lmnneHPj3jmoV79jj21RJqT+PE8klBeftwhshYcjA8QnXuMbMIiXiMT4WBu6SPgRC6Uzjf1/E+F85qzP0Z8cSS7dRfSP2sPPmjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <18241d94-7e01-4d72-90fd-ed7f167b68b6@epam.com>
Date: Tue, 9 Dec 2025 13:01:02 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arm/domain: Update SBSA_VUART_CONSOLE config option
 handling
To: "Orzel, Michal" <michal.orzel@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1764961645.git.milan_djokic@epam.com>
 <723a873c8c35f54d1cb29866c9b68211f6a977e7.1764961645.git.milan_djokic@epam.com>
 <221cee55-e7ff-4f17-ac22-16ccd40566b6@amd.com>
Content-Language: en-US
From: Milan Djokic <milan_djokic@epam.com>
In-Reply-To: <221cee55-e7ff-4f17-ac22-16ccd40566b6@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0202CA0004.eurprd02.prod.outlook.com
 (2603:10a6:803:14::17) To AS8PR03MB8322.eurprd03.prod.outlook.com
 (2603:10a6:20b:509::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB8322:EE_|GVXPR03MB10351:EE_
X-MS-Office365-Filtering-Correlation-Id: d9a81373-00ce-45f2-9484-08de371aa212
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q240cy9vRXJIOTFGYlBLOEt4VHgxWVA0bHp0UVIxUy9vWksyZ2Rka2JsZE0x?=
 =?utf-8?B?eXVEaWZROElVbFh6ODJ0OW45ZWxrWlczM1p6NmlDZmhzb3loU3ppczZMOVJi?=
 =?utf-8?B?RDdsZU5UT1pDYTJNM1JDTmg3RXlOemJ2Y3RMT2taOEFrOWtCQ2hDYWpqdHhD?=
 =?utf-8?B?MTZ0QWpYdG0rVDBBOHRYeFYxVUJ5ODA4MkxtS1kwUU1OVmRnanFLbVJPcEZ5?=
 =?utf-8?B?V0syNnVkU0hyVTF5NUtySjhlazVuZ013MWd5ekRnR3hLWVY3ZzRWc0dKOVVL?=
 =?utf-8?B?SzVyUE9ndUplU0VBaG1GOWFBRE9NemdkZTc3OTNIMGVybnR6OGFxM3JrMkJz?=
 =?utf-8?B?cVYyNnNOclRVNUo1eS9nR01BanpmTUx6YUZIREU2N29oN1RyR3BoWklKMkJO?=
 =?utf-8?B?ZUdCRWE2WU1PN3BaYTBRQ2l3OS9ZbHNlektKcjNqYzcrUWlsQ0h6L3BadEgz?=
 =?utf-8?B?V0w4RjJ3dmRNeDFBT3BjV0g5cTBueFMvVVJreG1yUCtHTDJ4ZE9hZ3dSTUIv?=
 =?utf-8?B?Y0t0c2JKUG80VGM4TTRpUTNKaE8yVTRpSTlTNUpWc3FzVTRuUkFsLzdNY2g0?=
 =?utf-8?B?TjZRRW5laEdER1VoUkRpMndDQU5USkw4Z0hXaFZyNC9Zei93Nk1FbUV5cEFM?=
 =?utf-8?B?UmsyT1g2RWZZTEYrdCtwUWkxYVNxK0hLL2ZkTUlyWTBpUGJqRUFtbEkrRTVi?=
 =?utf-8?B?dzEydURodjVYOUNCVE5wZVVJbnJzRlQ3ckJ6ZTQxalFrYlh6YXBmeThITGcz?=
 =?utf-8?B?ZXVwRERuOXZzYkVzWkh1bE11T1JNZzlSd3pVYnN5Yko3eDFsWDdTUG4rRFZ0?=
 =?utf-8?B?U0srRTVrTlJPSEVHeFBBSE8raFJTN3J1bkhNSW9rUVFYMWhLUFJGamFLUGlN?=
 =?utf-8?B?RmR0c1AzZS9ZY2lQWHJLbTdTZUNydVJXOHhnWlV4LzVtWmc4RXRWWUMzVUp4?=
 =?utf-8?B?cE5zSGYvOXQvYzYxQ0VwU3dCcHpJblZLcDU3dDlpTWRBaDZLZVpuZjJkaFlT?=
 =?utf-8?B?M0gxcE1UWjBkMHpJSGJJRmFlWjI1V1UwQVpQN3hZS3NJRi9aZitEeFNZVnpm?=
 =?utf-8?B?M0dJZGNibDFtMVRCelprbWtIbkJvZ3hXTy9jS3Z5YkQranBYa2NxUTljcHhv?=
 =?utf-8?B?VnpQOXFubWRjMmJPTm1WM1ZiajJFQnpKT1lzTXdxS2tFUE5RU1hlN3BiY3pW?=
 =?utf-8?B?SUFjWlJ4MXhTTXJReDdQSTR6MFd3TE1NOUpiSGJHRWMzdDFFeU1paGoyQXhP?=
 =?utf-8?B?S3M5bXFWeW5DekkyMVRkL2g2cmF3Ritoa3F4T1JoNkdyNDZMU1lvdXQveUJa?=
 =?utf-8?B?ZCtHdEZ6QWlPSmhoK05tZWt3VlNDSytZWHVDY3VLTjJwTWowdmdFc0pJV0hX?=
 =?utf-8?B?cGRoT3JSaFNiMS8wbnk2UUE3MVgvRjc2UENmQURSeldDYmthS005V0ZWbVVs?=
 =?utf-8?B?dHBTRHFrYzdRWG1MSUhBaTYrUWNvYUxDN0Q1bFZ0Mm10K0NHRXdSN0E2TWtX?=
 =?utf-8?B?ak9DYVk0cEZtajlXN2NLUFNWSlI2YkxPL2xWTzZ5cHZVSStEejN4a1ZRWmJj?=
 =?utf-8?B?dkJBbS9NUSt0b1VXaWNNaE5YSWE0eExZVU5zZ00yaVpCMFc0NncrTUhjaGVD?=
 =?utf-8?B?UkFqeENGbXdHbzkzQXU5Wi9FRlhvV3l3Tk9jcE5BL2wxOFFUOGlwekhycTQ4?=
 =?utf-8?B?LzFmamZtU1VLY3RZSHhnSWN4bDVCMEpZcndPcmFpbktIQ3ZKNy9XaFlTZE1j?=
 =?utf-8?B?eHZwcXlBWVIyK29vY01MZmNXaGFXWHp6cldGVnUxMTR3WHRJUU9qWEpqd0JR?=
 =?utf-8?B?RGlUcEhFcGNXTEdQOFpBWUFqTjNaMkFMZGRuM2IvbHdXdktHWlJvN1BHUmVa?=
 =?utf-8?B?ekJNY2ZTK1dzcmV1aDBIeG9PaE5SczRLelZrTm5Kbmt4bU9RQUYvNXB1UGhL?=
 =?utf-8?Q?IRYYbwYM97d5OCssz0SF/cfKZDCg2IvM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB8322.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NW5VT3h6ZlV0TER2TC9mKy9RSHZxNjJYVHgySW5LUEVNSUZ4eUQvWmxNdU5w?=
 =?utf-8?B?VWFGeDlKc1J6VllFWHpKS0JTWlFwWlg1b3Qzc2VjcFNZY0RmMlU0Si96ZmJr?=
 =?utf-8?B?WHdlMHZqQlFOMGlyeGx5akZteUJ0RHlQZ3ozVnEyekdGekVsK3BvbHZ1a2dF?=
 =?utf-8?B?K2sxTGNIUUsrdkhtakhodzZjODVLdFc4UzR0OS9sVkF3eG01MlA3bkpKOTV6?=
 =?utf-8?B?UjNhVjlBazdsVjg3NTR1SmgyVU1pSDM2cE9NakV4VEhvb0lmK3lldTVlUXdm?=
 =?utf-8?B?YmJyVFBoT1FJZGV1b1FaNDRrb3Q4TkZneXN4a2lZVm9KZXNnUjAzQUwvUDZp?=
 =?utf-8?B?YWZwQjNmNzFHbDNuNWtWVHFodm5sSXpIL0JqY3p5Mm1lVXZIeXJFSjFmSytD?=
 =?utf-8?B?NlAyb3VsMTFMenJTZXpIeUhQNkdqc2ZyVkxmKzViTGIrbzUrTU1XNmN3eFFs?=
 =?utf-8?B?bnRlOWZpcnpRR2h1VEtRNWFaWEY0eS8xRmExMktOdzUwZ2VaUkQ1UVpQKzZL?=
 =?utf-8?B?cCt2VEo3ZXdRSnVhVEZ4OEo0MHJ5cUtDcVhUcUQ3YTJjYWdISjV3QUtXMkNH?=
 =?utf-8?B?dkJ1aEFDM2J5dlBIdGQxS2VlTGJiVUpwSXBSWGdmd3VwY2Rna1F2ejZMeCtY?=
 =?utf-8?B?U3dNSkZjSHF6QVpwa3NKU2VxTGNMZkFWTURUb21Qb0dXcmpxMGRVY1d3TURB?=
 =?utf-8?B?NEtSUWhGOGwyaHFHZThVTk8reHFDN01JU0JuRDVpcFdsVTNtS2pJT1Ivb2J0?=
 =?utf-8?B?eWgyN2hyMmxPbDUwS0NaUDBvN0k4U2JxKzN3ZzljcnNsbmZGczM4N2NZWUti?=
 =?utf-8?B?N05jbVJkQTNZNHNUcEh6YVlncXdMTjQ3WThqWENHTGFFL2kzOWJNSGxPSkZt?=
 =?utf-8?B?M0MxTVdOYkg2aENZbTY2MnpBL0hPMXZMaUFVSU95RVdsZVdTTnJyR2VDTFlp?=
 =?utf-8?B?dXBoeE1ERDYxMGVnbDJaTm1vdndzWWVydkFUTVVDS25BdytZM2NQelJuYnZV?=
 =?utf-8?B?TWwyajF6YWpPNEdhYlo3dTlVWXpNQ3dKVkFBcEYrNk9EU3VMNjg5empsNzkw?=
 =?utf-8?B?UXBUUDYxUnZjeDRWUzJ4cUNkeXd6R1RPUUdiRkRsQWtiMjdudDcxQnJXMFhm?=
 =?utf-8?B?NG9PZkVFay9GVG9sckx0VXgyNW9pd0ZwODV2VkdjcUhSQVhGbkIwTEZFMjBR?=
 =?utf-8?B?VzVhQVVqQVBOSkc2UnEyQ3IxL0VRanlLV3NxcnFLUmJLdHJTd1U2bmVZY3I2?=
 =?utf-8?B?aE1rODVtdEhEMW5yeEpTUUczY2JjY1FNR3M0dkdkTDM2c2ZocmUyV3hCdW5y?=
 =?utf-8?B?ZFpxQXV3dDJOc3BrMFJQN0xJS3RxcVhGeXlGS2MwSU1ybDBGS0lLOXpwM3Qz?=
 =?utf-8?B?anUwQjRJc1pBYU1PVUJmTGw5NEZtdEtwREdvNVdUVmN6cm01eERWZFBZTS83?=
 =?utf-8?B?SnByUmFTY2Z5M0szVzJLbk1aTmFZVmx3dTZyc3p4WTJBT2ZvZWh6Wks3cGVs?=
 =?utf-8?B?WmVrR0RROWI3Vkd3QVhscnV6RVNXMy90Wkc3MXRlRjhub2ZmRjVwb3hjeGh6?=
 =?utf-8?B?ZjBUUmRNNXBoaVl6dHRjZURRZnB5M0JjMUhCVFplbUpwLzd3SllEeVZNVFI0?=
 =?utf-8?B?MnNFYzVoVnFQZFZWSm04cmVhcUxsRFlqdjlhRjlkTXBKeTlRY1FrNGhQN0pP?=
 =?utf-8?B?cTF2VmYzQllrMnJDTGhnZTV5RGFrVlRxaERHZ2xDTGVqUHAwQ3ptM3daWHYv?=
 =?utf-8?B?c2V5UmI2SGNlVjFpSFVmanhKTXczcXZOVFRtNGlQMkxRQnY3ZzVEYWtiTjVx?=
 =?utf-8?B?amRNS1hoM25FZmpYWUo1YUdWald5N0dzUlJtVFFzUEZNVForV21UVENseEFE?=
 =?utf-8?B?T2NPUm44NDNVTmxDQ2R0dWExTmRtdFhGRTJFVVJYUERwSnVTSk0wbktZTzVV?=
 =?utf-8?B?MUNzSFBlRi9SelRKU29YTlRUOC9nckhqYmtoTlcxN2hIZE9mN1R0VTdsTnky?=
 =?utf-8?B?TjEreTNwbXl2ZGNkSXRtczhoNGNxNE5nUmxwYzJLQ0J1NkdWaW9tNlZnQUh0?=
 =?utf-8?B?eTM4V3NUWW5wbllQSlBFbnVRajJaRGliNkpib2RYV3pMUEJ3SkE2MGdBdHR5?=
 =?utf-8?Q?EiDmAGGP42nRZPMwLvTz3Ok9V?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9a81373-00ce-45f2-9484-08de371aa212
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB8322.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 12:01:06.3433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CyHhXNftNUy6H3ioHzBbt5uNa94eSN3DD4502ACSkJVLtNz3yimcMpm9hcBeKgljTS9gKLqk437MQIls7vaZZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB10351


Hi Michal,
On 12/8/25 15:43, Orzel, Michal wrote:
> 
> 
> On 05/12/2025 21:36, Milan Djokic wrote:
>> Update XEN_DOMCTL_vuart_op command handling to return -EOPNOTSUPP when
>> vpl011 is disabled, informing the control domain that this feature
>> is unavailable.
>> Added dom0less config sanity check for vpl011 property
>>
>> Signed-off-by: Milan Djokic <milan_djokic@epam.com>
>> ---
>>   xen/arch/arm/dom0less-build.c     | 4 ++++
>>   xen/arch/arm/domctl.c             | 3 +++
>>   xen/arch/arm/include/asm/vpl011.h | 2 +-
>>   3 files changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
>> index 4181c10538..57980d2abe 100644
>> --- a/xen/arch/arm/dom0less-build.c
>> +++ b/xen/arch/arm/dom0less-build.c
>> @@ -322,6 +322,10 @@ int __init arch_parse_dom0less_node(struct dt_device_node *node,
>>       if ( domu_dt_sci_parse(node, d_cfg) )
>>           panic("Error getting SCI configuration\n");
>>   
>> +    if ( dt_property_read_bool(node, "vpl011") &&
>> +         !IS_ENABLED(CONFIG_SBSA_VUART_CONSOLE) )
>> +        panic("'vpl011' property found, but CONFIG_SBSA_VUART_CONSOLE not selected\n");
> I don't think there is a need for another dt property reading. In init_vuart()
> we read this property and if present we call domain_vpl011_init. This function
> returns (thanks to your change) -EOPNOTSUPP, so we already cover both cases. No
> need for an explicit panic.
> 

I added this check since it seemed to me that this specific case should 
be covered as part of the config sanity check. But yes, if there's no 
need for an explicit panic, it is handled later in domain_vpl011_init() 
anyway. Will remove it.

>> +
>>       if ( !dt_property_read_u32(node, "nr_spis", &d_cfg->arch.nr_spis) )
>>       {
>>           int vpl011_virq = GUEST_VPL011_SPI;
>> diff --git a/xen/arch/arm/domctl.c b/xen/arch/arm/domctl.c
>> index ad914c915f..250e20a9fb 100644
>> --- a/xen/arch/arm/domctl.c
>> +++ b/xen/arch/arm/domctl.c
>> @@ -156,6 +156,9 @@ long arch_do_domctl(struct xen_domctl *domctl, struct domain *d,
>>           unsigned int i;
>>           struct xen_domctl_vuart_op *vuart_op = &domctl->u.vuart_op;
>>   
>> +        if ( !IS_ENABLED(CONFIG_SBSA_VUART_CONSOLE) )
>> +            return -EOPNOTSUPP;
> Why is this needed? Later on in this path we will call domain_vpl011_init that
> will return exactly the same if CONFIG_SBSA_VUART_CONSOLE is not enabled.
> 

Yes, this is not necessary. I will exclude this part.

>> +
>>           /* check that structure padding must be 0. */
>>           for ( i = 0; i < sizeof(vuart_op->pad); i++ )
>>               if ( vuart_op->pad[i] )
>> diff --git a/xen/arch/arm/include/asm/vpl011.h b/xen/arch/arm/include/asm/vpl011.h
>> index cc83868281..b8f4d85651 100644
>> --- a/xen/arch/arm/include/asm/vpl011.h
>> +++ b/xen/arch/arm/include/asm/vpl011.h
>> @@ -74,7 +74,7 @@ int vpl011_rx_char_xen(struct domain *d, char c);
>>   static inline int domain_vpl011_init(struct domain *d,
>>                                        struct vpl011_init_info *info)
>>   {
>> -    return -ENOSYS;
>> +    return -EOPNOTSUPP;
> This change is ok.
> 
> ~Michal
> 

BR,
Milan


