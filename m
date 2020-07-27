Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DAA22E906
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jul 2020 11:30:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jzzSY-0006On-Ey; Mon, 27 Jul 2020 09:30:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TI7O=BG=amazon.co.uk=prvs=4708ece4a=pdurrant@srs-us1.protection.inumbo.net>)
 id 1jzzSX-0006Oi-Pl
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2020 09:30:13 +0000
X-Inumbo-ID: c5ae7974-cfeb-11ea-8a80-bc764e2007e4
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c5ae7974-cfeb-11ea-8a80-bc764e2007e4;
 Mon, 27 Jul 2020 09:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1595842213; x=1627378213;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version:subject;
 bh=Tfv3ybfmHqTOct8fEpnQ5FJFdN5/L399NK+1GqmvEek=;
 b=l/1cygW3hw4Wbr58Qt9h/z1P6MoKbPrekljj/9p6A3oWn5GkgSD2PKHt
 NFj0HJ0t5e8jTMOmbE9q0Axhk72jXqeMuhwNg0kJTqmyTCGnYv6ZqUCkv
 9/0sYBdlzZo23jKuakBpmiH6QznvB2gRMwSurGQELVP7MhvSWtcWZy38H w=;
IronPort-SDR: F0jEPhKiMtLl/kJd3jVSfQbBKyqvEm8cbNRukCWafwkqD2nT4MwC4eE6jnr1BY+mItjboAhgtq
 bH36pzO/rxnA==
X-IronPort-AV: E=Sophos;i="5.75,402,1589241600"; d="scan'208";a="44328673"
Subject: RE: [PATCH 1/6] x86/iommu: re-arrange arch_iommu to separate common
 fields...
Thread-Topic: [PATCH 1/6] x86/iommu: re-arrange arch_iommu to separate common
 fields...
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-f273de60.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 27 Jul 2020 09:30:12 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-f273de60.us-east-1.amazon.com (Postfix) with ESMTPS
 id 1E74EA02D3; Mon, 27 Jul 2020 09:30:09 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 27 Jul 2020 09:30:09 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 27 Jul 2020 09:30:08 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Mon, 27 Jul 2020 09:30:08 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>, "paul@xen.org" <paul@xen.org>
Thread-Index: AQJEvXWV1fglpFS8p501Sb8VALJosQK2TIaJAcTpbVgCkV1pmQFR7GoUp/uB7nA=
Date: Mon, 27 Jul 2020 09:30:08 +0000
Message-ID: <70f75eeb115e4523ac3c47ecc732ea23@EX13D32EUC003.ant.amazon.com>
References: <20200724164619.1245-1-paul@xen.org>
 <20200724164619.1245-2-paul@xen.org>
 <68b40fdc-e578-7005-aa6e-499c6f04589c@citrix.com>
 <000001d661eb$392e1ae0$ab8a50a0$@xen.org>
 <63ed6df0-e456-48cd-6df0-601600871226@suse.com>
In-Reply-To: <63ed6df0-e456-48cd-6df0-601600871226@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.155]
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
Cc: 'Kevin Tian' <kevin.tian@intel.com>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>, 'Lukasz
 Hawrylko' <lukasz.hawrylko@linux.intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDI2IEp1bHkgMjAyMCAwOToxNA0KPiBUbzogcGF1bEB4ZW4u
b3JnDQo+IENjOiAnQW5kcmV3IENvb3BlcicgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyB4
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IER1cnJhbnQsIFBhdWwNCj4gPHBkdXJyYW50
QGFtYXpvbi5jby51az47ICdMdWthc3ogSGF3cnlsa28nIDxsdWthc3ouaGF3cnlsa29AbGludXgu
aW50ZWwuY29tPjsgJ1dlaSBMaXUnIDx3bEB4ZW4ub3JnPjsNCj4gJ1JvZ2VyIFBhdSBNb25uw6kn
IDxyb2dlci5wYXVAY2l0cml4LmNvbT47ICdLZXZpbiBUaWFuJyA8a2V2aW4udGlhbkBpbnRlbC5j
b20+DQo+IFN1YmplY3Q6IFJFOiBbRVhURVJOQUxdIFtQQVRDSCAxLzZdIHg4Ni9pb21tdTogcmUt
YXJyYW5nZSBhcmNoX2lvbW11IHRvIHNlcGFyYXRlIGNvbW1vbiBmaWVsZHMuLi4NCj4gDQo+IENB
VVRJT046IFRoaXMgZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2YgdGhlIG9yZ2FuaXph
dGlvbi4gRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4NCj4gYXR0YWNobWVudHMgdW5sZXNzIHlv
dSBjYW4gY29uZmlybSB0aGUgc2VuZGVyIGFuZCBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUuDQo+
IA0KPiANCj4gDQo+IE9uIDI0LjA3LjIwMjAgMjA6NDksIFBhdWwgRHVycmFudCB3cm90ZToNCj4g
Pj4gRnJvbTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCj4gPj4g
U2VudDogMjQgSnVseSAyMDIwIDE4OjI5DQo+ID4+DQo+ID4+IE9uIDI0LzA3LzIwMjAgMTc6NDYs
IFBhdWwgRHVycmFudCB3cm90ZToNCj4gPj4+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20t
eDg2L2lvbW11LmggYi94ZW4vaW5jbHVkZS9hc20teDg2L2lvbW11LmgNCj4gPj4+IGluZGV4IDZj
OWQ1ZTU2MzIuLmE3YWRkNTIwOGMgMTAwNjQ0DQo+ID4+PiAtLS0gYS94ZW4vaW5jbHVkZS9hc20t
eDg2L2lvbW11LmgNCj4gPj4+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvaW9tbXUuaA0KPiA+
Pj4gQEAgLTQ1LDE2ICs0NSwyMyBAQCB0eXBlZGVmIHVpbnQ2NF90IGRhZGRyX3Q7DQo+ID4+Pg0K
PiA+Pj4gIHN0cnVjdCBhcmNoX2lvbW11DQo+ID4+PiAgew0KPiA+Pj4gLSAgICB1NjQgcGdkX21h
ZGRyOyAgICAgICAgICAgICAgICAgLyogaW8gcGFnZSBkaXJlY3RvcnkgbWFjaGluZSBhZGRyZXNz
ICovDQo+ID4+PiAtICAgIHNwaW5sb2NrX3QgbWFwcGluZ19sb2NrOyAgICAgICAgICAgIC8qIGlv
IHBhZ2UgdGFibGUgbG9jayAqLw0KPiA+Pj4gLSAgICBpbnQgYWdhdzsgICAgIC8qIGFkanVzdGVk
IGd1ZXN0IGFkZHJlc3Mgd2lkdGgsIDAgaXMgbGV2ZWwgMiAzMC1iaXQgKi8NCj4gPj4+IC0gICAg
dTY0IGlvbW11X2JpdG1hcDsgICAgICAgICAgICAgIC8qIGJpdG1hcCBvZiBpb21tdShzKSB0aGF0
IHRoZSBkb21haW4gdXNlcyAqLw0KPiA+Pj4gLSAgICBzdHJ1Y3QgbGlzdF9oZWFkIG1hcHBlZF9y
bXJyczsNCj4gPj4+IC0NCj4gPj4+IC0gICAgLyogYW1kIGlvbW11IHN1cHBvcnQgKi8NCj4gPj4+
IC0gICAgaW50IHBhZ2luZ19tb2RlOw0KPiA+Pj4gLSAgICBzdHJ1Y3QgcGFnZV9pbmZvICpyb290
X3RhYmxlOw0KPiA+Pj4gLSAgICBzdHJ1Y3QgZ3Vlc3RfaW9tbXUgKmdfaW9tbXU7DQo+ID4+PiAr
ICAgIHNwaW5sb2NrX3QgbWFwcGluZ19sb2NrOyAvKiBpbyBwYWdlIHRhYmxlIGxvY2sgKi8NCj4g
Pj4+ICsNCj4gPj4+ICsgICAgdW5pb24gew0KPiA+Pj4gKyAgICAgICAgLyogSW50ZWwgVlQtZCAq
Lw0KPiA+Pj4gKyAgICAgICAgc3RydWN0IHsNCj4gPj4+ICsgICAgICAgICAgICB1NjQgcGdkX21h
ZGRyOyAvKiBpbyBwYWdlIGRpcmVjdG9yeSBtYWNoaW5lIGFkZHJlc3MgKi8NCj4gPj4+ICsgICAg
ICAgICAgICBpbnQgYWdhdzsgLyogYWRqdXN0ZWQgZ3Vlc3QgYWRkcmVzcyB3aWR0aCwgMCBpcyBs
ZXZlbCAyIDMwLWJpdCAqLw0KPiA+Pj4gKyAgICAgICAgICAgIHU2NCBpb21tdV9iaXRtYXA7IC8q
IGJpdG1hcCBvZiBpb21tdShzKSB0aGF0IHRoZSBkb21haW4gdXNlcyAqLw0KPiA+Pj4gKyAgICAg
ICAgICAgIHN0cnVjdCBsaXN0X2hlYWQgbWFwcGVkX3JtcnJzOw0KPiA+Pj4gKyAgICAgICAgfSB2
dGQ7DQo+ID4+PiArICAgICAgICAvKiBBTUQgSU9NTVUgKi8NCj4gPj4+ICsgICAgICAgIHN0cnVj
dCB7DQo+ID4+PiArICAgICAgICAgICAgaW50IHBhZ2luZ19tb2RlOw0KPiA+Pj4gKyAgICAgICAg
ICAgIHN0cnVjdCBwYWdlX2luZm8gKnJvb3RfdGFibGU7DQo+ID4+PiArICAgICAgICAgICAgc3Ry
dWN0IGd1ZXN0X2lvbW11ICpnX2lvbW11Ow0KPiA+Pj4gKyAgICAgICAgfSBhbWRfaW9tbXU7DQo+
ID4+PiArICAgIH07DQo+ID4+DQo+ID4+IFRoZSBuYW1pbmcgc3BsaXQgaGVyZSBpcyB3ZWlyZC4N
Cj4gPj4NCj4gPj4gSWRlYWxseSB3ZSdkIGhhdmUgc3RydWN0IHt2dGQsYW1kfV9pb21tdSBpbiBh
cHByb3ByaWF0ZSBoZWFkZXJzLCBhbmQNCj4gPj4gdGhpcyB3b3VsZCBiZSBzaW1wbHkNCj4gPj4N
Cj4gPj4gdW5pb24gew0KPiA+PiAgICAgc3RydWN0IHZ0ZF9pb21tdSB2dGQ7DQo+ID4+ICAgICBz
dHJ1Y3QgYW1kX2lvbW11IGFtZDsNCj4gPj4gfTsNCj4gPj4NCj4gPj4gSWYgdGhpcyBpc24ndCB0
cml2aWFsIHRvIGFycmFuZ2UsIGNhbiB3ZSBhdCBsZWFzdCBzL2FtZF9pb21tdS9hbWQvIGhlcmUg
Pw0KPiA+DQo+ID4gSSB3YXMgaW4gdHdvIG1pbmRzLiBJIHRyaWVkIHRvIGxvb2sgZm9yIGEgVExB
IGZvciB0aGUgQU1EIElPTU1VIGFuZCAnYW1kJyBzZWVtZWQgYSBsaXR0bGUgdG9vIG5vbi0NCj4g
ZGVzY3JpcHQuIEkgZG9uJ3QgcmVhbGx5IG1pbmQgdGhvdWdoIGlmIHRoZXJlJ3MgYSBzdHJvbmcg
cHJlZmVyZW5jZSB0byBzaG9ydGVkIGl0Lg0KPiANCj4gKzEgZm9yIHNob3J0ZW5pbmcgaW4gc29t
ZSB3YXkuIEV2ZW4gYW1kX3ZpIHdvdWxkIGFscmVhZHkgYmUgYmV0dGVyIGltbywNCj4gYWxiZWl0
IEknbSB3aXRoIEFuZHJldyBhbmQgd291bGQgdGhpbmsganVzdCBhbWQgaXMgZmluZSBoZXJlIChh
bmQNCj4gbWF0Y2hlcyBob3cgdGhpbmdzIGFyZSBpbiB0aGUgZmlsZSBzeXN0ZW0gc3RydWN0dXJl
KS4NCj4gDQoNCk9LLCBJJ2xsIHNob3J0ZW4gdG8gJ2FtZCcuDQoNCj4gV2hpbGUgYXQgaXQsIG1h
eSBJIGFzayB0aGF0IHlvdSBhbHNvIHN3aXRjaCB0aGUgcGxhaW4gImludCIgZmllbGRzIHRvDQo+
ICJ1bnNpZ25lZCBpbnQiIC0gSSB0aGluayB0aGF0J3MgZG9hYmxlIGZvciBib3RoIG9mIHRoZW0u
DQo+IA0KDQpTdXJlLCBJIGNhbiBkbyB0aGF0Lg0KDQogIFBhdWwNCg0KPiBKYW4NCg==

