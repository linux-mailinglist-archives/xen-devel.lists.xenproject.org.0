Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8524EBD707
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 06:15:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCyeq-0008FI-Cz; Wed, 25 Sep 2019 04:12:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jCV4=XT=virtuozzo.com=vsementsov@srs-us1.protection.inumbo.net>)
 id 1iCnOV-0005I1-WC
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 16:10:28 +0000
X-Inumbo-ID: d17534c0-dee5-11e9-bf31-bc764e2007e4
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe08::711]) by localhost (Halon) with ESMTPS
 id d17534c0-dee5-11e9-bf31-bc764e2007e4;
 Tue, 24 Sep 2019 16:10:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wbo93jgSpJhitUlMrJBJiNZoCP9shTy/sRsWQa/0vK6ifNMftrmYAa+ivM8u7BHZeS0MgHuNbiJs2uxqLZ7Vf6u/k1y1YaoJSzp2Ne+Ei8ERo4fwrJ05DSPXlIzN4b54gDpaltX4ybvFTZILZkfDuebInrIxE+YXM75/lX7tOaH7jpMDTG3/weSMn4/jpO774hv8LpDsZiP9vZMdfIkROTcaHJeam4x/G1EPsoACPAqhR129aTFAjLXRsT8WYfTMF26kSmhEZ1OgFUyirx0y53T174vxmT7zI+TC+L6QRRI9tTdwsXyRgR8CD/DduCYz1JQw1J/zfzGk/wactgtkuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mkX9PA85Z3c+NsQAK74o/lDeyeQUnUYUnBRcLQhvkzc=;
 b=m9e67ytV5VqTgqfjCu3TIzYeWspr3nncVL6xcdrCNNRempzlLR9saH+q0XxzX/QwUvLSdhq2xvo4Hd1IsTELGRXAJ0vgrMJYaXdAcq9RWacG8rdWhDDZJQrvapr0KuM7SIapXZRg1dCSV5NUDSCK2GnrdXulJruj0gW+WyKYOQDEFutqwH7qKg/PGw+Bk8V/u+zXElaGPHeWy8zn8uQEHFIWRdaxSjMzUDn/X8j23Al1Z054ANfDSM6leX61KJ7LxdV2rlyeMxCH1tLKWPqbyIIRb+KVg/ExQQAw58nSsO9IbeY1bSEGzOL+n4Q9ufxbe6OQFKapMMok65QqjyVHZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mkX9PA85Z3c+NsQAK74o/lDeyeQUnUYUnBRcLQhvkzc=;
 b=ODsjgLzXPhpOHiqC+NeexpF4+yg7pS5S+TMzRb2D0UVdSJpxsmc6vrt6LyKryhvPRTYnXjpgFdxEjH4fpJNVFgquwh9Td/3MlDa37NPEB4/rs6v/qIHJFL+PI5XNLVIZbXESXhqtvAKLr7o8Zhy7JV8/ML7+uJEXdcv70de3xuI=
Received: from DB8PR08MB5498.eurprd08.prod.outlook.com (52.133.242.216) by
 DB8PR08MB5099.eurprd08.prod.outlook.com (10.255.18.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.26; Tue, 24 Sep 2019 16:10:24 +0000
Received: from DB8PR08MB5498.eurprd08.prod.outlook.com
 ([fe80::b5c0:6b97:438d:77ed]) by DB8PR08MB5498.eurprd08.prod.outlook.com
 ([fe80::b5c0:6b97:438d:77ed%2]) with mapi id 15.20.2284.023; Tue, 24 Sep 2019
 16:10:24 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Eric Blake <eblake@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Thread-Topic: [RFC v2 0/9] error: auto propagated local_err
Thread-Index: AQHVcioNiDMY2yo+Z0yF9jZaFGvJZ6c5qyCAgAFm+wD//+MaAIAANo8AgAAAnICAAAD3AP//026A
Date: Tue, 24 Sep 2019 16:10:23 +0000
Message-ID: <693d8f68-5ab8-71f3-1b2d-cd33f654d3a2@virtuozzo.com>
References: <20190923161231.22028-1-vsementsov@virtuozzo.com>
 <d1527fdc-b5e8-093a-9206-6f7ceeece2ac@redhat.com>
 <84c9e5dd-3e0f-94e1-5da1-2c7baa594bf1@virtuozzo.com>
 <22191b09-822a-1f54-dcaa-3726c833805b@redhat.com>
 <97b77e48-b370-a596-0a06-9ceaaf6bc72e@virtuozzo.com>
 <824bb514-fc6f-7adc-4f4f-97dd758fb04d@virtuozzo.com>
 <0bc76371-c667-3fa7-8fea-c3c3df84a7d6@virtuozzo.com>
In-Reply-To: <0bc76371-c667-3fa7-8fea-c3c3df84a7d6@virtuozzo.com>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0301CA0005.eurprd03.prod.outlook.com
 (2603:10a6:3:76::15) To DB8PR08MB5498.eurprd08.prod.outlook.com
 (2603:10a6:10:11c::24)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vsementsov@virtuozzo.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20190924191015234
x-originating-ip: [185.231.240.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 43df7101-4bfd-45b8-73df-08d74109b476
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DB8PR08MB5099; 
x-ms-traffictypediagnostic: DB8PR08MB5099:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR08MB50997BB021D43D59E7A25441C1840@DB8PR08MB5099.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0170DAF08C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(366004)(376002)(396003)(39850400004)(346002)(189003)(199004)(102836004)(36756003)(66476007)(2501003)(229853002)(64756008)(81166006)(81156014)(8676002)(66556008)(14454004)(71200400001)(256004)(478600001)(71190400001)(31686004)(2906002)(3846002)(6116002)(25786009)(7336002)(6512007)(7416002)(486006)(6246003)(86362001)(4326008)(31696002)(2616005)(476003)(7366002)(186003)(8936002)(5660300002)(99286004)(76176011)(7406005)(446003)(11346002)(54906003)(6486002)(52116002)(26005)(110136005)(66066001)(7736002)(53546011)(316002)(66446008)(66946007)(7276002)(305945005)(386003)(6506007)(6436002)(45426003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB8PR08MB5099;
 H:DB8PR08MB5498.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: virtuozzo.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: HJ3RgibEymuDHOAgXSQeOhBEBc/lrNvbi9A9xcm6kSFDV+u6OZXVG9RBmK7ffx/UkLfOuqgXAkPwe4puZ5ejb5Z3Ohxk6FCouPhCwGlc7mnA1reuO+Z9fIjXSt8q5NdMydkNprlfsUT2Y3+iqijhrDbAmnIL7CY+Z9HVy3CBWIG/r0Ect3dwR5RsC0BJOisLFTT3b9DCO7rSUhnrOZgTkhfReI8DzQDcrMpZWFU9/tmIW+ItlR7L6V6pmp5N6Q4rhYHwSZREqISu+kb8hUoSzrM42ftMOdPAMT/JckhnqLrOAOPF1sSxZOk2HyMwZcPTOO8sKqHn2ZielUyxtz+sw1Ap36TCSFz9QzSTz8aE4TWQZg3TxLh3vZiuiXfZr8L8aoUNdD54nsQ7yBCmLVSVDCGNKUV5N/RePz+wt24cwWE=
Content-ID: <71B78CFDAE40C64BABE9E074DF095940@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43df7101-4bfd-45b8-73df-08d74109b476
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2019 16:10:23.9601 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aJt0ghZNHMqdswRSbUXaf2MGzKF2E4MwdBNYDAqqpZBL9mDsC5SUeVJaXRnGtC1OnADSVOTQosyiK5BUu6IRwipsUmvSs7AK++6n+UOHfDs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5099
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

MjQuMDkuMjAxOSAxODo0OSwgVmxhZGltaXIgU2VtZW50c292LU9naWV2c2tpeSB3cm90ZToNCj4g
MjQuMDkuMjAxOSAxODo0NiwgVmxhZGltaXIgU2VtZW50c292LU9naWV2c2tpeSB3cm90ZToNCj4+
IDI0LjA5LjIwMTkgMTg6NDQsIFZsYWRpbWlyIFNlbWVudHNvdi1PZ2lldnNraXkgd3JvdGU6DQo+
Pj4gMjQuMDkuMjAxOSAxODoyOCwgRXJpYyBCbGFrZSB3cm90ZToNCj4+Pj4gT24gOS8yNC8xOSA5
OjEyIEFNLCBWbGFkaW1pciBTZW1lbnRzb3YtT2dpZXZza2l5IHdyb3RlOg0KPj4+Pg0KPj4+Pj4+
PiAzLiBXaGF0IHRvIGRvIHdpdGggaHVnZSBhdXRvLWdlbmVyYXRlZCBjb21taXQgMDc/IFNob3Vs
ZCBJIHNwbGl0IGl0DQo+Pj4+Pj4+IHBlci1tYWludGFpbmVyIG9yIHBlci1zdWJzeXN0ZW0sIG9y
IGxlYXZlIGl0IGFzLWlzPw0KPj4+Pj4+DQo+Pj4+Pj4gSXQncyBiaWcuIEknZCBzcGxpdCBpdCBp
bnRvIG11bHRpcGxlIHBhdGNoZXMgKGFuZCByZWR1Y2UgdGhlIGNjIC0gZXhjZXB0DQo+Pj4+Pj4g
Zm9yIHRoZSBjb3ZlciBsZXR0ZXIsIHRoZSByZXN0IG9mIHRoZSBwYXRjaGVzIGNhbiBiZSBsaW1p
dGVkIHRvIHRoZQ0KPj4+Pj4+IGFjdHVhbCBtYWludGFpbmVyL3N1YnN5c3RlbSBhZmZlY3RlZCBy
YXRoZXIgdGhhbiBldmVyeW9uZSBpbnZvbHZlZA0KPj4+Pj4+IGFueXdoZXJlIGVsc2UgaW4gdGhl
IHNlcmllcy4gV2l0aCB0aGUgY3VycmVudCBsYXJnZSBjYywgYW55b25lIHRoYXQNCj4+Pj4+PiBy
ZXBsaWVzIGdldHMgc2V2ZXJhbCBtYWlsIGJvdW5jZXMgYWJvdXQgInRvbyBtYW55IHJlY2lwaWVu
dHMiKS7CoCBJdCBtYXkNCj4+Pj4+PiBiZSBlYXNpZXIgdG8gc3BsaXQgYWxvbmcgZGlyZWN0b3J5
IGJvdW5kYXJpZXMgdGhhbiBieSBtYWludGFpbmVyDQo+Pj4+Pj4gYm91bmRhcmllcy7CoCBNYXJr
dXMgaGFzIGFwcGxpZWQgbGFyZ2UgdHJlZS13aWRlIENvY2NpbmVsbGUgY2xlYW51cHMNCj4+Pj4+
PiBiZWZvcmUsIG1heWJlIGhlIGhhcyBzb21lIGFkdmljZS4NCj4+Pj4+DQo+Pj4+Pg0KPj4+Pj4g
SWYgc3BsaXQgYnkgc3Vic3lzdGVtIGl0IHdvdWxkIGJlIDIwMCsgcGF0Y2hlczoNCj4+Pj4+IGdp
dCBkaWZmIC0tbmFtZS1vbmx5IHwgd2hpbGUgcmVhZCBmOyBkbyBzY3JpcHRzL2dldF9tYWludGFp
bmVyLnBsIC1mICRmIC0tc3Vic3lzdGVtIC0tbm8tcm9sZXN0YXRzIDI+L2Rldi9udWxsIHwgZ3Jl
cCAtdiBAIHwgaGVhZCAtMTsgZG9uZSB8IHNvcnQgfCB1bmlxIHwgd2MgLWwNCj4+Pj4+IDIwNQ0K
Pj4+Pj4NCj4+Pj4+DQo+Pj4+PiBUcnkgdG8gbG9vayBhdCBsYXJnZXIgc3Vic3lzdGVtOg0KPj4+
Pj4gZ2l0IGRpZmYgLS1uYW1lLW9ubHkgfCB3aGlsZSByZWFkIGY7IGRvIHNjcmlwdHMvZ2V0X21h
aW50YWluZXIucGwgLWYgJGYgLS1zdWJzeXN0ZW0gLS1uby1yb2xlc3RhdHMgMj4vZGV2L251bGwg
fCBncmVwIC12IEAgfCB0YWlsIC0yIHwgaGVhZCAtMTsgZG9uZSB8IHNvcnQgfCB1bmlxIHwgd2Mg
LWwNCj4+Pj4+IDEzOQ0KPj4+Pj4NCj4+Pj4+IHN0aWxsIHRvbyBtYW55Li4gT3IgaXMgaXQgT0s/
DQo+Pj4+DQo+Pj4+IEhtbSAtIHRoYXQgYmVjb21lcyBhIHRyYWRlb2ZmIGluIGxlbmd0aCBvZiB0
aGUgc2VyaWVzICh3aGVyZSBpbmRpdmlkdWFsDQo+Pj4+IHBhdGNoZXMgbWF5IGJlIHJldmlld2Vk
IGZhc3QsIGJ1dCB3aGVyZSB0aGUgb3ZlcmFsbCBwcm9jZXNzIG1heSBiZQ0KPj4+PiBib2dnZWQg
ZG93biBieSBzaGVlciBsZW5ndGgpLCB2cy4gbGVuZ3RoIG9mIGluZGl2aWR1YWwgZW1haWxzICh3
aGVyZSB0aGUNCj4+Pj4gZW1haWwgaXRzZWxmIGlzIGRhdW50aW5nLCBidXQgYXMgdGhlIHJldmll
dyBpcyBtZWNoYW5pY2FsIGFuZCBkb25lIGJ5DQo+Pj4+IGF1dG9tYXRpb24sIGl0IGJlY29tZXMg
YSBtYXR0ZXIgb2Ygc3BvdC1jaGVja2luZyBpZiB3ZSB0cnVzdCB0aGF0IHRoZQ0KPj4+PiBhdXRv
bWF0aW9uIHdhcyBkb25lIGNvcnJlY3RseSkuwqAgWW91IGNhbiBwcm9iYWJseSBncm91cCBpdCBp
biBmZXdlcg0KPj4+PiBwYXRjaGVzLCBieSBqb2luaW5nIHNtYWxsZXIgcGF0Y2hlcyBhY3Jvc3Mg
YSBjb3VwbGUgb2Ygc3Vic3lzdGVtcy7CoCBJdCdzDQo+Pj4+IGFuIGFydCBmb3JtLCB0aGVyZSdz
IHByb2JhYmx5IHNldmVyYWwgd2F5cyB0byBkbyBpdCB0aGF0IHdvdWxkIHdvcmssIGFuZA0KPj4+
PiBpdCBjb21lcyBkb3duIHRvIGEganVkZ21lbnQgY2FsbCBvbiBob3cgbXVjaCB3b3JrIHlvdSB3
YW50IHRvIGRvIHRvIHRyeQ0KPj4+PiBhbmQgcmVkdWNlIG90aGVyJ3Mgd29yayBpbiByZXZpZXdp
bmcgaXQuwqAgTWF5YmUgZXZlbiBhbiBvZmYtaGFuZCBzcGxpdA0KPj4+PiBvZiBnYXRoZXJpbmcg
ZmlsZXMgdW50aWwgeW91IHJlYWNoIGFib3V0IDUwMCBvciBzbyBsaW5lcyBwZXIgZGlmZi7CoCBJ
DQo+Pj4+IHdpc2ggSSBoYWQgZWFzaWVyIGFkdmljZSBvbiBob3cgdG8gdGFja2xlIHRoaXMgc29y
dCBvZiBwcm9qZWN0IGluIHRoZQ0KPj4+PiB3YXkgdGhhdCB3aWxsIGdldCB0aGUgZmFzdGVzdCBy
ZXNwb25zZSB0aW1lLg0KPiANCj4gZ2l0IGRpZmYgfCB3YyAtbA0KPiA0ODk0MQ0KPiANCj4gc28s
IGJ5IDUwMCBsaW5lcyBpdCB3b3VsZCBiZSA5NyBwYXRjaGVzLg0KPiANCj4gU2VlbXMsIHdlJ2xs
IG5ldmVyIGJlIGFibGUgdG8gcmV2aWV3IHRoaXMgdGhpbmcgOigNCj4gDQo+IEFueSBpZGVhcz8N
Cj4gDQo+IE1heSBiZSwgc2VwYXJhdGUgYmlnIHBhdGNoLCB3aGljaCBqdXN0IGFkZCBFUlJQX0ZV
TkNUSU9OX0JFR0lOKCkgdG8gYWxsIGVycnAgZnVuY3Rpb25zPw0KDQpjaGVja2VkOiBmb3IgcmVt
YWluaW5nIGltcHJvdmVtZW50czoNCmdpdCBkaWZmIHwgd2MgLWwNCjIwMjE4DQoNCmdpdCBkaWZm
IC0tbmFtZS1vbmx5IHwgd2hpbGUgcmVhZCBmOyBkbyBzY3JpcHRzL2dldF9tYWludGFpbmVyLnBs
IC1mICRmIC0tc3Vic3lzdGVtIC0tbm8tcm9sZXN0YXRzIDI+L2Rldi9udWxsIHwgZ3JlcCAtdiBA
IHwgdGFpbCAtMiB8IGhlYWQgLTE7IGRvbmUgfCBzb3J0IHwgdW5pcSB8IHdjIC1sDQo5MA0KDQpT
dGlsbCwgdG9vIG11Y2guLg0KDQpJIHRoaW5rIHdlIHNob3VsZCBzd2l0Y2ggdG8gcGxhbiBCLCBh
dCBsZWFzdCBhcyBzb21ldGhpbmcgdGhhdCBtYXkgYmUgbWVyZ2VkIHRvIDQuMg0KDQoNCj4gDQo+
Pj4+DQo+Pj4+DQo+Pj4+Pj4+IMKgwqAgdmwuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKg
IDEzICstDQo+Pj4+Pj4+IMKgwqAgc2NyaXB0cy9jb2NjaW5lbGxlL2F1dG8tcHJvcGFnYXRlZC1l
cnJwLmNvY2NpIHzCoCA4MiArKysrKysrDQo+Pj4+Pj4+IMKgwqAgMzE5IGZpbGVzIGNoYW5nZWQs
IDI3MjkgaW5zZXJ0aW9ucygrKSwgNDI0NSBkZWxldGlvbnMoLSkNCj4+Pj4+Pj4gwqDCoCBjcmVh
dGUgbW9kZSAxMDA2NDQgc2NyaXB0cy9jb2NjaW5lbGxlL2F1dG8tcHJvcGFnYXRlZC1lcnJwLmNv
Y2NpDQo+Pj4+Pj4NCj4+Pj4+PiBUaGUgZGlmZnN0YXQgaXMgaHVnZSwgYnV0IHByb21pc2luZy4N
Cj4+Pj4NCj4+Pj4gV2UgYWxzbyBsZWFybmVkIGluIHJldmlld3Mgb2YgNy85IHRoYXQgdGhlIGRp
ZmZzdGF0IGhlcmUgaXMgbWlzbGVhZGluZywNCj4+Pj4gdGhlIG51bWJlciBvZiBpbnNlcnRpb25z
IHdpbGwgZGVmaW5pdGVseSBiZSBpbmNyZWFzaW5nIG9uY2UgdGhlDQo+Pj4+IENvY2NpbmVsbGUg
c2NyaXB0IGlzIGZpeGVkIHRvIGluc2VydCB0aGUgbWFjcm8gaW4gbW9yZSBmdW5jdGlvbnMsIGJ1
dA0KPj4+PiBob3BlZnVsbHkgaXQncyBzdGlsbCBhIG5ldCByZWR1Y3Rpb24gaW4gb3ZlcmFsbCBs
aW5lcy4NCj4+Pj4NCj4+Pg0KPj4+IE5vIGhvcGUgZm9yIHVzOiB3aXRoIGZpeGVkIHNjcmlwdCBJ
IG5vdyBzZWUNCj4+Pg0KPj4+IDkxOSBmaWxlcyBjaGFuZ2VkLCA2NDI1IGluc2VydGlvbnMoKyks
IDQyMzQgZGVsZXRpb25zKC0pDQo+Pj4NCj4+DQo+PiBBbHNvLCBJIGhhdmUgYWRkIGluY2x1ZGUg
InFhcGkvZXJyb3IuaCIgdG8gZmlsZXMsIHdoZXJlIGVycnAgb25seSBwYXNzZWQNCj4+IHRvIGNh
bGxlZCBmdW5jdGlvbnMgKG9yIGZvciBmdW5jdGlvbnMsIHdoaWNoIGFyZSBub3Qgc2ltcGxlIHN0
dWJzKToNCj4+DQo+PiAjIGdpdCBkaWZmIHwgZ3JlcCAnKyNpbmNsdWRlJyB8IHdjIC1sDQo+PiAy
NTMNCj4+DQo+Pg0KPiANCj4gDQoNCg0KLS0gDQpCZXN0IHJlZ2FyZHMsDQpWbGFkaW1pcg0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
