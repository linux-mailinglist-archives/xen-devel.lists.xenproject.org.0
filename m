Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4C8177A85
	for <lists+xen-devel@lfdr.de>; Tue,  3 Mar 2020 16:35:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j99Wx-00056R-38; Tue, 03 Mar 2020 15:32:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=x433=4U=amazon.co.uk=prvs=32428865a=pdurrant@srs-us1.protection.inumbo.net>)
 id 1j99Wv-00056L-Od
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 15:32:21 +0000
X-Inumbo-ID: 2c817750-5d64-11ea-8efe-bc764e2007e4
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2c817750-5d64-11ea-8efe-bc764e2007e4;
 Tue, 03 Mar 2020 15:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1583249541; x=1614785541;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version:subject;
 bh=i6uT//yhOw/X3bL8C38bWW4OCXWML7QfsXAf1xz5HKQ=;
 b=WD7Fufqthf7akH03xyRCknw2wFETFxu++RIwXE/1OqojEDjndmmXgGnn
 TApb3me8iQ6EoDz1L1lenqvTuM8hL5XSdmK61UiPvCs9Gp8NhWJ9MbTOZ
 2wZbsrR33bQs2p6x7ir1GiNLinXnYlLfXcxM47xxBHQDYJNvDJZcvfg5a o=;
IronPort-SDR: obHIhhKBBxU1IgnHPyWldTcNWWkiMv+dHl/u8WaL7RsfylTt1Yx9CWs/4B8POB6WaQeUyCt64h
 KbFb+b/V53rg==
X-IronPort-AV: E=Sophos;i="5.70,511,1574121600"; d="scan'208";a="19298292"
Thread-Topic: [Xen-devel] [PATCH v5 3/4] x86/mm: use cache in
 guest_walk_tables()
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-27fb8269.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 03 Mar 2020 15:32:09 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-27fb8269.us-east-1.amazon.com (Postfix) with ESMTPS
 id 8BD38A2193; Tue,  3 Mar 2020 15:32:07 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Tue, 3 Mar 2020 15:32:07 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 3 Mar 2020 15:32:06 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Tue, 3 Mar 2020 15:32:05 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Index: AQHV8UVxcU5oQ1vnR0CG5a9bpklj46g2+t5A
Date: Tue, 3 Mar 2020 15:32:05 +0000
Message-ID: <29d746c5230d4778bdbafa79094a75d0@EX13D32EUC003.ant.amazon.com>
References: <1e1ccd2a-526c-631b-7889-35f993b2005e@suse.com>
 <80df5080-ed2f-60cb-a94d-15d856218d38@suse.com>
In-Reply-To: <80df5080-ed2f-60cb-a94d-15d856218d38@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.151]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v5 3/4] x86/mm: use cache in
 guest_walk_tables()
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Tim Deegan <tim@xen.org>, Wei Liu <wl@xen.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgSmFuIEJldWxpY2gN
Cj4gU2VudDogMDMgTWFyY2ggMjAyMCAxMDoxOQ0KPiBUbzogeGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnDQo+IENjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
PjsgUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBUaW0gRGVlZ2FuDQo+
IDx0aW1AeGVuLm9yZz47IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBQYXVsIER1cnJhbnQgPHBhdWxA
eGVuLm9yZz4NCj4gU3ViamVjdDogW0VYVEVSTkFMXVtYZW4tZGV2ZWxdIFtQQVRDSCB2NSAzLzRd
IHg4Ni9tbTogdXNlIGNhY2hlIGluIGd1ZXN0X3dhbGtfdGFibGVzKCkNCj4gDQo+IENBVVRJT046
IFRoaXMgZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2YgdGhlIG9yZ2FuaXphdGlvbi4g
RG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4NCj4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBjYW4g
Y29uZmlybSB0aGUgc2VuZGVyIGFuZCBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUuDQo+IA0KPiAN
Cj4gDQo+IEVtdWxhdGlvbiByZXF1aXJpbmcgZGV2aWNlIG1vZGVsIGFzc2lzdGFuY2UgdXNlcyBh
IGZvcm0gb2YgaW5zdHJ1Y3Rpb24NCj4gcmUtZXhlY3V0aW9uLCBhc3N1bWluZyB0aGF0IHRoZSBz
ZWNvbmQgKGFuZCBhbnkgZnVydGhlcikgcGFzcyB0YWtlcw0KPiBleGFjdGx5IHRoZSBzYW1lIHBh
dGguIFRoaXMgaXMgYSB2YWxpZCBhc3N1bXB0aW9uIGFzIGZhciBhcyB1c2Ugb2YgQ1BVDQo+IHJl
Z2lzdGVycyBnb2VzIChhcyB0aG9zZSBjYW4ndCBjaGFuZ2Ugd2l0aG91dCBhbnkgb3RoZXIgaW5z
dHJ1Y3Rpb24NCj4gZXhlY3V0aW5nIGluIGJldHdlZW4gWzFdKSwgYnV0IGlzIHdyb25nIGZvciBt
ZW1vcnkgYWNjZXNzZXMuIEluDQo+IHBhcnRpY3VsYXIgaXQgaGFzIGJlZW4gb2JzZXJ2ZWQgdGhh
dCBXaW5kb3dzIG1pZ2h0IHBhZ2Ugb3V0IGJ1ZmZlcnMNCj4gdW5kZXJuZWF0aCBhbiBpbnN0cnVj
dGlvbiBjdXJyZW50bHkgdW5kZXIgZW11bGF0aW9uIChoaXR0aW5nIGJldHdlZW4gdHdvDQo+IHBh
c3NlcykuIElmIHRoZSBmaXJzdCBwYXNzIHRyYW5zbGF0ZWQgYSBsaW5lYXIgYWRkcmVzcyBzdWNj
ZXNzZnVsbHksIGFueQ0KPiBzdWJzZXF1ZW50IHBhc3MgbmVlZHMgdG8gZG8gc28gdG9vLCB5aWVs
ZGluZyB0aGUgZXhhY3Qgc2FtZSB0cmFuc2xhdGlvbi4NCj4gVG8gZ3VhcmFudGVlIHRoaXMsIGxl
dmVyYWdlIHRoZSBjYWNoaW5nIHRoYXQgbm93IGJhY2tzIEhWTSBpbnNuDQo+IGVtdWxhdGlvbi4N
Cj4gDQo+IFsxXSBPdGhlciB0aGFuIG9uIGFjdHVhbCBoYXJkd2FyZSwgYWN0aW9ucyBsaWtlDQo+
ICAgICBYRU5fRE9NQ1RMX3NldGh2bWNvbnRleHQsIFhFTl9ET01DVExfc2V0dmNwdWNvbnRleHQs
DQo+ICAgICBWQ1BVT1BfaW5pdGlhbGlzZSwgSU5JVCwgb3IgU0lQSSBpc3N1ZWQgYWdhaW5zdCB0
aGUgdkNQVSBjYW4gb2NjdXINCj4gICAgIHdoaWxlIHRoZSB2Q1BVIGlzIGJsb2NrZWQgd2FpdGlu
ZyBmb3IgYSBkZXZpY2UgbW9kZWwgdG8gcmV0dXJuIGRhdGEuDQo+ICAgICBJbiBzdWNoIGNhc2Vz
IGVtdWxhdGlvbiBub3cgZ2V0cyBjYW5jZWxlZCwgdGhvdWdoLCBhbmQgaGVuY2UgcmUtDQo+ICAg
ICBleGVjdXRpb24gY29ycmVjdG5lc3MgaXMgdW5hZmZlY3RlZC4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IFBhdWwg
RHVycmFudCA8cGR1cnJhbnRAYW16bi5jb20+DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
