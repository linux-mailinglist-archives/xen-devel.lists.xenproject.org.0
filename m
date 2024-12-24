Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1129FB90A
	for <lists+xen-devel@lfdr.de>; Tue, 24 Dec 2024 04:55:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.862989.1274494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tPw12-0003Xz-Mi; Tue, 24 Dec 2024 03:55:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 862989.1274494; Tue, 24 Dec 2024 03:55:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tPw12-0003Vv-JQ; Tue, 24 Dec 2024 03:55:28 +0000
Received: by outflank-mailman (input) for mailman id 862989;
 Tue, 24 Dec 2024 03:55:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VW/X=TR=epam.com=Sergiy_Kibrik@srs-se1.protection.inumbo.net>)
 id 1tPw11-0003Vn-0k
 for xen-devel@lists.xenproject.org; Tue, 24 Dec 2024 03:55:27 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on20625.outbound.protection.outlook.com
 [2a01:111:f403:260c::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e76c15d0-c1aa-11ef-99a3-01e77a169b0f;
 Tue, 24 Dec 2024 04:55:24 +0100 (CET)
Received: from DU0PR03MB9199.eurprd03.prod.outlook.com (2603:10a6:10:470::22)
 by PAVPR03MB10101.eurprd03.prod.outlook.com (2603:10a6:102:30e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.21; Tue, 24 Dec
 2024 03:55:16 +0000
Received: from DU0PR03MB9199.eurprd03.prod.outlook.com
 ([fe80::3650:95ff:7db7:a5fe]) by DU0PR03MB9199.eurprd03.prod.outlook.com
 ([fe80::3650:95ff:7db7:a5fe%4]) with mapi id 15.20.8230.016; Tue, 24 Dec 2024
 03:55:16 +0000
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
X-Inumbo-ID: e76c15d0-c1aa-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ndyIKDi0p+2n/r17gaUJ3owaVLtjC6WmPba0/ndGf1VTpfar0PYelenNI5X5+ay9ers+SDqdmjkm8pYscDtewRUdjMeZWssI7FUygwKaSoyZjVvVxLbsNJwtAwHHKNuClETjztpXdY1zHp7XQg/B06ss9NFNyXajeB+wtyh/uuNcd4IZNcFJ/1oU3om+tHOemb+xk1mYZL/ltPIywrPLUITsUhdZKwL6gh8MqkoFMb/M8LOn0y7QsaJVXZcLXCE0szfTIRrmF1U7xpC6NpJyTk/IuBbI/uZua5m2Guj4pJlCgGaJyrjqe2/AdgtApAGXWiMi1EQQ+p1qZILE9plRUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hH4/d0I4p8N8xD8RENftgn2pBsiEpuAI//YY+y57N5Q=;
 b=QeLkidzbJ9gLmhKKijehx4wkXj+orqHFgIBhhd86tY6QmPyXBF52AzLOuzf03kgadX0+OpUMoLM4yfNjKYSRG+5PXGg2OVjqNmGVBCYgQl3hfKnAW4aXsXb+KWMWkh5iQtFDjYp/uaqRo6/5VK6Xl/d9tslWRm66tI3pdt+D/DGoSoDxDUG/98WRLnLCRITc5MEAZIOgQcYtP/hSnHtMpxljbRo5GkoF5oQ2O193yM728pNOIEetqYoa2qeCKlhO5tMgYov2yw3TQ68slscH8w8kIh50wkpg/QtkS66n7DC7EiQQOzeBVuL1ZXtB8mnUCc/1cbzOynltD2TobRsxNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hH4/d0I4p8N8xD8RENftgn2pBsiEpuAI//YY+y57N5Q=;
 b=lok5Q/fJSFzlQHpSqeIcGF5Uwp7KQ/5u3Rf92SrThcVCxSymPT0/bxvvzg/CVdPI14cPcUjxa3hnm30hfMtuHeq7vpESygfTuKgdZr/urXpn9MtuiRQmhi6au4hUN9mxaymNvClRhS7O+f0m88085OY1y2HRWBJ5P4PF4ORwEbLlHiLPGuqHB5s5YyoOTJKkCjgCyNkmyt9PTs/gWI1UpGTzf09fa2tkz2r7xhXGT3ycKufdr9CPboaTyXRJbG/wCq/UK1nHp1/71v2VL9MJbEmbBd5zxo/CiHI5NC8i1zRTCel/nCPvTjPQkGDGKgn9sD0T5ihXaS1NI5cnYJCpCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <f4d6dfee-11ff-4d35-9551-f4339f5aeba2@epam.com>
Date: Tue, 24 Dec 2024 05:55:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen/kconfig: allow LATE_HWDOM config for ARM
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <20241217114719.2870676-1-Sergiy_Kibrik@epam.com>
 <4e437c60-4fee-40ed-9d2a-789bac0b36d9@xen.org>
 <5246aa98-d23c-41d5-ba14-c12b0a2ee9af@epam.com>
 <baac9d61-f4bf-4de9-a58c-b354111e3c0c@xen.org>
 <1f6381a0-a98a-4783-a9c0-7ec49303af6b@xen.org>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <1f6381a0-a98a-4783-a9c0-7ec49303af6b@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0035.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::11) To DU0PR03MB9199.eurprd03.prod.outlook.com
 (2603:10a6:10:470::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR03MB9199:EE_|PAVPR03MB10101:EE_
X-MS-Office365-Filtering-Correlation-Id: dc608127-565c-4159-19af-08dd23cec6a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UU5SYy9INm5zK3ZCN0k5TW1SMDdyRGNBb0FSQ3RzN0FBUDdOWlpYMWpoNVA4?=
 =?utf-8?B?a2E5dHBRd3RsVVJLZ2pGTnQ0UCtuMHRiQ1luRk1wUVpMbTl4QkZiRkRsaGpu?=
 =?utf-8?B?YjJQellHNFBNVk03NFBuUmRGZlQweCtkTzQ5MGRjay8yMm1sZDNYZUcycTB2?=
 =?utf-8?B?dHBCdHJjeFMwc3RwSUcrT2Nac2RzWGp2K2ROa2JKN3NpZkYwdHYydmpvTWsz?=
 =?utf-8?B?U3A4OHo4cDFUN05vOFEzVUdrS1NkYU5aVzgrNG1WV2NIT2FvMUJmN1pGcUsv?=
 =?utf-8?B?SlduL2RMRmVRQTlCSS9TaFlwYlBSQlRwYStnV1BvMVlEYmk3VUlmOGZTcGVa?=
 =?utf-8?B?T0V2RlFTcHVYK1FIelZibU1aSFdOSXRiQzNQOU9qZ3pkcUNrODVMM0tKL0dH?=
 =?utf-8?B?bFgxNmV5SEJ4aTN6amV1Vy9GSWhYOW5Valk3MTlLRUU5UDlGaXh0VGRMVys5?=
 =?utf-8?B?MnhGSXFxTmR1Zk80UzVobUZNWFMvR2JQenNZRmppeGFES2lkazdlTXdydUlW?=
 =?utf-8?B?SngzUm9VYnkvOStmOFQ4RjBKVUVqbVJHdVhSdUxzWVJOM1l3K3cwYzIvNVNP?=
 =?utf-8?B?V0hpeHoyb0hVK2JhOEtBemMwM3ZhY1FZSzUyVGRneU0xOXcyeXBlTWdobWdt?=
 =?utf-8?B?UjZkZStDbytoUGpuY1BZZThEaS96NGRwQm5TcWlzZ1VJaC9paG9EVVRHbHVq?=
 =?utf-8?B?M3lFd0JtTlV6Z0hHYjNzd3pPdHpic3dEOGgvVy9QcWlCZm5xKzJIVTREMENv?=
 =?utf-8?B?bllUYXg5V2NHZXRSTFpxVHRGZ3dwS1hBSzMxWkZkMWhSckJLZEJ6dlNXSHVn?=
 =?utf-8?B?aWFJUnVEY1laVW8vTndKSTFNRWQ1U3cwY1B3YndoVTkvOWFvbEpoV2lPVWpx?=
 =?utf-8?B?ZnJBU05DYzZ3OTl3dytDKzFCdG14ZCt1aUhyLzVHTjJiNFhzVWVMeXNlcDBZ?=
 =?utf-8?B?S2kxU1pObG9zNzRzVDRCbWh6SmQ3OVVJTE9hcUZuNDlGUkVSUzRIa3dLRkcx?=
 =?utf-8?B?STlrR3NQRDh4dGJIT0d4N1VWSnNZR2tlZ0U2VEFPeXBEcThydHpnRk9wVUVS?=
 =?utf-8?B?T05DL2NsWThmeUI0Sm9wb1c3QzZWdGZZRW5DNDRJTTFUaXF2Tk9CLytIb0d4?=
 =?utf-8?B?UGxHZEx3WCsyaU8zQXVwckd2RVEzcW1rekdNU1lyTWM4TUhpWlJNNE5ITjhs?=
 =?utf-8?B?aUJVWDJzdkZXcTA5Y2h3bEZNZSs5Z0U4cTdZMG4wRWRZelF0N0hGd3VEKzFk?=
 =?utf-8?B?YUJQallYNDlLbThxVTIvSVNnTTMzQXplaDM0cVNCcFA5bEllclV1L1FNaGRx?=
 =?utf-8?B?WlpDOGJRR0hnV0xUS2h0ZFZmM1UvbExudVhjK2xFVmdCd201NDB2anZFMyt5?=
 =?utf-8?B?Y0ZRa1dEVWF2d1JySmNkd3pjNUtBeFhYWUZHRXJ1YWo2KzFCaWE0RkkxandT?=
 =?utf-8?B?OThLaTQyNmZRdzA2dkpYMVpXR3BPenV4Q3dsVTlEbWRBUkZ0alFROEFhSDBk?=
 =?utf-8?B?QUtaTUVQTXhtWGtCd3M4dWh5QzVlazh0K3NNSzlhaHhWdzFkS0luVzg1SHN2?=
 =?utf-8?B?SnoxdytlZVoxQndyZHgzeE93UlgzK1dkcGN6ZnJaU1F5cmFnMS9KVWFXdy8w?=
 =?utf-8?B?RHlhOW9QbytFTXNzVHppSjUrc2RIeHl5ZGZTL1lyTWptYjF2UFJkYmN4NVlL?=
 =?utf-8?B?ekZQcmxhaEZhR0toeHp3S1FzT3VQNjdFTDNMREdhUTMxUWxDVWVvUllKUlIy?=
 =?utf-8?B?MVg2Q2VnTTJyUlI5cnpRUWhKUHZUWHJaZXMraEhiWEtBN2grSnRKMTdKRGhR?=
 =?utf-8?Q?MZNE0ZMjbHwlE84PkGW75OMiEKdB+8L2YbKRU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR03MB9199.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?THlXR2dvUFAySmFLTGVka2FLbVBwamNKRHEyeFRIOTBkWFFZNEhrWDViZFdx?=
 =?utf-8?B?aFJNWVhuNjlQTkV0QTVRRldWWUI5VTF1MEUyMmtXdkZSd0pJUWo3YW5Famho?=
 =?utf-8?B?VkdQdUNKbnM2WGVLSDREMWFIblhSRkJCUTNoVkRVbEg2N090TGZWZm1IOVJE?=
 =?utf-8?B?SnE3R0Q4SjlXcC9JblZDc1VHQzNYdmpOaTE4ZldhaVZiRkNDMFBOLzhXOE02?=
 =?utf-8?B?ZGhIdG4yV1N4bVp0WlhpeW1CUzUzQlR3aW51RXJSR3Z4d2tvYmFOZ1Q2ZlVy?=
 =?utf-8?B?REFKL050dXhOOTEwTEY2R05PUU1FOTJnZnpiK2tXK1VuOGxEcHBxMXl1RG5J?=
 =?utf-8?B?amFIdkFtbmkxRFk0N2xtSFhUdnkwSGVyaUhNWlphV1BhVVlvbTlINHg2QWF6?=
 =?utf-8?B?WXJQR1ZNS1hpaTk1emV6a0U2NmpyN1pLTUNRY3RSUEl3Q1BDYTlGL0xWV2ov?=
 =?utf-8?B?OGdSWHVRWjE2amhFNEN5UWRGMnFrQW5OOWRNQ0wzVWtmWWw2YW1FSVNyNTMr?=
 =?utf-8?B?a2dIRVpGUG5LeGsrQzFiMnVuN1dVanhPM1RhUm8rczJTZGVUNjliaXhvanV3?=
 =?utf-8?B?WEM5TFpKTzJaQmN6ZnpxL0FHV3ovb0VNTGVkUk4rS2lSM0pDTktkOWttNG5t?=
 =?utf-8?B?TUVzdVljeXQ0SWZWbVdMZ0NKNkJaaFk5UTBkazFHRVkzRzV4aFZPNXczT0s3?=
 =?utf-8?B?VG5FWGErOUM0aDBuL3ZxQUpjdk4zMVhoMy91VWJ4S25RbVFUYTBOMFBrZmJ2?=
 =?utf-8?B?T1haVmdPTU9UelNpNUQ1UTJwckZPTXM0MWlNcG80YnYzS05LaVdzZlhMTXhq?=
 =?utf-8?B?SHdlcXNWVEt2Uk9jWFQ0TVJPV1FXTytsNG9Vb1hKVmVXUDJtenRVYndiT1pP?=
 =?utf-8?B?aU9jRXh1MzlpbVAzb0t6T0xjVU9vMWNlcG1uVExKMURxc1cvbEh1N1lBcWI3?=
 =?utf-8?B?UUxpNFROSkpqbE5qaUVsYm1uUFFJVGxMNDEvTGgvc2tZNnRYSlZkejA0NS9E?=
 =?utf-8?B?cFdzWkhVeUxqSjc4dzJRUHJqd1pia0J5TDUyVHdmRkNnWUpaaUdwTERrcUpj?=
 =?utf-8?B?SUVtbWNxTTl4RElFWG1xQXR1Mm9Gd0cySU44cnVtY3VvMmtMK0s0YzhCbHUv?=
 =?utf-8?B?cGRHZVF5N0swY0NrK0hYZUIwWWxIZjQ5ZmtKWXZpQ3FWeHJYRml1VzJFRWts?=
 =?utf-8?B?UHpKaEpnZUJCNWRnNTNrMzlLQ3djajNJbWpKRDl5Q2FReE5qODBMVzhWa2t2?=
 =?utf-8?B?Y2JnKzFhREo1SjA2NTJva2I4Nk9MRmR3cVpGN1h4S2E1RW9CQkJUYjVMR1BD?=
 =?utf-8?B?a0JuTWdvd2paWG5uTHJoSnBxazcyZWdmTUI4WmYxVmNQbVJwUlZxTnY4TVNk?=
 =?utf-8?B?SG5ISm9obDJkRWxKRzZ1d2QrN3dVSy93V0VRQnpqd3lhblh0WWFWYlF4SUdL?=
 =?utf-8?B?VDRxSlM1V3A0NDJHOEpRamhqZlFRNHdzTDlkM3FKL3ZFbERLRlRPTmFVTkRa?=
 =?utf-8?B?Z1AwTzJpa3NGTzRKQ2JFQm1SdHllaG1wKzQ3NmsvbG5XTFk5ZUtieG93ckdE?=
 =?utf-8?B?alVlUHRUb1JpdUZrT2QxcDBtWlR3NXRBVGl1T3BNWDRxNUx0S2NoOHdzSElu?=
 =?utf-8?B?b3g3ckl1OGNBUTl2ZUF6MExzMG9yak9xcUxaMFA3Y0txejdEczlIVEdZR09W?=
 =?utf-8?B?em5RdFBOUTdOdUJUT2s0N2hRWWl3ajBsaDdpMW9xREZYVDFZS2czcjRPVTFx?=
 =?utf-8?B?VkpLcDlsVXBUVklQTytwMlJsQXBlWEhMUWowblRwTHBnUDM4a3dRaSt5dTFk?=
 =?utf-8?B?SGQ4UnkrZEl5b3VOUk9pK1RpMDh4Y3hSSitwMm91Q2xwLzBRdU5OMHJ3clAz?=
 =?utf-8?B?eDlzL3FCRXpWejQ5NUdXdkdXcUtwRGxWb1NCWHU1TmNmUWVpMTRpOW1HNkl0?=
 =?utf-8?B?a1BmTW5YRUw0Zy93UzJvcEoxQ0c5ZUpUK0p2RDEvWk0wMXhjMnFQeThOU3BB?=
 =?utf-8?B?cXNsRmN3bFFESXhEck1uM1FIeFJUWW1sYWFsSzdZVVlhWmU0WTFHVEpvTzVU?=
 =?utf-8?B?Q09CTzh0ZU9nNmN1ZGhwSm5OVnBYRTVtMHl2VVlmTC9OdmtJS1FNdUpCdElx?=
 =?utf-8?B?aC9yandNK3RSY0t6WUdpenFlY2d3L0ZiMUlEdW4zZ2Ird2QzZG1DVkhFRjl4?=
 =?utf-8?B?K3c9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc608127-565c-4159-19af-08dd23cec6a1
X-MS-Exchange-CrossTenant-AuthSource: DU0PR03MB9199.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2024 03:55:16.0711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W+T0egVfXaDgzuNNxbNGnyJPyg7iPRjwqWDDD48AYaEQenPYPx08woYnTbn8uyLE1QYEZz8bqbQa3yCSuTUAdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB10101

18.12.24 12:38, Julien Grall:
>>>>
>>>> Are you sure this patch is sufficient to use the late hwdom feature? 
>>>> Looking at the code, to enable the late hwdom, the user needs to 
>>>> provide a domid on the command line. But AFAICT, there is no way to 
>>>> provide a domain ID in the DOM0LESS case...
>>>>
>>>
>>> I append "hardware_dom=1" to xen,xen-bootargs in host's device tree 
>>> and it works.
>>
>> AFAIU, the domain needs to be explicitely created. How do you do that? 
>> Is it just describing the domain in the DT? If so, how does it work if 
>> there are multiple domain described in the DT?
> 
> I just had a look at the code. I don't see how this change and simply 
> adding "hardware_dom=X" is sufficient.
> 
> In addition to what I wrote above, Dom0 will be the first domain created 
> and we will assign all the devices and mappings. When the hardware 
> domain is created later on, dom0 will still have those mappings and 
> devices. That's unless you list all the devices in the device-tree as 
> not assigned to dom0 and then assign them manually to the hardware domain.
> 
> I would also expect that the hardware domain wants to use the same 
> memory layout as the host. But that's not necessary for the control domain.
> 
> So surely you need something more in the device-tree?

yes, I had to assign devices to hardware domain manually.

   -Sergiy

