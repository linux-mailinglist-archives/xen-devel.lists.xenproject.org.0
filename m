Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6D512B57D
	for <lists+xen-devel@lfdr.de>; Fri, 27 Dec 2019 16:07:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ikr9u-0001xv-Jg; Fri, 27 Dec 2019 15:04:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=F8X0=2R=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ikr9t-0001xq-Sj
 for xen-devel@lists.xenproject.org; Fri, 27 Dec 2019 15:04:09 +0000
X-Inumbo-ID: 21a2f75d-28ba-11ea-9c33-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 21a2f75d-28ba-11ea-9c33-12813bfff9fa;
 Fri, 27 Dec 2019 15:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1577459049;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=1/xsEfNe+Ts6WynLRmFrSo7T62PF8//RNrnFgBXjzsQ=;
 b=K9dHfc9tF5o/PDI6aSt5RkHcgdQmCsjubBHq3M1Lv/yDqQ53IRoAin42
 3hL1QF9vRMkRf/nFiDfo2hcZPTD5cWwLc64ielnry25kbjXDUcCvaEeNA
 UA4Ul83AKqIYpEEIOMAakUR98s2WuJy1TqgadPmWY8vFGcTXFkIsfya/4 c=;
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
IronPort-SDR: 7BhFTY1ukzdogmpeqZx0ouQ5OxvlOLtX2MjnFrJ/0xqxKfjWGXuKbe2v8BEjT6knxNCciDi8Vu
 3wyl1tPUazdKsrZXBp8p4k7rugvCwX264s06dMamTmsWaQblcgNE5vZZxFpOYRr1N7NZJtmerN
 Qql/8kSHtTgy8VbmFluUlTRTCQ2VrjVi4kAP+SJwCj/alCgpeENodanBFPrWrFI+RaHpaDwmkg
 E6xWJ8R1Eyz4VDzP94G+ew+MhAxeIY2WPGYvYJfdI3j2Pz/biQDMzEdrkNTePnVzqaKWi0ut8p
 RVY=
X-SBRS: 2.7
X-MesageID: 10348234
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,363,1571716800"; d="scan'208";a="10348234"
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
References: <20191224124453.47183-1-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <7e6ca9ea-89d4-80a6-d1e5-622ea87bf8a9@citrix.com>
Date: Fri, 27 Dec 2019 15:03:57 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191224124453.47183-1-roger.pau@citrix.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86/flush: use APIC ALLBUT destination
 shorthand when possible
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
Cc: Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQvMTIvMjAxOSAxMjo0NCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IElmIHRoZSBmbHVz
aCBtYXNrIG1hdGNoZXMgdGhlIG1hc2sgb2Ygb25saW5lIENQVXMgdXNlIHRoZSBBUElDIEFMTEJV
VAo+IGRlc3RpbmF0aW9uIHNob3J0aGFuZCBpbiBvcmRlciB0byBzZW5kIGFuIElQSSB0byBhbGwg
Q1BVcyBvbiB0aGUKPiBzeXN0ZW0gZXhjZXB0IHRoZSBjdXJyZW50IG9uZS4gVGhpcyBjYW4gb25s
eSBiZSBzYWZlbHkgdXNlZCB3aGVuIG5vCj4gQ1BVIGhvdHBsdWcgb3IgdW5wbHVnIG9wZXJhdGlv
bnMgYXJlIHRha2luZyBwbGFjZSwgbm8gb2ZmbGluZSBDUFVzIG9yCj4gdGhvc2UgaGF2ZSBiZWVu
IG9ubGluZWQgYW5kIHBhcmtlZCBhbmQgZmluYWxseSB3aGVuIGFsbCBDUFVzIGluIHRoZQo+IHN5
c3RlbSBoYXZlIGJlZW4gYWNjb3VudGVkIGZvciAoaWU6IHRoZSBudW1iZXIgb2YgQ1BVcyBkb2Vz
bid0IGV4Y2VlZAo+IE5SX0NQVVMgYW5kIEFQSUMgSURzIGFyZSBiZWxvdyBNQVhfQVBJQ1MpLgo+
Cj4gVGhpcyBpcyBzcGVjaWFsbHkgYmVuZWZpY2lhbCB3aGVuIHVzaW5nIHRoZSBQViBzaGltLCBz
aW5jZSB1c2luZyB0aGUKPiBzaG9ydGhhbmQgYXZvaWRzIHBlcmZvcm1pbmcgYW4gQVBJQyByZWdp
c3RlciB3cml0ZSAob3IgbXVsdGlwbGUgb25lcwo+IGlmIHVzaW5nIHhBUElDIG1vZGUpIGZvciBl
YWNoIGRlc3RpbmF0aW9uIGluIHRoZSBmbHVzaCBtYXNrLgo+Cj4gVGhlIGxvY2sgdGltZSBvbiBh
IDMyIHZDUFUgZ3Vlc3QgdXNpbmcgdGhlIHNoaW0gd2l0aG91dCB0aGUgc2hvcnRoYW5kCj4gaXM6
Cj4KPiBHbG9iYWwgbG9jayBmbHVzaF9sb2NrOiBhZGRyPWZmZmY4MmQwODA0YjIxYzAsIGxvY2t2
YWw9ZjYwMmY2MDIsIG5vdCBsb2NrZWQKPiAgIGxvY2s6MjI4NDU1OTM4KDc5NDA2MDY1NTczMTM1
KSwgYmxvY2s6MjA1OTA4NTgwKDU1NjQxNjYwNTc2MTUzOSkKPgo+IEF2ZXJhZ2UgbG9jayB0aW1l
OiAzNDc1Nzducwo+Cj4gV2hpbGUgdGhlIHNhbWUgZ3Vlc3QgdXNpbmcgdGhlIHNob3J0aGFuZDoK
Pgo+IEdsb2JhbCBsb2NrIGZsdXNoX2xvY2s6IGFkZHI9ZmZmZjgyZDA4MDRiNDFjMCwgbG9ja3Zh
bD1kOWM0ZDliYywgY3B1PTEyCj4gICBsb2NrOjE4OTA3NzUoNDE2NzE5MTQ4MDU0KSwgYmxvY2s6
MTY2Mzk1OCgyNTAwMTYxMjgyOTQ5KQo+Cj4gQXZlcmFnZSBsb2NrIHRpbWU6IDIyMDM5NW5zCj4K
PiBBcHByb3hpbWF0ZWx5IGEgMS8zIGltcHJvdmVtZW50IGluIHRoZSBsb2NrIHRpbWUuCj4KPiBT
aWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KCldo
aWxlIHRoZXNlIGFyZSBnb29kIHN0YXRzLCBJJ20gc29tZXdoYXQgaGVzaXRhbnQgYWJvdXQgaGFj
a2luZyB0aGlzIGluCmxpa2UgdGhpcy7CoCBGb3Igb25lLCBpdCBpcyBhIHN1YnN0YW50aWFsIGFt
b3VudCBvZiBhZC1ob2MgbG9naWMgaW4KZmx1c2hfYXJlYV9tYXNrKCkKClNob3J0aGFuZCBzYWZl
dHkgcmVhbGx5IHNob3VsZCBiZSBwYXJ0IG9mIHRoZSBhcGljIGRyaXZlciwgbm90IHBhcnQgb2YK
dGhlIFRMQiBsb2dpYy4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
