Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62319A05E4
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2019 17:15:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2zcl-0002tS-DN; Wed, 28 Aug 2019 15:12:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=uWOn=WY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i2zck-0002tN-2T
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2019 15:12:38 +0000
X-Inumbo-ID: 446a172a-c9a6-11e9-ae48-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 446a172a-c9a6-11e9-ae48-12813bfff9fa;
 Wed, 28 Aug 2019 15:12:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 69941AE00;
 Wed, 28 Aug 2019 15:12:35 +0000 (UTC)
To: Chao Gao <chao.gao@intel.com>
References: <1566177928-19114-1-git-send-email-chao.gao@intel.com>
 <1566177928-19114-2-git-send-email-chao.gao@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <af707ba6-c606-0ec1-97aa-bb8f8bbdac3b@suse.com>
Date: Wed, 28 Aug 2019 17:12:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1566177928-19114-2-git-send-email-chao.gao@intel.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v9 01/15] microcode/intel: extend
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
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Ashok Raj <ashok.raj@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDguMjAxOSAwMzoyNSwgQ2hhbyBHYW8gd3JvdGU6Cj4gdG8gYSBtb3JlIGdlbmVyaWMg
ZnVuY3Rpb24uIFNvIHRoYXQgaXQgY2FuIGJlIHVzZWQgYWxvbmUgdG8gY2hlY2sKPiBhbiB1cGRh
dGUgYWdhaW5zdCB0aGUgQ1BVIHNpZ25hdHVyZSBhbmQgY3VycmVudCB1cGRhdGUgcmV2aXNpb24u
Cj4gCj4gTm90ZSB0aGF0IGVudW0gbWljcm9jb2RlX21hdGNoX3Jlc3VsdCB3aWxsIGJlIHVzZWQg
aW4gY29tbW9uIGNvZGUKPiAoYWthIG1pY3JvY29kZS5jKSwgaXQgaGFzIGJlZW4gcGxhY2VkIGlu
IHRoZSBjb21tb24gaGVhZGVyLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENoYW8gR2FvIDxjaGFvLmdh
b0BpbnRlbC5jb20+Cj4gUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPgo+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
CgpJIGRvbid0IHRoaW5rIHRoZXNlIGNhbiBiZSBsZWdpdGltYXRlbHkgcmV0YWluZWQgd2l0aCAu
Li4KCj4gQ2hhbmdlcyBpbiB2OToKPiAgLSBtaWNyb2NvZGVfdXBkYXRlX21hdGNoKCkgZG9lc24n
dCBhY2NlcHQgKHNpZywgcGYsIHJldikgYW55IGxvbmdlci4KPiAgSGVuY2UsIGl0IHdvbid0IGJl
IHVzZWQgdG8gY29tcGFyZSB0d28gYXJiaXRyYXJ5IHVwZGF0ZXMuCgouLi4gdGhpcyBraW5kIG9m
IGEgY2hhbmdlLgoKPiAtLS0gYS94ZW4vYXJjaC94ODYvbWljcm9jb2RlX2ludGVsLmMKPiArKysg
Yi94ZW4vYXJjaC94ODYvbWljcm9jb2RlX2ludGVsLmMKPiBAQCAtMTM0LDE0ICsxMzQsMzkgQEAg
c3RhdGljIGludCBjb2xsZWN0X2NwdV9pbmZvKHVuc2lnbmVkIGludCBjcHVfbnVtLCBzdHJ1Y3Qg
Y3B1X3NpZ25hdHVyZSAqY3NpZykKPiAgICAgIHJldHVybiAwOwo+ICB9Cj4gIAo+IC1zdGF0aWMg
aW5saW5lIGludCBtaWNyb2NvZGVfdXBkYXRlX21hdGNoKAo+IC0gICAgdW5zaWduZWQgaW50IGNw
dV9udW0sIGNvbnN0IHN0cnVjdCBtaWNyb2NvZGVfaGVhZGVyX2ludGVsICptY19oZWFkZXIsCj4g
LSAgICBpbnQgc2lnLCBpbnQgcGYpCj4gKy8qIENoZWNrIGFuIHVwZGF0ZSBhZ2FpbnN0IHRoZSBD
UFUgc2lnbmF0dXJlIGFuZCBjdXJyZW50IHVwZGF0ZSByZXZpc2lvbiAqLwo+ICtzdGF0aWMgZW51
bSBtaWNyb2NvZGVfbWF0Y2hfcmVzdWx0IG1pY3JvY29kZV91cGRhdGVfbWF0Y2goCj4gKyAgICBj
b25zdCBzdHJ1Y3QgbWljcm9jb2RlX2hlYWRlcl9pbnRlbCAqbWNfaGVhZGVyLCB1bnNpZ25lZCBp
bnQgY3B1KQo+ICB7Cj4gLSAgICBzdHJ1Y3QgdWNvZGVfY3B1X2luZm8gKnVjaSA9ICZwZXJfY3B1
KHVjb2RlX2NwdV9pbmZvLCBjcHVfbnVtKTsKPiAtCj4gLSAgICByZXR1cm4gKHNpZ21hdGNoKHNp
ZywgdWNpLT5jcHVfc2lnLnNpZywgcGYsIHVjaS0+Y3B1X3NpZy5wZikgJiYKPiAtICAgICAgICAg
ICAgKG1jX2hlYWRlci0+cmV2ID4gdWNpLT5jcHVfc2lnLnJldikpOwo+ICsgICAgY29uc3Qgc3Ry
dWN0IGV4dGVuZGVkX3NpZ3RhYmxlICpleHRfaGVhZGVyOwo+ICsgICAgY29uc3Qgc3RydWN0IGV4
dGVuZGVkX3NpZ25hdHVyZSAqZXh0X3NpZzsKPiArICAgIHVuc2lnbmVkIGludCBpOwo+ICsgICAg
c3RydWN0IHVjb2RlX2NwdV9pbmZvICp1Y2kgPSAmcGVyX2NwdSh1Y29kZV9jcHVfaW5mbywgY3B1
KTsKPiArICAgIHVuc2lnbmVkIGludCBzaWcgPSB1Y2ktPmNwdV9zaWcuc2lnOwo+ICsgICAgdW5z
aWduZWQgaW50IHBmID0gdWNpLT5jcHVfc2lnLnBmOwo+ICsgICAgdW5zaWduZWQgaW50IHJldiA9
IHVjaS0+Y3B1X3NpZy5yZXY7Cj4gKyAgICB1bnNpZ25lZCBsb25nIGRhdGFfc2l6ZSA9IGdldF9k
YXRhc2l6ZShtY19oZWFkZXIpOwo+ICsgICAgY29uc3Qgdm9pZCAqZW5kID0gKGNvbnN0IHZvaWQg
KiltY19oZWFkZXIgKyBnZXRfdG90YWxzaXplKG1jX2hlYWRlcik7Cj4gKwo+ICsgICAgaWYgKCBz
aWdtYXRjaChzaWcsIG1jX2hlYWRlci0+c2lnLCBwZiwgbWNfaGVhZGVyLT5wZikgKQo+ICsgICAg
ICAgIHJldHVybiAobWNfaGVhZGVyLT5yZXYgPiByZXYpID8gTkVXX1VDT0RFIDogT0xEX1VDT0RF
OwoKRGlkbid0IHlvdSBsb3NlIGEgcmFuZ2UgY2hlY2sgYWdhaW5zdCAiZW5kIiBhaGVhZCBvZiB0
aGlzIGlmKCk/CmdldF90b3RhbHNpemUoKSBhbmQgZ2V0X2RhdGFzaXplKCkgYWl1aSBhbHNvIHdv
dWxkIG5lZWQgdG8gbGl2ZQphZnRlciBhIHJhbmdlIGNoZWNrLCBqdXN0IGEgc2l6ZW9mKCkgKGku
ZS4gTUNfSEVBREVSX1NJWkUpIGJhc2VkCm9uZS4gVGhpcyB3b3VsZCBhbHNvIGFmZmVjdCB0aGUg
Y2FsbGVyIGFzIGl0IHNlZW1zLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
