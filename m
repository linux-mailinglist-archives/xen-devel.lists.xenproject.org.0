Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A582126387
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2019 14:31:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihvql-0000te-1u; Thu, 19 Dec 2019 13:28:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KiZr=2J=amazon.com=prvs=249f004f8=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ihvqj-0000tZ-Ha
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2019 13:28:17 +0000
X-Inumbo-ID: 653e92f8-2263-11ea-a914-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 653e92f8-2263-11ea-a914-bc764e2007e4;
 Thu, 19 Dec 2019 13:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576762089; x=1608298089;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HE7Qr/58HSHjzmFbwwToxBYzJMuV4TKq5QxjLyxyh8M=;
 b=sNbDIu+cUUo65fdkh+jMpKzSRGcAqYOcFQ8ORwokO072rKThlIAK3Orx
 a9jCbfKcZzeC2qUrY0UaabxL8gmypsNST9FO/xT6XqQQZxbB5gv+VhNG7
 Hv29T78EnxLe8VdyrZZnIQdGJmHtMCh+4qF7gzbXRzC4CB0er/alJC/Bq E=;
IronPort-SDR: YUDuplaJ20PUxrh1FLog6AJ1tCZpM1SxBMbQSsm/gF/FpVxxJSTGhbyOMvlZM9DYX7f1v4BFL1
 32VVjtaNeWqg==
X-IronPort-AV: E=Sophos;i="5.69,332,1571702400"; d="scan'208";a="15832952"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2c-6f38efd9.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 19 Dec 2019 13:27:57 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2c-6f38efd9.us-west-2.amazon.com (Postfix) with ESMTPS
 id E050BA07D2; Thu, 19 Dec 2019 13:27:56 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Thu, 19 Dec 2019 13:27:56 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 19 Dec 2019 13:27:55 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Thu, 19 Dec 2019 13:27:55 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH v2] x86/save: reserve HVM save record numbers that have
 been consumed...
Thread-Index: AQHVtmSJnEe7ujCptU+cy1ctVJs22afBX3kAgAAD9+CAAAp6gIAAAO7AgAAD0wCAAACZoA==
Date: Thu, 19 Dec 2019 13:27:55 +0000
Message-ID: <8818994025bf40a78000d86840c6cfbb@EX13D32EUC003.ant.amazon.com>
References: <20191219120455.13357-1-pdurrant@amazon.com>
 <7afa5fe6-e293-a017-ce97-9aac00cc3691@citrix.com>
 <38c8b0ddf76b497893a5bd52150423c7@EX13D32EUC003.ant.amazon.com>
 <12d3bb9d-a075-6135-5925-87b9b72644df@citrix.com>
 <5bf5afe2cfa043b0b3e3b27011400668@EX13D32EUC003.ant.amazon.com>
 <a481e609-a792-4f1c-9bd6-3e24a642c51e@suse.com>
In-Reply-To: <a481e609-a792-4f1c-9bd6-3e24a642c51e@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.49]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2] x86/save: reserve HVM save record
 numbers that have been consumed...
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDE5IERlY2VtYmVyIDIwMTkgMTM6MjUNCj4gVG86IER1cnJh
bnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jb20+DQo+IENjOiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPjsgeGVuLQ0KPiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZzsgV2VpIExpdSA8d2xAeGVuLm9yZz47IFJvZ2VyIFBhdSBNb25uw6kNCj4gPHJvZ2VyLnBhdUBj
aXRyaXguY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyXSB4ODYvc2F2ZTogcmVzZXJ2ZSBI
Vk0gc2F2ZSByZWNvcmQgbnVtYmVycyB0aGF0DQo+IGhhdmUgYmVlbiBjb25zdW1lZC4uLg0KPiAN
Cj4gT24gMTkuMTIuMjAxOSAxNDoxNSwgRHVycmFudCwgUGF1bCB3cm90ZToNCj4gPj4gRnJvbTog
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCj4gPj4gU2VudDogMTkg
RGVjZW1iZXIgMjAxOSAxMzowOA0KPiA+Pg0KPiA+PiBPbiAxOS8xMi8yMDE5IDEyOjM3LCBEdXJy
YW50LCBQYXVsIHdyb3RlOg0KPiA+Pj4+IEZyb206IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+DQo+ID4+Pj4gU2VudDogMTkgRGVjZW1iZXIgMjAxOSAxMjoxNg0KPiA+
Pj4+DQo+ID4+Pj4gT24gMTkvMTIvMjAxOSAxMjowNCwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiA+
Pj4+PiAtLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC14ODYvaHZtL3NhdmUuaA0KPiA+Pj4+
PiArKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC14ODYvaHZtL3NhdmUuaA0KPiA+Pj4+PiBA
QCAtNjM5LDYgKzYzOSw4IEBAIHN0cnVjdCBodm1fbXNyIHsNCj4gPj4+Pj4NCj4gPj4+Pj4gICNk
ZWZpbmUgQ1BVX01TUl9DT0RFICAyMA0KPiA+Pj4+Pg0KPiA+Pj4+PiArLyogUmFuZ2UgMjIgLSA0
MCByZXNlcnZlZCBmb3IgQW1hem9uICovDQo+ID4+Pj4gV2hhdCBhYm91dCAyMSBhbmQgMjI/wqAg
QW5kIHdoZXJlIGRvZXMgdGhlIGFjdHVhbCBudW1iZXIgc3RvcCwgYmVjYXVzZQ0KPiA+Pj4+IGJh
c2VkIG9uIHYxLCBpdHMgbm90IDQwLg0KPiA+Pj4+DQo+ID4+PiBUaGUgcmFuZ2UgaXMgaW5jbHVz
aXZlIChtYXliZSB0aGF0J3Mgbm90IG9idmlvdXM/KS4gRm9yIHNvbWUgcmVhc29uIDIxDQo+ID4+
IHdhcyBza2lwcGVkIGJ1dCB3aHkgZG8geW91IHNheSB0aGUgdG9wIGlzIG5vdCA0MD8gVGhhdCB3
YXMgd2hhdCBJIHNldA0KPiA+PiBIVk1fU0FWRV9DT0RFX01BWCB0byBpbiB2MS4NCj4gPj4NCj4g
Pj4gWW91IGFsc28gc2FpZCB0aGF0IGluY2x1ZGVkIHByb3NwZWN0aXZlIGhlYWRyb29tLCB3aGlj
aCBkZWZpbml0ZWx5DQo+IGlzbid0DQo+ID4+IGZhaXIgdG8gcmVzZXJ2ZSBmb3IgQUJJIGJyZWFr
YWdlIHJlYXNvbnMuDQo+ID4+DQo+ID4+IFdoaWNoIG51bWJlcnMgaGF2ZSBhY3R1YWxseSBiZWVu
IGFsbG9jYXRlZD8NCj4gPj4NCj4gPg0KPiA+IFRoZSBwcm9ibGVtIGlzIHRoYXQgSSBkb24ndCB5
ZXQga25vdyBmb3Igc3VyZS4gSSBoYXZlIGRlZmluaXRlbHkgc2Vlbg0KPiA+IHBhdGNoZXMgdXNp
bmcgMjIgdGhydSAzNC4gSXQgaXMgKnByb2JhYmx5KiBzYWZlIHRvIHJlc3RyaWN0IHRvIHRoYXQg
YnV0DQo+ID4gZG9lcyBpdCByZWFsbHkgY29zdCB0aGF0IG11Y2ggbW9yZSB0byByZXNlcnZlIHNv
bWUgZXh0cmEgc3BhY2UganVzdCBpbg0KPiA+IGNhc2U/IEkuZS4gaWYgc29tZW9uZSBlbHNlIGFk
ZHMgNDEgdnMuIDM1IGlzIGl0IGdvaW5nIHRvIG1ha2UgbXVjaCBvZiBhDQo+ID4gZGlmZmVyZW5j
ZT8NCj4gDQo+IE5vdCBfdGhhdCBtdWNoXywgYnV0IHN0aWxsIC0gaXQncyBhIGJvZGdlLCBzbyBs
ZXQncyB0cnkgdG8gbGltaXQgaXQgYXMNCj4gbXVjaCBhcyB3ZSBjYW4uDQo+IA0KDQpPSywgSSds
bCBzZW5kIGEgdjMgdXNpbmcgMzQgYXMgdGhlIGxpbWl0Lg0KDQogIFBhdWwNCg0KPiBKYW4NCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
