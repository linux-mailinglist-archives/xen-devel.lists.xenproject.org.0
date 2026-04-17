Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJSzIdk04mm13QAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2026 15:25:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC0541B989
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2026 15:25:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1284265.1566094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDjCB-0001wW-M8; Fri, 17 Apr 2026 13:25:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1284265.1566094; Fri, 17 Apr 2026 13:25:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDjCB-0001v4-Iq; Fri, 17 Apr 2026 13:25:19 +0000
Received: by outflank-mailman (input) for mailman id 1284265;
 Fri, 17 Apr 2026 13:25:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1wDjCA-0001uy-JQ
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2026 13:25:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDjCA-002ngC-07
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2026 15:25:18 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 69e234bc-2eae-0a2a0a5409dd-0a2a4504ab28-4
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 15:25:17 +0200
Received: from [52.101.201.56]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 69e234bc-1dec-0a2a45040019-3465c9387359-3
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 15:25:17 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by SJ2PR03MB7401.namprd03.prod.outlook.com (2603:10b6:a03:55b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 13:25:13 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%7]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 13:25:13 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lJe6oDeOnpDPjnnpT2XBRS8JIa8J/Y63CBKWCe6jpCNjKJk+J6img6PZQ8aHoJPswSX3o+Y5RPhc/+pNv4oQ9/Nji8bnNXnrli2BT4gh3TMsszZQZ2i8Kuz1D/95rjjnXsonGbSwawNX/1ZUBP3p4rlXR3bVILZloOc4B51JlD8WFHabbP3sPe7a7T0cUOAag86BYPOnLTuZf7Bom3KwWpPO7ojxn3SIGXGtRSObjYIaelNr2S4M/45evDCFMmF+1Oc+58m/nBrw82lEvqOWBccLBM5uYBoqI3j6BuzH9a/Dk8eZ0xRWaMu5d272iW3Tt0yyZR3Ep4fD/7lFiNkntQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FZwTqLwYgsPiQT5hyq8qk8hP1MeT0nr7EqwOqBnQKM4=;
 b=Z0uugDK/GoIU8RLTcQTMwYV+VWl2Q48wUQDjUSiehVlaepnpsWrziPj95PtYV9+zTiYJoG9DbIK02PImQO4AVOHt4iK64JHBZOpwM56+njHFnuWQIeaaeGmtklD4T2NGVlfbA9tfGPvWQFMLTUfGULrvZX7o+jhuiWynRCM/1NOdsx1VEeAqBGFb4xQgqD7fDCE0Bwiii7xq1hY9yMJYb4cEfGh3sJhADn+5vrtk6TMtBNH+2MoGTuC+Rdwr0qXv2sQWn7343ii3eAfCX0YOtJxr/OvlX6L6wbrnm6RtQpc2PGDdVUkYTpOthOezkLRrRGNp8aQbGSqe0veBTEpRdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FZwTqLwYgsPiQT5hyq8qk8hP1MeT0nr7EqwOqBnQKM4=;
 b=ejCkL0uOLN1cg3Smc1j0MJH+QUXL3RrWacaAtL1Im1Z9JETtQ99PXggazYZ1czb8mU20bNUlGwfq1hL4I4zvkwjRadsfRRMsHzV1hteIzYZLmCw2qgQQney2xSCmBP7D8KOrxi9PdsSYSmwI0CrNg87SCiiKnswoUfKkoLb5SKM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e12a3f73-6121-4152-8f54-5bed0f36d087@citrix.com>
Date: Fri, 17 Apr 2026 14:25:08 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/mkelf32: Actually pad load segment to 2 MiB boundary
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>
References: <20260417105425.1184232-1-ross.lagerwall@citrix.com>
 <a6b71c55-fce7-4995-b38b-83133d702bd5@citrix.com>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <a6b71c55-fce7-4995-b38b-83133d702bd5@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0164.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::7) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|SJ2PR03MB7401:EE_
X-MS-Office365-Filtering-Correlation-Id: 70d9150d-caeb-4a60-d694-08de9c84c1eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	l4yfbwj20h/X4FhVHbohF292j95Dk/5Rgge55Y5Egj+NQ754IrL1bAjvG3aDHySRVOvijjytktw6xdX0+1rgBk/ufFVCTfoP7aDBhsp8mxgCwN0xcfdxZSc50MbjdxZY0NksPYKTcNTOoDCi0UcM8joAo0h22yB65ehyuB9zdxavuaYIom7tssRvMfaw1/ja9bbPc4SRDvmcf3ah1wUYaTBcM4NiR1Wgs/yOkFiVNf+r3kvJSHLPCyO+s9/w2O2RiuLVfe7Xxry8rAtjJvuykzmmrVfYK3aKZvADHZW39i5xTpD8bD5IVdgbImb8Lu173YYYYgZfPFapbbksY/J59XR7mY6DDAnNPib4nXh+TulLH01uPbkCnJOeaGZGx601GuOslFf+FoYpv3Pw6OZhz47yLGNyyRCWfCKJVI9ZgXAusjemHn/AT28N9GhAhDWu6d4bPwmRtgwIjMfWlLUv7p23FqU1no8wStZi2cPoQX1I5fxBe0mo1+sAFGtUrLHR66R+y5/Z+kvn0b4Awo0dT4UR4SyMuzBXb6gMq+CIZINmLnUQIM7h6eBOPYlOJQF6Qx8gXQusWq/GArC/E6h2czUIcwYPtaZ370ACxh5RjTZPAOpM3av2KEmbwqm26wB+0PMgyRIbgNbV8E59+V1BggEhVkc9f1kpgpy7DQeBE6W7CC/qr1lSgpJk+rWklpYH8KiicuDCYOzJHaaBwZ8KuMy51PERChjDs2n873sPEto=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c2N1VjZSMjlqT0lQYkhoazFlUDVrT1htZURvM2svaUdUQUNWcXJHL3JWbVMv?=
 =?utf-8?B?V0FpMGdIN3hHbVB5T3pGSm5jSnMyQmpxbkF0bFNKNWFSK0pkWHZzRlZBQWY5?=
 =?utf-8?B?VFN0S3laenZ3QUdJTDBxNDJRWWdMQk1VVUxzWEM2K2JZOXdLZUNMYllYZmlm?=
 =?utf-8?B?MnJBcmd3a2tkcXVKaGVGWlZQeTBtNEtCWTcvYU9DRlh6Q1VRdkJPbXBHbkpC?=
 =?utf-8?B?di9acVJXbXdRWkN6Z0YydnpKMGhmUlorUUE1QzJHbU1rbm9YK0I1NmNPNmtU?=
 =?utf-8?B?N1ViUC9IY2JLTERCSzJIUnZtVFk2cWg3MVM4OGNLR1IzSitqK0x4ZjRXSWJM?=
 =?utf-8?B?TTZSeERZY2o2K0lpMzNDUzk3ekVTYjJjdEJCUUJncnlCY1ZsSEh5VVVkaXF6?=
 =?utf-8?B?d1l2QzVtOURpVFpRMzhkdGZCR04vQ1VxczJFL1lETTg2ZjFUWHBYTmdaS09G?=
 =?utf-8?B?N2dBd0Zubmc3azBxYTZmRzZUWFFRbWdkTm5ZbUkxUytxak5hR2RNWURTNTEr?=
 =?utf-8?B?ZkRlY0FFR1Q4bklteTlZOG03SjFRRDlMSzc5RTAwWVVQaXpnVFE2YUQyZEJF?=
 =?utf-8?B?QW5GVzluZWYzOXM4c3FhektZaTJnbklwYitkbVcvaFhSbUwwTzBLeE43TGFK?=
 =?utf-8?B?bFlNb09wL1RvSmZ4cUpJY2dKVUU3RmtNaWVhdDY2ZCtiRW5PWEQ0WVVzbm5Y?=
 =?utf-8?B?MUtGbGoyczB0bm5qUDBpTVdXRnZ4SllLWnFVeEE0RUxoU0xoTjk1MG5DdWta?=
 =?utf-8?B?NG5NUlZnQnV3Y1hmb1hSeGZORFlDN1pVN1F3U3ZDeXFiSFBqTHVpcmZkSzdO?=
 =?utf-8?B?ZklLR1RqcDZOQm80ZDQrNUVSQW40dlN2ZkNvOWJ3SmZldmZ2V3p3bi82TGlq?=
 =?utf-8?B?Q0NqbnVHV20wZGFtSEhseTNaYUhKak5zV3hjeGovYkN5Z2NDekJiK1oyMElL?=
 =?utf-8?B?Q2xOV3BTa0hoQlMzMlowMmFpVE4wbElpMndTdWd1N1MzaU1XanhDOWdkOWh4?=
 =?utf-8?B?NER4cWVNM2RPai9oNVZuUmpsTW54V1h6QXZhcGdYbDZ6YUF0WThtTVdvQUVR?=
 =?utf-8?B?OVFmU3BnQ2g1dktYYlQ4RHdHYzdHdDErcUd1Z3FFVFFXNkF0VmFmaXV3Y1Rj?=
 =?utf-8?B?cWNDelhuM1RET091ak4vKzA2d0pSZ3RvVXBUR0Q5N3dNYnBYRis5bTI1ZjA1?=
 =?utf-8?B?c2N4cEZKVHJkOHQ1MW5MR2tyVkJ1RDcxdWQ2SmxJdXBlTHgzTGhGS05qdkFl?=
 =?utf-8?B?T1o2OXJjRVZiN1BINWwyNy9vUVlyRFFlbnJ0U0V5ejZ6RWNXZ0JJSkVkdGhk?=
 =?utf-8?B?ZUdzYm13V21ZalRwWGN6UnZ2VVg0dDBIbmNVY28yNXdEVlNLUnQ0VHRtUVZX?=
 =?utf-8?B?cVFITUdmUXZ0cTJ2L2hiTHU5aE9mZlN1aTU0N2VVNUR2TWtMZDhGTmkxSjhH?=
 =?utf-8?B?Rzk3anFuVjBrL0R3UFFiTE9QRmRQR3d4RU1DU05NcENuMUMya0FkaG80Ym53?=
 =?utf-8?B?eDNRU25WcVJ5Q0FsQks0UFhtK0hrSUNDQUtwT1RlNm9ib2FYVzI0T0xOK3V0?=
 =?utf-8?B?RVFzRCt3bzg1YldZNjRhQ2tKZHNBWG11V1VYRVd4bi93eDFFOVFtclVzb1JP?=
 =?utf-8?B?ZHdSTzJHYjJkT3g5UlVyWXlDRUhQemY1SzNvWTFhbGFzRTJDcFFCeHNPSXlm?=
 =?utf-8?B?SVJiRXZYOFZub0M4VUZuaCs1SkdPcG1DYURXTTQwckdBajNwYkVJWTcyVXNp?=
 =?utf-8?B?bW1KdEE4NWhiSHZNMFY4Nk5qZmcvU1p0NWVZeDhHZ3N2YWNhalVIRDlVMnQy?=
 =?utf-8?B?YmY2Y08zeEZvRkdKQncyelJ4VzZXRG4vQmRRK1Rxa3Nielc1UWIzQnBzSHNR?=
 =?utf-8?B?a0pKeEtjNWZTRkZTSG1EMVdtUlVNaUZXVStncWorTXIrRldLM1RjcFNLVGRS?=
 =?utf-8?B?V0dpaWpTcUV2Vk85dGhKSnVYTjE4SGNXbXZwYXZRb09oTjdGSTlEdW1sRlZ4?=
 =?utf-8?B?UW93Sys1YzllQXRZc1dTL0x6dzFONHJ0TmFWeVhLNG5sOHNJM0JlYkRweEZH?=
 =?utf-8?B?endYMnV6TFBwRVpTNFh6M1JYT05UNVVvUkRsUFphcXYyUGlwTExLQzhZeWRa?=
 =?utf-8?B?cWtyVlMxTVJ6Z0R3SCs4M01ra2lMRHNBMjRuS1J0L1pGbW1CNDYzdjVUM0V6?=
 =?utf-8?B?WVUvZlFTeVBWSG80UHpud2FDZWtIcjFzUytvQnBzSjN3RW9nNnBjeTB5ak1s?=
 =?utf-8?B?L2xNc0E3a2ZTSVBTaTdaSUFnZ09Ga2QvTG9tOGVlM0RHcEhyQzVTdWFOTWJV?=
 =?utf-8?B?aEdPNzN1VUROR3ltWjdxV2xibUErTVZhdDN2TVowazBScWxYZkx1REREQmJ3?=
 =?utf-8?Q?ddt9j2N555h+Bja8=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70d9150d-caeb-4a60-d694-08de9c84c1eb
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 13:25:13.8036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SsLo+oYI2V6Fjj1kcQNasNYPubplLiI1nOAwoSq714zul8AYuDwojrSOWyr4yz680FtltnvzKVLwyMc+BP1Bv0NPfQ5imYoQl0+0PQnXifI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7401
X-purgate-ID: tlsNG-ebf023/1776432317-3144B3FF-3846FB6C/0/0
X-purgate-type: clean
X-purgate-size: 1942
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 1EC0541B989
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/17/26 12:03 PM, Andrew Cooper wrote:
> On 17/04/2026 11:54 am, Ross Lagerwall wrote:
>> Fix the code which tries to pad the load segment to 2 MiB but only pads
>> it to a 1 MiB boundary.
>>
>> This manifested itself as a page fault while scrubbing RAM during boot.
>> Xen failed to mark its location as reserved in the E820 because the last
>> 2 MiB superpage overlapped a reserved region which meant the memory was
>> given to the allocator despite being RO.
> 
> Do you have the relevant snippet of the E820?
> 
> AIUI, you're saying that Xen was placed immediately below an E820
> reserved region (a valid layout at 1M alignment), where said region was
> inside the 2M-aligned boundary that Xen was expecting.
> 
> But I don't quite follow what happened next.  Where does read-only-ness
> come into it?
> 

Relevant E820:

(XEN) [00000063469ff02c]  [000000003f2df000, 000000003f31efff] (ACPI NVS)
(XEN) [00000063519dc9f2]  [000000003f31f000, 000000004cfebfff] (usable)
(XEN) [000000635c504aff]  [000000004cfec000, 000000004d07bfff] (ACPI data)
(XEN) [00000063677372dc]  [000000004d07c000, 000000004d09bfff] (ACPI NVS)

With a load size of 0x900000 (padded to a 1 MiB boundary), Xen was placed at
4c600000-4cefffff.

In __start_xen(), there is a call...

reserve_e820_ram(&boot_e820, __pa(_stext), __pa(__2M_rwdata_end));

... which tries to reserve the region 4c600000-4cffffff (size 0x1000000),
padded to a 2 MiB boundary since it is using superpages.

reserve_e820_ram() doesn't reserve anything because the request doesn't fall
within a single RAM region. Therefore, the pages get treated as normal RAM and
will get scrubbed later. However, __start_xen() also calls
modify_xen_mappings() to mark all of .text and .rodata as RO in the direct map
so when it actually tries to scrub it it gets a page fault instead (which is I
suppose slightly better than just zeroing Xen's .text).

Ross

