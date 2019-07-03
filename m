Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9825E59C
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2019 15:38:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hifQP-0007xK-Ej; Wed, 03 Jul 2019 13:35:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SCRb=VA=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1hifQN-0007xA-Vw
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2019 13:35:52 +0000
X-Inumbo-ID: 780ce700-9d97-11e9-8f99-2f813120cc0c
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.15.95]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 780ce700-9d97-11e9-8f99-2f813120cc0c;
 Wed, 03 Jul 2019 13:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yM3IiGlb+Uq5poLw8Iuby88qsK3NQPun1euXOfIDdmk=;
 b=X7aIDNTXbEjH1fcLjWkvQeEz8izckaxPuzHbWPUh8kySP7o47Wtx9PpHeWUJsGx35iEo3GkCYF/VDGk9TTVwZDtzUdeWaKFtkL6flb1G7PZFZX20s6lt1aA++temFp3gl5/fdgbYFM9busqjybM6SeMJjRpp0z6ncICvA9x81Xw=
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com (10.171.106.11) by
 VI1PR0202MB3455.eurprd02.prod.outlook.com (52.134.17.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Wed, 3 Jul 2019 13:35:47 +0000
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::dd50:3e97:1d64:5aa3]) by VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::dd50:3e97:1d64:5aa3%4]) with mapi id 15.20.2032.019; Wed, 3 Jul 2019
 13:35:47 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <JBeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH v2 1/5] x86/cpuidle: switch to uniform
 meaning of "max_cstate="
Thread-Index: AQHVMZ+vT4qTqzV7vk6Vbk2g8RMb26a5E8gA///OQgCAAAMlgA==
Date: Wed, 3 Jul 2019 13:35:47 +0000
Message-ID: <6a40c5fc-85a9-b91b-e2ee-95cee279d77b@bitdefender.com>
References: <0dbf8520-89c7-753e-c10a-13399aec9cd5@suse.com>
 <0f8bb5dd-718c-7226-db4c-b57ee7089735@suse.com>
 <e735f34e-f8b2-ff15-ea3f-943efc83b23a@bitdefender.com>
 <d6778530-3f10-9ab1-cddf-c46786680d63@suse.com>
In-Reply-To: <d6778530-3f10-9ab1-cddf-c46786680d63@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR0P264CA0160.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1b::28) To VI1PR0202MB2928.eurprd02.prod.outlook.com
 (2603:10a6:800:e3::11)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2d1ce745-3ac7-4377-60a2-08d6ffbb5b27
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:VI1PR0202MB3455; 
x-ms-traffictypediagnostic: VI1PR0202MB3455:|VI1PR0202MB3455:
x-microsoft-antispam-prvs: <VI1PR0202MB3455765E45B2CAD124548380ABFB0@VI1PR0202MB3455.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 00872B689F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(376002)(366004)(136003)(396003)(346002)(199004)(189003)(6916009)(99286004)(6486002)(81156014)(81166006)(4744005)(76176011)(256004)(31696002)(186003)(4326008)(64756008)(66446008)(5660300002)(66556008)(71200400001)(71190400001)(26005)(66476007)(3846002)(6116002)(229853002)(36756003)(66946007)(73956011)(8936002)(2906002)(25786009)(6506007)(6246003)(53936002)(52116002)(102836004)(8676002)(86362001)(66066001)(446003)(476003)(2616005)(386003)(316002)(486006)(68736007)(31686004)(6512007)(7736002)(305945005)(478600001)(14454004)(6436002)(11346002)(54906003)(53546011);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0202MB3455;
 H:VI1PR0202MB2928.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 9XSio8HqxPDaRVGJnwfekNvEKK0xT4ySFaQdn4iWoYn/rnlH70jGEpeBt+4WyGq3Vp/+kkOYJE8Yye6nbTyVBbeh/+ufHwlbE5dH4uadvqJqTnLHRwWtZYwPZO4shCdifm2kHoR+MJB6WjV0FG+5mN+KCSrOmk9Df/PquMGk7zyh8UOARces3QJqPrzrqRXNbmx3E4Tsyc4nQRZ5JThkuKroik2Se00o3fqg/S/B55S19FQK5W4eDdnf9h/Kij1m2UVx83Z6bNue8z3SNCnKP0kH/tW3nB7FS820SauX2KMb9/Efle2WceSAxlcuzjJ2bJi0qbEVW0eGtatPyxUnHXobzCnM3Z5jnAny/tc/2wUGhqaDK3MvfVc2tXy9mBaAvqT5IsWBFaxW9LgSU1TZJLkHfpdqZ0GGCFvCEKYdJpE=
Content-ID: <EA943354F773454AB13D4B9574BE0568@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d1ce745-3ac7-4377-60a2-08d6ffbb5b27
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2019 13:35:47.6341 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aisaila@bbu.bitdefender.biz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0202MB3455
Subject: Re: [Xen-devel] [PATCH v2 1/5] x86/cpuidle: switch to uniform
 meaning of "max_cstate="
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDAzLjA3LjIwMTkgMTY6MjQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwMy4wNy4y
MDE5IDE1OjIyLCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToNCj4+PiAtLS0gYS94ZW4v
YXJjaC94ODYvY3B1L213YWl0LWlkbGUuYw0KPj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9jcHUvbXdh
aXQtaWRsZS5jDQo+Pj4gQEAgLTczMSw3ICs3MzEsOCBAQCBzdGF0aWMgdm9pZCBtd2FpdF9pZGxl
KHZvaWQpDQo+Pj4gICAgICAJCX0gd2hpbGUgKGN4LT50eXBlID4gbWF4X2NzdGF0ZSAmJiAtLW5l
eHRfc3RhdGUpOw0KPj4+ICAgICAgCQlpZiAoIW5leHRfc3RhdGUpDQo+Pj4gICAgICAJCQljeCA9
IE5VTEw7DQo+Pj4gLQkJbWVudV9nZXRfdHJhY2VfZGF0YSgmZXhwLCAmcHJlZCk7DQo+Pj4gKwkJ
ZWxzZSBpZiAodGJfaW5pdF9kb25lKQ0KPj4+ICsJCQltZW51X2dldF90cmFjZV9kYXRhKCZleHAs
ICZwcmVkKTsNCj4+DQo+PiBTdHlsZSA/Pw0KPiANCj4gSSBkb24ndCBzZWUgYW55IHN0eWxlIHZp
b2xhdGlvbiBoZXJlLCBjb21wYXJpbmcgd2l0aCBuZWlnaGJvcmluZw0KPiBjb2RlLiBQbGVhc2Ug
Y2xhcmlmeS4NCj4gDQoNCkkgc2F3IHRoYXQgdGhhdCBmaWxlIGhhcyBhIGRpZmZlcmVudCBzcGFj
aW5nIG9uIGlmL3doaWxlIGJ1dCBJIGxvb2tlZCBpbiANCnRoZSBkaXJlY3RvcnkgKGFyY2gvOHg2
L2NwdSkgYW5kIHRoZXJlIGlzIGEgc3R5bGUgbWl4IGxpa2UgaW4gDQp2cG11LmMvc2hhbmdoYWku
Yy92cG11X2FtZC5jL3ZtcHVfaW50ZWwuYyB2cyB0aGUgcmVzdC4gSSB3YXMgdGhpbmtpbmcgDQp0
aGF0IHRoZSBuZXcgY29kZSBzaG91bGQgYmUgd2l0aCB0aGUgbmV3IHJ1bGVzLg0KDQpJZiB0aGlz
IGRvZXMgbm90IGFwcGx5IGhlcmUgdGhlbiBpdCdzIG9rLg0KDQpSZWdhcmRzLA0KQWxleA0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
