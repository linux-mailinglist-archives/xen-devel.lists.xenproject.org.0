Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9AF14A64F
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 15:38:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iw5Sg-0001Pe-1e; Mon, 27 Jan 2020 14:33:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ayIv=3Q=amazon.com=prvs=28866d453=hongyxia@srs-us1.protection.inumbo.net>)
 id 1iw5Sf-0001PZ-9M
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2020 14:33:57 +0000
X-Inumbo-ID: 0bf4be85-4112-11ea-855c-12813bfff9fa
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0bf4be85-4112-11ea-855c-12813bfff9fa;
 Mon, 27 Jan 2020 14:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1580135636; x=1611671636;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Qc13igfsmLDjxh+4ZJTFXZrVT8q9MyMX0srLd7sL7OI=;
 b=FhRIxfYhgzSH3oVudwJiA3SSYh71hfp6Rf7/z+R2AW1rrgNG1QjKbdIL
 ph9rRy59NhF9HtnMywgwRjWiLLeIo4ju7i6y8vr8hiaWZ6bXRxnmSyaNj
 7Y1qpN2ZXjqbZyGA6HrfGauPvm0UJ7RlrtI0FOyhboqjawm+xhzdV8u4X 8=;
IronPort-SDR: 4YVi6xjh9+nlWfy2mUQRPBX1NbdPetnknAPGAfoJPXrL0Uwiv6IoeRIg0i0iCE9BKRqSymY+/P
 L3zdGX1EqDFg==
X-IronPort-AV: E=Sophos;i="5.70,370,1574121600"; d="scan'208";a="14925392"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2b-c7131dcf.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 27 Jan 2020 14:33:55 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-c7131dcf.us-west-2.amazon.com (Postfix) with ESMTPS
 id A08B7A21B6; Mon, 27 Jan 2020 14:33:54 +0000 (UTC)
Received: from EX13D37EUA003.ant.amazon.com (10.43.165.7) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Mon, 27 Jan 2020 14:33:54 +0000
Received: from EX13D37EUA003.ant.amazon.com (10.43.165.7) by
 EX13D37EUA003.ant.amazon.com (10.43.165.7) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 27 Jan 2020 14:33:53 +0000
Received: from EX13D37EUA003.ant.amazon.com ([10.43.165.7]) by
 EX13D37EUA003.ant.amazon.com ([10.43.165.7]) with mapi id 15.00.1367.000;
 Mon, 27 Jan 2020 14:33:53 +0000
From: "Xia, Hongyan" <hongyxia@amazon.com>
To: "jbeulich@suse.com" <jbeulich@suse.com>
Thread-Topic: [PATCH v5 2/7] x86: introduce a new set of APIs to manage Xen
 page tables
Thread-Index: AQHVzGV/yYf4IPF6JUqRqxRRI40d36f+pMwA
Date: Mon, 27 Jan 2020 14:33:53 +0000
Message-ID: <dd3836c12457a92af545651b09acf910c2071bcf.camel@amazon.com>
References: <cover.1578397252.git.hongyxia@amazon.com>
 <5f64321c4cceccd057e3b3e7fadea696793a7966.1578397252.git.hongyxia@amazon.com>
 <baa1a699-179f-b0ae-d857-699f7f63b214@suse.com>
In-Reply-To: <baa1a699-179f-b0ae-d857-699f7f63b214@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.63]
Content-ID: <C1619C2C2B238B40B93F61A3989D5B4D@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v5 2/7] x86: introduce a new set of APIs to
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
 Julien" <jgrall@amazon.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "wl@xen.org" <wl@xen.org>, "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCAyMDIwLTAxLTE2IGF0IDEzOjA0ICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4g
Li4uDQo+IA0KPiA+ICt2b2lkIGZyZWVfeGVuX3BhZ2V0YWJsZSh2b2lkICp2KQ0KPiA+ICt7DQo+
ID4gKyAgICBtZm5fdCBtZm4gPSB2ID8gdmlydF90b19tZm4odikgOiBJTlZBTElEX01GTjsNCj4g
PiArDQo+ID4gKyAgICBpZiAoIHN5c3RlbV9zdGF0ZSAhPSBTWVNfU1RBVEVfZWFybHlfYm9vdCAp
DQo+ID4gKyAgICAgICAgZnJlZV94ZW5fcGFnZXRhYmxlX25ldyhtZm4pOw0KPiANCj4gVGhlIGNv
bmRpdGlvbiBpcyAocGFydGx5KSByZWR1bmRhbnQgd2l0aCB3aGF0DQo+IGZyZWVfeGVuX3BhZ2V0
YWJsZV9uZXcoKSBkb2VzLiBUaGVyZWZvcmUgSSdkIGxpa2UgdG8gYXNrIHRoYXQNCj4gZWl0aGVy
IHRoZSBpZigpIGJlIGRyb3BwZWQgaGVyZSwgb3IgYmUgY29tcGxldGVkIGJ5IGFsc28NCj4gY2hl
Y2tpbmcgdiB0byBiZSBub24tTlVMTCwgYXQgd2hpY2ggcG9pbnQgdGhpcyB3b3VsZCBsaWtlbHkN
Cj4gYmVjb21lIGp1c3QNCj4gDQo+IHZvaWQgZnJlZV94ZW5fcGFnZXRhYmxlKHZvaWQgKnYpDQo+
IHsNCj4gICAgIGlmICggdiAmJiBzeXN0ZW1fc3RhdGUgIT0gU1lTX1NUQVRFX2Vhcmx5X2Jvb3Qg
KQ0KPiAgICAgICAgIGZyZWVfeGVuX3BhZ2V0YWJsZV9uZXcodmlydF90b19tZm4odikpOw0KPiB9
DQoNCllvdSBhcmUgcmlnaHQuIFdpbGwgY2hhbmdlIGluIHRoZSBuZXh0IHJldmlzaW9uLg0KDQo+
ID4gKy8qIHYgY2FuIHBvaW50IHRvIGFuIGVudHJ5IHdpdGhpbiBhIHRhYmxlIG9yIGJlIE5VTEwg
Ki8NCj4gPiArdm9pZCB1bm1hcF94ZW5fcGFnZXRhYmxlKGNvbnN0IHZvaWQgKnYpDQo+IA0KPiBX
aHkgImVudHJ5IiBpbiB0aGUgY29tbWVudD8NCg0KSSB0aGluayB0aGUgY29tbWVudCBvcmlnaW5h
bGx5IG1lYW50IHBvaW50aW5nIHRvIHRoZSBlbnRyeSBpbiBpdHMNCnBhcmVudCB0YWJsZSwgd2hp
Y2ggdGhlbiBtZWFudCBwb2ludGluZyB0byB0aGlzIHRhYmxlLiBJdCdzIGEgYml0DQpjb25mdXNp
bmcuIFdpbGwgcmV3b3JkLg0KDQpSZWZsZWN0aW5nIGJhY2sgdG8geW91ciBjb21tZW50IGluIHYz
IGFib3V0IHdoZXRoZXIgdGhlIG5ldyBYZW4gcGFnZQ0KdGFibGUgbWFwcGluZyBBUElzIChtYXAv
dW5tYXBfeGVuX3BhZ2V0YWJsZSkgYXJlIHJlYWxseSBuZWNlc3NhcnksIEkNCmFncmVlIGluIHRo
ZSBlbmQgdGhleSB3aWxsIGp1c3QgZG8gdGhlIHNhbWUgdGhpbmcgYXMNCm1hcC91bm1hcF9kb21h
aW5fcGFnZSwgYWx0aG91Z2ggb25lIHRoaW5nIGlzIHRoYXQgdGhlIGxhdHRlciBzdWdnZXN0cw0K
aXQgaXMgdHJ5aW5nIHRvIG1hcCBhIGBkb21haW4nIHBhZ2UsIHdob3NlIGRlZmluaXRpb24gcHJv
YmFibHkgZG9lcyBub3QNCmluY2x1ZGUgWGVuIHBhZ2UgdGFibGVzLCBzbyB0aGUgbmFtZSBjb3Vs
ZCBiZSBhIGJpdCBjb25mdXNpbmcgKHdlbGwsIHdlDQpjb3VsZCBhcmd1ZSB0aGF0IFhlbiBwYWdl
IHRhYmxlcyBhcmUganVzdCBpZGxlIGBkb21haW4nIHBhZ2VzIHNvIHRoZQ0KbmFtZSBzdGlsbCBo
b2xkcykuIElmIHdlIGFyZSBoYXBweSB3aXRoIHVzaW5nIG1hcF9kb21haW5fcGFnZSBvbiBYZW4N
ClBURSB0YWJsZXMgdGhlbiBJIGFtIG9rYXkgd2l0aCBkcm9wcGluZyB0aGUgbmV3IG1hcHBpbmcg
QVBJcyBhbmQgb25seQ0KaW5jbHVkZSB0aGUgbmV3IGFsbG9jIEFQSXMuDQoNCkhvbmd5YW4NCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
