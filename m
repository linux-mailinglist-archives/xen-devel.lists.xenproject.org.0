Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFAD7C0D4
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 14:14:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsnS1-0006Nk-1c; Wed, 31 Jul 2019 12:11:25 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bdxT=V4=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hsnRz-0006NX-5z
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 12:11:23 +0000
X-Inumbo-ID: 4e6925ca-b38c-11e9-8980-bc764e045a96
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe05::62f])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4e6925ca-b38c-11e9-8980-bc764e045a96;
 Wed, 31 Jul 2019 12:11:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mnnXgqfl/TH8LNqzK+z/OEPR4FjdGfUmtGd1h13wsQgmFPe64me3JIG6SBa3DmyZhf9eUWpRW2CXqPBNSHbXodVq+SrF3jp2UjxFu4TKmxC/nBCWWVLu/LaCfPjs4v7kr2uj+QUMbMwYN4QSwxWGEEpBKMkQV1esEawxnJ3Kiw6cQNrafe2jKYZAA1WumJHwYtHWRNQy3+f8zuSxxMEYWvSoWJ/q6bZKCyDZ8QLvCpbhA4dnEy47cB3YobzFLPpJ+hXY3GWgEQKo36XeNDeWmQVUX25ikkEgTv2SkAe7qpwM5uCULNnplTWUgkKzS8xw9SRfQOFC7pmQ/xDPjS0Alw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3eRHnSRPU/xhFLsUs6WFj8Cw/WmddVMvwzz+8lOBQWo=;
 b=E0RLxoxDh6knPPPMYQH2p/BZVKWEqG26IdbNZLY3Gjj205fIyyZHZ5Bgu+EnwW58yOo82m6AYYb5j+inyNOJ5wyJpTS/W9RBzpzFoXdLpEPxeDZ2gCQRNBQUYk7i+1OE7k8W9lP2HPapqpcsirOQrSJ8ucYt4k4mpSsDWHJqClutsoGhkISEjYWAspXXzaP6uB+KjzUcVhhpoewOVjQ7BAzLM2hQQJHVaIwyHoR//jjJTZ2+77ilL8VK4VmcGIcdnzwLpsxlbSFb9K0SDT2pafAMOP4YCDc5YgBKzCq5KZbByKF1w/i+nOJmwZuf2B/CnapWPvDoUBsjqNgfA2FneQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=epam.com;dmarc=pass action=none header.from=epam.com;dkim=pass
 header.d=epam.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3eRHnSRPU/xhFLsUs6WFj8Cw/WmddVMvwzz+8lOBQWo=;
 b=YKc3UhDq+oi9KnWHX3nkpzZy/zp0T0LSTczennSXi9RtyTm/fNWtjf9FIYc8jn1cr8QOP93I/iUTBlGGsyI2bizxgPiHYdG2HEMC1JthjqkndlFgMgfFVU5emBQbrfuZ2wfySEI1MHLvu3UGr30ujTuGDkEOTakyCQBW7LoX/EPK+6QVLBQpOw2foT4qWOgb8MHxym3d0lnPwQ/lcPSxx2obYr0ZtSeBpJvYEHSLd3GZ2pKpdA3yfKTiUmPmM0arwyTuZ5Al+jNiTo17qkQ+Kfnm36+u+O0M9WAN943rDgYZ7SMI8s8xhJmFVtkO9JJ9prRmVmEPrkbCoWuxwGszYQ==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB4402.eurprd03.prod.outlook.com (20.176.215.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Wed, 31 Jul 2019 12:11:19 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c%5]) with mapi id 15.20.2115.005; Wed, 31 Jul 2019
 12:11:19 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Viktor Mitin <viktor.mitin.19@gmail.com>
Thread-Topic: [PATCH v4 1/2] xen/arm: extend fdt_property_interrupts
Thread-Index: AQHVR4rOQRnIDkWABEe8SmGVgU5Xn6bkowcA
Date: Wed, 31 Jul 2019 12:11:18 +0000
Message-ID: <878sseieu1.fsf@epam.com>
References: <20190731102856.23215-1-viktor.mitin.19@gmail.com>
In-Reply-To: <20190731102856.23215-1-viktor.mitin.19@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4acb9783-e3d2-4438-0212-08d715b031cd
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR03MB4402; 
x-ms-traffictypediagnostic: AM0PR03MB4402:|AM0PR03MB4402:
x-microsoft-antispam-prvs: <AM0PR03MB4402F2461DBE060ACBF7E1E9E6DF0@AM0PR03MB4402.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 011579F31F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(366004)(39860400002)(396003)(376002)(199004)(189003)(54906003)(66556008)(2906002)(446003)(66446008)(64756008)(478600001)(91956017)(86362001)(14444005)(5660300002)(76116006)(68736007)(71200400001)(66476007)(66946007)(305945005)(6512007)(11346002)(53936002)(256004)(80792005)(76176011)(71190400001)(2616005)(55236004)(476003)(66066001)(486006)(7736002)(6436002)(14454004)(186003)(81166006)(6246003)(8936002)(36756003)(6506007)(229853002)(25786009)(102836004)(6486002)(3846002)(8676002)(81156014)(107886003)(4326008)(26005)(316002)(6916009)(99286004)(6116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB4402;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: MYSBwCLMtUG3z5czaDu83KclZquKqjSv/XQuQo9goatusGCMEatR3yOQR4D4HwXhZtcPojjhzg/1LFgQwko8IpzFb3FnG4107B2tkYgSjjoHRoAY3A/R4rfMAmEqsZGTIkis7e/lry+H7sG/ThoC96OlIL0kA6zSkHfWF3YXboxVlT97IuutuXrok2gS6D5MZErXPbKgl/OWPFLIOlySYd4EhOeeKucr8TIzauuXY1h0NuR+Ka5DZplGlUgrLpXKd4osFjZ+EBf/k39jELEJc3UrUooBsTdyPPZK6If2P5ymdPTbKG++GiL7g5if20MMD6QYtTNaLFSYmTkKr3P3qN9RwfUR3clPmsruVfhPKpN7gv6ObxJy8ipXjBcIrh8BWEOjKDqbnyyjFh9UvGFFX51fa9/GNDEDs7UlF6lP1x8=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4acb9783-e3d2-4438-0212-08d715b031cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2019 12:11:18.8741 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Volodymyr_Babchuk@epam.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4402
Subject: Re: [Xen-devel] [PATCH v4 1/2] xen/arm: extend
 fdt_property_interrupts
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

CkhpIFZpa3RvciwKCkl0IGlzIHJlY29tbWVuZGVkIChhbmQgcHJvYmFibHkgcmVxdWlyZWQsIGJ1
dCBJIGNhbid0IGZpbmQgZXhhY3QgcGxhY2UKaW4gdGhlIHJ1bGVzKSB0byBpbmNsdWRlIGNvdmVy
IGxldHRlciBpZiB5b3UgYXJlIHNlbmRpbmcgbW9yZSB0aGF0IG9uZQpwYXRjaCBpbiBzZXJpZXMu
IFRoaXMgd2lsbCBlYXNlIHVwIHJldmlldyBwcm9jZXNzLCBiZWNhdXNlIHJldmlld2VyIHdpbGwK
a25vdyB3aGF0IHRvIGV4cGVjdCBpbiB0aGUgc2VyaWVzLgoKVmlrdG9yIE1pdGluIHdyaXRlczoK
Cj4gRXh0ZW5kIGZkdF9wcm9wZXJ0eV9pbnRlcnJ1cHRzIHRvIGRlYWwgd2l0aCBvdGhlciBkb21h
aW4gdGhhbiB0aGUgaHdkb20uCj4KPiBUaGUgcHJvdG90eXBlIG9mIGZkdF9wcm9wZXJ0eV9pbnRl
cnJ1cHRzKCkgaGFzIGJlZW4gbW9kaWZpZWQKPiB0byBzdXBwb3J0IGJvdGggaHdkb20gYW5kIGRv
bVUgaW4gb25lIGZ1bmN0aW9uLgo+Cj4gVGhpcyBpcyBhIHByZXBhcmF0b3J5IGZvciB0aGUgcGF0
Y2ggInhlbi9hcm06IG1lcmdlIG1ha2VfdGltZXJfbm9kZSBhbmQKPiBtYWtlX3RpbWVyX2RvbVVf
bm9kZSIuIE9yaWdpbmFsIGdvYWwgaXMgdG8gbWVyZ2UgbWFrZV90aW1lcl9ub2RlIGFuZAo+IG1h
a2VfdGltZXJfZG9tVV9ub2RlIGZ1bmN0aW9ucy4gU2VlIGRpc2N1c3Npb24gaW4gZS1tYWlsLCB0
aGUgTWVzc2FnZS1JRCBpczoKPiA8MjAxOTA2MjAxMDM4MDUuOTI3LTEtdmlrdG9yLm1pdGluLjE5
QGdtYWlsLmNvbT4KPgo+IE5vdGU6IHRoZXJlIGlzIG5vIGZ1bmN0aW9uYWwgY2hhbmdlcyBpbnRy
b2R1Y2VkIGJ5IHRoaXMgcGF0Y2guClRoaXMgaXMgbm90IGNvbXBsZXRlbHkgdHJ1ZSwgYmVjYXVz
ZSB5b3UgY2hhbmdlIHRoZSB3YXkgaG93IHBoYW5kbGUgaXMKcmV0cmlldmVkLiBBbHNvLCBlYXJs
aWVyIHlvdSBzYWlkIHRoYXQgImZkdF9wcm9wZXJ0eV9pbnRlcnJ1cHRzKCkgaGFzCmJlZW4gbW9k
aWZpZWQgdG8gc3VwcG9ydCBib3RoIGh3ZG9tIGFuZCBkb21VIGluIG9uZSBmdW5jdGlvbiIuIFRo
aXMgaXMKdGhlIGZ1bmN0aW9uYWwgY2hhbmdlLgoKPgo+IFN1Z2dlc3RlZC1ieTogSnVsaWVuIEdy
YWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBWaWt0b3IgTWl0aW4g
PHZpa3Rvcl9taXRpbkBlcGFtLmNvbT4KPiAtLS0KPiAgeGVuL2FyY2gvYXJtL2RvbWFpbl9idWls
ZC5jIHwgMjIgKysrKysrKysrKysrKy0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTMgaW5z
ZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0v
ZG9tYWluX2J1aWxkLmMgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKPiBpbmRleCA0Yzg0
MDQxNTVhLi5kMDRhMWMzYWVjIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVp
bGQuYwo+ICsrKyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwo+IEBAIC02MjEsMTcgKzYy
MSwxOSBAQCBzdGF0aWMgdm9pZCBfX2luaXQgc2V0X2ludGVycnVwdChnaWNfaW50ZXJydXB0X3Qg
aW50ZXJydXB0LAo+ICAgKiAgImludGVycnVwdHMiOiBjb250YWlucyB0aGUgbGlzdCBvZiBpbnRl
cnJ1cHRzCj4gICAqICAiaW50ZXJydXB0LXBhcmVudCI6IGxpbmsgdG8gdGhlIEdJQwo+ICAgKi8K
PiAtc3RhdGljIGludCBfX2luaXQgZmR0X3Byb3BlcnR5X2ludGVycnVwdHModm9pZCAqZmR0LCBn
aWNfaW50ZXJydXB0X3QgKmludHIsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHVuc2lnbmVkIG51bV9pcnEpCj4gK3N0YXRpYyBpbnQgX19pbml0IGZkdF9wcm9w
ZXJ0eV9pbnRlcnJ1cHRzKGNvbnN0IHN0cnVjdCBrZXJuZWxfaW5mbyAqa2luZm8sCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBnaWNfaW50ZXJydXB0X3QgKmludHIsIHVuc2lnbmVkIG51
bV9pcnEpCkFzIEkgc2FpZCBlYXJsaWVyLCB0aGlzIGZvcm1hdHRpbmcgY29udHJhZGljdHMgd2l0
aCB0aGUgY29kaW5nIHN0eWxlLgoKPiAgewo+ICAgICAgaW50IHJlczsKPiArICAgIHVpbnQzMl90
IHBoYW5kbGUgPSBpc19oYXJkd2FyZV9kb21haW4oa2luZm8tPmQpID8KPiArICAgICAgICAgICAg
ICAgICAgICAgICBkdF9pbnRlcnJ1cHRfY29udHJvbGxlci0+cGhhbmRsZSA6IEdVRVNUX1BIQU5E
TEVfR0lDOwo+Cj4gLSAgICByZXMgPSBmZHRfcHJvcGVydHkoZmR0LCAiaW50ZXJydXB0cyIsIGlu
dHIsIHNpemVvZiAoaW50clswXSkgKiBudW1faXJxKTsKPiArICAgIHJlcyA9IGZkdF9wcm9wZXJ0
eShraW5mby0+ZmR0LCAiaW50ZXJydXB0cyIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgaW50
ciwgc2l6ZW9mIChpbnRyWzBdKSAqIG51bV9pcnEpOwo+ICAgICAgaWYgKCByZXMgKQo+ICAgICAg
ICAgIHJldHVybiByZXM7Cj4KPiAtICAgIHJlcyA9IGZkdF9wcm9wZXJ0eV9jZWxsKGZkdCwgImlu
dGVycnVwdC1wYXJlbnQiLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgZHRfaW50ZXJy
dXB0X2NvbnRyb2xsZXItPnBoYW5kbGUpOwo+ICsgICAgcmVzID0gZmR0X3Byb3BlcnR5X2NlbGwo
a2luZm8tPmZkdCwgImludGVycnVwdC1wYXJlbnQiLCBwaGFuZGxlKTsKPgo+ICAgICAgcmV0dXJu
IHJlczsKPiAgfQo+IEBAIC03MzMsNyArNzM1LDcgQEAgc3RhdGljIGludCBfX2luaXQgbWFrZV9o
eXBlcnZpc29yX25vZGUoc3RydWN0IGRvbWFpbiAqZCwKPiAgICAgICAqICBUT0RPOiBIYW5kbGUg
cHJvcGVybHkgdGhlIGNwdW1hc2s7Cj4gICAgICAgKi8KPiAgICAgIHNldF9pbnRlcnJ1cHQoaW50
ciwgZC0+YXJjaC5ldnRjaG5faXJxLCAweGYsIERUX0lSUV9UWVBFX0xFVkVMX0xPVyk7Cj4gLSAg
ICByZXMgPSBmZHRfcHJvcGVydHlfaW50ZXJydXB0cyhmZHQsICZpbnRyLCAxKTsKPiArICAgIHJl
cyA9IGZkdF9wcm9wZXJ0eV9pbnRlcnJ1cHRzKGtpbmZvLCAmaW50ciwgMSk7Cj4gICAgICBpZiAo
IHJlcyApCj4gICAgICAgICAgcmV0dXJuIHJlczsKPgo+IEBAIC05NjAsOCArOTYyLDEwIEBAIHN0
YXRpYyBpbnQgX19pbml0IG1ha2VfZ2ljX25vZGUoY29uc3Qgc3RydWN0IGRvbWFpbiAqZCwgdm9p
ZCAqZmR0LAo+ICAgICAgcmV0dXJuIHJlczsKPiAgfQo+Cj4gLXN0YXRpYyBpbnQgX19pbml0IG1h
a2VfdGltZXJfbm9kZShjb25zdCBzdHJ1Y3QgZG9tYWluICpkLCB2b2lkICpmZHQpCj4gK3N0YXRp
YyBpbnQgX19pbml0IG1ha2VfdGltZXJfbm9kZShjb25zdCBzdHJ1Y3Qga2VybmVsX2luZm8gKmtp
bmZvKQo+ICB7Cj4gKyAgICB2b2lkICpmZHQgPSBraW5mby0+ZmR0Owo+ICsKTm8gbmVlZCBmb3Ig
ZW1wdHkgbGluZSB0aGVyZS4KCj4gICAgICBzdGF0aWMgY29uc3Qgc3RydWN0IGR0X2RldmljZV9t
YXRjaCB0aW1lcl9pZHNbXSBfX2luaXRjb25zdCA9Cj4gICAgICB7Cj4gICAgICAgICAgRFRfTUFU
Q0hfQ09NUEFUSUJMRSgiYXJtLGFybXY3LXRpbWVyIiksCj4gQEAgLTEwMTYsNyArMTAyMCw3IEBA
IHN0YXRpYyBpbnQgX19pbml0IG1ha2VfdGltZXJfbm9kZShjb25zdCBzdHJ1Y3QgZG9tYWluICpk
LCB2b2lkICpmZHQpCj4gICAgICBkdF9kcHJpbnRrKCIgIFZpcnQgaW50ZXJydXB0ICV1XG4iLCBp
cnEpOwo+ICAgICAgc2V0X2ludGVycnVwdChpbnRyc1syXSwgaXJxLCAweGYsIERUX0lSUV9UWVBF
X0xFVkVMX0xPVyk7Cj4KPiAtICAgIHJlcyA9IGZkdF9wcm9wZXJ0eV9pbnRlcnJ1cHRzKGZkdCwg
aW50cnMsIDMpOwo+ICsgICAgcmVzID0gZmR0X3Byb3BlcnR5X2ludGVycnVwdHMoa2luZm8sIGlu
dHJzLCAzKTsKPiAgICAgIGlmICggcmVzICkKPiAgICAgICAgICByZXR1cm4gcmVzOwo+Cj4gQEAg
LTEzNzcsNyArMTM4MSw3IEBAIHN0YXRpYyBpbnQgX19pbml0IGhhbmRsZV9ub2RlKHN0cnVjdCBk
b21haW4gKmQsIHN0cnVjdCBrZXJuZWxfaW5mbyAqa2luZm8sCj4gICAgICBpZiAoIGRldmljZV9n
ZXRfY2xhc3Mobm9kZSkgPT0gREVWSUNFX0dJQyApCj4gICAgICAgICAgcmV0dXJuIG1ha2VfZ2lj
X25vZGUoZCwga2luZm8tPmZkdCwgbm9kZSk7Cj4gICAgICBpZiAoIGR0X21hdGNoX25vZGUodGlt
ZXJfbWF0Y2hlcywgbm9kZSkgKQo+IC0gICAgICAgIHJldHVybiBtYWtlX3RpbWVyX25vZGUoZCwg
a2luZm8tPmZkdCk7Cj4gKyAgICAgICAgcmV0dXJuIG1ha2VfdGltZXJfbm9kZShraW5mbyk7Cj4K
PiAgICAgIC8qIFNraXAgbm9kZXMgdXNlZCBieSBYZW4gKi8KPiAgICAgIGlmICggZHRfZGV2aWNl
X3VzZWRfYnkobm9kZSkgPT0gRE9NSURfWEVOICkKCgotLQpWb2xvZHlteXIgQmFiY2h1ayBhdCBF
UEFNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
