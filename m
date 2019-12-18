Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8302A124231
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 09:49:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihUxP-0001bA-F9; Wed, 18 Dec 2019 08:45:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BItc=2I=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1ihUxN-0001b5-Rh
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 08:45:21 +0000
X-Inumbo-ID: b3bf27f4-2172-11ea-b6f1-bc764e2007e4
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.94]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b3bf27f4-2172-11ea-b6f1-bc764e2007e4;
 Wed, 18 Dec 2019 08:45:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JeZ8p2TvyWM2LD6v7loRwApTMXy2MNG5OWmrwMBBQe957FE/F/hB4F3Sw5bX9jQQR9/4Y9LSrrH1cTwwuwIuj4HDFYQbK8yViHkmFNAT/tYXAV8SBJ1w1kje7lfqsNtpg7Dwun7o7s5boI84COJ7MbfLlN7vf+QtWCiAev3c74XjUSL1ml/nXiP5lH+LIgtrMuPXvCIFFj/wig03a1p95crOWjVwOFMHPSCWOQbivDY4gn8ooNiNjkPwsyInpYnPftv+Ce3Jqzg0iFP7OyoxWbnF9OAuHTEtzmi7aOeAug/ciVDzxOhRbfiG5wLzZq35o5Ug5hoPgDV8sBwmwNCMyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ouZP8K5quQPfBFpbZlxkI7Wc+T4OX2siRacGXK0sF50=;
 b=ZNjklKiXnbKzy5eFisDLw56qL0u85I3RyBSSXiqEZ/GkCMGzyJGuxjkuGGHfLPFLvI/cBJsEBEILA5qw8iccRQ9bD3DtK3dYXJRCxJbtdtRljzOZNZ68Rcr9EdA3ZeLS5CiehZKKMvQsXFmmTg6WueY/u7fht9/Yt38N5tPGXJbp3+l9JQLL1JtUV3K2+QATEqlbLKn5T18maNuQqkYxGxgwvQk6xl1afM8Lfnyd/MTUHf4iUY9Feza/pxfSj+53KAhFL8HtJ+8wpLEQj8t/1JqOpV86sR6AdeM60aaMakQGTrP0tOUPA8BB29fvOiffrjo3GDW8g9bYhEkfjIhDzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ouZP8K5quQPfBFpbZlxkI7Wc+T4OX2siRacGXK0sF50=;
 b=NYk2Yk9WNMUB1bxfZLJLB0yhkEXpq0rKDpIdCxqLx+q1M/9OdVyhi2oOz3a4FT/5wWzXfjiWl8HwdbDTj2EVQEV7kidtTJMRBUVx+2yVXok7MF84W46N5aDWd0mUmVMkzknLQVtXaUfzg3fFMtyA2SjbOOrak4UPqgzbFU3JRPM=
Received: from AM0PR02MB5553.eurprd02.prod.outlook.com (10.255.30.78) by
 AM0PR02MB5508.eurprd02.prod.outlook.com (10.255.31.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.18; Wed, 18 Dec 2019 08:45:10 +0000
Received: from AM0PR02MB5553.eurprd02.prod.outlook.com
 ([fe80::8cec:7638:734c:89d]) by AM0PR02MB5553.eurprd02.prod.outlook.com
 ([fe80::8cec:7638:734c:89d%4]) with mapi id 15.20.2538.019; Wed, 18 Dec 2019
 08:45:10 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH V4 2/4] x86/altp2m: Add hypercall to set a
 range of sve bits
Thread-Index: AQHVtOxnMZNvtoiQIE62yqEH5VgLvKe+jS4AgAD/GYCAAAjHAA==
Date: Wed, 18 Dec 2019 08:45:10 +0000
Message-ID: <fe9f516c-7f8e-f3ac-cc30-e7e8a6f882fb@bitdefender.com>
References: <20191217151144.9781-1-aisaila@bitdefender.com>
 <20191217151144.9781-2-aisaila@bitdefender.com>
 <c0bc8c84-dbb5-0030-061a-a665a7901b80@suse.com>
 <3afbe9f0-0b89-f566-b5f0-b656cb2f23da@bitdefender.com>
In-Reply-To: <3afbe9f0-0b89-f566-b5f0-b656cb2f23da@bitdefender.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR06CA0029.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::42) To AM0PR02MB5553.eurprd02.prod.outlook.com
 (2603:10a6:208:160::14)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 42119271-1504-488c-4f0f-08d78396973f
x-ms-traffictypediagnostic: AM0PR02MB5508:|AM0PR02MB5508:|AM0PR02MB5508:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR02MB550853F7B1401ED3E75FD260AB530@AM0PR02MB5508.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0255DF69B9
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(39860400002)(366004)(346002)(136003)(376002)(189003)(199004)(316002)(8936002)(71200400001)(6916009)(4326008)(31686004)(2616005)(54906003)(8676002)(81156014)(31696002)(6486002)(81166006)(36756003)(478600001)(5660300002)(53546011)(6506007)(7416002)(2906002)(26005)(186003)(86362001)(66476007)(66946007)(66556008)(52116002)(64756008)(6512007)(66446008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR02MB5508;
 H:AM0PR02MB5553.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UJFtoVYQtTM0j0KTm6LXPBwobUJ2LEfQADZvJJCIeG6eKHJPogOpmojwyFbbFQE8CHhppic/rKWDyqQxSylAnwBm5PQyuEww7uLpxPemtq5qDei7MYFGR3WMIiWKt/Kw0vmPfVa7ZnU8esKY6x9VXyoFQqlY8t4FaSrmvD5kQhzj9NipfAS6nedPKaXg32d98Rle4WeIp1dYRobRfX67d5sAlqKWgEWvRZLio0ztcniArZdQcAHRAiVohK0tma/RZZd1qlwNxZ9X/vVIfn+xw8Nu4ZXCzT0hk91XWvb76bjVDf6EU5thAX2mDUDYZyEo/BF25Iru+oTne07pWLom/3M8My++O+5Efwod1O/Ua1T/QSavukAYP3M8h5XvW6j18ARHgGXLqtzfF0HYSzMe/Ook5LOuOK0Z9WxhnLtEwoqJpIfsZvs1EAkTl8oI7rU2
Content-ID: <28BAE228CE255F4695256BB4A067D889@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42119271-1504-488c-4f0f-08d78396973f
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2019 08:45:10.3165 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LlOKPDkFf8Yw7eX/DbGk3YGAC9PreHdXkPtgXpG3kVC1u6hHqDxMBVKdSU6DwzdC6z79nDJvCrouD/Cm5/oSMGiElvoQ7r2GxMXwjjuSiV4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB5508
Subject: Re: [Xen-devel] [PATCH V4 2/4] x86/altp2m: Add hypercall to set a
 range of sve bits
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
Cc: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Razvan COJOCARU <rcojocaru@bitdefender.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDE4LjEyLjIwMTkgMTA6MTMsIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIHdyb3RlOg0K
PiANCj4+PiArLyoNCj4+PiArICogU2V0L2NsZWFyIHRoZSAjVkUgc3VwcHJlc3MgYml0IGZvciBt
dWx0aXBsZSBwYWdlcy4gIE9ubHkgYXZhaWxhYmxlIG9uIFZNWC4NCj4+PiArICovDQo+Pj4gK2lu
dCBwMm1fc2V0X3N1cHByZXNzX3ZlX211bHRpKHN0cnVjdCBkb21haW4gKmQsDQo+Pj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB4ZW5faHZtX2FsdHAybV9zdXBwcmVzc192
ZV9tdWx0aSAqc3ZlKQ0KPj4+ICt7DQo+Pj4gKyAgICBzdHJ1Y3QgcDJtX2RvbWFpbiAqaG9zdF9w
Mm0gPSBwMm1fZ2V0X2hvc3RwMm0oZCk7DQo+Pj4gKyAgICBzdHJ1Y3QgcDJtX2RvbWFpbiAqYXAy
bSA9IE5VTEw7DQo+Pj4gKyAgICBzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJtID0gaG9zdF9wMm07DQo+
Pj4gKyAgICB1aW50NjRfdCBzdGFydCA9IHN2ZS0+Zmlyc3RfZ2ZuOw0KPj4+ICsgICAgaW50IHJj
ID0gMDsNCj4+PiArICAgIHVpbnQ2NF90IG1heF9waHlzX2FkZHIgPSAoMVVMIDw8IGQtPmFyY2gu
Y3B1aWQtPmV4dGQubWF4cGh5c2FkZHIpIC0gMTsNCj4+PiArDQo+Pj4gKyAgICBpZiAoIHN2ZS0+
dmlldyA+IDAgKQ0KPj4+ICsgICAgew0KPj4+ICsgICAgICAgIGlmICggc3ZlLT52aWV3ID49IE1B
WF9BTFRQMk0gfHwNCj4+PiArICAgICAgICAgICAgIGQtPmFyY2guYWx0cDJtX2VwdHBbYXJyYXlf
aW5kZXhfbm9zcGVjKHN2ZS0+dmlldywgTUFYX0VQVFApXSA9PQ0KPj4+ICsgICAgICAgICAgICAg
bWZuX3goSU5WQUxJRF9NRk4pICkNCj4+PiArICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+
Pj4gKw0KPj4+ICsgICAgICAgIHAybSA9IGFwMm0gPSBkLT5hcmNoLmFsdHAybV9wMm1bYXJyYXlf
aW5kZXhfbm9zcGVjKHN2ZS0+dmlldywNCj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBNQVhfQUxUUDJNKV07DQo+Pj4gKyAgICB9
DQo+Pj4gKw0KPj4+ICsgICAgcDJtX2xvY2soaG9zdF9wMm0pOw0KPj4+ICsNCj4+PiArICAgIGlm
ICggYXAybSApDQo+Pj4gKyAgICAgICAgcDJtX2xvY2soYXAybSk7DQo+Pj4gKw0KPj4+ICsgICAg
d2hpbGUgKCBzdmUtPmxhc3RfZ2ZuID49IHN0YXJ0ICYmIHN0YXJ0IDwgbWF4X3BoeXNfYWRkciAp
DQo+Pg0KPj4gV2h5IGRvbid0IHlvdSBjbGlwIC0+bGFzdF9nZm4gYWhlYWQgb2YgdGhlIGxvb3As
IHNhdmluZyBvbmUNCj4+IGNvbXBhcmlzb24gcGVyIGl0ZXJhdGlvbj8NCj4gDQo+IEkndmUgZG9u
ZSB0aGlzIHNvIGl0IHdpbGwgaGF2ZSBmZXdlciBsaW5lcyBidXQgc3VyZSwgSSBjYW4gaGF2ZSB0
aGUNCj4gLT5sYXN0X2dmbiBjaGVjayBiZWZvcmUgdGhlIGxvb3AuDQo+IA0KDQpXb3VsZG4ndCB0
aGVyZSBiZSBhIGlzc3VlIGlmIHN0YXJ0IGdvZXMgb3ZlciAtPmxhc3RfZ2ZuIGFuZCB0aGVyZSBp
cyBubyANCmJyZWFrIGZvciBwcmVlbXB0aW9uPyBUaGVuIHRoZSBsb29wIHdpbGwgcnVuIHVudGls
IG1heF9waHlzX2FkZHIuDQoNCkFsZXgNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
