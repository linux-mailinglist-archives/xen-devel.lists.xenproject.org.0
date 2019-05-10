Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C17519C06
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2019 12:57:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hP38T-0007Nr-JD; Fri, 10 May 2019 10:52:17 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=syrU=TK=bitdefender.com=ppircalabu@srs-us1.protection.inumbo.net>)
 id 1hP38R-0007Nl-RM
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 10:52:15 +0000
X-Inumbo-ID: aaece2bc-7311-11e9-8980-bc764e045a96
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe08::701])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id aaece2bc-7311-11e9-8980-bc764e045a96;
 Fri, 10 May 2019 10:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H04fhVD4dAZVDGoShTiYFu+iq/enoaR/yHruIt2z3WU=;
 b=jnNGmBsxcejTVyRa26mWPxBeZePmFVZNCmNi9owPd5NwlTTZ4UM0T9c3bmArI/yaSDyRNGadO8YtGs6nPptjeNzVQBH0ngo8ccRuGZgMUc8lRVI6EEhEMTgdFn0K5sepv+gdDWU67zHFD3q6u1GMZUGfsLZ4XxSvm2NW1O8y3UI=
Received: from AM0PR02MB5572.eurprd02.prod.outlook.com (10.255.30.141) by
 AM0PR02MB3698.eurprd02.prod.outlook.com (52.133.63.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.11; Fri, 10 May 2019 10:52:12 +0000
Received: from AM0PR02MB5572.eurprd02.prod.outlook.com
 ([fe80::20e8:5f57:e5b3:3ce4]) by AM0PR02MB5572.eurprd02.prod.outlook.com
 ([fe80::20e8:5f57:e5b3:3ce4%7]) with mapi id 15.20.1878.022; Fri, 10 May 2019
 10:52:12 +0000
From: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Tamas K Lengyel
 <tamas@tklengyel.com>
Thread-Topic: [Xen-devel] [VMI] Possible race-condition in altp2m APIs
Thread-Index: AQHVBCe1hGWWc4tjWk6wGvrEPGgjfKZeVBwAgAE8sYCAA2zjgIAABn8AgAARuQCAAAPlAIABGriA
Date: Fri, 10 May 2019 10:52:11 +0000
Message-ID: <6a1009e7d820c8ef66c0923a2b74d97cb4f8397f.camel@bitdefender.com>
References: <f3zRvkN8JOfpv5k6jz7TbWXz-sso4q6CGB-3S05mSco8SuDy0BoN5z5_Lj_-Xnto1FPMCkhE89trkq-_f6itwRZ5F4NI9MKrcqZk8cdT45A=@protonmail.com>
 <76bd924a-34b1-eb7c-d3be-6c33aa7729fc@citrix.com>
 <WL45-Mjyf7to-l_u4XAT3M46R6YcAECvEwl6SDzOWeLE_SOQUyF26Vj2cu0mScD47fS95OaBAWDddX7DL7yujvl03YffFRDoqrpRcFDSnxA=@protonmail.com>
 <oSx3iO5YqwrWedfgCT8yEj4jGrzisHnNA6d9XQIKAJJAOhr6TPANrqVHf6s56L8_WBgLtVMJv37Cypbr2emtg0ZKb25HdHo91eM1J1fVJHo=@protonmail.com>
 <4f34ed81-8993-2e5d-9aea-89a6e2d98b44@citrix.com>
 <CABfawh=_Xg225Tfw-zS9iXXk2pdUG0MyBi3+Co5Urmh6EfTOXw@mail.gmail.com>
 <a8f1adea-9d57-5953-614f-85f7b97be44f@citrix.com>
In-Reply-To: <a8f1adea-9d57-5953-614f-85f7b97be44f@citrix.com>
Accept-Language: ro-RO, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM5PR0701CA0014.eurprd07.prod.outlook.com
 (2603:10a6:203:51::24) To AM0PR02MB5572.eurprd02.prod.outlook.com
 (2603:10a6:208:161::13)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ppircalabu@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9b4cb3c4-2288-486f-7b2d-08d6d5358e37
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:AM0PR02MB3698; 
x-ms-traffictypediagnostic: AM0PR02MB3698:|AM0PR02MB3698:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <AM0PR02MB3698398967E23C67AD46CAC2D60C0@AM0PR02MB3698.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 0033AAD26D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(376002)(136003)(396003)(39860400002)(366004)(189003)(199004)(66446008)(66476007)(66556008)(64756008)(110136005)(50226002)(14454004)(71190400001)(316002)(6486002)(966005)(99286004)(229853002)(71200400001)(446003)(54906003)(486006)(66946007)(118296001)(476003)(11346002)(2616005)(86362001)(66066001)(68736007)(256004)(4326008)(53936002)(36756003)(73956011)(8676002)(5660300002)(6246003)(2906002)(7736002)(305945005)(386003)(6506007)(3846002)(6116002)(52116002)(53546011)(478600001)(6436002)(81156014)(76176011)(81166006)(6306002)(26005)(25786009)(186003)(6512007)(8936002)(102836004)(4744005)(99106002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR02MB3698;
 H:AM0PR02MB5572.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: V8LH39za0ags5BuNQM5j2SFlU1PHH54vquV4QI5w13CIKq3NH0iEsBtJsnNMCVSne5ztfN+a822xOrma3oL4QknOdDdIFzEqLpvSOepz0MaQzMKUykbiFoMRm5rGYGC09CiqInhcko7B/EJZlVBb/OvpDxKfaEvEP94gBMHu178BSK8dsKFswU8884/Vw05q3AhMna1vFLJ1Tr6x5gzxhgKVnVyWZxbBesGa/IMei/boBA/LEVIuFkkRxs5oFNxROAsIB03Jgv4rA7QkOjWqnUFeM8H0VuYLO/3LLf+HZK2wRxmuFDPTh74sInS/JuNCBRuQvjs/UWEfeBMomXBOioZ1bE6e89OChYTvpOwHpwJI3soZyPsLmuMnmFHVHDLV72LgazV6+DwbkKNbjyeo7Ev8woWr6lFRyc7vYspYMjQ=
Content-ID: <0F5332E1A9D56A4BBFC67FA0A6AF3DCC@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b4cb3c4-2288-486f-7b2d-08d6d5358e37
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2019 10:52:11.8765 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB3698
Subject: Re: [Xen-devel] [VMI] Possible race-condition in altp2m APIs
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Mathieu Tarral <mathieu.tarral@protonmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCAyMDE5LTA1LTA5IGF0IDE5OjAwICswMTAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0K
PiA+IA0KPiBPbiAwOS8wNS8yMDE5IDE4OjQ2LCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6DQo+ID4g
DQo+IA0KPiBJIGhhdmUgc29tZSBwbGFucyB0byByZXBsYWNlIGl0IHdpdGggc29tZXRoaW5nIGZh
ciBtb3JlIHVzYWJsZSwgYXMNCj4gcGFydA0KPiBvZiB0eWluZyB0b2dldGhlciBzb21lIFhURi1i
YXNlZCBWTUkgdGVzdGluZywgYnV0IG5vbmUgb2YgdGhhdCBpcw0KPiByZW1vdGVseSByZWFkeSB5
ZXQuDQpIaSBBbmRyZXcsDQoNCkRpZCB5b3UgZ2V0IGEgY2hhbmNlIHRvIGxvb2sgYXQgdGhpcyBz
ZXJpZXM/IA0KaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1k
ZXZlbC8yMDE4LTEyL21zZzAyNDIxLmh0bWwNCg0KSWYgaXQgZG9lbnMndCBtYXRjaCB5b3VyIHJl
cXVpcmVtZW50cywgSSBjYW4gbW9kaWZ5IGl0IGFjY29yZGluZ2x5Lg0KDQpNYW55IHRoYW5rcywN
ClBldHJlDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
