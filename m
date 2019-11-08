Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDCCF4BB5
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2019 13:35:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iT3Sk-0007x0-86; Fri, 08 Nov 2019 12:34:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6MgQ=ZA=amazon.com=prvs=20800e630=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iT3Si-0007wq-De
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2019 12:34:00 +0000
X-Inumbo-ID: 09fabbd8-0224-11ea-9631-bc764e2007e4
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 09fabbd8-0224-11ea-9631-bc764e2007e4;
 Fri, 08 Nov 2019 12:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1573216440; x=1604752440;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6jVgc6Lf8uVoteLBqZ9PWOvQ6xGXgF5cLl3HBofExyE=;
 b=itSkjsQkb8vynxuFkMhhEqQegNp0CUO1tDraoHPXZ4+fcifQVkzZWEye
 On88zUy85WbRVkMjmwisSeSo/v+m28mjbeRDV+ZBgiYCt08dcxqna3huP
 aPsreqhSyLz+Zz53MkeMiIvFfvO190qoq+86xpnw6IUSI9m1TCLdyZd7L 0=;
IronPort-SDR: 2qXPSsYqTkEytea4XZoTj8kzvoMY41j9XlVMF3n+wlsqWOfbTou8xfSIhVAOiySjtl/tioVEgt
 eFh1+4E89Syw==
X-IronPort-AV: E=Sophos;i="5.68,281,1569283200"; 
   d="scan'208";a="3358633"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2b-c300ac87.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 08 Nov 2019 12:33:59 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-c300ac87.us-west-2.amazon.com (Postfix) with ESMTPS
 id 48620A2260; Fri,  8 Nov 2019 12:33:58 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 8 Nov 2019 12:33:57 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 8 Nov 2019 12:33:57 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Fri, 8 Nov 2019 12:33:56 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Jan Beulich
 <jbeulich@suse.com>
Thread-Topic: [Xen-devel] max_grant_frames/max_maptrack_frames
Thread-Index: AdWVkZiKYOkzy9UFQkGz/45sYHi0dwAl2OWAAAFCAwAAAK5okA==
Date: Fri, 8 Nov 2019 12:33:56 +0000
Message-ID: <a780a227d4cb4a269712f88370d1ec71@EX13D32EUC003.ant.amazon.com>
References: <f9e3fb8cadf44352851d865e850c6525@EX13D32EUC003.ant.amazon.com>
 <86d72e83-abf6-bef3-418f-49a69545fcb5@suse.com>
 <900c2b35-5296-0b74-b6ed-2f8f5e0474f5@suse.com>
In-Reply-To: <900c2b35-5296-0b74-b6ed-2f8f5e0474f5@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.7]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] max_grant_frames/max_maptrack_frames
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKw7xyZ2VuIEdyb8OfIDxqZ3Jv
c3NAc3VzZS5jb20+DQo+IFNlbnQ6IDA4IE5vdmVtYmVyIDIwMTkgMTI6MTQNCj4gVG86IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT47IER1cnJhbnQsIFBhdWwgPHBkdXJyYW50QGFtYXpv
bi5jb20+DQo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gU3ViamVjdDog
UmU6IFtYZW4tZGV2ZWxdIG1heF9ncmFudF9mcmFtZXMvbWF4X21hcHRyYWNrX2ZyYW1lcw0KPiAN
Cj4gT24gMDguMTEuMTkgMTI6MzgsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiA+IE9uIDA4LjExLjIw
MTkgMDk6NDUsICBEdXJyYW50LCBQYXVsICB3cm90ZToNCj4gPj4gV2hlbiBwZXItZG9tYWluIG9w
dGlvbnMgZm9yIG1heGltdW0gZ3JhbnQgYW5kIG1hcHRyYWNrIGZyYW1lcyBjYW1lIGluDQo+IChp
biA0LjEwPykgWGVuJ3MgYmVoYXZpb3VyIHcuci50LiB0byB0aGUgZ2xvYmFsIGNvbW1hbmQgbGlu
ZSB2YWx1ZXMNCj4gKGdudHRhYl9tYXhfZnJhbWVzIGFuZCBnbnR0YWJfbWF4X21hcHRyYWNrX2Zy
YW1lcyByZXNwZWN0aXZlbHkpIHJlZ3Jlc3NlZA0KPiA+Pg0KPiA+PiBGb3IgZXhhbXBsZSwgYSBo
b3N0IHJ1bm5pbmcgYSBwcmlvciB2ZXJzaW9uIG9mIFhlbiB3aXRoIGEgY29tbWFuZCBsaW5lDQo+
IHNldHRpbmcgZ250dGFiX21heF9mcmFtZXM9MTI4IHdvdWxkIGhhdmUgYWxsIG9mIGl0cyBkb21V
cyBydW5uaW5nIHdpdGggMTI4DQo+IGZyYW1lcy4gSG93ZXZlciwgYWZ0ZXIgdXBkYXRlIHRvIGEg
bmV3ZXIgWGVuLCB0aGV5IHdpbGwgb25seSBnZXQgMzIgZnJhbWVzDQo+ICh1bmxlc3MgdGhlIGhv
c3QgaXMgcGFydGljdWxhcmx5IGxhcmdlLCBpbiB3aGljaCBjYXNlIHRoZXkgd2lsbCBnZXQgNjQp
Lg0KPiBXaHkgaXMgdGhpcz8gSXQncyBiZWNhdXNlIG5laXRoZXIgeGwuY2ZnIGZpbGVzLCBub3Ig
eGwuY29uZiwgd2lsbCBzcGVjaWZ5DQo+IHZhbHVlcyAoYmVjYXVzZSB0aGUgc2NlbmFyaW8gaXMg
YW4gdXBkYXRlIGZyb20gYW4gb2xkZXIgaW5zdGFsbGF0aW9uKSBhbmQNCj4gc28gdGhlIGhhcmRj
b2RlZCAzMi82NCBkZWZhdWx0IGFwcGxpZXMuIEhlbmNlIHNvbWUgZG9tVXMgd2l0aCBsYXJnZQ0K
PiBudW1iZXJzIG9mIFBWIGRldmljZXMgc3RhcnQgZmFpbGluZyAob3IgYXQgbGVhc3Qgc3Vic3Rh
bnRpYWxseSBzbG93IGRvd24pDQo+IGFuZCBhZG1pbnMgc3RhcnQgd29uZGVyaW5nIHdoYXQncyBn
b2luZyBvbi4NCj4gPj4NCj4gPj4gU28gaG93IGJlc3QgdG8gZml4IHRoaXM/DQo+ID4+DQo+ID4+
IEZvciB0aGUgc2FrZSBvZiBhIHF1aWNrIGZpeCBmb3IgdGhlIHJlZ3Jlc3Npb24sIGFuZCBlYXNl
IG9mIGJhY2stDQo+IHBvcnRpbmcsIEkgdGhpbmsgaXQgd291bGQgYmUgYmVzdCB0byBhZGQgYSBj
aGVjayBpbiBkb21haW5fY3JlYXRlKCkgYW5kDQo+IGNyZWF0ZSB0aGUgZ3JhbnQgdGFibGUgd2l0
aCBwYXJhbWV0ZXJzIHdoaWNoIGFyZSB0aGUgbGFyZ2VyIG9mIHRoZQ0KPiB0b29sc3RhY2sgY29u
ZmlndXJlZCB2YWx1ZSBhbmQgdGhlIGNvcnJlc3BvbmRpbmcgY29tbWFuZCBsaW5lIHZhbHVlLg0K
PiA+DQo+ID4gSG93IGFib3V0IHBlb3BsZSBzaW1wbHkgc2V0dGluZyB0aGUgdmFsdWUgaW4geGwu
Y29uZiwgaWYgaW5kZWVkIGluIGNhbg0KPiBiZQ0KPiA+IHNldCB0aGVyZT8NCj4gPg0KPiA+PiBU
aGlzIGRvZXMsIGhvd2V2ZXIsIGdvIGFnYWluc3QgdGhlIHJlY2VudCBkaXJlY3Rpb24gb2YgdGhl
IHRvb2xzdGFjaw0KPiBnZXR0aW5nIGV4YWN0bHkgd2hhdCBpdCBhc2tlZCBmb3IuIFNvIGZvciB0
aGUgbG9uZ2VyIHRlcm0gSSBhbSB3b25kZXJpbmcNCj4gd2hldGhlciB0aGVyZSBvdWdodCB0byBi
ZSBhIHdheSBmb3IgdGhlIHRvb2xzdGFjayB0byBxdWVyeSB0aGUgZ2xvYmFsbHkNCj4gY29uZmln
dXJlZCBncmFudCB0YWJsZSBsaW1pdHMuIEEgR05UVEFCT1Agc2VlbXMgdGhlIHdyb25nIGNhbmRp
ZGF0ZSBmb3INCj4gdGhpcywgc2luY2UgR05UVEFCT1BzIGFyZSBwZXItZG9tYWluLCBzbyBJJ20g
d29uZGVyaW5nIGFib3V0IGEgbmV3IHN5c2N0bA0KPiB0byByZXR1cm4gdGhlIHZhbHVlIG9mIGEg
bmFtZWQgY29tbWFuZCBsaW5lIHBhcmFtZXRlci4NCj4gPg0KPiA+IFN1Y2ggYSBzZXJpZXMgd2Fz
IGFscmVhZHkgcG9zdGVkIChhbmQgZXZlbiBoYWQgc29tZSByZXZpZXcsIHNvIGl0J3MNCj4gPiBh
bHJlYWR5IGF0IHY0LCBidXQgaWlyYyBubyB1cGRhdGUgaGFzIGJlZW4gcHJvdmlkZWQgc2luY2Ug
TWF5KToNCj4gPiBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVu
LWRldmVsLzIwMTktDQo+IDA1L21zZzAyMjA2Lmh0bWwNCj4gDQo+IE15ICJIeXBlcnZpc29yIGZp
bGUgc3lzdGVtIiBzZXJpZXMgaW5jbHVkZXMgdGhhdCBmdW5jdGlvbmFsaXR5Og0KPiANCj4gaHR0
cHM6Ly9wYXRjaGV3Lm9yZy9YZW4vMjAxOTEwMDIxMTIwMDQuMjU3OTMtMS1qZ3Jvc3NAc3VzZS5j
b20vDQo+IA0KDQpPaCwgZXZlbiBiZXR0ZXIgOi0pDQoNCiAgUGF1bA0KDQo+IA0KPiBKdWVyZ2Vu
DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
