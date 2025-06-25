Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B118AE8B7D
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 19:26:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1025408.1401019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUTtU-0008Iv-Ey; Wed, 25 Jun 2025 17:26:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1025408.1401019; Wed, 25 Jun 2025 17:26:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUTtU-0008Fo-Bj; Wed, 25 Jun 2025 17:26:44 +0000
Received: by outflank-mailman (input) for mailman id 1025408;
 Wed, 25 Jun 2025 17:26:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+GTF=ZI=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1uUTtS-0008Fi-Vy
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 17:26:42 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20601.outbound.protection.outlook.com
 [2a01:111:f403:2407::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e56d153-51e9-11f0-b894-0df219b8e170;
 Wed, 25 Jun 2025 19:26:40 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by MW4PR12MB6707.namprd12.prod.outlook.com (2603:10b6:303:1ee::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Wed, 25 Jun
 2025 17:26:36 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%4]) with mapi id 15.20.8857.022; Wed, 25 Jun 2025
 17:26:36 +0000
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
X-Inumbo-ID: 8e56d153-51e9-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KQrvy4ODv6g7TWGIlOFOTd3GW/dt9ZRLtpno57uw5I7KLE86bN4rrVEoCg1b1P0QSBycqg9BMFuL9pzW2j63WJ6PhZFR6Tvm8WsmQmE4gWm+iAClvtHUWTnFiJt5N3cnAfGsvGc+EIAH5yoOO+XoV466ir//UOQBUeby3v+yRqrzyWGeJ4Dv76i4r8oj6iJHEalClK6tIskHF4fXR8kICQob5Dt5cEuJdKhSngBpZcKrxUbNbbwpC5wTYMirG6MJ9kvU6z2/jeoKJ6SzacuxmqPsGpkjvZLpSD9eIw95Eac99j0UCBe1k9193PVccVGJQuyEJnf1XJuvxZcnwUdMhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L08ObTZ2rdiNkLCpPBNhf5bX/1KhDny2ZiY1FyFu6Fc=;
 b=k+0alFl7vZmhhRx34zv+SaG8dttn1yyIjM7GlPKZ9ZfC3EFW/ZpD9ZQaM1NtbAc882+2oX5gB8R3Zbt7RsWLLSzRJal/0MgwN0iUQObq188KjqqUAetcBoh64PbBv77zZFhYWXZ/lyXNNyQP2xtoNvK/dNvfMpHA3Qa5Ef8GosnYd9z6j6v2uITRrq4nMs26IovO2/C+I/Q2hb6HCBUKSb1tsvprqASzqyTCHjvROZo+4J4A8HoKzVAErAKBbQ0BTXO0BJcJ5Yz6ckadYIdOHgqqP4FZ6qAcOYquD79cuyZucEDHL2LqtqzZPcRNeCwWdQIgojKTHkqT079TBa9FAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L08ObTZ2rdiNkLCpPBNhf5bX/1KhDny2ZiY1FyFu6Fc=;
 b=KIToS3MK9PSTjSiMamWTd2xyyXCaltXnoGD2fe6jnw1n8jtvK1Za79w7PzjjzH2v+VmT3GYbXOO1NNFC/TsdjmUGMnIRlN0kjC0+OLvoY97GIB+ovmgK0nG0RPZVCdXWvRCrAOWSvGkGPKcLBfjbu/Em+S7EW+w+VHGnB0hUhX8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <33aaf6ce-011d-477c-aecf-071610392950@amd.com>
Date: Wed, 25 Jun 2025 18:26:32 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm/mpu: Implement remove_early_mappings for MPU
 systems
Content-Language: en-GB
To: Hari Limaye <hari.limaye@arm.com>, xen-devel@lists.xenproject.org
Cc: luca.fancellu@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1750411205.git.hari.limaye@arm.com>
 <9a8b831cc6ff25b03c7ffab6a5c79e653496aa4f.1750411205.git.hari.limaye@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <9a8b831cc6ff25b03c7ffab6a5c79e653496aa4f.1750411205.git.hari.limaye@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU6P191CA0004.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:540::21) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|MW4PR12MB6707:EE_
X-MS-Office365-Filtering-Correlation-Id: f41e7f1f-04d8-4f1c-e7e4-08ddb40d6fec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bW9ucUovWW42MWtxWEZ4RlliaVpSclp1YUxwbzEwdW5VeEtTMWFiZkpwNXds?=
 =?utf-8?B?UUhFSWx2YjA1REljZk9jL1FnNE1kSSsxSG92QkRod0VCM1NwbzBlMzRQZjly?=
 =?utf-8?B?Kzdhb0hFOE01NkJDa2tMdkRDdjYrSFZ3V002SkdLVTlqZmpYSllCRXlNVGZY?=
 =?utf-8?B?YktSWjZiTDVlem1xeEpyUEtxc3YyVGRGMy9paXYvZHlGeWFyN1pZTkxqbktE?=
 =?utf-8?B?YVhBRGsvMk1kalFtZ1lqWUNOVnVxbFpuMm5aeG83T2ExZjFyd0lyc0IwR3Qx?=
 =?utf-8?B?WFYyZkc2b0VHYXdtbURCRUkzN1hYYnlLUDR3V093RkRaZHFDbmtYNU9KcWlQ?=
 =?utf-8?B?WlJqNVZnTzBXS25DUkNNRkJxRm1KZmRSYnRGTnJxNzVKSmF4SVZTU3ZmQThz?=
 =?utf-8?B?SVZQWDVyWmVheHpkRFpzYUJGRGVEWm5BQ2ZVMGU4S1NZcEJXV3ZsKzVXb3dk?=
 =?utf-8?B?UWE4aWpaSUVLeHpUTk5SVU1xaCswY3ZaZG9FUE5YUXphZmM0VzZLT3ZVMGxK?=
 =?utf-8?B?WHNBLzNTdjlGaWdaYUJvQm1wUlQ2QXlETytKWVJhdXpCUUY2TFhFOW96Zmlv?=
 =?utf-8?B?TURxcmoxVmVWRGNyVlRmM2pabmhBVmFhUFpoVitnSEUxdE9BVmh6bUFQVDJH?=
 =?utf-8?B?YSt2T3RPMTRHN3dPUXdXTjdDY09yQ0Z4NUZVWXNnK1BwYkFBWWdKZXphK0g3?=
 =?utf-8?B?UDdNRXNlQVNaUXdpN2JGMHZBQzhFVG1jWkduZUdMMkJ4eGR4M3UwOGF0Q2p4?=
 =?utf-8?B?UW9ycHZKMkNOQmxnMVFzQmRHUEJ1YWlHMjVyZ2JoWngxbkZiUWhpVnNmYkxU?=
 =?utf-8?B?NHVqL29MVEsyY3h4enBFVGJsUkhTZjRCcWVEQlF3d3lVb1JlLzF3YUlKaWJu?=
 =?utf-8?B?MnJnbXJzeDJuOEpNeVA1L3dmaTYzaXlOYnprSGZtSStac0dubXlDVlNoU013?=
 =?utf-8?B?OE9aREhUMEZTRmdZTmt2OWd3TDBwMUxFMFFCa1o2UG02R2o4TW50RXlPSnZK?=
 =?utf-8?B?T3NTaU0zMXE4SkxZT3c5YzRIRDl0dUhPMUZ4N2FUQ3hKbnhUcCswVEsxR1hS?=
 =?utf-8?B?MlJxNGp6NkdlRnowcklOZEdHbGZ1d1lGRE5rMjFBOGkwVlJqVThhSnVOVXh0?=
 =?utf-8?B?Y3A1NkhxNWZhdG1aZmFhMXYzcnNpNVQ4bm94R0wvSmJDTzhVS3NTQ00yK1FX?=
 =?utf-8?B?Zk1Pb2FhY0VhY2JaenAwaGZVMUQ0NWJDN0lnQlhleHRPY05TYjlOakNkZXFt?=
 =?utf-8?B?clZiUkJJdXpMdk5mWHJJamdrWGxxWjNSZHdLU0oyM0s2UDhQaGlYSDNuQnFW?=
 =?utf-8?B?UmNaL25qdi9oemVHMUtSVEdhMk41UnFudVBRYnVBeUYybHhkSko3VnlGQWxn?=
 =?utf-8?B?MDMvb2toMER1RWd3L2c3U1YrWlZseVUwUndyWFRGYnUvL1V2S2oxV3VJT1ZL?=
 =?utf-8?B?cmVyeUhUZ3VrL1c0dGRLZjdiYis2KzNjZnUweGNma2UwQ3JwWWlrYVgrUjdh?=
 =?utf-8?B?cmtnNEtUd2g1ZnBwV001TUFNekREcEh6dGxuSTRTeGVQODNhNU4xbmQ2SmV4?=
 =?utf-8?B?dmgyT0hISE0zVmNvVWdUSE5yZTBKSHg2NXdtYUJpVWhzRHBROS9icU1oT01T?=
 =?utf-8?B?SStmaVZLOCtqM1VKTTlZaTJiQ0g4U3QxVjFQTVB3cHBNc2ZubmdIMm1saW5S?=
 =?utf-8?B?a0lBZVE4a0x1YVh3MU5KU2FLYTZDU2Jnd3B5VGZoblJkVWtHejZmMnVoVnR4?=
 =?utf-8?B?WjlYcldzUitvc3FGcDVqZzQwdGhjOHpXZkdjTHZnczNLeFg0clFYWmFCNGxi?=
 =?utf-8?B?MGMxN3JidVh6UDJuTUdsRW9zNitycW1ZSEppWi93aWRxa09MdHFxekVLNFJp?=
 =?utf-8?B?VlFTNzlVV093UTdDNWpZMWlkTmFUY3N0ZVhVWWxpLzJRV1l6enVFVUxySUdS?=
 =?utf-8?Q?DjSilvzRKNo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OFpsMVc3Wjd0Uy9DeVFCQ2xLY2RYRTdtamhHTmNvbTFrWXZtblgxSitHa2ZQ?=
 =?utf-8?B?T0xrM0VYUlBSMWE4eFEybkhQNENPUUtNTk83OU9KWXcvamdVK3h5Nzc0L2pu?=
 =?utf-8?B?NTdWdHlpZlF3aXpET0JaZTRyZlluY3U5SDZXd3ZWT0ZLL3REcFJyYlA4TGRy?=
 =?utf-8?B?cSsxa1FTRDVvOUJtOGtyQWlqeVpYaDE3VlJ1RjkyOTFuZ05lcTVIcHVUOXZp?=
 =?utf-8?B?NERxeHIramNCTmNEYUtLNjNOVjZUcnB2bnpzWUlzWUZaaTRsYnVNdlRKTnNS?=
 =?utf-8?B?N2FCVE1pWG5MWXVCYjNUMlpIYVNVZ2RENkVHRm9jMFN4UFR3OUd5QjdmTWda?=
 =?utf-8?B?amN3TXpwMnRhN0FsS2p3SHJYcklnYSt0UUhRTXZGVUhTNHNNQjRDWEFwL1A5?=
 =?utf-8?B?cDZHV05kdlA1eWNET2huSkZXdDBQVXdWWGU0ZjgrZ0s1U3dhQjFtWVNuSis1?=
 =?utf-8?B?QXU1NHBXOUZSaXVUTXZYV3RvRFB1ZHN6c1V4d2JBQzZDcldKNm9MNHB1TXlE?=
 =?utf-8?B?dVk4dzRHUnExVWtIUGlGcDRpd3h3L1pDYUxSbVF3aDQwYXV1amtCcWtDTlY4?=
 =?utf-8?B?WkFTVmg4ZTRsdDF3bnBIZDlNNmNaWHZBWDZPRis4UDlDZUVRTUszRkh2MUl5?=
 =?utf-8?B?VnZ4aUgyejErQ2VpNUFFbGFMclUrUmQyOTRxNHlFRjhUbVBDbVN6MTZheXJn?=
 =?utf-8?B?bUpXZElZM2JrSXUzdURtOGJpQ1FHWjlXSjhvQjE3TlFOeUhpeTY2MFBPNTR0?=
 =?utf-8?B?Rm9pUy9Yd1lPOTVxNzNnYlpYYmxzZUpidU53MllOYjR5ZXZBcHNQdlNlOUl0?=
 =?utf-8?B?enlYQkVhMkFOS1lSdHpjcVdidS9MWm5lTmlEY3FnNjZwMXFmOTIzUEZOS1Mz?=
 =?utf-8?B?V1J2UG45TGN4WXVwNU1ubDYxeDlRWlllbWE3ZmF5MmpTMERITlJHcFV3Zmow?=
 =?utf-8?B?czF6bWhwcWZ0WVorV0dPWmlsOFFQM1kvNkg1OGZ5bm9kaVZXNG9SOXZkTUtk?=
 =?utf-8?B?dXY1OXhYejFpNzdsTUtCS0l1NzJYZFBzd01tak5mek91VEdFTDFtblVMS2pG?=
 =?utf-8?B?dDRIN1kyU1ZzM3ZGS3JUUm9zVWRYSkl6UnRyekM0Z3llNzN4NjlVODZGK2M1?=
 =?utf-8?B?VVN1U21sa2h0eDdmZi8rYXZVeDBjVTBFbCtIV3RKd0hVR2Jxa1o1NE96V2dE?=
 =?utf-8?B?WU5kRTVyT1JaWkpYNXJTelViTWw5RFYyOGRiZi9hL0hIK1ZSaEEyaVdzL010?=
 =?utf-8?B?OUw1ZVhzdGxINzJieCt2ZnVXK3kxM0NxYm0ya2V0ZmRmQ0VUQ3hETkltTThq?=
 =?utf-8?B?a1UyaFhoVk9jdEhSUFZXcUtiSGNVNmpQU2NRT2pFdk1aZzI3Q0xNL1k5OW9a?=
 =?utf-8?B?bjRNRngrN29aVDVoNnlCQW45Y3FxcGFFVnVQVHQzanNkVWxUaGQ2VEE5Nm9E?=
 =?utf-8?B?SG02LzRJSWlNNWhMYzJMQnVYVk1xTlBlM2R0OWhoTTIyeENxdUdQanh3MW5Z?=
 =?utf-8?B?ZlArMEhuTEVFTWZteWkvVWcyUXZLdzk2T25Nc2xsWWU3VWlMYllVd1I4ZHNK?=
 =?utf-8?B?VE9HaXZ6ZCtIYXRxNlRXOTk1aEpHbXAvb0NGQTRsM3dmRTJWdUhaTGZEKyt0?=
 =?utf-8?B?ZEQ4Z1JSd0FTbVpJVitFOElXMzU5VVcyOW5yTFNJM3NSSEVVM01rOTB6cWp6?=
 =?utf-8?B?SFVTN29uUi84d2g3TmRtczA5WnVFcURyMXo2UEw0cWtGU1IzU1hTcEtmai9S?=
 =?utf-8?B?SnpmSXhYSG11c0FrMktwaHp6bHBQYTQ5VGp1WEw4b045Ukg5SVI0UDE3NHdJ?=
 =?utf-8?B?NjRaL2FzOWJyNDlNbUFhN1R5OHNSL084ME5ZOGpuMjhxSVVaTmhaRXpCcnVS?=
 =?utf-8?B?bnVlSUZDRGVVb1R0NnIweDUzUlRJdTlIZzNscTYzM1BFd24xRkxBRTB3allK?=
 =?utf-8?B?dGxVV083MzZRa1ZYbVYwS1BIVmNFR1dRc3M5M2ZHTnlLTVNVbG1PenVNQWpX?=
 =?utf-8?B?bFc1TUZEVGN0c3VjNVBxVFV4dkZndk5aWWRoaGJkbWU4MlB3OGZyVWhkdWlP?=
 =?utf-8?B?ejVCYmVMR0llTWI0ZFY4Y0wvajlMZUJsbmMyYXllY2hncnlpcFFZeXVPUFIx?=
 =?utf-8?Q?p1bYSBoGxWFhvoED0JpYhUYm7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f41e7f1f-04d8-4f1c-e7e4-08ddb40d6fec
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 17:26:36.4543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cSxJ9xsk2ZzoJSPmbAw52nHzLuTDcTb+dJuE4F91MfF/jNxQ8cPrH4xI/1J/DxT3ayJH3YBYS+3Z/QI7WH5EmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6707

Hi,

On 20/06/2025 10:49, Hari Limaye wrote:
> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
>
>
> From: Luca Fancellu <luca.fancellu@arm.com>
>
> Implement remove_early_mappings for MPU systems.
>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Hari Limaye <hari.limaye@arm.com>

Reviewed-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

I have tested the series on R52 and R82 and it works fine.

- Ayan

> ---
>   xen/arch/arm/mpu/setup.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/xen/arch/arm/mpu/setup.c b/xen/arch/arm/mpu/setup.c
> index ab00cb944b..5928b534d5 100644
> --- a/xen/arch/arm/mpu/setup.c
> +++ b/xen/arch/arm/mpu/setup.c
> @@ -97,7 +97,14 @@ void __init copy_from_paddr(void *dst, paddr_t paddr, unsigned long len)
>
>   void __init remove_early_mappings(void)
>   {
> -    BUG_ON("unimplemented");
> +    int rc;
> +
> +    if ( mapped_fdt_paddr == INVALID_PADDR )
> +        return;
> +
> +    rc = destroy_xen_mappings(round_pgdown(mapped_fdt_paddr), mapped_fdt_limit);
> +    if ( rc )
> +        panic("Unable to unmap the device-tree.\n");
>   }
>
>   /*
> --
> 2.34.1
>
>

