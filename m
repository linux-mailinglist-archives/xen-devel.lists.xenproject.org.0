Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D95FC1FEFA
	for <lists+xen-devel@lfdr.de>; Thu, 30 Oct 2025 13:07:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1153562.1483864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vERQx-00065R-7s; Thu, 30 Oct 2025 12:07:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1153562.1483864; Thu, 30 Oct 2025 12:07:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vERQx-00063C-4t; Thu, 30 Oct 2025 12:07:15 +0000
Received: by outflank-mailman (input) for mailman id 1153562;
 Thu, 30 Oct 2025 12:07:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5IGd=5H=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vERQv-000636-Vo
 for xen-devel@lists.xenproject.org; Thu, 30 Oct 2025 12:07:14 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f5670657-b588-11f0-980a-7dc792cee155;
 Thu, 30 Oct 2025 13:07:08 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by AS8PR03MB7522.eurprd03.prod.outlook.com (2603:10a6:20b:345::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 12:07:05 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 12:07:05 +0000
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
X-Inumbo-ID: f5670657-b588-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MwuOBgCmrnrrtZRssw8xX5Yt9+R0OfUBxej7B5cr0Nrt9Ln9QQLET4XgN9G1ne4ELVLzTHH6KURAxGvI+XwhptTJ7JYCzUtSEr8JagRzRApVBOHzgBRgr/cPwc6yb7yLs8rVytq+1LDlsYy7v6eLxwvXxdiK6qrI753g1kO0kMpsxF+G6J1V4KAISZTI+7hT1JEgtVORjjw8MU0UUgs2bWxJYuI+KKMjh+AdQG8kudf2J2wcwJCKa1fNFBm9dqGC0fePVooVgNqHZZnLIPx5QK8FhlAXG1pzu4aiK+WlgSGL84z1ab2awF61yVf39w5VuSKdGEIK31eX8Ro4nuIFhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c4ZKgOXvu5t1egfSJku8xBaz7rejEbIdq0JMJZuYgT8=;
 b=fk2Bo7IBuGH8119Xvgt/s2mgz+GeMFFsEJhx2P+wZ0aAjaYiJyfrwKvUIP4ES5tfO5qisRS3U0ID7R9bJSD7QW7LytJMV8nRCEGbDGGpBGt3SFblsCPH+oCUgKOlzfslq02f8MScK6mThL0m15DeisTA90d09OO0z3XrAGaXqOhH/XlN3nLXSxYLwW/ALMxyGXFrCt7SZLAOqha5mBK6s0btlYqGsiYpxkodmqKZ9O6RUhVspyVfav6hYLgll/J49hD/eJMI5gQM/5WbyM65Vg1BfsZng0jFMxKIqMd1FdAy3eSI0LRwQVVIulIh7hY9ZFd5RFE5hkcARyB4Clr7UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c4ZKgOXvu5t1egfSJku8xBaz7rejEbIdq0JMJZuYgT8=;
 b=Adaxb4UO0p7tOOnjO/7lHtPi4KC2cvnXP3XghHQC9rV2aMah+XQ8QxQfa4CFLSs2ehQpNt0Y+JwJEoJLGTyLqS78GeJWU3ooT1/+PSNKgsR+LJ3YZQjvZ7QOJTbA+pfzACUBlX+OMAZhNinWtr3r7XgyRHli3Wl8PwhhSywGmc2+4QIARbSmh8nSTRmpRsgDCchbnbJMCMAfAK99ddRFoO72WG261uKZiirLKrogzmdt4PT24T7KPqjJ4L8BDBh4AnRDh7iguMW2s86Atkzl1cabX6kuRB2iuhGsAQyLXwgigvMQqbidAOpXO2l6rp3rSq0U+uCcRwjRdv0mIKH4xQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <483bb615-addf-4038-995d-9babb79ba85c@epam.com>
Date: Thu, 30 Oct 2025 14:07:04 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH 2/3] x86/hvm: vmx: account for SHADOW_PAGING when use
 hvm_shadow_handle_cd()
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251029235448.602380-1-grygorii_strashko@epam.com>
 <20251029235448.602380-3-grygorii_strashko@epam.com>
 <32fd9825-45b7-470c-ad0e-f1941faa4d52@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <32fd9825-45b7-470c-ad0e-f1941faa4d52@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0426.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:83::11) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|AS8PR03MB7522:EE_
X-MS-Office365-Filtering-Correlation-Id: c794ef0d-77f2-4053-d481-08de17acd7b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WFNObE9sZnVBRWdMejV6bzBvbzloSmtuMTUyS3VHcWoxYlUwVWx1Vk04aGFF?=
 =?utf-8?B?Qm5RYXVtbHl3N2h1N3VJMGlKMVlrL2prb2orUGw3a040QTExQTVET2RmQWI5?=
 =?utf-8?B?T1RXTlBZWWNNS0xHRVNHZFVTV3pVK2FucENPUkxFUkVxdkdwN0ZCdk8wUEdY?=
 =?utf-8?B?RUVLZVhNZ2J5aTN0RGJEaTdRNW9sWkRPcXByVVh5b1VWYS9lSjAwWEVwUlBZ?=
 =?utf-8?B?V1A5ZEhXT2xFbXVKajYyWWtwdjhFZ1FOWWxpZXphS0xwZURETTA1b1UwQnli?=
 =?utf-8?B?T3hOL0cxVWRncHcrS1pvbklHVEFvS3lqTXlUaEgzblNFMWorMXVZL21PNTA2?=
 =?utf-8?B?aHAvL1h2aUJHRWtnejlWTjJjeUhOM2FwMTVZRnI2T2RDMkNnZzVKbWFUWTgy?=
 =?utf-8?B?VWRieU5nRFluNGc0OHNyL1NuMUJ4NTYxVmF1WW1jL0FMOVdRakswQzBXZUZ6?=
 =?utf-8?B?Vi93N2xKUHNmZUlJOGJscG1FUUtlMGVaOGcxaUIyblVwdlFoMmVreXM0NEZB?=
 =?utf-8?B?dzJ2TTNpcFVlbU1EMXpGTldFaG5GckhjZTR0QUZEMm5TVHc3ekptVDNFVW9R?=
 =?utf-8?B?S21xK3ZQbk13SXI3ZnN6d01BV0JWU3hJdUFOK3c3eVo2d2hWV0FmY2IvbHZ6?=
 =?utf-8?B?dEZyQmZIU1o1VjRRTzd5VUdTaVBma09MSHAzQUYxYk5ZN2h0RXRmWDIzcjAy?=
 =?utf-8?B?RHM2b2UrTjB4ZDNWL2hTckswK2IyeXhIN2h2RDZjR284bkc3ZVFFL3FSNzd4?=
 =?utf-8?B?eUJkbHRScHhkeFd0dUtsM3pxUTcyWCtnTndVTlc2Q1ZYR3plZE5nUnFWODFP?=
 =?utf-8?B?RlgwSXhiRGVYT1JYS2I4aFFJTG14MFQvbGNUemQxWHZ4elVnMkhqSW5SMldV?=
 =?utf-8?B?aGY0aGhXYVM1SEFrNXRrS2RxSXJUUFBFNWVhTDBFeGkySHZ2T2wyL2RMOXVC?=
 =?utf-8?B?bE9jY1YvS2QzOFZGcURrQ2NuOVNFNzU3QmVKRnVWU1FwMzNieHVzRGp1dFY1?=
 =?utf-8?B?Y1c3OVpwY0czNXB2M2xHamsraW80bXlESkJMV2tWTDBSc2g0dDB5RWFyWFl5?=
 =?utf-8?B?Nk0yOGEvMUsrWGVxOXNDL3MrajE4Qm5GQ2YwL3JCVTlDOFZJUTE3Q3ppTEpv?=
 =?utf-8?B?Y0FqbnFyUGEyckFLaDU1N3doWVhsbi9Bc2hqRlVyK2tUVjZxa01WaXBIZzQx?=
 =?utf-8?B?akNJQjFTeUVmeEJ1ZXIxTys0c2tMNjFYbXNSSitucVo5NmxUQzkvU0hKaGcv?=
 =?utf-8?B?TkZNdFlDTjlTS3YwM3FnRTBUcWVaa0h1WTRWdUJVK1hKdkJlRTlNNitwd0ps?=
 =?utf-8?B?eDRQQlRFQ3lmak13T0NmSlBpZnVnMXZodFJJTDZ6cE45K1VBR3BHb1FRMWhm?=
 =?utf-8?B?Rlp1Yis2SkJlckV0OTRvdXhqeGFsWGRBTktkdDY3V0g2WnJFbnI5YyttbXR0?=
 =?utf-8?B?SE9nNWtFbStOWGZWSnhoZEg2cEYwQ2JuZGJhN0wxalkvMWVYTVNkbzcrODZr?=
 =?utf-8?B?TWdjblR2QUhLeVd4TXFOQlhlZ0UyeDNBcFE2Si9xRkhqdkFEbEl5d01nQjdi?=
 =?utf-8?B?cC94d01sY0VOQ3JqL2V4QUpvSnZwUGxXbmlCcUdENSs5eUtuVFdncklvUkVD?=
 =?utf-8?B?V2NiUVJDdEJwU3lrRGxVSUIvQzA4akFudHhZNXBjdU51a2VndTM4OFAyZkFU?=
 =?utf-8?B?ODlHa21uRmFEd0x4VklDeFZiUW5vNnA1ZEoyRDlQOW5hZDRDWUlSZ3FCbkpp?=
 =?utf-8?B?Z3EvTWdBdmRYUm9XMWxhMGVKU3lrekNjWVdla3FxbElDWHllRGlPSHZaVzhI?=
 =?utf-8?B?NDM2TnhmOVJqMnBWSXJsK1hJNkl1UXRDRnVkQy9mUUdyejBNaVR0RWd2RHBY?=
 =?utf-8?B?WkxZY1k2ZDI3czVqL1JjQ29GZENoMXZ5bzBKMU5QK0pZS1g3UFAvcHh5TXhS?=
 =?utf-8?Q?BPolxexKRG/8ria4s1Exgaf4cprXHa21?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z05wUkFoVFg3VTYrQ3lPZDFOUnpJMmFDQWdmZEtWVURJR0NHNnU3eVRXM2J5?=
 =?utf-8?B?RElPWXBBM3ZncGYyQ0YvU1BYV1JCT0FXQjFlcER0VEpqV09EdXNndFR3TnE2?=
 =?utf-8?B?SExIYU9CRDljN0F5am9mNkdrMVo0cWdUcy91KzlIWFUxd1FCUGdIamRpNUJq?=
 =?utf-8?B?V1FLekpvUlFNRlo5TFZReFh6N0xIUEI1c3NNanM3bUl3ejFORjhiZU80VjVr?=
 =?utf-8?B?WTFmMzRUUTAxeFM5amhTVllOdDU4WldVRmJlZ3VBVVYrdkxuc1pETkw0dC9p?=
 =?utf-8?B?Si9USTQzaUZZTU8xSW1CV0hoeWxUcGdCTEgrNjlaeG5uQlpldHFMVXpNTjdo?=
 =?utf-8?B?a3IxNUlKS0VmNjZpbHU1RXZpMDU4VmlzcnVyZE9DZG53YTJDM3MyNGhuWXZB?=
 =?utf-8?B?OUJ2eURycmMyY3hVbXljRVRtTlJuV2Z4elVBa1lqRHdZa2tmNG1XU0ZZQTNB?=
 =?utf-8?B?TzcyKzhYOWlXc3hvZTRPZTcvNlNrNlgwZnF5elVjWkJHaHAwSnFZZkIrTWZU?=
 =?utf-8?B?bWpLSGh6S3h6eklOTEFIbXBHbWw3d1lSRXBVWVgyblpzN2g3OGtOa1RGUnZR?=
 =?utf-8?B?eSt5NDBqanZXa0IwQlNOOFRJb3JRL0duZEJ0eU02ZDNEMU9NMHkyR1pJYVRn?=
 =?utf-8?B?YUZIN2cybXNINzlzallRSWZhNXc0REY1ZERRazNiZWI0elFvMHB3ZEZ2V3FF?=
 =?utf-8?B?WWVOUGpKZ21FQnpUa0RvRFRMbWhNREJUd2pJMm41SXlsZyt6WW5maGJsNVA1?=
 =?utf-8?B?bVlJNU9oRHd6SndPd1pQZ3owTGtRWHZVWk8zalhBUllmd0grZytWVlJNaXhj?=
 =?utf-8?B?SjJNU1pHc3JTMkFNd041RXYwSS94L0hrMWNCWGh6dUlRNnJ0bEs4blN5QmQ2?=
 =?utf-8?B?dkV4dTlNSDRUQ1AyVldaU3p1bGFpQkN6OUhUNTM4MVBrNjdnUzUwanJJa0JJ?=
 =?utf-8?B?L08xVUVaRmFuUlNDaUxtZnVuUkZHZHMwaEZONFBTUzAySFd5c3oyV2JIVytV?=
 =?utf-8?B?NTkwV3k2OE9uNmE0Y2YwWXo0bEpBVG1LQytHQThoUzFFL2YwWEhNb0dnOXVG?=
 =?utf-8?B?Qk94dExsUFdaTnlNSzFZUHVwakljNWJYcTY5QUxJOWJzd3BhdWxRcHFWSnBS?=
 =?utf-8?B?b28xMWFTNjM0ZUxNamFxTmFCUEFpdXd5U1Q4UitIS3hEQkFXQldIL3lvemJv?=
 =?utf-8?B?YnNWYkhFcGVibjVUaDBLMVFXcTNhdGZjTDVUdHZ2QVR5cHd1NUhRSngyZmEx?=
 =?utf-8?B?bmFxWVRWeGFhSHFjQm9JMzVOQVFqL2t6RUZiSllOeU5UR2FJWEFHSUJ6WVNG?=
 =?utf-8?B?NWRMb3lVNEJhNGZNQmtvSVkraDNRaGVab000WXFLRkp6cG9RbmxvNG5kT3Yz?=
 =?utf-8?B?R0RpQUhJR3RkQW5QSm4wRlpCa0NaV0VBVDZhaGFISkpXbFJZenhWNmJUZ3Fl?=
 =?utf-8?B?ZXIzWUp0RHBMY3ZuQk9UY1ZybHRiaWJha2RRZk8yL0RsbUVZVHZrTlFXbzRE?=
 =?utf-8?B?cXdRUDhkQzZxY3VGb1RuRW9tRzVIMkVYQVhZaG14VkRHVUdIRTVRY1NOeWcz?=
 =?utf-8?B?aUdHcWgwdE5mektrY2hQMzA1NjRTUzd1ak9IQmVDSEh4TEFMMVRYWHdPM0xB?=
 =?utf-8?B?OHNkeElOOC9EZUxaVld3Z0l0SktXUFBTR1hkQUQ1RmJBT1lTVWVQVGJlSXNP?=
 =?utf-8?B?YUpmd2RySDFCTFlsUXRVSmMxbWxyN3pMUEQwbHhJYW5Ca3VDN1JseEZ5Zi9k?=
 =?utf-8?B?cnIrWkppODNlOU0vb2QrUDBZVEdBaDkra2hUbE1TTkdxeWx4VzJGRk92VVpI?=
 =?utf-8?B?VVhxRWZYSjEzLzhFTjlKTjVRaG9WcWhYWjU1NmdUNnNTZ1ZFZ2gwOWVZODY4?=
 =?utf-8?B?WENSa2FVUXllbHB6VG93dTJtanNZblZ0MWZ3TXMvdU1hdGU0d2dmdFVWNVhp?=
 =?utf-8?B?QlBkQkVCVHpWMFRpZjNOUXQweDExYkVEdTcvVm41SnNXSXVsQVVNWEgxRkMz?=
 =?utf-8?B?NDV0NjZERDZQNUVrd1NnU2FKOCtwMFBxcjNLMmE5VXRaajVIV3YyNHh0VWkv?=
 =?utf-8?B?VmlZbGF6dFo0b3gxRUxMaVZFM2FlZlNiYmNCZkxoRDFqdy9DSUVUZmVsbjVM?=
 =?utf-8?B?eFMxQzRJMm5YRyt6OHd0aVIwYkdrWitjTXhodTZyeXh0bTJXamtIZXkrSHFN?=
 =?utf-8?B?elE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c794ef0d-77f2-4053-d481-08de17acd7b4
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 12:07:05.5568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Ii7GqlXJSGBg3wHsoNFIkfQOH61Z+1L2Xq6dwer7SzUFiLKMmzaymKEcMAhEI1wyiSLitS9u/RL+aN9EBKsEdOYfyeW713rWoM+wePZvQc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7522



On 30.10.25 13:12, Jan Beulich wrote:
> On 30.10.2025 00:54, Grygorii Strashko wrote:
>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>
>> The hvm_shadow_handle_cd() can be used only with SHADOW_PAGING=y,
>> so guard hvm_shadow_handle_cd() call with IS_ENABLED(CONFIG_SHADOW_PAGING).
>>
>> bloat-o-meter
>>   add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-290 (-290)
>>
>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> Requested-by: <me> (or some other of the available tags)?

Will do. or Suggested-by:?

> 
>> --- a/xen/arch/x86/hvm/vmx/vmx.c
>> +++ b/xen/arch/x86/hvm/vmx/vmx.c
>> @@ -1506,7 +1506,7 @@ static int cf_check vmx_get_guest_pat(struct vcpu *v, u64 *gpat)
>>   
>>   static void cf_check vmx_handle_cd(struct vcpu *v, unsigned long value)
>>   {
>> -    if ( !paging_mode_hap(v->domain) )
>> +    if ( IS_ENABLED(CONFIG_SHADOW_PAGING) && !paging_mode_hap(v->domain) )
> 
> I don't think there's a need for IS_ENABLED() here - you can simply switch to
> using paging_mode_shadow(). That would be more correct anyway, for the abstract
> case of there being a 3rd paging mode. 

Will do. I've seen it, but was not sure :(

>With the adjustment:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>


-- 
Best regards,
-grygorii


