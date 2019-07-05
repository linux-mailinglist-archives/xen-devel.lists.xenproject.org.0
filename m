Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E71560713
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jul 2019 16:01:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hjOi8-0007Ov-Tt; Fri, 05 Jul 2019 13:57:12 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8qSs=VC=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hjOi7-0007Og-G3
 for xen-devel@lists.xenproject.org; Fri, 05 Jul 2019 13:57:11 +0000
X-Inumbo-ID: c88311cb-9f2c-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c88311cb-9f2c-11e9-8980-bc764e045a96;
 Fri, 05 Jul 2019 13:57:10 +0000 (UTC)
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: BVKlpYwwRHzfqMtWOAQvvQqCwyC3tIowssZ4S3Pa+aGcIJb4+XBE4E5EZYhRZi64v07rrAwOtV
 2FLsA8srM8wSJV4oWxGB4TJnZ5p0neN1jGjrk8tlXvJIKBTQErmGoxVxEdbLrClgC83y2h4hnJ
 9hqJJYKKwgeEp0HCUr63XdF2b4H3A0tOoRW3mPFYYNudQD2PzlM9s/ifj9V09sULI/hiVNGTEh
 wBYQo80nfljONBThgSuVexnHlFYpGD2oZmivwmXvIS3R4iGsMMYFi/L2yNZF9m0G1WnjSmcMF/
 O24=
X-SBRS: 2.7
X-MesageID: 2646847
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,455,1557201600"; 
   d="scan'208";a="2646847"
To: Anthony PERARD <anthony.perard@citrix.com>, <devel@edk2.groups.io>
References: <20190704144233.27968-1-anthony.perard@citrix.com>
 <20190704144233.27968-7-anthony.perard@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <a91c8d00-a40b-3906-6432-b9e0c2953843@citrix.com>
Date: Fri, 5 Jul 2019 14:57:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190704144233.27968-7-anthony.perard@citrix.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v3 06/35] OvmfPkg/XenResetVector: Add new
 entry point for Xen PVH
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jordan Justen <jordan.l.justen@intel.com>, Julien Grall <julien.grall@arm.com>,
 xen-devel@lists.xenproject.org, Laszlo Ersek <lersek@redhat.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQvMDcvMjAxOSAxNTo0MiwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gQWRkIGEgbmV3IGVu
dHJ5IHBvaW50IGZvciBYZW4gUFZIIHRoYXQgZW50ZXIgZGlyZWN0bHkgaW4gMzJiaXRzLgo+Cj4g
SW5mb3JtYXRpb24gb24gdGhlIGV4cGVjdGVkIHN0YXRlIG9mIHRoZSBtYWNoaW5lIHdoZW4gdGhp
cyBlbnRyeSBwb2ludAo+IGlzIHVzZWQgY2FuIGJlIGZvdW5kIGF0Ogo+IGh0dHBzOi8veGVuYml0
cy54ZW5wcm9qZWN0Lm9yZy9kb2NzL3Vuc3RhYmxlL21pc2MvcHZoLmh0bWwKPgo+IFJlZjogaHR0
cHM6Ly9idWd6aWxsYS50aWFub2NvcmUub3JnL3Nob3dfYnVnLmNnaT9pZD0xNjg5Cj4gU2lnbmVk
LW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Cj4gLS0t
Cj4KPiBOb3RlczoKPiAgICAgdjM6Cj4gICAgIC0gcmViYXNlZCwgU1BEWAo+ICAgICAtIHJlbW92
ZSBgY2xpJyBhcyB2aWEgUFZIIHRoZSBpbnRlcnJ1cHRzIGFyZSBndWFyYW50ZWVkIHRvIGJlIG9m
Zgo+ICAgICAtIHJld3JpdGUgc29tZSBjb21tZW50cwoKVGhhbmtzIC0gdGhpcyBpcyBlYXNpZXIg
dG8gZm9sbG93LsKgIFNvbWUgZnVydGhlciBxdWVzdGlvbnMuCgo+IGRpZmYgLS1naXQgYS9Pdm1m
UGtnL1hlblJlc2V0VmVjdG9yL0lhMTYvUmVzZXRWZWN0b3JWdGYwLmFzbSBiL092bWZQa2cvWGVu
UmVzZXRWZWN0b3IvSWExNi9SZXNldFZlY3RvclZ0ZjAuYXNtCj4gbmV3IGZpbGUgbW9kZSAxMDA2
NDQKPiBpbmRleCAwMDAwMDAwMDAwLi45NTgxOTViYzVlCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBi
L092bWZQa2cvWGVuUmVzZXRWZWN0b3IvSWExNi9SZXNldFZlY3RvclZ0ZjAuYXNtCj4gK3Z0ZlNp
Z25hdHVyZToKPiArICAgIERCICAgICAgJ1YnLCAnVCcsICdGJywgMAo+ICsKPiArQUxJR04gICAx
Ngo+ICsKPiArcmVzZXRWZWN0b3I6Cj4gKzsKPiArOyBSZXNldCBWZWN0b3IKPiArOwo+ICs7IFRo
aXMgaXMgd2hlcmUgdGhlIHByb2Nlc3NvciB3aWxsIGJlZ2luIGV4ZWN1dGlvbgo+ICs7Cj4gKyAg
ICBub3AKPiArICAgIG5vcAoKV2h5IHR3byBub3BzPwoKPiArICAgIGptcCAgICAgRWFybHlCc3BJ
bml0UmVhbDE2Cj4gKwo+ICtBTElHTiAgIDE2Cj4gKwo+ICtmb3VyR2lnYWJ5dGVzOgo+ICsKPiBk
aWZmIC0tZ2l0IGEvT3ZtZlBrZy9YZW5SZXNldFZlY3Rvci9JYTMyL1hlblBWSE1haW4uYXNtIGIv
T3ZtZlBrZy9YZW5SZXNldFZlY3Rvci9JYTMyL1hlblBWSE1haW4uYXNtCj4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi4yYTE3ZmVkNTJmCj4gLS0tIC9kZXYvbnVsbAo+
ICsrKyBiL092bWZQa2cvWGVuUmVzZXRWZWN0b3IvSWEzMi9YZW5QVkhNYWluLmFzbQo+IEBAIC0w
LDAgKzEsNDkgQEAKPiArOy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICs7IEBmaWxlCj4gKzsgQW4g
ZW50cnkgcG9pbnQgdXNlIGJ5IFhlbiB3aGVuIGEgZ3Vlc3QgaXMgc3RhcnRlZCBpbiBQVkggbW9k
ZS4KPiArOwo+ICs7IENvcHlyaWdodCAoYykgMjAxOSwgQ2l0cml4IFN5c3RlbXMsIEluYy4KPiAr
Owo+ICs7IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBCU0QtMi1DbGF1c2UtUGF0ZW50Cj4gKzsK
PiArOy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICsKPiArQklUUyAgICAzMgo+ICsKPiAreGVuUFZI
TWFpbjoKPiArICAgIDsKPiArICAgIDsgJ0JQJyB0byBpbmRpY2F0ZSBib290LXN0cmFwIHByb2Nl
c3NvcgoKSW5kaWNhdGUgdG8gd2hhdD8KCj4gKyAgICA7Cj4gKyAgICBtb3YgICAgIGRpLCAnQlAn
Cj4gKwo+ICsgICAgOwo+ICsgICAgOyBFU1Agd2lsbCBiZSB1c2VkIGFzIGluaXRpYWwgdmFsdWUg
b2YgdGhlIEVBWCByZWdpc3Rlcgo+ICsgICAgOyBpbiBNYWluLmFzbQo+ICsgICAgOwo+ICsgICAg
eG9yICAgICBlc3AsIGVzcAo+ICsKPiArICAgIG1vdiAgICAgZWJ4LCBBRERSX09GKGdkdHIpCj4g
KyAgICBsZ2R0ICAgIFtlYnhdCgpsZ2R0IFtBRERSX09GKGdkdHIpXQoKc2hvdWxkIHdvcmsgZmlu
ZSwgYmVjYXVzZSB5b3UncmUgaW4gMzJiaXQgbW9kZS4KCk1vcmUgaW1wb3J0YW50bHkgZm9yIFBW
SCBob3dldmVyLCB5b3UgZG9uJ3QgY2xvYmJlciB0aGUgc3RhcnRfaW5mbyBwb2ludGVyLgoKPiAr
Cj4gKyAgICBtb3YgICAgIGVheCwgU0VDX0RFRkFVTFRfQ1IwCj4gKyAgICBtb3YgICAgIGNyMCwg
ZWF4Cj4gKwo+ICsgICAgam1wICAgICBMSU5FQVJfQ09ERV9TRUw6QUREUl9PRiguam1wVG9OZXdD
b2RlU2VnKQo+ICsuam1wVG9OZXdDb2RlU2VnOgoKRG9lcyAxZiAob3Igc29tZSBlcXVpdmFsZW50
KSBub3Qgd29yaywgb3IgaXMgdGhpcyBhZ2FpbnN0IHRoZSBjb2Rpbmcgc3R5bGU/Cgo+ICsKPiAr
ICAgIG1vdiAgICAgZWF4LCBTRUNfREVGQVVMVF9DUjQKPiArICAgIG1vdiAgICAgY3I0LCBlYXgK
PiArCj4gKyAgICBtb3YgICAgIGF4LCBMSU5FQVJfU0VMCj4gKyAgICBtb3YgICAgIGRzLCBheAo+
ICsgICAgbW92ICAgICBlcywgYXgKPiArICAgIG1vdiAgICAgZnMsIGF4Cj4gKyAgICBtb3YgICAg
IGdzLCBheAo+ICsgICAgbW92ICAgICBzcywgYXgKClVzZSBlYXggcmF0aGVyIHRoYW4gYXguwqAg
VGhlIGluc3RydWN0aW9uIGRlY29kZSB3aWxsIGJlIG11Y2ggaGFwcGllcgp3aXRoIHRoZSByZXN1
bHQsIGFuZCBpdCByZXN1bHRzIGluIHNob3J0ZXIgYXNzZW1ibGVkIGNvZGUuCgo+ICsKPiArICAg
IDsKPiArICAgIDsgSnVtcCB0byB0aGUgbWFpbiByb3V0aW5lIG9mIHRoZSBwcmUtU0VDIGNvZGUK
PiArICAgIDsgc2tpcGluZyB0aGUgMTYtYml0IHBhcnQgb2YgdGhlIHJvdXRpbmUgYW5kCj4gKyAg
ICA7IGludG8gdGhlIDMyLWJpdCBmbGF0IG1vZGUgcGFydAo+ICsgICAgOwo+ICsgICAgT25lVGlt
ZUNhbGxSZXQgVHJhbnNpdGlvbkZyb21SZWFsMTZUbzMyQml0RmxhdAoKVGhhbmtzLsKgIFRoaXMg
aXMgZmFyIGVhc2llciB0byBmb2xsb3cuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
