Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BAD51466A5
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 12:21:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuaVY-0000IV-Tv; Thu, 23 Jan 2020 11:18:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UGQU=3M=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iuaVX-0000IO-0S
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 11:18:43 +0000
X-Inumbo-ID: 178fba34-3dd2-11ea-b833-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 178fba34-3dd2-11ea-b833-bc764e2007e4;
 Thu, 23 Jan 2020 11:18:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AEAA2AD5C;
 Thu, 23 Jan 2020 11:18:32 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20200122202343.5703-1-liuwe@microsoft.com>
 <20200122202343.5703-3-liuwe@microsoft.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <06b7abf9-69c2-9f62-d55a-d8c2e684557a@suse.com>
Date: Thu, 23 Jan 2020 12:18:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200122202343.5703-3-liuwe@microsoft.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 2/7] x86/hyperv: setup hypercall page
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
Cc: Wei Liu <liuwe@microsoft.com>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIuMDEuMjAyMCAyMToyMywgV2VpIExpdSB3cm90ZToKPiAtLS0gYS94ZW4vYXJjaC94ODYv
ZTgyMC5jCj4gKysrIGIveGVuL2FyY2gveDg2L2U4MjAuYwo+IEBAIC0zNiw2ICszNiwyMiBAQCBi
b29sZWFuX3BhcmFtKCJlODIwLXZlcmJvc2UiLCBlODIwX3ZlcmJvc2UpOwo+ICBzdHJ1Y3QgZTgy
MG1hcCBlODIwOwo+ICBzdHJ1Y3QgZTgyMG1hcCBfX2luaXRkYXRhIGU4MjBfcmF3Owo+ICAKPiAr
c3RhdGljIHVuc2lnbmVkIGludCBmaW5kX3BoeXNfYWRkcl9iaXRzKHZvaWQpCj4gK3sKPiArICAg
IHVpbnQzMl90IGVheDsKPiArICAgIHVuc2lnbmVkIGludCBwaHlzX2JpdHMgPSAzNjsKPiArCj4g
KyAgICBlYXggPSBjcHVpZF9lYXgoMHg4MDAwMDAwMCk7Cj4gKyAgICBpZiAoIChlYXggPj4gMTYp
ID09IDB4ODAwMCAmJiBlYXggPj0gMHg4MDAwMDAwOCApCj4gKyAgICB7Cj4gKyAgICAgICAgcGh5
c19iaXRzID0gKHVpbnQ4X3QpY3B1aWRfZWF4KDB4ODAwMDAwMDgpOwo+ICsgICAgICAgIGlmICgg
cGh5c19iaXRzID4gUEFERFJfQklUUyApCj4gKyAgICAgICAgICAgIHBoeXNfYml0cyA9IFBBRERS
X0JJVFM7Cj4gKyAgICB9Cj4gKwo+ICsgICAgcmV0dXJuIHBoeXNfYml0czsKPiArfQoKSW5zdGVh
ZCBvZiB0aGlzLCBob3cgYWJvdXQgcHVsbGluZyBmdXJ0aGVyIGFoZWFkIHRoZSBjYWxsIHRvCmVh
cmx5X2NwdV9pbml0KCkgaW4gc2V0dXAuYz8gKE90aGVyd2lzZSB0aGUgZnVuY3Rpb24gd2FudHMg
dG8KYmUgX19pbml0IGF0IGxlYXN0LikKCj4gQEAgLTM1Nyw2ICszNzMsMjEgQEAgc3RhdGljIHVu
c2lnbmVkIGxvbmcgX19pbml0IGZpbmRfbWF4X3Bmbih2b2lkKQo+ICAgICAgICAgICAgICBtYXhf
cGZuID0gZW5kOwo+ICAgICAgfQo+ICAKPiArI2lmZGVmIENPTkZJR19IWVBFUlZfR1VFU1QKPiAr
ICAgIHsKPiArCS8qCj4gKwkgKiBXZSByZXNlcnZlIHRoZSB0b3AtbW9zdCBwYWdlIGZvciBoeXBl
cmNhbGwgcGFnZS4gQWRqdXN0Cj4gKwkgKiBtYXhfcGZuIGlmIG5lY2Vzc2FyeS4KPiArCSAqLwo+
ICsgICAgICAgIHVuc2lnbmVkIGludCBwaHlzX2JpdHMgPSBmaW5kX3BoeXNfYWRkcl9iaXRzKCk7
Cj4gKyAgICAgICAgdW5zaWduZWQgbG9uZyBoY2FsbF9wZm4gPQo+ICsgICAgICAgICAgKCgxdWxs
IDw8IHBoeXNfYml0cykgLSAxKSA+PiBQQUdFX1NISUZUOwo+ICsKPiArICAgICAgICBpZiAoIG1h
eF9wZm4gPj0gaGNhbGxfcGZuICkKPiArICAgICAgICAgIG1heF9wZm4gPSBoY2FsbF9wZm4gLSAx
Owo+ICsgICAgfQo+ICsjZW5kaWYKClRoaXMgd2FudHMgYWJzdHJhY3RpbmcgYXdheTogVGhlcmUg
c2hvdWxkbid0IGJlIEh5cGVyLVYgc3BlY2lmaWMKY29kZSBpbiBoZXJlIGlmIGF0IGFsbCBwb3Nz
aWJsZSwgYW5kIHRoZSBhZGp1c3RtZW50IGFsc28gc2hvdWxkbid0CmJlIG1hZGUgdW5sZXNzIGFj
dHVhbGx5IHJ1bm5pbmcgb24gSHlwZXItVi4KCj4gLS0tIGEveGVuL2FyY2gveDg2L2d1ZXN0L2h5
cGVydi9oeXBlcnYuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMK
PiBAQCAtMTgsMTcgKzE4LDI3IEBACj4gICAqCj4gICAqIENvcHlyaWdodCAoYykgMjAxOSBNaWNy
b3NvZnQuCj4gICAqLwo+ICsjaW5jbHVkZSA8eGVuL3ZlcnNpb24uaD4KPiAgI2luY2x1ZGUgPHhl
bi9pbml0Lmg+CgpQbGVhc2Ugc29ydCBhbHBoYWJldGljYWxseS4KCj4gKyNpbmNsdWRlIDxhc20v
Zml4bWFwLmg+Cj4gICNpbmNsdWRlIDxhc20vZ3Vlc3QuaD4KPiAgI2luY2x1ZGUgPGFzbS9ndWVz
dC9oeXBlcnYtdGxmcy5oPgo+ICsjaW5jbHVkZSA8YXNtL3Byb2Nlc3Nvci5oPgo+ICAKPiAgc3Ry
dWN0IG1zX2h5cGVydl9pbmZvIF9fcmVhZF9tb3N0bHkgbXNfaHlwZXJ2Owo+ICAKPiAtc3RhdGlj
IGNvbnN0IHN0cnVjdCBoeXBlcnZpc29yX29wcyBvcHMgPSB7Cj4gLSAgICAubmFtZSA9ICJIeXBl
ci1WIiwKPiAtfTsKPiArc3RhdGljIHVpbnQ2NF90IGdlbmVyYXRlX2d1ZXN0X2lkKHZvaWQpCj4g
K3sKPiArICAgIHVpbnQ2NF90IGlkID0gMDsKClBvaW50bGVzcyBpbml0aWFsaXplci4KCj4gKyAg
ICBpZCA9ICh1aW50NjRfdClIVl9YRU5fVkVORE9SX0lEIDw8IDQ4Owo+ICsgICAgaWQgfD0gKHhl
bl9tYWpvcl92ZXJzaW9uKCkgPDwgMTYpIHwgeGVuX21pbm9yX3ZlcnNpb24oKTsKPiArCj4gKyAg
ICByZXR1cm4gaWQ7Cj4gK30KPiAgCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgaHlwZXJ2aXNvcl9v
cHMgb3BzOwo+ICBjb25zdCBzdHJ1Y3QgaHlwZXJ2aXNvcl9vcHMgKl9faW5pdCBoeXBlcnZfcHJv
YmUodm9pZCkKCkJsYW5rIGxpbmUgYmV0d2VlbiB0aGVzZSB0d28gcGxlYXNlIChpZiB5b3UgY2Fu
J3QgZ2V0IGF3YXkgd2l0aG91dAp0aGlzIGRlY2xhcmF0aW9uIGluIHRoZSBmaXJzdCBwbGFjZSku
Cgo+IEBAIC03Miw2ICs4Miw0MyBAQCBjb25zdCBzdHJ1Y3QgaHlwZXJ2aXNvcl9vcHMgKl9faW5p
dCBoeXBlcnZfcHJvYmUodm9pZCkKPiAgICAgIHJldHVybiAmb3BzOwo+ICB9Cj4gIAo+ICtzdGF0
aWMgdm9pZCBfX2luaXQgc2V0dXBfaHlwZXJjYWxsX3BhZ2Uodm9pZCkKPiArewo+ICsgICAgdW5p
b24gaHZfeDY0X21zcl9oeXBlcmNhbGxfY29udGVudHMgaHlwZXJjYWxsX21zcjsKPiArICAgIHVu
aW9uIGh2X2d1ZXN0X29zX2lkIGd1ZXN0X2lkOwo+ICsgICAgdW5zaWduZWQgbG9uZyBtZm47Cj4g
Kwo+ICsgICAgcmRtc3JsKEhWX1g2NF9NU1JfR1VFU1RfT1NfSUQsIGd1ZXN0X2lkLnJhdyk7Cj4g
KyAgICBpZiAoICFndWVzdF9pZC5yYXcgKQo+ICsgICAgewo+ICsgICAgICAgIGd1ZXN0X2lkLnJh
dyA9IGdlbmVyYXRlX2d1ZXN0X2lkKCk7Cj4gKyAgICAgICAgd3Jtc3JsKEhWX1g2NF9NU1JfR1VF
U1RfT1NfSUQsIGd1ZXN0X2lkLnJhdyk7Cj4gKyAgICB9Cj4gKwo+ICsgICAgcmRtc3JsKEhWX1g2
NF9NU1JfSFlQRVJDQUxMLCBoeXBlcmNhbGxfbXNyLmFzX3VpbnQ2NCk7Cj4gKyAgICBpZiAoICFo
eXBlcmNhbGxfbXNyLmVuYWJsZSApCj4gKyAgICB7Cj4gKyAgICAgICAgbWZuID0gKCgxdWxsIDw8
IHBhZGRyX2JpdHMpIC0gMSkgPj4gSFZfSFlQX1BBR0VfU0hJRlQ7CgpBbG9uZyB0aGUgbGluZXMg
b2YgdGhlIGFic3RyYWN0aW5nLWF3YXkgcmVxdWVzdCBhYm92ZTogSG93IGlzCmFueW9uZSB0byBu
b3RpY2Ugd2hhdCBlbHNlIG5lZWRzIGNoYW5naW5nIGlmIGl0IGlzIGRlY2lkZWQKdGhhdCB0aGlz
IHBhZ2UgZ2V0cyBtb3ZlZCBlbHNld2hlcmU/Cgo+ICsgICAgICAgIGh5cGVyY2FsbF9tc3IuZW5h
YmxlID0gMTsKPiArICAgICAgICBoeXBlcmNhbGxfbXNyLmd1ZXN0X3BoeXNpY2FsX2FkZHJlc3Mg
PSBtZm47Cj4gKyAgICAgICAgd3Jtc3JsKEhWX1g2NF9NU1JfSFlQRVJDQUxMLCBoeXBlcmNhbGxf
bXNyLmFzX3VpbnQ2NCk7CgpTbyBvbiBIeXBlci1WIHRoZSBoeXBlcnZpc29yIG1hZ2ljYWxseSBw
b3B1bGF0ZXMgdGhpcyBwYWdlIGFzCmEgc2lkZSBlZmZlY3Qgb2YgdGhlIE1TUiB3cml0ZT8KCkph
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
