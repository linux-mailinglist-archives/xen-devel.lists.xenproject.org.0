Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BBDAFB5A
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 13:28:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i80kp-0005fD-7l; Wed, 11 Sep 2019 11:25:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pg/j=XG=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1i80gi-0005bT-C9
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 11:21:28 +0000
X-Inumbo-ID: 4b755760-d486-11e9-b299-bc764e2007e4
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.3.134]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4b755760-d486-11e9-b299-bc764e2007e4;
 Wed, 11 Sep 2019 11:21:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j4QSFYEqALFBvoOAp6ci6DlGmITDwebQ7MU2fXwhMSc//xkcnHlpaCHX5b0YU51kBOHyMaJ1w/eqkk7vH1xa7/51KXzfe8QV2GBcebEYLNewYs6lGf2Q+44+HNUk75ypGLFxEBA+0C7TnNEU0qBeszJ4ZIUMZZ2hgKOCgmChDpl6hSjecgjrQuFx6wS7DkLMLnG6Qi1hJGk16YgZSGCUEHPmevRaptKstk35DOnhQe3gVXROIBYEZCv8txWDKcoiP9F4rTsNr4kPqc6and5FDIK+IHUcDBLT0wXBdNax7Sn/r9pGaZSKxG2PrUam1iybLFCYMc6Yydh2epTbkQl7yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uyiKVO1t+nbU+3V0LyIxclkdbW4B0+b3OKXXayl8ILU=;
 b=Mw4gAEvp6M/tRqFLWKvkfRLlLr7kdEQsmTuYwPxrTJnrGhna/EGgJwt+u7rhTgVoV0el6q45nbbk3Ia9tgi1G0eZmGTYXrJITYoSGkA1CXMM0SGenzZkp5LNy/z+zDnRSL5ZmiV7OEa/dZt/0xnbAK7tDE2SmsXfdfesJog9D8vjcDetNTUXqhZjFts+o4Bw/ZZcMU1MxIrncuI7CbHB35b8GxKXSAIFvluOkZ5JXmoi4sxsPIr5t5rRK21Ouys0rbDzaGrrpGKvEsizoasGU5445B3DMqe74JIsYZVI4TmYuu7ulg2xaJ/rUE9/Au+HwZjgkaROcUzslvPqlVUCiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bbu.bitdefender.biz; dkim=pass header.d=bbu.bitdefender.biz;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uyiKVO1t+nbU+3V0LyIxclkdbW4B0+b3OKXXayl8ILU=;
 b=aCyQG0C9tsETN90xEek2v74oHRFoC04fWavFIT5Ti+vbuP1elZNQyjTn2arVykCiqUPttafhtzn5Z4VG6XmlEUs3C2tHp2q41M/4vC+xSLugY84F+47E7VZCIf91K53W9LKnvwAS7eJ22KKmYfjF1JNr3b1qHQ7trpTlVJgcqtQ=
Received: from AM0PR02MB4627.eurprd02.prod.outlook.com (20.178.20.81) by
 AM0PR02MB3873.eurprd02.prod.outlook.com (52.134.84.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17; Wed, 11 Sep 2019 11:21:25 +0000
Received: from AM0PR02MB4627.eurprd02.prod.outlook.com
 ([fe80::31c4:8275:626e:4dfd]) by AM0PR02MB4627.eurprd02.prod.outlook.com
 ([fe80::31c4:8275:626e:4dfd%5]) with mapi id 15.20.2241.022; Wed, 11 Sep 2019
 11:21:25 +0000
From: Razvan Cojocaru <rcojocaru@bbu.bitdefender.biz>
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>, Jan Beulich
 <jbeulich@suse.com>, Razvan COJOCARU <rcojocaru@bitdefender.com>,
 "tamas@tklengyel.com" <tamas@tklengyel.com>
Thread-Topic: [PATCH v9] x86/emulate: Send vm_event from emulate
Thread-Index: AQHVZyQz09ftstBAgkqLCbI9BLbek6cmQG2AgAALiACAAAvWgA==
Date: Wed, 11 Sep 2019 11:21:25 +0000
Message-ID: <607886a8-7eff-56e3-598c-85b3e4109d88@bbu.bitdefender.biz>
References: <20190909153508.10847-1-aisaila@bitdefender.com>
 <4ae96ee9-192d-f790-b2cb-9d60a5aab292@suse.com>
 <e7330f19-9350-54f2-a066-730f1ab3c145@bitdefender.com>
In-Reply-To: <e7330f19-9350-54f2-a066-730f1ab3c145@bitdefender.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM4PR05CA0020.eurprd05.prod.outlook.com (2603:10a6:205::33)
 To AM0PR02MB4627.eurprd02.prod.outlook.com
 (2603:10a6:208:f8::17)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=rcojocaru@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e1e3030e-d995-451f-b389-08d736aa2ed4
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR02MB3873; 
x-ms-traffictypediagnostic: AM0PR02MB3873:|AM0PR02MB3873:|AM0PR02MB3873:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR02MB38739EA25D6220EC6B5E6C54ABB10@AM0PR02MB3873.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(136003)(39860400002)(396003)(376002)(346002)(189003)(199004)(305945005)(31686004)(7736002)(76176011)(66946007)(99286004)(52116002)(14454004)(42882007)(2616005)(11346002)(446003)(53546011)(6506007)(386003)(102836004)(186003)(26005)(6246003)(6512007)(53936002)(25786009)(478600001)(4326008)(6116002)(3846002)(81166006)(8936002)(229853002)(2906002)(66556008)(66476007)(64756008)(81156014)(8676002)(66446008)(6486002)(2501003)(6436002)(66066001)(110136005)(54906003)(71200400001)(71190400001)(31696002)(316002)(256004)(14444005)(486006)(476003)(5660300002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR02MB3873;
 H:AM0PR02MB4627.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: TkB1563niOcWBfyx06fTcC8SjmwhaoRYW1vBnsabbAo+4pWUHs1oEfBAR3fQT2nGtlV/XKflqQCgWYV9RCg8gbJqypht9hkvqsFVXTUmuqzK2fv3J3NalJXCW9WMlC//+n7wRo67ez6UkhOxLvOhjvr1ASyPQ7y0Yy3JDSsDfvTZGHECHCJh5u7enSjI37+6zo+NRpAyxInaR3jZ/xsJsm6ew3hcdLT55VlmbaiyU4H8C5Tm8z/fFxAVSmGji9kg55OajP/WWjbuhzTmOA9Pup1j7q4dVQckuM+9AWdtOglllMoFC4Tj0aSRT7vXFN6tsiWuC7u5auUYa0YkC/pZJLCMCo2N5fDq6jNJDZxAfXQ2gXr/LAt7B/dg8+cLLY3R8I5wVTGZkxVE/znwU5q/30lCZE/As+iTP0ExBo0W8ko=
Content-ID: <A30587B7F07CB6499862D869BEA903EE@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bbu.bitdefender.biz
X-MS-Exchange-CrossTenant-Network-Message-Id: e1e3030e-d995-451f-b389-08d736aa2ed4
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 11:21:25.5745 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W1dIjrqH3RWLUYhtuTabSGPXcpp1b28Tm0p1Fv7AmR6l/OH08TIdt2VLc8NK6Bh+4fDPuZRNNCyaMzDu1Ctlaz9YGsZN/BmQsHDOGSW2zx8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB3873
X-Mailman-Approved-At: Wed, 11 Sep 2019 11:25:42 +0000
Subject: Re: [Xen-devel] [PATCH v9] x86/emulate: Send vm_event from emulate
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
 "wl@xen.org" <wl@xen.org>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "paul.durrant@citrix.com" <paul.durrant@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOS8xMS8xOSAxOjM5IFBNLCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToNCj4gDQo+
IA0KPiBPbiAxMS4wOS4yMDE5IDEyOjU3LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+IE9uIDA5LjA5
LjIwMTkgMTc6MzUsIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIHdyb3RlOg0KPj4+ICsvKg0KPj4+
ICsgKiBTZW5kIG1lbW9yeSBhY2Nlc3Mgdm1fZXZlbnRzIGJhc2VkIG9uIHBmZWMuIFJldHVybnMg
dHJ1ZSBpZiB0aGUgZXZlbnQgd2FzDQo+Pj4gKyAqIHNlbnQgYW5kIGZhbHNlIGZvciBwMm1fZ2V0
X21lbV9hY2Nlc3MoKSBlcnJvciwgbm8gdmlvbGF0aW9uIGFuZCBldmVudCBzZW5kDQo+Pj4gKyAq
IGVycm9yLiBBc3N1bWVzIHRoZSBjYWxsZXIgd2lsbCBjaGVjayBhcmNoLnZtX2V2ZW50LT5zZW5k
X2V2ZW50Lg0KPj4+ICsgKg0KPj4+ICsgKiBOT1RFOiBwMm1fZ2V0X21lbV9hY2Nlc3MoKSBjYW4g
ZmFpbCBpZiB0aGUgZW50cnkgd2FzIG5vdCBmb3VuZCBpbiB0aGUgRVBUDQo+Pj4gKyAqIChpbiB3
aGljaCBjYXNlIGFjY2VzcyB0byBpdCBpcyB1bnJlc3RyaWN0ZWQsIHNvIG5vIHZpb2xhdGlvbnMg
Y2FuIG9jY3VyKS4NCj4+PiArICogSW4gdGhpcyBjYXNlcyBpdCBpcyBmaW5lIHRvIGNvbnRpbnVl
IHRoZSBlbXVsYXRpb24uDQo+Pj4gKyAqLw0KPj4+ICtib29sIGh2bV9tb25pdG9yX2NoZWNrX2Vw
dCh1bnNpZ25lZCBsb25nIGdsYSwgZ2ZuX3QgZ2ZuLCB1aW50MzJfdCBwZmVjLA0KPj4+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICB1aW50MTZfdCBraW5kKQ0KPj4NCj4+IFdoeSBkaWQgeW91
IGNob29zZSB0byBoYXZlICJlcHQiIGluIHRoZSBuYW1lIGFuZCBhbHNvIG1lbnRpb24gaXQNCj4+
IGluIHRoZSBjb21taXQ/IElzIHRoZXJlIGFueXRoaW5nIGluIGhlcmUgd2hpY2ggaXNuJ3QgZ2Vu
ZXJpYyBwMm0/DQo+IA0KPiBUaGUgbmFtZSB3YXMgc3VnZ2VzdGVkIGJ5IFJhenZhbiBDb2pvY2Fy
dS4gSSBoYXZlIG5vIHByZWZlcmVuY2UgaW4gdGhlDQo+IG5hbWUuIE1heWJlIFRhbWFzIGNhbiBz
dWdnZXN0IGEgZ29vZCBvbmUuDQoNCkkndmUgc3VnZ2VzdGVkICJlcHQiIGluIHRoZSBuYW1lIGJl
Y2F1c2UgInJlZ3VsYXIiIGVtdWxhdGlvbiBpZ25vcmVzIGl0LCANCmFuZCB0aGlzIGZ1bmN0aW9u
IHRha2VzIGl0IGludG8gYWNjb3VudCwgaGVuY2UgdGhlICJjaGVja19lcHQiICh3aGljaCBJIA0K
dGhvdWdodCB3b3VsZCBiZSByZWFkIHRvZ2V0aGVyKS4gSXQncyBmaW5lIHRvIGNoYW5nZSBpdCB0
byBzb21ldGhpbmcgZWxzZS4NCg0KDQpUaGFua3MsDQpSYXp2YW4NCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
