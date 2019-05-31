Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AEE30929
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2019 09:11:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWbdv-0006sC-0R; Fri, 31 May 2019 07:07:59 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1Y3R=T7=bitdefender.com=ppircalabu@srs-us1.protection.inumbo.net>)
 id 1hWbdt-0006s7-Ff
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 07:07:57 +0000
X-Inumbo-ID: d035905b-8372-11e9-8980-bc764e045a96
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe06::72d])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d035905b-8372-11e9-8980-bc764e045a96;
 Fri, 31 May 2019 07:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4KTuyG16Hf8sAQEd6ip7G7gSa9FgWmm16heSkRjoWy0=;
 b=CieZkwCNLSo50fVimhlhS6E0hj+EmRlrP2pJq4kNThpO4cIikmLpCa4Ry+Vy0U5yki3AUaxmIHet6uGh3Q0sZHqt8ikJwnF/V11eL3yzJi2Mp/nufSgtHc0rXDY45Wjkc6Ch0iwZF24DlBg3x1Cs+zSBtQr6x5M0Se7+uBUTX/w=
Received: from AM0PR02MB5572.eurprd02.prod.outlook.com (10.255.30.141) by
 AM0PR02MB3794.eurprd02.prod.outlook.com (52.134.86.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.20; Fri, 31 May 2019 07:07:54 +0000
Received: from AM0PR02MB5572.eurprd02.prod.outlook.com
 ([fe80::20e8:5f57:e5b3:3ce4]) by AM0PR02MB5572.eurprd02.prod.outlook.com
 ([fe80::20e8:5f57:e5b3:3ce4%7]) with mapi id 15.20.1922.021; Fri, 31 May 2019
 07:07:53 +0000
From: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Thread-Topic: [PATCH 0/9] Per vcpu vm_event channels
Thread-Index: AQHVFvKYzbGJ8biygUyTgkCpYOT3iqaDymyAgAEGyQA=
Date: Fri, 31 May 2019 07:07:53 +0000
Message-ID: <8ba4014e1f8afb7391b211dcca8956ae011407d5.camel@bitdefender.com>
References: <cover.1559224640.git.ppircalabu@bitdefender.com>
 <CABfawh=ggx3sVzffdXD==Pr6kKmMH94TOqia2EnYqrXx+r-HFA@mail.gmail.com>
In-Reply-To: <CABfawh=ggx3sVzffdXD==Pr6kKmMH94TOqia2EnYqrXx+r-HFA@mail.gmail.com>
Accept-Language: ro-RO, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM6P191CA0002.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8b::15) To AM0PR02MB5572.eurprd02.prod.outlook.com
 (2603:10a6:208:161::13)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ppircalabu@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 543946f1-e947-427c-6c0d-08d6e596b31c
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:AM0PR02MB3794; 
x-ms-traffictypediagnostic: AM0PR02MB3794:|AM0PR02MB3794:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <AM0PR02MB379467E7B4AB39CACBE7343BD6190@AM0PR02MB3794.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 00540983E2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(396003)(366004)(376002)(346002)(136003)(199004)(189003)(86362001)(53936002)(76176011)(26005)(8936002)(52116002)(50226002)(4326008)(5660300002)(7736002)(99286004)(6246003)(256004)(71190400001)(316002)(54906003)(14444005)(71200400001)(81156014)(81166006)(8676002)(66066001)(305945005)(2906002)(7416002)(68736007)(476003)(2616005)(102836004)(6512007)(11346002)(118296001)(486006)(3846002)(6306002)(73956011)(6116002)(66446008)(14454004)(66556008)(66476007)(66946007)(966005)(446003)(64756008)(478600001)(229853002)(36756003)(53546011)(6506007)(386003)(186003)(25786009)(6916009)(6436002)(6486002)(99106002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR02MB3794;
 H:AM0PR02MB5572.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: yvY7tO7+2s/kXmpMKJvZG8DKl3EU3uL1DAFbA3Lpi4Axwd0szj+dT+1qhIxKYvcNfvSLKC5Rh6u9XBnXD1vK/7tKyQWvkOkumvM0lxU2u5ilbJw2kQ9fGVxePdhxLudRMlNBIevsd9+HiYILmhAXcw9GYXikM1Tju70H4cRalHUfLWtTdOXurlY9alwXSI2tkwjgo/2MsOKkxvvq5X9LQQBLElFACdJuMsXS7HqnePr6Y0Ltz3WRMzeoEK3N3JUq/TxVtZc/xtH0ITO10OCsucp7UuQlwfgUYJyoNz/u78PA2RsOWOBypRBSFZKOn2NZPeLDjDz2WKDf1lgKRM7UNNj3h8glXXlITHTnHMuc0U/1k8ZAagzNcyJb7rmk5oYdvlpsk0I3MWlSlVEaPbyt6WLl+jd63Jl1De55/0RVwJU=
Content-ID: <57B8887CC4BA8948A0B6218CBC1C92F0@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 543946f1-e947-427c-6c0d-08d6e596b31c
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2019 07:07:53.8169 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ppircalabu@bbu.bitdefender.biz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB3794
Subject: Re: [Xen-devel] [PATCH 0/9] Per vcpu vm_event channels
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCAyMDE5LTA1LTMwIGF0IDA4OjI3IC0wNzAwLCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6
DQo+IE9uIFRodSwgTWF5IDMwLCAyMDE5IGF0IDc6MTggQU0gUGV0cmUgUGlyY2FsYWJ1DQo+IDxw
cGlyY2FsYWJ1QGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6DQo+ID4gDQo+ID4gVGhpcyBwYXRjaHNl
dCBhZGRzIGEgbmV3IG1lY2hhbmlzbSBvZiBzZW5kaW5nIHN5bmNocm9ub3VzIHZtX2V2ZW50DQo+
ID4gcmVxdWVzdHMgYW5kIGhhbmRsaW5nIHZtX2V2ZW50IHJlc3BvbnNlcyB3aXRob3V0IHVzaW5n
IGEgcmluZy4NCj4gPiBBcyBlYWNoIHN5bmNocm9ub3VzIHJlcXVlc3QgcGF1c2VzIHRoZSB2Y3B1
IHVudGlsIHRoZSBjb3JyZXNwb25kaW5nDQo+ID4gcmVzcG9uc2UgaXMgaGFuZGxlZCwgaXQgY2Fu
IGJlIHN0b3JlZCBpbiBhIHNsb3R0ZWQgbWVtb3J5IGJ1ZmZlcg0KPiA+IChvbmUgcGVyIHZjcHUp
IHNoYXJlZCBiZXR3ZWVuIHRoZSBoeXBlcnZpc29yIGFuZCB0aGUgY29udHJvbGxpbmcNCj4gPiBk
b21haW4uDQo+ID4gDQo+ID4gVGhlIG1haW4gYWR2YW50YWdlcyBvZiB0aGlzIGFwcHJvYWNoIGFy
ZToNCj4gPiAtIHRoZSBhYmlsaXR5IHRvIGR5bmFtaWNhbHkgYWxsb2NhdGUgdGhlIG5lY2Vzc2Fy
eSBtZW1vcnkgdXNlZCB0bw0KPiA+IGhvbGQNCj4gPiB0aGUgcmVxdWVzdHMvcmVzcG9uc2VzICh0
aGUgc2l6ZSBvZg0KPiA+IHZtX2V2ZW50X3JlcXVlc3RfdC92bV9ldmVudF9yZXNwb25zZV90DQo+
ID4gY2FuIGdyb3cgdW5yZXN0cmljdGVkIGJ5IHRoZSByaW5nJ3Mgb25lIHBhZ2UgbGltaXRhdGlv
bikNCj4gPiAtIHRoZSByaW5nJ3Mgd2FpdHF1ZXVlIGxvZ2ljIGlzIHVubmVjZXNzYXJ5IGluIHRo
aXMgY2FzZSBiZWNhdXNlDQo+ID4gdGhlDQo+ID4gdmNwdSBzZW5kaW5nIHRoZSByZXF1ZXN0IGlz
IGJsb2NrZWQgdW50aWwgYSByZXNwb25zZSBpcyByZWNlaXZlZC4NCj4gDQo+IEhpIFBldHJlLA0K
PiBjb3VsZCB5b3UgcHVzaCB0aGlzIHNlcmllcyBhcyBhIGdpdCBicmFuY2ggc29tZXdoZXJlPw0K
PiANCj4gVGhhbmtzLA0KPiBUYW1hcw0KDQpIaSBUYW1hcywNCg0KSSd2ZSBwdXNoZWQgdGhlIGNo
YW5nZXMgdG8gDQpodHRwczovL2dpdGh1Yi5jb20vcGV0cmVwaXJjYWxhYnUveGVuL3RyZWUvdm1f
ZXZlbnRfbmcvZGV2ZWwNCg0KVGhhbmsteW91IHZlcnkgbXVjaCBmb3IgeW91ciBzdXBwb3J0LA0K
UGV0cmUNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
