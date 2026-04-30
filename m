Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MPeQFb8z82m6yQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2026 12:49:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B33C74A1052
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2026 12:49:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1298042.1573642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wIOx5-0000CN-7v; Thu, 30 Apr 2026 10:49:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1298042.1573642; Thu, 30 Apr 2026 10:49:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wIOx5-0000A6-5F; Thu, 30 Apr 2026 10:49:03 +0000
Received: by outflank-mailman (input) for mailman id 1298042;
 Thu, 30 Apr 2026 10:49:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wIOx3-00009x-VH
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2026 10:49:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wIOx2-008dPf-Qf
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2026 12:49:00 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69f33391-e002-0a2a0a5209dd-0a2a450c9b80-26
 for <xen-devel@lists.xenproject.org>; Thu, 30 Apr 2026 12:49:00 +0200
Received: from [40.107.209.30]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69f3339a-62f1-0a2a450c0019-286bd11e7a1b-3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Apr 2026 12:49:00 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by PH0PR03MB6480.namprd03.prod.outlook.com (2603:10b6:510:b0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 10:48:56 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9870.020; Thu, 30 Apr 2026
 10:48:56 +0000
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
 b=yBBNC8AegJKWe9f5lDgGTvuDM6y7/enp8Xf9EPHbZfld9pUXtskgvpDumxvKw50Pz/efEkyDWOEOEYucprW3qrxYq3cumShvL0nDjIFn6jJFHKe8Jv/mS76oDB98mdS6JC57XYrLbsjRpIejgMRgzIWqyZ5hpvLSvUnqBCOZ89VnN5r+Agcz5OL0Fc2Aw9tBpvjW+hnBVLDYsKCiJnbnlnZ0h3Dgak48fWZviuF11WlvQEZ5V/rd2sMeH2DVjbK4yTSNedd2VXkaneGksqPu4gfhvmTheyYLXxVlcEvf09GH5Og6IHPw0MRBhsXbSLA3/afCl3g0SnKBpzGNWyqLoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5hs/q9NxL12vrhL7CLss2+XL4VeCTy14mpj+T/lTmC8=;
 b=r7kC/GjvPIj5n2vq/aiClYBLN8Mk8tepYn4UovgNBXRZD0eVGbZifLzdXWUlPOYbB7U9PAHjG+QoXcQZkBEj+Q+RwN7YpWaoE6nqxZajL8x34mtn0of080dMoI2pkVeVWOiQ/WQigcDEtc/pftFKRAISc9/qGHlUchXE8H3mkWr4Iup1UITDA1JOuyOvlaDNmE3d5/VkKHzgoWeYr/MX71LEHYh+IMYzw3yj35nSoFtEiVaROnKgp1C1h1lLm28kEoN6nhIIDMs4TSgJH45hCIqdk7Sf5AyeqzeH8wC3XtZvukpS2EAyQxVour1eFqy0lGxuy/lbpkD0pxV3U1OfBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5hs/q9NxL12vrhL7CLss2+XL4VeCTy14mpj+T/lTmC8=;
 b=LjyYBdcoY07I1r7PXjqD8lWnvrjAWWhp0q+wNdRXTUonyhzRT0ywas609Sf0R+xiUdsXryU3wgZNhmPOPjOu793AouEOYLRZmsMtZbt+LEYBvkInEaFaVeH9dthdEGdXw1Ikyj4MbOBoW7Rx3HugqHOeuxyidUyOIGOQ+1x4B8A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 30 Apr 2026 12:48:53 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: bouyer@antioche.eu.org
Cc: xen-devel@lists.xenproject.org,
	Frediano Ziglio <frediano.ziglio@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Frediano Ziglio <freddy77@gmail.com>
Subject: Re: [PATCH] tools: Use posix_memalign instead of valloc for NetBSD
Message-ID: <afMzlcrP7phSirsw@macbook.local>
References: <20260430095521.8399-1-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260430095521.8399-1-frediano.ziglio@cloud.com>
X-ClientProxiedBy: MA2P292CA0011.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:1::15) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|PH0PR03MB6480:EE_
X-MS-Office365-Filtering-Correlation-Id: 1539819d-757e-48d8-97cc-08dea6a613e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	3cBb7T01G4fYTW8ZraxYjeOmkSVaIdDs/VFV0SoY6nTRQW2rDhNA/2dOqa1hIPcnVuocmPBm3G0S404FNKsRmb7zcVGrCCufE8Fhe7tzonalZMZWiMESs8Q/LCWptW4XXHWz+t+9LP/lepbBBVN3aAU/T5T8X3h2WGHf+cWmTEMlAsMFix0BGPUbAZI5KusxFbdyYN28O9YGSbfoKR2EX8RyedHszfgF5mUycXwj1VQifLHc8XrDUVlxBGkzIhWm4UMFrF5/wN28fxXdB1/C4u9hBhm305ygTOBF+ioCM8TfY+tvGmBNR3U/Iyy/i2kt9st9jQdlKtHSCiioBHti8esg+6VG0gw1ezVzvGEXXylwUEUS37YwgXrB/vjpImMSu22smHufNos2MgwGdcOpPnPu0TnSxIGO4NdEifdW9zwQnhOlhby78trJAaiIwq88VyP2wGx9n5NhUwuWg1aFd/+MgC4lPYIQriRMg7XtVfE1tValI1DhqUdbymc3X11TmiW4MgiCONtYyboL+S1aaNk6qKHTw3BdlmCleWS/1ThevBfqjJjUQKd8BQB8N6muh+eaF/Fn+RfWawMxg5D6ehDeiTwkPwHXll27kJDNuAp0gL4V7KtgeCy0ekwvPZdhjChhhx0783hTgFeqTgHW5Uu1bBI1hFdTiEWd3E9D5ATKzIh3op61dWNOUPIiXe/1TZtOFVwrlXRNmTQTtlr8VdZFCsZCXGQ4xB2XSliUsWM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T3FmdkZXeWZabS9yeTdpZktNODVZYUlnaDJGMUc0TnVQYjVseW1XQ1EzK3Ft?=
 =?utf-8?B?VVA0UXQ2MnIva1lTaEtSS1BxZ3VLa25XTGxOQTYvK0xJVDNQZG01TitTdmpy?=
 =?utf-8?B?bXgxY0hKd0FNaDRSNWFZWFVuWHZlTW1sSnZtakxGdEJSSXdZcUdmQU5kRGpO?=
 =?utf-8?B?U1hhQVZtaDNPTjZFdjc3THIwMkMxZzl5Q1MwWWhXejRBVUFIckx3YUxVOUM4?=
 =?utf-8?B?dnVwL2E1eG9hcEFqeERpU05TQkVHQWREeDY3MXE2Ujc4ZG9nTWt1Z3A5eEt2?=
 =?utf-8?B?QmtieUMwRjNKaTZrcjRzdUlsbXEvRHA1VGZKTGozb044Y2l2UjJhaW5OdzZy?=
 =?utf-8?B?aFJLODRoRldLb3pkU05Gd3J5MlR5NkpzMXFXb3ZCMkxsSnNTMUJEc2xFU3JI?=
 =?utf-8?B?ZzFKNHE0M3EzQlBCYW5OUnplTjl0bEVTYUpJdHJNOURBZCtGMytSUWZLK0Q3?=
 =?utf-8?B?VGxKY0JtcWtvcUFzNGlNamFGQi9GTTZjaU5YRXFwQUZpVTIyRndpR1FNZFpC?=
 =?utf-8?B?V1lXRFE1WDNVVWRKUGcxZVZBMHo4VnVubEpGTmxtMVRuREFKb2NQdjU1ZUN6?=
 =?utf-8?B?M0QyQ3dWbkZRanlkMWgweXJ5bjV0Z1BMRkFzODZ3MlZ3QzgwcVRoVExnTVVj?=
 =?utf-8?B?b1M4MldFT1dSTVRmbXNxbGl5YW5YNkxPZWZoRHBCVkU5cjZjREprSFBTV0dx?=
 =?utf-8?B?N1I2anJDVUtSSTdJL3RDM0RWOHpLRm56S2c5VlFJVEZCdTlyR2l6bkY1d1pI?=
 =?utf-8?B?dTk4TjFpV205K01VZ3o5T0tOTkhsMU1vMU1jMGVWTGx4RklxRUw5K1V5MW1t?=
 =?utf-8?B?Y2Rac0hPNDR3L3lya1c3cHVYWmEvVW90NTgzNXNaV1pWMDZQTGxFY3FKRHps?=
 =?utf-8?B?UnFFaVdxaGhTQ0x5V2cwaldIeGZSOVVmRGJ2K3Q2SUNiUUI2SnppN2pONG93?=
 =?utf-8?B?MCt1WUYxZ1BaeEl2dHVUUzlIaDNjd0QveE4xYWNzSnoxVWliazlZRW1ScjJa?=
 =?utf-8?B?NzgrL3U4TlZzdnJYaHJ2NjFrN3NSTkw5MHBZWGlJaThzWndHZUxkbCtqekZk?=
 =?utf-8?B?UEhZSFRCM3JGZnlxY3VqRk5HK2lMSk9NTDhhTHNaMDRDUmhjUnVQdjhtVlNm?=
 =?utf-8?B?UGRCa2UvNVNTMlB0R1NRdmM1VGU2M0dXOUZLQ0NLYUt2NGVQQWpwQU1pa2M4?=
 =?utf-8?B?bWNGRWZpejdNd2txZndDMjFNZzExeFlibjRBQkswZU9hQVhJUlJxWFFPL3ND?=
 =?utf-8?B?R25JYllDaHIxN3I3ZmI0d2hIMENMVTdzWHVHeDU3bkN2RFY4dDVWUGJyR3pa?=
 =?utf-8?B?YkxYdlRsR1lZcXJiRUNQY3hrTmJ4NGNKYWNPS0NoTUJUY1Aya2RQSUo3elVT?=
 =?utf-8?B?OC84T2NjNTZ4enVrK3Y1VldaVkkyaTZTeWdWZ3J0cDdRRitDNEVjcWE2MkdL?=
 =?utf-8?B?aVkxL1FXblU4ZU1zbThrMlo2MGRmWTl0bXFsZEFNRGZJbmJacm1HZWN0ZjRI?=
 =?utf-8?B?dXgzbFYxK2E3RDRoc0N4T1pqQWp4dHp2QjBkRmhZKzZ3L3pkOTFZUHJXOXRv?=
 =?utf-8?B?czZsNWVJZGtqL0prMmhyTDZBQWJkamZieXBQdFBSb3BSajNsVERENFBQYzU0?=
 =?utf-8?B?SXRjdE5KREtYZlJJOFp6MFdSNk92QTlxMy9kR21STUhFSVVwTXdLYXRxdDdq?=
 =?utf-8?B?OGMxUkF3WnU5dXB0c3RxRXpCQXlSY2tzRkg0U3YrbnFZcWExbWZIeDVpOUlQ?=
 =?utf-8?B?SnNiWGhXZGluUmNIcEVvVWg4a0kxSzdReW05R0RGb29wWUFTemxKSkNKYlUz?=
 =?utf-8?B?WUFISmJhVWhOQ2JlTk0zUVp1K0s2OTN5b3RJOHdja2h2S0Fjck5qV3k2NTRq?=
 =?utf-8?B?Y0FyOGFSQVNuMXpyVTcvbEVlK1BvVERSOGFxd242Tlk5b3NZZ3FxN1N2ODZh?=
 =?utf-8?B?c1BIK3lZZ241Mm5EZ3I5Ymk5M3lpNFQvTHdNZVRmblAwc3djMVhUSmMvMkM5?=
 =?utf-8?B?dHYrTWkrZmNHeHlwWVM2VkJzeHE5V3Zrb0paYWVyVjZkYUhYSE1MRjV0MzJZ?=
 =?utf-8?B?eEdzQ3haTWlHelhoa0Z3SFdvdmF1akRNZ1N2WXJwSVlIeDJmdTY2OVlIVHcr?=
 =?utf-8?B?Q2lzUVg2Qm5TSHJZOXQ1WTBNMUJ1SHd0WUVncXF0L2dwM1BtRFJKM2pQU1dT?=
 =?utf-8?B?bTRpMm9ra3pmTnBOOHJyQmp0U2JnYnVWR1NWallBNmdGWVNSSkwzRG14cnhE?=
 =?utf-8?B?TTBRakVKRFZGeDYzU1hKd2grSm9BNHI4VHMyeWxFQ25nZ1Z5d3JuTmdKcG9P?=
 =?utf-8?B?alI4NllpYkZEcTB1MktoNVF5QlB0UUd0b1h4WDhock9BbmVKUXV0Zz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1539819d-757e-48d8-97cc-08dea6a613e1
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 10:48:56.3540
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PgTBapcGCRJVAv0/OjwPa3l4hBcBzTsl+fbItmVYRJR5EZShhnF6AU69ZB7NvDOv2loeQQ5Taz6e3LTJ4cKFWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6480
X-purgate-ID: tlsNG-d25034/1777546140-6F97DCF5-5F990528/0/0
X-purgate-type: clean
X-purgate-size: 1758
X-Rspamd-Queue-Id: B33C74A1052
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,cloud.com:email];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,cloud.com,vates.tech,suse.com,citrix.com,gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bouyer@antioche.eu.org,m:xen-devel@lists.xenproject.org,m:frediano.ziglio@cloud.com,m:anthony.perard@vates.tech,m:jgross@suse.com,m:andrew.cooper3@citrix.com,m:freddy77@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

Adding Manuel that maintains the NetBSD xen-tools package.

On Thu, Apr 30, 2026 at 10:55:21AM +0100, Frediano Ziglio wrote:
> More similar to other implementation.
> posix_memalign was adde in NetBSD 8.0, released on July 17, 2018
> and went out of support on May 4, 2024.
> 
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> ---
>  tools/include/xenctrl.h     | 5 +++++
>  tools/libs/ctrl/xc_netbsd.c | 9 ++++++++-
>  2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
> index d5dbf69c89..f4316089e7 100644
> --- a/tools/include/xenctrl.h
> +++ b/tools/include/xenctrl.h
> @@ -1390,6 +1390,11 @@ int xc_lockprof_query(xc_interface *xch,
>                        uint64_t *time,
>                        xc_hypercall_buffer_t *data);
>  
> +/**
> + * Allocate memory with a given alignment.
> + * The alignment must be a power of 2 and at least sizeof(void*).
> + * It returns NULL on error, errno is not set.
> + */
>  void *xc_memalign(xc_interface *xch, size_t alignment, size_t size);
>  
>  /**
> diff --git a/tools/libs/ctrl/xc_netbsd.c b/tools/libs/ctrl/xc_netbsd.c
> index 1318d4d906..d27154dce9 100644
> --- a/tools/libs/ctrl/xc_netbsd.c
> +++ b/tools/libs/ctrl/xc_netbsd.c
> @@ -60,7 +60,14 @@ void discard_file_cache(xc_interface *xch, int fd, int flush)
>  
>  void *xc_memalign(xc_interface *xch, size_t alignment, size_t size)
>  {
> -    return valloc(size);
> +    int ret;
> +    void *ptr;
> +
> +    ret = posix_memalign(&ptr, alignment, size);
> +    if (ret != 0 || !ptr)
> +        return NULL;
> +
> +    return ptr;
>  }
>  
>  int xc_pcidev_get_gsi(xc_interface *xch, uint32_t sbdf)
> -- 
> 2.43.0
> 

