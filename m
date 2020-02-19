Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7721643DC
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 13:06:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4O4n-0006OU-15; Wed, 19 Feb 2020 12:03:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZOK0=4H=epam.com=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1j4O4l-0006O7-64
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 12:03:35 +0000
X-Inumbo-ID: d9d4314a-530f-11ea-ade5-bc764e2007e4
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.42]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d9d4314a-530f-11ea-ade5-bc764e2007e4;
 Wed, 19 Feb 2020 12:03:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M5dok2ALRM+7CGL2wXr0eBfM5AxNC/emkghPavjyXy3v5dSV0hf+PARDYJrbFa7DIs5x0mqGqQX4tuQlSZT5w7T5SynX/mE98u5hWI6678WHO1cC4GLQI1lNB5q2sFFBge1NLoQXZvRD7CDP70jmQqeKw5REt1NNxB2GgYZMl1TP+oAHiX/mnxaK7/L6a7bNLF0dHj0F5gZHTmRa5Xf8paEGrA9x5gyxAXCwSSPdVTfFQ1rhzVXGlDBOBnDIadpgViiwn3UZeNK3okvuv0JY26WC5IqQTLVx/e856L8Oo3go9V96RLO2Lqs+aV/nfiZUCkBadBW/OLWpYBQDlbzxFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FAaJif/uA5V/if8azbw0a6CGDjdkCXq7ZGxeEYA9r58=;
 b=OdRYuFCSmJnRjjs42/3C/TVsKJ0ggpidAwfkrSITdujLtLfLR54b/87gP93iP/53Cb3TaqfQToZ7KOOXzoBJwt8JpmTdLkvmK24ls6+FuP76qj2CPVgXwrgj4AdIZt8vcZS4ksyY0Bj10++0GO1rrGcrIfbJalz4MwqjasYjAsUJm/GWifNTFmgCtltIQm0VsHhMVU0L1mBXQx0gY9zMF0zM/z1gIyI8YSgKMl2EKMZrOdBYQIAK7cP+FVOyNYlDJoAFAHOKuLgIovJTf0W6/AYoRfD6bjZiL5lSyK1WTRzNBRxQcMCxVJrf/EoO7mHAOXk4WXiV4SZT4jq1M8z/lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FAaJif/uA5V/if8azbw0a6CGDjdkCXq7ZGxeEYA9r58=;
 b=H7RxP2kYeaAP/CVGMGdqbHc9w5x9dUMpaWktF8BfhQ8vQ1BMWiWXuj+ycjES4IHtbiokvkqc2xY7uzTCE28p4JsG1v3NVoVwaYWEJEEL2xAnh+pZGUJ/hJEh/Kt7aGE9lleI4B4Bq4QUleiQz93bSm21fp4hy2sn/TWF7JnmiZ8=
Received: from AM6PR03MB4517.eurprd03.prod.outlook.com (20.177.35.27) by
 AM6PR03MB5267.eurprd03.prod.outlook.com (10.255.98.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.25; Wed, 19 Feb 2020 12:03:32 +0000
Received: from AM6PR03MB4517.eurprd03.prod.outlook.com
 ([fe80::f:4dc2:f41f:997b]) by AM6PR03MB4517.eurprd03.prod.outlook.com
 ([fe80::f:4dc2:f41f:997b%5]) with mapi id 15.20.2729.032; Wed, 19 Feb 2020
 12:03:32 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development
 <dri-devel@lists.freedesktop.org>
Thread-Topic: [PATCH 04/52] drm: Set final_kfree in drm_dev_alloc
Thread-Index: AQHV5w5groS5vlmjMU293YOjHXqBFKgiaxYA
Date: Wed, 19 Feb 2020 12:03:32 +0000
Message-ID: <99c1dcd2-a9ab-165a-8c76-587808e59ce4@epam.com>
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
 <20200219102122.1607365-5-daniel.vetter@ffwll.ch>
In-Reply-To: <20200219102122.1607365-5-daniel.vetter@ffwll.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Oleksandr_Andrushchenko@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f5f3c039-88a1-4c54-0d08-08d7b533bdab
x-ms-traffictypediagnostic: AM6PR03MB5267:
x-microsoft-antispam-prvs: <AM6PR03MB5267A15086B8E2BAA305A6C9E7100@AM6PR03MB5267.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2331;
x-forefront-prvs: 0318501FAE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(136003)(376002)(396003)(346002)(199004)(189003)(66946007)(8936002)(66446008)(8676002)(2616005)(66556008)(91956017)(110136005)(4326008)(76116006)(7416002)(64756008)(81166006)(5660300002)(66476007)(36756003)(81156014)(71200400001)(316002)(54906003)(31686004)(2906002)(6512007)(31696002)(86362001)(6506007)(26005)(53546011)(186003)(478600001)(6486002)(55236004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR03MB5267;
 H:AM6PR03MB4517.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rs1cCTriV9FSOsUEyVaM0gv3OOcQXfrQ6Mb+6e6xxp6d3xJsUbwwxqTGkNEd2r6WFvCZ1YZYrt1yWSI4yc1XQ29aUa2JzEnoCXULmOuhVQvKSeJwqY2tI4ZmShu/YRMjEe65g8Ow7kQsG4fTrc8xjIilMUtOwpiv+2dJikiwDEdtgVsSxXk7frBjJeto6Spdq+zY+ThYv6utM1KgceQoNVbDCMb+w5/z11aUIuACatYB4CCeueXmTiJkPgUIbT0xyXwtVeAVZP69c8PYInLszFKrN6bJGnH/Sm9aqGySAszTSE1UO5WqsIg13GHdF6gaVJg2bvrIfMu/L8jaR7+7Z9eYV06TPL4jzj/RXI88WfBxqEWEM8QgMof+Mu8GjWUHYv2eWPM1xRRDfgplVwAIn8OHwOztewMW6jHpRmMh5FZhtiPWVutV+EOAnqqHk7Jf
x-ms-exchange-antispam-messagedata: uU/sa5NlWUaVNrDlL+cBWkYA+j7/l1aasFYNS9d+/BSyfbuhNSGkpenamYhJqB2BBqG6Gbkh73Tpcsj3LZ1rposGx97N3HlWiJYbD/VV3E5MeXsGXvVBuz0D2r4e2S2/RFt/FujDO5MqjYkG6z10fA==
x-ms-exchange-transport-forked: True
Content-ID: <E340FB019A314B4FA61490EBF09C7858@eurprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5f3c039-88a1-4c54-0d08-08d7b533bdab
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2020 12:03:32.5258 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R5LqzW1Pc5Q5F7sJ/Fli9XpnupYoBfgos0JqUKkxK5/4uf4ms2iBH19OypzuyPF/NmFayTagFUkQq7b9jkkA7ub8WhGnhuhRBXY1V5GY6DlBD/gTu+kL2pDr2gpKVoEZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB5267
Subject: Re: [Xen-devel] [PATCH 04/52] drm: Set final_kfree in drm_dev_alloc
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
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMi8xOS8yMCAxMjoyMCBQTSwgRGFuaWVsIFZldHRlciB3cm90ZToNCj4gSSBhbHNvIGRpZCBh
IGZ1bGwgcmV2aWV3IG9mIGFsbCBjYWxsZXJzLCBhbmQgb25seSB0aGUgeGVuIGRyaXZlcg0KPiBm
b3Jnb3QgdG8gY2FsbCBkcm1fZGV2X3B1dCBpbiB0aGUgZmFpbHVyZSBwYXRoLiBGaXggdGhhdCB1
cCB0b28uDQo+DQo+IHYyOiBJIG5vdGljZWQgdGhhdCB4ZW4gaGFzIGEgZHJtX2RyaXZlci5yZWxl
YXNlIGhvb2ssIGFuZCB1c2VzDQo+IGRybV9kZXZfYWxsb2MoKS4gV2UgbmVlZCB0byByZW1vdmUg
dGhlIGtmcmVlIGZyb20NCj4geGVuX2RybV9kcnZfcmVsZWFzZSgpLg0KPg0KPiBib2NocyBhbHNv
IGhhcyBhIHJlbGVhc2UgaG9vaywgYnV0IGxlYWtlZCB0aGUgZHJtX2RldmljZSBldmVyIHNpbmNl
DQo+DQo+IGNvbW1pdCAwYTY2NTliZGM1ZTgyMjFkYTk5ZWViYjE3NmZkOTU5MTQzNWUzOGRlDQo+
IEF1dGhvcjogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+DQo+IERhdGU6ICAgVHVl
IERlYyAxNyAxODowNDo0NiAyMDEzICswMTAwDQo+DQo+ICAgICAgZHJtL2JvY2hzOiBuZXcgZHJp
dmVyDQo+DQo+IFRoaXMgcGF0Y2ggaGVyZSBmaXhlcyB0aGF0IGxlYWsuDQo+DQo+IFNhbWUgZm9y
IHZpcnRpbywgc3RhcnRlZCBsZWFraW5nIHdpdGgNCj4NCj4gY29tbWl0IGIxZGYzYTJiMjRhOTE3
Zjg4NTNkNDNmZTk2ODNjMGUzNjBkMmMzM2ENCj4gQXV0aG9yOiBHZXJkIEhvZmZtYW5uIDxrcmF4
ZWxAcmVkaGF0LmNvbT4NCj4gRGF0ZTogICBUdWUgRmViIDExIDE0OjU4OjA0IDIwMjAgKzAxMDAN
Cj4NCj4gICAgICBkcm0vdmlydGlvOiBhZGQgZHJtX2RyaXZlci5yZWxlYXNlIGNhbGxiYWNrLg0K
Pg0KPiBDYzogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+DQo+IENjOiBPbGVrc2Fu
ZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+IENj
OiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4NCj4gU2lnbmVkLW9mZi1ieTogRGFu
aWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+DQpUaGFuayB5b3UsDQpSZXZpZXdl
ZC1ieTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVw
YW0uY29tPg0KPiBDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4
LmludGVsLmNvbT4NCj4gQ2M6IE1heGltZSBSaXBhcmQgPG1yaXBhcmRAa2VybmVsLm9yZz4NCj4g
Q2M6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPiBDYzogRGF2aWQg
QWlybGllIDxhaXJsaWVkQGxpbnV4LmllPg0KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZm
d2xsLmNoPg0KPiBDYzogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNo
Y2hlbmtvQGVwYW0uY29tPg0KPiBDYzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+
IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHJ2LmMgICAgICAgICAgIHwgMyArKysNCj4g
ICBkcml2ZXJzL2dwdS9kcm0veGVuL3hlbl9kcm1fZnJvbnQuYyB8IDIgKy0NCj4gICAyIGZpbGVz
IGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPg0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHJ2LmMN
Cj4gaW5kZXggM2U1NjI3ZDZlYmE2Li45ZTYyZTI4YmJjNjIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9kcm1fZHJ2LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcnYuYw0K
PiBAQCAtMzksNiArMzksNyBAQA0KPiAgICNpbmNsdWRlIDxkcm0vZHJtX2NvbG9yX21nbXQuaD4N
Cj4gICAjaW5jbHVkZSA8ZHJtL2RybV9kcnYuaD4NCj4gICAjaW5jbHVkZSA8ZHJtL2RybV9maWxl
Lmg+DQo+ICsjaW5jbHVkZSA8ZHJtL2RybV9tYW5hZ2VkLmg+DQo+ICAgI2luY2x1ZGUgPGRybS9k
cm1fbW9kZV9vYmplY3QuaD4NCj4gICAjaW5jbHVkZSA8ZHJtL2RybV9wcmludC5oPg0KPiAgIA0K
PiBAQCAtODE5LDYgKzgyMCw4IEBAIHN0cnVjdCBkcm1fZGV2aWNlICpkcm1fZGV2X2FsbG9jKHN0
cnVjdCBkcm1fZHJpdmVyICpkcml2ZXIsDQo+ICAgCQlyZXR1cm4gRVJSX1BUUihyZXQpOw0KPiAg
IAl9DQo+ICAgDQo+ICsJZHJtbV9hZGRfZmluYWxfa2ZyZWUoZGV2LCBkZXYpOw0KPiArDQo+ICAg
CXJldHVybiBkZXY7DQo+ICAgfQ0KPiAgIEVYUE9SVF9TWU1CT0woZHJtX2Rldl9hbGxvYyk7DQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGVuL3hlbl9kcm1fZnJvbnQuYyBiL2RyaXZl
cnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udC5jDQo+IGluZGV4IDRiZTQ5YzFhZWY1MS4uZDIy
YjVkYTM4OTM1IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGVuL3hlbl9kcm1fZnJv
bnQuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGVuL3hlbl9kcm1fZnJvbnQuYw0KPiBAQCAt
NDYxLDcgKzQ2MSw2IEBAIHN0YXRpYyB2b2lkIHhlbl9kcm1fZHJ2X3JlbGVhc2Uoc3RydWN0IGRy
bV9kZXZpY2UgKmRldikNCj4gICAJZHJtX21vZGVfY29uZmlnX2NsZWFudXAoZGV2KTsNCj4gICAN
Cj4gICAJZHJtX2Rldl9maW5pKGRldik7DQo+IC0Ja2ZyZWUoZGV2KTsNCj4gICANCj4gICAJaWYg
KGZyb250X2luZm8tPmNmZy5iZV9hbGxvYykNCj4gICAJCXhlbmJ1c19zd2l0Y2hfc3RhdGUoZnJv
bnRfaW5mby0+eGJfZGV2LA0KPiBAQCAtNTYxLDYgKzU2MCw3IEBAIHN0YXRpYyBpbnQgeGVuX2Ry
bV9kcnZfaW5pdChzdHJ1Y3QgeGVuX2RybV9mcm9udF9pbmZvICpmcm9udF9pbmZvKQ0KPiAgIGZh
aWxfbW9kZXNldDoNCj4gICAJZHJtX2ttc19oZWxwZXJfcG9sbF9maW5pKGRybV9kZXYpOw0KPiAg
IAlkcm1fbW9kZV9jb25maWdfY2xlYW51cChkcm1fZGV2KTsNCj4gKwlkcm1fZGV2X3B1dChkcm1f
ZGV2KTsNCj4gICBmYWlsOg0KPiAgIAlrZnJlZShkcm1faW5mbyk7DQo+ICAgCXJldHVybiByZXQ7
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
