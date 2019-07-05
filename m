Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E86F607D7
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jul 2019 16:28:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hjP9P-0001zl-06; Fri, 05 Jul 2019 14:25:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hVvi=VC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hjP9N-0001zf-Go
 for xen-devel@lists.xenproject.org; Fri, 05 Jul 2019 14:25:21 +0000
X-Inumbo-ID: b570056a-9f30-11e9-aebf-a7a34d63ea8a
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b570056a-9f30-11e9-aebf-a7a34d63ea8a;
 Fri, 05 Jul 2019 14:25:18 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Fri,  5 Jul 2019 14:25:10 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 5 Jul 2019 14:24:53 +0000
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (15.124.8.14) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 5 Jul 2019 14:24:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=gK6SaImQgv+Q7naBo4QY1CLF1hFEeN36Be3aGBOG8/dlDvFBaWMbMzkx+7PUeHcpB6axltPl1JHRAnXDTkacQzJubXuEBaIqzw8wgH+IsAy/KcfrfJUgCOLNZ5mLYmdXrJE6zpugq74lvB0tY4aamP6HnPenEdyWl1ikxN1NvDc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UNGdZcoa7qmWLm8LKm2D33JddYOiEymQ/rMJhbVWIP0=;
 b=mfS9OuFoUCNdvH7RI11v3BJ5dpAWKtRYAKxnFetGi/TCy/HPPBLihzS8ZUmkMk5RiwLSUj3i8bUWTEx6J2HKyNgPID2bvsN59xRkbOpr7mIRC4Em50uDwJspC+3PgGHRAEzl4mUKVqbgEQNzC4xKxt5qCKtcCjMzatHbN6FcUb8=
ARC-Authentication-Results: i=1; test.office365.com
 1;spf=none;dmarc=none;dkim=none;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3092.namprd18.prod.outlook.com (10.255.136.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.13; Fri, 5 Jul 2019 14:24:51 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2052.019; Fri, 5 Jul 2019
 14:24:51 +0000
From: Jan Beulich <JBeulich@suse.com>
To: =?utf-8?B?RnLDqWTDqXJpYyBQaWVycmV0?= <frederic.pierret@qubes-os.org>
Thread-Topic: [Xen-devel] Ethernet PCI passthrough problem
Thread-Index: AQHVMzhj0mqXyFfZaUuqcdsIJhqCQqa8FF2A
Date: Fri, 5 Jul 2019 14:24:51 +0000
Message-ID: <3743573c-fa17-b1c3-c073-9c0899046852@suse.com>
References: <c7991a4f-a103-e6b7-18e5-fc471eb96b10@qubes-os.org>
In-Reply-To: <c7991a4f-a103-e6b7-18e5-fc471eb96b10@qubes-os.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6P195CA0002.EURP195.PROD.OUTLOOK.COM (2603:10a6:4:cb::12)
 To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5c4a57cb-1a25-45a0-0485-08d701548aac
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3092; 
x-ms-traffictypediagnostic: BY5PR18MB3092:
x-microsoft-antispam-prvs: <BY5PR18MB3092187660E59672EA4BFBE6B3F50@BY5PR18MB3092.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 008960E8EC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(136003)(396003)(376002)(346002)(39860400002)(199004)(189003)(6486002)(80792005)(229853002)(99286004)(36756003)(6512007)(76176011)(6436002)(25786009)(31696002)(305945005)(68736007)(86362001)(486006)(66476007)(66946007)(66446008)(64756008)(66556008)(386003)(7736002)(446003)(6246003)(73956011)(53936002)(52116002)(476003)(11346002)(2616005)(66066001)(4326008)(6506007)(53546011)(66574012)(186003)(31686004)(5660300002)(5024004)(6116002)(71190400001)(71200400001)(26005)(3846002)(14444005)(14454004)(316002)(8676002)(8936002)(6916009)(478600001)(102836004)(81156014)(256004)(81166006)(2906002)(72206003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3092;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: VsgdPvfPoNaoYUJ+5bWWKY4p9S0qYCojd15eJ14PjyvlpXPMNUczNsoUsaXdK0yjULflipI0Y1ea9pGZW9frpAx1zzZsX2zKpxVHGZDFPw/kuNgHD6h2wyU16TixfXGaRKkIhWh9avDJtluLVeB2nV3Hljw2k9WWSUNdUvRIujWWC7vWJU5wQ1yLREWEKdYQlGvSZ8SI6DxMdzHZLC4LXUYe+XsAbm3rICGzNRmkpEEb6+eVlGFbo/G/qUbQNnEOp+Ezges0eITA/ocNxgpaqy0nodu/Qmh9QWm9PfoFZnP1g95bQhyeXEzdOpKc9/Ry8bHsehH10Miht/XHl5fN3UB5omfj+TnfUJww8XojnamhgspVtMiIaL3u8sxCcGD5BmMNqgyJzx0l1Ve+Y/lSArwlemeBL8BWO5xuMWmAFhc=
Content-ID: <FA819FA1F92FA1429DE6E459387D2441@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c4a57cb-1a25-45a0-0485-08d701548aac
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2019 14:24:51.5102 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3092
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] Ethernet PCI passthrough problem
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDcuMjAxOSAxNTo0NiwgRnLDqWTDqXJpYyBQaWVycmV0ICB3cm90ZToNCj4gSSdtIGV4
cGVyaWVuY2luZyBwcm9ibGVtIHRvIHBlcmZvcm0gUENJIHBhc3N0aHJvdWdoIG9mIEV0aGVybmV0
IGNhcmQNCj4gd2l0aCA0IHBvcnRzIChIUCBFdGhlcm5ldCAxR2IgNC1wb3J0IDMzMUZMUiBBZGFw
dGVyKSBvbiBhbiBIUCBETDM2MCBHZW44Lg0KPiANCj4gSSBoYXZlIHR3byBzZXJ2ZXIgbGlrZSB0
aGlzIG9uZSB3aGVyZSB0aGUgZmlyc3QgaXMgdW5kZXIgQ2VudE9TIGFuZCB0aGUNCj4gb3RoZXIg
b25lLCB1bmRlciBRdWJlcy4gVW5kZXIgQ2VudE9TLCB0aGUgbmljcyBhcmUgbm90IGF0dGFjaGVk
IHRvIGFueQ0KPiBvdGhlciBkb21haW4gYW5kIGNsYXNzaWNhbCBkbWVzZyBzaG93cyBubyBlcnJv
cnMgKHNlZSBhdHRhY2hlZA0KPiAnY2VudG9zX2t2bS5wbmcnKS4gSXQncyB3b3JraW5nIHZlcnkg
d2VsbCBzaW5jZSBsb25nIHRpbWUuDQoNClRoZSBuYW1lIG9mIHRoZSBpbWFnZSBzdWdnZXN0cyB0
aGlzIGlzIHVuZGVyIEtWTSwgbm90IFhlbi4gVGhlIGRldmljZQ0KYmVpbmcgYXQgYnVzIDMgcmF0
aGVyIHRoYW4gYnVzIDAgYWxzbyBzdWdnZXN0cyB0aGlzIGlzbid0IGluc2lkZSBhDQpYZW4gSFZN
IERvbVUuDQoNCj4gSSdtIHRyeWluZyB0bw0KPiBzd2l0Y2ggdGhlc2Ugc2VydmVycyB0byBRdWJl
cyBhbmQgSSdtIGZhY2luZyB0cm91YmxlLiBJbiBRdWJlcywgd2UNCj4gYXR0YWNoIGFsbCB0aGUg
bmljcyBpbnRvIGEgZG9tYWluLCB1c3VhbGx5IGNhbGxlZCAnc3lzLW5ldCcgaW4gSFZNIG1vZGUu
DQo+IA0KPiBUaGUgbmljcyBhcmUgYXR0YWNoZWQgd2l0aCAncmRtX3BvbGljeT1yZWxheGVkJyB0
byAnc3lzLW5ldCcgYnV0IGFyZSBub3QNCj4gbG9hZGVkIGluIHRoZSBkb21haW4gZHVlIHRvIGVy
cm9ycyAoc2VlIGF0dGFjaGVkICdIVk1fZG9tMC5wbmcnIGFuZA0KPiAnSFZNX3N5c19uZXQucG5n
JykuDQoNClRoZSBmb3JtZXIgb2YgdGhlc2Ugc2hvd3MgYSBmdW5kYW1lbnRhbCBwcm9ibGVtOiBU
d28gb2YgdGhlIFJNUlJzDQpvdmVybGFwIHRoZSBCSU9TIGFyZWEgaW5zaWRlIHRoZSBndWVzdC4g
SSdtIGFmcmFpZCBJIGRvbid0IHNlZSBob3cNCnRvIGRlYWwgd2l0aCB0aGlzIChzaG9ydCBvZiBz
aHVmZmxpbmcgdGhlIEJJT1MgZWxzZXdoZXJlLCB3aGljaA0KaW1vIGlzIG5vdCByZWFsbHkgYW4g
b3B0aW9uKS4gSSB3b25kZXIgaG93IHRoaXMgZ2V0cyBkZWFsdCB3aXRoIGluDQp0aGUgQ2VudE9T
IGNhc2UsIHdoZXJlIHlvdSBzYXkgdGhpbmdzIHdvcmsgKEkgdGFrZSBpdCB0aGF0IHlvdSd2ZQ0K
dmVyaWZpZWQgdGhhdCB0aGUgUk1SUnMgb24gYm90aCBzeXN0ZW1zIGFyZSBhdCBleGFjdGx5IHRo
ZSBzYW1lDQphZGRyZXNzZXMpLg0KDQpBbmQgdGhlbiBJJ20gcHV6emxlZCBieSB0aGVyZSBiZWlu
ZyBmdXJ0aGVyIG1lc3NhZ2VzIGFib3V0IDAzOjAwLjIsDQpzdWdnZXN0aW5nIHRoYXQgZG9tYWlu
IGNvbnN0cnVjdGlvbiAob3IgZGV2aWNlIGFzc2lnbm1lbnQpDQpjb250aW51ZXMuIFlldCB0aGVu
IHRoZSBzYW1lIG1lc3NhZ2VzIGRvbid0IGFwcGVhciBmb3IgdGhlIG90aGVyDQp0d28gZGV2aWNl
cyAoeW91IGRpZCBzYXkgdGhlcmUgYXJlIGZvdXIgb2YgdGhlbSwgYW5kIG90aGVyIGxvZ3MNCmFs
c28gc3VwcG9ydCB0aGlzKS4NCg0KPiBJIHRyaWVkIGluIFBWIG1vZGUsIEkgZ290IGl0IHdvcmtp
bmcgYnV0IEkgd2FzIG5vdA0KPiBoYXBweSB3aXRoIHRoYXQgZm9yIHNlY3VyaXR5IHJlYXNvbi4g
SSBkZWNpZGVkIHRvIHVwZGF0ZSBteSBiaW9zIHRvIHRoZQ0KPiBtb3N0IHJlY2VudCBvbmUsIGFu
ZCBldmVuIGluIFBWLCBpdCBkb2VzIG5vdCB3b3JrIGFueW1vcmUgKHNlZSBhdHRhY2hlZA0KPiAn
UFZfZG9tMC5wbmcnIGFuZCAnUFZfc3lzX25ldC5wbmcnKS4NCg0KVGhhdCdsbCByZXF1aXJlIGZp
Z3VyaW5nIG91dCB3aGF0IGV4YWN0bHkgdGhlIGRyaXZlciBpc24ndCBsaWtpbmcuDQpBdCB0aGUg
Zmlyc3QgZ2xhbmNlIEknbSBpbmNsaW5lZCB0byB0aGluayB0aGUgQklPUyB1cGRhdGUgYnJva2UN
CnRoaW5ncy4NCg0KPiBBbGwgaGF2ZSBiZWVuIHRyaWVkIHVuZGVyIFF1YmVzIDQuMC4xICh4ZW4t
NC44KSBhbmQgUXViZXMgNC4xIHVuZGVyDQo+IGRldmVsb3BtZW50ICh4ZW4tNC4xMikuIEN1cnJl
bnQgYXR0YWNoZWQgbG9nIGltYWdlcyBhcmUgd2l0aCB4ZW4tNC4xMi4NCg0KWW91IHNheWluZyAi
bG9nIGltYWdlcyIgYWxyZWFkeSBwb2ludHMgYXQgYSBwcm9ibGVtOiBBY3R1YWwgKGFuZA0KY29t
cGxldGUgYXMgd2VsbCBhcyBzdWZmaWNpZW50bHkgdmVyYm9zZSkgbG9nIGZpbGVzIHdvdWxkIGJl
IG1vcmUNCmhlbHBmdWwgd2hlbiBkaWFnbm9zaW5nIGlzc3VlcyBsaWtlIHRoaXMgb25lLg0KDQpK
YW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
