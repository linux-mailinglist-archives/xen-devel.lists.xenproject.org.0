Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A073BC7B9
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 14:15:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCjgo-0003ak-Ha; Tue, 24 Sep 2019 12:13:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=MVCM=XT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iCjgn-0003af-Me
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 12:13:05 +0000
X-Inumbo-ID: a8f1ff2c-dec4-11e9-9618-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id a8f1ff2c-dec4-11e9-9618-12813bfff9fa;
 Tue, 24 Sep 2019 12:13:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B475AB93D;
 Tue, 24 Sep 2019 12:13:03 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>,
 Joshua Whitehead <josh.whitehead@dornerworks.com>,
 Robert VanVossen <Robert.VanVossen@dornerworks.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-25-jgross@suse.com>
 <73c41851-cba3-c8aa-b031-dcfb3dcff6a4@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <f91d4df5-5b35-1030-ea13-c99d3ec16157@suse.com>
Date: Tue, 24 Sep 2019 14:13:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <73c41851-cba3-c8aa-b031-dcfb3dcff6a4@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 24/47] xen: switch from for_each_vcpu()
 to for_each_sched_unit()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Dario Faggioli <dfaggioli@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMDkuMTkgMTc6MDUsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDE0LjA5LjIwMTkgMTA6
NTIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IEBAIC01MDgsMjUgKzUxNSwyNyBAQCBpbnQgc2No
ZWRfbW92ZV9kb21haW4oc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IGNwdXBvb2wgKmMpCj4+ICAg
ICAgIGlmICggSVNfRVJSKGRvbWRhdGEpICkKPj4gICAgICAgICAgIHJldHVybiBQVFJfRVJSKGRv
bWRhdGEpOwo+PiAgIAo+PiAtICAgIHZjcHVfcHJpdiA9IHh6YWxsb2NfYXJyYXkodm9pZCAqLCBk
LT5tYXhfdmNwdXMpOwo+PiAtICAgIGlmICggdmNwdV9wcml2ID09IE5VTEwgKQo+PiArICAgIC8q
IFRPRE86IGZpeCBhcnJheSBzaXplIHdpdGggbXVsdGlwbGUgdmNwdXMgcGVyIHVuaXQuICovCj4+
ICsgICAgdW5pdF9wcml2ID0geHphbGxvY19hcnJheSh2b2lkICosIGQtPm1heF92Y3B1cyk7Cj4+
ICsgICAgaWYgKCB1bml0X3ByaXYgPT0gTlVMTCApCj4+ICAgICAgIHsKPj4gICAgICAgICAgIHNj
aGVkX2ZyZWVfZG9tZGF0YShjLT5zY2hlZCwgZG9tZGF0YSk7Cj4+ICAgICAgICAgICByZXR1cm4g
LUVOT01FTTsKPj4gICAgICAgfQo+PiAgIAo+PiAtICAgIGZvcl9lYWNoX3ZjcHUgKCBkLCB2ICkK
Pj4gKyAgICB1bml0X2lkeCA9IDA7Cj4+ICsgICAgZm9yX2VhY2hfc2NoZWRfdW5pdCAoIGQsIHVu
aXQgKQo+PiAgICAgICB7Cj4+IC0gICAgICAgIHZjcHVfcHJpdlt2LT52Y3B1X2lkXSA9IHNjaGVk
X2FsbG9jX3ZkYXRhKGMtPnNjaGVkLCB2LT5zY2hlZF91bml0LAo+PiAtICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkb21kYXRhKTsKPj4gLSAgICAgICAg
aWYgKCB2Y3B1X3ByaXZbdi0+dmNwdV9pZF0gPT0gTlVMTCApCj4+ICsgICAgICAgIHVuaXRfcHJp
dlt1bml0X2lkeF0gPSBzY2hlZF9hbGxvY192ZGF0YShjLT5zY2hlZCwgdW5pdCwgZG9tZGF0YSk7
Cj4+ICsgICAgICAgIGlmICggdW5pdF9wcml2W3VuaXRfaWR4XSA9PSBOVUxMICkKPj4gICAgICAg
ICAgIHsKPj4gLSAgICAgICAgICAgIGZvcl9lYWNoX3ZjcHUgKCBkLCB2ICkKPj4gLSAgICAgICAg
ICAgICAgICB4ZnJlZSh2Y3B1X3ByaXZbdi0+dmNwdV9pZF0pOwo+PiAtICAgICAgICAgICAgeGZy
ZWUodmNwdV9wcml2KTsKPj4gKyAgICAgICAgICAgIGZvciAoIHVuaXRfaWR4ID0gMDsgdW5pdF9w
cml2W3VuaXRfaWR4XTsgdW5pdF9pZHgrKyApCj4+ICsgICAgICAgICAgICAgICAgc2NoZWRfZnJl
ZV92ZGF0YShjLT5zY2hlZCwgdW5pdF9wcml2W3VuaXRfaWR4XSk7Cj4gCj4gVGhpcyBpcyBhbiB1
bmV4cGVjdGVkIGNoYW5nZSBmcm9tIHhmcmVlKCkgdG8gc2NoZWRfZnJlZV92ZGF0YSgpLiBJZgo+
IGl0IHJlYWxseSBpcyBjb3JyZWN0LCBpdCBzaG91bGQgYmUgbWVudGlvbmVkIGluIHRoZSBkZXNj
cmlwdGlvbi4gSQo+IGNhbiBzZWUgd2h5IHRoaXMgbWlnaHQgYmUgYmV0dGVyIGZyb20gYW4gYWJz
dHJhY3QgcG92LCBidXQgaXQncwo+IHF1ZXN0aW9uYWJsZSB3aGV0aGVyIGFyaW5jNjUzJ3MgdXBk
YXRlX3NjaGVkdWxlX3ZjcHVzKCkgcmVhbGx5IHdhbnRzCj4gY2FsbGluZyBhdCB0aGlzIHBvaW50
IChwZXJoYXBzIGl0IGRvZXMsIGFzIGE2NTNzY2hlZF9hbGxvY192ZGF0YSgpCj4gYWxzbyBjYWxs
cyBpdCkuCgpZZXMsIEkgc2hvdWxkIHB1dCB0aGlzIGNoYW5nZSBpbnRvIGFuIG93biBwYXRjaCBh
dCB0aGUgYmVnaW5uaW5nCm9mIHRoZSBzZXJpZXMgKG9yIG91dHNpZGUgb2YgaXQpLCBhcyBpdCBp
cyByZWFsbHkgYSBidWcgZml4LgoKVGhlIGRhdGEgYWxsb2NhdGVkIHZpYSBzY2hlZF9hbGxvY192
ZGF0YSgpIGlzIHB1dCBpbnRvIGEgbGlzdCBieSB0aGUKYXJpbmMgc2NoZWR1bGVyLCBzbyBqdXN0
IHhmcmVlKClpbmcgaXQgaXMgY2xlYXJseSB3cm9uZy4KCj4gCj4gSm9zaCwgUm9iZXJ0OiBCZXNp
ZGVzIHRoaXMgaW1tZWRpYXRlIGFzcGVjdCBJIGFsc28gd29uZGVyIHdoZXRoZXIKPiBzYWlkIGNh
bGwgaXMgY29ycmVjdCB0byBtYWtlIG91dHNpZGUgb2YgYSBzY2hlZF9wcml2LT5sb2NrJ2VkCj4g
cmVnaW9uLCB3aGVuIGJvdGggb3RoZXIgaW5zdGFuY2VzIG9jY3VyIGluc2lkZSBvZiBvbmUgKGFu
ZCBpbiBvbmUKPiBjYXNlIGltbWVkaWF0ZWx5IGJlZm9yZSBhbiB1bmxvY2ssIGkuZS4gaWYgdGhl
IGxvY2sgd2Fzbid0IG5lZWRlZAo+IHRoZSB0d28gc3RlcHMgY291bGQgd2VsbCBiZSByZS1vcmRl
cmVkKS4KCkkgZ3Vlc3MgYTY1M3NjaGVkX2ZyZWVfdmRhdGEoKSBpcyBtaXNzaW5nIHRoZSByZXF1
aXJlZCBsb2NraW5nLgpJJ2xsIGFkZCB0aGF0IGluIHRoZSBidWdmaXguCgo+IEZpbmFsbHksIGF0
IHRoaXMgcG9pbnQsIHNob3VsZG4ndCB0aGUgZnVuY3Rpb25zIGFuZCBob29rcyAoYWxyZWFkeSkK
PiBiZSBuYW1lZCB7YWxsb2MsZnJlZX1fdWRhdGEoKT8KCkluZGVlZCB0aGV5IHNob3VsZC4KCj4g
Cj4+IEBAIC04OTYsMTggKzkyOSwyMiBAQCB2b2lkIHJlc3RvcmVfdmNwdV9hZmZpbml0eShzdHJ1
Y3QgZG9tYWluICpkKQo+PiAgICAgICAgICAgICAgICAgICAgICAgY3B1cG9vbF9kb21haW5fY3B1
bWFzayhkKSk7Cj4+ICAgICAgICAgICBpZiAoIGNwdW1hc2tfZW1wdHkoY3B1bWFza19zY3JhdGNo
X2NwdShjcHUpKSApCj4+ICAgICAgICAgICB7Cj4+IC0gICAgICAgICAgICBpZiAoIHYtPmFmZmlu
aXR5X2Jyb2tlbiApCj4+ICsgICAgICAgICAgICBpZiAoIHNjaGVkX2NoZWNrX2FmZmluaXR5X2Jy
b2tlbih1bml0KSApCj4+ICAgICAgICAgICAgICAgewo+PiAtICAgICAgICAgICAgICAgIHNjaGVk
X3NldF9hZmZpbml0eSh2LCB1bml0LT5jcHVfaGFyZF9hZmZpbml0eV9zYXZlZCwgTlVMTCk7Cj4+
IC0gICAgICAgICAgICAgICAgdi0+YWZmaW5pdHlfYnJva2VuID0gMDsKPj4gKyAgICAgICAgICAg
ICAgICAvKiBBZmZpbml0eSBzZXR0aW5ncyBvZiBvbmUgdmNwdSBhcmUgZm9yIHRoZSBjb21wbGV0
ZSB1bml0LiAqLwo+PiArICAgICAgICAgICAgICAgIHNjaGVkX3NldF9hZmZpbml0eSh1bml0LT52
Y3B1X2xpc3QsCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuaXQtPmNw
dV9oYXJkX2FmZmluaXR5X3NhdmVkLCBOVUxMKTsKPiAKPiBZZXQgZGVzcGl0ZSB0aGUgY29tbWVu
dCB0aGUgZnVuY3Rpb24gZ2V0cyBwYXNzZWQgYSBzdHJ1Y3QgdmNwdSAqLAo+IGFuZCB0aGlzIGRv
ZXNuJ3QgbG9vayB0byBjaGFuZ2UgYnkgdGhlIGVuZCBvZiB0aGUgc2VyaWVzLiBJcyB0aGVyZQo+
IGEgcmVhc29uIGZvciB0aGlzPwoKWWVzLiBzY2hlZF9zZXRfYWZmaW5pdHkoKSBpcyB1c2VkIGZy
b20gb3V0c2lkZSBvZiBzY2hlZHVsZS5jIChieQpkb20wX2J1aWxkLmMpLgoKPiAKPj4gQEAgLTk1
MCwxNyArOTg2LDE5IEBAIGludCBjcHVfZGlzYWJsZV9zY2hlZHVsZXIodW5zaWduZWQgaW50IGNw
dSkKPj4gICAKPj4gICAgICAgZm9yX2VhY2hfZG9tYWluX2luX2NwdXBvb2wgKCBkLCBjICkKPj4g
ICAgICAgewo+PiAtICAgICAgICBmb3JfZWFjaF92Y3B1ICggZCwgdiApCj4+ICsgICAgICAgIHN0
cnVjdCBzY2hlZF91bml0ICp1bml0Owo+PiArCj4+ICsgICAgICAgIGZvcl9lYWNoX3NjaGVkX3Vu
aXQgKCBkLCB1bml0ICkKPj4gICAgICAgICAgIHsKPj4gICAgICAgICAgICAgICB1bnNpZ25lZCBs
b25nIGZsYWdzOwo+PiAtICAgICAgICAgICAgc3RydWN0IHNjaGVkX3VuaXQgKnVuaXQgPSB2LT5z
Y2hlZF91bml0Owo+PiAgICAgICAgICAgICAgIHNwaW5sb2NrX3QgKmxvY2sgPSB1bml0X3NjaGVk
dWxlX2xvY2tfaXJxc2F2ZSh1bml0LCAmZmxhZ3MpOwo+PiAgIAo+PiAgICAgICAgICAgICAgIGNw
dW1hc2tfYW5kKCZvbmxpbmVfYWZmaW5pdHksIHVuaXQtPmNwdV9oYXJkX2FmZmluaXR5LCBjLT5j
cHVfdmFsaWQpOwo+PiAgICAgICAgICAgICAgIGlmICggY3B1bWFza19lbXB0eSgmb25saW5lX2Fm
ZmluaXR5KSAmJgo+PiAgICAgICAgICAgICAgICAgICAgY3B1bWFza190ZXN0X2NwdShjcHUsIHVu
aXQtPmNwdV9oYXJkX2FmZmluaXR5KSApCj4+ICAgICAgICAgICAgICAgewo+PiAtICAgICAgICAg
ICAgICAgIGlmICggdi0+YWZmaW5pdHlfYnJva2VuICkKPj4gKyAgICAgICAgICAgICAgICAvKiBU
T0RPOiBtdWx0aXBsZSB2Y3B1cyBwZXIgdW5pdC4gKi8KPj4gKyAgICAgICAgICAgICAgICBpZiAo
IHVuaXQtPnZjcHVfbGlzdC0+YWZmaW5pdHlfYnJva2VuICkKPiAKPiBXaHkgbm90IHNjaGVkX2No
ZWNrX2FmZmluaXR5X2Jyb2tlbih1bml0KT8gUXVpdGUgcG9zc2libHkgdGhpcyB3b3VsZAo+IG1h
a2UgdGhlIFRPRE8gaXRlbSB1bm5lY2Vzc2FyeT8KCk9oLCBpbmRlZWQuCgo+IAo+PiBAQCAtOTY4
LDE0ICsxMDA2LDE1IEBAIGludCBjcHVfZGlzYWJsZV9zY2hlZHVsZXIodW5zaWduZWQgaW50IGNw
dSkKPj4gICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+PiAgICAgICAgICAgICAgICAgICB9
Cj4+ICAgCj4+IC0gICAgICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19ERUJVRyAiQnJlYWtpbmcg
YWZmaW5pdHkgZm9yICVwdlxuIiwgdik7Cj4+ICsgICAgICAgICAgICAgICAgcHJpbnRrKFhFTkxP
R19ERUJVRyAiQnJlYWtpbmcgYWZmaW5pdHkgZm9yICVwdlxuIiwKPj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgdW5pdC0+dmNwdV9saXN0KTsKPj4gICAKPj4gLSAgICAgICAgICAgICAgICBzY2hl
ZF9zZXRfYWZmaW5pdHkodiwgJmNwdW1hc2tfYWxsLCBOVUxMKTsKPj4gKyAgICAgICAgICAgICAg
ICBzY2hlZF9zZXRfYWZmaW5pdHkodW5pdC0+dmNwdV9saXN0LCAmY3B1bWFza19hbGwsIE5VTEwp
Owo+PiAgICAgICAgICAgICAgIH0KPj4gICAKPj4gLSAgICAgICAgICAgIGlmICggdi0+cHJvY2Vz
c29yICE9IGNwdSApCj4+ICsgICAgICAgICAgICBpZiAoIHNjaGVkX3VuaXRfY3B1KHVuaXQpICE9
IHNjaGVkX2dldF9yZXNvdXJjZV9jcHUoY3B1KSApCj4gCj4gRGlkbid0IHlvdSBhZ3JlZSB0aGF0
IHRoaXMgY2FuIGJlIGhhZCBjaGVhcGVyPyBRdWl0ZSBsaWtlbHkgbXkgdjIKPiByZXZpZXcgcmVt
YXJrIHdhcyBvbiBhIGRpZmZlcmVudCBpbnN0YW5jZSwgYnV0IHRoZSBwYXR0ZXJuIG91Z2h0Cj4g
dG8gYmUgcmVsYXRpdmVseSBzaW1wbGUgdG8gZmluZCBpbiB0aGUgZW50aXJlIHNlcmllcyAoYW5k
IGJ5IHRoZQo+IGVuZCBvZiB0aGUgc2VyaWVzIHRoZXJlJ3Mgb25lIG90aGVyIGluc3RhbmNlIGlu
IHNjaGVkdWxlLmMgLi4uCgpXaWxsIGNoZWNrIGFnYWluLiBUaGFua3MgZm9yIHRoZSByZW1pbmRl
ci4KCj4gCj4+IEBAIC05ODgsMTcgKzEwMjcsMTggQEAgaW50IGNwdV9kaXNhYmxlX3NjaGVkdWxl
cih1bnNpZ25lZCBpbnQgY3B1KQo+PiAgICAgICAgICAgICAgICAqICAqIHRoZSBzY2hlZHVsZXIg
d2lsbCBhbHdheXMgZmluZCBhIHN1aXRhYmxlIHNvbHV0aW9uLCBvcgo+PiAgICAgICAgICAgICAg
ICAqICAgIHRoaW5ncyB3b3VsZCBoYXZlIGZhaWxlZCBiZWZvcmUgZ2V0dGluZyBpbiBoZXJlLgo+
PiAgICAgICAgICAgICAgICAqLwo+PiAtICAgICAgICAgICAgdmNwdV9taWdyYXRlX3N0YXJ0KHYp
Owo+PiArICAgICAgICAgICAgLyogVE9ETzogbXVsdGlwbGUgdmNwdXMgcGVyIHVuaXQuICovCj4+
ICsgICAgICAgICAgICB2Y3B1X21pZ3JhdGVfc3RhcnQodW5pdC0+dmNwdV9saXN0KTsKPj4gICAg
ICAgICAgICAgICB1bml0X3NjaGVkdWxlX3VubG9ja19pcnFyZXN0b3JlKGxvY2ssIGZsYWdzLCB1
bml0KTsKPj4gICAKPj4gLSAgICAgICAgICAgIHZjcHVfbWlncmF0ZV9maW5pc2godik7Cj4+ICsg
ICAgICAgICAgICB2Y3B1X21pZ3JhdGVfZmluaXNoKHVuaXQtPnZjcHVfbGlzdCk7Cj4+ICAgCj4+
ICAgICAgICAgICAgICAgLyoKPj4gICAgICAgICAgICAgICAgKiBUaGUgb25seSBjYXZlYXQsIGlu
IHRoaXMgY2FzZSwgaXMgdGhhdCBpZiBhIHZjcHUgYWN0aXZlIGluCj4+ICAgICAgICAgICAgICAg
ICogdGhlIGh5cGVydmlzb3IgaXNuJ3QgbWlncmF0YWJsZS4gSW4gdGhpcyBjYXNlLCB0aGUgY2Fs
bGVyCj4+ICAgICAgICAgICAgICAgICogc2hvdWxkIHRyeSBhZ2FpbiBhZnRlciByZWxlYXNpbmcg
YW5kIHJlYXF1aXJpbmcgYWxsIGxvY2tzLgo+PiAgICAgICAgICAgICAgICAqLwo+PiAtICAgICAg
ICAgICAgaWYgKCB2LT5wcm9jZXNzb3IgPT0gY3B1ICkKPj4gKyAgICAgICAgICAgIGlmICggc2No
ZWRfdW5pdF9jcHUodW5pdCkgPT0gc2NoZWRfZ2V0X3Jlc291cmNlX2NwdShjcHUpICkKPiAKPiAu
Li4gaGVyZTsgSSBkaWRuJ3QgY2hlY2sgb3RoZXIgZmlsZXMpLgo+IAo+PiBAQCAtMTAwOSw4ICsx
MDQ5LDggQEAgaW50IGNwdV9kaXNhYmxlX3NjaGVkdWxlcih1bnNpZ25lZCBpbnQgY3B1KQo+PiAg
IHN0YXRpYyBpbnQgY3B1X2Rpc2FibGVfc2NoZWR1bGVyX2NoZWNrKHVuc2lnbmVkIGludCBjcHUp
Cj4+ICAgewo+PiAgICAgICBzdHJ1Y3QgZG9tYWluICpkOwo+PiAtICAgIHN0cnVjdCB2Y3B1ICp2
Owo+PiAgICAgICBzdHJ1Y3QgY3B1cG9vbCAqYzsKPj4gKyAgICBzdHJ1Y3QgdmNwdSAqdjsKPiAK
PiBVbm5lY2Vzc2FyeSBjaGFuZ2U/CgpZZXMuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
