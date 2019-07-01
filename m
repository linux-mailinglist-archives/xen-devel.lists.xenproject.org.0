Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48AF95B729
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2019 10:49:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hhrwq-0004D1-NM; Mon, 01 Jul 2019 08:46:04 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dmzZ=U6=bitdefender.com=ppircalabu@srs-us1.protection.inumbo.net>)
 id 1hhrwo-0004Cw-Bf
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2019 08:46:02 +0000
X-Inumbo-ID: a69c3a38-9bdc-11e9-8980-bc764e045a96
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.110]) by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a69c3a38-9bdc-11e9-8980-bc764e045a96;
 Mon, 01 Jul 2019 08:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4C477sGWR9mntzzwvCavo1H9pCa8QnEQmTtCRQmcvqs=;
 b=sd5P28dkuyxZ9wbWQKe8Wnektm0+kq87O+8/1Fevhfok4wNBuQNW6R8DQwfhE+xASkYEvFzFV1mE7SRI+nvIQqDbQJYVPrckmJ1g7PRQ6s1Pk1UMmuQSGtYZEkM6lZNfl3cYdJlgAs762zXGF5u6SIfnCo3k+WIHLRZ3ZrEdBgs=
Received: from AM0PR02MB5572.eurprd02.prod.outlook.com (10.255.30.141) by
 AM0PR02MB5188.eurprd02.prod.outlook.com (20.178.23.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.18; Mon, 1 Jul 2019 08:45:59 +0000
Received: from AM0PR02MB5572.eurprd02.prod.outlook.com
 ([fe80::ac50:53f9:ac1d:49fe]) by AM0PR02MB5572.eurprd02.prod.outlook.com
 ([fe80::ac50:53f9:ac1d:49fe%5]) with mapi id 15.20.2032.019; Mon, 1 Jul 2019
 08:45:58 +0000
From: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>
To: Paul Durrant <Paul.Durrant@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>
Thread-Topic: vfree crash
Thread-Index: AQHVLdtKR3tMnDvHzU6ntSjZrlUsUaa1cLWAgAAGYAA=
Date: Mon, 1 Jul 2019 08:45:58 +0000
Message-ID: <527abac0d7a9a25bb69c7af30afa8ab209c90737.camel@bitdefender.com>
References: <19d3bbfa82ffe542367c676d83db65e37d013544.camel@bitdefender.com>
 <e277e40ad1c54b209a6f6107cbfaf5a0@AMSPEX02CL03.citrite.net>
In-Reply-To: <e277e40ad1c54b209a6f6107cbfaf5a0@AMSPEX02CL03.citrite.net>
Accept-Language: ro-RO, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR0P264CA0202.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1f::22) To AM0PR02MB5572.eurprd02.prod.outlook.com
 (2603:10a6:208:161::13)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ppircalabu@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6871cd46-33a0-46f1-3e82-08d6fe0089e1
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR02MB5188; 
x-ms-traffictypediagnostic: AM0PR02MB5188:|AM0PR02MB5188:
x-microsoft-antispam-prvs: <AM0PR02MB5188090785C7B05488C0F107D6F90@AM0PR02MB5188.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 00851CA28B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(396003)(346002)(136003)(39860400002)(376002)(13464003)(189003)(199004)(186003)(305945005)(8936002)(2906002)(52116002)(50226002)(68736007)(6246003)(11346002)(64756008)(2616005)(478600001)(8676002)(81166006)(6116002)(6486002)(86362001)(5660300002)(6512007)(25786009)(6436002)(3846002)(76176011)(7116003)(102836004)(53546011)(6506007)(256004)(71200400001)(71190400001)(221733001)(81156014)(316002)(229853002)(476003)(99286004)(73956011)(53936002)(66066001)(486006)(386003)(14454004)(107886003)(54906003)(66476007)(2501003)(66446008)(7736002)(26005)(66946007)(110136005)(446003)(66556008)(118296001)(4326008)(3480700005)(36756003)(99106002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR02MB5188;
 H:AM0PR02MB5572.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2pOJfgpfOFP6G3S0xUKtJlaeO+bj4TACEMlobCHY9/kax9o7ncbikpcppeFtOTt0QL+K1cyyC2rwMvdwgNXBT2ad9ICI1RkriGAIML6XfaslW/frsFJotF95nRSGLxpCLt7E5GgJleYK5M2/Q0sLS/ws8dOTMRN7iozGTK9RWns0VEMQHvxuIJwPPE8kXiSKRHutqiU+bn2OunGIjQV+uJ/abFtBlwi9dvUOQLrTW3uI16u7zvTSyLSJRjDhQnVUas4a1eMrxqtDlnIu6gILSLyRncwFx8MWc9wuY4th6QTYCJAlZyxBtwN4E0Dfwn8J0zA5gkMk5S/6t6y8PuTe102c+xzo8dFyKFn1ADScY2Co1/pA5lvx4YWelEVBTcfwEeARCGE/fF99ie3BTfhWkXQyb+zjGKe2reJF+tFQ290=
Content-ID: <5796BB9635E4434783635A1BDD5FF2D1@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6871cd46-33a0-46f1-3e82-08d6fe0089e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2019 08:45:58.8417 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ppircalabu@bbu.bitdefender.biz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB5188
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

T24gTW9uLCAyMDE5LTA3LTAxIGF0IDA4OjI5ICswMDAwLCBQYXVsIER1cnJhbnQgd3JvdGU6DQo+
ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1k
ZXZlbC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYNCj4gPiBPZiBQZXRy
ZSBPdmlkaXUgUElSQ0FMQUJVDQo+ID4gU2VudDogMjggSnVuZSAyMDE5IDE5OjAwDQo+ID4gVG86
IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgQW5kcmV3IENvb3BlciA8DQo+ID4gQW5k
cmV3LkNvb3BlcjNAY2l0cml4LmNvbT4NCj4gPiBDYzogQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEg
PGFpc2FpbGFAYml0ZGVmZW5kZXIuY29tPjsgDQo+ID4gcmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNv
bQ0KPiA+IFN1YmplY3Q6IFtYZW4tZGV2ZWxdIHZmcmVlIGNyYXNoDQo+ID4gDQo+ID4gSGVsbG8s
DQo+ID4gDQo+ID4gSSBuZWVkIHlvdXIgaGVscCB0byBwaW5wb2ludCB0aGUgcm9vdCBjYXVzZSBv
ZiBhIHByb2JsZW0uIFRvIG15DQo+ID4gdW5kZXJzdGFuZGluZyB2ZnJlZSBzaG91bGQgYmUgdXNl
ZCB3aGVuIGFsbG9jYXRpbmcgbWVtb3J5IHdpdGgNCj4gPiB2bWFsbG9jLg0KPiA+IA0KPiA+IEJ1
dCwgSSBoYXZlIHRoZSBmb2xsb3dpbmcgc2NlbmFyaW8gd2hpY2ggcmVzdWx0cyBpbiBhIFhFTiBj
cmFzaDoNCj4gPiAtIGFsbG9jYXRlIGEgbnVtYmVyIG9mIGZyYW1lcyB1c2luZyB2bWFsbG9jICh2
emFsbG9jKSAoZS5nLiB1c2luZyBhDQo+ID4gZG9tY3RsKSBhbmQgYXNzaWduIHRoZW0gdG8gdGhl
IGNhbGxpbmcgZG9tYWluDQo+ID4gLSBtYXAgdGhlIGZyYW1lcyB1c2luZyB4ZW5mb3JlaWdubWVt
b3J5X21hcF9yZXNvdXJjZQ0KPiANCj4gRG8geW91IHJlYWxseSBtZWFuIHhlbmZvcmVpZ25tZW1v
cnlfbWFwX3Jlc291cmNlKCk/IElmIHRoZSBtZW1vcnkgaXMNCj4gYXNzaWduZWQgdG8gdGhlIGNh
bGxpbmcgZG9tYWluIHRoZW4gdGhpcyBpcyBxdWl0ZSBsaWtlbHkgbm90IHRvIHdvcmsuDQo+IFRo
ZXJlIHdlcmUgcmVmZXJlbmNlIGNvdW50aW5nIHByb2JsZW1zIHdpdGggdGhhdCBjb2RlLCB3aGlj
aCBpcyB3aHkNCj4gY2FsbGVyIGFzc2lnbmVkIHJlc291cmNlcyB3ZXJlIGRyb3BwZWQuDQo+IA0K
PiAgIFBhdWwNCj4gDQoNClRoZSBwcm9ibGVtIGxpZXMgd2l0aCB2ZnJlZSBiZWNhdXNlIGl0IGNy
ZWF0ZXMgYSBuZXcgbGlzdCB3aXRoIHRoZQ0KcGFnZXMsIHVubWFwcyB0aGUgdmEgcG9pbnRlciBh
bmQgdGhlbiBmcmVlcyB0aGUgcGFnZXMuIElmIEkgZG8gdGhlc2UNCnN0ZXBzIG1hbnVhbGx5ICh3
aXRob3V0IGFkZGluZyB0aGVtIHRvIGEgbmV3IGxpc3QpIGl0IHdvcmtzLg0KDQpNYW55IHRoYW5r
cywNClBldHJlDQoNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
