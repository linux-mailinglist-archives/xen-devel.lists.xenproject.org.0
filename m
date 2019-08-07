Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E4785031
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 17:47:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvO6J-000859-TT; Wed, 07 Aug 2019 15:43:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dGpx=WD=amazon.com=prvs=115058da6=elnikety@srs-us1.protection.inumbo.net>)
 id 1hvO6H-000854-He
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 15:43:41 +0000
X-Inumbo-ID: 20ee6c10-b92a-11e9-bff0-abb24631e925
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 20ee6c10-b92a-11e9-bff0-abb24631e925;
 Wed, 07 Aug 2019 15:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1565192620; x=1596728620;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=tqRCNYlIfa2fLdCO1b1LiD3Ej6Noe0zs3xjFmH2IU7s=;
 b=KfNyB3Naz9IVty+XQeZn/mYnvX5J6hnQJDovUCymtSJd2wDomtwcQY9K
 De1iQIkEptLR7ebrUv+WCk8R1u4YZian+4XZEv1k1EICaU6U6bfkMDjlU
 TSmV22LstrxAE/NbMAuBaZMGME6/HvmP8tiC5KUBn6zMF1hRb3J1HD9Tg I=;
X-IronPort-AV: E=Sophos;i="5.64,357,1559520000"; d="scan'208";a="745628864"
Received: from iad6-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1d-37fd6b3d.us-east-1.amazon.com) ([10.124.125.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 07 Aug 2019 15:43:39 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-37fd6b3d.us-east-1.amazon.com (Postfix) with ESMTPS
 id 250BE281DAD; Wed,  7 Aug 2019 15:43:35 +0000 (UTC)
Received: from EX13D08UEE001.ant.amazon.com (10.43.62.126) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 7 Aug 2019 15:43:35 +0000
Received: from EX13D03EUA002.ant.amazon.com (10.43.165.166) by
 EX13D08UEE001.ant.amazon.com (10.43.62.126) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 7 Aug 2019 15:43:34 +0000
Received: from EX13D03EUA002.ant.amazon.com ([10.43.165.166]) by
 EX13D03EUA002.ant.amazon.com ([10.43.165.166]) with mapi id 15.00.1367.000;
 Wed, 7 Aug 2019 15:43:34 +0000
From: "Elnikety, Eslam" <elnikety@amazon.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH] evtchn: make support for different ABIs tunable
Thread-Index: AQHVTRIxUNF+eOebUkSjRBUx8cK6DqbvsZ8AgAAh+YA=
Date: Wed, 7 Aug 2019 15:43:34 +0000
Message-ID: <9C00D857-BEEC-4805-A1AB-44986C1D795F@amazon.com>
References: <20190807112024.19480-1-elnikety@amazon.com>
 <33d6bbb5-cecd-a499-89f4-1592a3fb0eac@citrix.com>
In-Reply-To: <33d6bbb5-cecd-a499-89f4-1592a3fb0eac@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.68]
Content-ID: <904DE7E8197A4446B76759A1E373E6DC@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH] evtchn: make support for different ABIs
 tunable
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim
 Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Woodhouse,
 David" <dwmw@amazon.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gNy4gQXVnIDIwMTksIGF0IDE1OjQxLCBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IE9uIDA3LzA4LzIwMTkgMTI6MjAsIEVzbGFt
IEVsbmlrZXR5IHdyb3RlOg0KPj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3B1YmxpYy9kb21j
dGwuaCBiL3hlbi9pbmNsdWRlL3B1YmxpYy9kb21jdGwuaA0KPj4gaW5kZXggMTk0ODZkNWUzMi4u
NjU0YjRmZGQyMiAxMDA2NDQNCj4+IC0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy9kb21jdGwuaA0K
Pj4gKysrIGIveGVuL2luY2x1ZGUvcHVibGljL2RvbWN0bC5oDQo+PiBAQCAtNjQsNiArNjQsOSBA
QCBzdHJ1Y3QgeGVuX2RvbWN0bF9jcmVhdGVkb21haW4gew0KPj4gIC8qIElzIHRoaXMgYSB4ZW5z
dG9yZSBkb21haW4/ICovDQo+PiAjZGVmaW5lIF9YRU5fRE9NQ1RMX0NERl94c19kb21haW4gICAg
IDQNCj4+ICNkZWZpbmUgWEVOX0RPTUNUTF9DREZfeHNfZG9tYWluICAgICAgKDFVPDxfWEVOX0RP
TUNUTF9DREZfeHNfZG9tYWluKQ0KPj4gKyAvKiBEaXNhYmxlIEZJRk8gZXZlbnQgY2hhbm5lbHM/
ICovDQo+PiArI2RlZmluZSBfWEVOX0RPTUNUTF9DREZfZGlzYWJsZV9maWZvICA1DQo+PiArI2Rl
ZmluZSBYRU5fRE9NQ1RMX0NERl9kaXNhYmxlX2ZpZm8gICAoMVU8PF9YRU5fRE9NQ1RMX0NERl9k
aXNhYmxlX2ZpZm8pDQo+PiAgICAgdWludDMyX3QgZmxhZ3M7DQo+IA0KPiBPbiB0aGUgc3ViamVj
dCBvZiB0aGUgdGhlIHBhdGNoIGl0c2VsZiwgSSB0aGluayB0aGlzIGlzIGJyb2FkbHkgdGhlDQo+
IHJpZ2h0IHByaW5jaXBsZSwgYnV0IHdhbnRzIHRvIGJlIGV4cHJlc3NlZCBkaWZmZXJlbnRseS4N
Cj4gDQo+IEZpcnN0LCB5b3UnbGwgd2FudCB0byByZWJhc2Ugb250byBhIHZlcnkgcmVjZW50IG1h
c3RlciwgYW5kIHNwZWNpZmljYWxseQ0KPiBvdmVyIGMvcyBkOGYyNDkwNTYxZWIgd2hpY2ggaGFz
IGNoYW5nZWQgaG93IHRoaXMgZmllbGQgaXMgaGFuZGxlZCBpbiBYZW4uDQoNClRoZSBwYXRjaCB3
YXMgYWxyZWFkeSBvbiBtYXN0ZXIgYy9zIDBhNmFkMDQ1YzVmZS4gVGhhdCBzYWlkLCBJIHdhcyBu
b3QgdXNpbmcgdGhlIG5ldyBkLT5vcHRpb25zLiBUaGFua3MgZm9yIHRoZSBoaW50LiB2MiB3aWxs
Lg0KDQo+IA0KPiBGdXJ0aGVybW9yZSwgaWYgdGhlcmUgaXMgdGhpcyBwcm9ibGVtIGZvciBldmVu
dCBjaGFubmVscywgdGhlbiB0aGVyZSBpcw0KPiBhbG1vc3QgY2VydGFpbmx5IGEgcmVsYXRlZCBw
cm9ibGVtIGZvciBncmFudCB0YWJsZXMuDQoNCkkgd291bGQgY29uY3VyLiBGb3IgZ3JhbnQgdGFi
bGVzLCB0aGVyZSBpcyBhdCBsZWFzdCB0aGUgb3B0X2dudHRhYl9tYXhfdmVyc2lvbiBjb250cm9s
bGVkIGJ5IGNvbW1hbmRsaW5lLiBJdCB3b3VsZCBiZSBuaWNlIHRvIGhhdmUgaXQgcGVyLWRvbWFp
bi4NCg0KPiANCj4gVGhlIGNvbnRyb2wgaW4gWGVuIHNob3VsZCBiZSBleHByZXNzZWQgaW4gYSBw
b3NpdGl2ZSBmb3JtLCBvciB0aGUgbG9naWMNCj4gd2lsbCBiZWNvbWUgYSB0YW5nbGUuICBJdCBz
aG91bGQgYmUgYSBiaXQgcGVybWl0dGluZyB0aGUgdXNlIG9mIHRoZSBGSUZPDQo+IEFCSSwgcmF0
aGVyIHRoYW4gYSBiaXQgc2F5aW5nICJvaCBhY3R1YWxseSwgeW91IGNhbid0IHVzZSB0aGF04oCd
Lg0KDQpJIGNob3NlIHRoZSBuZWdhdGl2ZSBmb3JtIHNpbmNlIG90aGVyd2lzZSB0aGUgcGF0Y2gg
d2lsbCBoYXZlIHRvIGVuYWJsZSB0aGF0IGJpdCBpbiBtYW55IHBsYWNlcyB0byByZXRhaW4gdGhl
IGN1cnJlbnQgZGVmYXVsdCBiZWhhdmlvdXIgb2YgYWxsb3dpbmcgRklGTyB1bmxlc3Mgc3RhdGVk
IG90aGVyd2lzZS4gKFRoZSBmb3JtLCBhcyBpcywgaXMgc2ltaWxhciB0byBvdGhlciBrbm9iczog
ZmVhdHVyZS1kaXNhYmxlLWtleWJvYXJkIGFuZCBmZWF0dXJlLWRpc2FibGUtcG9pbnRlci4pDQoN
Cj4gDQo+IFRoYXQgc2FpZCwgaXQgbWlnaHQgYmUgZWFzaWVyIHRvIGRlY2xhcmUgRklGTyB0byBi
ZSAiZXZlbnQgY2hhbm5lbCB2MiIsDQo+IGFuZCBzcGVjaWZ5IG1heF97Z3JhbnQsZXZudGNobn1f
dmVyIGluc3RlYWQuDQo+IA0KPiBJJ20gb3BlbiB0byBvdGhlciBzdWdnZXN0aW9ucyBhcyB3ZWxs
Lg0KPiANCj4gfkFuZHJldw0KDQoNCkFuZHJldywgSmFuLCBhbmQgSnVsaWVuLCB0aGFua3MgZm9y
IHJldmlld2luZyBhbmQgdGhlIGZlZWRiYWNrLiBJIHdpbGwgcmV2aXNlIGFuZCBzZW5kIHYyIG92
ZXIgdGhlIG5leHQgY291cGxlIG9mIGRheXMuIA0KDQpUaGFua3MsDQpFc2xhbQ0KDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
