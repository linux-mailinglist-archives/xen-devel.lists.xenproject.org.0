Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F48BA776DA
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 10:48:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.933659.1335539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzXI6-0007xd-RT; Tue, 01 Apr 2025 08:48:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 933659.1335539; Tue, 01 Apr 2025 08:48:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzXI6-0007wB-Nq; Tue, 01 Apr 2025 08:48:14 +0000
Received: by outflank-mailman (input) for mailman id 933659;
 Tue, 01 Apr 2025 08:48:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yHas=WT=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tzXI5-0007vn-9J
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 08:48:13 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20609.outbound.protection.outlook.com
 [2a01:111:f403:2414::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 09ae657d-0ed6-11f0-9ffb-bf95429c2676;
 Tue, 01 Apr 2025 10:48:10 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by CY8PR12MB7609.namprd12.prod.outlook.com (2603:10b6:930:99::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.47; Tue, 1 Apr
 2025 08:48:06 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8534.045; Tue, 1 Apr 2025
 08:48:06 +0000
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
X-Inumbo-ID: 09ae657d-0ed6-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GIfBi4cSdzCdJnc7rHDxAdw8ZB2hLQQyoGP27wFSBtBycgsvzv9f1mOhY45M68pUM2BKpmOkWAIeh66X1pCl4FE3KOlb5vJoOcb0luD6ex6D6+1s4DG8t4oy0uDCWHC6y1ba20+khUFq/gUFc8F/46yGexdGMpoFtqk2b5UkBU/5HfORnAWnTK0oo4b4IBTHE13hxUKcoqphXkgAnoVNp7/XhYYRU5uNilKsDxedlYbzRCe1hrZ96QVWwS9y0Rs/rBM3vA5Ize3QQyB6hiy0Zahs0ij8Y/C4W8u8YTEiq9reHXMu5A6uI8zeRkml4e5UrFKS1d4CGZ8OIq2M/rb6Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K2XN2GRBd4VyylS6KuVM9hkU6i0nfjLQm7mE2igBJfE=;
 b=xHzqRl0iSxAMpYQmKXMD+g1F6G+70y8Tb9XJdAcaom9m99/0dJyMy2tR5FmOMw8mnd2nWXgC2fEWtIcyRtRWmJXXrh2xA7xIEELsAl/fx+PH/lviPlyMRFKC22sxfCcHCXSe+OICCVvF1rAipXsNBP6B/qMGDmC1MhXkS2At97Dr7PhGOus16DcipMWUxfvmMSvEsX1iYWs6bvJQjGXCItDoZv0XMdn2voEfUglP48oANYmu6J16XP+9+jRxzMW3pmHMD10Me0BZUZWRes57aJc2blIwpk+VougjtAuUb3lNApafgDQGiU6Z8FTVtl+8kzxP0mSaj6pM2qAomJDCyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K2XN2GRBd4VyylS6KuVM9hkU6i0nfjLQm7mE2igBJfE=;
 b=1dw6E4TpxV9KTaKGCM/P7Xnm8AbZiLg8DtLqfFGatHhd8W71zOPdOTvQSQ6E6LoG3F6Ee7NS7UY5MziqVxja3BXuEolsZEJxF4jk+JluG6VEK3c+EOudOyqgFNBwd1vbmqz1eBTAOyXozQZo87FDB/X3+kCv4QsbFrvhZnx7LjU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <8b524c74-a1ab-4abb-81b4-189673e8f99c@amd.com>
Date: Tue, 1 Apr 2025 10:48:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] xen/arm: dom0less hwdom construction
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250331214321.205331-1-jason.andryuk@amd.com>
 <20250331214321.205331-3-jason.andryuk@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250331214321.205331-3-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0394.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::12) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|CY8PR12MB7609:EE_
X-MS-Office365-Filtering-Correlation-Id: a065b101-8c64-443d-5922-08dd70f9eb84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bk12ZFZ5S1JjRVI3QWZXYlF4cENkenhSdjlDTXZjQVZpbC9UbDdYRXc1WFhT?=
 =?utf-8?B?b3NZOHU3UnZrMGdlbzEyK1NTQkgvT2NmWUlZM0o0Y01POFhhYjY5SHFyZkJh?=
 =?utf-8?B?aUtpS1RhU2dhQ3djcnR4c0VyVzVOMTVxOHFGTW1FZ0FUSlFRd05qa2tVejE5?=
 =?utf-8?B?bWcrcnpya0czVlo0aXV3VGdhUXkxd0JOeXk5b0loemIvdVhIdlFmamhMOVI5?=
 =?utf-8?B?cTlFbnhDM0ZyV3hwQ1dVUmdFMEFTdGtwa2Qxa3p3RWwxVXB4RnJxS09SNXl3?=
 =?utf-8?B?b3dOSmd3Vk1lK3VmY0RXZ2g5eHQvNTZYaWdTdElYUTg1a2U1Z2JzeXRkV1hP?=
 =?utf-8?B?WVh1aEtmaWszTXZ0T1ptNUt3TXRUSHBaZEpxNW12WXNoQjV0ZTZmckpkMlFh?=
 =?utf-8?B?L3ZXN2I4cUJDaDFrVU0xOTFnQ3pMMkI5VTVzUDVZV3QwRDQ3b054THhwRUFG?=
 =?utf-8?B?Y1JETjRkd3dTNHRlYVFxZU00R0kxYW9NZmJnTXFZVmxhZmVZRXZabU5WZm1P?=
 =?utf-8?B?UG5IN0czSGxNR0VxS0N1TGtxVThZYk1WaE1FYWFBN1dpK0tDV25oNUc0S2wr?=
 =?utf-8?B?d09valk3eVpWUm8zSjVCdzZ4VVRrQXY1U1dmNzlvUnB1OHM5d0l6R3VBOXR1?=
 =?utf-8?B?WCtGTWc5QU1MMFF6SXZvb3R1VVlOODBiZFdMWU1md3d0RGZBZFg4SGd2WVpZ?=
 =?utf-8?B?U1prcncwK2lsbnA3QTRPdStGOXdXTVF3NnJ0bGxUYXQ1WlprTWYrMUppNkdF?=
 =?utf-8?B?NVUrV3BIUXBOWmpQSXF3aWh0SFFIaXI2bkdWMmJtK2xEdnQ1a2dvVWlpekxu?=
 =?utf-8?B?TDFEK2ZSSHdpZUtUcmwzekYrTlJFUjB6aUFZYnpVa1dFOG42K0MwU2tnM3RF?=
 =?utf-8?B?OFdsZDF6bi9mQ1AxbmVYcEZNN0hQTGNvOXIySVZVWjhtZ3hFdFJMYjdkNm1y?=
 =?utf-8?B?Nm9lc2krU3h1MGJnVC91RVJCblRleGVZMEl6c1pkdGg3NUJ4NEVRelVqeWM4?=
 =?utf-8?B?UGwzeDZxTFFhRGh3MFRNWXRTUHAvY0hlY2E2MFNSR2k1UXExS2RoTWdPdEtv?=
 =?utf-8?B?NGhpbVVMY2JFTFVHRGVIS0VVNGpjR3lxWkhWSDlUNWJhVWdIOVhKSzU4Qi9k?=
 =?utf-8?B?T2JxdHB4R0w1TzY4RHZGQndyOGJScnRuYTdhMTZzbW5YLzAzQUFzZkk5MVk5?=
 =?utf-8?B?dkJvU2JqYW9GQVlWNDlPM0hheU1EdGtQRENkVnJEVGxDaG52ckQwZFZrUWlI?=
 =?utf-8?B?T0owN2thdlFibXRaanNqUklFSWZsN2h6a3J4MUFqNzkzZ1ZrMUtvWjlPZmgw?=
 =?utf-8?B?a2tDOWZjVTVBdng3MVVHVFdaeUdPU0RLMDF3b3c1bktIUlpXdlR0SVEvWGZB?=
 =?utf-8?B?SnhyOEhrc3VXeXliSm90OHZIeUg5VGNCcldYOEc5dHJmc20wZFhKNUFzd2Rt?=
 =?utf-8?B?dkpPYkZyM3M1Q3lpbWF3bDRaZHhwb3Z3OTlTZnB2Ykk2K0lGSzZpUXQvTW9H?=
 =?utf-8?B?T3ZPWlFLUmJMb25YYVl2QVA4OFlzeFlMaUFMcFQySk1aOUUwY3FDS1RlSEtI?=
 =?utf-8?B?V1hEcnc3a050L0UwVHZIQUY3NzgwWUw3aHVqZ0xKWW8rUzdvc1BRU1RVK3FH?=
 =?utf-8?B?RXhZZE03M2txeGNqNEpHQVBWcEhPUm41MlBFSVo2cW1NUWxzSjZFd0U1SXJw?=
 =?utf-8?B?TmMyV08rZVRLK0dUSmI0UTN1US8zRXRXZWVxNXovZk5TNVdQdGlmcERSSnZ4?=
 =?utf-8?B?SFpZeEIrVjgzeTFZR29OUVdKbFdvKy9tTitZYUpRZU9OWFJuRVU4M2pvWVhQ?=
 =?utf-8?B?TUVQSGNtcGNvdjNKckdsK3RMNDNNcnkyWm1WblhadTYxV3pVTmVUQVV6c2JY?=
 =?utf-8?Q?Bn+lJoEzZjyWw?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWpmbXR6M0RxMHhwRi8rR2Z1MWd0aWFJUjQ5RGpudkxFSHBXRytvL3dkYnRi?=
 =?utf-8?B?aHpkcTlZUFliVE1IYVcrWDdlVG8zMTR2Q0xpZTIzT3NXb3lyUE4za1MxTmRq?=
 =?utf-8?B?NksyeEtTUTAzenhwcjM1dU5waU0yTXNpV0NDdVpGL2dYQzREV0tPYnhTejIz?=
 =?utf-8?B?QVlub0lKOXZiaVNXcXhjMlBNZHlnbXRwUmZ2cTJ3U0FJdXlYbmViSjRjR1Bi?=
 =?utf-8?B?bVIwMmwvaTIzNlgrUmZkN240RE1GT3BCWjF3aWFiS1pPK0pPbDdFTWtHTXRa?=
 =?utf-8?B?b05aK1EwQ21jSVBIVlVBQUZ0K3lwQVVUU1lqdDYrd2ljV2FFZHc3ZS9nd3ln?=
 =?utf-8?B?UzV3Z3JBZFZtUFdQa2kzWmtLVE9mY3BleXNKNEVWQkdaRmZPdXR6ZklDQ29R?=
 =?utf-8?B?dWRsaU1hd1crYjhsdWhKT0Y1Smpac3d5Q0t2YUpKSEpLSmdWcWhGYmZsTXBU?=
 =?utf-8?B?SGQ2VUhGTkh6bG40ZU52VVlwL3dqaEovWDRSN2x6WGlBV3pJWUxYbDNqdGp6?=
 =?utf-8?B?Q0FJZlFCU1FsV21nQ1hpMGk2MFZKRHNNZkxnVU1pMy9yK25VRHM4T1RnNEtR?=
 =?utf-8?B?VHYxajhicmFuSW51TngzZ3VoSzVQeWQ4bnJ2YUd4b3JQd1hyZW9RSStZUmZT?=
 =?utf-8?B?RWppZ1pYQTl2R2NCenYxOHNQaEJ6NUVhbEV2KzBSblNXVDYvMU1jc051WWhC?=
 =?utf-8?B?WW9uN1lPQjRNVGtOR3JCcUVPckM3V2t5c0VjcWY4R0JEQ1F2bS9lM0swQ2JN?=
 =?utf-8?B?K2xPZS9TSDBlUHpnbmVXd2lsYVVWNzBVVURhTjFqakQxblMyckU1cGRFMFll?=
 =?utf-8?B?NWlyTU9yVnVYaVkxbGw0SUNndExCVlAvcHVpVXFHZnQxazdCVHBMbW1mRDYz?=
 =?utf-8?B?bXlvSTJ0UFRuY01xeHJKVGxmUGljaWgzWXQ3SmdHaXdGRVg3K0QzYXJvNjVm?=
 =?utf-8?B?NTA4M3hMV25tR3ZkYnVadEhpMzU5dWlSVmQ4c2hkYmhOWFdKc29KdTlHMTJP?=
 =?utf-8?B?K3VnTXlXVXpBY1V4b2tVTEhid3pqMVNvejBVZTdCRlhEUmdtS3dHQkk4bit4?=
 =?utf-8?B?cGd3WjFTR1BiMmVSRXo5U1B6WEp0UFVPTHo0VFpBQW5NS1JaazJJVGdQeFdV?=
 =?utf-8?B?MEdBTHBVczFOWktOc3BxTUxoZUhWUnhNdVRmWTI1RVlTU1lqVUo2a0M1dnFu?=
 =?utf-8?B?UGpDTFhQY0JKSHRHMjhhZWtvdnVuU2tUcC96cTdFUC9sR1FsRk9pQ1BmeVRs?=
 =?utf-8?B?TFA1WDdsOERpd2xxR3FRQ3dMTTJYMS92TzJNUEZKQi82ZGV5SUdpcmpYbVox?=
 =?utf-8?B?S0VJYkd6WThLRTE0SG9TRlNrcGJpOWdpNEdIUks0UjhmdXREV2RzVlhsTUNB?=
 =?utf-8?B?UGxZc1VSOWMzUkowd2RaUTdSL1I3YnBhcmVqV0d6dzh1Y1FCakNlVktDdGJU?=
 =?utf-8?B?VThOUW82RVBJTGZRRHRsUXB4VEM3WTZtL3pJRHZZYVdyU09pT0NrbGxDUjVS?=
 =?utf-8?B?WEErWndEQjdJKy96c2RGUmFLQ0lUd0l3REgyM3BRUHI5cjJrYkMva0d5MzZq?=
 =?utf-8?B?OG5xRmVkYUNWMS9VQXUwMkFDMWgvUFJUQzE5cWpDOWhuajFLWVdQQko4WjNw?=
 =?utf-8?B?WlZBd1hsZEliMFY0eHlxalh1R0N1NkszM2pHWmhpTDYxbnNIbzhITlVXNDJr?=
 =?utf-8?B?Yk9JdEl6RDF6bXUwOTFXQ1FHS3ZYNUZINUgvdjNQZEZCRkJjUVA2VTM0cW5y?=
 =?utf-8?B?a3Z0dkw4dkVrY0VHZThmbTgzcGMyVVh2dktGYTlPdmxCYjY0Ynl6OUNVcGw0?=
 =?utf-8?B?Nmx1R1J5c2pBRnNnYUd2SWZ0VGh2MXV4cCtJOVdtQjYyYjFSVUxUWW41bGF4?=
 =?utf-8?B?T0FZWjdXakdqVWNJbWFWN3B1eUhTcG8rQXB5UWpaMEN6amNGK1MxR0sydDJp?=
 =?utf-8?B?a1lRZ1B6U0NnUkxzOVFKOVVRNVRHdFlIZllEMFVDMmR4bkpKNmkrSFJUaDVZ?=
 =?utf-8?B?U1ZaSXR0RUFqV3EzN3VqaUxFazkvUmdiRnF4MDlBcmI4OEF1aW1qTE1zdUVn?=
 =?utf-8?B?aG5pNVpTVWdUV0NlOVlwd2ZRejRFdWxONVQ5SnRWa1FjVGdJekNqTzc1OHY3?=
 =?utf-8?Q?blEokWceQy8wbgTEBy+BJWQ7h?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a065b101-8c64-443d-5922-08dd70f9eb84
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 08:48:05.8836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +pNbrtYnhVqnqA3XTBY+zSYUWv9pxUwJAshs/9O647oSWB4JGtZFPb8r7z58dsbM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7609



On 31/03/2025 23:43, Jason Andryuk wrote:
> When creating a hardware domain, have the dom0less code call
> construct_hwdom() which is shared with the dom0 code.  The hardware
> domain requires building that best matches the dom0 build path.  Re-use
> it to keep them in sync.
> 
> The device tree node of the dom0less config is now passed into
> construct_hwdom().  dom0 uses /chosen for process_shm while a hwdom will
> use the value from its dom0less device tree node.
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
>  xen/arch/arm/dom0less-build.c           | 57 ++++++++++++++-----------
>  xen/arch/arm/domain_build.c             | 10 +++--
>  xen/arch/arm/include/asm/domain_build.h |  3 +-
>  3 files changed, 42 insertions(+), 28 deletions(-)
> 
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index 573b0d25ae..e25d7bd468 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -911,36 +911,45 @@ static int __init construct_domU(struct domain *d,
>      /* type must be set before allocate memory */
>      d->arch.type = kinfo.type;
>  #endif
> -    if ( !dt_find_property(node, "xen,static-mem", NULL) )
> -        allocate_memory(d, &kinfo);
> -    else if ( !is_domain_direct_mapped(d) )
> -        allocate_static_memory(d, &kinfo, node);
> -    else
> -        assign_static_memory_11(d, &kinfo, node);
> -
> -    rc = process_shm(d, &kinfo, node);
> -    if ( rc < 0 )
> -        return rc;
> -
> -    /*
> -     * Base address and irq number are needed when creating vpl011 device
> -     * tree node in prepare_dtb_domU, so initialization on related variables
> -     * shall be done first.
> -     */
> -    if ( kinfo.vpl011 )
> +    if ( is_hardware_domain(d) )
>      {
> -        rc = domain_vpl011_init(d, NULL);
> +        rc = construct_hwdom(&kinfo, node);
>          if ( rc < 0 )
>              return rc;
>      }
> +    else
> +    {
> +        if ( !dt_find_property(node, "xen,static-mem", NULL) )
> +            allocate_memory(d, &kinfo);
> +        else if ( !is_domain_direct_mapped(d) )
> +            allocate_static_memory(d, &kinfo, node);
> +        else
> +            assign_static_memory_11(d, &kinfo, node);
>  
> -    rc = prepare_dtb_domU(d, &kinfo);
> -    if ( rc < 0 )
> -        return rc;
> +        rc = process_shm(d, &kinfo, node);
> +        if ( rc < 0 )
> +            return rc;
>  
> -    rc = construct_domain(d, &kinfo);
> -    if ( rc < 0 )
> -        return rc;
> +        /*
> +         * Base address and irq number are needed when creating vpl011 device
> +         * tree node in prepare_dtb_domU, so initialization on related variables
> +         * shall be done first.
> +         */
> +        if ( kinfo.vpl011 )
> +        {
> +            rc = domain_vpl011_init(d, NULL);
> +            if ( rc < 0 )
> +                return rc;
> +        }
> +
> +        rc = prepare_dtb_domU(d, &kinfo);
> +        if ( rc < 0 )
> +            return rc;
> +
> +        rc = construct_domain(d, &kinfo);
> +        if ( rc < 0 )
> +            return rc;
> +    }
>  
>      domain_vcpu_affinity(d, node);
>  
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 051c48329a..b3a396c2fc 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2305,10 +2305,11 @@ static int __init construct_dom0(struct domain *d)
>      if ( rc < 0 )
>          return rc;
>  
> -    return construct_hwdom(&kinfo);
> +    return construct_hwdom(&kinfo, NULL);
>  }
>  
> -int __init construct_hwdom(struct kernel_info *kinfo)
> +int __init construct_hwdom(struct kernel_info *kinfo,
> +                           const struct dt_device_node *node)
>  {
>      struct domain *d = kinfo->d;
>      int rc;
> @@ -2325,7 +2326,10 @@ int __init construct_hwdom(struct kernel_info *kinfo)
>      else
>          allocate_memory(d, kinfo);
>  
> -    rc = process_shm_chosen(d, kinfo);
> +    if ( node )
> +        rc = process_shm(d, kinfo, node);
> +    else
> +        rc = process_shm_chosen(d, kinfo);
I think we can avoid this if/else. I see no reason to keep process_shm_chosen.
We could check in process_shm, whether node is NULL and then grab /chosen node.
I'll try to send a patch shortly.

Rest LGTM.

~Michal


