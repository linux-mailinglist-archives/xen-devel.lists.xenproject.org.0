Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKiMKbAEp2k7bgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 03 Mar 2026 16:56:32 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFDE1F3107
	for <lists+xen-devel@lfdr.de>; Tue, 03 Mar 2026 16:56:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1244923.1544275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxS6M-0000kO-NW; Tue, 03 Mar 2026 15:56:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1244923.1544275; Tue, 03 Mar 2026 15:56:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxS6M-0000j9-K5; Tue, 03 Mar 2026 15:56:02 +0000
Received: by outflank-mailman (input) for mailman id 1244923;
 Tue, 03 Mar 2026 15:56:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dwqp=BD=citrix.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1vxS6K-0000j2-Tf
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2026 15:56:01 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 75b436c1-1719-11f1-9ccf-f158ae23cfc8;
 Tue, 03 Mar 2026 16:55:55 +0100 (CET)
Received: from SA3PR03MB7419.namprd03.prod.outlook.com (2603:10b6:806:39c::6)
 by CH4PR03MB7652.namprd03.prod.outlook.com (2603:10b6:610:246::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 15:55:46 +0000
Received: from SA3PR03MB7419.namprd03.prod.outlook.com
 ([fe80::8254:2aeb:5a33:a6dc]) by SA3PR03MB7419.namprd03.prod.outlook.com
 ([fe80::8254:2aeb:5a33:a6dc%6]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 15:55:46 +0000
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
X-Inumbo-ID: 75b436c1-1719-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MZvr71TLkqMn35tu1XmSDwGBRunKPCdbqdYLOezT4FPLZs3Epco7qs8+ojt/gdCQrzkxbDA4A1LWLPioMjFp+MWJ+/LGxHWA5me2I8/b8GrugD3iuXPn+P0V05iJevxFHNXhs+HIaHXooQZ3u7vHzWoJYoDWNJ+1C9oZ1TzBwBvlcuf3wK+r/YWTN6AxkfQe+3v2BrlOWN9pD+CpqjEYCGt/J0VuVyvXmllPDvhOx8xbL9snmcRzbFyvHqAD721poRbigdYN0H6/F7z5lU5W0YZFzhoQeZ4MeALIIWXMPXsYCjwOt0QrbPXswz3ZEbdkH1CPm05ZGh1ynqvGdsKe6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hmuvr/6jLEHfqNNjocyGQ5zaxBM2H0QcvdisHflQEag=;
 b=RnfrULQM8R9slx81poXubOqSVEFI1yfnAo9hwU2LGMFYVBSI2OHKRNYwFdNLbQzyfCuBGOGlHg+NRYK0R3s+9wRKsV3ikFVgd81kejs2jIayGjb0la1xdGv6mtec3MeYJj6YZsZ//IesNZLNXz5OWjf4V4qmM04NeBqYo8SSVxRsFQKAFJaCpzIh8nD9x9tAEv3TE3yYylgoRoSz0gCurwHh5FKniRMstWBNmrXAZQayShGwtwCi8ya2LP/8TnoajEFV9wyjIPk+8pyuddvDxJ2Yrw6CfuPJ//2x0B64waCD5NSXF9kiprrrSpngrf3B9/ujB9I+bazfOW4P9zTj7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hmuvr/6jLEHfqNNjocyGQ5zaxBM2H0QcvdisHflQEag=;
 b=mAMO/TSyzm2S2aoMvWBFPqmxzU5ryQ/biWZ12Wxc8PF1oQCPJWxybANvLmrhj/NoM8kHOM//n478ZBsQTN/TjGWE2rm9V4R5rFjmlKFJAJH4JksGZ/Lfrw9gUzfkre4lg+GJj2vvQCh+LH/kK4Km1byGkZ6uKF1XIGbH6yxfnlg=
From: Edwin Torok <edwin.torok@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 1/4] tools/tests/x86_emulator: avoid duplicate symbol
 error with clang
Thread-Topic: [PATCH v2 1/4] tools/tests/x86_emulator: avoid duplicate symbol
 error with clang
Thread-Index: AQHcp9gBGAcR9pePk0GnYyu6dQzUZLWc3C6AgAATegCAAAfEgIAABTyA
Date: Tue, 3 Mar 2026 15:55:46 +0000
Message-ID: <004F02CE-B8C8-40B5-8453-C754EBE92022@citrix.com>
References: <cover.1772189234.git.edwin.torok@citrix.com>
 <358a87d89d50475a57f2a5d6ebea01d95a1df6d7.1772189234.git.edwin.torok@citrix.com>
 <766824c8-2ec5-45bd-9aed-1e84ad3ff779@suse.com>
 <B5EFCE28-79BA-403B-8F44-C4E7606BACE7@citrix.com>
 <d5c0e218-bfc4-4f37-901c-b622f90b7bd2@suse.com>
In-Reply-To: <d5c0e218-bfc4-4f37-901c-b622f90b7bd2@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.400.21)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR03MB7419:EE_|CH4PR03MB7652:EE_
x-ms-office365-filtering-correlation-id: 6014d258-a11b-47fa-a557-08de793d5546
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 RLOFx/23VEbJq13XeaZTNnw/FMCScNwlsvDp5W/kpnhhQTYV9Esgb0Iga2VUf5s4TjfXOJxBI69+DeusHGWQlGITuIGAA66ZFLS0JHyX+1ov5VmTfHz+ICG/reAJn8l6RjVgregCKtXxKbGWJH6zG8EeMk3VhSJJ+vT4tSpG1r1KOnj45ED1AXCTh+VOAN2Ym+rvqwVOkg5HnGW8ZQSRz5M8/KBOc6jQq3MOyTCdIQ76BL6TLDUgqKEnFti/L6/98foBaZSsmnZee9kj6W/9d61JVvRYp8Zx4XnCFB+n+yftgPADYCOLv9v8s5Usu84Kfcd+Y/9snrzynRykEb2+CSidmAMYBU4zNRbCOwgE59wp0HQPwtpqAGjiUvMYxV9J6iliPqV8utmNahy/1d3ql5ZL+mlE0nORR76LklxsWvoknNgrio7rqq5Dee4RU0aKQoyPNZgJn9gK3taX4jF/vkM26EHHBLn7oNuw9QjSxNIDtVrAzqqQn4cuaWFC5SreKMLjvobCKBHudS4wmIcs0ZT/kolFuz2BrNlK+I8Q8ym8GCYhAVdEzIoc1/LAXA8Zpxu0ChyevD83PiwD6Vey0DNGxmzPNNfo/1cTWoFjECocflW5gFlETe+zNMby96Eq5w5yweLX/x/marBaaxc//7dVptdjuM69YBqMXVtl3sMGPS2Bx6EehVMU36yVwzwihg/wu/WsBy/b/Hs6R9gthI5FqLitSrocmXhSeh/x4bczU90+lBseaOON+PfzDnXO
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR03MB7419.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WFRReHhhZjBDdEZjdEhKSjQ1RVJiTU5WSVF0U0oxTnBxNWVtZHBhY2trbVgz?=
 =?utf-8?B?Smh1M1dacUFBcktXcUFUa1pINVBIS0xHQTBQS2RDRjlxcklEOUVtNTZzWEYr?=
 =?utf-8?B?dkNnRDJ4ankwNzFEeTlCQ0NpNkpKRTVDN3JvUWpEWHlNSGFUYWgvMENJd3VO?=
 =?utf-8?B?dFcxaHYyc291L0YxRUFSWTRadDA5dEg4VUtxeld0TVVRa0dieWpUck56aVNs?=
 =?utf-8?B?RkhMRjBzakxZcWFIU1VtYk1UelcxMHAweldvQk5DR052anIwUm5qYnc1N25u?=
 =?utf-8?B?TUUwS09nbWVuOFg3T2ZGRVordThlY3NFWE04Q2dWRlhOUXlJWDZlV3hGVXc0?=
 =?utf-8?B?VWh3MmdPcTlyMDRiTHJuRnhCTlkvVFduMWZwaGRuaERyU1BIS2N2RHZtemFx?=
 =?utf-8?B?QkNucEY4b2o5bkgrakJzS3F1VEJvUmx6QmdMV0p6UE5tMEhCMjZ3ZC9RTmY0?=
 =?utf-8?B?a2ptRU1VQjB6RWl6N1Y2Z0wxR0JOTEhNTDJlMVFSc2dqcXoyTWptejFXc1RW?=
 =?utf-8?B?T1NEQ2VCWnN4NDV3TnV5TWdEWWw5cld2L3ltUDZYbnJiOHJPaml2TjFKWmwx?=
 =?utf-8?B?QmxYNE82MmtDaEZEU2hBeG1CUEhLVGRIVmh4L0JraTIwcjlDV1crcXl2Zld2?=
 =?utf-8?B?ZXhXc0hwNWtyWXFXdGdVM0lkR0JFZXZrcVRGZU1BMEozZ0p1UU1xemF2K2tW?=
 =?utf-8?B?WHJQZUo5NmNIR3pPU2pGTWs0K0tDcjA1TUZpVDQ1NzRGZXdpRjUxNldNR25Y?=
 =?utf-8?B?dkZYaEJFNTdZL3IwSFNKMWRQcVdud0FneGFZcUY4bGp2cmJVazBtOXZtSnYz?=
 =?utf-8?B?UjVTZWx2UXQrOW9YOHVrZE9Qekp6dkRQZWl2T0VITjhONFY3OERPQ051cVRG?=
 =?utf-8?B?T0ozcWo4Wlo1WDNzbFFzbzdoNGFQWFUybzBWQWFkZkdoWkdCK1l6ZTlOREs0?=
 =?utf-8?B?bXIydDZZVTY5Q0NuMVhvZFk5RVBpU2ZVSFNWWFl3QVFLS2ZPZExaYkxscS94?=
 =?utf-8?B?b2djQ1VMNHc1UjJDY1ZlMjVpbllLTHFLTSs0cmxVT2czL0lyVkN6NkZtdllp?=
 =?utf-8?B?QWFySlhWUUdCcjNKbmVKdDdOQklJejNpOE1vMmJaSG95aVpOYkpqTnpVMnAv?=
 =?utf-8?B?V1hNSVdDNVRjOTZqai80enAzcGhPSE5xL1ZLSnlVbkl3VGIrNHFOU09wRGlB?=
 =?utf-8?B?Q3I2dy83bHRvSlBOenZ5TXA4cjVqNmRmTXVEOFo3Qmh6YW5aS1dleEhpTFZt?=
 =?utf-8?B?WVVZcnNxSGl1Vkh6OGdGT2t4eTZWR1VSZUI1TWhjS212QWxIK2ZkQXFidUNL?=
 =?utf-8?B?bFhEUkdVSWpjVGtseFhTYmdGTzd5bUY4UkpDTGNxMURodS9EL0VxcFpiUGwx?=
 =?utf-8?B?YkVKeThrZjJlZU8xaHdCYVlxdUZxVGZ6emdtSVFDTE82UEprNEp6OWZzTnFm?=
 =?utf-8?B?MWc1YlBWeGdHUEloKzdUb3ZSWFJPcWNMejlvTWJoUWU1bklnREtheUNqRk0x?=
 =?utf-8?B?M1lUd3FXU1FCWkcxU3Rtd3N5Z1hsOUIvdXhjaHFHcXh5MmtJRlNvWThCN0xW?=
 =?utf-8?B?MHpNNWF4OFU4eC9hWWFPVHhYTUNQY0hIZVFZbU5BRUt1bDF4eEljcmdmN3J0?=
 =?utf-8?B?YW5XbWMveml4dGFZa1MzREVtMUdvc3JsVlcvVWVGSmhvblZJdTBQVTV4ZjFw?=
 =?utf-8?B?UTdIT3lQNkNyQlVpWGpHT3cveHNWOSs5Nk1UQ2sxd1ZadjVkVGpTNHhWcUVL?=
 =?utf-8?B?aUplREZlS2ZsMGdsenZTNmVpOTBTNXZObk5iZlRUMlpWa3VTZlcwSnRuODlN?=
 =?utf-8?B?YUxyOFAyRWkydEIzV01mbG1GMnRoSjdOd05MeDhWSkNITHF3K1poVExLTVZu?=
 =?utf-8?B?Q0ZFTTVSZHMrdkZlRkdQRnhkenF5QUgrWk5pV0l2c1IwVzIxTko2UG00Z0Ra?=
 =?utf-8?B?Z2luVGdrQ2NSVFBDQ3ZSaTV0Uk13V0Q4Q0lmRms0UmJ1a201OWJDc3pLREN5?=
 =?utf-8?B?aW0reHhyZnhIalhKZXRncTQ1aFErMFR6UTBBTmdkRlVHRWhZQjdGNHl6T0VI?=
 =?utf-8?B?a2VFc2owTlB6NHNhVDNNaFhMUnV5QlJVTUxqV1Z1cFhhZ2ZjbjhBZFdSMXhO?=
 =?utf-8?B?Y2hnd09YR1hDcGlYWTNlTlB4N3lCS0FXdzdZTWNoTVozR0RvVys5MjhVK2cy?=
 =?utf-8?B?aGFacmVHZ3NIVTJaSFBlK0MwdjZ0MUJUUi9DUjdDWk9tMjNlZEVicTFYcW1V?=
 =?utf-8?B?S3ViNHpoUlZyVUtJTWVIZDRpNHB1TmZqbG95RzYxRkl3VlVsWWZpWGJpOUJQ?=
 =?utf-8?B?aThYZ2NCVTcrNkxZTncwV2VvSm5za2RpY3VuZ2t4Um5iUXJZaVExRzRIZi80?=
 =?utf-8?Q?M7OtOIwQHQfxYzZY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <74A4FED04D101743874A770E142AFC56@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR03MB7419.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6014d258-a11b-47fa-a557-08de793d5546
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2026 15:55:46.3671
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SkbNyzd17M48ZGwgnoVMyQVdH8eXgWOB1Xj5YV+2k1UHkWBaBmbfauTC/y3DcMTReDLZhyzGzZQoDCtdcwAu+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR03MB7652
X-Rspamd-Queue-Id: 1EFDE1F3107
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,llvm.org:url,xen.org:url,lists.xenproject.org:rdns,lists.xenproject.org:helo];
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

DQoNCj4gT24gMyBNYXIgMjAyNiwgYXQgMTU6MzYsIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAwMy4wMy4yMDI2IDE2OjA5LCBFZHdpbiBUb3JvayB3cm90
ZToNCj4+PiBPbiAzIE1hciAyMDI2LCBhdCAxMzo1OSwgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPiB3cm90ZToNCj4+PiBPbiAyNy4wMi4yMDI2IDExOjU4LCBFZHdpbiBUw7Zyw7ZrIHdy
b3RlOg0KPj4+PiAtLS0gYS90b29scy90ZXN0cy94ODZfZW11bGF0b3IvdGVzdF94ODZfZW11bGF0
b3IuYw0KPj4+PiArKysgYi90b29scy90ZXN0cy94ODZfZW11bGF0b3IvdGVzdF94ODZfZW11bGF0
b3IuYw0KPj4+PiBAQCAtMTg4Miw4ICsxODgyLDEzIEBAIGludCBtYWluKGludCBhcmdjLCBjaGFy
ICoqYXJndikNCj4+Pj4gI2RlZmluZSBkZWNsX2luc24od2hpY2gpIGV4dGVybiBjb25zdCB1bnNp
Z25lZCBjaGFyIHdoaWNoW10sIFwNCj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgd2hpY2gj
I19lbmRbXSBhc20gKCAiLkwiICN3aGljaCAiX2VuZCIgKQ0KPj4+PiAjZGVmaW5lIHB1dF9pbnNu
KHdoaWNoLCBpbnNuKSAiLnB1c2hzZWN0aW9uIC50ZXN0XG4iIFwNCj4+Pj4gLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICN3aGljaCAiOiAiIGluc24gIlxuIiAgXA0KPj4+PiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIi5pZm5kZWYgIiN3aGljaCJcbiIgXA0KPj4+PiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgI3doaWNoICI6IFxuIiBcDQo+Pj4+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAiLmVuZGlmXG4iIFwNCj4+Pj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGluc24gIlxuIiAgXA0KPj4+PiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIi5pZm5kZWYgLkwiI3doaWNoIl9lbmRcbiIgXA0KPj4+PiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICIuTCIgI3doaWNoICJfZW5kOlxuIiAgXA0KPj4+PiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIi5lbmRpZlxuIiBcDQo+Pj4+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIi5wb3BzZWN0aW9uIg0KPj4+IA0KPj4+IE5pY2UgaWRlYSwgYnV0IHdoeSBt
dWx0aXBsZSAuaWZuZGVmLCBhbmQgd2h5IGVtaXR0aW5nIHRoZSBpbnNuIGV2ZW4gaWYgdGhlDQo+
Pj4gbGFiZWxzIGFyZSBhbHJlYWR5IHRoZXJlIChhbmQgaGVuY2Ugd29uJ3QgYmUgZW1pdHRlZCBh
IDJuZCB0aW1lKT8NCj4+IA0KPj4gSSB0aGluayB3ZSBzdGlsbCBuZWVkIHRvIGV4ZWN1dGUgdGhl
IGluc3RydWN0aW9ucywgc28gdGhleSBjYW4gYmUgY29tcGFyZWQgYWdhaW5zdCB0aGUgZW11bGF0
b3IuDQo+IA0KPiBPZiBjb3Vyc2UsIGJ1dCB0aGV5IGNhbm5vdCBiZSBleGVjdXRlZCB3aXRob3V0
IGhhdmluZyBhIGxhYmVsLiBXZSB1c2UgdGhlDQo+IGxhYmVsIHRvIHBvaW50IHRoZSBlbXVsYXRl
ZCBJUCB0aGVyZSwgYW5kIHRoZW4gd2UgdXNlIHRoZSBlbmQgbGFiZWwgdG8NCj4gY2hlY2sgdGhh
dCBhZnRlciBlbXVsYXRpb24gdGhlIGVtdWxhdGVkIElQIGhhcyBhZHZhbmNlZCBhcyBleHBlY3Rl
ZC4NCg0KT2ggdGhhdCBtZWFucyB0aGF0IHdlIHdvbuKAmXQgYWN0dWFsbHkgYmUgdGVzdGluZyBh
bnl0aGluZyB1c2VmdWwgaW4gaXRlcmF0aW9ucz49MQ0KKHRoZSB0ZXN0IHBhc3NlcywgYnV0IGl0
IHJ1bnMgdGhlIHNhbWUgdGVzdCBhcyBpdCBkaWQgb24gaXRlcmF0aW9uIDApLg0KDQpJIGhhZCBh
bm90aGVyIGFwcHJvYWNoIGluIG1pbmQgKGFsd2F5cyB1c2UgYSBsb2NhbGx5IHVuaXF1ZSBsYWJl
bCB3aXRoICU9LCBhbmQgdXBkYXRlIGEgQyBwb2ludGVyIHRvIHBvaW50IHRvIGN1cnJlbnQgb25l
KSwNCmJ1dCBpdOKAmWQgYmUgdmVyeSBpbnZhc2l2ZS4gV291bGQgaGF2ZSB0byB1c2UgZXh0ZW5k
ZWQgYXNtIHN5bnRheCBpbnN0ZWFkIG9mIGJhc2ljLCBidXQgdGhhdCBpc27igJl0IGV2ZW4gdGhl
IGJpZ2dlc3QgcHJvYmxlbToNCmFsbCB0aGUgJTAsICUxIHdvdWxkIGdldCBzaGlmdGVkIGJlY2F1
c2UgSeKAmWQgbmVlZCB0byBpbnRyb2R1Y2UgYW5vdGhlciBvdXRwdXQgdmFyaWFibGUuDQpBbmQg
aWYgSSBkb27igJl0IGludHJvZHVjZSBhbiBvdXRwdXQgdmFyaWFibGUgdGhlbiBjbGFuZyBjb21w
bGV0ZWx5IG9wdGltaXNlcyBhd2F5IHRoZSBwb2ludGVyIG9uIHRoZSBDIHNpZGUsIHRoaW5raW5n
IGl0IGlzIG5ldmVyIHdyaXR0ZW4gdG8sDQp2b2xhdGlsZSBtaWdodCBoZWxwLCBidXQgdGhhdOKA
mWQgcmVxdWlyZSBldmVuIG1vcmUgY2FzdHMpLg0KUHJvYmFibHkgbm90IHdvcnRoIGdvaW5nIHRv
byBkZWVwIG9uIHRoaXMgcGFydGljdWxhciByYWJiaXQgaG9sZS4NCg0KU2luY2UgdGhpcyBpcyBq
dXN0IHRlc3QtY29kZSBtYXliZSBJIHNob3VsZCB0cnkgdXNpbmcgLU8wIGluc3RlYWQgZm9yIGNv
bXBpbGluZyB0aGUgZW11bGF0b3IgKnRlc3QgY29kZSBvbmx5KiAoaS5lLiBhZGQgTzAgdG8gdGhl
IHRlc3RzL3g4Nl9lbXVsYXRvci9NYWtlZmlsZSkNCkkgdHJpZWQgLU9zIGZyb20gaHR0cHM6Ly9s
aXN0cy54ZW4ub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMjMtMDQvbXNnMDAyODMuaHRt
bCwgYnV0IC1PcyBpcyAtTzIgd2l0aCAqZXh0cmEqIG9wdGltaXNhdGlvbnMgdG8gcmVkdWNlIGNv
ZGUgc2l6ZSBmb3IgY2xhbmcsIHNvIGl0IGRvZXNu4oCZdCByZWFsbHkgdHVybiBhbnkgb3B0aW1p
c2F0aW9ucyBvZmYgKGl0IHR1cm5zIG1vcmUgb3B0aW1pc2F0aW9ucyBvbuKApikNCmh0dHBzOi8v
Y2xhbmcubGx2bS5vcmcvZG9jcy9Db21tYW5kR3VpZGUvY2xhbmcuaHRtbCNjbWRvcHRpb24tTzAN
ClRoYXQgaXNu4oCZdCBuZWNlc3NhcmlseSB0aGUgY29ycmVjdCBzb2x1dGlvbiwgYnV0IGlmIGl0
IHdvcmtzIGl04oCZZCBhdCBsZWFzdCBhbGxvdyB1cyB0byBiZWdpbiBydW5uaW5nIGJvdGggR0ND
IGFuZCBjbGFuZyB0ZXN0cyBpbiB0aGUgQ0kuDQoNCg0KQmVzdCByZWdhcmRzLA0K4oCURWR3aW4=

