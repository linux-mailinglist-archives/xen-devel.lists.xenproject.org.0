Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5AD6C0715
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 16:13:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDqxm-0003JZ-1w; Fri, 27 Sep 2019 14:11:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tE9W=XW=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iDqxl-0003JS-4W
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 14:11:13 +0000
X-Inumbo-ID: a84abbb9-e130-11e9-967a-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id a84abbb9-e130-11e9-967a-12813bfff9fa;
 Fri, 27 Sep 2019 14:11:11 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9682128;
 Fri, 27 Sep 2019 07:11:11 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E10203F534;
 Fri, 27 Sep 2019 07:11:10 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20190926183808.11630-1-julien.grall@arm.com>
 <20190926183808.11630-5-julien.grall@arm.com> <87v9te7y1m.fsf@epam.com>
 <bbb73576-a2ae-16d8-5147-34a584721e7c@arm.com> <87r2419am7.fsf@epam.com>
 <df6b891c-2670-47d9-ae0d-223161edc225@arm.com> <87muep984i.fsf@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <8bc36926-a00f-d20b-c3b2-12491ed576de@arm.com>
Date: Fri, 27 Sep 2019 15:11:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <87muep984i.fsf@epam.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH RFC for-4.13 04/10] xen/arm: Ensure the SSBD
 workaround is re-enabled right after exiting a guest
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <Andrii_Anisov@epam.com>,
 "andrii.anisov@gmail.com" <andrii.anisov@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAyNy8wOS8yMDE5IDE0OjMzLCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPiBKdWxpZW4g
R3JhbGwgd3JpdGVzOgo+PiBPbiAyNy8wOS8yMDE5IDEzOjM5LCBWb2xvZHlteXIgQmFiY2h1ayB3
cm90ZToKPj4+IEp1bGllbiBHcmFsbCB3cml0ZXM6Cj4+Pj4gT24gMjcvMDkvMjAxOSAxMjo1Niwg
Vm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6Cj4+Pj4+IEp1bGllbiBHcmFsbCB3cml0ZXM6Cj4+Pj4+
Cj4+Pj4+PiBBdCB0aGUgbW9tZW50LCBTU0JEIHdvcmthcm91bmQgaXMgcmUtZW5hYmxlZCBmb3Ig
WGVuIGFmdGVyIGludGVycnVwdHMKPj4+Pj4+IGFyZSB1bm1hc2tlZC4gVGhpcyBtZWFucyB3ZSBt
YXkgZW5kIHVwIHRvIGV4ZWN1dGUgc29tZSBwYXJ0IG9mIHRoZQo+Pj4+Pj4gaHlwZXJ2aXNvciBp
ZiBhbiBpbnRlcnJ1cHQgaXMgcmVjZWl2ZWQgYmVmb3JlIHRoZSB3b3JrYXJvdW5kIGlzCj4+Pj4+
PiByZS1lbmFibGVkLgo+Pj4+Pj4KPj4+Pj4+IEFzIHRoZSByZXN0IG9mIGVudGVyX2h5cGVydmlz
b3JfZnJvbV9ndWVzdCgpIGRvZXMgbm90IHJlcXVpcmUgdG8gaGF2ZQo+Pj4+Pj4gaW50ZXJydXB0
cyBtYXNrZWQsIHRoZSBmdW5jdGlvbiBpcyBub3cgc3BsaXQgaW4gdHdvIHBhcnRzOgo+Pj4+Pj4g
ICAgICAgIDEpIGVudGVyX2h5cGVydmlzb3JfZnJvbV9ndWVzdF9ub2lycSgpIGNhbGxlZCB3aXRo
IGludGVycnVwdHMKPj4+Pj4+ICAgICAgICAgICBtYXNrZWQuCj4+Pj4+IEknbSBva2F5IHdpdGgg
dGhpcyBhcHByb2FjaCwgYnV0IEkgZG9uJ3QgbGlrZSBuYW1lIGZvcgo+Pj4+PiBlbnRlcl9oeXBl
cnZpc29yX2Zyb21fZ3Vlc3Rfbm9pcnEoKS4gUmlnaHQgbm93IGl0IGlzIGRvaW5nIGV4YWN0bHkg
b25lCj4+Pj4+IHRoaW5nIC0gbWl0aWdhdGVzIFNTQkQuIFNvLCBtYXliZSBtb3JlIGFwcHJvcHJp
YXRlIG5hbWUgd2lsbCBiZQo+Pj4+PiBzb21ldGhpbmcgbGlrZSAibWl0aWdhdGVfc3NiZCgpIiA/
Cj4+Pj4KPj4+PiBJZiBJIHdhbnRlZCB0byBjYWxsIGl0IG1pdGlnYXRlX3NzYmQoKSBJIHdvdWxk
IGhhdmUgaW1wbGVtZW50ZWQKPj4+PiBjb21wbGV0ZWx5IGRpZmZlcmVudGx5LiBUaGUgcmVhc29u
IGl0IGlzIGxpa2UgdGhhdCBpcyBiZWNhdXNlIHdlIG1heQo+Pj4+IG5lZWQgbW9yZSBjb2RlIHRv
IGJlIGFkZGVkIGhlcmUgaW4gdGhlIGZ1dHVyZSAoSSBoYXZlIEFuZHJpaSdzIHNlcmllcwo+Pj4+
IGluIG1pbmQpLiBTbyBJIHdvdWxkIHJhdGhlciBhdm9pZCBhIGZ1cnRoZXIgcmVuYW1pbmcgbGF0
ZXIgb24gYW5kIHNvbWUKPj4+PiByZXdvcmsuCj4+PiBGYWlyIGVub3VnaAo+Pj4KPj4+Pgo+Pj4+
IFJlZ2FyZGluZyB0aGUgbmFtZSwgdGhpcyBpcyBhIHNwbGl0IG9mCj4+Pj4gZW50ZXJfaHlwZXJ2
aXNvcl9mcm9tX2d1ZXN0KCkuIEhlbmNlLCB3aHkgdGhlIGZpcnN0IHBhdGggaXMgdGhlCj4+Pj4g
c2FtZS4gVGhlIG5vaXJxIG1lcmVseSBoZWxwIHRoZSB1c2VyIHRvIGtub3cgd2hhdCB0byBleHBl
Y3QuIFRoaXMgaXMKPj4+PiBiZXR0ZXIgb2YgeWV0IGFuIF9fIHZlcnNpb24uIEZlZWwgZnJlZSB0
byBzdWdnZXN0IGEgYmV0dGVyIHN1ZmZpeC4KPj4+IEknbSBiYWQgYXQgbmFtaW5nIHRoaW5ncyA6
KQo+Pgo+PiBNZSB0b28gOykuCj4+Cj4+Pgo+Pj4gSSB1bmRlcnN0YW5kIHRoYXQgaXMgdHdvIGhh
bHZlcyBvZiBvbmUgZnVuY3Rpb24uIEJ1dCBmdW5jX25hbWVfbm9pcnEoKQo+Pj4gcGF0dGVybiBp
cyB3aWRlbHkgdXNlZCBmb3Igb3RoZXIgY2FzZTogd2hlbiB3ZSBoYXZlIGZ1bmNfbmFtZV9ub2ly
cSgpCj4+PiBmdW5jdGlvbiBhbmQgc29tZSBmdW5jX25hbWUoKSB0aGF0IGRpc2FibGVzIGludGVy
cnVwdHMgbGlrZSB0aGlzOgo+Pj4KPj4+IHZvaWQgZnVuY19uYW1lKCkKPj4+IHsKPj4+ICAgICAg
ICAgICBkaXNhYmxlX2lycXMoKTsKPj4+ICAgICAgICAgICBmdW5jX25hbWVfbm9pcnEoKTsKPj4+
ICAgICAgICAgICBlbmFibGVfaXJxcygpOwo+Pj4gfQo+Pj4KPj4+IEkgbGlrZSBwcmluY2lwbGUg
b2YgbGVhc3Qgc3VycHJpc2UsIHNvIGl0IGlzIGJldHRlciB0byB1c2Ugc29tZSBvdGhlcgo+Pj4g
bmFtaW5nIHBhdHRlcm4gdGhlcmUuCj4+Cj4+IEkgY2FuJ3QgZmluZCBhbnkgZnVuY3Rpb24gc3Vm
Zml4ZWQgd2l0aCBfbm9pcnEgaW4gWGVuLiBTbyBJIGRvbid0Cj4+IHRoaW5rIHRoaXMgd291bGQg
YmUgYSBtYWpvciBpc3N1ZSBoZXJlLgo+IFllcywgdGhlcmUgYXJlIG5vIHN1Y2ggZnVuY3Rpb25z
IGluIFhlbi4gQnV0IGl0IG1heSBjb25mdXNlIGRldmVsb3BlcnMKPiB3aG8gY29tZSBmcm9tIGFu
b3RoZXIgcHJvamVjdHMuCgpXZWxsLCBlYWNoIHByb2plY3RzIGhhdmUgdGhlaXIgb3duIHN0eWxl
LiBTbyB0aGVyZSBhcmUgYWx3YXlzIHNvbWUgYWRhcHRhdGlvbnMgCm5lZWRlZCB0byBtb3ZlIHRv
IGEgbmV3IHByb2plY3QuIFdoYXQgbWF0dGVycyBpcyB0aGUgZG9jdW1lbnRhdGlvbiBjbGFyaWZp
ZXMgCndoYXQgaXMgdGhlIGV4YWN0IHVzZS4gQnV0Li4uCgo+IAo+Pj4KPj4+IG1heWJlIHNvbWV0
aGluZyBsaWtlIGVudGVyX2h5cGVydmlzb3JfZnJvbV9ndWVzdF9wdDEoKSBhbmQKPj4+IGVudGVy
X2h5cGVydmlzb3JfZnJvbV9ndWVzdF9wdDIoKT8KPj4gSG1tbSwgaXQgcmVtaW5kcyBtZSB1bmkg
d2hlbiB3ZSBoYWQgdG8gbGltaXQgZnVuY3Rpb24gc2l6ZSB0byAyMCBsaW5lcyA6KS4KPj4KPj4g
SSBjaG9zZSBfbm9pcnEgYmVjYXVzZSB0aGUgb3RoZXIgbmFtZSBJIGhhZCBpbiBtaW5kIHdhcyBx
dWl0ZQo+PiB2ZXJib3NlLiBJIHdhcyB0aGlua2luZzoKPj4gZW50ZXJfaHlwZXJ2aXNvcl9mcm9t
X2d1ZXN0X2JlZm9yZV9pbnRlcnJ1cHRzKCkuCj4gQSB3YXMgdGhpbmtpbmcgYWJvdXQgc29tZXRo
aW5nIGxpa2UgdGhpcyB0b28uCj4gV2hhdCBhYm91dCBlbnRlcl9oeXBlcnZpc29yX2Zyb21fZ3Vl
c3RfcHJlaXJxKCk/CgouLi4gdGhpcyB3b3VsZCBiZSBpbmRlZWQgYmV0dGVyLgoKPiAKPiBJIHRo
aW5rIHRoYXQgIl9wcmUiIGJldHRlciBzaG93cyB0aGUgcmVsYXRpb24gdG8KPiBlbnRlcl9oeXBl
cnZpc29yX2Zyb21fZ3Vlc3QoKQo+IAo+Pgo+Pj4KPj4+IE9yIG1heWJlLCB3ZSBzaG91bGQgbm90
IHNwbGl0IHRoZSBmdW5jdGlvbiBhdCBhbGw/IEluc3RlYWQsIHdlIGVuYWJsZQo+Pj4gaW50ZXJy
dXB0cyByaWdodCBpbiB0aGUgbWlkZGxlIG9mIGl0Lgo+Pgo+PiBJIHRob3VnaHQgYWJvdXQgdGhp
cyBidXQgSSBkaWRuJ3QgbXVjaCBsaWtlIHRoZSByZXN1bHRpbmcgY29kZS4KPj4KPj4gVGhlIGlu
c3RydWN0aW9uIHRvIHVubWFzayBpbnRlcnJ1cHRzIHJlcXVpcmVzIHRvIHRha2UgYW4gaW1tZWRp
YXRlCj4+IChpbmRpY2F0ZXMgd2hpY2ggaW50ZXJydXB0cyB0byB1bm1hc2spLiBBcyBub3QgYWxs
IHRoZSB0cmFwcyByZXF1aXJlCj4+IHRvIHVubWFzayB0aGUgc2FtZSBpbnRlcnJ1cHRzLCB3ZSB3
b3VsZCBlbmQgdXAgdG8gaGF2ZSB0byBhIGJ1bmNoIG9mCj4+IGlmIGluIHRoZSBjb2RlIHRvIHNl
bGVjdCB0aGUgcmlnaHQgdW5tYXNraW5nLgo+IEFoLCB5ZXMsIHRoaXMgaXMgdGhlIHByb2JsZW0u
IFdlIGNhbiBwcm92aWRlIGNhbGxiYWNrIHRvCj4gZW50ZXJfaHlwZXJ2aXNvcl9mcm9tX2d1ZXN0
KCkuCgpJIGFtIG5vdCBzdXJlIHdoYXQgeW91IG1lYW4gYnkgdGhpcy4gRG8geW91IG1lYW4gYSBj
YWxsYmFjayB0aGF0IHdpbGwgdW5tYXNrIHRoZSAKaW50ZXJydXB0cz8KCj4gCj4gT3Igc3dpdGNo
KCkgaW5zdGVhZCBvZiBtdWx0aXBsZSBpZnMuIE1heWJlIGluIHNvbWUgaGVscGVyIGZ1bmN0aW9u
LgoKV2VsbCwgbXkgcG9pbnQgYWJvdXQgImlmcyIgaXMgdGhhdCB5b3UgYWRkIGEgZmV3IGJyYW5j
aCBpbnN0cnVjdGlvbiBmb3IgCnNvbWV0aGluZyB0aGF0IGNhbiBtb3N0bHkgYmUgc3RhdGljICh3
ZSB3aWxsIGFsd2F5cyB1bm1hc2sgdGhlIHNhbWUgaW50ZXJydXB0cyAKZm9yIGEgZ2l2ZW4gZXhj
ZXB0aW9uKS4KCkFueXdheSwgc3VjaCBzb2x1dGlvbnMgaXMgYSBuby1nbyBmb3IgbWUuIFRoaXMg
aXMgb25seSBtdWRkeWluZyB0aGUgY29kZSBhbmQgSSAKY2FyZSBhYm91dCBsb25nLXRlcm0gbWFp
bnRlbmFuY2UuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
