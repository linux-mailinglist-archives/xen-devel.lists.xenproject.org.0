Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4853B13A500
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 11:08:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irJ4j-0001Q2-7w; Tue, 14 Jan 2020 10:05:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5ZHO=3D=amazon.co.uk=prvs=275b1edda=pdurrant@srs-us1.protection.inumbo.net>)
 id 1irJ4i-0001Pn-2T
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 10:05:28 +0000
X-Inumbo-ID: 6280b83c-36b5-11ea-8361-12813bfff9fa
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6280b83c-36b5-11ea-8361-12813bfff9fa;
 Tue, 14 Jan 2020 10:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1578996326; x=1610532326;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ertSEzT65mrUzvWHOJVFhYw1R6v1MhlRlNUTuCQw1V0=;
 b=NyjFvEbDtdQ20iunaItRWtGTsgeorjgyD1on4//4St8MX34q/DxQskom
 ML87RYOSzzmCaQHEQIrZ68K/1dAnxJYKiNny2axMTANFEkGWtD4Ljp3Lb
 CZbKxanNT1/e57142E+VW1gV/4rVXFWfjVgQh5SkMeRyko+EC18CfkQuo Y=;
IronPort-SDR: ZozD1x8wdYlxD8sS8jjC7jIEJSwvg3gla74LKxMBCeIw23ir4C4qCko7NFWbh9DwAya0eRbCJl
 vSYf8b/GfOqA==
X-IronPort-AV: E=Sophos;i="5.69,432,1571702400"; d="scan'208";a="19954481"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1e-c7c08562.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 14 Jan 2020 10:05:09 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1e-c7c08562.us-east-1.amazon.com (Postfix) with ESMTPS
 id 7543824484A; Tue, 14 Jan 2020 10:05:08 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Tue, 14 Jan 2020 10:05:02 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 14 Jan 2020 10:05:01 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Tue, 14 Jan 2020 10:05:00 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: "jandryuk@gmail.com" <jandryuk@gmail.com>
Thread-Topic: [Xen-devel] [PATCH v2 4/6] libxl: allow creation of domains with
 a specified or random domid
Thread-Index: AQHVxuK4l/uYkINmxEmsaDd03sDBHafoy8EAgAAJl7CAAB0XgIABA79A
Date: Tue, 14 Jan 2020 10:05:00 +0000
Message-ID: <2a82b63d1ecd42e1ae1fd9be37422055@EX13D32EUC003.ant.amazon.com>
References: <20200109114816.2293-1-pdurrant@amazon.com>
 <20200109114816.2293-5-pdurrant@amazon.com>
 <CAKf6xptYj+qwpjHLFidnGidphmOZtyu56menMd0ScfLh-X064A@mail.gmail.com>
 <6696d0425bbb4b50a064221b37bdcfaf@EX13D32EUC003.ant.amazon.com>
 <CAKf6xpsz9ee4=15CApvX1XOkXRrZj2qHkgnpf7g836UBLi4-Ww@mail.gmail.com>
In-Reply-To: <CAKf6xpsz9ee4=15CApvX1XOkXRrZj2qHkgnpf7g836UBLi4-Ww@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.165]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2 4/6] libxl: allow creation of domains
 with a specified or random domid
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBqYW5kcnl1a0BnbWFpbC5jb20g
PGphbmRyeXVrQGdtYWlsLmNvbT4NCj4gU2VudDogMTMgSmFudWFyeSAyMDIwIDE5OjM1DQo+IFRv
OiBEdXJyYW50LCBQYXVsIDxwZHVycmFudEBhbWF6b24uY28udWs+DQo+IENjOiB4ZW4tZGV2ZWwg
PHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz47IEFudGhvbnkgUEVSQVJEDQo+IDxhbnRo
b255LnBlcmFyZEBjaXRyaXguY29tPjsgSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJp
eC5jb20+OyBXZWkNCj4gTGl1IDx3bEB4ZW4ub3JnPg0KPiBTdWJqZWN0OiBSZTogW1hlbi1kZXZl
bF0gW1BBVENIIHYyIDQvNl0gbGlieGw6IGFsbG93IGNyZWF0aW9uIG9mIGRvbWFpbnMNCj4gd2l0
aCBhIHNwZWNpZmllZCBvciByYW5kb20gZG9taWQNCj4gDQo+IE9uIE1vbiwgSmFuIDEzLCAyMDIw
IGF0IDExOjU1IEFNIER1cnJhbnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jby51az4NCj4gd3Jv
dGU6DQo+ID4NCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9tOiBq
YW5kcnl1a0BnbWFpbC5jb20gPGphbmRyeXVrQGdtYWlsLmNvbT4NCj4gPiA+IFNlbnQ6IDEzIEph
bnVhcnkgMjAyMCAxNjoxNg0KPiA+ID4gVG86IER1cnJhbnQsIFBhdWwgPHBkdXJyYW50QGFtYXpv
bi5jby51az4NCj4gPiA+IENjOiB4ZW4tZGV2ZWwgPHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZz47IEFudGhvbnkgUEVSQVJEDQo+ID4gPiA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT47
IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPjsNCj4gV2VpDQo+ID4gPiBM
aXUgPHdsQHhlbi5vcmc+DQo+ID4gPiBTdWJqZWN0OiBSZTogW1hlbi1kZXZlbF0gW1BBVENIIHYy
IDQvNl0gbGlieGw6IGFsbG93IGNyZWF0aW9uIG9mDQo+IGRvbWFpbnMNCj4gPiA+IHdpdGggYSBz
cGVjaWZpZWQgb3IgcmFuZG9tIGRvbWlkDQo+ID4gPg0KPiA+ID4gT24gVGh1LCBKYW4gOSwgMjAy
MCBhdCA2OjUwIEFNIFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4NCj4gd3JvdGU6
DQo+ID4gPiA+DQo+ID4gPiA+IFRoaXMgcGF0Y2ggYWRkcyBhICdkb21pZCcgZmllbGQgdG8gbGli
eGxfZG9tYWluX2NyZWF0ZV9pbmZvIGFuZCB0aGVuDQo+ID4gPiA+IG1vZGlmaWVzIGRvX2RvbWFp
bl9jcmVhdGUoKSB0byB1c2UgdGhhdCB2YWx1ZSBpZiBpdCBpcyB2YWxpZC4gQW55DQo+IHZhbGlk
DQo+ID4gPiA+IGRvbWlkIHdpbGwgYmUgY2hlY2tlZCBhZ2FpbnN0IHRoZSByZXRpcmVkIGRvbWlk
IGxpc3QgYmVmb3JlIGJlaW5nDQo+IHBhc3NlZA0KPiA+ID4gPiB0byBsaWJ4bF9fZG9tYWluX21h
a2UoKS4NCj4gPiA+ID4gSWYgdGhlIGRvbWlkIHZhbHVlIGlzIGludmFsaWQgdGhlbiBYZW4gd2ls
bCBjaG9vc2UgdGhlIGRvbWlkLCBhcw0KPiBiZWZvcmUsDQo+ID4gPiA+IHVubGVzcyB0aGUgdmFs
dWUgaXMgdGhlIG5ldyBzcGVjaWFsIFJBTkRPTV9ET01JRCB2YWx1ZSBhZGRlZCB0byB0aGUNCj4g
QVBJLg0KPiA+ID4gPiBUaGlzIHZhbHVlIGluc3RydWN0cyBsaWJ4bF9fZG9tYWluX21ha2UoKSB0
byBzZWxlY3QgYSByYW5kb20gZG9taWQNCj4gPiA+IHZhbHVlLA0KPiA+ID4gPiBjaGVjayBpdCBm
b3IgdmFsaWRpdHksIHZlcmlmeSBpdCBkb2VzIG5vdCBtYXRjaCBhIHJldGlyZWQgZG9tYWluLA0K
PiBhbmQNCj4gPiA+IHRoZW4NCj4gPiA+ID4gcGFzcyBpdCB0byBYZW4ncyBYRU5fRE9NQ1RMX2Ny
ZWF0ZWRvbWFpbiBvcGVyYXRpb24uIElmIFhlbg0KPiBkZXRlcm1pbmVzDQo+ID4gPiB0aGF0DQo+
ID4gPiA+IGl0IGNvLWluY2lkZXMgd2l0aCBhbiBleGlzdGluZyBkb21haW4sIGEgbmV3IHJhbmRv
bSB2YWx1ZSB3aWxsIGJlDQo+ID4gPiA+IHNlbGVjdGVkIGFuZCB0aGUgb3BlcmF0aW9uIHdpbGwg
YmUgcmUtdHJpZWQuDQo+ID4gPiA+DQo+ID4gPiA+IE5PVEU6IGxpYnhsX19sb2d2KCkgaXMgYWxz
byBtb2RpZmllZCB0byBvbmx5IGxvZyB2YWxpZCBkb21pZCB2YWx1ZXMNCj4gaW4NCj4gPiA+ID4g
ICAgICAgbWVzc2FnZXMgcmF0aGVyIHRoYW4gYW55IGRvbWlkLCB2YWxpZCBvciBvdGhlcndpc2Us
IHRoYXQgaXMNCj4gbm90DQo+ID4gPiA+ICAgICAgIElOVkFMSURfRE9NSUQuDQo+ID4gPiA+DQo+
ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4N
Cj4gPiA+ID4gLS0tDQo+ID4gPiA+IENjOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0
cml4LmNvbT4NCj4gPiA+ID4gQ2M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+DQo+ID4gPiA+IENjOiBB
bnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4NCj4gPiA+ID4NCj4gPiA+
ID4gdjI6DQo+ID4gPiA+ICAtIFJlLXdvcmtlZCB0byB1c2UgYSB2YWx1ZSBmcm9tIGxpYnhsX2Rv
bWFpbl9jcmVhdGVfaW5mbw0KPiA+ID4gPiAtLS0NCj4gPiA+ID4gIHRvb2xzL2xpYnhsL2xpYnhs
LmggICAgICAgICAgfCAgOSArKysrKysrKysNCj4gPiA+ID4gIHRvb2xzL2xpYnhsL2xpYnhsX2Ny
ZWF0ZS5jICAgfCAzMiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQ0KPiA+ID4gPiAg
dG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuYyB8ICAyICstDQo+ID4gPiA+ICB0b29scy9saWJ4
bC9saWJ4bF90eXBlcy5pZGwgIHwgIDEgKw0KPiA+ID4gPiAgNCBmaWxlcyBjaGFuZ2VkLCA0MiBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+ID4gPg0KPiA+ID4NCj4gPiA+IDxzbmlw
Pg0KPiA+ID4NCj4gPiA+ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5j
IGIvdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMNCj4gPiA+ID4gaW5kZXggMTgzNWE1NTAyYy4u
ZWU3NmRlZTM2NCAxMDA2NDQNCj4gPiA+ID4gLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfY3JlYXRl
LmMNCj4gPiA+ID4gKysrIGIvdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMNCj4gPiA+ID4gQEAg
LTYwMCw5ICs2MDAsMzkgQEAgaW50IGxpYnhsX19kb21haW5fbWFrZShsaWJ4bF9fZ2MgKmdjLA0K
PiA+ID4gbGlieGxfZG9tYWluX2NvbmZpZyAqZF9jb25maWcsDQo+ID4gPiA+ICAgICAgICAgICAg
ICBnb3RvIG91dDsNCj4gPiA+ID4gICAgICAgICAgfQ0KPiA+ID4gPg0KPiA+ID4gPiAtICAgICAg
ICByZXQgPSB4Y19kb21haW5fY3JlYXRlKGN0eC0+eGNoLCBkb21pZCwgJmNyZWF0ZSk7DQo+ID4g
PiA+ICsgICAgICAgIGlmIChsaWJ4bF9kb21pZF92YWxpZF9ndWVzdChpbmZvLT5kb21pZCkpIHsN
Cj4gPiA+ID4gKyAgICAgICAgICAgICpkb21pZCA9IGluZm8tPmRvbWlkOw0KPiA+ID4gPiArDQo+
ID4gPiA+ICsgICAgICAgICAgICBpZiAobGlieGxfX2lzX3JldGlyZWRfZG9taWQoZ2MsICpkb21p
ZCkpIHsNCj4gPiA+ID4gKyAgICAgICAgICAgICAgICBMT0dFRChFUlJPUiwgKmRvbWlkLCAiZG9t
YWluIGlkIGlzIHJldGlyZWQiKTsNCj4gPiA+ID4gKyAgICAgICAgICAgICAgICByYyA9IEVSUk9S
X0ZBSUw7DQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgZ290byBvdXQ7DQo+ID4gPiA+ICsgICAg
ICAgICAgICB9DQo+ID4gPiA+ICsgICAgICAgIH0gZWxzZSBpZiAoaW5mby0+ZG9taWQgPT0gUkFO
RE9NX0RPTUlEKSB7DQo+ID4gPiA+ICsgICAgICAgICAgICAqZG9taWQgPSAwOyAvKiBaZXJvLW91
dCBpbml0aWFsIHZhbHVlICovDQo+ID4gPiA+ICsgICAgICAgIH0NCj4gPiA+ID4gKw0KPiA+ID4g
PiArICAgICAgICBmb3IgKDs7KSB7DQo+ID4gPiA+ICsgICAgICAgICAgICBpZiAoaW5mby0+ZG9t
aWQgPT0gUkFORE9NX0RPTUlEKSB7DQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgLyogUmFuZG9t
aXplIGxvd2VyIG9yZGVyIGJ5dGVzICovDQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgcmV0ID0g
bGlieGxfX3JhbmRvbV9ieXRlcyhnYywgKHZvaWQgKilkb21pZCwNCj4gPiA+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNpemVvZih1aW50MTZfdCkpOw0KPiA+
ID4NCj4gPiA+IENhc3RpbmcgdG8gdm9pZCAqIGFzc3VtZXMgbGl0dGxlIGVuZGlhbi4NCj4gPg0K
PiA+IEkgdGhpbmsgdGhhdCdzIGEgZmFpcmx5IHNhZmUgYXNzdW1wdGlvbiBhcyBmYXIgYXMgWGVu
IGdvZXMuLi4NCj4gPg0KPiA+ID4gVXNpbmcgYSB0ZW1wb3JhcnkgdWludDE2X3QNCj4gPg0KPiA+
IC4uLmJ1dCwgeWVzLCB0aGF0IG1pZ2h0IGJlIG5lYXRlci4NCj4gPg0KPiA+ID4gd291bGQgYXZv
aWQgdGhhdCBhc3N1bXB0aW9uLiAgQWxzbywgbWFza2luZyBkb3duIHRvIDB4N2ZmZiB3b3VsZCBj
bGVhcg0KPiA+ID4gdGhlIHRvcCBiaXQgd2hpY2ggaXMgbmV2ZXIgdmFsaWQuDQo+ID4NCj4gPiBU
aGF0IHNlZW1zIGxpa2UgYSBiaXQgb2YgYSBsYXllcmluZyB2aW9sYXRpb24gYW5kIHRoZSBjaGVj
ayBpbg0KPiBsaWJ4bF9kb21pZF92YWxpZF9ndWVzdCgpIGlzIGdvaW5nIHRvIGNhdXNlIGEgcHJl
dHR5IGZhc3QgdHVybiByb3VuZCB0aGUNCj4gbG9vcCBpZiB0aGUgdG9wIGJpdCBpcyBzZXQgc28g
bWFza2luZyBpcyBub3QgZ29pbmcgdG8gZ2FpbiB0aGF0IG11Y2guDQo+IA0KPiBZZWFoLCB0aGVy
ZSBpc24ndCBhIGRlZmluZSBvciBjb25zdGFudCBleHBvc2VkIGZvciAweDdmZmYsIHNvIG1hc2tp
bmcNCj4gaXMgYSBsaXR0bGUgZGlydHkuICBTaW5jZSBhYm91dCB+aGFsZiBvZiByYW5kb20gMTZi
aXQgbnVtYmVycyB3aWxsDQo+IGhhdmUgdGhlIGhpZ2ggYml0IHNldCwgd2UnbGwgaGF2ZSB0byBy
ZWFkIGEgc2Vjb25kIG9uZS4gIE15IG5hdHVyYWwNCj4gaW5zdGluY3QgaXMgdG8gYXZvaWQgdGhv
c2UgZXh0cmEgcmVhZHMgOikNCj4gDQoNClBlcmhhcHMgSSBzaG91bGQgdHJ5IGFkZGluZyBhIERP
TUlEX01BU0sgZGVmaW5pdGlvbiBzb21ld2hlcmUuDQoNCiAgUGF1bA0KDQo+IFJlZ2FyZHMsDQo+
IEphc29uDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
