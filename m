Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D281704FA
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 17:57:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6zw4-000325-Ts; Wed, 26 Feb 2020 16:53:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=X74O=4O=amazon.co.uk=prvs=3186ee182=dwmw@srs-us1.protection.inumbo.net>)
 id 1j6zw3-000320-3c
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 16:53:23 +0000
X-Inumbo-ID: 7fbbf07c-58b8-11ea-aba8-bc764e2007e4
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7fbbf07c-58b8-11ea-aba8-bc764e2007e4;
 Wed, 26 Feb 2020 16:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1582736003; x=1614272003;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:mime-version: content-transfer-encoding;
 bh=IzeHGT7gAHgLj95ekbQGqLhbu+OsHX3ca3ydLQRfyBw=;
 b=UhdMMu/bEzrt5E31SDLoeXXmIeQtg5ICkk+6Ft2AIATgmfYtnzx0dqpj
 UHQndHknWUdXGV4xrAu00Wi1CNHV4D2cECnxVUJg89UghHCDjBQzfzHYo
 K61QZJuQFwEhBbN67BEASes/78Oi3Vf1pNbBKVd3bl2mXxMkjpdDASaCB w=;
IronPort-SDR: 4sLOtca4LXkEgXKAo74Kr85LLnKAWnNl/S7YZT/ow9iyclNSOEgrsgG7rJS0WmcXdX0fy78DT5
 YOmoBDznMiow==
X-IronPort-AV: E=Sophos;i="5.70,488,1574121600"; d="scan'208";a="18988783"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1e-a70de69e.us-east-1.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 26 Feb 2020 16:53:09 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1e-a70de69e.us-east-1.amazon.com (Postfix) with ESMTPS
 id 0EB46A0388; Wed, 26 Feb 2020 16:53:05 +0000 (UTC)
Received: from EX13D32EUB004.ant.amazon.com (10.43.166.212) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Wed, 26 Feb 2020 16:53:05 +0000
Received: from EX13D08UEE001.ant.amazon.com (10.43.62.126) by
 EX13D32EUB004.ant.amazon.com (10.43.166.212) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 26 Feb 2020 16:53:03 +0000
Received: from EX13D08UEE001.ant.amazon.com ([10.43.62.126]) by
 EX13D08UEE001.ant.amazon.com ([10.43.62.126]) with mapi id 15.00.1497.006;
 Wed, 26 Feb 2020 16:53:03 +0000
From: "Woodhouse, David" <dwmw@amazon.co.uk>
To: "jbeulich@suse.com" <jbeulich@suse.com>, "julien@xen.org"
 <julien@xen.org>, "Durrant, Paul" <pdurrant@amazon.co.uk>
Thread-Topic: [PATCH 2/2] domain: use PGC_extra domheap page for shared_info
Thread-Index: AQHV7MAWESUgz4HOnkaGlQ3+Cn/8nagtsOiA
Date: Wed, 26 Feb 2020 16:53:03 +0000
Message-ID: <7170eda8579cc4c9e6a899980a87e0eb0e9c71cd.camel@amazon.co.uk>
References: <20200225095357.3923-1-pdurrant@amazon.com>
 <20200225095357.3923-3-pdurrant@amazon.com>
 <2653c2cf-9add-dd0c-03e5-36d951ee621e@suse.com>
 <132bb159fcf049ae87e402537ccc7d2a@EX13D32EUC003.ant.amazon.com>
 <b9bb89e1-1490-c3e6-11b6-f6944750a791@suse.com>
 <f361c33b-1fdd-d296-edb3-3dbe8d0bc18b@xen.org>
In-Reply-To: <f361c33b-1fdd-d296-edb3-3dbe8d0bc18b@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.62.43]
Content-ID: <B4F8F71526E93C44934505CD355DE553@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH 2/2] domain: use PGC_extra domheap page for
 shared_info
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "wl@xen.org" <wl@xen.org>, "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAyMDIwLTAyLTI2IGF0IDE2OjEyICswMDAwLCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+
ICgrRGF2aWQpDQo+IA0KPiBPbiAyNi8wMi8yMDIwIDE1OjIzLCBKYW4gQmV1bGljaCB3cm90ZToN
Cj4gPiBPbiAyNi4wMi4yMDIwIDE1OjA1LCBEdXJyYW50LCBQYXVsIHdyb3RlOg0KPiA+ID4gPiBG
cm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+ID4gPiA+IFNlbnQ6IDI2IEZl
YnJ1YXJ5IDIwMjAgMTM6NTgNCj4gPiA+ID4gDQo+ID4gPiA+IE9uIDI1LjAyLjIwMjAgMTA6NTMs
IFBhdWwgRHVycmFudCB3cm90ZToNCj4gPiA+ID4gPiBUaGVyZSdzIG5vIHBhcnRpY3VsYXIgcmVh
c29uIHNoYXJlZF9pbmZvIG5lZWQgdXNlIGEgeGVuaGVhcCBwYWdlLiBJdCdzDQo+ID4gPiA+ID4g
b25seSBwdXJwb3NlIGlzIHRvIGJlIG1hcHBlZCBieSB0aGUgZ3Vlc3Qgc28gdXNlIGEgUEdDX2V4
dHJhIGRvbWhlYXANCj4gPiA+ID4gDQo+ID4gPiA+IHBhZ2UNCj4gPiA+ID4gPiBpbnN0ZWFkLg0K
PiA+ID4gPiANCj4gPiA+ID4gU2luY2UgdGhlIGNvdmVyIGxldHRlciBhbHNvIGRvZXNuJ3QgZ2l2
ZSBhbnkgYmFja2dyb3VuZCAtIGlzIHRoZXJlIGENCj4gPiA+ID4gcHJvYmxlbSB3aXRoIHRoZSBj
dXJyZW50IGFycmFuZ2VtZW50cz8gQXJlIHRoZXJlIGFueSBmdXJ0aGVyIHBsYW5zDQo+ID4gPiA+
IGRlcGVuZGluZyBvbiB0aGlzIGJlaW5nIGNoYW5nZWQ/IE9yIGlzIHRoaXMgc2ltcGx5ICJsZXQn
cyBkbyBpdA0KPiA+ID4gPiBiZWNhdXNlIG5vdyB3ZSBjYW4iPw0KPiA+ID4gPiANCj4gPiA+IA0K
PiA+ID4gVGhlIGdlbmVyYWwgZGlyZWN0aW9uIGlzIHRvIGdldCByaWQgb2Ygc2hhcmVkIHhlbmhl
YXAgcGFnZXMuIEtub3dpbmcNCj4gPiA+IHRoYXQgYSB4ZW5oZWFwIHBhZ2UgaXMgbm90IHNoYXJl
ZCB3aXRoIGEgZ3Vlc3QgbWFrZXMgZGVhbGluZyB3aXRoDQo+ID4gPiBsaXZlIHVwZGF0ZSBtdWNo
IGVhc2llciwNCj4gPiANCj4gPiBJIG1heSBub3QgYmUgc2VlaW5nIGVub3VnaCBvZiB0aGUgb3Zl
cmFsbCBwaWN0dXJlLCBidXQgaXQgd291bGQgc2VlbQ0KPiA+IHRvIG1lIHRoYXQgdGhlIHNwZWNp
YWwgdHJlYXRtZW50IG9mIHNoYXJlZCBYZW4gaGVhcCBwYWdlcyB3b3VsZCB0aGVuDQo+ID4gYmUg
cmVwbGFjZWQgYnkgc3BlY2lhbCB0cmVhdG1lbnQgb2YgUEdDX2V4dHJhIG9uZXMuDQo+IA0KPiBJ
IGhhdmUgYmVlbiB3b3JraW5nIG9uIExpdmV1cGRhdGUgZm9yIHRoZSBwYXN0IGNvdXBsZSBtb250
aHMgYW5kIEkgZG9uJ3QgDQo+ICAgcmVhbGx5IHNlZSBob3cgdGhpcyBpcyBnb2luZyB0byBtYWtl
IGxpdmV1cGRhdGUgZWFzaWVyLiBXZSB3aWxsIHN0aWxsIA0KPiBuZWVkIHRvIHNhdmUgdGhlIGV4
dHJhIGZsYWdzIGFuZCBleHRyYSByZWNvcmRzIGZvciBlYWNoIHN1YnN5c3RlbSB1c2luZyANCj4g
dGhlbSAoZS5nIGdyYW50LXRhYmxlcykuDQo+IA0KPiBJIGhhdmUgQ0NlZCBEYXZpZCB0byBzZWUg
aWYgaGUgaGFzIGEgZGlmZmVyZW50IG9waW5pb24uDQoNCkZvciBsaXZlIHVwZGF0ZSB3ZSBuZWVk
IHRvIGdpdmUgYSByZWdpb24gb2YgbWVtb3J5IHRvIHRoZSBuZXcgWGVuIHdoaWNoDQppdCBjYW4g
dXNlIGZvciBpdHMgYm9vdCBhbGxvY2F0b3IsIGJlZm9yZSBpdCdzIGhhbmRsZWQgYW55IG9mIHRo
ZSBsaXZlDQp1cGRhdGUgcmVjb3JkcyBhbmQgYmVmb3JlIGl0IGtub3dzIHdoaWNoICpvdGhlciog
bWVtb3J5IGlzIHN0aWxsDQphdmFpbGFibGUgZm9yIHVzZS4NCg0KSW4gb3JkZXIgdG8gZG8gdGhh
dCwgdGhlIG9yaWdpbmFsIFhlbiBoYXMgdG8gZW5zdXJlIHRoYXQgaXQgKmRvZXNuJ3QqDQp1c2Ug
YW55IG9mIHRoYXQgbWVtb3J5IHJlZ2lvbiBmb3IgZG9tYWluLW93bmVkIHBhZ2VzIHdoaWNoIHdv
dWxkIG5lZWQNCnRvIGJlIHByZXNlcnZlZC4NCg0KU28gZmFyIGluIHRoZSBwYXRjaGVzIEkndmUg
cG9zdGVkIHVwc3RyZWFtIEkgaGF2ZSBjaGVhdGVkLCBhbmQgc2ltcGx5DQoqbm90KiBhZGRlZCB0
aGVtIHRvIHRoZSBtYWluIGhlYXAuIEFueXRoaW5nIGFsbG9jYXRlZCBiZWZvcmUNCmVuZF9ib290
X2FsbG9jYXRvcigpIGlzIGZpbmUgYmVjYXVzZSBpdCBpcyAiZXBoZW1lcmFsIiB0byB0aGUgZmly
c3QgWGVuDQphbmQgZG9lc24ndCBuZWVkIHRvIGJlIHByZXNlcnZlZCAoaXQncyBtb3N0bHkgZnJh
bWUgdGFibGVzIGFuZCBhIGZldw0KUFRFIHBhZ2VzKS4NCg0KUGF1bCdzIHdvcmsgaXMgbWFraW5n
IGl0IHBvc3NpYmxlIHRvIHVzZSB0aG9zZSBwYWdlcyBhcyB4ZW5oZWFwIHBhZ2VzLA0Kc2FmZSBp
biB0aGUga25vd2xlZGdlIHRoYXQgdGhleSAqd29uJ3QqIGVuZCB1cCBiZWluZyBtYXBwZWQgdG8g
ZG9tYWlucywNCmFuZCB3b24ndCBuZWVkIHRvIGJlIHByZXNlcnZlZCBhY3Jvc3MgbGl2ZSB1cGRh
dGUuDQoNCg0KCgoKQW1hem9uIERldmVsb3BtZW50IENlbnRyZSAoTG9uZG9uKSBMdGQuIFJlZ2lz
dGVyZWQgaW4gRW5nbGFuZCBhbmQgV2FsZXMgd2l0aCByZWdpc3RyYXRpb24gbnVtYmVyIDA0NTQz
MjMyIHdpdGggaXRzIHJlZ2lzdGVyZWQgb2ZmaWNlIGF0IDEgUHJpbmNpcGFsIFBsYWNlLCBXb3Jz
aGlwIFN0cmVldCwgTG9uZG9uIEVDMkEgMkZBLCBVbml0ZWQgS2luZ2RvbS4KCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
