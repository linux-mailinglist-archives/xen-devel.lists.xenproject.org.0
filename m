Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7221504F3
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 12:14:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyZdP-0001GP-4t; Mon, 03 Feb 2020 11:11:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=x5Gu=3X=amazon.com=prvs=2958b187c=hongyxia@srs-us1.protection.inumbo.net>)
 id 1iyZdN-0001GK-FL
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 11:11:17 +0000
X-Inumbo-ID: e580aad8-4675-11ea-8396-bc764e2007e4
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e580aad8-4675-11ea-8396-bc764e2007e4;
 Mon, 03 Feb 2020 11:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1580728277; x=1612264277;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=KjJk64AiaP5bKTlPETM8viPnEU9SD7Rv3k0RZQre1qI=;
 b=MBRka5n898lGbL87bWASPt1TGI5pvqZd3AdhbQC6htWqc/m0K1H5xZoG
 7o0RfFmT4W8ylx3Ph+CF6qzH+OVieBKZStiy1SVbcXAvJUqFrHlsUKzs+
 N5xuo3RiLCVWe3r71vVtWD2IT+VAZinI72JvJs/XzgBV/nKeOeieAqry9 o=;
IronPort-SDR: kHErxlVcpWL3Divqt0p8EezxSvHXXbS9q72yOA31YWRiKcVZW6cfejMhE2QfNbEiA1eIbczWus
 92gU702SzRuA==
X-IronPort-AV: E=Sophos;i="5.70,397,1574121600"; d="scan'208";a="14253663"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-2c665b5d.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 03 Feb 2020 11:11:04 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-2c665b5d.us-east-1.amazon.com (Postfix) with ESMTPS
 id 8A8D0A2386; Mon,  3 Feb 2020 11:10:59 +0000 (UTC)
Received: from EX13D22EUA002.ant.amazon.com (10.43.165.125) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Mon, 3 Feb 2020 11:10:58 +0000
Received: from EX13D37EUA003.ant.amazon.com (10.43.165.7) by
 EX13D22EUA002.ant.amazon.com (10.43.165.125) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 3 Feb 2020 11:10:57 +0000
Received: from EX13D37EUA003.ant.amazon.com ([10.43.165.7]) by
 EX13D37EUA003.ant.amazon.com ([10.43.165.7]) with mapi id 15.00.1367.000;
 Mon, 3 Feb 2020 11:10:57 +0000
From: "Xia, Hongyan" <hongyxia@amazon.com>
To: "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 6/8] x86/setup: move vm_init() before end_boot_allocator()
Thread-Index: AQHV2JdQ5BD9A/yE70O+VyGRiMY3/KgJVAiA
Date: Mon, 3 Feb 2020 11:10:57 +0000
Message-ID: <0e53f505856481691536d542222a86f08f9eacda.camel@amazon.com>
References: <8a95f787ca93b23ee8d8c0b55fcc63d22a75c5f3.camel@infradead.org>
 <20200201003303.2363081-6-dwmw2@infradead.org>
In-Reply-To: <20200201003303.2363081-6-dwmw2@infradead.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.173]
Content-ID: <64D750A2116C0A47B006BD08F939DBB7@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH 6/8] x86/setup: move vm_init() before
 end_boot_allocator()
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
 "julien@xen.org" <julien@xen.org>, "wl@xen.org" <wl@xen.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "Gautam,
 Varad" <vrd@amazon.de>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>, "Durrant,
 Paul" <pdurrant@amazon.co.uk>, "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gU2F0LCAyMDIwLTAyLTAxIGF0IDAwOjMzICswMDAwLCBEYXZpZCBXb29kaG91c2Ugd3JvdGU6
DQo+IEZyb206IERhdmlkIFdvb2Rob3VzZSA8ZHdtd0BhbWF6b24uY28udWs+DQo+IA0KPiBXZSB3
b3VsZCBsaWtlIHRvIGJlIGFibGUgdG8gdXNlIHZtYXAoKSB0byBtYXAgdGhlIGxpdmUgdXBkYXRl
IGRhdGEsDQo+IGFuZA0KPiB3ZSBuZWVkIHRvIGRvIGEgZmlyc3QgcGFzcyBvZiB0aGUgbGl2ZSB1
cGRhdGUgZGF0YSBiZWZvcmUgd2UgcHJpbWUNCj4gdGhlDQo+IGhlYXAgYmVjYXVzZSB3ZSBuZWVk
IHRvIGtub3cgd2hpY2ggcGFnZXMgbmVlZCB0byBiZSBwcmVzZXJ2ZWQuDQo+IA0KPiBUaGUgd2Fy
bmluZyBhYm91dCBBQ1BJIGNvZGUgY2FuIGJlIGRyb3BwZWQsIHNpbmNlIHRoYXQgcHJvYmxlbSBu
bw0KPiBsb25nZXINCj4gZXhpc3RzIHdoZW4gdGhpbmdzIGFyZSBkb25lIGluIHRoaXMgb3JkZXIu
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBEYXZpZCBXb29kaG91c2UgPGR3bXdAYW1hem9uLmNvLnVr
Pg0KPiAtLS0NCj4gIHhlbi9hcmNoL3g4Ni9zZXR1cC5jIHwgOCArKy0tLS0tLQ0KPiAgMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS94ZW4vYXJjaC94ODYvc2V0dXAuYyBiL3hlbi9hcmNoL3g4Ni9zZXR1cC5jDQo+IGluZGV4
IDI2NzdmMTI3YjkuLjVmNjhhMTMwOGYgMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9zZXR1
cC5jDQo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9zZXR1cC5jDQo+IEBAIC0xNDg5LDYgKzE0ODksOCBA
QCB2b2lkIF9faW5pdCBub3JldHVybiBfX3N0YXJ0X3hlbih1bnNpZ25lZCBsb25nDQo+IG1iaV9w
KQ0KPiAgDQo+ICAgICAgbnVtYV9pbml0bWVtX2luaXQoMCwgcmF3X21heF9wYWdlKTsNCj4gIA0K
PiArICAgIHZtX2luaXQoKTsNCj4gKw0KPiAgICAgIGlmICggbWF4X3BhZ2UgLSAxID4gdmlydF90
b19tZm4oSFlQRVJWSVNPUl9WSVJUX0VORCAtIDEpICkNCj4gICAgICB7DQo+ICAgICAgICAgIHVu
c2lnbmVkIGxvbmcgbGltaXQgPSB2aXJ0X3RvX21mbihIWVBFUlZJU09SX1ZJUlRfRU5EIC0gMSk7
DQo+IEBAIC0xNTE5LDEyICsxNTIxLDYgQEAgdm9pZCBfX2luaXQgbm9yZXR1cm4gX19zdGFydF94
ZW4odW5zaWduZWQgbG9uZw0KPiBtYmlfcCkNCj4gICAgICAgICAgZW5kX2Jvb3RfYWxsb2NhdG9y
KCk7DQo+ICANCj4gICAgICBzeXN0ZW1fc3RhdGUgPSBTWVNfU1RBVEVfYm9vdDsNCj4gLSAgICAv
Kg0KPiAtICAgICAqIE5vIGNhbGxzIGludm9sdmluZyBBQ1BJIGNvZGUgc2hvdWxkIGdvIGJldHdl
ZW4gdGhlIHNldHRpbmcgb2YNCj4gLSAgICAgKiBTWVNfU1RBVEVfYm9vdCBhbmQgdm1faW5pdCgp
IChvciBlbHNlDQo+IGFjcGlfb3Nfeyx1bn1tYXBfbWVtb3J5KCkNCj4gLSAgICAgKiB3aWxsIGJy
ZWFrKS4NCj4gLSAgICAgKi8NCj4gLSAgICB2bV9pbml0KCk7DQo+ICANCj4gICAgICBjb25zb2xl
X2luaXRfcmluZygpOw0KPiAgICAgIHZlc2FfaW5pdCgpOw0KDQpJcyB0aGVyZSBhbnkgcHJvYmxl
bSB0byBtb3ZlIHZtX2luaXQoKSBldmVuIGVhcmxpZXIgdGhhbiB0aGlzLCBsaWtlDQpyaWdodCBh
ZnRlciBpbml0X2ZyYW1ldGFibGUoKT8gQUNQSSBhbmQgTlVNQSBmdW5jdGlvbnMgbmVlZCBhIGNv
dXBsZSBvZg0KdGhpbmdzIHBlcm1hbmVudGx5IG1hcHBlZC4gV2l0aG91dCB0aGUgZGlyZWN0bWFw
IChkaXJlY3RtYXAgcmVtb3ZhbA0Kc2VyaWVzKSwgeGVuaGVhcCBhbmQgdm1hcCBhdCB0aGlzIHN0
YWdlLCBJIGNhbiBvbmx5IG1hcCBtZW1vcnkgdG8gdGhlDQpkaXJlY3RtYXAgcmVnaW9uIHdoaWNo
IGlzIHJlYWxseSBoYWNreS4gSSB3b3VsZCBsaWtlIHRvIHVzZSB2bWFwIGF0DQp0aGlzIHN0YWdl
IHNvIGhvcGVmdWxseSB2bWFwIGNhbiBiZSByZWFkeSB2ZXJ5IGVhcmx5Lg0KDQpIb25neWFuDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
