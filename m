Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gjHZJeCeJmraZwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 12:52:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A71655560
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 12:52:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=fH1ln9U9;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1331579.1594144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWXaR-0006YI-EF; Mon, 08 Jun 2026 10:52:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1331579.1594144; Mon, 08 Jun 2026 10:52:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWXaR-0006WA-Bb; Mon, 08 Jun 2026 10:52:07 +0000
Received: by outflank-mailman (input) for mailman id 1331579;
 Mon, 08 Jun 2026 10:52:05 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wWXaP-0006Vu-EB
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 10:52:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWXaO-007XLC-R2
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 12:52:04 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a269ec9-5cb7-0a2a0a5109dd-0a2a45059a0a-32
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 12:52:04 +0200
Received: from [52.101.48.40]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a269ed2-aaa8-0a2a45050019-3465302875d7-3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 12:52:04 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS7PR03MB5544.namprd03.prod.outlook.com (2603:10b6:5:2d3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 10:52:00 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 10:52:00 +0000
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
 b=ZJcVbBi0tTuWwSZcZXhfv0oiS0yY6lf17L/A9qvXLMjkI+hjtNS6Glqm+aOd0kyRPWnOrqt/rlW1PXNCkEYzCmRt/ZZkSZL27KZ7e9gqyHvk2n1T7sx1dIukZeYHHb/oRFeCO04pcexGPFwddso/lGTKAD6sbUNUAAYIdPyKerwj8cR4mqp/8Sd4QMhNlPtsGC5osZR0bSCqK4WdQ/60m8YSm85a3uGXnnVvd4sU5i9CR5PukT2w3eURjYh6iu7CGXeBLzkMmhyenr1MwCmdbAnH2PyVOc+1wDPtFmTcedlkQq4b+9vI+X5mp0fsFIAalS0S2ajCzgKJp13T6wulqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sIIYEXMk3J6YnSEASVkcwEsGOy2H4xJ/eDGUo78h4l4=;
 b=AZPBV+G3qBpB6iRGwXIZC3f18ngL4y6W7pygbJzKT1n6phIkkr73UvZZUp0Jp1ERi+EJApprkuNV2wX2/h8cazw8l9ZXaEmDIRfMJkC2zduYkwpNe1AZKcMIvozX89A3xVG3U4j+CekVBMr+Gg4VbmbjbFfZJX8gvAtB1wNRAcrF0Wt3xwD43ilZ8MqwuG7fXEMxwbu0jMr7QjB8Dj45Vuc3PlwaavXr8zkmuBb4HnIvVslS7Jjn6IptL4MadWUL6NwURiVp5hiNzKIbb78j4EW7nd68PlJotpZmw0YLwquRPgkaPlT69WtVLBaBm+9L2PrG3h1C8wUvkHznrAVglg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sIIYEXMk3J6YnSEASVkcwEsGOy2H4xJ/eDGUo78h4l4=;
 b=fH1ln9U9+SCowTlLOqR3QR6waQyLlIHWmwE2LuHmrFx5Jamhf7ghxIGo3JS7Mpu76sdoDuJAdLb5+hMIgvcmoY34yoFJk+OvqRsjK2Bxpl9DtpNKktnhu0CZTgwwBJJiVp4WUdsjr/Gtiq21sC75VTexkzif2tPJNTouzJnQSVE=
Message-ID: <0d90ac80-940a-416a-a3f2-51b94d60baf6@citrix.com>
Date: Mon, 8 Jun 2026 11:51:56 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH 2/2] tools/libs/guest: Use the system liblz4 in the
 bzimage loader
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20260603085331.2704108-1-andrew.cooper3@citrix.com>
 <20260603085331.2704108-3-andrew.cooper3@citrix.com>
 <aiadn_Gaf9IfkrUu@macbook.local>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <aiadn_Gaf9IfkrUu@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P123CA0012.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::17) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS7PR03MB5544:EE_
X-MS-Office365-Filtering-Correlation-Id: 55a0dab2-483f-47b9-8bca-08dec54bf7b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|6133799003|3023799007|18002099003|22082099003|5023799004|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	HKQ06sZQ7+v/P9O0P6cWbovyrJDsC4LKA/IT0BEwtoP4aWh908/9eo0vrvwkXsniOLeDLfO6/tBUN3jFXKVhy6ZIvSg75KUmuL8gQo3ictffIIRF8Ret4WgXFlyh8Vvyxo8AXxe6mQgnbA3yoabf6Ccfov9pH4dYLP/3/0vk54/+VS6Ml+RTqz9pSSO7xr9V1alSSGiEGl0GGahNeSj6NTOOt+mdlZ3S0KiKPeItBFCjhRFSwvMeDPJhlZpJ64mcEFAdwhjG4ElamuUZgUxsufBHGxNnCz1QaL5MRwm6TKwDCoY+5dj0lYSmNXjdcn5bG4Fp+HadOqGRQc61o61vFh+D0KkKZ9IWb+ZjaQLNX2I7+d/50U6DuJcFv2qX2bo0X9HSODUTBe5/E00HnjAPraZ+gOmYqBdPRn9dzdTg/ZmUJ+gLLuXN4PrtpEc367J1A9dW7ec487bvNPwlVL2FBSHKbTvM/BnRUcAms59XUQqjiIJ3uwNrC5u2MUt4EszrcUQYDYF9O1vdbx3Ucza6HUU6SIYBNLidFpKfK1zk+qBY4A0uAz2f8ENGue5ddAqVvwF6/A7THinWRzXPb6B7jwVvtx4Fgujwt7whf3+BW53r0oWmHg67OKVqoSZ9xLZVtd1YuuwMJlDqlS4qAfxG2NFgsO2b7IFIMHnmAEt8/Ge5uVVZ9gEVWnvBUCC3YymB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(6133799003)(3023799007)(18002099003)(22082099003)(5023799004)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ckU0QW1ncnlXb05UaCswN0l5bSt0eW15YnhvbmlHWE9tak5rZzdwT2xHdy9Z?=
 =?utf-8?B?VEs4bVRvVjZ2TGxZbVhoVjJvK1Naby9KUHRPQVk5a05YWUxjVFg0bXZ0YXJ6?=
 =?utf-8?B?TE9uNncwclFhNXhPZzNPWE1oUTcwd1VPUFJNUWNWZVRhS0o4clQ3TEs1NkdU?=
 =?utf-8?B?NzZQNkRFZFBRY2tRUlU2MWx5KzVablU2RXRnTmZrbFlObkpCbTNlM2l5Z0RY?=
 =?utf-8?B?T1FiUkhZeEVkSDhUSXlVS0phM2U0R2oxSW9jc3lkL3djT2pYZDJJVlg1ODR6?=
 =?utf-8?B?RHVwUGNIZnI2OE5VU3Y5T2VyYlJHLzI3dGRsT3FqTVFseGlPRjU3VXE1eS9B?=
 =?utf-8?B?Sm5Qa29TeU1hZVZNM3hHQlk1ZGZ2eDNYTkQ2dVlEbzZjMFZvUG51OGpYKzdM?=
 =?utf-8?B?RllicS9BTEtKeEJ6K2lnNFZ2ZnpXRmtkZlVsVTFxU2xaN2t6My9xUGJITnB4?=
 =?utf-8?B?UCtjYm9KeGQrT1F2bXBuUmV5L21kSEx6T0xzaE5HS0xUdVhnQ0hVTXI2aDhL?=
 =?utf-8?B?WExjR0lJbC80T2tXRWRYL2puMEQ3TWRXaVdjcGh1Y1F5VVluc1lYR05TMDdj?=
 =?utf-8?B?Ym5qdjlVWXBTSnBwYmUwWVRSYjFMNEJRZkJQY0tndmk1R3pCeTIxemFBSVNS?=
 =?utf-8?B?ODZiajczVUpNSGRtZTBnWkFLNVlJK0JHK053VXBUUDY4bnFqQURidkhsM2tY?=
 =?utf-8?B?NDgrU093YnpQVkxKVWo4STJ3UHFZdURzSVYwZHpNSmNnSWJTdlF1UU1QWkdJ?=
 =?utf-8?B?NjdnVVVRVHpqcWpJa04xUVhpYmFFRUUyaTJnUDhzWTZHUjRGNm9LV21VTURI?=
 =?utf-8?B?dFZIMUxrUUFHa3RNV3U4b3JRZWpSS2xkdWdFdGh0R3ZVSU5LcncraFEvdkRP?=
 =?utf-8?B?TW1WaWJSNjdJQXVydkE1NHZaQktMcm1PelZ3dS93SDhBMjJ5R2JuNEIwRGRh?=
 =?utf-8?B?SitjazU4YlhFKy82N3hqQktjT2RyeEMzWnBkSXlLSXoySHcvTE4zNkZiQWtQ?=
 =?utf-8?B?WlRKVzFHZUZIM2NYRmJtaFhQdjBjR054eHZIcnYzOXZGM2lwZ0gzc3BLcmdV?=
 =?utf-8?B?RW5xays3UGdYbGxudW0vZTJybFVTQXAycnlJL29ycTR5SXFtc2d4dzcwSHpR?=
 =?utf-8?B?TWJUUEJRSXhCVDlGc09SODFsOCtJYWljdUxoRFVyTUFvQlVPV0kxNUZDa080?=
 =?utf-8?B?Q0tMV0p5bTByVG1qeGRtN0IwcHNJckh5Ryt6czE4UXpTY2prWUF5eWpScU9n?=
 =?utf-8?B?UEx0TEVHaU9DVW1odmQwWk1yYzRsK09RQ2V3WVJKQXZQVjJMNUFJSlBDWmVE?=
 =?utf-8?B?L1U0ZXRTZlhaY0JkaTdmVWkydWEzSlM2RFJVN2ZwUG9tTlpJdW1MM1JVMEQw?=
 =?utf-8?B?U0dHb2Q3RE1KTTNtK2xzcDNDQ1VnbXNOTGxpcWM4dGhGR2c0eVVrcWtXVnlK?=
 =?utf-8?B?dFhEMGhRdy9xSDFiaVZLV3BZZGtqSzJycU55SDJpbW1jUEZKcXBycWRSS2xH?=
 =?utf-8?B?ZWw2QWFsSDZueXF6YUMrTEdCNGdNTXkzZUtPNkpVUFRkOWtvbEpPbHZYQ1g5?=
 =?utf-8?B?OEl0c2lDS0NEb1hqSytDK3gxazFHd1J2RTcvajRDNkd6T3Q2UTBaMTRVZHRO?=
 =?utf-8?B?Z0MvRDBVN2IvcFYydVpVZEFodXNIZGVZMXc1aEFyYVdSMnBVcFVCeWJ1bnM0?=
 =?utf-8?B?YklFeVg1Z2FHY2s1T1pHOXBtYVl3UnRmQ255R05GbGFxQ2ZackhsSUdEY0cx?=
 =?utf-8?B?OWpxeXQxNXorZHRmTWVRdXNGaWc5ZzIwa1kvL3RKamhleEd4VW45YldqUVlG?=
 =?utf-8?B?WTlNc3AzYjhyYzF1Q0VXZ2JWMzZwT2l2S2NVNUlnK1hYRncrWTRlTVR6ZHV0?=
 =?utf-8?B?aTllOW15SnArRmFPU1EyT1hENWVCeUN6amxBZjAyY0FtRWFsaytka1N1SWtw?=
 =?utf-8?B?c0xYZmp0M1NOVXFER253Nml3WjdTWi9Yb0pKSjJjbml3REQ2NG9rN1ZibVY4?=
 =?utf-8?B?RnR6cVovdFFYekJEM2MxZTdaMlFhaWtjZ3VibE5RcmhXejlnZ3hZaEJ2REVn?=
 =?utf-8?B?RGhrZFIrMWVmZEFkWGVYamo0b0VtWmRHTW1YaFJwcEd3UStCM2wyR0F4d2o3?=
 =?utf-8?B?RmRJZmcvMG1MUDZpNmZwaDZkeUJ2L2I2ZWZwWUVydTNXQ0YxL0ZsRzFZWWdu?=
 =?utf-8?B?aExxcldMWmxwWVdFZy9TRS9mVkFhMm9sU3QzaFowTFZwN0JPQjMyK3lIZjVX?=
 =?utf-8?B?SWZwOUU3Q2MzRHg4V0FGVm9uUTBhZnNPQ1MvQWZURWhXdHZMRG5leUNva3I4?=
 =?utf-8?B?Wi9lTkhRTUEyRENQdEJyTWl2TGIyQ1JtVUdwbFZ3aVY4ZXRCaGNhTkhWTXFw?=
 =?utf-8?Q?BGsORrc1/wltQRvk=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55a0dab2-483f-47b9-8bca-08dec54bf7b3
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 10:52:00.3038
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nKBD09jqMLyInvh+clnM21cV0kAljXTeMX3mlwGE/34oo80vyCh/CI2ndDnU8295SADI9FJUrE7GbIBeHDknf1J5PiSxnqxZuxvhhg8pH4Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5544
X-purgate-ID: tlsNG-c201ff/1780915924-D857B443-6128E4CB/10/73395122804
X-purgate-type: spam
X-purgate-size: 4431
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:jgross@suse.com,m:oleksii.kurochko@gmail.com,m:roger.pau@citrix.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[citrix.com,lists.xenproject.org,vates.tech,suse.com,gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:email,suse.com:email];
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
X-Rspamd-Queue-Id: D1A71655560

On 08/06/2026 11:46 am, Roger Pau Monné wrote:
> On Wed, Jun 03, 2026 at 09:53:31AM +0100, Andrew Cooper wrote:
>> Right now lz4, unlike every other compression scheme, unconditionally uses
>> Xen's unsafe decompressor.  Make it consistent with all other compression
>> schemes by using liblz4.
>>
>> The unsafe decompression is still required for the MiniOS build, so rename
>> xg_dom_decompress_lz4.c to xg_dom_decompress_unsafe_lz4.c and drop the
>> non-MiniOS content.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
>
>> ---
>> CC: Anthony PERARD <anthony.perard@vates.tech>
>> CC: Juergen Gross <jgross@suse.com>
>> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> ---
>>  tools/libs/guest/Makefile.common              |   2 +-
>>  tools/libs/guest/xg_dom_bzimageloader.c       | 128 +++++++++++++++-
>>  tools/libs/guest/xg_dom_decompress.h          |   6 -
>>  tools/libs/guest/xg_dom_decompress_lz4.c      | 143 ------------------
>>  tools/libs/guest/xg_dom_decompress_unsafe.h   |   2 +
>>  .../libs/guest/xg_dom_decompress_unsafe_lz4.c |  39 +++++
>>  6 files changed, 169 insertions(+), 151 deletions(-)
>>  delete mode 100644 tools/libs/guest/xg_dom_decompress.h
>>  delete mode 100644 tools/libs/guest/xg_dom_decompress_lz4.c
>>  create mode 100644 tools/libs/guest/xg_dom_decompress_unsafe_lz4.c
>>
>> diff --git a/tools/libs/guest/Makefile.common b/tools/libs/guest/Makefile.common
>> index b928a4a246a9..86b1f160e536 100644
>> --- a/tools/libs/guest/Makefile.common
>> +++ b/tools/libs/guest/Makefile.common
>> @@ -46,7 +46,6 @@ OBJS-y                 += xg_dom_core.o
>>  OBJS-y                 += xg_dom_boot.o
>>  OBJS-y                 += xg_dom_elfloader.o
>>  OBJS-$(CONFIG_X86)     += xg_dom_bzimageloader.o
>> -OBJS-$(CONFIG_X86)     += xg_dom_decompress_lz4.o
>>  OBJS-$(CONFIG_X86)     += xg_dom_hvmloader.o
>>  OBJS-$(CONFIG_ARM)     += xg_dom_armzimageloader.o
>>  OBJS-y                 += xg_dom_binloader.o
>> @@ -59,6 +58,7 @@ OBJS-$(CONFIG_ARM)     += xg_dom_arm.o
>>  ifeq ($(CONFIG_LIBXC_MINIOS),y)
>>  OBJS-y                 += xg_dom_decompress_unsafe.o
>>  OBJS-y                 += xg_dom_decompress_unsafe_bzip2.o
>> +OBJS-y                 += xg_dom_decompress_unsafe_lz4.o
>>  OBJS-y                 += xg_dom_decompress_unsafe_lzma.o
>>  OBJS-y                 += xg_dom_decompress_unsafe_lzo1x.o
>>  OBJS-y                 += xg_dom_decompress_unsafe_xz.o
>> diff --git a/tools/libs/guest/xg_dom_bzimageloader.c b/tools/libs/guest/xg_dom_bzimageloader.c
>> index 1fb4e5a1f728..32b3c682a447 100644
>> --- a/tools/libs/guest/xg_dom_bzimageloader.c
>> +++ b/tools/libs/guest/xg_dom_bzimageloader.c
>> @@ -32,7 +32,6 @@
>>  #include <inttypes.h>
>>  
>>  #include "xg_private.h"
>> -#include "xg_dom_decompress.h"
>>  
>>  #include <xen-tools/common-macros.h>
>>  
>> @@ -623,6 +622,133 @@ static int xc_try_zstd_decode(
>>  
>>  #endif
>>  
>> +#if defined(HAVE_LZ4)
>> +
>> +#include <lz4.h>
>> +
>> +#define ARCHIVE_MAGICNUMBER 0x184C2102
>> +
>> +static int xc_try_lz4_decode(struct xc_dom_image *dom, void **blob, size_t *size)
>> +{
>> +    size_t outsize, insize;
>> +    unsigned char *outbuf = NULL, *inp = *blob, *outp;
>> +    uint32_t chunksize;
>> +
>> +    /* Magic, descriptor byte, and trailing size field. */
>> +    if ( *size <= 8 )
>> +    {
>> +        DOMPRINTF("LZ4: insufficient input data");
>> +        goto err;
>> +    }
>> +
>> +    insize = *size - 4;
>> +    outsize = get_unaligned_le32(*blob + insize);
>> +
>> +    if ( xc_dom_kernel_check_size(dom, outsize) )
>> +    {
>> +        DOMPRINTF("LZ4: output too large");
>> +        goto err;
>> +    }
>> +
>> +    outbuf = malloc(outsize);
> I would use calloc() or memset() the buffer, just in case part of it
> is (wrongly) left uninitialized, as this is copied into guest memory.
>
> I see this is code moment, so possibly better to adjust afterwards if
> anything.

There's a later check:

    if ( (outp - outbuf) != outsize )

which will fail and free the buffer if the output length isn't exactly
as expected.

This code is all manner of horrible, including the fact that liblz4
doesn't actually have a function to decompress a full stream; only
chunk-by-chunk with the caller providing the framing.

~Andrew

