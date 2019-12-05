Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC11113FE9
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 12:05:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icouW-0000Z4-C0; Thu, 05 Dec 2019 11:03:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SJM4=Z3=amazon.com=prvs=235339fe4=pdurrant@srs-us1.protection.inumbo.net>)
 id 1icouV-0000Yz-54
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2019 11:03:03 +0000
X-Inumbo-ID: ce4fb2f6-174e-11ea-821e-12813bfff9fa
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ce4fb2f6-174e-11ea-821e-12813bfff9fa;
 Thu, 05 Dec 2019 11:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575543783; x=1607079783;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=A0I5HIiqkXdcUFwOBuWXns/QOkRkOmNr5RaeX3lMdwQ=;
 b=Jghfq7gm1LGX9snAdc9i+bogZwD0zaehs03esufZv6vcVjv/Bjlt+aw9
 GA7+f0ZGGUB3EJYIuSz7qJhmcUGB5GpzCmbC5xgoUGt0JUSseHJJRzmMF
 bpPmkPpYD+l3NRL2efgnJ1Zpwd/+kuaGMjD0WQ3xdyZewzCHFvRa26Ofm M=;
IronPort-SDR: r+/+lUe9irOO9uKYpH8HdrOONAs9TAJ/9lR1egqloNaNLjSdbsjz7EWA16s8X+bRXzOy7FkcVR
 buv0l1N3V/mQ==
X-IronPort-AV: E=Sophos;i="5.69,281,1571702400"; 
   d="scan'208";a="7255194"
Received: from iad6-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2b-a7fdc47a.us-west-2.amazon.com) ([10.124.125.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 05 Dec 2019 11:03:01 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-a7fdc47a.us-west-2.amazon.com (Postfix) with ESMTPS
 id 82460C5370; Thu,  5 Dec 2019 11:03:00 +0000 (UTC)
Received: from EX13D37EUA001.ant.amazon.com (10.43.165.212) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 5 Dec 2019 11:03:00 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D37EUA001.ant.amazon.com (10.43.165.212) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 5 Dec 2019 11:02:59 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Thu, 5 Dec 2019 11:02:58 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Jan Beulich <jbeulich@suse.com>, "Xia, Hongyan" <hongyxia@amazon.com>
Thread-Topic: [Xen-devel] [PATCH v4 6/9] x86/mm: add an end_of_loop label in
 map_pages_to_xen
Thread-Index: AQHVqsZfDdd/xiOKK02wSHKdknewYqerVhcAgAABGoCAAAlgIA==
Date: Thu, 5 Dec 2019 11:02:58 +0000
Message-ID: <fff722182ec8405486b4e29d4519c140@EX13D32EUC003.ant.amazon.com>
References: <cover.1575477921.git.hongyxia@amazon.com>
 <3885863bfc54a5f5f05cddb3cd9afe24897f27b3.1575477921.git.hongyxia@amazon.com>
 <f13c0e4808e320a0233f82b9be005fe5b2679469.camel@amazon.com>
 <cb2c4422-f425-721b-2b66-48fe7ba300ce@suse.com>
In-Reply-To: <cb2c4422-f425-721b-2b66-48fe7ba300ce@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.177]
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
 "roger.pau@citrix.com" <roger.pau@citrix.com>, "wl@xen.org" <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgSmFuDQo+IEJldWxp
Y2gNCj4gU2VudDogMDUgRGVjZW1iZXIgMjAxOSAxMDoyNg0KPiBUbzogWGlhLCBIb25neWFuIDxo
b25neXhpYUBhbWF6b24uY29tPg0KPiBDYzogYW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbTsgeGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyB3bEB4ZW4ub3JnOw0KPiByb2dlci5wYXVAY2l0
cml4LmNvbQ0KPiBTdWJqZWN0OiBSZTogW1hlbi1kZXZlbF0gW1BBVENIIHY0IDYvOV0geDg2L21t
OiBhZGQgYW4gZW5kX29mX2xvb3AgbGFiZWwNCj4gaW4gbWFwX3BhZ2VzX3RvX3hlbg0KPiANCj4g
T24gMDUuMTIuMjAxOSAxMToyMSwgWGlhLCBIb25neWFuIHdyb3RlOg0KPiA+PiBPbiAwMi4xMC4y
MDE5IDE5OjE2LCBIb25neWFuIFhpYSB3cm90ZToNCj4gPj4+IFdlIHdpbGwgc29vbiBuZWVkIHRv
IGNsZWFuIHVwIG1hcHBpbmdzIHdoZW5ldmVyIHRoZSBvdXQgbW9zdCBsb29wIGlzDQo+ID4+PiBl
bmRlZC4gQWRkIGEgbmV3IGxhYmVsIGFuZCB0dXJuIHJlbGV2YW50IGNvbnRpbnVlJ3MgaW50byBn
b3RvJ3MuDQo+ID4+DQo+ID4+IEkgdGhpbmsgYWxyZWFkeSB3aGVuIHRoaXMgc3RpbGwgd2FzIFJG
QyBJIGRpZCBpbmRpY2F0ZSB0aGF0IEknbSBub3QNCj4gPj4gaGFwcHkgYWJvdXQgdGhlIGludHJv
ZHVjdGlvbiBvZiB0aGVzZSBsYWJlbHMgKGluY2x1ZGluZyBhbHNvIHBhdGNoIDgpLg0KPiA+PiBJ
IHJlYWxpemUgaXQncyBxdWl0ZSBhIGxvdCB0byBhc2ssIGJ1dCBib3RoIGZ1bmN0aW9ucyB3b3Vs
ZCBiZW5lZml0DQo+ID4+ZnJvbSBzcGxpdHRpbmcgdXAgaW50byBwZXItbGV2ZWwgaGVscGVyIGZ1
bmN0aW9ucywgd2hpY2ggLSBhZmFpY3QgLQ0KPiA+PiB3b3VsZCBhdm9pZCB0aGUgbmVlZCBmb3Ig
c3VjaCBsYWJlbHMsIGFuZCB3aGljaCB3b3VsZCBhdCB0aGUgc2FtZQ0KPiA+PiB0aW1lIGxpa2Vs
eSBtYWtlIGl0IHF1aXRlIGEgYml0IGVhc2llciB0byBleHRlbmQgdGhlc2UgdG8gdGhlDQo+ID4+
IDUtbGV2ZWwgcGFnZSB0YWJsZXMgY2FzZSBkb3duIHRoZSByb2FkLg0KPiA+DQo+ID4gQSBjb21t
b24gcGF0dGVybiBJIGhhdmUgZm91bmQgd2hlbiBtYXBwaW5nIFBURSBwYWdlcyBvbi1kZW1hbmQg
KGFuZCBJDQo+ID4gdGhpbmsgaXMgdGhlIGV4YWN0IGludGVudGlvbiBvZiB0aGVzZSBsYWJlbHMg
ZnJvbSBXZWksIGFsc28gZGVzY3JpYmVkDQo+ID4gaW4gdGhlIGNvbW1pdCBtZXNzYWdlKSBpcyB0
aGF0IHdlIG9mdGVuIG5lZWQgdG8gZG86DQo+ID4NCj4gPiBtYXAgc29tZSBwYWdlcyAtIHByb2Nl
c3MgdGhvc2UgcGFnZXMgLSBlcnJvciBvY2N1cnMgb3IgdGhpcyBpdGVyYXRpb24NCj4gPiBvZiBs
b29wIGNhbiBiZSBza2lwcGVkIC0gX2NsZWFuIHVwIHRoZSBtYXBwaW5nc18gLSBjb250aW51ZSBv
ciByZXR1cm4NCj4gPg0KPiA+IEFzIGxvbmcgYXMgY2xlYW5pbmcgdXAgaXMgcmVxdWlyZWQsIHRo
ZXNlIGxhYmVscyB3aWxsIGxpa2VseSBiZSBuZWVkZWQNCj4gPiBhcyB0aGUgY2xlYW4tdXAgcGF0
aCBiZWZvcmUgc2tpcHBpbmcgb3IgcmV0dXJuaW5nLCBzbyBJIHdvdWxkIHNheSB3ZQ0KPiA+IHdp
bGwgc2VlIHN1Y2ggbGFiZWxzIGV2ZW4gaWYgd2Ugc3BsaXQgaXQgaW50byBoZWxwZXIgZnVuY3Rp
b25zDQo+ID4gKHZpcnRfdG9feGVuX2xbMTIzXWUoKSBsYXRlciBpbiB0aGUgcGF0Y2ggc2VyaWVz
IGlzIGFuIGV4YW1wbGUpLiBJIHNlZQ0KPiA+IHRoZSBsYWJlbHMgbW9yZSBvciBsZXNzIGFzIG9y
dGhvZ29uYWwgdG8gbW9kdWxhcmlzaW5nIGludG8gaGVscGVyDQo+ID4gZnVuY3Rpb25zLg0KPiAN
Cj4gSSB0aGluayBkaWZmZXJlbnRseTogVGhlIGZhY3QgdGhhdCBsYWJlbHMgYXJlIG5lZWRlZCBp
cyBiZWNhdXNlIG9mDQo+IHRoZSBjb21wbGV4aXR5IG9mIHRoZSBmdW5jdGlvbnMuIFNpbXBsZXIg
ZnVuY3Rpb25zIHdvdWxkIGFsbG93DQo+IGdvdG8tZnJlZSBoYW5kbGluZyBvZiBzdWNoIGVycm9y
IGNvbmRpdGlvbnMgKGJ5IGluc3RlYWQgYmVpbmcgYWJsZQ0KPiB0byB1c2UgY29udGludWUsIGJy
ZWFrLCBvciByZXR1cm4gd2l0aG91dCBtYWtpbmcgdGhlIGNvZGUgbGVzcw0KPiByZWFkYWJsZSwg
b2Z0ZW4gZXZlbiBpbXByb3ZpbmcgcmVhZGFiaWxpdHkpLg0KDQpBbmQgd2hhdCBpcyB3cm9uZyB3
aXRoIHVzaW5nIGdvdG8tcz8gSXQgaXMgYSAqdmVyeSogY29tbW9uIHN0eWxlIG9mIGVycm9yIGhh
bmRsaW5nIHVzZSB3aWRlbHkgaW4gZS5nLiB0aGUgbGludXgga2VybmVsLiBJTU8gaXQgb2Z0ZW4g
bWFrZXMgZXJyb3IgcGF0aHMgbXVjaCBtb3JlIG9idmlvdXMgYW5kIGVhc2llciB0byByZWFzb24g
YWJvdXQuIEluIGZhY3QgSSB2ZXJ5IG11Y2ggZGlzbGlrZSByZXR1cm5zIGZyb20gdGhlIG1pZGRs
ZSBvZiBmdW5jdGlvbnMgYXMgdGhleSBjYW4gZWFzaWx5IGxlYWQgdG8gYXZvaWRhbmNlIG9mIG5l
Y2Vzc2FyeSBlcnJvciBjbGVhbnVwLg0KDQogIFBhdWwNCg0KPiANCj4gSmFuDQo+IA0KPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0DQo+IFhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVsDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
