Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20961241A0D
	for <lists+xen-devel@lfdr.de>; Tue, 11 Aug 2020 13:01:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k5S1a-0003jx-Kq; Tue, 11 Aug 2020 11:00:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dQ7p=BV=amazon.co.uk=prvs=4859a24f2=pdurrant@srs-us1.protection.inumbo.net>)
 id 1k5S1Z-0003jJ-Jp
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2020 11:00:57 +0000
X-Inumbo-ID: a84c7a9e-f4af-436b-9f13-6eed982c443c
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a84c7a9e-f4af-436b-9f13-6eed982c443c;
 Tue, 11 Aug 2020 11:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1597143658; x=1628679658;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version:subject;
 bh=VFAkOWfGUFeZAtUOuX1DH507ncy3lX8XnYqwIUHbuDk=;
 b=teGTl3EnArU67inDblW2a3S5kScczmZi+ikncl3MY6SQ7b4xZxzV6456
 ed15kNsV9HEuXhyNmVthOE0nbQazQDAMZn4wChYDF1FC0F9JIlgBSts2i
 Fq6ZsyQpHq1ZSTtOUP10RYYnkX2VBS+Ou/fTFvOP7uOFnVvt+WzNxbMhc w=;
IronPort-SDR: gzC/PiIP3VEtjEAVh0x3NUws9q3FU6FwaPlG6FZhqtTxI7KE3MwzZ84Kozv12NBPUD+sqQL8ZM
 V6uQZNpS589g==
X-IronPort-AV: E=Sophos;i="5.75,461,1589241600"; d="scan'208";a="67096258"
Subject: RE: [PATCH v4 07/14] iommu: make map,
 unmap and flush all take both an order and a count
Thread-Topic: [PATCH v4 07/14] iommu: make map,
 unmap and flush all take both an order and a count
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-90c42d1d.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 11 Aug 2020 11:00:53 +0000
Received: from EX13MTAUEB002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2a-90c42d1d.us-west-2.amazon.com (Postfix) with ESMTPS
 id 3C065A1EDB; Tue, 11 Aug 2020 11:00:51 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEB002.ant.amazon.com (10.43.60.12) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 11 Aug 2020 11:00:50 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 11 Aug 2020 11:00:50 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Tue, 11 Aug 2020 11:00:50 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>
Thread-Index: AQGtxlp5X/CuH2IzEhv/FXA8KDRK/wFN71RZAN9g+ampcqV+wA==
Date: Tue, 11 Aug 2020 11:00:49 +0000
Message-ID: <4e471f94ed7b4fa7a98d43334abab27e@EX13D32EUC003.ant.amazon.com>
References: <20200804134209.8717-1-paul@xen.org>
 <20200804134209.8717-8-paul@xen.org>
 <2765087f-4168-191d-c547-cbc2e74d3fee@suse.com>
In-Reply-To: <2765087f-4168-191d-c547-cbc2e74d3fee@suse.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jun
 Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDA2IEF1Z3VzdCAyMDIwIDEwOjU3DQo+IFRvOiBQYXVsIER1
cnJhbnQgPHBhdWxAeGVuLm9yZz4NCj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZzsgRHVycmFudCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPjsgSnVuIE5ha2FqaW1hDQo+
IDxqdW4ubmFrYWppbWFAaW50ZWwuY29tPjsgS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5j
b20+OyBBbmRyZXcgQ29vcGVyDQo+IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgR2Vvcmdl
IER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPjsgV2VpIExpdSA8d2xAeGVuLm9yZz47
IFJvZ2VyIFBhdQ0KPiBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgSWFuIEphY2tzb24g
PGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+OyBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3Jn
PjsNCj4gU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgVm9sb2R5
bXlyIEJhYmNodWsgPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPg0KPiBTdWJqZWN0OiBSRTog
W0VYVEVSTkFMXSBbUEFUQ0ggdjQgMDcvMTRdIGlvbW11OiBtYWtlIG1hcCwgdW5tYXAgYW5kIGZs
dXNoIGFsbCB0YWtlIGJvdGggYW4gb3JkZXIgYW5kIGENCj4gY291bnQNCj4gDQo+IENBVVRJT046
IFRoaXMgZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2YgdGhlIG9yZ2FuaXphdGlvbi4g
RG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4NCj4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBjYW4g
Y29uZmlybSB0aGUgc2VuZGVyIGFuZCBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUuDQo+IA0KPiAN
Cj4gDQo+IE9uIDA0LjA4LjIwMjAgMTU6NDIsIFBhdWwgRHVycmFudCB3cm90ZToNCj4gPiBGcm9t
OiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+DQo+ID4NCj4gPiBBdCB0aGUgbW9t
ZW50IGlvbW11X21hcCgpIGFuZCBpb21tdV91bm1hcCgpIHRha2UgYSBwYWdlIG9yZGVyIGJ1dCBu
b3QgYQ0KPiA+IGNvdW50LCB3aGVyZWFzIGlvbW11X2lvdGxiX2ZsdXNoKCkgdGFrZXMgYSBjb3Vu
dCBidXQgbm90IGEgcGFnZSBvcmRlci4NCj4gPiBUaGlzIHBhdGNoIHNpbXBseSBtYWtlcyB0aGVt
IGNvbnNpc3RlbnQgd2l0aCBlYWNoIG90aGVyLg0KPiANCj4gV2h5IGNhbid0IHdlIGRvIHdpdGgg
anVzdCBhIGNvdW50LCB3aGVyZSBvcmRlciBnZXRzIHdvcmtlZCBvdXQgYnkNCj4gZnVuY3Rpb25z
IGtub3dpbmcgaG93IHRvIC8gd2FudGluZyB0byBkZWFsIHdpdGggaGlnaGVyIG9yZGVyIHBhZ2Vz
Pw0KPiANCg0KWWVzLCB0aGF0IG1heSB3ZWxsIGJlIGJldHRlci4gVGhlIG9yZGVyIG9mIHRoZSBD
UFUgbWFwcGluZ3MgaXNuJ3QgcmVhbGx5IHJlbGV2YW50IGNhc2VzIHdoZXJlIHRoZSBJT01NVSB1
c2VzIGRpZmZlcmVudCBwYWdlIG9yZGVycy4gSSdsbCBqdXN0IG1vdmUgZXZlcnl0aGluZyBvdmVy
IHRvIGEgcGFnZSBjb3VudC4NCg0KICBQYXVsDQoNCj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvbW0v
cDJtLWVwdC5jDQo+ID4gKysrIGIveGVuL2FyY2gveDg2L21tL3AybS1lcHQuYw0KPiA+IEBAIC04
NDMsNyArODQzLDcgQEAgb3V0Og0KPiA+ICAgICAgICAgICBuZWVkX21vZGlmeV92dGRfdGFibGUg
KQ0KPiA+ICAgICAgew0KPiA+ICAgICAgICAgIGlmICggaW9tbXVfdXNlX2hhcF9wdChkKSApDQo+
ID4gLSAgICAgICAgICAgIHJjID0gaW9tbXVfaW90bGJfZmx1c2goZCwgX2RmbihnZm4pLCAoMXUg
PDwgb3JkZXIpLA0KPiA+ICsgICAgICAgICAgICByYyA9IGlvbW11X2lvdGxiX2ZsdXNoKGQsIF9k
Zm4oZ2ZuKSwgKDF1IDw8IG9yZGVyKSwgMSwNCj4gDQo+IEZvcmdvdCB0byBkcm9wIHRoZSAiMSA8
PCAiPyAoVGhlcmUgYXJlIHRoZW4gSSB0aGluayB0d28gbW9yZSBpbnN0YW5jZXMNCj4gZnVydGhl
ciBkb3duLikNCj4gDQo+ID4gLS0tIGEveGVuL2NvbW1vbi9tZW1vcnkuYw0KPiA+ICsrKyBiL3hl
bi9jb21tb24vbWVtb3J5LmMNCj4gPiBAQCAtODUxLDEyICs4NTEsMTIgQEAgaW50IHhlbm1lbV9h
ZGRfdG9fcGh5c21hcChzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgeGVuX2FkZF90b19waHlzbWFw
ICp4YXRwLA0KPiA+DQo+ID4gICAgICAgICAgdGhpc19jcHUoaW9tbXVfZG9udF9mbHVzaF9pb3Rs
YikgPSAwOw0KPiA+DQo+ID4gLSAgICAgICAgcmV0ID0gaW9tbXVfaW90bGJfZmx1c2goZCwgX2Rm
bih4YXRwLT5pZHggLSBkb25lKSwgZG9uZSwNCj4gPiArICAgICAgICByZXQgPSBpb21tdV9pb3Rs
Yl9mbHVzaChkLCBfZGZuKHhhdHAtPmlkeCAtIGRvbmUpLCAwLCBkb25lLA0KPiANCj4gQXJndW1l
bnRzIHdyb25nIHdheSByb3VuZD8gKFRoaXMgcmlzayBvZiBpbnZlcnRpbmcgdGhlaXIgb3JkZXIg
aXMNCj4gb25lIG9mIHRoZSBwcmltYXJ5IHJlYXNvbnMgd2h5IEkgdGhpbmsgd2Ugd2FudCBqdXN0
IGEgY291bnQuKSBJJ20NCj4gYWxzbyB1bmNlcnRhaW4gYWJvdXQgdGhlIHVzZSBvZiAwIHZzIFBB
R0VfT1JERVJfNEsgaGVyZS4NCj4gDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgSU9NTVVfRkxVU0hGX2FkZGVkIHwgSU9NTVVfRkxVU0hGX21vZGlmaWVkKTsNCj4gPiAgICAg
ICAgICBpZiAoIHVubGlrZWx5KHJldCkgJiYgcmMgPj0gMCApDQo+ID4gICAgICAgICAgICAgIHJj
ID0gcmV0Ow0KPiA+DQo+ID4gLSAgICAgICAgcmV0ID0gaW9tbXVfaW90bGJfZmx1c2goZCwgX2Rm
bih4YXRwLT5ncGZuIC0gZG9uZSksIGRvbmUsDQo+ID4gKyAgICAgICAgcmV0ID0gaW9tbXVfaW90
bGJfZmx1c2goZCwgX2Rmbih4YXRwLT5ncGZuIC0gZG9uZSksIDAsIGRvbmUsDQo+IA0KPiBTYW1l
IGhlcmUgdGhlbi4NCj4gDQo+IEphbg0K

