Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73368685C9
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2019 10:53:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hmwg5-0002Gp-IR; Mon, 15 Jul 2019 08:49:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=IBxS=VM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hmwg4-0002Gj-31
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2019 08:49:44 +0000
X-Inumbo-ID: 75c8c294-a6dd-11e9-a7ce-cf8986793584
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 75c8c294-a6dd-11e9-a7ce-cf8986793584;
 Mon, 15 Jul 2019 08:49:40 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 15 Jul 2019 08:49:34 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 15 Jul 2019 08:32:56 +0000
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (15.124.8.13) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 15 Jul 2019 08:32:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cvc/2FZ1UTB3zdnaUBSYKsWrESxZNr29fx5h/hoYFkgrm0dlg0uLwGsEpHvV287h5QEy6Z6RwcNhxSozAHXJnek4QWxlmygKn5PUwt25Gnm/vYy9IFG+1emwzf5FxuHabBB3xUg4Lxb/ZFpoImrh2rl7Vg4w6U9cyEkh6WJ3KwJDSgPV220Ln9Wl2zDov/jYgz9t47cfcKjP4cb746Hh/A0xu1Am/o0ZdrUFU2NAXhxn5qTtSAqLFjidavQzNs8GDZeyd2Ckm96S8LaFOj2WZwnt6RIMQGzIEr2jlx6c+gggv6DBzoFliBVVeC6PcePJA4mvyde5Pv4Awgu1aUtBfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZRiRiwtMFSMFNasbCZjEFDpG14IsIYSHgeRffXU+Plc=;
 b=UPdYX5ZaVDmAiMcbKkrr8TtfcT25C6BWDJzBJbdhTh3p78JRRb8xVL9KvvH8i1M5wzrfcBo4heLasYw2LDHSAPfstbXCExWj002/7NcBUUv4nAkXtUdfN8R0j5d2bC+nNOZ+sOybwxfe06wq2MeWrqt4/4GKDRoNNEfIr9pvt3NuRZNgxLNwsDe0BXPNcHFdhwQUWdMJ3YZ3B2OGrg20XfgmAPcmXUkm/G56CBvPSDVYG9WTLdN7TCRh4Nd2Tnoh2nKoYY5W7aJobSnLsHVWopwgj0ySyPP+Iqf/Z/6oXwTAiPVBhygn44IfyUtOVxkD4fiv4144lbu52BWPzK73MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2635.namprd18.prod.outlook.com (20.179.106.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Mon, 15 Jul 2019 08:32:55 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Mon, 15 Jul 2019
 08:32:55 +0000
From: Jan Beulich <JBeulich@suse.com>
To: JulienGrall <julien.grall@arm.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@citrix.com>, "George
 Dunlap" <George.Dunlap@eu.citrix.com>, StefanoStabellini
 <sstabellini@kernel.org>, Konrad Wilk <konrad.wilk@oracle.com>, Tim Deegan
 <tim@xen.org>, Wei Liu <wl@xen.org>
Thread-Topic: =?utf-8?B?UGluZ8KyOiBbUEFUQ0ggdjJdIHRpbWVyczogbGltaXQgaGVhcCBzaXpl?=
Thread-Index: AQHVOufm+Uxu9Bu39061UMrLHYBS6g==
Date: Mon, 15 Jul 2019 08:32:55 +0000
Message-ID: <0db0794b-f1bf-a338-6843-988523769875@suse.com>
References: <df25ad2a-89f1-37a6-3e2e-d1306fef121a@suse.com>
In-Reply-To: <df25ad2a-89f1-37a6-3e2e-d1306fef121a@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR07CA0018.eurprd07.prod.outlook.com
 (2603:10a6:6:2d::28) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 81aefbd1-96cd-447f-8fbe-08d708ff089c
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2635; 
x-ms-traffictypediagnostic: DM6PR18MB2635:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM6PR18MB263514A8BE3E29513F50476DB3CF0@DM6PR18MB2635.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:189;
x-forefront-prvs: 00997889E7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(396003)(366004)(346002)(376002)(136003)(199004)(189003)(110136005)(6116002)(26005)(3846002)(966005)(14454004)(31686004)(305945005)(446003)(53936002)(2616005)(11346002)(14444005)(8936002)(256004)(36756003)(186003)(81156014)(81166006)(316002)(6436002)(52116002)(86362001)(31696002)(6506007)(386003)(76176011)(66066001)(4326008)(53546011)(68736007)(476003)(102836004)(66946007)(6486002)(66556008)(66476007)(64756008)(66446008)(478600001)(71190400001)(71200400001)(7736002)(5660300002)(99286004)(25786009)(486006)(6512007)(6306002)(80792005)(2906002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2635;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: OlKL5WFMkMuQE4iWs1wuAio9xPWPBg9O1l0UxdWlJ1ydWt4Mr/KpOWh8vUy5j/7yg7VNv1O8aDmt5CXLIq1cA0RDxUpuC3oy+u2Ya1QGgsU/Y5Lqsmn9j2gGOrvHCQVR7zAuwrADcaEUcODoEbgOEYn7WrQ5sGH6H+/5185q1p+NQaLpypKZMbun0Rqa5cJj4+8e3Q0fAOCOt4SzsfdokuiMVplL6bUmkfUuG8nXLpZ2rDLxHSB0ro9G4U6Uh6E3GJzaT9UlPOaW41lyJAymSGbuhCivFxydfQZI2KjMLTzxR9Oe6OTOtGIvjzJXSweuaNmrpw5i91TPFxOXB3L6Rz7r1nsEqtywz9Z0f44jCgukDXKnnlqDC7ZfE7YKwzK6GRzCcjaBzDNI0Gxdd0VHfFZaiofQQclir0nL9qzKKIY=
Content-ID: <D8AA2B865A93AE489D3311EFB2E43C25@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 81aefbd1-96cd-447f-8fbe-08d708ff089c
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2019 08:32:55.1899 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2635
X-OriginatorOrg: suse.com
Subject: [Xen-devel] =?utf-8?q?Ping=C2=B2=3A_=5BPATCH_v2=5D_timers=3A_limi?=
 =?utf-8?q?t_heap_size?=
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

T24gMDUuMDcuMjAxOSAxODowNiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+IE9uIDA1LjA2LjE5
IGF0IDA4OjUxLCAgd3JvdGU6DQo+PiBGaXJzdCBhbmQgZm9yZW1vc3QgbWFrZSB0aW1lcl9zb2Z0
aXJxX2FjdGlvbigpIGF2b2lkIGdyb3dpbmcgdGhlIGhlYXANCj4+IGlmIGl0cyBuZXcgc2l6ZSBj
YW4ndCBiZSBzdG9yZWQgd2l0aG91dCB0cnVuY2F0aW9uLiA2NGsgZW50cmllcyBpcyBhDQo+PiBs
b3QsIGFuZCBJIGRvbid0IHRoaW5rIHdlJ3JlIGF0IHJpc2sgb2YgYWN0dWFsbHkgcnVubmluZyBp
bnRvIHRoZSBpc3N1ZSwNCj4+IGJ1dCBJIGFsc28gdGhpbmsgaXQncyBiZXR0ZXIgbm90IHRvIGFs
bG93IGZvciBoYXJkIHRvIGRlYnVnIHByb2JsZW1zIHRvDQo+PiBvY2N1ciBpbiB0aGUgZmlyc3Qg
cGxhY2UuDQo+Pg0KPj4gRnVydGhlcm1vcmUgYWxzbyBhZGp1c3QgdGhlIGNvZGUgc3VjaCB0aGUg
c2l6ZS9saW1pdCBmaWVsZHMgYmVjb21pbmcNCj4+IHVuc2lnbmVkIGludCB3b3VsZCBhdCBsZWFz
dCB3b3JrIGZyb20gYSBtZXJlIHNpemluZyBwb2ludCBvZiB2aWV3LiBGb3INCj4+IHRoaXMgYWxz
byBzd2l0Y2ggdmFyaW91cyB1c2VzIG9mIHBsYWluIGludCB0byB1bnNpZ25lZCBpbnQuDQo+Pg0K
Pj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPj4gLS0t
DQo+PiB2MjogTG9nIChvbmNlKSB3aGVuIGhlYXAgbGltaXQgd291bGQgaGF2ZSBiZWVuIGV4Y2Vl
ZGVkLg0KPj4NCj4+IC0tLSBhL3hlbi9jb21tb24vdGltZXIuYw0KPj4gKysrIGIveGVuL2NvbW1v
bi90aW1lci5jDQo+PiBAQCAtNjMsOSArNjMsOSBAQCBzdGF0aWMgc3RydWN0IGhlYXBfbWV0YWRh
dGEgKmhlYXBfbWV0YWRhDQo+PiAgIH0NCj4+ICAgDQo+PiAgIC8qIFNpbmsgZG93biBlbGVtZW50
IEBwb3Mgb2YgQGhlYXAuICovDQo+PiAtc3RhdGljIHZvaWQgZG93bl9oZWFwKHN0cnVjdCB0aW1l
ciAqKmhlYXAsIGludCBwb3MpDQo+PiArc3RhdGljIHZvaWQgZG93bl9oZWFwKHN0cnVjdCB0aW1l
ciAqKmhlYXAsIHVuc2lnbmVkIGludCBwb3MpDQo+PiAgIHsNCj4+IC0gICAgaW50IHN6ID0gaGVh
cF9tZXRhZGF0YShoZWFwKS0+c2l6ZSwgbnh0Ow0KPj4gKyAgICB1bnNpZ25lZCBpbnQgc3ogPSBo
ZWFwX21ldGFkYXRhKGhlYXApLT5zaXplLCBueHQ7DQo+PiAgICAgICBzdHJ1Y3QgdGltZXIgKnQg
PSBoZWFwW3Bvc107DQo+PiAgIA0KPj4gICAgICAgd2hpbGUgKCAobnh0ID0gKHBvcyA8PCAxKSkg
PD0gc3ogKQ0KPj4gQEAgLTg0LDcgKzg0LDcgQEAgc3RhdGljIHZvaWQgZG93bl9oZWFwKHN0cnVj
dCB0aW1lciAqKmhlYQ0KPj4gICB9DQo+PiAgIA0KPj4gICAvKiBGbG9hdCBlbGVtZW50IEBwb3Mg
dXAgQGhlYXAuICovDQo+PiAtc3RhdGljIHZvaWQgdXBfaGVhcChzdHJ1Y3QgdGltZXIgKipoZWFw
LCBpbnQgcG9zKQ0KPj4gK3N0YXRpYyB2b2lkIHVwX2hlYXAoc3RydWN0IHRpbWVyICoqaGVhcCwg
dW5zaWduZWQgaW50IHBvcykNCj4+ICAgew0KPj4gICAgICAgc3RydWN0IHRpbWVyICp0ID0gaGVh
cFtwb3NdOw0KPj4gICANCj4+IEBAIC0xMDMsOCArMTAzLDggQEAgc3RhdGljIHZvaWQgdXBfaGVh
cChzdHJ1Y3QgdGltZXIgKipoZWFwLA0KPj4gICAvKiBEZWxldGUgQHQgZnJvbSBAaGVhcC4gUmV0
dXJuIFRSVUUgaWYgbmV3IHRvcCBvZiBoZWFwLiAqLw0KPj4gICBzdGF0aWMgaW50IHJlbW92ZV9m
cm9tX2hlYXAoc3RydWN0IHRpbWVyICoqaGVhcCwgc3RydWN0IHRpbWVyICp0KQ0KPj4gICB7DQo+
PiAtICAgIGludCBzeiA9IGhlYXBfbWV0YWRhdGEoaGVhcCktPnNpemU7DQo+PiAtICAgIGludCBw
b3MgPSB0LT5oZWFwX29mZnNldDsNCj4+ICsgICAgdW5zaWduZWQgaW50IHN6ID0gaGVhcF9tZXRh
ZGF0YShoZWFwKS0+c2l6ZTsNCj4+ICsgICAgdW5zaWduZWQgaW50IHBvcyA9IHQtPmhlYXBfb2Zm
c2V0Ow0KPj4gICANCj4+ICAgICAgIGlmICggdW5saWtlbHkocG9zID09IHN6KSApDQo+PiAgICAg
ICB7DQo+PiBAQCAtMTMwLDcgKzEzMCw3IEBAIHN0YXRpYyBpbnQgcmVtb3ZlX2Zyb21faGVhcChz
dHJ1Y3QgdGltZXINCj4+ICAgLyogQWRkIG5ldyBlbnRyeSBAdCB0byBAaGVhcC4gUmV0dXJuIFRS
VUUgaWYgbmV3IHRvcCBvZiBoZWFwLiAqLw0KPj4gICBzdGF0aWMgaW50IGFkZF90b19oZWFwKHN0
cnVjdCB0aW1lciAqKmhlYXAsIHN0cnVjdCB0aW1lciAqdCkNCj4+ICAgew0KPj4gLSAgICBpbnQg
c3ogPSBoZWFwX21ldGFkYXRhKGhlYXApLT5zaXplOw0KPj4gKyAgICB1bnNpZ25lZCBpbnQgc3og
PSBoZWFwX21ldGFkYXRhKGhlYXApLT5zaXplOw0KPj4gICANCj4+ICAgICAgIC8qIEZhaWwgaWYg
dGhlIGhlYXAgaXMgZnVsbC4gKi8NCj4+ICAgICAgIGlmICggdW5saWtlbHkoc3ogPT0gaGVhcF9t
ZXRhZGF0YShoZWFwKS0+bGltaXQpICkNCj4+IEBAIC00NjMsOSArNDYzLDE3IEBAIHN0YXRpYyB2
b2lkIHRpbWVyX3NvZnRpcnFfYWN0aW9uKHZvaWQpDQo+PiAgICAgICBpZiAoIHVubGlrZWx5KHRz
LT5saXN0ICE9IE5VTEwpICkNCj4+ICAgICAgIHsNCj4+ICAgICAgICAgICAvKiBvbGRfbGltaXQg
PT0gKDJebiktMTsgbmV3X2xpbWl0ID09ICgyXihuKzQpKS0xICovDQo+PiAtICAgICAgICBpbnQg
b2xkX2xpbWl0ID0gaGVhcF9tZXRhZGF0YShoZWFwKS0+bGltaXQ7DQo+PiAtICAgICAgICBpbnQg
bmV3X2xpbWl0ID0gKChvbGRfbGltaXQgKyAxKSA8PCA0KSAtIDE7DQo+PiAtICAgICAgICBzdHJ1
Y3QgdGltZXIgKipuZXdoZWFwID0geG1hbGxvY19hcnJheShzdHJ1Y3QgdGltZXIgKiwgbmV3X2xp
bWl0ICsNCj4+IDEpOw0KPj4gKyAgICAgICAgdW5zaWduZWQgaW50IG9sZF9saW1pdCA9IGhlYXBf
bWV0YWRhdGEoaGVhcCktPmxpbWl0Ow0KPj4gKyAgICAgICAgdW5zaWduZWQgaW50IG5ld19saW1p
dCA9ICgob2xkX2xpbWl0ICsgMSkgPDwgNCkgLSAxOw0KPj4gKyAgICAgICAgc3RydWN0IHRpbWVy
ICoqbmV3aGVhcCA9IE5VTEw7DQo+PiArDQo+PiArICAgICAgICAvKiBEb24ndCBncm93IHRoZSBo
ZWFwIGJleW9uZCB3aGF0IGlzIHJlcHJlc2VudGFibGUgaW4gaXRzDQo+PiBtZXRhZGF0YS4gKi8N
Cj4+ICsgICAgICAgIGlmICggbmV3X2xpbWl0ID09ICh0eXBlb2YoaGVhcF9tZXRhZGF0YShoZWFw
KS0+bGltaXQpKW5ld19saW1pdCAmJg0KPj4gKyAgICAgICAgICAgICBuZXdfbGltaXQgKyAxICkN
Cj4+ICsgICAgICAgICAgICBuZXdoZWFwID0geG1hbGxvY19hcnJheShzdHJ1Y3QgdGltZXIgKiwg
bmV3X2xpbWl0ICsgMSk7DQo+PiArICAgICAgICBlbHNlDQo+PiArICAgICAgICAgICAgcHJpbnRr
X29uY2UoWEVOTE9HX1dBUk5JTkcgIkNQVSV1OiB0aW1lciBoZWFwIGxpbWl0IHJlYWNoZWRcbiIs
DQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgc21wX3Byb2Nlc3Nvcl9pZCgpKTsNCj4+ICAg
ICAgICAgICBpZiAoIG5ld2hlYXAgIT0gTlVMTCApDQo+PiAgICAgICAgICAgew0KPj4gICAgICAg
ICAgICAgICBzcGluX2xvY2tfaXJxKCZ0cy0+bG9jayk7DQo+PiBAQCAtNTQ0LDcgKzU0OSw3IEBA
IHN0YXRpYyB2b2lkIGR1bXBfdGltZXJxKHVuc2lnbmVkIGNoYXIga2UNCj4+ICAgICAgIHN0cnVj
dCB0aW1lcnMgKnRzOw0KPj4gICAgICAgdW5zaWduZWQgbG9uZyAgZmxhZ3M7DQo+PiAgICAgICBz
X3RpbWVfdCAgICAgICBub3cgPSBOT1coKTsNCj4+IC0gICAgaW50ICAgICAgICAgICAgaSwgajsN
Cj4+ICsgICAgdW5zaWduZWQgaW50ICAgaSwgajsNCj4+ICAgDQo+PiAgICAgICBwcmludGsoIkR1
bXBpbmcgdGltZXIgcXVldWVzOlxuIik7DQo+PiAgIA0KPj4gQEAgLTU1Niw3ICs1NjEsNyBAQCBz
dGF0aWMgdm9pZCBkdW1wX3RpbWVycSh1bnNpZ25lZCBjaGFyIGtlDQo+PiAgICAgICAgICAgc3Bp
bl9sb2NrX2lycXNhdmUoJnRzLT5sb2NrLCBmbGFncyk7DQo+PiAgICAgICAgICAgZm9yICggaiA9
IDE7IGogPD0gaGVhcF9tZXRhZGF0YSh0cy0+aGVhcCktPnNpemU7IGorKyApDQo+PiAgICAgICAg
ICAgICAgIGR1bXBfdGltZXIodHMtPmhlYXBbal0sIG5vdyk7DQo+PiAtICAgICAgICBmb3IgKCB0
ID0gdHMtPmxpc3QsIGogPSAwOyB0ICE9IE5VTEw7IHQgPSB0LT5saXN0X25leHQsIGorKyApDQo+
PiArICAgICAgICBmb3IgKCB0ID0gdHMtPmxpc3Q7IHQgIT0gTlVMTDsgdCA9IHQtPmxpc3RfbmV4
dCApDQo+PiAgICAgICAgICAgICAgIGR1bXBfdGltZXIodCwgbm93KTsNCj4+ICAgICAgICAgICBz
cGluX3VubG9ja19pcnFyZXN0b3JlKCZ0cy0+bG9jaywgZmxhZ3MpOw0KPj4gICAgICAgfQ0KPj4N
Cj4+DQo+Pg0KPj4NCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18NCj4gWGVuLWRldmVsIG1haWxpbmcgbGlzdA0KPiBYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcNCj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA0KPiANCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
