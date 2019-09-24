Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 196DBBCA93
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 16:48:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCm4r-0002GO-IR; Tue, 24 Sep 2019 14:46:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=MVCM=XT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iCm4p-0002Fz-Jm
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 14:46:03 +0000
X-Inumbo-ID: 07c0dcde-deda-11e9-961f-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 07c0dcde-deda-11e9-961f-12813bfff9fa;
 Tue, 24 Sep 2019 14:46:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4BDA3B05C;
 Tue, 24 Sep 2019 14:46:02 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-32-jgross@suse.com>
 <05069a81-3e6c-50d4-148c-1b41e7f66628@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <20eacbb6-ab5b-0780-9395-e9c9cdfdb42d@suse.com>
Date: Tue, 24 Sep 2019 16:46:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <05069a81-3e6c-50d4-148c-1b41e7f66628@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 31/47] xen/sched: modify
 cpupool_domain_cpumask() to be an unit mask
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMDkuMTkgMTc6NTAsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDE0LjA5LjIwMTkgMTA6
NTIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IC0tLSBhL3hlbi9jb21tb24vY3B1cG9vbC5jCj4+
ICsrKyBiL3hlbi9jb21tb24vY3B1cG9vbC5jCj4+IEBAIC0zNiwyNiArMzYsMzUgQEAgc3RhdGlj
IERFRklORV9TUElOTE9DSyhjcHVwb29sX2xvY2spOwo+PiAgIAo+PiAgIERFRklORV9QRVJfQ1BV
KHN0cnVjdCBjcHVwb29sICosIGNwdXBvb2wpOwo+PiAgIAo+PiArc3RhdGljIHZvaWQgZnJlZV9j
cHVwb29sX3N0cnVjdChzdHJ1Y3QgY3B1cG9vbCAqYykKPj4gK3sKPj4gKyAgICBpZiAoIGMgKQo+
PiArICAgIHsKPj4gKyAgICAgICAgZnJlZV9jcHVtYXNrX3ZhcihjLT5yZXNfdmFsaWQpOwo+PiAr
ICAgICAgICBmcmVlX2NwdW1hc2tfdmFyKGMtPmNwdV92YWxpZCk7Cj4+ICsgICAgfQo+PiArICAg
IHhmcmVlKGMpOwo+PiArfQo+PiArCj4+ICAgc3RhdGljIHN0cnVjdCBjcHVwb29sICphbGxvY19j
cHVwb29sX3N0cnVjdCh2b2lkKQo+PiAgIHsKPj4gICAgICAgc3RydWN0IGNwdXBvb2wgKmMgPSB4
emFsbG9jKHN0cnVjdCBjcHVwb29sKTsKPj4gICAKPj4gLSAgICBpZiAoICFjIHx8ICF6YWxsb2Nf
Y3B1bWFza192YXIoJmMtPmNwdV92YWxpZCkgKQo+PiArICAgIGlmICggIWMgKQo+PiArICAgICAg
ICByZXR1cm4gTlVMTDsKPj4gKwo+PiArICAgIHphbGxvY19jcHVtYXNrX3ZhcigmYy0+Y3B1X3Zh
bGlkKTsKPj4gKyAgICB6YWxsb2NfY3B1bWFza192YXIoJmMtPnJlc192YWxpZCk7Cj4+ICsKPj4g
KyAgICBpZiAoICFjLT5jcHVfdmFsaWQgfHwgIWMtPnJlc192YWxpZCApCj4gCj4gSSBndWVzcyBj
b21waWxlcnMgKG9yIG90aGVyIHN0YXRpYyBhbmFseXNpcyB0b29scykgbWF5IHdhcm4gYWJvdXQK
PiB0aGlzIGZvciBOUl9DUFVTIDw9IDIgKiBCSVRTX1BFUl9MT05HIGJ1aWxkcy4gVGhlIGludGVu
dGlvbiByZWFsbHkKPiBpcyBmb3IgeW91IHRvIGNoZWNrIHphbGxvY19jcHVtYXNrX3ZhcigpJ3Mg
cmV0dXJuIHZhbHVlOyBwZXJoYXBzCj4gaXQgc2hvdWxkIGdldCBbaGF2ZSBiZWVuXSBtYXJrZWQg
Il9fbXVzdF9jaGVjayIuCgpPaCwgdGhhbmtzIGZvciBub3RpY2luZy4KCkknbGwgY2hhbmdlIHRo
ZSB1c2FnZS4KCgpKdWVyZ2VuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
