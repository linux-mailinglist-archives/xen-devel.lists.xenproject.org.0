Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31917AA8E50
	for <lists+xen-devel@lfdr.de>; Mon,  5 May 2025 10:36:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.975913.1363204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBrIZ-0008Kg-L4; Mon, 05 May 2025 08:35:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 975913.1363204; Mon, 05 May 2025 08:35:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBrIZ-0008Hu-Hc; Mon, 05 May 2025 08:35:39 +0000
Received: by outflank-mailman (input) for mailman id 975913;
 Mon, 05 May 2025 08:35:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VAKQ=XV=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uBrIX-0008Hl-Qr
 for xen-devel@lists.xenproject.org; Mon, 05 May 2025 08:35:37 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20617.outbound.protection.outlook.com
 [2a01:111:f403:2413::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e9502779-298b-11f0-9ffb-bf95429c2676;
 Mon, 05 May 2025 10:35:35 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by DS7PR12MB6045.namprd12.prod.outlook.com (2603:10b6:8:86::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Mon, 5 May
 2025 08:35:24 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%4]) with mapi id 15.20.8699.026; Mon, 5 May 2025
 08:35:24 +0000
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
X-Inumbo-ID: e9502779-298b-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k8hRabE1f9pTySSz6SiFaTJ0sH4yZfn+Pb8h0gl1K8elOwOfAKxvi77jqCor9W55DtSNy1xYVqTVXDa+3SLXTmx62zbe3uQFrH7ANUu5eX9QuRqfQpKAnu6Xfa3jBKGDbRNxey2Poxn8sHowflZVoGy+XUuolf8O0IWvkiNng+zhfJzitGcw+v2oiPtvBuSnrL1gxsWi/QPCs+Z2/hJUa2rputCR9rnE9VcEcaONPhx1+C2uVUk54nWKAlFGN/4uXJrZArWcz5rqZwJLYQgb3uJOfpYPO/iIVKAcLAPvWgvYRCEM5TrDcSliQxnaJAGSA9LAml8s/D0gCxq+64zIqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mFfj3SFvh9OVFCFDTh8GYOfxpCFeMSieq0Go9d+yCRw=;
 b=A5CngbPST5bwlJtFihoYPsn5eLBGq0/72rqJBc7tM2FeniOwxGjk+fKp01HD/CRNUQTnvkqup1ipPz/TsWOAWHtJjssb4seLnLD/oBCd+645+MCezBDwcfKxDe7K1jwnfQwEK28taOWx04Hx9NTPTGGlngPcokKj8HMzs87Lig7bWlmo73dHz6dbXfuYQflwjOSNfh3Ax4Trpi/SxNHCvXEbLqZLf62icFv8+ROWuZ7m3a90sMDyqgQqjFab5D0yQ8pkP2VSr1yQryXsly4Q7hG375cItIEYa84s6DC1Xni5jSR5jvJme5kRuOQrOAaEbdeuuqtbHJ1kNkCRB568Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mFfj3SFvh9OVFCFDTh8GYOfxpCFeMSieq0Go9d+yCRw=;
 b=LIefhivE4Cw0rc7bFYT1ew/fbohFErkQjOZeAXn7+t0Fpd8eRrJg+Jk7791SetHqvBna7agJljhKJAiHjjEG1xKhY12RJ1ffhq/0hBBM1ev6QzUn6PYnm3ohjil6DP39BdO2EfwlGRS3omLpHRgmgavIpaNr0tXLk1PCXJ1yjJ4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <e903a823-3f6c-497f-8cb5-5ffa9edcbe9c@amd.com>
Date: Mon, 5 May 2025 10:35:20 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] xen/common: dom0less: make some parts of Arm's
 CONFIG_DOM0LESS common
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1746199009.git.oleksii.kurochko@gmail.com>
 <82f0c1d4fe25b4a52d76f3c8004e107b183af56c.1746199009.git.oleksii.kurochko@gmail.com>
 <alpine.DEB.2.22.394.2505021028020.3879245@ubuntu-linux-20-04-desktop>
 <c804228e-c15e-4cce-80e7-f90f4a290a81@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <c804228e-c15e-4cce-80e7-f90f4a290a81@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0044.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::18) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|DS7PR12MB6045:EE_
X-MS-Office365-Filtering-Correlation-Id: 13296506-3ccd-4866-e351-08dd8bafc7a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YlZBUmJUa0gwa2djS0tmWktSeVBnMHB0UUZMSStEWE8rQlI3KzlacXF4Vk5P?=
 =?utf-8?B?MnNPazF6ZFZXQ0FIRUZlV1RNUURuR3dCQmpHc1lzc05SRkJDdkFqZ1FQR0lL?=
 =?utf-8?B?cHlHZmxyTnRXREZqSHZvSUkwOThyNUIydktJNnNGT1RQWS85RGw2eThyaHhL?=
 =?utf-8?B?cXZESlF4Wjl3cnlWdDRMRERueFN1eHFsNFZNcDVoendPYm9HRGlva25iVU1l?=
 =?utf-8?B?enV1M3pLcUN2WFlKTGxVWENOczIybFR6dTZpVzlJL2owVGhoOHJ3Z2M4elF6?=
 =?utf-8?B?emE4R3FTSGdIcFV1UlRtQ2lYTVJrajlqeU5KQW1nL0FOM0FzS3hNTVMyY1JQ?=
 =?utf-8?B?NnpwQ2lxS3h4NlptYk93Z3hLNk9FczRVbmJoSndKNTNGZ0pCOFoyWHp2dE8w?=
 =?utf-8?B?aEpNV3dIaWNqcTRXRjhJSU1oYXc1d3FRUFFmTTNsbHJOKzAwMU9PcytyWFJR?=
 =?utf-8?B?Ry9rcG1rRktRY0hNTkx0TzdwLzUyQUR1YTh5MzY3UzZ6aU95T2VodEY5ak9J?=
 =?utf-8?B?RUs2YUg3RDNXS2phSzl2d1NEVnByVUhkM2k4RngzcHY3M2Rqbjl0TVdMSVFn?=
 =?utf-8?B?WGMxb0dsRVBCNlVxY0Z1UlNWYVZSZmFwK3c3WS95a1pjWlNNclB0dlZVTXpy?=
 =?utf-8?B?eTg2VzlQU0dxWE1pV204Qlh2YnREaUlwYjRubmhzSVQ3cXBPaFBkcnVNaG9u?=
 =?utf-8?B?RkxCdWJzTGhBQUZsTkxid1o1K2daNW03YmowYk0zRGc0L3VZQjk4a210MmJO?=
 =?utf-8?B?bERwOWZodXdSajVWMGxPNVF0bkpwMTZJQjFnTGhTZ1A4TTZydjhqekR6WUw1?=
 =?utf-8?B?U1U1bllCb0lSU3NUelF6ZWVlZkRnYjVZM1FkaEFhNHZSYmZmSElPSlFTSU54?=
 =?utf-8?B?V2V6Vm9GaGw5WHI3UmVWRzNPQ3M1aityUVNYU2swbHFQSGYrZVQ1eGlmdnlN?=
 =?utf-8?B?dkJoMEExa2wxNWoyT3p5TWxvMlI2Y2lGTWV1b0x1OHNBT3Z3ZGNuanE2U0th?=
 =?utf-8?B?S2didTZOUXlQNjBtaXNxcmVPWVVJUU5lYm9QeTN4TFlDOUpaU05Md1UrdVg3?=
 =?utf-8?B?N29jeTZQOXkydm4vNXFLNTdDTUtoMWs1YTlnSjVLMDNaRDRLZDNOcENFajFt?=
 =?utf-8?B?NXFnL2tXYzJNZ2NTRTRKeXU0a0NFSG5WUWgvbEZtSEo0WUNBNFAwb09MSnpj?=
 =?utf-8?B?aDNsUW1PQ2lRUnhVS3hHQUdOa1VFTU1wOHlzM0QxdlJZVkZISEc2WDVndjBv?=
 =?utf-8?B?UDN5WWQ5TGpvaDF5aGlqRWJqZzA1dnlybTFqNkZ3Y3ZSbFlMdTFodTBoeHFh?=
 =?utf-8?B?RDA1OWpCdWl0Q3Y4L3JSTjZ0M3ZhQXVCaHY4bThvd2R0dmZuZm1Xc3hTVWJ5?=
 =?utf-8?B?R0xSOXVHc2I5K0s2RjJyRXd4T3o1NkJocFVxUjRPT1NIQkthVWFCNkFYdGw5?=
 =?utf-8?B?SGdodFQ2TEIvaTFDZDhkL21tUDlNMXRBNkVVVmlnSTFoUENwKyswQm4xcWV5?=
 =?utf-8?B?Yi81dHRReWUxeTIxamRsZzRlRW1BMWd5bXpkMzlyY1RPdkFSSFRTQzJCN2JN?=
 =?utf-8?B?bFo2bGt6UkNXblp4eE52OTJ0Qm84NGY1ejNFSjBYU0pTVzhoTWM1YzlPTmhs?=
 =?utf-8?B?aGtEa2Z1S09zSVJxQmJjWFptZW5oVlJ2Q29rMERqTmdLRjdSVE9TZzhsYVNO?=
 =?utf-8?B?clVhQ1U3MDVjdDFQQXRQMjhvZ1VRUTFOUHpnY2xHTGFrOXJlVGNqWlVqbVl0?=
 =?utf-8?B?ejM2WXNxWmxnVXJGTXVQelM2MXpBclpyb3VSOFM1eGM5SVQ3dzVmNjB4d0F2?=
 =?utf-8?Q?KDg79hxSJMm6qqzv++pJqrkJoI7nu7+1jHHN8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QnhLbjZVYW9iWEY0MThqZlFsR0lUSEtQVkVScE9WOW1iU1V6TGJsdTExN0dm?=
 =?utf-8?B?ZCtvZWNxZkhSQldycG45MjhiRkh5TXJIOE9NNGJkMkFUNHVVZzRqYng4S3U1?=
 =?utf-8?B?Z1kyWXF1S3lTN1EyakxIc2hHUnFWTkJNMjZyNEFoeEVCeVNvR3Rxc05RN25w?=
 =?utf-8?B?TVBGKytvb0Y1YkJhRnBJMFJiMVkwQmxHYTFTQ0thWDVGNWlRU1ZXY0ZuZ1B3?=
 =?utf-8?B?ZFVTNEptU1VlcS9WWndmNmZqRGJTaDZxOTFxRjdXaHVhdzdNWW5ZZVd5Z2lM?=
 =?utf-8?B?c0Q3d0JBZVFjRzU0WWgwSGFHQ3pGV3BneklEVVpsNnFWMGI4eHhKQkhjdGpt?=
 =?utf-8?B?KzMvR2xVNUNleG12eHh0RVBWbUFSelRWZGNkSGVrd0FPdVorWXBqazd4eExM?=
 =?utf-8?B?Um03RkNkZEVSenBYOXA5anVheW9DY3EyeXprUW1oNmJibW43RzIzSWZONGxY?=
 =?utf-8?B?RWhEaHRLWllKZWZjNStvV1B4TzJBTU1SVHkzdGI4OXpYRUhBL05RQ2N4RUFh?=
 =?utf-8?B?bkd4bW15b0hrNC95OGo4Q3Vxc3lZZzg4Tmt0QW8zdklHNE1DWHRwS1h0SC9H?=
 =?utf-8?B?UVBucjZFWkEyR1FCVDU0VVVCYkluelV4T1RJeHoxbzNBM0JvM05tOHVjSHVv?=
 =?utf-8?B?WDdrRFdZSkpKZCs5c2FuMTZqdFB5bEpwMG1Qbkt4R0FPVXE3ZFAxNEVkSks3?=
 =?utf-8?B?ZnBtb3BZRGlNMU8ycDRXcERnS1k3SEpOcno0bGZ3QzdHczBTWEQ4RlhIaDFO?=
 =?utf-8?B?WUJBS2l1NzRzVGxHQVBKdjFCcTNUQVZIQkZLb0o4UEZSaW14cCsrSHhZeG95?=
 =?utf-8?B?YS9kb04xVW9LaVVaRTkzYWQ2YlIvK2QzZ1dZMVNuQ1ZmWTgzeGV4Ym0vektZ?=
 =?utf-8?B?OWpTZnpCdng1bUhVNWpDV1pyMmRDU2RmVWlsZmtIL3g2a3ZBQm9EN3pvWXV3?=
 =?utf-8?B?bDZJSkZZVGk3VkY1TWJmMEdTU3RDNHFtcDZmVXF3dE81V0hCa2Z4V1I4UlE3?=
 =?utf-8?B?UTNEcmh6M2JFVCs3ZlJIY3Y0UEpxcEx3OUgwamtsR0laVFRReFcycDl5WWVD?=
 =?utf-8?B?Q1hDbHByeDd2UlJnbGdTRVBBd0JSQzNkZDE5K2RGMGdVS0pmcmlENG1kRTJX?=
 =?utf-8?B?OUUvYzVhc1lBQXBFUUJTMVlzZlowWFRKNjAwQUxxb29xYU5EWXIrZVZ1bEhs?=
 =?utf-8?B?MGZIRVVvVkFDYTR4L2pYZ1ZzS0VZU0hxbXlDZG5aenZMdnU5K0tHWUFpZzZY?=
 =?utf-8?B?WDEzYzhxOStQV0thNGV0OHZjTThwQmpZQTNxaWVhcm1BTklIWUpaS09NNFBW?=
 =?utf-8?B?ajdMUUd5Uy9ZS3pZR2FQSk10Z2NNTnlzMnkxVDJJMVdOSnlmaTNRRnZTWkM3?=
 =?utf-8?B?OE02MEVpOUErT3JYNVFNOUZQTWNDazJMSEd4QytzbmowMHdVWU9MUCtvR01u?=
 =?utf-8?B?bllydWdQQi9MYzBvZTkyZkRTWW9UWjFlblpIck55bzlMcFVVeHhLVUpiYXJF?=
 =?utf-8?B?RmsvWnBOM3Z5Z1NGOFA0UHcyenpYYmlOMCtEQ1QrTDVIT2thdUtYMC8yUkJv?=
 =?utf-8?B?OS9xcnRMNVViZkNEK2ZCYVpvRmVERVp3Q2kzSlpxbkZwR1BnZUtTaUlhSHN1?=
 =?utf-8?B?dkF3RGovOTBEMEtFTHdHRVU3VjZSbWJ3UlJOSjdSS2pUQUV4bDFxc01MWU8x?=
 =?utf-8?B?S2lYSWJiM2h5eU9GOXpDVy9YM0l2ZmswSXAzMkYvalk0bG5SKzlPODFyRHBJ?=
 =?utf-8?B?dmo2OVd3bGROa2J2QXQwTXgyd3pyeURXVGpuckNaamxOWXFCQzg0ejhGWjNu?=
 =?utf-8?B?bzlValBwbFE2MjNDeXM4RGJSZVhXK2hZOE9GYVlUU21QWWhtTU9qeFQwVEYr?=
 =?utf-8?B?QThxQ2ttbmRlTGhHRkZVeXYrV0s4MElhY2tTRkxYNUMrVVJLQ3VNWTJMdHB6?=
 =?utf-8?B?NXp3eXBUYnE3S2FpMW9wMm5lbnVXcWdFYkpVZzh0Z1JubGx2eDFIWDdxMVdQ?=
 =?utf-8?B?UUNoK0VqdnBlWmlud3IvemRVNkIxcDdpOHVCbzcyL3kwNHhiR09FRHF4YUVh?=
 =?utf-8?B?VWJOUUgydEFKaitWaTNrYlRqMzRDUHE4bXdsZUFFSUdkTUNCZmpqZ202QW5k?=
 =?utf-8?Q?ccPQ=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13296506-3ccd-4866-e351-08dd8bafc7a5
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 08:35:24.3263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3cHj80Z6/D4hodQR/KMK1TGBHq7hv2n5XCCoe9C98VZStqB7tOq7RQkO2Ctvddu4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6045



On 05/05/2025 09:35, Oleksii Kurochko wrote:
> 
> On 5/2/25 7:55 PM, Stefano Stabellini wrote:
>> On Fri, 2 May 2025, Oleksii Kurochko wrote:
>>> Move some parts of Arm's Dom0Less code to be reused by other architectures.
>>> At the moment, RISC-V is going to reuse these parts.
>>>
>>> Move dom0less-build.h from the Arm-specific directory to asm-generic
>>> as these header is expected to be the same across acrhictectures with
>>> some updates: add the following declaration of construct_domU(),
>>> and arch_create_domUs() as there are some parts which are still
>>> architecture-specific.
>>>
>>> Introduce HAS_DOM0LESS to provide ability to enable generic Dom0less
>>> code for an architecture.
>>>
>>> Relocate the CONFIG_DOM0LESS configuration to the common with adding
>>> "depends on HAS_DOM0LESS" to not break builds for architectures which
>>> don't support CONFIG_DOM0LESS config, especically it would be useful
>>> to not provide stubs for  construct_domU(), arch_create_domUs()
>>> in case of *-randconfig which may set CONFIG_DOM0LESS=y.
>>>
>>> Move is_dom0less_mode() function to the common code, as it depends on
>>> boot modules that are already part of the common code.
>>>
>>> Move create_domUs() function to the common code with some updates:
>>> - Add arch_create_domUs() to cover parsing of arch-specific features,
>>>   for example, SVE (Scalar Vector Extension ) exists only in Arm.
>>>
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>> ---
>>> It was suggested to change dom0less to predefined domus or similar
>>> (https://lore.kernel.org/xen-devel/cd2a3644-
>>> c9c6-4e77-9491-2988703906c0@gmail.com/T/
>>> #m1d5e81e5f1faca98a3c51efe4f35af25010edbf0):
>>>
>>> I decided to go with dom0less name for now as it will require a lot of places to change,
>>> including CI's test, and IMO we could do in a separate patch.
>>> If it is necessry to do now, I'll be happy to do that in next version of the current
>>> patch series.
>> I think it is fine to use dom0less for now, it will make the code easier
>> to review and it is not necessary to change the name at this point.
>>
>> The patch looks good to me, except for a couple of minor suggestions I
>> have below. I could make them on commit. With those:
>>
>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> Thanks.
> 
> I will apply the suggestions below (unless they have already been committed by the time I start preparing the new version of the patch series).

NIT: please trim down your replies (unless you want to show the bigger context,
which is not necessary here)

I only skimmed through the patch and noticed you did not add EMACS comment in
dom0less-build.c. Please do.

~Michal


