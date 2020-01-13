Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 805FD1396DC
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2020 17:57:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ir2zn-0007IJ-Os; Mon, 13 Jan 2020 16:55:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fwWm=3C=amazon.co.uk=prvs=2743aefcc=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ir2zl-0007IE-Vq
 for xen-devel@lists.xenproject.org; Mon, 13 Jan 2020 16:55:18 +0000
X-Inumbo-ID: 749f0fa4-3625-11ea-b89f-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 749f0fa4-3625-11ea-b89f-bc764e2007e4;
 Mon, 13 Jan 2020 16:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1578934510; x=1610470510;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ENv4GKZwzbdcXJNbrjNVNtqSm7XDcZNpfWacrtL3BgE=;
 b=vxmF1QWmwTbPqiP3o9kLgHAKDZ4x/65sB/OMDUcIDjjgdt6gd8IX88BF
 1WdYDLvHEL5j26ayYuFa06h1iTxjFWRpdNNl2O2nirsXALbi+8hn+BLEl
 7htXUBsekbhm+G0XnO9Ve4v6hBpArjvRvRssVuOa4Pab7k7lxtoP0pjdg 0=;
IronPort-SDR: rPPzkhyto4YbVPm0d3UupbCA7cTEJB5vlFFStFkCPc1qBVRKEP823I8EbYXj4P2U8Ry+HPEtrY
 K+q3bs4v9KrA==
X-IronPort-AV: E=Sophos;i="5.69,429,1571702400"; d="scan'208";a="19788084"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2b-c300ac87.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 13 Jan 2020 16:54:58 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-c300ac87.us-west-2.amazon.com (Postfix) with ESMTPS
 id 10364A2126; Mon, 13 Jan 2020 16:54:55 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Mon, 13 Jan 2020 16:54:54 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 13 Jan 2020 16:54:53 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Mon, 13 Jan 2020 16:54:53 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: "jandryuk@gmail.com" <jandryuk@gmail.com>
Thread-Topic: [Xen-devel] [PATCH v2 4/6] libxl: allow creation of domains with
 a specified or random domid
Thread-Index: AQHVxuK4l/uYkINmxEmsaDd03sDBHafoy8EAgAAJl7A=
Date: Mon, 13 Jan 2020 16:54:53 +0000
Message-ID: <6696d0425bbb4b50a064221b37bdcfaf@EX13D32EUC003.ant.amazon.com>
References: <20200109114816.2293-1-pdurrant@amazon.com>
 <20200109114816.2293-5-pdurrant@amazon.com>
 <CAKf6xptYj+qwpjHLFidnGidphmOZtyu56menMd0ScfLh-X064A@mail.gmail.com>
In-Reply-To: <CAKf6xptYj+qwpjHLFidnGidphmOZtyu56menMd0ScfLh-X064A@mail.gmail.com>
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
PGphbmRyeXVrQGdtYWlsLmNvbT4NCj4gU2VudDogMTMgSmFudWFyeSAyMDIwIDE2OjE2DQo+IFRv
OiBEdXJyYW50LCBQYXVsIDxwZHVycmFudEBhbWF6b24uY28udWs+DQo+IENjOiB4ZW4tZGV2ZWwg
PHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz47IEFudGhvbnkgUEVSQVJEDQo+IDxhbnRo
b255LnBlcmFyZEBjaXRyaXguY29tPjsgSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJp
eC5jb20+OyBXZWkNCj4gTGl1IDx3bEB4ZW4ub3JnPg0KPiBTdWJqZWN0OiBSZTogW1hlbi1kZXZl
bF0gW1BBVENIIHYyIDQvNl0gbGlieGw6IGFsbG93IGNyZWF0aW9uIG9mIGRvbWFpbnMNCj4gd2l0
aCBhIHNwZWNpZmllZCBvciByYW5kb20gZG9taWQNCj4gDQo+IE9uIFRodSwgSmFuIDksIDIwMjAg
YXQgNjo1MCBBTSBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+IHdyb3RlOg0KPiA+
DQo+ID4gVGhpcyBwYXRjaCBhZGRzIGEgJ2RvbWlkJyBmaWVsZCB0byBsaWJ4bF9kb21haW5fY3Jl
YXRlX2luZm8gYW5kIHRoZW4NCj4gPiBtb2RpZmllcyBkb19kb21haW5fY3JlYXRlKCkgdG8gdXNl
IHRoYXQgdmFsdWUgaWYgaXQgaXMgdmFsaWQuIEFueSB2YWxpZA0KPiA+IGRvbWlkIHdpbGwgYmUg
Y2hlY2tlZCBhZ2FpbnN0IHRoZSByZXRpcmVkIGRvbWlkIGxpc3QgYmVmb3JlIGJlaW5nIHBhc3Nl
ZA0KPiA+IHRvIGxpYnhsX19kb21haW5fbWFrZSgpLg0KPiA+IElmIHRoZSBkb21pZCB2YWx1ZSBp
cyBpbnZhbGlkIHRoZW4gWGVuIHdpbGwgY2hvb3NlIHRoZSBkb21pZCwgYXMgYmVmb3JlLA0KPiA+
IHVubGVzcyB0aGUgdmFsdWUgaXMgdGhlIG5ldyBzcGVjaWFsIFJBTkRPTV9ET01JRCB2YWx1ZSBh
ZGRlZCB0byB0aGUgQVBJLg0KPiA+IFRoaXMgdmFsdWUgaW5zdHJ1Y3RzIGxpYnhsX19kb21haW5f
bWFrZSgpIHRvIHNlbGVjdCBhIHJhbmRvbSBkb21pZA0KPiB2YWx1ZSwNCj4gPiBjaGVjayBpdCBm
b3IgdmFsaWRpdHksIHZlcmlmeSBpdCBkb2VzIG5vdCBtYXRjaCBhIHJldGlyZWQgZG9tYWluLCBh
bmQNCj4gdGhlbg0KPiA+IHBhc3MgaXQgdG8gWGVuJ3MgWEVOX0RPTUNUTF9jcmVhdGVkb21haW4g
b3BlcmF0aW9uLiBJZiBYZW4gZGV0ZXJtaW5lcw0KPiB0aGF0DQo+ID4gaXQgY28taW5jaWRlcyB3
aXRoIGFuIGV4aXN0aW5nIGRvbWFpbiwgYSBuZXcgcmFuZG9tIHZhbHVlIHdpbGwgYmUNCj4gPiBz
ZWxlY3RlZCBhbmQgdGhlIG9wZXJhdGlvbiB3aWxsIGJlIHJlLXRyaWVkLg0KPiA+DQo+ID4gTk9U
RTogbGlieGxfX2xvZ3YoKSBpcyBhbHNvIG1vZGlmaWVkIHRvIG9ubHkgbG9nIHZhbGlkIGRvbWlk
IHZhbHVlcyBpbg0KPiA+ICAgICAgIG1lc3NhZ2VzIHJhdGhlciB0aGFuIGFueSBkb21pZCwgdmFs
aWQgb3Igb3RoZXJ3aXNlLCB0aGF0IGlzIG5vdA0KPiA+ICAgICAgIElOVkFMSURfRE9NSUQuDQo+
ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+
DQo+ID4gLS0tDQo+ID4gQ2M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29t
Pg0KPiA+IENjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPg0KPiA+IENjOiBBbnRob255IFBFUkFSRCA8
YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4NCj4gPg0KPiA+IHYyOg0KPiA+ICAtIFJlLXdvcmtl
ZCB0byB1c2UgYSB2YWx1ZSBmcm9tIGxpYnhsX2RvbWFpbl9jcmVhdGVfaW5mbw0KPiA+IC0tLQ0K
PiA+ICB0b29scy9saWJ4bC9saWJ4bC5oICAgICAgICAgIHwgIDkgKysrKysrKysrDQo+ID4gIHRv
b2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jICAgfCAzMiArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrLQ0KPiA+ICB0b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5jIHwgIDIgKy0NCj4gPiAg
dG9vbHMvbGlieGwvbGlieGxfdHlwZXMuaWRsICB8ICAxICsNCj4gPiAgNCBmaWxlcyBjaGFuZ2Vk
LCA0MiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+DQo+IA0KPiA8c25pcD4NCj4g
DQo+ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jIGIvdG9vbHMvbGli
eGwvbGlieGxfY3JlYXRlLmMNCj4gPiBpbmRleCAxODM1YTU1MDJjLi5lZTc2ZGVlMzY0IDEwMDY0
NA0KPiA+IC0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jDQo+ID4gKysrIGIvdG9vbHMv
bGlieGwvbGlieGxfY3JlYXRlLmMNCj4gPiBAQCAtNjAwLDkgKzYwMCwzOSBAQCBpbnQgbGlieGxf
X2RvbWFpbl9tYWtlKGxpYnhsX19nYyAqZ2MsDQo+IGxpYnhsX2RvbWFpbl9jb25maWcgKmRfY29u
ZmlnLA0KPiA+ICAgICAgICAgICAgICBnb3RvIG91dDsNCj4gPiAgICAgICAgICB9DQo+ID4NCj4g
PiAtICAgICAgICByZXQgPSB4Y19kb21haW5fY3JlYXRlKGN0eC0+eGNoLCBkb21pZCwgJmNyZWF0
ZSk7DQo+ID4gKyAgICAgICAgaWYgKGxpYnhsX2RvbWlkX3ZhbGlkX2d1ZXN0KGluZm8tPmRvbWlk
KSkgew0KPiA+ICsgICAgICAgICAgICAqZG9taWQgPSBpbmZvLT5kb21pZDsNCj4gPiArDQo+ID4g
KyAgICAgICAgICAgIGlmIChsaWJ4bF9faXNfcmV0aXJlZF9kb21pZChnYywgKmRvbWlkKSkgew0K
PiA+ICsgICAgICAgICAgICAgICAgTE9HRUQoRVJST1IsICpkb21pZCwgImRvbWFpbiBpZCBpcyBy
ZXRpcmVkIik7DQo+ID4gKyAgICAgICAgICAgICAgICByYyA9IEVSUk9SX0ZBSUw7DQo+ID4gKyAg
ICAgICAgICAgICAgICBnb3RvIG91dDsNCj4gPiArICAgICAgICAgICAgfQ0KPiA+ICsgICAgICAg
IH0gZWxzZSBpZiAoaW5mby0+ZG9taWQgPT0gUkFORE9NX0RPTUlEKSB7DQo+ID4gKyAgICAgICAg
ICAgICpkb21pZCA9IDA7IC8qIFplcm8tb3V0IGluaXRpYWwgdmFsdWUgKi8NCj4gPiArICAgICAg
ICB9DQo+ID4gKw0KPiA+ICsgICAgICAgIGZvciAoOzspIHsNCj4gPiArICAgICAgICAgICAgaWYg
KGluZm8tPmRvbWlkID09IFJBTkRPTV9ET01JRCkgew0KPiA+ICsgICAgICAgICAgICAgICAgLyog
UmFuZG9taXplIGxvd2VyIG9yZGVyIGJ5dGVzICovDQo+ID4gKyAgICAgICAgICAgICAgICByZXQg
PSBsaWJ4bF9fcmFuZG9tX2J5dGVzKGdjLCAodm9pZCAqKWRvbWlkLA0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzaXplb2YodWludDE2X3QpKTsNCj4gDQo+
IENhc3RpbmcgdG8gdm9pZCAqIGFzc3VtZXMgbGl0dGxlIGVuZGlhbi4NCg0KSSB0aGluayB0aGF0
J3MgYSBmYWlybHkgc2FmZSBhc3N1bXB0aW9uIGFzIGZhciBhcyBYZW4gZ29lcy4uLg0KDQo+IFVz
aW5nIGEgdGVtcG9yYXJ5IHVpbnQxNl90DQoNCi4uLmJ1dCwgeWVzLCB0aGF0IG1pZ2h0IGJlIG5l
YXRlci4NCg0KPiB3b3VsZCBhdm9pZCB0aGF0IGFzc3VtcHRpb24uICBBbHNvLCBtYXNraW5nIGRv
d24gdG8gMHg3ZmZmIHdvdWxkIGNsZWFyDQo+IHRoZSB0b3AgYml0IHdoaWNoIGlzIG5ldmVyIHZh
bGlkLg0KDQpUaGF0IHNlZW1zIGxpa2UgYSBiaXQgb2YgYSBsYXllcmluZyB2aW9sYXRpb24gYW5k
IHRoZSBjaGVjayBpbiBsaWJ4bF9kb21pZF92YWxpZF9ndWVzdCgpIGlzIGdvaW5nIHRvIGNhdXNl
IGEgcHJldHR5IGZhc3QgdHVybiByb3VuZCB0aGUgbG9vcCBpZiB0aGUgdG9wIGJpdCBpcyBzZXQg
c28gbWFza2luZyBpcyBub3QgZ29pbmcgdG8gZ2FpbiB0aGF0IG11Y2guDQoNCiAgUGF1bA0KDQo+
IA0KPiBSZWdhcmRzLA0KPiBKYXNvbg0KPiANCj4gPiArICAgICAgICAgICAgICAgIGlmIChyZXQg
PCAwKQ0KPiA+ICsgICAgICAgICAgICAgICAgICAgIGJyZWFrOw0KPiA+ICsNCj4gPiArICAgICAg
ICAgICAgICAgIGlmICghbGlieGxfZG9taWRfdmFsaWRfZ3Vlc3QoKmRvbWlkKSB8fA0KPiA+ICsg
ICAgICAgICAgICAgICAgICAgIGxpYnhsX19pc19yZXRpcmVkX2RvbWlkKGdjLCAqZG9taWQpKQ0K
PiA+ICsgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOw0KPiA+ICsgICAgICAgICAgICB9DQo+
ID4gKw0KPiA+ICsgICAgICAgICAgICByZXQgPSB4Y19kb21haW5fY3JlYXRlKGN0eC0+eGNoLCBk
b21pZCwgJmNyZWF0ZSk7DQo+ID4gKyAgICAgICAgICAgIGlmIChyZXQgPT0gMCB8fCBlcnJubyAh
PSBFRVhJU1QgfHwgaW5mby0+ZG9taWQgIT0NCj4gUkFORE9NX0RPTUlEKQ0KPiA+ICsgICAgICAg
ICAgICAgICAgYnJlYWs7DQo+ID4gKyAgICAgICAgfQ0KPiA+ICsNCj4gPiAgICAgICAgICBpZiAo
cmV0IDwgMCkgew0KPiA+ICAgICAgICAgICAgICBMT0dFRChFUlJPUiwgKmRvbWlkLCAiZG9tYWlu
IGNyZWF0aW9uIGZhaWwiKTsNCj4gPiArICAgICAgICAgICAgKmRvbWlkID0gSU5WQUxJRF9ET01J
RDsNCj4gPiAgICAgICAgICAgICAgcmMgPSBFUlJPUl9GQUlMOw0KPiA+ICAgICAgICAgICAgICBn
b3RvIG91dDsNCj4gPiAgICAgICAgICB9DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
