Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0L7GDhT1pmmgawAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 03 Mar 2026 15:49:56 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 931901F1C78
	for <lists+xen-devel@lfdr.de>; Tue, 03 Mar 2026 15:49:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1244852.1544215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxR3u-0006FC-SG; Tue, 03 Mar 2026 14:49:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1244852.1544215; Tue, 03 Mar 2026 14:49:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxR3u-0006CV-PX; Tue, 03 Mar 2026 14:49:26 +0000
Received: by outflank-mailman (input) for mailman id 1244852;
 Tue, 03 Mar 2026 14:49:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dwqp=BD=citrix.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1vxR3t-0006CP-Nn
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2026 14:49:25 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a4010ec-1710-11f1-b164-2bf370ae4941;
 Tue, 03 Mar 2026 15:49:24 +0100 (CET)
Received: from SA3PR03MB7419.namprd03.prod.outlook.com (2603:10b6:806:39c::6)
 by CH5PR03MB7791.namprd03.prod.outlook.com (2603:10b6:610:211::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 14:49:16 +0000
Received: from SA3PR03MB7419.namprd03.prod.outlook.com
 ([fe80::8254:2aeb:5a33:a6dc]) by SA3PR03MB7419.namprd03.prod.outlook.com
 ([fe80::8254:2aeb:5a33:a6dc%6]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 14:49:16 +0000
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
X-Inumbo-ID: 2a4010ec-1710-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AdO9+cI2B0BjfDgxxvEEK7fM4i2A9Y23YKBUJ0dEh3Q9inltu/LQmmfyqxuGsX6VZLmtjd0CRSg6KYsNi3ahsdmpfsZnJRM1p1V5Avhm2RrHr0JjTTx3BWMKDXQ+hnYGwFBaL0tcWvgFG+4QhHCgxutqEx2ijixu/RDwDNO4HD+9NHr3/PBk61AJ68GFgzQVoTTAdkpwxFBdW9RvKADA/C1n1M2DpC4JLYoYeW7wkyvhBkrAl70Zzd+8rKUSbrLSx9ZVAFltQZWlbtGCkKGpSuX9UeOygg4tYSU9cadbNmozgDDzOFyji/WY2rdj0KrlFe0ppnUeG4RfcexuWz3x0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ayOsLpThfJqd4rC0u7zujKcy9FTm8kkwUbInuB/ThCg=;
 b=QT+yClo5Q/Erah1DagfVXhsV/+nR9I/kGM/jZBugJH4wq5YCBuovCAaQLyxwBovMTvry9rm95zmhYSGbCx0xU/2W6PyLbNzF3LzFzvIKO7C8RUK6oAmb0n+MDMSOOiErFCjwfi8I+9nH+n2oTJMYdtXfhviCsb6I6JpD75lw43qiTzVelkhx4sroEoHElTCnKF0u9ht4kvZyT7IIkdAg1/yh8Grv5of24ah4ClpW944/8+ToRBDPrfxEI/m+EHYUzGV1ZDKqXQPFrzm7ZAZ2+qptm2diG8aR3tsCtdg3hrGs7jKoveKtd8ZUhdSAWIxSJucIDRhQeO43xVJmYUHaxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ayOsLpThfJqd4rC0u7zujKcy9FTm8kkwUbInuB/ThCg=;
 b=b6aydSQ/jDyBx+I1Yk18kHP3I8Axm/83M8AlIn/CUS+D8CLga6iasQfzyvwx2geIMnIL6kRwuDl91kP3Auih7/2ghLyMEPtFfYPH+fWTWYX5lBTI4CckfkPdkPDgNf6e+eH6gXy6AHkKIC/dIWSHGBKwG9KlbzMKOkmrBhEYF3I=
From: Edwin Torok <edwin.torok@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 3/4] tools/tests/x86_emulator: fix undefined behaviour
 in shift
Thread-Topic: [PATCH v2 3/4] tools/tests/x86_emulator: fix undefined behaviour
 in shift
Thread-Index: AQHcp9gCO67+yoRhk0SyNFZDTeRIWLWc3oEAgAALkwA=
Date: Tue, 3 Mar 2026 14:49:16 +0000
Message-ID: <7A6049F4-8AAE-4074-97E5-65070E25A165@citrix.com>
References: <cover.1772189234.git.edwin.torok@citrix.com>
 <cdd62288eed6b147e6c3e6d2c402de36cf3ce42a.1772189234.git.edwin.torok@citrix.com>
 <02d59353-8d59-4151-8428-dd6458f9165b@suse.com>
In-Reply-To: <02d59353-8d59-4151-8428-dd6458f9165b@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.400.21)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR03MB7419:EE_|CH5PR03MB7791:EE_
x-ms-office365-filtering-correlation-id: 11caad99-8ad4-4b87-c972-08de79340b49
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 dX+Ti14VDSuKYVfS2yePiB6gUudBtNReOlY8QxyCo2dVWPP2RI2onzFWVmx+QFMqwMpv1/j2p4PCZHHCD1EZrxiqL3SxpMxR68rQEI5PlPhWG9gwazsWQkjlGzYOXanNPTfnIfsyAneK7yshrws4eLR0nLGozDdw5lA3DBwim3ErrPcPw7MG4/ZdkJM/TNHIsn4Q/fqCwKSUnfMJJ/gh39hosGUr6HKpucZsIL39FD9r8A1ukoR29OnG4e1W7u4VS+A/YuzoTrJRCd16lTs5xeBkPqRPXXkkFbzs1vAyOd/6UVvMDs5MnQpD/alWZfKHGeCSfI91apX6AxxgqSYAREmz0K59b/mWjnR2gX1i95dGAjr7UtmJGml2/6cSA7qrc+Vwx1wC65cSF9SRUIAOuXrqs2bsLLhz20/vW3bQv0ChCxDbKUJK45mm1Jx5Ysg2USM37Pmu4aTxMhZ88+tEqoMlDjLh3PcJC0ew4D2lY+SM3yKuKPjV4Ua4zKDlovmrFbVfzGPNJMuWbiNxLweqpiA2/GIFqRcqBZjuSfk9RfGwH2fsuFxWn4L1R+I1lMsXbMh7iC6ZhYRNFvGQhsWkQzyVg+kLyau+uw09JO+dwmIEh7ZqIz5lO7dbq/1UL/tgbDV+9r7GZaVYarhDOnk1QXEF8a2MFRa5RxOSyUVKNaBvmWCsMAAfkax+9KdC1KX6VXa2aWyMUVPqzu+uzvNxr6vBFsu4Y+QIS4+IprZCVPzBTxh8tZb7LMZBlAxRsExJLcDHBSziEo0gyjtYv8VwqfPIGTuFMNJSHLlLmfW7AbE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR03MB7419.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RXc2czRvSXpLeitiZnA1TGtwQWFIUTAzTVBFc2dLOVY1OVRaN25zWG5GVGJv?=
 =?utf-8?B?ZHJuZGFXSWNCbGUwR0tyanJOck9lR3NkdkUzbTFhWHd6ejZPaHZwb2s3NzIv?=
 =?utf-8?B?VW1vMFhaQXNMRHRiNk1tWksvTnNpb05IVm9tRW9mRXFoV25FUWh2VEhXcy9D?=
 =?utf-8?B?ZndvWVJMNlczaHJSaGpJcWUwczEwTXN6NzFHOU13KzJGRG50c01mU2hVQjJj?=
 =?utf-8?B?cWUyend4RmZacXFuNkZUb0x3YnEweUdYQkpUS2NxaDdsL1UzV2hFN2VpWERV?=
 =?utf-8?B?c0ZWQjFqeVYyaEQyL2FTUE90cktKcW40SFIwcnRIWHRNZklOTEdqV1lqMWNl?=
 =?utf-8?B?RWpWTXR4NzRSa2FkYkNjSGY1WTBJazBSYS9pZ1Q1MWlTdjBWdVB2TVBhZnR3?=
 =?utf-8?B?QTl4dTg2NU44TnEwVmZTR1BlZHprdkthb2V1WWF6MXppOEpIWFBtMDVrdFd4?=
 =?utf-8?B?Zk9GbFdyNnplNEZFR2QxSzhhSFlkTWUvQ2pOVzROTDVRY2h4aGpBTFkzZU1M?=
 =?utf-8?B?REFVL2k4eENnQVk0MDI1QVlMSEJNbHdkVitOR2Y5bW5kUGx3YjhlTmtFTGFr?=
 =?utf-8?B?UUZwdGVsa3N0QkFpU25mL21qSFpNT1NiYldsWmN3MVNCeGZDZDBVZDl0L3FO?=
 =?utf-8?B?cmgrbFdsaTUyeTVZaVdsUkNQZnlYZGJZOVRPNmsxS203bHJaYUZoTFlhWVpi?=
 =?utf-8?B?YkxOQVpkaVpxckU3cXhOMm05MXBDeVoyNXhwL3VTYXZQT05JUWtMU1ZQbVRZ?=
 =?utf-8?B?VWxVOTB6c1hTZVVpQWt4OTRSdnlGeS9wWTh4dmpUWWtFMUh6aUw2Y0hjZzFW?=
 =?utf-8?B?ODBMNFNQa2NOdXUvcWVLeU82eSs1U0JPYytQUW5BZ3V3R2tKN2t5dGs3ZWV5?=
 =?utf-8?B?M0xtNDZLTFloRTVaQ3JhNXJHa1VRbTlHOXFuemJJRnpRM0YrQVFpZE5qdEJ0?=
 =?utf-8?B?ZVQyRm4xY1Z4akdrdDZWeS9ncjVCNU1tanliWGNDWDByMkFRbUZzVTk3S3Ry?=
 =?utf-8?B?SUFmNDZTdFAwUUZ0dks3M0ZwZTZaRVFQaGJuSG9ieFg4TzQ3bGZuVUJPRTNC?=
 =?utf-8?B?SWwxdWMrV3ptbmRUM2FjTjdNRXAvRkQwUzdzNklSYXNBTnFKRUJUbUlJdU9j?=
 =?utf-8?B?dWYrd0tSS1hhVWJWeUw4VlFjZXl4RHVBeVZQby9ubTJsTVVsZUpSUUN1M2xj?=
 =?utf-8?B?Qjl3cnB1RGtnMmJXY2xtMFRQbHdEREdxZ2ZmbXpFVGZhQVNYb0s0WnR4aXo5?=
 =?utf-8?B?SjNyN1dEZkF3Q3dCMFc2eGFzUU1scjBuQ29PSGpTODhKTDBoMkU4bWhaVkMy?=
 =?utf-8?B?SG5MeUo0aUZkM0V3NTRUeWc1Rm5MV1gvTjEzSXhJVm42RVZtNGQ0dlIva1Fr?=
 =?utf-8?B?VDE3bVYrUXVzblBJbEZzUVhQM00vcncveW9nYWZoczRjdytVYWVHaU9rejY1?=
 =?utf-8?B?T1RCelJJTkZiZk01NmFRTGF4OGUyUk1aSktOaEV6dXF5aFV3R1Q1VVlGdi9Q?=
 =?utf-8?B?Q1dHMlFEaTdvQ3Y3RHI3Tm41M3NXUnFPQmFNZlEwMCtreDBWRW9VM0Y5eVZP?=
 =?utf-8?B?b2tvaFptdFZzeWlqRUFQWk55dEoraFd5STk4T0tHNXQ0UUc0aWc2cVNEZHVl?=
 =?utf-8?B?bk5aandzd1NGeEhCRnAyU0ljMWVjTndnYXRhenoxRy9oZnZzSzYxdVRMMVBY?=
 =?utf-8?B?L204cFBtVHRTbTY5UFppYWRhMXcwUk04dVVGRXA0dkxFN29Zd3dGMkNDa21T?=
 =?utf-8?B?aUJqQXVna1oyWWV6VW4xK2U0dnFPQ3pQa1p4RnZoTVNOTmxOcEh3N3NwUGNZ?=
 =?utf-8?B?djhMUm1sdTZnYkZMQ0loY0xLbndyQUNZbjM2Wk9JNnVQVHRMT0oyWUc1cnZn?=
 =?utf-8?B?eGtGSFhuL3BldVFUR2JuODZlNnQycXVWZE9uYkhMRjdlZ1I1b1ZMNnlyZmxz?=
 =?utf-8?B?Sk1sdTRNem5VWWVkNm9QeWNjUmNsSTE2T2dwbldQc2xPY3hkcjhoUFBpdWc4?=
 =?utf-8?B?aVFXWUhVRHkza2FMVk5FbGVDN0pqazBaZXdmTnRhaC9tNkxNR2dSU0hIQU1P?=
 =?utf-8?B?clFYb0Y4d3hma3cwRkFFM0Rkd290VkxiWU55Z0orUHVXVGRsa2xlQ1BMaWRi?=
 =?utf-8?B?N3RDMEJ3c1lmOWVxMzIyNHF2cmFocFdsYWR1VzJEYVJvRTgxaDJMbWg1S0xH?=
 =?utf-8?B?QkgxTEJ2UHBHUlh1dWxoMmV4cDJhb1VsNkorcjZlbTFjWmI0bHhxUWZhbFIy?=
 =?utf-8?B?SG9pVnRtN1B0SEI5M2tsTk9OTEVnaUh2UnYrdnB1UUl4cWluSDJ1SnViWkRU?=
 =?utf-8?B?dTRMNTMwcGd4YWlmd3d1cDdZNzVkcEMzY3J6NEYxWXhhSHFsdTRhWHN0Szdj?=
 =?utf-8?Q?cUZmL6R+PMXOinQk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E7F3E5D82933534AA8B84FF1271B97CC@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR03MB7419.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11caad99-8ad4-4b87-c972-08de79340b49
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2026 14:49:16.7481
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CHCKyeVhfCrKKY/99ob4ha/9I1Cr9Z9Ka5702NFNqFucGLaj4mh/Y56vA6WKvVsHVXD0fuAehmGInz8MzsQr5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH5PR03MB7791
X-Rspamd-Queue-Id: 931901F1C78
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
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

DQoNCj4gT24gMyBNYXIgMjAyNiwgYXQgMTQ6MDcsIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAyNy4wMi4yMDI2IDExOjU4LCBFZHdpbiBUw7Zyw7ZrIHdy
b3RlOg0KPj4gLS0tIGEvdG9vbHMvdGVzdHMveDg2X2VtdWxhdG9yL3Rlc3RfeDg2X2VtdWxhdG9y
LmMNCj4+ICsrKyBiL3Rvb2xzL3Rlc3RzL3g4Nl9lbXVsYXRvci90ZXN0X3g4Nl9lbXVsYXRvci5j
DQo+PiBAQCAtMTEwMCw3ICsxMTAwLDcgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKiphcmd2
KQ0KPj4gICAgIHJlZ3MuZWRpICAgID0gKHVuc2lnbmVkIGxvbmcpcmVzOw0KPj4gICAgIHJjID0g
eDg2X2VtdWxhdGUoJmN0eHQsICZlbXVsb3BzKTsNCj4+ICAgICBpZiAoIChyYyAhPSBYODZFTVVM
X09LQVkpIHx8DQo+PiAtICAgICAgICAgKCpyZXMgIT0gKCgweDIyMzM0NDVGIDw8IDIpIHwgMikp
IHx8DQo+PiArICAgICAgICAgKCpyZXMgIT0gKCgweDIyMzM0NDVGVUwgPDwgMikgfCAyKSkgfHwN
Cj4gDQo+IFdoeSB0aGUgTCB3aGVuIHJlcyBpcyBhbiBhcnJheSBvZiB1bnNpZ25lZCBpbnQ/IFdp
dGggaXQgZHJvcHBlZCAoaGFwcHkNCj4gdG8gZG8gc28gd2hpbGUgY29tbWl0dGluZyk6DQoNCllv
dSBhcmUgcmlnaHQsIGl0IGlzbuKAmXQgbmVlZGVkLCBtYWtpbmcgaXQgdW5zaWduZWQgaXMgZW5v
dWdoIHRvIGF2b2lkIHVuZGVmaW5lZCBiZWhhdmlvdXIuDQoNCkJlc3QgcmVnYXJkcywNCuKAlEVk
d2luDQoNCg==

