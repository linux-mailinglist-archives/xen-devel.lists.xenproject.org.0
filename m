Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47959F8F06
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2019 12:57:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUUkm-0002ID-Nf; Tue, 12 Nov 2019 11:54:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CoZ6=ZE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iUUkl-0002I8-Lt
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2019 11:54:35 +0000
X-Inumbo-ID: 306d5507-0543-11ea-a21a-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 306d5507-0543-11ea-a21a-12813bfff9fa;
 Tue, 12 Nov 2019 11:54:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A5E65AB7F;
 Tue, 12 Nov 2019 11:54:32 +0000 (UTC)
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
References: <20191106153442.12776-1-aisaila@bitdefender.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9a02de11-09bd-a54f-48f6-1ce1a0246325@suse.com>
Date: Tue, 12 Nov 2019 12:54:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191106153442.12776-1-aisaila@bitdefender.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V2 1/2] x86/altp2m: Add hypercall to set a
 range of sve bits
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
Cc: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "julien@xen.org" <julien@xen.org>, "wl@xen.org" <wl@xen.org>,
 Razvan COJOCARU <rcojocaru@bitdefender.com>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "tamas@tklengyel.com" <tamas@tklengyel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMTEuMjAxOSAxNjozNSwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4gQEAg
LTQ2ODEsNyArNDY4Miw3IEBAIHN0YXRpYyBpbnQgZG9fYWx0cDJtX29wKAo+ICAgICAgICAgIGJy
ZWFrOwo+ICAKPiAgICAgIGNhc2UgSFZNT1BfYWx0cDJtX3NldF9zdXBwcmVzc192ZToKPiAtICAg
ICAgICBpZiAoIGEudS5zdXBwcmVzc192ZS5wYWQxIHx8IGEudS5zdXBwcmVzc192ZS5wYWQyICkK
PiArICAgICAgICBpZiAoIGEudS5zdXBwcmVzc192ZS5wYWQxICkKCkp1c3QgYmVjYXVzZSB0aGUg
ZmllbGQgY2hhbmdlcyBpdHMgbmFtZSBkb2Vzbid0IG1lYW4geW91IGNhbgpkcm9wIHRoZSBjaGVj
ay4gWW91IGV2ZW4gYWRkIGEgbmV3IGZpZWxkIG5vdCB1c2VkICh5ZXQpIGJ5CnRoaXMgc3ViLWZ1
bmN0aW9uLCB3aGljaCB0aGVuIGFsc28gd291bGQgbmVlZCBjaGVja2luZyBoZXJlLgoKPiBAQCAt
NDY5Myw4ICs0Njk0LDIzIEBAIHN0YXRpYyBpbnQgZG9fYWx0cDJtX29wKAo+ICAgICAgICAgIH0K
PiAgICAgICAgICBicmVhazsKPiAgCj4gKyAgICBjYXNlIEhWTU9QX2FsdHAybV9zZXRfc3VwcHJl
c3NfdmVfbXVsdGk6Cj4gKyAgICAgICAgaWYgKCBhLnUuc3VwcHJlc3NfdmUucGFkMSB8fCAhYS51
LnN1cHByZXNzX3ZlLm5yICkKCkEgY291bnQgb2YgemVybyB0eXBpY2FsbHkgaXMgdGFrZW4gYXMg
YSBuby1vcCwgbm90IGFuIGVycm9yLgoKPiArICAgICAgICAgICAgcmMgPSAtRUlOVkFMOwo+ICsg
ICAgICAgIGVsc2UKPiArICAgICAgICB7Cj4gKyAgICAgICAgICAgIHJjID0gcDJtX3NldF9zdXBw
cmVzc192ZV9tdWx0aShkLCAmYS51LnN1cHByZXNzX3ZlKTsKPiArCj4gKyAgICAgICAgICAgIGlm
ICggcmMgPT0gLUVSRVNUQVJUICkKPiArICAgICAgICAgICAgICAgIGlmICggX19jb3B5X2ZpZWxk
X3RvX2d1ZXN0KGd1ZXN0X2hhbmRsZV9jYXN0KGFyZywKPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHhlbl9odm1fYWx0cDJtX29wX3QpLAo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmEsIHUuc3VwcHJlc3NfdmUub3BhcXVl
KSApCj4gKyAgICAgICAgICAgICAgICAgICAgcmMgPSAtRUZBVUxUOwoKSWYgdGhlIG9wZXJhdGlv
biBpcyBiZXN0IGVmZm9ydCwgX3NvbWVfIGluZGljYXRpb24gb2YgZmFpbHVyZSBzaG91bGQKc3Rp
bGwgYmUgaGFuZGVkIGJhY2sgdG8gdGhlIGNhbGxlci4gV2hldGhlciB0aGF0J3MgdGhyb3VnaCB0
aGUgb3BhcXVlCmZpZWxkIG9yIGJ5IHNvbWUgb3RoZXIgbWVhbnMgaXMgc2Vjb25kYXJ5LiBJZiBu
b3QgdmlhIHRoYXQgZmllbGQKKHdoaWNoIHdvdWxkIG1ha2UgdGhlIG91dGVyIG9mIHRoZSB0d28g
aWYoKS1zIGRpc2FwcGVhciksIHBsZWFzZSBmb2xkCnRoZSBpZigpLXMuCgo+ICsgICAgICAgIH0K
PiArICAgICAgICBicmVhazsKPiArCj4gICAgICBjYXNlIEhWTU9QX2FsdHAybV9nZXRfc3VwcHJl
c3NfdmU6Cj4gLSAgICAgICAgaWYgKCBhLnUuc3VwcHJlc3NfdmUucGFkMSB8fCBhLnUuc3VwcHJl
c3NfdmUucGFkMiApCj4gKyAgICAgICAgaWYgKCBhLnUuc3VwcHJlc3NfdmUucGFkMSApCgpTZWUg
YWJvdmUuCgo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYwo+ICsrKyBiL3hlbi9hcmNoL3g4
Ni9tbS9wMm0uYwo+IEBAIC0zMDU0LDYgKzMwNTQsNjQgQEAgb3V0Ogo+ICAgICAgcmV0dXJuIHJj
Owo+ICB9Cj4gIAo+ICsvKgo+ICsgKiBTZXQvY2xlYXIgdGhlICNWRSBzdXBwcmVzcyBiaXQgZm9y
IG11bHRpcGxlIHBhZ2VzLiAgT25seSBhdmFpbGFibGUgb24gVk1YLgo+ICsgKi8KPiAraW50IHAy
bV9zZXRfc3VwcHJlc3NfdmVfbXVsdGkoc3RydWN0IGRvbWFpbiAqZCwKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgc3RydWN0IHhlbl9odm1fYWx0cDJtX3N1cHByZXNzX3ZlKiBzdmUp
CgpNaXNwbGFjZWQgKi4KCj4gK3sKPiArICAgIHN0cnVjdCBwMm1fZG9tYWluICpob3N0X3AybSA9
IHAybV9nZXRfaG9zdHAybShkKTsKPiArICAgIHN0cnVjdCBwMm1fZG9tYWluICphcDJtID0gTlVM
TDsKPiArICAgIHN0cnVjdCBwMm1fZG9tYWluICpwMm07Cj4gKyAgICB1aW50NjRfdCBzdGFydCA9
IHN2ZS0+b3BhcXVlID86IHN2ZS0+Z2ZuOwoKQWNjb3JkaW5nIHRvIHRoaXMgc3RhcnQgKGFuZCBo
ZW5jZSAtPm9wYXF1ZSkgYXJlIEdGTnMuCgo+ICsgICAgaW50IHJjID0gMDsKPiArCj4gKyAgICBp
ZiAoIHN2ZS0+dmlldyA+IDAgKQo+ICsgICAgewo+ICsgICAgICAgIGlmICggc3ZlLT52aWV3ID49
IE1BWF9BTFRQMk0gfHwKPiArICAgICAgICAgICAgIGQtPmFyY2guYWx0cDJtX2VwdHBbc3ZlLT52
aWV3XSA9PSBtZm5feChJTlZBTElEX01GTikgKQo+ICsgICAgICAgICAgICByZXR1cm4gLUVJTlZB
TDsKPiArCj4gKyAgICAgICAgcDJtID0gYXAybSA9IGQtPmFyY2guYWx0cDJtX3AybVtzdmUtPnZp
ZXddOwo+ICsgICAgfQo+ICsgICAgZWxzZQo+ICsgICAgICAgIHAybSA9IGhvc3RfcDJtOwo+ICsK
PiArICAgIHAybV9sb2NrKGhvc3RfcDJtKTsKPiArCj4gKyAgICBpZiAoIGFwMm0gKQo+ICsgICAg
ICAgIHAybV9sb2NrKGFwMm0pOwo+ICsKPiArCj4gKyAgICB3aGlsZSAoIHN0YXJ0IDwgc3ZlLT5u
ciApCgpBY2NvcmRpbmcgdG8gdGhpcywgc3RhcnQgaXMgYW4gaW5kZXguIFdoaWNoIG9mIHRoZSB0
d28gZG8geW91Cm1lYW4/Cgo+IC0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy9odm0vaHZtX29wLmgK
PiArKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMvaHZtL2h2bV9vcC5oCj4gQEAgLTQyLDggKzQyLDkg
QEAgc3RydWN0IHhlbl9odm1fYWx0cDJtX3N1cHByZXNzX3ZlIHsKPiAgICAgIHVpbnQxNl90IHZp
ZXc7Cj4gICAgICB1aW50OF90IHN1cHByZXNzX3ZlOyAvKiBCb29sZWFuIHR5cGUuICovCj4gICAg
ICB1aW50OF90IHBhZDE7Cj4gLSAgICB1aW50MzJfdCBwYWQyOwo+ICsgICAgdWludDMyX3QgbnI7
Cj4gICAgICB1aW50NjRfdCBnZm47Cj4gKyAgICB1aW50NjRfdCBvcGFxdWU7Cj4gIH07CgpIb3cg
aXMgdGhpcyBhZGRpdGlvbiBvZiBhIGZpZWxkIGdvaW5nIHRvIHdvcmsgY29tcGF0aWJseSB3aXRo
IG9sZAphbmQgbmV3IGNhbGxlcnMgb24gb2xkIGFuZCBuZXcgaHlwZXJ2aXNvcnM/IFJlY2FsbCBp
biBwYXJ0aWN1bGFyCnRoYXQgdGhlc2Ugb3BlcmF0aW9ucyBhcmUgKGFsbW9zdD8pIGFsbCBwb3Rl
bnRpYWxseSB1c2FibGUgYnkgdGhlCmd1ZXN0IGl0c2VsZi4KCkphbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
