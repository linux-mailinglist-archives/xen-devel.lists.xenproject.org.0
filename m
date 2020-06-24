Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6408D206D98
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2020 09:26:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnznX-0002sA-FT; Wed, 24 Jun 2020 07:26:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iWQw=AF=nxp.com=peng.fan@srs-us1.protection.inumbo.net>)
 id 1jnznW-0002s5-Fm
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2020 07:26:18 +0000
X-Inumbo-ID: fd895978-b5eb-11ea-8496-bc764e2007e4
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.53]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fd895978-b5eb-11ea-8496-bc764e2007e4;
 Wed, 24 Jun 2020 07:26:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KaP83evpfiFrhQ7YndWhFzmexrdhzr/n3zFy5hL1wwczdRtI6AbzCT92Y4twMfhBwasc2kL95dXtHWiS6+iN8P7/2Vi+Wyjkuo3pYd0incrDn20qsA4+EpsWk7uW9qGLAQz2wI6VIqnWWF+SFWALRMNIJew9Eyp5eEaofpbF45SkEO4chfoQrvKdux6aOm6bs+uStjCDw+7Mvs8SZI4EL5SPLYPX4meMAJolfR0fFcxWYE9+PIVysmFLLy6HOXY7dur58qX9MmYaiX98VE1I5B3jpH4AFhbGqRXIYw/s/6I/P9iRyhsvoDXs2gDwFvS0ocjdYTC6Jr6HMLifDS9zqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XMMv61XXOQWfosc8Ey6sbPGilo1JimUvb19FuUx/t/Y=;
 b=goKMsCEV8kLlXLUoUzkJyMvgoAbGltBIQnrTP4clSQfXVB96zzzixAnYqhIrY4BHECs8dVs1xE1gYV6Kp6iwxLyudk24uAOUGHOj2QwkDPGsNfQEjdgG01KnYuZ+MlIPX6TKml8xL3U3+HwrbAk3rdqxII68XFYMZucZlWzrx6SYxzGiHefT2SPiaQR+lmgKvstYiFxDoZyOcuJBxv+FsPnVhZg7PtD030m3osfV9H1WSIV/1+7Dm8JRY1o9eYcKALodd+KVItO5KXiDp//pKUihJryXnABUI0GSyYumXBgpCSO+YpbzLR9ffv1QJepOpQq3NYubFdutE0iWoCR7TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XMMv61XXOQWfosc8Ey6sbPGilo1JimUvb19FuUx/t/Y=;
 b=kZwU8ffjV/6uSA4XDElACvphJMRKdfVu7PA5Z94TH7fBa68/2T9cXFIEGCpNzL7/h+t++Eeg+0+v6V2zLHUJwwsoPHSTJgJXxWnH+fgQDntEEiB5njg9Sp/TZDAny+mEJR+zhvCSN+2lSnObbkQWVjk8fr3ra47yVEqVap7M7nQ=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR0402MB2807.eurprd04.prod.outlook.com (2603:10a6:4:96::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Wed, 24 Jun
 2020 07:26:15 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::2d36:b569:17c:7701]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::2d36:b569:17c:7701%4]) with mapi id 15.20.3109.027; Wed, 24 Jun 2020
 07:26:15 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Subject: RE: UEFI support in ARM DomUs
Thread-Topic: UEFI support in ARM DomUs
Thread-Index: AQHWN5exllox/cqJUUS0HFcLChNz8ajHt2rggADieACAAAFjAIAVVnEAgACes4CAAHgUgIAADcUAgAFjwoCABFLagIAABoCAgAABwICAADaWgIAAfiIAgABGNACAAZ5agIAADjmAgAADNoCAAAB6UA==
Date: Wed, 24 Jun 2020 07:26:15 +0000
Message-ID: <DB6PR0402MB27601AFCF42050A4CC1372B588950@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <CAMmSBy9R57ntWmzNZDvwcvJM1f1wwD7ogWvCshipAcPX4x-TmQ@mail.gmail.com>
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
 <a122102d-c023-0379-5d2c-b7b08d262844@epam.com>
 <DB6PR0402MB27601E1DDED18CDBF3D6A18188950@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <273d5fe8-dac9-6375-77df-e24f56066cfe@epam.com>
In-Reply-To: <273d5fe8-dac9-6375-77df-e24f56066cfe@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6a923628-bb00-4005-25fd-08d8180fe147
x-ms-traffictypediagnostic: DB6PR0402MB2807:
x-microsoft-antispam-prvs: <DB6PR0402MB28072E892062C5D3630A3DBE88950@DB6PR0402MB2807.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0444EB1997
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ieNsUU6/Yl10gii2ungivVojJgP8KGilGOjUwlpqINMYIDVClK/e6altj6YnBN94/R+kdhnMvjE4pBC7VHgOB8x5qj3BO2EKPO8U4q6OkSYwTsbhUNiDry5EwSiVCG5GwOi5RFYOFdNp0sIJQkCSAnYEDnItf4lPsgaLWzUIF8Dzn6O5r5TLjATRqrxPIZsRBtNItjrynmG5JQRpjMzinUULs1qm1vERYFV1+2bUGObxzs/ypNg/Z2jFS0A0wl96/lvUbMkXGB8ZT0vBt9zjsxWwC5OjxztqaCnKQCpnwVXiq0OGxtd/zuYJ259rAUzu/IbkX16WtZ21HdFjEuz+8qUT9KVrwpCXwg5jPhvliR8y1P8YKjUDcIOux6nWlPwLExtZdHcwUyHTfZJWXBqZFQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB6PR0402MB2760.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(346002)(376002)(136003)(396003)(366004)(53546011)(6506007)(9686003)(5660300002)(8676002)(66556008)(8936002)(86362001)(7416002)(66946007)(186003)(66476007)(26005)(66446008)(64756008)(2906002)(76116006)(55016002)(4326008)(7696005)(54906003)(83380400001)(110136005)(71200400001)(52536014)(33656002)(316002)(83080400001)(966005)(478600001)(45080400002)(44832011);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: jZMVlZbzmsOcguGK5ZB3qRPWMo2lhCH/A3/iGQrrUAl1KWKHYVxOe1azdwVL2vq6MphUXXcOUIs4QchmxsSUdwq7Nkl/lBgeM+TAmzIdQhHlT22iCcWF41YlGfZPTsA9icXLHEKSiwkGMIRqum/oLDHmKFuCb0CMhuChMMSSnAswdWNgLYcLQMRR0PV4OtKtChBl5egNbwGr1dOYjr4RfcnQzhVqSClXScKzf6qHK/xRGORHovKXV2gWlpywDCkG1f9x2JLSyjJjjYdQLTtY90pFoMgv81yCuQ3KHw7DyxfVMs0W7y7F3us/Oc+2xwr6Xr3X0qRXNC5Lr02zVNoIV1/BCF6OJDnC9ovBnQ6fgDSyQ45qx9cr5tRF5VmKJk3wv/cK/VDn7lEk5l0vuIikCUhN5HMuLrqaDpFH6jnWvywtbZXkhhplbJhy5GZjHNaHniOEbPZwxYLnMrRqmWoeppyzcDEJG1I+cmIbPJgQ4uFDT0J9XTeAO04oQ3burOGu
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a923628-bb00-4005-25fd-08d8180fe147
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2020 07:26:15.4458 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n1tx57XG/21+TF69Zg5SRgd3aSFMHxSJKD+vDUrHtpXT/UHYr/Uxqqt84yOYh3nqgZfbG/nICPgXq0qO3ofqsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2807
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
 Juergen Gross <jgross@suse.com>, Oleksandr Andrushchenko <andr2000@gmail.com>,
 Roman Shaposhnik <roman@zededa.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Nataliya Korovkina <malus.brandywine@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBTdWJqZWN0OiBSZTogVUVGSSBzdXBwb3J0IGluIEFSTSBEb21Vcw0KPiANCj4gDQo+IE9uIDYv
MjQvMjAgMTA6MDcgQU0sIFBlbmcgRmFuIHdyb3RlOg0KPiA+PiBTdWJqZWN0OiBSZTogVUVGSSBz
dXBwb3J0IGluIEFSTSBEb21Vcw0KPiA+Pg0KPiA+Pg0KPiA+PiBPbiA2LzIzLzIwIDg6MzEgQU0s
IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPiA+Pj4gT24gNi8yMy8yMCA0OjIwIEFN
LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+ID4+Pj4gT24gTW9uLCAyMiBKdW4gMjAyMCwg
SnVsaWVuIEdyYWxsIHdyb3RlOg0KPiA+Pj4+Pj4+PiBGb3IgdGhlIGZpcnN0IHBhcnQgKF9fWEVO
X0lOVEVSRkFDRV9WRVJTSU9OX18pIEkgdGhpbmsgd2UgY2FuDQo+ID4+Pj4+Pj4+IHByb3ZpZGUg
aXQgdmlhDQo+ID4+Pj4+Pj4+DQo+ID4+Pj4+Pj4+IENGTEFHUyBvciBzb21ldGhpbmcuIFRoaXMg
Y2FuIGFsc28gYmUgZG9uZSBmb3IgdGhlIGxvY2F0aW9uIG9mDQo+ID4+Pj4+Pj4+IFhlbiBoZWFk
ZXJzLg0KPiA+Pj4+Pj4+IF9fWEVOX0lOVEVSRkFDRV9WRVJTSU9OX18gc2hvdWxkIHdvcmsgdGhy
b3VnaCB0aGUgQ0ZMQUdTLg0KPiBBbg0KPiA+Pj4+Pj4+IGFsdGVybmF0aXZlIHdvdWxkIGJlIHRv
IGFsbG93IHRoZSB1c2VyIHRvIHNwZWNpZnkgdGhyb3VnaCB0aGUNCj4gS2NvbmZpZy4NCj4gPj4+
Pj4+IFlvdSBtZWFuIHNwZWNpZnlpbmcgdmlhIEtjb25maWcgc29tZXRoaW5nIGxpa2UgIjB4MDAw
NDBkMDAiPw0KPiA+Pj4+PiBQb3NzaWJseSB5ZXMuDQo+ID4+Pj4+DQo+ID4+Pj4+PiBBbmQgd2hh
dCBhYm91dCB0aGUgaGVhZGVycz8gSG93IHdpbGwgd2UgcHJvdmlkZSB0aGVpciBsb2NhdGlvbiBp
Zg0KPiA+Pj4+Pj4gd2UgZGVjaWRlIG5vdCB0byBpbmNsdWRlIHRob3NlDQo+ID4+Pj4+Pg0KPiA+
Pj4+Pj4gaW4gdGhlIHRyZWU/DQo+ID4+Pj4+IEkgd291bGQgZG8gdGhyb3VnaCBLY29uZmlnIGFz
IHdlbGwuDQo+ID4+Pj4gSWYgd2Ugc3BlY2lmeSB0aGUgZXh0ZXJuYWwgbG9jYXRpb24gb2YgdGhl
IFhlbiBoZWFkZXJzIHZpYSBLY29uZmlnLA0KPiA+Pj4+IGl0IHNlZW1zIHRvIG1lIHRoYXQgd2Ug
c2hvdWxkIGJlIGFibGUgdG8gZGV0ZWN0IHRoZSBpbnRlcmZhY2UNCj4gPj4+PiB2ZXJzaW9uIGF1
dG9tYXRpY2FsbHkgZnJvbSBhbnkgTWFrZWZpbGUgYXMgcGFydCBvZiB0aGUgYnVpbGQuIE5vDQo+
ID4+Pj4gbmVlZCB0byBhc2sgdGhlIHVzZXIuDQo+ID4+Pj4NCj4gPj4+PiBIb3dldmVyLCBpZiBP
bGVrc2FuZHIgaXMgdGhpbmtpbmcgb2YgdXNpbmcgdGhlIFhlbiBoZWFkZXJzIGZvciB0aGUNCj4g
Pj4+PiBoeXBlcmNhbGxzIGRlZmluaXRpb25zLCB0aGVuIEkgdGhpbmsgd2UgbWlnaHQgbm90IG5l
ZWQgZXh0ZXJuYWwNCj4gPj4+PiBoZWFkZXJzIGF0IGFsbCBiZWNhdXNlIHRoYXQgaXMgYSBzdGFi
bGUgaW50ZXJmYWNlLCBhcyBKdWxpZW4gd3JvdGUuDQo+ID4+Pj4gV2UgY291bGQganVzdCBkZWZp
bmUgb3VyIG93biBmZXcgaGVhZGVycyBmb3IganVzdCB3aGF0IHlvdSBuZWVkDQo+ID4+Pj4gbGlr
ZSBMaW51eA0KPiA+PiBkb2VzLg0KPiA+Pj4gVGhpcyBpcyBhIGdvb2QgaWRlYTogSSdsbCB0cnkg
dG8gZ2V0IHRoZSBtaW5pbWFsIHNldCBvZiBoZWFkZXJzIGZyb20NCj4gPj4+IExpbnV4DQo+ID4+
Pg0KPiA+Pj4gaW5zdGVhZCBvZiBYZW4gYXMgdGhvc2Ugc2VlbSB0byBiZSB3ZWxsIHByZXBhcmVk
IGZvciBzdWNoIGEgdXNlLWNhc2UuDQo+ID4+PiBUaGlzDQo+ID4+Pg0KPiA+Pj4gd2F5IHdlJ2xs
IGhhdmUgaGVhZGVycyBpbiBVLWJvb3QgdHJlZSBhbmQgZ3VhcmFudGVlIHRoYXQgd2UgaGF2ZSBh
DQo+ID4+PiBtaW5pbWFsDQo+ID4+Pg0KPiA+Pj4gc3Vic2V0IHdoaWNoIGlzIGVhc2llciB0byBt
YWludGFpbi4gSSdsbCBrZWVwIHlvdSB1cGRhdGVkIG9uIHRoZQ0KPiA+Pj4gcHJvZ3Jlc3MNCj4g
Pj4gV2UndmUgbWFuYWdlZCB0byBzdHJpcCB0aGUgaGVhZGVycyBhbmQgcmVtb3ZlIF9fWEVOX18g
YW5kIHRoZSByZXN0DQo+ID4+IGRlZmluaXRpb25zDQo+ID4+DQo+ID4+IHdlIHdlcmUgdGFsa2lu
ZyBhYm91dC4gU28sIHRoZXNlIGFyZSBub3cgdGhlIG1pbmltYWwgcmVxdWlyZWQgc2V0IG9mDQo+
ID4+IGhlYWRlcnMNCj4gPj4NCj4gPj4gdGhhdCBhbGxvd3MgVS1ib290IHRvIGJ1aWxkIHNlcmlh
bCBhbmQgYmxvY2sgZHJpdmVycy4gUGxlYXNlIHRha2UgYQ0KPiA+PiBsb29rIGF0IFsxXQ0KPiA+
Pg0KPiA+PiBQdWxsIHJlcXVlc3QgZm9yIGNvbW1lbnRzIGlzIGF0IFsyXQ0KPiA+IFRoZSBVLUJv
b3QgbmV3IG1lcmdlIHdpbmRvdyB3aWxsIGJlIG9wZW4gaW4gMjAyMC83LzEsIHNvIEknZCBzdWdn
ZXN0DQo+ID4gdGhlIHBhdGNoc2V0IGdvZXMgdG8gVS1Cb290IG1haWwgbGlzdCBmb3IgZGlzY3Vz
c2lvbiBpZiB5b3Ugd2FubmEgdGhlDQo+ID4gcGF0Y2hlcyBnb25uYSBtZXJnZWQgc29vbi4NCj4g
DQo+IFdlIGRlZmluaXRlbHkgd2FudCB0aGUgcGF0Y2hlcyB0byBiZSB1cHN0cmVhbWVkIGFuZCBt
ZXJnZWQsIGJ1dCBiZWZvcmUNCj4gdGhhdA0KPiANCj4gd2UgYWxzbyB3YW50IHRvIG1ha2Ugc3Vy
ZSB0aGF0IFhlbiBjb21tdW5pdHkgaXMgaGFwcHkgd2l0aCB3aGF0IHdlDQo+IHVwc3RyZWFtDQo+
IA0KPiBJIGJlbGlldmUgd2UgcmVzb2x2ZWQgbW9zdCBvZiB0aGUgY29uY2VybnMgc3VjaCBhcyBo
ZWFkZXJzLCBQSUUgZXRjLCBzbyB0aGlzDQo+IGNhbg0KPiANCj4gYmUgZG9uZS4NCj4gDQo+IEJU
VywgUGVuZywgZGlkIHlvdSBoYXZlIGEgY2hhbmNlIHRvIHRyeSB0aGUgcHZibG9jayBkcml2ZXIg
eWV0Pw0KDQpOb3QgeWV0LiBJIGNvdWxkIGhhdmUgdGltZSB0byBnaXZlIGEgdGVzdCBuZXh0IE1v
bmRheS4gSSB0aGluayB5b3Ugbm90DQplbmFibGUgU1BMLCByaWdodD8gU28gYW5kcm9pZCBkdWFs
IGJvb3Rsb2FkZXIgZmVhdHVyZSBub3QgZW5hYmxlZC4NCkJ1dCBTUEwgbW9zdGx5IG5vdCBoYXZl
IE1NVSBlbmFibGVkLi4NCg0KUmVnYXJkcywNClBlbmcuDQoNCj4gDQo+ID4NCj4gPiBSZWdhcmRz
LA0KPiA+IFBlbmcuDQo+ID4NCj4gPj4+PiBJZiB5b3UgY2FuIGRvIHRoYXQsIEkgdGhpbmsgaXQg
d291bGQgYmUgYmV0dGVyIGJlY2F1c2Ugd2UgZGVjb3VwbGUNCj4gPj4+PiB0aGUgVUJvb3QgYnVp
bGQgZnJvbSB0aGUgWGVuIGJ1aWxkIGNvbXBsZXRlbHkuIFdlIGRvbid0IGV2ZW4gbmVlZA0KPiA+
Pj4+IHRoZSBYZW4gdHJlZSBjaGVja2VkIG91dCB0byBidWlsZCBVQm9vdC4gSXQgd291bGQgYmUg
YSBodWdlDQo+ID4+Pj4gYWR2YW50YWdlIGJlY2F1c2UgaXQgbWFrZXMgaXQgZmFyIGVhc2llciB0
byBidWlsZC10ZXN0IGNoYW5nZXMgZm9yDQo+ID4+Pj4gb3RoZXJzIGluIHRoZSBjb21tdW5pdHkg
dGhhdCBkb24ndCBrbm93IGFib3V0IFhlbiBhbmQgYWxzbyBpdA0KPiA+Pj4+IGJlY29tZXMgZmFy
IGVhc2llciB0byBpbnRlZ3JhdGUgaW50byBhbnkgYnVpbGQgc3lzdGVtLg0KPiA+PiBbMV0NCj4g
Pj4NCj4gaHR0cHM6Ly9ldXIwMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJs
PWh0dHBzJTNBJTJGJTJGdXJsZGVmDQo+IGVuc2UuY29tJTJGdjMlMkZfX2h0dHBzJTNBJTJGJTJG
ZXVyMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jDQo+IG9tJTJGJTNGdXJsJTNEaHR0
cHMqM0EqMkYqMkZnaXRodWJfXyUzQkpTVWwhIUdGXzI5ZGJjUUlVQlBBIW13aQ0KPiBiM3VuNi12
WUJHNjh6TWZ1clc2LTBNdXVFUjV0Tm1KdE9pdERwVmlJQ05rWDBsaGlnOGlQSG1ab2t1TS1CTFEN
Cj4gWXBlS1lBR1ElMjQmYW1wO2RhdGE9MDIlN0MwMSU3Q3BlbmcuZmFuJTQwbnhwLmNvbSU3Qzk1
MGQ5YzBhDQo+IGRjNTE0OTI3Y2U4YjA4ZDgxODBlYTRlZiU3QzY4NmVhMWQzYmMyYjRjNmZhOTJj
ZDk5YzVjMzAxNjM1JTdDDQo+IDAlN0MwJTdDNjM3Mjg1Nzk4NDYwNTYzOTE0JmFtcDtzZGF0YT1m
TXJJJTJGUW90a25Dc1hWMGFtQzRCRmwNCj4gMUhnNHZQdzN6T01WZEFWaW0yV2NzJTNEJmFtcDty
ZXNlcnZlZD0wIC4NCj4gPj4NCj4gY29tJTJGYW5kcjIwMDAlMkZ1LWJvb3QlMkZ0cmVlJTJGcHZi
bG9ja191cHN0cmVhbV92MSZhbXA7ZGF0YT0wDQo+ID4+DQo+IDIlN0MwMSU3Q3BlbmcuZmFuJTQw
bnhwLmNvbSU3QzQwN2Q4YWYyNGEzNjQ4M2ZiZGNlMDhkODE4MDVlZDg4DQo+ID4+ICU3QzY4NmVh
MWQzYmMyYjRjNmZhOTJjZDk5YzVjMzAxNjM1JTdDMCU3QzAlN0M2MzcyODU3NjEwMjENCj4gOTc1
DQo+ID4+DQo+IDE2NCZhbXA7c2RhdGE9NXZXZkJiTFNjSUNYUFpXVSUyQlUzYjdEeU9OY2d4VDhp
SUNzeHJ3VWJPUlpZJQ0KPiA+PiAzRCZhbXA7cmVzZXJ2ZWQ9MA0KPiA+Pg0KPiA+PiBbMl0NCj4g
Pj4NCj4gaHR0cHM6Ly9ldXIwMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJs
PWh0dHBzJTNBJTJGJTJGdXJsZGVmDQo+IGVuc2UuY29tJTJGdjMlMkZfX2h0dHBzJTNBJTJGJTJG
ZXVyMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jDQo+IG9tJTJGJTNGdXJsJTNEaHR0
cHMqM0EqMkYqMkZnaXRodWJfXyUzQkpTVWwhIUdGXzI5ZGJjUUlVQlBBIW13aQ0KPiBiM3VuNi12
WUJHNjh6TWZ1clc2LTBNdXVFUjV0Tm1KdE9pdERwVmlJQ05rWDBsaGlnOGlQSG1ab2t1TS1CTFEN
Cj4gWXBlS1lBR1ElMjQmYW1wO2RhdGE9MDIlN0MwMSU3Q3BlbmcuZmFuJTQwbnhwLmNvbSU3Qzk1
MGQ5YzBhDQo+IGRjNTE0OTI3Y2U4YjA4ZDgxODBlYTRlZiU3QzY4NmVhMWQzYmMyYjRjNmZhOTJj
ZDk5YzVjMzAxNjM1JTdDDQo+IDAlN0MwJTdDNjM3Mjg1Nzk4NDYwNTYzOTE0JmFtcDtzZGF0YT1m
TXJJJTJGUW90a25Dc1hWMGFtQzRCRmwNCj4gMUhnNHZQdzN6T01WZEFWaW0yV2NzJTNEJmFtcDty
ZXNlcnZlZD0wIC4NCj4gPj4NCj4gY29tJTJGeGVuLXRyb29wcyUyRnUtYm9vdCUyRnB1bGwlMkYy
JmFtcDtkYXRhPTAyJTdDMDElN0NwZW5nLmZhDQo+ID4+DQo+IG4lNDBueHAuY29tJTdDNDA3ZDhh
ZjI0YTM2NDgzZmJkY2UwOGQ4MTgwNWVkODglN0M2ODZlYTFkM2JjMmI0DQo+ID4+DQo+IGM2ZmE5
MmNkOTljNWMzMDE2MzUlN0MwJTdDMCU3QzYzNzI4NTc2MTAyMTk3NTE2NCZhbXA7c2RhdGE9JTIN
Cj4gPj4NCj4gRm1YaGVFdktzc0xqamFGS3NIQkJicWglMkI3MmpIM3VRbkU3Y3BOMEozazhJJTNE
JmFtcDtyZXNlcnZlZD0wDQo=

