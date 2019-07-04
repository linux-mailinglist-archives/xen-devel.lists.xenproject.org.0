Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F105FB98
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2019 18:15:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hj4KX-0007z0-VX; Thu, 04 Jul 2019 16:11:29 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=suz0=VB=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hj4KW-0007yv-8P
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2019 16:11:28 +0000
X-Inumbo-ID: 5fd6f92b-9e76-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5fd6f92b-9e76-11e9-8980-bc764e045a96;
 Thu, 04 Jul 2019 16:11:26 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 6K59sTFT7IbsFpTshD7zQK7Z6erKG5UeGJGYBcbwYszgZV9tmh/T3mq1KzskHFMUg+LuckO6PA
 s+oYQbR5pOaPOc+IxMfOfDyCsk5REPDZjdptWGDutHYCZQA7F18EnMyaS9m6kMPod5nCaitSQm
 HgED83B2s6t8/jKp7df7+As5HRLIl2Gp+2X77SpIU+qAIc8r8D2tzcJGELQR0aW9KCvjHlgSSq
 vm/yM0KkLIzrSnHqeO0lQ7kshKVkh0BAMnXg8Ap9a7vvZGXVNcivyrk6BBtZNLPM0U/FGI5kGn
 OcE=
X-SBRS: 2.7
X-MesageID: 2625875
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,451,1557201600"; 
   d="scan'208";a="2625875"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <JBeulich@suse.com>, Anthony Perard
 <anthony.perard@citrix.com>
Thread-Topic: [Xen-devel] [PATCH] include/public/io/ring.h: Remove xen_mb,
 xen_rmb, xen_wmb macros
Thread-Index: AQHVMntmcjAjDu/MbEW4KaEw4V64e6a6eY2AgAAlqmA=
Date: Thu, 4 Jul 2019 16:11:23 +0000
Message-ID: <c2a91602902b4c9294a12c4994a3663a@AMSPEX02CL03.citrite.net>
References: <20190704151522.32639-1-anthony.perard@citrix.com>
 <11258d51-03b7-05ad-e94c-e7dde56d39ee@suse.com>
In-Reply-To: <11258d51-03b7-05ad-e94c-e7dde56d39ee@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] include/public/io/ring.h: Remove xen_mb,
 xen_rmb, xen_wmb macros
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
Cc: Juergen Gross <JGross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8SkJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDA0IEp1bHkgMjAxOSAxNjo0OQ0KPiBUbzogQW50aG9ueSBQ
ZXJhcmQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+DQo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmc7IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+OyBL
b25yYWQgUnplc3p1dGVrIFdpbGsNCj4gPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+OyBKdWVyZ2Vu
IEdyb3NzIDxKR3Jvc3NAc3VzZS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVsXSBbUEFU
Q0hdIGluY2x1ZGUvcHVibGljL2lvL3JpbmcuaDogUmVtb3ZlIHhlbl9tYiwgeGVuX3JtYiwgeGVu
X3dtYiBtYWNyb3MNCj4gDQo+IE9uIDA0LjA3LjIwMTkgMTc6MTUsIEFudGhvbnkgUEVSQVJEIHdy
b3RlOg0KPiA+IFRob3NlIG1hY3JvcyB3aGVyZSBpbnRyb2R1Y2VkIHdoZW4gYSBwcmVmaXggInhl
bl8iIHdhcyBhZGRlZCB0bw0KPiA+IG1iLHJtYix3bWIuIFRoZXJlIGFyZSBnYXRlZCBvbiBfX1hF
Tl9JTlRFUkZBQ0VfVkVSU0lPTl9fLCBidXQgdGhlcmUNCj4gPiBhcmUgbm90IHBhcnQgb2YgdGhl
IFhlbiBpbnRlcmZhY2UuIFVzZXJzIG9mIHJpbmcuaCBuZWVkcyB0byBwcm92aWRlDQo+ID4geGVu
X1tyd10/bWIoKSBhbnl3YWkgYmVjYXVzZSBbcnddP21iKCkgaXNuJ3QgbGlrZWx5IHRvIGV4aXN0
Lg0KPiANCj4gSXQncyBub3QgY2xlYXIgdG8gbWUgd2hhdCB5b3Ugd2FudCB0byBhY2hpZXZlOg0K
PiANCg0KVGhlIGlzc3VlIGlzIHRoYXQgYW55IHByb2plY3QgaW1wb3J0aW5nIHRoaXMgaGVhZGVy
IChpbiB0aGlzIGNhc2UgUUVNVSwgYnV0IEkgaGF2ZSB0aGUgc2FtZSBpc3N1ZSBpbiB0aGUgV2lu
ZG93cyBQViBkcml2ZXJzKSBuZWVkcyB0byBpbXBvcnQgeGVuLWNvbXBhdC5oIChvciBkcmVhbSB1
cCBhIGhlYWRlciBvZiB0aGUgc2FtZSBuYW1lKSwgZXZlbiB0aG91Z2ggdGhpcyBoZWFkZXIgaXMg
b25seSBjb25jZXJuZWQgd2l0aCB0aGUgdW5kZXJwaW5uaW5ncyBvZiBQViBwcm90b2NvbHMgYW5k
IGhhcyBub3RoaW5nLCBhcyBzdWNoLCB0byBkbyB3aXRoIFhlbi4NCg0KVG8ga2VlcCBvbGQgdmVy
YmF0aW0gdXNlcnMgKGFyZSB0aGVyZSByZWFsbHkgYW55IGF0IGFsbD8pIGhhcHB5LCBob3cgYWJv
dXQgc2ltcGxlLi4uDQoNCiNpZm5kZWYgeGVuX21iKCkNCiNkZWZpbmUgeGVuX21iKCkgbWIoKQ0K
I2VuZGlmDQoNCmNvbnN0cnVjdHM/DQoNCiAgUGF1bA0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
