Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FBC20026A
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 09:05:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jmB4P-0006fd-B2; Fri, 19 Jun 2020 07:04:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oDvs=AA=epam.com=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1jmB4O-0006fY-4P
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 07:04:12 +0000
X-Inumbo-ID: 130636ee-b1fb-11ea-8496-bc764e2007e4
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.84]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 130636ee-b1fb-11ea-8496-bc764e2007e4;
 Fri, 19 Jun 2020 07:04:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NGLvpUesbAVzlS/xQLN6986Wmb9JVf4X7Wp6NDZa2qprg2th+gE82nL52+gBMn87lWeJ76p0yQb6zYVTPJqLQWhjkWl+3KYh7gAGvSFyODUgFcQwdSFMhaHOdKAOSvfe4gBk8/PliewnWx6wULHmTemGqh67VPcAUFxbuT4XaSC/SGdTSeUUdszQjwi0oiCilJClsWqsGUjZmcUOPKMA6lRCy2V9UXs7NlGWIV55rjYFPIgfOtw0Et5OYkRfqbU8npSMY+Yz6LKVrZtTyOjZxgxG/xP+vxmg3hTXUGXbywZ0iOX+Fob9rqcNRQprZsk3ud2dMjJRZOTfU+PLqrdlWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IX10gaq8mT5z7N3X0XaZB5NGJLfFs/lGAlNs6eoqfkU=;
 b=gj23dno78KUQfu6T36cZTffcQQvxDXbR36DMO6L2cdFwcnnG0P9JiLpDYnMHDjXnbUh8eISbQrvAARwd2zjR2mLmIRDSKR+6/XxIRHKtEIoVbkSNqyCnpI7aqqKKXIOXfF+R3b0arvS1xQQr1usbOiUJU9MylRvgY6q6+JB/JjZ7zBLCZ7qT2QAfnMmTTfF3HyVk3Jhq8KTkXG2mETT71ELH96qlramUzN+mQl/2LMI19AKID63PaeEJVnZa7ckXxqABGKYAhCIfN0DJMFJyTdO2Ig8kKUjTcnP8T/9e9DdzZwl5x/NeiC43LBtKoj9XpbqaFxBFaaeFp4idzlWigA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IX10gaq8mT5z7N3X0XaZB5NGJLfFs/lGAlNs6eoqfkU=;
 b=FwAqNHb5aQeazxxQwSDvlfuHiqLUUt81djKxoO4iu9dm760t8GkKinFCjgSnPEUwa+BDgGO1/leO56JiW0Ues9B8DD07lUUfVdOH/eX6h6hekU6duYHPxFy60N4k7ymffbS4lE6IJJKTkEmmDByG8JwYTjNyTk0t3aO2c6goDdNK+UVk6Fs8N/eMturtIEO3mmvCWTRlMAYaQPiOL3Y5fBLuTaJUzR1K88aFj6V5mkhxJ9aEEhUAG3kVaYtMfmTSHT+P7+fBHhbr+uXrjAbpnO2p5bCYMapYaQtZvT3j9Jt3ym+Z1xiAcq0v779cc6rI1g9UPAGqpZnHSACwF3oF2g==
Received: from VI1PR03MB3998.eurprd03.prod.outlook.com (2603:10a6:803:72::14)
 by VI1PR03MB6448.eurprd03.prod.outlook.com (2603:10a6:800:17d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.23; Fri, 19 Jun
 2020 07:04:07 +0000
Received: from VI1PR03MB3998.eurprd03.prod.outlook.com
 ([fe80::28ec:3584:94d:27a4]) by VI1PR03MB3998.eurprd03.prod.outlook.com
 ([fe80::28ec:3584:94d:27a4%7]) with mapi id 15.20.3109.021; Fri, 19 Jun 2020
 07:04:06 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: UEFI support in ARM DomUs
Thread-Topic: UEFI support in ARM DomUs
Thread-Index: AQHWOoSI1wnhumD+IkWBnAQX9mudyajIlWsAgBVWbwCAAJ62gIABEAqA
Date: Fri, 19 Jun 2020 07:04:06 +0000
Message-ID: <fb619c1f-a7e8-21e7-f381-975606885404@epam.com>
References: <CAMmSBy9R57ntWmzNZDvwcvJM1f1wwD7ogWvCshipAcPX4x-TmQ@mail.gmail.com>
 <DB6PR0402MB276072324DC3E1E9BD9A96BE88890@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <c3856c1f-52bf-92fd-5226-4b09229e2127@epam.com>
 <alpine.DEB.2.21.2006040829390.6774@sstabellini-ThinkPad-T480s>
 <d6b39cd7-eeaa-f82b-df62-051f9f715968@epam.com>
 <54dcfce1-c401-0581-8620-dc8790209a87@xen.org>
In-Reply-To: <54dcfce1-c401-0581-8620-dc8790209a87@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d007dd33-75fd-4648-4c7a-08d8141ef547
x-ms-traffictypediagnostic: VI1PR03MB6448:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR03MB6448530676FDEBFD0E8E1235E7980@VI1PR03MB6448.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0439571D1D
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3ghIs9S3v3CfPmPF1cFlOy0zcTKBFwi1OWOGNI3mr3I1rYvepn2i0NmSyYladIB6ewPqxYIdaLos0XcAJ3dCZ+6un390xyZZYXt7AiPvPCE+eAeKgUFJEjKeCk0XfsxeQWaz7/M94oIqRA0LM1LwsxbccR2OUo1bEGB4V+zycfRTLx+rBCgM5feYinv4awyrg9ueux9AyLixooQ7byjH+/V7xul6F6JGzOyewwbj4kpWcIGVRZVxFiaW+PRaoKrJqJRU4ZJK9UdYjI6MIm6HwEU6jPQe5O6qOBItUDY6vZwqzOnJPXXflVh8az1KqaQLbYOQcepW4I26OJBBLWlcWwH83xM1qb0QQRIltFsyEEEt/pp4RjWgjdcDYaO/qi5n7VFAFB+MDhGAu74YJGEn7w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR03MB3998.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(39860400002)(376002)(136003)(396003)(366004)(8676002)(53546011)(31696002)(83380400001)(36756003)(8936002)(31686004)(5660300002)(186003)(110136005)(66556008)(64756008)(54906003)(66446008)(86362001)(6506007)(2906002)(6512007)(966005)(478600001)(316002)(4326008)(76116006)(66476007)(71200400001)(91956017)(66946007)(26005)(6486002)(2616005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: d8Wa17p4Y3wknGBqxlWAcv7NRBAaPW8vDNwumBp9wPXtWgJT5YuhWNb7qYDXccs0Qhes8TPzi2iq0kuIWntUCdpPvZO6o3AGFYt7dVzp9N89heNNPp26upgMQDYrruvyTV/VZJqIQ9elWf5CFJKv6LOGHjYv7Wy1aeLWY4WeWUIIz2OPsLXlrNTtpUiaFItZ2/6W1z0CjKPHk+AfUsRcV71mVGGCxCPTtmGGJ8qMP3ZbM891s9Y4yNBNmijkb5E+NOj/BRgX1IZFTWWIov5Ftghpe+zvldqNeeiYsFyMa0k3GHWr49KMPJA7TatJA7TQKXe0Ai6AgO1jeU/9swN904c/PctD9i9LLEWGQ025Q/nkxPxyrY6Nk9TjYvjhnJlE/B8wf3jLascB6R7voHkHUPvfSAsf61TBh5Axyh2tuBYrlGYtH9de2yW5Tm5+1bKiYRxlYy9ADRLJqdKRpJ2dgV6mRzaPBzgB3KBv6FzY0qo=
Content-Type: text/plain; charset="utf-8"
Content-ID: <981E3D710F5F3041A0ABCD65CBF093C6@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d007dd33-75fd-4648-4c7a-08d8141ef547
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2020 07:04:06.8150 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n0KsntJi0rsIcIv4NeCrZBq/3492dfjZ8LH5h9h/nATfcN2AUJeQj/ogQAG2nh2WLUSxleC0xM/iWWlFhDk6nNk3yLkzFDejGNP4Kr35nFr0yEnW7PwByY5tjfDcKavr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6448
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
 Roman Shaposhnik <roman@zededa.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Nataliya Korovkina <malus.brandywine@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQpPbiA2LzE4LzIwIDU6NTAgUE0sIEp1bGllbiBHcmFsbCB3cm90ZToNCj4NCj4NCj4gT24gMTgv
MDYvMjAyMCAwNjoyMiwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pg0KPj4gT24g
Ni80LzIwIDY6MzEgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4+PiBPbiBUaHUsIDQg
SnVuIDIwMjAsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiBPbiA2LzQvMjAg
NDo1NyBBTSwgUGVuZyBGYW4gd3JvdGU6DQo+Pj4+PiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+Ow0K
Pj4+Pj4+IE5hdGFsaXlhIEtvcm92a2luYSA8bWFsdXMuYnJhbmR5d2luZUBnbWFpbC5jb20+DQo+
Pj4+Pj4gU3ViamVjdDogVUVGSSBzdXBwb3J0IGluIEFSTSBEb21Vcw0KPj4+Pj4gV2UgaGF2ZSBt
YWRlIFUtQm9vdCBydW4gaW5zaWRlIFhFTiBEb21VLCBidXQganVzdCBvbmx5IFBWIGNvbnNvbGUg
cGFydCwNCj4+Pj4+IG5vdCBpbXBsZW1lbnQgb3RoZXIgZnJvbnRlbmQgZHJpdmVycyBjdXJyZW50
bHkuIFdvdWxkIHRoaXMgaGVscCBmb3IgeW91cg0KPj4+Pj4gY2FzZSBpZiBlbmFibGUgRUZJIGlu
IFUtQm9vdD8NCj4+Pj4gV2VsbCwgd2UgaGF2ZSBhIHdvcmtpbmcgUFYgYmxvY2sgaW1wbGVtZW50
YXRpb24gb24gdG9wIG9mIHRoYXQgb24gaU1YOA0KPj4+Pg0KPj4+PiBwbGF0Zm9ybSwgbW9zdGx5
IHBvcnRlZCBmcm9tIG1pbmktb3MuIEN1cnJlbnRseSB3ZSBhcmUgZmluYWxpemluZyB0aGUgd29y
aw0KPj4+Pg0KPj4+PiBhbmQgY2xlYW5pbmcgdXAgKGl0J3MgZ29pbmcgdG8gdGFrZSBhIHdlZWsg
b3Igc28gaG9wZWZ1bGx5KS4gVGhlbiwgd2Ugd2UnbGwgcG9zdA0KPj4+Pg0KPj4+PiBpdCBvbiBv
dXIgcHVibGljIGdpdGh1Yi4gV2UgYXJlIGFsc28gdGhpbmtpbmcgYWJvdXQgdXBzdHJlYW1pbmcg
dGhlIHdvcmssIGJ1dCBpdCBtYXkNCj4+Pj4NCj4+Pj4gdGFrZSBxdWl0ZSBzb21lIHRpbWUgaWYg
dGhlIHdob2xlIGlkZWEgZml0cyB1LWJvb3QncyB2aWV3IG9uIHN1Y2ggYW4gZXh0ZW5zaW9uIGF0
IGFsbC4NCj4+PiBZZXMgcGxlYXNlIHRvIGJvdGggb2YgeW91ISA6LSkNCj4+Pg0KPj4+IEluIHRo
ZSBtZWFudGltZSwgd2hpbGUgd2Ugd2FpdCBmb3IgdGhvc2UgY2hhbmdlcyB0byBnbyB1cHN0cmVh
bSBpbg0KPj4+IHVib290LCBjb3VsZCB5b3UgcGxlYXNlIHBvc3QgYSBicmFuY2ggb24gZ2l0aHVi
IGFuZCBhIGxpbmsgb24gdGhpcyBlbWFpbA0KPj4+IHRocmVhZD8NCj4+DQo+PiBJdCB0b29rIGEg
Yml0IG1vcmUgdGltZSB0aGFuIHdlIGV4cGVjdGVkLCBidXQgaGVyZSB3ZSBnbyBbMV06DQo+Pg0K
Pj4gdGhpcyBpcyBpbiBmb3JtIG9mIGEgcHVsbC1yZXF1ZXN0IGFzIHdlIHdvdWxkIGxvdmUgdG8g
aGVhciBmcm9tIHRoZQ0KPj4NCj4+IGNvbW11bml0eSBhbmQgaXQgaXMgZWFzaWVyIHRvIGRpc2N1
c3MgdGhlIGNvZGUgKHBsZWFzZSBsZWF2ZSBjb21tZW50cyB0aGVyZSkNCj4+DQo+PiAxLiBUaGVy
ZSBpcyBjb2RlIG9yaWdpbmF0aW5nIGZyb20gTWluaU9TIGFuZCB3b3JrIGRvbmUgYnkgUGVuZywg
c28gd2UNCj4+DQo+PiB3b3VsZCBsaWtlIHRvIGFzayB0aGUgcmVzcGVjdGl2ZSBjb3B5cmlnaHQg
b3duZXJzIHRvIHJhaXNlIHRoZWlyIGhhbmRzIGFuZA0KPg0KPiBOb3QgZXZlcnlvbmUgYXJlIGNs
b3NlbHkgd2F0Y2hpbmcgeGVuLWRldmVsLiBTbyBpZiB5b3Ugd2FudCB0byBmaW5kIG91dCB3aG8g
YXJlIHRoZSBjb3B5cmlnaHQgb3duZXJzLCB0aGVuIHlvdXIgYmVzdCBzb2x1dGlvbiBpcyB0byBn
byB0aHJvdWdoIHRoZSBnaXQgbG9nIGFuZCBDQyB0aGUgYXV0aG9ycy4NCg0KV2UgZGlkbid0IHdh
bnQgdG8gY29udGFjdCB0aGUgcmVzcGVjdGl2ZSBhdXRob3JzIGFuZCBjb3B5cmlnaHQgb3duZXJz
IChzb21lIG9mIHRob3NlDQoNCmFyZSBkYXRlZCAyMDA1IG9yIHNvKS4gVGhpcyBpcyB0byBzdHJl
c3MgdGhhdCB3ZSBhcmUgdHJ5aW5nIGhhcmQgdG8gcHV0IGFsbCB0aGUgY29weXJpZ2h0cw0KDQph
bmQgbm90IG1pc3MgYW55b25lOiB0aGVyZSBpcyBubyBpbnRlbnRpb24gdG8gcHV0IG91ciBjb3B5
cmlnaHQgYXQgc29tZSBpbmFwcHJvcHJpYXRlDQoNCnBsYWNlIGFuZCByZW1vdmUgc29tZW9uZXMg
ZWxzZS4NCg0KPg0KPj4NCj4+IGxldCB1cyAqZml4IGluYXBwcm9wcmlhdGUgbGljZW5zaW5nKiBp
ZiBhbnkuDQo+Pg0KPj4gMi4gUGxlYXNlIG5vdGUsIHRoZSBzZXJpZXMgaGFzIGEgSEFDSyB0byBt
b3ZlIHRoZSBSQU0gYmFzZSBhcyBpdCBpcyBleHBlY3RlZCBieQ0KPj4NCj4+IG91ciB0ZXN0IHBs
YXRmb3JtIChpTVg4KSwgc28gb3RoZXJzIHdpbGwgbmVlZCB0byByZW1vdmUgb3IgbW9kaWZ5IHRo
YXQuDQo+Pg0KPj4gMy4gVGhlcmUgaXMgYSBsaW1pdGF0aW9uIGFscmVhZHkgbm90ZWQgYnkgUGVu
ZyB0aGF0IHdlIGRvIG5vdCBoYXZlIHNlcmlhbCBvdXRwdXQNCj4+DQo+PiB1bnRpbCBNTVUgaXMg
c2V0dXAsIHNvIHdlIGhhdmUgaW50cm9kdWNlZCB4ZW5fZWFybHlfcHJpbnRrIGhlbHBlciB3aGlj
aCBhbHdheXMNCj4+DQo+PiB3b3Jrcywgc28geW91IGNhbiB1c2UgdGhhdCBmb3IgZWFybHkgc3Rh
Z2UgZGVidWdnaW5nLg0KPj4NCj4+IDQuIE1pbmltYWwgbWVtb3J5IHNpemUgc3VwcG9ydGVkIGlz
IH4xMjlNIGJlY2F1c2Ugb2YgZHRiIHBsYWNlbWVudCBieSBYZW4gdG9vbHMNCj4NCj4gSG1tbS4u
LiBXaHk/IFdoYXQncyB3cm9uZyB3aXRoIGJvb3RpbmcgYSBndWVzdCB3aXRoIGp1c3QgNjRNQj8N
Cg0KQmVjYXVzZSBvZiB0aGUgYnVnIGluIFUtYm9vdCBbMV06IGl0IHRyaWVzIHRvIHJlYWQgYmV5
b25kIHRoZSBwaHlzaWNhbCBtZW1vcnkgaWYgZ3Vlc3QNCg0KaGFzIGxlc3MgdGhhbiAxMjhNKyBh
cyBvbmx5IHRoZW4gWGVuIHRvb2xzIHB1dCB0aGUgZmR0IGF0IDEyOE0gYW5kIG5vdCBhdCB0aGUg
UkFNIGVuZC4NCg0KPg0KPj4NCj4+IDUuIFdlIHVzZSAtRF9fWEVOX18gdG8gYWNjZXNzIHNvbWUg
b2YgdGhlIGhpZGRlbiBkZWZpbmVzIHdlIG5lZWQgc3VjaCBhcw0KPj4NCj4+IEdVRVNUX1JBTTBf
QkFTRSBhbmQgdGhlIGZyaWVuZHMgYXMgdGhlcmUgaXMgbm8gb3RoZXIgd2F5IGJ1dCBtYW51YWxs
eSBkZWZpbmluZyB0aGUNCj4+DQo+PiBzYW1lIHdoaWNoIGlzIG5vdCBjdXRlLg0KPg0KPiBJIGhh
dmUgcmVwbGllZCB0byB0aGlzIGluIHRoZSBwdWxsIHJlcXVlc3QuIEJ1dCBJIHdhbnQgdG8gYnJp
bmcgdGhlIGNvbnZlcnNhdGlvbiBoZXJlIHRvIGhhdmUgYSB3aWRlciBkaXNjdXNzaW9uLg0KPg0K
PiBGb3IgYSBmaXJzdCwgX19YRU5fXyBzaG91bGQgcmVhbGx5IG9ubHkgYmUgZGVmaW5lZCBieSB0
aGUgaHlwZXJ2aXNvciBhbmQgbm90IHVzZWQgYnkgdGhlIGd1ZXN0LiBUaGlzIGlzIHVzZWQgdG8g
Z2F0ZSBub24tc3RhYmxlIEFCSSAoc3VjaCBhcyB0aGUgdG9vbHMpIGFuZCBhbnl0aGluZyBiZWhp
bmQgaXQgaGFzbid0IGJlZW4gdmV0dGVkIHRvIHdvcmsgaW4gb3RoZXIgYnVpbGQgY29uZmlndXJh
dGlvbiB0aGF0IHRoZSBvbmUgdXNlZCBieSBYZW4uDQo+DQo+IEluIGdlbmVyYWwsIHdlIGV4cGVj
dCB0aGUgZ3Vlc3QgdG8gZGlzY292ZXIgZXZlcnl0aGluZyBmb3IgdGhlIGRldmljZS10cmVlIGJl
Y2F1c2UgdGhlIG1lbW9yeSBsYXlvdXQgaXMgbm90IHN0YWJsZSAod2Ugd2FudCB0byBiZSBhYmxl
IHRvIHJlc2h1ZmZsZSBhcyB3ZSBhZGQgbW9yZSBmZWF0dXJlcykuDQo+DQo+IEkga25vdyB0aGF0
IEVESzIvVGlhbm9jb3JlIGNhbiBiZSBidWlsdCBvbmNlIGFuZCB3b3JrIG9uIGV2ZXJ5IFhlbiBj
b25maWd1cmF0aW9uLiBJdCB3b3VsZCBiZSBpZGVhbCB0aGF0IFUtYm9vdCBmb2xsb3cgdGhlIHNh
bWUuIElmIGl0IGlzIHJlYWxseSBub3QgcG9zc2libGUsIHRoZW4gd2Ugc2hvdWxkIGV4cGxvcmUg
YSBwYXRoIHRoYXQgaXMgcHJldmVudGluZyB0byBkZWZpbmUgX19YRU5fXy4NCj4NCj4gSG93IG11
Y2ggZG9lcyBVLWJvb3QgZXhwZWN0IHRvIGtub3cgYWJvdXQgdGhlIG1lbW9yeSBsYXlvdXQ/IERv
ZXMgaXQgcmVxdWlyZSB0byBrbm93IGFsbCB0aGUgbWVtb3J5IGJhbmtzPyBPciB3b3VsZCBpdCBi
ZSBzdWZmaWNpZW50IGZvciBpdCB0byBrbm93IHRoZSBzdGFydCBhZGRyZXNzIG9mIHRoZSBmaXJz
dCBiYW5rIGFuZCB0aGUgbWluaW11bSBvZiBSQU0/DQo+DQo+IENoZWVycywNCj4NClsxXSBodHRw
czovL2dpdGh1Yi5jb20veGVuLXRyb29wcy91LWJvb3QvcHVsbC8xL2NvbW1pdHMvOWM2MzliZDUx
NDk2MWU3MGNmYjJlYmVkOWQ4YmFkYjdiMjJkMjFhYg==

