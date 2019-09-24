Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CB2BD708
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 06:15:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCyep-0008Ec-K2; Wed, 25 Sep 2019 04:12:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jCV4=XT=virtuozzo.com=vsementsov@srs-us1.protection.inumbo.net>)
 id 1iCn1M-0001e8-M0
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 15:46:32 +0000
X-Inumbo-ID: 79a9d050-dee2-11e9-bf31-bc764e2007e4
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.5.104]) by localhost (Halon) with ESMTPS
 id 79a9d050-dee2-11e9-bf31-bc764e2007e4;
 Tue, 24 Sep 2019 15:46:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=blHgSySHwAX4kEX7kvUANwg31VINdefegNExgcjlOpxetC4WipWqO7hyup4yHWzrOJ6MQ5K5QYb5x09CANJNGd/6wtbeuxtquxVapYBWR7RimSOkygzGIHr4JtNbMIdYNt13S1XWJc44+Djx6ajjrGGIlhcIMX3ubWJ8dP812M5iTm0Qh85UhCRkhIBS8gQJTuOChPZJxIiNB0oj6WD1w2ZE+hSW8Mf1n+nnkFIVTaziWWYU+mztBC05WlA6y9bF3nHM4FbTa2DmDpfT/rWbuKvzN1HCPS+QbsESXdjKRkHAaAbKmP0dJNJ/C4Y/QecPRe+ZciXDzT6vAzMsDnT2lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QQ9GUuh2TyVUJeJNFFC6pXqFoWbr+xXWfE+1U4lNj1E=;
 b=ZJg2lMaxkuvuUVb/s0pRgTv0y+98u1Ku36UWgzXT7vSYCDhKu2ospHFwkpzHsKlr9QCG/K4nRybGG+xkmwH71VVoNVnjylebQRWKA1w25d0zG2TshqWyrQD1ObJ2932+9O8ClBYFoY/fWcj5CrbBTtEGSRuV9LgSFw0S1PtzH2pwUveIs1+Qkhvi1iNIWwS9a4beDZK22ry//9w3+iIma4BdygC9cWoWDBvOCnpQOxSR6lVl2jvlGwIL8W6n6kTVN2iWg+zePe1ghvhVfZH1VWSYtERwiXLCwHtg7qoM5YAMp0iOks9Z5QybZOk4XD3L9ZLlfwt/497kmBLGc7wjKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QQ9GUuh2TyVUJeJNFFC6pXqFoWbr+xXWfE+1U4lNj1E=;
 b=qSUocq1f1bTVIO/lTuf1+v9oIr2+EaQYeD6KIp6Qj0GbvB3VT95Zh2Y9I5esUfY1iojLGgGQo9LN0yxqqbC2oTusOnAbNMMzOeU6IJ/u0i26zFaQRoK6kMbNKla0eq31G5+HoP8DDnSApvfK5NY8oZP3cv9F9UIPgFeQscmDLRs=
Received: from DB8PR08MB5498.eurprd08.prod.outlook.com (52.133.242.216) by
 DB8PR08MB4203.eurprd08.prod.outlook.com (20.179.11.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.26; Tue, 24 Sep 2019 15:46:28 +0000
Received: from DB8PR08MB5498.eurprd08.prod.outlook.com
 ([fe80::b5c0:6b97:438d:77ed]) by DB8PR08MB5498.eurprd08.prod.outlook.com
 ([fe80::b5c0:6b97:438d:77ed%2]) with mapi id 15.20.2284.023; Tue, 24 Sep 2019
 15:46:28 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Eric Blake <eblake@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Thread-Topic: [RFC v2 0/9] error: auto propagated local_err
Thread-Index: AQHVcioNiDMY2yo+Z0yF9jZaFGvJZ6c5qyCAgAFm+wD//+MaAIAANo8A///OUYA=
Date: Tue, 24 Sep 2019 15:46:27 +0000
Message-ID: <824bb514-fc6f-7adc-4f4f-97dd758fb04d@virtuozzo.com>
References: <20190923161231.22028-1-vsementsov@virtuozzo.com>
 <d1527fdc-b5e8-093a-9206-6f7ceeece2ac@redhat.com>
 <84c9e5dd-3e0f-94e1-5da1-2c7baa594bf1@virtuozzo.com>
 <22191b09-822a-1f54-dcaa-3726c833805b@redhat.com>
 <97b77e48-b370-a596-0a06-9ceaaf6bc72e@virtuozzo.com>
In-Reply-To: <97b77e48-b370-a596-0a06-9ceaaf6bc72e@virtuozzo.com>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR09CA0068.eurprd09.prod.outlook.com
 (2603:10a6:7:3d::12) To DB8PR08MB5498.eurprd08.prod.outlook.com
 (2603:10a6:10:11c::24)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vsementsov@virtuozzo.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20190924184618996
x-originating-ip: [185.231.240.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7d19856f-cec3-4ada-9621-08d741065c78
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DB8PR08MB4203; 
x-ms-traffictypediagnostic: DB8PR08MB4203:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR08MB4203188355D83BE29E2323A2C1840@DB8PR08MB4203.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0170DAF08C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(39850400004)(366004)(396003)(136003)(346002)(189003)(199004)(31696002)(7736002)(14454004)(6486002)(6506007)(386003)(7336002)(256004)(305945005)(31686004)(53546011)(7276002)(7416002)(81166006)(316002)(86362001)(54906003)(6116002)(2906002)(5660300002)(76176011)(99286004)(478600001)(25786009)(110136005)(2501003)(6246003)(229853002)(7366002)(7406005)(8936002)(6436002)(8676002)(102836004)(81156014)(52116002)(45426003)(66476007)(66556008)(66446008)(476003)(446003)(3846002)(66066001)(36756003)(6512007)(2616005)(64756008)(11346002)(186003)(71190400001)(4326008)(26005)(66946007)(71200400001)(486006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB8PR08MB4203;
 H:DB8PR08MB5498.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: virtuozzo.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gkEd5VhN042Em+SNYYlMnaPUieq+wCSwxbLM9SiCgx6+GMD+x27RLHQUEYUN7Zd5NaFp53Xu2WoWc75vEGdkvQN1yn5tSEfvLqgjoetCk5nhDbw6c98C6pr492/leEAU040q1D8JLJfxmvOt6b1NC5BtBi+jCFUj9bFlIzLmSuaTQwXsYE3O2jAEm5ZvAoC8boIo0VYC36kp19cSDGY/vh3JmqKMrelGLJPI5xCK/Orc4tB2jT/brbsgo2YzrhlQQdyZy4HNMH6P71peSvUaAyPv+gML7QKhWnm3BiOA+C3vNKXDB0Ri+OG2NZ0sumbPUXhg8AtvZA4GHerqKlDuU+crgvPHcp+7EY/tiQDucRHifEIPf3Q9HtUuU7XQQ1kowXEot+7ShTfViAPiCkOfjk8CK0mCfgsCwOFEdUvJJnA=
Content-ID: <1762D7B37FC658489165B19AF619C313@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d19856f-cec3-4ada-9621-08d741065c78
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2019 15:46:27.8754 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4lS8HcPb5rxJzLV+DCKkAzTLNzC9I4z3QtkCg41ypqZdbJF9EQ7SmFaYx+O+xOo8M20olfgWl2G4gOGEdWsj69A8V1VjQVBybC0bGwqoNy0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4203
X-Mailman-Approved-At: Wed, 25 Sep 2019 04:12:01 +0000
Subject: Re: [Xen-devel] [RFC v2 0/9] error: auto propagated local_err
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
Cc: "stefanha@redhat.com" <stefanha@redhat.com>,
 "codyprime@gmail.com" <codyprime@gmail.com>,
 "jan.kiszka@siemens.com" <jan.kiszka@siemens.com>,
 "berto@igalia.com" <berto@igalia.com>,
 "zhang.zhanghailiang@huawei.com" <zhang.zhanghailiang@huawei.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "arikalo@wavecomp.com" <arikalo@wavecomp.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "hpoussin@reactos.org" <hpoussin@reactos.org>,
 "anthony.perard@citrix.com" <anthony.perard@citrix.com>,
 "samuel.thibault@ens-lyon.org" <samuel.thibault@ens-lyon.org>,
 "philmd@redhat.com" <philmd@redhat.com>,
 "green@moxielogic.com" <green@moxielogic.com>,
 "lvivier@redhat.com" <lvivier@redhat.com>,
 "ehabkost@redhat.com" <ehabkost@redhat.com>,
 "xiechanglong.d@gmail.com" <xiechanglong.d@gmail.com>,
 "pl@kamp.de" <pl@kamp.de>, "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "b.galvani@gmail.com" <b.galvani@gmail.com>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "ronniesahlberg@gmail.com" <ronniesahlberg@gmail.com>,
 "jsnow@redhat.com" <jsnow@redhat.com>, "rth@twiddle.net" <rth@twiddle.net>,
 "kwolf@redhat.com" <kwolf@redhat.com>, "andrew@aj.id.au" <andrew@aj.id.au>,
 "crwulff@gmail.com" <crwulff@gmail.com>,
 "sundeep.lkml@gmail.com" <sundeep.lkml@gmail.com>,
 "michael@walle.cc" <michael@walle.cc>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "kbastian@mail.uni-paderborn.de" <kbastian@mail.uni-paderborn.de>,
 "imammedo@redhat.com" <imammedo@redhat.com>, "fam@euphon.net" <fam@euphon.net>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "sheepdog@lists.wpkg.org" <sheepdog@lists.wpkg.org>,
 "david@redhat.com" <david@redhat.com>, "palmer@sifive.com" <palmer@sifive.com>,
 "thuth@redhat.com" <thuth@redhat.com>,
 "jcmvbkbc@gmail.com" <jcmvbkbc@gmail.com>, "hare@suse.com" <hare@suse.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "arei.gonglei@huawei.com" <arei.gonglei@huawei.com>,
 "marcel.apfelbaum@gmail.com" <marcel.apfelbaum@gmail.com>,
 "namei.unix@gmail.com" <namei.unix@gmail.com>,
 "atar4qemu@gmail.com" <atar4qemu@gmail.com>,
 "farman@linux.ibm.com" <farman@linux.ibm.com>,
 "amit@kernel.org" <amit@kernel.org>, "sw@weilnetz.de" <sw@weilnetz.de>,
 "groug@kaod.org" <groug@kaod.org>,
 "qemu-s390x@nongnu.org" <qemu-s390x@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "peter.chubb@nicta.com.au" <peter.chubb@nicta.com.au>,
 "clg@kaod.org" <clg@kaod.org>, "shorne@gmail.com" <shorne@gmail.com>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "amarkovic@wavecomp.com" <amarkovic@wavecomp.com>,
 "aurelien@aurel32.net" <aurelien@aurel32.net>,
 "pburton@wavecomp.com" <pburton@wavecomp.com>,
 "sagark@eecs.berkeley.edu" <sagark@eecs.berkeley.edu>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "edgar.iglesias@gmail.com" <edgar.iglesias@gmail.com>,
 "gxt@mprc.pku.edu.cn" <gxt@mprc.pku.edu.cn>, "ari@tuxera.com" <ari@tuxera.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 "mdroth@linux.vnet.ibm.com" <mdroth@linux.vnet.ibm.com>,
 "lersek@redhat.com" <lersek@redhat.com>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
 "antonynpavlov@gmail.com" <antonynpavlov@gmail.com>,
 "dillaman@redhat.com" <dillaman@redhat.com>, "joel@jms.id.au" <joel@jms.id.au>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "integration@gluster.org" <integration@gluster.org>,
 "balrogg@gmail.com" <balrogg@gmail.com>,
 "rjones@redhat.com" <rjones@redhat.com>,
 "Andrew.Baumann@microsoft.com" <Andrew.Baumann@microsoft.com>,
 "mreitz@redhat.com" <mreitz@redhat.com>,
 "walling@linux.ibm.com" <walling@linux.ibm.com>,
 Denis Lunev <den@virtuozzo.com>, "mst@redhat.com" <mst@redhat.com>,
 "mark.cave-ayland@ilande.co.uk" <mark.cave-ayland@ilande.co.uk>,
 "v.maffione@gmail.com" <v.maffione@gmail.com>, "marex@denx.de" <marex@denx.de>,
 "armbru@redhat.com" <armbru@redhat.com>,
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 "alistair@alistair23.me" <alistair@alistair23.me>,
 "paul.durrant@citrix.com" <paul.durrant@citrix.com>,
 "pavel.dovgaluk@ispras.ru" <pavel.dovgaluk@ispras.ru>,
 "g.lettieri@iet.unipi.it" <g.lettieri@iet.unipi.it>,
 "rizzo@iet.unipi.it" <rizzo@iet.unipi.it>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>,
 "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "xiaoguangrong.eric@gmail.com" <xiaoguangrong.eric@gmail.com>,
 "pmorel@linux.ibm.com" <pmorel@linux.ibm.com>,
 "wencongyang2@huawei.com" <wencongyang2@huawei.com>,
 "jcd@tribudubois.net" <jcd@tribudubois.net>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "stefanb@linux.ibm.com" <stefanb@linux.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

MjQuMDkuMjAxOSAxODo0NCwgVmxhZGltaXIgU2VtZW50c292LU9naWV2c2tpeSB3cm90ZToNCj4g
MjQuMDkuMjAxOSAxODoyOCwgRXJpYyBCbGFrZSB3cm90ZToNCj4+IE9uIDkvMjQvMTkgOToxMiBB
TSwgVmxhZGltaXIgU2VtZW50c292LU9naWV2c2tpeSB3cm90ZToNCj4+DQo+Pj4+PiAzLiBXaGF0
IHRvIGRvIHdpdGggaHVnZSBhdXRvLWdlbmVyYXRlZCBjb21taXQgMDc/IFNob3VsZCBJIHNwbGl0
IGl0DQo+Pj4+PiBwZXItbWFpbnRhaW5lciBvciBwZXItc3Vic3lzdGVtLCBvciBsZWF2ZSBpdCBh
cy1pcz8NCj4+Pj4NCj4+Pj4gSXQncyBiaWcuIEknZCBzcGxpdCBpdCBpbnRvIG11bHRpcGxlIHBh
dGNoZXMgKGFuZCByZWR1Y2UgdGhlIGNjIC0gZXhjZXB0DQo+Pj4+IGZvciB0aGUgY292ZXIgbGV0
dGVyLCB0aGUgcmVzdCBvZiB0aGUgcGF0Y2hlcyBjYW4gYmUgbGltaXRlZCB0byB0aGUNCj4+Pj4g
YWN0dWFsIG1haW50YWluZXIvc3Vic3lzdGVtIGFmZmVjdGVkIHJhdGhlciB0aGFuIGV2ZXJ5b25l
IGludm9sdmVkDQo+Pj4+IGFueXdoZXJlIGVsc2UgaW4gdGhlIHNlcmllcy4gV2l0aCB0aGUgY3Vy
cmVudCBsYXJnZSBjYywgYW55b25lIHRoYXQNCj4+Pj4gcmVwbGllcyBnZXRzIHNldmVyYWwgbWFp
bCBib3VuY2VzIGFib3V0ICJ0b28gbWFueSByZWNpcGllbnRzIikuwqAgSXQgbWF5DQo+Pj4+IGJl
IGVhc2llciB0byBzcGxpdCBhbG9uZyBkaXJlY3RvcnkgYm91bmRhcmllcyB0aGFuIGJ5IG1haW50
YWluZXINCj4+Pj4gYm91bmRhcmllcy7CoCBNYXJrdXMgaGFzIGFwcGxpZWQgbGFyZ2UgdHJlZS13
aWRlIENvY2NpbmVsbGUgY2xlYW51cHMNCj4+Pj4gYmVmb3JlLCBtYXliZSBoZSBoYXMgc29tZSBh
ZHZpY2UuDQo+Pj4NCj4+Pg0KPj4+IElmIHNwbGl0IGJ5IHN1YnN5c3RlbSBpdCB3b3VsZCBiZSAy
MDArIHBhdGNoZXM6DQo+Pj4gZ2l0IGRpZmYgLS1uYW1lLW9ubHkgfCB3aGlsZSByZWFkIGY7IGRv
IHNjcmlwdHMvZ2V0X21haW50YWluZXIucGwgLWYgJGYgLS1zdWJzeXN0ZW0gLS1uby1yb2xlc3Rh
dHMgMj4vZGV2L251bGwgfCBncmVwIC12IEAgfCBoZWFkIC0xOyBkb25lIHwgc29ydCB8IHVuaXEg
fCB3YyAtbA0KPj4+IDIwNQ0KPj4+DQo+Pj4NCj4+PiBUcnkgdG8gbG9vayBhdCBsYXJnZXIgc3Vi
c3lzdGVtOg0KPj4+IGdpdCBkaWZmIC0tbmFtZS1vbmx5IHwgd2hpbGUgcmVhZCBmOyBkbyBzY3Jp
cHRzL2dldF9tYWludGFpbmVyLnBsIC1mICRmIC0tc3Vic3lzdGVtIC0tbm8tcm9sZXN0YXRzIDI+
L2Rldi9udWxsIHwgZ3JlcCAtdiBAIHwgdGFpbCAtMiB8IGhlYWQgLTE7IGRvbmUgfCBzb3J0IHwg
dW5pcSB8IHdjIC1sDQo+Pj4gMTM5DQo+Pj4NCj4+PiBzdGlsbCB0b28gbWFueS4uIE9yIGlzIGl0
IE9LPw0KPj4NCj4+IEhtbSAtIHRoYXQgYmVjb21lcyBhIHRyYWRlb2ZmIGluIGxlbmd0aCBvZiB0
aGUgc2VyaWVzICh3aGVyZSBpbmRpdmlkdWFsDQo+PiBwYXRjaGVzIG1heSBiZSByZXZpZXdlZCBm
YXN0LCBidXQgd2hlcmUgdGhlIG92ZXJhbGwgcHJvY2VzcyBtYXkgYmUNCj4+IGJvZ2dlZCBkb3du
IGJ5IHNoZWVyIGxlbmd0aCksIHZzLiBsZW5ndGggb2YgaW5kaXZpZHVhbCBlbWFpbHMgKHdoZXJl
IHRoZQ0KPj4gZW1haWwgaXRzZWxmIGlzIGRhdW50aW5nLCBidXQgYXMgdGhlIHJldmlldyBpcyBt
ZWNoYW5pY2FsIGFuZCBkb25lIGJ5DQo+PiBhdXRvbWF0aW9uLCBpdCBiZWNvbWVzIGEgbWF0dGVy
IG9mIHNwb3QtY2hlY2tpbmcgaWYgd2UgdHJ1c3QgdGhhdCB0aGUNCj4+IGF1dG9tYXRpb24gd2Fz
IGRvbmUgY29ycmVjdGx5KS7CoCBZb3UgY2FuIHByb2JhYmx5IGdyb3VwIGl0IGluIGZld2VyDQo+
PiBwYXRjaGVzLCBieSBqb2luaW5nIHNtYWxsZXIgcGF0Y2hlcyBhY3Jvc3MgYSBjb3VwbGUgb2Yg
c3Vic3lzdGVtcy7CoCBJdCdzDQo+PiBhbiBhcnQgZm9ybSwgdGhlcmUncyBwcm9iYWJseSBzZXZl
cmFsIHdheXMgdG8gZG8gaXQgdGhhdCB3b3VsZCB3b3JrLCBhbmQNCj4+IGl0IGNvbWVzIGRvd24g
dG8gYSBqdWRnbWVudCBjYWxsIG9uIGhvdyBtdWNoIHdvcmsgeW91IHdhbnQgdG8gZG8gdG8gdHJ5
DQo+PiBhbmQgcmVkdWNlIG90aGVyJ3Mgd29yayBpbiByZXZpZXdpbmcgaXQuwqAgTWF5YmUgZXZl
biBhbiBvZmYtaGFuZCBzcGxpdA0KPj4gb2YgZ2F0aGVyaW5nIGZpbGVzIHVudGlsIHlvdSByZWFj
aCBhYm91dCA1MDAgb3Igc28gbGluZXMgcGVyIGRpZmYuwqAgSQ0KPj4gd2lzaCBJIGhhZCBlYXNp
ZXIgYWR2aWNlIG9uIGhvdyB0byB0YWNrbGUgdGhpcyBzb3J0IG9mIHByb2plY3QgaW4gdGhlDQo+
PiB3YXkgdGhhdCB3aWxsIGdldCB0aGUgZmFzdGVzdCByZXNwb25zZSB0aW1lLg0KPj4NCj4+DQo+
Pj4+PiDCoMKgIHZsLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAxMyArLQ0KPj4+Pj4g
wqDCoCBzY3JpcHRzL2NvY2NpbmVsbGUvYXV0by1wcm9wYWdhdGVkLWVycnAuY29jY2kgfMKgIDgy
ICsrKysrKysNCj4+Pj4+IMKgwqAgMzE5IGZpbGVzIGNoYW5nZWQsIDI3MjkgaW5zZXJ0aW9ucygr
KSwgNDI0NSBkZWxldGlvbnMoLSkNCj4+Pj4+IMKgwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IHNjcmlw
dHMvY29jY2luZWxsZS9hdXRvLXByb3BhZ2F0ZWQtZXJycC5jb2NjaQ0KPj4+Pg0KPj4+PiBUaGUg
ZGlmZnN0YXQgaXMgaHVnZSwgYnV0IHByb21pc2luZy4NCj4+DQo+PiBXZSBhbHNvIGxlYXJuZWQg
aW4gcmV2aWV3cyBvZiA3LzkgdGhhdCB0aGUgZGlmZnN0YXQgaGVyZSBpcyBtaXNsZWFkaW5nLA0K
Pj4gdGhlIG51bWJlciBvZiBpbnNlcnRpb25zIHdpbGwgZGVmaW5pdGVseSBiZSBpbmNyZWFzaW5n
IG9uY2UgdGhlDQo+PiBDb2NjaW5lbGxlIHNjcmlwdCBpcyBmaXhlZCB0byBpbnNlcnQgdGhlIG1h
Y3JvIGluIG1vcmUgZnVuY3Rpb25zLCBidXQNCj4+IGhvcGVmdWxseSBpdCdzIHN0aWxsIGEgbmV0
IHJlZHVjdGlvbiBpbiBvdmVyYWxsIGxpbmVzLg0KPj4NCj4gDQo+IE5vIGhvcGUgZm9yIHVzOiB3
aXRoIGZpeGVkIHNjcmlwdCBJIG5vdyBzZWUNCj4gDQo+IDkxOSBmaWxlcyBjaGFuZ2VkLCA2NDI1
IGluc2VydGlvbnMoKyksIDQyMzQgZGVsZXRpb25zKC0pDQo+IA0KDQpBbHNvLCBJIGhhdmUgYWRk
IGluY2x1ZGUgInFhcGkvZXJyb3IuaCIgdG8gZmlsZXMsIHdoZXJlIGVycnAgb25seSBwYXNzZWQN
CnRvIGNhbGxlZCBmdW5jdGlvbnMgKG9yIGZvciBmdW5jdGlvbnMsIHdoaWNoIGFyZSBub3Qgc2lt
cGxlIHN0dWJzKToNCg0KIyBnaXQgZGlmZiB8IGdyZXAgJysjaW5jbHVkZScgfCB3YyAtbA0KMjUz
DQoNCg0KLS0gDQpCZXN0IHJlZ2FyZHMsDQpWbGFkaW1pcg0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
