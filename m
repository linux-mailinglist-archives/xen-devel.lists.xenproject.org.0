Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2B5146D4B
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 16:49:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuegt-0001xQ-MQ; Thu, 23 Jan 2020 15:46:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wqmU=3M=amazon.co.uk=prvs=2848fc5af=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iuegr-0001xI-UE
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 15:46:42 +0000
X-Inumbo-ID: 877a698c-3df7-11ea-9fd7-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 877a698c-3df7-11ea-9fd7-bc764e2007e4;
 Thu, 23 Jan 2020 15:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1579794394; x=1611330394;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lXxKPYZi1uRIs/y9Usr5oAUMBVl7dRwQQfLoWqOg4hU=;
 b=UZUxrZGHgYuyxs1DKd79f/OQfLfsEenNAhmwxXzRl6or9GxEzPSzGLhs
 j2uDOtN4Ze+8wyp6uL4BQeGI/QwyPI/xtypHduHC0Nf3YCCtkpeoCz54M
 nw/i0FuIvTzQOdqABdMw7ttx0mLmNWAhGdflZN5O2ND36FdKUFewv0qYC Y=;
IronPort-SDR: W3rib3xYJuYmVMflksrBJbVAbAkw4uLmuuzO2fpygKgI0WVg9Q7jMuApIrVZwaeoJu17CjLWd3
 nRS4kJxd9ueA==
X-IronPort-AV: E=Sophos;i="5.70,354,1574121600"; d="scan'208";a="21982284"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-e7be2041.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 23 Jan 2020 15:46:22 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-e7be2041.us-west-2.amazon.com (Postfix) with ESMTPS
 id 2D8F6A2465; Thu, 23 Jan 2020 15:46:21 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Thu, 23 Jan 2020 15:46:21 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 23 Jan 2020 15:46:20 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Thu, 23 Jan 2020 15:46:19 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v3 3/3] x86 / vmx: use a 'normal' domheap page for
 APIC_DEFAULT_PHYS_BASE
Thread-Index: AQHV0fXetmGz8ndNHkq9FYXzH0041Kf4XvkAgAAFJ2A=
Date: Thu, 23 Jan 2020 15:46:19 +0000
Message-ID: <fd1de668d8f54e55a0cf7d85b1c0b5ba@EX13D32EUC003.ant.amazon.com>
References: <20200123140305.21050-1-pdurrant@amazon.com>
 <20200123140305.21050-4-pdurrant@amazon.com>
 <d3b28297-0a5e-2a9b-9c2f-4348e98ce757@xen.org>
In-Reply-To: <d3b28297-0a5e-2a9b-9c2f-4348e98ce757@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.87]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v3 3/3] x86 / vmx: use a 'normal' domheap
 page for APIC_DEFAULT_PHYS_BASE
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKdWxpZW4gR3JhbGwgPGp1bGll
bkB4ZW4ub3JnPg0KPiBTZW50OiAyMyBKYW51YXJ5IDIwMjAgMTU6MjYNCj4gVG86IER1cnJhbnQs
IFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jby51az47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZw0KPiBDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPjsgQW5kcmV3IENvb3Bl
cg0KPiA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBS
b2dlciBQYXUgTW9ubsOpDQo+IDxyb2dlci5wYXVAY2l0cml4LmNvbT47IEdlb3JnZSBEdW5sYXAg
PEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbT47IElhbg0KPiBKYWNrc29uIDxpYW4uamFja3Nv
bkBldS5jaXRyaXguY29tPjsgS29ucmFkIFJ6ZXN6dXRlayBXaWxrDQo+IDxrb25yYWQud2lsa0Bv
cmFjbGUuY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsg
SnVuDQo+IE5ha2FqaW1hIDxqdW4ubmFrYWppbWFAaW50ZWwuY29tPjsgS2V2aW4gVGlhbiA8a2V2
aW4udGlhbkBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMy8zXSB4ODYgLyB2
bXg6IHVzZSBhICdub3JtYWwnIGRvbWhlYXAgcGFnZSBmb3INCj4gQVBJQ19ERUZBVUxUX1BIWVNf
QkFTRQ0KPiANCj4gDQo+IA0KPiBPbiAyMy8wMS8yMDIwIDE0OjAzLCBQYXVsIER1cnJhbnQgd3Jv
dGU6DQo+ID4gZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vZG9tYWluLmMgYi94ZW4vY29tbW9uL2Rv
bWFpbi5jDQo+ID4gaW5kZXggZWUzZjlmZmQzZS4uMzBjNzc3YWNiOCAxMDA2NDQNCj4gPiAtLS0g
YS94ZW4vY29tbW9uL2RvbWFpbi5jDQo+ID4gKysrIGIveGVuL2NvbW1vbi9kb21haW4uYw0KPiA+
IEBAIC0zMzksNiArMzM5LDggQEAgc3RhdGljIGludCBzYW5pdGlzZV9kb21haW5fY29uZmlnKHN0
cnVjdA0KPiB4ZW5fZG9tY3RsX2NyZWF0ZWRvbWFpbiAqY29uZmlnKQ0KPiA+ICAgICAgIHJldHVy
biBhcmNoX3Nhbml0aXNlX2RvbWFpbl9jb25maWcoY29uZmlnKTsNCj4gPiAgIH0NCj4gPg0KPiA+
ICsjZGVmaW5lIERPTUFJTl9JTklUX1BBR0VTIDENCj4gDQo+IFdvdWxkIGl0IG1ha2Ugc2Vuc2Ug
dG8gbWFrZSB0aGlzIGEgcGVyLWFyY2ggZGVmaW5lPyBUaGlzIHdvdWxkIGFsbG93DQo+IGVhY2gg
YXJjaCB0byBkZWZpbmUgYSBkaWZmZXJlbnQgbnVtYmVyIG9mIGluaXQgcGFnZXMgKGFuZCBjYXRj
aCBhbnkNCj4gbWlzdXNlKS4NCj4NCg0KSSB0aG91Z2h0IGFib3V0IHRoYXQgYW5kIGRlY2lkZWQg
YWdhaW5zdCBpdC4gVGhlIGFyY2ggY29kZSBtYXkgd2FudCB0byBpbmNyZWFzZSAod2hpY2ggbWF5
IGJlIGEgYmFkIGlkZWEpIGJ1dCBJIHRoaW5rIGl0IHNob3VsZCBiZSBzZXQgZWFybHkuIFVsdGlt
YXRlbHkgaXQgc2hvdWxkIGNvbWUgaW4gZnJvbSB0aGUgdG9vbHN0YWNrIHZpYSB0aGUgZG9tY3Rs
IGFueXdheS4NCg0KICBQYXVsDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
