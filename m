Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC355CB54
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2019 10:13:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiDsV-0007fY-01; Tue, 02 Jul 2019 08:11:02 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=oS2Z=U7=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1hiDsS-0007fS-SP
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2019 08:11:00 +0000
X-Inumbo-ID: ec3a0f59-9ca0-11e9-8980-bc764e045a96
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0e::724])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ec3a0f59-9ca0-11e9-8980-bc764e045a96;
 Tue, 02 Jul 2019 08:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GsvI76ap1SJXrC57mCLIgKeNQFmxhtzBLC3xsSjx870=;
 b=xL8QPeu7SKvziPSR577lPQ/5gwV7KQpzjqQK3KKCOQ9LQJuZ/zfEuwycGMRbh6KSQmeXM/o5ccuDMnWCd4AT/XwjElarVxpj062rMwjE20V9MgFwJD5gu8wP2ailDwfMEYVWEj0PqdeY3aAuWQL4hUZR/oiydIzFaEuag0mUYMk=
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com (10.171.106.11) by
 VI1PR0202MB3327.eurprd02.prod.outlook.com (52.134.15.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Tue, 2 Jul 2019 08:10:56 +0000
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::dd50:3e97:1d64:5aa3]) by VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::dd50:3e97:1d64:5aa3%4]) with mapi id 15.20.2032.019; Tue, 2 Jul 2019
 08:10:56 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <JBeulich@suse.com>
Thread-Topic: [PATCH v5] x86/emulate: Send vm_event from emulate
Thread-Index: AQHVMA7WPzdd4ckrE0m6/AH0OcBhs6a2CYCA///QXACAAD23gP//0oIAgAE/1YD//865gAAAUpyA
Date: Tue, 2 Jul 2019 08:10:56 +0000
Message-ID: <3f615acc-01d7-3c5c-13ab-42df23cb2172@bitdefender.com>
References: <fb2a4d3e-b477-11a5-7b5e-4a236acd60dd@suse.com>
 <0b12721c-8820-7227-1079-0bd1f5587287@bitdefender.com>
 <3fa5932d-174c-9b57-3cb6-aab4eb6a5238@suse.com>
 <e38967e1-1705-5a3f-9601-a9a4b68f3ead@bitdefender.com>
 <031156bc-936f-79e0-e1ca-3e49a1274c71@suse.com>
 <23adc806-181b-8190-06ed-84e654628424@bitdefender.com>
 <193216ae-a9f5-4d83-4acd-c6786bb2ccbb@suse.com>
In-Reply-To: <193216ae-a9f5-4d83-4acd-c6786bb2ccbb@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR0P264CA0240.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1e::36) To VI1PR0202MB2928.eurprd02.prod.outlook.com
 (2603:10a6:800:e3::11)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0a7c4b55-bea8-447e-b44f-08d6fec4cf3d
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:VI1PR0202MB3327; 
x-ms-traffictypediagnostic: VI1PR0202MB3327:|VI1PR0202MB3327:
x-microsoft-antispam-prvs: <VI1PR0202MB332770C81FBEDF31F0BDA92BABF80@VI1PR0202MB3327.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-forefront-prvs: 008663486A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(366004)(136003)(396003)(346002)(376002)(189003)(199004)(66446008)(66476007)(229853002)(66556008)(64756008)(31686004)(102836004)(11346002)(478600001)(66946007)(76176011)(446003)(26005)(2906002)(186003)(14454004)(7416002)(305945005)(7736002)(476003)(486006)(2616005)(8936002)(99286004)(73956011)(6116002)(53936002)(6916009)(3846002)(316002)(54906003)(6246003)(14444005)(6512007)(52116002)(68736007)(256004)(25786009)(4326008)(31696002)(6436002)(36756003)(86362001)(71200400001)(5660300002)(386003)(66066001)(6506007)(53546011)(8676002)(81156014)(81166006)(6486002)(71190400001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0202MB3327;
 H:VI1PR0202MB2928.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: CFc5pBM2Q7twAbAk8cPDTJk2FGqx3+y+uuO0i2X5fJhof1sEAKMlALn16kLOHirXtV/ZJDToT++uR/haQcVJT5HTINHd27QqcpVGnSpU1hhSoKf1R839pUgfuV6lZu4+nYR0ncmo13CE7sU+U6RHa1lN1VTowf2zFQTgZOgYfzplWGA7i1xUpkwk/thXNeGNihs2eQ5HbTqxMLzgIcRJHuXHiUD8VFWnnTUhiz+OalJPo9+QMq1hin6vM3U8C55woU6AjWYVbuMPRIhwvg/bmRx2iOa0Dh52qmN5boiwUwPAFExo2wLofPDW5kuOT8W1WksGbxt0U9h7xJOZTHMC3g5jPk4TTJcSz8hkFKSdAJzqtZhDCcUu/Vpxa6QORSpypgdw7tZPOZXV9+8nhzfH/NFf4uvRd/7Mlh4ATEjd/t4=
Content-ID: <B64400743A84DD4A98581C7677FB878F@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a7c4b55-bea8-447e-b44f-08d6fec4cf3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2019 08:10:56.6799 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aisaila@bbu.bitdefender.biz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0202MB3327
Subject: Re: [Xen-devel] [PATCH v5] x86/emulate: Send vm_event from emulate
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
Cc: Wei Liu <wl@xen.org>, "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "tamas@tklengyel.com" <tamas@tklengyel.com>,
 "jun.nakajima@intel.com" <jun.nakajima@intel.com>,
 "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 PaulDurrant <Paul.Durrant@citrix.com>,
 "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 "brian.woods@amd.com" <brian.woods@amd.com>,
 RogerPauMonne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDAyLjA3LjIwMTkgMTE6MDEsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwMi4wNy4y
MDE5IDA5OjU4LCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToNCj4+DQo+Pg0KPj4gT24g
MDEuMDcuMjAxOSAxODo1MywgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMDEuMDcuMjAxOSAx
NzozNiwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6DQo+Pj4+IE9uIDAxLjA3LjIwMTkg
MTc6NTUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+Pj4gT24gMDEuMDcuMjAxOSAxNjo0NSwgQWxl
eGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6DQo+Pj4+Pj4gT24gMDEuMDcuMjAxOSAxNjoxMywg
SmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+Pj4+Pj4+IE9uIDA0LjA2LjE5IGF0IDEzOjQ5LCA8YWlz
YWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3RlOg0KPj4+Pj4+Pj4gKyAgICBpZiAoICFyZXEudS5t
ZW1fYWNjZXNzLmZsYWdzICkNCj4+Pj4+Pj4+ICsgICAgICAgIHJldHVybiBmYWxzZTsgLyogbm8g
dmlvbGF0aW9uICovDQo+Pj4+Pj4+DQo+Pj4+Pj4+IEhvdyBpcyB0aGUgImZhbHNlIiBoZXJlIChJ
IHRoaW5rIHRoaXMgaXMgdGhlIG9uZSB0aGUgZGVzY3JpcHRpb24gdGFsa3MNCj4+Pj4+Pj4gYWJv
dXQpIG1hdGNoaW5nIHVwIHdpdGggdGhlIHZhcmlvdXMgb3RoZXIgb25lcyBpbiB0aGUgZnVuY3Rp
b24/DQo+Pj4+Pj4NCj4+Pj4+PiBUaGVyZSBzaG91bGQgYmUgbm8gZXZlbnQgaWYgdGhlcmUgaXMg
bm8gYWNjZXNzIHZpb2xhdGlvbi4gU28gaW4gdGhpcw0KPj4+Pj4+IGNhc2UgdGhlIGVtdWxhdGlv
biBpcyBjb250aW51ZWQgYXMgZXhwZWN0ZWQuDQo+Pj4+Pg0KPj4+Pj4gQnV0IHRoaXMgZG9lc24n
dCBhbnN3ZXIgbXkgcXVlc3Rpb246IFlvdSB1c2UgImZhbHNlIiBhcyByZXR1cm4gdmFsdWUNCj4+
Pj4+IHRvIGluZGljYXRlIGRpZmZlcmVudCB0aGluZ3MuIE9ubHkgdGhlIG9uZSBoZXJlIG1lYW5z
ICJubyBhY2Nlc3MNCj4+Pj4+IHZpb2xhdGlvbiIuDQo+Pj4+DQo+Pj4+IFNvcnJ5IGFib3V0IHRo
YXQsIHNpbmNlIHRoaXMgd2lsbCByZW1haW4gdGhlIG9ubHkgcmV0dXJuIGZhbHNlIGFwYXJ0DQo+
Pj4+IGZvcm0gdGhlIG1haW4gb25lIChyZXR1cm4gbW9uaXRvcl90cmFwcygpKSwgZmFsc2UgID0g
ZXZlbnQgd2FzIG5vdCBzZW50DQo+Pj4+IGFuZCB0cnVlID0gZXZlbnQgd2FzIHNlbnQuDQo+Pj4+
DQo+Pj4+IEkgdW5kZXJzdGFuZCB0aGF0IHlvdSBhcmUgYXNraW5nIGFib3V0IHRoZSBzY2VuYXJp
byB3aGVuIHRoZXJlIHdhcyBhDQo+Pj4+IHZpb2xhdGlvbiBhbmQgdGhlIGV2ZW50IHdhcyBub3Qg
c2VudC4gVGhlbiBJIGNhbiBpc3N1ZSBhIGRvbWFpbl9jcmFzaCgpDQo+Pj4+IGFzIHRoYXQgaXMg
cG90ZW50aWFsbHkgYSBiaWcgaXNzdWUuDQo+Pj4+DQo+Pj4+IEkgaG9wZSBJIGdvdCB0aGF0IGNv
cnJlY3RseS4NCj4+Pg0KPj4+IEkgZG9uJ3QgZ2V0IHRoZSBpbXByZXNzaW9uIHRoYXQgeW91IGRp
ZC4gSSBjb3VudCBhIHRvdGFsIG9mIGZvdXINCj4+PiAicmV0dXJuIGZhbHNlIiBpbiB0aGUgZnVu
Y3Rpb24sIG9ubHkgb25lIG9mIHdoaWNoIGV4cGxpY2l0bHkgbWVhbnMNCj4+PiAibm8gYWNjZXNz
IHZpb2xhdGlvbiIgKG90aGVycyBtYXkgaGF2ZSB0aGF0IG1lYW5pbmcgaW1wbGljaXRseSkuIExl
dCdzDQo+Pj4gdGFrZSB0aGUgcDJtX2dldF9tZW1fYWNjZXNzKCkgZmFpbHVyZSBjYXNlIGFzIGFu
IGV4YW1wbGU6IFdoYXQgSSBkb24ndA0KPj4+IHVuZGVyc3RhbmQgaXMgd2h5IHRoaXMgY2FzZSBh
bmQgdGhlICJubyBhY2Nlc3MgdmlvbGF0aW9uIiBvbmUgYXJlIGJvdGgNCj4+PiBtZWFudCB0byBi
ZSB0cmVhdGVkIHRoZSBzYW1lLg0KPj4NCj4+IFJpZ2h0LCBhdCB0aGUgbW9tZW50LCBmYWxzZSBt
ZWFucyB0aGF0IGVtdWxhdGlvbiBzaG91bGQgY29udGludWUgYW5kDQo+PiB0cnVlIG1lYW5zIHRo
YXQgZW11bGF0aW9uIHNob3VsZCBzdG9wLiBJZiBpdCBpcyBhIG11c3QgdGhhdCBJIHJldHVybg0K
Pj4gZGlmZmVyZW50IGVycm9ycyBJIHdpbGwgY2hhbmdlIHRoYXQgaW4gdGhlIG5leHQgdmVyc2lv
biBidXQgaW4gdGhlIHdheQ0KPj4gdGhhdCB0aGUgY29kZSBpcyByaWdodCBub3cgdGhleSB3aWxs
IGJlIHRyZWF0ZWQgdGhlIHNhbWUgd2F5Lg0KPiANCj4gQWdhaW4gLSBpdCdzIG5vdCBhIHJlcXVp
cmVtZW50LiBJdCBkZXBlbmRzIG9uIHdoZXRoZXIgdGhlIGJlaGF2aW9yIGlzDQo+IGludGVuZGVk
IHRvIGJlIHRoYXQgd2F5LiBJZiBpdCBpcywgaXQgc2hvdWxkIGJlIGNsYXJpZmllZCBpbiB0aGUN
Cj4gZGVzY3JpcHRpb24gb3IgbWF5YmUgYmV0dGVyIGluIGEgY29kZSBjb21tZW50LiBCdXQgdG8g
bWUsIHdpdGhvdXQgc3VjaA0KPiBhIGNsYXJpZmljYXRpb24sIGl0IGRvZXNuJ3QgbG9vayBsaWtl
IGl0IHNob3VsZCBiZSB0aGF0IHdheS4NCj4gDQoNClNob3J0IGFuc3dlciBpcyB5ZXMsIHRoZSBi
ZWhhdmlvciBpcyB0aGUgc2FtZSBhbmQgaXQgZG9lcyBub3QgbmVlZCBhbnkgDQpkaWZmZXJlbnRp
YXRpb24sIEkgd2lsbCBjbGFyaWZ5IHRoaXMgaW4gYSBjb21tZW50IGFuZCBpbiB0aGUgY29tbWl0
IA0KY29tbWVudCwgc29ycnkgZm9yIG1pc3VuZGVyc3RhbmRpbmcgdGhlIGZpcnN0IGNvbW1lbnQu
DQoNClJlZ2FyZHMsDQpBbGV4DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
