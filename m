Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E83D416B
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2019 15:35:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIv2i-0002O7-9k; Fri, 11 Oct 2019 13:33:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fsnF=YE=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iIv2h-0002O1-63
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2019 13:33:15 +0000
X-Inumbo-ID: abe95f8b-ec2b-11e9-933b-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id abe95f8b-ec2b-11e9-933b-12813bfff9fa;
 Fri, 11 Oct 2019 13:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570800794;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=SgcVocbWzNGtxeDJezDqKOWxjYnKwUYKGEpiFneJniI=;
 b=HDDqAz6omCNUy4C6A8+RN0wPXGxf9D+me264cm9agwZLlZ2b0xw3PfdK
 Q67umxff8VRdzlr/suK725an8gx7n0xsURMyBUWwNHLHc/ceuAfuQG2Xm
 Ji8KsiuQGoECRC7a9/pZ9JDomMRzmGVK8njEg0Fdo/n0nPNe1eM50Hu8F c=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: P9gnDMaUrbuPNacDCFpy9y+dNA/HqTw7pyFWiFd/3jdBM5wSbwA7xss22MGaTY6fFZf8bqLASY
 cdgjflzMqMuc5TXUYGBHKQdyb2v2lS0339Ezd+MIGBY40l3Xo+NWGvhBxuPrtJCXqz6YLdy7bs
 P22G87CnsyjSV5XFXsQX5Y/LwMQBSTufMaVAvALHL7n1kiK4E2ffSr9ehsg+RzqRjkpnBHvMFx
 3xqaxbpUmHSEb96W5GymPjUp/MtvwjC39V2FkLb1DqOKngH2S9sIx5CJ/nc+lbW3hXvuue97sY
 Nw4=
X-SBRS: 2.7
X-MesageID: 7159863
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,284,1566878400"; 
   d="scan'208";a="7159863"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23968.33942.771345.223537@mariner.uk.xensource.com>
Date: Fri, 11 Oct 2019 14:33:10 +0100
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <55f7b367-a593-5585-ffd1-7034f045b9a9@arm.com>
References: <20191010151111.22125-1-ian.jackson@eu.citrix.com>
 <20191010151111.22125-10-ian.jackson@eu.citrix.com>
 <17defd97-e6b8-761e-0bd8-0aa0a2de7bed@citrix.com>
 <55f7b367-a593-5585-ffd1-7034f045b9a9@arm.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 v2 9/9] libxl/xl: Overhaul
 passthrough setting logic
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
 Paul Durrant <pdurrant@gmail.com>, Jan Beulich <jbeulich@suse.com>, Anthony
 Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SnVsaWVuIEdyYWxsIHdyaXRlcyAoIlJlOiBbWGVuLWRldmVsXSBbWEVOIFBBVENIIGZvci00LjEz
IHYyIDkvOV0gbGlieGwveGw6IE92ZXJoYXVsIHBhc3N0aHJvdWdoIHNldHRpbmcgbG9naWMiKToK
PiBsaWJ4bCB0cmVhdHMgQXJtIGd1ZXN0IGFzIFBWSCBub3cuIE5vdGUgdGhhdCB3ZSBzZWFtbGVz
c2x5IGNvbnZlcnQKPiBQViB0byBQVkggaW4gbGlieGxfX2FyY2hfZG9tYWluX3tidWlsZCwgY3Jl
YXRlfV9pbmZvX3NldGRlZmF1bHQoKS4KPiAKPiBTbyBhcyBsb25nIGFzIHRoaXMgaXMgY2FsbGVk
IGFmdGVyIGFueSBvZiB0aG9zZSBjYWxscywgdGhlbiB3ZQo+IHNob3VsZCBiZSBmaW5lLgoKSSds
bCBjaGVjayB0aGlzLgoKVGhpcyBtZWFucyB0aGF0IHRoZSBhbGdvcml0aG0gaXMgcXVpdGUgZGlm
ZmVyZW50IG9uIEFSTSB0byBvbiB4ODY6CkFSTSBndWVzdHMgYXJlIGFsd2F5cyBQVkggYW5kIG5l
ZWQgUFRfU0hBUkU7IG9uIHg4NiwgUFZIIGlzIG5vdApjb21wYXRpYmxlIHdpdGggcGFzc3Rocm91
Z2ggYXQgYWxsLgoKU28gSSBuZWVkIHRvIHB1dCB0aGlzIGxvZ2ljIGluIGFuIGFyY2gtc3BlY2lm
aWMgZnVuY3Rpb24uCgpJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
