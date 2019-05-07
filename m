Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4960D16DE5
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2019 01:41:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hO9eP-00061O-Ao; Tue, 07 May 2019 23:37:33 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GFk4=TH=amazon.com=prvs=023fb95da=elnikety@srs-us1.protection.inumbo.net>)
 id 1hO9eO-00061J-EK
 for xen-devel@lists.xenproject.org; Tue, 07 May 2019 23:37:32 +0000
X-Inumbo-ID: 144a3354-7121-11e9-843c-bc764e045a96
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 144a3354-7121-11e9-843c-bc764e045a96;
 Tue, 07 May 2019 23:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1557272250; x=1588808250;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=To4kYvFNPuz+vMeChy7IGMENBGRx9/jh8WS4OgvD9C4=;
 b=JG2sEuRh5Zrg4HjaLlIzToJgNIJVeCc3jbsBuJXsRRUy9vS/kj8hr2OA
 u664YFAdPVtS1kL7hFwvybJwoUrtUgCaWIiQeapT8dsWsJkjMYn9RvjHf
 rvugDD8rqiVD3AAyglSK9DX1Xb9ITtOhJZp0ri+iwM0csoMxB0UdaKhL6 o=;
X-IronPort-AV: E=Sophos;i="5.60,443,1549929600"; d="scan'208";a="803435884"
Received: from sea3-co-svc-lb6-vlan3.sea.amazon.com (HELO
 email-inbound-relay-2a-6e2fc477.us-west-2.amazon.com) ([10.47.22.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 07 May 2019 23:37:28 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-2a-6e2fc477.us-west-2.amazon.com (8.14.7/8.14.7) with
 ESMTP id x47NbQl2025604
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
 Tue, 7 May 2019 23:37:27 GMT
Received: from EX13D18EUA004.ant.amazon.com (10.43.165.164) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 7 May 2019 23:37:26 +0000
Received: from EX13D03EUA002.ant.amazon.com (10.43.165.166) by
 EX13D18EUA004.ant.amazon.com (10.43.165.164) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 7 May 2019 23:37:25 +0000
Received: from EX13D03EUA002.ant.amazon.com ([10.43.165.166]) by
 EX13D03EUA002.ant.amazon.com ([10.43.165.166]) with mapi id 15.00.1367.000;
 Tue, 7 May 2019 23:37:25 +0000
From: "Elnikety, Eslam" <elnikety@amazon.com>
To: Jan Beulich <JBeulich@suse.com>
Thread-Topic: [PATCH v2] mm: option to _always_ scrub freed domheap pages
Thread-Index: AQHVBMjJBtqGYWqQmEamnl6TYzwOz6ZfknOAgAC/oAA=
Date: Tue, 7 May 2019 23:37:25 +0000
Message-ID: <0953CDF7-E18B-41C7-AD8A-41E18F4465CE@amazon.com>
References: <20190507113405.71851-1-elnikety@amazon.com>
 <5CD175F5020000780022C7EF@prv1-mh.provo.novell.com>
In-Reply-To: <5CD175F5020000780022C7EF@prv1-mh.provo.novell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.116]
Content-ID: <8D28B34F072A2540ADF176FAB97EFC8D@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2] mm: option to _always_ scrub freed
 domheap pages
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>, "Shah, Amit" <aams@amazon.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQo+IE9uIDcuIE1heSAyMDE5LCBhdCAxNDoxMSwgSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2Uu
Y29tPiB3cm90ZToNCj4gDQo+Pj4+IE9uIDA3LjA1LjE5IGF0IDEzOjM0LCA8ZWxuaWtldHlAYW1h
em9uLmNvbT4gd3JvdGU6DQo+PiAtLS0gYS94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYw0KPj4gKysr
IGIveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMNCj4+IEBAIC0yMTQsNiArMjE0LDEwIEBAIGN1c3Rv
bV9wYXJhbSgiYm9vdHNjcnViIiwgcGFyc2VfYm9vdHNjcnViX3BhcmFtKTsNCj4+IHN0YXRpYyB1
bnNpZ25lZCBsb25nIF9faW5pdGRhdGEgb3B0X2Jvb3RzY3J1Yl9jaHVuayA9IE1CKDEyOCk7DQo+
PiBzaXplX3BhcmFtKCJib290c2NydWJfY2h1bmsiLCBvcHRfYm9vdHNjcnViX2NodW5rKTsNCj4+
IA0KPj4gKyAvKiBzY3J1Yi1kb21oZWFwIC0+IERvbWhlYXAgcGFnZXMgYXJlIHNjcnViYmVkIHdo
ZW4gZnJlZWQgKi8NCj4+ICtzdGF0aWMgYm9vbCBfX3JlYWRfbW9zdGx5IG9wdF9zY3J1Yl9kb21o
ZWFwOw0KPj4gK2Jvb2xlYW5fcGFyYW0oInNjcnViLWRvbWhlYXAiLCBvcHRfc2NydWJfZG9taGVh
cCk7DQo+IA0KPiBVcG9uIDJuZCB0aG91Z2h0IHRoaXMsIGJ0dywgd291bGQgc2VlbSB0byBiZSBh
biBleGNlbGxlbnQgY2FuZGlkYXRlDQo+IGZvciBiZWNvbWluZyBhIHJ1bnRpbWUgcGFyYW1ldGVy
Lg0KDQpUcnVlLg0KDQo+IA0KPj4gQEAgLTIzNzgsOSArMjM4MiwxMCBAQCB2b2lkIGZyZWVfZG9t
aGVhcF9wYWdlcyhzdHJ1Y3QgcGFnZV9pbmZvICpwZywgdW5zaWduZWQgaW50IG9yZGVyKQ0KPj4g
ICAgICAgICAgICAgLyoNCj4+ICAgICAgICAgICAgICAqIE5vcm1hbGx5IHdlIGV4cGVjdCBhIGRv
bWFpbiB0byBjbGVhciBwYWdlcyBiZWZvcmUgZnJlZWluZyB0aGVtLA0KPj4gICAgICAgICAgICAg
ICogaWYgaXQgY2FyZXMgYWJvdXQgdGhlIHNlY3JlY3kgb2YgdGhlaXIgY29udGVudHMuIEhvd2V2
ZXIsIGFmdGVyDQo+PiAtICAgICAgICAgICAgICogYSBkb21haW4gaGFzIGRpZWQgd2UgYXNzdW1l
IHJlc3BvbnNpYmlsaXR5IGZvciBlcmFzdXJlLg0KPj4gKyAgICAgICAgICAgICAqIGEgZG9tYWlu
IGhhcyBkaWVkIHdlIGFzc3VtZSByZXNwb25zaWJpbGl0eSBmb3IgZXJhc3VyZS4gV2UgZG8NCj4+
ICsgICAgICAgICAgICAgKiBzY3J1YiByZWdhcmRsZXNzIGlmIG9wdGlvbiBzY3J1Yl9kb21oZWFw
IGlzIHNldC4NCj4+ICAgICAgICAgICAgICAqLw0KPj4gLSAgICAgICAgICAgIHNjcnViID0gZC0+
aXNfZHlpbmcgfHwgc2NydWJfZGVidWc7DQo+PiArICAgICAgICAgICAgc2NydWIgPSBkLT5pc19k
eWluZyB8fCBzY3J1Yl9kZWJ1ZyB8fCBvcHRfc2NydWJfZG9taGVhcDsNCj4gDQo+IERpZCB5b3Ug
Y29uc2lkZXIgc2V0dGluZyBvcHRfc2NydWJfZG9taGVhcCB3aGVuIHNjcnViX2RlYnVnIGlzDQo+
IHNldD8gVGhpcyB3b3VsZCBzaG9ydGVuIHRoZSAocnVudGltZSkgY2FsY3VsYXRpb24gaGVyZSBi
eSBhIHRpbnkgYml0LA0KPiBhdCB0aGUgcHJpY2Ugb2YgZG9pbmcgb25lIG1vcmUgdGhpbmcgb25j
ZSB3aGlsZSBib290aW5nLg0KDQpJbnRlcmVzdGluZy4gSSBoYXZlIG5vdCBwYXJ0aWN1bGFybHkg
dGhvdWdodCBhYm91dCB0aGF0LiBHcmFudGVkOyB0aGlzIHdvdWxkIHNob3J0ZW4gdGhlIOKAnHNj
cnVi4oCdIGJvb2wgY2FsY3VsYXRpb24uIE9uZSB3b3VsZCBwcm9iYWJseSBkZWZpbmUgYSBib29s
IOKAmGFsd2F5c19zY3J1YuKAmSB0aGF0IGdldHMgc2V0IGF0IGJvb3Qg4oCYYWx3YXlzX3NjcnVi
ID0gc2NydWJfZGVidWcgfHwgb3B0X3NjcnViX2RvbWhlYXDigJksIGFuZCB1c2UgdGhhdCBuZXcg
Ym9vbCBpbiB0aGUgaHVuayBhdCBoYW5kIGhlcmUuIChIYXZpbmcgb3B0X3NjcnViX2RvbWhlYXAg
YXMgYSBydW50aW1lIHBhcmFtZXRlciBhbmQgcmUtZXZhbHVhdGluZyBhbHdheXNfc2NydWIgc2hv
dWxkIG5vdCBiZSBtdWNoIG9mIGEgY29tcGxpY2F0aW9uIGVpdGhlcikuIA0KDQpJbiBhbnkgY2Fz
ZSwgZ2l2ZW4geW91ciByZXNwb25zZSB0byBHZW9yZ2UgZWFybGllciwgSSB3b3VsZCByYXRoZXIg
ZGVjb3VwbGUgdGhlc2UgaW1wcm92ZW1lbnRzIGZyb20gdGhpcyBwYXRjaC4gSSB3b3VsZCBiZSBo
YXBweSB0byByZS13b3JrIHRoZXNlIGltcHJvdmVtZW50cyBhdCBhIGxhdGVyIHBvaW50IGlmIHRo
ZSBjb21tdW5pdHkgZmVlbHMgc3Ryb25nbHkgYWJvdXQgdGhlbS4NCg0KPiANCj4gSmFuDQo+IA0K
PiANCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
