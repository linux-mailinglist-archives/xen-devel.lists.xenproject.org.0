Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B56010C5C6
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2019 10:15:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaFrx-0000J6-Ow; Thu, 28 Nov 2019 09:13:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XtxL=ZU=amazon.com=prvs=228fc64b1=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iaFrv-0000J1-Uw
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2019 09:13:48 +0000
X-Inumbo-ID: 6201088c-11bf-11ea-83b8-bc764e2007e4
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6201088c-11bf-11ea-83b8-bc764e2007e4;
 Thu, 28 Nov 2019 09:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1574932428; x=1606468428;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HBdVvccca9D+Nml0D7dMxqZF2diPKXyjv+Evygz2PlQ=;
 b=bRvnGPvuNMlFA6nl5RJI7/pr9kjVVApv1HL7RL1F5qAEqU61s3p0oHy/
 4daOw3BZh5pwKabxm0I8mqZGDPoEVF4fkYz+yhh/01kXng+sDBQIY3qER
 mHQL5i/BBNhH1hjw9A3NbqoQOo480tubhFGLyo6srT++dmiTV93K3FCDB M=;
IronPort-SDR: h3Bx0CFA0GsY6DefqvGvp6OuPkJ1Aak36Ak/MwJ6WcU2IsAf3BfrtwqGdFnZsvWCBclGhUV/AZ
 uNsubneg8OUg==
X-IronPort-AV: E=Sophos;i="5.69,252,1571702400"; d="scan'208";a="10378476"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1e-27fb8269.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 28 Nov 2019 09:13:34 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-27fb8269.us-east-1.amazon.com (Postfix) with ESMTPS
 id D686CA1DE8; Thu, 28 Nov 2019 09:13:31 +0000 (UTC)
Received: from EX13D37EUB001.ant.amazon.com (10.43.166.31) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 28 Nov 2019 09:13:30 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D37EUB001.ant.amazon.com (10.43.166.31) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 28 Nov 2019 09:13:29 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Thu, 28 Nov 2019 09:13:29 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: "Grall, Julien" <jgrall@amazon.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2] xen/x86: vpmu: Unmap per-vCPU PMU page when the
 domain is destroyed
Thread-Index: AQHVpRpRyxiG+5Xi1Em6OapEOJI8fqefaziAgADioKA=
Date: Thu, 28 Nov 2019 09:13:29 +0000
Message-ID: <f5c65e8cee6141f8bd86afd1c3e75727@EX13D32EUC003.ant.amazon.com>
References: <20191127120046.1246-1-pdurrant@amazon.com>
 <55f189b6-2db4-e4ff-aa3a-64875678051d@amazon.com>
In-Reply-To: <55f189b6-2db4-e4ff-aa3a-64875678051d@amazon.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.244]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2] xen/x86: vpmu: Unmap per-vCPU PMU page
 when the domain is destroyed
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKdWxpZW4gR3JhbGwgPGpncmFs
bEBhbWF6b24uY29tPg0KPiBTZW50OiAyNyBOb3ZlbWJlciAyMDE5IDE5OjQyDQo+IFRvOiBEdXJy
YW50LCBQYXVsIDxwZHVycmFudEBhbWF6b24uY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnDQo+IENjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+OyBBbmRyZXcgQ29v
cGVyDQo+IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgV2VpIExpdSA8d2xAeGVuLm9yZz47
IFJvZ2VyIFBhdSBNb25uw6kNCj4gPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgSnVuIE5ha2FqaW1h
IDxqdW4ubmFrYWppbWFAaW50ZWwuY29tPjsgS2V2aW4gVGlhbg0KPiA8a2V2aW4udGlhbkBpbnRl
bC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjJdIHhlbi94ODY6IHZwbXU6IFVubWFwIHBl
ci12Q1BVIFBNVSBwYWdlIHdoZW4gdGhlDQo+IGRvbWFpbiBpcyBkZXN0cm95ZWQNCj4gDQo+IEhp
IFBhdWwsDQo+IA0KPiBPbiAyNy8xMS8yMDE5IDEyOjAwLCBQYXVsIER1cnJhbnQgd3JvdGU6DQo+
ID4gRnJvbTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4NCj4gPg0KPiA+IEEgZ3Vl
c3Qgd2lsbCBzZXR1cCBhIHNoYXJlZCBwYWdlIHdpdGggdGhlIGh5cGVydmlzb3IgZm9yIGVhY2gg
dkNQVSB2aWENCj4gPiBYRU5QTVVfaW5pdC4gVGhlIHBhZ2Ugd2lsbCB0aGVuIGdldCBtYXBwZWQg
aW4gdGhlIGh5cGVydmlzb3IgYW5kIG9ubHkNCj4gPiByZWxlYXNlZCB3aGVuIFhFTlBNVV9maW5p
c2ggaXMgY2FsbGVkLg0KPiA+DQo+ID4gVGhpcyBtZWFucyB0aGF0IGlmIHRoZSBndWVzdCBmYWls
cyB0byBpbnZva2UgWEVOUE1VX2ZpbmlzaCwgZS5nIGlmIGl0IGlzDQo+ID4gZGVzdHJveWVkIHJh
dGhlciB0aGFuIGNsZWFubHkgc2h1dCBkb3duLCB0aGUgcGFnZSB3aWxsIHN0YXkgbWFwcGVkIGlu
DQo+IHRoZQ0KPiA+IGh5cGVydmlzb3IuIE9uZSBvZiB0aGUgY29uc2VxdWVuY2VzIGlzIHRoZSBk
b21haW4gY2FuIG5ldmVyIGJlIGZ1bGx5DQo+ID4gZGVzdHJveWVkIGFzIGEgcGFnZSByZWZlcmVu
Y2UgaXMgc3RpbGwgaGVsZC4NCj4gPg0KPiA+IEFzIFhlbiBzaG91bGQgbmV2ZXIgcmVseSBvbiB0
aGUgZ3Vlc3QgdG8gY29ycmVjdGx5IGNsZWFuLXVwIGFueQ0KPiA+IGFsbG9jYXRpb24gaW4gdGhl
IGh5cGVydmlzb3IsIHdlIHNob3VsZCBhbHNvIHVubWFwIHN1Y2ggcGFnZXMgZHVyaW5nIHRoZQ0K
PiA+IGRvbWFpbiBkZXN0cnVjdGlvbiBpZiB0aGVyZSBhcmUgYW55IGxlZnQuDQo+ID4NCj4gPiBX
ZSBjYW4gcmUtdXNlIHRoZSBzYW1lIGxvZ2ljIGFzIGluIHB2cG11X2ZpbmlzaCgpLiBUbyBhdm9p
ZA0KPiA+IGR1cGxpY2F0aW9uLCBtb3ZlIHRoZSBsb2dpYyBpbiBhIG5ldyBmdW5jdGlvbiB0aGF0
IGNhbiBhbHNvIGJlIGNhbGxlZA0KPiA+IGZyb20gdnBtdV9kZXN0cm95KCkuDQo+ID4NCj4gPiBO
T1RFOiBUaGUgY2FsbCB0byB2cG11X2Rlc3Ryb3koKSBtdXN0IGFsc28gYmUgbW92ZWQgZnJvbQ0K
PiA+ICAgICAgICBhcmNoX3ZjcHVfZGVzdHJveSgpIGludG8gZG9tYWluX3JlbGlucXVpc2hfcmVz
b3VyY2VzKCkgc3VjaCB0aGF0DQo+IHRoZQ0KPiA+ICAgICAgICByZWZlcmVuY2Ugb24gdGhlIG1h
cHBlZCBwYWdlIGRvZXMgbm90IHByZXZlbnQgZG9tYWluX2Rlc3Ryb3koKQ0KPiAod2hpY2gNCj4g
PiAgICAgICAgY2FsbHMgYXJjaF92Y3B1X2Rlc3Ryb3koKSkgZnJvbSBiZWluZyBjYWxsZWQuDQo+
ID4gICAgICAgIEFsc28sIHdoaWxzIGl0IGFwcGVhcnMgdGhhdCB2cG11X2FyY2hfZGVzdHJveSgp
IGlzIGlkZW1wb3RlbnQgaXQNCj4gaXMNCj4gPiAgICAgICAgYnkgbm8gbWVhbnMgb2J2aW91cy4g
SGVuY2UgbW92ZSBtYW5pcHVsYXRpb24gb2YgdGhlDQo+ID4gICAgICAgIFZQTVVfQ09OVEVYVF9B
TExPQ0FURUQgZmxhZyBvdXQgb2YgaW1wbGVtZW50YXRpb24gc3BlY2lmaWMgY29kZQ0KPiBhbmQN
Cj4gPiAgICAgICAgbWFrZSBzdXJlIGl0IGlzIGNsZWFyZWQgYXQgdGhlIGVuZCBvZiB2cG11X2Fy
Y2hfZGVzdHJveSgpLg0KPiANCj4gSWYgeW91IHJlc2VuZCB0aGUgcGF0Y2gsIGl0IG1pZ2h0IGJl
IHdvcnRoIHRvIGFkZCBhIGxpbmUgYWJvdXQgdGhlIGxhY2sNCj4gb2YgWFNBLiBTb21ldGhpbmcg
bGlrZToNCj4gDQo+IFRoZXJlIGlzIG5vIGFzc29jaWF0ZWQgWFNBIGJlY2F1c2UgdlBNVSAgaXMg
bm90IHNlY3VyaXR5IHN1cHBvcnRlZCAoc2VlDQo+IFhTQS0xNjMpLg0KDQpTdXJlLCBJJ2xsIGFk
ZCBhbm90aGVyIG5vdGUuDQoNCiAgUGF1bA0KDQo+IA0KPiBDaGVlcnMsDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
