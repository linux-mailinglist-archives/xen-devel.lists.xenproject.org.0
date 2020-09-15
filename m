Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6143826A6F4
	for <lists+xen-devel@lfdr.de>; Tue, 15 Sep 2020 16:21:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIBp1-0005FW-60; Tue, 15 Sep 2020 14:20:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IAW0=CY=amazon.co.uk=prvs=52058768a=pdurrant@srs-us1.protection.inumbo.net>)
 id 1kIBoz-0005FR-Tz
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2020 14:20:38 +0000
X-Inumbo-ID: d5c0a636-ea09-440a-9af0-1c5311e6b6c2
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d5c0a636-ea09-440a-9af0-1c5311e6b6c2;
 Tue, 15 Sep 2020 14:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1600179638; x=1631715638;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version:subject;
 bh=CNSX7h1dn5PVKsrCEAGKD51jrK6x+GUezQFE+nCtyCA=;
 b=U6XzvqPjUSHc1QkMaNdMG2624bFajbJ0gcaH9+wDZLg1jRFJbDGdgtty
 LXRjJyM08KmYCtfN2Qp/fiKXojPCzIcfjr5203/qxs7YRNDoptsXjlpB7
 MEITWobPkp83rh4MQ9ipId9PDvke8iOjmftu3I7CrWf6Y1yHirrVW16GT o=;
X-IronPort-AV: E=Sophos;i="5.76,430,1592870400"; d="scan'208";a="53891854"
Subject: RE: [PATCH v7 7/9] common/domain: add a domain context record for
 shared_info...
Thread-Topic: [PATCH v7 7/9] common/domain: add a domain context record for
 shared_info...
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1a-e34f1ddc.us-east-1.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 15 Sep 2020 14:20:37 +0000
Received: from EX13D32EUC003.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
 by email-inbound-relay-1a-e34f1ddc.us-east-1.amazon.com (Postfix) with ESMTPS
 id 0A80DA1CF4; Tue, 15 Sep 2020 14:20:33 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 15 Sep 2020 14:20:32 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Tue, 15 Sep 2020 14:20:32 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: 'Jan Beulich' <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
CC: 'Ian Jackson' <ian.jackson@eu.citrix.com>, 'Wei Liu' <wl@xen.org>,
 "'Andrew Cooper'" <andrew.cooper3@citrix.com>, 'George Dunlap'
 <george.dunlap@citrix.com>, 'Julien Grall' <julien@xen.org>, "'Stefano
 Stabellini'" <sstabellini@kernel.org>, "paul@xen.org" <paul@xen.org>
Thread-Index: AQI3t7iXj66qvRdG8GCx2a1a4xz7XAOSzcJJAlXszggBUKE9WqhtnCpw
Date: Tue, 15 Sep 2020 14:20:32 +0000
Message-ID: <78d7f237350c48609266e54235c8f78e@EX13D32EUC003.ant.amazon.com>
References: <20200818103032.3050-1-paul@xen.org>
 <20200818103032.3050-8-paul@xen.org>
 <cd33c5ce-ea85-6576-b9f2-b4dec90d5025@suse.com>
 <003501d682e0$f4e8a1e0$deb9e5a0$@xen.org>
In-Reply-To: <003501d682e0$f4e8a1e0$deb9e5a0$@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.90]
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQYXVsIER1cnJhbnQgPHhhZGlt
Z25pa0BnbWFpbC5jb20+DQo+IFNlbnQ6IDA0IFNlcHRlbWJlciAyMDIwIDE4OjMwDQo+IFRvOiAn
SmFuIEJldWxpY2gnIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZzsgRHVycmFudCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPjsgJ0lh
biBKYWNrc29uJw0KPiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT47ICdXZWkgTGl1JyA8d2xA
eGVuLm9yZz47ICdBbmRyZXcgQ29vcGVyJyA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47DQo+
ICdHZW9yZ2UgRHVubGFwJyA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPjsgJ0p1bGllbiBHcmFs
bCcgPGp1bGllbkB4ZW4ub3JnPjsgJ1N0ZWZhbm8gU3RhYmVsbGluaScNCj4gPHNzdGFiZWxsaW5p
QGtlcm5lbC5vcmc+DQo+IFN1YmplY3Q6IFJFOiBbRVhURVJOQUxdIFtQQVRDSCB2NyA3LzldIGNv
bW1vbi9kb21haW46IGFkZCBhIGRvbWFpbiBjb250ZXh0IHJlY29yZCBmb3Igc2hhcmVkX2luZm8u
Li4NCj4gDQo+IENBVVRJT046IFRoaXMgZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2Yg
dGhlIG9yZ2FuaXphdGlvbi4gRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4NCj4gYXR0YWNobWVu
dHMgdW5sZXNzIHlvdSBjYW4gY29uZmlybSB0aGUgc2VuZGVyIGFuZCBrbm93IHRoZSBjb250ZW50
IGlzIHNhZmUuDQo+IA0KPiANCj4gDQo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4g
PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+ID4gU2VudDogMjYgQXVn
dXN0IDIwMjAgMTQ6NTgNCj4gPiBUbzogUGF1bCBEdXJyYW50IDxwYXVsQHhlbi5vcmc+DQo+ID4g
Q2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgUGF1bCBEdXJyYW50IDxwZHVycmFu
dEBhbWF6b24uY29tPjsgSWFuIEphY2tzb24NCj4gPiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNv
bT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tPjsgR2VvcmdlDQo+ID4gRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+
OyBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPjsgU3RlZmFubyBTdGFiZWxsaW5pDQo+ID4g
PHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+ID4gU3ViamVjdDogUmU6IFtQQVRDSCB2NyA3Lzld
IGNvbW1vbi9kb21haW46IGFkZCBhIGRvbWFpbiBjb250ZXh0IHJlY29yZCBmb3Igc2hhcmVkX2lu
Zm8uLi4NCj4gPg0KPiA+IE9uIDE4LjA4LjIwMjAgMTI6MzAsIFBhdWwgRHVycmFudCB3cm90ZToN
Cj4gPiA+IHY3Og0KPiA+ID4gIC0gT25seSByZXN0b3JlIHZjcHVfaW5mbyBhbmQgYXJjaCBzdWIt
c3RydWN0dXJlcyBmb3IgUFYgZG9tYWlucywgdG8gbWF0Y2gNCj4gPiA+ICAgIHByb2Nlc3Npbmcg
b2YgU0hBUkVEX0lORk8gaW4geGNfc3JfcmVzdG9yZV94ODZfcHYuYw0KPiA+DQo+ID4gU2luY2Ug
eW91IHBvaW50IG91dCB0aGlzIG9yaWdpbmFsIGxvZ2ljLCAuLi4NCj4gPg0KPiA+ID4gK3N0YXRp
YyBpbnQgbG9hZF9zaGFyZWRfaW5mbyhzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgZG9tYWluX2Nv
bnRleHQgKmMpDQo+ID4gPiArew0KPiA+ID4gKyAgICBzdHJ1Y3QgZG9tYWluX3NoYXJlZF9pbmZv
X2NvbnRleHQgY3R4dDsNCj4gPiA+ICsgICAgc2l6ZV90IGhkcl9zaXplID0gb2Zmc2V0b2YodHlw
ZW9mKGN0eHQpLCBidWZmZXIpOw0KPiA+ID4gKyAgICB1bnNpZ25lZCBpbnQgaTsNCj4gPiA+ICsg
ICAgaW50IHJjOw0KPiA+ID4gKw0KPiA+ID4gKyAgICByYyA9IERPTUFJTl9MT0FEX0JFR0lOKFNI
QVJFRF9JTkZPLCBjLCAmaSk7DQo+ID4gPiArICAgIGlmICggcmMgKQ0KPiA+ID4gKyAgICAgICAg
cmV0dXJuIHJjOw0KPiA+ID4gKw0KPiA+ID4gKyAgICBpZiAoIGkgKSAvKiBleHBlY3Qgb25seSBh
IHNpbmdsZSBpbnN0YW5jZSAqLw0KPiA+ID4gKyAgICAgICAgcmV0dXJuIC1FTlhJTzsNCj4gPiA+
ICsNCj4gPiA+ICsgICAgcmMgPSBkb21haW5fbG9hZF9kYXRhKGMsICZjdHh0LCBoZHJfc2l6ZSk7
DQo+ID4gPiArICAgIGlmICggcmMgKQ0KPiA+ID4gKyAgICAgICAgcmV0dXJuIHJjOw0KPiA+ID4g
Kw0KPiA+ID4gKyAgICBpZiAoIGN0eHQuYnVmZmVyX3NpemUgPiBzaXplb2Yoc2hhcmVkX2luZm9f
dCkgfHwNCj4gPiA+ICsgICAgICAgICAoY3R4dC5mbGFncyAmIH5ET01BSU5fU0FWRV8zMkJJVF9T
SElORk8pICkNCj4gPiA+ICsgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiA+ID4gKw0KPiA+ID4g
KyAgICBpZiAoIGN0eHQuZmxhZ3MgJiBET01BSU5fU0FWRV8zMkJJVF9TSElORk8gKQ0KPiA+ID4g
KyAgICB7DQo+ID4gPiArI2lmZGVmIENPTkZJR19DT01QQVQNCj4gPiA+ICsgICAgICAgIGhhc18z
MmJpdF9zaGluZm8oZCkgPSB0cnVlOw0KPiA+ID4gKyNlbHNlDQo+ID4gPiArICAgICAgICByZXR1
cm4gLUVJTlZBTDsNCj4gPiA+ICsjZW5kaWYNCj4gPiA+ICsgICAgfQ0KPiA+ID4gKw0KPiA+ID4g
KyAgICBpZiAoIGlzX3B2X2RvbWFpbihkKSApDQo+ID4gPiArICAgIHsNCj4gPiA+ICsgICAgICAg
IHNoYXJlZF9pbmZvX3QgKnNoaW5mbyA9IHhtYWxsb2Moc2hhcmVkX2luZm9fdCk7DQo+ID4gPiAr
DQo+ID4gPiArICAgICAgICByYyA9IGRvbWFpbl9sb2FkX2RhdGEoYywgc2hpbmZvLCBzaXplb2Yo
KnNoaW5mbykpOw0KPiA+ID4gKyAgICAgICAgaWYgKCByYyApDQo+ID4gPiArICAgICAgICB7DQo+
ID4gPiArICAgICAgICAgICAgeGZyZWUoc2hpbmZvKTsNCj4gPiA+ICsgICAgICAgICAgICByZXR1
cm4gcmM7DQo+ID4gPiArICAgICAgICB9DQo+ID4gPiArDQo+ID4gPiArI2lmZGVmIENPTkZJR19D
T01QQVQNCj4gPiA+ICsgICAgICAgIGlmICggaGFzXzMyYml0X3NoaW5mbyhkKSApDQo+ID4gPiAr
ICAgICAgICB7DQo+ID4gPiArICAgICAgICAgICAgbWVtY3B5KCZkLT5zaGFyZWRfaW5mby0+Y29t
cGF0LnZjcHVfaW5mbywNCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgJnNoaW5mby0+Y29tcGF0
LnZjcHVfaW5mbywNCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgc2l6ZW9mKGQtPnNoYXJlZF9p
bmZvLT5jb21wYXQudmNwdV9pbmZvKSk7DQo+ID4gPiArICAgICAgICAgICAgbWVtY3B5KCZkLT5z
aGFyZWRfaW5mby0+Y29tcGF0LmFyY2gsDQo+ID4gPiArICAgICAgICAgICAgICAgICAgICZzaGlu
Zm8tPmNvbXBhdC5hcmNoLA0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICBzaXplb2YoZC0+c2hh
cmVkX2luZm8tPmNvbXBhdC52Y3B1X2luZm8pKTsNCj4gPiA+ICsgICAgICAgIH0NCj4gPiA+ICsg
ICAgICAgIGVsc2UNCj4gPiA+ICsgICAgICAgIHsNCj4gPiA+ICsgICAgICAgICAgICBtZW1jcHko
JmQtPnNoYXJlZF9pbmZvLT5uYXRpdmUudmNwdV9pbmZvLA0KPiA+ID4gKyAgICAgICAgICAgICAg
ICAgICAmc2hpbmZvLT5uYXRpdmUudmNwdV9pbmZvLA0KPiA+ID4gKyAgICAgICAgICAgICAgICAg
ICBzaXplb2YoZC0+c2hhcmVkX2luZm8tPm5hdGl2ZS52Y3B1X2luZm8pKTsNCj4gPiA+ICsgICAg
ICAgICAgICBtZW1jcHkoJmQtPnNoYXJlZF9pbmZvLT5uYXRpdmUuYXJjaCwNCj4gPiA+ICsgICAg
ICAgICAgICAgICAgICAgJnNoaW5mby0+bmF0aXZlLmFyY2gsDQo+ID4gPiArICAgICAgICAgICAg
ICAgICAgIHNpemVvZihkLT5zaGFyZWRfaW5mby0+bmF0aXZlLmFyY2gpKTsNCj4gPiA+ICsgICAg
ICAgIH0NCj4gPiA+ICsjZWxzZQ0KPiA+ID4gKyAgICAgICAgbWVtY3B5KCZkLT5zaGFyZWRfaW5m
by0+dmNwdV9pbmZvLA0KPiA+ID4gKyAgICAgICAgICAgICAgICZzaGluZm8tPnZjcHVfaW5mbywN
Cj4gPiA+ICsgICAgICAgICAgICAgICBzaXplb2YoZC0+c2hhcmVkX2luZm8tPnZjcHVfaW5mbykp
Ow0KPiA+ID4gKyAgICAgICAgbWVtY3B5KCZkLT5zaGFyZWRfaW5mby0+YXJjaCwNCj4gPiA+ICsg
ICAgICAgICAgICAgICAmc2hpbmZvLT5hcmNoLA0KPiA+ID4gKyAgICAgICAgICAgICAgIHNpemVv
ZihkLT5zaGFyZWRfaW5mby0+c2hhcmVkKSk7DQo+ID4gPiArI2VuZGlmDQo+ID4NCj4gPiAuLi4g
d2hlcmUgZG9lcyB0aGUgcmVzdCBvZiB0aGF0IGxvZ2ljIChyZXNldHRpbmcgb2YNCj4gPiBhcmNo
LnBmbl90b19tZm5fZnJhbWVfbGlzdF9saXN0LCBldnRjaG5fcGVuZGluZywgZXZ0Y2huX21hc2ss
IGFuZA0KPiA+IGV2dGNobl9wZW5kaW5nX3NlbCkgZ2V0IGRvbmU/IE9yIHdoeSBpcyBpdCBub3Qg
bmVlZGVkIGFueW1vcmU/DQo+IA0KPiBUaGUgcmVzZXR0aW5nIGxvZ2ljIGlzIHN0aWxsIGluIHhj
X3NyX3Jlc3RvcmVfeDg2X3B2LmMgKHNlZSBwYXRjaCAjNikuIEl0J3MgZ29pbmcgdG8gbmVlZCB0
byBzdGF5DQo+IHRoZXJlIGFueXdheSB0byBkZWFsIHdpdGggb2xkZXIgc3RyZWFtcyBzbyBJIG1h
ZGUgaXQgY29tbW9uIHRvIGJvdGggY2FzZXM7IGl0IHNlZW1zIHNsaWdodGx5IHNlcGFyYXRlDQo+
IGZyb20gcmVzdG9yaW5nIHRoZSBzaGFyZWQgaW5mby4NCj4gDQoNCkFjdHVhbGx5IEkndmUgY2hh
bmdlZCBteSBtaW5kIG9uIHRoaXMgb25lOyBJJ2xsIGRvIHRoZSB6ZXJvaW5nIGhlcmUgYW5kIGxl
YXZlIHRoZSBvbGQgU0hBUkVEX0lORk8gcmVjb3JkIHJlc3RvcmUgY29kZSBhbG9uZS4NCg0KICBQ
YXVsDQoNCj4gICBQYXVsDQo+IA0KPiA+DQo+ID4gSmFuDQoNCg==

