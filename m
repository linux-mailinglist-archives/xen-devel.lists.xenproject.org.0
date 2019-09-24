Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 111BDBC3B7
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 10:04:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCfid-0004B7-Q9; Tue, 24 Sep 2019 07:58:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jCV4=XT=virtuozzo.com=vsementsov@srs-us1.protection.inumbo.net>)
 id 1iCfec-000472-Ch
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 07:54:34 +0000
X-Inumbo-ID: 8ac27122-dea0-11e9-a337-bc764e2007e4
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe1f::719])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8ac27122-dea0-11e9-a337-bc764e2007e4;
 Tue, 24 Sep 2019 07:54:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hMc8xDdVkp+WVfIzWQORB8tXJsVdk+w3YDBx5hLqCE3/puY869BboqAuxLcskVyWF9cSlfHL3QaLCBs1klrUj4/ZXfeATB+CxW3W9H0duQ6K/cVQcrzu4wKIzcfxEx9evf/h2GDM35hwps49cy4O87sXwCa9FYmEV33+T/8qSafS66WelaEff2Aw2X4Cxch2JMZvytTc/Cg/AyAfZVuimG/sF7LKvSt4rNRqJBwMtKuzHy3DN5yXu5WCUFgB+z+2hJN70I0cQRK1w8vXkc37Mz5Xy9IKbMVT5pkiNiuGWgTYu/xmH3ri3pEJYf6xo6E2dLfWw+UlHaIzN6AlzNLohg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZIgeirNZhwVWWSOFwVPvSYLwY9tTAKHHrb+6pw3Vvzc=;
 b=gIC3ReIKD5w8Ke6m4O3Gmw1YBsTvCExSQwskqCdpYz9ENbUFDLy/FTmcPhqvqL8rHP1rLF1MZG4wVnWs0P9LSPFwf+XD919P2DbVmmHxcjSsZce+2qyswt6pedoNqwGCxYpJzVgdmaoXbLd4ETd9I1ZrSMNZx62fza+WO6xh0/LZ8Dn0YFbNtYFK+nL9HyZ5c9ycDOWQ/y5KF6G55I6u2/the8KWMudRF8ji64ejbgvAP1J8NvHH3rJa5l85eLrkZ9vqgGZUnBdBrA5o2O9kXt+DGhNYUX/mMI9EcrdKGWvwx3czA9RmTnOIk1MJYqBCCwFDbyos+gORFmivrXYdyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZIgeirNZhwVWWSOFwVPvSYLwY9tTAKHHrb+6pw3Vvzc=;
 b=qjxIo/UzN6G9zwbSFHMmQzv70vPHyOggOKsr5+a35UE8VWHaO/WsZzJ4Zafe2FS3HjDPYHYVA5JygTqdDbLWR4wOP8tpcfCPr/eL3jviPnvX7DcRPg3x+hCLYUCMG/xTsyDT+ZMqNqun4MDw1Q6cSmFJmi3UFiIueDVpztXtxBc=
Received: from DB8PR08MB5498.eurprd08.prod.outlook.com (52.133.242.216) by
 DB8PR08MB5001.eurprd08.prod.outlook.com (10.255.16.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.25; Tue, 24 Sep 2019 07:54:30 +0000
Received: from DB8PR08MB5498.eurprd08.prod.outlook.com
 ([fe80::b5c0:6b97:438d:77ed]) by DB8PR08MB5498.eurprd08.prod.outlook.com
 ([fe80::b5c0:6b97:438d:77ed%2]) with mapi id 15.20.2284.023; Tue, 24 Sep 2019
 07:54:30 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Eric Blake <eblake@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Thread-Topic: [RFC v2 7/9] Use auto-propagated errp
Thread-Index: AQHVcio2QQn2PPiLskGYHg6Pi8bE8Kc5tyiAgAC/DgA=
Date: Tue, 24 Sep 2019 07:54:29 +0000
Message-ID: <6191a8ae-983a-ebc2-98bd-14c6b351b00e@virtuozzo.com>
References: <20190923161231.22028-1-vsementsov@virtuozzo.com>
 <20190923161231.22028-8-vsementsov@virtuozzo.com>
 <59c5ccc7-3d4c-9613-fcd3-97642c1394cd@redhat.com>
In-Reply-To: <59c5ccc7-3d4c-9613-fcd3-97642c1394cd@redhat.com>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0901CA0055.eurprd09.prod.outlook.com
 (2603:10a6:3:45::23) To DB8PR08MB5498.eurprd08.prod.outlook.com
 (2603:10a6:10:11c::24)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vsementsov@virtuozzo.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20190924105420756
x-originating-ip: [185.231.240.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 08e2405c-5c6b-4ee4-a9aa-08d740c46d70
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DB8PR08MB5001; 
x-ms-traffictypediagnostic: DB8PR08MB5001:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR08MB50018935B6CCD604EA296315C1840@DB8PR08MB5001.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:457;
x-forefront-prvs: 0170DAF08C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39840400004)(366004)(346002)(396003)(376002)(136003)(189003)(199004)(2501003)(25786009)(36756003)(66946007)(305945005)(66476007)(476003)(66556008)(81166006)(5660300002)(8936002)(446003)(2616005)(31696002)(54906003)(6436002)(2906002)(7736002)(6486002)(11346002)(7276002)(256004)(3846002)(14454004)(31686004)(6246003)(26005)(4326008)(102836004)(86362001)(6506007)(7416002)(52116002)(76176011)(45426003)(110136005)(386003)(7336002)(186003)(7406005)(7366002)(6116002)(316002)(486006)(6512007)(99286004)(71200400001)(71190400001)(64756008)(66446008)(81156014)(229853002)(8676002)(478600001)(53546011)(66066001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB8PR08MB5001;
 H:DB8PR08MB5498.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: virtuozzo.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: DgTMU3Cno4BBcv9hyvyNQ2DGCflxF8AbeIrinOSnnd/vP1pRcbEzXnfnzuY8Zx0uRFWvnlRBVtnXESosftMO6tEq5LCUfGLhV4a3vtbkhrc7ZZ7DP44MgH4wAM0iKSoeeXBwwMed0LmhhGaogcvrjOzBTEl/Fowdawk+qaVfhz9OVxTiJAGJaEycFcRMYAP49E2q8CDhaiK497nT2JJPKBeP821idhCcb5NBdeBuF9bCefZNiq+uAu+a8cVipVYXn52QNSWhJ1jMLFw8lKwnc/vA/8RsVxmnLJnsyf80fWz3Mr7UCM709hMn+h7ilEGnohUTebvM/c3ZiXBHl6mH0G4cvtzDPyTcPQaEEpmGIhbyZGyXOaahIi82Hrd7M/3NdGwzsXODQwZhR8EGyzhU5BcFnk4SCIqqMOZmsF0dl3s=
Content-ID: <B2B0EC06FDE38E48A415580333DB3103@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08e2405c-5c6b-4ee4-a9aa-08d740c46d70
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2019 07:54:29.4735 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IqX4zlHD8Ryipw7oe81+uLMbsiyEy428psN5yjRKuJCSXgyYMWTJJ3Fg427KKwyF1tW0H7ZsnAf+l9CoMKfSf98zjaG2O19Zn5eLeZUdc3g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5001
X-Mailman-Approved-At: Tue, 24 Sep 2019 07:58:42 +0000
Subject: Re: [Xen-devel] [RFC v2 7/9] Use auto-propagated errp
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

MjMuMDkuMjAxOSAyMzozMCwgRXJpYyBCbGFrZSB3cm90ZToNCj4gT24gOS8yMy8xOSAxMToxMiBB
TSwgVmxhZGltaXIgU2VtZW50c292LU9naWV2c2tpeSB3cm90ZToNCj4+IFRoaXMgY29tbWl0IGlz
IGdlbmVyYXRlZCBieSBjb21tYW5kDQo+Pg0KPj4gZ2l0IGdyZXAgLWwgJ0Vycm9yIFwqXCplcnJw
JyB8IHdoaWxlIHJlYWQgZjsgXA0KPj4gZG8gc3BhdGNoIC0tc3AtZmlsZSBcDQo+PiBzY3JpcHRz
L2NvY2NpbmVsbGUvYXV0by1wcm9wYWdhdGVkLWVycnAuY29jY2kgLS1pbi1wbGFjZSAkZjsgZG9u
ZQ0KPj4NCj4gDQo+IEFzIG1lbnRpb25lZCBpbiB5b3VyIGNvdmVyIGxldHRlciwgdGhpcyBmYWls
cyBzeW50YXgtY2hlY2sgYW5kDQo+IGNvbXBpbGF0aW9uIHdpdGhvdXQgc3F1YXNoaW5nIGluIHNv
bWUgZm9sbG93dXBzOyBpZiB3ZSBjYW4ndCBpbXByb3ZlIHRoZQ0KPiAuY29jY2kgc2NyaXB0IHRv
IGRvIGl0IGF1dG9tYXRpY2FsbHksIHRoZW4gbWFudWFsbHkgc3F1YXNoaW5nIGluDQo+IGNsZWFu
dXBzIChhbmQgZG9jdW1lbnRpbmcgd2hhdCB0eXBlcyBvZiBjbGVhbnVwcyB0aGV5IHdlcmUpIGlz
IGZpbmUuDQo+IChUaGUgZ29hbCBmb3IgYSBtZWNoYW5pY2FsIHBhdGNoIGxpa2UgdGhpcyBpcyB0
byBtYWtlIGl0IGVhc3kgZW5vdWdoIHRvDQo+IGF1dG9tYXRlIGRvd25zdHJlYW0sIGV2ZW4gd2hl
cmUgdGhlIGZpbGUgY29udGVudHMgYXJlIGNoYW5nZWQsIGJ1dCB3aGVyZQ0KPiB0aGUgcHJvY2Vz
cyBmb3IgY3JlYXRpbmcgdGhvc2UgY2hhbmdlcyBhcmUgdGhlIHNhbWUpLg0KPiANCj4+IFNpZ25l
ZC1vZmYtYnk6IFZsYWRpbWlyIFNlbWVudHNvdi1PZ2lldnNraXkgPHZzZW1lbnRzb3ZAdmlydHVv
enpvLmNvbT4NCj4+IC0tLQ0KPiANCj4gU3BvdC1jaGVja2luZw0KPiANCj4+ICAgYmxvY2svaW8u
YyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMTEgKy0NCj4gDQo+PiAgIGJsb2NrL25iZC5j
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDQ0ICsrKy0tLQ0KPiANCj4+ICAgcWFwaS9xYXBp
LXZpc2l0LWNvcmUuYyAgICAgICAgICAgICAgfCAgNTMgKystLS0tLQ0KPiANCj4ganVzdCB0byBz
ZWUgaG93IGl0IGxvb2tzLg0KPiANCj4+ICsrKyBiL2Jsb2NrL2lvLmMNCj4+IEBAIC0xMzYsNyAr
MTM2LDYgQEAgc3RhdGljIHZvaWQgYmRydl9tZXJnZV9saW1pdHMoQmxvY2tMaW1pdHMgKmRzdCwg
Y29uc3QgQmxvY2tMaW1pdHMgKnNyYykNCj4+ICAgdm9pZCBiZHJ2X3JlZnJlc2hfbGltaXRzKEJs
b2NrRHJpdmVyU3RhdGUgKmJzLCBFcnJvciAqKmVycnApDQo+PiAgIHsNCj4+ICAgICAgIEJsb2Nr
RHJpdmVyICpkcnYgPSBicy0+ZHJ2Ow0KPj4gLSAgICBFcnJvciAqbG9jYWxfZXJyID0gTlVMTDsN
Cj4+ICAgDQo+IA0KPiBVbW0sIG5vIGluc2VydGlvbiBvZiBFUlJfRlVOQ1RJT05fQkVHSU4oKS4g
IE9vcHMuDQoNCg0KT29wcy4gU2VlbXMgSSBpbmplY3RlZCBpdCBfb25seV8gdG8gZW1wdHkgZnVu
Y3Rpb25zLiBJdCdzIGJlY2F1c2UgSSBtaXNzZWQgJy4uLicgaW4gZmlyc3QgaHVuay4NCg0KLS0g
DQpCZXN0IHJlZ2FyZHMsDQpWbGFkaW1pcg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
