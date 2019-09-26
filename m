Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24863BF12B
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 13:22:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDRmj-0007IO-I4; Thu, 26 Sep 2019 11:18:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDRmi-0007II-MP
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 11:18:08 +0000
X-Inumbo-ID: 5138a5f6-e04f-11e9-b588-bc764e2007e4
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by localhost (Halon) with ESMTPS
 id 5138a5f6-e04f-11e9-b588-bc764e2007e4;
 Thu, 26 Sep 2019 11:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569496688; x=1601032688;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=4agOrUO8vKtbcqV/jF0a/saeX4bY1mngaOPrQKY3QGE=;
 b=sv4Oxs7C3jEmZpasq4vrszxqOAmbDiZuTgWUgh9/Y6ZJy5x4tkFqcqrx
 2c+j8y9QtEhdYkgq7uDbv4BZ7/uJ6qtXWjoLHeNZTMShIj38J5b6G38cL
 AJV30kEWWQbi3PyJ4UUsBuLu2rF39Na4HM23Ls1oYQCMzQhCEXsLdofT1 E=;
X-IronPort-AV: E=Sophos;i="5.64,551,1559520000"; d="scan'208";a="753367786"
Received: from iad6-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1e-27fb8269.us-east-1.amazon.com) ([10.124.125.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 26 Sep 2019 11:18:07 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-27fb8269.us-east-1.amazon.com (Postfix) with ESMTPS
 id 5C73EA2952; Thu, 26 Sep 2019 11:18:04 +0000 (UTC)
Received: from EX13D04UWA003.ant.amazon.com (10.43.160.212) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.58) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 11:18:03 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D04UWA003.ant.amazon.com (10.43.160.212) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 11:18:03 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 11:18:01 +0000
To: Julien Grall <julien.grall@arm.com>, <xen-devel@lists.xenproject.org>
References: <cover.1569489002.git.hongyax@amazon.com>
 <30e7ab0c4eff006d752ecd004cd1f0130ef52536.1569489002.git.hongyax@amazon.com>
 <ff21a1f2-b97f-7ae4-018a-b14dc96e5bfe@arm.com>
From: <hongyax@amazon.com>
Message-ID: <fb8d955d-5b21-d9c6-85a5-6eda77a91b05@amazon.com>
Date: Thu, 26 Sep 2019 12:18:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ff21a1f2-b97f-7ae4-018a-b14dc96e5bfe@arm.com>
Content-Language: en-US
Precedence: Bulk
Subject: Re: [Xen-devel] [RFC PATCH 68/84] page_alloc: actually do the
 mapping and unmapping on xenheap.
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei
 Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan
 Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYvMDkvMjAxOSAxMTozOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE5JVCBU
aXRsZTogUGxlYXNlIHJlbW92ZSBmdWxsIHN0b3AuCj4gCj4gT24gOS8yNi8xOSAxMDo0NiBBTSwg
aG9uZ3lheEBhbWF6b24uY29tIHdyb3RlOgo+PiBGcm9tOiBIb25neWFuIFhpYSA8aG9uZ3lheEBh
bWF6b24uY29tPgo+IAo+IFBsZWFzZSBwcm92aWRlIGEgZGVzY3JpcHRpb24gb2Ygd2hhdC93aHkg
eW91IGFyZSBkb2luZyB0aGlzIGluIHRoZSBjb21taXQgbWVzc2FnZS4KPiAKPiBBbHNvLCBJSVJD
LCB4ODYgYWx3YXlzIGhhdmUgIUNPTkZJR19TRVBBUkFURV9YRU5IRUFQLiBTbyBjYW4geW91IGV4
cGxhaW4gd2h5IAo+IHRoZSBwYXRoIHdpdGggc2VwYXJhdGUgeGVuaGVhcCBpcyBhbHNvIG1vZGlm
aWVkPwo+IAo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBIb25neWFuIFhpYSA8aG9uZ3lheEBhbWF6b24u
Y29tPgo+PiAtLS0KPj4gwqAgeGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMgfCAxOCArKysrKysrKysr
KysrKysrLS0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYyBiL3hlbi9j
b21tb24vcGFnZV9hbGxvYy5jCj4+IGluZGV4IDdjYjFiZDM2OGIuLjRlYzYyOTliYTggMTAwNjQ0
Cj4+IC0tLSBhL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jCj4+ICsrKyBiL3hlbi9jb21tb24vcGFn
ZV9hbGxvYy5jCj4+IEBAIC0yMTQzLDYgKzIxNDMsNyBAQCB2b2lkIGluaXRfeGVuaGVhcF9wYWdl
cyhwYWRkcl90IHBzLCBwYWRkcl90IHBlKQo+PiDCoCB2b2lkICphbGxvY194ZW5oZWFwX3BhZ2Vz
KHVuc2lnbmVkIGludCBvcmRlciwgdW5zaWduZWQgaW50IG1lbWZsYWdzKQo+PiDCoCB7Cj4+IMKg
wqDCoMKgwqAgc3RydWN0IHBhZ2VfaW5mbyAqcGc7Cj4+ICvCoMKgwqAgdm9pZCAqcmV0Owo+PiDC
oMKgwqDCoMKgIEFTU0VSVCghaW5faXJxKCkpOwo+PiBAQCAtMjE1MSw3ICsyMTUyLDEwIEBAIHZv
aWQgKmFsbG9jX3hlbmhlYXBfcGFnZXModW5zaWduZWQgaW50IG9yZGVyLCB1bnNpZ25lZCAKPj4g
aW50IG1lbWZsYWdzKQo+PiDCoMKgwqDCoMKgIGlmICggdW5saWtlbHkocGcgPT0gTlVMTCkgKQo+
PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIE5VTEw7Cj4+IC3CoMKgwqAgbWVtZ3VhcmRfdW5n
dWFyZF9yYW5nZShwYWdlX3RvX3ZpcnQocGcpLCAxIDw8IChvcmRlciArIFBBR0VfU0hJRlQpKTsK
Pj4gK8KgwqDCoCByZXQgPSBwYWdlX3RvX3ZpcnQocGcpOwo+PiArwqDCoMKgIG1lbWd1YXJkX3Vu
Z3VhcmRfcmFuZ2UocmV0LCAxIDw8IChvcmRlciArIFBBR0VfU0hJRlQpKTsKPj4gK8KgwqDCoCBt
YXBfcGFnZXNfdG9feGVuKCh1bnNpZ25lZCBsb25nKXJldCwgcGFnZV90b19tZm4ocGcpLAo+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAxVUwgPDwgb3JkZXIsIFBB
R0VfSFlQRVJWSVNPUik7Cj4gCj4gQXMgbWVudGlvbmVkIGVhcmxpZXIgb24gZm9yIEFybSwgeGVu
aGVhcCB3aWxsIGFsd2F5cyBiZSBtYXBwZWQuIFNvIHVubGVzcyB5b3UgCj4gaGF2ZSBwbGFuIHRv
IHRhY2tsZSB0aGUgQXJtIHNpZGUgYXMgd2VsbCwgd2Ugc2hvdWxkIG1ha2Ugc3VyZSB0aGF0IHRo
ZSBiZWhhdmlvciAKPiBpcyBub3QgY2hhbmdlZCBmb3IgQXJtLgoKSSBjYW4gYWRkIGFuICNpZmRl
ZiBmb3IgeDg2LiBBbHRob3VnaCBJIHRoaW5rIGlmIHRoZSBBcm0gY29kZSBpcyBjb3JyZWN0LCB0
aGlzIApzaG91bGQgc3RpbGwgbm90IGJyZWFrIHRoaW5ncy4gSXQgYnJlYWtzIGlmIGEgeGVuaGVh
cCBhY2Nlc3MgaXMgbWFkZSBldmVuIApiZWZvcmUgYWxsb2NhdGlvbiBvciBhZnRlciBmcmVlLCB3
aGljaCBJIHRoaW5rIGlzIGEgYnVnLgoKPiAKPiBJdCBmZWVscyB0byBtZSB3ZSB3YW50IHRvIGlu
dHJvZHVjZSBhIG5ldyBLY29uZmlnIHRoYXQgaXMgc2VsZWN0ZWQgYnkgeDg2IHRvIAo+IHRlbGwg
d2hldGhlciB0aGUgZGlyZWN0IG1hcCBpcyBtYXBwZWQuIEkgd291bGQgdGhlbiBpbXBsZW1lbnQg
bWF5YmUgaW4geGVuL21tLmggCj4gdHdvIHN0dWIgKG9uZSBmb3Igd2hlbiB0aGUgY29uZmlnIGlz
IHNlbGVjdGVkLCB0aGUgb3RoZXIgd2hlbiBpdCBpcyBub3QpLgo+CkkgaGF2ZSB0aGUgc2FtZSBx
dWVzdGlvbi4gRG8gd2Ugd2FudCB0byBtb3ZlIGZvcndhcmQgd2l0aCBubyBkaXJlY3QgbWFwIGlu
IHg4NiAKb3IgZG8gd2Ugd2FudCB0byBoYXZlIGEgY29tcGlsZS10aW1lIGNvbmZpZz8gSWYgdGhl
IHBlcmZvcm1hbmNlIGlzIGRlY2VudCwgSSAKd291bGQgcHJlZmVyIHRoZSBmb3JtZXIgc2luY2Ug
dGhpcyBjb3VsZCBiZSBhIGJpZyBjb21waWxlLXRpbWUgc3dpdGNoIHdoaWNoIApsZWF2ZXMgdHdv
IGJyYW5jaGVzIG9mIGNvZGUgdG8gYmUgbWFpbnRhaW5lZCBpbiB0aGUgZnV0dXJlLgoKSG9uZ3lh
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
