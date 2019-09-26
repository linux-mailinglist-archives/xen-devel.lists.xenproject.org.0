Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0E6BF50B
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 16:27:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDUgs-0007jm-Ib; Thu, 26 Sep 2019 14:24:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=breC=XV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iDUgr-0007je-Ap
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 14:24:17 +0000
X-Inumbo-ID: 51d6db3a-e069-11e9-9657-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 51d6db3a-e069-11e9-9657-12813bfff9fa;
 Thu, 26 Sep 2019 14:24:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9808DAC67;
 Thu, 26 Sep 2019 14:24:15 +0000 (UTC)
To: Dario Faggioli <dfaggioli@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-31-jgross@suse.com>
 <2ad8a8ce-4530-93c7-0161-9b806a38b05d@suse.com>
 <0e4a75eb-61cc-2c9c-0d8a-f854163acd57@suse.com>
 <6288a88b-a5d8-dbd6-15c7-45ed19324510@suse.com>
 <29772d95-7528-2902-890a-1a11235f5b2e@suse.com>
 <e00a1ec0-63ba-d2b6-9bb8-7695cd8bd7fd@suse.com>
 <aecf79bf-029d-6033-aa27-5eb4ef9af650@suse.com>
 <7962de1d-8ad5-13ef-3377-3b16c07b9afd@suse.com>
 <15e6d49da77d4cb1a8bd4b1b1adca5939bd3cf4b.camel@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bb0871f6-2484-2d7d-ddff-f6526a3eb589@suse.com>
Date: Thu, 26 Sep 2019 16:24:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <15e6d49da77d4cb1a8bd4b1b1adca5939bd3cf4b.camel@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 30/47] xen/sched: add support for
 multiple vcpus per sched unit where missing
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
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDkuMjAxOSAxNTo1MywgRGFyaW8gRmFnZ2lvbGkgd3JvdGU6Cj4gT24gV2VkLCAyMDE5
LTA5LTI1IGF0IDE1OjA3ICswMjAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMjUuMDkuMjAx
OSAxNDo0MCwgSsO8cmdlbiBHcm/DnyAgd3JvdGU6Cj4+PiBPbiAyNC4wOS4xOSAxNzoyMiwgSmFu
IEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjQuMDkuMjAxOSAxNzowOSwgSsO8cmdlbiBHcm/DnyB3
cm90ZToKPj4+Pj4gT24gMjQuMDkuMTkgMTc6MDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4g
T24gMjQuMDkuMjAxOSAxNjo0MSwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPj4+Pj4+PiBmb3JfZWFj
aF9zY2hlZF91bml0X3ZjcHUoKSBmb3IgYW4gaWRsZQo+Pj4+Pj4+IHVuaXQgbWlnaHQgZW5kIHBy
ZW1hdHVyZSB3aGVuIG9uZSBvZiB0aGUgdmNwdXMgaXMgcnVubmluZwo+Pj4+Pj4+IGluIGFub3Ro
ZXIKPj4+Pj4+PiB1bml0IChpZGxlX3ZjcHUtPnNjaGVkX3VuaXQgIT0gaWRsZV91bml0KS4KPj4+
Pj4+Cj4+Pj4+PiBPaCwgdGhhdCAodiktPnNjaGVkX3VuaXQgPT0gKGkpIGluIHRoZSBjb25zdHJ1
Y3QgaXMgY2xlYXJseQo+Pj4+Pj4gdW5leHBlY3RlZC4KPj4+Pj4+IElzIHRoaXMgcmVhbGx5IHN0
aWxsIG5lZWRlZCBieSB0aGUgZW5kIG9mIHRoZSBzZXJpZXM/IEkKPj4+Pj4+IHJlYWxpemUgdGhh
dAo+Pj4+Pj4gX3NvbWVfIGNoZWNrIGlzIG5lZWRlZCwgYnV0IGNvdWxkIHRoaXMgcGVyaGFwcyBi
ZSBhcnJhbmdlZCBpbgo+Pj4+Pj4gYSB3YXkKPj4+Pj4+IHRoYXQgeW91J2Qgc3RpbGwgaGl0IGFs
bCB2Q1BVLXMgd2hlbiB1c2luZyBpdCBvbiBhbiBpZGxlCj4+Pj4+PiB1bml0LCBubwo+Pj4+Pj4g
bWF0dGVyIHdoZXRoZXIgdGhleSdyZSBpbiB1c2UgYXMgYSBzdWJzdGl0dXRlIGluIGEgInJlYWwi
Cj4+Pj4+PiB1bml0Pwo+Pj4+Pgo+Pj4+PiBJIGNvdWxkIGRvIHRoYXQgYnkgaGF2aW5nIGFub3Ro
ZXIgbGlua2VkIGxpc3QgaW4gc3RydWN0IHZjcHUuCj4+Pj4+IFRoaXMgd2F5Cj4+Pj4+IEkgY2Fu
IGF2b2lkIGl0Lgo+Pj4+Cj4+Pj4gT2gsIG5vLCBub3QgYW5vdGhlciBsaXN0IGp1c3QgZm9yIHRo
aXMgcHVycG9zZS4gSSB3YXMgcmF0aGVyCj4+Pj4gdGhpbmtpbmcKPj4+PiBvZiBlLmcuIGEgY29t
cGFyaXNvbiBvZiBJRHMuCj4+Pgo+Pj4gVGhhdCB3b3VsZCByZXN1bHQgZWl0aGVyIGluIHNvbWV0
aGluZyBsaWtlOgo+Pj4KPj4+ICh2KS0+dmNwdV9pZCA8ICh1KS0+dW5pdF9pZCArICh1KS0+cmVz
LT5jcHVwb29sLT5ncmFudWxhcml0eQo+Pj4KPj4+IHJlcXVpcmluZyB0byBtYWtlIHN0cnVjdCBz
Y2hlZF9yZXNvdXJjZSBwdWJsaWMgYXMga2V5aGFuZGxlci5jCj4+PiBuZWVkcwo+Pj4gZm9yX2Vh
Y2hfc2NoZWRfdW5pdF92Y3B1KCkgcGx1cyBiZWluZyBxdWl0ZSBleHBlbnNpdmUsCj4+Cj4+IEkg
YWdyZWUgdGhpcyBpcyBub3QgYSBnb29kIG9wdGlvbi4KPj4KPj4+IG9yOgo+Pj4KPj4+ICEodSkt
Pm5leHRfaW5fbGlzdCB8fCAodiktPnZjcHVfaWQgPCAodSktPm5leHRfaW5fbGlzdC0+dW5pdF9p
ZAo+Pj4KPj4+IHdoaWNoIHNlZW1zIHRvIGJlIG1vcmUgZXhwZW5zaXZlIGFzIHRoZSBjdXJyZW50
IHZhcmlhbnQsIHRvby4KPj4KPj4gSXQncyBub3QgdGhpcyBtdWNoIG1vcmUgZXhwZW5zaXZlLCBh
bmQgaXQgZWxpbWluYXRlcyB1bmV4cGVjdGVkCj4+IChhcyBJIHdvdWxkIGNhbGwgaXQpIGJlaGF2
aW9yLCBzbyBJIHRoaW5rIEknZCBnbyB0aGlzIHJvdXRlLiAKPj4KPiBTbywgSSBob25lc3RseSBs
aWtlIHRoZSB3YXkgaXQncyBjdXJyZW50bHkgZG9uZSBpbiBKdWVyZ2VuJ3MgcGF0aGVzLgo+IAo+
IEhvd2V2ZXIsIEknbSBub3Qgc3VyZSBJIHVuZGVyc3RhbmQgd2hhdCBpdCBpcyB0aGUgaXNzdWUg
dGhhdCBKYW4gdGhpbmtzCj4gdGhhdCBoYXMsIGFuZCBpbiB3aGF0IHNlbnNlIHRoZSBjb2RlL2Jl
aGF2aW9yIGlzIHJlZ2FyZGVkIGFzCj4gInVuZXhwZWN0ZWQiLgo+IAo+IENhbiB5b3UgaGVscCBt
ZSBzZWUgdGhlIHByb2JsZW0/IE1heWJlLCBpZiBJIHJlYWxpemUgaXQsIEknZCBjaGFuZ2UgbXkK
PiBwcmVmZXJlbmNlLi4uCgpUaGUgdW5leHBlY3RlZCAvIHN1cnByaXNpbmcgYmVoYXZpb3IgaXMg
ZGVzY3JpYmVkIGF0IHRoZSB0b3AgKGkuZS4Kc3RpbGwgdmlzaWJsZSBpbiBjb250ZXh0KSwgYnV0
IEknbGwgcXVvdGUgaXQgYWdhaW4gaGVyZToKCiJmb3JfZWFjaF9zY2hlZF91bml0X3ZjcHUoKSBm
b3IgYW4gaWRsZSB1bml0IG1pZ2h0IGVuZCBwcmVtYXR1cmUKIHdoZW4gb25lIG9mIHRoZSB2Y3B1
cyBpcyBydW5uaW5nIGluIGFub3RoZXIgdW5pdAogKGlkbGVfdmNwdS0+c2NoZWRfdW5pdCAhPSBp
ZGxlX3VuaXQpIgoKVGhpcyBzdGFydGVkIG91dCB3aXRoIG1lIGFza2luZyBhYm91dCBhbiBhcHBh
cmVudGx5IChidXQgYXMKSsO8cmdlbiBoYXMgY2xhcmlmaWVkIG5vdCB0cnVseSkgdW5uZWNlc3Nh
cnkgc3BlY2lhbCBjYXNpbmcgb2YKaWRsZSB2Q1BVLXMvdW5pdHMvZG9tYWluIGFoZWFkIG9mIGEg
dXNlIG9mIHRoaXMgY29uc3RydWN0LgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
