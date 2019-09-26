Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1528BF3B0
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 15:06:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDTR5-0004Td-8v; Thu, 26 Sep 2019 13:03:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDTR2-0004TY-TA
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 13:03:52 +0000
X-Inumbo-ID: 16c12ea3-e05e-11e9-9651-12813bfff9fa
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by localhost (Halon) with ESMTPS
 id 16c12ea3-e05e-11e9-9651-12813bfff9fa;
 Thu, 26 Sep 2019 13:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569503031; x=1601039031;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=GZpOMWE8J6mOAlRR6ZzrN+uoXaFM71LIx1JZxN2wVt8=;
 b=IE33GRGDZ1+lvNvze7ZrVZAp9NyM8FffSv8ZcpGLHM4K2Etx8lEEPXfX
 sXFMrEalGpVhXRYb50ApzM9LzUEgn1FhZ/7jRueip6kioVixHyF0ZflLk
 G4jVLgYYEWo9oZg+qEbN5kSOZ81/OnPQP1Ub+VQ7WFnrgxHE0ayFGCx5z 8=;
X-IronPort-AV: E=Sophos;i="5.64,551,1559520000"; d="scan'208";a="753387025"
Received: from iad6-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1a-af6a10df.us-east-1.amazon.com) ([10.124.125.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 26 Sep 2019 13:03:51 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1a-af6a10df.us-east-1.amazon.com (Postfix) with ESMTPS
 id 61548A2D5D; Thu, 26 Sep 2019 13:03:49 +0000 (UTC)
Received: from EX13D11UEE001.ant.amazon.com (10.43.62.132) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 13:03:48 +0000
Received: from EX13MTAUEE001.ant.amazon.com (10.43.62.200) by
 EX13D11UEE001.ant.amazon.com (10.43.62.132) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 13:03:48 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.62.226) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 13:03:47 +0000
To: Julien Grall <julien.grall@arm.com>, <xen-devel@lists.xenproject.org>
References: <cover.1569489002.git.hongyax@amazon.com>
 <30e7ab0c4eff006d752ecd004cd1f0130ef52536.1569489002.git.hongyax@amazon.com>
 <ff21a1f2-b97f-7ae4-018a-b14dc96e5bfe@arm.com>
 <fb8d955d-5b21-d9c6-85a5-6eda77a91b05@amazon.com>
 <96170e54-3c9a-84f5-c292-6cb23d32212b@arm.com>
From: <hongyax@amazon.com>
Message-ID: <db12612c-fa9d-3692-4940-4f1e54cbb698@amazon.com>
Date: Thu, 26 Sep 2019 14:03:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <96170e54-3c9a-84f5-c292-6cb23d32212b@arm.com>
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

T24gMjYvMDkvMjAxOSAxMzoyNCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE9uIDkv
MjYvMTkgMTI6MTggUE0sIGhvbmd5YXhAYW1hem9uLmNvbSB3cm90ZToKPj4gT24gMjYvMDkvMjAx
OSAxMTozOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4gSGksCj4+Pgo+Pj4gTklUIFRpdGxlOiBQ
bGVhc2UgcmVtb3ZlIGZ1bGwgc3RvcC4KPj4+Cj4+PiBPbiA5LzI2LzE5IDEwOjQ2IEFNLCBob25n
eWF4QGFtYXpvbi5jb20gd3JvdGU6Cj4+Pj4gRnJvbTogSG9uZ3lhbiBYaWEgPGhvbmd5YXhAYW1h
em9uLmNvbT4KPj4+Cj4+PiBQbGVhc2UgcHJvdmlkZSBhIGRlc2NyaXB0aW9uIG9mIHdoYXQvd2h5
IHlvdSBhcmUgZG9pbmcgdGhpcyBpbiB0aGUgY29tbWl0IAo+Pj4gbWVzc2FnZS4KPj4+Cj4+PiBB
bHNvLCBJSVJDLCB4ODYgYWx3YXlzIGhhdmUgIUNPTkZJR19TRVBBUkFURV9YRU5IRUFQLiBTbyBj
YW4geW91IGV4cGxhaW4gd2h5IAo+Pj4gdGhlIHBhdGggd2l0aCBzZXBhcmF0ZSB4ZW5oZWFwIGlz
IGFsc28gbW9kaWZpZWQ/Cj4+Pgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogSG9uZ3lhbiBYaWEg
PGhvbmd5YXhAYW1hem9uLmNvbT4KPj4+PiAtLS0KPj4+PiDCoCB4ZW4vY29tbW9uL3BhZ2VfYWxs
b2MuYyB8IDE4ICsrKysrKysrKysrKysrKystLQo+Pj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxNiBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9j
b21tb24vcGFnZV9hbGxvYy5jIGIveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMKPj4+PiBpbmRleCA3
Y2IxYmQzNjhiLi40ZWM2Mjk5YmE4IDEwMDY0NAo+Pj4+IC0tLSBhL3hlbi9jb21tb24vcGFnZV9h
bGxvYy5jCj4+Pj4gKysrIGIveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMKPj4+PiBAQCAtMjE0Myw2
ICsyMTQzLDcgQEAgdm9pZCBpbml0X3hlbmhlYXBfcGFnZXMocGFkZHJfdCBwcywgcGFkZHJfdCBw
ZSkKPj4+PiDCoCB2b2lkICphbGxvY194ZW5oZWFwX3BhZ2VzKHVuc2lnbmVkIGludCBvcmRlciwg
dW5zaWduZWQgaW50IG1lbWZsYWdzKQo+Pj4+IMKgIHsKPj4+PiDCoMKgwqDCoMKgIHN0cnVjdCBw
YWdlX2luZm8gKnBnOwo+Pj4+ICvCoMKgwqAgdm9pZCAqcmV0Owo+Pj4+IMKgwqDCoMKgwqAgQVNT
RVJUKCFpbl9pcnEoKSk7Cj4+Pj4gQEAgLTIxNTEsNyArMjE1MiwxMCBAQCB2b2lkICphbGxvY194
ZW5oZWFwX3BhZ2VzKHVuc2lnbmVkIGludCBvcmRlciwgCj4+Pj4gdW5zaWduZWQgaW50IG1lbWZs
YWdzKQo+Pj4+IMKgwqDCoMKgwqAgaWYgKCB1bmxpa2VseShwZyA9PSBOVUxMKSApCj4+Pj4gwqDC
oMKgwqDCoMKgwqDCoMKgIHJldHVybiBOVUxMOwo+Pj4+IC3CoMKgwqAgbWVtZ3VhcmRfdW5ndWFy
ZF9yYW5nZShwYWdlX3RvX3ZpcnQocGcpLCAxIDw8IChvcmRlciArIFBBR0VfU0hJRlQpKTsKPj4+
PiArwqDCoMKgIHJldCA9IHBhZ2VfdG9fdmlydChwZyk7Cj4+Pj4gK8KgwqDCoCBtZW1ndWFyZF91
bmd1YXJkX3JhbmdlKHJldCwgMSA8PCAob3JkZXIgKyBQQUdFX1NISUZUKSk7Cj4+Pj4gK8KgwqDC
oCBtYXBfcGFnZXNfdG9feGVuKCh1bnNpZ25lZCBsb25nKXJldCwgcGFnZV90b19tZm4ocGcpLAo+
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDFVTCA8PCBvcmRl
ciwgUEFHRV9IWVBFUlZJU09SKTsKPj4+Cj4+PiBBcyBtZW50aW9uZWQgZWFybGllciBvbiBmb3Ig
QXJtLCB4ZW5oZWFwIHdpbGwgYWx3YXlzIGJlIG1hcHBlZC4gU28gdW5sZXNzIAo+Pj4geW91IGhh
dmUgcGxhbiB0byB0YWNrbGUgdGhlIEFybSBzaWRlIGFzIHdlbGwsIHdlIHNob3VsZCBtYWtlIHN1
cmUgdGhhdCB0aGUgCj4+PiBiZWhhdmlvciBpcyBub3QgY2hhbmdlZCBmb3IgQXJtLgo+Pgo+PiBJ
IGNhbiBhZGQgYW4gI2lmZGVmIGZvciB4ODYuIEFsdGhvdWdoIEkgdGhpbmsgaWYgdGhlIEFybSBj
b2RlIGlzIGNvcnJlY3QsIAo+PiB0aGlzIHNob3VsZCBzdGlsbCBub3QgYnJlYWsgdGhpbmdzLiBJ
dCBicmVha3MgaWYgYSB4ZW5oZWFwIGFjY2VzcyBpcyBtYWRlIAo+PiBldmVuIGJlZm9yZSBhbGxv
Y2F0aW9uIG9yIGFmdGVyIGZyZWUsIHdoaWNoIEkgdGhpbmsgaXMgYSBidWcuCj4gCj4gQ29ycmVj
dG5lc3MgaXMgYSBtYXR0ZXIgb2YgcGVyc3BlY3RpdmUgOykuIHhlbmhlYXAgaXMgYWxyZWFkeSBt
YXAgb24gQXJtIGFuZCAKPiB0aGVyZWZvcmUgdHJ5aW5nIHRvIG1hcCBpdCBhZ2FpbiBpcyBjb25z
aWRlcmVkIGFzIGFuIGVycm9yLiBJIHRoaW5rIHRoaXMgaXMgYSAKPiB2YWxpZCBiZWhhdmlvciBi
ZWNhdXNlIGlmIHlvdSB0cnkgdG8gbWFwIHR3aWNlIHRoZW4gaXQgbGlrZWx5IG1lYW5zIHlvdSBt
YXkgCj4gaGF2ZSB0byB1bm1hcCBsYXRlciBvbi4KCkdvb2QgcG9pbnQuIFRoYW5rcy4gV2lsbCBh
biBpZmRlZiBkbyB0aGUgam9iPwoKPiAKPiBGdXJ0aGVybW9yZSwgeGVuaGVhcCBpcyB1c2luZyBz
dXBlcnBhZ2UgKDJNQiwgMUdCKSBtYXBwaW5nIGF0IHRoZSBtb21lbnQuIFdlIAo+IGNvbXBsZXRl
bHkgZm9yYmlkIHNoYXR0ZXJpbmcgc3VwZXJwYWdlIGJlY2F1c2UgdGhleSBhcmUgbm90IHRyaXZp
YWwgdG8gZGVhbCB3aXRoLgo+IAo+IEluIHNob3J0LCBpZiB5b3Ugd2FudGVkIHRvIHVubWFwIHBh
cnQgaXQsIHRoZW4geW91IHdvdWxkIG5lZWQgdG8gc2hhdHRlciB0aGUgCj4gcGFnZS4gU2hhdHRl
cmluZyBzdXBlcnBhZ2UgcmVxdWlyZWQgdG8gZm9sbG93IGEgc3BlY2lmaWMgc2VxdWVuY2UgKGNh
bGxlZCAKPiBicmVhay1iZWZvcmUtbWFrZSkgdGhhdCB3aWxsIGdvIHRocm91Z2ggYW4gaW52YWxp
ZCBtYXBwaW5nLiBXZSBuZWVkIHRvIGJlIAo+IGNhcmVmdWwgYXMgYW5vdGhlciBwcm9jZXNzb3Ig
bWF5IGFjY2VzcyB0aGUgc3VwZXJwYWdlIGF0IHRoZSBzYW1lIHRpbWUuCj4gCj4gSXQgbWF5IGJl
IHBvc3NpYmxlIHRvIHVzZSBvbmx5IDRLQiBtYXBwaW5nIGZvciB0aGUgeGVuaGVhcCwgYnV0IHRo
YXQncyBuZWVkIHRvIAo+IGJlIGludmVzdGlnYXRlZCBmaXJzdC4KClRoZSBzZXJpZXMgaXMgaW50
ZW5kZWQgZm9yIHg4NiB3aGljaCB0aGVuIHN0YXJ0cyB3aXRoIG5vIHhlbmhlYXAgbWFwcGluZ3Mu
IElmIApvbmUgY2FsbCB0byBtYXBfcGFnZXNfdG9feGVuKCkgbWFwcyB0aGUgZmlyc3QgaGFsZiBv
ZiBhIHN1cGVycGFnZSBhbmQgYSBzZWNvbmQgCm9uZSBtYXBzIHRoZSByZW1haW5pbmcsIHdpbGwg
dGhlIHNlY29uZCBjYWxsIG1lcmdlIHRoZW0gaW50byBhbiBhY3R1YWwgCnN1cGVycGFnZSBtYXBw
aW5nPyBBbHNvLCBkbyB3ZSBkbyBhIHhlbmhlYXAgYWxsb2NhdGlvbiBhbmQgdGhlbiBvbmx5IGZy
ZWUgcGFydCAKb2YgaXQgaW4gc29tZSBjYXNlcz8gSWYgYm90aCBhbnN3ZXJzIGFyZSBob3BlZnVs
bHkgbm8sIHRoZW4gc2hhdHRlcmluZyB3b24ndCAKaGFwcGVuLgoKPiAKPiBMYXN0bHksIG5vdCBk
aXJlY3RseSByZWxhdGVkIHRvIHRoZSBkaXNjdXNzaW9uIGhlcmUsIEkgdGhpbmsgaXQgd291bGQg
YmUgYSBnb29kIAo+IHRpbWUgdG8gc3RhcnQgY2hlY2tpbmcgdGhlIHJldHVybiBvZiBtYXBfcGFn
ZXNfdG9feGVuKCkuIElmIHRoZSBjYWxsIHVubGlrZWx5IAo+IGZhaWxzLCB3ZSB3b3VsZCBlbmQg
dXAgdG8gY29udGludWUgYW5kIGdldCBhbiBlcnJvciBsYXRlciBvbiB0aGF0IG1heSBiZSBtb3Jl
IAo+IGRpZmZpY3VsdCB0byBkZWJ1Zy4gSW5zdGVhZCwgSSB3b3VsZCBmYWlsIHRoZSBhbGxvY2F0
aW9uIGlmIHRoZSBtYXBwaW5nIGlzIG5vdCAKPiBkb25lLgo+IAo+Pgo+Pj4KPj4+IEl0IGZlZWxz
IHRvIG1lIHdlIHdhbnQgdG8gaW50cm9kdWNlIGEgbmV3IEtjb25maWcgdGhhdCBpcyBzZWxlY3Rl
ZCBieSB4ODYgdG8gCj4+PiB0ZWxsIHdoZXRoZXIgdGhlIGRpcmVjdCBtYXAgaXMgbWFwcGVkLiBJ
IHdvdWxkIHRoZW4gaW1wbGVtZW50IG1heWJlIGluIAo+Pj4geGVuL21tLmggdHdvIHN0dWIgKG9u
ZSBmb3Igd2hlbiB0aGUgY29uZmlnIGlzIHNlbGVjdGVkLCB0aGUgb3RoZXIgd2hlbiBpdCBpcyAK
Pj4+IG5vdCkuCj4+Pgo+PiBJIGhhdmUgdGhlIHNhbWUgcXVlc3Rpb24uIERvIHdlIHdhbnQgdG8g
bW92ZSBmb3J3YXJkIHdpdGggbm8gZGlyZWN0IG1hcCBpbiAKPj4geDg2IG9yIGRvIHdlIHdhbnQg
dG8gaGF2ZSBhIGNvbXBpbGUtdGltZSBjb25maWc/IElmIHRoZSBwZXJmb3JtYW5jZSBpcyAKPj4g
ZGVjZW50LCBJIHdvdWxkIHByZWZlciB0aGUgZm9ybWVyIHNpbmNlIHRoaXMgY291bGQgYmUgYSBi
aWcgY29tcGlsZS10aW1lIAo+PiBzd2l0Y2ggd2hpY2ggbGVhdmVzIHR3byBicmFuY2hlcyBvZiBj
b2RlIHRvIGJlIG1haW50YWluZWQgaW4gdGhlIGZ1dHVyZS4KPiAKPiBVbmxlc3MgeW91IGhhdmUg
cGxhbiB0byBpbXBsZW1lbnQgdGhlIEFybSBiaXRzLCB3ZSB3aWxsIG5lZWQgdHdvIGJyYW5jaGVz
IHRvIAo+IG1haW50YWluLgo+IAo+IEJ1dCB3aGF0IEkgc3VnZ2VzdGVkIGlzIHg4NiB0byBhbHdh
eXMgc2VsZWN0IHRoZSBvcHRpb24gdGhhdCB3aWxsIHJlcXVpcmUgCj4gbWFwL3VubWFwIHRoZSBk
aXJlY3QgbWFwLiBBcm0gd291bGQga2VlcCBpdCBkaXNhYmxlLgo+IAo+IENoZWVycywKPiAKClll
cywgdGhhdCBpcyB3aGF0IEkgbWVhbnQuIFNvcnJ5IGlmIGl0IHdhcyBub3QgY2xlYXIuIEkgYW0g
aGFwcHkgd2l0aCBhbiBBUk0gCmJyYW5jaCBhbmQgYW4geDg2IG9uZSwgYnV0IG5vdCBzdXBlciBo
YXBweSBhYm91dCB4ODYgc2VwYXJhdGVkIGludG8gdHdvLgoKSG9uZ3lhbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
