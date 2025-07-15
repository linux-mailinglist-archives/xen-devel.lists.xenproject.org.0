Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC6DB05541
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 10:46:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043837.1413882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubbHv-000486-IS; Tue, 15 Jul 2025 08:45:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043837.1413882; Tue, 15 Jul 2025 08:45:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubbHv-00046M-Du; Tue, 15 Jul 2025 08:45:23 +0000
Received: by outflank-mailman (input) for mailman id 1043837;
 Tue, 15 Jul 2025 08:45:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2Lhd=Z4=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ubbHt-00046E-VN
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 08:45:22 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20614.outbound.protection.outlook.com
 [2a01:111:f403:2415::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 021c2c20-6158-11f0-b894-0df219b8e170;
 Tue, 15 Jul 2025 10:45:07 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by IA1PR12MB6603.namprd12.prod.outlook.com (2603:10b6:208:3a1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.21; Tue, 15 Jul
 2025 08:45:03 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8922.028; Tue, 15 Jul 2025
 08:45:03 +0000
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
X-Inumbo-ID: 021c2c20-6158-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VeKxQMU5ozGm7OqGYrV4m2RMoNzuk/HanIqWk6nbe01u31X6zoSqGjdcfYmeBg117zGkKkriTsYcnepoDeDwDm4vS5dwkcmetgIN+q7ZVvesZ2iqOqPulXC2J2mUFby4OcNbP2VwHMWlqxgjBigRkqAg7c5z02oN/I1NAKmJeT8MXpQ9zXB98zWNiO8PotMy0Y1yrYxuyZgChpA/uIjKkLsT/0rx9WTI5Bqsq024ZrYR3Xve+xKyeMKuWL43EcX39//ezpORFtHgzoUsl7RvbCAQ3OUUSmWzknZ1QyPH4iULZ5KjJeV97wxqgEQCN/FjjCPhFBJbINCqCceR0fgA7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GfygdWLF9eVg1C32B7mA02F9up0l0eO/JwLclgacNKA=;
 b=o+2Z1Mr/ubYoKUFKF/o3yVER/Ha4ov5lTSFQz/lenlN43Y0crVktSAsbF1x7KAKOkOiOT7Loy5SdcMnFH7Ab9mjsUUry1U0HJiNXXEpjHig2mcGNYgawh6rOYbt9EernsGGrnRWp4un8Sbzi7pxfPBFmrl9IH1Xez+E9eMTFPmIfOK6Nk/2i7tGZyWfgpqKL8r6EyciKn1uUrSioDoLq5suN0YQWoW0xGWRI4cuQH07o+c6mDrje2OiM71897IDGPlmNuYRRK2Oh9z5gTdKwSDvNksLNh1mnw0CDlANaZk5uSLvzpSLhEt6Lt7+zQ/z7LUGLovUdLEKSfG4YQgXBIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GfygdWLF9eVg1C32B7mA02F9up0l0eO/JwLclgacNKA=;
 b=YBseCK41B1m9jihDj97y7FWoJDYpH9Cnktn1Ovv3RSRH4WQkwfriIQq2DTJKNQMBse7a/z6i2T4zFxbZXv06hjf6hYjD49xHbaHhhNWmpLin2Y+OZLDCzSiYk6y8muKHScN5IrSRb0kiKXrBIzUqsseEA9EGrfLzt+Mw9vz6rl0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <86068832-1403-4468-88ad-9d66066cb687@amd.com>
Date: Tue, 15 Jul 2025 10:45:00 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] arm/mpu: Find MPU region by range
To: Hari Limaye <Hari.Limaye@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Luca Fancellu <Luca.Fancellu@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1752565274.git.hari.limaye@arm.com>
 <3da52fda916ad2487ede9b193143d06debdcfc88.1752565274.git.hari.limaye@arm.com>
 <03fc835d-7833-4c1f-b061-da22a4ab9b75@amd.com>
 <515DCD17-B77C-4931-9C67-2D890D5B5E00@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <515DCD17-B77C-4931-9C67-2D890D5B5E00@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0174.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::11) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|IA1PR12MB6603:EE_
X-MS-Office365-Filtering-Correlation-Id: e24b31e0-8e08-4ac3-f843-08ddc37be426
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TEJadTEySEZLQkRiOXRyUWJrWmpRYlROS0M3M3FreWdqR1hVWnJ4NDZJeTBy?=
 =?utf-8?B?Nk5uYllBajg3Z2JoU2VFL0I3L2xiZ25IelpJYVlhVFY0N2ozRXhBcXdDY3c1?=
 =?utf-8?B?c3E1UUtiSTZ5dGxZNTVkZGxxQ2JUbk45LzBURWVmYkc4b2RQNnVHTEM3ZHNx?=
 =?utf-8?B?TWNOeWFCNkZ1bGZiT2dLUmRsbnREK1NEUHI4Tk9uL2R1SUJDWmRoK1BPTXNI?=
 =?utf-8?B?SWI5OU9ieWpBR0Q4YW9uQTc0SmRPazFnZG1wS28xZVpyODZHN2lVUG5ZWUwx?=
 =?utf-8?B?SmtUUGZiTGZFaFdMNkMzNGgvRGdSSG0rMHJ2ZFczSEh2K1RUV0pObldRSG5L?=
 =?utf-8?B?S25UMTZtS1p6S2RhMzRaNEtmY2ZvMDhZQ2ZPVTF0S0REQktKRGdKK2hlbU5N?=
 =?utf-8?B?V012bEF3b1ZJSmh4ZHl2Y0lCbjhrZFNSUHJGWjIzazhEamYyWlNmemxZRkxx?=
 =?utf-8?B?OWgraHZUalZhN3NnaEY3VGJRbUtGMWN4cndQL201c2RHbW5lL3ZLTDZBZ3JI?=
 =?utf-8?B?THM1MDNqNStkWjBLbGZ3R21jUWh3N3BjU2ljcnVRNWtKMy9RM1hZQ3FvZkxW?=
 =?utf-8?B?YWdJZzdsMk5XMkJ5clZEQ1VCM3lyU1RmMVNkemJLcmhTV1kwOFNQMFFZbURW?=
 =?utf-8?B?bVJ1Y0FFMSs1Z2M2UjMvbW9KTzhxQUk3SHpxM1M2d0xHcXQ1R3ZTU1dyaTJK?=
 =?utf-8?B?RHFyOUN5TzQwQmFReitFQ0ZPMWpXNEZyclM2aTdBc3VSR1Qwb2RNWHFkWHNy?=
 =?utf-8?B?MVV3azRZNmNITE1jME9RYS9IQjFMSG9DWit0Tys5Tk1tOG1YdlUrWWx6STNt?=
 =?utf-8?B?S3BSS2xkVnU4TGdCRjE4RUx5Z0ZiSzlYT3FnaEpVZlVLcVhxSXhHRmljTVBj?=
 =?utf-8?B?T3htU2s3dWFUeVhQeWszT0s3b1lpTGxYWlZGQkdFTjh5ZlNQalR6VTNTQnRi?=
 =?utf-8?B?Uk96TzlkYmVsRG9tR0dRMTFZWU1nWkpEbW5tSThFckdMLzVPVDNzWll2RWdo?=
 =?utf-8?B?ZFBMS25Pa0ljZlZhSVVxVG9ZeHpqNDMwdkV2RERlbEdkWUhJQVlETmRSWk9P?=
 =?utf-8?B?My9aYmFlNEhqQ1RKU3VGQjJ6ZmRHQnZvdVNHRjVrWGw3czh6eEVQVWlDT1pH?=
 =?utf-8?B?cStFSUJnK1Y4cUtIeWlmVFZGOEdXU2FDaWFWVmxBQk9KRWdOQ2FBY1hxODE3?=
 =?utf-8?B?RkE4R0VXRHhoQnlZY1ljY0ZqSTIzU2NHYytFb1VObVRsVDNvVDdlZjl5UXpt?=
 =?utf-8?B?Z3V6VG8vd3FLNzM4dmhEbXM3dVppSVBFdlNid050VVNseGFlcjNYMkdVSlFu?=
 =?utf-8?B?NWVuNmgyNkZxRnJialpRNzI2cy9aekNVZHFWTWlhQ0FJL2x4UGJiTkFSbFZD?=
 =?utf-8?B?RkNaMHh0TTZBVTNLbVF2cjJyZjc5dS91Z0FGeEoxemowODB6VFNiYVBJbmU1?=
 =?utf-8?B?UWJOVElLSzFUMHBwVUI5SEZzUWMrenIydUZkNXQ0SUdxYThkcHJGbnZBU0tX?=
 =?utf-8?B?M05OajhSNXJHWTl0ejNZdzc2aVVvZmtqWUhINnJjbkJhUVUxK3l1MnNWbWhR?=
 =?utf-8?B?R0t5MlVDRWdlbktkQVZyQlZxeHRybHBoUjFmOERmclpkVnZCZ3k3VHY0Uldv?=
 =?utf-8?B?WFJKZHNhMjFWMG00TVY0K2JnVFpYeDZMdEVFeTlZY2VnQkhqSTJrVDZLbWU4?=
 =?utf-8?B?TG0wM0lhenYxN3JvM1Q0RHNabm5Ua3kwRThZNEZEVFZDWG5ZaERjWk54ZW9G?=
 =?utf-8?B?bHpNeW8wbmhvNjh0bGRDYmVUbnFlN2NDZ3RDbm5wZ1hEYUFKcE5lL0NlSlFt?=
 =?utf-8?B?Y01SUjNtQkNZVDdIYlhQT3Y3RlhRNllsVGhTdVdiVGNBTWJIVnF3YkpGMUE4?=
 =?utf-8?B?RUN5OVdGcTBYaEYyVjV2UW11MnlzUW9lWFR3Um5YWXFrY0E9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZG1mZnVRT0Q4cDJ3ZG9JWDhlMWU1ZW1uRTMzZ1hOaHlPWTQyd3dmOHU2YURS?=
 =?utf-8?B?WW8wd0FIcUZVenBXb3diQnZiaGU4RkN2TThoblVIekt4WDlPcFA1emhVQTQ2?=
 =?utf-8?B?c0tyNjY2R2lyNWZ4blNSbys4aFoxczdkZmw5QVhKaDJpOWxqajJ6dVdqU2h0?=
 =?utf-8?B?TDNoRnhLaG1ZdDErNVNRblRFdzQ3WVNqbDlBZWhRUExvbHlYek0yS3dEZ0s2?=
 =?utf-8?B?K2pnUHFldU5kcnRLeW1FSzVsUE5RaEJLUVVIMlBTeU1tU1hrblowaHA3cjZO?=
 =?utf-8?B?dHU0Y3V6NUFZY0JYSUkyaENqeG01U2ptY2JzNkZRSUR1eWtEZnNzR2NpeklF?=
 =?utf-8?B?MzBLY1pudUVRZjhveU83R0pTUEhLMjNQdURpRS9NRjVFRWNBTGNyZE5TWnQ0?=
 =?utf-8?B?Y25ISGR6aW1oUU9uTGU2NjVkOHNVazNHcWgvVlhQT0xTVFN6OGtRMlpMcHBV?=
 =?utf-8?B?YUlTOURVT3dZV00rY3hNTjJkd3BLVEZ3dU41cGJLZEw4c2Z5UjgwMlpMWHli?=
 =?utf-8?B?TzV3OHZmQ0oyd3VlazN3ZlpYOW5NczUyeEpyZDZ5OVVpalZYTCt4dDVwTXRu?=
 =?utf-8?B?Q2x1MFVsWEdiUk1rZ2xmazh3VDlobUJkckNqZWdLRjc5NGd1Y2o1ejVtaEZi?=
 =?utf-8?B?Y2l3QWEzUEFqVDZ0Nm8xNUd6Y0lMSS9tZUNRMW0vRitaV2R0N1ZCY204cGpI?=
 =?utf-8?B?ZGY4cXVNbVAxL0FZUS8raEl5VE1XdFlLY0tZTjFNbkM1SWdnaU5NSjRibGxp?=
 =?utf-8?B?TUNXckNOdHhwZ0huSTFrYmVUSi94L3NPWExGMmViWnJwaHN4dnRJRzlKQVR2?=
 =?utf-8?B?OCtPdFN4clQ4MFlJT2U5SVdJeEoya2ZrZzRyWDl6WHVSeC83RlU1QUhuNDdY?=
 =?utf-8?B?R3VLcEJYUUJuaTBKVXZlclhBaVQzS292YmRFSGVoQk03ZlVBd25vZGJoV2tq?=
 =?utf-8?B?eUVDY1VVN3YwQ3pGRWU0ZFhwTEFXMnNRT0U2dkRPeHVPU0FZVXlZazc4ajJC?=
 =?utf-8?B?ZzJqalFGS0NoZjIwYnlzclc5aVhMVXJ6UHZHSkNndjhhM3QyMGVNcUVBSGJt?=
 =?utf-8?B?QUdQS1FDOGw4S2JiMFVlTlliNTM3VW5ZZ2dMSi8ranJ4WWhjM1FPTDFjQlBa?=
 =?utf-8?B?THJUNWlSOUFqMjVuMWFqeGI5bVVtRjZoU0NWTTZheHJkZ2FDOEJUL09kTjdQ?=
 =?utf-8?B?WWhSdytNTVpBUGlyUFhid3h2SnZYTmVsUDFZUk0zM2VweGJSd2JhejdnUWx1?=
 =?utf-8?B?TUNaRFk4cDNwa2FpMFVQajBnZnpuRHBZcS9TT0I3L05xOCtWcm9sb0RQZU5Y?=
 =?utf-8?B?NDFlU1R3NC9UUFEwOStrUVpKclpSTDhtMHJlcW5WTzN2Y1A3YUNOQXh2dW15?=
 =?utf-8?B?VkJpbEcwVjNZZnJCaFBXVjF4V0htbmJaeUgybFpLQ1d1UW5HMHB1dkx6OWg0?=
 =?utf-8?B?OEpqNWJMNytVUDZqYmZiMGRCN3J4N0lhQmVmVHhVSXJZVlRYNGFZQlNaVk54?=
 =?utf-8?B?N2x4UElyNGt4cDRxbDNDd1RnbDl2OXE3NTFDNzRrRGlkM2tMeTU4TmpFbUtm?=
 =?utf-8?B?VlFNTTEyRXZRL3pLSy9RMXUzblAyWEVRakorYjZBZ3VvZzJmQjhBSy9JWjFX?=
 =?utf-8?B?QWE1STlPTGo4L0pKUWF3Z0pSZUljMjVMbFlCdFFPNTlxN0RxT0tycnJnSVVG?=
 =?utf-8?B?cm5mRFBoL05lNU5OeitDWGJDejgwOVNxVmhDeXE3SVU0S3NINDR2cmZPbk9p?=
 =?utf-8?B?enBkc0FwbTE4MGZoUml1UE9tdCtiaGhEdzNpc2pIZFlvYTBzRm1qYnJZK3RM?=
 =?utf-8?B?TlE0OERiLzhBVlByNWNJdUNoa2tjMjlnRWw4b3hVaCtIaTd2N2hXYlQvODl5?=
 =?utf-8?B?aE1GZ25IYVI0TFJmVCtGTzJFZHgzMXgrU2FCVENrbEZHOEJSTjNxSE1GS01O?=
 =?utf-8?B?QTlWQUhXWnlxZWRsVUxieE1VS0c2S1VzL25iZXcwbitDc3JwYzlxS1IrcUk5?=
 =?utf-8?B?SXE0UTJKRGhoaEY5cmJRWlViTWF3eE9pZTYwRG1TdUdvOGdXNVA4ZDZRb2Vw?=
 =?utf-8?B?SWFUZ2x2Y3JQU1hsNkxkaVdTWnY0ZDk2U2VuYmplYm5IQTVtTUNUczF5Z3Z0?=
 =?utf-8?Q?qQcmQYXlqqYj5FgV90vRDHpjD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e24b31e0-8e08-4ac3-f843-08ddc37be426
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 08:45:03.4290
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NIC+OVSNYzUdQMAfn9ddOkEjcp04h1n1EED20Ff9Nj6pJw0UKDaBsAiWKcxyv341
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6603



On 15/07/2025 10:36, Hari Limaye wrote:
> Hi Michal,
> 
>>> +int mpumap_contains_region(pr_t *table, uint8_t nr_regions, paddr_t base,
>>> +                           paddr_t limit, uint8_t *index)
>>> +{
>>> +    ASSERT(index);
>>> +    *index = INVALID_REGION_IDX;
>>> +
>>> +    /*
>>> +     * The caller supplies a half-open interval [base, limit), i.e. limit is the
>>> +     * first byte *after* the region. Require limit strictly greater than base,
>>> +     * which is necessarily a non-empty region.
>>> +     */
>>> +    ASSERT(base < limit);
>> Well, that does not guarantee a non-empty region.
>> Consider passing [x, x+1). The assert will pass, even though the region is empty.
>>
>> ~Michal
>>
> 
> Apologies, I may well be missing something here! Please could you suggest a code snippet to understand your expectation here / what you would prefer the assert to be?
> 
> As I understand it, with a half-open interval [base, limit) as is passed to this function, the size is  `limit - base` and so the region [x, x+1) will have size 1. The empty region starting at the same address would be [x, x). But perhaps I am making the off-by-one error here.
Hmm, I think I made a mistake here. Region of size 1B would have base == limit
in registers. All good then.

~Michal


