Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD99BD700
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 06:15:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCyep-0008EN-8o; Wed, 25 Sep 2019 04:12:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jCV4=XT=virtuozzo.com=vsementsov@srs-us1.protection.inumbo.net>)
 id 1iCmzH-0001WM-DZ
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 15:44:23 +0000
X-Inumbo-ID: 2c86f992-dee2-11e9-bf31-bc764e2007e4
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe05::700]) by localhost (Halon) with ESMTPS
 id 2c86f992-dee2-11e9-bf31-bc764e2007e4;
 Tue, 24 Sep 2019 15:44:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CIN8FEVyMq9zzDQj3/JR5PG5cFEhGpCIQOhJqV6Zi6aoaWwF9YvA2VD0uYu7GCfUvPVcAMw9k3lN8oWFuKBP2EgMtigU/8nCIhx1OP1GluJdi58bLl99v7I1Mv7etVMfFoQA2rdtEuRaZWWliCjcdPMiUoOSOCR637/mIT6Hsu2mNBXkpxh/LE0mvBCp81YCOrJXOGq5mT/VfYck1ouJpHcobZe/pDZNujg63VvhjSAvNltKG7S6Hf7a0FjeoBR/BgN2yBh04UchXsvdseXEIVU6INVBzELxZClhlf5q6kwVg/xpfFQ6mqUUy1rqnc3DOew1ikpCUrqFZouXJ/a63Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jtvaAOFSWQShvdYli2h1DMsogbMNuGaeeEBtgDwSVdI=;
 b=oMeWSlRhU7fO76lKNMZjU8QV7lQ4PEO17ssRlH+3+oaOYXdEtgHxr+sTtJsENR2iZm+LLLftVR1HEWVyhq/KI+q8D2BdznzkX2ePCng29MnIM7CpCFJYlQGECEpyMNJK3DqYBFgvipjCqmHbthIY0AguNCd516qMXhABUqVEm6giQIa+qE1JJCW2tl7e55H43mDcL/4yKBQ8culO/R/WCyXEbEDcrYOZtEtblJuE91++9Ww/4xT2bQNtlkDITqbvgkCVEvEzFHe7hnCxrT3mcM2DHaLPpuXQZ8H6l3j4EhZpeOz0U5/nWR9/oTQ5w1+STBkwmKoqbyyMAuY+aMhMnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jtvaAOFSWQShvdYli2h1DMsogbMNuGaeeEBtgDwSVdI=;
 b=Ctn+/Nncs/KKbAJ9XYltiDsm13OnYeo9tEIGOLq42rEFBiHLcypzbpxCmReNvB+ovBUIiBhjtriLY8Fp4RRd/Bg+k7LBQ7b7XPe40PU5PXr4SXdsBAbGhKI1jc6kdZs8nefusrSSH3qWMchkzT7uGpymmLw/ySgxADW3qYRoYOs=
Received: from DB8PR08MB5498.eurprd08.prod.outlook.com (52.133.242.216) by
 DB8PR08MB5337.eurprd08.prod.outlook.com (52.133.243.73) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.22; Tue, 24 Sep 2019 15:44:18 +0000
Received: from DB8PR08MB5498.eurprd08.prod.outlook.com
 ([fe80::b5c0:6b97:438d:77ed]) by DB8PR08MB5498.eurprd08.prod.outlook.com
 ([fe80::b5c0:6b97:438d:77ed%2]) with mapi id 15.20.2284.023; Tue, 24 Sep 2019
 15:44:18 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Eric Blake <eblake@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Thread-Topic: [RFC v2 0/9] error: auto propagated local_err
Thread-Index: AQHVcioNiDMY2yo+Z0yF9jZaFGvJZ6c5qyCAgAFm+wD//+MaAIAABEQA
Date: Tue, 24 Sep 2019 15:44:18 +0000
Message-ID: <97b77e48-b370-a596-0a06-9ceaaf6bc72e@virtuozzo.com>
References: <20190923161231.22028-1-vsementsov@virtuozzo.com>
 <d1527fdc-b5e8-093a-9206-6f7ceeece2ac@redhat.com>
 <84c9e5dd-3e0f-94e1-5da1-2c7baa594bf1@virtuozzo.com>
 <22191b09-822a-1f54-dcaa-3726c833805b@redhat.com>
In-Reply-To: <22191b09-822a-1f54-dcaa-3726c833805b@redhat.com>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1P18901CA0014.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:3:8b::24) To DB8PR08MB5498.eurprd08.prod.outlook.com
 (2603:10a6:10:11c::24)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vsementsov@virtuozzo.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20190924184408309
x-originating-ip: [185.231.240.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d372e8c5-ad1f-4844-9b39-08d741060f07
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DB8PR08MB5337; 
x-ms-traffictypediagnostic: DB8PR08MB5337:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR08MB5337AE8A858F0348452593B2C1840@DB8PR08MB5337.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0170DAF08C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(39850400004)(396003)(376002)(346002)(136003)(189003)(199004)(229853002)(71200400001)(14454004)(71190400001)(64756008)(99286004)(478600001)(52116002)(81156014)(446003)(7366002)(66556008)(7416002)(7276002)(256004)(486006)(7336002)(45426003)(86362001)(53546011)(6506007)(26005)(305945005)(2616005)(76176011)(31686004)(8936002)(81166006)(66446008)(8676002)(186003)(11346002)(31696002)(2906002)(7406005)(386003)(2501003)(36756003)(5660300002)(4326008)(6436002)(102836004)(476003)(7736002)(3846002)(66476007)(25786009)(316002)(66066001)(6486002)(6246003)(6512007)(66946007)(6116002)(54906003)(110136005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB8PR08MB5337;
 H:DB8PR08MB5498.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: virtuozzo.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vpdKp2GZB6HBV3owJKeCMxLcOTlxzFSUAGFEICZV3e2EmaiWVMngHkQWWNU/8XsIemQm9uQe68l0OMrECf9oV7PSuTGSSw7ikbAyLp+MXksyEmCR03Cte5fa2w1uDaJLmS9QHWhjKojMOI8FEeqcuspOGvx8rvko5SHSBnZ8JwWS/83IXCu7TQ+JRwGmD67vhfxtzdcmp7VuhlRVVy+2ArTjm+yfFQFk/BpEF5NssSegrs/fWucQJcm3qV6aTFbSA+kla5OH0/R0EtNSrNT6ks0Mzxru6TSr3yqYIku5HCfVUJBkT13/ub87LWWKGHNEtvuXbvR7A0bcSA7I6w9yNAvZRd3Zw9kw9akry46Dix3fFh9jVZ2GsOpc2hxQBPtF/whdUK4nZX9QZATuZOShupJHL+W1r+o2cqng+5jOpns=
Content-ID: <5E5FEBF655307A49B3A44F5E718496B3@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d372e8c5-ad1f-4844-9b39-08d741060f07
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2019 15:44:18.0465 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U8sRYUpouOont3+xCuHJhh+RUJqw0ijlRmnePEW2xyvtaN/Xcc+ZtPyTe1yBrQRfZ5OyNc+kTuTvM0+g0niY0GKxxw1m4ChAaVoHoPBjgvM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5337
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

MjQuMDkuMjAxOSAxODoyOCwgRXJpYyBCbGFrZSB3cm90ZToNCj4gT24gOS8yNC8xOSA5OjEyIEFN
LCBWbGFkaW1pciBTZW1lbnRzb3YtT2dpZXZza2l5IHdyb3RlOg0KPiANCj4+Pj4gMy4gV2hhdCB0
byBkbyB3aXRoIGh1Z2UgYXV0by1nZW5lcmF0ZWQgY29tbWl0IDA3PyBTaG91bGQgSSBzcGxpdCBp
dA0KPj4+PiBwZXItbWFpbnRhaW5lciBvciBwZXItc3Vic3lzdGVtLCBvciBsZWF2ZSBpdCBhcy1p
cz8NCj4+Pg0KPj4+IEl0J3MgYmlnLiBJJ2Qgc3BsaXQgaXQgaW50byBtdWx0aXBsZSBwYXRjaGVz
IChhbmQgcmVkdWNlIHRoZSBjYyAtIGV4Y2VwdA0KPj4+IGZvciB0aGUgY292ZXIgbGV0dGVyLCB0
aGUgcmVzdCBvZiB0aGUgcGF0Y2hlcyBjYW4gYmUgbGltaXRlZCB0byB0aGUNCj4+PiBhY3R1YWwg
bWFpbnRhaW5lci9zdWJzeXN0ZW0gYWZmZWN0ZWQgcmF0aGVyIHRoYW4gZXZlcnlvbmUgaW52b2x2
ZWQNCj4+PiBhbnl3aGVyZSBlbHNlIGluIHRoZSBzZXJpZXMuIFdpdGggdGhlIGN1cnJlbnQgbGFy
Z2UgY2MsIGFueW9uZSB0aGF0DQo+Pj4gcmVwbGllcyBnZXRzIHNldmVyYWwgbWFpbCBib3VuY2Vz
IGFib3V0ICJ0b28gbWFueSByZWNpcGllbnRzIikuICBJdCBtYXkNCj4+PiBiZSBlYXNpZXIgdG8g
c3BsaXQgYWxvbmcgZGlyZWN0b3J5IGJvdW5kYXJpZXMgdGhhbiBieSBtYWludGFpbmVyDQo+Pj4g
Ym91bmRhcmllcy4gIE1hcmt1cyBoYXMgYXBwbGllZCBsYXJnZSB0cmVlLXdpZGUgQ29jY2luZWxs
ZSBjbGVhbnVwcw0KPj4+IGJlZm9yZSwgbWF5YmUgaGUgaGFzIHNvbWUgYWR2aWNlLg0KPj4NCj4+
DQo+PiBJZiBzcGxpdCBieSBzdWJzeXN0ZW0gaXQgd291bGQgYmUgMjAwKyBwYXRjaGVzOg0KPj4g
Z2l0IGRpZmYgLS1uYW1lLW9ubHkgfCB3aGlsZSByZWFkIGY7IGRvIHNjcmlwdHMvZ2V0X21haW50
YWluZXIucGwgLWYgJGYgLS1zdWJzeXN0ZW0gLS1uby1yb2xlc3RhdHMgMj4vZGV2L251bGwgfCBn
cmVwIC12IEAgfCBoZWFkIC0xOyBkb25lIHwgc29ydCB8IHVuaXEgfCB3YyAtbA0KPj4gMjA1DQo+
Pg0KPj4NCj4+IFRyeSB0byBsb29rIGF0IGxhcmdlciBzdWJzeXN0ZW06DQo+PiBnaXQgZGlmZiAt
LW5hbWUtb25seSB8IHdoaWxlIHJlYWQgZjsgZG8gc2NyaXB0cy9nZXRfbWFpbnRhaW5lci5wbCAt
ZiAkZiAtLXN1YnN5c3RlbSAtLW5vLXJvbGVzdGF0cyAyPi9kZXYvbnVsbCB8IGdyZXAgLXYgQCB8
IHRhaWwgLTIgfCBoZWFkIC0xOyBkb25lIHwgc29ydCB8IHVuaXEgfCB3YyAtbA0KPj4gMTM5DQo+
Pg0KPj4gc3RpbGwgdG9vIG1hbnkuLiBPciBpcyBpdCBPSz8NCj4gDQo+IEhtbSAtIHRoYXQgYmVj
b21lcyBhIHRyYWRlb2ZmIGluIGxlbmd0aCBvZiB0aGUgc2VyaWVzICh3aGVyZSBpbmRpdmlkdWFs
DQo+IHBhdGNoZXMgbWF5IGJlIHJldmlld2VkIGZhc3QsIGJ1dCB3aGVyZSB0aGUgb3ZlcmFsbCBw
cm9jZXNzIG1heSBiZQ0KPiBib2dnZWQgZG93biBieSBzaGVlciBsZW5ndGgpLCB2cy4gbGVuZ3Ro
IG9mIGluZGl2aWR1YWwgZW1haWxzICh3aGVyZSB0aGUNCj4gZW1haWwgaXRzZWxmIGlzIGRhdW50
aW5nLCBidXQgYXMgdGhlIHJldmlldyBpcyBtZWNoYW5pY2FsIGFuZCBkb25lIGJ5DQo+IGF1dG9t
YXRpb24sIGl0IGJlY29tZXMgYSBtYXR0ZXIgb2Ygc3BvdC1jaGVja2luZyBpZiB3ZSB0cnVzdCB0
aGF0IHRoZQ0KPiBhdXRvbWF0aW9uIHdhcyBkb25lIGNvcnJlY3RseSkuICBZb3UgY2FuIHByb2Jh
Ymx5IGdyb3VwIGl0IGluIGZld2VyDQo+IHBhdGNoZXMsIGJ5IGpvaW5pbmcgc21hbGxlciBwYXRj
aGVzIGFjcm9zcyBhIGNvdXBsZSBvZiBzdWJzeXN0ZW1zLiAgSXQncw0KPiBhbiBhcnQgZm9ybSwg
dGhlcmUncyBwcm9iYWJseSBzZXZlcmFsIHdheXMgdG8gZG8gaXQgdGhhdCB3b3VsZCB3b3JrLCBh
bmQNCj4gaXQgY29tZXMgZG93biB0byBhIGp1ZGdtZW50IGNhbGwgb24gaG93IG11Y2ggd29yayB5
b3Ugd2FudCB0byBkbyB0byB0cnkNCj4gYW5kIHJlZHVjZSBvdGhlcidzIHdvcmsgaW4gcmV2aWV3
aW5nIGl0LiAgTWF5YmUgZXZlbiBhbiBvZmYtaGFuZCBzcGxpdA0KPiBvZiBnYXRoZXJpbmcgZmls
ZXMgdW50aWwgeW91IHJlYWNoIGFib3V0IDUwMCBvciBzbyBsaW5lcyBwZXIgZGlmZi4gIEkNCj4g
d2lzaCBJIGhhZCBlYXNpZXIgYWR2aWNlIG9uIGhvdyB0byB0YWNrbGUgdGhpcyBzb3J0IG9mIHBy
b2plY3QgaW4gdGhlDQo+IHdheSB0aGF0IHdpbGwgZ2V0IHRoZSBmYXN0ZXN0IHJlc3BvbnNlIHRp
bWUuDQo+IA0KPiANCj4+Pj4gICAgdmwuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgIDEzICstDQo+Pj4+ICAgIHNjcmlwdHMvY29jY2luZWxsZS9hdXRvLXByb3Bh
Z2F0ZWQtZXJycC5jb2NjaSB8ICA4MiArKysrKysrDQo+Pj4+ICAgIDMxOSBmaWxlcyBjaGFuZ2Vk
LCAyNzI5IGluc2VydGlvbnMoKyksIDQyNDUgZGVsZXRpb25zKC0pDQo+Pj4+ICAgIGNyZWF0ZSBt
b2RlIDEwMDY0NCBzY3JpcHRzL2NvY2NpbmVsbGUvYXV0by1wcm9wYWdhdGVkLWVycnAuY29jY2kN
Cj4+Pg0KPj4+IFRoZSBkaWZmc3RhdCBpcyBodWdlLCBidXQgcHJvbWlzaW5nLg0KPiANCj4gV2Ug
YWxzbyBsZWFybmVkIGluIHJldmlld3Mgb2YgNy85IHRoYXQgdGhlIGRpZmZzdGF0IGhlcmUgaXMg
bWlzbGVhZGluZywNCj4gdGhlIG51bWJlciBvZiBpbnNlcnRpb25zIHdpbGwgZGVmaW5pdGVseSBi
ZSBpbmNyZWFzaW5nIG9uY2UgdGhlDQo+IENvY2NpbmVsbGUgc2NyaXB0IGlzIGZpeGVkIHRvIGlu
c2VydCB0aGUgbWFjcm8gaW4gbW9yZSBmdW5jdGlvbnMsIGJ1dA0KPiBob3BlZnVsbHkgaXQncyBz
dGlsbCBhIG5ldCByZWR1Y3Rpb24gaW4gb3ZlcmFsbCBsaW5lcy4NCj4gDQoNCk5vIGhvcGUgZm9y
IHVzOiB3aXRoIGZpeGVkIHNjcmlwdCBJIG5vdyBzZWUNCg0KOTE5IGZpbGVzIGNoYW5nZWQsIDY0
MjUgaW5zZXJ0aW9ucygrKSwgNDIzNCBkZWxldGlvbnMoLSkNCg0KLS0gDQpCZXN0IHJlZ2FyZHMs
DQpWbGFkaW1pcg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
