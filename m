Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1F3151B13
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 14:19:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyy40-0004vh-R0; Tue, 04 Feb 2020 13:16:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KWMX=3Y=amazon.co.uk=prvs=296b502bc=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iyy3z-0004vc-AT
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 13:16:23 +0000
X-Inumbo-ID: 899c4f02-4750-11ea-b211-bc764e2007e4
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 899c4f02-4750-11ea-b211-bc764e2007e4;
 Tue, 04 Feb 2020 13:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1580822183; x=1612358183;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zj7gUaJpnhPh9DrYHxlKJXkXe+w2HO+vR2D9Rhbo1/g=;
 b=C2//DH8M6oEdJgul+THGyc1P/gLndoHBJM27SMkqPf+bA4uReKrD4zu9
 GEXBOfkhbnAKTF8k8hoBuDtQicb5uCsj/WzTnv4nIDvudHyFhpMHW3L9F
 E6Yb7BxXMLENz8y22XGxLG5ai5KDt8WymQpt+EbfPphiXUtTJLLo24ZDn 4=;
IronPort-SDR: dZOqyTvHNcUN71budwh4McvewVPAXGuk5JHx4Qf0iPn1cnyBpQ3rEAcxTw7sgZs2Xh10e0LNJk
 HbvlyY/fj51A==
X-IronPort-AV: E=Sophos;i="5.70,401,1574121600"; d="scan'208";a="14542807"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-6e2fc477.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 04 Feb 2020 13:16:11 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-6e2fc477.us-west-2.amazon.com (Postfix) with ESMTPS
 id F3688A1E0E; Tue,  4 Feb 2020 13:16:10 +0000 (UTC)
Received: from EX13D37EUB001.ant.amazon.com (10.43.166.31) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Tue, 4 Feb 2020 13:16:10 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D37EUB001.ant.amazon.com (10.43.166.31) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 4 Feb 2020 13:16:09 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Tue, 4 Feb 2020 13:16:09 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH v2 2/2] xen/x86: hap: Clean-up and harden
 hap_enable()
Thread-Index: AQHV21xKs4tg6upgOUiLe5ebUUAcCagLAzqQ
Date: Tue, 4 Feb 2020 13:16:09 +0000
Message-ID: <b7312aba7d5c420bbb660298a4c73578@EX13D32EUC003.ant.amazon.com>
References: <20200204130614.15166-1-julien@xen.org>
 <20200204130614.15166-3-julien@xen.org>
In-Reply-To: <20200204130614.15166-3-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.18]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2 2/2] xen/x86: hap: Clean-up and harden
 hap_enable()
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, "Grall, Julien" <jgrall@amazon.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YNCj4gSnVsaWVuIEdy
YWxsDQo+IFNlbnQ6IDA0IEZlYnJ1YXJ5IDIwMjAgMTM6MDYNCj4gVG86IHhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZw0KPiBDYzoganVsaWVuQHhlbi5vcmc7IFdlaSBMaXUgPHdsQHhlbi5v
cmc+OyBHZW9yZ2UgRHVubGFwDQo+IDxnZW9yZ2UuZHVubGFwQGV1LmNpdHJpeC5jb20+OyBBbmRy
ZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsNCj4gR3JhbGwsIEp1bGllbiA8
amdyYWxsQGFtYXpvbi5jb20+OyBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+OyBSb2dl
cg0KPiBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gU3ViamVjdDogW1hlbi1k
ZXZlbF0gW1BBVENIIHYyIDIvMl0geGVuL3g4NjogaGFwOiBDbGVhbi11cCBhbmQgaGFyZGVuDQo+
IGhhcF9lbmFibGUoKQ0KPiANCj4gRnJvbTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNv
bT4NCj4gDQo+IFVubGlrZSBzaGFkb3dfZW5hYmxlKCksIGhhcF9lbmFibGUoKSBjYW4gb25seSBi
ZSBjYWxsZWQgb25jZSBkdXJpbmcNCj4gZG9tYWluIGNyZWF0aW9uIGFuZCB3aXRoIHRoZSBtb2Rl
IGVxdWFsIHRvIG1vZGUgZXF1YWwgdG8NCj4gUEdfZXh0ZXJuYWwgfCBQR190cmFuc2xhdGUgfCBQ
R19yZWZjb3VudHMuDQo+IA0KPiBJZiBpdCB3ZXJlIGNhbGxlZCB0d2ljZSwgdGhlbiB3ZSBtaWdo
dCBoYXZlIHNvbWV0aGluZyBpbnRlcmVzdGluZw0KPiBwcm9ibGVtIGFzIHRoZSBwMm0gdGFibGVz
IHdvdWxkIGJlIHJlLWFsbG9jYXRlZCAoYW5kIHRoZXJlZm9yZSBhbGwgdGhlDQo+IG1hcHBpbmdz
IHdvdWxkIGJlIGxvc3QpLg0KDQpUaGVyZSBhcmUgdHdvIHRlc3RzIGluIHAybV9hbGxvY190YWJs
Mjogd2hldGhlciB0aGUgZG9tYWluIGhhcyBtZW1vcnkgYWxsb2NhdGVkLCBhbmQgd2hldGhlciB0
aGUgZG9tYWluIGFscmVhZHkgaGFzIGEgcDJtLiBDYW4gdGhlc2Ugbm93IGJlIGRyb3BwZWQ/DQoN
CiAgUGF1bA0KDQo+IA0KPiBBZGQgY29kZSB0byBzYW5pdHkgY2hlY2sgdGhlIG1vZGUgYW5kIHRo
YXQgdGhlIGZ1bmN0aW9uIGlzIG9ubHkgY2FsbGVkDQo+IG9uY2UuIFRha2UgdGhlIG9wcG9ydHVu
aXR5IHRvIGFuIGlmIGNoZWNraW5nIHRoYXQgUEdfdHJhbnNsYXRlIGlzIHNldC4NCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+DQo+IA0KPiAtLS0N
Cj4gDQo+IEl0IGlzIG5vdCBlbnRpcmVseSBjbGVhciB3aGVuIFBHX3RyYW5zbGF0ZSB3YXMgZW5m
b3JjZWQuDQo+IA0KPiBJIGtlZXAgdGhlIGNoZWNrICE9IDAgYmVjYXVzZSB0aGlzIGlzIGNvbnNp
c3RlbnQgd2l0aCB0aGUgcmVzdCBvZiB0aGUNCj4gZmlsZS4gSWYgd2Ugd2FudCB0byBvbWl0IGNv
bXBhcmlzb24gYWdhaW5zdCAwLCB0aGVuIHRoaXMgc2hvdWxkIGJlIGluIGENCj4gc2VwYXJhdGUg
cGF0Y2hlcyBjb252ZXJ0aW5nIHRoZSBmaWxlLg0KPiANCj4gICAgIENoYW5nZXMgaW4gdjI6DQo+
ICAgICAgICAgLSBGaXggdHlwb2VzIGluIHRoZSBjb21taXQgbWVzc2FnZQ0KPiAgICAgICAgIC0g
VXNlIC1FRVhJU1QgaW5zdGVhZCBvZiAtRUlOVkFMDQo+IC0tLQ0KPiAgeGVuL2FyY2gveDg2L21t
L2hhcC9oYXAuYyB8IDE4ICsrKysrKysrKysrLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEx
IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gveDg2L21tL2hhcC9oYXAuYyBiL3hlbi9hcmNoL3g4Ni9tbS9oYXAvaGFwLmMNCj4gaW5kZXgg
MzEzNjJhMzFiNi4uNDk3NGJkMTNkNCAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gveDg2L21tL2hh
cC9oYXAuYw0KPiArKysgYi94ZW4vYXJjaC94ODYvbW0vaGFwL2hhcC5jDQo+IEBAIC00NDUsNiAr
NDQ1LDEzIEBAIGludCBoYXBfZW5hYmxlKHN0cnVjdCBkb21haW4gKmQsIHUzMiBtb2RlKQ0KPiAg
ICAgIHVuc2lnbmVkIGludCBpOw0KPiAgICAgIGludCBydiA9IDA7DQo+IA0KPiArICAgIGlmICgg
bW9kZSAhPSAoUEdfZXh0ZXJuYWwgfCBQR190cmFuc2xhdGUgfCBQR19yZWZjb3VudHMpICkNCj4g
KyAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ICsNCj4gKyAgICAvKiBUaGUgZnVuY3Rpb24gY2Fu
IG9ubHkgYmUgY2FsbGVkIG9uY2UgKi8NCj4gKyAgICBpZiAoIGQtPmFyY2gucGFnaW5nLm1vZGUg
IT0gMCApDQo+ICsgICAgICAgIHJldHVybiAtRUVYSVNUOw0KPiArDQo+ICAgICAgZG9tYWluX3Bh
dXNlKGQpOw0KPiANCj4gICAgICBvbGRfcGFnZXMgPSBkLT5hcmNoLnBhZ2luZy5oYXAudG90YWxf
cGFnZXM7DQo+IEBAIC00NjUsMTMgKzQ3MiwxMCBAQCBpbnQgaGFwX2VuYWJsZShzdHJ1Y3QgZG9t
YWluICpkLCB1MzIgbW9kZSkNCj4gICAgICBkLT5hcmNoLnBhZ2luZy5hbGxvY19wYWdlID0gaGFw
X2FsbG9jX3AybV9wYWdlOw0KPiAgICAgIGQtPmFyY2gucGFnaW5nLmZyZWVfcGFnZSA9IGhhcF9m
cmVlX3AybV9wYWdlOw0KPiANCj4gLSAgICAvKiBhbGxvY2F0ZSBQMm0gdGFibGUgKi8NCj4gLSAg
ICBpZiAoIG1vZGUgJiBQR190cmFuc2xhdGUgKQ0KPiAtICAgIHsNCj4gLSAgICAgICAgcnYgPSBw
Mm1fYWxsb2NfdGFibGUocDJtX2dldF9ob3N0cDJtKGQpKTsNCj4gLSAgICAgICAgaWYgKCBydiAh
PSAwICkNCj4gLSAgICAgICAgICAgIGdvdG8gb3V0Ow0KPiAtICAgIH0NCj4gKyAgICAvKiBhbGxv
Y2F0ZSBQMk0gdGFibGUgKi8NCj4gKyAgICBydiA9IHAybV9hbGxvY190YWJsZShwMm1fZ2V0X2hv
c3RwMm0oZCkpOw0KPiArICAgIGlmICggcnYgIT0gMCApDQo+ICsgICAgICAgIGdvdG8gb3V0Ow0K
PiANCj4gICAgICBmb3IgKCBpID0gMDsgaSA8IE1BWF9ORVNURURQMk07IGkrKyApDQo+ICAgICAg
ew0KPiAtLQ0KPiAyLjE3LjENCj4gDQo+IA0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXw0KPiBYZW4tZGV2ZWwgbWFpbGluZyBsaXN0DQo+IFhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVsDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
