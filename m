Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B428A6695
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2019 12:34:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i566J-0003be-Rr; Tue, 03 Sep 2019 10:31:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=j28/=W6=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i566I-0003bZ-U7
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2019 10:31:50 +0000
X-Inumbo-ID: 08ad1cfc-ce36-11e9-ab8c-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 08ad1cfc-ce36-11e9-ab8c-12813bfff9fa;
 Tue, 03 Sep 2019 10:31:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7A802B03A;
 Tue,  3 Sep 2019 10:31:47 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190828080028.18205-1-jgross@suse.com>
 <20190828080028.18205-4-jgross@suse.com>
 <46c66d92-87c0-d90f-921d-68082d52c798@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <fb6cf90c-6ddc-f605-8b18-06010f17fbb4@suse.com>
Date: Tue, 3 Sep 2019 12:31:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <46c66d92-87c0-d90f-921d-68082d52c798@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v3 3/4] xen: refactor debugtrace data
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
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDkuMTkgMTI6MTYsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDI4LjA4LjIwMTkgMTA6
MDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IEFzIGEgcHJlcGFyYXRpb24gZm9yIHBlci1jcHUg
YnVmZmVycyBkbyBhIGxpdHRsZSByZWZhY3RvcmluZyBvZiB0aGUKPj4gZGVidWd0cmFjZSBkYXRh
OiBwdXQgdGhlIG5lZWRlZCBidWZmZXIgYWRtaW4gZGF0YSBpbnRvIHRoZSBidWZmZXIgYXMKPj4g
aXQgd2lsbCBiZSBuZWVkZWQgZm9yIGVhY2ggYnVmZmVyLgo+Pgo+PiBXaGlsZSBhdCBpdCBzd2l0
Y2ggZGVidWd0cmFjZV9zZW5kX3RvX2NvbnNvbGUgYW5kIGRlYnVndHJhY2VfdXNlZCB0bwo+PiBi
b29sIGFuZCBkZWxldGUgYW4gZW1wdHkgbGluZS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSnVlcmdl
biBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+PiAtLS0KPj4gICB4ZW4vY29tbW9uL2RlYnVndHJh
Y2UuYyB8IDYyICsrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0t
LS0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKSwgMjcgZGVsZXRpb25zKC0p
Cj4+Cj4+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2RlYnVndHJhY2UuYyBiL3hlbi9jb21tb24v
ZGVidWd0cmFjZS5jCj4+IGluZGV4IGEyZmFiMGQ3MmMuLjdhOWU0ZmI5OWYgMTAwNjQ0Cj4+IC0t
LSBhL3hlbi9jb21tb24vZGVidWd0cmFjZS5jCj4+ICsrKyBiL3hlbi9jb21tb24vZGVidWd0cmFj
ZS5jCj4+IEBAIC0xNSwzMyArMTUsMzkgQEAKPj4gICAjaW5jbHVkZSA8eGVuL3dhdGNoZG9nLmg+
Cj4+ICAgCj4+ICAgLyogU2VuZCBvdXRwdXQgZGlyZWN0IHRvIGNvbnNvbGUsIG9yIGJ1ZmZlciBp
dD8gKi8KPj4gLXN0YXRpYyB2b2xhdGlsZSBpbnQgZGVidWd0cmFjZV9zZW5kX3RvX2NvbnNvbGU7
Cj4+ICtzdGF0aWMgdm9sYXRpbGUgYm9vbCBkZWJ1Z3RyYWNlX3NlbmRfdG9fY29uc29sZTsKPj4g
ICAKPj4gLXN0YXRpYyBjaGFyICAgICAgICAqZGVidWd0cmFjZV9idWY7IC8qIERlYnVnLXRyYWNl
IGJ1ZmZlciAqLwo+PiAtc3RhdGljIHVuc2lnbmVkIGludCBkZWJ1Z3RyYWNlX3ByZDsgLyogUHJv
ZHVjZXIgaW5kZXggICAgICovCj4+IC1zdGF0aWMgdW5zaWduZWQgaW50IGRlYnVndHJhY2Vfa2ls
b2J5dGVzID0gMTI4LCBkZWJ1Z3RyYWNlX2J5dGVzOwo+PiAtc3RhdGljIHVuc2lnbmVkIGludCBk
ZWJ1Z3RyYWNlX3VzZWQ7Cj4+ICtzdHJ1Y3QgZGVidWd0cmFjZV9kYXRhX3Mgewo+IAo+IElzIHRo
ZSBfcyBzdWZmaXggcmVhbGx5IG5lZWRlZCBmb3Igc29tZSByZWFzb24/CgpObywgbm90IHJlYWxs
eS4gSSBjYW4gZHJvcCBpdC4KCj4gCj4+ICsgICAgdW5zaWduZWQgbG9uZyBieXRlczsgLyogU2l6
ZSBvZiBidWZmZXIuICovCj4+ICsgICAgdW5zaWduZWQgbG9uZyBwcmQ7ICAgLyogUHJvZHVjZXIg
aW5kZXguICovCj4gCj4gU2VlaW5nIHRoYXQgeW91IHN3aXRjaCBmcm9tIGludCB0byBsb25nIGhl
cmUgLSBhcmUgeW91IHJlYWxseQo+IGZhbmN5aW5nIHRoZXNlIGJ1ZmZlcnMgdG8gZ28gYmV5b25k
IDRHaUIgaW4gc2l6ZT8KCkkgZGlkbid0IHdhbnQgdG8gcnVsZSBpdCBvdXQgb24gYSBtdWx0aS1U
QiBtYWNoaW5lLiA6LSkKCj4gCj4+ICsgICAgY2hhciAgICAgICAgICBidWZbXTsKPj4gK307Cj4+
ICsKPj4gK3N0YXRpYyBzdHJ1Y3QgZGVidWd0cmFjZV9kYXRhX3MgKmRlYnRyX2RhdGE7Cj4gCj4g
SG93IGFib3V0IHMvZGVidHIvZHQvIG9yIHMvZGVidHIvZGVidWd0cmFjZS8gPwoKWWVzLCBkdCBz
ZWVtcyB0byBiZSBmaW5lLgoKPiAKPj4gK3N0YXRpYyB1bnNpZ25lZCBpbnQgZGVidWd0cmFjZV9r
aWxvYnl0ZXMgPSAxMjg7Cj4gCj4gU2luY2UgeW91IHRvdWNoIHRoaXMgYW55d2F5LCBhZGQgX19p
bml0ZGF0YT8gTWF5YmUgYWxzbyBtb3ZlIGl0Cj4gbmV4dCB0byBpdHMgaW50ZWdlcl9wYXJhbSgp
PwoKVGhpcyBpcyBtb2RpZmllZCBpbiBwYXRjaCA0IGFnYWluLCBhbmQgdGhlcmUgSSBuZWVkIGl0
IGluIHRoZSBydW5uaW5nCnN5c3RlbSBmb3Igc3VwcG9ydCBvZiBjcHUgaG90cGx1ZyB3aXRoIHBl
ci1jcHUgYnVmZmVycy4KCj4gCj4+ICtzdGF0aWMgYm9vbCBkZWJ1Z3RyYWNlX3VzZWQ7Cj4+ICAg
c3RhdGljIERFRklORV9TUElOTE9DSyhkZWJ1Z3RyYWNlX2xvY2spOwo+PiAgIGludGVnZXJfcGFy
YW0oImRlYnVndHJhY2UiLCBkZWJ1Z3RyYWNlX2tpbG9ieXRlcyk7Cj4+ICAgCj4+ICAgc3RhdGlj
IHZvaWQgZGVidWd0cmFjZV9kdW1wX3dvcmtlcih2b2lkKQo+PiAgIHsKPj4gLSAgICBpZiAoIChk
ZWJ1Z3RyYWNlX2J5dGVzID09IDApIHx8ICFkZWJ1Z3RyYWNlX3VzZWQgKQo+PiArICAgIGlmICgg
IWRlYnRyX2RhdGEgfHwgIWRlYnVndHJhY2VfdXNlZCApCj4+ICAgICAgICAgICByZXR1cm47Cj4g
Cj4gV2h5IGRvbid0IHlvdSBnZXQgcmlkIG9mIHRoZSBsZWZ0IHNpZGUgb2YgdGhlIHx8IGFsdG9n
ZXRoZXI/CgpJbiBwYXRjaCA0IEkgZG8uIDotKQoKSSBjYW4gZHJvcCBpdCBoZXJlIGFscmVhZHku
Cgo+IAo+PiBAQCAtMTY1LDEyICsxNzEsMTQgQEAgc3RhdGljIGludCBfX2luaXQgZGVidWd0cmFj
ZV9pbml0KHZvaWQpCj4+ICAgICAgICAgICByZXR1cm4gMDsKPj4gICAKPj4gICAgICAgb3JkZXIg
PSBnZXRfb3JkZXJfZnJvbV9ieXRlcyhieXRlcyk7Cj4+IC0gICAgZGVidWd0cmFjZV9idWYgPSBh
bGxvY194ZW5oZWFwX3BhZ2VzKG9yZGVyLCAwKTsKPj4gLSAgICBBU1NFUlQoZGVidWd0cmFjZV9i
dWYgIT0gTlVMTCk7Cj4+ICsgICAgZGF0YSA9IGFsbG9jX3hlbmhlYXBfcGFnZXMob3JkZXIsIDAp
Owo+PiArICAgIGlmICggIWRhdGEgKQo+PiArICAgICAgICByZXR1cm4gLUVOT01FTTsKPj4gICAK
Pj4gLSAgICBtZW1zZXQoZGVidWd0cmFjZV9idWYsICdcMCcsIGJ5dGVzKTsKPj4gKyAgICBtZW1z
ZXQoZGF0YSwgJ1wwJywgYnl0ZXMpOwo+PiAgIAo+PiAtICAgIGRlYnVndHJhY2VfYnl0ZXMgPSBi
eXRlczsKPj4gKyAgICBkYXRhLT5ieXRlcyA9IGJ5dGVzIC0gc2l6ZW9mKCpkYXRhKTsKPj4gKyAg
ICBkZWJ0cl9kYXRhID0gZGF0YTsKPiAKPiBUaGUgYWxsb2NhdGlvbiBtYXkgZW5kIHVwIGJlaW5n
IGFsbW9zdCB0d2ljZSBhcyBiaWcgYXMgd2hhdCBnZXRzCj4gYWN0dWFsbHkgdXNlZCB0aGlzIHdh
eS4gV291bGRuJ3QgaXQgbWFrZSBzZW5zZSB0byByZS1jYWxjdWxhdGUKPiAiYnl0ZXMiIGZyb20g
Im9yZGVyIj8KClllcywgeW91IGFyZSByaWdodC4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
