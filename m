Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 523AC15BC1D
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2020 10:52:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2B7s-0004TX-IK; Thu, 13 Feb 2020 09:49:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=PyN9=4B=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j2B7q-0004TS-MM
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2020 09:49:38 +0000
X-Inumbo-ID: 25b5fc66-4e46-11ea-b0fd-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 25b5fc66-4e46-11ea-b0fd-bc764e2007e4;
 Thu, 13 Feb 2020 09:49:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4B12EB240;
 Thu, 13 Feb 2020 09:49:37 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>
References: <20200212160918.18470-1-liuwe@microsoft.com>
 <20200212160918.18470-5-liuwe@microsoft.com>
 <20200212174347.GU4679@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <893afd1e-03fd-f869-9bf6-4483f194bc98@suse.com>
Date: Thu, 13 Feb 2020 10:49:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200212174347.GU4679@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 4/4] x86/hyperv: L0 assisted TLB flush
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
Cc: Xen Development List <xen-devel@lists.xenproject.org>,
 Paul Durrant <pdurrant@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <liuwe@microsoft.com>, Michael Kelley <mikelley@microsoft.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMDIuMjAyMCAxODo0MywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBXZWQsIEZl
YiAxMiwgMjAyMCBhdCAwNDowOToxOFBNICswMDAwLCBXZWkgTGl1IHdyb3RlOgo+PiBJbXBsZW1l
bnQgTDAgYXNzaXN0ZWQgVExCIGZsdXNoIGZvciBYZW4gb24gSHlwZXItVi4gSXQgdGFrZXMgYWR2
YW50YWdlCj4+IG9mIHNldmVyYWwgaHlwZXJjYWxsczoKPj4KPj4gICogSFZDQUxMX0ZMVVNIX1ZJ
UlRVQUxfQUREUkVTU19MSVNUCj4+ICAqIEhWQ0FMTF9GTFVTSF9WSVJUVUFMX0FERFJFU1NfTElT
VF9FWAo+PiAgKiBIVkNBTExfRkxVU0hfVklSVFVBTF9BRERSRVNTX1NQQUNFCj4+ICAqIEhWQ0FM
TF9GTFVTSF9WSVJUVUFMX0FERFJFU1NfU1BBQ0VfRVgKPj4KPj4gUGljayB0aGUgbW9zdCBlZmZp
Y2llbnQgaHlwZXJjYWxscyBhdmFpbGFibGUuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUg
PGxpdXdlQG1pY3Jvc29mdC5jb20+Cj4+IC0tLQo+PiAgeGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVy
di9NYWtlZmlsZSAgfCAgIDEgKwo+PiAgeGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9wcml2YXRl
LmggfCAgIDkgKysKPj4gIHhlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvdGxiLmMgICAgIHwgMTcy
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKy0KPj4gIHhlbi9hcmNoL3g4Ni9ndWVzdC9oeXBl
cnYvdXRpbC5jICAgIHwgIDcyICsrKysrKysrKysrKwo+PiAgNCBmaWxlcyBjaGFuZ2VkLCAyNTMg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9h
cmNoL3g4Ni9ndWVzdC9oeXBlcnYvdXRpbC5jCj4+Cj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94
ODYvZ3Vlc3QvaHlwZXJ2L01ha2VmaWxlIGIveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9NYWtl
ZmlsZQo+PiBpbmRleCAxODkwMmMzM2U5Li4wZTM5NDEwOTY4IDEwMDY0NAo+PiAtLS0gYS94ZW4v
YXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L01ha2VmaWxlCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9ndWVz
dC9oeXBlcnYvTWFrZWZpbGUKPj4gQEAgLTEsMiArMSwzIEBACj4+ICBvYmoteSArPSBoeXBlcnYu
bwo+PiAgb2JqLXkgKz0gdGxiLm8KPj4gK29iai15ICs9IHV0aWwubwo+PiBkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9wcml2YXRlLmggYi94ZW4vYXJjaC94ODYvZ3Vlc3Qv
aHlwZXJ2L3ByaXZhdGUuaAo+PiBpbmRleCA3OGU1MmY3NGNlLi4zMTFmMDYwNDk1IDEwMDY0NAo+
PiAtLS0gYS94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L3ByaXZhdGUuaAo+PiArKysgYi94ZW4v
YXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L3ByaXZhdGUuaAo+PiBAQCAtMjQsMTIgKzI0LDIxIEBACj4+
ICAKPj4gICNpbmNsdWRlIDx4ZW4vY3B1bWFzay5oPgo+PiAgI2luY2x1ZGUgPHhlbi9wZXJjcHUu
aD4KPj4gKyNpbmNsdWRlIDx4ZW4vdHlwZXMuaD4KPj4gIAo+PiAgREVDTEFSRV9QRVJfQ1BVKHZv
aWQgKiwgaHZfaW5wdXRfcGFnZSk7Cj4+ICBERUNMQVJFX1BFUl9DUFUodm9pZCAqLCBodl92cF9h
c3Npc3QpOwo+PiAgREVDTEFSRV9QRVJfQ1BVKHVpbnQzMl90LCBodl92cF9pbmRleCk7Cj4+ICAK
Pj4gK3N0YXRpYyBpbmxpbmUgdWludDMyX3QgaHZfdnBfaW5kZXgoaW50IGNwdSkKPiAKPiB1bnNp
Z25lZCBpbnQgZm9yIGNwdS4KCkFuZCBhbHNvIGZvciB0aGUgcmV0dXJuIHR5cGUsIGFzIHBlciBt
eSBjb21tZW50IG9uIHBhdGNoIDEuCgo+PiAtLS0gYS94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2
L3RsYi5jCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvdGxiLmMKPj4gQEAgLTE5
LDE1ICsxOSwxODUgQEAKPj4gICAqIENvcHlyaWdodCAoYykgMjAyMCBNaWNyb3NvZnQuCj4+ICAg
Ki8KPj4gIAo+PiArI2luY2x1ZGUgPHhlbi9jcHUuaD4KPj4gICNpbmNsdWRlIDx4ZW4vY3B1bWFz
ay5oPgo+PiAgI2luY2x1ZGUgPHhlbi9lcnJuby5oPgo+PiAgCj4+ICsjaW5jbHVkZSA8YXNtL2d1
ZXN0L2h5cGVydi5oPgo+PiArI2luY2x1ZGUgPGFzbS9ndWVzdC9oeXBlcnYtaGNhbGwuaD4KPj4g
KyNpbmNsdWRlIDxhc20vZ3Vlc3QvaHlwZXJ2LXRsZnMuaD4KPj4gKwo+PiAgI2luY2x1ZGUgInBy
aXZhdGUuaCIKPj4gIAo+PiArLyoKPj4gKyAqIEl0IGlzIHBvc3NpYmxlIHRvIGVuY29kZSB1cCB0
byA0MDk2IHBhZ2VzIHVzaW5nIHRoZSBsb3dlciAxMiBiaXRzCj4+ICsgKiBpbiBhbiBlbGVtZW50
IG9mIGd2YV9saXN0Cj4+ICsgKi8KPj4gKyNkZWZpbmUgSFZfVExCX0ZMVVNIX1VOSVQgKDQwOTYg
KiBQQUdFX1NJWkUpCj4+ICsjZGVmaW5lIE9SREVSX1RPX0JZVEVTKG9yZGVyKSAoKDF1bCA8PCAo
b3JkZXIpKSAqIFBBR0VfU0laRSkKPiAKPiBUaGVyZSBhcmUgYWxyZWFkeSBzb21lIGNvbnZlcnNp
b24gZnVuY3Rpb25zIGluIHhlbi9tbS5oCj4gKGdldF9vcmRlcl9mcm9tX3tieXRlcy9wYWdlc30p
LCBtYXliZSB5b3UgY291bGQgYWRkIGEKPiBnZXRfYnl0ZXNfZnJvbV9vcmRlciBoZWxwZXIgdGhl
cmU/CgpJIGRvbid0IHRoaW5rIGEgbWFjcm8gKG9yIGhlbHBlciBmdW5jdGlvbikgaXMgd29ydGh3
aGlsZSBoZXJlIC0gd2UKZG9uJ3QgaGF2ZSBhbnkgaW4gdGhlIHZhcmlvdXMgb3RoZXIgcGxhY2Vz
IHRoYXQgZG8gdGhlIHNhbWUuIFRoZQphYm92ZSBzaG91bGQgYmUgdXNlZCBpbmxpbmUsIHByZWZl
cmFibHkgaW4gdGhlIHNpbXBsZXIgZm9ybSBvZgpQQUdFX1NJWkUgPDwgb3JkZXIuCgpKYW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
