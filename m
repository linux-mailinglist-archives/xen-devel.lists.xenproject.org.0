Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9083711407F
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 13:04:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icpoT-0005Pq-Ai; Thu, 05 Dec 2019 12:00:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T9O8=Z3=virtuozzo.com=vsementsov@srs-us1.protection.inumbo.net>)
 id 1icnb5-0000sH-Rb
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2019 09:38:56 +0000
X-Inumbo-ID: 0b98a688-1743-11ea-8219-12813bfff9fa
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.2.115]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0b98a688-1743-11ea-8219-12813bfff9fa;
 Thu, 05 Dec 2019 09:38:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lgbmmPUW15cSoetFA3ZWreoJdiz/el29JWIPI5TnrdMeYgIX+sd9bf/Z0pacAEOnB1Tv73bj/P97RyVIVJpfnCvXqXqzUzjFaJTvEUTw7ZrYka38MboYkwoTH+GmIGwqKUPNSna/tjXkEYcztZDGbr2P2JiXuWeKzcqXsz6HnQWwZB9ipAROkn1LX28j2a5P84z2ZNC7eIqsBd9HGKBN/E0tNmll6rNEn7KiqwdICyuZ3lidcgj+moP4HcsJ2S6TDyRPzVZ92IbocUS53ugSiMGCOgJxURTLNYH0hINNl9lcTAwI5i2/o23N1embqUJj6QbPoZ/GRlE/h09Si+PYNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ia1p69Vw40bANxIuoeSQaYjHJYbA1cGLl9V08AlorT0=;
 b=WloxzEqTOA/f84qsLhHHAWfUySOH3TbQFjj9G+L3uI1g/YScEiCurtcd0qSiw40nTE5gINNaJOF44xbQPY7tmpn0DDSUAlPLDb21I0yMG4A5DaChi+iFnMjmNK2dI50ihv6m8aA37nQjVqvQ4FrO5pViRsnt9QzQi/eIIkpdseIJjRJ3XwSGASTngdmiULfV84Y0oG4FSfXkTRN430N9xsIEdwX5N+SKgAShYu/7uTzcuuEEd8DF6vTE6S5jibEHCaVxn3TcBza9cb7TE8D0jWpWj6Idva/b9fUoSV7vOnmrCOL9lW31L1wHneXTzG1l9pI2oirOyMhuEsc+T1Y73Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ia1p69Vw40bANxIuoeSQaYjHJYbA1cGLl9V08AlorT0=;
 b=QkLJr1FNVx7QQXGiFeXr2rmDS+fqIScBFoDPV9YYNcF1JAVQp8PojDKXhry5FVGRDXxPRnTAbK9NcvuoqpkivztsKd4z0hRluXFSdpwcg3YM09jmG7I7q1S6aB1zU4zd+fcWWp1u0DGJj70k7p08wRVcj6h/CWweHP1c+P4vYJQ=
Received: from AM6PR08MB4423.eurprd08.prod.outlook.com (20.179.7.140) by
 AM6PR08MB5157.eurprd08.prod.outlook.com (10.255.121.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18; Thu, 5 Dec 2019 09:38:49 +0000
Received: from AM6PR08MB4423.eurprd08.prod.outlook.com
 ([fe80::11a9:a944:c946:3030]) by AM6PR08MB4423.eurprd08.prod.outlook.com
 ([fe80::11a9:a944:c946:3030%7]) with mapi id 15.20.2516.014; Thu, 5 Dec 2019
 09:38:49 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Markus Armbruster <armbru@redhat.com>
Thread-Topic: [RFC v5 024/126] error: auto propagated local_err
Thread-Index: AQHVgE3c5dwPNEl0z0OyUhbNfTU1EqeqZpzagAE4WYA=
Date: Thu, 5 Dec 2019 09:38:49 +0000
Message-ID: <55393c08-5bda-8042-1a95-f350b3781d99@virtuozzo.com>
References: <20191011160552.22907-1-vsementsov@virtuozzo.com>
 <20191011160552.22907-25-vsementsov@virtuozzo.com>
 <87muc8p24w.fsf@dusky.pond.sub.org>
In-Reply-To: <87muc8p24w.fsf@dusky.pond.sub.org>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0902CA0025.eurprd09.prod.outlook.com
 (2603:10a6:7:15::14) To AM6PR08MB4423.eurprd08.prod.outlook.com
 (2603:10a6:20b:bf::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vsementsov@virtuozzo.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20191205123843275
x-originating-ip: [185.231.240.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 131543c0-e3c1-4dcb-969f-08d77966eea0
x-ms-traffictypediagnostic: AM6PR08MB5157:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR08MB5157CBF8A895803EB98637F6C15C0@AM6PR08MB5157.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 02426D11FE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(366004)(39850400004)(346002)(376002)(396003)(199004)(189003)(76176011)(6512007)(66476007)(7406005)(4326008)(102836004)(229853002)(186003)(36756003)(81156014)(7336002)(86362001)(66946007)(31696002)(2906002)(305945005)(99286004)(6916009)(71200400001)(6486002)(7366002)(5660300002)(14444005)(54906003)(6506007)(52116002)(64756008)(71190400001)(316002)(26005)(66446008)(81166006)(14454004)(478600001)(66574012)(8936002)(66556008)(8676002)(11346002)(25786009)(2616005)(31686004)(7416002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR08MB5157;
 H:AM6PR08MB4423.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: virtuozzo.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lirdQib7k4PxnfJ+vDdfG+yoKfBMvF4GgPpvWhMQUT0OjE0FJX8JlYokHPfK19o4lkhN46RptVNpTH46xCbgsUSlu4HW7pT/mTXWE2Ivjb9TIKQM60Xp9egWPpu7FgGhFnUeLR/J8tkz26wmrPQL8x5GVpHOMYohnrevfPycAfltZubsAwbYR0jeosKm2A+Tym+xLSHYzSr7tvscIcUV90NCxgBo/dRUjGmW3eSGBxxRsir01a87oMmdHFKEzdwFllCk8jWjeZPfimUz/GmQaQmWRGBYb8Zo4y69kssEyGDZr/swePPikZegCQopC+WbgPET2HP73mC61kKF2TxUn+k3k222tNl0x0IJkLm5k342mLCWw3DUMaSKszKtTtZeI3GY86fccMxEryDNtKlwkjIc8KsAOD4q+9sHMeP9AYYZa3xBoEgH/GTrzKqGdjbL
Content-ID: <CA36B47A479D8E409B4F581AE63E4D0A@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 131543c0-e3c1-4dcb-969f-08d77966eea0
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2019 09:38:49.7229 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LhcoyOJ5bEmmfrdgXnTpGdf1tL/cuSq/l6GPmhOsKiruDJsofxQBmJwqa3tEeYao5TbvIg7vA83OWS2QxenMON/C14K7RKKqDOdqwBaJ4hw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5157
X-Mailman-Approved-At: Thu, 05 Dec 2019 12:00:51 +0000
Subject: Re: [Xen-devel] [RFC v5 024/126] error: auto propagated local_err
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
Cc: Ronnie Sahlberg <ronniesahlberg@gmail.com>, Jeff Cody <codyprime@gmail.com>,
 Jan Kiszka <jan.kiszka@siemens.com>, Alberto Garcia <berto@igalia.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, Halil Pasic <pasic@linux.ibm.com>,
 =?utf-8?B?SGVydsOpIFBvdXNzaW5lYXU=?= <hpoussin@reactos.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Laszlo Ersek <lersek@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, Peter Lieven <pl@kamp.de>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Chris Wulff <crwulff@gmail.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Michael Walle <michael@walle.cc>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Igor Mammedov <imammedo@redhat.com>, Fam Zheng <fam@euphon.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 "sheepdog@lists.wpkg.org" <sheepdog@lists.wpkg.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Palmer Dabbelt <palmer@sifive.com>, Eric Farman <farman@linux.ibm.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Hannes Reinecke <hare@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, "Gonglei
 \(Arei\)" <arei.gonglei@huawei.com>, Liu Yuan <namei.unix@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Amit Shah <amit@kernel.org>, Stefan Weil <sw@weilnetz.de>,
 Greg Kurz <groug@kaod.org>, Yuval Shaia <yuval.shaia@oracle.com>,
 "qemu-s390x@nongnu.org" <qemu-s390x@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>,
 Stafford Horne <shorne@gmail.com>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Burton <pburton@wavecomp.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, Paul Durrant <paul@xen.org>,
 Anthony Green <green@moxielogic.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar
 E. Iglesias" <edgar.iglesias@gmail.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
 Ari Sundholm <ari@tuxera.com>, Juan Quintela <quintela@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Joel Stanley <joel@jms.id.au>,
 Jason Dillaman <dillaman@redhat.com>, Antony Pavlov <antonynpavlov@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "integration@gluster.org" <integration@gluster.org>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, Max Reitz <mreitz@redhat.com>,
 Denis Lunev <den@virtuozzo.com>, "Michael S.
 Tsirkin" <mst@redhat.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Vincenzo Maffione <v.maffione@gmail.com>, Marek Vasut <marex@denx.de>,
 =?utf-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Giuseppe Lettieri <g.lettieri@iet.unipi.it>, Luigi Rizzo <rizzo@iet.unipi.it>,
 David Gibson <david@gibson.dropbear.id.au>,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Pierre Morel <pmorel@linux.ibm.com>, Wen Congyang <wencongyang2@huawei.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

MDQuMTIuMjAxOSAxNzo1OSwgTWFya3VzIEFybWJydXN0ZXIgd3JvdGU6DQo+IFZsYWRpbWlyIFNl
bWVudHNvdi1PZ2lldnNraXkgPHZzZW1lbnRzb3ZAdmlydHVvenpvLmNvbT4gd3JpdGVzOg0KPiAN
Cj4+IEhlcmUgaXMgaW50cm9kdWNlZCBFUlJQX0FVVE9fUFJPUEFHQVRFIG1hY3JvLCB0byBiZSB1
c2VkIGF0IHN0YXJ0IG9mDQo+PiBmdW5jdGlvbnMgd2l0aCBlcnJwIE9VVCBwYXJhbWV0ZXIuDQo+
Pg0KPj4gSXQgaGFzIHRocmVlIGdvYWxzOg0KPj4NCj4+IDEuIEZpeCBpc3N1ZSB3aXRoIGVycm9y
X2ZhdGFsICYgZXJyb3JfcHJlcGVuZC9lcnJvcl9hcHBlbmRfaGludDogdXNlcg0KPj4gY2FuJ3Qg
c2VlIHRoaXMgYWRkaXRpb25hbCBpbmZvcm1hdGlvbiwgYmVjYXVzZSBleGl0KCkgaGFwcGVucyBp
bg0KPj4gZXJyb3Jfc2V0ZyBlYXJsaWVyIHRoYW4gaW5mb3JtYXRpb24gaXMgYWRkZWQuIFtSZXBv
cnRlZCBieSBHcmVnIEt1cnpdDQo+Pg0KPj4gMi4gRml4IGlzc3VlIHdpdGggZXJyb3JfYWJvcnQg
JiBlcnJvcl9wcm9wYWdhdGU6IHdoZW4gd2Ugd3JhcA0KPj4gZXJyb3JfYWJvcnQgYnkgbG9jYWxf
ZXJyK2Vycm9yX3Byb3BhZ2F0ZSwgcmVzdWx0aW5nIGNvcmVkdW1wIHdpbGwNCj4+IHJlZmVyIHRv
IGVycm9yX3Byb3BhZ2F0ZSBhbmQgbm90IHRvIHRoZSBwbGFjZSB3aGVyZSBlcnJvciBoYXBwZW5l
ZC4NCj4gDQo+IEkgZ2V0IHdoYXQgeW91IG1lYW4sIGJ1dCBJIGhhdmUgcGxlbnR5IG9mIGNvbnRl
eHQuDQo+IA0KPj4gKHRoZSBtYWNybyBpdHNlbGYgZG9lc24ndCBmaXggdGhlIGlzc3VlLCBidXQg
aXQgYWxsb3dzIHRvIFszLl0gZHJvcCBhbGwNCj4+IGxvY2FsX2VycitlcnJvcl9wcm9wYWdhdGUg
cGF0dGVybiwgd2hpY2ggd2lsbCBkZWZpbml0ZWx5IGZpeCB0aGUgaXNzdWUpDQo+IA0KPiBUaGUg
cGFyZW50aGVzaXMgaXMgbm90IHBhcnQgb2YgdGhlIGdvYWwuDQo+IA0KPj4gW1JlcG9ydGVkIGJ5
IEtldmluIFdvbGZdDQo+Pg0KPj4gMy4gRHJvcCBsb2NhbF9lcnIrZXJyb3JfcHJvcGFnYXRlIHBh
dHRlcm4sIHdoaWNoIGlzIHVzZWQgdG8gd29ya2Fyb3VuZA0KPj4gdm9pZCBmdW5jdGlvbnMgd2l0
aCBlcnJwIHBhcmFtZXRlciwgd2hlbiBjYWxsZXIgd2FudHMgdG8ga25vdyByZXN1bHRpbmcNCj4+
IHN0YXR1cy4gKE5vdGU6IGFjdHVhbGx5IHRoZXNlIGZ1bmN0aW9ucyBjb3VsZCBiZSBtZXJlbHkg
dXBkYXRlZCB0bw0KPj4gcmV0dXJuIGludCBlcnJvciBjb2RlKS4NCj4+DQo+PiBUbyBhY2hpZXZl
IHRoZXNlIGdvYWxzLCB3ZSBuZWVkIHRvIGFkZCBpbnZvY2F0aW9uIG9mIHRoZSBtYWNybyBhdCBz
dGFydA0KPj4gb2YgZnVuY3Rpb25zLCB3aGljaCBuZWVkcyBlcnJvcl9wcmVwZW5kL2Vycm9yX2Fw
cGVuZF9oaW50ICgxLik7IGFkZA0KPj4gaW52b2NhdGlvbiBvZiB0aGUgbWFjcm8gYXQgc3RhcnQg
b2YgZnVuY3Rpb25zIHdoaWNoIGRvDQo+PiBsb2NhbF9lcnIrZXJyb3JfcHJvcGFnYXRlIHNjZW5h
cmlvIHRoZSBjaGVjayBlcnJvcnMsIGRyb3AgbG9jYWwgZXJyb3JzDQo+PiBmcm9tIHRoZW0gYW5k
IGp1c3QgdXNlICplcnJwIGluc3RlYWQgKDIuLCAzLikuDQo+IA0KPiBUaGUgcGFyYWdyYXBoIHRh
bGtzIGFib3V0IHR3byBjYXNlczogMS4gYW5kIDIuKzMuIA0KDQpIbW0sIEkgZG9uJ3QgdGhpbmsg
c28uLiAxLiBhbmQgMi4gYXJlIGlzc3Vlcy4gMy4gaXMgYSByZWZhY3RvcmluZy4uIFdlIGp1c3QN
CmZpeCBhY2hpZXZlIDIgYW5kIDMgYnkgb25lIGFjdGlvbi4NCg0KPiBNYWtlcyBtZSB0aGluayB3
ZQ0KPiB3YW50IHR3byBwYXJhZ3JhcGhzLCBlYWNoIGlsbHVzdHJhdGVkIHdpdGggYW4gZXhhbXBs
ZS4NCj4gDQo+IFdoYXQgYWJvdXQgeW91IHByb3ZpZGUgdGhlIGV4YW1wbGVzLCBhbmQgdGhlbiBJ
IHRyeSB0byBwb2xpc2ggdGhlIHByb3NlPw0KDQoxOiBlcnJvcl9mYXRhbCBwcm9ibGVtDQoNCkFz
c3VtZSB0aGUgZm9sbG93aW5nIGNvZGUgZmxvdzoNCg0KaW50IGYxKGVycnApIHsNCiAgICAuLi4N
CiAgICByZXQgPSBmMihlcnJwKTsNCiAgICBpZiAocmV0IDwgMCkgew0KICAgICAgIGVycm9yX2Fw
cGVuZF9oaW50KGVycnAsICJ2ZXJ5IHVzZWZ1bCBoaW50Iik7DQogICAgICAgcmV0dXJuIHJldDsN
CiAgICB9DQogICAgLi4uDQp9DQoNCk5vdywgaWYgd2UgY2FsbCBmMSB3aXRoICZlcnJvcl9mYXRh
bCBhcmd1bWVudCBhbmQgZjIgZmFpbHMsIHRoZSBwcm9ncmFtDQp3aWxsIGV4aXQgaW1tZWRpYXRl
bHkgaW5zaWRlIGYyLCB3aGVuIHNldHRpbmcgdGhlIGVycnAuIFVzZXIgd2lsbCBub3QNCnNlZSB0
aGUgaGludC4NCg0KU28sIGluIHRoaXMgY2FzZSB3ZSBzaG91bGQgdXNlIGxvY2FsX2Vyci4NCg0K
MjogZXJyb3JfYWJvcnQgcHJvYmxlbQ0KDQpOb3csIGNvbnNpZGVyIGZ1bmN0aW9ucyB3aXRob3V0
IHJldHVybiB2YWx1ZS4gV2Ugbm9ybWFsbHkgdXNlIGxvY2FsX2Vycg0KdmFyaWFibGUgdG8gY2F0
Y2ggZmFpbHVyZXM6DQoNCnZvaWQgZjEoZXJycCkgew0KICAgIEVycm9yICpsb2NhbF9lcnIgPSBO
VUxMOw0KICAgIC4uLg0KICAgIGYyKCZsb2NhbF9lcnIpOw0KICAgIGlmIChsb2NhbF9lcnIpIHsN
CiAgICAgICAgZXJyb3JfcHJvcGFnYXRlKGVycnAsIGxvY2FsX2Vycik7DQogICAgICAgIHJldHVy
bjsNCiAgICB9DQogICAgLi4uDQp9DQoNCk5vdywgaWYgd2UgY2FsbCBmMiB3aXRoICZlcnJvcl9h
Ym9ydCBhbmQgZjIgZmFpbHMsIHRoZSBzdGFjayBpbiByZXN1bHRpbmcNCmNyYXNoIGR1bXAgd2ls
bCBwb2ludCB0byBlcnJvcl9wcm9wYWdhdGUsIG5vdCB0byB0aGUgZmFpbHVyZSBwb2ludCBpbiBm
MiwNCndoaWNoIGNvbXBsaWNhdGVzIGRlYnVnZ2luZy4NCg0KU28sIHdlIHNob3VsZCBuZXZlciB3
cmFwIGVycm9yX2Fib3J0IGJ5IGxvY2FsX2Vyci4NCg0KPT09DQoNCk91ciBzb2x1dGlvbjoNCg0K
LSBGaXhlcyBbMS5dLCBhZGRpbmcgaW52b2NhdGlvbiBvZiBuZXcgbWFjcm8gaW50byBmdW5jdGlv
bnMgd2l0aCBlcnJvcl9hcHBlbl9oaW50L2Vycm9yX3ByZXBlbmQsDQogICBOZXcgbWFjcm8gd2ls
bCB3cmFwIGVycm9yX2ZhdGFsLg0KLSBGaXhlcyBbMi5dLCBieSBzd2l0Y2hpbmcgZnJvbSBoYW5k
LXdyaXR0ZW4gbG9jYWxfZXJyIHRvIHNtYXJ0IG1hY3JvLCB3aGljaCBuZXZlcg0KICAgd3JhcHMg
ZXJyb3JfYWJvcnQuDQotIEhhbmRsZXMgWzMuXSwgYnkgc3dpdGNoaW5nIHRvIG1hY3JvLCB3aGlj
aCBpcyBsZXNzIGNvZGUNCi0gQWRkaXRpb25hbGx5LCBtYWNybyBkb2Vzbid0IHdyYXAgbm9ybWFs
IG5vbi16ZXJvIGVycnAsIHRvIGF2b2lkIGV4dHJhIHByb3BhZ2F0aW9ucw0KICAgKGluIGZhY3Qs
IGVycm9yX3Byb3BhZ2F0ZSBpcyBjYWxsZWQsIGJ1dCByZXR1cm5zIGltbWVkaWF0ZWx5IG9uIGZp
cnN0IGlmICghbG9jYWxfZXJyKSkNCg0KPiANCj4+IFNpZ25lZC1vZmYtYnk6IFZsYWRpbWlyIFNl
bWVudHNvdi1PZ2lldnNraXkgPHZzZW1lbnRzb3ZAdmlydHVvenpvLmNvbT4NCj4+IFJldmlld2Vk
LWJ5OiBFcmljIEJsYWtlIDxlYmxha2VAcmVkaGF0LmNvbT4NCj4+IC0tLQ0KPj4NCj4+IENDOiBH
ZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4NCj4+IENDOiAiR29uZ2xlaSAoQXJlaSki
IDxhcmVpLmdvbmdsZWlAaHVhd2VpLmNvbT4NCj4+IENDOiBFZHVhcmRvIEhhYmtvc3QgPGVoYWJr
b3N0QHJlZGhhdC5jb20+DQo+PiBDQzogSWdvciBNYW1tZWRvdiA8aW1hbW1lZG9AcmVkaGF0LmNv
bT4NCj4+IENDOiBMYXVyZW50IFZpdmllciA8bHZpdmllckByZWRoYXQuY29tPg0KPj4gQ0M6IEFt
aXQgU2hhaCA8YW1pdEBrZXJuZWwub3JnPg0KPj4gQ0M6IEtldmluIFdvbGYgPGt3b2xmQHJlZGhh
dC5jb20+DQo+PiBDQzogTWF4IFJlaXR6IDxtcmVpdHpAcmVkaGF0LmNvbT4NCj4+IENDOiBKb2hu
IFNub3cgPGpzbm93QHJlZGhhdC5jb20+DQo+PiBDQzogQXJpIFN1bmRob2xtIDxhcmlAdHV4ZXJh
LmNvbT4NCj4+IENDOiBQYXZlbCBEb3ZnYWx5dWsgPHBhdmVsLmRvdmdhbHVrQGlzcHJhcy5ydT4N
Cj4+IENDOiBQYW9sbyBCb256aW5pIDxwYm9uemluaUByZWRoYXQuY29tPg0KPj4gQ0M6IFN0ZWZh
biBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4NCj4+IENDOiBGYW0gWmhlbmcgPGZhbUBl
dXBob24ubmV0Pg0KPj4gQ0M6IFN0ZWZhbiBXZWlsIDxzd0B3ZWlsbmV0ei5kZT4NCj4+IENDOiBS
b25uaWUgU2FobGJlcmcgPHJvbm5pZXNhaGxiZXJnQGdtYWlsLmNvbT4NCj4+IENDOiBQZXRlciBM
aWV2ZW4gPHBsQGthbXAuZGU+DQo+PiBDQzogRXJpYyBCbGFrZSA8ZWJsYWtlQHJlZGhhdC5jb20+
DQo+PiBDQzogIkRlbmlzIFYuIEx1bmV2IiA8ZGVuQG9wZW52ei5vcmc+DQo+PiBDQzogTWFya3Vz
IEFybWJydXN0ZXIgPGFybWJydUByZWRoYXQuY29tPg0KPj4gQ0M6IEFsYmVydG8gR2FyY2lhIDxi
ZXJ0b0BpZ2FsaWEuY29tPg0KPj4gQ0M6IEphc29uIERpbGxhbWFuIDxkaWxsYW1hbkByZWRoYXQu
Y29tPg0KPj4gQ0M6IFdlbiBDb25neWFuZyA8d2VuY29uZ3lhbmcyQGh1YXdlaS5jb20+DQo+PiBD
QzogWGllIENoYW5nbG9uZyA8eGllY2hhbmdsb25nLmRAZ21haWwuY29tPg0KPj4gQ0M6IExpdSBZ
dWFuIDxuYW1laS51bml4QGdtYWlsLmNvbT4NCj4+IENDOiAiUmljaGFyZCBXLk0uIEpvbmVzIiA8
cmpvbmVzQHJlZGhhdC5jb20+DQo+PiBDQzogSmVmZiBDb2R5IDxjb2R5cHJpbWVAZ21haWwuY29t
Pg0KPj4gQ0M6ICJNYXJjLUFuZHLDqSBMdXJlYXUiIDxtYXJjYW5kcmUubHVyZWF1QHJlZGhhdC5j
b20+DQo+PiBDQzogIkRhbmllbCBQLiBCZXJyYW5nw6kiIDxiZXJyYW5nZUByZWRoYXQuY29tPg0K
Pj4gQ0M6IFJpY2hhcmQgSGVuZGVyc29uIDxydGhAdHdpZGRsZS5uZXQ+DQo+PiBDQzogR3JlZyBL
dXJ6IDxncm91Z0BrYW9kLm9yZz4NCj4+IENDOiAiTWljaGFlbCBTLiBUc2lya2luIiA8bXN0QHJl
ZGhhdC5jb20+DQo+PiBDQzogTWFyY2VsIEFwZmVsYmF1bSA8bWFyY2VsLmFwZmVsYmF1bUBnbWFp
bC5jb20+DQo+PiBDQzogQmVuaWFtaW5vIEdhbHZhbmkgPGIuZ2FsdmFuaUBnbWFpbC5jb20+DQo+
PiBDQzogUGV0ZXIgTWF5ZGVsbCA8cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnPg0KPj4gQ0M6ICJD
w6lkcmljIExlIEdvYXRlciIgPGNsZ0BrYW9kLm9yZz4NCj4+IENDOiBBbmRyZXcgSmVmZmVyeSA8
YW5kcmV3QGFqLmlkLmF1Pg0KPj4gQ0M6IEpvZWwgU3RhbmxleSA8am9lbEBqbXMuaWQuYXU+DQo+
PiBDQzogQW5kcmV3IEJhdW1hbm4gPEFuZHJldy5CYXVtYW5uQG1pY3Jvc29mdC5jb20+DQo+PiBD
QzogIlBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIiA8cGhpbG1kQHJlZGhhdC5jb20+DQo+PiBDQzog
QW50b255IFBhdmxvdiA8YW50b255bnBhdmxvdkBnbWFpbC5jb20+DQo+PiBDQzogSmVhbi1DaHJp
c3RvcGhlIER1Ym9pcyA8amNkQHRyaWJ1ZHVib2lzLm5ldD4NCj4+IENDOiBQZXRlciBDaHViYiA8
cGV0ZXIuY2h1YmJAbmljdGEuY29tLmF1Pg0KPj4gQ0M6IFN1YmJhcmF5YSBTdW5kZWVwIDxzdW5k
ZWVwLmxrbWxAZ21haWwuY29tPg0KPj4gQ0M6IEVyaWMgQXVnZXIgPGVyaWMuYXVnZXJAcmVkaGF0
LmNvbT4NCj4+IENDOiBBbGlzdGFpciBGcmFuY2lzIDxhbGlzdGFpckBhbGlzdGFpcjIzLm1lPg0K
Pj4gQ0M6ICJFZGdhciBFLiBJZ2xlc2lhcyIgPGVkZ2FyLmlnbGVzaWFzQGdtYWlsLmNvbT4NCj4+
IENDOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+PiBDQzog
QW50aG9ueSBQZXJhcmQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+DQo+PiBDQzogUGF1bCBE
dXJyYW50IDxwYXVsQHhlbi5vcmc+DQo+PiBDQzogUGF1bCBCdXJ0b24gPHBidXJ0b25Ad2F2ZWNv
bXAuY29tPg0KPj4gQ0M6IEFsZWtzYW5kYXIgUmlrYWxvIDxhcmlrYWxvQHdhdmVjb21wLmNvbT4N
Cj4+IENDOiBDaHJpcyBXdWxmZiA8Y3J3dWxmZkBnbWFpbC5jb20+DQo+PiBDQzogTWFyZWsgVmFz
dXQgPG1hcmV4QGRlbnguZGU+DQo+PiBDQzogRGF2aWQgR2lic29uIDxkYXZpZEBnaWJzb24uZHJv
cGJlYXIuaWQuYXU+DQo+PiBDQzogQ29ybmVsaWEgSHVjayA8Y29odWNrQHJlZGhhdC5jb20+DQo+
PiBDQzogSGFsaWwgUGFzaWMgPHBhc2ljQGxpbnV4LmlibS5jb20+DQo+PiBDQzogQ2hyaXN0aWFu
IEJvcm50cmFlZ2VyIDxib3JudHJhZWdlckBkZS5pYm0uY29tPg0KPj4gQ0M6ICJIZXJ2w6kgUG91
c3NpbmVhdSIgPGhwb3Vzc2luQHJlYWN0b3Mub3JnPg0KPj4gQ0M6IFhpYW8gR3Vhbmdyb25nIDx4
aWFvZ3Vhbmdyb25nLmVyaWNAZ21haWwuY29tPg0KPj4gQ0M6IEF1cmVsaWVuIEphcm5vIDxhdXJl
bGllbkBhdXJlbDMyLm5ldD4NCj4+IENDOiBBbGVrc2FuZGFyIE1hcmtvdmljIDxhbWFya292aWNA
d2F2ZWNvbXAuY29tPg0KPj4gQ0M6IE1hcmsgQ2F2ZS1BeWxhbmQgPG1hcmsuY2F2ZS1heWxhbmRA
aWxhbmRlLmNvLnVrPg0KPj4gQ0M6IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+DQo+
PiBDQzogTGFzemxvIEVyc2VrIDxsZXJzZWtAcmVkaGF0LmNvbT4NCj4+IENDOiBZdXZhbCBTaGFp
YSA8eXV2YWwuc2hhaWFAb3JhY2xlLmNvbT4NCj4+IENDOiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVy
QHNpZml2ZS5jb20+DQo+PiBDQzogU2FnYXIgS2FyYW5kaWthciA8c2FnYXJrQGVlY3MuYmVya2Vs
ZXkuZWR1Pg0KPj4gQ0M6IEJhc3RpYW4gS29wcGVsbWFubiA8a2Jhc3RpYW5AbWFpbC51bmktcGFk
ZXJib3JuLmRlPg0KPj4gQ0M6IERhdmlkIEhpbGRlbmJyYW5kIDxkYXZpZEByZWRoYXQuY29tPg0K
Pj4gQ0M6IFRob21hcyBIdXRoIDx0aHV0aEByZWRoYXQuY29tPg0KPj4gQ0M6IEVyaWMgRmFybWFu
IDxmYXJtYW5AbGludXguaWJtLmNvbT4NCj4+IENDOiBNYXR0aGV3IFJvc2F0byA8bWpyb3NhdG9A
bGludXguaWJtLmNvbT4NCj4+IENDOiBIYW5uZXMgUmVpbmVja2UgPGhhcmVAc3VzZS5jb20+DQo+
PiBDQzogTWljaGFlbCBXYWxsZSA8bWljaGFlbEB3YWxsZS5jYz4NCj4+IENDOiBBcnR5b20gVGFy
YXNlbmtvIDxhdGFyNHFlbXVAZ21haWwuY29tPg0KPj4gQ0M6IFN0ZWZhbiBCZXJnZXIgPHN0ZWZh
bmJAbGludXguaWJtLmNvbT4NCj4+IENDOiBTYW11ZWwgVGhpYmF1bHQgPHNhbXVlbC50aGliYXVs
dEBlbnMtbHlvbi5vcmc+DQo+PiBDQzogQWxleCBXaWxsaWFtc29uIDxhbGV4LndpbGxpYW1zb25A
cmVkaGF0LmNvbT4NCj4+IENDOiBUb255IEtyb3dpYWsgPGFrcm93aWFrQGxpbnV4LmlibS5jb20+
DQo+PiBDQzogUGllcnJlIE1vcmVsIDxwbW9yZWxAbGludXguaWJtLmNvbT4NCj4+IENDOiBNaWNo
YWVsIFJvdGggPG1kcm90aEBsaW51eC52bmV0LmlibS5jb20+DQo+PiBDQzogSGFpbGlhbmcgWmhh
bmcgPHpoYW5nLnpoYW5naGFpbGlhbmdAaHVhd2VpLmNvbT4NCj4+IENDOiBKdWFuIFF1aW50ZWxh
IDxxdWludGVsYUByZWRoYXQuY29tPg0KPj4gQ0M6ICJEci4gRGF2aWQgQWxhbiBHaWxiZXJ0IiA8
ZGdpbGJlcnRAcmVkaGF0LmNvbT4NCj4+IENDOiBMdWlnaSBSaXp6byA8cml6em9AaWV0LnVuaXBp
Lml0Pg0KPj4gQ0M6IEdpdXNlcHBlIExldHRpZXJpIDxnLmxldHRpZXJpQGlldC51bmlwaS5pdD4N
Cj4+IENDOiBWaW5jZW56byBNYWZmaW9uZSA8di5tYWZmaW9uZUBnbWFpbC5jb20+DQo+PiBDQzog
SmFuIEtpc3prYSA8amFuLmtpc3prYUBzaWVtZW5zLmNvbT4NCj4+IENDOiBBbnRob255IEdyZWVu
IDxncmVlbkBtb3hpZWxvZ2ljLmNvbT4NCj4+IENDOiBTdGFmZm9yZCBIb3JuZSA8c2hvcm5lQGdt
YWlsLmNvbT4NCj4+IENDOiBHdWFuIFh1ZXRhbyA8Z3h0QG1wcmMucGt1LmVkdS5jbj4NCj4+IEND
OiBNYXggRmlsaXBwb3YgPGpjbXZia2JjQGdtYWlsLmNvbT4NCj4+IENDOiBxZW11LWJsb2NrQG5v
bmdudS5vcmcNCj4+IENDOiBpbnRlZ3JhdGlvbkBnbHVzdGVyLm9yZw0KPj4gQ0M6IHNoZWVwZG9n
QGxpc3RzLndwa2cub3JnDQo+PiBDQzogcWVtdS1hcm1Abm9uZ251Lm9yZw0KPj4gQ0M6IHhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPj4gQ0M6IHFlbXUtcHBjQG5vbmdudS5vcmcNCj4+
IENDOiBxZW11LXMzOTB4QG5vbmdudS5vcmcNCj4+IENDOiBxZW11LXJpc2N2QG5vbmdudS5vcmcN
Cj4+DQo+PiAgIGluY2x1ZGUvcWFwaS9lcnJvci5oIHwgMzggKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysNCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDM4IGluc2VydGlvbnMoKykN
Cj4+DQo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9xYXBpL2Vycm9yLmggYi9pbmNsdWRlL3FhcGkv
ZXJyb3IuaA0KPj4gaW5kZXggZDY4OThkODMzYi4uNDcyMzhkOTA2NSAxMDA2NDQNCj4+IC0tLSBh
L2luY2x1ZGUvcWFwaS9lcnJvci5oDQo+PiArKysgYi9pbmNsdWRlL3FhcGkvZXJyb3IuaA0KPj4g
QEAgLTM0NSw2ICszNDUsNDQgQEAgdm9pZCBlcnJvcl9zZXRfaW50ZXJuYWwoRXJyb3IgKiplcnJw
LA0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgICBFcnJvckNsYXNzIGVycl9jbGFzcywgY29u
c3QgY2hhciAqZm10LCAuLi4pDQo+PiAgICAgICBHQ0NfRk1UX0FUVFIoNiwgNyk7DQo+PiAgIA0K
Pj4gK3R5cGVkZWYgc3RydWN0IEVycm9yUHJvcGFnYXRvciB7DQo+PiArICAgIEVycm9yICpsb2Nh
bF9lcnI7DQo+PiArICAgIEVycm9yICoqZXJycDsNCj4+ICt9IEVycm9yUHJvcGFnYXRvcjsNCj4+
ICsNCj4+ICtzdGF0aWMgaW5saW5lIHZvaWQgZXJyb3JfcHJvcGFnYXRvcl9jbGVhbnVwKEVycm9y
UHJvcGFnYXRvciAqcHJvcCkNCj4+ICt7DQo+PiArICAgIGVycm9yX3Byb3BhZ2F0ZShwcm9wLT5l
cnJwLCBwcm9wLT5sb2NhbF9lcnIpOw0KPj4gK30NCj4+ICsNCj4+ICtHX0RFRklORV9BVVRPX0NM
RUFOVVBfQ0xFQVJfRlVOQyhFcnJvclByb3BhZ2F0b3IsIGVycm9yX3Byb3BhZ2F0b3JfY2xlYW51
cCk7DQo+PiArDQo+PiArLyoNCj4+ICsgKiBFUlJQX0FVVE9fUFJPUEFHQVRFDQo+PiArICoNCj4+
ICsgKiBUaGlzIG1hY3JvIGlzIGNyZWF0ZWQgdG8gYmUgdGhlIGZpcnN0IGxpbmUgb2YgYSBmdW5j
dGlvbiB3aXRoIEVycm9yICoqZXJycA0KPj4gKyAqIE9VVCBwYXJhbWV0ZXIuIEl0J3MgbmVlZGVk
IG9ubHkgaW4gY2FzZXMgd2hlcmUgd2Ugd2FudCB0byB1c2UgZXJyb3JfcHJlcGVuZCwNCj4+ICsg
KiBlcnJvcl9hcHBlbmRfaGludCBvciBkZXJlZmVyZW5jZSAqZXJycC4gSXQncyBzdGlsbCBzYWZl
IChidXQgdXNlbGVzcykgaW4NCj4+ICsgKiBvdGhlciBjYXNlcy4NCj4+ICsgKg0KPj4gKyAqIElm
IGVycnAgaXMgTlVMTCBvciBwb2ludHMgdG8gZXJyb3JfZmF0YWwsIGl0IGlzIHJld3JpdHRlbiB0
byBwb2ludCB0byBhDQo+PiArICogbG9jYWwgRXJyb3Igb2JqZWN0LCB3aGljaCB3aWxsIGJlIGF1
dG9tYXRpY2FsbHkgcHJvcGFnYXRlZCB0byB0aGUgb3JpZ2luYWwNCj4+ICsgKiBlcnJwIG9uIGZ1
bmN0aW9uIGV4aXQgKHNlZSBlcnJvcl9wcm9wYWdhdG9yX2NsZWFudXApLg0KPj4gKyAqDQo+PiAr
ICogQWZ0ZXIgaW52b2NhdGlvbiBvZiB0aGlzIG1hY3JvIGl0IGlzIGFsd2F5cyBzYWZlIHRvIGRl
cmVmZXJlbmNlIGVycnANCj4+ICsgKiAoYXMgaXQncyBub3QgTlVMTCBhbnltb3JlKSBhbmQgdG8g
YWRkIGluZm9ybWF0aW9uIChieSBlcnJvcl9wcmVwZW5kIG9yDQo+PiArICogZXJyb3JfYXBwZW5k
X2hpbnQpDQo+PiArICogKGFzLCBpZiBpdCB3YXMgZXJyb3JfZmF0YWwsIHdlIHN3YXBwZWQgaXQg
d2l0aCBhIGxvY2FsX2Vycm9yIHRvIGJlDQo+PiArICogcHJvcGFnYXRlZCBvbiBjbGVhbnVwKS4N
Cj4+ICsgKg0KPj4gKyAqIE5vdGU6IHdlIGRvbid0IHdyYXAgdGhlIGVycm9yX2Fib3J0IGNhc2Us
IGFzIHdlIHdhbnQgcmVzdWx0aW5nIGNvcmVkdW1wDQo+PiArICogdG8gcG9pbnQgdG8gdGhlIHBs
YWNlIHdoZXJlIHRoZSBlcnJvciBoYXBwZW5lZCwgbm90IHRvIGVycm9yX3Byb3BhZ2F0ZS4NCj4+
ICsgKi8NCj4+ICsjZGVmaW5lIEVSUlBfQVVUT19QUk9QQUdBVEUoKSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBcDQo+PiArICAgIGdfYXV0byhFcnJvclByb3BhZ2F0b3IpIF9hdXRv
X2VycnBfcHJvcCA9IHsuZXJycCA9IGVycnB9OyAgXA0KPj4gKyAgICBlcnJwID0gKChlcnJwID09
IE5VTEwgfHwgKmVycnAgPT0gZXJyb3JfZmF0YWwpICAgICAgICAgICAgIFwNCj4+ICsgICAgICAg
ICAgICA/ICZfYXV0b19lcnJwX3Byb3AubG9jYWxfZXJyIDogZXJycCkNCj4+ICsNCj4+ICAgLyoN
Cj4+ICAgICogU3BlY2lhbCBlcnJvciBkZXN0aW5hdGlvbiB0byBhYm9ydCBvbiBlcnJvci4NCj4+
ICAgICogU2VlIGVycm9yX3NldGcoKSBhbmQgZXJyb3JfcHJvcGFnYXRlKCkgZm9yIGRldGFpbHMu
DQo+IA0KPiBNaXNzaW5nOiB1cGRhdGUgb2YgdGhlIGJpZyBjb21tZW50IHN0YXJ0aW5nIHdpdGgg
IkVycm9yIHJlcG9ydGluZyBzeXN0ZW0NCj4gbG9vc2VseSBwYXR0ZXJuZWQgYWZ0ZXIgR2xpYidz
IEdFcnJvci4iDQo+IA0KDQoNCi0tIA0KQmVzdCByZWdhcmRzLA0KVmxhZGltaXINCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
