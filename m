Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC3111416B
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 14:27:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icr5x-00040W-5y; Thu, 05 Dec 2019 13:23:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fY9/=Z3=amazon.com=prvs=2352ce6fd=hongyxia@srs-us1.protection.inumbo.net>)
 id 1icr5v-00040R-4z
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2019 13:22:59 +0000
X-Inumbo-ID: 5aa7d54a-1762-11ea-8225-12813bfff9fa
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5aa7d54a-1762-11ea-8225-12813bfff9fa;
 Thu, 05 Dec 2019 13:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575552178; x=1607088178;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=T5UaerYnLh5mIcZ45HT9malggyoERKR7XwgkJmOrQ8M=;
 b=EYZtRHLWcT8ipq7j9VlekBwBdzJ3jZ82SQ4pcRKRYgMpj8QS0ExDEXYU
 pmGaJV7ZdanFCVXV9klq5S0og8CX4VQ7eVh6knq/C0LRZjemza0aMdzLe
 x+1OjgJkhk0+C/FNIRmfir3iBf+KnCE7r3bCgw5vr6Jz1yjFIxmhEWe4G M=;
IronPort-SDR: YAH/lptWxzeTgzURUpwByqB1dv9fcu68GyvRIv+XhmVabWINyFIDIjZbReCGruhGTXJygmf/cw
 9FcQuHcmW4lA==
X-IronPort-AV: E=Sophos;i="5.69,281,1571702400"; 
   d="scan'208";a="6341038"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-9ec21598.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 05 Dec 2019 13:22:58 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-9ec21598.us-east-1.amazon.com (Postfix) with ESMTPS
 id 8AC66A2404; Thu,  5 Dec 2019 13:22:56 +0000 (UTC)
Received: from EX13D32EUB001.ant.amazon.com (10.43.166.125) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 5 Dec 2019 13:22:55 +0000
Received: from EX13D37EUA003.ant.amazon.com (10.43.165.7) by
 EX13D32EUB001.ant.amazon.com (10.43.166.125) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 5 Dec 2019 13:22:52 +0000
Received: from EX13D37EUA003.ant.amazon.com ([10.43.165.7]) by
 EX13D37EUA003.ant.amazon.com ([10.43.165.7]) with mapi id 15.00.1367.000;
 Thu, 5 Dec 2019 13:22:52 +0000
From: "Xia, Hongyan" <hongyxia@amazon.com>
To: "jbeulich@suse.com" <jbeulich@suse.com>, "Durrant, Paul"
 <pdurrant@amazon.com>
Thread-Topic: [PATCH v4 6/9] x86/mm: add an end_of_loop label in
 map_pages_to_xen
Thread-Index: AQHVq1zfDAPZfD8vJUa92KD9bthZyKerh3aA
Date: Thu, 5 Dec 2019 13:22:52 +0000
Message-ID: <649e18f343bf9956c12046657bbd8cc4c5180396.camel@amazon.com>
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
x-originating-ip: [10.43.166.133]
Content-ID: <B8E7F7A14C8B8A429A67864351D532D8@amazon.com>
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

SSBtZWFuLi4uIEkgd2FzIHRhdWdodCBzbyBhcyB3ZWxsIGJ1dCBJIHdhcyBhbHNvIHRhdWdodCBh
biBleGNlcHRpb24NCndoaWNoIGlzIHVzaW5nIGl0IGZvciBlcnJvciBoYW5kbGluZyBhbmQgY2xl
YW5pbmcgdXAuIEkgYW0gbm90IHN1cmUgaWYNCnVzaW5nIGFsdGVybmF0aXZlcyB3b3VsZCByZXN1
bHQgaW4gY2xlYW5lciBjb2RlIGluIHRoaXMgc2l0dWF0aW9uLg0KDQpIb25neWFuDQoNCk9uIFRo
dSwgMjAxOS0xMi0wNSBhdCAxMjoxMiArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDA1
LjEyLjIwMTkgMTI6MDIsIER1cnJhbnQsIFBhdWwgd3JvdGU6DQo+ID4gPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogWGVuLWRldmVsIDx4ZW4tZGV2ZWwtYm91bmNlc0Bs
aXN0cy54ZW5wcm9qZWN0Lm9yZz4gT24NCj4gPiA+IEJlaGFsZiBPZiBKYW4NCj4gPiA+IEJldWxp
Y2gNCj4gPiA+IFNlbnQ6IDA1IERlY2VtYmVyIDIwMTkgMTA6MjYNCj4gPiA+IFRvOiBYaWEsIEhv
bmd5YW4gPGhvbmd5eGlhQGFtYXpvbi5jb20+DQo+ID4gPiBDYzogYW5kcmV3LmNvb3BlcjNAY2l0
cml4LmNvbTsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyANCj4gPiA+IHdsQHhlbi5v
cmc7DQo+ID4gPiByb2dlci5wYXVAY2l0cml4LmNvbQ0KPiA+ID4gU3ViamVjdDogUmU6IFtYZW4t
ZGV2ZWxdIFtQQVRDSCB2NCA2LzldIHg4Ni9tbTogYWRkIGFuDQo+ID4gPiBlbmRfb2ZfbG9vcCBs
YWJlbA0KPiA+ID4gaW4gbWFwX3BhZ2VzX3RvX3hlbg0KPiA+ID4gDQo+ID4gPiBPbiAwNS4xMi4y
MDE5IDExOjIxLCBYaWEsIEhvbmd5YW4gd3JvdGU6DQo+ID4gPiA+ID4gT24gMDIuMTAuMjAxOSAx
OToxNiwgSG9uZ3lhbiBYaWEgd3JvdGU6DQo+ID4gPiA+ID4gPiBXZSB3aWxsIHNvb24gbmVlZCB0
byBjbGVhbiB1cCBtYXBwaW5ncyB3aGVuZXZlciB0aGUgb3V0DQo+ID4gPiA+ID4gPiBtb3N0IGxv
b3AgaXMNCj4gPiA+ID4gPiA+IGVuZGVkLiBBZGQgYSBuZXcgbGFiZWwgYW5kIHR1cm4gcmVsZXZh
bnQgY29udGludWUncyBpbnRvDQo+ID4gPiA+ID4gPiBnb3RvJ3MuDQo+ID4gPiA+ID4gDQo+ID4g
PiA+ID4gSSB0aGluayBhbHJlYWR5IHdoZW4gdGhpcyBzdGlsbCB3YXMgUkZDIEkgZGlkIGluZGlj
YXRlIHRoYXQNCj4gPiA+ID4gPiBJJ20gbm90DQo+ID4gPiA+ID4gaGFwcHkgYWJvdXQgdGhlIGlu
dHJvZHVjdGlvbiBvZiB0aGVzZSBsYWJlbHMgKGluY2x1ZGluZyBhbHNvDQo+ID4gPiA+ID4gcGF0
Y2ggOCkuDQo+ID4gPiA+ID4gSSByZWFsaXplIGl0J3MgcXVpdGUgYSBsb3QgdG8gYXNrLCBidXQg
Ym90aCBmdW5jdGlvbnMgd291bGQNCj4gPiA+ID4gPiBiZW5lZml0DQo+ID4gPiA+ID4gZnJvbSBz
cGxpdHRpbmcgdXAgaW50byBwZXItbGV2ZWwgaGVscGVyIGZ1bmN0aW9ucywgd2hpY2ggLQ0KPiA+
ID4gPiA+IGFmYWljdCAtDQo+ID4gPiA+ID4gd291bGQgYXZvaWQgdGhlIG5lZWQgZm9yIHN1Y2gg
bGFiZWxzLCBhbmQgd2hpY2ggd291bGQgYXQgdGhlDQo+ID4gPiA+ID4gc2FtZQ0KPiA+ID4gPiA+
IHRpbWUgbGlrZWx5IG1ha2UgaXQgcXVpdGUgYSBiaXQgZWFzaWVyIHRvIGV4dGVuZCB0aGVzZSB0
byB0aGUNCj4gPiA+ID4gPiA1LWxldmVsIHBhZ2UgdGFibGVzIGNhc2UgZG93biB0aGUgcm9hZC4N
Cj4gPiA+ID4gDQo+ID4gPiA+IEEgY29tbW9uIHBhdHRlcm4gSSBoYXZlIGZvdW5kIHdoZW4gbWFw
cGluZyBQVEUgcGFnZXMgb24tZGVtYW5kDQo+ID4gPiA+IChhbmQgSQ0KPiA+ID4gPiB0aGluayBp
cyB0aGUgZXhhY3QgaW50ZW50aW9uIG9mIHRoZXNlIGxhYmVscyBmcm9tIFdlaSwgYWxzbw0KPiA+
ID4gPiBkZXNjcmliZWQNCj4gPiA+ID4gaW4gdGhlIGNvbW1pdCBtZXNzYWdlKSBpcyB0aGF0IHdl
IG9mdGVuIG5lZWQgdG8gZG86DQo+ID4gPiA+IA0KPiA+ID4gPiBtYXAgc29tZSBwYWdlcyAtIHBy
b2Nlc3MgdGhvc2UgcGFnZXMgLSBlcnJvciBvY2N1cnMgb3IgdGhpcw0KPiA+ID4gPiBpdGVyYXRp
b24NCj4gPiA+ID4gb2YgbG9vcCBjYW4gYmUgc2tpcHBlZCAtIF9jbGVhbiB1cCB0aGUgbWFwcGlu
Z3NfIC0gY29udGludWUgb3INCj4gPiA+ID4gcmV0dXJuDQo+ID4gPiA+IA0KPiA+ID4gPiBBcyBs
b25nIGFzIGNsZWFuaW5nIHVwIGlzIHJlcXVpcmVkLCB0aGVzZSBsYWJlbHMgd2lsbCBsaWtlbHkg
YmUNCj4gPiA+ID4gbmVlZGVkDQo+ID4gPiA+IGFzIHRoZSBjbGVhbi11cCBwYXRoIGJlZm9yZSBz
a2lwcGluZyBvciByZXR1cm5pbmcsIHNvIEkgd291bGQNCj4gPiA+ID4gc2F5IHdlDQo+ID4gPiA+
IHdpbGwgc2VlIHN1Y2ggbGFiZWxzIGV2ZW4gaWYgd2Ugc3BsaXQgaXQgaW50byBoZWxwZXIgZnVu
Y3Rpb25zDQo+ID4gPiA+ICh2aXJ0X3RvX3hlbl9sWzEyM11lKCkgbGF0ZXIgaW4gdGhlIHBhdGNo
IHNlcmllcyBpcyBhbg0KPiA+ID4gPiBleGFtcGxlKS4gSSBzZWUNCj4gPiA+ID4gdGhlIGxhYmVs
cyBtb3JlIG9yIGxlc3MgYXMgb3J0aG9nb25hbCB0byBtb2R1bGFyaXNpbmcgaW50bw0KPiA+ID4g
PiBoZWxwZXINCj4gPiA+ID4gZnVuY3Rpb25zLg0KPiA+ID4gDQo+ID4gPiBJIHRoaW5rIGRpZmZl
cmVudGx5OiBUaGUgZmFjdCB0aGF0IGxhYmVscyBhcmUgbmVlZGVkIGlzIGJlY2F1c2UNCj4gPiA+
IG9mDQo+ID4gPiB0aGUgY29tcGxleGl0eSBvZiB0aGUgZnVuY3Rpb25zLiBTaW1wbGVyIGZ1bmN0
aW9ucyB3b3VsZCBhbGxvdw0KPiA+ID4gZ290by1mcmVlIGhhbmRsaW5nIG9mIHN1Y2ggZXJyb3Ig
Y29uZGl0aW9ucyAoYnkgaW5zdGVhZCBiZWluZw0KPiA+ID4gYWJsZQ0KPiA+ID4gdG8gdXNlIGNv
bnRpbnVlLCBicmVhaywgb3IgcmV0dXJuIHdpdGhvdXQgbWFraW5nIHRoZSBjb2RlIGxlc3MNCj4g
PiA+IHJlYWRhYmxlLCBvZnRlbiBldmVuIGltcHJvdmluZyByZWFkYWJpbGl0eSkuDQo+ID4gDQo+
ID4gQW5kIHdoYXQgaXMgd3Jvbmcgd2l0aCB1c2luZyBnb3RvLXM/IEl0IGlzIGEgKnZlcnkqIGNv
bW1vbiBzdHlsZSBvZg0KPiA+IGVycm9yIGhhbmRsaW5nIHVzZSB3aWRlbHkgaW4gZS5nLiB0aGUg
bGludXgga2VybmVsLiBJTU8gaXQgb2Z0ZW4NCj4gPiBtYWtlcyBlcnJvciBwYXRocyBtdWNoIG1v
cmUgb2J2aW91cyBhbmQgZWFzaWVyIHRvIHJlYXNvbiBhYm91dC4gSW4NCj4gPiBmYWN0IEkgdmVy
eSBtdWNoIGRpc2xpa2UgcmV0dXJucyBmcm9tIHRoZSBtaWRkbGUgb2YgZnVuY3Rpb25zIGFzDQo+
ID4gdGhleSBjYW4gZWFzaWx5IGxlYWQgdG8gYXZvaWRhbmNlIG9mIG5lY2Vzc2FyeSBlcnJvciBj
bGVhbnVwLg0KPiANCj4gV2hlcmVhcyBJIHBlcnNvbmFsbHkgZGlzbGlrZSBnb3RvLXMgKGFuZCBJ
J3ZlIGJlZW4gdGF1Z2h0IHNvIHdoZW4NCj4gZmlyc3QgbGVhcm5pbmcgcHJvZ3JhbW1pbmcgbGFu
Z3VhZ2VzKS4gSW4gcHJpdmF0ZSBjb2RlIEkgYXZvaWQgdGhlbQ0KPiBieSBhbGwgbWVhbnMuIElu
IHByb2plY3RzIEknbSB0aGUgbWFpbnRhaW5lciBmb3IgSSBhY2NlcHQgdGhlbSB3aGVuDQo+IHRo
ZSBhbHRlcm5hdGl2ZSBpcyBub3RpY2VhYmx5IG1vcmUgdWdseS4NCj4gDQo+IEphbg0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
