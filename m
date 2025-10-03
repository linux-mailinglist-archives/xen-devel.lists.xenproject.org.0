Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8189BB71DB
	for <lists+xen-devel@lfdr.de>; Fri, 03 Oct 2025 16:05:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1136588.1473100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4gON-0001cj-2y; Fri, 03 Oct 2025 14:04:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1136588.1473100; Fri, 03 Oct 2025 14:04:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4gOM-0001Zm-UT; Fri, 03 Oct 2025 14:04:14 +0000
Received: by outflank-mailman (input) for mailman id 1136588;
 Fri, 03 Oct 2025 14:04:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iGsD=4M=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1v4gOL-0001Zg-IL
 for xen-devel@lists.xenproject.org; Fri, 03 Oct 2025 14:04:13 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6892705-a061-11f0-9d14-b5c5bf9af7f9;
 Fri, 03 Oct 2025 16:04:12 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by GV2PR03MB10122.eurprd03.prod.outlook.com (2603:10a6:150:d2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Fri, 3 Oct
 2025 14:04:07 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9160.018; Fri, 3 Oct 2025
 14:04:07 +0000
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
X-Inumbo-ID: d6892705-a061-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HzBSxsJuKtgyJxfkocB9b/JOsqJltnhLguBkGsEJvl5keLfNY3JTMa0C6K+R4Ys3Ebyixn143Oz7mSXCUtFgjHE0B+Lavl9XXl/GCSY583iZN0sAy/2g5OkLzGEFPLDJaZqkRsDsTMg0UH7ksT9UZ0u/mn2jd41T6Yw/uSVvTTt6VaiE+bCPP7GsfwN9QFyPpmX4bkNJpcqlCpBunDAoYHZjE0Q3CIxSo9FgFFDwiKuUSB8H6g6xMQ1ln9TTSShh9bNMjHrEIWCx3JR4bkDEJaAqEKWkFL9GTnbAbtgHd4g5F04TzYkqWDFxp8ji2qGqoE7EL0XSOUMpniLNAHYPvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9SfKKi9BjQxEolx06LoZkmhOZ5LtPxsI0ghXs5Kyzt0=;
 b=MNzsDeRgb/ylzYWYcVjPPQAMtw6T0+Av4dVuj8NK5mWMZbFqSibc/sPhB2WgBknZG+1CHt+41jBRb4NQhiTqDoCePm147gYaIDDFuPXh3ttRcs8MVcOluv+H67g+QjXMC+eAq1ZjL4N1WFSdUy2FR9DbrTDtEUVZ5KpnC3V/thQnDnzMXHBB+JkP06F9gnNozzeMAFxyWRETpDT4ceme7q4p51/OwVqHb0mLDuDtvLFiLaomgD44lgJ6KnhkN5xUOVPpuUv/UYkuDCbBM9DUPtJ3wdc9ybWKjRbj8SM8D5p3CmX+qWdLdtAi/IIpdJ3FZudRyn9xykcwlMP/846d5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9SfKKi9BjQxEolx06LoZkmhOZ5LtPxsI0ghXs5Kyzt0=;
 b=uV9sgddQAFVPyUzRVAOMLhmgN8Hd3yS59tmksPESUAJll4219NaPgarho9uEGtS682VKA+jDXISVyWEUuvWQPIlvuweOKeGalzrbp7Tuf/M8OKUHXggqzBBkQXvzrnDw2ZZw6oUiV4RMAjQkW4JT0xNJK3dO93t+3dA0+jsoMTrNeTPeYRbedeY0k1VUuAPHmtX+S4L+Pgr74cMXP6cMN+sH7lNDgmEiqLcsfjcRBkNNiuVXBIJqdJGwRtQ2DnWkQU3uJArn8QgXU5A1P+6lJrSOXVocZw458v+52Ie4+Vz3DY/Dg8omKdLHs9pkLDbWgw+/T+hFv2BbJ91102iGyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <3715a68a-dc35-42f4-99e2-e1a45ebd1b16@epam.com>
Date: Fri, 3 Oct 2025 17:04:06 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/hvm: vlapic: fix RO bits emulation in LVTx regs
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20250930190550.1166875-1-grygorii_strashko@epam.com>
 <DD733UWP8JVK.SSX8U5ENELIE@amd.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <DD733UWP8JVK.SSX8U5ENELIE@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR4P281CA0315.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f6::11) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|GV2PR03MB10122:EE_
X-MS-Office365-Filtering-Correlation-Id: a9f6a871-b373-427d-2777-08de0285b7df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bWRvOHJOT3NxL1ltVXFEQTRNbXh6VHptT1NDaEduVlpXZExZNCtlVXJJbHRZ?=
 =?utf-8?B?ZzRQcFBEZWVBQWpqZTA2aVRkVXh0VWdXMzU2R3JVWXE4Nm1JY3hJeDlIcUJW?=
 =?utf-8?B?WlRQTjh2bUlZQWxhN0owTFlUSysvRVprazBCNWwyQUl6WUQybkFCdFE3L0lZ?=
 =?utf-8?B?MkZIRWV2SWxJdGZCMkJza1UrL1hJeXNHc1ZVTUZmaktMVmtpTnVJSmtQZnJB?=
 =?utf-8?B?dk1iSEJrbExEazByVkZCRzhhcHZHbUtVdURRVEV6YzZKUVB5UndydW03Wlpr?=
 =?utf-8?B?VmtyeENianAyQnliOGM3UDI1SzhGbjJNU1hBdWhUVVpqSzRuNjdXZW5TSCtt?=
 =?utf-8?B?ODJicTV5d0Vmc3JtNG45OXkwUkJJUmQ2WWoxTXFzcXM0alZiVWFTSExoMGdF?=
 =?utf-8?B?NGpSd2JYTkx5M3pnUHhsdmlXOW92T21Qc2tvclloQjcvWEZkSkpmWFBjLy9z?=
 =?utf-8?B?VzdrZ3cvR3pjWXQyNnhuclZKVlBmSkhFaTVxc3hjSS9rckowa1Q0NVE2VmZ5?=
 =?utf-8?B?Rlc3RzdwbWZpN3R6R0lKN200VFpmQ3JTUjJJQjNjT2oydFB3OEVJTjFUbG1m?=
 =?utf-8?B?UmFoWE5lWHY3cERRRWdCVGFSRDU1RHIwNWxSQjkweWkzaWlIMU1tZHlEcG5q?=
 =?utf-8?B?dGxWU3kwQzl1VitiOGVHZ1JCUmIrUElWYUxqTUY0UVh3TE54V3gzUG54K2M2?=
 =?utf-8?B?YVRaM2w1eGRGcWkvTFEyYmJkc1VETGx1SWVCa2tocGxrQlNtTGM3UXFKNHlE?=
 =?utf-8?B?d3VCTExoUXFQY3hxYU9CbWxTMzRrRStSVURPU0ZEN0RhK3QxTUpndXdpeXk1?=
 =?utf-8?B?dk16R2VKVnJmcDBIb281Tzg0SmhRTUNReCsreU5VcitUWm1pbUFVb0dMNGs1?=
 =?utf-8?B?cXZlbVBiaEJLZjM0N0tDYUVoNnUwVDZObUJyZmY2UGRrS0ozVlFoUGhEbVNB?=
 =?utf-8?B?Yk41NzVQSTZ6M04rK3hGczZMSzdpRE5HRVVVZFg0MElQQjdhSzRJL1RDd0hR?=
 =?utf-8?B?bjU2ZnpnQnd4M2ltNWg4T2lXWmVFZFRRdkZYSThJbC9FTzhUZVhWTzE3MHkw?=
 =?utf-8?B?Yzc3VmZVQkJURzBMYWQzb3NueUNQTC9MUVZkaFpnUjFvdFA4UHpYWmtuaVh6?=
 =?utf-8?B?Y2RTQU8wQmlUWWxJZkYvM21FQzFJUTF6RjNLbWdtNTljOG1qbDRTM2lOOU4r?=
 =?utf-8?B?anI1ajdDdlFoY3c5cFQ2Z01NYnRCRFpGWkVUMzUwSFhvZWNqK2h5cU4wRVRO?=
 =?utf-8?B?TURDdm4rNjBRekVCT0pXRTBQNCtCT29BVHBPbnFlR1hTTDY5ZmdRTjhtbGxB?=
 =?utf-8?B?amxzZzB0SklCNjdyY2xoVCs3eVd2djdtTVhwZk5hR2pWb2xNTE1tRm9jUHpj?=
 =?utf-8?B?NStVZjBud2tvSHBsUWdSc1g1OUFpajF4SzNxUnkxMTQzR0V1U0dnSnp0Q3VI?=
 =?utf-8?B?L0J0TWxubXZZOE5wK3lzWU9SSmZNaTJ0dnB2Q2ZsRFFBSHoxWjFycllpalh2?=
 =?utf-8?B?WlZ4bGZ1enRqSm5YRWZncUNEcllOMUgvY1p1czNCb2krZzZ1VVNYdkhCcWcr?=
 =?utf-8?B?VW40N2xxblNXdzFwaS83OFd6VWF5ZVluMVp5b3ZVMy9tWE5lakdIeU9RZGFr?=
 =?utf-8?B?eUd3dExEaEhWSnZDK2lzRDdndGp2dlB5Q1ZKckJYNGgrNWJTekRBTTJldlYr?=
 =?utf-8?B?L2c5ZThjVjFpazVoTWJad3E5UjVsWFg3Z2dxb0dCYzYzZENaYXo4S3ZrVWpR?=
 =?utf-8?B?ZEd4VXpGRWZjNUZGSHhqdGRpa3U5UGNodHR1YmovMWlodW12OE1TRFpjQlE5?=
 =?utf-8?B?bmVpTWN0azlrdXd0WXNDeGRIL3MvbHZGVHlKam5YSU1ZMG9EdmJqd0pseWR4?=
 =?utf-8?B?UzBrYzNheENqVHN1UzFVUVByaGVaSWJlV29BUU92czExYUE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUdJejVTelBrTUZDU0xvZFJsZ0FXUkZ3UDRXcGlFd1FnNXQzN2tmc0RyNTBj?=
 =?utf-8?B?N3djd2dka00rZ01ZaVJRZmFUUkxtZnVKWVNDckliTGF5bzZGL3BWdDJVVnJq?=
 =?utf-8?B?cTFhT01OMXpIQmhOandqM2xpU1hJcWpkeU1pRUtMbkJHWUpBN3poaUEwaXpV?=
 =?utf-8?B?WGJZVmgvUW8zWmxuTENYR0owM2ZzUzVQZGxVNDQ5WjNBWnFLU1FQcDBiOVFY?=
 =?utf-8?B?UTFPVWJXUDYvc2hIa3RhUVNENUM2SjgxTytnNGdOZm5TL2ZrSURoK3FEYksx?=
 =?utf-8?B?KzVTbTFjU05IZHN3ZzRnQkEwMGk5a3N0ZE9Ebzh2bXh3enFZdWx0SG5icHkx?=
 =?utf-8?B?UlJNWkxGWjFIbUQxYmNkNnNyUDhrTUI2dm9ZR2NYOXB1RlNQVWptb2FOSklh?=
 =?utf-8?B?YTV4czRoOE9GelN5d0hrNWlHeUh3NTdkUVNYRWpueDVMN3Uyd1JvOXhXMmxL?=
 =?utf-8?B?aVcwN2lHODNpbEhtOWRsTzhMRHFYNzhOVk9Tc2xkWHBlT2VNSzBRZnRhYzFu?=
 =?utf-8?B?VmwvcFU5RjJoYUNEU2NVeExIM2d2d3RJSTRMZUxWRWthaGtVMVhtKzBPdEdR?=
 =?utf-8?B?cjhZNzBTRnE1OWpVQXBxaG9odlNYZjVlUFdDRllpc01EcjZqcitIS0JnamQ4?=
 =?utf-8?B?bFZ5R1IrUzd3TmtaNjdYS0tmdXgrN0ozbVE3d0tqaUNqLzFOeTFncHJ3WjJC?=
 =?utf-8?B?ZVZuMnlrRzk5MjR1ZlZFTEJ3UTgrZ0wxRy9ncnovWEhJTFMyS29mVGNOREo4?=
 =?utf-8?B?SXd2UHBtREh1eDh5QWEzUURaSDcwU0IwVFlWYmE4elVmbU1yamRLZjhydndT?=
 =?utf-8?B?cnAxMnA4dG4vekZWTFA5RmNMZTBzanBkK0pjY1BOazc0ejJUQUpFL2RJR2dQ?=
 =?utf-8?B?T0E4elVCUXhjVlBjVUp4WUhoRG9xZ1hYZlhHRzY5SjJLdWErVjh6WllrbnE5?=
 =?utf-8?B?a3dOUC9SZU5uckpSSWIwYVJIZHdNaUNNcXZHdVZONTU3VTgwa1pmb2JDR2Zn?=
 =?utf-8?B?bVNwTXBNU2ZVM3VxVzVOcXBQRjg5VmtOSWRQZTRZUkpjYi9lbEpOM2Y3a0cy?=
 =?utf-8?B?S1QzOEFKb3N5LzVFU3FKQzFQaEloTldJSS80clJ2elh0ZDJBQVhVN3FLbHl0?=
 =?utf-8?B?QVR3Y1ozN1duY1haQ3Q5NVJUanNtSDNFcmxoK25mbGo2cjltNWpFQUViQks5?=
 =?utf-8?B?RkxaRWtkdVdleFprNTBudGUxR1l2dDdaekg1czMraVUyMVVzSEVzYnlGaSt0?=
 =?utf-8?B?R2tzaUlxU1BxSUdkSERnV090aVpoUzNDN1dYdTN1TksyMzJzdFkrdy9lUjA2?=
 =?utf-8?B?NlBGenJiaWliek5oQkZPeTY3Y3N6UUFGa0Jac3pRL3hBQUMxVnR2V0pVUWwz?=
 =?utf-8?B?V2EyNkpCd2VuWjcwZ2xZVDc2U2o3Wm51WkNoNlNTcU9BVlRmQ0x6VDBCUFNP?=
 =?utf-8?B?blJVaHZjNExkQ3pINWNZSkhoSjZSZlgxcTFCMWlaOFR2VEIxOVNRNEJmajdv?=
 =?utf-8?B?SXNtQitvd1o4RTB3YnZSNkVtamZVZVRxUUVCV3ZjN3pMaDEzNldISzRodWtu?=
 =?utf-8?B?dDNKSG1FdEJjbUlvMEtnTUdUaVg4RVVlek1wNDR6eDI3Skd3dDZzdyttbHVV?=
 =?utf-8?B?bk44R2J3a0hja3ZUcHBNdGFhUkMyVUpkeHFQcWR4RXhhS1I3YnJvY0I4c3JT?=
 =?utf-8?B?RHYraWhsS2UrOHdGdFlqTDE1Zjc3MmxsV2hhek12UlEvZ2ZZYmFNT2FnSjhX?=
 =?utf-8?B?K01LclE0R3lWTVBLRWpudEpaTTRPQ285VnFhZGZXV21sclZJY3dVT3FTL0Vu?=
 =?utf-8?B?OW9vdHpwajNlb1VVMDRWbUR1K2JjY1FwQWFuSmxWV0Y3VnJ4QTdTdUk0dU9S?=
 =?utf-8?B?c1lvWGJaa2NQUVU3dW56N1FHeER4NGZja0pRaWRwbURXNDV4Q0VQUzR5WmNF?=
 =?utf-8?B?b3JBYllpVmVYN0lENnhnSWhIbnJQdkpEMFYxNUl5Z2tsbndDMzU4djBUYko4?=
 =?utf-8?B?WnQ5bHFONUFSRnl0RnRmeDk1UUNXN25mTkhvUy9BNFV2S2RLK21LV3pJWngr?=
 =?utf-8?B?ZkdaVkdZZ3hrQVBOcWdyOGNTL0RZQXBjQUdPWW1HVjJVR1NBTFluc1BMU0kz?=
 =?utf-8?B?R1hLbXAxSkp1aENaY1pHaWxOWTNlWmhVL2ZOVFliVnc0OHYwYTNtVzQzdlIx?=
 =?utf-8?B?M3c9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9f6a871-b373-427d-2777-08de0285b7df
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 14:04:07.3401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BVDSpA6p/GwglPkQXXYVNTMFhHbiH6crIyKYEOlyUGzZJH9rOwthDDwxsTx5+Yi4BZUyaOQir/9bZ5fQIk/soPp19iDCbNWMmaa68EWSnic=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB10122



On 01.10.25 18:18, Alejandro Vallejo wrote:
> On Tue Sep 30, 2025 at 9:05 PM CEST, Grygorii Strashko wrote:
>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>
>> The LAPIC LVTx registers have two RO bits:
>> - all: Delivery Status (DS) bit 12
>> - LINT0/LINT1: Remote IRR Flag (RIR) bit 14.
>>
>> The Delivery Status (DS) is not emulated by Xen - there is no IRQ msg bus,
>> and the IRQ is:
>> - or accepted at destination and appears as pending
>>    (vLAPIC Interrupt Request Register (IRR))
>> - or get rejected immediately.
>>
>> The Remote IRR Flag (RIR) behavior emulation is not implemented for
>> LINT0/LINT1 in Xen for now.
>>
>> The current vLAPIC implementations allows guest to write to these RO bits.
>>
>> The vLAPIC LVTx registers write happens in vlapic_reg_write() which expect
>> to implement "Write ignore" access type for RO bits by applying masks from
>> vlapic_lvt_mask[], but vlapic_lvt_mask[] contains incorrect masks which
>> allows writing to RO fields.
>>
>> Hence it is definitely wrong to allow guest to write to LVTx regs RO bits,
>> fix it by fixing LVTx registers masks in vlapic_lvt_mask[].
>>
>> In case of WRMSR (guest_wrmsr_x2apic()) access to LVTx registers, the SDM
>> clearly defines access type for "Reserved" bits as RsvdZ (Non-zero writes
>> to reserved bits should cause #GP exception), but contains no statements
>> for RO bits except that they are not "Reserved". So, guest_wrmsr_x2apic()
>> now uses different masks (than vlapic_reg_write()) for checking LVTx
>> registers values for "Reserved" bit settings, which include RO bits and
>> do not cause #GP exception.
>>
>> Fixes: d1bd157fbc9b ("Big merge the HVM full-virtualisation abstractions.")
>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>> ---
>> Changes in v2:
>> - masks fixed in vlapic_lvt_mask[]
>> - commit msg reworded
>>
>> v1: https://patchwork.kernel.org/project/xen-devel/patch/20250925195558.519568-1-grygorii_strashko@epam.com/
>>   xen/arch/x86/hvm/vlapic.c | 14 ++++++++------
>>   1 file changed, 8 insertions(+), 6 deletions(-)
>>
>> diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
>> index 79697487ba90..2ecba8163f48 100644
>> --- a/xen/arch/x86/hvm/vlapic.c
>> +++ b/xen/arch/x86/hvm/vlapic.c
>> @@ -44,15 +44,17 @@
>>   static const unsigned int vlapic_lvt_mask[VLAPIC_LVT_NUM] =
>>   {
>>        /* LVTT */
>> -     LVT_MASK | APIC_TIMER_MODE_MASK,
>> +     (LVT_MASK | APIC_TIMER_MODE_MASK) & ~APIC_SEND_PENDING,
>>        /* LVTTHMR */
>> -     LVT_MASK | APIC_DM_MASK,
>> +     (LVT_MASK | APIC_DM_MASK) & ~APIC_SEND_PENDING,
>>        /* LVTPC */
>> -     LVT_MASK | APIC_DM_MASK,
>> -     /* LVT0-1 */
>> -     LINT_MASK, LINT_MASK,
>> +     (LVT_MASK | APIC_DM_MASK) & ~APIC_SEND_PENDING,
>> +     /* LVT0 */
>> +     LINT_MASK & ~(APIC_LVT_REMOTE_IRR | APIC_SEND_PENDING),
>> +     /* LVT1 */
>> +     LINT_MASK & ~(APIC_LVT_REMOTE_IRR | APIC_SEND_PENDING),
>>        /* LVTERR */
>> -     LVT_MASK
>> +     LVT_MASK & ~APIC_SEND_PENDING,
>>   };
> 
> This is a bit messy. Why not have 2 masks? One for rsvdZ bits, and one
> for RO?
> 
> That ought to simplify the logic in both the MSR and MMIO cases.
> 
> MMIO would do RAZ/WI on the OR of both, while the MSR interface would gate
> #GP(0) on the mask for rsvd bits only and ensure all RO bits are preserved on
> writes.
> 
> Thoughts?

I've been thinking about the same and It can be done, np.
I always trying to make "fix" with as small diff as possible
considering back-porting.

How about "follow up" patch if there is an agreement to proceed this way on the Top level?


-- 
Best regards,
-grygorii


