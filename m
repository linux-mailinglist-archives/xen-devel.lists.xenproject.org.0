Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E16678B0A
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 13:57:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs4DW-0004wv-Eg; Mon, 29 Jul 2019 11:53:26 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hW4D=V2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hs4DV-0004wq-7P
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 11:53:25 +0000
X-Inumbo-ID: 7458ea92-b1f7-11e9-8980-bc764e045a96
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7458ea92-b1f7-11e9-8980-bc764e045a96;
 Mon, 29 Jul 2019 11:53:23 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 29 Jul 2019 11:53:18 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 29 Jul 2019 11:36:50 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (15.124.72.13) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 29 Jul 2019 11:36:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rq1oKbX2OFJksfmX5NgL9WVchEAQPFo78UwfVUG+mG51BfBtSWgC9GdMGvgM6bAs2aS0a1vi6Q+wexGfMGP/IoxOpZYa8jvzrFFxNac7C/hOhvLXCFxh5qKalATjbAHgA/R1iXF4zFWEm3Xkgczrs4pyFbUN20aS77yiXmWxJy49+CcjO4FvEY2232JMWp3uhFO3i6wquG875XNeR+Wwhc4AL7qcUj7+IdSlFa5/vYWe5isc+w3KCI1KV8Ss6n28AWQqiJfC4Qsp8C2PhvWVPToI2fIrlzaiP9M1BUYELS1G+nWrPvJhijtEef6bLZZIqSY3Uo5kYXWsdI8zr6kQrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6pQNRXMMryhlfEu5WQz3Go7hgVd2srSQIa6jtVIKB9I=;
 b=UcicRzPdv7arQf+LMdkyYquka2lkTpc+mE1CBSUXK92CWXmV8iC75J2eE3o2uJuFT0vibhY4VyWypfXJbgh1z4Q4QqfAoSWLQaE0VRqf8UhQfIifOXlD1vy+/FKhucMiXU39lA84AlgyNTI+VPHWcUtpdeXqMSu8p7HFq8pz66kfuQ9zeqEhyfZN7U85zgozj7GThLuTef59O9Q2sh5GsD1B2lT1recdAHKg3oLkj1CDPh2TO3THk/gnuoc7+X9sVYIxKjW0CN1vsZtb4Wuj7o8ukj2yXZ3VK7IMtmbNA3yWQHq3ESJGKDiHm7MB89pmpQD2lAeSYCEPFRcPkUCvZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3282.namprd18.prod.outlook.com (10.255.138.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.14; Mon, 29 Jul 2019 11:36:49 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Mon, 29 Jul 2019
 11:36:49 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Julien Grall <julien.grall@arm.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH v2] dom0-build: fix build with clang5
Thread-Index: AQHVPGuDyWWK6Geo3ESEScpkr4UVE6bhcbZsgAAZOoA=
Date: Mon, 29 Jul 2019 11:36:49 +0000
Message-ID: <a32c473d-85f8-e795-e1c9-9ce858ec437b@suse.com>
References: <5c88239b-de0f-5f81-72c4-7fdb07524278@suse.com>
 <20318831-02d8-cce3-46e9-b4eb22506dce@arm.com>
In-Reply-To: <20318831-02d8-cce3-46e9-b4eb22506dce@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB8PR04CA0012.eurprd04.prod.outlook.com
 (2603:10a6:10:110::22) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d3cb5fcc-d17d-40e4-851b-08d714190b21
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3282; 
x-ms-traffictypediagnostic: BY5PR18MB3282:
x-microsoft-antispam-prvs: <BY5PR18MB32825A2F7296C66F94DF5329B3DD0@BY5PR18MB3282.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 01136D2D90
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(366004)(136003)(346002)(376002)(396003)(189003)(199004)(68736007)(80792005)(81166006)(81156014)(14454004)(6436002)(8676002)(6116002)(71200400001)(3846002)(31696002)(71190400001)(86362001)(8936002)(2906002)(6512007)(478600001)(25786009)(52116002)(305945005)(5660300002)(53936002)(6246003)(53546011)(102836004)(446003)(26005)(186003)(66066001)(36756003)(31686004)(66476007)(64756008)(66446008)(14444005)(66556008)(2616005)(11346002)(476003)(256004)(6486002)(229853002)(54906003)(486006)(110136005)(76176011)(6506007)(386003)(99286004)(316002)(4326008)(7736002)(66946007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3282;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Ova7pLVHecCmP/P2JnaWQYzaDJzmWqUv6xCaHg7Oc2WlvDNp45nDyrLPmoUXacnPJAKZy8eYYLsAOzarjAYzySDm5oy49DzKeFesRMA7vwzW+kk0v+DYEqb67iJH7GKSEqOKeC6A6PLpF/2eQSyctNFBzK6GTORiiOqz5XKwNhv9nE+DzJCtVNpvPQgvodCcBHg1TEsh1YDMbYFGd1wki4Bl/5eQrRCUbRYJv6DJ77prFp6rjdDzsiBK9jGCcykzgOoJy6e/bFIzoFX3YDI1HaHBSj3yKrCT35S0uVQqV8FFTcdoTUOnmcNMfV8dwhZzVAjgZyaY/kIOtSiQbTEM6zGYT0JovHfykcqca9JPyiArQmmtWi1PglhlndeoJImdiFsZIUiJm9SL6F1NUNe5x9n7OQ6SS6zDY1ffjKGRtiI=
Content-ID: <8015B2832078FB409FC105DB365EFB47@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d3cb5fcc-d17d-40e4-851b-08d714190b21
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2019 11:36:49.1697 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3282
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v2] dom0-build: fix build with clang5
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMDcuMjAxOSAxMjowNSwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPiBIaSwNCj4gDQo+IE9u
IDcvMTcvMTkgNzo0NyBBTSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBXaXRoIG5vbi1lbXB0eSBD
T05GSUdfRE9NMF9NRU0gY2xhbmc1IHByb2R1Y2VzDQo+Pg0KPj4gZG9tMF9idWlsZC5jOjM0NDoy
NDogZXJyb3I6IHVzZSBvZiBsb2dpY2FsICcmJicgd2l0aCBjb25zdGFudCBvcGVyYW5kIFstV2Vy
cm9yLC1XY29uc3RhbnQtbG9naWNhbC1vcGVyYW5kXQ0KPj4gwqDCoMKgwqDCoCBpZiAoICFkb20w
X21lbV9zZXQgJiYgQ09ORklHX0RPTTBfTUVNWzBdICkNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBewqAgfn5+fn5+fn5+fn5+fn5+fn5+DQo+PiBk
b20wX2J1aWxkLmM6MzQ0OjI0OiBub3RlOiB1c2UgJyYnIGZvciBhIGJpdHdpc2Ugb3BlcmF0aW9u
DQo+PiDCoMKgwqDCoMKgIGlmICggIWRvbTBfbWVtX3NldCAmJiBDT05GSUdfRE9NMF9NRU1bMF0g
KQ0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF5+
DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJg0K
Pj4gZG9tMF9idWlsZC5jOjM0NDoyNDogbm90ZTogcmVtb3ZlIGNvbnN0YW50IHRvIHNpbGVuY2Ug
dGhpcyB3YXJuaW5nDQo+PiDCoMKgwqDCoMKgIGlmICggIWRvbTBfbWVtX3NldCAmJiBDT05GSUdf
RE9NMF9NRU1bMF0gKQ0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB+Xn5+fn5+fn5+fn5+fn5+fn5+fn5+DQo+PiAxIGVycm9yIGdlbmVyYXRlZC4NCj4+
DQo+PiBPYnZpb3VzbHkgbmVpdGhlciBvZiB0aGUgdHdvIHN1Z2dlc3Rpb25zIGFyZSBhbiBvcHRp
b24gaGVyZS4gT2RkbHkNCj4+IGVub3VnaCBzd2FwcGluZyB0aGUgb3BlcmFuZHMgb2YgdGhlICYm
IGhlbHBzLCB3aGlsZSBlLmcuIGNhc3Rpbmcgb3INCj4+IHBhcmVudGhlc2l6aW5nIGRvZXNuJ3Qu
IEFub3RoZXIgd29ya2FibGUgdmFyaWFudCBsb29rcyB0byBiZSB0aGUgdXNlIG9mDQo+PiAhISBv
biB0aGUgY29uc3RhbnQuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPg0KPj4gLS0tDQo+PiB2MjogQWxzbyBhZGp1c3QgdGhlIEFybSBpbmNhcm5h
dGlvbiBvZiB0aGUgc2FtZSBjb25zdHJ1Y3QuDQo+PiAtLS0NCj4+IEknbSBvcGVuIHRvIGdvaW5n
IHRoZSAhISBvciB5ZXQgc29tZSBkaWZmZXJlbnQgcm91dGUgKGJ1dCBub3QgcmVhbGx5IHRoZQ0K
Pj4gc3VnZ2VzdGVkIHN0cmxlbigpIG9uZSkuIE5vIG1hdHRlciB3aGljaCBvbmUgd2UgY2hvb3Nl
LCBJJ20gYWZyYWlkIGl0IGlzDQo+PiBnb2luZyB0byByZW1haW4gZ3Vlc3N3b3JrIHdoYXQgbmV3
ZXIgKGFuZCBmdXR1cmUpIHZlcnNpb25zIG9mIGNsYW5nIHdpbGwNCj4+IGNob2tlIG9uLg0KPiAN
Cj4gSSBxdWl0ZSBsaWtlIHRoZSBzdHJsZW4gb25lLCBob3dldmVyIGxvb2tpbmcgYXJvdW5kIG9u
bGluZSB0aGlzIG1heSBub3QNCj4gc29sdmUgdGhlIHByb2JsZW0uIEFGQUlLLCBDbGFuZyBpcyBu
b3QgaGFwcHkgYmVjYXVzZSB0aGUgY29uc3RhbnQgaXMgbm90DQo+IGEgYm9vbGVhbi4NCg0KSSBk
b24ndCB0aGluayBpdCdzIGFzIHNpbXBsZSBhcyAibm90IGEgYm9vbGVhbiIsIGJ1dCBJIGFsc28g
aGF2ZW4ndA0KcGxheWVkIHdpdGggaXQgbW9yZSB0aGFuIEkgaGFkIHRvIGluIG9yZGVyIHRvIGZp
bmQgcG9zc2libGUNCndvcmthcm91bmRzLiBBcyB0byB0aGUgc3RybGVuKCkgYXBwcm9hY2ggLSBJ
J3ZlIGV4cHJlc3NlZCBteSBkaXNsaWtlDQpiZWZvcmUuDQoNCj4gU28gISEgb3IgIT0gMCBzaG91
bGQgd29yayBoZXJlLg0KDQpXZWxsLCB3aXRoIHBlcmhhcHMgYXMgbXVjaCBvZiBhIGNoYW5jZSBv
ZiBicmVha2luZyBhZ2FpbiBhcyBhbnkNCm90aGVyIG9mIHRoZSBwb3NzaWJsZSBzb2x1dGlvbnMs
IHVubGVzcyB0aGV5IHJlY29nbml6ZSBhbmQgYWRkcmVzcw0KdGhlIG9kZGl0eS4gQW5kcmV3IC0g
d291bGQgeW91IGJlIHdpbGxpbmcgdG8gYWNrIGEgdjMgdXNpbmcgISENCmluc3RlYWQgb2YgcmUt
b3JkZXJpbmcgdGhlICYmIG9wZXJhbmRzIChzZWVpbmcgdGhhdCB5b3UgZGlkbid0IGFjaw0KdjIg
eWV0LCBhbmQgcGVyaGFwcyB5b3UncmUgYWxzbyBub3QgbWVhbmluZyB0byk/DQoNCkphbg0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
