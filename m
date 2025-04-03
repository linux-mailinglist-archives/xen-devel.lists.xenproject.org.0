Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B6EA79E6A
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 10:45:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.936371.1337636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0GCB-0001M7-Rz; Thu, 03 Apr 2025 08:45:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 936371.1337636; Thu, 03 Apr 2025 08:45:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0GCB-0001Jb-P7; Thu, 03 Apr 2025 08:45:07 +0000
Received: by outflank-mailman (input) for mailman id 936371;
 Thu, 03 Apr 2025 08:45:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t8zK=WV=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1u0GCA-0001Im-JA
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 08:45:06 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20608.outbound.protection.outlook.com
 [2a01:111:f403:2009::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eddae65b-1067-11f0-9ffb-bf95429c2676;
 Thu, 03 Apr 2025 10:45:00 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by PH7PR12MB8425.namprd12.prod.outlook.com (2603:10b6:510:240::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 3 Apr
 2025 08:44:58 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8534.045; Thu, 3 Apr 2025
 08:44:58 +0000
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
X-Inumbo-ID: eddae65b-1067-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aSfu6n6ohIqzbxq6Us7q/Yy+5NjSKAVdc7IX3491tdLVlIsdxyI/HlJeKqUupu2gCN2C9iXCjT8jZctFbEMfq3Bkjgu8OPaubUKRKANFo+Vtbhqkr/UoXX9OkF6oiyvMTvqBvzjXv3sQP2x+BqnZj5l+YKjj7GPIRw0gzXhHTMIxG20eOEW/Ll9rLhfyyCfGKnhN/IGTxg4RCPUYAbKgpwj6sNPzKzu0bpnY1urXPOE/qnHFMNwNkpyZqwA5Oo4D4wIW+MhtZHqPn0VhLx5oTam2zi9gDvd3UM67tEPSPaWw766ZfLFm9kBeZ2XdHHbJQqEVLyFtmkq6pewdtySOHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7vxY4SwuTUpl8FZx4jLTvct1XS1oKnTecVQ4yeoZqgw=;
 b=B89dtGIggtgTy8ndpnHD2+H8xZCOrIfW9QAUq/72jjQiuJsHUlnetz/y3RUJ2IfZOei3DOCTKICtlqUjH4Y85FfWNkMj2V8nKHuLFT4/EYoH4GzpX5nesuMtJIfCG5+/QBJlbNI5ZTX54qd0m6vGrMGtt6okVkxlCoUyLysPJWZ52OrkRRe3hv4tx4crQGgDPZyuELhR/UUI+fKK66KGZYtsuNO3QjCa/owNyzo0YlOnevh6stLfJmAe45RnIV+bfS8C6Uz8qBdJLnZ2jAl7dYhcKC1VvaZrs+3MM9uvsvL0EExTKLDE0Ygp1/e+Cpx8T6JnxvzgPjqtAZlx1KrLsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7vxY4SwuTUpl8FZx4jLTvct1XS1oKnTecVQ4yeoZqgw=;
 b=kxr5QL/HCxOu+1s5SoFI1N6Q5pMkNIv5XB3rHM2I1QksmY8o/7ze+P2k2jp13IIgxbPLXg7VXMXwqbU2Xp+7I4Qn3Y18yKeIp9nuij9QJ9+V51yhbfShERo7CElNDkhw42n4CNiJTuyzAiVQMob1i/KtF/EsmIkawlw2Sz0AV9U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <2a8ab261-480f-4bfe-b2b7-7fdff4516078@amd.com>
Date: Thu, 3 Apr 2025 10:44:55 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] automation: Add Arm64 MPU build job
To: Jan Beulich <jbeulich@suse.com>
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
References: <20250403081916.6834-1-michal.orzel@amd.com>
 <20ac780b-f5ac-4531-997e-362d72adddd2@suse.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20ac780b-f5ac-4531-997e-362d72adddd2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0026.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::13) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|PH7PR12MB8425:EE_
X-MS-Office365-Filtering-Correlation-Id: 92a3db93-f43f-474a-1125-08dd728bd070
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QlJNS0NhRzRVVjZNTld4MGRyYXVvbm5pWTZEUzlWakR5MEswODE1QWxsYjd0?=
 =?utf-8?B?NjRlSTZDQkgvT0xJS3pRcytxdllOTlVzdmZVd2d2TlBQbTlXOW9RMW40NG9H?=
 =?utf-8?B?QnlqeStqdlJWZVBZMXhPWGpmTHI3bzlHWjFaSkRPc2VWQy9SeUFVdlk4VGpI?=
 =?utf-8?B?b2dOQS9QcUNVNXZhcGc5blM3OWxPNEMvdUd6eWtIVjdoWGRxNmtGRWNZOFJ6?=
 =?utf-8?B?bU9IZEFxc1B5dzJKM0Q5UXVwcE1wODNRN0VWc1JMZG5IeG4rRnhEZVlreHgw?=
 =?utf-8?B?T3BlVHJWbEREQWt6cSt1NnhZOG1yZWhLRjBuYmxUbW1YaWtaV05makRIVEVo?=
 =?utf-8?B?b0hDWnlLekZHUTN5YlFadzB1NFVUQmJXREFpdHh5STl3SUJkL1VpRnBTcE1k?=
 =?utf-8?B?eVpMZ0lYemFnRCtMbitET0phYnRhS3NhNEVKWjN0aVdKYTV3alBDSWQwTDF5?=
 =?utf-8?B?ZFhzTkJsNys3azlqL29VZ1pOcXZUWkpCajlYdkFDL1Q1SXN0RDZFUUVUclhv?=
 =?utf-8?B?enlaeGdCb2l0S3hRdkt4MW54L0VBYm8wd3NZMjlxN2Uya0hCeVhhckREazhs?=
 =?utf-8?B?aC9BT1hNZ3hQeFZWVjR6ZGIyYXhBTFpicnl1M2Q1aVdSNCtWOUVGa1VOaTJ4?=
 =?utf-8?B?cG0vbXRIaUZKVlgxUHVuY3I4T2wxZlNTN2Z1NHdTMHBHZ3g3MlMwSVpKbVY4?=
 =?utf-8?B?dTQ3MGJOaHlXTm4xeCtBVTQwMXh2Tnh5UGpkSCtiZEdGK3pEREl3bjBJcFUz?=
 =?utf-8?B?RDRkMmxieWtqcGZtSE4yaHRhVDN1bEt1WjUyd3ZkbkYrL0NCYVdkRm1GNGJU?=
 =?utf-8?B?T0J5K2MwN0ZCZktyU2Naak1TcHVTK2FCNmI3U3ZnbElndnNLb25SK0Q2UEFI?=
 =?utf-8?B?WTdpZTVNU3IxY05XVXgxY2ExL09sV1FMLyt3cGk4VlozZ1Ric3QrajBJOUlh?=
 =?utf-8?B?QzF6WHlhTzBLRTJERXNGVVVYdHZqVE8xWDB0OWw3bzV0RjBObm93cTdKOVBX?=
 =?utf-8?B?dTBVN0lqcC81bUhtNzJKSEowK3hmMUFlSnUya0l4T0RHRXZwMkdnNjJ0ZkI5?=
 =?utf-8?B?L0hzVGRDU1VnNHhZNkpMdWc2NnBUTzE2QVd4OUtweUoyTDNrekdBMEowWkhB?=
 =?utf-8?B?RC91UGhGZ0hyOXZtdWVmMkFxSitIWXUzWjQ5VFk1QXRzcTlnNXp5OVFpRVgx?=
 =?utf-8?B?bmxIcGpLRDVLNFQzOGZWMlhYOFYybkQyQVFRdUgxcm4wVVNCNUlWczd0SWFy?=
 =?utf-8?B?UmFtZlE5UllyZUU4WWNaVEloVWFUT0p4LzRxZW9lNnpOQkliZmR4eFdzZkRx?=
 =?utf-8?B?SXJ5SHgxV1RBYnFEM1JyblRzUzd0ZTdZWUJsaVFybUpQWjRsbUxMeFBLY3Vm?=
 =?utf-8?B?b0NnUnR2eVBHK0UvZFRmRTN4QnJYNG9XL1BrYURMN2hQTVh3THZiYXNSY1RU?=
 =?utf-8?B?UTRWUG5rQ1hmdVNCZ1pQNndlVVZjNDN0R0c5eXlmcTM0S0ZmVStLOFRYa3pt?=
 =?utf-8?B?bDZqOWVpZ1pxQ29vK0JKbFdKRldaZ20wN3FuekNibDFYdnlLeHBxYlArMVNs?=
 =?utf-8?B?d1NWdUtPRW1nN0E5WHZQbmpxTkNxcVZOMEVWdkdoTVRicW9DUnNKOHRpcEph?=
 =?utf-8?B?WHhkS21LOENvYlRlbll5N1JQbDV2RitUZVhRdVI0VDhvbTI3Z1ZoODFGa1dk?=
 =?utf-8?B?T0dSMXp0N2VSTHphVlg2T2JEVTdKd2hGek5RQmhOV0ZHYW1hQ3MyTkpFVGtq?=
 =?utf-8?B?VFR2MXlxbDg4TmtZRkJ2ajUzSVhmNkFsc09iOUwxVElEczRiWVQrOVNrNFR5?=
 =?utf-8?B?MWpwaEJTc3lCbVNVRTlxRGk0a2c4SDhrb3NFM2RWMlV6MFo2V1JZVEM1cHl6?=
 =?utf-8?Q?bTbUxzBxPuASh?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bVR0Kzh5TFl2Z1dMZlptcWlzdUZRTjJkR2tYaDY4WHhaMkdSRlNPY2UyZC8r?=
 =?utf-8?B?RWZoamN4SlN4QzFhZmowZkxYZ0JoMzlZZE8xTnJoRFhGeTJQdTJnYnF2NDJB?=
 =?utf-8?B?Wk5EcEtrUUN3SHZPVVcyTXhTekhUQlIydE9EbVFYbGtlZzBubHNMSllseHZn?=
 =?utf-8?B?R3VSSnRLZzNtSFhLSmxIaS9XT2RlODM1d0k0WGxJUFAyYWxjbnNHT1N4OUZ6?=
 =?utf-8?B?SldtL2ZOKzIzRXpxNWZCRHhRWHE5ME1GYUxpQXdnYmRjZWx5YStDUWVmOGNa?=
 =?utf-8?B?citoSDVwWlB5ZVZKalR6SHY2dEZZTGh5SGM4SlpOUHV6OWJndnhIUFZ0Lzdp?=
 =?utf-8?B?c0xhbmZObkN0RFMrdmJheW1YdTkzOGxOUVIwVnZPUy9BWjNQcVRzRWNOem5B?=
 =?utf-8?B?SjJCMlFoKzlqK1FrVkU5UEprS05Ma1pzN1oxSFJLM0ZlTU9BcUlaSkpqRUdV?=
 =?utf-8?B?S2poRGZ2WEIxaUdHTnErb1FzUkxnTDlaUkIwaWtWaHZ6N0pPcnRNZjJDYjVw?=
 =?utf-8?B?YlpOWTJIeXZDc3BNamVRVHE5dDlXMHYxdDZXWlpqdExpdmNCM3hxRnhIc3g0?=
 =?utf-8?B?dURNSnk5TVhWQmtRMm9Memphc2NPb2diYzNCTmMzallWamIyVllWYjl1a0RQ?=
 =?utf-8?B?WXVvdEZjOTByeEtHNFZoRWN4cDV2OXJXejV6Z1h1VUpZcEZNV090dW9IbmFP?=
 =?utf-8?B?aEMrcGYvbk0yMTVpWW51UmpreWdOaDJwZFNTS1BZSzJmdzJVSVU5WEh5aVdT?=
 =?utf-8?B?S29SbG9QUS9SR01hRk5nODNYaGM1S1lPdWNaOStNSUNCMkcrT1lVcFR0eGpD?=
 =?utf-8?B?S1laYzJTK0MvUTF1WFZ5Rkh5dFdZdjZhWGlSbHhIK3ZQN0NNSXVJRXR1akN6?=
 =?utf-8?B?QmgzUVZncGo5YlJCeTdnR2lJZk52RFQyZXJSYVd5RjdPcnk1NEdabk5aK3lM?=
 =?utf-8?B?aStXWGhoWTNadTlCM3cxODlPL0dpYStTRjRoVythUUZUQ1loRXFjZDZJbTBX?=
 =?utf-8?B?QkJ5WFYybUs1Y3hXbjVacFpmZG8zMUsweFZZOTJXTkh2TmFyZlo1V0NMelBN?=
 =?utf-8?B?MU45YkhYdzRLR2sxN0lqbCtWMzY3NFk3ckx1QkNJYjJjd3F4cUc5aHo2UWFT?=
 =?utf-8?B?TjZ3YlVudGp5c011M1pkQUU5NWo4djc1SUZaV05VRitGYWV4S3pSK0hNbEJK?=
 =?utf-8?B?NDY2V0JmeFAxSmcranIyN1NRbm1seWdhZCt1OVIrR29ET2Y3K2loWUVTdkdI?=
 =?utf-8?B?U3J5dnpNUVVWK3QzWThSZHQxN3FQQ0FCNG5EWTRueWFJWThDVy9SdVlWZGZi?=
 =?utf-8?B?TlJvdW12b1hvYWNpb05tVlpIT1RicDlSTTVPNWdwYktqQlZ6MXUxQ3VpREtU?=
 =?utf-8?B?eGd4d0t5djVQTTNEQjlMSVVSMXhUV2ZjejhLcXFTSzNUQUVmWGxoV1dxZGh6?=
 =?utf-8?B?ODM1allJOU04SlUySXJiaU9MTE5SZE83SDgvVFgvYjdCMWNnK3MwVWZjVTVj?=
 =?utf-8?B?V2JCK1U4Y0xpMkxnN211TEdPN2FjaG5kdlVYemJwT0w5bHpxWWd4ZndKeHVx?=
 =?utf-8?B?VXRrVk9TV1QrT0d4dE15QU5GNkJ5MnQ3QTZzaysweDF6SmlKV25qcWVkOHov?=
 =?utf-8?B?WkZ6NzNiQ3c2cW01bzBQbVdUZG9EQVI3NkVkWkw4WGN6QWF1blRvSno5T1Fh?=
 =?utf-8?B?eFdLQnM1TEhvNUpkcjRMNkRqTlhOZU5OZ2dsUjhIQWlpaWllbnFpb3EzcXhH?=
 =?utf-8?B?WG5xWHFacEtmalJUc3U3a3h1eW9aMnFWcWxFVkJNWnNvaEljYTFVSXhOSGUr?=
 =?utf-8?B?bDljN2o0UnJBazJwOGFyNGUzT3c3b0JabWFJUUROdEhGUW1DV3J5SHNwVERS?=
 =?utf-8?B?a1EyZmwyK2l6UlZvNmdkNERPdVkxaFQxcjhjVlE4THIwaTB6MTVjdlR4M2Ez?=
 =?utf-8?B?NGVOOVBEcWJRdkFLOW1aMi9BcGxqemZucVRGZHVvYTIwci9GVlFoNG1EWFhG?=
 =?utf-8?B?NnJvc2V0V2lSVmwwQm9rSmZjU2tOaGVGWjdONW5FalkxRGNLcGlxOHgzaWY0?=
 =?utf-8?B?RktIZjdndkRkb1UzQ2J3NzlnbXdka2dkNWdpbUJVUStkVDBrRWFDKzBIdlFx?=
 =?utf-8?Q?B/F2gV73VmsSkZiGTuUv3eTh3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92a3db93-f43f-474a-1125-08dd728bd070
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 08:44:58.1717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xz37+J2KOJ6iHPtXwZNSg2RUTFtOMfkO9Q51DuVUEobif80CzkMUujTNwmHMHs3o
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8425



On 03/04/2025 10:43, Jan Beulich wrote:
> 
> 
> On 03.04.2025 10:19, Michal Orzel wrote:
>> Just like for RISCV and PPC, the earlier we enable the CI build the
>> better.
> 
> What about Arm32?
The series to enable compilation of Arm32 with MPU is still under review on the ML.

~Michal


