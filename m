Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C10B18BC62
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2020 17:26:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jExy0-00020A-A5; Thu, 19 Mar 2020 16:24:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=shbX=5E=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jExxz-000203-EH
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2020 16:24:19 +0000
X-Inumbo-ID: 14e107d6-69fe-11ea-bc3e-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 14e107d6-69fe-11ea-bc3e-12813bfff9fa;
 Thu, 19 Mar 2020 16:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584635059;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=mAXRaGt24TQuINFSpRoa7Cuxdp5Y1Z8OOdR2ymyzxA4=;
 b=Mxlxd4L6+v+NAumkshraOFu/7P3bTEzy2bLWzCLGsqrvZCCvjwXoN5XE
 5bLaQHjeZLCwdFz3Jbaq7F0mQA9CQquoFRgjmrF11MLR07rydGiSmDz02
 oKx6Kg5vKlslgK8IMxvfX5O9l9TQL2TueZXxp0RC0CJLxBklbVlpHv2W5 4=;
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
IronPort-SDR: eALVrkJ10XhfBW/01QdWbdtaknXmbRgfpblhKYxRDkvm3qGo2X1cU+k9zIiILsD+xn7rzUfV66
 WaP9oukx+ck8XDRY66VQ1a1X4gZg/JE/eH/0Q13qdhIpaFoYDDFp1YlU+WMlF1jEBSEiU/OJxa
 xeqmSlUzPHmt+lDcS8MyXQmfZqeCLF2QNpJ6UoVow8p/jWghb3MpelTZJK8oPy0p4xt7YkBb15
 KWiFFj8PDr4g5NzRNEC10HTMfTWutWZTxRtPpOkSHYopypPay+4xgGPSgFVGj0oLRKB6CrqnuN
 VTE=
X-SBRS: 2.7
X-MesageID: 14290978
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,572,1574139600"; d="scan'208";a="14290978"
Date: Thu, 19 Mar 2020 16:24:12 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Message-ID: <20200319162412.GH4088@perard.uk.xensource.com>
References: <20200226113355.2532224-1-anthony.perard@citrix.com>
 <20200226113355.2532224-16-anthony.perard@citrix.com>
 <20200227110504.GN24458@Air-de-Roger.citrite.net>
 <20200317180524.GA4088@perard.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200317180524.GA4088@perard.uk.xensource.com>
Subject: Re: [Xen-devel] [XEN PATCH v3 15/23] xen/build: have the root
 Makefile generates the CFLAGS
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBNYXIgMTcsIDIwMjAgYXQgMDY6MDU6MjRQTSArMDAwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gT24gVGh1LCBGZWIgMjcsIDIwMjAgYXQgMTI6MDU6MDRQTSArMDEwMCwgUm9nZXIg
UGF1IE1vbm7DqSB3cm90ZToKPiA+IE9uIFdlZCwgRmViIDI2LCAyMDIwIGF0IDExOjMzOjQ3QU0g
KzAwMDAsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+ID4gPiAraWZuZXEgKCQoQ09ORklHX0NDX0lT
X0NMQU5HKSx5KQo+ID4gPiArIyBDbGFuZyBkb2Vzbid0IHVuZGVyc3RhbmQgdGhpcyBjb21tYW5k
IGxpbmUgYXJndW1lbnQsIGFuZCBkb2Vzbid0IGFwcGVhciB0bwo+ID4gPiArIyBoYXZlIGFuIHN1
aXRhYmxlIGFsdGVybmF0aXZlLiAgVGhlIHJlc3VsdGluZyBjb21waWxlZCBiaW5hcnkgZG9lcyBm
dW5jdGlvbiwKPiA+ID4gKyMgYnV0IGhhcyBhbiBleGNlc3NpdmVseSBsYXJnZSBzeW1ib2wgdGFi
bGUuCj4gPiA+ICtDRkxBR1MgKz0gLVdhLC0tc3RyaXAtbG9jYWwtYWJzb2x1dGUKPiA+IAo+ID4g
VGhpcyBpcyBub3QgcmVhbGx5IHJlbGF0ZWQgdG8gY2xhbmcsIGJ1dCB0byB0aGUgYXNzZW1ibGVy
LiBJZiBjbGFuZyBpcwo+ID4gdXNlZCB3aXRoIC1uby1pbnRlZ3JhdGVkLWFzIGl0J3MgcXVpdGUg
bGlrZWx5IHRoYXQgdGhlIEdOVSBhc3NlbWJsZXIKPiA+IHdpbGwgYmUgdXNlZCwgYW5kIGhlbmNl
IHRoaXMgb3B0aW9uIHdvdWxkIGJlIGF2YWlsYWJsZS4KPiA+IAo+ID4gQ2FuIHdlIHVzZSBjYy1v
cHRpb24tYWRkIGhlcmUgaW4gb3JkZXIgdG8gZGV0ZWN0IHdoZXRoZXIgdGhlIGJ1aWxkCj4gPiB0
b29sY2hhaW4gc3VwcG9ydCB0aGUgb3B0aW9uPwo+IAo+IFRoYXQgY2FuIGJlIGRvbmUsIGJ1dCBJ
IHRoaW5rIEknbGwgZG8gdGhhdCBhcyBhIGZvbGxvdyB1cCBvZiB0aGlzIHBhdGNoLAo+IHRvIGF2
b2lkIHRvbyBtYW55IGNoYW5nZXMgd2hlbiBtb3ZpbmcgdGhlIGNmbGFncyBhcm91bmQuCj4gCj4g
PiBJZGVhbGx5IHRoaXMgc2hvdWxkIGJlIGRvbmUgYWZ0ZXIgdGhlIGludGVncmF0ZWQgYXNzZW1i
bGVyIHRlc3RzCj4gPiBwZXJmb3JtZWQgaW4geDg2L1J1bGVzLm1rLgoKU28sIHRlc3RpbmcgZm9y
IHRoZSAtV2EsLS1zdHJpcC1sb2NhbC1hYnNvbHV0ZSBmbGFncyB0dXJucyBvdXQgdG8gYmUKbW9y
ZSBjb21wbGljYXRlZCB0aGFuIEkgdGhvdWdoIGl0IHdvdWxkIGJlLgogLSBjYy1vcHRpb24tYWRk
IGRvZXNuJ3Qgd29yayBiZWNhdXNlIGl0IGRvZXNuJ3QgdGVzdCB3aXRoIHRoZSBjdXJyZW50IGxp
c3QKICAgb2YgQ0ZMQUdTLiBBbmQgaWYgSSBhZGQgdGhlIENGTEFHUywgY2xhbmcgc2F5cyB0aGUg
b3B0aW9uIGlzIHVudXNlZCwKICAgaXQgZG9lc24ndCBtYXR0ZXIgaWYgLW5vLWludGVncmF0ZWQt
YXMgaXMgcHJlc2VudCBvciBub3QuCiAtIEkgdHJpZWQgdG8gdXNlIGFzLW9wdGlvbiBtYWNybyBm
cm9tIExpbnV4IGJ1dCB0aGF0IGNvbWVzIHdpdGggaXNzdWVzCiAgIGFzIHdlbGwuIEkgZG9uJ3Qg
dGhpbmsgdGhhdCBlbm91Z2ggd29yayBhcyBiZWVuIGRvbmUgdG8gbWFrZSBpdCB3b3JrCiAgIHdl
bGwgd2l0aCBjbGFuZy4gKEkgcHJvYmFibHkgbmVlZCB0byBmaWx0ZXIgLVdhbGwgb3V0IG9mIHRo
ZSBDRkxBR1MKICAgd2hlbiB0ZXN0aW5nLCBhbmQgdGhleSBhcmUgcHJvYmFibHkgb3RoZXIgaXNz
dWVzLikKClNvIEkgdGhpbmsgSSBsZWF2ZSB0aGUgZW5oYW5jZW1lbnQgZm9yIGxhdGVyLiBIYXZp
bmcgdGhlIGZsYWcgZGVwZW5kcwpvbiBHQ0MgaXMgZ29vZCBlbm91Z2ggZm9yIG5vdy4KClRoYW5r
cywKCi0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
