Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0E7CF5A5A
	for <lists+xen-devel@lfdr.de>; Mon, 05 Jan 2026 22:20:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1195756.1513674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vcrzv-00045M-F2; Mon, 05 Jan 2026 21:20:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1195756.1513674; Mon, 05 Jan 2026 21:20:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vcrzv-00043O-B6; Mon, 05 Jan 2026 21:20:19 +0000
Received: by outflank-mailman (input) for mailman id 1195756;
 Mon, 05 Jan 2026 21:20:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XtAc=7K=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vcrzt-00043H-NN
 for xen-devel@lists.xenproject.org; Mon, 05 Jan 2026 21:20:17 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 53b685dc-ea7c-11f0-b15e-2bf370ae4941;
 Mon, 05 Jan 2026 22:20:16 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by LV8PR03MB7446.namprd03.prod.outlook.com (2603:10b6:408:186::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 21:20:12 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 21:20:10 +0000
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
X-Inumbo-ID: 53b685dc-ea7c-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sa1lq9B+Fsqc6LNIdUx3tY7UXgtdUDKvBOE9iQDCkhzQsr5IhKFfXAhqEyCioEUYCyLw3lCjUareRWQ43zAaKQkyjuCMh0PUEF4Qk/ydICruefs/r6VTPC8QE46qWUc1Eeo7kmoFGP76XECdU5NI/3y7wfmtygIbEKxaVZQCIa8HdzvdmFjbdbgoIOkKT4/z/a6JXSvgdzimaTvbgqLDTGB0S8QyuFz9EADfn/LdmqL+/dMGhqQsMhxHQNtG8/hnU4NP4sRkbsRSpoRF4iG1f7CdUkq0ILdReLV/1YNwFB1WSMGCjXqHJxqPhPqMqRoKbkmUVwI5cVbm2j0JoBlsvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vzxh0RagYBCAW8uT4wSRqZj7umkm7gk019GzWqknGGY=;
 b=gkpFhFOlpWCBTbeMl+7E6i739hMu+CIwYcj+8M5+hWkDUB6PXCYYeYfdnYV/TBWXG1X+8b62qNdUZ+q1uX1DjPcD8azvvB/4BxRJXZROMpkVOJ5KT17HWIuRV0JeCKTLpjUHFbX5csQtKj5vWw3djKfNV/1VOLvY8wk7ZuIHDTDVot74q/Dh7S6ZNuVQ2egkwExx5sDLeF6ZuZXlxIn/mPofOGg+MGm/pRKBxabmaRjB6UvLJbMUF8R5aA9lPwKRT6F66WVXRyRu8ouo2QG4WtORDN4DlyWTIdCenZqdorYR7M4iB/lOgVICiWmDJy8vyYWUcoaK82DVz9jYennaJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vzxh0RagYBCAW8uT4wSRqZj7umkm7gk019GzWqknGGY=;
 b=wacEFowuDy6OALA+TzLqbRCauxbouc3ZDhmDe3fYAGmvGCwqQfPDhY6g2a1oWEWxda1iFdLbyqfBwHwA6zrFEwhC9blxH2gOiRSEGg0sbkD5k8SG+fPAnTuBvht7wAqKA7h0tHHmtqv3ajsWt/KHOrvf372IhgMHAc8YXdZAOyk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <a0889c88-e519-40a8-92ed-69db979abb9b@citrix.com>
Date: Mon, 5 Jan 2026 21:20:06 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH] xen: Drop xenoprofile support
To: Jason Andryuk <jason.andryuk@amd.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260105195717.601500-1-andrew.cooper3@citrix.com>
 <68ebb184-217c-427f-ad4d-381925decf7c@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <68ebb184-217c-427f-ad4d-381925decf7c@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0645.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::16) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|LV8PR03MB7446:EE_
X-MS-Office365-Filtering-Correlation-Id: 11d75fee-b2a8-42a7-b6ec-08de4ca034f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RTFjUHU4NFNoS29mRHlPNUE1QlNnamVuOWJXMmlGZ2ptSnhCUUthdFFWN3hE?=
 =?utf-8?B?Njl4Y2U3WkF3WFh0a3FiQVBKZzY4bHhFMWV4NkRxVUl1WFpJeC9Za25iUlBq?=
 =?utf-8?B?SEptQmwzbFZMcjlKdi9reldGdm9FbDVkdDlJaE1uZW1oK3hzOTRXNWRxUnJ0?=
 =?utf-8?B?bWxQdUM0ZTBuaEc1Si96b3AwN2JsUHUyVjFVTFFWb3FZcDRhMVNlL0NNWkpR?=
 =?utf-8?B?Vy9OK2trc2lvTlNSVXgxdHczQXFoaGdtWmZVWjhwNU1IWkVyTk50L3liemlM?=
 =?utf-8?B?VE5POEtFOUZFSXB2ejgwNitsYzNwcWg3ZENXdmdKd2t0OGNFSGk0K0E2WWMr?=
 =?utf-8?B?clJsa1gxUEROQ21NN25EaU5NVmlQa1hIeXRYbjZmTlBqSDhmRmFVWXl5NjB1?=
 =?utf-8?B?enFnN2hBQTlINitHZ3d6SlU3Z0s5UWhxV2hlY2ZySzJDODBrVXRvdENFTWRV?=
 =?utf-8?B?SGZ6bU1teEFJaFdONG9hclZ2WUxTdUl4d0FGNXNjNjNLT2NLZ3FvcVQxSWdT?=
 =?utf-8?B?emUrZXN5VitOVVVaVEo4Uk0vK2U3SkZrSHNYQzVQanNzN1dGMm1QQUZqQlZh?=
 =?utf-8?B?RUlQOFZReWtaa1JnWnpnY2kyMWdtem5qUTNhSVc5UVNORWlkWXJIZTI0aDBJ?=
 =?utf-8?B?QURmSElsZVZTWU0vOE9GQkx4MXhWM0FINDIvdmZSU3pCUmVabUowcjVmRHk0?=
 =?utf-8?B?YkgzU2s1YlF3YkZKdUFoTFR2SW9uRjZJdDVXaEw1WUcxUjcvdDAwTWt4aGl4?=
 =?utf-8?B?TGphWTdkempRL2NTaElCa3A2QTRHZXJZci9keStSKzJCa2xGbmdISmJWTzdJ?=
 =?utf-8?B?OG1MblBSMHpPNTk3N2NNenltclhkSWo4ejVCYTVnRzRVSjhJR3BRSDdyTWN3?=
 =?utf-8?B?OXJzY2ozTXo0UzhTWFlPdjUxMlNoSlZucmxoekN4ZzZNTkZlaVV1aDI3Rlkx?=
 =?utf-8?B?dVNYNHRTUGtkTDFKQ3FLbUdRWGpOVVNuV1JpU29Zek1nL3hEV3oxNlZUMkZK?=
 =?utf-8?B?S1V1Y1F0SlY3dWs0K1Zhb3lSanZHdUgyV1dma1NZNmdCNzlEZjFxcjAxTFdh?=
 =?utf-8?B?aE5TL1NCeXRHbDBLS2ZUQjdaWmtZaVVkcmxrUnduMVhDWlB5STZIdFpJK2N2?=
 =?utf-8?B?bDZNSzFkbHNoVnp5Uk4yQVlSekRVbHcxT29ReDNDTFY3YUJ2L1FXWlBtQjBx?=
 =?utf-8?B?MnpZVXI2bTJ5cUNGOUFzQURPeGRmOGRkNHdoUHZLRDBES3VMVFlGTUhNQXBv?=
 =?utf-8?B?RVBOdFcrUlM4VVFMcVBRdTdFb3VSQk1DeFJQdmQxZllLdXlxQ2tYVFRpSFRs?=
 =?utf-8?B?SGFSRktBQ1lvRDF4NkhFejRIdng4dVBjMnMyckFhUjcxMkswSWhBTUNxcDN4?=
 =?utf-8?B?cGpSLyt4ZUU4dk92S0c1UFlnRTdibzJUQk5aVXBwRzlseklmdnl1SjhDanUz?=
 =?utf-8?B?STAvOVhoOElQMWgvZnBiM3M2YUZlb0lGTmhWTDBUZFdFUUZMNGRZZ3FFTEV1?=
 =?utf-8?B?djVGSy93aWRMYVkwWmdSSDBRZ1A4dTV0Uk9zTkx2ZGZSVGFaYmRoNDBJQlZz?=
 =?utf-8?B?VWNTU25yWmhMUmVJZ0ZYaVVnTi8vL3dTS08vbkFQNHFjaDhyYS92K3cxbzFV?=
 =?utf-8?B?N3oxM1FLZVlpbC8xeDNvMHlna3p4aGh4czlBUlhTcWFMWFlZbXpscnlDU1U5?=
 =?utf-8?B?M0o4TG83Y2dUdzdBOFJNNlFCYy9EWHlITERhNldLL1FSTVMvVkxmcUZnRnlz?=
 =?utf-8?B?V2thRDM4VnFEdTRNM2hTRCtyWFQwVmVmM2NFYXpwNTJCM3UwbE9EVjRrWEx6?=
 =?utf-8?B?ODBHKzgzT2JDZEp6K1BncFQ2NlpkSkVxNk1ld01SQU1qRkszWWlwTEt2SWNt?=
 =?utf-8?B?aWJva252QmhVeWx6ZVNLanNDWTFWeDlsOU9xSUNOcng1dkxPZWFKYm9zczM4?=
 =?utf-8?Q?ZRsLd/Qu+9QSZ4jvyVTXU3I/qNroG3Xh?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUNmc0orbVVQY2hHTnNBNVFrTXlra2U4Q1o2bUg2SXpPM1lsTXJTc1VYb3Ra?=
 =?utf-8?B?RFhFbVM4VnRZTy91NFFIa21pUS9sL1p1Tis0Q01lV21jenFiRkJCa2p5WjBl?=
 =?utf-8?B?R0N3bmE3TXdJRGV3b2RIMFlKTzc1UmhMUk9BL1V6WkpaNkoxVHFzdnZuRm1R?=
 =?utf-8?B?d3FycW5EWW1UQUMyZ29ZUnhyVy83Y0N5YVhBaGg2eHJRUDZHbzBGaDBpcER3?=
 =?utf-8?B?cUFFVGpzaGc0SlBCTUhpcFlnQWcybUk1TENWM1Z6a2QrQmxTTGVLM2NSd1FF?=
 =?utf-8?B?ZG9SbGVRZUZnWTBsaWpSSGpoTkZoU3JxZ2tqbjBVS2E4aFNVTStpcjJLNEcz?=
 =?utf-8?B?VCs1QnR6YnZUekxMVmpRZ05BMnJ4djVXTUswaDJiSlBFWU1UU3BIUktpc3Bi?=
 =?utf-8?B?YzNLU0VBQTJuMGJaaXJhZWYvNnBNZ0wyclVKSTNWQkd1VE5pMVNVZmlFcmpw?=
 =?utf-8?B?MjdCNnQ2Q0Z1U083Tmo0cHByU1o4R1NyRmhHeTI5WiswZ0RvMmF6ZzQySHE1?=
 =?utf-8?B?Z1RkWHQzLzJwRG12SlF0ZFFvZHJNc1YwQWlmR1haOXFpV2MwckswRnhuWGdS?=
 =?utf-8?B?b1FtdlhsaXlFQ1Bvd1NGejMrOVRkMlpGR1pWRDlWYnpydkhYWHgxZWdlN0FL?=
 =?utf-8?B?UVpKTjZibU4rVlRVMlF4Y0hCd0crRzduQ0YrYWVIRnA0bWlseklsdkdUajlr?=
 =?utf-8?B?UkRTK0F4dU5BMmdma2V2d0JxUXVNTUNoQ3E4RDlDeVBSbS82TmlaNEQzTTRu?=
 =?utf-8?B?Yyt2WGlmbklsak9SdmxlclZqNmNBVGJuUnhHYWlLL1Y3Q1lGTE5lSXlEV05m?=
 =?utf-8?B?RDVIWSs4U29RbDZRRzZNVmhNK0pybFdPQm1BQTcyRjNRVjdJa0pGM1drMUpn?=
 =?utf-8?B?elVKZjJzQ0hpd0xEWXR4Tk5xamd5cW5Zcmp6TGFhaEVSSFZpTHMxckUrL21H?=
 =?utf-8?B?NXdYNms2aHJJRGMzRTczRWFrQmJFbEJtMFM3RWtVM1dtR3Y2M0RZRlJHRXpj?=
 =?utf-8?B?c3ZPMHFhMjBINjl0eEJ2TDl6bXFTdGxzUlVnaTNQcFBzeElLZ3ZhT0xtckY1?=
 =?utf-8?B?Y1RVVmVoUE5TVFZWYUFneEZjY1hxK2pIc2hkTlBlQkRNVm8vbGhaeGhiT05n?=
 =?utf-8?B?UUdkdkdqN2YzQ1Fxejd2dmk0L3dVRHVhaXFGOXRLb21JMjQra1BOMlRRMC9U?=
 =?utf-8?B?WWZUMkdHMURKN1c2ZzRpL0grRXFwaFR0R2hDbVZxUWFqVHJPcmVraEZUOHdR?=
 =?utf-8?B?ckpQaVJ4cnRUYjFRSm1EeU95M3VHemE1ckhiajJreklhZnMvWGJ3a0tJZmoz?=
 =?utf-8?B?OXBtbHdsSGFpWlhJdkxzN2dNWmltb3RBejBiVy8waXZ0bEI4N28weFVveWZq?=
 =?utf-8?B?ekNyMWY1MEpyZUpiVGVza2RLYVpyYkVrVnAwUi9Na1hCaUs3eVN0a2x3VzhT?=
 =?utf-8?B?S2JQTkxZMlFQSitYZXFLMXNvZWdWZnd3akYrT0xTeFJVMklsT3VuaTVWMUtx?=
 =?utf-8?B?M1d1L0Q3SzZwNWhRbVdpUHV1cEFYMDEzNGNXUldTY01SaTI4dE9uVmVlSTQw?=
 =?utf-8?B?UnA0bURkM1RnN0VhQkpSeU04TkttUGdvWmxiOVdacDJwanYwRkdUcjJpZmNU?=
 =?utf-8?B?NE0vczR0SjFpUGVMUjhDQWdmbDNpWFZaNkNyRForR29oQmRFb1FwOXIzd29k?=
 =?utf-8?B?U1FFZ3lweDQ4d2lOV2lESkpjNGhVUU56cGsxRHo2T1VwLysxMlRGcDVYd09G?=
 =?utf-8?B?bmJOcXN5YWVacXNLMWVxZy94WTNuK3FwMFhBclk5RnFVbWtpZE4wK1pHUDM1?=
 =?utf-8?B?cC9aenRmbEVqdEsvMXhoajVDL2ZVRXQzN1ZEY2g5TDl3ZitGc2hPK0MvdWpT?=
 =?utf-8?B?MS9HUzhjS2k0bGU5SDN4UDNtNEErM2xKaE95N3YzMU5SNDVLdkVXQ2VOeFE0?=
 =?utf-8?B?ckFUcDVONFhkbzREQVdNaWpRRVNTWXExTHhXbDJ4SkR3SGlKZkFseXM0bHlk?=
 =?utf-8?B?OFRHOGc4YXBQQVpnbVJ4VFhham54QnptVzZOd1JLamNwWWdSRWRTajZNbXFP?=
 =?utf-8?B?TlZrRHVtWWNKaVNzNmo1a3hsRGordzdYTVltT3gxZlNsMEVmSjVhVkRseGFP?=
 =?utf-8?B?S3dWRm5OTkhRZTF6SlZTMU91M1hHTkFYT1BVRDIvd3NyUzhDcnNJaEkzdVlx?=
 =?utf-8?B?NnhqRUlFOXgwTUFWeTdiSkU3eUkrR0FCdlhBVGo3YU5SdEM5QndzbUdZby82?=
 =?utf-8?B?VlI3OTJvNXJlNHhVWEhJZENmZU9VK3pHSWswWGtSNnNGUmMxeGNqeGtOSlgv?=
 =?utf-8?B?c1Y2MWx6clMraUswZnVzbEFZYkNCckFMRlc2RytNZFMzTTA4bUdtZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11d75fee-b2a8-42a7-b6ec-08de4ca034f3
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 21:20:10.0805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RinlCZRiBFSr8SYP45io0K/jErbx7xjEyla6SHsdOZ3KpelTCPdqZIbY9vVOB6MoP2u/IUmBelr36Rw7rZxFuH40fK2P5Ni7r3R3uBDZWzI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR03MB7446

On 05/01/2026 9:17 pm, Jason Andryuk wrote:
> On 2026-01-05 14:57, Andrew Cooper wrote:
>> The most recent xenoprof change was 300ef0cb4fde ("x86: Add Xenoprofile
>> support for AMD Family16h") in 2013, despite there being 42 changes
>> worth of
>> other cleanup/rearranging since then.
>>
>> Oprofile themselves dropped Xen support in commit 0c142c3a096d ("Remove
>> opcontrol and the GUI and processor models dependent on it") in 2014,
>> as part
>> of releasing version 1.0 and switching over to using operf based on
>> the Linux
>> perf_event subsystem.  Linux's version of this patch was merged in
>> commit
>> 24880bef417f ("Merge tag 'oprofile-removal-5.12'") in 2021.
>>
>> Drop xenoprof and all supporting infrastructure, including the
>> hypercall, the
>> XSM hook and flask vectors which lose their only caller, and even
>> shrinks
>> struct domain by one pointer which wasn't properly excluded in
>> !CONFIG_XENOPROF builds.
>>
>> Retain the public xenoprof.h header as it is ABI, but note that the
>> functionality is removed.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks.

>
> VPMU_PASSIVE_DOMAIN_ALLOCATED could be dropped as well - maybe in a
> follow up to re-number the remaining VPMU_ flags?

Oh - so it can.  I'll fold in the deletion, but I'll leave the
renumbering for later.

~Andrew

