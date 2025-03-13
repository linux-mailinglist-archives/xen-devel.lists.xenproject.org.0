Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E9DA5EE9B
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 09:56:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.911546.1317961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tseMA-0000R1-Oy; Thu, 13 Mar 2025 08:55:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 911546.1317961; Thu, 13 Mar 2025 08:55:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tseMA-0000OO-Lz; Thu, 13 Mar 2025 08:55:58 +0000
Received: by outflank-mailman (input) for mailman id 911546;
 Thu, 13 Mar 2025 08:55:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a6QA=WA=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tseM9-0000OH-0r
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 08:55:57 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060b.outbound.protection.outlook.com
 [2a01:111:f403:2416::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8cf7d16-ffe8-11ef-9898-31a8f345e629;
 Thu, 13 Mar 2025 09:55:54 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by BL1PR12MB5994.namprd12.prod.outlook.com (2603:10b6:208:39a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Thu, 13 Mar
 2025 08:55:50 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8511.026; Thu, 13 Mar 2025
 08:55:50 +0000
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
X-Inumbo-ID: f8cf7d16-ffe8-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZTFIfbc+2SDX4wS/g7g3vhapTTZGcMjuZatyZby4D92o4l3PCFhmMxDLtEi1BSMe1QgSdAYvxAptWNdUW0LVk2UT/qtrB6SedKdv/uoNO/I+L6LfZ79+nMlbPzUhsiLSM21BIelteV+3EfhAW3wULHnfVEZka9heYNlmeGAUdxrIcyAnNTBTcG9ukD9lbtDzlZ9hp9IfzWWTx4iab83hdnQQ38W1dZSYegN+knoSdtMQ4JIv9RUHhjhbRIhzABpKcSeNVVEZHmHYkGgIO6bdTgfm7MqqcxRaZklGln4+IXVG/JlSYI+2Gx2r7zYgAsXKR0FZUi8FtiEROR4Q365f9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rrrD5oCVC/NSiZ2ZBj+N7PSn0wQ8LF0I0qiB8qhdH3E=;
 b=uC8xMRwBqkMvWCysOfQa4Si3RhLj/3fXFtAia85yTKqRgzWJ/vdMtie6Vq2J0CwwU8m3iwJ9+TWhL01fie/IBvJgU1QwiBRl0T1mPo4pLKiiQW7BqJ6PywxWupWZDWlBetWAE8z4eoLgPAJZ6HCh8qQgyOuPt9oo4HDluhvEpA4hHfuhsmnBOL9FWKcI6AfG8jgk6wmq9AYMAd7M1P7SLHiErziYxgQkEgPi9qCKkkYp7aldBdrssij4HzvaGv243Gbla13saX1A9Qk4jj5Fy12cyKbDKcG3aW47GTwmUmMupu6UMjShBnnLD8ODigEJQbOr1ewgwCs8dDzt8BfGcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rrrD5oCVC/NSiZ2ZBj+N7PSn0wQ8LF0I0qiB8qhdH3E=;
 b=LaEJ8m7fNnOZYvK+vXqxeplScjKAXxtPs5YTVgcU6NUPx11UDsnMRxQANOAD7bQ50Ng797HFvYrGrzWELAj4auw/sNFN14MlNjUYWiFoyaHh8F4zIi0altL+B2kj7T7KmK0wgAObIoz/gRvu9DNS473HKiI6ahhrEmu30OP4AhA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <318cde52-2798-4b9d-a1e6-16c8e8767adc@amd.com>
Date: Thu, 13 Mar 2025 09:55:44 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/10] arm/mpu: Implement virt/maddr conversion in MPU
 system
From: "Orzel, Michal" <michal.orzel@amd.com>
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <20250312135258.1815706-1-luca.fancellu@arm.com>
 <20250312135258.1815706-5-luca.fancellu@arm.com>
 <f16ff8ff-6d9f-4763-914c-4ada8d7ecee4@amd.com>
Content-Language: en-US
In-Reply-To: <f16ff8ff-6d9f-4763-914c-4ada8d7ecee4@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0086.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::14) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|BL1PR12MB5994:EE_
X-MS-Office365-Filtering-Correlation-Id: fa2b7bcb-4183-440f-5315-08dd620cdab6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TnBGenEzU2ptK25ZQnBJODdsUmJvWDNQbU01Q1J0RytKZWt4VTFrY0VhQWow?=
 =?utf-8?B?cHNna3hiQWFnQm5UM0JOUGVybWw1M1VTenRKNk5IU04ydXJLNGJWaHFHaUU4?=
 =?utf-8?B?ZUd4eGlkNkpCV016ZjMwV2JZNDlza3lqNjkyTkNQT3RLampJRjA0RWdwcE95?=
 =?utf-8?B?TndUeFNwUzlJdmFIUldvMjZWNDk1WnEyOHZqMWZ1dUF1c0t2UVhaandqT1VX?=
 =?utf-8?B?ZHlIdkFDYnFYQ0lUK3kzL2JEa0FrOWdVVjBHMGs5TWxDMHowY1cxNTY0d1BE?=
 =?utf-8?B?THpmTmJjclUvQnl5aUZPaTZuZGFIdVkxek5ILzY4REUxME1oZW15VjRDMGJO?=
 =?utf-8?B?K042T05vWHdFYWRPd3h0NlpFYnp0YVNpbXdBRENuTWNwSk5GOGVxaWx3b1dl?=
 =?utf-8?B?RG5VTXV5aGhpc2JRSk5TOGNLbGh3RXFWMUFQKzNQWnRUNHBkeXVwenpGZndI?=
 =?utf-8?B?WnJaTytPWnlObWdzaG5CVVFOa3RsZ2x5N3I1a3VQdDVMODdqYmZ3dlpJQ1Y0?=
 =?utf-8?B?OUJ0UVZ0dmh1RzhwNGg1VmZSbUpYeWFHenlacmhTK21POVZVS1R1MEVEZkRC?=
 =?utf-8?B?MVVmU3FsVitxOWdxYnZkTjk1c083NHhiU3ZZTjRlQXNuWERFNXpjR3QzOVZG?=
 =?utf-8?B?UFVGdEx5QTJkbGdQNDFXdmo2dWJQOTBVU2I2czJtd21qeGxIQjZtdWNXbWE5?=
 =?utf-8?B?NitOQ3dLOWtzNlA1S0hOZVFjVmpTZmh6N3J3YWZVY0duN1czQ2RoK2VGTGFK?=
 =?utf-8?B?WEtPcUJxUzlOWU1SZ09vbzd2ektRMU1icFRGZU5rcjJsWUpBS2FYV3hiM0hO?=
 =?utf-8?B?cEtHUTVyOHdtNFM5bjBiYUZTeWN5WlF3SXZudTY0cFBiTWZ4dnZqS1pqT2h4?=
 =?utf-8?B?YmJMckw5ZVZXaVNXMnR0MXJZRWVtQmZ5ZG5EWDJtaXg4K2RXeFNibG5KVGRh?=
 =?utf-8?B?TDVBSnBTQ3ZlaFRCenpGRDFRMEdldlN5K3ZQY1p2SndML0t6WlNzelJpVFpO?=
 =?utf-8?B?ZTVNUXhYMG9GR25lYzREVDl3bmhrS0F6QTEwV1FKVEU5VUNpVGZpMy9qVVFk?=
 =?utf-8?B?SHJSV2JLajY0L3VZNVRIL25FajhUZjdNOU5aaW94c2x2ZHZyZTNSbjF5dHJo?=
 =?utf-8?B?VHlQRE01c1MxOHdXNTdOVVMwWU5mNUprL0dCcjRsS0lzc0NOa3pvNVBDUzBF?=
 =?utf-8?B?YXVPNEZxM2ZwVjU4Ryt2NmFLRnYrWHJKYXB1c1h4aU1ad3ZhV3A0MWpsQ2w2?=
 =?utf-8?B?OEs3b2FISkRzS3JDcnd2Y2dob1RNck56R2FIdkthVzZTNE9CQm1WZTN1MkhS?=
 =?utf-8?B?TjBsN3JRQmNwUmRQcXFSNCtHcFNlMEtmeXNDUGswUUhKWllYSzJ2VEZvN2pl?=
 =?utf-8?B?QTEvbVlkS21XSVB0bDF4R0I1b2NCcjlCclBaeTZ3M2pMTEthSnZGN3JacjlQ?=
 =?utf-8?B?cGhhMlNnR0R0azJDdkNGWk9acXJtREVTNUdOUGFxWHFvZGRROFpFYURnb0Nx?=
 =?utf-8?B?aVVKZTZEWlNaWkg3b1ZJWVlHZFRqd05XSmx6dHVsdm1pRW1ydmRQSlBicGFs?=
 =?utf-8?B?UU1lazJTRHcwaVlkWnl2T0NEMDlWeDBkazNyNnZEaGRqdk1RR2FpTjdNQlow?=
 =?utf-8?B?K2s0ZFRxT1NmM2doRkRKV25ieGFROWUxc0pEcXNoTkIzUm1uTmpzTzhsTzRM?=
 =?utf-8?B?MlFlVkpMelFWaEN5dDFkV2o3bHhYdDZ0MzMzSnFBY01rYWVoRVg1VVpwOW9W?=
 =?utf-8?B?a2hseDJMeVJHdnlMa09tOWhobkIxL3lpVFBFVzBMbEpDYkZFYnoxOE5vdy8x?=
 =?utf-8?B?bldSVWlyeXBQdlBWeDd2UGNFcW5NOCtFNW5BcE5IR1NRUHhRcjJwNkV5MnE4?=
 =?utf-8?Q?WyM+YJl1Z3OTZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cUtGMHZLMHQrL3RLeGxycVF6Q1lmZ00ySFFHTkl6NnJSOFNWZFV1MlA0cmVo?=
 =?utf-8?B?TkJHK0RtdVFOT1ZjcVJUMFNYV2JEY2VSbndDMFBZNW14SlR3SlhHZXh4MmJF?=
 =?utf-8?B?bDFoNjAvZGZmRjFDa2s0aXRYWitPVloveVdJUDZEUjhBNVduRTJWN1lVU05I?=
 =?utf-8?B?aGtJZTZtRGlSTGpldTBTY1p5NER5R0Z6VUMrTnRUc011aEJROGlEVE84ejJy?=
 =?utf-8?B?TGlQMDZlN20vNHpKTVI1ZWhKK1hTbGJ6cU5lWXExWWQwUE9JOTJCRmQyL1FU?=
 =?utf-8?B?cmFEWGxmVGlaSTBiYnEydzA1enhuRldGOUplcEdEY21USlJZSXlweWs2WmZ5?=
 =?utf-8?B?ZGFHTitmcjBRRGVTaDVBZm9ja0J6aW5yeHRGVUhaT1R4OXdzK2J3UGlXMldX?=
 =?utf-8?B?WlNpTVVhZGk0b1ZzU1N3cEpKcVllZk9oNUNZSjZCK1o2amhjWUN5a1g5TjVk?=
 =?utf-8?B?YkppZ3ZpZUZZc1drb0x4amtRUHFaRmNaWHV4WjNTZTFpeUxzUlY2cXBvSzI2?=
 =?utf-8?B?cEd5TWk2Yll4UW42R0RQbXorU05VZjJTdTlYMGcweVlrakhPOUtldyszRDZV?=
 =?utf-8?B?TEFhNVh4eVhKb1dRSDRsMkRYRWZZd0dWTkhOMkQ5bDNkbmtON3J2QUJobXJJ?=
 =?utf-8?B?R21xZUxTaXJxSHNKU0ZtVzduUmREUVpIT3g3SmtUWTZucFB2ZFFQTlA1aW1P?=
 =?utf-8?B?cWEyVTU4Z0t5aDNMbG80QzJndmhGdlM1MlJyL3dZcHNyNHZxUkYxc204SVhN?=
 =?utf-8?B?Z2cyZmdhT1A4R29EM2xtMkRROUlvTi91bFIxYnozSU9OTDhPamtTSnFVS3hx?=
 =?utf-8?B?QXd2VXZEaWxNMDRQNS90SGNoV0g2RmgxTkI1SXM5S0VIdjYrTjloK05QRXhL?=
 =?utf-8?B?Q1h0TzVIeGluZWZuVTVuckYxTFRKWk1xcDBFNkZxam4xWlBzekZhdXNVZ2Jr?=
 =?utf-8?B?a1hxakllMUJzQ3BVaVNHcXRYb2d0VFhuZ254OG5TR0Y4SDdjOVRad05GNTRE?=
 =?utf-8?B?Unl2aWNtV2I4QmZvMGdJb3R5WWdxOXowM0FLOWJhN1pKVllZVERaWUI5YU80?=
 =?utf-8?B?UE9lRXk3dXFUM2RGOXZiWEJhazk0MTFsQ3RENThTTjZIUGhlYkpCdHBEVGdQ?=
 =?utf-8?B?Y1p4dUs3MGdYV0VINDh4K1NEYlc3TTB6T29MUElRQVY4U3JvSk9VMkxNNXFx?=
 =?utf-8?B?anBiZWVZN0pGOGV1bGl1UkhXZ0pTOXMveHVJZk04ZktzRi9BVjVoMlJqckV1?=
 =?utf-8?B?aWRWUzV3ejA5YStkUzV4c1FtRy9Nd2dvbUxtTDZrMVNWQlNYN3c3V2xTbDZP?=
 =?utf-8?B?MEtaTC9jd1d5c1prNHh0U3pvMDFBZlRkMVdvNmpFcGtjQk13TGx5VUh3Rmwz?=
 =?utf-8?B?U3VJVDJKcFBjNHIvNGQxeWMvekc3b1ZhYVhyS2lxaExwSnlxb1dFNHcvUmFp?=
 =?utf-8?B?OTZDdDFTRURYRzJBM2ErWE55NTBrVWdYQUVhUXgxTUxhbUdSaDBKTEZ6Q1VT?=
 =?utf-8?B?N0w3VzBRSytHWlhWdEszbmJwQlV3ZVZjUkp5R2JwbFdJUXh3UVowd2lVQXc3?=
 =?utf-8?B?NXhjL2pLUmt3akdjRTNEbGYvN1hHOWZLVnJZclIrZHpObkRzV05nNXFKVzVR?=
 =?utf-8?B?ZDh4RzBwaDNJcklRWUZUbGMvTllJOVJxNjhDN0U5djQ2MlB2TExmclBhSHlI?=
 =?utf-8?B?U2tva3Y5T2J1S3I0TG53d3hLZDZhbVd2bmNZSzZpK1d5elg5QndJMWpxRHQz?=
 =?utf-8?B?Ky94djdSMXloR1BhamtRcDFvUkcxSmUvWnlOZDZ5TFU4dy9IaENkTVk4RDI4?=
 =?utf-8?B?WUlQLy9CdlMrZC9xeS9Bd0ErQXRLU1FOZXVMc2h2KzZCRCtnWit5aDh4NUY1?=
 =?utf-8?B?WmZpdDJNMmh1dmtRUlhmdlMwT2grLzB6cjdaeWxETkVReWpZWGtFQkgrY0dz?=
 =?utf-8?B?MWlZVjN1YVB0RlJlaUE1bU95TkpXNjBnM3VlaVNkdWZIcDdQbHJpSk1SeGQw?=
 =?utf-8?B?d1NXNFRMZTl0YVJhZFgxTG9yTWVOY1Q5SDFUR0lqREhFRjl2dlRpaU9Ld3ZZ?=
 =?utf-8?B?aFM2VDlDZmdKTG9PRGJsemovbzhUU0xuWGNMaUlrVFZnaWY2cmJ6eGFyWHFk?=
 =?utf-8?Q?xM/Y=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa2b7bcb-4183-440f-5315-08dd620cdab6
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 08:55:50.6572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AcQ2aRg+2Jx0R4s7SOfcOwbSO+ABvQAZGz4BvmAgkIr/bsjtcft9HcVES5gct+oz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5994



On 13/03/2025 09:48, Orzel, Michal wrote:
> 
> 
> On 12/03/2025 14:52, Luca Fancellu wrote:
>>
>>
>> From: Penny Zheng <Penny.Zheng@arm.com>
>>
>> virt_to_maddr and maddr_to_virt are used widely in Xen code. So
>> even there is no VMSA in MPU system, we keep the interface in MPU to
>> don't change the existing common code.
>>
>> In order to do that, move the virt_to_maddr() definition to mmu/mm.h,
>> instead for maddr_to_virt() it's more difficult to isolate it under mmu/
>> so it will be protected by #ifdef CONFIG_MMU.
> I don't understand this rationale. I did a quick test and moving maddr_to_virt
> to mmu/mm.h works just fine.
Ignore this comment. I was not right.

~Michal


