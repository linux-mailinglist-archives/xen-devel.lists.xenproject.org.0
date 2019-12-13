Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3609111E31F
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 13:02:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifjcM-0006Ug-VI; Fri, 13 Dec 2019 12:00:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GgWl=2D=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1ifjcL-0006Ub-CZ
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 12:00:21 +0000
X-Inumbo-ID: 1e050d9e-1da0-11ea-b6f1-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1e050d9e-1da0-11ea-b6f1-bc764e2007e4;
 Fri, 13 Dec 2019 12:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576238412;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=dfIZ7TaLg0jQim4182R2L5j6yVqCOxfSdmSZp8fzJ/U=;
 b=PN95/aKFcCDSRJALKIqldd9yc6sLTd07nPA4csVK7GBRNjE8VjOD9I1i
 gGR8Apm/9qgBMN3sZQNEPLqtMQ6Ztiy0EpOLBG3s/D1NIELdxwmUk+xsd
 bhNwZrztqN/gGdkIun52Xish1Bj5M14npoAiEC9krHn6+0HCEaKhXZpQQ Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 George.Dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
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
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: RAr4q/ZNqxVldtC3Gs0QKlgD++2Aj5ltiYMTKyOKp3HZAH3v7xmwLqd//VPXRTouT2ypNI1OWz
 UUIHzHdFE2F0GaT6ykFXD7J7qaEfaalWvUgZEiR5aKBl8i59joJRb3BzxdLkObi/WVf5z8e6fO
 SQ1GtUyFK2xhJiuqMSset5m3d96xw70PnRGhXwd3ZxkObAjuWvkSOXxe3X8XESwFO4RVdrY3Eb
 rU0eb2/PWx5KK+HktC0C4Mbq4sLRZVlKvcy8TfdNpPw+385FkyC26mAM+Z0i/jIWBM8jBgztAC
 Q+g=
X-SBRS: 2.7
X-MesageID: 10207780
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,309,1571716800"; d="scan'208";a="10207780"
From: George Dunlap <George.Dunlap@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH 4/4] x86/mm: More discriptive names for page
 de/validation functions
Thread-Index: AQHVsRId5okcLq6La0qtvXym5gYGV6e23IkAgAD2WACAABPygA==
Date: Fri, 13 Dec 2019 12:00:09 +0000
Message-ID: <595E3CB8-7EDE-4F19-99DA-B2E9C1A1AD97@citrix.com>
References: <20191212173203.1692762-1-george.dunlap@citrix.com>
 <20191212173203.1692762-5-george.dunlap@citrix.com>
 <cd807be2-1dcc-5b1b-7cb1-0b77dfc12f04@citrix.com>
 <424507b8-205f-19f3-3e57-7a6986aeb4f7@suse.com>
In-Reply-To: <424507b8-205f-19f3-3e57-7a6986aeb4f7@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3601.0.10)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <37B53A85BF439941A8B1BF76420CC182@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 4/4] x86/mm: More discriptive names for page
 de/validation functions
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gRGVjIDEzLCAyMDE5LCBhdCAxMDo0OCBBTSwgSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPiB3cm90ZToNCj4gDQo+IE9uIDEyLjEyLjIwMTkgMjE6MDcsIEFuZHJldyBDb29w
ZXIgd3JvdGU6DQo+PiBPbiAxMi8xMi8yMDE5IDE3OjMyLCBHZW9yZ2UgRHVubGFwIHdyb3RlOg0K
Pj4+IFRoZSBmdW5jdGlvbnMgYWxsb2NfcGFnZV90eXBlKCksIGFsbG9jX2xOX3RhYmxlKCksIGZy
ZWVfcGFnZV90eXBlKCkNCj4+PiBhbmQgZnJlZV9sTl90YWJsZSgpIGFyZSBjb25mdXNpbmdseSBu
YW1lZDoNCj4+IA0KPj4gVGhlcmUgaXMgYWxsb2Nfc2VnZGVzY19wYWdlKCkgd2hpY2ggc2hvdWxk
IGJlIGFkanVzdGVkIGZvciBjb25zaXN0ZW5jeS4NCj4+IA0KPj4+IG5vdGhpbmcgaXMgYmVpbmcg
YWxsb2NhdGVkIG9yIGZyZWVkLg0KPj4gDQo+PiBXZWxsIC0gc3RyaWN0bHkgc3BlYWtpbmcgdGhl
IHR5cGUgcmVmZXJlbmNlIGlzIGJlaW5nIG9idGFpbmVkL2Ryb3BwZWQsDQo+PiBhbmQgdGhpcyBp
cyBhIGtpbmQgb2YgYWxsb2MvZnJlZSwgYWx0aG91Z2ggSSBhZ3JlZSB0aGF0IHRoZSBuYW1lcyBh
cmUNCj4+IG5vdCBncmVhdC4NCg0KT24gdGhlIGNvbnRyYXJ5IOKAlCB0aGUgdHlwZSByZWZlcmVu
Y2Ugd2FzIG9idGFpbmVkIC8gd2lsbCBiZSBkcm9wcGVkIGluIHtnZXQscHV0fV9wYWdlX3R5cGUo
KTsgYnV0IHRoZSBwYWdlIGhhcyBub3QgeWV0IGJlZW4gdmFsaWRhdGVkIHRvIGFjdHVhbGx5IGJl
IHVzZWQgYXMgdGhhdCB0eXBlIC8gc3RpbGwgaG9sZHMgcmVmZXJlbmNlcyB0byBvdGhlciBwYWdl
cyBhcyB0aG91Z2ggaXQgd2VyZSB0aGF0IHR5cGUuICANCg0KPj4gDQo+PiBIb3dldmVyLCBJJ20g
bm90IGVudGlyZWx5IHN1cmUgdGhhdCB7ZGUsfXZhbGlkYXRlIGFyZSBncmVhdCBlaXRoZXIsDQo+
PiBiZWNhdXNlIGl0IGlzbid0IG9idmlvdXNseSB0aWVkIHRvIG9idGFpbmluZy9kcm9wcGluZyBh
IHR5cGUgcmVmZXJlbmNlLg0KPj4gDQo+PiBUaGF0IHNhaWQsIEkgZG9uJ3QgaGF2ZSBhIGJldHRl
ciBzdWdnZXN0aW9uIHJpZ2h0IG5vdy4NCj4gDQo+IEZvbGxvd2luZyB0aGUgd29yZGluZyBvZiB5
b3VycywgaG93IGFib3V0IHtvYnRhaW4sZHJvcH1fcGFnZV90eXBlKCk/DQoNCuKAnE9idGFpbuKA
nSBpcyBsaXRlcmFsbHkgYSBzeW5vbnltIGZvciDigJxnZXTigJ07IGFuZCB0aGVyZSBhcmUgbWFu
eSBwbGFjZXMgaW4gdGhlIGNvZGUgd2hlcmUgd2Ugc2F5IHRoaW5nIGxpa2UsIOKAnGRyb3AgdGhl
IHR5cGUgY291bnTigJ0ganVzdCBiZWZvcmUgY2FsbGluZyDigJxwdXTigJ0uICANCg0KSSBhZ3Jl
ZSDigJxkZXZhbGlkYXRl4oCdIGxvb2tzIGEgYml0IGNsdW5reSwgYnV0IGFsbCB0aHJvdWdoIHRo
ZSBkaXNjdXNzaW9ucyBvbiBYU0EtMjk5LCB0aGUgd29yZCDigJxkZS12YWxpZGF0ZeKAnSB3YXMg
dXNlZCBmb3IgdGhlIHdvcmsgdGhhdCB0aGUg4oCcZnJlZSIgZnVuY3Rpb25zIGFyZSBkb2luZyDi
gJQgbmFtZWx5LCBkcm9wcGluZyByZWZlcmVuY2VzIHRvIG90aGVyIHBhZ2VzIHN1Y2ggdGhhdCB0
aGUg4oCcdmFsaWRhdGXigJ0gYml0IGlzIGNsZWFyLg0KDQpJIG1lYW4sIHdlIGNvdWxkIGRvIHNv
bWV0aGluZyBsaWtlIOKAnGJsZXNz4oCdIGFuZCDigJx1bmJsZXNz4oCdLCBidXQgSSBoYXJkbHkg
dGhpbmsgdGhhdOKAmXMgbW9yZSBjbGVhci4gIOKAnHByb21vdGXigJ0gYW5kIOKAnGRlbW90ZeKA
nT8NCg0KIC1HZW9yZ2UKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
