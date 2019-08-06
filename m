Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D24318344C
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2019 16:49:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hv0kR-0003lW-GU; Tue, 06 Aug 2019 14:47:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jalH=WC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hv0kP-0003lQ-M9
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2019 14:47:33 +0000
X-Inumbo-ID: 1ce64eb6-b859-11e9-b02e-ab0ab7f4a09e
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1ce64eb6-b859-11e9-b02e-ab0ab7f4a09e;
 Tue, 06 Aug 2019 14:47:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 533C0AD78;
 Tue,  6 Aug 2019 14:47:28 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <5a4d4a61-a543-c657-8458-cbc6b5a8a633@suse.com>
 <33824f67-d50d-f7ac-f3a6-305eb8fe3bc1@suse.com>
 <20190806142528.5vwc7yjnu52gjrdk@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1a28a168-04b1-ea22-327d-f0626b89aea4@suse.com>
Date: Tue, 6 Aug 2019 16:47:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190806142528.5vwc7yjnu52gjrdk@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 08/10] x86/PCI: read MSI-X table entry
 count early
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
Cc: AndrewCooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDguMjAxOSAxNjoyNSwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gT24gVHVlLCBB
dWcgMDYsIDIwMTkgYXQgMDM6MTA6NDBQTSArMDIwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IEBA
IC0xMDkzLDIyICsxMDk0LDE3IEBAIHN0YXRpYyB2b2lkIF9fcGNpX2Rpc2FibGVfbXNpKHN0cnVj
dCBtc2kKPj4gICAgKiovCj4+ICAgc3RhdGljIGludCBfX3BjaV9lbmFibGVfbXNpeChzdHJ1Y3Qg
bXNpX2luZm8gKm1zaSwgc3RydWN0IG1zaV9kZXNjICoqZGVzYykKPj4gICB7Cj4+IC0gICAgaW50
IHBvcywgbnJfZW50cmllczsKPj4gICAgICAgc3RydWN0IHBjaV9kZXYgKnBkZXY7Cj4+IC0gICAg
dTE2IGNvbnRyb2w7Cj4+ICAgICAgIHU4IHNsb3QgPSBQQ0lfU0xPVChtc2ktPmRldmZuKTsKPj4g
ICAgICAgdTggZnVuYyA9IFBDSV9GVU5DKG1zaS0+ZGV2Zm4pOwo+PiAgICAgICBzdHJ1Y3QgbXNp
X2Rlc2MgKm9sZF9kZXNjOwo+IAo+IE1pc3NpbmcgbmV3bGluZS4KCkZvciBvbmUgdGhpcyBpcyBw
YXRjaCBjb250ZXh0IG9ubHkgYW55d2F5LiBBbmQgdGhlbiBJJ20gYWZyYWlkIHRoaXMgaXMKYW4g
YXJ0aWZhY3Qgb2YgdGhlIG9uZ29pbmcgZW1haWwgaXNzdWUgbWVudGlvbmVkIGluIHRoZSBjb3Zl
ciBsZXR0ZXIuCkluIHRoZSBsaXN0IGFyY2hpdmVzIHRoaXMgYWxzbyByZWZsZWN0cyBpdHNlbGYg
YnkgLi4uCgo+PiAgICAgICBBU1NFUlQocGNpZGV2c19sb2NrZWQoKSk7CgouLi4gdGhpcyBsaW5l
IG5vdCBoYXZpbmcgYW55IGluZGVudGF0aW9uIGF0IGFsbC4gVGhlbiBhZ2FpbiwgbG9va2luZwph
dCB0aGUgY29weSBJIGhhdmUgcmVjZWl2ZWQgYmFjayBmcm9tIHhlbi1kZXZlbCwgSSBjYW4ndCBz
ZWUgYW55IGlzc3VlCnRoZXJlIGF0IGFsbC4KCj4+IEBAIC0xMTg3LDE2ICsxMTgzLDEwIEBAIGlu
dCBwY2lfcHJlcGFyZV9tc2l4KHUxNiBzZWcsIHU4IGJ1cywgdTgKPj4gICB7Cj4+ICAgICAgIGlu
dCByYzsKPj4gICAgICAgc3RydWN0IHBjaV9kZXYgKnBkZXY7Cj4+IC0gICAgdTggc2xvdCA9IFBD
SV9TTE9UKGRldmZuKSwgZnVuYyA9IFBDSV9GVU5DKGRldmZuKTsKPj4gLSAgICB1bnNpZ25lZCBp
bnQgcG9zID0gcGNpX2ZpbmRfY2FwX29mZnNldChzZWcsIGJ1cywgc2xvdCwgZnVuYywKPj4gLSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQQ0lfQ0FQX0lEX01TSVgp
Owo+IAo+IFlvdSBzZWVtIHRvIGJlIG1pc3NpbmcgYW4gZW1wdHkgbmV3bGluZSBoZXJlPwo+IAo+
PiAgICAgICBpZiAoICF1c2VfbXNpICkKPj4gICAgICAgICAgIHJldHVybiAwOwo+IAo+IFNhbWUg
aGVyZS4KClNhbWUgYXMgYWJvdmUuCgo+PiBAQCAtMTIwOSwxMyArMTE5OSw3IEBAIGludCBwY2lf
cHJlcGFyZV9tc2l4KHUxNiBzZWcsIHU4IGJ1cywgdTgKPj4gICAgICAgICAgIHJjID0gMDsKPj4g
ICAgICAgfQo+PiAgICAgICBlbHNlCj4+IC0gICAgewo+PiAtICAgICAgICB1aW50MTZfdCBjb250
cm9sID0gcGNpX2NvbmZfcmVhZDE2KFBDSV9TQkRGMyhzZWcsIGJ1cywgZGV2Zm4pLAo+PiAtICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1zaXhfY29udHJvbF9yZWco
cG9zKSk7Cj4+IC0KPj4gLSAgICAgICAgcmMgPSBtc2l4X2NhcGFiaWxpdHlfaW5pdChwZGV2LCBw
b3MsIE5VTEwsIE5VTEwsCj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbXVs
dGlfbXNpeF9jYXBhYmxlKGNvbnRyb2wpKTsKPj4gLSAgICB9Cj4+ICsgICAgICAgIHJjID0gbXNp
eF9jYXBhYmlsaXR5X2luaXQocGRldiwgTlVMTCwgTlVMTCk7Cj4+ICAgICAgIHBjaWRldnNfdW5s
b2NrKCk7Cj4+ICAgICAgIHJldHVybiByYzsKPj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91
Z2gvcGNpLmMKPj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMKPj4gQEAgLTMy
NCw2ICszMjQsNyBAQCBzdGF0aWMgdm9pZCBhcHBseV9xdWlya3Moc3RydWN0IHBjaV9kZXYKPj4g
ICBzdGF0aWMgc3RydWN0IHBjaV9kZXYgKmFsbG9jX3BkZXYoc3RydWN0IHBjaV9zZWcgKnBzZWcs
IHU4IGJ1cywgdTggZGV2Zm4pCj4+ICAgewo+PiAgICAgICBzdHJ1Y3QgcGNpX2RldiAqcGRldjsK
Pj4gKyAgICB1bnNpZ25lZCBpbnQgcG9zOwo+IAo+IFRoaXMgY2h1bmsgZG9lc24ndCBzZWVtIHRv
IG1hdGNoIG15IGN1cnJlbnQgY29kZSwgYXMgdGhlcmUncyBhbiBlbXB0eQo+IG5ld2xpbmUgYmV0
d2VlbiB0aGUgZGVjbGFyYXRpb25zIGFuZCBsaXN0X2Zvcl9lYWNoX2VudHJ5LgoKU2FtZSBpc3N1
ZSBhcyBhYm92ZS4KCj4+IEBAIC0zNTAsNiArMzUzLDEwIEBAIHN0YXRpYyBzdHJ1Y3QgcGNpX2Rl
diAqYWxsb2NfcGRldihzdHJ1Y3QKPj4gICAgICAgICAgICAgICByZXR1cm4gTlVMTDsKPj4gICAg
ICAgICAgIH0KPj4gICAgICAgICAgIHNwaW5fbG9ja19pbml0KCZtc2l4LT50YWJsZV9sb2NrKTsK
Pj4gKwo+PiArICAgICAgICBjdHJsID0gcGNpX2NvbmZfcmVhZDE2KHBkZXYtPnNiZGYsIG1zaXhf
Y29udHJvbF9yZWcocG9zKSk7Cj4+ICsgICAgICAgIG1zaXgtPm5yX2VudHJpZXMgPSBtc2l4X3Rh
YmxlX3NpemUoY3RybCk7Cj4gCj4gU2luY2UgeW91IHN0b3JlIHRoZSBudW1iZXIgb2YgZW50cmll
cyBoZXJlLCB3aHkgbm90IGFsc28gc3RvcmUgdGhlCj4gcG9zaXRpb24gb2YgdGhlIE1TSS1YIGNh
cGFiaWxpdHkgc2luY2UgaXQncyBhbHNvIGltbXV0YWJsZT8KPiAKPiBUaGF0IHdvdWxkIHByZXZl
bnQgaGF2aW5nIHRvIGZldGNoIGl0IGFnYWluIGluIG1zaXhfY2FwYWJpbGl0eV9pbml0LgoKSSBk
byBjb25zaWRlciB0aGlzIGFzIHNvbWV0aGluZyB3b3J0aHdoaWxlIHRvIGRvIGluIHRoZSBmdXR1
cmUsIGJ1dApub3QgaGVyZTogVGhlIGZpZWxkIHRvIHN0b3JlIHRoaXMgZG9lc24ndCBleGlzdCBp
biBzdHJ1Y3QgYXJjaF9tc2l4Cih5ZXQpLCBhbmQgaGVuY2Ugd291bGQgbGlrZWx5IHdhbnQgbW92
aW5nIGZyb20gc3RydWN0IG1zaV9hdHRyaWIuClRoaXMgaXMgYmV5b25kIHRoZSBzY29wZSBvZiB0
aGlzIHBhdGNoLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
