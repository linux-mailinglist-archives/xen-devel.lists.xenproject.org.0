Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C2CC59E12
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 20:59:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1162107.1489888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJdT6-0006jr-6C; Thu, 13 Nov 2025 19:58:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1162107.1489888; Thu, 13 Nov 2025 19:58:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJdT6-0006gm-3L; Thu, 13 Nov 2025 19:58:56 +0000
Received: by outflank-mailman (input) for mailman id 1162107;
 Thu, 13 Nov 2025 19:58:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X5Bi=5V=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vJdT5-0006gg-9m
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 19:58:55 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d42d4b7-c0cb-11f0-980a-7dc792cee155;
 Thu, 13 Nov 2025 20:58:52 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MN2PR03MB5327.namprd03.prod.outlook.com (2603:10b6:208:19e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 19:58:48 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 19:58:48 +0000
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
X-Inumbo-ID: 2d42d4b7-c0cb-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TEW8ro3MOTRvgIOVVg7sMlyOihF7bL+MRg/f/kWZRzRnuoRVC6kYajMqdTEEFr2O88QyEogv2PcAtbzgum5pDb+UlgiwrJD5BWnsVfmj5oSoy+mV5fTJKC/F31SsuII//vJ2a/WB02q9YI2bQzyw9nUtAnd8TwGHe6996in/rcWfDFcH5qS3KHopZJzm/gEeesCiRyS968sFIHHcxshfyDPV+A9SxH37X97qC5dTPKItLrpawcAO0AJJgL8hQDQc4uQqHVa0o2odtXLqDr1nDAXx+oGU829c5XGkLAIQbt0c1nMN8NbYnPMtwnSaN2kvyiwr4rMzHBGE+xD8V5kMyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CbqumO1CUiVeACH0gSM0e5LyXhxLPw+Av9ldOzNC+Go=;
 b=fingMKKuOojz+fWn9yQnJzlKpMB+4s4fWtIMrx7wcs5n/ZicScY+deLz9W0VjU5x0ST9BwKvqYZzlQSyDejgS6hItDbr9N6DliQZJoaUpga775nLhiVxmhvouI0Zf5QoRvAO1y4qyaZ32Y17LyjEOW9WNLwYIqlADdkamve+y0if5Hak1QKf+opyBJmUCPViVETIGJ1xkrzjYesOpbUyjFwj6oWimOcAR7nGC4RxWHDLAp1m/tZQA9W8JKTYxFMolxuF7KJbHESrh9qEuXxk0MGGav8gwYH2/HFQTmX7AbE5IdMLwKRIcZcxLzN8RHtqXNl/3STO0tldSy3lFPWcSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CbqumO1CUiVeACH0gSM0e5LyXhxLPw+Av9ldOzNC+Go=;
 b=gSSn+gPIW+S9BCISOVtbQzIwnOdlkyn4BijMrg/aaz5CCazRiUPPSqlLLQRIUr7HpV5DYvTiV9pUUIAS3XtMpDkv7qMjD+Egf10i+8uhZfcZpB2ccfoy+OAda/AqV2fEDdNRU3aatrfbLHLJzXPKfSrWW9dVqGBDV65bbPnrDss=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <870d7330-5563-4c45-8a45-03734e75d92b@citrix.com>
Date: Thu, 13 Nov 2025 19:58:45 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] config: remove unused paths from config/Paths.mk.in
To: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <20251111161959.13667-1-jgross@suse.com>
 <20251111161959.13667-5-jgross@suse.com>
 <4cfc4f5b-1d7e-4f69-9bfd-99ac0f65ac97@suse.com>
 <5bb5c2d8-53bd-4669-9238-6ae8ab8d349c@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <5bb5c2d8-53bd-4669-9238-6ae8ab8d349c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0302.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::26) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MN2PR03MB5327:EE_
X-MS-Office365-Filtering-Correlation-Id: a932e041-e2f8-44b4-af99-08de22ef0f54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NkdGOTVqVGlRb0VyUnhnOVAxREE4cE1SME1DcFBkdzVIdkh6eU50S2pYMlJ1?=
 =?utf-8?B?SFY5a2syYVl5cURKUzlUMnN3MVFkN1JRaEJlUHY3WjVqMTVVOWdrMUdWcXd6?=
 =?utf-8?B?K3loUHBFd2FsTDh6b2szRTJHQkxNd1Z5RFBMT243ZkFyYWZJTkZFdzlBQ0d6?=
 =?utf-8?B?aHVFbjBVSnYza2ZBYUNEWGl3aW1qdFU3ZmJ1V3dQUmtCU2F2ZElaMWU4RjRl?=
 =?utf-8?B?OUdrNlF4RlU4YzFYRmp5YzBkVHJWZXhuQW9qdmgzNTRQQ2RXOURJK3RwTG5Q?=
 =?utf-8?B?WnlWQWtEN2ZwSHQwQUx6RkZid1gzU0U1OEtTdnFIU3E5YUF0N2hDS09nYTdO?=
 =?utf-8?B?MG5wdHNYUnZJbllEU0c3YzJ4SUt6TFZhN2xVaXBRR0ZHQ1ZKVHJCdXBmZTVL?=
 =?utf-8?B?VktPc0NRdFRPV1VOdmx4OVBIWGY0K0NzUWlIYXJzcElna3o5Z1lkOCtVL0g4?=
 =?utf-8?B?a0NVT1dLZ2F0K2ZmYWxFRDhUbUk4SEZ6RTNydk5XQ2FrQ0FHa0tZQTZiZWVW?=
 =?utf-8?B?NGhLdVRSbnlPTXlzMU1PNnRsUnJ3dnAzWmxsZURWZnF4OGFqQXRFc2VNVWJo?=
 =?utf-8?B?VFg1c2lPU0pWUk1zbkkvZ21wMENiWHdPbGxsY21LSm9lTUsyRmRpN2pwbndj?=
 =?utf-8?B?T3g1UVR4SzFYQ0FHVi82L1NoUmIvOVNheE1lSUlYUXNSMmloZm13bHlXNWFn?=
 =?utf-8?B?NVU0enlVS1NBZXJEVlpMOHB3ajVtNE50eUZnU21ONXBNQUJCaHhhSms3a0JN?=
 =?utf-8?B?dGdNak9vVHlYcTRSTzZkOTNRbXFMYUZSekxPSDBsbnR6VGUyVnNyenBZWVZS?=
 =?utf-8?B?NkdPOUFPOUUxMUpHY2dxUXQwY1hqbW5Nc3R1V2lMcXpTclppQUZkenBmQ0l3?=
 =?utf-8?B?RE8rK21JWW1ZS2tiVzBFeVdpNUJLSmdObnp1b1p2ZGVET0NWTGExTW9vQ3d0?=
 =?utf-8?B?THYxZ1pCaEZLSkIzQlcwRTFSWGpxZjBSRE9vQ2lNWVlqOHdQQktFOTdTRFlw?=
 =?utf-8?B?clBWVXJIWUc0TmtLQVA5alUzSWlFL0VMcVNyMHpndGtuUUZ1ZE1jWDRmdHA0?=
 =?utf-8?B?SGZRSzNVRVU1QjBUM3UyRHAzWjBBeGtJaXRjRGxKVloyWjc2UUQ4bE1YTTlU?=
 =?utf-8?B?U1ZkcjZ0V3hyZmd4WCtWVDRmck1iVkFxci8rakwyMTh6MkNxTzVqcm0vY2Fn?=
 =?utf-8?B?T2tOcVFaeFFacXkxekNlVEF4UUpja3hpb3pDRzJjcnB4TWdZNFVvVFE2SVpJ?=
 =?utf-8?B?QXBFbmNDb08vVG04ZGozSWM1M212eFA4dVlGNWh4OUEwMVlDTmJnamQ2OTUw?=
 =?utf-8?B?VFZjNk5aMDBHMGNYa0JSbUdlVnVEbkpwaFZndWVlWEpxVlJteWdTQVREK3No?=
 =?utf-8?B?b3VpYXBNYWY4ejJFVFRNdEZBdFM0cHZQTVVrbnYwbDUxSTlXQXZLaTlQTGd3?=
 =?utf-8?B?NnlmVENZcGFNTi9BMkNxVWNia2VHTXNmWnZqQW02NkJKTW11RVd6ZzJ3NEQw?=
 =?utf-8?B?S1g4TmQvZVVCT3MxOW5HZFVRbVErbG5EeEwxY3hKTmswSXlJS1YrR0laUVNs?=
 =?utf-8?B?aUNjS2ZjRDlQSGN3bFhXUU44OWFvS0FlaTRMZWkwaHVJRFJqVU9MVW9WQVMr?=
 =?utf-8?B?MVFvWUFLZWdYK0RtQWRPOWNlbzQ1SGYrME9ySjNLUno1c2lkcVA4bENVOHQv?=
 =?utf-8?B?cDl4WU1MRHlRYWpQeGJyV0xWSkNlVXRmUUJmQTlTWEgyUVNGMjZ3azN1N0lk?=
 =?utf-8?B?ZmxhOWJyNmJFd1FaS3dhL0NONHFqNG5PWmNuN1NDdHFnSzd0eldiYUJRSjBI?=
 =?utf-8?B?c1N0ajQ5czVsR2FydmpVWHBOcm9yMENNRUhPdzRWdUg5eXQzRE5Jb1ZFSEJj?=
 =?utf-8?B?bmREaUcxeUNJTVVhbnZHK21kM3dDOXlLYURzbkx1UmZMMERiS3VvQ3duYStQ?=
 =?utf-8?B?NFBtSEZFZkEyRGhxWWtWVFdaVG1ZYzBhdXRLaURrOXNHUVRXM1hKOFYvNkwx?=
 =?utf-8?B?UjVMK09pbytRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WVpZVDQzeUsvc0hnOXZ0Nkg4L0tRdlZqTk9Od0F2Ujk5emNjZEFxMmdZbWdK?=
 =?utf-8?B?eW80TnFkNWFrUlRaSlRWaE4zazdjVmlMVHY4d1daQXlCSHlLM3FFcWtmV1J2?=
 =?utf-8?B?Z1MvYnYxMlVVcU8zZklZbGt2bnZqbjc4SDFnQlhuMVpETGVVby9ycEJHTEpk?=
 =?utf-8?B?K0dMN2RHMlRNZlRFVmEydFo5UkYzRnNzMDZjaTlIYnhMWmFDNGNFU2JvVEZI?=
 =?utf-8?B?blpBZGp4UnVZMGxvMXgwQnZoUGxUaDhuUndYdmdMa25GUGU0SlF2Si9ESERC?=
 =?utf-8?B?K2pxNjFKRXV1TFBqOWhSNHBQTFkvakpyZ0todCtNUHQwMGtKbnpqanpuMlNI?=
 =?utf-8?B?KzFaMHBsYVZabW5Uam1SckVlZXJzUFcwVi9nT2U2KzNUKzJaaUZCZmFTNTEw?=
 =?utf-8?B?d1RqRkwvNnJCeE14NXkyaFd0dVRXOFlXQi9hWm1MQkVVMnNsUzNEYy84Yjkw?=
 =?utf-8?B?UzlMRlVVeG5MYmRRTnoyOGtVYmw4Yi9DQ3ZOcDVqcHBVVmpwakdrbUJQSVZt?=
 =?utf-8?B?a0Z3VlFHeFBtQ0lLVHJXYXZXSU1tSlYwQ0RYM09lbU9Yc0lkdWtXSUlENDlP?=
 =?utf-8?B?VGNPZHFZWWFxMnFzRU5MYU5MUW5ITlY5RW43NEJjOWV0bi9HZGFnem1TbGNP?=
 =?utf-8?B?cWx4cEg2dFNlM3ZCU2NkSjN5YUVibWpFUVVWOW9OZWNHV1BvTEp3OStjeStO?=
 =?utf-8?B?N1Z1ZjVobEVIZmZkRnRmVHJnK3VaV09CR3JDTURnempmOVI5WlhQVHFuTE5O?=
 =?utf-8?B?SDV0ZUtqRjBpZjJ3TlFGWTJoaHhIMmU4ZjNzdFJ2aWVQOE5xNG9YUHdMd25D?=
 =?utf-8?B?S1RHYXVpQzR6L2wzcUJ5RHdLWXRhd082aCt6Q2tzN2xIbjJZQU13MEY2Q2Iv?=
 =?utf-8?B?YWZkM05Gc0wxR3g4RUlRM25XRHMyMjgzZGNvdnBwWFlTSWhERmhPR0Y3d0I2?=
 =?utf-8?B?akpsTW9tN25EYUV1cGxya2QyM1d3WEFIWXg2VHl6VEEyRm1vRXpIM3ZZalMz?=
 =?utf-8?B?L24ycERQS1YzellPb0NCTWhRUk1JVHBDT3pTYVBLek1zVFkyTHpmNWJvdUZQ?=
 =?utf-8?B?T3ROMlIxUWlqc1g3NzB3TGxacjVPTUxGeUU5TVJmdy8yZ0hmSERDUytMYll6?=
 =?utf-8?B?U09tY2JzVUNNQ2Z3cHhYZTdWWTZ3QnZ6eVFIVUh5bnFzN3VRQ2ZyRjBmSHh1?=
 =?utf-8?B?MTRJb29YSGJzQS9CcnBIaWtQNlFDRnZIaGZjaUtNTCtKK1ZqZGNjRnBVNmVW?=
 =?utf-8?B?UHc3ZWJLcHdGQjdCc2ZXSnFHS1g2Q285WUJYd1ZxQU45NjZhS2FpUUpiNGFY?=
 =?utf-8?B?dk1BVWk3RFVlVHJBMnFhckZvaEMwNHdpV1poV2lnQnBFOEk0OFJYNWd2WGJ2?=
 =?utf-8?B?MjBjNnlQaW91N2RrUFlUVWFra1YwYlM0MGt3VkZTK0U4VVhmdkJ4QnRyYytL?=
 =?utf-8?B?Mms2RjFBbngyczJOQTc2WkpHYm9kK2Q5cy9PT0NzNnlkSUFmbG9aNjBDaFVB?=
 =?utf-8?B?NkQyRWljU2pZcmZ5MHJiTFBPYlQ1TnA4UjJ4T0h1bi9nRHgwUCtVd0k3U2Ix?=
 =?utf-8?B?TS9RM1pJRFNZY2lYQzF2b1Evc0QxeGxIVS9acDBzZEtYdTBBYlFrMkpPMGVx?=
 =?utf-8?B?WjFRaGJpWTJvM3kyUDF0NTVZU3dQUW0wRkpMbTBtbmhldVBWand4YndScnJi?=
 =?utf-8?B?SXNpMzYzdzBSTzJ6WXlsbjhNazBsNnF5VTNaaEtINlRxd1I1ekFOZGxBSG16?=
 =?utf-8?B?Ry8xUTFKUWVHTWhMdGgxQkhTVllDZUFHZkdyM2VKMGJqWUpvKzdqVVJVMzdK?=
 =?utf-8?B?UEk5eU5PYTZaVlJnd2xqaU5tWWhNemFvbFVNQzBlb05qZ0JrRmI1M0V6ek5S?=
 =?utf-8?B?MmVtZmlCZFNBMGFwd3c2ZVl6aW43c3A1RUtkN0FyRlRheDRWSlBwdktYbktJ?=
 =?utf-8?B?N2NnUEVqbzZmb3orYXEyYmNrVnZkeEVFSS9wSGdmRDBHRGowYUZ1dWhQUEJ1?=
 =?utf-8?B?T3FKVklFay9vWTN5cmVwZGw3dUowUGFsRHFMRzJFYXVjeUxDQkpBdUNrc2ND?=
 =?utf-8?B?R1g4ejVNclg4WEJNeXE4c3FFVlYyWDNrMmNBZmpFTFlyVjErWjN1aE5lL1VM?=
 =?utf-8?B?eEpmcUlmaTRvbGh6eS9FWFF4M2ZnVlQvczJmWkdaMlJveUxPNnNEU1UvQ01C?=
 =?utf-8?B?RFE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a932e041-e2f8-44b4-af99-08de22ef0f54
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 19:58:48.4931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aoC8J+7bVpZm/5A1doP0T0D1gdkdWfyN5atUnyVi7gIYqCShi7Fc5m7TwRsRnECGoso6zaR3R+iG9COIP2hlrdjWEj3MxkdqkMiIgNLnnEs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5327

On 13/11/2025 5:02 pm, Jan Beulich wrote:
> On 13.11.2025 17:59, Jan Beulich wrote:
>> On 11.11.2025 17:19, Juergen Gross wrote:
>>> --- a/config/Paths.mk.in
>>> +++ b/config/Paths.mk.in
>>> @@ -20,10 +20,7 @@ libexecdir               := @libexecdir@
>>>  datarootdir              := @datarootdir@
>>>  mandir                   := @mandir@
>>>  docdir                   := @docdir@
>>> -dvidir                   := @dvidir@
>>>  htmldir                  := @htmldir@
>>> -pdfdir                   := @pdfdir@
>> Question is whether we're mistakenly not respecting in particular this one,
>> for the *.pdf we create. For all the others I agree there's no (present or
>> potential) use. I notice though that docs/Makefile cleans e.g. *.dvi
>> nevertheless.
> Actually, I can't spot a use of htmldir either, when likely we should respect
> that one, too.

Besides the manpages, nothing generated in docs/ is really fit to
package for end users.  There's no coherent structure, some of it is
straight braindumps from developers.

docdir is only used by the {un,}install-html targets (opencoding
htmldir), and the rm in the install target is further evidence to the
unsuitability of what's there.

I'd go so far as to suggest we should drop install-html, except that it
would break the generation of https://xenbits.xen.org/docs/unstable/

~Andrew

