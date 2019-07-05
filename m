Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E8E606C9
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jul 2019 15:46:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hjOVA-0006FI-EM; Fri, 05 Jul 2019 13:43:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hVvi=VC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hjOV9-0006FD-KS
 for xen-devel@lists.xenproject.org; Fri, 05 Jul 2019 13:43:47 +0000
X-Inumbo-ID: d7caef7c-9f2a-11e9-895c-efb0a643b063
Received: from m9a0002g.houston.softwaregrp.com (unknown [15.124.64.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d7caef7c-9f2a-11e9-895c-efb0a643b063;
 Fri, 05 Jul 2019 13:43:43 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP; 
 Fri,  5 Jul 2019 13:43:17 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 5 Jul 2019 13:41:11 +0000
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (15.124.8.12) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 5 Jul 2019 13:41:11 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3202.namprd18.prod.outlook.com (10.255.138.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Fri, 5 Jul 2019 13:41:09 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2052.019; Fri, 5 Jul 2019
 13:41:09 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Paul Durrant <paul.durrant@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2 2/2] xmalloc: add a Kconfig option to poison free pool
 memory
Thread-Index: AQHVMxByZ9fe0Q7jwkWne73BsMgEVaa8CHSA
Date: Fri, 5 Jul 2019 13:41:09 +0000
Message-ID: <ce6dbd96-3a20-36fd-dba0-7f9bd7b3f51d@suse.com>
References: <20190705090249.1935-1-paul.durrant@citrix.com>
 <20190705090249.1935-3-paul.durrant@citrix.com>
In-Reply-To: <20190705090249.1935-3-paul.durrant@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0501CA0047.eurprd05.prod.outlook.com
 (2603:10a6:4:67::33) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 33e5c788-efc4-4139-1967-08d7014e6faf
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3202; 
x-ms-traffictypediagnostic: BY5PR18MB3202:
x-microsoft-antispam-prvs: <BY5PR18MB3202B3D03310312D780EBF18B3F50@BY5PR18MB3202.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 008960E8EC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(346002)(396003)(366004)(136003)(376002)(199004)(189003)(102836004)(4326008)(36756003)(2906002)(66066001)(6486002)(476003)(2616005)(229853002)(52116002)(478600001)(7736002)(64756008)(66446008)(72206003)(73956011)(186003)(256004)(7416002)(110136005)(66556008)(54906003)(26005)(316002)(14444005)(8936002)(66476007)(66946007)(305945005)(11346002)(99286004)(6512007)(68736007)(6436002)(3846002)(6506007)(6116002)(53546011)(386003)(80792005)(31696002)(86362001)(81166006)(8676002)(81156014)(6246003)(76176011)(486006)(71200400001)(71190400001)(2501003)(25786009)(31686004)(446003)(53936002)(5660300002)(14454004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3202;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: eg2KjAOPS5eeu73di6SWwoO5r5oD7OjzqiMUvHVzorkjTbRVgSeoxeSW+CdyZRUGt/NEQy7h1mwjxhwSvszhhq/+8P/Q9X7vLnG6adCmvjDPP57qTcHWP37GEikndtKJ8AOM6s9xxkL8nTpGCtuKz9bcP7CXjA33ABJ2MExtPeKpX6jcxhsRKUTCb9EZGL4zTA1k4AWgFeNFYU38LCynlo+6yI+wslxVF6r0TSvQji0ca55To3sjbG1m+QGeNu5EBYj1ebyW2DzI8GBGc79R2qx3lNEZkEPrTYN3z+ggPNXEy1hBVYlxE3ovcEl4laIb+wT2i0rP10MpGIzFs0lgTJkygkWW264tluREovf9KcvDShIrsqMhQmuI9PLHg62zxSgY7xDCJQ/9QryQAECthdi/jzTrVkd3oo2IlZ5jonw=
Content-ID: <22875F660009EB4A841C217592372DB7@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 33e5c788-efc4-4139-1967-08d7014e6faf
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2019 13:41:09.0636 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3202
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v2 2/2] xmalloc: add a Kconfig option to
 poison free pool memory
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
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, TimDeegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDcuMjAxOSAxMTowMiwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiAtLS0gYS94ZW4vS2Nv
bmZpZy5kZWJ1Zw0KPiArKysgYi94ZW4vS2NvbmZpZy5kZWJ1Zw0KPiBAQCAtMTA1LDYgKzEwNSwx
MyBAQCBjb25maWcgREVCVUdfVFJBQ0UNCj4gICAJICBlaXRoZXIgZGlyZWN0bHkgdG8gdGhlIGNv
bnNvbGUgb3IgYXJlIHByaW50ZWQgdG8gY29uc29sZSBpbiBjYXNlIG9mDQo+ICAgCSAgYSBzeXN0
ZW0gY3Jhc2guDQo+ICAgDQo+ICtjb25maWcgWE1FTV9QT09MX1BPSVNPTg0KPiArICAgICAgIGJv
b2wgIlBvaXNvbiBmcmVlIHhlbnBvb2wgYmxvY2tzIg0KPiArICAgICAgIGRlZmF1bHQgREVCVUcN
Cj4gKyAgICAgICAtLS1oZWxwLS0tDQo+ICsJIFBvaXNvbiBmcmVlIGJsb2NrcyB3aXRoIDB4QUEg
Ynl0ZXMgYW5kIHZlcmlmeSB0aGVtIHdoZW4gYSBibG9jayBpcw0KPiArCSBhbGxvY2F0ZWQgaW4g
b3JkZXIgdG8gc3BvdCB1c2UtYWZ0ZXItZnJlZSBpc3N1ZXMuDQoNClRoZXJlIGxvb2tzIHRvIGJl
IGEgc3BhY2VzIHZzIHRhYnMgcHJvYmxlbSBoZXJlOiBPbmx5IHRoZSBoZWxwDQp0ZXh0IGhhcyB0
YWJzIGZvciBpbml0aWFsIGluZGVudGF0aW9uLg0KDQo+IC0tLSBhL3hlbi9jb21tb24veG1hbGxv
Y190bHNmLmMNCj4gKysrIGIveGVuL2NvbW1vbi94bWFsbG9jX3Rsc2YuYw0KPiBAQCAtMjM4LDYg
KzIzOCwxMSBAQCBzdGF0aWMgaW5saW5lIHZvaWQgRVhUUkFDVF9CTE9DSyhzdHJ1Y3QgYmhkciAq
Yiwgc3RydWN0IHhtZW1fcG9vbCAqcCwgaW50IGZsLA0KPiAgICAgICAgICAgfQ0KPiAgICAgICB9
DQo+ICAgICAgIGItPnB0ci5mcmVlX3B0ciA9IChzdHJ1Y3QgZnJlZV9wdHIpIHtOVUxMLCBOVUxM
fTsNCj4gKyNpZmRlZiBDT05GSUdfWE1FTV9QT09MX1BPSVNPTg0KPiArICAgIGlmICggKGItPnNp
emUgJiBCTE9DS19TSVpFX01BU0spID4gTUlOX0JMT0NLX1NJWkUgKQ0KPiArICAgICAgICBBU1NF
UlQoIW1lbWNocl9pbnYoYi0+cHRyLmJ1ZmZlciArIE1JTl9CTE9DS19TSVpFLCAweEFBLA0KPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgKGItPnNpemUgJiBCTE9DS19TSVpFX01BU0spIC0g
TUlOX0JMT0NLX1NJWkUpKTsNCj4gKyNlbmRpZiAvKiBDT05GSUdfWE1FTV9QT09MX1BPSVNPTiAq
Lw0KPiAgIH0NCj4gICANCj4gICAvKioNCj4gQEAgLTI0NSw2ICsyNTAsMTEgQEAgc3RhdGljIGlu
bGluZSB2b2lkIEVYVFJBQ1RfQkxPQ0soc3RydWN0IGJoZHIgKmIsIHN0cnVjdCB4bWVtX3Bvb2wg
KnAsIGludCBmbCwNCj4gICAgKi8NCj4gICBzdGF0aWMgaW5saW5lIHZvaWQgSU5TRVJUX0JMT0NL
KHN0cnVjdCBiaGRyICpiLCBzdHJ1Y3QgeG1lbV9wb29sICpwLCBpbnQgZmwsIGludCBzbCkNCj4g
ICB7DQo+ICsjaWZkZWYgQ09ORklHX1hNRU1fUE9PTF9QT0lTT04NCj4gKyAgICBpZiAoIChiLT5z
aXplICYgQkxPQ0tfU0laRV9NQVNLKSA+IE1JTl9CTE9DS19TSVpFICkNCj4gKyAgICAgICAgbWVt
c2V0KGItPnB0ci5idWZmZXIgKyBNSU5fQkxPQ0tfU0laRSwgMHhBQSwNCj4gKyAgICAgICAgICAg
ICAgIChiLT5zaXplICYgQkxPQ0tfU0laRV9NQVNLKSAtIE1JTl9CTE9DS19TSVpFKTsNCj4gKyNl
bmRpZiAvKiBDT05GSUdfWE1FTV9QT09MX1BPSVNPTiAqLw0KDQpDYW4geW91IHRpZSB0b2dldGhl
ciB0aGUgdHdvIGluc3RhbmNlcyBvZiAweEFBIHZpYSBhICNkZWZpbmUsDQpwbGVhc2U/DQoNCkl0
IHdvdWxkIGFsc28gYmUgbmljZSBpZiBib3RoICNpZmRlZiBibG9ja3Mgd2VyZSBzZXBhcmF0ZWQg
ZnJvbQ0KdGhlaXIgbmVpZ2hib3JpbmcgY29kZSBieSBhIGJsYW5rIGxpbmUsIGRlc3BpdGUgdGhl
IGZpbGUgdXNpbmcNCmJsYW5rIGxpbmVzIHJhdGhlciBzcGFyaW5nbHkgc28gZmFyLg0KDQpXaXRo
IHRoZSBhZGp1c3RtZW50cyBoZXJlIEkgdGhpbmsgaXQgd291bGQgYmUgYmVzdCBpZiB5b3UgY291
bGQNCmFsc28gcmVzZW5kIHBhdGNoIDEgd2l0aCB0aGUgc2xpZ2h0bHkgYWRqdXN0ZWQgY29tbWl0
IG1lc3NhZ2UuDQoNCkphbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
