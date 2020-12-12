Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 102B42D86F2
	for <lists+xen-devel@lfdr.de>; Sat, 12 Dec 2020 14:36:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.51160.90071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ko54E-0008D7-3D; Sat, 12 Dec 2020 13:36:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 51160.90071; Sat, 12 Dec 2020 13:36:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ko54D-0008Ci-W1; Sat, 12 Dec 2020 13:36:09 +0000
Received: by outflank-mailman (input) for mailman id 51160;
 Sat, 12 Dec 2020 13:36:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EAKn=FQ=amazon.com=prvs=608be7199=havanur@srs-us1.protection.inumbo.net>)
 id 1ko54C-0008Cd-Qg
 for xen-devel@lists.xenproject.org; Sat, 12 Dec 2020 13:36:08 +0000
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 119c40f5-ac2c-4216-8802-d3b0a41e5e9c;
 Sat, 12 Dec 2020 13:36:05 +0000 (UTC)
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1a-16acd5e0.us-east-1.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 12 Dec 2020 13:35:58 +0000
Received: from EX13D36EUC004.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
 by email-inbound-relay-1a-16acd5e0.us-east-1.amazon.com (Postfix) with ESMTPS
 id 2DC16A216A; Sat, 12 Dec 2020 13:35:57 +0000 (UTC)
Received: from EX13D36EUC004.ant.amazon.com (10.43.164.126) by
 EX13D36EUC004.ant.amazon.com (10.43.164.126) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Sat, 12 Dec 2020 13:35:41 +0000
Received: from EX13D36EUC004.ant.amazon.com ([10.43.164.126]) by
 EX13D36EUC004.ant.amazon.com ([10.43.164.126]) with mapi id 15.00.1497.006;
 Sat, 12 Dec 2020 13:35:41 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 119c40f5-ac2c-4216-8802-d3b0a41e5e9c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1607780165; x=1639316165;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=vkrXKhuFgTTLv1TCPVyui6xJb0oRVKSQmEf5fGFEub0=;
  b=vXUvXs5yd3B+ef1kzeRl9rhGozU+8bqnljUN8+dv4lt+UOeilaLTUBYB
   3FMN0uA5B2DXZ9nHhZEuJjJQL6Hzg2qPz+7qawihsK7dMIquUPMxiQWSh
   ZSAfHCWwGu/mCuysH7tj+3IWUUUtSQjqt6ptCZ9K9U/xUFDxw3mFiU+v1
   8=;
X-IronPort-AV: E=Sophos;i="5.78,414,1599523200"; 
   d="scan'208";a="68942740"
From: "Shamsundara Havanur, Harsha" <havanur@amazon.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "jbeulich@suse.com" <jbeulich@suse.com>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH v1 1/1] Invalidate cache for cpus affinitized to the
 domain
Thread-Topic: [XEN PATCH v1 1/1] Invalidate cache for cpus affinitized to the
 domain
Thread-Index: AQHWz7MJSRGqvamGtEii6iRZ4MXyYqnzd/YA
Date: Sat, 12 Dec 2020 13:35:41 +0000
Message-ID: <40c8b5378f1075e9b40eafbae61932e75acbf327.camel@amazon.com>
References: <cover.1607686878.git.havanur@amazon.com>
	 <aad47c43b7cd7a391492b8be7b881cd37e9764c7.1607686878.git.havanur@amazon.com>
In-Reply-To: <aad47c43b7cd7a391492b8be7b881cd37e9764c7.1607686878.git.havanur@amazon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.29]
Content-Type: text/plain; charset="utf-8"
Content-ID: <1087129A2472B74AB1C1671859BCD3FE@amazon.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: Bulk

Q0NpbmcgQW5keSBhbmQgSmFuDQpJcyByZXN0cmljdGluZyBjYWNoZSBmbHVzaCB0byBzZXQgb2Yg
Y3B1cyBib3VuZCB0byB0aGUgZG9tYWluLCBhDQpyaWdodCB0aGluZyB0byBkbz8NCg0KT24gRnJp
LCAyMDIwLTEyLTExIGF0IDExOjQ0ICswMDAwLCBIYXJzaGEgU2hhbXN1bmRhcmEgSGF2YW51ciB3
cm90ZToNCj4gQSBIVk0gZG9tYWluIGZsdXNoZXMgY2FjaGUgb24gYWxsIHRoZSBjcHVzIHVzaW5n
DQo+IGBmbHVzaF9hbGxgIG1hY3JvIHdoaWNoIHVzZXMgY3B1X29ubGluZV9tYXAsIGR1cmluZw0K
PiBpKSBjcmVhdGlvbiBvZiBhIG5ldyBkb21haW4NCj4gaWkpIHdoZW4gZGV2aWNlLW1vZGVsIG9w
IGlzIHBlcmZvcm1lZA0KPiBpaWkpIHdoZW4gZG9tYWluIGlzIGRlc3RydWN0ZWQuDQo+IA0KPiBU
aGlzIHRyaWdnZXJzIElQSSBvbiBhbGwgdGhlIGNwdXMsIHRodXMgYWZmZWN0aW5nIG90aGVyDQo+
IGRvbWFpbnMgdGhhdCBhcmUgcGlubmVkIHRvIGRpZmZlcmVudCBwY3B1cy4gVGhpcyBwYXRjaA0K
PiByZXN0cmljdHMgY2FjaGUgZmx1c2ggdG8gdGhlIHNldCBvZiBjcHVzIGFmZmluaXRpemVkIHRv
DQo+IHRoZSBjdXJyZW50IGRvbWFpbiB1c2luZyBgZG9tYWluLT5kaXJ0eV9jcHVtYXNrYC4NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IEhhcnNoYSBTaGFtc3VuZGFyYSBIYXZhbnVyIDxoYXZhbnVyQGFt
YXpvbi5jb20+DQo+IC0tLQ0KPiAgeGVuL2FyY2gveDg2L2h2bS9odm0uYyAgICAgfCAyICstDQo+
ICB4ZW4vYXJjaC94ODYvaHZtL210cnIuYyAgICB8IDYgKysrLS0tDQo+ICB4ZW4vYXJjaC94ODYv
aHZtL3N2bS9zdm0uYyB8IDIgKy0NCj4gIHhlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jIHwgMiAr
LQ0KPiAgNCBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+
IA0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS9odm0uYyBiL3hlbi9hcmNoL3g4Ni9o
dm0vaHZtLmMNCj4gaW5kZXggNTRlMzJlNGZlOC4uZWMyNDdjNzAxMCAxMDA2NDQNCj4gLS0tIGEv
eGVuL2FyY2gveDg2L2h2bS9odm0uYw0KPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL2h2bS5jDQo+
IEBAIC0yMjE5LDcgKzIyMTksNyBAQCB2b2lkIGh2bV9zaGFkb3dfaGFuZGxlX2NkKHN0cnVjdCB2
Y3B1ICp2LA0KPiB1bnNpZ25lZCBsb25nIHZhbHVlKQ0KPiAgICAgICAgICAgICAgZG9tYWluX3Bh
dXNlX25vc3luYyh2LT5kb21haW4pOw0KPiAgDQo+ICAgICAgICAgICAgICAvKiBGbHVzaCBwaHlz
aWNhbCBjYWNoZXMuICovDQo+IC0gICAgICAgICAgICBmbHVzaF9hbGwoRkxVU0hfQ0FDSEUpOw0K
PiArICAgICAgICAgICAgZmx1c2hfbWFzayh2LT5kb21haW4tPmRpcnR5X2NwdW1hc2ssIEZMVVNI
X0NBQ0hFKTsNCj4gICAgICAgICAgICAgIGh2bV9zZXRfdWNfbW9kZSh2LCAxKTsNCj4gIA0KPiAg
ICAgICAgICAgICAgZG9tYWluX3VucGF1c2Uodi0+ZG9tYWluKTsNCj4gZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL3g4Ni9odm0vbXRyci5jIGIveGVuL2FyY2gveDg2L2h2bS9tdHJyLmMNCj4gaW5kZXgg
ZmIwNTFkNTljMy4uMGQ4MDRjMWZhMCAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9t
dHJyLmMNCj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9tdHJyLmMNCj4gQEAgLTYzMSw3ICs2MzEs
NyBAQCBpbnQgaHZtX3NldF9tZW1fcGlubmVkX2NhY2hlYXR0cihzdHJ1Y3QgZG9tYWluDQo+ICpk
LCB1aW50NjRfdCBnZm5fc3RhcnQsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICBicmVhazsN
Cj4gICAgICAgICAgICAgICAgICAgICAgLyogZmFsbCB0aHJvdWdoICovDQo+ICAgICAgICAgICAg
ICAgICAgZGVmYXVsdDoNCj4gLSAgICAgICAgICAgICAgICAgICAgZmx1c2hfYWxsKEZMVVNIX0NB
Q0hFKTsNCj4gKyAgICAgICAgICAgICAgICAgICAgZmx1c2hfbWFzayhkLT5kaXJ0eV9jcHVtYXNr
LCBGTFVTSF9DQUNIRSk7DQo+ICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOw0KPiAgICAgICAg
ICAgICAgICAgIH0NCj4gICAgICAgICAgICAgICAgICByZXR1cm4gMDsNCj4gQEAgLTY4Myw3ICs2
ODMsNyBAQCBpbnQgaHZtX3NldF9tZW1fcGlubmVkX2NhY2hlYXR0cihzdHJ1Y3QgZG9tYWluDQo+
ICpkLCB1aW50NjRfdCBnZm5fc3RhcnQsDQo+ICAgICAgbGlzdF9hZGRfcmN1KCZyYW5nZS0+bGlz
dCwgJmQtDQo+ID5hcmNoLmh2bS5waW5uZWRfY2FjaGVhdHRyX3Jhbmdlcyk7DQo+ICAgICAgcDJt
X21lbW9yeV90eXBlX2NoYW5nZWQoZCk7DQo+ICAgICAgaWYgKCB0eXBlICE9IFBBVF9UWVBFX1dS
QkFDSyApDQo+IC0gICAgICAgIGZsdXNoX2FsbChGTFVTSF9DQUNIRSk7DQo+ICsgICAgICAgIGZs
dXNoX21hc2soZC0+ZGlydHlfY3B1bWFzaywgRkxVU0hfQ0FDSEUpOw0KPiAgDQo+ICAgICAgcmV0
dXJuIDA7DQo+ICB9DQo+IEBAIC03ODUsNyArNzg1LDcgQEAgdm9pZCBtZW1vcnlfdHlwZV9jaGFu
Z2VkKHN0cnVjdCBkb21haW4gKmQpDQo+ICAgICAgICAgICBkLT52Y3B1ICYmIGQtPnZjcHVbMF0g
KQ0KPiAgICAgIHsNCj4gICAgICAgICAgcDJtX21lbW9yeV90eXBlX2NoYW5nZWQoZCk7DQo+IC0g
ICAgICAgIGZsdXNoX2FsbChGTFVTSF9DQUNIRSk7DQo+ICsgICAgICAgIGZsdXNoX21hc2soZC0+
ZGlydHlfY3B1bWFzaywgRkxVU0hfQ0FDSEUpOw0KPiAgICAgIH0NCj4gIH0NCj4gIA0KPiBkaWZm
IC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS9zdm0vc3ZtLmMgYi94ZW4vYXJjaC94ODYvaHZtL3N2
bS9zdm0uYw0KPiBpbmRleCBjZmVhNWI1NTIzLi4zODNlNzYzZDdkIDEwMDY0NA0KPiAtLS0gYS94
ZW4vYXJjaC94ODYvaHZtL3N2bS9zdm0uYw0KPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL3N2bS9z
dm0uYw0KPiBAQCAtMjM5NSw3ICsyMzk1LDcgQEAgc3RhdGljIHZvaWQgc3ZtX3ZtZXhpdF9tY2Vf
aW50ZXJjZXB0KA0KPiAgc3RhdGljIHZvaWQgc3ZtX3diaW52ZF9pbnRlcmNlcHQodm9pZCkNCj4g
IHsNCj4gICAgICBpZiAoIGNhY2hlX2ZsdXNoX3Blcm1pdHRlZChjdXJyZW50LT5kb21haW4pICkN
Cj4gLSAgICAgICAgZmx1c2hfYWxsKEZMVVNIX0NBQ0hFKTsNCj4gKyAgICAgICAgZmx1c2hfbWFz
ayhjdXJyZW50LT5kb21haW4tPmRpcnR5X2NwdW1hc2ssIEZMVVNIX0NBQ0hFKTsNCj4gIH0NCj4g
IA0KPiAgc3RhdGljIHZvaWQgc3ZtX3ZtZXhpdF9kb19pbnZhbGlkYXRlX2NhY2hlKHN0cnVjdCBj
cHVfdXNlcl9yZWdzDQo+ICpyZWdzLA0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS92
bXgvdm14LmMgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYw0KPiBpbmRleCA4NmI4OTE2YTVk
Li5hMDVjNzAzNmM0IDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYw0K
PiArKysgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYw0KPiBAQCAtMzM0OSw3ICszMzQ5LDcg
QEAgc3RhdGljIHZvaWQgdm14X3diaW52ZF9pbnRlcmNlcHQodm9pZCkNCj4gICAgICAgICAgcmV0
dXJuOw0KPiAgDQo+ICAgICAgaWYgKCBjcHVfaGFzX3diaW52ZF9leGl0aW5nICkNCj4gLSAgICAg
ICAgZmx1c2hfYWxsKEZMVVNIX0NBQ0hFKTsNCj4gKyAgICAgICAgZmx1c2hfbWFzayhjdXJyZW50
LT5kb21haW4tPmRpcnR5X2NwdW1hc2ssIEZMVVNIX0NBQ0hFKTsNCj4gICAgICBlbHNlDQo+ICAg
ICAgICAgIHdiaW52ZCgpOw0KPiAgfQ0K

