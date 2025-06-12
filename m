Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C6BAD696D
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 09:48:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012463.1390919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPcfi-0007dX-8k; Thu, 12 Jun 2025 07:48:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012463.1390919; Thu, 12 Jun 2025 07:48:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPcfi-0007b0-5C; Thu, 12 Jun 2025 07:48:26 +0000
Received: by outflank-mailman (input) for mailman id 1012463;
 Thu, 12 Jun 2025 07:48:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eaA8=Y3=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1uPcfg-0007au-9x
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 07:48:24 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062a.outbound.protection.outlook.com
 [2a01:111:f403:2009::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c14752f-4761-11f0-b894-0df219b8e170;
 Thu, 12 Jun 2025 09:48:21 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by MN0PR12MB6055.namprd12.prod.outlook.com (2603:10b6:208:3cd::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Thu, 12 Jun
 2025 07:48:16 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%2]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 07:48:15 +0000
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
X-Inumbo-ID: 9c14752f-4761-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a/T9if9LoovEIZSpsXWuFHELM9Aoi+XzdcsLEb6brFmKyhIM6SvUk+HuQis1r2zyIa0Wp9MmvPM9GItj25gvHpxUTWimgatvEAMavjHhrzkRCStwFy270ZqDNKBrT+TpSyZmfRcOhhjKUzXJolBmcjmIXG0IWho1Q22y7Ae9WKkBYY1840Y+lorwNqTMSOQ4aj2J3OuPSBuxYw7+gd4laOTShvQOK5JiHK4tk3GjvJyWWN7j+tfCYi30DokvcC4QMyKjxQ4fEfPAImT86JHRTnpIK2RussN0J3rraZ3LDX1JqmfjE8Qy4+CyGVQWwJURRGpoazmb3SXBny6AEuft+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xRAfrnQaH0ueHVkW+B+X1iPuzeIYFft5fE4xMcX0vzk=;
 b=GmKz5XUfXsl6gBH9Gz5SrfhhBWEZW3iQCaqKyZKo/RxAvXds3U1WayzD80pIIPNZ5XLCmCrGRsKHwGOy/+syoQa6rPotggVAZKoycO/Z7TBo+3POLVHatzsK5rUfim8wiW36Hcuf9boXpUPHCj9O65PivUZ+3KANYKXpPt4GRp4fK47/vCwBSjn9ZNA2XFixz+MGWx26+CHxVW1LaLyQRS7yfhzUHXvf39O6QjGRXFOSIyUmaJasPwE+z9FQVUXvYKl+QheAW+Awm5WngCtU9O73zsA9BjJ6HPrVlcqbdG5bF41osKmotI1gS5bkyYzxXi1t7YunVZxpd/iBOgT1TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xRAfrnQaH0ueHVkW+B+X1iPuzeIYFft5fE4xMcX0vzk=;
 b=3r9BJ12rDRxKKu6yUA24V+PIlr6IRzCG6/F0nUScLwhyzY7I7hwfsJ9ZtThKAxxuKzsiizv9+Rp24C8TEY7+LEkjQg4bmUKho10wIFq/jFpIESdo+TJprAs6qEU2dfxEp8oMFnInSlE+XxXvtT2n1814BvxHNqWZmoMU29gvaH0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <998d479b-dab1-411b-8cdd-31d0c7da8208@amd.com>
Date: Thu, 12 Jun 2025 08:48:11 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] arm/mpu: Move domain-page.c to arm32 specific dir
To: Luca Fancellu <Luca.Fancellu@arm.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250611143544.3453532-1-ayan.kumar.halder@amd.com>
 <20250611143544.3453532-4-ayan.kumar.halder@amd.com>
 <E685CAE6-A57F-4C01-BEB9-FD0CFA5AF560@arm.com>
Content-Language: en-GB
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <E685CAE6-A57F-4C01-BEB9-FD0CFA5AF560@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DB3PR08CA0018.eurprd08.prod.outlook.com (2603:10a6:8::31)
 To PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|MN0PR12MB6055:EE_
X-MS-Office365-Filtering-Correlation-Id: 09a555f8-c5bc-4965-b75f-08dda9857d16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RFFyVEFFcStxQ0dOOGgxY0Q1TnFKNzFxajhWY0Z1UTd6N1NUNEwzQUhXSmZO?=
 =?utf-8?B?ZFdRL2I3WjJiNG1DWUhrdTJQMnRoUGhuc0gvemVlalFsUVJ2M3pIN1JXVThQ?=
 =?utf-8?B?ZFppOW5scmR2Vm5CbzEwOW0wMzhTNUQzWEdDU3lFeFhlWkZhcURuR2ttSGM4?=
 =?utf-8?B?ejVxNnFXTjJkQnpOTnhJS3g1S3kvZU1DaisyaUxDNFVON3BhdUN6NklmWEZ5?=
 =?utf-8?B?TXRGZDBUU0h3a210bytVNFpacFo1dFlpTnV3emxjVVlFcENyWmJIdVNlZEtK?=
 =?utf-8?B?VUpSdG9RbWRMcDJjZlVmYzhyR3VtbnJjNUQ4WFFyaS9tU3ZQTDBrblZGZWlJ?=
 =?utf-8?B?UFZ0WTA2czBvdk14b0tDOEc3VFM3c2R1L3dWOEZJVk82QjliaXV5cjFKQ3E2?=
 =?utf-8?B?UEdGME9ocEpDcFVWQUtIMzRWTzRNL2V6dU9CbTE2aDFLN1d3YTM1SU4yejZX?=
 =?utf-8?B?K0RYdHkwN1Yxc09NYjRZSGpPWU5KbHRUZVVQdkYzaDg3RFhCeWRia003ZXlh?=
 =?utf-8?B?M2ZBczlxWjVuQXplR1BjbEZBQVk4VFpnZDd1TGxVc0x5bWJtM2hQSjVkUW9H?=
 =?utf-8?B?c0tKMVdiYWlmNmhNU3ZqTGlHeEhDVUdCZUdFa0M2aUdXbXROQk9ycU9VUlZZ?=
 =?utf-8?B?elA3UHJ0aEJ2VG1YdVk3Qy9PeU1KdlFqRkY3dkxjTUxjQzZTb0JtQlFmNkRv?=
 =?utf-8?B?WnNjRWJYY2ZWWVNEMldPUWRlMXpvL2dpZk9Qd0ZvbVFVVUFvU2xWUEJnK1Bw?=
 =?utf-8?B?U2xsUUsyYXZIYm9XbEVLMVRCR2FST3VUcVBNV2Z5TVJNby9GVFI2b0Rhbkgz?=
 =?utf-8?B?SjIwODI4RmhsT3gxdy85VEVRRmxHZG5hMDlGTXdFbXRoOVJ1M2VDWmx1TFEv?=
 =?utf-8?B?emx2Z25NRzZaaGZUdjFzbmFTODhyUGJ2Z2FIWm5WMzRwSitCTFF3dVJqZ1Fl?=
 =?utf-8?B?b3RUdDB4VEM1Vk11Q1hseDNRa284SmdIMll6MkV1clIwVGJpcmd3TUVUNU0y?=
 =?utf-8?B?b1V0MFVsMHBqTUZaNHgwRWpuOFFrZG1UZ0dVR1QxR1loNStVMFd4am5wOXF0?=
 =?utf-8?B?L01OR0hOdzBtSWxKWm9ETno2WWVIMGpsUmxPb043QUtFeEhyRlBzckU2RU1l?=
 =?utf-8?B?Uk1MZnh1NmtNa3cwWm83STNycVNNU0RnZVN1OHZ5bm9zNXBqN0hEWU5IZm9Y?=
 =?utf-8?B?ZElhT2NXOHppczZxK2J2WU8xbWtxeDcxTzRTYnd5eXVUbHV1Vk9FK2M0b3Ew?=
 =?utf-8?B?anlaRWErSEh4M3ZMQWlmbUU4YytkSDZ1T2ZHZzlVb2t4cTZweU5CK0gxelpV?=
 =?utf-8?B?TnkyUDBwSk9NVytLakJDYk1Ed1Y3MVVlZTJhWVU0OGpoMVpaaFlJanByeTlz?=
 =?utf-8?B?YkFuMjM1dERJOE5jWmxETTNiSWo4RVEvYzJ3SnBoRkhwZ1RtQjdXUlVQVStP?=
 =?utf-8?B?WTE1RGM4MFVGU3FnMVA0WVpuK01VaXBYUHNwSDJGSklHQWFlT2h4L1hlK2Qx?=
 =?utf-8?B?WDFJRlpQUFd1M0Ivdnk0QkdrRUkyNmlBeFZsWnZwQ0lHSThycEVZVk1PREpO?=
 =?utf-8?B?U01HYURHNTFrYkRRVXQ1bW8ySlRpYlVEdzRtWTNsZTBlenI3T1Z1UjE1Qmpi?=
 =?utf-8?B?akxMamsxSmsrV2NONExXNmgwWDlGT1JlNmY2QjBJck8xWXV2YW5jYnZKSmFy?=
 =?utf-8?B?UlZFM2NtWXgxVGx5VEpQZzJ3aGRNVHN0TWFGcDY2UnU0MklkV0NFeWsvMEl2?=
 =?utf-8?B?RUI0VHFYdE1CdkJpR1ZPbmFPeGJVbGc1MnJGaDJSTkNYQVNOYkdPNHFkeEV4?=
 =?utf-8?B?K09RT3hEOGlua1hYbVFDcTVMeHNJOFF4bGhqNGttdWJOMXpTOVZ2K2RUQk0r?=
 =?utf-8?B?eTM1NGN5dUM5UGMvZ3hXWCtLemZNU2NaYkE4Z2hzd0czZm5MY2dyaGpZc2U2?=
 =?utf-8?Q?BytBv6xrcig=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rkhta0xDMFh4U3VwUnhjTTJPd2F1K2xwMWJxSGUyVmNOaXcrRU9ocnVwY2xM?=
 =?utf-8?B?WVZWdE53dlNCd1VtWHdDblU4N1ZnUlRNNG1ncWJpSWc4bjM0Q1pUK1dsRXNi?=
 =?utf-8?B?LzdEYU1ZSDFPOXlOaXZkRDJLeXQybk1SZStZNHRZY3Yra29JcWJnckJ1OGJ6?=
 =?utf-8?B?N3JkUk4xSUJvdmJmRUNVZlFwRkpybm5ZTk5wSXN2WnVLaFRsTWVQNS9SS0RG?=
 =?utf-8?B?WVo2VkJ6Nlc5U0ZERGtNUVlEWXNKUmw1dnBzNVpnZlJqS0FWQlZFaEZZc2Y3?=
 =?utf-8?B?UFBsL05SNFd0MjBXMVVQUzQzN3dWWWs3NkNoSUNjVFU0NjN3VGZneW5ua1JK?=
 =?utf-8?B?V21OZTVLN2xUdlBOd3dzODhwTG02YW92Y0d3Rkdob2kzeW5pTkhacnpGcFYz?=
 =?utf-8?B?MmhsVVF0WEcwMDJDVkY2WnUrT1BzODJQd3hWRUYvTWJudmR5OEgwMk9hT05i?=
 =?utf-8?B?V3Y2ZWhYR3lkT3N1OHhzZ1pabndRUGRpc2hPaUxwbDZ3VDF0WjdwRzBkTTFo?=
 =?utf-8?B?SnNlbVdoZ0VqN3RiRSt4ZzRaT282WXdXUWRtcXlVOElHR01xM3BucldLb2RX?=
 =?utf-8?B?Y1pheUtONWRLUnVKcWRXanZ4dk5CdEJNMSttdGVlY2lyNlRLYXJ2RXJ5bHZK?=
 =?utf-8?B?Zk1STzdubnJFOTNkMnhSam94QjdHT0lTY1NqSzk3THRRaWtHZlJTZTVROE1r?=
 =?utf-8?B?Z3NDRzNQdGhpbk91OCt1ZHc4N2lPTS9ueWRXMzAvUFJIZFlnbHNCYU9iRU1l?=
 =?utf-8?B?UnkwbklLL1kwNFZOT2EzS1pUVmpjODFTOXY1YzlJcVpBeWVKVFA4aHljUXl3?=
 =?utf-8?B?cERpMUN5aFBOTUl0VmJCSlN6Um9TY0w0TWQ2SjRnSjRDUmRKS3pkWHRqVmhU?=
 =?utf-8?B?SEFTVVQxRDNjdlVkcGZ1cUFobGpnMlFBQnlHdjMxQ2o5WU02VlN2S1Q3S1ND?=
 =?utf-8?B?L0gybnBjcDgxNlZnWDREd1lPYWovdHhTZlNJMGNRV3Bzb0MyZkVGVkkvZ0dS?=
 =?utf-8?B?UFhWbkFpb21DQmlrY040WDhsbG1IaDQ1Wnp3MGdvQlhLWTJZc2FENWZoc05K?=
 =?utf-8?B?MzhNQUFSakpWbm1kMHpNOEZHeTBHRlhQdTIyYTloQ3lyWlZYK2dMeXV4ZFh4?=
 =?utf-8?B?ZUs5Y0xhaE9zYnYrMDBnWlJIQlk2V2xoWEtGdHRIdk5SQnZVa2JXWGwwUWFz?=
 =?utf-8?B?ditvVVZxcVluK0duRUk1TTZtZEQ3WVY5UDh0TUlxNUhPRy9DZWI2RzNtdFRn?=
 =?utf-8?B?aFVZeGsweHhleWh1NFNDZjVVS0NpcklQVGFUNUptYjUzL3hhZm9MckMzMmZh?=
 =?utf-8?B?eEZubkNRdStYNitiWG1NRUZtMC9pMXlPTHpHTDB4QlBKRm5OOUpqVGZwWXlW?=
 =?utf-8?B?aVlVVHNqMkRMcUE2WTh1c0dNRlM5Z3JJZU9GeXZKZkFtOG1ZWUpld1B5UnNK?=
 =?utf-8?B?WVAyL25qU3IxMGIxb0V6QnNCdFI0SWVTajI0MktPZkdERE56d3NpeXo5QUtF?=
 =?utf-8?B?R1VXSDFuUTlBZ2JhalNVT3BuMExOSk5KZG1tOUV3M1JoaEpxc2o4bXlzL29o?=
 =?utf-8?B?ZmtrWHA0SEw5L05BYWt1emw2Y25nOTdlUkhhcTJMK0lvNGJBUE9wZVQ4OEFs?=
 =?utf-8?B?NGNaT1VhRVpVNXA3OXBuWHFNaTRUT0t0ekIrTmRLQzdidXV0VFJnR09pNEFT?=
 =?utf-8?B?QWJJSUYyZ1hiRUlGNGtDV2RNNTczL0wybnNma0ZrdHpTZ2dvK0d6UnZHTGFT?=
 =?utf-8?B?VHlRN0ZFaWxxZHVXV2ptOTcrL3ZJbFMveEJ0b2VtV1RqK1pwRy9Gb0tMM3Ft?=
 =?utf-8?B?OHF1RDlGdk8zUlA4UHU4dXdJWk1lNFFDZWZaNk9uZ1NpWEpMYUNQK2QyMFEv?=
 =?utf-8?B?WE1DOGN4Umx0d0N4QWlETkVFQnd3NjhrYzhIaDNLTnZvT3h0ZkFBZDNsbnNY?=
 =?utf-8?B?c1JIRTNmUTlpTzViZ3hvNHVNS3VWN3BwcGkybDZmVHFvelU1M0Z2Z1lxOHZI?=
 =?utf-8?B?aSs3Ymhlc1I1Z0VRYVFNeFpFN1ZadEpDalFMc1dyaWttd3JyTnlkZFBYWDZn?=
 =?utf-8?B?clBQbTJWbUtPSHlUWGxmTzFqUTF6TEtDTWlWem1STGNuU1gyR1lrTTA4dnoy?=
 =?utf-8?Q?6sPRj5Txb9ZnLP+UaDBWdsXVf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09a555f8-c5bc-4965-b75f-08dda9857d16
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 07:48:15.3629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J/ysf+gOEMWg8yiBwHmQ/1q9+95bu47QcfpppEpyHiL9eg0K7gGDmoyxgRRyaWM3MOjtYw2OXLRUjb60fks94Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6055


On 11/06/2025 20:46, Luca Fancellu wrote:
> Hi Ayan,
Hi Luca,
>
>> On 11 Jun 2025, at 15:35, Ayan Kumar Halder <ayan.kumar.halder@amd.com> wrote:
>>
>> Create xen/arch/arm/mpu/arm32 to hold arm32 specific bits.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>> Changes from :-
>>
>> v1..v2 - New patch in v3.
>>
>> xen/arch/arm/mpu/Makefile                  | 2 +-
>> xen/arch/arm/mpu/arm32/Makefile            | 1 +
>> xen/arch/arm/mpu/{ => arm32}/domain-page.c | 0
>> 3 files changed, 2 insertions(+), 1 deletion(-)
>> create mode 100644 xen/arch/arm/mpu/arm32/Makefile
>> rename xen/arch/arm/mpu/{ => arm32}/domain-page.c (100%)
> Uhm, why?
>
> Arm64 is using domain-page.c:
> https://gitlab.com/xen-project/people/lucafancellu/xen/-/commit/b28198d00078991d4a6502e94c8779d84fec0120
>
> Did I miss something?

Oh, I did not look at the future patches. I can drop this patch in my 
next series once you and Michal/Julien reviews the other patches.

I feel it is cleaner to have separate implementations for 
prepare_selector(), read_protection_region(), write_protection_region() 
between arm32 and arm64. (Refer patch 4 and 6)

Let me know how it looks like.

- Ayan

>
> Cheers,
> Luca

