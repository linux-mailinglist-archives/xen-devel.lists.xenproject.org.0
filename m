Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B35FDB7B
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 11:36:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVYuv-00033D-Gx; Fri, 15 Nov 2019 10:33:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FSad=ZH=epam.com=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1iVYut-000338-QG
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 10:33:28 +0000
X-Inumbo-ID: 5afc07f2-0793-11ea-9631-bc764e2007e4
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0e::606])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5afc07f2-0793-11ea-9631-bc764e2007e4;
 Fri, 15 Nov 2019 10:33:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A6Z18BRz1KAje0tdUoYULQnp9QqztilSrU7cZ57G143B2cONRLqsE8MksykkFGm3ITqHp5dBzCeUafMQEEz0yQ3ZdKyk9d0X5yttNWwY83Zh1yW/vMTy+Cuk5ZIeoJZuC+VynHla65HoqSZgkhvjoo2oar1Q5OLofGYWRjtSVaiz9XzC5faxlwxM2A2p4jYaenCl2uBBdq6YSd9TtopOqVwMNxbZJVCa2OW3ojJZFpPhyzpEDpDK57rOfRZIcWODZLeXBNDGu5STC0TshTKk6/cAeS68ZvHvExlmy37Q4DGUDnYW+KpP84YAnS6L5vU6yh7VPz5OWSCPLfFC4UtA7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ybCY7oHapiVMvASTAAxLGFJfDGMHPFlo3BBq954xbDA=;
 b=Ztp/eUN9PfMbPr7KBhNqxZXFWO8b8FFUeuaXkuXGuSnedHBLJlPyfMGxCLdL7U90NiLe+SAnM3CwZrpdw2Syyf097VhVKw1AFIEsS42wVwb9p/z54uxj0IOMPkuvKw/EliMjxIcXz7ggyn944uDiA03I2MtWBqMXSArc1koQdm0KuR4aVJo2qn6gT71Z8ky0rxh3W2dxwqf9e+/dJitWj2dzZ3cHCh+w/fHIAm50A8IECdyRmNF7K4aYstZO15a0hmwk8bSkgRO+G86U1ffb58GgcnydnoejmLAn/pmReppUW1pEQhD3dcoLivvEzQW9dnU35ue2M6ad9H6IjWXyyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ybCY7oHapiVMvASTAAxLGFJfDGMHPFlo3BBq954xbDA=;
 b=qswlF4uJQCLAHgxl9QfKtnpMPGadwGMrgTBDForOqrMs+eHMwK1Giu2J4Mk4sa8kYWloCcbqlxBxpWNsIe/PN2Z0XnQ5Mou+ghRBH03DysNV7taO3PLxgclZpkRCR9NxLiGzEeIZ3cmcdwqsqfguF93xJPOlTgPrm/d+t7REuZA=
Received: from AM6PR03MB5958.eurprd03.prod.outlook.com (10.255.122.93) by
 AM6PR03MB3544.eurprd03.prod.outlook.com (52.134.114.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.20; Fri, 15 Nov 2019 10:33:24 +0000
Received: from AM6PR03MB5958.eurprd03.prod.outlook.com
 ([fe80::b9b5:1dc6:f34f:a290]) by AM6PR03MB5958.eurprd03.prod.outlook.com
 ([fe80::b9b5:1dc6:f34f:a290%5]) with mapi id 15.20.2430.028; Fri, 15 Nov 2019
 10:33:24 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development
 <dri-devel@lists.freedesktop.org>
Thread-Topic: [PATCH 6/8] drm/xen: Simplify fb_create
Thread-Index: AQHVm5YWDOtNCFfLp0y2mm7AksoDXqeMCQqA
Date: Fri, 15 Nov 2019 10:33:24 +0000
Message-ID: <4042b233-c219-5e72-adfd-8108b13e9a71@epam.com>
References: <20191115092120.4445-1-daniel.vetter@ffwll.ch>
 <20191115092120.4445-7-daniel.vetter@ffwll.ch>
In-Reply-To: <20191115092120.4445-7-daniel.vetter@ffwll.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Oleksandr_Andrushchenko@epam.com; 
x-originating-ip: [176.36.245.220]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7f579d2f-3de3-4ea3-8e5b-08d769b73e8f
x-ms-traffictypediagnostic: AM6PR03MB3544:
x-microsoft-antispam-prvs: <AM6PR03MB3544DF6C7DC3D57E71A5D043E7700@AM6PR03MB3544.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 02229A4115
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(39860400002)(396003)(376002)(136003)(189003)(199004)(11346002)(446003)(486006)(2616005)(81166006)(2906002)(8676002)(476003)(186003)(6506007)(478600001)(305945005)(76176011)(53546011)(14454004)(102836004)(55236004)(26005)(7736002)(110136005)(31696002)(25786009)(36756003)(81156014)(5660300002)(316002)(99286004)(66476007)(64756008)(229853002)(80792005)(66446008)(66556008)(5024004)(256004)(14444005)(66946007)(8936002)(3846002)(6116002)(71200400001)(6436002)(71190400001)(76116006)(6486002)(91956017)(6512007)(66066001)(31686004)(54906003)(6246003)(86362001)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR03MB3544;
 H:AM6PR03MB5958.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: H1nU9GEkrHkaF0+B0tCBzuugStQF1lD11PHf4W3OIOKTYM7WBYxx6z8LVqKd7yDrkF4iifthrITNFX0Yn5bSoF+T3aiiBJctbEW/OwVNpY8/wTAAW5uwdALDy+tKo8X1cU+sE/QjMW8ev+D/d3ptvFw2s7C0jmZXd8CC4TUWVQ9SQT6aCqWAmQP1W1n09zbddUhHA6oCZi/tYjpOr72uM4puIZopZm7ZJvcTqNO5tDQ1Jzc7siac9e+6hfEXEFlsESL7D1jx3iIVFuZRvbuhRLQzdh4c1kP7z9Ywh1hgkO1vc6nFn/mp+8oINz3ytprOCgcHiO5pOk23QIzxhUSFRsRF2OWTalYhqp2Vom9RExa1rykwR2oDYTa/FZ216G3k9/8m+ov9RUTqD7Q/KTiV45J3UpKhN8dw/GKV0HUMjou/7IWs7loXb0+WQ+bl+wlW
x-ms-exchange-transport-forked: True
Content-ID: <61C1A4140FF3CD43B772A27A4B105511@eurprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f579d2f-3de3-4ea3-8e5b-08d769b73e8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2019 10:33:24.3932 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jGXnbzB6nMnPBpuh3I9XwOkDmfUpB5tsHILsA4FgOTlDneitparInaPQ/nG+xB+rftH7tdzYjyGgL8ndaXgJc5q4y3CK/i2q7q52JA2OvAjUtjN/DrWdiGhdsSbIk2ob
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB3544
Subject: Re: [Xen-devel] [PATCH 6/8] drm/xen: Simplify fb_create
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEvMTUvMTkgMTE6MjEgQU0sIERhbmllbCBWZXR0ZXIgd3JvdGU6DQo+IFRoZSBjdXJyZW50
IGNvZGUgaXMgYSBwcmV0dHkgZ29vZCB3dGYgbW9tZW50LCBzaW5jZSB3ZSBkcm9wIHRoZQ0KPiBy
ZWZlcmVuY2UgYmVmb3JlIHdlIHVzZSBpdC4gSXQncyBub3QgYSBiaWcgZGVhbCwgYmVjYXVzZSBh
KSB3ZSBvbmx5DQo+IHVzZSB0aGUgcG9pbnRlciwgc28gZG9lc24ndCBibG93IHVwIGFuZCB0aGUg
cmVhbCByZWFzb24gYikgZmItPm9ialswXQ0KPiBhbHJlYWR5IGhvbGRzIGEgZnVsbCByZWZlcmVu
Y2UgZm9yIHVzLg0KPg0KPiBNaWdodCBhcyB3ZWxsIHRha2UgdGhlIHJlYWwgcG9pbnRlciBpbnMn
dCBvZiBjb21wbGljYXRlZCBnYW1lcyB0aGF0DQo+IGJhZmZsZS4NCj4NCj4gU2lnbmVkLW9mZi1i
eTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+DQo+IENjOiBPbGVrc2Fu
ZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+IENj
OiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNClJldmlld2VkLWJ5OiBPbGVrc2FuZHIg
QW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+IC0tLQ0K
PiAgIGRyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udF9rbXMuYyB8IDkgKy0tLS0tLS0t
DQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA4IGRlbGV0aW9ucygtKQ0KPg0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250X2ttcy5jIGIv
ZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250X2ttcy5jDQo+IGluZGV4IGZmNTA2YmM5
OTQxNC4uNGYzNGM1MjA4MTgwIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGVuL3hl
bl9kcm1fZnJvbnRfa21zLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zy
b250X2ttcy5jDQo+IEBAIC02MywxNCArNjMsNyBAQCBmYl9jcmVhdGUoc3RydWN0IGRybV9kZXZp
Y2UgKmRldiwgc3RydWN0IGRybV9maWxlICpmaWxwLA0KPiAgIAlpZiAoSVNfRVJSX09SX05VTEwo
ZmIpKQ0KPiAgIAkJcmV0dXJuIGZiOw0KPiAgIA0KPiAtCWdlbV9vYmogPSBkcm1fZ2VtX29iamVj
dF9sb29rdXAoZmlscCwgbW9kZV9jbWQtPmhhbmRsZXNbMF0pOw0KPiAtCWlmICghZ2VtX29iaikg
ew0KPiAtCQlEUk1fRVJST1IoIkZhaWxlZCB0byBsb29rdXAgR0VNIG9iamVjdFxuIik7DQo+IC0J
CXJldCA9IC1FTk9FTlQ7DQo+IC0JCWdvdG8gZmFpbDsNCj4gLQl9DQo+IC0NCj4gLQlkcm1fZ2Vt
X29iamVjdF9wdXRfdW5sb2NrZWQoZ2VtX29iaik7DQo+ICsJZ2VtX29iaiA9IGZiLT5vYmpbMF07
DQo+ICAgDQo+ICAgCXJldCA9IHhlbl9kcm1fZnJvbnRfZmJfYXR0YWNoKGRybV9pbmZvLT5mcm9u
dF9pbmZvLA0KPiAgIAkJCQkgICAgICB4ZW5fZHJtX2Zyb250X2RidWZfdG9fY29va2llKGdlbV9v
YmopLA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
