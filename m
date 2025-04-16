Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 537D1A8B6A5
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 12:20:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.955451.1349224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4zsS-0001n2-Jq; Wed, 16 Apr 2025 10:20:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 955451.1349224; Wed, 16 Apr 2025 10:20:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4zsS-0001k7-GW; Wed, 16 Apr 2025 10:20:20 +0000
Received: by outflank-mailman (input) for mailman id 955451;
 Wed, 16 Apr 2025 10:20:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PIlj=XC=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1u4zsQ-0001k1-1G
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 10:20:18 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20610.outbound.protection.outlook.com
 [2a01:111:f403:2414::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 60b565b3-1aac-11f0-9ffb-bf95429c2676;
 Wed, 16 Apr 2025 12:20:11 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Wed, 16 Apr
 2025 10:20:08 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8632.036; Wed, 16 Apr 2025
 10:20:08 +0000
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
X-Inumbo-ID: 60b565b3-1aac-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cAia8qxaWbMruGZolzULVdaRR0dDXYeZXWYsb8KLMNuJfi6/T4OKgDPFqGqjD2KfnDsoaypiAlecmli5MFaJwK3vMZ1VX+Txv9gbgIuxbFpSfgDR7b9H3UvYdcT7pWxqTch48i6ctQDjOh9B4CJwyJ2Ez+a8Wlvam25qiHTxCVhbO6J3VSVJcgUrJd1mYzG8DbgOrhg+eDVD3RJJVH04sa9ejMOyDHJVzFeaIZ7GNS64S8GCMm7ex87wJCEfsMu45DwcllLzszL5YYfvLZoRgjWVtsDcsiiCRNXkYRdEHYRb0bTJ7rn/o4zwuj6HkR/naAouw9b1nQNt2wNv2+7eLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NuNtH+EnMnWBa/rH5TgPgiO3R0wwuDoy/S/pDzO7jGQ=;
 b=Lvyyq01f6pGBPA/Hv03Ow2KKZLcLSgIre1pQ4cieyrIs4jkYa5tcr9xqHxsTXoShWOkFb9MI5eNQYFLnTPaQOy2wtwhmS2znrgf40rCRuzTWeecXJtSpYmHeTW3hxlQzm+dh+j3s6aPMR4U/sdiNb5YebWDe1HgJPEAJhZFV4gjE/WQYrE0HmAotMWkwGSCxVG744F8eVfsZ+aI/VtZnRrghS4SpDkD213Tx7rkjr4GpVsXLeq0nWXP4Z7mozfdCmIjjDs+yzxb5EqAZtA2uFt+Rg7whvnvNs2FYeYw8heSpxHiW1zT5iPYN6cFq3hRJogH30KJaCV8Da4Imy3jivw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NuNtH+EnMnWBa/rH5TgPgiO3R0wwuDoy/S/pDzO7jGQ=;
 b=IiAWSIrpvVJQz4rm2TkCPCSBWxnAdnTGYmJALx+6nH8lumnRTfxXkge71r1Yv+U+UTvDXuPF1EFopGUnyKVyiHbZVXFbog92lmQwG2rPPYHV72nKWItYmzHkLSPJYMNJkwUvEyH4QiDubi3E6BJZqVxzKDPRzXrN4e+X6KIpzkc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <25c052d1-4ada-43fb-b959-dd91991aaa3e@amd.com>
Date: Wed, 16 Apr 2025 12:20:04 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Arm: cpu_*_map adjustments
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <2bcde8df-4a11-4ec7-acf3-618576de717e@suse.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <2bcde8df-4a11-4ec7-acf3-618576de717e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0254.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::9) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|CY8PR12MB8412:EE_
X-MS-Office365-Filtering-Correlation-Id: 37a8bbff-8bdc-451b-7315-08dd7cd04378
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M3g1aDl0aEZiNXRTRG9rTVZrZFVBZHhnOVlPaSt6MjNicGN6bFp2RGV0SW9G?=
 =?utf-8?B?YUs3a05BQWtscHRDdmVrTGxOSnFvcnZta0hUQ0xGSTRVL2RUeUlqbzBUV2Er?=
 =?utf-8?B?L2ZVRi83WHVUQVFrSi9CZktucHBEVjVUTDEzeWl5NkdWVnUwd0pScU5tNFdP?=
 =?utf-8?B?QzdmTkgzMGM4M2JJcHgxbTZuK1ArbEcxL3ZOMzcvZy8yWnhIVzFwU3RsU3Vn?=
 =?utf-8?B?YXJ3NmlaaVRlMTRWZTFMTkU0K2VnUjlzQVhOYmpjUGwxcDVEWHoydURMclph?=
 =?utf-8?B?UnlUbUxxNlFWaXVPY1UxUzc0blNXZFdPV2s3L2VadEs2bW15WWQ1KzhXSktn?=
 =?utf-8?B?dVZCbUppejI0OHlPakZKWEFySmpSbFgzREp0Z3RNcVV1ZXR1VGFwdEQ5T0p6?=
 =?utf-8?B?SG5Od0I2KzQzMFRKb3dFMXY1cHZ5Ly9CSmhKQkFMdkFYUStpNy9NWVpmVzhp?=
 =?utf-8?B?WU1taE9FZkdPdE53UUhDNWNDNWtpZFV4b3JMMnRoK3p5NmtYMWRFNkJCd0I1?=
 =?utf-8?B?Qm5EalhUdm8zYytPTlNOeDdWVzU0aDdIeWo1MWE1dmlNeDc5MTREK2VaWHhS?=
 =?utf-8?B?Zyt0aWZ0QW54b2FlcDVuRXNXb0lYb2g3T1JoWnRIMkhqeGR0VXJBZ3pGbTBC?=
 =?utf-8?B?ZldNMzA4Y0U3c0lST0NCTHpZMW10U0ZFVjVTQWVjV09rNjdZNWpEZXFhN092?=
 =?utf-8?B?RG1WY0ZFdDU3YVNIN3VSVktHYkg1Vmo1T1FiWURrd0p3MEtwSDBaemZvdVh1?=
 =?utf-8?B?R2J3UXdGMUxPaUtscUtYWnVnRnFnMldNV2l6a0xuUW95Z093S2w2SHIyTWla?=
 =?utf-8?B?WS9FWlJoZFZTQXVvQ0l0R3FxQlU1YVpXSFNtNVhwTE8xVHIvZitxWHlTaHZh?=
 =?utf-8?B?NXdZbEV6dFZWSmw5YnlBR0ZpZS9aWFdQMzRWTjBDZzByaUxNQTQwYkZYMGla?=
 =?utf-8?B?R3VpY0FEVmxsN0ZucGcrbTh0eUErbDJyNDhIa2hjVkh0aU9SemRnelFRZnpk?=
 =?utf-8?B?d1NhVUFRd3lZQUFBR3hjb3VkR0p6YWJCQWVyMzRIdHR2emIrZGt2R05EQmJE?=
 =?utf-8?B?U0I2RXIrQ2V1ZERNZStDYlNVdHAzMER5OCtzQThCVjEwS3VCV2J1YVNZWmhi?=
 =?utf-8?B?bmZLSTVHY2lRb2JNZjUzaE44TmZXS2k5ZG00NGUvV29pdER0VXg4K2gxdm5Y?=
 =?utf-8?B?RlBIMUZ5TjNoNk5DRTczM2FST3BjSHNzMEJNOTczZ2psTEtoZ1B2Q0sxcFEr?=
 =?utf-8?B?VS90SnlyTDk3dS9ySlNlNEo2VHRNanBOZndzdUFtdU1LL1FqV3lIRTVrRy9I?=
 =?utf-8?B?Sk1hY0ZFS0dUWXdOdm1pT0Z3T3lwYUlZVDFQMy90djVadmlzWDd2SXJVRkFO?=
 =?utf-8?B?cGxWNzA3R21mSEg5RUZGVWRjSmVpdTkvem94bnFBUFFHaDlTWGw5ODJqT2pm?=
 =?utf-8?B?M2VDMTJOcnhiTjFlVlZmMFZ4Q1ZENnRocWtiSEVmRFZpYXhnQ09VTGxnU0xO?=
 =?utf-8?B?QmpFY29OU1E2T3ptc2pnZmgzVGFsVHBNS28yd1NxeGNrQmFJVnlWVXFLTE53?=
 =?utf-8?B?Tys5UGI3Nko0SmdFbmtCNDhpVE5jaUZJc1IzamVkSTZpd25ZODl4WEhodG5x?=
 =?utf-8?B?dnZxSzR6WU5vK2tSZ0Y1c0lWV0IwbTBhRnpmM3BVSDl5SHJKc2doVC9PS3Zw?=
 =?utf-8?B?d0tqUkVTVzEvaDBsSEtKM1ZBLzFtL2hSR2xpMGMvZC82Ylc5UEo1ZUl3dkJR?=
 =?utf-8?B?Zmg4MFR4RHd5dEswWjZhVURYZExnZVp2Tzl2VjNJeEM0RTFMOVg5STh0WlN3?=
 =?utf-8?B?TStUUDB4Ty9wNlc5OHg3M0lZMW9TMlZFNm5JZUlrSEZuQXM5c0tBZXg4Ui83?=
 =?utf-8?B?Yjk1QlgrKzVwOG9jeEVhRW11WWRhTWhaTWUvcUtpWWtoalg0UlE5NWJhZ2pB?=
 =?utf-8?Q?zlTibRXPdms=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aEptZ2hzWFc0Z3JoNTFnclA0Wm5ETEwxWXJxMVc0Ty8xYnhMVk52aVUyWVdJ?=
 =?utf-8?B?Qm1nUmtvT2diOUoyNUJSdEpzOU9yT0s1K09lTlJlbGVNbXRMUlcxeHVLdDht?=
 =?utf-8?B?emdhTlR0ZjFjVVpReWUxVVRDZDV1UXJXaEV6cTNCNDNvcEZjY1FkT0NybmFZ?=
 =?utf-8?B?azB5SGlHSmdqc3RYVmQ5SU1UQmVXdkRCSkZRYmNTdnNtbjRzNkVyM084YXhn?=
 =?utf-8?B?clMvNFBDWVptZWNDYkRNT096MW1mbWgzYlYwbEhkMmplSmVDZFJiYjVpTmxq?=
 =?utf-8?B?eHV6SUoxNU4rKzdFWU1nMHZORkYwYzRKalNzYnBTWlFIN1F2MWNrTkVlOVVY?=
 =?utf-8?B?OGhjVTczenBvK2Nmb2lHRWF4d3ZNT0VNVXEyL3ArYUpoQnBnaW83L1BDZU1E?=
 =?utf-8?B?VTJyNDVPWGhILzJ4NW5RUlF0TG9ubkNhL2pJek0xYlZZYXVOODcwQ0xobkx1?=
 =?utf-8?B?UGVFWllnWHFHM010UnBWaFp4S09JREY4NE85VjZVU1hnVkNuWjA4d3dWbkt2?=
 =?utf-8?B?VnMxaVRiRFVxMk53bm90V3h1ckR1RWJ4KzNKSWJ1TzlNM2FoM25Ca2Rkci9t?=
 =?utf-8?B?WHYyK2I4MkxhV2dLaHNqNlkzZW1ZZ1FrVjNSNm9sV202dXY1d0NxSnJ1VGw1?=
 =?utf-8?B?UDJ4eS9VRVJiOUduRTZ0bFlETi9hYVJnZFQ4ZzhJZkgwRzhMVnJkUjJOT1l2?=
 =?utf-8?B?Y25XWUZHd1ljTnJJUTdrVGJVRWRiSGpKOTJzSWNRYVUxZmoyTUpFWHAwWW12?=
 =?utf-8?B?L0JWYk9HZHpxT1lxMEZaMXV3VVcya3h4SzhZUkliQWRyanhxYWF5TmRKZERE?=
 =?utf-8?B?bnFzTnFuaVpReWphT21wRlA3Z0NsOHpOY0dBL0dib293R095SkFXTS9KV0JK?=
 =?utf-8?B?TmtpNUFNL2wzdm1KNys1SDA0MldWbE91N1A0dTNOd211dkNqc2Y3Q2JVbTFq?=
 =?utf-8?B?QWZKSkdGZW5LdjNndmVHN2p5a3VpOG1aN043eG1yT0dWcUR1QnRENnhDUUpO?=
 =?utf-8?B?bVA5bHhEdGR6RXdoWk85WWRwMlFLM3hZSFVrZG83SUhoUTJuK0ZzQ1dmekVJ?=
 =?utf-8?B?U1pjdXBQWXBwcFlNbmhaazlMalg1TFh4eW9saU8zY0VpMlBhdkFjVTlqK3pu?=
 =?utf-8?B?WVM5dHZBOWRuVEdBeGF2YXg3UzR2THM3NFFJVGZHUXVhRmU1VjNGZFgxbFBT?=
 =?utf-8?B?eEVnTWQ1RHdtUUpNMVZDcUlEaXorVEFxQzdRS3EzK2ZDd2NKcGZSLzVnbW1y?=
 =?utf-8?B?dHlxWCtpQ00raFVXSFF4T3JQaGkyWXVNdkVIQmF4cjBkMVFrM1RucFU0bmN3?=
 =?utf-8?B?VXhaWVFRQ1phditPcC8ycFlBUkw4MVhWMWEyTEdJZ1Flei9nYlRQWGVXWkRi?=
 =?utf-8?B?RUk0VFc4RjBrdGRubjFKWFEzcStBMG16U1plMGkyNCtxNXhFb0tKQTZVVXY2?=
 =?utf-8?B?a1RuNU9qWFBmNzJSRGFTcmZJQS9vOE9rWlEySFJ2SlRNbFBobTU4eDNuQUJJ?=
 =?utf-8?B?b1hzcGt0cXR2ZUs0c3h5Y29JK28zUWl3TGVYRGVrY0xZUkJ2TVR2MlJWZ3Ux?=
 =?utf-8?B?aWcyZjZUaXhNU3F4N0hEZlEwb282Mk9hbERQTE42WGpPd094WVVaaE5BaHZU?=
 =?utf-8?B?ME9pZFZVN3RyM1F5KzRIa08xa1A4R085VStlVkt5WllRc2toQTV6bllrTWFt?=
 =?utf-8?B?N3o1aldGbGs2RnpCQmxUTWNac0ZEVEtFNG8yZ3Z5ZzlwT1l0VW80bFdWVjVm?=
 =?utf-8?B?SDBrSWRHcEJsS3Jxa20vbUdrSTF1eHk5K1FaSGZoYkZZeStLK3FIbXJCZGdm?=
 =?utf-8?B?eEFvbkdqdUtweTJ3SXI2azZhWm1qWVk2RkhscXNSNjV4bjk2dTNqZnFETnJj?=
 =?utf-8?B?K09PMFMrdFROeCtwU2lHTks1S3BvK0pHY0lJcm1WVlZWZFlWeUxFL2xPQ3JE?=
 =?utf-8?B?YmNxekFGRVZKcm1sZ0ZTd2ZPTWlVMy90RUowQWg1aS9sekRDTFAzTlJubFA1?=
 =?utf-8?B?bDE5VVNSRXNzVVY0aEhjMFFmRElmWEJONnNoRElKVENTSG90bEd3ZitxNWcx?=
 =?utf-8?B?eHM5YzJyM1pMbE1pNE0xeTNzMzRkSmtJbExjelNJYng5dXVJc013dzlnaWpa?=
 =?utf-8?Q?jNdY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37a8bbff-8bdc-451b-7315-08dd7cd04378
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 10:20:08.5389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SCoMzr+ZyvWvSN4DTFztgZTyT+BPD5F+LTE8qPwIjoR/JUcOjeD5KOJmetFbAgnt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8412



On 10/04/2025 16:54, Jan Beulich wrote:
> First, they all start out zeroed. There's no point doing an initial
> cpumask_clear() on them.
> 
> Next, only cpu_online_map may be altered post-boot, and even that only
> rarely. Add respective placement attributes.
> 
> Finally, cpu_present_map really isn't anything more than an alias of
> cpu_possible_map. Avoid the copying, and have the linker provide the
> symbol (if needed in the first place; it is needed right now as
> common code references the symbol).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

> ---
> I would have preferred to use __attribute__((alias(...))), but that
> apparently (and following the doc) can't be used when a declaration of
> the to-be-provided symbol is present earlier. 
> 
> With the cpumask_clear()s dropped, the containing function's name is
> now yet more out of sync with what the function does. On x86 we call a
> similar thing smp_prepare_boot_cpu().
I agree the function name no longer makes sense. I'd be ok with renaming it to
smp_prepare_boot_cpu().

~Michal


