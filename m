Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F547D5D74
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2019 10:29:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iJvgB-0001zC-Un; Mon, 14 Oct 2019 08:26:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2ids=YH=virtuozzo.com=vsementsov@srs-us1.protection.inumbo.net>)
 id 1iJvaB-0001HC-K1
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2019 08:20:00 +0000
X-Inumbo-ID: 67c7028a-ee5b-11e9-8aca-bc764e2007e4
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.113]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 67c7028a-ee5b-11e9-8aca-bc764e2007e4;
 Mon, 14 Oct 2019 08:19:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BpYmI0pS+0yJ7cV2vP4UwNTcd9lZAAURTOhu+VfX5cDYe6M/th0UuEDdQCRfv5HbAMP+dAOoe7ZnAyW1CqTHSRsw++ruJ1ciDBHvK05aeHhj5q/ZSVQIFPCDm2js88PSgqi/b9AznvX/1A52wsEU2OGPNAk0MY8AFTmTzsDiSVRVITXzvFMna/8cmIYkJDXiV0B/imRVaq5mPmlcTMz+RdHW51pU+3NQ91yuhrZUt9iqUdgbLFBMaAtS0ox3lCAs/j8PxUhg0g0yPbLPhoViiBpwea49KYCLKmUiZJKBkz9d+tnnB28NJitSnb66edJak+hfyNnWcvjYbCW2s3c+PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LqWzROTW11e8FonVvvq50XA/3CzppCV8wRKb9jcx3DU=;
 b=CCtMKwnGzbXPEiA58PkeaYxTHT/IKJxskdrRfyHcFRJxdJ0Nhp1MzDjX4N0LSoDG9uZxg1FAN0jLY+TSF9OTfNLjQ1qKz4qq5pO9K6qTciHImm5+uFnMUwmnRS9Gg1QKaNBZUf/wKyHcMVfdTFULpOYDumgC/fiyR8p0NznHJUshMyhKTsKMyQEnpnaSdf/jMxh/fH6dej4rmjkdgrC+NwhAuuJlRgmFz1hLrBjq5A8DApeI8KkUh4j0hmr8O0Tjf9SQCVrrAJkZxPiCC33gF5X8bZ02ajpSyItYjrDCl4pZNWSTKE0VcIqo67txxc5r6ABQeY078SHeU97WDgAt4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LqWzROTW11e8FonVvvq50XA/3CzppCV8wRKb9jcx3DU=;
 b=Lpbni0EXfK1nkaw8Sf36PlHv+MRU1sU9sf+HKn3sbQZSma+S5RrEcPUYlIqshhQXj1F3WFADuhNv4OS/r7cCs+Y/Yq8MwunrKkn8i1ihDeiLtmo9NUC9KaN/wUs4tfYT7L5FFiUCgv5xhYiL5hkkt+Vt99ZgRsogX/SeHjMRi7A=
Received: from DB8PR08MB5498.eurprd08.prod.outlook.com (52.133.242.216) by
 DB8PR08MB5257.eurprd08.prod.outlook.com (10.255.18.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Mon, 14 Oct 2019 08:19:49 +0000
Received: from DB8PR08MB5498.eurprd08.prod.outlook.com
 ([fe80::2856:990a:197a:288f]) by DB8PR08MB5498.eurprd08.prod.outlook.com
 ([fe80::2856:990a:197a:288f%2]) with mapi id 15.20.2347.021; Mon, 14 Oct 2019
 08:19:49 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Eric Blake <eblake@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Thread-Topic: [RFC v5 025/126] scripts: add coccinelle script to use auto
 propagated errp
Thread-Index: AQHVgE3Yxrwb2TPU1UWX1rcryXdDAKdVrZuAgAQiCQA=
Date: Mon, 14 Oct 2019 08:19:49 +0000
Message-ID: <6856bd09-65fc-30d7-2a3c-c85334a024e9@virtuozzo.com>
References: <20191011160552.22907-1-vsementsov@virtuozzo.com>
 <20191011160552.22907-26-vsementsov@virtuozzo.com>
 <5dd4d642-7ea6-42a2-66fc-6d6710b77b8d@redhat.com>
In-Reply-To: <5dd4d642-7ea6-42a2-66fc-6d6710b77b8d@redhat.com>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR1001CA0012.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:3:f7::22) To DB8PR08MB5498.eurprd08.prod.outlook.com
 (2603:10a6:10:11c::24)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vsementsov@virtuozzo.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20191014111940423
x-originating-ip: [185.231.240.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ec25e92e-eb32-4668-238e-08d7507f476e
x-ms-traffictypediagnostic: DB8PR08MB5257:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR08MB5257AA45EFCAED84F4C52092C1900@DB8PR08MB5257.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 01901B3451
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(346002)(376002)(396003)(39840400004)(136003)(199004)(189003)(4326008)(486006)(7736002)(7336002)(7276002)(316002)(7406005)(52116002)(76176011)(305945005)(99286004)(110136005)(386003)(26005)(5660300002)(25786009)(54906003)(2906002)(476003)(11346002)(2616005)(31686004)(7366002)(446003)(7416002)(31696002)(6506007)(6512007)(186003)(6116002)(3846002)(86362001)(102836004)(478600001)(81156014)(66946007)(8676002)(81166006)(71200400001)(256004)(6436002)(71190400001)(8936002)(2501003)(66556008)(66476007)(66446008)(64756008)(14454004)(229853002)(53546011)(66066001)(6486002)(6246003)(36756003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB8PR08MB5257;
 H:DB8PR08MB5498.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: virtuozzo.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Tf6iIbyGk/5Oaol3u6qvRrD6GIOA3ZRhVVbSw/a4jPwEOmZyzJRu5EQjhfYwBOXKf/Ccd2OXi5tiGxx/U1+GS2MHvVRvr7wzd4eMNokLJbvjJ6MamoFqR4wF+YPIGWbEWAk0REk3NUvaryKzJiO8PnQkA0XUqH7dJy2L7eZFUhR8BYARlVHsmShEBWQDVfBGblDgphF9R0Sag7ND5RHGBbPlTqEWVbR9bWl6hIwNUpwpc2rPjL5NufNL7twSgjqqkvSXpMjuOe9rL8n5FOvbU4GgmD9KugToGXMx1Vtrj2q+6sjJR9Wiu5fVXLVMyT/Crv/c2K/8vzC56D65g8RoL3p9osnJW+VxRKlOMtXSN/I3NOllKd+T1QUvFqqAtnLpXnMfIyEb2rXmnEW8K9b5Idd6WgNNNNU+yPA8gUvd2q4=
Content-ID: <7F3C0F0628EC7D48895BAAE7FEEEC08A@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec25e92e-eb32-4668-238e-08d7507f476e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2019 08:19:49.2929 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jBF0IV5jHw2CUB0Z00Rka18xBUKskaPNpqQA9W5ZrVvs9o+1N/mVih5qj/PpttA57+8BlOl+1M5qIbxpM5mWQBWy/HLMQTfFWGiRgR/7zVY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5257
X-Mailman-Approved-At: Mon, 14 Oct 2019 08:26:11 +0000
Subject: Re: [Xen-devel] [RFC v5 025/126] scripts: add coccinelle script to
 use auto propagated errp
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
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Jan Kiszka <jan.kiszka@siemens.com>, Alberto Garcia <berto@igalia.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, Halil Pasic <pasic@linux.ibm.com>,
 =?utf-8?B?SGVydsOpIFBvdXNzaW5lYXU=?= <hpoussin@reactos.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Anthony Green <green@moxielogic.com>, Laurent Vivier <lvivier@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, Peter Lieven <pl@kamp.de>, "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Chris Wulff <crwulff@gmail.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Michael Walle <michael@walle.cc>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Igor Mammedov <imammedo@redhat.com>, Fam Zheng <fam@euphon.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 "sheepdog@lists.wpkg.org" <sheepdog@lists.wpkg.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Palmer Dabbelt <palmer@sifive.com>, Thomas Huth <thuth@redhat.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Hannes Reinecke <hare@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Liu Yuan <namei.unix@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eric Farman <farman@linux.ibm.com>,
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
 Jason Wang <jasowang@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Ari Sundholm <ari@tuxera.com>,
 Juan Quintela <quintela@redhat.com>, Michael Roth <mdroth@linux.vnet.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Joel Stanley <joel@jms.id.au>,
 Jason Dillaman <dillaman@redhat.com>, Antony Pavlov <antonynpavlov@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "integration@gluster.org" <integration@gluster.org>,
 Laszlo Ersek <lersek@redhat.com>, "Richard W.M. Jones" <rjones@redhat.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, Max Reitz <mreitz@redhat.com>,
 Denis Lunev <den@virtuozzo.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Vincenzo Maffione <v.maffione@gmail.com>, Marek Vasut <marex@denx.de>,
 "armbru@redhat.com" <armbru@redhat.com>,
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

MTEuMTAuMjAxOSAyMDoxMiwgRXJpYyBCbGFrZSB3cm90ZToNCj4gT24gMTAvMTEvMTkgMTE6MDQg
QU0sIFZsYWRpbWlyIFNlbWVudHNvdi1PZ2lldnNraXkgd3JvdGU6DQo+PiBTaWduZWQtb2ZmLWJ5
OiBWbGFkaW1pciBTZW1lbnRzb3YtT2dpZXZza2l5IDx2c2VtZW50c292QHZpcnR1b3p6by5jb20+
DQo+PiAtLS0NCj4+DQo+IA0KPj4gwqAgc2NyaXB0cy9jb2NjaW5lbGxlL2F1dG8tcHJvcGFnYXRl
ZC1lcnJwLmNvY2NpIHwgMTE4ICsrKysrKysrKysrKysrKysrKw0KPj4gwqAgMSBmaWxlIGNoYW5n
ZWQsIDExOCBpbnNlcnRpb25zKCspDQo+PiDCoCBjcmVhdGUgbW9kZSAxMDA2NDQgc2NyaXB0cy9j
b2NjaW5lbGxlL2F1dG8tcHJvcGFnYXRlZC1lcnJwLmNvY2NpDQo+Pg0KPj4gZGlmZiAtLWdpdCBh
L3NjcmlwdHMvY29jY2luZWxsZS9hdXRvLXByb3BhZ2F0ZWQtZXJycC5jb2NjaSBiL3NjcmlwdHMv
Y29jY2luZWxsZS9hdXRvLXByb3BhZ2F0ZWQtZXJycC5jb2NjaQ0KPj4gbmV3IGZpbGUgbW9kZSAx
MDA2NDQNCj4+IGluZGV4IDAwMDAwMDAwMDAuLmQ5NzMxNjIwYWENCj4+IC0tLSAvZGV2L251bGwN
Cj4+ICsrKyBiL3NjcmlwdHMvY29jY2luZWxsZS9hdXRvLXByb3BhZ2F0ZWQtZXJycC5jb2NjaQ0K
PiANCj4+ICtAcnVsZTFADQo+PiArLy8gRHJvcCBsb2NhbF9lcnINCj4+ICtpZGVudGlmaWVyIGZu
LCBsb2NhbF9lcnI7DQo+PiArc3ltYm9sIGVycnA7DQo+PiArQEANCj4+ICsNCj4+ICsgZm4oLi4u
LCBFcnJvciAqKmVycnAsIC4uLikNCj4+ICsgew0KPj4gK8KgwqDCoMKgIDwuLi4NCj4+ICstwqDC
oMKgIEVycm9yICpsb2NhbF9lcnIgPSBOVUxMOw0KPj4gK8KgwqDCoMKgIC4uLj4NCj4+ICsgfQ0K
Pj4gKw0KPiANCj4gU28gb3VyIGdvYWwgaXMgdG8gYXV0b21hdGUgcmVtb3ZhbCBvZiBhbGwgbG9j
YWxfZXJyIChpbmNsdWRpbmcgd2hlbiBpdCBpcyBzcGVsbGVkIGVycikuLi4NCj4gDQo+PiArQEAN
Cj4+ICsvLyBIYW5kbGUgcGF0dGVybiB3aXRoIGdvdG8sIG90aGVyd2lzZSB3ZSdsbCBmaW5pc2gg
dXANCj4+ICsvLyB3aXRoIGxhYmVscyBhdCBmdW5jdGlvbiBlbmQgd2hpY2ggd2lsbCBub3QgY29t
cGlsZS4NCj4+ICtpZGVudGlmaWVyIHJ1bGUxLmZuOw0KPj4gK2lkZW50aWZpZXIgcnVsZTEubG9j
YWxfZXJyOw0KPj4gK2lkZW50aWZpZXIgT1VUOw0KPj4gK0BADQo+PiArDQo+PiArIGZuKC4uLikN
Cj4+ICsgew0KPj4gK8KgwqDCoMKgIDwuLi4NCj4+ICstwqDCoMKgIGdvdG8gT1VUOw0KPj4gKyvC
oMKgwqAgcmV0dXJuOw0KPj4gK8KgwqDCoMKgIC4uLj4NCj4+ICstIE9VVDoNCj4+ICstwqDCoMKg
IGVycm9yX3Byb3BhZ2F0ZShlcnJwLCBsb2NhbF9lcnIpOw0KPj4gKyB9DQo+PiArDQo+IA0KPiB0
aGlzIGRhbmdsaW5nIGxhYmVsIGNsZWFudXAgbWFrZXMgc2Vuc2UNCj4gDQo+PiArQEANCj4+ICtp
ZGVudGlmaWVyIHJ1bGUxLmZuOw0KPj4gK2lkZW50aWZpZXIgcnVsZTEubG9jYWxfZXJyOw0KPj4g
K0BADQo+PiArDQo+PiArIGZuKC4uLikNCj4+ICsgew0KPj4gK8KgwqDCoMKgIDwuLi4NCj4+ICso
DQo+PiArLcKgwqDCoCBlcnJvcl9mcmVlKGxvY2FsX2Vycik7DQo+PiArLcKgwqDCoCBsb2NhbF9l
cnIgPSBOVUxMOw0KPj4gKyvCoMKgwqAgZXJyb3JfZnJlZV9lcnJwKGVycnApOw0KPiANCj4gVGhp
cyBkb2VzIG5vdCBtYWtlIHNlbnNlIC0gZXJyb3JfZnJlZV9lcnJwKCkgaXMgbm90IGRlZmluZWQg
cHJpb3IgdG8gdGhpcyBzZXJpZXMgb3IgYW55d2hlcmUgaW4gcGF0Y2hlcyAxLTI0LCBpZiBJJ20g
cmVhZGluZyBpdCBjb3JyZWN0bHkuDQo+IA0KPj4gK3wNCj4+ICstwqDCoMKgIGVycm9yX2ZyZWUo
bG9jYWxfZXJyKTsNCj4+ICsrwqDCoMKgIGVycm9yX2ZyZWVfZXJycChlcnJwKTsNCj4gDQo+IGFu
ZCBhZ2Fpbg0KPiANCj4+ICt8DQo+PiArLcKgwqDCoCBlcnJvcl9yZXBvcnRfZXJyKGxvY2FsX2Vy
cik7DQo+PiArK8KgwqDCoCBlcnJvcl9yZXBvcnRfZXJycChlcnJwKTsNCj4+ICt8DQo+PiArLcKg
wqDCoCB3YXJuX3JlcG9ydF9lcnIobG9jYWxfZXJyKTsNCj4+ICsrwqDCoMKgIHdhcm5fcmVwb3J0
X2VycnAoZXJycCk7DQo+PiArfA0KPj4gKy3CoMKgwqAgZXJyb3JfcHJvcGFnYXRlX3ByZXBlbmQo
ZXJycCwgbG9jYWxfZXJyLA0KPj4gKyvCoMKgwqAgZXJyb3JfcHJlcGVuZChlcnJwLA0KPj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
Li4uKTsNCj4+ICt8DQo+PiArLcKgwqDCoCBlcnJvcl9wcm9wYWdhdGUoZXJycCwgbG9jYWxfZXJy
KTsNCj4+ICspDQo+PiArwqDCoMKgwqAgLi4uPg0KPj4gKyB9DQo+PiArDQo+IA0KPiBJdCBsb29r
cyBsaWtlIG9uY2UgdGhpcyBzY3JpcHQgaXMgcnVuLCBlcnJvcl9wcm9wYWdhdGVfcHJlcGVuZCgp
IHdpbGwgaGF2ZSBubyBjbGllbnRzLg0KDQpObywgaXQgc3RpbGwgaGF2ZSBhIGJpdCwgd2hlbiB3
b3JraW5nIHdpdGggZXJyb3JfY29weSwgYW5kL29yIG1vdmluZyBlcnJvcnMgZnJvbS90byBzdHJ1
Y3R1cmVzLg0KDQo+IElzIHRoZXJlIGEgbm9uLWdlbmVyYXRlZCBjbGVhbnVwIHBhdGNoIHRoYXQg
cmVtb3ZlcyBpdCAoYW5kIG9uY2UgaXQgaXMgcmVtb3ZlZCwgaXQgY2FuIGFsc28gYmUgcmVtb3Zl
ZCBmcm9tIHRoZSAuY29jY2kgc2NyaXB0IGFzIG5vIGZ1cnRoZXIgY2xpZW50cyB3aWxsIHJlYXBw
ZWFyIGxhdGVyKT8NCg0KTWF5YmUuDQoNCj4gDQo+IA0KPj4gK0BADQo+PiAraWRlbnRpZmllciBy
dWxlMS5mbjsNCj4+ICtpZGVudGlmaWVyIHJ1bGUxLmxvY2FsX2VycjsNCj4+ICtAQA0KPj4gKw0K
Pj4gKyBmbiguLi4pDQo+PiArIHsNCj4+ICvCoMKgwqDCoCA8Li4uDQo+PiArKA0KPj4gKy3CoMKg
wqAgJmxvY2FsX2Vycg0KPj4gKyvCoMKgwqAgZXJycA0KPj4gK3wNCj4+ICstwqDCoMKgIGxvY2Fs
X2Vycg0KPj4gKyvCoMKgwqAgKmVycnANCj4+ICspDQo+PiArwqDCoMKgwqAgLi4uPg0KPj4gKyB9
DQo+PiArDQo+PiArQEANCj4+ICtzeW1ib2wgZXJycDsNCj4+ICtAQA0KPj4gKw0KPj4gKy0gKmVy
cnAgIT0gTlVMTA0KPj4gKysgKmVycnANCj4+DQo+IA0KPiBTZWVtcyB0byBtYWtlIHNlbnNlLg0K
PiANCg0KDQotLSANCkJlc3QgcmVnYXJkcywNClZsYWRpbWlyDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
