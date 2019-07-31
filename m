Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 769EA7BBFC
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 10:42:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsk7c-0004j8-P8; Wed, 31 Jul 2019 08:38:08 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mtD0=V4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hsk7b-0004j1-CR
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 08:38:07 +0000
X-Inumbo-ID: 7e4b314b-b36e-11e9-8980-bc764e045a96
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7e4b314b-b36e-11e9-8980-bc764e045a96;
 Wed, 31 Jul 2019 08:38:05 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 31 Jul 2019 08:37:58 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 31 Jul 2019 08:22:25 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (15.124.72.13) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 31 Jul 2019 08:22:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GS4hep1rMVI3AKZiPUE1K1+7uNgX8rX6NR/as2DOniZAOVEJJ7KRhBD8JLWqET7wrcvGBM6PyUK3/TOUTIACDmsfGJ4tKVd5/oL1zPyINwx4u76fTDi1dstxI0v3mE40/aGw8q4WK/srXS+CCH3pTNsjHjip4I3usQ5CHhOylXSpno/50tTYnTqy2Ac2AE2sAfBrHmu+/QhO5qB2bE5YE+TgdNsqtbWF5sO/V5yqdIVYTNrvFEd49Nl2wYjjv2CeH+E6vuSmvLgzZZ/RPLrW6uSRKrasDMl45nZy3WzpK++mjY3YE4kBsXG4g4b7lvPMnSWD8DbnY089zaWH3kyMZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tF+W9Kgg86ZexYEBx+wWz7RSsGIi1esGC9+N3MylO84=;
 b=IwPpUFfKjk12x2GMeuJRl8cf693T0x6547rVLj87sWi27KqFBlCoBEICu1oeDd9UTw4DYpm/XJTNQwTOUS1YUJv9ncSRKhjOvvRAuw1TxawMKLPc99aRZZefMYn6/5fnfmWLNNLcErQiZQF8brZIhEZfVJ9+vj4JBt09c4+LHA0EtQOnJeSJfpoILoe9NLWq1EpZ1r0Lfi2Oxq1z2iONEw/Z9yPv1mvgUrVRN53bk0aLxOMneaj/viNl+DfQIisv/xE/6/PlcWQlyZ+PLDWUQgHMjd1FOVvb15hwJoFd3jLQnQHs8Zeh53vdA9yJ3cS2RbvuRmV/Gx3W2430dcJwyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB3035.namprd18.prod.outlook.com (20.179.107.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.15; Wed, 31 Jul 2019 08:22:24 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::69cc:388:194c:e25b]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::69cc:388:194c:e25b%7]) with mapi id 15.20.2115.005; Wed, 31 Jul 2019
 08:22:23 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [Xen-devel] [PATCH v3 01/10] page-alloc: Clamp get_free_buddy()
 to online nodes
Thread-Index: AQHVRgcXbA5oo5qfM0G3fbP8NjBdsqbhvgyAgAAbkuCAAPZygIAAnfGXgAD4FQA=
Date: Wed, 31 Jul 2019 08:22:23 +0000
Message-ID: <ac27eae2-4de6-d81f-bf82-3ab519cfbc2b@suse.com>
References: <20190729121204.13559-1-andrew.cooper3@citrix.com>
 <20190729121204.13559-2-andrew.cooper3@citrix.com>
 <d3179354-a1c3-6e67-8f4e-821878f80a14@suse.com>
 <05d466ab-1d28-a369-331e-350f09464f37@citrix.com>
 <bfc30841-2582-15e6-0e4f-96b47c514f3b@suse.com>
 <7675f6e9-fd42-6e81-bf35-3dd499270413@citrix.com>
In-Reply-To: <7675f6e9-fd42-6e81-bf35-3dd499270413@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB8PR06CA0017.eurprd06.prod.outlook.com
 (2603:10a6:10:100::30) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 93fb435d-eaa5-49d2-d871-08d7159036d0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR18MB3035; 
x-ms-traffictypediagnostic: DM6PR18MB3035:
x-microsoft-antispam-prvs: <DM6PR18MB3035796D42CF530795129976B3DF0@DM6PR18MB3035.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 011579F31F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(136003)(39860400002)(366004)(346002)(396003)(189003)(199004)(305945005)(7736002)(229853002)(66946007)(66476007)(66556008)(66446008)(64756008)(31686004)(8676002)(81156014)(81166006)(68736007)(6486002)(6436002)(26005)(8936002)(186003)(6246003)(36756003)(76176011)(14454004)(316002)(54906003)(386003)(6506007)(256004)(14444005)(99286004)(71200400001)(52116002)(71190400001)(5660300002)(31696002)(80792005)(66066001)(6916009)(102836004)(53546011)(2906002)(6116002)(3846002)(11346002)(2616005)(476003)(4326008)(6512007)(86362001)(25786009)(446003)(53936002)(478600001)(486006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB3035;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: lAURaIaF9n4+YNZITrI5pctobHVlrPmJdwSkixBAsiDJV3KEhRsAIf/U0/EF2V55kgKx0rkLR4Z4ZzMiM4OOd4Jw+suPS1I3QG6aFWgWx3G9wxJw7RsFE/uTB0v3XC8y5FkMnPk8cokPZ6BAvqQD/N5mVwRopHhUKBfbxu/OVBMfi1GzvkwuWjiWCOlOvdk6WQ/0uVl5+urSYyN2adU3MhWIq1wfEZBHGFNiFhlczCosHpILbZg+ge5yrd6ZbUKHnrY88QLM74GqsQJpg0RSlxODp2Ezo4Qwh1A7VBta2+sTmgFaw1NMbdP3s6FxPwcK1wCW1nhQKm/Fe+jb7nZjrUByD6JsIvRH4LSKox/74qk0La+Y6by6uqqpeIUsSv7DkdlsgAUXos/ObghkAkTEjPomnr0wtTZoKwPId2YuhiA=
Content-ID: <AE33C6E642CE1E40B47A87A07980C32E@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 93fb435d-eaa5-49d2-d871-08d7159036d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2019 08:22:23.6274 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3035
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v3 01/10] page-alloc: Clamp get_free_buddy()
 to online nodes
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
Cc: StefanoStabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Julien Grall <julien.grall@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDcuMjAxOSAxOTozMiwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMzAvMDcvMjAx
OSAwOTowOSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBPbiAyOS4wNy4yMDE5IDE5OjI2LCBBbmRy
ZXcgQ29vcGVyIHdyb3RlOg0KPj4+IE9uIDI5LzA3LzIwMTkgMTY6NDgsIEphbiBCZXVsaWNoIHdy
b3RlOg0KPj4+PiBPbiAyOS4wNy4yMDE5IDE0OjExLCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPj4+
Pj4gKyAgICBpZiAoIGQgKQ0KPj4+Pj4gKyAgICAgICAgbm9kZXNfYW5kKG5vZGVtYXNrLCBub2Rl
bWFzaywgZC0+bm9kZV9hZmZpbml0eSk7DQo+Pj4+IERlc3BpdGUgbXkgZWFybGllciBhY2s6IENv
ZGUgZnVydGhlciBkb3duIGFzc3VtZXMgYSBub24tZW1wdHkgbWFzaywNCj4+Pj4gd2hpY2ggaXMg
bm8gbG9uZ2VyIGd1YXJhbnRlZWQgYWZhaWNzLg0KPj4+IE5vdGhpbmcgcHJldmlvdXMgZ3VhcmFu
dGVlZCB0aGF0IGQtPm5vZGVfYWZmaW5pdHkgaGFkIGFueSBiaXRzIHNldCBpbg0KPj4+IGl0LCBl
aXRoZXIuDQo+Pj4NCj4+PiBUaGF0IHNhaWQsIGluIHByYWN0aWNlIGl0IGlzIGVpdGhlciBBTEws
IG9yIHNvbWV0aGluZyBkZXJpdmVkIGZyb20gdGhlDQo+Pj4gY3B1PT5ub2RlIG1hcHBpbmdzLCBz
byBJIGRvbid0IHRoaW5rIHRoaXMgaXMgYSBwcm9ibGVtIGluIHByYWN0aWNlLg0KPj4+DQo+Pj4+
IEkgdGhpbmsgeW91IHdhbnQgdG8gYXBwZW5kIGFuDQo+Pj4+ICJpbnRlcnNlY3RzIiBjaGVjayBp
biB0aGUgaWYoKS4NCj4+PiBJIHRoaW5rIGl0IHdvdWxkIGJlIGJldHRlciB0byBhc3NlcnQgdGhh
dCBjYWxsZXJzIGRvbid0IGdpdmUgdXMgY29tcGxldGUNCj4+PiBqdW5rLg0KPj4+DQo+Pj4+IFdp
dGggdGhhdCBmZWVsIGZyZWUgdG8gcHJvbW90ZSBteQ0KPj4+PiBBLWIgdG8gUi1iLg0KPj4+IEhv
dyBhYm91dDoNCj4+Pg0KPj4+ICAgwqDCoMKgIGlmICggZCApDQo+Pj4gICDCoMKgwqAgew0KPj4+
ICAgwqDCoMKgwqDCoMKgwqAgaWYgKCBub2Rlc19pbnRlcnNlY3Qobm9kZW1hc2ssIGQtPm5vZGVf
YWZmaW5pdHkpICkNCj4+PiAgIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbm9kZXNfYW5kKG5vZGVt
YXNrLCBub2RlbWFzaywgZC0+bm9kZV9hZmZpbml0eSk7DQo+Pj4gICDCoMKgwqDCoMKgwqDCoCBl
bHNlDQo+Pj4gICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEFTU0VSVF9VTlJFQUNIQUJMRSgpOw0K
Pj4+ICAgwqDCoMKgIH0NCj4+Pg0KPj4+ID8NCj4+Pg0KPj4+IFRoaXMgY2hhbmdlIGhhcyBwYXNz
ZWQgbXkgbm9ybWFsIHNldCBvZiBwcmVwdXNoIGNoZWNrcyAobm90IG5vdCB0aGF0DQo+Pj4gdGhl
cmUgaXMgYW55dGhpbmcgaW50ZXJlc3RpbmcgTlVNQS13aXNlIGluIHRoZXJlKS4NCj4+IGRvbWFp
bl91cGRhdGVfbm9kZV9hZmZpbml0eSgpIG1lYW5zIHRvIGd1YXJhbnRlZSBhIG5vbi1lbXB0eSBt
YXNrIChieQ0KPj4gd2F5IG9mIGEgc2ltaWxhciBhc3NlcnRpb24pLCB3aGVuIC0+YXV0b19ub2Rl
X2FmZmluaXR5IGlzIHNldC4gT3RvaA0KPj4gZG9tYWluX3NldF9ub2RlX2FmZmluaXR5KCkgbWF5
IGNsZWFyIHRoYXQgZmxhZywgYXQgd2hpY2ggcG9pbnQgSSBjYW4ndA0KPj4gc2VlIHdoYXQgd291
bGQgZ3VhcmFudGVlIHRoYXQgdGhlIGludGVyc2VjdGlvbiB3b3VsZCByZW1haW4gbm9uLWVtcHR5
DQo+PiBhcyBDUFVzIGdldCBvZmZsaW5lZC4NCj4gDQo+IEkgZG9uJ3Qgc2VlIHdoYXQgQ1BVIG9m
ZmxpbmluZyBoYXMgdG8gZG8gd2l0aCBhbnl0aGluZy7CoCBUaGVyZSBpcyBubw0KPiBzdWNoIHRo
aW5nIGFzIHRha2luZyBhIG5vZGUgb3V0IG9mIHRoZSBub2RlX29ubGluZV9tYXAsIG5vciBzaG91
bGQgdGhlcmUNCj4gYmUgLSBldmVuIGlmIHdlIG9mZmxpbmUgYW4gZW50aXJlIHNvY2tldCdzIHdv
cnRoIG9mIENQVXMsIHRoZSBtZW1vcnkNCj4gY29udHJvbGxlciBpcyBzdGlsbCBhY3RpdmUgYW5k
IGF2YWlsYWJsZSBmb3IgdXNlLg0KPiANCj4gVGhlIGRvbWFpbiBhbHdheXMgaGFzIG5vbi16ZXJv
IHZDUFVzLCB3aGljaCB3aWxsIGFsd2F5cyByZXN1bHQgaW4gYW4NCj4gaW50ZXJzZWN0aW9uIHdp
dGggbm9kZV9vbmxpbmVfbWFwLg0KDQpPaCwgcmlnaHQgLSBJIGZvcmdvdCB0aGF0IHdlIChhbG1v
c3QpIG5ldmVyIGNsZWFyIGJpdHMgZnJvbQ0Kbm9kZV9vbmxpbmVfbWFwLiBUaGVyZSdzIG9uZSB1
c2Ugb2Ygbm9kZV9zZXRfb2ZmbGluZSgpIGluDQptZW1vcnlfYWRkKCkgLSBJIHdvbmRlciB3aGV0
aGVyIHdlIHNob3VsZG4ndCBkaXRjaA0Kbm9kZV9zZXRfb2ZmbGluZSgpIHRvIG1ha2UgbW9yZSB2
aXNpYmxlIHRoYXQgd2UgZG9uJ3QgbWVhbg0KdG8gZXZlciBjbGVhciBiaXRzIHRoZXJlLg0KDQo+
IFdoYXQgaXMgYSBwcm9ibGVtIGlzIFhFTl9ET01DVExfc2V0bm9kZWFmZmluaXR5IGJlaW5nIGNh
bGxlZCB3aXRoIG5vZGUNCj4gbWFzayB3aGljaCBpcyBkaXNqb2ludCB0byBub2RlX29ubGluZV9t
YXAgdG8gYmVnaW4gd2l0aC4NCj4gDQo+IFRoaXMgcHJvYmxlbWF0aWMgYmVoYXZpb3VyIGFscmVh
ZHkgZXhpc3RzIHRvZGF5LCBhbmQgSSBiZXQgdGhlcmUgaXMgYQ0KPiBsb3Qgb2YgZnVuIHRvIGhh
ZCB3aXRoIHRoYXQgaHlwZXJjYWxsLg0KPiANCj4gQXMgYSBmaXJzdCBwYXNzLA0KPiANCj4gZGlm
ZiAtLWdpdCBhL3hlbi9jb21tb24vZG9tYWluLmMgYi94ZW4vY29tbW9uL2RvbWFpbi5jDQo+IGlu
ZGV4IDlhZWZjMmE2ODAuLjU3Yzg0Y2RjNDIgMTAwNjQ0DQo+IC0tLSBhL3hlbi9jb21tb24vZG9t
YWluLmMNCj4gKysrIGIveGVuL2NvbW1vbi9kb21haW4uYw0KPiBAQCAtNjMxLDggKzYzMSw5IEBA
IHZvaWQgZG9tYWluX3VwZGF0ZV9ub2RlX2FmZmluaXR5KHN0cnVjdCBkb21haW4gKmQpDQo+ICAg
DQo+ICDCoGludCBkb21haW5fc2V0X25vZGVfYWZmaW5pdHkoc3RydWN0IGRvbWFpbiAqZCwgY29u
c3Qgbm9kZW1hc2tfdCAqYWZmaW5pdHkpDQo+ICDCoHsNCj4gLcKgwqDCoCAvKiBCZWluZyBhZmZp
bmUgd2l0aCBubyBub2RlcyBpcyBqdXN0IHdyb25nICovDQo+IC3CoMKgwqAgaWYgKCBub2Rlc19l
bXB0eSgqYWZmaW5pdHkpICkNCj4gK8KgwqDCoCAvKiBCZWluZyBhZmZpbmUgd2l0aCBubyBub2Rl
cywgb3IgZGlzam9pbnQgd2l0aCB0aGUgc3lzdGVtLCBpcyB3cm9uZy4gKi8NCj4gK8KgwqDCoCBp
ZiAoIG5vZGVzX2VtcHR5KCphZmZpbml0eSkgfHwNCj4gK8KgwqDCoMKgwqDCoMKgwqAgIW5vZGVz
X2ludGVyc2VjdHMoKmFmZmluaXR5LCBub2RlX29ubGluZV9tYXApICkNCj4gIMKgwqDCoMKgwqDC
oMKgwqAgcmV0dXJuIC1FSU5WQUw7DQoNClJpZ2h0LCBhbmQgdGhlbiB5b3UgZG9uJ3QgbmVlZCB0
aGUgbm9kZXNfZW1wdHkoKSBwYXJ0IGFueW1vcmUuIFdpdGgNCnRoaXMgY2hhbmdlIGZvbGRlZCBp
biAob3IgYXMgYSBwcmVyZXEgb25lIHRvIGFsbG93IGJhY2twb3J0aW5nKSB5b3UNCmNhbiBhZGQg
bXkgUi1iIHdpdGggdGhlIGFkanVzdG1lbnQgZnVydGhlciB1cCBpbiBwbGFjZS4NCg0KSmFuDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
