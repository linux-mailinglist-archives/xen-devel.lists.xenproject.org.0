Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98877D5E8E
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2019 11:20:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iJwRu-0006qi-Fq; Mon, 14 Oct 2019 09:15:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2ids=YH=virtuozzo.com=vsementsov@srs-us1.protection.inumbo.net>)
 id 1iJwRG-0006pJ-R6
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2019 09:14:50 +0000
X-Inumbo-ID: 11d9bbb2-ee63-11e9-a531-bc764e2007e4
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe1e::72f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 11d9bbb2-ee63-11e9-a531-bc764e2007e4;
 Mon, 14 Oct 2019 09:14:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XR5Tz9uy2xmtbvlqlTwxhicK9FQerabUDc6Br83wf94YVX3FQRU+qZ/jZ1IwB1y8KW6dfINypyutXgdnZI7TKRsoaav6vPHX7D2gmgmNDHY5SZAoElS5k57ZmYL0PuMzbZKYghm1L1mG9pyFUn9+3S8iAuOBY8OwdP7dfta5DKOsCcJu3dTTyIrgDFT6RlL1+n2uySQke+R4fe3HfjFxCN5XNa+P5OhQDu4gTfazcrVMCJeIKOVzbAvs1/ki0QoEiFNVjOuR9LJIvIAsg6zvit750HOYl2sHLns8xzyI+hqiQlQkxj5v7gHd51bWxYTxjKdoqXvGVyRuCMCQYpvusg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=POruBAufDXWclcA82mGb7lCnuUy6K09V1O2lTslS3N8=;
 b=AWA6DJ06FraFAJab5v8BnBourVTdGH79MrAcCOIM8xGvwnDo88SucZESHqpDiFMFA4GZRQq/6RxI2sXPZrcyQgTPbQlD77ZXRspSvtRpbJx86wnjtiXq9RdnPZG9n6QCnUnLJC1R44UVuTmSPTqclBCZpiMRETsRsyNsz+yK3OCQ5J4oH7Cd6DAoBMTJpILcJ+bK//pHhQ53qtZcbGFFR1CONSdjsuyBVCG8lLm3UgrJ0XgH5yth6s7W0Un/3QcO7ymolgCNgDPwjhdeqx1qlVyas1Mq//8NkyTg2vPaRz04LLP0BqYmGagbe1ZykTUsTgyF3bSGdnyx9j7S0KJuMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=POruBAufDXWclcA82mGb7lCnuUy6K09V1O2lTslS3N8=;
 b=MLWo9VreqQSkqPtgYVKLk1m4H5exMS62YCG8yDkmG9Tdfx28oeWusEu3zQ4KghVryyjG6Q+qu+MPRUI1X2zzSxox+jmE5igdeAEtnVurZrBKgN162awCEz0OnZNg+q7xIaE0neVrvke1meN7FzXasK71vVauFNUN1F+oCJxi68I=
Received: from DB8PR08MB5498.eurprd08.prod.outlook.com (52.133.242.216) by
 DB8PR08MB5195.eurprd08.prod.outlook.com (20.179.15.207) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.21; Mon, 14 Oct 2019 09:14:47 +0000
Received: from DB8PR08MB5498.eurprd08.prod.outlook.com
 ([fe80::2856:990a:197a:288f]) by DB8PR08MB5498.eurprd08.prod.outlook.com
 ([fe80::2856:990a:197a:288f%2]) with mapi id 15.20.2347.021; Mon, 14 Oct 2019
 09:14:47 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Thread-Topic: [RFC v5 000/126] error: auto propagated local_err
Thread-Index: AQHVgE3dlsNxBDOk202dFu/C5nZLkadWQ+8AgAObEAA=
Date: Mon, 14 Oct 2019 09:14:46 +0000
Message-ID: <130d1104-845a-6705-ad83-fa27d8b73a0c@virtuozzo.com>
References: <157084624355.16951.11945043823681183793@37313f22b938>
In-Reply-To: <157084624355.16951.11945043823681183793@37313f22b938>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1P195CA0004.EURP195.PROD.OUTLOOK.COM (2603:10a6:3:fd::14)
 To DB8PR08MB5498.eurprd08.prod.outlook.com
 (2603:10a6:10:11c::24)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vsementsov@virtuozzo.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20191014121438769
x-originating-ip: [185.231.240.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dafeb668-0cd9-4835-9586-08d75086f505
x-ms-traffictypediagnostic: DB8PR08MB5195:
x-ms-exchange-purlcount: 3
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR08MB51955CE8C2C0907C263BE8FFC1900@DB8PR08MB5195.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 01901B3451
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(136003)(346002)(366004)(39840400004)(396003)(189003)(199004)(5640700003)(2351001)(486006)(76176011)(476003)(54906003)(64756008)(26005)(71200400001)(66946007)(66556008)(66476007)(31686004)(31696002)(66446008)(86362001)(186003)(71190400001)(316002)(4001150100001)(6306002)(36756003)(6512007)(6506007)(446003)(11346002)(386003)(2616005)(66066001)(14444005)(7336002)(7406005)(7366002)(7416002)(256004)(52116002)(102836004)(305945005)(966005)(6486002)(6246003)(8936002)(14454004)(478600001)(2906002)(6916009)(2501003)(8676002)(4326008)(81156014)(81166006)(6436002)(7736002)(229853002)(5660300002)(6116002)(3846002)(25786009)(99286004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB8PR08MB5195;
 H:DB8PR08MB5498.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: virtuozzo.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kVMuyC9ro7QFtyWcAuG6gEEClg0dvRph5VwTZcXana//djkrme1TGnDWQ0LSrQ4IETwUH3GK/7De//AQKgqHlX5kAM8oqH8mtTVJHI6hrVAXifAjiUoBRccnJ6rh7JHHP6DYnZgHtnn+xX1+x9bP9Sr5xIr7HH9mMD0nmPOVk8mcRlP1HfGRZPGSzBJ/UowQxwSaVAb/JVAWQAuIdxc/uX7c8qT9CZPFd46Cjr6VqgPiGbjAjal0wZICxpWOkmILKyF0TWurWz3r3+AIUBtDiqHgQrK2Z2HHPdbmik07e0XnrrvU9xycPkuZJvAwNybBgTIQZT6WwkXFR+6OJy8fPRab+fYwWWASRUmC6Vt/yQuU0TdxT3kIxWiAoAwiQEeBv/0W+up9siyMJmQULAbpHLVinKodR947QHFAxHPay6E7XtppaHaNpCUYUKo0VsrSLMtz8T/T/36WmvSDmBrn4Q==
Content-ID: <9FDDB927CE7BC94B99E248AB6BD395C9@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dafeb668-0cd9-4835-9586-08d75086f505
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2019 09:14:46.8422 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZD8zeZxsTn8Z2QtteIps4BHAWaCvztUOkAzgkIWKmzcruzQYSspd0hX1gQEz4E3m7jaDLr25JCEYKNnwof1gtbsMrNWDZX0iYj8jWfJBF2U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5195
X-Mailman-Approved-At: Mon, 14 Oct 2019 09:15:29 +0000
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
 "lersek@redhat.com" <lersek@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
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
 "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
 "david@redhat.com" <david@redhat.com>, "palmer@sifive.com" <palmer@sifive.com>,
 "thuth@redhat.com" <thuth@redhat.com>,
 "jcmvbkbc@gmail.com" <jcmvbkbc@gmail.com>, "hare@suse.com" <hare@suse.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "arei.gonglei@huawei.com" <arei.gonglei@huawei.com>,
 "namei.unix@gmail.com" <namei.unix@gmail.com>,
 "atar4qemu@gmail.com" <atar4qemu@gmail.com>,
 "farman@linux.ibm.com" <farman@linux.ibm.com>,
 "amit@kernel.org" <amit@kernel.org>, "sw@weilnetz.de" <sw@weilnetz.de>,
 "groug@kaod.org" <groug@kaod.org>,
 "yuval.shaia@oracle.com" <yuval.shaia@oracle.com>,
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
 "paul@xen.org" <paul@xen.org>, "green@moxielogic.com" <green@moxielogic.com>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "edgar.iglesias@gmail.com" <edgar.iglesias@gmail.com>,
 "gxt@mprc.pku.edu.cn" <gxt@mprc.pku.edu.cn>, "ari@tuxera.com" <ari@tuxera.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 "mdroth@linux.vnet.ibm.com" <mdroth@linux.vnet.ibm.com>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
 "joel@jms.id.au" <joel@jms.id.au>, "dillaman@redhat.com" <dillaman@redhat.com>,
 "antonynpavlov@gmail.com" <antonynpavlov@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "integration@gluster.org" <integration@gluster.org>,
 "philmd@redhat.com" <philmd@redhat.com>,
 "rjones@redhat.com" <rjones@redhat.com>,
 "Andrew.Baumann@microsoft.com" <Andrew.Baumann@microsoft.com>,
 "mreitz@redhat.com" <mreitz@redhat.com>, Denis Lunev <den@virtuozzo.com>,
 "mst@redhat.com" <mst@redhat.com>,
 "mark.cave-ayland@ilande.co.uk" <mark.cave-ayland@ilande.co.uk>,
 "v.maffione@gmail.com" <v.maffione@gmail.com>, "marex@denx.de" <marex@denx.de>,
 "armbru@redhat.com" <armbru@redhat.com>,
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 "alistair@alistair23.me" <alistair@alistair23.me>,
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

MTIuMTAuMjAxOSA1OjEwLCBuby1yZXBseUBwYXRjaGV3Lm9yZyB3cm90ZToNCj4gUGF0Y2hldyBV
Ukw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MTAxMTE2MDU1Mi4yMjkwNy0xLXZzZW1l
bnRzb3ZAdmlydHVvenpvLmNvbS8NCj4gDQo+IA0KPiANCj4gSGksDQo+IA0KPiBUaGlzIHNlcmll
cyBmYWlsZWQgdGhlIGRvY2tlci1xdWlja0BjZW50b3M3IGJ1aWxkIHRlc3QuIFBsZWFzZSBmaW5k
IHRoZSB0ZXN0aW5nIGNvbW1hbmRzIGFuZA0KPiB0aGVpciBvdXRwdXQgYmVsb3cuIElmIHlvdSBo
YXZlIERvY2tlciBpbnN0YWxsZWQsIHlvdSBjYW4gcHJvYmFibHkgcmVwcm9kdWNlIGl0DQo+IGxv
Y2FsbHkuDQo+IA0KPiA9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09DQo+ICMhL2Jpbi9iYXNoDQo+
IG1ha2UgZG9ja2VyLWltYWdlLWNlbnRvczcgVj0xIE5FVFdPUks9MQ0KPiB0aW1lIG1ha2UgZG9j
a2VyLXRlc3QtcXVpY2tAY2VudG9zNyBTSE9XX0VOVj0xIEo9MTQgTkVUV09SSz0xDQo+ID09PSBU
RVNUIFNDUklQVCBFTkQgPT09DQo+IA0KPiAgICBURVNUICAgIGlvdGVzdC1xY293MjogMDEzDQo+
ICAgIFRFU1QgICAgY2hlY2stdW5pdDogdGVzdHMvdGVzdC1ibG9jay1pb3RocmVhZA0KPiAgICBU
RVNUICAgIGNoZWNrLXVuaXQ6IHRlc3RzL3Rlc3QtaW1hZ2UtbG9ja2luZw0KPiB3YXJuaW5nOiBG
YWlsZWQgdG8gZ2V0IHNoYXJlZCAiY29uc2lzdGVudCByZWFkIiBsb2NrDQo+IElzIGFub3RoZXIg
cHJvY2VzcyB1c2luZyB0aGUgaW1hZ2UgWy90bXAvcXRlc3QuTzY2bDN0XT8NCj4gd2FybmluZzog
RmFpbGVkIHRvIGdldCBzaGFyZWQgImNvbnNpc3RlbnQgcmVhZCIgbG9jaw0KPiBJcyBhbm90aGVy
IHByb2Nlc3MgdXNpbmcgdGhlIGltYWdlIFsvdG1wL3F0ZXN0LkcwTTlWOF0/DQo+ICAgIFRFU1Qg
ICAgY2hlY2stdW5pdDogdGVzdHMvdGVzdC14ODYtY3B1aWQNCj4gICAgVEVTVCAgICBjaGVjay11
bml0OiB0ZXN0cy90ZXN0LXhienJsZQ0KPiAtLS0NCj4gICAgVEVTVCAgICBpb3Rlc3QtcWNvdzI6
IDI2Nw0KPiBGYWlsdXJlczogMDU0DQo+IEZhaWxlZCAxIG9mIDEwOCBpb3Rlc3RzDQo+IG1ha2U6
ICoqKiBbY2hlY2stdGVzdHMvY2hlY2stYmxvY2suc2hdIEVycm9yIDENCj4gbWFrZTogKioqIFdh
aXRpbmcgZm9yIHVuZmluaXNoZWQgam9icy4uLi4NCj4gICAgVEVTVCAgICBjaGVjay1xdGVzdC1h
YXJjaDY0OiB0ZXN0cy9xb3MtdGVzdA0KPiBUcmFjZWJhY2sgKG1vc3QgcmVjZW50IGNhbGwgbGFz
dCk6DQo+IC0tLQ0KPiAgICAgIHJhaXNlIENhbGxlZFByb2Nlc3NFcnJvcihyZXRjb2RlLCBjbWQp
DQo+IHN1YnByb2Nlc3MuQ2FsbGVkUHJvY2Vzc0Vycm9yOiBDb21tYW5kICdbJ3N1ZG8nLCAnLW4n
LCAnZG9ja2VyJywgJ3J1bicsICctLWxhYmVsJywgJ2NvbS5xZW11Lmluc3RhbmNlLnV1aWQ9MmM1
NWZiNjFhNjNhNDA5MzgyZjJiM2E5OWZjYTkzZDknLCAnLXUnLCAnMTAwMycsICctLXNlY3VyaXR5
LW9wdCcsICdzZWNjb21wPXVuY29uZmluZWQnLCAnLS1ybScsICctZScsICdUQVJHRVRfTElTVD0n
LCAnLWUnLCAnRVhUUkFfQ09ORklHVVJFX09QVFM9JywgJy1lJywgJ1Y9JywgJy1lJywgJ0o9MTQn
LCAnLWUnLCAnREVCVUc9JywgJy1lJywgJ1NIT1dfRU5WPTEnLCAnLWUnLCAnQ0NBQ0hFX0RJUj0v
dmFyL3RtcC9jY2FjaGUnLCAnLXYnLCAnL2hvbWUvcGF0Y2hldzIvLmNhY2hlL3FlbXUtZG9ja2Vy
LWNjYWNoZTovdmFyL3RtcC9jY2FjaGU6eicsICctdicsICcvdmFyL3RtcC9wYXRjaGV3LXRlc3Rl
ci10bXAtdXN2aThmb2Ivc3JjL2RvY2tlci1zcmMuMjAxOS0xMC0xMS0yMi4wMC4xMC4xOTMzOi92
YXIvdG1wL3FlbXU6eixybycsICdxZW11OmNlbnRvczcnLCAnL3Zhci90bXAvcWVtdS9ydW4nLCAn
dGVzdC1xdWljayddJyByZXR1cm5lZCBub24temVybyBleGl0IHN0YXR1cyAyLg0KPiBmaWx0ZXI9
LS1maWx0ZXI9bGFiZWw9Y29tLnFlbXUuaW5zdGFuY2UudXVpZD0yYzU1ZmI2MWE2M2E0MDkzODJm
MmIzYTk5ZmNhOTNkOQ0KPiBtYWtlWzFdOiAqKiogW2RvY2tlci1ydW5dIEVycm9yIDENCj4gbWFr
ZVsxXTogTGVhdmluZyBkaXJlY3RvcnkgYC92YXIvdG1wL3BhdGNoZXctdGVzdGVyLXRtcC11c3Zp
OGZvYi9zcmMnDQo+IG1ha2U6ICoqKiBbZG9ja2VyLXJ1bi10ZXN0LXF1aWNrQGNlbnRvczddIEVy
cm9yIDINCg0KU29tZXRoaW5nIHN0cmFuZ2UuIFdobyBrbm93cywgd2hhdCBpcyBpdD8NCg0KPiAN
Cj4gcmVhbCAgICAxMG0zMy43MTRzDQo+IHVzZXIgICAgMG04LjM2MHMNCj4gDQo+IA0KPiBUaGUg
ZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0DQo+IGh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzIwMTkx
MDExMTYwNTUyLjIyOTA3LTEtdnNlbWVudHNvdkB2aXJ0dW96em8uY29tL3Rlc3RpbmcuZG9ja2Vy
LXF1aWNrQGNlbnRvczcvP3R5cGU9bWVzc2FnZS4NCg0KIiINCk5vdCBGb3VuZA0KDQpUaGUgcmVx
dWVzdGVkIHJlc291cmNlIHdhcyBub3QgZm91bmQgb24gdGhpcyBzZXJ2ZXIuDQoiIg0KDQo+IC0t
LQ0KPiBFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3Bh
dGNoZXcub3JnL10uDQo+IFBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZl
bEByZWRoYXQuY29tDQo+IA0KDQoNCi0tIA0KQmVzdCByZWdhcmRzLA0KVmxhZGltaXINCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
