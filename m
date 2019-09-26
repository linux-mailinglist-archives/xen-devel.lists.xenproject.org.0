Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B9EBEF73
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 12:20:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQpp-0006lH-DR; Thu, 26 Sep 2019 10:17:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=s+5F=XV=epam.com=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1iDQpo-0006lC-5z
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 10:17:16 +0000
X-Inumbo-ID: cfa5b61c-e046-11e9-b588-bc764e2007e4
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe07::629]) by localhost (Halon) with ESMTPS
 id cfa5b61c-e046-11e9-b588-bc764e2007e4;
 Thu, 26 Sep 2019 10:17:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n91qe1MBcgqc5UvUutJOk6jBIH/qsdLyeEzZZ8BfqWfvMLHVZnGYj/bfet42Bj02gAuw43EH5Arjplrf5UG0k+zBXkaBSFbSNekMGLP3H3w3/kRr7EbBIXxySWamdc0n6Tvv/+4HxEWj37+dghW893o3pwyAh0I43jXYp158T1Q6sn488P5KtxtfaDFb7r7njccNCIv4258+j9JIfwi6QDiEAJMJVLbX421vpjtKinWhlyX6mAQQafVm1kSUDBwuqPLbYqxjLIv3wBKzuy6n0aU0sH0pm7LuMNSPEqgnwy0Ey/i3gfNnnVcM76T15RiJk4WeqJYXswy5C/8ACmggFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c0LLwycakkjnsZodPYRx8JwmRKzE1nVFPfZLQlrJMjc=;
 b=DtkEmFun1a/zzcYrCHGIDBIpKEjyk+vC/PiqFg7jSm4CHOwPbOxkQfd2yTRRQxjxfJpKuVFbfy+D/vWozm1PbRhk7cMb3Ow+2vqWA7D2L71fAabLOdjWHm/KdafqXHspDcvzoNP4xGDC2e8eho/bFchu70vLyNhDg3H9JfOvZq54mvbpPT9qEPHJtGjngZjDyb+F7k3+7/RIrsmlLIU5IXLtdIbQ8RLYP0gvSugjNYCqslCls3r//TEkpFTPSdX2I4XE9cae95tXTmISmsYubUTCgZl30qjJ2yLQTtawzLvSfaj39YhqjbhRyrHtG+OIYRxElf3cw7JR8q/TH9aV8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c0LLwycakkjnsZodPYRx8JwmRKzE1nVFPfZLQlrJMjc=;
 b=XQsQrvN2J/bsT6Hj+m2s8f6AByDLIiq3/niGOel7XAQcIfOQCl3CWiMG6zB063SM8PLzLJdJOQc0WrfILXC/qG/pchJYC4xOX5yoQNCXYOXxY9nOQ+cG0tSVkIDL3H6WiRHy2yeimnJuWTk3F1sHziYj88JF3mxcFuF+9DjNTkI=
Received: from AM6PR03MB5958.eurprd03.prod.outlook.com (10.255.122.93) by
 AM6PR03MB5186.eurprd03.prod.outlook.com (10.255.22.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Thu, 26 Sep 2019 10:17:14 +0000
Received: from AM6PR03MB5958.eurprd03.prod.outlook.com
 ([fe80::f9b6:8b16:c5a6:6f47]) by AM6PR03MB5958.eurprd03.prod.outlook.com
 ([fe80::f9b6:8b16:c5a6:6f47%7]) with mapi id 15.20.2284.023; Thu, 26 Sep 2019
 10:17:13 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Julien Grall <julien.grall@arm.com>, Rob Herring <robh@kernel.org>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>
Thread-Topic: [RFC PATCH] xen/gntdev: Stop abusing DT of_dma_configure API
Thread-Index: AQHVc+s0RRpCCJNN+0uv/ZIcTqnc7ac9t66AgAAHl4A=
Date: Thu, 26 Sep 2019 10:17:13 +0000
Message-ID: <1ae7f42e-bf93-b335-b543-653fae5cf49f@epam.com>
References: <20190925215006.12056-1-robh@kernel.org>
 <e898c025-32a7-1d2c-3501-c99556f7cdd4@arm.com>
In-Reply-To: <e898c025-32a7-1d2c-3501-c99556f7cdd4@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Oleksandr_Andrushchenko@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fd330316-2f16-49df-b989-08d7426ab361
x-ms-traffictypediagnostic: AM6PR03MB5186:
x-ms-exchange-purlcount: 4
x-microsoft-antispam-prvs: <AM6PR03MB518652F6C9D88210246D41F2E7860@AM6PR03MB5186.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(39860400002)(396003)(376002)(136003)(54014002)(199004)(189003)(110136005)(11346002)(2616005)(31686004)(5660300002)(486006)(66066001)(446003)(3846002)(6512007)(186003)(71190400001)(71200400001)(966005)(99286004)(26005)(8936002)(478600001)(25786009)(7416002)(6116002)(6306002)(7736002)(305945005)(55236004)(102836004)(31696002)(66946007)(76116006)(91956017)(14454004)(76176011)(66556008)(64756008)(66446008)(6246003)(6506007)(53546011)(8676002)(86362001)(229853002)(4326008)(80792005)(81156014)(6486002)(81166006)(476003)(256004)(6436002)(66476007)(316002)(2906002)(36756003)(14444005)(54906003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR03MB5186;
 H:AM6PR03MB5958.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5Y5iOpiu/QLMTfToQkdqN8soCmGe4LVvl4cAO32VaUTVDUtK9iGMjYEmouxzsUnUyVqeV2ixXkTUdIrsQCoz08mdhgHx9h8EdeQZarYlBqwGuRr7myA7LP0TBHIwtNvKGfMS2hQj4//oOnzM6UoINNmYhfiPWgYLTDbO5iid8zS25l9EJ6X1R1lbVtcVbJ5bHbu+RZH28ke9//CD3d75KYOZALW9FmiIXQeKhoQJjFgH9V6I6n0qd83iW0ug/rXvqxs7r0sbC1d5ST0wo6doIgiHTBuyIDj4AemqIYNU2xYazc0HU0/prqpU9b0HPJ2XDkpTTva+VbalRhLOZmq5TEFEdrY/XsCwgdAKK4anNFSUNmM7WOScPPWi+3vseL7IoQWh92D+cnLwZoup3DbJ7CO6oVm/+FlyXWsBxZ0LQGZncK4RKYawf4urx2VEv78ghSzqtyy3n0yiHwxr3lxPeQ==
x-ms-exchange-transport-forked: True
Content-ID: <AC2CE0BCFB3E234B9364259F7117DC8C@eurprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd330316-2f16-49df-b989-08d7426ab361
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 10:17:13.8757 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zGukmQ1TTQ8r/wvMkrzxqWqXBQYVJLJ5XuMNnTEfWm4TApQeH+WxALy9dsdlBAdNXP982OMsmh1oINp+VIMzSzNoyGXJ93heoGf/kMrwFNGAjhFKUB3EUFmqWV4/hxee
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB5186
Subject: Re: [Xen-devel] [RFC PATCH] xen/gntdev: Stop abusing DT
 of_dma_configure API
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <andr2000@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQpPbiA5LzI2LzE5IDEyOjQ5IFBNLCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+IEhpIFJvYiwNCj4N
Cj4NCj4gT24gOS8yNS8xOSAxMDo1MCBQTSwgUm9iIEhlcnJpbmcgd3JvdGU6DQo+PiBBcyB0aGUg
Y29tbWVudCBzYXlzLCB0aGlzIGlzbid0IGEgRFQgYmFzZWQgZGV2aWNlLiBvZl9kbWFfY29uZmln
dXJlKCkNCj4+IGlzIGdvaW5nIHRvIHN0b3AgYWxsb3dpbmcgYSBOVUxMIERUIG5vZGUsIHNvIHRo
aXMgbmVlZHMgdG8gYmUgZml4ZWQuDQo+DQo+IEFuZCB0aGlzIGNhbid0IHdvcmsgb24gYXJjaCBu
b3Qgc2VsZWN0aW5nIENPTkZJR19PRiBhbmQgY2FuIHNlbGVjdCANCj4gQ09ORklHX1hFTl9HUkFO
VF9ETUFfQUxMT0MuDQo+DQo+IFdlIGFyZSBsdWNreSBlbm91Z2ggb24geDg2IGJlY2F1c2UsIEFG
QUlDVCwgYXJjaF9zZXR1cF9kbWFfb3BzIGlzIGp1c3QgDQo+IGEgbm9wLg0KPg0KTm8gbHVjayBp
cyBuZWVkZWQgYXMgWzFdIGRvZXMgbm90aGluZyBmb3IgdGhvc2UgcGxhdGZvcm1zIG5vdCB1c2lu
ZyANCkNPTkZJR19PRg0KPj4NCj4+IE5vdCBzdXJlIGV4YWN0bHkgd2hhdCBzZXR1cCBiZXNpZGVz
IGFyY2hfc2V0dXBfZG1hX29wcyBpcyBuZWVkZWQuLi4NCj4NCj4gV2UgcHJvYmFibHkgd2FudCB0
byB1cGRhdGUgZG1hX21hc2ssIGNvaGVyZW50X2RtYV9tYXNrIGFuZCANCj4gZG1hX3Bmbl9vZmZz
ZXQuDQo+DQo+IEFsc28sIHdoaWxlIGxvb2sgYXQgb2ZfY29uZmlndXJlX2RtYSwgSSBub3RpY2Vk
IHRoYXQgd2UgY29uc2lkZXIgdGhlIA0KPiBETUEgd2lsbCBub3QgYmUgY29oZXJlbnQgZm9yIHRo
ZSBncmFudC10YWJsZS4gT2xla3NhbmRyLCBkbyB5b3Uga25vdyANCj4gd2h5IHRoZXkgY2FuJ3Qg
YmUgY29oZXJlbnQ/DQpUaGUgbWFpbiBhbmQgdGhlIG9ubHkgcmVhc29uIHRvIHVzZSBvZl9jb25m
aWd1cmVfZG1hIGlzIHRoYXQgaWYgd2UgZG9uJ3QgDQp0aGVuIHdlDQphcmUgYWJvdXQgdG8gc3Rh
eSB3aXRoIGRtYV9kdW1teV9vcHMgWzJdLiBJdCBlZmZlY3RpdmVseSBtZWFucyB0aGF0IA0Kb3Bl
cmF0aW9ucyBvbiBkbWEtYnVmcw0Kd2lsbCBlbmQgdXAgcmV0dXJuaW5nIGVycm9ycywgbGlrZSBb
M10sIFs0XSwgdGh1cyBub3QgbWFraW5nIGl0IHBvc3NpYmxlIA0KZm9yIFhlbiBQViBEUk0gYW5k
IERNQQ0KcGFydCBvZiBnbnRkZXYgZHJpdmVyIHRvIGRvIHdoYXQgd2UgbmVlZCAoZG1hLWJ1ZnMg
aW4gb3VyIHVzZS1jYXNlcyANCmFsbG93IHplcm8tY29weWluZw0Kd2hpbGUgdXNpbmcgZ3JhcGhp
Y3MgYnVmZmVycyBhbmQgbWFueSBtb3JlKS4NCg0KSSBkaWRuJ3QgZmluZCBhbnkgYmV0dGVyIHdh
eSBvZiBhY2hpZXZpbmcgdGhhdCwgYnV0IG9mX2NvbmZpZ3VyZV9kbWEuLi4NCklmIHRoZXJlIGlz
IGFueSBiZXR0ZXIgc29sdXRpb24gd2hpY2ggd2lsbCBub3QgYnJlYWsgdGhlIGV4aXN0aW5nIA0K
ZnVuY3Rpb25hbGl0eSB0aGVuDQpJIHdpbGwgZGVmaW5pdGVseSBjaGFuZ2UgdGhlIGRyaXZlcnMg
c28gd2UgZG8gbm90IGFidXNlIERUICkNCkJlZm9yZSB0aGF0LCBwbGVhc2Uga2VlcCBpbiBtaW5k
IHRoYXQgbWVyZ2luZyB0aGlzIFJGQyB3aWxsIGJyZWFrIFhlbiBQViANCkRSTSArDQpETUEgYnVm
IHN1cHBvcnQgaW4gZ250ZGV2Li4uDQpIb3BlIHdlIGNhbiB3b3JrIG91dCBzb21lIGFjY2VwdGFi
bGUgc29sdXRpb24sIHNvIGV2ZXJ5b25lIGlzIGhhcHB5DQo+DQo+IENoZWVycywNCj4NCg0KVGhh
bmsgeW91LA0KT2xla3NhbmRyDQoNClsxXSANCmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xp
bnV4L3Y1LjMuMS9zb3VyY2UvaW5jbHVkZS9saW51eC9vZl9kZXZpY2UuaCNMMTA5DQpbMl0gaHR0
cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjUuMy4xL3NvdXJjZS9rZXJuZWwvZG1hL2R1
bW15LmMjTDMzDQpbM10gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjUuMy4xL3Nv
dXJjZS9rZXJuZWwvZG1hL2R1bW15LmMjTDExDQpbNF0gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5j
b20vbGludXgvdjUuMy4xL3NvdXJjZS9rZXJuZWwvZG1hL2R1bW15LmMjTDE4Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
