Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 881DEF94B3
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2019 16:50:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUYO2-0007U2-KJ; Tue, 12 Nov 2019 15:47:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tyKK=ZE=virtuozzo.com=vsementsov@srs-us1.protection.inumbo.net>)
 id 1iUYAd-0006QS-2D
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2019 15:33:31 +0000
X-Inumbo-ID: c602a9c2-0561-11ea-b678-bc764e2007e4
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.15.130]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c602a9c2-0561-11ea-b678-bc764e2007e4;
 Tue, 12 Nov 2019 15:33:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZApIedXP16mNJDhP6n2uTo24AD1xItw71zGZkfxyZuV+jtq/79L4/F57QJhiuysHX8TBITkC65NK3YxT6+Qz98ybpzncfHunocYigmO1nAcUs1SYbFihTO1PhThLoZyDvnU9wuwMRxAeVcmscXsYrAqIhX/NKqaUdByVDPNcjQB4OIlN/Cz5bpdjnKShriDNGq9bKxw/bZCVTfTO+4fWbZtEgdyLdo+/5h0MKDUx8oJ6PYuv8Wl9mqJcp6SKfSoYtOmx2YqGmO89e2SH57SClnAElFaN4v1zQQhddIUMijcphjDFyg/csZ5Z5CLoexnHPi3EsERiOm7hR7zWgfXewA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mr1I00U8Qko9aiSrxAD29kOa0EzrdJipu7cN95byTqo=;
 b=gbBnORg2AZ+Zaa26oQA9H78gNpP5yKIp/Fg7ss08rNq5TRpIBMZJFsJWABmuQEDD/0eYxr4JWvtebhqvYSaAvgx9qIUf441F7WKgjNC5wy4bBd9l3vHVSMLLKGN5S/FdaLs+j7qhh+LtgPLdy6VQI/euVgzPwFihRK1v3qEexYRSriz/lkiG8/1YGsd4vuihU3e4kSm9Y1EYwVrPXA63uErr0f9NROHeKi7kN2WcYzR1uaS1rALY+HzFfr9L687lt0rKvUtWw5RsjbphUO0xtfeT8Tis8rctpZe7GlKILz9qTn79hNUcV7HYu7mPuG62PK8sUzhDgiA3mFTCurt3YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mr1I00U8Qko9aiSrxAD29kOa0EzrdJipu7cN95byTqo=;
 b=Cr/tgkqVaNq8gB5xFzwyy5V2MWOEnCX8x14laXMX3J5s9AlFd3W8WJpDWpnSWW/UqJN/Iqq+ykYktgsaeeGiLNCeckT5dSpT1WVxTpB+gBo5dhOEiAq5V2Zi8qQVTvXPsuWCysdFfUIpEu62FdSYwBn+I1tiRPa8U+FZxtNQ45g=
Received: from AM6PR08MB4423.eurprd08.prod.outlook.com (20.179.7.140) by
 AM6PR08MB3063.eurprd08.prod.outlook.com (52.135.164.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.25; Tue, 12 Nov 2019 15:33:26 +0000
Received: from AM6PR08MB4423.eurprd08.prod.outlook.com
 ([fe80::31bd:5bb3:377e:706f]) by AM6PR08MB4423.eurprd08.prod.outlook.com
 ([fe80::31bd:5bb3:377e:706f%3]) with mapi id 15.20.2430.027; Tue, 12 Nov 2019
 15:33:26 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Cornelia Huck <cohuck@redhat.com>, =?utf-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?=
 <marcandre.lureau@redhat.com>
Thread-Topic: [RFC v5 000/126] error: auto propagated local_err
Thread-Index: AQHVgE3dlsNxBDOk202dFu/C5nZLkaeBxI0AgAAHj4CABfJ+AIAAHc+A
Date: Tue, 12 Nov 2019 15:33:26 +0000
Message-ID: <85a110a7-e29a-158a-4d62-cd1ce6d54fa3@virtuozzo.com>
References: <20191011160552.22907-1-vsementsov@virtuozzo.com>
 <d1756cd0-8ad7-1e6c-b127-59ed24c5e512@virtuozzo.com>
 <CAMxuvawy_TStTDXYoNF0zFjh6eOF1EUKe6BYAxUo_S9-cxMPSg@mail.gmail.com>
 <20191112144638.4baf555a.cohuck@redhat.com>
In-Reply-To: <20191112144638.4baf555a.cohuck@redhat.com>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0701CA0050.eurprd07.prod.outlook.com
 (2603:10a6:3:9e::18) To AM6PR08MB4423.eurprd08.prod.outlook.com
 (2603:10a6:20b:bf::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vsementsov@virtuozzo.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20191112183319757
x-originating-ip: [185.231.240.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 676d1f68-8a7f-4a86-3f0a-08d76785a916
x-ms-traffictypediagnostic: AM6PR08MB3063:
x-ms-exchange-purlcount: 2
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR08MB306304F88DBBC0C92448FB2FC1770@AM6PR08MB3063.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 021975AE46
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(376002)(346002)(39840400004)(396003)(366004)(189003)(199004)(52314003)(6486002)(102836004)(76176011)(229853002)(966005)(36756003)(256004)(52116002)(478600001)(316002)(64756008)(6306002)(6512007)(6246003)(99286004)(6436002)(26005)(66446008)(2906002)(53546011)(6506007)(386003)(66946007)(66476007)(5660300002)(4326008)(66556008)(3846002)(6116002)(186003)(110136005)(8676002)(31686004)(81156014)(2616005)(8936002)(66066001)(81166006)(446003)(11346002)(476003)(486006)(25786009)(71190400001)(71200400001)(14454004)(7736002)(7406005)(7336002)(86362001)(7366002)(7416002)(54906003)(31696002)(7276002)(305945005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR08MB3063;
 H:AM6PR08MB4423.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: virtuozzo.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: N5+YpprYFcuCZjmPOKykd0VXNWAW+aU7m0QWFQuEjvvbRqqUdPMLMhkv92gs/aJMuxpCkM2EynObilNZSGQ1AfUTn+wsXly/eueT5CphADxtwcSJ2NL1UW52JGAIsZFvTO9dsbLdGL9RLtisCpo+zkFPxt/J3vkmgM6iPOEpPP/3RcVWUNCRwoua4v8rgqqz0FvOxFwvKBs03s74yXPCAwIz/ce8WWM7l/4GWnjiJoCW6S5lDe+mNotquja3Q8DOgbNy0ozo3JXrE+GurUGZMD91g3Jmq1DPep9wRcOLMO+BienuoIP5H+Myoz4bjQzDm3LmvZkbgqVUi3Er6sb09lWnphuDVUCtSAZ1gWAHN/6azo5rm/z+DLKMqc6btnl0XDc7/74S6ljx9uRNakeT/XglnwuUKZoreSLEjsY5f9PdLKhtc1Gc9xi55iIYnKSGYEqeUMUqHT5eVzMknbXiRMditk/2AYn0t3XpwpJF+Ik=
Content-ID: <20869F922F716A438200D8FFB82DB9D6@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 676d1f68-8a7f-4a86-3f0a-08d76785a916
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2019 15:33:26.2852 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NCgM3jfdLTzOf5I0i9e34nzdAPsCe/V3tGv6OHxk6v8te5wVTu3+JpTh5uLMfr8S5lZVZn4AiNGet6N/e+cHY4J+mGVvURr7pY/D3FPo+uY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3063
X-Mailman-Approved-At: Tue, 12 Nov 2019 15:47:20 +0000
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
 Jan Kiszka <jan.kiszka@siemens.com>, Eric Blake <eblake@redhat.com>,
 Alberto Garcia <berto@igalia.com>,
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
 Stefano Stabellini <sstabellini@kernel.org>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Liu Yuan <namei.unix@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Amit Shah <amit@kernel.org>, Stefan Weil <sw@weilnetz.de>,
 Greg Kurz <groug@kaod.org>, Yuval Shaia <yuval.shaia@oracle.com>,
 "qemu-s390x@nongnu.org" <qemu-s390x@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>,
 Stafford Horne <shorne@gmail.com>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
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
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Vincenzo Maffione <v.maffione@gmail.com>, Marek Vasut <marex@denx.de>,
 "armbru@redhat.com" <armbru@redhat.com>,
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

MTIuMTEuMjAxOSAxNjo0NiwgQ29ybmVsaWEgSHVjayB3cm90ZToNCj4gT24gRnJpLCA4IE5vdiAy
MDE5IDIyOjU3OjI1ICswNDAwDQo+IE1hcmMtQW5kcsOpIEx1cmVhdSA8bWFyY2FuZHJlLmx1cmVh
dUByZWRoYXQuY29tPiB3cm90ZToNCj4gDQo+PiBIaQ0KPj4NCj4+IE9uIEZyaSwgTm92IDgsIDIw
MTkgYXQgNzozMSBQTSBWbGFkaW1pciBTZW1lbnRzb3YtT2dpZXZza2l5DQo+PiA8dnNlbWVudHNv
dkB2aXJ0dW96em8uY29tPiB3cm90ZToNCj4+Pg0KPj4+IEZpbmFsbHksIHdoYXQgaXMgdGhlIHBs
YW4/DQo+Pj4NCj4+PiBNYXJrdXMgd2hhdCBkbyB5b3UgdGhpbms/DQo+Pj4NCj4+PiBOb3cgYSBs
b3Qgb2YgcGF0Y2hlcyBhcmUgcmV2aWV3ZWQsIGJ1dCBhIGxvdCBvZiBhcmUgbm90Lg0KPj4+DQo+
Pj4gSXMgdGhlcmUgYW55IGhvcGUgdGhhdCBhbGwgcGF0Y2hlcyB3aWxsIGJlIHJldmlld2VkPyBT
aG91bGQgSSByZXNlbmQgdGhlDQo+Pj4gd2hvbGUgc2VyaWVzLCBvciBtYXkgYmUgcmVkdWNlIGl0
IHRvIHJldmlld2VkIHN1YnN5c3RlbXMgb25seT8NCj4+DQo+PiBJIGRvbid0IHRoaW5rIHdlIGhh
dmUgd2VsbCBlc3RhYmxpc2hlZCBydWxlcyBmb3Igd2hvbGUtdHJlZSBjbGVhbnVwcw0KPj4gbGlr
ZSB0aGlzLiBJbiB0aGUgcGFzdCwgc2V2ZXJhbCBjbGVhbnVwIHNlcmllcyBnb3QgbG9zdC4NCj4g
DQo+IFllcywgaXQgaXMgYWx3YXlzIHByb2JsZW1hdGljIGlmIGEgc2VyaWVzIHRvdWNoZXMgYSBs
b3Qgb2YgZGlmZmVyZW50DQo+IHN1YnN5c3RlbXMuDQo+IA0KPj4NCj4+IEl0IHdpbGwgdGFrZSBh
Z2VzIHRvIGdldCBldmVyeSBzdWJzeXN0ZW0gbWFpbnRhaW5lciB0byByZXZpZXcgdGhlDQo+PiBw
YXRjaGVzLiBNb3N0IGxpa2VseSwgc2luY2UgdGhleSBhcmUgcXVpdGUgc3lzdGVtYXRpYywgdGhl
cmUgaXNuJ3QNCj4+IG11Y2ggdG8gc2F5IGFuZCBpdCBpcyBlYXN5IHRvIG1pc3Mgc29tZXRoaW5n
IHRoYXQgaGFzIHNvbWUgaGlkZGVuDQo+PiByYW1pZmljYXRpb25zLiBQZXJoYXBzIHdob2xlLXRy
ZWUgY2xlYW51cHMgc2hvdWxkIHJlcXVpcmUgYXQgbGVhc3QgMg0KPj4gcmV2aWV3ZXJzIHRvIGJ5
cGFzcyB0aGUgc3Vic3l0ZW0gbWFpbnRhaW5lciByZXZpZXc/IEJ1dCBteSBwYXN0DQo+PiBleHBl
cmllbmNlIHdpdGggdGhpcyBraW5kIG9mIGV4ZXJjaWNlIGRvZXNuJ3QgZW5jb3VyYWdlIG1lLCBh
bmQNCj4+IHByb2JhYmx5IEkgYW0gbm90IHRoZSBvbmx5IG9uZS4NCj4gDQo+IEl0J3Mgbm90IGp1
c3QgdGhlIHJldmlld3M7IGl0J3MgZWFzeSB0byBtaXNzIGNvbXBpbGUgcHJvYmxlbXMgb24gbGVz
cw0KPiBtYWluc3RyZWFtIGFyY2hpdGVjdHVyZXMgKGFuZCBldmVuIGVhc2llciB0byBtaXNzIGZ1
bmN0aW9uYWwgcHJvYmxlbXMNCj4gdGhlcmUsIGFsdGhvdWdoIHRoZXkgYXJlIHByb2JhYmx5IGxl
c3MgbGlrZWx5IHdpdGggYXV0b21hdGVkIHJld29yay4pDQo+IENJIGNhbiBwcm9iYWJseSBoZWxw
LCBidXQgdGhhdCdzIHNvbWV0aGluZyBmb3IgdGhlIGZ1dHVyZS4NCj4gDQo+IEFueXdheSwgSSd2
ZSBub3cgZ290dGVuIGFyb3VuZCB0byB0aGF0IHNlcmllczsgc3BvdHRlZCBvbmUgcHJvYmxlbSBp
bg0KPiBzMzkweCBjb2RlLCBJIHRoaW5rLg0KPiANCj4gT25lIHRoaW5nIHRoYXQncyBoZWxwZnVs
IGZvciBzdWNoIGEgbGFyZ2Ugc2VyaWVzIGlzIGEgZ2l0IGJyYW5jaCB0aGF0DQo+IG1ha2VzIGl0
IGVhc3kgdG8gZ2l2ZSB0aGUgc2VyaWVzIGEgcXVpY2sgZ28uIChZb3UgY2FuIHVzZSBwYXRjaGV3
LCBidXQNCj4gaXQgdGFrZXMgdGltZSBiZWZvcmUgaXQgZ2V0cyBhbGwgbWFpbHMsIHNvIGp1c3Qg
cHVzaGluZyBpdCBzb21ld2hlcmUNCj4gYW5kIGxldHRpbmcgcGVvcGxlIGtub3cgaXMgYSBnb29k
IGlkZWEgYW55d2F5LikNCj4gDQoNClRoYW5rcyBmb3IgcmV2aWV3IQ0KDQpUaGUgc2VyaWVzIGFy
ZSBwb3N0ZWQgaGVyZToNCg0KaHR0cHM6Ly9zcmMub3BlbnZ6Lm9yZy91c2Vycy92c2VtZW50c292
L3JlcG9zL3FlbXUvYnJvd3NlDQoNCmh0dHBzOi8vc3JjLm9wZW52ei5vcmcvc2NtL352c2VtZW50
c292L3FlbXUuZ2l0ICN0YWcgdXAtYXV0by1sb2NhbC1lcnItdjUNCg0KDQotLSANCkJlc3QgcmVn
YXJkcywNClZsYWRpbWlyDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
