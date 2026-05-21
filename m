Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJBSHCHlDmopDAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 12:57:37 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A31B15A3ACB
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 12:57:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1315050.1584946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ15P-0006ah-9Q; Thu, 21 May 2026 10:57:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1315050.1584946; Thu, 21 May 2026 10:57:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ15P-0006Yr-5I; Thu, 21 May 2026 10:57:07 +0000
Received: by outflank-mailman (input) for mailman id 1315050;
 Thu, 21 May 2026 10:57:06 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wQ15O-0006Yl-17
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 10:57:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQ15N-002gqJ-3d
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 12:57:05 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a0ee500-2eae-0a2a0a5409dd-0a2a4502bad2-2
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 12:57:04 +0200
Received: from [52.101.61.70]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a0ee4ff-af86-0a2a45020019-34653d46b95f-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 12:57:04 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.16; Thu, 21 May
 2026 10:56:59 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0048.016; Thu, 21 May 2026
 10:56:59 +0000
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
 b=glEnk6R6Tkqrt3HbT83EyYWawzR/ZtmZ3bX8nDsPM7p/mHmeYXO53+7MREFqz2MlcsDJ6KdvKDNJES+Mqefzwc/WJ4ELQ+xxohKgBox5Wnr7lfmO6XE2vZRXAA5wL7PuuOPT2INN2aWS0Vtdk3CsEUUkXye5baNg7V6NokfSakIGaoFrIXWJnlgiWJTbAWtQ9oaBH+vj4zNVTZGcE7auN8YWQ922B6UrNjRIJRKgbZN81ra0oxxGcdU3nn39vmH+4F82cNcEn6KdpTs5Xfh6+Z8zB5GwMDndnXYXsNCW6ujGb37cOmDcoM1fWRqIlFWaJqYaK3ujL9d6K3vh8VyGnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tRwtYSYtMgk0I8R4REhXCzMmlzlRlsFEgWSmblqzuF4=;
 b=YYUSF825mDO0rlZmKNPZuJkf0TResk0zFxL+rOF/JKDuQAXYW2M4dd+DopdU4k2yGUvNtDTGJt8kRTidWUqTM/TmvO7WpS0sYwy8yexR+WHbcTPWtVx0OpI1Fo+8d0D2IYeKxdkUqHBFWjtyuAqGZmMzxq8a27+2I8aXbjF8ZSZkFqcyVFqWSUvt17GPyDC6zJZBg1a9rB68KNQWC3BQB7JgckT+5rThmdY9759eFoJpopGZSr7F8kfd3k+5arvIW0UQ9FZZSdALsFqgcgOs7bbJjoDs7sJvSO476oHZ0nyByW6nATo6elG1sV0oesDyHzn1gyi9Et8RGjrY6oMStg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tRwtYSYtMgk0I8R4REhXCzMmlzlRlsFEgWSmblqzuF4=;
 b=SbcY926lsCf9pWoEm8zsw+Za0eylU+boipLptqy0UvhhEb10frKqeF9LO0VvQr7lyxy60Wi1qA4kAZQtFjOWUYsBh6NpNSHGXesYJ9mI9dBiGCzh9n+3t0kvfDst8cOugfW99FPa1oGGcp6e3A7RimmBEdFVG+Su9bzMQpiakqg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <bfd37118-d955-4faf-b2d2-94a301f5018c@citrix.com>
Date: Thu, 21 May 2026 11:56:56 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] pv32: Fix bogus cr2 on fault in emulation gate
To: Jan Beulich <jbeulich@suse.com>
References: <1779292317.8631fc262581453bbf619ec5b2062170.19e46162869000f373@vates.tech>
 <0e23078f-30e0-4077-be1e-365a265603de@citrix.com>
 <1779295699.8631fc262581453bbf619ec5b2062170.19e4649c100000f373@vates.tech>
 <9a6f4d03-651b-449a-80d0-35077170c8c8@citrix.com>
 <09a27cbf-065a-44ad-8956-18f050202822@suse.com>
 <340a3b2b-23ce-4039-8d00-5245ab252164@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <340a3b2b-23ce-4039-8d00-5245ab252164@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0465.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::20) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DM8PR03MB6230:EE_
X-MS-Office365-Filtering-Correlation-Id: 54661f46-7522-4839-48a1-08deb727aeb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|4143699003|11063799006|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	EuEgfIxyxkd0gPOno5dO5boV/YJegjBYiEksnIS0BygR7Wg6Oiy7WWp6MEX7CV8Zly4uAdgqSpqy20iNAUZbzadMwnjl1Ogc2yGMxHlyRi8JEJ94yzSWvLlWZJetpnTJ7HFotHgganevvgFnMrHUsiMbJ4EG3eJr2d76+dQizQuCWaC/G0Ryjzp4PtdxhsPBgQVDwfwDHK1JFihB5vzV2r4oirkJd9lKUWz8ESXyVFlb0wjczRuXVBWFI0y6Vw3knpcwtcVZKkDtCqbycmj+pKxygAW7SxuIgEW6gcguG5RUZW0iIm7HTrONQoPIbzMWwjHe2pVsJIPsFnIdOEcHdPyr6UrtNypFsDu61eIP1ruMSEj1cc2Y3M3KkIrCVbxUhqo+NtOZk3RCeHWK+kmRYAQXrN0IckFFKfRnBL6Ibus+r4Dh3Lzi0xJpuGCYeqghQwo8xMWToSb3HL8Aoj/MRYJjzbyy6KV5PIuDMDwv61AOnz243+WugGd9ffvA7qx3bQhJBDF37jo8ci5KNP14ZH1beC3bJgIYkqU7CmbS2O9n2eAJ0jrtGCb6g38zAJkLi4Kq/oOn4s0WtzAEJHdktqgyLEE6K2eDVsxi73evwHNUMBf1YsI4i1m+f7thTpQ8iLCKUDEFgBVgEFg8Luy2scBRaye6MdgkakLMhn5mA7C6dM2apE6IB2smt9UqR2Od
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(4143699003)(11063799006)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K0V0dmRLSk5PK1ZEM1JXamdUMGZqbU1MR0dqSVh6NHN3VlZ4b0ZZVDZOWmp5?=
 =?utf-8?B?V2x1dllWZ1M3ZHVxZDJHakpWSWZhYmVoWER3U21tYmJvTE9OZUhwUDBVNlVZ?=
 =?utf-8?B?NmV1RWdSTDQ5RnhZUGNvTkVpajdaNDVkVXFGTnoyZlJSN1dQNXJQRjRsUHVX?=
 =?utf-8?B?Vkg2MVdmLzZoY0xndk54ME4rN1k0YjU4VHlzU0t0NlNNQmNENFROa1FrSXEy?=
 =?utf-8?B?VkdNd3h4QWlXWUx0dTA4cW9ZZVlGdFpvbGROZEZwZmg2ZEQzWnJLTWFhaEkx?=
 =?utf-8?B?TWhqYW5OUkVVNkhMTlpmTWh5N2JuR1crZDFIQVYxcmJkU0dFNFVVVWh0TzdR?=
 =?utf-8?B?OWVGMEo1Z0VucHlLVGQvdTIwbGkrSlkzYnV1am5ZU2Z4REZqeFBKOFcxZW1B?=
 =?utf-8?B?K3NCMWJsVTBOL25ROEJrbXBIRlNTUUcwV1JMUjUwQWJmcCtnbG91WU13ZUNK?=
 =?utf-8?B?L0VYcDluczZvclFoemlnZmdmSElwN29DVjIxZVBWT0txWldqZklYTTN4cThW?=
 =?utf-8?B?UllyZUxRVThOVnk2em04OXZIWnlDekh2cEZhSXdqSm94RTJ1bTJ6eHJCSE1B?=
 =?utf-8?B?cjFNeVdKU2ZTUzdxYzUvVnJGVEloTERvUDIvUWhOMEVab0h1TlcxcEZqMS9U?=
 =?utf-8?B?TkQzTnB0ais2dUJyM3hXUmQwTUQxbEpJdjg5WklwSzRORWZFU1F5dXkreGZl?=
 =?utf-8?B?b2xWOFZlWHFLZnhZazZ5VVRrWVdjb1dRUW13NWRFMWpjVUNFV3N0UllIM0Zo?=
 =?utf-8?B?eGoxREwwZUo1SkNFZXVyOWgwaDJaaDVEVUl5djhmbHFPci92TkJteXJrNGtZ?=
 =?utf-8?B?QjN3YlMzRkFzRUJOeE1PR2pFcXpUWGhhNkErbElZWHVyQnFKdE1icDR0UFNt?=
 =?utf-8?B?dUJNYVd5SWhZWklZOXpNQXRMMFNnU1hLaUtFVzVOdFFZZU1icVpYc3lSMWtq?=
 =?utf-8?B?bkRCdlZ3SXgyWUZrTzlDblZERURWZjZoTlBLOWpId05nRmhpcTRrT0Y5VVVx?=
 =?utf-8?B?Tml0TTM4bEJHN0dOSlF5TG5kNm45d3JXdzgvb0RtMVVVdEMrOEpEOEdZM29r?=
 =?utf-8?B?WVJQTHl1c0xxQTBDbkZ2TmM0WkdwVzdJclVqSVBnK3pSajl1RkFQZVRPWitP?=
 =?utf-8?B?aGp3VE9wR2RqcFpldzRMKzE4N21WSXpwalYzaTV0NWt0eXZZV3dReU5xbFF6?=
 =?utf-8?B?UnhNL2RoeDZTUzg3Z05ucTcwaTF6V3ljSXZJb2dLU2ZLdkJFd08xVUZMM0V6?=
 =?utf-8?B?Ui82Q2pKQkl4VHQ5OTB2aHowYXJSaE5jYTFENzEvUW9zMUpQaHdIS3RrdTFk?=
 =?utf-8?B?aEJrU1htM1F0WkpydDgwRE1lSVNrQjdlTmZnMlBsdEYxMjZlOEdKL2FsNHc3?=
 =?utf-8?B?bSszUllZcEh3OEZOVFpMa1ErZU1BVkViQ05nMnBwTTZPV3Q3NEkyaFdJYlRP?=
 =?utf-8?B?dWJzTWtkNU9aLzduMG5YNzl3d21EQ21yYUJFeFVzVWFPdGV1aGMzcktOZTNQ?=
 =?utf-8?B?eTZIczhlYmtNZnc3TnRJc0hWUVR4VzluemhxR095L05CWmppaTQ2byswUjdZ?=
 =?utf-8?B?VENKUlI0U2UrTFMyN3grdDhScGd3dGFpSWFCNmdRdFFVZ0thcWdaSGM3elJM?=
 =?utf-8?B?SG9VNllxUUR0bWVXcVRjM0NJdXJGUXJsZS9iNkNtaVM0TWZRRU9XdXFNZzk1?=
 =?utf-8?B?NjZxZmJZT2hSSFZ5b1ZtQ2g4SXdtNXlyUVd1My9ybStxdFJxV1I5bDR6WTM0?=
 =?utf-8?B?MHM0NnhYRGtzSDY2THFJN082L01IV3kwbVZhdGVNVFF5TjRpNmg3cmZCOHZR?=
 =?utf-8?B?bkNqK3RZNThzTmpuR211WU5JOFBWWjFDby9mTWVEMEN2NUt3by8vQjhSSmQz?=
 =?utf-8?B?U1BBbm1ybUZXZGN6M0NoUU82SnlWQWJJbGNEdDc4MXNkZjFVdVhZQ2pHT1NY?=
 =?utf-8?B?M1hQRFlROWlYbEFIdmw4Ri84cjludDhnbXEydmtRR3BzaFhENzZGYXN4ZTEx?=
 =?utf-8?B?aFRld1Z3d2hxODFvV1BhNWpvM2ZMVHlzMnptYStlRUUraXcwUTgza3h1RVJW?=
 =?utf-8?B?d2JsQTZrYkRZb2RPeTArU1VhMkdOZVFMV1RxdkFUVnJTWTFJWnpYOXkyWXpw?=
 =?utf-8?B?VXpacUJPRVUrdHBUQ28xNy9zVXZOQ3JYb3ZWMmdIV3QvTDI3blJ6WG5oY1ho?=
 =?utf-8?B?NEE4UzZmWHJVZE56VWFna3Y4Y2h2TXM5ZnkzMHdzSjhsZHllcllMa2xCa29o?=
 =?utf-8?B?Q0JXemNlSDNyMmgySmV3dkJVc05hMFZmaWFxbURCOVRPMmtKWkhOZUpOMjFz?=
 =?utf-8?B?NHNDeTEwNWI4UEdnaTRPam1EYVV3QWxXY3Q3N2JZU0hsTXVrSEtWTkJucDNC?=
 =?utf-8?Q?KSuYtcWbi0C4VJWs=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54661f46-7522-4839-48a1-08deb727aeb1
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 10:56:59.6481
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qt91/gHmYFg9eXd4kM/3yewKw9ARqIvvTrxmDUqnQPBVGEF/xS7tfAzG5iPjeNYZxCPes8R8TC4oRI18SyMcfK2LlPiPkxVL/9TKEjmekrU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR03MB6230
X-purgate-ID: tlsNG-720697/1779361024-AB563161-92F09A59/0/0
X-purgate-type: clean
X-purgate-size: 3998
X-Spamd-Result: default: False [-0.19 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: A31B15A3ACB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 21/05/2026 8:00 am, Jan Beulich wrote:
> On 21.05.2026 08:33, Jan Beulich wrote:
>> On 20.05.2026 19:21, Andrew Cooper wrote:
>>> On 20/05/2026 5:48 pm, Teddy Astie wrote:
>>>> Le 20/05/2026 à 18:34, Andrew Cooper a écrit :
>>>>> On 20/05/2026 4:51 pm, Teddy Astie wrote:
>>>>>> __{put,get}_guest returns -EFAULT on access faults which causes
>>>>>> the injected cr2 to be off by 14 bytes (as EFAULT is 14) which is
>>>>>> incorrect.
>>>>>>
>>>>>> Fix the computation by relying on copy_{from,to}_guest_pv which
>>>>>> reports the number of remaining bytes instead of a negative errno,
>>>>>> such that we can compute the offset properly.
>>>>>>
>>>>>> Fixes: 70ad570b2799 ("x86/64: paravirt 32-on-64 call gate support")
>>>>>> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
>>>>>> ---
>>>>>>   xen/arch/x86/pv/emul-gate-op.c | 5 +++--
>>>>>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/xen/arch/x86/pv/emul-gate-op.c
>>>>>> b/xen/arch/x86/pv/emul-gate-op.c
>>>>>> index c2c699fbff..cacc171115 100644
>>>>>> --- a/xen/arch/x86/pv/emul-gate-op.c
>>>>>> +++ b/xen/arch/x86/pv/emul-gate-op.c
>>>>>> @@ -289,9 +289,10 @@ void pv_emulate_gate_op(struct cpu_user_regs
>>>>>> *regs)
>>>>>>           int rc;
>>>>>>   #define push(item) do \
>>>>>>           { \
>>>>>> +            unsigned int __value = item; \
>>>>>>               --stkp; \
>>>>>>               esp -= 4; \
>>>>>> -            rc = __put_guest(item, stkp); \
>>>>>> +            rc = copy_to_guest_pv(stkp, &__value, sizeof(__value)); \
>>>>> Oh, this probably violates MISRA, but you don't need to use a separate
>>>>> variable because sizeof() has no side effects.
>>>>>
>>>>> Given that the expression is now &item, I think it needs to be &(item).
>>>>>
>>>> I tried something like that, but it looked a bit weird and clang
>>>> wasn't happy (at least in language server) because of the &(x + y).
>>>>
>>>> We also need to ensure that we're actually copying 32-bits scalars
>>>> (and not 16-bits or 64-bits ones) like the previous behavior.
>>>>
>>>> That diff seems to work though
>>>>
>>>> diff --git a/xen/arch/x86/pv/emul-gate-op.c
>>>> b/xen/arch/x86/pv/emul-gate-op.c
>>>> index cacc171115..b72a3058dd 100644
>>>> --- a/xen/arch/x86/pv/emul-gate-op.c
>>>> +++ b/xen/arch/x86/pv/emul-gate-op.c
>>>> @@ -289,10 +289,9 @@ void pv_emulate_gate_op(struct cpu_user_regs *regs)
>>>>          int rc;
>>>>  #define push(item) do \
>>>>          { \
>>>> -            unsigned int __value = item; \
>>>>              --stkp; \
>>>>              esp -= 4; \
>>>> -            rc = copy_to_guest_pv(stkp, &__value, sizeof(__value)); \
>>>> +            rc = copy_to_guest_pv(stkp, &(uint32_t)(item),
>>>> sizeof(uint32_t)); \
>>>>              if ( rc ) \
>>>>              { \
>>>>                  pv_inject_page_fault(PFEC_write_access, \ 
>>> Oh, that's a second bug you're fixing then.
>>>
>>> Pushes of ss/cs need to be done with 4-byte writes and zero extended.
>> And they are: Access size is derived from the pointer passed, not from the
>> item.
> Oh, while access size has always been correct, ....
>
>>> I've added:
>>>
>>> The use of a local variable in push() also fixes a second bug.  On all
>>> but the earliest 32bit CPUs, segment selectors pushes are
>>> zero-extended 32bit stores.  Xen was not doing this for %ss and %cs.
> ... zero-extension was lost with the FRED work, so a 2nd Fixes: tag is
> going to be necessary: cb29eed2dae7 ("x86/traps: Extend struct
> cpu_user_regs/cpu_info with FRED fields").

I don't understand this comment.

The FRED work added extra fields into %cs/%ss with unions, but the
fields named cs and ss are still uint16_t.  That aspect didn't change.

~Andrew

