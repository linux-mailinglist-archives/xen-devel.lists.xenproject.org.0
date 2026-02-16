Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHBCIHHukmnr0AEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 11:16:17 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD073142457
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 11:16:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1233911.1537289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrve9-00059I-Fh; Mon, 16 Feb 2026 10:16:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1233911.1537289; Mon, 16 Feb 2026 10:16:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrve9-00056j-B3; Mon, 16 Feb 2026 10:16:05 +0000
Received: by outflank-mailman (input) for mailman id 1233911;
 Mon, 16 Feb 2026 10:16:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aABt=AU=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vrve7-00056Y-U4
 for xen-devel@lists.xenproject.org; Mon, 16 Feb 2026 10:16:03 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7dfde1eb-0b20-11f1-9ccf-f158ae23cfc8;
 Mon, 16 Feb 2026 11:16:01 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BY1PR03MB7804.namprd03.prod.outlook.com (2603:10b6:a03:5b3::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 10:15:59 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 10:15:59 +0000
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
X-Inumbo-ID: 7dfde1eb-0b20-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gd3tMVYH5R6NzmYkvvzgv3/8LlUWJeMIG7Q6gDlaavt7tlMdPMSfae1LJouFRYYImxwh3/btFs/k38HG7JuoNmlcuQIrEG8F3AFhpqrkGpTM/eD/vHq5JKzj1JmVKUc1CcBQmGgJPefzNXuceG88HROF0fNTXMFThYye5Ra5qIIVe7I1n1XdsTNtRBkfxRfnrrMpoC516NEf4FwKzguJ37n3sviClntprBE99bZ8vF91KhmhoF5MXewSxjotZKs22M0EIbZ6f6LIPpzLOX2LtdmjFaKmH2XJ5LGuEuzBqRWah5ps1IynD7P2SaYvIjsiVNBZZbpvk4rHtCz7Nd8QLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kwQOmHp52ZjOBw3FJ0akkfMrRrqh9uqU5TyBIqj6OLM=;
 b=tMYd5YL3rzqgK1ZK7x7dsz1dBsalXdEegNR1hoYSboCS6IeMw/HSXohRb3JmHyjCHa3EZx978HB1lqhwZFmc4q/U4SvCFSRPMCnOTc72VAR2f1BZ3XkZg46Zuueh6qkZvKwN8QDeOT8d/QPhNZVZwwDmzHnUgfEcuzl+FPbG8AIwobSm+YMOGguyWXYTS6QWW2jCc78URz+Eb/8pesLNfwtRHRTvdZMyi5g04aFVbVkmBzxiek7kQi+SfJqt/OexiokAzf0OBUbUtVHjPbK7UawB/XYEnsxaFP/7jzduydc/SCTnoI3rb4WI5WTGvVPJK0vSGUj6eJdWNj8q5W1fgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kwQOmHp52ZjOBw3FJ0akkfMrRrqh9uqU5TyBIqj6OLM=;
 b=DXvkBENvLxpycBcHxgciFTUuGRsyyC5N3yE0gWmYqR1ppGIuZWtgjLnVrcDbR7YGc1YdrEJypK1xSxHRGIul3SUTVmMfxPfe+HDa0AhsC31ZklbdeqrQd0W2qY7FYw9bQlFZKYrtYR3aveMsK3ZTNotwnrj49zJkwExmDQfBboA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <f06b7e86-4188-485b-8f0e-c55bc72929e5@citrix.com>
Date: Mon, 16 Feb 2026 10:15:55 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, roger.pau@citrix.com,
 Jan Beulich <jbeulich@suse.com>, Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v3 2/2] x86/svm: Use the virtual NMI when available
To: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1771177081.git.abdelkareem.abdelsaamad@citrix.com>
 <ccd7d351fcf47e6a74bd6bdfe3fe8bc9f5023e7e.1771177081.git.abdelkareem.abdelsaamad@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <ccd7d351fcf47e6a74bd6bdfe3fe8bc9f5023e7e.1771177081.git.abdelkareem.abdelsaamad@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO3P265CA0018.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::23) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BY1PR03MB7804:EE_
X-MS-Office365-Filtering-Correlation-Id: d842d1f1-ee1a-4bea-92e2-08de6d446158
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c2NSelBPOGxwUmtFQ1dRS25vVlFSSCsrNDhNeUppeU5sN1pkb3ZaVk5UaFdF?=
 =?utf-8?B?aVhqNHFYWTdrTjNMYjBKMytFOXBweEp4aHlEdHJYU3BKQTJVSkRBVmRZMEE1?=
 =?utf-8?B?Ykg1Rm1EWW5CdWtHZk9GK3YzdnU3KzBma1JmOVY5RkJIQ0tmMU9hZTB1czNk?=
 =?utf-8?B?bUNkWDlQcm5CdDdHZmJjNThVQ1pqcVViOUxmaEZvMHdYZk9ZSGtVMzY1d1Q5?=
 =?utf-8?B?cDErTSt1MHJXMDVSaXdtaWs3aDl6SzJRM0xrRnpuTVJyQVJYSE1YSHpQdTZ3?=
 =?utf-8?B?REx6WE9IWGgwc2U1dXpPUzZES1NNQVhrdCt2MGtVZmYweXBHa1ozZndEZFZu?=
 =?utf-8?B?RHdoVlpOYXFFQkxXNW82TzgzM3NXV212NGVBdmhsd2xlby9KeTAyRDZQbHZi?=
 =?utf-8?B?dzI1Y0pQZTFXUUZEcFNpQlNIaExMNDAxYlg2YUhnRWthWUp1VndTR1dSY2x1?=
 =?utf-8?B?VDBlcTJIb1lmWDBUWk1aMUdzOU5FVm9NRTRLOW1jUlpZY1QvU0Y2U2sxQXdB?=
 =?utf-8?B?SHpEOFZmNmpVOTRjaTZxNFNFQzdIWFJWQkR1R0R1cStrclpHQ1k5cjk3TEUy?=
 =?utf-8?B?SEdIT3FQREQycWZIZVl1eXd1NXVFMmhVWk5wNmRmQVh0Z2xjR3ROaHJCVUNC?=
 =?utf-8?B?bG5qRkZIeXB5L01Yejc3anJscDQ0VFN2Y0VIL3V0anY0Qk5IbEY3YmwySUtW?=
 =?utf-8?B?OE1rM0RNRWFuKy9EaC84elBKU3FINXJoZU1IS2JwTHE3VWFQYlRjUVhBNmY2?=
 =?utf-8?B?Z2MwYTU0UXdUYUd6SitJSnB1ZjVYaGI0OEhrNHk5MlNVU0NJU3VPeUpabHJh?=
 =?utf-8?B?bXZVcC93U3BtWkQ1RkFkc3dHd2V6MXVtVStEZHRXU1RPdWxLeFNoWW1yUllH?=
 =?utf-8?B?ZC9PcUx5ZFJtVldvUERBRDV1OVVLcWZSbC9OQnhoN2JkWEszMzJWQ1JkNDBk?=
 =?utf-8?B?V0s4NVBrSVFIb3Z6TGZaRGJEWnIvOUh6eUs3M0xIUnA0V3ZKT3BqQ3F5MC9k?=
 =?utf-8?B?TnMyTmpzN21Hcmc3T2I2aW9vZzh2ZXRoZFdHUkdvYWhvMkZVMDlKKzdBdDVh?=
 =?utf-8?B?TXFBbXF4UHk4bzVVQWlObFR0Zjc5dXF2QlBKc0oxSkR6VlYvMFN4SjNCRGxh?=
 =?utf-8?B?dGZMNmZCaDBvOU5QMTNkMDZObXhnTWNQRlRvbmVjWWhQTGZ3dzZuc0M0b2Ju?=
 =?utf-8?B?Uzd2L1ZWUHRSN1AwYm10K2RxdlVxdEdRR01DeGRMWWw0a2I4eDIraERCZTRE?=
 =?utf-8?B?Ny91U1hMTDAwcWVINXN2M3NoSTAva2k0RXlTWTMrQkpXMkFHNGREZzdPMmNI?=
 =?utf-8?B?UDQyN2lNc2hqR0ZvVlJrbnpmWThqeWtoL0NQakw2aTdaVTIvVVBpZHdzNnZl?=
 =?utf-8?B?aWdBclBGOS9WbENzNENmaFpxQlhwNTBLZlpWN2Fab00rWnZ2TkVleDJwUTBt?=
 =?utf-8?B?YUdKT1B4ejlYSERTSmNNWnBUN21rZFV2bTFFZlBBZWkvQmcwbHJWZ0cwZ21R?=
 =?utf-8?B?V3luQUVjQzhEMGlXR3pUUW5lQXdyL3VrblZXOWlzWmM0dklkdXdpYmNrNElX?=
 =?utf-8?B?bG95cm9DVDRYTkVNNFAySTdFV3ZxUWZuSFZLZXV2NGtSMmhjZUlHMGduUzR5?=
 =?utf-8?B?YzZwd0tLR2hxZ1JYRm9IUEJ5elc2ZGNYZzBPWm9SYmUxbmpXcW1HSDJGTGxY?=
 =?utf-8?B?aFVuamJRTFQvSnFIQ0FuZ1ZzellwczQyalNlREJFWEFPL1QvMlFTMFZaTU9O?=
 =?utf-8?B?dk1RRitTSjErRjJqamU5VEhkaWFRRkk0UDgzZ3RyQ1FVdHA3N3BhTENqS05y?=
 =?utf-8?B?ZDdDREc0SHZIR2t3ckxaVHdHYTNlUnZGOTBhcUpLRjlDTzZlSy9oWjRFamFt?=
 =?utf-8?B?RHFqY2pGS1BzSkxUTDIwaXZZNVc4S1RsTVhlMUtlUjFxSFBEZEJ0QUlLaW0r?=
 =?utf-8?B?L0lRMHJBelV3WGQwUjNuZmtnaW9EZmhaSU9pUDRmTzZCM0JUNlV5NU1FZHdl?=
 =?utf-8?B?bnJiS01EeTYyUmZ0cU9odE1ORVg4bE9kV1FRYnlUc3NVQzdqYVh2QzJJWHVm?=
 =?utf-8?B?RkJZWXVUSTE3b2dVMU1TdlErd0tXUk1oQ0VTV3RpNndSdkJMUTc4aG1aVW5l?=
 =?utf-8?Q?tFhU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bjBDZmtqY3dJWDNKa29IQ05jR25qWVJWbXlNQk92SFhKTDVzeGpXSzZvNVFa?=
 =?utf-8?B?QzlUWmJhNTN0Vk45ZlZqcVFleGx6cEdQQmp4ditLMFFuZ1dML0hWRVhWVnJw?=
 =?utf-8?B?bCtRaExxalM1alR6OXZNcVl4Znh1SXBIdkZ3WXJtbkxRN1JWaEVjNXVUa0Q3?=
 =?utf-8?B?cUlqSTdMNUIyK0k5SDVMek1DYXhVVkJvMkxMVFo0MnVlUDV0bmYvQnZZWXpB?=
 =?utf-8?B?V01CMFVPT3ZGVkh4U0o2VGIzL3A0cUZCQ0pmQWJlcFRaeFgxdVNmbDV1OFY0?=
 =?utf-8?B?VVZRRFpaWEZ6Mk11T2xOblRiQnFEWHNlMTdYT1Q0UVBTMnBXQTlCVk9vdHlT?=
 =?utf-8?B?enhIc2NYQnlBTmtSWHNwRDFBOUcya0pZUFZaSzBQaVRCd3RlTjJ1SlZTeGo4?=
 =?utf-8?B?THZscTV0T0dMYUlBNHZoWWY3czhGWVhqdzFZZGxXU09mU2FTK0Zya1BuZmE1?=
 =?utf-8?B?S1VURTZVbHdCTTRhWlRhU2tzTmt0OGZwUUxMR2U1SHAxcHYrTGlzY0Jndzhh?=
 =?utf-8?B?ZmpWQVRXRGpUUWU5TTZPMEFhQ1BWUEMxZFNsWWhSb0JsMFU3OHlqbXEvbXNP?=
 =?utf-8?B?Ym9PS01vT3ZtL1lVbFVkVElEYmU4TVJwaTZybFZGZmNvTkE4aEpzN2FzV0tt?=
 =?utf-8?B?Zlh4T2xaVTRzY0NJR2NYMkM0QnhXbXNSR3lUU3F3N1ErVWlyb0dpZWI5UE04?=
 =?utf-8?B?bmR0SUVyQmhna25laWhncHEzdE1SYXNBaGNSaWRraDBaQm40Y0kxZFQ5R2ZZ?=
 =?utf-8?B?LytmN0RIbktMWVRsVTlPVFlrWi93U1JhQmN4SkRzL1FqVENyOHFJUm5QelU3?=
 =?utf-8?B?QjEvVkQ2djM5YmFpTWIzMVIyZHpCQW9Md2FqeUFlRE81cCswUnZ5dmgvelJZ?=
 =?utf-8?B?eVVKT0hqZWFvcGZOa2I2L1YzcHJ0YlhTSWV5QjNMUDZUVHcrcVNEK0lieHhT?=
 =?utf-8?B?Z1Irbmdvdm5IUnBSVTFhdE10Rk5hV3R1aW05S0VMaU9wbzkxR0hTdEpKL3V4?=
 =?utf-8?B?UkJMeFZ3UXEySDhvbFBNalRZaW5qUVJzVFFEZGFTVXhLdHhWMGgxbjZlUEVY?=
 =?utf-8?B?YzZaWWdZNll6Z2txNEQ1UWFlOEpqYmNkdHh6YmVJSWlyZXlyVVpnaFh1NmxG?=
 =?utf-8?B?UkZTMFh5a3o3ZGwzQ1N2dHFMbVBqSGh5WFJaQTU2UjVNWTNRaGx4cHJ4alhz?=
 =?utf-8?B?UEt6QjJ1ZDExTlR3NmlsNUMva2tOWm9Ec0pzQVpvU25vSkYzdWp0WjZobWJi?=
 =?utf-8?B?U1FMTWFiT3Awa0FoWG12NDNhZlo3ZVowWEx4c3IxQWRDMURtc2hBbnp5a25p?=
 =?utf-8?B?MHdxM3NvL3JIaWpJbmZqMDZzU241VDNqVEV1Qnc4djJCL05XMDUyT1RMQ2Mw?=
 =?utf-8?B?WFo4aHFTUGZvQzBxeGx5S0RBRjJVTUk1ZGJHZXJUelpYT0pMKzRZU2ovL3Ux?=
 =?utf-8?B?SUlXWS9zSWNPNXhscE1GRk9wekQwclZQcXg3YmlwUUN1Um5icEFHd0piZG9V?=
 =?utf-8?B?OU5ZclRsMHZ0ZjBPbkFDL012aS9FNDI4WGM3QzZVSjlldGlxZThhUkFyV3dN?=
 =?utf-8?B?T2NNRy9CMi96RzdLYldwcGduNWEyWCsyaUlsZTE1dkNjbmdkS3Z6SmxWaS9Q?=
 =?utf-8?B?VnUwTGJ3YUtINWNKQVVKZjJyYjZYR1J2Nks5bzFzT2QzWFk5MHRHKzJuRUls?=
 =?utf-8?B?dUxYblFjRCtvOXRJOUdnRll0ZUYzMGlGbTNvd3MyVlE1Q2pPSU90QlFvdnN6?=
 =?utf-8?B?V1NZSW9rQ2JRVjlUUXptaEFYN0JrQ0V2UjlSYUV5SGliY0RDUzJSYWN3S2p5?=
 =?utf-8?B?SEl3ak5la095Kys5LzNSTmg5VGFiTVBVaXZrMXgvcHdIUTJxVXE1RHk1QkZ5?=
 =?utf-8?B?Qm8rd2w2S0JQUGplaFI3SThyNk83UVdaR1dGWTNLaUl1U0JGUys3aWtxb0l5?=
 =?utf-8?B?MlRaOHRWSWp2ZUpwV2lBcU44N3lYWTBHM1Y4OVJidjY3VStuOFRScDZvWFVL?=
 =?utf-8?B?V3dOVVE3elhZZ1dyQzFYYUN2a09UOXB5QnlzeTRCbmw3NUtiRHFmWjJ0Sm12?=
 =?utf-8?B?ZGl3bkZDNTZrUXFnWm9VaGl3bWlxNHBhd2FzRzRnQ09MNVdSUEVwRWtQZTJu?=
 =?utf-8?B?WkhRT0tWT1VmSWI4YytCbzNYMHVPKzZhTk1zTURMaUhIUXd0Zko3UTBxTFhj?=
 =?utf-8?B?MTdVQjZpRXNXZXJOUStUV3J0ajczU3BkNXM0OVlGRVV6ZmFaVHYrWkdGQ05P?=
 =?utf-8?B?KzNmc0xWb1FoMVBsZDZIUUpSdWVJdlYrQm9aZFM5akY5S0ptWmVwVXZUY0N2?=
 =?utf-8?B?eSsxWEJQVWhBQzdGa0R2R01kRmgyT0V0eVNoRXpvaEVVQWZkY3ZVUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d842d1f1-ee1a-4bea-92e2-08de6d446158
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 10:15:59.2178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8kr6nGSR6Fs1m8ZO8iUkFch4dVFPgOEfmfTeFVF4CDuGxrnc21CfZgH5wmqC0iFhSAqvlEUsaSVhQ8nDtsj8Qe8zYOKrgQrAtwrZXCAtpPk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7804
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:jason.andryuk@amd.com,m:abdelkareem.abdelsaamad@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: CD073142457
X-Rspamd-Action: no action

On 15/02/2026 6:16 pm, Abdelkareem Abdelsaamad wrote:
> diff --git a/xen/arch/x86/hvm/svm/intr.c b/xen/arch/x86/hvm/svm/intr.c
> index 6453a46b85..3e8959f155 100644
> --- a/xen/arch/x86/hvm/svm/intr.c
> +++ b/xen/arch/x86/hvm/svm/intr.c
> @@ -33,6 +33,15 @@ static void svm_inject_nmi(struct vcpu *v)
>      u32 general1_intercepts = vmcb_get_general1_intercepts(vmcb);
>      intinfo_t event;
>  
> +    if ( vmcb->_vintr.fields.vnmi_enable )
> +    {
> +       if ( !vmcb->_vintr.fields.vnmi_pending &&
> +            !vmcb->_vintr.fields.vnmi_blocking )
> +           vmcb->_vintr.fields.vnmi_pending = 1;
> +
> +        return;
> +    }

So what happens to the NMI we're trying to inject when NMIs are
currently blocked?

~Andrew

