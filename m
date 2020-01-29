Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEDB14C966
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 12:17:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwlJb-00017z-V1; Wed, 29 Jan 2020 11:15:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xIWx=3S=amazon.co.uk=prvs=2906e62af=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iwlJa-00017u-HD
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 11:15:22 +0000
X-Inumbo-ID: a397a64e-4288-11ea-8396-bc764e2007e4
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a397a64e-4288-11ea-8396-bc764e2007e4;
 Wed, 29 Jan 2020 11:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1580296522; x=1611832522;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PBDdw3ew79GkBLWDidyCxVqUVKvtf6lQ2LdSzP5VAMs=;
 b=ESz/aYl95x4OZC2xPuTD495ruYJLCZfyTJrtjRyH4CboOoYteImNhntK
 gJgG5jKjIYtYAWUDmawTP3muD8Zp3Ig+0d8Avajn4dN2XYA6Jkbv9RI3c
 RVkaYKjvD3sMXn0IQyF/LxBDwVsUcF02g20FlrcUcngQUNqoCMlApwrPa U=;
IronPort-SDR: PCO+zoDvTmcvKBrneZ9vex3cEcWU8kx1DnW9SHSoNbeZE6CzRNanAqF7jlmkEzF9YwAsXJahCq
 HIk3cnwY11AA==
X-IronPort-AV: E=Sophos;i="5.70,377,1574121600"; d="scan'208";a="13371273"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-2c665b5d.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 29 Jan 2020 11:15:20 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-2c665b5d.us-east-1.amazon.com (Postfix) with ESMTPS
 id 74E46A1FA6; Wed, 29 Jan 2020 11:15:17 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Wed, 29 Jan 2020 11:15:16 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 29 Jan 2020 11:15:16 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Wed, 29 Jan 2020 11:15:15 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH v5 2/4] mm: modify domain_adjust_tot_pages() to better
 handle a zero adjustment
Thread-Index: AQHV1o08CoY6S5uCx0ms+knK1zJjPagBfOSAgAAAs5A=
Date: Wed, 29 Jan 2020 11:15:15 +0000
Message-ID: <12d3eccb15de4305894701b082abd2c8@EX13D32EUC003.ant.amazon.com>
References: <20200129101643.1394-1-pdurrant@amazon.com>
 <20200129101643.1394-3-pdurrant@amazon.com>
 <7fb63c3a-3ff1-c660-522b-0062029e252a@suse.com>
In-Reply-To: <7fb63c3a-3ff1-c660-522b-0062029e252a@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.63]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v5 2/4] mm: modify domain_adjust_tot_pages()
 to better handle a zero adjustment
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
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDI5IEphbnVhcnkgMjAyMCAxMToxMw0KPiBUbzogRHVycmFu
dCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPg0KPiBDYzogeGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnOyBBbmRyZXcgQ29vcGVyDQo+IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
PjsgR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tPjsNCj4gSWFuIEph
Y2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+OyBKdWxpZW4gR3JhbGwgPGp1bGllbkB4
ZW4ub3JnPjsNCj4gS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29t
PjsgU3RlZmFubyBTdGFiZWxsaW5pDQo+IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgV2VpIExp
dSA8d2xAeGVuLm9yZz4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NSAyLzRdIG1tOiBtb2RpZnkg
ZG9tYWluX2FkanVzdF90b3RfcGFnZXMoKSB0byBiZXR0ZXINCj4gaGFuZGxlIGEgemVybyBhZGp1
c3RtZW50DQo+IA0KPiBPbiAyOS4wMS4yMDIwIDExOjE2LCBQYXVsIER1cnJhbnQgd3JvdGU6DQo+
ID4gQ3VycmVudGx5IHRoZSBmdW5jdGlvbiB3aWxsIHBvaW50bGVzc2x5IGFjcXVpcmUgYW5kIHJl
bGVhc2UgdGhlIGdsb2JhbA0KPiA+ICdoZWFwX2xvY2snIGluIHRoaXMgY2FzZS4NCj4gPg0KPiA+
IE5PVEU6IE5vIGNhbGxlciB5ZXQgY2FsbHMgZG9tYWluX2FkanVzdF90b3RfcGFnZXMoKSB3aXRo
IGEgemVybyAncGFnZXMnDQo+ID4gICAgICAgYXJndW1lbnQsIGJ1dCBhIHN1YnNlcXVlbnQgcGF0
Y2ggd2lsbCBtYWtlIHRoaXMgcG9zc2libGUuDQo+IA0KPiBXaXRoIHRoaXMgbWVtb3J5X2V4Y2hh
bmdlKCksIGFzIHByZXZpb3VzbHkgaW5kaWNhdGVkLCBub3cgbmVlZGxlc3NseQ0KPiBwcmV2ZW50
cyB0aGUgY2FsbCB3aGVuICFkZWNfY291bnQuIEkgZG8gdGhpbmssIGFzIHNhaWQgdGhlcmUsIHRo
YXQNCj4gdG9nZXRoZXIgd2l0aCB0aGUgYWRkaXRpb24gaGVyZSB0aGVuIHJlZHVuZGFudCBjaGVj
a3MgaW4gY2FsbGVycw0KPiBzaG91bGQgYmUgZHJvcHBlZCAoYW5kIGFzIGl0IGxvb2tzIHRoZSBu
YW1lZCBvbmUgaXMgdGhlIG9ubHkgb25lKS4NCj4gDQoNCk9rLCB5ZXMgSSBtaXNzZWQgdGhhdC4N
Cg0KICBQYXVsDQoNCj4gSmFuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
