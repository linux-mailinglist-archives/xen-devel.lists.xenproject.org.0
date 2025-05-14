Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA9FAB64E2
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 09:52:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.983987.1370164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF6uy-0000jx-Pg; Wed, 14 May 2025 07:52:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 983987.1370164; Wed, 14 May 2025 07:52:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF6uy-0000iY-M9; Wed, 14 May 2025 07:52:44 +0000
Received: by outflank-mailman (input) for mailman id 983987;
 Wed, 14 May 2025 07:52:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kjT3=X6=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uF6ux-0000N9-6U
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 07:52:43 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20614.outbound.protection.outlook.com
 [2a01:111:f403:2418::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 67afc43c-3098-11f0-9ffb-bf95429c2676;
 Wed, 14 May 2025 09:52:38 +0200 (CEST)
Received: from DM4PR12MB5277.namprd12.prod.outlook.com (2603:10b6:5:390::7) by
 SN7PR12MB8145.namprd12.prod.outlook.com (2603:10b6:806:350::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Wed, 14 May
 2025 07:52:34 +0000
Received: from DM4PR12MB5277.namprd12.prod.outlook.com
 ([fe80::9ab:5367:ba51:af6e]) by DM4PR12MB5277.namprd12.prod.outlook.com
 ([fe80::9ab:5367:ba51:af6e%3]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 07:52:34 +0000
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
X-Inumbo-ID: 67afc43c-3098-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WYtQ30D6Otf0yL9iMv+AaJkJNDWZBZ4w0JGnJQBfX679o4mHf4XNcfCjSAsPGoil0jV19X1g7Fg2S39+wb+Razl/IjPmWyALThjF8ohHf2rFo/Pi/KRb3cBIp9wi6/Q2GZOoIOEhkKLw3OuGxPjssCexZBuYi5t9aOOYTLiVNaoMht63oDT0LRopMgDATIjjTbSVMZHsf31bGf+aZrFJKJwrYOKEpSJd7O2BG8vqNn1Oa2UPVm09ucfcdt0LLsZFjFtfLXRNy027J0kg+yMp0y9+e+Ec6Wb6lro+6SilkBv31oDHucVklt++f8imJ8M/bojrzdVASUv/pBYkvCePEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xskFxAND+mKE9jnX/6RFcSqSC/GCZJP9IjwpEoUVXc0=;
 b=vwi+QO4j+bGWKyOq//E4ZYApxQffUsmPj7GQNMZyTeMKH2VsZvaZ077/JcqF8r4LU9UwMBDv7vbmBTraZPa8V9v0KH0A1/pQrgS9yfspanN7Y9o5kW1YzJWKGfaoh+fVvy1tlacgNQWPatVqwcpo+m1fJwUbLI73xZ2su3ZOOYcdPOmufUj2DNQuNp3CuSeKQM+bIR6nXXPUKGvUaL+Kv/DaEqy0hZmXJ9YcorB/0+817YFxIivkNCN4z/cwuIywWBKOsIFVdBgtxDydoZSRhp/j3It22is2mbfblPK/fJDp/z19tUpcKUrLRApUXuR9ChTbJXKGhW5RpYqp9Orldw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xskFxAND+mKE9jnX/6RFcSqSC/GCZJP9IjwpEoUVXc0=;
 b=Y6oMEivOtU/Vowx1J5MAOvQPSvQ3/3dt9lQAcIfKgbmTarsE3lm9e4GykiDJstyJSmlOL/6m1U0+bVDA0f92YjoctR+fZhufMY+I/CbDz3nkJlN4C3TQAIWhlIekhL6ZwPgXR5SVV8PWxCFdOCWTz0Nm8JDKVVVJ2/R7fWp4/Zo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <ec9f265f-f33b-4b03-8139-dab0f9ad7aae@amd.com>
Date: Wed, 14 May 2025 09:52:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/dom0less: mark domain_p2m_set_allocation __init
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
References: <20250513171810.668370-1-stewart.hildebrand@amd.com>
 <alpine.DEB.2.22.394.2505131707020.368682@ubuntu-linux-20-04-desktop>
 <cacb0002-dd6b-49e5-8019-2d323771e3e7@amd.com>
 <4e684e38-ed64-4731-8f00-afba938a28a0@suse.com>
 <369ccaf5-5c17-4601-88b0-eb32af8608d6@amd.com>
 <ade0c506-089a-47e6-b4a5-5498311ae38d@xen.org>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <ade0c506-089a-47e6-b4a5-5498311ae38d@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::12) To DM4PR12MB5277.namprd12.prod.outlook.com
 (2603:10b6:5:390::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5277:EE_|SN7PR12MB8145:EE_
X-MS-Office365-Filtering-Correlation-Id: 467e4bcd-3ebe-4369-a19d-08dd92bc49ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VFV1d2FTaFVJNHRNTDRyczVmUEVQTllnazl1SWsxQkZBVnh2MzlkakhuMjg4?=
 =?utf-8?B?UVlMUjNFdWFoUUNLcGZHbHVwNzdwNFhHU1MrMGR0RHhoRGw3NkZXeWJNMTFm?=
 =?utf-8?B?WGJXMkl3d2hTRnFBdEthZFpkbXoyM0RQajhIZzJCNlo1NnM0VjhTUXdVSUNQ?=
 =?utf-8?B?M3BiR2VoQWU2Tmc3bW04ejZvaEo4bEVYUkVmVWxJNUhIdFJEUktDZnNsTUcx?=
 =?utf-8?B?QS9vSWFWOGI5RVJYZ2RLTGZUMFdoNXp3QWx6VDZmeWJmdW9valBpUDI5d1Z1?=
 =?utf-8?B?TmRqMzd1OGh1TXg1WHZ3U0NORy9wakpiZlJTLy8yb21XdkZ5QzhoL3dXN2lu?=
 =?utf-8?B?dHhTSzhKVW9UNDJmWTI0M2VYTllOU29lUlkya0JSang1eDNidUFvUDhGMTVo?=
 =?utf-8?B?VWR5VEEyb01JZmFXRHd1aXpIc2xxVWlhSE0rbFNCZVpyMGVDc2VSaTJkOVpB?=
 =?utf-8?B?bURpWHJMY2piV3BUVC9veVVPOVlYNCt6VUh2NzkxMk9LQktwdW1VQUVyK01Q?=
 =?utf-8?B?eUJiYWdZc2ZNaFJ6Qk9WNm9sbGt1ZGVQdE1ZZXdyd0tYM0N3bXBtMUh4RExw?=
 =?utf-8?B?eURpc1FWZk9xR0ZpVHlzMk1JTWQ0ODdqVElLMnc5cUNEUDRGNmhrcWVwQzhK?=
 =?utf-8?B?U004Yit5MmxGUTNYeHdxWXlnOVRlcHNzZVREQ3dIMGo4QkIrQmNuMENCL2ZL?=
 =?utf-8?B?TEc2RXpaOFloUmpuZURUTGhZcW9GUTh5MDRjdjc2WllJTktWelFRNzFRMTln?=
 =?utf-8?B?SG5kajQvak04K2dHb1puSmdLVWRkVEdlUzRUZmhLMGVGRE5XcjBKQ2NWaU5m?=
 =?utf-8?B?bmkrNXg4TGhQVWRPRlM1WE44Wm56aCtWMGNvZ1dOTzBEMEozWVRCWTlXaFBr?=
 =?utf-8?B?KyswdkVwT3RkU1F1QWw1eStESCtMRWlzOTlmS3FCZFVUbjgxaFZpUWV3WEM1?=
 =?utf-8?B?REliNVVkRmJTZ0YzaUpKV0FmemJXOFViTlIyRHpleC8xYU82R2t6aFpiRlJu?=
 =?utf-8?B?M3E3TERkYjNCSVlod01HdTJkM3pNbmhqc2RmODQyRGJRVGNUS0hLL1JITm9P?=
 =?utf-8?B?ODIxSWw4U2UyYnErc3F0eWY3bDZybFdxMUU4ejBQNzB5d2lxOEw3ZWxGYkcw?=
 =?utf-8?B?UjNXeEdjenB6Z2xabkVnSW51clpwNmpDSzVkazNSNVN3UW0xR0RQVUI1VkhB?=
 =?utf-8?B?V1FzQ1FZc1FYUG4yMFRJRDlQWENDdFJQUHE5Tlh0STNxSWNnVm8xTXcrUURD?=
 =?utf-8?B?ZTIvZFlaTkIwdGJkbFloYVBpbFFWL1ZEcS9DVk9lLzVzYzJZRngyRThqTGR4?=
 =?utf-8?B?QlVlVkNzcTR1OVplbjB1VDNGUXFCWWpPVVUyMmZNM0hkdDhsNzlhb05YQ3pa?=
 =?utf-8?B?Z2lMTEc4ajZlOG84M0NOMjBUeWt0ZWgvN01OR1hXbWliOXp4ZjA5UGtucUJ6?=
 =?utf-8?B?N0gwM3RSb2x3Y2N3SjFnQm5kd2NSVWcwTWhEckQ4K1h4SS9GOCtCNkpIdjZt?=
 =?utf-8?B?by9rN3hlWGY0OElFT2Z4REVlNndnUEZHb2dXT01TWkNDc3h4KzBKWGc1dzBV?=
 =?utf-8?B?SmlnN1NwdHRobzhRemtJL3dLczBDN3lXN2cvaEdYVzQzTXhDRC80NW0wTEw2?=
 =?utf-8?B?UkxiWmpqMk92VHJxM2VUc0lxd0tyc3E3KzVrTGdFWm1hUWEvQjVRV0ZrQjRW?=
 =?utf-8?B?dEhlc0dnbmxncmtyTko2LzduM2VzRTl3VWdzcVFnZ2tOUG45d2dobmhnVVkx?=
 =?utf-8?B?b2RkYVcrNzR3ZFk0UkFKVlUwQnJhUHdTRHpLV3pUc042ZFNoOE1DUXk5YmEx?=
 =?utf-8?B?TGlDWVAzNkw5cGNoeWhtRGl0Y0J6N21rN2svSmY2Rjh5U2pQRmJXNWFvTGg5?=
 =?utf-8?B?Y213MWZmUEdZaG5LSEt2OVhXb1pNOUVwVytDRVFTOVpYNWpEZERvbjl3WVhh?=
 =?utf-8?Q?c78rQzuNRH4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QUVuMnBGeXVXZVBvWlFsaHdPS3JteXdEb1hteHFhM2ZDNTRBM3ZMMmZFZFBs?=
 =?utf-8?B?UU96OG51ajZzbFpJZlhOYktIYkFLMFZyQ251eWRvQXRVN1YrcnZqbFZsNHZa?=
 =?utf-8?B?SVB2K2ZONW9sazFqZ1hrWFZrT0xFY3NyOStpZ1hsT3MvRnFXYXFDdnd5VEVC?=
 =?utf-8?B?aXlxZnZMNmZQNjNQZDkxTkIvRE1xdlBJZUJIdWJXQUhKWXU3QXNwWG9sRStO?=
 =?utf-8?B?Q3JUUHJkQVlpTTU3MFZZb1YvdGtHL0NrcjRZVTE2d3dSbVVJMHhpUHNKNnFZ?=
 =?utf-8?B?Sk5mMVQ3SUEzRENPSmw2Ry9FNHBqSmYrendrb1JhNDduRmNMZVY1NFRQYkoz?=
 =?utf-8?B?VUw4ZjA0UWgrdjVUdDg1djRNcFJlTmFkWXhFeStvekpGWnVJRVpqNlg4M0hs?=
 =?utf-8?B?VzB1b0FRUlJieGNsK2VOUnJvZ2tUT255WWozZVRnOXZrNy9hTVJTUnYvZC9F?=
 =?utf-8?B?RERtTFByZVJuM2J3Y0F4bHFaY0xjVkorZ3FrN1BqWFBRbkliSFc5bDY1WnhF?=
 =?utf-8?B?blVsMk5Qa091MUp6WDg5dk9RemZjN09KN1JxODVtMjVPeWhrV0tkUGR6clFk?=
 =?utf-8?B?c0I3UjczOW5PcTJxY2lqT05UanhSQk9hcmlaQzgyN1RTMDQzVFRybi9jdVk3?=
 =?utf-8?B?czdGV2dtNVNiMjZlMjlyT1FUeEFrdHpVZlBtc0tCVGFCMmJDTUlTTTRwNWRC?=
 =?utf-8?B?bnVidnFzL0owRHFRMzBJdUswTnhTczFqT2JhalRGTWdndGRhZXgrc3hFRGFL?=
 =?utf-8?B?ZXRpY3dMVUtBbTRpVkVLeTBtRExyeUVSblZUL3BHUldWS05hVzN3WHVsZk9H?=
 =?utf-8?B?VDJGc204YVlWc0lWTGZPbEx3ZjZkRnhSZUs3M1NiK01OYW9HSjQ1c2VENS9D?=
 =?utf-8?B?RjQyUGxDL09XSnJKZ1NlMHZrWjFQZUNNS2lrblN1MmhTRVRmUXF1WGNNcjNN?=
 =?utf-8?B?SElhQWl5bEdSVkJ3eis4clY3V2tIOUFzZWE4WkNEL1IyUlhCQnFkbGpSQVdN?=
 =?utf-8?B?cWE1N1dja3lxbS9Hb0sxR01iSlBWTVgzYk1JZ1J1eWlPYityQmU1NFJ3dG9l?=
 =?utf-8?B?WGMwWjJZUkZMU21KMnE1MU1PMkdyRmMzNFNoSmhrRFhLeXBpYmw1WW5iUVI3?=
 =?utf-8?B?Z0lLNlhCTldJL1Vaa2tBdjc3MjlqMHc0RTgzU2JXWXVyT1B4R2FBRW5PVXFr?=
 =?utf-8?B?bjZKdjYxb1VJemlFS0JTMnVzVklmWGEzOVFTRDluL0lQcmEvNnZXQzFtOXor?=
 =?utf-8?B?bks3NkN3bnhaalpTaGdldWFSckdyTFJRa1pxamlSWTF5bk5GbVZmQnpmaS9o?=
 =?utf-8?B?Z1BRcU15TzV4YkRZb1NWVFVhTTY1VUkyWFNkNFhOYVhtc1FoMEMyU0JZYllm?=
 =?utf-8?B?eGtQRGRMYkNUL3d5NTZRRWQ0R0lXNG5sdnN4bXZiaVdrVmtGZGFCZldnc0tJ?=
 =?utf-8?B?ZXkrajAzY1RUTFAyTEYza0Fsd25KYXNtb1h2TjR3Q3prY1FJZnlqam1OSUFz?=
 =?utf-8?B?RXBNN0srSmxHUXhoN2NoRnlBbHpKL0JRaEJhRWl2UC91c1plMWpTd04zSGhQ?=
 =?utf-8?B?aDVLQTYwN29YMzBrUXN3YnFpTnJteW9WZy8rb1RnSlQwczNvVnBrVy9JenpS?=
 =?utf-8?B?cVpndStVVGcwdnY4K2dSUXZ1S0ZEaDBnQ2dkK28yMEZhZEVscHgrbEU3MzdW?=
 =?utf-8?B?ODBVMnlFWkJLOWYySk01WXpzOXdTNlI2elpjOUFIQlFZR2J6S3hSZGY4Tnda?=
 =?utf-8?B?ZzR6b3dvRk1nTFQyeVo4RlB4djNVaWxoTXZxdHpJTTlVaTZPayttdlo2ZDIy?=
 =?utf-8?B?M1Vwc3Y2azdNY3JHbnJDbm5yZ0dsMnpqdHJpTTdhLzRkUEJXcEZJb2tEOXhK?=
 =?utf-8?B?cnJ1Ujl5dTd0dVlTbThTNkp1WHIraGh2Smp0T3J6S1NySi9RcEVwOUhPSmVJ?=
 =?utf-8?B?WXZtRHJZVkdOK3JMR3dYaEZLVkpxektxeHZiZnhBcVlsSmt0bmZnVENvWVFP?=
 =?utf-8?B?UlRyVUkxWVZuWVNpcEVPTFNYdW5sT1c1UEdXVTNhVytGb0NoYWxTTVBxdGxL?=
 =?utf-8?B?ODZIWnBFOW9WdUxvVHdJMU8zZGluaE1tTWpPNDZRTWFicGdCOTZwV3lKajBJ?=
 =?utf-8?Q?TBQRgn9xepE11srPPdJtn+Dq0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 467e4bcd-3ebe-4369-a19d-08dd92bc49ca
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 07:52:34.8784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uor2NkWQU1DzYjZzcNW+/AhEbxQXvVwMPM9uNP+q0qqAi40bYLmrBBtK8vDXj9ry
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8145



On 14/05/2025 09:37, Julien Grall wrote:
> Hi Michal,
> 
> On 14/05/2025 08:04, Orzel, Michal wrote:
>>
>>
>> On 14/05/2025 08:56, Jan Beulich wrote:
>>> On 14.05.2025 08:31, Orzel, Michal wrote:
>>>> On 14/05/2025 02:07, Stefano Stabellini wrote:
>>>>> On Tue, 13 May 2025, Stewart Hildebrand wrote:
>>>>>> All functions in dom0less-build.c should be __init.
>>>> Why? This patch is first in your series and by that time there is no build time
>>>> enforcement. Together with the Fixes tag it implies that this is somehow an
>>>> issue (i.e. build/runtime issue) other than inconsistency for which we surely
>>>> don't need Fixes tag.
>>>
>>> I disagree: Code not called post-init should be in .init.*. While not formally
>>> a Misra violation (and wrongly so, I think), it imo effectively is: Such code
>>> is otherwise unreachable post-init.
>> You have a point here, I agree. Although I don't think MISRA differentiates
>> between unreachable in general vs pre or post init. It defines it as code that
>> cannot be executed. It does not go into stages of runtime execution.
>>
>> I'm thinking how this is different from a function that is called e.g. only once
>> at specific point at runtime execution for which we did not come up with a
>> separate section?
> 
> Along with what Jan said, in general there is some relaxation for the 
> boot code. For instance, we could accept if it panic.
> 
> There is at least one of the place in domain_build.c which panic() and 
> the parsing is not meant to be fully robust. So this code either need to 
> be __init (as this was the intention from when the feature was created) 
> or you need to fully harden the code.
What is this place?

~Michal


