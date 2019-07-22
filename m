Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 397EA6FF57
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 14:15:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpXB2-0002VZ-6v; Mon, 22 Jul 2019 12:12:24 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wXcs=VT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hpXB1-0002VU-DP
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 12:12:23 +0000
X-Inumbo-ID: eb950a97-ac79-11e9-8980-bc764e045a96
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id eb950a97-ac79-11e9-8980-bc764e045a96;
 Mon, 22 Jul 2019 12:12:22 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 22 Jul 2019 12:12:05 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 22 Jul 2019 12:11:03 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.72.10) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 22 Jul 2019 12:11:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Axl7kLgdrJ64pD1oJPzPG/jUnvflYKMvMS2zMDZvN6WLMY29OmyE/Crwge5M5BGrtlQfB5gJCcezz0rU1r/ZVbJrV6ioYGDOJoyb6F2r8w1wAYYKWZeP62R+Si1jybSmC3YTxC2AWzJK2MGlKSuZF0TchOWwYetC+GNxH0oV2FzRZn7c4Gqd89cz+lG0wdblOdFTSgFSjAAsd7C3eHEEqZqY9rWPX0hrp1NNjRD4lYL63WpAh0tZVoIhumP3vTVHdWrp7ObjNaq1z6LrDPYHAQXd+tcXqEzFTtc5iNg9dWnV9tOiJPm3gtlfLccHjaI8z8qRFA6752ftebjRgFrFfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kuG1DHHOm/Z/OyGLuU/9gJOM9DC+NLq+Uhednd10q2o=;
 b=bX6RkLb6/ukx5y4JZ8oPILxP/OufTPE8EM/DaMCQ2Ee29AzFJnEyxph9LzeBZnDn72vopZ396psgxlTgeEePMc5R7d4arTCNccADNdAOUqXSV+CdcQFCTy4Dw5KSFZlN3oLzBYcLPukoDK8Sp4DdKaxn9m0q80bJrNw7sOyuF7ScPbG2Kb7rkjTJOmpEk4dYJwbClaKL8BCzWrV5m5hCCb7j0mc6ZP796VcVvdxaHblX/rk+wzGyVjA7mphaoyG8PJnBtnxpqKMewBE4Bny5dxZlCoUxbhkMMatF48jv/nPlZgfufqbgV+zXDXqrSpXk03YlFTcQSTtkqqFXXgPVkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2777.namprd18.prod.outlook.com (20.179.49.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Mon, 22 Jul 2019 12:11:02 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Mon, 22 Jul 2019
 12:11:02 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH] vunmap: let vunmap align virtual address by itself
Thread-Index: AQHVPhWLg4cyYnQWKUW8aYX9saIQuqbWZDjPgAAOmQCAABvi84AAAicA
Date: Mon, 22 Jul 2019 12:11:02 +0000
Message-ID: <35df7b4d-068d-15d3-2197-d5a6dee23917@suse.com>
References: <1563469897-2773-1-git-send-email-andrii.anisov@gmail.com>
 <2d71f4c0-023f-7a09-731e-e84e21378e26@suse.com>
 <261e0c5e-a886-f389-3c37-413613c9bf4f@gmail.com>
 <a4877031-1abd-e683-aae9-5d8ce5df98b5@suse.com>
 <7ddef8b7-ec79-d7ce-4123-31ae63a5e7b3@arm.com>
In-Reply-To: <7ddef8b7-ec79-d7ce-4123-31ae63a5e7b3@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0332.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::32) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f30e0302-3c89-42ae-e4ed-08d70e9da9ce
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2777; 
x-ms-traffictypediagnostic: DM6PR18MB2777:
x-microsoft-antispam-prvs: <DM6PR18MB2777D7732C41D054EB28DDC4B3C40@DM6PR18MB2777.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01068D0A20
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(396003)(376002)(366004)(136003)(346002)(189003)(199004)(71200400001)(478600001)(71190400001)(52116002)(76176011)(102836004)(26005)(186003)(386003)(36756003)(6506007)(53546011)(53936002)(3846002)(6246003)(6116002)(68736007)(8676002)(31686004)(6512007)(6486002)(486006)(6436002)(66066001)(7736002)(305945005)(446003)(11346002)(2616005)(476003)(4326008)(14444005)(14454004)(31696002)(86362001)(256004)(66946007)(25786009)(5660300002)(81156014)(80792005)(64756008)(66556008)(66476007)(81166006)(66446008)(8936002)(2906002)(229853002)(316002)(6916009)(99286004)(54906003)(7416002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2777;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: EBAjl+TYzPNiG/3PUkk25p1NZjsqry9vmTbFw0dllHULBHWh+eqnbpE49remWEEw/visqRjyyUkXKpQ3l/4KMMsf2UJv5ImLgcvZa2wQuu4GA/vSSGpbE0uKD7NeU+z+N1xVERqNmgysUgrZ81RgPz9EJi3uKwl3Me/rLABLuqn3KC3WGSkUp4hXI4vPJMyeUOBfTnXNkoUfDPv25mby/pEltvhG2r1wOpf2Co2gsX6CxnPEKj9c33x+QwS2cK+DUJ1SaCewnKQ7QjEJEPCTI5KZaPZFBzbIHn+W0wtVT0vf10Vb/7tJUsCV/XcuZypV0Ud6pNxvduNK+cMCABsovCMGZxG2GdOfSnzLHobqsdzi4YshZnN79r8S0ItXbq/JxiXyMWzChH6EMzxyRZ9fM4XN9V06ooGKEv+xYNuRqYM=
Content-ID: <E1914EC19A06BB4DAAD6E8D857A56D06@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f30e0302-3c89-42ae-e4ed-08d70e9da9ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2019 12:11:02.0255 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2777
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] vunmap: let vunmap align virtual address by
 itself
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Andrii Anisov <andrii.anisov@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIuMDcuMjAxOSAxNDowMiwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPiBPbiAyMi8wNy8yMDE5
IDExOjIzLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+IE9uIDIyLjA3LjIwMTkgMTE6MzAsIEFuZHJp
aSBBbmlzb3Ygd3JvdGU6DQo+Pj4NCj4+Pg0KPj4+IE9uIDE5LjA3LjE5IDEyOjM3LCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+Pj4gT24gMTguMDcuMjAxOSAxOToxMSwgQW5kcmlpIEFuaXNvdiB3cm90
ZToNCj4+Pj4+IExldCB2dW5tYXAgYWxpZ24gcGFzc2VkIHZpcnR1YWwgYWRkcmVzcyBieSBQQUdF
X1NJWkUuDQo+Pj4+DQo+Pj4+IERlc3BpdGUgc2VlaW5nIEFuZHJldydzIFItYiB5b3UndmUgYWxy
ZWFkeSBnb3QgSSdkIGxpa2UgdG8gcG9pbnQgb3V0DQo+Pj4+IHRoYXQgdGhpcyBpbmNyZWFzZXMg
dGhlIHJpc2sgb2Ygc29tZSBjb2RlIHBhc3NpbmcgdGhlIHdyb25nIHBvaW50ZXINCj4+Pj4gaW50
byBoZXJlLiB7LHVufW1hcF9kb21haW5fcGFnZSgpIGFjdCBvbiBzaW5nbGUgcGFnZXMgb25seSwg
c28gdGhlcmUncw0KPj4+PiBubyBhbWJpZ3VpdHkuIFdoZW4gdGFsa2luZyBhYm91dCBtdWx0aS1w
YWdlIHJlZ2lvbnMgdGhvdWdoLCBub3QgdW5kb2luZw0KPj4+PiBhcml0aG1ldGljIHByZXZpb3Vz
bHkgZG9uZSBtYXkgbWVhbiBhY3R1YWxseSBwb2ludGluZyBhdCBvdGhlciB0aGFuIHRoZQ0KPj4+
PiBmaXJzdCBwYWdlIG9mIHRoZSBtYXBwaW5nLg0KPj4+DQo+Pj4gV2VsbCwgd2hhdCB3ZSBhcmUg
bW92aW5nIGludG8gdnVubWFwKCksIGlzIGEgcGFnZSBhbGlnbm1lbnQgb25seS4gSXQgY2FuJ3Qg
c2F2ZSB1cyBmcm9tIHRoZSB3cm9uZyBwb2ludGVyLCBldmVuIGlmIGl0IGlzIGRvbmUgb3V0c2lk
ZSB0aGUgdnVubWFwKCkuDQo+Pj4NCj4+Pj4+IFdpdGggdGhlIG1haW4gY2hhbmdlLCBhbHNvOg0K
Pj4+Pj4gwqDCoMKgIC0gc3RyaXAgYWxsIGV4aXN0aW5nIHZ1bm1hcCgpIGNhbGxzIGZyb20gcHJp
b3IgbWFza2luZw0KPj4+Pg0KPj4+PiBfSWZfIHdlIGFyZSB0byBnbyB0aGlzIHJvdXRlLCB0aGVu
IHVubWFwX2RvbWFpbl9wYWdlX2dsb2JhbCgpDQo+Pj4+IGNhbGxlcnMgc2hvdWxkIGFsc28gYmUg
YWRqdXN0ZWQuIFRoZXJlLCBhcyBmb3IgdW5tYXBfZG9tYWluX3BhZ2UoKSwNCj4+Pj4gSSBhZ3Jl
ZSBpdCB3b3VsZCBtYWtlIHNlbnNlIHRvIGJlIG1vcmUgdG9sZXJhbnQuDQo+Pj4NCj4+PiBJJ3Zl
IGZvdW5kIHR3byBwYWdlIGFsaWdubWVudHMgcHJpb3IgdG8gYHVubWFwX2RvbWFpbl9wYWdlX2ds
b2JhbCgpYCBjYWxsLiBTaG91bGQgSSB3aXBlIHRoZW0gaW4gdGhpcyBwYXRjaCwgb3IgaW4gc2Vw
YXJhdGU/DQo+Pg0KPj4gSWYgd2UncmUgdG8gZ28gdGhlIHN1Z2dlc3RlZCByb3V0ZSB0aGVuIGl0
IG1pZ2h0IG5vdCBtYXR0ZXIgbXVjaC4NCj4+IEFzIEknbSBub3QgZW50aXJlbHkgY2VydGFpbiB5
ZXQgdGhhdCB3ZSB3aWxsLCBtYWtpbmcgdGhpcyBhIHByZXJlcQ0KPj4gb25lIGRlYWxpbmcgd2l0
aCB0aGUgYWxpZ25tZW50IGluIHVubWFwX2RvbWFpbl9wYWdlX2dsb2JhbCgpIG1pZ2h0DQo+PiBi
ZSBiZXR0ZXIuIFlvdXIgZXhpc3RpbmcgcGF0Y2ggd291bGQgdGhlbiBmdXJ0aGVyIHNoaWZ0IHRo
aXMgaW50bw0KPj4gdnVubWFwKCkuDQo+IA0KPiBJIHRoaW5rIGFsbG93aW5nIHZ1bm1hcCB0byBk
ZWFsIHdpdGggdW5hbGlnbmVkIGFkZHJlc3MgY291bGQgc2ltcGxpZnkgc29tZSBvZiB0aGUgY2Fs
bGVycy4gUGFzc2luZyB0aGUgd3JvbmcgcGFnZS1hbGlnbmVkIHBvaW50ZXIgaXMgbGVzcyBjcml0
aWNhbCB0aGFuIHBhc3NpbmcgYW4gdW5hbGlnbmVkIGFkZHJlc3MuDQo+IA0KPiBUaGUgbGF0dGVy
IG1heSByZXN1bHQgaW4gbWlzYmVoYXZpbmcgY29kZS4NCg0KV2h5IG9ubHkgdGhlIGxhdHRlcj8N
Cg0KPiBUaGUgdm1hcCB3aWxsIGVuZC11cCB0byBub3QgYmUgc3luYyB3aXRoIHRoZSBwYWdlLXRh
YmxlIGFzIHdlIGFzc3VtZQ0KPiBwYWdlLXRhYmxlIHVwZGF0ZSBjYW5ub3QgZmFpbCAodGhpcyBw
cm9iYWJseSBzaG91bGQgYmUgY2hhbmdlZCkuIE9uDQo+IEFybSwgdGhpcyB3aWxsIHJlc3VsdCB0
byBhbnkgbmV3IHZtYXAgZnVuY3Rpb24gdG8gbGlrZWx5IGZhaWwgKHdlDQo+IGRvbid0IGFsbG93
IHJlcGxhY2UgYW4gZXhpc3RpbmcgdmFsaWQgcGFnZS10YWJsZSBlbnRyeSkuDQo+IA0KPiBJSVVD
IHRoZSBjb2RlLCB0aGUgZm9ybWVyIHdpbGwgcmVzdWx0IHRvIG9ubHkgdW5tYXBwaW5nIHNvbWUg
cGFydCBvZg0KPiB0aGUgdm1hcC4gDQoNCkFJVUkgdGhlIHVubWFwIHJlcXVlc3Qgd2lsbCBzaW1w
bHkgZmFpbDogdm1faW5kZXgoKSBhbmQgaGVuY2Ugdm1fc2l6ZSgpDQp3aWxsIHNpbXBseSByZXR1
cm4gMC4gSGVuY2UsIHdpdGggdnVubWFwKCkgbm90IGl0c2VsZiByZXR1cm5pbmcgYW55DQplcnJv
ciwgdGhlcmUnbGwgYmUgYSBzaWxlbnQgbGVhayBvZiBtYXBwaW5ncy4NCg0KSmFuDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
