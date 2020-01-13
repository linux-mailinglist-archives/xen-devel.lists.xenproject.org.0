Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7D1138DCD
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2020 10:29:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iqvyw-00019e-2W; Mon, 13 Jan 2020 09:25:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ljre=3C=virtuozzo.com=vsementsov@srs-us1.protection.inumbo.net>)
 id 1iqvyv-00019W-BZ
 for xen-devel@lists.xenproject.org; Mon, 13 Jan 2020 09:25:57 +0000
X-Inumbo-ID: b247f60d-35e6-11ea-8237-12813bfff9fa
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.90]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b247f60d-35e6-11ea-8237-12813bfff9fa;
 Mon, 13 Jan 2020 09:25:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KfjaXJWrFcQZ/rOoOiVALmAbQua2rXoMMoQFV4Bz08Le63PCe2EgMJdGd7SBls00Wabw0kTqonHddxQhz+xa+KEUL/eQcC+vkzlUauV1bZ4ahKo2A4iwRpJOkzhSU6QpKC5myFinE4DXvkuBuLXL0s/wy0ND/FgnY3WNORbBBwj/T5gpjJpnAKqJ/fjgFTSN2H+L3ei2mk+rWo5/hCuNz3T/JvvcrmPWHO0/WzLcP8ObaCzaRePycBAnnua5crKfgCnenUPTkY5qe0Rc6X/iARU9BiZ2kBla171zaV/PYTMjkrQ3IGUhpaxnycrkxK9bZuWKxobVtEjhimAOM+JUIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S2lr5MkbpZ7xdcDBroSFNykyh0X00h4FNd25APfKBV4=;
 b=LJX/dmRKMHxa2PCTuoK7tBf+8WUaTZv96FhrofOYPGOebxM1iAbMbw0qgPfV04DygzB9KaYxdcQF02pkjgBdsWxe/buhOch/vFeggc+zU8DqFkKHzZ6uYBzWoN0Jz9Hg6j4ZPUq9Q5KILQUbozC2mo2xPaQ1m+WOhT2mXsvY7qKhcph7yK8gPgAG4nErqPgU1wKIuLTBaOqd3gwtmJbToKqd73pbGRI+5dgYy5Yd606bhxi+o/IF6ryJaCg03cJHNWlPyqSuTMssvoyBcU5zhlEWVGhtEMxJcYghqZxdNytdOBs5o4spySC2I8pquBZJTsC15l2xhC2iMs/1t6pWZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S2lr5MkbpZ7xdcDBroSFNykyh0X00h4FNd25APfKBV4=;
 b=YGJMJ4ay/T87Ye0YMCAMt/E7GHfXfAfQSNxKsaakXd6/nr57c6j1cud1y++HjLZzjALBj8ccf7AVA/ZOjIK8Pu0huTIUdFfgClvRVrdDvIwOUmHpqmLfqGCFiI5ADL9AhcMSvezYrKlIrCvFLIUyNzGnzTRAzZOWpnZ0ylzeMbg=
Received: from AM6PR08MB4423.eurprd08.prod.outlook.com (20.179.7.140) by
 AM6PR08MB2984.eurprd08.prod.outlook.com (52.135.168.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.10; Mon, 13 Jan 2020 09:25:54 +0000
Received: from AM6PR08MB4423.eurprd08.prod.outlook.com
 ([fe80::11a9:a944:c946:3030]) by AM6PR08MB4423.eurprd08.prod.outlook.com
 ([fe80::11a9:a944:c946:3030%7]) with mapi id 15.20.2623.015; Mon, 13 Jan 2020
 09:25:54 +0000
Received: from [172.16.24.200] (185.231.240.5) by
 HE1PR05CA0246.eurprd05.prod.outlook.com (2603:10a6:3:fb::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.9 via Frontend Transport; Mon, 13 Jan 2020 09:25:53 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Paul Durrant <pdurrant@gmail.com>
Thread-Topic: [PATCH v6 11/11] xen: introduce ERRP_AUTO_PROPAGATE
Thread-Index: AQHVx+4SemIU9UZ3f0OF7z9Sc9J7KafoTvyAgAAIDIA=
Date: Mon, 13 Jan 2020 09:25:53 +0000
Message-ID: <49078ae2-8bf4-5954-8ddc-9a0a37b51448@virtuozzo.com>
References: <20200110194158.14190-1-vsementsov@virtuozzo.com>
 <20200110194158.14190-12-vsementsov@virtuozzo.com>
 <CACCGGhA78D7TVQdj-wrr=hWmFN+kefS_7zLm4UHBkx0ZHh8maA@mail.gmail.com>
In-Reply-To: <CACCGGhA78D7TVQdj-wrr=hWmFN+kefS_7zLm4UHBkx0ZHh8maA@mail.gmail.com>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR05CA0246.eurprd05.prod.outlook.com
 (2603:10a6:3:fb::22) To AM6PR08MB4423.eurprd08.prod.outlook.com
 (2603:10a6:20b:bf::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vsementsov@virtuozzo.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20200113122551944
x-originating-ip: [185.231.240.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 926d5e9f-3202-4505-cc22-08d7980a9688
x-ms-traffictypediagnostic: AM6PR08MB2984:
x-microsoft-antispam-prvs: <AM6PR08MB2984990DA88495DB7B5609BFC1350@AM6PR08MB2984.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2150;
x-forefront-prvs: 028166BF91
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(346002)(136003)(366004)(396003)(39840400004)(189003)(199004)(956004)(2906002)(2616005)(86362001)(316002)(16576012)(6486002)(54906003)(4326008)(6916009)(31696002)(52116002)(5660300002)(16526019)(186003)(31686004)(8676002)(26005)(478600001)(8936002)(81156014)(81166006)(71200400001)(36756003)(66476007)(66946007)(66556008)(64756008)(7416002)(66446008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR08MB2984;
 H:AM6PR08MB4423.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: virtuozzo.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: burMEkVe/UoF91imbmpJHzuvspK047B9d+oDm+3mZ0Mg0u8eBhAigXUF0EeW9mL29ym4yhGVnitdZBF6KYm76ao+99KZB4K5hGZ9IcLlRT4zPSjNG01yFOUdetxLd1fBEmv7gqjK7qtkHfnB/PCQ5RofSV9RSom8CZO0ZYZaLZe2crsMUqIL6hrmQdaLNwaXzpKnKTxDVYLLw7S4hmPmpgKcg45z3vGXtNbkYwoKn1ydQ0wajBhHOzGmOO6SYtj/UUG3Yn18oS1tJF4ITFzy2YPrPqJHf9DG8J0l2hEf7Ix2lK/5v5wM7Sgt4X/t8lAnPaMdPb8/lDTk/JugTd5OhF4gjaIU+HGlHwVdo9jHuccYuFT330FKyheqcQ5q5CwRtTYT9W7G51ECr2hHgKBRQ7QghGmQP7GVwVyB7SE9bN0dw9hbbW/qqqozLKj+0wg1
x-ms-exchange-transport-forked: True
Content-ID: <C732D7885F439041906D1470C51AD457@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 926d5e9f-3202-4505-cc22-08d7980a9688
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2020 09:25:53.9696 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eG/MLihHxjGJPC7lr47UcupSM1wK0d3dMBVgOYatejHjBvxwr+0baHi7HbVnDA4qKTYBtkVhHR77D71uJ4+i2xdDDBVfFQpLulM0N604lgA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB2984
Subject: Re: [Xen-devel] [PATCH v6 11/11] xen: introduce ERRP_AUTO_PROPAGATE
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Max Reitz <mreitz@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

MTMuMDEuMjAyMCAxMTo1NywgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiBPbiBGcmksIDEwIEphbiAy
MDIwIGF0IDE5OjQyLCBWbGFkaW1pciBTZW1lbnRzb3YtT2dpZXZza2l5DQo+IDx2c2VtZW50c292
QHZpcnR1b3p6by5jb20+IHdyb3RlOg0KPj4NCj4+IElmIHdlIHdhbnQgdG8gYWRkIHNvbWUgaW5m
byB0byBlcnJwIChieSBlcnJvcl9wcmVwZW5kKCkgb3INCj4+IGVycm9yX2FwcGVuZF9oaW50KCkp
LCB3ZSBtdXN0IHVzZSB0aGUgRVJSUF9BVVRPX1BST1BBR0FURSBtYWNyby4NCj4+IE90aGVyd2lz
ZSwgdGhpcyBpbmZvIHdpbGwgbm90IGJlIGFkZGVkIHdoZW4gZXJycCA9PSAmZXJyb3JfZmF0YWwN
Cj4+ICh0aGUgcHJvZ3JhbSB3aWxsIGV4aXQgcHJpb3IgdG8gdGhlIGVycm9yX2FwcGVuZF9oaW50
KCkgb3INCj4+IGVycm9yX3ByZXBlbmQoKSBjYWxsKS4gIEZpeCBzdWNoIGNhc2VzLg0KPj4NCj4+
IElmIHdlIHdhbnQgdG8gY2hlY2sgZXJyb3IgYWZ0ZXIgZXJycC1mdW5jdGlvbiBjYWxsLCB3ZSBu
ZWVkIHRvDQo+PiBpbnRyb2R1Y2UgbG9jYWxfZXJyIGFuZCB0aGVuIHByb3BhZ2F0ZSBpdCB0byBl
cnJwLiBJbnN0ZWFkLCB1c2UNCj4+IEVSUlBfQVVUT19QUk9QQUdBVEUgbWFjcm8sIGJlbmVmaXRz
IGFyZToNCj4+IDEuIE5vIG5lZWQgb2YgZXhwbGljaXQgZXJyb3JfcHJvcGFnYXRlIGNhbGwNCj4+
IDIuIE5vIG5lZWQgb2YgZXhwbGljaXQgbG9jYWxfZXJyIHZhcmlhYmxlOiB1c2UgZXJycCBkaXJl
Y3RseQ0KPj4gMy4gRVJSUF9BVVRPX1BST1BBR0FURSBsZWF2ZXMgZXJycCBhcyBpcyBpZiBpdCdz
IG5vdCBOVUxMIG9yDQo+PiAgICAgJmVycm9yX2ZhdGFsLCB0aGlzIG1lYW5zIHRoYXQgd2UgZG9u
J3QgYnJlYWsgZXJyb3JfYWJvcnQNCj4+ICAgICAod2UnbGwgYWJvcnQgb24gZXJyb3Jfc2V0LCBu
b3Qgb24gZXJyb3JfcHJvcGFnYXRlKQ0KPj4NCj4+IFRoaXMgY29tbWl0IGlzIGdlbmVyYXRlZCBi
eSBjb21tYW5kDQo+Pg0KPj4gICAgICBzZWQgLW4gJy9eWDg2IFhlbiBDUFVzJC8sL14kL3tzL15G
OiAvL3B9JyBNQUlOVEFJTkVSUyB8IFwNCj4+ICAgICAgeGFyZ3MgZ2l0IGxzLWZpbGVzIHwgZ3Jl
cCAnXC5baGNdJCcgfCBcDQo+PiAgICAgIHhhcmdzIHNwYXRjaCBcDQo+PiAgICAgICAgICAtLXNw
LWZpbGUgc2NyaXB0cy9jb2NjaW5lbGxlL2F1dG8tcHJvcGFnYXRlZC1lcnJwLmNvY2NpIFwNCj4+
ICAgICAgICAgIC0tbWFjcm8tZmlsZSBzY3JpcHRzL2NvY2NpLW1hY3JvLWZpbGUuaCBcDQo+PiAg
ICAgICAgICAtLWluLXBsYWNlIC0tbm8tc2hvdy1kaWZmIC0tbWF4LXdpZHRoIDgwDQo+Pg0KPj4g
UmVwb3J0ZWQtYnk6IEtldmluIFdvbGYgPGt3b2xmQHJlZGhhdC5jb20+DQo+PiBSZXBvcnRlZC1i
eTogR3JlZyBLdXJ6IDxncm91Z0BrYW9kLm9yZz4NCj4+IFNpZ25lZC1vZmYtYnk6IFZsYWRpbWly
IFNlbWVudHNvdi1PZ2lldnNraXkgPHZzZW1lbnRzb3ZAdmlydHVvenpvLmNvbT4NCj4gDQo+IEFj
a2VkLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWxAeGVuLm9yZz4NCj4gDQoNClRoYW5rcyENCg0KLS0g
DQpCZXN0IHJlZ2FyZHMsDQpWbGFkaW1pcg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
