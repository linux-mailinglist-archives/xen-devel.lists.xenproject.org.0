Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 513BF17BC43
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 13:02:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jABe4-0001Vs-Ci; Fri, 06 Mar 2020 12:00:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FvQx=4X=amazon.co.uk=prvs=32702b987=pdurrant@srs-us1.protection.inumbo.net>)
 id 1jABe2-0001Vj-OO
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 11:59:58 +0000
X-Inumbo-ID: 002dc5ce-5fa2-11ea-a7b4-12813bfff9fa
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 002dc5ce-5fa2-11ea-a7b4-12813bfff9fa;
 Fri, 06 Mar 2020 11:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1583495998; x=1615031998;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version:subject;
 bh=GTDVVu9JcPCozCPfbP8Op6awcYQOvP3IndyYRQY0tTQ=;
 b=Bo0wovnQehvh64BAfpXPXMFuYeuIs0ICYQ0IKQuBSv3g9VbcwxQl6R/x
 8VTg546217NXBATtLU9DD1HCV4ImmB+XlFQVQEmv0MeVdGxCz+oO0VhM8
 XwMIQbPoo2NOaowetzE+tz/RzhpvStveN6IQdT88ANTwUsPYWBSgxMSgy w=;
IronPort-SDR: gaCxXl9tdZtMjd4NF15xUYnoy33WKsBwJ7RxwzbrrYy9WciU/NoZvmvQd8HXmAyGMQaHfgohjZ
 NQEpxyVtytBA==
X-IronPort-AV: E=Sophos;i="5.70,521,1574121600"; d="scan'208";a="21336729"
Thread-Topic: [PATCH 2/2] domain: use PGC_extra domheap page for shared_info
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2b-4e24fd92.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 06 Mar 2020 11:59:45 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-4e24fd92.us-west-2.amazon.com (Postfix) with ESMTPS
 id 5E7A9A23A9; Fri,  6 Mar 2020 11:59:44 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Fri, 6 Mar 2020 11:59:44 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 6 Mar 2020 11:59:43 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Fri, 6 Mar 2020 11:59:43 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: David Woodhouse <dwmw2@infradead.org>, Jan Beulich <jbeulich@suse.com>
Thread-Index: AQHV68GGHAJvfVndcEiEcAXBc0AZ06gtgfgAgAAAk6CAABdOAIAADbCAgAALX4CADczIAIAABEOAgAABtbA=
Date: Fri, 6 Mar 2020 11:59:42 +0000
Message-ID: <aa18335ad92d47d7bd34fb4719da0e2e@EX13D32EUC003.ant.amazon.com>
References: <20200225095357.3923-1-pdurrant@amazon.com>
 <20200225095357.3923-3-pdurrant@amazon.com>
 <2653c2cf-9add-dd0c-03e5-36d951ee621e@suse.com>
 <132bb159fcf049ae87e402537ccc7d2a@EX13D32EUC003.ant.amazon.com>
 <b9bb89e1-1490-c3e6-11b6-f6944750a791@suse.com>
 <f361c33b-1fdd-d296-edb3-3dbe8d0bc18b@xen.org>
 <7170eda8579cc4c9e6a899980a87e0eb0e9c71cd.camel@amazon.co.uk>
 <7de58cb0-d8b5-ea86-f573-151356edbb79@suse.com>
 <6e43af74fbdb712d7b9785c1cffdc43aadfafb3c.camel@infradead.org>
In-Reply-To: <6e43af74fbdb712d7b9785c1cffdc43aadfafb3c.camel@infradead.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.82]
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
 "julien@xen.org" <julien@xen.org>, "wl@xen.org" <wl@xen.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBEYXZpZCBXb29kaG91c2UgPGR3
bXcyQGluZnJhZGVhZC5vcmc+DQo+IFNlbnQ6IDA2IE1hcmNoIDIwMjAgMTE6NTMNCj4gVG86IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT47IER1cnJhbnQsIFBhdWwgPHBkdXJyYW50QGFt
YXpvbi5jby51az4NCj4gQ2M6IGp1bGllbkB4ZW4ub3JnOyBhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tOyBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBrb25yYWQud2lsa0BvcmFjbGUuY29tOw0KPiBW
b2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbTsgaWFuLmphY2tzb25AZXUuY2l0cml4LmNvbTsgd2xA
eGVuLm9yZzsgZ2VvcmdlLmR1bmxhcEBjaXRyaXguY29tOyB4ZW4tDQo+IGRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJFOiBbRVhURVJOQUxdW1BBVENIIDIvMl0gZG9tYWlu
OiB1c2UgUEdDX2V4dHJhIGRvbWhlYXAgcGFnZSBmb3Igc2hhcmVkX2luZm8NCj4gDQo+IE9uIEZy
aSwgMjAyMC0wMy0wNiBhdCAxMjozNyArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+ID4gSSd2
ZSBzdGFydGVkIGxvb2tpbmcgYXQgdGhlIGxhdGVzdCB2ZXJzaW9uIG9mIFBhdWwncyBzZXJpZXMs
IGJ1dCBJJ20NCj4gPiBzdGlsbCBzdHJ1Z2dsaW5nIHRvIHNlZSB0aGUgcGljdHVyZTogVGhlcmUn
cyBubyB0cnVlIGRpc3RpbmN0aW9uDQo+ID4gYmV0d2VlbiBYZW4gaGVhcCBhbmQgZG9tYWluIGhl
YXAgb24geDg2LTY0IChleGNlcHQgb24gdmVyeSBsYXJnZQ0KPiA+IHN5c3RlbXMpLiBUaGVyZWZv
cmUgaXQgaXMgdW5jbGVhciB0byBtZSB3aGF0ICJ0aG9zZSBwYWdlcyIgaXMgYWN0dWFsbHkNCj4g
PiByZWZlcnJpbmcgdG8gYWJvdmUuIFN1cmVseSBuZXcgWGVuIGNhbid0IGJlIGdpdmVuIGFueSBw
YWdlcyBpbiB1c2UNCj4gPiBfaW4gYW55IHdheV8gYnkgb2xkIFhlbiwgbm8gbWF0dGVyIHdoZXRo
ZXIgaXQncyBvbmVzIGFzc2lnbmVkIHRvDQo+ID4gZG9tYWlucywgb3Igb25lcyB1c2VkIGludGVy
bmFsbHkgdG8gKG9sZCkgWGVuLg0KPiANCj4gT2xkIGFuZCBuZXcgWGVuIGRvIG5vdCBjb2V4aXN0
LiBUaGVyZSBpcyBhIGtleGVjICh2aWEga2V4ZWNfcmVsb2MuUyBhbmQNCj4gcHVyZ2F0b3J5KSBm
cm9tIG9sZCB0byBuZXcuDQo+IA0KPiBUaGVyZSBhcmUgc29tZSBwYWdlcyB3aGljaCBuZXcgWGVu
IE1VU1QgTk9UIHNjcmliYmxlIG9uLCBiZWNhdXNlIHRoZXkNCj4gYWN0dWFsbHkgYmVsb25nIHRv
IHRoZSBkb21haW5zIGJlaW5nIHByZXNlcnZlZC4gVGhhdCBpbmNsdWRlcyB0aGUgRVBUDQo+IChv
ciBhdCBsZWFzdCBJT01NVSkgcGFnZSB0YWJsZXMuDQo+IA0KPiBJIHN1cHBvc2UgbmV3IFhlbiBh
bHNvIG11c3RuJ3Qgc2NyaWJibGUgb24gdGhlIHBhZ2VzIGluIHdoaWNoIG9sZCBYZW4NCj4gaGFz
IHBsYWNlZCB0aGUgbWlncmF0aW9uIGluZm9ybWF0aW9uIGZvciB0aG9zZSBkb21haW5zIGVpdGhl
ci4gQXQNCj4gbGVhc3QsIG5vdCB1bnRpbCBpdCdzIGNvbnN1bWVkIHRoZSBkYXRhLg0KPiANCj4g
QW55dGhpbmcgZWxzZSwgaG93ZXZlciwgaXMgZmluZSBmb3IgbmV3IFhlbiB0byBzY3JpYmJsZSBv
bi4gRmFpcmx5IG11Y2gNCj4gYW55dGhpbmcgdGhhdCB0aGUgb2xkIFhlbiBoYWQgYWxsb2NhdGVk
IGZyb20gaXRzIHhlbmhlYXAgKGFuZCBub3QNCj4gc3Vic2VxdWVudGx5IHNoYXJlZCB0byBhIGd1
ZXN0LCBxdikgaXMgbm8gbG9uZ2VyIHJlcXVpcmVkIGFuZCBjYW4gYmUNCj4gdHJlYXRlZCBhcyBm
cmVlIG1lbW9yeSBieSB0aGUgbmV3IFhlbiwgd2hpY2ggbm93IG93bnMgdGhlIG1hY2hpbmUuDQo+
IA0KDQouLi4gc28gZ2V0dGluZyByaWQgb2Ygc2hhcmVkIHhlbmhlYXAgcGFnZXMgYWx0b2dldGhl
ciBqdXN0IG1ha2VzIGxpZmUgZWFzaWVyLg0KDQogIFBhdWwNCg0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
