Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E231277035
	for <lists+xen-devel@lfdr.de>; Thu, 24 Sep 2020 13:46:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLPhY-0004mf-C9; Thu, 24 Sep 2020 11:46:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T9W5=DB=amazon.co.uk=prvs=52904f8e2=pdurrant@srs-us1.protection.inumbo.net>)
 id 1kLPhX-0004ma-GN
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2020 11:46:15 +0000
X-Inumbo-ID: 7f235419-44f2-4470-abef-81c1a3c08a7a
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7f235419-44f2-4470-abef-81c1a3c08a7a;
 Thu, 24 Sep 2020 11:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1600947975; x=1632483975;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version:subject;
 bh=EQ04oM2JREUbCUBvLDAyMjWNJA4w1hh1oMgMC96kNyc=;
 b=VAEgf/48t1nPceOSn0TLmIyHfrRpyQjAb7DgAXNfxHIQPUuuu0wd48h+
 /+p2r2jOvNSMSFJ5UFdNQsmXVKSPt8iJlKq+y16j7iWFy0dsyifMqiPt1
 VlgYAlZH5zcuQeLEnwGYl8HVYykNZW9MHrkDBnOCOs6rrr9aK83KZ2YI7 M=;
X-IronPort-AV: E=Sophos;i="5.77,297,1596499200"; d="scan'208";a="78911082"
Subject: RE: [PATCH v8 6/8] common/domain: add a domain context record for
 shared_info...
Thread-Topic: [PATCH v8 6/8] common/domain: add a domain context record for
 shared_info...
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2b-859fe132.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 24 Sep 2020 11:46:11 +0000
Received: from EX13D32EUB002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-859fe132.us-west-2.amazon.com (Postfix) with ESMTPS
 id EA1252219E9; Thu, 24 Sep 2020 11:46:09 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUB002.ant.amazon.com (10.43.166.114) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 24 Sep 2020 11:46:08 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Thu, 24 Sep 2020 11:46:08 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Ian
 Jackson" <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 "Julien Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Thread-Index: AQHvr7AvBoXywxdFv7PoySFqP9xUvwGoJJWAAgyQ5wOpJ8odQA==
Date: Thu, 24 Sep 2020 11:46:08 +0000
Message-ID: <9b2375a2215848e68b0c5a62eaa32cb5@EX13D32EUC003.ant.amazon.com>
References: <20200915161800.1384-1-paul@xen.org>
 <20200915161800.1384-7-paul@xen.org>
 <98b1a80c-ba59-5d91-657f-74aaab5dae1d@suse.com>
In-Reply-To: <98b1a80c-ba59-5d91-657f-74aaab5dae1d@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.145]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: Bulk
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDE2IFNlcHRlbWJlciAyMDIwIDE1OjQzDQo+IFRvOiBQYXVs
IER1cnJhbnQgPHBhdWxAeGVuLm9yZz4NCj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZzsgRHVycmFudCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPjsgSWFuIEphY2tzb24N
Cj4gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgQW5k
cmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IEdlb3JnZQ0KPiBEdW5sYXAg
PGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT47IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+
OyBTdGVmYW5vIFN0YWJlbGxpbmkNCj4gPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+IFN1Ympl
Y3Q6IFJFOiBbRVhURVJOQUxdIFtQQVRDSCB2OCA2LzhdIGNvbW1vbi9kb21haW46IGFkZCBhIGRv
bWFpbiBjb250ZXh0IHJlY29yZCBmb3Igc2hhcmVkX2luZm8uLi4NCj4gDQo+IENBVVRJT046IFRo
aXMgZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2YgdGhlIG9yZ2FuaXphdGlvbi4gRG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4NCj4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBjYW4gY29u
ZmlybSB0aGUgc2VuZGVyIGFuZCBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUuDQo+IA0KPiANCj4g
DQo+IE9uIDE1LjA5LjIwMjAgMTg6MTcsIFBhdWwgRHVycmFudCB3cm90ZToNCj4gPiArc3RhdGlj
IGludCBsb2FkX3NoYXJlZF9pbmZvKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCBkb21haW5fY29u
dGV4dCAqYykNCj4gPiArew0KPiA+ICsgICAgc3RydWN0IGRvbWFpbl9zaGFyZWRfaW5mb19jb250
ZXh0IGN0eHQ7DQo+ID4gKyAgICBzaXplX3QgaGRyX3NpemUgPSBvZmZzZXRvZih0eXBlb2YoY3R4
dCksIGJ1ZmZlcik7DQo+ID4gKyAgICB1bnNpZ25lZCBpbnQgaTsNCj4gPiArICAgIGludCByYzsN
Cj4gPiArDQo+ID4gKyAgICByYyA9IERPTUFJTl9MT0FEX0JFR0lOKFNIQVJFRF9JTkZPLCBjLCAm
aSk7DQo+ID4gKyAgICBpZiAoIHJjICkNCj4gPiArICAgICAgICByZXR1cm4gcmM7DQo+ID4gKw0K
PiA+ICsgICAgaWYgKCBpICkgLyogZXhwZWN0IG9ubHkgYSBzaW5nbGUgaW5zdGFuY2UgKi8NCj4g
PiArICAgICAgICByZXR1cm4gLUVOWElPOw0KPiA+ICsNCj4gPiArICAgIHJjID0gZG9tYWluX2xv
YWRfZGF0YShjLCAmY3R4dCwgaGRyX3NpemUpOw0KPiA+ICsgICAgaWYgKCByYyApDQo+ID4gKyAg
ICAgICAgcmV0dXJuIHJjOw0KPiA+ICsNCj4gPiArICAgIGlmICggY3R4dC5idWZmZXJfc2l6ZSA+
IHNpemVvZihzaGFyZWRfaW5mb190KSB8fA0KPiA+ICsgICAgICAgICAoY3R4dC5mbGFncyAmIH5E
T01BSU5fU0FWRV8zMkJJVF9TSElORk8pICkNCj4gPiArICAgICAgICByZXR1cm4gLUVJTlZBTDsN
Cj4gPiArDQo+ID4gKyAgICBpZiAoIGN0eHQuZmxhZ3MgJiBET01BSU5fU0FWRV8zMkJJVF9TSElO
Rk8gKQ0KPiA+ICsgICAgew0KPiA+ICsjaWZkZWYgQ09ORklHX0NPTVBBVA0KPiA+ICsgICAgICAg
IGhhc18zMmJpdF9zaGluZm8oZCkgPSB0cnVlOw0KPiA+ICsjZWxzZQ0KPiA+ICsgICAgICAgIHJl
dHVybiAtRUlOVkFMOw0KPiA+ICsjZW5kaWYNCj4gPiArICAgIH0NCj4gPiArDQo+ID4gKyAgICBp
ZiAoIGlzX3B2X2RvbWFpbihkKSApDQo+ID4gKyAgICB7DQo+ID4gKyAgICAgICAgc2hhcmVkX2lu
Zm9fdCAqc2hpbmZvID0geG1hbGxvYyhzaGFyZWRfaW5mb190KTsNCj4gPiArDQo+ID4gKyAgICAg
ICAgcmMgPSBkb21haW5fbG9hZF9kYXRhKGMsIHNoaW5mbywgc2l6ZW9mKCpzaGluZm8pKTsNCj4g
DQo+IFlvdSBuZWVkIHRvIGNoZWNrIHRoZSBhbGxvY2F0aW9uJ3Mgc3VjY2VzcyBmaXJzdC4NCg0K
T29wcywgeWVzLg0KDQo+IEJ1dCBvZiBjb3Vyc2UgdGhlDQo+IHF1ZXN0aW9uIGlzIHdoeSB5b3Ug
ZG9uJ3QgcmVhZCBkaXJlY3RseSBpbnRvIGQtPnNoYXJlZF9pbmZvLiBUaGUNCj4gZG9tYWluIGlz
IHBhdXNlZCBhdCB0aGlzIHBvaW50LCBpc24ndCBpdD8NCj4gDQoNCkl0IGlzLCBidXQgZG9tYWlu
X2NyZWF0ZSgpIG1heSBoYXZlIGluaXRpYWxpemVkIHNvbWV0aGluZyBvdXRzaWRlIG9mIHRoZSBh
cmVhcyB3ZSB3YW50IHRvIHRvdWNoOyBJJ20gdHJ5aW5nIHRvIGZvbGxvdyB3aGF0IHRoZSBleGlz
dGluZyByZXN0b3JlIGNvZGUgaW4gdG9vbHN0YWNrIGN1cnJlbnRseSBkb2VzLg0KDQo+ID4gKyAg
ICAgICAgaWYgKCByYyApDQo+ID4gKyAgICAgICAgew0KPiA+ICsgICAgICAgICAgICB4ZnJlZShz
aGluZm8pOw0KPiA+ICsgICAgICAgICAgICByZXR1cm4gcmM7DQo+ID4gKyAgICAgICAgfQ0KPiA+
ICsNCj4gPiArI2lmZGVmIENPTkZJR19DT01QQVQNCj4gPiArICAgICAgICBpZiAoIGhhc18zMmJp
dF9zaGluZm8oZCkgKQ0KPiA+ICsgICAgICAgIHsNCj4gPiArICAgICAgICAgICAgbWVtY3B5KCZk
LT5zaGFyZWRfaW5mby0+Y29tcGF0LnZjcHVfaW5mbywNCj4gPiArICAgICAgICAgICAgICAgICAg
ICZzaGluZm8tPmNvbXBhdC52Y3B1X2luZm8sDQo+ID4gKyAgICAgICAgICAgICAgICAgICBzaXpl
b2YoZC0+c2hhcmVkX2luZm8tPmNvbXBhdC52Y3B1X2luZm8pKTsNCj4gPiArICAgICAgICAgICAg
bWVtY3B5KCZkLT5zaGFyZWRfaW5mby0+Y29tcGF0LmFyY2gsDQo+ID4gKyAgICAgICAgICAgICAg
ICAgICAmc2hpbmZvLT5jb21wYXQuYXJjaCwNCj4gPiArICAgICAgICAgICAgICAgICAgIHNpemVv
ZihkLT5zaGFyZWRfaW5mby0+Y29tcGF0LnZjcHVfaW5mbykpOw0KPiA+ICsgICAgICAgICAgICBt
ZW1zZXQoJmQtPnNoYXJlZF9pbmZvLT5jb21wYXQuZXZ0Y2huX3BlbmRpbmcsDQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAwLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgc2l6ZW9mKGQtPnNoYXJl
ZF9pbmZvLT5jb21wYXQuZXZ0Y2huX3BlbmRpbmcpKTsNCj4gPiArICAgICAgICAgICAgbWVtc2V0
KCZkLT5zaGFyZWRfaW5mby0+Y29tcGF0LmV2dGNobl9tYXNrLA0KPiA+ICsgICAgICAgICAgICAg
ICAgICAgMHhmZiwNCj4gPiArICAgICAgICAgICAgICAgICAgIHNpemVvZihkLT5zaGFyZWRfaW5m
by0+Y29tcGF0LmV2dGNobl9tYXNrKSk7DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICBkLT5zaGFy
ZWRfaW5mby0+Y29tcGF0LmFyY2gucGZuX3RvX21mbl9mcmFtZV9saXN0X2xpc3QgPSAwOw0KPiA+
ICsgICAgICAgICAgICBmb3IgKCBpID0gMDsgaSA8IFhFTl9MRUdBQ1lfTUFYX1ZDUFVTOyBpKysg
KQ0KPiA+ICsgICAgICAgICAgICAgICAgZC0+c2hhcmVkX2luZm8tPmNvbXBhdC52Y3B1X2luZm9b
aV0uZXZ0Y2huX3BlbmRpbmdfc2VsID0gMDsNCj4gPiArICAgICAgICB9DQo+ID4gKyAgICAgICAg
ZWxzZQ0KPiA+ICsgICAgICAgIHsNCj4gPiArICAgICAgICAgICAgbWVtY3B5KCZkLT5zaGFyZWRf
aW5mby0+bmF0aXZlLnZjcHVfaW5mbywNCj4gPiArICAgICAgICAgICAgICAgICAgICZzaGluZm8t
Pm5hdGl2ZS52Y3B1X2luZm8sDQo+ID4gKyAgICAgICAgICAgICAgICAgICBzaXplb2YoZC0+c2hh
cmVkX2luZm8tPm5hdGl2ZS52Y3B1X2luZm8pKTsNCj4gPiArICAgICAgICAgICAgbWVtY3B5KCZk
LT5zaGFyZWRfaW5mby0+bmF0aXZlLmFyY2gsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAmc2hp
bmZvLT5uYXRpdmUuYXJjaCwNCj4gPiArICAgICAgICAgICAgICAgICAgIHNpemVvZihkLT5zaGFy
ZWRfaW5mby0+bmF0aXZlLmFyY2gpKTsNCj4gPiArICAgICAgICAgICAgbWVtc2V0KCZkLT5zaGFy
ZWRfaW5mby0+bmF0aXZlLmV2dGNobl9wZW5kaW5nLA0KPiA+ICsgICAgICAgICAgICAgICAgICAg
MCwNCj4gPiArICAgICAgICAgICAgICAgICAgIHNpemVvZihkLT5zaGFyZWRfaW5mby0+Y29tcGF0
LmV2dGNobl9wZW5kaW5nKSk7DQo+ID4gKyAgICAgICAgICAgIG1lbXNldCgmZC0+c2hhcmVkX2lu
Zm8tPm5hdGl2ZS5ldnRjaG5fbWFzaywNCj4gPiArICAgICAgICAgICAgICAgICAgIDB4ZmYsDQo+
ID4gKyAgICAgICAgICAgICAgICAgICBzaXplb2YoZC0+c2hhcmVkX2luZm8tPm5hdGl2ZS5ldnRj
aG5fbWFzaykpOw0KPiA+ICsNCj4gPiArICAgICAgICAgICAgZC0+c2hhcmVkX2luZm8tPm5hdGl2
ZS5hcmNoLnBmbl90b19tZm5fZnJhbWVfbGlzdF9saXN0ID0gMDsNCj4gPiArICAgICAgICAgICAg
Zm9yICggaSA9IDA7IGkgPCBYRU5fTEVHQUNZX01BWF9WQ1BVUzsgaSsrICkNCj4gPiArICAgICAg
ICAgICAgICAgIGQtPnNoYXJlZF9pbmZvLT5uYXRpdmUudmNwdV9pbmZvW2ldLmV2dGNobl9wZW5k
aW5nX3NlbCA9IDA7DQo+ID4gKyAgICAgICAgfQ0KPiA+ICsjZWxzZQ0KPiA+ICsgICAgICAgIG1l
bWNweSgmZC0+c2hhcmVkX2luZm8tPnZjcHVfaW5mbywNCj4gPiArICAgICAgICAgICAgICAgJnNo
aW5mby0+dmNwdV9pbmZvLA0KPiA+ICsgICAgICAgICAgICAgICBzaXplb2YoZC0+c2hhcmVkX2lu
Zm8tPnZjcHVfaW5mbykpOw0KPiA+ICsgICAgICAgIG1lbWNweSgmZC0+c2hhcmVkX2luZm8tPmFy
Y2gsDQo+ID4gKyAgICAgICAgICAgICAgICZzaGluZm8tPmFyY2gsDQo+ID4gKyAgICAgICAgICAg
ICAgIHNpemVvZihkLT5zaGFyZWRfaW5mby0+c2hhcmVkKSk7DQo+ID4gKyAgICAgICAgbWVtc2V0
KCZkLT5zaGFyZWRfaW5mby0+ZXZ0Y2huX3BlbmRpbmcsDQo+ID4gKyAgICAgICAgICAgICAgIDAs
DQo+ID4gKyAgICAgICAgICAgICAgIHNpemVvZihkLT5zaGFyZWRfaW5mby0+ZXZ0Y2huX3BlbmRp
bmcpKTsNCj4gPiArICAgICAgICBtZW1zZXQoJmQtPnNoYXJlZF9pbmZvLT5ldnRjaG5fbWFzaywN
Cj4gPiArICAgICAgICAgICAgICAgMHhmZiwNCj4gPiArICAgICAgICAgICAgICAgc2l6ZW9mKGQt
PnNoYXJlZF9pbmZvLT5ldnRjaG5fbWFzaykpOw0KPiA+ICsNCj4gPiArICAgICAgICBkLT5zaGFy
ZWRfaW5mby5hcmNoLnBmbl90b19tZm5fZnJhbWVfbGlzdF9saXN0ID0gMDsNCj4gPiArICAgICAg
ICBmb3IgKCBpID0gMDsgaSA8IFhFTl9MRUdBQ1lfTUFYX1ZDUFVTOyBpKysgKQ0KPiA+ICsgICAg
ICAgICAgICBkLT5zaGFyZWRfaW5mby52Y3B1X2luZm9baV0uZXZ0Y2huX3BlbmRpbmdfc2VsID0g
MDsNCj4gPiArI2VuZGlmDQo+IA0KPiBBIGxvdCBvZiByZWR1bmRhbmN5OyBtYXliZSBpdCBnZXRz
IGJldHRlciBpZiBpbmRlZWQgeW91IHN0b3AgcmVhZGluZw0KPiBpbnRvIGFuIGludGVybWVkaWF0
ZSBidWZmZXIuDQoNCkFzIEkgc2FpZCBhYm92ZSwgSSB0aGluayBpdCBpcyBiZXR0ZXIgaWYgSSBj
b250aW51ZSB0byB1c2UgYW4gaW50ZXJtZWRpYXRlIGJ1ZmZlciBidXQgSSdsbCBzZWUgaWYgSSBj
YW4gYWRkIHNvbWUgbWFjcm8gbWFnaWMgdG8gbWFrZSB0aGlzIGxlc3MgdmVyYm9zZS4NCg0KPiAN
Cj4gPiArICAgICAgICB4ZnJlZShzaGluZm8pOw0KPiA+ICsNCj4gPiArICAgICAgICByYyA9IGRv
bWFpbl9sb2FkX2VuZChjLCBmYWxzZSk7DQo+ID4gKyAgICB9DQo+ID4gKyAgICBlbHNlDQo+ID4g
KyAgICAgICAgcmMgPSBkb21haW5fbG9hZF9lbmQoYywgdHJ1ZSk7DQo+IA0KPiBQZXJoYXBzIGF0
IGxlYXN0IGEgYnJpZWYgY29tbWVudCBoZXJlIHdvdWxkbid0IGh1cnQgcmVnYXJkaW5nIHRoZQ0K
PiBuZWVkcyAob3IgbGFjayB0aGVyZW9mKSBmb3IgSFZNIC8gQXJtPw0KPiANCg0KT2suDQoNCiAg
UGF1bA0KDQo+IEphbg0K

