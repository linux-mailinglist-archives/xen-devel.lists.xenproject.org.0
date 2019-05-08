Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D539C17D77
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2019 17:44:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOOi5-0004xf-7p; Wed, 08 May 2019 15:42:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6VD+=TI=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1hOOi3-0004xQ-JH
 for xen-devel@lists.xenproject.org; Wed, 08 May 2019 15:42:19 +0000
X-Inumbo-ID: db97e5ca-71a7-11e9-bc35-e7917456821d
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.0.124]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id db97e5ca-71a7-11e9-bc35-e7917456821d;
 Wed, 08 May 2019 15:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IEeOwLHv2tSexhjgHNxmhwAkBriPxTqjhLaEdOFCiLY=;
 b=xjjLnCgGSjbBjjpcWStb2E2/NVuD9TY1XJueNLdvmhvCLyqUQoHQzMyo3nAAp6Mws68XKrEfc8SUZpgOBWPiQcojqIKKC5pAD6mV0dzqomKyui93vr6tqPN2wh28A0MJcIP8XzhJqQ99xc2BsOD4wVTKbWzBqBRBEZGLvQs/7m8=
Received: from DB6PR0202MB2917.eurprd02.prod.outlook.com (10.171.76.8) by
 DB6PR0202MB2871.eurprd02.prod.outlook.com (10.171.71.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.10; Wed, 8 May 2019 15:42:14 +0000
Received: from DB6PR0202MB2917.eurprd02.prod.outlook.com
 ([fe80::3007:eb13:8641:df77]) by DB6PR0202MB2917.eurprd02.prod.outlook.com
 ([fe80::3007:eb13:8641:df77%9]) with mapi id 15.20.1856.012; Wed, 8 May 2019
 15:42:14 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <JBeulich@suse.com>
Thread-Topic: [PATCH RFC v3 2/2] x86/emulate: Send vm_event from emulate
Thread-Index: AQHUvhsBUpx0sKZTt0qgTjw+lHK4bKYyxHqAgC8og4A=
Date: Wed, 8 May 2019 15:42:13 +0000
Message-ID: <7b325d79-dc03-6927-9430-29bace6be040@bitdefender.com>
References: <20190206125314.10869-1-aisaila@bitdefender.com>
 <20190206125314.10869-2-aisaila@bitdefender.com>
 <5CAB69AB0200007800225785@prv1-mh.provo.novell.com>
In-Reply-To: <5CAB69AB0200007800225785@prv1-mh.provo.novell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR02CA0046.eurprd02.prod.outlook.com
 (2603:10a6:208:d2::23) To DB6PR0202MB2917.eurprd02.prod.outlook.com
 (2603:10a6:4:b1::8)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 22c90592-a4be-400e-e5f8-08d6d3cbbdef
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:DB6PR0202MB2871; 
x-ms-traffictypediagnostic: DB6PR0202MB2871:|DB6PR0202MB2871:
x-microsoft-antispam-prvs: <DB6PR0202MB2871EEF567203447A75628A2AB320@DB6PR0202MB2871.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0031A0FFAF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(39860400002)(346002)(396003)(376002)(366004)(189003)(199004)(6116002)(81166006)(81156014)(3846002)(316002)(8676002)(6246003)(66946007)(6506007)(256004)(14444005)(102836004)(6436002)(54906003)(26005)(386003)(8936002)(71200400001)(66066001)(64756008)(36756003)(66476007)(25786009)(66556008)(71190400001)(66446008)(99286004)(186003)(31686004)(478600001)(52116002)(31696002)(14454004)(305945005)(476003)(86362001)(11346002)(68736007)(446003)(6916009)(2616005)(4326008)(7736002)(53936002)(486006)(229853002)(6486002)(73956011)(76176011)(2906002)(5660300002)(6512007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB6PR0202MB2871;
 H:DB6PR0202MB2917.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ArWEJHYTQk9Zmtw2Da4NRUm54uDBT6Fz+/zJIWYM5JvRNnKUoPSaXy5gAmG+t3dqcP+4bDYMgsrFTQ9Ib7A+b/MRftPuxFyUitILFu3HzJAy0sdaIUeyZbf7uCjpb0DbAhyz5/MtpH9fNjYcEY7G4d+5O5HEBgqPedZG/BwOBd+nRPWEwzB8SM6LynPhxF/KRQBuZvRQdehJt/uJmIueaBcAMhEsO9LtvxflefOrXvt41VjJVhYSK9Mw1nkSANiN81oSYLAA57IRyoovWM707XarEbXr5BEv2jO3MYNJOrS4BVLvIb17p6sdDBdWEszHxtUUDsVgBOWHfdockpqlvhtUElRaXiJ4nPCr3ItFXjPGfkuM7QQnKkibBmbXguTQa5omjGdUqR/Lh13krgVk+UQ1o2gp+fvSM6nZN6Yg2Hw=
Content-ID: <60CCF1C944298F438FBDFF8C26FE1CE4@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22c90592-a4be-400e-e5f8-08d6d3cbbdef
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2019 15:42:14.0273 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0202MB2871
Subject: Re: [Xen-devel] [PATCH RFC v3 2/2] x86/emulate: Send vm_event from
 emulate
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <paul.durrant@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQo+PiBAQCAtNTMwLDYgKzUzMiw1NSBAQCBzdGF0aWMgaW50IGh2bWVtdWxfZG9fbW1pb19hZGRy
KHBhZGRyX3QgbW1pb19ncGEsDQo+PiAgICAgICByZXR1cm4gaHZtZW11bF9kb19pb19hZGRyKDEs
IG1taW9fZ3BhLCByZXBzLCBzaXplLCBkaXIsIGRmLCByYW1fZ3BhKTsNCj4+ICAgfQ0KPj4gICAN
Cj4+ICtzdGF0aWMgYm9vbCBodm1lbXVsX3NlbmRfdm1fZXZlbnQocGFkZHJfdCBncGEsIHVuc2ln
bmVkIGxvbmcgZ2xhLCBnZm5fdCBnZm4sDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHVpbnQzMl90IHBmZWMsIHN0cnVjdCBodm1fZW11bGF0ZV9jdHh0ICpjdHh0KQ0KPiAN
Cj4gV2h5IGJvdGggZ3BhIGFuZCBnZm4/DQo+IA0KPj4gQEAgLTcwNCw2ICs3NTYsMjMgQEAgc3Rh
dGljIHZvaWQgKmh2bWVtdWxfbWFwX2xpbmVhcl9hZGRyKA0KPj4gICANCj4+ICAgICAgICAgICBp
ZiAoIHBmZWMgJiBQRkVDX3dyaXRlX2FjY2VzcyApDQo+PiAgICAgICAgICAgew0KPj4gKyAgICAg
ICAgICAgIHVuc2lnbmVkIGxvbmcgcmVwcyA9IDE7DQo+PiArICAgICAgICAgICAgc3RydWN0IGh2
bV9lbXVsYXRlX2N0eHQgb2xkOw0KPj4gKyAgICAgICAgICAgIGludCByYyA9IDA7DQo+PiArICAg
ICAgICAgICAgcGFkZHJfdCBncGE7DQo+PiArDQo+PiArICAgICAgICAgICAgb2xkID0gKmh2bWVt
dWxfY3R4dDsNCj4+ICsgICAgICAgICAgICByYyA9IGh2bWVtdWxfbGluZWFyX3RvX3BoeXMoYWRk
ciwgJmdwYSwgYnl0ZXMsICZyZXBzLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBwZmVjLCBodm1lbXVsX2N0eHQpOw0KPj4gKyAgICAgICAgICAgIGlmICggcmMg
PT0gWDg2RU1VTF9FWENFUFRJT04gKQ0KPj4gKyAgICAgICAgICAgICAgICAqaHZtZW11bF9jdHh0
ID0gb2xkOw0KPiANCj4gU29tZXRoaW5nIGxpa2UgdGhpcyAtIGlmIGl0IGlzIF9yZWFsbHlfIG5l
ZWRlZCAtIGhhcyB0byBiZSBhY2NvbXBhbmllZA0KPiBieSBhIGp1c3RpZmljYXRpb24uIEkgZmlu
ZCBpdCBxdWVzdGlvbmFibGUgdGhvdWdoIHRoYXQgeW91IHJlYWxseSBzaG91bGQNCj4gbmVlZCB0
byBzYXZlL3Jlc3RvcmUgdGhlIGVudGlyZSBjb250ZXh0IHN0cnVjdHVyZS4NCj4gDQo+IEJ1dCBJ
IGFsc28gZG9uJ3QgdW5kZXJzdGFuZCB3aHkgeW91IG5lZWQgdG8gcmUtZG8gdGhlIHRyYW5zbGF0
aW9uDQo+IGhlcmU6IEp1c3QgYWJvdmUgb2YgdGhpcyBodW5rIHlvdSd2ZSBhbHRlcmVkIHRoZSBj
YWxsIHRvDQo+IGh2bV90cmFuc2xhdGVfZ2V0X3BhZ2UoKSB0byBnaXZlIHlvdSB0aGUgZ2ZuLiBB
bmQgaWYgdGhlcmUgd2FzDQo+IGEgcmVhc29uIHRvIHJlLWRvIGl0IGZvciB0aGUgc2VuZGluZyBv
ZiB0aGUgZXZlbnQsIHRoZW4gaXQgc2hvdWxkDQo+IGJlIHJlc3RyaWN0ZWQgdG8gdGhhdCBjYXNl
cywgaS5lLiB1bi1tb25pdG9yZWQgVk1zIHNob3VsZCBub3QgYmUNCj4gaW1wYWN0ZWQuDQoNCkkg
d2lsbCByZWZhY3RvciB0aGUgY29kZSBoZXJlIHNvIGFzIG5vdCB0byBoYXZlIHRoZSANCmh2bWVt
dWxfbGluZWFyX3RvX3BoeXMoKSBoZXJlIGJ1dCByYXRoZXIgaW4gdGhlIHNlbmRfZXZlbnQgZnVu
Y3Rpb24uDQoNCj4gDQo+PiBAQCAtMTIyNCw3ICsxMjkzLDM1IEBAIGludCBodm1lbXVsX2luc25f
ZmV0Y2goDQo+PiAgICAgICAgICAgY29udGFpbmVyX29mKGN0eHQsIHN0cnVjdCBodm1fZW11bGF0
ZV9jdHh0LCBjdHh0KTsNCj4+ICAgICAgIC8qIENhcmVmdWwsIGFzIG9mZnNldCBjYW4gd3JhcCBv
ciB0cnVuY2F0ZSBXUlQgaW5zbl9idWZfZWlwLiAqLw0KPj4gICAgICAgdWludDhfdCBpbnNuX29m
ZiA9IG9mZnNldCAtIGh2bWVtdWxfY3R4dC0+aW5zbl9idWZfZWlwOw0KPj4gKyAgICBwYWRkcl90
IGdwYTsNCj4+ICsgICAgdWludDMyX3QgcGZlYyA9IFBGRUNfcGFnZV9wcmVzZW50IHwgUEZFQ19p
bnNuX2ZldGNoOw0KPj4gKyAgICB1bnNpZ25lZCBsb25nIGFkZHIsIHJlcHMgPSAxOw0KPj4gKyAg
ICBpbnQgcmM7DQo+PiArICAgIHN0cnVjdCBodm1fZW11bGF0ZV9jdHh0IG9sZDsNCj4+ICsNCj4+
ICsgICAgcmMgPSBodm1lbXVsX3ZpcnR1YWxfdG9fbGluZWFyKHNlZywgb2Zmc2V0LCBieXRlcywg
JnJlcHMsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBodm1fYWNjZXNz
X2luc25fZmV0Y2gsIGh2bWVtdWxfY3R4dCwgJmFkZHIpOw0KPiANCj4gVGhlIGRvdWJsZSB0cmFu
c2xhdGlvbiBpcyBhcyBwcm9ibGVtYXRpYyBoZXJlLCBidXQgd2hhdCdzIHdvcnNlOg0KPiANCj4+
ICsgICAgaWYgKCByYyA9PSBYODZFTVVMX0VYQ0VQVElPTiApDQo+PiArICAgIHsNCj4+ICsgICAg
ICAgIHg4Nl9lbXVsX3Jlc2V0X2V2ZW50KGN0eHQpOw0KPj4gKyAgICAgICAgcmMgPSBYODZFTVVM
X09LQVk7DQo+PiArICAgIH0NCj4gDQo+IFlvdSB6YXAgYW4gZXJyb3IgaGVyZSwgYnV0IC4uLg0K
DQpJbiB0aGlzIGNhc2UgaHZtZW11bF92aXJ0dWFsX3RvX2xpbmVhcigpIGNhbiBjYWxsDQp4ODZf
ZW11bF9od19leGNlcHRpb24oKSBhbmQgdGhlbiBzaWduYWxzIHRoZSBjYWxsZXIgdG8gaW5qZWN0
IHRoZSANCmV4Y2VwdGlvbi4gSSBkb247dCB3YW50IHRvIGluamVjdCBhIG5vbi11c2VyIHNlZ21l
bnQgaGVyZSBhbmQgc28gSSBsZWF2ZSANCnRoZSBjdHh0IGFzIGl0IHdhcyBiZWZvcmUuDQoNCj4g
DQo+PiArICAgIGlmICggaHZtZW11bF9jdHh0LT5zZWdfcmVnW3g4Nl9zZWdfc3NdLmRwbCA9PSAz
ICkNCj4+ICsgICAgICAgIHBmZWMgfD0gUEZFQ191c2VyX21vZGU7DQo+PiArDQo+PiArICAgIG9s
ZCA9ICpodm1lbXVsX2N0eHQ7DQo+PiArICAgIHJjID0gaHZtZW11bF9saW5lYXJfdG9fcGh5cyhh
ZGRyLCAmZ3BhLCBieXRlcywgJnJlcHMsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBwZmVjLCBodm1lbXVsX2N0eHQpOw0KPiANCj4gLi4uIHlvdSBoYXBwaWx5IHVzZSAiYWRk
ciIgaGVyZSBhbnl3YXkuDQoNClRoZSBhZGRyZXNzIGhlcmUgaXMgb2sgdG8gYmUgdXNlZCBvciBt
YXliZSBhIGlmICggcmMgIT0gWDg2RU1VTF9PS0FZICkgDQpjaGVjayBjYW4gYmUgcHV0IGFmdGVy
IGdldHRpbmcgdGhlIGFkZHJlc3MuDQoNCj4gDQo+PiArICAgIGlmICggcmMgPT0gWDg2RU1VTF9F
WENFUFRJT04gKQ0KPj4gKyAgICB7DQo+PiArICAgICAgICAqaHZtZW11bF9jdHh0ID0gb2xkOw0K
Pj4gKyAgICAgICAgcmMgPSBYODZFTVVMX09LQVk7DQo+PiArICAgIH0NCj4+ICAgDQo+PiArICAg
IGlmICggZ3BhICYmIGh2bWVtdWxfc2VuZF92bV9ldmVudChncGEsIGFkZHIsIGdhZGRyX3RvX2dm
bihncGEpLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGZlYywg
aHZtZW11bF9jdHh0KSApDQo+PiArICAgICAgICByZXR1cm4gWDg2RU1VTF9BQ0NFU1NfRVhDRVBU
SU9OOw0KPiANCj4gSXMgdGhlcmUgYW55dGhpbmcgcmVuZGVyaW5nIGdwYSBiZWluZyB6ZXJvIGFu
IGludmFsaWQgLyBpbXBvc3NpYmxlDQo+IHNpdHVhdGlvbj8NCg0KSW4gdGVzdHMgSSBjYW1lIGFj
cm9zcyBncGEgPT0gMCBzbyB0aGF0IGlzIHdoeSB0aGUgY2hlY2sgd2FzIHRoZXJlIEkgDQp3aWxs
IGhhdmUgdG8gdGVzdCBpcyB0aGlzIGNhbiBiZSBzb2x2ZWQgd2l0aCB0aGUgWDg2RU1VTF9PS0FZ
IGNoZWNrIGZyb20gDQphYm92ZS4NCg0KQWxleA0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
