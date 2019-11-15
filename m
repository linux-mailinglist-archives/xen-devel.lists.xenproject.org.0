Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E46EEFDF7C
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 14:57:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVc4I-0000eE-AS; Fri, 15 Nov 2019 13:55:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qjfG=ZH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iVc4G-0000e9-IR
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 13:55:20 +0000
X-Inumbo-ID: 8c3de184-07af-11ea-a26f-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8c3de184-07af-11ea-a26f-12813bfff9fa;
 Fri, 15 Nov 2019 13:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573826115;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=xPE9pYx6DuWYoPmhXeuqB0/abEFCyc5WbAeYFSDs8oU=;
 b=bfHPotRwt4eFJL3Hod0Z/cL87Kh6uTm1pAhUZ4X9c1lvjtCfnEk/fVC3
 7VemhVDwAg7JhoJ27RqNvKRVFEWaMi+pe1opLSS1O5wPCGRicpSOZ2pT1
 rS+7MrbeyZFHlEl6yojjQNxChU2A8Mczi/7OKSVtgEsubBiV/FDhR7pEW 8=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 76tClWyTo+41M1vdQ6JGfF3VAEpNkCkzGuhgn5R+z76+uQQU5QlcS1E9E7vMqeuSH6LntfrvkR
 l901ktKtISnAGv0UPQIm1gsrDBSVQFCLYCUwAPqpEIQFBLJP91WRBk/FoWiMIw2ncMH1vkwod/
 Yx/IM9rO7MMhTkk9XNPooezRIWQS6ewXpo6IZG3c09LClLGyUh0LIgw2l+BXLxMUWWRs/OUl0n
 Uu3+V4gd3RhYx2nscCz+u2nBnQPlq6/ynpGjthW1mgRqQj5vtTZMnkyNh0lB6NzMErdbqW4x9Q
 Pcs=
X-SBRS: 2.7
X-MesageID: 8496683
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,308,1569297600"; 
   d="scan'208";a="8496683"
To: Jan Beulich <jbeulich@suse.com>, George Dunlap <george.dunlap@citrix.com>
References: <20191115105739.20333-1-george.dunlap@citrix.com>
 <ec3be412-f0a1-6e04-ba62-5f27a06ab8ad@suse.com>
 <5751f0af-610b-a21d-9a6a-8c64e38140ac@citrix.com>
 <c1b1424f-382d-ffb3-6123-131312b2851c@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <607854b0-00a2-df11-d977-af6498050c40@citrix.com>
Date: Fri, 15 Nov 2019 13:55:08 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <c1b1424f-382d-ffb3-6123-131312b2851c@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH RFC] x86: Add hack to disable "Fake HT" mode
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 IanJackson <ian.jackson@citrix.com>, Steven Haigh <netwiz@crc.id.au>,
 Andreas Kinzler <hfp@posteo.de>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUvMTEvMjAxOSAxMjozOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTUuMTEuMjAxOSAx
Mjo1OCwgR2VvcmdlIER1bmxhcCB3cm90ZToKPj4gT24gMTEvMTUvMTkgMTE6MTIgQU0sIEphbiBC
ZXVsaWNoIHdyb3RlOgo+Pj4gT24gMTUuMTEuMjAxOSAxMTo1NywgR2VvcmdlIER1bmxhcCB3cm90
ZToKPj4+PiAtLS0gYS90b29scy9saWJ4Yy94Y19jcHVpZF94ODYuYwo+Pj4+ICsrKyBiL3Rvb2xz
L2xpYnhjL3hjX2NwdWlkX3g4Ni5jCj4+Pj4gQEAgLTU3OSw1MiArNTc5LDY4IEBAIGludCB4Y19j
cHVpZF9hcHBseV9wb2xpY3koeGNfaW50ZXJmYWNlICp4Y2gsIHVpbnQzMl90IGRvbWlkLAo+Pj4+
ICAgICAgfQo+Pj4+ICAgICAgZWxzZQo+Pj4+ICAgICAgewo+Pj4+IC0gICAgICAgIC8qCj4+Pj4g
LSAgICAgICAgICogVG9wb2xvZ3kgZm9yIEhWTSBndWVzdHMgaXMgZW50aXJlbHkgY29udHJvbGxl
ZCBieSBYZW4uICBGb3Igbm93LCB3ZQo+Pj4+IC0gICAgICAgICAqIGhhcmRjb2RlIEFQSUNfSUQg
PSB2Y3B1X2lkICogMiB0byBnaXZlIHRoZSBpbGx1c2lvbiBvZiBubyBTTVQuCj4+Pj4gLSAgICAg
ICAgICovCj4+Pj4gLSAgICAgICAgcC0+YmFzaWMuaHR0ID0gdHJ1ZTsKPj4+PiArICAgICAgICBw
LT5iYXNpYy5odHQgPSBmYWxzZTsKPj4+PiAgICAgICAgICBwLT5leHRkLmNtcF9sZWdhY3kgPSBm
YWxzZTsKPj4+PiAgCj4+Pj4gLSAgICAgICAgLyoKPj4+PiAtICAgICAgICAgKiBMZWFmIDEgRUJY
WzIzOjE2XSBpcyBNYXhpbXVtIExvZ2ljYWwgUHJvY2Vzc29ycyBQZXIgUGFja2FnZS4KPj4+PiAt
ICAgICAgICAgKiBVcGRhdGUgdG8gcmVmbGVjdCB2TEFQSUNfSUQgPSB2Q1BVX0lEICogMiwgYnV0
IG1ha2Ugc3VyZSB0byBhdm9pZAo+Pj4+IC0gICAgICAgICAqIG92ZXJmbG93Lgo+Pj4+IC0gICAg
ICAgICAqLwo+Pj4+IC0gICAgICAgIGlmICggIShwLT5iYXNpYy5scHBwICYgMHg4MCkgKQo+Pj4+
IC0gICAgICAgICAgICBwLT5iYXNpYy5scHBwICo9IDI7Cj4+Pj4gLQo+Pj4gSSBhcHByZWNpYXRl
IHlvdSB3YW50aW5nIHRvIHB1dCBhbGwgYWRqdXN0bWVudHMgaW4gYSBjZW50cmFsIHBsYWNlLCBi
dXQKPj4+IGF0IGxlYXN0IGl0IG1ha2VzIHBhdGNoIHJldmlldyBtb3JlIGRpZmZpY3VsdC4gSG93
IGFib3V0IHlvdSBsYXRjaAo+Pj4gIWdldGVudigiWEVOX0xJQlhDX0RJU0FCTEVfRkFLRUhUIikg
aW50byBhIGxvY2FsIGJvb2xlYW4gYXQgdGhlIHRvcCBvZgo+Pj4gdGhlIGZ1bmN0aW9uIGFuZCB0
aGVuIHRoZSBhYm92ZSB3b3VsZCBiZWNvbWUKPj4+Cj4+PiAgICAgICAgIGlmICggIShwLT5iYXNp
Yy5scHBwICYgMHg4MCkgKQo+Pj4gICAgICAgICAgICAgcC0+YmFzaWMubHBwcCA8PD0gZmFrZWh0
Owo+Pj4KPj4+IGFuZCBlLmcuIC4uLgo+Pj4KPj4+PiAgICAgICAgICBzd2l0Y2ggKCBwLT54ODZf
dmVuZG9yICkKPj4+PiAgICAgICAgICB7Cj4+Pj4gICAgICAgICAgY2FzZSBYODZfVkVORE9SX0lO
VEVMOgo+Pj4+ICAgICAgICAgICAgICBmb3IgKCBpID0gMDsgKHAtPmNhY2hlLnN1YmxlYWZbaV0u
dHlwZSAmJgo+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGkgPCBBUlJBWV9TSVpFKHAt
PmNhY2hlLnJhdykpOyArK2kgKQo+Pj4+ICAgICAgICAgICAgICB7Cj4+Pj4gLSAgICAgICAgICAg
ICAgICBwLT5jYWNoZS5zdWJsZWFmW2ldLmNvcmVzX3Blcl9wYWNrYWdlID0KPj4+PiAtICAgICAg
ICAgICAgICAgICAgICAocC0+Y2FjaGUuc3VibGVhZltpXS5jb3Jlc19wZXJfcGFja2FnZSA8PCAx
KSB8IDE7Cj4+PiAuLi4gdGhpcwo+Pj4KPj4+ICAgICAgICAgICAgICAgICBwLT5jYWNoZS5zdWJs
ZWFmW2ldLmNvcmVzX3Blcl9wYWNrYWdlID0KPj4+ICAgICAgICAgICAgICAgICAgICAgKHAtPmNh
Y2hlLnN1YmxlYWZbaV0uY29yZXNfcGVyX3BhY2thZ2UgPDwgZmFrZWh0KSB8IGZha2VodDsKPj4g
SSdtIGFmcmFpZCBJIHRoaW5rIHRoZSBjb2RlIGl0c2VsZiB3b3VsZCB0aGVuIGJlY29tZSBtb3Jl
IGRpZmZpY3VsdCB0bwo+PiByZWFkOwo+IFNsaWdodGx5LCBidXQgeWVzLgo+Cj4+IGFuZCBpdCBz
ZWVtcyBhIGJpdCBzdHJhbmdlIHRvIGJlIGFyY2hpdGVjdGluZyBvdXIgY29kZSBiYXNlZCBvbgo+
PiBsaW1pdGF0aW9ucyBvZiB0aGUgZGlmZiBhbGdvcml0aG0gYW5kL29yIGRpZmYgdmlld2VyIHVz
ZWQuCj4gSXQncyBub3QgZW50aXJlbHkgdW5jb21tb24gdG8gKGFsc28pIGNvbnNpZGVyIGhvdyB0
aGUgcmVzdWx0aW5nCj4gZGlmZiB3b3VsZCBsb29rIGxpa2Ugd2hlbiBwdXR0aW5nIHRvZ2V0aGVy
IGEgY2hhbmdlLiBBbmQgYmVzaWRlcwo+IHRoZSByZXZpZXcgYXNwZWN0LCB0aGVyZSdzIGFsc28g
dGhlIGFyY2hlb2xvZ3kgb25lIC0gImdpdCBibGFtZSIKPiB5aWVsZHMgbXVjaCBtb3JlIGhlbHBm
dWwgcmVzdWx0cyB3aGVuIGNvZGUgZG9lc24ndCBnZXQgbW92ZWQKPiBhcm91bmQgbW9yZSB0aGFu
IG5lY2Vzc2FyeS4gQnV0IHllcywgdGhlcmUncyBubyB2ZXJ5IGNsZWFyICJ0aGlzCj4gaXMgdGhl
IGJldHRlciBvcHRpb24iIGhlcmUuIEkndmUgdGFrZW4gYW5vdGhlciBsb29rIGF0IHRoZSBjb2Rl
Cj4gYmVmb3JlIHlvdXIgY2hhbmdlIHRob3VnaCAtIGV2ZXJ5dGhpbmcgaXMgYWxyZWFkeSBuaWNl
bHkgaW4gb25lCj4gcGxhY2Ugd2l0aCBBbmRyZXcncyBtb3N0IHJlY2VudCBjb2RlIHJlb3JnLiBT
byBJJ20gbm93IGhhdmluZyBhbgo+IGV2ZW4gaGFyZGVyIHRpbWUgc2VlaW5nIHdoeSB5b3Ugd2Fu
dCB0byBtb3ZlIHRoaW5ncyBhcm91bmQgYWdhaW4uCgpXZSBkb24ndC7CoCBJJ3ZlIHJlY29tbWVu
ZCB0d2ljZSBub3cgdG8gaGF2ZSBhIHNpbmdsZSAiZWxzZSBpZiIgaHVuawp3aGljaCBpcyBuZWFy
bHkgZW1wdHksIGFuZCBtdWNoIG1vcmUgb2J2aW91c2x5IGEgZ3Jvc3MgIm1ha2UgaXQgd29yayBm
b3IKNC4xMyIgYm9kZ2UuCgpUaGUgb25seSB0aGluZyB3aGljaCBpcyBhbiBvcGVuIHF1ZXN0aW9u
IChJTU8pIGlzIGlmL2hvdyB0byB0cmlnZ2VyIHRoaXMKcXVpcmsgbW9kZS7CoCBUaGVyZSBhcmUg
bm8gZ29vZCBvcHRpb25zLsKgIFdlIGp1c3QgbmVlZCB0byBhZ3JlZSBvbiB0aGUKbGVhc3QgYmFk
IG9uZS4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
