Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC01A5BD09
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 11:00:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907631.1314839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trwPF-00044p-U2; Tue, 11 Mar 2025 10:00:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907631.1314839; Tue, 11 Mar 2025 10:00:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trwPF-00042l-QV; Tue, 11 Mar 2025 10:00:13 +0000
Received: by outflank-mailman (input) for mailman id 907631;
 Tue, 11 Mar 2025 10:00:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5FZT=V6=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1trwPD-000429-E2
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 10:00:11 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061b.outbound.protection.outlook.com
 [2a01:111:f403:2413::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c938cd9-fe5f-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 11:00:08 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by IA1PR12MB8334.namprd12.prod.outlook.com (2603:10b6:208:3ff::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 10:00:04 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 10:00:04 +0000
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
X-Inumbo-ID: 9c938cd9-fe5f-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fTckzv3AUdFhxyQ6o9SuzOeAvfZjiKNeYDj0TOpV6PEQ2pbVjMTVh7VVeslJO4CfEJWATk4Hnumd071dW3rp1DxuyFL16GsXuV2vnk5sYz5+qRM+VYDgEZzO8puEhpqrGaoYiDIcnkzgHqBSMRBsHsKRiyYlptVRAQfeali5esx3zrdUVfTtq97l89LFJfO+v6cL3HZxLYHgNUyiO4tMIV9+wQ5VfLwWzsYSVCTxRl4wdiaiH+QPvT1Idsb/SYBI5J0X4mYQxOqBM3qoZj1Dd/UhRvKGXCg9U6Up3tZrVho5BX0QaxcS1v14WzF7nHRxbjNq5DHuNC2yPnEQIODoKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t4i8NrnN2qPNpveCz1AjIt9LUq44osQl1nmbGk2yVJY=;
 b=HoynZr1qn0npcdhKgxq1tbO8O6HHtfSLPyAwrKbX9L21uU3W1zg/ls+X7H1JH+DpKFestbrCfFK+Z29MmJN3NrYB+bDT5qS21aSunGYrh4WOgZaAyqC6H9VJLEMaUIcwMGsvojTlXSpTySzMXAkxkrmTWWzeAqPA0pvJ/4GjKk8tN+X4d8CTbMhIraOmr07ux9/O+vUaX9DinRsVKTDjxK9ZNtOHFTTeYxSuyJj8RXA6Zn4s4CNx2MnCxhbGWloMGSciPEhNO2/9lpZpavyNkb2R2E6geMkMY2OQMvH0OEmm53Ay0lhl3C86WT7MUal780BOzwK6a/bVLZE7Wujg4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t4i8NrnN2qPNpveCz1AjIt9LUq44osQl1nmbGk2yVJY=;
 b=b4+1SQ7/hkhrusB/wmLcRzjYXDSq2owf5sFvHpeUzeEFO2Q0zCljSy5HIo2Hzlq01yZZMAm6tgfHEKL693W/qWdqv3vFMRPwO7wH9bQpicdcJPBIKFULAXlnG0gceEbx0xHonZVBFfIy9riEwtSFvnJdMatDVA6qWgteNgVGp9o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <2d66e9e2-e6a4-4552-960a-2e8d95555ff4@amd.com>
Date: Tue, 11 Mar 2025 10:59:58 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/arm: Improve handling of nr_spis
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250311090409.122577-1-michal.orzel@amd.com>
 <20250311090409.122577-2-michal.orzel@amd.com>
 <69E0A550-5B43-4AE4-AD19-0456AA280871@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <69E0A550-5B43-4AE4-AD19-0456AA280871@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0252.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::17) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|IA1PR12MB8334:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ec7361e-4f1e-4f49-0f6c-08dd60837ef1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S2RJY25KQzdVM3FVU1RIZlZqdlVNdURDNTlpK1kvMVIxSkx4Qm9wOXVIMjZD?=
 =?utf-8?B?QmZUajhvR3hpaVZ4TUovSFBmZU1xakZCbmcveG9xaEk0QktnN29hNWdFZ2xU?=
 =?utf-8?B?eGhrOHRydmxrb2pqWlFMcUFsU2pGaGowWmgxOHdWMDJBSFdTS1c2N1ZJRUQ2?=
 =?utf-8?B?TjdiS0J2QStDaC9QOWlpVkhTMGhoR2hOOGYyODQ5UVRlK0FZcFZ5YjAzbmcr?=
 =?utf-8?B?RS9wYkk3UmU2QmVGMUdoYjFiVndkWWR3U2tWdlBrYmRocE9UdEF6d2tWOUJC?=
 =?utf-8?B?Ti91TERCT3hOa3psTzIwd01Qd0V6YkV3UHFOaUp5NzNoVDR4M1EvUmxhR2po?=
 =?utf-8?B?TVlRblhCQTBwSWdBQjNmdU53aHlBOVl3eVRQYVBhdjVreWRaYlVmT0MvQnpF?=
 =?utf-8?B?WExMc29rOUJ5b2dLY3hScjJaZTNnSk9LV0ZwNzgybWtxTVV4Nng2T01Ka2dS?=
 =?utf-8?B?bWcyckUzY29ZYUJ0TU1SMzBNcmNWbjV0WnNEQk80QVZkalJvNEJWY2doRzZh?=
 =?utf-8?B?TWhqQUpMYXREVStJamZyQVN1TTZDa0xITmhJd01wY3ZWSVpleHFmcUUrbFRl?=
 =?utf-8?B?SHZ1dm9RTWJHdVg0UTVVa1ZiaTY3cTRZNUFjRGgvRjVtcnRCaE9MN09YUUx1?=
 =?utf-8?B?dEFrNGg1NXcxbkhaYXVHNUJRVWhCSk9aSVFWZnJ3ckNGNGUzZSs3ak5ha2J6?=
 =?utf-8?B?Z1NKTVJxQUtXS21HUTZhRVl6aWZyS29xMEV1aDZMVmFUYm5YTkVuSExhdFBm?=
 =?utf-8?B?OExaS0xGWitNNGtTWE90OURKNFdwYTYvMnp6TmZOZHhrZkUyUGEzNUs2MzRC?=
 =?utf-8?B?blhZakE3Ykx5MmgvaXRZNDBJUDQwS21SSjNuMDZTS3RGTS9SOC83a3g3TTVF?=
 =?utf-8?B?Qkd5YjFnZENDcVB2WWhXTGVCVE1LalFWc2JKVEsybGJvSFJLWU5MYXZJMWlq?=
 =?utf-8?B?UDJQelZFUnFFbENyYUVDR2ZQckRQY1VjRmV3KzdmWkppOUg0YTJTcm1ZMEtV?=
 =?utf-8?B?VlM4ZzNpTm9CamFzdi9BaHBrcmpMbXhXWFVyVlYyTXNPOFcrTFY0OVdEbzFo?=
 =?utf-8?B?M2Vmb3dsL1JKKzVYN1Z5dGUzQkl3NXhia1NCQTZDMzN4eUtXbWIwY0RuV3Z6?=
 =?utf-8?B?eVc2TU8rMzU3eEVYN2xpT2diYlJRVXJBdTNzcGpIdEtrYVJsQWtwNU5GM043?=
 =?utf-8?B?THIxaDZuOFgvanhlOVArcFluWG1EVU1oZTNlTXhoVUxmT0pSdnlIeExITG9D?=
 =?utf-8?B?QmVDckRpc0lVWmloa2E2bTRrREkwL1pIUlk0UWFwZ1VTY0tmN2h3SnhoVWwz?=
 =?utf-8?B?NnlIa1V2d2ljQ291Z3ZmWmhZSHpNRWtnMTV2am5za0xTZGdFQzJOZ2hTajJJ?=
 =?utf-8?B?dXdaVmpnbmlVSHZCWU04NGNjcFk5SDRnWjhubGM1NlNvZXV5NC94anV4WkFS?=
 =?utf-8?B?TldLU0RFa3BYSVpmY0dIQUsranZaYXZoci91Z3NwTGRaQTlQK0xlaDB5RjRN?=
 =?utf-8?B?NUtuZmZKK28wbUpVdFdKeFNHSitiMHBPTWNQSG1vdWVDQzlJdjZ4REphSEdo?=
 =?utf-8?B?UlJmaW9HSERTaldaTHRMUUVqbTBuZHp3TDl1bHZSQWZISjVGcnliK2FiYnI4?=
 =?utf-8?B?QUorK3llTHp6Y0RRTGdXQ1dtZTlxOTQ5cXpCa1JDQTcwbnNORWlIWThpOTQv?=
 =?utf-8?B?SkFTM1JXTkRtRmRvVE1DM1diUkp5ZUczVlVhRmJlM3B4VFp0SVpoZkh3YUNU?=
 =?utf-8?B?K2UwMlhRL2h2MnZWMVFEUytMYXlReFF6N3ltdGZkcVAwMk12SHhKR3dCcS9U?=
 =?utf-8?B?WGhHWDJFaUZIUDFNM0pCWE96WSt1Z3l4WEt3a3g1NWR4bzNPbFNGRkl3a1Fq?=
 =?utf-8?Q?p/Jcf5eTaDRiR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dDV6aEJURzErQWNxem1YTXR2TkVlK3cvQ3J5OHBUM1luN0ZjUUdrYnRzQy9U?=
 =?utf-8?B?OWwzelBtRzAxRnRKYWs0ZVJlVnMwb0JOYUt1U0hpUmxuYkJqY3dyTE9aOUdB?=
 =?utf-8?B?d1l1dUNkZkpnZjhKWmJNWUpzUE5VSS82eHV0T1FkQWkyMW1QamxmSWxETTYz?=
 =?utf-8?B?dCtaQlRHai9GU1lZdGNhazBZSTRMUytDM29FQVI0SjVGNG9LYWtnOG9VWlRI?=
 =?utf-8?B?bTh6Y05DbWh2VnptREVmTks1STUyd0lzck04ZXJkWmFIWUR6aml3RXVGZU0v?=
 =?utf-8?B?Rm1XMEZjNVpwZlE2ekhsbG02VmN4MmovYVMrMDBSdUViUEtXaTRXLzBSeGNV?=
 =?utf-8?B?R3BDZE05YlpOcVdITDBONEdIckhCZVBlVmZ6cDJTWnJ2eFRwQStzRlNRWDNs?=
 =?utf-8?B?STdGdEs4NWFEd1lUbXA1UkxoZHI4QmtEdkZ1R2JHOVNLY2kzVkNWbWJpZ1NC?=
 =?utf-8?B?WXUraEhlQXRDWDFMNVd6ODdueUdoanNGQXpzd0k5S3pBWkZCamdvWE9aZnI3?=
 =?utf-8?B?ZFkvMndRaGVCMFlkSEsyLzVtWHZQY2JQdXh0MzhFWDdVY1JJeERQSGxvSHNP?=
 =?utf-8?B?ZlJpTlk3NXV5bzZzT2Z1M3NDSmZkSnVlZHB4ZXZ6U0NpTG8wbnd3NVdHc01r?=
 =?utf-8?B?bklIb2lMSEpFSVhxUE94cDRhd3dqdEtUOThFbmZBd04rSHVzK1dzSnc5SWsv?=
 =?utf-8?B?QzJzZkU4WDNiQjYzVDJnK0pIUUNlelZWKzJFdFdJUVEySENqYnE2aTArSzJJ?=
 =?utf-8?B?NUNnS2pYanhoTkRucjA4R0V4dUVUWVMwZ1JRc2pKeG0xdFRNREtQb0ExbnRr?=
 =?utf-8?B?dGJTcUlDZEw4UHEwU09jNUJyei9GNTd4SHpuckJuRStNODBVT0tIYThDenVB?=
 =?utf-8?B?SFY2a2t3aGw2ZmZDQTQwcjNVNmdlMHdiOWFwSkdtZ0dPSDFVVktYeTAyZjdV?=
 =?utf-8?B?RUExcmVPUGY0dlB2L2Z0TnlDMVR5NG1UREprczJNb1BPa0dTU3pSZDZMNXI3?=
 =?utf-8?B?MlRYbzBCRTRHN00wbzNCODZkNUNEdlRZd0pXR3VWZ2lzZWVxaXlRT1JrM3NQ?=
 =?utf-8?B?RGRsaDRLMzNEZUpKd29hazNyOGxVdDBCZ0JmR0tsWmY1a1BoQ0hLazJwRGRt?=
 =?utf-8?B?WXB0VzdadmtSOXRhdmU1cWd3cVJtTXJmRnFQeFV6VXVySGJ6SWp5dE5MRHV2?=
 =?utf-8?B?b2JieUswQ0d4MVFrQjQrRTM3d0xWL2xmNDlKY2VNSDlmdWxEYmdWSnF2UXdk?=
 =?utf-8?B?MjAxMzVaanY2VUtjUndpckJGVVZKTldONllDWWV3OXQyVy84MEh3YS83VkNn?=
 =?utf-8?B?NGprYTZaSGIyK2pqL3NXQ2VhZEt6MHFGY243OXFwNVVrT0VobFZZaHBGWmV6?=
 =?utf-8?B?TStLdVlNckt1MDF6cjRUTTFrZTU4R0s5RUx0dzcwSmU2cWhwdGIzOEVWWnRl?=
 =?utf-8?B?S244MTgvVVRiL0JITkpGb244dDY4cG92cGxCWnV6cU1iTWFIUzRPSVR1Q2Jo?=
 =?utf-8?B?enlCVk10NDRPUk05c3Y2M0wyUWdpcWc1Z3BPMnJaVnd1TW9PSDdEVnJ1Nk5W?=
 =?utf-8?B?VnpobGVZamI4Q1RxZVp1akNqZmdESG1pd1lNRjBsRUVKNGUzZ2oyMm5UeU1U?=
 =?utf-8?B?U2pSdFVkalE5M01FZ3RlSVBwbjdCVHJiYjBSOTVlak56RWw4Qzl0N0FHajQ5?=
 =?utf-8?B?N2hZK3VUVER2SDB4NTlEa2tUbnF3blpHcjZYSDkxR0ZOSERkN3ZkMGdBaUFO?=
 =?utf-8?B?Z1BLeUtHZEZFbHVVaUFPQ3NBWVRySG5PT2E1ak5JdDIwUmVzc2Y1MTRRQzNE?=
 =?utf-8?B?WXFlYThjekFSbkQxRUVKMGdZZlhmUEFoN05YVWV4K1BRUnRjbEI3SHVEay94?=
 =?utf-8?B?VWJJNXVzYWU4blBUWTkvbkNlc0tyKytUZSs3dE4zbmFydEQva3dWSFhwRTRo?=
 =?utf-8?B?L05oVUZXa0F5NEVUdnZ2K2ZYZnNTTis3RTVDSWlta0pQbWY5UmVtazJkbms0?=
 =?utf-8?B?SWdIRzBkKzFyRDBPaWlvNm5YcFdCbkpPVDhERm9PSUJSSllyQXZGUDZmaXBP?=
 =?utf-8?B?NUlVaVdKaHI1QTNQY0lhNnJJbDFRYlFuMjZ5UDJiQ1pqRnd2Ti9MNnpBK1lk?=
 =?utf-8?Q?BkA4=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ec7361e-4f1e-4f49-0f6c-08dd60837ef1
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 10:00:04.5201
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M6e24cgPzEZoP6cVUSOQT/w0p4pIBV+KhU8IrasYCFQugWiAGlgrCP9vXUOkhIVY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8334



On 11/03/2025 10:30, Bertrand Marquis wrote:
> 
> 
> Hi Michal,
> 
>> On 11 Mar 2025, at 10:04, Michal Orzel <michal.orzel@amd.com> wrote:
>>
>> At the moment, we print a warning about max number of IRQs supported by
>> GIC bigger than vGIC only for hardware domain. This check is not hwdom
>> special, and should be made common. Also, in case of user not specifying
>> nr_spis for dom0less domUs, we should take into account max number of
>> IRQs supported by vGIC if it's smaller than for GIC.
>>
>> Introduce VGIC_MAX_IRQS macro and use it instead of hardcoded 992 value.
>> Fix calculation of nr_spis for dom0less domUs and make the GIC/vGIC max
>> IRQs comparison common.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>> xen/arch/arm/dom0less-build.c   | 2 +-
>> xen/arch/arm/domain_build.c     | 9 ++-------
>> xen/arch/arm/gic.c              | 3 +++
>> xen/arch/arm/include/asm/vgic.h | 3 +++
>> 4 files changed, 9 insertions(+), 8 deletions(-)
>>
>> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
>> index 31f31c38da3f..9a84fee94119 100644
>> --- a/xen/arch/arm/dom0less-build.c
>> +++ b/xen/arch/arm/dom0less-build.c
>> @@ -1018,7 +1018,7 @@ void __init create_domUs(void)
>>         {
>>             int vpl011_virq = GUEST_VPL011_SPI;
>>
>> -            d_cfg.arch.nr_spis = gic_number_lines() - 32;
>> +            d_cfg.arch.nr_spis = min(gic_number_lines(), VGIC_MAX_IRQS) - 32;
> 
> I would suggest to introduce a static inline gic_nr_spis in a gic header ...
Why GIC and not vGIC? This is domain's nr_spis, so vGIC.
But then, why static inline if the value does not change and is domain agnostic?
I struggle to find a good name for this macro. Maybe (in vgic.h):
#define vgic_def_nr_spis (min(gic_number_lines(), VGIC_MAX_IRQS) - 32)
to denote default nr_spis if not set by the user?

> 
>>
>>             /*
>>              * The VPL011 virq is GUEST_VPL011_SPI, unless direct-map is
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index 7cc141ef75e9..b99c4e3a69bf 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -2371,13 +2371,8 @@ void __init create_dom0(void)
>>
>>     /* The vGIC for DOM0 is exactly emulating the hardware GIC */
>>     dom0_cfg.arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE;
>> -    /*
>> -     * Xen vGIC supports a maximum of 992 interrupt lines.
>> -     * 32 are substracted to cover local IRQs.
>> -     */
>> -    dom0_cfg.arch.nr_spis = min(gic_number_lines(), (unsigned int) 992) - 32;
>> -    if ( gic_number_lines() > 992 )
>> -        printk(XENLOG_WARNING "Maximum number of vGIC IRQs exceeded.\n");
>> +    /* 32 are substracted to cover local IRQs */
>> +    dom0_cfg.arch.nr_spis = min(gic_number_lines(), VGIC_MAX_IRQS) - 32;
> 
> and reuse it here to make sure the value used is always the same.
> 
>>     dom0_cfg.arch.tee_type = tee_get_type();
>>     dom0_cfg.max_vcpus = dom0_max_vcpus();
>>
>> diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
>> index acf61a4de373..e80fe0ca2421 100644
>> --- a/xen/arch/arm/gic.c
>> +++ b/xen/arch/arm/gic.c
>> @@ -251,6 +251,9 @@ void __init gic_init(void)
>>         panic("Failed to initialize the GIC drivers\n");
>>     /* Clear LR mask for cpu0 */
>>     clear_cpu_lr_mask();
>> +
>> +    if ( gic_number_lines() > VGIC_MAX_IRQS )
>> +        printk(XENLOG_WARNING "Maximum number of vGIC IRQs exceeded\n");
> 
> I am a bit unsure with this one.
> If this is the case, it means any gicv2 or gicv3 init detected an impossible value and
> any usage of gic_number_lines would be using an impossible value.
Why impossible? GIC can support up to 1020 IRQs. Our vGIC can support up to 992
IRQs.

> 
> Shouldn't this somehow result in a panic as the gic detection was wrong ?
> Do you think we can continue to work safely if this value is over VGIC_MAX_IRQS.
> There are other places using gic_number_lines like in irq.c.
I can add a panic, sure. This would be a change in behavior because we used this
check for hwdom unconditionally. I'd need others opinion for this one.

~Michal


