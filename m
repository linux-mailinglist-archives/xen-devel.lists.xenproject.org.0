Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F02D1815B8
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 11:42:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1huZSk-0002Pk-44; Mon, 05 Aug 2019 09:39:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=gDv/=WB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1huZSi-0002Pf-9v
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2019 09:39:28 +0000
X-Inumbo-ID: e67ee5a8-b764-11e9-ac8c-af09cda1d57f
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e67ee5a8-b764-11e9-ac8c-af09cda1d57f;
 Mon, 05 Aug 2019 09:39:25 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Mon,  5 Aug 2019 09:39:16 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 5 Aug 2019 09:38:02 +0000
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (15.124.8.12) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 5 Aug 2019 09:38:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g/V1hsY2f6isYqM3M0TbON011zu8uceumsW4lkbgqJ/ihhlMzXw7z8/uguGDuu+ALbig//40ZKHeqGXkmFZ9lyWD//Bg/oInUGuKvYo2Tb8aoExgfPXrVQzErk3UMp0sLHwLwNQJN1udn24o3ZgEddeVgAkjRpGYcELsqIxHObGaeGdzYi8l21ZOsoG6Sq8rqIDfVtjKBs+fjgVBUnJd89Eoz3TVI9uP7qbwF6JNpC8cDYHPLI9OhjQV88U0wAzd+6PXQyElPAb2tGBN2m5UtRyxC4FKR60tinNTyVcdrmqCpw0cEgFw35FITJCr6aQQ8qPnaaQbtDQwWqwJKnj2eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HlS8qHekmOvt2S+oFL0V3S2CDMt6a03Aw3mNVT72iNE=;
 b=PfoI5kaQA3+IpBwhVozb9hD3U5GVj7xD9Z7RmgA+3yE3lw17i+W0f6Q598ZXhnbzSpBlptzueVkMtIBfZyzbb3uOarn3JwbOCYTqR3Gj/pQMJERhaFPxEA3o9kLR9WUKY/ibXISppgKeC3wKZP6vCAt204VvyApKIAK6WSno3OaSQWdDRdckSKVd9t4jhwy8hjuAlsWzXKXefPlwNenyW084sOdkvPldN51mOk70m7PvSxvcdaan9kDY5inelguSypudRTRPD1hqSPaFMaqXu3fGe4hJUBzQUmxhzqwZY35vGhfBWls1BD8Pco2CHgTQuBsDPpsTdhVBdqxqr02UJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from MN2PR18MB3405.namprd18.prod.outlook.com (10.255.238.214) by
 MN2PR18MB2814.namprd18.prod.outlook.com (20.179.23.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.12; Mon, 5 Aug 2019 09:38:01 +0000
Received: from MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081]) by MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081%7]) with mapi id 15.20.2136.018; Mon, 5 Aug 2019
 09:38:01 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Chao Gao <chao.gao@intel.com>
Thread-Topic: [Xen-devel] [PATCH v8 12/16] microcode: split out
 apply_microcode() from cpu_request_microcode()
Thread-Index: AQHVSFKxe9TG4/M45Uuu/98IT/ohCqboAK8AgAQu8W+AACKrAA==
Date: Mon, 5 Aug 2019 09:38:00 +0000
Message-ID: <0b22ca3b-48de-8805-bd18-89d728d19317@suse.com>
References: <1564654971-31328-1-git-send-email-chao.gao@intel.com>
 <1564654971-31328-13-git-send-email-chao.gao@intel.com>
 <2c758b76-8f01-f8d0-1fc9-95b164e111b3@suse.com>
 <20190805073643.GD19492@gao-cwp>
In-Reply-To: <20190805073643.GD19492@gao-cwp>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM3PR05CA0137.eurprd05.prod.outlook.com
 (2603:10a6:207:3::15) To MN2PR18MB3405.namprd18.prod.outlook.com
 (2603:10b6:208:16c::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 16b8eedb-de7b-41a2-66f0-08d719889b53
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR18MB2814; 
x-ms-traffictypediagnostic: MN2PR18MB2814:
x-microsoft-antispam-prvs: <MN2PR18MB28141364330D3486F59226DEB3DA0@MN2PR18MB2814.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01208B1E18
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(346002)(396003)(376002)(39860400002)(136003)(199004)(189003)(478600001)(186003)(76176011)(52116002)(81166006)(36756003)(53936002)(102836004)(99286004)(26005)(71190400001)(71200400001)(81156014)(14454004)(386003)(6506007)(53546011)(7736002)(5660300002)(6512007)(66476007)(6246003)(31696002)(86362001)(66446008)(64756008)(66556008)(3846002)(6486002)(8936002)(6436002)(8676002)(6116002)(66946007)(476003)(256004)(486006)(316002)(229853002)(80792005)(31686004)(54906003)(6916009)(446003)(11346002)(2616005)(14444005)(66066001)(305945005)(68736007)(2906002)(25786009)(4326008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR18MB2814;
 H:MN2PR18MB3405.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: c2oitgWEB5FD0Gil1wHGSJWypoSbVmjwtI/Y7A7vTh8LLwun7L7nyT5ny+NaFWj89Em/hCkv64zA4R9wSdkVDT7tfH7EnWYD7fqI8McuykF8JsdAAWOjLKwgwCyfX6CrtFYAvihfheQaOGWq1OP1gXDvNRZT6W/JeHwd2nVGTxzt8fjqVrgj3d33aCmrBRA2LRz/tdd3oHkImtZmfaTKruyhvTPFC3icpWsjQb/nmgORHQjrK2sD3McH0Ds7r5dYX1pZrsla7o8Ys/ff3cox29yYa+OgCwyTU23D+HOn5yisZu6R8FhUN0H7EC1eyUOEzivUstOHCjmDzO+4DktYk7wKdhURrfKJ7flY89fFcKM4h3Vg+4m78XzLfAy4uhUEqLMTaNv1k/O63JcmiTlFLP9k+zXmK7R882NGhJZbBkE=
Content-ID: <996A9F9D62C2804BB0484CF677D6F960@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 16b8eedb-de7b-41a2-66f0-08d719889b53
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 09:38:00.9354 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB2814
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v8 12/16] microcode: split out
 apply_microcode() from cpu_request_microcode()
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ashok Raj <ashok.raj@intel.com>, Wei Liu <wl@xen.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDguMjAxOSAwOTozNiwgQ2hhbyBHYW8gd3JvdGU6DQo+IE9uIEZyaSwgQXVnIDAyLCAy
MDE5IGF0IDAzOjQwOjU1UE0gKzAwMDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4gT24gMDEuMDgu
MjAxOSAxMjoyMiwgQ2hhbyBHYW8gd3JvdGU6DQo+Pj4gLS0tIGEveGVuL2FyY2gveDg2L21pY3Jv
Y29kZS5jDQo+Pj4gKysrIGIveGVuL2FyY2gveDg2L21pY3JvY29kZS5jDQo+Pj4gQEAgLTE4OSwx
MiArMTg5LDIwIEBAIHN0YXRpYyBERUZJTkVfU1BJTkxPQ0sobWljcm9jb2RlX211dGV4KTsNCj4+
PiAgICANCj4+PiAgICBERUZJTkVfUEVSX0NQVShzdHJ1Y3QgY3B1X3NpZ25hdHVyZSwgY3B1X3Np
Zyk7DQo+Pj4gICAgDQo+Pj4gLXN0cnVjdCBtaWNyb2NvZGVfaW5mbyB7DQo+Pj4gLSAgICB1bnNp
Z25lZCBpbnQgY3B1Ow0KPj4+IC0gICAgdWludDMyX3QgYnVmZmVyX3NpemU7DQo+Pj4gLSAgICBp
bnQgZXJyb3I7DQo+Pj4gLSAgICBjaGFyIGJ1ZmZlclsxXTsNCj4+PiAtfTsNCj4+PiArLyoNCj4+
PiArICogUmV0dXJuIGEgcGF0Y2ggdGhhdCBjb3ZlcnMgY3VycmVudCBDUFUuIElmIHRoZXJlIGFy
ZSBtdWx0aXBsZSBwYXRjaGVzLA0KPj4+ICsgKiByZXR1cm4gdGhlIG9uZSB3aXRoIHRoZSBoaWdo
ZXN0IHJldmlzaW9uIG51bWJlci4gUmV0dXJuIGVycm9yIElmIG5vDQo+Pj4gKyAqIHBhdGNoIGlz
IGZvdW5kIGFuZCBhbiBlcnJvciBvY2N1cnMgZHVyaW5nIHRoZSBwYXJzaW5nIHByb2Nlc3MuIE90
aGVyd2lzZQ0KPj4+ICsgKiByZXR1cm4gTlVMTC4NCj4+PiArICovDQo+Pj4gK3N0YXRpYyBzdHJ1
Y3QgbWljcm9jb2RlX3BhdGNoICptaWNyb2NvZGVfcGFyc2VfYmxvYihjb25zdCBjaGFyICpidWYs
DQo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB1aW50MzJfdCBsZW4pDQo+Pg0KPj4gQnR3IC0geW91J2QgaGF2ZSBsZXNzIGlzc3VlcyB3aXRo
IGxpbmUgbGVuZ3RoIGlmIHlvdSBvbWl0dGVkIHRoZQ0KPj4gIm1pY3JvY29kZV8iIHByZWZpeCBm
cm9tIHN0YXRpYyBmdW5jdGlvbnMuDQo+Pg0KPj4+IEBAIC0yNTAsNDkgKzI1MSw4OCBAQCBib29s
IG1pY3JvY29kZV91cGRhdGVfY2FjaGUoc3RydWN0IG1pY3JvY29kZV9wYXRjaCAqcGF0Y2gpDQo+
Pj4gICAgICAgIHJldHVybiB0cnVlOw0KPj4+ICAgIH0NCj4+PiAgICANCj4+PiAtc3RhdGljIGlu
dCBtaWNyb2NvZGVfdXBkYXRlX2NwdShjb25zdCB2b2lkICpidWYsIHNpemVfdCBzaXplKQ0KPj4+
ICsvKg0KPj4+ICsgKiBMb2FkIGEgbWljcm9jb2RlIHVwZGF0ZSB0byBjdXJyZW50IENQVS4NCj4+
PiArICoNCj4+PiArICogSWYgbm8gcGF0Y2ggaXMgcHJvdmlkZWQsIHRoZSBjYWNoZWQgcGF0Y2gg
d2lsbCBiZSBsb2FkZWQuIE1pY3JvY29kZSB1cGRhdGUNCj4+PiArICogZHVyaW5nIEFQcyBicmlu
Z3VwIGFuZCBDUFUgcmVzdW1pbmcgZmFsbHMgaW50byB0aGlzIGNhc2UuDQo+Pj4gKyAqLw0KPj4+
ICtzdGF0aWMgaW50IG1pY3JvY29kZV91cGRhdGVfY3B1KGNvbnN0IHN0cnVjdCBtaWNyb2NvZGVf
cGF0Y2ggKnBhdGNoKQ0KPj4+ICAgIHsNCj4+PiAtICAgIGludCBlcnI7DQo+Pj4gLSAgICB1bnNp
Z25lZCBpbnQgY3B1ID0gc21wX3Byb2Nlc3Nvcl9pZCgpOw0KPj4+IC0gICAgc3RydWN0IGNwdV9z
aWduYXR1cmUgKnNpZyA9ICZwZXJfY3B1KGNwdV9zaWcsIGNwdSk7DQo+Pj4gKyAgICBpbnQgZXJy
ID0gbWljcm9jb2RlX29wcy0+Y29sbGVjdF9jcHVfaW5mbygmdGhpc19jcHUoY3B1X3NpZykpOw0K
Pj4+ICsNCj4+PiArICAgIGlmICggdW5saWtlbHkoZXJyKSApDQo+Pj4gKyAgICAgICAgcmV0dXJu
IGVycjsNCj4+PiAgICANCj4+PiAgICAgICAgc3Bpbl9sb2NrKCZtaWNyb2NvZGVfbXV0ZXgpOw0K
Pj4+ICAgIA0KPj4+IC0gICAgZXJyID0gbWljcm9jb2RlX29wcy0+Y29sbGVjdF9jcHVfaW5mbyhz
aWcpOw0KPj4+IC0gICAgaWYgKCBsaWtlbHkoIWVycikgKQ0KPj4+IC0gICAgICAgIGVyciA9IG1p
Y3JvY29kZV9vcHMtPmNwdV9yZXF1ZXN0X21pY3JvY29kZShidWYsIHNpemUpOw0KPj4+ICsgICAg
aWYgKCBwYXRjaCApDQo+Pj4gKyAgICB7DQo+Pj4gKyAgICAgICAgLyoNCj4+PiArICAgICAgICAg
KiBJZiBhIHBhdGNoIGlzIHNwZWNpZmllZCwgaXQgc2hvdWxkIGhhcyBuZXdlciByZXZpc2lvbiB0
aGFuDQo+Pj4gKyAgICAgICAgICogdGhhdCBvZiB0aGUgcGF0Y2ggY2FjaGVkLg0KPj4+ICsgICAg
ICAgICAqLw0KPj4+ICsgICAgICAgIGlmICggbWljcm9jb2RlX2NhY2hlICYmDQo+Pj4gKyAgICAg
ICAgICAgICBtaWNyb2NvZGVfb3BzLT5jb21wYXJlX3BhdGNoKHBhdGNoLCBtaWNyb2NvZGVfY2Fj
aGUpICE9IE5FV19VQ09ERSApDQo+Pg0KPj4gV2hpbGUgSSBzZWUgdGhhdCB5b3UndmUgdGFrZW4g
Y2FyZSBvZiB0aGUgb25lIGNhc2UgaW4gSW50ZWwgc3BlY2lmaWMNCj4+IGNvZGUsIHRoaXMgaXMg
YWdhaW4gYSBjYXNlIHdoZXJlIEkgZG9uJ3QgdGhpbmsgeW91IGNhbiB2YWxpZGx5IGNhbGwNCj4+
IHRoaXMgaG9vayBpbiB0aGUgSW50ZWwgY2FzZS4gQWxiZWl0IG1heWJlIGl0IGlzIG9rYXksIHBy
b3ZpZGVkIHRoYXQNCj4+IHRoZSBjYWxsZXIgaGFzIGFscmVhZHkgdmVyaWZpZWQgaXQgYWdhaW5z
dCB0aGUgQ1BVIHNpZ25hdHVyZS4gVGhlbg0KPj4gYWdhaW4gSSB3b25kZXIgd2h5IHRoaXMgY2hl
Y2sgZ2V0cyBkb25lIGhlcmUgcmF0aGVyIHRoYW4gaW4gdGhlDQo+PiBjYWxsZXIgKG5leHQgdG8g
dGhhdCBvdGhlciBjaGVjaykgYW55d2F5LiBBZmFpY3MgdGhpcyB3YXkgeW91J2QNCj4+IGFsc28g
YXZvaWQgcmUtY2hlY2tpbmcgb24gZXZlcnkgQ1BVIGEgQ1BVLWluZGVwZW5kZW50IHByb3BlcnR5
Lg0KPiANCj4gQXMgc2FpZCBpbiBhbiBlYXJsaWVyIHJlcGx5IHRvIHBhdGNoIDYsIC0+Y29tcGFy
ZV9wYXRjaCBjYW4NCj4gYmUgc2ltcGxpZmllZCBhIGxvdC4gRG8geW91IHRoaW5rIGl0IGlzIGZp
bmUgdG8gY2FsbCBpdCBoZXJlDQo+IHdpdGggdGhhdCBjaGFuZ2U/DQoNCkFzIHNhaWQgdGhlcmUg
LSB5ZXMsIHRoaXMgbG9va3MgdG8gYmUgYW4gb3B0aW9uLg0KDQo+IEFib3V0IGF2b2lkaW5nIHJl
LWNoZWNraW5nLCB3ZSBzaG91bGQgY2hlY2sgaXQgd2l0aCAibWljcm9jb2RlX211dGV4Ig0KPiBo
ZWxkIG90aGVyd2lzZSB3ZSBjYW5ub3QgZW5zdXJlIG5vYm9keSBpcyB1cGRhdGluZyB0aGUgY2Fj
aGUuIElmIHdlIHdhbnQNCj4gdG8gYXZvaWQgcmUtY2hlY2tpbmcsIHRoZW4gdGhpcyBsb2NrIGlz
IGhlbGQgZm9yIGEgbG9uZyB0aW1lIGZyb20gbG9hZGluZw0KPiBvbiB0aGUgZmlyc3QgY29yZSB0
byB0aGUgbGFzdCBjb3JlLiBBbmQgYWxzbyBmb3IgZWFybHkgbG9hZGluZyBhbmQgbGF0ZQ0KPiBs
b2FkaW5nLCB3ZSBwYXNzICdOVUxMJyB0byB0aGlzIGZ1bmN0aW9uIG9uIGZvbGxvd2luZyBDUFVz
IGFmdGVyIHRoZQ0KPiBmaXJzdCBzdWNjZXNzZnVsIGxvYWRpbmcuIEkgYW0gYWZyYWlkIHRoYXQg
dGhlcmUgaXMgbm8gcmVkdW5kYW50IGNoZWNraW5nLg0KDQpUaGVyZSBzaG91bGQgbm90IGJlIGFu
eSB1cGRhdGluZyBvZiB0aGUgY2FjaGUgd2hpbGUgb25lIChzeXN0ZW0td2lkZSkNCnVjb2RlIGxv
YWQgb3BlcmF0aW9uIGlzIGluIHByb2dyZXNzLCBvciBlbHNlIHlvdSByaXNrIGxlYXZpbmcgdGhl
DQpzeXN0ZW0gaW4gYSAibWl4ZWQgdWNvZGUgdmVyc2lvbnMiIHN0YXRlIGluIHRoZSBlbmQuIEFz
IHNhaWQsIGFsc28NCmZyb20gYSBsb2dpY2FsIGZsb3ctb2YtZXZlbnRzIHBlcnNwZWN0aXZlIGl0
IHNlZW1zIHRvIG1lIHRoYXQgaXQgc2hvdWxkDQpiZSB0aGUgY2FsbGVyIHRvIHZhbGlkYXRlIGFw
cGxpY2FiaWxpdHkgb2YgdGhlIHBhdGNoIGJlZm9yZSBjYWxsaW5nDQpoZXJlLiBCdXQgYXMgYWxz
byBzYWlkLCBJIG1heSBhcyB3ZWxsIGJlIG1pc3Npbmcgc29tZSBpbXBvcnRhbnQgYXNwZWN0DQpo
ZXJlLg0KDQpKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
