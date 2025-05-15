Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B72BDAB8C4B
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 18:25:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.985775.1371630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFbNj-0008NQ-5P; Thu, 15 May 2025 16:24:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 985775.1371630; Thu, 15 May 2025 16:24:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFbNj-0008KX-1y; Thu, 15 May 2025 16:24:27 +0000
Received: by outflank-mailman (input) for mailman id 985775;
 Thu, 15 May 2025 16:24:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RmYV=X7=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1uFbNh-0008KR-RO
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 16:24:25 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20621.outbound.protection.outlook.com
 [2a01:111:f403:2009::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ef93084-31a9-11f0-9ffb-bf95429c2676;
 Thu, 15 May 2025 18:24:23 +0200 (CEST)
Received: from MN2PR12MB4423.namprd12.prod.outlook.com (2603:10b6:208:24f::18)
 by DM4PR12MB6351.namprd12.prod.outlook.com (2603:10b6:8:a2::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.32; Thu, 15 May 2025 16:24:14 +0000
Received: from MN2PR12MB4423.namprd12.prod.outlook.com
 ([fe80::a078:ead1:2186:41df]) by MN2PR12MB4423.namprd12.prod.outlook.com
 ([fe80::a078:ead1:2186:41df%7]) with mapi id 15.20.8722.031; Thu, 15 May 2025
 16:24:13 +0000
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
X-Inumbo-ID: 0ef93084-31a9-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hbm21j+DxUS8+7R5UNS8AvCkKRT8rxOsZ6DJO6TuvIVIqiCANqvHQx1Z55l51MXu/f8arQpj1H5raY6oc8rUT9JYtWJA18xgBp45cV7lIMz/3hoJww6430ehlbBUHo+BZf01VVssGSIidBpCnwCOT3CWk2u4OeAlWtoseKD8QywMM36YTjkAdLKCfumArMcp4gQCUGZonH1wuoHgTqpLWn+e9dTSimMsQnWsujkYQFPnrk80U87Iv2DVCnYqFuYGWASsHzCWoJJd9Xcllsomg9HVN/KulXR4lC8V1aC3b2hV2EIM4PCMx6QPX7mM1wBMQjomnX6yoEZBcOgBqU6tCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CQQp6ph4YBzlQqLR0nqaP9KRnP2CAg29N8pAUIEqT1U=;
 b=kyH0J1UgWr/ppqkGaNVViX0lQmKZeP98GeITsdA4JmpX53dEhmAO0UgTTuvmRHFh8jx+OQ1S7RkfYAUtNc9boEQZr4oep1SWOFHKmqtBv+4VPv07IhYLKKYY6Mk/yD4Gb+jxQtKacyRngIuSxUcOsTu+D8TLLT6+jymUqNIbwIzyOQGHbzesY7+eEMEw1BBnwQZxIREEdc3n/IcayaShxSyd+AtpuNpveElFYO3lrz86Z8pOqpk8muTyBJeBPQTKBdg9nOehJTQfXu8xiL9QrSzdkKugUFF8yE4URb/HApWGxNbgIF6BA8Zxvwy1cdYvGwfxYA2VTI4n7e7CJn391Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CQQp6ph4YBzlQqLR0nqaP9KRnP2CAg29N8pAUIEqT1U=;
 b=myC5d0Qizt1tL20hWR8wK4W01BQr47YHRWL/WZDKUYyijShumAu99d3jg0iX/L5z3c7gAPhvu3hGtUOCZJERAdZ+JtzUgQ7KsnbiIoqpAqBRkT55caLsx0LsMUu9AJr504ThjHfkerEYhAqZ5PmgB00xPTXmPTJuIw+uHVNP7kk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <9befc286-2c45-4cca-aa54-0f205afc4239@amd.com>
Date: Thu, 15 May 2025 09:24:11 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] xen/x86: allow overlaps with non-RAM regions
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, Jason Andryuk <jason.andryuk@amd.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>, Xenia.Ragiadakou@amd.com,
 Alejandro.GarciaVallejo@amd.com
References: <aAoPNTsLjMMfsHvJ@mail-itl> <aAoW-kvpsWuPJwrC@macbook.lan>
 <775d3ac0-8f43-415a-a32d-14377092b96b@amd.com>
 <554026de-bbb4-488f-95c4-8e2f034d6d0e@amd.com> <aAtPpOq2Kc_N6hBy@macbook.lan>
 <2acad9ba-564a-4d18-9b09-dcabe8f7b025@suse.com>
 <aAttUBx57tds8WJJ@macbook.lan> <e5d464f3-6675-4fd6-a834-7f743fee668a@amd.com>
 <aCIe60al7G7pfeUJ@macbook.lan> <02b6f10a-119e-499c-a51f-8deac6fa6a93@amd.com>
 <aCW_p_ucNFaFFLeo@macbook.lan>
Content-Language: en-US
From: "Lira, Victor M" <victorm.lira@amd.com>
In-Reply-To: <aCW_p_ucNFaFFLeo@macbook.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR04CA0024.namprd04.prod.outlook.com
 (2603:10b6:a03:40::37) To MN2PR12MB4423.namprd12.prod.outlook.com
 (2603:10b6:208:24f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4423:EE_|DM4PR12MB6351:EE_
X-MS-Office365-Filtering-Correlation-Id: 95ba6fbe-3056-4f1b-951d-08dd93ccee2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?alQyYi9tWkNVOFd4WXFiTUhScW1hSDFTbVloS09UR29PRXBVcFR4N0pEL2Z3?=
 =?utf-8?B?VXRRSXRDT0lFR25FRnNYbTRZV2JpYjFIVkV1c21NMXF1dkZqZ2ZJcGI1T0pl?=
 =?utf-8?B?NHpnV1V1ODJIQjV4TEpxYi9uem1nc2M2UDg4cFFXMklLN0w1QnZ6aUZjbGl4?=
 =?utf-8?B?a3pYdlZxZDJGU1loNURsQ2lObHY5NDZmM2FtU2VxWG5tcHFGQVNOeGZjK2o1?=
 =?utf-8?B?bGJyVjR0WXkzeStBTm9HSU9iSUhQSGpNN1pQRWh2R3c3UlRkSnY4dGxqUU5p?=
 =?utf-8?B?YnI4OXh5bCtKWm1vN09yS3JVMm10TlJKSGM0dWU2UlhJaUQ2UElFOEJxb2lR?=
 =?utf-8?B?QWsrZWRLRXgrdEZETzEyc0t5OUZ4ZU1KYTNZNy9NQXM0UFNJMWVLWTczVG1P?=
 =?utf-8?B?NXlzb2lobzZlR0cvYWNCbmlrQUhhVnk4aUFJQzh5T2dDNzh5Uld6bGw2Lzdn?=
 =?utf-8?B?K3dTR0pvSm41ODlQb1RDQmlzeHVtQWN6MWxBQ3pQNkoxMWRSNzRScXloQ2ow?=
 =?utf-8?B?cDN3dllVYzc3ZlBLT3VHTFN6NnhjNlRqdHFpMXVBaldrZ2kzdm0rOXFUeUZr?=
 =?utf-8?B?NllLRGFIbUNZTndPOGc2TGJNcG1kLzJ6QUxnekUrc2lqWUk4ZFlYb0V1Wkdt?=
 =?utf-8?B?KytwQlZCbHNIQ2FxLys3RloxQ0ZuekhGbjlwU0o4TnhkTkNUWkw0TXpKTEhS?=
 =?utf-8?B?U2xnd1VoaGd1dEtMS21wL2tUYkRQVWlpZ05qZGdXOFdaMU5BOGtOanRBcVVh?=
 =?utf-8?B?ZCtsOWZ3dUdvV3VjYnJHeVlZK21pYjNMMDVmZUVkem1ZTklZeVhMbzdmQXlq?=
 =?utf-8?B?UVBJVVlpMmZvSjhpOXlmVkJJSTZqWURmSVY0Smx0WmhjR3R4eHVEQ1FvalFs?=
 =?utf-8?B?OWQvR0J6UGtJMUxmTmhXK2NjbUNpcXphZk1sa1h0YzJtbW1kMzlTWGttU1I3?=
 =?utf-8?B?cmFTcmtVdTVJKzh0Ym5pODBnQzk5NGYvTW0wYUtUd2w2ZE85czZmTHZIRFRL?=
 =?utf-8?B?cnJoeHFHZ3dGNTBZK3JGVkMvU3QzdldSNEQrYk5yZ1BDZ3lPTDNJQmtSRzIx?=
 =?utf-8?B?U0o1VWdvZ3VEZ2R5blU0U3FVaEJGTjBSTW5RMTh3NWFib2Z4S0VuMmFkY05x?=
 =?utf-8?B?K1UxcUl1NDZNSkNBd2FweHUzQ3c1bm5kdHpKTW9mOWlLb0xkS1ZiRmJaM0U2?=
 =?utf-8?B?dmRWaWkwYWppYUtOd284RmxNVDYxVGtXWGxDUmdTekxQenp5ZGlXSUJObHIy?=
 =?utf-8?B?Vk5CNXpQdEdVdHFWbjAyd0Mzb2pBQW5WajYrbGFkYllKbFNuZkV2b0FxNXMr?=
 =?utf-8?B?TlNNYTBvWTdXMlROUzhSSXdqcG5QN2NNY2toc3JmQkN6OHJCVVpkekprdEtR?=
 =?utf-8?B?ZnE5UmN2YzFnQUVBYVpwRVF5RWpjNmxlTUlDVlBKTGtBeWJRRHhqa2JaZHdC?=
 =?utf-8?B?c241WmpZeVNDOXFqSERSSEcxMlJsQk9xZVhZK3ByNldNMFU4aVVRRGpINVl3?=
 =?utf-8?B?ZXdWT09aYnQ2NWkwdDlEdDF0dXJ3WlUrQ0tVVUM5cDVta2xLU3VDeHVLM0wx?=
 =?utf-8?B?L2p5WXkrTWlwZFNCN3V2bHg1RG1lN3N5MXp2SCszWVBIakQzOFJXbFRONDhj?=
 =?utf-8?B?SDZBcDJyNC9vdklrS3RpTm1xWTFFZ05oVmE2Zjkza2hETUhZaHVucVYxbTJH?=
 =?utf-8?B?L1UvTmdwSnU2OG43SkR5dDVFbWc2dklCK0I4K2hraWVhRWlTSmh0NWllazZz?=
 =?utf-8?B?bjAxdW1Idk5za2JRMFZyYlkzYytFVmpzUmVRbGdOTjVlelZlVnpwU3BSYkxp?=
 =?utf-8?B?TzFLY2E5UTA0Y2NUdW9ibmM1VTdsN1VGNy90ZldpYUNHbU9UajljcDZmd3BM?=
 =?utf-8?B?NlI4ZnNRYjZ5UWtCWHF1cWdRcEoyY2plTERiajZlTjMzKzZ3ckJMY0ZWeUFW?=
 =?utf-8?Q?V01I2b6FGHI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB4423.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZDI4MEx6WmVhY0Jpb0gyWUVDL2Uyb0F0NklOYmZQN0UxOTFERWRvbUk0WDZG?=
 =?utf-8?B?M1h4enBRM1daeGlIZUNCR09UdmlUOFhSQWludFhZTTR5UVlOdU0yRzhsZFBC?=
 =?utf-8?B?cS95TlcxMFVkM3IzdnBESEM5VzhyeUZORkJXWG1KOVR3enpudm5yM1pZS1Nl?=
 =?utf-8?B?NWowdXZSM2JlV01kWXBYV1JUd3I3c0lCdm9mZkQ2R0Q0ZkNOa25Xenl1VUl0?=
 =?utf-8?B?U25FYXpuZ3dObGp1WUZacytpSmlqckNPQXgxL0FhK0k1eEFDVFU2MzNSUXVI?=
 =?utf-8?B?enNqMFBvRGdkNEpOeGRjTFUzTll3QjRZd0JuRlExSWJBZkpqYVBLeVJUZm5k?=
 =?utf-8?B?MjBodFN2S05xdlZ1ejEydkwvL1B5OThRd3ppZ3pnMmVKWkVvaFZDdWZiM0gy?=
 =?utf-8?B?ZUdhY3A5c0lvMHlsRHJaemMwNjJqSWM1ZXlSbTNIQ3FoWFErUU40enh0eHE3?=
 =?utf-8?B?ZEJoOXZjbzNTU2hEd1hpQUpCSHhSQXFRRzNBMkpuZ0pUWFhraUZSTitJcUU4?=
 =?utf-8?B?SGpodjhjVm1TTFFxZDJkTUJPSHJlMFlsOUlzY0RvWHNIMEV2dzh2elZ4d3kr?=
 =?utf-8?B?OVJLTmxjZEcwYkM4V1pTeWIwZlR2K2hwaE5yTDAxUnhqR0w5UWRzeTdjbUl5?=
 =?utf-8?B?R2JWdVFuRmZ1Nks4ektad1R4Qk04cFNvV2o5WDEvQTkzTjVEWUxVMFBHdnlW?=
 =?utf-8?B?aDdOeldtSlBGaVU4SEZwSWxnaklrMnpIZGkvWDk4SHRSMlFiRnR6Q0h2OFNZ?=
 =?utf-8?B?VUR3NVVYNEN4T2Q0VzFPYlpUdjEzRktHelFhWkd6d1l4bjg2dEZ3QUc0Ukwy?=
 =?utf-8?B?MmVFeGxBSVYvSXVZeStFZ2lwb0hDNlRzYWlDQzYvTmZVWDV1dmF5NGlQbEtP?=
 =?utf-8?B?RDhDR05ISXZGdGd4Z1lzUUR6QlM5TDVLZkdNeFh0bUw5WmF1U1hzcU1kNS9P?=
 =?utf-8?B?Qng5OXVMbDNEM2dZdHFwVlBSdEJQeTcvS0hKQmxjZUQ0M2VXS0dTSXVERmJP?=
 =?utf-8?B?cktlaEpJZ244R0NodlBkemZsQUpEK1JLaXEvQ2ZkMGFESktxaWdJeWs0MVV1?=
 =?utf-8?B?UUM0Nkx2ai9EaERVSkEzbEhVekRIdDlUSFZySjJwb3I0TjA1aUhlc2NJclli?=
 =?utf-8?B?Z2RaRVVNNmErVHlxUjV0ME0wd1owUVpsWnIwd2RMa0xkQ0RaM0NyejFReldD?=
 =?utf-8?B?empMcktBdytLRHNtU2RONnlTVkRycm11NGc5eEJQVGt4NmxKL2RHNWNSVzFE?=
 =?utf-8?B?c0U2T0Z5c25GWnVkeTkyTGZrMXZVejZGVHR4MGdtSXRNYWxyVnJPc3lXT2VC?=
 =?utf-8?B?N1NhM04wdGlocjhpemI4dXpJMUdMaVhUay90cWVFZjFPUTV0UkhxRWtQZnNC?=
 =?utf-8?B?dkpGZVh5TFdYTmZTbzUrUzkzZVNOS1NzdElsb3UvU3VES2F6dEhvSml2bnhR?=
 =?utf-8?B?Y2FIUFNtSUx4ZFlsZ2xjTkd4ZE9Sa1VoK0o2S0VCVU1lczBEWFRTZzNFbUxP?=
 =?utf-8?B?MHNQUHJ1ZG5HUFAwTWVXayt1ejE2b3RoYVFCdHBUeUhNNlBud25ESFJUbGw2?=
 =?utf-8?B?M1FKS2FuWG9raU9FU0V0azZYVWM4TWUvSDR5cEcvNjdQNlQrYjlzalNTdzZw?=
 =?utf-8?B?UEl6dUEvMHJPNm5reW85eks0eFR5Zy93bHFZbkswTzBHRWE0S0VWVXgzdjYz?=
 =?utf-8?B?K2Z2NExzQWpUaytHZmR2dE5walRtSXlZbHNHeW5Pa0xJaTNVV1E2b0RBaFhQ?=
 =?utf-8?B?Zmt0Nm4wcGZURmZmZTBtV1IxMDJEUzVnWEVEdDJkNGcvekEyU2dRU3VXbkg5?=
 =?utf-8?B?Wmk2NVVYUUFqdTdBSkk1cjZyejlIbjVXUlk3YlpKZjlsUzFCR3BXMmN5VzBS?=
 =?utf-8?B?d0UzMnZIczE5Q3F0amNYODdDNkVoRDMrbWNTU0l5aVlQYmJXc0VYTUNOaWlE?=
 =?utf-8?B?aTdERGxDc0NEUzNMMXZJM2tzTXhabHo2T3FZWVZUN0M0SzRUTVVTRmVFc2Ni?=
 =?utf-8?B?RkNaL3VMK3hQTVh5K243QkpxWnVIWTZSTlYwOFJzT1JnaEp6Y0c4aThHSTZC?=
 =?utf-8?B?bms2NnF4Yk1VYU1zSU5JL3lkNlhQSWpUVVU1WU1YK2J5MVhPMWFlUTZ6YjlR?=
 =?utf-8?Q?P+Wr9k2pDZK/iLH0401b3mPAj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95ba6fbe-3056-4f1b-951d-08dd93ccee2e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4423.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 16:24:13.7561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hnA7C4fS/wWm/9i3MKni56pm41BaDcwtQkmp1F4WZgjnudEGBSYDAAiRkmWRTQiDFoaLpBF62S9hnZG3jihtKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6351

> Thanks for the testing.
>
> I've formally submitted this as:
>
> https://lore.kernel.org/xen-devel/20250515084123.43289-1-roger.pau@citrix.com/
>
> Functionality wise I think it should be the same as the last patch you
> tried.  Could you give it a spin and maybe provide a Tested-by if
> suitable?
>
> Thanks, Roger.
OK, I'll give it a test.


Victor

