Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C9F200491
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 11:06:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jmCyO-00013y-Kv; Fri, 19 Jun 2020 09:06:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jb/V=AA=nxp.com=peng.fan@srs-us1.protection.inumbo.net>)
 id 1jmCyN-00013t-6O
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 09:06:07 +0000
X-Inumbo-ID: 18a7221e-b20c-11ea-b7bb-bc764e2007e4
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1a::626])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 18a7221e-b20c-11ea-b7bb-bc764e2007e4;
 Fri, 19 Jun 2020 09:06:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N2vcOqqoDwdSMohOFkbe67Q5cLdUjsZTUcGd6B38CT9LkPmJuvCP1m9bIXGVEm4taOHdkU7hOGKQpR6v/60zUWpgikfrTeD8vCJyS4D1KlcuzmziPQrLlZqOLLJ3ECCnXs+s3xGRRkhF1wsAMPfVfptGvlRcx8kmbdLF2I1mbPdLZTNK/bZP77+Ulnx8vwgr0eKHkqVBITep9CQ7fSt4PHBptFt6Gc15STiNCBlmbRwDManVrdKxvBMKXgQYScItz5TkuytPXRkaqLdAYC6EZettTYD9Z8N1b2fgILrLnSzIwub/xpZpNizbWMda3vP028bMiHs5igWY2hCeJLCdGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OOnH1iBFRnHJ2a/DHiXrVHs2u9y+PQpdX0HHBIolzts=;
 b=JG4rSVZ/iW0Y57xpV5jLJoHNM7D4q7Y0mnMf3ks5JX2+MuM1u3UT00CkLaYFmYPL0QbsI1BSiBcDaoHcblVvM9wbw753S1lm+qZX7XELU3YRJz5aHDEFZvB533nPCKjf3OAXy170N9YwWFwKKC4YXCE/mkVaXXzXiefHOIe7Ch3ZO0DHNxql2xXVfjX+vDEoA+ZzRFNejGlggAVA5FWP2IHactJG7Ewdv1w0wi0S17dGS20r+x12YrDt7X2wzR/5zvqkIYrJMub0KDV02C0bHagiqt9F+aOBFXheTyom8hjMMobxbrFYheHG0/mWC9gShprFprEhER4TznpvnaoJZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OOnH1iBFRnHJ2a/DHiXrVHs2u9y+PQpdX0HHBIolzts=;
 b=frS+re2tSyqfEkzVJqZUT4cEj7nza3dUOxe1w2XOBJ2RcCkAfczthfEsP/OX9F5oknZwAXW+q1qJQJfSwD/LRcBD//Lzbbq9Ea3xKQbRyBvYNWR+g3riPGSpJI0vUqp7PMWzuGmd6TwbLidZs3ES1eKJdGApeqikacmPDlFEXs0=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR0402MB2710.eurprd04.prod.outlook.com (2603:10a6:4:95::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.23; Fri, 19 Jun
 2020 09:06:00 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::2d36:b569:17c:7701]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::2d36:b569:17c:7701%4]) with mapi id 15.20.3088.028; Fri, 19 Jun 2020
 09:05:59 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: RE: [Tee-dev] TEE with XEN
Thread-Topic: [Tee-dev] TEE with XEN
Thread-Index: AdZCuN8SyGfGPx9hRva/eeajiUtqpQAw/zsAAIeJWwAAHsEHgAAAD3awAABi1QAAADlWUA==
Date: Fri, 19 Jun 2020 09:05:59 +0000
Message-ID: <DB6PR0402MB2760C3BF7140E02A6ECA572488980@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <DB6PR0402MB276091802866E8CB878A8130889C0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <CAOcqxo2B4cnJdqERr81rVzJKb=Rj=kmotd7Cui9nOMy52wVKmg@mail.gmail.com>
 <8a6ba53e-59c8-0c18-00e9-2902b6edaf39@xen.org>
 <68572FBC-8AE3-44A4-A815-1A9A7FFFA098@arm.com>
 <DB6PR0402MB27606AA43E7A95B3CB2D228588980@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <CE6D09B1-18C4-46FA-BC1A-F45E28B2FA36@arm.com>
In-Reply-To: <CE6D09B1-18C4-46FA-BC1A-F45E28B2FA36@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2eeb6075-5f52-4acc-0344-08d8142ffc2f
x-ms-traffictypediagnostic: DB6PR0402MB2710:
x-microsoft-antispam-prvs: <DB6PR0402MB27108A716F381DC95E39D86D88980@DB6PR0402MB2710.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0439571D1D
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5I5Oaz2Rr6GKVLDtUBhA3K/86ShQTvils7FvvVfVRODit+DMDcsQqcrhvMuU1U3/Jai++5lIvJ3Ey5tJf/IJe+DuhO7biqM/Befr2yXX7lzEod6uXNpfTb4HZVJVMTzcS9um/f9jStHP32Ne+ISLRO32E6yd7XPr2JBGTNg++2q0TER66Cr83FPYfs6ZaxAkfPmemWbWq4iMypzMqTrzxe0UWM+2FtZm0xmvKvAoXMwtjt1rfhwfysQF3ivxUo0xAYUqekCzK9Z64/C9UvLW9Em5wBcU5CQlPBE4SLDs69gzstFVsgQwxdWO4hKnywDgUWHMmkIeLPYZo0TQr4SxoQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB6PR0402MB2760.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(136003)(346002)(366004)(39860400002)(376002)(6916009)(44832011)(26005)(53546011)(76116006)(6506007)(66946007)(71200400001)(8676002)(478600001)(7696005)(66446008)(66476007)(33656002)(64756008)(66556008)(186003)(7416002)(52536014)(5660300002)(54906003)(316002)(83380400001)(55016002)(8936002)(86362001)(9686003)(2906002)(4326008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: XEf3Eej8lvtCk1hYgMvyFnmMWVwWM2Z0+e4cJTmHXym+IbubRVI7rEaYmIONfrF26Pdd0LN84/kWEVYnsqEDWt+b1nZ2TaiT8SchrukBtuzjphaHeT+qHL3BZOV9d+2d4nMY4Kf4qK5oUUvrtXaBoXw7/xtMV2Djv/cxjgm0E453/RRs+2xWOvSTRS4zFvVhk+wO199Qb7pvc/UHn+0WU3GrhMwNI9YJoqIg7ZRRcgTusI2FLj55G0KC6IT/4YsZCBLv/zCAmSssod86uAuzhGG286R7rroAPuDYFbX/tIlFOhEPhlDpVIpoWLHSn19Eh/DVbI/KE9zee10PT0FEvOYnNGpqD6GV9rUo4oiL62wHpFZDky5M0TfXkIZhYFiQUGmgFb+u8NjRzNJMgixREWY7SxdkYKjY10x+O8kPNQRFhRkt8cAOavzjCH2eTHSMIaehKcUE7TwjDxczAP1x6iljhKq5acb2EogYGQ3aSWY=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eeb6075-5f52-4acc-0344-08d8142ffc2f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2020 09:05:59.9063 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /Bg2Ea5d1Z0dzETeKC+XrVgZzrxWr/Ynyp6tgD7ZlV0kJPnp2YcDJ0apnJqYJ1cu7bUZUdG/xMvctTw+Uk+eJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2710
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Volodymyr Babchuk <vlad.babchuk@gmail.com>,
 "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
 Xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Jens Wiklander <jens.wiklander@linaro.org>, Stefano Babic <sbabic@denx.de>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBTdWJqZWN0OiBSZTogW1RlZS1kZXZdIFRFRSB3aXRoIFhFTg0KPiANCj4gDQo+IA0KPiA+IE9u
IDE5IEp1biAyMDIwLCBhdCAwOTo1MiwgUGVuZyBGYW4gPHBlbmcuZmFuQG54cC5jb20+IHdyb3Rl
Og0KPiA+DQo+ID4gSGkgQmVydHJhbmQsDQo+ID4NCj4gPj4gU3ViamVjdDogUmU6IFtUZWUtZGV2
XSBURUUgd2l0aCBYRU4NCj4gPj4NCj4gPj4gSGksDQo+ID4+DQo+ID4+PiBPbiAxOCBKdW4gMjAy
MCwgYXQgMTk6MDUsIEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPiA+Pj4N
Cj4gPj4+ICtCZXJ0cmFuZCBhbmQgU3RlZmFubw0KPiA+Pj4NCj4gPj4+IE9uIDE2LzA2LzIwMjAg
MDI6MjQsIFZvbG9keW15ciBCYWJjaHVrIHdyb3RlOg0KPiA+Pj4+IEhpIFBlbmcsDQo+ID4+Pj4g
T24gTW9uLCAxNSBKdW4gMjAyMCBhdCAwNTowNywgUGVuZyBGYW4gPHBlbmcuZmFuQG54cC5jb20+
IHdyb3RlOg0KPiA+Pj4+Pg0KPiA+Pj4+PiBIaSBBbGwsDQo+ID4+Pj4+DQo+ID4+Pj4+IFdoaWxl
IGVuYWJsaW5nIHRydXN0eSBvcyB3aXRoIHhlbiwgSSB0b29rIHNhbWUgYXBwcm9hY2ggYXMgT1At
VEVFLA0KPiA+Pj4+PiB3aXRoIE9QLVRFRSBydW5uaW5nIGluIHNlY3VyZSB3b3JsZC4gQnV0IEkg
YW0gYWxzbyB0aGlua2luZyB0aGlzDQo+ID4+Pj4+IG1pZ2h0IGludHJvZHVjZSBwb3RlbnRpYWwg
aXNzdWUgaXMgdGhhdCBzZWN1cmUgd29ybGQgT1MNCj4gPj4+Pj4gY29tbXVuaWNhdGUgd2l0aA0K
PiA+PiBEb21VLg0KPiA+Pj4+PiBJZiB0aGVyZSBhcmUgc29tZSBtaXNiZWhhdmlvciBpbiBzZWN1
cmUgd29ybGQgT1MsIGl0IG1pZ2h0IGxldCBYRU4NCj4gPj4+Pj4gaHlwZXJ2aXNvciBub3Qgd29y
ayBwcm9wZXIuDQo+ID4+Pj4+DQo+ID4+Pj4+IEluIG15IHNldHVwLCB0cnVzdHkgb3Mgc29tZXRp
bWVzIHBhbmljIGluIHNlY3VyZSB3b3JsZCwgeGVuIHdpbGwNCj4gPj4+Pj4gbm90IGFibGUgdG8g
Y29udHJvbCB0aGUgcGFuaWMgY29yZSBhbnltb3JlLg0KPiA+Pj4NCj4gPj4+IE1heSBJIGFzayBp
biB3aGljaCBjYXNlIFRydXN0eSBpcyBwYW5pY2tpbmc/DQo+ID4+DQo+ID4+IEluIGFueSBjYXNl
LCBvcHRlZSBzaG91bGQgcHJvdGVjdCBpdHNlbGYgYWdhaW5zdCB0aGlzIGFuZCBpdCBzaG91bGQN
Cj4gPj4gYmUgY29uc2lkZXJlZCB0aGF0IG9wdGVlIGlzIG1vcmUgcHJpdmlsZWRnZWQgdGhlbiBY
ZW4uDQo+ID4+IFNvIGlmIG9wdGVlIGlzIGNyYXNoaW5nIHdlIGNhbm5vdCBleHBlY3QgdGhhdCBY
ZW4gY2FuIHJlY292ZXIgb3IgZml4IGl0Lg0KPiA+Pg0KPiA+PiBJIHdvdWxkIG1vcmUgY29uc2lk
ZXIgdGhpcyBhcyBhIGJ1ZyB0aGF0IG9wdGVlIG5lZWRzIHRvIGJlIHJvYnVzdCBhZ2FpbnN0Lg0K
PiA+DQo+ID4gb2suIEkgYW0gbm90IHVzaW5nIE9QLVRFRSwgY3VycmVudGx5IEkgdXNlIGdvb2ds
ZSB0cnVzdHkgT1MuDQo+IA0KPiBTb3JyeSBpIHNob3VsZCBoYXZlIGJlZW4gbW9yZSBnZW5lcmlj
Lg0KPiBQbGVhc2UgcmVhZCB0aGlzIGFzIOKAnEFueXRoaW5nIHJ1bm5pbmcgaW4gc2VjdXJlIHdv
cmxk4oCdLCBiZWluZyBvcHRlZSBvciB0cnVzdHkuDQo+IA0KPiA+DQo+ID4gSSBoYXZlIHR3byBP
UywgRG9tMCBsaW51eCArIERvbVUgYW5kcm9pZCBhdXRvLg0KPiA+DQo+ID4gRG9tVSBhbmRyb2lk
IGF1dG8gbmVlZHMgdHJ1c3R5IE9TLCBEb20wIExpbnV4IG5vdCBuZWVkIHRoYXQuDQo+IA0KPiBC
dXQgaSB3b3VsZCBndWVzcyB5b3VyIERvbTAgaXMgbW9yZSDigJxjcml0aWNhbOKAnSB0aGVuIHlv
dXIgRG9tVS4NCj4gSW4gdGhpcyBjYXNlIHlvdSBtdXN0IG1ha2Ugc3VyZSB0aGF0IGFueSByZXNv
dXJjZSBnaXZlbiB0byB5b3VyIERvbVUgY2Fubm90DQo+IGFmZmVjdCB5b3VyIERvbTAuDQo+IEZv
ciBleGFtcGxlOiBpZiB0aGUgRG9tVSBpcyBzdGFydGluZyBhIHZlcnkgaGVhdnkgb3BlcmF0aW9u
IGluIGJsb2NrZWQgaW4NCj4gdHJ1c3R5LCBhbnkgaW50ZXJydXB0IGZvciBub24tc2VjdXJlIGNv
dWxkIGJlIGJsb2NrZWQsIHRodXMgYWZmZWN0aW5nIHRoZSBhYmlsaXR5DQo+IG9mIHlvdXIgRG9t
MC4NCj4gDQo+ID4NCj4gPiBJIG5vdCB3YW5uYSB0cnVzdHkgT1MgZm9yIERvbVUgY291bGQgYnJp
bmcgYW55IGRldGVjdCB0byBEb20wIG9yIHhlbi4NCj4gPg0KPiA+IE9uZSBtb3JlIGNhc2UgaXMg
aWYgZG9tMCBsaW51eCBuZWVkcyBPUC1URUUsIERvbVUgbmVlZHMgZ29vZ2xlIHRydXN0eSwNCj4g
PiBob3cgd2UgaGFuZGxlIHRoaXMgaW4gb25lIFNvQz8NCj4gDQo+IFlvdSBoYXZlIGEgc2hhcmVk
IHJlc291cmNlIGluIHRoaXMgY2FzZSwgc29tZW9uZSBtb3JlIG9yIGFzIHRydXN0ZWQgYXMgdGhl
DQo+IGNsaWVudHMgbmVlZHMgdG8gZGVjaWRlIGhvdyB0aGUgcmVzb3VyY2UgY2FuIGJlIHNoYXJl
ZC4NCj4gSW4gdGhpcyBjYXNlIGNvdWxkIGJlIERvbTAgb3IgWGVuIG9yIFRydXN0eSBvciBvcC1U
ZWUgKGlmIGkgc2hvdWxkIG1ha2UgYW4NCj4gb3JkZXIpLg0KPiANCj4gPg0KPiA+Pg0KPiA+Pj4N
Cj4gPj4+Pj4NCj4gPj4+Pj4gU28gSSBhbSB0aGlua2luZyB3aGV0aGVyIHdlIG5lZWQgdG8gZW11
bGF0aW5nIHNlY3VyZSB3b3JsZCBpbiBhDQo+ID4+Pj4+IFhFTiBWTSB3aGljaCBpcyB0aGUgVk0g
cnVubmluZyBEb21VLiBKdXN0IGxpa2Ugd2hhdCBBQ1JOIGRpZCB0bw0KPiA+Pj4+PiBydW4gdHJ1
c3R5IG9zLg0KPiA+Pj4+IFdlbGwsIGl0IGRlcGVuZHMgb24gd2hvbSB5b3UgYXJlIHRydXN0aW5n
IG1vcmUuIEJvdGggWEVOIGFuZCBURUUNCj4gPj4+PiBhcmUgbWluaW1hbCBPUyBpbXBsZW1lbnRh
dGlvbnMgd2l0aCBhaW0gYXQgc2VjdXJpdHkuIEknbSBzcGVha2luZw0KPiA+Pj4+IGFib3V0IGdl
bmVyaWMgVEVFIE9TLCBub3QgYWJvdXQgcGFydGljdWxhciBPUyBsaWtlIE9QLVRFRSBvciBUcnVz
dHkuDQo+ID4+Pj4gUHJvYmxlbSBpcyB0aGF0LCBpZiBURUUgaXMgcnVubmluZyBpbnNpZGUgVk0s
IGl0IHdpbGwgYmUNCj4gPj4+PiBzdXNjZXB0aWJsZSB0byBhIGh5cGVydmlzb3IgbWlzYmVoYXZp
b3VyLiBZb3UgbmVlZCB0byB1bmRlcnN0YW5kDQo+ID4+Pj4gdGhhdCBYZW4gYW5kIHByaXZpbGVn
ZWQgZG9tYWluIChkb20wLCBtb3N0bHkpIGNhbiBhY2Nlc3MgbWVtb3J5IG9mDQo+IGFueSBndWVz
dC4NCj4gPj4+PiBBdCBsZWFzdCwgaW4gZGVmYXVsdCBjb25maWd1cmF0aW9uLiBUaGVyZSBhcmUg
bWVhbnMgdG8gaGFyZGVuIHRoaXMNCj4gPj4+PiBzZXR1cC4gQnV0IGFueXdheXMsIFhlbiBjYW4n
dCBiZSBzdG9wcGVkIGZyb20gcmVhZGluZyBURUUncyBzZWNyZXRzLg0KPiA+Pj4NCj4gPj4+IElJ
UkMsIHdlIGRpc2N1c3NlZCB0aGlzIGFwcHJvYWNoIGZvciBPUC1URUUgaW4gdGhlIHBhc3QuIFRo
ZXJlIHdhcw0KPiA+Pj4gb3RoZXINCj4gPj4gcG90ZW50aWFsIHBpdGZhbGxzIHdpdGggaXQuIEZv
ciBpbnN0YW5jZSwgeW91IHdvdWxkbid0IGJlIGFibGUgdG8NCj4gPj4gZGlyZWN0bHkgYWNjZXNz
IGFueSBzZWN1cmUgZGV2aWNlIGZyb20gdGhhdCBndWVzdCAoaXQgaXMgcnVubmluZyBpbg0KPiBu
b24tc2VjdXJlIHdvcmxkKS4NCj4gPj4+DQo+ID4+PiBUaGVyZSBhcmUgYWxzbyBpc3N1ZXMgaW4g
dGVybSBvZiBsYXRlbmN5IGFzIHlvdSBtYXkgaGF2ZSB0aGUNCj4gPj4+IGZvbGxvd2luZw0KPiA+
PiBtb2RlbDoNCj4gPj4+DQo+ID4+PiBkb21VIC0+IFhlbiAtPiBkb21VIFRFRSAtPiAoWGVuIC0+
IGhvc3QgVEVFIC0+IFhlbiAtPiBkb21VIFRFRSkgLT4NCj4gPj4+IFhlbiAtPg0KPiA+PiBkb21V
Lg0KPiA+Pj4NCj4gPj4+IFRoZSBiaXQgaW4gKCkgaXMgaWYgeW91IHJlcXVpcmUgdG8gY2FsbCB0
aGUgaG9zdCBURUUuDQo+ID4+Pg0KPiA+Pj4gT25lIHBvc3NpYmlsaXR5IHdvdWxkIGJlIHRvIHVz
ZSBTZWN1cmUtRUwyIGZvciB5b3VyIFRydXN0eSBPUy4gQnV0IEkNCj4gPj4+IGRvbid0DQo+ID4+
IGtub3cgd2hldGhlciB5b3VyIHBsYXRmb3JtIHN1cHBvcnRzIGl0Lg0KPiA+Pj4NCj4gPj4+IERl
cGVuZGluZyBvbiB3aGV0aGVyIHlvdSBjYW4gbW9kaWZ5IFRydXN0eSBPUywgYWx0ZXJuYXRpdmUg
d291bGQgYmUNCj4gPj4+IHRvDQo+ID4+IG1ha2UgaXR2aXJ0dWFsaXphdGlvbiBhd2FyZSBhcyBP
UC1URUUgZGlkLiBUaGUgY29yZSB3b3VsZCBuZWVkIHRvIGJlDQo+ID4+IHJlc2lsaWVudCBhbmQg
dGhlIHBhbmljIG9ubHkgYWZmZWN0IGEgZ2l2ZW4gY2xpZW50Lg0KPiA+Pg0KPiA+PiBJIGRvIG5v
dCBoYXZlIHJpZ2h0IGEgY2xlYXIgaWRlYSBvZiB3aGF0IGlzIHRoZSBzdGF0dXMgb2Ygb3B0ZWUg
YW5kDQo+ID4+IHhlbiBidXQgaW4gdGhlb3J5IEkgd291bGQgc2VlIDIgcG9zc2libGUgd2F5cyB0
byBoYW5kbGUgdGhpczoNCj4gPj4gLSB3aXRob3V0IG9wdGVlIG1vZGlmaWNhdGlvbiwgc29tZXRo
aW5nIGluIGEgZ3Vlc3QgKERvbTAgb3IgYW4gb3RoZXINCj4gPj4gcHJpdmlsZWRnZWQgb25lKSBu
ZWVkcyB0byBoYXZlIGFjY2VzcyB0byBvcHRlZSBhbmQgZW11bGF0ZSBvcHRlZQ0KPiA+PiBhY2Nl
c3MgZm9yIG90aGVycy4NCj4gPj4gLSB3aXRoIG9wdGVlIG1vZGlmaWNhdGlvbnMsIG9wdGVlIG5l
ZWRzIHRvIGhhdmUgYSBjb25jZXB0IG9mIGNsaWVudA0KPiA+PiBhbmQgWGVuIHdvdWxkIG5lZWQg
dG8gcGFzc3Rocm91Z2ggb3B0ZWUgcmVxdWVzdHMgYnV0IGJlaW5nDQo+ID4+IHJlc3BvbnNpYmxl
IG9mIGFkZGluZyBhIOKAnGNsaWVudOKAnSBpZGVudGlmaWVyLiBNYXliZSBhbHNvIGluZm9ybWlu
Zw0KPiA+PiBPcHRlZSB3aGVuIGEgbmV3IGNsaWVudCBpcyBjcmVhdGVkL3JlbW92ZWQuDQo+ID4+
DQo+ID4+IFRoZSBzZWNvbmQgc2NlbmFyaW8gY291bGQgdGhlbiBiZSBzb21laG93IHNwbGl0dGVk
IGluIHRoZSBwcmV2aW91cw0KPiA+PiBvbmUgZnJvbSBKdWxpZW4gaWYgc29tZSBwYXJ0cyB3b3Vs
ZCBuZWVkIHRvIGJlIGVtdWxhdGVkIHNvbWV3aGVyZSBpbg0KPiA+PiBzb21lIGtpbmQgb2YgY29t
YmluYXRpb24gb2YgdGhlIDIgbW9kZWxzLg0KPiA+Pg0KPiA+PiBJbiBhbnkgY2FzZSBpIHdvdWxk
IGFsd2F5cyBjb25zaWRlciB0aGF0IGFueXRoaW5nIHJ1bm5pbmcgb24gb3B0ZWUNCj4gPj4gKG9y
IGluIGdlbmVyYWwgaW4gdGhlIHNlY3VyZSB3b3JsZCkgaXMgbW9yZSB0cnVzdGVkIHRoZW4gWGVu
Lg0KPiA+DQo+ID4gT2ssIHRoaXMgbWVhbnMgb3B0ZWUgcnVucyBvbiBhbGwgY29yZXMgaW4gc2Vj
dXJlIHdvcmxkLCBidXQgdGhpcyB3b3VsZA0KPiA+IG5vdCB3b3JrIHdoZW4gd2UgbmVlZCB0byBz
dXBwb3J0IG11bHRpcGxlIE9TZXMgd2l0aCB0aGVpciBvd24gVEVFLg0KPiANCj4gSSB3b3VsZCB0
aGluayB5b3UgaGF2ZSBvbmUgVEVFIHJ1bm5pbmcgb24gYWxsIGNvcmVzIChvciBydW5uYWJsZSBp
biB0aGlzIGNhc2UpLg0KPiBTbyB0aGUgVGVlIG5lZWRzIHRvIGhhbmRsZSBzZXZlcmFsIGNvbnRl
eHRzIG9yIHNvbWVvbmUgbmVlZHMgdG8gdmlydHVhbGl6ZSBpdC4NCg0KVGhpcyBiYWNrIHRvIG15
IG9yaWdpbmFsIHF1ZXN0aW9uLCBzaG91bGQgSSB2aXJ0dWFsaXplIFRFRSBpbiBhIFhFTiBkZWRp
Y2F0ZWQgVk0/DQpvciBJIG5lZWQgdG8gZW11bGF0ZSBzZWN1cmUgd29ybGQgdG8gbGV0IG9uZSBW
TSBjb3VsZCBoYXZlIHNlY3VyZSBhbmQgbm9uLXNlY3VyZQ0Kd29ybGQ/DQoNClRoYW5rcywNClBl
bmcuDQoNCj4gDQo+IFJlZ2FyZHMNCj4gQmVydHJhbmQNCg0K

