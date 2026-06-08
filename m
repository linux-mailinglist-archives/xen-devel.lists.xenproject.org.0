Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 593/GL3hJmpJmQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 17:37:33 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C05476582BF
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 17:37:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b="F/gagGHX";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1331967.1594609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWc2E-0006d5-H4; Mon, 08 Jun 2026 15:37:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1331967.1594609; Mon, 08 Jun 2026 15:37:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWc2E-0006ag-DB; Mon, 08 Jun 2026 15:37:06 +0000
Received: by outflank-mailman (input) for mailman id 1331967;
 Mon, 08 Jun 2026 15:37:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wWc2C-0006aB-VC
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 15:37:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWc2C-00ATkw-1L
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 17:37:04 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a26e19f-5cb7-0a2a0a5109dd-0a2a4502d262-0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 17:37:03 +0200
Received: from [52.101.61.28]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a26e19e-af86-0a2a45020019-34653d1c147b-3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 17:37:03 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MN6PR03MB8007.namprd03.prod.outlook.com (2603:10b6:208:501::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.9; Mon, 8 Jun 2026
 15:36:59 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 15:36:58 +0000
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
 b=j2AaZ33ERCDtDhPM8+8AKVq7cX/r7gNxO9cxwAqyYI75eSt2lecFlHI4/Q+CPMEmbcvFzBxCXFonvWjYu2sv8Vejjp35/szoQU6mJi568y8KAa25wVy+1nfCH6xn4zcnWyU4dnlqWQQctxcY785aXp52E9zFoSq1Sy84h74PBPxP0GrG1B2Lv6ZvzNEfC04vLggz4AOFU6zuhBgTgZGfWWS0J2mkCjkiaxZCPr6Zl66x9gxqLURy3IGYMvgBRKzGDpvDOeoiNI6gtt/CpSnTVYKzAiqxsFZ6VZiARdSCS+qL35s4JvKrTi5LrEiPBIWNOTtWD+ujjpwdSw7clxDGTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TYBRST0mFvZXveAkfEab59lm0YqJz3E3DNVzc1k1Ubk=;
 b=h6jDROXIJDdxX95ctviD1dsQh17t2M48YJ9vorGAUt9bZ94Ug8SlfYQ5ImQrZzcTQfRO+PeO52Bs9FYweOeQ8oxibpa/oePmco/W96zfJTs5tZLIciv/TwYTB+QSnE62ar/zoBCLoe5q7f22CVVzicZ78ioC31opixQJZZuVt3cqtJWVyjUwIdWW0ZwFLcb252UE1cMn4UdcqUg6SaQYcUk0yCUejCmBPrSSpIhOA8Izu2NhugWkOt9B51bLcHUCHT9zd/CZticECYlKYHT/oTAqREZZ90w6b4Bve01UUehMYfTfhfbPvXjycTatwc7SA61S5v4E2SIAhe/xr/U8PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TYBRST0mFvZXveAkfEab59lm0YqJz3E3DNVzc1k1Ubk=;
 b=F/gagGHXd+C/2uWdys5k4ScJOSiq749ticMjYWP+LqL30cnx/a/IwagrQogeT0zQv5xd6v3vUkDLMEANFoi4wPOnPe7fnllhxXO3eBmxCROD5aPwMsvtaYnnfy+/DF2/TPQRmgJSiptpEI47GjjPHn006qtufWX+ux3JmfW5vrU=
Message-ID: <ea002cf0-c2cc-4612-af61-8dba7887af61@citrix.com>
Date: Mon, 8 Jun 2026 16:36:54 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>,
 Frediano Ziglio <frediano.ziglio@citrix.com>
Subject: Re: [PATCH v4 05/16] libs/guest: allocate various migration arrays
 just once
To: Frediano Ziglio <freddy77@gmail.com>, xen-devel@lists.xenproject.org
References: <20260603130603.776452-1-frediano.ziglio@cloud.com>
 <20260603130603.776452-6-frediano.ziglio@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260603130603.776452-6-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0539.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::10) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MN6PR03MB8007:EE_
X-MS-Office365-Filtering-Correlation-Id: f1b13133-b943-4700-dff0-08dec573c6da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|11063799006|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	AS63UKl6dn5/Aasml1cshK2W2sUiz/sAX6aTveiA6KtKbwn8T7PYElnLkFHmOgYgB0Kdy57GGgh+fecbuYGP6+Z/fN6OcR1dGUK9vaDeI8jmo09nwamxkEucScPpxE0CW/xQ7gXC5k2PNA8J1CDw6FgfdXd2Dom3qM6brCe1Erk7E2i2k3fxeRrAuPmom5p+vkOzd0zBZzkW+fQmdXLlPNj8uyFSWB5P9eYW5AvXOZWagFF8nnppuKZZZToMGyo2pyuLO/0o13sGPDEhmkSfmG3AnYJoyqIgTUg9r8aRRSjpC589gd2GmvhWwRsq5FPzpTRVqIkzHEsmFxDiTpnOBdVeX8rlBV3yam+MqzG1kpIYmYgHF20rDFWloyCH2sOcmnnf+6RHkjlVSOMbF0xXg9YYFgqIM7x3g8jQxsapl7OQiapG6yE5wnNZBO0ewidlCj4eLh5gr+Lie1QEqwgjThYo+Z3s1pKar/AyEY0XaHME6l3z+FIOGbrtadOXh1mRDBT3uKrjSXkmJz5BbyDwhjrPHEKrIEwqHqeOy9h0oQKV30sIxooasIv6LO8XfnnR/M7pMW8IIt1WaFZkSxTcrcU63nW8STDJ1NsJi9tW5XffyVFPSDGNFUQZrK7oEeQss+CRfYZDezKaQqptM2hSbRrmbGGkP0bY4+rK0kDbCeXm/HbcyMTiltlX9rI9Fqke
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YXdkTTFLcmk1K1M4QUtsdHBseUNHdzREV1IzcWFmWGNjdFFscmUyYkJYbkM3?=
 =?utf-8?B?dnE1Q24yUWpDK1lGVytJOUV6NENjTGFtOU9qTWdKYlFRRzdxRVhZMjN5UzE2?=
 =?utf-8?B?ZkxHWlRpcVNkc2xVZDFRVWpjQ3ZMQ3NJZWhxaGUwWmQycEpFdWQ2N1B2Wng1?=
 =?utf-8?B?M0N4UG5ZTmF3eHh3ODRrYkFDS25pL00za3JDYWJ0VmJ3eGhXTjRraU9DSjRO?=
 =?utf-8?B?NllkNjgwMkE3R3BTV2srd2JIMXViL28xNUgwYmJVRWdyTWkrK0QxTVlMOGY5?=
 =?utf-8?B?TEtOS0dnQm5Rb29RTUlhc3BidVFGUDBtdmlWZStCSnVtQng3RmxWYUxRbmR2?=
 =?utf-8?B?NURsSFhLSHBvZFdKTHZWb05CRWc4UFpHTkswbGJ4MFRMSkhlbzJKWXdRd3Uz?=
 =?utf-8?B?NXI0a1RLS1JnSlhuTFRaeEpsMVI4QmZVZmdjcUtxakNsaitwY2tmeVBCSkVv?=
 =?utf-8?B?OFVBVXhhZzBWdUovRGRNVWU5UDB4bWlsaVdpLzVZOFMxL2UwT0RXdlYxS1dO?=
 =?utf-8?B?cHliMlJTV0RMdFd2dVMyWkxDTWtram14L1JDaU1oYUVWZWk2dDQxMU42dEpX?=
 =?utf-8?B?NlhBR1EvcHZYZjc4RU9QMFZYV2xVNjZnanBBTlBlbUs3RTA5R0VoL3JxRUxr?=
 =?utf-8?B?ZkhyVTZUZ0hPZk1TOTZNN1hxbVcxaTVES1hWUCtUaWk3M2JHc2t3T3J5RXlP?=
 =?utf-8?B?clV4eVIxblAxdHJkZlJ3bWhRWXh1aG9QY1F3MjJhK3F5SkRzUXpOL0xhTDNT?=
 =?utf-8?B?bFc2M2U5bUdVbEd0UGt5U2hKME04MVdZeTNpTXBSaVVySHBFTmt3WTdmK1FE?=
 =?utf-8?B?ZVhRY3VPMmE1ZHk3S1pKMmVLR1JnUlpZTlloVjhaanJOcDBHb1hCTElkZFdt?=
 =?utf-8?B?VXRGU0RJMVcwSzVSQzFLUUVVdnRTQUs2U25oZVN1SGRlN2hGQ3JlS0FubEVS?=
 =?utf-8?B?VWNkUTFTM3FJY0RBaEluZ0NiTmowYTZ6Z2pVQmtBYm1JaVU2MlhpbmNYdkI0?=
 =?utf-8?B?dVFuZGQ5M1pjRkxIMkRWUTkyS0xsZzRXS0ROZ3RCVERlM0FIMnBYTDRZMXF6?=
 =?utf-8?B?MXEyM0JWd1JKcTRhTVFUcE1wM2xQUVZHdFdKTmd4YXJQaTRGeFE3SDJHWVd2?=
 =?utf-8?B?UTlzeVF3b1VVRnYyY01CWUFYV1ZBT2dnVXlMT0M0TENVQ2pZQmpQbWRTL2Nz?=
 =?utf-8?B?NkIwdy9QY1lCSmM3ZUFkTE5KanFrMTgyd1FoYmh4Ym9mdHZTUElsdlU1R281?=
 =?utf-8?B?Q0dCOGQvcTYxd1lmb2xRZXB2T2c3RHk1RXFWMks4Q0YzeHBqNklTcHlRenlV?=
 =?utf-8?B?dnlhbE4zdEJrUU96ejZIRC9hTXBvSC9Fbm1TU08zbnBHM2VxVXBQZUMwcDAr?=
 =?utf-8?B?VHdhZUFzL3FFbDRUTlZNaUpyekkrNkMzb3B6TjVTRlhSeVhFY3UrNWd3WENS?=
 =?utf-8?B?ZEEzbnlUNTh4QmNuUVliNmM2ZDVMZHd2U1puQjI1MTZZU05zTEFDdG5nVHRz?=
 =?utf-8?B?UjJCVytEbDl0SDMvN1lPVHFpeGtSdGFEYmhublVtMjc1a0RmSFV4Q0s1M0VX?=
 =?utf-8?B?Ui8wVnJuZ0xDMDRHZkdoZk9MNmFURHgrTXVhNTVyeWxZdisyMi93UVZqZ0lO?=
 =?utf-8?B?TzhlcVRpL2RHemJwckpxSjljUUJ4Z3pqeXdJQStFUWZIeWRYTHNza0JDK2ZD?=
 =?utf-8?B?UWdEb2Rybll3RFZzZ0paQVR5TnNyUnVGbHc2cXBsRHJlZEx2UUJqbnN6Zk9a?=
 =?utf-8?B?VUhYazRoVVNzWmhHc212ZmwzLzZLVVlTQW9OZW51dE9sbkhML0lSemxnZXJY?=
 =?utf-8?B?NnAxbGlpVFRqdWJJMlU1WTBtbXdlVXBBc1BhT0VwcTVPQWYxekg0b3E5Vm1o?=
 =?utf-8?B?VzFYYm0yZ2ZkKytLYjFWa0hOY1NXSU9nQnpML3BJVld3QTYwbDc5U0tVbmNS?=
 =?utf-8?B?b3U5RzVoT3JNWTg2ZU42cmt2dWZYSWdLbDVlSFcvckFLN0RRc3VObFVnMmxy?=
 =?utf-8?B?dzlUL3FnK05YRk95TTFZVUJFRHN3ZkJPRXBtYTVKTjlUL2xjTEpRbnFaTzVL?=
 =?utf-8?B?aUU1V0VOTmx1ZEUrTERaUkJNZVlheTNLcFl2ZXNiN0J2NTJrcE5uZnFzRG9H?=
 =?utf-8?B?d2JEanVtaHRsZ1BaWVNISE1OUTFKMEp5VWtDcHljZ1Y3OWErakZwVUJ1eFB2?=
 =?utf-8?B?MEpDb08zTHdpTFF1aDEvWW9DNmNIcXozaDl3M3BKY2dnWExzSUQ2c0Z3QlNZ?=
 =?utf-8?B?R1YvajRhb2tab1o0OHllclZQVFNRTnpYeDczZ2VCZUlTWG03eXVCS2lhaUlK?=
 =?utf-8?B?aDl3YU5sYko3TjFGL2Jkb25NUXdpWlJ5dURkekFkaHhDcHF1TU9HTm8vZk9G?=
 =?utf-8?Q?oFKMNOydFZPOhEek=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1b13133-b943-4700-dff0-08dec573c6da
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 15:36:58.2655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2BYHOCx+JfBfIi1Dca3KrBjkFu1oTH/zWPFJobnPSjdQNqCq5sQDFKznquvSdLtA9VUIA6pr3QlAeYFGWDGwUiuqSsF4YFEa8Bc/Z5nGGvU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR03MB8007
X-purgate-ID: tlsNG-720697/1780933023-81B70161-386DE5A9/0/0
X-purgate-type: clean
X-purgate-size: 534
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:edwin.torok@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,m:frediano.ziglio@citrix.com,m:freddy77@gmail.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:mid,citrix.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C05476582BF

On 03/06/2026 2:05 pm, Frediano Ziglio wrote:
> From: Edwin Török <edwin.torok@citrix.com>
>
> Allocate these array just once at the start of migration,
> using the maximum batch size, and free them at the end.
>
> Signed-off-by: Edwin Török <edwin.torok@citrix.com>
> Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
> --
> Changes since v2:
> - change prefix in subject.
>
> Changes since v3:
> - fix comment style

These are intentionally freed/reallocated so valgrind can find overflows.

~Andrew

