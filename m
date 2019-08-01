Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C007DC9C
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2019 15:36:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htBCw-0000X2-Qo; Thu, 01 Aug 2019 13:33:26 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LBr6=V5=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1htBCw-0000Wx-0m
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2019 13:33:26 +0000
X-Inumbo-ID: ef0e5ccb-b460-11e9-8980-bc764e045a96
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe02::623])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ef0e5ccb-b460-11e9-8980-bc764e045a96;
 Thu, 01 Aug 2019 13:33:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k6ftKwQpzfOjbmXwlmFmQTD/btEO7slmB/0EMXrXODjy2An1tVN+p/r6L2ZFJ8ihCjrIUdF/bcw/2CYK6I+feSNMkXw4DjFkNLD2dHctRvAqsByv6QxBzqlTkihxyzJ3xfZN5lxNPUeqUfapdfOjgwmTcLkfF4trmjkY9zh9jSSr6UbFffr6dT7AfIyspVr5d2AuhLvFJka8i6QVuPzj83QXLUYJVC8X5hDh5S2DBbnE0x0jRYyf6wGupPcB/7aLbOPqgf0051bniSqLRi+3B50AOCKLCrzV7gJ8GTC6nkTHWQHDOqGK+5Nx4FYx68ybscBHbFbEF7G16KZO9okK1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x8+lrXwZ3Cuvt+kQpxlXwI5043RlAnPOmqYACe8fmQ4=;
 b=ji8s8eocZTUTjrSkDGmtwB91xyDIzX7CZgl/HWZNBYFH4FeYHYyYx8l5RatJpVKFiPm9K8aNZrCUA8oyNTyqh5hpgn+ZaNA8vNvxNxAs6bbCv0umpDJgQYT4k9hjcbZRWSey6Tw2EiKaWNkeXGd1NapC11K5vfRAOgtnMrivXim196P4htfP9r4QWoU2GX5n6c2xU94iu8YycGLOq6p1r7OOj0vzgfK0ImaFosRosFZCsBLlMoaszwsWKOQmozJDsRP42uZPcCOvqB3vzVPVStf5XjrGFIdo5e5iMKP85rCByOI67iqdrFu3q/7ICAYIfbIdYb3w0RCCY1RjdIFD1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=epam.com;dmarc=pass action=none header.from=epam.com;dkim=pass
 header.d=epam.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x8+lrXwZ3Cuvt+kQpxlXwI5043RlAnPOmqYACe8fmQ4=;
 b=S3GXbl3xkOeny3VR9w95KKsvaKWbJrRCrb/hHjS5hnDy6fWPOvy8dicewvXk1CJFW85p9ks/TU8MT2BxMpUSSEiedt6VkqdVe5orRbLci8vSeFQ4Mmgu5C3iFXhiN9Jz/8gy27/ZVkAVntzmu5+XwPbGB0p7MZt1N5pVvdq2jV0bxjjZW6JZlu6nqeTrRVyHte0A02CKPxDX5SttiUdRVqgqKd8hJ/0J8zZhalld6kEEw0gcveM7FjWVi4cGuaChGWEtEtayIREUMC8nVJc7yd2W1+8wmFKhowk+NcfUbYqQiqn5l6FqrXNf3wUQDX1Jrkq18aTSOvtidXWlKdbXSQ==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB4947.eurprd03.prod.outlook.com (20.178.23.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Thu, 1 Aug 2019 13:33:22 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c%5]) with mapi id 15.20.2115.005; Thu, 1 Aug 2019
 13:33:22 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Viktor Mitin <viktor.mitin.19@gmail.com>
Thread-Topic: [PATCH v5 1/2] xen/arm: extend fdt_property_interrupts to
 support DomU
Thread-Index: AQHVSGFrWko4eRGZAU6vSMP/JLX4BqbmSpyA
Date: Thu, 1 Aug 2019 13:33:21 +0000
Message-ID: <871ry5huxq.fsf@epam.com>
References: <20190801120452.6814-1-viktor.mitin.19@gmail.com>
 <20190801120452.6814-2-viktor.mitin.19@gmail.com>
In-Reply-To: <20190801120452.6814-2-viktor.mitin.19@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e9d9a206-7858-40bb-6829-08d71684d299
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR03MB4947; 
x-ms-traffictypediagnostic: AM0PR03MB4947:|AM0PR03MB4947:
x-microsoft-antispam-prvs: <AM0PR03MB494739D553BD1737D0700130E6DE0@AM0PR03MB4947.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 01165471DB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(346002)(396003)(39860400002)(366004)(199004)(189003)(486006)(6506007)(305945005)(66476007)(4326008)(66946007)(6486002)(6916009)(66556008)(53936002)(64756008)(66446008)(81166006)(7736002)(6436002)(3846002)(54906003)(71190400001)(6246003)(80792005)(25786009)(107886003)(71200400001)(316002)(66066001)(68736007)(8936002)(81156014)(99286004)(91956017)(6116002)(8676002)(36756003)(2906002)(229853002)(476003)(6512007)(76176011)(11346002)(446003)(76116006)(256004)(102836004)(2616005)(186003)(55236004)(14454004)(26005)(478600001)(5660300002)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB4947;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: IS5AA4ksIuSX/VwVvd9BZeuSoQMlLQc9f4YfO8m532eu4cIYm3ti7hjoAUhDj/fP0kGywilQVjrICQfzaVE90EXokE4HwkdquJ1J9/9BI1x815j3TFNKvEAb33ffMF6T8uRamjQSAi0YvAdqZgUGehHzHdyrMYkLYUIs2cWvXBFEg0RHUHeHs9/M3/veY8oKut41c7z/7Hi6t4XRcy/Y37C3HFJDY1AO37K/EJdwIzAAPPHPNxd7c2T0d8WUyNMaBDgbPswBD2qVgwOl18EdNsdjjDY3HxXGRge3TC5RCsB8W64P8MhiwBNlRF6xdIZq1cMvAndx13h4eVbar/IT8CC+UIMkQ+846G029wI464c1T24qaQTudlmtXoaEdPceFvAK8SDR2yCJ/Z4rzhv2qh3xmLLNFuyIxk6yNp6rDCk=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9d9a206-7858-40bb-6829-08d71684d299
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2019 13:33:21.9878 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Volodymyr_Babchuk@epam.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4947
Subject: Re: [Xen-devel] [PATCH v5 1/2] xen/arm: extend
 fdt_property_interrupts to support DomU
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
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Viktor Mitin <Viktor_Mitin@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CkhpIFZpa3RvciwKClZpa3RvciBNaXRpbiB3cml0ZXM6Cgo+IEV4dGVuZCBmZHRfcHJvcGVydHlf
aW50ZXJydXB0cyB0byBkZWFsIHdpdGggb3RoZXIgZG9tYWluIHRoYW4gdGhlIGh3ZG9tLgo+Cj4g
VGhlIHByb3RvdHlwZSBvZiBmZHRfcHJvcGVydHlfaW50ZXJydXB0cygpIGhhcyBiZWVuIG1vZGlm
aWVkCj4gdG8gc3VwcG9ydCBib3RoIGh3ZG9tIGFuZCBkb21VIGluIG9uZSBmdW5jdGlvbi4KPgo+
IFRoZSBuZXcgcHJvdG90eXBlIG9mIG1ha2VfdGltZXJfbm9kZSBmdW5jdGlvbiBpcyByZXF1aXJl
ZAo+IHNpbmNlIG1ha2VfdGltZXJfbm9kZSBjYWxscyBmZHRfcHJvcGVydHlfaW50ZXJydXB0cyB3
aGljaCB1c2VzIGtpbmZvOgo+Cj4gIG1ha2VfdGltZXJfbm9kZShjb25zdCBzdHJ1Y3Qga2VybmVs
X2luZm8gKmtpbmZvKQo+Cj4gVGhpcyBpcyBhIHByZXBhcmF0b3J5IGZvciB0aGUgbmV4dCBwYXRj
aCB3aGljaCBjb25zb2xpZGF0ZXMKPiBtYWtlX3RpbWVyX25vZGUgYW5kIG1ha2VfdGltZXJfZG9t
VV9ub2RlIi4KPiBPcmlnaW5hbCBnb2FsIGlzIHRvIGNvbnNvbGlkYXRlIG1ha2VfdGltZXIgZnVu
Y3Rpb25zLgo+Cj4gU3VnZ2VzdGVkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0u
Y29tPgo+IFNpZ25lZC1vZmYtYnk6IFZpa3RvciBNaXRpbiA8dmlrdG9yX21pdGluQGVwYW0uY29t
PgpSZXZpZXdlZC1ieTogVm9sb2R5bXlyIEJhYmNodWsgPHZvbG9keW15cl9iYWJjaHVrQGVwYW0u
Y29tPgoKPiAtLS0KPiAgeGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIHwgMjAgKysrKysrKysr
KysrLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDggZGVsZXRp
b25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIGIveGVu
L2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCj4gaW5kZXggNGM4NDA0MTU1YS4uYmM3ZDE3ZGQyYyAx
MDA2NDQKPiAtLS0gYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKPiArKysgYi94ZW4vYXJj
aC9hcm0vZG9tYWluX2J1aWxkLmMKPiBAQCAtNjIxLDE3ICs2MjEsMjAgQEAgc3RhdGljIHZvaWQg
X19pbml0IHNldF9pbnRlcnJ1cHQoZ2ljX2ludGVycnVwdF90IGludGVycnVwdCwKPiAgICogICJp
bnRlcnJ1cHRzIjogY29udGFpbnMgdGhlIGxpc3Qgb2YgaW50ZXJydXB0cwo+ICAgKiAgImludGVy
cnVwdC1wYXJlbnQiOiBsaW5rIHRvIHRoZSBHSUMKPiAgICovCj4gLXN0YXRpYyBpbnQgX19pbml0
IGZkdF9wcm9wZXJ0eV9pbnRlcnJ1cHRzKHZvaWQgKmZkdCwgZ2ljX2ludGVycnVwdF90ICppbnRy
LAo+ICtzdGF0aWMgaW50IF9faW5pdCBmZHRfcHJvcGVydHlfaW50ZXJydXB0cyhjb25zdCBzdHJ1
Y3Qga2VybmVsX2luZm8gKmtpbmZvLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBnaWNfaW50ZXJydXB0X3QgKmludHIsCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIG51bV9pcnEpCj4gIHsKPiAgICAgIGludCBy
ZXM7Cj4gKyAgICB1aW50MzJfdCBwaGFuZGxlID0gaXNfaGFyZHdhcmVfZG9tYWluKGtpbmZvLT5k
KSA/Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgZHRfaW50ZXJydXB0X2NvbnRyb2xsZXItPnBo
YW5kbGUgOiBHVUVTVF9QSEFORExFX0dJQzsKPgo+IC0gICAgcmVzID0gZmR0X3Byb3BlcnR5KGZk
dCwgImludGVycnVwdHMiLCBpbnRyLCBzaXplb2YgKGludHJbMF0pICogbnVtX2lycSk7Cj4gKyAg
ICByZXMgPSBmZHRfcHJvcGVydHkoa2luZm8tPmZkdCwgImludGVycnVwdHMiLAo+ICsgICAgICAg
ICAgICAgICAgICAgICAgIGludHIsIHNpemVvZiAoaW50clswXSkgKiBudW1faXJxKTsKPiAgICAg
IGlmICggcmVzICkKPiAgICAgICAgICByZXR1cm4gcmVzOwo+Cj4gLSAgICByZXMgPSBmZHRfcHJv
cGVydHlfY2VsbChmZHQsICJpbnRlcnJ1cHQtcGFyZW50IiwKPiAtICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGR0X2ludGVycnVwdF9jb250cm9sbGVyLT5waGFuZGxlKTsKPiArICAgIHJlcyA9
IGZkdF9wcm9wZXJ0eV9jZWxsKGtpbmZvLT5mZHQsICJpbnRlcnJ1cHQtcGFyZW50IiwgcGhhbmRs
ZSk7Cj4KPiAgICAgIHJldHVybiByZXM7Cj4gIH0KPiBAQCAtNzMzLDcgKzczNiw3IEBAIHN0YXRp
YyBpbnQgX19pbml0IG1ha2VfaHlwZXJ2aXNvcl9ub2RlKHN0cnVjdCBkb21haW4gKmQsCj4gICAg
ICAgKiAgVE9ETzogSGFuZGxlIHByb3Blcmx5IHRoZSBjcHVtYXNrOwo+ICAgICAgICovCj4gICAg
ICBzZXRfaW50ZXJydXB0KGludHIsIGQtPmFyY2guZXZ0Y2huX2lycSwgMHhmLCBEVF9JUlFfVFlQ
RV9MRVZFTF9MT1cpOwo+IC0gICAgcmVzID0gZmR0X3Byb3BlcnR5X2ludGVycnVwdHMoZmR0LCAm
aW50ciwgMSk7Cj4gKyAgICByZXMgPSBmZHRfcHJvcGVydHlfaW50ZXJydXB0cyhraW5mbywgJmlu
dHIsIDEpOwo+ICAgICAgaWYgKCByZXMgKQo+ICAgICAgICAgIHJldHVybiByZXM7Cj4KPiBAQCAt
OTYwLDggKzk2Myw5IEBAIHN0YXRpYyBpbnQgX19pbml0IG1ha2VfZ2ljX25vZGUoY29uc3Qgc3Ry
dWN0IGRvbWFpbiAqZCwgdm9pZCAqZmR0LAo+ICAgICAgcmV0dXJuIHJlczsKPiAgfQo+Cj4gLXN0
YXRpYyBpbnQgX19pbml0IG1ha2VfdGltZXJfbm9kZShjb25zdCBzdHJ1Y3QgZG9tYWluICpkLCB2
b2lkICpmZHQpCj4gK3N0YXRpYyBpbnQgX19pbml0IG1ha2VfdGltZXJfbm9kZShjb25zdCBzdHJ1
Y3Qga2VybmVsX2luZm8gKmtpbmZvKQo+ICB7Cj4gKyAgICB2b2lkICpmZHQgPSBraW5mby0+ZmR0
Owo+ICAgICAgc3RhdGljIGNvbnN0IHN0cnVjdCBkdF9kZXZpY2VfbWF0Y2ggdGltZXJfaWRzW10g
X19pbml0Y29uc3QgPQo+ICAgICAgewo+ICAgICAgICAgIERUX01BVENIX0NPTVBBVElCTEUoImFy
bSxhcm12Ny10aW1lciIpLAo+IEBAIC0xMDE2LDcgKzEwMjAsNyBAQCBzdGF0aWMgaW50IF9faW5p
dCBtYWtlX3RpbWVyX25vZGUoY29uc3Qgc3RydWN0IGRvbWFpbiAqZCwgdm9pZCAqZmR0KQo+ICAg
ICAgZHRfZHByaW50aygiICBWaXJ0IGludGVycnVwdCAldVxuIiwgaXJxKTsKPiAgICAgIHNldF9p
bnRlcnJ1cHQoaW50cnNbMl0sIGlycSwgMHhmLCBEVF9JUlFfVFlQRV9MRVZFTF9MT1cpOwo+Cj4g
LSAgICByZXMgPSBmZHRfcHJvcGVydHlfaW50ZXJydXB0cyhmZHQsIGludHJzLCAzKTsKPiArICAg
IHJlcyA9IGZkdF9wcm9wZXJ0eV9pbnRlcnJ1cHRzKGtpbmZvLCBpbnRycywgMyk7Cj4gICAgICBp
ZiAoIHJlcyApCj4gICAgICAgICAgcmV0dXJuIHJlczsKPgo+IEBAIC0xMzc3LDcgKzEzODEsNyBA
QCBzdGF0aWMgaW50IF9faW5pdCBoYW5kbGVfbm9kZShzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3Qg
a2VybmVsX2luZm8gKmtpbmZvLAo+ICAgICAgaWYgKCBkZXZpY2VfZ2V0X2NsYXNzKG5vZGUpID09
IERFVklDRV9HSUMgKQo+ICAgICAgICAgIHJldHVybiBtYWtlX2dpY19ub2RlKGQsIGtpbmZvLT5m
ZHQsIG5vZGUpOwo+ICAgICAgaWYgKCBkdF9tYXRjaF9ub2RlKHRpbWVyX21hdGNoZXMsIG5vZGUp
ICkKPiAtICAgICAgICByZXR1cm4gbWFrZV90aW1lcl9ub2RlKGQsIGtpbmZvLT5mZHQpOwo+ICsg
ICAgICAgIHJldHVybiBtYWtlX3RpbWVyX25vZGUoa2luZm8pOwo+Cj4gICAgICAvKiBTa2lwIG5v
ZGVzIHVzZWQgYnkgWGVuICovCj4gICAgICBpZiAoIGR0X2RldmljZV91c2VkX2J5KG5vZGUpID09
IERPTUlEX1hFTiApCgoKLS0gClZvbG9keW15ciBCYWJjaHVrIGF0IEVQQU0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
