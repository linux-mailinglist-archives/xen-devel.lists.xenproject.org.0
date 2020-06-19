Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5B8200464
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 10:52:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jmCkw-00089Q-6W; Fri, 19 Jun 2020 08:52:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jb/V=AA=nxp.com=peng.fan@srs-us1.protection.inumbo.net>)
 id 1jmCku-00089K-Vf
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 08:52:13 +0000
X-Inumbo-ID: 2a56b167-b20a-11ea-bb4c-12813bfff9fa
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.45]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2a56b167-b20a-11ea-bb4c-12813bfff9fa;
 Fri, 19 Jun 2020 08:52:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=csTtp/tSfpeztOLEiikysewSDABz1mE8vL/QL8JiaudyqKn22OyeenanhSHfRSSGohaFJXXj76CA3pI59cN+yo5LUZjN2MPGMyEM30J+oiI2umVEjjlttdDnhD0GFED8HZTy+3ocGdSXuDtJaTLDrp5+9P0oGUEoIqCkTHRPUi5/eWlqnm7CqUzJwK/Sau9rlxW3AAf/JO+u6X6nRlLRldUrd7Pt9VjVVs0j5BmctQrsxj6c26qHLEcfzEJ+9FDBe0zX0nHLUkfvZYEVjOFhPT1aalxeDxLhEVKQwF2nFQvgJU1L7Kj6jOMFrE3Xaft0psLk9KKSb4pNK6cUmkQQhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TTUkD1W9y0FK0blpskNf23+lGdOQ8an9T/nu/OEc0vk=;
 b=YNlLZeqgfbYAiodr/QUzY/ECqdxByU5kp4UTnebbdtfn9H/h2ymh0jSSZ1k2iHt/yA/fsB7m7LWk1Sia5aCU1AeT2wzsXlUevw2hEp0oiPgAKV+bqQXG9tFtkUA+h71h3urRteKnI8vGxPPJbcA1gXIcBrdJ7X3CfrEPpyyMk7ZWhctNnA1i/GQ1iI5Xf5CRUC7sZktvtWifi5DZ/kggO3qP1no9DysFL7FCHT6BZKhtlGezLlSROvphcaCm5xLPq9/dRRmZbWVyu7ZYhE6nOvQiuMwB5CnRKaEDdyFOC4Of5X4a4V69NRsyaGc+Rz0ZZ733+lHuanPTon8ffHQH/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TTUkD1W9y0FK0blpskNf23+lGdOQ8an9T/nu/OEc0vk=;
 b=nPVBol3ue+lU5eF1SsDdiCO7bWOaDoXjxijSkQsL+uBeojbNeJ2NhlXD18k/RWSua1gWcvezd5uljDt1l7iV9k2+5w4ZLnRULt83zCGDDXgi8RRl8ilycBXRG83VXs05KklU3RtPywg88aDmBqEWMdcyIIgXV4WYgIUmjnw0IlA=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR0402MB2840.eurprd04.prod.outlook.com (2603:10a6:4:97::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.21; Fri, 19 Jun
 2020 08:52:11 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::2d36:b569:17c:7701]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::2d36:b569:17c:7701%4]) with mapi id 15.20.3088.028; Fri, 19 Jun 2020
 08:52:10 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>
Subject: RE: [Tee-dev] TEE with XEN
Thread-Topic: [Tee-dev] TEE with XEN
Thread-Index: AdZCuN8SyGfGPx9hRva/eeajiUtqpQAw/zsAAIeJWwAAHsEHgAAAD3aw
Date: Fri, 19 Jun 2020 08:52:10 +0000
Message-ID: <DB6PR0402MB27606AA43E7A95B3CB2D228588980@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <DB6PR0402MB276091802866E8CB878A8130889C0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <CAOcqxo2B4cnJdqERr81rVzJKb=Rj=kmotd7Cui9nOMy52wVKmg@mail.gmail.com>
 <8a6ba53e-59c8-0c18-00e9-2902b6edaf39@xen.org>
 <68572FBC-8AE3-44A4-A815-1A9A7FFFA098@arm.com>
In-Reply-To: <68572FBC-8AE3-44A4-A815-1A9A7FFFA098@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 09a7846f-70db-41a7-6151-08d8142e0e04
x-ms-traffictypediagnostic: DB6PR0402MB2840:
x-microsoft-antispam-prvs: <DB6PR0402MB2840B7770288EC27E4FA31F088980@DB6PR0402MB2840.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0439571D1D
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6N5J+TgUFh8IDlFOlnkPnJtaCyquNlRTeXqXu6MJRK9ORUoRqjTZEW3iFsNP3ygeVtbqLgk0CUk8lH7+f1wIECtBEdptnpks5IY3oVhWa0rNP4nlcogTpGFGn0Cb36ZPVnH967WE+Bvc5Ldxp3utr+WAu9cAsYSJq/2XQaolQMsevbD11lfYtzs9EYID7AWw22ZGf65siR8TFSy+lV6aOQ7X5N8ssVJibEaQCm4jkooNnF9LaoB8WfstlmE92SBZJPgOBa111734FjJuaP9qc1mvIWvu97npm+aPYEfjaRHBZCgRn8DRs0E+unDIXKDd0C0uZtn23gS7YMFiYJGAdA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB6PR0402MB2760.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(136003)(376002)(39860400002)(346002)(396003)(4326008)(478600001)(83380400001)(44832011)(7416002)(5660300002)(33656002)(9686003)(66946007)(76116006)(71200400001)(66556008)(110136005)(86362001)(54906003)(64756008)(52536014)(55016002)(66476007)(66446008)(53546011)(7696005)(8676002)(186003)(2906002)(8936002)(26005)(6506007)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: h3UhwwoiItmrVInT91jcCJEnDU84KMK04tLkn5ymCJ5whABhRKhD0T0UQ9kKHh2bNtnIVBqyKnj22ThO3f7XUMoi7+/gRV3YrRRXnxBkHK/qTbPQA4VUdhNVKe6ZQSoPA5Ltr5n3GU3U+YqbITH2CUU88FfhN1CuGcuwQKUeZs28EdSnr+5cOZAzX7+UpI0sz68PcmUH3SVWXRSpuLwuEHLT9USrqBqys9Dbk1r3w+Eahk1FBckxS8ZvCaSo1EwKhR8ZQYs2N1Mc2rtZu0fTiG170rh04Uim7PHIHiVBotm/qjUDEC1te+F1VwI/nUxDzllFyYBDZ5sVy/Q9pwImdU9fumukBAiCjQI89LB8Vq28NwMVbA0carSdxz/2FNH6Ae7Lkg4wQ2PHPZ2IsuTeYtY2KedIqaMjgIfkAZiZPr7pPL8SXtxZ+i6Xg2BMVhWtZ8358YcW9YQXmSvrfOO35WOR62z89P0TVVHw0777sgI=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09a7846f-70db-41a7-6151-08d8142e0e04
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2020 08:52:10.8694 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G4EJQfESyZQZfmJ7QojJx8fBsysSX2UdnSHUjWG1qPZQ4Lh+i36jXg6P72/fERzZCFABAtyVQN6rtZF7WafUjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2840
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Volodymyr Babchuk <vlad.babchuk@gmail.com>,
 "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
 Xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Jens Wiklander <jens.wiklander@linaro.org>, Stefano Babic <sbabic@denx.de>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQmVydHJhbmQsDQoNCj4gU3ViamVjdDogUmU6IFtUZWUtZGV2XSBURUUgd2l0aCBYRU4NCj4g
DQo+IEhpLA0KPiANCj4gPiBPbiAxOCBKdW4gMjAyMCwgYXQgMTk6MDUsIEp1bGllbiBHcmFsbCA8
anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPiA+DQo+ID4gK0JlcnRyYW5kIGFuZCBTdGVmYW5vDQo+
ID4NCj4gPiBPbiAxNi8wNi8yMDIwIDAyOjI0LCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToNCj4g
Pj4gSGkgUGVuZywNCj4gPj4gT24gTW9uLCAxNSBKdW4gMjAyMCBhdCAwNTowNywgUGVuZyBGYW4g
PHBlbmcuZmFuQG54cC5jb20+IHdyb3RlOg0KPiA+Pj4NCj4gPj4+IEhpIEFsbCwNCj4gPj4+DQo+
ID4+PiBXaGlsZSBlbmFibGluZyB0cnVzdHkgb3Mgd2l0aCB4ZW4sIEkgdG9vayBzYW1lIGFwcHJv
YWNoIGFzIE9QLVRFRSwNCj4gPj4+IHdpdGggT1AtVEVFIHJ1bm5pbmcgaW4gc2VjdXJlIHdvcmxk
LiBCdXQgSSBhbSBhbHNvIHRoaW5raW5nIHRoaXMNCj4gPj4+IG1pZ2h0IGludHJvZHVjZSBwb3Rl
bnRpYWwgaXNzdWUgaXMgdGhhdCBzZWN1cmUgd29ybGQgT1MgY29tbXVuaWNhdGUgd2l0aA0KPiBE
b21VLg0KPiA+Pj4gSWYgdGhlcmUgYXJlIHNvbWUgbWlzYmVoYXZpb3IgaW4gc2VjdXJlIHdvcmxk
IE9TLCBpdCBtaWdodCBsZXQgWEVODQo+ID4+PiBoeXBlcnZpc29yIG5vdCB3b3JrIHByb3Blci4N
Cj4gPj4+DQo+ID4+PiBJbiBteSBzZXR1cCwgdHJ1c3R5IG9zIHNvbWV0aW1lcyBwYW5pYyBpbiBz
ZWN1cmUgd29ybGQsIHhlbiB3aWxsIG5vdA0KPiA+Pj4gYWJsZSB0byBjb250cm9sIHRoZSBwYW5p
YyBjb3JlIGFueW1vcmUuDQo+ID4NCj4gPiBNYXkgSSBhc2sgaW4gd2hpY2ggY2FzZSBUcnVzdHkg
aXMgcGFuaWNraW5nPw0KPiANCj4gSW4gYW55IGNhc2UsIG9wdGVlIHNob3VsZCBwcm90ZWN0IGl0
c2VsZiBhZ2FpbnN0IHRoaXMgYW5kIGl0IHNob3VsZCBiZQ0KPiBjb25zaWRlcmVkIHRoYXQgb3B0
ZWUgaXMgbW9yZSBwcml2aWxlZGdlZCB0aGVuIFhlbi4NCj4gU28gaWYgb3B0ZWUgaXMgY3Jhc2hp
bmcgd2UgY2Fubm90IGV4cGVjdCB0aGF0IFhlbiBjYW4gcmVjb3ZlciBvciBmaXggaXQuDQo+IA0K
PiBJIHdvdWxkIG1vcmUgY29uc2lkZXIgdGhpcyBhcyBhIGJ1ZyB0aGF0IG9wdGVlIG5lZWRzIHRv
IGJlIHJvYnVzdCBhZ2FpbnN0Lg0KDQpvay4gSSBhbSBub3QgdXNpbmcgT1AtVEVFLCBjdXJyZW50
bHkgSSB1c2UgZ29vZ2xlIHRydXN0eSBPUy4NCg0KSSBoYXZlIHR3byBPUywgRG9tMCBsaW51eCAr
IERvbVUgYW5kcm9pZCBhdXRvLg0KDQpEb21VIGFuZHJvaWQgYXV0byBuZWVkcyB0cnVzdHkgT1Ms
IERvbTAgTGludXggbm90IG5lZWQgdGhhdC4NCg0KSSBub3Qgd2FubmEgdHJ1c3R5IE9TIGZvciBE
b21VIGNvdWxkIGJyaW5nIGFueSBkZXRlY3QgdG8gRG9tMCBvciB4ZW4uDQoNCk9uZSBtb3JlIGNh
c2UgaXMgaWYgZG9tMCBsaW51eCBuZWVkcyBPUC1URUUsIERvbVUgbmVlZHMgZ29vZ2xlIHRydXN0
eSwNCmhvdyB3ZSBoYW5kbGUgdGhpcyBpbiBvbmUgU29DPw0KDQo+IA0KPiA+DQo+ID4+Pg0KPiA+
Pj4gU28gSSBhbSB0aGlua2luZyB3aGV0aGVyIHdlIG5lZWQgdG8gZW11bGF0aW5nIHNlY3VyZSB3
b3JsZCBpbiBhIFhFTg0KPiA+Pj4gVk0gd2hpY2ggaXMgdGhlIFZNIHJ1bm5pbmcgRG9tVS4gSnVz
dCBsaWtlIHdoYXQgQUNSTiBkaWQgdG8gcnVuDQo+ID4+PiB0cnVzdHkgb3MuDQo+ID4+IFdlbGws
IGl0IGRlcGVuZHMgb24gd2hvbSB5b3UgYXJlIHRydXN0aW5nIG1vcmUuIEJvdGggWEVOIGFuZCBU
RUUgYXJlDQo+ID4+IG1pbmltYWwgT1MgaW1wbGVtZW50YXRpb25zIHdpdGggYWltIGF0IHNlY3Vy
aXR5LiBJJ20gc3BlYWtpbmcgYWJvdXQNCj4gPj4gZ2VuZXJpYyBURUUgT1MsIG5vdCBhYm91dCBw
YXJ0aWN1bGFyIE9TIGxpa2UgT1AtVEVFIG9yIFRydXN0eS4NCj4gPj4gUHJvYmxlbSBpcyB0aGF0
LCBpZiBURUUgaXMgcnVubmluZyBpbnNpZGUgVk0sIGl0IHdpbGwgYmUgc3VzY2VwdGlibGUNCj4g
Pj4gdG8gYSBoeXBlcnZpc29yIG1pc2JlaGF2aW91ci4gWW91IG5lZWQgdG8gdW5kZXJzdGFuZCB0
aGF0IFhlbiBhbmQNCj4gPj4gcHJpdmlsZWdlZCBkb21haW4gKGRvbTAsIG1vc3RseSkgY2FuIGFj
Y2VzcyBtZW1vcnkgb2YgYW55IGd1ZXN0Lg0KPiA+PiBBdCBsZWFzdCwgaW4gZGVmYXVsdCBjb25m
aWd1cmF0aW9uLiBUaGVyZSBhcmUgbWVhbnMgdG8gaGFyZGVuIHRoaXMNCj4gPj4gc2V0dXAuIEJ1
dCBhbnl3YXlzLCBYZW4gY2FuJ3QgYmUgc3RvcHBlZCBmcm9tIHJlYWRpbmcgVEVFJ3Mgc2VjcmV0
cy4NCj4gPg0KPiA+IElJUkMsIHdlIGRpc2N1c3NlZCB0aGlzIGFwcHJvYWNoIGZvciBPUC1URUUg
aW4gdGhlIHBhc3QuIFRoZXJlIHdhcyBvdGhlcg0KPiBwb3RlbnRpYWwgcGl0ZmFsbHMgd2l0aCBp
dC4gRm9yIGluc3RhbmNlLCB5b3Ugd291bGRuJ3QgYmUgYWJsZSB0byBkaXJlY3RseSBhY2Nlc3MN
Cj4gYW55IHNlY3VyZSBkZXZpY2UgZnJvbSB0aGF0IGd1ZXN0IChpdCBpcyBydW5uaW5nIGluIG5v
bi1zZWN1cmUgd29ybGQpLg0KPiA+DQo+ID4gVGhlcmUgYXJlIGFsc28gaXNzdWVzIGluIHRlcm0g
b2YgbGF0ZW5jeSBhcyB5b3UgbWF5IGhhdmUgdGhlIGZvbGxvd2luZw0KPiBtb2RlbDoNCj4gPg0K
PiA+IGRvbVUgLT4gWGVuIC0+IGRvbVUgVEVFIC0+IChYZW4gLT4gaG9zdCBURUUgLT4gWGVuIC0+
IGRvbVUgVEVFKSAtPiBYZW4gLT4NCj4gZG9tVS4NCj4gPg0KPiA+IFRoZSBiaXQgaW4gKCkgaXMg
aWYgeW91IHJlcXVpcmUgdG8gY2FsbCB0aGUgaG9zdCBURUUuDQo+ID4NCj4gPiBPbmUgcG9zc2li
aWxpdHkgd291bGQgYmUgdG8gdXNlIFNlY3VyZS1FTDIgZm9yIHlvdXIgVHJ1c3R5IE9TLiBCdXQg
SSBkb24ndA0KPiBrbm93IHdoZXRoZXIgeW91ciBwbGF0Zm9ybSBzdXBwb3J0cyBpdC4NCj4gPg0K
PiA+IERlcGVuZGluZyBvbiB3aGV0aGVyIHlvdSBjYW4gbW9kaWZ5IFRydXN0eSBPUywgYWx0ZXJu
YXRpdmUgd291bGQgYmUgdG8NCj4gbWFrZSBpdHZpcnR1YWxpemF0aW9uIGF3YXJlIGFzIE9QLVRF
RSBkaWQuIFRoZSBjb3JlIHdvdWxkIG5lZWQgdG8gYmUNCj4gcmVzaWxpZW50IGFuZCB0aGUgcGFu
aWMgb25seSBhZmZlY3QgYSBnaXZlbiBjbGllbnQuDQo+IA0KPiBJIGRvIG5vdCBoYXZlIHJpZ2h0
IGEgY2xlYXIgaWRlYSBvZiB3aGF0IGlzIHRoZSBzdGF0dXMgb2Ygb3B0ZWUgYW5kIHhlbiBidXQg
aW4NCj4gdGhlb3J5IEkgd291bGQgc2VlIDIgcG9zc2libGUgd2F5cyB0byBoYW5kbGUgdGhpczoN
Cj4gLSB3aXRob3V0IG9wdGVlIG1vZGlmaWNhdGlvbiwgc29tZXRoaW5nIGluIGEgZ3Vlc3QgKERv
bTAgb3IgYW4gb3RoZXINCj4gcHJpdmlsZWRnZWQgb25lKSBuZWVkcyB0byBoYXZlIGFjY2VzcyB0
byBvcHRlZSBhbmQgZW11bGF0ZSBvcHRlZSBhY2Nlc3MgZm9yDQo+IG90aGVycy4NCj4gLSB3aXRo
IG9wdGVlIG1vZGlmaWNhdGlvbnMsIG9wdGVlIG5lZWRzIHRvIGhhdmUgYSBjb25jZXB0IG9mIGNs
aWVudCBhbmQgWGVuDQo+IHdvdWxkIG5lZWQgdG8gcGFzc3Rocm91Z2ggb3B0ZWUgcmVxdWVzdHMg
YnV0IGJlaW5nIHJlc3BvbnNpYmxlIG9mIGFkZGluZyBhDQo+IOKAnGNsaWVudOKAnSBpZGVudGlm
aWVyLiBNYXliZSBhbHNvIGluZm9ybWluZyBPcHRlZSB3aGVuIGEgbmV3IGNsaWVudCBpcw0KPiBj
cmVhdGVkL3JlbW92ZWQuDQo+IA0KPiBUaGUgc2Vjb25kIHNjZW5hcmlvIGNvdWxkIHRoZW4gYmUg
c29tZWhvdyBzcGxpdHRlZCBpbiB0aGUgcHJldmlvdXMgb25lIGZyb20NCj4gSnVsaWVuIGlmIHNv
bWUgcGFydHMgd291bGQgbmVlZCB0byBiZSBlbXVsYXRlZCBzb21ld2hlcmUgaW4gc29tZSBraW5k
IG9mDQo+IGNvbWJpbmF0aW9uIG9mIHRoZSAyIG1vZGVscy4NCj4gDQo+IEluIGFueSBjYXNlIGkg
d291bGQgYWx3YXlzIGNvbnNpZGVyIHRoYXQgYW55dGhpbmcgcnVubmluZyBvbiBvcHRlZSAob3Ig
aW4NCj4gZ2VuZXJhbCBpbiB0aGUgc2VjdXJlIHdvcmxkKSBpcyBtb3JlIHRydXN0ZWQgdGhlbiBY
ZW4uDQoNCk9rLCB0aGlzIG1lYW5zIG9wdGVlIHJ1bnMgb24gYWxsIGNvcmVzIGluIHNlY3VyZSB3
b3JsZCwgYnV0IHRoaXMgd291bGQgbm90DQp3b3JrIHdoZW4gd2UgbmVlZCB0byBzdXBwb3J0IG11
bHRpcGxlIE9TZXMgd2l0aCB0aGVpciBvd24gVEVFLg0KDQpSZWdhcmRzLA0KUGVuZy4NCg0KPiAN
Cj4gUmVnYXJkcw0KPiBCZXJ0cmFuZA0KDQo=

