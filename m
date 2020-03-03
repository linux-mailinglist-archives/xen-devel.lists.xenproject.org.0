Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB54177AA8
	for <lists+xen-devel@lfdr.de>; Tue,  3 Mar 2020 16:39:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j99an-0005GR-LC; Tue, 03 Mar 2020 15:36:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=x433=4U=amazon.co.uk=prvs=32428865a=pdurrant@srs-us1.protection.inumbo.net>)
 id 1j99al-0005GL-Tf
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 15:36:19 +0000
X-Inumbo-ID: ba1cee0a-5d64-11ea-94a0-bc764e2007e4
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ba1cee0a-5d64-11ea-94a0-bc764e2007e4;
 Tue, 03 Mar 2020 15:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1583249780; x=1614785780;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version:subject;
 bh=sw2l1CdbYdDffOUoWzmV0U/JX9OsP8pdAh3dOrBpciw=;
 b=nZnAwpDBcb7tSvpAlfC6pdzhlgmCzIA/QlDCH9Ao0N0OIso7BXlCyO+f
 3NeRYBCphpu98xGa7ww8oq9lNTN1vKdMlxfpgmKoldZ0Y6H4OSQJtVULa
 VsO9ovNjvKQ7fD3YIBDVUt8Xb3G+RQOsPB0pu1HrpawHz+qrcqVJ7wREZ o=;
IronPort-SDR: Ob6TuK5Mp+z6GZxhKiHfNyQw90e+4BL60TEJGrCS1aLT4sTe3mP/nZhiin+RpAWRZEOlsSawsV
 32UxwEsWEJMQ==
X-IronPort-AV: E=Sophos;i="5.70,511,1574121600"; d="scan'208";a="20521783"
Thread-Topic: [PATCH v5 2/4] x86/HVM: implement memory read caching for insn
 emulation
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-2c665b5d.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 03 Mar 2020 15:36:17 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-2c665b5d.us-east-1.amazon.com (Postfix) with ESMTPS
 id 65E82A2CA8; Tue,  3 Mar 2020 15:36:14 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Tue, 3 Mar 2020 15:36:13 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 3 Mar 2020 15:36:12 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Tue, 3 Mar 2020 15:36:12 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>
Thread-Index: AQHV8W/D2n0Eu/VsxUSS/MIoFmsrMqg2/yrg
Date: Tue, 3 Mar 2020 15:36:12 +0000
Message-ID: <80f18e465d2e40d883bfcce9b439d298@EX13D32EUC003.ant.amazon.com>
References: <1e1ccd2a-526c-631b-7889-35f993b2005e@suse.com>
 <b9aa8053-b35b-1d0f-8303-abc39e1ae17d@suse.com>
 <aadbe8745d334ca8bece2d7e9ef1cd4e@EX13D32EUC003.ant.amazon.com>
 <130fb38f-205e-c75d-eee4-d1576ac79049@suse.com>
In-Reply-To: <130fb38f-205e-c75d-eee4-d1576ac79049@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.151]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v5 2/4] x86/HVM: implement memory read
 caching for insn emulation
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin
 Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDAzIE1hcmNoIDIwMjAgMTU6MjQNCj4gVG86IER1cnJhbnQs
IFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jby51az4NCj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZzsgS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+OyBXZWkgTGl1IDx3
bEB4ZW4ub3JnPjsgUGF1bA0KPiBEdXJyYW50IDxwYXVsQHhlbi5vcmc+OyBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgSnVuIE5ha2FqaW1hDQo+IDxqdW4ubmFrYWpp
bWFAaW50ZWwuY29tPjsgUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+
IFN1YmplY3Q6IFJFOiBbRVhURVJOQUxdW1BBVENIIHY1IDIvNF0geDg2L0hWTTogaW1wbGVtZW50
IG1lbW9yeSByZWFkIGNhY2hpbmcgZm9yIGluc24gZW11bGF0aW9uDQo+IA0KPiBDQVVUSU9OOiBU
aGlzIGVtYWlsIG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9mIHRoZSBvcmdhbml6YXRpb24uIERv
IG5vdCBjbGljayBsaW5rcyBvciBvcGVuDQo+IGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgY2FuIGNv
bmZpcm0gdGhlIHNlbmRlciBhbmQga25vdyB0aGUgY29udGVudCBpcyBzYWZlLg0KPiANCj4gDQo+
IA0KPiBPbiAwMy4wMy4yMDIwIDE2OjE2LCBEdXJyYW50LCBQYXVsIHdyb3RlOg0KPiA+PiBGcm9t
OiBYZW4tZGV2ZWwgPHhlbi1kZXZlbC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBC
ZWhhbGYgT2YgSmFuIEJldWxpY2gNCj4gPj4gU2VudDogMDMgTWFyY2ggMjAyMCAxMDoxNw0KPiA+
Pg0KPiA+PiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL2VtdWxhdGUuYw0KPiA+PiArKysgYi94ZW4v
YXJjaC94ODYvaHZtL2VtdWxhdGUuYw0KPiA+PiBAQCAtMjgsNiArMjgsMTkgQEANCj4gPj4gICNp
bmNsdWRlIDxhc20vaW9jYXAuaD4NCj4gPj4gICNpbmNsdWRlIDxhc20vdm1fZXZlbnQuaD4NCj4g
Pj4NCj4gPj4gK3N0cnVjdCBodm1lbXVsX2NhY2hlDQo+ID4+ICt7DQo+ID4+ICsgICAgLyogVGhl
IGNhY2hlIGlzIGRpc2FibGVkIGFzIGxvbmcgYXMgbnVtX2VudHMgPiBtYXhfZW50cy4gKi8NCj4g
Pj4gKyAgICB1bnNpZ25lZCBpbnQgbnVtX2VudHM7DQo+ID4+ICsgICAgdW5zaWduZWQgaW50IG1h
eF9lbnRzOw0KPiA+PiArICAgIHN0cnVjdCB7DQo+ID4+ICsgICAgICAgIHBhZGRyX3QgZ3BhOlBB
RERSX0JJVFM7DQo+ID4+ICsgICAgICAgIHVuc2lnbmVkIGludCA6QklUU19QRVJfTE9ORyAtIFBB
RERSX0JJVFMgLSA4Ow0KPiA+DQo+ID4gSXMgY2xhbmcgb2sgd2l0aCB1bm5hbWVkIGZpZWxkcz8N
Cj4gDQo+IENsYW5nIDUgYXQgbGVhc3QgaXMsIGFuZCBpaXJjIHRoaXMgaXMgYSBzdGFuZGFyZCBD
IGZlYXR1cmUuDQo+IA0KDQpHb29nbGUgZGlkbid0IGdpdmUgbWUgYSBjb25jbHVzaXZlIGFuc3dl
ciB3aGljaCB3YXMgSSBhc2tlZC4gSSd2ZSBub3QgZm91bmQgYW55dGhpbmcgdGhhdCBzYXlzIGl0
J3MgYSBnY2MtaXNtIHRob3VnaC4NCg0KPiA+PiArdm9pZCBodm1lbXVsX2NhY2hlX3Jlc3RvcmUo
c3RydWN0IHZjcHUgKnYsIHVuc2lnbmVkIGludCB0b2tlbikNCj4gPj4gK3sNCj4gPj4gKyAgICBz
dHJ1Y3QgaHZtZW11bF9jYWNoZSAqY2FjaGUgPSB2LT5hcmNoLmh2bS5odm1faW8uY2FjaGU7DQo+
ID4+ICsNCj4gPj4gKyAgICBBU1NFUlQoY2FjaGUtPm51bV9lbnRzID4gY2FjaGUtPm1heF9lbnRz
KTsNCj4gPj4gKyAgICBjYWNoZS0+bnVtX2VudHMgPSB0b2tlbjsNCj4gPg0KPiA+IEFTU0VSVCh0
b2tlbiA8PSBjYWNoZS0+bWF4X2VudHMpIGhlcmU/DQo+IA0KPiBIbW0sIG5vdCBzdXJlLiBEZWZp
bml0ZWx5IG5vdCBleGFjdGx5IGFzIHlvdSBzYXksIGFzIGRpc2FibGluZw0KPiBpbiBhbHJlYWR5
IGRpc2FibGVkIHN0YXRlIHdvdWxkIHJldHVybiBtYXhfZW50cyArIDEsIGFuZCBoZW5jZQ0KPiB0
aGlzIHZhbHVlIGNvdWxkIGFsc28gYmUgZmVkIGJhY2sgaGVyZS4NCg0KT2ssIEkgY2FuIHNlZSBr
ZWVwaW5nIHRoYXQgaWRlbXBvdGVudCBpcyB1c2VmdWwuDQoNCj4gQnV0IGV2ZW4gYmV5b25kIHRo
YXQgSQ0KPiBkb24ndCBzZWUgYSBuZWVkIHRvIHJlc3RyaWN0IHRoZSB2YWx1ZSByYW5nZSBoZXJl
IC0gYW55dGhpbmcNCj4gbGFyZ2VyIHRoYW4gbWF4X2VudHMgd2lsbCBzaW1wbHkgcmVzdWx0IGlu
IHRoZSBjYWNoZSBiZWluZw0KPiBkaXNhYmxlZC4NCj4gDQoNCkZhaXIgZW5vdWdoLg0KDQpSZXZp
ZXdlZC1ieTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbXpuLmNvbT4NCg0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
