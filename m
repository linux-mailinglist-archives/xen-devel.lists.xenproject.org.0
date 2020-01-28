Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6E814BDE5
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 17:39:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwTrV-00087P-Cz; Tue, 28 Jan 2020 16:37:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iQoc=3R=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iwTrT-00087K-69
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 16:37:11 +0000
X-Inumbo-ID: 6df2ed42-41ec-11ea-ad98-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6df2ed42-41ec-11ea-ad98-bc764e2007e4;
 Tue, 28 Jan 2020 16:37:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B3561B15B;
 Tue, 28 Jan 2020 16:37:09 +0000 (UTC)
To: Tamas K Lengyel <tamas.lengyel@intel.com>
References: <cover.1580148227.git.tamas.lengyel@intel.com>
 <8f7138e4d6a11975ef85458c000a337a60a4e13e.1580148227.git.tamas.lengyel@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0f3cf444-62f1-141c-bb3f-e202f6d9b839@suse.com>
Date: Tue, 28 Jan 2020 17:37:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <8f7138e4d6a11975ef85458c000a337a60a4e13e.1580148227.git.tamas.lengyel@intel.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 1/9] x86/p2m: Allow p2m_get_page_from_gfn
 to return shared entries
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMDEuMjAyMCAxOTowNiwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9tbS9wMm0uYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYwo+IEBAIC01NzQs
MTEgKzU3NCwxMiBAQCBzdHJ1Y3QgcGFnZV9pbmZvICpwMm1fZ2V0X3BhZ2VfZnJvbV9nZm4oCj4g
ICAgICAgICAgICAgICAgICBpZiAoIGZkb20gPT0gTlVMTCApCj4gICAgICAgICAgICAgICAgICAg
ICAgcGFnZSA9IE5VTEw7Cj4gICAgICAgICAgICAgIH0KPiAtICAgICAgICAgICAgZWxzZSBpZiAo
ICFnZXRfcGFnZShwYWdlLCBwMm0tPmRvbWFpbikgJiYKPiAtICAgICAgICAgICAgICAgICAgICAg
IC8qIFBhZ2UgY291bGQgYmUgc2hhcmVkICovCj4gLSAgICAgICAgICAgICAgICAgICAgICAoIWRv
bV9jb3cgfHwgIXAybV9pc19zaGFyZWQoKnQpIHx8Cj4gLSAgICAgICAgICAgICAgICAgICAgICAg
IWdldF9wYWdlKHBhZ2UsIGRvbV9jb3cpKSApCj4gLSAgICAgICAgICAgICAgICBwYWdlID0gTlVM
TDsKPiArICAgICAgICAgICAgZWxzZQo+ICsgICAgICAgICAgICB7Cj4gKyAgICAgICAgICAgICAg
ICBzdHJ1Y3QgZG9tYWluICpkID0gIXAybV9pc19zaGFyZWQoKnQpID8gcDJtLT5kb21haW4gOiBk
b21fY293Owo+ICsgICAgICAgICAgICAgICAgaWYgKCAhZ2V0X3BhZ2UocGFnZSwgZCkgKQo+ICsg
ICAgICAgICAgICAgICAgICAgIHBhZ2UgPSBOVUxMOwo+ICsgICAgICAgICAgICB9Cj4gICAgICAg
ICAgfQo+ICAgICAgICAgIHAybV9yZWFkX3VubG9jayhwMm0pOwo+ICAKPiBAQCAtNTk0LDggKzU5
NSw5IEBAIHN0cnVjdCBwYWdlX2luZm8gKnAybV9nZXRfcGFnZV9mcm9tX2dmbigKPiAgICAgIG1m
biA9IGdldF9nZm5fdHlwZV9hY2Nlc3MocDJtLCBnZm5feChnZm4pLCB0LCBhLCBxLCBOVUxMKTsK
PiAgICAgIGlmICggcDJtX2lzX3JhbSgqdCkgJiYgbWZuX3ZhbGlkKG1mbikgKQo+ICAgICAgewo+
ICsgICAgICAgIHN0cnVjdCBkb21haW4gKmQgPSAhcDJtX2lzX3NoYXJlZCgqdCkgPyBwMm0tPmRv
bWFpbiA6IGRvbV9jb3c7Cj4gICAgICAgICAgcGFnZSA9IG1mbl90b19wYWdlKG1mbik7Cj4gLSAg
ICAgICAgaWYgKCAhZ2V0X3BhZ2UocGFnZSwgcDJtLT5kb21haW4pICkKPiArICAgICAgICBpZiAo
ICFnZXRfcGFnZShwYWdlLCBkKSApCj4gICAgICAgICAgICAgIHBhZ2UgPSBOVUxMOwo+ICAgICAg
fQo+ICAgICAgcHV0X2dmbihwMm0tPmRvbWFpbiwgZ2ZuX3goZ2ZuKSk7CgpQZXJzb25hbGx5IEkg
d291bGQgaGF2ZSBwcmVmZXJyZWQgdG8gZ28gd2l0aG91dCBuZXcgbG9jYWwgdmFyaWFibGVzCmhl
cmUsIGJ1dCBJJ20gbm90IHRoZSBtYWludGFpbmVyIG9mIHRoaXMgY29kZS4gSG93ZXZlciwgYXQg
dGhlIHZlcnkKbGVhc3QgYmxhbmsgbGluZXMgd291bGQgbmVlZCBpbnNlcnRpbmcgYmV0d2VlbiBk
ZWNsYXJhdGlvbiBhbmQKc3RhdGVtZW50cy4gV2l0aCBhdCBsZWFzdCB0aGlzIGRvbmUgKHdoaWNo
IGNvdWxkIGJlIGRvbmUgd2hpbGUKY29tbWl0dGluZykKClJldmlld2VkLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+CgpBcyBhbiBhc2lkZSwgSSBkb24ndCB0aGluayB0aGUgdGl0
bGUgYWNjdXJhdGVseSBkZXNjcmliZXMgdGhlCmNoYW5nZSwgc2luY2UgdGhlcmUncyBqdXN0IG9u
ZSBvdXQgb2YgdHdvIGNhc2VzIHdoaWNoIHNoYXJlZAplbnRyaWVzIHdlcmVuJ3QgdGFrZW4gY2Fy
ZSBvZi4gU2ltaWxhcmx5IHRoZSBkZXNjcmlwdGlvbiBkb2Vzbid0CnJlZmxlY3QgdGhpcyBhdCBh
bGwuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
