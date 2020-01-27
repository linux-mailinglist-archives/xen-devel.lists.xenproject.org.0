Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E96C14A141
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 10:57:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iw15f-0001Tk-3m; Mon, 27 Jan 2020 09:53:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8kIj=3Q=epam.com=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1iw15d-0001Tf-H2
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2020 09:53:53 +0000
X-Inumbo-ID: e7b4173a-40ea-11ea-9fd7-bc764e2007e4
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.0.50]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e7b4173a-40ea-11ea-9fd7-bc764e2007e4;
 Mon, 27 Jan 2020 09:53:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bwk4V4k0QnwfP24QhoAkPppRKha/XM8rWFt/qqjr2avYWaBQCWjK5jwSG1ENbfFdkGRSju+FXV2FcNJJUL+kqT5ycaaB4JdpVBIxYhqZwnW4f2UwV4bB/LDvYEYQH92041DwlL306f71yNfLNV0Ww/TYB6v6kvc5icrNBIGg0uu3Ag45LiUc04vHyLGB4R7kEspAiarZ4gGmerkfbD6S5CLW+OUo2hsioeQbl7c0rB5ExXY3675cwBrJfGlg7srJW/YSYdEZpyf6MYP6vMz9hBQYbilG/po9KcFdWpWTrFp4cm2qVCxv4dT+BVFthnHkvrXsZ/KURat3f+6evR2BQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CMaM88l1fKCgcP4KVh6PjyYClz8fp+jtBabRhkdUgKU=;
 b=VvWupL8BzsjdgsAM4TnUCYAhFUdhDQ5Tfd4/gJnVPL9GME6J30LehOakz0iXhL+OoC82eo4Ln0K+GtHK/FqUT9Gl1AOKIIfP+QnMjBGNOqiFv3Zllng3iKx7c+InTxuU5pXJ7bNTqxh1h7KS5CNgehM8XofsrtTux8aLI9jHdrhVMwxlnfaBsSvWLB9hKZ70yYPXk/JxmFoEGYzUEqcEBziH4Ec4FEardOVlRrWTkY+oVrDFyUHNgnDwO0cYttq16ad/MfsiqWqDEY0sA3JCQYCb53dqodIc7DmyILfHH8yhsDDHl5wfVnlWhJHacRu6VnnOu7HzckbHPSRYGBEVUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CMaM88l1fKCgcP4KVh6PjyYClz8fp+jtBabRhkdUgKU=;
 b=J3mUbHO6RNgi0IgdkRJswGqwGDfbtv71rZvvnQaXGnfPlWnZRWj/YXckugSL497YaT3+BRq6jpgVzPMMWU7lo7gBEAkiClVZ5L7WfjJpfq/5XKG+miVVvM2uhSWvl0lZaU79YjojwUPFQrVmC9LnlIiJxQvqZv0niuqOg2DRrWU=
Received: from AM0PR03MB4516.eurprd03.prod.outlook.com (20.177.41.82) by
 AM0PR03MB3827.eurprd03.prod.outlook.com (52.135.147.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.23; Mon, 27 Jan 2020 09:53:43 +0000
Received: from AM0PR03MB4516.eurprd03.prod.outlook.com
 ([fe80::a489:598f:51af:6d59]) by AM0PR03MB4516.eurprd03.prod.outlook.com
 ([fe80::a489:598f:51af:6d59%4]) with mapi id 15.20.2665.017; Mon, 27 Jan 2020
 09:53:43 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "airlied@linux.ie"
 <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>, "kraxel@redhat.com"
 <kraxel@redhat.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "david@lechnology.com" <david@lechnology.com>, "noralf@tronnes.org"
 <noralf@tronnes.org>, "sean@poorly.run" <sean@poorly.run>, "sam@ravnborg.org"
 <sam@ravnborg.org>, "laurent.pinchart@ideasonboard.com"
 <laurent.pinchart@ideasonboard.com>, "emil.velikov@collabora.com"
 <emil.velikov@collabora.com>
Thread-Topic: [PATCH v4 15/15] drm/xen: Explicitly disable automatic sending
 of vblank event
Thread-Index: AQHV0c6CEXRqkijnAkKuyerYilRMX6f+S7MA
Date: Mon, 27 Jan 2020 09:53:43 +0000
Message-ID: <74d7bb19-642f-49da-8198-56ea0c0d1a4a@epam.com>
References: <20200123092123.28368-1-tzimmermann@suse.de>
 <20200123092123.28368-16-tzimmermann@suse.de>
In-Reply-To: <20200123092123.28368-16-tzimmermann@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Oleksandr_Andrushchenko@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e148bfd0-b20c-4eee-bc94-08d7a30ecb4a
x-ms-traffictypediagnostic: AM0PR03MB3827:
x-microsoft-antispam-prvs: <AM0PR03MB3827160464941549062B9804E70B0@AM0PR03MB3827.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 02951C14DC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(346002)(136003)(376002)(39860400002)(199004)(189003)(54906003)(316002)(110136005)(4326008)(478600001)(31686004)(2906002)(76116006)(81156014)(81166006)(36756003)(55236004)(8676002)(66556008)(66946007)(5660300002)(8936002)(6486002)(6512007)(7416002)(66476007)(91956017)(64756008)(66446008)(53546011)(2616005)(31696002)(71200400001)(26005)(86362001)(6506007)(186003)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB3827;
 H:AM0PR03MB4516.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BXB09I8fu/Pc5fZk7AUPTERGzJoMZI04wXyOl4fLQX6qDU+FpokgAs8N7FSDfx3BFSvTHsXUCGg95p3WkuiS9eg6cF14DrZRuZ7YOTx9x+fMPFyuulFaxPMpflOjufhXrlj/kLu0yTcTaqeehvAb96xjF0OAi+2NzA5CQ5qpV+0QjDrbvnsydahMC36nseVqIhkUE4DOez+5fx+Go1MQ7vy8uOeFyjobnP8h7KcXNFLPZOyAGszy3T76Ob7qCideTP6d0pNXuJGaH1d1CfoCwkaVjZQx3Hzz/q073xCnu9750GCggdJsk6FwjlmA73QHpzxBBd6wRfzjqhOrl8kIVOSjMpyrZro48nY42XvUZUSbWluNrEeN76kH+nloEXRPLVN7oJeslMWZSc/dI8hyQYd9b/tC1OHk6xgPEYu/PrRN3ohbEhEC8yt8Bq9OdPpx39wKmoZvWdX8dGRujjApgyPtjmkm9/YD7q6JtndN4+yluMSazKU01gB7HLwe1fVm
x-ms-exchange-antispam-messagedata: obn98Z8N/EamtIxcCU1ypn52g4CvCYWjWc8mN7BI7D3t4P+kDIhbDlA1Jy/vB4oEqccQ4b0wFjKN6N2bWM6/ghOKg1tUmRjHLLBab1VCIY8by2Zt4tJWqi8ZrsJlPs1B2balHIHUR75qi7+2SMKVEQ==
x-ms-exchange-transport-forked: True
Content-ID: <84886D4E7E176148849DECB160B2BB3C@eurprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e148bfd0-b20c-4eee-bc94-08d7a30ecb4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2020 09:53:43.1117 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a7STOcv+PmjU2+iZZwuS5bCAQPlq7fliZw58vZJ468YfnoQ4RH1SFnNlZdEPQVdAGhyEKcIECUcK60z05Vg5eZozqig2hAasKxYxxuX8aYBt2I/W5fgvNHZ/zEXbHzXs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB3827
Subject: Re: [Xen-devel] [PATCH v4 15/15] drm/xen: Explicitly disable
 automatic sending of vblank event
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U29ycnkgZm9yIGp1bXBpbmcgaW4gbGF0ZQ0KDQpPbiAxLzIzLzIwIDExOjIxIEFNLCBUaG9tYXMg
WmltbWVybWFubiB3cm90ZToNCj4gVGhlIGF0b21pYyBoZWxwZXJzIGF1dG9tYXRpY2FsbHkgc2Vu
ZCBvdXQgZmFrZSBWQkxBTksgZXZlbnRzIGlmIG5vDQo+IHZibGFua2luZyBoYXMgYmVlbiBpbml0
aWFsaXplZC4gVGhpcyB3b3VsZCBhcHBseSB0byB4ZW4sIGJ1dCB4ZW4gaGFzDQo+IGl0cyBvd24g
dmJsYW5rIGxvZ2ljLiBUbyBhdm9pZCBpbnRlcmZlcmluZyB3aXRoIHRoZSBhdG9taWMgaGVscGVy
cywNCj4gZGlzYWJsZSBhdXRvbWF0aWMgdmJsYW5rIGV2ZW50cyBleHBsaWN0bHkuDQo+DQo+IHY0
Og0KPiAJKiBzZXBhcmF0ZSBjb21taXQgZnJvbSBjb3JlIHZibGFuayBjaGFuZ2VzDQo+DQo+IFNp
Z25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPiBB
Y2tlZC1ieTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+DQpSZXZpZXdlZC1ieTog
T2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29t
Pg0KDQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udF9rbXMuYyB8
IDEzICsrKysrKysrKysrKysNCj4gICAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKQ0K
Pg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250X2ttcy5j
IGIvZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250X2ttcy5jDQo+IGluZGV4IDRmMzRj
NTIwODE4MC4uZWZkZTQ1NjE4MzZmIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGVu
L3hlbl9kcm1fZnJvbnRfa21zLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJt
X2Zyb250X2ttcy5jDQo+IEBAIC0yMjAsNiArMjIwLDE4IEBAIHN0YXRpYyBib29sIGRpc3BsYXlf
c2VuZF9wYWdlX2ZsaXAoc3RydWN0IGRybV9zaW1wbGVfZGlzcGxheV9waXBlICpwaXBlLA0KPiAg
IAlyZXR1cm4gZmFsc2U7DQo+ICAgfQ0KPiAgIA0KPiArc3RhdGljIGludCBkaXNwbGF5X2NoZWNr
KHN0cnVjdCBkcm1fc2ltcGxlX2Rpc3BsYXlfcGlwZSAqcGlwZSwNCj4gKwkJCSBzdHJ1Y3QgZHJt
X3BsYW5lX3N0YXRlICpwbGFuZV9zdGF0ZSwNCj4gKwkJCSBzdHJ1Y3QgZHJtX2NydGNfc3RhdGUg
KmNydGNfc3RhdGUpDQo+ICt7DQo+ICsJLyogTWFrZSBzdXJlIHRoYXQgRFJNIGhlbHBlcnMgZG9u
J3Qgc2VuZCBWQkxBTksgZXZlbnRzDQpDb3VsZCB5b3UgcGxlYXNlIHB1dCB0aGUgY29tbWVudCBv
biBhIHNlcGFyYXRlIGxpbmU/DQo+ICsJICogYXV0b21hdGljYWxseS4gWGVuIGhhcyBpdCdzIG93
biBsb2dpYyB0byBkbyBzby4NCj4gKwkgKi8NCj4gKwljcnRjX3N0YXRlLT5ub192YmxhbmsgPSBm
YWxzZTsNCkFuZCBpdCBpcyBzdGlsbCBjb25mdXNpbmcsIGUuZy4gY29tbWVudCBzYXlzDQoiTWFr
ZSBzdXJlIHRoYXQgRFJNIGhlbHBlcnMgZG9uJ3Qgc2VuZCBWQkxBTksiDQphbmQgd2Ugc2V0ICJu
b192YmxhbmsiIGZsYWcgdG8gZmFsc2UuLi4NCj4gKw0KPiArCXJldHVybiAwOw0KPiArfQ0KPiAr
DQo+ICAgc3RhdGljIHZvaWQgZGlzcGxheV91cGRhdGUoc3RydWN0IGRybV9zaW1wbGVfZGlzcGxh
eV9waXBlICpwaXBlLA0KPiAgIAkJCSAgIHN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgKm9sZF9wbGFu
ZV9zdGF0ZSkNCj4gICB7DQo+IEBAIC0yODQsNiArMjk2LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCBkcm1fc2ltcGxlX2Rpc3BsYXlfcGlwZV9mdW5jcyBkaXNwbGF5X2Z1bmNzID0gew0KPiAgIAku
ZW5hYmxlID0gZGlzcGxheV9lbmFibGUsDQo+ICAgCS5kaXNhYmxlID0gZGlzcGxheV9kaXNhYmxl
LA0KPiAgIAkucHJlcGFyZV9mYiA9IGRybV9nZW1fZmJfc2ltcGxlX2Rpc3BsYXlfcGlwZV9wcmVw
YXJlX2ZiLA0KPiArCS5jaGVjayA9IGRpc3BsYXlfY2hlY2ssDQo+ICAgCS51cGRhdGUgPSBkaXNw
bGF5X3VwZGF0ZSwNCj4gICB9Ow0KPiAgIA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
