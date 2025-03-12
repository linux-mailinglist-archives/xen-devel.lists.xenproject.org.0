Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A21EA5DA3F
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 11:13:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.910177.1316930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsJ4n-0001Fq-5b; Wed, 12 Mar 2025 10:12:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 910177.1316930; Wed, 12 Mar 2025 10:12:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsJ4n-0001Eb-1y; Wed, 12 Mar 2025 10:12:37 +0000
Received: by outflank-mailman (input) for mailman id 910177;
 Wed, 12 Mar 2025 10:12:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pbuB=V7=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1tsJ4l-0001EV-Vq
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 10:12:36 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20623.outbound.protection.outlook.com
 [2a01:111:f403:2613::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c9f6064-ff2a-11ef-9898-31a8f345e629;
 Wed, 12 Mar 2025 11:12:22 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by DU0PR03MB9350.eurprd03.prod.outlook.com (2603:10a6:10:415::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 10:12:16 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 10:12:15 +0000
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
X-Inumbo-ID: 7c9f6064-ff2a-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y5wQcxZaOR7xG1+JystIjTAJ+z1qNl0Otor6ovnbDGf9mH7iAiMzmgC6WV8poV+725OL0D876+UhmeL09OlYNEHHWi+3CvJsDrPbwTAeNj3D7iCQ7Qqy27mAJ6+/9+e49Tt+DhaW2dbrrRKaosjW24AICy4Cv+sG/5iPxt/cbRfqeGObq1paFOGzpRsefmp1v7bcA3i8EUJ2xgxZrpXrp5hNxa3DzGPY6IQOUMlFoL1lztrh8nuPZhusliFDx90jiOYHuO1gKxTy74aJ7D4m1CaDnUoNTgDRXA5U2tXUEsUzwIAmJf1FT4LRsw5vbd+wO+o6Dm0qt6bOGN+IfwDpyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qIuxvoYl6yVWRIaa7ZCqGodLkZXrTIzc0XRyttNfbBY=;
 b=f8/0Zok/l4HPEpBJxaWNsxMFeIn9qKtHclZwRuUDW5rMTJ/wwJGRDH0acfmzWntApzCJYQRD0fh/0Qe7UH/luEz2gs79EvnRO4Q87Pk6qxOPDacyrIpJBzoS7tndGfomaqcZu7p9lvSGitkUDqRkFPe+TfEbEyuYbJlsRlsVKimuuHPP99DkJlh7kDUIUiY1g7V66PR4JDj+XAt91uN9rkCrp1gp6F7RwKfnB1vIrytiP1K1XDt6nRocffOVBiIQwliaweXmLa6Vz/x3m5LvuOAuIwIPUxtjMESGVXIwIp4oIXr3s0WFKGqgmKVM7NQBfkKOl2Q9+jO0WbbJ2wWpcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qIuxvoYl6yVWRIaa7ZCqGodLkZXrTIzc0XRyttNfbBY=;
 b=CrfmPl8wKUAhVeFVa0ujyCzFi1mJIwsABxjYbrqAjuZp5RirYg3zPxj+y8n8ObQLH71GEX4ELLVrgGTCZH8NOcO78d9J631NKJL8DIym2y1GWocxkBmEa3oy6K/5D6YSFSEuAEhkOtg9thVXzYx7PSAL67HBI6//sJUZlxAwY3uD83PxZ0jpk1WbrxsD/K52ZZHtRuoVm50UMbbtgunq1pqOeCSiNj503qY2rd8g1ciurCs1HpngxhyRdLIVADoIhq8l7HojQAa2gHa+jYiayiw6BlhqCqUereZeTHzdPAJUNZjj1dxu2aQux9yOE7h+gGl/YVemZSdWF4gF1KMWew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <0cabf89b-4c37-45d6-98d8-38a6719160b9@epam.com>
Date: Wed, 12 Mar 2025 12:12:12 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] xen/arm: rcar4: add delay after programming ATU
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <cover.1741596512.git.mykyta_poturai@epam.com>
 <9cd78a64dde2e0a039919a08025abaa89d63966c.1741596512.git.mykyta_poturai@epam.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <9cd78a64dde2e0a039919a08025abaa89d63966c.1741596512.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0168.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::10) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|DU0PR03MB9350:EE_
X-MS-Office365-Filtering-Correlation-Id: bfba560c-7b3d-4886-70d5-08dd614e5cd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Qm92M1QwVEZBQWxmaTZXaXphd3JrTy94TUk4V0Z5Y0VUSzRiQkh4d0IyRUs5?=
 =?utf-8?B?TVhCdkc0NG02cXZvSTZZRGc2NGpwQlhVRjdDU3NBeWhjZ0dpUHBLc3RmaTlr?=
 =?utf-8?B?SDJNU1lmeXFOZE82dVFHWTJVcWVqaS96cmtDenJIb1hTanl4dkEwTkVEMlRS?=
 =?utf-8?B?bFFqVGJuZFIxOUxycGN2V3U2eGhNSUdEeXdtVitRYTduTG5vTllERTJGT3ZQ?=
 =?utf-8?B?M3ZrVCtDVHZOMHFHV3dZbGJKU01jV3BFL3Bwa3VUU2s5NHIwM09aRFUyR094?=
 =?utf-8?B?N0M0U01KNW1Wb2hYSExiVk13WWw3elpvT3Z1cXA5UGJiaHJ6RlM3aFZPb3ht?=
 =?utf-8?B?bzNPZGRmRjFCNU9XbGVhR1dBN2lWK2ZPWXZxc2MzQ1dOaWhDZmJkRjVmT1M5?=
 =?utf-8?B?b2tOVVljMUVYL0wvVC9jUkxPU0VreG85N2d4ODVsYURkVXJiS2ZhNGJMYUlF?=
 =?utf-8?B?U3lRSmtrYWdRa0NMOWNwdHJqN2xiUDR6aGtBUmZSVEpST3FqdnVDSk9jb1Bs?=
 =?utf-8?B?VFAvVDA0ZVVPb0gwWVYyN3M3VVZuYkd6eEgyOEtaa0IrKytKT3k5L29zL2k1?=
 =?utf-8?B?Q1kxRHlWQlRHeHJsSkdrNmRvUG1EL0dhME45RXUzUWdpMURMRVJzeW54bVRu?=
 =?utf-8?B?VzNQV2dUK01na1VNRWRUNDMzZjRiRFZlVWk1aEZ0bG5OVWV1T2YzeDBETWhn?=
 =?utf-8?B?am0zOFFod3BScVRvcnFlMHN2UXd0SlpNcjJmMFRTbEtyRVROUWtKNUJzYTk4?=
 =?utf-8?B?QnpzMHB5NTdIQUNhUElUUlg3NExtcTRxelI2NDQwNFJjZVZxUnczYi9hamhQ?=
 =?utf-8?B?NW85K0xTWDNNUEVmRXdIazJHb3dIZ1BnenN1ajl5Ym1oeVJIR2VORU5zK1hu?=
 =?utf-8?B?d2VWb1lzbVExZmVVZnFiMHZnVUNaamFtTk9VMHlKSXRyVktZeG5NeG9vZU15?=
 =?utf-8?B?LzluL2o2UnA3VUU0MHF5dmpycldTdnNySDlEazNwVmNLdUVXd0V6UzRYNzVP?=
 =?utf-8?B?WDYxSi9ZdXdOQ2NIckVnNWZkdW81eUo4bEQ0ZHhmT09USWVwOXBVSjU4dVN0?=
 =?utf-8?B?NTE5RE1IQWUxZXRWYktVb3Q3TTRrcWYxWUhzeHovV2hreU9RYTFES1NHRXBz?=
 =?utf-8?B?V1h4aTV2K2pZNWZHNkJEMEtraWFXZDRLZXY3OHRMejZoaWVaMkJxUkprV3dk?=
 =?utf-8?B?NDloaUVMNGI5ZnFnUlorN1Q1WlpienE3bnd3RGJsZkdRRVo4bjM1L3piSEds?=
 =?utf-8?B?VmNDWjNJMjNVOXBpOFJxQy9FSmh1eVdsUElOclNoZzcwRzZTbFRtN0RrUnRV?=
 =?utf-8?B?M01VRGRoUElCbEtyOTU3NUxzWlZ3K0dXTDNWMlpuSWM1UUlsa0ZQSFJ2OTl2?=
 =?utf-8?B?U09yWVpnMXFyemkzYmIzdlgyK0hURFYwbm9LV0FaYm9YeGhtVWRwdlhPWXlZ?=
 =?utf-8?B?clk2WVYwdi9mdGNxWUtVR2VveHRrNDB1Ukh0eE1SbjViTTY0RTAxNTZ4V0x0?=
 =?utf-8?B?OGppQjF6TStMUWF3Um8vOWhDaEtlNUJXN2kydStSelBhUHVibDVVSHJIVnBD?=
 =?utf-8?B?S3g4U1libkVydHdDQkhnZU9wRTAva01zT2dPdXFZekFqdmh3NkIrMno1SjBR?=
 =?utf-8?B?R29uZzF0WE5UVUFYcU9HMzRuVjhzQ2tmaThLdjNjQ1p4dDNpOUF5dHNRNjZl?=
 =?utf-8?B?Q2pLMHFlRW1jUlNIcEdvdzVVamF6YnVsc3Q1QVJpUzFvMU1FWFBpNjNZTkpp?=
 =?utf-8?B?SGlFK25tTTB2aXFtR0NjQTU0d2hPRUQyQjZ3OFdkVG4rZFJiNmZLMjVBTWky?=
 =?utf-8?B?V0Fsdm0rU2JSZExvOHY3aDNWcVZNWWRmWCt5S05Wem9xSVF0bTZ5aUtJNXFD?=
 =?utf-8?Q?no85/ma/QofWs?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGNRYkJZYjBiQmVYaXgyaGtTcXlXb04weS9YRDdjekwvekZOOFJTTEdjSVZP?=
 =?utf-8?B?WnhTMHNERjZyMDdCME1XejB6cGtTTFpSK2dleEo2cDJVRld1NEhQWTZpZm1s?=
 =?utf-8?B?OCtNNXc5c1ZCUGRucTR5QzhHa0t5ekpFTXMzRUhuRUt0cDBmU3RyTzRGdU1X?=
 =?utf-8?B?VWwrT3BYeTBYUEdJMkRiUmV5K3NoWmNjM1VMU0JnRG9RRWdUT2JxaTlxU2Qw?=
 =?utf-8?B?QVVsOHFhU0paWHdSZk9PT1FlRkxWa0M1SVAyN2hxUHBKb3Y5V2cwanBYVDFv?=
 =?utf-8?B?cGpTc3h2NnJWaVpYeDNNN2plQjl5MmNvSEpYWGY2L1BsdzRNRUc2bG1zajZw?=
 =?utf-8?B?WmtQdGpSV1RFblZaLytoS0t6KzJDRHZpZ2Z1RUp3VWd2QmNxWjdVbWxnS09R?=
 =?utf-8?B?b1JZMWZQMEJqZXFWUU1tS3ZCL0w2RFJiaGJIWXp3ZTlSelBwd2g4NmUwc0Zx?=
 =?utf-8?B?bDhOYVpwb2oraHNjdGs1NVR0a3J2eDN1NDhIMXBLUG9iS0drNHk5bWYzYXUr?=
 =?utf-8?B?aTdMcW5VenFjZ3BQVVdyNkN1OSt6VWh0TWZYYWFBZ01lR3dRU0UzTlcxb1NF?=
 =?utf-8?B?V3orcytDWHFiam5pNWZBUWdCL1dNdjNOSS9rOVNzMmFRUm1zT2E0MzhSdE5m?=
 =?utf-8?B?M3o2VWU4QVMvQ2YrNVJLSmxIMjNHYm53ZEJhZVlVbjM0VUduRWlEMk1RRVI2?=
 =?utf-8?B?ck4weTJCUWZYdXFZeTVwWUtWZjJ2b281U3VKeVJldTRVdzBLKzUySVdETWcx?=
 =?utf-8?B?YTgxbGxBazluZTNpRlNUT0NCTlluaUJxMmVobEM5czl0QTQ5Q2NqanAxUlUx?=
 =?utf-8?B?bW1CalVxWFhtdmFQOS9hZzVvZWJaSDdDSzlOMTI3NDlpQ2FHTTZsNTFRcFZu?=
 =?utf-8?B?b09CUjBVTzcyL2V4TkF0Sk9tWFNlYXVVRmMwQ29iQVlCcDhabTlWdkFxRDFa?=
 =?utf-8?B?dzE1bnZUbWVTNmhvaG9xa01PKy9FblhuT3FYcWZVVXpVTEJnN2ZXSE10WG5s?=
 =?utf-8?B?VFdnVFJBM1ZqelRkSGt6bzhFaDhHZHZ2aXRFUTVZaXBuS2QvakltYXJwZE5x?=
 =?utf-8?B?amgxQXA1dkhoc3JvUnZTRjcvRDdOeVlvSUhhY1VGYmVWSW9YelZPY2l5WmM2?=
 =?utf-8?B?cnhMOFFSc0NNV2Z2Wjc2RmxkLzYxcTh3aklQdnV4N2RuRTRFajViRmc5RFdM?=
 =?utf-8?B?UlUzNUk0OTFhY0EyVUpocW9VUkh1K2tJcHBlaHpNOUlYbEtJekpJRGN2SFBI?=
 =?utf-8?B?WU5nWmFmcGxJNmgxRExSSEt6aytmVlFaOGpUb2J3K3hoUmtHTTMycTZBUUNp?=
 =?utf-8?B?MU0reHNOM1F6TmpRSkEvRHh3RjhhZDJYc2ZWZjFheHUrT2V2V2h3L3gxSHpZ?=
 =?utf-8?B?V3hBMTdSSDQ1SHlWNU1iN1hOam5YNkh2dkYyNnNyWWJUWkRreHVNZXRaTmJB?=
 =?utf-8?B?Lzl5WExWbzNKRmhETkFraVRrN2Z5bXZkcHFiMDIveDA3K0NCcjhBeEhzZ0c1?=
 =?utf-8?B?dlFCRlpNSnVqMGZkMW1sSXQ4RzF6d29iaVlkbW5EVlhPWXg3Z0xaL3Y1djV5?=
 =?utf-8?B?UFUvbWRMa2RqWnZLVnNiK3p2Qzdjd01QVkRRUDZSV05Jclo4cmxRL1gwV1pz?=
 =?utf-8?B?akhxckJKazkzMnRvRVlBRDNBdXNRMS9SbHBFQks3UGxWTVBRRmlKMTN4cEU2?=
 =?utf-8?B?dmRPNHFDa0tKTVlrdm82RlBJcnBHRXNSZW1kbS8rV3Q5bFF1L0ppQUVnU0Fu?=
 =?utf-8?B?cGM0OHp6b0hCNWNJYjZoNGV0aTZOdnY2S3FydDlZRElIRE94VGFVOGNYalZn?=
 =?utf-8?B?a0RDL2NIQmN1ZE9PK3prY1JXNXZTZlZjRmdIaGFjbDQ3enJ1Z1hyb2FHK3Q1?=
 =?utf-8?B?cGtwVit2UkVDQXFzU2dUelQ1RkZ0bzFOYTZFYWRFUFpLOUVaL3A1T3JTWkRP?=
 =?utf-8?B?aWgwc1dLbThTWUNQOTgrZDNZQjlneitVdVZMc053TE1UK2ZURWI2N290MWNu?=
 =?utf-8?B?azV6QmlrRGJhTVhTZjlwZUpkakJXV1lYdE84QWJIb2NqeHZES0VRbUorM1V6?=
 =?utf-8?B?Z2k5YXZRT0M3SjZYMjMwNmVpZXdSUHlKbWVpejBEZDQ2Sks3RlV6VU5FdmZY?=
 =?utf-8?B?ZWlvZzBsWmlEcTlLditVdThEZHg2UlFCSFZ5Q3B1NWNiaGxRL1FOTEltTURV?=
 =?utf-8?B?OUE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfba560c-7b3d-4886-70d5-08dd614e5cd3
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 10:12:15.0542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 84412EGPHWlo2xmpyNlMbgtzgq96j1tryEhEj+k//MRaooS482GLrwwpg+dz4X1364JCss+0FL+uaBMVd+8I00ILlgROoA1Ireroo6VnCVY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9350



On 11.03.25 12:24, Mykyta Poturai wrote:
> From: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> 
> For some reason, we need a delay before accessing ATU region after
> we programmed it. Otherwise, we'll get erroneous TLP.
> 
> There is a code below, which should do this in proper way, by polling
> CTRL2 register, but according to documentation, hardware does not
> change this ATU_ENABLE bit at all.
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
> v1->v2:
> * rebased
> ---
>   xen/arch/arm/pci/pci-designware.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/xen/arch/arm/pci/pci-designware.c b/xen/arch/arm/pci/pci-designware.c
> index 6ab03cf9b0..def2c12d63 100644
> --- a/xen/arch/arm/pci/pci-designware.c
> +++ b/xen/arch/arm/pci/pci-designware.c
> @@ -194,6 +194,11 @@ static void dw_pcie_prog_outbound_atu_unroll(struct pci_host_bridge *pci,
>       dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_REGION_CTRL2,
>                                PCIE_ATU_ENABLE);
>   
> +    /*
> +     * HACK: We need to delay there, because the next code does not
> +     * work as expected on S4
> +     */
> +    mdelay(1);

It seems like a HACK to WA some platform issue, but in its current form it
will affect all DW PCI compatible platforms.

So, it is required a proper solution for the affected platform to be found, or
some sort of DW PCI "quirk"s processing code be introduced.

I'd recommend to drop this patch for now from this series.

>       /*
>        * Make sure ATU enable takes effect before any subsequent config
>        * and I/O accesses.

BR,
-grygorii

