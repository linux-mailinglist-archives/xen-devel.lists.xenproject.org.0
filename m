Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2658AACD82F
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jun 2025 09:02:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1005126.1384636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMi7f-00057E-Om; Wed, 04 Jun 2025 07:01:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1005126.1384636; Wed, 04 Jun 2025 07:01:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMi7f-000549-LU; Wed, 04 Jun 2025 07:01:15 +0000
Received: by outflank-mailman (input) for mailman id 1005126;
 Wed, 04 Jun 2025 07:01:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WUNH=YT=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uMi7d-000542-QG
 for xen-devel@lists.xenproject.org; Wed, 04 Jun 2025 07:01:14 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2061e.outbound.protection.outlook.com
 [2a01:111:f403:2407::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aee08c71-4111-11f0-b894-0df219b8e170;
 Wed, 04 Jun 2025 09:01:05 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by BL1PR12MB5899.namprd12.prod.outlook.com (2603:10b6:208:397::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Wed, 4 Jun
 2025 07:01:01 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8792.034; Wed, 4 Jun 2025
 07:01:01 +0000
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
X-Inumbo-ID: aee08c71-4111-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KbZLmrMvWXDka6uT9OhlWbyWvlTPCQAYEoRQ8J3ctt6rskasqz8x0xIZfnpvnBF0WajI2XUPy0aTwUiPLyayHdWmLlnlVC4RJ2AP9u66rjFjYBtOjOuRPY7VJRRSdyh5CgfszvhRR3+iFGdtTSxT8pUnv9+H97QS/UhELMjoTKsxRfnDZLGMJM4AgR0E5Rh8MEKn4WJzgtvd9O4Rd5nWinbKSU2fd9v33tM3QiKno2oDdZxdYkEeEkcZcrFpZz/qTjKYuCnnmA8GFKBin6oBGtiLwFk98LfWOAkoq9+MalrpBcjr+UyaC9X93m1N0Bb5uDzBz1JXKo9Dha3LQJnrUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RPgnn9uUfAEefzWq1OSr6YrAA1PzqHiV8NmfF8vMYGI=;
 b=aPTgAZY4iiZ3wjdb4OGgXSDmpVw4tIpYnpM5QJogsaPpV98P2wTwxzSXF0Nn3kcqjET7ul4Mpnzydtk44/lb2a/tdBEocaRZRPkzPU3EqlAjFKZ5Z14+uLyIIio+lz1ZYtQde2KUna/0Gj6ucrkN+NaEaJ4CDZQ7ilH26vFP6NzLoaevF5A4MSvxEhlYWyZwBg5pqHSCPmL1yI7w5zvVDNqYQmKujjf8gWyJJzl2LhTQinfbpPpwrXUfOsuWHXLa7wyu+IWALC4H17jPQaJdJZqyw+4gnFBfRTK2CaUt+gLBiDhTQC1yIMK4B4Fktz35FdaTUyooyzkBYktL/UTeFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RPgnn9uUfAEefzWq1OSr6YrAA1PzqHiV8NmfF8vMYGI=;
 b=ldrG1qGAldHu7mNA7FCadScR5UseiKpDHd/F05amXHvyaVSxIpPo5jfSKqhYNunNJPA9yWJlt7eEzHiCudbK1jyvuLyhhL0q8rO5iXUkwgO9Q8IkuYKAaSv0UssP9ysIb7lusPrF++jpll2t2IooqWTjO3bGyM7NOeiRoI8od3c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <28b22fa6-c6f9-463e-8e7e-0a00eae88737@amd.com>
Date: Wed, 4 Jun 2025 09:00:55 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] xen/arm: exclude xen,reg from direct-map domU
 extended regions
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250513195452.699600-1-stewart.hildebrand@amd.com>
 <20250513195452.699600-2-stewart.hildebrand@amd.com>
 <54c3d341-1d7f-428d-89a7-ce4fcae8a5db@amd.com>
 <4bd41362-6ee4-44d7-9f9b-0ffd78f1e6f8@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <4bd41362-6ee4-44d7-9f9b-0ffd78f1e6f8@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0177.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::20) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|BL1PR12MB5899:EE_
X-MS-Office365-Filtering-Correlation-Id: b5c4ba71-21ad-4612-ae58-08dda33590e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z1dYSW8vYUJ2bHNibFRxMmZZMmlLaWNlTHJCMFRqQTlIY0cwNUYySlhmUmt6?=
 =?utf-8?B?MmhMY2dOS2xzZGxXNjc4L3lBMmVDS3UrN2N0ejlJaTJvTG1NYlQ4TWJmbFB0?=
 =?utf-8?B?WGhxWGFhRXZ5NThxbnp1bi9KZ2FMSmRqb3BMSWRpcHZWQ3FzWEtUclRRbGxE?=
 =?utf-8?B?Q1ZrOVJ0aVJ4cTQ1Z09sa0hPTEwzMTUxQUoxbFVycEVSNmphVThYbHYrZzdo?=
 =?utf-8?B?MU9wNytQa0tMdVpGQnozcFM4d0ZqNW1NSEdNcVpyT3BXSm5UR09TL0hOTWY2?=
 =?utf-8?B?elFGQ3hmSDN3S2p6bDdWZ1c5b3o5RTFONG1aNFlaRU5Qdkk4V09SRXE5TmZX?=
 =?utf-8?B?WWNuYkFMRXZFem81Q3AvUk9KcGZGYVhWSFU5aVgzN043a2dLS2hiNU1ZU0Ez?=
 =?utf-8?B?ZmhmVzNuWll6QWpiRVZXaVUzLzBmVlA0ekJGNGllQ1RnamlOajBoUHZMNzZD?=
 =?utf-8?B?QnA4VkxqTXJtTmpDKzRTVHBhY1VZS3RVZlI3ampkL1hPMU43ZjZnN2FDd1FK?=
 =?utf-8?B?RXA2dU1FM2dDRTVpZ01kMWdmRnhEVXAxRE1vMTA3TXV5NXN5b3YvNkpqQzJS?=
 =?utf-8?B?VFFSTWhlMGtMYjFoeVhPTkpodlE0cnhnVmF6SExSY2NyVkF4c1ZIaGRWY21V?=
 =?utf-8?B?YXpYQVRVTWM0RmVpYm5jRktVSnY1RWpWRzlHYXZ4K0RZd2JQUVBjZ2U4bWlx?=
 =?utf-8?B?MUJ1Q3lsemNiN290OUhrRzdsajRsVEdMV21adGRnRUpQc0lla2o3RVhtVkxT?=
 =?utf-8?B?UFA4ZzAvY3RZZE9jY3pMNmZzWCtvY2hibit4OVpjOUZUQW96b3ZzUGhSNTU0?=
 =?utf-8?B?S1Z2NjJzVk03U3BQMkJYTU5nTko4cGdFcTRKREF2NzhZVEhCRXF5UE1wSVY1?=
 =?utf-8?B?RWxoWi9HS1IyLzh5Y0R1dnZtM1NxU2RCaWRUZkNYRTdaTU9UNmxEMUlEUmlv?=
 =?utf-8?B?VzBCLzV4S1JkWVNpMUlVMnR1NWx1UGFMT0gvK2lndTZNRE9yK3k0anZZeUpt?=
 =?utf-8?B?Sk00bVBYTXBrZlg4TUFoalJHY1lYWkdTdzlYK2hVVWhkTXFtNTgzQ3lCL2k5?=
 =?utf-8?B?TGNpR2d2SkFFUTNXRTNmeVFpb0oyaHBXeWxXVlloMzhySVZ5bUJ1VThXRHlo?=
 =?utf-8?B?Ni9qYkIxWVlyUDBrbmhHL1RhOFhHcXgzKzIzdWNpRWxNbVl0QkpBYUdtQ1J0?=
 =?utf-8?B?NVdjL0JpbnRwTkdVS1dmZFBoZEk4RDJTT3J1a3pxN1Y1aG80dTgray9Nd1gx?=
 =?utf-8?B?SXZmcGppQURNRXVJeEx4aUw3RjVlVnZZZStTVTVDbmtYL0UvWlQ5c0xhY3hN?=
 =?utf-8?B?WTJzSC9yMlBNbjFMWTBGVkx6cHBZTHlQWGFRMDd4ZE5BN1ZNc2t2OURIa29q?=
 =?utf-8?B?bjZJOFlsOGJhcC9TUU11UTVCdDljeUJnK2hFZ1dFQ2JhS21nbERsb1VkeVg2?=
 =?utf-8?B?ak1kbFk4bHBXYUNpZHZTdVdtWk1TeDdiY3VRZ1pmZS8zcG9CUFI5MnY2bUxr?=
 =?utf-8?B?enhObmtRcEErNnk4czVwQllKWHE4Nkt5WW00REM1dEpjMWRTWkE5cm1veEoy?=
 =?utf-8?B?MHd1Z1orUVVMc2pvdGxXZnQ1ZDE2V3lGTVJvTDRReVAzKzFvMFJwbkx3Y21a?=
 =?utf-8?B?aUd2K2xiMzNLSmhJRTVRNFVhK3dSU3JGNWdFYVNJVWJDZU5BQVJ4T2ZzS21O?=
 =?utf-8?B?aHRCK2pzYzJDTExwUmNmTFFDVDA3c3ZTNnVqMXdyd3o2RmlCbW8yZ2wxQlNW?=
 =?utf-8?B?VGVHRVZtRFdpbkNIbkdSZ29wUklGRUpJOS9BcFpsY3AvSFkxYVlmN25qYmd4?=
 =?utf-8?B?WU45MXJYOHNEclBJbkRaeDdqV2ZsRXU0bGNvYjV3S1dmRzRhcEE5N1Vnb1Zs?=
 =?utf-8?B?Q0NvMlZ4bkhIK3huTC84NVF3NTFZRzVROCtpOGJsM3hUazJoNDl5SlM3WGF6?=
 =?utf-8?Q?h9ogQotW4Js=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eVdma1U2NzFtR3MzSkxkVEtkNzY4elFyWkMrV3FKaFBvekorbEFURzFySHE2?=
 =?utf-8?B?U091bWM0NDlLb2JDY2JTSXJVbCtSbnhJY0dtOGtpYWhrbEhCS3Rzck1YVWlV?=
 =?utf-8?B?eklNK0ZiekM1aUxPSS9lTlZWZ1JxOG5KRkF3eGZjL1Bnb21Na2RKbyt6Uk1U?=
 =?utf-8?B?bElXcXZDNzFyUEZObHdXOWVwRjhzMWUwSDltalVEcjJBdG9ieEtwT0g4cmZz?=
 =?utf-8?B?WWw3UjV6aTR5UE9rektPb09qV3V1eDh3VExpa1lEYk5SRm1GVnJlb0Rkdjha?=
 =?utf-8?B?dEU4Zm94MTUvMGhmMkN4c3RXS1VPdnhSUk14VXRmcUJEdFFNanR0N3FmN3dp?=
 =?utf-8?B?WWQvSVVudHVGQVFGVmsrZ2wrZExUK1BYNEJpclhRcDJEYjlKU3o3OE1XaHox?=
 =?utf-8?B?R1k2M090TUFybmtyVnF3UmVHTU1oZDN5L21vOWZqMnc3K2ljbUthc1JDYUJJ?=
 =?utf-8?B?TFRXSUpnN1hCaStvZDU5SlVTVGZsVXRxNk5zQ0V5cUN3R2cycDhNNThWS0RI?=
 =?utf-8?B?YUZLYmRLYXdFZzZGZnU4a2t0WlZwbExZRmVjTi9hVXV5WDd3WVVGYUZEeTlO?=
 =?utf-8?B?Z1djTUo1a2taT0tkaEdCSCsrWjd5ZHFhYVdDb3d0M29UTGIxL2tXNE40b1N3?=
 =?utf-8?B?WDczR1FnQXUvTXJWS2Jsd3ViT1R2VjUzSWxkQ2szVFg3Sng5eURGUzF1aUhJ?=
 =?utf-8?B?d2h4KzY2MGsvYnpnREw4MXBIYUxmMnRDVHd4ekZrNEVscWxtNlQ1eE1mZnZu?=
 =?utf-8?B?R2Q5REw5L1FlamZLa1JxL2VOc3VRdmdpSkZYQ2ZKMkhjWTg5ZXR3VFhNVTc5?=
 =?utf-8?B?NWRDSUVpdnIxVktxWThiemhSV0JyNEJUZEIxY3BydDBsOVR1ZXNINXZNcTR2?=
 =?utf-8?B?cnBZS2lBenpJQ2RidS9UWFBkTm9kdzVXMjhMcThDbVVvWnBvUkx3L3I2THlG?=
 =?utf-8?B?eUVZTTZxZjZXTEVNSnJCWXo3Ym9rQkJMTHI5bGs1YWhWOEdhSU5aOGtPbC9v?=
 =?utf-8?B?Y2t0Q3dPZzltdDdvOEVlSUh0dld0NTlrdUNRQnhvbVlGeTNHNjVHR3lraFpD?=
 =?utf-8?B?ejdaV3hxd2RvK0FzUEdIYk9jR1pLSFh2VDBWNk9VQWlNalpGZ3FPczJ3RmEz?=
 =?utf-8?B?RGpKRUM1NlN3TlRvek9WcjdiUXNHM2UzMHphNDdaQThOK0YyNGNnWGw3dWNi?=
 =?utf-8?B?VlFvbkZ1U1NDL083WTdFY1YxaExLR29vR0g5T1MzSkdMNlhpK1pVNXExYVFU?=
 =?utf-8?B?LzRzbWx6RWV1cW1xbDNLWVloZktHNHZGblNxMXlScmlZVEJ1M3VZWjNvMDJY?=
 =?utf-8?B?SFFjZk9jOU0zQ1RLa3dWVkRZS1JkT3FOWWU0ajZJeUxUUjRLTnI5MVJXQlFr?=
 =?utf-8?B?NjBWdGtpb212RXQ3Sy80bmF5OG4rTzJod1c3eHBNWm9qd1NNZFZIRWEyQmpG?=
 =?utf-8?B?UzF2aFRKaitxajdiK012L1pHNlVzVXRUbStja2VhcWpZWmI0WEtENEJnaFFp?=
 =?utf-8?B?cy9jcjZtdzFMTUo5c2NzdC9uZW5zeFVVb3llWWlyVjZITmFHeFpFY3lNS01C?=
 =?utf-8?B?UmVZN1Y5UUpmbXJYZXlsNGM1TlBucHhYd2drZndWV1lKWXBCVEwrbXJKb0Zs?=
 =?utf-8?B?UWFqcGFTZkd2c1NGOXdTbkZDR2NkL1JvdVpxWlc2amN1a2h0Ymc0WTFhVG1N?=
 =?utf-8?B?aG9GV3V3NDFwemtTb1BJck1haWtGNnpUTk5VYWxNc1NqTVExVkpmUi9CSWtj?=
 =?utf-8?B?WWhIdEdHQUxTUVN6WlhpMmRPK3ZmL2VXUGRIck1wTlNqZTI2dHVDTjU1OXQ0?=
 =?utf-8?B?cENzTGNyc3FoZHR4ZHlhbjMwZGQzUnY4WEZ3RXA2RUZINjUrSDArS3ptNkxh?=
 =?utf-8?B?WlNRbWJma0l5QjJMYzR1ZzdoS1ZqaDByQXYxaTRLTVVWK2NIZG5INlB6bExu?=
 =?utf-8?B?eUJwWVRqTVltbUVzZlgydUpqNHRKRFcwVlpWNVczS2ttWmg5OVA5Nnl5UFJa?=
 =?utf-8?B?RlVIcXprL0FPMkM2SERoS1NZNWlSRm5CUkl0THBmeGxqK3JlMEwyQVg2TXJx?=
 =?utf-8?B?alI0MW8wZFhnSTF3R1BmSHdxQlpYS3FKRTlvd2J0Uk9UbnVQQlN5Z2VJRi85?=
 =?utf-8?Q?BQjs=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5c4ba71-21ad-4612-ae58-08dda33590e4
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 07:01:01.7721
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I6vCHtts7I4JFU1vWo9PUKpKWp1ZfyVuvqlh0egawLE6LYNnudaKCooJioblzUL0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5899



On 03/06/2025 23:15, Stewart Hildebrand wrote:
> On 5/14/25 03:31, Orzel, Michal wrote:
>> On 13/05/2025 21:54, Stewart Hildebrand wrote:
>>> Similarly to fba1b0974dd8, when a device is passed through to a
>>> direct-map dom0less domU, the xen,reg ranges may overlap with the
>>> extended regions. Remove xen,reg from direct-map domU extended regions.
>>>
>>> Introduce rangeset_count_ranges().
>>>
>>> Take the opportunity to update the comment ahead of find_memory_holes().
>>>
>>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>> ---
>>> v2->v3:
>>> * new patch
>>> ---
>>>  xen/arch/arm/domain_build.c | 57 +++++++++++++++++++++++++++++++++----
>>>  xen/common/rangeset.c       | 14 +++++++++
>>>  xen/include/xen/rangeset.h  |  2 ++
>>>  3 files changed, 68 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>>> index b189a7cfae9f..3cdf5839bc98 100644
>>> --- a/xen/arch/arm/domain_build.c
>>> +++ b/xen/arch/arm/domain_build.c
>>> @@ -824,15 +824,17 @@ static int __init handle_pci_range(const struct dt_device_node *dev,
>>>  }
>>>  
>>>  /*
>>> - * Find the holes in the Host DT which can be exposed to Dom0 as extended
>>> - * regions for the special memory mappings. In order to calculate regions
>>> - * we exclude every addressable memory region described by "reg" and "ranges"
>>> - * properties from the maximum possible addressable physical memory range:
>>> + * Find the holes in the Host DT which can be exposed to Dom0 or a direct-map
>>> + * domU as extended regions for the special memory mappings. In order to
>>> + * calculate regions we exclude every addressable memory region described by
>>> + * "reg" and "ranges" properties from the maximum possible addressable physical
>>> + * memory range:
>>>   * - MMIO
>>>   * - Host RAM
>>>   * - PCI aperture
>>>   * - Static shared memory regions, which are described by special property
>>>   *   "xen,shared-mem"
>>> + * - xen,reg mappings
>>>   */
>>>  static int __init find_memory_holes(const struct kernel_info *kinfo,
>>>                                      struct membanks *ext_regions)
>>> @@ -914,6 +916,13 @@ static int __init find_memory_holes(const struct kernel_info *kinfo,
>>>          }
>>>      }
>>>  
>>> +    if ( kinfo->xen_reg_assigned )
>>> +    {
>>> +        res = rangeset_subtract(mem_holes, kinfo->xen_reg_assigned);
>>> +        if ( res )
>>> +            goto out;
>>> +    }
>>> +
>>>      start = 0;
>>>      end = (1ULL << p2m_ipa_bits) - 1;
>>>      res = rangeset_report_ranges(mem_holes, PFN_DOWN(start), PFN_DOWN(end),
>>> @@ -994,11 +1003,30 @@ static int __init find_domU_holes(const struct kernel_info *kinfo,
>>>      return res;
>>>  }
>>>  
>>> +static int __init rangeset_to_membank(unsigned long s_gfn, unsigned long e_gfn,
>>> +                                      void *data)
>>> +{
>>> +    struct membanks *membank = data;
>>> +    paddr_t s = pfn_to_paddr(s_gfn);
>>> +    paddr_t e = pfn_to_paddr(e_gfn + 1) - 1;
>>> +
>>> +    if ( membank->nr_banks >= membank->max_banks )
>>> +        return 0;
>>> +
>>> +    membank->bank[membank->nr_banks].start = s;
>>> +    membank->bank[membank->nr_banks].size = e - s + 1;
>>> +    membank->nr_banks++;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>>  static int __init find_host_extended_regions(const struct kernel_info *kinfo,
>>>                                               struct membanks *ext_regions)
>>>  {
>>>      int res;
>>>      struct membanks *gnttab = membanks_xzalloc(1, MEMORY);
>>> +    struct membanks *xen_reg = membanks_xzalloc(
>>> +        max(1, rangeset_count_ranges(kinfo->xen_reg_assigned)), MEMORY);
>> You allocate at least 1 membank even though xen_reg_assigned may be empty because:
>>  - this function is called for hwdom - no xen,reg
>>  - there may be no xen,reg i.e. no passthrough
> 
> Ah, sorry, there's no need to allocate at least 1. This can just be:
> 
>     struct membanks *xen_reg = membanks_xzalloc(
>         rangeset_count_ranges(kinfo->arch.xen_reg_assigned), MEMORY);
No, it cannot. membanks_xzalloc() calls xzalloc_flex_struct(). If you pass 0
as size, the latter will calculate offset to FAM[0]. In other words, the
allocation will succeed but only for members up to FAM[0] (i.e. only for struct
membanks_hdr).

Also, even if you conditionally allocate for xen_reg_assigned or set NULL, in
latter case you will end up with mem_banks containing NULL member. AFAICT that's
not something expected by the users of mem_banks (+ it gives unneeded iteration).

~Michal


