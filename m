Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F401A1006B2
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2019 14:42:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iWhFq-0001mJ-3k; Mon, 18 Nov 2019 13:39:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nFnZ=ZK=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1iWhFp-0001mE-Ez
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2019 13:39:45 +0000
X-Inumbo-ID: e0f78dbe-0a08-11ea-b678-bc764e2007e4
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.97]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e0f78dbe-0a08-11ea-b678-bc764e2007e4;
 Mon, 18 Nov 2019 13:39:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CLScMb8zy6QkidfH7gnXn/p8RBG91HDc/xsYUqNHbA8/IUJBRY86onDf4wzYbE5489zHzs8pAWLpjE6lmmc7Al4wDKY8+O00TFgkYRe1Hc55Biqx06K/3d3IRiDyCoMSk4+l1mfZW+z6MgqwChXmdF2YQmc8nBj04G7emrbVfGIs84uDQVvzW7hUHfNR8ZsjQaXzk5s0W+wOx7Lw7RZaWillGXSf0ZBYoBb0bBhQJDP5OQAp0wW8kkH+xURD4b0eEQfsxAAVztfLBLYvWAO1MgDsg8jL5o+KyFJ3ZO0lLys1HxskZ3qynL1sAI9qxgqck5yLR5zoAunxfp/rvd7elA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y2oR44I7rYw/RzCcVBr53hPXKxaoz/20eHc8imQCQjE=;
 b=gDXn1+8043NS07H5nWSFTPd5inscvjVpceppdOJ4Ai8h1YVyfGuhx1PUF2O08pWu+FA10FroPYNYSXlQDXe2BEMWb+32VypFgftEKVq2LiX0HxZHnkwjjXDIWQjMMd1dMvv+qRVsUxGSyAl3lLVnJ2FMVU9R+a2xxI4+0tZwCH4YTfK3sZuZg2WrRvwnxTMch8PRbnjq3sy8o38LNTBnXRW4mu/qY6GnXkWkr+bRfqpTBczRrxztIrIiAa+CIQO0b4GQXmTZ1ncVUcruHneDXTAA42TSGwZs7X9fPbBaxCac+Xx4NaIoAb3cT1EnOqseIJHuv0e6mobF4RVo+wJl+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y2oR44I7rYw/RzCcVBr53hPXKxaoz/20eHc8imQCQjE=;
 b=NX2XBNMRggOdyfdlIonDQKll4exXsWlW8yoMbLwCmyfcVidz75Jil/nwwtbptG5ZyA23MpPlakDeBI7J/GuIRtZ00kJ1nDpV+ZoqVibh+RzhSubxC+8T8qysAjSyG8jBaY8vQlkux/02m/TcBZsz/sgdR/BHhbTduFVDh2Y3Tj0=
Received: from AM0PR02MB5553.eurprd02.prod.outlook.com (10.255.30.78) by
 AM0PR02MB5953.eurprd02.prod.outlook.com (52.132.215.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.22; Mon, 18 Nov 2019 13:39:43 +0000
Received: from AM0PR02MB5553.eurprd02.prod.outlook.com
 ([fe80::64a3:6278:eb96:26e0]) by AM0PR02MB5553.eurprd02.prod.outlook.com
 ([fe80::64a3:6278:eb96:26e0%4]) with mapi id 15.20.2451.029; Mon, 18 Nov 2019
 13:39:43 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <jbeulich@suse.com>, "tamas@tklengyel.com"
 <tamas@tklengyel.com>
Thread-Topic: [Xen-devel] [PATCH V2 1/2] x86/altp2m: Add hypercall to set a
 range of sve bits
Thread-Index: AQHVlLfBrDM8T0M9gEmymLFobxrGFKeHdoUAgAmLTYA=
Date: Mon, 18 Nov 2019 13:39:43 +0000
Message-ID: <8c928769-c0ea-8a48-3bda-aba7d17133ba@bitdefender.com>
References: <20191106153442.12776-1-aisaila@bitdefender.com>
 <9a02de11-09bd-a54f-48f6-1ce1a0246325@suse.com>
In-Reply-To: <9a02de11-09bd-a54f-48f6-1ce1a0246325@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR04CA0032.eurprd04.prod.outlook.com
 (2603:10a6:208:122::45) To AM0PR02MB5553.eurprd02.prod.outlook.com
 (2603:10a6:208:160::14)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 42ea5e83-7166-458d-5675-08d76c2cc498
x-ms-traffictypediagnostic: AM0PR02MB5953:|AM0PR02MB5953:|AM0PR02MB5953:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR02MB59535D2FA99B26FBA48F2B15AB4D0@AM0PR02MB5953.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-forefront-prvs: 0225B0D5BC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(39860400002)(376002)(346002)(366004)(136003)(189003)(199004)(14444005)(229853002)(99286004)(25786009)(386003)(110136005)(53546011)(102836004)(54906003)(76176011)(6512007)(2501003)(478600001)(36756003)(66476007)(66946007)(66556008)(64756008)(66446008)(4326008)(6246003)(2906002)(256004)(14454004)(6486002)(66066001)(5660300002)(6436002)(31686004)(6506007)(6116002)(86362001)(8936002)(52116002)(486006)(3846002)(446003)(2616005)(476003)(26005)(7736002)(186003)(31696002)(316002)(8676002)(81166006)(305945005)(71200400001)(71190400001)(7416002)(11346002)(81156014);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR02MB5953;
 H:AM0PR02MB5553.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: votCttfTF300kYP9Aqh9woCVB1wAJt1Do/oMC3/DUh+kX/npE9ZAd7Lv632Tq48nzuID068mvIHe9oe/7GncsedFu4a9/eAoJYXc/NA3Vsx6X5cZeI7emcBj3rGvFaMT47+BGobKG93HIRRNwDkgrumjwy7TSpWCIdMjrJVgqV5/tW3QehZC2UjyN+8KLkpr694tVKTiojTrrgopCErZzF+PqNnXu2rGZrCYhr5N109Eg+jV5berv6cDUFMJg8oi/CQFqtSeLplRzORCCisZrIpftkZwOx+UtC3EWSInplB4EgakHUQkwOBhwd17ct8iNTRCrx9itL5vILsia47RGe0MkXxrXSfJnBJMDVNX8nYEJwBc6zgyDDtiTtuVpu/MptKKQ8486yWiHLQWbk9HV/EmLViQksI8rMHaZvmHXPyhbPAZMVB89UvSBLrHDSm0
Content-ID: <B87A51A1E9E6544BA3469445A0740593@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42ea5e83-7166-458d-5675-08d76c2cc498
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2019 13:39:43.0782 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PIPIyHz1b4v5f960pA0BHI8A6slKlZoS25t4EkPai+PmC/9snbDGSYy2AlsOCuIYN5nVs791Hucu6wbUTTuxBv8MMmzZyMLHYi2XfWoiZ3c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB5953
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
 "julien@xen.org" <julien@xen.org>, "wl@xen.org" <wl@xen.org>,
 Razvan COJOCARU <rcojocaru@bitdefender.com>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDEyLjExLjIwMTkgMTM6NTQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNi4xMS4y
MDE5IDE2OjM1LCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToNCj4+IEBAIC00NjgxLDcg
KzQ2ODIsNyBAQCBzdGF0aWMgaW50IGRvX2FsdHAybV9vcCgNCj4+ICAgICAgICAgICBicmVhazsN
Cj4+ICAgDQo+PiAgICAgICBjYXNlIEhWTU9QX2FsdHAybV9zZXRfc3VwcHJlc3NfdmU6DQo+PiAt
ICAgICAgICBpZiAoIGEudS5zdXBwcmVzc192ZS5wYWQxIHx8IGEudS5zdXBwcmVzc192ZS5wYWQy
ICkNCj4+ICsgICAgICAgIGlmICggYS51LnN1cHByZXNzX3ZlLnBhZDEgKQ0KPiANCj4gSnVzdCBi
ZWNhdXNlIHRoZSBmaWVsZCBjaGFuZ2VzIGl0cyBuYW1lIGRvZXNuJ3QgbWVhbiB5b3UgY2FuDQo+
IGRyb3AgdGhlIGNoZWNrLiBZb3UgZXZlbiBhZGQgYSBuZXcgZmllbGQgbm90IHVzZWQgKHlldCkg
YnkNCj4gdGhpcyBzdWItZnVuY3Rpb24sIHdoaWNoIHRoZW4gYWxzbyB3b3VsZCBuZWVkIGNoZWNr
aW5nIGhlcmUuDQoNCkkgd2lsbCByZXZlcnQgdGhlIGNoYW5nZSBhbmQgY2hlY2sgdGhlIG5ldyBm
aWVsZC4NCg0KPiANCj4+IEBAIC00NjkzLDggKzQ2OTQsMjMgQEAgc3RhdGljIGludCBkb19hbHRw
Mm1fb3AoDQo+PiAgICAgICAgICAgfQ0KPj4gICAgICAgICAgIGJyZWFrOw0KPj4gICANCj4+ICsg
ICAgY2FzZSBIVk1PUF9hbHRwMm1fc2V0X3N1cHByZXNzX3ZlX211bHRpOg0KPj4gKyAgICAgICAg
aWYgKCBhLnUuc3VwcHJlc3NfdmUucGFkMSB8fCAhYS51LnN1cHByZXNzX3ZlLm5yICkNCj4gDQo+
IEEgY291bnQgb2YgemVybyB0eXBpY2FsbHkgaXMgdGFrZW4gYXMgYSBuby1vcCwgbm90IGFuIGVy
cm9yLg0KDQpJIHdpbGwgcmV0dXJuIC1FUEVSTSBmb3IgIW5yLg0KDQo+IA0KPj4gKyAgICAgICAg
ICAgIHJjID0gLUVJTlZBTDsNCj4+ICsgICAgICAgIGVsc2UNCj4+ICsgICAgICAgIHsNCj4+ICsg
ICAgICAgICAgICByYyA9IHAybV9zZXRfc3VwcHJlc3NfdmVfbXVsdGkoZCwgJmEudS5zdXBwcmVz
c192ZSk7DQo+PiArDQo+PiArICAgICAgICAgICAgaWYgKCByYyA9PSAtRVJFU1RBUlQgKQ0KPj4g
KyAgICAgICAgICAgICAgICBpZiAoIF9fY29weV9maWVsZF90b19ndWVzdChndWVzdF9oYW5kbGVf
Y2FzdChhcmcsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHhlbl9odm1fYWx0cDJtX29wX3QpLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAmYSwgdS5zdXBwcmVzc192ZS5vcGFxdWUpICkNCj4+ICsgICAgICAgICAg
ICAgICAgICAgIHJjID0gLUVGQVVMVDsNCj4gDQo+IElmIHRoZSBvcGVyYXRpb24gaXMgYmVzdCBl
ZmZvcnQsIF9zb21lXyBpbmRpY2F0aW9uIG9mIGZhaWx1cmUgc2hvdWxkDQo+IHN0aWxsIGJlIGhh
bmRlZCBiYWNrIHRvIHRoZSBjYWxsZXIuIFdoZXRoZXIgdGhhdCdzIHRocm91Z2ggdGhlIG9wYXF1
ZQ0KPiBmaWVsZCBvciBieSBzb21lIG90aGVyIG1lYW5zIGlzIHNlY29uZGFyeS4gSWYgbm90IHZp
YSB0aGF0IGZpZWxkDQo+ICh3aGljaCB3b3VsZCBtYWtlIHRoZSBvdXRlciBvZiB0aGUgdHdvIGlm
KCktcyBkaXNhcHBlYXIpLCBwbGVhc2UgZm9sZA0KPiB0aGUgaWYoKS1zLg0KDQpUaGlzIGNhbiBi
ZSBzb2x2ZWQgYnkgaGF2aW5nIGEgaW50IGVycm9yX2xpc3QgdGhhdCB3aWxsIGdldCANCiJjb3B5
X3RvX2d1ZXN0X29mZnNldCgpIiBhdCB0aGUgZW5kLg0KDQo+IA0KPj4gLS0tIGEveGVuL2FyY2gv
eDg2L21tL3AybS5jDQo+PiArKysgYi94ZW4vYXJjaC94ODYvbW0vcDJtLmMNCj4+IEBAIC0zMDU0
LDYgKzMwNTQsNjQgQEAgb3V0Og0KPj4gICAgICAgcmV0dXJuIHJjOw0KPj4gICB9DQo+PiAgIA0K
Pj4gKy8qDQo+PiArICogU2V0L2NsZWFyIHRoZSAjVkUgc3VwcHJlc3MgYml0IGZvciBtdWx0aXBs
ZSBwYWdlcy4gIE9ubHkgYXZhaWxhYmxlIG9uIFZNWC4NCj4+ICsgKi8NCj4+ICtpbnQgcDJtX3Nl
dF9zdXBwcmVzc192ZV9tdWx0aShzdHJ1Y3QgZG9tYWluICpkLA0KPj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHN0cnVjdCB4ZW5faHZtX2FsdHAybV9zdXBwcmVzc192ZSogc3ZlKQ0K
PiANCj4gTWlzcGxhY2VkICouDQoNCkkndmUgbWlzc2VkIHRoYXQsIEknbGwgaGF2ZSBpdCB0aGUg
cmlnaHQgd2F5Lg0KDQo+IA0KPj4gK3sNCj4+ICsgICAgc3RydWN0IHAybV9kb21haW4gKmhvc3Rf
cDJtID0gcDJtX2dldF9ob3N0cDJtKGQpOw0KPj4gKyAgICBzdHJ1Y3QgcDJtX2RvbWFpbiAqYXAy
bSA9IE5VTEw7DQo+PiArICAgIHN0cnVjdCBwMm1fZG9tYWluICpwMm07DQo+PiArICAgIHVpbnQ2
NF90IHN0YXJ0ID0gc3ZlLT5vcGFxdWUgPzogc3ZlLT5nZm47DQo+IA0KPiBBY2NvcmRpbmcgdG8g
dGhpcyBzdGFydCAoYW5kIGhlbmNlIC0+b3BhcXVlKSBhcmUgR0ZOcy4NCj4gDQo+PiArICAgIGlu
dCByYyA9IDA7DQo+PiArDQo+PiArICAgIGlmICggc3ZlLT52aWV3ID4gMCApDQo+PiArICAgIHsN
Cj4+ICsgICAgICAgIGlmICggc3ZlLT52aWV3ID49IE1BWF9BTFRQMk0gfHwNCj4+ICsgICAgICAg
ICAgICAgZC0+YXJjaC5hbHRwMm1fZXB0cFtzdmUtPnZpZXddID09IG1mbl94KElOVkFMSURfTUZO
KSApDQo+PiArICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+PiArDQo+PiArICAgICAgICBw
Mm0gPSBhcDJtID0gZC0+YXJjaC5hbHRwMm1fcDJtW3N2ZS0+dmlld107DQo+PiArICAgIH0NCj4+
ICsgICAgZWxzZQ0KPj4gKyAgICAgICAgcDJtID0gaG9zdF9wMm07DQo+PiArDQo+PiArICAgIHAy
bV9sb2NrKGhvc3RfcDJtKTsNCj4+ICsNCj4+ICsgICAgaWYgKCBhcDJtICkNCj4+ICsgICAgICAg
IHAybV9sb2NrKGFwMm0pOw0KPj4gKw0KPj4gKw0KPj4gKyAgICB3aGlsZSAoIHN0YXJ0IDwgc3Zl
LT5uciApDQo+IA0KPiBBY2NvcmRpbmcgdG8gdGhpcywgc3RhcnQgaXMgYW4gaW5kZXguIFdoaWNo
IG9mIHRoZSB0d28gZG8geW91DQo+IG1lYW4/DQoNClN0YXJ0IGlzIGEgR0ZOLg0KDQo+IA0KPj4g
LS0tIGEveGVuL2luY2x1ZGUvcHVibGljL2h2bS9odm1fb3AuaA0KPj4gKysrIGIveGVuL2luY2x1
ZGUvcHVibGljL2h2bS9odm1fb3AuaA0KPj4gQEAgLTQyLDggKzQyLDkgQEAgc3RydWN0IHhlbl9o
dm1fYWx0cDJtX3N1cHByZXNzX3ZlIHsNCj4+ICAgICAgIHVpbnQxNl90IHZpZXc7DQo+PiAgICAg
ICB1aW50OF90IHN1cHByZXNzX3ZlOyAvKiBCb29sZWFuIHR5cGUuICovDQo+PiAgICAgICB1aW50
OF90IHBhZDE7DQo+PiAtICAgIHVpbnQzMl90IHBhZDI7DQo+PiArICAgIHVpbnQzMl90IG5yOw0K
Pj4gICAgICAgdWludDY0X3QgZ2ZuOw0KPj4gKyAgICB1aW50NjRfdCBvcGFxdWU7DQo+PiAgIH07
DQo+IA0KPiBIb3cgaXMgdGhpcyBhZGRpdGlvbiBvZiBhIGZpZWxkIGdvaW5nIHRvIHdvcmsgY29t
cGF0aWJseSB3aXRoIG9sZA0KPiBhbmQgbmV3IGNhbGxlcnMgb24gb2xkIGFuZCBuZXcgaHlwZXJ2
aXNvcnM/IFJlY2FsbCBpbiBwYXJ0aWN1bGFyDQo+IHRoYXQgdGhlc2Ugb3BlcmF0aW9ucyBhcmUg
KGFsbW9zdD8pIGFsbCBwb3RlbnRpYWxseSB1c2FibGUgYnkgdGhlDQo+IGd1ZXN0IGl0c2VsZi4N
Cj4gDQoNCkZvciB0aGlzIEhWTU9QX0FMVFAyTV9JTlRFUkZBQ0VfVkVSU0lPTiBzaG91dCBiZSBp
bmNyZWFzZWQuIEkgd2lsbCBsZWF2ZSANCml0IHRvIFRhbWFzIHRvIGRlY2lkZSBpZiB3ZSB3aWxs
IG5lZWQgYSBkaWZmZXJlbnQgc3RydWN0dXJlIGZvciANCnhlbl9odm1fYWx0cDJtX3N1cHByZXNz
X3ZlX211bHRpIHRvIGtlZXAgdGhlIGNvbXBhdGliaWxpdHkuDQoNClJlZ2FyZHMsDQpBbGV4DQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
