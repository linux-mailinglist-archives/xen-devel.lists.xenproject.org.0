Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A993560A03
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jul 2019 18:11:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hjQkx-00044g-4C; Fri, 05 Jul 2019 16:08:15 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hVvi=VC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hjQkv-00044b-LZ
 for xen-devel@lists.xenproject.org; Fri, 05 Jul 2019 16:08:13 +0000
X-Inumbo-ID: 0f447e46-9f3f-11e9-8980-bc764e045a96
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 0f447e46-9f3f-11e9-8980-bc764e045a96;
 Fri, 05 Jul 2019 16:08:11 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Fri,  5 Jul 2019 16:08:04 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 5 Jul 2019 16:06:07 +0000
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (15.124.72.12) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 5 Jul 2019 16:06:07 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3249.namprd18.prod.outlook.com (10.255.138.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Fri, 5 Jul 2019 16:06:06 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2052.019; Fri, 5 Jul 2019
 16:06:06 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <George.Dunlap@eu.citrix.com>, Ian Jackson <ian.jackson@citrix.com>, "Julien
 Grall" <julien.grall@arm.com>, Konrad Wilk <konrad.wilk@oracle.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Tim Deegan <tim@xen.org>, Wei Liu
 <wl@xen.org>
Thread-Topic: Ping: [PATCH v2] timers: limit heap size
Thread-Index: AQHVM0uNp+714kH6OUGWR8H+uusmrg==
Date: Fri, 5 Jul 2019 16:06:06 +0000
Message-ID: <df25ad2a-89f1-37a6-3e2e-d1306fef121a@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR07CA0050.eurprd07.prod.outlook.com
 (2603:10a6:6:2a::12) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8dad6b45-e801-4d02-6392-08d70162af6c
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3249; 
x-ms-traffictypediagnostic: BY5PR18MB3249:
x-microsoft-antispam-prvs: <BY5PR18MB3249F776DD8FCDE52E32F688B3F50@BY5PR18MB3249.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:189;
x-forefront-prvs: 008960E8EC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(376002)(346002)(39860400002)(366004)(136003)(199004)(189003)(99286004)(305945005)(486006)(2616005)(7736002)(66066001)(36756003)(476003)(64756008)(14444005)(256004)(4326008)(52116002)(66476007)(66556008)(386003)(81166006)(81156014)(25786009)(2906002)(31686004)(478600001)(53936002)(8676002)(80792005)(73956011)(6506007)(3846002)(8936002)(6116002)(66946007)(6512007)(110136005)(6436002)(53546011)(316002)(72206003)(14454004)(5660300002)(102836004)(66446008)(71190400001)(71200400001)(26005)(186003)(6486002)(31696002)(86362001)(68736007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3249;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tv+K/KwR0pTycOf6/7J5tgAJ8sYAU1rpkjFSP09FSZMxhWw0XNMugzdmQr9jTO0F36+slLEtrYPlc1q4PHrdFe4h3pD4T4v0BY5d7JhIxxIimk9i2eG9Lhi5OucrDpt2sPrP2P/aTUUOaTrMwWbkBzDrwNOSnyMQltgoY5XfXxWUJ8xlu5rdw96pmQeJg7rWXlLjXHWC06PJL8XL6Rp+GRUabOQbiL/gueP20guBh6cOQCZP9Iz91NPcpCD7xtZgZ6GBpPrDWvtnSNb0POuVW1qfs0LFJ1cQuiJPfCGu/QE+puDuiV9AablvWr/a9PVt9czYV+lDwE7i7ELZaUxEeII7SmIQCwsrO0TmzB5V+M046rCGEpigHwWvKEgr0ufO5O6KfG8IooSt6FFeiiIJNZKEcgkKqggLioZM86MchJA=
Content-ID: <DF9F67247614CF4181853CAF00F714DD@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dad6b45-e801-4d02-6392-08d70162af6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2019 16:06:06.2830 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3249
X-OriginatorOrg: suse.com
Subject: [Xen-devel] Ping: [PATCH v2] timers: limit heap size
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA1LjA2LjE5IGF0IDA4OjUxLCAgd3JvdGU6DQo+IEZpcnN0IGFuZCBmb3JlbW9zdCBt
YWtlIHRpbWVyX3NvZnRpcnFfYWN0aW9uKCkgYXZvaWQgZ3Jvd2luZyB0aGUgaGVhcA0KPiBpZiBp
dHMgbmV3IHNpemUgY2FuJ3QgYmUgc3RvcmVkIHdpdGhvdXQgdHJ1bmNhdGlvbi4gNjRrIGVudHJp
ZXMgaXMgYQ0KPiBsb3QsIGFuZCBJIGRvbid0IHRoaW5rIHdlJ3JlIGF0IHJpc2sgb2YgYWN0dWFs
bHkgcnVubmluZyBpbnRvIHRoZSBpc3N1ZSwNCj4gYnV0IEkgYWxzbyB0aGluayBpdCdzIGJldHRl
ciBub3QgdG8gYWxsb3cgZm9yIGhhcmQgdG8gZGVidWcgcHJvYmxlbXMgdG8NCj4gb2NjdXIgaW4g
dGhlIGZpcnN0IHBsYWNlLg0KPiANCj4gRnVydGhlcm1vcmUgYWxzbyBhZGp1c3QgdGhlIGNvZGUg
c3VjaCB0aGUgc2l6ZS9saW1pdCBmaWVsZHMgYmVjb21pbmcNCj4gdW5zaWduZWQgaW50IHdvdWxk
IGF0IGxlYXN0IHdvcmsgZnJvbSBhIG1lcmUgc2l6aW5nIHBvaW50IG9mIHZpZXcuIEZvcg0KPiB0
aGlzIGFsc28gc3dpdGNoIHZhcmlvdXMgdXNlcyBvZiBwbGFpbiBpbnQgdG8gdW5zaWduZWQgaW50
Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0K
PiAtLS0NCj4gdjI6IExvZyAob25jZSkgd2hlbiBoZWFwIGxpbWl0IHdvdWxkIGhhdmUgYmVlbiBl
eGNlZWRlZC4NCj4gDQo+IC0tLSBhL3hlbi9jb21tb24vdGltZXIuYw0KPiArKysgYi94ZW4vY29t
bW9uL3RpbWVyLmMNCj4gQEAgLTYzLDkgKzYzLDkgQEAgc3RhdGljIHN0cnVjdCBoZWFwX21ldGFk
YXRhICpoZWFwX21ldGFkYQ0KPiAgfQ0KPiAgDQo+ICAvKiBTaW5rIGRvd24gZWxlbWVudCBAcG9z
IG9mIEBoZWFwLiAqLw0KPiAtc3RhdGljIHZvaWQgZG93bl9oZWFwKHN0cnVjdCB0aW1lciAqKmhl
YXAsIGludCBwb3MpDQo+ICtzdGF0aWMgdm9pZCBkb3duX2hlYXAoc3RydWN0IHRpbWVyICoqaGVh
cCwgdW5zaWduZWQgaW50IHBvcykNCj4gIHsNCj4gLSAgICBpbnQgc3ogPSBoZWFwX21ldGFkYXRh
KGhlYXApLT5zaXplLCBueHQ7DQo+ICsgICAgdW5zaWduZWQgaW50IHN6ID0gaGVhcF9tZXRhZGF0
YShoZWFwKS0+c2l6ZSwgbnh0Ow0KPiAgICAgIHN0cnVjdCB0aW1lciAqdCA9IGhlYXBbcG9zXTsN
Cj4gIA0KPiAgICAgIHdoaWxlICggKG54dCA9IChwb3MgPDwgMSkpIDw9IHN6ICkNCj4gQEAgLTg0
LDcgKzg0LDcgQEAgc3RhdGljIHZvaWQgZG93bl9oZWFwKHN0cnVjdCB0aW1lciAqKmhlYQ0KPiAg
fQ0KPiAgDQo+ICAvKiBGbG9hdCBlbGVtZW50IEBwb3MgdXAgQGhlYXAuICovDQo+IC1zdGF0aWMg
dm9pZCB1cF9oZWFwKHN0cnVjdCB0aW1lciAqKmhlYXAsIGludCBwb3MpDQo+ICtzdGF0aWMgdm9p
ZCB1cF9oZWFwKHN0cnVjdCB0aW1lciAqKmhlYXAsIHVuc2lnbmVkIGludCBwb3MpDQo+ICB7DQo+
ICAgICAgc3RydWN0IHRpbWVyICp0ID0gaGVhcFtwb3NdOw0KPiAgDQo+IEBAIC0xMDMsOCArMTAz
LDggQEAgc3RhdGljIHZvaWQgdXBfaGVhcChzdHJ1Y3QgdGltZXIgKipoZWFwLA0KPiAgLyogRGVs
ZXRlIEB0IGZyb20gQGhlYXAuIFJldHVybiBUUlVFIGlmIG5ldyB0b3Agb2YgaGVhcC4gKi8NCj4g
IHN0YXRpYyBpbnQgcmVtb3ZlX2Zyb21faGVhcChzdHJ1Y3QgdGltZXIgKipoZWFwLCBzdHJ1Y3Qg
dGltZXIgKnQpDQo+ICB7DQo+IC0gICAgaW50IHN6ID0gaGVhcF9tZXRhZGF0YShoZWFwKS0+c2l6
ZTsNCj4gLSAgICBpbnQgcG9zID0gdC0+aGVhcF9vZmZzZXQ7DQo+ICsgICAgdW5zaWduZWQgaW50
IHN6ID0gaGVhcF9tZXRhZGF0YShoZWFwKS0+c2l6ZTsNCj4gKyAgICB1bnNpZ25lZCBpbnQgcG9z
ID0gdC0+aGVhcF9vZmZzZXQ7DQo+ICANCj4gICAgICBpZiAoIHVubGlrZWx5KHBvcyA9PSBzeikg
KQ0KPiAgICAgIHsNCj4gQEAgLTEzMCw3ICsxMzAsNyBAQCBzdGF0aWMgaW50IHJlbW92ZV9mcm9t
X2hlYXAoc3RydWN0IHRpbWVyDQo+ICAvKiBBZGQgbmV3IGVudHJ5IEB0IHRvIEBoZWFwLiBSZXR1
cm4gVFJVRSBpZiBuZXcgdG9wIG9mIGhlYXAuICovDQo+ICBzdGF0aWMgaW50IGFkZF90b19oZWFw
KHN0cnVjdCB0aW1lciAqKmhlYXAsIHN0cnVjdCB0aW1lciAqdCkNCj4gIHsNCj4gLSAgICBpbnQg
c3ogPSBoZWFwX21ldGFkYXRhKGhlYXApLT5zaXplOw0KPiArICAgIHVuc2lnbmVkIGludCBzeiA9
IGhlYXBfbWV0YWRhdGEoaGVhcCktPnNpemU7DQo+ICANCj4gICAgICAvKiBGYWlsIGlmIHRoZSBo
ZWFwIGlzIGZ1bGwuICovDQo+ICAgICAgaWYgKCB1bmxpa2VseShzeiA9PSBoZWFwX21ldGFkYXRh
KGhlYXApLT5saW1pdCkgKQ0KPiBAQCAtNDYzLDkgKzQ2MywxNyBAQCBzdGF0aWMgdm9pZCB0aW1l
cl9zb2Z0aXJxX2FjdGlvbih2b2lkKQ0KPiAgICAgIGlmICggdW5saWtlbHkodHMtPmxpc3QgIT0g
TlVMTCkgKQ0KPiAgICAgIHsNCj4gICAgICAgICAgLyogb2xkX2xpbWl0ID09ICgyXm4pLTE7IG5l
d19saW1pdCA9PSAoMl4obis0KSktMSAqLw0KPiAtICAgICAgICBpbnQgb2xkX2xpbWl0ID0gaGVh
cF9tZXRhZGF0YShoZWFwKS0+bGltaXQ7DQo+IC0gICAgICAgIGludCBuZXdfbGltaXQgPSAoKG9s
ZF9saW1pdCArIDEpIDw8IDQpIC0gMTsNCj4gLSAgICAgICAgc3RydWN0IHRpbWVyICoqbmV3aGVh
cCA9IHhtYWxsb2NfYXJyYXkoc3RydWN0IHRpbWVyICosIG5ld19saW1pdCArIA0KPiAxKTsNCj4g
KyAgICAgICAgdW5zaWduZWQgaW50IG9sZF9saW1pdCA9IGhlYXBfbWV0YWRhdGEoaGVhcCktPmxp
bWl0Ow0KPiArICAgICAgICB1bnNpZ25lZCBpbnQgbmV3X2xpbWl0ID0gKChvbGRfbGltaXQgKyAx
KSA8PCA0KSAtIDE7DQo+ICsgICAgICAgIHN0cnVjdCB0aW1lciAqKm5ld2hlYXAgPSBOVUxMOw0K
PiArDQo+ICsgICAgICAgIC8qIERvbid0IGdyb3cgdGhlIGhlYXAgYmV5b25kIHdoYXQgaXMgcmVw
cmVzZW50YWJsZSBpbiBpdHMgDQo+IG1ldGFkYXRhLiAqLw0KPiArICAgICAgICBpZiAoIG5ld19s
aW1pdCA9PSAodHlwZW9mKGhlYXBfbWV0YWRhdGEoaGVhcCktPmxpbWl0KSluZXdfbGltaXQgJiYN
Cj4gKyAgICAgICAgICAgICBuZXdfbGltaXQgKyAxICkNCj4gKyAgICAgICAgICAgIG5ld2hlYXAg
PSB4bWFsbG9jX2FycmF5KHN0cnVjdCB0aW1lciAqLCBuZXdfbGltaXQgKyAxKTsNCj4gKyAgICAg
ICAgZWxzZQ0KPiArICAgICAgICAgICAgcHJpbnRrX29uY2UoWEVOTE9HX1dBUk5JTkcgIkNQVSV1
OiB0aW1lciBoZWFwIGxpbWl0IHJlYWNoZWRcbiIsDQo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICBzbXBfcHJvY2Vzc29yX2lkKCkpOw0KPiAgICAgICAgICBpZiAoIG5ld2hlYXAgIT0gTlVMTCAp
DQo+ICAgICAgICAgIHsNCj4gICAgICAgICAgICAgIHNwaW5fbG9ja19pcnEoJnRzLT5sb2NrKTsN
Cj4gQEAgLTU0NCw3ICs1NDksNyBAQCBzdGF0aWMgdm9pZCBkdW1wX3RpbWVycSh1bnNpZ25lZCBj
aGFyIGtlDQo+ICAgICAgc3RydWN0IHRpbWVycyAqdHM7DQo+ICAgICAgdW5zaWduZWQgbG9uZyAg
ZmxhZ3M7DQo+ICAgICAgc190aW1lX3QgICAgICAgbm93ID0gTk9XKCk7DQo+IC0gICAgaW50ICAg
ICAgICAgICAgaSwgajsNCj4gKyAgICB1bnNpZ25lZCBpbnQgICBpLCBqOw0KPiAgDQo+ICAgICAg
cHJpbnRrKCJEdW1waW5nIHRpbWVyIHF1ZXVlczpcbiIpOw0KPiAgDQo+IEBAIC01NTYsNyArNTYx
LDcgQEAgc3RhdGljIHZvaWQgZHVtcF90aW1lcnEodW5zaWduZWQgY2hhciBrZQ0KPiAgICAgICAg
ICBzcGluX2xvY2tfaXJxc2F2ZSgmdHMtPmxvY2ssIGZsYWdzKTsNCj4gICAgICAgICAgZm9yICgg
aiA9IDE7IGogPD0gaGVhcF9tZXRhZGF0YSh0cy0+aGVhcCktPnNpemU7IGorKyApDQo+ICAgICAg
ICAgICAgICBkdW1wX3RpbWVyKHRzLT5oZWFwW2pdLCBub3cpOw0KPiAtICAgICAgICBmb3IgKCB0
ID0gdHMtPmxpc3QsIGogPSAwOyB0ICE9IE5VTEw7IHQgPSB0LT5saXN0X25leHQsIGorKyApDQo+
ICsgICAgICAgIGZvciAoIHQgPSB0cy0+bGlzdDsgdCAhPSBOVUxMOyB0ID0gdC0+bGlzdF9uZXh0
ICkNCj4gICAgICAgICAgICAgIGR1bXBfdGltZXIodCwgbm93KTsNCj4gICAgICAgICAgc3Bpbl91
bmxvY2tfaXJxcmVzdG9yZSgmdHMtPmxvY2ssIGZsYWdzKTsNCj4gICAgICB9DQo+IA0KPiANCj4g
DQo+IA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
