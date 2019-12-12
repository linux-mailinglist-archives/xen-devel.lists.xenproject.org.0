Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E3B11CDA6
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2019 13:57:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifNzr-0001en-Bq; Thu, 12 Dec 2019 12:55:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Tbca=2C=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1ifNzp-0001ei-Cr
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2019 12:55:09 +0000
X-Inumbo-ID: 9a0c04dc-1cde-11ea-88e7-bc764e2007e4
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.5.106]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9a0c04dc-1cde-11ea-88e7-bc764e2007e4;
 Thu, 12 Dec 2019 12:55:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mH9slb2g95KY6rowxqJaFH6Zv9kdCbrXwbsJ92QBvQ8dCMBlfE9Az+/rdlOkcys8yhzliX3d3B423m29MhxGX9b09ebwHa26/KmaKSo0+4IRV2Qsz1wESS3OqJqIQcGFWv0Mi+SpuQXvIRpKV7zCJBcvGfEhMOKhtEjHVh21U0MLw2E61iMpKo4zljjy18lXN6pTnAEy238Lzl2VFW4dpK5eJjuNhgA8LXYuJ6uOBxpdiiPAWecaaaMI2sCt0Q9NxAtGCM6FDy9oKqxP+3CedeTwlqkNpqpj/VYtwoea3S8qULnP5+b6pyEwTtsXXoevJfg1xLvUQxZLA6/xVbecwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GYZsW06gVQdY4H/r/D8kgr5mhGeuHVbvIys9C8GfTrk=;
 b=QYF8QZ75355WmUQ6MUUntcNOwIHlczNKUEcsqYmzfx2ZdNyMrDinTWl6DEAHs2WWAzaWprHTgJUSPcs233wLEUGDQjRXGPVNNVP/P8PH1k7UD0c+fOI4nnbrRgH37kxHHKBQBRrVn4+goBxK/2vFAxJqonm5hmA4qqW9t0PypuMms/Cz3M56O5prdyWY+DOXNUZbEg4OdOxFuB95m46fJ4ARbWxiWUGcXzZGr0HyhHW/lPoUoW/8T09w7fo4bgVtOJ173STWDXpZYjaZmybCM3kZoePBaoKYKz5dIh+928teEn8YFuJr3qaVMpUxekNQxIBVo7TVESMSQCuAhU9iow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GYZsW06gVQdY4H/r/D8kgr5mhGeuHVbvIys9C8GfTrk=;
 b=FXR52XvJfXfnbDZr56bnKBJkGefaflva6sMCns1Yd+eqsULVbg1mFCtKpLMlQlwF1M+72xxjDJgrMaDJMLsiQJ6Guw/+JthSRWBDtzxY7SVR7T4VWiITkliSBYSkwcgiAF8FJWCtnZNh9xYnFqAcJpffd3qXGKt+Uy18QxjtGZU=
Received: from AM0PR02MB5553.eurprd02.prod.outlook.com (10.255.30.78) by
 AM0PR02MB3732.eurprd02.prod.outlook.com (52.134.86.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.13; Thu, 12 Dec 2019 12:54:56 +0000
Received: from AM0PR02MB5553.eurprd02.prod.outlook.com
 ([fe80::8cec:7638:734c:89d]) by AM0PR02MB5553.eurprd02.prod.outlook.com
 ([fe80::8cec:7638:734c:89d%4]) with mapi id 15.20.2516.020; Thu, 12 Dec 2019
 12:54:55 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: George Dunlap <george.dunlap@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH V3 1/2] x86/altp2m: Add hypercall to set a range of sve
 bits
Thread-Index: AQHVoHyqPG/1qImaik2u7wxoJD4v56etUuGAgAktJQD///zrAIAAGMeA
Date: Thu, 12 Dec 2019 12:54:55 +0000
Message-ID: <e1acc05c-da56-f896-eaef-c282f94ac312@bitdefender.com>
References: <20191121150124.15865-1-aisaila@bitdefender.com>
 <09ce09b7-78ae-03bd-1600-2d25ccbff85d@citrix.com>
 <5816f5cc-2206-11f8-78e4-6b2310257720@bitdefender.com>
 <2d51e2c0-c349-3658-bb9c-dc38470ff275@citrix.com>
In-Reply-To: <2d51e2c0-c349-3658-bb9c-dc38470ff275@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: ZR0P278CA0052.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::21) To AM0PR02MB5553.eurprd02.prod.outlook.com
 (2603:10a6:208:160::14)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3da5c1cf-edda-46fa-f437-08d77f027c8e
x-ms-traffictypediagnostic: AM0PR02MB3732:|AM0PR02MB3732:|AM0PR02MB3732:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR02MB3732C3631F26AD18FE2AD818AB550@AM0PR02MB3732.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 0249EFCB0B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(366004)(396003)(39860400002)(136003)(376002)(199004)(189003)(64756008)(107886003)(52116002)(66476007)(66446008)(66556008)(31696002)(66946007)(6506007)(5660300002)(6512007)(36756003)(31686004)(4326008)(478600001)(86362001)(53546011)(6486002)(26005)(186003)(8936002)(71200400001)(2906002)(81166006)(316002)(2616005)(54906003)(81156014)(8676002)(7416002)(110136005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR02MB3732;
 H:AM0PR02MB5553.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: y5D9E7nDPhAEVodQ7wyKGVuPmmuepsOcRb5zpf6BQTo/R+WPeHj7XhXxvDoTQxmqWcIj0R7RiqTqy99GrW9c0JKsASVamx4Cp7Zsa6OaZ1jiTt06mTUSVeOWBgA8XQfHbgBEq6sxu7x+US+t6ZX0eq+VoLsx6Kd+VSuKPXFWcYIwVUWiEljX+Xwpj/wOXyztMV94r07+Ps/2oi69LqqZWHzpRPsAuPnsnFW0Lki7OH+YTUkANYPZRy4/LLpPGzY/s2pFg5j59SUWhnBNbpk5JWJnJEJEMfMSXbpTA5svwnjYqe1u1klNVHwASBPC9LIQsdtlzFJ9cNYEIcOboEB0ZFXXUEr6DlltRskUDsf4IrCOLz849Punu5S+fA4IWRSNXgVfkcbz784S3xCChNtpTh35MozQxb7UjCYxwizxjV1LbSOhyMM7UWj1yvQuTmgz
Content-ID: <2D32ED5FB9751848911C44449F69D8CB@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3da5c1cf-edda-46fa-f437-08d77f027c8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2019 12:54:55.4319 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wdQaVv4yLya9Tmy12l3QxGPse23BIp9ocNFnvJVE6CLtkC9ovcfasU8x3GCaBQ3LDqKslhXTIsC19tXaKZ8G/Ux06b5aWmBm9zeZAZ+oKag=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB3732
Subject: Re: [Xen-devel] [PATCH V3 1/2] x86/altp2m: Add hypercall to set a
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
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Razvan COJOCARU <rcojocaru@bitdefender.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDEyLjEyLjIwMTkgMTM6MjYsIEdlb3JnZSBEdW5sYXAgd3JvdGU6DQo+IE9uIDEyLzEy
LzE5IDk6MzcgQU0sIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIHdyb3RlOg0KPj4NCj4+DQo+PiBP
biAwNi4xMi4yMDE5IDE3OjI5LCBHZW9yZ2UgRHVubGFwIHdyb3RlOg0KPj4+IE9uIDExLzIxLzE5
IDM6MDIgUE0sIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIHdyb3RlOg0KPj4+PiBCeSBkZWZhdWx0
IHRoZSBzdmUgYml0cyBhcmUgbm90IHNldC4NCj4+Pj4gVGhpcyBwYXRjaCBhZGRzIGEgbmV3IGh5
cGVyY2FsbCwgeGNfYWx0cDJtX3NldF9zdXByZXNzX3ZlX211bHRpKCksDQo+Pj4+IHRvIHNldCBh
IHJhbmdlIG9mIHN2ZSBiaXRzLg0KPj4+PiBUaGUgY29yZSBmdW5jdGlvbiwgcDJtX3NldF9zdXBw
cmVzc192ZV9tdWx0aSgpLCBkb2VzIG5vdCBicmFrZSBpbiBjYXNlDQo+Pj4+IG9mIGEgZXJyb3Ig
YW5kIGl0IGlzIGRvaW5nIGEgYmVzdCBlZmZvcnQgZm9yIHNldHRpbmcgdGhlIGJpdHMgaW4gdGhl
DQo+Pj4+IGdpdmVuIHJhbmdlLiBBIGNoZWNrIGZvciBjb250aW51YXRpb24gaXMgbWFkZSBpbiBv
cmRlciB0byBoYXZlDQo+Pj4+IHByZWVtcHRpb24gb24gYmlnIHJhbmdlcy4NCj4+Pj4NCj4+Pj4g
U2lnbmVkLW9mZi1ieTogQWxleGFuZHJ1IElzYWlsYSA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+
DQo+Pj4NCj4+PiBUaGVyZSdzIHNvbWV0aGluZyBzdHJhbmdlbHkgZGVmb3JtZWQgaW4geW91ciBt
YWlsIHRoYXQgbWFrZXMgaXQgaGFyZCBmb3INCj4+PiBtZSB0byBhcHBseSB0aGUgcGF0Y2hlcyB0
byBteSB0cmVlLCBhbmQgSSdtIG5vdCBzdXJlIHdoeS4NCj4+Pg0KPj4+IEl0IHNlZW1zIHRoZSBj
b3JlIG1haWwgaXMgYmFzZTY0LWVuY3J5cHRlZDsgYW5kIHRoYXQgKmluc2lkZSogdGhhdA0KPj4+
IGJhc2U2NCBlbmNyeXB0aW9uIGlzIGEgYnVuY2ggb2YgV2luZG93cy1zdHlsZSBsaW5lZmVlZHMu
ICBUaGUgcmVzdWx0IGlzDQo+Pj4gdGhhdCB3aGVuIEkgdHJ5IHRvIGRvd25sb2FkIHlvdXIgc2Vy
aWVzIGFuZCBhcHBseSBpdCB3aXRoIGdpdC1hbSwgSSBnZXQNCj4+PiBsb2FkcyBvZiByZWplY3Rl
ZCBodW5rcyB3aXRoICJeTSIgYXQgdGhlIGVuZCBvZiB0aGVtLg0KPj4+DQo+Pj4gU29tZXRpbWVz
IEkndmUgYmVlbiBhYmxlIHRvIHdvcmsgYXJvdW5kIHRoaXMgYnkgZ29pbmcgb24gcGF0Y2hldy5v
cmcvWGVuDQo+Pj4gYW5kIGdldHRpbmcgYW4gbWJveCBmcm9tIHRoZXJlOyBidXQgaXQgZG9lc24n
dCBzZWVtIHRvIGhhdmUgeW91ciBzZXJpZXMNCj4+PiAocGVyaGFwcyBiZWNhdXNlIGl0IGRvZXNu
J3QgaGF2ZSBhIGNvdmVyIGxldHRlcikuDQo+Pj4NCj4+PiBMb29raW5nIGF0IHRoZSBoZWFkZXJz
LCBpdCBzZWVtcyB0aGlzIGlzIGNvbWluZyBmcm9tIGdpdCBpdHNlbGYuICBEbyB5b3UNCj4+PiBw
ZXJoYXBzIGhhdmUgInRyYW5zZmVyRW5jb2RpbmciIHNldCB0byAiYmFzZTY0Ij8gIElmIHNvLCBj
aGFuY2UgeW91DQo+Pj4gY291bGQgdHJ5IHNldHRpbmcgaXQgdG8gJ2F1dG8nLCBhbmQgc2V0dGlu
ZyAnYXNzdW1lOGJpdEVuY29kaW5nID0gdHJ1ZSI/DQo+Pg0KPj4gSSBkaWRuJ3QgaGF2ZSBhbnl0
aGluZyBzZXQgZm9yIHRyYW5zZmVyRW5jb2RpbmcgaW4gLmdpdGNvbmZpZyBidXQgSSBjYW4gc2V0
DQo+PiAgICAgICAgICAgYXNzdW1lOGJpdEVuY29kaW5nID0geWVzDQo+PiAgICAgICAgICAgdHJh
bnNmZXJFbmNvZGluZyA9IDhiaXQNCj4+DQo+PiBmb3IgdGhlIGZ1dHVyZS4NCj4+DQo+PiBTb3Jy
eSBmb3IgdGhlIGluY29udmVuaWVuY2UuDQo+IA0KPiBXZWxsLCBJJ20gYWxzbyBzb3JyeSB0aGF0
IEknbSBoYXZpbmcgdHJvdWJsZSBvbiBteSBlbmQuICA6LSkgIFlvdSdkDQo+IHRoaW5rIHRoYXQg
eW91IGRvaW5nICJnaXQgc2VuZC1lbWFpbCIgYW5kIG1lIGRvaW5nICJnaXQgYW0iIHdvdWxkIEp1
c3QNCj4gV29yayh0bSksIGFuZCBpdCdzIGZydXN0cmF0aW5nIHRoYXQgaXQgZG9lc24ndC4gICpI
b3BlZnVsbHkqIHRob3NlDQo+IGNoYW5nZXMgd2lsbCBtYWtlIGl0IHdvcms7IG90aGVyd2lzZSB3
ZSdsbCBoYXZlIHRvIGZpZ3VyZSBvdXQgc29tZXRoaW5nDQo+IGVsc2UuDQo+IA0KDQpXZSBoYXZl
IHRvIHNvbHZlIHRoaXMgc29tZWhvdyBzbyBvbiB0aGUgbmV4dCB2ZXIuIHBsZWFzZSBsZXQgbWUg
a25vdyBpZiANCmV2ZXJ5dGhpbmcgaXMgb2suDQoNCkFsZXgNCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
