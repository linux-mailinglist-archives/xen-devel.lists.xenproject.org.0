Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5164BB08DBC
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 15:01:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046850.1417242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucOEV-0004XS-OJ; Thu, 17 Jul 2025 13:01:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046850.1417242; Thu, 17 Jul 2025 13:01:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucOEV-0004VJ-Km; Thu, 17 Jul 2025 13:01:07 +0000
Received: by outflank-mailman (input) for mailman id 1046850;
 Thu, 17 Jul 2025 13:01:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yjFy=Z6=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ucOET-0004VC-Rs
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 13:01:05 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2061b.outbound.protection.outlook.com
 [2a01:111:f403:2405::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1833860a-630e-11f0-a319-13f23c93f187;
 Thu, 17 Jul 2025 15:01:04 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by CY8PR12MB7413.namprd12.prod.outlook.com (2603:10b6:930:5f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Thu, 17 Jul
 2025 13:00:59 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8922.028; Thu, 17 Jul 2025
 13:00:59 +0000
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
X-Inumbo-ID: 1833860a-630e-11f0-a319-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sYTRrRqXpugXSw6RRkipjJIW6vkJIf5mz+SLPAOO+rMpyQ/bvFMY8bfJlhUIB205WoTuxeQetGojDFCia+4OT+XlSup/qzB4bzTQ1rC5vkb7j28Kl2JAdf5H6MiEsaBtM+QLUcPlxfGN5s4V4NxOQH2bmr/N9iT1Pox2slVDjNESO3YjLelApUJoWVCNSc8YlNV0oGQtTRwEInBk/lr5fzezrklftm6sx8YmzDhDsAaxt+Uk+M3hNPYngLvQE8iaJxBdKqGHdBBVoGdl23dfBCDBoQkHqmMdIIkCDUJtWG3X5ye/f+A6aDSs0JnHd/7pplOdHRFnIRiLbU+FXIS5sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fYRI7abob4xdloZ0InzDLV311A+vtl6Ssa8Hm9vrwD0=;
 b=nbcIZ7DncVVXPld6O7+4vpN+5KGYGnX5cfnB+0WWrPCCewRsMvfjzG3Sf7lRDuZlvHfahQL5x4xRyjw6ki16LZRsk5qYr1EiIYwVRwOoXkdYvoCDqhEX3G6XgvCTIzaMT78sVZwli/kl8wG1wTE//IgMG/UDZ/xZXGcg4MlSS+nuO5T0UgusQVdj72rAwumebdKfTLRVdOycBrpmQqjnrP6tzAQ5z96MkXQDKMugImOZ36Pre1Fb1YcQIJhFNp8Pf0yFlW3Rwfp7mcSjF2kNm/z9hXDTSvIf4gaK3VbH0fVq34qyqBaaxzUADKjFyk250JryOolshtvKlw5X2CGnKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fYRI7abob4xdloZ0InzDLV311A+vtl6Ssa8Hm9vrwD0=;
 b=LzgQVioOM5xlBB2ZXGrrnznyOfgM4uMSKCvpzRGxcMSZYS0z6yx/gCesmMgOotez7+I4fsjM5yQ3HX+3IMl5VgwdTbOTMkm+wawQWqaprwmd/g0wbu8cD0KA9kRJ/t17XAXt7vhtBT/chCQFlBBrDZ0dVYzWqzCVaDG2Sbmu7Ok=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <3ecd6a33-bfc8-4827-8691-add60c60607b@amd.com>
Date: Thu, 17 Jul 2025 15:00:53 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] arm/mpu: Implement early_fdt_map support in MPU
 systems
To: Hari Limaye <Hari.Limaye@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Luca Fancellu <Luca.Fancellu@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
References: <cover.1752565274.git.hari.limaye@arm.com>
 <e6a881be371c54a6bceccfac2a7c2fae887ea023.1752565274.git.hari.limaye@arm.com>
 <43e05cb4-c17e-41ac-bd14-413e073f2c2e@amd.com>
 <88524379-8162-4F35-BECC-CE98535D03F1@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <88524379-8162-4F35-BECC-CE98535D03F1@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0241.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::6) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|CY8PR12MB7413:EE_
X-MS-Office365-Filtering-Correlation-Id: 317df42e-1752-495f-e8b5-08ddc531f99e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WDRRQzhJRVZobEU2VGhyaHZNRnZ3TXI5cFlLT042MTZLMEo5WmVyWHB1VkRP?=
 =?utf-8?B?akNiZ1F4ZUhlYTBrajVMQVp5akFwWkdoYXE3eEZNZzV3ak8vR3FiMzFUcm9N?=
 =?utf-8?B?WjRDcjlhcHZTM2tBRkV3UlFrN2ZtZ2l3NExXd0JTZUp0ZFJuZG9DVnF1eUF6?=
 =?utf-8?B?bGlTN1I3NUdja2d1WW81WnBEV3IxV0gwaHJ0b3ZhNTBNbytiOXpLMUZBQ0tT?=
 =?utf-8?B?L0hSQlJXUk9IcW1wMDVZN1h6c05mTDl0QzRaQXVZVmZaTlEwUXZ3VXUxTkRY?=
 =?utf-8?B?cEZDMS9odTBocDhGd1I1dWl4Y2toOTg0RkVJSEZqN2hkbDJJejkzaFk5U0VN?=
 =?utf-8?B?SklKeUZCVG0xWkMrTXU2dGFpTTRqbnhZd1NMWW1DcHdQNXgxUDR2RWtwK0lY?=
 =?utf-8?B?OHh1R1NkQ3FHeVZTWHNaMkd3SkczUWpaVFdPd2NqR0NSakJtNllseVVpM0Zl?=
 =?utf-8?B?dFNDdGRseHdJRlZKV1ZLLy9XYkpBa0VKenlOdXd4OW95eUxhOTM3VHRDaHU3?=
 =?utf-8?B?VzVuYmR2LzhZNUVIbFZlSVFBTnNseDBvRytzOW5MTFpPUzJoUGsyQkZ4aUFS?=
 =?utf-8?B?T1p4RXd2RFdWV2txdEV3eG4ycnlpaHlydUtEQVU5ZXdZZXVLMytpQlNLb2dX?=
 =?utf-8?B?UUZhM1M5QU5ZN2lYMVhCWjQyRTgvbkpYcUhxNEFJN1RQWlNwZWFjVStscEtY?=
 =?utf-8?B?Y3h4bWMvL2Z4VzJhWmE0WC9ldDE0ckRWbjkxWStmLzB6NkxaNmJwS1UvY3JR?=
 =?utf-8?B?ZmtkSHZydk9aZ2FERytjdXFUSjJwWXlzeW9UdUpFMzBhK09HS0RpczNkUUl3?=
 =?utf-8?B?NFpSZC9BYjcreVhzbnpBcXJlRk5hT3ZxNXFHdVJSS1RObXpuZzhhOVR6bkdK?=
 =?utf-8?B?YUxiZVdJRXlzRU80VGxtb2Y4MEZlU0lUT3A0SHYrK2VwOENaTXZndVJsSVBi?=
 =?utf-8?B?aHRRQVFCLzBITmo4WHpNYlZvaGE1dlFFc3EvVmNscDBxOWpBdm1ISlVacVkw?=
 =?utf-8?B?VHoyZGxKbFFWbkNMc2tQN0xLZHg0MzZCeFlmNFRudDllR2F2TGVtSDg0Q2Y3?=
 =?utf-8?B?cHhCT25wVTk5QXh5MWszTHRqOWpENGtIOTR0RC81dy9nT3A4Z2RhakRaejNL?=
 =?utf-8?B?WFMydzBCZmMxV2ZGNDlVdkVqcGNWS1Voc2F4OWJ2eE1oRGowTzJOd3NUNFBr?=
 =?utf-8?B?dFJxbHppZW96a1ZKNVJZUFpOZFNNNXBEUktDS2NWY0lzb1RVb2htc2FINHBl?=
 =?utf-8?B?b3VocnRPb3pTNzdVeWUvSjJkbEdHOXhSNHkxeTc5RDVSV2o0RmZlU1lia3dh?=
 =?utf-8?B?NkhVS2V5QUJLWktsVG9SWFEzUlVNdmtMQXNWcGJPTUY0MTdIeUxoVHVMSi9s?=
 =?utf-8?B?bGtkZHdKS2VyMWlRZWRmeDc2U0kvdk4rd1kvdGtBZDlKMlBuZTZyYkRUdmtz?=
 =?utf-8?B?WFlJY1Z2b2hrSnlraGNSdWdMZWtqM2pGNUJYYWw2UEZTcHQ2NFlDZ3JhdGdk?=
 =?utf-8?B?c25XM3dKUWJGUExFcTV5U3dSZXdLM09EY3g0U0xZb1lFbXVlT0pUVmxGWENr?=
 =?utf-8?B?a3diRkdjbFpSZktBQWFObUo3M2xaRkdSOGtaZDVDajY5ditVMXpwc2lCb0p2?=
 =?utf-8?B?WXhCUlhJRTBmbGcrY2JLeGw0U0Y2VWxFeVZtcHdZV2hOKzk4UjZmZHluM2xN?=
 =?utf-8?B?VldsRmVaRFBzaGVzNlk5Z2RpR2MwenA5Z2x6RWhxWlorVjNMdURLRW1CcjNk?=
 =?utf-8?B?RVFaTzdVWmJKRU8xZG9yK0FybDFYL1JtaGlieVVJUFViaXJoSlo4cE9CcUR1?=
 =?utf-8?B?QW9mMjFTUHJldXkxOEpldlN1TFkwNVFqcC9LOG0yZTRVM2o5a1FsOFdxM3VY?=
 =?utf-8?B?alB0TEhXTFVVWkgzdG81YndIQ3pIcFZmTjdTTmJvb3N3Z3c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZzdCTGwwK29Wb1FqZDJuVjJvMmsxVE1GMzZqRzhLbmdNT294U2NYU3BseXNK?=
 =?utf-8?B?YXFrQTUzcDlsZDVSeFV0RFF4SmI2czJsOXRiNHNUWjBHV3YyMTgzVi9EUzdo?=
 =?utf-8?B?czZ0Z3BuZHBLZENxbUw0aHRKWjQ2TUxHalFlaFNUY2hDcDFEdUN5cytUVGZx?=
 =?utf-8?B?N1lpL2tnc0FyOVNXbE1LWXR3eDYvRTNHa2VESHpJenQ1dkNldXFlSDg3b2Zi?=
 =?utf-8?B?QXQ5SEQxOFE2TGU0eFFOYmRJUDYzUXYveEhGRUpKQmVOVWloaGJpYTBocURo?=
 =?utf-8?B?aXdCVUJlbStuSmd4aDkyMFlkSGNPazZnRHVYcjBTOGhsbHVZNVpOOWFxVUZJ?=
 =?utf-8?B?ZUsydUl3OGp2ektrMWtMeDRma1I5QUs4Yjg2SlBSZng3elVSMDZzaEE2U1Bl?=
 =?utf-8?B?QWxxSlc1anVZRlVVN0NackhFaHZIeWFOR0N2dlZzb0szZUJyVTRzK0t1SGpX?=
 =?utf-8?B?WGVocFI5SHV0TnozdnJuNWZ0M05taHBmNHZxWG9DWFRDcW82VWZQUGU3RFlo?=
 =?utf-8?B?ZHJCeUpvZW5ldzNNQTh1eWplZTdCNHlQR2taMkwxWW9ZQ0IraFhPUkh0ay93?=
 =?utf-8?B?NGxpeUtXY29lSG1vdkxraGYyMVp0T0lNWUc2dHZXNVE4WVRRNjBGVmFvMHV1?=
 =?utf-8?B?cjFQODJCdjUzVk9CNnpNNUZkcWI0ejJJN28rS2wzRnduc2xROXRBYm45VnhP?=
 =?utf-8?B?bXg2eDhwMTRBdU1GWnpoMkNMWWFRaVhsK2hiVW5NbWxTZjhXaUJNYm45NVEy?=
 =?utf-8?B?TXVRaXdjQjlwNnpDREFVaWpST28vaFBHL2ZUTjJ4UkxqbldtaFlhWXdncEZH?=
 =?utf-8?B?eUVwRi9BVm1nekM5d1BVYytwdU5Id3A1Rzh5WFFXeGdZUnB4SmxFS0ppYWFk?=
 =?utf-8?B?eDc0WllhVUp1LzRuTXZEMjhFMDlLVkVPUzBQUVZyTFJPQm0rSTFJSGdrbEFC?=
 =?utf-8?B?d29Reldpcm5FTU1GaEl2SkRZWDdvbFZqSTNZMmdZNlJ4N1NkbGZsbjkzQjRn?=
 =?utf-8?B?MEw5djRRSldSdDBTa0t3cGFxamdjUHRrSmplNTRncGJON3BhazE5K25hUDVO?=
 =?utf-8?B?M0M5aktXYUwrbzNSV0p6TXNmUTJwY1BwWG9oNjNZRllDdFZXU2lXbzE5MXcw?=
 =?utf-8?B?Qi9zcEFwUFIvMjI4WWduVjQ3L3JNa1J3MTFuSzdJWGVuM1g2NDhVOVNkMWlB?=
 =?utf-8?B?TExocnNuRHVMdHcyWit6OEZ6YzJGNHJXK1FhNTJ3SlRIdHhwTEs0bGN6VUlj?=
 =?utf-8?B?M21IaFJiaG9lRDUzcFhOSnJsODNtL0IrSGIySDcwcm4wQ25lUE1QeDVqYkNC?=
 =?utf-8?B?RDJiTCtxNGl3ZUkyMHFiSGROYVVCWWFaVzZrWTU2Rm1lbTZOdVVnbzVzNnBJ?=
 =?utf-8?B?TUNIelFYUUowK3p4U3FueUZsb1ZWRU9YRWUyaWdHSWYvRXVuem5tM2JTTjR6?=
 =?utf-8?B?MGVJNVg0b3AxUC9TdXc0WUI5alBoVnB3aHpPSE9pYk9LeGJ0VTVmN3hLUXBx?=
 =?utf-8?B?RElSRWgwMXdZYjFVUWhNZWkrcDBkcjAyeXArRVFET1lvcjFrNjVLaHIya2cx?=
 =?utf-8?B?T0EvY2puYi8vNkhOYXVZTG16bWxJWTVTVStya0lJQUFwRmNlQnV4NGZGMDYx?=
 =?utf-8?B?bm1MVUE5MVExdmR6SVFWZGZzL0h6emxWY0NUZDNLZ1M3bldyQXNNalIzRG8z?=
 =?utf-8?B?dmdBU1NhLzJtODNIMTFUb1lrS0pSc08xdWtsMFlEaGd3cVNOMzk4Y1Q0NERC?=
 =?utf-8?B?VXlmQkpjNDlxWlJmOE4xTVJUc2tJVlN2V0tqbDYwZ29FdnpWN2t2NGZEN1pU?=
 =?utf-8?B?cHJVTEpucWNSNFRwaElQc1FYUTFIQ0U0d3ZOQng3LzFDREdyb2FWdGNFRXBh?=
 =?utf-8?B?SDVkT3hGOWNuMjB4VVIyM29rUEZqWTN6L3ppbXlWalBSVVJBdjdiV2dVVjcw?=
 =?utf-8?B?d3pvdncvTW9KTXVIRVJLMUJxOStqbXJrNTBzanYwaS84ZnNaMWNrRFVKaDA3?=
 =?utf-8?B?QmttUXo4Y1NoVjhxVXhhY1pPRFpscjZWQnlkOGJ2ci95cE00Rk5oSWtqY3FO?=
 =?utf-8?B?aFZSVk9tYkdueTdxNTFGYW5qT0JDSUZLQkZjTDdCWmpDT0dTUCtuQU5TTDBo?=
 =?utf-8?Q?j5pBnDGJCo6WvM7jTWjBpb7e+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 317df42e-1752-495f-e8b5-08ddc531f99e
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 13:00:59.0141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tgOSFJTaT7RzBQkFhQEMwbEzeoMf2qr5Q7C9nz53yMAuL/jjDm2J7FoUEcH05RKz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7413



On 17/07/2025 14:58, Hari Limaye wrote:
> Hi Michal,
> 
>> On 17 Jul 2025, at 13:54, Orzel, Michal <michal.orzel@amd.com> wrote:
>>> +    /*
>>> +     * DTB starting at a different address has been mapped, so destroy this
>>> +     * before continuing.
>> I don't understand this scenario. Can you describe it in more details?
>> I know that early_fdt_map will be called twice. First time, mapped_fdt_base ==
>> INVALID_PADDR and second time, mapped_fdt_base == fdt_paddr. What's the other
>> option?
>>
>> ~Michal
>>
> 
> This was intended as more of a sanity check than a situation that was expected to occur. Maybe you think it makes more sense to remove this and just add an assert that `mapped_fdt_base == INVALID_PADDR` here?
Yes, assert would be much better here. I can't think of a scenario, where
fdt_paddr would differ depending on the call.

~Michal


