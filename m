Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7B8FC7CD
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2019 14:36:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVFEi-0002h6-1i; Thu, 14 Nov 2019 13:32:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=X+EV=ZG=epam.com=artem_mygaiev@srs-us1.protection.inumbo.net>)
 id 1iVFEg-0002h1-1s
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2019 13:32:34 +0000
X-Inumbo-ID: 35d1fd8e-06e3-11ea-a24d-12813bfff9fa
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.13.78]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 35d1fd8e-06e3-11ea-a24d-12813bfff9fa;
 Thu, 14 Nov 2019 13:32:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=agHpPvt1tzW/tqhRLEuGWvwWuGr2fFucB4sJI975wA8sdCTBZbM4uL2e9kF7H1FwLmDSJ+0IFk6+9Oy5AUlZnHijW/nAKDSlhHYH/MXlCIuEvQD2jQrwVUj6uG/EAJWAudXWQxP+kBgQZrTPHnH8zC1OM7sW5WTcTapWe9YNzLNTXm+fKZ1pJU65XcGDqchVMVsd+YRk98liq/k68oMahq69el+TwVzTLy3L5RH96/ysZua+qWV9av37+pAhJDsodk0lJFzmL91au5GOnQonjb9aNMTnm97G16xELmAl5js+oVlWQTi5JLUODZVYjTtnoZAIVpoc2egRV2P/wV/SEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eBv0JHOvIwx9rMz93hpDD4buYet4jMbedJ9uft4fa8c=;
 b=AXju4T8zz1/93pkkggq9h4R9VnBscvMRZ9/fLXrGTgIeG6ULm/x27Z3+UwfwJNizDWwDkZwnBIbhD7cr4iXdkUL5FRY91k74mWnFU1yJh8Ko5KsW4Hgyeg6EnEX0Zrbb1XKfh1aXz4GoGcQ5uQqUoGCaod9AqnFU7Su0oLC/ZPDG4SxU7jZIxQQts2KiTkP08pknsqA1BcQiu9djyYU9JdTaQdva69QUU8AlaE8jdHiWfZ9CQ4gJScNN/qCdZPfMOTn1+gdpkfQxTp9fmIJhRM4+6DJvio9ShnkFuImCf7dNjicSdzSsEkrYE/9IxCxndsisGIahEnIOGWqyDAMsLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eBv0JHOvIwx9rMz93hpDD4buYet4jMbedJ9uft4fa8c=;
 b=sdJpUgmUQbvzz/qsvXiJzfna1GyXGq5ie7tHxZflGnXixqEyq05UeE922TOtoIqUbt2LgYHGASTkWSqx/KQ5n+udSgqfuMicJEjCdZK7rLBefhfopgB5uQOiPuOpH5dUjiCuLETD2w3ZOVNJW/DcyjGHsMw6JaEDfzIiBTcr9o4=
Received: from DB7PR03MB3705.eurprd03.prod.outlook.com (52.134.98.14) by
 DB7PR03MB5066.eurprd03.prod.outlook.com (20.178.84.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.24; Thu, 14 Nov 2019 13:32:30 +0000
Received: from DB7PR03MB3705.eurprd03.prod.outlook.com
 ([fe80::c9af:8f5b:c86b:c330]) by DB7PR03MB3705.eurprd03.prod.outlook.com
 ([fe80::c9af:8f5b:c86b:c330%6]) with mapi id 15.20.2430.028; Thu, 14 Nov 2019
 13:32:30 +0000
From: Artem Mygaiev <Artem_Mygaiev@epam.com>
To: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "julien.grall.oss@gmail.com" <julien.grall.oss@gmail.com>
Thread-Topic: [Xen-devel] [RFC 6/7] arm: Introduce dummy empty functions for
 data only C files
Thread-Index: AQHVlINwh2rGH6T4VEiM7lz8gLkeEaeGfC4AgANH8oCAAPLWAA==
Date: Thu, 14 Nov 2019 13:32:29 +0000
Message-ID: <c2332971dece50cfdc75b0c71a8a20b9f29716bb.camel@epam.com>
References: <1573031953-12894-1-git-send-email-andrii.anisov@gmail.com>
 <1573031953-12894-7-git-send-email-andrii.anisov@gmail.com>
 <alpine.DEB.2.21.1911111254510.2677@sstabellini-ThinkPad-T480s>
 <CAJ=z9a2ORW7NbPKTny=oNux0jSAY+vGkAWK1XQ+QS=gTQryPYQ@mail.gmail.com>
In-Reply-To: <CAJ=z9a2ORW7NbPKTny=oNux0jSAY+vGkAWK1XQ+QS=gTQryPYQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Artem_Mygaiev@epam.com; 
x-originating-ip: [85.223.141.74]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 67bf8ef4-ff74-4b9d-29fd-08d769071915
x-ms-traffictypediagnostic: DB7PR03MB5066:|DB7PR03MB5066:
x-ms-exchange-transport-forked: True
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DB7PR03MB5066DED0D580EF4225F4223CF4710@DB7PR03MB5066.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 02213C82F8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(376002)(346002)(366004)(136003)(199004)(189003)(5660300002)(91956017)(81166006)(966005)(316002)(446003)(11346002)(2616005)(7736002)(486006)(76176011)(81156014)(55236004)(6506007)(99286004)(102836004)(476003)(26005)(8676002)(186003)(8936002)(305945005)(118296001)(478600001)(54906003)(86362001)(3846002)(110136005)(2906002)(6116002)(25786009)(71200400001)(71190400001)(229853002)(6306002)(66946007)(36756003)(66476007)(2501003)(14454004)(6436002)(256004)(14444005)(6486002)(80792005)(4001150100001)(66066001)(76116006)(66446008)(64756008)(6246003)(66556008)(6512007)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB7PR03MB5066;
 H:DB7PR03MB3705.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: j9CNqOnlR0lk4HSw7D6ch3ymcriQ9yPHjGUdrhv4YDgu9HVXWN0rpoNvrO67+stx4M8GbLteOycuGaLbwF4bgucs1as/+pyWvhualcOKO4NWS1aCSSxJjQdzG4361iah899iXNaa4gefV/d1tqx8cF2mZXpYFs2Cqg57m0nn15E8qWuIHonctRGj0NWFxhCYSmU9gXrTla0bG4XC4g3cLceePB30WdClSLVA3sMatTUZuoeOyzDMF5m9KpH5XnHIwFgwQe97n5w4LV9GQ2DKu4SUo7fKrvvK1foiAuOy5UCBcfJJSiVS3PVhp235fUurgxDbHrG17m6Ipk7ys8l8wX2H3hbqDBOaqsTs7eO2e6tlOS+RIfwR4F6ful/JpOh2K99VamDEBf3gke5D+bBT+WKzilTU3ohqXCnhURS8FrPbL0FYS7iAXq7Eujyz7KpM79UFJZkZvMhIhj9JpAoa3vwt9QHVtABRQFQraKpgqTk=
Content-ID: <8558454F1082C04BBF58198AE97D9C12@eurprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67bf8ef4-ff74-4b9d-29fd-08d769071915
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2019 13:32:29.8771 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LV9Xyz3WcMhtMSzuHJqdC5S/E1am00NctthYlSTUjMBJsy5Ga4t3rlw59mXCr/J+eytcM+qmcBP2QDGM0loEdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR03MB5066
Subject: Re: [Xen-devel] [RFC 6/7] arm: Introduce dummy empty functions for
 data only C files
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
Cc: Andrii Anisov <Andrii_Anisov@epam.com>,
 "dgdegra@tycho.nsa.gov" <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "andrii.anisov@gmail.com" <andrii.anisov@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8gSnVsaWVuDQoNCk9uIFRodSwgMjAxOS0xMS0xNCBhdCAwODowMyArMDkwMCwgSnVsaWVu
IEdyYWxsIHdyb3RlOg0KPiANCj4gDQo+IE9uIFR1ZSwgMTIgTm92IDIwMTksIDA1OjU3IFN0ZWZh
bm8gU3RhYmVsbGluaSwgPA0KPiBzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToNCj4gPiBP
biBXZWQsIDYgTm92IDIwMTksIEFuZHJpaSBBbmlzb3Ygd3JvdGU6DQo+ID4gPiBGcm9tOiBBbmRy
aWkgQW5pc292IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPg0KPiA+ID4gDQo+ID4gPiBBUk0gQ29t
cGlsZXIgNiBoYXMgYSBwcm92ZW4gYnVnOiBpdCBjb21waWxlcyBkYXRhIG9ubHkgQyBmaWxlcw0K
PiA+IHdpdGgNCj4gPiA+IFNvZnRWRlAgYXR0cmlidXRlcy4gVGhpcyBsZWFkcyB0byBhIGZhaWxl
ZCBsaW5rYWdlIGFmdGVyd2FyZHMNCj4gPiB3aXRoDQo+ID4gPiBhbiBlcnJvcjoNCj4gPiA+IA0K
PiA+ID4gRXJyb3I6IEw2MjQyRTogQ2Fubm90IGxpbmsgb2JqZWN0IGJ1aWx0X2luLm8gYXMgaXRz
IGF0dHJpYnV0ZXMNCj4gPiBhcmUgaW5jb21wYXRpYmxlIHdpdGggdGhlIGltYWdlIGF0dHJpYnV0
ZXMuDQo+ID4gPiAuLi4gQTY0IGNsYXNoZXMgd2l0aCBTb2Z0VkZQLg0KPiA+ID4gDQo+ID4gPiBU
aGUga25vd24gd29ya2Fyb3VuZCBpcyBpbnRyb2R1Y2luZyBzb21lIGNvZGUgaW50byB0aGUgYWZm
ZWN0ZWQNCj4gPiBmaWxlLA0KPiA+ID4gZS5nLiBhbiBlbXB0eSAobm9uLXN0YXRpYykgZnVuY3Rp
b24gaXMgZW5vdWdoLg0KPiA+IA0KPiA+IE9oIG1hbiwgdGhpcyBpcyB0cnVseSBob3JyaWJsZS4N
Cj4gPiANCj4gPiBJZiB3ZSByZWFsbHkgaGF2ZSB0byBkbyB0aGlzIHBsZWFzZToNCj4gPiANCj4g
PiAtIHVzZSB0aGUgc2FtZSBkdW1teSBmdW5jdGlvbiBuYW1lIGluIGFsbCBmaWxlcw0KPiA+IC0g
dGhlIGZ1bmN0aW9uIHNob3VsZCBiZSBzdGF0aWMNCj4gPiAtIGhpZGluZyB0aGUgZnVuY3Rpb24g
d2l0aGluIGEgI2lmZGVmIEFSTUNDIGJsb2NrDQo+ID4gLSBwb3RlbnRpYWxseSBoaWRlIHRoZSB3
aG9sZSBob3JyaWJsZSBoYWNrIGJlaGluZCBhICNkZWZpbmUgc28gdGhhdA0KPiA+IGl0DQo+ID4g
ICB3b3VsZCBiZWNvbWUgYXQgdGhlIGNhbGwgc2l0ZToNCj4gPiANCj4gPiAgK0FSTUNDX0RVTU1Z
X0ZVTkNfSEFDSygpDQo+IA0KPiANCj4gVGhlIHJpc2sgaGVyZSBpcyB3ZSBtYXkgaW50cm9kdWNl
IG5ldyBmaWxlIGluIHRoZSBmdXR1cmUgcG9zc2libHkgaW4NCj4gY29tbW9uIGNvZGUgd2l0aCBz
aW1pbGFyIGlzc3Vlcy4gU28gSSB3b3VsZCBwcmVmZXIgaWYgd2UgY2FuIGZpbmQgYW4NCj4gYXV0
b21hdGljIHdheSB0byBkbyB0aGlzLiBTb21lIGlkZWFzOg0KPiAgICAgLSBBZGQgdGhlIGZ1bmN0
aW9uIGF0IGNvbXBpbGUgdGltZSAodmlhIG1ha2VmaWxlKS4gVGhpcyB3b3VsZCBiZQ0KPiBkb25l
IGZvciBhbGwgdGhlIGZpbGVzIGJ1dCB0aGF0J3Mgc2hvdWxkIG5vdCBiZSBhIG1ham9yIGlzc3Vl
cy4NCj4gICAgIC0gRm9yY2UgZGlzYWJsZSBzb2Z0ZnZwIGVpdGhlciB2aWEgY29tbWFuZCBsaW5l
LCBuZXcgbGluZSBpbiB0aGUNCj4gY29kZSBvciByZXdyaXRpbmcgdGhlIGF0dHJpYnV0ZSBvZiB0
aGUgb2JqZWN0Lg0KPiANCj4gQnV0IGJlZm9yZSBzcGVuZGluZyB0aW1lIHRyeWluZyB0byB3b3Jr
YXJvdW5kIGEgYnVnZ3kgY29tcGlsZXIuDQo+IFdoYXQncyB0aGUgcGxhbiB3aXRoIGl0PyBJcyBp
dCBnb2luZyB0byBiZSB1c2VkIGluIHByb2R1Y3Rpb24gb3IganVzdA0KPiBhIGRlbW8/DQoNClRo
aXMgaXMgbm90IGludGVuZGVkIGZvciBhIHByb2R1Y3Rpb24gcHJvZ3JhbSBhdCB0aGUgbW9tZW50
LCBhbmQgaXQNCm9idmlvdXNseSByZXF1aXJlIGxvdCBvZiBmdXJ0aGVyIHdvcmsuIEkgd291bGQg
bm90IHRyeSB0byB1cHN0cmVhbSB1Z2x5DQp3b3JrYXJvdW5kcyBmb3IgaXNzdWVzIGxpa2UgdGhl
IG9uZSBhYm92ZSwgaXQgd291bGQgYmUgbXVjaCBiZXR0ZXIgdG8NCnNvbWVob3cgcGVyc3VhZGUg
QXJtIHRvb2xzIHRlYW0gdG8gcHJvcGVybHkgZml4IHRoZW0uDQoNClRoaXMgUkZDIHNlcmllcyBo
YXMgZm9sbG93aW5nIGdvYWxzOg0KMSkgcHJvdmUgdGhhdCB3ZSBjYW4gdXNlIHNhZmV0eS1jZXJ0
aWZpZWQgdG9vbHMgZm9yIFhlbiBhbmQgYXZvaWQNCnBvc3NpYmxlIGFyZ3VtZW50cyBvbiBjb21w
aWxlci9saW5rZXIgY2VydGlmaWNhdGlvbiBwYXRoDQoyKSByZXNlYXJjaCBwb3NzaWJsZSBpc3N1
ZXMgd2hlbiB1c2luZyBub24tc3RhbmRhcmQgY29tcGlsZXIvbGlua2VyIGFuZA0KdHJ5IHRvIHNl
ZSBpZiBpdCBpcyBlYXN5IHRvIGFkanVzdCBYZW4gdG8gdXNlIHRoZW0NCg0KSW4gdGhlIGVuZCwg
aXQgd291bGQgYmUgZ3JlYXQgdG8gbWFrZSBYZW4gYnVpbGQgc3lzdGVtIGZsZXhpYmxlIGVub3Vn
aA0KdG8gdXNlIHdpdGggbm9uLXN0YW5kYXJkIGNvbXBpbGVycyB3aXRob3V0IG92ZXJjb21wbGlj
YXRpbmcgaXQgb3IgY2hhbmdpbmcgaXQgc2lnbmlmaWNhbnRseSwgY2F1c2luZyB0b28gbXVjaCBk
aXNydXB0aW9uIHRvIGNvbW11bml0eS4NCg0KPiBDaGVlcnMsDQo+IA0KPiANCj4gDQo+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IFhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QNCj4gWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IA0KPiBodHRw
czovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbF9fOyFLNmRtR0NFYWI0dWVKZyFrQ3BYdTJwcnRVeENIWlY4
YUN2eFlrOUU4Mktuc0h1TmZ0eUNlRzc0NUVpM3ZoTzJWUF9TWVhEbkl0SGVaWkN3ZHckDQo+ICAN
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
