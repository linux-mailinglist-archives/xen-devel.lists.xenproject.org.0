Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E5B81685
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 12:10:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1huZtE-0004nN-VJ; Mon, 05 Aug 2019 10:06:52 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=gDv/=WB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1huZtD-0004nI-KY
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2019 10:06:51 +0000
X-Inumbo-ID: bc46c0b8-b768-11e9-8980-bc764e045a96
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id bc46c0b8-b768-11e9-8980-bc764e045a96;
 Mon, 05 Aug 2019 10:06:49 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Mon,  5 Aug 2019 10:06:42 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 5 Aug 2019 10:02:44 +0000
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (15.124.8.11) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 5 Aug 2019 10:02:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LjEmHA606z06QzpC1umkF2H8UJ3swggVDTAfeeWddi5oEvdPLxYeKf5Eef24asGCsKPQFlTR4mVClLzXHDshzQDBeAAf1eOD8scJAX+7GO5xyAv1sqRj5Wud6gO+AFDUFVyyv+8qXgxT4KgsC8v/KIRqelH6mR7xwaVyT9c1sU15xcVutgEQTXt8UiiVKffGZTClPmFyNxAwbHgbo72xFqPkzrs5i/6qFfG+T2W09SeRcodIXL59kxN8TczQ/s/tSmhkbKie29AD6FJkeJrV8L30Y7Nx7KQstGgK+G3JaRMzzNk+wpIB6y3YfBQhNs/l3J3s7gE9pWVD6u+tF/fYtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q3EeKVeFPKGVxGVDEQfu2zW8mbIy6TW+fp2IDQrbz2M=;
 b=SVEzandYhPPH0kkCXPq0MVAW/T76CPNhyblbI+RUukXgWiQjzYV3FAko5OCOiLGSoE8Drp8jd0D24i8+vIz9cQtezumRK7H3fmi1Mx07rifhHUO/VPLtUFliPOSzGodJd5uDfkx+82SaxSFE/xls0RxJRsjWZYAAYeCQI1U4r4iyLZjBHcbKJ4s3XTmgay1RyJGBtvRNPANmP5b4V6YHzDj2GEOGxJ3S/lwcF3dFwI5rxjOxbszVPEk+8cyFeFpHSCLhMD8BEMSTCR1l+aAcVSN1QWx5KZgW01IDkNHGYjlUub0pOa8dyyupKi6dSt3vmVi17t2OPbiTHNzZTRTReA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from MN2PR18MB3405.namprd18.prod.outlook.com (10.255.238.214) by
 MN2PR18MB3328.namprd18.prod.outlook.com (10.255.238.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Mon, 5 Aug 2019 10:02:43 +0000
Received: from MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081]) by MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081%7]) with mapi id 15.20.2136.018; Mon, 5 Aug 2019
 10:02:43 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Thread-Topic: [PATCH V2 3/6] [RFC] xen/common: Introduce _xrealloc function
Thread-Index: AQHVSVD5wUnbw+V8Qku+SBIMTDh+a6bsVzSA
Date: Mon, 5 Aug 2019 10:02:43 +0000
Message-ID: <921ff67c-5a61-9f43-965e-e1b2075c2280@suse.com>
References: <1564763985-20312-1-git-send-email-olekstysh@gmail.com>
 <1564763985-20312-4-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1564763985-20312-4-git-send-email-olekstysh@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM3PR04CA0145.eurprd04.prod.outlook.com (2603:10a6:207::29)
 To MN2PR18MB3405.namprd18.prod.outlook.com
 (2603:10b6:208:16c::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6abcd16f-073b-488b-96fc-08d7198c0ee3
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR18MB3328; 
x-ms-traffictypediagnostic: MN2PR18MB3328:
x-microsoft-antispam-prvs: <MN2PR18MB33282904B62919F64FCE1F3BB3DA0@MN2PR18MB3328.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01208B1E18
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(366004)(39860400002)(346002)(396003)(136003)(199004)(189003)(6916009)(71200400001)(305945005)(31686004)(81156014)(81166006)(7736002)(71190400001)(6116002)(2906002)(54906003)(3846002)(11346002)(66946007)(486006)(86362001)(2616005)(6486002)(64756008)(66556008)(6436002)(316002)(8676002)(8936002)(446003)(31696002)(229853002)(66446008)(476003)(52116002)(5660300002)(1411001)(26005)(186003)(66476007)(53936002)(99286004)(68736007)(386003)(53546011)(102836004)(6506007)(76176011)(6512007)(4326008)(478600001)(25786009)(80792005)(66066001)(256004)(36756003)(14454004)(6246003)(7416002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR18MB3328;
 H:MN2PR18MB3405.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: MBduWfrzniCiuomiB++3YBb8n1tXDAEIAr4VGqGirzbo6TRJ2Y4wTotQ46m6q+CC0YtE0hBbLHPrXEfT97EvtwEDevcX/ARIoDCpteCGA60oocdsKVMzZ1QOI5tBi7DmWcnvNqqTH2mMZ8k2Fk7yRMBqBCaH7k73/VdDKkv5OmETJlt9H3p39HjY9+3pcmxzmuCQys3OlsxhUqZslzLvYp/73z71FvzwK1QObDe1JbNpemSd1gergxuHSRv1pPGQSuSSF13qbKeb9APK3rt55MggeVwlbSEaWPUodHVT8dOA+RnMXTndS8+f0Tqyi8AmbfQm3PTNtnQTHSNkWvFBFE1hCLXWrs61yAIWijuJja3prJZBMlafFTRp9yJSxY8tTae6gTAt/3RGrzgB9nk/F0vpCjcYirsDijvQNYTAjpY=
Content-ID: <52A78D9F97823243813F0F64A9745CAB@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 6abcd16f-073b-488b-96fc-08d7198c0ee3
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 10:02:43.3865 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB3328
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH V2 3/6] [RFC] xen/common: Introduce
 _xrealloc function
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
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 "julien.grall@arm.com" <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMDguMjAxOSAxODozOSwgT2xla3NhbmRyIFR5c2hjaGVua28gd3JvdGU6DQo+IC0tLSBh
L3hlbi9jb21tb24veG1hbGxvY190bHNmLmMNCj4gKysrIGIveGVuL2NvbW1vbi94bWFsbG9jX3Rs
c2YuYw0KPiBAQCAtNjEwLDYgKzYxMCwyNyBAQCB2b2lkICpfeHphbGxvYyh1bnNpZ25lZCBsb25n
IHNpemUsIHVuc2lnbmVkIGxvbmcgYWxpZ24pDQo+ICAgICAgIHJldHVybiBwID8gbWVtc2V0KHAs
IDAsIHNpemUpIDogcDsNCj4gICB9DQo+ICAgDQo+ICt2b2lkICpfeHJlYWxsb2Modm9pZCAqcCwg
dW5zaWduZWQgbG9uZyBuZXdfc2l6ZSwgdW5zaWduZWQgbG9uZyBhbGlnbikNCj4gK3sNCj4gKyAg
ICB2b2lkICpuZXdfcDsNCj4gKw0KPiArICAgIGlmICggIW5ld19zaXplICkNCj4gKyAgICB7DQo+
ICsgICAgICAgIHhmcmVlKHApOw0KPiArICAgICAgICByZXR1cm4gTlVMTDsNCj4gKyAgICB9DQo+
ICsNCj4gKyAgICBuZXdfcCA9IF94bWFsbG9jKG5ld19zaXplLCBhbGlnbik7DQo+ICsNCj4gKyAg
ICBpZiAoIG5ld19wICYmIHAgKQ0KPiArICAgIHsNCj4gKyAgICAgICAgbWVtY3B5KG5ld19wLCBw
LCBuZXdfc2l6ZSk7DQo+ICsgICAgICAgIHhmcmVlKHApOw0KPiArICAgIH0NCj4gKw0KPiArICAg
IHJldHVybiBuZXdfcDsNCj4gK30NCg0KV2hpbGUgSSBjYW4gc2VlIHdoeSBoYXZpbmcgYSByZS1h
bGxvY2F0aW9uIGZ1bmN0aW9uIG1heSBiZSBoYW5keSwNCmV4cGxpY2l0IC8gZGlyZWN0IHVzZSBv
ZiBfeG1hbGxvYygpIGFuZCBfeHphbGxvYygpIGFyZSBkaXNjb3VyYWdlZCwNCmluIGZhdm9yIG9m
IHRoZSBtb3JlIHR5cGUtc2FmZSB1bmRlcnNjb3JlLWxlc3MgdmFyaWFudHMuIEkgY2FuJ3QNCnNl
ZSB0aG91Z2ggaG93IGEgdHlwZS1zYWZlICJyZWFsbG9jIiBjb3VsZCBsb29rIGxpa2UsIGV4Y2Vw
dCBmb3INCmFycmF5cy4gSWYgcmVzaXppbmcgYXJyYXlzIGlzIGFsbCB5b3UncmUgYWZ0ZXIsIEkn
ZCBsaWtlIHRvDQpyZWNvbW1lbmQgdG8gZ28gdGhhdCByb3V0ZSByYXRoZXIgdGhlbiB0aGUgc3Vn
Z2VzdGVkIG9uZSBoZXJlLiBJZg0KcmVzaXppbmcgYXJiaXRyYXJ5IG9iamVjdHMgaXMgdGhlIGdv
YWwsIHRoZW4gd2hhdCB5b3Ugc3VnZ2VzdCBtYXkNCmJlIHRoZSBvbmx5IHJvdXRlLCBidXQgSSdk
IHN0aWxsIGJlIG5vdCBvdmVybHkgaGFwcHkgdG8gc2VlIHN1Y2gNCmFkZGVkLg0KDQpGdXJ0aGVy
bW9yZSB5b3UgZG9uJ3QgZXZlbiB1c2UgaW50ZXJuYWxzIG9mIHRoZSBhbGxvY2F0b3I6IEl0IGlz
DQpjb21tb24gcHJhY3RpY2UgdG8gYXZvaWQgcmUtYWxsb2NhdGlvbiBpZiB0aGUgcmVxdWVzdGVk
IHNpemUgZml0cw0Kd2l0aGluIHRoZSBhbHJlYWR5IGFsbG9jYXRlZCBibG9jay4gVGhhdCdzIG5v
dCB0aGUgbGVhc3QgaGVscGZ1bA0KYmVjYXVzZSBpbiBzdWNoIGEgY2FzZSB5b3UgY2FuJ3QgcG9z
c2libHkgc3VmZmVyIGFueSAtRU5PTUVNDQpjb25kaXRpb24uDQoNCkFuZCBmaW5hbGx5IC0gcGxl
YXNlIG5vdGUgX3htYWxsb2MoKSdzIGFuZCBfeGZyZWUoKSdzIHVzZSAvDQpzcGVjaWFsIGNhc2lu
ZyBvZiBaRVJPX0JMT0NLX1BUUjogWW91IGFic29sdXRlbHkgd291bGQgbmVlZCB0bw0KbWlycm9y
IHRoaXMgaGVyZS4NCg0KSmFuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
