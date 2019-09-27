Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4732EC05A0
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 14:49:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDpdi-0000Wp-7y; Fri, 27 Sep 2019 12:46:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=myEs=XW=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1iDpdg-0000Wc-1H
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 12:46:24 +0000
X-Inumbo-ID: cf323e60-e124-11e9-9677-12813bfff9fa
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.2.77]) by localhost (Halon) with ESMTPS
 id cf323e60-e124-11e9-9677-12813bfff9fa;
 Fri, 27 Sep 2019 12:46:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YP/8mT5EvlapG1h7rXxbKtjU4V9WRgMs0mgCP1ZuleOwIi50LCnTz3/PS9Q9buL1gK24sSOtVFqm/2M5B5R7tEqFNVP/Wp9fqrSG3OVrFwlEkrFL11AY5PTQ2v3X3pXfKH0dfGgOUS1KqAY0Llp651bq3j6BH39h2j9OTDkgTT02X0r1Te8rlCqcld8W2Qou50LnNE1PhmNhov2CIXmVdZ7lwfzjSggVdDEdZQRTr4tYbaDMKJV4XMqjFW9PHY0Vyp0m+EHzMPbc8zZ9nracSRVON2BHpDXjxvHLzgl+ox1x40VmuAbJxAbsDcbIzsUwoIn+iZUQx3+O0Ey2fmdptw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kGK1XuowLHQOGv4uEpjpTnc7j0tQSk+nsgQ9cQb0UJM=;
 b=PdDEJ/1YhZ6+Edfd2pEjKEn9hWgN78cqMynF/yhHMJN+10EnZYmNgYSpXqv/qw1I/k+wrb+VPfCKX/QMdOlWL0WA+YcB86O3caGKkkhMr9I9nzTl68dqb+NIb4VazE7/7RLCvMx1sHXAGh3YJBKKnzVZgCgREXwl9WiSBkV6MQjScT11y88m9AsLE06X+Cp2eD2XfAWDBu42xbMaSQ37ZP5SXwxOEPYvVgwNONfu6MtQfLgls3lf8f1hca6T417/vgXaAtu7XV6oKwGxjNS9w5iZiWfFnk7Ogzk1hIYtyUUlsRNOFWpajkg0RvTNhbKMTCAepNZgaJPbEgSlTZbX6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kGK1XuowLHQOGv4uEpjpTnc7j0tQSk+nsgQ9cQb0UJM=;
 b=A7R4InR9LvoUkl5OyWgoKVzw3y57wPwEOYOOBvH2H6Kmy5Fqfqj1xEUA5hcfl+clNLaUVBSINU7Zd4IlBvcYpHczhKUV9nFVixnNIgAO/HsJlqzwM+OIJSltiyh1VKxkjCBUPrsbYQqguxwmmBWt+pJjqwsPyQ+7tTbxPQK7h7c=
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB3506.eurprd03.prod.outlook.com (52.134.80.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Fri, 27 Sep 2019 12:46:21 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a%5]) with mapi id 15.20.2199.015; Fri, 27 Sep 2019
 12:46:21 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH RFC for-4.13 09/10] xen/arm: asm: Replace use of
 ALTERNATIVE with alternative_if
Thread-Index: AQHVdJmUKBPyDG2egUGHFlJ2qkDBrKc/cBeAgAAGYgCAAANzAA==
Date: Fri, 27 Sep 2019 12:46:20 +0000
Message-ID: <87pnjl9aar.fsf@epam.com>
References: <20190926183808.11630-1-julien.grall@arm.com>
 <20190926183808.11630-10-julien.grall@arm.com> <87tv8y7xcy.fsf@epam.com>
 <39072273-7237-c10d-ca1f-8f9f706895b6@arm.com>
In-Reply-To: <39072273-7237-c10d-ca1f-8f9f706895b6@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c21c8982-ed53-4566-c1cd-08d74348b2ae
x-ms-traffictypediagnostic: AM0PR03MB3506:|AM0PR03MB3506:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR03MB35063CEAC18AC321EF8D4E9AE6810@AM0PR03MB3506.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0173C6D4D5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(346002)(39860400002)(376002)(366004)(189003)(199004)(7736002)(6436002)(486006)(6512007)(6486002)(11346002)(2616005)(25786009)(446003)(476003)(229853002)(36756003)(71190400001)(26005)(53546011)(6506007)(55236004)(99286004)(71200400001)(3846002)(6116002)(102836004)(80792005)(5660300002)(76176011)(6246003)(186003)(2906002)(4326008)(478600001)(316002)(54906003)(305945005)(81156014)(81166006)(86362001)(8676002)(14454004)(64756008)(66946007)(66446008)(66556008)(76116006)(14444005)(256004)(66476007)(66066001)(8936002)(91956017)(6916009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB3506;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: o5GR2j/qWw2oGps0ErAiRpSVPJkcQn1d3m3mB5KqVjISCwgTRrCfiuNCtbdNGpgW387qLZG9uZFZqhbKuyvYEWVeturwiJ70e4fRvAoRQvVSlCkyLoCYGo3qIBmZAu1OK53Bbk/X+RQjPo/bEV/0isE+RZn3Uv24fOvcEsgvQTBtNvLbhBMJkUYCPwDA6DB63w84z1tX1WZq+CkirlDhuPHenkAAuMphTStLx8Tya9ecaT5+ug+ersuONrYJYCy0p9Ggf6TlUta//6Q47jdLGPaViN9ruTZKEzDD5hzODHn7c+iaOaAFeOBzoegjLHDSaaKQOW4x5Vo8sTX4xBiH0gZXnYU0lmq1Q2fvDdiAMQ8uSyWYZI7ASksjz0f98oxN3Eh4KS1ie4bASCpaIeG333kasdLrMIP5Mc+GxIpWqws=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c21c8982-ed53-4566-c1cd-08d74348b2ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2019 12:46:20.9838 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DK9NjYIinGd1BcmUi2s9dXOEUL1WDQd6cFoMAgBv7eq8a2tJL8xEjgf578l64PrQTu77P9bc1xDRxZ/heacB9adV609aYwQOm8hd6Eo6Wdc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB3506
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

Ckp1bGllbiBHcmFsbCB3cml0ZXM6Cgo+IEhpLAo+Cj4gT24gMjcvMDkvMjAxOSAxMzoxMSwgVm9s
b2R5bXlyIEJhYmNodWsgd3JvdGU6Cj4+Cj4+Cj4+IEp1bGllbiBHcmFsbCB3cml0ZXM6Cj4+Cj4+
PiBVc2luZyBhbHRlcm5hdGl2ZV9pZiBtYWtlcyB0aGUgY29kZSBhIGJpdCBtb3JlIHN0cmVhbWxp
bmVkLgo+Pj4KPj4+IFRha2UgdGhlIG9wcG9ydHVuaXR5IHRvIHVzZSB0aGUgbmV3IGF1dG8tbm9w
IGluZnJhc3RydWN0dXJlIHRvIGF2b2lkCj4+PiBjb3VudGluZyB0aGUgbnVtYmVyIG9mIG5vcCBp
biB0aGUgZWxzZSBwYXJ0IGZvciBhcmNoL2FybS9hcm02NC9lbnRyeS5TCj4+Pgo+Pj4gU2lnbmVk
LW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPj4+Cj4+PiAtLS0K
Pj4+ICAgICAgVGhpcyBpcyBwcmV0dHkgbXVjaCBhIG1hdHRlciBvZiB0YXN0ZSwgYnV0IGF0IGxl
YXN0IGZvciBhcm02NCB0aGlzCj4+PiAgICAgIGFsbG93cyB1cyB0byB1c2UgdGhlIGF1dG8tbm9w
IGluZnJhc3RydWN0dXJlLiBTbyB0aGUgYXJtMzIgaXMgbW9yZQo+Pj4gICAgICB0byBrZWVwIGlu
bGluZSB3aXRoIGFybTY0Lgo+Pj4gLS0tCj4+PiAgIHhlbi9hcmNoL2FybS9hcm0zMi9lbnRyeS5T
IHwgOSArKysrKystLS0KPj4+ICAgeGVuL2FyY2gvYXJtL2FybTY0L2VudHJ5LlMgfCA4ICsrKysr
LS0tCj4+PiAgIDIgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMo
LSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FybTMyL2VudHJ5LlMgYi94ZW4v
YXJjaC9hcm0vYXJtMzIvZW50cnkuUwo+Pj4gaW5kZXggMGI0Y2QxOWFiZC4uMTQyOGNkMzU4MyAx
MDA2NDQKPj4+IC0tLSBhL3hlbi9hcmNoL2FybS9hcm0zMi9lbnRyeS5TCj4+PiArKysgYi94ZW4v
YXJjaC9hcm0vYXJtMzIvZW50cnkuUwo+Pj4gQEAgLTY1LDkgKzY1LDEyIEBAIHNhdmVfZ3Vlc3Rf
cmVnczoKPj4+ICAgICAgICAgICAgKiBJZiB0aGUgU0tJUF9TWU5DSFJPTklaRV9TRVJST1JfRU5U
UllfRVhJVCBoYXMgYmVlbiBzZXQgaW4gdGhlIGNwdQo+Pj4gICAgICAgICAgICAqIGZlYXR1cmUs
IHRoZSBjaGVja2luZyBvZiBwZW5kaW5nIFNFcnJvcnMgd2lsbCBiZSBza2lwcGVkLgo+Pj4gICAg
ICAgICAgICAqLwo+Pj4gLSAgICAgICAgQUxURVJOQVRJVkUoIm5vcCIsCj4+PiAtICAgICAgICAg
ICAgICAgICAgICAiYiBza2lwX2NoZWNrIiwKPj4+IC0gICAgICAgICAgICAgICAgICAgIFNLSVBf
U1lOQ0hST05JWkVfU0VSUk9SX0VOVFJZX0VYSVQpCj4+PiArICAgICAgICBhbHRlcm5hdGl2ZV9p
ZiBTS0lQX1NZTkNIUk9OSVpFX1NFUlJPUl9FTlRSWV9FWElUCj4+PiArICAgICAgICBub3AKPj4+
ICsgICAgICAgIGFsdGVybmF0aXZlX2Vsc2UKPj4+ICsgICAgICAgIGIgICBza2lwX2NoZWNrCj4+
PiArICAgICAgICBhbHRlcm5hdGl2ZV9lbmRpZgo+Pj4gKwo+PiBmb3IgdGhlIGFybTMyIGNvZGUg
eW91IGNhbiBoYXZlIG15IHItYjoKPj4gUmV2aWV3ZWQtQnk6IFZvbG9keW15ciBCYWJjaHVrIDx2
b2xvZHlteXJfYmFiY2h1a0BlcGFtLmNvbT4KPj4KPj4+ICAgICAgICAgICAvKgo+Pj4gICAgICAg
ICAgICAqIFN0YXJ0IHRvIGNoZWNrIHBlbmRpbmcgdmlydHVhbCBhYm9ydCBpbiB0aGUgZ2FwIG9m
IEd1ZXN0IC0+IEhZUAo+Pj4gICAgICAgICAgICAqIHdvcmxkIHN3aXRjaC4KPj4+IGRpZmYgLS1n
aXQgYS94ZW4vYXJjaC9hcm0vYXJtNjQvZW50cnkuUyBiL3hlbi9hcmNoL2FybS9hcm02NC9lbnRy
eS5TCj4+PiBpbmRleCA0NThkMTJmMTg4Li45MWNmNmVlNmY0IDEwMDY0NAo+Pj4gLS0tIGEveGVu
L2FyY2gvYXJtL2FybTY0L2VudHJ5LlMKPj4+ICsrKyBiL3hlbi9hcmNoL2FybS9hcm02NC9lbnRy
eS5TCj4+PiBAQCAtMTcwLDkgKzE3MCwxMSBAQAo+Pj4gICAgICAgICAgICAqIGlzIG5vdCBzZXQu
IElmIGEgdlNFcnJvciB0b29rIHBsYWNlLCB0aGUgaW5pdGlhbCBleGNlcHRpb24gd2lsbCBiZQo+
Pj4gICAgICAgICAgICAqIHNraXBwZWQuIEV4aXQgQVNBUAo+Pj4gICAgICAgICAgICAqLwo+Pj4g
LSAgICAgICAgQUxURVJOQVRJVkUoImJsIGNoZWNrX3BlbmRpbmdfdnNlcnJvcjsgY2JueiB4MCwg
MWYiLAo+Pj4gLSAgICAgICAgICAgICAgICAgICAgIm5vcDsgbm9wIiwKPj4+IC0gICAgICAgICAg
ICAgICAgICAgIFNLSVBfU1lOQ0hST05JWkVfU0VSUk9SX0VOVFJZX0VYSVQpCj4+PiArICAgICAg
ICBhbHRlcm5hdGl2ZV9pZiBTS0lQX1NZTkNIUk9OSVpFX1NFUlJPUl9FTlRSWV9FWElUCj4+PiAr
ICAgICAgICBibCAgICAgIGNoZWNrX3BlbmRpbmdfdnNlcnJvcgo+Pj4gKyAgICAgICAgY2JueiAg
ICB4MCwgMWYKPj4+ICsgICAgICAgIGFsdGVybmF0aXZlX2Vsc2Vfbm9wX2VuZGlmCj4+PiArCj4+
IFlvdSBhc2tlZCBvdGhlciBwZW9wbGUgdG8gZG8gbm90IGludHJvZHVjZSBuZXcgY29kZSBpbiBv
bmUgcGF0Y2ggYW5kCj4+IHJld3JpdGUgaXQgaW4gdGhlIGZvbGxvd2luZyBwYXRjaC4gQnV0IHRo
ZXJlIHlvdSBhcmUgZG9pbmcgZXhhY3RseSB0aGUKPj4gc2FtZS4KPgo+IFRoaXMgaXMgYSBmYWly
bHkgYm9yZGVybGluZSBjb21tZW50IGtub3dpbmcgdGhhdCBJIHVzdWFsbHkgZG9uJ3QKPiByZXF1
ZXN0IGNsZWFuLXVwIGFuZCBjb2RlIGNvbnNvbGlkYXRpb24gaW4gdGhlIHNhbWUgcGF0Y2guCkkg
dW5kZXJzdGFuZCB0aGlzLiBBbHNvIEkgdW5kZXJzdGFuZCB3aHkgYXJlIHlvdSBhc2tpbmcgZm9y
IGNsZWFuLXVwLgpObyBvbmUgbGlrZXMgdG8gcmV2aWV3IHRoZSBzYW1lIGNvZGUgdHdpY2UuCgpB
bnl3YXlzLCBJIG5vdCB3YW50ZWQgdG8gYmUgb2ZmZW5zaXZlLiBTb3JyeSBmb3IgdGhhdC4KCgo+
PiBJIGJlbGlldmUsIGl0IGlzIHBvc3NpYmxlIHRvIG1vdmUgYWxsICJhbHRlcm5hdGl2ZSIgcGF0
Y2hlcyB0byB0aGUKPj4gdmVyeSBiZWdpbm5pbmcgb2YgdGhlIHBhdGNoIHNlcmllcyBhbmQgb25s
eSB0aGVuIGludHJvZHVjZSBtYWNybwo+PiBndWVzdF92ZWN0b3IuCj4KPiBGb3IgYSBmaXJzdCwg
dGhlIGZpcnN0IHBhdGNoIGlzIGRlZmluaXRlbHkgbm90IG5ldyBjb2RlLiBUaGlzIGlzIGNvZGUK
PiBjb25zb2xpZGF0aW9uIGFuZCB0aGVyZWZvcmUgSSBkb24ndCB0ZW5kIHRvIG1peCB0aGUgdHdv
IGZvcgo+IGNsYXJpdHkuIFNvIHRoaXMgc2hvdWxkIGhhdmUgYmVlbiBhIHBhdGNoIGJlZm9yZSB0
aGUgZmlyc3QgcGF0Y2guCj4KPiBTZWNvbmRseSwgdGhlIGZpcnN0IDQgcGF0Y2hlcyBhcmUgY2Fu
ZGlkYXRlIGZvciBiYWNrcG9ydC4gVGhlIHJlc3Qgb2YKPiB0aGUgc2VyaWVzIHdvdWxkIGJlIGdv
b2QgdG8gYmFja3BvcnQgYnV0IEkgYW0gbm90IGF3YXJlIG9mIGEgY3JpdGljYWwKPiBpc3N1ZSBp
biBwcmV2aW91cyBYZW4gcmVsZWFzZSB0byBzdHJvbmdseSBwdXNoIGZvciBpdC4KSSBzZWUuIFll
cywgSSdtIGFsd2F5cyBmb3JnZXR0aW5nIGFib3V0IGJhY2twb3J0aW5nIDooClNvLCBmb3IgdGhl
IHJlc3Qgb2YgdGhlIHBhdGNoOgoKUmV2aWV3ZWQtYnk6IFZvbG9keW15ciBCYWJjaHVrIDx2b2xv
ZHlteXJfYmFiY2h1a0BlcGFtLmNvbT4KCi0tIApWb2xvZHlteXIgQmFiY2h1ayBhdCBFUEFNCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
