Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B65B48642A
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 16:17:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvjBc-0004zG-T5; Thu, 08 Aug 2019 14:14:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UoSe=WE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hvjBb-0004zB-3q
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 14:14:35 +0000
X-Inumbo-ID: d55977c8-b9e6-11e9-bbfe-73f7a6a19d91
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d55977c8-b9e6-11e9-bbfe-73f7a6a19d91;
 Thu, 08 Aug 2019 14:14:32 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Thu,  8 Aug 2019 14:14:16 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 8 Aug 2019 14:03:50 +0000
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (15.124.72.12) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 8 Aug 2019 14:03:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XM9JC486FtpSZ3CKTU987GjBYU51901ZWzZvdzofeY7CKjDXL9HwJsDj5ohsCkGnQFaBhJOaO8Hg/stk68p6WQlonlBB1+0EbWorjNVNEAb+YIde5daSYOxjWvDSMrhzagDsl4NxMjpQktm0fVMkjYxMflT2a+RvgiksCr0vCyJXrJms710Lr0XeRfbRBQcG4SSxRAZCTcmxCSWER0hqQonks/pt6ybow0o+ot7U2Q/9P4pDLm+4ywRGScUXs7je7+j97dnBbyowqgC3qDDwm8vagBI6z5FY+xbrcJpyGY8F7bbotEyM9aR+sS1d4FKGEuklRA4B9WjV3B8sY4ot9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q2EW2uIVXjRhCo8bGk5DZ7EKvChmBWK3b7O+xJzyhNo=;
 b=QiIfOlrObhEkoGSp2nO4tEQU/wnNc0F7HPdP38wtOpz2Jy92cD2pQl3GJON1WKZrxPNHD4SRFWUiMr9VjCD7GwIHtFWJY00iwl2Cv0bTqTYyMi17OsXioQDcPh15kTd4wp/DUSFzvJ7Cv49TOAc3TA3+ZzbSOw+2d9Bzjbk3W+GSb0Fi4eTCpAL+ES6LrY0IOpXClmMdhDc2qOrd8aw2j5silM1s+p3XxM5DfUMJGhaipv/KBf0l6YSbkjj+gbjPFPIsIFGogbIbiC3gNYUe1gH7UCS3FYsE1wfYvd46tAoHakeTjtpfoICph91K+yuV9Kp9HgP5qhXkbaZSpfHwrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from MN2PR18MB3405.namprd18.prod.outlook.com (10.255.238.214) by
 MN2PR18MB2653.namprd18.prod.outlook.com (20.179.82.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.16; Thu, 8 Aug 2019 14:03:49 +0000
Received: from MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081]) by MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081%7]) with mapi id 15.20.2157.015; Thu, 8 Aug 2019
 14:03:49 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH v2 3/4] xen/public: Document HYPERCALL_console_io()
Thread-Index: AQHVS5H3rF8fjtFYWUKTMuHKikJ936bxTQiA
Date: Thu, 8 Aug 2019 14:03:48 +0000
Message-ID: <85eea744-c2f9-748e-c2a6-8382320b33fd@suse.com>
References: <20190805132955.1630-1-julien.grall@arm.com>
 <20190805132955.1630-4-julien.grall@arm.com>
In-Reply-To: <20190805132955.1630-4-julien.grall@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM4PR0202CA0018.eurprd02.prod.outlook.com
 (2603:10a6:200:89::28) To MN2PR18MB3405.namprd18.prod.outlook.com
 (2603:10b6:208:16c::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 263502b4-71a4-49e3-80a7-08d71c093c3f
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR18MB2653; 
x-ms-traffictypediagnostic: MN2PR18MB2653:
x-microsoft-antispam-prvs: <MN2PR18MB26533729661C1898907F9183B3D70@MN2PR18MB2653.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 012349AD1C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(396003)(366004)(346002)(376002)(39860400002)(199004)(189003)(25786009)(80792005)(2906002)(256004)(8936002)(6512007)(14454004)(305945005)(7736002)(14444005)(81156014)(81166006)(6436002)(8676002)(6486002)(6116002)(53936002)(229853002)(3846002)(31686004)(52116002)(54906003)(476003)(446003)(486006)(11346002)(2616005)(102836004)(71190400001)(316002)(53546011)(386003)(6506007)(186003)(478600001)(26005)(66446008)(64756008)(66476007)(6246003)(6916009)(4326008)(66946007)(99286004)(71200400001)(36756003)(66556008)(5660300002)(66066001)(31696002)(86362001)(76176011);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR18MB2653;
 H:MN2PR18MB3405.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0DdKCH6twdGEom8y2iHQhe5/h4RjlIdSagFis1RVIfUKvSAdwb7ngOv6HoWkn6y++5pykqtPyy1i3zrEsT0UqXMASwHbfkoNtwYqLNbUqu4nD85TRo12u7YaKl0ieRgKhPz5IUoM/YAs4TlBfl0y0ZdGjUBKUcxl9s7ASSl3QMTde7CCSbmGJQewRo8lKj8aQNrW7UF5btWgt8ISjxYtwLok3GbGviWfn613MvQTTS6SIwbHlJq7qO6OB33v7O76QyDv5YSBMZQ/qq6pyu7MCQuVZHPFa4kgTByjOie8D2z0U+V8fw1YMkhoOkO2IU56U5aIVaQF9Ypm19jrAHQMerMDZsr9vEu6hZycn6a6Btvr7RJXErwbgVEBBOLwQYL5k/QPyWaZinWyoEw+hvJw/mkqup7lD/YbHeB4dCYewGQ=
Content-ID: <AEA2AB1DFF95534F8AD7E576AF09DBDB@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 263502b4-71a4-49e3-80a7-08d71c093c3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2019 14:03:48.9161 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6QIGjnaql1Go8x77T1oW8Ha61rL9vcuEtKE+quouRLpUuxYoiYo44ku4ePWa4fZp55BKaHKdRxyUf4CJ0+atjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB2653
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v2 3/4] xen/public: Document
 HYPERCALL_console_io()
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
 George Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Tim Deegan <tim@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDguMjAxOSAxNToyOSwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPiBDdXJyZW50bHksIE9T
IGRldmVsb3BwZXJzIHdpbGwgaGF2ZSB0byBsb29rIGF0IFhlbiBjb2RlIGluIG9yZGVyIHRvIGtu
b3cNCj4gdGhlIHBhcmFtZXRlcnMgb2YgYW4gaHlwZXJjYWxsIGFuZCBob3cgaXQgaXMgbWVhbnQg
dG8gd29yay4NCj4gDQo+IFRoaXMgaXMgbm90IGEgdHJpdmlhbCB0YXNrIGFzIHlvdSBtYXkgbmVl
ZCB0byBoYXZlIGEgZGVlcCB1bmRlcnN0YW5kaW5nDQo+IG9mIFhlbiBpbnRlcm5hbC4NCj4gDQo+
IFRoaXMgcGF0Y2ggYXR0ZW1wdHMgdG8gZG9jdW1lbnQgdGhlIGJlaGF2aW9yIG9mIEhZUEVSQ0FM
TF9jb25zb2xlX2lvKCkgdG8NCj4gaGVscCBPUyBkZXZlbG9wZXIuDQo+IA0KPiBTaWduZWQtb2Zm
LWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPg0KDQpBY2tlZC1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0Kd2l0aCBhIGNvdXBsZSBvZiBuaXRzOg0KDQo+
IC0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy94ZW4uaA0KPiArKysgYi94ZW4vaW5jbHVkZS9wdWJs
aWMveGVuLmgNCj4gQEAgLTQ4Niw3ICs0ODYsMjkgQEAgREVGSU5FX1hFTl9HVUVTVF9IQU5ETEUo
bW11ZXh0X29wX3QpOw0KPiAgIC8qIGAgfSAqLw0KPiAgIA0KPiAgIC8qDQo+IC0gKiBDb21tYW5k
cyB0byBIWVBFUlZJU09SX2NvbnNvbGVfaW8oKS4NCj4gKyAqIGAgaW50DQo+ICsgKiBgIEhZUEVS
VklTT1JfY29uc29sZV9pbyh1bnNpZ25lZCBpbnQgY21kLA0KPiArICogYCAgICAgICAgICAgICAg
ICAgICAgICAgdW5zaWduZWQgaW50IGNvdW50LA0KPiArICogYCAgICAgICAgICAgICAgICAgICAg
ICAgY2hhciBidWZmZXJbXSk7DQo+ICsgKg0KPiArICogQGNtZDogQ29tbWFuZCAoc2VlIGJlbG93
KQ0KPiArICogQGNvdW50OiBTaXplIG9mIHRoZSBidWZmZXIgdG8gcmVhZC93cml0ZQ0KPiArICog
QGJ1ZmZlcjogUG9pbnRlciBpbiB0aGUgZ3Vlc3QgbWVtb3J5DQo+ICsgKg0KPiArICogTGlzdCBv
ZiBjb21tYW5kczoNCj4gKyAqDQo+ICsgKiAgKiBDT05TT0xFSU9fd3JpdGU6IFdyaXRlIHRoZSBi
dWZmZXIgb24gWGVuIGNvbnNvbGUuDQoNCnMvIG9uIC8gdG8gLyA/DQoNCj4gKyAqICAgICAgRm9y
IHRoZSBoYXJkd2FyZSBkb21haW4sIGFsbCB0aGUgY2hhcmFjdGVycyBpbiB0aGUgYnVmZmVyIHdp
bGwNCj4gKyAqICAgICAgYmUgd3JpdHRlbi4gQ2hhcmFjdGVycyB3aWxsIGJlIHByaW50ZWQgdG8g
ZGlyZWN0bHkgdG8gdGhlDQoNClRoZSBmaXJzdCAidG8iIGxvb2tzIHRvIGJlIHVud2FudGVkLg0K
DQo+ICsgKiAgICAgIGNvbnNvbGUuDQo+ICsgKiAgICAgIEZvciBhbGwgdGhlIG90aGVyIGRvbWFp
bnMsIG9ubHkgdGhlIHByaW50YWJsZSBjaGFyYWN0ZXJzIHdpbGwgYmUNCj4gKyAqICAgICAgd3Jp
dHRlbi4gQ2hhcmFjdGVycyBtYXkgYmUgYnVmZmVyZWQgdW50aWwgYSBuZXdsaW5lIChpLmUgJ1xu
JykgaXMNCj4gKyAqICAgICAgZm91bmQuDQo+ICsgKiAgICAgIEByZXR1cm4gMCBvbiBzdWNjZXNz
LCBvdGhlcndpc2UgcmV0dXJuIGFuIGVycm9yIGNvZGUuDQo+ICsgKiAgKiBDT05TT0xFSU9fcmVh
ZDogQXR0ZW1wdHMgdG8gcmVhZCB1cCBAY291bnQgY2hhcmFjdGVycyBmcm9tIFhlbiBjb25zb2xl
Lg0KDQoiLi4uIHVwIHRvIEBjb3VudCAuLi4iDQoNCj4gKyAqICAgICAgVGhlIG1heGltdW0gYnVm
ZmVyIHNpemUgKGkuZSBAY291bnQpIHN1cHBvcnRlZCBpcyAyR0IuDQoNCiJpLmUuIiBvciAiaWUi
IGFyZSB0aGUgdHdvIGNvbW1vbiBmb3JtcyBJJ20gYXdhcmUgb2YuDQoNCj4gKyAqICAgICAgQHJl
dHVybiB0aGUgbnVtYmVyIG9mIGNoYXJhY3RlciByZWFkIG9uIHN1Y2Nlc3MsIG90aGVyd2lzZSBy
ZXR1cm4NCg0KImNoYXJhY3RlcnMiDQoNCkphbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
