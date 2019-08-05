Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B45081598
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 11:36:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1huZMk-0002Gk-C0; Mon, 05 Aug 2019 09:33:18 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=gDv/=WB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1huZMi-0002Gf-H9
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2019 09:33:16 +0000
X-Inumbo-ID: 088e568f-b764-11e9-8980-bc764e045a96
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 088e568f-b764-11e9-8980-bc764e045a96;
 Mon, 05 Aug 2019 09:33:15 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Mon,  5 Aug 2019 09:33:06 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 5 Aug 2019 09:31:29 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (15.124.8.11) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 5 Aug 2019 09:31:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hwkyQyvzxGgq2UcY2LlpvfvluEYz6p5gJRe244T2XDHKbrN+yqW8kv1YQbP75xsR/Rw6G4HJelfQ8wscPq9HDNoYdyQphXfxnSAK5HfqRhPiE2mLR/b9+qjI+S1UUUj4mXTMAwFSV5lQnR/S5ucz0o/iaXf9kQgn0dcjQ7bjlcR29s7oEImZbrGaz4JsVZEGHl/IOHzDIZWrv9mWPJU/FpHXP0gpZK6m/TzH0qIEyodlNWsPH5mR97SDA3TNDdjG/+XmJHS9lFT30W4QXfwZ3n7cIUx9acAPd616u6gkUrvfv5oNxMGAD1pV8J2qkzUWFdxmXnQTQHqDGB8PTS1Kew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0jsTOYN7fKSsfLQfl0jYY3TRYoiEYaSoOoaXAm05XAM=;
 b=XMnB9tA8ePfh1OdHpAxGLxrkx6qiXY7qGhn6kJmzzooyLPM7LJwhALQfJH4qjrnFoyhtprBqRyPDWx+GRR7DfH5zzf0D2L1SysfFM3n3w9oFWp89LcfrXhPfHAyvsz1Vu01mY7fZZVAZiGynm9PfhvrYGXAnZa9/6FfEGUt5Fn8VMD4kpnL0Ed2eWn7VgrrO3qwjP1yqVhH1HO+0bkywXNouTcF/BntKW9s9aeLqckpl0wDIg6FmmymRgWkbYNwv94wRBtzhk9097jG5kIRcZDvf5ayu+QzMbOkY9zGMpJmbXVWe1YhOqdf1cgrS1uYz7lOSEKlYRRvDYsE2zwpw7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from MN2PR18MB3405.namprd18.prod.outlook.com (10.255.238.214) by
 MN2PR18MB2814.namprd18.prod.outlook.com (20.179.23.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.12; Mon, 5 Aug 2019 09:31:28 +0000
Received: from MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081]) by MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081%7]) with mapi id 15.20.2136.018; Mon, 5 Aug 2019
 09:31:28 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Chao Gao <chao.gao@intel.com>
Thread-Topic: [PATCH v8 06/16] microcode: introduce a global cache of ucode
 patch
Thread-Index: AQHVSFKbg6V+T8KOdE+RBvqghdKkCKbn8Z0AgAQ3fz+AACdbgA==
Date: Mon, 5 Aug 2019 09:31:28 +0000
Message-ID: <1f2f0b40-70fb-7727-38c4-6b2e7bc8fd1a@suse.com>
References: <1564654971-31328-1-git-send-email-chao.gao@intel.com>
 <1564654971-31328-7-git-send-email-chao.gao@intel.com>
 <87a8ebf4-75f7-2397-204a-794d04404d1f@suse.com>
 <20190805070258.GB19492@gao-cwp>
In-Reply-To: <20190805070258.GB19492@gao-cwp>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR05CA0065.eurprd05.prod.outlook.com
 (2603:10a6:208:be::42) To MN2PR18MB3405.namprd18.prod.outlook.com
 (2603:10b6:208:16c::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2420b69a-27fa-489f-964f-08d71987b12b
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR18MB2814; 
x-ms-traffictypediagnostic: MN2PR18MB2814:
x-microsoft-antispam-prvs: <MN2PR18MB281402268B02AAC2CDAEAC05B3DA0@MN2PR18MB2814.namprd18.prod.outlook.com>
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
x-microsoft-antispam-message-info: px4b1tGs0e7nJwbAG/uc+PbM08jJ5cCT4ij6b1MbPTahC+TR55SkgmhgN2MMwWn4KI8OYKU5NspF5DYjbJLrBbLJbVSLtSS7S6O00luvoSA96siqp/xW2KqNdVPZFEFFFSRJrzugn5CroqeEnQWYRO/pSIhJ1HLnTCYEeFW/jMjevIWpaStbMdwpSTqwypGftY5j+D15U9EgaB/GLA7vYjvdyhTm/3np7hurv65anJxHuHVZ6BNvVUM+UmD0ROz+XXm7se+8ueSGzEz9+/ZqCEKZLfs6a/K+j+GVBCZHYQ+4As3XukAs9URnZsjALa2rYf5ySwTbq9T98/j/EDByTLGBjZCta8BsQ8CSUaRfLD23eUvjJ1sc/ey9KQyl5rVE6m9taNCdovT/wHhv/NrDrPGAVH8QZkfTkH6LvWkhagE=
Content-ID: <71397D7444D7634F8EDD929A46251D7C@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2420b69a-27fa-489f-964f-08d71987b12b
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 09:31:28.2056 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB2814
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v8 06/16] microcode: introduce a global
 cache of ucode patch
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

T24gMDUuMDguMjAxOSAwOTowMiwgQ2hhbyBHYW8gd3JvdGU6DQo+IE9uIEZyaSwgQXVnIDAyLCAy
MDE5IGF0IDAyOjQ2OjU4UE0gKzAwMDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4gT24gMDEuMDgu
MjAxOSAxMjoyMiwgQ2hhbyBHYW8gd3JvdGU6DQo+Pj4gK2Jvb2wgbWljcm9jb2RlX3VwZGF0ZV9j
YWNoZShzdHJ1Y3QgbWljcm9jb2RlX3BhdGNoICpwYXRjaCkNCj4+PiArew0KPj4+ICsNCj4+PiAr
ICAgIEFTU0VSVChzcGluX2lzX2xvY2tlZCgmbWljcm9jb2RlX211dGV4KSk7DQo+Pj4gKw0KPj4+
ICsgICAgaWYgKCAhbWljcm9jb2RlX2NhY2hlICkNCj4+PiArICAgICAgICBtaWNyb2NvZGVfY2Fj
aGUgPSBwYXRjaDsNCj4+PiArICAgIGVsc2UgaWYgKCBtaWNyb2NvZGVfb3BzLT5jb21wYXJlX3Bh
dGNoKHBhdGNoLCBtaWNyb2NvZGVfY2FjaGUpID09DQo+Pj4gKyAgICAgICAgICAgICAgICAgIE5F
V19VQ09ERSApDQo+Pg0KPj4gSW5kZW50YXRpb24gaXMgd3JvbmcgaGVyZS4NCj4+DQo+Pj4gK3N0
YXRpYyBzdHJ1Y3QgbWljcm9jb2RlX3BhdGNoICphbGxvY19taWNyb2NvZGVfcGF0Y2goDQo+Pj4g
KyAgICBjb25zdCBzdHJ1Y3QgbWljcm9jb2RlX2FtZCAqbWNfYW1kKQ0KPj4+ICt7DQo+Pj4gKyAg
ICBzdHJ1Y3QgbWljcm9jb2RlX3BhdGNoICptaWNyb2NvZGVfcGF0Y2ggPSB4bWFsbG9jKHN0cnVj
dCBtaWNyb2NvZGVfcGF0Y2gpOw0KPj4+ICsgICAgc3RydWN0IG1pY3JvY29kZV9hbWQgKmNhY2hl
ID0geG1hbGxvYyhzdHJ1Y3QgbWljcm9jb2RlX2FtZCk7DQo+Pj4gKyAgICB2b2lkICptcGIgPSB4
bWFsbG9jX2J5dGVzKG1jX2FtZC0+bXBiX3NpemUpOw0KPj4+ICsgICAgc3RydWN0IGVxdWl2X2Nw
dV9lbnRyeSAqZXF1aXZfY3B1X3RhYmxlID0NCj4+PiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB4bWFsbG9jX2J5dGVzKG1jX2FtZC0+ZXF1aXZfY3B1X3RhYmxlX3NpemUpOw0KPj4+
ICsNCj4+PiArICAgIGlmICggIW1pY3JvY29kZV9wYXRjaCB8fCAhY2FjaGUgfHwgIW1wYiB8fCAh
ZXF1aXZfY3B1X3RhYmxlICkNCj4+PiArICAgIHsNCj4+PiArICAgICAgICB4ZnJlZShtaWNyb2Nv
ZGVfcGF0Y2gpOw0KPj4+ICsgICAgICAgIHhmcmVlKGNhY2hlKTsNCj4+PiArICAgICAgICB4ZnJl
ZShtcGIpOw0KPj4+ICsgICAgICAgIHhmcmVlKGVxdWl2X2NwdV90YWJsZSk7DQo+Pj4gKyAgICAg
ICAgcmV0dXJuIEVSUl9QVFIoLUVOT01FTSk7DQo+Pj4gKyAgICB9DQo+Pj4gKw0KPj4+ICsgICAg
bWVtY3B5KG1wYiwgbWNfYW1kLT5tcGIsIG1jX2FtZC0+bXBiX3NpemUpOw0KPj4+ICsgICAgY2Fj
aGUtPm1wYiA9IG1wYjsNCj4+PiArICAgIGNhY2hlLT5tcGJfc2l6ZSA9IG1jX2FtZC0+bXBiX3Np
emU7DQo+Pj4gKyAgICBtZW1jcHkoZXF1aXZfY3B1X3RhYmxlLCBtY19hbWQtPmVxdWl2X2NwdV90
YWJsZSwNCj4+PiArICAgICAgICAgICBtY19hbWQtPmVxdWl2X2NwdV90YWJsZV9zaXplKTsNCj4+
PiArICAgIGNhY2hlLT5lcXVpdl9jcHVfdGFibGUgPSBlcXVpdl9jcHVfdGFibGU7DQo+Pj4gKyAg
ICBjYWNoZS0+ZXF1aXZfY3B1X3RhYmxlX3NpemUgPSBtY19hbWQtPmVxdWl2X2NwdV90YWJsZV9z
aXplOw0KPj4+ICsgICAgbWljcm9jb2RlX3BhdGNoLT5tY19hbWQgPSBjYWNoZTsNCj4+PiArDQo+
Pj4gKyAgICByZXR1cm4gbWljcm9jb2RlX3BhdGNoOw0KPj4+ICt9DQo+Pg0KPj4gV2h5IGlzIGl0
IHRoYXQgZXZlcnl0aGluZyBuZWVkcyB0byBiZSBjb3BpZWQgaGVyZSwgcmF0aGVyIHRoYW4NCj4+
IHNpbXBseSBzaHVmZmxpbmcgb25lIChvciBhIGZldykgcG9pbnRlcihzKT8gQ2FuJ3QgdGhlIGNh
bGxlcg0KPj4gc2ltcGx5IGluc3RhbGwgdGhlIGFyZ3VtZW50IGl0IHBhc3NlcyBoZXJlIGFzIHRo
ZSBuZXcgY2FjaGUgYmxvYj8NCj4gDQo+IFRoZSBvbGQgcGVyLWNwdSBjYWNoZSB3b3VsZCB1c2Ug
dGhlIHBvaW50ZXJzLiBBbmQgdGhlIG9sZCBjYWNoZSBzdHJ1Y3QNCj4gaXMgcmVtb3ZlZCBpbiAi
bWljcm9jb2RlOiByZW1vdmUgc3RydWN0IHVjb2RlX2NwdV9pbmZvIi4gSSBjYW4gYWRkIGENCj4g
cGF0Y2ggYWZ0ZXIgdGhhdCBvbmUgdG8gcmV1c2UgdGhlIHBvaW50ZXJzLiBPdGhlcndpc2UsIEkg
bWF5IGhhdmUgdG8NCj4gbWVyZ2UgZm9sbG93aW5nIHR3byBwYXRjaGVzIGludG8gdGhpcyBvbmUu
DQoNCklmIHRoaXMgaXMganVzdCBhIHRyYW5zaXRvcnkgc3RlcCwgdGhlbiBpdCdzIGZpbmUsIGJ1
dCB5b3Ugc2hvdWxkDQpzYXkgc28gaW4gdGhlIGRlc2NyaXB0aW9uIChhbmQgdGhlIHBhdGNoIHRv
IHJlLXVzZSB0aGUgYWxyZWFkeQ0KYWxsb2NhdGVkIHNwYWNlIHdvdWxkIHRoZW4gYmUgbmljZSB0
byBiZSBwYXJ0IG9mIHRoaXMgc2VyaWVzKS4NCg0KPj4+ICtzdGF0aWMgZW51bSBtaWNyb2NvZGVf
bWF0Y2hfcmVzdWx0IGNvbXBhcmVfcGF0Y2goDQo+Pj4gKyAgICBjb25zdCBzdHJ1Y3QgbWljcm9j
b2RlX3BhdGNoICpuZXcsIGNvbnN0IHN0cnVjdCBtaWNyb2NvZGVfcGF0Y2ggKm9sZCkNCj4+PiAr
ew0KPj4+ICsgICAgY29uc3Qgc3RydWN0IG1pY3JvY29kZV9oZWFkZXJfaW50ZWwgKm9sZF9oZWFk
ZXIgPSAmb2xkLT5tY19pbnRlbC0+aGRyOw0KPj4+ICsNCj4+PiArICAgIHJldHVybiBtaWNyb2Nv
ZGVfdXBkYXRlX21hdGNoKCZuZXctPm1jX2ludGVsLT5oZHIsIG9sZF9oZWFkZXItPnNpZywNCj4+
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG9sZF9oZWFkZXItPnBmLCBvbGRf
aGVhZGVyLT5yZXYpOw0KPj4NCj4+IFNvIHRoaXMgaXMgZXhhY3RseSB3aGF0IEkgc2FpZCBvbiB0
aGUgZWFybGllciBwYXRjaCB0aGUgZnVuY3Rpb24NCj4+IGNhbm5vdCBiZSB1c2VkIGZvci4gVGhl
IHdheSAicGYiIHdvcmtzIHByZWNsdWRlcyB0aGlzLCBhcyBzYWlkIGluDQo+PiByZXBseSB0byBh
biBlYXJsaWVyIHZlcnNpb24sIGFuZCBuby1vbmUgY29ycmVjdGVkIG1lIChpLmUuIEknbSBpbg0K
Pj4gbm8gd2F5IGV4Y2x1ZGluZyBJJ20gbWlzdW5kZXJzdGFuZGluZyBzb21ldGhpbmcgaGVyZSku
DQo+IA0KPiBIb3cgYWJvdXQganVzdCBjaGVjayAncmV2JyBoZXJlIGFuZCBsZWF2ZSBhIGNvbW1l
bnQgaGVyZSB0byBleHBsYWluDQo+IHdoeT8NCj4gDQo+IFdlIGRyb3BzIGFsbCBtaXNtYXRjaGVk
IHBhdGNoZXMgKGluY2x1ZGluZyB0aGF0IG9ubHkgaGFzICdwZicNCj4gbWlzbWF0Y2hlZCkgY29t
cGFyZWQgd2l0aCBjdXJyZW50IENQVSBzaWduYXR1cmUuIEdpdmVuIHRoYXQsIGl0IGlzDQo+IGZp
bmUgdG8gb25seSBjaGVjayB0aGUgcmV2aXNpb24gbnVtYmVyLg0KDQpBaCwgeWVzLCB0aGF0J3Mg
YXBwYXJlbnRseSBhbm90aGVyIG9wdGlvbi4gQnV0IGl0J2xsIHJlcXVpcmUgcmUtd29ya2luZw0K
bWljcm9jb2RlX3VwZGF0ZV9tYXRjaCgpLCBvciBub3QgdXNpbmcgaXQgaGVyZSwgYWZhaWNzLg0K
DQpKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
