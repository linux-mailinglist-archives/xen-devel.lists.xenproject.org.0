Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC731630D
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2019 13:47:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNyXH-00041V-2E; Tue, 07 May 2019 11:45:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TwkR=TH=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1hNyXG-00041Q-BB
 for xen-devel@lists.xenproject.org; Tue, 07 May 2019 11:45:26 +0000
X-Inumbo-ID: 94ad6bb6-70bd-11e9-8941-5b29b5fe8334
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.4.101]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 94ad6bb6-70bd-11e9-8941-5b29b5fe8334;
 Tue, 07 May 2019 11:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I1H3KqAoV1jmtpkaXnRJaC/wre75+24flXp8WajYEGU=;
 b=fBFzcnGpScvySU1DZpZhpzqKXIeJxKnQpYCpZ/4jZlIIBpjwa4uyqUF0hjqLFqHK8RXYmhW9jazouCgDhrnqXxX/CI4mmCYszfjDQ3HVj8SL4EkincACJla4S6fkbdWnW9ai4oY21S+hUZ6DTNrqA0OFuL7emLJn5HPaELNW5uY=
Received: from DB6PR0202MB2917.eurprd02.prod.outlook.com (10.171.76.8) by
 DB6PR0202MB2696.eurprd02.prod.outlook.com (10.169.211.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.12; Tue, 7 May 2019 11:45:13 +0000
Received: from DB6PR0202MB2917.eurprd02.prod.outlook.com
 ([fe80::3007:eb13:8641:df77]) by DB6PR0202MB2917.eurprd02.prod.outlook.com
 ([fe80::3007:eb13:8641:df77%9]) with mapi id 15.20.1856.012; Tue, 7 May 2019
 11:45:13 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <JBeulich@suse.com>
Thread-Topic: [PATCH RFC v3 2/2] x86/emulate: Send vm_event from emulate
Thread-Index: AQHUvhsBUpx0sKZTt0qgTjw+lHK4bKYyxHqAgC1T9gA=
Date: Tue, 7 May 2019 11:45:13 +0000
Message-ID: <2cf1aac9-5ddf-f1c1-9520-ed5f14544b53@bitdefender.com>
References: <20190206125314.10869-1-aisaila@bitdefender.com>
 <20190206125314.10869-2-aisaila@bitdefender.com>
 <5CAB69AB0200007800225785@prv1-mh.provo.novell.com>
In-Reply-To: <5CAB69AB0200007800225785@prv1-mh.provo.novell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR06CA0050.eurprd06.prod.outlook.com
 (2603:10a6:208:aa::27) To DB6PR0202MB2917.eurprd02.prod.outlook.com
 (2603:10a6:4:b1::8)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 299471d1-8d65-4245-4e8e-08d6d2e1776e
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:DB6PR0202MB2696; 
x-ms-traffictypediagnostic: DB6PR0202MB2696:|DB6PR0202MB2696:
x-microsoft-antispam-prvs: <DB6PR0202MB2696FF0274A2E335667E2FF3AB310@DB6PR0202MB2696.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0030839EEE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(39860400002)(396003)(376002)(136003)(346002)(189003)(199004)(2906002)(386003)(31686004)(4326008)(305945005)(6246003)(6486002)(31696002)(102836004)(53936002)(6916009)(68736007)(66066001)(71200400001)(86362001)(5660300002)(26005)(71190400001)(73956011)(6512007)(76176011)(66476007)(66946007)(66556008)(64756008)(52116002)(66446008)(478600001)(6436002)(36756003)(53546011)(54906003)(6506007)(14454004)(486006)(11346002)(81166006)(476003)(25786009)(99286004)(229853002)(2616005)(446003)(8676002)(7736002)(81156014)(186003)(316002)(8936002)(3846002)(14444005)(256004)(6116002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB6PR0202MB2696;
 H:DB6PR0202MB2917.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vKnzWxxHCy8ngv69mcoHwTXB9p69l485AvT4B91gYzMTjjKV2hRBTjpkecE6Rq7cDzU8T4enmnQJK2d//mc2S5soHtNzaCkIv9K/4DMWIjK+xPitDQ4xK5eGwQ/yxjX0dU/g/+dattCWmuoY5zttmJjsbd7xGsRrtCta2C0pwB3Q1WHMnpBgBXyIXTkmHnyOBH7iJYUbPIftFoXNgv82C2WE0r5g2TUJ/xQUy+5xj7G8A85mWpsMhaOrBj6uqOJWpOUkK1XlzfJJDGCOpzPZsLn1czWTRtLJdjQqMgxSgQZ+mu98unlWjOnT8NcZPtjY01u5XHMxIUTZD3ayHdBBLzeoaDG0AigZ8h4Pr/CjiVt2qiGr5vY70BPVzjLgOeYP1IBNz17vdwr4Bnrkhea5seKuiiTWI3PGurSlR9SeG7E=
Content-ID: <073DF0277068F84C908CC0CF28ECEE7B@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 299471d1-8d65-4245-4e8e-08d6d2e1776e
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2019 11:45:13.6309 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0202MB2696
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

DQoNCk9uIDA4LjA0LjIwMTkgMTg6MzIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+PiBPbiAwNi4w
Mi4xOSBhdCAxMzo1MywgPGFpc2FpbGFAYml0ZGVmZW5kZXIuY29tPiB3cm90ZToNCj4+IFRoaXMg
cGF0Y2ggYWltcyB0byBoYXZlIG1lbSBhY2Nlc3Mgdm0gZXZlbnRzIHNlbnQgZnJvbSB0aGUgZW11
bGF0b3IuDQo+PiBUaGlzIGlzIHVzZWZ1bCBpbiB0aGUgY2FzZSBvZiBwYWdlLXdhbGtzIHRoYXQg
aGF2ZSB0byBlbXVsYXRlDQo+PiBpbnN0cnVjdGlvbnMgaW4gYWNjZXNzIGRlbmllZCBwYWdlcy4N
Cj4gDQo+IEknbSBhZnJhaWQgdGhhdCBJIGNhbid0IG1ha2Ugc2Vuc2Ugb2YgdGhpczogSG93IGNv
dWxkICJwYWdlLXdhbGtzDQo+IGhhdmUgdG8gZW11bGF0ZSBpbnN0cnVjdGlvbnMiPyBJbnN0cnVj
dGlvbnMgY2FuIChhbmQgYWN0dWFsbHkgd2lsbCkNCj4gY2F1c2UgcGFnZSB3YWxrcyB0byBvY2N1
ci4gQW5kIHBhZ2Ugd2Fsa3MgaGl0dGluZyBhY2Nlc3MgZGVuaWVkDQo+IHBhZ2VzIG1heSB0cmln
Z2VyIGVtdWxhdGlvbiBvZiB0aGUgaW5zbiBoYXZpbmcgaW5pdGlhdGVkIHRoZSB3YWxrLg0KDQpJ
IGFpbWVkIGZvciB0aGUgaWRlYSB0aGF0IGFuIGVtdWxhdGVkIGluc3RydWN0aW9uIGNvdWxkIGNh
dXNlIGEgDQpwYWdlLXdhbGsgdGhhdCBpbiB0aGUgZW5kIGhpdHMgcHJvdGVjdGVkIHBhZ2VzLiBJ
IHdpbGwgY29ycmVjdCB0aGF0IHBhcnQgDQpvZiB0aGUgY29tbWVudC4NCg0KPiANCj4+IFdlIHVz
ZSBodm1lbXVsX21hcF9saW5lYXJfYWRkcigpIHJvIGludGVyY2VwdCByL3cgYWNjZXNzIGFuZA0K
Pj4gaHZtZW11bF9pbnNuX2ZldGNoKCkgdG8gaW50ZXJjZXB0IGV4ZWMgYWNjZXNzLg0KPj4NCj4+
IEZpcnN0IHdlIHRyeSB0byBzZW5kIGEgdm0gZXZlbnQgYW5kIGlmIHRoZSBldmVudCBpcyBzZW50
IHRoZW4gZW11bGF0aW9uDQo+PiByZXR1cm5zIFg4NkVNVUxfQUNDRVNTX0VYQ0VQVElPTi4gSWYg
dGhlIGV2ZW50IGlzIG5vdCBzZW50IHRoZW4gdGhlDQo+PiBlbXVsYXRpb24gZ29lcyBvbiBhcyBl
eHBlY3RlZC4NCj4gDQo+IFRoZSBtZWFuaW5nIG9mIHRoaXMgbmV3IGVtdWxhdG9yIHJldHVybiB2
YWx1ZSBuZWVkcyBleHBsYW5hdGlvbi4NCj4gSSBub3RpY2UgaXRzICNkZWZpbmUgaXMgYWxzbyBu
b3QgYWNjb21wYW5pZWQgYnkgYW55IGNvbW1lbnQuIEFuZA0KPiBhbnkgYWRkaXRpb24gb2YgYSBu
ZXcgZW11bGF0b3IgcmV0dXJuIGNvZGUgc2hvdWxkIGNvbWUgd2l0aCBhDQo+IGRpc2N1c3Npb24g
b2YgaG93IGV4aXN0aW5nIHVzZXJzIGFyZSBhZmZlY3RlZC4gSSdtIG5vdCBnb2luZyB0bw0KPiBl
eGNsdWRlIHRoYXQgaW5kZWVkIG5vIG90aGVyIGFkanVzdG1lbnRzIGFyZSBuZWNlc3NhcnksIGJ1
dCB0aGF0J3MNCj4gZmFyIGZyb20gb2J2aW91cy4gWW91IG1heSByZWNhbGwgdGhhdCBpdCBoYWQg
dGFrZW4gc2V2ZXJhbCBpdGVyYXRpb25zDQo+IHRvIGdldCB0aGUgYWRkaXRpb24gb2YgWDg2RU1V
TF9VTklNUExFTUVOVEVEIHJpZ2h0IHRocm91Z2hvdXQNCj4gdGhlIGNvZGUgYmFzZS4NCg0KVGhp
cyBuZXcgZmVhdHVyZSBpcyBhY3RpdmF0ZWQgYnkgImJvb2wgc2VuZF9ldmVudCIgd2hlbiBjYWxs
aW5nIA0KaHZtX2VtdWxhdGVfb25lX3ZtX2V2ZW50KCkuIEV2ZW50cyB3aWxsIGJlIHNlbnQgaW4g
c3BlY2lmaWMgbW9tZW50cyBhbmQgDQpvbmx5IGlmIGl0J3MgYW4gaW50ZW50aW9uIGZvciB0aGF0
Lg0KDQo+IA0KPiBPdmVyYWxsIEkgZ3Vlc3MgSSdtIHNpbXBseSBub3QgZGVlcGx5IGVub3VnaCBp
bnRvIHZtLWV2ZW50IHRvDQo+IGJlIGFibGUgdG8ganVkZ2Ugd2hldGhlciAvIGhvdyBhbGwgb2Yg
dGhpcyBtYWtlcyBzZW5zZS4NCj4gDQo+PiBAQCAtNTMwLDYgKzUzMiw1NSBAQCBzdGF0aWMgaW50
IGh2bWVtdWxfZG9fbW1pb19hZGRyKHBhZGRyX3QgbW1pb19ncGEsDQo+PiAgICAgICByZXR1cm4g
aHZtZW11bF9kb19pb19hZGRyKDEsIG1taW9fZ3BhLCByZXBzLCBzaXplLCBkaXIsIGRmLCByYW1f
Z3BhKTsNCj4+ICAgfQ0KPj4gICANCj4+ICtzdGF0aWMgYm9vbCBodm1lbXVsX3NlbmRfdm1fZXZl
bnQocGFkZHJfdCBncGEsIHVuc2lnbmVkIGxvbmcgZ2xhLCBnZm5fdCBnZm4sDQo+PiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IHBmZWMsIHN0cnVjdCBodm1fZW11
bGF0ZV9jdHh0ICpjdHh0KQ0KPiANCj4gV2h5IGJvdGggZ3BhIGFuZCBnZm4/DQoNCklmIHRoZSBn
cGEgY2FuIGJlIGNhbGN1bGF0ZWQgZnJvbSBnZm4gdGhlbiB0aGUgY29kZSB3aWxsIGJlIHNpbXBs
aWZpZWQuDQpJcyB0aGlzIHdoYXQgeW91IGhhZCBpbiBtaW5kPw0KDQpncGEgPSBnZm5fdG9fZ2Fk
ZHIoZ2ZuKTsNCg0KQWxleA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
