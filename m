Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B13DC7C255
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 14:55:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hso6p-0001TU-I2; Wed, 31 Jul 2019 12:53:35 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9/5j=V4=bitdefender.com=ppircalabu@srs-us1.protection.inumbo.net>)
 id 1hso6o-0001TM-LH
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 12:53:34 +0000
X-Inumbo-ID: 339fe35c-b392-11e9-8980-bc764e045a96
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe1f::710])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 339fe35c-b392-11e9-8980-bc764e045a96;
 Wed, 31 Jul 2019 12:53:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ice4IGH6/rbgIPSsorQT7P7EIbGce/EpXAHMN8pd6N94KdO4R57wrtwr6vnJnbNVQ8mfzxEv312rQPdi9uok3pzmp3hc5wLfeDU3D24hQ1aTQvQ5y8T7WvPlOR4vF9OmvWlsWndnl9RueP8yo2hs1hdWcb+7WlsEGbA6TWtfTwvunIyK+i7A5967CM6hLpwwu/HCvgwSdERs8WKn0up0YokFpeQhG9Ab/Z+oNDrRj3RkoJYAdqvM7yPtiQfZb1WZVKsZw4r+GAAF/G+t0y/X75+8inBxs1+1rsKZUfoY1gSECav/PcvFeAN/2hDFMl4NeTpUsV5xfGhKsSFKmTLPUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8WavfpQ6mUUNcAq9LKgWqObBT1IRksXA0zeuzDrIB8Y=;
 b=bHFQwxDwiswywJcviUbA4U4Y5kApUiP4H7FNFY4PCv/sTn5KZIZtc3fr9ZQQ8T4RP1JccVijfgaHVTrerUHur6CCaGWnVuUPU2VDh/w4qwtGn5ZZdcwno0dUQhLK+sA66ytV10ia9/la+QH+GjUk6yLPt4Vms+nuRPoY07VbzhSm7YBYVg7/34yWQj40y/3SWDQRqFCK4mHVKg6/iRKv538ZpmN0J+ZCvGUMBqVMOIExZ6qUmoWgaNxZlm0GJ5JWfcRo+WTbPEXcrRbmkLcqYixpVbo1IIh0jhsOrQk+fwnyUsds8LL1Kw4Cj945pxtn/fKfLtjpAMmzNJpPdE08FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=bitdefender.com;dmarc=pass action=none
 header.from=bitdefender.com;dkim=pass header.d=bitdefender.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8WavfpQ6mUUNcAq9LKgWqObBT1IRksXA0zeuzDrIB8Y=;
 b=u7/c1U+v+tyiNbtNU7WSQ/nLXKJYRJ/pT03SQK4SHJA1latYkGGDRXeBVzo79itpRP1CcAySwY2Gvc9VVh0HiS2SjXTROon/6v5oafjKzy7/bGjHaiHa7k/a/r1nLPH2gtyIbv18/Q6lmhjqBpoLVInlYBtPImklEtxqLGYhI9o=
Received: from AM6PR02MB4615.eurprd02.prod.outlook.com (20.177.198.89) by
 AM6PR02MB5621.eurprd02.prod.outlook.com (10.255.123.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.14; Wed, 31 Jul 2019 12:53:31 +0000
Received: from AM6PR02MB4615.eurprd02.prod.outlook.com
 ([fe80::b027:3d70:bb38:7b6c]) by AM6PR02MB4615.eurprd02.prod.outlook.com
 ([fe80::b027:3d70:bb38:7b6c%7]) with mapi id 15.20.2136.010; Wed, 31 Jul 2019
 12:53:31 +0000
From: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>
To: Jan Beulich <JBeulich@suse.com>
Thread-Topic: [PATCH v2 07/10] vm_event: Add vm_event_ng interface
Thread-Index: AQHVO/ji+ep3hd1WrES1BL2P0bM6cabOlq4AgABMy4CAAB8oAIABZ1KAgAAMwoCAFE8+AA==
Date: Wed, 31 Jul 2019 12:53:30 +0000
Message-ID: <2f0005b7f2ec4a7e35d6a64348becc4e9628d801.camel@bitdefender.com>
References: <cover.1563293545.git.ppircalabu@bitdefender.com>
 <cover.1563293545.git.ppircalabu@bitdefender.com>
 <79a1e2aebc55c20f58cb8c925320de202b17d8f2.1563293545.git.ppircalabu@bitdefender.com>
 <e1c9a42d-7bde-5749-7cf3-cb5e7b4041e1@suse.com>
 <de42faf2929b0ff0d52949d21dea5f2b30336840.camel@bitdefender.com>
 <20603303-440d-3ac4-8f78-861abaa78d70@suse.com>
 <22abf98c86af08adb0444ffa115bc56b9bd552fc.camel@bitdefender.com>
 <58a8a000-7dff-be57-7d75-f39abbd41f69@suse.com>
In-Reply-To: <58a8a000-7dff-be57-7d75-f39abbd41f69@suse.com>
Accept-Language: ro-RO, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR1PR01CA0003.eurprd01.prod.exchangelabs.com
 (2603:10a6:102::16) To AM6PR02MB4615.eurprd02.prod.outlook.com
 (2603:10a6:20b:6a::25)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ppircalabu@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 291475a7-ce65-4a08-8a2e-08d715b616ac
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM6PR02MB5621; 
x-ms-traffictypediagnostic: AM6PR02MB5621:|AM6PR02MB5621:
x-microsoft-antispam-prvs: <AM6PR02MB56217621B62C8E6D829FDE8CD6DF0@AM6PR02MB5621.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 011579F31F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(136003)(396003)(376002)(39860400002)(366004)(199004)(189003)(54906003)(11346002)(66476007)(5660300002)(14454004)(386003)(36756003)(71190400001)(53546011)(102836004)(76176011)(6506007)(99286004)(478600001)(2906002)(6512007)(305945005)(6246003)(316002)(6116002)(3846002)(118296001)(71200400001)(14444005)(8936002)(52116002)(66446008)(8676002)(476003)(256004)(25786009)(50226002)(81156014)(229853002)(2616005)(446003)(6436002)(86362001)(486006)(81166006)(7736002)(186003)(53936002)(66556008)(26005)(4326008)(7416002)(6916009)(64756008)(6486002)(68736007)(66066001)(66946007)(99106002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR02MB5621;
 H:AM6PR02MB4615.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: FMTPf7wt7eN7QP3zN/THWvzI7pJa7MMAWDRcFI0Y20lEfpT0mPO6RehcwFqHsdapBECQPV4cntYN+04aUDCH26NHvzmvRFa553Oj9cc+hZnnim4pGC0PzP710f0QdUrRc5xptSLd30A7u4T8CWmsCJMemEUW508ApfdkDzlu9gyNpaQSJYXoRz/O/sn5fFBn/aOJw0zSYILZTiWCkA3y7MXHgw5vYVWlMYFeWAKemEeRGz+WBdUUSPAJ6xRNfDy+ytYuiCo3fMg4YLFUdpiP/u+wc43dMbrDs9e8EYEhdCTA7P8TPO/NpTniDEWj7eTgTKHrDQGo02RbNeUrHVzUJRO6NXQ+vyPxVSzgp4SbZbOD1bUFTq5iS8tFYwHpXggpBKP0bnWM3X8tgk7V9XDG7qWacpTrIrrE8p2kWzkffCg=
Content-ID: <24C979E3A606F2448B860EA0F2040FD8@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 291475a7-ce65-4a08-8a2e-08d715b616ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2019 12:53:30.7410 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ppircalabu@bbu.bitdefender.biz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR02MB5621
Subject: Re: [Xen-devel] [PATCH v2 07/10] vm_event: Add vm_event_ng interface
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
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 JulienGrall <julien.grall@arm.com>, Paul Durrant <Paul.Durrant@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCAyMDE5LTA3LTE4IGF0IDE0OjQ0ICswMDAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4g
T24gMTguMDcuMjAxOSAxNTo1OSwgUGV0cmUgT3ZpZGl1IFBJUkNBTEFCVSB3cm90ZToNCj4gPiBC
ZWZvcmUgdXNpbmcgeGVuZm9yZWlnbm1lbW9yeV9tYXBfcmVzb3VyY2UgSSBpbnZlc3RpZ2F0ZWQg
c2V2ZXJhbA0KPiA+IGRpZmZlcmVudCBhcHByb2FjaGVzOg0KPiA+IC0gQWxsb2NhdGUgdGhlIG1l
bW9yeSBpbiBoeXBlcnZpc29yIGFuZCB4Y19tYXBfZm9yZWlnbl9wYWdlcw0KPiA+IChkb2Vzbid0
DQo+ID4gd29yayBiZWNhdXNlIHlvdSBjYW5ub3QgImZvcmVpZ25tYXAiIHBhZ2VzIG9mIHlvdXIg
b3duIGRvbWFpbi4NCj4gPiAtIEFsbG9jYXRlIHRoZSBtZW1vcnkgaW4gZ3Vlc3QsIGFuZCBtYXAg
dGhlIGFsbG9jYXRlZCBwYWdlcyBpbiBYRU4uDQo+ID4gVG8NCj4gPiBteSBrbm93bGVkZ2UgdGhl
cmUgaXMgbm8gc3VjaCBBUEkgaW4gbGludXggdG8gZG8gdGhpcyBhbmQgdGhlDQo+ID4gbW9uaXRv
cg0KPiA+IGFwcGxpY2F0aW9uLCBhcyBhbiB1c2Vyc3BhY2UgcHJvZ3JhbSwgaXMgbm90IGF3YXJl
IG9mIHRoZSBhY3R1YWwNCj4gPiBnZm5zDQo+ID4gZm9yIGFuIGFsbG9jYXRlZCBtZW1vcnkgYXJl
YS4NCj4gPiANCj4gPiBTbywgYXQgdGhpcyBwb2ludCB0aGUgbW9zdCBwcm9taXNpbmcgc29sdXRp
b24gaXMgYWxsb2NhdGluZyB0aGUNCj4gPiBtZW1vcnkNCj4gPiBpbiBYRU4sIHNoYXJpbmcgaXQg
d2l0aCBJRCB1c2luZyBzaGFyZV94ZW5fcGFnZV93aXRoX2d1ZXN0LCBhbmQNCj4gPiBtYXBwaW5n
DQo+ID4gaXQgd2l0aCB4ZW5mb3JlaWdubWVtb3J5X21hcF9yZXNvdXJjZSAod2l0aCB0aGUgZmxh
Zw0KPiA+IFhFTk1FTV9yc3JjX2FjcV9jYWxsZXJfb3duZWQgc2V0KQ0KPiANCj4gV2hpY2ggaXMg
ZmluZSAtIHRoYXQncyB3aHkgUGF1bCBoYWQgaW50cm9kdWNlZCB0aGUgZ2VuZXJpYyBpbnRlcmZh
Y2UuDQo+IA0KPiA+IFRvIG15IHVuZGVyc3RhbmRpbmcgdGhlIGNsZWFudXAgc2VxdWVuY2UgZnJv
bQ0KPiA+IGdudHRhYl91bnBvcHVsYXRlX3N0YXR1c19mcmFtZXMgYmFzaWNhbGx5IGJvaWxzIGRv
d24gdG86DQo+ID4gMS4gZ3Vlc3RfcGh5c21hcF9yZW1vdmVfcGFnZQ0KPiA+IDIuIGlmICggdGVz
dF9hbmRfY2xlYXJfYml0KF9QR0NfYWxsb2NhdGVkLCAmcGctPmNvdW50X2luZm8pICkNCj4gPiAg
ICAgICAgIHB1dF9wYWdlKHBnKTsNCj4gPiAzLiBmcmVlX3hlbmhlYXBfcGFnZQ0KPiANCj4gWW91
J3JlIG1pc3NpbmcgdGhlIGNydWNpYWwgcGFydCBvZiB1bmRvaW5nIHN0ZXAgMiBpZiB5b3UgZmlu
ZA0KPiB0aGF0IHRoZXJlIGFyZSBzdGlsbCByZWZlcmVuY2VzIGxlZnQgdG8gdGhlIHBhZ2UuDQo+
IA0KPiBBbmQgdGhlbiwgYmVjYXVzZSBvZiB5b3VyIHVzZSBvZiB2emFsbG9jKCksIHlvdSBjYW4n
dCB1c2UNCj4gZnJlZV94ZW5oZWFwX3BhZ2VzKCksIGFzIHRoYXQgdGFrZXMgYSAoZGlyZWN0IG1h
cCkgbGluZWFyIGFkZHJlc3MNCj4gYXMgaW5wdXQuIEl0IGhhcyB0byBiZSBmcmVlX2RvbWhlYXBf
cGFnZXMoKSBpbiB5b3VyIGNhc2UuDQo+IA0KPiA+IE15IGN1cnJlbnQgaW1wbGVtZW50YXRpb24g
dXNlcyB2emFsbG9jIGluc3RlYWQgb2YNCj4gPiBhbGxvY194ZW5oZWFwX3BhZ2VzDQo+ID4gYW5k
IHRoYXQncyB3aHkgSSBhc3N1bWVkIHZ1bm1hcCBhbmQgZnJlZV9kb21oZWFwX3BhZ2VzIHdpbGwg
c3VmZmljZQ0KPiA+IChJDQo+ID4gd291bGQgaGF2ZSBjYWxsZWQgdmZyZWUgZGlyZWN0bHksIGJ1
dCB0aGUgdGVtcG9yYXJ5IGxpbmtlZCBsaXN0DQo+ID4gdGhhdCBpcw0KPiA+IHVzZWQgdG8gaG9s
ZCB0aGUgcGFnZSByZWZlcmVuY2VzIGNhdXNlcyBmcmVlX2RvbWhlYXBfcGFnZXMgdG8NCj4gPiBj
cmFzaCkNCj4gPiANCj4gPiBEbyBJIGFsc28gaGF2ZSB0byBjYWxsIGd1ZXN0X3BoeXNtYXBfcmVt
b3ZlX3BhZ2UgYW5kIHB1dF9wYWdlPw0KPiA+IChzdGVwcw0KPiA+IDEuIGFuZCAyLikNCj4gDQo+
IGd1ZXN0X3BoeXNtYXBfcmVtb3ZlX3BhZ2UoKSBuZWVkcyB0byBiZSBjYWxsZWQgZm9yIHRyYW5z
bGF0ZWQgcGFnZS0NCj4gb3duaW5nIGRvbWFpbnMgaWYgdGhlIHBhZ2Ugd2FzIGV2ZXIgYWRkZWQg
dG8gdGhlaXIgcGh5c21hcC4gQXMgbG9uZw0KPiBhcyB5b3UgYXZvaWQgYWRkaW5nLCB5b3UgYWxz
byBkb24ndCBuZWVkIHRvIHJlbW92ZS4gSSBkb24ndCByZWNhbGwNCj4gdGhvdWdoIHdoZXRoZXIg
YSB0cmFuc2xhdGVkIGRvbWFpbiBjYW4gYWNjZXNzIGEgcmVzb3VyY2Ugd2l0aG91dCBpdA0KPiBo
YXZpbmcgYSByZXByZXNlbnRhdGlvbiBpbiBpdHMgR0ZOIHNwYWNlLg0KPiANCkkndmUgdHJhY2Vk
IHRoZSBHRk4gdmFsdWUgZm9yIHRoZSBzaGFyZWQgTUZOIGFuZCBpdCdzIGludmFsaWQuIEl0J3Mg
c2V0DQp0byBJTlZBTElEX00yUF9FTlRSWSBpbiBzaGFyZV94ZW5fcGFnZV93aXRoX2d1ZXN0LCBi
dXQgSSB3YXMgZXhwZWN0aW5nDQppdCB0byBiZSBzZXQgdG8gdmFsaWQgdmFsdWUgbGF0ZXIgb24g
KGUuZy4geGVubWVtX2FkZF90b19waHlzbWFwKS4gDQpBbSBJIG1pc3Npbmcgc29tZXRoaW5nPyAN
Cg0KTWFueSB0aGFua3MsDQpQZXRyZQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
