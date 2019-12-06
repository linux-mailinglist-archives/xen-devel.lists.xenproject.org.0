Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBE81154C5
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2019 17:01:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1idFzp-0007yK-8e; Fri, 06 Dec 2019 15:58:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JJ0v=Z4=amazon.com=prvs=23679664e=hongyxia@srs-us1.protection.inumbo.net>)
 id 1idFzn-0007yD-VT
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2019 15:58:19 +0000
X-Inumbo-ID: 387e8164-1841-11ea-a914-bc764e2007e4
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 387e8164-1841-11ea-a914-bc764e2007e4;
 Fri, 06 Dec 2019 15:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575647899; x=1607183899;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=hcljKnsJX1NXjuP8ACzQMpXbvDfVpR+5Ous0AQuw4Wk=;
 b=H5YwcUBXDHkLRAWNnWYD5lZh13Qt8Q6abhubZdc+rCeLys10knbEIuvy
 u8Ezptvl65fq1WFhWQ3J2YkuGzvuMp0YeuJbBxYLceIdEIN4UiYIjtfHQ
 2tM/JmDqhsQzJPiQ1efN3AULf/uvcZLJ8IEGjTblc2wkbBEOgsMDoi/R7 A=;
IronPort-SDR: 2+ERGwhE9m+qWEgpIJO5r9RcIv3wQ2PzNE6I5iBGvilnE7bWMYVwLD0KpDWO4uTBTnT9ZhLVf/
 6KpSFQXwJaeQ==
X-IronPort-AV: E=Sophos;i="5.69,285,1571702400"; 
   d="scan'208";a="3637234"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-74cf8b49.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 06 Dec 2019 15:58:07 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-74cf8b49.us-east-1.amazon.com (Postfix) with ESMTPS
 id 7265BC0776; Fri,  6 Dec 2019 15:58:05 +0000 (UTC)
Received: from EX13D37EUA004.ant.amazon.com (10.43.165.124) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 6 Dec 2019 15:58:04 +0000
Received: from EX13D37EUA003.ant.amazon.com (10.43.165.7) by
 EX13D37EUA004.ant.amazon.com (10.43.165.124) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 6 Dec 2019 15:58:04 +0000
Received: from EX13D37EUA003.ant.amazon.com ([10.43.165.7]) by
 EX13D37EUA003.ant.amazon.com ([10.43.165.7]) with mapi id 15.00.1367.000;
 Fri, 6 Dec 2019 15:58:04 +0000
From: "Xia, Hongyan" <hongyxia@amazon.com>
To: "jbeulich@suse.com" <jbeulich@suse.com>
Thread-Topic: [PATCH v4 6/9] x86/mm: add an end_of_loop label in
 map_pages_to_xen
Thread-Index: AQHVq1zfDAPZfD8vJUa92KD9bthZyKetRSeA
Date: Fri, 6 Dec 2019 15:58:04 +0000
Message-ID: <dbe6753aa00b5253d0904b10cf3afb203c4133ba.camel@amazon.com>
References: <cover.1575477921.git.hongyxia@amazon.com>
 <3885863bfc54a5f5f05cddb3cd9afe24897f27b3.1575477921.git.hongyxia@amazon.com>
 <f13c0e4808e320a0233f82b9be005fe5b2679469.camel@amazon.com>
 <cb2c4422-f425-721b-2b66-48fe7ba300ce@suse.com>
 <fff722182ec8405486b4e29d4519c140@EX13D32EUC003.ant.amazon.com>
 <e09cf45c-1326-91b6-7602-5f0391dd22eb@suse.com>
In-Reply-To: <e09cf45c-1326-91b6-7602-5f0391dd22eb@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.128]
Content-ID: <204D64894799224184CC7C6C3D63CD1B@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v4 6/9] x86/mm: add an end_of_loop label in
 map_pages_to_xen
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "wl@xen.org" <wl@xen.org>, "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhhbmtzIGZvciB0aGUgc3VnZ2VzdGlvbnMuIEkgd2lsbCBhdHRlbXB0IHRvIHJlc3RydWN0dXJl
IHRoZSBjb2RlLg0KDQpIb25neWFuDQoNCk9uIFRodSwgMjAxOS0xMi0wNSBhdCAxMjoxMiArMDEw
MCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDA1LjEyLjIwMTkgMTI6MDIsIER1cnJhbnQsIFBh
dWwgd3JvdGU6DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTog
WGVuLWRldmVsIDx4ZW4tZGV2ZWwtYm91bmNlc0BsaXN0cy54ZW5wcm9qZWN0Lm9yZz4gT24NCj4g
PiA+IEJlaGFsZiBPZiBKYW4NCj4gPiA+IEJldWxpY2gNCj4gPiA+IFNlbnQ6IDA1IERlY2VtYmVy
IDIwMTkgMTA6MjYNCj4gPiA+IFRvOiBYaWEsIEhvbmd5YW4gPGhvbmd5eGlhQGFtYXpvbi5jb20+
DQo+ID4gPiBDYzogYW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbTsgeGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnOyANCj4gPiA+IHdsQHhlbi5vcmc7DQo+ID4gPiByb2dlci5wYXVAY2l0cml4
LmNvbQ0KPiA+ID4gU3ViamVjdDogUmU6IFtYZW4tZGV2ZWxdIFtQQVRDSCB2NCA2LzldIHg4Ni9t
bTogYWRkIGFuDQo+ID4gPiBlbmRfb2ZfbG9vcCBsYWJlbA0KPiA+ID4gaW4gbWFwX3BhZ2VzX3Rv
X3hlbg0KPiA+ID4gDQo+ID4gPiBPbiAwNS4xMi4yMDE5IDExOjIxLCBYaWEsIEhvbmd5YW4gd3Jv
dGU6DQo+ID4gPiA+ID4gT24gMDIuMTAuMjAxOSAxOToxNiwgSG9uZ3lhbiBYaWEgd3JvdGU6DQo+
ID4gPiA+ID4gPiBXZSB3aWxsIHNvb24gbmVlZCB0byBjbGVhbiB1cCBtYXBwaW5ncyB3aGVuZXZl
ciB0aGUgb3V0DQo+ID4gPiA+ID4gPiBtb3N0IGxvb3AgaXMNCj4gPiA+ID4gPiA+IGVuZGVkLiBB
ZGQgYSBuZXcgbGFiZWwgYW5kIHR1cm4gcmVsZXZhbnQgY29udGludWUncyBpbnRvDQo+ID4gPiA+
ID4gPiBnb3RvJ3MuDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gSSB0aGluayBhbHJlYWR5IHdoZW4g
dGhpcyBzdGlsbCB3YXMgUkZDIEkgZGlkIGluZGljYXRlIHRoYXQNCj4gPiA+ID4gPiBJJ20gbm90
DQo+ID4gPiA+ID4gaGFwcHkgYWJvdXQgdGhlIGludHJvZHVjdGlvbiBvZiB0aGVzZSBsYWJlbHMg
KGluY2x1ZGluZyBhbHNvDQo+ID4gPiA+ID4gcGF0Y2ggOCkuDQo+ID4gPiA+ID4gSSByZWFsaXpl
IGl0J3MgcXVpdGUgYSBsb3QgdG8gYXNrLCBidXQgYm90aCBmdW5jdGlvbnMgd291bGQNCj4gPiA+
ID4gPiBiZW5lZml0DQo+ID4gPiA+ID4gZnJvbSBzcGxpdHRpbmcgdXAgaW50byBwZXItbGV2ZWwg
aGVscGVyIGZ1bmN0aW9ucywgd2hpY2ggLQ0KPiA+ID4gPiA+IGFmYWljdCAtDQo+ID4gPiA+ID4g
d291bGQgYXZvaWQgdGhlIG5lZWQgZm9yIHN1Y2ggbGFiZWxzLCBhbmQgd2hpY2ggd291bGQgYXQg
dGhlDQo+ID4gPiA+ID4gc2FtZQ0KPiA+ID4gPiA+IHRpbWUgbGlrZWx5IG1ha2UgaXQgcXVpdGUg
YSBiaXQgZWFzaWVyIHRvIGV4dGVuZCB0aGVzZSB0byB0aGUNCj4gPiA+ID4gPiA1LWxldmVsIHBh
Z2UgdGFibGVzIGNhc2UgZG93biB0aGUgcm9hZC4NCj4gPiA+ID4gDQo+ID4gPiA+IEEgY29tbW9u
IHBhdHRlcm4gSSBoYXZlIGZvdW5kIHdoZW4gbWFwcGluZyBQVEUgcGFnZXMgb24tZGVtYW5kDQo+
ID4gPiA+IChhbmQgSQ0KPiA+ID4gPiB0aGluayBpcyB0aGUgZXhhY3QgaW50ZW50aW9uIG9mIHRo
ZXNlIGxhYmVscyBmcm9tIFdlaSwgYWxzbw0KPiA+ID4gPiBkZXNjcmliZWQNCj4gPiA+ID4gaW4g
dGhlIGNvbW1pdCBtZXNzYWdlKSBpcyB0aGF0IHdlIG9mdGVuIG5lZWQgdG8gZG86DQo+ID4gPiA+
IA0KPiA+ID4gPiBtYXAgc29tZSBwYWdlcyAtIHByb2Nlc3MgdGhvc2UgcGFnZXMgLSBlcnJvciBv
Y2N1cnMgb3IgdGhpcw0KPiA+ID4gPiBpdGVyYXRpb24NCj4gPiA+ID4gb2YgbG9vcCBjYW4gYmUg
c2tpcHBlZCAtIF9jbGVhbiB1cCB0aGUgbWFwcGluZ3NfIC0gY29udGludWUgb3INCj4gPiA+ID4g
cmV0dXJuDQo+ID4gPiA+IA0KPiA+ID4gPiBBcyBsb25nIGFzIGNsZWFuaW5nIHVwIGlzIHJlcXVp
cmVkLCB0aGVzZSBsYWJlbHMgd2lsbCBsaWtlbHkgYmUNCj4gPiA+ID4gbmVlZGVkDQo+ID4gPiA+
IGFzIHRoZSBjbGVhbi11cCBwYXRoIGJlZm9yZSBza2lwcGluZyBvciByZXR1cm5pbmcsIHNvIEkg
d291bGQNCj4gPiA+ID4gc2F5IHdlDQo+ID4gPiA+IHdpbGwgc2VlIHN1Y2ggbGFiZWxzIGV2ZW4g
aWYgd2Ugc3BsaXQgaXQgaW50byBoZWxwZXIgZnVuY3Rpb25zDQo+ID4gPiA+ICh2aXJ0X3RvX3hl
bl9sWzEyM11lKCkgbGF0ZXIgaW4gdGhlIHBhdGNoIHNlcmllcyBpcyBhbg0KPiA+ID4gPiBleGFt
cGxlKS4gSSBzZWUNCj4gPiA+ID4gdGhlIGxhYmVscyBtb3JlIG9yIGxlc3MgYXMgb3J0aG9nb25h
bCB0byBtb2R1bGFyaXNpbmcgaW50bw0KPiA+ID4gPiBoZWxwZXINCj4gPiA+ID4gZnVuY3Rpb25z
Lg0KPiA+ID4gDQo+ID4gPiBJIHRoaW5rIGRpZmZlcmVudGx5OiBUaGUgZmFjdCB0aGF0IGxhYmVs
cyBhcmUgbmVlZGVkIGlzIGJlY2F1c2UNCj4gPiA+IG9mDQo+ID4gPiB0aGUgY29tcGxleGl0eSBv
ZiB0aGUgZnVuY3Rpb25zLiBTaW1wbGVyIGZ1bmN0aW9ucyB3b3VsZCBhbGxvdw0KPiA+ID4gZ290
by1mcmVlIGhhbmRsaW5nIG9mIHN1Y2ggZXJyb3IgY29uZGl0aW9ucyAoYnkgaW5zdGVhZCBiZWlu
Zw0KPiA+ID4gYWJsZQ0KPiA+ID4gdG8gdXNlIGNvbnRpbnVlLCBicmVhaywgb3IgcmV0dXJuIHdp
dGhvdXQgbWFraW5nIHRoZSBjb2RlIGxlc3MNCj4gPiA+IHJlYWRhYmxlLCBvZnRlbiBldmVuIGlt
cHJvdmluZyByZWFkYWJpbGl0eSkuDQo+ID4gDQo+ID4gQW5kIHdoYXQgaXMgd3Jvbmcgd2l0aCB1
c2luZyBnb3RvLXM/IEl0IGlzIGEgKnZlcnkqIGNvbW1vbiBzdHlsZSBvZg0KPiA+IGVycm9yIGhh
bmRsaW5nIHVzZSB3aWRlbHkgaW4gZS5nLiB0aGUgbGludXgga2VybmVsLiBJTU8gaXQgb2Z0ZW4N
Cj4gPiBtYWtlcyBlcnJvciBwYXRocyBtdWNoIG1vcmUgb2J2aW91cyBhbmQgZWFzaWVyIHRvIHJl
YXNvbiBhYm91dC4gSW4NCj4gPiBmYWN0IEkgdmVyeSBtdWNoIGRpc2xpa2UgcmV0dXJucyBmcm9t
IHRoZSBtaWRkbGUgb2YgZnVuY3Rpb25zIGFzDQo+ID4gdGhleSBjYW4gZWFzaWx5IGxlYWQgdG8g
YXZvaWRhbmNlIG9mIG5lY2Vzc2FyeSBlcnJvciBjbGVhbnVwLg0KPiANCj4gV2hlcmVhcyBJIHBl
cnNvbmFsbHkgZGlzbGlrZSBnb3RvLXMgKGFuZCBJJ3ZlIGJlZW4gdGF1Z2h0IHNvIHdoZW4NCj4g
Zmlyc3QgbGVhcm5pbmcgcHJvZ3JhbW1pbmcgbGFuZ3VhZ2VzKS4gSW4gcHJpdmF0ZSBjb2RlIEkg
YXZvaWQgdGhlbQ0KPiBieSBhbGwgbWVhbnMuIEluIHByb2plY3RzIEknbSB0aGUgbWFpbnRhaW5l
ciBmb3IgSSBhY2NlcHQgdGhlbSB3aGVuDQo+IHRoZSBhbHRlcm5hdGl2ZSBpcyBub3RpY2VhYmx5
IG1vcmUgdWdseS4NCj4gDQo+IEphbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
