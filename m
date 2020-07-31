Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3784323471F
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 15:46:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1VLs-0007kw-Q3; Fri, 31 Jul 2020 13:45:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HXbV=BK=amazon.co.uk=prvs=4749be70b=pdurrant@srs-us1.protection.inumbo.net>)
 id 1k1VLr-0007kr-08
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 13:45:35 +0000
X-Inumbo-ID: 1afcdd58-d334-11ea-8e3e-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1afcdd58-d334-11ea-8e3e-bc764e2007e4;
 Fri, 31 Jul 2020 13:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1596203134; x=1627739134;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version:subject;
 bh=ylkOaOK1WziisXgbBwS6H+PCGrgwG/8nlRD9DYjT1gI=;
 b=XmLEU614TXDcOQ87IwytWFVdqW5FjcGOKF6MYVfw/rtPACE46Y2IABEq
 2KiQaXIHetujD3UtRqtVST+Rz2Wps6BFcGHJlP0Icz6gcuDQaFu53+2bq
 PvlsNC9XqNo/A0UXZnzFVRg85oz6rnknFj7MpgyLnTsquWrumoXILH+DN 0=;
IronPort-SDR: 9Ihn7M7IBeyb4VNqhxnMNN3fwT7fMKIT/uLnH5qbkT1wv3QtyeEmdyujo5kyHkTojiYHT4WCOV
 t54+L4rFiqJw==
X-IronPort-AV: E=Sophos;i="5.75,418,1589241600"; d="scan'208";a="63299551"
Subject: RE: [PATCH v2 2/2] x86/hvm: simplify 'mmio_direct' check in
 epte_get_entry_emt()
Thread-Topic: [PATCH v2 2/2] x86/hvm: simplify 'mmio_direct' check in
 epte_get_entry_emt()
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-22cc717f.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 31 Jul 2020 13:45:20 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2a-22cc717f.us-west-2.amazon.com (Postfix) with ESMTPS
 id CDD1AA069E; Fri, 31 Jul 2020 13:45:19 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 31 Jul 2020 13:45:19 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 31 Jul 2020 13:45:18 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Fri, 31 Jul 2020 13:45:18 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>, "paul@xen.org" <paul@xen.org>
Thread-Index: AQHWZzfNu61as9hCEUu/A6GqtDYgc6khpgSAgAACwACAAAkqAP///z7A
Date: Fri, 31 Jul 2020 13:45:18 +0000
Message-ID: <9f38fdfdd6f2498d90c094c43de09a8e@EX13D32EUC003.ant.amazon.com>
References: <20200731123926.28970-1-paul@xen.org>
 <20200731123926.28970-3-paul@xen.org>
 <a4856c33-8bb0-4afa-cc71-3af4c229bc27@suse.com>
 <004501d6673b$9adffbf0$d09ff3d0$@xen.org>
 <84cdd5b8-5149-a240-8bad-be8d67dca0d8@suse.com>
In-Reply-To: <84cdd5b8-5149-a240-8bad-be8d67dca0d8@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.90]
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>,
 'Wei Liu' <wl@xen.org>, 'Andrew Cooper' <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDMxIEp1bHkgMjAyMCAxNDo0MQ0KPiBUbzogcGF1bEB4ZW4u
b3JnDQo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IER1cnJhbnQsIFBhdWwg
PHBkdXJyYW50QGFtYXpvbi5jby51az47ICdBbmRyZXcgQ29vcGVyJw0KPiA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT47ICdXZWkgTGl1JyA8d2xAeGVuLm9yZz47ICdSb2dlciBQYXUgTW9ubsOp
JyA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+IFN1YmplY3Q6IFJFOiBbRVhURVJOQUxdIFtQQVRD
SCB2MiAyLzJdIHg4Ni9odm06IHNpbXBsaWZ5ICdtbWlvX2RpcmVjdCcgY2hlY2sgaW4gZXB0ZV9n
ZXRfZW50cnlfZW10KCkNCj4gDQo+IENBVVRJT046IFRoaXMgZW1haWwgb3JpZ2luYXRlZCBmcm9t
IG91dHNpZGUgb2YgdGhlIG9yZ2FuaXphdGlvbi4gRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4N
Cj4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBjYW4gY29uZmlybSB0aGUgc2VuZGVyIGFuZCBrbm93
IHRoZSBjb250ZW50IGlzIHNhZmUuDQo+IA0KPiANCj4gDQo+IE9uIDMxLjA3LjIwMjAgMTU6MDcs
IFBhdWwgRHVycmFudCB3cm90ZToNCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4g
Pj4gRnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiA+PiBTZW50OiAzMSBK
dWx5IDIwMjAgMTM6NTgNCj4gPj4gVG86IFBhdWwgRHVycmFudCA8cGF1bEB4ZW4ub3JnPg0KPiA+
PiBDYzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBQYXVsIER1cnJhbnQgPHBkdXJy
YW50QGFtYXpvbi5jb20+OyBBbmRyZXcgQ29vcGVyDQo+ID4+IDxhbmRyZXcuY29vcGVyM0BjaXRy
aXguY29tPjsgV2VpIExpdSA8d2xAeGVuLm9yZz47IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPg0KPiA+PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDIvMl0geDg2L2h2bTog
c2ltcGxpZnkgJ21taW9fZGlyZWN0JyBjaGVjayBpbiBlcHRlX2dldF9lbnRyeV9lbXQoKQ0KPiA+
Pg0KPiA+PiBPbiAzMS4wNy4yMDIwIDE0OjM5LCBQYXVsIER1cnJhbnQgd3JvdGU6DQo+ID4+PiBG
cm9tOiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+DQo+ID4+Pg0KPiA+Pj4gUmUt
ZmFjdG9yIHRoZSBjb2RlIHRvIHRha2UgYWR2YW50YWdlIG9mIHRoZSBmYWN0IHRoYXQgdGhlIEFQ
SUMgYWNjZXNzIHBhZ2UgaXMNCj4gPj4+IGEgJ3NwZWNpYWwnIHBhZ2UuDQo+ID4+DQo+ID4+IEht
bSwgdGhhdCdzIGdvaW5nIHF1aXRlIGFzIGZhciBhcyBJIHdhcyB0aGlua2luZyB0byBnbzogSW4N
Cj4gPj4gcGFydGljdWxhciwgeW91IGxlYXZlIGluIHBsYWNlIHRoZSBzZXRfbW1pb19wMm1fZW50
cnkoKSB1c2UNCj4gPj4gaW4gdm14X2FsbG9jX3ZsYXBpY19tYXBwaW5nKCkuIFdpdGggdGhhdCBy
ZXBsYWNlZCwgdGhlDQo+ID4+IHJlLW9yZGVyaW5nIGluIGVwdGVfZ2V0X2VudHJ5X2VtdCgpIHRo
YXQgeW91IGRvIHNob3VsZG4ndA0KPiA+PiBiZSBuZWNlc3Nhcnk7IHlvdSdkIHNpbXBsZSBkcm9w
IHRoZSBjaGVja2luZyBvZiB0aGUNCj4gPj4gc3BlY2lmaWMgTUZOLg0KPiA+DQo+ID4gT2ssIGl0
IHN0aWxsIG5lZWRzIHRvIGdvIGluIHRoZSBwMm0gdGhvdWdoIHNvIGFyZSB5b3Ugc3VnZ2VzdGlu
Zw0KPiA+IGp1c3QgY2FsbGluZyBwMm1fc2V0X2VudHJ5KCkgZGlyZWN0bHk/DQo+IA0KPiBZZXMs
IGlmIHRoaXMgd29ya3MuIFRoZSBtYWluIHF1ZXN0aW9uIHJlYWxseSBpcyB3aGV0aGVyIHRoZXJl
IGFyZQ0KPiBhbnkgaGlkZGVuIGFzc3VtcHRpb25zIGVsc2V3aGVyZSB0aGF0IHRoaXMgcGFnZSBn
ZXRzIG1hcHBlZCBhcyBhbg0KPiBNTUlPIG9uZS4NCj4gDQo+ID4+PiAtLS0gYS94ZW4vYXJjaC94
ODYvaHZtL210cnIuYw0KPiA+Pj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9tdHJyLmMNCj4gPj4+
IEBAIC04MTQsMjkgKzgxNCwyMiBAQCBpbnQgZXB0ZV9nZXRfZW50cnlfZW10KHN0cnVjdCBkb21h
aW4gKmQsIHVuc2lnbmVkIGxvbmcgZ2ZuLCBtZm5fdCBtZm4sDQo+ID4+PiAgICAgICAgICByZXR1
cm4gLTE7DQo+ID4+PiAgICAgIH0NCj4gPj4+DQo+ID4+PiAtICAgIGlmICggZGlyZWN0X21taW8g
KQ0KPiA+Pj4gLSAgICB7DQo+ID4+PiAtICAgICAgICBpZiAoIChtZm5feChtZm4pIF4gbWZuX3go
ZC0+YXJjaC5odm0udm14LmFwaWNfYWNjZXNzX21mbikpID4+IG9yZGVyICkNCj4gPj4+IC0gICAg
ICAgICAgICByZXR1cm4gTVRSUl9UWVBFX1VOQ0FDSEFCTEU7DQo+ID4+PiAtICAgICAgICBpZiAo
IG9yZGVyICkNCj4gPj4+IC0gICAgICAgICAgICByZXR1cm4gLTE7DQo+ID4+DQo+ID4+IC4uLiB0
aGlzIHBhcnQgb2YgdGhlIGxvZ2ljIHdhbnRzIHJldGFpbmluZywgSSB0aGluaywgaS5lLg0KPiA+
PiByZXBvcnRpbmcgYmFjayB0byB0aGUgZ3Vlc3QgdGhhdCB0aGUgbWFwcGluZyBuZWVkcyBzcGxp
dHRpbmcuDQo+ID4+IEknbSBhZnJhaWQgSSBoYXZlIHRvIHdpdGhkcmF3IG15IFItYiBvbiBwYXRj
aCAxIGZvciB0aGlzDQo+ID4+IHJlYXNvbiwgYXMgdGhlIGNoZWNrIG5lZWRzIHRvIGJlIGFkZGVk
IHRoZXJlIGFscmVhZHkuDQo+ID4NCj4gPiBUbyBiZSBjbGVhci4uLiBZb3UgbWVhbiBJIG5lZWQg
dGhlOg0KPiA+DQo+ID4gaWYgKCBvcmRlciApDQo+ID4gICByZXR1cm4gLTE7DQo+ID4NCj4gPiB0
aGVyZT8NCj4gDQo+IE5vdCBqdXN0IC0gZmlyc3Qgb2YgYWxsIHlvdSBuZWVkIHRvIGNoZWNrIHdo
ZXRoZXIgdGhlIHJlcXVlc3RlZA0KPiByYW5nZSBvdmVybGFwcyBhIHNwZWNpYWwgcGFnZS4NCg0K
T2suIEknbGwgYWRkIHRoYXQuDQoNCiAgUGF1bA0KDQoNCj4gDQo+IEphbg0K

