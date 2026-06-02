Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +W3WL1QvH2roiQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 21:30:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9F4631693
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 21:30:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=Xd9nBGAN;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1325402.1590890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUUoZ-0005mx-4D; Tue, 02 Jun 2026 19:30:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325402.1590890; Tue, 02 Jun 2026 19:30:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUUoZ-0005ka-0h; Tue, 02 Jun 2026 19:30:15 +0000
Received: by outflank-mailman (input) for mailman id 1325402;
 Tue, 02 Jun 2026 19:30:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wUUoX-0005kS-9A
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 19:30:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUUoW-000kcC-MF
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 21:30:12 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a1f2f24-bab6-0a2a0a5309dd-0a2a450cb7d0-42
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 21:30:12 +0200
Received: from [40.107.209.10]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a1f2f42-62f1-0a2a450c0019-286bd10a4659-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 21:30:12 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by IA1PR03MB8264.namprd03.prod.outlook.com (2603:10b6:208:59f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 19:30:08 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 19:30:08 +0000
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MZOfLjR8WSjnuYGNu0i8Ve80BJeKOgR8C/A56woRauDXV8OxTshVMaCo/J3WrDrWzu/PYwwKC2SUFgNuYsDgeIGem78ogfqDUTMG1h2Jb4tou/Q6+HraOAWYOjyTqvBK+7wzWP+0E+M/lpujLLbDKCZngBw8vXtGIj8C1ipGUdWkBicsFECEqXt32mGc1jqVqmgCz+mHtwIDVeYriDMguyinj7sCo2aYwtfns1EngLzz4eG/uG6PqMtkqAfip93SAaoCMHkHzPgW36MC6xCzjGufmlEx6+93v8Q92mgd2E37cXeBg0MYuYaRFvPjSZEjwsffUjEl9otDKCI3HR562Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kUbXGS6PBpQdD8oKjFxiOFjw0sYoiIcw6PRKJ8MP9GA=;
 b=JZwgFH4uXR7J6xSVSTBhSkW0A0nX2eQ562BjD35AhslB2s/V/5xEXDPbI5lL+yvalJuLMITXNMaMTVIJzUutm3IRaCgagVJEeRFWj+2xYOigzYzqE5QqSqziP8TpjtglGXZbB3WUjiP7PH8L6UR/e5Z0xvOc9VH8tqUNRwxQi9z7WoEqHUJXVrzl6FpSEcpkWz75jVQd0rc2hvXPPbRjHZZWqAXNnyvoHUksOXMrX2a2d6Zk9dAKg/0hxATd+CtcgdluSOAXLoZ30hOFG2ufBb2IeAZUCEbbLi/L+bhDLCJIe1dZHOdU5/Qkkt8UBxOedo/gJ7WQIRazQMX+bZwczA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kUbXGS6PBpQdD8oKjFxiOFjw0sYoiIcw6PRKJ8MP9GA=;
 b=Xd9nBGANbUQbm4tn+f6EClFJLGbZivZ1/akJMGYSW9VUN/Y7VcaIuJ8WGnqkErB3b1x0WULXUD6ixg3H2uVW1Y/A4D8bL5iSwKAdO/CF7Td6OeFWLv+p0kRFv+Yg6RqPkaW0zTDAvfv//hL9yU2TOf8y5hKpB4WPBv2VEDs4NA4=
Message-ID: <2ee5550c-6e0c-43bd-b8e6-40dfc3ca18bd@citrix.com>
Date: Tue, 2 Jun 2026 20:30:05 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH for-4.22] x86/fred: Enable FRED by default on AMD systems
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260602164519.2634144-1-andrew.cooper3@citrix.com>
 <17af7606-c388-4d82-b219-cd45d2c19827@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <17af7606-c388-4d82-b219-cd45d2c19827@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0489.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::14) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|IA1PR03MB8264:EE_
X-MS-Office365-Filtering-Correlation-Id: 75dbaf46-4ac8-428c-084a-08dec0dd5b52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|56012099006|4143699003|5023799004|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	7w9doAoc+GQUZGnwwimBI0jR3ytFxtM90okWWbfcO1CT8hyw0kWeeb68zhl0CStiKqcqgRkWQ7W7pQl0gKISqLByPqKFRJFJnU88wyYlcmFtQC4d5/r3FbpMybiPuoyukXtYLDlksjYOAenWoDYxG85td6DaaTuNgNhEmCJE3T09jZSrAqit2AE/AbtU5RlvLnnHghrXaXSO7/5a0K6QZjl5NNUUBvYFOcdGvCZpIgMKC4YbEb2IRTPxCRdHVuLLjlBo12HdNvKgbvz7iAS2tzSJnsphoywZj+tOUApzRyaBoEAVGQ5JMxrUywoqCAfCPMyqrGFhTOh5PQ+AMKTbcdglqywM5nLCoSO+8q2S9Mf9VDgJ9q5t7O6wqC+i82wGB6nzRPQQg/UMs7ifAyNtuAnIdoxbbbtir7dfTXd5WG+25Y0O/KKikbgxCQggrMseCjyfHaX6av5lbzJC2fXEhK8+aPFieWfYqbOzQ5Yr/r0I2GCQioo9Ioa6sIF0Hg314fy0e5GKroPJEpEMfcsRnvuiM2DXA/ha02RZmvaGaL1fen45mxNwi7HC4ASJfxy4DNbfHnIcDru50stiO7Si6NPFxIva3tGPMVR9B40HpXtSmxofm4/Zt4dCyB0Djutyj1f0tQgjxhvyBydF/G/a+hZh8mwdVo4jFSYEwXoyLBDfz/BAb2UD2e44G9Py7zaf
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099006)(4143699003)(5023799004)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cWloUjh0aldVK3lnbzQ0THNKOGIwS3M3UTRvUWpWc1kxTUtoYnNKY1B4Mk5G?=
 =?utf-8?B?VEd6elgzejZRb3hMSkFuTllCRFJva2VRZGVzaHh4THZhazhuTmxhdmY5eXRE?=
 =?utf-8?B?VjFyQTB3RktOaVBjeDNrMW81SVV6TVVUM0cxQjljQzUwNmlIMTg5cVE5MnJN?=
 =?utf-8?B?U28vTVEwTXN6dFRmckdzSXZnMVBUYkM4b3g4aXliUW54ZS9waVN5dzkxTkJr?=
 =?utf-8?B?dnNVREtMUGg5aFpKbklDTzF3TG83RzNoSEh3VmJLdnV6dkoxVG43VmtoaUY1?=
 =?utf-8?B?UERZMURrRGdhUkdtRk5FdFIwTzVhRklaQWgzTFFBdEQyOFNyWXNwTnhWZkZl?=
 =?utf-8?B?U0dmblNqQjY2QkVINXhqR2pvaURsdDFtSlgra1BYaENQWksvUEFlT1hRbERS?=
 =?utf-8?B?b1J5dDVRaWs0VFpVcGFDTjF2bVlaS3NpWHVvajNOV1prWENWYXl5QjR3OTJB?=
 =?utf-8?B?ZTRZM3pEQ0lVNHJjYzZUSE1NZDlYKzUyYzZST1gxRnFNTFFhOExobjdxZ1hL?=
 =?utf-8?B?NUF1MHFzNGJPVGhCcGo0Z0V0S3ZrTmN5eXdDM1dITlNzaVdMSVNRN3o1Zm9Q?=
 =?utf-8?B?L1Vra29mcGdlOWc0MDB3RGZLV1g2MnJENTI3UHg2OERzR1RRTWloNlZXS3VF?=
 =?utf-8?B?bGVDV0ZkVVliWTlucjN1WGp5OWg2N1J6ZW5UTHNyaVZsYWlwRTc1ZDdJR081?=
 =?utf-8?B?blFYMTVuSUcwNUM4K2d2Wm83QmNZYXcra052ZHhiOG1TUHFLYVg0NGlsT3NZ?=
 =?utf-8?B?WTdRUXErNld2LzlHNXl6WmtLOTVBUGFadlZUM0ZuekRtNC9rNEd5cVYwZFdo?=
 =?utf-8?B?SW83VU5VUHE2MlRoTkUrOFhDRUZZcWFvUlVSZWEwYUdRR2tsMk9GVDBYb0dl?=
 =?utf-8?B?RzdoTDcxWkQ3cnN5dEI0QTl0em1pQ041Yi9RclJxUjQ3OVNyeGRGbmM2RU9K?=
 =?utf-8?B?bklVZEl6Mm9ndzNpR2hyZWg2YUJBN1BBaEF0UkZZWWRHTG9hNEdycFdQc25Y?=
 =?utf-8?B?N2pjRlhVeGdZK0o0aG94b1c1KzZVK2twcjA5YSsxektXK0w4RHNJVVlFMTRs?=
 =?utf-8?B?dWViTnIyV0VYTjA0a1RXY0g1UTJwZ3hidmRyM2NrUjVLVjZuakhBNEUvWVNH?=
 =?utf-8?B?VVg2RTVPNU5ieGFvRkZHSGxXRW5BL3U3R0l2Y3RacEJDUkM4elBBMG1NKzJt?=
 =?utf-8?B?VDVoUTNtd0FmSTF4UnlVTndBVU9hYXk0NHcwRmozTGYrZUNKOXkxWXovZG1r?=
 =?utf-8?B?d1UxNjZIVEFsM0tFRDh5U2FPTEorRCtGS2hscy9pQmNUU3duazlNU0grNGY5?=
 =?utf-8?B?KzFtTENZcTVlMitKYW5uQnZzQXJWT2RzZ1MrMTgwbTVhbFBPMkI1TVI2U2o0?=
 =?utf-8?B?bndDY0RBdklBamhJaVRVcGg5TTI1YUN0UENUMFhLbTZ1S2F4SUZvZ0thRklW?=
 =?utf-8?B?b0FPRmFIK3psZHh3NlFQVE9SZ01mRlZJYWJoaGE1dTIxZ29rckhlZ1lKV2Q2?=
 =?utf-8?B?ckxBZThxMHpQdjZPcysvV25JcXJKZ2d6bjl2eVVvaDI1TUtBaHBvMmYyWWln?=
 =?utf-8?B?NmZtMnUwRUJLZ29taUh1Tkt2NU5WdXpEQ3dzdGpYdUI1SjNoV0F6b3JpUkYw?=
 =?utf-8?B?UnhpZ1VPMWs0N3hzV3FkWmFvQkMzR0U2eU9aak9NLytKV3VQT3RGdHJMYzBY?=
 =?utf-8?B?QnVhTW9vcHhzYXNBMU44a0ZMSnFrVytlRkU5YkRXV0tzcnQrUjhPaGF3YXhS?=
 =?utf-8?B?RmExR2lVU2EvMm9YbUdqWTFmZDh6WHNQSVJjdllTb3ArY1dCb2tEc3NJeHc0?=
 =?utf-8?B?TnJrRS9NRVE1YWx0d3NuUzdGSkFIOVBaY1Y0S0lGNnE1NE9yTm5uRHBoNEts?=
 =?utf-8?B?bXVVNnV0WWhxUVFINWQ3ZEFoUVFPR0RUT3BzUDlXczMvNGdyK2xpZGpCeCtI?=
 =?utf-8?B?VHBWR0czR3ljM0RYcnhVQ3hXRllhWWFYeUh3T3VYQ2Qvenk3VTR1R0lUQUxK?=
 =?utf-8?B?R2pJdkxzdGhVdTF3dm5NZmRNbHVkeFdiOGNCUm5IWFd0Uk9zOVlkcG1qVTBy?=
 =?utf-8?B?SjN1NjdMVjJGam41b0VYeDNiT2tBMHY1ZENZUjc4aE9OMnJUTUhjaS92ZHBt?=
 =?utf-8?B?MUtocXdnSVh2RkFQbDdJcnRlTE1MVWNNMUpLV0d2V0pIa21kZkN0VHFBYWlG?=
 =?utf-8?B?M3JzaHVzUlRTVXNBa2VTUnIzUlBkSVkxUVBjbnZLYlRrWXpENXA0TmFFL0hU?=
 =?utf-8?B?VmJDTzR2dGdmUjZSVWVxb2hCQlp2ZjJyS3M4UG5zWFRmNUJ1SFpIRmY0K2lt?=
 =?utf-8?B?Mmo4MjNVcURtT3ljQmJjbjdKbWVWNUM2bUhiSTJBYmg1OCtmNTZCTzVUQVRu?=
 =?utf-8?Q?yhUZGUpmho5jo0wQ=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75dbaf46-4ac8-428c-084a-08dec0dd5b52
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 19:30:08.6402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9AfXaEe+rubAEjhE8opv38XbfI4ST+X5w8s/JuVE81dEgljxGqqmHoddTPJveXWYVK3f7sisFjDMvDsXBOCdjq/hY7uTtOXqU0WGu2vqu3s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR03MB8264
X-purgate-ID: tlsNG-d25034/1780428612-E0B64CF5-F9B5495D/10/73395122804
X-purgate-type: spam
X-purgate-size: 1311
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:email,changelog.md:url,vates.tech:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2A9F4631693

On 02/06/2026 8:21 pm, Oleksii Kurochko wrote:
>
>
> On 6/2/26 6:45 PM, Andrew Cooper wrote:
>> FRED is now believed to be complete for AMD systems, and has had its
>> tyres
>> kicked by both XenServer and AMD.  Enable FRED by default on capable AMD
>> systems (Zen6 and later).
>>
>> Support on Intel is still not yet complete.  Leave it as tech preview
>> and not
>> security supported.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <jbeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Teddy Astie <teddy.astie@vates.tech>
>> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>
> Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com> 
>

Thanks.

>>
>> The issue on Intel is to do with virtualisation of MSR_SPEC_CTRL for PV
>> guests, and is waiting on the resolution of a question I've asked Intel.
>> ---
>>   docs/misc/xen-command-line.pandoc | 6 +++---
>>   xen/arch/x86/traps-setup.c        | 4 ++--
>>   2 files changed, 5 insertions(+), 5 deletions(-)
>>
>
> Don't we want than add that to CHANGELOG.md that FRED is now enabled
> by default?

I was going to wait until we had sorted Intel before doing that.  But
there's no chance of that happening for 4.22 now.

~Andrew

