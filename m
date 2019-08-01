Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F157D6EF
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2019 10:08:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ht65N-0007Xz-LO; Thu, 01 Aug 2019 08:05:17 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uhot=V5=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1ht65L-0007Xu-In
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2019 08:05:15 +0000
X-Inumbo-ID: 17299459-b433-11e9-8980-bc764e045a96
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0c::729])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 17299459-b433-11e9-8980-bc764e045a96;
 Thu, 01 Aug 2019 08:05:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CPwKVUr8ScpkqdJhjTeaO4mDXd2yN28vvlEpn/59kiT/mtjTD6w9wUXv7STMQrQ4JNYPzbN8Ot3C3LsjxkldFaZRdXVQ3qc2snGalLcMVJsg/X3K/mjbLP/RGRTtolHwwYm5wUjFf+7CcAiQQttRE5Qc77GDPfhOvfceYcebVLqVIzJfMihByhgfDGJr9Xs4JfVSVkcykyT7uQDnkVHLeSLa5C+6nExXr5SuubzLqqcgE6AB2Pt9dWiHDZ+QlDYSDIXwggWPHfCC5+C96zn3uheFmga1bciFCSGLoXCj/Af6qhGVub+py19voe32KOWJnGM+xyCwGKFG/Ksx723Y+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gVEoFUbd5yXTXAGcGDNlvLnEUnLNIC9VtjMIHtG1I6M=;
 b=LeZ1IPlCD7XrpbK7qUf+nCp/l8n3kU4eBPQaMUlYB3S17qfhzkHrHHJTIVevAeVY/1Gsql6s5qSbwoUwYgMv1G175iTwTrZcKL8BvlBqBUqyhwIFVTI/ZgdQpVDJYoD0BZCFnhuDhntFk64v/X8WrH4VvJpJm/5p+VcFNUrm8Mo59gwJfMJRPIVOqoN+FmeYUgBpruxPups7lY+aNR8HS0Dr6Exd+Tsf8e7ca710pz6X1j5VYVgzE4AxJSLdHCSqRIrLLOU6oIuEVb9CnmAmwkuMawHyHgAor6lodqIiXnss3BlWc4t+lfJ5iyml4l/5MwkjZiFcuX0EIdtVFB3jCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=bitdefender.com;dmarc=pass action=none
 header.from=bitdefender.com;dkim=pass header.d=bitdefender.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gVEoFUbd5yXTXAGcGDNlvLnEUnLNIC9VtjMIHtG1I6M=;
 b=FRSDfjTfFu98pD1sfUopdY23D70B6IzaEIqCehFaX9kn2wH4xsBMIrmsVITqVNRpWtfsmAhMHso16Op5Zjen2wbXnwN7obg/liDKPrDLpF1yg3BUXdAY5Ky2m4rY0UZnPPUS6Q/byUB1TGDUitf4jZwIuF616NAn4ndSfVf7Bf8=
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com (10.171.106.11) by
 VI1PR0202MB2797.eurprd02.prod.outlook.com (10.171.101.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Thu, 1 Aug 2019 08:05:11 +0000
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::a106:1e81:a2d2:2d46]) by VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::a106:1e81:a2d2:2d46%9]) with mapi id 15.20.2136.010; Thu, 1 Aug 2019
 08:05:11 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Paul Durrant <paul.durrant@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 3/6] remove late (on-demand) construction of IOMMU page
 tables
Thread-Index: AQHVRt0NS7ptkuDxekacC+PpPXyb/qbl8e+A
Date: Thu, 1 Aug 2019 08:05:10 +0000
Message-ID: <f169e87d-676d-1a30-e813-001460364142@bitdefender.com>
References: <20190730134419.2739-1-paul.durrant@citrix.com>
 <20190730134419.2739-4-paul.durrant@citrix.com>
In-Reply-To: <20190730134419.2739-4-paul.durrant@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR0P264CA0068.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1d::32) To VI1PR0202MB2928.eurprd02.prod.outlook.com
 (2603:10a6:800:e3::11)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ec2c5cc3-9885-47ec-bbc0-08d71656f994
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:VI1PR0202MB2797; 
x-ms-traffictypediagnostic: VI1PR0202MB2797:|VI1PR0202MB2797:
x-microsoft-antispam-prvs: <VI1PR0202MB2797191CE79AA2992956DA73ABDE0@VI1PR0202MB2797.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 01165471DB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(136003)(366004)(396003)(39860400002)(376002)(199004)(189003)(305945005)(99286004)(66946007)(52116002)(5660300002)(478600001)(66446008)(64756008)(186003)(66556008)(66476007)(8936002)(6486002)(2906002)(476003)(7416002)(486006)(76176011)(26005)(102836004)(386003)(53546011)(6506007)(36756003)(107886003)(14454004)(68736007)(229853002)(446003)(6436002)(2616005)(2501003)(11346002)(8676002)(81166006)(81156014)(66066001)(31686004)(4326008)(6512007)(53936002)(86362001)(6246003)(25786009)(7736002)(31696002)(256004)(6116002)(3846002)(110136005)(54906003)(316002)(71190400001)(71200400001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0202MB2797;
 H:VI1PR0202MB2928.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: AfjiF6siYxgz+FB1ZgFGn0KsDmoFaqZP3gp3QKGpYLBFP/oG+Bg/K1ZIWfRI+klflOETuX4EAqJm9bB3nDDt9/tio7hXfcFGP//Th1TL8PR06phUmlqH0Bkdgg8CDk6d1vQKvR4oFMglrh8tD0r+DdWTaRf3AuXt0rQi5jOuop/oJpWOGQomIArfi5cFlmvfByMSOS0+Oza5CXSuS6rEhFtR7e6EcailPxXbj8Al7R63S/7cgso6jL1A2hwNjFM51NFWuR/lCRWlELoC7BjO23RweBLrUg4g1KMM9zNh5MrXV33tkFeOs0bSbaedVA6hMHCG3rAQrliggg1kkZy1ljhDIC5f1cdoD4UgneB+nc45wwHbJ4+4WMxzcoerIltaj1/XffGD1Zhu1TJCdC7i40DDAApC7kg9SgcSl8PrY9g=
Content-ID: <46D04415463A2546BBEB291E49A4C4D0@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec2c5cc3-9885-47ec-bbc0-08d71656f994
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2019 08:05:10.9425 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aisaila@bbu.bitdefender.biz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0202MB2797
Subject: Re: [Xen-devel] [PATCH 3/6] remove late (on-demand) construction of
 IOMMU page tables
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
 Stefano Stabellini <sstabellini@kernel.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDMwLjA3LjIwMTkgMTY6NDQsIFBhdWwgRHVycmFudCB3cm90ZToNCj4gTm93IHRoYXQg
dGhlcmUgaXMgYSBwZXItZG9tYWluIElPTU1VIGVuYWJsZSBmbGFnLCB3aGljaCBzaG91bGQgYmUg
ZW5hYmxlZCBpZg0KPiBhbnkgZGV2aWNlIGlzIGdvaW5nIHRvIGJlIHBhc3NlZCB0aHJvdWdoLCBz
dG9wIGRlZmVycmluZyBwYWdlIHRhYmxlDQo+IGNvbnN0cnVjdGlvbiB1bnRpbCB0aGUgYXNzaWdu
bWVudCBpcyBkb25lLiBBbHNvIGRvbid0IHRlYXIgZG93biB0aGUgdGFibGVzDQo+IGFnYWluIHdo
ZW4gdGhlIGxhc3QgZGV2aWNlIGlzIGRlLWFzc2lnbmVkOyBkZWZlciB0aGF0IHRhc2sgdW50aWwg
ZG9tYWluDQo+IGRlc3RydWN0aW9uLg0KPiANCj4gVGhpcyBhbGxvd3MgdGhlIGhhc19pb21tdV9w
dCgpIGhlbHBlciBhbmQgaW9tbXVfc3RhdHVzIGVudW1lcmF0aW9uIHRvIGJlDQo+IHJlbW92ZWQu
IENhbGxzIHRvIGhhc19pb21tdV9wdCgpIGFyZSBzaW1wbHkgcmVwbGFjZWQgYnkgY2FsbHMgdG8N
Cj4gaXNfaW9tbXVfZW5hYmxlZCgpLiBSZW1haW5pbmcgb3Blbi1jb2RlIHRlc3RzIG9mIGlvbW11
X2hhcF9wdF9zaGFyZSBjYW4gYWxzbw0KPiBiZSByZXBsYWNlZCBieSBjYWxscyB0byBpb21tdV91
c2VfaGFwX3B0KCkuDQo+IFRoZSBhcmNoX2lvbW11X3BvcHVsYXRlX3BhZ2VfdGFibGUoKSBhbmQg
aW9tbXVfY29uc3RydWN0KCkgZnVuY3Rpb25zIGJlY29tZQ0KPiByZWR1bmRhbnQsIGFzIGRvZXMg
dGhlICdzdHJpY3QgbW9kZScgZG9tMCBwYWdlX2xpc3QgbWFwcGluZyBjb2RlIGluDQo+IGlvbW11
X2h3ZG9tX2luaXQoKSwgYW5kIGlvbW11X3RlYXJkb3duKCkgY2FuIGJlIG1hZGUgc3RhdGljIGlz
IGl0cyBvbmx5DQo+IHJlbWFpbmluZyBjYWxsZXIsIGlvbW11X2RvbWFpbl9kZXN0cm95KCksIGlz
IHdpdGhpbiB0aGUgc2FtZSBzb3VyY2UNCj4gbW9kdWxlLg0KPiANCj4gQWxsIGluIGFsbCwgYWJv
dXQgMjIwIGxpbmVzIG9mIGNvZGUgYXJlIHJtZW92ZWQuDQo+IA0KPiBOT1RFOiBUaGlzIHBhdGNo
IHdpbGwgY2F1c2UgYSBzbWFsbCBhbW91bnQgb2YgZXh0cmEgcmVzb3VyY2UgdG8gYmUgdXNlZA0K
PiAgICAgICAgdG8gYWNjb21tb2RhdGUgSU9NTVUgcGFnZSB0YWJsZXMgdGhhdCBtYXkgbmV2ZXIg
YmUgdXNlZCwgc2luY2UgdGhlDQo+ICAgICAgICBwZXItZG9tYWluIElPTU1VIGZsYWcgZW5hYmxl
IGZsYWcgaXMgY3VycmVudGx5IHNldCB0byB0aGUgdmFsdWUNCj4gICAgICAgIG9mIHRoZSBnbG9i
YWwgaW9tbXVfZW5hYmxlIGZsYWcuIEEgc3Vic2VxdWVudCBwYXRjaCB3aWxsIGFkZCBhbg0KPiAg
ICAgICAgb3B0aW9uIHRvIHRoZSB0b29sc3RhY2sgdG8gYWxsb3cgaXQgdG8gYmUgdHVybmVkIG9m
ZiBpZiB0aGVyZSBpcw0KPiAgICAgICAgbm8gaW50ZW50aW9uIHRvIGFzc2lnbiBwYXNzdGhyb3Vn
aCBoYXJkd2FyZSB0byB0aGUgZG9tYWluLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJy
YW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4NCkZvciB0aGUgdm1fZXZlbnQgcGFydC4NCg0K
UmV2aWV3ZWQtYnk6IEFsZXhhbmRydSBJc2FpbGEgPGFpc2FpbGFAYml0ZGVmZW5kZXIuY29tPg0K
DQo+IC0tLQ0KPiBDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3Jn
Pg0KPiBDYzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4NCj4gQ2M6IFZvbG9k
eW15ciBCYWJjaHVrIDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT4NCj4gQ2M6IEFuZHJldyBD
b29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo+IENjOiBHZW9yZ2UgRHVubGFwIDxH
ZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20+DQo+IENjOiBJYW4gSmFja3NvbiA8aWFuLmphY2tz
b25AZXUuY2l0cml4LmNvbT4NCj4gQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4N
Cj4gQ2M6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4NCj4g
Q2M6IFRpbSBEZWVnYW4gPHRpbUB4ZW4ub3JnPg0KPiBDYzogV2VpIExpdSA8d2xAeGVuLm9yZz4N
Cj4gQ2M6ICJSb2dlciBQYXUgTW9ubsOpIiA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+IENjOiBU
YW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+DQo+IENjOiBHZW9yZ2UgRHVubGFw
IDxnZW9yZ2UuZHVubGFwQGV1LmNpdHJpeC5jb20+DQo+IENjOiBSYXp2YW4gQ29qb2NhcnUgPHJj
b2pvY2FydUBiaXRkZWZlbmRlci5jb20+DQo+IENjOiBBbGV4YW5kcnUgSXNhaWxhIDxhaXNhaWxh
QGJpdGRlZmVuZGVyLmNvbT4NCj4gQ2M6IFBldHJlIFBpcmNhbGFidSA8cHBpcmNhbGFidUBiaXRk
ZWZlbmRlci5jb20+DQo+IC0tLQ0KPiAgIHhlbi9hcmNoL2FybS9wMm0uYyAgICAgICAgICAgICAg
ICAgICAgfCAgIDIgKy0NCj4gICB4ZW4vYXJjaC94ODYvZG9tMF9idWlsZC5jICAgICAgICAgICAg
IHwgICAyICstDQo+ICAgeGVuL2FyY2gveDg2L2h2bS9tdHJyLmMgICAgICAgICAgICAgICB8ICAg
NSArLQ0KPiAgIHhlbi9hcmNoL3g4Ni9tbS9tZW1fc2hhcmluZy5jICAgICAgICAgfCAgIDIgKy0N
Cj4gICB4ZW4vYXJjaC94ODYvbW0vcGFnaW5nLmMgICAgICAgICAgICAgIHwgICAyICstDQo+ICAg
eGVuL2FyY2gveDg2L3g4Nl82NC9tbS5jICAgICAgICAgICAgICB8ICAgMiArLQ0KPiAgIHhlbi9j
b21tb24vbWVtb3J5LmMgICAgICAgICAgICAgICAgICAgfCAgIDQgKy0NCj4gICB4ZW4vY29tbW9u
L3ZtX2V2ZW50LmMgICAgICAgICAgICAgICAgIHwgICAyICstDQo+ICAgeGVuL2RyaXZlcnMvcGFz
c3Rocm91Z2gvZGV2aWNlX3RyZWUuYyB8ICAxMSAtLS0NCj4gICB4ZW4vZHJpdmVycy9wYXNzdGhy
b3VnaC9pb21tdS5jICAgICAgIHwgMTM0ICsrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICAg
eGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMgICAgICAgICB8ICAxMiAtLS0NCj4gICB4ZW4v
ZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYyAgIHwgIDEwICstDQo+ICAgeGVuL2RyaXZl
cnMvcGFzc3Rocm91Z2gveDg2L2lvbW11LmMgICB8ICA5NSAtLS0tLS0tLS0tLS0tLS0tLS0NCj4g
ICB4ZW4vaW5jbHVkZS9hc20tYXJtL2lvbW11LmggICAgICAgICAgIHwgICAyICstDQo+ICAgeGVu
L2luY2x1ZGUvYXNtLXg4Ni9pb21tdS5oICAgICAgICAgICB8ICAgMiArLQ0KPiAgIHhlbi9pbmNs
dWRlL3hlbi9pb21tdS5oICAgICAgICAgICAgICAgfCAgMTYgLS0tDQo+ICAgeGVuL2luY2x1ZGUv
eGVuL3NjaGVkLmggICAgICAgICAgICAgICB8ICAgMiAtDQo+ICAgMTcgZmlsZXMgY2hhbmdlZCwg
NDIgaW5zZXJ0aW9ucygrKSwgMjYzIGRlbGV0aW9ucygtKQ0KPiANCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
