Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4E52347C2
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 16:30:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1W3D-00056U-0H; Fri, 31 Jul 2020 14:30:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HXbV=BK=amazon.co.uk=prvs=4749be70b=pdurrant@srs-us1.protection.inumbo.net>)
 id 1k1W3B-00056M-In
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 14:30:21 +0000
X-Inumbo-ID: 5cea6fcc-d33a-11ea-abc4-12813bfff9fa
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5cea6fcc-d33a-11ea-abc4-12813bfff9fa;
 Fri, 31 Jul 2020 14:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1596205821; x=1627741821;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version:subject;
 bh=+gXW+enlch3WbuRFmyKr9mq3d3S23+dK+/0Asq4lc7M=;
 b=tOaRKInb2REPQqpdTPSTPQscHpzDnj81cLlkwe9fbCv+hV/F9xbyr5HH
 bbX4UgB+I6mQOdBExu1WrhKYkd5nNzOo5fRrLewECzjzerxIn6cVSv4u9
 pJVrVVaBxvrfLpgjNAPAyFkVm8QzzYp04Dw9OHHATucXgFe3EZJe9CajR o=;
IronPort-SDR: t2AS02JopL4ieO79pk16JluAO2qAjuCx+8Ok9UXASbk3e715uNwRDq51ETjeBES9sCoWve3eve
 zTLxnsL7zPgQ==
X-IronPort-AV: E=Sophos;i="5.75,418,1589241600"; d="scan'208";a="45206227"
Subject: RE: [PATCH v3 1/2] x86/hvm: set 'ipat' in EPT for special pages
Thread-Topic: [PATCH v3 1/2] x86/hvm: set 'ipat' in EPT for special pages
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1a-7d76a15f.us-east-1.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 31 Jul 2020 14:30:20 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1a-7d76a15f.us-east-1.amazon.com (Postfix) with ESMTPS
 id C3DB6A26F5; Fri, 31 Jul 2020 14:30:18 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 31 Jul 2020 14:30:18 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 31 Jul 2020 14:30:16 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Fri, 31 Jul 2020 14:30:16 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Paul Durrant <paul@xen.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Index: AQHWZ0ag7yevQZOxg0qa3sMTQ3/Iq6khvhzw
Date: Fri, 31 Jul 2020 14:30:15 +0000
Message-ID: <409dc5e763f446b2be1df92b31e57d13@EX13D32EUC003.ant.amazon.com>
References: <20200731142604.30149-1-paul@xen.org>
 <20200731142604.30149-2-paul@xen.org>
In-Reply-To: <20200731142604.30149-2-paul@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.90]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: Bulk
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQYXVsIER1cnJhbnQgPHBhdWxA
eGVuLm9yZz4NCj4gU2VudDogMzEgSnVseSAyMDIwIDE1OjI2DQo+IFRvOiB4ZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcNCj4gQ2M6IER1cnJhbnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5j
by51az47IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT47IEFuZHJldyBDb29wZXINCj4g
PGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgUm9nZXIg
UGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+IFN1YmplY3Q6IFtFWFRFUk5BTF0g
W1BBVENIIHYzIDEvMl0geDg2L2h2bTogc2V0ICdpcGF0JyBpbiBFUFQgZm9yIHNwZWNpYWwgcGFn
ZXMNCj4gDQo+IENBVVRJT046IFRoaXMgZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2Yg
dGhlIG9yZ2FuaXphdGlvbi4gRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4NCj4gYXR0YWNobWVu
dHMgdW5sZXNzIHlvdSBjYW4gY29uZmlybSB0aGUgc2VuZGVyIGFuZCBrbm93IHRoZSBjb250ZW50
IGlzIHNhZmUuDQo+IA0KPiANCj4gDQo+IEZyb206IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1h
em9uLmNvbT4NCj4gDQo+IEFsbCBub24tTU1JTyByYW5nZXMgKGkuZSB0aG9zZSBub3QgbWFwcGlu
ZyByZWFsIGRldmljZSBNTUlPIHJlZ2lvbnMpIHRoYXQNCj4gbWFwIHZhbGlkIE1GTnMgYXJlIG5v
cm1hbGx5IG1hcmtlZCBNVFJSX1RZUEVfV1JCQUNLIGFuZCAnaXBhdCcgaXMgc2V0LiBIZW5jZQ0K
PiB3aGVuIFBWIGRyaXZlcnMgcnVubmluZyBpbiBhIGd1ZXN0IHBvcHVsYXRlIHRoZSBCQVIgc3Bh
Y2Ugb2YgdGhlIFhlbiBQbGF0Zm9ybQ0KPiBQQ0kgRGV2aWNlIHdpdGggcGFnZXMgc3VjaCBhcyB0
aGUgU2hhcmVkIEluZm8gcGFnZSBvciBHcmFudCBUYWJsZSBwYWdlcywNCj4gYWNjZXNzZXMgdG8g
dGhlc2UgcGFnZXMgd2lsbCBiZSBjYWNoYWJsZS4NCj4gDQo+IEhvd2V2ZXIsIHNob3VsZCBJT01N
VSBtYXBwaW5ncyBiZSBlbmFibGVkIGJlIGVuYWJsZWQgZm9yIHRoZSBndWVzdCB0aGVuIHRoZXNl
DQo+IGFjY2Vzc2VzIGJlY29tZSB1bmNhY2hhYmxlLiBUaGlzIGhhcyBhIHN1YnN0YW50aWFsIG5l
Z2F0aXZlIGVmZmVjdCBvbiBJL08NCj4gdGhyb3VnaHB1dCBvZiBQViBkZXZpY2VzLiBBcmd1YWJs
eSBQViBkcml2ZXJzIHNob3VsZCBib3QgYmUgdXNpbmcgQkFSIHNwYWNlIHRvDQo+IGhvc3QgdGhl
IFNoYXJlZCBJbmZvIGFuZCBHcmFudCBUYWJsZSBwYWdlcyBidXQgaXQgaXMgY3VycmVudGx5IGNv
bW1vbnBsYWNlIGZvcg0KPiB0aGVtIHRvIGRvIHRoaXMgYW5kIHNvIHRoaXMgcHJvYmxlbSBuZWVk
cyBtaXRpZ2F0aW9uLiBIZW5jZSB0aGlzIHBhdGNoIG1ha2VzDQo+IHN1cmUgdGhlICdpcGF0JyBi
aXQgaXMgc2V0IGZvciBhbnkgc3BlY2lhbCBwYWdlIHJlZ2FyZGxlc3Mgb2Ygd2hlcmUgaW4gR0ZO
DQo+IHNwYWNlIGl0IGlzIG1hcHBlZC4NCj4gDQo+IE5PVEU6IENsZWFybHkgdGhpcyBtaXRpZ2F0
aW9uIG9ubHkgYXBwbGllcyB0byBJbnRlbCBFUFQuIEl0IGlzIG5vdCBvYnZpb3VzDQo+ICAgICAg
IHRoYXQgdGhlcmUgaXMgYW55IHNpbWlsYXIgbWl0aWdhdGlvbiBwb3NzaWJsZSBmb3IgQU1EIE5Q
VC4gRG93bnN0cmVhbXMNCj4gICAgICAgc3VjaCBhcyBDaXRyaXggWGVuU2VydmVyIGhhdmUgYmVl
biBjYXJyeWluZyBhIHBhdGNoIHNpbWlsYXIgdG8gdGhpcyBmb3INCj4gICAgICAgc2V2ZXJhbCBy
ZWxlYXNlcyB0aG91Z2guDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBkdXJy
YW50QGFtYXpvbi5jb20+DQoNClRoaXMgaXMgbWlzc2luZyBhIGh1bmsuIEknbGwgc2VuZCB2NC4N
Cg0KICBQYXVsDQoNCj4gLS0tDQo+IENjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
DQo+IENjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiBDYzog
V2VpIExpdSA8d2xAeGVuLm9yZz4NCj4gQ2M6ICJSb2dlciBQYXUgTW9ubsOpIiA8cm9nZXIucGF1
QGNpdHJpeC5jb20+DQo+IA0KPiB2MzoNCj4gIC0gZHJvcHBpbmcgSmFuJ3MgUi1iDQo+ICAtIGNv
cGUgd2l0aCBvcmRlciA+IDANCj4gLS0tDQo+ICB4ZW4vYXJjaC94ODYvaHZtL210cnIuYyB8IDEx
ICsrKysrKysrKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vbXRyci5jIGIveGVuL2FyY2gveDg2L2h2bS9t
dHJyLmMNCj4gaW5kZXggNTExYzNiZTFjOC4uMjY3MjFmNmVlNyAxMDA2NDQNCj4gLS0tIGEveGVu
L2FyY2gveDg2L2h2bS9tdHJyLmMNCj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9tdHJyLmMNCj4g
QEAgLTgzNiw2ICs4MzYsMTcgQEAgaW50IGVwdGVfZ2V0X2VudHJ5X2VtdChzdHJ1Y3QgZG9tYWlu
ICpkLCB1bnNpZ25lZCBsb25nIGdmbiwgbWZuX3QgbWZuLA0KPiAgICAgICAgICByZXR1cm4gTVRS
Ul9UWVBFX1dSQkFDSzsNCj4gICAgICB9DQo+IA0KPiArICAgIGZvciAoIGkgPSAwOyBpIDwgKDF1
bCA8PCBvcmRlcik7IGkrKyApDQo+ICsgICAgew0KPiArICAgICAgICBpZiAoIGlzX3NwZWNpYWxf
cGFnZShtZm5fdG9fcGFnZShtZm5fYWRkKG1mbiwgaSkpKSApDQo+ICsgICAgICAgIHsNCj4gKyAg
ICAgICAgICAgIGlmICggb3JkZXIgKQ0KPiArICAgICAgICAgICAgICAgIHJldHVybiAtMTsNCj4g
KyAgICAgICAgICAgICppcGF0ID0gMTsNCj4gKyAgICAgICAgICAgIHJldHVybiBNVFJSX1RZUEVf
V1JCQUNLOw0KPiArICAgICAgICB9DQo+ICsgICAgfQ0KPiArDQo+ICAgICAgZ210cnJfbXR5cGUg
PSBodm1fZ2V0X21lbV9waW5uZWRfY2FjaGVhdHRyKGQsIF9nZm4oZ2ZuKSwgb3JkZXIpOw0KPiAg
ICAgIGlmICggZ210cnJfbXR5cGUgPj0gMCApDQo+ICAgICAgew0KPiAtLQ0KPiAyLjIwLjENCg0K

