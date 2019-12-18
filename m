Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D66125635
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 23:05:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihhMz-0004SK-3I; Wed, 18 Dec 2019 22:00:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kHBV=2I=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1ihhMy-0004SF-Cj
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 22:00:36 +0000
X-Inumbo-ID: cc4bf6de-21e1-11ea-a914-bc764e2007e4
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cc4bf6de-21e1-11ea-a914-bc764e2007e4;
 Wed, 18 Dec 2019 22:00:27 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id a5so3436466wmb.0
 for <xen-devel@lists.xenproject.org>; Wed, 18 Dec 2019 14:00:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mBZEt7Azn3P6Zd3MabuJ0GmCceqc+3/nBv/GddZb30A=;
 b=nMppJKQF9gU2nrZB7dE1pjqEGx41vj4QfQs+9zx0gnBPxDZJMXVBJWC0e8lrdEhO7m
 XPg4keVnZjGfML2x9aFeYjAwsSWbXomnEbCzPzfgeX041vu3zpHrUPbmfpAGAIuZKPab
 SBHlXqdOE+WqBtJdku8f2n+2czRIGPL+Cp7OKu8iwDA5lekSSWJzC3rF8uM8hLDt5qCg
 tZWY4jGLRWfdKmdpWNjqoOMXCiW3GW2w0lspQMlVjJrCnBFAhhYpgDyHH/jRR0ZCljBc
 tiB1tfufaHpouMFQwWB4iF1yRnMk6w4DO/9n7zTtnzPkKtlys8+xI9fET+b+EIQEhpDo
 kP8A==
X-Gm-Message-State: APjAAAX+jDCecfRJ9DUkGb2jOLNaqshOTV7OkkLOA1Q5IHsDa8mLkIHD
 eqGpZH6/b9wruEkly/dkNRc=
X-Google-Smtp-Source: APXvYqx0SmHNCiULsmal8933rCxo4nXBF8fhQlUvyiI/4Fid4qvAImNkDrQ2kUISj9eypDi/krfIYQ==
X-Received: by 2002:a1c:20d3:: with SMTP id g202mr5873747wmg.169.1576706426249; 
 Wed, 18 Dec 2019 14:00:26 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-234.amazon.com.
 [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id i8sm4127928wro.47.2019.12.18.14.00.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Dec 2019 14:00:25 -0800 (PST)
To: Tamas K Lengyel <tamas.lengyel@intel.com>, xen-devel@lists.xenproject.org
References: <cover.1576697796.git.tamas.lengyel@intel.com>
 <22a6cb7bd5593ed38cf6f66c26c4734a04718e1a.1576697796.git.tamas.lengyel@intel.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c6d975b9-638f-355d-79f8-1c1fae4c6007@xen.org>
Date: Wed, 18 Dec 2019 22:00:23 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <22a6cb7bd5593ed38cf6f66c26c4734a04718e1a.1576697796.git.tamas.lengyel@intel.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v2 19/20] x86/mem_sharing: reset a fork
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgVGFtYXMsCgpPbiAxOC8xMi8yMDE5IDE5OjQwLCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4g
SW1wbGVtZW50IGh5cGVyY2FsbCB0aGF0IGFsbG93cyBhIGZvcmsgdG8gc2hlZCBhbGwgbWVtb3J5
IHRoYXQgZ290IGFsbG9jYXRlZAo+IGZvciBpdCBkdXJpbmcgaXRzIGV4ZWN1dGlvbiBhbmQgcmUt
bG9hZCBpdHMgdkNQVSBjb250ZXh0IGZyb20gdGhlIHBhcmVudCBWTS4KPiBUaGlzIGFsbG93cyB0
aGUgZm9ya2VkIFZNIHRvIHJlc2V0IGludG8gdGhlIHNhbWUgc3RhdGUgdGhlIHBhcmVudCBWTSBp
cyBpbiBhCj4gZmFzdGVyIHdheSB0aGVuIGNyZWF0aW5nIGEgbmV3IGZvcmsgd291bGQgYmUuIE1l
YXN1cmVtZW50cyBzaG93IGFib3V0IGEgMngKPiBzcGVlZHVwIGR1cmluZyBub3JtYWwgZnV6emlu
ZyBvcGVyYXRpb25zLiBQZXJmb3JtYW5jZSBtYXkgdmFyeSBkZXBlbmRpbmcgaG93Cj4gbXVjaCBt
ZW1vcnkgZ290IGFsbG9jYXRlZCBmb3IgdGhlIGZvcmtlZCBWTS4gSWYgaXQgaGFzIGJlZW4gY29t
cGxldGVseQo+IGRlZHVwbGljYXRlZCBmcm9tIHRoZSBwYXJlbnQgVk0gdGhlbiBjcmVhdGluZyBh
IG5ldyBmb3JrIHdvdWxkIGxpa2VseSBiZSBtb3JlCj4gcGVyZm9ybWFudC4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzLmxlbmd5ZWxAaW50ZWwuY29tPgo+IC0tLQo+
ICAgeGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMgfCAxMDUgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKwo+ICAgeGVuL2luY2x1ZGUvcHVibGljL21lbW9yeS5oICAgfCAgIDEg
Kwo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxMDYgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQg
YS94ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJpbmcuYyBiL3hlbi9hcmNoL3g4Ni9tbS9tZW1fc2hh
cmluZy5jCj4gaW5kZXggZTkzYWQyZWM1YS4uNDczNWEzMzRiOSAxMDA2NDQKPiAtLS0gYS94ZW4v
YXJjaC94ODYvbW0vbWVtX3NoYXJpbmcuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9tZW1fc2hh
cmluZy5jCj4gQEAgLTE2MjIsNiArMTYyMiw4NyBAQCBzdGF0aWMgaW50IG1lbV9zaGFyaW5nX2Zv
cmsoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IGRvbWFpbiAqY2QpCj4gICAgICAgcmV0dXJuIDA7
Cj4gICB9Cj4gICAKPiArc3RydWN0IGdmbl9mcmVlOwo+ICtzdHJ1Y3QgZ2ZuX2ZyZWUgewo+ICsg
ICAgc3RydWN0IGdmbl9mcmVlICpuZXh0Owo+ICsgICAgc3RydWN0IHBhZ2VfaW5mbyAqcGFnZTsK
PiArICAgIGdmbl90IGdmbjsKPiArfTsKPiArCj4gK3N0YXRpYyBpbnQgbWVtX3NoYXJpbmdfZm9y
a19yZXNldChzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgZG9tYWluICpjZCkKPiArewo+ICsgICAg
aW50IHJjOwo+ICsKPiArICAgIHN0cnVjdCBwMm1fZG9tYWluKiBwMm0gPSBwMm1fZ2V0X2hvc3Rw
Mm0oY2QpOwo+ICsgICAgc3RydWN0IGdmbl9mcmVlICpsaXN0ID0gTlVMTDsKPiArICAgIHN0cnVj
dCBwYWdlX2luZm8gKnBhZ2U7Cj4gKwo+ICsgICAgcGFnZV9saXN0X2Zvcl9lYWNoKHBhZ2UsICZj
ZC0+cGFnZV9saXN0KQoKQUZBSUNULCB5b3VyIGRvbWFpbiBpcyBub3QgcGF1c2VkLCBzbyBpdCB3
b3VsZCBiZSBwb3NzaWJsZSB0byBoYXZlIHBhZ2UgCmFkZGVkL3JlbW92ZSBpbiB0aGF0IGxpc3Qg
YmVoaW5kIHlvdXIgYmFjay4KCllvdSBhbHNvIGhhdmUgbXVsdGlwbGUgbG9vcCBvbiB0aGUgcGFn
ZV9saXN0IGluIHRoaXMgZnVuY3Rpb24uIEdpdmVuIHRoZSAKbnVtYmVyIG9mIHBhZ2VfbGlzdCBj
YW4gYmUgcXVpdGUgYmlnLCB0aGlzIGlzIGEgY2FsbCBmb3IgaG9nZ2luZyB0aGUgCnBDUFUgYW5k
IGFuIFJDVSBsb2NrIG9uIHRoZSBkb21haW4gdkNQVSBydW5uaW5nIHRoaXMgY2FsbC4KCj4gKyAg
ICB7Cj4gKyAgICAgICAgbWZuX3QgbWZuID0gcGFnZV90b19tZm4ocGFnZSk7Cj4gKyAgICAgICAg
aWYgKCBtZm5fdmFsaWQobWZuKSApCj4gKyAgICAgICAgewo+ICsgICAgICAgICAgICBwMm1fdHlw
ZV90IHAybXQ7Cj4gKyAgICAgICAgICAgIHAybV9hY2Nlc3NfdCBwMm1hOwo+ICsgICAgICAgICAg
ICBnZm5fdCBnZm4gPSBtZm5fdG9fZ2ZuKGNkLCBtZm4pOwo+ICsgICAgICAgICAgICBtZm4gPSBf
X2dldF9nZm5fdHlwZV9hY2Nlc3MocDJtLCBnZm5feChnZm4pLCAmcDJtdCwgJnAybWEsCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAwLCBOVUxMLCBmYWxzZSk7Cj4g
KyAgICAgICAgICAgIGlmICggcDJtX2lzX3JhbShwMm10KSApCj4gKyAgICAgICAgICAgIHsKPiAr
ICAgICAgICAgICAgICAgIHN0cnVjdCBnZm5fZnJlZSAqZ2ZuX2ZyZWU7Cj4gKyAgICAgICAgICAg
ICAgICBpZiAoICFnZXRfcGFnZShwYWdlLCBjZCkgKQo+ICsgICAgICAgICAgICAgICAgICAgIGdv
dG8gZXJyX3Jlc2V0Owo+ICsKPiArICAgICAgICAgICAgICAgIC8qCj4gKyAgICAgICAgICAgICAg
ICAgKiBXZSBjYW4ndCBmcmVlIHRoZSBwYWdlIHdoaWxlIGl0ZXJhdGluZyBvdmVyIHRoZSBwYWdl
X2xpc3QKPiArICAgICAgICAgICAgICAgICAqIHNvIHdlIGJ1aWxkIGEgc2VwYXJhdGUgbGlzdCB0
byBsb29wIG92ZXIuCj4gKyAgICAgICAgICAgICAgICAgKgo+ICsgICAgICAgICAgICAgICAgICog
V2Ugd2FudCB0byBpdGVyYXRlIG92ZXIgdGhlIHBhZ2VfbGlzdCBpbnN0ZWFkIG9mIGNoZWNraW5n
Cj4gKyAgICAgICAgICAgICAgICAgKiBnZm4gZnJvbSAwIHRvIG1heF9nZm4gYmVjYXVzZSB0aGlz
IGlzIH4xMHggZmFzdGVyLgo+ICsgICAgICAgICAgICAgICAgICovCj4gKyAgICAgICAgICAgICAg
ICBnZm5fZnJlZSA9IHhtYWxsb2Moc3RydWN0IGdmbl9mcmVlKTsKCklmIEkgZGlkIHRoZSBtYXRo
IHJpZ2h0LCBmb3IgYSA0RyBndWVzdCB0aGlzIHdpbGwgcmVxdWlyZSBhdCB+MjRNQiBvZiAKbWVt
b3J5LiBBY3R1YWxseSwgaXMgaXQgcmVhbGx5IG5lY2Vzc2FyeSB0byBkbyB0aGUgYWxsb2NhdGlv
biBmb3IgYSAKc2hvcnQgcGVyaW9kIG9mIHRpbWU/CgpXaGF0IGFyZSB5b3UgdHJ5aW5nIHRvIGFj
aGlldmUgYnkgaXRlcmF0aW5nIHR3aWNlIG9uIHRoZSBHRk4/IFdvdWxkbid0IAppdCBiZSBlYXNp
ZXIgdG8gcGF1c2UgdGhlIGRvbWFpbj8KCj4gKyAgICAgICAgICAgICAgICBpZiAoICFnZm5fZnJl
ZSApCj4gKyAgICAgICAgICAgICAgICAgICAgZ290byBlcnJfcmVzZXQ7Cj4gKwo+ICsgICAgICAg
ICAgICAgICAgZ2ZuX2ZyZWUtPmdmbiA9IGdmbjsKPiArICAgICAgICAgICAgICAgIGdmbl9mcmVl
LT5wYWdlID0gcGFnZTsKPiArICAgICAgICAgICAgICAgIGdmbl9mcmVlLT5uZXh0ID0gbGlzdDsK
PiArICAgICAgICAgICAgICAgIGxpc3QgPSBnZm5fZnJlZTsKPiArICAgICAgICAgICAgfQo+ICsg
ICAgICAgIH0KPiArICAgIH0KPiArCj4gKyAgICB3aGlsZSAoIGxpc3QgKQo+ICsgICAgewo+ICsg
ICAgICAgIHN0cnVjdCBnZm5fZnJlZSAqbmV4dCA9IGxpc3QtPm5leHQ7Cj4gKwo+ICsgICAgICAg
IHJjID0gcDJtLT5zZXRfZW50cnkocDJtLCBsaXN0LT5nZm4sIElOVkFMSURfTUZOLCBQQUdFX09S
REVSXzRLLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgcDJtX2ludmFsaWQsIHAybV9h
Y2Nlc3Nfcnd4LCAtMSk7Cj4gKyAgICAgICAgcHV0X3BhZ2VfYWxsb2NfcmVmKGxpc3QtPnBhZ2Up
Owo+ICsgICAgICAgIHB1dF9wYWdlKGxpc3QtPnBhZ2UpOwo+ICsKPiArICAgICAgICB4ZnJlZShs
aXN0KTsKPiArICAgICAgICBsaXN0ID0gbmV4dDsKPiArCj4gKyAgICAgICAgQVNTRVJUKCFyYyk7
Cj4gKyAgICB9Cj4gKwo+ICsgICAgaWYgKCAocmMgPSBmb3JrX2h2bShkLCBjZCkpICkKPiArICAg
ICAgICByZXR1cm4gcmM7Cj4gKwo+ICsgZXJyX3Jlc2V0Ogo+ICsgICAgd2hpbGUgKCBsaXN0ICkK
PiArICAgIHsKPiArICAgICAgICBzdHJ1Y3QgZ2ZuX2ZyZWUgKm5leHQgPSBsaXN0LT5uZXh0Owo+
ICsKPiArICAgICAgICBwdXRfcGFnZShsaXN0LT5wYWdlKTsKPiArICAgICAgICB4ZnJlZShsaXN0
KTsKPiArICAgICAgICBsaXN0ID0gbmV4dDsKPiArICAgIH0KPiArCj4gKyAgICByZXR1cm4gMDsK
PiArfQo+ICsKCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
