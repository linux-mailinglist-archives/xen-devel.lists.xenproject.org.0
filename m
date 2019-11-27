Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2767E10AEAE
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 12:27:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZvSR-0002vh-J4; Wed, 27 Nov 2019 11:26:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=J2FP=ZT=amazon.com=prvs=227ebe4de=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iZvSQ-0002vc-8V
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 11:26:06 +0000
X-Inumbo-ID: b3a64182-1108-11ea-a55d-bc764e2007e4
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b3a64182-1108-11ea-a55d-bc764e2007e4;
 Wed, 27 Nov 2019 11:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1574853967; x=1606389967;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=j3RPptftDelcYodGbHt7LuxC3VEDBUBi5gXE3JZyLz8=;
 b=KWuMdjI2ai4/iFH8X/yZmrLcIkvbRI4xfWq/LS4446DMgWVhKF2r/Ir6
 AA6EWWkeJKJqwC4eeK326E9H5PG9fqaSVp1zexQJu4c6XOsr7/M6TpTgW
 sWD+PtYgvkqoxLrihu1TtsTjaqu44n6yy0lIfeV+Al23xi3zZ0a8eFTBS c=;
IronPort-SDR: dPsQhnVNxSg7+LgeUTZ/+LWBJiFYvn77hEwXZk61VT9Kt1M5qDs94Hfk4caXYfCJ1VY++2L3TN
 D1qnhTKP/7xg==
X-IronPort-AV: E=Sophos;i="5.69,249,1571702400"; 
   d="scan'208";a="6061711"
Received: from iad6-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2a-6e2fc477.us-west-2.amazon.com) ([10.124.125.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 27 Nov 2019 11:26:05 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-6e2fc477.us-west-2.amazon.com (Postfix) with ESMTPS
 id 109A7A1D64; Wed, 27 Nov 2019 11:26:04 +0000 (UTC)
Received: from EX13D37EUB002.ant.amazon.com (10.43.166.116) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 27 Nov 2019 11:26:03 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D37EUB002.ant.amazon.com (10.43.166.116) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 27 Nov 2019 11:26:02 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Wed, 27 Nov 2019 11:26:02 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: "Grall, Julien" <jgrall@amazon.com>, Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH] xen/x86: vpmu: Unmap per-vCPU PMU page when the domain
 is destroyed
Thread-Index: AQHVpH1ftFFPr4jWeUChNo7fRMGTK6eexXcAgAAZWgCAAALIcA==
Date: Wed, 27 Nov 2019 11:26:02 +0000
Message-ID: <4c93b7d05a6046889f71a65c1ea25d97@EX13D32EUC003.ant.amazon.com>
References: <20191126171715.10881-1-pdurrant@amazon.com>
 <afa87ca4-ecda-82d7-7c99-4dcf807ddd6d@suse.com>
 <06f26e5b-d921-1796-391e-d0ec2ae0a3a4@amazon.com>
In-Reply-To: <06f26e5b-d921-1796-391e-d0ec2ae0a3a4@amazon.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.244]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH] xen/x86: vpmu: Unmap per-vCPU PMU page when
 the domain is destroyed
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKdWxpZW4gR3JhbGwgPGpncmFs
bEBhbWF6b24uY29tPg0KPiBTZW50OiAyNyBOb3ZlbWJlciAyMDE5IDExOjE1DQo+IFRvOiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+OyBEdXJyYW50LCBQYXVsIDxwZHVycmFudEBhbWF6
b24uY29tPg0KPiBDYzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBBbmRyZXcgQ29v
cGVyDQo+IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgUm9nZXIgUGF1IE1vbm7DqSA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+OyBXZWkNCj4gTGl1IDx3bEB4ZW4ub3JnPg0KPiBTdWJqZWN0OiBS
ZTogW1BBVENIXSB4ZW4veDg2OiB2cG11OiBVbm1hcCBwZXItdkNQVSBQTVUgcGFnZSB3aGVuIHRo
ZQ0KPiBkb21haW4gaXMgZGVzdHJveWVkDQo+IA0KPiBIaSwNCj4gDQo+IE9uIDI3LzExLzIwMTkg
MDk6NDQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiA+IE9uIDI2LjExLjIwMTkgMTg6MTcsIFBhdWwg
RHVycmFudCB3cm90ZToNCj4gPj4gRnJvbTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNv
bT4NCj4gPj4NCj4gPj4gQSBndWVzdCB3aWxsIHNldHVwIGEgc2hhcmVkIHBhZ2Ugd2l0aCB0aGUg
aHlwZXJ2aXNvciBmb3IgZWFjaCB2Q1BVIHZpYQ0KPiA+PiBYRU5QTVVfaW5pdC4gVGhlIHBhZ2Ug
d2lsbCB0aGVuIGdldCBtYXBwZWQgaW4gdGhlIGh5cGVydmlzb3IgYW5kIG9ubHkNCj4gPj4gcmVs
ZWFzZWQgd2hlbiBYRU1QTVVfZmluaXNoIGlzIGNhbGxlZC4NCj4gPj4NCj4gPj4gVGhpcyBtZWFu
cyB0aGF0IGlmIHRoZSBndWVzdCBpcyBub3Qgc2h1dGRvd24gZ3JhY2VmdWxseSAoc3VjaCBhcyB2
aWEgeGwNCj4gPj4gZGVzdHJveSksIHRoZSBwYWdlIHdpbGwgc3RheSBtYXBwZWQgaW4gdGhlIGh5
cGVydmlzb3IuDQo+ID4NCj4gPiBJc24ndCB0aGlzIHN0aWxsIHRvbyB3ZWFrIGEgZGVzY3JpcHRp
b24/IEl0J3Mgbm90IHRoZSB0b29sIHN0YWNrDQo+ID4gaW52b2tpbmcgWEVOUE1VX2ZpbmlzaCwg
YnV0IHRoZSBndWVzdCBpdHNlbGYgYWZhaWNzLiBJLmUuIGENCj4gPiBtaXNiZWhhdmluZyBndWVz
dCBjb3VsZCBwcmV2ZW50IHByb3BlciBjbGVhbnVwIGV2ZW4gd2l0aCBncmFjZWZ1bA0KPiA+IHNo
dXRkb3duLg0KPiA+DQo+ID4+IEBAIC0yMjI0LDYgKzIyMjEsOSBAQCBpbnQgZG9tYWluX3JlbGlu
cXVpc2hfcmVzb3VyY2VzKHN0cnVjdCBkb21haW4gKmQpDQo+ID4+ICAgICAgIGlmICggaXNfaHZt
X2RvbWFpbihkKSApDQo+ID4+ICAgICAgICAgICBodm1fZG9tYWluX3JlbGlucXVpc2hfcmVzb3Vy
Y2VzKGQpOw0KPiA+Pg0KPiA+PiArICAgIGZvcl9lYWNoX3ZjcHUgKCBkLCB2ICkNCj4gPj4gKyAg
ICAgICAgdnBtdV9kZXN0cm95KHYpOw0KPiA+PiArDQo+ID4+ICAgICAgIHJldHVybiAwOw0KPiA+
PiAgIH0NCj4gPg0KPiA+IEkgdGhpbmsgc2ltcGxlIHRoaW5ncyB3aGljaCBtYXkgYWxsb3cgc2hy
aW5raW5nIHRoZSBwYWdlIGxpc3RzDQo+ID4gc2hvdWxkIGJlIGRvbmUgZWFybHkgaW4gdGhlIGZ1
bmN0aW9uLiBBcyB2cG11X2Rlc3Ryb3koKSBsb29rcw0KPiA+IHRvIGJlIGlkZW1wb3RlbnQsIGhv
dyBhYm91dCBsZXZlcmFnaW5nIHRoZSB2ZXJ5IGZpcnN0DQo+ID4gZm9yX2VhY2hfdmNwdSgpIGxv
b3AgaW4gdGhlIGZ1bmN0aW9uICh0aGVyZSBhcmUgdG9vIG1hbnkgb2YgdGhlbQ0KPiA+IHRoZXJl
IGFueXdheSwgYXQgbGVhc3QgZm9yIG15IHRhc3RlKT8NCj4gDQo+IFRoaXMgaXMgbm90IGVudGly
ZWx5IG9idmlvdXMgdGhhdCB2cG11X2Rlc3Ryb3koKSBpcyBpZGVtcG90ZW50Lg0KPiANCj4gRm9y
IGluc3RhbmNlLCBJIGNhbid0IGZpbmQgb3V0IHdobyBpcyBjbGVhcmluZyBWQ1BVX0NPTlRFWFRf
QUxMT0NBVEVELg0KPiBzbyBJIHRoaW5rIHZjcHVfYXJjaF9kZXN0cm95KCkgd291bGQgYmUgZXhl
Y3V0ZWQgb3ZlciBhbmQgb3Zlci4NCj4gDQo+IEkgZG9uJ3Qga25vdyB3aGV0aGVyIHRoaXMgaXMg
YW4gaXNzdWUsIGJ1dCBJIGNhbid0IGZpZ3VyZSBvdXQgdGhhdCBpcyBpdA0KPiBub3Qgb25lLiBE
aWQgSSBtaXNzIGFueXRoaW5nPw0KDQpJdCdzIHN1ZmZpY2llbnRseSB1bm9idmlvdXMgdGhhdCBp
dCBpcyBhIGNvbmNlcm4gd2hldGhlciBhIGd1ZXN0IGludm9raW5nIFhFTlBNVV9maW5pc2ggbXVs
dGlwbGUgdGltZXMgY2FuIGNhdXNlIGhhcm0uIEknbGwgc2VlIGlmIEkgY2FuIGNsZWFuIHRoYXQg
dXAuDQoNCiAgUGF1bA0KDQo+IA0KPiBDaGVlcnMsDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
