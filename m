Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE441AD19BF
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jun 2025 10:27:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010140.1388274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOXqq-0007ar-Sq; Mon, 09 Jun 2025 08:27:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010140.1388274; Mon, 09 Jun 2025 08:27:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOXqq-0007YQ-P7; Mon, 09 Jun 2025 08:27:28 +0000
Received: by outflank-mailman (input) for mailman id 1010140;
 Mon, 09 Jun 2025 08:27:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Wg0=YY=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1uOXqp-0007YK-1O
 for xen-devel@lists.xenproject.org; Mon, 09 Jun 2025 08:27:27 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062c.outbound.protection.outlook.com
 [2a01:111:f403:2009::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91136224-450b-11f0-b894-0df219b8e170;
 Mon, 09 Jun 2025 10:27:24 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by SJ2PR12MB9211.namprd12.prod.outlook.com (2603:10b6:a03:55e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Mon, 9 Jun
 2025 08:27:20 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%2]) with mapi id 15.20.8792.035; Mon, 9 Jun 2025
 08:27:19 +0000
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
X-Inumbo-ID: 91136224-450b-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QdGhAB+W1l2svRQPMTzmlp+z2mdwJfRiyfPAsbc6gyhJfDHXmj+3sj2zMlU7VNnjNU0PUoBEUHju5HJFOZsHPcL5D8M1L8KJ7vCXwLFmCOnWrrxIGiUoUnBgFJ7NQVKkVhBTpUlAJbzhgEjoz485+dDiSu2Ftb5HaxXyKYZk3xPS0s7e6Rk8mvBfEVbJFX/xTQjtwDqagcBTIuCDA2JtIjPpfc2Ng6lc8aSJztiA1O4CPRDV6VN1SAaPs+OQi4HbV+DYUwKXll+84ooezGYUQI5kLsF53Me38s1CXorWq16IQuej/FRHBlfw5qg6TpGbEGueIPLX+ofj644rmLHQFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=thTDNQ0aEfZfGJMhkEE5KLaEV6e1Bzn3CLrqLYwuLW8=;
 b=Kso9RCRmTYh3yWBK/FPAaxU0Vrp0kko5KEF6o+lAE7FeWWACwXGskRoIdZPk/3/49AEf/7kBmajeqgUb3pOjbBAa4Nn3hoBOHUUb0NlshDWClbVRu5CweqBVkCiBngIVL1mmV9ZkCZ4voyxevjnwvCl+iI1ml3mkgbYLb5G429zYSGA/KE63oe16bS3NzIyn7Isajjc5aGvbOYX0KqAsah8fgBtOjWWVYiOFTWQa+GdiInrjPkNvLMQXUpkY/Vwvfa7aoo7MWnRrGF6lWsv1+bS+cbrLhZuTl6Kakx3h0ZkfN2y82HJr4gBPUq0hy4cqgC340zF6WoJAq7Ipve6aBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=thTDNQ0aEfZfGJMhkEE5KLaEV6e1Bzn3CLrqLYwuLW8=;
 b=qw9prf9Tx5wLToR3Lms33UiPgbk9ufAbFF7cI8AxsOFbnVCXgYzfYnOVT3TRk8KSyfz+14X6WWuV5mglOnbMBvr+prZx2F1sheWMFpqCmiRP4IhB+1+AXtIUZ6huttZSvh/bOBKQh4uhLooBLKL7IzID3pi8BI+4TF3VZ3htgmg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <a1b87894-9c9f-4ed7-ab81-63cc27440ad4@amd.com>
Date: Mon, 9 Jun 2025 09:27:15 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm/mpu: Provide and populate MPU C data
 structures
To: "Orzel, Michal" <michal.orzel@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250606164854.1551148-1-ayan.kumar.halder@amd.com>
 <20250606164854.1551148-3-ayan.kumar.halder@amd.com>
 <ee8df4dd-1256-49e0-827e-c4dfe9543fc7@amd.com>
Content-Language: en-GB
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <ee8df4dd-1256-49e0-827e-c4dfe9543fc7@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZR0P278CA0046.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::15) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|SJ2PR12MB9211:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fe6a7e0-69c1-4e79-f2b7-08dda72f7348
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UHFKQnQrcnUva3hCRFFCWUcyT3NONXQvVnJhMnpzTGhiUHZuVFRpZjNvMkpT?=
 =?utf-8?B?eG13eDdkbHI4RWhSRVYxbS9iZW9zQjl4WjkwcWVHV0UvbVdIQU5tZXUyMzBh?=
 =?utf-8?B?bzNWbFBLVm8rM2lxNHhBcHI3TUFqTzdCTUpUYWhwSmFyQ2p3SEhNcVB0M1Ex?=
 =?utf-8?B?b2hSSmh4R0xWVWs3MWFZS2Q5OW5WV0M1dDk2ZFcrOHF0N1g0REdSR0dZNk82?=
 =?utf-8?B?ZXRJalVJVG52QmJYMCs5ZWUvQUZTd1ZuVFkybUJ2SEN4ZHdsOHhQc0pDa0pq?=
 =?utf-8?B?S1lBM1g4Z0lzNzNwRER5VzJzdWk1d0gvazU0QVl6bEw1aFpTZVNBSFB4aURQ?=
 =?utf-8?B?b2kvaXY2T09TenNJRFZRWkgrOHNPWUtVYzZSYXN1bXdjK3g2dUtFYm1RaVVj?=
 =?utf-8?B?TEVkdllwUjA2VmhDcDNQek8wQWZaWFlGUk84cnN6U091QnFqM3RvWDJhK3lF?=
 =?utf-8?B?L2lPdWZ2WUE5TWZZVVdWMjkzbWJkdm95SUdnUVlGaEdyaUc2OWVKR0lVUFRu?=
 =?utf-8?B?d3hwUlU2QmdrSnhXcFZnUTVQbXUyMFllRUZHUWNpazhTM3lacEtQL0RnS2lZ?=
 =?utf-8?B?eVgwWjVkdEg2ZGhLRERlU2MxSHg4R1ZBejJmRnNjdUd1cldnamIzSjlUTU8z?=
 =?utf-8?B?YTlsYzVtRHQ0cEVJUzBGOERNanRYdWhvVE04UzJGSTl3SElrTit0RkNKNVRU?=
 =?utf-8?B?YmV6ZzlidlpkQzdra1h1Ly9uVS9DS29CdEQ4M3dJK285d0Z5RmlKL1NlS1hn?=
 =?utf-8?B?alVxUDFVZGl1TkxoT3ZpR2FQOWVNQm9MUGFuZ25uUVd1L3NtcGpuYVdnaXVv?=
 =?utf-8?B?OGxsMUZBMUdkczU5T3RnZjkzNXByU1gxTCswWWF2MWc4R2NrOE80b0p2Vzdn?=
 =?utf-8?B?TndFTmVaZHhzemJwUVNzYUpIcUI5R0ZVVUp1VXpkVkdhT20ydmRuNUlIMWsw?=
 =?utf-8?B?aHI3bE5YQ2dibGQvVGtrSzdPVHRwTThJSmJlWGpqWWErSERzV0lVcnh2aDIy?=
 =?utf-8?B?aW55aWFoU2F6T2N2a2lyaVlBVmRjLytmeUNwZWVyTXpNclM1MWw5emFTYi9H?=
 =?utf-8?B?RHZSRnVGQlpneklWd0hHREh5R0pMQ0thUDh6QWxnSUtZWjhlcFAvV05ZWGY4?=
 =?utf-8?B?SlhCZG9MK1daUk42N1N0SSsvaGFLNmJkV3JDTjBXU1RlTjJHVnBJUm10RG00?=
 =?utf-8?B?eHd4NDJPNDNpaEVOaFF3MGlyMmliZmVjMGs0WjU1UXVoVENCSHNzdEF4blI2?=
 =?utf-8?B?b0NhV0l0Q3RjWUVTTXEzaGI3SzNYd0l1VndRWVpEeFo0eXRZUUhMMVN1d21T?=
 =?utf-8?B?V1g0MjFYWUozL2twcHNCdi9xdDZiOGo4NUczVnVJQVN3SkRUOTVFOVl1ajRp?=
 =?utf-8?B?d2ZUYWtNcklZQ0hnWWc1MjUrTit5Um5TWHN6RVBWdlUzZDVKSWx3WUwwZHRT?=
 =?utf-8?B?KzdzZWZzemMvZWJOZkYyKzFzYzR5Mnp0U3BpMm8rVXhQVXN0SVRmSW5TRDRk?=
 =?utf-8?B?cmdtZm9uOEZFMHBGUnZmNjU3c3RNSHBneWhRZzRCTnNOU2xDNTNjb240aXNl?=
 =?utf-8?B?d3UyeVR4dFF5RUROaGxlN0J6SHpGQ1JQZlpqbmdFQWdLYjltQTBVRUVuZytt?=
 =?utf-8?B?bHlwaGM4Y01lVnUyVGV2ekJWb0NqZGFwYitoT3AvYk13TmRqVktSU1pZWFNJ?=
 =?utf-8?B?Q3ZmNHFLVEswQ1dkVmtZOFAzaS95SXF2dUlEQjQ4QzZrRlpWMTJrWDZVOWNk?=
 =?utf-8?B?ZWFMWWZ1aWNBSksyYzFGelRzUGVONTNWNDVlbVVHVklUMXNzUGtLQmFDN1Nh?=
 =?utf-8?B?UVZRT0tPZDREQVBlM09aaVkyY3pMbG04S0g4elNMNlpydUJ6NFV5MWxYbVpl?=
 =?utf-8?B?ZUZmTGZDc1B2ZzB2NytkZ21ZZlFZSUhHdnNlMitSc1lTeXQ4YkNPWjI0QzBV?=
 =?utf-8?Q?vROF9C6ay7I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bENsQzN0MDhod3NqUXZiTFpFQ1RaWDJJOGRWdnJCZ3FrZmFpcEkreDVET0lL?=
 =?utf-8?B?cTl2QTlORklwb1lrU2hZY01nRTJabUJQK2R2MlA2OE45RHArMTFjYjlLNkFo?=
 =?utf-8?B?aHlaNjFXYUNiZEZndEdhKzRQL0tCWjBkdnd0NDRxaXk1MnNFZzhGaHpTK2xD?=
 =?utf-8?B?Q0lOL0ZaSE9jUE9Qc1dyYmR6eXh4Q2x5ZGxEVk40SDdaSktQWW5wQlJSbno4?=
 =?utf-8?B?a2RLK0sycllOM0JVelJWRGUrQWUvc2N2QVAxZW40VG82NzlvNWhmWUx3dm1o?=
 =?utf-8?B?MjZEcGVOYXpYS0xJamlldUZlaGxvYnQzeTZ3eGVsM25Yc25nWEwzS1ZVLzZT?=
 =?utf-8?B?ellkbkIxdE1UZ1lYVjllUDlCWkNRY2Vlb21mSXFtc0N3bVdiYWdvQTdQS1I0?=
 =?utf-8?B?VVlWdDVKVGs4TkFEUjg3NDV3Tk01K3ZCSEtvYlNYK0VQM1RmMDZEUVBwNWNp?=
 =?utf-8?B?SCtFYWFta0ltcTNRR0wvZ3R4Y2s5US9VbU9Objd1RnV5NG5OaTRObHg4dEp2?=
 =?utf-8?B?aHVTNnFjSzNGc29sVjg1RVl5YzdwRGppQUZyamVFKzQ1bkREZk53bXk0MFFK?=
 =?utf-8?B?M1RiV21xb1drNlMrUmpvVjE1dmdOUDVPbG16VVpLZERHTEs4OHY0RjRJS1oy?=
 =?utf-8?B?cktMSlhYbC9weVhWYzFHR0VMbXZwbVMydW1ZLytWaWdIL1pHczdMTFZiNWs1?=
 =?utf-8?B?NTRpUmRCVEQ4bWlvZVdZN1pMaXBkWkp5VUVQdlB0Tm1QL1Y2THBqemNYZjNx?=
 =?utf-8?B?dS9NSk1pQzFWUmcxWWRheEZhbk93UUlmWFRWSHhBalFLUE40KzRHWHl4alVK?=
 =?utf-8?B?T0MwbTRucWZ6MFRmRS9YaThmRi9wbHNBR0lkV2o2ellGR1JFTnRkL05yZUtx?=
 =?utf-8?B?a3ZjOWE4a3VZUXlMY1QvaUZpVDVsaUIxK1JaeXVXeWdMaXIrUTM1UWFWaHhy?=
 =?utf-8?B?WGlQWC8wRTcxSzNRbkNpRU1YK2ZiSCtXYkpKY1M0dU8zYVdSYTQrZUZQdWxG?=
 =?utf-8?B?NE9kZ2I0aCt3ZmVqSU1FVVg1WTZSL2pIRUp0TU9GK2VOZmdNQzB6YktSWGRm?=
 =?utf-8?B?dVJTd29nOTRYRlFpTXRRK3ZuaGIzK1hVV0NBZGQyQTRzdzVCRkZabmZqNjJs?=
 =?utf-8?B?b3lkbDNudi9jQ21wdjlGKytrck1QV2gzNVNqam9abE9kbFhOVUc5cnBXUnp3?=
 =?utf-8?B?YUtzWWozbUlBcDJTZmtyK1A2eldnVCs0N09jYXI5dFh2RUpISVRMT0EvTzhq?=
 =?utf-8?B?N1BMN293Sm40ckJ3cFc1bmc4cXpKekQzU0tUTjBNWUVjQXNYdDZoY3RDc1lZ?=
 =?utf-8?B?QmZIWXBIcUgzSWtTQUxHUEFaMU1mSkJkK3U1RHZaODl5V1dWYUhSbm5vVTRJ?=
 =?utf-8?B?RlRUc0JGZXVRcmZRY1hqUHFiMUFTRTF1QVh2eFBORUF5ZEQ4UDZ3ck5KWkht?=
 =?utf-8?B?Q3htbDB5UFlOTlhXMHZzRURkRUM0dVZQSHRaSVRDM1FudHM0bEdWKzN6NTBp?=
 =?utf-8?B?dmVlTWdVTUd4UTBEUGRUTExiSVhHd0IyUFk0VmhyV1VudkdqSzg0aU5kbG5m?=
 =?utf-8?B?WlN3cGU1YXRTeXBSM3BaRndwU2k5elpUZ2tER1pWZDNpL3BZVlRYZjFOQlhO?=
 =?utf-8?B?ZzUzZTNXdm81WjExeHA1ZEJWZ3JqQmNwR2dLVkNiMlZ2YXZXc0l2MTlLS09E?=
 =?utf-8?B?c2lyQ3FvUlRTdHpoRGNmMVQ4dkRPZzA4blZPOStvcHNBS1NGTFJheGpoZ0tm?=
 =?utf-8?B?UkViK3RUdVV2RWtkZzdUU0tCdGxjajlCQm9mS1VrVm1lOVBTekpkV0g3eWJG?=
 =?utf-8?B?cjNSdnN5a0pvYktQNGs2b2FjSldsOWw4bGNqdW1OTHJ1UHRIelF2Mjkyc2Vy?=
 =?utf-8?B?aEFiN1lxVklVMEJRSWRCaTBGZkxud0VEMHg0MmlvYkNVS1VjcCtmOXIvbklD?=
 =?utf-8?B?YTJRV2dkOHlXWEVGM2FaK3U3NGU3UFFIdDVYcUdZN2ROSFVVcEsxWEpXZE9L?=
 =?utf-8?B?UDhwUDluMEMrN0REREVJZndzRzBuK083eWFYQ2RaeEhPYXRTd2txQzNWRWJQ?=
 =?utf-8?B?YjJYeFZUWmM2NnJjQWo1V0lUN0EyWmtDNzF1L2dzbFUzRFRWK25uMXF5ejFK?=
 =?utf-8?Q?5Afq0gk+nEjdsx2dHQAwPAAkK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fe6a7e0-69c1-4e79-f2b7-08dda72f7348
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 08:27:19.7601
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eYurvA6+xX+05yaqX3Yd4sYE+FyqN1stKM4onkt8RVU1oNjMuz8Q50rs0j3hGJXhUVcOn7/q+JiDPylCMKoQbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9211

Hi Michal,

On 09/06/2025 08:41, Orzel, Michal wrote:
>
> On 06/06/2025 18:48, Ayan Kumar Halder wrote:
>> Modify Arm32 assembly boot code to reset any unused MPU region, initialise
>> 'max_mpu_regions' with the number of supported MPU regions and set/clear the
>> bitmap 'xen_mpumap_mask' used to track the enabled regions.
>>
>> Use the macro definition for "dcache_line_size" from linux.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>> Changes from v1 :-
>>
>> 1. Introduce cache.S to hold arm32 cache initialization instructions.
>>
>> 2. Use dcache_line_size macro definition from linux.
>>
>> 3. Use mov_w instead of ldr.
>>
>> 4. Use a single stm instruction for 'store_pair' macro definition.
>>
>>   xen/arch/arm/arm32/Makefile              |  1 +
>>   xen/arch/arm/arm32/asm-offsets.c         |  6 ++++
>>   xen/arch/arm/arm32/cache.S               | 41 ++++++++++++++++++++++++
>>   xen/arch/arm/arm32/mpu/head.S            | 25 +++++++++++++++
>>   xen/arch/arm/include/asm/mpu/regions.inc |  2 +-
>>   5 files changed, 74 insertions(+), 1 deletion(-)
>>   create mode 100644 xen/arch/arm/arm32/cache.S
>>
>> diff --git a/xen/arch/arm/arm32/Makefile b/xen/arch/arm/arm32/Makefile
>> index 537969d753..531168f58a 100644
>> --- a/xen/arch/arm/arm32/Makefile
>> +++ b/xen/arch/arm/arm32/Makefile
>> @@ -2,6 +2,7 @@ obj-y += lib/
>>   obj-$(CONFIG_MMU) += mmu/
>>   obj-$(CONFIG_MPU) += mpu/
>>   
>> +obj-y += cache.o
>>   obj-$(CONFIG_EARLY_PRINTK) += debug.o
>>   obj-y += domctl.o
>>   obj-y += domain.o
>> diff --git a/xen/arch/arm/arm32/asm-offsets.c b/xen/arch/arm/arm32/asm-offsets.c
>> index 8bbb0f938e..c203ce269d 100644
>> --- a/xen/arch/arm/arm32/asm-offsets.c
>> +++ b/xen/arch/arm/arm32/asm-offsets.c
>> @@ -75,6 +75,12 @@ void __dummy__(void)
>>   
>>      OFFSET(INITINFO_stack, struct init_info, stack);
>>      BLANK();
>> +
>> +#ifdef CONFIG_MPU
>> +   DEFINE(XEN_MPUMAP_MASK_sizeof, sizeof(xen_mpumap_mask));
>> +   DEFINE(XEN_MPUMAP_sizeof, sizeof(xen_mpumap));
>> +   BLANK();
>> +#endif
>>   }
>>   
>>   /*
>> diff --git a/xen/arch/arm/arm32/cache.S b/xen/arch/arm/arm32/cache.S
>> new file mode 100644
>> index 0000000000..00ea390ce4
>> --- /dev/null
>> +++ b/xen/arch/arm/arm32/cache.S
>> @@ -0,0 +1,41 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/* Cache maintenance */
>> +
>> +#include <asm/arm32/sysregs.h>
>> +
>> +/* dcache_line_size - get the minimum D-cache line size from the CTR register */
>> +    .macro  dcache_line_size, reg, tmp
>> +    mrc p15, 0, \tmp, c0, c0, 1     /* read ctr */
> Why open coding macro CTR? Especially if below you use DCIMVAC.
>
>> +    lsr \tmp, \tmp, #16
>> +    and \tmp, \tmp, #0xf            /* cache line size encoding */
>> +    mov \reg, #4                    /* bytes per word */
>> +    mov \reg, \reg, lsl \tmp        /* actual cache line size */
>> +    .endm
>> +
>> +/*
>> + * __invalidate_dcache_area(addr, size)
>> + *
>> + * Ensure that the data held in the cache for the buffer is invalidated.
>> + *
>> + * - addr - start address of the buffer
>> + * - size - size of the buffer
>> + */
> I do think that for new functions in assembly we should write what registers are
> clobbered. Arm64 cache.S originated from Linux, hence it lacks this information.
>
>> +FUNC(__invalidate_dcache_area)
>> +    dcache_line_size r2, r3
>> +    add   r1, r0, r1
>> +    sub   r3, r2, #1
>> +    bic   r0, r0, r3
>> +1:  mcr   CP32(r0, DCIMVAC)     /* invalidate D line / unified line */
>> +    add   r0, r0, r2
>> +    cmp   r0, r1
>> +    blo   1b
>> +    dsb   sy
>> +    ret
>> +END(__invalidate_dcache_area)
>> +
>> +/*
>> + * Local variables:
>> + * mode: ASM
>> + * indent-tabs-mode: nil
>> + * End:
>> + */
>> diff --git a/xen/arch/arm/arm32/mpu/head.S b/xen/arch/arm/arm32/mpu/head.S
>> index b2c5245e51..435b140d09 100644
>> --- a/xen/arch/arm/arm32/mpu/head.S
>> +++ b/xen/arch/arm/arm32/mpu/head.S
>> @@ -49,6 +49,10 @@ FUNC(enable_boot_cpu_mm)
>>       mrc   CP32(r5, MPUIR_EL2)
>>       and   r5, r5, #NUM_MPU_REGIONS_MASK
>>   
>> +    mov_w   r0, max_mpu_regions
>> +    str   r5, [r0]
>> +    mcr   CP32(r0, DCIMVAC) /* Invalidate cache for max_mpu_regions addr */
>> +
>>       /* x0: region sel */
>>       mov   r0, #0
>>       /* Xen text section. */
>> @@ -83,6 +87,27 @@ FUNC(enable_boot_cpu_mm)
>>       prepare_xen_region r0, r1, r2, r3, r4, r5, attr_prbar=REGION_DEVICE_PRBAR, attr_prlar=REGION_DEVICE_PRLAR
>>   #endif
>>   
>> +zero_mpu:
>> +    /* Reset remaining MPU regions */
>> +    cmp   r0, r5
>> +    beq   out_zero_mpu
>> +    mov   r1, #0
>> +    mov   r2, #1
>> +    prepare_xen_region r0, r1, r2, r3, r4, r5, attr_prlar=REGION_DISABLED_PRLAR
>> +    b     zero_mpu
>> +
>> +out_zero_mpu:
>> +    /* Invalidate data cache for MPU data structures */
>> +    mov r4, lr
>> +    mov_w r0, xen_mpumap_mask
>> +    mov r1, #XEN_MPUMAP_MASK_sizeof
>> +    bl __invalidate_dcache_area
>> +
>> +    ldr r0, =xen_mpumap
>> +    mov r1, #XEN_MPUMAP_sizeof
>> +    bl __invalidate_dcache_area
>> +    mov lr, r4
>> +
>>       b    enable_mpu
>>   END(enable_boot_cpu_mm)
>>   
>> diff --git a/xen/arch/arm/include/asm/mpu/regions.inc b/xen/arch/arm/include/asm/mpu/regions.inc
>> index 6b8c233e6c..631b0b2b86 100644
>> --- a/xen/arch/arm/include/asm/mpu/regions.inc
>> +++ b/xen/arch/arm/include/asm/mpu/regions.inc
>> @@ -24,7 +24,7 @@
>>   #define XEN_MPUMAP_ENTRY_SHIFT  0x3     /* 8 byte structure */
>>   
>>   .macro store_pair reg1, reg2, dst
>> -    .word 0xe7f000f0                    /* unimplemented */
>> +    stm \dst, {\reg1, \reg2}  /* reg2 should be a higher register than reg1 */
> Didn't we agree not to use STM (I suggested it but then Julien pointed out that
> it's use in macro might not be the best)?

Ah my last response was not sent.

I realized that I cannot use strd due to the following error

Error: first transfer register must be even -- `strd r3,r4,[r1]'

So,  I am using stm with the following comment

stm \dst, {\reg1, \reg2}  /* reg2 should be a higher register than reg1 */

- Ayan

>
> ~Michal
>

