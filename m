Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C368910D44C
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 11:41:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iadgc-0002Dn-I7; Fri, 29 Nov 2019 10:39:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3pi/=ZV=amazon.com=prvs=22965b742=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iadgb-0002Di-HH
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 10:39:41 +0000
X-Inumbo-ID: 8c40c6c0-1294-11ea-9db0-bc764e2007e4
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8c40c6c0-1294-11ea-9db0-bc764e2007e4;
 Fri, 29 Nov 2019 10:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575023982; x=1606559982;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vGGysP1Y/YKpt361vBffa2FWcVv9SUbOVnQr8ftMnv4=;
 b=KuIFMwW10eHUBnhfZHbYquJNkrzBdacYLdAwTwSc+41hODj7wHow7glj
 hAx7iNxIsrzl0GntUCDy+1kBI+u51Wk0X85FrmUXxW6FJpVklvodqc+Xq
 5SUVg3omjQQAvJYYCa0ULqWSLgTqTC1yr6ZzXSq2k/76RSurS68lZqC7/ Y=;
IronPort-SDR: G0Xok0w8Yo23eAe88v9KobxdAeBXGGKhN3dPpEP/k0pwRoogh/ugn0HPpV4RJujrw59wHrsJIu
 0o7WRuXn/IAQ==
X-IronPort-AV: E=Sophos;i="5.69,257,1571702400"; 
   d="scan'208";a="2144266"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-5dd976cd.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 29 Nov 2019 10:39:30 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-5dd976cd.us-east-1.amazon.com (Postfix) with ESMTPS
 id E1A4BA2694; Fri, 29 Nov 2019 10:39:24 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 29 Nov 2019 10:39:24 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 29 Nov 2019 10:39:23 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Fri, 29 Nov 2019 10:39:23 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH-for-4.13 v5] Rationalize max_grant_frames and
 max_maptrack_frames handling
Thread-Index: AQHVpgw4W1UbyWJxu02lwfLbqnwkDKeh8cuAgAABpoCAAAIC4A==
Date: Fri, 29 Nov 2019 10:39:23 +0000
Message-ID: <4819dbb83d9a43bb9ea37fbe79d57941@EX13D32EUC003.ant.amazon.com>
References: <20191128165224.2959-1-pdurrant@amazon.com>
 <98816869-c1db-52c1-baba-b878cde88d7a@suse.com>
 <350c285e-424e-a722-b340-dbd3ea08c12f@suse.com>
In-Reply-To: <350c285e-424e-a722-b340-dbd3ea08c12f@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.244]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH-for-4.13 v5] Rationalize max_grant_frames
 and max_maptrack_frames handling
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
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
 <marmarek@invisiblethingslab.com>, Anthony PERARD <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDI5IE5vdmVtYmVyIDIwMTkgMTA6MjkNCj4gVG86IER1cnJh
bnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jb20+DQo+IENjOiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPjsgQW50aG9ueSBQRVJBUkQNCj4gPGFudGhvbnkucGVyYXJk
QGNpdHJpeC5jb20+OyBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+Ow0K
PiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IFZvbG9keW15ciBCYWJj
aHVrDQo+IDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT47IEdlb3JnZSBEdW5sYXAgPEdlb3Jn
ZS5EdW5sYXBAZXUuY2l0cml4LmNvbT47DQo+IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5j
aXRyaXguY29tPjsgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpDQo+IDxtYXJtYXJla0BpbnZp
c2libGV0aGluZ3NsYWIuY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pDQo+IDxzc3RhYmVsbGluaUBr
ZXJuZWwub3JnPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBLb25yYWQgUnplc3p1
dGVrDQo+IFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+OyBKdWxpZW4gR3JhbGwgPGp1bGll
bkB4ZW4ub3JnPjsgV2VpIExpdQ0KPiA8d2xAeGVuLm9yZz4NCj4gU3ViamVjdDogUmU6IFtQQVRD
SC1mb3ItNC4xMyB2NV0gUmF0aW9uYWxpemUgbWF4X2dyYW50X2ZyYW1lcyBhbmQNCj4gbWF4X21h
cHRyYWNrX2ZyYW1lcyBoYW5kbGluZw0KPiANCj4gT24gMjkuMTEuMjAxOSAxMToyMiwgSmFuIEJl
dWxpY2ggd3JvdGU6DQo+ID4gT24gMjguMTEuMjAxOSAxNzo1MiwgUGF1bCBEdXJyYW50IHdyb3Rl
Og0KPiA+PiAtLS0gYS94ZW4vY29tbW9uL2dyYW50X3RhYmxlLmMNCj4gPj4gKysrIGIveGVuL2Nv
bW1vbi9ncmFudF90YWJsZS5jDQo+ID4+IEBAIC04NCwxMSArODQsNDAgQEAgc3RydWN0IGdyYW50
X3RhYmxlIHsNCj4gPj4gICAgICBzdHJ1Y3QgZ3JhbnRfdGFibGVfYXJjaCBhcmNoOw0KPiA+PiAg
fTsNCj4gPj4NCj4gPj4gK3N0YXRpYyBpbnQgcGFyc2VfZ250dGFiX2xpbWl0KGNvbnN0IGNoYXIg
KnBhcmFtLCBjb25zdCBjaGFyICphcmcsDQo+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB1bnNpZ25lZCBpbnQgKnZhbHApDQo+ID4+ICt7DQo+ID4+ICsgICAgY29uc3QgY2hhciAq
ZTsNCj4gPj4gKyAgICB1bnNpZ25lZCBsb25nIHZhbDsNCj4gPj4gKw0KPiA+PiArICAgIHZhbCA9
IHNpbXBsZV9zdHJ0b3VsKGFyZywgJmUsIDApOw0KPiA+PiArICAgIGlmICggKmUgKQ0KPiA+PiAr
ICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gPj4gKw0KPiA+PiArICAgIGlmICggdmFsID4gSU5U
X01BWCApDQo+ID4+ICsgICAgICAgIHJldHVybiAtRVJBTkdFOw0KPiA+PiArDQo+ID4+ICsgICAg
cmV0dXJuIDA7DQo+ID4+ICt9DQo+ID4NCj4gPiAqdmFscCBkb2Vzbid0IGdldCB3cml0dGVuIHRv
IGFueW1vcmUuDQoNClRoYXQgd2FzIGludGVudGlvbmFsLCBnaXZlbiBKdWVyZ2VuJ3MgY29tbWVu
dC4uLg0KDQo+IFdpdGggdGhpcyBmaXhlZCAoYW5kIG5vIG5ldw0KPiA+IGlzc3VlcyBpbnRyb2R1
Y2VkIDstKSApIGh5cGVydmlzb3Igc2lkZQ0KPiA+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+DQo+IA0KPiBBbmQgSSBndWVzcyBJIHNob3VsZCBoYXZlIGNsYXJp
ZmllZDogSSdkIGJlIGZpbmUgYWRkaW5nIHRoZSBtaXNzaW5nDQo+IGFzc2lnbm1lbnQgd2hpbGUg
Y29tbWl0dGluZywgcHJvdmlkZWQgdGhlIHRvb2xzIHNpZGUgd29uJ3QgcmVxdWlyZQ0KPiBhbnkg
Y2hhbmdlcy4NCg0KLi4uYnV0IGlmIHdlIHdhbnQgdG8gYWxsb3cgZG9tMCB0byBzZXQgaXRzZWxm
IHVwIGZvciBJTlRfTUFYIGZyYW1lcyBpbiB0aGUgZXZlbnQgb2YgYSBiYWQgdmFsdWUgdGhlbiBJ
J20gbm90IG9iamVjdGluZy4NCg0KICBQYXVsDQoNCj4gDQo+IEphbg0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
