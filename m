Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFFD10C5FE
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2019 10:27:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaG20-0001DK-2E; Thu, 28 Nov 2019 09:24:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7PLb=ZU=virtuozzo.com=vsementsov@srs-us1.protection.inumbo.net>)
 id 1iaFy3-00014b-2X
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2019 09:20:07 +0000
X-Inumbo-ID: 41db3b96-11c0-11ea-a3cd-12813bfff9fa
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.118]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 41db3b96-11c0-11ea-a3cd-12813bfff9fa;
 Thu, 28 Nov 2019 09:20:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VMnmjM3FYt2D7DJYapGBj8gU44DzYthCWpTL5pLkaujsu/GC5/eSKDBSNHkXGzlRPyWjlM3YvxEZLc0rb6SqUbUNzQJQVQQQjTi5SLf9fyA2BJX8NbYDfYU4p7jlNYYqiFg7dAlFzGuZ+NvRDe7q+zndQjR5R1mzvw4iU/DWzd12MkSru4FqlNlqijjZj0IJviVvgB9VLfE67u/fsLqrO1vzo9P0N+20hpmlvLaAr0ZoAcevJasDKO6FPRAaiIjsSV1hAe57Jn1CGHCzsPZOD+9cHLFfSn18peMP/u1fEowC3/2fTpn5imQBVxvcqjyISpXkrUk9zF1hFgL6Sql2pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4w4RrRWOk3kYGyih9WXOG01frLBfQmRUDjBKcfz3Ys8=;
 b=HtvQ5dykKB9s0/y51/MhIAFNkAIosLL7d3c007NO5vBfgQnGhmCKpEJmOCX/F+kfsANVoTg1D3cvA2VEfBoCyhRXTLiBiFHHmBgVl93wWjAzj4GtDYs2czdKPoNArt7en5GmzC4rf5XXWyfvQiUk01CWiDV/Oov7pEpauWIF27QuVbtk3Sz1+GVyVObK6OP4MFW5zEeG5MP1NtoAWTjGsQfR90GXYCFj9BEI3C0SMsBup0xymm8AH1qD1WT5SYD8ltMalidJRT1VdVfzYABFV25YFY+FI/a6c54/buzVcClw3ZFQEiM9wRM8vwLLhKvtTCPXUPPCBCoYJbQt99oKvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4w4RrRWOk3kYGyih9WXOG01frLBfQmRUDjBKcfz3Ys8=;
 b=G/RhV9htMWK3PDEJPMH+yp35gS3oBqsVERV75QCSpzdQ6MhiIrdprnx9TkydQ64+bD7ZFmi7IpJOw5sTxqWVDg3hCwEH3um4B776ERUtn1vaf3VM5IC7Te0KtHKhrwl9sSI01Vp3Bs3PPC34tNt2xxS/FEqnMdFtts4zsYZ116o=
Received: from AM6PR08MB4423.eurprd08.prod.outlook.com (20.179.7.140) by
 AM6PR08MB4788.eurprd08.prod.outlook.com (10.255.96.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.16; Thu, 28 Nov 2019 09:20:01 +0000
Received: from AM6PR08MB4423.eurprd08.prod.outlook.com
 ([fe80::31bd:5bb3:377e:706f]) by AM6PR08MB4423.eurprd08.prod.outlook.com
 ([fe80::31bd:5bb3:377e:706f%3]) with mapi id 15.20.2474.023; Thu, 28 Nov 2019
 09:20:01 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Markus Armbruster <armbru@redhat.com>
Thread-Topic: [RFC v5 000/126] error: auto propagated local_err
Thread-Index: AQHVgE3dlsNxBDOk202dFu/C5nZLkaegko9JgAAG0YA=
Date: Thu, 28 Nov 2019 09:20:01 +0000
Message-ID: <b000e0b0-b75c-c74e-244b-0b1bf270b6a6@virtuozzo.com>
References: <20191011160552.22907-1-vsementsov@virtuozzo.com>
 <87tv6opehz.fsf@dusky.pond.sub.org>
In-Reply-To: <87tv6opehz.fsf@dusky.pond.sub.org>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR09CA0052.eurprd09.prod.outlook.com
 (2603:10a6:7:3c::20) To AM6PR08MB4423.eurprd08.prod.outlook.com
 (2603:10a6:20b:bf::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vsementsov@virtuozzo.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20191128121953572
x-originating-ip: [185.231.240.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d8aade60-5525-4065-ce80-08d773e4258b
x-ms-traffictypediagnostic: AM6PR08MB4788:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR08MB478837BBC944242C53F2A240C1470@AM6PR08MB4788.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0235CBE7D0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39840400004)(136003)(396003)(376002)(346002)(366004)(199004)(189003)(53754006)(8676002)(256004)(66066001)(8936002)(54906003)(102836004)(3846002)(26005)(2906002)(31686004)(6512007)(229853002)(66476007)(66556008)(36756003)(11346002)(52116002)(66446008)(64756008)(4326008)(446003)(5660300002)(186003)(76176011)(6506007)(6246003)(66946007)(386003)(6116002)(14444005)(7366002)(7736002)(71200400001)(71190400001)(99286004)(31696002)(561944003)(316002)(7416002)(6436002)(305945005)(6916009)(6486002)(14454004)(25786009)(86362001)(81156014)(81166006)(7406005)(478600001)(7336002)(2616005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR08MB4788;
 H:AM6PR08MB4423.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: virtuozzo.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cn+5lWAoIstiqsLIY2S+oXFQaq1xVL634ut7G7Z7UGxg8pqYxLrgx7E4k+nlSA6nuzb0N1b/cRlr/Au/vlo0n3rC+oEmhkyOnOfXu69dxdL7tVCtq7uJzRNXUJmxDU8pSFw+3dvp0qSAMXELx5AiuIMA1GDKI4K9Jczq/aVIICHt2NIiLsFFCTN6qHyT/reQ+CvOJebKyELH7rJfkQBjw+I49zf6mtacSmhuKSccLXZosWTBRG5EHZkiqNqit7/HqWmlZwPpuhF4rLeWXyDB63jSl3zJL6gEu+yC12ciUSbI7eiovFYYxKdIZ/oLybRupq4kIST41lf2szVehO4rhA6nDOnONoTS/pMo+tILNs+KwRzlw78SMd42llZ/ciFrOqMG9Jus4ZJ8l4+zsQz+358kUBZM8PjMo4HBjrEMERYKyZ4e9wdMr18Nnh955ngJ
Content-ID: <B1A89D7E2F9BC44181FBD70EC14B11F8@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8aade60-5525-4065-ce80-08d773e4258b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2019 09:20:01.7680 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oqI0OzEi6rW2mS98S836vzljPIZnFboNHuRKAwu6vwOouPRCG+rpRBLEoQ+BjrrHU6f9EXMeEk68PZVfTdepMpoSEEZJmXZr0vkG7bhtQWA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4788
X-Mailman-Approved-At: Thu, 28 Nov 2019 09:24:10 +0000
Subject: Re: [Xen-devel] [RFC v5 000/126] error: auto propagated local_err
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

MjguMTEuMjAxOSAxMTo1NCwgTWFya3VzIEFybWJydXN0ZXIgd3JvdGU6DQo+IFBsZWFzZSBhY2Nl
cHQgbXkgc2luY2VyZSBhcG9sb2dpZXMgZm9yIHRha2luZyBzbyBsb25nIHRvIHJlcGx5LiAgQSBm
ZXcNCj4gdGhvdWdodHMgYmVmb3JlIEkgZGlnIGRlZXBlci4NCj4gDQo+IFZsYWRpbWlyIFNlbWVu
dHNvdi1PZ2lldnNraXkgPHZzZW1lbnRzb3ZAdmlydHVvenpvLmNvbT4gd3JpdGVzOg0KPiANCj4+
IEhpIGFsbCENCj4+DQo+PiBBdCB0aGUgcmVxdWVzdCBvZiBNYXJrdXM6IGZ1bGwgdmVyc2lvbiBv
ZiBlcnJwIHByb3BhZ2F0aW9uLiBMZXQncyBsb29rDQo+PiBhdCBpdC4gQ292ZXIgYXMgbXVjaCBh
cyBwb3NzaWJsZSwgZXhjZXB0IGluc2VydGluZyBtYWNybyBpbnZvY2F0aW9uDQo+PiB3aGVyZSBp
dCdzIG5vdCBuZWNlc3NhcnkuDQo+Pg0KPj4gSXQncyBodWdlLCBhbmQgc28gaXQncyBhbiBSRkMu
DQo+IA0KPiBJdCdzIGEgbW9uc3Rlci4gIEJlc3QgdG8gZ2V0IGl0IGludG8gZnVsbCB2aWV3IGJl
Zm9yZSB3ZSBjb21taXQgdG8NCj4gZmlnaHRpbmcgaXQuDQo+IA0KPj4gSW4gdjUgSSd2ZSBhZGRl
ZCBhIGxvdCBtb3JlIHByZXBhcmF0aW9uIGNsZWFudXBzOg0KPj4gMDEtMjMgYXJlIHByZXBhcmF0
aW9uIGNsZWFudXBzDQo+PiAgICAwMTogbm90IGNoYW5nZWQsIGtlZXAgRXJpYydzIHItYg0KPj4g
ICAgMDI6IGltcHJvdmUgY29tbWl0IG1zZyBbTWFya3VzXSwga2VlcCBFcmljJ3Mgci1iDQo+PiAg
ICAwMzogY2hhbmdlZCwgb25seSBlcnJvciBBUEkgaGVyZSwgZHJvcCByLWINCj4+IDI0IGlzIGNv
cmUgbWFjcm8NCj4+ICAgIC0gaW1wcm92ZSBjb3ZlciBsZXR0ZXIsIHdvcmRpbmcgYW5kIG1hY3Jv
IGNvZGUgc3R5bGUNCj4+ICAgIC0ga2VlcCBFcmljJ3Mgci1iDQo+PiAyNS0yNjogYXV0b21hdGlv
biBzY3JpcHRzDQo+PiAgICAgLSBjb21taXQtcGVyLXN1YnN5c3RlbSBjaGFuZ2VkIGEgbG90LiBp
dCdzIGEgZHJhZnQsIGRvbid0IGJvdGhlciB0b28NCj4+ICAgICAgIG11Y2ggd2l0aCBpdA0KPj4g
ICAgIC0gY29jY2luZWxsZTogYWRkIHN1cHBvcnQgb2YgZXJyb3JfcHJvcGFnYXRlX3ByZXBlbmQN
Cj4+DQo+PiAyNy0xMjY6IGdlbmVyYXRlZCBwYXRjaGVzDQo+IA0KPiBTcGxpdHRpbmcgdXAgdGhl
IG1vbnN0ZXIgY2FuIG1ha2UgZmlnaHRpbmcgaXQgZWFzaWVyLg0KPiANCj4gWW91ciBkZXNjcmlw
dGlvbiBzdWdnZXN0cyB0aHJlZSBoaWdoLWxldmVsIHBhcnRzOg0KPiANCj4gUGFydCAxOiBQcmVw
YXJhdGlvbiAobWFrZXMgc2Vuc2UgYnkgaXRzZWxmKQ0KDQpJIGFscmVhZHkgcmVzZW50IHBhcnQg
MSBhbGwgcGF0Y2hlcyAoaGFuZGxpbmcgcmV2aWV3IGNvbW1lbnRzKSBpbiBzZXBhcmF0ZSBhcyB2
Ni4NCklmIGl0IGlzIGNvbnZlbmllbnQsIEkgY2FuIHJlc2VuZCB0aGVtIGluIG9uZSBzZXJpZXMg
YXMgdjcuDQoNCj4gUGFydCAyOiBFcnJvciBpbnRlcmZhY2UgdXBkYXRlICh3aXRoIHJ1bGVzIHdo
YXQgY29kZSBzaG91bGQgZG8gbm93KQ0KDQpOb3RlLCB0aGF0IHBhdGNoIDIxIGlzIGFjdHVhbGx5
IGZyb20gcGFydDIsIG5vdCBwYXJ0MS4NClNvIFBhcnQgMiBpcyAyMSwgMjQsIDI1Lg0KU28gSSB3
YWl0IGZvciB5b3VyIGNvbW1lbnRzIGFuZCByZXNlbmQgKGlmIG5lZWRlZCkgYXMgc2VwYXJhdGUg
c21hbGwgc2VyaWVzLg0KDQpBbmQgMjYgaXMgYXV0by1wYXRjaC1zcGxpdHRlciwgYnV0IHdlIGRv
bid0IG5lZWQgaXQgbm93LCBpZiB3ZSBhcmUgZ29pbmcNCnRvIHN0YXJ0IGZyb20gc2V2ZXJhbCBi
aWcgc3Vic3lzdGVtcy4NCg0KPiBQYXJ0IDM6IE1ha2UgdGhlIGNvZGUgb2JleSB0aGUgbmV3IHJ1
bGVzIGV2ZXJ5d2hlcmUNCj4gDQo+IEkgaG9wZSB3ZSBjYW4gZ2V0IHBhcnQgMSBvdXQgb2YgdGhl
IHdheSBxdWlja2x5LiAgRGlmZnN0YXQ6DQo+IA0KPiAgIGJhY2tlbmRzL2NyeXB0b2Rldi5jICAg
ICAgIHwgIDExICstLS0NCj4gICBibG9jay9uYmQuYyAgICAgICAgICAgICAgICB8ICAxMCArLS0N
Cj4gICBibG9jay9zbmFwc2hvdC5jICAgICAgICAgICB8ICAgNCArLQ0KPiAgIGR1bXAvZHVtcC1o
bXAtY21kcy5jICAgICAgIHwgICA0ICstDQo+ICAgaHcvOXBmcy85cC1sb2NhbC5jICAgICAgICAg
fCAgIDQgKy0NCj4gICBody85cGZzLzlwLXByb3h5LmMgICAgICAgICB8ICAgNSArLQ0KPiAgIGh3
L2NvcmUvbG9hZGVyLWZpdC5jICAgICAgIHwgICA1ICstDQo+ICAgaHcvY29yZS9tYWNoaW5lLWht
cC1jbWRzLmMgfCAgIDYgKy0NCj4gICBody9jb3JlL3FkZXYuYyAgICAgICAgICAgICB8ICAyOCAr
KysrLS0tLQ0KPiAgIGh3L2kzODYvYW1kX2lvbW11LmMgICAgICAgIHwgIDE0ICsrLS0NCj4gICBo
dy9wcGMvc3BhcHIuYyAgICAgICAgICAgICB8ICAgMiArLQ0KPiAgIGh3L3MzOTB4L2V2ZW50LWZh
Y2lsaXR5LmMgIHwgICAyICstDQo+ICAgaHcvczM5MHgvczM5MC1zdGF0dHJpYi5jICAgfCAgIDMg
Ky0NCj4gICBody9zZC9zZGhjaS5jICAgICAgICAgICAgICB8ICAgMiArLQ0KPiAgIGh3L3RwbS90
cG1fZW11bGF0b3IuYyAgICAgIHwgICA4ICstLQ0KPiAgIGh3L3VzYi9kZXYtbmV0d29yay5jICAg
ICAgIHwgICAyICstDQo+ICAgaHcvdmZpby9hcC5jICAgICAgICAgICAgICAgfCAgMTYgKy0tLS0N
Cj4gICBpbmNsdWRlL2Jsb2NrL3NuYXBzaG90LmggICB8ICAgMiArLQ0KPiAgIGluY2x1ZGUvbW9u
aXRvci9obXAuaCAgICAgIHwgICAyICstDQo+ICAgaW5jbHVkZS9xYXBpL2Vycm9yLmggICAgICAg
fCAgNjkgKysrKysrKysrKysrKysrKysrLS0NCj4gICBpbmNsdWRlL3FvbS9vYmplY3QuaCAgICAg
ICB8ICAgNCArLQ0KPiAgIG1vbml0b3IvaG1wLWNtZHMuYyAgICAgICAgIHwgMTU1ICsrKysrKysr
KysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAgIG1vbml0b3IvcW1wLWNt
ZHMuYyAgICAgICAgIHwgICAyICstDQo+ICAgbmV0L25ldC5jICAgICAgICAgICAgICAgICAgfCAg
MTcgKystLS0NCj4gICBxZGV2LW1vbml0b3IuYyAgICAgICAgICAgICB8ICAyOCArKysrLS0tLQ0K
PiAgIHFnYS9jb21tYW5kcy1wb3NpeC5jICAgICAgIHwgICAyICstDQo+ICAgcWdhL2NvbW1hbmRz
LXdpbjMyLmMgICAgICAgfCAgIDIgKy0NCj4gICBxZ2EvY29tbWFuZHMuYyAgICAgICAgICAgICB8
ICAxMiArKy0tDQo+ICAgcW9tL3FvbS1obXAtY21kcy5jICAgICAgICAgfCAgIDQgKy0NCj4gICB0
YXJnZXQvcHBjL2t2bS5jICAgICAgICAgICB8ICAgNiArLQ0KPiAgIHRhcmdldC9wcGMva3ZtX3Bw
Yy5oICAgICAgIHwgICA0ICstDQo+ICAgdWkvdm5jLmMgICAgICAgICAgICAgICAgICAgfCAgMjAg
KystLS0tDQo+ICAgdWkvdm5jLmggICAgICAgICAgICAgICAgICAgfCAgIDIgKy0NCj4gICB1dGls
L2Vycm9yLmMgICAgICAgICAgICAgICB8ICAzMCArKysrLS0tLS0NCj4gICAzNCBmaWxlcyBjaGFu
Z2VkLCAyNjEgaW5zZXJ0aW9ucygrKSwgMjI2IGRlbGV0aW9ucygtKQ0KPiANCj4gQXQgZmlyc3Qg
Z2xhbmNlLCBJIGNhbiBzZWUgYnVnIGZpeGVzLCBub24tbWVjaGFuaWNhbCBjbGVhbnVwcywgYW5k
DQo+IG1lY2hhbmljYWwgY2xlYW51cHMuDQo+IA0KPiBXaXRoaW4gZWFjaCBvZiB0aGVzZSB0aHJl
ZSBncm91cHMsIHdlIGhhdmUgcmVsYXRlZCBzdWItZ3JvdXBzLiAgRm9yDQo+IGluc3RhbmNlLCBz
ZXZlcmFsIHBhdGNoZXMgY2xlYW4gdXAgZnVubnkgbmFtZXMgZm9yIHRoZSBjb21tb24gRXJyb3Ig
KioNCj4gcGFyYW1ldGVycy4gIFNldmVyYWwgbW9yZSByZW5hbWUgInVuY29tbW9uIiBFcnJvciAq
KiBwYXJhbWV0ZXJzLCB0bw0KPiBzaWduYWwgdGhlaXIgdW5jb21tb24gcm9sZS4gIEkgZG91YnQg
c3BsaXR0aW5nIHVwIHRoZXNlIHN1Ymdyb3VwcyBvZg0KPiByZWxhdGVkIG1lY2hhbmljYWwgY2hh
bmdlcyBhbG9uZyBzdWJzeXN0ZW0gbGluZXMgaXMgd29ydGh3aGlsZS4NCj4gDQo+IFBhcnQgMiBu
ZWVkcyBjYXJlZnVsIGludGVyZmFjZSByZXZpZXcuICBIYXZpbmcgcGFydCAzIHJlYWR5IGhlbHBz
IHRoZXJlLA0KPiBiZWNhdXNlIHdlIGNhbiBzZWUgcmF0aGVyIHRoYW4gZ3Vlc3MgaG93IHRoZSBp
bnRlcmZhY2UgY2hhbmdlcyBwbGF5IG91dC4NCj4gV2UgcmVhbGx5IHdhbnQgdG8gZ2V0IHRoaXMg
cGFydCByaWdodCBmcm9tIHRoZSBzdGFydCwgYmVjYXVzZSBpZiB3ZQ0KPiBkb24ndCwgd2UgZ2V0
IHRvIGRvIHBhcnQgMyBhZ2Fpbi4NCj4gDQo+IFBhcnQgMyBpcyB3aGF0IG1ha2VzIHRoaXMgYSBt
b25zdGVyLiAgSSB1bmRlcnN0YW5kIGl0J3MgbWVjaGFuaWNhbC4gIFdlDQo+IGNhbiBtZXJnZSBp
dCBpbmNyZW1lbnRhbGx5LCBidXQgd2UgZG8gd2FudCB0byBtZXJnZSBpdCBhbGwsIGFuZCBzb29u
ZXINCj4gcmF0aGVyIHRoYW4gbGF0ZXIsIHRvIGF2b2lkIGEgbWl4IG9mIG9sZCBhbmQgbmV3IGVy
cm9yIGhhbmRsaW5nIGNvZGUuDQo+IFN1Y2ggbWl4ZXMgaW5ldml0YWJseSBjb25mdXNlIGRldmVs
b3BlcnMsIGFuZCBsZWFkIHRvIG5ldyBpbnN0YW5jZXMgb2YNCj4gdGhlIG9sZCBwYXR0ZXJucyBj
cmVlcGluZyBpbi4NCj4gDQo+IEkgZG8gaGF2ZSBkb3VidHMgYWJvdXQgeW91ciBhdXRvbWF0ZWQg
c3BsaXQuDQo+IA0KPiBJIGFja25vd2xlZGdlIG1haW50YWluZXJzIG9mIGFjdGl2ZSBzdWJzeXN0
ZW1zIG1heSB3YW50IHRvIG1lcmdlIHRoaXMgb24NCj4gdGhlaXIgb3duIHRlcm1zLCB0byBtaW5p
bWl6ZSBkaXNydXB0aW9uLiAgU3BsaXR0aW5nIG9mZiBzdWItbW9uc3RlcnMgZm9yDQo+IHRoZW0g
bWFrZXMgc2Vuc2UuICBTcGxpdHRpbmcgb2ZmIHRoZSBsb25nIHRhaWwgb2YgbGVzcyBidXN5IHN1
YnN5c3RlbXMNCj4gbm90IHNvIG11Y2g7IGl0J2xsIG9ubHkgZHJhZyBvdXQgdGhlIG1lcmdpbmcu
ICBZb3VyIGxpc3QgYmVsb3cgc2hvd3MgMTAwDQo+IHBhcnRzLCBhbmQgY2hhc2luZyB0aGVpciBt
YWludGFpbmVycyBpcyBub3QgZ29pbmcgdG8gYmUgYSBmdW4NCj4gZXhwZXJpZW5jZS4NCj4gDQo+
IE1vcmVvdmVyLCB1c2luZyBNQUlOVEFJTkVSUyB0byBndWlkZSBhbiBhdXRvbWF0aWMgc3BsaXQg
aXMgYSBjdXRlIGlkZWEsDQo+IGJ1dCBpdCBmYWxscyBhcGFydCB3aGVuIE1BSU5UQUlORVJTIGF0
dHJpYnV0ZXMgdGhlIHNhbWUgZmlsZSB0byBzZXZlcmFsDQo+IHN1YnN5c3RlbXMsIHdoaWNoIGlz
IGZhaXJseSBjb21tb24uICBBIHNhbmUgc3BsaXQgcmVxdWlyZXMgaHVtYW4gdG91Y2guDQo+IA0K
PiBJbnN0ZWFkLCBJJ2Qgc3RhcnQgd2l0aCBiaWcgc3Vic3lzdGVtcyB3aXRoIG1haW50YWluZXJz
IGtub3duIHRvIGJlDQo+IHN5bXBhdGhldGljIHRvIHRoaXMgZWZmb3J0LiAgU3BsaXQgb2ZmIHRo
ZWlyIHN1Yi1tb25zdGVycywgZ2V0IHRoZW0NCj4gbWVyZ2VkLiAgSXRlcmF0ZSB1bnRpbCB0aGUg
cmVtYWluZGVyIGNhbiBiZSBtZXJnZWQgaW4gb25lIGZpbmFsIHB1c2guDQoNCkRvIHlvdSBtZWFu
IHRvIHNlbmQgdGhlbSBhcyBzZXBhcmF0ZSBwZXItc3Vic3lzdGVtIHNlcmllcywgb3IgYWxsIGlu
IG9uZSwNCmJ1dCBsaW1pdGVkIHRvIHNvbWUgc3Vic3lzdGVtcz8NCg0KPiANCj4+ID09PT0NCj4+
DQo+PiBIZXJlIGlzIGEgcHJvcG9zYWwgb2YgYXV0byBwcm9wYWdhdGlvbiBmb3IgbG9jYWxfZXJy
LCB0byBub3QgY2FsbA0KPj4gZXJyb3JfcHJvcGFnYXRlIG9uIGV2ZXJ5IGV4aXQgcG9pbnQsIHdo
ZW4gd2UgZGVhbCB3aXRoIGxvY2FsX2Vyci4NCj4gDQo+IE1vcmUgY2xldmVybmVzcywgbGVzcyBj
b2RlLCBhdm9pZHMgb25lIGtpbmQgb2YgZXJyb3IgKGZvcmdldHRpbmcgbWFudWFsDQo+IHByb3Bh
Z2F0ZSB3aGVuIHdlIHNob3VsZCksIHJpc2tzIGFub3RoZXIga2luZCBvZiBlcnJvciAoYXV0b21h
dGljDQo+IHByb3BhZ2F0ZSB3aGVuIHdlIHNob3VsZG4ndCkuICBUcmFkZW9mZnMsIGJ1dCB0aGUg
Z2VuZXJhbCBmZWVsaW5nIGFtb25nDQo+IHJldmlld2VycyBhcHBlYXJzIHRvIGJlIHBvc2l0aXZl
Lg0KPiANCj4+IFRoZXJlIGFyZSBhbHNvIHR3byBpc3N1ZXMgd2l0aCBlcnJwOg0KPj4NCj4+IDEu
IGVycm9yX2ZhdGFsICYgZXJyb3JfYXBwZW5kX2hpbnQvZXJyb3JfcHJlcGVuZDogdXNlciBjYW4n
dCBzZWUgdGhpcw0KPj4gYWRkaXRpb25hbCBpbmZvLCBiZWNhdXNlIGV4aXQoKSBoYXBwZW5zIGlu
IGVycm9yX3NldGcgZWFybGllciB0aGFuIGluZm8NCj4+IGlzIGFkZGVkLiBbUmVwb3J0ZWQgYnkg
R3JlZyBLdXJ6XQ0KPiANCj4gWWVzLCBicm9rZW4gYnkgZGVzaWduLCBodXJ0cyB1c2Vycy4NCj4g
DQo+PiAyLiBlcnJvcl9hYm9ydCAmIGVycm9yX3Byb3BhZ2F0ZTogd2hlbiB3ZSB3cmFwDQo+PiBl
cnJvcl9hYm9ydCBieSBsb2NhbF9lcnIrZXJyb3JfcHJvcGFnYXRlLCByZXN1bHRpbmcgY29yZWR1
bXAgd2lsbA0KPj4gcmVmZXIgdG8gZXJyb3JfcHJvcGFnYXRlIGFuZCBub3QgdG8gdGhlIHBsYWNl
IHdoZXJlIGVycm9yIGhhcHBlbmVkLg0KPj4gKHRoZSBtYWNybyBpdHNlbGYgZG9uJ3QgZml4IHRo
ZSBpc3N1ZSwgYnV0IGl0IGFsbG93cyB0byBbMy5dIGRyb3AgYWxsDQo+PiBsb2NhbF9lcnIrZXJy
b3JfcHJvcGFnYXRlIHBhdHRlcm4sIHdoaWNoIHdpbGwgZGVmaW5pdGVseSBmaXggdGhlIGlzc3Vl
KQ0KPj4gW1JlcG9ydGVkIGJ5IEtldmluIFdvbGZdDQo+IA0KPiBZZXMsIGJyb2tlbiBieSBkZXNp
Z24sIGluY29udmVuaWVuY2VzIGRldmVsb3BlcnMuDQo+IA0KPj4gPT09PQ0KPj4NCj4+IEdlbmVy
YXRlZCBwYXRjaGVzIHNwbGl0Og0KPj4NCj4+IG1pc2MNCj4+ICAgICBody9taXNjL2l2c2htZW0u
Yw0KPj4gICAgIGh3L21pc2MvdG1wMTA1LmMNCj4+ICAgICBody9taXNjL3RtcDQyMS5jDQo+IFs5
OSBtb3JlLi4uXQ0KPiANCg0KVGhhbmtzIQ0KDQotLSANCkJlc3QgcmVnYXJkcywNClZsYWRpbWly
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
