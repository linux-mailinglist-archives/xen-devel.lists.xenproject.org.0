Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA2474B3F
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2019 12:11:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqag3-0007dR-51; Thu, 25 Jul 2019 10:08:47 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=dOpT=VW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hqag1-0007dG-Jg
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2019 10:08:45 +0000
X-Inumbo-ID: 2e747643-aec4-11e9-8980-bc764e045a96
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2e747643-aec4-11e9-8980-bc764e045a96;
 Thu, 25 Jul 2019 10:08:43 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Thu, 25 Jul 2019 10:08:32 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 25 Jul 2019 09:54:48 +0000
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (15.124.8.13) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 25 Jul 2019 09:54:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Em+ffwxPeyRCVKo0GL0r7KdF8hACDBZI3EDe1ZAz+VzqH5IkXUa6GxpPgprxtYLxGsJloHlxxBuCdwO2F6DNI6FlVoqmiIuBzZFONma+e+10XNtj+YsFB9lqS2RnPXKAe5VvNbMcPBCgZvwllujLR42Vd8duqTkd9AE82vgf4VG1ypQm0jVwoc7y9k7rG1+X57QZGFIkUWWHPPr9WublkD5gEv3RkoIJNzt9+bC24ZS1muKtRxGSd75XX5ZpXxsPDDL0rTFJR0uga1iXkRhR5hRVI3Wn5csv1Zf26oFLsACrluMKUJfekDoAPcucWfmADtjCn4OxDM2rpga0wHzT2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yZqzdBsl16VW74NT8yKuV5dr5MhiXpZy0rZPZoD19RI=;
 b=MK2mLBAkL4Jc46XVIRmiv5HBritL8H3utDu1N2TC5t9G0c6qrb/tX63LjzpBZvJ0FomWzbQWJdECwU8gY1BV3Eumevf0nlVo0SfLVoeA5zEKoRd574gLRiLaytAGz1TjkMzZwfJsuBCMK1NUiGbwMhFohcp4HyeG0di8y54HM26ZSMNjyFGiKBZzjlga9rbv9Ud+YGq8sJqhYu0XDQMvlmhxEvbF1051q0UsGQWcwJFK0vvm1NUzBrBnYA7B17REJ8CD8nvj5RfkFfbPzimwLZHJfj8IUqbPu/nOTqeL2VkM4MX/xIFjm63UvpahlEusLo2sKKRUjkBlNzOo7X+f+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3379.namprd18.prod.outlook.com (10.255.136.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Thu, 25 Jul 2019 09:54:46 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2094.013; Thu, 25 Jul 2019
 09:54:46 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Oleg Ginzburg
 <olevole@olevole.ru>
Thread-Topic: [Xen-devel] XenDom0/FreeBSD: guest crash when nested
 virtualization is used
Thread-Index: AQHVQkpB744ezSIHTEKNpVRjiIbStKbaFLrrgAEEpoA=
Date: Thu, 25 Jul 2019 09:54:46 +0000
Message-ID: <42757d1f-ca77-9930-dadf-1bdc270a06a8@suse.com>
References: <CAMsb+mYokgvaRip3UBbrcXM0XYC9XqYo5x8Ag5zW-FL4We+PAA@mail.gmail.com>
 <22f8894a-1064-8386-ca3a-c29ddbff16d8@citrix.com>
In-Reply-To: <22f8894a-1064-8386-ca3a-c29ddbff16d8@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0349.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::25) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 28506f5a-5843-44c3-899c-08d710e6203c
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3379; 
x-ms-traffictypediagnostic: BY5PR18MB3379:
x-microsoft-antispam-prvs: <BY5PR18MB3379EFAA2DFD4CBB3E5F6B9FB3C10@BY5PR18MB3379.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0109D382B0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(136003)(366004)(346002)(396003)(39860400002)(199004)(189003)(486006)(76176011)(6436002)(14444005)(6486002)(31686004)(478600001)(25786009)(53936002)(66066001)(31696002)(6512007)(14454004)(86362001)(66446008)(229853002)(66556008)(66946007)(5660300002)(6246003)(66476007)(80792005)(8936002)(6116002)(81156014)(81166006)(7736002)(110136005)(71200400001)(8676002)(71190400001)(36756003)(4326008)(64756008)(305945005)(6506007)(102836004)(476003)(52116002)(386003)(26005)(256004)(186003)(3846002)(2906002)(68736007)(53546011)(54906003)(11346002)(446003)(316002)(2616005)(99286004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3379;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: TSWhgVd68CfcnGVU2Pgm5fkwpFCV4dZewHl4W9ZkIaK2ClDcHv8BjAHK9KVtl7sIaTLe/PLfg5Ga2/lc7UUY7AKhe7XEI7XcdsxO2PS/iNynNNCeJuoz2yKaSVBsrEIHoikS6lt3EdY8iuuNclaDUS8f/ICiIRjUAAS7rme6gT24OA7IBCFsvk2++pbdlJxU0dMMfk92qXSZSFxsxT2jT0tcamwODEi12PQbDJu5vEiWKtaxufAMbeOSfTKagH+/p9LVcSAUj/LULmGyqODu1ZsfX1HXqAv/UNzj2aoE057kh2T9yJCCKSKl/ugiOBXWkCWiX6mNLybKUiWidCq4+zJdsS3XVZNYlv5N6DD5UoN8632ReRDdTTPQcPyuTuwqwuNXpRgTbd7nboPswtbztEw6vSCZe5Vd7mbC6wDzWjs=
Content-ID: <EFC32918A6365A45B95976945B05A80A@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 28506f5a-5843-44c3-899c-08d710e6203c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2019 09:54:46.7194 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3379
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] XenDom0/FreeBSD: guest crash when nested
 virtualization is used
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Roger
 Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDcuMjAxOSAyMDoxOSwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMjQvMDcvMjAx
OSAxOTowMiwgT2xlZyBHaW56YnVyZyB3cm90ZToNCj4+IChkMikgQm9vdGluZyBmcm9tIEhhcmQg
RGlzay4uLg0KPj4gKGQyKSBCb290aW5nIGZyb20gMDAwMDo3YzAwDQo+PiAoWEVOKSBkMnYwIFZN
TEFVTkNIIGVycm9yOiAweDcNCg0KU28gdGhpcyB0ZWxscyB1cyBpdCdzIHRoZSB2ZXJ5IGZpcnN0
IGluc24gaW4gdGhlIChuZXN0ZWQpIGd1ZXN0IHRoYXQNCmNhdXNlcyB0aGUgZmFpbHVyZS4NCg0K
Pj4gKFhFTikgKioqIEd1ZXN0IFN0YXRlICoqKg0KPj4gKFhFTikgQ1IwOiBhY3R1YWw9MHgwMDAw
MDAwMDgwMDUwMDMzLCBzaGFkb3c9MHgwMDAwMDAwMDYwMDAwMDEwLCBnaF9tYXNrPWZmZmZmZmZm
ZmZmZmZmZmYNCj4+IChYRU4pIENSNDogYWN0dWFsPTB4MDAwMDAwMDAwMDAwMjA1MCwgc2hhZG93
PTB4MDAwMDAwMDAwMDAwMDAwMCwgZ2hfbWFzaz1mZmZmZmZmZmZmZmZmODcxDQo+PiAoWEVOKSBD
UjMgPSAweDAwMDAwMDAwZmVmZmMwMDANCj4+IChYRU4pIFJTUCA9IDB4MDAwMDAwMDAwMDAwMDAw
MCAoMHgwMDAwMDAwMDAwMDAwMDAwKSAgUklQID0gMHgwMDAwMDAwMDAwMDBmZmYwICgweDAwMDAw
MDAwMDAwMGZmZjApDQo+PiAoWEVOKSBSRkxBR1M9MHgwMDAxMDAwMiAoMHgwMDAxMDAwMikgIERS
NyA9IDB4MDAwMDAwMDAwMDAwMDQwMA0KPj4gKFhFTikgU3lzZW50ZXIgUlNQPTAwMDAwMDAwMDAw
MDAwMDAgQ1M6UklQPTAwMDA6MDAwMDAwMDAwMDAwMDAwMA0KPj4gKFhFTikgICAgICAgIHNlbCAg
YXR0ciAgbGltaXQgICBiYXNlDQo+PiAoWEVOKSAgIENTOiBmMDAwIDAwMDliIDAwMDBmZmZmIDAw
MDAwMDAwZmZmZjAwMDANCj4+IChYRU4pICAgRFM6IDAwMDAgMDAwOTMgMDAwMGZmZmYgMDAwMDAw
MDAwMDAwMDAwMA0KPj4gKFhFTikgICBTUzogMDAwMCAwMDA5MyAwMDAwZmZmZiAwMDAwMDAwMDAw
MDAwMDAwDQo+PiAoWEVOKSAgIEVTOiAwMDAwIDAwMDkzIDAwMDBmZmZmIDAwMDAwMDAwMDAwMDAw
MDANCj4+IChYRU4pICAgRlM6IDAwMDAgMDAwOTMgMDAwMGZmZmYgMDAwMDAwMDAwMDAwMDAwMA0K
Pj4gKFhFTikgICBHUzogMDAwMCAwMDA5MyAwMDAwZmZmZiAwMDAwMDAwMDAwMDAwMDAwDQo+PiAo
WEVOKSBHRFRSOiAgICAgICAgICAgIDAwMDBmZmZmIDAwMDAwMDAwMDAwMDAwMDANCj4+IChYRU4p
IExEVFI6IDAwMDAgMDAwODIgMDAwMGZmZmYgMDAwMDAwMDAwMDAwMDAwMA0KPj4gKFhFTikgSURU
UjogICAgICAgICAgICAwMDAwZmZmZiAwMDAwMDAwMDAwMDAwMDAwDQo+PiAoWEVOKSAgIFRSOiAw
MDAwIDAwMDhiIDAwMDBmZmZmIDAwMDAwMDAwMDAwMDAwMDANCj4+IChYRU4pIEVGRVIoVk1DUykg
PSAweDAwMDAwMDAwMDAwMDAwMDAgIFBBVCA9IDB4MDAwMDA1MDEwMDA3MDQwNg0KPj4gKFhFTikg
UHJlZW1wdGlvblRpbWVyID0gMHgwMDAwMDAwMCAgU00gQmFzZSA9IDB4MDAwMDAwMDANCj4+IChY
RU4pIERlYnVnQ3RsID0gMHgwMDAwMDAwMDAwMDAwMDAwICBEZWJ1Z0V4Y2VwdGlvbnMgPSAweDAw
MDAwMDAwMDAwMDAwMDANCj4+IChYRU4pIEludGVycnVwdGliaWxpdHkgPSAwMDAwMDAwMCAgQWN0
aXZpdHlTdGF0ZSA9IDAwMDAwMDAwDQo+PiAoWEVOKSBJbnRlcnJ1cHRTdGF0dXMgPSAwMDAwDQo+
PiAoWEVOKSAqKiogSG9zdCBTdGF0ZSAqKioNCj4+IChYRU4pIFJJUCA9IDB4ZmZmZjgyZDA4MDMw
ZjhiMCAodm1hYy5jI3ZteF9hc21fdm1leGl0X2hhbmRsZXIpICBSU1AgPSAweGZmZmY4MzIwMjU5
YmZmNzANCj4gDQo+IFNvbWV0aGluZyBpcyBkZWZpbml0ZWx5IHN0cmFuZ2UgaW4geW91ciBidWls
ZCBvZiBYZW4uwqAgdm1hYy5jIGRvZXNuJ3QNCj4gY29udGFpbiB0aGUgdm1leGl0IGhhbmRsZXIu
DQo+IA0KPj4gKFhFTikgQ1M9ZTAwOCBTUz0wMDAwIERTPTAwMDAgRVM9MDAwMCBGUz0wMDAwIEdT
PTAwMDAgVFI9ZTA0MA0KPj4gKFhFTikgRlNCYXNlPTAwMDAwMDAwMDAwMDAwMDAgR1NCYXNlPTAw
MDAwMDAwMDAwMDAwMDAgVFJCYXNlPWZmZmY4MzIwMjU5YzJjMDANCj4+IChYRU4pIEdEVEJhc2U9
ZmZmZjgzMjAyNTliMjAwMCBJRFRCYXNlPWZmZmY4MzIwMjU5YjYwMDANCj4+IChYRU4pIENSMD0w
MDAwMDAwMDgwMDUwMDMzIENSMz0wMDAwMDAyMDFiYzQ1MDAwIENSND0wMDAwMDAwMDAwMzUyNmUw
DQo+PiAoWEVOKSBTeXNlbnRlciBSU1A9ZmZmZjgzMjAyNTliZmZhMCBDUzpSSVA9ZTAwODpmZmZm
ODJkMDgwMzU0NDIwDQo+PiAoWEVOKSBFRkVSID0gMHgwMDAwMDAwMDAwMDAwZDAxICBQQVQgPSAw
eDAwMDAwNTAxMDAwNzA0MDYNCj4+IChYRU4pICoqKiBDb250cm9sIFN0YXRlICoqKg0KPj4gKFhF
TikgUGluQmFzZWQ9MDAwMDAwM2YgQ1BVQmFzZWQ9YjZhMWVkZmEgU2Vjb25kYXJ5RXhlYz0wMDAy
MTRlYg0KPj4gKFhFTikgRW50cnlDb250cm9scz0wMDAwMTFmZiBFeGl0Q29udHJvbHM9MDAyZmVm
ZmYNCj4+IChYRU4pIEV4Y2VwdGlvbkJpdG1hcD0wMDA2MDA0MiBQRkVDbWFzaz0wMDAwMDAwMCBQ
RkVDbWF0Y2g9MDAwMDAwMDANCj4+IChYRU4pIFZNRW50cnk6IGludHJfaW5mbz04MDAwMDMwZCBl
cnJjb2RlPTAwMDAwMDAwIGlsZW49MDAwMDAwMDANCj4+IChYRU4pIFZNRXhpdDogaW50cl9pbmZv
PTAwMDAwMDAwIGVycmNvZGU9MDAwMDAwMDAgaWxlbj0wMDAwMDAwNQ0KPj4gKFhFTikgICAgICAg
ICByZWFzb249MDAwMDAwMzAgcXVhbGlmaWNhdGlvbj0wMDAwMDAwMDAwMDAwMTgxDQo+PiAoWEVO
KSBJRFRWZWN0b3Jpbmc6IGluZm89ODAwMDBiMGQgZXJyY29kZT0wMDAwZjAwMA0KPiANCj4gVGhl
IElEVFZlY3RvcmluZyBhbmQgVk1FbnRyeSBmaWVsZHMgbG9vayBsaWtlIHdlIGludGVyY2VwdGVk
IGEgcGFnZQ0KPiBmYXVsdCwgYnV0IGFyZSB0cnlpbmcgdG8gcmUtaW5qZWN0IGl0IHdpdGhvdXQg
YW4gZXJyb3IgY29kZSwgd2hpY2ggaXMNCj4gcG9zc2libHkgd2hhdCBoYXJkd2FyZSBpcyBjb21w
bGFpbmluZyBhYm91dC4NCg0KSSB0aGluayBpdCdzIGFuIEVQVCB2aW9sYXRpb24gdGhhdCB3ZSBj
YXVnaHQsIHdoaWNoIG11c3QgaGF2ZSBoYXBwZW5lZA0Kd2hpbGUgdHJ5aW5nIHRvIGRlbGl2ZXIg
I0dQKDB4ZjAwMCkuIFRoYXQncyByYXRoZXIgb2RkIGluIHJlYWwgbW9kZS4NCg0KSmFuDQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
