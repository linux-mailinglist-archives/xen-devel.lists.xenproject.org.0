Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD150AE598
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2019 10:32:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7bWj-0006IN-NE; Tue, 10 Sep 2019 08:29:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=w7W/=XF=citrix.com=christian.lindig@srs-us1.protection.inumbo.net>)
 id 1i7bWi-0006II-8A
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2019 08:29:28 +0000
X-Inumbo-ID: 1970a756-d3a5-11e9-ac19-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1970a756-d3a5-11e9-ac19-12813bfff9fa;
 Tue, 10 Sep 2019 08:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568104166;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=VozH+z08Y7zX6JEvnPxzNr3dXZNpzVjjO/IK9kVY0l0=;
 b=gSk7gFmNhpq0o6Bux0CBLz0rlLFtihCfpj4+DcX/QhUppI2SrVw9vPey
 m/rLSr4/P+47SLsiX4wwcB1r+85rbhF0MdsWrQgIj161cTSXmdkPI/yhw
 LnrAwa0bqPhJoaz0Rs7oNKZTzH2kHfLJJRIxIEIzyZnwKYp3ZT3OBiW95 c=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=christian.lindig@citrix.com;
 spf=Pass smtp.mailfrom=christian.lindig@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 christian.lindig@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="christian.lindig@citrix.com";
 x-sender="christian.lindig@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 christian.lindig@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="christian.lindig@citrix.com";
 x-sender="christian.lindig@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="christian.lindig@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: l6fKTzl5ls7/0I1fgSN2+uBI9OiVbrl9MnogEOcc3MuldorIUnKzvQ/cvIRErSDtL4wpBvo4X6
 MCNizUbc1WIqtt3Kc1T7zxtXaS3ItoFebP1dhPCmG4wC5+GPGtMZhiHpH2QjJGRI1/qbIVFeVl
 TX1SVJ1e9N1R8x1LLP7e3/vB2B8NC65nJrYKML1WgiAqsjZ8TOhnHzoO57xF3BUFQTM5wdZk2G
 SNUCuiAtA04r9e+qRnGQ5fbclgKFwyfZcyrJPzoRJn3M69qBH2Hx6tezlSkhE6WZr8wzDKgcLY
 pH8=
X-SBRS: 2.7
X-MesageID: 5595799
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,489,1559534400"; 
   d="scan'208";a="5595799"
From: Christian Lindig <christian.lindig@citrix.com>
To: Ian Jackson <Ian.Jackson@citrix.com>
Thread-Topic: [PATCH 3/3] tools/ocaml: Introduce xenctrl ABI build-time checks
Thread-Index: AQHVZzHc1/lsKqnUHUmmAY4psG3Nw6ckc8WA
Date: Tue, 10 Sep 2019 08:29:22 +0000
Message-ID: <22C7C052-B208-4BA5-97D2-D17EED80A424@citrix.com>
References: <20190909171206.25585-1-ian.jackson@eu.citrix.com>
 <20190909171206.25585-3-ian.jackson@eu.citrix.com>
In-Reply-To: <20190909171206.25585-3-ian.jackson@eu.citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3445.104.11)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <21B39E0B50F421478A765EF73274E720@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 3/3] tools/ocaml: Introduce xenctrl ABI
 build-time checks
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
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, David Scott <dave@recoil.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gOSBTZXAgMjAxOSwgYXQgMTg6MTIsIElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBl
dS5jaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IA0KPiBBZGQgYnVpbGQgbWFjaGluZXJ5IHdoaWNo
IHdpbGwgY2hlY2sgdGhlIEFCSSBjb3JyZXNwb25kZW5jZS4NCj4gDQo+IFRoaXMgd2lsbCByZXN1
bHQgaW4gYSBjb21waWxlIHRpbWUgZmFpbHVyZSB3aGVuZXZlciBjb25zdGFudHMgZ2V0DQo+IHJl
bnVtYmVyZWQvYWRkZWQgd2l0aG91dCBhIGNvbXBhdGlibGUgYWRqdXN0bWVudCB0byB0aGUgT2Nh
bWwgQUJJLg0KDQpJIHVuZGVyc3RhbmQgdGhlIGRlc2lyZSB0byBhdXRvbWF0ZSB0aGlzIGJ1dCB3
b3VsZCBoYXZlIGtlcHQgdGhlIG9yaWdpbmFsIHByb3Bvc2FsIGZvciB0aGVzZSByZWFzb25zOiBj
aGFuZ2VzIGFyZSByYXJlIGVub3VnaCwgaXQgaXMgb2J2aW91cyBob3cgdG8gZXh0ZW5kIHRoZSBz
Y2hlbWUsIHRoZSBhcHByb2FjaCBzdGF5ZWQgd2VsbCB3aXRoaW4gdGhlIHJlc3BlY3RpdmUgbGFu
Z3VhZ2VzLiBBZGRpbmcgcGFyc2VycyBhbmQgY29kZSBnZW5lcmF0b3JzIHRvIHRoZSBidWlsZCBz
eXN0ZW0gd2lsbCBtYWtlIGl0IG1vcmUgZGlmZmljdWx0IHRvIGltcHJvdmUgaXQsIHdoaWNoIGF0
IGxlYXN0IGZvciB0aGUgT0NhbWwgcGFydCBpcyB2ZXJ5IGRlc2lyYWJsZS4gSG93ZXZlciwgSeKA
mW0gbm90IGdvaW5nIHRvIG9iamVjdCB0byB0aGUgcGF0Y2guDQoNCkFja2VkLWJ5OiBDaHJpc3Rp
YW4gTGluZGlnIDxjaHJpc3RpYW4ubGluZGlnQGNpdHJpeC5jb20+DQoNCuKAlCBDaHJpc3RpYW4N
Cg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
