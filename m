Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 435CA5E207
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2019 12:28:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hicSf-0006rw-M0; Wed, 03 Jul 2019 10:26:01 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=vZpq=VA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hicSd-0006rb-GT
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2019 10:25:59 +0000
X-Inumbo-ID: ef82deb5-9d7c-11e9-8980-bc764e045a96
Received: from m9a0002g.houston.softwaregrp.com (unknown [15.124.64.67])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ef82deb5-9d7c-11e9-8980-bc764e045a96;
 Wed, 03 Jul 2019 10:25:57 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP; 
 Wed,  3 Jul 2019 10:25:50 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 3 Jul 2019 10:22:04 +0000
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (15.124.72.14) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 3 Jul 2019 10:22:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=fFT+CCHPY3+uUNnuppoqrmU7AVC+jhsVQa4+qj0lJK0+CYIa21Yq/qr4yhgNxkm4AsAiBnSTIrt/xsJ+3uynX8Amc7D//Nv/trsGS651UBOCOqa7UY+bRcXJB6K9DTw1OFDG+oPvzTa5WbsF4/dCk3Fc5SlCqhoVpx9m0JzQ1Gs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KK9jXQoyoAMpiqte0QrznLTt0vRiGwKJekwD84tDk74=;
 b=FgRLYIF0QypeCcwEA5KB0p40d2DEiJg4x+iwMKv0t/CdDtQ0AfC7PEaKOGjjrElwzjxFFibfIUB9TeYSKhA6AmjKjdEFqmthI8XIAyk7yJniuNJuQzYDU2BG2FUSlySsopMLkU8ztyF8jvh4V7tIKi3eW1Z+MNp+DZqdydvdbn8=
ARC-Authentication-Results: i=1; test.office365.com
 1;spf=none;dmarc=none;dkim=none;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3364.namprd18.prod.outlook.com (10.255.139.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Wed, 3 Jul 2019 10:22:03 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2052.010; Wed, 3 Jul 2019
 10:22:03 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] x86/ept: pass correct level to p2m_entry_modify
Thread-Index: AQHVMYPg4S+dIz0qA0OTyld2TcGeGKa4r0GA
Date: Wed, 3 Jul 2019 10:22:03 +0000
Message-ID: <00beccee-3e59-ed0d-23fc-6e24bacfcfaf@suse.com>
References: <20190703094322.1551-1-roger.pau@citrix.com>
In-Reply-To: <20190703094322.1551-1-roger.pau@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR06CA0029.eurprd06.prod.outlook.com (2603:10a6:6:1::42)
 To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 408fc36d-3fa4-4d51-09e6-08d6ffa04a5d
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3364; 
x-ms-traffictypediagnostic: BY5PR18MB3364:
x-microsoft-antispam-prvs: <BY5PR18MB33645F3053C39D6E38C9E1D6B3FB0@BY5PR18MB3364.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 00872B689F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(346002)(396003)(366004)(136003)(39860400002)(199004)(189003)(76176011)(81156014)(99286004)(26005)(102836004)(6506007)(386003)(53546011)(305945005)(80792005)(8676002)(2906002)(8936002)(14454004)(31686004)(256004)(2501003)(6246003)(66476007)(7736002)(25786009)(72206003)(316002)(52116002)(14444005)(81166006)(36756003)(66066001)(64756008)(31696002)(68736007)(2616005)(54906003)(3846002)(66446008)(486006)(71190400001)(6512007)(11346002)(5660300002)(73956011)(71200400001)(6436002)(229853002)(6116002)(478600001)(6486002)(66556008)(66946007)(53936002)(4326008)(476003)(110136005)(86362001)(446003)(186003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3364;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: PHttuKPFJy0pZmIAnORz3WjrqDRJEZIViaqFj9er01aS1lfUmkM4RfF2/xrjvG3TpOv0X2kGM9r9wkBtLDoArUwDdq65rlfUMHQ+stb5ZT6q0R2XsQvxRo5nUGL2sQZgYIledIL7eDYoR71f6w2XFFQkXyrU26G9yrLkvc/4TFlt22FjtR814w7QrlhhMmIKarPLMoP5lJPGd3Vv0KL3aEsaj5f71qBl++mI5QODXlfk/pG4GBhQSqhzceysh5nPdjE2OSoan1cAFAY1+hIzKjCGw+TenI08LGKwCq/bqu2QfTDNvDKmStRtQCZkUZNDZMohtGe0KOwoITX+pVZ3pk1ut6DIi7kgLAfT/KVk3mHcMKlzcR9ung6Ulf0fMYQ97iI4DkSdutWqlWSboVLdC3urnTivHKl/X15/86mfLVg=
Content-ID: <1A3EFE2E8ADBF44195550F77AA512E5B@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 408fc36d-3fa4-4d51-09e6-08d6ffa04a5d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2019 10:22:03.0283 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3364
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] x86/ept: pass correct level to
 p2m_entry_modify
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Kevin
 Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDcuMjAxOSAxMTo0MywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPiBFUFQgZGlmZmVy
cyBmcm9tIE5QVCBhbmQgc2hhZG93IHdoZW4gdHJhbnNsYXRpbmcgcGFnZSBvcmRlcnMgdG8gbGV2
ZWxzDQo+IGluIHRoZSBwaHlzbWFwIHBhZ2UgdGFibGVzLiBFUFQgcGFnZSB0YWJsZXMgbGV2ZWwg
Zm9yIG9yZGVyIDAgcGFnZXMgaXMNCj4gMCwgd2hpbGUgTlBUIGFuZCBzaGFkb3cgaW5zdGVhZCB1
c2UgMSwgaWU6IEVQVCBwYWdlIHRhYmxlcyBsZXZlbHMNCj4gc3RhcnRzIGF0IDAgd2hpbGUgTlBU
IGFuZCBzaGFkb3cgc3RhcnRzIGF0IDEuDQo+IA0KPiBGaXggdGhlIHAybV9lbnRyeV9tb2RpZnkg
Y2FsbCBpbiBhdG9taWNfd3JpdGVfZXB0X2VudHJ5IHRvIGFsd2F5cyBhZGQNCj4gb25lIHRvIHRo
ZSBsZXZlbCwgaW4gb3JkZXIgdG8gbWF0Y2ggTlBUIGFuZCBzaGFkb3cgdXNhZ2UuDQo+IA0KPiBX
aGlsZSB0aGVyZSBhbHNvIGZpeCBwMm1fZW50cnlfbW9kaWZ5IEJVRyBjb25kaXRpb24gdG8gdHJp
Z2dlciB3aGVuDQo+IGZvcmVpZ24gb3IgaW9yZXEgZW50cmllcyB3aXRoIGxldmVsIGRpZmZlcmVu
dCB0aGFuIDAgYXJlIGF0dGVtcHRlZC4NCj4gVGhhdCBzaG91bGQgYWxsb3cgdG8gY2F0Y2ggZnV0
dXJlIGVycm9ycyByZWxhdGVkIHRvIHRoZSBsZXZlbA0KPiBwYXJhbWV0ZXIuDQo+IA0KPiBGaXhl
czogYzdhNGMwICgneDg2L21tOiBzcGxpdCBwMm0gaW9yZXEgc2VydmVyIHBhZ2VzIHNwZWNpYWwg
aGFuZGxpbmcgaW50byBoZWxwZXInKQ0KDQpBIDYtZGlnaXQgaGFzaCBpcyBkZWZpbml0ZWx5IHRv
byBzaG9ydCBpbiB0aGUgbG9uZyBydW4uIEkgdW5kZXJzdGFuZA0KdGhhdCB0aGlzIHRoZW4gd2Fu
dHMgYmFja3BvcnRpbmcgdG8gdGhlIDQuMTIgdHJlZS4NCg0KPiAtLS0gYS94ZW4vaW5jbHVkZS9h
c20teDg2L3AybS5oDQo+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvcDJtLmgNCj4gQEAgLTk0
Niw3ICs5NDYsNyBAQCBzdGF0aWMgaW5saW5lIGludCBwMm1fZW50cnlfbW9kaWZ5KHN0cnVjdCBw
Mm1fZG9tYWluICpwMm0sIHAybV90eXBlX3QgbnQsDQo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBwMm1fdHlwZV90IG90LCBtZm5fdCBuZm4sIG1mbl90IG9mbiwNCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBsZXZlbCkNCj4g
ICB7DQo+IC0gICAgQlVHX09OKGxldmVsID4gMSAmJiAobnQgPT0gcDJtX2lvcmVxX3NlcnZlciB8
fCBudCA9PSBwMm1fbWFwX2ZvcmVpZ24pKTsNCj4gKyAgICBCVUdfT04obGV2ZWwgIT0gMSAmJiAo
bnQgPT0gcDJtX2lvcmVxX3NlcnZlciB8fCBudCA9PSBwMm1fbWFwX2ZvcmVpZ24pKTsNCg0KV291
bGRuJ3QgeW91IGJldHRlciBsZWF2ZSB0aGlzIGFsb25lIGFuZCBhZGQgQlVHX09OKCFsZXZlbCk/
DQoNCkphbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
