Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAA3525DA
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2019 10:03:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfgO5-0003dq-Rk; Tue, 25 Jun 2019 08:01:09 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mqcm=UY=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1hfgO3-0003dl-Bl
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2019 08:01:07 +0000
X-Inumbo-ID: 617d5b5e-971f-11e9-8980-bc764e045a96
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe09::707])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 617d5b5e-971f-11e9-8980-bc764e045a96;
 Tue, 25 Jun 2019 08:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CPmK33zn4wcJKIjVVVK9ncCqzXDUoSudAoWUmWIWO9E=;
 b=nGOQKWXRnm+/MM6rv/Eqtw+GOBd6nLHRDYKwZ26KBOzBOgikMMxCJDfbmf3FxQS4O+Ugfz/pujhG/oL6+FvlwhrouNR5A64OGYw/VgKIaOiBYfm5QkC0IedeDfH9bEwp+QDlU5JvAjsVaS8M8ONHSI9r+pvPNdTqV8krhsoQIIQ=
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com (10.171.106.11) by
 VI1PR0202MB3359.eurprd02.prod.outlook.com (52.134.16.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Tue, 25 Jun 2019 08:01:02 +0000
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::647b:2795:a1b:ee09]) by VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::647b:2795:a1b:ee09%5]) with mapi id 15.20.2008.014; Tue, 25 Jun 2019
 08:01:02 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v3] x86/altp2m: Add a new hypercall to get the active
 altp2m index
Thread-Index: AQHVHR91gFCC2wnfik6rp2c4QxPTkqasHgCA
Date: Tue, 25 Jun 2019 08:01:02 +0000
Message-ID: <79db9398-d65d-1a95-486a-882f69b8ef12@bitdefender.com>
References: <20190607105449.28167-1-aisaila@bitdefender.com>
In-Reply-To: <20190607105449.28167-1-aisaila@bitdefender.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR0P264CA0015.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::27)
 To VI1PR0202MB2928.eurprd02.prod.outlook.com
 (2603:10a6:800:e3::11)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 194c4596-05cf-4076-b259-08d6f9434402
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:VI1PR0202MB3359; 
x-ms-traffictypediagnostic: VI1PR0202MB3359:|VI1PR0202MB3359:
x-microsoft-antispam-prvs: <VI1PR0202MB33594F0D80E558039A48D49EABE30@VI1PR0202MB3359.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2089;
x-forefront-prvs: 0079056367
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(346002)(376002)(396003)(39860400002)(366004)(189003)(478694002)(199004)(186003)(73956011)(7416002)(54906003)(6506007)(6916009)(76176011)(26005)(316002)(478600001)(52116002)(2351001)(14454004)(305945005)(7736002)(486006)(102836004)(4326008)(8936002)(446003)(31696002)(99286004)(2906002)(25786009)(53546011)(8676002)(2616005)(11346002)(229853002)(476003)(81166006)(68736007)(256004)(31686004)(66556008)(66476007)(66446008)(64756008)(14444005)(2501003)(386003)(86362001)(81156014)(71190400001)(71200400001)(66066001)(6512007)(36756003)(66946007)(6436002)(6486002)(3846002)(6116002)(6246003)(5640700003)(5660300002)(53936002)(15583001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0202MB3359;
 H:VI1PR0202MB2928.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: u29gOBzX6j1o/Kh6oejEumF9Fehw/WrnwqwbI/cX7JnWORyi8C8eiqy+Wva4YXe8qZuswsOiFI6PeVF3EQSPV1e+GabGMWVN0DuKpG8kWN5rVYOnXD5YIuWi0Y7CmNh2I9cH1cDn3qpYfbhZzHjsz5JkQQ08bRPiqM8mCFc2cFm732dOwjuVw3o8yy9Pr/R+mfC1/InWsAkRzUiXvAN+OqVeN20VLtaaVPPG1EJFP3l7CASwEM2gFs8gVmgWTfLRXvotV7+SUYkQglKOnLiUu3n5tb8FAQOE+LDlNYbxsw9LtS9+31RXyeq9GuCYX1rV0ACtsa18XDbDz7LW7r3o/NocSEFMJyfntngb0u6ukeQzsRLteuhJ5FgWja1H7Ie/E4Kl+wp5pwoAFQANXby0PjoqVEK/Ggb4QGcHNAjlNO4=
Content-ID: <F9177F2ADA3F1B4C8A401F8914D36E8C@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 194c4596-05cf-4076-b259-08d6f9434402
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2019 08:01:02.2249 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aisaila@bbu.bitdefender.biz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0202MB3359
Subject: Re: [Xen-devel] [PATCH v3] x86/altp2m: Add a new hypercall to get
 the active altp2m index
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
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "wl@xen.org" <wl@xen.org>, "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "tim@xen.org" <tim@xen.org>, "julien.grall@arm.com" <julien.grall@arm.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGluZywNCg0KQW55IHRob3VnaHRzIG9uIHRoaXMgbWF0dGVyIGFyZSBhcHByZWNpYXRlZC4NCg0K
VGhhbmtzLA0KQWxleA0KDQpPbiAwNy4wNi4yMDE5IDEzOjU1LCBBbGV4YW5kcnUgU3RlZmFuIElT
QUlMQSB3cm90ZToNCj4gVGhlIHBhdGNoIGFkZHMgYSBuZXcgbGliIHhjIGZ1bmN0aW9uICh4Y19h
bHRwMm1fZ2V0X3ZjcHVfcDJtX2lkeCkgdGhhdA0KPiB1c2VzIGEgbmV3IGh2bW9wIChIVk1PUF9h
bHRwMm1fZ2V0X3AybV9pZHgpIHRvIGdldCB0aGUgYWN0aXZlIGFsdHAybQ0KPiBpbmRleCBmcm9t
IGEgZ2l2ZW4gdmNwdS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRydSBJc2FpbGEgPGFp
c2FpbGFAYml0ZGVmZW5kZXIuY29tPg0KPiANCj4gLS0tDQo+IENoYW5nZXMgc2luY2UgVjI6DQo+
IAktIFVwZGF0ZSBjb21tZW50IGFuZCB0aXRsZQ0KPiAJLSBSZW1vdmUgcmVkdW5kYW50IG1heF92
Y3B1IGNoZWNrLg0KPiAtLS0NCj4gICB0b29scy9saWJ4Yy9pbmNsdWRlL3hlbmN0cmwuaCAgIHwg
IDIgKysNCj4gICB0b29scy9saWJ4Yy94Y19hbHRwMm0uYyAgICAgICAgIHwgMjUgKysrKysrKysr
KysrKysrKysrKysrKysrKw0KPiAgIHhlbi9hcmNoL3g4Ni9odm0vaHZtLmMgICAgICAgICAgfCAy
MyArKysrKysrKysrKysrKysrKysrKysrKw0KPiAgIHhlbi9pbmNsdWRlL3B1YmxpYy9odm0vaHZt
X29wLmggfCAgOCArKysrKysrKw0KPiAgIDQgZmlsZXMgY2hhbmdlZCwgNTggaW5zZXJ0aW9ucygr
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhjL2luY2x1ZGUveGVuY3RybC5oIGIvdG9v
bHMvbGlieGMvaW5jbHVkZS94ZW5jdHJsLmgNCj4gaW5kZXggNTM4MDA3YTZkYy4uODc1MjZhZjRi
NCAxMDA2NDQNCj4gLS0tIGEvdG9vbHMvbGlieGMvaW5jbHVkZS94ZW5jdHJsLmgNCj4gKysrIGIv
dG9vbHMvbGlieGMvaW5jbHVkZS94ZW5jdHJsLmgNCj4gQEAgLTE5NDIsNiArMTk0Miw4IEBAIGlu
dCB4Y19hbHRwMm1fZ2V0X21lbV9hY2Nlc3MoeGNfaW50ZXJmYWNlICpoYW5kbGUsIHVpbnQzMl90
IGRvbWlkLA0KPiAgIGludCB4Y19hbHRwMm1fY2hhbmdlX2dmbih4Y19pbnRlcmZhY2UgKmhhbmRs
ZSwgdWludDMyX3QgZG9taWQsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQxNl90
IHZpZXdfaWQsIHhlbl9wZm5fdCBvbGRfZ2ZuLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB4ZW5fcGZuX3QgbmV3X2dmbik7DQo+ICtpbnQgeGNfYWx0cDJtX2dldF92Y3B1X3AybV9pZHgo
eGNfaW50ZXJmYWNlICpoYW5kbGUsIHVpbnQzMl90IGRvbWlkLA0KPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHVpbnQzMl90IHZjcHVpZCwgdWludDE2X3QgKnAybWlkeCk7DQo+ICAg
DQo+ICAgLyoqDQo+ICAgICogTWVtIHBhZ2luZyBvcGVyYXRpb25zLg0KPiBkaWZmIC0tZ2l0IGEv
dG9vbHMvbGlieGMveGNfYWx0cDJtLmMgYi90b29scy9saWJ4Yy94Y19hbHRwMm0uYw0KPiBpbmRl
eCBhODY1MjBjMjMyLi4wOWRhZDAzNTVlIDEwMDY0NA0KPiAtLS0gYS90b29scy9saWJ4Yy94Y19h
bHRwMm0uYw0KPiArKysgYi90b29scy9saWJ4Yy94Y19hbHRwMm0uYw0KPiBAQCAtMzUyLDMgKzM1
MiwyOCBAQCBpbnQgeGNfYWx0cDJtX2dldF9tZW1fYWNjZXNzKHhjX2ludGVyZmFjZSAqaGFuZGxl
LCB1aW50MzJfdCBkb21pZCwNCj4gICAgICAgeGNfaHlwZXJjYWxsX2J1ZmZlcl9mcmVlKGhhbmRs
ZSwgYXJnKTsNCj4gICAgICAgcmV0dXJuIHJjOw0KPiAgIH0NCj4gKw0KPiAraW50IHhjX2FsdHAy
bV9nZXRfdmNwdV9wMm1faWR4KHhjX2ludGVyZmFjZSAqaGFuZGxlLCB1aW50MzJfdCBkb21pZCwN
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCB2Y3B1aWQsIHVpbnQx
Nl90ICphbHRwMm1faWR4KQ0KPiArew0KPiArICAgIGludCByYzsNCj4gKw0KPiArICAgIERFQ0xB
UkVfSFlQRVJDQUxMX0JVRkZFUih4ZW5faHZtX2FsdHAybV9vcF90LCBhcmcpOw0KPiArDQo+ICsg
ICAgYXJnID0geGNfaHlwZXJjYWxsX2J1ZmZlcl9hbGxvYyhoYW5kbGUsIGFyZywgc2l6ZW9mKCph
cmcpKTsNCj4gKyAgICBpZiAoIGFyZyA9PSBOVUxMICkNCj4gKyAgICAgICAgcmV0dXJuIC0xOw0K
PiArDQo+ICsgICAgYXJnLT52ZXJzaW9uID0gSFZNT1BfQUxUUDJNX0lOVEVSRkFDRV9WRVJTSU9O
Ow0KPiArICAgIGFyZy0+Y21kID0gSFZNT1BfYWx0cDJtX2dldF9wMm1faWR4Ow0KPiArICAgIGFy
Zy0+ZG9tYWluID0gZG9taWQ7DQo+ICsgICAgYXJnLT51LmdldF92Y3B1X3AybV9pZHgudmNwdV9p
ZCA9IHZjcHVpZDsNCj4gKw0KPiArICAgIHJjID0geGVuY2FsbDIoaGFuZGxlLT54Y2FsbCwgX19I
WVBFUlZJU09SX2h2bV9vcCwgSFZNT1BfYWx0cDJtLA0KPiArICAgICAgICAgICAgICAgICBIWVBF
UkNBTExfQlVGRkVSX0FTX0FSRyhhcmcpKTsNCj4gKyAgICBpZiAoICFyYyApDQo+ICsgICAgICAg
ICphbHRwMm1faWR4ID0gYXJnLT51LmdldF92Y3B1X3AybV9pZHguYWx0cDJtX2lkeDsNCj4gKw0K
PiArICAgIHhjX2h5cGVyY2FsbF9idWZmZXJfZnJlZShoYW5kbGUsIGFyZyk7DQo+ICsgICAgcmV0
dXJuIHJjOw0KPiArfQ0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS9odm0uYyBiL3hl
bi9hcmNoL3g4Ni9odm0vaHZtLmMNCj4gaW5kZXggMDI5ZWVhM2I4NS4uNGVlN2U2Y2U0NyAxMDA2
NDQNCj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9odm0uYw0KPiArKysgYi94ZW4vYXJjaC94ODYv
aHZtL2h2bS5jDQo+IEBAIC00NTAwLDYgKzQ1MDAsNyBAQCBzdGF0aWMgaW50IGRvX2FsdHAybV9v
cCgNCj4gICAgICAgY2FzZSBIVk1PUF9hbHRwMm1fc2V0X21lbV9hY2Nlc3NfbXVsdGk6DQo+ICAg
ICAgIGNhc2UgSFZNT1BfYWx0cDJtX2dldF9tZW1fYWNjZXNzOg0KPiAgICAgICBjYXNlIEhWTU9Q
X2FsdHAybV9jaGFuZ2VfZ2ZuOg0KPiArICAgIGNhc2UgSFZNT1BfYWx0cDJtX2dldF9wMm1faWR4
Og0KPiAgICAgICAgICAgYnJlYWs7DQo+ICAgDQo+ICAgICAgIGRlZmF1bHQ6DQo+IEBAIC00NzM1
LDYgKzQ3MzYsMjggQEAgc3RhdGljIGludCBkb19hbHRwMm1fb3AoDQo+ICAgICAgICAgICAgICAg
ICAgICAgICBfZ2ZuKGEudS5jaGFuZ2VfZ2ZuLm9sZF9nZm4pLA0KPiAgICAgICAgICAgICAgICAg
ICAgICAgX2dmbihhLnUuY2hhbmdlX2dmbi5uZXdfZ2ZuKSk7DQo+ICAgICAgICAgICBicmVhazsN
Cj4gKw0KPiArICAgIGNhc2UgSFZNT1BfYWx0cDJtX2dldF9wMm1faWR4Og0KPiArICAgIHsNCj4g
KyAgICAgICAgc3RydWN0IHZjcHUgKnY7DQo+ICsNCj4gKyAgICAgICAgaWYgKCAhYWx0cDJtX2Fj
dGl2ZShkKSApDQo+ICsgICAgICAgIHsNCj4gKyAgICAgICAgICAgIHJjID0gLUVPUE5PVFNVUFA7
DQo+ICsgICAgICAgICAgICBicmVhazsNCj4gKyAgICAgICAgfQ0KPiArDQo+ICsgICAgICAgIGlm
ICggKHYgPSBkb21haW5fdmNwdShkLCBhLnUuZ2V0X3ZjcHVfcDJtX2lkeC52Y3B1X2lkKSkgPT0g
TlVMTCApDQo+ICsgICAgICAgIHsNCj4gKyAgICAgICAgICAgIHJjID0gLUVJTlZBTDsNCj4gKyAg
ICAgICAgICAgIGJyZWFrOw0KPiArICAgICAgICB9DQo+ICsNCj4gKyAgICAgICAgYS51LmdldF92
Y3B1X3AybV9pZHguYWx0cDJtX2lkeCA9IGFsdHAybV92Y3B1X2lkeCh2KTsNCj4gKyAgICAgICAg
cmMgPSBfX2NvcHlfdG9fZ3Vlc3QoYXJnLCAmYSwgMSkgPyAtRUZBVUxUIDogMDsNCj4gKyAgICAg
ICAgYnJlYWs7DQo+ICsgICAgfQ0KPiArDQo+ICAgICAgIGRlZmF1bHQ6DQo+ICAgICAgICAgICBB
U1NFUlRfVU5SRUFDSEFCTEUoKTsNCj4gICAgICAgfQ0KPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1
ZGUvcHVibGljL2h2bS9odm1fb3AuaCBiL3hlbi9pbmNsdWRlL3B1YmxpYy9odm0vaHZtX29wLmgN
Cj4gaW5kZXggYzZjZDEyZjU5Ni4uMzUzZjgwMzRkOSAxMDA2NDQNCj4gLS0tIGEveGVuL2luY2x1
ZGUvcHVibGljL2h2bS9odm1fb3AuaA0KPiArKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMvaHZtL2h2
bV9vcC5oDQo+IEBAIC0zMDQsNiArMzA0LDExIEBAIHN0cnVjdCB4ZW5faHZtX2FsdHAybV9jaGFu
Z2VfZ2ZuIHsNCj4gICB0eXBlZGVmIHN0cnVjdCB4ZW5faHZtX2FsdHAybV9jaGFuZ2VfZ2ZuIHhl
bl9odm1fYWx0cDJtX2NoYW5nZV9nZm5fdDsNCj4gICBERUZJTkVfWEVOX0dVRVNUX0hBTkRMRSh4
ZW5faHZtX2FsdHAybV9jaGFuZ2VfZ2ZuX3QpOw0KPiAgIA0KPiArc3RydWN0IHhlbl9odm1fYWx0
cDJtX2dldF92Y3B1X3AybV9pZHggew0KPiArICAgIHVpbnQzMl90IHZjcHVfaWQ7DQo+ICsgICAg
dWludDE2X3QgYWx0cDJtX2lkeDsNCj4gK307DQo+ICsNCj4gICBzdHJ1Y3QgeGVuX2h2bV9hbHRw
Mm1fb3Agew0KPiAgICAgICB1aW50MzJfdCB2ZXJzaW9uOyAgIC8qIEhWTU9QX0FMVFAyTV9JTlRF
UkZBQ0VfVkVSU0lPTiAqLw0KPiAgICAgICB1aW50MzJfdCBjbWQ7DQo+IEBAIC0zMzIsNiArMzM3
LDggQEAgc3RydWN0IHhlbl9odm1fYWx0cDJtX29wIHsNCj4gICAjZGVmaW5lIEhWTU9QX2FsdHAy
bV9nZXRfbWVtX2FjY2VzcyAgICAgICAxMg0KPiAgIC8qIERpc2FibGUgYWx0cDJtIGV2ZW50IG5v
dGlmaWNhdGlvbnMgZm9yIGEgZ2l2ZW4gVkNQVSAqLw0KPiAgICNkZWZpbmUgSFZNT1BfYWx0cDJt
X3ZjcHVfZGlzYWJsZV9ub3RpZnkgIDEzDQo+ICsvKiBHZXQgdGhlIGFjdGl2ZSB2Y3B1IHAybSBp
bmRleCAqLw0KPiArI2RlZmluZSBIVk1PUF9hbHRwMm1fZ2V0X3AybV9pZHggICAgICAgICAgMTQN
Cj4gICAgICAgZG9taWRfdCBkb21haW47DQo+ICAgICAgIHVpbnQxNl90IHBhZDE7DQo+ICAgICAg
IHVpbnQzMl90IHBhZDI7DQo+IEBAIC0zNDcsNiArMzU0LDcgQEAgc3RydWN0IHhlbl9odm1fYWx0
cDJtX29wIHsNCj4gICAgICAgICAgIHN0cnVjdCB4ZW5faHZtX2FsdHAybV9zZXRfbWVtX2FjY2Vz
c19tdWx0aSBzZXRfbWVtX2FjY2Vzc19tdWx0aTsNCj4gICAgICAgICAgIHN0cnVjdCB4ZW5faHZt
X2FsdHAybV9zdXBwcmVzc192ZSAgICAgICAgICBzdXBwcmVzc192ZTsNCj4gICAgICAgICAgIHN0
cnVjdCB4ZW5faHZtX2FsdHAybV92Y3B1X2Rpc2FibGVfbm90aWZ5ICBkaXNhYmxlX25vdGlmeTsN
Cj4gKyAgICAgICAgc3RydWN0IHhlbl9odm1fYWx0cDJtX2dldF92Y3B1X3AybV9pZHggICAgIGdl
dF92Y3B1X3AybV9pZHg7DQo+ICAgICAgICAgICB1aW50OF90IHBhZFs2NF07DQo+ICAgICAgIH0g
dTsNCj4gICB9Ow0KPiANCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
