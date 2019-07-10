Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5EC64F21
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2019 01:14:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hlLjd-0004w3-KU; Wed, 10 Jul 2019 23:10:49 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iTs9=VH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hlLjb-0004vy-8O
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2019 23:10:47 +0000
X-Inumbo-ID: ee62550d-a367-11e9-8980-bc764e045a96
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ee62550d-a367-11e9-8980-bc764e045a96;
 Wed, 10 Jul 2019 23:10:45 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 10 Jul 2019 23:10:37 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 10 Jul 2019 22:53:07 +0000
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (15.124.8.12) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 10 Jul 2019 22:53:07 +0000
Received: from MN2SPR01MB0026.namprd18.prod.outlook.com (20.178.243.210) by
 MN2PR18MB2544.namprd18.prod.outlook.com (20.179.84.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Wed, 10 Jul 2019 22:53:05 +0000
Received: from MN2SPR01MB0026.namprd18.prod.outlook.com
 ([fe80::855e:82f5:e3bd:1cb0]) by MN2SPR01MB0026.namprd18.prod.outlook.com
 ([fe80::855e:82f5:e3bd:1cb0%6]) with mapi id 15.20.2073.008; Wed, 10 Jul 2019
 22:53:05 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Paul Durrant <paul.durrant@citrix.com>
Thread-Topic: [Xen-devel] [PATCH] xen/mm.h: add helper function to
 test-and-clear _PGC_allocated
Thread-Index: AQHVNz5AbDzZgpaVWECo7hdqnCPqGqbEdewA
Date: Wed, 10 Jul 2019 22:53:05 +0000
Message-ID: <9bead6ec-9fad-2ba9-3948-de217de6d856@suse.com>
References: <20190710161733.39119-1-paul.durrant@citrix.com>
In-Reply-To: <20190710161733.39119-1-paul.durrant@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BL0PR02CA0112.namprd02.prod.outlook.com
 (2603:10b6:208:35::17) To MN2SPR01MB0026.namprd18.prod.outlook.com
 (2603:10b6:208:cf::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [216.80.71.101]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 398df9b4-21d1-4707-8f7a-08d705895eb1
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR18MB2544; 
x-ms-traffictypediagnostic: MN2PR18MB2544:
x-microsoft-antispam-prvs: <MN2PR18MB2544BDA8308046009648383FB3F00@MN2PR18MB2544.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0094E3478A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(136003)(396003)(346002)(366004)(376002)(199004)(189003)(80792005)(6246003)(54906003)(53936002)(6512007)(25786009)(316002)(6506007)(386003)(53546011)(76176011)(4326008)(6916009)(6486002)(3846002)(102836004)(99286004)(7416002)(6116002)(52116002)(68736007)(31686004)(256004)(81166006)(81156014)(14444005)(2906002)(26005)(66066001)(186003)(31696002)(229853002)(71200400001)(8676002)(86362001)(446003)(71190400001)(486006)(66946007)(11346002)(66476007)(2616005)(64756008)(66556008)(476003)(66446008)(7736002)(305945005)(5660300002)(36756003)(478600001)(14454004)(6436002)(8936002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR18MB2544;
 H:MN2SPR01MB0026.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: yuZoiJoAQSandmr35jdILpO06EQ/2F8pHV5z8kwY+7xJ2q4rjzXU8VFd6CftTS16RxMZ6VIuTn1/RK049QDf6ZWBC6vq02JDlANhTCmfKmRgDVpoBX6/mfoDBWxBBGD/HEpU9H5Z4qTSev9lIHjzICRqwKtVsWBpQb4l+9l3dluG/VBRzqJ3afKtRBbv2cOWXpwZVHk5ocH/7CF040iLxtWyijMZ4Vhtwa3psKnegSRpCQ/Z7f84aCHnpOKwzg/zChWi/Z9S0UB6+g2G1IenOaonxs0MkvT7Ba4kN4cED9CPN21Hoy8GLqe4/I6ZXZ1vKhQgCtC3pfpPmFtqsqjjs2tZxyjeC2zZiEoNITwy9U01bYO0UgoQpgtDa1Dc2swJmlf87RXRf6HO+p7np2roivBNc+AvNE0wX59wtqKaNjA=
Content-ID: <4FD3C63FA8F1DB43BA2561D7A1CEE9B8@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 398df9b4-21d1-4707-8f7a-08d705895eb1
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2019 22:53:05.5736 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB2544
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] xen/mm.h: add helper function to
 test-and-clear _PGC_allocated
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien
 Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMDcuMjAxOSAxODoxNywgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiBAQCAtNDE4LDEzICs0
MTcsNyBAQCBzdGF0aWMgdm9pZCBodm1fZnJlZV9pb3JlcV9tZm4oc3RydWN0IGh2bV9pb3JlcV9z
ZXJ2ZXIgKnMsIGJvb2wgYnVmKQ0KPiAgICAgICB1bm1hcF9kb21haW5fcGFnZV9nbG9iYWwoaW9y
cC0+dmEpOw0KPiAgICAgICBpb3JwLT52YSA9IE5VTEw7DQo+ICAgDQo+IC0gICAgLyoNCj4gLSAg
ICAgKiBDaGVjayB3aGV0aGVyIHdlIG5lZWQgdG8gY2xlYXIgdGhlIGFsbG9jYXRpb24gcmVmZXJl
bmNlIGJlZm9yZQ0KPiAtICAgICAqIGRyb3BwaW5nIHRoZSBleHBsaWNpdCByZWZlcmVuY2VzIHRh
a2VuIGJ5IGdldF9wYWdlX2FuZF90eXBlKCkuDQo+IC0gICAgICovDQo+IC0gICAgaWYgKCB0ZXN0
X2FuZF9jbGVhcl9iaXQoX1BHQ19hbGxvY2F0ZWQsICZwYWdlLT5jb3VudF9pbmZvKSApDQo+IC0g
ICAgICAgIHB1dF9wYWdlKHBhZ2UpOw0KPiAtDQo+ICsgICAgY2xlYXJfYXNzaWdubWVudF9yZWZl
cmVuY2UocGFnZSk7DQo+ICAgICAgIHB1dF9wYWdlX2FuZF90eXBlKHBhZ2UpOw0KPiAgIH0NCg0K
SXMgdGhlcmUgYSBzcGVjaWZpYyByZWFzb24geW91IGRyb3AgdGhlIGNvbW1lbnQ/IEl0IGRvZXNu
J3QgYmVjb21lDQpsZXNzIHJlbGV2YW50IHRoYW4gd2hlbiBpdCB3YXMgYWRkZWQsIGRvZXMgaXQ/
DQoNCj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL21tLmgNCj4gKysrIGIveGVuL2luY2x1ZGUveGVu
L21tLmgNCj4gQEAgLTY1OCw0ICs2NTgsMTUgQEAgc3RhdGljIGlubGluZSB2b2lkIHNoYXJlX3hl
bl9wYWdlX3dpdGhfcHJpdmlsZWdlZF9ndWVzdHMoDQo+ICAgICAgIHNoYXJlX3hlbl9wYWdlX3dp
dGhfZ3Vlc3QocGFnZSwgZG9tX3hlbiwgZmxhZ3MpOw0KPiAgIH0NCj4gICANCj4gK3N0YXRpYyBp
bmxpbmUgdm9pZCBjbGVhcl9hc3NpZ25tZW50X3JlZmVyZW5jZShzdHJ1Y3QgcGFnZV9pbmZvICpw
YWdlKQ0KDQpJIHRoaW5rIHRoZSBmdW5jdGlvbiBzaG91bGQgaGF2ZSAncGFnZScgaW4gaXQncyBu
YW1lLiBQZXJoYXBzDQpwYWdlX2RlYXNzaWduKCkgLyBwYWdlX2RlYWxsb2MoKSBhcmUgYWxzbyBt
aXNsZWFkaW5nLCBidXQgaG93DQphYm91dCBwYWdlX3B1dF9hbGxvYygpIG9yIHBhZ2VfcHV0X2Fs
bG9jX3JlZigpPw0KDQo+ICt7DQo+ICsgICAgLyoNCj4gKyAgICAgKiBJdCBpcyB1bnNhZmUgdG8g
Y2xlYXIgX1BHQ19hbGxvY2F0ZWQgd2l0aG91dCBob2xkaW5nIGFuIGFkZGl0aW9uYWwNCj4gKyAg
ICAgKiByZWZlcmVuY2UuDQo+ICsgICAgICovDQo+ICsgICAgQVNTRVJUKChwYWdlLT5jb3VudF9p
bmZvICYgUEdDX2NvdW50X21hc2spID4gMSk7DQoNCldoaWxlIHRoaXMgaXNuJ3QgcmVhbGx5IGlu
IGxpbmUgd2l0aCBvdXIgZ29hbCBvZiB3YW50aW5nIHRvIGxpbWl0DQpkYW1hZ2UgYWxzbyBpbiBy
ZWxlYXNlIGJ1aWxkcywgSSBhZ3JlZSB0aGF0IHRoZXJlJ3Mgbm8gcmVhbGx5IGdvb2QNCmFsdGVy
bmF0aXZlIGhlcmUuIENyYXNoaW5nIHRoZSBvd25lciBvZiB0aGUgcGFnZSB3b3VsZG4ndCBoZWxw
DQptdWNoLCBhbmQgYmFpbGluZyBmcm9tIHRoZSBmdW5jdGlvbiB3b3VsZG4ndCBuZWNlc3Nhcmls
eSBiZSBiZXR0ZXINCmVpdGhlci4gSGVuY2UgSSB0aGluayB0aGlzIHdvdWxkIGJldHRlciBiZSBC
VUdfT04oKS4NCg0KPiArICAgIGlmICggdGVzdF9hbmRfY2xlYXJfYml0KF9QR0NfYWxsb2NhdGVk
LCAmcGFnZS0+Y291bnRfaW5mbykgKQ0KPiArICAgICAgICBwdXRfcGFnZShwYWdlKTsNCj4gK30N
Cg0KT24gdGhlIHdob2xlIEkgaGF2ZSB0byBhZG1pdCBJJ20gbm90IGVudGlyZWx5IGNvbnZpbmNl
ZCB0aGUgIm9wZW4tDQpjb2RpbmciIGFzIHlvdSBjYWxsIGl0ICh0byBtZSBpdCdzIG5vdCByZWFs
bHkgb3Blbi1jb2RpbmcgYXMgbG9uZyBhcw0KdGhlcmUgaXMgbm8gaGVscGVyKSBpcyBzdWNoIGEg
YmFkIHRoaW5nIGhlcmU6IFdpdGhvdXQgdGhlIGhlbHBlciBpdA0KaXMgc2xpZ2h0bHkgbW9yZSBv
YnZpb3VzIGF0IHRoZSB1c2Ugc2l0ZXMgd2hhdCdzIGFjdHVhbGx5IGdvaW5nIG9uLg0KQnV0IG1h
eWJlIHRoYXQncyBpbmRlZWQganVzdCBtZS4NCg0KSmFuDQoNCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
