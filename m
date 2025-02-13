Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FCAA33D8C
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 12:13:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.887348.1296861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiX9u-0007pT-T6; Thu, 13 Feb 2025 11:13:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 887348.1296861; Thu, 13 Feb 2025 11:13:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiX9u-0007nT-QU; Thu, 13 Feb 2025 11:13:30 +0000
Received: by outflank-mailman (input) for mailman id 887348;
 Thu, 13 Feb 2025 11:13:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QeDP=VE=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tiX9s-0007nL-R2
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 11:13:29 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061a.outbound.protection.outlook.com
 [2a01:111:f403:2415::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8c244b19-e9fb-11ef-a075-877d107080fb;
 Thu, 13 Feb 2025 12:13:27 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by SJ0PR12MB6879.namprd12.prod.outlook.com (2603:10b6:a03:484::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.12; Thu, 13 Feb
 2025 11:13:21 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8445.013; Thu, 13 Feb 2025
 11:13:21 +0000
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
X-Inumbo-ID: 8c244b19-e9fb-11ef-a075-877d107080fb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DZw8e+h63ggEd8stDE91M9J2Ka7VZI4aP6n00r7khYcPacE7fb5qFYiFXOrKRKaAAHJ03G7cQxQ/JPSXahtzYqzo6KVNoDPE4ADTon/t5nVVzGbimQ2apF2YfIQJmJSLqPYJ7bRjkUNwd2UbYDqQ1jkQVqbjNjiLVmgGjTOZY8dED9NBFleGXdH+4e/y76pJIh2WO5nr2jQBeHyHI36ggtvt0YFUW2S65IsDR46wMPQMs/tvWs+j2GpSxb7rAetS4vvxLBJN99J/dQT2M+2ev0k+jlwLiqHUpQXyFX6oSS18jOR9VU4mibQo1ciMrcMKGb0vfIPQtBXova9o+nLvsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F1Iq0emRXi6rsbGfOh86r7xvMmidAmSibWXeYMYF6eI=;
 b=qfeX/VprwD5eCSnY1ll4+fl6Q06e6Xv971/+8MnTZmsp0z5XtEHryAdfSQrQTOp9DVriawB7Ba5YdOoyNkOzft/BQsEI+LeqDoOrU2eMC/1lJ5dz9zbHqzJbZiiV2Rw5jtduuQHkgXBV/UPAg9Fs2N7stqjn075xNJZiEi/W6uD6+Kstt0B4+Dl1DsRLQp733DR/JYQsG3riH/fFoBM4mwFupm7uztfZZPZQBF1xWzL+YRCU0mkxj5qMepd4Hp5JYg65OvmQsiScKLjeQkaouncXWc8lNzGF5i38IYndSg5Gza86+HW+2NlHiC6ORDene7EZ9zcG/IKHe2ae5plSwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F1Iq0emRXi6rsbGfOh86r7xvMmidAmSibWXeYMYF6eI=;
 b=esRh0Hqhss0xzh4Z4+W13hM3EjO5WdDoZumB7In5oRr65IDn1CnNH4zAMYnPaXGDrZczD/ug8Ih7vWalF/qnX0I5N4il0cA+6BcTV5UIJ96Upxgzm9g36lym2k2SlJIZ9eepQMq+lIz+J/JSdPqrnbQHXFTCavjEBApvFQuy0XM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <512481d8-905f-4c8a-b289-e4ef1db1cc39@amd.com>
Date: Thu, 13 Feb 2025 12:13:18 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arch: arm64: always set EL=1 when injecting undefined
 exception
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250212144950.2818089-1-volodymyr_babchuk@epam.com>
 <alpine.DEB.2.22.394.2502121403410.619090@ubuntu-linux-20-04-desktop>
 <8abc5358-d0e4-4589-b0d1-1fb5fa6aa86d@amd.com> <87v7teyul3.fsf@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <87v7teyul3.fsf@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0078.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::7) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|SJ0PR12MB6879:EE_
X-MS-Office365-Filtering-Correlation-Id: 2db1aa0c-3e33-4689-8e0f-08dd4c1f6d15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WWFiaXQ0Y0huTUVTU2hmQngvbTN1b2Z5ZDB5d3hwcm9SaUZEVEZvQmRGY1c4?=
 =?utf-8?B?TkdrRVVJbHI4U0JPNTYzNWdOVEorR2xxMG9jZzd3bHlMM1lkaDl5RmJqSmcw?=
 =?utf-8?B?L3J2Wmt6VnB0dkdnK3Q3NXV3TWJJRFdKMUc5SnFOQkFMdk5xbkloeDBJTnNI?=
 =?utf-8?B?eU9YOHFQaVN6SXZrY0M0NFRLdHpVYi84Sjdzbm1GeEFmSlJ4Y09KUUdiNDhl?=
 =?utf-8?B?SnUvbXphT2JpL1RWdy93d04vd1RHUVJ6ZzFXd1kwYTd6ejhKdTluNWp6cEhs?=
 =?utf-8?B?Qkt5TUFHUjFlclRqbW1rOFg5eVI1YjloNkEvWkhKMUxRbUxHeUxqdThTUHhx?=
 =?utf-8?B?ZUY5dWFhaGRSeVcwUzZ2WjFRd0dHWW9sOVRqS25RaWlTVDJHR3Fkd0RtU1JM?=
 =?utf-8?B?YXd2RUdLUXQ5blM1OE94L3hMSnpTcGMrS1RSOUhyRmQydlpWV3RUc0VzbUNC?=
 =?utf-8?B?UUdwL2hNVDRSWk5ORW9PbW4xOENxeUwwY0hqVDk0MHZ3a1plTVhjZ1ByT2Zm?=
 =?utf-8?B?Y216cXcxUlRjYnFSaUlvcFRlUTZScUpIbDh3QWxtY01PUEFnOUp0VFM4VWxz?=
 =?utf-8?B?bHF6VGhDRTdFMDNBbk4xWU42RGtaVnhYOUNyeEg4SWFsTHZKbWZOaVJ1Y2U3?=
 =?utf-8?B?SXV6Yk56QjJqMytRYWx1TUp2ZDd1cGpoTldGWE5kTDBGTVhmR2dvYm53aExt?=
 =?utf-8?B?ZFdkbW9RdC9xaUorSFpiZWI5SzBUK2tzQ1lGSkgyY2IrdExIS1c1K01IK1pH?=
 =?utf-8?B?cElCM1U0a2dwdmRMek5LT3V1RmlVc1dUUUxyUE9DMGxldnoyczY0WktvYk5P?=
 =?utf-8?B?b0ZpMmJ6cHg4djFVdEcyTWZYenEvbWtUOEczUW5tL052dEZ4S0dmZkI1M1NI?=
 =?utf-8?B?ZWg3M2pjNlBOWEVvQmtDUW1SOEFrenhZa0pFSkplU2dKcWFBaEp3Qm4zYkxT?=
 =?utf-8?B?akhqUFQyelJTMzYvVEJadDh6cFBtTjdobVRBL3dzS0dSOURFZDlOaE43dUpD?=
 =?utf-8?B?c1piMmh0cTMxeXBQdUpKUGZ1aExSdmNZdkFWbkp0V2lwWUlTNzdrQ3loYkNi?=
 =?utf-8?B?T29LZkkrTGhEZzQzTXNZNmFTakcxeDRmT1ZwZFlPSklkaDB6YVRvZHJ1aW02?=
 =?utf-8?B?OGxhNTY1a3l1ZnV1VTVKT29EanBPU295MHFVODVpYk8rdkZaczcwbjVwdGJx?=
 =?utf-8?B?eG5DZmI1bWc4RHkzQVMvczhvWVR3d0c3azdiNXBIbEtiZ1FzREhwaDhPamQr?=
 =?utf-8?B?TXlNaC9tNkN5RGdGdlpnODV4SUFJSEdweGNRVjZhWDF5OEZWc2VBUGxCZDE1?=
 =?utf-8?B?NmhzVzJDOXJQbXhvN2J1QktkM2llT0FLcUdjR0Z6UnlkOVYyNCszSXhkMksz?=
 =?utf-8?B?dW82a0dvRko0cCtianlHSC9abGpjaFN5dEdoaEoxdmxGVzZNR1dIN2JlTURr?=
 =?utf-8?B?b2swOUNpakVNWWRJTFlCblVUNU1DSEV4ZkVyWktaeUFSMSt1T2FidlJmY01O?=
 =?utf-8?B?bE9yejhTQzV5ZXE5dmFwUFg1bHVvdnh6QjNnOFdrRE1xaTIxd21WRk9oVjc5?=
 =?utf-8?B?L2RUWWI5aEZrempDRTNuMzE0REczbmlQUG1TdXZZR3lrbFFjdi9McEZ5NThM?=
 =?utf-8?B?ODRYcXBoR0tDWVo1U1VSMFRRQkxiSmcwcW1TNWpidWpXT3YwcHY0SERyeURv?=
 =?utf-8?B?d0lRdjRFay9GMHJydlY2aThvU3ZGZGZGOUVqTm5iM0FNUnMrbEdMcVpuYlIw?=
 =?utf-8?B?V1dJbTEzRSsxYXhSaEN5am9WRlYxTEpmN2NvUWg0WFY3OEQvY0hrMjVFMDdi?=
 =?utf-8?B?QUVLWUI1Tml4RnFRVk84WHVZYXNYL1h2NEdrYzlvYmJQVkhSVDAySkFSbkhD?=
 =?utf-8?Q?wcO7nWutqZPzG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M2EwN0U0SlpzamZQY0JSRHRCV1dkcVkzQ2VpK05RL2s4dmFZdnRESW96d21v?=
 =?utf-8?B?Z2lkTzBYYnN5dndjdVBGR09nd0hmZVZ6WWg0aUVYclkzSG9YMXhuaGhMMWJq?=
 =?utf-8?B?TUdaVkZlcXhjVGZPSVFtK1FGckJNVkh4RDNqYlh6cUFLVURPQzhGeUFxYXFX?=
 =?utf-8?B?SnVBTzFSR1BReWJDc3Q1TFNxN0VBOEZIdWp1dWhpcVRWTVVxZGpXYWxjNnJm?=
 =?utf-8?B?UFA4dklGUFI4bUxobG8zWGxLVHZNZzRORGFXUGEvMExYdHFReFdTekVHVDJS?=
 =?utf-8?B?bFZqdDJaV09NejEzT3lKVmJQYzBtYkhma1BtakVPYzBOY295dEt1ZVRodnZx?=
 =?utf-8?B?QU82S2Iwb1VZNmU0ZFZaSnd5NWZPUjRYRDN0SjhhdjdVQ2tpYU1xM2MzbUx2?=
 =?utf-8?B?OGVVQzJiK3B1VTdzOGVMd01HSlpxc1FDVXhvVmVOR2JSbEM0emd2ZWt5NGti?=
 =?utf-8?B?ZFYxaFdNSndmR25sNUpPOWQ1b3ovMEsxTWRxMk41ZzdXNUdCTmlJNmhKR0hz?=
 =?utf-8?B?RHZqaGxwcGk2djl3aVdXTmpja28wZnQ2L2F1YTFXQUU3SWtPUWN1SlBWVC8w?=
 =?utf-8?B?OFJSUVdLZEdMZXAxbzl1eXpmQjR5Zk1uVXkwaFY1TytGK1VVQ0FoN2hCYUZj?=
 =?utf-8?B?bm8yODlEYTRlV0kvQWtlOVRST0pGbTQ5K2ZyM2tHS2Z4Zmh3SjZTVWY3WUlC?=
 =?utf-8?B?Z1FPV1lXQm5SbEtOWlRSRTVCQVZWbFJNUUlSRWpFbldwbzFRWFI1RzdLTzBR?=
 =?utf-8?B?ZVVvV2J3b3NCMFNodlE0U0YrU3ptMU16bWV5S21DUU5iZWpQWVZySURPcm90?=
 =?utf-8?B?UDV5aWUraytVeDM4c2JJeDIydGlYSlV6SkNCSlpYQzNhdGxOYm5zR3RqcHFu?=
 =?utf-8?B?R1ROWk5zNDVMSm9HeUgwYUk4UEdFdTBMVi84U09TdUd3MWVTMWV2eC9QTDNi?=
 =?utf-8?B?bXR5SjdFelg5N0tXbENHU1FUTUlqcElaL0M1TWl0amROQlNmT0FKR1dOMkJv?=
 =?utf-8?B?ZXVIcDQraDN2RXpkODdBMmNOZ2YzV21RV3BMVDV4QWYzblJRVThiamRXR1lv?=
 =?utf-8?B?RzN0MmN0aVMvNGlYZFNHWGVLdVdxLzhYZjMvcWxRMWlSYktCRTVCK1NDb3NL?=
 =?utf-8?B?VkZ3ME5FanpNb0RQN3BpWEE1QjY2ZEU3dXVqOERRRHhBZlhQUlRvc0toNmlS?=
 =?utf-8?B?M0dOV08yZldZSG12S094dExTZFlreHBuRGVVMWpNMUI2Y2x3RlRHbXNqMnUz?=
 =?utf-8?B?Z0loUElvQmVnMitaU1F4ZXcyT29vQzA3c09WaDJUSEVVTEQvUGVOYyttSmV1?=
 =?utf-8?B?Vk9GcjIxS3R4SlhzZ1Q1UXpwY1dCOFpncm9TQ2xHSUpCOUt2alFVQ2tXNzhY?=
 =?utf-8?B?WDRZVDd2N0I0WU0zSFkzeTllQXJTb3B3eEUvbXlBRisyWloxZk5PZ2ExMDFZ?=
 =?utf-8?B?am0vNG5ZRis3cStweGNNOXpXUjJ3d3hyV1dlc041dlFPV042cHBDU1pvSVNC?=
 =?utf-8?B?dHorMXlBZ0pQL3FCVk1uajg0enIwL0dmb01WdHlsUUdtR3A0WnB2cU1rbFh0?=
 =?utf-8?B?cjhLaTVpT3VXa0tWQ1NJYUxnMHo0THh2QXd0SWcvMXB0MDdwU2lMNkVBd2xC?=
 =?utf-8?B?U3JBMkh1cENFNCtrbi9TRzNwNzJ1ZjJjdFovRnRMd081eStMUGVXczlib0lC?=
 =?utf-8?B?eGozeG5hR0lMSlE4dEs2OS9keFRGN3ZGcFJrRWd0akZJWkEwQUl4MU1pSEtL?=
 =?utf-8?B?ZnVzaEV0eWVpekVmaU1rVFRJaUFrL2xsOEpXRkZtY0VnR1VKNS9UOVFCeTVZ?=
 =?utf-8?B?WmZlT2MwcUxBb1NzbHhrcyt4Ly96TlRlRVlocFA3ZWtmaC96Z1ZSbmhQR0ND?=
 =?utf-8?B?VjBBNkRWVEE0NHd2WSswcFdTSHloYjI0Z3JCTm1Pdk93UTB5YWF3T1J1ZU9N?=
 =?utf-8?B?b2lZSU95bHBBWnN0QmJWaFBISnduQjRUU2dUcmtablFFOGdzMnZRWnZTMy9p?=
 =?utf-8?B?ZW1QeC84cWpmeG9OV0tyRUJDQ0UwRkxCZTBKOStYOE01OWNWclVnQkQ1cEJs?=
 =?utf-8?B?UjlSa1V4QjlxU3o1Q0U0RmpGa0Y2aWp4bytya1VtN1ZscmUzcmJ5UHBId0F6?=
 =?utf-8?Q?G/iY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2db1aa0c-3e33-4689-8e0f-08dd4c1f6d15
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 11:13:21.6139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ljae9NL9NPknR37GlsXEWi5CJdcVrvTawEK4HukcoUm3AguqZrCi5JT/V2l6Xn47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6879

You seem to have accidentally dropped xen-devel. Re-adding.

On 13/02/2025 12:04, Volodymyr Babchuk wrote:
> 
> 
> Hi Michal,
> 
> "Orzel, Michal" <michal.orzel@amd.com> writes:
> 
>> Hi Volodymyr,
>>
>> NIT: s/EL/IL/ in commit title
> 
> Sure, thanks.
> 
>> One remark below.
>>
>> On 12/02/2025 23:03, Stefano Stabellini wrote:
>>>
>>>
>>> On Wed, 12 Feb 2025, Volodymyr Babchuk wrote:
>>>> ARM Architecture Reference Manual states that EL field of ESR_EL1
>>>> register should be 1 when EC is 0b000000 aka HSR_EC_UNKNOWN.
>>>>
>>>> Section D24.2.40, page D24-7337 of ARM DDI 0487L:
>>>>
>>>>   IL, bit [25]
>>>>   Instruction Length for synchronous exceptions. Possible values of this bit are:
>>>>
>>>>   [...]
>>>>
>>>>   0b1 - 32-bit instruction trapped.
>>>>   This value is also used when the exception is one of the following:
>>>>   [...]
>>>>    - An exception reported using EC value 0b000000.
>>>>
>>>> To align code with the specification, set .len field to 1 in
>>>> inject_undef64_exception() and remove unneeded second parameter.
>>>>
>>>> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>>>
>>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>>>
>>>
>>>> ---
>>>>  xen/arch/arm/arm64/vsysreg.c           |  8 ++++----
>>>>  xen/arch/arm/include/asm/arm64/traps.h |  2 +-
>>>>  xen/arch/arm/include/asm/traps.h       |  2 +-
>>>>  xen/arch/arm/p2m.c                     |  2 +-
>>>>  xen/arch/arm/traps.c                   | 24 ++++++++++++------------
>>>>  xen/arch/arm/vcpreg.c                  | 24 ++++++++++++------------
>>>>  xen/arch/arm/vsmc.c                    |  6 ++----
>>>>  7 files changed, 33 insertions(+), 35 deletions(-)
>>>>
>>>> diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
>>>> index c73b2c95ce..29622a8593 100644
>>>> --- a/xen/arch/arm/arm64/vsysreg.c
>>>> +++ b/xen/arch/arm/arm64/vsysreg.c
>>>> @@ -95,7 +95,7 @@ void do_sysreg(struct cpu_user_regs *regs,
>>>>       */
>>>>      case HSR_SYSREG_ACTLR_EL1:
>>>>          if ( regs_mode_is_user(regs) )
>>>> -            return inject_undef_exception(regs, hsr);
>>>> +            return inject_undef_exception(regs);
>>>>          if ( hsr.sysreg.read )
>>>>              set_user_reg(regs, regidx, v->arch.actlr);
>>>>          break;
>>>> @@ -267,7 +267,7 @@ void do_sysreg(struct cpu_user_regs *regs,
>>>>      case HSR_SYSREG_CNTP_TVAL_EL0:
>>>>      case HSR_SYSREG_CNTP_CVAL_EL0:
>>>>          if ( !vtimer_emulate(regs, hsr) )
>>>> -            return inject_undef_exception(regs, hsr);
>>>> +            return inject_undef_exception(regs);
>>>>          break;
>>>>
>>>>      /*
>>>> @@ -280,7 +280,7 @@ void do_sysreg(struct cpu_user_regs *regs,
>>>>      case HSR_SYSREG_ICC_SGI0R_EL1:
>>>>
>>>>          if ( !vgic_emulate(regs, hsr) )
>>>> -            return inject_undef64_exception(regs, hsr.len);
>>>> +            return inject_undef64_exception(regs);
>>>>          break;
>>>>
>>>>      /*
>>>> @@ -440,7 +440,7 @@ void do_sysreg(struct cpu_user_regs *regs,
>>>>      gdprintk(XENLOG_ERR,
>>>>               "unhandled 64-bit sysreg access %#"PRIregister"\n",
>>>>               hsr.bits & HSR_SYSREG_REGS_MASK);
>>>> -    inject_undef_exception(regs, hsr);
>>>> +    inject_undef_exception(regs);
>>>>  }
>>>>
>>>>  /*
>>>> diff --git a/xen/arch/arm/include/asm/arm64/traps.h b/xen/arch/arm/include/asm/arm64/traps.h
>>>> index a347cb13d6..3be2fa69ee 100644
>>>> --- a/xen/arch/arm/include/asm/arm64/traps.h
>>>> +++ b/xen/arch/arm/include/asm/arm64/traps.h
>>>> @@ -1,7 +1,7 @@
>>>>  #ifndef __ASM_ARM64_TRAPS__
>>>>  #define __ASM_ARM64_TRAPS__
>>>>
>>>> -void inject_undef64_exception(struct cpu_user_regs *regs, int instr_len);
>>>> +void inject_undef64_exception(struct cpu_user_regs *regs);
>>>>
>>>>  void do_sysreg(struct cpu_user_regs *regs,
>>>>                 const union hsr hsr);
>>>> diff --git a/xen/arch/arm/include/asm/traps.h b/xen/arch/arm/include/asm/traps.h
>>>> index 9a60dbf70e..3b40afe262 100644
>>>> --- a/xen/arch/arm/include/asm/traps.h
>>>> +++ b/xen/arch/arm/include/asm/traps.h
>>>> @@ -44,7 +44,7 @@ int check_conditional_instr(struct cpu_user_regs *regs, const union hsr hsr);
>>>>
>>>>  void advance_pc(struct cpu_user_regs *regs, const union hsr hsr);
>>>>
>>>> -void inject_undef_exception(struct cpu_user_regs *regs, const union hsr hsr);
>>>> +void inject_undef_exception(struct cpu_user_regs *regs);
>>>>
>>>>  /* read as zero and write ignore */
>>>>  void handle_raz_wi(struct cpu_user_regs *regs, int regidx, bool read,
>>>> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
>>>> index 65b70955e3..6196cad0d4 100644
>>>> --- a/xen/arch/arm/p2m.c
>>>> +++ b/xen/arch/arm/p2m.c
>>>> @@ -438,7 +438,7 @@ void p2m_set_way_flush(struct vcpu *v, struct cpu_user_regs *regs,
>>>>      {
>>>>          gprintk(XENLOG_ERR,
>>>>                  "The cache should be flushed by VA rather than by set/way.\n");
>>>> -        inject_undef_exception(regs, hsr);
>>>> +        inject_undef_exception(regs);
>> There's nothing using hsr anymore, so you should drop hsr parameter from
>> p2m_set_way_flush()
> 
> You are right, I'll do this in the second version. It is strange that
> compiler didn't warn me about unused parameter, though...
You would need to explicitly set -Wunused-parameter in EXTRA_CFLAGS_XEN_CORE.
There are other issues there though.

> 
>> BTW. Are you going to also look at simplifying e.g. inject_iabt_exception() for
>> which IL is also 1?
> 
> Yes, I'll add a separate patch in the next version.
> 
> --
> WBR, Volodymyr

~Michal


