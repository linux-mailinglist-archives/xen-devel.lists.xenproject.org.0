Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6B5C74012
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 13:39:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1167269.1493630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM3ww-0007Sf-K1; Thu, 20 Nov 2025 12:39:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1167269.1493630; Thu, 20 Nov 2025 12:39:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM3ww-0007Qp-FE; Thu, 20 Nov 2025 12:39:46 +0000
Received: by outflank-mailman (input) for mailman id 1167269;
 Thu, 20 Nov 2025 12:39:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ChS/=54=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vM3wu-0007PA-Tk
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 12:39:44 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa6501c8-c60d-11f0-980a-7dc792cee155;
 Thu, 20 Nov 2025 13:39:39 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ2PR03MB7425.namprd03.prod.outlook.com (2603:10b6:a03:55d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 12:39:36 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9343.011; Thu, 20 Nov 2025
 12:39:36 +0000
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
X-Inumbo-ID: fa6501c8-c60d-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u0QJbtAa8f067kgVwFxhuXl+HWtwp4vQL3jUeBPiQHxvGleqxeNrXR0zOfVE3nzWtdyogP8sSLX7Hh5h8oBOVQc8Hy0wOMmSriEkGglAI5cci6SHsr9oN4mlFydgBooQntSWeZH0MskKYx6EQocriHaydHvUwWpUQ7QWa1joI0cfvMFGB7C+L4iQ7DTQOiBoGUSszb7pqiwlQ2ac1Rx6+e/Qx0vHE4iwhB2X/tCbYjU8wN+1XZYmLzU/U/zuaFaSRk15sLdXtat45rSyjIPKy03h4VaE/t/xNePYjBZqBFBfSPF3nVcZJoUxXqhRGxKJm7LNC2ADJ5ezEwGnS0mxpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Srutxsdx2f8EKcXh8GNTt8QRn2AlV0I9d6MyitlYKI=;
 b=l5QTGHkJBHC4jn74x5vNq4viQy+TbiVHi2K6G/zce/oAiKb2B+IfEDooajCfEnWq5zhR0tLpF8j6SzlhFnXZ3C/uOi8mF8KIaHmCEKHe3D4u/t6CSvYPwZ3ULGB5aWYU9SQXWWutVxbo/Lz46RuV0ZuxzkmQtd3vCd2I+CU1NjoYJHM0+mQS91zt7hsxAZ9p7OoINdUAoG+W2/hgFpX+QwynYdErEwQi7C17pACvbN5WVb85ULLlUNIJo94qJVxyOaiub/+Ruc1Y1VRBv6an2O9FcIA0lUhseNJgocKxLX9JEHc/fcFjq94uZqR8iM3qpVP1iEr/X7fpBZ/kqv5brQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Srutxsdx2f8EKcXh8GNTt8QRn2AlV0I9d6MyitlYKI=;
 b=s4jy3MHTCdJzNd9FrxPj+hTqqn0cimXbxpTIqvjJlI98naBqjnw12VCuk0OllfeInpRv71Vv3z87Gl9e2VputA9J6nA1T/Ibo+nShCzKvvx5Hmq+kl3/D4DTYu/vCC3uxoCi0yvLJzgONGRPRQnz3SGqJjzWIIuRLudNE+jL7ig=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <3c520a2a-88fc-4da0-8fff-d9ae6f4ed7ec@citrix.com>
Date: Thu, 20 Nov 2025 12:39:33 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/12] x86/irq: introduce local irq_desc
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
References: <20251120090637.25087-1-roger.pau@citrix.com>
 <20251120090637.25087-4-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20251120090637.25087-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0015.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::20) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ2PR03MB7425:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e297dd4-a9d4-4732-814d-08de2831dd06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZkpodUFBTzYwaTJqOHliVi82bU1XY0xUZ2ttVXc2TndId2dwM1NGSHZaS0xC?=
 =?utf-8?B?eHhjb2hYV1l1UVMzSmd5elFFcDhGV2MzT0kwcmExY3ZwTWFqZzVBcmVpUzVN?=
 =?utf-8?B?V0pXbDRsa3Jtb3kwdE0rRHoyVGF5eEJuRS85VWVld3RmZDJheitXaGdqWjNU?=
 =?utf-8?B?dWJKWnhRRlB2WDB0azN4ZHZtY2VLRE1qUTE5NlRhcld4ZnNBNVdXeU9hK2R3?=
 =?utf-8?B?NjYxTnNxRGNaMzROQVRaN3pzWmxtWkVrTXVDVFBMbzRWT2RNRTUxdFpRTHJu?=
 =?utf-8?B?TENiWHZjbnQ2SlZFQlkzQTYzcGJJMU1GdGoyTlo1eFR3ejltYnYxM05OMGtt?=
 =?utf-8?B?M3FIMWdyQndUSkREZ0ppSEFkaWVvRGxqNEVOMHQzY1Z0L0dzaVpudlVKQmEr?=
 =?utf-8?B?RlBtVnF0UXNUNWFmUDNHYXBFL1VuTENYemFMZUxWeGNVZjc4UG14QjdCTE1N?=
 =?utf-8?B?YUN3N25XRGFsZDNpTFVWeE43R3N0MCtsV3BHYkUrRXEyN3BvK0cwY3BFS1RD?=
 =?utf-8?B?UnM4R3k4WTV3RUh1bnhXZlpXaWZPb0QyK21pTEJiTjN0QlhWUmlnOUFSL2lE?=
 =?utf-8?B?NFpVVUxKbk9SNDU5K09yblRGVmRzSmEvVVdwbGxxVmt3WTk2eDl0ajZpMk8w?=
 =?utf-8?B?QWY0REYrUTd3S3Awb3BGbFRmYjE1SmhqUmtaYis0WExwOHd6QlAwTHZhZytR?=
 =?utf-8?B?b3BYMmxod0RKaVZLWE1welphbEt4NFl1L1ZXVCtmd1d6bUlTV0RBVmFQYzZR?=
 =?utf-8?B?b2dHc0lHTlVRbXN4WVI4RjRFTlViUUFSMi9INkVCL3lIS2VXQ2VYcmVuWFkv?=
 =?utf-8?B?WlBtdXpCT0N3TUdpWTE2d1FJa0h0VVllQjRYcnpLMmVyUTA5WXNNR2FCWUdI?=
 =?utf-8?B?V3R6Q1NRcTZKQ3Fid3ozZGV1ajRuczhJWTVvUGtXUGpvS0M5Q2RZTE4vYXlW?=
 =?utf-8?B?K3VmdGUwL1dxclRkU1RRUGM0blRsQ3JPNE9iRHljdUVNWENFL3hWdmtvTFBT?=
 =?utf-8?B?ampaNDV1V0hXSTROT3FpNkU3Q2lubHU1VjVGL3ZIcWJSZ1RFZERVT2pkOTZu?=
 =?utf-8?B?V3ptQzUxdjVRclNnSEI4WG5CV3hJWWZUd3l0d0lXajRyMTZmN0JRckpubUU4?=
 =?utf-8?B?OEphV0o0ZmdRZFFrUFM4QTFEd3dtS0dlUkV4aWZwVVBCK2JpbTkrOWJQVDJn?=
 =?utf-8?B?Zjc5NDJ6SXo0UUFDVUNXVjNJN3IxeXRYRkZQZW5pRFZnOUtFekRVNWpoM0Nk?=
 =?utf-8?B?WmIwYU1hMnFvUXV5ZW1zUG9uZnY0VUhCcWxmbWp5dUw3L1lLRW9qZXBNMjNT?=
 =?utf-8?B?eGw4cDlJdE82elU2ZUpwVlV1STU1Rm0wdDlBVW5yV01BRGNYci92ZjBPVGc0?=
 =?utf-8?B?UTRwamdHSGMydi9ZMXpYOXpMZEdpTS9GMWV0UUlZRm9xVkVWbFg5Rk8wN2Zv?=
 =?utf-8?B?VnRJa3E2SVU3bFR2WnJwcFRRUmkremZXSmtiMjVoSkFkV0Y3V01UbiszOFJF?=
 =?utf-8?B?UEdhZlpobEprMGV2Qm1RWjhFeDNuZ0hMQ1VTZVVVWVdCZFJTV3h1Yng5QWpp?=
 =?utf-8?B?STg2dUdBdmc1dEE3dHFxS0lCNzh1b1ZMYVgxTU44cGdLd0daVkJ0ZlpZU2l6?=
 =?utf-8?B?Z3lHeFFEVEZKRVNHRjZtWVpSNHZCb1ZWaDJwRDVFM1p4dDVjNjZ4NDNNUUpB?=
 =?utf-8?B?cks0OGpYUVFUYXVmNlI0eGxKQUN5eHptVU02VnlpeUNIZHl5T3hYRFpucVdw?=
 =?utf-8?B?bFQyOWRheU5ITksrZ2lHVmE4VnQ2UGNtYlBWZFBOZjFhNFlLeUYwTFBkQnAx?=
 =?utf-8?B?SzVvaXFIQ1BobGJRZTJjRTcrT1E3aStLekNrbU9tYnF3RnNGN1VSZTlTVXNj?=
 =?utf-8?B?OTJRMVlBV3JiOWVDVGg3Wk5odmovSENRbTBnTmJWaUpYbjl4Q0NzZjdxZmFk?=
 =?utf-8?Q?PJRABoRRikSpA5VGWK4cuXiVweJsIr/c?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bkFlNGEvYVFrVm91by8xVDVTY0c0SW1haGxRK05IU2RzSE0vdi9TL2NQV3FL?=
 =?utf-8?B?K0xwcndxNTF2eDgvT0JzNjdLd0d6eEJXZElicms3TldRMjFXM0ZaU0FRVHRE?=
 =?utf-8?B?RlpiWFBhenRCUFR2aUJDTFRVVzdjcEJ2SndWWjVGbGxxMzlVSHBGVFpPMWhI?=
 =?utf-8?B?RGdJdUh5TERwZW5JaEt4NVlmbTM2OWk3R0wyVEdBRFNUUXJ0MEM4WUR1bWpK?=
 =?utf-8?B?UjlLbG4rZzd2Q1h5eWc3SVlyTnhRUXlWSlJ4emNhYkdESzNnYzh3RUYzMTFl?=
 =?utf-8?B?bWFxcEwzUHJRN3g0R1JxUHIydnpIUVZVZmZxWEd6anZvWlpvcnZCVjYxNlpi?=
 =?utf-8?B?NEo3R0dobkFGSDRSa1FWOHpwek1rWWo1MGFLVlg3MVlkb3FrSTJZQkZwbUJY?=
 =?utf-8?B?bVh0cmZTNDRDSVl2RTZCUmNiWU5jY3hJVW1DalFlcU5kbGJCWjcrMmkxcnpa?=
 =?utf-8?B?MWZyWTE1TlNyTm1zN2RUYzU1ZzdFYjVJVzIrTzVLeVZIeXhSWXBOdUVkbFoy?=
 =?utf-8?B?ZGh3Qys3QjVjejNEQmc4bTV6bTkwOHB2T3VnRTIyYmpFSXVkNU4zMXFKQktC?=
 =?utf-8?B?SFlibUN4UWhYdHZNTnUrSVRGUVl2bTR5Wi9QSi91bERmTmJ6aHVZUlM4QXpO?=
 =?utf-8?B?UjFZWnFkZWVtaG1hMjdKazNtVjRlUDlYVnA0VkJZRW1CZTNaK1Z2MUE3L0VC?=
 =?utf-8?B?ZmJJSitWSkdSWmhpV05BK2kxbVNrODZEMFlkVE5DNFgwMHZuY3p2U2tZUXJm?=
 =?utf-8?B?emJhKzlRK3orcGhTa2JWQlRBeEdjSDlLVVZzOTZNTllOOGRGK1JEU3BuNEpj?=
 =?utf-8?B?amVDWnh4MlI0T3hJOU9zTDhWd2ozR3lNZlpkVGl5N2hHMkFGNmh0eEsrUkty?=
 =?utf-8?B?cVJJN3dGeDdCcGlJeHhCQ3VWZ2RvaWtxY1o1TGdSZTBTcGtRSlpwVVg3bkNs?=
 =?utf-8?B?a3EzK3JERTdQYXphUGpoMUdmbG1NTjRoMVdaQ0ovNXVTb015RnU0d0haaERZ?=
 =?utf-8?B?L21ady9xOGJwVmtjWmVSY1h1OS84a2MxRUZtL2Z6elV5VXJHeEMzNG4zSXV1?=
 =?utf-8?B?NU9URndBamQ3d1RvRldncUlOdGc2U0R6bi9HR04waSt3QlpzRTBsbllJTzd5?=
 =?utf-8?B?OTg4YW9ZNDE4WTdxNVJEN0R3d2JwL0R1OFlIR29JWGxkeGFlVmFlOTE2MnNn?=
 =?utf-8?B?REZLaTFEV3YwSTZTNEdhbXFnb0tnZEJVUGk4MFJqcEZQeGhBV2kwN2R4Q2pI?=
 =?utf-8?B?Zm5ScE81TEFMdVVxR2RsbXRNYnZpS2NCaHc4SHVBcytsc3FndzZGbmlwOC9O?=
 =?utf-8?B?MWgwcW42TjdIR1hQSUNpdTd1dGJjbW5EWVlJRXJxc202NG1qZTF0azNCdUp3?=
 =?utf-8?B?ME90WVZBOFNoRXdnU3pTZnlTeGIvUlA2di91R25mWWZwVHVEeGxXSDhKY2dk?=
 =?utf-8?B?Qms3UnF1NHVqMnVnRkwrSjVteXhmLzFqRXlDYVo1UDBxdCtKdmtGcXFQbU5j?=
 =?utf-8?B?N1pUNlNGckJNNUlFbHNNWi8yVExRK1RXWHl4TFZPMUFLZjZHNkw2czFTcVhE?=
 =?utf-8?B?dUo4ckdNQnZBUldLeXhkYlpjVE1uZGlYMmg1T2NMdGozTkNFK1NlMTMyQXpu?=
 =?utf-8?B?YThFTzN1MmF6S0VFOG90NjFMa0t3dGE0d3FKS3JxTmNHSU5tR2d1TnFFYURG?=
 =?utf-8?B?eEV5MVpXVXU1Wjl0NFFaWjhiYStzYXNJTGFGV09LVHYrT2FHSWM4MkZvNkcr?=
 =?utf-8?B?QjVMa04yQk8zdWRYL0xkUVNMdzE1NjdLalFnWU43ck16OGoxaEVjOG5DTjk4?=
 =?utf-8?B?VzhRSDVWT3hGUFFkZ1FybFZHUHR5ZkZBZjFIMTdWaVcvdHBwUzBUYkhnQ3FO?=
 =?utf-8?B?VmRxbm5qZTVSL3FKTUwvZkV2QkxwTWVWMlZpSHBxbmpzOHJzUTN5aW9MUG9a?=
 =?utf-8?B?ZGNQbTNXM0s4RjY1L2JaZlpaZGdBclZudGJoL3RBM05iYnRqenJnY3pHeE5w?=
 =?utf-8?B?bzBnUGVqZ0ZNa2ZtM3dwSHc5NThKYSs4dWtKWndkREtWTnVhV3lmeEd5djFW?=
 =?utf-8?B?elM1ODlRTGt1ZU9sUHVVYjJ3NXN6UzlSYlBkVjFWQ2lwTWduazllRzdHa2Iv?=
 =?utf-8?B?VTI5ZUpHeUgwMzc5VVFZWFVTd2xicUNzOHd4S2x6bUhtYnZiejVJcmJvL2Rp?=
 =?utf-8?B?Umc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e297dd4-a9d4-4732-814d-08de2831dd06
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 12:39:36.1869
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZyIZ4ufgmgzTMCTlLqdiAzC/TZNVgzu2rsrVLWqA/vlzx4oRR2v+k/iJm1Y2MOvCc1ZtL0IvnERfo70FSDGQNx9SkxxgCDtjbghZ7Jbs+3E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7425

On 20/11/2025 9:06 am, Roger Pau Monne wrote:
> Avoid duplicated calls to irq_to_desc() by storing the result in a local
> variable.  No functional change.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

