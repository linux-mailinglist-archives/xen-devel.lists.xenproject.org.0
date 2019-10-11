Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EA9D3CEC
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2019 12:01:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIrcH-0005RJ-JR; Fri, 11 Oct 2019 09:53:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4a8z=YE=amazon.com=prvs=18096f68d=hongyax@srs-us1.protection.inumbo.net>)
 id 1iIrcG-0005R9-5L
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2019 09:53:44 +0000
X-Inumbo-ID: 024ee832-ec0d-11e9-a531-bc764e2007e4
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 024ee832-ec0d-11e9-a531-bc764e2007e4;
 Fri, 11 Oct 2019 09:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1570787623; x=1602323623;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=29Fvevfs4f1+4hX+XDCPYFYVtejCz0RRLRVGdUvXemU=;
 b=elDqEAYyxwgHC7FpKsqKkW2Qohd7RkoqMjqYT+NFovt/66krlTU288Xk
 OVGVPq29eqFVACQHg48XW0g/KEgCTMGtZ4qzyw9nSgsOuWpAwO5mcbatu
 dTpKZXtlcCsB0llfj4mVFDk//hLghwbdLa9Csr45gtFjmN3vJJ8HJZX03 U=;
X-IronPort-AV: E=Sophos;i="5.67,283,1566864000"; d="scan'208";a="421774635"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-62350142.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 11 Oct 2019 09:53:38 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-62350142.us-east-1.amazon.com (Postfix) with ESMTPS
 id B7B22A24E3; Fri, 11 Oct 2019 09:53:37 +0000 (UTC)
Received: from EX13D28EUB003.ant.amazon.com (10.43.166.124) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 11 Oct 2019 09:53:37 +0000
Received: from EX13D28EUB003.ant.amazon.com (10.43.166.124) by
 EX13D28EUB003.ant.amazon.com (10.43.166.124) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 11 Oct 2019 09:53:35 +0000
Received: from EX13D28EUB003.ant.amazon.com ([10.43.166.124]) by
 EX13D28EUB003.ant.amazon.com ([10.43.166.124]) with mapi id 15.00.1367.000;
 Fri, 11 Oct 2019 09:53:35 +0000
From: "Xia, Hongyan" <hongyax@amazon.com>
To: "julien.grall@arm.com" <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [[PATCH for-4.13]] xen/arm: mm: Allow generic xen
 page-tables helpers to be called early
Thread-Index: AQHVbXGtVtzaOawZ+kKh9XlzSl08aKdVWJuA
Date: Fri, 11 Oct 2019 09:53:35 +0000
Message-ID: <0acfc39467986475acddea19da96b55f2468b8fe.camel@amazon.com>
References: <20190917160202.16770-1-julien.grall@arm.com>
In-Reply-To: <20190917160202.16770-1-julien.grall@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.39]
Content-ID: <D994BC878C4E304082ACCC37D4CD74ED@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [[PATCH for-4.13]] xen/arm: mm: Allow generic xen
 page-tables helpers to be called early
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Tm90IGNvbW1lbnRpbmcgb24gdGhlIHBhdGNoLCBidXQgSSBoYWQgZXhhY3RseSB0aGUgc2FtZSBw
cm9ibGVtIHdoZW4NCnJlbW92aW5nIHRoZSBkaXJlY3QgbWFwIGluIHg4Ni4gbWFwX2RvbWFpbl9w
YWdlIGhhcyB0byBiZSB1c2FibGUNCndpdGhvdXQgdGhlIGRpcmVjdCBtYXAgYW5kIGV2ZW4gYmVm
b3JlIGFsbG9jX2Jvb3RfcGFnZXMgY2FuIGJlIHVzZWQgKHNvDQp0aGF0IEkgY2FuIG1hcCB0aGUg
Ym9vdG1lbV9yZWdpb25zX2xpc3QsIGFsdGhvdWdoIEkgaGF2ZSBtYWRlIGl0DQpzdGF0aWNhbGx5
IGFsbG9jYXRlZCBub3cpLg0KDQpUaGUgZGlyZWN0IG1hcCB0ZWFyZG93biBzZXJpZXMgaW4gdGhl
IGVuZCBpbnRyb2R1Y2VzIGEgcGVyc2lzdGVudA0KbWFwcGluZyBpbmZyYXN0cnVjdHVyZSB0byBt
YXAgcGFnZSB0YWJsZXMgd2hpY2ggb2NjdXBpZXMgYSBmZXcgZml4bWFwDQplbnRyaWVzLCBhbmQg
YXZvaWQgc2V0X2ZpeG1hcCBidXQgaW5zdGVhZCBtb2RpZnkgdGhlIGVudHJpZXMgZGlyZWN0bHkN
CnRvIGF2b2lkIGludm9jYXRpb24gbG9vcHMuIFRoZSByZXN1bHQgaXMgdGhhdCBtYXBfeGVuX3Bh
Z2V0YWJsZSBhbmQNCm1hcF9kb21haW5fcGFnZSBpcyB1c2FibGUgZnJvbSB0aGUgdmVyeSBiZWdp
bm5pbmcgb2Ygc3RhcnRfeGVuLg0KDQpIb25neWFuDQoNCk9uIFR1ZSwgMjAxOS0wOS0xNyBhdCAx
NzowMiArMDEwMCwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPiBUaGUgY3VycmVudCBpbXBsZW1lbnRh
dGlvbnMgb2YgeGVuX3ttYXAsIHVubWFwfV90YWJsZSgpIGV4cGVjdA0KPiB7bWFwLCB1bm1hcH1f
ZG9tYWluX3BhZ2UoKSB0byBiZSB1c2FibGUuIFRob3NlIGhlbHBlcnMgYXJlIHVzZWQgdG8NCj4g
bWFwL3VubWFwIHBhZ2UgdGFibGVzIHdoaWxlIHVwZGF0ZSBYZW4gcGFnZS10YWJsZXMuDQo+IA0K
PiBTaW5jZSBjb21taXQgMDIyMzg3ZWUxYSAieGVuL2FybTogbW06IERvbid0IG9wZW4tY29kZSBY
ZW4gUFQgdXBkYXRlDQo+IGluDQo+IHtzZXQsIGNsZWFyfV9maXhtYXAoKSIsIHNldHVwX2ZpeG1h
cCgpIHdpbGwgbWFrZSB1c2Ugb2YgdGhlIGhlbHBlcnMNCj4gbWVudGlvbmVkIGFib3ZlLiBXaGVu
IGJvb3RpbmcgWGVuIHVzaW5nIEdSVUIsIHNldHVwX2ZpeG1hcCgpIG1heSBiZQ0KPiB1c2VkDQo+
IGJlZm9yZSBtYXBfZG9tYWluX3BhZ2UoKSBjYW4gYmUgY2FsbGVkLiBUaGlzIHdpbGwgcmVzdWx0
IHRvIGRhdGENCj4gYWJvcnQ6DQo+IA0KPiAoWEVOKSBEYXRhIEFib3J0IFRyYXAuIFN5bmRyb21l
PTB4NQ0KPiAoWEVOKSBDUFUwOiBVbmV4cGVjdGVkIFRyYXA6IERhdGEgQWJvcnQNCj4gDQo+IFsu
Li5dDQo+IA0KPiAoWEVOKSBYZW4gY2FsbCB0cmFjZToNCj4gKFhFTikgICAgWzwwMDAwMDAwMDAw
MjVhYjZjPl0gbW0uYyN4ZW5fcHRfdXBkYXRlKzB4MmI0LzB4NTljIChQQykNCj4gKFhFTikgICAg
WzwwMDAwMDAwMDAwMjVhYjIwPl0gbW0uYyN4ZW5fcHRfdXBkYXRlKzB4MjY4LzB4NTljIChMUikN
Cj4gKFhFTikgICAgWzwwMDAwMDAwMDAwMjVhZTcwPl0gc2V0X2ZpeG1hcCsweDFjLzB4MmMNCj4g
KFhFTikgICAgWzwwMDAwMDAwMDAwMmE5Yzk4Pl0gY29weV9mcm9tX3BhZGRyKzB4N2MvMHhkYw0K
PiAoWEVOKSAgICBbPDAwMDAwMDAwMDAyYTRhZTA+XSBoYXNfeHNtX21hZ2ljKzB4MTgvMHgzNA0K
PiAoWEVOKSAgICBbPDAwMDAwMDAwMDAyYTViNWM+XSBib290ZmR0LmMjZWFybHlfc2Nhbl9ub2Rl
KzB4Mzk4LzB4NTYwDQo+IChYRU4pICAgIFs8MDAwMDAwMDAwMDJhNWRlMD5dIGRldmljZV90cmVl
X2Zvcl9lYWNoX25vZGUrMHhiYy8weDE0NA0KPiAoWEVOKSAgICBbPDAwMDAwMDAwMDAyYTVlZDQ+
XSBib290X2ZkdF9pbmZvKzB4NmMvMHgyNjANCj4gKFhFTikgICAgWzwwMDAwMDAwMDAwMmFjMGQw
Pl0gc3RhcnRfeGVuKzB4MTA4LzB4Yzc0DQo+IChYRU4pICAgIFs8MDAwMDAwMDAwMDIwMDQ0Yz5d
IGFybTY0L2hlYWQubyNwYWdpbmcrMHg2MC8weDg4DQo+IA0KPiBEdXJpbmcgZWFybHkgYm9vdCwg
dGhlIHBhZ2UgdGFibGVzIGFyZSBlaXRoZXIgc3RhdGljYWxseSBhbGxvY2F0ZWQgaW4NCj4gWGVu
IGJpbmFyeSBvciBhbGxvY2F0ZWQgdmlhIGFsbG9jX2Jvb3RfcGFnZXMoKS4NCj4gDQo+IEZvciBz
dGF0aWNhbGx5IGFsbG9jYXRlZCBwYWdlLXRhYmxlcywgdGhleSB3aWxsIGFscmVhZHkgYmUgbWFw
cGVkIGFzDQo+IHBhcnQgb2YgWGVuIGJpbmFyeS4gU28gd2UgY2FuIGVhc2lseSBmaW5kIHRoZSB2
aXJ0dWFsIGFkZHJlc3MuDQo+IA0KPiBGb3IgZHluYW1pY2FsbHkgYWxsb2NhdGVkIHBhZ2UtdGFi
bGVzLCB3ZSBuZWVkIHRvIHJlbHkNCj4gbWFwX2RvbWFpbl9wYWdlKCkgdG8gYmUgZnVuY3Rpb25h
bGx5IHdvcmtpbmcuDQo+IA0KPiBGb3IgYXJtMzIsIHRoZSBjYWxsIHdpbGwgYmUgdXNhYmxlIG11
Y2ggYmVmb3JlIHBhZ2UgY2FuIGJlDQo+IGR5bmFtaWNhbGx5DQo+IGFsbG9jYXRlZCAoc2VlIHNl
dHVwX3BhZ2V0YWJsZXMoKSkuIEZvciBhcm02NCwgdGhlIGNhbGwgd2lsbCBiZQ0KPiB1c2FibGUN
Cj4gYWZ0ZXIgc2V0dXBfeGVuaGVhcF9tYXBwaW5ncygpLg0KPiANCj4gSW4gYm90aCBjYXNlcywg
bWVtb3J5IGFyZSBnaXZlbiB0byB0aGUgYm9vdCBhbGxvY2F0b3IgYWZ0ZXJ3YXJkcy4gU28NCj4g
d2UNCj4gY2FuIHJlbHkgb24gbWFwX2RvbWFpbl9wYWdlKCkgZm9yIG1hcHBpbmcgcGFnZSB0YWJs
ZXMgYWxsb2NhdGVkDQo+IGR5bmFtaWNhbGx5Lg0KPiANCj4gVGhlIGhlbHBlcnMgeGVuX3ttYXAs
IHVubWFwfV90YWJsZSgpIGFyZSBub3cgdXBkYXRlZCB0byB0YWtlIGludG8NCj4gYWNjb3VudCB0
aGUgY2FzZSB3aGVyZSBwYWdlLXRhYmxlcyBhcmUgcGFydCBvZiBYZW4gYmluYXJ5Lg0KPiANCj4g
Rml4ZXM6IDAyMjM4N2VlMWEgKCd4ZW4vYXJtOiBtbTogRG9uJ3Qgb3Blbi1jb2RlIFhlbiBQVCB1
cGRhdGUgaW4NCj4ge3NldCwgY2xlYXJ9X2ZpeG1hcCgpJykNCj4gU2lnbmVkLW9mZi1ieTogSnVs
aWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4NCj4gLS0tDQo+ICB4ZW4vYXJjaC9hcm0v
bW0uYyB8IDIwICsrKysrKysrKysrKysrKysrKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgMjAgaW5z
ZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9tbS5jIGIveGVuL2Fy
Y2gvYXJtL21tLmMNCj4gaW5kZXggZTFjZGVhYWYyZi4uZGE2MzAzYThmZCAxMDA2NDQNCj4gLS0t
IGEveGVuL2FyY2gvYXJtL21tLmMNCj4gKysrIGIveGVuL2FyY2gvYXJtL21tLmMNCj4gQEAgLTk1
MCwxMSArOTUwLDMxIEBAIHN0YXRpYyBpbnQgY3JlYXRlX3hlbl90YWJsZShscGFlX3QgKmVudHJ5
KQ0KPiAgDQo+ICBzdGF0aWMgbHBhZV90ICp4ZW5fbWFwX3RhYmxlKG1mbl90IG1mbikNCj4gIHsN
Cj4gKyAgICAvKg0KPiArICAgICAqIFdlIG1heSByZXF1aXJlIHRvIG1hcCB0aGUgcGFnZSB0YWJs
ZSBiZWZvcmUgbWFwX2RvbWFpbl9wYWdlKCkNCj4gaXMNCj4gKyAgICAgKiB1c2VhYmxlLiBUaGUg
cmVxdWlyZW1lbnRzIGhlcmUgaXMgaXQgbXVzdCBiZSB1c2VhYmxlIGFzIHNvb24NCj4gYXMNCj4g
KyAgICAgKiBwYWdlLXRhYmxlcyBhcmUgYWxsb2NhdGVkIGR5bmFtaWNhbGx5IHZpYSBhbGxvY19i
b290X3BhZ2VzKCkuDQo+ICsgICAgICovDQo+ICsgICAgaWYgKCBzeXN0ZW1fc3RhdGUgPT0gU1lT
X1NUQVRFX2Vhcmx5X2Jvb3QgKQ0KPiArICAgIHsNCj4gKyAgICAgICAgdmFkZHJfdCB2YSA9IG1m
bl90b19tYWRkcihtZm4pIC0gcGh5c19vZmZzZXQ7DQo+ICsNCj4gKyAgICAgICAgaWYgKCBpc19r
ZXJuZWwodmEpICkNCj4gKyAgICAgICAgICAgIHJldHVybiAobHBhZV90ICopdmE7DQo+ICsgICAg
fQ0KPiArDQo+ICAgICAgcmV0dXJuIG1hcF9kb21haW5fcGFnZShtZm4pOw0KPiAgfQ0KPiAgDQo+
ICBzdGF0aWMgdm9pZCB4ZW5fdW5tYXBfdGFibGUoY29uc3QgbHBhZV90ICp0YWJsZSkNCj4gIHsN
Cj4gKyAgICAvKg0KPiArICAgICAqIER1cmluZyBlYXJseSBib290LCB4ZW5fbWFwX3RhYmxlKCkg
d2lsbCBub3QgdXNlDQo+IG1hcF9kb21haW5fcGFnZSgpDQo+ICsgICAgICogZm9yIHBhZ2UtdGFi
bGVzIHJlc2lkaW5nIGluIFhlbiBiaW5hcnkuIFNvIHNraXAgdGhlIHVubWFwDQo+IHBhcnQuDQo+
ICsgICAgICovDQo+ICsgICAgaWYgKCBzeXN0ZW1fc3RhdGUgPT0gU1lTX1NUQVRFX2Vhcmx5X2Jv
b3QgJiYgaXNfa2VybmVsKHRhYmxlKSApDQo+ICsgICAgICAgIHJldHVybjsNCj4gKw0KPiAgICAg
IHVubWFwX2RvbWFpbl9wYWdlKHRhYmxlKTsNCj4gIH0NCj4gIA0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
