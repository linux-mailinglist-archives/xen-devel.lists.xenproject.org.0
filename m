Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D7217BD4C
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 13:53:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jACRM-0007gS-Cy; Fri, 06 Mar 2020 12:50:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FvQx=4X=amazon.co.uk=prvs=32702b987=pdurrant@srs-us1.protection.inumbo.net>)
 id 1jACRK-0007gL-Qq
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 12:50:54 +0000
X-Inumbo-ID: 1d99be72-5fa9-11ea-8eb5-bc764e2007e4
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1d99be72-5fa9-11ea-8eb5-bc764e2007e4;
 Fri, 06 Mar 2020 12:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1583499055; x=1615035055;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rF9QXVc/2RUXqCdJrs9Cw+hMSvKXv4QA43xFcGV6/yo=;
 b=q5Ms44fcJBJhbrkV56L+cBni493hxI5vSjNLAja6R2gplLzbUerTVxCO
 7cgmJbkbwmrzPwckEGs4rI4v0WH26zbuDnUny0eYD/i1MeA4OkmrSbPuC
 j7T7sGDZ0HBAu7NiZrTpzXF97xdTP/DRfIMOhQbMmnUil8DW0BQ+kJAf/ 4=;
IronPort-SDR: 4XBIHUj9GxuRoN1j+Hu0R8qxs2sR6+zLE6Xm9p429S3kG2yKlgNlUp2FDAo/lXLu2YwAC9tU+7
 27MfrpbQiGoQ==
X-IronPort-AV: E=Sophos;i="5.70,522,1574121600"; d="scan'208";a="29670935"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2b-55156cd4.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 06 Mar 2020 12:50:52 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-55156cd4.us-west-2.amazon.com (Postfix) with ESMTPS
 id 55982A2542; Fri,  6 Mar 2020 12:50:51 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Fri, 6 Mar 2020 12:50:51 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 6 Mar 2020 12:50:50 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Fri, 6 Mar 2020 12:50:49 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH v3 2/6] x86 / p2m: remove page_list check in
 p2m_alloc_table
Thread-Index: AQHV86zPcz0SNzMCl02V4cFdHsApB6g7dx1AgAAMGICAAACBgA==
Date: Fri, 6 Mar 2020 12:50:49 +0000
Message-ID: <cddc7c8d65b6444a9c44f075fdca3b93@EX13D32EUC003.ant.amazon.com>
References: <20200305124504.3564-1-pdurrant@amzn.com>
 <20200305124504.3564-3-pdurrant@amzn.com>
 <5c8e1d01-74e8-ed77-5900-9419c010b407@suse.com>
 <a135e3321e9941a9b25055e858fc5313@EX13D32EUC003.ant.amazon.com>
 <9beb5129-68c0-ce68-2778-748a4485f6fb@suse.com>
In-Reply-To: <9beb5129-68c0-ce68-2778-748a4485f6fb@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.159]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v3 2/6] x86 / p2m: remove page_list check in
 p2m_alloc_table
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "pdurrant@amzn.com" <pdurrant@amzn.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDA2IE1hcmNoIDIwMjAgMTI6NDcNCj4gVG86IER1cnJhbnQs
IFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jby51az4NCj4gQ2M6IHBkdXJyYW50QGFtem4uY29tOyB4
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+Ow0KPiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5j
b20+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNp
dHJpeC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMi82XSB4ODYgLyBwMm06IHJlbW92
ZSBwYWdlX2xpc3QgY2hlY2sgaW4gcDJtX2FsbG9jX3RhYmxlDQo+IA0KPiBPbiAwNi4wMy4yMDIw
IDEzOjA3LCBEdXJyYW50LCBQYXVsIHdyb3RlOg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPiA+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+ID4+IFNl
bnQ6IDA2IE1hcmNoIDIwMjAgMTE6NDYNCj4gPj4gVG86IHBkdXJyYW50QGFtem4uY29tDQo+ID4+
IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IER1cnJhbnQsIFBhdWwgPHBkdXJy
YW50QGFtYXpvbi5jby51az47IEFuZHJldyBDb29wZXINCj4gPj4gPGFuZHJldy5jb29wZXIzQGNp
dHJpeC5jb20+OyBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+OyBXZWkg
TGl1IDx3bEB4ZW4ub3JnPjsgUm9nZXINCj4gUGF1DQo+ID4+IE1vbm7DqSA8cm9nZXIucGF1QGNp
dHJpeC5jb20+DQo+ID4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMi82XSB4ODYgLyBwMm06IHJl
bW92ZSBwYWdlX2xpc3QgY2hlY2sgaW4gcDJtX2FsbG9jX3RhYmxlDQo+ID4+DQo+ID4+IE9uIDA1
LjAzLjIwMjAgMTM6NDUsIHBkdXJyYW50QGFtem4uY29tIHdyb3RlOg0KPiA+Pj4gRnJvbTogUGF1
bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPg0KPiA+Pj4NCj4gPj4+IFRoZXJlIGRvZXMg
bm90IHNlZW0gdG8gYmUgYW55IGp1c3RpZmljYXRpb24gZm9yIHJlZnVzaW5nIHRvIGNyZWF0ZSB0
aGUNCj4gPj4+IGRvbWFpbidzIHAybSB0YWJsZSBzaW1wbHkgYmVjYXVzZSBpdCBtYXkgaGF2ZSBh
c3NpZ25lZCBwYWdlcy4NCj4gPj4NCj4gPj4gSSB0aGluayB0aGVyZSBpczogSWYgYW55IHN1Y2gg
YWxsb2NhdGlvbiBoYWQgaGFwcGVuZWQgYmVmb3JlLCBob3cNCj4gPj4gd291bGQgaXQgYmUgcmVw
cmVzZW50ZWQgaW4gdGhlIGRvbWFpbidzIHAybT8NCj4gPg0KPiA+IEluc2VydGlvbiBpbnRvIHRo
ZSBwMm0gaXMgYSBzZXBhcmF0ZSBhY3Rpb24gZnJvbSBwYWdlIGFsbG9jYXRpb24uIFdoeSBzaG91
bGQgdGhleSBiZSBsaW5rZWQ/DQo+IA0KPiBUaGV5IGFyZSwgYmVjYXVzZSBvZiBob3cgWEVOTUVN
X3BvcHVsYXRlX3BoeXNtYXAgd29ya3MuIFllcywNCj4gdGhleSBfY291bGRfIGJlIHNlcGFyYXRl
IHN0ZXBzLCBidXQgdGhhdCdzIG9ubHkgYSB0aGVvcmV0aWNhbA0KPiBjb25zaWRlcmF0aW9uLg0K
DQpUaGVuIHN1cmVseSB0aGUgY2hlY2sgc2hvdWxkIGJlIGluIHRoZSBYRU5NRU1fcG9wdWxhdGVf
cGh5c21hcCBjb2RlPw0KDQo+IA0KPiA+Pj4gUGFydGljdWxhcmx5DQo+ID4+PiBpdCBwcmV2ZW50
cyB0aGUgcHJpb3IgYWxsb2NhdGlvbiBvZiBQR0NfZXh0cmEgcGFnZXMuDQo+ID4+DQo+ID4+IFRo
YXQncyB1bmZvcnR1bmF0ZSwgYnV0IHdpbGwgbmVlZCB0YWtpbmcgY2FyZSBvZiBkaWZmZXJlbnRs
eSB0aGVuOg0KPiA+Pg0KPiA+Pj4gLS0tIGEveGVuL2FyY2gveDg2L21tL3AybS5jDQo+ID4+PiAr
KysgYi94ZW4vYXJjaC94ODYvbW0vcDJtLmMNCj4gPj4+IEBAIC02OTUsMTQgKzY5NSw2IEBAIGlu
dCBwMm1fYWxsb2NfdGFibGUoc3RydWN0IHAybV9kb21haW4gKnAybSkNCj4gPj4+DQo+ID4+PiAg
ICAgIHAybV9sb2NrKHAybSk7DQo+ID4+Pg0KPiA+Pj4gLSAgICBpZiAoIHAybV9pc19ob3N0cDJt
KHAybSkNCj4gPj4+IC0gICAgICAgICAmJiAhcGFnZV9saXN0X2VtcHR5KCZkLT5wYWdlX2xpc3Qp
ICkNCj4gPj4+IC0gICAgew0KPiA+Pj4gLSAgICAgICAgUDJNX0VSUk9SKCJkb20gJWQgYWxyZWFk
eSBoYXMgbWVtb3J5IGFsbG9jYXRlZFxuIiwgZC0+ZG9tYWluX2lkKTsNCj4gPj4+IC0gICAgICAg
IHAybV91bmxvY2socDJtKTsNCj4gPj4+IC0gICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiA+Pj4g
LSAgICB9DQo+ID4+DQo+ID4+IEluc3RlYWQgb2YgY2hlY2tpbmcgdGhlIGxpc3QgdG8gYmUgZW1w
dHksIGhvdyBhYm91dCBjaGVja2luZw0KPiA+PiBkb21haW5fdG90X3BhZ2VzKCkgdG8gcmV0dXJu
IHplcm8/DQo+ID4NCj4gPiBJIGNvdWxkIGRvIHRoYXQsIGFuZCBpbiBmYWN0IG15IG9yaWdpbmFs
IGNvZGUgZGlkLCBidXQgd2l0aCBtb3JlDQo+ID4gY29uc2lkZXJhdGlvbiB0aGUgd2hvbGUgdGVz
dCBqdXN0IGRpZG4ndCBtYWtlIHNlbnNlIHRvIG1lLiBZZXMsDQo+ID4gY2xlYXJseSB0aGUgcDJt
IGhhcyB0byBiZSB0aGVyZSBiZWZvcmUgcGFnZXMgY2FuIGJlIGFkZGVkIGludG8gaXQsDQo+ID4g
YnV0IEkgY2FuJ3Qgc2VlIGFueSByZWFzb24gd2h5IHlvdSBjb3VsZG4ndCBldmVuIGFsbG9jYXRl
IHRoZQ0KPiA+IGVudGlyZSBndWVzdCBSQU0sIHRoZW4gY3JlYXRlIHRoZSBwMm0gYW5kIHRoZW4g
YWRkIHRoZSBwYWdlcyBpbnRvDQo+ID4gaXQuDQo+IA0KPiBSaWdodCAtIG1vcmUgaHlwZXJjYWxs
cyAoWEVOTUVNX2luY3JlYXNlX3Jlc2VydmF0aW9uICsgb3BlcmF0aW9ucw0KPiBsaWtlIFhFTk1B
UFNQQUNFX2dtZm4pLCBhbmQgaGVuY2Ugc2xvd2VyIG92ZXJhbGwgZG9tYWluIGNyZWF0aW9uLg0K
PiBQbHVzIC0gWEVOTUVNX2luY3JlYXNlX3Jlc2VydmF0aW9uIGlzIG5vdCB2ZXJ5IHVzZWZ1bCBm
b3INCj4gdHJhbnNsYXRlZCBkb21haW5zLCBhcyBpdCB3b24ndCByZXR1cm4gdGhlIE1GTnMgYWxs
b2NhdGVkLCBhbmQNCj4gdGhlcmUncyBubyB3YXkgdG8gc3BlY2lmeSB3aGVyZSB0aGV5IHNob3Vs
ZCBhcHBlYXIgaW4gR0ZOIHNwYWNlLg0KPiBIZW5jZSBpbiBwcmFjdGljZSBJIGRvbid0IHNlZSBo
b3cgdGhpcyB3aG9sZSBvcGVyYXRpb24gY291bGQNCj4gd29yayB3aXRob3V0IFhFTk1FTV9wb3B1
bGF0ZV9waHlzbWFwLg0KPiANCg0KT2gsIGl0IHdvdWxkIG1lYW4gYSBiaWcgY2hhbmdlIGluIHRo
ZSB0b29scyBldGMuIHNvIEknbSBub3Qgc2F5aW5nIGl0J3MgYSBnb29kIGlkZWEgb3IgZXZlbiBw
b3NzaWJsZSBhdCB0aGUgbW9tZW50LiBJIHdhcyBqdXN0IHBvaW50aW5nIG91dCB0aGF0LCBhcyBm
YXIgYXMgdGhlIGxvd2VyIGxheWVycyBvZiBjb2RlIGluIFhlbiBnbywgcGFnZSBhbGxvY2F0aW9u
IGFuZCBwMm0gaW5zZXJ0aW9uIGFyZSBkaXN0aW5jdCBhY3Rpb25zLg0KDQogIFBhdWwNCg0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
