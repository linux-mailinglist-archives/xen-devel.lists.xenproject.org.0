Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id zrE8M9CXrmmBGgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 10:50:08 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 363B623685F
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 10:50:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1249200.1546700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzXF5-0000FF-LK; Mon, 09 Mar 2026 09:49:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249200.1546700; Mon, 09 Mar 2026 09:49:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzXF5-0000Cr-IY; Mon, 09 Mar 2026 09:49:39 +0000
Received: by outflank-mailman (input) for mailman id 1249200;
 Mon, 09 Mar 2026 09:49:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lNRQ=BJ=citrix.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1vzXF4-0000Cl-PU
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2026 09:49:38 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 484bca3d-1b9d-11f1-b164-2bf370ae4941;
 Mon, 09 Mar 2026 10:49:37 +0100 (CET)
Received: from SA3PR03MB7419.namprd03.prod.outlook.com (2603:10b6:806:39c::6)
 by IA3PR03MB8454.namprd03.prod.outlook.com (2603:10b6:208:53c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Mon, 9 Mar
 2026 09:49:33 +0000
Received: from SA3PR03MB7419.namprd03.prod.outlook.com
 ([fe80::8254:2aeb:5a33:a6dc]) by SA3PR03MB7419.namprd03.prod.outlook.com
 ([fe80::8254:2aeb:5a33:a6dc%6]) with mapi id 15.20.9678.024; Mon, 9 Mar 2026
 09:49:33 +0000
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
X-Inumbo-ID: 484bca3d-1b9d-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AhKYOtCVY8fo+83hBBKnvCE1AhZml82iSrrLTtv0AZHyLkHBWtRjwhiIlFbJkLLGux53MpePhy7AnEs51D9Hdr+JRXXK6z3YdIFnvQhFNDi1AM+VM8gWJwRwiOsIm+HLfOFLhmFmv+bfuHM8M8lH8hiQxCvdQdxuNHhcHp0JTinHTv/b6ptn7mpwipdi8LrLKBVgRX9jcmS1EFD+2PNA/r+RiVtNL7+8kvotgjdlmAqEtcUVWFhR5RABvyM9DMciRloromj9j8vZ8jQzMjfCcCbYCdWLRhdexT4EKvdV/Z+X7nf6lhzwudDC0e/yVj8TDktSMekAH+i6dzgpzKnNBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NYJxUgiPO3of0y9hfACZwYYPr9iPHgeW7LPoEkymUb4=;
 b=njuy9FN5npYlGSzIKieOmvk2B0FJEBaYetq4bHyQAIHeL9Ye+NgB1ECZH3U/ntD6O6E87DM66iC+qLuDkFqZcPFThNZmfMYZFesa9jOT6tThWFuf+WW+YHR8Cr5WyET0Ovlz54Jc6iW+fmCqM/QZv25FkKEmZgtuvOY+MrFftHSjrOJsLcfE4Su2lvPEMwUUZpoYJTpTk/+PWV/OedpKiS0stYlRKBzCZYKYkoTt38miA8/jviqyCuag+6kErqj4fOy2GJc5ssX8ey7zoC60l191iQ0bNi+pmQszf6vg/gcZNJ//aVVI5LPcyNY8v6XZ3JaMWfgaxso8tq0rw9JQ1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NYJxUgiPO3of0y9hfACZwYYPr9iPHgeW7LPoEkymUb4=;
 b=n384mOnbU1hFJA0GPZ6K9v68VUttNafVRH7g9xS2Z/qJTN1xHDdDaA/G4DVUImwAzicwz/JWgm3PhOp5SlXKXTYSOwH11UGStOEZGC0iZBh1+UH5IDEY4P7GVvcYnNsm7Yuvuf2FvTYP+SE3j6bdznK6rAODv0usgTD7bbWmY7A=
From: Edwin Torok <edwin.torok@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 1/1] tools/tests/x86_emulator: avoid duplicate symbol
 error with clang: use -O0
Thread-Topic: [PATCH v3 1/1] tools/tests/x86_emulator: avoid duplicate symbol
 error with clang: use -O0
Thread-Index: AQHcrYXnXQSbfSYkDE2XRiS+3V/VSLWl1toAgAAhtYA=
Date: Mon, 9 Mar 2026 09:49:33 +0000
Message-ID: <5B5A0A1C-B7EA-47F2-8CF9-3000CF4414F1@citrix.com>
References: <cover.1772813802.git.edwin.torok@citrix.com>
 <a4a29c95b06a0352889bb6c032c19be6e4cf8288.1772813802.git.edwin.torok@citrix.com>
 <49d22b35-f5d8-4992-a32a-bb3f7c3e5ad2@suse.com>
In-Reply-To: <49d22b35-f5d8-4992-a32a-bb3f7c3e5ad2@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.400.21)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR03MB7419:EE_|IA3PR03MB8454:EE_
x-ms-office365-filtering-correlation-id: fee31f6c-a740-4b55-59cc-08de7dc12abc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 tZDg1XrttwgL1N99RUTF4OITvRmArSa8fx/WdaAOTPMkhmiROY8NZbtTbqmSDD+7jN+6tpucJHRyXUjkyfu6p5+02m2zO/0Jr0VujPeXEW6PvMZe/Aj95wNtmIWBUPMw9Zhoz34v6au1auoU9KCHXnSv/iQ7qZtdJrDKwSkS0ylJQQphb3FaL8c8AgAywn2e/Xx2AqRhuid85NPbc+qVuHZ/2Xpgudy+fnPOxPGFb2OR6sjs2rT3I3faltgHQhfl/T8LWF95ujPkwGTFqDEn0LojFal1mjsPlJQFF/6nGlZf/OG194JnuO21iP6pzkwsU5G/35uZKuM9CL9dLxkmnygNaZ5dejXSZzKDPG+Q5br01b0bnqMF7uF7sGk/bpmn+16hb94GZTX54dmh5KSu0h1/1MrG/mgBZYzu3VSnd3Z4vZFueb/9IqmVjlATJOV8wdT1c41TKfET1eIAYA+6bwwb27zUP7cdI/+hYqYPLr7RIT/ceDYQkThfY8qFCRw5Z4BEeSJUBDLWWeSnG49nIFeE8Z7UUbAysurvLvJItEEGlCJUamP0pfahp4don8J5C39sQPmJ/ugs2fkpdXaDEU/NHuGhqFaChqdcnt7/eZvBnbR021AxzQ5f3PMINOdKe7WlqTs79w8LyPNU1wCiaqdmT5VmxnZVXIt0G5EQNe3agglCL41cgbAWwmkYcsoxpNOwzXeTlGp1uMK7kmYdApzSXH796R1LG0+reA+s4t/f+bYqz9oGL4Ifh3r58hPni0QwecN3Hu9XS7Nq2D1fJSFLg3P4fuT/FRdRp8djji4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR03MB7419.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VVdnWFFxUTE4K0pOT2dhaUNOR2RzNXZ2YTZXMjAvZ0hsTXNRWHdmRXUxNk84?=
 =?utf-8?B?bjRWdnhtd3FHb1gxS2V1RnBaQXhCeWtYMnlPRFg0VVpUVDRjZmFycThCTUs2?=
 =?utf-8?B?UlltZ09YWU1FK09IU3lpMENqUlNSYkdSdUVKV2M1a2UxR21XeE9kZnZkNXNR?=
 =?utf-8?B?cGVWRXlxaG9LcjRVbS9VRS9qRWN0bytOdmk3M1VSZGRsT3FiVDkzdUFzSC9i?=
 =?utf-8?B?RzdWaFd3ODhJQUJtWTRqazlLaEFUWVdxbnRWbnp0cU42R3hNaWM0SHUxands?=
 =?utf-8?B?b0VUZ202a0JnMk1uc1I4SzdoazIwTU15V25IblFiT0kwQ0FZL1lOZUlXWE5T?=
 =?utf-8?B?K1ZmUmx3bzdZQVUxWWNIeXAybGRHdENYVWJYbjFsRHNheEhnVjIzOHE0b0hV?=
 =?utf-8?B?QjlRdzBDSmlrTXY4UDkzc2JRMWJ2NWQ4bmQzZmJHbEdaQ28wU0I5Rnk5Z1FT?=
 =?utf-8?B?RlRpenFRTkI4S3JabWVmQnhET3pMYTk0dnBRc1gxOG9iY0g4M0FaYU1VcXZ4?=
 =?utf-8?B?ak9hZ1BlNnJmVGlpK3ZFMFRIUDRwbFZTRHNiVGpja2dQN1h4MjlHM2wxYktz?=
 =?utf-8?B?SDJVdXZQaEhhNS9pdjdNM3gxeUY0QmNyV3FDa1RKZzI0T2FhTHV4M3VWb3g1?=
 =?utf-8?B?NkJ3SnRiNWhnTVc4OGlMN3hZcmE1cFUyWUJJVDZCbkpjSTQwYkw2NXhoS1Vm?=
 =?utf-8?B?NUdwWHg2NG5jWWFRUGkweHBVU0huVHMzamtiLzJFMUlHL01Rczh6dXdXaGlT?=
 =?utf-8?B?Wmk4ZHZxRWdwWmh1WHZZRnZkVDk3SEhUSHBDTDZNNm1aS3VEcUwvWmVHT3N0?=
 =?utf-8?B?RmplNGxSUHRRWlBpdXNmN3pIbFliYjU3SmMyb0NBbmFsaXdndm5MeUgxSkVD?=
 =?utf-8?B?cW5NK1VMYW0xU081OXQvZDYxekRDVktzMUZFYWhLMm1jZFNsb25CdlVUMms2?=
 =?utf-8?B?K05Jd0pXY3doc25mMm4xTXFZVHBrbkplTi91MzA0Y1lyTmM4L3ZFbkdxZmNB?=
 =?utf-8?B?VmNxUzBxZFNUY3JaT0ozTVdHa1YrSUEydWZWL2MwOUhKYXJaNjFheG9VZm1z?=
 =?utf-8?B?N1JlZThSVm54YUhXK1k5Z05Edk91TGQwWTlLRmdrQWtlUkJzWFJJUk9CZFJL?=
 =?utf-8?B?ano1cWMyWkZReGQ5V3d4Rlk1UnRLV2JMNHRIbDc5aUQzOW1DUXNYNUxpOXFx?=
 =?utf-8?B?aWtGR3A4SGxRZlVjeTVPWGNzbWFTOXpFbk1zQXBLTWFLWDl2REx5MmNYU2xL?=
 =?utf-8?B?bUMzbGNmeVZOMThUTGFlUTZKSjVBK0hLb0YwMHlaSlMxMjFLYkRsZW9LeXA2?=
 =?utf-8?B?MjA3RjNzc28rNyt6d3pER1JVZVZyWXYvSi9BTk01L0YxbVN5NWp4RDNsd1NE?=
 =?utf-8?B?QnVLcGs3VkRmczVJUTEzRlZlL0FFWmw0TkEyMmxYcGg3ajlVbWhxYm5qNTNr?=
 =?utf-8?B?R3FxbitzMW14Z29SWUpQanpUK0w2aVZhbnlnUVZuTmZOL1FXbmJvQnptMVJj?=
 =?utf-8?B?L1lkaUtCcWZyTEN0MG1nTXB0NGN1TGRybjFmbzYxTnlRMGVXZmwwSTJqNHFN?=
 =?utf-8?B?ZFNXcVVnSWNjam5YTlVUbzFWN0NMenNuN1pvS3JKN3YyTUlJdFZYd1Y1QVh6?=
 =?utf-8?B?REIrbDhOZGhoMlJ5SmRyQ3pGVUdHTTM2UDJMTXhodTBoZ1BSU0o5c0V0RUhH?=
 =?utf-8?B?Z09YOTRPSm1pcThGQ0RUZytLWGE2KzNLSmlidGZWMEdkcThBTlU1TnY5V3BZ?=
 =?utf-8?B?MFUzNVpuZ3Q3ckVkZ3NxRWFwcUh5dXUxb1RFWW42bmN0V3l5REdNR1g0SzQx?=
 =?utf-8?B?QlExeXFPNG1jYU5nKzN0THlCRjQ3QjBnYnZsMmpYTERJZi82eE0rbFBGR1dm?=
 =?utf-8?B?a01KVzFIci9kUGxSa25GeG9kNjh0cXBoRGdGKzBTUWxQRUJNdlFaNzVjZ2xS?=
 =?utf-8?B?VklqYzRNLzVqZ25STi9xUVdPZENtcWlUdVBqYk8rTVllUVhqY3I4a0pqSlVp?=
 =?utf-8?B?QWVwNi90UzhLSHFYNmUyYTFjUU94Ly9oRnZMK3ZFQ3VRd1ZoMVNHSkJSSkZG?=
 =?utf-8?B?c1h5bVZLeE9sbVY3NHdiYXFJL1FodllDNkRsMFZuMlgzd0pTYjk4bHY1YU9N?=
 =?utf-8?B?ZmdNVDFCUGRabTZITEtYSWpyano2amZkd21tTHlIby80Z0RHOTV3TUJaM0k1?=
 =?utf-8?B?S3JtTFl6RGFLM1FPRU9WQWx4VGkxb0swd0V2TU5mS29QSXk3L3o0V0VPbDJp?=
 =?utf-8?B?NWdLdGUvM2RqNFRZQmZ6aUg0R3lzNTVrSmtjd25HUG9FODMyR0xHY0FjWTIy?=
 =?utf-8?B?ZExlM2U1ZWtpYzRMMGgzZW5OVXNqYmJvZk85T0R2RGtiTG1oeFdHeEJJeGdr?=
 =?utf-8?Q?NFJrgaLlpS58J7YU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1326BF537297954E827C06FAD71B89A8@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR03MB7419.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fee31f6c-a740-4b55-59cc-08de7dc12abc
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2026 09:49:33.1413
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MLiyHth4BibpM03gPcEr0JnRZwqsDFX4vYz3aG+0FmgYMteEXr4OlhWwR1SwodAHsr2hFLj+78oeTTNJ9i7s8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR03MB8454
X-Rspamd-Queue-Id: 363B623685F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[edwin.torok@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,citrix.com:dkim,citrix.com:mid,suse.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	APPLE_MAILER(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[edwin.torok@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

DQoNCj4gT24gOSBNYXIgMjAyNiwgYXQgMDc6NDcsIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAwNi4wMy4yMDI2IDE3OjI1LCBFZHdpbiBUw7Zyw7ZrIHdy
b3RlOg0KPj4gY2xhbmcgd291bGQgZHVwbGljYXRlIHRoZSBsb29wIGJvZHkgYW5kIGVuZCB1cCB3
aXRoIGEgZG91YmxlIGRlZmluaXRpb24NCj4+IG9mIHRoZSBzeW1ib2w6DQo+PiBgYGANCj4+IC90
bXAvdGVzdF94ODZfZW11bGF0b3ItMGYzNTc2LnM6Mjc4MjM6IEVycm9yOiBzeW1ib2wgYHZtb3Zz
aF90b19tZW0nIGlzIGFscmVhZHkgZGVmaW5lZA0KPj4gL3RtcC90ZXN0X3g4Nl9lbXVsYXRvci0w
ZjM1NzYuczoyNzgyNTogRXJyb3I6IHN5bWJvbCBgLkx2bW92c2hfdG9fbWVtX2VuZCcgaXMgYWxy
ZWFkeSBkZWZpbmVkDQo+PiBgYGANCj4+IA0KPj4gVW50aWwgYSBiZXR0ZXIgc29sdXRpb24gaXMg
Zm91bmQ6IGRpc2FibGUgYWxsIG9wdGltaXphdGlvbnMgaW4gdGhlIHRlc3QgcnVubmVyLg0KPj4g
DQo+PiBVc2luZyAtT3MgbWlnaHQgYWxzbyB3b3JrLCBidXQgd2UgY2FuJ3QgcmVseSBvbiB0aGUg
c2l6ZSBvcHRpbWl6YXRpb24NCj4+IGFsd2F5cyBhdm9pZGluZyB0aGUgZHVwbGljYXRpb24gb2Yg
YXNtIGJsb2Nrcy4NCj4+IFRoaXMgaXMgdGVzdCBjb2RlLCBub3QgcGVyZm9ybWFuY2UgY3JpdGlj
YWwgY29kZSwgYW5kIC1PMCBpcyBtb3JlIGZ1dHVyZQ0KPj4gcHJvb2YuDQo+IA0KPiBIbW0sIHll
cywgdGhlIGdvb2QgdGhpbmcgaXMgdGhhdCB0aGlzIHRoZW4gZG9lc24ndCBldmVuIGNvbmZsaWN0
IHdpdGggbXkNCj4gaHR0cHM6Ly9saXN0cy54ZW4ub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVs
LzIwMjMtMDQvbXNnMDAyODMuaHRtbC4NCj4gDQo+PiAtLS0gYS90b29scy90ZXN0cy94ODZfZW11
bGF0b3IvTWFrZWZpbGUNCj4+ICsrKyBiL3Rvb2xzL3Rlc3RzL3g4Nl9lbXVsYXRvci9NYWtlZmls
ZQ0KPj4gQEAgLTMyMyw0ICszMjMsOSBAQCB4ODYtZW11bGF0ZS5vIHg4Nl9lbXVsYXRlLyUubzog
SE9TVENGTEFHUyArPSAtRF9fWEVOX1RPT0xTX18NCj4+ICQoY2FsbCBjYy1vcHRpb24tYWRkLEhP
U1RDRkxBR1MtdG9wbGV2ZWwsSE9TVENDLC1mbm8tdG9wbGV2ZWwtcmVvcmRlcikNCj4+IHRlc3Rf
eDg2X2VtdWxhdG9yLm86IEhPU1RDRkxBR1MgKz0gJChIT1NUQ0ZMQUdTLXRvcGxldmVsKQ0KPj4g
DQo+PiArIyBjbGFuZyBkdXBsaWNhdGVzIGlubGluZSBhc3NlbWJseSB3aGVuIHVucm9sbGluZyBs
b29wcywNCj4+ICsjIHdoaWNoIGNhdXNlcyBhIGR1cGxpY2F0ZSBsYWJlbCBlcnJvci4NCj4+ICsj
IFVudGlsIGEgYmV0dGVyIHNvbHV0aW9uIGlzIGZvdW5kOiBkaXNhYmxlIGFsbCBvcHRpbWl6YXRp
b25zIGluIHRoZSB0ZXN0IHJ1bm5lci4NCj4+ICt0ZXN0X3g4Nl9lbXVsYXRvci5vOiBIT1NUQ0ZM
QUdTICs9IC1PMA0KPiANCj4gSSB0aGluayB0aGUgZmlyc3Qgc2VudGVuY2UgbWF5IHdhbnQgd29y
ZGluZyBhIGxpdHRsZSBkaWZmZXJlbnRseSwgYW5kIEkNCj4gZnVydGhlciB0aGluayBpdCBhYnNv
bHV0ZWx5IG5lZWRzIHRvIG1lbnRpb24gcHV0X2luc24oKS4gTWF5YmU6DQo+IA0KPiAiV2hlbiB1
bnJvbGxpbmcgbG9vcHMsIGNvbXBpbGVycyBtYXkgZHVwbGljYXRlIGlubGluZSBhc3NlbWJseS4g
cHV0X2luc24oKQ0KPiBlbWl0cyBsYWJlbHMsIHdoaWNoIG1heSBub3QgYmUgZW1pdHRlZCBtdWx0
aXBsZSB0aW1lcy4iDQo+IA0KPiBIYXBweSB0byBhZGp1c3Qgd2hpbGUgY29tbWl0dGluZyBpZiB5
b3UncmUgb2theSB3aXRoIG1lIGRvaW5nIHNvLg0KDQoNClN1cmUsIGdvIGFoZWFkLg0KDQoNCj4g
VGhlcmUncw0KPiBvbmUgb3RoZXIgcXVlc3Rpb24gdGhvdWdoOiBJc24ndCAtTzAgdGhlIGRlZmF1
bHQ/IFdoZXJlIHdvdWxkIGFueSBvdGhlcg0KPiBvcHRpbWl6YXRpb24gc2V0dGluZyBjb21lIGZy
b20gaW4gSE9TVENGTEFHUz8gQWgsIEkgc2VlIC4vQ29uZmlnLm1rIGRvZXMNCj4gdGhpcywgZm9y
IGFuIHVuY2xlYXIgdG8gbWUgcmVhc29uLg0KDQpPbmUgcG9zc2libGUgcmVhc29uIEnigJlkIGVu
YWJsZSBvcHRpbWlzYXRpb25zIChldmVuIGZvciBub24tcGVyZm9ybWFuY2UgY3JpdGljYWwgY29k
ZSkgaXMgdG8gZ2V0IGJldHRlciB3YXJuaW5ncy4NCkkgbG9va2VkIHRoaXMgdXAsIGFuZCBJIHNl
ZSBpdCBpcyBhY3R1YWxseSBkb2N1bWVudGVkIGluIHRoZSBHQ0MgbWFudWFsOg0KIlRoZSBlZmZl
Y3RpdmVuZXNzIG9mIHNvbWUgd2FybmluZ3MgZGVwZW5kcyBvbiBvcHRpbWl6YXRpb25zIGFsc28g
YmVpbmcgZW5hYmxlZC4NCkZvciBleGFtcGxlLCAtV3N1Z2dlc3QtZmluYWwtdHlwZXMgaXMgbW9y
ZSBlZmZlY3RpdmUgd2l0aCBsaW5rLXRpbWUgb3B0aW1pemF0aW9uLiANClNvbWUgb3RoZXIgd2Fy
bmluZ3MgbWF5IG5vdCBiZSBpc3N1ZWQgYXQgYWxsIHVubGVzcyBvcHRpbWl6YXRpb24gaXMgZW5h
YmxlZC4NCldoaWxlIG9wdGltaXphdGlvbiBpbiBnZW5lcmFsIGltcHJvdmVzIHRoZSBlZmZpY2Fj
eSBvZiB3YXJuaW5ncyBhYm91dCBjb250cm9sIGFuZCBkYXRhLWZsb3cgcHJvYmxlbXMsDQppbiBz
b21lIGNhc2VzIGl0IG1heSBhbHNvIGNhdXNlIGZhbHNlIHBvc2l0aXZlcy7igJ0NCg0KSW4gZmFj
dCB3YXJuaW5ncyByZWx5IG9uIG9wdGltaXNhdGlvbnMgZXZlbiBtb3JlIHRoYW4gSSB0aG91Z2h0
LCBkaWRu4oCZdCBrbm93IGFib3V0IGxpbmsgdGltZSBvcHRpbWlzYXRpb25zIGhhdmluZyBhbiBl
ZmZlY3QNCihmcm9tIHRoZSBleGFtcGxlIHRoYXQgd2FybmluZyBpcyBvbmx5IHJlbGV2YW50IGZv
ciBDKysgZm9yIG5vdykNCg0KSSBjYW4gc2VlIHdoeSBpbiBnZW5lcmFsIGEgY29tcGlsZXIgd291
bGQgZGVjaWRlIHRvIGltcGxlbWVudCBpdCB0aGF0IHdheSAoaWYgeW91IHJ1biBhbiBhbmFseXNp
cyB0byBnZXQgbW9yZSBhY2N1cmF0ZQ0KaW5mb3JtYXRpb24gZm9yIHNob3dpbmcgd2FybmluZ3Mg
dGhlbiB5b3UgbWlnaHQgYXMgd2VsbCB1c2UgaXQgdG8gZW1pdCBiZXR0ZXIgY29kZSksIGJ1dCBJ
IHdpc2ggdGhhdCB3YXNu4oCZdCB0aGUgY2FzZS4gDQpFLmcuIHlvdSBtYXkgd2FudCB0byB1c2Ug
YSBsb3cgb3B0aW1pc2F0aW9uIGxldmVsIHRvIGdldCBiZXR0ZXIgZGVidWdnaW5nLCB3aXRob3V0
IGdpdmluZyB1cCBvbiB0aGUgYmV0dGVyIHdhcm5pbmdzLg0KVGhlIG9ubHkgd2F5IHRvIGRvIHRo
YXQgY3VycmVudGx5IGlzIHRvIGJ1aWxkIGl0IHR3aWNlIChvciByZWx5IG9uIGEgQ0kgdGhhdCBi
dWlsZHMgd2l0aCBkaWZmZXJlbnQgZmxhZ3MpLg0KDQpJZiB5b3Ugd2FudCB0byBjaGFuZ2UgaXQg
SeKAmWQgc3VnZ2VzdCBzZXR0aW5nIGl0IGF0IGxlYXN0IHRvIC1PZywgd2hpY2ggaXMgcmVjb21t
ZW5kZWQgb3ZlciBPMDoNCiJJbiBjb250cmFzdCB0byAtTzAsIHRoaXMgZW5hYmxlcyAtZnZhci10
cmFja2luZy1hc3NpZ25tZW50cyBhbmQgLWZ2YXItdHJhY2tpbmcgd2hpY2ggaGFuZGxlIGRlYnVn
IGluZm9ybWF0aW9uIGluIHRoZSBwcm9sb2d1ZSBhbmQgZXBpbG9ndWUgb2YgZnVuY3Rpb25zIGJl
dHRlciB0aGFuIC1PMC4iDQpCdXQgSSBkb27igJl0IGtub3cgaG93IHRoaXMgYWZmZWN0cyB0aGUg
ZWZmZWN0aXZlbmVzcyBvZiB3YXJuaW5ncy4NCg0KPiBQZXJoYXBzIHRoYXQgd291bGQgd2FudCBt
ZW50aW9uaW5nDQo+IGhlcmUgdGhlbiBhcyB3ZWxsLg0KDQpIb3cgYWJvdXQ6DQoNCiMgVGhlIGRl
ZmF1bHQgSE9TVENGTEFHUyBmcm9tICQoWEVOX1JPT1QpL0NvbmZpZy5tayB3b3VsZCBzZXQNCiMg
YSBub24temVybyBvcHRpbWlzYXRpb24gbGV2ZWwNCg0KSeKAmWQgYXZvaWQgbWVudGlvbmluZyAt
TzIsIGluIGNhc2UgdGhhdCBjaGFuZ2VzLg0KDQoNCkJlc3QgcmVnYXJkcywNCuKAlEVkd2luDQo=

