Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7EBC2081
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 14:18:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEuZK-0006oj-B8; Mon, 30 Sep 2019 12:14:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4uQZ=XZ=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1iEuZH-0006nz-Py
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 12:14:20 +0000
X-Inumbo-ID: d234e47e-e37b-11e9-8628-bc764e2007e4
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe05::626]) by localhost (Halon) with ESMTPS
 id d234e47e-e37b-11e9-8628-bc764e2007e4;
 Mon, 30 Sep 2019 12:14:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PQv6CVodWmHmdnMeH4BRyWeY4NwfIiKSHCMczCbkuBzMxMq+3OEURJrEJGLG+F+7SAolgMenO9T8MyickDTn7mr9tKU0HJujXgAp7MzqykiVWDVrtHJkZ+kUkQwXpOaAuyaPu9QUJX/vzwwzK5jUCoXOBZNqk7eKNe5tiWxziztkberdMY0Kzu7qVWSfC2eAdmrIsBQVIHqNYgTuMsNEPD7fbZLdqHUmewqzU/ZR+naqjeWJ736Uyzk7DbfGcR9RV99TAsjYP3jwLx3MUE4izgLb804beuNy21DpDw6na3i1cXeb0eTwVJ9PnyaiL2KfZsVQU1Y3ZIQ4jdX+Wat62w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZxQY73Bx9dG1oq0CYP0eA1KbyisQF10LdmQ27m5rwUM=;
 b=H8K5qFg6rQUNTezV79aL0rKfpos+rbZrmrIlE+uAT0qFa01BWbAaww7Eam+39RRWxm8B9UA+licGcklCCiLeR7Gi5otum9PBfKw6fXn32raM+JP77z53KrEc6QMT0dM0OG06AJaPomtcNJRhaK2bWBM0PZhvI2kHwmmaMhQiiFacOKJIjhcn5rju53aFIsHnrEbrULGX5Wx7BURlaj7tPzA+4G4iBjWS3EOm0fKDAsOUizcZ2LBv/xTYpFlWXS8emS/S4v6JF8j/C9502G8/FWkhnEEJNAp7IgzE+XuZR3mT1++0UyVA1TJU9ky/qLDW6bTe50XI1HHnRtxJvm3EHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZxQY73Bx9dG1oq0CYP0eA1KbyisQF10LdmQ27m5rwUM=;
 b=vZIb7TEG4EtGX2FMihMvj4yDxn5+nwOXQ9SO9W4EjpntDy1Z0CApMbf3I81FnN+kSymMBY+Bpcz4GGwQu5xbnuEv6B8ezCbkHn1A3cbSH8nydf4/XxzE4GCw1gP8shysCwgVKz4sXKwLfJwy5Mgi9hQhwtLnoQpt3eKI9n52Xvg=
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB6212.eurprd03.prod.outlook.com (10.186.174.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Mon, 30 Sep 2019 12:14:14 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::b084:971d:9e32:1b61]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::b084:971d:9e32:1b61%4]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 12:14:14 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH RFC for-4.13 04/10] xen/arm: Ensure the SSBD workaround
 is re-enabled right after exiting a guest
Thread-Index: AQHVdJmSz7FwOb+ZL0aIExPYLyfVU6dEJ/GA
Date: Mon, 30 Sep 2019 12:14:14 +0000
Message-ID: <87r23y3rsa.fsf@epam.com>
References: <20190926183808.11630-1-julien.grall@arm.com>
 <20190926183808.11630-5-julien.grall@arm.com>
In-Reply-To: <20190926183808.11630-5-julien.grall@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7a1a883f-bd42-4482-bcb0-08d7459fb5af
x-ms-traffictypediagnostic: AM0PR03MB6212:|AM0PR03MB6212:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR03MB62123836B2601F576BE6F6A4E6820@AM0PR03MB6212.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(376002)(396003)(136003)(366004)(199004)(189003)(305945005)(2906002)(8936002)(102836004)(7736002)(66446008)(66476007)(76116006)(66946007)(14454004)(6436002)(66556008)(256004)(229853002)(14444005)(6486002)(6916009)(6512007)(36756003)(3846002)(8676002)(6116002)(64756008)(316002)(107886003)(54906003)(81156014)(81166006)(2616005)(71190400001)(71200400001)(186003)(4326008)(25786009)(476003)(26005)(11346002)(6506007)(5660300002)(6246003)(80792005)(478600001)(99286004)(486006)(66066001)(446003)(76176011)(86362001)(55236004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB6212;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VMsJE2nAdUqsTBh25Z7QWwe/YYn+4yKEfGYEsGJnc022FBAhpYz/CVcF9PA94b3bT06kpCkdxf+On+ErsN0/jVYH8yQyoCohgyIJHbpfLsj2BAuM4CsLVij3SNMSVRSHZcPwTesTsQrsPiD6kvVeZY90vxMHIUoaZnQDVL6AJFTiz1ens7drLa6MyVtdijDmRYe+BJzQU0YeoGAzMKo9YwIoReXM8pba9c1YPNsatb/CaumA/odPFVJ5zD2jvoBdzbbnbdVXjguYU1CVl8nEogcGIi9FDphjtmUoYNr23dCOSgYJHVx4J5ExoGetsI27MjYYYP/1cakc+AIc532m79TlHNW6lE+WmyoLgCIBe+a0YsVN+JZN1rFZWRD4E3kwmqUwysTAnLDqOZLjmnpq7ivVgBiSI09AD1b4N+LlRmM=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a1a883f-bd42-4482-bcb0-08d7459fb5af
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 12:14:14.4435 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0bKup7YjHuoZmEmdvMW+Br5hxjd8iOC/9yBQNMwrS7HoF2QMhO17gDw+Cv5wMysDI+WYITB3q9sevnRGUKGgKPvSz/KAx7R2I/luaf5M2tY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6212
Subject: Re: [Xen-devel] [PATCH RFC for-4.13 04/10] xen/arm: Ensure the SSBD
 workaround is re-enabled right after exiting a guest
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
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrii Anisov <Andrii_Anisov@epam.com>,
 "andrii.anisov@gmail.com" <andrii.anisov@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CkhpIEp1bGllbiwKCkp1bGllbiBHcmFsbCB3cml0ZXM6Cgo+IEF0IHRoZSBtb21lbnQsIFNTQkQg
d29ya2Fyb3VuZCBpcyByZS1lbmFibGVkIGZvciBYZW4gYWZ0ZXIgaW50ZXJydXB0cwo+IGFyZSB1
bm1hc2tlZC4gVGhpcyBtZWFucyB3ZSBtYXkgZW5kIHVwIHRvIGV4ZWN1dGUgc29tZSBwYXJ0IG9m
IHRoZQo+IGh5cGVydmlzb3IgaWYgYW4gaW50ZXJydXB0IGlzIHJlY2VpdmVkIGJlZm9yZSB0aGUg
d29ya2Fyb3VuZCBpcwo+IHJlLWVuYWJsZWQuCj4KPiBBcyB0aGUgcmVzdCBvZiBlbnRlcl9oeXBl
cnZpc29yX2Zyb21fZ3Vlc3QoKSBkb2VzIG5vdCByZXF1aXJlIHRvIGhhdmUKPiBpbnRlcnJ1cHRz
IG1hc2tlZCwgdGhlIGZ1bmN0aW9uIGlzIG5vdyBzcGxpdCBpbiB0d28gcGFydHM6Cj4gICAgIDEp
IGVudGVyX2h5cGVydmlzb3JfZnJvbV9ndWVzdF9ub2lycSgpIGNhbGxlZCB3aXRoIGludGVycnVw
dHMKPiAgICAgICAgbWFza2VkLgoKVG8gc3VtbWFyaXplIG91ciBkaXNjdXNzaW9uIGluIHRoaXMg
bWFpbCB0aHJlYWQ6IHByb3ZpZGluZyB0aGF0IHlvdSdsbApyZW5hbWUgZW50ZXJfaHlwZXJ2aXNv
cl9mcm9tX2d1ZXN0X25vaXJxIHRvCmVudGVyX2h5cGVydmlzb3JfZnJvbV9ndWVzdF9wcmVpcnEo
KToKClJldmlld2VkLWJ5OiBWb2xvZHlteXIgQmFiY2h1ayA8dm9sb2R5bXlyX2JhYmNodWtAZXBh
bS5jb20+Cgo+ICAgICAyKSBlbnRlcl9oeXBlcnZpc29yX2Zyb21fZ3Vlc3QoKSBjYWxsZWQgd2l0
aCBpbnRlcnJ1cHRzIHVubWFza2VkLgo+Cj4gTm90ZSB0aGF0IHdoaWxlIGVudGVyX2h5cGVydmlz
b3JfZnJvbV9ndWVzdF9ub2lycSgpIGRvZXMgbm90IHVzZSB0aGUKPiBvbi1zdGFjayBjb250ZXh0
IHJlZ2lzdGVycywgaXQgaXMgc3RpbGwgcGFzc2VkIGFzIHBhcmFtZXRlciB0byBtYXRjaCB0aGUK
PiByZXN0IG9mIHRoZSBDIGZ1bmN0aW9ucyBjYWxsZWQgZnJvbSB0aGUgZW50cnkgcGF0aC4KPgo+
IEZpeGVzOiBhNzg5OGU0YzU5ICgieGVuL2FybTogQWRkIEFSQ0hfV09SS0FST1VORF8yIHN1cHBv
cnQgZm9yIGd1ZXN0cyIpCj4gUmVwb3J0ZWQtYnk6IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlz
b3ZAZXBhbS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxA
YXJtLmNvbT4KPgo+IC0tLQo+Cj4gTm90ZSB0aGUgQXJtMzIgY29kZSBoYXMgbm90IGJlZW4gY2hh
bmdlZCB5ZXQuIEkgYW0gYWxzbyBvcGVuIG9uIHR1cm4KPiBib3RoIGVudGVyX2h5cGVydmlzb3Jf
ZnJvbV9ndWVzdF9ub2lycSgpIGFuZCBlbnRlcl9oeXBlcnZpc29yX2Zyb20oKQo+IHRvIGZ1bmN0
aW9ucyBub3QgdGFraW5nIGFueSBwYXJhbWV0ZXJzLgo+IC0tLQo+ICB4ZW4vYXJjaC9hcm0vYXJt
NjQvZW50cnkuUyB8ICAyICsrCj4gIHhlbi9hcmNoL2FybS90cmFwcy5jICAgICAgIHwgMTYgKysr
KysrKysrKysrKy0tLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDMgZGVs
ZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FybTY0L2VudHJ5LlMgYi94
ZW4vYXJjaC9hcm0vYXJtNjQvZW50cnkuUwo+IGluZGV4IDllYWZhZTUxNmIuLjQ1OGQxMmYxODgg
MTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gvYXJtL2FybTY0L2VudHJ5LlMKPiArKysgYi94ZW4vYXJj
aC9hcm0vYXJtNjQvZW50cnkuUwo+IEBAIC0xNzMsNiArMTczLDggQEAKPiAgICAgICAgICBBTFRF
Uk5BVElWRSgiYmwgY2hlY2tfcGVuZGluZ192c2Vycm9yOyBjYm56IHgwLCAxZiIsCj4gICAgICAg
ICAgICAgICAgICAgICAgIm5vcDsgbm9wIiwKPiAgICAgICAgICAgICAgICAgICAgICBTS0lQX1NZ
TkNIUk9OSVpFX1NFUlJPUl9FTlRSWV9FWElUKQo+ICsgICAgICAgIG1vdiAgICAgeDAsIHNwCj4g
KyAgICAgICAgYmwgICAgICBlbnRlcl9oeXBlcnZpc29yX2Zyb21fZ3Vlc3Rfbm9pcnEKPiAgICAg
ICAgICBtc3IgICAgIGRhaWZjbHIsIFxpZmxhZ3MKPiAgICAgICAgICBtb3YgICAgIHgwLCBzcAo+
ICAgICAgICAgIGJsICAgICAgZW50ZXJfaHlwZXJ2aXNvcl9mcm9tX2d1ZXN0Cj4gZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL2FybS90cmFwcy5jIGIveGVuL2FyY2gvYXJtL3RyYXBzLmMKPiBpbmRleCAy
MGJhMzRlYzkxLi41ODQ4ZGQ4Mzk5IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS90cmFwcy5j
Cj4gKysrIGIveGVuL2FyY2gvYXJtL3RyYXBzLmMKPiBAQCAtMjAwNywxNiArMjAwNywyNiBAQCBz
dGF0aWMgaW5saW5lIGJvb2wgbmVlZHNfc3NiZF9mbGlwKHN0cnVjdCB2Y3B1ICp2KQo+ICB9Cj4K
PiAgLyoKPiAtICogQWN0aW9ucyB0aGF0IG5lZWRzIHRvIGJlIGRvbmUgYWZ0ZXIgZXhpdGluZyB0
aGUgZ3Vlc3QgYW5kIGJlZm9yZSBhbnkKPiAtICogcmVxdWVzdCBmcm9tIGl0IGlzIGhhbmRsZWQu
Cj4gKyAqIEFjdGlvbnMgdGhhdCBuZWVkcyB0byBiZSBkb25lIGFmdGVyIGV4aXRpbmcgdGhlIGd1
ZXN0IGFuZCBiZWZvcmUgdGhlCj4gKyAqIGludGVycnVwdHMgYXJlIHVubWFza2VkLgo+ICAgKi8K
PiAtdm9pZCBlbnRlcl9oeXBlcnZpc29yX2Zyb21fZ3Vlc3Qoc3RydWN0IGNwdV91c2VyX3JlZ3Mg
KnJlZ3MpCj4gK3ZvaWQgZW50ZXJfaHlwZXJ2aXNvcl9mcm9tX2d1ZXN0X25vaXJxKHN0cnVjdCBj
cHVfdXNlcl9yZWdzICpyZWdzKQo+ICB7Cj4gICAgICBzdHJ1Y3QgdmNwdSAqdiA9IGN1cnJlbnQ7
Cj4KPiAgICAgIC8qIElmIHRoZSBndWVzdCBoYXMgZGlzYWJsZWQgdGhlIHdvcmthcm91bmQsIGJy
aW5nIGl0IGJhY2sgb24uICovCj4gICAgICBpZiAoIG5lZWRzX3NzYmRfZmxpcCh2KSApCj4gICAg
ICAgICAgYXJtX3NtY2NjXzFfMV9zbWMoQVJNX1NNQ0NDX0FSQ0hfV09SS0FST1VORF8yX0ZJRCwg
MSwgTlVMTCk7Cj4gK30KPiArCj4gKy8qCj4gKyAqIEFjdGlvbnMgdGhhdCBuZWVkcyB0byBiZSBk
b25lIGFmdGVyIGV4aXRpbmcgdGhlIGd1ZXN0IGFuZCBiZWZvcmUgYW55Cj4gKyAqIHJlcXVlc3Qg
ZnJvbSBpdCBpcyBoYW5kbGVkLiBEZXBlbmRpbmcgb24gdGhlIGV4Y2VwdGlvbiB0cmFwLCB0aGlz
IG1heQo+ICsgKiBiZSBjYWxsZWQgd2l0aCBpbnRlcnJ1cHRzIHVubWFza2VkLgo+ICsgKi8KPiAr
dm9pZCBlbnRlcl9oeXBlcnZpc29yX2Zyb21fZ3Vlc3Qoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJl
Z3MpCj4gK3sKPiArICAgIHN0cnVjdCB2Y3B1ICp2ID0gY3VycmVudDsKPgo+ICAgICAgLyoKPiAg
ICAgICAqIElmIHdlIHBlbmRlZCBhIHZpcnR1YWwgYWJvcnQsIHByZXNlcnZlIGl0IHVudGlsIGl0
IGdldHMgY2xlYXJlZC4KCgotLQpWb2xvZHlteXIgQmFiY2h1ayBhdCBFUEFNCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
