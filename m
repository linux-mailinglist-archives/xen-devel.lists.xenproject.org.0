Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFIyM4S8w2kRtwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 11:44:20 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AF8323358
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 11:44:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1261976.1554694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5LiZ-0007nU-0H; Wed, 25 Mar 2026 10:44:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1261976.1554694; Wed, 25 Mar 2026 10:44:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5LiY-0007kr-Tt; Wed, 25 Mar 2026 10:44:06 +0000
Received: by outflank-mailman (input) for mailman id 1261976;
 Wed, 25 Mar 2026 10:44:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1w5LiY-0007kc-6G
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 10:44:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5LiX-004OXw-Hm
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 11:44:05 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 69c3bc6b-e002-0a2a0a5209dd-0a2a450cd3e2-36
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 11:44:05 +0100
Received: from [40.107.209.52]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 69c3bc73-f93d-0a2a450c0019-286bd1343153-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 11:44:05 +0100
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by PH8PR03MB989114.namprd03.prod.outlook.com (2603:10b6:510:3a9::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 10:44:00 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%7]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 10:44:00 +0000
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
 b=qWJP3kXCj3P7TPvytByX8eJWCnhfBndLgLCofuCSi9tWPzpn7arnVb4orIffkb8+4gE+ixqHZAPTXiahlpoK8YOrDqY3YkjNmhBs3AAREGZ4w6Y41AieDI4O/ei9HVo2lpEweeR4ZZRmA5Ab2tV2EKOTA59UyarlAtsmb5nncJthXRC3Du7zONmuEU71jYxtc31UlQAj10sn+keG6AUav+ImvtfuB7sT6PyWzhywQhIdNorDI6L8gqWcDxLOF5e8P1LwezoXtCEXVwGo/45MYJJe7idI51/q2UlDZw1nF4lOs0JLHCi2rWmx230oTFyOntFW2PYfxMFca1CziA51vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TrJgTBO+HgAU7k/miMlhva3uK06pR6mN0D9/No30HM0=;
 b=uOvs87Z1f5IP39MBnsEVrnnxmHUPG9O6tjK0i0kAicO6TBnRyuRd5cjQL6EkF5lFc9RpALWAej/T2WFRulNFG3xysnYZqtG/CYTFUnyAIjlIXzOlb/2ydRut5opGjypJdx1oGO0312DAzWPDDz/Vpma6Uocb5zBho70bAqkLXdfEk/WcAFwqaW4ZQ5ePdQctUPI/AeZEc++u4BEm8k/rHAdKtBp60Im78J1QG2XbUTXPes5x8gAlUXn/NW11Oq8o2gFfbehRs9n87pMDUghdwuLcjcyZnqPVnHjFMcnVQ9+AijKEXo1widd9LYm/2q0qIzDLO1+iqlfqsi9y/TH10g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TrJgTBO+HgAU7k/miMlhva3uK06pR6mN0D9/No30HM0=;
 b=qzovahlnsdn8J3+OCFtnDBuNY4iW1Nc4oA8e2AAqN0Qb/8Hq2kqAFdvBen8Fsh4eBUyisKW72M/mBFbX+S7V/aeJmIJg6n1azuR6hgV0TuPhb7TRzLLgZIM0QoFVNns1WpGBOr1Qqd0mC0/Fs+SokfUh394J3bh6eOPhRC0UHso=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <3305f87a-2279-4a61-afd4-f85ce8001e6a@citrix.com>
Date: Wed, 25 Mar 2026 10:43:11 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/9] x86: Remove fpu_initialised/fpu_dirty
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260324181937.2465574-1-ross.lagerwall@citrix.com>
 <20260324181937.2465574-8-ross.lagerwall@citrix.com>
 <33af69c4-3e35-4baa-abdc-57902a0db4bc@suse.com>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <33af69c4-3e35-4baa-abdc-57902a0db4bc@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0299.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::23) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|PH8PR03MB989114:EE_
X-MS-Office365-Filtering-Correlation-Id: 7966cee8-a507-45fb-d4aa-08de8a5b6cdd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	jgZwMn4aU/XFDQLsvnQBN+qK92+6M40xBrUoMnMCWeTapaTHRiO6RF7Ars7c0YJh1uqjSKlKpEyRv35lJ9A51M2dVgXOMkFReiDxScSbsG4X7+YDKddG+e1fbnHaKmzUcopLm5eiGoztSEE2lHeifcUB211zseK1Ki65ipT7qOC2xr1hPCQImq6VNMNq0hYnH+bZIVitMKdSPWHvHlle3Vv+3dkZAVyQFFxssQ+/QLLnk9UaJHYoWP5JLUiyZ+zsZvm5kTX2T2LWfNP/5nsuYlIdI5GMtYWGdyKDsRgf1yr8HuNuXwMmCbhI4HDDA15nqYlNiapurDb6U6YcHPit1foMa2QWXrieqCJxBNXJhXXQzXiWfBfskcU1UW/wtY8FP2x4/6nMFmWkpi3vjMDGTCV7o6d3jG43NldW5I8d7kCZDyo9nY4NQ9QPGBNEd+ieV7MYErne9gZisBBRF2taew8c61yPD5wYeWwJNcmJN3K/FPxM20vhH8maEVKUDe0C5Ft0p8q02GS0Qel0JyChxojo1fDaCxoXCD4bPnlf60Po/PkjLf0ZPYHWpNZ5PYbo1j8o9mXN5/1GocNTNsj8qsk9h/tL7Hudmk3jaZvQW69vvRAMIms07WKoWkTEKdzsjmy8tVK1MrYXvBNX/E6IFve/gDKkqLotGGcapCzuIo8IBpd/K+6wA7AaVuRpESWq3exIsStQBGjVZTiPIy5f2Lv+u1EZkLzUQYBjanzWTZk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VSsxK1UwamlSaVQxa20zblBVU0QvVklDbXFXK3g1Y056TCtFYnFJZCtMc3lK?=
 =?utf-8?B?NWk1Yng5WE0xMVpiYys0V0ZXVlBEcElhNStNbkxMM1VsTk1PcUZUZnhCbXRM?=
 =?utf-8?B?R0t0RlhFd0xWbTh4cnZUU05sQ1hWUjdOaGt3Wnk2NUkyS0Vub0kvcVNIOHd2?=
 =?utf-8?B?RU1lSFkyWFVqV0JBNW9yeHJYZ2dKOHF6a3duRnRZSFF1VDRsS2U4akM3a0tu?=
 =?utf-8?B?MjdzeHNHQldYbFl6MmYvU1pIb0d0SXN4TDVhSmNHQlMxODRNK1dqUEpxTTdW?=
 =?utf-8?B?QyswK3RKQ1hGZ2xLdWkvRHg2OFhJL2dpN01qWkxKRWU0aEp5dFUyQ2xkeGs1?=
 =?utf-8?B?MlpTZ1VpK25ERWVEUzdBNUx1bVMyTTB6RGljeTdoZ2ZsQnd6MlF2bkdURzk0?=
 =?utf-8?B?RU1yMHV1ZG1vdzVEdVM5M216ekFoQVcrT09BaGJ1VFMyNEdSQkZKcklrT09Y?=
 =?utf-8?B?bXA0UWVFM3J4UmErbk1ibkpNOXdIZ2tiekZmaGZjUmFJYnZIYW00dy93eEJS?=
 =?utf-8?B?RXhtZWNSbWI3S2Y5Y2phWWpNc1U3NWM0RGZWSkJ0OGlzSUVWeVRqVjFja0tR?=
 =?utf-8?B?VktIbHdjUGplZll0RWtaSDFtR2ZlMytPWlNmaGIxT2xLNTNhSytXRWhWN2dl?=
 =?utf-8?B?VHZiMzc5UlphM2tRMExHbGZyeTNXVldSZXl6SE91NG83dEJTK3VEc3E2Vnhr?=
 =?utf-8?B?OWNFN2xUQjhWSXZYRE5GUWlSei9vc3JqM0YxQVJJVUtMV1h1akRqSjhVZVdk?=
 =?utf-8?B?MlU4cXk5Tk45Wk1UWXFRTjhaVDdUSWpOWW5qVVJsVWxUWEQ0VS94T3l2SGdi?=
 =?utf-8?B?V0RWcFdCbXlkWit1U0NUSURTOTVVSGJLQWtpay91NDZlQnVsU01yNDhKODhZ?=
 =?utf-8?B?R2ZvZkRjUGlVWW0rMWVyckNmQVZVaXBITFFWMDhuQjB2em5UZFBkQUI4c2ZE?=
 =?utf-8?B?UW5MTy9QSFdBODBDb3F2WnN1R1pzWW9jbkk3dHA2SVBmQUprYithdEtZMU9T?=
 =?utf-8?B?WTFoTUlsYnIyV3dEMFpEcDVwRzlSclh4bUxrcEFBVklUd2pKTkw1dkd0VURK?=
 =?utf-8?B?NGpwRDNXOSthWVVXb2FHQktCY3RnaVF0cUFMZis5MnBzSGJjRlp4RUl6NFd2?=
 =?utf-8?B?YUFBRzRnWE15OU5LRW16c1JwRFdYQyszUGJNWkk2N3QvcGRZb29LQllhNTh3?=
 =?utf-8?B?NVk5bUd5NE9kM1FyMGNVeUNLdmdHK2ozYnRvWGpxNUN1aEVsODZ6QjNabmh1?=
 =?utf-8?B?MXJobExVWTlUY1JCU3ZIUi9BWWpOT1RINEl6Y1ZaNm52ZzR0OU5BTzVoUzJO?=
 =?utf-8?B?akRlVE9tWjNBY3kvRU42TTlyeDBrNzUzUnRhdVlYbG9JTklZZGxnN3lzSVhW?=
 =?utf-8?B?ZzdONmJJRUVXeWRvZG9JMDRHT015YW9HSnJTUnFZSUUyMDM0UWtqZFFnRmZp?=
 =?utf-8?B?TjlweVhUUXd2RDhkNW01dWxaS0ZoYlFna3ZHc20xd0Nud1lmSEhqZmxFaDJn?=
 =?utf-8?B?VVZqN3lONXR6WHlvTGhjemxEQWdpd2Z1VFh3MEd5ZVBlYm9uQjU1UkpSdXVo?=
 =?utf-8?B?aFJxWGZJU2p3VzhPbTJqdC9CZTdIV0hhS1IxTkEraGpDSUkxQlRqRXE3cHhI?=
 =?utf-8?B?M09oSWFQSmxlbXlXZFdjNzRYUlZNclp3cjVsYjNvNW1TSlhybklHYWxHT1pH?=
 =?utf-8?B?RHBMb2JLTngxU045WHBWUGFUQkxibFBMWkpsMU4zOVV4cVAyNWQ2aGF4NGVV?=
 =?utf-8?B?ZUxMTmE1ZW96RTc5QThyMHkrbVN0U3U5dUZaclh4cTdpdlNSa1ZqNmhKTXpR?=
 =?utf-8?B?N2hVbGNlNDh2c2RQbGkyOXRXRkd5d1o1RERFR3lZeitKMDVOZkczd2FzQ2VH?=
 =?utf-8?B?VW1Ga2d6aXVJQmhIWk90bVhyUHNzaFZXOWdTRG1OVkZHUEQxWStFcHh0djRH?=
 =?utf-8?B?c0ZGclA4WkM1RWFWbFFJS3JqUjRERkRaS0NwVnRIS00xejRvcDZ0aVZ1V0tw?=
 =?utf-8?B?UzYzV0QwRWJOUWtRTTNqQUlWL1k4MTlES2t1c0xKSkpUcnczM284aG9HYXQv?=
 =?utf-8?B?aG5Md21IaVJiUERDL0hRRGk3SEdFTkZsVlpIRTBnejVwZUpmRlFqaG82MEZV?=
 =?utf-8?B?SWVZMnA5YzU5aE4yMlJmY1o3QkR1VzhkR2ozNnMwOU5ibHNaUWxzcDNpM2xI?=
 =?utf-8?B?RmdHeXZjSFZKUGRuSVRwMVZqaC9sUmxtK1Rtc0hTaFVya3owZlNuV2dydDZH?=
 =?utf-8?B?ZnFibng3S1FQOHRXTmdUbkpKckVRcUFpYVNkcVpFZFI0V2l3T1RTL25iQjRX?=
 =?utf-8?B?dmJHU0c0OW5qZmI5alZQN1lmK0lQNzNVL1ZOWXZRWUlOTmM3ejB6VE9KTFdR?=
 =?utf-8?Q?SxHnzI9JGwC3L1Iw=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7966cee8-a507-45fb-d4aa-08de8a5b6cdd
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 10:44:00.7902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mNggJVhZyrMJ+opPDA3TbAmelV/y2y700do8xhdZMBH/5kQ/3nFpINv0q81QR/kna4wOBP6tfTADSACf/WXM0V4PNsAZEVs7qLCmRffu38g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR03MB989114
X-purgate-ID: tlsNG-d25034/1774435445-FC82D734-0D45BF07/0/0
X-purgate-type: clean
X-purgate-size: 716
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,citrix.com:mid];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 35AF8323358
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/25/26 9:30 AM, Jan Beulich wrote:
> On 24.03.2026 19:19, Ross Lagerwall wrote:
>> --- a/xen/arch/x86/domctl.c
>> +++ b/xen/arch/x86/domctl.c
>> @@ -1409,8 +1409,7 @@ void arch_get_info_guest(struct vcpu *v, vcpu_guest_context_u c)
>>           c(flags = v->arch.pv.vgc_flags & ~(VGCF_i387_valid|VGCF_in_kernel));
> 
> It ends up a little odd to clear VGCF_i387_valid here, just to ...
> 
>>       else
>>           c(flags = 0);
>> -    if ( v->fpu_initialised )
>> -        c(flags |= VGCF_i387_valid);
>> +    c(flags |= VGCF_i387_valid);
> 
> ... unconditionally set it afterwards. Could I talk you into cleaning
> this up right away?
> 

Sure, I can do that in the next version.

Ross

