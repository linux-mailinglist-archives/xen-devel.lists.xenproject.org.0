Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 731C4C5336E
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 16:56:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160216.1488423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJDCp-0000ZK-NP; Wed, 12 Nov 2025 15:56:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160216.1488423; Wed, 12 Nov 2025 15:56:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJDCp-0000WI-K8; Wed, 12 Nov 2025 15:56:23 +0000
Received: by outflank-mailman (input) for mailman id 1160216;
 Wed, 12 Nov 2025 15:56:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EiA8=5U=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vJDCo-0000WC-TA
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 15:56:22 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1fc793f7-bfe0-11f0-980a-7dc792cee155;
 Wed, 12 Nov 2025 16:56:17 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by PA4PR03MB6781.eurprd03.prod.outlook.com (2603:10a6:102:e7::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 15:56:15 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 15:56:15 +0000
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
X-Inumbo-ID: 1fc793f7-bfe0-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TXjxJD+vhfLOxH1KoEtOukKNtIvqXkGYD9C3boBbNvWTucZv5G+wAnbyQWB3FDK4sdA/Du187eeHxhIrkzxk9yCpPTpXsjRmuJ5XujeZDWIEXkews5atAIsiKjfcWqdpSCIjtjjDwJn9s78ag3xYkwse6UB5WiLdOZ6SveIRtWgB6ovS5OzpUDTvIEBz9pmsuxqByHec4YkMkupjE0IDuOY2f0J1STVu8OCyEuYkLVO1Z5LZTTNEvdRzdp5X9jRovE9HYAeGDmZ5IFi44Gxs2yM5TlwioxEX62hmUfglOnZ4S6pL/ktMLvyOjSz60RE/EEUJDTqjRz3rFGquLDHjhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s1AXOjqK7Zh/8g0QjNTicma1iqBPbyRrbdmUBx8soSQ=;
 b=ypZefSO5kM4s3azrt3h2VWUg7KF0YBlW4gfUVeMAI2zXIbL2sCGH2xVmu5BORAwAKAU9xfTxVTJXKTUKqvTzIzWFk1C4qBorGAMNh0XE/KHoKkJ4tVb0kvLCxk2R4JA6iaLivmFxVkeNFh5m1317pDGvSVDLZIhin0mh3AZItsfCCPPiAjV0+ElxdwpB3c8/TbFnV1HRALNyhV1rEn7DjgQK6tOicoDHkjTiAbY5LRdDMnqYO3VsiZ2UMbg5rIbfYLYmihwQtHe6DYcXu+b1mK+oABrHbTmR42C1NfLBsV6ukWeJWYok8K2VhiazOte6bMVV3WcMeo+DCBk01fecyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s1AXOjqK7Zh/8g0QjNTicma1iqBPbyRrbdmUBx8soSQ=;
 b=FPi+Oyt8H94dLk3OFfi5OmN9sirK/w/BoBvqMwtrRY2tZjAvm+J4gnC/4uMy7SzRawtSBZsEIftwdsv8tkQpNjDmjx10B0PoSy3xgMS69DmfjQfJiQO1zrRKZQXsmPdPeZtgI3S/tEqxCMi12axqK9gsY5mkHCuoYIme2rS0RAetrgnbVvTUGmKY6Qv6E+pMyAalHOV3IKNX2LzCFAtqM1us5RRV0XAqgXwKoQlinfZIdIAWl2hd5nAacLUfYBnpqW0qyUhpbwnBjQgnBkXpU8lujb4iZWXrbFuIVe/uqpL0JDrkASnFYWMGYhZYrc/v1M2hUN18X9urxC0HHiPP6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <a7991534-b200-4b00-9a45-2d4c167d7ec3@epam.com>
Date: Wed, 12 Nov 2025 17:56:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86: Remove stubs from asm/pv/domain.h
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Jason Andryuk <Jason.Andryuk@amd.com>
References: <20251112152235.224001-1-alejandro.garciavallejo@amd.com>
 <20251112152235.224001-3-alejandro.garciavallejo@amd.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <20251112152235.224001-3-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0127.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::13) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|PA4PR03MB6781:EE_
X-MS-Office365-Filtering-Correlation-Id: 939fc7f6-9e2a-4a7b-2e43-08de22040297
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NUxSRmgxZ0NRYzBmd0dWWXc0R2p0Ylp1cm5vNno1SG5uV3gwYjUrRnY4STdr?=
 =?utf-8?B?QzFTeXl1NzU4SVNaUUlvWFJCNDVhMzdCbmJGZ0dnZlltNU42REhlQ0Jwd0sy?=
 =?utf-8?B?NWpXQ3pzbjNPbFptNGh1YnNkdjFsR2ZUTmhhelFqQ3FwOTBENjBCMmFiQjJl?=
 =?utf-8?B?a21WUGNqb0VjVEo0SFpHVW9HV1V4WU4zOERiY0huY0lRaHVEakY0YXRab1VL?=
 =?utf-8?B?elRrTTVmeDFFOFNRY2czd29WQnpEQUtJZVcyQnFqL3A1Z1Z6NUlmNzkrM0VP?=
 =?utf-8?B?UytLaHZqellzVDYyeUpGTzdJZmsxQ1JuU3kvRkFHK2R4S3hldUlzQ3JCTU5J?=
 =?utf-8?B?ZVhuM3hzTmwvUGFSV3RLRm4xL2dhRWtVL1lBRnlkejdqZVpvZnFKL1RZV1VE?=
 =?utf-8?B?S0dCUlhVMmg5NFYxK2JQS3ZOMEg5YncxUEpIbzVHRUVvc3NMS1VhN3dNSldj?=
 =?utf-8?B?VUtjMkNRbUoranRtb1crTDdCZjZ3Q1Y4WVkyeHV4ekhsZG1Vc25kUSs3Wm9o?=
 =?utf-8?B?ZHJXTVZzcWdXTC9LdEF4NzVDYVFURTd5V2JDZmltbDcvVCtaMkJYRXV6WmJY?=
 =?utf-8?B?Q081ZGxENHhNL0NyL3FPcVpXazkzS3lTUmlVU0lGNnhrZHpMYjh4dkgzWmFE?=
 =?utf-8?B?MDBSYWtyRVY1UGFkV1lXQ2pYVkpZa0tjVXNQNUw0OE81TS9rMTB5dDRJcHMx?=
 =?utf-8?B?TG5VRHE4VjdiN1hQWkdndHd4WFFEQ3VKd1NCMG1VUzhtRmc1UEh3REpzeEZ3?=
 =?utf-8?B?TVNrbzUwODRDamRWU0dHNmh4YU9qaGcwMUFtZng3TTBCMGVHMWF4YjZqRkF1?=
 =?utf-8?B?eVNSd3dYSlRya2F6WkFOU0dNZXpVUEJzUEovM1JPMnZTZW5RU05RS2hlcmVs?=
 =?utf-8?B?Rm1Ocjl2QzIva0c0dnNCNTY0UThpNGRTZkNKMU5mMnRwQ2FzZ2lGTmdsT1lp?=
 =?utf-8?B?QVRTRWZwWmtFSDlUT284QThIR2NUVUkwZzJqM0RPZ1B4R1hLS2wvemNMb2oy?=
 =?utf-8?B?TXgwWlNoeEJSNzBaOWdkZFNXWm5nMWMxYTg5aHNJYUxsUDIyL0c0WHVzOWNI?=
 =?utf-8?B?VE5nUmY5Q2wwVEZlSDB4eEdERldxM2w3cUJIT2M0ZzYrTWJaU2R0cExNS0JH?=
 =?utf-8?B?Q0Y1eFV4WWZaZkNvemRSb0c1bEQ4SzlXbXc1cXVreUpXTTFMaTI1NzF5S3o1?=
 =?utf-8?B?V3FubTFic2NGSTlNbitlWGpZdVVTQlRaaXpHTEppQ2Iza3c2Rmt4YWRYRkFF?=
 =?utf-8?B?VEpUSG9WSzNONE02SEJqUUVRQUl4N1lWMGZtajc3L1FuSDVRbGZmZnpUbWtk?=
 =?utf-8?B?bENFdm5sWTdJRlZvMWpsbUtWNzFKY0xXNjA2NUthQ1dSeFVPMlR6d0x5akds?=
 =?utf-8?B?NExSeGFYemVqYzlxdDVDUDk5WWZpeXVaN1ZrYmRqSEJjS2VDbGZiWklnZnB0?=
 =?utf-8?B?aGhGTVNEL1VyazJBUnpCY0o0OEc1bmlnYWkvZlJrOFBoQVRTSDlvaDNWZy9i?=
 =?utf-8?B?bHVUbk1RUTdFSUNHWU40ODNUQTYwRUptblpEa2U2TVRwRlVBZTEzczA4ZHUr?=
 =?utf-8?B?QnAxWDJyTElLazhVQ3E1S1Jxb1BvTkcwcHJrYnI4U2xVZGxNM0VwWk5IVEhK?=
 =?utf-8?B?djM3MEZ4Rkcwcy9PM09FOGlacDQ3alVzWVptNHlkczQ0emtydFpESTJoNlVV?=
 =?utf-8?B?RmZtTDRzTlRJMjV3SEUvM2dpaGU0T1h1eGVUeHhobDZ6MVBZaGQxbW02Ryt4?=
 =?utf-8?B?ckl6TXJGNi9hc3ZOQTdOM2ZqRlNWWFYxdXhiVnQvcnZldWhFNDRuM0c5ZW0z?=
 =?utf-8?B?enZDU1pTeDEvUEtlQWlSZ1FrbjdCYXJhUVdzV00zQm5ZbFY1anVkNk5ySkpp?=
 =?utf-8?B?MGZxbS82MjUzNXgwR3ozVWcralExUnVReGFjOUs0VWJrNUE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VjJMd2FXTTdkMERyekpGcVdPcm5ya0R3TUVFc3pQbmxWVmd1ZE54bVhWTzZW?=
 =?utf-8?B?WDRnczY1UXFwdzNVQkRibUNueEVhWEQyTVZ3ZVQzdzJpWExSU1p2OFV4M2R1?=
 =?utf-8?B?ekNqSGV2NDNJNGVVNHRoWG1CVGV6M00raitSQUlsdi9CN1Bnbm1nRE9ZQTJP?=
 =?utf-8?B?WVJMWHd5WndOSUF5WlZYVXFwa1h2Q1RWNEV3RDdyVTQ5SU9yODFnNjI5VXdM?=
 =?utf-8?B?VVhjZDNRZEJpakV2R3pnUmtTcDYwZkNicEhnM0p5UmxPeWI2NW55ZUZ4RVNU?=
 =?utf-8?B?RzlDTkplNkI5RDIybE9PdVM2bWc5TnI2L1A2bEVpMjA1eGI1MVVLL0wzRFVZ?=
 =?utf-8?B?L0k3b2tHeEcydzlUSlF6RWMrSWdyQy9RaHl3ZDAvTDJzNldRL0xNUHdOdDly?=
 =?utf-8?B?dXlxdVRMUllQOGQzK2ZpZ3NGb3pyNWE5L096M09PUGU4WkptaEYwTHIwdVJq?=
 =?utf-8?B?ZWhqbGt5c05YeG9iRU9NRDZRdEVNNmMvOXVTOEVXZDg5ODVvQ0IyQnQrZEx6?=
 =?utf-8?B?dGdmM3RJaVdyYUM4KzlvMjk2ZHdhYloxZ2s2Z2lFNTgyTVQvcllCSWNUWmNG?=
 =?utf-8?B?eGhJZTZEOXp0ZEgzQkc3dWZJRlpLaWllRm9qdnUzUE5CWUNKZlJFU1FyUnV0?=
 =?utf-8?B?KzA2TUZ0UmpYeHYvUmJBR0tMK0d3Tm5ISC94VS8xTmFwUEhGM3lxampYVSsy?=
 =?utf-8?B?YXF5Mm90Nm04V1FvV3A4Rzg1cm5TSHpuanYxd1g2ZUpBV1Vtc3pIYXpaOWl0?=
 =?utf-8?B?S1Z4c0Jtd3FpOGx5MmpCSHZEWE13MDhZL1hSd0pIbWUxeTZOWUpKUlB4VlRN?=
 =?utf-8?B?bFFOdkxoL3A2Y3Z4NHV0SUdBcDV5bzBNTmtaYThhYmxZVTFueU9oc3VIOFFE?=
 =?utf-8?B?enRqaWJOeWhrMElkUFZzSXJzZ1kvMG5LVTYrZmVDdXpvbitZQWhKSDI3eERX?=
 =?utf-8?B?V2ZzZXllckYrcEU4MXlPQzM0dTI1cDk1WTY1MURtWUN2VVRBRFBOMUtGZGJ1?=
 =?utf-8?B?bHdySDhkUnljemVlT2lJN0xYTmNaa1I2QlFaVEJGeGxibWpBSkd4dlNoa0hk?=
 =?utf-8?B?ZzM5S1pqREVQb1I4SjlEQjVTTW9Db1BpdW9vVGg2bWp4dWFJN05YSWdqZlha?=
 =?utf-8?B?KzVOT3lhT0c3Vi9lY2xBWHZSRi9zUDZGTy9XV1k1SUtpWG9jYjFZcyt1WlVZ?=
 =?utf-8?B?TXdlc3lxS1pIcjZoNWRJd054emtTQkczMEJiNkxORnZENE03ZzFQVHZ1RTBO?=
 =?utf-8?B?bitqSUZSWm44dGN3U1J6SHlnUDZyOHJDS0kzNkVCTzRKcjNHOTltUVNOVUZh?=
 =?utf-8?B?c1NFa1NaRXpNMDVOd2xxbkJIRlltdFh2Rm1XejRmMzlxQlkxMXVsQlVJS2Rl?=
 =?utf-8?B?Yy9acndwK2orRFAycjVsR244Q3lGcEhMb0NnYi9Kekt3ZlpQRmhQdGgzbmM0?=
 =?utf-8?B?YTd3RUNidG9PUFVOZ1lVbzdtVTNMcHRPMEc4NkZpdlJCM3BrY1hnc0hYcmFT?=
 =?utf-8?B?aTB1UW5id012cFU3VGtMQU1kdjczYXVFU1BKZ2F5NGhNcVpBTUhyV0ZZbTV4?=
 =?utf-8?B?b3lqUktUTWI3MzhISWlDNHBXRnFiM2ZpZFNPUmJMT0EwZXR1a3VoRzErTlB1?=
 =?utf-8?B?SUNvdktHM0Q0Qjk1dGtJTU5WV282LzNWTGM1MlI4VWU5RWhMdU04R2oxVktV?=
 =?utf-8?B?K1RyMGRqM2w0WjJLYlZnUmI5RFM2UW52Qk9MbzNObXhycTFDRTVvMDhGcWlm?=
 =?utf-8?B?VnhwVTI3Qkk0Z2FQN3dGcHltRm1OaE1wbGxjUDdqMnlab3hBeDNwMjF3K3BM?=
 =?utf-8?B?QWpnWjJYYmtPUlZmSlNoMGxaZXluMTIzNy90cmNLUzEza00xUDVSUDNvUEx3?=
 =?utf-8?B?RVQ3NGtSMXI4YUxCeVBkRnJua3dLTlBvVjZDa2RLcGRvREpzQXZYOUoyeEVT?=
 =?utf-8?B?TllLeVM0TmRGS1BzRWFaYWl6NkxZUGNmOGRDdU9qeGl1cVV2MmNpeFRyRXdt?=
 =?utf-8?B?SkVhRWNKN2hFdVJiVXYyL2FlQ254K0ZoMHpjRzRsQzJ4eXFQS09sMm5YelpK?=
 =?utf-8?B?dEtiZ0Rub2VEbUNreElrdkpGUUtOQzdlaDBUbkZ3cC94WkJQVzl5eFVPOEpE?=
 =?utf-8?B?MUtIWkFjSjVMTXg1eU5TREJJU3BFTjlZY09FelVacmFMT0tBaHZZQzZZK1Ja?=
 =?utf-8?B?RXc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 939fc7f6-9e2a-4a7b-2e43-08de22040297
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 15:56:15.2903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: duw3wORrOdOo4GA+kt6R9UhSZ2zkMANGJjQXqfcbtB4zOJwiXibQU3V3llq9nJx2zP+QSUFiwuTf8XhU4+8l0VuAwtgk40FxL2P03Qlmwhs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB6781



On 12.11.25 17:22, Alejandro Vallejo wrote:
> They are unnecessary. The only two cases with link-time failures are
> fallback else branches that can just as well be adjusted with explicit
> IS_ENABLED(CONFIG_PV). HVM has no equivalent stubs and there's no reason
> to keep the asymmetry.
> 
> No functional change.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> ---
> I'd rather remove the "rc = -EOPNOTSUPP" branch altogether, or replace
> it with ASSERT_UNREACHABLE(), but I kept it here to preserve prior behaviour.
> 
> Thoughts?
> 
> ---
>   xen/arch/x86/domain.c                | 10 ++++++----
>   xen/arch/x86/include/asm/pv/domain.h | 25 -------------------------
>   2 files changed, 6 insertions(+), 29 deletions(-)
> 
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index 19fd86ce88..0977d9323d 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -571,15 +571,17 @@ int arch_vcpu_create(struct vcpu *v)
>   
>       if ( is_hvm_domain(d) )
>           rc = hvm_vcpu_initialise(v);
> -    else if ( !is_idle_domain(d) )
> -        rc = pv_vcpu_initialise(v);
> -    else
> +    else if ( is_idle_domain(d) )
>       {

The is_idle_domain() wants to go first here, i think.
[1] https://patchwork.kernel.org/comment/26646246/

>           /* Idle domain */
>           v->arch.cr3 = __pa(idle_pg_table);
>           rc = 0;
>           v->arch.msrs = ZERO_BLOCK_PTR; /* Catch stray misuses */
>       }
> +    else if ( IS_ENABLED(CONFIG_PV) )
> +        rc = pv_vcpu_initialise(v);
> +    else
> +        rc = -EOPNOTSUPP;
>   
>       if ( rc )
>           goto fail;

Actually, if you are here and have time and inspiration :)
- if ( is_idle_domain(d) ) staff can be consolidated at the
   beginning of arch_vcpu_create() which will make it much more readable and simple.
- mapcache_vcpu_init() is PV only (->pv_vcpu_initialise()?)

> @@ -614,7 +616,7 @@ void arch_vcpu_destroy(struct vcpu *v)
>   
>       if ( is_hvm_vcpu(v) )
>           hvm_vcpu_destroy(v);
> -    else
> +    else if ( IS_ENABLED(CONFIG_PV) )
>           pv_vcpu_destroy(v);
>   }
>   


-- 
Best regards,
-grygorii


