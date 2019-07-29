Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F58278FB3
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 17:45:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs7nk-0001Jw-GY; Mon, 29 Jul 2019 15:43:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0i5a=V2=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hs7ni-0001Jb-PL
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 15:43:02 +0000
X-Inumbo-ID: 8bd7e516-b217-11e9-b1ee-d3d48d00c63c
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8bd7e516-b217-11e9-b1ee-d3d48d00c63c;
 Mon, 29 Jul 2019 15:43:01 +0000 (UTC)
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
IronPort-SDR: +iIa6joBuwu8aVo6qZiWf/KeGKMHHbzNIYx7+bpc8YOKVGbmJjv6acB9anMf4y5FUuNgx5VQQW
 kCM2AMw2ZnPgHhxGExE2gPd7dYni7NEyVNbzGQuwLDO+urjglylAUQbJ3Sqw4qXdJFbmLqw+FA
 WH2QuUadYKtFxs6L0/qoK9EcdHFzW+CTLOhpKtZYw612wM6wVgTUeK4PSs3cA0i/lSHXf1RiGi
 XEKJB22L1bN0G+z6y4bzBOigW33IR8F5ufJCVw69ffFr290/umudWQRyp7w1W8xaJySyQ1c+9I
 jgY=
X-SBRS: 2.7
X-MesageID: 3578701
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,323,1559534400"; 
   d="scan'208";a="3578701"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <JBeulich@suse.com>
Thread-Topic: [PATCH v2 6/6] x86/domain: remove the 's3_integrity' flag
Thread-Index: AQHVQu5hVx1wFbwsYE2f5fUcnBUXV6bhmxAAgAAnhwA=
Date: Mon, 29 Jul 2019 15:42:57 +0000
Message-ID: <483f77d051114a3f81ed3ca14624fb8b@AMSPEX02CL03.citrite.net>
References: <20190725133920.40673-1-paul.durrant@citrix.com>
 <20190725133920.40673-7-paul.durrant@citrix.com>
 <9250abf4-dbb4-33ce-3ebe-43b087ca029c@suse.com>
In-Reply-To: <9250abf4-dbb4-33ce-3ebe-43b087ca029c@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 6/6] x86/domain: remove the
 's3_integrity' flag
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
Cc: Wei Liu <wl@xen.org>, Shane Wang <shane.wang@intel.com>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Gang Wei <gang.wei@intel.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8SkJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDI5IEp1bHkgMjAxOSAxNjoyMQ0KPiBUbzogUGF1bCBEdXJy
YW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4NCj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZzsgQW5kcmV3IENvb3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IFJv
Z2VyIFBhdSBNb25uZQ0KPiA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBHYW5nIFdlaSA8Z2FuZy53
ZWlAaW50ZWwuY29tPjsgU2hhbmUgV2FuZyA8c2hhbmUud2FuZ0BpbnRlbC5jb20+OyBXZWkgTGl1
DQo+IDx3bEB4ZW4ub3JnPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDYvNl0geDg2L2RvbWFp
bjogcmVtb3ZlIHRoZSAnczNfaW50ZWdyaXR5JyBmbGFnDQo+IA0KPiBPbiAyNS4wNy4yMDE5IDE1
OjM5LCBQYXVsIER1cnJhbnQgd3JvdGU6DQo+ID4gVGhlIGZsYWcgaXMgbm90IG5lZWRlZCBzaW5j
ZSB0aGUgZG9tYWluICdvcHRpb25zJyBjYW4gbm93IGJlIHRlc3RlZA0KPiA+IGRpcmVjdGx5Lg0K
PiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4
LmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogIlJvZ2VyIFBhdSBNb25uw6kiIDxyb2dlci5wYXVAY2l0
cml4LmNvbT4NCj4gDQo+IEkgbWF5IGJlIGFza2luZyBhIGxpdHRsZSBtdWNoLCBhcyBpdCdzIG5v
dCBkaXJlY3RseSByZWxhdGVkIHRvDQo+IHdoYXQgeW91IHdhbnQgdG8gZG8gaGVyZSwgYnV0IHNp
bmNlIFRCT09UIGhhcyBhIHNlcGFyYXRlIGNvbmZpZw0KPiBvcHRpb24sIHJlamVjdGluZyBib2d1
cyB1c2Ugb2YgQ0RGX3MzX2ludGVncml0eSBhZ2FpbiBpbg0KPiBhcmNoX3Nhbml0aXNlX2RvbWFp
bl9jb25maWcoKSB3b3VsZCBiZSBhIHVzZWZ1bCBhdWdtZW50YXRpb24NCj4gaGVyZS4gSWYgeW91
IGRvbid0IHdhbnQgdG8gZG8gc28sIHRoZW4gZmVlbCBmcmVlIHRvIGFkZA0KPiBSZXZpZXdlZC1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBvbiB0aGUgcGF0Y2ggYXMgaW4g
aXRzIGN1cnJlbnQgc2hhcGUuDQoNCk9rLCBJJ2xsIHRha2UgYSBsb29rIGF0IGRvaW5nIHRoYXQg
d2hpbGUgSSdtIHJlLXdvcmtpbmcgdGhlIG90aGVycy4NCg0KICBQYXVsDQoNCj4gDQo+IEphbg0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
