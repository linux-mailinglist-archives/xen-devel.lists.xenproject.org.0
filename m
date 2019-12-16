Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E0E120FA3
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 17:37:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1igtKM-000242-GP; Mon, 16 Dec 2019 16:34:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=P5kS=2G=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1igtKL-00023I-73
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 16:34:33 +0000
X-Inumbo-ID: eaeb1f82-2021-11ea-a914-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eaeb1f82-2021-11ea-a914-bc764e2007e4;
 Mon, 16 Dec 2019 16:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576514065;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DAl7i3eZdqbcMI4iNn7RGLB/81ELDRElyJqhCiJxLIM=;
 b=U+Dl89BotGPWmvcJbhx+myVAMUUHOm+3dB4/l3WSu/dyrEZh5KnX1vRa
 EEPV9gq1naC7sO6GKQuIhbedMw3I/ALtcplBruk1b6NAKIgJx0ImqOIvJ
 /LL2b80BEj17W1INdUECq9MqZsgIibGjr6TIDtwmyzZ0HFkUW8DfurXCv I=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: aouDRDSjZxEsSyaFWpjWpiqZ/QzmoWJuKwo6Eyt/ScAAgy0KAELOcehtZ9b4CjGjJ+Hg85/y5H
 3bhuh0jKhrTMUqIAtlnKHPByx3Gu53mY5PO0xW/KiE5J8Z3YYPkspdeLIaeMBMyvfvC5mBIgTu
 9Ajj3dTwyRe5x5MpnGyVxLHfIrReceAC3Sbbv0VFAyR5PPvlewts6riy6/fwuRLnUz0hznY8Ey
 OfpWr8vx+qQjzMuUhtrn6aFVjDuuCC+gXKAO+u7N/u8tLYRz0A8+IcMCur0ERxNITXJ+3HaZsG
 rfM=
X-SBRS: 2.7
X-MesageID: 9876458
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,322,1571716800"; 
   d="scan'208";a="9876458"
Date: Mon, 16 Dec 2019 16:34:19 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191216163419.GC1267@perard.uk.xensource.com>
References: <20191212182740.2190199-1-anthony.perard@citrix.com>
 <20191212182740.2190199-4-anthony.perard@citrix.com>
 <9073662c-9cc4-cb6c-8402-941864cc779a@suse.com>
 <20191213154946.GM1155@perard.uk.xensource.com>
 <4022441e-bdbd-e78b-c8a4-d3fd9a09311a@suse.com>
 <b6dc71f0-1158-c6ac-18b6-fe72d495cde4@citrix.com>
 <ad54009f-8cc1-20f6-a9bb-630fda7f8d54@suse.com>
 <20191216135658.GA1267@perard.uk.xensource.com>
 <4b4a6d47-0181-fac3-7a48-5cfbc85ee575@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4b4a6d47-0181-fac3-7a48-5cfbc85ee575@suse.com>
Subject: Re: [Xen-devel] [XEN PATCH 3/8] xen: Update Kconfig to Linux v5.4
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
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Doug Goldstein <cardoe@cardoe.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBEZWMgMTYsIDIwMTkgYXQgMDQ6NTU6NTJQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTYuMTIuMjAxOSAxNTowMSwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gPiBPbiBN
b24sIERlYyAxNiwgMjAxOSBhdCAxMToxNjo1MkFNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToK
PiA+PiBXaGF0IGhlYWRlcnMgYXJlIHlvdSB0YWtpbmcgYWJvdXQ/IE15IHF1ZXN0aW9uIHdhcyBh
Ym91dCB0aGUgcGxhY2VtZW50Cj4gPj4gb2YgLmdpdGlnbm9yZSBlbnRyaWVzIG9ubHkuIEknbSBw
cmV0dHkgc3VyZSBJIGhhZCBwcmV2aW91c2x5IGV4cHJlc3NlZAo+ID4+IHRoYXQgSSdtIG5vdCBv
dmVybHkgaGFwcHkgdG8gc2VlIG5lZWRsZXNzIHNjYXR0ZXJpbmcgYXJvdW5kIG9mIHRoZW0uCj4g
Pj4gSSdtIG1lcmVseSB0cnlpbmcgdG8gdW5kZXJzdGFuZCBpZiBoZXJlIHdlIGhhdmUgYSBjYXNl
IG9mICJuZWVkbGVzcyIuCj4gPj4KPiA+Pj4gSSBmaW5kIHlvdXIgbGFjayBvZiBjb25zaXN0ZW5j
eSBpbiByZXZpZXcgcmVxdWVzdHMgaW1wb3NzaWJsZSB0byBwcmVkaWN0Lgo+ID4+Cj4gPj4gV2hh
dCBjb25zaXN0ZW5jeT8gV2hhdCdzIHdyb25nIHdpdGggcHV0dGluZyB0aGUgdHdvIGxpbmVzIGlu
IHRoZSB0b3AKPiA+PiBsZXZlbCAuZ2l0aWdub3JlLCBvciBrZWVwaW5nIHRoZW0gd2hlcmUgdGhl
eSBhcmU/IEkgYW55d2F5IGRvdWJ0Cj4gPj4gdGhlcmUncyBhIG5lZWQgdG8ga2VlcCBvdXIgLmdp
dGlnbm9yZSBpbiBzeW5jIHdpdGggTGludXgnZXMuCj4gPiAKPiA+IEkgdGhpbmsgc2NhdHRlcmlu
ZyB0aGUgLmdpdGlnbm9yZSBhcm91bmQgbWFrZSB0aGVtIGVhc2llciB0byBtYW5hZ2UsCj4gPiBl
c3BlY2lhbGx5IHdoZW4gZW50cmllcyBhcmVuJ3QgdXNlZnVsIGFueW1vcmUuIE90aGVyd2lzZSwg
d2UgZW5kIHVwCj4gPiB3aXRoIGEgLmdpdGlnbm9yZSBhdCB0aGUgcm9vdCB3aXRoIGVudHJpZXMg
dGhhdCBhcmVuJ3QgbmVlZGVkIGFueW1vcmUKPiA+IGJlY2F1c2UgdGhleSBjYW4gYmUgaGFyZCB0
byBmaWd1cmUgb3V0IGlmIHRoZXkgYXJlIHVzZWZ1bCBvciBub3QuCj4gPiBPciwgd2hlbiBnbG9i
aW5nIGlzIGludm9sdmUsIHdlIGNvdWxkIGVuZC11cCBpZ25vcmluZyBmaWxlcyB0aGF0Cj4gPiBz
aG91bGRuJ3QuCj4gCj4gUmlnaHQsIGVzcGVjaWFsbHkgdGhpcyBsYXN0IHBvaW50IG1ha2VzIHNj
YXR0ZXJpbmcgZW50cmllcyBoYXZlIHNvbWUKPiB2YWx1ZS4gQnV0IHRoZW4gbGV0J3MgdHJ1bHkg
c2NhdHRlciB0aGVtLCBub3QgYWNjdW11bGF0ZSBhbGwgc29ydHMKPiBvZiBzdHVmZiBpbiB4ZW4v
LmdpdGlnbm9yZS4KPiAKPiA+IEknbSBwbGFubmluZyB0byBpbXBvcnQgbW9yZSBvZiBLYnVpbGQs
IHdoaWNoIE1ha2VmaWxlLmhvc3QgY29tZXMgZnJvbSwKPiA+IHRvIGJ1aWxkIG9ubHkgdGhlIGh5
cGVydmlzb3IsIHNvIHRoZXJlJ3MgZ29pbmcgdG8gYmUgb3RoZXIgYXJ0ZWZhY3QgdGhhdAo+ID4g
d2lsbCBiZSBnZW5lcmF0ZWQgb25seSBpbiB4ZW4vLiBTbyBJJ3ZlIGFkZGVkIHRob3NlIHR3byBu
ZXcgZW50cmllcyBpbgo+ID4geGVuLy5naXRpZ25vcmUgaW4gYW50aWNpcGF0aW9uLCBhbmQgdG8g
YXZvaWQgZ2V0dGluZyB4ZW4vdG9vbHMva2NvbmZpZwo+ID4gb3V0LW9mLXN5bmMgd2l0aCBMaW51
eCdzIG9uZSAoV2VsbCBJIGRpZG4ndCBrbm93IHRob3NlIHR3byBlbnRyaWVzIHdlcmUKPiA+IHRo
ZXJlIGluIHRoZSBmaXJzdCBwbGFjZSkuCj4gPiAKPiA+IEkgY291bGQgYWRkICIveGVuLyoqLyou
dGFiLltjaF0iIGluIHRoZSByb290IC5naXRpZ25vcmUgaWYgeW91IHByZWZlcgo+ID4gZXZlbiB0
aG91Z2ggSSBkb24ndCBsaWtlIHRoaXMgYXBwcm9jaC4KPiAKPiBCdXQgdGhpcyB0aGVuIHN0aWxs
IGlzIHRvbyB3aWRlIGEgcGF0dGVybiwgYXMgcGVyIGFib3ZlLiBBCj4gc3VmZmljaWVudGx5IHNw
ZWNpZmljIG9uZSB3b3VsZCBiZSBhcyBnb29kIGFzIG9uZSB3aXRob3V0IHBhdGgKPiBpbiBhIC5n
aXRpZ25vcmUgZGVlcCBlbm91Z2ggaW50byB0aGUgdHJlZSwgaWYgd2Ugd2FudGVkIHRvIGdvCj4g
dGhlICJ0cnVseSBzY2F0dGVyIiByb3V0ZS4KCkZpbmUsIHdlIGNhbiBoYXZlIHRob3NlIHR3byBl
bnRyaWVzIGludG8ga2NvbmZpZy8uZ2l0aWdub3JlLCB3aXRoIGEgbm90ZQppbiB0aGUgY29tbWl0
IG1lc3NhZ2Ugc2F5aW5nIHRoYXQgdGhlIG9ubHkgdGhpbmcgZGlmZmVyZW50IGZyb20KdXBzdHJl
YW0uIFRoYXQncyB3aGVyZSB0aGV5IGJlbG9uZyBmb3Igbm93LgoKLS0gCkFudGhvbnkgUEVSQVJE
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
