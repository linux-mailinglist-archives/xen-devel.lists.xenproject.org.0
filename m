Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C30CD601E6
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jul 2019 10:03:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hjJA0-0008Ka-2S; Fri, 05 Jul 2019 08:01:36 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hVvi=VC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hjJ9y-0008KV-7Q
 for xen-devel@lists.xenproject.org; Fri, 05 Jul 2019 08:01:34 +0000
X-Inumbo-ID: 18d33208-9efb-11e9-8980-bc764e045a96
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 18d33208-9efb-11e9-8980-bc764e045a96;
 Fri, 05 Jul 2019 08:01:33 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Fri,  5 Jul 2019 08:01:08 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 5 Jul 2019 07:59:57 +0000
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (15.124.72.14) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 5 Jul 2019 07:59:57 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2794.namprd18.prod.outlook.com (20.179.50.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Fri, 5 Jul 2019 07:59:56 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2052.019; Fri, 5 Jul 2019
 07:59:56 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Paul Durrant <Paul.Durrant@citrix.com>, Anthony Perard
 <anthony.perard@citrix.com>
Thread-Topic: [Xen-devel] [PATCH] include/public/io/ring.h: Remove xen_mb,
 xen_rmb, xen_wmb macros
Thread-Index: AQHVMnuvDs7MuQLlgUGtrwp3AJHD/Ka6eY2AgAAlqmCAAQsSgA==
Date: Fri, 5 Jul 2019 07:59:56 +0000
Message-ID: <5c3268fd-bd69-f490-ef12-01a8c9cd4369@suse.com>
References: <20190704151522.32639-1-anthony.perard@citrix.com>
 <11258d51-03b7-05ad-e94c-e7dde56d39ee@suse.com>
 <c2a91602902b4c9294a12c4994a3663a@AMSPEX02CL03.citrite.net>
In-Reply-To: <c2a91602902b4c9294a12c4994a3663a@AMSPEX02CL03.citrite.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0501CA0030.eurprd05.prod.outlook.com
 (2603:10a6:4:67::16) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6c142028-5a84-4894-b933-08d7011ec4e9
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2794; 
x-ms-traffictypediagnostic: DM6PR18MB2794:
x-microsoft-antispam-prvs: <DM6PR18MB27947D0DAA6EC0F6996EDDCBB3F50@DM6PR18MB2794.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 008960E8EC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(376002)(396003)(346002)(366004)(39860400002)(13464003)(189003)(199004)(478600001)(2906002)(99286004)(8936002)(53936002)(305945005)(31686004)(6116002)(52116002)(76176011)(3846002)(72206003)(5660300002)(14454004)(66066001)(71190400001)(31696002)(71200400001)(86362001)(66556008)(66446008)(73956011)(6486002)(66476007)(66946007)(64756008)(229853002)(256004)(26005)(476003)(446003)(11346002)(2616005)(6436002)(25786009)(186003)(6512007)(316002)(102836004)(53546011)(6506007)(80792005)(110136005)(54906003)(386003)(68736007)(8676002)(7736002)(6246003)(107886003)(486006)(36756003)(4326008)(81156014)(81166006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2794;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: CJyEJ2CM+agO6V/MW1ibIxQoVeyv3nTmDx4xpfhB2toMmMx/kmheeSFDzrLHVhXEgsAkGDOffS389vHjlOyQ4fJyrydsQ3xIb/dH8QwcDBNNQNW6wBhObn8pTOT6KX4AK11t/54M/uZhKoDBK+ra5b0YFxQbkypFuqbD2qNmbcli5J0IqEZrVN1wZYolHb34BfkeHUk+e1HUlZm3eeyOGV+oqzy/Eq56A7nCxNrCNn67cDk2YkuCN8gStSfqNbYo9UGHZ/U7PBvbFaefoMR6Ip4mjIY02oP/xDxZWBTBd0JKZ749+S0M+ryZkMVyE3OdVCjBaGV/UFEZWzOkqgdevvMECjMm2k1JkqwdTDTyDARwqU8R07RCMfoHkf58aZDX+De3gdVl/NgvmjpJykw+h0cvWOyHiMLkbfOIkJNseAA=
Content-ID: <51EEC1935F789243B1110B441E91BDB0@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c142028-5a84-4894-b933-08d7011ec4e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2019 07:59:56.2361 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2794
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] include/public/io/ring.h: Remove xen_mb,
 xen_rmb, xen_wmb macros
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
Cc: Juergen Gross <JGross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 KonradRzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDcuMjAxOSAxODoxMSwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4+IEZyb206IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4N
Cj4+IFNlbnQ6IDA0IEp1bHkgMjAxOSAxNjo0OQ0KPj4gVG86IEFudGhvbnkgUGVyYXJkIDxhbnRo
b255LnBlcmFyZEBjaXRyaXguY29tPg0KPj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZzsgUGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT47IEtvbnJhZCBSemVz
enV0ZWsgV2lsaw0KPj4gPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+OyBKdWVyZ2VuIEdyb3NzIDxK
R3Jvc3NAc3VzZS5jb20+DQo+PiBTdWJqZWN0OiBSZTogW1hlbi1kZXZlbF0gW1BBVENIXSBpbmNs
dWRlL3B1YmxpYy9pby9yaW5nLmg6IFJlbW92ZSB4ZW5fbWIsIHhlbl9ybWIsIHhlbl93bWIgbWFj
cm9zDQo+Pg0KPj4gT24gMDQuMDcuMjAxOSAxNzoxNSwgQW50aG9ueSBQRVJBUkQgd3JvdGU6DQo+
Pj4gVGhvc2UgbWFjcm9zIHdoZXJlIGludHJvZHVjZWQgd2hlbiBhIHByZWZpeCAieGVuXyIgd2Fz
IGFkZGVkIHRvDQo+Pj4gbWIscm1iLHdtYi4gVGhlcmUgYXJlIGdhdGVkIG9uIF9fWEVOX0lOVEVS
RkFDRV9WRVJTSU9OX18sIGJ1dCB0aGVyZQ0KPj4+IGFyZSBub3QgcGFydCBvZiB0aGUgWGVuIGlu
dGVyZmFjZS4gVXNlcnMgb2YgcmluZy5oIG5lZWRzIHRvIHByb3ZpZGUNCj4+PiB4ZW5fW3J3XT9t
YigpIGFueXdhaSBiZWNhdXNlIFtyd10/bWIoKSBpc24ndCBsaWtlbHkgdG8gZXhpc3QuDQo+Pg0K
Pj4gSXQncyBub3QgY2xlYXIgdG8gbWUgd2hhdCB5b3Ugd2FudCB0byBhY2hpZXZlOg0KPj4NCj4g
DQo+IFRoZSBpc3N1ZSBpcyB0aGF0IGFueSBwcm9qZWN0IGltcG9ydGluZyB0aGlzIGhlYWRlciAo
aW4gdGhpcyBjYXNlIFFFTVUsDQo+IGJ1dCBJIGhhdmUgdGhlIHNhbWUgaXNzdWUgaW4gdGhlIFdp
bmRvd3MgUFYgZHJpdmVycykgbmVlZHMgdG8gaW1wb3J0DQo+IHhlbi1jb21wYXQuaCAob3IgZHJl
YW0gdXAgYSBoZWFkZXIgb2YgdGhlIHNhbWUgbmFtZSksIGV2ZW4gdGhvdWdoIHRoaXMNCj4gaGVh
ZGVyIGlzIG9ubHkgY29uY2VybmVkIHdpdGggdGhlIHVuZGVycGlubmluZ3Mgb2YgUFYgcHJvdG9j
b2xzIGFuZCBoYXMNCj4gbm90aGluZywgYXMgc3VjaCwgdG8gZG8gd2l0aCBYZW4uDQoNCldoaWxl
IEkgYWdyZWUgdGhpcyBzaG91bGRuJ3QgaGF2ZSBiZWVuIHBhcnQgb2YgdGhlIHB1YmxpYyBoZWFk
ZXJzLA0KdGhhdCBzaGlwIGhhcyBzYWlsZWQgbG9uZywgbG9uZyBhZ28uIElmIGEgY29tcG9uZW50
IGRvZXNuJ3QgdXNlIHRoZQ0KaGVhZGVycyB2ZXJiYXRpbSwgSSBkb24ndCBzZWUgd2h5IHRoZXkg
Y291bGRuJ3QgcmVtb3ZlIHRoYXQgc2VjdGlvbg0KaW4gdGhlaXIgY29weS4gSWYgb3RvaCB0aGV5
IHVzZSB0aGUgaGVhZGVycyB2ZXJiYXRpbSwgdGhlbiBJJ2QNCmV4cGVjdCB0aGVtIHRvIGFsc28g
dXNlIHhlbi1jb21wYXQuaA0KDQo+IFRvIGtlZXAgb2xkIHZlcmJhdGltIHVzZXJzIChhcmUgdGhl
cmUgcmVhbGx5IGFueSBhdCBhbGw/KSBoYXBweSwgaG93IGFib3V0IHNpbXBsZS4uLg0KPiANCj4g
I2lmbmRlZiB4ZW5fbWIoKQ0KPiAjZGVmaW5lIHhlbl9tYigpIG1iKCkNCj4gI2VuZGlmDQo+IA0K
PiBjb25zdHJ1Y3RzPw0KDQpUaGlzIHdvdWxkIHN0aWxsIGNhdXNlIGNvbmZsaWN0cyBpZiBhIGNv
bXBvbmVudCBlbmRzIHVwIGRlZmluaW5nDQp4ZW5fbWIoKSBvbmx5IGFmdGVyIHRoZSBpbmNsdXNp
b24gb2YgdGhpcyBoZWFkZXIuIEFzIHRvIHRoZXJlDQphY3R1YWxseSBiZWluZyBhbnkgLSB0aGUg
b2xkIExpbnV4IDIuNi4xOCB0cmVlIGRpZCBwdWxsIGluIGNvcGllcw0Kb2YgdGhlIGhlYWRlcnMg
d2l0aG91dCBmdXJ0aGVyIGVkaXRpbmcuIEJleW9uZCB0aGF0IHdoaWxlIEknbQ0KdW5hd2FyZSBv
ZiBhbnksIHdlIHNpbXBseSBjYW4ndCBrbm93LiBVbnRpbCBub3cgdGhlcmUgc2ltcGx5IHdhcw0K
YW4gaW1wbGllZCBwcm9taXNlIHRoYXQgd2Ugd291bGQgdHJ5IG91ciBiZXN0IHRvIGF2b2lkIGJy
ZWFraW5nDQpleGlzdGluZyB1c2Vycy4gQXMgYSBjb21tdW5pdHkgd2UgY291bGQgY2VydGFpbmx5
IGRlY2lkZSB0aGF0IHdlDQpkb24ndCBjYXJlIGRvaW5nIHNvIGFueW1vcmUsIGF0IHdoaWNoIHBv
aW50IG1vcmUgY29tcGF0IGNydWZ0DQpjb3VsZCBiZSBkZWxldGVkLiBJIHdvdWxkbid0IHN1cHBv
cnQgdXMgZG9pbmcgc28sIGJ1dCBJIGFsc28NCndvdWxkbid0IHRyeSB0byB2ZXRvIGl0LCBJIHRo
aW5rLg0KDQpKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
