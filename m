Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A849C14C78B
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 09:32:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwij5-0002DT-JX; Wed, 29 Jan 2020 08:29:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xIWx=3S=amazon.co.uk=prvs=2906e62af=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iwij4-0002DO-3p
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 08:29:30 +0000
X-Inumbo-ID: 772eaa92-4271-11ea-8396-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 772eaa92-4271-11ea-8396-bc764e2007e4;
 Wed, 29 Jan 2020 08:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1580286569; x=1611822569;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=r1Xtt4Vha+I0HGWVes/diF6bUWUE1ChY1RihD/jN8Rw=;
 b=VYZGQNuo7+iiTmRvwEr50dHM0Er/ph4EE3YYGHQC88WnrsldxPLOw4uC
 IQlWonbL3Z16UjvoX2eZqTHHE6hFJSMlkzcVYvUV26j0pryqk6K6uOdvg
 6RAKmVP/TnXNBG03+9sUJuobgqc+mbmzjQ1j5S0Q0sSClhw2GlEy5o3IA w=;
IronPort-SDR: 8PPO667pVc8G2K830jVYFoMKkvDGcoOsDktqtpqPDiY/2iNPZTPORgHX3XHlJCTZF3jJvzrtB6
 ZF96LWhrI2kA==
X-IronPort-AV: E=Sophos;i="5.70,377,1574121600"; d="scan'208";a="23110350"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-5dd976cd.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 29 Jan 2020 08:29:15 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-5dd976cd.us-east-1.amazon.com (Postfix) with ESMTPS
 id 1E546A1BF6; Wed, 29 Jan 2020 08:29:10 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Wed, 29 Jan 2020 08:29:10 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 29 Jan 2020 08:29:09 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Wed, 29 Jan 2020 08:29:09 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH v4 5/7] mm: make MEMF_no_refcount pages safe to assign
Thread-Index: AQHV0stV93v0D184Bky82TB6Md/qV6gAOBIAgAAYoBCAAQP4AIAAAPKw
Date: Wed, 29 Jan 2020 08:29:09 +0000
Message-ID: <11ef929339a940c0859373fec8ae9306@EX13D32EUC003.ant.amazon.com>
References: <20200124153103.18321-1-pdurrant@amazon.com>
 <20200124153103.18321-6-pdurrant@amazon.com>
 <9376dca1-1bdd-ac08-d84a-e8ac101436d2@suse.com>
 <29425ac0b17d4772a162a097448cfee4@EX13D32EUC003.ant.amazon.com>
 <30f9919e-fcd8-3b7f-ff23-5fd9ce4ff78c@suse.com>
In-Reply-To: <30f9919e-fcd8-3b7f-ff23-5fd9ce4ff78c@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.63]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v4 5/7] mm: make MEMF_no_refcount pages safe
 to assign
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDI5IEphbnVhcnkgMjAyMCAwODoyMg0KPiBUbzogRHVycmFu
dCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPg0KPiBDYzogeGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnOyBBbmRyZXcgQ29vcGVyDQo+IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
PjsgR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tPjsNCj4gSWFuIEph
Y2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+OyBKdWxpZW4gR3JhbGwgPGp1bGllbkB4
ZW4ub3JnPjsNCj4gS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29t
PjsgU3RlZmFubyBTdGFiZWxsaW5pDQo+IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgV2VpIExp
dSA8d2xAeGVuLm9yZz47IFZvbG9keW15ciBCYWJjaHVrDQo+IDxWb2xvZHlteXJfQmFiY2h1a0Bl
cGFtLmNvbT47IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiBTdWJq
ZWN0OiBSZTogW1BBVENIIHY0IDUvN10gbW06IG1ha2UgTUVNRl9ub19yZWZjb3VudCBwYWdlcyBz
YWZlIHRvIGFzc2lnbg0KPiANCj4gT24gMjguMDEuMjAyMCAxODowMSwgRHVycmFudCwgUGF1bCB3
cm90ZToNCj4gPj4gRnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiA+PiBT
ZW50OiAyOCBKYW51YXJ5IDIwMjAgMTU6MjMNCj4gPj4NCj4gPj4gT24gMjQuMDEuMjAyMCAxNjoz
MSwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiA+Pj4gQ3VycmVudGx5IGl0IGlzIHVuc2FmZSB0byBh
c3NpZ24gYSBkb21oZWFwIHBhZ2UgYWxsb2NhdGVkIHdpdGgNCj4gPj4+IE1FTUZfbm9fcmVmY291
bnQgdG8gYSBkb21haW4gYmVjYXVzZSB0aGUgZG9tYWluJ3QgJ3RvdF9wYWdlcycgd2lsbCBub3QN
Cj4gPj4+IGJlIGluY3JlbWVudGVkLCBidXQgd2lsbCBiZSBkZWNyZW1lbnQgd2hlbiB0aGUgcGFn
ZSBpcyBmcmVlZCAoc2luY2UNCj4gPj4+IGZyZWVfZG9taGVhcF9wYWdlcygpIGhhcyBubyB3YXkg
b2YgdGVsbGluZyB0aGF0IHRoZSBpbmNyZW1lbnQgd2FzDQo+ID4+IHNraXBwZWQpLg0KPiA+Pj4N
Cj4gPj4+IFRoaXMgcGF0Y2ggYWxsb2NhdGVzIGEgbmV3ICdjb3VudF9pbmZvJyBiaXQgZm9yIGEg
UEdDX25vX3JlZmNvdW50IGZsYWcNCj4gPj4+IHdoaWNoIGlzIHRoZW4gdXNlZCB0byBtYXJrIGRv
bWhlYXAgcGFnZXMgYWxsb2NhdGVkIHdpdGgNCj4gPj4gTUVNRl9ub19yZWZjb3VudC4NCj4gPj4+
IFRoaXMgdGhlbiBhbGxvd3MgZnJlZV9kb21oZWFwX3BhZ2VzKCkgdG8gc2tpcCBkZWNyZW1lbnRp
bmcgdG90X3BhZ2VzDQo+ID4+IHdoZW4NCj4gPj4+IGFwcHJvcHJpYXRlIGFuZCBoZW5jZSBtYWtl
cyB0aGUgcGFnZXMgc2FmZSB0byBhc3NpZ24uDQo+ID4+Pg0KPiA+Pj4gTk9URTogVGhlIHBhdGNo
IHNldHMgTUVNRl9ub19yZWZjb3VudCBkaXJlY3RseSBpbg0KPiBhbGxvY19kb21oZWFwX3BhZ2Vz
KCkNCj4gPj4+ICAgICAgIHJhdGhlciB0aGFuIGluIGFzc2lnbl9wYWdlcygpIGJlY2F1c2UgdGhl
IGxhdHRlciBpcyBjYWxsZWQgd2l0aA0KPiA+Pj4gICAgICAgTUVNRl9ub19yZWZjb3VudCBieSBt
ZW1vcnlfZXhjaGFuZ2UoKSBhcyBhbiBvcHRpbWl6YXRpb24sIHRvDQo+IGF2b2lkDQo+ID4+PiAg
ICAgICB0b28gbWFueSBjYWxscyB0byBkb21haW5fYWRqdXN0X3RvdF9wYWdlcygpICh3aGljaCBh
Y3F1aXJlcyBhbmQNCj4gPj4+ICAgICAgIHJlbGVhc2VzIHRoZSBnbG9iYWwgJ2hlYXBfbG9jaycp
Lg0KPiA+Pg0KPiA+PiBJIGRvbid0IHRoaW5rIHRoZXJlIHdlcmUgYW55IG9wdGltaXphdGlvbiB0
aG91Z2h0cyB3aXRoIHRoaXMuIFRoZQ0KPiA+PiBNRU1GX25vX3JlZmNvdW50IHVzZSBpcyBiZWNh
dXNlIG90aGVyd2lzZSBmb3IgYSBkb21haW4gd2l0aA0KPiA+PiB0b3RfcGFnZXMgPT0gbWF4X3Bh
Z2VzIHRoZSBhc3NpZ25tZW50IHdvdWxkIGZhaWwuDQo+ID4+DQo+ID4NCj4gPiBUaGF0IHdvdWxk
IG5vdCBiZSB0aGUgY2FzZSBpZiB0aGUgY2FsbHMgdG8gc3RlYWxfcGFnZSgpIGZ1cnRoZXIgdXAN
Cj4gZGlkbid0DQo+ID4gcGFzcyBNRU1GX25vX3JlZmNvdW50ICh3aGljaCB3b3VsZCBiZSB0aGUg
Y29ycmVjdCB0aGluZyB0byBkbyBpZiBub3QNCj4gPiBwYXNzaW5nIGl0IHRvIGFzc2lnbl9wYWdl
cygpLg0KPiANCj4gTm8sIHRoYXQncyBub3QgYW4gb3B0aW9uIGVpdGhlcjogc3RlYWxfcGFnZSgp
IHdvdWxkIG90aGVyd2lzZSBkZWNyZW1lbnQNCj4gLT50b3RfcGFnZXMsIGFsbG93aW5nIHRoZSBk
b21haW4gdG8gYWxsb2NhdGUgbmV3IG1lbW9yeSBvbiBhbm90aGVyIHZDUFUuDQo+IFRoaXMgd291
bGQgYWdhaW4gcmVzdWx0IGluIHRoZSBleGNoYW5nZSBmYWlsaW5nIGZvciBubyByZWFzb24uIChB
bmQgbm8sDQo+IEkgZG9uJ3QgdGhpbmsgYSBndWVzdCBzaG91bGQgYmUgcmVxdWlyZWQgdG8gc2Vy
aWFsaXplIGUuZy4gYmFsbG9vbmluZw0KPiBvcGVyYXRpb25zIHdpdGggZXhjaGFuZ2VzLikNCj4g
DQoNCk9rLCB5ZXMgaXQgZG9lcyBtYWtlIGl0IG5vbi1hdG9taWMgYnV0IG15IHZpZXcgd291bGQg
YmUgdGhhdCB0aGUgZ3Vlc3Qgc2hvdWxkIG5vdCBiZSBzaW11bHRhbmVvdXNseSBiYWxsb29uaW5n
OyBob3dldmVyLCB3ZSBjbGVhcmx5IGRpZmZlciB0aGVyZS4NCg0KPiA+Pj4gLS0tIGEveGVuL2Nv
bW1vbi9wYWdlX2FsbG9jLmMNCj4gPj4+ICsrKyBiL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jDQo+
ID4+PiBAQCAtNDYwLDYgKzQ2MCw5IEBAIHVuc2lnbmVkIGxvbmcgZG9tYWluX2FkanVzdF90b3Rf
cGFnZXMoc3RydWN0DQo+IGRvbWFpbg0KPiA+PiAqZCwgbG9uZyBwYWdlcykNCj4gPj4+ICB7DQo+
ID4+PiAgICAgIGxvbmcgZG9tX2JlZm9yZSwgZG9tX2FmdGVyLCBkb21fY2xhaW1lZCwgc3lzX2Jl
Zm9yZSwgc3lzX2FmdGVyOw0KPiA+Pj4NCj4gPj4+ICsgICAgaWYgKCAhcGFnZXMgKQ0KPiA+Pj4g
KyAgICAgICAgZ290byBvdXQ7DQo+ID4+DQo+ID4+IFVucmVsYXRlZCBjaGFuZ2U/IEFyZSB0aGVy
ZSwgaW4gZmFjdCwgYW55IGNhbGxlcnMgcGFzc2luZyBpbiAwPw0KPiA+PiBPaCwgZnVydGhlciBk
b3duIHlvdSBhZGQgb25lIHdoaWNoIG1heSBkbyBzbywgYnV0IHRoZW4gcGVyaGFwcw0KPiA+PiBi
ZXR0ZXIgdG8gbWFrZSB0aGUgY2FsbGVyIG5vdCBjYWxsIGhlcmUgKGFzIGlzIGRvbmUgZS5nLiBp
bg0KPiA+PiBtZW1vcnlfZXhjaGFuZ2UoKSk/DQo+ID4NCj4gPiBJIHRoaW5rIGl0J3MgcHJlZmVy
YWJsZSBmb3IgZG9tYWluX2FkanVzdF90b3RfcGFnZXMoKSB0byBoYW5kbGUgemVybw0KPiA+IGdy
YWNlZnVsbHkuDQo+IA0KPiBUaGF0J3MgYW4gb3B0aW9uLCBidXQgaW1vIHdvdWxkIHRoZW4gYmV0
dGVyIGJlIGEgc2VwYXJhdGUgY2hhbmdlICh0bw0KPiBhbHNvIGRyb3AgcHJlc2VudCBndWFyZHMg
b2YgY2FsbHMgdG8gdGhlIGZ1bmN0aW9uKS4NCg0KT2ssIEknbGwgc3BsaXQgaXQgb3V0IGludG8g
YSBzZXBhcmF0ZSBwYXRjaC4NCg0KICBQYXVsDQoNCj4gDQo+IEphbg0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
