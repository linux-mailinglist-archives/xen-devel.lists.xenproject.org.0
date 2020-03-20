Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F286818D25F
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2020 16:08:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jFJDW-0004Ax-Mt; Fri, 20 Mar 2020 15:05:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sjin=5F=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jFJDV-0004As-Hh
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2020 15:05:45 +0000
X-Inumbo-ID: 45ca3070-6abc-11ea-a6c1-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 45ca3070-6abc-11ea-a6c1-bc764e2007e4;
 Fri, 20 Mar 2020 15:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584716744;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=3rLsQ+H/hVMhlkfqnYBBLL0xm48XbNkjGOaAuW7mGxQ=;
 b=fZaIyjr7fXnhbcIHehChXmJqOQeYC7b7ZuJ/QHfpmYHFVvmNiS6JTDPT
 GFR6K/SaGN0FZiYuE357xacwpNTGMUrAnY7dlUdBCBkiINKcqnif+1CJk
 JDaYYJ6WzHJuBcX64S63DSi31jN6CsMxVAnYn5bwp+tcDYQmyhE1qHrUN A=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: HzWj4wc15CowiTc7fRD7OG8jufruFkHEliuaMwXAvE0NAhN+jC0iDJU12ex55qDukXAofMim18
 HmtfbnxxNfbKS0iNjFJuoQQ29RJOAJt7FBLtekX5thd0SvgLu3qRjvBHKMc3PP//P9IDkBy9qX
 QMZlAEk49N5CDNIjrvqYLEDrGu1zOyhBpzT13NLCeO/7wUcsnyIZMQD6BqM6tg+xWo7maKPCPb
 B0pY9fs2LXq5J5hRO/BpwWQy57CDYPQFP9Yk/IJkU/Fjihr2XVuSpqXA/wntawwCak433+qjnJ
 q7c=
X-SBRS: 2.7
X-MesageID: 14692998
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,284,1580792400"; d="scan'208";a="14692998"
Date: Fri, 20 Mar 2020 16:05:37 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200320150537.GA24458@Air-de-Roger.citrite.net>
References: <3d242660-7c28-5465-5da8-d126d2d347b4@xen.org>
 <20200319184305.GR24458@Air-de-Roger.citrite.net>
 <910d5530-893d-9401-46f6-4da22a400ce4@xen.org>
 <1fc54578-2b48-a713-f216-0c6fda205c9a@suse.com>
 <20200320090155.GS24458@Air-de-Roger.citrite.net>
 <9f6c3b5b-13e7-05aa-1ff6-930724674323@suse.com>
 <20200320142214.GX24458@Air-de-Roger.citrite.net>
 <ec3d0416-22a0-bde0-1e92-174b41612bda@xen.org>
 <20200320144920.GY24458@Air-de-Roger.citrite.net>
 <b5766ee3-90d3-7da8-c01a-eb538790c896@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b5766ee3-90d3-7da8-c01a-eb538790c896@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v7 1/3] x86/tlb: introduce a flush HVM ASIDs
 flag
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBNYXIgMjAsIDIwMjAgYXQgMDM6NTk6MzVQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjAuMDMuMjAyMCAxNTo0OSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9u
IEZyaSwgTWFyIDIwLCAyMDIwIGF0IDAyOjI3OjM2UE0gKzAwMDAsIEp1bGllbiBHcmFsbCB3cm90
ZToKPiA+Pgo+ID4+Cj4gPj4gT24gMjAvMDMvMjAyMCAxNDoyMiwgUm9nZXIgUGF1IE1vbm7DqSB3
cm90ZToKPiA+Pj4gc3RhdGljIGlubGluZSB2b2lkIGZpbHRlcmVkX2ZsdXNoX3RsYl9tYXNrKHVp
bnQzMl90IHRsYmZsdXNoX3RpbWVzdGFtcCkKPiA+Pj4gewo+ID4+PiAgICAgIGNwdW1hc2tfdCBt
YXNrOwo+ID4+Pgo+ID4+PiAgICAgIGNwdW1hc2tfY29weSgmbWFzaywgJmNwdV9vbmxpbmVfbWFw
KTsKPiA+Pj4gICAgICB0bGJmbHVzaF9maWx0ZXIoJm1hc2ssIHRsYmZsdXNoX3RpbWVzdGFtcCk7
Cj4gPj4+ICAgICAgaWYgKCAhY3B1bWFza19lbXB0eSgmbWFzaykgKQo+ID4+PiAgICAgIHsKPiA+
Pj4gICAgICAgICAgcGVyZmNfaW5jcihuZWVkX2ZsdXNoX3RsYl9mbHVzaCk7Cj4gPj4+ICNpZiBD
T05GSUdfWDg2Cj4gPj4+ICAgICAgICAgIC8qCj4gPj4+ICAgICAgICAgICAqIGZpbHRlcmVkX2Zs
dXNoX3RsYl9tYXNrIGlzIHVzZWQgYWZ0ZXIgbW9kaWZ5aW5nIHRoZSBwMm0gaW4KPiA+Pj4gICAg
ICAgICAgICogcG9wdWxhdGVfcGh5c21hcCwgWGVuIG5lZWRzIHRvIHRyaWdnZXIgYW4gQVNJRCB0
aWNrbGUgYXMgdGhpcyBpcyBhCj4gPj4+ICAgICAgICAgICAqIHJlcXVpcmVtZW50IG9uIEFNRCBo
YXJkd2FyZS4KPiA+Pj4gICAgICAgICAgICovCj4gPj4KPiA+PiBJIGRvbid0IHRoaW5rIHRoaXMg
Y29tbWVudCBpcyBjb3JyZWN0LiBwb3B1bGF0ZV9waHlzbWFwKCkgaXMgb25seSBnb2luZyB0bwo+
ID4+IGFkZCBlbnRyeSBpbiB0aGUgUDJNIGFuZCB0aGVyZWZvcmUgZmx1c2ggc2hvdWxkIG5vdCBi
ZSBuZWVkZWQuCj4gPiAKPiA+IFNpbmNlIHRoaXMgaXMgc3RyaWN0bHkgb25seSBhZGRpbmcgZW50
cmllcyBJIHRoaW5rIHlvdSBhcmUgcmlnaHQgYW5kCj4gPiB0aGUgQVNJRCB0aWNrbGUgY291bGQg
YmUgYXZvaWRlZCwgYXMgbG9uZyBhcyB3ZSBjYW4gYXNzZXJ0IHRoZSBnZm4gd2FzCj4gPiBlbXB0
eSAob3IgZGlkbid0IGhhdmUgdGhlIHZhbGlkIGJpdCBzZXQpIHByZXZpb3VzIHRvIGJlaW5nIHBv
cHVsYXRlZC4KPiAKPiBXaGlsZSB0aGlzIG1heSBiZSB0cnVlIGZvciB4ODYsIGl0J3Mgbm90IGd1
YXJhbnRlZWQgaW4gZ2VuZXJhbAo+IHRoYXQgbm9uLXByZXNlbnQgdHJhbnNsYXRpb25zIG1heSBu
b3QgYWxzbyBiZSBwdXQgaW50byBUTEJzLgo+IFNvIGZyb20gY29tbW9uIGNvZGUgdGhlcmUgc2hv
dWxkbid0IGJlIGFzc3VtcHRpb25zIGxpa2UgdGhpcy4KCkJ1dCBhcyBwb2ludGVkIG91dCBieSBK
dWxpZW4gZmlsdGVyZWRfZmx1c2hfdGxiX21hc2sgaXMgZXhjbHVzaXZlbHkKdXNlZCBpbiBjb21i
aW5hdGlvbiB3aXRoIGFjY3VtdWxhdGVfdGxiZmx1c2gsIHdoaWNoIG9ubHkgY2FyZXMgYWJvdXQK
dGhlIG5lZWRfdGxiZmx1c2ggaW4gdGhlIHBhZ2Ugc3RydWN0LCBhbmQgaGVuY2UgaWYgcGFnZXMg
YWRkZWQgdG8gdGhlCnBoeXNtYXAgZGlkbid0IGhhZCBhbiBvd25lciB5b3Ugd29uJ3QgZW5kIHVw
IGNhbGxpbmcKZmlsdGVyZWRfZmx1c2hfdGxiX21hc2sgYXQgYWxsLgoKU28gdGhlIEFTSUQgdGlj
a2xlIG11c3QgYmUgcGVyZm9ybWVkIHNvbWV3aGVyZSBlbHNlLCBiZWNhdXNlIGdhdGluZwp0aGUg
QVNJRCBmbHVzaCBvbiB3aGV0aGVyIHRoZSBwYWdlIGhhZCBhIHByZXZpb3VzIG93bmVyIGlzIG5v
dApjb3JyZWN0LgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
