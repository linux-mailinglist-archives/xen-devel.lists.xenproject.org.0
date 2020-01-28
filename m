Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8763814BE5F
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 18:15:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwUQG-0004IQ-Rj; Tue, 28 Jan 2020 17:13:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0vDG=3R=amazon.co.uk=prvs=289a7b1b7=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iwUQF-0004IK-DA
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 17:13:07 +0000
X-Inumbo-ID: 73a34980-41f1-11ea-ad98-bc764e2007e4
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 73a34980-41f1-11ea-ad98-bc764e2007e4;
 Tue, 28 Jan 2020 17:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1580231587; x=1611767587;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=qHlbiPxmF6CYosm8GKxvha4GwE++ulOY4a7P6ACVz1M=;
 b=qIuCTuY1+QqABZr4weDDwOfOQP3fjZaB5KQFzv+fizy/u0NsCy0DCbPg
 RG0UBhj/NH6UFBIM1iQ9ypygnd7wqWs1jfm3qcj/q3Uurjf5FVpnFLmed
 cJ7m2UIU85oVRe8IQSMdj4g6DU5HkZNe0hn6mYfIh5o70mZsbu03k5MFe M=;
IronPort-SDR: zC/83aNpisrSdTNOSJ/K1AVVR8u7lzSSgFQvABm1pAHVEB3zKfkHt93nuraVCgSbbKRruPJ18u
 LqLTYUDjsL4Q==
X-IronPort-AV: E=Sophos;i="5.70,374,1574121600"; d="scan'208";a="14532339"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-c7c08562.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 28 Jan 2020 17:13:06 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1e-c7c08562.us-east-1.amazon.com (Postfix) with ESMTPS
 id 161CD2431D8; Tue, 28 Jan 2020 17:13:02 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Tue, 28 Jan 2020 17:13:02 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 28 Jan 2020 17:13:01 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Tue, 28 Jan 2020 17:13:01 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH v4 5/7] mm: make MEMF_no_refcount pages safe to assign
Thread-Index: AQHV0stV93v0D184Bky82TB6Md/qV6gAOBIAgAAYoBCAAAWR8A==
Date: Tue, 28 Jan 2020 17:13:01 +0000
Message-ID: <4aa3ae61ea1142639442652207607c22@EX13D32EUC003.ant.amazon.com>
References: <20200124153103.18321-1-pdurrant@amazon.com>
 <20200124153103.18321-6-pdurrant@amazon.com>
 <9376dca1-1bdd-ac08-d84a-e8ac101436d2@suse.com> 
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KW3NuaXBdDQo+ID4gPiBAQCAtMjMzMSwxMSAr
MjMzMSwyMCBAQCBzdHJ1Y3QgcGFnZV9pbmZvICphbGxvY19kb21oZWFwX3BhZ2VzKA0KPiA+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtZW1mbGFncywgZCkpID09IE5VTEwp
KSApDQo+ID4gPiAgICAgICAgICAgcmV0dXJuIE5VTEw7DQo+ID4gPg0KPiA+ID4gLSAgICBpZiAo
IGQgJiYgIShtZW1mbGFncyAmIE1FTUZfbm9fb3duZXIpICYmDQo+ID4gPiAtICAgICAgICAgYXNz
aWduX3BhZ2VzKGQsIHBnLCBvcmRlciwgbWVtZmxhZ3MpICkNCj4gPiA+ICsgICAgaWYgKCBkICYm
ICEobWVtZmxhZ3MgJiBNRU1GX25vX293bmVyKSApDQo+ID4gPiAgICAgIHsNCj4gPiA+IC0gICAg
ICAgIGZyZWVfaGVhcF9wYWdlcyhwZywgb3JkZXIsIG1lbWZsYWdzICYgTUVNRl9ub19zY3J1Yik7
DQo+ID4gPiAtICAgICAgICByZXR1cm4gTlVMTDsNCj4gPiA+ICsgICAgICAgIGlmICggYXNzaWdu
X3BhZ2VzKGQsIHBnLCBvcmRlciwgbWVtZmxhZ3MpICkNCj4gPiA+ICsgICAgICAgIHsNCj4gPiA+
ICsgICAgICAgICAgICBmcmVlX2hlYXBfcGFnZXMocGcsIG9yZGVyLCBtZW1mbGFncyAmIE1FTUZf
bm9fc2NydWIpOw0KPiA+ID4gKyAgICAgICAgICAgIHJldHVybiBOVUxMOw0KPiA+ID4gKyAgICAg
ICAgfQ0KPiA+ID4gKyAgICAgICAgaWYgKCBtZW1mbGFncyAmIE1FTUZfbm9fcmVmY291bnQgKQ0K
PiA+ID4gKyAgICAgICAgew0KPiA+ID4gKyAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgaTsNCj4g
PiA+ICsNCj4gPiA+ICsgICAgICAgICAgICBmb3IgKCBpID0gMDsgaSA8ICgxIDw8IG9yZGVyKTsg
aSsrICkNCj4gPiA+ICsgICAgICAgICAgICAgICAgcGdbaV0uY291bnRfaW5mbyB8PSBQR0Nfbm9f
cmVmY291bnQ7DQo+ID4gPiArICAgICAgICB9DQo+ID4NCj4gPiBJIHdvdWxkIHNlZW0gdG8gbWUg
dGhhdCB0aGlzIG5lZWRzIGRvaW5nIHRoZSBvdGhlciB3YXkgYXJvdW5kOg0KPiA+IEZpcnN0IHNl
dCBQR0Nfbm9fcmVmY291bnQsIHRoZW4gYXNzaWduX3BhZ2VzKCkuIEFmdGVyIGFsbCwgdGhlDQo+
ID4gbW9tZW50IGFzc2lnbl9wYWdlcygpIGRyb3BzIGl0cyBsb2NrLCB0aGUgZG9tYWluIGNvdWxk
IGFsc28NCj4gPiBkZWNpZGUgdG8gZ2V0IHJpZCBvZiAoc29tZSBvZikgdGhlIHBhZ2VzIGFnYWlu
Lg0KPiANCj4gVHJ1ZS4gWWVzLCB0aGlzIG5lZWRzIHRvIGJlIHN3YXBwZWQuDQo+IA0KPiA+IEZv
ciB0aGlzIChhbmQNCj4gPiBhbHNvIHRvIHNsaWdodGx5IHNpbXBsaWZ5IHRoaW5ncyBpbiBmcmVl
X2RvbWhlYXBfcGFnZXMoKSkNCj4gPiBwZXJoYXBzIGl0IHdvdWxkIGJlIGJldHRlciBub3QgdG8g
YWRkIHRoYXQgQVNTRVJUKCkgdG8NCj4gPiBmcmVlX2hlYXBfcGFnZXMoKS4gVGhlIGZ1bmN0aW9u
IHNob3VsZG4ndCByZWFsbHkgYmUgY29uY2VybmVkDQo+ID4gb2YgYW55IHJlZmNvdW50aW5nLCBh
bmQgaGVuY2UgY291bGQgYXMgd2VsbCBiZSBpZ25vcmFudCB0bw0KPiA+IFBHQ19ub19yZWZjb3Vu
dCBiZWluZyBzZXQgb24gYSBwYWdlLg0KPiA+DQo+IA0KPiBOb3Qgc3VyZSBJIHVuZGVyc3RhbmQg
aGVyZS4gV2hhdCB3b3VsZCB5b3UgbGlrZSB0byBzZWUgZnJlZV9oZWFwX3BhZ2VzKCkNCj4gYXNz
ZXJ0Pw0KPiANCg0KT2gsIEkgbWlzcmVhZC4gWW91IHdhbnQgbWUgdG8gcmVtb3ZlIHRoZSBBU1NF
UlQgdGhhdCBJIGFkZGVkLi4uIHRoYXQncyBmaW5lLg0KDQogIFBhdWwNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
