Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD18B037F6
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jul 2025 09:28:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1042616.1412692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubDc6-000731-Qc; Mon, 14 Jul 2025 07:28:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1042616.1412692; Mon, 14 Jul 2025 07:28:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubDc6-000700-Mg; Mon, 14 Jul 2025 07:28:38 +0000
Received: by outflank-mailman (input) for mailman id 1042616;
 Mon, 14 Jul 2025 07:28:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LaQv=Z3=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ubDc5-0006vU-05
 for xen-devel@lists.xenproject.org; Mon, 14 Jul 2025 07:28:37 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2009::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2637bfcf-6084-11f0-b894-0df219b8e170;
 Mon, 14 Jul 2025 09:28:35 +0200 (CEST)
Received: from DM4PR12MB5277.namprd12.prod.outlook.com (2603:10b6:5:390::7) by
 IA1PR12MB8540.namprd12.prod.outlook.com (2603:10b6:208:454::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Mon, 14 Jul
 2025 07:28:31 +0000
Received: from DM4PR12MB5277.namprd12.prod.outlook.com
 ([fe80::9ab:5367:ba51:af6e]) by DM4PR12MB5277.namprd12.prod.outlook.com
 ([fe80::9ab:5367:ba51:af6e%5]) with mapi id 15.20.8922.028; Mon, 14 Jul 2025
 07:28:31 +0000
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
X-Inumbo-ID: 2637bfcf-6084-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tm1taA4flOUFZPLF0DEvSSa3r7lOtkp9k2zPc0O3ImhDJaJDYQaRcYbKLndByWxV91VLa7p76SH1tRXxTNRn1hf/xymQH/BHK5460gXoidLaZIjo6I7LD9G1dEIhARcY9onIhXFP/A0j7GXRoYPS0oGpC4ZMyGATrscRDO73wM6h9cgJ7i3/mAx8IVz4BWoQF0UHB9ri9SFJ/VeOkM5MS7gEyRMWzEyxJtjEg5jX/9Uk5j01HyVqRMdSh4mRymd+1+0AUOGCFmcOwmaUepRh/WdEhgX7Td8cVqZEHGASvn4UAG55bPldThXGwFKK7cBaqJO532z6Sk1YEu2wnBJMvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ruDFhsPulm5nFfYNF3UUrm4Yw2mA+sUFH+XoZaOin0=;
 b=yi26IE4+awYXZHSc5a7k/nUJY4kTH5+33u7/CiLgc27H34LcL/cj07Jf581hMVHP7x9IIUh5J6+DVm5GkiVmcl5RTEhELguaZzuDhM+EeXyKQRGyaWfbAtZTqlglUB51EzgEMhXhvZJrwZ54WWbaKhX0czXMOyAYfrYotQLjNGg/FM10aoHQ1XI4OESLe4ilxY60HXlgbGgKnDx0lK4rXrkS3S8+Db2n+1L4uwHs5QkwyTdAoq4YVDCQEZZdQxK2Gp8YgPAzyFIDxEWipjF9Rw6zX7Qg3tkqyHAijMMUO5R+HqmJ1drcktSEo9dd2c3UkoJ8uLu3MSnwP3dnh9o0Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ruDFhsPulm5nFfYNF3UUrm4Yw2mA+sUFH+XoZaOin0=;
 b=hwYDoH2GRVtd8im33KRIdM1wcZZPKS7BKxy0r3rqzevCJLlF74ZZ0sdqwRWsYUUkzeB+pyhEc19F22Q6WHneqif5MjHdziesfo3Aod7KwTuZ74gLAPd36rhx3fYDlz/1kTvOqOpK0BDywDi854a8ntI2V0c7nohET8vIx4tUl80=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <5a2e988e-73b3-44ed-94df-da3088b561c0@amd.com>
Date: Mon, 14 Jul 2025 09:28:26 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] arm/mpu: Populate a new region in Xen MPU mapping
 table
To: Hari Limaye <Hari.Limaye@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Luca Fancellu <Luca.Fancellu@arm.com>, Penny Zheng <Penny.Zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <Wei.Chen@arm.com>
References: <cover.1751464757.git.hari.limaye@arm.com>
 <5b67459af62106197fb551d35ef1708f0bb5beb6.1751464757.git.hari.limaye@arm.com>
 <93fd423e-b104-4679-8b50-69b982ae14a4@amd.com>
 <0A1A20B1-6F67-4D64-BC56-C68EC2AC46A4@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <0A1A20B1-6F67-4D64-BC56-C68EC2AC46A4@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0075.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::20) To DM4PR12MB5277.namprd12.prod.outlook.com
 (2603:10b6:5:390::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5277:EE_|IA1PR12MB8540:EE_
X-MS-Office365-Filtering-Correlation-Id: 662b88b1-758a-4cf0-dfd1-08ddc2a808bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WVVLQW51aFErREp4Z1UwZmJ6Z0syTUsrYnZFTnhsR3FXUHdNSnlReEIvZnZz?=
 =?utf-8?B?ZmYzWCtSSGFzbk00cjM1WHN3RytCeXBJVVJnNGd5eGRnY3ZmMDBBWHQyakJE?=
 =?utf-8?B?ZnFYekcybkVOUGtyUlBKVjBybjZScEJDeDRUOTloOGMwOUpqZ2NWZnZjQXMr?=
 =?utf-8?B?aGNCUVd4VnZHeHpmaHE4ai85LzdRaGlNd1l5RDB3VXRmejZsc1JQUWVlZVh6?=
 =?utf-8?B?anlubEhiVy9lWTYzd2VLQlkvK1UvL0NhQyt0STdEWmpINENDbGJJMHQ5Rk84?=
 =?utf-8?B?ZS8wOVNUWWRmVGRZeGIrdEJXTGJja1AweEJJVTJ4WVFmY2pYRWIveDhvazRy?=
 =?utf-8?B?RFp5bEQyN1hGdjVzdVZ3V0VER2FkbTNvajRnSjJCTjlLcVZuMzdKRzZJeUpk?=
 =?utf-8?B?ZlZ1V3VPZ3F6QjNseS9IWUhIblYyOWpnRW9HVk9mbnJCb1BBS0tlODcxdUg2?=
 =?utf-8?B?Wkc4ZEY2Zi9mNW5YZ1JSQUJpR2NUK0xaSVY3aU4xY0JkTVZ2cDJvZDlpMFc0?=
 =?utf-8?B?cHN2Ukh3QXdpWFFIY0dTQndPRTdDSTZhRXlocWwzNEtuQm5kaUJsNC9oKzZo?=
 =?utf-8?B?eE1CTXhRb0pqU0xSZXRsMC9nalZDenZzQlNkMlBKQW5seW5sYmlnQ2pCV0sr?=
 =?utf-8?B?b0V4bUxJZk9RUmdGeWthZGZ5M21UZnF3cVkySWFrazJvUFh4YjkyT1JaNkcx?=
 =?utf-8?B?aW1XNmRXUXEyUmpvM05tQldNeEJZTWdwTzArK1ZnS05DZDd5WkdZVmthZVZT?=
 =?utf-8?B?QzNsTlRLaUVWMUhTS3RzdjJodW0wVlBhcDI0eVpBYWU1VHh4c3F3M09BZThl?=
 =?utf-8?B?VGJ4OTBBOCtmRUpTZkhDQUR0b2ZvWkhILzdqL0dFVG5mU2I4ZGRMbldNUE8v?=
 =?utf-8?B?TWVCY1FkTzhWWGtWUEhlVHRaMHVJSUZXajRlTmhZbzNERjJVcTZ1eWZtWHUz?=
 =?utf-8?B?VnRxcEJPRVdxb1VUemdBdDNsanBqWGpGZ2pCd0RRcTlOWWVQSmpvSk1BWGJW?=
 =?utf-8?B?TE9yUjJKdjBLM2l5cEM2VkZiZjlpQ2JsSmlxY1FwZ1FmaFdPSW0xYjE1eVdP?=
 =?utf-8?B?eTZDdzlBdGRpOHlnbFI2UFk4aFp1eFdsTHBiL1g1NVFkbzNCS3pPRi95Y25s?=
 =?utf-8?B?VG5EOGx5RDhidW9sYld1M0RSQ3hLNEFlcWJaRUV3dXdYeDFKc2lqejJicERC?=
 =?utf-8?B?VFdZZkZsVEkrUWJxOWNpYnhZLzRkMW1oYUlNL3lEc01pUU5NejBKUlQvVHlY?=
 =?utf-8?B?cHlVd2l5WnMrM0tvNm5aZ2FySnRZeDFLMTgxNEs3VlJIWjFhdTZLZkllMmRW?=
 =?utf-8?B?UnVkVzlaeTNHK0NnV293ditrK3dLUnpjVXhLUUk2ZnFoU250amlIS2VuMTEw?=
 =?utf-8?B?OGtaMkhYbWYyQUduUUQ5dHQwMDVsMkVBeTd3TnVwMVd2T2ZHY295cGZIQmVY?=
 =?utf-8?B?SzNsZ2UrWUh6elh1eHNScXVBL3ZTekVmRWhoelZWMmNxSitia2ttSjBWRVBF?=
 =?utf-8?B?M2JzcDNJcm0zZjUvSkFCZEhQRzRtWm9UaDU2WXBqd3VpLzNVT2RkMmRweTdi?=
 =?utf-8?B?WmJtNUpQcURGNU1yWFZNd0dzMGVVTEFsbVhvT3owZ3cyYTFGN0Jvd3J6VDc5?=
 =?utf-8?B?M2VpdmtxVlMwWHJaSGhmRCtEakJEMC9hWmpGT3dubU1ldmhLR3RiSDdjVWZj?=
 =?utf-8?B?dzVkNUdFWmJEQXFISGRwNGJ3Q0oyeFBPMTl6R3hiczZXd3NoUWxaWUhSOWFr?=
 =?utf-8?B?WFBpSTdXZmlBa2FyTnNjZ2ZjKzYrd2MxT2ExS2NMMDBIbGN6dlpncTQ5dSt6?=
 =?utf-8?B?cUc0aVlkT2d1N0NnSmpwRFhQY0FsTklCTGRPUVViUjV6MW5FSFpZTFllbGVM?=
 =?utf-8?B?bXBlR0t1SWFwZml3U3pnQURDcWNneUJJUW5YM3RRd2hHT0NFNlRHWTdCbEdk?=
 =?utf-8?Q?4ZBeyMHOytQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0tvalg3Vi9melQ2K2pkTXU3dnB6Yi9BYnZVbnpmVkxVLzI1TjRBcHQ1QXhK?=
 =?utf-8?B?aFJNN21kT1ZzdU1ZTWJDcmdBZFZkbTlxVzY1STh2czNtY05CKzh6SEF0Rm11?=
 =?utf-8?B?MURWRTF3QTVTajZjdm5iV3A2VG9CTjRiSXUwOEhmMnlJUzBVS3BmdDdMV1o5?=
 =?utf-8?B?amRoSmNVQ2hEblZFUCtUNjBwU0xuOTdtdUtTS1pUVG13WnJodHVzWjdKcWps?=
 =?utf-8?B?S0J2MWljc2V3SEQxUmtyMktSZnZCN2ZQNVlDeGQ5Ti9GSGpnbFlGeEt1VmpM?=
 =?utf-8?B?UnlZVHgrTTQ1bU9WZ1JIT0ducUc5b3o5Y09hUit1bHYrbGk0VEhuT1VIcXAy?=
 =?utf-8?B?UkcwVUVFQzlOWEgraEFrZzV1Nndrb3V6V0tqY0V3bVhybVBXTVFrWkNra3dD?=
 =?utf-8?B?UXBMMUNoRTNGSjBKL0N4NFFjVXl3cEFBNjl1RHlzdGcwQ1NRMFd1N2xwOUpS?=
 =?utf-8?B?UUE1ZkxzZ2RySzZRbGE0bVlaNU1MMHEyU2c5NlM2enBReGtOTWN6Z3gxNmsv?=
 =?utf-8?B?bXo4a0NQMHVQcjJsUHlLdkttcENRTmVoL3RnMUlXMHZrcHhURXR4dG1Zd2pN?=
 =?utf-8?B?REZtaU9pMnRFeXBrRkNkOXl3MGwwWG90Z2dqQ08wSkpmY2kyN0RvcmJwK1Rp?=
 =?utf-8?B?SzA5YXg2NHBEQlYyc3ptSUpoelRQWlorbjdkQUh6VCtld1k0elNldXhTdzRQ?=
 =?utf-8?B?S0lPQTlkcWo4emhKd2I2UHR0THpMbnNWdGJkVlZ0N25GSVYzbmV3MXFYNDBl?=
 =?utf-8?B?b2ZIcUZkWVdMbkdEa240YTJPV1BsWEl0SU1ObzBSQnlCUHVDUUlhUWNDN2ZW?=
 =?utf-8?B?ZGVqOTdRaWFqSnRmUjY4TGptU0RBcUQ5NEI2eHpPTmhiSi9oa2l6cm53RG1h?=
 =?utf-8?B?YkhtM2RabExYdDNPbnVDdXlQSEZxOHlmRVlKWlhmVU1tbjJ1WFNuM1MvRUNE?=
 =?utf-8?B?dWhzMGFXRGdRUjgwdHhHejQyVTZRZGFHN0VXSlFjZW1LK0huZWxaU0ptR2lF?=
 =?utf-8?B?bVgzdEJIdGNHUjBuWUw4Tkx6WHBpWC9NMzQxY2E4Y1ZLLzg1cWVNbGc1RGJn?=
 =?utf-8?B?dmdJcXR2UmVuR1g0Y0hScmg3RGRTTCt2NXNwWTNhMmN1d3RCMkRpNHR1U2Vv?=
 =?utf-8?B?dlFVd2pmRFlsTE1EQnphRE92NUNrZ1pyaGJXQzdtaGpweE5WdWcrckM0UU5X?=
 =?utf-8?B?SDZyQmNGOXFHdlJiQk40blpIcSt4bGQveEpmWk9LSUo0dWNYU1lDNkh0M0lX?=
 =?utf-8?B?VCs2Q0x5enE5TXU0cjNWWmQvcjZpbWFPRmhTRC9MdUJacDhyWnROMEtJcTNQ?=
 =?utf-8?B?SVVqam5OSHhEdDhhZER2ZGQzcDdUY3ZhUjBlTE1JWE00WWgvTGlVdUp2QnBp?=
 =?utf-8?B?NTdOQzNZSmIrRmYyQ25kZXFUZHVmNkc0cWpsZWx0T1VDK0x6Z2VRWjBDYlNm?=
 =?utf-8?B?WDZWT01HRGJxcDZGc0psMjMwWEZOdHVwY2EyL2VOK0t5N0Y0WTRZRXljVDNs?=
 =?utf-8?B?M0FhSk1PR2dZdEhhRFppMTBqNW1xbkUyd25zZEZreHJOWm0ySDRKZmRJTlV3?=
 =?utf-8?B?UGY4ZG5aMExYc1EyclMvSy9sNERXcVlVMUNUZXNRQVFMUHhaQlB2STdjdnV5?=
 =?utf-8?B?TFlVdXc2eVlxSnk5VTBzeDNBck1DcnNDS01keEF4eE9LeGMrbHdOL0tNRzVW?=
 =?utf-8?B?SVhGTHBDZnNybXhFY0ZCY0J2dnZid2p2NW1XWHh1MVY4Q3hsK21yU1RJZjdW?=
 =?utf-8?B?dkpDTTA5MWNRQ1ArQ0plL0I1eXVma2svT1dNWlNzL0QxbjYyMVJiZ3UrRVdG?=
 =?utf-8?B?RjJmY2lGUEdVazkxZ1VVeHVuYkNGdUJZSGhrNVU5aUhGWk1yNXRiclRsVkZE?=
 =?utf-8?B?emh1aWpPVkRBV1lLcGRqUG00L0dNYlNSa2RMdzJMajVmOHRJUUhLL2VWMDdu?=
 =?utf-8?B?UDZBSmRUeW9MWjBicDNpb0FKWFlxSUNrSDVsRUhNdDcxZFNnYU80RkwwRlM4?=
 =?utf-8?B?dE1yYUJKTEdBaGhVcXU0WnFFMkVXdFB5akNReTE4V0N1b0Y3OWR1ZnVlaElm?=
 =?utf-8?B?MDE4aWQ3dGNDbkoxU1lIRmJERTFLSFVzTndsNXBCWEIycGZkV2tmYmZLOTdo?=
 =?utf-8?Q?zfZgnzrBXrDXfFEKqGAcd7bSR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 662b88b1-758a-4cf0-dfd1-08ddc2a808bf
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 07:28:31.8563
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1t+y6hejzaENrCgYm0G6xSCipl2Z0rMX1IoQX40cn2t43P1eq2ffDISel1KdjeRk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8540



On 11/07/2025 17:10, Hari Limaye wrote:
> Hi Michal,
> 
>>> +int map_pages_to_xen(unsigned long virt, mfn_t mfn, unsigned long nr_mfns,
>>> +                     unsigned int flags)
>>> +{
>>> +    int rc = xen_mpumap_update(mfn_to_maddr(mfn),
>> What do you expect to be passed as virt? I would expect maddr which could save
>> you the conversion here.
> 
> I think you should be correct here and it should be fine to use virt directly. However, the one place in common code that I can see xen_mpumap_update is called is in `xen/common/vmap.c`; and here the virtual address is not the same as the machine address, but it looks like this is only used for LIVEPATCH and we perhaps don’t care about this on MPU systems?
AFAICT you will not enable VMAP on MPU.

~Michal


