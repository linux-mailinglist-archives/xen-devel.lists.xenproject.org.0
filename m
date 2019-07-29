Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B62DF78F9C
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 17:42:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs7k7-0007w8-QN; Mon, 29 Jul 2019 15:39:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0i5a=V2=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hs7k6-0007w3-DN
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 15:39:18 +0000
X-Inumbo-ID: 051b40fe-b217-11e9-a835-e7bca3171e12
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 051b40fe-b217-11e9-a835-e7bca3171e12;
 Mon, 29 Jul 2019 15:39:15 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: hROZbzmJVD69axE7WwFp2jYQUFhnCbf5qx4kvRDDfnmOWnntwz74fLHASb0zFYR82P5+omy0mG
 DLT+dLfibnZ/gvSp2QDIl4g7MeiOIEdzNW3sCVy3y99zi9VnxGjB06N5utx7HoJEJfCcoU7Bdk
 Re4Eb6u+Z3TDRGqJKPqGiMIxkjaY+MmYB7bagUE9iDXM8hYas3wHTHWG5H27tI+3mQEZL8+bnb
 37gktjW4a2onzLGSJ0W1frUOOeLivcHsR94EDCZ1CJvj8eIvGi7kkBt0WL7lFzElFCFMBeUlOm
 7Nk=
X-SBRS: 2.7
X-MesageID: 3605975
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,323,1559534400"; 
   d="scan'208";a="3605975"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <JBeulich@suse.com>
Thread-Topic: [PATCH v2 4/6] x86/domain: remove the 'oos_off' flag
Thread-Index: AQHVQu5iLU0mF4N520Wpse/6cATuIKbhmQ6AgAAof7A=
Date: Mon, 29 Jul 2019 15:39:11 +0000
Message-ID: <c2dbdc555cbf450b879c7cae2552f908@AMSPEX02CL03.citrite.net>
References: <20190725133920.40673-1-paul.durrant@citrix.com>
 <20190725133920.40673-5-paul.durrant@citrix.com>
 <1126a1d6-1467-f180-a9ad-9a62a19ecac8@suse.com>
In-Reply-To: <1126a1d6-1467-f180-a9ad-9a62a19ecac8@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 4/6] x86/domain: remove the 'oos_off' flag
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
Cc: Wei Liu <wl@xen.org>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8SkJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDI5IEp1bHkgMjAxOSAxNjoxNA0KPiBUbzogUGF1bCBEdXJy
YW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4NCj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZzsgQW5kcmV3IENvb3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IFJv
Z2VyIFBhdSBNb25uZQ0KPiA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBHZW9yZ2UgRHVubGFwIDxH
ZW9yZ2UuRHVubGFwQGNpdHJpeC5jb20+OyBUaW0gKFhlbi5vcmcpIDx0aW1AeGVuLm9yZz47IFdl
aSBMaXUNCj4gPHdsQHhlbi5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgNC82XSB4ODYv
ZG9tYWluOiByZW1vdmUgdGhlICdvb3Nfb2ZmJyBmbGFnDQo+IA0KPiBPbiAyNS4wNy4yMDE5IDE1
OjM5LCBQYXVsIER1cnJhbnQgd3JvdGU6DQo+ID4gQEAgLTI1MjMsNyArMjUyMiw3IEBAIHN0YXRp
YyB2b2lkIHNoX3VwZGF0ZV9wYWdpbmdfbW9kZXMoc3RydWN0IHZjcHUgKnYpDQo+ID4gICAjaWYg
KFNIQURPV19PUFRJTUlaQVRJT05TICYgU0hPUFRfT1VUX09GX1NZTkMpDQo+ID4gICAgICAgLyog
V2UgbmVlZCB0byBjaGVjayB0aGF0IGFsbCB0aGUgdmNwdXMgaGF2ZSBwYWdpbmcgZW5hYmxlZCB0
bw0KPiA+ICAgICAgICAqIHVuc3luYyBQVHMuICovDQo+ID4gLSAgICBpZiAoIGlzX2h2bV9kb21h
aW4oZCkgJiYgIWQtPmFyY2gucGFnaW5nLnNoYWRvdy5vb3Nfb2ZmICkNCj4gPiArICAgIGlmICgg
aXNfaHZtX2RvbWFpbihkKSAmJiAhKGQtPm9wdGlvbnMgJiBYRU5fRE9NQ1RMX0NERl9vb3Nfb2Zm
KSApDQo+IA0KPiBBZmFpY3MgdGhpcyBpcyB0aGUgb25seSBldmFsdWF0aW9uIG9mIHRoZSBmbGFn
LCBpLmUuIGl0J3MgSFZNDQo+IHNwZWNpZmljLiBJbiB3aGljaCBjYXNlcyBpdCBzaG91bGQgcHJv
YmFibHkgZm9sbG93IHRoZSBtb2RlbA0KPiBvdXRsaW5lZCBmb3IgcGF0Y2ggMywgYXQgd2hpY2gg
cG9pbnQgdGhlIGlzX2h2bV9kb21haW4oKSBoZXJlDQo+IGJlY29tZXMgcmVkdW5kYW50IChpLmUu
IGNvdWxkIGJlIGRlbW90ZWQgdG8gYW4gQVNTRVJUKCkgaW5zaWRlDQo+IHRoZSBpZigpKS4NCg0K
T2ssIEknbGwgZG8gdGhhdC4NCg0KICBQYXVsDQoNCj4gDQo+IEphbg0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
