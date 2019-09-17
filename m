Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 152F6B49F4
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 10:57:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iA9Gj-0005uu-5c; Tue, 17 Sep 2019 08:55:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=os7l=XM=amazon.de=prvs=156cae3ca=wipawel@srs-us1.protection.inumbo.net>)
 id 1iA9Gh-0005up-J4
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 08:55:27 +0000
X-Inumbo-ID: e4a4b7f4-d928-11e9-b299-bc764e2007e4
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e4a4b7f4-d928-11e9-b299-bc764e2007e4;
 Tue, 17 Sep 2019 08:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1568710526; x=1600246526;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:mime-version: content-transfer-encoding;
 bh=qFEl7HgHmjYhUL1jyKHSI6U+iGJDfE3IU2csCZulNvQ=;
 b=qpPwFLiNl4c6Neg1AvwOPjVOA5BXHUq+FoKe1UZmN7fcmDsj3G6AHLx0
 FWexw7L706ZTzL7cceqL2lm1UnIaKzXtBmcIXWTFyxefMAa376e12hBqR
 3JfSnIKROS2dIh9ycOXFu3Y1Wf9i9fuBspwc8hARqL9XKCxMSZoS8ikE4 s=;
X-IronPort-AV: E=Sophos;i="5.64,515,1559520000"; d="scan'208";a="785324729"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-c5104f52.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 17 Sep 2019 08:55:24 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2a-c5104f52.us-west-2.amazon.com (Postfix) with ESMTPS
 id CEB4AA1E89; Tue, 17 Sep 2019 08:55:23 +0000 (UTC)
Received: from EX13D05EUB003.ant.amazon.com (10.43.166.253) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 17 Sep 2019 08:55:23 +0000
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13D05EUB003.ant.amazon.com (10.43.166.253) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 17 Sep 2019 08:55:22 +0000
Received: from EX13D05EUB004.ant.amazon.com ([10.43.166.115]) by
 EX13D05EUB004.ant.amazon.com ([10.43.166.115]) with mapi id 15.00.1367.000;
 Tue, 17 Sep 2019 08:55:22 +0000
From: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH v3 10/12] livepatch: Handle arbitrary size
 names with the list operation
Thread-Index: AQHVbH5t2E3epIAMpU+MF4amoCEai6cvil0AgAADvACAAAI3AIAAAfiA
Date: Tue, 17 Sep 2019 08:55:22 +0000
Message-ID: <7DDFDD63-4BD3-4B18-835D-2915778E4096@amazon.com>
References: <20190916105945.93632-1-wipawel@amazon.de>
 <20190916105945.93632-11-wipawel@amazon.de>
 <fb181faf-76e2-57c9-ac1e-7f56a195f9ef@suse.com>
 <26B651C9-2FA3-491A-A383-E4A4FFB3650D@amazon.com>
 <031390a8-2dbc-c384-6752-4e5050dc5114@suse.com>
In-Reply-To: <031390a8-2dbc-c384-6752-4e5050dc5114@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.11]
Content-ID: <7D18A1EFA3B1EE4BA23CBF7EEC2B71D6@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v3 10/12] livepatch: Handle arbitrary size
 names with the list operation
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 KonradRzeszutek Wilk <konrad.wilk@oracle.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, "Pohlack,
 Martin" <mpohlack@amazon.de>, "Wieczorkiewicz, Pawel" <wipawel@amazon.de>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gMTcuIFNlcCAyMDE5LCBhdCAxMDo0OCwgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPiB3cm90ZToNCj4gDQo+IE9uIDE3LjA5LjIwMTkgMTA6NDAsICBXaWVjem9ya2lld2lj
eiwgUGF3ZWwgIHdyb3RlOg0KPj4gDQo+PiANCj4+IE9uIDE3LiBTZXAgMjAxOSwgYXQgMTA6Mjcs
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbTxtYWlsdG86amJldWxpY2hAc3VzZS5jb20+
PiB3cm90ZToNCj4+IA0KPj4gT24gMTYuMDkuMjAxOSAxMjo1OSwgUGF3ZWwgV2llY3pvcmtpZXdp
Y3ogd3JvdGU6DQo+PiBAQCAtOTUxLDExICs5NTIsMTMgQEAgc3RydWN0IHhlbl9zeXNjdGxfbGl2
ZXBhdGNoX2xpc3Qgew0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGFtb3VudCBvZiBwYXlsb2FkcyBhbmQgdmVyc2lvbi4NCj4+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBPVVQ6IEhvdyBtYW55IHBheWxvYWRzIGxl
ZnQuICovDQo+PiAgICB1aW50MzJfdCBwYWQ7ICAgICAgICAgICAgICAgICAgICAgICAgICAgLyog
SU46IE11c3QgYmUgemVyby4gKi8NCj4+ICsgICAgdWludDY0X3QgbmFtZV90b3RhbF9zaXplOyAg
ICAgICAgICAgICAgIC8qIE9VVDogVG90YWwgc2l6ZSBvZiBhbGwgdHJhbnNmZXIgbmFtZXMgKi8N
Cj4+IA0KPj4gV2h5IHVpbnQ2NF90IGFuZCBub3QgdWludDMyX3Q/IFlvdSBkb24ndCBleHBlY3Qg
dGhpcyB0byBncm93DQo+PiBiZXlvbmQgNEdpQiwgZG8geW91Pw0KPj4gDQo+PiBJIGRvbuKAmXQs
IGJ1dCB1aW50MzJfdCBpcyBub3QgcmVhbGx5IGNvbXBhdGlibGUgd2l0aCBzaXplX3QuDQo+PiBB
bmQgSSB3YXMgdGhvdWdodCB0byBhbHdheXMgdXNlIHNpemVfdCBjb21wYXRpYmxlIHR5cGVzIGZv
ciBzaXplcy4NCj4gDQo+IFRoYXQncyBhIGZhaXIgcG9pbnQsIGJ1dCBJIHRoaW5rIHdlIHVzZSAz
Mi1iaXQgc2l6ZXMgZWxzZXdoZXJlDQo+IGFzIHdlbGwsIHdoZW4gY3Jvc3NpbmcgdGhlIDRHaUIg
Ym91bmRhcnkgd291bGQgc2VlbSBlbnRpcmVseQ0KPiB1bmV4cGVjdGVkLg0KPiANCj4gQnV0IHdo
YXQncyB3b3JzZSBoZXJlIC0geW91IHNob3VsZG4ndCB1c2UgcGxhaW4gdWludDY0X3QgaW4NCj4g
c3lzY3RsLmggKGFuZCBkb21jdGwuaCkgYW55d2F5LiBJZiBhbnl0aGluZywgeW91IG91Z2h0IHRv
IHVzZQ0KPiB1aW50NjRfYWxpZ25lZF90LiAoR29pbmcgdGhyb3VnaCB0aGUgZmlsZSBJIG5vdGlj
ZSBhIGZldyBvdGhlcg0KPiBiYWQgaW5zdGFuY2VzIGhhdmUgY3JlcHQgaW4uKQ0KPiANCg0KSSBz
ZWUuIE5vdGVkLCB0aGFua3MgZm9yIGxldHRpbmcgbWUga25vdy4NCg0KPj4gQW55d2F5LCBJIGRv
IG5vdCBtaW5kIGNoYW5naW5nIHRoaXMgdG8gd2hhdGV2ZXIgdHlwZSB5b3UgcHJlZmVyLg0KPiAN
Cj4gV2VsbCwgcHJlZmVyZW5jZSAtIGlmIGFueW9uZSdzIC0gd291bGQgYmUgdGhlIGxpdmVwYXRj
aCBtYWludGFpbmVycycNCj4gb25lIGhlcmUuDQo+IA0KDQpXYWl0aW5nIGZvciB0aGUgbWFpbnRh
aW5lcnMnIHdpc2UganVkZ21lbnQgdGhlbiA6LSkuDQoNCj4gQWxzbyAtIGNhbiB5b3UgcGxlYXNl
IHNlZSBhYm91dCBhZGp1c3RpbmcgeW91ciByZXBseSBzdHlsZT8gSW4gcGxhaW4NCj4gdGV4dCBt
b2RlIGl0J3MgaW1wb3NzaWJsZSB0byB0ZWxsIGNvbnRleHQgZnJvbSB5b3VyIHJlc3BvbnNlcy4N
Cg0KT2gsIHNvcnJ5IGFib3V0IHRoYXQuIEkgdHdlYWtlZCBteSBzZXR0aW5ncy4NClBsZWFzZSBs
ZXQgbWUga25vdyBpZiBpdCBkb2VzIG5vdCBnZXQgYmV0dGVyLg0KDQo+IA0KPiBKYW4NCg0KQmVz
dCBSZWdhcmRzLA0KUGF3ZWwgV2llY3pvcmtpZXdpY3oNCg0KDQoNCgoKCkFtYXpvbiBEZXZlbG9w
bWVudCBDZW50ZXIgR2VybWFueSBHbWJICktyYXVzZW5zdHIuIDM4CjEwMTE3IEJlcmxpbgpHZXNj
aGFlZnRzZnVlaHJ1bmc6IENocmlzdGlhbiBTY2hsYWVnZXIsIFJhbGYgSGVyYnJpY2gKRWluZ2V0
cmFnZW4gYW0gQW10c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcgdW50ZXIgSFJCIDE0OTE3MyBCClNp
dHo6IEJlcmxpbgpVc3QtSUQ6IERFIDI4OSAyMzcgODc5CgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
