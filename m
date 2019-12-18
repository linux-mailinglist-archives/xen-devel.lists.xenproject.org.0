Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1718A1243D7
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 11:00:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihW4p-0008VB-7c; Wed, 18 Dec 2019 09:57:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BItc=2I=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1ihW4n-0008V6-Tl
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 09:57:06 +0000
X-Inumbo-ID: bdad8738-217c-11ea-904e-12813bfff9fa
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.128]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bdad8738-217c-11ea-904e-12813bfff9fa;
 Wed, 18 Dec 2019 09:57:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HDRINPAVV8rG0jWpx+fQwmw0PXfKtmJz/lC3gUODI94980MyIpMshicvEpIAl0iXnxKTTaL0XbJkhLqyGNrqV5aU1ajOpQ/INJKllwTX5Wv/B2JS4bH6XWlSAQBD+jMu1BDGAAxeKJbNU8+xKk8z/DlFMbfDLdrRTN5pGCi75IGPL94KEO/AVLF7WoDV9Knacb+4bQS2+WG89CWYlsPQcg7aBWhF092NMx8lO7A+TQjy1rY4b8oRZsAQxh5rad6AKlM34oaybZTzs+m3wvr1a7iUq2jTKeM6MhiePBV471m0hkJ9W+sIbtcpcWgerYjoyoHJLQaL/KiUGqmG1UbJ/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L6t84KV1jwncq+yQuzUOQqv2Vrr/uQ7V1lILXfVmK40=;
 b=QQJxAqG9vrCquhnoZ1xOF/xhwBFtlnt5zWQMaq2UlShzefLANox6yn78xsenygp8eA8KNdW/TBfnTKGEZgwvtpjcv1Cd8l3NIAEkQJTq73TPcibLMCf5oSFqa/TpdabFYVYRlz1nf2is8cdexsO5vO1dJZD713+DklBwplS1umgwZA0krKphrvBg3RXD6vz/jA0YQ9h5IPkhGSjhVi7BunK9FM1nt31Xv907W6EMcdLthU9ne2Ugvo1CzjwU0lDKN1qBJYl6PO2ZWZu9J5ZgVerl51I38Wlfymf/9HOBkVy5tx7ds4QL6DP9WxKJDqit7bJP3tiQksWCMrJfkpngjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L6t84KV1jwncq+yQuzUOQqv2Vrr/uQ7V1lILXfVmK40=;
 b=wK3G4g8Zmghlycmv8UUOsThCOGwtMgWt3Z0kI5kEUFiurWiQvZ+SLx5VzAXMv+wlYe+g8RD6jYc6QhstU7kHnLdPGIhUvuGi0UwhvATUmI+IaM+ArGbMdcUOlHwsbzumUQjiihj12Qi5N9ZNJf7oAmwr+9eNRF6FoCm4ingJX1s=
Received: from AM0PR02MB5553.eurprd02.prod.outlook.com (10.255.30.78) by
 AM0PR02MB5554.eurprd02.prod.outlook.com (10.255.30.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.17; Wed, 18 Dec 2019 09:57:01 +0000
Received: from AM0PR02MB5553.eurprd02.prod.outlook.com
 ([fe80::8cec:7638:734c:89d]) by AM0PR02MB5553.eurprd02.prod.outlook.com
 ([fe80::8cec:7638:734c:89d%4]) with mapi id 15.20.2538.019; Wed, 18 Dec 2019
 09:57:01 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH V4 1/4] x86/mm: Add array_index_nospec to
 guest provided index values
Thread-Index: AQHVtOxhsG39wuvEP0STO9uvU+j0gae+ikOAgAEhbAD///1ygA==
Date: Wed, 18 Dec 2019 09:57:01 +0000
Message-ID: <131f196c-e149-3cec-765b-be7bf36bf19b@bitdefender.com>
References: <20191217151144.9781-1-aisaila@bitdefender.com>
 <9012ab5f-4a3b-d469-6c03-20aa59773c2a@suse.com>
 <20fedb38-ac6e-772b-1859-eebd03c92989@bitdefender.com>
In-Reply-To: <20fedb38-ac6e-772b-1859-eebd03c92989@bitdefender.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR05CA0079.eurprd05.prod.outlook.com
 (2603:10a6:208:136::19) To AM0PR02MB5553.eurprd02.prod.outlook.com
 (2603:10a6:208:160::14)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c2665250-3495-4de9-e5d9-08d783a0a0dc
x-ms-traffictypediagnostic: AM0PR02MB5554:|AM0PR02MB5554:|AM0PR02MB5554:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR02MB5554E6247258E3F192C969ECAB530@AM0PR02MB5554.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0255DF69B9
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(346002)(376002)(396003)(39860400002)(136003)(189003)(199004)(81166006)(81156014)(8936002)(66946007)(64756008)(6916009)(6512007)(66446008)(66556008)(66476007)(36756003)(31696002)(8676002)(6486002)(2616005)(71200400001)(86362001)(54906003)(52116002)(6506007)(53546011)(31686004)(316002)(2906002)(478600001)(5660300002)(26005)(4326008)(186003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR02MB5554;
 H:AM0PR02MB5553.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Y84G+D9+5QFOA5dQn3oAPVFPCR0tMSzQAloSmQHZpBI9uWHn4hUv2+DFQcgPi4Aole174LZqL20Dw9vAT58dO6AiHIx6fnRQYI41fZPynHgc9hjmP+mAjKUti19tAaR7RRYWsvzGRSZcYyVXpovgGAgN29nM+6dLcsDGZJICy9cW6jJgpBiuTEcSguU36GcguHQ+k15Id5Ny3HlmotqAvLqXYA9iF4KmH/T91SQI786OnjkXvIvtaD1PJfu0vXaJGoRbuznXdqACRNxDmfYcyVeOnqtC9u1Vpldm78QrOebYEzHdc7iF1McMHXCr7i0EFX9olFZhL6tOC0BDSwolhkRxaCgmqcMHZFs/19BmDelM+vNP5I7kG0PdvgTdLsHbPsz4pM0w95av06Khb5JQMh2u1n5ARYnTXBhCLxDqyDSE7glZxVXJIa7dZuU2ddGc
Content-ID: <F85FA1073F736F4BAA73D94E59F8DB2C@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2665250-3495-4de9-e5d9-08d783a0a0dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2019 09:57:01.4990 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RMGHf30yEQGz5SuNfd3AMIyl50ROSzNucI2ahaYktQotAb4eacDRDC7c7c0cTiAgxKCP2G+RS6XRlQudrYoL/6gN4NiFZjvCveSHWvve7DE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB5554
Subject: Re: [Xen-devel] [PATCH V4 1/4] x86/mm: Add array_index_nospec to
 guest provided index values
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
Cc: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 Kevin Tian <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Wei Liu <wl@xen.org>, Razvan COJOCARU <rcojocaru@bitdefender.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDE4LjEyLjIwMTkgMTA6MDYsIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIHdyb3RlOg0K
PiANCj4gDQo+IE9uIDE3LjEyLjIwMTkgMTg6NTAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4gT24g
MTcuMTIuMjAxOSAxNjoxMiwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6DQo+Pj4gLS0t
IGEveGVuL2FyY2gveDg2L21tL21lbV9hY2Nlc3MuYw0KPj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9t
bS9tZW1fYWNjZXNzLmMNCj4+PiBAQCAtMzY3LDEwICszNjcsMTEgQEAgbG9uZyBwMm1fc2V0X21l
bV9hY2Nlc3Moc3RydWN0IGRvbWFpbiAqZCwgZ2ZuX3QgZ2ZuLCB1aW50MzJfdCBuciwNCj4+PiAg
ICAgICAgaWYgKCBhbHRwMm1faWR4ICkNCj4+PiAgICAgICAgew0KPj4+ICAgICAgICAgICAgaWYg
KCBhbHRwMm1faWR4ID49IE1BWF9BTFRQMk0gfHwNCj4+PiAtICAgICAgICAgICAgIGQtPmFyY2gu
YWx0cDJtX2VwdHBbYWx0cDJtX2lkeF0gPT0gbWZuX3goSU5WQUxJRF9NRk4pICkNCj4+PiArICAg
ICAgICAgICAgIGQtPmFyY2guYWx0cDJtX2VwdHBbYXJyYXlfaW5kZXhfbm9zcGVjKGFsdHAybV9p
ZHgsIE1BWF9FUFRQKV0gPT0NCj4+DQo+PiBUaGUgYm91bmRzIGNoZWNrIGlzIGFnYWluc3QgTUFY
X0FMVFAyTS4gQm90aCBNQVhfIHZhbHVlcyBsb29rIHRvIGJlDQo+PiBpbmRlcGVuZGVudCwgd2hp
Y2ggbWVhbnMgYm91bmRzIGNoZWNrIGFuZCB2YWx1ZSBwYXNzZWQgdG8gdGhlDQo+PiBoZWxwZXIg
bmVlZCB0byBtYXRjaCB1cCAobm90IGp1c3QgaGVyZSkuDQo+IA0KPiBJIHdpbGwgaGF2ZSBib3Ro
IGNoZWNrcyBhZ2FpbnN0IE1BWF9BTFRQMk0uDQo+IA0KPj4NCj4+PiAtLS0gYS94ZW4vYXJjaC94
ODYvbW0vcDJtLWVwdC5jDQo+Pj4gKysrIGIveGVuL2FyY2gveDg2L21tL3AybS1lcHQuYw0KPj4+
IEBAIC0xMzUzLDcgKzEzNTMsOCBAQCB2b2lkIHNldHVwX2VwdF9kdW1wKHZvaWQpDQo+Pj4gICAg
DQo+Pj4gICAgdm9pZCBwMm1faW5pdF9hbHRwMm1fZXB0KHN0cnVjdCBkb21haW4gKmQsIHVuc2ln
bmVkIGludCBpKQ0KPj4+ICAgIHsNCj4+PiAtICAgIHN0cnVjdCBwMm1fZG9tYWluICpwMm0gPSBk
LT5hcmNoLmFsdHAybV9wMm1baV07DQo+Pj4gKyAgICBzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJtID0N
Cj4+PiArICAgICAgICAgICBkLT5hcmNoLmFsdHAybV9wMm1bYXJyYXlfaW5kZXhfbm9zcGVjKGks
IE1BWF9BTFRQMk0pXTsNCj4+PiAgICAgICAgc3RydWN0IHAybV9kb21haW4gKmhvc3RwMm0gPSBw
Mm1fZ2V0X2hvc3RwMm0oZCk7DQo+Pj4gICAgICAgIHN0cnVjdCBlcHRfZGF0YSAqZXB0Ow0KPj4+
ICAgIA0KPj4+IEBAIC0xMzY2LDcgKzEzNjcsNyBAQCB2b2lkIHAybV9pbml0X2FsdHAybV9lcHQo
c3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgaW50IGkpDQo+Pj4gICAgICAgIHAybS0+bWF4X21h
cHBlZF9wZm4gPSBwMm0tPm1heF9yZW1hcHBlZF9nZm4gPSAwOw0KPj4+ICAgICAgICBlcHQgPSAm
cDJtLT5lcHQ7DQo+Pj4gICAgICAgIGVwdC0+bWZuID0gcGFnZXRhYmxlX2dldF9wZm4ocDJtX2dl
dF9wYWdldGFibGUocDJtKSk7DQo+Pj4gLSAgICBkLT5hcmNoLmFsdHAybV9lcHRwW2ldID0gZXB0
LT5lcHRwOw0KPj4+ICsgICAgZC0+YXJjaC5hbHRwMm1fZXB0cFthcnJheV9pbmRleF9ub3NwZWMo
aSwgTUFYX0VQVFApXSA9IGVwdC0+ZXB0cDsNCj4+PiAgICB9DQo+Pj4gICAgDQo+Pj4gICAgdW5z
aWduZWQgaW50IHAybV9maW5kX2FsdHAybV9ieV9lcHRwKHN0cnVjdCBkb21haW4gKmQsIHVpbnQ2
NF90IGVwdHApDQo+Pj4gLS0tIGEveGVuL2FyY2gveDg2L21tL3AybS5jDQo+Pj4gKysrIGIveGVu
L2FyY2gveDg2L21tL3AybS5jDQo+Pj4gQEAgLTI0OTksNyArMjQ5OSw3IEBAIHN0YXRpYyB2b2lk
IHAybV9yZXNldF9hbHRwMm0oc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgaW50IGlkeCwNCj4+
PiAgICAgICAgc3RydWN0IHAybV9kb21haW4gKnAybTsNCj4+PiAgICANCj4+PiAgICAgICAgQVNT
RVJUKGlkeCA8IE1BWF9BTFRQMk0pOw0KPj4+IC0gICAgcDJtID0gZC0+YXJjaC5hbHRwMm1fcDJt
W2lkeF07DQo+Pj4gKyAgICBwMm0gPSBkLT5hcmNoLmFsdHAybV9wMm1bYXJyYXlfaW5kZXhfbm9z
cGVjKGlkeCwgTUFYX0FMVFAyTSldOw0KPj4+ICAgIA0KPj4+ICAgICAgICBwMm1fbG9jayhwMm0p
Ow0KPj4+ICAgIA0KPj4+IEBAIC0yNTQwLDcgKzI1NDAsNyBAQCBzdGF0aWMgaW50IHAybV9hY3Rp
dmF0ZV9hbHRwMm0oc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgaW50IGlkeCkNCj4+PiAgICAN
Cj4+PiAgICAgICAgQVNTRVJUKGlkeCA8IE1BWF9BTFRQMk0pOw0KPj4+ICAgIA0KPj4+IC0gICAg
cDJtID0gZC0+YXJjaC5hbHRwMm1fcDJtW2lkeF07DQo+Pj4gKyAgICBwMm0gPSBkLT5hcmNoLmFs
dHAybV9wMm1bYXJyYXlfaW5kZXhfbm9zcGVjKGlkeCwgTUFYX0FMVFAyTSldOw0KPj4NCj4+IEFs
bCBvZiB0aGUgYWJvdmUgaGF2ZSBhIG1vcmUgb3IgbGVzcyBzaWduaWZpY2FudCBkaXNjb25uZWN0
IGJldHdlZW4NCj4+IHRoZSBib3VuZHMgY2hlY2sgYW5kIHRoZSB1c2UgYXMgYXJyYXkgaW5kZXgu
IEkgdGhpbmsgaXQgd291bGQgYmUNCj4+IHF1aXRlIGhlbHBmdWwgaWYgdGhlc2UgY291bGQgbGl2
ZSBjbG9zZSB0byBvbmUgYW5vdGhlciwgc28gb25lIGNhbg0KPj4gKHNlZSBmdXJ0aGVyIHVwKSBl
YXNpbHkgcHJvdmUgdGhhdCBib3RoIHNwZWNpZmllZCBib3VuZHMgYWN0dWFsbHkNCj4+IG1hdGNo
IHVwLg0KPj4NCj4gDQo+IFN1cmUsIEkgY2FuIG1vdmUgdGhlIGFycmF5IHVzZSBjbG9zZXIgdG9n
ZXRoZXIuDQo+IA0KDQpTb3JyeSB0byBjb21lIGJhY2sgb24gdGhpcyBidXQgSSB3YXMgbG9va2lu
ZyBpbiB0aGUgY29kZSBhbmQgSSBhbSBub3QgDQpzdXJlIEkgZm9sbG93IHdoZXJlIGlzIHRoZSBk
aXNjb25uZWN0LiBJZiB5b3UgYXJlIHRhbGtpbmcgYWJvdXQgDQpwMm1faW5pdF9hbHRwMm1fZXB0
KCkgdGhlIGVwdHAgY29kZSB3aWxsIG1vdmUgdXAgaW4gcGF0Y2ggMy80Lg0KDQpDYW4geW91IHBs
ZWFzZSBjbGFyaWZ5Pw0KDQpUaGFua3MsDQpBbGV4DQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
