Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AE11D6EB2
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2020 04:05:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jaV9F-0006OH-7I; Mon, 18 May 2020 02:04:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CDU1=7A=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1jaV9D-0006OC-MC
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 02:04:55 +0000
X-Inumbo-ID: f61990ac-98ab-11ea-9887-bc764e2007e4
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.78]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f61990ac-98ab-11ea-9887-bc764e2007e4;
 Mon, 18 May 2020 02:04:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YSlrXsz99LmPn+NccvlaJuWMrx8GY8y/TpHXLRWvLg7eh3pjbaT35GBVc/UsI5UdeEdkH/07prH1RGLc4p/Y3SbWDXxDkaEPMI1cJIanip63ytRVw4478nvuV4nww4s2wesjPJZ/XlHYApPBQsrmieO7YdzdKzP/+um7XBDcQn8yzH7bfExWIw2W/eSOPkmGrj2j0csWIx3vvc+GS6OKAIiPQVQFIgRobAW2FEPnGgMU7HSnOYhdc6cBW7EF2hxv5cJsgP+/vjQw+JTgz/Qc2M1m/pHgGGWMvUn+5lN7+2BQYgvwFFgaHljEWXAe5B1YwvANRuYNQa5HMEzHd2fYaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DXvAl7S+oQcvO3GhrU89tCqWr+yWlU2u6vae9W0gSJ4=;
 b=CP/ExeLcSCZKG8CETO95h2KRwkTsccSlEALCAsQUjjUE6yfuS15XttRU8zkGi1MJjG61pGSnLS/5Flx5pEUBWIgoIwLFmLr6URPT+u8sihMkbPpZeAtWRGE/ZiSkgpAtY0Y2elr5CTI26JpHDuIBR2JRGUKmIFBtuiDPCMwEXGVeughTJqy65upDefvL9REf5OpwDcSy1vIoyC4+Q7DIdaAtTPO3+GpalNLz79VdqNjYbs/CHzsg62wvbAWTU56RIi2dnRrmVUJzXB02VevJeRSgDs8adsUvghezzrflCQiXkyKwjq3QRtij5gouX9M3k3+I8om9nLO3FF7UBTL02A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DXvAl7S+oQcvO3GhrU89tCqWr+yWlU2u6vae9W0gSJ4=;
 b=uo4DhjJOeG3Uf7xmRlByQZVQTTsL15fBdYYEeYI5xh5L1pdkWSr8l7uKJ9KKFqidzuwKr+8f7cB535TxkOlglVW8lK+NQ1dQo+prI5Baf9GemkbyG+JOJ9r0jz/p0rQzPG2j9i6Fn7dk1wtYliSY8m42C9weTmGExsTI2ni6LgY=
Received: from VI1PR0302MB3407.eurprd03.prod.outlook.com
 (2603:10a6:803:23::18) by VI1PR0302MB2813.eurprd03.prod.outlook.com
 (2603:10a6:800:e2::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.26; Mon, 18 May
 2020 02:04:50 +0000
Received: from VI1PR0302MB3407.eurprd03.prod.outlook.com
 ([fe80::a01e:c0b1:7174:4c75]) by VI1PR0302MB3407.eurprd03.prod.outlook.com
 ([fe80::a01e:c0b1:7174:4c75%5]) with mapi id 15.20.3000.022; Mon, 18 May 2020
 02:04:50 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "julien@xen.org" <julien@xen.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] optee: immediately free buffers that are released by
 OP-TEE
Thread-Topic: [PATCH] optee: immediately free buffers that are released by
 OP-TEE
Thread-Index: AQHWI0fTRy+rlPvmsUKZMLlR49t2iaiiqEuAgAqCkIA=
Date: Mon, 18 May 2020 02:04:49 +0000
Message-ID: <878c09ec58b9c9bef81497fa7e7a0ac47ddd8f21.camel@epam.com>
References: <20200506014246.3397490-1-volodymyr_babchuk@epam.com>
 <51b8c855-5e94-2829-a703-d43c84948120@xen.org>
In-Reply-To: <51b8c855-5e94-2829-a703-d43c84948120@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.2 
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=epam.com;
x-originating-ip: [176.36.48.175]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8e5f16a0-90fb-45a5-49aa-08d7facfd8f7
x-ms-traffictypediagnostic: VI1PR0302MB2813:
x-microsoft-antispam-prvs: <VI1PR0302MB28138DC5A1B68E84AC9693BDE6B80@VI1PR0302MB2813.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 04073E895A
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KVRWg37OBQpeTY55ei6Xu4rF5uG64MwmgiPCiVFsnqPGsKzzZgmS5GFhan2qvfVQqmS7d1IIeNsEIaM19VJ4h/hK27UC6Dczmt1gZm5bIE8e0RtKmDHaq+MMhXLaLXPLrkqTBrNWZbzYDJJ/eGxzrKeXaStLQqFU4/c5ilJNz3I02EAZsKDrTrCiVLCc6pKX4fjvIEKXo+0XRKrVg6S28fo+6LFc3axxgCIv1fj1Y/QNDlmTpJDbZhV9Drhod+iD1ozDHgk/vxP3t0rZNh0G2BHpYz0N0VqZTc97rZv0OzAVHNZ3gJiiz9kxnCiPqjwy00ymhxd6JL8RyDDRDv9gh1svn+SFpdrqlYKmwLFYU3vmQhHa8k6bol1uAJyok9TN+e9HMFKre67Qj/+723NLmx3F9BYCb7pRtmL4VGav1c0XQbUjuD43Nf2PPVmzOe7kbGE9e5mmqwx55yDl27kgjZpNhgDRz4OFeCmdGtza1Rw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0302MB3407.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(366004)(39860400002)(136003)(346002)(376002)(6506007)(66556008)(478600001)(66446008)(64756008)(110136005)(36756003)(316002)(91956017)(76116006)(6512007)(4326008)(66946007)(2616005)(66476007)(8936002)(2906002)(6486002)(71200400001)(186003)(53546011)(55236004)(26005)(86362001)(8676002)(54906003)(5660300002)(14773001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: Xx2voGuvRyspclELgASqDLYAYBLUX3PzDJMSH9jWevEJDmDqTd/5QTwI8WOLhrG+ZIa81zfPXsQIcB71PLU3Rz9bI5DZ3x9sRTQR2xPEV/rYJ5lJ8fyLYJULjn8SEcFNhyTrjfNc0EwaDSHf1n9ljflzRlD9WaQ0x8U9oJPTw4HAET5Xu088XeCxgJ/0S0PX5aqKjGTho7F0slmrN0hNw308XNHblKDu6SZnBk8i80MwhPtAcGGvwST2W5KG49r7Wpw79s9J1vxaKvUYgUmDnk5Ay/Lby9cvzxeIx4y2erd6bcBD/9t8+GqvH1PZRe6STpvNPP/m0iH6/J7KQrnNx3stFqbE5DoshyyvadQICh/S+jqTS/TVpY+2gkwJaBH1ux2hKn0zkXiQS6RnT38PVA31GDzkWVgccVWJik+/HBr3cEa1F0x6iWoNRF6AU/d3rI0kHqU7h0sNIOR5Hmxhv4zL3+F61k3zAky6uSho2Ro=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <F5161EBA8E59D14A97581D21098D352E@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e5f16a0-90fb-45a5-49aa-08d7facfd8f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2020 02:04:49.9634 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SDuYEPMeJ+hAdhNfc1hdvuAPwkS7CPxry5UZgzfqkMsNjPlAyHPQTgNE//5UxQlgEQ/U6GA+Q6AEr6s/4cGCyoV52NVDtlleufg2KJizlq0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0302MB2813
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
Cc: "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSnVsaWVuLA0KDQpPbiBNb24sIDIwMjAtMDUtMTEgYXQgMTA6MzQgKzAxMDAsIEp1bGllbiBH
cmFsbCB3cm90ZToNCj4gSGkgVm9sb2R5bXlyLA0KPiANCj4gT24gMDYvMDUvMjAyMCAwMjo0NCwg
Vm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6DQo+ID4gTm9ybWFsIFdvcmxkIGNhbiBzaGFyZSBidWZm
ZXIgd2l0aCBPUC1URUUgZm9yIHR3byByZWFzb25zOg0KPiA+IDEuIFNvbWUgY2xpZW50IGFwcGxp
Y2F0aW9uIHdhbnRzIHRvIGV4Y2hhbmdlIGRhdGEgd2l0aCBUQQ0KPiA+IDIuIE9QLVRFRSBhc2tz
IGZvciBzaGFyZWQgYnVmZmVyIGZvciBpbnRlcm5hbCBuZWVkcw0KPiA+IA0KPiA+IFRoZSBzZWNv
bmQgY2FzZSB3YXMgaGFuZGxlIG1vcmUgc3RyaWN0bHkgdGhhbiBuZWNlc3Nhcnk6DQo+ID4gDQo+
ID4gMS4gSW4gUlBDIHJlcXVlc3QgT1AtVEVFIGFza3MgZm9yIGJ1ZmZlcg0KPiA+IDIuIE5XIGFs
bG9jYXRlcyBidWZmZXIgYW5kIHByb3ZpZGVzIGl0IHZpYSBSUEMgcmVzcG9uc2UNCj4gPiAzLiBY
ZW4gcGlucyBwYWdlcyBhbmQgdHJhbnNsYXRlcyBkYXRhDQo+ID4gNC4gWGVuIHByb3ZpZGVzIGJ1
ZmZlciB0byBPUC1URUUNCj4gPiA1LiBPUC1URUUgdXNlcyBpdA0KPiA+IDYuIE9QLVRFRSBzZW5k
cyByZXF1ZXN0IHRvIGZyZWUgdGhlIGJ1ZmZlcg0KPiA+IDcuIE5XIGZyZWVzIHRoZSBidWZmZXIg
YW5kIHNlbmRzIHRoZSBSUEMgcmVzcG9uc2UNCj4gPiA4LiBYZW4gdW5waW5zIHBhZ2VzIGFuZCBm
b3JnZXRzIGFib3V0IHRoZSBidWZmZXINCj4gPiANCj4gPiBUaGUgcHJvYmxlbSBpcyB0aGF0IFhl
biBzaG91bGQgZm9yZ2V0IGFib3V0IGJ1ZmZlciBpbiBiZXR3ZWVuIHN0YWdlcyA2DQo+ID4gYW5k
IDcuIEkuZS4gdGhlIHJpZ2h0IGZsb3cgc2hvdWxkIGJlIGxpa2UgdGhpczoNCj4gPiANCj4gPiA2
LiBPUC1URUUgc2VuZHMgcmVxdWVzdCB0byBmcmVlIHRoZSBidWZmZXINCj4gPiA3LiBYZW4gdW5w
aW5zIHBhZ2VzIGFuZCBmb3JnZXRzIGFib3V0IHRoZSBidWZmZXINCj4gPiA4LiBOVyBmcmVlcyB0
aGUgYnVmZmVyIGFuZCBzZW5kcyB0aGUgUlBDIHJlc3BvbnNlDQo+ID4gDQo+ID4gVGhpcyBpcyBi
ZWNhdXNlIE9QLVRFRSBpbnRlcm5hbGx5IGZyZWVzIHRoZSBidWZmZXIgYmVmb3JlIHNlbmRpbmcg
dGhlDQo+ID4gImZyZWUgU0hNIGJ1ZmZlciIgcmVxdWVzdC4gU28gd2UgaGF2ZSBubyByZWFzb24g
dG8gaG9sZCByZWZlcmVuY2UgZm9yDQo+ID4gdGhpcyBidWZmZXIgYW55bW9yZS4gTW9yZW92ZXIs
IGluIG11bHRpcHJvY2Vzc29yIHN5c3RlbXMgTlcgaGF2ZSB0aW1lDQo+ID4gdG8gcmV1c2UgYnVm
ZmVyIGNvb2tpZSBmb3IgYW5vdGhlciBidWZmZXIuIFhlbiBjb21wbGFpbmVkIGFib3V0IHRoaXMN
Cj4gPiBhbmQgZGVuaWVkIHRoZSBuZXcgYnVmZmVyIHJlZ2lzdHJhdGlvbi4gSSBoYXZlIHNlZW4g
dGhpcyBpc3N1ZSB3aGlsZQ0KPiA+IHJ1bm5pbmcgdGVzdHMgb24gaU1YIFNvQy4NCj4gPiANCj4g
PiBTbywgdGhpcyBwYXRjaCBiYXNpY2FsbHkgY29ycmVjdHMgdGhhdCBiZWhhdmlvciBieSBmcmVl
aW5nIHRoZSBidWZmZXINCj4gPiBlYXJsaWVyLCB3aGVuIGhhbmRsaW5nIFJQQyByZXR1cm4gZnJv
bSBPUC1URUUuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogVm9sb2R5bXlyIEJhYmNodWsgPHZv
bG9keW15cl9iYWJjaHVrQGVwYW0uY29tPg0KPiA+IC0tLQ0KPiA+ICAgeGVuL2FyY2gvYXJtL3Rl
ZS9vcHRlZS5jIHwgMjQgKysrKysrKysrKysrKysrKysrKystLS0tDQo+ID4gICAxIGZpbGUgY2hh
bmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gPiANCj4gPiBkaWZmIC0t
Z2l0IGEveGVuL2FyY2gvYXJtL3RlZS9vcHRlZS5jIGIveGVuL2FyY2gvYXJtL3RlZS9vcHRlZS5j
DQo+ID4gaW5kZXggNmEwMzUzNTVkYi4uYWYxOWZjMzFmOCAxMDA2NDQNCj4gPiAtLS0gYS94ZW4v
YXJjaC9hcm0vdGVlL29wdGVlLmMNCj4gPiArKysgYi94ZW4vYXJjaC9hcm0vdGVlL29wdGVlLmMN
Cj4gPiBAQCAtMTA5OSw2ICsxMDk5LDI2IEBAIHN0YXRpYyBpbnQgaGFuZGxlX3JwY19yZXR1cm4o
c3RydWN0IG9wdGVlX2RvbWFpbiAqY3R4LA0KPiA+ICAgICAgICAgICBpZiAoIHNobV9ycGMtPnhl
bl9hcmctPmNtZCA9PSBPUFRFRV9SUENfQ01EX1NITV9BTExPQyApDQo+ID4gICAgICAgICAgICAg
ICBjYWxsLT5ycGNfYnVmZmVyX3R5cGUgPSBzaG1fcnBjLT54ZW5fYXJnLT5wYXJhbXNbMF0udS52
YWx1ZS5hOw0KPiA+ICAgDQo+ID4gKyAgICAgICAgLyoNCj4gPiArICAgICAgICAgKiBPUC1URUUg
c2lnbmFscyB0aGF0IGl0IGZyZWVzIHRoZSBidWZmZXIgdGhhdCBpdCByZXF1ZXN0ZWQNCj4gPiAr
ICAgICAgICAgKiBiZWZvcmUuIFRoaXMgaXMgdGhlIHJpZ2h0IGZvciB1cyB0byBkbyB0aGUgc2Ft
ZS4NCj4gPiArICAgICAgICAgKi8NCj4gPiArICAgICAgICBpZiAoIHNobV9ycGMtPnhlbl9hcmct
PmNtZCA9PSBPUFRFRV9SUENfQ01EX1NITV9GUkVFICkNCj4gPiArICAgICAgICB7DQo+ID4gKyAg
ICAgICAgICAgIHVpbnQ2NF90IGNvb2tpZSA9IHNobV9ycGMtPnhlbl9hcmctPnBhcmFtc1swXS51
LnZhbHVlLmI7DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICBmcmVlX29wdGVlX3NobV9idWYoY3R4
LCBjb29raWUpOw0KPiA+ICsNCj4gPiArICAgICAgICAgICAgLyoNCj4gPiArICAgICAgICAgICAg
ICogVGhpcyBzaG91bGQgbmV2ZXIgaGFwcGVuLiBXZSBoYXZlIGEgYnVnIGVpdGhlciBpbiB0aGUN
Cj4gPiArICAgICAgICAgICAgICogT1AtVEVFIG9yIGluIHRoZSBtZWRpYXRvci4NCj4gPiArICAg
ICAgICAgICAgICovDQo+ID4gKyAgICAgICAgICAgIGlmICggY2FsbC0+cnBjX2RhdGFfY29va2ll
ICYmIGNhbGwtPnJwY19kYXRhX2Nvb2tpZSAhPSBjb29raWUgKQ0KPiA+ICsgICAgICAgICAgICAg
ICAgZ3ByaW50ayhYRU5MT0dfRVJSLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAiU2F2
ZWQgUlBDIGNvb2tpZSBkb2VzIG5vdCBjb3JyZXNwb25kcyB0byBPUC1URUUncyAoJSJQUkl4NjQi
ICE9ICUiUFJJeDY0IilcbiIsDQo+IA0KPiBzL2NvcnJlc3BvbmRzL2NvcnJlc3BvbmQvDQpXaWxs
IGZpeCBpbiB0aGUgbmV4dCB2ZXJzaW9uLg0KDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
IGNhbGwtPnJwY19kYXRhX2Nvb2tpZSwgY29va2llKTsNCj4gDQo+IElJVUMsIGlmIHlvdSBmcmVl
IHRoZSB3cm9uZyBTSE0gYnVmZmVyIHRoZW4geW91ciBndWVzdCBpcyBsaWtlbHkgdG8gYmUgDQo+
IHJ1bm5pbmcgaW5jb3JyZWN0bHkgYWZ0ZXJ3YXJkcy4gU28gc2hvdWxkbid0IHdlIGNyYXNoIHRo
ZSBndWVzdCB0byBhdm9pZCANCj4gZnVydGhlciBpc3N1ZT8NCj4gDQoNCldlbGwsIHdlIGZyZWVk
IHRoZSBleGFjdCBidWZmZXIgdGhhdCBPUC1URUUgYXNrZWQgdXMgdG8gZnJlZS4gU28gZ3Vlc3QN
CmRpZG4ndCBhbnl0aGluZyBiYWQuIE1vcmVvdmVyLCBvcHRlZSBkcml2ZXIgaW4gTGludXgga2Vy
bmVsIGRvZXMgbm90DQpoYXZlIHNpbWlsYXIgY2hlY2ssIHNvIGl0IHdpbGwgZnJlZSB0aGlzIGJ1
ZmZlciB3aXRob3V0IGFueSBjb21wbGFpbnMuIA0KSSdtIGp1c3QgYmVpbmcgb3ZlcmNhdXRpb3Vz
IGhlcmUuIFRodXMsIEkgc2VlIG5vIHJlYXNvbiB0byBjcmFzaCB0aGUNCmd1ZXN0Lg0K

