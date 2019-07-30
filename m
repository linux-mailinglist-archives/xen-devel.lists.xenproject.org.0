Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7788C7A769
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 14:02:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsQmz-00032l-ND; Tue, 30 Jul 2019 11:59:33 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zL4X=V3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hsQmz-00032g-1N
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 11:59:33 +0000
X-Inumbo-ID: 7d5286d6-b2c1-11e9-8980-bc764e045a96
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7d5286d6-b2c1-11e9-8980-bc764e045a96;
 Tue, 30 Jul 2019 11:59:31 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 30 Jul 2019 11:59:29 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 30 Jul 2019 11:56:12 +0000
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (15.124.8.12) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 30 Jul 2019 11:56:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cO9dzp1a3HCdZ5QRn7tn/i3gaPz0MR6jLmYIDICPdpvfeeLygz9J2XjPEW31Pq0YOyR11zbq15jUKWroIw/kG7eUSraXHsWeX3BzPoCV6Io7cqcnN3ZnKrtloSMS+52XHVj7rc+N9QSEixzVq9+LmRIuL4GE3B/MWFgQf3aM7WK6pl0QwkQJYx49DwP05Y2mViRBLjRpvheSRMwwX14n440QcIQg2Q2zsQ9Vq+2huSBAhgfq+JFTXDW7i+b6Yotczmz5o8yKgQRvBcw4EEKNHZpomNvCOIm4aDcE1tDff7/28a+CNsIegIAx34NNPTcp2JH+lGR6/M3md0VxfPSakQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I3glbWt8c4OsMem/i2TSPdgIfCBibIKqbB7/0dL2fpo=;
 b=gwI9wKKkLJDG2aI8nnnuabtaILawOvEhHyzonQ65fKAL6UD4EWM07mc4QwtAUR6gBFywsP2tJ+oFIhBhmdoo7WY4i4KSNHh/gRPBEMpJ4FKvIOUWSRc6X+TOIFhMgdL4ICRKFDIBwZKQSvlxc34kLDORitZguZPb03Z0dXeHfjxQndPiskQcMRS6V6FqDIHaTMJ8UKNuWNGrHhgjeldxL2/glrFucRfc/y7X5avu5h2tCLuji4NKqcKlBHnqu+aJf8a3FVvbjOZB77brPZD9e7a8AYuPwaIa4f/nKA4vpiXY117AjH3af3YxTNwqXRVCcAxu2A4K1wkE7Mtxnj4GAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3428.namprd18.prod.outlook.com (10.255.139.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.13; Tue, 30 Jul 2019 11:56:10 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 11:56:10 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Paul Durrant <paul.durrant@citrix.com>
Thread-Topic: [PATCH v3 2/5] x86/hvm/domain: remove the 'hap_enabled' flag
Thread-Index: AQHVRrq+c2LMEf8iM0aU6M+2axgpnabjDhCA
Date: Tue, 30 Jul 2019 11:56:10 +0000
Message-ID: <0cfcbaa1-7e3b-a9e3-0da1-ee17e4e7f0a8@suse.com>
References: <20190730093904.1794-1-paul.durrant@citrix.com>
 <20190730093904.1794-3-paul.durrant@citrix.com>
In-Reply-To: <20190730093904.1794-3-paul.durrant@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0802CA0041.eurprd08.prod.outlook.com
 (2603:10a6:4:a3::27) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 70fcff76-73f2-49e4-7b19-08d714e4e968
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3428; 
x-ms-traffictypediagnostic: BY5PR18MB3428:
x-microsoft-antispam-prvs: <BY5PR18MB34284165214CC4F63DDB1088B3DC0@BY5PR18MB3428.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(346002)(376002)(39860400002)(396003)(136003)(189003)(199004)(256004)(26005)(31696002)(186003)(71200400001)(71190400001)(36756003)(54906003)(99286004)(3846002)(52116002)(6506007)(6116002)(386003)(76176011)(53546011)(305945005)(7736002)(7416002)(478600001)(14454004)(6916009)(80792005)(102836004)(6436002)(31686004)(229853002)(68736007)(8676002)(81156014)(81166006)(8936002)(4326008)(66066001)(316002)(6246003)(25786009)(486006)(2906002)(66946007)(64756008)(66476007)(66446008)(6512007)(5660300002)(66556008)(53936002)(2616005)(86362001)(446003)(476003)(11346002)(6486002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3428;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:3; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /TTEEFD0kSZmLdH47GM1Ck+IKNOYKLlKLLj2lIg5WH8V2KwvvzNHtXtchQSfcRCaUdlsfq0va6DJof3NGDG7tg+S/PRG+/hyf2K8g/FzWwH9txaye380WMAGHsprqdGJGxhTzRpMG8A/7SrryiBfuzGqOcMLJnxi9hzoeGp9tWIocytg85dcEE0IS3BarWDD6clH27phgKveBeHSp7zC75Y84w+ODXZtIrDBJOVudPXOXUris3lunKdRn0b9dRiBwH98z3FzQDyo0L1gura7V+6NNk48LK1xJ+Z1flKc/u8o4Qh+CaNohBFrM/nACa4+DDvRsE9tTaV3TvMNLORzvTuJcspqTVWQrVHDab+Xy2oJOch2xgEZPY8+nBRZIIWzh6zIeR6dgxxVX4NNEYmM8wdaGKEBoXpOvuXGknwN9UI=
Content-ID: <A4B4A7AF49D69B4AA2ED1570EFC0730E@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 70fcff76-73f2-49e4-7b19-08d714e4e968
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 11:56:10.0330 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3428
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v3 2/5] x86/hvm/domain: remove the
 'hap_enabled' flag
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
 Ian Jackson <ian.jackson@eu.citrix.com>, TimDeegan <tim@xen.org>, Julien
 Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDcuMjAxOSAxMTozOSwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiAtLS0gYS94ZW4vYXJj
aC94ODYvZG9tYWluLmMNCj4gKysrIGIveGVuL2FyY2gveDg2L2RvbWFpbi5jDQo+IEBAIC00NjAs
NiArNDYwLDEyIEBAIGludCBhcmNoX3Nhbml0aXNlX2RvbWFpbl9jb25maWcoc3RydWN0IHhlbl9k
b21jdGxfY3JlYXRlZG9tYWluICpjb25maWcpDQo+ICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsN
Cj4gICAgICAgfQ0KPiAgIA0KPiArICAgIGlmICggY29uZmlnLT5mbGFncyAmIFhFTl9ET01DVExf
Q0RGX2hhcCAmJiAhaHZtX2hhcF9zdXBwb3J0ZWQoKSApDQoNClRoZSAmIHdhbnRzIHRvIGJlIHBh
cmVudGhlc2l6ZWQgaGVyZS4NCg0KPiAtLS0gYS94ZW4vY29tbW9uL2RvbWFpbi5jDQo+ICsrKyBi
L3hlbi9jb21tb24vZG9tYWluLmMNCj4gQEAgLTMxMyw2ICszMTMsMTMgQEAgc3RhdGljIGludCBz
YW5pdGlzZV9kb21haW5fY29uZmlnKHN0cnVjdCB4ZW5fZG9tY3RsX2NyZWF0ZWRvbWFpbiAqY29u
ZmlnKQ0KPiAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ICAgICAgIH0NCj4gICANCj4gKyAg
ICBpZiAoICEoY29uZmlnLT5mbGFncyAmIFhFTl9ET01DVExfQ0RGX2h2bV9ndWVzdCkgJiYNCj4g
KyAgICAgICAgIGNvbmZpZy0+ZmxhZ3MgJiBYRU5fRE9NQ1RMX0NERl9oYXAgKQ0KDQpTYW1lIGhl
cmUuDQoNCj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL3NjaGVkLmgNCj4gKysrIGIveGVuL2luY2x1
ZGUveGVuL3NjaGVkLmgNCj4gQEAgLTk0OCw2ICs5NDgsMTEgQEAgc3RhdGljIGlubGluZSBib29s
IGlzX2h2bV9kb21haW4oY29uc3Qgc3RydWN0IGRvbWFpbiAqZCkNCj4gICAgICAgICAgIGV2YWx1
YXRlX25vc3BlYyhkLT5vcHRpb25zICYgWEVOX0RPTUNUTF9DREZfaHZtX2d1ZXN0KTsNCj4gICB9
DQo+ICAgDQo+ICtzdGF0aWMgaW5saW5lIGJvb2wgaGFwX2VuYWJsZWQoY29uc3Qgc3RydWN0IGRv
bWFpbiAqZCkNCj4gK3sNCj4gKyAgICByZXR1cm4gZXZhbHVhdGVfbm9zcGVjKGQtPm9wdGlvbnMg
JiBYRU5fRE9NQ1RMX0NERl9oYXApOw0KPiArfQ0KPiArDQo+ICAgc3RhdGljIGlubGluZSBib29s
IGlzX2h2bV92Y3B1KGNvbnN0IHN0cnVjdCB2Y3B1ICp2KQ0KDQpDb3VsZCB0aGlzIHBsZWFzZSBu
b3QgYmUgcGxhY2VkIGJldHdlZW4gdHdvIGNsb3NlbHkgcmVsYXRlZCBmdW5jdGlvbnM/DQoNCkph
bg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
