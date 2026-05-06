Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIscK/4Y+2mYWgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 12:33:34 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BABB4D9573
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 12:33:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301551.1575825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKZZG-0005SG-Dc; Wed, 06 May 2026 10:33:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301551.1575825; Wed, 06 May 2026 10:33:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKZZG-0005Qm-AZ; Wed, 06 May 2026 10:33:26 +0000
Received: by outflank-mailman (input) for mailman id 1301551;
 Wed, 06 May 2026 10:33:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wKZZE-0005QZ-SA
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 10:33:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKZZE-002FDF-8j
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 12:33:24 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69fb18ec-bab6-0a2a0a5309dd-0a2a45038a7a-14
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 12:33:24 +0200
Received: from [40.93.201.26]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69fb18f2-672d-0a2a45030019-285dc91a7028-4
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 12:33:23 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by PH0PR03MB5750.namprd03.prod.outlook.com (2603:10b6:510:31::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.16; Wed, 6 May
 2026 10:33:19 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 10:33:19 +0000
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
 b=aMucWpZiEosGp7OAfNL124K+qn1ZIC7eZOC+wWXTOX2ttgnbjpKtHEFZG1JMIo5v5mI0lQN4WgKukUvKAzmbnQWgSD8YzikUGeNp58NnSEf7wZTbHQedrvu+qcUK1I3D6OZoVq7bIltMPhHT1nSAy6P9q66gTvYbUHvn0QKJIg7ZS2f6vaMDaZuYOYV6zd9Xzw/MH/XSDT07veJ+JWCuoe/ZN20kkoFL0/jfeU71KFvPIdtCcIY7wwPJW5wRmmDthMjWUvhUr4dBwKi0ZwyBSiKIJIybV6a7McYYEmDGM2ZgbBSGryEQKxSPwd+0Rpj8TAcLZA5dO20XcFACKcF2Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aauq/28BmsF4PgEyHkAvwW5K33x2c52QNy3ei5L+bnk=;
 b=IYeWCf2XFKn2dhgua/3NDxsZCE10LF/QFdKEzx9Xf148WhXQg78BVM/D+EAxe3Vv57Y3O5uchgruOd5zqaFCYCu38nyQ9rV1OB8kHCebBdR4a0YWz6nBmGGxiRTChp0UWvgb4qIAA5VXjU9/ZVFzHdiuD56AfkPUNpbDq1i++e5za+eA1jzOByT5cGVTPgm/fp6OHgbXxhEHWdGcaNyHw5NhKJJNfJ7gbPb+4WZBNEvfq4GnvhLmXbvl/I21LyUO5JGJnF8A8FlrLfhOPv7qDwDoUuc0wBqSqz3aUkcCHe9wi3todT74xqmSaeqUvDBNECau+4w7Nx8JThf82+yMLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aauq/28BmsF4PgEyHkAvwW5K33x2c52QNy3ei5L+bnk=;
 b=qASqAMPEnL/PWBDHan5qMYtYl+T3yxQ0OyUIDfcEATkUGIOKClT517N56riZSsLDty8+Maa+RjOW2isSXay9uN6aH0EaR2nDwn8vbQftJThqouDMx6VxFYfo1Dd2bpOdamY4dY/hm1yQST8gvwOBvj50DGcJttYFry1oDpAmwmE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 6 May 2026 12:33:16 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH RFC] x86/time: set AP's TSC scale estimate earlier
Message-ID: <afsY7KqNIyrhW0s4@macbook.local>
References: <1e23dd78-b246-4fc7-9e18-de8b0cd57721@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1e23dd78-b246-4fc7-9e18-de8b0cd57721@suse.com>
X-ClientProxiedBy: BN0PR02CA0053.namprd02.prod.outlook.com
 (2603:10b6:408:e5::28) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|PH0PR03MB5750:EE_
X-MS-Office365-Filtering-Correlation-Id: 5285f295-788a-444a-e873-08deab5ae3e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	BdkYIC1QFq3y16cTwmmTBzFFE1V/E1f4UDufGSrUHee26KfwZmQoy6iURtXxW3Q2UZn64kIVOq5wJKkLh1MrMggZqNQuSSxau02Q4iJ0QXS7BkPfFIUqQIcxx4q4R9GgcCdaJ9dNQkU+uEP4jmlKLcCAWIJm9WSJH6+5A01MDYKX3uVbEjz/OjK71hbxNb4jBR7OnHWZIlp3FTpVyWEOLt49fQchzSiYhXw+EexHr731MbBrQzgMFOkxcUzrRga7+6FuzvrHnpp4V4Zt/Tq6Q1mvGWJY3XuRGwQL84dLm6eURMj3lVIvvQEt6vliQ24wBBB+GaveNRouiMeLofiZv5YgiAKKrhUoDKVL8Ls3L/wfc7mXvg1vQ7dDP03PNZ8xtlDwtGepeKTpIRb9/6rwqlQYXNIwnvgQi2YMMDevSeKbQAoPH5RjQ/PVzpqbv2AQlwW1O65tqMlMrO6rX+pD0diHZexlbYEfHvGERTzZCD9O/FI8Z5m+fwKMZri4AlTOxqxOVZ1wZJAQYFpS+yAJJ4En/OmRBuNyiUY0IvKUD+rAt/6AfgPqvChXRSsatHDh+iDAFvY7y7/bBk3873cSVrMZZJujnB5FgARYdfULv2y57CqJMLbAUo4Ejg1aXl7wWuFjr5s2nIrnZVYCDfk3nlFjmwKOWVxcDLgiSr3wiZvneTf5F69g8qiU9WD2G2jy
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VXd0THFlb1JYNHNmcjJZK1BEbHg0N09nazZuL29mRFVOdHNIOElwMDQxL0Ra?=
 =?utf-8?B?VmNPRjYzeVdpQjhYU3JiWFJBbzVYK3o5Y0tGVFJ1ZThrd0VSelNjTU8wWGZD?=
 =?utf-8?B?YWVjbENSSzBvemRGbjA0Lzhqc09yLzdrRDFJOFhYY3I2eXBFUDkrSHlsNkkw?=
 =?utf-8?B?ZzEzanZvVENlM0Fpa0M0MWJzY0xGTGpmSmE4Mng1bFp5ZXcxenVYSjJpUTNT?=
 =?utf-8?B?T3VKOE9QR0VYV3k5TGYzOXI2UXg5d3hwQXZwYmtLVGgrbFhQZXU1N2lBOWJH?=
 =?utf-8?B?OEE3clV1TjdrVFQ5dndvNTdLS0NDTlgxNnhVZWtDTllwenl2eDhVV25UNTFW?=
 =?utf-8?B?VFBkaUJsL0ozNWFzdEgvVmlLRFFWaUsveU5IU2syRDFCZ2JQb0F5TGhWRzkw?=
 =?utf-8?B?dVhGSWlUUEI2VUNpZnBEWUVrVkNHK1o4YzlJanhibjhMZ1BNeldWU3VlajIw?=
 =?utf-8?B?dVBNVFVQekRVcnlmSkdDWFc1dFMybkZDWEU5V0hXcXJBWi9Yd1hmR2hkR28z?=
 =?utf-8?B?dk53d3ZRQnhFVElvNWhHVkZzaUsyRGZZZ2NuNm5HdGw3SlRHSW0xcHNwNFNY?=
 =?utf-8?B?VFhKY2gzU2pnOG9MaGZQOCtSUkpONktBTSsvbUZiK21mU2xLbVRoZTlVOWdl?=
 =?utf-8?B?QUJJR1pFc0VZaFdTZXNtOXd4YW53UllkclJpNDY0dHR4VUgrTG5LZElzRVdB?=
 =?utf-8?B?eGU4SDNtc1ZvcVVUdm5Ucit4RU54bnp5QldaNzY1blUyV0tyc0g1aFJUSjFJ?=
 =?utf-8?B?L1Y1bDVBemhFTzRJZVJnSUlpYmxQYzRXbE4wc1FBeTZhNlVNdTZBS3VhNWtu?=
 =?utf-8?B?NHRKMW9PeGRjS0laSzJqWjl2RjFFK0lDZTEvNkVvQlMxOEZWbCsramk0eTl3?=
 =?utf-8?B?NzhiRlBGWDJLaVN1bkFQcWhLYlo3M1ROeC9KRDl3QkpLelZQdHNGMjAyL1Z2?=
 =?utf-8?B?TmtmUm83eEVRU0Rjd05WYU5mZCtla3JCVGZHYks4QnFOMkdzZDRRbEwzZVQz?=
 =?utf-8?B?UVFndFVkOWlmdE5yaE9ySzFWaGE1UVFnRHh0UjY5VUk0eFRXRmxtMml0dFNR?=
 =?utf-8?B?MGViMGFORlBLQ1ovdE9MZ0tMamoxM0Z3Q1VGK3IwSkpnTG5vN3daaTN0ZTUz?=
 =?utf-8?B?SVI0QXNqa00yYVB0YUJaZHMxN3NmeU1YWXVGWmJ6TWYvbVdpam80YkxIRlFK?=
 =?utf-8?B?WkFTcWVmM0JUNFFyNWNKT251VHRVeVpxTUVWY25ZazM5QkszL3pqVWw3c0pZ?=
 =?utf-8?B?dHhqZWdhOGdjVTFEMDdnSXJiMGtTS1VTU0RvYXdmUUE5ZXkvMTl0b3NxVEVR?=
 =?utf-8?B?N0twN1FBbWp6UlVVaEV1UGM3blV3a1M0bk5TZXVReVdNZG1ZL3hOcm0vcW9Q?=
 =?utf-8?B?S21qWXM0NGZlT1E1QTN4ZnNrMnhia2xHaVpUZEdlcUt4MGY0SlF1TmFXSkQ5?=
 =?utf-8?B?OWdMUFVEZHloNU5lQmQxSVUwNkcrS0hhVGN5V0tzb2Y4UUJlNEIvNWtrNk5y?=
 =?utf-8?B?bHloZUJMMEZ3NmU5eVNyb3BnNnFKU0w2SVhrU2poZHoyYk1lVWdYdkc2Z0V4?=
 =?utf-8?B?WDRPSlZDdVp1b3ZqVVhLQ2hGV0s0WXFPdVNCSnVhajNaanZ6VlZNU3VyWFNH?=
 =?utf-8?B?YlhJQ2tsT2hVYUowWlI5RlV3VUNVQklzYTVZVjVyRVR1SXFXWEhKL05qRFp0?=
 =?utf-8?B?RWJKRjBNMWw3cWJmQkREbzByV3pEYS80Zy81MXJCanBRY1NuV2xGd3NQM3Jx?=
 =?utf-8?B?NStLRUVaeWE2N3JObDJ4Z3BaV1k0WDhoSG9Hdi9MSGJkS1h5NEZyTFd2ZWhx?=
 =?utf-8?B?M0lhbzRHdHFFYUZRRVVnYVZkcEJWSitHVFlsL0g1SHRwY1VmVGZZUkpQMmdW?=
 =?utf-8?B?aUdNa09uaTRaK0M0VmJpanZmYm00K0FoSXFZbVJQa2tmK0VGUlRxdGxLMSs4?=
 =?utf-8?B?bi9hbTRMUjZuOG1CNWo1WTRiOGtGTWFoY0h5UjRtaWFpQjFDYktzcDcyRU1v?=
 =?utf-8?B?Y1JSR0dTYmsvencwQis4dEZFdldKU3JySVd3UG44N3YvN0IyRnRqWWRSdG9Q?=
 =?utf-8?B?WlkwN0o1SnMrdHBPZEJLeW5rSHRmaTVRby9wc3h2aTNZc3BkTmNOR3VCSytm?=
 =?utf-8?B?Y0F6cUxaeERhSGdOTXA4WlJ3RURsNEltdUcwUFpwSW8ycGVDbk1nenlFaVlO?=
 =?utf-8?B?VmZhdHFkK3A0UUN0L3pvK0ZUMkhkK3B6TnFLMDNMa3lNMFk1OXI5MGRuaVRj?=
 =?utf-8?B?SmJONWZwOFVjeURQUHg4YnhzVEk1Y2s5cWQ4UDFxSUdZTkJ0QzNFREJZempU?=
 =?utf-8?B?MElnNWVzMUk1L1JBbndPUXV5NVVESHp3aVV4L3R3d2NucWVDbmtLdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5285f295-788a-444a-e873-08deab5ae3e8
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 10:33:19.4234
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: unABlDXmcZvlyDKoRj49xXagrkicOK+nuqGVtuHZ0Tvrv66Z41xy73RxZvnKyOGeB9nyuL4S4fLoRrKOQ777JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5750
X-purgate-ID: tlsNG-33051d/1778063604-39171938-8FFC9D04/0/0
X-purgate-type: clean
X-purgate-size: 2506
X-Rspamd-Queue-Id: 3BABB4D9573
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,macbook.local:mid,citrix.com:dkim,suse.com:email];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]

On Wed, May 06, 2026 at 11:39:14AM +0200, Jan Beulich wrote:
> NOW() (in particular) can be used ahead of init_percpu_time(). As the
> initial scale value set is merely the BSP's, we can as well set it before
> actually launching the AP. Don't introduce yet another notifier function
> though; do this from smpboot.c's.
> 
> Setting the scale alone, however, doesn't work, so the entire struct
> cpu_time is copied.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> RFC: Copying the entire struct won't work very well when tsc_adjust[] is
>      in use (and values there differ between sockets).
> 
> This in particular eliminates an anomaly with log messages issued early
> while APs are coming up, when "boot" console timestamps are in use.

Could we consider moving init_percpu_time() earlier in
start_secondary()?  I think it's main dependency is on
set_cpu_sibling_map(), which we could also move earlier?

Looking further, seems like it depends on smp_callin() having parsed
the CPUID features, plus the socket_cpumask[] also being set.

> --- a/xen/arch/x86/include/asm/time.h
> +++ b/xen/arch/x86/include/asm/time.h
> @@ -21,6 +21,7 @@ mktime (unsigned int year, unsigned int
>  int time_suspend(void);
>  int time_resume(void);
>  
> +void preinit_percpu_time(unsigned int cpu);
>  void init_percpu_time(void);
>  void time_latch_stamps(void);
>  
> --- a/xen/arch/x86/smpboot.c
> +++ b/xen/arch/x86/smpboot.c
> @@ -1139,6 +1139,7 @@ static int cf_check cpu_smpboot_callback
>      {
>      case CPU_UP_PREPARE:
>          rc = cpu_smpboot_alloc(cpu);
> +        preinit_percpu_time(cpu);
>          break;
>      case CPU_UP_CANCELED:
>      case CPU_DEAD:
> --- a/xen/arch/x86/time.c
> +++ b/xen/arch/x86/time.c
> @@ -2346,6 +2346,12 @@ void time_latch_stamps(void)
>      ap_bringup_ref.local_stime = get_s_time_fixed(ap_bringup_ref.local_tsc);
>  }
>  
> +void preinit_percpu_time(unsigned int cpu)
> +{
> +    /* Initial estimate for TSC rate etc. */
> +    per_cpu(cpu_time, cpu) = this_cpu(cpu_time);
> +}
> +
>  void init_percpu_time(void)
>  {
>      struct cpu_time *t = &this_cpu(cpu_time);
> @@ -2353,9 +2359,6 @@ void init_percpu_time(void)
>      u64 tsc;
>      s_time_t now;
>  
> -    /* Initial estimate for TSC rate. */
> -    t->tsc_scale = per_cpu(cpu_time, 0).tsc_scale;

Wouldn't it be simpler to pull this out of init_percpu_time() and do
it at the start of start_secondary()?

Thanks, Roger.

