Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AC410EA31
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2019 13:42:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ibkz8-0008W7-PN; Mon, 02 Dec 2019 12:39:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CFGx=ZY=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1ibkz6-0008Va-SN
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2019 12:39:24 +0000
X-Inumbo-ID: c4b96796-1500-11ea-a55d-bc764e2007e4
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.5.121]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c4b96796-1500-11ea-a55d-bc764e2007e4;
 Mon, 02 Dec 2019 12:39:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hy9mgtFUGy3wQesryHdL6OvGUuLoFCYNp/VA+d9Ovd2+2PzWu2zZNAu8BjQvW8wW17OzVwKpanTkaVnI0JUkkvPLQS66Lca3WSDI4PSZ6eJielOv3iIurDu9G/Q5lnCnNpQJ6XFyQuCLF2Muxm3s8202pavqa1SwB8LOwwvnZFwDF57p3kN+iLfMSVL3j7QTEPJUMd1Wg4oYKznna63PCJZldFIrIB9oZgwloWmVQfUJ7QlF6KkuYje/4poTxUdSk+TCdN38hDxcqNI8xdpwph1CzVgoE+Wu1XWJnLPVl48m1YgmrkJBCZTvw26dTc71P0jf+3Q8S7FSlwD8Wet46A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Nm0mgxSj13z4NCKTXNwisYSr29Q7Bn2UPIfyQIWEL4=;
 b=Gj1nbIMPgd2arRoZJnknwJ/dtvQ89EoZSK7KGQ3x7P5VuHYzrrUTNaWTNALfuFx2R4n6+y7WOPiyslcd/YOIAahK/SPdxlf9IjMTSrszo9QR9X4wjXOao5kLFTyfr7S7GGNgR8N0bR0p2Bi+xRvJvB4X6fHEbsUKujuRit8tbSQaLxZJR5Zv4IIV0kHur47QlatOqEqbWEsZamMW8Rd1iF5nT2YZgcA8uUmM38VOLt98cr8s5CfJCo4NBl0tiPA1jxgFO7h4es+GuGJG6sRzowYaJPTo4zVj2UYG8yOeW6Oy4egQVROuNsqubSBDxqEQgVYb8knj/bKDBTfXA+h1+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Nm0mgxSj13z4NCKTXNwisYSr29Q7Bn2UPIfyQIWEL4=;
 b=ITI2zBiovseFJTMkCq5j39+YzRY4Ad2fsZnEnrkNwAbmA/08aQRyeJ6yN1hRhsq73eiPkyGUWmZBg5JwPb0E2G16GpmxIXPeAAXfCAm8/9QI770nn8xPYZaYFb51NcZ5wSc75/vOBmEfQvYDdR6GfAtpeqk3pFIMR2tHC8fjeoE=
Received: from AM0PR02MB5553.eurprd02.prod.outlook.com (10.255.30.78) by
 AM0PR02MB5826.eurprd02.prod.outlook.com (52.132.215.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.22; Mon, 2 Dec 2019 12:39:22 +0000
Received: from AM0PR02MB5553.eurprd02.prod.outlook.com
 ([fe80::8cec:7638:734c:89d]) by AM0PR02MB5553.eurprd02.prod.outlook.com
 ([fe80::8cec:7638:734c:89d%4]) with mapi id 15.20.2495.014; Mon, 2 Dec 2019
 12:39:22 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH V3 2/2] x86/mm: Make use of the default access param from
 xc_altp2m_create_view
Thread-Index: AQHVoHytGfGqS+cYyU6c6j3Ysa8x8qeiEvOAgATHHAA=
Date: Mon, 2 Dec 2019 12:39:22 +0000
Message-ID: <528a8abe-d697-1c07-9e7c-43e02e4680a6@bitdefender.com>
References: <20191121150124.15865-1-aisaila@bitdefender.com>
 <20191121150124.15865-2-aisaila@bitdefender.com>
 <4079604a-8f82-687c-19ff-d0ecfd068dd3@suse.com>
In-Reply-To: <4079604a-8f82-687c-19ff-d0ecfd068dd3@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: FR2P281CA0009.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::19) To AM0PR02MB5553.eurprd02.prod.outlook.com
 (2603:10a6:208:160::14)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 23f18a6a-30f6-4080-8ada-08d77724a82b
x-ms-traffictypediagnostic: AM0PR02MB5826:|AM0PR02MB5826:|AM0PR02MB5826:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR02MB5826C09B9B7E9669AB1AA030AB430@AM0PR02MB5826.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0239D46DB6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(346002)(396003)(39860400002)(366004)(376002)(199004)(189003)(53546011)(6506007)(386003)(52116002)(102836004)(8676002)(81166006)(6512007)(31686004)(6246003)(6436002)(81156014)(8936002)(5660300002)(86362001)(4326008)(54906003)(99286004)(316002)(25786009)(36756003)(14454004)(478600001)(31696002)(446003)(305945005)(2616005)(7416002)(7736002)(6916009)(11346002)(26005)(76176011)(6486002)(229853002)(186003)(66066001)(71200400001)(71190400001)(2906002)(66946007)(66556008)(64756008)(66446008)(66476007)(256004)(6116002)(3846002)(14444005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR02MB5826;
 H:AM0PR02MB5553.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ELHm7z9gkEl00TvbbMktsgSUR/d6yH/0utSx8Dx0Gx64C4GsZuxPJt+NPgqiSmOzkWUVwZ6YLu/mmZxgCoKt/ieqcYSjw0nBFUKLMDyfgCt+Yhohss04WlnFh+dHrO4FDNvdYmpoSKv56IDSq1X7w5Aoe6iO1bqZ1uVOBxGVG6AFKo/tDiMvWB8/cXHsiasgIy6zQP/aRmQ9CQGrCMZgPg5nIbQLDKxJ56SzrTLTs8mUskfnLE3sN3rlPpWq/I1yHBwgyavUh1L1yZ1ScFSu05bd6GMsflWc6lc0qVKMtPDgV4lf1I/+lwIM7b3dxrAnv9yFyYzOigIlprxBRSk/OlukI7vPYOBfiy5MaoAdMwNmtvaIV58wrbSkpQxy2jK/6+d+aKDrZl+MjzGyVDJV9NV2xJ8x58n86f15atyBzYXNM4lQ6OVxxHIQD2UrbJXg
Content-ID: <369CB155F270554E848AC116FC599EB0@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23f18a6a-30f6-4080-8ada-08d77724a82b
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2019 12:39:22.2277 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RHL9GOc3TKta6S/aJBPZ1ctfn0CzCEFLw7QCrOeOffgi2ebJ9cacdVxo3k3G7alXKdidDy7bmo/FT9hwH6vT6N35HE+W2hgO533EYB+IO98=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB5826
Subject: Re: [Xen-devel] [PATCH V3 2/2] x86/mm: Make use of the default
 access param from xc_altp2m_create_view
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
 Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Razvan COJOCARU <rcojocaru@bitdefender.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDI5LjExLjIwMTkgMTM6NDEsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyMS4xMS4y
MDE5IDE2OjAyLCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToNCj4+IENoYW5nZXMgc2lu
Y2UgVjI6DQo+PiAJLSBEcm9wIHN0YXRpYyBmcm9tIHhlbm1lbV9hY2Nlc3NfdG9fcDJtX2FjY2Vz
cygpIGFuZCBkZWNsYXJlIGl0DQo+PiBpbiBtZW1fYWNjZXNzLmgNCj4+IAktIFVzZSB4ZW5tZW1f
YWNjZXNzX3RvX3AybV9hY2Nlc3MoKSBpbiBwMm1faW5pdF9uZXh0X2FsdHAybSgpDQo+PiAJLSBQ
dWxsIG91dCB0aGUgcDJtIHNwZWNpZmljcyBmcm9tIHAybV9pbml0X2FsdHAybV9lcHQoKS4NCj4g
DQo+IEkgZ3Vlc3MgdGhpcyBsYXN0IHBvaW50IHdvdWxkIGJldHRlciBoYXZlIGJlZW4gYSBwcmVy
ZXEgcGF0Y2gsDQo+IGJ1dCBhbnl3YXkuDQoNClNob3VsZCBJIGhhdmUgYSBwcmVyZXEgcGF0Y2gg
Zm9yIHRoaXMgaW4gdGhlIG5leHQgdmVyc2lvbj8NCg0KPiANCj4+IEBAIC0yNTc3LDE2ICsyNTg2
LDIzIEBAIGludCBwMm1faW5pdF9hbHRwMm1fYnlfaWQoc3RydWN0IGRvbWFpbiAqZCwgdW5zaWdu
ZWQgaW50IGlkeCkNCj4+ICAgICAgIGFsdHAybV9saXN0X2xvY2soZCk7DQo+PiAgIA0KPj4gICAg
ICAgaWYgKCBkLT5hcmNoLmFsdHAybV9lcHRwW2lkeF0gPT0gbWZuX3goSU5WQUxJRF9NRk4pICkN
Cj4+IC0gICAgICAgIHJjID0gcDJtX2FjdGl2YXRlX2FsdHAybShkLCBpZHgpOw0KPj4gKyAgICAg
ICAgcmMgPSBwMm1fYWN0aXZhdGVfYWx0cDJtKGQsIGlkeCwgaG9zdHAybS0+ZGVmYXVsdF9hY2Nl
c3MpOw0KPj4gICANCj4+ICAgICAgIGFsdHAybV9saXN0X3VubG9jayhkKTsNCj4+ICAgICAgIHJl
dHVybiByYzsNCj4+ICAgfQ0KPj4gICANCj4+IC1pbnQgcDJtX2luaXRfbmV4dF9hbHRwMm0oc3Ry
dWN0IGRvbWFpbiAqZCwgdWludDE2X3QgKmlkeCkNCj4+ICtpbnQgcDJtX2luaXRfbmV4dF9hbHRw
Mm0oc3RydWN0IGRvbWFpbiAqZCwgdWludDE2X3QgKmlkeCwNCj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgdWludDE2X3QgaHZtbWVtX2RlZmF1bHRfYWNjZXNzKQ0KPiANCj4gRG9lcyB0aGlz
IG5ldyBwYXJhbWV0ZXIgcmVhbGx5IG5lZWQgdG8gYmUgYSBmaXhlZCB3aWR0aCB0eXBlLA0KPiBy
YXRoZXIgdGhhbiBzaW1wbHkgdW5zaWduZWQgaW50IChvciBldmVuIGEgc3VpdGFibGUgZW51bQ0K
PiB0eXBlIGlmIHRoZXJlIFtob3BlZnVsbHldIGlzIG9uZSk/DQoNCkkgdGhpbmsgeGVubWVtX2Fj
Y2Vzc190IHdvdWxkIGJlIGEgZ29vZCBmaXQgaGVyZS4NCg0KPiANCj4+ICAgew0KPj4gICAgICAg
aW50IHJjID0gLUVJTlZBTDsNCj4+ICAgICAgIHVuc2lnbmVkIGludCBpOw0KPj4gKyAgICBwMm1f
YWNjZXNzX3QgYTsNCj4+ICsgICAgc3RydWN0IHAybV9kb21haW4gKnAybTsNCj4+ICsNCj4+ICsN
Cj4gDQo+IFR3byBzdWNjZXNzaXZlIGJsYW5rIGxpbmVzIGFnYWluLg0KDQpJIHdpbGwgZml4IHRo
YXQuDQoNCj4gDQo+PiBAQCAtMjU5NSw3ICsyNjExLDEyIEBAIGludCBwMm1faW5pdF9uZXh0X2Fs
dHAybShzdHJ1Y3QgZG9tYWluICpkLCB1aW50MTZfdCAqaWR4KQ0KPj4gICAgICAgICAgIGlmICgg
ZC0+YXJjaC5hbHRwMm1fZXB0cFtpXSAhPSBtZm5feChJTlZBTElEX01GTikgKQ0KPj4gICAgICAg
ICAgICAgICBjb250aW51ZTsNCj4+ICAgDQo+PiAtICAgICAgICByYyA9IHAybV9hY3RpdmF0ZV9h
bHRwMm0oZCwgaSk7DQo+PiArICAgICAgICBwMm0gPSBkLT5hcmNoLmFsdHAybV9wMm1baV07DQo+
PiArDQo+PiArICAgICAgICBpZiAoICF4ZW5tZW1fYWNjZXNzX3RvX3AybV9hY2Nlc3MocDJtLCBo
dm1tZW1fZGVmYXVsdF9hY2Nlc3MsICZhKSApDQo+PiArICAgICAgICAgICAgcmV0dXJuIC1FSU5W
QUw7DQo+IA0KPiBSZXR1cm5pbmcgd2l0aCBhIGxvY2sgc3RpbGwgaGVsZD8NCg0KVGhhbmtzIGZv
ciBzcG90dGluZyB0aGlzLCBpdCBkZWZpbml0ZWx5IG5lZWRzIGEgZnJlZS4NCg0KQWxleA0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
