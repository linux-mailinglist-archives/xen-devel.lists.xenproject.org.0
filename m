Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B41BB187B
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2019 08:54:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8fQ5-0003qW-R2; Fri, 13 Sep 2019 06:51:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=f4Vg=XI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i8fQ4-0003qR-8Q
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2019 06:51:00 +0000
X-Inumbo-ID: d7480932-d5f2-11e9-95a9-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d7480932-d5f2-11e9-95a9-12813bfff9fa;
 Fri, 13 Sep 2019 06:50:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A7F4AAF0D;
 Fri, 13 Sep 2019 06:50:57 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: Chao Gao <chao.gao@intel.com>
References: <1568272949-1086-1-git-send-email-chao.gao@intel.com>
 <1568272949-1086-2-git-send-email-chao.gao@intel.com>
 <eb664aac-8068-be59-39f2-745b5f986307@suse.com>
Message-ID: <401730a1-3a14-8b43-358c-049fea52bce7@suse.com>
Date: Fri, 13 Sep 2019 08:50:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <eb664aac-8068-be59-39f2-745b5f986307@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v10 01/16] microcode/intel: extend
 microcode_update_match()
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Ashok Raj <ashok.raj@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMDkuMjAxOSAxMjoyNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTIuMDkuMjAxOSAw
OToyMiwgQ2hhbyBHYW8gd3JvdGU6Cj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9taWNyb2NvZGVfaW50
ZWwuYwo+PiArKysgYi94ZW4vYXJjaC94ODYvbWljcm9jb2RlX2ludGVsLmMKPj4gQEAgLTEzNCwy
MSArMTM0LDExIEBAIHN0YXRpYyBpbnQgY29sbGVjdF9jcHVfaW5mbyh1bnNpZ25lZCBpbnQgY3B1
X251bSwgc3RydWN0IGNwdV9zaWduYXR1cmUgKmNzaWcpCj4+ICAgICAgcmV0dXJuIDA7Cj4+ICB9
Cj4+ICAKPj4gLXN0YXRpYyBpbmxpbmUgaW50IG1pY3JvY29kZV91cGRhdGVfbWF0Y2goCj4+IC0g
ICAgdW5zaWduZWQgaW50IGNwdV9udW0sIGNvbnN0IHN0cnVjdCBtaWNyb2NvZGVfaGVhZGVyX2lu
dGVsICptY19oZWFkZXIsCj4+IC0gICAgaW50IHNpZywgaW50IHBmKQo+PiArc3RhdGljIGludCBt
aWNyb2NvZGVfc2FuaXR5X2NoZWNrKGNvbnN0IHZvaWQgKm1jKQo+PiAgewo+PiAtICAgIHN0cnVj
dCB1Y29kZV9jcHVfaW5mbyAqdWNpID0gJnBlcl9jcHUodWNvZGVfY3B1X2luZm8sIGNwdV9udW0p
Owo+PiAtCj4+IC0gICAgcmV0dXJuIChzaWdtYXRjaChzaWcsIHVjaS0+Y3B1X3NpZy5zaWcsIHBm
LCB1Y2ktPmNwdV9zaWcucGYpICYmCj4+IC0gICAgICAgICAgICAobWNfaGVhZGVyLT5yZXYgPiB1
Y2ktPmNwdV9zaWcucmV2KSk7Cj4+IC19Cj4+IC0KPj4gLXN0YXRpYyBpbnQgbWljcm9jb2RlX3Nh
bml0eV9jaGVjayh2b2lkICptYykKPj4gLXsKPj4gLSAgICBzdHJ1Y3QgbWljcm9jb2RlX2hlYWRl
cl9pbnRlbCAqbWNfaGVhZGVyID0gbWM7Cj4+IC0gICAgc3RydWN0IGV4dGVuZGVkX3NpZ3RhYmxl
ICpleHRfaGVhZGVyID0gTlVMTDsKPj4gLSAgICBzdHJ1Y3QgZXh0ZW5kZWRfc2lnbmF0dXJlICpl
eHRfc2lnOwo+PiArICAgIGNvbnN0IHN0cnVjdCBtaWNyb2NvZGVfaGVhZGVyX2ludGVsICptY19o
ZWFkZXIgPSBtYzsKPj4gKyAgICBjb25zdCBzdHJ1Y3QgZXh0ZW5kZWRfc2lndGFibGUgKmV4dF9o
ZWFkZXIgPSBOVUxMOwo+PiArICAgIGNvbnN0IHN0cnVjdCBleHRlbmRlZF9zaWduYXR1cmUgKmV4
dF9zaWc7Cj4+ICAgICAgdW5zaWduZWQgbG9uZyB0b3RhbF9zaXplLCBkYXRhX3NpemUsIGV4dF90
YWJsZV9zaXplOwo+PiAgICAgIHVuc2lnbmVkIGludCBleHRfc2lnY291bnQgPSAwLCBpOwo+PiAg
ICAgIHVpbnQzMl90IHN1bSwgb3JpZ19zdW07Cj4+IEBAIC0yMzQsNiArMjI0LDQyIEBAIHN0YXRp
YyBpbnQgbWljcm9jb2RlX3Nhbml0eV9jaGVjayh2b2lkICptYykKPj4gICAgICByZXR1cm4gMDsK
Pj4gIH0KPj4gIAo+PiArLyogQ2hlY2sgYW4gdXBkYXRlIGFnYWluc3QgdGhlIENQVSBzaWduYXR1
cmUgYW5kIGN1cnJlbnQgdXBkYXRlIHJldmlzaW9uICovCj4+ICtzdGF0aWMgZW51bSBtaWNyb2Nv
ZGVfbWF0Y2hfcmVzdWx0IG1pY3JvY29kZV91cGRhdGVfbWF0Y2goCj4+ICsgICAgY29uc3Qgc3Ry
dWN0IG1pY3JvY29kZV9oZWFkZXJfaW50ZWwgKm1jX2hlYWRlciwgdW5zaWduZWQgaW50IGNwdSkK
Pj4gK3sKPj4gKyAgICBjb25zdCBzdHJ1Y3QgZXh0ZW5kZWRfc2lndGFibGUgKmV4dF9oZWFkZXI7
Cj4+ICsgICAgY29uc3Qgc3RydWN0IGV4dGVuZGVkX3NpZ25hdHVyZSAqZXh0X3NpZzsKPj4gKyAg
ICB1bnNpZ25lZCBpbnQgaTsKPj4gKyAgICBzdHJ1Y3QgdWNvZGVfY3B1X2luZm8gKnVjaSA9ICZw
ZXJfY3B1KHVjb2RlX2NwdV9pbmZvLCBjcHUpOwo+PiArICAgIHVuc2lnbmVkIGludCBzaWcgPSB1
Y2ktPmNwdV9zaWcuc2lnOwo+PiArICAgIHVuc2lnbmVkIGludCBwZiA9IHVjaS0+Y3B1X3NpZy5w
ZjsKPj4gKyAgICB1bnNpZ25lZCBpbnQgcmV2ID0gdWNpLT5jcHVfc2lnLnJldjsKPj4gKyAgICB1
bnNpZ25lZCBsb25nIGRhdGFfc2l6ZSA9IGdldF9kYXRhc2l6ZShtY19oZWFkZXIpOwo+PiArICAg
IGNvbnN0IHZvaWQgKmVuZCA9IChjb25zdCB2b2lkICopbWNfaGVhZGVyICsgZ2V0X3RvdGFsc2l6
ZShtY19oZWFkZXIpOwo+PiArCj4+ICsgICAgQVNTRVJUKCFtaWNyb2NvZGVfc2FuaXR5X2NoZWNr
KG1jX2hlYWRlcikpOwo+PiArICAgIGlmICggc2lnbWF0Y2goc2lnLCBtY19oZWFkZXItPnNpZywg
cGYsIG1jX2hlYWRlci0+cGYpICkKPj4gKyAgICAgICAgcmV0dXJuIChtY19oZWFkZXItPnJldiA+
IHJldikgPyBORVdfVUNPREUgOiBPTERfVUNPREU7Cj4+ICsKPj4gKyAgICBleHRfaGVhZGVyID0g
KGNvbnN0IHZvaWQgKikobWNfaGVhZGVyICsgMSkgKyBkYXRhX3NpemU7Cj4+ICsgICAgZXh0X3Np
ZyA9IChjb25zdCB2b2lkICopKGV4dF9oZWFkZXIgKyAxKTsKPj4gKwo+PiArICAgIC8qCj4+ICsg
ICAgICogTWFrZSBzdXJlIHRoZXJlIGlzIGVub3VnaCBzcGFjZSB0byBob2xkIGFuIGV4dGVuZGVk
IGhlYWRlciBhbmQgZW5vdWdoCj4+ICsgICAgICogYXJyYXkgZWxlbWVudHMuCj4+ICsgICAgICov
Cj4+ICsgICAgaWYgKCAoZW5kIDwgKGNvbnN0IHZvaWQgKilleHRfc2lnKSB8fAo+PiArICAgICAg
ICAgKGVuZCA8IChjb25zdCB2b2lkICopKGV4dF9zaWcgKyBleHRfaGVhZGVyLT5jb3VudCkpICkK
Pj4gKyAgICAgICAgcmV0dXJuIE1JU19VQ09ERTsKPiAKPiBXaXRoIHlvdSBub3cgYXNzdW1pbmcg
dGhhdCB0aGUgYmxvYiBoYXMgcHJldmlvdXNseSBwYXNzZWQKPiBtaWNyb2NvZGVfc2FuaXR5X2No
ZWNrKCksIHRoaXMgb25seSBuZWVkcyB0byBiZQo+IAo+ICAgICBpZiAoIChlbmQgPD0gKGNvbnN0
IHZvaWQgKilleHRfc2lnKSApCj4gICAgICAgICByZXR1cm4gTUlTX1VDT0RFOwo+IAo+IG5vdyBh
ZmFpY3QuCj4gCj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4K
PiBwcmVmZXJhYmx5IHdpdGggdGhpcyBhZGp1c3RtZW50IChhc3N1bWluZyB5b3UgYWdyZWUpLgoK
RkFPRDogSSdkIGJlIGhhcHB5IHRvIG1ha2UgdGhlIGFkanVzdG1lbnQgd2hpbGUgY29tbWl0dGlu
ZywgYnV0CkknZCBsaWtlIHRvIGhhdmUgeW91ciBjb25zZW50IChvciB5b3UgcHJvdmluZyBtZSB3
cm9uZykuIFRoaXMKd291bGQsIGFzIGl0IGxvb2tzLCBhbGxvdyBldmVyeXRoaW5nIHVwIHRvIHBh
dGNoIDggdG8gZ28gaW4uCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
