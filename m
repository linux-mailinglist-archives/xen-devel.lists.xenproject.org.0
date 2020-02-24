Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D69316AAB5
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2020 17:05:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6GCM-0001mS-0j; Mon, 24 Feb 2020 16:03:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=04fq=4M=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j6GCJ-0001mN-N6
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2020 16:03:07 +0000
X-Inumbo-ID: 24e6612c-571f-11ea-a490-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 24e6612c-571f-11ea-a490-bc764e2007e4;
 Mon, 24 Feb 2020 16:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582560186;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=qOdPjUzDfrzGRYJgLpL+LRVjBok1jP1PFPoYpxC72EM=;
 b=Phfb+LPkyHYfE7V3YTtmnHdfUO4JuuBDJ9FS0gV2EQadN3jn7qY1pSGU
 8WRYA2bT5XySzrPgyz6ND/QVOmEXeZDaTSVAd5Lw8FMJYxPzFvYjUKVJ3
 gi6p9TMEL/s1UlcU/1wUs6fFBE7fGCDTrsazTQkzIWAANDiWNMUtjVySi o=;
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
IronPort-SDR: uwUxffFg7wg1Oy2S230/oxC3QLf8uzoquoiKrfnzBjRs2yUzyLNngyoWKUdNFjS0dYPfMw9aTU
 DTtTTGJg8bhhhEXwr3dkn1xnaYd6STbB+4gozZ9daCv1aA5VBTk3c7ZdFR9Z2b/b4EWwhbNwhW
 gJL3umu6xE7M0s/q1K+EwEVhri1s1IZ1WbHUtdpwJqGoYZnFnB4uI6zWC3/qOjRxWpG5RGVW4P
 t2wgwtKof82kICHdmoTxlTpFAyO76YeQ5flhaLaYzdt+i3o6kKFzN6QgO9htBBamFzoUMOtbhs
 lfU=
X-SBRS: 2.7
X-MesageID: 13272454
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,480,1574139600"; d="scan'208";a="13272454"
Date: Mon, 24 Feb 2020 17:02:59 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Message-ID: <20200224160259.GW4679@Air-de-Roger>
References: <cover.1582310142.git.tamas.lengyel@intel.com>
 <818edf7f9407e377bba6564d58b9c65bce5e6493.1582310142.git.tamas.lengyel@intel.com>
 <20200224151250.GR4679@Air-de-Roger>
 <CABfawhmxwVbNH3o2wpn+SpH=cpVkYS2FsxPccFQt=XqQr=KMwA@mail.gmail.com>
 <20200224154218.GU4679@Air-de-Roger>
 <CABfawh=zNFS=aB45jeTkeqsG3dZjQsX8b2RMdeFOYG_UJ3=+bQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABfawh=zNFS=aB45jeTkeqsG3dZjQsX8b2RMdeFOYG_UJ3=+bQ@mail.gmail.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v9 4/5] x86/mem_sharing: reset a fork
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
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBGZWIgMjQsIDIwMjAgYXQgMDg6NDk6NTFBTSAtMDcwMCwgVGFtYXMgSyBMZW5neWVs
IHdyb3RlOgo+IE9uIE1vbiwgRmViIDI0LCAyMDIwIGF0IDg6NDIgQU0gUm9nZXIgUGF1IE1vbm7D
qSA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIE1vbiwgRmViIDI0LCAy
MDIwIGF0IDA4OjM1OjA5QU0gLTA3MDAsIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPiA+ID4gT24g
TW9uLCBGZWIgMjQsIDIwMjAgYXQgODoxMyBBTSBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBPbiBGcmksIEZlYiAyMSwgMjAyMCBh
dCAxMDo0OToyMkFNIC0wODAwLCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4gPiA+ID4gPiBJbXBs
ZW1lbnQgaHlwZXJjYWxsIHRoYXQgYWxsb3dzIGEgZm9yayB0byBzaGVkIGFsbCBtZW1vcnkgdGhh
dCBnb3QgYWxsb2NhdGVkCj4gPiA+ID4gPiBmb3IgaXQgZHVyaW5nIGl0cyBleGVjdXRpb24gYW5k
IHJlLWxvYWQgaXRzIHZDUFUgY29udGV4dCBmcm9tIHRoZSBwYXJlbnQgVk0uCj4gPiA+ID4gPiBU
aGlzIGFsbG93cyB0aGUgZm9ya2VkIFZNIHRvIHJlc2V0IGludG8gdGhlIHNhbWUgc3RhdGUgdGhl
IHBhcmVudCBWTSBpcyBpbiBhCj4gPiA+ID4gPiBmYXN0ZXIgd2F5IHRoZW4gY3JlYXRpbmcgYSBu
ZXcgZm9yayB3b3VsZCBiZS4gTWVhc3VyZW1lbnRzIHNob3cgYWJvdXQgYSAyeAo+ID4gPiA+ID4g
c3BlZWR1cCBkdXJpbmcgbm9ybWFsIGZ1enppbmcgb3BlcmF0aW9ucy4gUGVyZm9ybWFuY2UgbWF5
IHZhcnkgZGVwZW5kaW5nIGhvdwo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXiBvbgo+ID4gPiA+
ID4gbXVjaCBtZW1vcnkgZ290IGFsbG9jYXRlZCBmb3IgdGhlIGZvcmtlZCBWTS4gSWYgaXQgaGFz
IGJlZW4gY29tcGxldGVseQo+ID4gPiA+ID4gZGVkdXBsaWNhdGVkIGZyb20gdGhlIHBhcmVudCBW
TSB0aGVuIGNyZWF0aW5nIGEgbmV3IGZvcmsgd291bGQgbGlrZWx5IGJlIG1vcmUKPiA+ID4gPiA+
IHBlcmZvcm1hbnQuCj4gPiA+ID4gPgo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogVGFtYXMgSyBM
ZW5neWVsIDx0YW1hcy5sZW5neWVsQGludGVsLmNvbT4KPiA+ID4gPiA+IC0tLQo+ID4gPiA+ID4g
IHhlbi9hcmNoL3g4Ni9tbS9tZW1fc2hhcmluZy5jIHwgNzYgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysKPiA+ID4gPiA+ICB4ZW4vaW5jbHVkZS9wdWJsaWMvbWVtb3J5LmggICB8
ICAxICsKPiA+ID4gPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDc3IGluc2VydGlvbnMoKykKPiA+ID4g
PiA+Cj4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMg
Yi94ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJpbmcuYwo+ID4gPiA+ID4gaW5kZXggYWQ1ZGI5ZDhk
NS4uZmI2ODkyYWFhNiAxMDA2NDQKPiA+ID4gPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9tZW1f
c2hhcmluZy5jCj4gPiA+ID4gPiArKysgYi94ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJpbmcuYwo+
ID4gPiA+ID4gQEAgLTE2MzYsNiArMTYzNiw1OSBAQCBzdGF0aWMgaW50IG1lbV9zaGFyaW5nX2Zv
cmsoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IGRvbWFpbiAqY2QpCj4gPiA+ID4gPiAgICAgIHJl
dHVybiByYzsKPiA+ID4gPiA+ICB9Cj4gPiA+ID4gPgo+ID4gPiA+ID4gKy8qCj4gPiA+ID4gPiAr
ICogVGhlIGZvcmsgcmVzZXQgb3BlcmF0aW9uIGlzIGludGVuZGVkIHRvIGJlIHVzZWQgb24gc2hv
cnQtbGl2ZWQgZm9ya3Mgb25seS4KPiA+ID4gPiA+ICsgKiBUaGVyZSBpcyBubyBoeXBlcmNhbGwg
Y29udGludWF0aW9uIG9wZXJhdGlvbiBpbXBsZW1lbnRlZCBmb3IgdGhpcyByZWFzb24uCj4gPiA+
ID4gPiArICogRm9yIGZvcmtzIHRoYXQgb2J0YWluIGEgbGFyZ2VyIG1lbW9yeSBmb290cHJpbnQg
aXQgaXMgbGlrZWx5IGdvaW5nIHRvIGJlCj4gPiA+ID4gPiArICogbW9yZSBwZXJmb3JtYW50IHRv
IGNyZWF0ZSBhIG5ldyBmb3JrIGluc3RlYWQgb2YgcmVzZXR0aW5nIGFuIGV4aXN0aW5nIG9uZS4K
PiA+ID4gPiA+ICsgKgo+ID4gPiA+ID4gKyAqIFRPRE86IEluIGNhc2UgdGhpcyBoeXBlcmNhbGwg
d291bGQgYmVjb21lIHVzZWZ1bCBvbiBmb3JrcyB3aXRoIGxhcmdlciBtZW1vcnkKPiA+ID4gPiA+
ICsgKiBmb290cHJpbnRzIHRoZSBoeXBlcmNhbGwgY29udGludWF0aW9uIHNob3VsZCBiZSBpbXBs
ZW1lbnRlZC4KPiA+ID4gPgo+ID4gPiA+IEknbSBhZnJhaWQgdGhpcyBpcyBub3Qgc2FmZSwgYXMg
dXNlcnMgZG9uJ3QgaGF2ZSBhbiBlYXN5IHdheSB0byBrbm93Cj4gPiA+ID4gd2hldGhlciBhIGZv
cmsgd2lsbCBoYXZlIGEgbGFyZ2UgbWVtb3J5IGZvb3RwcmludCBvciBub3QuCj4gPiA+Cj4gPiA+
IFRoZXkgZG8sIGdldGRvbWFpbmluZm8gdGVsbHMgYSB1c2VyIGV4YWN0bHkgaG93IG11Y2ggbWVt
b3J5IGhhcyBiZWVuCj4gPiA+IGFsbG9jYXRlZCBmb3IgYSBkb21haW4uCj4gPiA+Cj4gPiA+ID4K
PiA+ID4gPiBJTU8geW91IGVpdGhlciBuZWVkIHNvbWUga2luZCBvZiBjaGVjayB0aGF0IHByZXZl
bnRzIHRoaXMgZnVuY3Rpb24KPiA+ID4gPiBmcm9tIGJlaW5nIGV4ZWN1dGVkIHdoZW4gdGhlIGRv
bWFpbiBhcyB0b28gbXVjaCBtZW1vcnkgYXNzaWduZWQsIG9yCj4gPiA+ID4geW91IG5lZWQgdG8g
aW1wbGVtZW50IGNvbnRpbnVhdGlvbnMuCj4gPiA+Cj4gPiA+IEkgcmVhbGx5IGRvbid0IHRoaW5r
IHdlIG5lZWQgY29udGludWF0aW9uIGhlcmUgd2l0aCB0aGUgdXNlY2FzZSB3ZQo+ID4gPiBoYXZl
IGZvciB0aGlzIGZ1bmN0aW9uIGJ1dCBJJ20gYWxzbyB0aXJlZCBvZiBhcmd1aW5nIGFib3V0IGl0
LCBzbyBJJ2xsCj4gPiA+IGp1c3QgYWRkIGl0IGV2ZW4gaWYgaXRzIGdvaW5nIHRvIGJlIGRlYWQg
Y29kZS4KPiA+ID4KPiA+ID4gPgo+ID4gPiA+IE9yIGVsc2UgdGhpcyBpcyB2ZXJ5IGxpa2VseSB0
byB0cmlwIG92ZXIgdGhlIHdhdGNoZG9nLgo+ID4gPgo+ID4gPiBUaGUgd2F0Y2hkb2c/Cj4gPgo+
ID4gWWVzLCBYZW4gaGFzIGEgd2F0Y2hkb2cgYW5kIHRoaXMgbG9vcCBpcyBsaWtlbHkgdG8gdHJp
Z2dlciBpdCBpZiBpdAo+ID4gdGFrZXMgPiA1cyB0byBjb21wbGV0ZS4gVGhlIHdhdGNoZG9nIHRy
aWdnZXJpbmcgaXMgYSBmYXRhbCBldmVudCBhbmQKPiA+IGxlYWRzIHRvIGhvc3QgY3Jhc2guCj4g
Cj4gT0ssIGp1c3QgdG8gZ2l2ZSB5b3UgbnVtYmVycywgaW4gdGhlIHVzZWNhc2UgdGhpcyBmdW5j
dGlvbiBpcyB0YXJnZXRlZAo+IGF0IHdlIGNhbGwgaXQgYWJvdXQgfjEwMC9zLiBFdmVuIGluIG91
ciB3b3JzdCBjYXNlIHNjZW5hcmlvIHdlJ3ZlIHNlZW4KPiBzbyBmYXIgd2UgaGF2ZW4ndCBoYWQg
YSBkb21haW4gd2l0aCBlbm91Z2ggbWVtb3J5IGRlZHVwbGljYXRpb24gd2hlcmUKPiB0aGlzIGZ1
bmN0aW9uIHRvb2sgbG9uZ2VyIHRoZW4gMXMgdG8gZmluaXNoLiBCdXQgYWdhaW4sIGF0IHRoaXMg
cG9pbnQKPiB3ZSBzcGVudCBtb3JlIHRpbWUgYXJndWluZyBhYm91dCBjb250aW51YXRpb24gdGhl
biBpdCB0YWtlcyB0byBhZGQgaXQKPiBzbyBsZXRzIGp1c3QgbW92ZSBvbi4KClJpZ2h0LCBhZGRp
bmcgY29udGludWF0aW9uIHN1cHBvcnQgaXMgZmFpcmx5IHRyaXZpYWwsIGFuZCBpdCB3b3VsZApr
ZWVwIHVzIG9uIHRoZSBzYWZlIHNpZGUuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
