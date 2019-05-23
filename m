Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27ED827F74
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2019 16:24:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hToaL-0008Pm-Lk; Thu, 23 May 2019 14:20:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TQZZ=TX=citrix.com=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hToaK-0008Ph-Dy
 for xen-devel@lists.xenproject.org; Thu, 23 May 2019 14:20:44 +0000
X-Inumbo-ID: f15e3700-7d65-11e9-9818-5f66745495a1
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f15e3700-7d65-11e9-9818-5f66745495a1;
 Thu, 23 May 2019 14:20:41 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=wei.liu2@citrix.com;
 spf=Pass smtp.mailfrom=wei.liu2@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 wei.liu2@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 wei.liu2@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: Swd7TS6VJrLebcY+AXfImrQ6TVChGhdFJ4T8/buyHG+/Td59IndruhrmyXxVQ/7k8/zvbiEY0/
 Rphc51DyMnC1XZoodQZGa0ghU9z1RVpNmlQ0UgMZLim+T1XM+RQbdSoBHdeRGf+SBPwhASdVpb
 4ibJksn/tNBkcK8vvcWivgDLSQOz17a8AREzJaaignJxG4yedJ/u6wlb5lgpzA6NPhd6AkWqWN
 XZ8Oubm069QosJiqhhIwm0q7RgqpqZneWfOoxivgLkBzu1fgh+otM/K9Klkok7qZfGspHpG6Z2
 w4g=
X-SBRS: 2.7
X-MesageID: 839938
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,503,1549947600"; 
   d="scan'208";a="839938"
Date: Thu, 23 May 2019 15:20:33 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190523142033.GF2373@zion.uk.xensource.com>
References: <5CE6A6020200007800231BBD@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CE6A6020200007800231BBD@prv1-mh.provo.novell.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH] x86/IO-APIC: fix build with gcc9
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXkgMjMsIDIwMTkgYXQgMDc6NTQ6MTBBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gVGhlcmUgYXJlIGEgbnVtYmVyIG9mIHBvaW50bGVzcyBfX3BhY2tlZCBhdHRyaWJ1dGVz
IHdoaWNoIGNhdXNlIGdjYyA5IHRvCj4gbGVnaXRpbWF0ZWx5IHdhcm46Cj4gCj4gdXRpbHMuYzog
SW4gZnVuY3Rpb24gJ3Z0ZF9kdW1wX2lvbW11X2luZm8nOgo+IHV0aWxzLmM6Mjg3OjMzOiBlcnJv
cjogY29udmVydGluZyBhIHBhY2tlZCAnc3RydWN0IElPX0FQSUNfcm91dGVfZW50cnknIHBvaW50
ZXIgKGFsaWdubWVudCAxKSB0byBhICdzdHJ1Y3QgSU9fQVBJQ19yb3V0ZV9yZW1hcF9lbnRyeScg
cG9pbnRlciAoYWxpZ25tZW50IDgpIG1heSByZXN1bHQgaW4gYW4gdW5hbGlnbmVkIHBvaW50ZXIg
dmFsdWUgWy1XZXJyb3I9YWRkcmVzcy1vZi1wYWNrZWQtbWVtYmVyXQo+ICAgMjg3IHwgICAgICAg
ICAgICAgICAgIHJlbWFwID0gKHN0cnVjdCBJT19BUElDX3JvdXRlX3JlbWFwX2VudHJ5ICopICZy
dGU7Cj4gICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn4KPiAKPiBpbnRyZW1hcC5jOiBJbiBmdW5jdGlvbiAnaW9hcGljX3J0ZV90
b19yZW1hcF9lbnRyeSc6Cj4gaW50cmVtYXAuYzozNDM6MjU6IGVycm9yOiBjb252ZXJ0aW5nIGEg
cGFja2VkICdzdHJ1Y3QgSU9fQVBJQ19yb3V0ZV9lbnRyeScgcG9pbnRlciAoYWxpZ25tZW50IDEp
IHRvIGEgJ3N0cnVjdCBJT19BUElDX3JvdXRlX3JlbWFwX2VudHJ5JyBwb2ludGVyIChhbGlnbm1l
bnQgOCkgbWF5IHJlc3VsdCBpbiBhbiB1bmFsaWduZWQgcG9pbnRlciB2YWx1ZSBbLVdlcnJvcj1h
ZGRyZXNzLW9mLXBhY2tlZC1tZW1iZXJdCj4gICAzNDMgfCAgICAgcmVtYXBfcnRlID0gKHN0cnVj
dCBJT19BUElDX3JvdXRlX3JlbWFwX2VudHJ5ICopIG9sZF9ydGU7Cj4gICAgICAgfCAgICAgICAg
ICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4gCj4gU2ltcGx5IGRy
b3AgdGhlc2UgYXR0cmlidXRlcy4gVGFrZSB0aGUgbGliZXJ0eSBhbmQgYWxzbyByZS1mb3JtYXQg
dGhlCj4gc3RydWN0dXJlIGRlZmluaXRpb25zIGF0IHRoZSBzYW1lIHRpbWUuCj4gCj4gUmVwb3J0
ZWQtYnk6IENoYXJsZXMgQXJub2xkIDxjYXJub2xkQHN1c2UuY29tPgo+IFNpZ25lZC1vZmYtYnk6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KClJldmlld2VkLWJ5OiBXZWkgTGl1IDx3
ZWkubGl1MkBjaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
