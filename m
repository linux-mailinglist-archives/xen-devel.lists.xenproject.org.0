Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CF711B97D
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2019 18:01:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1if5JU-0001zL-KI; Wed, 11 Dec 2019 16:58:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bHGM=2B=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1if5JT-0001zF-TB
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2019 16:58:11 +0000
X-Inumbo-ID: 6996c140-1c37-11ea-8ba6-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6996c140-1c37-11ea-8ba6-12813bfff9fa;
 Wed, 11 Dec 2019 16:58:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8B230ACD6;
 Wed, 11 Dec 2019 16:58:10 +0000 (UTC)
To: "Xia, Hongyan" <hongyxia@amazon.com>
References: <cover.1576061451.git.hongyxia@amazon.com>
 <caf43a60c79fd8380efe0bc178c6b31e040c179c.1576061451.git.hongyxia@amazon.com>
 <1dedbe02-b4de-baca-d444-fda4f3711e28@suse.com>
 <9abd6bc8c4d77e8653da6d451ecaa4d122c94b35.camel@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c692fd22-ce57-5f84-e596-2c59252be0b4@suse.com>
Date: Wed, 11 Dec 2019 17:58:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <9abd6bc8c4d77e8653da6d451ecaa4d122c94b35.camel@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 1/2] x86/mm: factor out the code for
 shattering an l3 PTE
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
Cc: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "Grall,
 Julien" <jgrall@amazon.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "wl@xen.org" <wl@xen.org>, "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMTIuMjAxOSAxNzoyNywgWGlhLCBIb25neWFuIHdyb3RlOgo+IE9uIFdlZCwgMjAxOS0x
Mi0xMSBhdCAxNjozMiArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDExLjEyLjIwMTkg
MTE6NTgsIEhvbmd5YW4gWGlhIHdyb3RlOgo+Pj4gQEAgLTU1NzgsMjcgKzU1OTcsOCBAQCBpbnQg
bW9kaWZ5X3hlbl9tYXBwaW5ncyh1bnNpZ25lZCBsb25nIHMsCj4+PiB1bnNpZ25lZCBsb25nIGUs
IHVuc2lnbmVkIGludCBuZikKPj4+ICAgICAgICAgICAgICB9Cj4+PiAgCj4+PiAgICAgICAgICAg
ICAgLyogUEFHRTFHQjogc2hhdHRlciB0aGUgc3VwZXJwYWdlIGFuZCBmYWxsIHRocm91Z2guICov
Cj4+PiAtICAgICAgICAgICAgcGwyZSA9IGFsbG9jX3hlbl9wYWdldGFibGUoKTsKPj4+IC0gICAg
ICAgICAgICBpZiAoICFwbDJlICkKPj4+ICsgICAgICAgICAgICBpZiAoIHNoYXR0ZXJfbDNlKHBs
M2UsIDAsIGxvY2tpbmcpICkKPj4+ICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07Cj4+
Cj4+IEhtbSwgSSBkaWRuJ3QgZXhwZWN0IEknZCBuZWVkIHRvIGNvbW1lbnQgb24gdGhpcyBhZ2Fp
bjogQXMgcGVyCj4+IG15IHYyIHJlcGx5LCB5b3Ugc2hvdWxkIGhhbmQgb24gdGhlIHJldHVybiB2
YWx1ZSBmcm9tIHRoZQo+PiBmdW5jdGlvbiwgbm90IG1ha2UgdXAgeW91ciBvd24uIFRoaXMgaXMg
c28gdGhhdCBpbiBjYXNlIHRoZQo+PiBmdW5jdGlvbiBnYWlucyBhbm90aGVyIGVycm9yIHBhdGgg
d2l0aCBhIGRpZmZlcmVudCBlcnJvciBjb2RlLAo+PiBpdCB3b3VsZG4ndCBiZWNvbWUgaW5kaXN0
aW5ndWlzaGFibGUgdG8gY2FsbGVycyBmdXJ0aGVyIHVwLgo+IAo+IEkgd2FzIGJhc2ljYWxseSB0
aGlua2luZyBhYm91dCB0aGUgY29udmVyc2F0aW9uIHdlIGhhZCB0aGF0IEVOT01FTSBpcwo+IHBy
b2JhYmx5IHRoZSBvbmx5IGVycm9yIHZhbHVlIG1hcF9wYWdlc190b194ZW4gd291bGQgcmV0dXJu
IGV2ZXIsIGFuZAo+IGl0IGlzIHVubGlrZWx5IHRvIGdhaW4gYW5vdGhlciByZXR1cm4gdmFsdWUg
aW4gdGhlIGZ1dHVyZSwgc28gaW5pdGlhbGx5Cj4gSSBqdXN0IGxldCBzaGF0dGVyIHJldHVybiAt
MSBhbmQgdGhlIGNhbGxlciByZXR1cm4gLUVOT01FTS4gVGhlcmUgaXMgbm8KPiBwcm9ibGVtIGZv
ciBtZSBpZiB3ZSB3YW50IHRvIGNoYW5nZSBpdCB0byBoYW5kbGUgZGlmZmVyZW50IGVycm9yCj4g
dmFsdWVzLgoKVGhlIGFsdGVybmF0aXZlIHRvIHlvdXIgcHJpb3IgMCAvIC0xIHJldHVybmluZyB3
b3VsZCBoYXZlIGJlZW4gdG8KaGF2ZSB0aGUgZnVuY3Rpb24gcmV0dXJuIGJvb2wuIEluIHRoaXMg
Y2FzZSAiaW52ZW50aW5nIiBhbiBlcnJvcgpjb2RlIGhlcmUgd291bGQgYmUgZmluZS4gVGhlIDAg
LyAtMSBhcHByb2FjaCB3b3VsZCBpbnRyb2R1Y2UKYW5vdGhlciBpbnN0YW5jZSBvZiB3aGF0IHdl
J3JlIHRyeWluZyB0byBnZXQgcmlkIG9mIGVsc2V3aGVyZS4KCkphbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
