Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C1F5C06A
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2019 17:39:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hhyLo-00014X-UT; Mon, 01 Jul 2019 15:36:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QKbV=U6=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1hhyLn-00014R-G8
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2019 15:36:15 +0000
X-Inumbo-ID: f4fb622f-9c15-11e9-8980-bc764e045a96
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe09::71e])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f4fb622f-9c15-11e9-8980-bc764e045a96;
 Mon, 01 Jul 2019 15:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vd9dgQW19qoucwCONnJzYcNKDlnF0HNzMBxVImsfMJY=;
 b=BugZt0gGchDgG/OmaesbTMSDqFGRonWEQTKkKWaBpMycZuXvEqTSOFDyrE/RBJ1NiJw6a6tvdoPBYymsnoixfJ85Xr4kWD/+B+QCiQdOJsRvAX5mDtrqu5EXmz+MeWQIQC2ODHItrdsVnKiD5CS3qC7JnrnKgdNoqKrBjCHhzm8=
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com (10.171.106.11) by
 VI1PR0202MB2720.eurprd02.prod.outlook.com (10.173.82.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Mon, 1 Jul 2019 15:36:10 +0000
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::dd50:3e97:1d64:5aa3]) by VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::dd50:3e97:1d64:5aa3%4]) with mapi id 15.20.2032.019; Mon, 1 Jul 2019
 15:36:10 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <JBeulich@suse.com>
Thread-Topic: [PATCH v5] x86/emulate: Send vm_event from emulate
Thread-Index: AQHVMA7WPzdd4ckrE0m6/AH0OcBhs6a2CYCA///QXACAAAtsgA==
Date: Mon, 1 Jul 2019 15:36:10 +0000
Message-ID: <e38967e1-1705-5a3f-9601-a9a4b68f3ead@bitdefender.com>
References: <fb2a4d3e-b477-11a5-7b5e-4a236acd60dd@suse.com>
 <0b12721c-8820-7227-1079-0bd1f5587287@bitdefender.com>
 <3fa5932d-174c-9b57-3cb6-aab4eb6a5238@suse.com>
In-Reply-To: <3fa5932d-174c-9b57-3cb6-aab4eb6a5238@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR1PR01CA0027.eurprd01.prod.exchangelabs.com
 (2603:10a6:102::40) To VI1PR0202MB2928.eurprd02.prod.outlook.com
 (2603:10a6:800:e3::11)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 98988db4-0b08-40d9-511b-08d6fe39d7b4
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:VI1PR0202MB2720; 
x-ms-traffictypediagnostic: VI1PR0202MB2720:|VI1PR0202MB2720:
x-microsoft-antispam-prvs: <VI1PR0202MB2720F0A81343A34E87FF4A09ABF90@VI1PR0202MB2720.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 00851CA28B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(366004)(396003)(346002)(136003)(376002)(199004)(189003)(8936002)(4326008)(25786009)(81166006)(81156014)(8676002)(86362001)(31696002)(478600001)(229853002)(68736007)(6486002)(66476007)(73956011)(66946007)(54906003)(36756003)(7736002)(6436002)(316002)(66446008)(256004)(64756008)(99286004)(6512007)(305945005)(52116002)(53936002)(66066001)(76176011)(6916009)(6246003)(7416002)(5660300002)(3846002)(102836004)(53546011)(6506007)(386003)(71190400001)(71200400001)(26005)(186003)(14444005)(486006)(2906002)(14454004)(6116002)(476003)(2616005)(11346002)(446003)(66556008)(31686004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0202MB2720;
 H:VI1PR0202MB2928.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: IKVdwkFP/RVJgv6y+DhqFP9ngiW5WdII3zVPtWp4NLzK2YwMkNU3/AC+sBhRdyYiBfbit1WnNn991ULGSyZ6mHztpcb8JUBZSrOIgtI1T56B5H7IF9UCkIe0nN0UDqeeRt/k0cc2vWM1LAnj/uBm/JlGJ+toRv8SVGtUvwyFv+FZvGHWj6i4K2WPDHAQMNp3KSj7RdLBFc0MJpTSGtsSz9ewb3WRCEuxgXGp9TSy5Fl6W18wtJCEPrzFsgwbeGm7g1ihKk4esGdeHPDb+BHsUofQmx2QdiYAvmdTGaM9yLIdXtA9Cott1BB9cYGhX2UpmnFwKedP0pOBkm9DXhY6ppNiiwydgOb/BKNHuNP4x+Q6zzpwUz8Oq7c1O59yzIqw+2+9C9jLI0vJlqLZe48qitoFiVkQ75aWbZi0lHWs2IE=
Content-ID: <1D2F20859662A04EB1A00FB4F8542E80@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98988db4-0b08-40d9-511b-08d6fe39d7b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2019 15:36:10.7745 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aisaila@bbu.bitdefender.biz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0202MB2720
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
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDAxLjA3LjIwMTkgMTc6NTUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwMS4wNy4y
MDE5IDE2OjQ1LCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToNCj4+IE9uIDAxLjA3LjIw
MTkgMTY6MTMsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+Pj4+IE9uIDA0LjA2LjE5IGF0IDEzOjQ5
LCA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3RlOg0KPj4+PiArICAgIGlmICggIXNlbmRf
ZXZlbnQgfHwgIXBmZWMgKQ0KPj4+PiArICAgICAgICByZXR1cm4gZmFsc2U7DQo+Pj4NCj4+PiBJ
IHRoaW5rIEkndmUgc2FpZCBiZWZvcmUgdGhhdCB0aGUgIXBmZWMgcGFydCBuZWVkIGFuIGV4cGxh
bmF0aW9uIChpbg0KPj4+IGEgY29tbWVudCkuIFdpdGhvdXQgc3VjaCBhbiBleHBsYW5hdGlvbiBJ
J20gaW5jbGluZWQgdG8gc2F5IGl0DQo+Pj4gc2hvdWxkIGJlIGRlbGV0ZWQuIElmIG90b2ggdGhp
cyBpcyBzaW1wbHkgbWVhbiB0byBiZSBhIHNob3J0Y3V0LA0KPj4+IHRoZW4geW91IHNob3VsZCBy
ZWFsbHkganVzdCBjaGVjayB0aGUgdHdvIGJpdHMgeW91IGFjdHVhbGx5IGNhcmUNCj4+PiBhYm91
dCBmdXJ0aGVyIGRvd24uDQo+Pg0KPj4gVGhlIHBmZWMgY2hlY2sgaXMgZG9uZSBiZWNhdXNlIEkg
ZW5jb3VudGVyZWQgcGZlYyAwIGluIHRlc3RzLiBJdCBjb3VsZA0KPj4gc2F2ZSBzb21lIHdvcmsg
aWYgcGZlYyA9PSAwIHdoZW4gY2FsbGluZyB0aGUgZnVuY3Rpb24uIElzIHRoZXJlDQo+PiBhIG11
c3QgaW4gaGF2aW5nIHRoaXMgY2hlY2sgcmVtb3ZlZD8gSWYgc28gdGhlbiBpdCBjYW4gYmUgZG9u
ZS4gVGhlDQo+PiBzZW5kX2V2ZW50IHdpbGwgYmUgY2hlY2tlZCBiZWZvcmUgY2FsbGluZyB0aGUg
ZnVuY3Rpb24gYXMgeW91IHNhaWQuDQo+IA0KPiBJdCdzIG5vdCBhIHJlcXVpcmVtZW50IGZvciBp
dCB0byBiZSByZW1vdmVkLCBfaWZfIHRoZXJlJ3MgYSBnb29kDQo+IHJlYXNvbiBmb3IgaXQgdG8g
YmUgdGhlcmUuIEkgZG9uJ3QsIGhvd2V2ZXIsIHNlZSBob3cgcGZlYz0wIGNvdWxkDQo+IGJlIGEg
cHJvYmxlbSAtIGFmYWljdCBpdCB3b3VsZCByZXR1cm4gZmFsc2UgYSBmZXcgbGluZXMgZnVydGhl
cg0KPiBkb3duIGluIHRoYXQgY2FzZS4NCg0KWW91IGFyZSByaWdodCwgcGZlYz0wIHdvbGQgbm90
IGJlIGEgcHJvYmxlbSBhbmQgaXQgd2lsbCBiZSBjYXVnaHQgaW4gdGhlIA0Kbm8gdmlvbGF0aW9u
IGlmLg0KDQo+IA0KPj4+PiArICAgIGlmICggIXJlcS51Lm1lbV9hY2Nlc3MuZmxhZ3MgKQ0KPj4+
PiArICAgICAgICByZXR1cm4gZmFsc2U7IC8qIG5vIHZpb2xhdGlvbiAqLw0KPj4+DQo+Pj4gSG93
IGlzIHRoZSAiZmFsc2UiIGhlcmUgKEkgdGhpbmsgdGhpcyBpcyB0aGUgb25lIHRoZSBkZXNjcmlw
dGlvbiB0YWxrcw0KPj4+IGFib3V0KSBtYXRjaGluZyB1cCB3aXRoIHRoZSB2YXJpb3VzIG90aGVy
IG9uZXMgaW4gdGhlIGZ1bmN0aW9uPw0KPj4NCj4+IFRoZXJlIHNob3VsZCBiZSBubyBldmVudCBp
ZiB0aGVyZSBpcyBubyBhY2Nlc3MgdmlvbGF0aW9uLiBTbyBpbiB0aGlzDQo+PiBjYXNlIHRoZSBl
bXVsYXRpb24gaXMgY29udGludWVkIGFzIGV4cGVjdGVkLg0KPiANCj4gQnV0IHRoaXMgZG9lc24n
dCBhbnN3ZXIgbXkgcXVlc3Rpb246IFlvdSB1c2UgImZhbHNlIiBhcyByZXR1cm4gdmFsdWUNCj4g
dG8gaW5kaWNhdGUgZGlmZmVyZW50IHRoaW5ncy4gT25seSB0aGUgb25lIGhlcmUgbWVhbnMgIm5v
IGFjY2Vzcw0KPiB2aW9sYXRpb24iLg0KDQpTb3JyeSBhYm91dCB0aGF0LCBzaW5jZSB0aGlzIHdp
bGwgcmVtYWluIHRoZSBvbmx5IHJldHVybiBmYWxzZSBhcGFydCANCmZvcm0gdGhlIG1haW4gb25l
IChyZXR1cm4gbW9uaXRvcl90cmFwcygpKSwgZmFsc2UgID0gZXZlbnQgd2FzIG5vdCBzZW50IA0K
YW5kIHRydWUgPSBldmVudCB3YXMgc2VudC4NCg0KSSB1bmRlcnN0YW5kIHRoYXQgeW91IGFyZSBh
c2tpbmcgYWJvdXQgdGhlIHNjZW5hcmlvIHdoZW4gdGhlcmUgd2FzIGEgDQp2aW9sYXRpb24gYW5k
IHRoZSBldmVudCB3YXMgbm90IHNlbnQuIFRoZW4gSSBjYW4gaXNzdWUgYSBkb21haW5fY3Jhc2go
KSANCmFzIHRoYXQgaXMgcG90ZW50aWFsbHkgYSBiaWcgaXNzdWUuDQoNCkkgaG9wZSBJIGdvdCB0
aGF0IGNvcnJlY3RseS4NCg0KPiANCj4+Pj4gQEAgLTYxNSw2ICs2NjksMTMgQEAgc3RhdGljIHZv
aWQgKmh2bWVtdWxfbWFwX2xpbmVhcl9hZGRyKA0KPj4+PiAgICAgDQo+Pj4+ICAgICAgICAgICAg
IGlmICggcGZlYyAmIFBGRUNfd3JpdGVfYWNjZXNzICkNCj4+Pj4gICAgICAgICAgICAgew0KPj4+
PiArICAgICAgICAgICAgaWYgKCBodm1fZW11bGF0ZV9zZW5kX3ZtX2V2ZW50KGFkZHIsIGdmbiwg
cGZlYywNCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBo
dm1lbXVsX2N0eHQtPnNlbmRfZXZlbnQpICkNCj4+Pj4gKyAgICAgICAgICAgIHsNCj4+Pj4gKyAg
ICAgICAgICAgICAgICBlcnIgPSBFUlJfUFRSKH5YODZFTVVMX1JFVFJZKTsNCj4+Pj4gKyAgICAg
ICAgICAgICAgICBnb3RvIG91dDsNCj4+Pj4gKyAgICAgICAgICAgIH0NCj4+Pg0KPj4+IEhvdyBj
b21lIHRoaXMgc2l0cyBvbmx5IG9uIHRoZSB3cml0ZSBwYXRoPw0KPj4NCj4+IFdlIGFyZSBpbnRl
cmVzdGVkIG9ubHkgZm9yIHRoZSB3cml0ZSBhY2Nlc3Mgb24gdGhpcyBwYXRoLiBUaGlzIGFsc28N
Cj4+IGVuc3VyZXMgdGhhdCBwZmVjIGlzIHNldC4NCj4gDQo+IEknbSBzb3JyeSwgYnV0IHRoZSBl
dmVudCBzZW5kaW5nIHNob3VsZCBub3QgYmUgdGFpbG9yZWQgdG8gd2hhdCB5b3UNCj4gbmVlZCBv
ciB3YW50LiBPciBpZiBzbyAoaS5lLiBpZiBhZ3JlZWQgdXBvbiBhbW9uZyB0aGUgVk0gZXZlbnQN
Cj4gbWFpbnRhaW5lcnMpIHRoZW4gdGhpcyByZXN0cmljdGlvbiBzaG91bGQgYmUgY2xlYXJseSBz
cGVsbGVkIG91dC4NCj4gDQoNCk9uIHRoZSBvdGhlciBoYW5kLCB0aGlzIGNhbiBnbyBvdXRzaWRl
IHRoZSB3cml0ZSBwYXRoIHdpdGggbm8gZWZmZWN0IG9uIA0KdGhlIGZ1bmN0aW9uYWxpdHkgb2Yg
dGhpcyBzZW5kX2V2ZW50IGZlYXR1cmUuDQoNCkkgd2lsbCBtb3ZlIGl0IGFmdGVyIHRoZSBpZih3
cml0ZSkgaW4gdGhlIG5leHQgdmVyc2lvbi4NCg0KDQpUaGFua3MsDQpBbGV4DQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
