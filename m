Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 409FCA66FC2
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 10:28:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.918812.1323444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuTEw-0007QU-SV; Tue, 18 Mar 2025 09:28:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 918812.1323444; Tue, 18 Mar 2025 09:28:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuTEw-0007Nw-Pr; Tue, 18 Mar 2025 09:28:02 +0000
Received: by outflank-mailman (input) for mailman id 918812;
 Tue, 18 Mar 2025 09:28:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pdr/=WF=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tuTEw-0007Nq-8Q
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 09:28:02 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2418::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47efe73c-03db-11f0-9899-31a8f345e629;
 Tue, 18 Mar 2025 10:28:00 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by CY8PR12MB7219.namprd12.prod.outlook.com (2603:10b6:930:59::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 09:27:56 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 09:27:56 +0000
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
X-Inumbo-ID: 47efe73c-03db-11f0-9899-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X8RYZ5amA9mGjRBgJ8hUVmaCNRrv4smOh8k8TQQrnIjzfylBvc74G61wbo4FEVz8cnmpF+UHEzAN5fpuKOLABVbCY+nGWrVjnqv/VLunrVEgwVkgCydK1Ba7h1Opubni8Onf/T198X8dkV68SAcCuq5KEfQxqRACDMb5r57CdGmyja5rRv5wM0WBPEs+XH/a4C+hvHUZbIOmUQZ92yFOjlOxg3jSCZ1v6ocu+2kkRYUZOsYCj3VxX9h7JpMB1jy49EL9NI0ePXeohCVEBYvV0u6gC3Vc6RYFVmo4a9a1DFz4Ly/JbSnueL9BkYqP6Q5JVrPhscUaOq3vp7grQgUVrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T/O7wNlFPGsEwsaISIMFyI9Ge35oFGmJaziUpVlM1f8=;
 b=JqiaIeG52ltBzjTfe0lwZouuWghucrtJ/iGK7w6H9lBlsHX/C3JYuE8zuqAo9JEq600lKDQUsJmxKg8KbI7QeSwMpCqDoGIg+xRrb04ETjb+MRW8ShXpfAH3v/SU0oivijoSEutP7zxbxe1F7x9ROF7n9JBAMRbyyUcfmyRZGh0ekIfhG7he6CRCES5hqnkpuA1cjdLEKUCuYykvWQ3pAIg8h2cfXJDIs9qHl8RlVJCBau/KUOA+cYtF0F3omyLoQtbJTt+S2uROx/d/admvRHexaM/2RO80VMyScHTjTGGIni7pcgsCBnu0DOExVOPF/+CxFKhDTXoIAj8bxQUd3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T/O7wNlFPGsEwsaISIMFyI9Ge35oFGmJaziUpVlM1f8=;
 b=oa4BTfAeN96qACjFXX4ydAoGmfIDK5WEn16RuBvWxm0dglJp7N7vYgdwDkH5/D/LE+2Ub9IEXG1cWXOFDs6dzILxsZSOrKUHQW1x4qEZ28o53ZC0CKeEhnf76b/PKBweg3HjxaVfXHwY3sGo8QspWHv++rkfs1WWUwryQekB6yE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <81247bbd-8071-4dab-9a82-1a6eb0738625@amd.com>
Date: Tue, 18 Mar 2025 10:27:52 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] arm/mpu: Create the skeleton for MPU compilation
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250317200727.798696-1-luca.fancellu@arm.com>
 <20250317200727.798696-8-luca.fancellu@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250317200727.798696-8-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0369.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f8::9) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|CY8PR12MB7219:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c2a77a1-c852-406e-47b4-08dd65ff2a7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NVdVUWM4N1c4bGljTFB4VlYrelVtYVpPZ2g3US9ERHpKelZLNmRkaU5XTi81?=
 =?utf-8?B?UlZoc3hCQkExRmJ0UHBwMkhtL2ZYcUVyYzZxUFRqbWdHTkhiNzhBQUt4eWVZ?=
 =?utf-8?B?VjVVZXhDbDU0ZlAxeGlwVktKUWx5ejBOdmdzbG53K1R0UnZ1cm9rbElHS3pQ?=
 =?utf-8?B?Q2N0dzBuWFFKVFdRNWNOS25vbi9ja2lMRWloMFZnbG8xc09iT255SjVyeHdF?=
 =?utf-8?B?UXhGNy9zMzBaNjNLN1lTQ1kxbWgvdkFoUThHeEZGc0VCUjB2QjNTRzdselpt?=
 =?utf-8?B?WEwyR082NE41MWJvd0ZocHNiYmd5ZFBIcWVWcG9PbzR4WnBlN3YxSkl0QzBS?=
 =?utf-8?B?VFYrVndJZ0MvN2c5UUljTWZyWGFmdGVrN2NERXpMM0c4bm5CNnVVU3lOMDhO?=
 =?utf-8?B?MEczeUFFekFZZWZoMnBZUkFqMlF1UFVEbnlqRVJ1OUpVQ3pSZFNwZ3lGTkpN?=
 =?utf-8?B?U0c1NXhnUWFUTWtvbkVTRkRhQ0FjOEJoRFArbG5xLzJFQmFNZDYrdnpTSkFD?=
 =?utf-8?B?aHFjV3p4SW1vUERrSUJUNDZBaGFIMHNuL0VDa2hxS2RwaWVVWWJPcTdaaHZw?=
 =?utf-8?B?R2hHblN5ZXdlb2ZqWDJadHZDYUlOR2RWYkpleHF6am1KRGRDMUZEZHFGbVBM?=
 =?utf-8?B?MG41V0ZXdHF0MWlZaXg4ZXFmMkdma2pOdFRZcVhlTTkyVDV2T2oycFJNV3V5?=
 =?utf-8?B?TlVqV1Z5ZXZBRlhkVHNXVTZvZmVLQ0xqaC8xY05qWmpRYTk4ZVNsNE5ETG1U?=
 =?utf-8?B?NjVWTmpkS1hQVkgrNUltOFEwYlpQYWg0Z090Y0lrKyt2eU5wSU81NU9STWlB?=
 =?utf-8?B?T3hVR01Gb01sbm1YbWZPTmcyV2VtZGx2Zm9aWkY2WXlPTDhPS1Vtd0hWQjhv?=
 =?utf-8?B?dTNEaGUxYUQ3S0JaUGhPeUZwdTA2VkMzRGplNHBMclhkNFloa2lQUEZrck9R?=
 =?utf-8?B?dEtmTEtPR0tsVWl1YmNPbFlZMXA1MjFBU2FGTUR0VWt5VDJOK0drc2RzRUtI?=
 =?utf-8?B?ZVRtaUNNUnRJWG1jRlU0Q1M4Y01icVg2ak4wU0VsZ0hKRlFCcFZuWFFocFFL?=
 =?utf-8?B?YWJxT01PUzNPZmMwNzhJYk1vV0pzeEpoQVVXR2YrQmdnZ3JJT2RVb0RBL2Zk?=
 =?utf-8?B?V0R3dmFGbTlHNGJaNGU5alhrZ2d2WEhRdHhJZGlJQlBBb2JrMlNzVUpkYkRX?=
 =?utf-8?B?ZnlKbXR1QU1Ka0h0ZnVBVDFGMmovV3lnQjRJZmtWaWJHYlJFL1dLbzVaWUY0?=
 =?utf-8?B?SnBJNlVsUXZLZ2oyU1lWSzltSlViWjBCa2VGUEI1dElPMEQybi9HUXRDMEl6?=
 =?utf-8?B?aE5HOVpzYm5HQ2JjNXJqWDl2Ymk4andReS9zSW9adk1jQUhpR29rbXFoQU5H?=
 =?utf-8?B?OEdtUmNPVkRGNTFNZWpHa09wYkxFMjY3cHQyTkZvdzFLN21vemlYVUJiRnZG?=
 =?utf-8?B?WmxEODZwM3FOMmczSWY1VEI2NUpvTG8wMUtSaWQ0U0ZkaU5rbFRoSlloUnkz?=
 =?utf-8?B?dWNUWGNyeXB4MytKMmVxYTlpWjZFdStpU3NYaUNFRkx3TllMaHlDdzN6UjJ3?=
 =?utf-8?B?S0FmNDV2eklHQ1lPRmVEU3NRcHlQSXZXZU1WQkpsTTAwUENYRS8xZVo3TVlG?=
 =?utf-8?B?bXIzQlhTbGpLSWJTaEdPYzFhMkN2RUVwcjd2bWlQM2ZOc2xKNjRSdHI5U1h5?=
 =?utf-8?B?VTBBT2RrTjBEdHF3Sjl2QWlOYWhkV1NZaW1LMW1ENzVCbjhDSFZzVmlUN1BX?=
 =?utf-8?B?Q0pRUXpCUVJxWWpscHBTSDAvMVVpbHVWeU9XbysyMzVDcU5zS1RwQi9DOVJN?=
 =?utf-8?B?VHEvdFp5NDE1SW1uZ0VRbFZFTXNoanl5VExaOEhVamR2ak1vOWk5c0dwUHVU?=
 =?utf-8?Q?c/r85U4EVTcnj?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WVFCR256TEEwOXpwREs1TURvV25rMTZLaWxRTml6N2FadUNGMWdtMlowaTBC?=
 =?utf-8?B?UVlaU2V0clZ5UjVkY3M4RjZ2eTk2VDNFWnhBWTlVT2g4YnNwQUNTa1N5YXpO?=
 =?utf-8?B?ZllQTmNGYVNiNGdIaHdzdmtiZ3ljNUlyUG1ZUHdWNjdwOHl1LyttR0w5R21o?=
 =?utf-8?B?RjU0WDVhWG10OFlEbUtsSHE2ZW83bU43bUpIN1pac1lPL08rcVU5ZmxVb1BQ?=
 =?utf-8?B?dnkwSEI4Rm9FODVnck15YWpmbm5WNDNSRzhrK2RWVkR5VVFLTzRZV3huNGU4?=
 =?utf-8?B?anYxZlFXWXBnZjBIb2xTeU9NRlVRK2g0c1NZL2pkOTh3Q3BQL0M0RE5kUy8w?=
 =?utf-8?B?dVJBRkZuRGJhSy9Ebmo5TTBhSlAwZUp6UHBpV1IxaVpKQjVXenBlZCtSTXJU?=
 =?utf-8?B?TnZvRzZBQjJMdGJNTjFwTlNIMnZpSlk2czBYekRvL3V0MHc0MEZtUTBBaW1h?=
 =?utf-8?B?MGk1S2NaTnlqNGdmWjlMZ3FrRVZOTk9tVVRxbWd1Qnl5TlZPdE5pV0JCZGV0?=
 =?utf-8?B?V1BDOUR2Y2RvNXlRZklGZXEwYlZkTDlLOTVwTlV2Q3QwVXFzdWZ0N2RNbUV4?=
 =?utf-8?B?azZoVGNBbmI5ZCtxZnlVY2JwTjdFdm02QWJMbVg5R2UzOEo5N1hMZkUvQ3lt?=
 =?utf-8?B?bm1CRTVUcVFBNGJvaUpKNGdGQkl4VlZHd244NTF6WEwweCtlaFBNRE51L1kv?=
 =?utf-8?B?Q0toY291UjY5TGgxTmp4S0hVRDFpODRFcEpIOXpOZWl6cXpreEY0UEJ6TnV4?=
 =?utf-8?B?UFJicjNBTVd5UTZhR0hUdmtlVEp0UkxxWkI5bENKRjlqcXEvYjRuT2ovdVBB?=
 =?utf-8?B?OWpaRGs1TWRrc1V4V1JPRjNVTjJuSENsTEpSbWtMTkVHTmxvSzh6TTNlWU14?=
 =?utf-8?B?bzlHRGVLV0ZRREZ5M2QvVWQwbzZ2WFJBbU1kSWZOZ01vMlpic0V2dDlQOWZp?=
 =?utf-8?B?c0JlMVlTQnBWMy9GUUNGOTh0TEc4K2xpN3daSlNWYTUxcTZNZGpTTjhPQ0VN?=
 =?utf-8?B?eFlUMCtmNjYrRnpMdDJTb2VocHBWY3BDOGRpVEFRc0tKa0lJUXE3ZlhxdE9B?=
 =?utf-8?B?WTdvY0VFVG5TOWRtUUNkMEVkQUhWT2g0aWxSelNjY0NWWmNiUitRYUREVFhs?=
 =?utf-8?B?VGJEdjFac3RBNmdyT2k0VEo4SW9tem5yQ2pqaDY5ckY1SE9iZWVCQnFYamhy?=
 =?utf-8?B?YTgrVjJWQ0dIR2JXN0w4bUhjU3JFWjRldWlWS3UzZFE4YUozTElyYU1XM1ds?=
 =?utf-8?B?QkF5SWNYa3NTWkNoWjc4NFhCQTRqT2J6eXowekYyaFlyMG1WdFFPU3hTK1Yw?=
 =?utf-8?B?MWtlYWJ3RjBJZk5uM2paQUNRbDZzWFZxMjFaa2FsY2hmRjBNMU8vUXV0RlpI?=
 =?utf-8?B?SU5CWXdjaGswcE1tS0VzYUFrcFhEUHhiK3cyT0dJQW9VWklZVHIvcGthK2pt?=
 =?utf-8?B?TVJ0VUN2Q2dEdlJtdk94T2FUaC9MbVlGUjYyVkJNSStJTXdFQU1xMis3RlMx?=
 =?utf-8?B?OUNJbG9wSFEvdUFhQkd3VzNKOGd5MFhvTFFlQTlWMG8zQ2JVcHdOdzc0QUJk?=
 =?utf-8?B?bFRhaVVFT1JTNTRsRUxkSWVuR1cwV1E0SGhENkdSd3Y1Zlo1amhiL25udExP?=
 =?utf-8?B?K21UOGdUQnN1L242SnlKZjJXbWtVZW95ZEV4emdwazhxMTlnV2JETk5ZUW5O?=
 =?utf-8?B?RVhSdW93a055b2JaRUNGc2UxQ2xadFRCYVFiUlp4NERnRzFFdlZpdDdkUGNy?=
 =?utf-8?B?ZzhRRzZ3ckxwUHBNVTdxVFVRNXFlVkpBeHVTdWRsVUpnM2dxNHVxVFJVb2g4?=
 =?utf-8?B?N3JjRGdXZmpPb2cwTmU4YTJwVThlakJYczBKc014NjFQdWxNVnVwV3JQQ3dz?=
 =?utf-8?B?KzdUdDJ6OUNLVFpUSkN1OGcvUWFBZTJPTlB3OHBxOGFMVHAvKy93eVV1MEJo?=
 =?utf-8?B?eFpUNWg1RjJKQW1EbHJNcCtoQW51cmlLSHNtbnVudm5KUFNiWmJmUDBDUHJG?=
 =?utf-8?B?V1ZvR2oyVUZqMndXWEhyYzZmZndkZ3dsRjNqOGVMRlA3VG94VEJHZlEvUkFN?=
 =?utf-8?B?dmRReTU1NDFrQ2pwMFVEL09jM0djS1A0cEdkSHdlV1FaaEMzcXdlR3ZNMU9B?=
 =?utf-8?Q?b8oK+QepPmLWhp6fTSXYX0aoh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c2a77a1-c852-406e-47b4-08dd65ff2a7d
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2025 09:27:56.2559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QqLy3xbclwIzUjdigfuagE6QYbemzDCGUzPkWbMMpPx606pN43wGcKPZ9rTs/RlB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7219



On 17/03/2025 21:07, Luca Fancellu wrote:
> 
> 
> This commit introduces the skeleton for the MPU memory management
> subsystem that allows the compilation on Arm64.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


