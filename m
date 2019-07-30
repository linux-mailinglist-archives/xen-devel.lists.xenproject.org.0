Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD877A2ED
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 10:13:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsNDw-0000RF-KL; Tue, 30 Jul 2019 08:11:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zL4X=V3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hsNDv-0000R3-8e
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 08:11:07 +0000
X-Inumbo-ID: 8c86b9c6-b2a1-11e9-97c0-57214f7a724e
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8c86b9c6-b2a1-11e9-97c0-57214f7a724e;
 Tue, 30 Jul 2019 08:11:03 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 30 Jul 2019 08:10:53 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 30 Jul 2019 08:09:15 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.72.12) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 30 Jul 2019 08:09:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PaC2oywjvyxzX74mygbtl7yxrfWzgA1fLM/vmYS67P7qwehcI0X7OdAyjmrwXq9rE/M/jXmWRFk2FMXal2WPB4JEkWWfz4vf8nIA0Rk0AZMdNWLPvbX1Il+ym6KM6EuTaeDnJCxR/IDxrQKb0WZDBPheZl0eLPOepi79OAz9K5KJNip8WLUm98faXE8/ecjpfzPDVpz3IbGXiLzm+AjtLYPxQ7AvF2mH8f8Ep2GmeoeuwdWMJnaHWNmoSOGjBEf1c6DMevSHPIvZ3HG/KvnOwwsUnoGqqU/q4mCpEAIVGyrE5RrsJ8BiIa4+M/ANpY9naT3afc5voP0oLqUvH8mnFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CEKBwt9pOQOcttd85ycIJ8RvVLnAKU0WOjUOSKoMdGo=;
 b=D1jQ2lASsEPEpX/1B7lLMdpYei6GzYAIm2IsQWJJWRlkebovaCzYUQ+OlSkE7SZ64cdaS7fBet/t4djIiWwawwCmM8Az4r5A1MyMYpNJXcKyzWi5l+/qxIdrUVqndF1cuVfx6ikKum+3iicbUAwKtQoKhvKmaCrS4h1DjC9XGPMWwK6mFeMRiC+FwjMNbIq94G6sfR2gy/ruvHVU9DE7Jigx884h3LKfeUCUGRQClrnNdZCSj6HOkCc9pOZ1bdt+fdRRW6ZO0zqToZUrUfsSK/AEqGodoh/Nr2hJWMpw5M7+6gkDydfChUSAffKWLt2zcaW4kSlNJc/LFrYkPTXWLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3251.namprd18.prod.outlook.com (10.255.136.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.12; Tue, 30 Jul 2019 08:09:14 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 08:09:14 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [Xen-devel] [PATCH v3 01/10] page-alloc: Clamp get_free_buddy()
 to online nodes
Thread-Index: AQHVRgcXbA5oo5qfM0G3fbP8NjBdsqbhvgyAgAAbkuCAAPZygA==
Date: Tue, 30 Jul 2019 08:09:14 +0000
Message-ID: <bfc30841-2582-15e6-0e4f-96b47c514f3b@suse.com>
References: <20190729121204.13559-1-andrew.cooper3@citrix.com>
 <20190729121204.13559-2-andrew.cooper3@citrix.com>
 <d3179354-a1c3-6e67-8f4e-821878f80a14@suse.com>
 <05d466ab-1d28-a369-331e-350f09464f37@citrix.com>
In-Reply-To: <05d466ab-1d28-a369-331e-350f09464f37@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6P192CA0017.EURP192.PROD.OUTLOOK.COM (2603:10a6:4:b8::27)
 To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 03d664ee-eb1e-4975-ceae-08d714c535e8
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3251; 
x-ms-traffictypediagnostic: BY5PR18MB3251:
x-microsoft-antispam-prvs: <BY5PR18MB3251105D27C06A39A6BE7615B3DC0@BY5PR18MB3251.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(39860400002)(366004)(376002)(346002)(136003)(189003)(199004)(486006)(5660300002)(6246003)(71200400001)(53546011)(6506007)(36756003)(2906002)(71190400001)(6916009)(6436002)(25786009)(76176011)(386003)(52116002)(229853002)(99286004)(6486002)(256004)(14444005)(66556008)(14454004)(6512007)(186003)(8676002)(305945005)(7736002)(68736007)(53936002)(31686004)(54906003)(102836004)(11346002)(80792005)(31696002)(478600001)(316002)(476003)(2616005)(4326008)(446003)(6116002)(3846002)(81166006)(66476007)(26005)(8936002)(66946007)(66066001)(66446008)(64756008)(86362001)(81156014);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3251;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gvpJfNBrv5LwBKZCjCB+RXzD6tFbb+FxS979rp9qxlf2ho2S0DvbQLRl67dcynqSJoc3PaZPCKYnPYDipemrnPUbJuzmrzvIVxbP8CpdXw8Mqz+iMwN11qJ19uqrIcEO61IVGdIef4q50mLFkd+I9c4YMgdQWXfyOk0M3L2uVc2Ze6D8ZSKLtxx0MtOPmj6qhMUMKvnhqXpVKfGQrxOMMVfMhToz+5gYjrRc8Yw6ztFyGyLCzvRW1LQNwkS4Sj7wY7N8vlhKxD4j2INHBmR+eUsKe/NEJapTtYNdipYmVJHRwt0DUr01Is5B/gpKjKK5IklD5RRrdX5ruHmcynl024r+1VFo9/LAnhGsjueKoc0SaEQ+Jei8pBvxrfuUluR6oBcFtKHEwWl8exJR/rxNw/fjX/L9w7XsjHjl2G/SGsM=
Content-ID: <D772F204A1BA32418BCD253527989BCA@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 03d664ee-eb1e-4975-ceae-08d714c535e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 08:09:14.3496 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3251
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

T24gMjkuMDcuMjAxOSAxOToyNiwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMjkvMDcvMjAx
OSAxNjo0OCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBPbiAyOS4wNy4yMDE5IDE0OjExLCBBbmRy
ZXcgQ29vcGVyIHdyb3RlOg0KPj4+ICsgICAgaWYgKCBkICkNCj4+PiArICAgICAgICBub2Rlc19h
bmQobm9kZW1hc2ssIG5vZGVtYXNrLCBkLT5ub2RlX2FmZmluaXR5KTsNCj4+IERlc3BpdGUgbXkg
ZWFybGllciBhY2s6IENvZGUgZnVydGhlciBkb3duIGFzc3VtZXMgYSBub24tZW1wdHkgbWFzaywN
Cj4+IHdoaWNoIGlzIG5vIGxvbmdlciBndWFyYW50ZWVkIGFmYWljcy4NCj4gDQo+IE5vdGhpbmcg
cHJldmlvdXMgZ3VhcmFudGVlZCB0aGF0IGQtPm5vZGVfYWZmaW5pdHkgaGFkIGFueSBiaXRzIHNl
dCBpbg0KPiBpdCwgZWl0aGVyLg0KPiANCj4gVGhhdCBzYWlkLCBpbiBwcmFjdGljZSBpdCBpcyBl
aXRoZXIgQUxMLCBvciBzb21ldGhpbmcgZGVyaXZlZCBmcm9tIHRoZQ0KPiBjcHU9Pm5vZGUgbWFw
cGluZ3MsIHNvIEkgZG9uJ3QgdGhpbmsgdGhpcyBpcyBhIHByb2JsZW0gaW4gcHJhY3RpY2UuDQo+
IA0KPj4gSSB0aGluayB5b3Ugd2FudCB0byBhcHBlbmQgYW4NCj4+ICJpbnRlcnNlY3RzIiBjaGVj
ayBpbiB0aGUgaWYoKS4NCj4gDQo+IEkgdGhpbmsgaXQgd291bGQgYmUgYmV0dGVyIHRvIGFzc2Vy
dCB0aGF0IGNhbGxlcnMgZG9uJ3QgZ2l2ZSB1cyBjb21wbGV0ZQ0KPiBqdW5rLg0KPiANCj4+IFdp
dGggdGhhdCBmZWVsIGZyZWUgdG8gcHJvbW90ZSBteQ0KPj4gQS1iIHRvIFItYi4NCj4gDQo+IEhv
dyBhYm91dDoNCj4gDQo+ICDCoMKgwqAgaWYgKCBkICkNCj4gIMKgwqDCoCB7DQo+ICDCoMKgwqDC
oMKgwqDCoCBpZiAoIG5vZGVzX2ludGVyc2VjdChub2RlbWFzaywgZC0+bm9kZV9hZmZpbml0eSkg
KQ0KPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBub2Rlc19hbmQobm9kZW1hc2ssIG5vZGVtYXNr
LCBkLT5ub2RlX2FmZmluaXR5KTsNCj4gIMKgwqDCoMKgwqDCoMKgIGVsc2UNCj4gIMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgQVNTRVJUX1VOUkVBQ0hBQkxFKCk7DQo+ICDCoMKgwqAgfQ0KPiANCj4g
Pw0KPiANCj4gVGhpcyBjaGFuZ2UgaGFzIHBhc3NlZCBteSBub3JtYWwgc2V0IG9mIHByZXB1c2gg
Y2hlY2tzIChub3Qgbm90IHRoYXQNCj4gdGhlcmUgaXMgYW55dGhpbmcgaW50ZXJlc3RpbmcgTlVN
QS13aXNlIGluIHRoZXJlKS4NCg0KZG9tYWluX3VwZGF0ZV9ub2RlX2FmZmluaXR5KCkgbWVhbnMg
dG8gZ3VhcmFudGVlIGEgbm9uLWVtcHR5IG1hc2sgKGJ5DQp3YXkgb2YgYSBzaW1pbGFyIGFzc2Vy
dGlvbiksIHdoZW4gLT5hdXRvX25vZGVfYWZmaW5pdHkgaXMgc2V0LiBPdG9oDQpkb21haW5fc2V0
X25vZGVfYWZmaW5pdHkoKSBtYXkgY2xlYXIgdGhhdCBmbGFnLCBhdCB3aGljaCBwb2ludCBJIGNh
bid0DQpzZWUgd2hhdCB3b3VsZCBndWFyYW50ZWUgdGhhdCB0aGUgaW50ZXJzZWN0aW9uIHdvdWxk
IHJlbWFpbiBub24tZW1wdHkNCmFzIENQVXMgZ2V0IG9mZmxpbmVkLiAoSSBkb24ndCB1bmRlcnN0
YW5kLCBidHcsIHdoeSB0aGUgZnVuY3Rpb24gY2FsbHMNCmRvbWFpbl91cGRhdGVfbm9kZV9hZmZp
bml0eSgpIGFmdGVyIGNsZWFyaW5nIHRoZSBmbGFnLikgVGhlcmVmb3JlIEkNCmRvbid0IHRoaW5r
IGFuIGFzc2VydGlvbiBsaWtlIHlvdSBzdWdnZXN0IHdvdWxkIGJlIGxlZ2l0aW1hdGUuIEZvcg0K
dGhpcyB0aGVyZSB3b3VsZCBiZSBhIHByZXJlcSBvZiBkb21haW5fdXBkYXRlX25vZGVfYWZmaW5p
dHkoKSBjbGVhcmluZw0KdGhlIGZsYWcgd2hlbiBpdCBmaW5kcyB0aGUgaW50ZXJzZWN0aW9uIGhh
cyBiZWNvbWUgZW1wdHkuIEFuZCBldmVuDQp0aGVuIHRoZXJlIHdvdWxkIGJlIGEgd2luZG93IGlu
IHRpbWUgd2hlcmUgdGhlIGludGVyc2VjdGlvbiBtaWdodCBiZQ0KYWN0aXZlbHkgZW1wdHksIHNv
IHNvbWUgc3luY2hyb25pemF0aW9uIHdvdWxkIGJlIG5lZWRlZCBpbiBhZGRpdGlvbi4NCg0KSmFu
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
