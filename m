Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6925B808
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2019 11:29:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hhsaA-0007SW-L2; Mon, 01 Jul 2019 09:26:42 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dmzZ=U6=bitdefender.com=ppircalabu@srs-us1.protection.inumbo.net>)
 id 1hhsa8-0007SR-Mm
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2019 09:26:40 +0000
X-Inumbo-ID: 53b64262-9be2-11e9-8980-bc764e045a96
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe05::70a])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 53b64262-9be2-11e9-8980-bc764e045a96;
 Mon, 01 Jul 2019 09:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vhmUjpQvpFVClR4dIKqA74UgkZ47neqkQOGh4E+Ll/w=;
 b=SoU6A1FXt+Nc1v3jTfboQ3Jn4+1jp+OouuO/9TSvH9iJ3YIyYRjjgKQERFIY8mFaBeIoujmJK1I9NOdqS7EbzcilZY+1pAGqXmMwAr6EmIdQRD7dVN5aQdsaBGVkP0r0bL+YOuHZkDp+4xq4ecXKpvNvuWwLMCXBna2dGTPKrvA=
Received: from AM0PR02MB5572.eurprd02.prod.outlook.com (10.255.30.141) by
 AM0PR02MB5700.eurprd02.prod.outlook.com (10.255.31.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Mon, 1 Jul 2019 09:26:36 +0000
Received: from AM0PR02MB5572.eurprd02.prod.outlook.com
 ([fe80::ac50:53f9:ac1d:49fe]) by AM0PR02MB5572.eurprd02.prod.outlook.com
 ([fe80::ac50:53f9:ac1d:49fe%5]) with mapi id 15.20.2032.019; Mon, 1 Jul 2019
 09:26:36 +0000
From: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>
To: Paul Durrant <Paul.Durrant@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>
Thread-Topic: vfree crash
Thread-Index: AQHVLdtKR3tMnDvHzU6ntSjZrlUsUaa1cLWAgAAGYACAAAF2gIAACeQA
Date: Mon, 1 Jul 2019 09:26:36 +0000
Message-ID: <8b12e9a15bed0121a885a2004266350d007db31b.camel@bitdefender.com>
References: <19d3bbfa82ffe542367c676d83db65e37d013544.camel@bitdefender.com>
 <e277e40ad1c54b209a6f6107cbfaf5a0@AMSPEX02CL03.citrite.net>
 <527abac0d7a9a25bb69c7af30afa8ab209c90737.camel@bitdefender.com>
 <e131d31b93504843a72b72e22afb41ff@AMSPEX02CL03.citrite.net>
In-Reply-To: <e131d31b93504843a72b72e22afb41ff@AMSPEX02CL03.citrite.net>
Accept-Language: ro-RO, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR0P264CA0024.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::36)
 To AM0PR02MB5572.eurprd02.prod.outlook.com
 (2603:10a6:208:161::13)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ppircalabu@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5dbdf87e-10f7-4984-3712-08d6fe0636cf
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR02MB5700; 
x-ms-traffictypediagnostic: AM0PR02MB5700:|AM0PR02MB5700:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <AM0PR02MB57008A7B09E2E081A12D6DACD6F90@AM0PR02MB5700.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 00851CA28B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(39860400002)(376002)(396003)(346002)(366004)(189003)(199004)(13464003)(50226002)(305945005)(7736002)(229853002)(6116002)(3846002)(81156014)(81166006)(6436002)(8936002)(8676002)(6306002)(4326008)(6512007)(6486002)(110136005)(118296001)(966005)(54906003)(52116002)(316002)(2906002)(2501003)(71190400001)(68736007)(71200400001)(221733001)(76176011)(3480700005)(14454004)(478600001)(5660300002)(256004)(36756003)(66066001)(486006)(26005)(186003)(386003)(53546011)(102836004)(446003)(11346002)(476003)(6506007)(2616005)(99286004)(66476007)(66946007)(7116003)(107886003)(64756008)(66556008)(73956011)(25786009)(53936002)(66446008)(6246003)(86362001)(99106002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR02MB5700;
 H:AM0PR02MB5572.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jWJiOY0VbLlYpwJ+oxMRoVy/Ggduct6WRmAdk4GfphRELSoiPQ49v1KNNnRS5LQtclgaamn8mVRGLWPmpAuP8vPMvjopCRkXz5anrUIxVxYQ1yK/phivbgkBmpFUalku00HZRUME4gyoO75xa1eODYPHOSbS2X6u5Mw3jqmVotbjrKqyiU5vnfV/737zCvAnxp+upq3nAXKvW+vqnYVs+LOg6PP0LFQkeIYeUJKwbzqwE30VaShr0Oe5p+xK5N92KdMF0K88I+4/VBhLjeaQwSjQ5HSlN8NUyCplkzGEOpWDhbrARGf1iou9YAHyQMf3I23JZTMBLd2XedUGoEz/InqIIOHk0bjZDr4uXIjwr2e1BvlQ8zY//jyGGyhU/sCayDNrdm/YDbLUCrjpLP8n/R9IAFD4U7maNSxfr3C89p8=
Content-ID: <CE6AE67373DD5D44B06DEC9C38C17593@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dbdf87e-10f7-4984-3712-08d6fe0636cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2019 09:26:36.4970 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ppircalabu@bbu.bitdefender.biz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB5700
Subject: Re: [Xen-devel] vfree crash
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
Cc: Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAyMDE5LTA3LTAxIGF0IDA4OjU1ICswMDAwLCBQYXVsIER1cnJhbnQgd3JvdGU6DQo+
ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBQZXRyZSBPdmlkaXUgUElS
Q0FMQUJVIDxwcGlyY2FsYWJ1QGJpdGRlZmVuZGVyLmNvbT4NCj4gPiBTZW50OiAwMSBKdWx5IDIw
MTkgMDk6NDYNCj4gPiBUbzogUGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT47
IA0KPiA+IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgQW5kcmV3IENvb3Blcg0KPiA+
IDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29tPg0KPiA+IENjOiBBbGV4YW5kcnUgU3RlZmFuIElT
QUlMQSA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+OyANCj4gPiByY29qb2NhcnVAYml0ZGVmZW5k
ZXIuY29tDQo+ID4gU3ViamVjdDogUmU6IHZmcmVlIGNyYXNoDQo+ID4gDQo+ID4gT24gTW9uLCAy
MDE5LTA3LTAxIGF0IDA4OjI5ICswMDAwLCBQYXVsIER1cnJhbnQgd3JvdGU6DQo+ID4gPiA+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiA+IEZyb206IFhlbi1kZXZlbCA8eGVuLWRl
dmVsLWJvdW5jZXNAbGlzdHMueGVucHJvamVjdC5vcmc+IE9uDQo+ID4gPiA+IEJlaGFsZg0KPiA+
ID4gPiBPZiBQZXRyZSBPdmlkaXUgUElSQ0FMQUJVDQo+ID4gPiA+IFNlbnQ6IDI4IEp1bmUgMjAx
OSAxOTowMA0KPiA+ID4gPiBUbzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBBbmRy
ZXcgQ29vcGVyIDwNCj4gPiA+ID4gQW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT4NCj4gPiA+ID4g
Q2M6IEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIDxhaXNhaWxhQGJpdGRlZmVuZGVyLmNvbT47DQo+
ID4gPiA+IHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20NCj4gPiA+ID4gU3ViamVjdDogW1hlbi1k
ZXZlbF0gdmZyZWUgY3Jhc2gNCj4gPiA+ID4gDQo+ID4gPiA+IEhlbGxvLA0KPiA+ID4gPiANCj4g
PiA+ID4gSSBuZWVkIHlvdXIgaGVscCB0byBwaW5wb2ludCB0aGUgcm9vdCBjYXVzZSBvZiBhIHBy
b2JsZW0uIFRvIG15DQo+ID4gPiA+IHVuZGVyc3RhbmRpbmcgdmZyZWUgc2hvdWxkIGJlIHVzZWQg
d2hlbiBhbGxvY2F0aW5nIG1lbW9yeSB3aXRoDQo+ID4gPiA+IHZtYWxsb2MuDQo+ID4gPiA+IA0K
PiA+ID4gPiBCdXQsIEkgaGF2ZSB0aGUgZm9sbG93aW5nIHNjZW5hcmlvIHdoaWNoIHJlc3VsdHMg
aW4gYSBYRU4NCj4gPiA+ID4gY3Jhc2g6DQo+ID4gPiA+IC0gYWxsb2NhdGUgYSBudW1iZXIgb2Yg
ZnJhbWVzIHVzaW5nIHZtYWxsb2MgKHZ6YWxsb2MpIChlLmcuDQo+ID4gPiA+IHVzaW5nIGENCj4g
PiA+ID4gZG9tY3RsKSBhbmQgYXNzaWduIHRoZW0gdG8gdGhlIGNhbGxpbmcgZG9tYWluDQo+ID4g
PiA+IC0gbWFwIHRoZSBmcmFtZXMgdXNpbmcgeGVuZm9yZWlnbm1lbW9yeV9tYXBfcmVzb3VyY2UN
Cj4gPiA+IA0KPiA+ID4gRG8geW91IHJlYWxseSBtZWFuIHhlbmZvcmVpZ25tZW1vcnlfbWFwX3Jl
c291cmNlKCk/IElmIHRoZSBtZW1vcnkNCj4gPiA+IGlzDQo+ID4gPiBhc3NpZ25lZCB0byB0aGUg
Y2FsbGluZyBkb21haW4gdGhlbiB0aGlzIGlzIHF1aXRlIGxpa2VseSBub3QgdG8NCj4gPiA+IHdv
cmsuDQo+ID4gPiBUaGVyZSB3ZXJlIHJlZmVyZW5jZSBjb3VudGluZyBwcm9ibGVtcyB3aXRoIHRo
YXQgY29kZSwgd2hpY2ggaXMNCj4gPiA+IHdoeQ0KPiA+ID4gY2FsbGVyIGFzc2lnbmVkIHJlc291
cmNlcyB3ZXJlIGRyb3BwZWQuDQo+ID4gPiANCj4gPiA+ICAgUGF1bA0KPiA+ID4gDQo+ID4gDQo+
ID4gVGhlIHByb2JsZW0gbGllcyB3aXRoIHZmcmVlIGJlY2F1c2UgaXQgY3JlYXRlcyBhIG5ldyBs
aXN0IHdpdGggdGhlDQo+ID4gcGFnZXMsIHVubWFwcyB0aGUgdmEgcG9pbnRlciBhbmQgdGhlbiBm
cmVlcyB0aGUgcGFnZXMuIElmIEkgZG8NCj4gPiB0aGVzZQ0KPiA+IHN0ZXBzIG1hbnVhbGx5ICh3
aXRob3V0IGFkZGluZyB0aGVtIHRvIGEgbmV3IGxpc3QpIGl0IHdvcmtzLg0KPiANCj4gU28sIGxv
b2tpbmcgYXQgdGhlIGNvZGUsIEkgZG9uJ3QgdGhpbmsgaXQgaXMgaW50ZW5kZWQgdGhhdA0KPiB2
W218el1hbGxvY2VkIHBhZ2VzIGdldCBhc3NpZ25lZCB0byBhIGRvbWFpbi4gQ291bGQgeW91IHBv
aW50IGF0DQo+IHdoZXJlIHRoZSBhc3NpZ25tZW50IGlzIGhhcHBlbmluZz8NCj4gDQo+ICAgUGF1
bA0KPiANCj4gPiANCj4gPiBNYW55IHRoYW5rcywNCj4gPiBQZXRyZQ0KPiA+IA0KDQpJJ20gZG9p
bmcgaXQgbG9jYWxseSBpbiBteSB0ZXN0IChtb2NrX2VuYWJsZSBkb21jdGwpIGJ5IGNhbGxpbmcN
CmFzc2lnbl9wYWdlcyBmb3IgZWFjaCBvbmUgYWxsb2NhdGVkIGJ5IHZ6YWxsb2MuDQoNCmh0dHBz
Oi8vZ2l0bGFiLmNvbS94ZW4tcHJvamVjdC9wZW9wbGUvYml0ZGVmZW5kZXIveGVuL2Jsb2IvdmZy
ZWVfY3Jhc2gveGVuL2NvbW1vbi9tb2NrLmMNCihsaW5lIDU1KQ0KDQpNYW55IHRoYW5rcywNClBl
dHJlDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
