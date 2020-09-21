Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC96272468
	for <lists+xen-devel@lfdr.de>; Mon, 21 Sep 2020 14:55:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKLLn-0006sf-Ap; Mon, 21 Sep 2020 12:55:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BjqN=C6=amazon.co.uk=prvs=5269d94c5=pdurrant@srs-us1.protection.inumbo.net>)
 id 1kKLLm-0006sa-5A
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2020 12:55:22 +0000
X-Inumbo-ID: 41e8f447-7772-456e-82cf-bd7619c2d7cf
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 41e8f447-7772-456e-82cf-bd7619c2d7cf;
 Mon, 21 Sep 2020 12:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1600692922; x=1632228922;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version:subject;
 bh=UFOI9U8MbnBaeCAZ9mJ6x8lNxM6zzcohs6oI9xKuIgg=;
 b=hjtC14L9cYvsTUGz5vFSVD5uIHYbNtzR0FRDu9Jc02wngjSNrBXkK3oH
 uR4jhUeJ0gLxtARVPgE7OCpWYTcK7c2Vp4G0/YrpBgikkn5L4pSOZ+dnt
 Wy24wXpezT6Fi0lQmvjqWUdX6uaIShictleJ/o7lFbn5UhA8RiDKMO1L2 0=;
X-IronPort-AV: E=Sophos;i="5.77,286,1596499200"; d="scan'208";a="77934087"
Subject: RE: Memory ordering question in the shutdown deferral code
Thread-Topic: Memory ordering question in the shutdown deferral code
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2b-81e76b79.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 21 Sep 2020 12:55:20 +0000
Received: from EX13D37EUB003.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2b-81e76b79.us-west-2.amazon.com (Postfix) with ESMTPS
 id 6450CA1D3A; Mon, 21 Sep 2020 12:55:18 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D37EUB003.ant.amazon.com (10.43.166.251) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 21 Sep 2020 12:55:17 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Mon, 21 Sep 2020 12:55:16 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, "andrew.cooper3@citrix.com"
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>
CC: "Xia, Hongyan" <hongyxia@amazon.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Index: AQHWkAvNKxPhF20UiUS+iInofanuW6ly9+2AgAAST0A=
Date: Mon, 21 Sep 2020 12:55:16 +0000
Message-ID: <92a6373003e142e9943a4057024a2616@EX13D32EUC003.ant.amazon.com>
References: <468576ba-8d3f-98e9-e65e-1128b5220d40@xen.org>
 <a75efed4-d435-1746-85ab-a87b328c1101@xen.org>
In-Reply-To: <a75efed4-d435-1746-85ab-a87b328c1101@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.209]
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKdWxpZW4gR3JhbGwgPGp1bGll
bkB4ZW4ub3JnPg0KPiBTZW50OiAyMSBTZXB0ZW1iZXIgMjAyMCAxMjo0MQ0KPiBUbzogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGlu
aUBrZXJuZWwub3JnPjsNCj4gYW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbTsgR2VvcmdlIER1bmxh
cCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPjsgRHVycmFudCwgUGF1bA0KPiA8cGR1cnJhbnRA
YW1hem9uLmNvLnVrPg0KPiBDYzogWGlhLCBIb25neWFuIDxob25neXhpYUBhbWF6b24uY29tPjsg
eGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJFOiBbRVhURVJOQUxd
IE1lbW9yeSBvcmRlcmluZyBxdWVzdGlvbiBpbiB0aGUgc2h1dGRvd24gZGVmZXJyYWwgY29kZQ0K
PiANCj4gQ0FVVElPTjogVGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0c2lkZSBvZiB0aGUg
b3JnYW5pemF0aW9uLiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Blbg0KPiBhdHRhY2htZW50cyB1
bmxlc3MgeW91IGNhbiBjb25maXJtIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMg
c2FmZS4NCj4gDQo+IA0KPiANCj4gKCsgWGVuLWRldmVsKQ0KPiANCj4gU29ycnkgSSBmb3Jnb3Qg
dG8gQ0MgeGVuLWRldmVsLg0KPiANCj4gT24gMjEvMDkvMjAyMCAxMjozOCwgSnVsaWVuIEdyYWxs
IHdyb3RlOg0KPiA+IEhpIGFsbCwNCj4gPg0KPiA+IEkgaGF2ZSBzdGFydGVkIHRvIGxvb2sgYXQg
dGhlIGRlZmVycmFsIGNvZGUgKHNlZQ0KPiA+IHZjcHVfc3RhcnRfc2h1dGRvd25fZGVmZXJyYWwo
KSkgYmVjYXVzZSB3ZSBuZWVkIGl0IGZvciBMaXZlVXBkYXRlIGFuZA0KPiA+IEFybSB3aWxsIHNv
b24gdXNlIGl0Lg0KPiA+DQo+ID4gVGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gaXMgdXNpbmcg
YW4gc21wX21iKCkgdG8gZW5zdXJlIG9yZGVyaW5nDQo+ID4gYmV0d2VlbiBhIHdyaXRlIHRoZW4g
YSByZWFkLiBUaGUgY29kZSBsb29rcyByb3VnaGx5IChJIGhhdmUgc2xpZ2h0bHkNCj4gPiBhZGFw
dGVkIGl0IHRvIG1ha2UgbXkgcXVlc3Rpb24gbW9yZSBvYnZpb3VzKToNCj4gPg0KPiA+IGRvbWFp
bl9zaHV0ZG93bigpDQo+ID4gICAgICBkLT5pc19zaHV0dGluZ19kb3duID0gMTsNCj4gPiAgICAg
IHNtcF9tYigpOw0KPiA+ICAgICAgaWYgKCAhdmNwdTAtPmRlZmVyX3NodXRkb3duICkNCj4gPiAg
ICAgIHsNCj4gPiAgICAgICAgdmNwdV9wYXVzZV9ub3N5bmModik7DQo+ID4gICAgICAgIHYtPnBh
dXNlZF9mb3Jfc2h1dGRvd24gPSAxOw0KPiA+ICAgICAgfQ0KPiA+DQo+ID4gdmNwdV9zdGFydF9z
aHV0ZG93bl9kZWZlcnJhbCgpDQo+ID4gICAgICB2Y3B1MC0+ZGVmZXJfc2h1dGRvd24gPSAxOw0K
PiA+ICAgICAgc21wX21iKCk7DQo+ID4gICAgICBpZiAoIHVubGlrZWx5KGQtPmlzX3NodXR0aW5n
X2Rvd24pICkNCj4gPiAgICAgICAgdmNwdV9jaGVja19zaHV0ZG93bih2KTsNCj4gPg0KPiA+ICAg
ICAgcmV0dXJuIHZjcHUwLT5kZWZlcl9zaHV0ZG93bjsNCj4gPg0KPiA+IHNtcF9tYigpIHNob3Vs
ZCBvbmx5IGd1YXJhbnRlZSBvcmRlcmluZyAodGhpcyBtYXkgYmUgc3Ryb25nZXIgb24gc29tZQ0K
PiA+IGFyY2gpLCBzbyBJIHRoaW5rIHRoZXJlIGlzIGEgcmFjZSBiZXR3ZWVuIHRoZSB0d28gZnVu
Y3Rpb25zLg0KPiA+DQo+ID4gSXQgd291bGQgYmUgcG9zc2libGUgdG8gcGF1c2UgdGhlIHZDUFUg
aW4gZG9tYWluX3NodXRkb3duKCkgYmVjYXVzZQ0KPiA+IHZjcHUwLT5kZWZlcl9zaHV0ZG93biB3
YXNuJ3QgeWV0IHNlZW4uDQo+ID4NCj4gPiBFcXVhbGx5LCB2Y3B1X3N0YXJ0X3NodXRkb3duX2Rl
ZmVycmFsKCkgbWF5IG5vdCBzZWUgZC0+aXNfc2h1dHRpbmdfZG93bg0KPiA+IGFuZCB0aGVyZWZv
cmUgWGVuIG1heSBjb250aW51ZSB0byBzZW5kIHRoZSBJL08uIFlldCB0aGUgdkNQVSB3aWxsIGJl
DQo+ID4gcGF1c2VkIHNvIHRoZSBJL08gd2lsbCBuZXZlciBjb21wbGV0ZS4NCj4gPg0KDQpUaGUg
YmFycmllciBlbmZvcmNlcyBnbG9iYWwgb3JkZXIsIHJpZ2h0PyBTbywgaWYgZG9tYWluX3NodXRk
b3duKCkgcGF1c2VzIHRoZSB2Y3B1IHRoZW4gaXNfc2h1dHRpbmdfZG93biBtdXN0IG5lY2Vzc2Fy
aWx5IGJlIHZpc2libGUgYWxsIGNwdXMuIFRodXMgdmNwdV9zdGFydF9zaHV0ZG93biByZWZlcnJh
bCB3aWxsIGV4ZWN1dGUgdmNwdV9jaGVja19zaHV0ZG93bigpLCBzbyBJJ20gaGF2aW5nIGEgaGFy
ZCB0aW1lIHNlZWluZyB0aGUgcmFjZS4NCg0KPiA+IEkgYW0gbm90IGZ1bGx5IGZhbWlsaWFyIHdp
dGggdGhlIElPUkVRIGNvZGUsIGJ1dCBpdCBzb3VuZHMgdG8gbWUgdGhpcyBpcw0KPiA+IG5vdCB0
aGUgYmVoYXZpb3IgdGhhdCB3YXMgaW50ZW5kZWQuIENhbiBzb21lb25lIG1vcmUgZmFtaWxpYXIg
d2l0aCB0aGUNCj4gPiBjb2RlIGNvbmZpcm0gaXQ/DQo+ID4NCg0KTm8gaW5kZWVkLiBJIHRoaW5r
IGVtdWxhdGlvbiBzaG91bGQgY29tcGxldGUgYmVmb3JlIHRoZSB2Y3B1IHBhdXNlcy4NCg0KICBQ
YXVsDQoNCj4gPiBDaGVlcnMsDQo+ID4NCj4gDQo+IC0tDQo+IEp1bGllbiBHcmFsbA0K

