Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8066AE5CA7
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 08:13:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023116.1399028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTwuG-0005GL-Tc; Tue, 24 Jun 2025 06:13:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023116.1399028; Tue, 24 Jun 2025 06:13:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTwuG-0005CO-QF; Tue, 24 Jun 2025 06:13:20 +0000
Received: by outflank-mailman (input) for mailman id 1023116;
 Tue, 24 Jun 2025 06:13:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NDMB=ZH=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uTwuE-0005Bn-VF
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 06:13:19 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20622.outbound.protection.outlook.com
 [2a01:111:f403:2415::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5177a4d4-50c2-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 08:13:17 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by DS7PR12MB5910.namprd12.prod.outlook.com (2603:10b6:8:7b::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.29; Tue, 24 Jun 2025 06:13:13 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 06:13:13 +0000
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
X-Inumbo-ID: 5177a4d4-50c2-11f0-a30f-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FB3YT5YLVdFIAtJ1HxgSr1Fkko+uGVj6O3MNABPZMUawbs99whMUmf8Fag46RUh5MVPfen4kHknhbK3yChaXmeoDa1ply8C95Xv0Dnm72YK2IUwFV4cHzoXhxar1VxsiKXpt0nMs98LukFSIf+sbusslkwwFNSEyf0GiAgriJYItLmmDfFH0qIqC6wTVsYr/j6jIJfqohjLbKLUyvT4SmxoBPCfgasK92ghREPgggeGeAz7Xfm+gitRgk54k4/8vBjFDmWyk5Lp/4+ULt26qiJCQWySr7QI/6VlMItPp5PC14iWfL0USa8+ejcyW/vgwyRqUpYXHb/SWLnzXFDpe6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cLInNVO5VPJEv3CPWloDyLH7X9uRtgBj61XjP3Xl46c=;
 b=sVnZ/WNs1tzYgpX/JgHVdgiTlCkCX9NKKcsc1uA8FcGqlbS4qbu1FdpW72TpLJDSAxsV0kpXMhv7DPMgairGQXEy5+ZCbm7T1+kcgeX+1M89lU+xlMhxbD4kLzUHe+Ej0C1U+QtxlDa4PnJB0+VPTXq421T4I1vb4y7jYt4fB5wKVXJSx3LqXt9GW0m6pReJ+wtCcOuO/jfvEht9RCOAfXP9dvmmtMaKW9GYxsoO6AWbxoiwPbHlauUTEZfjaArtViZhSPlYiyhoIVTFdRoNopEGXihBnnX5UgEU3d8MIVLgiU0ICnW3TCjjrc1JPAllTDezXt6HKp6zlI/kmAM/oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cLInNVO5VPJEv3CPWloDyLH7X9uRtgBj61XjP3Xl46c=;
 b=v2vXwdmGFd+edYvTM6nHriFa7DXVlG4W01k0LvVj1ycSjSMaioeIJB4Me7Vd6EBC6js2s4d1FB1e2gh8LL2GAheYENjthW+LZTgsvsIuRlX2bwGJAddoULG85IScqHskt0sz1d0FL05/oNel2IvCIbIVYFhQNWtnMhcUgj/H8vk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <da16500d-f589-4396-8ad6-78cdb443da60@amd.com>
Date: Tue, 24 Jun 2025 08:13:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/16] arm/vpl011: rename virtual PL011 Kconfig option
To: dmkhn@proton.me, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
 julien@xen.org, oleksii.kurochko@gmail.com, roger.pau@citrix.com,
 sstabellini@kernel.org, dmukhin@ford.com
References: <20250624035443.344099-1-dmukhin@ford.com>
 <20250624035443.344099-2-dmukhin@ford.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250624035443.344099-2-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0231.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e9::11) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|DS7PR12MB5910:EE_
X-MS-Office365-Filtering-Correlation-Id: c0db42b4-9ecd-4313-7c3d-08ddb2e63372
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZEJaU0FONUlVS3pZaWpkOWNzYmhlR1kzbmNoZS9wQnBMd3gvVU12SC9NU1la?=
 =?utf-8?B?bzdJNklwOVMvT0l4R1N2b0tpMFdYNzlLUTlQbXZqMkhkdm5DQzhPWFFXbmJz?=
 =?utf-8?B?UzBZdVJUazNhQXBWalZQMlhNQ1MvVUt2dTNwemhIeW9IbHR5cHNYRWZTaWlp?=
 =?utf-8?B?ZmYrQk1UMnl3VU00MFNYdnltRFJQaU11bXJnZlBTS21IUmJIVUgvRGJXam40?=
 =?utf-8?B?SUltSTBVL08ycmhUbDM5R055THhWemtIMHpEeHRXOStITkVkaklBRXV1dGNl?=
 =?utf-8?B?cGYwaktZSzhuMEgybkZvZWVucVlYekdFa0ZsOStxMXFCUWsvcEg2ZFZxb1NE?=
 =?utf-8?B?cWdBZUpwMFAxQ2RTUCtXWnF2dk1sakJNR3p6d1BOeUJFTVFwL0lHSFJSVWhM?=
 =?utf-8?B?bUJrZUZ0SHpWOVFySDhVckJraGNYR1N0OXVFQ3dxZWRhRDdHNG5HcEthdEJB?=
 =?utf-8?B?RG1IeGkzK1E3dWppOFEvSFVDYWQrQWVVbUxTOWtIbHdWYWhDTGxVNm9tRkNW?=
 =?utf-8?B?NW1udy96a2lkekw3OElmcDlRY2ZpdEZNcUZVZC9maDFlSGhWaFVJaVZ6V0FY?=
 =?utf-8?B?UFprNnRSQ213YzhrTmxRbDhCRSs0NUd5QTh4eStvUHhKeTNveU5QTUtYUUN3?=
 =?utf-8?B?T3QrWElBbmdGTjVvWm5JSXN6cGhmZzNwSzllTmZUTXZPSytNOHYxamRYQzQ4?=
 =?utf-8?B?Q3BkTjluc216TTc1MEkvQWZKalo3VWZBNFNQVk9ReXZWanVnODR5eHpYemdJ?=
 =?utf-8?B?bk5xYm5BeGZ6V00zTEN3VTRjK1ZzWkV4c3B5M2FaRTA0WTRGSHpGNVJ6ck1N?=
 =?utf-8?B?bFlmN1VsWGxwbWFrVmtCQWplSVl1djlhbWZhTTREU3NMYWN1SUgzbVRUVlFN?=
 =?utf-8?B?NDRDbDZDWTIycWlHRndnbXlGc09xMWltUERHQU9SL1p3VERyVzMyam11UFkw?=
 =?utf-8?B?RWVVRDh1R0J6Sk9ZYnc1bXQ0TGRjNzRFc2RXYWs4TEViY09oNStBNEpEaDJs?=
 =?utf-8?B?NWt6SWdCYUROalppWHNhdnlWNDQ2eCtGdHZvOEwzWURxb0QveWVJRlRqaTFk?=
 =?utf-8?B?d2F2VGxPOW5QYjBpOVk0RGdLM3VCTUh4amlEbTVqeWtkWXFzajJwaG5KQ0Fl?=
 =?utf-8?B?WHBsMGdsaDZUTmtPTTBLRHhZanE5MjBQakRobkF4RytIMjlHeG43NGp5ZjR0?=
 =?utf-8?B?NkFzcTN1dGdaZGZyRmpZNGJ2RmdPY0hUVnAwaFdVUFJjdUtFWDh3Z3ZnSG16?=
 =?utf-8?B?ZGlhd05uYmZBeVl1Y0VyamhkZjRMTURkR3REa09jYnlIRGFmQy93UmFFaWdr?=
 =?utf-8?B?WkpHR1A4YkQxaUJVNVVUYktNNlQzY3Zpck5SOXA1SStTWmVhT2xROWxscWw3?=
 =?utf-8?B?cElEQkJpQ3J3SC9kL0d5K0pNZmdPUkpIamloUFpwWGtwLzNsSXRQMC91RVJY?=
 =?utf-8?B?Z2tsR0lYZE9Dd3hWNm4rakxZR3ZacFhaaWk4bkx2R3RmTklTRHdSVGJsRkZZ?=
 =?utf-8?B?dFZySHNBYjdSeFp1VU1wTXVTa1Q2VjN2S0d1S0tGZHl1am1MV2Q0QVlVWU51?=
 =?utf-8?B?TFhwVlovRnhZOWVVZnZBNHVzdTJiYmpianJRMi9qajhCeVVuRWZvZVZUb3I4?=
 =?utf-8?B?YmJxNkNsZExsUHRkcy9yKzFPWXdwdGMrNVpwbm9rY00wWS9BT2dxd1ZaWi9r?=
 =?utf-8?B?OGlCSjh1aTlOUHBvbEFqSUhNaUw0cnNqMWlqc3RNRk5BZ3BGYlVRU1hWQUdO?=
 =?utf-8?B?cUkwbzZ3cnhPNWd6V3U1ZVZLVTlQTmpKMG8xQ2dIOU1jT29WZDI4azhvbENv?=
 =?utf-8?B?bVE4VGlwMjZGdXhCOHZ1V1I4MzZ3UzBBVkpuYmFmenpWT1pPRTZ5UWV0QXVt?=
 =?utf-8?B?TzM0QXNlOU9tc3ZLTTV5NWtMeFN3a3hrYmNjRWxvaHNJS0lTQXhIZzI3Yk9G?=
 =?utf-8?Q?kHf5f/qTL8E=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UmNubSs0Rzk0RUZNcXlFdE9zc0F5UGt4QzkrM204ZUtDSkRpQzBrL2hnakty?=
 =?utf-8?B?TzgzY21BTTYvdnF4Z0VEMy92QW51eUgwSGJFZmlqT2NRaExGWDhTWmljYjl3?=
 =?utf-8?B?cVF5bDRDYzh4aTZHWmJxWWw1dUR3ejdZdlVDVmtuKzVRbFNPSFlFL0hJZ1hB?=
 =?utf-8?B?ZjVrVzJlRGpEOEVSQzBrT0ZSZy84Y1FjQmcrRjRGNWFPREVzbGxzdlFreVpZ?=
 =?utf-8?B?YTN2T1pXRVhWYTg1MDNxNFVMK3lXcDVJT3B2SFNJQk14aDllQ1huTDRmWlNY?=
 =?utf-8?B?UjdKY0ptU3RXU2pLQ3F3OE5UWlFyeDBhS1NaNFFCaDIwRVlIM0VudHlBcEZx?=
 =?utf-8?B?WUVlSktIc2p2UElnMjhwVjlmUVE5RkxMQlkwRVo5U1FoTEZwMThZMzh3Sm95?=
 =?utf-8?B?aUgyaXBpVy9lbWo0UldiWlJHY2M2em9xKzU4bjZxbnpGTGpsNHIvRkNHRzVW?=
 =?utf-8?B?TWU5WGYvS3Fob3pOUGUxQzhncDNtSzFsc1FBOTFVcmVRWVJhSisydGZ3Rk5v?=
 =?utf-8?B?bU84bFlRT0pxcHJRMHhCcXJrdERHWUhwSk1oZldpeHRnZmNPNkVUeVlCaUtM?=
 =?utf-8?B?RXR6Wit3ODUyWXVqSkh2T1gxN0JUR1ZNQWdWUFFTUU53eDdUaklsWjAwdzl4?=
 =?utf-8?B?bkhGU3owU2llWHhpcEJ1WXI1QzAxVkM2VmlSaGVqeUVBOHYwRUpwMmRsTkl3?=
 =?utf-8?B?MU9vQjQwMGhuSTBvNVljMGFOUzU4bjBKOFpjUlJGRXFQYkMzenN2ZHltTy9w?=
 =?utf-8?B?M1hya2JlQ0lJZXFXL3M0WUlndU95aWNCVUE5U2N6bENpQjhSVC8vTWU2WW13?=
 =?utf-8?B?enJhNkMrYk5WL2hqd3dJNmMrTVVlRkZ3Y0VSSVVaUmt2RzgyUlo3eUxTOWpq?=
 =?utf-8?B?Y0tVck5heklCNzcwYklKWkx2OVY3ZytJTThjQVR4UUFCOUxHZW5la08zUUNP?=
 =?utf-8?B?R0dvRkdWbmttemExNHZZYmxxT2lKTEVEVTVBWG85ZDN3MmNzcmNOU2xHTjc2?=
 =?utf-8?B?QkdqcjdJd1o2eHhYWW5XV3BtMnB1OG96bFJ2Qks0SFQ4T3VlRDYvUUVMT2sz?=
 =?utf-8?B?Z20vbGZQYWtORXBHSE8zWUpsNFpoU1YyNkJOQ25mTEwvSlJkUGZBQzh6aDRt?=
 =?utf-8?B?UmNqNDhTU1FTYlNuYmVSVVRFWHRDQWIzL0Rkd0RUYndNdTZoZ0ZuV1JlOUZs?=
 =?utf-8?B?T0docHZqV3lLZS9IaG1DMUo2dGRZbXhxQ1gwbEczRHN3d3ZRTnBFRFdjdnh1?=
 =?utf-8?B?a3ZrQ1hVTVVaYUdWMnEvTzFGTFRINjcrZTNkakRoVXVzd1FrenB1MmhGekZ1?=
 =?utf-8?B?R2orMXNsVnJCS01JRE96ZVptc1VGcHF4VHYrRmw2ZmpyWE50eTVGYkdraFZk?=
 =?utf-8?B?WThCbnVNcmI1V1VnUXRIbXAvdXVkaUxkZnY1WVlYZEZPMEE4VUVxQTBXdjh0?=
 =?utf-8?B?cFh1SzlMalZpSkFyb2x1VTNtSGFjbFFoYm5RZ0FSYVpka0ZTelZ4bklTbkgw?=
 =?utf-8?B?OXpuRG5tcWJYOG4yRnZkSkV1UnFDNktrbDF2bzFBRFhWd1JDVHI0TnNlMU1l?=
 =?utf-8?B?ZlRpZnl6elpIQmcyTWJ3T0ZZWERpSnBNQkd5eFZXWUREYThkR0VjYWZVTXdB?=
 =?utf-8?B?c3ZBNzgxM0RNLzN2MnBBTmZhMFhUeWRnT3E4b2JDT1NlSlNXMmpHcHRmUVJ5?=
 =?utf-8?B?UWxBWHMyRTFPYzVlamlrVHU3Zi81U3ZsNjRqSHAzVXZja3ZQVTlsZ1hQV1Jk?=
 =?utf-8?B?aWc3MXFrZ0pRZk5UQkN1ZVVVTTAyMEE3MktvbTIrWDRtUWcreHVlUTU2a2Z1?=
 =?utf-8?B?RXJiYlpkYXZXNHN6TGJhNXg1ZHlLaHFxYzE0d3F4eDArZUNKZ2xDa0xXclVI?=
 =?utf-8?B?ejk1VzM0STdTdXJQdHRsZzVqUWxPMWlGY1FvUDlieFduNjU2Tkk3d2NzSVJS?=
 =?utf-8?B?ZnJ0Q2tROThtL3A0Tlg2TllXSTZEUjY0bGlJRHdHNlYvbjBGN3pQRVl1QzJv?=
 =?utf-8?B?NjY0cHRuMGJYdFdOTU9xaDBXN0ExV2NscUtscm5WcTZGUXoxZktzQU4rL2dF?=
 =?utf-8?B?U1BIYTJOOXdTeFFaV20wOWJtckVoWVBCcXQrSmVYVWk0dVlEZmZFT1ZPQzRO?=
 =?utf-8?Q?BRWBR9xn2NdIW1LLzX/U4Pisl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0db42b4-9ecd-4313-7c3d-08ddb2e63372
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 06:13:13.3926
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xBK6S6Ai5i88ZyXpcJCdnZ14YpCDu4NEeBMWXClDKiW8tn4JZk/kbDDaWPKoYxOh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5910



On 24/06/2025 05:55, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Rename CONFIG_SBSA_VUART_CONSOLE to CONFIG_HAS_VUART_PL011.
Why? We emulate SBSA UART and not PL011. Despite the similarities (the former is
a subset of the latter) they are not the same. I find it confusing and drivers
for PL011 might not work with SBSA UART. Also, in the future we may want to
emulate full PL011 in which case it will be even more confusing.

Also, why HAS_?

~Michal


