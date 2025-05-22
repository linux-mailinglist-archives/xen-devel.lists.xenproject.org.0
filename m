Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCEE8AC0940
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 12:02:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.993528.1376845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI2kP-0000qO-Io; Thu, 22 May 2025 10:01:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 993528.1376845; Thu, 22 May 2025 10:01:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI2kP-0000oG-Eq; Thu, 22 May 2025 10:01:57 +0000
Received: by outflank-mailman (input) for mailman id 993528;
 Thu, 22 May 2025 10:01:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ayyk=YG=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uI2kO-0000jJ-Ee
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 10:01:56 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20602.outbound.protection.outlook.com
 [2a01:111:f403:2418::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c9cf0111-36f3-11f0-a2fb-13f23c93f187;
 Thu, 22 May 2025 12:01:55 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by DM3PR12MB9350.namprd12.prod.outlook.com (2603:10b6:8:1ae::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Thu, 22 May
 2025 10:01:50 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 10:01:50 +0000
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
X-Inumbo-ID: c9cf0111-36f3-11f0-a2fb-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZyYFfofb7RRxU0Neu6+j7sGaHeKOi9bZbBaQvw33NwZ9H0gcAeQ52e0M9JNICLa57r3oS5vMo/ogyLms/LE+85mWqj60OdokNgoWPrEjwWp9R9vG/0TF0d6U9OkLajzmQeJVNZwoosgvWky9xavL1I59rc1s10YZ59q7BOInPHRQVm8SUdNESX8Ir/tfMyTdPrM6yY5meVi4d6hJnScBk+6o7UJv6gIx+ECB+HKs1XrYtwao/96nyYPHz3ZbuH2e4CcviKp9crLXVBITcEQPHF2WesJUscg2KoVyAe6DF12Nj8OwOaQ/Vk5j8nt5DRRjhGU0noOhQuqsdDppWgQt5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6hyIZAZIXb6CfumXiODnehY590AZP1SGyYkc/rf1q34=;
 b=ihWgoTtGm4V270/P6bFm1sGYZsw4z2K+z7Pmlyzcyiog0mbGI0Al0Eg9qlHwBMarQTMidfJtY4qdpsE29efIO+SKmFp32y+EVvMDDXDLVMvSY68IpP9TZfuOURh1S+k/EG8ai/oJG+XdZracf2ENPk+sKKCTQ2pInpUoK6hZkNh4RfgtvujpE4dquFgk3bXlopWdspBP1x+yUisu+KjbzcNx6YhirchUybFniux0uC6ieRTljuj5GXA3wgBew8Y9Trie9z08XOB0snmZXzfmvD1H/5jwpIFiSMY/wUv3sQSlEs13GzWcG1kX4VLfGOHPvLv1pCZ/dK7B1cfZAXyoOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6hyIZAZIXb6CfumXiODnehY590AZP1SGyYkc/rf1q34=;
 b=HbByJ8UAZAtoHUksgwBnFjMGRvkbbgdOnCu2aRBq4ZfhkMnnwkmPSrpXywfLbwEiC458ns3rysp4dLG3DTJvvKEAygONyF2YG1l32hOhNEflMwM3SzbdtqTGHNz3t8b/zNEMi81OTO0/tJVLqktCjtGTCbCvgt7lTlcfjWlTeSY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <bdbd51cf-1c48-46a1-b79d-d84e7030c170@amd.com>
Date: Thu, 22 May 2025 12:01:46 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/6] arm/mpu: Introduce utility functions for the pr_t
 type
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250513084532.4059388-1-luca.fancellu@arm.com>
 <20250513084532.4059388-6-luca.fancellu@arm.com>
 <ddf26315-ff48-411d-a0ca-9a99867323a7@amd.com>
 <14A6545F-F7C5-412B-8A3D-9EFD293D69AE@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <14A6545F-F7C5-412B-8A3D-9EFD293D69AE@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR05CA0330.eurprd05.prod.outlook.com
 (2603:10a6:20b:491::10) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|DM3PR12MB9350:EE_
X-MS-Office365-Filtering-Correlation-Id: f7838db5-5e84-4937-dba7-08dd9917abb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VkVhSXk0UTdadHhpQjQ3MDFjeHJnREdKYmxUWmZzRnNybi9RcDFSRWgwQnE1?=
 =?utf-8?B?MEpYMlhzREVQK0djT3ZDcDJqcStiQVBOb1h5SVpkUGdROFRIZlhKUjlIem1p?=
 =?utf-8?B?Um95TGovNTVOeGlwSnBWN2hmN09ndFd0Vm1vdVNudStaaHhrV0xvME5XYWNi?=
 =?utf-8?B?clFOWGRzTEZlNmZrcElNWnVlK3pjRU9BQWJOOVJNeVJhUUhDbnpSRkc4dndR?=
 =?utf-8?B?LzJLZHFiSFZCWWNtSHV2bGE1VkZwTVd3MDVvN1M0SW1tamRWNU9qZEVLNHN5?=
 =?utf-8?B?N1RBRHFVK293U0VYWEpLb0xVVEtWL21nQlg4WUpnY25IemRLUXhWR05KVXc3?=
 =?utf-8?B?c0x0Y1c5ZVdSR0d3Zm5ZUVMzdHJqZnUxeERWYS9aNWNVbmtjNHp5akhEWTlU?=
 =?utf-8?B?YUUva3BFLzNPZGE5OHppZUNITmRqcDYyM2MyU3Q5a3VuZjlic2hrYXRrcWV3?=
 =?utf-8?B?NWtaeGs4Tlp3OFZ3T3NzZ1pnMDV3aDZObWlFSm1MN3RnbEdsRzAwV3FjSmcz?=
 =?utf-8?B?NXZOaDZGQ3hmQ2Viem0zOXo5dVlyUU5qWFpGSFdRK1BxNXZVSW5wS251UHhB?=
 =?utf-8?B?VHpQcUhBOHFvbmpUMjFyN1pKcmNxQXViSXE5L2VuWjdjNmJMNVE4V2NEcHlx?=
 =?utf-8?B?eUZ1dUdDbERLY21UNUtnSFc0YXZ4Tkh2QlNYUEg1Ly9CWHNzWHFPdCtIZjBm?=
 =?utf-8?B?SmJ0UnZHdkRRYS9xWUROcHdheHFnTzQzdjk0RWlIUzQzK0dpV29FRXFHQVEv?=
 =?utf-8?B?K1FFOEpmK1R3WmdBSUVPZ05RbUx5UndxUlREOEo4WHY3TXNPdk1lM2FvMTIz?=
 =?utf-8?B?QUovOUU5VS9jaUlFdnh2bU5wVHNIVDNVNm9NTGVxN0R2MlF1MG1CLy8ySUox?=
 =?utf-8?B?OHJPTGx3TnNITE43MThIQ09CYXBZV3NNNnhOL1ZGY2dsejh2K3lORHB0Yk45?=
 =?utf-8?B?UGs1clR4VE4velRVbE1jT3IyU2tGcko2RHRmTmNndGY5SjlEd2QrTTltTE9x?=
 =?utf-8?B?b0hyaHJNS1pUa1RhZ3ZLb2VkVHhacXFuUmpTYXEwVDlxbVNuSHNockxkWWxS?=
 =?utf-8?B?OHE4Q3pQcXM2K2JVV1RVaHd2YThTdldjTXMyRGkwbStWUDdJTWpqazJnOGI0?=
 =?utf-8?B?U2c5TEIrQm5vMDJUWUFRektxbEpMOTFwS3YxcEh2QWpGQjRqVzdVNHFYcW5k?=
 =?utf-8?B?Y3FXUHBwUjdIMVFiNEdTd2ozcjVXait6SHlDckNMWG9XVG45TnRFUTNTeUFT?=
 =?utf-8?B?UWwvZ254dlVDd1IyYTMrSEpCeEg5ZHZrOUdUZlZpT2ZYV3M4NnlOalJCSG82?=
 =?utf-8?B?TmJMQ0tzbHgvZ2pzdGtIOUE2TVlKbzdiTUp1dzFQOE9tVG9kbktvSEc4amtB?=
 =?utf-8?B?M2JTT1Q1ME1sYTFBSGNUSFphbzhlTmJ3L01CMmFlNjJ3c1JZNkdYOEw1QTRz?=
 =?utf-8?B?T3krQTRRSXBoZTdJK093a2swSDVwSm1RT0JJNUU3aENWeE5BUExJSDE2R1Jy?=
 =?utf-8?B?czhVcW9HcGtGUHh1czB3b21RRk43MTN2bk5MUTB5UHhzaDJiL2hHT3RPTkgr?=
 =?utf-8?B?UzJGT2R6elhibERqUWx1TXc5T3FENnBVSmxSUlZBSUFhRHp4ZURJVFhuNk5T?=
 =?utf-8?B?WVhiZE5Wa3NMTXJDTE5odGZWQS9HYVJkdGdJR2NyL1JMQWJXV0lqWmNMVEJh?=
 =?utf-8?B?dmQ1WEp3QmpIcmdDZjd3U0loSHVyb1hnajVzY0NySitURnZtWU50N3ROT1M2?=
 =?utf-8?B?Q2tUOEVqbEdKWEJrUWlpWHJBZTlPRFIxM1M0T0k4eFdDRVRRVXpWMEdsd09V?=
 =?utf-8?B?WVIwTEFJRml6S3V0RXg0K2hKVGJtZG1hdVNNTkMySERkWjNPcENKdTh3SGdv?=
 =?utf-8?B?NUd2V1ZLbDQ0anN3SnJoSVI4U3hHby9WY3dDQlBzaG5SckYvZWV0VjZkMHZG?=
 =?utf-8?Q?kqXHeg7q8ZI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y0VqY3A4Vlgvc3N2cHNZK094eU5Ed2VRUFFvN3Z5dC9wallIRWxmMFZBdVdy?=
 =?utf-8?B?cFZLc1NYRlcxT2YvenVucFkrcWV3SHZoU1FpRUVDaEEwWUh2cXYvbW41alV2?=
 =?utf-8?B?ckxXbzRyR0ljL3UrbkRnWktqckQrMUNSMVlGSi9LQWZ2WTZmeXBUTjRvaGdo?=
 =?utf-8?B?WFYvV0xEYlIzL3pNeVR0ZlRSQTNNTnBxek1PNXhnUis4ZnpRcng0MG9NZXhF?=
 =?utf-8?B?NGl3SjVZbEtYSjJOZC8xd2ZNV29xN283Z0xNMkdBLzl4YWxkQ1o0Z1lWVmdu?=
 =?utf-8?B?NDg3QlFab2h6ejF5UVE1a0hZaW1PRzg4YXFYcGIwN2R0eGdsL0N2QU1xNzNI?=
 =?utf-8?B?dHdsVHNiQ2U2NE5hMTkxVVdCazczOFZHMWJkNHJzM3M4K3pubzh0QU5YT3FK?=
 =?utf-8?B?V28vV0lrMXJIVGUyc00veUJjWXIxRWZLL2cyMlk3czlWazk0VEFHcnYzZU0z?=
 =?utf-8?B?dlJaYlllVFQyT1lidXlyZTBnNmVwY2ZiRkpNZFBZL1NBQ0w3OENBckt2UWpM?=
 =?utf-8?B?U0JhOWVqa2k0RENxMmZ2OXRmRG1kZTRHN2I4OFdkVkZQTXBQOGtwQVhPejM4?=
 =?utf-8?B?cVo5WlYyc0VSa05LeWVrVnVqM25sL3hFSzBEN1ZjTkw4VjZ6Y2VzVkxuQWFq?=
 =?utf-8?B?Z1JzcGZ3dU5HbmdVaUVsdVowNWZYb2NPUCtuSGMzTkordHByQ2h6M0M1YXla?=
 =?utf-8?B?bWI3c0FLdm5NY0laN2pJcVFsQ1pKR25OL2h2RVhiK1M3Q0xwcCtGd0tVQVFX?=
 =?utf-8?B?VUpjRFhMaTRPY3ZvZW56eXVOazdXRTBZaUVKUjlXWWtvMzlSWmcxTUJpUCtW?=
 =?utf-8?B?azBEcEZxMDFOaWlCU3gzeWlIQXo3V09mT3l4WE5BU25INEZmdDZhVG1HVE5r?=
 =?utf-8?B?Mk9aamZvbTRFMUM3eWNrbmRKbTlRTUJwVVZLL2E4MVJFb1dleC9XSm5BMWEy?=
 =?utf-8?B?Vmk3aWhmbjJiZEhqYTBCcmY2bXMwMkVUM3pvc09qc2NPL0JaUHBNTC9SVmdx?=
 =?utf-8?B?elBzYjFJa1BVbFhoWGJGVGE1NFFROGc5WDBvaXEyeklOWnF3bmVGR0JGVGxI?=
 =?utf-8?B?NXBkU3YvcVdNRjJzaHZ3S21XaG5STGRkMlpFV2VQWXNZSUJEMlpxaGV4V1Bn?=
 =?utf-8?B?U0Z6ZzkrV21UYzZUQ2JiM21qaDlra3U1ZzBxMnlaMlJGK1RERTUzVDh1Tkto?=
 =?utf-8?B?Q2RiQ1o1VzIvb2IxTTN2SzkrMGFOQkhsYlc3MU42aFE0RGQ5azlSMHhVQldt?=
 =?utf-8?B?ZU9mVVNSK3RYT1grVURHZ2tqdHZUbmlsdjdlRkFMQ1MzejZhK3d0OXB1bVp4?=
 =?utf-8?B?UFZLN2lhUDd5d0ZFZjc5VFVvN3JjK1dvcGxpaFJmbUU4SE1KajcrSjBrWXFs?=
 =?utf-8?B?VlExdWxBVGhrM05iYXh3aVJrM1BnQWVUQmlMMUp2QktqSnhHN1pQLzRCV0tt?=
 =?utf-8?B?bHQvN3FHSjFkOGJBTUJLOURQdHVTNW5tZGZQVDV6T2dxYW1ZVWVRRlFjV2pG?=
 =?utf-8?B?akRGS25XM3BNaXkvb0ZUWnNKOVQwSjNncFEwa1BkY294QzBKOW81VllYQ3cv?=
 =?utf-8?B?eE1sWDN0c1p6T3k0SGhPNXQ1VE5jOUtXakJJcTBjOVRmS3FCOTZNVTE1emlz?=
 =?utf-8?B?RXNUUmJyaXNiWGF1cVU4R2tMam1QQ2JhV0ppSUtkZWsxRGlKQmZPOW9jN2Ns?=
 =?utf-8?B?UGptK3NFSzRqZUkxbFVIR0R4TFFhdkN1VHh6cThrSXNuZFFFVUhZOWxXM2t0?=
 =?utf-8?B?VWQ5VGdadnRWSDlSQjhNZC9XbVk0ZWFBOHBMUXUxOXRNZWx2NkFROW12MjdY?=
 =?utf-8?B?OVpmbThmY1dZbURMQTd3UU1NQW1nK0p1VGlHMkprU1BxZ2hpVEc3blVMNlFy?=
 =?utf-8?B?ZUQ1VWNQVVFhM3RDcm9xQjJmNWlHU3B6TXJwMUdZOFpQeGpJNjhrck9tZ3cr?=
 =?utf-8?B?NkZEYXZCZldHRUxsRG9aWFYxZ3YvaEptdVdEVi9nUWtIWDMwSmNoM2IrR0g1?=
 =?utf-8?B?VElYYUhUQkMvekRXZFcyQU0zL0VMWi9lTnRkN1poU0wvd1BvK1Y4TjRiZ21W?=
 =?utf-8?B?djVucm1Nb0NGYXR3SDZFSk9CWXQvTU5BdVMvdVR6MWVuUGxzazk3RHBEazll?=
 =?utf-8?Q?AE0Q=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7838db5-5e84-4937-dba7-08dd9917abb3
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 10:01:50.2639
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KtwS31M9x/SQs/0eHBJRPM9O5kOmxhq1fLiwFfy9hGYg6NuEYX2xXaj1hmiHJ7+/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9350



On 22/05/2025 11:56, Luca Fancellu wrote:
> Hi Michal,
> 
>>> +
>>> +/*
>>> + * Set limit address of MPU protection region.
>>> + *
>>> + * @pr: pointer to the protection region structure.
>>> + * @limit: exclusive address as limit of the protection region.
>>> + */
>>> +static inline void pr_set_limit(pr_t *pr, paddr_t limit)
>>> +{
>>> +    pr->prlar.reg.limit = (((limit - 1) & ~MPU_REGION_RES0)
>> Might be worth adding a comment that PRLAR expects inclusive limit hence (limit -1).
> 
> You mean on top of the assignment? I’ve probably misunderstood you comment in the past version
> and thought that the @limit description was enough, I’m ok to add also this comment.
The comment says that the address must be exclusive. The code then transforms it
into inclusive before the write, so one might wonder why.

~Michal


