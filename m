Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF28A87EB4
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 13:14:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.949822.1346273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Hlt-00084J-9G; Mon, 14 Apr 2025 11:14:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 949822.1346273; Mon, 14 Apr 2025 11:14:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Hlt-00082r-6Q; Mon, 14 Apr 2025 11:14:37 +0000
Received: by outflank-mailman (input) for mailman id 949822;
 Mon, 14 Apr 2025 11:14:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GQ8q=XA=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1u4Hls-00082l-8x
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 11:14:36 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2062b.outbound.protection.outlook.com
 [2a01:111:f403:240a::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3b8afdf-1921-11f0-9ffb-bf95429c2676;
 Mon, 14 Apr 2025 13:14:33 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by SA5PPF8DEAB7A29.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8d4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Mon, 14 Apr
 2025 11:14:29 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%2]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 11:14:29 +0000
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
X-Inumbo-ID: a3b8afdf-1921-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GvBVftWShBU/ucnWN3PYfO34Py7tUSHGwwJsVGwLe4L2oeoQv2mBD8LBINWSbIXovlk9NTanOLBhI1ngZTrqXYSYO9wmAHjKGFkorJtuEsa2w4C9Ph++fKfdkorMZwJbbKrJK6NeobiH0bUA6KgvG8Ddh9EGTAJNJuDbRcjFEmIZA2/naSrUOwdd3dIX5qeMRxvyp/dUbRkSMB4hDosg//rI4fHbtv2a1zZx8780mlhq9+3vjM2B6/KJB5DAFLP3ivmaTD32MQaImaNVPRzQ5v89Z2QnsRpcnsQqO4nKh1hfqwbt/A94wAVRsPboJNO03LOCU+DIihKRYux8czNN/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UQ1I39lUThBQ27pD0pcNvLay4MSkVCaFkImRGpIQA5I=;
 b=TIjFoOa41LcEa4Q68FVP2+kqynvGd5dopxdYvisMbYe3jUMRStsmy++an8c37tHWiRmdiNmRQ/eZoft79IsQ3Mza5Xij2Kd+Bt0aZxa5JM3xS/c0dWMsNR3zeKA118PVMlsMXaOUWVOjoP573loXlvWMoDIPuRoN8xWQbBYG5w6199UvVvElMbfHtXf5UxevTuA7QKn9YkuX+kbHVBRv3V547G1Qtm8uFg9UGmen1MrXk591gp3MXdR2H+LBsu9Y3A/y7abzPAhVUormEOQSLvkKKjj52cEQoZTizjLs4WPwtZJktZEnnmzmAclQTiBqaspEjfhlS3bg/weIaFAA7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UQ1I39lUThBQ27pD0pcNvLay4MSkVCaFkImRGpIQA5I=;
 b=x9QWrIDCcaMlebDHQv+wS+OFh3Rec2h5IG1ic+7aSFgM0fwqYOArRtcfBp0RbLEZeJ1Zeky9Cikwk5V82PeHmOsJsZGLOqtSTsf2bWnzVgd0p8ASVu5TsSrF3D+3BVb9skqFhizz1bIT63UeSqq0dmE0Ke55EfpC5ZfPZHD0XfQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <d6cf087e-e1a3-4d89-a371-3d0b8aeb6395@amd.com>
Date: Mon, 14 Apr 2025 12:14:25 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] xen/arm: Move some of the functions to common file
Content-Language: en-GB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Luca Fancellu <luca.fancellu@arm.com>
References: <20250411110452.3748186-1-ayan.kumar.halder@amd.com>
 <20250411110452.3748186-2-ayan.kumar.halder@amd.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20250411110452.3748186-2-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0276.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::24) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|SA5PPF8DEAB7A29:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b3272e8-2eeb-4973-c52d-08dd7b458629
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NFN3NkZDK08yak5KWDdvSFM3UDI0Y2x1bGc4UzhEb1g0K3pzcHhtTmVQMm5o?=
 =?utf-8?B?ZVVod2tZZmVGQmNydTUrVWpIcVpiQkJLRWpWWVVnbS9QTTE4OURiME1MZith?=
 =?utf-8?B?djJudTl1a3BNUGdUUDJxdGNlUnBCM284d3grSksvRUt0UDVpSTE0WkxiY2Zq?=
 =?utf-8?B?OHVQYU1kR21VOVFSK0lRN1h4R2JuUGZHRmQzcEQxNjBsbkJ0UENqQlhxcmpE?=
 =?utf-8?B?bVpteW5ZRWpuS3lRM1h4QjhZNnFTQWNxcGNucnpITk54S3pzUFVjYmxVOTlN?=
 =?utf-8?B?aWlLbDZ1cUNEaGtjNWYrNXIzaHB1ZXhpRU1VZEtIb20rL0RYSko4TjFRTXhV?=
 =?utf-8?B?R0VMS2R0Y09wSk9lWXRUZTAvT1BEalRKNUlnK3ZmSk0wNmp6MkxhbC8vZjVa?=
 =?utf-8?B?cWpGQm5nRHFrcHJlNmlJR3JGS0ZKTUhnay80bzBvSkdWOVBlQi9WS0lpRnpm?=
 =?utf-8?B?VXRjcUNpKzBYZWNKdUE5NFlSZmRkNDZzc01ZQWw5aXlGSnMrRWlGZjhmNHQr?=
 =?utf-8?B?eDJiQVpEampLWEhoeSs1VkJqd0VjSEx3a3RDNm95WjBCRElOT0VKQWJXbXFZ?=
 =?utf-8?B?MGpXSGdzMWpPcU54MUlOYUQ4bW1NdkhNcDJIVmhqZjFSSWRxN20vbDdUTGZj?=
 =?utf-8?B?RG1DQVVNNkhPNTZqK1dPc081VFd2MVJ6VnFML3A3bSthUFNuRmlGTFJPbVlC?=
 =?utf-8?B?bU8vZDBCcGEwaVo5RDJ2c3R5NHJ4S2dTZUZHcVNDdkJkL0FpRnNEcnpucHMz?=
 =?utf-8?B?bXp5M0swU1pMNU9mQml4MXdyR29ldFdRZlc1WFFSNTUrdlZnc3pkMUtwTlNz?=
 =?utf-8?B?R0s0MDJTQ3JxL3RyMjdrMHYyVWEvWHFJMi9xcVAxZzNXZHRDcDJuNnRUVzlH?=
 =?utf-8?B?aTdGY1I0Y1BJMkhQbTFTNm9UZExqQ1U1UE5UYTlFbmZtWFp4Y3NiZkxEWFFJ?=
 =?utf-8?B?aHNJcXFsUUJUR1JKbHJFWng0OFFERnJRV1NibmdPTHRHanVYam52Yzc1VzRW?=
 =?utf-8?B?TXhWbVRGMXZiMEZsZ1AxeE1vcm1BTjdQck00S3JYVDJHVVVOR0NlVUlxeUMw?=
 =?utf-8?B?TDdMOVpZcUV4a0NyVTlLQkRCc21Mc1E3OWJndXE1RGk4M0ZEcDRaMUFsUGdr?=
 =?utf-8?B?UWQvemFOSDFNNWZLRWtIUEdPTUc3V1lNL3Zrd1YxMUM4S3BheWdOOEt1a1ZC?=
 =?utf-8?B?SThmZFVHVno2YlVUOGtpV3RNK2F1a0VWR0YwUmtYK0RBYjl4TUM1QmV3ZjRB?=
 =?utf-8?B?ZEtPZDZlQjQvaVdESnFGQnVpMDkwbjE5cG90L016bEFGUnVEVnlqU09jVS9h?=
 =?utf-8?B?eVpMd21ROFZqRVozalpPOGtkWDZ2Zm9NWTVjUFo5YTBwZC95RmpheXZaN2lX?=
 =?utf-8?B?dGVxb1RMRVVHVHRHa1lLdlZiamF0bkRRWTlGSVJvbHAzZ1JvbVNFdmVtWHUy?=
 =?utf-8?B?VytGT0JnR2xzdUZDVGdWMFphTSs2K0Jic1o2amlDQWhHVm5RNHJTL0hydVhO?=
 =?utf-8?B?cFVWUURvRGhvQ3lxSG5STGJSQkNZbmtVRWo4QzMyQVJnT1QrbVorVGROM3Ex?=
 =?utf-8?B?YUdnNnQyTmZvTzZMRFdYcFBaZEljbUdSRGJ0SlJZWjQzMEg3RnpaWWFTK1Zu?=
 =?utf-8?B?dWdCcUNPeUlZZXlMcHlOdTdEektTakd6aHBxdUZ1aEhDYktmWjdFVTUvT200?=
 =?utf-8?B?ZnJ4WEI2ZHpBVDFGN3ovQjYxeEprS21XTkhBMC9LOUtsMGRRd2hOaS9WWFRN?=
 =?utf-8?B?Q2xlSUxGV2g1bjVRWHZPSU1RSk9XZ0x0MXM5N2xuVS9WMzJQemxXbkVSOWNH?=
 =?utf-8?B?OTB5VVdxQm95Vk5jeEdyY1V5eXJ0YnNYcXVsOGtFc1NHdW1mR2lycGdRQVBO?=
 =?utf-8?B?a3ZodVNZTG9NNW1DU0w3YTJaN3hsSC9Mdm5OQmh1YnovU2ErNEw0UGVXZ3Ry?=
 =?utf-8?Q?2kHShoExKDI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NTltYk9USXlGMFdRMzZHd0g0NFdUd1hveXJPcW93QlhXNTVpaVNOYWFsa0tm?=
 =?utf-8?B?ZXNrbkNoSFRkWGZKUzJiT2RCYkJ6SlZjSmx1U05JUHZtTFVOWFRMSlJGbkRu?=
 =?utf-8?B?QkpJR2VkVW1mVHR6dFJ0SFRPMnM3aGM5UVI2TVpDbGZsSkxhNVdlTE5YaU1v?=
 =?utf-8?B?cXZQbmd4elEyZWtLVElwaUQxZzZZaUh2N3k5VkxNREduUHNpOEN6WUZ5WVlv?=
 =?utf-8?B?c2dyZmcyQ0l0VVZ3ZTdSQVFLYXpnSEMxNjMyc3hIdDdWTWk0T3dmWGdSYXdQ?=
 =?utf-8?B?cm8zclp5V3M4UlFSUlppMGUwMXN4amZXZlkwMVR4MGlvTFBmelV1WU9BZllB?=
 =?utf-8?B?djczY0k2cjc4SVlVak9KZ1N4RU5MZzdOOW9YQThvckh3Y3YzbTZQUkRIa3hM?=
 =?utf-8?B?MGd0TEhyTHNnaVpWT3FuTU5QNkVWUEJTZExZTDVJNHJqNFRyVkhVVmRyR1Fv?=
 =?utf-8?B?d0ZEOGR4NEJObVdBMDBxWDBudFdNUis2TFI2cWh3dlhPcXgwTy83WXFJVkhk?=
 =?utf-8?B?L2RsY1VFTUVOaGFDZGxxTUNjM3A1SkVTNkt0M3laeHJVTWdRSjNtQitveE9y?=
 =?utf-8?B?blgwYk4rRXpvcS90Ni8zbW84VkxiTGpSbjJ6aWN4a0xwSFpmWERRQlRwSDMr?=
 =?utf-8?B?dFFsV2hCam4rS0h1VDlLK3ZJSm90ZzkvdWMrd2FuMXN6OTRCNXhkOGlOZ1Iw?=
 =?utf-8?B?Z0JadE5PUHZReDI4NWdsTWVnZnJoTHVoWVRQWThjb3lkdTcxbEJUVXA0eVpT?=
 =?utf-8?B?MWc5cEdYZ2VkZzZIUyt2SUtnT1hlSnZibG5qUFRnQTZkMFFkazlaQ0F1M3pu?=
 =?utf-8?B?UWhzMUlsNi9sd2E3SEhLYlNqa2xVSGJKNHppR2hndy9GOXBlczVvU0g2a0xo?=
 =?utf-8?B?amJYN0tEMG5jNFVZajhLcTlSZmZFWkJ4QXh5K0VJV2FKVXhCS1hzNEF6OUQr?=
 =?utf-8?B?QlpZczdlQnJURjhVRmZheHFuVjdYSUN1cUlKVGhIVnR6K1RhUHhjV2doUFZk?=
 =?utf-8?B?VFZYTGpKY2o4QXNGR2N3SVozSURhUXNoVVF6OFJvelBUZTNaVDBBV3k3YzM5?=
 =?utf-8?B?ckVBcjM4TXl1R21sbnJUaDF6T2UxUWh0K2tPVWRVd09CTlZVRnlRaDdsanpV?=
 =?utf-8?B?cDVCYjR6R1VHRGJscWRRNkRFVlpKcWJua2ZJVml2ZmkrRTVjNW1Pb2FhSFYy?=
 =?utf-8?B?aFdoQm0xV1RJcld0aHkzbWFXaE12SWVHMnJqY2JaS2l3T3dCREtIaFNzWXBm?=
 =?utf-8?B?TjVQUTg2YXJRUFovZS94ZXAyUlVDYTlVTnVvNWxMbUJGNFRQTmdkaGRza29x?=
 =?utf-8?B?d3RhS3lpMjVQanFWaTJsVzNrdEFZN3BKN1ZSZW93bVZWcW1IZG9HMjRNZUll?=
 =?utf-8?B?cXRQRytzSkFwamkzcEp2M0dSYWtGQi9EVXk5VGNBK1FUQkFKa0hQa2hYTU1L?=
 =?utf-8?B?QUN3SkdGc1JtTjdxME1TL3F6ZEkzb1FxcmY3Y3lScHZZNTlPTUhqcDJFL3U5?=
 =?utf-8?B?R0s3b3p5VXB4cmtMMTlSYUVTQmM1YVF5dWt5ZVRUbGlQdVc5TVF3UnFVR1J5?=
 =?utf-8?B?WWlzRkhPSXRJanNjZ2MzOFI3SGFnWDJIL3F3d04veWdZdjcwNkltdENEUDJw?=
 =?utf-8?B?YXA2L04ycHYrK3VRbk81b0dpUFlrZHQvZ05ibWlOV2pMZVNiR001NnRFRE9K?=
 =?utf-8?B?Y3Y5NU5VWTdEalBrT1FEc3pNOXpheVZHWWJlTEpSWlY1cERFendkZzVwdFpk?=
 =?utf-8?B?Si9RTGZ4VXloVEhWVTlqODJtL3NoV0d3eDJhZ2hHTk9jNnE3UWRtR0QzZFl0?=
 =?utf-8?B?azhYcmhVM1laYzQ4K29uYzBnMWsrS1pRQVZsWk1adHBDUGpjaEVWRm44ZnpR?=
 =?utf-8?B?ejVXTmhBWm11eE8rUk92Y0FWR1FVM3J5KzdzbjVpeXVraDJLTmdWbUJycTVu?=
 =?utf-8?B?LzdNNGhxU01RNG9Cc0ZZUndNM0dvYWJUcW9mTFRVNm53cXB3NkJZRlNNeWNF?=
 =?utf-8?B?eTA2Q2c1cVNIYmFueGN2bzN5Q1YzRG5WYlY3Vnk1cjdPMlN5R2p2dDFlY1dW?=
 =?utf-8?B?YzZkS2k3c0NPTTZjWU5MMlBWQ2ZHU3E0SXpDenF5UGpQMjZKRS9sbWFqamlR?=
 =?utf-8?Q?8+ZvxIp9sdf5veBqXmKkKSkK2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b3272e8-2eeb-4973-c52d-08dd7b458629
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 11:14:29.3184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wcO8+h9c9RPtOm8rXmljDKR+U5ibmaYClMNJgrAIm8JC8+y6I/Rq5Tq9+wYauX9TjZIXue6i0HjqBKd2/R68+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF8DEAB7A29

Hi,

I will keep Michal's R-b with one small change.

On 11/04/2025 12:04, Ayan Kumar Halder wrote:
> regions.inc is added to hold the common earlyboot MPU regions configuration
> between arm64 and arm32.
>
> prepare_xen_region, fail_insufficient_regions() will be used by both arm32 and
> arm64. Thus, they have been moved to regions.inc.
>
> *_PRBAR are moved to arm64/sysregs.h.
> *_PRLAR are moved to regions.inc as they are common between arm32 and arm64.
>
> Introduce WRITE_SYSREG_ASM to write to the system registers from regions.inc.
>
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>
> Changes from
>
> v1 -
>
> 1. enable_mpu() now sets HMAIR{0,1} registers. This is similar to what is
> being done in enable_mmu(). All the mm related configurations happen in this
> function.
>
> 2. Fixed some typos.
>
> v2 -
> 1. Extracted the arm64 head.S functions/macros in a common file.
>
> v3 -
> 1. Moved *_PRLAR are moved to prepare_xen_region.inc
>
> 2. enable_boot_cpu_mm() is preserved in mpu/head.S.
>
> 3. STORE_SYSREG is renamed as WRITE_SYSREG_ASM()
>
> 4. LOAD_SYSREG is removed.
>
> 5. No need to save/restore lr in enable_boot_cpu_mm(). IOW, keep it as it was
> in the original code.
>
> v4 -
> 1. Rename prepare_xen_region.inc to common.inc
>
> 2. enable_secondary_cpu_mm() is moved back to mpu/head.S.
>
> v5 -
> 1. Rename common.inc to regions.inc.
>
> 2. WRITE_SYSREG_ASM() in enclosed within #ifdef __ASSEMBLY__.
>
>   xen/arch/arm/arm64/mpu/head.S            | 78 +----------------------
>   xen/arch/arm/include/asm/arm64/sysregs.h | 13 ++++
>   xen/arch/arm/include/asm/mpu/regions.inc | 79 ++++++++++++++++++++++++
>   3 files changed, 93 insertions(+), 77 deletions(-)
>   create mode 100644 xen/arch/arm/include/asm/mpu/regions.inc
>
> diff --git a/xen/arch/arm/arm64/mpu/head.S b/xen/arch/arm/arm64/mpu/head.S
> index ed01993d85..6d336cafbb 100644
> --- a/xen/arch/arm/arm64/mpu/head.S
> +++ b/xen/arch/arm/arm64/mpu/head.S
> @@ -3,83 +3,7 @@
>    * Start-of-day code for an Armv8-R MPU system.
>    */
>   
> -#include <asm/early_printk.h>
> -#include <asm/mpu.h>
> -
> -/* Backgroud region enable/disable */
> -#define SCTLR_ELx_BR    BIT(17, UL)
> -
> -#define REGION_TEXT_PRBAR       0x38    /* SH=11 AP=10 XN=00 */
> -#define REGION_RO_PRBAR         0x3A    /* SH=11 AP=10 XN=10 */
> -#define REGION_DATA_PRBAR       0x32    /* SH=11 AP=00 XN=10 */
> -#define REGION_DEVICE_PRBAR     0x22    /* SH=10 AP=00 XN=10 */
> -
> -#define REGION_NORMAL_PRLAR     0x0f    /* NS=0 ATTR=111 EN=1 */
> -#define REGION_DEVICE_PRLAR     0x09    /* NS=0 ATTR=100 EN=1 */
> -
> -/*
> - * Macro to prepare and set a EL2 MPU memory region.
> - * We will also create an according MPU memory region entry, which
> - * is a structure of pr_t,  in table \prmap.
> - *
> - * sel:         region selector
> - * base:        reg storing base address
> - * limit:       reg storing limit address
> - * prbar:       store computed PRBAR_EL2 value
> - * prlar:       store computed PRLAR_EL2 value
> - * maxcount:    maximum number of EL2 regions supported
> - * attr_prbar:  PRBAR_EL2-related memory attributes. If not specified it will be
> - *              REGION_DATA_PRBAR
> - * attr_prlar:  PRLAR_EL2-related memory attributes. If not specified it will be
> - *              REGION_NORMAL_PRLAR
> - *
> - * Preserves \maxcount
> - * Output:
> - *  \sel: Next available region selector index.
> - * Clobbers \base, \limit, \prbar, \prlar
> - *
> - * Note that all parameters using registers should be distinct.
> - */
> -.macro prepare_xen_region, sel, base, limit, prbar, prlar, maxcount, attr_prbar=REGION_DATA_PRBAR, attr_prlar=REGION_NORMAL_PRLAR
> -    /* Check if the region is empty */
> -    cmp   \base, \limit
> -    beq   1f
> -
> -    /* Check if the number of regions exceeded the count specified in MPUIR_EL2 */
> -    cmp   \sel, \maxcount
> -    bge   fail_insufficient_regions
> -
> -    /* Prepare value for PRBAR_EL2 reg and preserve it in \prbar.*/
> -    and   \base, \base, #MPU_REGION_MASK
> -    mov   \prbar, #\attr_prbar
> -    orr   \prbar, \prbar, \base
> -
> -    /* Limit address should be inclusive */
> -    sub   \limit, \limit, #1
> -    and   \limit, \limit, #MPU_REGION_MASK
> -    mov   \prlar, #\attr_prlar
> -    orr   \prlar, \prlar, \limit
> -
> -    msr   PRSELR_EL2, \sel
> -    isb
> -    msr   PRBAR_EL2, \prbar
> -    msr   PRLAR_EL2, \prlar
> -    dsb   sy
> -    isb
> -
> -    add   \sel, \sel, #1
> -
> -1:
> -.endm
> -
> -/*
> - * Failure caused due to insufficient MPU regions.
> - */
> -FUNC_LOCAL(fail_insufficient_regions)
> -    PRINT("- Selected MPU region is above the implemented number in MPUIR_EL2 -\r\n")
> -1:  wfe
> -    b   1b
> -END(fail_insufficient_regions)
> +#include <asm/mpu/regions.inc>
>   
>   /*
>    * Enable EL2 MPU and data cache
> diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/include/asm/arm64/sysregs.h
> index b593e4028b..dba0248c88 100644
> --- a/xen/arch/arm/include/asm/arm64/sysregs.h
> +++ b/xen/arch/arm/include/asm/arm64/sysregs.h
> @@ -462,6 +462,17 @@
>   #define ZCR_ELx_LEN_SIZE             9
>   #define ZCR_ELx_LEN_MASK             0x1ff
>   
> +#define REGION_TEXT_PRBAR       0x38    /* SH=11 AP=10 XN=00 */
> +#define REGION_RO_PRBAR         0x3A    /* SH=11 AP=10 XN=10 */
> +#define REGION_DATA_PRBAR       0x32    /* SH=11 AP=00 XN=10 */
> +#define REGION_DEVICE_PRBAR     0x22    /* SH=10 AP=00 XN=10 */
> +
> +#ifdef __ASSEMBLY__
> +
> +#define WRITE_SYSREG_ASM(v, name) "msr " __stringify(name,) #v
> +
> +#else /* !__ASSEMBLY__ */

change this to make it consistent as patch 2.

#else /* __ASSEMBLY__ */

- Ayan


