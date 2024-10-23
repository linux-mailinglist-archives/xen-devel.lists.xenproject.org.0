Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C009ACFBA
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2024 18:08:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824813.1239011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3dtP-0002K1-6P; Wed, 23 Oct 2024 16:07:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824813.1239011; Wed, 23 Oct 2024 16:07:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3dtP-0002Hh-32; Wed, 23 Oct 2024 16:07:27 +0000
Received: by outflank-mailman (input) for mailman id 824813;
 Wed, 23 Oct 2024 16:07:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gNzn=RT=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1t3dtN-0002HZ-MH
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2024 16:07:25 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20617.outbound.protection.outlook.com
 [2a01:111:f403:2407::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3ffe5c0-9158-11ef-a0be-8be0dac302b0;
 Wed, 23 Oct 2024 18:07:24 +0200 (CEST)
Received: from MW4PR12MB7334.namprd12.prod.outlook.com (2603:10b6:303:219::21)
 by IA1PR12MB6305.namprd12.prod.outlook.com (2603:10b6:208:3e7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17; Wed, 23 Oct
 2024 16:07:20 +0000
Received: from MW4PR12MB7334.namprd12.prod.outlook.com
 ([fe80::2e77:557:17d5:86f8]) by MW4PR12MB7334.namprd12.prod.outlook.com
 ([fe80::2e77:557:17d5:86f8%5]) with mapi id 15.20.8093.018; Wed, 23 Oct 2024
 16:07:19 +0000
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
X-Inumbo-ID: e3ffe5c0-9158-11ef-a0be-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uQSkzid7N+GltgSmlRZynnudVqrVlzJ4HDSzDusJjd4/GmWDfLDAkFugHfPzULYfZdCVIswtXtTwTD3xEfhjca7G4W6JaFWTnHJMExXqZrs2a74zVxBiA9/3EfIdyY1cT8BEoBTl321d3m2acWRMGUeGwfN86z8ozvotcnY/42EpFHEYXGRNvx2H30YIKRCMAPbabCahAphUoF49uNbi9Ep51dHQQ2JQfUg54cBDBqAqa+FboeZeqBAiSYq5qvF4wLSf1cYuRklL65FuysZE/QPpKlQTSXG49EcagLQxYpHmlbSdtMXLKk69vpGHRC2Mdc9GfVVgMol8QB3eY2Co1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6qIt4seSLEjmWBOcFg4HlqmTjv1excIUlr7bVaa8hbs=;
 b=S3HRGOtFxaG0C4M4opV6MD2ozG/fRoj5pXRx89LoFnOkNC3KWS5Kn4QLWW+koJDPyGLfHHvk6c9JnLXTtd4ez58x+olzIsTqtzYfSKOgRgc6mgp/2vPzN4upXCYoQ+AOcWS4l9y5XiqJl1Qlre6aTgdD66z//NCnqM8UN1tbaRq9GRAEjAhqVl2e18vGAFX2F+O/1J4o22FZtCz73jNaHViJfbsBgBPHx8Voq1zenziBO62CeltwSwHQMd7x/oaJ/jKTMgMb4kmxYoWmzKrAYXb5g6IeS2hoK78kIMoM+wOI5ncacTs8tH+N+mR1u4hxz/YVrbWRBu3NwI2RoWymfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6qIt4seSLEjmWBOcFg4HlqmTjv1excIUlr7bVaa8hbs=;
 b=L3mUMp3xi2lBy72BtumjU4nxMYQ4Woy+i7M6cHuRW1qWQ0Rae2Fp8Lthbu5eweqT8zWGz4sD82Xod/TrI4KWM0jSCCHMS9aqMAfHt9G9/yl2AmPh904sDHMV/y6WDq/EdqdmTH8+0n96dEsS5bVZz4JRqtvvkSUCHLFz7KIlB1A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <8991e9da-5abd-4fd7-919b-fbe87d747838@amd.com>
Date: Wed, 23 Oct 2024 17:06:52 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] xen/arm: mpu: Enable MPU
Content-Language: en-GB
To: Luca Fancellu <Luca.Fancellu@arm.com>, Julien Grall <julien@xen.org>
Cc: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241010140351.309922-1-ayan.kumar.halder@amd.com>
 <20241010140351.309922-6-ayan.kumar.halder@amd.com>
 <a6a66bd1-45dc-46d2-9e45-8fef8b45e003@xen.org>
 <23b86010-d467-42fd-bba0-65b58e05beaf@amd.com>
 <DEE00B97-ADA5-4229-9B41-571C38F7A6C5@arm.com>
 <f444f549-6f4e-494b-af85-aeec127722c4@xen.org>
 <A302D615-E25E-46DE-A4CA-4FF911293D83@arm.com>
 <d1e8decf-3c63-41fe-a6e3-f880b984dda4@xen.org>
 <61C13F4F-24D2-4B6D-9216-813EDEED4865@arm.com>
 <5b8d5c3e-3c52-4b3b-b63f-c89a58f40f10@xen.org>
 <4E7C8350-D6DE-43D3-B269-185FFEE62B96@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <4E7C8350-D6DE-43D3-B269-185FFEE62B96@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0629.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::10) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB7334:EE_|IA1PR12MB6305:EE_
X-MS-Office365-Filtering-Correlation-Id: f5357a29-4e95-4511-9148-08dcf37cbbfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aFlFSlg4VVhPV2ZxNmhNUjFmdGIvcDByYmZBS1hhRjF6dGRRYlB1UmZDalpH?=
 =?utf-8?B?MGs4SjNqL21VTk0xdjNKU2dHUUtnZ3U2ZkxkOUZSb2wvSlArMEVIbm9wVUdC?=
 =?utf-8?B?MHR0eWNxRTNkVHRNODZsNm9FZ1BvZ2t6aUJJWmxBcnlHTmxNaTU1N2NhWDRT?=
 =?utf-8?B?UGxDMUpteEtoV1JDWDRSUWc4bHpHZ1dwYjMxOTdKWWhwbWVnZ2h6ckczY0ZR?=
 =?utf-8?B?RnJ4ZmxYRGx4WG1TSFYvbVVGNjBUQlZJSVoyazVwbWo3NTFLQWc2OVlMN3Jj?=
 =?utf-8?B?cmRkU0V4MkxRVzFzamlaRzVRSDNUNnpadlI0ZUpRd3BuQ1BEcGFoOGV2RFFi?=
 =?utf-8?B?SGVWTUl0d1dmY1RCNnhLbGxPZGM2TFAvU3ZqNmIwdjVKczBUci9Va3dYalZh?=
 =?utf-8?B?Y0EzOGRwMWc3MWhFcVF2eUlDR055TC9jaUpYTmpacXYzVGprdXdHMURuUXll?=
 =?utf-8?B?NVlJUitwbnFDUGxIUVpwMzdweWdkNFR0dmFESHpIS2g1NmxFNkQzR0txSXBM?=
 =?utf-8?B?OWE3Qys5M1JpajRDTnFEdXdSaGpFUXVVdlA2OTNFVXZtYzBnR1IvbitEZDJB?=
 =?utf-8?B?ZkZtNVd0SmFESnBtLy8ycCs3YmVaL2VuaWpud3lXbFFIU0FrS3NYRjRjRkxN?=
 =?utf-8?B?d3Awb3Y0ZGh0ZkxqVCtWNUlwaHN0aUtqWGs0emxUR1BsNFFCTGIvRmJIMktD?=
 =?utf-8?B?cHQ2MTNNdnZiTmVuN2JMSjZiTjBTWjJtclI3akk1MWRZa1d5UWdRTDdZTHJo?=
 =?utf-8?B?NnBiZE5ZcUZSVW9uSkkxUWdKTFVydjkvUWVPbEdLOE9LR1JRc0c0bmJjbWNx?=
 =?utf-8?B?emNsZS9sSGtSTldlKzZ3SnJEWXArSm5rY0hvNVAxTnFjUTE0SGMvNWVoS2RV?=
 =?utf-8?B?ejJyaHJoMjZzYTRSWVBWeFJubmE2WTFtYzJiR29SZ3p0SEZtaUtYMUk5Y29T?=
 =?utf-8?B?b1F0d0hId2gxY25TbXpxK1JmQitDNXlKYUNXYzR4U1VieWNhVWlmSjRZejFS?=
 =?utf-8?B?QzJER0FjelB2bW9SWWExT3ZNZGhZTm1CWUpYYzV6UDhvWjZhZTV2L1dyYXlh?=
 =?utf-8?B?OW5NM1ZoVTBFUGg3NG1UbTN0ZzhNeDltU2xPbFJiSERDaVEyRUpnSk9wNi9Y?=
 =?utf-8?B?bjM3YWlVSzMxWkVYQ2I5QmRLa1QyMjVjSXVrVkJpcGF5VitySURWSHpocHRU?=
 =?utf-8?B?NTcyc1VHOWdJamhBKy9kZXFucXFOVzNJN2hXREVxaU0vTGFzMWFPbTk2eDBv?=
 =?utf-8?B?MURnMlNBMEloR1lXU2hadjJDZjErSlh2UnU2blNFd21WUDdtcWJLZ0EzcFg4?=
 =?utf-8?B?Q05yK25FeURQUisxNWhHK0VPcVVvb3YzcndYbFovblZKYkZobWpxSXoycU9G?=
 =?utf-8?B?NE95UVJ6OEtsV3RMcTREdkxET1NvRUszM3NGeE1VWTJZbUJlV3cwdFdKVGZU?=
 =?utf-8?B?UndqV1hCNUhXQnRxY1JwdmgrNnlWdFdmdEsxelZiMmlkMzdkL2N1MDdnVzVK?=
 =?utf-8?B?ZHlidmIxcWJ4UVoyZW82aHczaVowOWR0Yzd3dkVwRngvYXRmME5lb0JFNTZQ?=
 =?utf-8?B?MjBaZXFqWjZtSS9YMzBkdng2QnlkTXoyU1BXb2FtSGdPdUtEODR5ek9lK1hM?=
 =?utf-8?B?aFBFYlBHNjhlQnpibjJuTTB1MkZVME5SRDlaUkFsTGtiQ1lDWWU4ZVhzKzZP?=
 =?utf-8?B?YWlTeVZicjc0dmtFZTZmNjFHVjVXZkhoeVhvVGw4YXlKZG9RTVFtWFl4MHgr?=
 =?utf-8?Q?zVnXlS69usTZ2AXVBfbvbFnDqxaBCciMa9wlSU5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB7334.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QVU5RUg1VElIaENhRXJJb1pRamZBd05RSFZRcU0rQkxnZllpSXk5aXRWTThF?=
 =?utf-8?B?Q2lKU09rbFl4elZBSTYrUms4QStsMEdyWVBjMDdRRU9BMkk5U1BsaVFIQXBv?=
 =?utf-8?B?NWd5RmNCdnNjTEJCdGN3VHRCdC9tYk1NcEkwVGNOam9WUFg3c0VpVnl5RVYw?=
 =?utf-8?B?d2VoZnp2cG1seTFoN0JNdFpyRjk1emtrbmgwcmc1RVhlOVB2dXYzei9iZkhv?=
 =?utf-8?B?eXF0Skx3Q014UlpHMy82WWdjNWRKRzZLV2NDSHpPcmlUeXBCYkZaUnlOYTVX?=
 =?utf-8?B?Mitodi9Dcjg1L29NZGVEK0gzUkdPVllnNXV6Si9kSlFlNXpXbWRNY2ttOWFC?=
 =?utf-8?B?VWVUUDE3U3BMM2ZzUllFblhRNkxDU1NmaUY3bTh5UEFyWGc1RUswY1NoQkVN?=
 =?utf-8?B?cEpjaEVJTm5rQUx4cGVoanNVT2pYWXdIb0k1VTQ3VmFWM1ZUOHdQM3dFT1R6?=
 =?utf-8?B?a3NZbHd3eklZa005ckFpQ3R4ZGV4VVdBbFRNMDhnTnduYzRPRk5tc2R6di9Q?=
 =?utf-8?B?N2tIZjBHelhobmlrZ3hRMWFjeUtOSldVV2F4Y0xySWE5OFBRNklZNnZyZWVT?=
 =?utf-8?B?bC83UFUrZmNLODhza3AzeElOZnhlWFo1WDRFWXYzblM4enZ4T21kOVpuWk83?=
 =?utf-8?B?UzNEU3hzUW1KcXVIRzFEN3NYZ0p4ekdGTkdVMUsvUU9wTm9mR01PMmJzdmF2?=
 =?utf-8?B?ZFB5dm0xOHNXVjBIZGg2R096cGVTS25ZMWlHd05XMHlwWXE5K1ZmUm1XMGJn?=
 =?utf-8?B?QmsrUmpzWFlwWXRkd01KSHlSUGh4T1dhM3lOdXBtQzd2VSsreVpXcFJNOEFK?=
 =?utf-8?B?RnVkdCs4VEhpa3EvaGJvZmtrbVk0SFA5UUtkMDUyM0g5UllLVk9OVFA5aUMr?=
 =?utf-8?B?YUU1bldVNzdLYzBKK0p2Zi9WY1hXR1NMWjF6ZTkzQTgveVdlMGdwM3djdUdR?=
 =?utf-8?B?bnBrY2Nza3dDNVhpcjNTcld4WTlKZnl3RG1ueWZFNWxISlI3d0RMdE1LdUxU?=
 =?utf-8?B?TU54bnQ4dVArL1Ayc25aRjNISG40QVlCUkhONjZObXcvdGtyYlRjYU9SRlZm?=
 =?utf-8?B?MHh5Zi9JWkNMam5OZGZTdUpTdldBTkJhVWtYdkZYam9XK1Ixc2NVeDlRV2xv?=
 =?utf-8?B?dDFJYW9LWmVIVXFzaG5LZXJoQmNZeDBIZWdKa292NFczSFRuRlRTSUVDTzU0?=
 =?utf-8?B?dG9wbm1ZcXRyOVJqb1FCNmJLUjZPWlpZcGdGUnZaTkRFdUFXZTlnYUJyMkNm?=
 =?utf-8?B?enp3Q2dnVzdKNUs0bCs5ZSthT2krOG1mWXdkQ0xIMklucUw1QWp1bjFJRUx3?=
 =?utf-8?B?dnhwS3B1Tko2Y3FkWEJsVGZ6bzh4dDZBZFIvR2ZSNVk2MUpMc2F3eGFjVUtM?=
 =?utf-8?B?OWQ2OHRGR3k4bU1YcmRDMUxZeE1NKzB5ZUdsaTRNTW1NNWRKdk1yMEZuVnRq?=
 =?utf-8?B?RG1EUnFJUVVMdDdjSHBoN2w4VWNUQWh0Yjk5R2xBZ2N6UzZxYUMvTUVFdHRr?=
 =?utf-8?B?VnZtS2pkQW1CbHZUN2VkMUFDcmo5V1d2bndVSC9NSHVzeTdidUY4TndxckRl?=
 =?utf-8?B?NStidFRLekVQNktyZC8rRmNvZ1lqNVVUZUNCL245dnZsL0dQUDBVdTJOZ2xw?=
 =?utf-8?B?WVQ2WGlWQi9WSHE0K3BkNjRWZnM3clpaaTUzQ2hINlNDRzBFaDF6d0kyZUhw?=
 =?utf-8?B?RWRJZ2hsSWVId2xqSTczRDZwZmhhVUR5dzdUbTRLaVhKYkI4QWxYR1IwenUz?=
 =?utf-8?B?aXRCUmFteFl4NjJ0Qm8wYVhBeFAwOXVYcmNjaUF2SXJETGtvV05wNXBBc28z?=
 =?utf-8?B?RmhJT1lxQlZLcDRoRWtDd1kwV3U3eDRHN01vVHZGUGY5K291d2tWVHF1Zy8z?=
 =?utf-8?B?TE5FVTJ0UEVVM1JiWmFPWDJHV3doM24yMlU4K2hmZWpIU050aS91aGM5M2xI?=
 =?utf-8?B?REYwak9qbGV0d1lNbzdHZ3pxbjFKOEU3OERpRmlpUncrcjZocVhhMzhiclFO?=
 =?utf-8?B?VkFOL2RHNzYrYXNnNk9KS1ZhaWJJK2RQZ1YvQ3BDWU1ia0NUUlh1RW9GNks5?=
 =?utf-8?B?aEQ2ZmVPNkd1UnZzWW44SWN1TmZIN1NsRFphcHZ1SFpHWVpjbUxtOWRCcEdF?=
 =?utf-8?Q?WwPFTmkIXPirpfmtfWIF/pHJQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5357a29-4e95-4511-9148-08dcf37cbbfe
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 16:07:19.8611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eSHomGtQ/UQKglQ6pxTdg5qYeXMwdcKvTYbLFQqrkQcL15GbBs9sg+0TYg26GGI5cU3iLknZjX45Of+mt4Y3hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6305

Hi Luca/Julien,

On 22/10/2024 17:31, Luca Fancellu wrote:
> Hi Julien,
>
>> On 22 Oct 2024, at 14:13, Julien Grall <julien@xen.org> wrote:
>>
>>
>>
>> On 22/10/2024 10:56, Luca Fancellu wrote:
>>>> On 22 Oct 2024, at 10:47, Julien Grall <julien@xen.org> wrote:
>>>>
>>>> Hi Luca,
>>>>
>>>> On 22/10/2024 10:41, Luca Fancellu wrote:
>>>>>> On 21 Oct 2024, at 17:27, Julien Grall <julien@xen.org> wrote:
>>>>> 2) dsb+isb barrier after enabling the MPU, since we are enabling the MPU but also because we are disabling the background region
>>>> TBH, I don't understand this one. Why would disabling the background region requires a dsb + isb? Do you have any pointer in the Armv8-R specification?
>>> I’m afraid this is only my deduction, Section C1.4 of the Arm® Architecture Reference Manual Supplement Armv8, for R-profile AArch64 architecture,
>>> (DDI 0600B.a) explains what is the background region, it says it implements physical address range(s), so when we disable it, we would like any data
>>> access to complete before changing this implementation defined range with the ranges defined by us tweaking PRBAR/PRLAR, am I right?
>> My mental model for the ordering is similar to a TLB flush which is:
>>    1/ dsb nsh
>>    2/ tlbi
>>    3/ dsb nsh
>>    4/ isb
>>
>> Enabling the MPU is effectively 2. AFAIK, 1 is only necessary to ensure the update to the page-tables. But it is not a requirement to ensure any data access are completed (otherwise, we would have needed a dsb sy because we don't know how far the access are going...).
> Uhm… I’m not sure we are on the same page, probably I explained that wrongly, so my point is that:
>
> FUNC_LOCAL(enable_mpu)
>      mrs   x0, SCTLR_EL2
>      bic   x0, x0, #SCTLR_ELx_BR       /* Disable Background region */
>      orr   x0, x0, #SCTLR_Axx_ELx_M    /* Enable MPU */
>      orr   x0, x0, #SCTLR_Axx_ELx_C    /* Enable D-cache */
>      orr   x0, x0, #SCTLR_Axx_ELx_WXN  /* Enable WXN */
>      dsb   sy
>      ^— This data barrier is needed in order to complete any data access, which guarantees that all explicit memory accesses before
>             this instruction complete, so we can safely turn ON the MPU and disable the background region.

I think Julien agreed to this in a previous email as long as we have an 
appropriate comment. So we will keep this as it is.

- Ayan


