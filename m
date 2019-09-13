Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB00CB1AB9
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2019 11:26:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8hnC-0000I4-3S; Fri, 13 Sep 2019 09:23:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=f4Vg=XI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i8hnA-0000Hz-1Z
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2019 09:23:00 +0000
X-Inumbo-ID: 1362e288-d608-11e9-978d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1362e288-d608-11e9-978d-bc764e2007e4;
 Fri, 13 Sep 2019 09:22:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id F043BAE3A;
 Fri, 13 Sep 2019 09:22:57 +0000 (UTC)
To: Chao Gao <chao.gao@intel.com>
References: <1568272949-1086-1-git-send-email-chao.gao@intel.com>
 <1568272949-1086-16-git-send-email-chao.gao@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f5d22eed-42c0-5d99-7adc-a46ac52a9639@suse.com>
Date: Fri, 13 Sep 2019 11:22:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1568272949-1086-16-git-send-email-chao.gao@intel.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v10 15/16] microcode: disable late loading
 if CPUs are affected by BDF90
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

T24gMTIuMDkuMjAxOSAwOToyMiwgQ2hhbyBHYW8gd3JvdGU6Cj4gQEAgLTI4Myw2ICsyODQsMjcg
QEAgc3RhdGljIGVudW0gbWljcm9jb2RlX21hdGNoX3Jlc3VsdCBjb21wYXJlX3BhdGNoKAo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgOiBPTERfVUNPREU7Cj4gIH0KPiAgCj4gK3N0YXRpYyBib29sIGlzX2JsYWNrbGlzdGVkKHZv
aWQpCj4gK3sKPiArICAgIHN0cnVjdCBjcHVpbmZvX3g4NiAqYyA9ICZjdXJyZW50X2NwdV9kYXRh
Owo+ICsgICAgdWludDY0X3QgbGxjX3NpemUgPSBjLT54ODZfY2FjaGVfc2l6ZSAqIDEwMjRVTEw7
Cj4gKyAgICBzdHJ1Y3QgY3B1X3NpZ25hdHVyZSAqc2lnID0gJnRoaXNfY3B1KGNwdV9zaWcpOwo+
ICsKPiArICAgIGRvX2RpdihsbGNfc2l6ZSwgYy0+eDg2X21heF9jb3Jlcyk7Cj4gKwo+ICsgICAg
LyoKPiArICAgICAqIExhdGUgbG9hZGluZyBvbiBtb2RlbCA3OSB3aXRoIG1pY3JvY29kZSByZXZp
c2lvbiBsZXNzIHRoYW4gMHgwYjAwMDAyMQo+ICsgICAgICogYW5kIExMQyBzaXplIHBlciBjb3Jl
IGJpZ2dlciB0aGFuIDIuNU1CIG1heSByZXN1bHQgaW4gYSBzeXN0ZW0gaGFuZy4KPiArICAgICAq
IFRoaXMgYmVoYXZpb3IgaXMgZG9jdW1lbnRlZCBpbiBpdGVtIEJERjkwLCAjMzM0MTY1IChJbnRl
bCBYZW9uCj4gKyAgICAgKiBQcm9jZXNzb3IgRTctODgwMC80ODAwIHY0IFByb2R1Y3QgRmFtaWx5
KS4KPiArICAgICAqLwo+ICsgICAgaWYgKCBjLT54ODYgPT0gNiAmJiBjLT54ODZfbW9kZWwgPT0g
MHg0RiAmJiBjLT54ODZfbWFzayA9PSAweDEgJiYKPiArICAgICAgICAgbGxjX3NpemUgPiAyNjIx
NDQwICYmIHNpZy0+cmV2IDwgMHgwYjAwMDAyMSApCj4gKyAgICAgICAgcmV0dXJuIHRydWU7Cj4g
Kwo+ICsgICAgcmV0dXJuIGZhbHNlOwo+ICt9CgpJc24ndCB0aGlzIG1pc2JlaGF2aW9yIHdvcmtl
ZCBhcm91bmQgYnkgdGhlIHdiaW52ZCgpIHlvdSBhZGQgaW4gdGhlIG5leHQKcGF0Y2g/Cgo+IC0t
LSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvbWljcm9jb2RlLmgKPiArKysgYi94ZW4vaW5jbHVkZS9h
c20teDg2L21pY3JvY29kZS5oCj4gQEAgLTMwLDYgKzMwLDcgQEAgc3RydWN0IG1pY3JvY29kZV9v
cHMgewo+ICAgICAgYm9vbCAoKm1hdGNoX2NwdSkoY29uc3Qgc3RydWN0IG1pY3JvY29kZV9wYXRj
aCAqcGF0Y2gpOwo+ICAgICAgZW51bSBtaWNyb2NvZGVfbWF0Y2hfcmVzdWx0ICgqY29tcGFyZV9w
YXRjaCkoCj4gICAgICAgICAgY29uc3Qgc3RydWN0IG1pY3JvY29kZV9wYXRjaCAqbmV3LCBjb25z
dCBzdHJ1Y3QgbWljcm9jb2RlX3BhdGNoICpvbGQpOwo+ICsgICAgYm9vbCAoKmlzX2JsYWNrbGlz
dGVkKSh2b2lkKTsKCldoeSBhIGhvb2sgcmF0aGVyIHRoYW4gYSBib29sZWFuIGZsYWcsIHdoaWNo
IGNvdWxkIGJlIHNldCBieQptaWNyb2NvZGVfdXBkYXRlX29uZSgpIChhcyBpbnZva2VkIGR1cmlu
ZyBBUCBicmluZ3VwKT8KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
