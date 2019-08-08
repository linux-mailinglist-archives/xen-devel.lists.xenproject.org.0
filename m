Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 829D985CC0
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 10:26:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvdhu-0007tg-RZ; Thu, 08 Aug 2019 08:23:34 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UoSe=WE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hvdhs-0007tb-R0
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 08:23:32 +0000
X-Inumbo-ID: cc7402d2-b9b5-11e9-8980-bc764e045a96
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id cc7402d2-b9b5-11e9-8980-bc764e045a96;
 Thu, 08 Aug 2019 08:23:30 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Thu,  8 Aug 2019 08:23:21 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 8 Aug 2019 08:21:57 +0000
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (15.124.8.12) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 8 Aug 2019 08:21:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=alTjbDjfSM/5Xr8jWPaoDTzkhYaqvuIEC4RXFmwXlojQH1OjVJUtBjIXNQP7h4pXkGSi0MNdjWOKgIhkDHdvDniXLbXKSYs1Bx34wpbSoJjVUHJ+Myx8oMMNDhPSZQNQtT3X/vtZs1wlkdyG0wqUyuimbYCJlwHrWaXmEx39vhlZoH4LmHycg/nXnlvLa3GxIfsT5mPDJOS7mFdBeM1E575PxasBiN44ZhPzUXrSOUCX0qcHcaLpnMJhsHegk/GZFaR9Cr6DKb4MsWEayBBXOh+P+Rt358teTL+UWA6Wk3Ph21hTLs5ZJ2abqcjRBab0HpYXiHv0K45q3pUIz7eJ1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LxVK+Kr9SoTISR2WW0jDseUBzRYDKXvDfjDELXfXj+c=;
 b=cpOmcxc9QdCGBFYB2LagwVVwAv0KGI0f6M53M3wfr79d1T0J6LD+RUq/e+yBCT3pmNecWsylYQaQBGWy1+49XcEIDrRHnQe/ri7QkTQSxwFYUZNifpu6lf7oGb96t7gRWIFx8834wx7V1FYM2t4bgMyBGyvxSJYZ0DSbMWwuw6lWSbg+IEO8sxXBU1han9A7oyJrse1vvUn1uHjZA8uzOLxTFXhFazw8ZN8iBV2yB3+O+xtkD/+O50kxvkPYDTsIcln5/Gf2zjvto4RWOaLFORooMD9S7G3Fvu6Nk3UYIJ4B+6KfhrCRakLYEE3q4Z2x5QZfivBjVFTcNhUj4+5MNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from MN2PR18MB3405.namprd18.prod.outlook.com (10.255.238.214) by
 MN2PR18MB2895.namprd18.prod.outlook.com (20.179.20.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.16; Thu, 8 Aug 2019 08:21:55 +0000
Received: from MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081]) by MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081%7]) with mapi id 15.20.2157.015; Thu, 8 Aug 2019
 08:21:55 +0000
From: Jan Beulich <JBeulich@suse.com>
To: =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
 <marmarek@invisiblethingslab.com>
Thread-Topic: [PATCH] EFI: add efi=mapbs option and parse efi= early
Thread-Index: AQHVTYDiJDDJv46naU6f+B83HbCEaabw6aaA
Date: Thu, 8 Aug 2019 08:21:54 +0000
Message-ID: <fc039376-dfc6-b281-c00d-3d1d263744c6@suse.com>
References: <20190808003158.5256-1-marmarek@invisiblethingslab.com>
In-Reply-To: <20190808003158.5256-1-marmarek@invisiblethingslab.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR01CA0107.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::48) To MN2PR18MB3405.namprd18.prod.outlook.com
 (2603:10b6:208:16c::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ecf01010-a70e-4e22-899a-08d71bd978e8
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR18MB2895; 
x-ms-traffictypediagnostic: MN2PR18MB2895:
x-microsoft-antispam-prvs: <MN2PR18MB2895EE8CF2821961C9597029B3D70@MN2PR18MB2895.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 012349AD1C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(366004)(376002)(346002)(39860400002)(396003)(199004)(189003)(6116002)(3846002)(76176011)(6916009)(7736002)(99286004)(229853002)(256004)(54906003)(52116002)(31686004)(11346002)(476003)(446003)(81156014)(2616005)(2906002)(6512007)(305945005)(8936002)(486006)(386003)(6506007)(7416002)(53546011)(53936002)(81166006)(6436002)(186003)(26005)(6486002)(102836004)(4326008)(71200400001)(31696002)(86362001)(80792005)(71190400001)(6246003)(66574012)(14454004)(8676002)(66066001)(64756008)(66476007)(316002)(66446008)(66556008)(66946007)(478600001)(36756003)(5660300002)(25786009);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR18MB2895;
 H:MN2PR18MB3405.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: zHatg4Xd8XI2+eN12aZvhf9dVBzP63Sv0c7VY5rpuFoMQ1aC7nZpNG8yY/2ckZVmwrH+oPZ9FS+OSjnHrBIZwC6pemQVgnkhu+mTPMLccRojOO0GYYrt6gXuF79A9u0emrZfLYGzu0rz0EJeIATqaKQvdB7Nsqgyt4Y2HZXNS30bUtFTx8i2KAtugajEgIargM054FiQCksy/B4xFC9uknWZijLaUX5ZmtW2+QmHuSutuYYoyarPfHzlWqReqvs8FLVpvwmVuCB+VqHXchT1yTnfa5v/rmvBQ1crLK0S5P1QnoeZzItzY0M84Ctw1+SkKswh3sl1tZf3cHUmnAVEQiu/cNXz6biLjcxyktPAZoJjJDTKpLsSi7BZhPlWlUN3hfGgKOQYht59uXodz52LDSD81Ggb6n99mV6LA34uIhk=
Content-ID: <5D0B05F2B5361248A327EF1D244B0D7A@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ecf01010-a70e-4e22-899a-08d71bd978e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2019 08:21:54.8412 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sbl+ybTNTJG28qGRxOKThudoB0VLGfw/tc4AaCN6/eFPUrH8Fw020z1IkELWv66BEVugT7cduMpVnH11rzd7aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB2895
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] EFI: add efi=mapbs option and parse efi=
 early
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien
 Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMDguMjAxOSAwMjozMSwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpICB3cm90ZToN
Cj4gV2hlbiBib290aW5nIFhlbiB2aWEgeGVuLmVmaSwgdGhlcmUgaXMgL21hcGJzIG9wdGlvbiB0
byB3b3JrYXJvdW5kDQo+IGNlcnRhaW4gcGxhdGZvcm0gaXNzdWVzIChhZGRlZCBpbiBmMzY4ODZi
ZGY0ICJFRkkvZWFybHk6IGFkZCAvbWFwYnMgdG8NCj4gbWFwIEVmaUJvb3RTZXJ2aWNlc3tDb2Rl
LERhdGF9IikuIEFkZCBzdXBwb3J0IGZvciBlZmk9bWFwYnMgb24gWGVuDQo+IGNtZGxpbmUgZm9y
IHRoZSBzYW1lIGVmZmVjdCBhbmQgcGFyc2UgaXQgdmVyeSBlYXJseSBpbiB0aGUNCj4gbXVsdGli
b290MitFRkkgYm9vdCBwYXRoLg0KPiANCj4gTm9ybWFsbHkgY21kbGluZSBpcyBwYXJzZWQgYWZ0
ZXIgcmVsb2NhdGluZyBNQjIgc3RydWN0dXJlLCB3aGljaCBoYXBwZW5zDQo+IHRvbyBsYXRlLiBU
byBoYXZlIGVmaT0gcGFyc2VkIGVhcmx5IGVub3VnaCwgc2F2ZSBjbWRsaW5lIHBvaW50ZXIgaW4N
Cj4gaGVhZC5TIGFuZCBwYXNzIGl0IGFzIHlldCBhbm90aGVyIGFyZ3VtZW50IHRvIGVmaV9tdWx0
aWJvb3QyKCkuIFRoaXMNCj4gd2F5IHdlIGF2b2lkIGludHJvZHVjaW5nIHlldCBhbm90aGVyIE1C
MiBzdHJ1Y3R1cmUgcGFyc2VyLg0KDQpJIGNhbiB3aGVyZSB5b3UncmUgY29taW5nIGZyb20gaGVy
ZSwgYnV0IEknbSBub3QgYXQgYWxsIGhhcHB5IHRvDQpzZWUgdGhlIGFtb3VudCBvZiBhc3NlbWJs
eSBjb2RlIGZ1cnRoZXIgZ3Jvdy4NCg0KPiAtLS0gYS9kb2NzL21pc2MveGVuLWNvbW1hbmQtbGlu
ZS5wYW5kb2MNCj4gKysrIGIvZG9jcy9taXNjL3hlbi1jb21tYW5kLWxpbmUucGFuZG9jDQo+IEBA
IC04ODYsNyArODg2LDcgQEAgZGlzYWJsZSBpdCAoZWRpZD1ubykuIFRoaXMgb3B0aW9uIHNob3Vs
ZCBub3Qgbm9ybWFsbHkgYmUgcmVxdWlyZWQNCj4gICBleGNlcHQgZm9yIGRlYnVnZ2luZyBwdXJw
b3Nlcy4NCj4gICANCj4gICAjIyMgZWZpDQo+IC0gICAgPSBMaXN0IG9mIFsgcnM9PGJvb2w+LCBh
dHRyPW5vfHVjIF0NCj4gKyAgICA9IExpc3Qgb2YgWyBycz08Ym9vbD4sIGF0dHI9bm98dWMsIG1h
cGJzPTxib29sPiBdDQo+ICAgDQo+ICAgQ29udHJvbHMgZm9yIGludGVyYWN0aW5nIHdpdGggdGhl
IHN5c3RlbSBFeHRlbmRlZCBGaXJtd2FyZSBJbnRlcmZhY2UuDQo+ICAgDQo+IEBAIC04OTksNiAr
ODk5LDEwIEBAIENvbnRyb2xzIGZvciBpbnRlcmFjdGluZyB3aXRoIHRoZSBzeXN0ZW0gRXh0ZW5k
ZWQgRmlybXdhcmUgSW50ZXJmYWNlLg0KPiAgICAgICBsZWF2ZSB0aGUgbWVtb3J5IHJlZ2lvbnMg
dW5tYXBwZWQsIHdoaWxlIGBhdHRyPXVjYCB3aWxsIG1hcCB0aGVtIGFzIGZ1bGx5DQo+ICAgICAg
IHVuY2FjaGVhYmxlLg0KPiAgIA0KPiArKiAgIFRoZSBgbWFwYnM9YCBib29sZWFuIGNvbnRyb2xz
IHdoZXRoZXIgRWZpQm9vdFNlcnZpY2Vze0NvZGUsRGF0YX0gc2hvdWxkDQo+ICsgICAgcmVtYWlu
IG1hcHBlZCBhZnRlciBFeGl0KCkgQm9vdFNlcnZpY2VzIGNhbGwuIEJ5IGRlZmF1bHQgdGhvc2Ug
bWVtb3J5IHJlZ2lvbnMNCj4gKyAgICB3aWxsIG5vdCBiZSBtYXBwZWQgYWZ0ZXIgRXhpdCgpIEJv
b3RTZXJ2aWNlcyBjYWxsLg0KDQpUaGVyZSBhcmUgcmVzdHJpY3Rpb25zIG5lY2Vzc2FyeSAoc2Vl
IGJlbG93KSB3aGljaCBzaG91bGQgYmUNCm1lbnRpb25lZCBoZXJlIGltby4NCg0KPiAtLS0gYS94
ZW4vYXJjaC94ODYvZWZpL2VmaS1ib290LmgNCj4gKysrIGIveGVuL2FyY2gveDg2L2VmaS9lZmkt
Ym9vdC5oDQo+IEBAIC0zMTUsOCArMzE1LDEwIEBAIHN0YXRpYyB2b2lkIF9faW5pdCBlZmlfYXJj
aF9oYW5kbGVfY21kbGluZShDSEFSMTYgKmltYWdlX25hbWUsDQo+ICAgICAgICAgICBuYW1lLnMg
PSAieGVuIjsNCj4gICAgICAgcGxhY2Vfc3RyaW5nKCZtYmkuY21kbGluZSwgbmFtZS5zKTsNCj4g
ICANCj4gLSAgICBpZiAoIG1iaS5jbWRsaW5lICkNCj4gKyAgICBpZiAoIG1iaS5jbWRsaW5lICkg
ew0KPiAgICAgICAgICAgbWJpLmZsYWdzIHw9IE1CSV9DTURMSU5FOw0KPiArICAgICAgICBlZmlf
ZWFybHlfcGFyc2VfY21kbGluZShtYmkuY21kbGluZSk7DQo+ICsgICAgfQ0KDQpXaHk/IFRoaXMg
aXMgdGhlIHhlbi5lZmkgYm9vdCBwYXRoLCBpc24ndCBpdD8gKEFsc28sIGlmIHRoaXMNCmNoYW5n
ZSB3YXMgdG8gc3RheSwgdGhlIG9wZW5pbmcgYnJhY2Ugd291bGQgbmVlZCB0byBnbyBvbiBpdHMN
Cm93biBsaW5lLikNCg0KPiBAQCAtNjg1LDYgKzY4OCw5IEBAIHZvaWQgX19pbml0IGVmaV9tdWx0
aWJvb3QyKEVGSV9IQU5ETEUgSW1hZ2VIYW5kbGUsIEVGSV9TWVNURU1fVEFCTEUgKlN5c3RlbVRh
YmxlDQo+ICAgDQo+ICAgICAgIGVmaV9pbml0KEltYWdlSGFuZGxlLCBTeXN0ZW1UYWJsZSk7DQo+
ICAgDQo+ICsgICAgaWYgKGNtZGxpbmUpDQo+ICsgICAgICAgIGVmaV9lYXJseV9wYXJzZV9jbWRs
aW5lKGNtZGxpbmUpOw0KDQpTdHlsZSBhZ2FpbiAobWlzc2luZyBibGFua3MgaW4gaWYoKSkuDQoN
Cj4gQEAgLTE0MTIsMTYgKzE0MTcsMzIgQEAgc3RhdGljIGludCBfX2luaXQgcGFyc2VfZWZpX3Bh
cmFtKGNvbnN0IGNoYXIgKnMpDQo+ICAgICAgICAgICAgICBlbHNlDQo+ICAgICAgICAgICAgICAg
ICAgcmMgPSAtRUlOVkFMOw0KPiAgICAgICAgICB9DQo+ICsgICAgICAgIGVsc2UgaWYgKCAodmFs
ID0gcGFyc2VfYm9vbGVhbigibWFwYnMiLCBzLCBzcykpID49IDAgKQ0KPiArICAgICAgICB7DQo+
ICsgICAgICAgICAgICBtYXBfYnMgPSB2YWw7DQo+ICsgICAgICAgIH0NCg0KVGhpcyBtYXkgX25v
dF8gYmUgYWNjZXB0ZWQgd2hlbiBjYWxsZWQgdGhlICJub3JtYWwiIHdheSwgc2luY2UgaXQNCndv
dWxkIHRoZW4gZmFpbCB0byBhZmZlY3QgZWZpX2FyY2hfcHJvY2Vzc19tZW1vcnlfbWFwKCksIGJ1
dCBpdA0Kd291bGQgYWZmZWN0IGVmaV9pbml0X21lbW9yeSgpLiBJIHRoZXJlZm9yZSB0aGluayB5
b3UgZG9uJ3Qgd2FudA0KdG8gY2FsbCB0aGlzIGZ1bmN0aW9uIGZyb20gZWZpX2Vhcmx5X3BhcnNl
X2NtZGxpbmUoKSwgYW5kIGluc3RlYWQNCnNpbXBseSBpZ25vcmUgdGhlIG9wdGlvbiBoZXJlLg0K
DQpBbHNvIChhZ2FpbiBpZiBmb3Igc29tZSByZWFzb24gdGhlIGNoYW5nZSB3YXMgdG8gc3RheSBh
cyBpcykgLQ0Kc3RyYXkgYnJhY2VzLg0KDQo+ICAgICAgICAgIGVsc2UNCj4gICAgICAgICAgICAg
IHJjID0gLUVJTlZBTDsNCj4gIA0KPiAgICAgICAgICBzID0gc3MgKyAxOw0KPiAtICAgIH0gd2hp
bGUgKCAqc3MgKTsNCj4gKyAgICAgICAgLyoNCj4gKyAgICAgICAgICogRW5kIHBhcnNpbmcgb24g
Ym90aCAnXDAnIGFuZCAnICcsDQo+ICsgICAgICAgICAqIHRvIG1ha2UgZWZpX2Vhcmx5X3BhcnNl
X2NtZGxpbmUgc2ltcGxlci4NCj4gKyAgICAgICAgICovDQo+ICsgICAgfSB3aGlsZSAoICpzcyAm
JiAqc3MgIT0gJyAnKTsNCj4gICANCj4gICAgICByZXR1cm4gcmM7DQo+ICB9DQo+ICBjdXN0b21f
cGFyYW0oImVmaSIsIHBhcnNlX2VmaV9wYXJhbSk7DQo+ICAgDQo+ICsvKiBFeHRyYWN0IGVmaT0g
cGFyYW0gZWFybHkgaW4gdGhlIGJvb3QgKi8NCj4gK3N0YXRpYyB2b2lkIF9faW5pdCBlZmlfZWFy
bHlfcGFyc2VfY21kbGluZShjb25zdCBjaGFyICpjbWRsaW5lKQ0KPiArew0KPiArICAgIGNvbnN0
IGNoYXIgKmVmaV9vcHQgPSBzdHJzdHIoY21kbGluZSwgImVmaT0iKTsNCj4gKyAgICBpZiAoIGVm
aV9vcHQgKQ0KDQpCbGFuayBsaW5lIG1pc3NpbmcgYWJvdmUgaGVyZS4NCg0KPiArICAgICAgICBw
YXJzZV9lZmlfcGFyYW0oZWZpX29wdCArIDQpOw0KPiArfQ0KDQpXaGF0IGFib3V0IG11bHRpcGxl
ICJlZmk9IiBvbiB0aGUgY29tbWFuZCBsaW5lPyBBbmQgd2hhdCBhYm91dA0KYSAoY3VycmVudGx5
IGJvZ3VzKSAiYWJjZWZpPSIgb24gdGhlIGNvbW1hbmQgbGluZSwgb3IgeWV0IHNvbWUNCm90aGVy
IHBhdHRlcm4gd3JvbmdseSBtYXRjaGluZyB0aGUgc3RyaW5nIHlvdSBzZWFyY2ggZm9yPw0KDQpK
YW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
