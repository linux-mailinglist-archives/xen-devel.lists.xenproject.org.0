Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A24FFE4B36
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2019 14:36:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNymv-0007QA-H7; Fri, 25 Oct 2019 12:33:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/YrW=YS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iNymt-0007Q5-VN
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2019 12:33:51 +0000
X-Inumbo-ID: af7ace06-f723-11e9-a531-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id af7ace06-f723-11e9-a531-bc764e2007e4;
 Fri, 25 Oct 2019 12:33:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 91014B5B3;
 Fri, 25 Oct 2019 12:33:44 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191023135812.21348-1-andrew.cooper3@citrix.com>
 <20191023135812.21348-3-andrew.cooper3@citrix.com>
 <9a76e252-b9a3-4454-6ca8-ab521276fc31@suse.com>
 <782089aa-7994-f471-3c52-2afb30f95812@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c12afdd1-c561-bc79-5c36-22ac2e994953@suse.com>
Date: Fri, 25 Oct 2019 14:34:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <782089aa-7994-f471-3c52-2afb30f95812@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 2/7] xen/nospec: Use always_inline to fix
 code gen for evaluate_nospec
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMTAuMjAxOSAxNDoxMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyNS8xMC8yMDE5
IDEzOjAzLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMjMuMTAuMjAxOSAxNTo1OCwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IGV2YWx1YXRlX25vc3BlYygpIGlzIGluY3JlZGlibHkgZnJhZ2ls
ZSwgYW5kIHRoaXMgaXMgb25lIGdpYW50IGJvZGdlLgo+Pj4KPj4+IFRvIGNvcnJlY3RseSBwcm90
ZWN0IGp1bXBzLCB0aGUgZ2VuZXJhdGVkIGNvZGUgbmVlZHMgdG8gYmUgb2YgdGhlIGZvcm06Cj4+
Pgo+Pj4gICAgIGNtcC90ZXN0IDxjb25kPgo+Pj4gICAgIGpjYyAxZgo+Pj4gICAgIGxmZW5jZQo+
Pj4gICAgIC4uLgo+Pj4gIDE6IGxmZW5jZQo+Pj4gICAgIC4uLgo+Pj4KPj4+IENyaXRpY2FsbHks
IHRoZSBsZmVuY2UgbXVzdCBiZSBhdCB0aGUgaGVhZCBvZiBib3RoIGJhc2ljIGJsb2NrcywgbGF0
ZXIgaW4gdGhlCj4+PiBpbnN0cnVjdGlvbiBzdHJlYW0gdGhhbiB0aGUgY29uZGl0aW9uYWwganVt
cCBpbiBuZWVkIG9mIHByb3RlY3Rpb24uCj4+Pgo+Pj4gV2hlbiBhIHN0YXRpYyBpbmxpbmUgaXMg
aW52b2x2ZWQsIHRoZSBvcHRpbWlzZXIgZGVjaWRlcyB0byBiZSBjbGV2ZXIgYW5kCj4+PiByZWFy
cmFuZ2VzIHRoZSBjb2RlIGFzOgo+Pj4KPj4+ICBwcmVkOgo+Pj4gICAgIGxmZW5jZQo+Pj4gICAg
IDxjYWxjdWxhdGUgY29uZD4KPj4+ICAgICByZXQKPj4+Cj4+PiAgICAgY2FsbCBwcmVkCj4+PiAg
ICAgY21wICQwLCAlZWF4Cj4+PiAgICAgamNjIDFmCj4+PiAgICAgLi4uCj4+PiAgMTogLi4uCj4+
Pgo+Pj4gd2hpY2ggYnJlYWtzIHRoZSBzcGVjdWxhdGl2ZSBzYWZldHkuCj4+IEFpdWkgInByZWQi
IGlzIGEgbm9uLWlubGluZWQgc3RhdGljIGlubGluZSBoZXJlLgo+IAo+IENvcnJlY3QsIGFsdGhv
dWdoIGl0IGFjdHVhbGx5IGFwcGxpZXMgdG8gYW55dGhpbmcgd2hpY2ggdGhlIGNvbXBpbGVyCj4g
Y2hvc2UgdG8gb3V0IG9mIGxpbmUsIHBlcmhhcHMgZXZlbiBhcyBhIHNpZGUgZWZmZWN0IG9mIENT
RSBwYXNzLgoKTm90IHN1cmUgaWYgeW91J3JlIGFsbHVkaW5nIHRvIHN1Y2gsIGJ1dCBJJ3ZlIG5l
dmVyIHNlZW4gdGhlIGNvbXBpbGVyCm91dC1vZi1saW5lIHNvbWV0aGluZyB0aGF0IHdhc24ndCBh
IGZ1bmN0aW9uIChvciBwZXJoYXBzIGEgc3BlY2lhbGl6YXRpb24Kb2Ygb25lKSBhdCB0aGUgc291
cmNlIGxldmVsLgoKPj4+IFRoaXMgaXMgdGhlIHRyYW5zaXRpdmUgc2V0IG9mIHByZWRpY2F0ZXMg
d2hpY2ggSSBjYW4gc3BvdCB3aGljaCBuZWVkCj4+PiBwcm90ZWN0aW5nLiAgVGhlcmUgYXJlIHBy
b2JhYmx5IG9uZXMgSSd2ZSBtaXNzZWQuICBQZXJzb25hbGx5LCBJJ20gLTEgZm9yIHRoaXMKPj4+
IGFwcHJvYWNoLCBidXQgdGhlIG9ubHkgb3RoZXIgb3B0aW9uIGZvciA0LjEzIGlzIHRvIHJldmVy
dCBpdCBhbGwgdG8gdW5icmVhawo+Pj4gbGl2ZXBhdGNoaW5nLgo+PiBUbyB1bmJyZWFrIGxpdmVw
YXRjaGluZywgYWl1aSB3aGF0IHlvdSBuZWVkIGlzIHN5bWJvbCBkaXNhbWJpZ3VhdGlvbiwKPj4g
YSBwYXRjaCBmb3Igd2hpY2ggaGFzIGJlZW4gc2VudC4KPiAKPiBDb3JyZWN0LCBidXQuLgo+IAo+
PiBXaXRoIHRoaXMgSSB0aGluayB3ZSBzaG91bGQgZm9jdXMgb24KPj4gY29kZSBnZW5lcmF0aW9u
IGFzcGVjdHMgaGVyZS4gSSdtIGZpbmUgYWNrLWluZyB0aGUgY29kZSBjaGFuZ2VzIHdpdGgKPj4g
YSBtb2RpZmllZCBkZXNjcmlwdGlvbi4gQnV0IHNpbmNlIHlvdSdyZSAtMSBmb3IgdGhpcywgSSdt
IG5vdCBzdXJlIGluCj4+IHRoZSBmaXJzdCBwbGFjZSB0aGF0IHdlIHdhbnQgdG8gZ28gdGhpcyBy
b3V0ZS4KPiAKPiAuLi4gd2l0aG91dCB0aGlzIGNoYW5nZSwgbDF0Zi1iYXJyaWVyL2JyYW5jaC1o
YXJkZW5pbmcgaXMgc3RpbGwgYnJva2VuLAo+IGFuZCBhIHBlcmZvcm1hbmNlIG92ZXJoZWFkLgoK
V2VsbCwgaXQgaGFzIGxlc3Mgb2YgYW4gZWZmZWN0LCBidXQgaXQncyBzdGlsbCBiZXR0ZXIgdGhh
biB3aXRob3V0IGFueQpvZiB0aGlzIGFsdG9nZXRoZXIuIEluIHNvbWUgY2FzZXMgY29kZSBnZW5l
cmF0aW9uIGlzIGNvcnJlY3QsIGFuZCBpbgpzb21lIG90aGVyIGNhc2VzIGNvZGUgZ2VuZXJhdGlv
biBpcyBhdCBsZWFzdCBzdWNoIHRoYXQgdGhlIHdpbmRvdyBzaXplCmdldHMgc2hydW5rLgoKPiBU
aGUgdHdvIGNob2ljZXMgdG8gdW5ibG9jayA0LjEzIGFyZSB0aGlzIHBhdGNoLCBvciB0aGUgcHJl
dmlvdXMgdmVyc2lvbgo+IHdoaWNoIG1hZGUgQ09ORklHX0hBUkRFTl9CUkFOQ0ggZGVwZW5kIG9u
IEJST0tFTiwgd2hpY2ggd2FzIGV2ZW4gbW9yZQo+IGRpc2xpa2VkLgoKT3B0aW9uIDMgaXMgdG8g
aGF2ZSBqdXN0IHRoZSBjb25maWcgb3B0aW9uLCBmb3IgcGVvcGxlIHRvIHR1cm4gdGhpcwpvZmYg
aWYgdGhleSBmZWVsIGxpa2UgZG9pbmcgc28uCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
