Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 563931FA637
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 04:03:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jl0vi-0005x6-Go; Tue, 16 Jun 2020 02:02:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VSNG=75=nxp.com=peng.fan@srs-us1.protection.inumbo.net>)
 id 1jl0vg-0005x1-Dm
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 02:02:24 +0000
X-Inumbo-ID: 6a995e00-af75-11ea-b866-12813bfff9fa
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.13.53]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6a995e00-af75-11ea-b866-12813bfff9fa;
 Tue, 16 Jun 2020 02:02:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i16n+PlLnHtv4TkU4K/joJq83mNCBwaY5QRFsa7Icm8FDuvHragei4GXGlYVk2B4KZtbCaUHLWmF9w2p6YyEZ3EY7p2OmFnRWoYM4k+4eL78wBIp4nYZn/12VyTh2zzZ2t+Eo2DQZb1pGKq9ltt3Gcd4HiNAxY1pZbKtsy3fuAUJZG3VA0C2uuP1yPsljOCUfopyrsNeNgYTslvdsKnszLkrkUN9tqTZ9b8KEkBiFdO9x7fxu+HwasHl5rp7N8sfOCz3TZoK3SMjzC3Jx37cSkkRg0fS6tPaVXyf9gMFT4EvoTP3X8B9LC69Mze3fdSNZxQgZgbnTvJomUritsTErw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fi8b8PPe89sPxksvUWQxXqG2gfhC47pLd6CqSuQxY/k=;
 b=DXpxS2po1NY4N97FKYkJY8scecTkcfICwt738W+ZAgKt4OlPobaoWDqtBp76GaKSTntR949LgSl8YDPNm8YZPViW4zMO2Me3Y4LOw3jdTMK51alH37cfec2DTjhu2NoWHJP2UIFVJ3UKLH/qE9uU7i9w6KzCjQRCJQzNu7O6dIu+zy/eK3Pk1ZoYI3SwgyNKYD+SoeogFEKxsUYwovY5BuI58AK+ktSUnbOyR5hQXVijOFHax3O7dAH/5ryJI0hm0qmRQko+A7qVzN4erCNkVxLKl2JwJIuyXYJaWoUv/BdBsVlXJCkw0ecJH8In4siyqRPigmy9vWSrFr7qYPBsuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fi8b8PPe89sPxksvUWQxXqG2gfhC47pLd6CqSuQxY/k=;
 b=i8INAKnZec9Wgs7X4KBCWNKtF9fh24PWdnopgD5AwNLpWSCgYI0Y//IRwctr/Lo1jmb5ioKtT4k4QSCUm1B9v3F80F8EnRzTWVlDVHQhFtjJSq9+GUxnqbUTDQH08q5RsJQ7kdjUHFi4iohROkLH7L34Us1t51XlAVCgwWduiaU=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR0402MB2806.eurprd04.prod.outlook.com (2603:10a6:4:97::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.25; Tue, 16 Jun
 2020 02:02:20 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::2d36:b569:17c:7701]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::2d36:b569:17c:7701%4]) with mapi id 15.20.3088.028; Tue, 16 Jun 2020
 02:02:20 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Volodymyr Babchuk <vlad.babchuk@gmail.com>
Subject: RE: [Tee-dev] TEE with XEN
Thread-Topic: [Tee-dev] TEE with XEN
Thread-Index: AdZCuN8SyGfGPx9hRva/eeajiUtqpQAw/zsAAAE3WoA=
Date: Tue, 16 Jun 2020 02:02:20 +0000
Message-ID: <DB6PR0402MB2760E57975E39930582D8A61889D0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <DB6PR0402MB276091802866E8CB878A8130889C0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <CAOcqxo2B4cnJdqERr81rVzJKb=Rj=kmotd7Cui9nOMy52wVKmg@mail.gmail.com>
In-Reply-To: <CAOcqxo2B4cnJdqERr81rVzJKb=Rj=kmotd7Cui9nOMy52wVKmg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3fd092be-9ca5-4b08-d7d1-08d811994de4
x-ms-traffictypediagnostic: DB6PR0402MB2806:
x-microsoft-antispam-prvs: <DB6PR0402MB28067206F3BD37FD14A7BFA1889D0@DB6PR0402MB2806.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 04362AC73B
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GL2zywCMGykFZrAx0lhbzCnZlfbpcf+h0CZBYOFZnx+mWBgkHQc7NFvfUuLZTN7mT0X3ZhtafQwjvoTUmQWBvz2Z3sPsVJ8Jm8MXmuBU4zTdAHRRLrlGJeNEH0icO4U4OyHW4dysJFGbd6mLA3J6s5bllM5Sa0qQITljaZlJBoz7jtZLQkW+tS644KKvErCwyQXk0dyuACT8CAh7r99lLF6s5aQf2bER1DJU3mxphL7AZMUfrsRxhV+RoCdl+i1ose2Y5p6IeBWovl0MkLHiz2TqtgIgvQAphytJXkxra8eSBiejQLp59sB80LNecOj8BBDV9aJwF9bv0iddAJ3Rjg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB6PR0402MB2760.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(39860400002)(376002)(396003)(366004)(346002)(6506007)(186003)(83380400001)(4326008)(44832011)(8936002)(55016002)(2906002)(9686003)(478600001)(26005)(71200400001)(6916009)(76116006)(316002)(66446008)(64756008)(66946007)(66556008)(66476007)(54906003)(8676002)(5660300002)(86362001)(7696005)(52536014)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 7EyvHEhBJWHfWPZffSZ3v+em8BEEyfnLTS24L2RZN1nP/otjmCLDQHTjkybinr9aZzvvnXZo4ygPl6jgC1hWy1yfwj5QnWd+T5aFoXd3jVavN2l3pakOz59Pvt2kDgMQvJUKKLx1/IRxIF+SfSkbKQXRodDbztY8gMAppJ4bqLObdj/hEAjos13kvKtbxHZjhycw9T4fvDltlIGt3lYLACmm3MH2tufsspchPZqWLAcO/KEjtxalyoqRQeZLHzoRwbYbccSFu8zTrX7KN1N+IfBUAPUufkV/V3xiEbEYI8BQAaaUJBAjFGCSCgqNp+Pi17eV0lL7OLvNzkv+/hvWPBELl3j1N6Ms5onnp/wkOSOBJP/SK8y7cdjkTtPZc5Bo/HiOfcOrLWwr14bNGIUJy95ESKOJL2iFTTDxBtb24wYW05qCkr6lQobKUbhDXMZ4mtj4D2Q6F/A0+wVH3YF6zhfQOKiSamvTTS45gAqFludWb7Bj5Vjuvi1yIUf2J561
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fd092be-9ca5-4b08-d7d1-08d811994de4
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2020 02:02:20.6247 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5dha9KScXB/KzSKkoyiV9F6ZcwvblZmJf8wdRP0eGaHu5ykfqZA+v8STxX0U/ntQGlqnefuJ8H4SCXlHOh3DPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2806
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
Cc: Julien Grall <julien@xen.org>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Jens Wiklander <jens.wiklander@linaro.org>, Stefano Babic <sbabic@denx.de>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksDQoNCj4gU3ViamVjdDogUmU6IFtUZWUtZGV2XSBURUUgd2l0aCBYRU4NCj4gDQo+IEhpIFBl
bmcsDQo+IA0KPiBPbiBNb24sIDE1IEp1biAyMDIwIGF0IDA1OjA3LCBQZW5nIEZhbiA8cGVuZy5m
YW5AbnhwLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBIaSBBbGwsDQo+ID4NCj4gPiBXaGlsZSBlbmFi
bGluZyB0cnVzdHkgb3Mgd2l0aCB4ZW4sIEkgdG9vayBzYW1lIGFwcHJvYWNoIGFzIE9QLVRFRSwN
Cj4gPiB3aXRoIE9QLVRFRSBydW5uaW5nIGluIHNlY3VyZSB3b3JsZC4gQnV0IEkgYW0gYWxzbyB0
aGlua2luZyB0aGlzIG1pZ2h0DQo+ID4gaW50cm9kdWNlIHBvdGVudGlhbCBpc3N1ZSBpcyB0aGF0
IHNlY3VyZSB3b3JsZCBPUyBjb21tdW5pY2F0ZSB3aXRoIERvbVUuDQo+ID4gSWYgdGhlcmUgYXJl
IHNvbWUgbWlzYmVoYXZpb3IgaW4gc2VjdXJlIHdvcmxkIE9TLCBpdCBtaWdodCBsZXQgWEVODQo+
ID4gaHlwZXJ2aXNvciBub3Qgd29yayBwcm9wZXIuDQo+ID4NCj4gPiBJbiBteSBzZXR1cCwgdHJ1
c3R5IG9zIHNvbWV0aW1lcyBwYW5pYyBpbiBzZWN1cmUgd29ybGQsIHhlbiB3aWxsIG5vdA0KPiA+
IGFibGUgdG8gY29udHJvbCB0aGUgcGFuaWMgY29yZSBhbnltb3JlLg0KPiA+DQo+ID4gU28gSSBh
bSB0aGlua2luZyB3aGV0aGVyIHdlIG5lZWQgdG8gZW11bGF0aW5nIHNlY3VyZSB3b3JsZCBpbiBh
IFhFTiBWTQ0KPiA+IHdoaWNoIGlzIHRoZSBWTSBydW5uaW5nIERvbVUuIEp1c3QgbGlrZSB3aGF0
IEFDUk4gZGlkIHRvIHJ1biB0cnVzdHkNCj4gPiBvcy4NCj4gDQo+IFdlbGwsIGl0IGRlcGVuZHMg
b24gd2hvbSB5b3UgYXJlIHRydXN0aW5nIG1vcmUuIEJvdGggWEVOIGFuZCBURUUgYXJlDQo+IG1p
bmltYWwgT1MgaW1wbGVtZW50YXRpb25zIHdpdGggYWltIGF0IHNlY3VyaXR5LiANCg0KWEVOIGlz
IHRhcmdldGluZyBzYWZldHkuDQpURUUgaXMgdGFyZ2V0aW5nIHNlY3VyaXR5Lg0KDQpJJ20gc3Bl
YWtpbmcgYWJvdXQgZ2VuZXJpYw0KPiBURUUgT1MsIG5vdCBhYm91dCBwYXJ0aWN1bGFyIE9TIGxp
a2UgT1AtVEVFIG9yIFRydXN0eS4gUHJvYmxlbSBpcyB0aGF0LCBpZiBURUUgaXMNCj4gcnVubmlu
ZyBpbnNpZGUgVk0sIGl0IHdpbGwgYmUgc3VzY2VwdGlibGUgdG8gYSBoeXBlcnZpc29yIG1pc2Jl
aGF2aW91ci4gWW91DQo+IG5lZWQgdG8gdW5kZXJzdGFuZCB0aGF0IFhlbiBhbmQgcHJpdmlsZWdl
ZCBkb21haW4gKGRvbTAsIG1vc3RseSkgY2FuIGFjY2Vzcw0KPiBtZW1vcnkgb2YgYW55IGd1ZXN0
Lg0KPiBBdCBsZWFzdCwgaW4gZGVmYXVsdCBjb25maWd1cmF0aW9uLiBUaGVyZSBhcmUgbWVhbnMg
dG8gaGFyZGVuIHRoaXMgc2V0dXAuIEJ1dA0KPiBhbnl3YXlzLCBYZW4gY2FuJ3QgYmUgc3RvcHBl
ZCBmcm9tIHJlYWRpbmcgVEVFJ3Mgc2VjcmV0cy4NCg0KWWVzLiBVbmRlcnN0YW5kLg0KDQo+IA0K
PiBJZiB0aGlzIGlzIG9rYXkgZm9yIHlvdXIgbmVlZHMsIHRoZW4geW91IGNhbiBydW4gVEVFIGFz
IGEgVk0gb2YgY291cnNlLg0KPiANCj4gU28sIHRoaXMgaXMgaGVhdmlsbHkgZGVwZW5kcyBvbiB5
b3VyIHNlY3VyaXR5IHRocmVhdHMgbW9kZWwuIFRoZXJlIGNhbid0IGJlDQo+IHVuaXZlcnNhbCBz
b2x1dGlvbi4gQWxzbywgSSdtIHByb3Bvc2luZyB0byBjaGVjayBHb29nbGUncyByZXF1aXJlbWVu
dHMgZm9yDQo+IFRydXN0eSBlbnZpcm9ubWVudC4NCg0KTGV0IG1lIHRyeSB0byBhc2sgR29vZ2xl
IGd1eXMgdG8gc2VlIGFueSBmZWVkYmFjay4NCg0KVGhhbmtzLA0KUGVuZy4NCg0KPiBEbyB0aGV5
IGFsbG93IGl0IHRvIHJ1biBvdXRzaWRlIG9mIFRydXN0Wm9uZT8gRm9yIGV4YW1wbGUsIEdQRCBU
RUUgU3lzdGVtDQo+IEFyY2hpdGVjdHVyZSBkb2N1bWVudCBjbGVhcmx5IHNheXMgdGhhdCBURUUg
c2hvdWxkIGJlIHNlcGFyYXRlZCBmcm9tIFJFRSBieQ0KPiBoYXJkd2FyZSBtZWNoYW5pc21zIHRo
YXQgYXJlIG5vdCBjb250cm9sbGVkIGJ5IFJFRSAoc2VjdGlvbiAyLjIuMSkuIEkgYmVsaWV2ZSwN
Cj4gdGhhdCBzaG91bGQgYmUgYSBzaW1pbGFyIGRvY3VtZW50IGZvciBUcnVzdHkuDQo+IA0KPiAt
LQ0KPiBXQlIgVm9sb2R5bXlyIEJhYmNodWsgYWthIGxvcmMgWyszODA5NzY2NDYwMTNdDQo+IG1h
aWx0bzogdmxhZC5iYWJjaHVrQGdtYWlsLmNvbQ0K

