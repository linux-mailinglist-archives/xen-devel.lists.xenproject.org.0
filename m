Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E438E14BC83
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 16:00:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwSKD-0005sO-9c; Tue, 28 Jan 2020 14:58:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0vDG=3R=amazon.co.uk=prvs=289a7b1b7=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iwSKB-0005sG-UO
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 14:58:43 +0000
X-Inumbo-ID: ace53d7e-41de-11ea-8704-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ace53d7e-41de-11ea-8704-12813bfff9fa;
 Tue, 28 Jan 2020 14:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1580223523; x=1611759523;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cMmaKAR9fC6Qf3lCFsDt7oUJ/tZ5EAKQJI0ySsTvFos=;
 b=Jrk3An7sgcvRUwe14WAjJnXcmgdcOTSQax/bIzWXMBb0PT2qm0pt/T6M
 YLpcK/wrknZw3eFq4RVtIaFo71/JGcV21EB7m1WJPFCGmBkQL+mHXRw76
 D21OyHTdNviuhU78GG3DP/ywZhZQJoKYxYZ6lMxQWa67i31HGmhbs0Jqv g=;
IronPort-SDR: OBchshQpu5sdVuCfja4BRuCVuKzso9aCzhFle4arLJznUjL1cT1NNe180+AFdJc+MFnpmSy4Tt
 tPbS2GofEr1Q==
X-IronPort-AV: E=Sophos;i="5.70,374,1574121600"; d="scan'208";a="21565753"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-8549039f.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 28 Jan 2020 14:58:32 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-8549039f.us-west-2.amazon.com (Postfix) with ESMTPS
 id 6AFA9A291F; Tue, 28 Jan 2020 14:58:31 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Tue, 28 Jan 2020 14:58:31 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 28 Jan 2020 14:58:30 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Tue, 28 Jan 2020 14:58:30 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH] x86/HVM: relinquish resources also from
 hvm_domain_destroy()
Thread-Index: AQHV1efl5pX0Q0aIS061hgdg+PIS9agAKMgw
Date: Tue, 28 Jan 2020 14:58:30 +0000
Message-ID: <cc8c48bfaedb47b7a8832725ff6eb6db@EX13D32EUC003.ant.amazon.com>
References: <93b4ae81-6bfb-f7bd-06be-62032fd9a445@suse.com>
 <fc1d01c9824b49fe963137de2df0794a@EX13D32EUC003.ant.amazon.com>
 <8b00f8eb-11c0-9342-e2ac-132d5d16cde7@suse.com>
In-Reply-To: <8b00f8eb-11c0-9342-e2ac-132d5d16cde7@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.63]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH] x86/HVM: relinquish resources also from
 hvm_domain_destroy()
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDI4IEphbnVhcnkgMjAyMCAxNDozMQ0KPiBUbzogRHVycmFu
dCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPg0KPiBDYzogeGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnOyBBbmRyZXcgQ29vcGVyDQo+IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
PjsgUGF1bCBEdXJyYW50IDxwYXVsQHhlbi5vcmc+OyBXZWkgTGl1DQo+IDx3bEB4ZW4ub3JnPjsg
Um9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0hdIHg4Ni9IVk06IHJlbGlucXVpc2ggcmVzb3VyY2VzIGFsc28gZnJvbQ0KPiBodm1fZG9t
YWluX2Rlc3Ryb3koKQ0KPiANCj4gT24gMjguMDEuMjAyMCAxNToxNCwgRHVycmFudCwgUGF1bCB3
cm90ZToNCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogWGVuLWRl
dmVsIDx4ZW4tZGV2ZWwtYm91bmNlc0BsaXN0cy54ZW5wcm9qZWN0Lm9yZz4gT24gQmVoYWxmIE9m
DQo+IEphbg0KPiA+PiBCZXVsaWNoDQo+ID4+IFNlbnQ6IDI4IEphbnVhcnkgMjAyMCAxMzoxNw0K
PiA+Pg0KPiA+PiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL2hwZXQuYw0KPiA+PiArKysgYi94ZW4v
YXJjaC94ODYvaHZtL2hwZXQuYw0KPiA+PiBAQCAtNzUxLDcgKzc1MSw3IEBAIHZvaWQgaHBldF9k
ZWluaXQoc3RydWN0IGRvbWFpbiAqZCkNCj4gPj4gICAgICBpbnQgaTsNCj4gPj4gICAgICBIUEVU
U3RhdGUgKmggPSBkb21haW5fdmhwZXQoZCk7DQo+ID4+DQo+ID4+IC0gICAgaWYgKCAhaGFzX3Zo
cGV0KGQpICkNCj4gPj4gKyAgICBpZiAoICFoYXNfdmhwZXQoZCkgfHwgIWQtPmFyY2guaHZtLnBs
X3RpbWUgfHwgIWgtPnN0aW1lX2ZyZXEgKQ0KPiA+DQo+ID4gV2h5IHRoZSBleHRyYSBjaGVja3Mg
aGVyZT8gSnVzdCB0byBhdm9pZCB0YWtpbmcgdGhlIHdyaXRlX2xvY2soKQ0KPiA+IGJlZm9yZSBp
bml0PyBJZiBzbywgdGhlbiB3b3VsZG4ndCBhIGNoZWNrIG9mIHN0aW1lX2ZyZXEgYWxvbmUgc3Vm
ZmljZT8NCj4gDQo+IFRoaXMgYW5kIHRoZSBvdGhlciBmdW5jdGlvbnMgbWF5IG5vdyBiZSBjYWxs
ZWQgd2l0aA0KPiBkLT5hcmNoLmh2bS5wbF90aW1lIGJlaW5nIE5VTEwuIGRvbWFpbl92aHBldCgp
IHdvdWxkIHlpZWxkIGENCj4gcG9pbnRlciBzbGlnaHRseSBvZmZzZXQgZnJvbSBOVUxMIGluIHRo
aXMgY2FzZS4gSGVuY2Ugd2UgaGF2ZQ0KPiB0byBkbyB0aGlzIGNoZWNrIGJlZm9yZSB3ZSBtYXkg
ZGVyZWYgaC4NCj4gDQoNCkFoLCBJJ2QgbWlzc2VkIHRoYXQgZG9tYWluX3ZocGV0KCkgZGVyZWZl
cmVuY2VkIHBsX3RpbWUuDQoNCj4gPj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9odm0uYw0KPiA+
PiArKysgYi94ZW4vYXJjaC94ODYvaHZtL2h2bS5jDQo+ID4+IEBAIC02OTYsMjQgKzY5NiwyNCBA
QCBpbnQgaHZtX2RvbWFpbl9pbml0aWFsaXNlKHN0cnVjdCBkb21haW4NCj4gPj4gICAgICByZXR1
cm4gMDsNCj4gPj4NCj4gPj4gICBmYWlsMjoNCj4gPj4gLSAgICBydGNfZGVpbml0KGQpOw0KPiA+
DQo+ID4gSSB1bmRlcnN0YW5kIHRoYXQgdGhpcyByZW1vdmFsIGlzIGRvbmUgYmVjYXVzZQ0KPiA+
IGh2bV9kb21haW5fcmVsaW5xdWlzaF9yZXNvdXJjZXMoKSB3aWxsIG5vdyBkZWFsIHdpdGggaXQs
DQo+ID4gYnV0IEkgbm90aWNlIGl0IGlzIGFsc28gY2FsbGVkIGZyb20gaHZtX2RvbWFpbl9kZXN0
cm95KCksDQo+ID4gd2hpY2ggc2VlbXMgc3VwZXJmbHVvdXMuDQo+IA0KPiBPaCwgaW5kZWVkLCB0
aGF0IG9uZSBjb3VsZCBnbyBhd2F5IGFzIHdlbGwgbm93Lg0KPiANCj4gPj4gICAgICBzdGR2Z2Ff
ZGVpbml0KGQpOw0KPiA+PiAgICAgIHZpb2FwaWNfZGVpbml0KGQpOw0KPiA+PiAgIGZhaWwxOg0K
PiA+PiAgICAgIGlmICggaXNfaGFyZHdhcmVfZG9tYWluKGQpICkNCj4gPj4gICAgICAgICAgeGZy
ZWUoZC0+YXJjaC5odm0uaW9fYml0bWFwKTsNCj4gPj4gLSAgICB4ZnJlZShkLT5hcmNoLmh2bS5p
b19oYW5kbGVyKTsNCj4gPj4gLSAgICB4ZnJlZShkLT5hcmNoLmh2bS5wYXJhbXMpOw0KPiA+PiAt
ICAgIHhmcmVlKGQtPmFyY2guaHZtLnBsX3RpbWUpOw0KPiA+PiAtICAgIHhmcmVlKGQtPmFyY2gu
aHZtLmlycSk7DQo+ID4+ICsgICAgWEZSRUUoZC0+YXJjaC5odm0uaW9faGFuZGxlcik7DQo+ID4+
ICsgICAgWEZSRUUoZC0+YXJjaC5odm0ucGFyYW1zKTsNCj4gPj4gKyAgICBYRlJFRShkLT5hcmNo
Lmh2bS5wbF90aW1lKTsNCj4gPj4gKyAgICBYRlJFRShkLT5hcmNoLmh2bS5pcnEpOw0KPiA+DQo+
ID4gU2hvdWxkIHRoZXNlIFhGUkVFcyBub3Qgbm93IGJlIHJlbW92ZWQgZnJvbSBodm1fZG9tYWlu
X2Rlc3Ryb3koKSB0b28/DQo+IA0KPiBJJ20gYWZyYWlkIEkgZG9uJ3QgdW5kZXJzdGFuZDogVGhp
cyBpcyBpbiBodm1fZG9tYWluX2luaXRpYWxpc2UoKS4NCj4gYXJjaF9kb21haW5fZGVzdHJveSgp
IChhbmQgaGVuY2UgaHZtX2RvbWFpbl9kZXN0cm95KCkpIHdvbid0IGdldA0KPiBjYWxsZWQgaWYg
aHZtX2RvbWFpbl9pbml0aWFsaXNlKCkgKGFuZCBoZW5jZSBhcmNoX2RvbWFpbl9kZXN0cm95KCkp
DQo+IGZhaWxzIChkb2luZyBzbyBpcywgSSB0aGluaywgYSBmdXR1cmUgcGxhbiBvZiBBbmRyZXcn
cykuDQo+IA0KDQpPaCwgc29ycnkuIEZvciBzb21lIHJlYXNvbiBJIHRob3VnaHQgdGhpcyBodW5r
IHdhcyBpbiBodm1fZG9tYWluX3JlbGlucXVpc2hfcmVzb3VyY2VzKCkgc28geWVzIHRoZSBYRlJF
RXMgaW4gZGVzdHJveSBuZWVkIHRvIHN0YXkgYXMgaXMuDQoNCj4gPj4gLS0tIGEveGVuL2FyY2gv
eDg2L2h2bS9wbXRpbWVyLmMNCj4gPj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9wbXRpbWVyLmMN
Cj4gPj4gQEAgLTM3Myw3ICszNzMsNyBAQCB2b2lkIHBtdGltZXJfZGVpbml0KHN0cnVjdCBkb21h
aW4gKmQpDQo+ID4+ICB7DQo+ID4+ICAgICAgUE1UU3RhdGUgKnMgPSAmZC0+YXJjaC5odm0ucGxf
dGltZS0+dnBtdDsNCj4gPj4NCj4gPj4gLSAgICBpZiAoICFoYXNfdnBtKGQpICkNCj4gPj4gKyAg
ICBpZiAoICFoYXNfdnBtKGQpIHx8ICFkLT5hcmNoLmh2bS5wbF90aW1lIHx8ICFzLT52Y3B1ICkN
Cj4gPj4gICAgICAgICAgcmV0dXJuOw0KPiA+DQo+ID4gSXNuJ3QgYSB0ZXN0IG9mIHMtPnZjcHUg
c3VmZmljaWVudD8NCj4gDQo+IE5vLCBmb3IgdGhlIHNhbWUgcmVhc29uIGEgdGhhdCBleHBsYWlu
ZWQgZm9yIGhwZXQuYy4NCj4gDQo+ID4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vcnRjLmMNCj4g
Pj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9ydGMuYw0KPiA+PiBAQCAtODQ0LDcgKzg0NCw4IEBA
IHZvaWQgcnRjX2RlaW5pdChzdHJ1Y3QgZG9tYWluICpkKQ0KPiA+PiAgew0KPiA+PiAgICAgIFJU
Q1N0YXRlICpzID0gZG9tYWluX3ZydGMoZCk7DQo+ID4+DQo+ID4+IC0gICAgaWYgKCAhaGFzX3Zy
dGMoZCkgKQ0KPiA+PiArICAgIGlmICggIWhhc192cnRjKGQpIHx8ICFkLT5hcmNoLmh2bS5wbF90
aW1lIHx8DQo+ID4+ICsgICAgICAgICBzLT51cGRhdGVfdGltZXIuc3RhdHVzID09IFRJTUVSX1NU
QVRVU19pbnZhbGlkICkNCj4gPj4gICAgICAgICAgcmV0dXJuOw0KPiA+DQo+ID4gVGVzdGluZyBz
LT5wdC5zb3VyY2UgZm9yIGEgemVybyB2YWx1ZSB3b3VsZCBiZSBzdWZmaWNpZW50IGFuZCBjaGVh
cGVyLCBJDQo+IHRoaW5rLg0KPiANCj4gSXQncyBub3Qgb2J2aW91cyB0byBtZSB3aGVyZSBpbiBy
dGNfaW5pdCgpIHMtPnB0LnNvdXJjZSB3b3VsZA0KPiBnZXQgc2V0IHRvIGEgbm9uLXplcm8gdmFs
dWUuIEknZCBwcmVmZXIgdGhlIGNoZWNrIGhlcmUgdG8gYmUNCj4gb2J2aW91c2x5IGNvbm5lY3Rl
ZCB0byB3aGF0IHJ0Y19pbml0KCkgZG9lcy4gSSdtIGFsc28gdW5jbGVhcg0KPiB3aHkgeW91IHRo
aW5rIGl0IHdvdWxkIGJlIGNoZWFwZXIuDQoNCk9rLiBJJ2QgYXNzdW1lIGEgbm9uLXplcm8gcmF0
aGVyIHRoYW4gZXF1YWxpdHkgdGVzdCB3b3VsZCBiZSBjaGVhcGVyIGJ1dCBJIG5vdGljZSB0aGF0
IFRJTUVSX1NUQVRVU19pbnZhbGlkIGlzIGRlZmluZWQgdG8gMCBhbnl3YXksIHNvIGl0IHNob3Vs
ZCBiZSBvcHRpbWlzZWQgYXQgY29tcGlsZSB0aW1lLg0KDQogIFBhdWwNCg0KPiANCj4gSmFuDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
