Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B042114CB0B
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 14:03:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwmxX-0004cu-7t; Wed, 29 Jan 2020 13:00:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+43p=3S=epam.com=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1iwmxU-0004ck-Vk
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 13:00:41 +0000
X-Inumbo-ID: 58d25ece-4297-11ea-88b7-12813bfff9fa
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.2.71]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 58d25ece-4297-11ea-88b7-12813bfff9fa;
 Wed, 29 Jan 2020 13:00:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gyWWywBs0ig2dBSi5fy9dueG1l8rMZBvbERSsS5bTm/yhCyivpkQejgYHAWJJ5XuMviJGCqrIQxUarrnCxw9CRFM5OL3Ea0Uvgv/HppIpmRSi7Yr9UjDXFnriGyOtb07MHFd1HEVGK02Ap/tV3GvD1NIG/eVlfJX+LUkQLbfYkvgr9GrTZgn0UH9M06BI4qj3MVK9e+8Ujcc25cOqvXukn+ZNHMqQrXWTA9hA2m7fWlkp3WBOfr88ZiHsB5fptNifn5Z16SicrYtnmcojIc61IMU6SISnfjkdFnhNOh8z5fZ/B+61mVKXomD3ZD4NUo5lgsAooxNndDZUxtLm47Ddw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DHkyC1wmgfxemgXldj4WTeEuIRR8aRVGSYLEAO5rRto=;
 b=f1QMuFF7eHxSiZs6XbwWzK1SMG9Tr4sVzNLO+yFNqr6icPuVdm9QpV+pZcCktM9YuguKA5AIfEhGfvHP6aYkAlq58TqJ2TpAyPQYqFsRRnGHN8YaEXbwlmTOAUKYn5qxbKwf0egpjdTDd2sBBpWX93tVE+CLdNK1pn519WGGk5a68G14lp/52uCBArD2C/p+qWPhhjZyJdXzqq/PFwzoN+vqEfEKDjnRQ59fOGtUxQHU3tTK2gOM0maxMxcojbSkLbRY2z+fDAK/bsKXrgr3Lt7FsHWXyIWfLBiu+dYM77e46OJuOkAT//dKBtZ8EG4deXZaM++4h7Z4qLBRquXsUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DHkyC1wmgfxemgXldj4WTeEuIRR8aRVGSYLEAO5rRto=;
 b=ZaZj8is3BVl091tM7iIRzA9perB1mQo/Snnmm1f2Tke18Ip2+oD6SZhyKwzJssGN0fuoJ7omaKD7svSGBqr9UrXRL2AEXXqetzpYcCHXLQBklBEfa3ZZattdS9W0jeixM64yUhow0WBs7Lg9uOvcT3+SuHxiUWXsj8VAxGXoamw=
Received: from AM0PR03MB4516.eurprd03.prod.outlook.com (20.177.41.82) by
 AM0PR03MB6163.eurprd03.prod.outlook.com (10.186.172.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.20; Wed, 29 Jan 2020 13:00:37 +0000
Received: from AM0PR03MB4516.eurprd03.prod.outlook.com
 ([fe80::a489:598f:51af:6d59]) by AM0PR03MB4516.eurprd03.prod.outlook.com
 ([fe80::a489:598f:51af:6d59%4]) with mapi id 15.20.2665.026; Wed, 29 Jan 2020
 13:00:37 +0000
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
Thread-Topic: [PATCH v5 15/15] drm/xen: Explicitly disable automatic sending
 of vblank event
Thread-Index: AQHV1pxwF+EM045xT06g2ezCLcsR3KgBmvkA
Date: Wed, 29 Jan 2020 13:00:37 +0000
Message-ID: <e2bd0ad6-573b-17e0-c47e-6550947b1916@epam.com>
References: <20200129120531.6891-1-tzimmermann@suse.de>
 <20200129120531.6891-16-tzimmermann@suse.de>
In-Reply-To: <20200129120531.6891-16-tzimmermann@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Oleksandr_Andrushchenko@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c0b5f671-a53e-46bf-82c4-08d7a4bb3c3a
x-ms-traffictypediagnostic: AM0PR03MB6163:
x-microsoft-antispam-prvs: <AM0PR03MB616389306962D42A4277E520E7050@AM0PR03MB6163.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 02973C87BC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(346002)(376002)(136003)(39860400002)(189003)(199004)(186003)(81156014)(478600001)(26005)(8936002)(55236004)(31696002)(86362001)(53546011)(81166006)(7416002)(4326008)(71200400001)(6506007)(5660300002)(8676002)(64756008)(110136005)(91956017)(54906003)(66946007)(6486002)(66446008)(66556008)(66476007)(31686004)(76116006)(6512007)(2906002)(36756003)(316002)(2616005)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB6163;
 H:AM0PR03MB4516.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ffiV1zogbA1tH2bnYsQBFD9OgbMv7WJ/r+OGwzr9cir6CR6dCYOBVG5zHQcaY/ddasghdDkCOCFWyrV/46TfYIbhM1NiAqvMeAJGDKQU54wiNoSMzkL80hEnuWyizNVatxDRVTr1eF+tLrxntppKMy76sSwe9/jTlQJoSUjaE+rPrPLrMxoszuE3Geh8yPP00BlyJQQyiHVo9LZnSuqeT/SJT+YSoEFpoegFDpXMdmjfyS4+LO9q/VDyP8dlIygJUns/smL8R8W9ABnKCfn2kQRNqkgok+R/DGdptQFGKdn47B51G6SmBBLD/N1mI1X1dpJ5aE8nKRXBNCWsDpGdpkfWGxXqzYAt/MCrIPwCiTFjjnImxxo1lYx40Yt9/osP21vQbsMpMrcRs8pqxht0oNWvDdpLJamXWF87EKWJEYPbnr1hICzho94Jbzy9VsewrTR8m3A9r8zGNbJ+a1dYzCRbI+M/aySsjYE2nDeyqVCJugSqzSKw4HF5TfVfTu/b
x-ms-exchange-antispam-messagedata: gMxyIuVgBj9FGERNx+h5hYpMcG4aKBz8pADYWsbJzkAlBsD2NCq71L/L5ea0OmUOmThxOF2beekawdNLev6/+K2luK6vOJ1Y6Ptht1gaVIvwcUladNMAbpw+jaQUEA4siyo+8Z4uFA7FkrNZApPcDQ==
x-ms-exchange-transport-forked: True
Content-ID: <4519BC3C3687C54C8173137068C5FDB3@eurprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0b5f671-a53e-46bf-82c4-08d7a4bb3c3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2020 13:00:37.1312 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0ID9HZ4dzAOB9DgD/qT1LhHNMjP3VxuKeGKuL6Q63ZoCWaTm2EUoETTPmU9/rUBX+rHzTzwfdLrMBOHd4d2EH+sMEBPU6ifDYQz4XS5avHF1lxnKZlkgRPn73PdEEQio
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6163
Subject: Re: [Xen-devel] [PATCH v5 15/15] drm/xen: Explicitly disable
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMS8yOS8yMCAyOjA1IFBNLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4gVGhlIGF0b21p
YyBoZWxwZXJzIGF1dG9tYXRpY2FsbHkgc2VuZCBvdXQgZmFrZSBWQkxBTksgZXZlbnRzIGlmIG5v
DQo+IHZibGFua2luZyBoYXMgYmVlbiBpbml0aWFsaXplZC4gVGhpcyB3b3VsZCBhcHBseSB0byB4
ZW4sIGJ1dCB4ZW4gaGFzDQo+IGl0cyBvd24gdmJsYW5rIGxvZ2ljLiBUbyBhdm9pZCBpbnRlcmZl
cmluZyB3aXRoIHRoZSBhdG9taWMgaGVscGVycywNCj4gZGlzYWJsZSBhdXRvbWF0aWMgdmJsYW5r
IGV2ZW50cyBleHBsaWNpdGx5Lg0KPg0KPiB2NToNCj4gCSogdXBkYXRlIGNvbW1lbnQNCj4gdjQ6
DQo+IAkqIHNlcGFyYXRlIGNvbW1pdCBmcm9tIGNvcmUgdmJsYW5rIGNoYW5nZXMNCj4NCj4gU2ln
bmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+IEFj
a2VkLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4NCj4gUmV2aWV3ZWQtYnk6
IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+DQpUaGFuayB5b3UgZm9yIHlv
dXIgd29yaywNClJldmlld2VkLWJ5OiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRy
X2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS94ZW4v
eGVuX2RybV9mcm9udF9rbXMuYyB8IDE5ICsrKysrKysrKysrKysrKysrKysNCj4gICAxIGZpbGUg
Y2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3hlbi94ZW5fZHJtX2Zyb250X2ttcy5jIGIvZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJt
X2Zyb250X2ttcy5jDQo+IGluZGV4IDRmMzRjNTIwODE4MC4uNzgwOTZiYmNkMjI2IDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGVuL3hlbl9kcm1fZnJvbnRfa21zLmMNCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250X2ttcy5jDQo+IEBAIC0yMjAsNiArMjIw
LDI0IEBAIHN0YXRpYyBib29sIGRpc3BsYXlfc2VuZF9wYWdlX2ZsaXAoc3RydWN0IGRybV9zaW1w
bGVfZGlzcGxheV9waXBlICpwaXBlLA0KPiAgIAlyZXR1cm4gZmFsc2U7DQo+ICAgfQ0KPiAgIA0K
PiArc3RhdGljIGludCBkaXNwbGF5X2NoZWNrKHN0cnVjdCBkcm1fc2ltcGxlX2Rpc3BsYXlfcGlw
ZSAqcGlwZSwNCj4gKwkJCSBzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICpwbGFuZV9zdGF0ZSwNCj4g
KwkJCSBzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKmNydGNfc3RhdGUpDQo+ICt7DQo+ICsJLyoNCj4g
KwkgKiBYZW4gZG9lc24ndCBpbml0aWFsaXplIHZibGFua2luZyB2aWEgZHJtX3ZibGFua19pbml0
KCksIHNvDQo+ICsJICogRFJNIGhlbHBlcnMgYXNzdW1lIHRoYXQgaXQgZG9lc24ndCBoYW5kbGUg
dmJsYW5raW5nIGFuZCBzdGFydA0KPiArCSAqIHNlbmRpbmcgb3V0IGZha2UgVkJMQU5LIGV2ZW50
cyBhdXRvbWF0aWNhbGx5Lg0KPiArCSAqDQo+ICsJICogQXMgeGVuIGNvbnRhaW5zIGl0J3Mgb3du
IGxvZ2ljIGZvciBzZW5kaW5nIG91dCBWQkxBTksgZXZlbnRzDQo+ICsJICogaW4gc2VuZF9wZW5k
aW5nX2V2ZW50KCksIGRpc2FibGUgbm9fdmJsYW5rIChpLmUuLCB0aGUgeGVuDQo+ICsJICogZHJp
dmVyIGhhcyB2Ymxhbmtpbmcgc3VwcG9ydCkuDQo+ICsJICovDQo+ICsJY3J0Y19zdGF0ZS0+bm9f
dmJsYW5rID0gZmFsc2U7DQo+ICsNCj4gKwlyZXR1cm4gMDsNCj4gK30NCj4gKw0KPiAgIHN0YXRp
YyB2b2lkIGRpc3BsYXlfdXBkYXRlKHN0cnVjdCBkcm1fc2ltcGxlX2Rpc3BsYXlfcGlwZSAqcGlw
ZSwNCj4gICAJCQkgICBzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICpvbGRfcGxhbmVfc3RhdGUpDQo+
ICAgew0KPiBAQCAtMjg0LDYgKzMwMiw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX3NpbXBs
ZV9kaXNwbGF5X3BpcGVfZnVuY3MgZGlzcGxheV9mdW5jcyA9IHsNCj4gICAJLmVuYWJsZSA9IGRp
c3BsYXlfZW5hYmxlLA0KPiAgIAkuZGlzYWJsZSA9IGRpc3BsYXlfZGlzYWJsZSwNCj4gICAJLnBy
ZXBhcmVfZmIgPSBkcm1fZ2VtX2ZiX3NpbXBsZV9kaXNwbGF5X3BpcGVfcHJlcGFyZV9mYiwNCj4g
KwkuY2hlY2sgPSBkaXNwbGF5X2NoZWNrLA0KPiAgIAkudXBkYXRlID0gZGlzcGxheV91cGRhdGUs
DQo+ICAgfTsNCj4gICANCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
