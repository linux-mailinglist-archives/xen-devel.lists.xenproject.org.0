Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FF17A746
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 13:48:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsQaE-00021J-Kx; Tue, 30 Jul 2019 11:46:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zL4X=V3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hsQaD-00021D-Oj
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 11:46:21 +0000
X-Inumbo-ID: a3c63706-b2bf-11e9-a5fe-ab8aae0210c1
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a3c63706-b2bf-11e9-a5fe-ab8aae0210c1;
 Tue, 30 Jul 2019 11:46:17 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 30 Jul 2019 11:46:14 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 30 Jul 2019 11:43:14 +0000
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (15.124.72.13) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 30 Jul 2019 11:43:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C7/+4BjrVYbUREIzFeDIKVNIzYcH/WSsi80mxsQ80K98q88Oq4INSv2dyrGAEmakj/xtqYdPHqTTMW8SB7SScvEyUprnusLwfzSdr3sINyNjgdpZ/exg2eyoJIiAfFeqAyKPhSDlkcPJqd8EYYoHZbZQ5iiZ/tUolGuY+vG8CgbBZfK8xoQxAqzCKvsHaC+jmsgzAHnHczZmphmpYeOjLtd1hQz3g+EOJfnDa61YYGftQvgW5nRwcHAjGOB5fisyAHm4i0jeyolnhaJAFC4MLAh5YJ1SgphWzw0f9sL09pwjMYj2pNkvhgfM66wYRc5TgZzzhTHIqcrRUb2dI6/4og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hhLskxUrnsSdqY76xa9zsWOnNJriGaLXvafh/kZeJqs=;
 b=QAeqGtV9FAdOMoptSeXq2iA23cKLFxi/sFL8xYcm/ELjkksIkq/LOwpP8Km/HQEqJgeE/cgqstbr24Mq+LC9pjyhc4RsZ2NwDIEpe+/VuqJgc9lzqqwSXROGs5lCoylQJzsPqzdfsnllS+Mt0Hz09mxw37400ceWjXz4kw36c06Sl7v4PfVg/dWPrROv9LEabsQCUC91SOk2qqw1W9VzA+bTLC1QJW/+NP64qGOJakXi2fjvS2E3g6X2AMxP+XNfxFR0+bJqYD4w2nP8S2o1EKkHbmKf5nK7iOFLzXIOJXfQkErBZSOkzvaasf1X1zhw+YBdc/ss5CBy4wmF9+mqpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3155.namprd18.prod.outlook.com (10.255.136.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Tue, 30 Jul 2019 11:43:13 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 11:43:13 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH v3 09/10] xen/nodemask: Sanitise the remainder of the
 nodemask API
Thread-Index: AQHVRgbsWQPLgo+6rE+uTMPGcGF31qbjC9qA
Date: Tue, 30 Jul 2019 11:43:12 +0000
Message-ID: <bb272ab1-c63c-0d5a-9360-d7a8a22ee52e@suse.com>
References: <20190729121204.13559-1-andrew.cooper3@citrix.com>
 <20190729121204.13559-10-andrew.cooper3@citrix.com>
In-Reply-To: <20190729121204.13559-10-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6P18901CA0003.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:4:16::13) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7943ace5-30dd-41d0-83ce-08d714e31a3c
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3155; 
x-ms-traffictypediagnostic: BY5PR18MB3155:
x-microsoft-antispam-prvs: <BY5PR18MB3155B5FB6C6A29E98B926AB7B3DC0@BY5PR18MB3155.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(396003)(39860400002)(376002)(346002)(136003)(189003)(199004)(66476007)(66946007)(66556008)(64756008)(66446008)(486006)(54906003)(71190400001)(71200400001)(31686004)(3846002)(8936002)(80792005)(478600001)(31696002)(4326008)(476003)(7736002)(66066001)(6246003)(14454004)(86362001)(6116002)(6916009)(6512007)(53546011)(446003)(186003)(53936002)(6436002)(8676002)(52116002)(2616005)(68736007)(102836004)(2906002)(36756003)(6486002)(5660300002)(99286004)(25786009)(26005)(305945005)(6506007)(386003)(316002)(76176011)(229853002)(81166006)(81156014)(14444005)(256004)(11346002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3155;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kfDZQP8pWEvOWWdT/MaDPthjGu8lvBV4BnhHTU29zyWXWS7a47WFV/uLsERE84hiMULcL9qAk45QSBzYqDPKM+7LasRjEI5k6wt1BvEc6cSeqZIg7+BdsLuY/ZnEuef6qxQHGdf0bAkDAvaWFN1TIs8cvLefcGYtWrDc/ajG7x11wqeARsSG5TC6ZSAUk1vVqgpe7c1UV/NW+xorQHXGy0+ePrDeeobMce9AV/TFnRhoKwZ4m2Bs8dkxSsziMo7s7mhtLN/hHXwS5JBtVKWFeKE7pV3QDPn2cwP8gj6KnAhcHNZhWLpIa/36ViZcS59SUnA4hdwcgJnR6hqEhkK+ineLKCNJIRbcW64pd95c0Rw26GGVX9iEMqODZ1lVQXCyuHo4zNe5hjXNjLzfY+eF9gOt8bPpr5ogGi2foHv5g60=
Content-ID: <E345733A69C08C41AF441634CC0419A1@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7943ace5-30dd-41d0-83ce-08d714e31a3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 11:43:12.8908 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3155
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v3 09/10] xen/nodemask: Sanitise the
 remainder of the nodemask API
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

T24gMjkuMDcuMjAxOSAxNDoxMiwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gLS0tIGEveGVuL2Fy
Y2gveDg2L3NyYXQuYw0KPiArKysgYi94ZW4vYXJjaC94ODYvc3JhdC5jDQo+IEBAIC0zMzIsNyAr
MzMyLDcgQEAgYWNwaV9udW1hX21lbW9yeV9hZmZpbml0eV9pbml0KGNvbnN0IHN0cnVjdCBhY3Bp
X3NyYXRfbWVtX2FmZmluaXR5ICptYSkNCj4gICAJaWYgKCEobWEtPmZsYWdzICYgQUNQSV9TUkFU
X01FTV9IT1RfUExVR0dBQkxFKSkgew0KPiAgIAkJc3RydWN0IG5vZGUgKm5kID0gJm5vZGVzW25v
ZGVdOw0KPiAgIA0KPiAtCQlpZiAoIW5vZGVfdGVzdF9hbmRfc2V0KG5vZGUsIG1lbW9yeV9ub2Rl
c19wYXJzZWQpKSB7DQo+ICsJCWlmICghbm9kZW1hc2tfdGVzdF9hbmRfc2V0KG5vZGUsICZtZW1v
cnlfbm9kZXNfcGFyc2VkKSkgew0KDQpTaG91bGRuJ3QgdGhpcyBoYXZlIGJlY29tZSBfX25vZGVt
YXNrX3Rlc3RfYW5kX3NldCgpIGFscmVhZHkgaW4gdGhlDQpwcmV2aW91cyBwYXRjaCAod2l0aCB0
aGUgbGVhZGluZyB1bmRlcnNjb3JlcyB0YWtlbiBjYXJlIG9mIGluDQp3aGF0ZXZlciB3YXkgd2Ug
ZGVjaWRlIHRoZXJlKT8NCg0KPiBAQCAtMzc2LDcgKzM3Niw3IEBAIHN0YXRpYyBpbnQgX19pbml0
IG5vZGVzX2NvdmVyX21lbW9yeSh2b2lkKQ0KPiAgIA0KPiAgIAkJZG8gew0KPiAgIAkJCWZvdW5k
ID0gMDsNCj4gLQkJCWZvcl9lYWNoX25vZGVfbWFzayhqLCBtZW1vcnlfbm9kZXNfcGFyc2VkKQ0K
PiArCQkJZm9yX2VhY2hfbm9kZV9tYXNrKCBqLCAmbWVtb3J5X25vZGVzX3BhcnNlZCApDQoNCkhl
cmUgYW5kIGVsc2V3aGVyZSAtIGlmIHlvdSBhZGQgdGhlIGlubmVyIGJsYW5rcywgdGhlbiB0aGVy
ZSBhbHNvDQp3YW50cyB0byBiZSBhIGJsYW5rIGFoZWFkIG9mIHRoZSBvcGVuaW5nIHBhcmVudGhl
c2lzLg0KDQo+IEBAIC0xMTcxLDcgKzExNzEsNyBAQCBzdGF0aWMgdW5zaWduZWQgaW50IG5vZGVf
dG9fc2NydWIoYm9vbCBnZXRfbm9kZSkNCj4gICAgICAgICAgIG5vZGUgPSAwOw0KPiAgIA0KPiAg
ICAgICBpZiAoIG5vZGVfbmVlZF9zY3J1Yltub2RlXSAmJg0KPiAtICAgICAgICAgKCFnZXRfbm9k
ZSB8fCAhbm9kZV90ZXN0X2FuZF9zZXQobm9kZSwgbm9kZV9zY3J1YmJpbmcpKSApDQo+ICsgICAg
ICAgICAoIWdldF9ub2RlIHx8ICFub2RlbWFza190ZXN0X2FuZF9zZXQobm9kZSwgJm5vZGVfc2Ny
dWJiaW5nKSkgKQ0KPiAgICAgICAgICAgcmV0dXJuIG5vZGU7DQo+ICAgDQo+ICAgICAgIC8qDQo+
IEBAIC0xMjA1LDEwICsxMjA1LDEwIEBAIHN0YXRpYyB1bnNpZ25lZCBpbnQgbm9kZV90b19zY3J1
Yihib29sIGdldF9ub2RlKQ0KPiAgICAgICAgICAgICAgICAqIHRoZW4gd2UnZCBuZWVkIHRvIHRh
a2UgdGhpcyBsb2NrIGV2ZXJ5IHRpbWUgd2UgY29tZSBpbiBoZXJlLg0KPiAgICAgICAgICAgICAg
ICAqLw0KPiAgICAgICAgICAgICAgIGlmICggKGRpc3QgPCBzaG9ydGVzdCB8fCBjbG9zZXN0ID09
IE5VTUFfTk9fTk9ERSkgJiYNCj4gLSAgICAgICAgICAgICAgICAgIW5vZGVfdGVzdF9hbmRfc2V0
KG5vZGUsIG5vZGVfc2NydWJiaW5nKSApDQo+ICsgICAgICAgICAgICAgICAgICFub2RlbWFza190
ZXN0X2FuZF9zZXQobm9kZSwgJm5vZGVfc2NydWJiaW5nKSApDQo+ICAgICAgICAgICAgICAgew0K
PiAgICAgICAgICAgICAgICAgICBpZiAoIGNsb3Nlc3QgIT0gTlVNQV9OT19OT0RFICkNCj4gLSAg
ICAgICAgICAgICAgICAgICAgbm9kZV9jbGVhcihjbG9zZXN0LCBub2RlX3NjcnViYmluZyk7DQo+
ICsgICAgICAgICAgICAgICAgICAgIG5vZGVtYXNrX2NsZWFyKGNsb3Nlc3QsICZub2RlX3NjcnVi
YmluZyk7DQo+ICAgICAgICAgICAgICAgICAgIHNob3J0ZXN0ID0gZGlzdDsNCj4gICAgICAgICAg
ICAgICAgICAgY2xvc2VzdCA9IG5vZGU7DQo+ICAgICAgICAgICAgICAgfQ0KPiBAQCAtMTM2MCw3
ICsxMzYwLDcgQEAgYm9vbCBzY3J1Yl9mcmVlX3BhZ2VzKHZvaWQpDQo+ICAgICAgIHNwaW5fdW5s
b2NrKCZoZWFwX2xvY2spOw0KPiAgIA0KPiAgICBvdXRfbm9sb2NrOg0KPiAtICAgIG5vZGVfY2xl
YXIobm9kZSwgbm9kZV9zY3J1YmJpbmcpOw0KPiArICAgIG5vZGVtYXNrX2NsZWFyKG5vZGUsICZu
b2RlX3NjcnViYmluZyk7DQoNClNlZWluZyB0aGlzIGhhcHBlbiBhZnRlciBkcm9wcGluZyB0aGUg
aGVhcCBsb2NrLCBJIHRoaW5rIHRoZSB0d28NCm5vZGVtYXNrX3Rlc3RfYW5kX3NldCgpIHRoYXQg
SSd2ZSBsZWZ0IGluIGNvbnRleHQgYWJvdmUgY291bGQgYmUNCmNvbnZlcnRlZCB0byB0aGVpciBu
b24tbG9ja2VkIGNvdW50ZXJwYXJ0cyBhdCB0aGlzIG9jY2FzaW9uIChvcg0KYWdhaW4gaW4gdGhl
IHByZXZpb3VzIHBhdGNoKS4NCg0KPiAgICNpZiBNQVhfTlVNTk9ERVMgPiAxDQo+ICAgI2RlZmlu
ZSBmb3JfZWFjaF9ub2RlX21hc2sobm9kZSwgbWFzaykJCQlcDQo+IC0JZm9yICgobm9kZSkgPSBm
aXJzdF9ub2RlKG1hc2spOwkJCVwNCj4gKwlmb3IgKChub2RlKSA9IG5vZGVtYXNrX2ZpcnN0KG1h
c2spOwkJXA0KPiAgIAkJKG5vZGUpIDwgTUFYX05VTU5PREVTOwkJCVwNCj4gLQkJKG5vZGUpID0g
bmV4dF9ub2RlKChub2RlKSwgKG1hc2spKSkNCj4gKwkJKG5vZGUpID0gbm9kZW1hc2tfbmV4dChu
b2RlLCBtYXNrKSkNCj4gICAjZWxzZSAvKiBNQVhfTlVNTk9ERVMgPT0gMSAqLw0KPiAgICNkZWZp
bmUgZm9yX2VhY2hfbm9kZV9tYXNrKG5vZGUsIG1hc2spCQkJXA0KPiAtCWlmICghbm9kZXNfZW1w
dHkobWFzaykpCQkJCVwNCj4gKwlpZiAoICFub2RlbWFza19lbXB0eShtYXNrKSApCQkJXA0KPiAg
IAkJZm9yICgobm9kZSkgPSAwOyAobm9kZSkgPCAxOyAobm9kZSkrKykNCj4gICAjZW5kaWYgLyog
TUFYX05VTU5PREVTICovDQoNCkZ1cnRoZXIgdXAgaW4gdGhlIGZpbGUgeW91IGRpZCBhbHNvIHJl
cGxhY2UgdGFicyBhbmQgaW5zZXJ0IHNwYWNlcy4NCldvdWxkIHlvdSBtaW5kIGRvaW5nIHRoaXMg
aGVyZSBhcyB3ZWxsIChJIG5vdGljZSB5b3UndmUgYWRqdXN0ZWQNCnRoZSBpZigpIGFscmVhZHks
IGJ1dCBsZWZ0IHRoZSBmb3IoKXMgYWxvbmUpLg0KDQpKYW4NCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
