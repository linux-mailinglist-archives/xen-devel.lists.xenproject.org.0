Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A59D76FAE7
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 10:06:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpTHx-0000ok-N0; Mon, 22 Jul 2019 08:03:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+VRc=VT=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hpTHv-0000od-QN
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 08:03:15 +0000
X-Inumbo-ID: 277ea5c0-ac57-11e9-80b1-eb65fee4bce0
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 277ea5c0-ac57-11e9-80b1-eb65fee4bce0;
 Mon, 22 Jul 2019 08:03:14 +0000 (UTC)
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
IronPort-SDR: VfDKoQHCz72dDbx/iL2Ey7jbESAq5QPaDEr90IYyzm7DlV4YZS+6tCZ07c8YQMDtliU0cVJHxU
 m5142Dc9Sr9Uohs7X2BNdzE+bWalM0jxFIHP0HNyqs8cqBgf8fGt+Ol8h+jqDRuzUDRSV1/IhU
 E4qPWPq9apZJuHt+8jLqbjYQQ8aNZ9AYARVMZYd14auBVpcuYt0TDZ3jgTHakjmDlTRriWgfLg
 unHrSKf5/0t0AYzLvZ1Kb93cO9uH6qy6KnBioakONYyH7yzEwjT7ZeQobtOPj3/PzgwJnWmB+A
 irE=
X-SBRS: 2.7
X-MesageID: 3247339
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,294,1559534400"; 
   d="scan'208";a="3247339"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, Roman Shaposhnik
 <roman@zededa.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [BUG] After upgrade to Xen 4.12.0 iommu=no-igfx
Thread-Index: AQHVPmjkv94J7ZY7wkqpLrOBs7uyX6bTlQ2AgAK1iCA=
Date: Mon, 22 Jul 2019 08:03:06 +0000
Message-ID: <d7006feb950942fba93fa9e9c13882d9@AMSPEX02CL03.citrite.net>
References: <CAMmSBy9g-QFHTXhpHK6=xDFiBDj4LpnJ=cXj405MMmA1rJaOUg@mail.gmail.com>
 <8afa7ab1-f5cf-e954-f4de-744de851229e@citrix.com>
In-Reply-To: <8afa7ab1-f5cf-e954-f4de-744de851229e@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [BUG] After upgrade to Xen 4.12.0 iommu=no-igfx
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
Cc: Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RGUtaHRtbGluZy4uLg0KDQotLS0tLQ0KW3NuaXBdDQpGb3IgUk1SUnMgdGhlbXNlbHZlcywgc3lz
dGVtIGZpcm13YXJlIGlzIHdlbGwga25vd24gZm9yIGFiaWRpbmcgYnkgdGhlIHNwZWMgW2NpdGF0
aW9uIG5lZWRlZF0sIGJ1dCBhbiBSTVJSIG11c3QgYmUgaG9ub3VyZWQsIGJlY2F1c2UgdGhlIGVu
dGlyZSBwdXJwb3NlIG9mIHRoZW0gaXMgdG8gc3RhdGUgInRoaXMgZGV2aWNlIHdvbid0IGZ1bmN0
aW9uIHdpdGhvdXQgYWNjZXNzIHRvIHRoaXMgYXJlYSIuDQoNCkFuIFJNUlIgaW4gYSBob2xlLCB3
aGlsZSBhIHZpb2xhdGlvbiBvZiB0aGUgc3BlYywgaXMgb2J2aW91c2x5IGZpbmUgdG8gdXNlIGlu
IHByYWN0aWNlLCBzbyB3ZSBzaG91bGQganVzdCBhY2NlcHQgaXQgYW5kIHN0b3AgY29tcGxhaW5p
bmcuDQoNCk9UT0gsIFJNUlJzIHdoaWNoIGhpdCBvdGhlciBtZW1vcnkgKHBhcnRpY3VsYXJseSBS
QU0pIG5lZWQgbW9yZSBjYXJlLCBhbmQgcHJvYmFibHkgd2FudCB0byBmb3JjZSBvdmVycmlkZSB0
aGUgZTgyMCB0byByZXNlcnZlZC7CoCBOb3RoaW5nIGdvb2Qgd2lsbCBjb21lIGZyb20gdHJ1c3Rp
bmcgdGhlIGU4MjAgb3ZlciB0aGUgRE1BUiB0YWJsZSBoZXJlLCBzZWVpbmcgYXMgdGhlcmUgaXMg
Y2xlYXJseSBhbiBlcnJvciBzb21ld2hlcmUgaW4gdGhlIGZpcm13YXJlLXByb3ZpZGVkIGluZm9y
bWF0aW9uLg0KDQpIb3dldmVyIC0gSSdtIHN0cnVnZ2xpbmcgdG8gbG9jYXRlIGFueXdoZXJlIHdo
aWNoIGFjdHVhbGx5IHdhbGtzIGRvbTAncyBSTVJSIGxpc3QgYW5kIGluc2VydHMgdGhlbSBpbnRv
IHRoZSBJT01NVS7CoCBBbnlvbmUgZ290IGFueSBoaW50cz8NCi0tLS0tDQoNCkkgdGhpbmsgeW91
IHdhbnQgc2V0dXBfaHdkb21fcm1ycigpIGluIHBhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jDQoNCiAg
UGF1bA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
