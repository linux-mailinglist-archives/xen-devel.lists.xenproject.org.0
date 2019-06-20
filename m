Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC074CCA2
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2019 13:08:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdusV-00019d-Tc; Thu, 20 Jun 2019 11:05:15 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IGdI=UT=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hdusU-00019Y-BQ
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2019 11:05:14 +0000
X-Inumbo-ID: 45d83ebd-934b-11e9-8980-bc764e045a96
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.87]) by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 45d83ebd-934b-11e9-8980-bc764e045a96;
 Thu, 20 Jun 2019 11:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=muaNiD+h5Gk1fuuUeULERjQIublWBmQSlJwGpZH6pdU=;
 b=CMoFUbMvJCtX+bYkX8Ej7t1qrmHzpV1INpKQFOVdMD+xua3+kO4CQoQAg6Q3ch81MUW9kH9CTkam/QpaDZvGXX2TOREsJAyJUXoco8L7oJ2JFPe729G4x0cwXStUwWWPK8NDhIlDC/NhpVHl90YIPybhH6gimSLXZiYeacDuvuXlZE4JPbIbvW6WauNnD104x91Xf6eg5+A+KfbGzM+rWowf0my/Ms1kW1aJVBLm2o9+2aHlZDuCPFjmD75hBlVzICssIB5PHVbhEy0AS3uBckGvGCc7O/uDWpHbdChJeTAzFRlhfNdIOMK7277zNlLtwQiOk9cPeP5p5VuJ+CxHBQ==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.176.214.210) by
 AM0PR03MB4994.eurprd03.prod.outlook.com (20.178.21.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.15; Thu, 20 Jun 2019 11:05:10 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::d09e:ef3:88b6:b1eb]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::d09e:ef3:88b6:b1eb%7]) with mapi id 15.20.1987.013; Thu, 20 Jun 2019
 11:05:10 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Thread-Topic: [PATCH] xen/arm: fix build after 2e35cdf
Thread-Index: AQHVJuVhv/qAHJGJ3kqi/x7jV6qIU6ajgWyAgAACGACAAN65AA==
Date: Thu, 20 Jun 2019 11:05:09 +0000
Message-ID: <87pnn87c0t.fsf@epam.com>
References: <alpine.DEB.2.21.1906191422170.2072@sstabellini-ThinkPad-T480s>
 <a29aa125-bb95-d178-0f74-0804d8ad6f91@arm.com>
 <alpine.DEB.2.21.1906191446280.2072@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.1906191446280.2072@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6aa5f213-2c8f-4168-21f1-08d6f56f2926
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR03MB4994; 
x-ms-traffictypediagnostic: AM0PR03MB4994:
x-microsoft-antispam-prvs: <AM0PR03MB49943AC5DF80CE1C7B4A2B6CE6E40@AM0PR03MB4994.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-forefront-prvs: 0074BBE012
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(366004)(346002)(39860400002)(396003)(136003)(199004)(189003)(102836004)(6436002)(66066001)(14454004)(72206003)(53936002)(36756003)(71190400001)(3846002)(71200400001)(6116002)(6246003)(478600001)(316002)(80792005)(54906003)(68736007)(25786009)(6512007)(6506007)(2906002)(91956017)(8676002)(99286004)(76176011)(81166006)(76116006)(81156014)(14444005)(256004)(53546011)(6916009)(66946007)(5660300002)(66476007)(4326008)(73956011)(486006)(8936002)(66446008)(66556008)(64756008)(305945005)(86362001)(26005)(7736002)(6486002)(446003)(229853002)(186003)(11346002)(476003)(2616005)(55236004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB4994;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: IUi6jQXbzieoLthkbQyx0dzpgeybdVIYDmHF5VUKgqscY/xe0uKC8bTWbxoEvdSTzZz8XU1Pf1HH6Tdf77cO3PIjqUnb+JQWbwhyTjpmJqi9t3EEYllGGdt75TSkaSYopd/FqZUzbr3KONKyO9EoA5tQSJVzfum372se+G3qfVSXTBp7ZoChxAldXGgVCglCcdlzjhLLmMEzobQfdGWZec/42s0pIs0SmlAIUwWBFFCls/+xdZAFp6tQ/a2tnNrpqUFGrxOtdZ8/8KZvv/MMfS+tmjpANlSzaSXttnKDNO/njVQLfqIa5lWcqgcD/IeRuSeqlx5GO7dhqUe0rnj2WaZGRqUd345BZVQ9MqltY3vCJWu7CGkgeu1VRTq5FWyiCIk9FVEdAKdZL0rfoL+cQNG7P5jrwZ6aWfLI6ToTGp8=
Content-ID: <6D36565C3A386A43A6A0ED53D747D6F8@eurprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aa5f213-2c8f-4168-21f1-08d6f56f2926
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2019 11:05:09.9214 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Volodymyr_Babchuk@epam.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4994
Subject: Re: [Xen-devel] [PATCH] xen/arm: fix build after 2e35cdf
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
 Julien Grall <julien.grall@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQpIaSBTdGVmYW5vLCBKdWxpZW4sDQoNClN0ZWZhbm8gU3RhYmVsbGluaSB3cml0ZXM6DQoNCj4g
T24gV2VkLCAxOSBKdW4gMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4gSGkgU3RlZmFubywN
Cj4+DQo+PiBUaXRsZTogWW91IHNob3VsZCBhdCBsZWFzdCBtZW50aW9uIHRoaXMgaXMgZm9yIG9w
LXRlZS4NCj4+DQo+PiBBbHNvLCBtb3N0bHkgbGlrZWx5IHRoZSBzaGExIGlzIHRvbyBzbWFsbCBh
bmQgbGlrZWx5IHRvIG1hdGNoIG11bHRpcGxlIGNvbW1pdA0KPj4gaW4gdGhlIGZ1dHVyZS4gU28g
eW91IHdhbnQgdG8gc3BlY2lmeSB0aGUgdGl0bGUgb2YgdGhlIGNvbW1pdC4NCj4+DQo+PiBPbiA2
LzE5LzE5IDEwOjI0IFBNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+PiA+IE9wdGVlIGJy
ZWFrcyB0aGUgYnVpbGQgd2l0aDoNCj4+ID4NCj4+ID4gb3B0ZWUuYzogSW4gZnVuY3Rpb24g4oCY
dHJhbnNsYXRlX25vbmNvbnRpZy5pc3JhLjTigJk6DQo+PiA+IG9wdGVlLmM6NzQzOjM4OiBlcnJv
cjog4oCYeGVuX2RhdGHigJkgbWF5IGJlIHVzZWQgdW5pbml0aWFsaXplZCBpbiB0aGlzIGZ1bmN0
aW9uDQo+PiA+IFstV2Vycm9yPW1heWJlLXVuaW5pdGlhbGl6ZWRdDQo+PiA+ICAgICAgICAgICAg
ICAgeGVuX2RhdGEtPm5leHRfcGFnZV9kYXRhID0gcGFnZV90b19tYWRkcih4ZW5fcGdzICsgMSk7
DQo+PiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4NCj4+ID4gb3B0
ZWUuYzo3MzI6NzE6IGVycm9yOiDigJhndWVzdF9kYXRh4oCZIG1heSBiZSB1c2VkIHVuaW5pdGlh
bGl6ZWQgaW4gdGhpcw0KPj4gPiBmdW5jdGlvbiBbLVdlcnJvcj1tYXliZS11bmluaXRpYWxpemVk
XQ0KPj4gPiAgICAgICAgICAgcGFnZSA9DQo+PiA+IGdldF9kb21haW5fcmFtX3BhZ2UoZ2FkZHJf
dG9fZ2ZuKGd1ZXN0X2RhdGEtPnBhZ2VzX2xpc3RbaWR4XSkpOw0KPj4gPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBeDQo+PiA+IG9wdGVlLmM6NzUwOjIxOiBlcnJvcjog4oCYZ3Vlc3RfcGfigJkgbWF5IGJlIHVz
ZWQgdW5pbml0aWFsaXplZCBpbiB0aGlzIGZ1bmN0aW9uDQo+PiA+IFstV2Vycm9yPW1heWJlLXVu
aW5pdGlhbGl6ZWRdDQo+PiA+ICAgICAgICAgICAgICAgcHV0X3BhZ2UoZ3Vlc3RfcGcpOw0KPj4g
PiAgICAgICAgICAgICAgICAgICAgICAgXg0KPj4gPiBjYzE6IGFsbCB3YXJuaW5ncyBiZWluZyB0
cmVhdGVkIGFzIGVycm9ycw0KPj4gPg0KPj4gPiBGaXggaXQgYnkgaW5pdGlhbGl6aW5nIHhlbl9k
YXRhLCBndWVzdF9kYXRhLCBndWVzdF9wZyB0byBOVUxMLiBBbHNvIHNldA0KPj4gPiB4ZW5fcGdz
IHRvIE5VTEwgZm9yIGNvbnNpc3RlbmN5Lg0KPj4NCj4+IFdpdGhvdXQgbW9yZSBleHBsYW5hdGlv
biBJIHRoaW5rIHRoaXMgaXMgYW4gdW53aXNlIGNob2ljZS4gSWYgR0NDIHRoaW5rcyBpdCBpcw0K
Pj4gZ29pbmcgdG8gYmUgdXNlZCB1bml0aWFsaXplZCwgdGhlbiBtb3N0bHkgbGlrZWx5IHlvdSBz
aWxlbnQgYW4gZXJyb3IgdGhhdA0KPj4gY291bGQgZW5kIHVwIHRvIGRlcmVmZXJlbmNlIE5VTEwu
DQoNClRoZXJlIGlzIG5vIHdheSB0byB1c2UgdGhpcyB2YXJpYWJsZXMgd2l0aG91dCBpbml0aWFs
aXphdGlvbi4gVGhleSBhcmUNCmFsd2F5cyBpbml0aWFsaXplZCBvbiB0aGUgZmlyc3QgaXRlcmF0
aW9uIG9mIHRoZSBsb29wLCB3aGVuIGlkeCBlcXVhbHMNCnRvIDAuIE5ld2VyIHZlcnNpb24gb2Yg
R0NDIGNhbiBpbmZlciB0aGlzLCBidXQgbG9vayBsaWtlIHRoaXMgY2F1c2VzDQpwcm9ibGVtIGZv
ciBvbGRlciB2ZXJzaW9ucy4NCg0KPj4gQWxzbywgc2V0dGluZyB4ZW5fcGdzIGZvciBjb25zaXN0
ZW5jeSB3aWxsIG9ubHkgZGVmZWF0IHRoZSBjb21waWxlci4gTGVhZGluZw0KPj4gdG8gZGVyZWZl
cmVuY2luZyBOVUxMIGFuZCBjcmFzaCBYZW4uLi4NCj4+DQo+PiBGb3IgeGVuX3BncywgdGhpcyBz
aG91bGQgZGVmaW5pdGVseSBub3QgYmUgTlVMTC4gRm9yIHRoZSB0d28gb3RoZXJzLCB5b3UgbmVl
ZA0KPj4gdG8gZXhwbGFpbiB3aHkgdGhpcyBpcyBmaW5lIChpZiB0aGlzIGlzIGp1c3QgYmVjYXVz
ZSB0aGUgY29tcGlsZXIgY2FuJ3QgZmluZA0KPj4gdGhlIHJlYXNvbiwgdGhlbiB5b3Ugc2hvdWxk
IGFkZCBhIGNvbW1lbnQgaW4gdGhlIGNvZGUgdG8gZXhwbGFpbiBpdCkuDQo+DQo+IEkgd2FzIG9u
bHkgdHJ5aW5nIHRvIHVuYmxvY2sgdGhlIGJ1aWxkLiBJJ2xsIHdpdGhkcmF3IHRoZSBwYXRjaCBh
bmQgbGV0DQo+IFZvbG9kbWlyIGZpeCBpdCBwcm9wZXJseS4NCkFjdHVhbGx5LCB5b3VyIHBhdGNo
IGlzIGZpbmUsIHRha2luZyBpbnRvIGFjY291bnQgSnVsaWVuJ3MgY29tbWVudCBhYm91dA0KeGVu
X3BncyBhbmQganVzdGlmaWNhdGlvbiBpbiB0aGUgY29tbWVudHMuDQpTbywgeW91IGNhbiBzZW5k
IGZpeGVkIHZlcnNpb24gb3IgSSBjYW4gZG8gdGhpcywgaWYgeW91IGRvbid0IHdhbnQgdG8uDQoN
Cj4NCj4gVm9sb2RtaXIsIEZZSSBJIHJlcHJvZHVjZWQgdGhlIGlzc3VlIHVzaW5nIFVidW50dSBU
cnVzdHkgZ2NjDQo+IDQuOC40LTJ1YnVudHUxfjE0LjA0LjMuDQpPaCwgSSBzZWUuIFRoaXMgaXMg
dGhlIHF1aXRlIG9sZCB2ZXJzaW9uIG9mIEdDQy4gSSdtIHVzaW5nDQphYXJjaDY0LXBva3ktbGlu
dXgtZ2NjIChMaW5hcm8gR0NDIDUuMi0yMDE1LjExLTIpIDUuMi4xIDIwMTUxMDA1DQp3aGljaCBp
cyBhbHNvIG9sZCwgYnV0IGF0IGxlYXN0IGl0IHRyYWNrcyB2YXJpYWJsZXMgaW5pdGlhbGl6YXRp
b24NCmJldHRlci4NCg0KLS0NCkJlc3QgcmVnYXJkcyxWb2xvZHlteXIgQmFiY2h1awpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
