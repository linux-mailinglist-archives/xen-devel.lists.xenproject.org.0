Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7C6A87D57
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 12:17:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.949541.1346044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4GsW-0004uc-8p; Mon, 14 Apr 2025 10:17:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 949541.1346044; Mon, 14 Apr 2025 10:17:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4GsW-0004sa-5P; Mon, 14 Apr 2025 10:17:24 +0000
Received: by outflank-mailman (input) for mailman id 949541;
 Mon, 14 Apr 2025 10:17:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m6tK=XA=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1u4GsU-0004sU-BQ
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 10:17:22 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062e.outbound.protection.outlook.com
 [2a01:111:f403:2412::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a55efce1-1919-11f0-9eae-5ba50f476ded;
 Mon, 14 Apr 2025 12:17:20 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by SA0PR12MB4478.namprd12.prod.outlook.com (2603:10b6:806:9c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Mon, 14 Apr
 2025 10:17:16 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 10:17:14 +0000
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
X-Inumbo-ID: a55efce1-1919-11f0-9eae-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mIxeIuJYhS+2D/PH6273bTvQpqhfrY8BMS9I8AoduZ5rcEJcuswCMzKFphTAm3WCBiW1yEHnqsN501FwaHWGf/HzAjZpkQds9A56uwy0kWGESoyCUZe0X2dOSTYFpKZ2mn1F5uE18SrwK0XwWK32v2lPWSc393XM90YvQpCFTwjqp3EJgJ4E8Gsww6SzGHzwvO1t1NPoe4eVtlEyExFO5PiPnSWznONNkgQVckP/+64Vsq6nxHJ2QrS1lZjMP7z7inuKQCmhWLyc6nihSc3a9U7D+Er8wwpSBDOK4MFRm/mZWh2AUrQZLOT5m56xb7OD14vS4eYP4YoHDsRBz/didA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5euiR6XBoBo/bwRaO8bLXWl9so0RPt7EqR1RZMS50ls=;
 b=BqQeU9R28tw07BKqLjUol0WrZqylRYpEOV+0Gqb6GYtzMaV2GZOcfiPxwqlvIus7JBhIkBTBeDNrLgVI2xqCIrrqNbYncE/ABvLBHSFzf4rz2RH1aHeYi1M5w9PRV2bEWaIZPUV3gPd7ySVcUubmP5F7xSfTrELXy3lszOyKtqe2wNiuHh+Rs0yJ/DmcECDFnDzcELjrl2/Mc1zsmCAQtPvODYl4k2WdcIBMGjY0Thz2RWkktNnb6KwHy1Mcfkk3SWJSB4Y8PieG5PWHY68sOkK6yXtskZPIwnrfKCjZVqlLIM67n7yRcu+XdAz+6BxiaHltjyTxvqmeZhvsc4GIFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5euiR6XBoBo/bwRaO8bLXWl9so0RPt7EqR1RZMS50ls=;
 b=UDuK0dvFxmxfmAUnYWd0yMRktl5AuqfxYNpswjMP7hzkgkD2ZXPgu+gdAAoHo3eIqDzmRAaELUVZNFmqPEv9ZgcNPhOmwSUtEUaTNGylLb0srncCraZDznWxdIvEOEmw6nQzaFbhy0PmxcO3goIogA1Bl4BP0voRZG/Ol4p728k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <d323425d-b266-49d6-95d4-0e1acb5e489e@amd.com>
Date: Mon, 14 Apr 2025 12:17:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] arm/mpu: Introduce MPU memory region map structure
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <20250411145655.140667-1-luca.fancellu@arm.com>
 <20250411145655.140667-2-luca.fancellu@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250411145655.140667-2-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0123.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::9) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|SA0PR12MB4478:EE_
X-MS-Office365-Filtering-Correlation-Id: c77b526b-a123-4c43-a421-08dd7b3d86cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UlhJdXpiMWhLd2Y3TngyeWVKNjlaQTRRREZ5aHJ6b2QzVHRvN1JxOWtRMjlo?=
 =?utf-8?B?TW81d2RhWlF1dXNtOGFoWFA5eXVCand6a2pxMmc1T3Q4UmV4M2pJMUg3WUlL?=
 =?utf-8?B?TlJWMDJvT1plUVYydllOSGZkajJpRGhBK3d5TnV4MG5venYxamlxL1R0T0Ur?=
 =?utf-8?B?ZkRzSkVQdzErdlY4bUtzZXlzRVVQWVBMSEVCMkhONjA4K25BUytMY1RFQm9W?=
 =?utf-8?B?QzBOa3ZYM2FtTTMvVCtIVVd2OTFFM2kySWZ0TzFxOFlTdDJSYTlSRVE5alVa?=
 =?utf-8?B?b01UOForK2tJL0F5YkhCVDliZU9ieTNTS2M2eTNWU3dtMlRWSlhTRnMrSUpJ?=
 =?utf-8?B?Q05SeVR4WTd2SWYxUDdzU0RLMmlMdUFTRCtza3kvZVBrVFhlRnpNcnprdTMw?=
 =?utf-8?B?SnNiOFQ4MDdISXo2KzQweDVaMlRHbzVEWCsyT0VLeTU4MU5tR3dtMUFXUWxV?=
 =?utf-8?B?OHVoZlpjVHFoVDk3bk9ybWx1QktpYW5uZTcyM2c1UWpmTTNkNlVraGtrdTF2?=
 =?utf-8?B?YTZPT2RHL1FWMDE1NHlod2hCcE5UVUNiUFNuMjRtRWZlQkV3Q2xRb1JxT2hZ?=
 =?utf-8?B?Tzh4SUFnMjZOZmtFRjZNNVgzOHZ3ejlLT01FZS9NY0FFWFNKQzE5d0tWMHgv?=
 =?utf-8?B?Z1h1ZGhIaFhHNUZnSzNCcEVKMmN1S1dqeUZhaFVzcjhZUEQ2NktuWlIvWjlB?=
 =?utf-8?B?K3Z5ZzZjSm9Wc3FvNE1wa2dCeExYV3ArZXUyNE84Q2VCcVVoL2JJSjg0OEJS?=
 =?utf-8?B?YVNOcXRUdjFBTGU2QkZrZE84cFdiQ2Z4SDN4anlnMUJFbTF1NjErVFZXQ1RR?=
 =?utf-8?B?K3B4clNnZUduSlpTTERYU0dHcUs4SzZaZldaZmlTZjJhMFk2cjJZSVFmelky?=
 =?utf-8?B?bVNmUUFBYUFIRUZPWVhSU0hhK2FWS3E0RkpwVFFGU2RTTVMrcDZQSjdwR1NV?=
 =?utf-8?B?V0ozelhERDBabkN4TXdCdG4zNDkvKys3TjFyaTY3V2Fka29Ca1NZRjBZY1VD?=
 =?utf-8?B?S3Bod3d3V0dBME5aUlBRcEg4OEFLVXFzRE1LaGw1VU94eGcvZklkWjZkOTZt?=
 =?utf-8?B?VjZDOW1TVi8wMDRKbkdvVGpidHE4d0NyZ0pDMzBwbzdoUDFRd2JOQ0dMdnJ5?=
 =?utf-8?B?MVYweXdZb2o0Q0dsQldhU1JTMHp3c3pwUkpKRnh5by85OTFVN2pHaDMvNU4r?=
 =?utf-8?B?TDNMU09xdmxVYWdEdlN4U1NsbU5ZS2RGZmV1VDhCWk1ydGtvMnJ4MStLY1hY?=
 =?utf-8?B?Nmc5Z2hJbVRYZzVFZWMvRHRYamM2YnlSU3hnMkRYcW9pcTJPOVRBNDRObk5S?=
 =?utf-8?B?TURyTTZBdnJodjhKams3aWFrbEVmcFg2a3N0aXBBbHBydGhtTXJzc3JybmNq?=
 =?utf-8?B?VlRaaGk2UXppZGJlenQzbzJXQlRWSG9NZ2pOY2RuSy9LVitGTm9HUUNpazZ2?=
 =?utf-8?B?aU93OTU0ZE1kMXQzeXU0dXp3em80MlltMFErdDh0SzJvUGFGUGVSQWM0b3pZ?=
 =?utf-8?B?Qm5RNHlqTmdYYzU3ZWRwV2xQZGZNOVdBMWZ2WEJBcUFXeERxcnJoNklJZFhn?=
 =?utf-8?B?T05ZRjlNOU1RdTc2OVFPd0IwaDhDemZQL3RmRklGODVWUHlNeGU4WmZUaVM0?=
 =?utf-8?B?eExpenc5TVlLZUJIYURPb202VG1TMFBxanlpN2N5R25DQkR5eE0wWkdiMkJo?=
 =?utf-8?B?TWk3cm1nd0FCZUVVU1pDZjVHZEQ2aG4rVEM4RDV1S0JxeGRJWFZvUWtjN1p0?=
 =?utf-8?B?UzdqbktndzZDeGNMN2N2UTVNNWpudFhaa2VSUDd2VFo1V2hKcW9BNkwwQS8r?=
 =?utf-8?B?TjlkSU5yS0t4SU5VWXBTbFVRbDhncEdjSHlqdHVScC9FQkJ3aUVKK3dkT0hl?=
 =?utf-8?B?ZkwrQnhoMlFralNicHRXbnNvN2Q1dFJMRUE1aUNwWTZxb3VuYTl0SktMUjB1?=
 =?utf-8?Q?3szvPBYOnwo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zzh2cnNiQUdzVWdlbmFFcUVWKzVnQWdoaDFXTWlFdnpDNmlDYzRhdjQ3eFI4?=
 =?utf-8?B?NXA5ampHYm1PdTJLWUpCeklKNHdoeW1maEl5RGJUR1JjSFlGRlh3WC9KRFE4?=
 =?utf-8?B?bWtaeTRzWit2QldnK2x2b3BjRFp4MFhscFFGcEorclR6aExnREU4WGx2MnJw?=
 =?utf-8?B?d2txSFJCLzYwQVRuQkRUaGt1VnNDNVQ5ZnIzUkxLK2lPTloxOFVScDc5RklE?=
 =?utf-8?B?dzlRMkNQbnU5dndrZzFXQXozempRZzNtMkw2UHpkNk1ZVHpHQTVHZG9oRDcy?=
 =?utf-8?B?bFRKd3dWNHRCNkZDOS9WcWxLdkZDdUJzeW55ZWhyTk91Z1FXWTN4aFh2UWRZ?=
 =?utf-8?B?WnFLTnc2M1IyRUZCNDM5NlY1RVhSTS84dmpzRVhaY3l0WjQ4TVc0a0kyQTM0?=
 =?utf-8?B?RHoxYzRFQ24yQ2FsQXNCUUlNQjU2MEswUytRSnEwTWxaNlVnZDVCYUg0R0pP?=
 =?utf-8?B?STA1TFF0VWdWc1B4bmwzMnArTEk3ZGNURDE0a1hoQXRHYS8rSDRFUkU4WW5q?=
 =?utf-8?B?d1VDLzVXNzlQRHZJQU56ZjhKcVJ2aHhWdUJNNlQvRDg2Z25RKzlVckFFUFV6?=
 =?utf-8?B?aWRVN0pnNlo0NlQvZXE5U3VOSjBzY0xlYXJuYmV4ODcwblMzSkJDZ0xIV0Zl?=
 =?utf-8?B?VFZQdllpM0ptYkp1dDRoSTJWalo4a3V4eUorVUQzL0kzdlNUcWNZL3VaaDYr?=
 =?utf-8?B?WmM2dGV4cEJFclpzWHdUZzJrZmdScCtJNStwU3pTUjBnTTBqWDl1Q25FVjZK?=
 =?utf-8?B?ZzBnM2N1d3c5ZWdxVG9zR3RCeGlyelFwU1dwN0lGanlMM2FXWkRjb2lDWW9l?=
 =?utf-8?B?N1gzMzhHMGlzNlJ5VWg2d2VFM3plWklpNlBKTytsUDMraFRLaExkOWZiKzNm?=
 =?utf-8?B?S1hrZWpaakxmbHRSWEQ5cEFkZ3JuVlgrRmFobmNxMVc2c0dBaCthRFZyNCtJ?=
 =?utf-8?B?RVcwS2RiSXRmNTQ2WkJJbGk0OFpPb0xjMW1NWW9CKzBJR2RhOEJFRDcvTlZG?=
 =?utf-8?B?RXdJNzdFSXo2S1R2d0h1OWV5Mk5laWZ5bHRiaUlaQy9kTDR5d0FPdS9yQkJP?=
 =?utf-8?B?S0l4RUJtNmtlTkxCRGlJU3JIcnRiU01YUE5nRnlnbURWR3lDTlRQRlBGNnli?=
 =?utf-8?B?VDRtYm45RE9WZkhoSWNSV3lHZURFYUd5VTFkeWliSEVvRzdDbkhzTHdxSTRN?=
 =?utf-8?B?RGlPV2V1TjBuYy9kM25tc2s0QmRJUktBUmhoVVc3N0tQdTgwVzJEM2tHV3dU?=
 =?utf-8?B?QUMyZHRqY0wvZFFyalRSenNvYkZ4MU41Tm5wNzRoVGY4N2pTcWg1aHROT3FU?=
 =?utf-8?B?T0dhbjB4d2tiVjBMZXpDM3ZVeG4zdnlXS0FSN2orS2dzMnhvaGZ3ODVyeHF1?=
 =?utf-8?B?SkViY2lML0VhWmQzRk42MXlpaWhNdHdlTGdkSWJ1dVhnMWE3UXV0SktOWE1K?=
 =?utf-8?B?OXRpQklGbXBTVE5ZSkZRd3l4ZkNuekVsOEtpK1pLemZnQTYxVjVrLzRwR1Vk?=
 =?utf-8?B?NmQyMnQxMVU1anN4ZVRHcS9JNEJnOEJ3U2VZWlZiMzlxelZUS1R6QlJqK3FH?=
 =?utf-8?B?aDBzaHViNW5CeEpFUDNIS2VxSVRZSUxTSHRyS1loU3gyTHNNR1UwdFdjNGI3?=
 =?utf-8?B?dTdOTW00ZFhrbmZLYU8vZk8wd1A3RkZBRXkzTXU4UFV5cWtOUFBSb3RSdUww?=
 =?utf-8?B?VHczOG9rM05kNjBBSXE0VmlzNHZVWmcxaUo4aXFlQ0dqYkdtMVRBdVdKL2h1?=
 =?utf-8?B?Z0F3SmVHcFJ3dWFTMzlKNFFjYnpGck5XMTZmWVhqc3RoZ3d6eEozNUZWM1ZF?=
 =?utf-8?B?YXE5M3JpSlhRUW1nUVNUSUpqbDBFRW1acWM4MURrNks2L05NcWtUaG9OWGVu?=
 =?utf-8?B?OXUxWXd1U2R4OGdPVkZycHkwT3lzWC9RN283Qzh6bXdObGJQMUdwZWR6TVRV?=
 =?utf-8?B?TCtBSnF4QW5nMTBNSmVaTk45bFdNMGJRUU1FaVJULy93SHBUUFZFMkJqWGNF?=
 =?utf-8?B?by9aTVBiUjFMenVnS044M1Q5akdBOW1wNjJVS3F2aEZTOUJIazUwd0U3QnJ6?=
 =?utf-8?B?b1k0ampzRmRJZVgxNGplRlpBQUNsOFpIc2lHL3RKT0VOZWNQQlpXOEtvQVNW?=
 =?utf-8?Q?aOkQM/fBXCt8ke+omQW2s7LrS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c77b526b-a123-4c43-a421-08dd7b3d86cf
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 10:17:14.3296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RiWkSxOJJT6CGtJifxKCAaZulA5UlqRkaLvPKwsluKD1fdg1MDRs/jDNRbIxXjev
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4478



On 11/04/2025 16:56, Luca Fancellu wrote:
> From: Penny Zheng <Penny.Zheng@arm.com>
> 
> Introduce pr_t typedef which is a structure having the prbar
> and prlar members, each being structured as the registers of
> the aarch64 armv8-r architecture.
> 
> Introduce the array 'xen_mpumap' that will store a view of
> the content of the MPU regions.
> 
> Introduce MAX_MPU_REGIONS macro that uses the value of
> NUM_MPU_REGIONS_MASK just for clarity, because using the
> latter as number of elements of the xen_mpumap array might
> be misleading.
What should be the size of this array? I thought NUM_MPU_REGIONS indicates how
many regions there can be (i.e. 256) and this should be the size. Yet you use
MASK for size which is odd.

> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>  xen/arch/arm/include/asm/arm64/mpu.h | 44 ++++++++++++++++++++++++++++
>  xen/arch/arm/include/asm/mpu.h       |  5 ++++
>  xen/arch/arm/mpu/mm.c                |  4 +++
>  3 files changed, 53 insertions(+)
>  create mode 100644 xen/arch/arm/include/asm/arm64/mpu.h
> 
> diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/arm64/mpu.h
> new file mode 100644
> index 000000000000..4d2bd7d7877f
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/arm64/mpu.h
> @@ -0,0 +1,44 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * mpu.h: Arm Memory Protection Unit definitions for aarch64.
NIT: Do we really see the benefit in having such generic comments? What if you
add a prototype of some function here. Will it fit into a definition scope?

> + */
> +
> +#ifndef __ARM_ARM64_MPU_H__
> +#define __ARM_ARM64_MPU_H__
> +
> +#ifndef __ASSEMBLY__
> +
> +/* Protection Region Base Address Register */
> +typedef union {
> +    struct __packed {
> +        unsigned long xn:2;       /* Execute-Never */
> +        unsigned long ap:2;       /* Acess Permission */
s/Acess/Access/

> +        unsigned long sh:2;       /* Sharebility */
s/Sharebility/Shareability/

> +        unsigned long base:46;    /* Base Address */
> +        unsigned long pad:12;
If you describe the register 1:1, why "pad" and not "res" or "res0"?

> +    } reg;
> +    uint64_t bits;
> +} prbar_t;
> +
> +/* Protection Region Limit Address Register */
> +typedef union {
> +    struct __packed {
> +        unsigned long en:1;     /* Region enable */
> +        unsigned long ai:3;     /* Memory Attribute Index */
> +        unsigned long ns:1;     /* Not-Secure */
> +        unsigned long res:1;    /* Reserved 0 by hardware */
res0 /* RES0 */

> +        unsigned long limit:46; /* Limit Address */
> +        unsigned long pad:12;
res1 /* RES0 */

> +    } reg;
> +    uint64_t bits;
> +} prlar_t;
> +
> +/* MPU Protection Region */
> +typedef struct {
> +    prbar_t prbar;
> +    prlar_t prlar;
> +} pr_t;
> +
> +#endif /* __ASSEMBLY__ */
> +
> +#endif /* __ARM_ARM64_MPU_H__ */
> \ No newline at end of file
Please add a new line at the end

Also, EMACS comment is missing.

> diff --git a/xen/arch/arm/include/asm/mpu.h b/xen/arch/arm/include/asm/mpu.h
> index d4ec4248b62b..e148c705b82c 100644
> --- a/xen/arch/arm/include/asm/mpu.h
> +++ b/xen/arch/arm/include/asm/mpu.h
> @@ -6,6 +6,10 @@
>  #ifndef __ARM_MPU_H__
>  #define __ARM_MPU_H__
>  
> +#if defined(CONFIG_ARM_64)
> +# include <asm/arm64/mpu.h>
> +#endif
> +
>  #define MPU_REGION_SHIFT  6
>  #define MPU_REGION_ALIGN  (_AC(1, UL) << MPU_REGION_SHIFT)
>  #define MPU_REGION_MASK   (~(MPU_REGION_ALIGN - 1))
> @@ -13,6 +17,7 @@
>  #define NUM_MPU_REGIONS_SHIFT   8
>  #define NUM_MPU_REGIONS         (_AC(1, UL) << NUM_MPU_REGIONS_SHIFT)
>  #define NUM_MPU_REGIONS_MASK    (NUM_MPU_REGIONS - 1)
> +#define MAX_MPU_REGIONS         NUM_MPU_REGIONS_MASK
>  
>  #endif /* __ARM_MPU_H__ */
>  
> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
> index 07c8959f4ee9..f83ce04fef8a 100644
> --- a/xen/arch/arm/mpu/mm.c
> +++ b/xen/arch/arm/mpu/mm.c
> @@ -7,9 +7,13 @@
>  #include <xen/mm.h>
>  #include <xen/sizes.h>
>  #include <xen/types.h>
> +#include <asm/mpu.h>
>  
>  struct page_info *frame_table;
>  
> +/* EL2 Xen MPU memory region mapping table. */
> +pr_t xen_mpumap[MAX_MPU_REGIONS];
> +
>  static void __init __maybe_unused build_assertions(void)
>  {
>      /*

~Michal


