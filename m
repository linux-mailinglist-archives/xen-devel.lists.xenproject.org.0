Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 382D3138DCF
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2020 10:29:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iqvyp-00018l-OE; Mon, 13 Jan 2020 09:25:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ljre=3C=virtuozzo.com=vsementsov@srs-us1.protection.inumbo.net>)
 id 1iqvyn-00018g-78
 for xen-devel@lists.xenproject.org; Mon, 13 Jan 2020 09:25:49 +0000
X-Inumbo-ID: a8e7cc04-35e6-11ea-a985-bc764e2007e4
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.133]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a8e7cc04-35e6-11ea-a985-bc764e2007e4;
 Mon, 13 Jan 2020 09:25:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n4sjrPIdei3FyMoPA+bBVmPXKk10h1mTEV7sgrrX8B5J7ym5bNuDS2wbnTzRGeLmCu0S5JijJSajfB6L1EJCQcnoMy2usPx6YSPF4H3d1F28gAs7AYgd5MvGUH6bFPKIDfxmAjXYIEcONT+c8NAQjdAKNNfyLfCQAbNWN6RX7atE3Y13hr2hrXOuanxGcXMVz49E9FKeAEycNlelT5wcDOb7HgHvLrLeANjGCg3GB7af8Evc+M5voakPSpER1Mcbaz0jLnMDV2VjR/xCDbiMoVWM25cp+58d+f06RETAxrZPrZR0o1N4m8+Ijq926B0GHejklnr1lHYgKd4g+hVKtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BbzY4gvzUbPHPBLORohLPBV5D0PEI6+b7bEhYVwZRdE=;
 b=K/G7JT9LV7r1Dw/gqabhk6+wZz0OxVPNbZySj8+K9QBUCm/QP/veGmWRKcwJncoZ50f6rNbLmkb7GFEW9/Q9247QGVMoPlhzCxrMdO05BHLNTGOfVabVefknzq1yB4QkztGd2VwgAwMvJeWrWyVw4XCxoElQy4V2Ilcnl9OrLCgbTaHHA+SlgXBGOyhXQAvaGyNAS0aCv+XnleniE6bUZbVtFhfyH+AX8Qwi52/5/ATWc50Qf6kRalm+Wlfttu0c2jEkDT/HjOdTMZqgIdD2L14yoQos0y3pCvBGl+MbgatJqgTIhm/iucbtkgzeTb/qHZl5ZCs+ER5m422UDIwvGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BbzY4gvzUbPHPBLORohLPBV5D0PEI6+b7bEhYVwZRdE=;
 b=c7HRECwb4wCqed7g9Vyb3MFaUvxsu/NWulYhJbeS+4+nRAY0ZGyCxTzm3dRvDLKYvT7H7GZw4uDtpWww6x3uMSwSv88zNEmFKXdnEaBU8ZZoi7LIpr3BZ7l/8pQezhbiJSwycE8tojw0cw4K4m4NzPZOONE9+1ncPFCbnhrEJ2A=
Received: from AM6PR08MB4423.eurprd08.prod.outlook.com (20.179.7.140) by
 AM6PR08MB2984.eurprd08.prod.outlook.com (52.135.168.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.10; Mon, 13 Jan 2020 09:25:36 +0000
Received: from AM6PR08MB4423.eurprd08.prod.outlook.com
 ([fe80::11a9:a944:c946:3030]) by AM6PR08MB4423.eurprd08.prod.outlook.com
 ([fe80::11a9:a944:c946:3030%7]) with mapi id 15.20.2623.015; Mon, 13 Jan 2020
 09:25:36 +0000
Received: from [172.16.24.200] (185.231.240.5) by
 HE1PR05CA0242.eurprd05.prod.outlook.com (2603:10a6:3:fb::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.9 via Frontend Transport; Mon, 13 Jan 2020 09:25:35 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Paul Durrant <pdurrant@gmail.com>
Thread-Topic: [PATCH v6 02/11] error: auto propagated local_err
Thread-Index: AQHVx+4Rt2lsJ4uM40eLuOqM7f0+qKfoTRGAgAAJ4oA=
Date: Mon, 13 Jan 2020 09:25:36 +0000
Message-ID: <0951e0af-b0f0-6631-8352-71b1f7e4539a@virtuozzo.com>
References: <20200110194158.14190-1-vsementsov@virtuozzo.com>
 <20200110194158.14190-3-vsementsov@virtuozzo.com>
 <CACCGGhD+v3cPdrU0ZCctO3SCpN7yHJcd9=J6AwTrrYWZdHrTZA@mail.gmail.com>
In-Reply-To: <CACCGGhD+v3cPdrU0ZCctO3SCpN7yHJcd9=J6AwTrrYWZdHrTZA@mail.gmail.com>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR05CA0242.eurprd05.prod.outlook.com
 (2603:10a6:3:fb::18) To AM6PR08MB4423.eurprd08.prod.outlook.com
 (2603:10a6:20b:bf::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vsementsov@virtuozzo.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20200113122533121
x-originating-ip: [185.231.240.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 94109d84-0f0a-4475-ebe7-08d7980a8c10
x-ms-traffictypediagnostic: AM6PR08MB2984:
x-microsoft-antispam-prvs: <AM6PR08MB29841CE77CFC9A65078FE06FC1350@AM6PR08MB2984.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 028166BF91
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(346002)(136003)(366004)(396003)(39840400004)(189003)(199004)(956004)(2906002)(2616005)(86362001)(316002)(16576012)(6486002)(54906003)(4326008)(6916009)(31696002)(52116002)(5660300002)(16526019)(186003)(31686004)(8676002)(26005)(478600001)(8936002)(81156014)(81166006)(71200400001)(36756003)(66476007)(66946007)(66556008)(64756008)(7416002)(66446008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR08MB2984;
 H:AM6PR08MB4423.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: virtuozzo.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nyvo74reilrHG4NNY3NTNYncDMiKkElronZzT0fK3ec4od8/jGvRdeYNWJ15aq04qGknn5X58neIQR9hcfkxf70RlBbBWCfjgzC9hHseAIytUj98wqlOa5mGuH4mVTzhAxJwT8//LKf2tIccZlFx+QYSBn0VvSuvq8qFytoxMnrV64iyiheWDZ0yMt+cYFptFRkE89XOQzDH9Qye0wkbGNJI7No+UT9wvc+06JyahjMvAkcqtq2qqKj2xogNZmMN26sJqmcifDPBFSLt2DSJ6bRa+7UGvaxvGjEVT9vJzInsEY377xBP5xYadOuIUBGImn4g+wLmDz+NuQZkuuT+qVXwzfvoW3WihV0BtaMbFzrAcmq1h2BslFtWB74ntLtj5hqrmhvtT/zNf3LxWoaVAAle5aPAybdpMHD4xgifB1IgE7BgRpqFcv9kgRqz4qQG
x-ms-exchange-transport-forked: True
Content-ID: <E21A3BFE6C332E42904491FDBEA8F741@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94109d84-0f0a-4475-ebe7-08d7980a8c10
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2020 09:25:36.4807 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jwShqbSAedY+Y1Lz/KyhhKws07/nsoTpPSh9UabRqM7/LxY9Lr+tBHJRBfSfCGjQ+fcJQ9eSTFbM39+w9KZa08RL1CcYW7THBRYymvcl8CE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB2984
Subject: Re: [Xen-devel] [PATCH v6 02/11] error: auto propagated local_err
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
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Greg Kurz <groug@kaod.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Max Reitz <mreitz@redhat.com>,
 Eric Blake <eblake@redhat.com>, Michael Roth <mdroth@linux.vnet.ibm.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

MTMuMDEuMjAyMCAxMTo1MCwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiBPbiBGcmksIDEwIEphbiAy
MDIwIGF0IDE5OjQyLCBWbGFkaW1pciBTZW1lbnRzb3YtT2dpZXZza2l5DQo+IDx2c2VtZW50c292
QHZpcnR1b3p6by5jb20+IHdyb3RlOg0KPiBbc25pcF0NCj4+ICsvKg0KPj4gKyAqIEVSUlBfQVVU
T19QUk9QQUdBVEUNCj4+ICsgKg0KPj4gKyAqIFRoaXMgbWFjcm8gaXMgY3JlYXRlZCB0byBiZSB0
aGUgZmlyc3QgbGluZSBvZiBhIGZ1bmN0aW9uIHdoaWNoIHVzZQ0KPj4gKyAqIEVycm9yICoqZXJy
cCBwYXJhbWV0ZXIgdG8gcmVwb3J0IGVycm9yLiBJdCdzIG5lZWRlZCBvbmx5IGluIGNhc2VzIHdo
ZXJlIHdlDQo+PiArICogd2FudCB0byB1c2UgZXJyb3JfcHJlcGVuZCwgZXJyb3JfYXBwZW5kX2hp
bnQgb3IgZGVyZWZlcmVuY2UgKmVycnAuIEl0J3MNCj4+ICsgKiBzdGlsbCBzYWZlIChidXQgdXNl
bGVzcykgaW4gb3RoZXIgY2FzZXMuDQo+PiArICoNCj4+ICsgKiBJZiBlcnJwIGlzIE5VTEwgb3Ig
cG9pbnRzIHRvIGVycm9yX2ZhdGFsLCBpdCBpcyByZXdyaXR0ZW4gdG8gcG9pbnQgdG8gYQ0KPj4g
KyAqIGxvY2FsIEVycm9yIG9iamVjdCwgd2hpY2ggd2lsbCBiZSBhdXRvbWF0aWNhbGx5IHByb3Bh
Z2F0ZWQgdG8gdGhlIG9yaWdpbmFsDQo+PiArICogZXJycCBvbiBmdW5jdGlvbiBleGl0IChzZWUg
ZXJyb3JfcHJvcGFnYXRvcl9jbGVhbnVwKS4NCj4+ICsgKg0KPj4gKyAqIEFmdGVyIGludm9jYXRp
b24gb2YgdGhpcyBtYWNybyBpdCBpcyBhbHdheXMgc2FmZSB0byBkZXJlZmVyZW5jZSBlcnJwDQo+
PiArICogKGFzIGl0J3Mgbm90IE5VTEwgYW55bW9yZSkgYW5kIHRvIGFkZCBpbmZvcm1hdGlvbiAo
YnkgZXJyb3JfcHJlcGVuZCBvcg0KPj4gKyAqIGVycm9yX2FwcGVuZF9oaW50KQ0KPj4gKyAqIChh
cywgaWYgaXQgd2FzIGVycm9yX2ZhdGFsLCB3ZSBzd2FwcGVkIGl0IHdpdGggYSBsb2NhbF9lcnJv
ciB0byBiZQ0KPj4gKyAqIHByb3BhZ2F0ZWQgb24gY2xlYW51cCkuDQo+PiArICoNCj4+ICsgKiBO
b3RlOiB3ZSBkb24ndCB3cmFwIHRoZSBlcnJvcl9hYm9ydCBjYXNlLCBhcyB3ZSB3YW50IHJlc3Vs
dGluZyBjb3JlZHVtcA0KPj4gKyAqIHRvIHBvaW50IHRvIHRoZSBwbGFjZSB3aGVyZSB0aGUgZXJy
b3IgaGFwcGVuZWQsIG5vdCB0byBlcnJvcl9wcm9wYWdhdGUuDQo+PiArICovDQo+PiArI2RlZmlu
ZSBFUlJQX0FVVE9fUFJPUEFHQVRFKCkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
XA0KPj4gKyAgICBnX2F1dG8oRXJyb3JQcm9wYWdhdG9yKSBfYXV0b19lcnJwX3Byb3AgPSB7LmVy
cnAgPSBlcnJwfTsgIFwNCj4+ICsgICAgZXJycCA9ICgoZXJycCA9PSBOVUxMIHx8ICplcnJwID09
IGVycm9yX2ZhdGFsKSAgICAgICAgICAgICBcDQo+IA0KPiBQZXJoYXBzICFlcnJwIHJhdGhlciB0
aGFuIGVycnAgPT0gTlVMTCwgZm9yIGJyZXZpdHkuDQo+IA0KDQpJIG1vc3RseSBwcmVmZXIgIXB0
ciBub3RhdGlvbi4uIEJ1dCBtYXkgYmUgaGVyZSwgSSdkIGtlZXAgaXQgYXMgaXMsDQp0byBzdHJl
c3Mgc3BlY2lhbC1jYXNpbmcgTlVMTCBpbiB0aGlzIG5vbi10cml2aWFsIHBsYWNlLi4gQW5kIGl0
IGlzIGluIGdvb2QNCnJlbGF0aW9uIHdpdGggcGhyYXNpbmcgIklmIGVycnAgaXMgTlVMTCBvciBw
b2ludHMgdG8gZXJyb3JfZmF0YWwiLg0KQnV0ICFlcnJwIGlzIE9LIGZvciBtZSB0by4gTGV0IGl0
IGJlIGFzIE1hcmt1cyBwcmVmZXIsIGhlIGlzIG1haW50YWluZXIuDQoNCj4gDQo+PiArICAgICAg
ICAgICAgPyAmX2F1dG9fZXJycF9wcm9wLmxvY2FsX2VyciA6IGVycnApDQo+PiArDQo+PiAgIC8q
DQo+PiAgICAqIFNwZWNpYWwgZXJyb3IgZGVzdGluYXRpb24gdG8gYWJvcnQgb24gZXJyb3IuDQo+
PiAgICAqIFNlZSBlcnJvcl9zZXRnKCkgYW5kIGVycm9yX3Byb3BhZ2F0ZSgpIGZvciBkZXRhaWxz
Lg0KPj4gLS0NCj4+IDIuMjEuMA0KPj4NCg0KDQotLSANCkJlc3QgcmVnYXJkcywNClZsYWRpbWly
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
