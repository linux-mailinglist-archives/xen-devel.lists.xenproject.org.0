Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4662FDE19
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 13:42:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVatn-0000jU-FP; Fri, 15 Nov 2019 12:40:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cCEn=ZH=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iVatm-0000jK-10
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 12:40:26 +0000
X-Inumbo-ID: 18795a26-07a5-11ea-9631-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 18795a26-07a5-11ea-9631-bc764e2007e4;
 Fri, 15 Nov 2019 12:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573821626;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ZUI2630j0NW0eEKLlRMKDu9Fj367SeDN2AxfcADsttM=;
 b=BVlCxI1FQFeOtMjdR2iUaMweD68pD9JlzqxI8x5gXuFj1E+NzCjaBqkR
 ZG94kD5qcR/jK2VtxtsgdSZ+CLiOH6ongtFKLu3IH4tePs/DBk4OOMsJn
 rmXCxeM0jlPbyVdKV9g7No07tyo88mFsACEH2cL6vbMyqBxfoUseSwgId k=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: u1Ms2GRcf/q8w+anIH9DOet9UCHl5XnAHkyYLMDhN9w393DWVrA9KBc6yvnrZ6zlbh3VeITKO+
 yoQIRPkLsjhpidCVM4enN6bI9RuaSk1OS3LJAtdIp6iHw44UlSaahDXTb+kBCPSoDu4E7ZVZn6
 PMnoT3eP1oI6f+vPiRo25tLV2eGCjD1B9wOSX4Q2aOV7uv2rULezOEjIkg366kX21hDVD4xEq/
 aXsAYvGFgxldMirvOe1J0Tpk+vOhom4V+ImyfmMcNovHBhIn/vwN6cBnjKvxKjSAsWVfoj6xqS
 1hs=
X-SBRS: 2.7
X-MesageID: 8381789
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,308,1569297600"; 
   d="scan'208";a="8381789"
Date: Fri, 15 Nov 2019 12:40:22 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191115124022.GC1425@perard.uk.xensource.com>
References: <20191114180542.1016867-1-anthony.perard@citrix.com>
 <3bbbd382-465b-6169-f8b3-936cd71d222f@suse.com>
 <20191115121221.GB1425@perard.uk.xensource.com>
 <62c9bdf0-ca13-53d9-a702-e51d9e1875c5@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <62c9bdf0-ca13-53d9-a702-e51d9e1875c5@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Subject: Re: [Xen-devel] [XEN PATCH for-4.13] xen: Fix race to build
 arch/x86/efi/relocs-dummy.o
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBOb3YgMTUsIDIwMTkgYXQgMDE6MjM6NDZQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTUuMTEuMjAxOSAxMzoxMiwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gPiBPbiBG
cmksIE5vdiAxNSwgMjAxOSBhdCAxMTowNjoyN0FNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToK
PiA+PiBPbiAxNC4xMS4yMDE5IDE5OjA1LCBBbnRob255IFBFUkFSRCB3cm90ZToKPiA+Pj4gV2l0
aCAkKFRBUkdFVCkuZWZpIGRlcGVuZGluZyBvbiBlZmkvcmVsb2NzLWR1bW15Lm8sIGFyY2gveDg2
L01ha2VmaWxlCj4gPj4+IHdpbGwgYXR0ZW1wdCB0byBidWlsZCB0aGF0IG9iamVjdC4gVGhpcyBy
ZXN1bHQgaW4gdGhlIGRlcGVuZGVuY3kgZmlsZQo+ID4+PiBiZWVuIGdlbmVyYXRlZCB3aXRoIHJl
bG9jcy1kdW1teS5vIGRlcGVuZGluZyBvbiBlZmkvcmVsb2NzLWR1bW15Lm8uClsuLl0KPiBTbyBJ
IGd1ZXNzIEknZCBsaWtlIHRvIGluY2x1ZGUgIm1heSIgdGhlbiBpbiB0aGF0IHNwZWNpZmljIHNl
bnRlbmNlIG9mCj4gdGhlIGNvbW1pdCBtZXNzYWdlLCB3aGljaCB3b3VsZCBiZSBlYXN5IGVub3Vn
aCB0byBkbyB3aGlsZSBjb21taXR0aW5nLgoKT2ssIHNvIHRoYXQgZmlyc3QgcGFyYWdyYXBoIGNh
biBiZSByZXdyaXR0ZW46CgpXaXRoICQoVEFSR0VUKS5lZmkgZGVwZW5kaW5nIG9uIGVmaS9yZWxv
Y3MtZHVtbXkubywgYXJjaC94ODYvTWFrZWZpbGUKd2lsbCBhdHRlbXB0IHRvIGJ1aWxkIHRoYXQg
b2JqZWN0LiBUaGlzIHJlc3VsdCBpbiB0aGUgZGVwZW5kZW5jeSBmaWxlCmJlZW4gZ2VuZXJhdGVk
IHRoYXQgbWF5IGhhdmUgcmVsb2NzLWR1bW15Lm8gZGVwZW5kaW5nIG9uCmVmaS9yZWxvY3MtZHVt
bXkuby4KClRoYW5rcywKCi0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
