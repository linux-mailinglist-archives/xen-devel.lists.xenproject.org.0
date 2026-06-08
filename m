Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RKI9FdvkJmo9mgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 17:50:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E21658578
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 17:50:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=i+GnnjAA;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1331983.1594626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWcFO-0004Z9-Sr; Mon, 08 Jun 2026 15:50:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1331983.1594626; Mon, 08 Jun 2026 15:50:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWcFO-0004Wz-QA; Mon, 08 Jun 2026 15:50:42 +0000
Received: by outflank-mailman (input) for mailman id 1331983;
 Mon, 08 Jun 2026 15:50:41 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wWcFN-0004VH-Dk
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 15:50:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWcFM-004efW-3k
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 17:50:40 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a26e4cf-bab6-0a2a0a5309dd-0a2a450be326-2
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 17:50:40 +0200
Received: from [52.101.201.36]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a26e4ce-212f-0a2a450b0019-3465c924aff2-3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 17:50:39 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by LV0PR03MB989297.namprd03.prod.outlook.com (2603:10b6:408:398::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 15:50:36 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 15:50:36 +0000
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
 b=xONYVXs7J1uREFNrOuQNH71piK2u7ajACkKgRqqkw4V29cNtZm2OhegGN+pcIjadZfPtsyVffMvqXd3RXgDGn/NlQww69bYD9LuhW6NI5fvbiq97Td79PXc7rtNZT5iQ0nIsLJw6rYPYeM5VjvUuRkYeieWWaRpqV+mIz81iW/a7B2gL2EiGU81I4IvukLHygZaP0P+vzTfhPWaTJmzWLoU4vhYa+UJ0rCBgwNcvtRHGUFN2e2SJbKypWREesSl4P8HWnWsrvtYGz0xMiw6WqJ29HOUizkCz0H6FjNA1Yg0jQ+B0x+ZKtyQNdo8rLkdQ91z61LG5EYQt1HhIy0ntEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dXlSkZFxGEFH2BV1lVRsWxoYVAPbMpGtmnx1z0ApjqE=;
 b=ib9c1MA0BDtB1FEOd/Ll6AUvMRn1GNmAgXU+cPtDY0Gc9ndrvxX5HMTRTQTgnufODVWfalAuWgce31kIJtbU+77zXPVRhbA+WsT7/N26c0ELZpWZVnkA33AHuH8podOnqkq8fmg9dJO6oGWBshFUjMb2goibEei8/oFTCVQnn2CwMj6c9tGduRnVfG22nX2br07fUlhYapFAyt8GpNoAfT0UckQR0QmEwbDumVScBfB3AbltdJzibgmGsji7rhSMrGGrTPtLK56CDFLbTbVpvcvdHF/RZysK28tJilMo/q5Ep8EOxmQqFcrit9SoSu1XXkn7UDUPoV5jaXNG+iLArQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dXlSkZFxGEFH2BV1lVRsWxoYVAPbMpGtmnx1z0ApjqE=;
 b=i+GnnjAA3scUNCZz2Nn85iC0WwviAkiXbULqFSGyCglbC4jnvRetOIJuxrvDNpEE0BX4WHlBEQW9Yh8llKswLM5IF5JB4LCA2bshzk49ruCfYDXYjD2XmwaDrCsICcn84j8LLPs6ON+HiE5zEwukTcqYBPpdb1UGoh0Md7bvi0Y=
Date: Mon, 8 Jun 2026 17:50:33 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Frediano Ziglio <freddy77@gmail.com>, xen-devel@lists.xenproject.org,
	Edwin =?utf-8?B?VMO2csO2aw==?= <edwin.torok@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Frediano Ziglio <frediano.ziglio@citrix.com>
Subject: Re: [PATCH v4 05/16] libs/guest: allocate various migration arrays
 just once
Message-ID: <aibkyQAefTHGsWsk@macbook.local>
References: <20260603130603.776452-1-frediano.ziglio@cloud.com>
 <20260603130603.776452-6-frediano.ziglio@cloud.com>
 <ea002cf0-c2cc-4612-af61-8dba7887af61@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ea002cf0-c2cc-4612-af61-8dba7887af61@citrix.com>
X-ClientProxiedBy: MA4P292CA0002.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2d::19) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|LV0PR03MB989297:EE_
X-MS-Office365-Filtering-Correlation-Id: d8f2bc92-079f-4387-a2d4-08dec575ae71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|11063799006|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	V4Hw0tbrjhEZd16R8Jf1cZPE1UmuOsDJnw+U7lt2SmkMH3oFWtKk5Dhy+Oa91Lob4pgPbmWpJc7dVzKU1IhU52ZgN69UWHA/Mw6aFnYxKKUuP2i3D2HAlkelk3FNqAT5lArBv8lfcXakmvguoC+n9t/nTp9/1flUYkv1e/J66zYKlu6oYquZeBgX1Zhb0V8L8lbeUCrI9WsUqUdCUFoJhzDmD2Oz7y3z9vD0SRNLuE/UiIawIqfyij++iqRJljNps/BggCcTr8pmpYCtgWK1RYVV3m+3bUt5nHG3Ru34VXs48doCdTearZGlsdxlpWMHYnwVN1fNHm6KfKTnR+RB37hDokdU0a9Q5Hx/iOZexYKMisPwNiZUjeSEcEU4KYzXfenKkW6XkbotHqaVEYXm4oQt4yR+Hoc86hXaXEveamZlFS04tnU/Of04FCrqu7obQXVd3uKUvku980wV0ikQlBxCqNYgVShImMB40S/Qb/Mc+/t5a5acJ9ntcVQLy7sJuo9Yw2R2u4Kr2Gt7RsHQpvufuqA356rWyI4MpzU0Fyy4Rhf+XyDvFXhZDnrKhHMd1VrIwFWpRu8/BoaskTjy8ER/x81oyxQ3Go+nWkXdXequ9h4+55byVR54ZR91MxtWOLrE8iv/POgQeuITmppIUwKxmO6L5LIG7+PzEz/Lkb5AhaY1xxwGfr3o+fpvtZmx
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N29WZ0l1MW81SHIzVGZzeDJQTy9UMlA3Mmx6bHBtTGdQbC9iK3Y4MlBWOU9a?=
 =?utf-8?B?Q1lzM0daQU1FakRuWVdSZUFwYWtJSVhSOElObVpsb0xQNThHOFBJakxYWHpD?=
 =?utf-8?B?R0dtc3pOOFVHL3lMSXJsY0QwTTNtVGN5a3dHYWlHcjVNMFY5QmJkeXd5K3Rp?=
 =?utf-8?B?d1JCTHNxZjVBU1MxTkFpYzk5eERJaS8wQnFlUkUxMmtUUGdDV1d2UWtGbmxx?=
 =?utf-8?B?dXAvRmVhcEFlN0x2M0grZWZ6WjhKUVhYRlJiOEl3U2NoMkNTQ0toOEZKOFZr?=
 =?utf-8?B?ZXBmN21RUEt1Q0ZldFBvdEhIYkVmTTlpTFkyaHhvTmdPL2xvT2wyWnYyOWxW?=
 =?utf-8?B?blNQVEI1dGgzakRweDhseE81T2N2SEh4aGlQc0hlTEs5ZU1ud2gxMm5odk1J?=
 =?utf-8?B?c28reWRlZG5hMHZlSWJSQjZVbFhtYnZQUmVTd0QxNmlZbDNaMlBhQ1pQZW1x?=
 =?utf-8?B?Y2ZHUUVVZHpGTDZRQmJKN1pHaWp1bWFwNi93d0NlTXJYRzZHQVd6aHFyQXkr?=
 =?utf-8?B?djA0dyt6OVRpaHozcHhvVFRjUEM1RFl4cDBsM1c5dXI4bHcxK0luWkIvc2Jq?=
 =?utf-8?B?a0pseTd0OFMwakVYdzZHZUlJcUtPZHpFR3NnRXpoYkM1YWZZcWo1cW53L1ZE?=
 =?utf-8?B?Qm1uQWZUQmxWWTRDcGI1RktJMTdrc1pYYVVtU3RKWWtYejdrWnJaMlNzZ3k4?=
 =?utf-8?B?SDFtMHh1K25IUlpvS0szSUVWWWZmVlJRNmMrYzA5QWFzdVMwalZrbisrd00w?=
 =?utf-8?B?TGhxd0lBSHlZMzc1ZzJpcnpNTUNUWVYvdktnTnp3UTZNQmVrM2paN3B3MnI4?=
 =?utf-8?B?d3BGTVN5Szh0M2lZRFJGUWYyK1pIZEd3Tnp5RDN3N1lob3hqOFJ2a2NCU3NN?=
 =?utf-8?B?cmhUL2tzYU82WEo3TE1VMC9NRW9WRnZUSkMyd1EvWVlZZ3crWUFZamdqcmN1?=
 =?utf-8?B?MmpCY1U4alVPKzMrU2ZKc0pBWER5d1k2VndvemNUaG1UZzM0SExjKzFGQXRt?=
 =?utf-8?B?OVVsQW9PejBJQm1ENk9mV3N6bWhWaHJ1K2g2N3ZKaS9zUVJtak5OZ25PeUZx?=
 =?utf-8?B?QzlVMkRMQ2F4L2ZDSG5sYXM4ZzVhb1JFWjc2RUdLUFhieERCQ3FSckJBZGxl?=
 =?utf-8?B?K3FTR3M1MFp3cmhnenVMS3QraTJ4YkUrTy9TMTNFVEs4NzUrc210Tkw2NUNt?=
 =?utf-8?B?YXRuSFN1UFZDU0lKd0prTjhWbmJWUkZVOEx4VWVVZFR5QVd0a04yc0pxWUhi?=
 =?utf-8?B?NUxnK0l0ZFJ3SlFBelhVV3p0TlJqcUMyOTVVMVUzV005WG1yV3hDeFA3Z3hR?=
 =?utf-8?B?MldwaFU5UzVxYjRRNU1Fb3ZUQWNaZDI1YVJaKy9LUllDbXVkbjdIK0tDNGRT?=
 =?utf-8?B?ZEhXMkRhRHFPM243ZEhibjdiNEVLUzRnMGtCMlhQRkNOWEhmNTNoRlhNcWw5?=
 =?utf-8?B?VkpXek0zd3dXNkZBTWVOL0x6QmZRam5nblI4b0JseVYxYUlSa2Z2RGVnNjJM?=
 =?utf-8?B?UmpnZjJzemt2aEpsUFRMTWpoSWxhZXJlOXRmcUJMN013T1hhdFBQTDZKYnRN?=
 =?utf-8?B?MmpEczJoN3B2MmNrMVVaaDE1Sy9ObEdzdzlVdDkycWFEZjU1ZjJGSkd3UUlW?=
 =?utf-8?B?T0NQVkZrdllQMFdwZjVIYXpFb0g2bDhLMTlTVlZkdGhSV01Wc0VBK2ZaWElr?=
 =?utf-8?B?R3l0L0NuVnYrTi84bnN2M25PQWRaWFRFWFM5bmFBMVBTOGpZK3RoY2ltaDcx?=
 =?utf-8?B?cDg2L0pUMFlBNW5rUlE2TnNBK0NJS3BMaUF2YWllRkpMYVJrdDltZjU4WlJs?=
 =?utf-8?B?R3V2QlNaRlZqTys2WU13Z0hNT1ZCeEZrT1JBakQwYjliM04yQTBRVWNURzg4?=
 =?utf-8?B?NmYxbGlyL1IwUEhsNFJuOEhWY3IyQWVsSlJBb3JPUnBrdmExRXlOSVgvcHpX?=
 =?utf-8?B?bjZKYmxhdFNQYTFHUlBZcXZ1a0t5RU1zbEVRR3FhaXplLzREQWc0SXVuMmRR?=
 =?utf-8?B?c1N1cEFIRjVrZThCc2VKTEQrQUs4eXpndTVmM09MT1RudTdIYzd6RGZFZGZN?=
 =?utf-8?B?enRQNzNPaENHWURuUnNzL2FhNXh1Y1d5ZzVaTzhLK3dudjVhMThma2Y4a0ZX?=
 =?utf-8?B?SzhNSEdFWWRJcUZ6SGk2QzBucjQxR2NyZFZhSjVwMkJ2YUpXUTBqSTUzYjNQ?=
 =?utf-8?B?b3dVQUhUNW5HYkllTzZsNFo4dStVb0ZCU3RBTmxZYU5hY0JMUHZqZ1U4NjZH?=
 =?utf-8?B?UlczcDN5SVhINGNtQXdWNS9uZFFneEZUdk9mUGhZNzBRRTJaNDJ4WUVFMjVn?=
 =?utf-8?B?RFdadEdiZnlYUVU2V1dMbTd3TzRBbW9DS0U3WjZHUTRpZjFLaUVtQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8f2bc92-079f-4387-a2d4-08dec575ae71
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 15:50:36.3849
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6JlOKBLGuVCHXvqDMGsTXv/opveWERIheYCorTeogmegv4S81qGWdBWBQukJJDaOW8YgRNL7BO0VaJ6Aew6bSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR03MB989297
X-purgate-ID: tlsNG-42698a/1780933840-19165F3B-1933CD71/0/0
X-purgate-type: clean
X-purgate-size: 734
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,lists.xenproject.org,citrix.com,suse.com,vates.tech];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:freddy77@gmail.com,m:xen-devel@lists.xenproject.org,m:edwin.torok@citrix.com,m:jbeulich@suse.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,m:frediano.ziglio@citrix.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A3E21658578

On Mon, Jun 08, 2026 at 04:36:54PM +0100, Andrew Cooper wrote:
> On 03/06/2026 2:05 pm, Frediano Ziglio wrote:
> > From: Edwin Török <edwin.torok@citrix.com>
> >
> > Allocate these array just once at the start of migration,
> > using the maximum batch size, and free them at the end.
> >
> > Signed-off-by: Edwin Török <edwin.torok@citrix.com>
> > Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
> > --
> > Changes since v2:
> > - change prefix in subject.
> >
> > Changes since v3:
> > - fix comment style
> 
> These are intentionally freed/reallocated so valgrind can find overflows.

Hm, then we likely need to keep the current behavior for CONFIG_DEBUG
builds of the library?

Thanks, Roger.

