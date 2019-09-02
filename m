Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D40DA558C
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2019 14:06:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4l4N-0006Wd-Sq; Mon, 02 Sep 2019 12:04:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=R1Xd=W5=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i4l4M-0006WY-HC
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 12:04:26 +0000
X-Inumbo-ID: ce762edc-cd79-11e9-b95f-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ce762edc-cd79-11e9-b95f-bc764e2007e4;
 Mon, 02 Sep 2019 12:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567425866;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bzDaXG7ER0pNufUh9BAqLYS2x9RYxdz6hsJ4wFcQMCA=;
 b=IkqR58nhKRTPULEJRBkZpKNUZdctUP5izD+/UpSbq8d1FNOJlKIBtQWP
 WT3zyPJPS7j1vWSoJSdBy9pNcjIGh7hcS4XvIdtlMWEFmfF4Cg+k5f8/p
 0HbZSDcCNWOamLu3BqHNKYz0igEGzLEb6RbkeLMigDL/+VP0hPNSu9N64 c=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: EIszEdnm+VrUAZBy4uGdK0gPf/YHpexGSumFa71NotTcsXahWCQQ0U6kIeFBjSlGFuGMYhxM24
 xP3fnYFv041jLnNoczbo1P6xgv6zqKZzCdK1b/j4N5myUkhlPpXTHgunWH9n2j2x3RGJNCQNua
 i5X3gtD913UP6WC8/78v+cg8LLemhTGceut3jhVVUouGaK3EYLeBuk7Eg6WGdStDV7Vl/nuXQx
 qvS5NzxwPTq7RRX88hy+m8hUpYJN5qreZyy9Tra/F7ei74mOr2UlES3setjuVFDgGD1qOunmaL
 BJE=
X-SBRS: 2.7
X-MesageID: 5014484
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,459,1559534400"; 
   d="scan'208";a="5014484"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <jbeulich@suse.com>
Thread-Topic: Ping: [PATCH 1/6] x86emul: generalize wbinvd() hook
Thread-Index: AQHVMAVkKhByd04q0k2rjesQjIAqKacYfHyAgAAwB6A=
Date: Mon, 2 Sep 2019 12:04:21 +0000
Message-ID: <7aa58f5a13c14324bc19c9e9c029ac5f@AMSPEX02CL03.citrite.net>
References: <2d69ac51-9c4a-96f9-fd37-578658076571@suse.com>
 <3f30c73d-94a7-f9ca-5914-0400f1f98cc3@suse.com>
 <b37d16e7-ede4-98ce-c0f1-8d0d9aa2ec35@suse.com>
In-Reply-To: <b37d16e7-ede4-98ce-c0f1-8d0d9aa2ec35@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] Ping: [PATCH 1/6] x86emul: generalize wbinvd() hook
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDAyIFNlcHRlbWJlciAyMDE5IDEyOjEwDQo+IFRvOiBQYXVs
IER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPg0KPiBDYzogeGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnOyBBbmRyZXcgQ29vcGVyIDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29t
PjsgUm9nZXIgUGF1IE1vbm5lDQo+IDxyb2dlci5wYXVAY2l0cml4LmNvbT47IFdlaSBMaXUgPHds
QHhlbi5vcmc+DQo+IFN1YmplY3Q6IFBpbmc6IFtQQVRDSCAxLzZdIHg4NmVtdWw6IGdlbmVyYWxp
emUgd2JpbnZkKCkgaG9vaw0KPiANCj4gT24gMDEuMDcuMjAxOSAxMzo1NSwgSmFuIEJldWxpY2gg
d3JvdGU6DQo+ID4gVGhlIGhvb2sgaXMgYWxyZWFkeSBpbiB1c2UgZm9yIG90aGVyIHB1cnBvc2Vz
LCBhbmQgZW11bGF0aW5nIGUuZy4NCj4gPiBDTEZMVVNIIGJ5IGlzc3VpbmcgV0JJTlZEIGlzLCB3
ZWxsLCBub3QgdmVyeSBuaWNlLiBSZW5hbWUgdGhlIGhvb2sgYW5kDQo+ID4gYWRkIHBhcmFtZXRl
cnMuIFVzZSBsaWdodGVyIHdlaWdodCBmbHVzaGluZyBpbnNucyB3aGVuIHBvc3NpYmxlIGluDQo+
ID4gaHZtZW11bF9jYWNoZV9vcCgpLg0KPiA+DQo+ID4gaHZtZW11bF9jYWNoZV9vcCgpIHRyZWF0
aW5nIHg4NmVtdWxfaW52ZCB0aGUgc2FtZSBhcyB4ODZlbXVsX3diaW52ZCBpcw0KPiA+IHRvIHJl
dGFpbiBvcmlnaW5hbCBiZWhhdmlvciwgYnV0IEknbSBub3Qgc3VyZSB0aGlzIGlzIHdoYXQgd2Ug
d2FudCBpbg0KPiA+IHRoZSBsb25nIHJ1bi4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gDQo+IFBhdWwsDQo+IA0KPiBhbnkgY2hhbmNl
IEkgY291bGQgZ2V0IHlvdXIgYWNrIChvciBvdGhlcndpc2UpIGhlcmU/IEkgdGhvdWdodCBJIGRp
ZA0KPiBhbnN3ZXIgdGhlIG9uZSBxdWVzdGlvbiB5b3UgaGFkIHJhaXNlZCB0byB5b3VyIHNhdGlz
ZmFjdGlvbi4NCj4gDQoNClllcywgeW91IGRpZC4gU29ycnkgZm9yIG5vdCBhY2tpbmcgZWFybGll
ci4NCg0KQWNrZWQtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+DQoN
Cg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
