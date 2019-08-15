Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 561958EBFF
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2019 14:54:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyFDR-0005kf-ON; Thu, 15 Aug 2019 12:50:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8rBE=WL=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hyFDQ-0005ka-Jm
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2019 12:50:52 +0000
X-Inumbo-ID: 4f3bfe3e-bf5b-11e9-b22b-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4f3bfe3e-bf5b-11e9-b22b-bc764e2007e4;
 Thu, 15 Aug 2019 12:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565873451;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=YrykT/WR443E0CiLh2NRLznVFvDlVx8qV1l1MUDoda0=;
 b=cx7UBKSIK4AUtgF7v/XlMexs6uXAuXLJ2Qz8Q5QMks0z4TXy6xaafq0u
 KAD5R/9dDAdXwjBAvfP1lwSSU76reHogUBZ7k5gTFuWveTdW1EoQoN/ez
 79TTkAYb3+RhEP1wBw2ijxw1l4PsYjtJOEIFISsw2FNwTUSDuxclgD3dQ U=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: +5+lbrtIc3vGfZHgZguw9oKk3MgkD8gOksbM30ZMpVAAAYq36lBQNjutUN7Cqm/AK6sUw7l0TK
 ZWPA/fKvw/ahP+hbk1ejhvpvjYE5Fvkg80bfQOinIaheSJajlPWBIT6lXtuJbon2ulA7YmI8SB
 eeYUSkKkfFlIckl6xFc7VClm3GXJJHlKw15bjOMJWTyXKIPeYLYV2fo/RCgANFiiPuJzYioEEr
 MjVqWYZ3DJDVF4cPiMozqtXMe1jsRC/v5HUs6sZstGAT+Fo+ciS7EOBtkaUZV+uQMMI/5an4Gg
 AyI=
X-SBRS: 2.7
X-MesageID: 4346513
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,389,1559534400"; 
   d="scan'208";a="4346513"
Date: Thu, 15 Aug 2019 13:50:42 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: osstest service owner <osstest-admin@xenproject.org>, Ian Jackson
 <ian.jackson@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20190815125042.GA25409@perard.uk.xensource.com>
References: <osstest-140105-mainreport@xen.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <osstest-140105-mainreport@xen.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [xen-unstable-coverity test] 140105: all pass -
 PUSHED
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBBdWcgMTQsIDIwMTkgYXQgMDk6NTI6MzFBTSArMDAwMCwgb3NzdGVzdCBzZXJ2aWNl
IG93bmVyIHdyb3RlOgo+IGZsaWdodCAxNDAxMDUgeGVuLXVuc3RhYmxlLWNvdmVyaXR5IHJlYWwg
W3JlYWxdCj4gaHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dz
LzE0MDEwNS8KPiAKPiBQZXJmZWN0IDotKQo+IEFsbCB0ZXN0cyBpbiB0aGlzIGZsaWdodCBwYXNz
ZWQgYXMgcmVxdWlyZWQKPiB2ZXJzaW9uIHRhcmdldGVkIGZvciB0ZXN0aW5nOgo+ICB4ZW4gICAg
ICAgICAgICAgICAgICAyNDNjYzk1ZDQ4NTg0NmUzNWY1ZTI0NDVmZGFhZmU3N2M4YzExNGQyCj4g
YmFzZWxpbmUgdmVyc2lvbjoKPiAgeGVuICAgICAgICAgICAgICAgICAgNzYyYjlhMmQ5OTBiYmEx
ZjNhZWZlNjYwY2ZmMGMzN2FkMmUzNzViYwo+IAo+IExhc3QgdGVzdCBvZiBiYXNpcyAgIDEzOTkz
NCAgMjAxOS0wOC0xMSAwOToxODoyOSBaICAgIDMgZGF5cwo+IFRlc3Rpbmcgc2FtZSBzaW5jZSAg
IDE0MDEwNSAgMjAxOS0wOC0xNCAwOToxOToxOCBaICAgIDAgZGF5cyAgICAxIGF0dGVtcHRzCgpJ
IGRvbid0IHRoaW5rIHRoZSBjb3Zlcml0eSB1cGxvYWQgaXMgd29ya2luZy4KCk9uIGh0dHBzOi8v
c2Nhbi5jb3Zlcml0eS5jb20vcHJvamVjdHMveGVucHJvamVjdDoKICBMYXN0IGJ1aWxkIGFuYWx5
emVkOiAzIG1vbnRocyBhZ28KCkFuZCBpbiB0aGUgbG9nIFsxXSwgd2hlbiB0aGUgdXBsb2FkIGlz
IGRvbmUsIHRoZXJlIGlzOgogIFlvdXIgYnVpbGQgaXMgYWxyZWFkeSBpbiB0aGUgcXVldWUgZm9y
IGFuYWx5c2lzLiBQbGVhc2Ugd2FpdCB0aWxsIGFuYWx5c2lzIGZpbmlzaGVzIGJlZm9yZSB1cGxv
YWRpbmcgYW5vdGhlciBidWlsZC4KClsxXSBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0
Lm9yZy9vc3N0ZXN0L2xvZ3MvMTQwMTA1L2NvdmVyaXR5LWFtZDY0LzcudHMtY292ZXJpdHktdXBs
b2FkLmxvZwoKLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
