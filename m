Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 742211EDAEF
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 03:57:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgf8I-00027R-Np; Thu, 04 Jun 2020 01:57:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kLFO=7R=nxp.com=peng.fan@srs-us1.protection.inumbo.net>)
 id 1jgf8G-00027M-6s
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2020 01:57:24 +0000
X-Inumbo-ID: b9ef87b8-a606-11ea-9dbe-bc764e2007e4
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.87]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b9ef87b8-a606-11ea-9dbe-bc764e2007e4;
 Thu, 04 Jun 2020 01:57:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OSf8+PWJgvAqr2BbxFWYQ6dV1fskRIAlKyr+poUVF3DCXPb0xBQ/95F0sMpkbn5MAECumD7cZGoCOxJsoke9ABqB64YIfrSYpeBiL3V/KpNYjed4nfQua9IzeF54szhaqXIm3Pu6xBISaB/loRToTXb8ve6H9GXXkF3bksqVCL9WHaUk9bJvpj5eRaAONyg2h0tz4+5Z7dkWs7vcY6he/XO1XXwjZQHJLootroWqyvbAN9fHS6f7ebVsYT1pTgy6bv0wK/3HXsArlG6nV97NULVUBYtt4nXCgo5Z6jVoOlqo+0CZvjDliyxT2aeGRWb//rZK/URytXCiydf2AiVcVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vT6nonjitpnfq1bzXR3wNoE8C3LpPoO7EwxMSIFAtr8=;
 b=dSCntGv1JmWr5Z3NRUaMSJAUF2YECyGIToNcsRhfuChF2lVAZvkogCG1Svzogm0CoJuvgt62pi8V72/sJhOm3d7zFqpNMdaRkBM6SxqKoiZzIpfSqF1DUIZc+Pz9sspdfkVWVYSdofBPjHLoXF8pP7rjwfPOfV1f7LuRxs7gI6XvVY2G6ngkQMq1uqxn9YBNdyn/3wXC4zrdXxiBC/UcYMhFUJCkJYKTqMPHVE9Ta4xPTD0bVsIckWzMWwVtGpSXBWFeYL55Yxcqqz8R/sD4iFdIpDsOWgy3Y517ghmoFkEJfmBkmaWeGRaP/NFxPCbBFtlcEI2++w0l8L5lmjy13g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vT6nonjitpnfq1bzXR3wNoE8C3LpPoO7EwxMSIFAtr8=;
 b=szhNizpZoX1nNT4MJz0JruHq0laPFpsGeRQh6d8faGV1dCr76Xxi9pymg+WtNtLFOuafYc1+3dWlVkxtqBp5pik0cz/nTsWCL+SaGq2VpW3iHCKjxwsVaiuq/iChfd/tHUQIUL+RigR/IYI12a5kXzgw0LCuJ/xrCUP7FtnagBU=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR0402MB2695.eurprd04.prod.outlook.com (2603:10a6:4:95::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Thu, 4 Jun
 2020 01:57:19 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d17b:d767:19c3:b871]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d17b:d767:19c3:b871%6]) with mapi id 15.20.3066.018; Thu, 4 Jun 2020
 01:57:18 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Roman Shaposhnik <roman@zededa.com>, Xen-devel
 <xen-devel@lists.xenproject.org>
Subject: RE: UEFI support in ARM DomUs
Thread-Topic: UEFI support in ARM DomUs
Thread-Index: AQHWN5exllox/cqJUUS0HFcLChNz8ajHt2rg
Date: Thu, 4 Jun 2020 01:57:18 +0000
Message-ID: <DB6PR0402MB276072324DC3E1E9BD9A96BE88890@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <CAMmSBy9R57ntWmzNZDvwcvJM1f1wwD7ogWvCshipAcPX4x-TmQ@mail.gmail.com>
In-Reply-To: <CAMmSBy9R57ntWmzNZDvwcvJM1f1wwD7ogWvCshipAcPX4x-TmQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: zededa.com; dkim=none (message not signed)
 header.d=none;zededa.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 861a47d8-6dea-4283-5eae-08d8082a9d13
x-ms-traffictypediagnostic: DB6PR0402MB2695:
x-microsoft-antispam-prvs: <DB6PR0402MB26957B328D7A89C958A231F988890@DB6PR0402MB2695.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 04244E0DC5
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EsUxZoBxQ6wQufOy4K6hBVkl0APckSDvLbsL5q0sHYCoU0O1rgQxyCnV116SJtG9INFVHVuNwWEbb2vrz2+OuObGjytODE0CtRpaMvC9BU4o0SZ40uUBYJeKVc0Rz8lRUb+B0gd+mHQ+IVRfQlLnecuHyczWvl9YCYWws8of7iFWXHyuQOfiDhrTKZGgCGy1vTfd7YtRvZuNOP6aGV58+uV2DYU6PNck+I4BMG1l0tDFT5FVAFxdgk/YgP6NBYbwLX57iP6+vVAsli9f7I6iAdZnBH9GbFBokpEKthsZ6/GBUnGSezz+4xH4jHTbXE8YP2jcNqjKoBp+7ISwBvj6pQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB6PR0402MB2760.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(136003)(346002)(376002)(366004)(39860400002)(8936002)(8676002)(4326008)(2906002)(186003)(71200400001)(55016002)(9686003)(64756008)(66476007)(66946007)(66446008)(76116006)(26005)(478600001)(110136005)(44832011)(66556008)(86362001)(52536014)(7696005)(6506007)(5660300002)(33656002)(316002)(54906003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: EoCWoGKspogbR8kFidX4y+XakePVNtOQadRuQsZAA7e/AjuFXKhPs0UvPWhOSRoAKaeG+5A3zuvz1zYsc8ETCyO4gwYafwev7xllgsC9DGIetXXTG3C5uvASIlcsXJX5iLnji3cwsDs2WVs3l64p51KVm7Gb7uOkM/tPe2uGBMreQbJWZRSrjwfFsR6z72bQDkupIXpbAkqXdDABnXbv0nkoqAty6PdhAgyhps67XcVu2tLN0g1UGdSH0YvpP2bkxJEben4nOurv1fAqGq0xk4YdflO4Xz8Abyk3yDmWrCLPnyYlTSgGb7SaaItu6aqXMdbQVu2mEcRD0vZTL828V1Tv0PY+VB+x1fncD1HZlcZ67nIPR0Yhmb38GCW3FNwfCUcTvr9gDo5ZDcv9zTvs8W3w9yBjrett+KqFMUsp+vJ0zUJsutaspvKpWvGgI54KWS6BGNoaEC/mHStUMsZj/76VL9UxvFwu2kSRGvWH370gZAdYPDabkic+vQ04sDU4
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 861a47d8-6dea-4283-5eae-08d8082a9d13
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2020 01:57:18.8956 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OvOHi1RxBSIVj1viJhAXpHRDlymBSJ2z/XH2Vg0HYVvWHfLIzJ1bBSjjRlAU0o3TG8ySXJj3A9DrYJfp5Our2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2695
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Nataliya Korovkina <malus.brandywine@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

R3JhbGwgPGp1bGllbkB4ZW4ub3JnPjsNCj4gTmF0YWxpeWEgS29yb3ZraW5hIDxtYWx1cy5icmFu
ZHl3aW5lQGdtYWlsLmNvbT4NCj4gU3ViamVjdDogVUVGSSBzdXBwb3J0IGluIEFSTSBEb21Vcw0K
DQpXZSBoYXZlIG1hZGUgVS1Cb290IHJ1biBpbnNpZGUgWEVOIERvbVUsIGJ1dCBqdXN0IG9ubHkg
UFYgY29uc29sZSBwYXJ0LA0Kbm90IGltcGxlbWVudCBvdGhlciBmcm9udGVuZCBkcml2ZXJzIGN1
cnJlbnRseS4gV291bGQgdGhpcyBoZWxwIGZvciB5b3VyDQpjYXNlIGlmIGVuYWJsZSBFRkkgaW4g
VS1Cb290Pw0KDQpSZWdhcmRzLA0KUGVuZy4NCg0KPiANCj4gSGkhDQo+IA0KPiB3aXRoIGEgbG90
IG9mIGhlbHAgZnJvbSBTdGVmYW5vLCB3ZSdyZSBnZXR0aW5nIFJQaTQgc3VwcG9ydCBpbiBQcm9q
ZWN0IEVWRQ0KPiBwcmV0dHkgbXVjaCBvbiBwYXIgYmV0d2VlbiBLVk0gYW5kIFhlbi4NCj4gDQo+
IE9uZSBiaWcgYXJlYSB0aGF0IHN0aWxsIHJlbWFpbnMgaXMgc3VwcG9ydGluZyBVRUZJIGJvb3Qg
c2VxdWVuY2UgZm9yIERvbVVzLg0KPiBXaXRoIEtWTSwgZ2l2ZW4gdGhlIHFlbXUgdmlydCBkZXZp
Y2UgbW9kZWwgdGhpcyBpcyBhcyBzaW1wbGUgYXMgdXNpbmcgZWl0aGVyDQo+IHN0b2NrIFVFRkkg
YnVpbGQgZm9yIGFybSBvciBldmVuIFUtQm9vdCBFRkkgZW11bGF0aW9uIGVudmlyb25tZW50IGFu
ZA0KPiBwYXNzaW5nIGl0IHZpYSAtYmlvcyBvcHRpb24uDQo+IA0KPiBPYnZpb3VzbHkgd2l0aCBY
ZW4gb24gQVJNIHdlIGRvbid0IGhhdmUgdGhlIGRldmljZSBtb2RlbCBzbyBteQ0KPiB1bmRlcnN0
YW5kaW5nIGlzIHRoYXQgdGhlIGVhc2llc3Qgd2F5IHdlIGNhbiBzdXBwb3J0IGl0IHdvdWxkIGJl
IHRvIHBvcnQNCj4gVUVGSSdzIE92bWZQa2cvT3ZtZlhlbiB0YXJnZXQgdG8gQVJNIChpdCBzZWVt
cyB0byBiZSBjdXJyZW50bHkgZXhjbHVzaXZlbHkNCj4gWDY0KS4NCj4gDQo+IFNvIGhlcmUncyBt
eSBmaXJzdCBxdWVzdGlvbjogaWYgdGhlcmUncyBhbnlib2R5IG9uIHRoaXMgbGlzdCB3aG8gaGFk
IGEgaGFuZCBpbg0KPiBpbXBsZW1lbnRpbmcgT3ZtZlBrZy9Pdm1mWGVuIGNhbiB5b3UgcGxlYXNl
IHNoYXJlIHlvdXIgdGhvdWdodHMgb24gaG93DQo+IG11Y2ggd29yayB0aGF0IHBvcnQgbWF5IGJl
IChvciB3aGV0aGVyIGl0IGlzIGV2ZW4gZmVhc2libGUgLS0gSSBtYXkgdG90YWxseSBiZQ0KPiBt
aXNzaW5nIHNvbWV0aGluZyByZWFsbHkgb2J2aW91cyBoZXJlKS4NCj4gDQo+IEFuZCBhcyBsb25n
IGFzIEkndmUgZ290IHlvdXIgYXR0ZW50aW9uOiB0d28gbW9yZSBxdWVzdGlvbnM6DQo+ICAgIDEu
LiBjb21wYXJlZCB0byB0aGUgYWJvdmUsIHdvdWxkIHBvcnRpbmcgcHZncnViIHRvIEFSTSBiZSBh
bnkNCj4gICAgZWFzaWVyIG9yIG1vcmUgZGlmZmljdWx0Pw0KPiANCj4gICAgMi4gc2FtZSBxdWVz
dGlvbiBmb3IgdGVhY2hpbmcgdS1ib290IGFib3V0IFBWIGNhbGxzLg0KPiANCj4gVGhhbmtzLA0K
PiBSb21hbi4NCj4gDQo+IFAuUy4gT2ggYW5kIEkgZ3Vlc3MgYmV0d2VlbjoNCj4gICAgMC4gT3Zt
ZlBrZy9Pdm1mWGVuIG9uIEFSTTY0DQo+ICAgIDEuIHB2Z3J1YiBvbiBBUk02NA0KPiAgICAyLiB1
LWJvb3QvRUZJIGVtdWxhdGlvbiB3aXRoIFBWIGNhbGxzIGJhY2tlbmQgSSBkaWRuJ3QgbWlzcyBh
bnkgb3RoZXINCj4gb2J2aW91cyB3YXkgb2YgbWFraW5nIFVFRkktYXdhcmUgVk0gaW1hZ2VzIHRv
IGJvb3Qgb24gWGVuIEFSTTY0IERvbVUsDQo+IHJpZ2h0Pw0KDQo=

