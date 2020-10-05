Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 962F4283308
	for <lists+xen-devel@lfdr.de>; Mon,  5 Oct 2020 11:18:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2915.8322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kPMdT-0005md-Jg; Mon, 05 Oct 2020 09:18:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2915.8322; Mon, 05 Oct 2020 09:18:23 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kPMdT-0005mE-GD; Mon, 05 Oct 2020 09:18:23 +0000
Received: by outflank-mailman (input) for mailman id 2915;
 Mon, 05 Oct 2020 09:18:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f4wr=DM=amazon.co.uk=prvs=540ed4173=pdurrant@srs-us1.protection.inumbo.net>)
 id 1kPMdS-0005m7-H0
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 09:18:22 +0000
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6d27969d-b2d2-4b1d-8b3f-2ad6c9b0edeb;
 Mon, 05 Oct 2020 09:18:21 +0000 (UTC)
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2c-168cbb73.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 05 Oct 2020 09:18:16 +0000
Received: from EX13D32EUC003.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2c-168cbb73.us-west-2.amazon.com (Postfix) with ESMTPS
 id 0113FA05BB; Mon,  5 Oct 2020 09:18:16 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 5 Oct 2020 09:18:14 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Mon, 5 Oct 2020 09:18:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=f4wr=DM=amazon.co.uk=prvs=540ed4173=pdurrant@srs-us1.protection.inumbo.net>)
	id 1kPMdS-0005m7-H0
	for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 09:18:22 +0000
X-Inumbo-ID: 6d27969d-b2d2-4b1d-8b3f-2ad6c9b0edeb
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 6d27969d-b2d2-4b1d-8b3f-2ad6c9b0edeb;
	Mon, 05 Oct 2020 09:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazon201209; t=1601889501; x=1633425501;
  h=from:to:cc:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version:subject;
  bh=24K6ASBYbBwXMp617UE/zbq+UrTDR2pL9xZfJNs/tDU=;
  b=CMjCej+QNMN6Y9I4NqiGgqMvSFWZXKPaiK6D4m4tiUkPBeRyhuLfOLq/
   I21jcDwYhBMHW650dn11WUjYfDCzEMw/qZUIqm3aotgjBGSWeUrnlsvN9
   R0l/HeTpZMdbSRShY65/DTBNOb8VPHw3rP/3MPGryZnzF31e8DoigghxN
   U=;
X-IronPort-AV: E=Sophos;i="5.77,338,1596499200"; 
   d="scan'208";a="73375476"
Subject: RE: [PATCH v9 2/8] xen/common/domctl: introduce
 XEN_DOMCTL_get/setdomaincontext
Thread-Topic: [PATCH v9 2/8] xen/common/domctl: introduce XEN_DOMCTL_get/setdomaincontext
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO email-inbound-relay-2c-168cbb73.us-west-2.amazon.com) ([10.47.23.38])
  by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP; 05 Oct 2020 09:18:16 +0000
Received: from EX13D32EUC003.ant.amazon.com (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
	by email-inbound-relay-2c-168cbb73.us-west-2.amazon.com (Postfix) with ESMTPS id 0113FA05BB;
	Mon,  5 Oct 2020 09:18:16 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 5 Oct 2020 09:18:14 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Mon, 5 Oct 2020 09:18:14 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Thread-Index: AQHMaZuCwoR0ssB24MBKMpsJEDSJHwEKq81GAaD/e3mph7/jwA==
Date: Mon, 5 Oct 2020 09:18:14 +0000
Message-ID: <cc549f2902da4ca9b02247f21dfb103c@EX13D32EUC003.ant.amazon.com>
References: <20200924131030.1876-1-paul@xen.org>
 <20200924131030.1876-3-paul@xen.org>
 <783f8b1b-f11f-d8ff-3643-d35f17c6c363@citrix.com>
In-Reply-To: <783f8b1b-f11f-d8ff-3643-d35f17c6c363@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.78]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiBTZW50OiAwMiBPY3RvYmVyIDIwMjAgMjI6NTgNCj4g
VG86IFBhdWwgRHVycmFudCA8cGF1bEB4ZW4ub3JnPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnDQo+IENjOiBEdXJyYW50LCBQYXVsIDxwZHVycmFudEBhbWF6b24uY28udWs+OyBKdWxp
ZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPjsgRGFuaWVsIERlIEdyYWFmDQo+IDxkZ2RlZ3JhQHR5
Y2hvLm5zYS5nb3Y+OyBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT47IFdl
aSBMaXUgPHdsQHhlbi5vcmc+OyBHZW9yZ2UgRHVubGFwDQo+IDxnZW9yZ2UuZHVubGFwQGNpdHJp
eC5jb20+OyBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+OyBTdGVmYW5vIFN0YWJlbGxp
bmkNCj4gPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+IFN1YmplY3Q6IFJFOiBbRVhURVJOQUxd
IFtQQVRDSCB2OSAyLzhdIHhlbi9jb21tb24vZG9tY3RsOiBpbnRyb2R1Y2UgWEVOX0RPTUNUTF9n
ZXQvc2V0ZG9tYWluY29udGV4dA0KPiANCj4gQ0FVVElPTjogVGhpcyBlbWFpbCBvcmlnaW5hdGVk
IGZyb20gb3V0c2lkZSBvZiB0aGUgb3JnYW5pemF0aW9uLiBEbyBub3QgY2xpY2sgbGlua3Mgb3Ig
b3Blbg0KPiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGNhbiBjb25maXJtIHRoZSBzZW5kZXIgYW5k
IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4NCj4gDQo+IA0KPiANCj4gT24gMjQvMDkvMjAyMCAx
NDoxMCwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiA+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9w
dWJsaWMvZG9tY3RsLmggYi94ZW4vaW5jbHVkZS9wdWJsaWMvZG9tY3RsLmgNCj4gPiBpbmRleCA3
OTFmMGEyNTkyLi43NDMxMDUxODFmIDEwMDY0NA0KPiA+IC0tLSBhL3hlbi9pbmNsdWRlL3B1Ymxp
Yy9kb21jdGwuaA0KPiA+ICsrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy9kb21jdGwuaA0KPiA+IEBA
IC0xMTMwLDYgKzExMzAsNDMgQEAgc3RydWN0IHhlbl9kb21jdGxfdnVhcnRfb3Agew0KPiA+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAqLw0KPiA+ICB9Ow0KPiA+DQo+ID4gKy8q
DQo+ID4gKyAqIFhFTl9ET01DVExfZ2V0ZG9tYWluY29udGV4dA0KPiA+ICsgKiAtLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0NCj4gPiArICoNCj4gPiArICogYnVmZmVyIChJTik6ICAgVGhlIGJ1
ZmZlciBpbnRvIHdoaWNoIHRoZSBjb250ZXh0IGRhdGEgc2hvdWxkIGJlDQo+ID4gKyAqICAgICAg
ICAgICAgICAgIGNvcGllZCwgb3IgTlVMTCB0byBxdWVyeSB0aGUgYnVmZmVyIHNpemUgdGhhdCBz
aG91bGQNCj4gPiArICogICAgICAgICAgICAgICAgYmUgYWxsb2NhdGVkLg0KPiA+ICsgKiBzaXpl
IChJTi9PVVQpOiBJZiAnYnVmZmVyJyBpcyBOVUxMIHRoZW4gdGhlIHZhbHVlIHBhc3NlZCBpbiBt
dXN0IGJlDQo+ID4gKyAqICAgICAgICAgICAgICAgIHplcm8sIGFuZCB0aGUgdmFsdWUgcGFzc2Vk
IG91dCB3aWxsIGJlIHRoZSBzaXplIG9mIHRoZQ0KPiA+ICsgKiAgICAgICAgICAgICAgICBidWZm
ZXIgdG8gYWxsb2NhdGUuDQo+ID4gKyAqICAgICAgICAgICAgICAgIElmICdidWZmZXInIGlzIG5v
bi1OVUxMIHRoZW4gdGhlIHZhbHVlIHBhc3NlZCBpbiBtdXN0DQo+ID4gKyAqICAgICAgICAgICAg
ICAgIGJlIHRoZSBzaXplIG9mIHRoZSBidWZmZXIgaW50byB3aGljaCBkYXRhIG1heSBiZSBjb3Bp
ZWQuDQo+ID4gKyAqICAgICAgICAgICAgICAgIFRoZSB2YWx1ZSBwYXNzZWQgb3V0IHdpbGwgYmUg
dGhlIHNpemUgb2YgZGF0YSB3cml0dGVuLg0KPiA+ICsgKi8NCj4gPiArc3RydWN0IHhlbl9kb21j
dGxfZ2V0ZG9tYWluY29udGV4dCB7DQo+ID4gKyAgICB1aW50MzJfdCBzaXplOw0KPiANCj4gVGhp
cyBzZXJpZXMgaXMgZnVsbCBvZiBtaXNtYXRjaGVkIDMyLzY0Yml0IHNpemVzLCB3aXRoIHNldmVy
YWwNCj4gdHJ1bmNhdGlvbiBidWdzIGluIHRoZSBwcmV2aW91cyBwYXRjaC4NCj4gDQo+IEp1c3Qg
dXNlIGEgNjRiaXQgc2l6ZSBoZXJlLiAgTGlmZSBpcyB0b28gc2hvcnQgdG8gZ28gc2VhcmNoaW5n
IGZvciBhbGwNCj4gdGhlIG90aGVyIHRydW5jYXRpb24gYnVnIHdoZW4gdGhpcyBzdHJlYW0gdGlw
cyBvdmVyIDRHLCBhbmQgaXRzIG5vdCBsaWtlDQo+IHRoZXJlIGlzIGEgc2hvcnRhZ2Ugb2Ygc3Bh
Y2UgaW4gdGhpcyBzdHJ1Y3R1cmUuDQo+IA0KDQpPay4NCg0KPiA+ICsgICAgdWludDMyX3QgcGFk
Ow0KPiA+ICsgICAgWEVOX0dVRVNUX0hBTkRMRV82NCh2b2lkKSBidWZmZXI7DQo+ID4gK307DQo+
ID4gKw0KPiA+ICsvKiBYRU5fRE9NQ1RMX3NldGRvbWFpbmNvbnRleHQNCj4gPiArICogLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gKyAqDQo+ID4gKyAqIGJ1ZmZlciAoSU4pOiAgIFRo
ZSBidWZmZXIgZnJvbSB3aGljaCB0aGUgY29udGV4dCBkYXRhIHNob3VsZCBiZQ0KPiA+ICsgKiAg
ICAgICAgICAgICAgICBjb3BpZWQuDQo+ID4gKyAqIHNpemUgKElOKTogICAgIFRoZSBzaXplIG9m
IHRoZSBidWZmZXIgZnJvbSB3aGljaCBkYXRhIG1heSBiZSBjb3BpZWQuDQo+ID4gKyAqICAgICAg
ICAgICAgICAgIFRoaXMgZGF0YSBtdXN0IGluY2x1ZGUgRE9NQUlOX1NBVkVfQ09ERV9IRUFERVIg
YXQgdGhlDQo+ID4gKyAqICAgICAgICAgICAgICAgIHN0YXJ0IGFuZCB0ZXJtaW5hdGUgd2l0aCBh
IERPTUFJTl9TQVZFX0NPREVfRU5EIHJlY29yZC4NCj4gPiArICogICAgICAgICAgICAgICAgQW55
IGRhdGEgYmV5b25kIHRoZSBET01BSU5fU0FWRV9DT0RFX0VORCByZWNvcmQgd2lsbCBiZQ0KPiA+
ICsgKiAgICAgICAgICAgICAgICBpZ25vcmVkLg0KPiA+ICsgKi8NCj4gPiArc3RydWN0IHhlbl9k
b21jdGxfc2V0ZG9tYWluY29udGV4dCB7DQo+ID4gKyAgICB1aW50MzJfdCBzaXplOw0KPiA+ICsg
ICAgdWludDMyX3QgcGFkOw0KPiA+ICsgICAgWEVOX0dVRVNUX0hBTkRMRV82NChjb25zdF92b2lk
KSBidWZmZXI7DQo+ID4gK307DQo+ID4gKw0KPiA+ICBzdHJ1Y3QgeGVuX2RvbWN0bCB7DQo+ID4g
ICAgICB1aW50MzJfdCBjbWQ7DQo+ID4gICNkZWZpbmUgWEVOX0RPTUNUTF9jcmVhdGVkb21haW4g
ICAgICAgICAgICAgICAgICAgMQ0KPiA+IEBAIC0xMjE0LDYgKzEyNTEsOCBAQCBzdHJ1Y3QgeGVu
X2RvbWN0bCB7DQo+ID4gICNkZWZpbmUgWEVOX0RPTUNUTF92dWFydF9vcCAgICAgICAgICAgICAg
ICAgICAgICA4MQ0KPiA+ICAjZGVmaW5lIFhFTl9ET01DVExfZ2V0X2NwdV9wb2xpY3kgICAgICAg
ICAgICAgICAgODINCj4gPiAgI2RlZmluZSBYRU5fRE9NQ1RMX3NldF9jcHVfcG9saWN5ICAgICAg
ICAgICAgICAgIDgzDQo+ID4gKyNkZWZpbmUgWEVOX0RPTUNUTF9nZXRkb21haW5jb250ZXh0ICAg
ICAgICAgICAgICA4NA0KPiA+ICsjZGVmaW5lIFhFTl9ET01DVExfc2V0ZG9tYWluY29udGV4dCAg
ICAgICAgICAgICAgODUNCj4gDQo+IFNvLCB3ZSd2ZSBjdXJyZW50bHkgZ290Og0KPiANCj4gI2Rl
ZmluZSBYRU5fRE9NQ1RMX3NldHZjcHVjb250ZXh0ICAgICAgICAgICAgICAgIDEyDQo+ICNkZWZp
bmUgWEVOX0RPTUNUTF9nZXR2Y3B1Y29udGV4dCAgICAgICAgICAgICAgICAxMw0KPiAjZGVmaW5l
IFhFTl9ET01DVExfZ2V0aHZtY29udGV4dCAgICAgICAgICAgICAgICAgMzMNCj4gI2RlZmluZSBY
RU5fRE9NQ1RMX3NldGh2bWNvbnRleHQgICAgICAgICAgICAgICAgIDM0DQo+ICNkZWZpbmUgWEVO
X0RPTUNUTF9zZXRfZXh0X3ZjcHVjb250ZXh0ICAgICAgICAgICA0Mg0KPiAjZGVmaW5lIFhFTl9E
T01DVExfZ2V0X2V4dF92Y3B1Y29udGV4dCAgICAgICAgICAgNDMNCj4gI2RlZmluZSBYRU5fRE9N
Q1RMX2dldGh2bWNvbnRleHRfcGFydGlhbCAgICAgICAgIDU1DQo+ICNkZWZpbmUgWEVOX0RPTUNU
TF9zZXR2Y3B1ZXh0c3RhdGUgICAgICAgICAgICAgICA2Mg0KPiAjZGVmaW5lIFhFTl9ET01DVExf
Z2V0dmNwdWV4dHN0YXRlICAgICAgICAgICAgICAgNjMNCj4gDQo+IHdoaWNoIGFyZSBkb2luZyBh
bGFybWluZ2x5IHJlbGF0ZWQgdGhpbmdzIGZvciB2Y3B1cy4gIChBcyBhbiBhbXVzaW5nDQo+IGV4
ZXJjaXNlIHRvIHRoZSByZWFkZXIsIGZpZ3VyZSBvdXQgd2hpY2ggYXJlIFBWIHNwZWNpZmljIGFu
ZCB3aGljaCBhcmUNCj4gSFZNIHNwZWNpZmljLiAgSGludDogdGhleSdyZSBub3QgZGlzam9pbnQg
c2V0cy4pDQo+IA0KDQpZZXMsIGhlbmNlIHRoZSBkZXNpcmUgdG8gY29tZSB1cCB3aXRoIHNvbWV0
aGluZyBjb21tb24uDQoNCj4gDQo+IEkga25vdyBicmVha2luZyB3aXRoIHRyYWRpdGlvbiBpcyBz
YWNyaWxlZ2UsIGJ1dCBhdCB0aGUgdmVyeSBtaW5pbXVtLA0KPiBjYW4gd2UgZ2V0IHNvbWUgdW5k
ZXJzY29yZXMgaW4gdGhhdCBuYW1lIHNvIHlvdSBjYW4gYXQgbGVhc3QgcmVhZCB0aGUNCj4gd29y
ZHMgd2hpY2ggbWFrZSBpdCB1cCBtb3JlIGVhc2lseS4NCj4gDQoNClN1cmUuDQoNCiAgUGF1bA0K
DQo+IH5BbmRyZXcNCg==

