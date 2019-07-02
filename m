Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA2F5D102
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2019 15:51:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiJ95-0002yR-MA; Tue, 02 Jul 2019 13:48:31 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lloE=U7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hiJ94-0002yM-7y
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2019 13:48:30 +0000
X-Inumbo-ID: 048686ff-9cd0-11e9-8980-bc764e045a96
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 048686ff-9cd0-11e9-8980-bc764e045a96;
 Tue, 02 Jul 2019 13:48:28 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Tue,  2 Jul 2019 13:48:00 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 2 Jul 2019 13:48:03 +0000
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (15.124.72.10) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 2 Jul 2019 13:48:02 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3362.namprd18.prod.outlook.com (10.255.154.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.17; Tue, 2 Jul 2019 13:48:02 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2052.010; Tue, 2 Jul 2019
 13:48:02 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2 02/10] AMD/IOMMU: use bit field for extended feature
 register
Thread-Index: AQHVMM8ahTOfdYIYMkGKpA4vuokia6a3V+GA
Date: Tue, 2 Jul 2019 13:48:01 +0000
Message-ID: <73ee5309-b2ce-bb02-51fc-2987acc325ad@suse.com>
References: <5D024C500200007800237DD8@prv1-mh.provo.novell.com>
 <5D14DDA6020000780023B96E@prv1-mh.provo.novell.com>
 <5D14DE87020000780023B97E@prv1-mh.provo.novell.com>
 <3d3ea9db-b6b9-67ec-e69b-676baeae7dde@citrix.com>
In-Reply-To: <3d3ea9db-b6b9-67ec-e69b-676baeae7dde@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0501CA0043.eurprd05.prod.outlook.com
 (2603:10a6:4:67::29) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 82b548cc-874e-41e6-035c-08d6fef3e67f
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3362; 
x-ms-traffictypediagnostic: BY5PR18MB3362:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BY5PR18MB33629851749B6D2AFB82BA1FB3F80@BY5PR18MB3362.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 008663486A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(979002)(4636009)(346002)(376002)(366004)(136003)(39860400002)(396003)(189003)(199004)(53936002)(6506007)(54906003)(6512007)(446003)(81166006)(186003)(102836004)(81156014)(80792005)(26005)(53546011)(386003)(4326008)(6436002)(2906002)(86362001)(11346002)(71200400001)(8936002)(76176011)(71190400001)(110136005)(6116002)(229853002)(14444005)(3846002)(256004)(68736007)(316002)(14454004)(66556008)(966005)(6246003)(6486002)(66476007)(7736002)(73956011)(31686004)(6306002)(305945005)(476003)(64756008)(5660300002)(8676002)(2616005)(486006)(36756003)(25786009)(66066001)(66946007)(99286004)(52116002)(478600001)(66446008)(31696002)(72206003)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3362;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: TVE0MmKPwOLlg6JyKOyQbAO4VivWuGR0TN7A4YhVp4VrIXlJTk7j8aWhr+1hwux4K/jYDSXfIh1bwFogNvwE00RGGH/DczqmsSypvHOJfb/0SrF+xMPdXDQsK82GEJBAroyV7bNVsc057ZDy83whqIqX6UZ3hAtFBubmvv8MIre83lsB+qnIF5L/go9YLqff24Cw08LhLFafyRcuWYaXz1QP6uY7dbfrNotdQN9/vJwQ6LeIMG/IALf1++3mZG66LHhqUiDuFski6Gw4EajMSzwwhTzzc4NyiqMVINuHvjCKcxhGKzgWmFlKqOl+Cu+c8hdpUX0or4s2VkZAC93TGu0TEmy9dV/S20OFmYgrVGEMxpMgo1jQORGOAOeKFj3vQeYHCafAO7cS8MXI4H38/wUbeHcf141aoPpvoMw+T5o=
Content-ID: <58B353AFCBD6A14780C95A5D2F6ADDAB@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 82b548cc-874e-41e6-035c-08d6fef3e67f
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2019 13:48:01.9124 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3362
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v2 02/10] AMD/IOMMU: use bit field for
 extended feature register
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
Cc: Brian Woods <brian.woods@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMDcuMjAxOSAxNDowOSwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMjcvMDYvMjAx
OSAxNjoxOSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiAgICAgICBwcmludGsoIkFNRC1WaTogSU9N
TVUgRXh0ZW5kZWQgRmVhdHVyZXM6XG4iKTsNCj4+ICAgDQo+PiAtICAgIHdoaWxlICggZmVhdHVy
ZV9zdHJbaV0gKQ0KPj4gKyNkZWZpbmUgTUFTSyhmbGQpICgodW5pb24gYW1kX2lvbW11X2V4dF9m
ZWF0dXJlcyl7IC5mbGRzLmZsZCA9IH4wIH0pLnJhdw0KPj4gKyNkZWZpbmUgRkVBVChmbGQsIHN0
cikgZG8geyBcDQo+PiArICAgIGlmICggTUFTSyhmbGQpICYgKE1BU0soZmxkKSAtIDEpICkgXA0K
Pj4gKyAgICAgICAgcHJpbnRrKCAiLSAiIHN0ciAiOiAlI3hcbiIsIGlvbW11LT5mZWF0dXJlcy5m
bGRzLmZsZCk7IFwNCj4+ICsgICAgZWxzZSBpZiAoIGlvbW11LT5mZWF0dXJlcy5yYXcgJiBNQVNL
KGZsZCkgKSBcDQo+PiArICAgICAgICBwcmludGsoICItICIgc3RyICJcbiIpOyBcDQo+PiArfSB3
aGlsZSAoIGZhbHNlICkNCj4gDQo+IFNhZGx5LCBDbGFuZyBkaXNsaWtlcyB0aGlzIGNvbnN0cnVj
dC4NCj4gDQo+IGh0dHBzOi8vZ2l0bGFiLmNvbS94ZW4tcHJvamVjdC9wZW9wbGUvYW5keWhocC94
ZW4vLS9qb2JzLzI0Mzc5NTA5NQ0KPiAoQ2xpY2sgb24gdGhlICJDb21wbGV0ZSBSYXciIGJ1dHRv
bikNCj4gDQo+IGlvbW11X2RldGVjdC5jOjkwOjU6IGVycm9yOiBpbXBsaWNpdCB0cnVuY2F0aW9u
IGZyb20gJ2ludCcgdG8gYml0ZmllbGQgY2hhbmdlcyB2YWx1ZSBmcm9tIC0xIHRvIDEgWy1XZXJy
b3IsLVdiaXRmaWVsZC1jb25zdGFudC1jb252ZXJzaW9uXQ0KPiAgICAgIEZFQVQocHJlZl9zdXAs
ICAgICAgICAgICAiUHJlZmV0Y2ggUGFnZXMgQ29tbWFuZCIpOw0KPiAgICAgIF5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+DQo+IGlvbW11X2RldGVjdC5j
Ojg0OjEwOiBub3RlOiBleHBhbmRlZCBmcm9tIG1hY3JvICdGRUFUJw0KPiAgICAgIGlmICggTUFT
SyhmbGQpICYgKE1BU0soZmxkKSAtIDEpICkgXA0KPiAgICAgICAgICAgXn5+fn5+fn5+DQo+IGlv
bW11X2RldGVjdC5jOjgyOjY0OiBub3RlOiBleHBhbmRlZCBmcm9tIG1hY3JvICdNQVNLJw0KPiAj
ZGVmaW5lIE1BU0soZmxkKSAoKHVuaW9uIGFtZF9pb21tdV9leHRfZmVhdHVyZXMpeyAuZmxkcy5m
bGQgPSB+MCB9KS5yYXcNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIF5+DQo+IA0KPiANCj4gd2hpY2ggaXMgYSBzaGFtZS7C
oCBGdXJ0aGVybW9yZSwgc3dpdGNoaW5nIHRvIH4oMHUpIHdvbid0IHdvcmsgZWl0aGVyLA0KPiBi
ZWNhdXNlIHRoYXQgd2lsbCB0aGVuIGdldCBhIHRydW5jYXRpb24gd2FybmluZy4NCj4gDQo+IENs
ZXZlciBhcyB0aGlzIHRyaWNrIGlzLCB0aGlzIGlzIHdyaXRlLW9uY2UgY29kZSBhbmQgaXNuJ3Qg
Z29pbmcgdG8NCj4gY2hhbmdlIG1vdmluZyBmb3J3YXJkLsKgIEknZCBkbyBhd2F5IHdpdGggdGhl
IGNvbXBpbGUtdGltZSBjbGV2ZXJuZXNzIGFuZA0KPiBoYXZlIHNpbXBsZSBGRUFUKCkgYW5kIE1B
U0soKSBtYWNyb3MsIGFuZCB1c2UgdGhlIGNvcnJlY3Qgb25lIGJlbG93Lg0KDQpJIGRvbid0IGlt
bWVkaWF0ZWx5IHNlZSB3aGF0IHlvdSB3b3VsZCBtZWFuIGJ5ICJzaW1wbGUgRkVBVCgpIGFuZCBN
QVNLKCkNCm1hY3JvcyIsIGJ1dCBwZXJoYXBzIEknbGwgZmlndXJlIHdoZW4gSSBhY3R1YWxseSBt
YWtlIHRoaXMgY2hhbmdlLiBXaGF0DQpJJ20gY29uY2VybmVkIGFib3V0IHdoZW4gY2hhbmdpbmcg
YXdheSBmcm9tIHRoZSBjaG9zZW4gbW9kZWwgaXMgdGhhdA0KdGhlcmUnbGwgbGlrZWx5IGJlIGEg
bmVlZCB0byBleHBsaWNpdGx5IGtub3cgd2hldGhlciBhIGZpZWxkIGlzIGp1c3QgYQ0KYm9vbGVh
biBvciBob2xkcyBhbiBhY3R1YWwgKHdpZGVyKSB2YWx1ZS4gSS5lLiB0aGF0J3Mgd2hhdCBpcyBu
b3QgIndyaXRlDQpvbmNlIiBhYm91dCB0aGlzIGNvZGUsIHNpbmNlIGZ1dHVyZSBhZGRpdGlvbnMg
ZXF1YWxseSBiZWNvbWUgbW9yZQ0KZnJhZ2lsZS4NCg0KSSB3YXMgYWN0dWFsbHkgaG9waW5nIHRv
IHVzZSB0aGlzICJtYXNrIGZyb20gYml0ZmllbGQiIGFwcHJvYWNoDQplbHNld2hlcmUsIHNvIHRo
aXMgaXMgeWV0IGFub3RoZXIgY2FzZSB3aGVyZSBJIHdvbmRlciB3aGV0aGVyIHVzIHdhbnRpbmcN
CnRvIGJlIGFibGUgdG8gYnVpbGQgd2l0aCBjbGFuZyBpcyBhY3R1YWxseSBiZWNvbWluZyBhbiBp
bmNyZWFzaW5nDQpoaW5kcmFuY2UuDQoNCkknbGwgc2VlIGlmIEkgY2FuIGNvbWUgdXAgd2l0aCBz
b21ldGhpbmcgZWxzZSwgc3RpbGwgbWF0Y2hpbmcgdGhlDQpvcmlnaW5hbCBpZGVhLiBDbGVhcmx5
IGNsYW5nIGNhbid0IGJlIGNvbnNpc3RlbnQgd2l0aCBpdHMgdmFsdWUNCnRydW5jYXRpb24gd2Fy
bmluZ3MsIG9yIGVsc2UgWGVuIHdvdWxkbid0IGJ1aWxkIHdpdGggaXQgYXQgYWxsLg0KDQo+PiAt
LS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9zdm0vYW1kLWlvbW11LWRlZnMuaA0KPj4gKysr
IGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vc3ZtL2FtZC1pb21tdS1kZWZzLmgNCj4+IEBAIC0z
NDYsMjYgKzM0Niw1NyBAQCBzdHJ1Y3QgYW1kX2lvbW11X2R0ZSB7DQo+PiArdW5pb24gYW1kX2lv
bW11X2V4dF9mZWF0dXJlcyB7DQo+PiArICAgIHVpbnQ2NF90IHJhdzsNCj4+ICsgICAgc3RydWN0
IHsNCj4+ICsgICAgICAgIHVuc2lnbmVkIGludCBwcmVmX3N1cDoxOw0KPj4gKyAgICAgICAgdW5z
aWduZWQgaW50IHBwcl9zdXA6MTsNCj4+ICsgICAgICAgIHVuc2lnbmVkIGludCB4dF9zdXA6MTsN
Cj4+ICsgICAgICAgIHVuc2lnbmVkIGludCBueF9zdXA6MTsNCj4+ICsgICAgICAgIHVuc2lnbmVk
IGludCBndF9zdXA6MTsNCj4+ICsgICAgICAgIHVuc2lnbmVkIGludCBnYXBwaV9zdXA6MTsNCj4+
ICsgICAgICAgIHVuc2lnbmVkIGludCBpYV9zdXA6MTsNCj4+ICsgICAgICAgIHVuc2lnbmVkIGlu
dCBnYV9zdXA6MTsNCj4+ICsgICAgICAgIHVuc2lnbmVkIGludCBoZV9zdXA6MTsNCj4+ICsgICAg
ICAgIHVuc2lnbmVkIGludCBwY19zdXA6MTsNCj4+ICsgICAgICAgIHVuc2lnbmVkIGludCBoYXRz
OjI7DQo+PiArICAgICAgICB1bnNpZ25lZCBpbnQgZ2F0czoyOw0KPj4gKyAgICAgICAgdW5zaWdu
ZWQgaW50IGdseF9zdXA6MjsNCj4+ICsgICAgICAgIHVuc2lnbmVkIGludCBzbWlmX3N1cDoyOw0K
Pj4gKyAgICAgICAgdW5zaWduZWQgaW50IHNtaWZfcmM6MzsNCj4+ICsgICAgICAgIHVuc2lnbmVk
IGludCBnYW1fc3VwOjM7DQo+PiArICAgICAgICB1bnNpZ25lZCBpbnQgZHVhbF9wcHJfbG9nX3N1
cDoyOw0KPj4gKyAgICAgICAgdW5zaWduZWQgaW50IDoyOw0KPj4gKyAgICAgICAgdW5zaWduZWQg
aW50IGR1YWxfZXZlbnRfbG9nX3N1cDoyOw0KPj4gKyAgICAgICAgdW5zaWduZWQgaW50IDoxOw0K
Pj4gKyAgICAgICAgdW5zaWduZWQgaW50IHNhdHNfc3VwOjE7DQo+PiArICAgICAgICB1bnNpZ25l
ZCBpbnQgcGFzX21heDo1Ow0KPj4gKyAgICAgICAgdW5zaWduZWQgaW50IHVzX3N1cDoxOw0KPj4g
KyAgICAgICAgdW5zaWduZWQgaW50IGRldl90Ymxfc2VnX3N1cDoyOw0KPj4gKyAgICAgICAgdW5z
aWduZWQgaW50IHBwcl9lYXJseV9vZl9zdXA6MTsNCj4+ICsgICAgICAgIHVuc2lnbmVkIGludCBw
cHJfYXV0b19yc3Bfc3VwOjE7DQo+PiArICAgICAgICB1bnNpZ25lZCBpbnQgbWFyY19zdXA6MjsN
Cj4+ICsgICAgICAgIHVuc2lnbmVkIGludCBibGtfc3RvcF9tcmtfc3VwOjE7DQo+PiArICAgICAg
ICB1bnNpZ25lZCBpbnQgcGVyZl9vcHRfc3VwOjE7DQo+PiArICAgICAgICB1bnNpZ25lZCBpbnQg
bXNpX2NhcF9tbWlvX3N1cDoxOw0KPj4gKyAgICAgICAgdW5zaWduZWQgaW50IDoxOw0KPj4gKyAg
ICAgICAgdW5zaWduZWQgaW50IGdpb19zdXA6MTsNCj4+ICsgICAgICAgIHVuc2lnbmVkIGludCBo
YV9zdXA6MTsNCj4+ICsgICAgICAgIHVuc2lnbmVkIGludCBlcGhfc3VwOjE7DQo+PiArICAgICAg
ICB1bnNpZ25lZCBpbnQgYXR0cl9md19zdXA6MTsNCj4+ICsgICAgICAgIHVuc2lnbmVkIGludCBo
ZF9zdXA6MTsNCj4+ICsgICAgICAgIHVuc2lnbmVkIGludCA6MTsNCj4+ICsgICAgICAgIHVuc2ln
bmVkIGludCBpbnZfaW90bGJfdHlwZV9zdXA6MTsNCj4+ICsgICAgICAgIHVuc2lnbmVkIGludCB2
aW9tbXVfc3VwOjE7DQo+PiArICAgICAgICB1bnNpZ25lZCBpbnQgdm1fZ3VhcmRfaW9fc3VwOjE7
DQo+PiArICAgICAgICB1bnNpZ25lZCBpbnQgdm1fdGFibGVfc2l6ZTo0Ow0KPj4gKyAgICAgICAg
dW5zaWduZWQgaW50IGdhX3VwZGF0ZV9kaXNfc3VwOjE7DQo+PiArICAgICAgICB1bnNpZ25lZCBp
bnQgOjI7DQo+PiArICAgIH0gZmxkczsNCj4gDQo+IFdoeSB0aGUgLmZsZHMgbmFtZT/CoCBXaGF0
IGlzIHdyb25nIHdpdGggdGhpcyBiZWNvbWluZyBhbm9ueW1vdXM/DQoNClRoZSBpbml0aWFsaXpl
ciBpbiBndWVzdF9pb21tdV9yZWdfaW5pdCgpICh3aXRoIG9sZCBnY2MpLg0KDQpKYW4NCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
