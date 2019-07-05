Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B4E6093B
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jul 2019 17:24:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hjQ15-00082O-2T; Fri, 05 Jul 2019 15:20:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LVWj=VC=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hjQ13-00081r-AW
 for xen-devel@lists.xenproject.org; Fri, 05 Jul 2019 15:20:49 +0000
X-Inumbo-ID: 76678a34-9f38-11e9-93ec-e393367c1aa9
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 76678a34-9f38-11e9-93ec-e393367c1aa9;
 Fri, 05 Jul 2019 15:20:47 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: bwzj83k+NgeszGxYOQXo9lWT7urrRyfXl32Vjc0TsbH+yIVcbgI9AFs+sy8y54aStl1scVnJK5
 gKWbZpTPnMT0HxjvA/Po8nZkiUgZ7JNqWCKhIkot7SkVVRUUCDX7GIw+BfTZwYkoslmLMn1v6P
 arc/mx+VQpr588vwi7Ik0P8Ex5uqVhN8Qn0rj13Ja9jMuaOmy8GTGi1snhqsU0N+fxexOiHHxC
 57nBT7NGWGYrtB9oM989lzw3dmqNtb9cVyqrxXl2z8hiFXWHVLcOYUPSxYhjQNPH0wkwtDH9io
 1MU=
X-SBRS: 2.7
X-MesageID: 2635652
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,455,1557201600"; 
   d="scan'208";a="2635652"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <JBeulich@suse.com>
Thread-Topic: [PATCH v3 2/2] xmalloc: add a Kconfig option to poison free pool
 memory
Thread-Index: AQHVM0DHEUMKi5o3rEafecDiRArwwKa7+nSAgAApPkA=
Date: Fri, 5 Jul 2019 15:20:20 +0000
Message-ID: <5703c7bd13da499fa8cc3dcfe065bc19@AMSPEX02CL03.citrite.net>
References: <20190705144855.15259-1-paul.durrant@citrix.com>
 <20190705144855.15259-3-paul.durrant@citrix.com>
 <d48a7ce8-547d-fa97-d7c2-e10535670587@suse.com>
In-Reply-To: <d48a7ce8-547d-fa97-d7c2-e10535670587@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 2/2] xmalloc: add a Kconfig option to
 poison free pool memory
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien
 Grall <julien.grall@arm.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8SkJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDA1IEp1bHkgMjAxOSAxNTo1Mg0KPiBUbzogUGF1bCBEdXJy
YW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4NCj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZzsgSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT47IEFuZHJldyBD
b29wZXINCj4gPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyBHZW9yZ2UgRHVubGFwIDxHZW9y
Z2UuRHVubGFwQGNpdHJpeC5jb20+OyBJYW4gSmFja3Nvbg0KPiA8SWFuLkphY2tzb25AY2l0cml4
LmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IEtvbnJh
ZCBSemVzenV0ZWsgV2lsaw0KPiA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT47IFRpbSAoWGVuLm9y
ZykgPHRpbUB4ZW4ub3JnPjsgV2VpIExpdSA8d2xAeGVuLm9yZz4NCj4gU3ViamVjdDogUmU6IFtQ
QVRDSCB2MyAyLzJdIHhtYWxsb2M6IGFkZCBhIEtjb25maWcgb3B0aW9uIHRvIHBvaXNvbiBmcmVl
IHBvb2wgbWVtb3J5DQo+IA0KPiBPbiAwNS4wNy4yMDE5IDE2OjQ4LCBQYXVsIER1cnJhbnQgd3Jv
dGU6DQo+ID4gVGhpcyBwYXRjaCBhZGRzIFhNRU1fUE9PTF9QT0lTT04gdG8gdGhlIEtjb25maWcg
REVCVUcgb3B0aW9ucy4gSWYgc2V0LA0KPiA+IGZyZWUgYmxvY2tzIChncmVhdGVyIHRoYW4gTUlO
X0JMT0NLX1NJWkUpIHdpbGwgYmUgcG9pc29uZWQgd2l0aCAweEFBDQo+ID4gYnl0ZXMgd2hpY2gg
d2lsbCB0aGVuIGJlIHZlcmlmaWVkIHdoZW4gbWVtb3J5IGlzIHN1YnNlcXVlbnRseSBhbGxvY2F0
ZWQuDQo+ID4gVGhpcyBjYW4gaGVscCBpbiBzcG90dGluZyBoZWFwIGNvcnJ1cHRpb24sIHBhcnRp
Y3VsYXJseSB1c2UtYWZ0ZXItZnJlZS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVy
cmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+DQo+IA0KPiBSZXZpZXdlZC1ieTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiANCj4gKEknbSBwb25kZXJpbmcgd2hldGhlciB0
byBhZGQgdGhlIHN1Z2dlc3RlZCBibGFuayBsaW5lcyB3aGlsZQ0KPiBjb21taXR0aW5nLikNCg0K
T2gsIHNvcnJ5LiBJIGZvcmdvdCBhYm91dCB0aGF0Lg0KDQogIFBhdWwNCg0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
