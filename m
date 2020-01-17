Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6F3140D19
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 15:53:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isSxS-0005AX-D9; Fri, 17 Jan 2020 14:50:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kr2w=3G=virtuozzo.com=vsementsov@srs-us1.protection.inumbo.net>)
 id 1isSxQ-0005AH-Dw
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 14:50:44 +0000
X-Inumbo-ID: bbacf8dc-3938-11ea-b833-bc764e2007e4
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1b::70c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bbacf8dc-3938-11ea-b833-bc764e2007e4;
 Fri, 17 Jan 2020 14:50:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b2m6W5y3x4ek1O2KiPP1Vfb4QsE4yW87ao51NqzafrxRWjjPkGXFc1qws+iRkVuM7UWO30XMIwZf56oR+TvNnLeHGTqxp2Zfi2YX8N1EgrXKJzdJd8N+tW5qbF0WEb84kgBojG07dov7YqtQlMqD6D9/G2grAGvvCK2DC7lIuVi8F9BTokQkfQfOdhTljYRCSvBvp3Xbmf9/piSohxuVLJcOh4PSv69dUqJch5MyqrXPD6zKS35Ttr5fjToeZtAY2BeCxyyIWqGtrrgNebHt4ahhAC8pBMrriEETZQCuxDPmFAzWtqe03PvwG/s04yxjZnxC3ta6XlQU3a2Oq8hGgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=79UZI3YKXkPkn4BSO21lDOL30ZlurH4i/oVbcR5duBE=;
 b=VPCeBvTz59EutP3eCBjoOnh0HbZb0JAcqi/Wfx9V4NEXhxlBgNoGRH8V55maqx7eNQ/+aVwq/1qdKzHsRxTHLXaS/1CwpQngBNe4mx53vPo0MhJwjglHB661XOlGma1udoVviMKNpcOhezAVqC/5CUxzKkryNQfxzFhlsR1rX4kCvGRsa8TdV/py+EzJaqRWVZCR6LDz97VqMSTcwN370jsCzVU8aZW6ZUw9u0/1q75FllcSoX4vmlPOodcMO1axpK/gQo4/X/lq3zmZOFoE7gcCGLBYw7JzkNbusFn5tvFsINjoTYxhtQu1L8SCUn6mlY/iBzae+2ZyjGBk2Bkgeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=79UZI3YKXkPkn4BSO21lDOL30ZlurH4i/oVbcR5duBE=;
 b=vha80QfCsRcRL0hbZdUXXP6cbuLAir37clTg54sWqvQg5XVaGneU4CpNOA1GYTQKTwfwASUYxvl6yRDO0F2jfIkCBYMtX6oYUcoSRXXb4WYb1fLKx42wpM9gn264WdJrnUNNjdtlU+bhYhSNm1m1zuNBo85TUcGP1mMforu+PSY=
Received: from AM6PR08MB4423.eurprd08.prod.outlook.com (20.179.7.140) by
 AM6PR08MB3704.eurprd08.prod.outlook.com (20.177.199.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.19; Fri, 17 Jan 2020 14:50:41 +0000
Received: from AM6PR08MB4423.eurprd08.prod.outlook.com
 ([fe80::11a9:a944:c946:3030]) by AM6PR08MB4423.eurprd08.prod.outlook.com
 ([fe80::11a9:a944:c946:3030%7]) with mapi id 15.20.2644.023; Fri, 17 Jan 2020
 14:50:41 +0000
Received: from [172.16.24.200] (185.231.240.5) by
 HE1PR05CA0378.eurprd05.prod.outlook.com (2603:10a6:7:94::37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.20 via Frontend Transport; Fri, 17 Jan 2020 14:50:39 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Thread-Topic: [PATCH v6 03/11] scripts: add coccinelle script to use auto
 propagated errp
Thread-Index: AQHVx+4SF0GjeLmYrEGDD22yW9X7Jafu+xoA
Date: Fri, 17 Jan 2020 14:50:41 +0000
Message-ID: <62ac6370-9e4a-0251-6c51-567e088afecb@virtuozzo.com>
References: <20200110194158.14190-1-vsementsov@virtuozzo.com>
 <20200110194158.14190-4-vsementsov@virtuozzo.com>
In-Reply-To: <20200110194158.14190-4-vsementsov@virtuozzo.com>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR05CA0378.eurprd05.prod.outlook.com
 (2603:10a6:7:94::37) To AM6PR08MB4423.eurprd08.prod.outlook.com
 (2603:10a6:20b:bf::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vsementsov@virtuozzo.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20200117175038586
x-originating-ip: [185.231.240.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 605ba7f3-f5b6-46b7-b6c7-08d79b5c9f59
x-ms-traffictypediagnostic: AM6PR08MB3704:
x-microsoft-antispam-prvs: <AM6PR08MB3704FBD9319C5200F894907BC1310@AM6PR08MB3704.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0285201563
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(396003)(39840400004)(366004)(346002)(136003)(189003)(199004)(81156014)(6666004)(478600001)(81166006)(8676002)(4326008)(8936002)(6916009)(6486002)(36756003)(2906002)(186003)(52116002)(16576012)(7416002)(956004)(2616005)(66476007)(64756008)(16526019)(66946007)(31696002)(5660300002)(71200400001)(316002)(26005)(31686004)(54906003)(66556008)(86362001)(66446008)(2004002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR08MB3704;
 H:AM6PR08MB4423.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: virtuozzo.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8mQJ84lODNgJqq/I3fKhWAUh+yty7ILSvKrS370GTNLFI6eX34kbPFZXxpJbj+tCQNIs4ediu5EjEaUjerCmlQGmECxiwN18CYhddIoBWCWZvzzhCp28K1yK1mU3cVUotG8tySOgFNn1RqimUke3StkxhCGMHwhRWaH/QVVGwSRsmYZCbiM05P8bfj2fwBlvrKNkBqNaNMp/WWcNP0qukNtKfVGS4LCTUIwzEcsehC+VYiqtiKHh2/Xt1S6I7yP4LlZSI3XjtLSJZQuYEU8xvA5BoPL8+DaFm36raO13EGuiHkiIAapN0+s+j0PqaLQXMYH9LcNmgu9RiWezIbLiOhz19vAQcAMUorHNFqM7zbs627i4/k8zHiZTn94WZhdopzkx+a/0dg5rN2TGb9yy6YwhIMOt3N0Xj3BB4Da/oQUfEZkdWrm6JO3PNoZRdjNj6uBNo0NjYRtKwdFuaV7/qy4ebWq8f2rhxMrhsiRSbhwzu5b7nsnW+3vZVCdTBCfF2oKR6+XNDZeBujPQjnprzQ==
x-ms-exchange-transport-forked: True
Content-ID: <952C75A2BD216B40926F4C872CD8FE55@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 605ba7f3-f5b6-46b7-b6c7-08d79b5c9f59
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2020 14:50:41.0507 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7M5h7mKJp05+omvVLVpetlY0EDTJcC4cgy3wyFJLTx+odiLy93TSl/qUj5dAM1SJwBk82XL3pL95916KnO1RZ3TIZfU5as25QaKrx9So2Ug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3704
Subject: Re: [Xen-devel] [PATCH v6 03/11] scripts: add coccinelle script to
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Laszlo Ersek <lersek@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>, Paul Durrant <paul@xen.org>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Greg Kurz <groug@kaod.org>,
 Max Reitz <mreitz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Eric Blake <eblake@redhat.com>, Michael Roth <mdroth@linux.vnet.ibm.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

MTAuMDEuMjAyMCAyMjo0MSwgVmxhZGltaXIgU2VtZW50c292LU9naWV2c2tpeSB3cm90ZToNCj4g
U2lnbmVkLW9mZi1ieTogVmxhZGltaXIgU2VtZW50c292LU9naWV2c2tpeSA8dnNlbWVudHNvdkB2
aXJ0dW96em8uY29tPg0KPiAtLS0NCj4gDQo+IENDOiBDb3JuZWxpYSBIdWNrIDxjb2h1Y2tAcmVk
aGF0LmNvbT4NCj4gQ0M6IEVyaWMgQmxha2UgPGVibGFrZUByZWRoYXQuY29tPg0KPiBDQzogS2V2
aW4gV29sZiA8a3dvbGZAcmVkaGF0LmNvbT4NCj4gQ0M6IE1heCBSZWl0eiA8bXJlaXR6QHJlZGhh
dC5jb20+DQo+IENDOiBHcmVnIEt1cnogPGdyb3VnQGthb2Qub3JnPg0KPiBDQzogU3RlZmFuIEhh
am5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPg0KPiBDQzogU3RlZmFubyBTdGFiZWxsaW5pIDxz
c3RhYmVsbGluaUBrZXJuZWwub3JnPg0KPiBDQzogQW50aG9ueSBQZXJhcmQgPGFudGhvbnkucGVy
YXJkQGNpdHJpeC5jb20+DQo+IENDOiBQYXVsIER1cnJhbnQgPHBhdWxAeGVuLm9yZz4NCj4gQ0M6
ICJQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSIgPHBoaWxtZEByZWRoYXQuY29tPg0KPiBDQzogTGFz
emxvIEVyc2VrIDxsZXJzZWtAcmVkaGF0LmNvbT4NCj4gQ0M6IEdlcmQgSG9mZm1hbm4gPGtyYXhl
bEByZWRoYXQuY29tPg0KPiBDQzogU3RlZmFuIEJlcmdlciA8c3RlZmFuYkBsaW51eC5pYm0uY29t
Pg0KPiBDQzogTWFya3VzIEFybWJydXN0ZXIgPGFybWJydUByZWRoYXQuY29tPg0KPiBDQzogTWlj
aGFlbCBSb3RoIDxtZHJvdGhAbGludXgudm5ldC5pYm0uY29tPg0KPiBDQzogcWVtdS1ibG9ja0Bu
b25nbnUub3JnDQo+IENDOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gDQo+ICAg
aW5jbHVkZS9xYXBpL2Vycm9yLmggICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAzICsNCj4g
ICBzY3JpcHRzL2NvY2NpbmVsbGUvYXV0by1wcm9wYWdhdGVkLWVycnAuY29jY2kgfCAxMzkgKysr
KysrKysrKysrKysrKysrDQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxNDIgaW5zZXJ0aW9ucygrKQ0K
PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBzY3JpcHRzL2NvY2NpbmVsbGUvYXV0by1wcm9wYWdhdGVk
LWVycnAuY29jY2kNCj4gDQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3FhcGkvZXJyb3IuaCBiL2lu
Y2x1ZGUvcWFwaS9lcnJvci5oDQo+IGluZGV4IDUzMmI5YWZiOWUuLmRjZmI3N2UxMDcgMTAwNjQ0
DQo+IC0tLSBhL2luY2x1ZGUvcWFwaS9lcnJvci5oDQo+ICsrKyBiL2luY2x1ZGUvcWFwaS9lcnJv
ci5oDQo+IEBAIC0xNDEsNiArMTQxLDkgQEANCj4gICAgKiAgICAgICAgIC4uLg0KPiAgICAqICAg
ICB9DQo+ICAgICoNCj4gKyAqIEZvciBtYXNzIGNvbnZlcnNpb24gdXNlIHNjcmlwdA0KPiArICog
ICBzY3JpcHRzL2NvY2NpbmVsbGUvYXV0by1wcm9wYWdhdGVkLWVycnAuY29jY2kNCj4gKyAqDQo+
ICAgICoNCj4gICAgKiBSZWNlaXZlIGFuZCBhY2N1bXVsYXRlIG11bHRpcGxlIGVycm9ycyAoZmly
c3Qgb25lIHdpbnMpOg0KPiAgICAqICAgICBFcnJvciAqZXJyID0gTlVMTCwgKmxvY2FsX2VyciA9
IE5VTEw7DQo+IGRpZmYgLS1naXQgYS9zY3JpcHRzL2NvY2NpbmVsbGUvYXV0by1wcm9wYWdhdGVk
LWVycnAuY29jY2kgYi9zY3JpcHRzL2NvY2NpbmVsbGUvYXV0by1wcm9wYWdhdGVkLWVycnAuY29j
Y2kNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMC4uNmM3MmE1MDQ5
Zg0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL3NjcmlwdHMvY29jY2luZWxsZS9hdXRvLXByb3Bh
Z2F0ZWQtZXJycC5jb2NjaQ0KPiBAQCAtMCwwICsxLDEzOSBAQA0KPiArLy8gVXNlIEVSUlBfQVVU
T19QUk9QQUdBVEUgKHNlZSBpbmNsdWRlL3FhcGkvZXJyb3IuaCkNCj4gKy8vDQo+ICsvLyBDb3B5
cmlnaHQgKGMpIDIwMjAgVmlydHVvenpvIEludGVybmF0aW9uYWwgR21iSC4NCj4gKy8vDQo+ICsv
LyBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQg
YW5kL29yIG1vZGlmeQ0KPiArLy8gaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJh
bCBQdWJsaWMgTGljZW5zZSBhcyBwdWJsaXNoZWQgYnkNCj4gKy8vIHRoZSBGcmVlIFNvZnR3YXJl
IEZvdW5kYXRpb247IGVpdGhlciB2ZXJzaW9uIDIgb2YgdGhlIExpY2Vuc2UsIG9yDQo+ICsvLyAo
YXQgeW91ciBvcHRpb24pIGFueSBsYXRlciB2ZXJzaW9uLg0KPiArLy8NCj4gKy8vIFRoaXMgcHJv
Z3JhbSBpcyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsLA0K
PiArLy8gYnV0IFdJVEhPVVQgQU5ZIFdBUlJBTlRZOyB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQg
d2FycmFudHkgb2YNCj4gKy8vIE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJ
Q1VMQVIgUFVSUE9TRS4gIFNlZSB0aGUNCj4gKy8vIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNl
IGZvciBtb3JlIGRldGFpbHMuDQo+ICsvLw0KPiArLy8gWW91IHNob3VsZCBoYXZlIHJlY2VpdmVk
IGEgY29weSBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UNCj4gKy8vIGFsb25nIHdp
dGggdGhpcyBwcm9ncmFtLiAgSWYgbm90LCBzZWUgPGh0dHA6Ly93d3cuZ251Lm9yZy9saWNlbnNl
cy8+Lg0KPiArLy8NCj4gKy8vIFVzYWdlIGV4YW1wbGU6DQo+ICsvLyBzcGF0Y2ggLS1zcC1maWxl
IHNjcmlwdHMvY29jY2luZWxsZS9hdXRvLXByb3BhZ2F0ZWQtZXJycC5jb2NjaSBcDQo+ICsvLyAg
LS1tYWNyby1maWxlIHNjcmlwdHMvY29jY2ktbWFjcm8tZmlsZS5oIC0taW4tcGxhY2UgLS1uby1z
aG93LWRpZmYgXA0KPiArLy8gIGJsb2NrZGV2LW5iZC5jIHFlbXUtbmJkLmMge2Jsb2NrL25iZCos
bmJkLyosaW5jbHVkZS9ibG9jay9uYmQqfS5baGNdDQo+ICsNCj4gK0BADQo+ICsvLyBBZGQgaW52
b2NhdGlvbiB0byBlcnJwLWZ1bmN0aW9ucyB3aGVyZSBuZWNlc3NhcnkNCj4gKy8vIFdlIHNob3Vs
ZCBza2lwIGZ1bmN0aW9ucyB3aXRoICJFcnJvciAqY29uc3QgKmVycnAiDQo+ICsvLyBwYXJhbWV0
ZXIsIGJ1dCBob3cgdG8gZG8gaXQgd2l0aCBjb2NjaW5lbGxlPw0KPiArLy8gSSBkb24ndCBrbm93
LCBzbywgSSBza2lwIHRoZW0gYnkgZnVuY3Rpb24gbmFtZSByZWdleC4NCj4gKy8vIEl0J3Mgc2Fm
ZTogaWYgd2Ugbm90IHNraXAgc29tZSBmdW5jdGlvbnMgd2l0aA0KPiArLy8gIkVycm9yICpjb25z
dCAqZXJycCIsIEVSUlBfQVVUT19QUk9QQUdBVEUgaW52b2NhdGlvbg0KPiArLy8gd2lsbCBmYWls
IHRvIGNvbXBpbGUsIGJlY2F1c2Ugb2YgY29uc3QgdmlvbGF0aW9uLg0KPiAraWRlbnRpZmllciBm
biAhfiAiZXJyb3JfYXBwZW5kXy4qX2hpbnQiOw0KPiAraWRlbnRpZmllciBsb2NhbF9lcnIsIGVy
cnA7DQoNCkhtbS4NCg0KTm90ZSwgdGhhdCBpbiBuZXcgdmVyc2lvbiBJIGRlZmluZSBlcnJwIGFz
ICJpZGVudGlmaWVyIiwgd2hpY2ggbWVhbnMsDQp0aGF0IHdlJ2xsIG1hdGNoIEVycm9yICoqIHBh
cmFtZXRlcnMgd2l0aCBvdGhlciBuYW1lcy4uDQoNClN0aWxsLCBvdXIgRVJSUF9BVVRPX1BST1BB
R0FURSBhc3N1bWVzIHRoYXQgcGFyYW1ldGVyIGNhbGxlZCBlcnJwLCBhbmQNCkknZCBwcmVmZXJl
IG5vdCB0byBjaGFuZ2UgaXQuDQoNCldlIGNhbiBpZ25vcmUgdGhpcyBmYWN0IGZvciBub3c6IGlu
YXBwcm9wcmlhdGVseSBuYW1lZCBlcnJwIHBhcmFtZXRlciB3aWxsDQpicmVhayBjb21waWxhdGlv
biBpbiBFUlJQX0FVVE9fUFJPUEFHQVRFKCkgaW52b2NhdGlvbiwgc28gaXQncyBzYWZlIGVub3Vn
aC4NCihIb3BlLCB0aGVyZSBhcmUgbm8gZnVuY3Rpb25zIHdpdGggdHdvIEVycm9yKiogcGFyYW1l
dGVycykNCg0KT3Igd2UgY2FuIHJldmVydCBlcnJwIHRvIGJlIHN5bWJvbCBhZ2Fpbi4NCg0KPiAr
QEANCj4gKw0KPiArIGZuKC4uLiwgRXJyb3IgKiplcnJwLCAuLi4pDQo+ICsgew0KPiArKyAgIEVS
UlBfQVVUT19QUk9QQUdBVEUoKTsNCj4gKyAgICA8Ky4uLg0KPiArICAgICAgICB3aGVuICE9IEVS
UlBfQVVUT19QUk9QQUdBVEUoKTsNCj4gKygNCj4gKyAgICBlcnJvcl9hcHBlbmRfaGludChlcnJw
LCAuLi4pOw0KPiArfA0KPiArICAgIGVycm9yX3ByZXBlbmQoZXJycCwgLi4uKTsNCj4gK3wNCj4g
KyAgICBFcnJvciAqbG9jYWxfZXJyID0gTlVMTDsNCj4gKykNCj4gKyAgICAuLi4rPg0KPiArIH0N
Cj4gKw0KPiArQHJ1bGUxQA0KPiArLy8gV2UgZG8gbm90IGluaGVyaXQgZnJvbSBwcmV2aW91cyBy
dWxlLCBhcyB3ZSB3YW50IHRvIG1hdGNoDQo+ICsvLyBhbHNvIGZ1bmN0aW9ucywgd2hpY2ggYWxy
ZWFkeSBoYWQgRVJSUF9BVVRPX1BST1BBR0FURQ0KPiArLy8gaW52b2NhdGlvbi4NCj4gK2lkZW50
aWZpZXIgZm4gIX4gImVycm9yX2FwcGVuZF8uKl9oaW50IjsNCj4gK2lkZW50aWZpZXIgbG9jYWxf
ZXJyLCBlcnJwOw0KPiArQEANCj4gKw0KPiArIGZuKC4uLiwgRXJyb3IgKiplcnJwLCAuLi4pDQo+
ICsgew0KPiArICAgICA8Li4uDQo+ICstICAgIEVycm9yICpsb2NhbF9lcnIgPSBOVUxMOw0KPiAr
ICAgICAuLi4+DQo+ICsgfQ0KPiArDQo+ICtAQA0KPiArLy8gSGFuZGxlIHBhdHRlcm4gd2l0aCBn
b3RvLCBvdGhlcndpc2Ugd2UnbGwgZmluaXNoIHVwDQo+ICsvLyB3aXRoIGxhYmVscyBhdCBmdW5j
dGlvbiBlbmQgd2hpY2ggd2lsbCBub3QgY29tcGlsZS4NCj4gK2lkZW50aWZpZXIgcnVsZTEuZm4s
IHJ1bGUxLmxvY2FsX2VyciwgcnVsZTEuZXJycDsNCj4gK2lkZW50aWZpZXIgT1VUOw0KPiArQEAN
Cj4gKw0KPiArIGZuKC4uLikNCj4gKyB7DQo+ICsgICAgIDwuLi4NCj4gKy0gICAgZ290byBPVVQ7
DQo+ICsrICAgIHJldHVybjsNCj4gKyAgICAgLi4uPg0KPiArLSBPVVQ6DQo+ICstICAgIGVycm9y
X3Byb3BhZ2F0ZShlcnJwLCBsb2NhbF9lcnIpOw0KPiArIH0NCj4gKw0KPiArQEANCj4gK2lkZW50
aWZpZXIgcnVsZTEuZm4sIHJ1bGUxLmxvY2FsX2VyciwgcnVsZTEuZXJycDsNCj4gK2V4cHJlc3Np
b24gbGlzdCBhcmdzOyAvLyB0byByZWluZGVudCBlcnJvcl9wcm9wYWdhdGVfcHJlcGVuZA0KPiAr
QEANCj4gKw0KPiArIGZuKC4uLikNCj4gKyB7DQo+ICsgICAgIDwuLi4NCj4gKygNCj4gKy0gICAg
ZXJyb3JfZnJlZShsb2NhbF9lcnIpOw0KPiArLSAgICBsb2NhbF9lcnIgPSBOVUxMOw0KPiArKyAg
ICBlcnJvcl9mcmVlX2VycnAoZXJycCk7DQo+ICt8DQo+ICstICAgIGVycm9yX2ZyZWUobG9jYWxf
ZXJyKTsNCj4gKysgICAgZXJyb3JfZnJlZV9lcnJwKGVycnApOw0KPiArfA0KPiArLSAgICBlcnJv
cl9yZXBvcnRfZXJyKGxvY2FsX2Vycik7DQo+ICsrICAgIGVycm9yX3JlcG9ydF9lcnJwKGVycnAp
Ow0KPiArfA0KPiArLSAgICB3YXJuX3JlcG9ydF9lcnIobG9jYWxfZXJyKTsNCj4gKysgICAgd2Fy
bl9yZXBvcnRfZXJycChlcnJwKTsNCj4gK3wNCj4gKy0gICAgZXJyb3JfcHJvcGFnYXRlX3ByZXBl
bmQoZXJycCwgbG9jYWxfZXJyLCBhcmdzKTsNCj4gKysgICAgZXJyb3JfcHJlcGVuZChlcnJwLCBh
cmdzKTsNCj4gK3wNCj4gKy0gICAgZXJyb3JfcHJvcGFnYXRlKGVycnAsIGxvY2FsX2Vycik7DQo+
ICspDQo+ICsgICAgIC4uLj4NCj4gKyB9DQo+ICsNCj4gK0BADQo+ICtpZGVudGlmaWVyIHJ1bGUx
LmZuLCBydWxlMS5sb2NhbF9lcnIsIHJ1bGUxLmVycnA7DQo+ICtAQA0KPiArDQo+ICsgZm4oLi4u
KQ0KPiArIHsNCj4gKyAgICAgPC4uLg0KPiArKA0KPiArLSAgICAmbG9jYWxfZXJyDQo+ICsrICAg
IGVycnANCj4gK3wNCj4gKy0gICAgbG9jYWxfZXJyDQo+ICsrICAgICplcnJwDQo+ICspDQo+ICsg
ICAgIC4uLj4NCj4gKyB9DQo+ICsNCj4gK0BADQo+ICtpZGVudGlmaWVyIHJ1bGUxLmZuLCBydWxl
MS5lcnJwOw0KPiArQEANCj4gKw0KPiArIGZuKC4uLikNCj4gKyB7DQo+ICsgICAgIDwuLi4NCj4g
Ky0gKmVycnAgIT0gTlVMTA0KPiArKyAqZXJycA0KPiArICAgICAuLi4+DQo+ICsgfQ0KPiANCg0K
DQotLSANCkJlc3QgcmVnYXJkcywNClZsYWRpbWlyDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
