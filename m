Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE3FACB864
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 17:40:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003629.1383216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM7Gs-0006eF-MP; Mon, 02 Jun 2025 15:40:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003629.1383216; Mon, 02 Jun 2025 15:40:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM7Gs-0006c0-JD; Mon, 02 Jun 2025 15:40:18 +0000
Received: by outflank-mailman (input) for mailman id 1003629;
 Mon, 02 Jun 2025 15:40:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yeyf=YR=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uM7Gq-0006br-Po
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 15:40:16 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20610.outbound.protection.outlook.com
 [2a01:111:f403:2416::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df6a64e9-3fc7-11f0-b894-0df219b8e170;
 Mon, 02 Jun 2025 17:40:14 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by CH3PR12MB9078.namprd12.prod.outlook.com (2603:10b6:610:196::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.33; Mon, 2 Jun
 2025 15:40:09 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8792.034; Mon, 2 Jun 2025
 15:40:08 +0000
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
X-Inumbo-ID: df6a64e9-3fc7-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C8WkjxORBBlypN3c01ftfrIsYdD7xacScC1q1mtFbcXHGA4KbjAtA7LfYzM0HH8Q6MqzJIqYj82khT+1jmUQh5MFIxCDUPIFFh3YAVG+4MV5dAEKH1b7Eo+cp2rv2ZrWyw+FZOZd5AlC4pg525bMbhaxMEuHrmVa5BK+MwvTw0y3+QfWHwywROADqySBceZRsnXRDvECHVZ3YYherXQZLlvudYnEePgwQieblaIDF1P4TCUu9Sfigs1LeaK3Jk2moP7IthorkpeA2THEWmtn0kk0OVIQ9MxojXruH8bdfR56w3q6IGVC29pRFkO0Ci+T83XYzfi8o5dJl7ys8qYhkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gdy7SCFRir2oQeE1e9j4czGYajiy4okOYIPvAppi+58=;
 b=Wzo4YG5TmRE0r6Q0DPJKCa2FLICUSRsve4xkiLPo6K4ZyaudCn4NOykRNk4uB5WKn3XwavzZMMaEt1Rkigh+0YSlvb0H8OhK+oWG9NBJzYgPxIbkIkRNVUigtsSv2hub1EnUZ1VYRzvaOL2zvrWYHwIRNfCHtIFdy3WGp3NOF7Ty6C18fxmLEgd5aG/VinXaP3GwpcVLqYnM1rq5PNPOVJHJIyIJPyIsUXCA+mIBmlSMpqgyUGQVhq2ceTMRrN2h/fjrYiLct0pRgZ2cCRKL7kY32tSn+Z8b2HWckTt7UtQXQNXWd9lQGjw39Y9uFUBLsXph/LevPJqCh8GehRcuiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gdy7SCFRir2oQeE1e9j4czGYajiy4okOYIPvAppi+58=;
 b=dcLwz99n68VQJWRNMEIKg1z7I8XNslhUWRycdIqJplDEJPUJQZeXYFFNYRjon6irIdmqlXHPU8uznTaDmrZer9Af3eOvmFqhw44LP96cyLi9PkN7AqjHKKSyS5FLY8RzmtG6nCfucGvCsJaXIUIfD+fXwJIzfmM9/VR9S6XJiJs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <5c58a036-2dae-4b12-97a1-e2fbafea4999@amd.com>
Date: Mon, 2 Jun 2025 17:40:01 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/vpci: Use $(CC) instead of $(HOSTCC)
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>
References: <20250602150929.10679-1-michal.orzel@amd.com>
 <e3f4b507-5f66-47f4-bffd-6cfda48bea3f@citrix.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <e3f4b507-5f66-47f4-bffd-6cfda48bea3f@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DX0P273CA0043.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:58::11) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|CH3PR12MB9078:EE_
X-MS-Office365-Filtering-Correlation-Id: 34e2741e-99cc-4863-1ccf-08dda1ebc113
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?blk1YWJKT0t1aTBNVEJ2S2orL1JrcXFVRzBjT0kyL2FkUTVzMG5sQi9NcFBr?=
 =?utf-8?B?TmZkd2lsRnhTQWlWNDRFcUxyRTRiTnFsT01lc1F6aXAzWHlBT2dXUWZpc0tK?=
 =?utf-8?B?bnZMNjZXVU5pMzZUV1NmZVJmcmtyd1gvdG5yV1FBeThMaGhRWk9CeGZqaTdC?=
 =?utf-8?B?QmNEUStlZGFybmNIZDI4RE9kbzZuSHRrTXh3U3BadlNpTHFFTFNFQmVreHdm?=
 =?utf-8?B?NEV3N1VJb3B3QUZxTytkb2hFUVlmVDFkWGNoZnlnaGpjN1hxVkt6YXgzT0JH?=
 =?utf-8?B?MitHNWF5dytwZTIwbHVRanE1c2hXVVB6dDZPM3MvQTFkQ3NIVlMybDQyOEFh?=
 =?utf-8?B?NkkvbVZ1SFBoYnpGa29qekNrTmRndmxOUWxieEk5TjgvOGx0VytONEpodk1Q?=
 =?utf-8?B?cDJFTW9vcFZHaUlNbzcxSUxPNzVUNlNjeEpJT1VEK1F0WitYUUViQnhoM1NF?=
 =?utf-8?B?QjVGb3dSYjhrTzYvMUcwMHcyUXVKbWlFWkFtZ1dqUTFGSlcxcEFhdDcvWTNP?=
 =?utf-8?B?NXRYTkJrdlNENlVBZVpqaVI0dlo5dlA3Mm9Fcm9Tc0NLV0phc2JZSlcrV3U3?=
 =?utf-8?B?V096S2FFSEJHRW0rL2ttakIyT2dMKzJVcHNEWXJ5THk5N3R6SjI4dytBYkJw?=
 =?utf-8?B?UEpkSU40dzBYV3pYUVVWS1JDanVqK2xwSE8vVDE3OHJzS0w1Z085T0M1N1hs?=
 =?utf-8?B?TXhTY09LYmpZZStjQVBsRlQwcXcxQkovekRUQlJrV2lxUVZoMWZoU2VtMk9y?=
 =?utf-8?B?aGJrbmVXRU9KT3VEdnlCUVZZUkNNSXpwYTR2Yys4QXQ0cjVpVmhPdnNZQk1P?=
 =?utf-8?B?Z3QyMjhRSmh3UGdBWVVMc09yd1hZZ3NmU1dhcy9jdCs0dEZ5MTdZNGdXdHU1?=
 =?utf-8?B?Y0VqRTdSMXhwNlJPRCtGWWE4OWNNc3lQQTAzcmc4WHVaVklzT2hLY2o1ZlFa?=
 =?utf-8?B?MERQUzkrSllaOExkcGt5WVlYNmJiNVJzRnY3cTdPZ3VMa0R1L3hXdDdyNkxK?=
 =?utf-8?B?MzlpYWtoMVNNSlVMVVpRMlFzOHoxOTBCRXlLRnU3b2VDeFRybndWdUtTQlNa?=
 =?utf-8?B?bnd3bUo3NjU1QTRZYlNjaE5lSE5CN3FaamVtVWZHakRyenlIWGd0SlU4bWIy?=
 =?utf-8?B?a0U3ZXRRbU0zRjdhcEh1T1lZTmNYZTQzbTlzTm1Zd0NOalBMUk9FOW5mRWx6?=
 =?utf-8?B?RkFFSkR1ekdaQlZCQTMxZ3RFMWgvRWdPeTR4OXFjZEJuMld2M0t3U2RrQVdW?=
 =?utf-8?B?ekRpNEwvcTJvRWRNRStaVE9sV1JNejJTc00zMTJxWXBrM2VSTFdwWGtTTkww?=
 =?utf-8?B?ODJaV01ZdUMxRmZqU1ZPekYxc2ZsWi9yQktUR3RBdUJpMXgvdDA3YW9iMHZO?=
 =?utf-8?B?eEJSdDh4c1I1Nm8xR0gwUzVWSlFaZjZHRDdiZ1o0anhMQnRhTjJlU0FjZ3ly?=
 =?utf-8?B?UmJFeTBDbUpWaVlETFBlUXhnUnhIRVdjU1hkSXM4aGk3Uk1ScFZxSVJxa1VH?=
 =?utf-8?B?ZU9yK0U1ZTcyazV5Y21TZktpY3JtWVZTSFNLeFcxQU16dHFUaGp3ZXhpVnV3?=
 =?utf-8?B?QWJWWDlLd3JZRlQ0MU1OK2ErL3hTTkc0NExWeGZ5eURpS0tKVnZGMStlWnNy?=
 =?utf-8?B?UGNOSFV6b2tNcmxCTlI4ODNnSms1c2gzTThHWWdaTDc0aWJGWHpad0NIcjEy?=
 =?utf-8?B?VGhKQ0ZXdTJBbnJodFJONGhERGhQcVNYVFBzeU51RUMxcEpZQ1lvT0x1d1Nh?=
 =?utf-8?B?WU5nSitPWFh1NklBSm5lMEF5aHczdVdZNE85dXZTMlFDUWJ1N0RtbytXTkd5?=
 =?utf-8?B?QUNSdTdESzh0NGxvT1B6SWRYV0duUDhEZVJvTm1yU2Q1WG15d3BtUHNaUEpS?=
 =?utf-8?B?bG1hdHRSNHJVMzVjcXgxWnlRSWxmN1ZwUzh3cG16TTVTQ2RSaEN0ZEtoVmd3?=
 =?utf-8?Q?x9oLruxw/7o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dk1UZUlSNHcxcms1dlFhcGRSb3JEa2tvUVAwQVN2cktwamY2SGt5NnRXUEtn?=
 =?utf-8?B?QjZiOVJXeTNQMXNibjV6WER0Nis4dHplN2ZrOUNpZXZvVUdYb1lDZ3g5SnFh?=
 =?utf-8?B?cEM0ZHVQL2J5TGo0RGRKQ3h1YXIzTDRwL05id2FBc3Q5ZGI2bmJ6SzVORDEy?=
 =?utf-8?B?bGRUV2Z2aXF1dkFJVlRsSjZveUtVTUt6VWcxOFJoVTl2OWhTNWZwV0x3Unkz?=
 =?utf-8?B?K2FPbGFtSFNWUys5WGlGcTIrWWVscm01NThXeHZENWRWdlR6b2JEQS85dzBY?=
 =?utf-8?B?ZjdPLzFWS1hVM1JhWjRVWXdnSzQyRlg0MnE5S2ZqQk9HNmtsYnpmQ2RyaFpI?=
 =?utf-8?B?UkZ1b2pNb1h1NDNVYkJpeVVtRFZrUGhTekNjdDYrT1JsUU5oSVhkdmtkSEZZ?=
 =?utf-8?B?anh1QUVYOFovOENJQ3NJS0UvYzBqa0FOSHNqMFRwUS91YXVYMVplQ0FTZHRn?=
 =?utf-8?B?RWhhc29pOXNQK0JkbHMvOUpFMUlBU3BPekt4Z2JDTTRUbnNEZjU4MDM4VEtW?=
 =?utf-8?B?bzFMeDJVY0RMZEV5Y3pReDJ0blN3ZlNCUVh2K2dWK3EvSFdrdm56U1RPejdp?=
 =?utf-8?B?U3A2clhCZlVtcG5sQXByRm52K3Q5UjFwdTJLY2xlTVVpempMZnlFYVJ6UGE3?=
 =?utf-8?B?OGlaVjdDd1NHZnJsZEVweXJjWFdVZlFpZGEwK1VwSnRrbk5hS1lRSm0vS0xF?=
 =?utf-8?B?N21TZjQvOUM2czUyWkNiajRib0RWUDFsdWl5L0EwQnJVQUFMTWQvRjNWd0ln?=
 =?utf-8?B?aDdxS1dYazl2Y3VhL2lkakhzbi9td0VJOVRrV1p6WmFuYStiN3FySlFsb0dm?=
 =?utf-8?B?Yll5ck9uVkROZ0duQ2tidTRtczRNa3NOblJzL20xUHVwcG0xNkNqa29PVDZt?=
 =?utf-8?B?Z1N2aDkxcURVZEdoZm5uL2FiSjlTL0xKeTZhVFh1eHJBaFRIaXBaK0RlK0Rp?=
 =?utf-8?B?Nkk3eURpbzVnbVNZdk0wMC9ZZUVTbzFlMjY0Qzg0aWp3RlQ2bGc0RVV3aUJa?=
 =?utf-8?B?NzhKT0FES2h4ZzYwdjN1RjJuSldaNEhzNzFCK2w4ZjRDSHlScFlBZE04a040?=
 =?utf-8?B?OHcvSis1RlQrS2duV3ovRHVsTmRjMDZPT3JEUjlpVnhtQmdNeEs2N1lvK1Vu?=
 =?utf-8?B?bHg1OExzU0ZLQXBtcWpEZi8xTE1QcFNRZTJZUkQyTnFjNkZGREpGd3dsUDlr?=
 =?utf-8?B?NjA3bEhqVFVQOUVMZ1Z1ejhBam9iZlVOOGdlcEgxVi9RQUM1MnZzUC9DNks3?=
 =?utf-8?B?OVY4aTlxcC9sdFpDMmI1ai95T3hkWVBvazE5TGdhOUxoZVd5WUpvM1BabzZX?=
 =?utf-8?B?bWtpdzk1Mlh0d2p6S05yNmRnYWtmNmFxR3V2UHZkc2I1UklnWEp4UjNtWVUz?=
 =?utf-8?B?UFY3U0UrS1NsTWc1aTRzRG1ucll0SDBSMVhjYmU5Q0g1KzY5TGdGNjhJOWs0?=
 =?utf-8?B?RXdQamwzNi9JQUk1akcvSW1HUUVyaFRrNGwrd3dqUWZ2ZkhjYVpZR3dncWpz?=
 =?utf-8?B?N3ZxYXpUT1lsODVXMFAvdXptR3BwWHFqeTVuUVA2TEhmUzIrQk00NW8yUFAy?=
 =?utf-8?B?Ujh6Q09zTnV0RUgvMElJRndFdHFKdDNqb0pMeWJwQk10UmxVS0ZybkUvWGRt?=
 =?utf-8?B?NDJJalp0QXZFelFJRUZJaExOcVZHbisrbk1xbjVHOGMvTy8yV2paVDFMQTZt?=
 =?utf-8?B?endpZmhYcktBcEkxUEJ3VUtscTBKTlk5bWpQYmU4U3pqeFNsQU0rRTRBbG1Z?=
 =?utf-8?B?V29raGV3aHkvNTlLK3AxUnZpSWhqTVZiQjl2amZoWDJiUmFTSTFPYVVlNWMy?=
 =?utf-8?B?RVA2VHhWVnVJblFVN0NGWVluQnh6b0VoWHlQUHg0bDN6alJtMktMUEN5emtK?=
 =?utf-8?B?cU5yK1NkOFc4L1ZjQ1NXZi9sQzBwdlZrVnpuNVB2blppNCsyOTlidW4vUXBw?=
 =?utf-8?B?eXQ2TFpJelZCVCtva1ZpTmo2MytxSnd1SWtqVEJvMHEzZ0phOHFpdEFMK25R?=
 =?utf-8?B?ZVR3d2JRZEFQbnZLZlJMTXhvRHhUN1BlOUpLTnpWamd5SmYzaXhOamtCaTg1?=
 =?utf-8?B?akMvV0lFaXZQc3AzTHRLZ3pYOVNIVE5MU2Zic0RyUjdDdkxyU0ZCTmxzaVRT?=
 =?utf-8?Q?1p2o=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34e2741e-99cc-4863-1ccf-08dda1ebc113
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 15:40:08.8084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W9cWjDXg8qgH5BoJHzNN90Mro5L9duNl7pqwOufvVAHn8VOssm9K37BbmxiJHT6V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9078



On 02/06/2025 17:36, Andrew Cooper wrote:
> On 02/06/2025 4:09 pm, Michal Orzel wrote:
>> These tests are supposed to run on target. HOSTCC can be different than
>> CC (when cross-compiling). At the moment, tests installation would put
>> a binary of a wrong format in the destdir.
>>
>> Fixes: e90580f25bd7 ("vpci: introduce basic handlers to trap accesses to the PCI config space")
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> 
> Oh.  This didn't explode in GitlabCI because there's no ARM version of
> *-tools-tests-*.
> 
> Can we fix that too please, seeing as there is a real ARM board?
We will add it to our TODO.

> 
> Also, I guess we have to finally sort out the CC vs HOSTCC debate.
> 
> ~Andrew

~Michal


