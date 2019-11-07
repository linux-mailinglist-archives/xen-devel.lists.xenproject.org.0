Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5B8F285C
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2019 08:48:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iScV6-0000h7-HV; Thu, 07 Nov 2019 07:46:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pSBD=Y7=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1iScV4-0000h2-34
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2019 07:46:38 +0000
X-Inumbo-ID: b9906734-0132-11ea-984a-bc764e2007e4
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe1f::715])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b9906734-0132-11ea-984a-bc764e2007e4;
 Thu, 07 Nov 2019 07:46:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cnf5Y6t2W2DOOUPnMvy32GGdsFVpTSOWq5Khc8Z7Nv917kaNuc68PT96yJt7bxZapi5Qz8ZZymljPMxgz7K7zmGFgCbtDmlaJt4SHMYUqoGxpdIEbnOP67vcOZdyXZBBF1smoAtJZJwxAXCD6HpwzJVMYBm8LYYkvCc4Uqgqyd7gRNyQbiF6XVByM3cZ1P56P0qwOl8fFQEZzynf0LEUNEki4W2kQV6S92/gTwR6ZqUQpkhsYNk1Fc/Z92SwVY/5MoN6t1igTABDAj5rK/aJ256ptpu0g2fTvE9gODsueMypjgdrjiZiHhUH4wbhOhEJjc7DjEC9/0hayNhKAF5Upw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=frEefNgxiavJLtTYbdPn9QcEa7tgI+hlJ+lE5w91gM8=;
 b=Hr2RddW2qByO01zICC1vXz2f1+AYexuui1ytzufAifI6a4mO3+NkABxj005AxeloUE3wRtFpC3Tya9VctLyE2OZm9b41Dg9+zkcapsnBsMuo8wbfK8U0LnSpA9lTMnspOVbQyqaP23z1b/Lu3XYx9cjfqGlkUm1Vmb8/BGsXHyg/LhEJXyTmhcUDWq+xuGsIv2m031MZDXrjIxOXQz3HbdF+Gdj25dyLev5e20WZv1LMVaRWWJs+lhBvRIpE3W6uE9myD5INTT/sJhW9kH/iinVp57nUiXX7UySntOUhACEVJOKd76JextX9rsSg2EoIlJxFbB6Ti5h4YrGnUkGJ0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=frEefNgxiavJLtTYbdPn9QcEa7tgI+hlJ+lE5w91gM8=;
 b=kvgoF0GyQdJ9jP+gCz+kQvsUZ5xDMtIEBbfW12xzZ+z8gOnIgG6w4TObrwrkoVB+j/J1Vqasmlx8ULDtGZe7B1SUzqL76n2Eyg9Y5ez67YYkTAbsSZBiZJlMj4fSKJhzSsw5MFKTfy1eEZMsyqVR+/XCBrGTkL38d8sm0d+y/OY=
Received: from AM6PR0202MB3413.eurprd02.prod.outlook.com (52.133.30.28) by
 AM6PR0202MB3366.eurprd02.prod.outlook.com (52.133.9.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.22; Thu, 7 Nov 2019 07:46:34 +0000
Received: from AM6PR0202MB3413.eurprd02.prod.outlook.com
 ([fe80::a569:5be5:9861:577d]) by AM6PR0202MB3413.eurprd02.prod.outlook.com
 ([fe80::a569:5be5:9861:577d%5]) with mapi id 15.20.2408.025; Thu, 7 Nov 2019
 07:46:34 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Thread-Topic: [PATCH V2 1/2] x86/altp2m: Add hypercall to set a range of sve
 bits
Thread-Index: AQHVlLfBrDM8T0M9gEmymLFobxrGFKd+or6AgACyxAA=
Date: Thu, 7 Nov 2019 07:46:34 +0000
Message-ID: <17cc5e81-c229-18fb-41da-64219abb74e7@bitdefender.com>
References: <20191106153442.12776-1-aisaila@bitdefender.com>
 <CABfawhmw2d1Ktm2Qkpv6gdCJ6vWXWesxQgqgdRqx0edTBkf3jw@mail.gmail.com>
In-Reply-To: <CABfawhmw2d1Ktm2Qkpv6gdCJ6vWXWesxQgqgdRqx0edTBkf3jw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR06CA0075.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::16) To AM6PR0202MB3413.eurprd02.prod.outlook.com
 (2603:10a6:209:1c::28)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6a36448f-55b9-48f0-7cfb-08d763569c8b
x-ms-traffictypediagnostic: AM6PR0202MB3366:|AM6PR0202MB3366:|AM6PR0202MB3366:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR0202MB3366D13006A7DFCA32791B74AB780@AM6PR0202MB3366.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0214EB3F68
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(346002)(396003)(366004)(39860400002)(136003)(199004)(189003)(4326008)(81156014)(486006)(31686004)(3846002)(6116002)(305945005)(66066001)(52116002)(76176011)(6506007)(386003)(53546011)(81166006)(8936002)(6246003)(6916009)(2906002)(8676002)(14444005)(107886003)(7736002)(7416002)(5660300002)(71190400001)(36756003)(54906003)(6512007)(256004)(64756008)(229853002)(66446008)(66556008)(446003)(6436002)(316002)(6486002)(11346002)(478600001)(2616005)(14454004)(86362001)(66946007)(31696002)(476003)(186003)(26005)(102836004)(71200400001)(99286004)(25786009)(66476007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR0202MB3366;
 H:AM6PR0202MB3413.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: w+a6RzJRQcQWT3UMSEuZCuR1bFLVTimpg12lwFk+PsoR1SjLab9eMFNZ4gnn3Y8VvQ2gL+eDtWqlDToZuku4fLs/+pn20LCKpe0L657pTkjC4rh4R/owjMj0zdQVCvbfbdpyuIiUovxmVaEuVmcqT8UBCxe9+rGiQ99OxR5driS1fNPkh6Dtlw+R79sV8p0pPSgyFLd7rWtI4gvXglLkyyHN9Bp77jGc4XRlkDmdkYTr34osG13Y8F8uoj8Z0HBxEA2AMmksjScHK6jLfr5PCYWDY6QZQNNldWvTa/BqnnXE9/Mot+UOpKvvJFXuUaAZ5hE+XSovRzfSW02oXzqF7tlWy+uHJ4FkTd23f0AZDd1kz5HFtoSIVAVjsAYxWnN7KEeClDMNmeugL7WbIKjXYkFxmyZm16Yb0VCnZcQ+rpjtX2m4EJ1mQ5qbP2uTn/CL
Content-ID: <374759732F7F4C448FE59853E83DE20C@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a36448f-55b9-48f0-7cfb-08d763569c8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2019 07:46:34.3997 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jG+wWoca6yIAPE0qFFdfHJIlpQCaFva/+dcOgJHHJ0RohUBpPFiMIXu0S5kjPCx7ZILK9KDMQ5lg+hoThNpQhnKYsQ4prtYVaekMbgiLghw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0202MB3366
Subject: Re: [Xen-devel] [PATCH V2 1/2] x86/altp2m: Add hypercall to set a
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
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "julien@xen.org" <julien@xen.org>, Razvan COJOCARU <rcojocaru@bitdefender.com>,
 "wl@xen.org" <wl@xen.org>, "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDA2LjExLjIwMTkgMjM6MDYsIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToNCj4gT24gV2Vk
LCBOb3YgNiwgMjAxOSBhdCA3OjM1IEFNIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBDQo+IDxhaXNh
aWxhQGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6DQo+Pg0KPj4gQnkgZGVmYXVsdCB0aGUgc3ZlIGJp
dHMgYXJlIG5vdCBzZXQuDQo+PiBUaGlzIHBhdGNoIGFkZHMgYSBuZXcgaHlwZXJjYWxsLCB4Y19h
bHRwMm1fc2V0X3N1cHJlc3NfdmVfbXVsdGkoKSwNCj4+IHRvIHNldCBhIHJhbmdlIG9mIHN2ZSBi
aXRzLg0KPj4gVGhlIGNvcmUgZnVuY3Rpb24sIHAybV9zZXRfc3VwcHJlc3NfdmVfbXVsdGkoKSwg
ZG9lcyBub3QgYnJha2UgaW4gY2FzZQ0KPj4gb2YgYSBlcnJvciBhbmQgaXQgaXMgZG9pbmcgYSBi
ZXN0IGVmZm9ydCBmb3Igc2V0dGluZyB0aGUgYml0cyBpbiB0aGUNCj4+IGdpdmVuIHJhbmdlLiBB
IGNoZWNrIGZvciBjb250aW51YXRpb24gaXMgbWFkZSBpbiBvcmRlciB0byBoYXZlDQo+PiBwcmVl
bXB0aW9uIG9uIGJpZyByYW5nZXMuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJ1IElz
YWlsYSA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+DQo+Pg0KPj4gLS0tDQo+PiBDaGFuZ2VzIHNp
bmNlIFYxOg0KPj4gICAgICAgICAgLSBSZW1vdmUgImNvbnRpbnVlIg0KPj4gICAgICAgICAgLSBB
ZGQgYSBuZXcgZmllbGQgaW4geGVuX2h2bV9hbHRwMm1fc3VwcHJlc3NfdmUgdG8gc3RvcmUgdGhl
DQo+PiBjb250aW51YXRpb24gdmFsdWUNCj4+ICAgICAgICAgIC0gSGF2ZSBwMm1fc2V0X3N1cHBy
ZXNzX3ZlX211bHRpKCkgdGFrZQ0KPj4geGVuX2h2bV9hbHRwMm1fc3VwcHJlc3NfdmUgYXMgYSBw
YXJhbS4NCj4+IC0tLQ0KPj4gICB0b29scy9saWJ4Yy9pbmNsdWRlL3hlbmN0cmwuaCAgIHwgIDMg
KysNCj4+ICAgdG9vbHMvbGlieGMveGNfYWx0cDJtLmMgICAgICAgICB8IDI1ICsrKysrKysrKysr
KysrDQo+PiAgIHhlbi9hcmNoL3g4Ni9odm0vaHZtLmMgICAgICAgICAgfCAyMCArKysrKysrKysr
LS0NCj4+ICAgeGVuL2FyY2gveDg2L21tL3AybS5jICAgICAgICAgICB8IDU4ICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKw0KPj4gICB4ZW4vaW5jbHVkZS9wdWJsaWMvaHZtL2h2bV9v
cC5oIHwgIDUgKystDQo+PiAgIHhlbi9pbmNsdWRlL3hlbi9tZW1fYWNjZXNzLmggICAgfCAgMyAr
Kw0KPj4gICA2IGZpbGVzIGNoYW5nZWQsIDExMSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQ0KPj4NCj4+IGRpZmYgLS1naXQgYS90b29scy9saWJ4Yy9pbmNsdWRlL3hlbmN0cmwuaCBiL3Rv
b2xzL2xpYnhjL2luY2x1ZGUveGVuY3RybC5oDQo+PiBpbmRleCBmNDQzMTY4N2IzLi4yMWI2NDRm
NDU5IDEwMDY0NA0KPj4gLS0tIGEvdG9vbHMvbGlieGMvaW5jbHVkZS94ZW5jdHJsLmgNCj4+ICsr
KyBiL3Rvb2xzL2xpYnhjL2luY2x1ZGUveGVuY3RybC5oDQo+PiBAQCAtMTkyMyw2ICsxOTIzLDkg
QEAgaW50IHhjX2FsdHAybV9zd2l0Y2hfdG9fdmlldyh4Y19pbnRlcmZhY2UgKmhhbmRsZSwgdWlu
dDMyX3QgZG9taWQsDQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDE2X3Qg
dmlld19pZCk7DQo+PiAgIGludCB4Y19hbHRwMm1fc2V0X3N1cHByZXNzX3ZlKHhjX2ludGVyZmFj
ZSAqaGFuZGxlLCB1aW50MzJfdCBkb21pZCwNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdWludDE2X3Qgdmlld19pZCwgeGVuX3Bmbl90IGdmbiwgYm9vbCBzdmUpOw0KPj4gK2lu
dCB4Y19hbHRwMm1fc2V0X3N1cHJlc3NfdmVfbXVsdGkoeGNfaW50ZXJmYWNlICpoYW5kbGUsIHVp
bnQzMl90IGRvbWlkLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWlu
dDE2X3Qgdmlld19pZCwgeGVuX3Bmbl90IHN0YXJ0X2dmbiwNCj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IG5yLCBib29sIHN2ZSk7DQo+PiAgIGludCB4Y19h
bHRwMm1fZ2V0X3N1cHByZXNzX3ZlKHhjX2ludGVyZmFjZSAqaGFuZGxlLCB1aW50MzJfdCBkb21p
ZCwNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDE2X3Qgdmlld19pZCwg
eGVuX3Bmbl90IGdmbiwgYm9vbCAqc3ZlKTsNCj4+ICAgaW50IHhjX2FsdHAybV9zZXRfbWVtX2Fj
Y2Vzcyh4Y19pbnRlcmZhY2UgKmhhbmRsZSwgdWludDMyX3QgZG9taWQsDQo+PiBkaWZmIC0tZ2l0
IGEvdG9vbHMvbGlieGMveGNfYWx0cDJtLmMgYi90b29scy9saWJ4Yy94Y19hbHRwMm0uYw0KPj4g
aW5kZXggMDlkYWQwMzU1ZS4uNjYwNWQ5YWJiZSAxMDA2NDQNCj4+IC0tLSBhL3Rvb2xzL2xpYnhj
L3hjX2FsdHAybS5jDQo+PiArKysgYi90b29scy9saWJ4Yy94Y19hbHRwMm0uYw0KPj4gQEAgLTIz
NCw2ICsyMzQsMzEgQEAgaW50IHhjX2FsdHAybV9zZXRfc3VwcHJlc3NfdmUoeGNfaW50ZXJmYWNl
ICpoYW5kbGUsIHVpbnQzMl90IGRvbWlkLA0KPj4gICAgICAgcmV0dXJuIHJjOw0KPj4gICB9DQo+
Pg0KPj4gK2ludCB4Y19hbHRwMm1fc2V0X3N1cHJlc3NfdmVfbXVsdGkoeGNfaW50ZXJmYWNlICpo
YW5kbGUsIHVpbnQzMl90IGRvbWlkLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdWludDE2X3Qgdmlld19pZCwgeGVuX3Bmbl90IHN0YXJ0X2dmbiwNCj4+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IG5yLCBib29sIHN2ZSkNCj4+ICt7
DQo+PiArICAgIGludCByYzsNCj4+ICsgICAgREVDTEFSRV9IWVBFUkNBTExfQlVGRkVSKHhlbl9o
dm1fYWx0cDJtX29wX3QsIGFyZyk7DQo+PiArDQo+PiArICAgIGFyZyA9IHhjX2h5cGVyY2FsbF9i
dWZmZXJfYWxsb2MoaGFuZGxlLCBhcmcsIHNpemVvZigqYXJnKSk7DQo+IA0KPiBEb2VzIHhjX2h5
cGVyY2FsbF9idWZmZXJfYWxsb2MgbnVsbC1pbml0aWFsaXplIHRoZSBzdHJ1Y3R1cmU/DQo+IA0K
DQpJdCBjYWxscyB4ZW5jYWxsX2FsbG9jX2J1ZmZlcl9wYWdlcygpIHdoaWNoIGNhbGxzIG1lbXNl
dChwLCAwLCBucl9wYWdlcyANCiogUEFHRV9TSVpFKSBiZWZvcmUgcmV0dXJuaW5nLg0KDQpBbGV4
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
