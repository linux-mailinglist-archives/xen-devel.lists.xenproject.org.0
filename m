Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2161C5AD3
	for <lists+xen-devel@lfdr.de>; Tue,  5 May 2020 17:16:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVzIe-0000es-TL; Tue, 05 May 2020 15:16:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GqFM=6T=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1jVzId-0000en-S8
 for xen-devel@lists.xenproject.org; Tue, 05 May 2020 15:15:59 +0000
X-Inumbo-ID: 529e26c6-8ee3-11ea-ae69-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 529e26c6-8ee3-11ea-ae69-bc764e2007e4;
 Tue, 05 May 2020 15:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588691758;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=liSVRsl0Xx4iwB/mkVtl/D04ZJpCKai472FPetG79Xo=;
 b=HLM0ywOF+LaTbILswg4skTAE/2S+YnJxTUsSUWC4xacm/6PLMv2g/7cF
 sz740f/KNM8PQf17WJ3TkZ0oa+HfUvR6qJo7+i70qzP76vIoUCmfhaJ6T
 y5XBI+hDIS3z4o784Y4eC/Fz3bmQy12eKl++GCaHWA9M4ub8+CLgdpctg I=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=edvin.torok@citrix.com;
 spf=Pass smtp.mailfrom=edvin.torok@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 edvin.torok@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="edvin.torok@citrix.com";
 x-sender="edvin.torok@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 edvin.torok@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="edvin.torok@citrix.com";
 x-sender="edvin.torok@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="edvin.torok@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: lckBtrF/ypPuUEq9XWclWdz7AAnbRDq4pjkpAFDBuSXq30E1YAVRXb/T7qg9nMvjFzPkMBFFyy
 sje0kAX/OD432QyVSYhUSnOlWgLQF904kZa6ZCjFbYkmAEBzJLphWnTCIg2KQoSpT/6Jzx+btu
 2lLBYPolzp1uxz5qsCn+w3YsbCHJR62XYEBOiEzBq1U1+7veS4m1qvLQXNFbX7qzhJLp9qXgMn
 sx4RehsK69cf2KD4/jZPIUgKRKUtu987AvZnRUMdFXVIJLWpIo02b5Vg9Q3AvnwkY8NcjuVvUV
 WDI=
X-SBRS: 2.7
X-MesageID: 17479141
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,355,1583211600"; d="scan'208";a="17479141"
From: Edwin Torok <edvin.torok@citrix.com>
To: "jgross@suse.com" <jgross@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v5] docs/designs: re-work the xenstore migration
 document...
Thread-Topic: [PATCH v5] docs/designs: re-work the xenstore migration
 document...
Thread-Index: AQHWIvASEjEPMqXWqJ3UeMFTJvZDPw==
Date: Tue, 5 May 2020 15:15:54 +0000
Message-ID: <3fa9445d4677a9a6c24fb3aaee08913ad5c13a34.camel@citrix.com>
References: <20200428150624.265-1-paul@xen.org>
 <2bf7dc13-65a4-317e-2c8c-bd6972dbb35a@xen.org>
 <fb319876-41eb-e785-a197-92440187a135@suse.com>
In-Reply-To: <fb319876-41eb-e785-a197-92440187a135@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <2B7F26E536C3574CAEABC0B14BD55951@citrix.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAyMDIwLTA1LTA1IGF0IDE0OjEzICswMTAwLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOg0K
PiBPbiAwNS4wNS4yMCAxNTowMSwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPiA+IEhpIFBhdWwsDQo+
ID4gDQo+ID4gT24gMjgvMDQvMjAyMCAxNjowNiwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiA+ID4g
RnJvbTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPg0KPiA+ID4gDQo+ID4gPiAu
Li4gdG8gc3BlY2lmeSBhIHNlcGFyYXRlIG1pZ3JhdGlvbiBzdHJlYW0gdGhhdCB3aWxsIGFsc28g
YmUNCj4gPiA+IHN1aXRhYmxlIGZvcg0KPiA+ID4gbGl2ZSB1cGRhdGUuDQo+ID4gPiANCj4gPiA+
IFRoZSBvcmlnaW5hbCBzY29wZSBvZiB0aGUgZG9jdW1lbnQgd2FzIHRvIHN1cHBvcnQgbm9uLQ0K
PiA+ID4gY29vcGVyYXRpdmUgDQo+ID4gPiBtaWdyYXRpb24NCj4gPiA+IG9mIGd1ZXN0cyBbMV0g
YnV0LCBzaW5jZSB0aGVuLCBsaXZlIHVwZGF0ZSBvZiB4ZW5zdG9yZWQgaGFzIGJlZW4gDQo+ID4g
PiBicm91Z2h0IGludG8NCj4gPiA+IHNjb3BlLiBUaHVzIGl0IG1ha2VzIG1vcmUgc2Vuc2UgdG8g
ZGVmaW5lIGEgc2VwYXJhdGUgaW1hZ2UgZm9ybWF0DQo+ID4gPiBmb3INCj4gPiA+IHNlcmlhbGl6
aW5nIHhlbnN0b3JlIHN0YXRlIHRoYXQgaXMgc3VpdGFibGUgZm9yIGJvdGggcHVycG9zZXMuDQo+
ID4gPiANCj4gPiA+IFRoZSBkb2N1bWVudCBoYXMgYmVlbiBsaW1pdGVkIHRvIHNwZWNpZnlpbmcg
YSBuZXcgaW1hZ2UgZm9ybWF0Lg0KPiA+ID4gVGhlIA0KPiA+ID4gbWVjaGFuaXNtDQo+ID4gPiBm
b3IgYWNxdWlyaW5nIHRoZSBpbWFnZSBmb3IgbGl2ZSB1cGRhdGUgb3IgbWlncmF0aW9uIGlzIG5v
dA0KPiA+ID4gY292ZXJlZCBhcyANCj4gPiA+IHRoYXQNCj4gPiA+IGlzIG1vcmUgYXBwcm9wcmlh
dGVseSBkZWFsdCB3aXRoIGJ5IGEgcGF0Y2ggdG8NCj4gPiA+IGRvY3MvbWlzYy94ZW5zdG9yZS50
eHQuIA0KPiA+ID4gSXQgaXMNCj4gPiA+IGFsc28gZXhwZWN0ZWQgdGhhdCwgd2hlbiB0aGUgZmly
c3QgaW1wbGVtZW50YXRpb24gb2YgbGl2ZSB1cGRhdGUNCj4gPiA+IG9yIA0KPiA+ID4gbWlncmF0
aW9uDQo+ID4gPiBtYWtpbmcgdXNlIG9mIHRoaXMgc3BlY2lmaWNhdGlvbiBpcyBjb21taXR0ZWQs
IHRoYXQgdGhlIGRvY3VtZW50DQo+ID4gPiBpcyANCj4gPiA+IG1vdmVkIGZyb20NCj4gPiA+IGRv
Y3MvZGVzaWducyBpbnRvIGRvY3Mvc3BlY3MuDQo+ID4gPiANCj4gPiA+IE5PVEU6IEl0IHdpbGwg
b25seSBiZSBuZWNlc3NhcnkgdG8gc2F2ZSBhbmQgcmVzdG9yZSBzdGF0ZSBmb3INCj4gPiA+IGFj
dGl2ZSANCj4gPiA+IHhlbnN0b3JlDQo+ID4gPiAgICAgICAgY29ubmVjdGlvbnMsIGJ1dCB0aGUg
ZG9jdW1lbnRhdGlvbiBmb3IgJ1JFU1VNRScgaW4NCj4gPiA+IHhlbnN0b3JlLnR4dCANCj4gPiA+
IGltcGxpZXMNCj4gPiA+ICAgICAgICBvdGhlcndpc2UuIFRoYXQgY29tbWFuZCBpcyB1bnVzZWQg
c28gdGhpcyBwYXRjaCBkZWxldGVzIGl0DQo+ID4gPiBmcm9tIA0KPiA+ID4gdGhlDQo+ID4gPiAg
ICAgICAgc3BlY2lmaWNhdGlvbi4NCj4gDQo+IENvdWxkIHNvbWVvbmUgZnJvbSBDaXRyaXggcGxl
YXNlIHZlcmlmeSB0aGF0IFhBUEkgaXNuJ3QgdXNpbmcNCj4gWFNfUkVTVU1FPw0KDQpUaGUgaW1w
bGVtZW50YXRpb24gb2YgWFNfUkVTVU1FIGluIG94ZW5zdG9yZWQgZG9lc24ndCBkbyBtdWNoOiBp
dCBzZWVtcw0KdG8gYmUganVzdCBhIHdheSBmb3IgRG9tMCB0byBjaGVjayB3aGV0aGVyIGEgZG9t
YWluIGV4aXN0cyBvciBub3QsIGFuZA0KZm9yIGEgZG9tYWluIHRvIGNoZWNrIHdoZXRoZXIgdGhl
eSBhcmUgRG9tMCBvciBub3QuDQpJZiB0aGUgZG9tYWluIGV4aXN0cywgdGhlbiB0aGUgcmVzdW1l
IGltcGxlbWVudGF0aW9uIGp1c3QgcmV0dXJucyBgKClgLA0KaS5lLiBkb2VzIG5vdGhpbmcuDQoN
CkkgY2FuJ3QgZmluZCBhbnkgcmVmZXJlbmNlcyB0byBYcy5yZXN1bWUgaW4geGVub3BzZCAob3Ig
dGhlIG90aGVyIFhBUEkNCnJlcG9zIHRoYXQgSSBnb3QgY2hlY2tlZCBvdXQpLCBzbyBJIHRoaW5r
IGl0IGNhbiBiZSBzYWZlbHkgcmVtb3ZlZCBmcm9tDQp0aGUgc3BlYyBhbmQgY2xpZW50IGxpYnJh
cmllcyAoSSdkIGtlZXAgaXQgaW4gdGhlIGFjdHVhbCBveGVuc3RvcmVkDQppbXBsZW1lbnRhdGlv
biBqdXN0IGluIGNhc2Ugc29tZSBndWVzdCBkb2VzIGNhbGwgaXQpLg0KDQpCZXN0IHJlZ2FyZHMs
DQotLUVkd2luDQoNCj4gDQo+IA0KPiBKdWVyZ2VuDQo+IA0K

