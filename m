Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B649FDFA7
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 15:07:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVcEQ-0002Lx-9y; Fri, 15 Nov 2019 14:05:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bLue=ZH=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1iVcEP-0002Lq-1v
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 14:05:49 +0000
X-Inumbo-ID: 05b3b1d2-07b1-11ea-984a-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 05b3b1d2-07b1-11ea-984a-bc764e2007e4;
 Fri, 15 Nov 2019 14:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573826748;
 h=subject:from:to:cc:references:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=3cmvmzVwdqc0O5K+FM4R1bqEutofIFQox8QOxPeEF0U=;
 b=ZE2qjY5a+6AaPv5a/Hd8ES+O5f7cJaj0nT5c2TsXcfMOUe07DkrWLtWU
 5LpgJL7wR6JNI4wGq42dRjwmWIlupi6DTmv19tCYY2xeux8wvHqxRvYV4
 rNsGrUcJ2j2RvxF+oH/MHiuXTqkfbwA++tJoYDsXJ8E9LvPgAsJwyzNFO 0=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 4cebMiN5um04aLFHUxdGQOkGiAHlvD/jOo7oJqoy473vpQJU/txgbUJK5qJF8f7VMHb2cZW4BC
 tuPdk9Eti3PxO7XtwmbuD6Ag0qZNMTDtX1KoFSSwvrTksTKWqWo4UuutDAs5WWebP9O3d2bDxV
 ZBxulj+URzevF74hHV2Amt9dhQjpO1JTmoBXlygJQ5NZIQvQ1Qk60glodKdkr4ZV6ma9C4grKp
 qiOmbKcF6LQcA7xRmavlpx3y0MQlEvabgIlrapYJVjCSCR0uo96JfP+ziycLoLNYS8rtJ97KhW
 UfM=
X-SBRS: 2.7
X-MesageID: 8383126
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,308,1569297600"; 
   d="scan'208";a="8383126"
From: George Dunlap <george.dunlap@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
References: <20191115105739.20333-1-george.dunlap@citrix.com>
 <ec3be412-f0a1-6e04-ba62-5f27a06ab8ad@suse.com>
 <5751f0af-610b-a21d-9a6a-8c64e38140ac@citrix.com>
 <c1b1424f-382d-ffb3-6123-131312b2851c@suse.com>
 <607854b0-00a2-df11-d977-af6498050c40@citrix.com>
 <f9c4d160-1567-d622-e056-f61b7085198e@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <fa4e2894-34a0-c3d0-f5a1-df4d8209b1b4@citrix.com>
Date: Fri, 15 Nov 2019 14:05:44 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <f9c4d160-1567-d622-e056-f61b7085198e@citrix.com>
Content-Language: en-US
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

T24gMTEvMTUvMTkgMjowNCBQTSwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBPbiAxMS8xNS8xOSAx
OjU1IFBNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBPbiAxNS8xMS8yMDE5IDEyOjM5LCBKYW4g
QmV1bGljaCB3cm90ZToKPj4+IE9uIDE1LjExLjIwMTkgMTI6NTgsIEdlb3JnZSBEdW5sYXAgd3Jv
dGU6Cj4+Pj4gT24gMTEvMTUvMTkgMTE6MTIgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBP
biAxNS4xMS4yMDE5IDExOjU3LCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+Pj4+Pj4gLS0tIGEvdG9v
bHMvbGlieGMveGNfY3B1aWRfeDg2LmMKPj4+Pj4+ICsrKyBiL3Rvb2xzL2xpYnhjL3hjX2NwdWlk
X3g4Ni5jCj4+Pj4+PiBAQCAtNTc5LDUyICs1NzksNjggQEAgaW50IHhjX2NwdWlkX2FwcGx5X3Bv
bGljeSh4Y19pbnRlcmZhY2UgKnhjaCwgdWludDMyX3QgZG9taWQsCj4+Pj4+PiAgICAgIH0KPj4+
Pj4+ICAgICAgZWxzZQo+Pj4+Pj4gICAgICB7Cj4+Pj4+PiAtICAgICAgICAvKgo+Pj4+Pj4gLSAg
ICAgICAgICogVG9wb2xvZ3kgZm9yIEhWTSBndWVzdHMgaXMgZW50aXJlbHkgY29udHJvbGxlZCBi
eSBYZW4uICBGb3Igbm93LCB3ZQo+Pj4+Pj4gLSAgICAgICAgICogaGFyZGNvZGUgQVBJQ19JRCA9
IHZjcHVfaWQgKiAyIHRvIGdpdmUgdGhlIGlsbHVzaW9uIG9mIG5vIFNNVC4KPj4+Pj4+IC0gICAg
ICAgICAqLwo+Pj4+Pj4gLSAgICAgICAgcC0+YmFzaWMuaHR0ID0gdHJ1ZTsKPj4+Pj4+ICsgICAg
ICAgIHAtPmJhc2ljLmh0dCA9IGZhbHNlOwo+Pj4+Pj4gICAgICAgICAgcC0+ZXh0ZC5jbXBfbGVn
YWN5ID0gZmFsc2U7Cj4+Pj4+PiAgCj4+Pj4+PiAtICAgICAgICAvKgo+Pj4+Pj4gLSAgICAgICAg
ICogTGVhZiAxIEVCWFsyMzoxNl0gaXMgTWF4aW11bSBMb2dpY2FsIFByb2Nlc3NvcnMgUGVyIFBh
Y2thZ2UuCj4+Pj4+PiAtICAgICAgICAgKiBVcGRhdGUgdG8gcmVmbGVjdCB2TEFQSUNfSUQgPSB2
Q1BVX0lEICogMiwgYnV0IG1ha2Ugc3VyZSB0byBhdm9pZAo+Pj4+Pj4gLSAgICAgICAgICogb3Zl
cmZsb3cuCj4+Pj4+PiAtICAgICAgICAgKi8KPj4+Pj4+IC0gICAgICAgIGlmICggIShwLT5iYXNp
Yy5scHBwICYgMHg4MCkgKQo+Pj4+Pj4gLSAgICAgICAgICAgIHAtPmJhc2ljLmxwcHAgKj0gMjsK
Pj4+Pj4+IC0KPj4+Pj4gSSBhcHByZWNpYXRlIHlvdSB3YW50aW5nIHRvIHB1dCBhbGwgYWRqdXN0
bWVudHMgaW4gYSBjZW50cmFsIHBsYWNlLCBidXQKPj4+Pj4gYXQgbGVhc3QgaXQgbWFrZXMgcGF0
Y2ggcmV2aWV3IG1vcmUgZGlmZmljdWx0LiBIb3cgYWJvdXQgeW91IGxhdGNoCj4+Pj4+ICFnZXRl
bnYoIlhFTl9MSUJYQ19ESVNBQkxFX0ZBS0VIVCIpIGludG8gYSBsb2NhbCBib29sZWFuIGF0IHRo
ZSB0b3Agb2YKPj4+Pj4gdGhlIGZ1bmN0aW9uIGFuZCB0aGVuIHRoZSBhYm92ZSB3b3VsZCBiZWNv
bWUKPj4+Pj4KPj4+Pj4gICAgICAgICBpZiAoICEocC0+YmFzaWMubHBwcCAmIDB4ODApICkKPj4+
Pj4gICAgICAgICAgICAgcC0+YmFzaWMubHBwcCA8PD0gZmFrZWh0Owo+Pj4+Pgo+Pj4+PiBhbmQg
ZS5nLiAuLi4KPj4+Pj4KPj4+Pj4+ICAgICAgICAgIHN3aXRjaCAoIHAtPng4Nl92ZW5kb3IgKQo+
Pj4+Pj4gICAgICAgICAgewo+Pj4+Pj4gICAgICAgICAgY2FzZSBYODZfVkVORE9SX0lOVEVMOgo+
Pj4+Pj4gICAgICAgICAgICAgIGZvciAoIGkgPSAwOyAocC0+Y2FjaGUuc3VibGVhZltpXS50eXBl
ICYmCj4+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICBpIDwgQVJSQVlfU0laRShwLT5j
YWNoZS5yYXcpKTsgKytpICkKPj4+Pj4+ICAgICAgICAgICAgICB7Cj4+Pj4+PiAtICAgICAgICAg
ICAgICAgIHAtPmNhY2hlLnN1YmxlYWZbaV0uY29yZXNfcGVyX3BhY2thZ2UgPQo+Pj4+Pj4gLSAg
ICAgICAgICAgICAgICAgICAgKHAtPmNhY2hlLnN1YmxlYWZbaV0uY29yZXNfcGVyX3BhY2thZ2Ug
PDwgMSkgfCAxOwo+Pj4+PiAuLi4gdGhpcwo+Pj4+Pgo+Pj4+PiAgICAgICAgICAgICAgICAgcC0+
Y2FjaGUuc3VibGVhZltpXS5jb3Jlc19wZXJfcGFja2FnZSA9Cj4+Pj4+ICAgICAgICAgICAgICAg
ICAgICAgKHAtPmNhY2hlLnN1YmxlYWZbaV0uY29yZXNfcGVyX3BhY2thZ2UgPDwgZmFrZWh0KSB8
IGZha2VodDsKPj4+PiBJJ20gYWZyYWlkIEkgdGhpbmsgdGhlIGNvZGUgaXRzZWxmIHdvdWxkIHRo
ZW4gYmVjb21lIG1vcmUgZGlmZmljdWx0IHRvCj4+Pj4gcmVhZDsKPj4+IFNsaWdodGx5LCBidXQg
eWVzLgo+Pj4KPj4+PiBhbmQgaXQgc2VlbXMgYSBiaXQgc3RyYW5nZSB0byBiZSBhcmNoaXRlY3Rp
bmcgb3VyIGNvZGUgYmFzZWQgb24KPj4+PiBsaW1pdGF0aW9ucyBvZiB0aGUgZGlmZiBhbGdvcml0
aG0gYW5kL29yIGRpZmYgdmlld2VyIHVzZWQuCj4+PiBJdCdzIG5vdCBlbnRpcmVseSB1bmNvbW1v
biB0byAoYWxzbykgY29uc2lkZXIgaG93IHRoZSByZXN1bHRpbmcKPj4+IGRpZmYgd291bGQgbG9v
ayBsaWtlIHdoZW4gcHV0dGluZyB0b2dldGhlciBhIGNoYW5nZS4gQW5kIGJlc2lkZXMKPj4+IHRo
ZSByZXZpZXcgYXNwZWN0LCB0aGVyZSdzIGFsc28gdGhlIGFyY2hlb2xvZ3kgb25lIC0gImdpdCBi
bGFtZSIKPj4+IHlpZWxkcyBtdWNoIG1vcmUgaGVscGZ1bCByZXN1bHRzIHdoZW4gY29kZSBkb2Vz
bid0IGdldCBtb3ZlZAo+Pj4gYXJvdW5kIG1vcmUgdGhhbiBuZWNlc3NhcnkuIEJ1dCB5ZXMsIHRo
ZXJlJ3Mgbm8gdmVyeSBjbGVhciAidGhpcwo+Pj4gaXMgdGhlIGJldHRlciBvcHRpb24iIGhlcmUu
IEkndmUgdGFrZW4gYW5vdGhlciBsb29rIGF0IHRoZSBjb2RlCj4+PiBiZWZvcmUgeW91ciBjaGFu
Z2UgdGhvdWdoIC0gZXZlcnl0aGluZyBpcyBhbHJlYWR5IG5pY2VseSBpbiBvbmUKPj4+IHBsYWNl
IHdpdGggQW5kcmV3J3MgbW9zdCByZWNlbnQgY29kZSByZW9yZy4gU28gSSdtIG5vdyBoYXZpbmcg
YW4KPj4+IGV2ZW4gaGFyZGVyIHRpbWUgc2VlaW5nIHdoeSB5b3Ugd2FudCB0byBtb3ZlIHRoaW5n
cyBhcm91bmQgYWdhaW4uCj4+Cj4+IFdlIGRvbid0LsKgIEkndmUgcmVjb21tZW5kIHR3aWNlIG5v
dyB0byBoYXZlIGEgc2luZ2xlICJlbHNlIGlmIiBodW5rCj4+IHdoaWNoIGlzIG5lYXJseSBlbXB0
eSwgYW5kIG11Y2ggbW9yZSBvYnZpb3VzbHkgYSBncm9zcyAibWFrZSBpdCB3b3JrIGZvcgo+PiA0
LjEzIiBib2RnZS4KPiAKPiBUaGUgcmVzdWx0cyBhcmUgYSB0aW55IGJpdCBiZXR0ZXIsIGJ1dCBu
b3QgbXVjaCByZWFsbHkgKHNlZSBhdHRhY2hlZCkuCgpJIG1lYW4sIGlmIHdlICpyZWFsbHkqIHdh
bnRlZCB0byBvcHRpbWl6ZSBmb3IgZGlmZiByZWFkYWJpbGl0eSwgd2UgY291bGQKdXNlIGBnb3Rv
YHMgaW5zdGVhZCwgYnV0IEkgdGhvdWdodCB0aGF0IHdvdWxkIGJlIGdvaW5nIGEgYml0IHRvbyBm
YXIuCgogLUdlb3JnZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
