Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD77985AC4
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 14:14:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803924.1214778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stQtu-0004ym-2x; Wed, 25 Sep 2024 12:13:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803924.1214778; Wed, 25 Sep 2024 12:13:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stQtt-0004wG-W7; Wed, 25 Sep 2024 12:13:45 +0000
Received: by outflank-mailman (input) for mailman id 803924;
 Wed, 25 Sep 2024 12:13:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w3eZ=QX=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1stQts-0004wA-Uj
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 12:13:45 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20606.outbound.protection.outlook.com
 [2a01:111:f403:2009::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a7a07e2-7b37-11ef-99a2-01e77a169b0f;
 Wed, 25 Sep 2024 14:13:42 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by IA0PR12MB7650.namprd12.prod.outlook.com (2603:10b6:208:436::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.29; Wed, 25 Sep
 2024 12:13:39 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%4]) with mapi id 15.20.7982.022; Wed, 25 Sep 2024
 12:13:39 +0000
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
X-Inumbo-ID: 9a7a07e2-7b37-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ioGR+nEh778Ik2d3nAjcLXiW0pqFSVkPQSlFIaTpfcaqYmkhmvj4O7p4x50UDdOrT2ybIzmRvLJORrs7403BAbMU9Np2qzxPtzHcvNSqep3O+g4Mj61pdWKmQSABzTcZRytWtzxBk40zX9RoXFQ2+bkkuxW5gdbvFziP0RCrbAzV5EakbEIk2yFvXiZkzjd5ofyuPBaGzkkBJmPm265nFMEJmterK7HUFMMuJ91kTFbfB6OLDu/gaMTCUVUG+4WgnG2OQpEDu6SMJqYVKj4NbKiuMf34AwFOIctn/McUVQSp7qKmQYFBbedPYSDlrjLZD7QFH+3K3MixQfqFosq+5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ycnMIRbZ3sau2n4Qymra2J/Mxofixt+NHYMz9/bef8=;
 b=oF6sj3KRC++t849lmSA7DPfRdVzT4K19s1F7/Sze7A0R4GWwG1SknnYE4pxYBwBlPlJIpevGBbXUv9z33X7L+Z/fJvCCHyRo21YgoSIL0wUeSuwPXMmnLrhJg/ecyxe3dUEAIXGbWnbLajPGitES0rOPkyyszgU96qzYxBdJWSEBXQHhNd+5wEsIOR6eVHtYwI8ngEnlVNEFlBdHYKuUsShNVSmPA6EscZkxz5CG/qRvMrjEwSgaZfphzcyhjvy5NSitCR5y2kNN04d1tD8FPyoSyh+0SNFjMKv89etKgnreGqM4OMBQUW/o0sC4i6+kwRhQrgOY5xHBWnwSjjxdRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ycnMIRbZ3sau2n4Qymra2J/Mxofixt+NHYMz9/bef8=;
 b=Gt5wixKYxnPEv4oQyIp+sqqium8JJfmWyiDYuhe2hVogy55lkZzdDu0UcYFxUBPbcYIWgMMnlRsEuDu2GyGC7KPnsxJT37e6xBQ9xkArpGM1Oluw2bUqmwPvREn7sYowvkGsYMlcVBEYphHRC+F+cwABFk85vLgq/S+BVsOs1JU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <38511a52-f641-4c4e-b011-3ce7a565ffcb@amd.com>
Date: Wed, 25 Sep 2024 13:13:33 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] xen/arm: mpu: Define Xen start address for MPU
 systems
Content-Language: en-GB
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Jiamei . Xie" <jiamei.xie@arm.com>
References: <20240918175102.223076-1-ayan.kumar.halder@amd.com>
 <20240918175102.223076-3-ayan.kumar.halder@amd.com>
 <e1930816-14ff-489e-99c1-8e832655d4af@xen.org>
 <ed17bac3-6505-4824-bffb-6436e0a9e3cc@amd.com>
 <547f669a-9b13-47a1-aaed-07a46b096d42@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <547f669a-9b13-47a1-aaed-07a46b096d42@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0406.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::34) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|IA0PR12MB7650:EE_
X-MS-Office365-Filtering-Correlation-Id: c6c6dc97-b0ed-4036-7f87-08dcdd5b7ce4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RktCQk1pZ3pEOTRKOEpwdlhrdytTVjhJcHBMOHBLT3NsWU9VUlNTdTlNcVp4?=
 =?utf-8?B?anRmMlhVakJYM3FiSzNWcUZrSnBBdXB0bVZzajB6TkRPYTVsQVdPSThqemlG?=
 =?utf-8?B?NG9aMVpMS1BLamt2MGhIdjlrMnRsQmhla3B1QzIzRlgvK2pyckUyS2x6TzA3?=
 =?utf-8?B?OEMrMFl3MEFrMjdPUlQ0bW0xTGwwZFFCUXU1K1IrZm9WNExHV25DNEtVTXZU?=
 =?utf-8?B?U2ZBQlE1Z3lmazArSVliV1ZOdzF1d2JNL1BYV21tWHkwRVVkZnNOTURKOG1s?=
 =?utf-8?B?K0o4elNaak5yV3Vjb2hvbmEwNzZXM21kU0NUQ0tmdFV0TVdRMmEwSFNRbUs4?=
 =?utf-8?B?eUMvR295M080K3FxMnVVclZJaG5zWmo4Uy9pa0RyZkFUOUZieWdNRnNQalJS?=
 =?utf-8?B?aVVtR2lPZG5UTVpXNUxQdnNuMlNYL1pSSGM2V3VUUzFCYy84U0FNemFoLzNv?=
 =?utf-8?B?UTc0K3JqUFhIMVlYd2U5Ym9ZbmRwYVdXWUFqdjd0em90d1NxZ0c2WjVmenFM?=
 =?utf-8?B?dlhVVlMzSGhBNTVVa0RzajBuZ1R5K2s3ZFBYWW1tYzB0RWduV1Y0K2d4UUMy?=
 =?utf-8?B?K1gxSVhDNE5ha3REb0VBSHIrR0JQUjRIdWlpbHRqaGJGZXBMSmFNNHFVS1E3?=
 =?utf-8?B?UjdvMWN0c1VWeTVrMmpTYjNKQXRxTWN3REpFcGtXNHlwOFdkM2psdTIvU1ZW?=
 =?utf-8?B?Rml5eXpHL204UmJ0WlViQlVTak1RNU5ra29pVlA1eHQ5aFBJcmtXcEdiK3Ax?=
 =?utf-8?B?SGtVNG0wZU1ndFVIL0pZSXJWWkhFWkdBNTh3dHBacEJla1R3QnlRS2VYQlla?=
 =?utf-8?B?Z24rTUlqc0ZLMDYvZWc2ZDlBdXVRR09vbjB4cnUydDBIc2cvUW1oMkpMSEtS?=
 =?utf-8?B?RW1Ldkx6U2ZkQm5Dc1Ayb0tOTllUb3dER0cveGV0Y1YrbFBoc3R4bnJQcmk5?=
 =?utf-8?B?dFdoV214N0xQR3FHVnR2TWNlcU5RMm5VelNsbWR3MjhFWjZjVEpON0tOcnov?=
 =?utf-8?B?MVdOTW9zWmtDc2liZXM0SmhheWRRalRoRWRBQU9wbE1zQW93NVNUdVc0aWps?=
 =?utf-8?B?U0k1SXFBOXF2bVBoOVJEcFFnOVd3OC9iUmZwWEVHZ1BZR0x1VUFWSVY4aGw5?=
 =?utf-8?B?bUp4VXpaaGRnZ0ZhZzMyS1pEazBoNzRucEU1cFVIZUErcnpRZUlTRlh6SFVz?=
 =?utf-8?B?VUZDb3lDQ29JWkR3VmxSeEEvOVlCVHRIbUhlaXNwei9nWk5ZbTRWSnRuSFUr?=
 =?utf-8?B?TnhmaTQwTGNHUmRTMWd4UlgrM3JTWG5PMTZ3NnRSK3dBL2xyb3lGRVlSRkpq?=
 =?utf-8?B?VC9YYnJabXIxQ0hjdVdGMXpwT0JIbXJDTGpuTTZZVkNEbmdWUEpOVkljZWpH?=
 =?utf-8?B?bS9tYW1WMzlJRzB2TkRDWlVtOWdHTGxraVhicTkrc3dRY0o1dmRXaHVHUWdy?=
 =?utf-8?B?MUpBQzdaNTdqRGFaQWhaMUk3YUxWR21MbFNnSjQ5eStDQmdjMWVjLzJNYzdH?=
 =?utf-8?B?ZFE1cWVURXU5UCtHUEVDb2dBaHUwUDhxb0RYMVR5SHV2elFwZUw4NlFOK253?=
 =?utf-8?B?Z2ZubTlPa3FUVkhadjFJSlA5WmliVU1GQS9ZdTR4U0NxN2FwVFJXWVAvRG5p?=
 =?utf-8?B?S2IzZG1jWFJ4V0E2TURxR3Y4NUpXcUoxaHNCYUE2TmRTM3RGcXpOR0lLOEVj?=
 =?utf-8?B?SmhsYXFuQjc3RnM1ek4vWW01cnhDZ2gwZlRHMk1DMXlDZjZGN3FJMWE0OW1Q?=
 =?utf-8?B?MExobVhUSEgrOFNSZkJVQXVHM3VMR1JlYzNsd1QwcnBZVFkwV0VHbmpxREpK?=
 =?utf-8?B?Zzc5MW44VnU2ZWhRejlMZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0VVRGFheU8rc2RpcklaK1Nmclp5NTNlcHkwUVJ6cncxVnZWVmxiTDBGejJM?=
 =?utf-8?B?QUpLV3YwWFNVM2VJb3hpOXNBTk9CSUFrSFRlZkxqY0Qza2hhVXo2TDJhdTY5?=
 =?utf-8?B?YjhYNW42WGliUjFDT0FxZGpNMG1HRWlHWkJsZnNBZHg0OUhIbWlJNEE4WnR2?=
 =?utf-8?B?bTZ1TE8rOHpXSXdGaFNkd2R3emNJT05aMXNncFcyLzd6VUdidlY2V1pyckZC?=
 =?utf-8?B?NndMTE9OZDN2cTd0OUFIbEcvdkt1UGtWSDc5Qy9ic2t3Z0tnZ1pydURIbGtt?=
 =?utf-8?B?MFJYQnMwTkgzQnhFMTJHdGdlUVpLM0hBNG9yVFAzREQzdHdQTlU0Qitkcklq?=
 =?utf-8?B?N2FYMW9BaHV2aGpCUWp4aDZmMTRZQU4yVk9PeEV2T1JRamFSR2Ftc05qNnlE?=
 =?utf-8?B?Y0YxSzF3SUZOOHZvOEZaTTM0a2hLcXEwS0Jrb2NFM0JMbmR3am1rYUJKbGVk?=
 =?utf-8?B?TjMyUkM2cXoxZC9UdDhJNDhwTDZ0czVkckNBUzdrMmJPV1YvZnVwSDlRMUFN?=
 =?utf-8?B?SU80NDk5cEF4b3g1N2U4SG5INE14Ti9wbzQyM1Jhak81eEtCV3BFVFJoT2xU?=
 =?utf-8?B?M2lvc1h4WlZWNXYrWWxDVGZ6RHhuc2RwdGUwMDlVNG9kOXB0YnR6RjNOMzFn?=
 =?utf-8?B?RXJOTSs4VlhFa01iKzNxTDlEL2sza0tPK2oxWG1ncGdrc2ZXR3kxQ3B1S1ha?=
 =?utf-8?B?ZFdHMmV6TWhCMjB2OXczS0FMNkpFUDVFRWZDeXJhSU14TW1YWHZrK0o2YnRC?=
 =?utf-8?B?c3V2Z21yK3h4Y2RyTG9ZeDRtR2Z1eUsvdE9CeHRjdDd6R0phNkdPUTliMDF0?=
 =?utf-8?B?NGxzZ2xVR2VOZHBnVlB2VXI5ZWtQeEltREwraXVOd2V6dm5Lc01SWWk4QXVm?=
 =?utf-8?B?Y09GZzBHMmtHNHBIVFZGU2FjclZwYytBcnZXWTFlVEU3cEdBMElpeXFHRjZZ?=
 =?utf-8?B?Q2ZydG1lVkE1Z3RvcEl0emtaWUYvV0h4ZGpaaWw1cHFJZWorbHRIbkhsNDhE?=
 =?utf-8?B?c0FoSVIrTWVyQkgwWjhYTjdEZjJtZWs5eU0vWlcyVzk4cFVZUWJ0UU1tWVNw?=
 =?utf-8?B?MDdaRk81R2IyUmQyVjF3UHBCVDdJOWswMW9oY3Y0R1FoaXpRWElsNWtZSDd1?=
 =?utf-8?B?YTFlWjgwYTNOWHRXSlRUaTNXQkJURFlUemZwdjJSenNNczlnZUJUbUczYzJn?=
 =?utf-8?B?SGpKbkRSRHJxWFBjeU5TOVpJNmVCVUIxMStwS1hsVzZuaFJUZXU4QzRrL2xn?=
 =?utf-8?B?dVBINEhjU2xYRlA2TlhQcG1iMDEvaWtHaUkyVXpvb0ZQa1ZtWTVJb0Z6dnZ2?=
 =?utf-8?B?QnprdUNaY2ZFYlp5MW9la3JESXVkRWEyQk8xbDh1KzVSVldlNG5EM2IzKzBV?=
 =?utf-8?B?OXR0dHJIbDNNL1JhbDNmWjArd0trZlAxa2JXRW9uNExFWHVQWHYyS1NMNjVI?=
 =?utf-8?B?ZURGcktRbnlqVUxvYksvd3ExOEJha2VRcFpwS1RQMjVZbDB0bjF4SlFvaHA3?=
 =?utf-8?B?WlNWMGRFQ0hJY3E1Q0VRVk51NEtCUkNyeUI4Z1ZzbVZvZGF6WjVEU3l1Z05K?=
 =?utf-8?B?TlZKSGk4RzRVbmNleGJ6UW0xbXU2czd1OURtdmxWeGF5SWhxYmNPd0RXSzJ0?=
 =?utf-8?B?U0R3cFFiclI1MGwrVkoreWxzd1FheUJDUVVVOGtTSUo5WGovZStWS2ZobWUw?=
 =?utf-8?B?VHJRdmJIZUlRWGVQUlF2Y3hoSkd0NXFYTkdYa3RKR3B1NlV5TU42VWlDUmFk?=
 =?utf-8?B?eEEvVzlaeWtOdmZQbE50bklWL2JFV2p4cTlQcVZHWVJoTEhyS0tRQ0JvYkcy?=
 =?utf-8?B?ZTYzVjUxNWhwYVJNWDFXclFyMHdWSFU5dDJiOWR4T1o5R2xaYXJSNTBrQmF0?=
 =?utf-8?B?cVRRR1JQdkJ4QUVoTk90OHYwSUdVZ01HWk9qN3B3cVNmZGlOQ1ZnYis5VVFZ?=
 =?utf-8?B?SU93aXpjSHBWSXdaUEFJLzl6WSs5V0k4dC96VHM5eis3K0tWMGFkWlpyMDRs?=
 =?utf-8?B?RHdlQW5KN2ttdnAzVjUxTExudzRWQ1pVOTgrUnhqQ0JNeWd3Q2l2VTRGMHBK?=
 =?utf-8?B?NE5uNXFKUGxSMjk2bUwrWkZ3dHBpTVhleHpuYnRPUHZWbnByWXJ2VTJ5dkdD?=
 =?utf-8?Q?EgQWM70am9SaY4kD81gP0GY8U?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6c6dc97-b0ed-4036-7f87-08dcdd5b7ce4
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2024 12:13:38.9235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZbC4Cq++6MR6NF86/W2Oc49uitiHX7KyGwOAejpHimLXTrzo9R/GbF6l2qO7btmT79shLK6YmXnH8QrjZ/YCkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7650

Hi Julien,

On 24/09/2024 17:44, Julien Grall wrote:
>
>
> On 23/09/2024 12:22, Ayan Kumar Halder wrote:
>>
>> On 19/09/2024 13:42, Julien Grall wrote:
>>> Hi Ayan,
>> Hi Julien,
>>>
>>> On 18/09/2024 19:51, Ayan Kumar Halder wrote:
>>>> From: Wei Chen <wei.chen@arm.com>
>>>>
>>>> On Armv8-A, Xen has a fixed virtual start address (link address 
>>>> too) for all
>>>> Armv8-A platforms. In an MMU based system, Xen can map its loaded 
>>>> address to
>>>> this virtual start address. So, on Armv8-A platforms, the Xen start 
>>>> address does
>>>> not need to be configurable. But on Armv8-R platforms, there is no 
>>>> MMU to map
>>>> loaded address to a fixed virtual address and different platforms 
>>>> will have very
>>>> different address space layout. So Xen cannot use a fixed physical 
>>>> address on
>>>> MPU based system and need to have it configurable.
>>>>
>>>> So, we introduce a Kconfig option for users to set the start 
>>>> address. The start
>>>> address needs to be aligned to 4KB. We have a check for this 
>>>> alignment.
>>>
>>> It would suggest to add some explanation why you want the start 
>>> address to be 4KB aligned.
>>
>> Let me know if this makes sense.
>>
>> "MPU allows us to define regions which are 64 bits aligned. This 
>> restriction comes from the bitfields of PRBAR, PRLAR (the lower 6 
>> bits are 0 extended to provide the base and limit address of a 
>> region). This means that the start address of Xen needs to be at 
>> least 64 bits aligned (as it will correspond to the start address of 
>> memory protection region).
>>
>> As for now Xen on MPU tries to use the same memory alignment 
>> restrictions as it has been for MMU. Unlike MMU where the starting 
>> virtual address is 2MB, Xen on MPU needs the start address to be 4 KB 
>> (ie page size) aligned."
>>
>> Thinking about this a bit more (and based on the discussion in "Re: 
>> [PATCH v1 2/4] xen/arm: mpu: Define Xen start address for MPU 
>> systems"), I think we can keep the 4 KB restriction for now and relax 
>> it later. Let me know what you think.
>
> I am fine with that.
>
>>
>>>
>>>>
>>>> In case if the user forgets to set the start address, then 
>>>> 0xffffffff is used
>>>> as default. This is to trigger the error (on alignment check) and 
>>>> thereby prompt
>>>> user to set the start address.
>>>>
>>>> Also updated config.h so that it includes mpu/layout.h when 
>>>> CONFIG_MPU is
>>>> defined.
>>>>
>>>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>>>> Signed-off-by: Jiamei.Xie <jiamei.xie@arm.com>
>>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>>> ---
>>>> Changes from :-
>>>>
>>>> v1 - 1. Fixed some of the coding style issues.
>>>> 2. Reworded the help message.
>>>> 3. Updated the commit message.
>>>>
>>>>   xen/arch/arm/Kconfig                  | 10 ++++++++++
>>>>   xen/arch/arm/include/asm/config.h     |  4 +++-
>>>>   xen/arch/arm/include/asm/mpu/layout.h | 27 
>>>> +++++++++++++++++++++++++++
>>>
>>> Looking at this patch again, I don't see any modification in 
>>> xen.lds.S. Is it intended?
>>
>> If we agree with the justification provided before, then this should 
>> be the modification.
>>
>> --- a/xen/arch/arm/xen.lds.S
>> +++ b/xen/arch/arm/xen.lds.S
>> @@ -232,6 +232,12 @@ SECTIONS
>>    */
>>   ASSERT(_start == XEN_VIRT_START, "_start != XEN_VIRT_START")
>>
>> +/*
>> + * On MPU based platforms, the starting address is to be provided by 
>> user.
>> + * One need to check that it is 4KB aligned.
>> + */
>> +ASSERT(IS_ALIGNED(_start,       4096), "starting address is 
>> misaligned")
>> +
>
> Ah I wasn't asking to add an ASSERT (although it would be good so long 
> it is protected by CONFIG_MPU). Instead I was expecting XEN_VIRT_START 
> to be replaced. But looking at the code again, I see you define
> XEN_VIRT_START for the MPU.
>
> I think this is a little bit odd to use XEN_VIRT_* defined for the MPU 
> but it would be ok. Is the expectation that all the MPU code should be 
> using XEN_START_ADDRESS? If so, maybe it would be worth add a comment 
> on top of XEN_VIRT_ADDRESS.

I have defined XEN_VIRT_START as XEN_START_ADDRESS , so that the code 
continues to use XEN_VIRT_START (as it does for the MMU) and we avoid 
introducing #if-defs.

Does this comment make sense ?

/*
  * For MPU, XEN's virtual start address is same as the physical address.
  * The reason being MPU treats VA == PA. IOW, it cannot map the physical
  * address to a different fixed virtual address. So, the virtual start
  * address is determined by the physical address at which Xen is loaded.
  */
#define XEN_VIRT_START         _AT(paddr_t, XEN_START_ADDRESS)

- Ayan

>
> Cheers,
>

