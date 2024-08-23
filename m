Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C2D95CBA5
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2024 13:44:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.782302.1191785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shSgz-0007rR-4z; Fri, 23 Aug 2024 11:42:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 782302.1191785; Fri, 23 Aug 2024 11:42:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shSgz-0007pm-1B; Fri, 23 Aug 2024 11:42:57 +0000
Received: by outflank-mailman (input) for mailman id 782302;
 Fri, 23 Aug 2024 11:42:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4lC7=PW=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1shSgx-0007pg-Fd
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2024 11:42:55 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20631.outbound.protection.outlook.com
 [2a01:111:f403:2414::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d3f77015-6144-11ef-a50a-bb4a2ccca743;
 Fri, 23 Aug 2024 13:42:53 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by DS0PR12MB7771.namprd12.prod.outlook.com (2603:10b6:8:138::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Fri, 23 Aug
 2024 11:42:47 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%4]) with mapi id 15.20.7875.023; Fri, 23 Aug 2024
 11:42:46 +0000
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
X-Inumbo-ID: d3f77015-6144-11ef-a50a-bb4a2ccca743
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rm/80w8FfVXmw9V5Uwe9pizXgd2KddC568uxBVqrwKQQLAANDPV6joyUgJXYQcMV41mx1H+s4+4GTNujF4ysXhRKo+VFh28BcXOZ3AF4hS5m4NogT5Dz3ggx6+bbn23HUdjVUgJXcwIDCUu7kWhPJlWJ2iCqFY8FvpDa0sizNCjPm1iDvFXyA9nnWR4+YuZ6YJtwkEZe3ab0pqcN3KIgQd2p2XbLJn70TBkHNjJ09zTZaDJSdiqoSsMCF4etdjiPiSICui4Vkoh3C/JL2tX2QABv9JTPcVSn8nrqpkJSiK0lJHugpLNn9UsXcAh3zppNtK8+pyYDoiD+7SD/TbZ5rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zoOE+S29eVQUYBfKLodTrARv6z5AIm1FN0CHYl+1uIQ=;
 b=u4IMbNLvBOg51ER1xsWd5SYs9ZyOKGjkarq5dOaOnG2yBrwN4Y0eQFMl0mswR9gbUPIsrV3CZ+58JYyO41y9AjIFQa1zUgRRI7sfjC8ZmPXlmAqO+2fGZ6zUnKGZGkeS+mr9XqRUOSCZAPuRNFhso3swXyAfg8JgQ5sfN5frDZ9tpI1xiWEJTRDalGt9dgxKzkdH7SoRdwxfiKaqlKTGAxwQWFbBVwPSS65I3h7mQ0q1yUd+r+dmW2XCvuxtyYKDVqwEiOurJ6FM8lP68+0nrODAEKYz/J6+WTHEifSntj3mRpApPJlsb8vzpInt1AngB1VUAkLMFoDinQPrPhYQow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zoOE+S29eVQUYBfKLodTrARv6z5AIm1FN0CHYl+1uIQ=;
 b=syZxXB9JH9GmJ0v1R1zX8KQ1ai/GghvVLCTD+MGts2xSnTQoyhcKZQTE9Iemhn0l+c/KQodZBZsizPBzejs3/aTR4BWWhWhFuXnIOaNN33fo+Q+653LJovLE/uZS2pAUjjRvg/fXubbNEojDRoVcAAIiwDa9rXLw056Cz83mh84=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <d5e97cae-fc6d-4913-88ca-47ecb157752c@amd.com>
Date: Fri, 23 Aug 2024 12:42:42 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: fusa: Add requirements for generic timer
Content-Language: en-GB
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Michal Orzel <michal.orzel@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Artem Mygaiev <artem_mygaiev@epam.com>
References: <20240820103816.1661102-1-ayan.kumar.halder@amd.com>
 <5F0AF572-3437-4372-96EB-42F46B3A3155@arm.com>
 <101a7105-5638-4c69-a5b0-29c252284aea@amd.com>
 <D3358591-F9E2-44A6-A22A-FC2AA8857C68@arm.com>
 <alpine.DEB.2.22.394.2408221327400.3871186@ubuntu-linux-20-04-desktop>
 <9DA45539-F136-40D8-BF46-E63EA1B8ADA6@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <9DA45539-F136-40D8-BF46-E63EA1B8ADA6@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0436.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::9) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|DS0PR12MB7771:EE_
X-MS-Office365-Filtering-Correlation-Id: 26f11be7-f19f-4511-4742-08dcc368b575
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z08xNjREdDdHZGlvRUNWSGJqUWl1QllpSUFLS2cvT1ZaQ3R3UncvQy9FQnlz?=
 =?utf-8?B?Z3QyVFdHQVZMWkd6K0JrVlJiVFlWUjVMb0lsYmF0Umdud3VaeUdZUXp5clha?=
 =?utf-8?B?WisyS085RURtL0ZsTU83TnFGRVBSbzRoMGlTWU1OUnhFUWNQN09xemwrenRx?=
 =?utf-8?B?YTN3UTlxWjZ0RTE4UllzcUUyN3RsNExYRmNTenlvb2tEVWh6TkRkZFptdFpt?=
 =?utf-8?B?OGdEVmVjSjc2N3A2RS8wSHBpa1BNc0F4NERYZjNMVmYrQmxJOStRaGV6LzMr?=
 =?utf-8?B?UnI2Z2lxV1hnRHBsaDdjay81dDhzUTJyendrRy9TYWEvblJDM1FTTWNzTlBq?=
 =?utf-8?B?MmxJc2RVQmhoN2NNdU5IY3N0NEdhaVRsOFJudHUrWHNmVWRPYWRQZm01ZjBP?=
 =?utf-8?B?d2cvQkgrSktPalYwVjVFdFh1L2N6a2dPVzh3REFRQVVXVlA5ekR5UGJxUDFM?=
 =?utf-8?B?VmIrRlNjbmx3dnE1THNKVUdFa0MzMGVhRTU0TTVrZkNobkFoa044Q2tqVkhY?=
 =?utf-8?B?ak5GV1VaUVRYR0pSbGtzdk00ZTFMOWVFQmFWMi9OcFQwcDl6VUJPTmw1Y080?=
 =?utf-8?B?ejN5S2NlOGFxRUd3WE5VajlIcGFsN3h1L0xVeWtVdHpXRlNRT2prQzZMenlB?=
 =?utf-8?B?bWladHFkYy9kTjB6NGFCcUJCUGhBZ0pPeG1INURLbGhkOE0xNmRBVGhWSGNu?=
 =?utf-8?B?TlZhY3N5MEwrNmJOWkI2Y01EbitqVW9Vc3lYT1kvYWhoR1pZS0p5MUY1ZzRU?=
 =?utf-8?B?b09jTmNUNU5rOVYzWUYyYlNyV1FaS0FCUktCSklwUG5BaFNFcStSUFYzQ282?=
 =?utf-8?B?Z1VUTitmUk5HSG41ZGxYWHllNDU2cTBhWXNpUTlOQSt5MGR3Smd2Q1J0VmpQ?=
 =?utf-8?B?N29Gc2lyOFVxYnpjbkoyaXNkZ0lRbnJKU0dOU2JLdnBJM3YrTkNqS0lxK2VM?=
 =?utf-8?B?VWtpR2RVenJjUmZEMFpGWk1mMko1aG9LWVRGYi9LZG5wdkZ4aHpIUWc2Y1lB?=
 =?utf-8?B?VHBHNFRxZmVqcExhSEVETEwwdFdiSjdkbEdHU1dSbzJvR2x1aXlLbzhCdHVu?=
 =?utf-8?B?eGd1TGhXaFFVZ3ZMWnZudE53RE1MVCtFa3JDRVdBc2RQY1pLcDBQSHMvZ3lC?=
 =?utf-8?B?MGxCTmdyakpwd1J6aGU1S0UzU292WG9CS3h6ZytHWVZBRDh4VnplMURTYmNw?=
 =?utf-8?B?dkEyOERkeDF3WmRrYVpuNXZrTXpiUnlNZ1ZPVzBvSUsyVWdyRHpuWUplZEhW?=
 =?utf-8?B?YWZyWGhVZ21XR0RYYzcyQWJ4NmpvNmRWbi8vVHJKeTRUcmdwU2ZNbE9JUjBj?=
 =?utf-8?B?NEdSWTdpY2QvNmdoSVpyZXZUMkl5cVN2cWtzZWV2TTRsQ1NwZDhXQVZnRndC?=
 =?utf-8?B?R2Vvc1FXdVZFc245UzRlOG5ELzBFbFJNa0pzSFZjVTFrKzI0Wmc2ZjlXcmJu?=
 =?utf-8?B?M0FGY3ZnS2hLbVNkdk5jaGN0aXJOVGl1TWMwOWQyditsdE5pdkFPSVdtdXNM?=
 =?utf-8?B?cXZ6ZE45OHBERUNzOFlBNUkyYy9obVdxeC9SQXpMODdiYmlpZXFjNTM3Y0xJ?=
 =?utf-8?B?SWR3UERFWWRDSFE2K3ZHT0tLZ3RpcVA3V3d3QXRGemEwenlyeWtITndDR2dp?=
 =?utf-8?B?cnF1amhzWmJxajNwekJPV3VzejNSU0cxWlg0TDdtdFVIYXo5bWlFQUl5ai9w?=
 =?utf-8?B?U3A0U3ltVEtGZE5BYlV3cUpMV283aytWZE8yclgvMnk3SXZLZGR0TVhNZnZW?=
 =?utf-8?B?MVNUdnpPMlBXNW90RmdYbk9uQ0prYm9rdGtDdWJpTUR4Yys0ek8vMHBkWmhN?=
 =?utf-8?Q?iKfxYqScnI3cr1rHIokDppAucmIzRT/oQcZ/M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RzlhUlMvYUtBa0tCOXVmNW91Z1VlMk90a3VOVnJDNlhkSjlRNjFBbW80OHBC?=
 =?utf-8?B?cm9abUoybncveis4U1BhQk1OdVNrdW5TcWtNYURKTTRuemlHSVc1eXY2YUQ1?=
 =?utf-8?B?TWUxQlMvZmZoRjdOLzhFRWV6RU9SV1VtK0djaElNQmdSTkJRT0djUVdXNEMw?=
 =?utf-8?B?bTBUclM5bFhQb3F1R2lwR3RnK3ZnQVZHWEUrZDhWai9NT05uVkE2OUVJcEhH?=
 =?utf-8?B?ZFBhbnI5cC9HMmZmb1BOU0xES3MwOUtaV1VLRnFabG9vbVBUMzZOUGMvbEZh?=
 =?utf-8?B?VmVwMVJ4L0dvb09PcjhvWGN5emFvZzdSZ3p6Vk11OUl6VDBySG1IdEVvdS9k?=
 =?utf-8?B?dzlTOEg4Vm9pR01YaC9Va2NYTWZXRWdHUG15aHFUMnpmYnErQkMwN0M1QWVK?=
 =?utf-8?B?b1JkUGhYVHQ4eDcweUhYbDlSdmdUbHJOWkNScDFpTEdxclJnZ3BaLzBEREtR?=
 =?utf-8?B?TmtyZU5DdUhRYkVGWG11dm9qYXFJRENUTk5rZ0FYTGtzZDFtNjc4VmNZdk1n?=
 =?utf-8?B?ZFkrQ2JKTE8yM1VYeUY5aWlvMVFxZGNTNjZ0RUFwUWVkdHRoK2FVWU1OTEM4?=
 =?utf-8?B?bTlxd0FoK29IeUVUcWlFdDVPaDRIb1RkVEJiOU5YVkdVbWNHbG0vQkJlenlT?=
 =?utf-8?B?aFVjUmRhbVZUUW5rQTlPL1A2QnY3dVhtNUZhMnRlQ3h1WW1Za0JwN0ZMZ1lo?=
 =?utf-8?B?eUdqNnUyMU40VTBLcmdyaFhra1NHTzdNMmthdUxSdU8xWDBuVUQzM2xQN2lp?=
 =?utf-8?B?RktFZDhMdllCbnVOUGFHZSthanZDYUJnbWhGU3F4UndIcnZsWUpSUnN1eXBH?=
 =?utf-8?B?L2ozVWw3UllSbWZEWnhxNmhnRTFKMmdsVWllMmRDMEg2S0p0VW93ZlpUb2Jy?=
 =?utf-8?B?dFJLRkNJMyt5bEN3VU9xVHRPSVF1TkFuV0hoSDE4cUFOQ25yNXJBTXdTTmc2?=
 =?utf-8?B?UzdZa3VhR2lrMzFxREYxbldpOXN6ZjNnS1F0ZE9KWXRsN0hZbWJxMDVpRS95?=
 =?utf-8?B?YTN6c1VvczZXVUs1ZXJQMVh6bUNiMmJRL2NRWkllRkExL3N0VHMvT3NkRFB5?=
 =?utf-8?B?OHVRYW5tK2tJR0N6UjFrcG4wcVRmN0Q5d29tTGk5ekNLV3ZycGw3bXFjN1I2?=
 =?utf-8?B?VUtDc2hpUklESUwxNE9tRFhUVDQyWWtFVUNDbnR3OUZCZHkvdVI5bjVWYjNF?=
 =?utf-8?B?WUhUeW9qaEh4c2YvLzJDUW1YNlFxaGl4NVExQ0JKeUNFa3RUR3d6UFliY2pz?=
 =?utf-8?B?em1sTFNuTUlkR3h3RE1NODdUU3M3ZW1UcFhMVkJiT2NFTXljMkduTHhCNjcr?=
 =?utf-8?B?RkUvS2ltdFQzbTRkaHVyZXZaMDhzYnU4ZlRSZEFkSHFqa0RtelZSYjVjblUv?=
 =?utf-8?B?QlhXTjQzd2V0TkorZ0dTS1lKZSt1WFVUa2hXbTNrbWkrL2lVa3RKWm9NMkda?=
 =?utf-8?B?aDl1OVEyNHJXQWZadk5nUWh0bHpqQzFkTk1CQktkY3pxYTg4SkdDUUhUSzNv?=
 =?utf-8?B?UUcvT3BNYlVDTi9UQkhiVkNJb1RVOTBacjBVKzNpTjBoV0dMM1VIR2VXdjFT?=
 =?utf-8?B?YlROTmJValhMSVJnN3RKRmJSUWdqLzBtOU5nV05BQ2xQUHRyUDNCRnRCVEFz?=
 =?utf-8?B?ZnYvbkFSTnROMldZR1ozTVdnRm1JVEtvMFlOMUVMbEpOS1hpYW1YZVpZZUJx?=
 =?utf-8?B?SDRCT3J1SDNIMXN0dDBMSXlkclJtek8xSUwrVVNRQUhUb2M3Q0FVcndpVlJL?=
 =?utf-8?B?dXlaZzZzUjNLajc2TFlkdGpObUwzREdKaGhncVFoWmRuTitIWk1KN2RUV3NM?=
 =?utf-8?B?YVZTUXB0eEswRWhrK3pVa211aHMwY1BZY29DVmh6N0JnVng2WTIrSEpFRlBz?=
 =?utf-8?B?QVdZYlhkczBpcUM5dndrMlY2cnhGRFF2VEJZTU1mRUxHL0ZsWUl5bTgrVktt?=
 =?utf-8?B?R280bG9oU2tFNlczalRacUJkdVRXZmdTY1dPeHJxTFQ5WHpjMEZNeWpZczFl?=
 =?utf-8?B?QjNWeGNkYU9WR3BaOWFVMmVycHZHSXFlaUtGVXEzNDZlU0txR2xqcVpXU1lD?=
 =?utf-8?B?S0lYR1BnOEpOcW8zQk1pbFNYdGJtZHNKZ2FOb2FsTXE0dkovcTdSM2w4cFVB?=
 =?utf-8?Q?ny+Yd/0b/Zghi63FH2uAUdtCi?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26f11be7-f19f-4511-4742-08dcc368b575
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 11:42:46.8967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K+jaHwkRFhuSjiO22l3dOoiBCzXjzl/1QH05PF6XiyNkTQGLuHERs1lTzRn+qUe6WcF2XWaIBA7WYQayEAB2Hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7771

Hi Bertrand/Stefano/Michal,

On 23/08/2024 08:22, Bertrand Marquis wrote:
> Hi Stefano,
>
>> On 22 Aug 2024, at 22:29, Stefano Stabellini <sstabellini@kernel.org> wrote:
>>
>> On Thu, 21 Aug 2024, Bertrand Marquis wrote:
>>>> On 22 Aug 2024, at 11:00, Michal Orzel <michal.orzel@amd.com> wrote:
>>>>
>>>> Hi Bertrand,
>>>>
>>>> I agree with all your comments with a few exceptions, as stated below.
>>>>
>>>> On 21/08/2024 17:06, Bertrand Marquis wrote:
>>>>>
>>>>> Hi Ayan,
>>>>>
>>>>>> On 20 Aug 2024, at 12:38, Ayan Kumar Halder <ayan.kumar.halder@amd.com> wrote:
>>>>>>
>>>>>> From: Michal Orzel <michal.orzel@amd.com>
>>>>>>
>>>>>> Add the requirements for the use of generic timer by a domain
>>>>>>
>>>>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>>>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>>>>> ---
>>>>>> .../reqs/design-reqs/arm64/generic-timer.rst  | 139 ++++++++++++++++++
>>>>>> docs/fusa/reqs/index.rst                      |   3 +
>>>>>> docs/fusa/reqs/intro.rst                      |   3 +-
>>>>>> docs/fusa/reqs/market-reqs/reqs.rst           |  34 +++++
>>>>>> docs/fusa/reqs/product-reqs/arm64/reqs.rst    |  24 +++
>>>>>> 5 files changed, 202 insertions(+), 1 deletion(-)
>>>>>> create mode 100644 docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
>>>>>> create mode 100644 docs/fusa/reqs/market-reqs/reqs.rst
>>>>>> create mode 100644 docs/fusa/reqs/product-reqs/arm64/reqs.rst
>>>>>>
>>>>>> diff --git a/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst b/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
>>>>>> new file mode 100644
>>>>>> index 0000000000..bdd4fbf696
>>>>>> --- /dev/null
>>>>>> +++ b/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
>>>>>> @@ -0,0 +1,139 @@
>>>>>> +.. SPDX-License-Identifier: CC-BY-4.0
>>>>>> +
>>>>>> +Generic Timer
>>>>>> +=============
>>>>>> +
>>>>>> +The following are the requirements related to ARM Generic Timer [1] interface
>>>>>> +exposed by Xen to Arm64 domains.
>>>>>> +
>>>>>> +Probe the Generic Timer device tree node from a domain
>>>>>> +------------------------------------------------------
>>>>>> +
>>>>>> +`XenSwdgn~arm64_generic_timer_probe_dt~1`
>>>>>> +
>>>>>> +Description:
>>>>>> +Xen shall generate a device tree node for the Generic Timer (in accordance to
>>>>>> +ARM architected timer device tree binding [2]).
>>>>> You might want to say where here. The domain device tree ?
>>>>>
>>>>>> +
>>>>>> +Rationale:
>>>>>> +
>>>>>> +Comments:
>>>>>> +Domains shall probe the Generic Timer device tree node.
>>>>> Please prevent the use of "shall" here. I would use "can".
>>>>> Also detect the presence of might be better than probe.
>>>>>
>>>>>> +
>>>>>> +Covers:
>>>>>> + - `XenProd~emulated_timer~1`
>>>>>> +
>>>>>> +Read system counter frequency
>>>>>> +-----------------------------
>>>>>> +
>>>>>> +`XenSwdgn~arm64_generic_timer_read_freq~1`
>>>>>> +
>>>>>> +Description:
>>>>>> +Xen shall expose the frequency of the system counter to the domains.
>>>>> The requirement would need to say in CNTFRQ_EL0 and in the domain device tree xxx entry.
>>>>>
>>>>>> +
>>>>>> +Rationale:
>>>>>> +
>>>>>> +Comments:
>>>>>> +Domains shall read it via CNTFRQ_EL0 register or "clock-frequency" device tree
>>>>>> +property.
>>>>> I do not think this comment is needed.
>>>>>
>>>>>> +
>>>>>> +Covers:
>>>>>> + - `XenProd~emulated_timer~1`
>>>>>> +
>>>>>> +Access CNTKCTL_EL1 system register from a domain
>>>>>> +------------------------------------------------
>>>>>> +
>>>>>> +`XenSwdgn~arm64_generic_timer_access_cntkctlel1~1`
>>>>>> +
>>>>>> +Description:
>>>>>> +Xen shall expose counter-timer kernel control register to the domains.
>>>>> "counter-timer kernel" is a bit odd here, is it the name from arm arm ?
>>>>> Generic Timer control registers ? or directly the register name.
>>>> This is the name from Arm ARM. See e.g.:
>>>> https://developer.arm.com/documentation/ddi0601/2023-12/AArch64-Registers/CNTKCTL-EL1--Counter-timer-Kernel-Control-Register?lang=en
>>> Right then i would use the same upper cases: Counter-timer Kernel Control
>>> register and still mention CNTKCTL_EL1 as it would be clearer.
>>>
>>>>>> +
>>>>>> +Rationale:
>>>>>> +
>>>>>> +Comments:
>>>>>> +Domains shall access the counter-timer kernel control register to allow
>>>>>> +controlling the access to the timer from userspace (EL0).
>>>>> This is documented in the arm arm, this comment is not needed.
>>>>>
>>>>>> +
>>>>>> +Covers:
>>>>>> + - `XenProd~emulated_timer~1`
>>>>>> +
>>>>>> +Access virtual timer from a domain
>>>>>> +----------------------------------
>>>>>> +
>>>>>> +`XenSwdgn~arm64_generic_timer_access_virtual_timer~1`
>>>>>> +
>>>>>> +Description:
>>>>>> +Xen shall expose the virtual timer registers to the domains.
>>>>>> +
>>>>>> +Rationale:
>>>>>> +
>>>>>> +Comments:
>>>>>> +Domains shall access and make use of the virtual timer by accessing the
>>>>>> +following system registers:
>>>>>> +CNTVCT_EL0,
>>>>>> +CNTV_CTL_EL0,
>>>>>> +CNTV_CVAL_EL0,
>>>>>> +CNTV_TVAL_EL0.
>>>>> The requirement to be complete should give this list, not the comment.
>>>>>
>>>>>> +
>>>>>> +Covers:
>>>>>> + - `XenProd~emulated_timer~1`
>>>>>> +
>>>>>> +Access physical timer from a domain
>>>>>> +-----------------------------------
>>>>>> +
>>>>>> +`XenSwdgn~arm64_generic_timer_access_physical_timer~1`
>>>>>> +
>>>>>> +Description:
>>>>>> +Xen shall expose physical timer registers to the domains.
>>>>>> +
>>>>>> +Rationale:
>>>>>> +
>>>>>> +Comments:
>>>>>> +Domains shall access and make use of the physical timer by accessing the
>>>>>> +following system registers:
>>>>>> +CNTPCT_EL0,
>>>>>> +CNTP_CTL_EL0,
>>>>>> +CNTP_CVAL_EL0,
>>>>>> +CNTP_TVAL_EL0.
>>>>> same as upper
>>>>>
>>>>>> +
>>>>>> +Covers:
>>>>>> + - `XenProd~emulated_timer~1`
>>>>>> +
>>>>>> +Trigger the virtual timer interrupt from a domain
>>>>>> +-------------------------------------------------
>>>>>> +
>>>>>> +`XenSwdgn~arm64_generic_timer_trigger_virtual_interrupt~1`
>>>>>> +
>>>>>> +Description:
>>>>>> +Xen shall enable the domains to program the virtual timer to generate the
>>>>>> +interrupt.
>>>>> I am not sure this is right here.
>>>>> You gave access to the registers upper so Xen responsibility is not really to
>>>>> enable anything but rather make sure that it generates an interrupt according to
>>>>> how the registers have been programmed.
>>>> I'm in two minds about it. On one hand you're right and the IRQ trigger is a side-effect
>>>> of programming the registers correctly. On the other, these are design requirements which
>>>> according to "fusa/reqs/intro.rst" describe what SW implementation is doing. Our way of injecting
>>>> timer IRQs into guests is a bit different (phys timer is fully emulated and we use internal timers
>>>> and for virt timer we first route IRQ to Xen, mask the IRQ and inject to guest). If I were to write
>>>> tests to cover Generic Timer requirements I'd expect to cover whether r.g. masking/unmasking IRQ works,
>>>> whether IRQ was received, etc.
>>> This is true but i think it would be more logic in non design requirements to
>>> phrase things to explain the domain point of view rather than how it is implemented.
>>>
>>> Here the point is to have a timer fully functional from guest point of view, including
>>> getting interrupts when the timer should generate one.
>>>
>>> Maybe something like: Xen shall generate timer interrupts to domains when the timer condition asserts.
>> Both statements are correct.
>>
>> Michal's original statement "Xen shall enable the domains to program the
>> virtual timer to generate the interrupt" is correct. The timer interrupt
>> will be generated by the hardware to Xen, if the guest programs the
>> registers correctly. If Xen does nothing, the interrupt is still
>> generated and received by Xen.
>>
>> Bertrand's statement is also correct. Xen needs to generate a virtual
>> timer interrupt equivalent to the physical timer interrupt, after
>> receiving the physical interrupt.
>>
>> I think the best statement would be a mix of the two, something like:
>>
>> Xen shall enable the domain to program the virtual timer to generate
>> the interrupt, which Xen shall inject as virtual interrupt into the
>> domain.
> This should be split into 2 reqs (2 shall) and the second one might in
> fact be a generic one for interrupt injections into guests.

I agree with you that the second statement shall be a requirement for 
vGIC (as it has nothing to do with the timer).

So, do we agree that the requirements should be

1. Xen shall generate physical timer interrupts to domains when the 
physical timer condition is met.

2. Xen shall generate virtual timer interrupts to domains when the 
virtual timer condition is met.

The important thing here is that Xen can generate both physical timer 
and virtual timer IRQs. It is left to the guests to use one or both.

We can drop the comments here if it is causing confusion.

Let me know your thoughts.

- Ayan


