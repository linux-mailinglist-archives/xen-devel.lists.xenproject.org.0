Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D098497EA9C
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 13:22:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.801971.1212060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssh9M-0004tq-1R; Mon, 23 Sep 2024 11:22:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 801971.1212060; Mon, 23 Sep 2024 11:22:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssh9L-0004sA-Uo; Mon, 23 Sep 2024 11:22:39 +0000
Received: by outflank-mailman (input) for mailman id 801971;
 Mon, 23 Sep 2024 11:22:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=449k=QV=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1ssh9L-0004s4-28
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2024 11:22:39 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2413::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 22c33206-799e-11ef-a0b9-8be0dac302b0;
 Mon, 23 Sep 2024 13:22:37 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by CH3PR12MB9395.namprd12.prod.outlook.com (2603:10b6:610:1ce::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Mon, 23 Sep
 2024 11:22:34 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%4]) with mapi id 15.20.7982.022; Mon, 23 Sep 2024
 11:22:33 +0000
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
X-Inumbo-ID: 22c33206-799e-11ef-a0b9-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f4SFUoCsx5ZS/lRsnQoPpPIhQycVK6CoJuaw59wi/Dc2S+3Skug826rQtDUM5Y/yA033sFxRXWzTCd/vWSYEd8nkgDFNB1ychq3vQVviGr98049cp8n6rLI3MSJgVstRlbV6XYdgrAGwSqdQe0IYydHhSxPpRxnTSgtavgStAm9PYAbj3lT/rzmWZZSJTxVKqSHRk7BxS5onn7ZflgPJJiNMiXHmOgzTExClZ2LOzHoRzSlQwcF8lvAiA6SOloYEWhdOdpi4TspUvMeyssttgcxoI9FuPiWWFjzqlAdyLBr0ChjQxZElbA0F/u7Ag2KUluubplLWll2D0sTyxEecTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hmsAJSZPVAMUw1XTp2XqCD2yodSUtMSaI9vZ7rmwflQ=;
 b=SdzPwSGCc1L5E3RJmTxm8gRLnSnh0R3ecjKkbfY+E1hHYdjcNO/wMh4QsSA7c1/7V0xLx2l97caCIbCsOCjkNLXlB19A2tLVHl5HaPXQ/XgrO+KtEB29PJ2ShRATU2OjKTHjnysu5q705JELfhBEMPAhKPDv2OV1Zn2XMjU9Q17n0OWMB5yrKROeBqkZKLjMZAJpo3dLJBj2pKD2vS0aLIc3nMOmTx1J8qmYr9L3e5JEcjUdKoCIcpVKR1XcShXOa8U8apr+Ti2EaLtszWidtr3ZZpYKYmHxQmxmSa7EsMIAqP/3qoliS6Mf4OTOrufGWpcB20be2D2kETGnUoTpTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hmsAJSZPVAMUw1XTp2XqCD2yodSUtMSaI9vZ7rmwflQ=;
 b=Wl1syVC6lWh9tM7w0EwXzM2cdGS5gTgLer9PW0wakDYAXTBrIZi9Y1WDTj0/xh6bZ1abLui8vgFcWQpNWr3J5ObeO/sL359tt9aI7Flz/Toi4YeqUJvwokFbOuHQPakLC1jkqeYmdyT/drPz4s+cWWdfxK237/Li/q2UhNIpFdI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <ed17bac3-6505-4824-bffb-6436e0a9e3cc@amd.com>
Date: Mon, 23 Sep 2024 12:22:28 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] xen/arm: mpu: Define Xen start address for MPU
 systems
Content-Language: en-GB
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Jiamei . Xie" <jiamei.xie@arm.com>
References: <20240918175102.223076-1-ayan.kumar.halder@amd.com>
 <20240918175102.223076-3-ayan.kumar.halder@amd.com>
 <e1930816-14ff-489e-99c1-8e832655d4af@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <e1930816-14ff-489e-99c1-8e832655d4af@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0249.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::20) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|CH3PR12MB9395:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ea56537-7668-4041-c608-08dcdbc20517
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SVc3NHFLRy9Kb29EOXJpY2hrZkhaR050VVh2MTJhTUt2N0ZpZnVuelk0ZERG?=
 =?utf-8?B?NHJySis5MllycXNYQWp0QVJrSWt5cTZ3c0o5Y3cwT3dQZUwrMkY4Z211ZEJ5?=
 =?utf-8?B?dkJnUmhibmdBVHJBWXJzdW1GSHZ6VDg3eCtlT09xeVBBRE1SMmlmUWhzRzRF?=
 =?utf-8?B?WithQ00rQVErYVF1UG9LWGhnd0NQbkhNK1V0NTc0SVVnRWJ1NitGd25LcDhO?=
 =?utf-8?B?NXhtNEhFeklac1E5Qms1Q1c5c1VDZU8vUlI4cm5KL1ZsRmhtUnlCRmI3L0xw?=
 =?utf-8?B?SDAzL1BuNVBPdGxSSkpwYmYzU29LM0xKZWFZOENLd2t0SVVhUG84L0hsZDhS?=
 =?utf-8?B?cnczNU9UWU9YVXM4cDBtNStLZnJ3TmJYVnlkUmNqU3RnRzl0NmxCb00rT3FC?=
 =?utf-8?B?YWRyU3VnQ3N5cmVOWVRkVkJqSFhqRldaUXFSeXFJWDVKWnc2Z1BRYWFseHlM?=
 =?utf-8?B?N2FEY3RCZXJacjhjZzBodG96VVlnY0x3N3B1Q0NuVVovMHAyOGNENTA3NFZk?=
 =?utf-8?B?NXI0eEtxVXFJdklOZFBNMXRqM1pxRnN3U1AxenJqaUJrQ1c5b0JmQ2dlL2o2?=
 =?utf-8?B?bUhMcXloTGdOYUg1NVpIV2d1S2FWRVZuY0xncVZkUUhJbXhxR3dDdDhLZU9F?=
 =?utf-8?B?dElLdktYM2tBZ2MyN21acHNKU1hWRGozWXYzMkE1c2JYZGxMTFFFQlNJbDNh?=
 =?utf-8?B?QlI5UU9GUHVKK1B3MlE5VDJPRWk0Z0JDSEJJaEJZaFg4MjRyU3FhN0RqSlJq?=
 =?utf-8?B?SXg4UldPNW5sK1F6UGljb0JuR255NmdLU2lOdzFYVi84UDByVGhQZ1JYV0Jo?=
 =?utf-8?B?d0psM1VEYytCemh5dFpOZTgrV0EwQ3VZQjBkMFRlSHUyRi9QNmFPdmhGcTJJ?=
 =?utf-8?B?MW42TFZpMTJqU3YwNTF1Y1R6T0djaG9SNVNGaWhhUzZoVk4zR2N6a3RlOTNH?=
 =?utf-8?B?Y3R4NXFUODdmVGZUbDBpOUFHT2Z2V3BuUEdUV0JjSVdCRjcvOVNWWDhRMjRE?=
 =?utf-8?B?VS9yaXcrQnpzUURySVBWM3V1T29ISnlCOHlnaHJWZHNQb20xcENRbjFRTHdp?=
 =?utf-8?B?bTR5QzU2dnU3VkVLdnJaZGhrV1hLR21OcDExdWU0aEs2VEhGVWt4RzVUTEFh?=
 =?utf-8?B?cWMwbmcxMno5TzM2VVhTSlFqU3JFbzJWbDdyaFBDSjBzRWovd3BTSDYrQnJP?=
 =?utf-8?B?bWt3UTN1RGt0NVJRR09TajBNYW9VQkIyUEhnKzU3MzViZTVrTkh2QXB1WGpm?=
 =?utf-8?B?SnRGYkhoWTFsallPWnRlT200S0p3UGRZV0pGWG1rUWpKall2ZVBwWFJaeFdJ?=
 =?utf-8?B?UDBlLzlKVzRDRGhsdXF4Sm85bjdNN0V5UWFVaG9ickNMdDFBdHoyVDBPQ1NR?=
 =?utf-8?B?U3NCenZRL3ZaTlZXR3JjWEY1L0hyNWlXMmJiY3lJaEFrSnQyTVphVzVMSmRF?=
 =?utf-8?B?bGIremdyVVJSWHdDbWVlU0hhK0I0RTJ3NEJnbFdwNVpqQ0tBaGEyR2RZQk1n?=
 =?utf-8?B?bG9vcjAremw0T05zZVFJM013NXIrQUkvQkc4R2crWjl1ZDFEVlFybnFKN0Vw?=
 =?utf-8?B?eXllaFVVZytwaHQ2cDIxbmc2dnF3TzdRbmNKLzJzdVdHd1o5Q0RaTm9ITHIy?=
 =?utf-8?B?dzNReHhyWlJpTmRiN0pIZlFEWnYxQmNuY09yeE1CYlVMZ1FTV1RsM1pjK1VS?=
 =?utf-8?B?cVBYSVE3OXRDNmdWK2pJWU9jWi8zNkFXTEZVM0srQ2Y4OXRodHA0SGt3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T3lBM1B4eWhXbENIRml1aTdTMjZwclNYblYvNUEySmxsNklrNVNpcW9yZEYy?=
 =?utf-8?B?b2NrQTk2ZWRmQnd2b3l2NXRta0tRZ0czN2xaVlRoOE5pQmZqQmxFMENZY0wx?=
 =?utf-8?B?d0UwV0pQVzAyWUl6SXV0SDNVZW9LOVdzR1N3cTlLNXhaM0pwT2wyOU13TUwr?=
 =?utf-8?B?a2YyYXlhczdhRDBNbmVHYnpEZDAxLzhPVjNiNW15MmZPd2cybmV4SVBGelQ4?=
 =?utf-8?B?QklUcW0yN3lpUGJxd1NDV0xsMmdGYmVXcGNPVE1EbGFrSDZrOUZKZmMxT1Vz?=
 =?utf-8?B?eXdFazdtK1BOQ21MRnNxbW5QNzdIeFg0VXRtN0EyR01PZlVoam1BejdNeXpW?=
 =?utf-8?B?YnE1UE9rdEVhd2pMMURRTno2dExxL216STVJQ3BkcFVUM3N6SXl5M3V2RDFl?=
 =?utf-8?B?U25zSHRkR29lY216UVlReFJrelg1Z2pRbW5QdVZNRGd3clBENFJ6NWxHbXFM?=
 =?utf-8?B?YmFlOFRzRmh4SFRmRVRyL1oyWWtCVm9rdWRXQXp0cGIyeHBSVmYxRDcwVXZ4?=
 =?utf-8?B?dVNDUHZxa2JodGVTanpxWlE3Wm8zRmxaYXhTbDhqUXhqVDlBRHdqcXJsa3R2?=
 =?utf-8?B?ajQxeXQzcDF3cDJsUkR0c0FVUE8zRW1MQnZDQVdWcXFMVFExN1Z4S2ppQUpn?=
 =?utf-8?B?U3hpMkVhY1JncUw0TFZEN284N0d3QWtoUVNobFBxbncrM1lScUNmME1hTkh1?=
 =?utf-8?B?NHQ1Wi9ROGtXSXFTeTdzdHljMFFVK01JL2h1WG5qbFcvODg2dVBuNnR5akJS?=
 =?utf-8?B?Vk9OenpYZUo0UFhjczczTFR5Y0hha25qbCtvWFpqNlVFSXlRcm9VZE9HWkdp?=
 =?utf-8?B?bGVSd2dNYWlGMHZIcGhZSmdiVm5jSzlnT1RVWStKdXZ1eVRlM2I0QzBRSkJH?=
 =?utf-8?B?MjlnRy9ONnhHaGJZK2pCQ1R0aG1IZmxiamdzZ0dNVUhORXRkTFVtbE8xYzJX?=
 =?utf-8?B?V0pPMGZlZXFpQ3IzK29tTTN0WWlabHdqeFFXaVE2SEhyd3Y0SVJ2NWVLWDYz?=
 =?utf-8?B?NWVtRFNtZ1FaWWM5cFFvdmxQR29xUFhsSXovSFRMelg4K2pKWmthd2hlTTZt?=
 =?utf-8?B?ZWp6cHJXamQ2dTN5cWg2S2s3dDAwMzJzcEdxNGFFbXVFTWg2TmxUMWZ0ODFB?=
 =?utf-8?B?WVVrcWpUN0F4ZXJjdHBwemxVeXZyTGJjRUZiNVlvcHN2eVBMcEUzVFFaZEhH?=
 =?utf-8?B?L0h3NlFvbXhmOEJ4cjM5S3RnMmY0YXJFNU1wQnRULzFEeFRzN2FCTlFpeGhT?=
 =?utf-8?B?S0drbnpwZU9Kb2Q0OHgyejRSaHRxRVhxMzBCbS9FL01FNURQRngwZ2tvWS92?=
 =?utf-8?B?UVVuaG5IczJwSWZOdFhKSEZCVEhvN3F2TUt1L1E2NzJ2dVNvaE9FUGs1bDJL?=
 =?utf-8?B?V2VZT1hOUHloT0wzVFpjN29yRUlkVEZxaVM2ZEdRb1lmZ0hqSVhnUWtEQlpI?=
 =?utf-8?B?ZTVIdGJZejM3OUpKZVk0YXI3WUJkRDMrZWhKZVdJaFVBYXhtbG5Xc21KN09R?=
 =?utf-8?B?cFQ1a2ZtbFJnU2ZGdnF1WGdDUlo2MHlrL0dleTdNVGdEMmNBZ0dBSEhzaXdh?=
 =?utf-8?B?SkwyUGxVeVIwdWIwSXFVVk9vR3M2Ni9jbHVwRStnOENxV1RBcVorV2tkZ2ln?=
 =?utf-8?B?Y0Y1TDNSbG1ZdFRJb1VFKzVaQkdEN2QxRG12SEpWMnoyZ0lsbzE1V2lvQW02?=
 =?utf-8?B?WjhzK2I1a2dRTEVncUh4VU8vZ25wQi95UGhxVkc5MllsMXpFZHhxU0Q5R09I?=
 =?utf-8?B?V2lTTWZYVEtWb2JpcG5tdHFraGJ0Ukd3L3UrRG1TMDB6eUJrSUZCTHRXK2Z2?=
 =?utf-8?B?MVRobjYwNjJkSjdxUWY3eDVnNVhnT3BONjQvbncxa3ZtbVFlbmF2cUhzNldt?=
 =?utf-8?B?YmkrVC83NENwYlpGSTVHSXhKb3NSYjdRUGh0TExIL2Y5cWpwSkVQM1R0LzRS?=
 =?utf-8?B?dThFdWRHZzYzS3JQZm1MRWJBTXB0eTZhTUI0U1VGb1NZS2o1L1NOSXl0Nkdk?=
 =?utf-8?B?c04zdEpIN251V1cvWllIdUhJSElUYjB6OE5HeDRsei9jSUk0MDMzbDZTTVpG?=
 =?utf-8?B?QTRTRm5GVVRrZHJHMEJENlV6MjBBY1pGVW1xWm5DZUp1UDhTNXVuYk5Jd3lE?=
 =?utf-8?Q?ydSni5saQX/xXE66qz24lbfmB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ea56537-7668-4041-c608-08dcdbc20517
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2024 11:22:33.7544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ASaOmyHx2vin56E7StPTzrY2wzvMIsR0lRegdImya+bw0p8bEIML+iSd0pnES1AkaV16lfLkhQ5Lop4Kkb1pbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9395


On 19/09/2024 13:42, Julien Grall wrote:
> Hi Ayan,
Hi Julien,
>
> On 18/09/2024 19:51, Ayan Kumar Halder wrote:
>> From: Wei Chen <wei.chen@arm.com>
>>
>> On Armv8-A, Xen has a fixed virtual start address (link address too) 
>> for all
>> Armv8-A platforms. In an MMU based system, Xen can map its loaded 
>> address to
>> this virtual start address. So, on Armv8-A platforms, the Xen start 
>> address does
>> not need to be configurable. But on Armv8-R platforms, there is no 
>> MMU to map
>> loaded address to a fixed virtual address and different platforms 
>> will have very
>> different address space layout. So Xen cannot use a fixed physical 
>> address on
>> MPU based system and need to have it configurable.
>>
>> So, we introduce a Kconfig option for users to set the start address. 
>> The start
>> address needs to be aligned to 4KB. We have a check for this alignment.
>
> It would suggest to add some explanation why you want the start 
> address to be 4KB aligned.

Let me know if this makes sense.

"MPU allows us to define regions which are 64 bits aligned. This 
restriction comes from the bitfields of PRBAR, PRLAR (the lower 6 bits 
are 0 extended to provide the base and limit address of a region). This 
means that the start address of Xen needs to be at least 64 bits aligned 
(as it will correspond to the start address of memory protection region).

As for now Xen on MPU tries to use the same memory alignment 
restrictions as it has been for MMU. Unlike MMU where the starting 
virtual address is 2MB, Xen on MPU needs the start address to be 4 KB 
(ie page size) aligned."

Thinking about this a bit more (and based on the discussion in "Re: 
[PATCH v1 2/4] xen/arm: mpu: Define Xen start address for MPU systems"), 
I think we can keep the 4 KB restriction for now and relax it later. Let 
me know what you think.

>
>>
>> In case if the user forgets to set the start address, then 0xffffffff 
>> is used
>> as default. This is to trigger the error (on alignment check) and 
>> thereby prompt
>> user to set the start address.
>>
>> Also updated config.h so that it includes mpu/layout.h when 
>> CONFIG_MPU is
>> defined.
>>
>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>> Signed-off-by: Jiamei.Xie <jiamei.xie@arm.com>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>> Changes from :-
>>
>> v1 - 1. Fixed some of the coding style issues.
>> 2. Reworded the help message.
>> 3. Updated the commit message.
>>
>>   xen/arch/arm/Kconfig                  | 10 ++++++++++
>>   xen/arch/arm/include/asm/config.h     |  4 +++-
>>   xen/arch/arm/include/asm/mpu/layout.h | 27 +++++++++++++++++++++++++++
>
> Looking at this patch again, I don't see any modification in 
> xen.lds.S. Is it intended?

If we agree with the justification provided before, then this should be 
the modification.

--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -232,6 +232,12 @@ SECTIONS
   */
  ASSERT(_start == XEN_VIRT_START, "_start != XEN_VIRT_START")

+/*
+ * On MPU based platforms, the starting address is to be provided by user.
+ * One need to check that it is 4KB aligned.
+ */
+ASSERT(IS_ALIGNED(_start,       4096), "starting address is misaligned")
+

>
>>   3 files changed, 40 insertions(+), 1 deletion(-)
>>   create mode 100644 xen/arch/arm/include/asm/mpu/layout.h
>>
>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>> index e881f5ba57..ab3ef005a6 100644
>> --- a/xen/arch/arm/Kconfig
>> +++ b/xen/arch/arm/Kconfig
>> @@ -23,6 +23,16 @@ config ARCH_DEFCONFIG
>>       default "arch/arm/configs/arm32_defconfig" if ARM_32
>>       default "arch/arm/configs/arm64_defconfig" if ARM_64
>>   +config XEN_START_ADDRESS
>> +    hex "Xen start address: keep default to use platform defined 
>> address"
>> +    default 0xFFFFFFFF
>> +    depends on MPU
>> +    help
>> +      Used to set customized address at which which Xen will be 
>> linked on MPU
>> +      systems. Must be aligned to 4KB.
>> +      0xFFFFFFFF is used as default value to indicate that user has not
>> +      customized this address.
>> +
>>   menu "Architecture Features"
>>     choice
>> diff --git a/xen/arch/arm/include/asm/config.h 
>> b/xen/arch/arm/include/asm/config.h
>> index a2e22b659d..0a51142efd 100644
>> --- a/xen/arch/arm/include/asm/config.h
>> +++ b/xen/arch/arm/include/asm/config.h
>> @@ -69,8 +69,10 @@
>>   #include <xen/const.h>
>>   #include <xen/page-size.h>
>>   -#ifdef CONFIG_MMU
>> +#if defined(CONFIG_MMU)
>>   #include <asm/mmu/layout.h>
>> +#elif defined(CONFIG_MPU)
>> +#include <asm/mpu/layout.h>
>>   #else
>>   # error "Unknown memory management layout"
>>   #endif
>> diff --git a/xen/arch/arm/include/asm/mpu/layout.h 
>> b/xen/arch/arm/include/asm/mpu/layout.h
>> new file mode 100644
>> index 0000000000..f9a5be2d6b
>> --- /dev/null
>> +++ b/xen/arch/arm/include/asm/mpu/layout.h
>> @@ -0,0 +1,27 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +#ifndef __ARM_MPU_LAYOUT_H__
>> +#define __ARM_MPU_LAYOUT_H__
>> +
>> +#define XEN_START_ADDRESS CONFIG_XEN_START_ADDRESS
>> +
>> +/*
>> + * All MPU platforms need to provide a XEN_START_ADDRESS for linker. 
>> This
>> + * address indicates where Xen image will be loaded and run from. This
>> + * address must be aligned to a PAGE_SIZE.
>
> Strictly speaking, this doesn't match the Kconfig. AFAIU, we still 
> said the internal code may continue to rely on PAGE_SIZE for the time 
> being. But I think we would want to have a BUILD_BUG_ON(PAGE_SIZE != 
> SZ_4K) to catch any value change.
Yes, I can add this.
>
>> + */
>> +#if (XEN_START_ADDRESS % PAGE_SIZE) != 0
>> +#error "XEN_START_ADDRESS must be aligned to PAGE_SIZE"
>
> In the error message, you want to mention 4KB.

Ack.

- Ayan

>
> Cheers,
>

