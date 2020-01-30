Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B954614DF41
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 17:35:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixCki-0008Bn-6v; Thu, 30 Jan 2020 16:33:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EN2q=3T=amazon.co.uk=prvs=29183970d=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ixCkg-0008Bi-1p
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 16:33:10 +0000
X-Inumbo-ID: 32659da5-437e-11ea-8ab8-12813bfff9fa
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 32659da5-437e-11ea-8ab8-12813bfff9fa;
 Thu, 30 Jan 2020 16:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1580401989; x=1611937989;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+if3QZZ0tfzCnQzmrwxHZ/EP5kxstHQWItMeuASCwKc=;
 b=quYocWQvmffJAb3gcgFxfDmK3qS+KeSy23oNbRWLMtxowoomnzpJgpHm
 upn2SVpKhVNst1zA21v+sEiRFEkzcP+h2hmXAKhfK1H8mtf1goLk1D43h
 afJBKEONF2qNyHuqAUG8dRi5xTnqJi7rKjLa1l+DcmsKL8WiPztjrkPI7 g=;
IronPort-SDR: Iiznvkk1Wo1XlC5Tk09LENcAbOhvjBt16jJ4U3y+u/eieS69/RLhcua/std3j9vnlTbqGViKsP
 5oEU3mQeKQcw==
X-IronPort-AV: E=Sophos;i="5.70,382,1574121600"; d="scan'208";a="23430121"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1e-27fb8269.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 30 Jan 2020 16:32:57 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-27fb8269.us-east-1.amazon.com (Postfix) with ESMTPS
 id A1C65A1AF4; Thu, 30 Jan 2020 16:32:53 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Thu, 30 Jan 2020 16:32:53 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 30 Jan 2020 16:32:52 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Thu, 30 Jan 2020 16:32:51 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH v8 2/4] add a domain_tot_pages() helper function
Thread-Index: AQHV132q3dH9I4+EGUirmAaSnjJ2uagDZdSAgAAAk0A=
Date: Thu, 30 Jan 2020 16:32:51 +0000
Message-ID: <700c3e466b8245a28bcb530bb15d4c4e@EX13D32EUC003.ant.amazon.com>
References: <20200130145745.1306-1-pdurrant@amazon.com>
 <20200130145745.1306-3-pdurrant@amazon.com>
 <93af32a7-963f-6978-4d37-80e471c1832f@suse.com>
In-Reply-To: <93af32a7-963f-6978-4d37-80e471c1832f@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.63]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v8 2/4] add a domain_tot_pages() helper
 function
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Tim Deegan <tim@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDMwIEphbnVhcnkgMjAyMCAxNjoyOQ0KPiBUbzogRHVycmFu
dCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPg0KPiBDYzogeGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnOyBBbmRyZXcgQ29vcGVyDQo+IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
PjsgV2VpIExpdSA8d2xAeGVuLm9yZz47IFJvZ2VyIFBhdSBNb25uw6kNCj4gPHJvZ2VyLnBhdUBj
aXRyaXguY29tPjsgR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tPjsg
SWFuDQo+IEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+OyBKdWxpZW4gR3JhbGwg
PGp1bGllbkB4ZW4ub3JnPjsgS29ucmFkDQo+IFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0Bv
cmFjbGUuY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pDQo+IDxzc3RhYmVsbGluaUBrZXJuZWwub3Jn
PjsgVGltIERlZWdhbiA8dGltQHhlbi5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjggMi80
XSBhZGQgYSBkb21haW5fdG90X3BhZ2VzKCkgaGVscGVyIGZ1bmN0aW9uDQo+IA0KPiBPbiAzMC4w
MS4yMDIwIDE1OjU3LCBQYXVsIER1cnJhbnQgd3JvdGU6DQo+ID4gLS0tIGEveGVuL2FyY2gveDg2
L2RvbWFpbi5jDQo+ID4gKysrIGIveGVuL2FyY2gveDg2L2RvbWFpbi5jDQo+ID4gQEAgLTIxOCw3
ICsyMTgsNyBAQCB2b2lkIGR1bXBfcGFnZWZyYW1lX2luZm8oc3RydWN0IGRvbWFpbiAqZCkNCj4g
Pg0KPiA+ICAgICAgcHJpbnRrKCJNZW1vcnkgcGFnZXMgYmVsb25naW5nIHRvIGRvbWFpbiAldTpc
biIsIGQtPmRvbWFpbl9pZCk7DQo+ID4NCj4gPiAtICAgIGlmICggZC0+dG90X3BhZ2VzID49IDEw
ICYmIGQtPmlzX2R5aW5nIDwgRE9NRFlJTkdfZGVhZCApDQo+ID4gKyAgICBpZiAoIGRvbWFpbl90
b3RfcGFnZXMoZCkgPj0gMTAgJiYgZC0+aXNfZHlpbmcgPCBET01EWUlOR19kZWFkICkNCj4gDQo+
IEJlZm9yZSBJIGdvIGFueSBmdXJ0aGVyIC0gYXJlIHlvdSBzaW1wbHkgcmVwbGFjaW5nIF9hbGxf
DQo+IC0+dG90X3BhZ2VzIHVzZXMgYnkgdGhlIG5ldyBoZWxwZXI/DQoNCkJhc2ljYWxseSwgYXBh
cnQgZnJvbSBkb21haW5fYWRqdXN0X3RvdF9wYWdlcygpLCB5ZXMuDQoNCj4gSW4gdGhlIGNhc2Ug
aGVyZSwgZm9yDQo+IGV4YW1wbGUsIEkgZG9uJ3QgdGhpbmsgdGhpcyBpcyB3aGF0IHdlIHdhbnQu
DQo+IA0KDQpXaHkgbm90PyBJIHdvdWxkIGhhdmUgdGhvdWdodCBhbnkgJ2V4dHJhJyBwYWdlcyB3
b3VsZCBhbHdheXMgYmUgb2YgaW50ZXJlc3QuDQoNCiAgUGF1bA0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
