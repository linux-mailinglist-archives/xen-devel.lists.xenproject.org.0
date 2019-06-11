Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AB93D57F
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 20:29:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1halTO-0004CZ-9V; Tue, 11 Jun 2019 18:26:18 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SowN=UK=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1halTM-0004CU-GZ
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 18:26:16 +0000
X-Inumbo-ID: 65120c03-8c76-11e9-8980-bc764e045a96
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.46]) by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 65120c03-8c76-11e9-8980-bc764e045a96;
 Tue, 11 Jun 2019 18:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=txdMjS6YCrmGoFQIbqgD7OMMLeAYVql9xcVbM47qdHM=;
 b=rq7WtrjoI/0yCwze1P2R9PLkRZMvvm1UM7e+2ufifbGKqYqyu0zb0VlNWrEOw/1jj137D9I4EY6MpLN95G4g0W9+I+JLT1JxjkwIWu3UZbcRcM0k0pDcr+5vnZ6z2IE5NyJbicz33Aq7JTHrvk6KvloSUOnJjuMNUBuMbDIhPTw=
Received: from AM0PR08MB3139.eurprd08.prod.outlook.com (52.134.93.144) by
 AM0PR08MB3377.eurprd08.prod.outlook.com (20.177.108.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Tue, 11 Jun 2019 18:26:12 +0000
Received: from AM0PR08MB3139.eurprd08.prod.outlook.com
 ([fe80::a52e:cd0a:64fb:a6ee]) by AM0PR08MB3139.eurprd08.prod.outlook.com
 ([fe80::a52e:cd0a:64fb:a6ee%5]) with mapi id 15.20.1965.017; Tue, 11 Jun 2019
 18:26:12 +0000
From: Julien Grall <Julien.Grall@arm.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Thread-Topic: [PATCH v5 01/10] xen/arm: add generic TEE mediator framework
Thread-Index: AQHVIIIZmnoV+G4xlUmzn5dOSxuC+6aWxUQA
Date: Tue, 11 Jun 2019 18:26:12 +0000
Message-ID: <4fd1e868-50ea-63a0-4c6c-bccea96fccce@arm.com>
References: <20190521212530.12706-1-volodymyr_babchuk@epam.com>
 <20190521212530.12706-2-volodymyr_babchuk@epam.com>
 <1183ab3f-e483-9ad8-ede3-c905bc2d9331@arm.com>
 <73a3c967-66f8-5d26-f657-5093c25cc76b@arm.com> <87y3286l50.fsf@epam.com>
In-Reply-To: <87y3286l50.fsf@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0062.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::26) To AM0PR08MB3139.eurprd08.prod.outlook.com
 (2603:10a6:208:5d::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e24375ae-a543-4e7c-0c25-08d6ee9a482b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM0PR08MB3377; 
x-ms-traffictypediagnostic: AM0PR08MB3377:
nodisclaimer: True
x-microsoft-antispam-prvs: <AM0PR08MB3377D763A7579C0CA106268E80ED0@AM0PR08MB3377.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 006546F32A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(346002)(39860400002)(136003)(376002)(366004)(199004)(189003)(53546011)(54906003)(256004)(14454004)(2906002)(316002)(186003)(73956011)(6512007)(5660300002)(3846002)(72206003)(478600001)(476003)(71200400001)(229853002)(11346002)(86362001)(486006)(2616005)(446003)(31696002)(6116002)(71190400001)(8936002)(44832011)(76176011)(6246003)(102836004)(6436002)(68736007)(53936002)(66066001)(99286004)(31686004)(26005)(6506007)(52116002)(66446008)(81156014)(4326008)(66946007)(66476007)(66556008)(7416002)(6916009)(8676002)(64756008)(36756003)(25786009)(305945005)(81166006)(386003)(7736002)(6486002)(41533002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB3377;
 H:AM0PR08MB3139.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +0M0D4bsvV0mTeUe9NfTb5HCP3FcuXzratskYhbTcHoqJuxEEX68xkShTbUENcRkUkrTDrx/3z6n4aO8DLZXLqNyR1EENbNUiykDGsDiCyn1wRmvEbFj0UML1FMrW90vWNVqYaf3HW9L/hE/7ooQ0Tc2AfcD/149scycKUflpEN1hXNHvar6JQHIsguLOBoj700+CrpG+HfkxAN/ZrBoBl/IuReYuyTmE1MfsDDeqZS1377fqU7ICxktXfm1vgiPrp2kzUvsJEHjBn1q6oYMkO43ITN81qobu+pRs0ZQKp+O3lWpAycoGfwTlddBjvh/kClAE1PfeI3N0AxNu83IEjbFw9CmwBJPqSglWhk4odIg1qHn0EHQ5Ct88yew2YlkejJrPGtQf5jFFXLsTTpNoQCT1MHhq5Pzc7LpmiOYMLQ=
Content-ID: <FC9584190FAC054AB09254D25FF9A242@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e24375ae-a543-4e7c-0c25-08d6ee9a482b
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2019 18:26:12.5707 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Julien.Grall@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3377
Subject: Re: [Xen-devel] [PATCH v5 01/10] xen/arm: add generic TEE mediator
 framework
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDExLzA2LzIwMTkgMTk6MTgsIFZvbG9keW15ciBCYWJjaHVrIHdyb3RlOg0KPiANCj4g
SGkgSnVsaWVuLA0KDQpIaSwNCg0KDQo+IEp1bGllbiBHcmFsbCB3cml0ZXM6DQo+IA0KPj4gT24g
MDYvMDYvMjAxOSAxNzowMiwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+IEhpIFZvbG9keW15ciwN
Cj4+Pg0KPj4+IE9uIDUvMjEvMTkgMTA6MjUgUE0sIFZvbG9keW15ciBCYWJjaHVrIHdyb3RlOg0K
Pj4+PiArc3RhdGljIGlubGluZSBib29sIHRlZV9oYW5kbGVfY2FsbChzdHJ1Y3QgY3B1X3VzZXJf
cmVncyAqcmVncykNCj4+Pj4gK3sNCj4+Pj4gKyByZXR1cm4gZmFsc2U7DQo+Pj4+ICt9DQo+Pj4+
ICsNCj4+Pj4gK3N0YXRpYyBpbmxpbmUgaW50IHRlZV9kb21haW5faW5pdChzdHJ1Y3QgZG9tYWlu
ICpkLCB1aW50MTZfdCB0ZWVfdHlwZSkNCj4+Pj4gK3sNCj4+Pj4gKyByZXR1cm4gLUVOT0RFVjsN
Cj4+Pj4gK30NCj4+Pg0KPj4+IEkgaGFkIGEgcmVwb3J0IHRoYXQgWGVuIGZhaWxzIHRvIGJvb3Qg
d2l0aCB0aGlzIHNlcmllcyBhbmQNCj4+PiAhQ09ORklHX1RFRS4gVGhpcyBpcyBiZWNhdXNlIHlv
dSByZXR1cm4gYW4gZXJyb3IgaGVyZSBpbiBhbGwgdGhlDQo+Pj4gY2FzZSBzb21lIGRvbWFpbiBj
cmVhdGlvbiB3aWxsIGFsd2F5cyBmYWlsLg0KPiBUaGFua3MgZm9yIHJlcG9ydGluZy4gSSBmb3Jn
b3QgdG8gdGVzdCB0aGF0IGNhc2UgOigNCj4gDQo+Pj4gSW5zdGVhZCB0aGlzIHNob3VsZCBjaGVj
ayB0aGF0IHRlZV90eXBlIGlzIGFsd2F5cyBOT05FIG9yIGVsc2UgcmV0dXJuIGFuIGVycm9yLg0K
Pj4+DQo+Pj4gQWxzbywgcGxlYXNlIGF0IGxlYXN0IGNoZWNrIHRoYXQgeW91ciBzZXJpZXMgZG9l
cyBub3QgYnJlYWsgYm9vdA0KPj4+IHdoZW4gQ09ORklHX1RFRSBpcyBub3Qgc2VsZWN0ZWQuIEl0
IHdvdWxkIGFsc28gYmUgaWRlYWwgKGJ1dCBub3QNCj4+PiBtYW5kYXRvcnkpIGlmIHlvdSBjYW4g
Y2hlY2sgdGhhdCBpdCBkb2VzIG5vdCBicmVhayBvbiBub24tT1BURUUNCj4+PiBwbGF0Zm9ybSB3
aGVuICFDT05GSUdfVEVFIGlzIHNlbGVjdGVkLg0KPj4NCj4+IEkganVzdCByZWFsaXplZCB0aGlz
IHBhcmFncmFwaCBtYXkgbm90IGJlIGNsZWFyLiBXaGF0IEkgbWVhbnQgaXMgd2UNCj4+IG5lZWQg
dG8gYXQgbGVhc3QgdGVzdCB0aGVyZSBhcmUgbm8gcmVncmVzc2lvbiB3aGVuIGJvb3Rpbmcgd2hl
biB3aXRoDQo+PiBDT05GSUdfVEVFPW4uDQo+Pg0KPj4gRm9yIENPTkZJR19URUU9eSwgaXQgd291
bGQgYmUgZ29vZCB0byB0ZXN0IHRoYXQgaXQgc3RpbGwgYm9vdHMgb24NCj4+IHBsYXRmb3JtIG5v
dCBwcm92aWRpbmcgT1AtVEVFLiBUaGlzIGlzIG5vdCBjcml0aWNhbCBiZWNhdXNlIHRoZSBjb25m
aWcNCj4+IGNhbm5vdCBiZSBzZWxlY3RlZCB3aXRob3V0IENPTkZJR19YRU5fRVhQRVJUPXkuDQo+
IEkgZml4ZWQgQ09ORklHX1RFRT1uIGlzc3VlIGluIHRoZSBuZXcgdmVyc2lvbiwgd2hpY2ggSSdt
IGdvaW5nIHRvIHNlbmQNCj4gbGF0ZXIgdG9kYXkuDQo+IA0KPiBBbHNvIEkgbWFkZSBvcHRlZV9w
cm9iZSgpICh3aXRoIENPTkZJR19PUFRFRT15IG9mIGNvdXJzZSkgdG8gcmV0dXJuDQo+IGZhbHNl
IHRvIGVtdWxhdGVkIHBsYXRmb3JtIHdpdGhvdXQgT1AtVEVFLiBTeXN0ZW0gYm9vdHMgYW5kIHdv
cmtzIGFzDQo+IHVzdWFsLg0KPiANCj4gQWxzbyBJIGFkZHJlc3NlZCB5b3VyIG90aGVyIGNvbW1l
bnRzIGZvciB0aGlzIHBhdGNoLg0KDQpUaGFuayB5b3UhIEkgd2lsbCBoYXZlIGEgbG9vayBhdCB0
aGUgbmV4dCB2ZXJzaW9uLg0KDQpDaGVlcnMsDQoNCi0tIA0KSnVsaWVuIEdyYWxsDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
