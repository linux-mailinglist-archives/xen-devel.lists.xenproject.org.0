Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3598A063A
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2019 17:24:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2zlW-0003hY-7D; Wed, 28 Aug 2019 15:21:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=uWOn=WY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i2zlU-0003hT-Hv
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2019 15:21:40 +0000
X-Inumbo-ID: 87bb1064-c9a7-11e9-b95f-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 87bb1064-c9a7-11e9-b95f-bc764e2007e4;
 Wed, 28 Aug 2019 15:21:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1A5BAAE00;
 Wed, 28 Aug 2019 15:21:38 +0000 (UTC)
To: Chao Gao <chao.gao@intel.com>
References: <1566177928-19114-1-git-send-email-chao.gao@intel.com>
 <1566177928-19114-5-git-send-email-chao.gao@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <40a73b16-495a-0bc0-00fc-6bc893fb885f@suse.com>
Date: Wed, 28 Aug 2019 17:21:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1566177928-19114-5-git-send-email-chao.gao@intel.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v9 04/15] microcode: introduce a global
 cache of ucode patch
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

T24gMTkuMDguMjAxOSAwMzoyNSwgQ2hhbyBHYW8gd3JvdGU6Cj4gKy8qIFJldHVybiB0cnVlIGlm
IGNhY2hlIGdldHMgdXBkYXRlZC4gT3RoZXJ3aXNlLCByZXR1cm4gZmFsc2UgKi8KPiArYm9vbCBt
aWNyb2NvZGVfdXBkYXRlX2NhY2hlKHN0cnVjdCBtaWNyb2NvZGVfcGF0Y2ggKnBhdGNoKQo+ICt7
Cj4gKwo+ICsgICAgQVNTRVJUKHNwaW5faXNfbG9ja2VkKCZtaWNyb2NvZGVfbXV0ZXgpKTsKClN0
cmF5IGJsYW5rIGxpbmUgYWhlYWQgb2YgdGhpcyBvbmUuCgo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9t
aWNyb2NvZGVfaW50ZWwuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9taWNyb2NvZGVfaW50ZWwuYwo+
IEBAIC0yNTksNiArMjU5LDMxIEBAIHN0YXRpYyBpbnQgbWljcm9jb2RlX3Nhbml0eV9jaGVjayh2
b2lkICptYykKPiAgICAgIHJldHVybiAwOwo+ICB9Cj4gIAo+ICtzdGF0aWMgYm9vbCBtYXRjaF9j
cHUoY29uc3Qgc3RydWN0IG1pY3JvY29kZV9wYXRjaCAqcGF0Y2gpCj4gK3sKPiArICAgIGlmICgg
IXBhdGNoICkKPiArICAgICAgICByZXR1cm4gZmFsc2U7Cj4gKwo+ICsgICAgcmV0dXJuIG1pY3Jv
Y29kZV91cGRhdGVfbWF0Y2goJnBhdGNoLT5tY19pbnRlbC0+aGRyLAo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgc21wX3Byb2Nlc3Nvcl9pZCgpKSA9PSBORVdfVUNPREU7Cj4g
K30KPiArCj4gK3N0YXRpYyB2b2lkIGZyZWVfcGF0Y2godm9pZCAqbWMpCj4gK3sKPiArICAgIHhm
cmVlKG1jKTsKPiArfQo+ICsKPiArLyoKPiArICogQm90aCBwYXRjaGVzIHRvIGNvbXBhcmUgYXJl
IHN1cHBvc2VkIHRvIGJlIGFwcGxpY2FibGUgdG8gbG9jYWwgQ1BVLgo+ICsgKiBKdXN0IGNvbXBh
cmUgdGhlIHJldmlzaW9uIG51bWJlci4KPiArICovCj4gK3N0YXRpYyBlbnVtIG1pY3JvY29kZV9t
YXRjaF9yZXN1bHQgY29tcGFyZV9wYXRjaCgKPiArICAgIGNvbnN0IHN0cnVjdCBtaWNyb2NvZGVf
cGF0Y2ggKm5ldywgY29uc3Qgc3RydWN0IG1pY3JvY29kZV9wYXRjaCAqb2xkKQo+ICt7Cj4gKyAg
ICByZXR1cm4gKG5ldy0+bWNfaW50ZWwtPmhkci5yZXYgPiBvbGQtPm1jX2ludGVsLT5oZHIucmV2
KSA/ICBORVdfVUNPREUgOgo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgT0xEX1VDT0RFOwo+ICt9CgpUaGUgY29tbWVudCBh
aGVhZCBvZiB0aGUgZnVuY3Rpb24gaXMgbmljZSwgYnV0IHBsZWFzZSBtb3ZlIGl0Cmluc2lkZSB0
aGUgZnVuY3Rpb24gYW5kIGFjY29tcGFueSBpdCBieSBBU1NFUlQoKXMgY2hlY2tpbmcgd2hhdAp0
aGUgY29tbWVudCBzYXlzLgoKPiBAQCAtMTksNiArMjcsMTEgQEAgc3RydWN0IG1pY3JvY29kZV9v
cHMgewo+ICAgICAgaW50ICgqY29sbGVjdF9jcHVfaW5mbykodW5zaWduZWQgaW50IGNwdSwgc3Ry
dWN0IGNwdV9zaWduYXR1cmUgKmNzaWcpOwo+ICAgICAgaW50ICgqYXBwbHlfbWljcm9jb2RlKSh1
bnNpZ25lZCBpbnQgY3B1KTsKPiAgICAgIGludCAoKnN0YXJ0X3VwZGF0ZSkodm9pZCk7Cj4gKyAg
ICB2b2lkICgqZnJlZV9wYXRjaCkodm9pZCAqbWMpOwo+ICsgICAgYm9vbCAoKm1hdGNoX2NwdSko
Y29uc3Qgc3RydWN0IG1pY3JvY29kZV9wYXRjaCAqcGF0Y2gpOwo+ICsgICAgZW51bSBtaWNyb2Nv
ZGVfbWF0Y2hfcmVzdWx0ICgqY29tcGFyZV9wYXRjaCkoCj4gKyAgICAgICAgICAgIGNvbnN0IHN0
cnVjdCBtaWNyb2NvZGVfcGF0Y2ggKm5ldywKPiArICAgICAgICAgICAgY29uc3Qgc3RydWN0IG1p
Y3JvY29kZV9wYXRjaCAqb2xkKTsKCkknbSBhZnJhaWQgaW5kZW50YXRpb24gaGVyZSBkb2Vzbid0
IHJlYWxseSBtYXRjaCBvdXIgKHNhZGx5IHN0aWxsCnVud3JpdHRlbikgY29udmVudGlvbnMgLSBp
dCBzaG91bGQgYmUgZm91ciBtb3JlIHNwYWNlcyB0aGFuIHdoYXQKdGhlIHByZXZpb3VzIChpbmNv
bXBsZXRlKSBsaW5lIGhhZC4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
