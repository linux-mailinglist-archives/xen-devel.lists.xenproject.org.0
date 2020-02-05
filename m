Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D13A5153533
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 17:28:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izNV5-00068g-8c; Wed, 05 Feb 2020 16:26:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NItI=3Z=amazon.com=prvs=2975631b3=hongyxia@srs-us1.protection.inumbo.net>)
 id 1izNV4-00068b-24
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 16:26:02 +0000
X-Inumbo-ID: 32b2b3c2-4834-11ea-ad98-bc764e2007e4
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 32b2b3c2-4834-11ea-ad98-bc764e2007e4;
 Wed, 05 Feb 2020 16:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1580919962; x=1612455962;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=H2DV3eNLBRY8QkcfI8jhXVGjWg1Ne5NtXFtQ6PiRiB4=;
 b=slxhSlhTQggb/KpRS5fGxv9Rlq4SDNh2wsw8a3B9c3zFWTnqS3vZbOqw
 0dTz4JvXIVPyS1L0lvcOiwZl+VvDWUy4BvEq/qeKGx6Fd5JeXwNu8p7qd
 RPOx14dMXwcejMVHFo11OD/7BPiByc0YsP/72upP/fqnAk0LjZ01iMjZM k=;
IronPort-SDR: MnAH1cOjf9m2T1s+mQrG2jxq+ofFkEGnIvBGhF/UfPN4XWQzpiHqJI13Fjm7ACJ5+9W5vxYiEq
 51LIroHt58Tg==
X-IronPort-AV: E=Sophos;i="5.70,406,1574121600"; d="scan'208";a="16369009"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1a-821c648d.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 05 Feb 2020 16:26:01 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1a-821c648d.us-east-1.amazon.com (Postfix) with ESMTPS
 id 8FA93A2863; Wed,  5 Feb 2020 16:25:59 +0000 (UTC)
Received: from EX13D37EUA003.ant.amazon.com (10.43.165.7) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Wed, 5 Feb 2020 16:25:58 +0000
Received: from EX13D37EUA003.ant.amazon.com (10.43.165.7) by
 EX13D37EUA003.ant.amazon.com (10.43.165.7) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 5 Feb 2020 16:25:57 +0000
Received: from EX13D37EUA003.ant.amazon.com ([10.43.165.7]) by
 EX13D37EUA003.ant.amazon.com ([10.43.165.7]) with mapi id 15.00.1367.000;
 Wed, 5 Feb 2020 16:25:57 +0000
From: "Xia, Hongyan" <hongyxia@amazon.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH v6] x86: introduce a new set of APIs to
 manage Xen page tables
Thread-Index: AQHV1eIrRnc+6+Xo+EGsYXAUQBltvqgM1h+A
Date: Wed, 5 Feb 2020 16:25:57 +0000
Message-ID: <1398d8919b9f5c81e54b459c69e6b89352260ebe.camel@amazon.com>
References: <ad98947f577560d47ea7825deb624149788645d0.1580219401.git.hongyxia@amazon.com>
In-Reply-To: <ad98947f577560d47ea7825deb624149788645d0.1580219401.git.hongyxia@amazon.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.216]
Content-ID: <2300FF2B081084499051A81C58551C00@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v6] x86: introduce a new set of APIs to
 manage Xen page tables
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "Grall,
 Julien" <jgrall@amazon.com>, "wl@xen.org" <wl@xen.org>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGluZy4NCg0KT24gVHVlLCAyMDIwLTAxLTI4IGF0IDEzOjUwICswMDAwLCBIb25neWFuIFhpYSB3
cm90ZToNCj4gRnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4NCj4gDQo+IFdlIGFy
ZSBnb2luZyB0byBzd2l0Y2ggdG8gdXNpbmcgZG9taGVhcCBwYWdlIGZvciBwYWdlIHRhYmxlcy4N
Cj4gQSBuZXcgc2V0IG9mIEFQSXMgaXMgaW50cm9kdWNlZCB0byBhbGxvY2F0ZSBhbmQgZnJlZSBw
YWdlcyBvZiBwYWdlDQo+IHRhYmxlcyBiYXNlZCBvbiBtZm4gaW5zdGVhZCBvZiB0aGUgeGVuaGVh
cCBkaXJlY3QgbWFwIGFkZHJlc3MuIFRoZQ0KPiBhbGxvY2F0aW9uIGFuZCBkZWFsbG9jYXRpb24g
d29yayBvbiBtZm5fdCBidXQgbm90IHBhZ2VfaW5mbywgYmVjYXVzZQ0KPiB0aGV5IGFyZSByZXF1
aXJlZCB0byB3b3JrIGV2ZW4gYmVmb3JlIGZyYW1lIHRhYmxlIGlzIHNldCB1cC4NCj4gDQo+IElt
cGxlbWVudCB0aGUgb2xkIGZ1bmN0aW9ucyB3aXRoIHRoZSBuZXcgb25lcy4gV2Ugd2lsbCByZXdy
aXRlLCBzaXRlDQo+IGJ5IHNpdGUsIG90aGVyIG1tIGZ1bmN0aW9ucyB0aGF0IG1hbmlwdWxhdGUg
cGFnZSB0YWJsZXMgdG8gdXNlIHRoZQ0KPiBuZXcNCj4gQVBJcy4NCj4gDQo+IEFmdGVyIHRoZSBh
bGxvY2F0aW9uLCBvbmUgbmVlZHMgdG8gbWFwIGFuZCB1bm1hcCB2aWEgbWFwX2RvbWFpbl9wYWdl
DQo+IHRvDQo+IGFjY2VzcyB0aGUgUFRFcy4gVGhpcyBkb2VzIG5vdCBicmVhayB4ZW4gaGFsZiB3
YXksIHNpbmNlIHRoZSBuZXcgQVBJcw0KPiBzdGlsbCB1c2UgeGVuaGVhcCBwYWdlcyB1bmRlcm5l
YXRoLCBhbmQgbWFwX2RvbWFpbl9wYWdlIHdpbGwganVzdCB1c2UNCj4gdGhlIGRpcmVjdG1hcCBm
b3IgbWFwcGluZ3MuIFRoZXkgd2lsbCBiZSBzd2l0Y2hlZCB0byB1c2UgZG9taGVhcCBhbmQNCj4g
ZHluYW1pYyBtYXBwaW5ncyB3aGVuIHVzYWdlIG9mIG9sZCBBUElzIGlzIGVsaW1pbmF0ZWQuDQo+
IA0KPiBObyBmdW5jdGlvbmFsIGNoYW5nZSBpbnRlbmRlZCBpbiB0aGlzIHBhdGNoLg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4NCj4gU2lnbmVkLW9m
Zi1ieTogSG9uZ3lhbiBYaWEgPGhvbmd5eGlhQGFtYXpvbi5jb20+DQo+IFJldmlld2VkLWJ5OiBK
dWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29tPg0KPiANCj4gLS0tDQo+IENoYW5nZWQgc2lu
Y2UgdjU6DQo+IC0gc291bmRzIGxpa2Ugd2UgYXJlIGhhcHB5IHRvIHVzZSBtYXBfZG9tYWluX3Bh
Z2UgZm9yIFhlbiBQVEVzLg0KPiBSZW1vdmUNCj4gICBtYXAvdW5tYXBfeGVuX3BhZ2V0YWJsZSwg
anVzdCB1c2UgbWFwL3VubWFwX2RvbWFpbl9wYWdlIGluc3RlYWQuDQo+IC0gcmVtb3ZlIHJlZHVu
ZGFudCBsb2dpYyBpbiBmcmVlX3hlbl9wYWdldGFibGUuDQo+IA0KPiBDaGFuZ2VkIHNpbmNlIHY0
Og0KPiAtIHByb3Blcmx5IGhhbmRsZSBJTlZBTElEX01GTi4NCj4gLSByZW1vdmUgdGhlIF9uZXcg
c3VmZml4IGZvciBtYXAvdW5tYXBfeGVuX3BhZ2V0YWJsZSBiZWNhdXNlIHRoZXkgZG8NCj4gbm90
DQo+ICAgaGF2ZSBvbGQgYWx0ZXJuYXRpdmVzLg0KPiANCj4gQ2hhbmdlZCBzaW5jZSB2MzoNCj4g
LSBjb25zdCBxdWFsaWZ5IHVubWFwX3hlbl9wYWdldGFibGVfbmV3KCkuDQo+IC0gcmVtb3ZlIHJl
ZHVuZGFudCBwYXJlbnRoZXNlcy4NCj4gLS0tDQo+ICB4ZW4vYXJjaC94ODYvbW0uYyAgICAgICAg
fCAzMiArKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLQ0KPiAgeGVuL2luY2x1ZGUvYXNt
LXg4Ni9tbS5oIHwgIDMgKysrDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKyks
IDUgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21tLmMgYi94
ZW4vYXJjaC94ODYvbW0uYw0KPiBpbmRleCBmNTBjMDY1YWYzLi5mYTgyNGQ1MjUyIDEwMDY0NA0K
PiAtLS0gYS94ZW4vYXJjaC94ODYvbW0uYw0KPiArKysgYi94ZW4vYXJjaC94ODYvbW0uYw0KPiBA
QCAtMTE5LDYgKzExOSw3IEBADQo+ICAjaW5jbHVkZSA8eGVuL2VmaS5oPg0KPiAgI2luY2x1ZGUg
PHhlbi9ncmFudF90YWJsZS5oPg0KPiAgI2luY2x1ZGUgPHhlbi9oeXBlcmNhbGwuaD4NCj4gKyNp
bmNsdWRlIDx4ZW4vbW0uaD4NCj4gICNpbmNsdWRlIDxhc20vcGFnaW5nLmg+DQo+ICAjaW5jbHVk
ZSA8YXNtL3NoYWRvdy5oPg0KPiAgI2luY2x1ZGUgPGFzbS9wYWdlLmg+DQo+IEBAIC00OTQ3LDIy
ICs0OTQ4LDQzIEBAIGludCBtbWNmZ19pbnRlcmNlcHRfd3JpdGUoDQo+ICB9DQo+ICANCj4gIHZv
aWQgKmFsbG9jX3hlbl9wYWdldGFibGUodm9pZCkNCj4gK3sNCj4gKyAgICBtZm5fdCBtZm4gPSBh
bGxvY194ZW5fcGFnZXRhYmxlX25ldygpOw0KPiArDQo+ICsgICAgcmV0dXJuIG1mbl9lcShtZm4s
IElOVkFMSURfTUZOKSA/IE5VTEwgOg0KPiBtZm5fdG9fdmlydChtZm5feChtZm4pKTsNCj4gK30N
Cj4gKw0KPiArdm9pZCBmcmVlX3hlbl9wYWdldGFibGUodm9pZCAqdikNCj4gK3sNCj4gKyAgICBt
Zm5fdCBtZm4gPSB2ID8gdmlydF90b19tZm4odikgOiBJTlZBTElEX01GTjsNCj4gKw0KPiArICAg
IGZyZWVfeGVuX3BhZ2V0YWJsZV9uZXcobWZuKTsNCj4gK30NCj4gKw0KPiArLyoNCj4gKyAqIEZv
ciB0aGVzZSBQVEUgQVBJcywgdGhlIGNhbGxlciBtdXN0IGZvbGxvdyB0aGUgYWxsb2MtbWFwLXVu
bWFwLQ0KPiBmcmVlDQo+ICsgKiBsaWZlY3ljbGUsIHdoaWNoIG1lYW5zIGV4cGxpY2l0bHkgbWFw
cGluZyB0aGUgUFRFIHBhZ2VzIGJlZm9yZQ0KPiBhY2Nlc3NpbmcNCj4gKyAqIHRoZW0uIFRoZSBj
YWxsZXIgbXVzdCBjaGVjayB3aGV0aGVyIHRoZSBhbGxvY2F0aW9uIGhhcyBzdWNjZWVkZWQsDQo+
IGFuZCBvbmx5DQo+ICsgKiBwYXNzIHZhbGlkIE1GTnMgdG8gbWFwX2RvbWFpbl9wYWdlKCkuDQo+
ICsgKi8NCj4gK21mbl90IGFsbG9jX3hlbl9wYWdldGFibGVfbmV3KHZvaWQpDQo+ICB7DQo+ICAg
ICAgaWYgKCBzeXN0ZW1fc3RhdGUgIT0gU1lTX1NUQVRFX2Vhcmx5X2Jvb3QgKQ0KPiAgICAgIHsN
Cj4gICAgICAgICAgdm9pZCAqcHRyID0gYWxsb2NfeGVuaGVhcF9wYWdlKCk7DQo+ICANCj4gICAg
ICAgICAgQlVHX09OKCFoYXJkd2FyZV9kb21haW4gJiYgIXB0cik7DQo+IC0gICAgICAgIHJldHVy
biBwdHI7DQo+ICsgICAgICAgIHJldHVybiBwdHIgPyB2aXJ0X3RvX21mbihwdHIpIDogSU5WQUxJ
RF9NRk47DQo+ICAgICAgfQ0KPiAgDQo+IC0gICAgcmV0dXJuIG1mbl90b192aXJ0KG1mbl94KGFs
bG9jX2Jvb3RfcGFnZXMoMSwgMSkpKTsNCj4gKyAgICByZXR1cm4gYWxsb2NfYm9vdF9wYWdlcygx
LCAxKTsNCj4gIH0NCj4gIA0KPiAtdm9pZCBmcmVlX3hlbl9wYWdldGFibGUodm9pZCAqdikNCj4g
Ky8qIG1mbiBjYW4gYmUgSU5WQUxJRF9NRk4gKi8NCj4gK3ZvaWQgZnJlZV94ZW5fcGFnZXRhYmxl
X25ldyhtZm5fdCBtZm4pDQo+ICB7DQo+IC0gICAgaWYgKCBzeXN0ZW1fc3RhdGUgIT0gU1lTX1NU
QVRFX2Vhcmx5X2Jvb3QgKQ0KPiAtICAgICAgICBmcmVlX3hlbmhlYXBfcGFnZSh2KTsNCj4gKyAg
ICBpZiAoIHN5c3RlbV9zdGF0ZSAhPSBTWVNfU1RBVEVfZWFybHlfYm9vdCAmJiAhbWZuX2VxKG1m
biwNCj4gSU5WQUxJRF9NRk4pICkNCj4gKyAgICAgICAgZnJlZV94ZW5oZWFwX3BhZ2UobWZuX3Rv
X3ZpcnQobWZuX3gobWZuKSkpOw0KPiAgfQ0KPiAgDQo+ICBzdGF0aWMgREVGSU5FX1NQSU5MT0NL
KG1hcF9wZ2Rpcl9sb2NrKTsNCj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvbW0u
aCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvbW0uaA0KPiBpbmRleCAyY2E4ODgyYWQwLi5hYzgxOTkx
ZTYyIDEwMDY0NA0KPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L21tLmgNCj4gKysrIGIveGVu
L2luY2x1ZGUvYXNtLXg4Ni9tbS5oDQo+IEBAIC01ODIsNiArNTgyLDkgQEAgdm9pZCAqZG9fcGFn
ZV93YWxrKHN0cnVjdCB2Y3B1ICp2LCB1bnNpZ25lZCBsb25nDQo+IGFkZHIpOw0KPiAgLyogQWxs
b2NhdG9yIGZ1bmN0aW9ucyBmb3IgWGVuIHBhZ2V0YWJsZXMuICovDQo+ICB2b2lkICphbGxvY194
ZW5fcGFnZXRhYmxlKHZvaWQpOw0KPiAgdm9pZCBmcmVlX3hlbl9wYWdldGFibGUodm9pZCAqdik7
DQo+ICttZm5fdCBhbGxvY194ZW5fcGFnZXRhYmxlX25ldyh2b2lkKTsNCj4gK3ZvaWQgZnJlZV94
ZW5fcGFnZXRhYmxlX25ldyhtZm5fdCBtZm4pOw0KPiArDQo+ICBsMV9wZ2VudHJ5X3QgKnZpcnRf
dG9feGVuX2wxZSh1bnNpZ25lZCBsb25nIHYpOw0KPiAgDQo+ICBpbnQgX19zeW5jX2xvY2FsX2V4
ZWNzdGF0ZSh2b2lkKTsNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
