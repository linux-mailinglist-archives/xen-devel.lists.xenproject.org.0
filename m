Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kUowJb3mJ2qa4QIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 12:11:09 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F12DE65EC24
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 12:11:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=gEUyAiv+;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1332589.1595055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWtQ0-0001H4-N5; Tue, 09 Jun 2026 10:10:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1332589.1595055; Tue, 09 Jun 2026 10:10:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWtQ0-0001FW-Jv; Tue, 09 Jun 2026 10:10:48 +0000
Received: by outflank-mailman (input) for mailman id 1332589;
 Tue, 09 Jun 2026 10:10:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wWtPy-0001EL-KZ
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 10:10:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWtPx-003v1O-GW
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 12:10:45 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a27e69d-e002-0a2a0a5209dd-0a2a4503d93a-36
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 12:10:45 +0200
Received: from [40.107.209.17]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a27e6a3-672d-0a2a45030019-286bd11143f0-3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 12:10:45 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA6PR03MB7615.namprd03.prod.outlook.com (2603:10b6:806:43d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Tue, 9 Jun 2026
 10:10:38 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 10:10:38 +0000
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
 b=HnNDqS/QuarfcMAXW3l0PXYgpzrbk68lUkeC0MStfdcfg5lx+4hqrW06LAgwP2HcYcYHsD0cGIPBmIb+CHxbUWqdCr2anRCG3JV4zFEFrY4zqpk/v2jvSFOTkNXw4Af4c9oyfHWGUfHnq0lal3bGLQYAt9XW/dW+dlwZcgjX61/f3R7bv0NpDZlg17Nt2BY+0sm5E7BoDA0PyMjwePWLCMnTvZe898YklF5MuX0Dkh2vFZkxeWUSrEoO7/f+gPea0Yk4faEk0g12HX0NJ4VH9f+kxobk0/UodTXl/vMYz61aeLFOmHxyPqToFbnYW730/l4C/vq8uk2auTTxrFAn4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F27M/NQeVPs2O3bFwXwxmbXKM5/VuTuJ1zs+P55GCQ4=;
 b=Gsn8VGZ/XcAt78b83GtwSsCAx8ahTXxbs27IdeuCsU/iJiNwRGp2QsjLSqXQCEbaIsKlgX5Rb/zXsWmtHZIXD5jo9S8Dj7AvIX5cTrY0l7zzxwmvcHUp+eRQNmgrramTDduc0/Ta2iI60+Ch5yTFp0YBOygMkbdC3dBilYHwKJH6u17D8+ZYvx/bAtelZCshXvpa98vp3bK4dV2REbr6d2JTST9Q7GKLIdhi1GHOQ+2F3GnOAYC3FVkWFxr2L9M2VWyeZaz8SkvdFIRB6sDEt76GhqKJD2AZ81/NAqKTjsNXyZebDXW0k8eibKe4JuMpuV6cn+8S6Rh/qIIt2IblVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F27M/NQeVPs2O3bFwXwxmbXKM5/VuTuJ1zs+P55GCQ4=;
 b=gEUyAiv+I+GoscU/7ChnqAkT1QHRjF8uxYg/FtlGwwpXxUWd1hMc+IVTJyu7Q9sD9keJtZVi4d/3rZ2RfUu7WIC6IIdrWx/UHmH8N3hcQN4tZZmndqpj/U8RNuJGAtFHIkiYYfGZdeSyQVadTaWwKmqybrPPXQG/n3KdnHdql7s=
Message-ID: <00f87295-eb9f-4e7f-98c3-bd59b9137efe@citrix.com>
Date: Tue, 9 Jun 2026 11:10:35 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Frediano Ziglio <frediano.ziglio@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v4 07/16] libs/guest: avoids using 2 indexes
To: Frediano Ziglio <freddy77@gmail.com>, xen-devel@lists.xenproject.org
References: <20260603130603.776452-1-frediano.ziglio@cloud.com>
 <20260603130603.776452-8-frediano.ziglio@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260603130603.776452-8-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P123CA0011.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::15) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA6PR03MB7615:EE_
X-MS-Office365-Filtering-Correlation-Id: cedb5c6c-cfdd-4413-73f8-08dec60f5af0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|18002099003|22082099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	33KX0doi8tXpaZu2dOt17v3wYylyKNaXaeWhC9MqWeB/SUZYE2h0wcI2rv5vCjgn5u9iVcTsX+4bIbYbvR+oCp+RY38DJV7hsJB8qwXkP+kasy4BVt0DeuKn65lu5LyYitC296sQKqQKclPROrMagWlP6/F0dJaNaqPkP0EKWW61MdWiVyS32DZbm/5sOFRjJfZRza3zrDubnGbKC39GnNyzNjdl1ej7DKnKpdhf7SzYykR4P9Ka3muof6Zdp3u+MuzVjbTCo6qRjZfvZr7alOds3F2eAfFt/d5F+/lVmy5YQYzVqGDe5/vvNDsNIgy0JCY6mXcBrOS8jyyXEYsX8nIirBMpDK/yX+kbxLijP5HcsLXUkOpTwN2cwMZmiDpb+rWBEoKEBTsOABxmFSxzMOHvY+s3PhV83AtfFMHrgviJ8iqHoPzV/junzKEqA+Ia3mHFHs2mFdayq7neCHB4dxXWZ65h5WGm2mMaKTvY8Lv7dSwEk8aDgqv/KHoKxyfLrmR5pS89pFzCKLvso9Zr4zjxFbG3Tp3iL1bhHpYB+78PfSY/3E/cjei0bQtR4yDmrUrbkTD/6dT0X0ltRLKYDfndXoUuzMhyc81xOfSrrIwoVhKXbGUVjay8BZif2r9lUDujcLor15fJnYKtpWKrfgbwmk2zU+A3mLk7dReFztvRZvVphLAcmws89/kZfu6Z
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NFpLK2QzME14Y1E5anB2RmRzUTBOQUVWTnk3RG4rU0ZyQUk3YjJFTGpQVGFy?=
 =?utf-8?B?YmY3R2xKRjNhWkt4Q1N2VDNpSllwazZrNmdva01yQ3ZZVGZUNi9zUy9ZZnc4?=
 =?utf-8?B?NEt2L3NrbHB0SlFYNjJoSWdzUE5MeWY2ejJmaE5QYmx1bStCbkJHTlhEWnFa?=
 =?utf-8?B?WEtDWDFMd3Z3bzVHRXpxR0lVYU82RldNTUJRVEFqMVdiZWIwSXc5anltckxu?=
 =?utf-8?B?NTV2U0kwM05BQ3FBamFJaEtkVkQxd3NHanV2NTBFYlc4Yzg2RlJFSDM4YitF?=
 =?utf-8?B?NzZYMVFHSmptcUNVNmFxa01HVjdDMjV6NUI3OTkxNDRuUEdjUFV6YTlEQlVS?=
 =?utf-8?B?YmNRSlAxUlBrK0w3WXJIOGdWODZNN09KSE1MVEh2RVNIdng2TlhFSUVlUEZo?=
 =?utf-8?B?Z1hBZStncy9aYnNMYnEySWJYVzdsS1A4Tjl5Zi94VnI0MlIrUHQ0MnRIbUpS?=
 =?utf-8?B?RzAzRDdBT3ZhKzFoZXRBU2JMLzhrZVlxeU1XaWFEeGwwUldGcTk0Tm1LOHRN?=
 =?utf-8?B?bUhodU9nYW1sTmNZenp0dERiQXZudGk3S25pc0h2RmozUmxMZFhtMDU0cTNE?=
 =?utf-8?B?SUxRa3ZxeHU1LzVwZXJHZERpcnBUZzlTY2NqaC9zNThXa2FZS2M5VmxvNnV2?=
 =?utf-8?B?cnhGZU1QakFOanNUbE1Rd2dQL2FGdDNCc2ZzSXJic09pa1lMcnYzYmhRRndm?=
 =?utf-8?B?M3YzZE85OExFVWszc1BkVk5aZlBoQVpvdW5SSW5WV1Jva3M2aEJ2WVRFWW9B?=
 =?utf-8?B?TDRaNWYxN2lGL0VjQnN1Z3ArMGQrMGh5bG9DS1ZWMEpZMDRQZE5oWjIzcjR4?=
 =?utf-8?B?M3pEUkJ2V3Vmb3pqekt4bVNvUHkvNHJFendaQUNNcE1QRnhqdW5sY0ZvN2hl?=
 =?utf-8?B?clkxQTY2cXhzR0hodElER0FVVkd4cCtVUlhweDQ5ZCtLYzJQWDlBcEFDN1lx?=
 =?utf-8?B?SDhUWnNsdzJWa3ExRlBiNnJpcEx0N3FkTlpuNVgvckpTd1oranV2OWhWZ3Nm?=
 =?utf-8?B?WVVqOHhKQXhKaWdsbXptUWlHTEdiQldhNis2MHo1ZnYzMDY4cjFrR0JnSFZm?=
 =?utf-8?B?TVFDcTRYRi9BaTBnam1xRHBZdUZiWnNxdVMyUUg0NGh6dXdaeEFFTnU4MnZQ?=
 =?utf-8?B?YWIxWHd3L2kwMXM1Njl1VENMRkdERm5hWEw0eG4xNmxNeXB3NTdrRkVNNHBx?=
 =?utf-8?B?WTRjTHk0WmI5V3hVMkhHVElTNW1VRzk3ZGxsem55Z0dabjI4ZHdHRHhjZTlo?=
 =?utf-8?B?RldreUFId0Q1Q3ZYUjRhMWs1cDA1eDNKMDNjdHFnUEUzYmMyV3JpSGQzaEc2?=
 =?utf-8?B?c2FJVDlsaW5XMWY1RXQwUjdXYjdNQXJhTm5CRGJxbnQxVEpPOUJwUkNseXQv?=
 =?utf-8?B?YXJrSDFWb1oyQTNZY1JYV1JBY1h2Q1JpL1c4MXBKb25YcDZJMzhrT2RvS0xr?=
 =?utf-8?B?RTJTTGtRQnBSSEl2YzNtRVV1WnlwYllhZklwYjZRTS9RTGpGRkY4Nm56OGRv?=
 =?utf-8?B?Mk04QTViNVdGVnFrWW9TcHowaWh1MGQyQkhlNVNLcWJZdHlhMHN5VkkyTTFZ?=
 =?utf-8?B?WDE5MllDVGpDMzkwTHg4SUhGMHFWaDRobDRKc3RKZm9MVExWTk1aS1YxK0tE?=
 =?utf-8?B?bFh2UzdzTDBpaVF1YU1HL01rRjYzRG9QcHU3ajV3N0I1amFFbDN0MEw5UDNy?=
 =?utf-8?B?NEsrNGIwcFR4M1ByaDhZemVDZlBVSStiQnpQZStCTXU2VUcxbDlFdnhjcjRQ?=
 =?utf-8?B?clFaZkI5MXpVU04wcXJtdW1yY2dYbjIzbHZycHlKbU9WbjZIRExUaDg4L0Uv?=
 =?utf-8?B?Rk94WENZWmJpL3greWZXMkxHSitVZkp2YzVNOC8xcWd6UGFXWnZjK21vei81?=
 =?utf-8?B?aTcwb0ZhRkdvbXpwZ3VyN0RRSVpHajdKN09UNit2WW1OZmdlWVZQQk10TU95?=
 =?utf-8?B?NEZHa05EM2U4VHRzOVhrNFc5YzkxaWtRYWNZVmVDUVUwcnRSK0JMZGdVSW9l?=
 =?utf-8?B?VjJzckNlcytZKzJUd3hReGRxTW1qVHRxMTg0cCtCcmJTN2tmRWZuQkdudW5R?=
 =?utf-8?B?b2ZHdHNoOUlReWFRUm5JMjBFNDRhQ0FheG9XV3VXM2RpOWdEMU5rb05WblpO?=
 =?utf-8?B?enpXaUVtbk81MXpCRUVGaHhmVHhwcU40Sm5zcWx1K0hqc1RXWTAxRzJ3eDZs?=
 =?utf-8?B?eis1Wkoza3pzZG0vaFdqSW1CVTB6NWJDajNMMlVLTmZLT1owajJ5Yy9BRlNO?=
 =?utf-8?B?eG1TaGErcGpsUldoaG5ZenFLdHl6MFJEd2dnMXVla1g2MVkzeTIzbGg4b0ZK?=
 =?utf-8?B?OFFiQldlRGVzWGZPWkhNanFNczNzUUJLaUlXd1NWSC96UmVOSmFrbEVBbWN3?=
 =?utf-8?Q?Zc+TttBOUQSEbZeA=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cedb5c6c-cfdd-4413-73f8-08dec60f5af0
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 10:10:38.6483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ejq6baQ8qELxZRRAU3Y8ie5z/tQBblcZA7BDqQ5Bk/uXc+0ZdzzMIPd4zXHaAh1YC+l2yzY+BwkKE8UKejWGTHUO87l/yKSLYAZ8AYZl+IM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR03MB7615
X-purgate-ID: tlsNG-33051d/1780999845-37F4A938-BACB86F3/0/0
X-purgate-type: clean
X-purgate-size: 369
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:frediano.ziglio@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,m:freddy77@gmail.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F12DE65EC24

On 03/06/2026 2:05 pm, Frediano Ziglio wrote:
> From: Frediano Ziglio <frediano.ziglio@citrix.com>
>
> Simplify code, after the first scan of the various arrays we don't need to
> keep original types and PFNs but only the ones having data.
>
> Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

