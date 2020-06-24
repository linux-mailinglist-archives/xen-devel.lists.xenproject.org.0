Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFDB206C41
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2020 08:15:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnyga-0004on-Gj; Wed, 24 Jun 2020 06:15:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DbcV=AF=epam.com=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1jnygZ-0004oi-2T
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2020 06:15:03 +0000
X-Inumbo-ID: 094cf756-b5e2-11ea-b7bb-bc764e2007e4
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.72]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 094cf756-b5e2-11ea-b7bb-bc764e2007e4;
 Wed, 24 Jun 2020 06:15:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MzbDM3QElO+Ikkc/fnhTD5X3l3Zq4rK7BC77DzDuYNRofr1hnAs39v38yxY+YDisjUJkmgbilDO6K3vOrHkhOAfTK6tBgDGgeartADlKepPAkixtco1NaHTuPKG9fAQeru7ztnmkMAYGRPjYnScSJa9ok+GT588BwSSfjoulj9EbuQG8ZXzyJ4mD66XjNZajBV5IMvYmy1Ja8hNBhsr79o0XLIxV4npJJGhfg/wCJv3EnKQij809dDGY1prkMFbn4ocIGkaDqLAGydM0K7Dha9O6DX48oByu0K7n97q4y3QEmrJtUgr1gH5Sx1DXXZIh2w8DKD02tPL9Gg1uk/0WjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yYDigHQ3HAqzhpJzdmvnX1Bl/Qv0EPsXpcTULAtliHU=;
 b=Q5qbGT0rwBrfvLW2ZHOUaC0N4wvt9a9qJTiDUkPnVJg/ebL+fsWMu5b0cfyODK1tonXhazfyNyOe9+UFfujH1TyQBmoEWCmcDG9p/ksu3+c9SgSw4f/OPi+o/4+tmldu7EwIyyh/xPyRTONi0s45s3YSauyZvNIgx3VbHeMjLsFgZyEzwCSvFz/du+IjZIjMFyNu7YWqLSQESAKkNWdCTrjnUBqnDWu37t1mAP/bP7y54cCthu4dZOwwTplxWqzPW2QdATT3fLoP9k6pPd06G0GKBhe0uYVg6xlwwFs/DMOpcVezswsWZnGheCfUlkqYMplw0ZB/oZEbPMYd5LhA6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yYDigHQ3HAqzhpJzdmvnX1Bl/Qv0EPsXpcTULAtliHU=;
 b=LhWstnR+M4buCt/XKD4+R/TF1CB2IJ4GqhB8QDD5mcijfSXUblqg2FzIEFSfCB+z5xs4FrW8BL9U1UN5JRuGBnwzsUNcnzKX5XTEqPHmEXkj4ya/LUhDgXTO3iTPLpR11LRUj6Hquoxq+Yl8J7Vpha2+xa80rQzlvUq1HLJx15mjqODDcDnzAOf3hL8WHcDCq5/JXjsk2ntZ3Y3r2Gp9UHV9G/TRTft80n3oB+RNyL+avzXGaRjbvwJHAd7J851i96uZzLUO1FAx+YSCAAMqQuDNwsZrfUb8DJpk5cB6es9cKPhCYilr0ZX/n7M0W+E5M+Q5OMS21fgQIf3n8ygs7g==
Received: from AM6PR03MB3991.eurprd03.prod.outlook.com (2603:10a6:20b:25::20)
 by AM6PR03MB4358.eurprd03.prod.outlook.com (2603:10a6:20b:4::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Wed, 24 Jun
 2020 06:15:00 +0000
Received: from AM6PR03MB3991.eurprd03.prod.outlook.com
 ([fe80::b015:38c7:355d:1c1c]) by AM6PR03MB3991.eurprd03.prod.outlook.com
 ([fe80::b015:38c7:355d:1c1c%4]) with mapi id 15.20.3109.027; Wed, 24 Jun 2020
 06:15:00 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Subject: Re: UEFI support in ARM DomUs
Thread-Topic: UEFI support in ARM DomUs
Thread-Index: AQHWOoSI1wnhumD+IkWBnAQX9mudyajIlWsAgBVWbwCAAJ62gIAAeBOAgAANxQCAAWPDgIAEUtgAgAAGgYCAAAHAgIAANpaAgAB+IgCAAEYyAIABnlyA
Date: Wed, 24 Jun 2020 06:14:59 +0000
Message-ID: <a122102d-c023-0379-5d2c-b7b08d262844@epam.com>
References: <CAMmSBy9R57ntWmzNZDvwcvJM1f1wwD7ogWvCshipAcPX4x-TmQ@mail.gmail.com>
 <DB6PR0402MB276072324DC3E1E9BD9A96BE88890@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <c3856c1f-52bf-92fd-5226-4b09229e2127@epam.com>
 <alpine.DEB.2.21.2006040829390.6774@sstabellini-ThinkPad-T480s>
 <d6b39cd7-eeaa-f82b-df62-051f9f715968@epam.com>
 <54dcfce1-c401-0581-8620-dc8790209a87@xen.org>
 <alpine.DEB.2.21.2006181444460.14005@sstabellini-ThinkPad-T480s>
 <CAJ=z9a1NtCr1MM7oUBUH3hgc8SL_K9jERy+NQ6pLzxNpGPpXzw@mail.gmail.com>
 <alpine.DEB.2.21.2006191020110.12730@sstabellini-ThinkPad-T480s>
 <c5905f40-6d0a-358f-35e4-239e88ace7d8@epam.com>
 <94bfe57c-c1be-62b4-3799-b90415264487@xen.org>
 <4ece84cf-dd68-6eb4-a0e2-e9008d264ba5@epam.com>
 <1a44c645-8c9a-93ce-8466-35c87eb4fca5@xen.org>
 <alpine.DEB.2.21.2006221419200.8121@sstabellini-ThinkPad-T480s>
 <271a4db0-5ce5-ba25-65e7-107c040f5069@epam.com>
In-Reply-To: <271a4db0-5ce5-ba25-65e7-107c040f5069@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b77a13db-7217-4560-ad94-08d81805ecf0
x-ms-traffictypediagnostic: AM6PR03MB4358:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR03MB4358C96738F967B33834F2D9E7950@AM6PR03MB4358.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0444EB1997
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: a6RiKWuKIvPCoy2ZQ4qjftQurMMTNWYIG4sTOvzN1UmE0M8i8RD3+hwEO7UCNUf1dVEHkBJRvlDlaSOhKcIZsJSWjYpvZYipt9N1DQxm7+HmL4NATIJlg2u6LSAfD1qI7eMxQ3y/EXZ1axty0Y0iBgChpqsH+GssiGifsFyBCaPzj62CHYIzfDXQP3lVJ46QwwmOaaMoE52Kal0kNCv+ePuQf64FKXpznndJah31gtot2qqmlCodtp25CMnCzQzxO5iHfaXbaqC3kDnRtbMnnJClMMdBf7Co4TAXcK16CwyDo5kF9zQfv9vvgOs0f+ml0xM3BD8CHHEAxjCVHtVBSaA3YKAbklglzfZ/uek+o2Kuw443+5vFmS7PZb9drP7fFMPSmQecEQlBpIbaqJMmqA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR03MB3991.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(366004)(346002)(376002)(136003)(39860400002)(66946007)(71200400001)(54906003)(6506007)(8936002)(4326008)(26005)(2906002)(6512007)(8676002)(186003)(53546011)(6486002)(316002)(36756003)(7416002)(478600001)(966005)(5660300002)(76116006)(31696002)(83380400001)(64756008)(110136005)(66446008)(66476007)(66556008)(31686004)(86362001)(2616005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: U+fzMxNO4ejjfXLVCTtjkRp9YBrNcP4k6ObmUlL3CYO00rGaXTwf86s9ltQv0dEIRf+zW1nVLkHLIBq2t0OcdkXTTiHeJWbeZmVAbzXyeW1wU4NVrX9NAcbPYIH1Tcklm4QBNt4fw71A7isJKSW2qXzwkrLwf7FkVWy8ect9mg3kLC66+kE1T2h+miK8Dprc+yL2sEGwfi8/y3E51XGz58BydfHfrJk7vaHgTJsqG0aH8HPBmpCN8lPTI1mh563KG3j3yTDyrxPDBNMoju6kIahJsDUKlIC0AhgCkXs/2ADmotvHyLj9OtzOlz4FUaOV0DJbDGcg7PxqQsoq/jQXzPhlCETWBzijSV9GDWfY7mDXQTOQ63CBOXQK4nqhMyb66vU5wZwc3OgJMXYoKQ7hl03DHRh1kKAYDedLsp9b8mcuUsfKOVOYpU6GZOi/TxpveLSUyiXPjodRtx4Fzi3qjYbicrYs22crwax31jwK/3k=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D0124C6BA7054142AF0C169AFFDE47F9@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b77a13db-7217-4560-ad94-08d81805ecf0
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2020 06:15:00.0505 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vo5p/9EMY+0kvyMzLOWq/OL0O7FvbZgxF8a8Q5BUaht0PpftE1wWzob8CpoaUHkkN9JbeEMyzZSDCJSbxPnGoZYgugg5EZlkiKKTZWzanaDwiA4j7ODhVl6EYASIOhJB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB4358
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
Cc: Anastasiia Lukianenko <Anastasiia_Lukianenko@epam.com>,
 Juergen Gross <jgross@suse.com>, Peng Fan <peng.fan@nxp.com>,
 Oleksandr Andrushchenko <andr2000@gmail.com>,
 Roman Shaposhnik <roman@zededa.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Nataliya Korovkina <malus.brandywine@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQpPbiA2LzIzLzIwIDg6MzEgQU0sIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPg0K
PiBPbiA2LzIzLzIwIDQ6MjAgQU0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4+IE9uIE1v
biwgMjIgSnVuIDIwMjAsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+Pj4+PiBGb3IgdGhlIGZpcnN0
IHBhcnQgKF9fWEVOX0lOVEVSRkFDRV9WRVJTSU9OX18pIEkgdGhpbmsgd2UgY2FuIHByb3ZpZGUg
aXQNCj4+Pj4+PiB2aWENCj4+Pj4+Pg0KPj4+Pj4+IENGTEFHUyBvciBzb21ldGhpbmcuIFRoaXMg
Y2FuIGFsc28gYmUgZG9uZSBmb3IgdGhlIGxvY2F0aW9uIG9mIFhlbg0KPj4+Pj4+IGhlYWRlcnMu
DQo+Pj4+PiBfX1hFTl9JTlRFUkZBQ0VfVkVSU0lPTl9fIHNob3VsZCB3b3JrIHRocm91Z2ggdGhl
IENGTEFHUy4gQW4gYWx0ZXJuYXRpdmUNCj4+Pj4+IHdvdWxkIGJlIHRvIGFsbG93IHRoZSB1c2Vy
IHRvIHNwZWNpZnkgdGhyb3VnaCB0aGUgS2NvbmZpZy4NCj4+Pj4gWW91IG1lYW4gc3BlY2lmeWlu
ZyB2aWEgS2NvbmZpZyBzb21ldGhpbmcgbGlrZSAiMHgwMDA0MGQwMCI/DQo+Pj4gUG9zc2libHkg
eWVzLg0KPj4+DQo+Pj4+IEFuZCB3aGF0IGFib3V0IHRoZSBoZWFkZXJzPyBIb3cgd2lsbCB3ZSBw
cm92aWRlIHRoZWlyIGxvY2F0aW9uIGlmIHdlIGRlY2lkZQ0KPj4+PiBub3QgdG8gaW5jbHVkZSB0
aG9zZQ0KPj4+Pg0KPj4+PiBpbiB0aGUgdHJlZT8NCj4+PiBJIHdvdWxkIGRvIHRocm91Z2ggS2Nv
bmZpZyBhcyB3ZWxsLg0KPj4gSWYgd2Ugc3BlY2lmeSB0aGUgZXh0ZXJuYWwgbG9jYXRpb24gb2Yg
dGhlIFhlbiBoZWFkZXJzIHZpYSBLY29uZmlnLCBpdA0KPj4gc2VlbXMgdG8gbWUgdGhhdCB3ZSBz
aG91bGQgYmUgYWJsZSB0byBkZXRlY3QgdGhlIGludGVyZmFjZSB2ZXJzaW9uDQo+PiBhdXRvbWF0
aWNhbGx5IGZyb20gYW55IE1ha2VmaWxlIGFzIHBhcnQgb2YgdGhlIGJ1aWxkLiBObyBuZWVkIHRv
IGFzayB0aGUNCj4+IHVzZXIuDQo+Pg0KPj4gSG93ZXZlciwgaWYgT2xla3NhbmRyIGlzIHRoaW5r
aW5nIG9mIHVzaW5nIHRoZSBYZW4gaGVhZGVycyBmb3IgdGhlDQo+PiBoeXBlcmNhbGxzIGRlZmlu
aXRpb25zLCB0aGVuIEkgdGhpbmsgd2UgbWlnaHQgbm90IG5lZWQgZXh0ZXJuYWwgaGVhZGVycw0K
Pj4gYXQgYWxsIGJlY2F1c2UgdGhhdCBpcyBhIHN0YWJsZSBpbnRlcmZhY2UsIGFzIEp1bGllbiB3
cm90ZS4gV2UgY291bGQNCj4+IGp1c3QgZGVmaW5lIG91ciBvd24gZmV3IGhlYWRlcnMgZm9yIGp1
c3Qgd2hhdCB5b3UgbmVlZCBsaWtlIExpbnV4IGRvZXMuDQo+DQo+IFRoaXMgaXMgYSBnb29kIGlk
ZWE6IEknbGwgdHJ5IHRvIGdldCB0aGUgbWluaW1hbCBzZXQgb2YgaGVhZGVycyBmcm9tIExpbnV4
DQo+DQo+IGluc3RlYWQgb2YgWGVuIGFzIHRob3NlIHNlZW0gdG8gYmUgd2VsbCBwcmVwYXJlZCBm
b3Igc3VjaCBhIHVzZS1jYXNlLiBUaGlzDQo+DQo+IHdheSB3ZSdsbCBoYXZlIGhlYWRlcnMgaW4g
VS1ib290IHRyZWUgYW5kIGd1YXJhbnRlZSB0aGF0IHdlIGhhdmUgYSBtaW5pbWFsDQo+DQo+IHN1
YnNldCB3aGljaCBpcyBlYXNpZXIgdG8gbWFpbnRhaW4uIEknbGwga2VlcCB5b3UgdXBkYXRlZCBv
biB0aGUgcHJvZ3Jlc3MNCg0KV2UndmUgbWFuYWdlZCB0byBzdHJpcCB0aGUgaGVhZGVycyBhbmQg
cmVtb3ZlIF9fWEVOX18gYW5kIHRoZSByZXN0IGRlZmluaXRpb25zDQoNCndlIHdlcmUgdGFsa2lu
ZyBhYm91dC4gU28sIHRoZXNlIGFyZSBub3cgdGhlIG1pbmltYWwgcmVxdWlyZWQgc2V0IG9mIGhl
YWRlcnMNCg0KdGhhdCBhbGxvd3MgVS1ib290IHRvIGJ1aWxkIHNlcmlhbCBhbmQgYmxvY2sgZHJp
dmVycy4gUGxlYXNlIHRha2UgYSBsb29rIGF0IFsxXQ0KDQpQdWxsIHJlcXVlc3QgZm9yIGNvbW1l
bnRzIGlzIGF0IFsyXQ0KDQo+DQo+Pg0KPj4gSWYgeW91IGNhbiBkbyB0aGF0LCBJIHRoaW5rIGl0
IHdvdWxkIGJlIGJldHRlciBiZWNhdXNlIHdlIGRlY291cGxlIHRoZQ0KPj4gVUJvb3QgYnVpbGQg
ZnJvbSB0aGUgWGVuIGJ1aWxkIGNvbXBsZXRlbHkuIFdlIGRvbid0IGV2ZW4gbmVlZCB0aGUgWGVu
DQo+PiB0cmVlIGNoZWNrZWQgb3V0IHRvIGJ1aWxkIFVCb290LiBJdCB3b3VsZCBiZSBhIGh1Z2Ug
YWR2YW50YWdlIGJlY2F1c2UgaXQNCj4+IG1ha2VzIGl0IGZhciBlYXNpZXIgdG8gYnVpbGQtdGVz
dCBjaGFuZ2VzIGZvciBvdGhlcnMgaW4gdGhlIGNvbW11bml0eQ0KPj4gdGhhdCBkb24ndCBrbm93
IGFib3V0IFhlbiBhbmQgYWxzbyBpdCBiZWNvbWVzIGZhciBlYXNpZXIgdG8gaW50ZWdyYXRlDQo+
PiBpbnRvIGFueSBidWlsZCBzeXN0ZW0uDQoNClsxXSBodHRwczovL2dpdGh1Yi5jb20vYW5kcjIw
MDAvdS1ib290L3RyZWUvcHZibG9ja191cHN0cmVhbV92MQ0KDQpbMl0gaHR0cHM6Ly9naXRodWIu
Y29tL3hlbi10cm9vcHMvdS1ib290L3B1bGwvMg0K

