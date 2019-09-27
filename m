Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E77CCC04E8
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 14:13:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDp5f-0004k5-0e; Fri, 27 Sep 2019 12:11:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=myEs=XW=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1iDp5c-0004k0-Rx
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 12:11:12 +0000
X-Inumbo-ID: e4ee0310-e11f-11e9-8628-bc764e2007e4
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe06::62c]) by localhost (Halon) with ESMTPS
 id e4ee0310-e11f-11e9-8628-bc764e2007e4;
 Fri, 27 Sep 2019 12:11:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RlVYFeRIPUgZO5rv1Mm4PKfjzgbSEvrQ3J9XLaG4fZuVnE6RuB5eRBBGvvR7jJXyMY0o1e+pSXpURJLOEEkfgI/BcKcyPd9lGHycBsHx5reKfeftRJRy4Xktr7kZ3Bk6wgDlT1QhiHHF9rmCthPpEk0Z9gS8N1MS3CFFH2Qby5ci/BnMZxZfRSPANkeJmMV8ZTcuULBhtgnjpSU2r1zQwcqrp5JS1Gv+9CY3PmIzXZ9O5YUYUAoWyZNG1pD20jFXXAf/GkTW66CBqc2gI0FKMFdpgZ0WJ2bj/iCKpVzgVPYHlGhR12uEjXz1MdIXDT1ZYACUs1TFzX/JetEHXZtX8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tE6l+xvr8bhJHy+hwLIl73fF9zVFiRDjNS6SIm9sEIY=;
 b=U/4jh0fer3fV9JRkJw/thQGn+Mgpw3TDYQlCaGvOXT57gRwzvts3Ucv6cBz5BQBB1nawW8HxIdFL+cOBorO4mdx5OM5hXjpyxVamaNBdCU2JVLrvuq3s4R24VHOjTNKKAFS02RR/wbx6yqGJCw5VQIehqSuHCfuZWaSaYgCcAPGsCicM2K2zVP/qIAhmMM23W+kMpSe1/3MY45KLUJQota/SAXGHNiQapsoVx3mGUJP3gBplsXN+w8gVnjFTbVGujvtHnMNMOL0WlR7wCt4vE/ZhW/32MT5Ks/cgyBU3cvc9zyRngVD3y8NtbrebN/ixqzeL6hF7HEPsqDsTo4AyMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tE6l+xvr8bhJHy+hwLIl73fF9zVFiRDjNS6SIm9sEIY=;
 b=j3+8KpoSsnuGlWRq2WdJ4KAzN0kGAp0sUSB6mvcLyMchbBsXwJ/uAl3rEndH0T4W12XKQNEA7aqjQHh/3MTSkRKAyT5j7L2uZZM8K2JEYWCq+OgKq9z9v39BkRJzSGgm2cLQkjGx1hMDikO4nJPOHDsE4EWflLTRBuLfFICg6A0=
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB4929.eurprd03.prod.outlook.com (20.178.83.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Fri, 27 Sep 2019 12:11:10 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a%5]) with mapi id 15.20.2199.015; Fri, 27 Sep 2019
 12:11:10 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH RFC for-4.13 09/10] xen/arm: asm: Replace use of
 ALTERNATIVE with alternative_if
Thread-Index: AQHVdJmUKBPyDG2egUGHFlJ2qkDBrKc/cBeA
Date: Fri, 27 Sep 2019 12:11:10 +0000
Message-ID: <87tv8y7xcy.fsf@epam.com>
References: <20190926183808.11630-1-julien.grall@arm.com>
 <20190926183808.11630-10-julien.grall@arm.com>
In-Reply-To: <20190926183808.11630-10-julien.grall@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dc87a300-8107-45c1-a508-08d74343c879
x-ms-traffictypediagnostic: AM0PR03MB4929:|AM0PR03MB4929:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR03MB4929B7401C0D149DC6258F99E6810@AM0PR03MB4929.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0173C6D4D5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(136003)(376002)(346002)(39860400002)(199004)(189003)(476003)(486006)(305945005)(14454004)(66066001)(2906002)(5660300002)(3846002)(36756003)(6116002)(8936002)(6916009)(71200400001)(71190400001)(80792005)(76176011)(6436002)(55236004)(102836004)(6486002)(6506007)(446003)(6246003)(107886003)(81166006)(81156014)(99286004)(76116006)(91956017)(6512007)(66446008)(64756008)(66556008)(66476007)(66946007)(4326008)(478600001)(2616005)(26005)(229853002)(7736002)(8676002)(186003)(25786009)(14444005)(54906003)(256004)(316002)(86362001)(11346002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB4929;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iwLaM0XB2XICkklaNo2APumBpksu5eecMTmGuCf+Bo2nQGRtSn5Cv9Sdny/dGboAt6pj4cq5pXqLSUxDxqnVgq54AVKmLvCa1Xv40kruHw10gtcq8CI57TIonmh8E3e9AfXfYbDLe+AG+kkhY5F7NoRfbGLuPAP5QfOO0BQP5cRRWra1giDU7rG71klHVPjsMlP4G36yaNSsyCpnoWaLvNmQn3j99fpt9ImG8JVWqRcXpGUhUL9OaSksTS4P6+GOKzQ5ilfm3j4jlcHEM5Fm4QdZU2eIXxCIx8J5ApfvO6WTVIc7pZF9m659RwrtOiexKIpwRUKGuPWHGsSDxn4F4aYB9LroW02uV/l1+vaDI0P1c1CM6Bo/O1wuvdF04tYSa7b1dTJpQ5qjogI8cYaQBJdSQBCIsNeyRj6nNMvRnHY=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc87a300-8107-45c1-a508-08d74343c879
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2019 12:11:10.0450 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uZxVXlltK4QlISoXHz4D7Srt6m77iNS+t2dCpyRM6ASuDeArrM3IDfe2+caC58IJcU+JTeqkVbtrOwMQ/REV3OOevZizWMmVUPBeUT9b/oQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4929
Subject: Re: [Xen-devel] [PATCH RFC for-4.13 09/10] xen/arm: asm: Replace
 use of ALTERNATIVE with alternative_if
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
 "andrii.anisov@gmail.com" <andrii.anisov@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpKdWxpZW4gR3JhbGwgd3JpdGVzOgoKPiBVc2luZyBhbHRlcm5hdGl2ZV9pZiBtYWtlcyB0aGUg
Y29kZSBhIGJpdCBtb3JlIHN0cmVhbWxpbmVkLgo+Cj4gVGFrZSB0aGUgb3Bwb3J0dW5pdHkgdG8g
dXNlIHRoZSBuZXcgYXV0by1ub3AgaW5mcmFzdHJ1Y3R1cmUgdG8gYXZvaWQKPiBjb3VudGluZyB0
aGUgbnVtYmVyIG9mIG5vcCBpbiB0aGUgZWxzZSBwYXJ0IGZvciBhcmNoL2FybS9hcm02NC9lbnRy
eS5TCj4KPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29t
Pgo+Cj4gLS0tCj4gICAgIFRoaXMgaXMgcHJldHR5IG11Y2ggYSBtYXR0ZXIgb2YgdGFzdGUsIGJ1
dCBhdCBsZWFzdCBmb3IgYXJtNjQgdGhpcwo+ICAgICBhbGxvd3MgdXMgdG8gdXNlIHRoZSBhdXRv
LW5vcCBpbmZyYXN0cnVjdHVyZS4gU28gdGhlIGFybTMyIGlzIG1vcmUKPiAgICAgdG8ga2VlcCBp
bmxpbmUgd2l0aCBhcm02NC4KPiAtLS0KPiAgeGVuL2FyY2gvYXJtL2FybTMyL2VudHJ5LlMgfCA5
ICsrKysrKy0tLQo+ICB4ZW4vYXJjaC9hcm0vYXJtNjQvZW50cnkuUyB8IDggKysrKystLS0KPiAg
MiBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+Cj4gZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9hcm0zMi9lbnRyeS5TIGIveGVuL2FyY2gvYXJtL2FybTMy
L2VudHJ5LlMKPiBpbmRleCAwYjRjZDE5YWJkLi4xNDI4Y2QzNTgzIDEwMDY0NAo+IC0tLSBhL3hl
bi9hcmNoL2FybS9hcm0zMi9lbnRyeS5TCj4gKysrIGIveGVuL2FyY2gvYXJtL2FybTMyL2VudHJ5
LlMKPiBAQCAtNjUsOSArNjUsMTIgQEAgc2F2ZV9ndWVzdF9yZWdzOgo+ICAgICAgICAgICAqIElm
IHRoZSBTS0lQX1NZTkNIUk9OSVpFX1NFUlJPUl9FTlRSWV9FWElUIGhhcyBiZWVuIHNldCBpbiB0
aGUgY3B1Cj4gICAgICAgICAgICogZmVhdHVyZSwgdGhlIGNoZWNraW5nIG9mIHBlbmRpbmcgU0Vy
cm9ycyB3aWxsIGJlIHNraXBwZWQuCj4gICAgICAgICAgICovCj4gLSAgICAgICAgQUxURVJOQVRJ
VkUoIm5vcCIsCj4gLSAgICAgICAgICAgICAgICAgICAgImIgc2tpcF9jaGVjayIsCj4gLSAgICAg
ICAgICAgICAgICAgICAgU0tJUF9TWU5DSFJPTklaRV9TRVJST1JfRU5UUllfRVhJVCkKPiArICAg
ICAgICBhbHRlcm5hdGl2ZV9pZiBTS0lQX1NZTkNIUk9OSVpFX1NFUlJPUl9FTlRSWV9FWElUCj4g
KyAgICAgICAgbm9wCj4gKyAgICAgICAgYWx0ZXJuYXRpdmVfZWxzZQo+ICsgICAgICAgIGIgICBz
a2lwX2NoZWNrCj4gKyAgICAgICAgYWx0ZXJuYXRpdmVfZW5kaWYKPiArCmZvciB0aGUgYXJtMzIg
Y29kZSB5b3UgY2FuIGhhdmUgbXkgci1iOgpSZXZpZXdlZC1CeTogVm9sb2R5bXlyIEJhYmNodWsg
PHZvbG9keW15cl9iYWJjaHVrQGVwYW0uY29tPgoKPiAgICAgICAgICAvKgo+ICAgICAgICAgICAq
IFN0YXJ0IHRvIGNoZWNrIHBlbmRpbmcgdmlydHVhbCBhYm9ydCBpbiB0aGUgZ2FwIG9mIEd1ZXN0
IC0+IEhZUAo+ICAgICAgICAgICAqIHdvcmxkIHN3aXRjaC4KPiBkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gvYXJtL2FybTY0L2VudHJ5LlMgYi94ZW4vYXJjaC9hcm0vYXJtNjQvZW50cnkuUwo+IGluZGV4
IDQ1OGQxMmYxODguLjkxY2Y2ZWU2ZjQgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gvYXJtL2FybTY0
L2VudHJ5LlMKPiArKysgYi94ZW4vYXJjaC9hcm0vYXJtNjQvZW50cnkuUwo+IEBAIC0xNzAsOSAr
MTcwLDExIEBACj4gICAgICAgICAgICogaXMgbm90IHNldC4gSWYgYSB2U0Vycm9yIHRvb2sgcGxh
Y2UsIHRoZSBpbml0aWFsIGV4Y2VwdGlvbiB3aWxsIGJlCj4gICAgICAgICAgICogc2tpcHBlZC4g
RXhpdCBBU0FQCj4gICAgICAgICAgICovCj4gLSAgICAgICAgQUxURVJOQVRJVkUoImJsIGNoZWNr
X3BlbmRpbmdfdnNlcnJvcjsgY2JueiB4MCwgMWYiLAo+IC0gICAgICAgICAgICAgICAgICAgICJu
b3A7IG5vcCIsCj4gLSAgICAgICAgICAgICAgICAgICAgU0tJUF9TWU5DSFJPTklaRV9TRVJST1Jf
RU5UUllfRVhJVCkKPiArICAgICAgICBhbHRlcm5hdGl2ZV9pZiBTS0lQX1NZTkNIUk9OSVpFX1NF
UlJPUl9FTlRSWV9FWElUCj4gKyAgICAgICAgYmwgICAgICBjaGVja19wZW5kaW5nX3ZzZXJyb3IK
PiArICAgICAgICBjYm56ICAgIHgwLCAxZgo+ICsgICAgICAgIGFsdGVybmF0aXZlX2Vsc2Vfbm9w
X2VuZGlmCj4gKwpZb3UgYXNrZWQgb3RoZXIgcGVvcGxlIHRvIGRvIG5vdCBpbnRyb2R1Y2UgbmV3
IGNvZGUgaW4gb25lIHBhdGNoIGFuZApyZXdyaXRlIGl0IGluIHRoZSBmb2xsb3dpbmcgcGF0Y2gu
IEJ1dCB0aGVyZSB5b3UgYXJlIGRvaW5nIGV4YWN0bHkgdGhlCnNhbWUuIEkgYmVsaWV2ZSwgaXQg
aXMgcG9zc2libGUgdG8gbW92ZSBhbGwgImFsdGVybmF0aXZlIiBwYXRjaGVzIHRvIHRoZQp2ZXJ5
IGJlZ2lubmluZyBvZiB0aGUgcGF0Y2ggc2VyaWVzIGFuZCBvbmx5IHRoZW4gaW50cm9kdWNlIG1h
Y3JvCmd1ZXN0X3ZlY3Rvci4KCj4gICAgICAgICAgbW92ICAgICB4MCwgc3AKPiAgICAgICAgICBi
bCAgICAgIGVudGVyX2h5cGVydmlzb3JfZnJvbV9ndWVzdF9ub2lycQo+ICAgICAgICAgIG1zciAg
ICAgZGFpZmNsciwgXGlmbGFncwoKCi0tClZvbG9keW15ciBCYWJjaHVrIGF0IEVQQU0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
