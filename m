Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40091278A2
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2019 11:00:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTjUh-0004yc-ON; Thu, 23 May 2019 08:54:35 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SD5s=TX=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hTjUg-0004yX-17
 for xen-devel@lists.xenproject.org; Thu, 23 May 2019 08:54:34 +0000
X-Inumbo-ID: 61d83f5b-7d38-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 61d83f5b-7d38-11e9-8980-bc764e045a96;
 Thu, 23 May 2019 08:54:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3513A341;
 Thu, 23 May 2019 01:54:32 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 44CE83F575;
 Thu, 23 May 2019 01:54:31 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>, konrad.wilk@oracle.com,
 boris.ostrovsky@oracle.com, jgross@suse.com
References: <alpine.DEB.2.21.1905221622190.20440@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <43201444-9e08-4343-1824-446b8de0a2aa@arm.com>
Date: Thu, 23 May 2019 09:54:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1905221622190.20440@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/swiotlb: don't initialize swiotlb twice
 on arm64
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAyMy8wNS8yMDE5IDAwOjI2LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gRnJv
bTogU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vc0B4aWxpbnguY29tPgo+IAo+IE9uIGFybTY0
IHN3aW90bGIgaXMgYWxyZWFkeSBpbml0aWFsaXplZCBieSBtZW1faW5pdC4gV2UgZG9uJ3Qgd2Fu
dCB0bwoKQXJtNjQgd2lsbCBub3QgYWx3YXlzIGluaXRpYWxpemUgdGhlIHN3aW90bGIuIEl0IHdp
bGwgb25seSBiZSBkb25lIGlmIHRoZSB1c2VyIApmb3JjZSBpdCBvciB0aGVyZSBhcmUgbWVtb3J5
IGFib3ZlIHRoZSBETUEgbGltaXQuCgo+IGluaXRpYWxpemUgaXQgdHdpY2UsIHRoZSBtZW1vcnkg
aXMgYWxyZWFkeSBhbGxvY2F0ZWQuIERldGVjdCB0aGlzCj4gY29uZGl0aW9uIGluIHN3aW90bGIt
eGVuIGFuZCBza2lwIHRoZSBzZWNvbmQgaW5pdGlhbGl6YXRpb24uCgpJIHVuZGVyc3RhbmQgdGhh
dCB0aGUgbWVtb3J5IGFsbG9jYXRlZCBieSBzd2lvdGxiIHdpbGwgYmUgcmVwbGFjZWQgd2l0aCBm
cmVlaW5nIAptZW1vcnkuIFNvIHlvdSBhdCBsZWFzdCBoYXZlIGEgbWVtb3J5IGxlYWsuCgpIb3dl
dmVyLCB0aGUgbG9naWMgdG8gYWxsb2NhdGUgdGhlIG1lbW9yeSBpcyBxdWl0ZSBkaWZmZXJlbnQu
IEZvciBpbnN0YW5jZSwgCkFGQUlDVCwgc3dpb3RsYiB3aWxsIGFsbG9jYXRlIGxvdyBwYWdlcyB3
aGlsZSB4ZW4gc3dpb3RsYiB3aWxsIGFsbG9jIGFueSBwYWdlcy4KClNvIEkgdGhpbmsgeW91ciBj
b21taXQgbWVzc2FnZSBzaG91bGQgY29udGFpbiBhIGJpdCBtb3JlIGRldGFpbHMgb24gdGhlIApp
bXBsaWNhdGlvbi4gSSB2YWd1ZWx5IHJlbWVtYmVyIHRoYXQgb24gWGlsaW54IG9uIG5lZWRlZCB0
byB1c2UgbG93IG1lbW9yeSBhcyAKbXVjaCBhcyBwb3NzaWJsZS4gSXMgdGhpcyBwYXRjaCBhY3R1
YWxseSB0cnlpbmcgdG8gZml4IHRoYXQ/Cgo+IAo+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gU3Rh
YmVsbGluaSA8c3RlZmFub3NAeGlsaW54LmNvbT4KPiAKPiAtLS0KPiAKPiBUaGVyZSBhcmUgb3Ro
ZXIgaXNzdWVzIHdoaWNoIEkgZm91bmQgcmVjZW50bHkgYWZmZWN0aW5nIHRoZSBzd2lvdGxiIG9u
Cj4gYXJtNjQgLS0gSSdsbCBzZW5kIHRoZSBvdGhlciBwYXRjaGVzIHNlcGFyYXRlbHkuCj4gCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL3N3aW90bGIteGVuLmMgYi9kcml2ZXJzL3hlbi9zd2lv
dGxiLXhlbi5jCj4gaW5kZXggODc3YmFmMi4uOGZjZGEyYmY0IDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMveGVuL3N3aW90bGIteGVuLmMKPiArKysgYi9kcml2ZXJzL3hlbi9zd2lvdGxiLXhlbi5jCj4g
QEAgLTIwNiw2ICsyMDYsNyBAQCBpbnQgX19yZWYgeGVuX3N3aW90bGJfaW5pdChpbnQgdmVyYm9z
ZSwgYm9vbCBlYXJseSkKPiAgIAlpbnQgcmMgPSAtRU5PTUVNOwo+ICAgCWVudW0geGVuX3N3aW90
bGJfZXJyIG1fcmV0ID0gWEVOX1NXSU9UTEJfVU5LTk9XTjsKPiAgIAl1bnNpZ25lZCBpbnQgcmVw
ZWF0ID0gMzsKPiArCWJvb2wgcHJlX2luaXRpYWxpemVkID0gZmFsc2U7Cj4gICAKPiAgIAl4ZW5f
aW9fdGxiX25zbGFicyA9IHN3aW90bGJfbnJfdGJsKCk7Cj4gICByZXRyeToKPiBAQCAtMjE0LDcg
KzIxNSwxMCBAQCBpbnQgX19yZWYgeGVuX3N3aW90bGJfaW5pdChpbnQgdmVyYm9zZSwgYm9vbCBl
YXJseSkKPiAgIAkvKgo+ICAgCSAqIEdldCBJTyBUTEIgbWVtb3J5IGZyb20gYW55IGxvY2F0aW9u
Lgo+ICAgCSAqLwo+IC0JaWYgKGVhcmx5KSB7Cj4gKwlpZiAoaW9fdGxiX3N0YXJ0ICE9IDApIHsK
ClJhdGhlciB0aGFuIGFkZGluZyBhbiBleHRyYSBpZiBpbiBhIGFscmVhZHkgZGlmZmljdWx0IGNv
ZGUgdG8gcmVhZC4gQ2FuIHdlIG1vdmUgCnRoZSBhbGxvY2F0aW9uIGluIGEgc2VwYXJhdGUgZnVu
Y3Rpb24gYW5kIG9ubHkgY2FsbCBpdCBpZiBuZWNlc3Nhcnk/Cgo+ICsJCXhlbl9pb190bGJfc3Rh
cnQgPSBwaHlzX3RvX3ZpcnQoaW9fdGxiX3N0YXJ0KTsKPiArCQlwcmVfaW5pdGlhbGl6ZWQgPSB0
cnVlOwo+ICsJfSBlbHNlIGlmIChlYXJseSkgewo+ICAgCQl4ZW5faW9fdGxiX3N0YXJ0ID0gbWVt
YmxvY2tfYWxsb2MoUEFHRV9BTElHTihieXRlcyksCj4gICAJCQkJCQkgIFBBR0VfU0laRSk7Cj4g
ICAJCWlmICgheGVuX2lvX3RsYl9zdGFydCkKPiBAQCAtMjY0LDcgKzI2OCw3IEBAIGludCBfX3Jl
ZiB4ZW5fc3dpb3RsYl9pbml0KGludCB2ZXJib3NlLCBib29sIGVhcmx5KQo+ICAgCQkJIHZlcmJv
c2UpKQo+ICAgCQkJcGFuaWMoIkNhbm5vdCBhbGxvY2F0ZSBTV0lPVExCIGJ1ZmZlciIpOwo+ICAg
CQlyYyA9IDA7Cj4gLQl9IGVsc2UKPiArCX0gZWxzZSBpZiAoIXByZV9pbml0aWFsaXplZCkKPiAg
IAkJcmMgPSBzd2lvdGxiX2xhdGVfaW5pdF93aXRoX3RibCh4ZW5faW9fdGxiX3N0YXJ0LCB4ZW5f
aW9fdGxiX25zbGFicyk7Cj4gICAKPiAgIAlpZiAoIXJjKQo+IAoKQ2hlZXJzLAoKLS0gCkp1bGll
biBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
