Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6AE10D462
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 11:50:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iadpj-0003Oa-CY; Fri, 29 Nov 2019 10:49:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3pi/=ZV=amazon.com=prvs=22965b742=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iadpi-0003OP-Ao
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 10:49:06 +0000
X-Inumbo-ID: dcfda7ee-1295-11ea-a55d-bc764e2007e4
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dcfda7ee-1295-11ea-a55d-bc764e2007e4;
 Fri, 29 Nov 2019 10:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575024547; x=1606560547;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kkeipclrz5WsLlZjVA5TScPPMNXHIQa9YP1YORX9WEc=;
 b=pdUT4t5cqvVF0kD4Ek3b8hTTayRNsqdd6viFyulFC0fx8m40CErQXTci
 MSQ0KkSDGzANYLNNYdRPehPfi7zhD5LYtdwCChYGJMZ4zpKcfxK2Qn6ze
 /Suq+bpzCjWyrSOV8bIGa3w/C82zHiOWFlU5DjBq78p1wtGID5JhzU+PF w=;
IronPort-SDR: mSeVqnuN0RpOJtevKze2TSz52msPI0jxGTongpAN4KnD+8ymuzuf0FQRosmNq7O9g0NQZd3f3c
 e5Cr/anQIxOA==
X-IronPort-AV: E=Sophos;i="5.69,257,1571702400"; d="scan'208";a="10553789"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-74cf8b49.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 29 Nov 2019 10:48:55 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-74cf8b49.us-east-1.amazon.com (Postfix) with ESMTPS
 id E2C0CC0B8A; Fri, 29 Nov 2019 10:48:49 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 29 Nov 2019 10:48:49 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 29 Nov 2019 10:48:48 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Fri, 29 Nov 2019 10:48:48 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH-for-4.13 v5] Rationalize max_grant_frames and
 max_maptrack_frames handling
Thread-Index: AQHVpgw4W1UbyWJxu02lwfLbqnwkDKeh8cuAgAABpoCAAAIC4IAAAumAgAAANnA=
Date: Fri, 29 Nov 2019 10:48:47 +0000
Message-ID: <0b6c26e0f52f4e97b56bb51811ec80a0@EX13D32EUC003.ant.amazon.com>
References: <20191128165224.2959-1-pdurrant@amazon.com>
 <98816869-c1db-52c1-baba-b878cde88d7a@suse.com>
 <350c285e-424e-a722-b340-dbd3ea08c12f@suse.com>
 <4819dbb83d9a43bb9ea37fbe79d57941@EX13D32EUC003.ant.amazon.com>
 <0eede9aa-acd5-0f68-24ae-efa8cadec5b1@suse.com>
In-Reply-To: <0eede9aa-acd5-0f68-24ae-efa8cadec5b1@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.244]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH-for-4.13 v5] Rationalize max_grant_frames
 and max_maptrack_frames handling
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
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
 <marmarek@invisiblethingslab.com>, Anthony PERARD <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDI5IE5vdmVtYmVyIDIwMTkgMTA6NDYNCj4gVG86IER1cnJh
bnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jb20+DQo+IENjOiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPjsgQW50aG9ueSBQRVJBUkQNCj4gPGFudGhvbnkucGVyYXJk
QGNpdHJpeC5jb20+OyBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+Ow0K
PiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IFZvbG9keW15ciBCYWJj
aHVrDQo+IDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT47IEdlb3JnZSBEdW5sYXAgPEdlb3Jn
ZS5EdW5sYXBAZXUuY2l0cml4LmNvbT47DQo+IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5j
aXRyaXguY29tPjsgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpDQo+IDxtYXJtYXJla0BpbnZp
c2libGV0aGluZ3NsYWIuY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pDQo+IDxzc3RhYmVsbGluaUBr
ZXJuZWwub3JnPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBLb25yYWQgUnplc3p1
dGVrDQo+IFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+OyBKdWxpZW4gR3JhbGwgPGp1bGll
bkB4ZW4ub3JnPjsgV2VpIExpdQ0KPiA8d2xAeGVuLm9yZz4NCj4gU3ViamVjdDogUmU6IFtQQVRD
SC1mb3ItNC4xMyB2NV0gUmF0aW9uYWxpemUgbWF4X2dyYW50X2ZyYW1lcyBhbmQNCj4gbWF4X21h
cHRyYWNrX2ZyYW1lcyBoYW5kbGluZw0KPiANCj4gT24gMjkuMTEuMjAxOSAxMTozOSwgRHVycmFu
dCwgUGF1bCB3cm90ZToNCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJv
bTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiA+PiBTZW50OiAyOSBOb3ZlbWJl
ciAyMDE5IDEwOjI5DQo+ID4+IFRvOiBEdXJyYW50LCBQYXVsIDxwZHVycmFudEBhbWF6b24uY29t
Pg0KPiA+PiBDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IEFu
dGhvbnkgUEVSQVJEDQo+ID4+IDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPjsgR2VvcmdlIER1
bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPjsNCj4gPj4gUm9nZXIgUGF1IE1vbm7DqSA8
cm9nZXIucGF1QGNpdHJpeC5jb20+OyBWb2xvZHlteXIgQmFiY2h1aw0KPiA+PiA8Vm9sb2R5bXly
X0JhYmNodWtAZXBhbS5jb20+OyBHZW9yZ2UgRHVubGFwDQo+IDxHZW9yZ2UuRHVubGFwQGV1LmNp
dHJpeC5jb20+Ow0KPiA+PiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT47
IE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraQ0KPiA+PiA8bWFybWFyZWtAaW52aXNpYmxldGhp
bmdzbGFiLmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaQ0KPiA+PiA8c3N0YWJlbGxpbmlAa2VybmVs
Lm9yZz47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgS29ucmFkDQo+IFJ6ZXN6dXRl
aw0KPiA+PiBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPjsgSnVsaWVuIEdyYWxsIDxqdWxp
ZW5AeGVuLm9yZz47IFdlaSBMaXUNCj4gPj4gPHdsQHhlbi5vcmc+DQo+ID4+IFN1YmplY3Q6IFJl
OiBbUEFUQ0gtZm9yLTQuMTMgdjVdIFJhdGlvbmFsaXplIG1heF9ncmFudF9mcmFtZXMgYW5kDQo+
ID4+IG1heF9tYXB0cmFja19mcmFtZXMgaGFuZGxpbmcNCj4gPj4NCj4gPj4gT24gMjkuMTEuMjAx
OSAxMToyMiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+ID4+PiBPbiAyOC4xMS4yMDE5IDE3OjUyLCBQ
YXVsIER1cnJhbnQgd3JvdGU6DQo+ID4+Pj4gLS0tIGEveGVuL2NvbW1vbi9ncmFudF90YWJsZS5j
DQo+ID4+Pj4gKysrIGIveGVuL2NvbW1vbi9ncmFudF90YWJsZS5jDQo+ID4+Pj4gQEAgLTg0LDEx
ICs4NCw0MCBAQCBzdHJ1Y3QgZ3JhbnRfdGFibGUgew0KPiA+Pj4+ICAgICAgc3RydWN0IGdyYW50
X3RhYmxlX2FyY2ggYXJjaDsNCj4gPj4+PiAgfTsNCj4gPj4+Pg0KPiA+Pj4+ICtzdGF0aWMgaW50
IHBhcnNlX2dudHRhYl9saW1pdChjb25zdCBjaGFyICpwYXJhbSwgY29uc3QgY2hhciAqYXJnLA0K
PiA+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgKnZhbHAp
DQo+ID4+Pj4gK3sNCj4gPj4+PiArICAgIGNvbnN0IGNoYXIgKmU7DQo+ID4+Pj4gKyAgICB1bnNp
Z25lZCBsb25nIHZhbDsNCj4gPj4+PiArDQo+ID4+Pj4gKyAgICB2YWwgPSBzaW1wbGVfc3RydG91
bChhcmcsICZlLCAwKTsNCj4gPj4+PiArICAgIGlmICggKmUgKQ0KPiA+Pj4+ICsgICAgICAgIHJl
dHVybiAtRUlOVkFMOw0KPiA+Pj4+ICsNCj4gPj4+PiArICAgIGlmICggdmFsID4gSU5UX01BWCAp
DQo+ID4+Pj4gKyAgICAgICAgcmV0dXJuIC1FUkFOR0U7DQo+ID4+Pj4gKw0KPiA+Pj4+ICsgICAg
cmV0dXJuIDA7DQo+ID4+Pj4gK30NCj4gPj4+DQo+ID4+PiAqdmFscCBkb2Vzbid0IGdldCB3cml0
dGVuIHRvIGFueW1vcmUuDQo+ID4NCj4gPiBUaGF0IHdhcyBpbnRlbnRpb25hbCwgZ2l2ZW4gSnVl
cmdlbidzIGNvbW1lbnQuLi4NCj4gPg0KPiA+PiBXaXRoIHRoaXMgZml4ZWQgKGFuZCBubyBuZXcN
Cj4gPj4+IGlzc3VlcyBpbnRyb2R1Y2VkIDstKSApIGh5cGVydmlzb3Igc2lkZQ0KPiA+Pj4gUmV2
aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gPj4NCj4gPj4gQW5k
IEkgZ3Vlc3MgSSBzaG91bGQgaGF2ZSBjbGFyaWZpZWQ6IEknZCBiZSBmaW5lIGFkZGluZyB0aGUg
bWlzc2luZw0KPiA+PiBhc3NpZ25tZW50IHdoaWxlIGNvbW1pdHRpbmcsIHByb3ZpZGVkIHRoZSB0
b29scyBzaWRlIHdvbid0IHJlcXVpcmUNCj4gPj4gYW55IGNoYW5nZXMuDQo+ID4NCj4gPiAuLi5i
dXQgaWYgd2Ugd2FudCB0byBhbGxvdyBkb20wIHRvIHNldCBpdHNlbGYgdXAgZm9yIElOVF9NQVgg
ZnJhbWVzDQo+ID4gaW4gdGhlIGV2ZW50IG9mIGEgYmFkIHZhbHVlIHRoZW4gSSdtIG5vdCBvYmpl
Y3RpbmcuDQo+IA0KPiBMb29rcyBsaWtlIHlvdSdyZSBtaXN1bmRlcnN0YW5kaW5nLCBvciBJJ20g
bWlzc2luZyBzb21ldGhpbmc6DQo+IFRoZSBjb21tYW5kIGxpbmUgb3B0aW9ucyByaWdodCBub3cg
d29uJ3QgdGFrZSBhbnkgZWZmZWN0LCBhcw0KPiB0aGUgb3B0XyogZ2xvYmFsIHZhcmlhYmxlcyB3
b24ndCBiZSB3cml0dGVuIHRvIGF0IGFsbC4gSSdtIG5vdA0KPiB0YWtpbmcgYWJvdXQgZmFsbGlu
ZyBiYWNrIHRvIHVzaW5nIElOVF9NQVggd2hlbiB3ZSd2ZSBub3RpY2VkDQo+IGFuIG91dCBvZiBi
b3VuZHMgdmFsdWUuDQoNCk9oLCBzb3JyeS4uLiB0b28gZGVlcCB3aXRoIG15IGN1dHRpbmcuIFll
cywgb2YgY291cnNlIHRoZXJlIHNob3VsZCBiZSBhICcqdmFscCA9IHZhbCcganVzdCBhYm92ZSAn
cmV0dXJuIDAnLg0KDQogIFBhdWwNCg0KPiANCj4gSmFuDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
