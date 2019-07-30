Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA477B02D
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 19:35:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsVzT-0008J6-B3; Tue, 30 Jul 2019 17:32:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=x3jf=V3=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hsVzR-0008J1-JN
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 17:32:45 +0000
X-Inumbo-ID: 089e269a-b2f0-11e9-8dec-7302f432d2e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 089e269a-b2f0-11e9-8dec-7302f432d2e4;
 Tue, 30 Jul 2019 17:32:42 +0000 (UTC)
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
IronPort-SDR: zy0yyXorkhVFJdVYfk7ragXTHqzabsu3jDyZ5slvdgO+0HvtSI7zqoGejF/9IKlhSyIWfHbPpD
 ZLMK0phDjMwJOsYTw4skg932L8/jS29GhF3/VnBbBPuF1Z0FXdrNiSL0aEWq+1kK5Rt1ksT/+D
 zAoXgb+CUxPwzGcVGivbv0UkkJIbbQKHZxWksRgaitEAAhhRt1Ad3fPdEF3z7hxKe0ho2Fk3tf
 T6dtTq/l3bNcNj4VpLcrqg14JSeJxxh3Xl/fJB1LKhKol0AIUE+IfKWyppIeM0HD1f8WrRYTYZ
 5eg=
X-SBRS: 2.7
X-MesageID: 3669132
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,327,1559534400"; 
   d="scan'208";a="3669132"
To: Jan Beulich <JBeulich@suse.com>
References: <20190729121204.13559-1-andrew.cooper3@citrix.com>
 <20190729121204.13559-2-andrew.cooper3@citrix.com>
 <d3179354-a1c3-6e67-8f4e-821878f80a14@suse.com>
 <05d466ab-1d28-a369-331e-350f09464f37@citrix.com>
 <bfc30841-2582-15e6-0e4f-96b47c514f3b@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <7675f6e9-fd42-6e81-bf35-3dd499270413@citrix.com>
Date: Tue, 30 Jul 2019 18:32:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <bfc30841-2582-15e6-0e4f-96b47c514f3b@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v3 01/10] page-alloc: Clamp get_free_buddy()
 to online nodes
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
Cc: StefanoStabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Julien Grall <julien.grall@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAvMDcvMjAxOSAwOTowOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjkuMDcuMjAxOSAx
OToyNiwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMjkvMDcvMjAxOSAxNjo0OCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBPbiAyOS4wNy4yMDE5IDE0OjExLCBBbmRyZXcgQ29vcGVyIHdyb3Rl
Ogo+Pj4+ICsgICAgaWYgKCBkICkKPj4+PiArICAgICAgICBub2Rlc19hbmQobm9kZW1hc2ssIG5v
ZGVtYXNrLCBkLT5ub2RlX2FmZmluaXR5KTsKPj4+IERlc3BpdGUgbXkgZWFybGllciBhY2s6IENv
ZGUgZnVydGhlciBkb3duIGFzc3VtZXMgYSBub24tZW1wdHkgbWFzaywKPj4+IHdoaWNoIGlzIG5v
IGxvbmdlciBndWFyYW50ZWVkIGFmYWljcy4KPj4gTm90aGluZyBwcmV2aW91cyBndWFyYW50ZWVk
IHRoYXQgZC0+bm9kZV9hZmZpbml0eSBoYWQgYW55IGJpdHMgc2V0IGluCj4+IGl0LCBlaXRoZXIu
Cj4+Cj4+IFRoYXQgc2FpZCwgaW4gcHJhY3RpY2UgaXQgaXMgZWl0aGVyIEFMTCwgb3Igc29tZXRo
aW5nIGRlcml2ZWQgZnJvbSB0aGUKPj4gY3B1PT5ub2RlIG1hcHBpbmdzLCBzbyBJIGRvbid0IHRo
aW5rIHRoaXMgaXMgYSBwcm9ibGVtIGluIHByYWN0aWNlLgo+Pgo+Pj4gSSB0aGluayB5b3Ugd2Fu
dCB0byBhcHBlbmQgYW4KPj4+ICJpbnRlcnNlY3RzIiBjaGVjayBpbiB0aGUgaWYoKS4KPj4gSSB0
aGluayBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gYXNzZXJ0IHRoYXQgY2FsbGVycyBkb24ndCBnaXZl
IHVzIGNvbXBsZXRlCj4+IGp1bmsuCj4+Cj4+PiBXaXRoIHRoYXQgZmVlbCBmcmVlIHRvIHByb21v
dGUgbXkKPj4+IEEtYiB0byBSLWIuCj4+IEhvdyBhYm91dDoKPj4KPj4gIMKgwqDCoCBpZiAoIGQg
KQo+PiAgwqDCoMKgIHsKPj4gIMKgwqDCoMKgwqDCoMKgIGlmICggbm9kZXNfaW50ZXJzZWN0KG5v
ZGVtYXNrLCBkLT5ub2RlX2FmZmluaXR5KSApCj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG5v
ZGVzX2FuZChub2RlbWFzaywgbm9kZW1hc2ssIGQtPm5vZGVfYWZmaW5pdHkpOwo+PiAgwqDCoMKg
wqDCoMKgwqAgZWxzZQo+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBBU1NFUlRfVU5SRUFDSEFC
TEUoKTsKPj4gIMKgwqDCoCB9Cj4+Cj4+ID8KPj4KPj4gVGhpcyBjaGFuZ2UgaGFzIHBhc3NlZCBt
eSBub3JtYWwgc2V0IG9mIHByZXB1c2ggY2hlY2tzIChub3Qgbm90IHRoYXQKPj4gdGhlcmUgaXMg
YW55dGhpbmcgaW50ZXJlc3RpbmcgTlVNQS13aXNlIGluIHRoZXJlKS4KPiBkb21haW5fdXBkYXRl
X25vZGVfYWZmaW5pdHkoKSBtZWFucyB0byBndWFyYW50ZWUgYSBub24tZW1wdHkgbWFzayAoYnkK
PiB3YXkgb2YgYSBzaW1pbGFyIGFzc2VydGlvbiksIHdoZW4gLT5hdXRvX25vZGVfYWZmaW5pdHkg
aXMgc2V0LiBPdG9oCj4gZG9tYWluX3NldF9ub2RlX2FmZmluaXR5KCkgbWF5IGNsZWFyIHRoYXQg
ZmxhZywgYXQgd2hpY2ggcG9pbnQgSSBjYW4ndAo+IHNlZSB3aGF0IHdvdWxkIGd1YXJhbnRlZSB0
aGF0IHRoZSBpbnRlcnNlY3Rpb24gd291bGQgcmVtYWluIG5vbi1lbXB0eQo+IGFzIENQVXMgZ2V0
IG9mZmxpbmVkLgoKSSBkb24ndCBzZWUgd2hhdCBDUFUgb2ZmbGluaW5nIGhhcyB0byBkbyB3aXRo
IGFueXRoaW5nLsKgIFRoZXJlIGlzIG5vCnN1Y2ggdGhpbmcgYXMgdGFraW5nIGEgbm9kZSBvdXQg
b2YgdGhlIG5vZGVfb25saW5lX21hcCwgbm9yIHNob3VsZCB0aGVyZQpiZSAtIGV2ZW4gaWYgd2Ug
b2ZmbGluZSBhbiBlbnRpcmUgc29ja2V0J3Mgd29ydGggb2YgQ1BVcywgdGhlIG1lbW9yeQpjb250
cm9sbGVyIGlzIHN0aWxsIGFjdGl2ZSBhbmQgYXZhaWxhYmxlIGZvciB1c2UuCgpUaGUgZG9tYWlu
IGFsd2F5cyBoYXMgbm9uLXplcm8gdkNQVXMsIHdoaWNoIHdpbGwgYWx3YXlzIHJlc3VsdCBpbiBh
bgppbnRlcnNlY3Rpb24gd2l0aCBub2RlX29ubGluZV9tYXAuCgpXaGF0IGlzIGEgcHJvYmxlbSBp
cyBYRU5fRE9NQ1RMX3NldG5vZGVhZmZpbml0eSBiZWluZyBjYWxsZWQgd2l0aCBub2RlCm1hc2sg
d2hpY2ggaXMgZGlzam9pbnQgdG8gbm9kZV9vbmxpbmVfbWFwIHRvIGJlZ2luIHdpdGguCgpUaGlz
IHByb2JsZW1hdGljIGJlaGF2aW91ciBhbHJlYWR5IGV4aXN0cyB0b2RheSwgYW5kIEkgYmV0IHRo
ZXJlIGlzIGEKbG90IG9mIGZ1biB0byBoYWQgd2l0aCB0aGF0IGh5cGVyY2FsbC4KCkFzIGEgZmly
c3QgcGFzcywKCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2RvbWFpbi5jIGIveGVuL2NvbW1vbi9k
b21haW4uYwppbmRleCA5YWVmYzJhNjgwLi41N2M4NGNkYzQyIDEwMDY0NAotLS0gYS94ZW4vY29t
bW9uL2RvbWFpbi5jCisrKyBiL3hlbi9jb21tb24vZG9tYWluLmMKQEAgLTYzMSw4ICs2MzEsOSBA
QCB2b2lkIGRvbWFpbl91cGRhdGVfbm9kZV9hZmZpbml0eShzdHJ1Y3QgZG9tYWluICpkKQrCoArC
oGludCBkb21haW5fc2V0X25vZGVfYWZmaW5pdHkoc3RydWN0IGRvbWFpbiAqZCwgY29uc3Qgbm9k
ZW1hc2tfdCAqYWZmaW5pdHkpCsKgewotwqDCoMKgIC8qIEJlaW5nIGFmZmluZSB3aXRoIG5vIG5v
ZGVzIGlzIGp1c3Qgd3JvbmcgKi8KLcKgwqDCoCBpZiAoIG5vZGVzX2VtcHR5KCphZmZpbml0eSkg
KQorwqDCoMKgIC8qIEJlaW5nIGFmZmluZSB3aXRoIG5vIG5vZGVzLCBvciBkaXNqb2ludCB3aXRo
IHRoZSBzeXN0ZW0sIGlzCndyb25nLiAqLworwqDCoMKgIGlmICggbm9kZXNfZW1wdHkoKmFmZmlu
aXR5KSB8fAorwqDCoMKgwqDCoMKgwqDCoCAhbm9kZXNfaW50ZXJzZWN0cygqYWZmaW5pdHksIG5v
ZGVfb25saW5lX21hcCkgKQrCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRUlOVkFMOwrCoArCoMKg
wqDCoCBzcGluX2xvY2soJmQtPm5vZGVfYWZmaW5pdHlfbG9jayk7CgpvdWdodCB0byB3b3JrLCBh
bmQgbWFrZSBpdCBzYWZlIHRvIHJldGFpbiB0aGUgQVNTRVJUKCkgaW4gdGhlIGhlYXAKYWxsb2Nh
dG9yLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
