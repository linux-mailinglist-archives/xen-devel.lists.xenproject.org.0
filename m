Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E18EC7406C
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 13:44:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1167301.1493650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM41P-0001TN-CK; Thu, 20 Nov 2025 12:44:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1167301.1493650; Thu, 20 Nov 2025 12:44:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM41P-0001RZ-9J; Thu, 20 Nov 2025 12:44:23 +0000
Received: by outflank-mailman (input) for mailman id 1167301;
 Thu, 20 Nov 2025 12:44:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ChS/=54=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vM41O-0001Oy-0E
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 12:44:22 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1a0e836-c60e-11f0-980a-7dc792cee155;
 Thu, 20 Nov 2025 13:44:20 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH2PR03MB5191.namprd03.prod.outlook.com (2603:10b6:610:93::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 12:44:15 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9343.011; Thu, 20 Nov 2025
 12:44:15 +0000
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
X-Inumbo-ID: a1a0e836-c60e-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ijaF20pVTFgT7Xzyc5KTR59APePpIFDzeCwi6gzIEYjz1IqJY05zvDI/OoLcjmblYXJOyUMHMiWw/dvRrft6rULlh9qW/DncbvSTDz49ngR/zPJLQSPINNt7gYTIr+Rw5X0bpQV6EOb1pwiyETlpoU5odJgbtcS/ebSOGuUsP9AaN56N2VvimZvAdVtahugLtTbCnw83SwN4ZhxQ9Jv6tGPwqx5MuCDLJkY63o9ay4x+Qmi2DpSDVFnUZGHaaR3cMZibSdjP3faXCmin5ledQc4hKY3fjZn5uPl+AHjRPH+hbDic0Euus2RNlxxVHGvzGMOk8/J11bRYINZzmS9FCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+YGIHoR8/gL3mIhoVY22JGFktR3EqorKH3gTHLtPTCE=;
 b=yJkr+V4X9sPFhN/97TMCo8q35/ejqFvWOSlLDcViiqcwkamgEPh/9lyBrRnCr48HKio0E+fz2LGwX479fhMj9r/d28NPDiYgTagElS7iWD+SsGMepvBhcLAGqm5y9T9Nb078K/gxBFL+E+59c17pOJUL/cA7+S9VT4StsYZGLQG31Y/AvdkIw7LzMxzyU9LimT+ng2mYy0mkYu1jPoQeDm5YU00vcox+NV6BBND2V1pyaY8JjYU2s52yPXdmSIo83o2EM3mQn6URvGfPFY7oMliLMeM1+ZLi1gqLSfpDYON20ddJmU5UwLxiR+dXDhmNqW6Oa+Ya58TE6ajYPrgKAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+YGIHoR8/gL3mIhoVY22JGFktR3EqorKH3gTHLtPTCE=;
 b=yHWX1h74cgVVwrKVGRQ3DKSjuliGzMGCd7XYhS/kqGzQqpyM0pjATb6DxZEd7tulOwYNIM8QmiF2r4WP40WHDxj8HWrO73udOdCkKLt60SxJCBm8vzWvPrpTbHs4hEm5vN5BgjSJnuanoh1hM+foP9BXfl7Wp3hAyxjt+bT3lCI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <03d43589-2427-4966-af5a-05725a64e8cb@citrix.com>
Date: Thu, 20 Nov 2025 12:44:12 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86emul/test: correct compiler checking and avoid it when
 merely cleaning
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <9ad4e324-575c-4146-a494-82720faaafe8@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <9ad4e324-575c-4146-a494-82720faaafe8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0027.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::15)
 To CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH2PR03MB5191:EE_
X-MS-Office365-Filtering-Correlation-Id: fc708ec2-2cd4-4aaa-0eec-08de2832838a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OGp3bHVCdkNJVXZHUkpZeWQ1eEZ0MkpXZjRUTFJJNXAvWE4vd3FjQzlNUmM4?=
 =?utf-8?B?Yk1wUWZYejhXTURJZkJSWGJ6UllqR2t1QitoN21vNkQ4Zm5SQzlQUHBndE11?=
 =?utf-8?B?MVFxbVhVV2pjbHBXeWNINWErdnB6K3ZoZXY5cGpnZjdwVnBkRUxvenRScG5C?=
 =?utf-8?B?Z28rU2NQd29sdDNjQUpZWTc0NFBXMFlaSktIZjNUbVlRUU1PVFdUU3N4N3hn?=
 =?utf-8?B?VFdpaTMxRmhMWGZGdTl2citYT2w1QTAwbmtyMDBGMm9URGdjWEtuV0JkejZX?=
 =?utf-8?B?N2ZJWFIzdVl4b080WWliS0NCOW0wSU85MlluWVJxMFRzYkFkOVpid3dLajVx?=
 =?utf-8?B?NC8zQ1BzeXQwb2VuYnpUUmtmZnpPVlIxeGhaaWtQNHRNdzdWVEhCbnBuOS9n?=
 =?utf-8?B?YVhXc2dsNmlMSDZMQmNaQmdaWTBnL1ZOdCtGY3ZOdzVkeG0xN0FhQ0dPTXRL?=
 =?utf-8?B?UzdpZ0RNakx6ODZtYUdkc3phdGQ2YU4rR0F5TWV3NWtSL1pHVHJ6RExhOU1M?=
 =?utf-8?B?aEVZR2FQQzBySEs0SUdsUlJLNmMzeDl1OHpTMmUzSEJZSmpSVDlqTmRhMUsv?=
 =?utf-8?B?WE1pSUN0Q3hHZGJCcnZ4QnoraFpqalNxS0RzZUVyTVMxb0ZEcWlwM0xNOVc0?=
 =?utf-8?B?aW9IOFZhaUdZS1VPWk9uZ3VQL1V4cjIyblZwc2lvc3FuZ0lsNWNnRGxGVU5W?=
 =?utf-8?B?Z2xMWHRtMUdqcUdyUnE4Yk9EQjE4OCtaS2lJbktBSUsrdUNNWGZEV2R1b3VB?=
 =?utf-8?B?RjV0K0RBNGlCOHdOWFJZc1FraGMrYWM3TThxVHlzdGtzVzVMUjJnOWw3N3I3?=
 =?utf-8?B?WkFaQkk3TG5JTDVVNVRydG9JaTkreTNhVDk1SnMrTVI2M0dSTlZMVkltV2F4?=
 =?utf-8?B?Z0VBTEsrWkNoaG4xUzdGbFJIajRYZW45NmxKL0hveEt4YUY3dlZjSW56aXJ5?=
 =?utf-8?B?QTdzcnFGUmtvcGE3eXJ1RTgvVGdUdnhtMFVrYVhjd1V6UUJrMFhNbmJYQ1Jr?=
 =?utf-8?B?UnY2TmxoV0RpRkFwQmRRMW9tZ3MwOUZITlRWRDh1NUhTc3ZuOUdxWlpHczEr?=
 =?utf-8?B?dTI1dVFIcXYraXd3UHh1aE0wWDlJMHk0eDRDeVBDSEZmSHptc1lKYm10Wksw?=
 =?utf-8?B?UVErVTRmVUNCdHplSncyMm1ZMFprdGJ2RkhGa3paczErMnRvckQyNWpzckZ3?=
 =?utf-8?B?VzBudlVRSjlGb050WEw3YWJpSzZWZ1FHWWJ3RldBV0gybVhCbVM1UlZPVnpm?=
 =?utf-8?B?c0x6RlpKbCtRZ1I3d3l2SzZra1FvcWJha1Q1c2NsdUVwdWt5a09GUFhpY296?=
 =?utf-8?B?czRsQ3hPdGhwc0VTRGZyOEsvZU1mWktNeXBkKytQSk5URGVYNWc5QUI1V3hY?=
 =?utf-8?B?OU5zN213bVkzeXA5YjFVdkxCVFBjTlZHWmlKK2FQd0VZcktTUE1yRmZUckRj?=
 =?utf-8?B?b1d5NndDTHlRNGhzL0cxUWtENWxobTNHM0tKemU1MG5RY1JTZXdQaW00M0Zm?=
 =?utf-8?B?OURQOSt0TEZtaVJKR044UkU0Z0NxRlpsOEFHVnVjdGtzRjBjL2FQdFhUYW85?=
 =?utf-8?B?Qi90b3NpYkJUYzVlM25GYjhDRnZWZUFYbW5EaHM4Zit6OFlSSnRMY3FXMEE4?=
 =?utf-8?B?WE9TVzZjZFFYSzFrTXJKS3Ywd2xDNEwreUxBSml0MlVpNTZvWGhFZjBCaFkw?=
 =?utf-8?B?MWE4MG5ySFZoQXFHRUFncTNWajQ1ck9ObzJRVlQwdlRtOEhoWkwzTHpHL3ZX?=
 =?utf-8?B?clJqTGFkanlCS2V3dUNRcFJYUG9Zb3RIYTJZZVRNSUcxaS8zTEJrekJzbEph?=
 =?utf-8?B?WnM1ZWVJNmQ3QlRndDRCMjBzcUh1aXVyZTRnUitZT2Jpd0ZLUGZoU3RmQmMz?=
 =?utf-8?B?RWxCWmVLOTlKcTNWRVJacGswamFXTkorTmdScmdUMVlKQ1BFSG16NVgxRldF?=
 =?utf-8?Q?XMunis6ZeLRuiWAVIbkVpeFoB/GPtZ+F?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VWViTHplYUlsbTRHNHZMdkRSR2MrOHg5aUkzcGRnV0JjSnFUYnVGWnIwVTd5?=
 =?utf-8?B?TWRvczVLRG1MSDVmcFJ3d2VPUmdaMHg1NmVzK0NqTTRFRS95WEhMdmNqUi9G?=
 =?utf-8?B?WWZ1WnRSdFgrbTQ4UXZYeW95L2hhVHBZby9KYVNrVWJaNmhHUVZQak5NUld6?=
 =?utf-8?B?endtenJDeUxtZUovWlZiSkVXbkorNDdkVWJRRFZndTg4ZmF3SkZNbFJuVVdq?=
 =?utf-8?B?K3E0ZkEvS0dHdXF3WGc4T3BZN05SaEtEOEwyTzdsVkVIbFQ4OTlDUXhtek1E?=
 =?utf-8?B?WENzSmJ0Slk4aHJ5WWhZUFhUVk5zMno5ZXh5eERVMnNXMDFRSTR2Q0lRY3Z3?=
 =?utf-8?B?OEgvNU9DdEF5clhuTEx0RGt4Z2tSN0RvS25oRXRUbkErVHJsTG1TK0pZcGxH?=
 =?utf-8?B?WXY4UFh6QkFLYWlMZXBVeFV2S0pJY3luVDg5c01qelJhaWd5L1FzdWVuMkMr?=
 =?utf-8?B?azAwSXUyc25OR1RFV3Z3VlFjZnJFRXg3bTlwTFRpWnBxeGVYQ1lsUEl4QlJK?=
 =?utf-8?B?TnhrMVBzZTUxY05wTVFiWUUxRjFIbjhsYUp1Q0JidkNuUWppeFNPVVJkOERG?=
 =?utf-8?B?MVlZcjk0bnF5dzRDWXRIT2drWnBpL2NqVUVBYU9GWmlZZ1l0VFM1cHovZnBH?=
 =?utf-8?B?M2s0VlVVWUwwcE81T1RSM3VrbGFMOWxMSnlnRGVjQU5ONmNWZzlmWGowMnUz?=
 =?utf-8?B?TExTK0o0VGtiVkw5ZTA3RSs3eHR4N2xPdi95SWpDZDlKWGEyeXFwWDVHNzZK?=
 =?utf-8?B?OGpuV2FHWXVkQmdLN2VqYTFPcVhsclEycWlvRFlydURFV1l6TFg4T0ErNmM0?=
 =?utf-8?B?L1pJNEl4dTJHUE5Fc1pHdWl6KzVlaDlxWGJuazlTYnhVMFRZYmtJTlJ3b1cr?=
 =?utf-8?B?c1ZaL2NvRDZRcDJ2S2xJU0REVkkvMFd1bytGSktYWE1iUEgvWEM0c1puaTRI?=
 =?utf-8?B?TERlaksrK2QrQjYrTlBqRVFCbHM3dEdwYWhUSElIbC91SVJOcEJYSXFQcE53?=
 =?utf-8?B?Y3EvTVpSVklheGttQnpBZ2xzVXI0MzEzUG4yNHhFQ21aOGgxU1UzK0NabEdH?=
 =?utf-8?B?UGdGSUx0cGtrcTkvOTdpZnlQTFJ1R0pKaktsYlhGQ0NlNzNsNCtGaWpPZEtx?=
 =?utf-8?B?RWRHS2NRRXBONTQ0aVNMME9xUHhDYklESllhbS84dGR6OCtEU2F3R042RXBO?=
 =?utf-8?B?cU5jVU9KYlBZcGpINkphSGN0N0ZvZnVSQ3Z0UnZIWHN1MUR5bllQUHRLaEd4?=
 =?utf-8?B?SzA1M0dMMzFlSHJMM2NMM1pFVXk2a1FoRjZBRGRDVzNXbXdvZ2JhUUlKbStx?=
 =?utf-8?B?bE1LNmhXa2p6cHFpQk4vY1BWdVk3OUhtRE1PcERmSWMyR2hFdDVmbURyL29Y?=
 =?utf-8?B?K0pYbjhHQTU0VndXMGxyQnJvWjIyMU5pRzNEcVpOdlNwYXNpbzhJdG8rZjdw?=
 =?utf-8?B?YzlzdWhIdDA2TjNvZXRCNTBNZWIyZFlueVVUZUNvUGNWZmtIWGNUd2E4NmpN?=
 =?utf-8?B?S21IbXVVbFRxMnExNm1NeERtNlVVTkNnaDJ6SXFqdTBnQXl5aGVZQ3VnWW1Q?=
 =?utf-8?B?aVRxRmd3a0ZvRUtjbDFraDgzNnVneTk1UFJDMkZMNUlyT05MZENUK2VlOE1U?=
 =?utf-8?B?SDBSYzZLVU5WcmVWVG5mbzgxVU9vZzNGWWI2TStEUVBIdjZSeW1WNTgzTUlr?=
 =?utf-8?B?aWF3eFI5R2xkRHlNaXdwcEhMbkVpMHNrdEk1eDdteVZrQldqRzdWN1RRbC9C?=
 =?utf-8?B?T2NUWDF6V28vV0ZXSTc5dzUrclV5RUR2WFlNVDdvOFZtclRqK2tFdHNSdnpU?=
 =?utf-8?B?VmpRWEd6STlZVnFWWUtoK285UzFIR2dLNzR1V29rbGxxTUxIOVUrKzN5R3NG?=
 =?utf-8?B?NERoWXZkam43TlF5eFJ1VHhVNHdSVjJpSm1vMmJUc0V2dWEwK0hiWSt5elJm?=
 =?utf-8?B?S211aTZYMTNDWHBqMWduQUszZVVxckJHdjYwZERjK2dRK0V3cmdWN3V1UGxN?=
 =?utf-8?B?Tmc3MUtJWjFGVHJUa0pkRDNmcXM5L1RaZENib1J6WXdUL1hKM2hXa2kwRVhG?=
 =?utf-8?B?eGZMbUdQUldvREo0bUlHRnJNQXJTUko4NlFOQmJUbmlaUXo2bmpubEFrek95?=
 =?utf-8?B?RER1am1Sb1F1aVZQRWxxMW5udTNqdHdPakxmOEo1MnBUNEl5cFQ2eHVNMlpQ?=
 =?utf-8?B?ZVE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc708ec2-2cd4-4aaa-0eec-08de2832838a
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 12:44:15.5553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6GHHNPq9924mHudKwbeLqlBIW/MdF5TmebMlZuk2dDWYaNWHZI2r4neObbA8Dk5zFre7QnNbuPHKjcxM1URFudnkGV1y9HQpUkWgm9yscg0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5191

On 20/11/2025 12:43 pm, Jan Beulich wrote:
> The error messages that the compiler may emit can be confusing.
>
> The check was also the wrong way round in case multiple make targets are
> specified: We want to do the check whenever targets other than the running
> and cleaning ones are specified.
>
> Fixes: 05f4cc219235 ("x86emul: suppress default test harness build with incapable compiler")
> Fixes: d5997399b7ad ("x86emul: suppress "not built" warning for test harness'es run targets")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

