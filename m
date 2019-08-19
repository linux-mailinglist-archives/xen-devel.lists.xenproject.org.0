Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF799258D
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2019 15:53:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzi3u-0004JD-LG; Mon, 19 Aug 2019 13:51:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=w4Y0=WP=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hzi3u-0004J7-1h
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2019 13:51:06 +0000
X-Inumbo-ID: 62ce99a4-c288-11e9-8bed-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 62ce99a4-c288-11e9-8bed-12813bfff9fa;
 Mon, 19 Aug 2019 13:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566222665;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=5cV99UxCjmNg67IV4/h2loNpoETC/gdxXH7kGvSmCto=;
 b=MXUOGVCwjPpXUzyIfyeLKnD6Lw1kXBQ6T/wAj5emzK5gbRDwxZZktQMM
 Yo6oOSBT5u2fjAuwVUH9xgyxoOi0NhyWQPGXaIT+johTj4prssQK0CGJB
 0GpD8D3ZbMiQf3Pje+MTiZuAUwQjdzAj7ntq07in5TXF8At6p6jwfhyRD Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 George.Dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 41gV3QHr8m91xjc7x5SIyPks0lR/Uzb1kQeFNFQCd+IiIqpfLnuduPj9+RcV7UvCU7u/GQConN
 pB0vyNDVbmgeW3qazfP+O7SG9Jj4WwmK3xAeLgdNg0i6cZra/4f6XQTrjCDmPUo7P2jAFFWsLR
 hp1fIGGW+zmSR1u201+30n3+OFWLCB3vfo7ddFOhIpywwe5CBKlQAT18Yz9S1XfUEwNGa+Sjpd
 6CTo2jtr0jEHarDXZAw/hObM9aujMqrygmwWG7C+5Ly3fOrXqyhMJDPX7w45cXL8rIksAhQyB6
 b8w=
X-SBRS: 2.7
X-MesageID: 4468606
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,405,1559534400"; 
   d="scan'208";a="4468606"
From: George Dunlap <George.Dunlap@citrix.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH v3 01/14] xen/x86: Make mfn_to_gfn typesafe
Thread-Index: AQHVGiYCxkIB3p6VHE+B3ULKAtTHtKbhuEwAgCEcI4A=
Date: Mon, 19 Aug 2019 13:50:59 +0000
Message-ID: <3DCA4489-0AF5-498E-868F-D8A2A34D1875@citrix.com>
References: <20190603160350.29806-1-julien.grall@arm.com>
 <20190603160350.29806-2-julien.grall@arm.com>
 <b2fba871-bcb7-2d08-25d1-8501964cb71d@arm.com>
In-Reply-To: <b2fba871-bcb7-2d08-25d1-8501964cb71d@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3445.104.11)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <8F8AE3D4BD1D7B41AEE54D00E5A19B94@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 01/14] xen/x86: Make mfn_to_gfn typesafe
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
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "Tim \(Xen.org\)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Cgo+IE9uIEp1bCAyOSwgMjAxOSwgYXQgMToxMyBQTSwgSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3Jh
bGxAYXJtLmNvbT4gd3JvdGU6Cj4gCj4gSGksCj4gCj4gQEdlb3JnZSBjYW4gSSBnZXQgYW4gYWNr
IGZvciB0aGlzIHBhdGNoPwo+IAo+IENoZWVycywKPiAKPiBPbiA2LzMvMTkgNTowMyBQTSwgSnVs
aWVuIEdyYWxsIHdyb3RlOgo+PiBObyBmdW5jdGlvbmFsIGNoYW5nZXMgaW50ZW5kZWQuCj4+IFNp
Z25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpBY2tlZC1i
eTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgoKU29ycnkgZm9yIHRo
ZSBkZWxheS4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
