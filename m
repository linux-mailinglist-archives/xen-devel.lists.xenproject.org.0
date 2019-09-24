Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E5CBCA1C
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 16:22:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCldC-00071M-Ur; Tue, 24 Sep 2019 14:17:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jCV4=XT=virtuozzo.com=vsementsov@srs-us1.protection.inumbo.net>)
 id 1iClYP-0006VC-3o
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 14:12:33 +0000
X-Inumbo-ID: 58383c3e-ded5-11e9-bf31-bc764e2007e4
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.15.99]) by localhost (Halon) with ESMTPS
 id 58383c3e-ded5-11e9-bf31-bc764e2007e4;
 Tue, 24 Sep 2019 14:12:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ELCM/E/+GoSg3iP5bngCVthjx0HaL2dtPGGi7zUBayl/Ldt/mG8y/0rvFh9ZWj6UvQGI3fcVbCxRZjcoB8MlXPUsG8wzkXyPxZNyBbZOaFmZbJylrvDf5I2KbH7b549XiFwW3xuoAnve5DR3mjBo2FU/MKZeMACR2zYdtNZgspRuIsDv1ulgvJtuc+MHO1R277TLoeCmS7tTWHU88FYLwRJ2+3NOtx81N7GzFMRQHA6/Q7DLF0FtMQUCvIwkNT69HFyA5kaUXIgUfR5XJ0wwglSeyXk3erNlRpYVd42oHR0R0F/ikGupeWIFxjbT3uqs3tRIDQZ7lSTQ7JmHbjjGqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EShyzVNnfsq+m1R3kTZe3+NngEgMJOnRTYQlPtwqHE8=;
 b=C0bH3xBOYEwxiwpSUwDvKgmJrwemcPWZWaCrvnvwzfvF8GbMKxZj0LUWxmq6bx7PnpOVJEpyOAOfnktC93KGRdWQI/6bhxrHpket0tm84SXZ98r7j6lfU38Lzb378+z708g84d2e99XMXRyYQHkDeS3yp/bvUxkj4jc43VPOJbf4Gn4RQbZ//leKaoG2WiWsfMeg0m+aJqfgOm5UEVQ7121QPdarj58XcSlpRPKoet76GBXV+NXiLql4w3wbvyx8t24E2RB4cQWZAkgHfuTBWbBC3XTivr38y0aTaIenVY7nrkoZVmhxxSAXokFnl/Aybunke9PHSBhwn3/b7qxbvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EShyzVNnfsq+m1R3kTZe3+NngEgMJOnRTYQlPtwqHE8=;
 b=it5T5WYeLTi4bfJvJDVSyVS94HajOtRGvTqG9jc/YEHn2zH2aaIdqm6YoV2hciOvGok4le2z/YhJFcKpsRQ9q8Tr7P5CFcnRbvx7ZXL2vtfndCz+UGQ/rfRavvIk2Rl96VKkDKWgUuTFuFXZ/T8Z1fhTxHC0rktRVLO00BQ+djo=
Received: from DB8PR08MB5498.eurprd08.prod.outlook.com (52.133.242.216) by
 DB8PR08MB5499.eurprd08.prod.outlook.com (10.255.185.80) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Tue, 24 Sep 2019 14:12:28 +0000
Received: from DB8PR08MB5498.eurprd08.prod.outlook.com
 ([fe80::b5c0:6b97:438d:77ed]) by DB8PR08MB5498.eurprd08.prod.outlook.com
 ([fe80::b5c0:6b97:438d:77ed%2]) with mapi id 15.20.2284.023; Tue, 24 Sep 2019
 14:12:28 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Eric Blake <eblake@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Thread-Topic: [RFC v2 0/9] error: auto propagated local_err
Thread-Index: AQHVcioNiDMY2yo+Z0yF9jZaFGvJZ6c5qyCAgAE0sQA=
Date: Tue, 24 Sep 2019 14:12:27 +0000
Message-ID: <84c9e5dd-3e0f-94e1-5da1-2c7baa594bf1@virtuozzo.com>
References: <20190923161231.22028-1-vsementsov@virtuozzo.com>
 <d1527fdc-b5e8-093a-9206-6f7ceeece2ac@redhat.com>
In-Reply-To: <d1527fdc-b5e8-093a-9206-6f7ceeece2ac@redhat.com>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0102CA0011.eurprd01.prod.exchangelabs.com
 (2603:10a6:7:14::24) To DB8PR08MB5498.eurprd08.prod.outlook.com
 (2603:10a6:10:11c::24)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vsementsov@virtuozzo.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20190924171218850
x-originating-ip: [185.231.240.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 74f98eea-dffb-4cb5-6359-08d740f93ac2
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DB8PR08MB5499; 
x-ms-traffictypediagnostic: DB8PR08MB5499:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR08MB54999C21BC3C6DBA608BA2B3C1840@DB8PR08MB5499.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0170DAF08C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(346002)(366004)(39840400004)(376002)(396003)(53754006)(189003)(199004)(5660300002)(2616005)(110136005)(66476007)(8676002)(64756008)(76176011)(6486002)(36756003)(7406005)(7366002)(486006)(66446008)(7336002)(7276002)(7416002)(6436002)(26005)(8936002)(81156014)(3846002)(2501003)(4326008)(102836004)(99286004)(6246003)(14454004)(256004)(229853002)(25786009)(6116002)(71200400001)(2906002)(186003)(561944003)(53546011)(305945005)(81166006)(66066001)(478600001)(446003)(66556008)(31686004)(86362001)(6512007)(14444005)(31696002)(71190400001)(45426003)(386003)(7736002)(316002)(6506007)(476003)(66946007)(11346002)(52116002)(54906003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB8PR08MB5499;
 H:DB8PR08MB5498.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: virtuozzo.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: oqcVTIws6ZnDFyzuCKuJWmEtQ0hYs393hdLCh1r50121Tc+EP+RoMYjJp6J0Hhm6mRE6FixzdwQIzzyiF2Vf2bJizqEw6lH8xkWaEGwBKvr6JV25sqyfBOJu7NB6YexdN7iBoZKGnS/WaZE52/SbU6ZirgGJX7OPMoKuJgMnp/pUsBZ4KOKFIjKTfgJuSUWesrjB+2lFZeOQcpDX6tc0mpC5jXac6yUBeHccUYgb6HFGZmlLSS0n4hrvI5execQ2hqRdtgKjjQ8hW8Vu0kBSPq4+zzN12owzIdLuun2ueBdFBs3iZVQYHJwWdxXWrpgXomh/FhkvcnOxLk64DVEro0z7UfqOlsOccgRG6jxkWYc3fqALtIIdyUDPsdl6iZjZhuVGZg9RE1qwyfyOQAvrlk9WwWgLj9H7LvuJIruJqtc=
Content-ID: <8873F6F1E58A3C4088DBF0000F0A9012@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74f98eea-dffb-4cb5-6359-08d740f93ac2
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2019 14:12:28.0232 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cJfG5Oe+V4fXeywTaKDBZedEkw3L2aJtGDIMhqrG0EqBHHLH+8Jz9EedThHxu1syfJ3w37qXcPkcHDHRO/yoL8jIdH/ao/YYQHijIDQ221o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5499
X-Mailman-Approved-At: Tue, 24 Sep 2019 14:17:30 +0000
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

MjMuMDkuMjAxOSAyMjo0NywgRXJpYyBCbGFrZSB3cm90ZToNCj4gT24gOS8yMy8xOSAxMToxMiBB
TSwgVmxhZGltaXIgU2VtZW50c292LU9naWV2c2tpeSB3cm90ZToNCj4+IEhpIGFsbCENCj4+DQo+
PiBIZXJlIGlzIGEgcHJvcG9zYWwgb2YgYXV0byBwcm9wYWdhdGlvbiBmb3IgbG9jYWxfZXJyLCB0
byBub3QgY2FsbA0KPj4gZXJyb3JfcHJvcGFnYXRlIG9uIGV2ZXJ5IGV4aXQgcG9pbnQsIHdoZW4g
d2UgZGVhbCB3aXRoIGxvY2FsX2Vyci4NCj4+DQo+PiBJdCBhbHNvIGZpeGVzIHR3byBpc3N1ZXM6
DQo+PiAxLiBGaXggaXNzdWUgd2l0aCBlcnJvcl9mYXRhbCAmIGVycm9yX2FwcGVuZF9oaW50OiB1
c2VyIGNhbid0IHNlZSB0aGVzZQ0KPj4gaGludHMsIGJlY2F1c2UgZXhpdCgpIGhhcHBlbnMgaW4g
ZXJyb3Jfc2V0ZyBlYXJsaWVyIHRoYW4gaGludCBpcw0KPj4gYXBwZW5kZWQuIFtSZXBvcnRlZCBi
eSBHcmVnIEt1cnpdDQo+Pg0KPj4gMi4gRml4IGlzc3VlIHdpdGggZXJyb3JfYWJvcnQgJiBlcnJv
cl9wcm9wYWdhdGU6IHdoZW4gd2Ugd3JhcA0KPj4gZXJyb3JfYWJvcnQgYnkgbG9jYWxfZXJyK2Vy
cm9yX3Byb3BhZ2F0ZSwgcmVzdWx0aW5nIGNvcmVkdW1wIHdpbGwNCj4+IHJlZmVyIHRvIGVycm9y
X3Byb3BhZ2F0ZSBhbmQgbm90IHRvIHRoZSBwbGFjZSB3aGVyZSBlcnJvciBoYXBwZW5lZC4NCj4+
ICh0aGUgbWFjcm8gaXRzZWxmIGRvbid0IGZpeCB0aGUgaXNzdWUsIGJ1dCBpdCBhbGxvd3MgdG8g
WzMuXSBkcm9wIGFsbA0KPiANCj4gZG9lc24ndA0KPiANCj4+IGxvY2FsX2VycitlcnJvcl9wcm9w
YWdhdGUgcGF0dGVybiwgd2hpY2ggd2lsbCBkZWZpbml0ZWx5IGZpeCB0aGUgaXNzdWUpDQo+PiBb
UmVwb3J0ZWQgYnkgS2V2aW4gV29sZl0NCj4+DQo+PiBJdCdzIHN0aWxsIGFuIFJGQywgZHVlIHRv
IHRoZSBmb2xsb3dpbmcgcmVhc29uczoNCj4+DQo+PiAxLiBJJ20gbmV3IHRvIGNvY2NpbmVsbGEs
IHNvIEkgZmFpbGVkIHRvIGRvIHRoZSBmb2xsb3dpbmcgcGF0dGVybjoNCj4+DQo+PiAgIDwuLi4N
Cj4+IC0gZ290byBvdXQ7DQo+PiArIHJldHVybjsNCj4+ICAgLi4uPg0KPj4gLSBvdXQ6DQo+PiAt
IGVycm9yX3Byb3BhZ2F0ZShlcnJwLCBsb2NhbF9lcnIpDQo+Pg0KPj4gU28sIGhlcmUgaXMgY29t
cGlsYXRpb24gZml4IDA4Li4gV2hvIGNhbiBoZWxwIHdpdGggaXQ/IElmIG5vYm9keSwgMDggaXMN
Cj4+IHRvIGJlIG1lcmdlZCB0byAwNyBieSBoYW5kLg0KPiANCj4gSSdtIG5vdCBzdXJlIGVpdGhl
cjsgYnV0IEkgYWdyZWUgdGhhdCBpZiB3ZSBjYW4ndCBmaWd1cmUgb3V0IGhvdyB0byBtYWtlDQo+
IENvY2NpbmVsbGUgZG8gcXVpdGUgd2hhdCB3ZSB3YW50LCB0aGF0IHdlIGFyZSBiZXR0ZXIgb2Zm
IHNxdWFzaGluZyBpbg0KPiBjb21waWxlIGZpeGVzLg0KPiANCj4gQWxzbywgd2hpbGUgSSBsaWtl
IENvY2NpbmVsbGUgZm9yIGF1dG9tYXRpbmcgdGhlIGNvbnZlcnNpb24sIGl0J3MgaGFyZGVyDQo+
IHRvIGdldCBldmVyeW9uZSB0byBydW4gaXQ7IGl0IHdvdWxkIGJlIG5pY2UgaWYgd2UgY291bGQg
YWxzbyBmaWd1cmUgb3V0DQo+IGEgcGF0Y2ggdG8gc2NyaXB0cy9jaGVja3BhdGNoLnBsIHRoYXQg
Zm9yIGFueSBpbnN0YW5jZSBvZiAnRXJyb3INCj4gKiplcnJwKVxue1xuJyBub3QgZm9sbG93ZWQg
YnkgZWl0aGVyIH0gb3IgdGhlIG5ldyBtYWNybywgd2UgZmxhZyB0aGF0IGFzDQo+IGEgY2hlY2tw
YXRjaCB3YXJuaW5nIG9yIGVycm9yLg0KPiANCj4+DQo+PiAyLiBRdWVzdGlvbiBhYm91dCB1c2lu
ZyBuZXcgbWFjcm8gaW4gZW1wdHkgc3R1YiBmdW5jdGlvbnMgLSBzZWUgMDkNCj4gDQo+IEl0IHdv
dWxkIGJlIG5pY2UgaWYgd2UgY291bGQgZXhlbXB0IGVtcHR5IGZ1bmN0aW9ucyAtIG5vIG5lZWQg
dG8gdXNlIHRoZQ0KPiBtYWNybyBpZiB0aGVyZSBpcyBubyBmdW5jdGlvbiBib2R5IG90aGVyd2lz
ZS4gIEknbSBub3Qgc3VyZSBpZg0KPiBDb2NjaW5lbGxlIGNhbiBkbyB0aGF0IGZpbHRlcmluZyBk
dXJpbmcgdGhlIGNvbnZlcnNpb24sIG9yIGlmIHdlIGNsZWFuDQo+IHVwIGJ5IGhhbmQgYWZ0ZXIg
dGhlIGZhY3QuDQo+IA0KPj4NCj4+IDMuIFdoYXQgdG8gZG8gd2l0aCBodWdlIGF1dG8tZ2VuZXJh
dGVkIGNvbW1pdCAwNz8gU2hvdWxkIEkgc3BsaXQgaXQNCj4+IHBlci1tYWludGFpbmVyIG9yIHBl
ci1zdWJzeXN0ZW0sIG9yIGxlYXZlIGl0IGFzLWlzPw0KPiANCj4gSXQncyBiaWcuIEknZCBzcGxp
dCBpdCBpbnRvIG11bHRpcGxlIHBhdGNoZXMgKGFuZCByZWR1Y2UgdGhlIGNjIC0gZXhjZXB0DQo+
IGZvciB0aGUgY292ZXIgbGV0dGVyLCB0aGUgcmVzdCBvZiB0aGUgcGF0Y2hlcyBjYW4gYmUgbGlt
aXRlZCB0byB0aGUNCj4gYWN0dWFsIG1haW50YWluZXIvc3Vic3lzdGVtIGFmZmVjdGVkIHJhdGhl
ciB0aGFuIGV2ZXJ5b25lIGludm9sdmVkDQo+IGFueXdoZXJlIGVsc2UgaW4gdGhlIHNlcmllcy4g
V2l0aCB0aGUgY3VycmVudCBsYXJnZSBjYywgYW55b25lIHRoYXQNCj4gcmVwbGllcyBnZXRzIHNl
dmVyYWwgbWFpbCBib3VuY2VzIGFib3V0ICJ0b28gbWFueSByZWNpcGllbnRzIikuICBJdCBtYXkN
Cj4gYmUgZWFzaWVyIHRvIHNwbGl0IGFsb25nIGRpcmVjdG9yeSBib3VuZGFyaWVzIHRoYW4gYnkg
bWFpbnRhaW5lcg0KPiBib3VuZGFyaWVzLiAgTWFya3VzIGhhcyBhcHBsaWVkIGxhcmdlIHRyZWUt
d2lkZSBDb2NjaW5lbGxlIGNsZWFudXBzDQo+IGJlZm9yZSwgbWF5YmUgaGUgaGFzIHNvbWUgYWR2
aWNlLg0KDQoNCklmIHNwbGl0IGJ5IHN1YnN5c3RlbSBpdCB3b3VsZCBiZSAyMDArIHBhdGNoZXM6
DQpnaXQgZGlmZiAtLW5hbWUtb25seSB8IHdoaWxlIHJlYWQgZjsgZG8gc2NyaXB0cy9nZXRfbWFp
bnRhaW5lci5wbCAtZiAkZiAtLXN1YnN5c3RlbSAtLW5vLXJvbGVzdGF0cyAyPi9kZXYvbnVsbCB8
IGdyZXAgLXYgQCB8IGhlYWQgLTE7IGRvbmUgfCBzb3J0IHwgdW5pcSB8IHdjIC1sDQoyMDUNCg0K
DQpUcnkgdG8gbG9vayBhdCBsYXJnZXIgc3Vic3lzdGVtOg0KZ2l0IGRpZmYgLS1uYW1lLW9ubHkg
fCB3aGlsZSByZWFkIGY7IGRvIHNjcmlwdHMvZ2V0X21haW50YWluZXIucGwgLWYgJGYgLS1zdWJz
eXN0ZW0gLS1uby1yb2xlc3RhdHMgMj4vZGV2L251bGwgfCBncmVwIC12IEAgfCB0YWlsIC0yIHwg
aGVhZCAtMTsgZG9uZSB8IHNvcnQgfCB1bmlxIHwgd2MgLWwNCjEzOQ0KDQpzdGlsbCB0b28gbWFu
eS4uIE9yIGlzIGl0IE9LPw0KDQoNCj4gDQo+Pg0KPj4gNC4gQWxzbywgY2hlY2twYXRjaCBoYXMg
c29tZSBjb21wbGFpbnMgYWJvdXQgMDcgcGF0Y2g6DQo+PiAgICAtIHVzaW5nIHRhYnMuLiAoaG1t
IGV4YWN0bHkgc3R1YnMgZnVuY3Rpb25zLi4pDQo+PiAgICAtIGVtcHR5IGlmcw0KPj4gICAgQWdh
aW4sIEkgZG9uJ3Qgc2VlIGFueSB3YXlzIHRvIGZpeCBpdCBvdGhlciB0aGF0IGJ5IGhhbmQgYW5k
IG1lcmdlIHRvDQo+PiAgICAwNy4uDQo+IA0KPiBIYW5kIGNsZWFudXBzIGZvciBmb3JtYXR0aW5n
IG9yIGNvbXBpbGF0aW9uIGZpeGVzIHRvIENvY2NpbmVsbGUncyB3b3JrDQo+IGlzIG5vdCBhbiB1
bmNvbW1vbiBpc3N1ZSBhZnRlciBsYXJnZSBwYXRjaGVzOyB0aGFua2Z1bGx5IGl0J3MgYWxzbyBu
b3QNCj4gdmVyeSBkaWZmaWN1bHQgKGFuZCBzdXJwcmlzaW5nbHkgbmVlZGVkIGluIHZlcnkgZmV3
IHBsYWNlcyBjb21wYXJlZCB0bw0KPiBob3cgbXVjaCBhY3R1YWxseSBnZXRzIHRvdWNoZWQpLg0K
PiANCj4+DQo+PiA9PT09PT09PT09PT09PT09PT0NCj4+DQo+PiBBbHNvLCBpZiB3ZSBkZWNpZGUs
IHRoYXQgdGhpcyBhbGwgaXMgdG9vIGh1Z2UsIGhlcmUgaXMgcGxhbiBCOg0KPj4NCj4+IDEuIGFw
cGx5IDAxDQo+PiAyLiBmaXggb25seSBmdW5jdGlvbnMgdGhhdCBkb24ndCB1c2UgbG9jYWxfZXJy
IGFuZCB1c2UNCj4+IGVycm9yX2FwcGVuZF9oaW50LCBieSBqdXN0IGludm9jYXRpb24gb2YgbmV3
IG1hY3JvIGF0IGZ1bmN0aW9uIHN0YXJ0IC0NCj4+IGl0IHdpbGwgc3Vic3RpdHV0ZSBHcmVnJ3Mg
c2VyaWVzIHdpdGggbm8gcGFpbi4NCj4+IDNbb3B0aW9uYWxdLiBEbyBmdWxsIHVwZGF0ZSBmb3Ig
c29tZSBzdWJzeXN0ZW1zLCBmb3IgZXhhbXBsZSwgb25seSBmb3INCj4+IGJsb2NrKiBhbmQgbmJk
Kg0KPiANCj4gRXZlbiBpZiB3ZSBnbyB3aXRoIHBsYW4gQiwgaXQncyBzdGlsbCB3b3J0aCBjaGVj
a2luZyBpbiBhIENvY2NpbmVsbGUNCj4gc2NyaXB0IHRoYXQgd2UgY2FuIHBlcmlvZGljYWxseSBy
dW4gdG8gbWFrZSBzdXJlIHdlIGFyZW4ndCBtaXNzaW5nIG91dA0KPiBvbiB0aGUgdXNlIG9mIHRo
ZSBtYWNybyB3aGVyZSBpdCBpcyBuZWVkZWQuDQo+IA0KPj4NCj4+IFZsYWRpbWlyIFNlbWVudHNv
di1PZ2lldnNraXkgKDkpOg0KPj4gICAgZXJyb3I6IGF1dG8gcHJvcGFnYXRlZCBsb2NhbF9lcnIN
Cj4+ICAgIHFhcGkvZXJyb3I6IGFkZCAoRXJyb3IgKiplcnJwKSBjbGVhbmluZyBBUElzDQo+PiAg
ICBlcnJwOiByZW5hbWUgZXJycCB0byBlcnJwX2luIHdoZXJlIGl0IGlzIElOLWFyZ3VtZW50DQo+
PiAgICBody9jb3JlL2xvYWRlci1maXQ6IGZpeCBmcmVlaW5nIGVycnAgaW4gZml0X2xvYWRfZmR0
DQo+PiAgICBuZXQvbmV0OiBmaXggbG9jYWwgdmFyaWFibGUgc2hhZG93aW5nIGluIG5ldF9jbGll
bnRfaW5pdA0KPj4gICAgc2NyaXB0czogYWRkIGNvY2NpbmVsbGUgc2NyaXB0IHRvIHVzZSBhdXRv
IHByb3BhZ2F0ZWQgZXJycA0KPj4gICAgVXNlIGF1dG8tcHJvcGFnYXRlZCBlcnJwDQo+PiAgICBm
aXgtY29tcGlsYXRpb246IGVtcHR5IGdvdG8NCj4+ICAgIGZpeC1jb21waWxhdGlvbjogaW5jbHVk
ZXMNCj4+DQo+PiAgIGluY2x1ZGUvaHcvcGNpLWhvc3Qvc3BhcHIuaCAgICAgICAgICAgICAgICAg
ICB8ICAgMiArDQo+PiAgIGluY2x1ZGUvbW9uaXRvci9obXAuaCAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICAgMiArLQ0KPj4gICBpbmNsdWRlL3FhcGkvZXJyb3IuaCAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgNjEgKysrKy0NCj4+ICAgdGFyZ2V0L3BwYy9rdm1fcHBjLmggICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgICAzICsNCj4+ICAgdGFyZ2V0L3MzOTB4L2NwdV9tb2RlbHMuaCAg
ICAgICAgICAgICAgICAgICAgIHwgICAzICsNCj4+ICAgdWkvdm5jLmggICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgICAyICstDQo+IA0KPj4gICB2bC5jICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMTMgKy0NCj4+ICAgc2NyaXB0cy9jb2Nj
aW5lbGxlL2F1dG8tcHJvcGFnYXRlZC1lcnJwLmNvY2NpIHwgIDgyICsrKysrKysNCj4+ICAgMzE5
IGZpbGVzIGNoYW5nZWQsIDI3MjkgaW5zZXJ0aW9ucygrKSwgNDI0NSBkZWxldGlvbnMoLSkNCj4+
ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHNjcmlwdHMvY29jY2luZWxsZS9hdXRvLXByb3BhZ2F0ZWQt
ZXJycC5jb2NjaQ0KPiANCj4gVGhlIGRpZmZzdGF0IGlzIGh1Z2UsIGJ1dCBwcm9taXNpbmcuDQo+
IA0KDQoNCi0tIA0KQmVzdCByZWdhcmRzLA0KVmxhZGltaXINCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
