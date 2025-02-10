Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE35BA2E8CE
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2025 11:14:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884533.1294245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thQnW-0000MY-5c; Mon, 10 Feb 2025 10:13:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884533.1294245; Mon, 10 Feb 2025 10:13:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thQnW-0000L6-2p; Mon, 10 Feb 2025 10:13:50 +0000
Received: by outflank-mailman (input) for mailman id 884533;
 Mon, 10 Feb 2025 10:13:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hbBn=VB=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1thQnU-0000JH-PF
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2025 10:13:48 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20615.outbound.protection.outlook.com
 [2a01:111:f403:2413::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6e5fb64-e797-11ef-a075-877d107080fb;
 Mon, 10 Feb 2025 11:13:47 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by IA0PR12MB7554.namprd12.prod.outlook.com (2603:10b6:208:43e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.16; Mon, 10 Feb
 2025 10:13:44 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8422.010; Mon, 10 Feb 2025
 10:13:44 +0000
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
X-Inumbo-ID: b6e5fb64-e797-11ef-a075-877d107080fb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dUNfvIeJCeV8XINi5acEUHrqvcPPp2eWd82BhNNtnRsTxJXcwfza7pxiDtUYBnqPQai3xt13BowHJhsEvJBgDDMSQPBf8TAOkuNJSPB3MhIoeElhsnF6ddNswn84zSpbg2+z0HGtoK5nVX9w4AHQUTVzqPSZJQLvoF/tkXlB5Y6FRMp7CrlfoAxKuwlNUDdMKTqs/mEADnSdDOz3YGAijqJdLzumk1LeaJ/6u4fLH9Nmvluk3Ewb7luiB618JzEJKSDsZQ6aiaeFRLPsiZPE9ZGLEW652c5nub4h7NCcYWQbwlDYTgvnU/QJ4aJYVjmY8NSYlXxuMVdUAh0NULSRGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B2AziEUlMD2SVzIlgA+E1reFRuYu1f8hzOIhkeGCrDs=;
 b=ShDUwqb2ICIR8bhWLrfw+O/fwAXBZUOp/TKSDPOfC+3myY/rFql6kFNRQ2MUsryZTfTwIBgnLDuUuG3Cdt8/x5SKFl45XyzCEptme6tBVdC79PLGPJT5MQfiuYL1eDOf6rdJdCTtsKfgj3gtm/axCHFfGz0BbRSCihRMkrJ+KWpEGUGfWE6WQcl9w7NFwHvMEVj9iD9HCue6rxlL2siJB+fBvNw+LON2GuswTVI6EbjL2undtp/KKL09w8KPu8IPQ77HlXcNDTHvWMpmO/QuFnEX1BOKc0yZUaIMW+dbCKoPCsP9zTlZRLXam5wm5S43xGEZiNKbgJtiiPzXquIRcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B2AziEUlMD2SVzIlgA+E1reFRuYu1f8hzOIhkeGCrDs=;
 b=Y7/QeaFoTchHqkCZHxarRYuq22rJKqSmc+8k9GRN5hirtCdYbS9XTKEWqfYcFw6ZyC3tl3BLaEC5EO5v+Ny3JmzX4hzcPZn8EuEUqxWXa+3hyIaeXw3Uludv0DgqwNUuMZx8i8gzH4xLRfuPzgqP6FrlxlSdt5oH23TcbWPQJkQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <b829abd1-e0b0-4f36-bc27-0f632deedbab@amd.com>
Date: Mon, 10 Feb 2025 11:13:31 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20? 1/4] ARM32/traps: Fix
 do_trap_undefined_instruction()'s detection of kernel text
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20250208000256.431883-1-andrew.cooper3@citrix.com>
 <20250208000256.431883-2-andrew.cooper3@citrix.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250208000256.431883-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0137.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::12) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|IA0PR12MB7554:EE_
X-MS-Office365-Filtering-Correlation-Id: 125e09be-509e-4874-f983-08dd49bb9977
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Nmd2U3Fac05pVlgrTW52eWZ0T1NZQUpHVklydCsvU0g4QWR0a1R4NGNDbXlD?=
 =?utf-8?B?emF6NkFuUVI1MU9hZU5aOFFGYThKQjNhS0pQa09CdTlqMWRtOVhoQjBlcHlw?=
 =?utf-8?B?T2tNYmp3Q1krSEZpakNlaFEraHBsWUwzUUJ4SHIyd2RUb0c1VWQ3eno1UnQy?=
 =?utf-8?B?c2NVaUFwWDBrNXBJQVhRVzhnZTBHN1dycTh6NTVGVnhBQmNsdm1lbThYUlY1?=
 =?utf-8?B?Y29mWlN5S20vcDU3UlFxSm9GLzNicTBOcUtpRUZPck5kZVpGS3dhVVI3b2ZM?=
 =?utf-8?B?ZllybzZkbEZVeG16OXFMY1FmVkFub21mUjcrZDQ1Wm1ZMHdWZ0lsOUJiMFJT?=
 =?utf-8?B?SEtIY0R4c2xJUEZFeGx1ZlNaYmxCYUpwK1hYMjBnRmVEb1Baa0JxRWpUOTBu?=
 =?utf-8?B?dVRGQXNTdDF5WXN1bjBxV0dkZTFYWU8yZWhTRTVSei9rWDJYalUwVCtFMEJJ?=
 =?utf-8?B?QmZtaG1CUlFhcGp0ZmY5WjlDVzhyU0NPcmhuVTJiWllYNHB4c2hmdjNGcjly?=
 =?utf-8?B?OUNqZkEweGd4K2I0RVdvb2dxV1RUdHFEMmgrWHNlOVp1cklvdzdCNHp4Y1VZ?=
 =?utf-8?B?V09lQlVROHlUSlN4K3c2ckducUMwbm1YemRZY0JhTy9DdkxtRzRCcVBDSHAx?=
 =?utf-8?B?TWtGem5yb1g0elB6c0RIVEo4TFREUjMrbVZpelg5enlNMGJMNjRPRi80cm4w?=
 =?utf-8?B?dUNhQS9GMVVCaUppL2Fib1NieXV2b0lvT0hQYzZWbmJYc3NhUjUya3dTWnpM?=
 =?utf-8?B?cnpDeFREOVhwZjFSNDliOVhwdW5QcU8vLzZReUlUSmRVNFd0WWdUL1p5QkJF?=
 =?utf-8?B?MTBTNzFiQXgrOGxRMlZxR2FVUE9XeFc0ZEMvRlEvNDFSQkxDZWpFeUdvbXRJ?=
 =?utf-8?B?dEpmbXpDWUhpWGZWazYybjRCUFB6NHhjalpwT0tnVStReUFKdVFzY0UxODFk?=
 =?utf-8?B?bjlxUFhqQmJJWWorOHBBL2NqNitWK21tWFgwZGN2V0VFQjVGTVRNQWVoclpy?=
 =?utf-8?B?dnlCQ0N5SC84MlVOWm9kU3g4Q2lYdlp0MFRNZy9OU1JFbDVDai8zMFFVSnU4?=
 =?utf-8?B?NUpaaDQyWVJXL3BKelJPYndPcGlLR2piZEJ4cnlZaG5xRUIvVm1QRHBOMmVQ?=
 =?utf-8?B?UjF3Y1dlQnRDK3o2UitGeUUzMnA1LytORzArSTVCZXFjK3RBcGYvYUhjRVR2?=
 =?utf-8?B?SUF0WWVqTUJNNkVCa0VVMWloSW8xMms5akp5TVUycVQ2UTBLaEdMU29tbkJm?=
 =?utf-8?B?ODE2Rk5WRFdNa2t5RVlxS3M4RzFIQTNyMVhoMC9jbVA2UEkyTjMrS1BWT3JK?=
 =?utf-8?B?bkt0VE9KOGJXZXNDeDhvWnRNTEtNT0EzL0dER1g4MjBBWXFYZG9XSVhZTGlH?=
 =?utf-8?B?VDl6aUl6d2ZHVm9mOXZiL28xdkhBVU1sTTlNT1pUKzBaaUFGeHNCYXRlNWZm?=
 =?utf-8?B?UEpEQWhnaW5BRU1VOTFHaTFnUWpIbjRHK2xBeWhVVWFzbjZxMFBsN1Y3TXlq?=
 =?utf-8?B?UVFqSHI4MkYxaG15OVJtWDZoYUUrN3NneEdlTWEyNlg0eTNacFJpa0d0Wis3?=
 =?utf-8?B?YmppQXBmL0tvYVlLQWxobStjL1FlRXR3enJZaUplZGpoaG1VNmwyZG1oMWJh?=
 =?utf-8?B?NGFubU9KVlRrT3h5T1BmSUMxR1hKTngrNDVRMXRiNDVSK3ExZkp2RVpvWUtu?=
 =?utf-8?B?RmdaekNLME9MNnJ2U2UrN1FOZDVXZCtkVmxQTEZ6TFMyT25VL3JsSEVwMFA5?=
 =?utf-8?B?NFpSalhQVjFabnRTRzBsVHJZTmZldFhkeFFCYU11UHFZdlZSZ1N3aDVvQmsy?=
 =?utf-8?B?NE16OElKVUZOaWVLczQ2dz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dGtrNHhoQXlKRmRnMVdMLzh3NjFsd0dtdHJwZmVrM1FUaGcvRWZTbTdlQXRL?=
 =?utf-8?B?dFk1R3dQbGYxdy82eTFjUU5MYU12dWUwSmIxK3pYR1ZLUkdwdkQwVmtRQ1hG?=
 =?utf-8?B?Z3UxOGJBQ1pxTGdSLzI0L0pjeERYTWY0ZWRQcWNwWGFraGtBdTFlTy9WN1Rl?=
 =?utf-8?B?ZnZwb1ZhQlN2Q2p3d2R1NUVlQXRyeWQ2d2M3d0Z1UWlOODFMYkFXckJjTUNu?=
 =?utf-8?B?ZEZ5TUY4dlJxckRlbDJRNmtLbmtabWJzdjE5VXF1bDJPUXEzMUR5SmlZRlhx?=
 =?utf-8?B?alZXVXM2VzRpQ3EvRzlEVk8zd1BXNmJTZU9ZditCaVZvWTVUUi82V2NoSTFP?=
 =?utf-8?B?VnY4NjRBc3VXRHg0VU4vYlcycmE2YlZvN2E2a3dBMmRRRWdKOG9WR2VDOWkr?=
 =?utf-8?B?LzBlSzFmUElIcVltYmMvV1pkZ09iSHkreVk0TDBjRW9iZGQ2U01CUW5qekxn?=
 =?utf-8?B?WEx1d0JEaHFXNXBnMHAybGtlNDdyQnF0emJUdzhLVVNGY2d4MHY2TExxQ3lj?=
 =?utf-8?B?dmFncWJBZmFieTQvTW9aeGFzT2FleHBKTTBkSGMzempaZWpybmZUVmVQdlJY?=
 =?utf-8?B?SWxIZ0d1bUYvU0U1U3NPTDlXVkJXTUZ3ZDRMTVhVUGtjczREeFd3a2tHYnI2?=
 =?utf-8?B?UlF6RXpMeHk5akMydlE2RHMwQ0xHcHByT2FZSmdzWEpzNTFRYnFTSEZVQWha?=
 =?utf-8?B?bXcrdTR2bXRyOVV6SGFmNEo2b3JzWk5KVkc5cWp4SWQ5d1dFZSswWGdDQkVD?=
 =?utf-8?B?eXRBeXpnTUgwcDVvUHIzWEtXamljckdOZll1NXpKd0ZWSzJYc3BGWXduWjB3?=
 =?utf-8?B?Rk4zZTlqVzZFaGN1SGdaVHZlZjJiTWw3cXo3RCs2UUNVaGpub1hQSGZlTWph?=
 =?utf-8?B?VE5uaEJqcmMrakZ4bkVBZnJMbmswMnFucGwzOVI2MUNWTFdsYW5iMzBKV0JS?=
 =?utf-8?B?Uzk5WkQxWmNUUXNIc3JXbnFMK1Y4SkF5Nzg0Y3lLVVFuVE5rejRyQ0FHZncr?=
 =?utf-8?B?NU81VDllR00rTHlUWFVIVEZiMExFR1VnM2JLc3BxWlBKRHk3VytVM0V6TGk5?=
 =?utf-8?B?N0dYRExTMG01Vk5hRHUvU25hOWNpd0xWVXFNS0d5clJhQkdNY1Z3T2hkZjJ3?=
 =?utf-8?B?Y2RVdTZ1SzhEWmtmNWhZVjIrWnQwTzFaVFJXV1NEZ011V0VGZktqV0hKTTFX?=
 =?utf-8?B?V04wWU8rVENzOTBVeTRKRkNVNEU3QjZYLzRTSVhBS1VKODhTWllQOElScVFF?=
 =?utf-8?B?Q0xJWUhLZjZWa0FsYTRwQU9XeWw2bVBFWlQrK1Q2WDNNK092U0RBSmJiNnhW?=
 =?utf-8?B?MEJkVW9HbjVTTFdZblBCbkJGZTEzWlFLMVBzcUpmRlI5Q0M4emxjS1pWeXFp?=
 =?utf-8?B?KzhPbC9kV3lUQ1BZMEpWaHRRZFZwSnRyWDh2bnd6RjhXeVROd2wrQXE4VjFT?=
 =?utf-8?B?WUZ6a0IvRDFWQWx2bmd6aGNFOG9ZNmxpYS9adHA5RngzK3FGWEo3MThneDE5?=
 =?utf-8?B?NVlpNGdKL3hCK0FDVFNZbm05dnZoU2xCcmt0NlZaOVJnblhrbnpiMExudGdZ?=
 =?utf-8?B?WEhQNkdmMWdoaHJRSlVSL0s5Uk5RUXg4eTQ1b28rZmZWdytRQldnN3F2OFZp?=
 =?utf-8?B?bjFlL2dld3h4RUE0L2FwOUNVOXlzdW5xMXhaSUtieTdodTFhWVpxcFN2VmI5?=
 =?utf-8?B?Ym9EYmxGSUtrRzAxdGJ4cWdtSXpZMDc3ckNubEtETmxrYVlkS3NEQzBaSFhS?=
 =?utf-8?B?RlNlWWdSU3lNZXZGR2RFQ0FtMXdTdDJCamtab01OeXpxalpzaU9LcmsrUWVI?=
 =?utf-8?B?T3JxYUlnTWJPVGgvUDRlTlFUT0p2NStUakFHeExyOElBQ2VwOFpnZ0ZqeHgz?=
 =?utf-8?B?NUpraGsxR2dJN0oyVzVEekN1T0dWMHMrVTgwQTNtTFlHMzdVSXMwdm1qYjVs?=
 =?utf-8?B?UnI2Rk5LTlRHT2FtU3BvTG1aVmRnNHIvbnM1UXJGVFVXRFIzbEFscWJOeGhD?=
 =?utf-8?B?czN5WkNsb1p0dHpJVjhWNEExSWhPbmNHODUvY25hUkQ5UWFxZW9JMzZ6bUpV?=
 =?utf-8?B?YktENzBGNHl0c3ZkdW92ZDhEUDZRQXkwdFQwTjBkQ1hHc0hCTUVrR0NRdnQx?=
 =?utf-8?Q?/2sx6sLLLkqME7tVXE8mYiU1F?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 125e09be-509e-4874-f983-08dd49bb9977
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 10:13:44.0813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z509GT84c+ApSimoFkQIjxM78f7Lb/vlSRQ98krpiMrGKxsyAODfo5bWg/v3GLqA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7554



On 08/02/2025 01:02, Andrew Cooper wrote:
> 
> 
> While fixing some common/arch boundaries for UBSAN support on other
> architectures, the following debugging patch:
> 
>   diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
>   index c1f2d1b89d43..58d1d048d339 100644
>   --- a/xen/arch/arm/setup.c
>   +++ b/xen/arch/arm/setup.c
>   @@ -504,6 +504,8 @@ void asmlinkage __init start_xen(unsigned long fdt_paddr)
> 
>        system_state = SYS_STATE_active;
> 
>   +    dump_execution_state();
>   +
>        for_each_domain( d )
>            domain_unpause_by_systemcontroller(d);
> 
> fails with:
> 
>   (XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
>   (XEN) CPU0: Unexpected Trap: Undefined Instruction
>   (XEN) ----[ Xen-4.20-rc  arm32  debug=n  Not tainted ]----
>   (XEN) CPU:    0
>   <snip>
>   (XEN)
>   (XEN) ****************************************
>   (XEN) Panic on CPU 0:
>   (XEN) CPU0: Unexpected Trap: Undefined Instruction
>   (XEN) ****************************************
> 
> This is because the condition for init text is wrong.  While there's nothing
> interesting from that point onwards in start_xen(), it's also wrong for any
> livepatch which brings in an adjusted BUG_FRAME().
> 
> Use is_active_kernel_text() which is the correct test for this purpose, and is
> aware of init and livepatch regions too.
> 
> Commit c8d4b6304a5e ("xen/arm: add support for run_in_exception_handler()"),
> made run_in_exception_handler() work, but didn't complete the TODO left in
> commit 3e802c6ca1fb ("xen/arm: Correctly support WARN_ON").  Do so, to make
> ARM consistent with other architectures.
> 
> Fixes: 3e802c6ca1fb ("xen/arm: Correctly support WARN_ON")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
You should have mentioned that this patch requires [1] as a prerequisite.
Otherwise this patch fails to build on both arm64 and arm32 with UBSAN enabled.

[1]
https://lore.kernel.org/xen-devel/359347d3-9a5f-4672-98d6-4c497d960059@gmail.com/T/#mc75e1b1ff6ccf4b0c7e10f55eedb7cacffca1c3d

With this handled:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

As for taking this patch into 4.20, I don't think this qualifies as a serious
bug. At the same time I don't see how it could cause issues, so I'd be ok to
take it in. That said, at least one more Arm maintainer should take a vote.

~Michal

> ---
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> Sample run going wrong:
>   https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/9078570105
> 
> Sample run with dump_execution_state() working:
>   https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/9079185111
> ---
>  xen/arch/arm/arm32/traps.c           | 3 +--
>  xen/arch/arm/include/asm/processor.h | 3 +--
>  2 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/arm/arm32/traps.c b/xen/arch/arm/arm32/traps.c
> index a2fc1c22cbc9..b88d41811b49 100644
> --- a/xen/arch/arm/arm32/traps.c
> +++ b/xen/arch/arm/arm32/traps.c
> @@ -36,8 +36,7 @@ void do_trap_undefined_instruction(struct cpu_user_regs *regs)
>      uint32_t pc = regs->pc;
>      uint32_t instr;
> 
> -    if ( !is_kernel_text(pc) &&
> -         (system_state >= SYS_STATE_active || !is_kernel_inittext(pc)) )
> +    if ( !is_active_kernel_text(pc) )
>          goto die;
> 
>      /* PC should be always a multiple of 4, as Xen is using ARM instruction set */
> diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
> index 60b587db697f..d80d44aeaa8f 100644
> --- a/xen/arch/arm/include/asm/processor.h
> +++ b/xen/arch/arm/include/asm/processor.h
> @@ -577,8 +577,7 @@ void panic_PAR(uint64_t par);
>  void show_registers(const struct cpu_user_regs *regs);
>  void show_stack(const struct cpu_user_regs *regs);
> 
> -//#define dump_execution_state() run_in_exception_handler(show_execution_state)
> -#define dump_execution_state() WARN()
> +#define dump_execution_state() run_in_exception_handler(show_execution_state)
> 
>  #define cpu_relax() barrier() /* Could yield? */
> 
> --
> 2.39.5
> 


