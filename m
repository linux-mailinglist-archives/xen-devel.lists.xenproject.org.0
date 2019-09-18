Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C342CB63FD
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2019 15:05:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAZaT-0003TK-Hj; Wed, 18 Sep 2019 13:01:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rYmb=XN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iAZaS-0003Si-3g
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2019 13:01:36 +0000
X-Inumbo-ID: 7100ae24-da14-11e9-b76c-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7100ae24-da14-11e9-b76c-bc764e2007e4;
 Wed, 18 Sep 2019 13:01:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 96953B019;
 Wed, 18 Sep 2019 13:01:33 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <5a4d4a61-a543-c657-8458-cbc6b5a8a633@suse.com>
 <eca36271-656a-ba89-134d-937a9d0bb403@suse.com>
 <f15bb1a2-c657-6f59-2a88-1eafb7f891f3@citrix.com>
 <c2d448cc-10f8-7491-9128-a6fe670c5741@suse.com>
 <3e13b2cf-1ce8-11a8-0574-10b21235ea05@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <57d09076-b1cf-b769-0942-4bf6143a29db@suse.com>
Date: Wed, 18 Sep 2019 15:01:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <3e13b2cf-1ce8-11a8-0574-10b21235ea05@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 06/10] AMD/IOMMU: don't blindly allocate
 interrupt remapping tables
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
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMDkuMjAxOSAxMzozNiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxOC8wOS8yMDE5
IDA5OjU1LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMTcuMDkuMjAxOSAxNToxMCwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IE9uIDA2LzA4LzIwMTkgMTQ6MDksIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+Pj4+IFRCRDogVGhpcyByZXRhaW5zIHByaW9yIChidXQgc3VzcGljaW91cykgYmVoYXZpb3Ig
b2Ygbm90IGNhbGxpbmcKPj4+PiDCoMKgwqDCoCBhbWRfaW9tbXVfc2V0X2ludHJlbWFwX3RhYmxl
KCkgZm9yICJpbnZhbGlkIiBJVlJTIG1hcHBpbmcgZW50cmllcy4KPj4+PiDCoMKgwqDCoCBTaW5j
ZSBEVEUuSVY9MCBtZWFucyB1bi1yZW1hcHBlZCBpbnRlcnJ1cHRzLCBJIHdvbmRlciBpZiB0aGlz
IG5lZWRzCj4+Pj4gwqDCoMKgwqAgY2hhbmdpbmcuCj4+PiBIb3cgd291bGQgYW4gaW52YWxpZCBl
bnRyeSBnZXQgRFRFLlYgc2V0IGluIHRoZSBmaXJzdCBwbGFjZT8KPj4gRFRFLlYgZ2V0cyBzZXQg
YnkgYW1kX2lvbW11X3NldF9yb290X3BhZ2VfdGFibGUoKSwgd2hpY2ggaW4gdHVybiBnZXRzCj4+
IGNhbGxlZCBmcm9tIGFtZF9pb21tdV9zZXR1cF9kb21haW5fZGV2aWNlKCkgYWxvbmUuIEl0J3Mg
b25seSB0aGUKPj4gbGF0dGVyIGZ1bmN0aW9uJ3MgY2FsbGVycyB3aGljaCBvYnRhaW4gKGFuZCBw
b3NzaWJseSBjaGVjaykgdGhlCj4+IGNvcnJlc3BvbmRpbmcgSVZSUyBtYXBwaW5ncyBlbnRyeS4g
SGVuY2UgdG8gbWUgdGhlcmUncyBhIHN1ZmZpY2llbnQKPj4gZGlzY29ubmVjdCBiZXR3ZWVuIHNl
dHRpbmcgb2YgRFRFLlYgYW5kIERURS5JVi4KPj4KPj4gUGx1cywgbG9va2luZyBhdCBlLmcuIGFt
ZF9pb21tdV9hZGRfZGV2aWNlKCksIHRoZXJlJ3MgYW1wbGUgcm9vbSBmb3IKPj4gbm90IGV2ZW4g
bWFraW5nIGl0IHRvIGFtZF9pb21tdV9zZXRfaW50cmVtYXBfdGFibGUoKSwgZHVlIHRvIGVhcmxp
ZXIKPj4gZXJyb3JzLgo+Pgo+Pj4gV2hhdGV2ZXIgdGhlIG9sZCBiZWhhdmlvdXIgbWF5IGhhdmUg
YmVlbiwgd2Ugc2hvdWxkbid0IGhhdmUgY29kZSB3aGljaAo+Pj4gY29tZXMgd2l0aCBhIGNoYW5j
ZSBvZiBoYXZpbmcgbm9uLXJlbWFwcGVkIGludGVycnVwdHMgYnkgYWNjaWRlbnQuCj4+IFdlIGNh
bid0IG1ha2UgYW1kX2lvbW11X3NldF9yb290X3BhZ2VfdGFibGUoKSBzZXQgZHRlLT5pdiB0byAx
LCBhcwo+PiBpdCBnZXRzIGNhbGxlZCBvbmx5IGFmdGVyIGFtZF9pb21tdV9zZXRfaW50cmVtYXBf
dGFibGUoKSBpbgo+PiBhbWRfaW9tbXVfYWRkX2RldmljZSgpLiBCdXQgd2UgY291bGQgb2YgY291
cnNlIG1ha2UgaXQgZG8gc28gd2hlbgo+PiBpdCBmaW5kcyBkdGUtPml0X3Jvb3QgYmUgemVyby4g
WWV0IEkgd29uZGVyIGlmIGl0IHdhc24ndCBtb3JlIHNhZmUKPj4gdG8gaGF2ZSBEVEVzIHN0YXJ0
IG91dCB3aXRoIHRoZSBmaWVsZCBzZXQgdGhpcyB3YXkuCj4+Cj4+IEFsb25nIHRoZXNlIGxpbmVz
IEknbSBhbHNvIG5vdCBjb252aW5jZWQgaXQgaXMgYSBnb29kIGlkZWEgZm9yCj4+IGFtZF9pb21t
dV9zZXRfaW50cmVtYXBfdGFibGUoKSB0byBoYXZlIGEgInZhbGlkIiBwYXJhbWV0ZXIgaW4gdGhl
Cj4+IGZpcnN0IHBsYWNlOiBJdCdzIG9rYXkgYXMgbG9uZyBhcyBhbGwgY2FsbGVycyBwYXNzIGlv
bW11X2ludHJlbWFwLAo+PiBidXQgaXQgd291bGQgc2VlbSB0byBtZSB0aGF0IC0gYXMgYWxyZWFk
eSBzYWlkIC0gd2UnZCB3YW50IERURXMgYmUKPj4gc2V0IHRoaXMgd2F5IHJpZ2h0IHdoZW4gYSBE
VCBnZXRzIGFsbG9jYXRlZC4gSWYgeW91IGFncmVlLCBJJ2xsCj4+IGhhcHBpbHkgYWRkIGEgcGF0
Y2ggZG9pbmcgc28gdG8gdGhlIGVuZCBvZiB0aGlzIHNlcmllcyAodGhlcmUncwo+PiBtZWFud2hp
bGUgYSBwYXRjaCByZS1hcnJhbmdpbmcgRFQgYWxsb2NhdGlvbiBhbnl3YXkpLgo+IAo+IEkndmUg
YmVlbiBsb29raW5nIHRocm91Z2ggdGhlIHNwZWMsIGFuZCB0aGlzIGlzIHJhdGhlciBjb21wbGlj
YXRlZC7CoCBXZQo+IG5lZWQgdG8gc2V0IFYgYW5kIFRWIHRvIGluaGliaXQgRE1BLCBhbmQgSVYg
YW5kIEludEN0bCB0byBpbmhpYml0Cj4gaW50ZXJydXB0cy4KCkJ5ICJzZXQgViBhbmQgVFYiLCB5
b3UgZG9uJ3QgbWVhbiBzZXR0aW5nIGJvdGggdG8gMSwgZG8geW91PyBNeQpyZWFkaW5nIG9mIHRo
ZSByZXNwZWN0aXZlIHRhYmxlcyBpcyB0aGF0IHdlIHdhbnQgVj0xLCBUVj0wLCBJVj0xLAphbmQg
SW50Q3RsPTAuIFRoZSBwcm9ibGVtIHdpdGggc2V0dGluZyBWIGVhcmx5IGlzIHRoYXQgc29tZQpv
dGhlciBmaWVsZHMgdGhhbiBhbHNvIGFyZSBhc3N1bWVkIHRvIGJlIHZhbGlkLiBJLmUuIGFsb25n
IHdpdGgKdGhlIGFib3ZlIHdlJ2QgYWxzbyBuZWVkIFN5c01ndD0wLCBFWD0wLCBTRD0/LCBDYWNo
ZT0/LCBJb0N0bD0wLApTQT0/LCBTRT0/LCBhbmQgST0wOyBxdWVzdGlvbiBtYXJrcyBpbmRpY2F0
ZSBlaXRoZXIgc2V0dGluZyB3b3VsZAphcHBlYXIgdG8gYmUgZmluZS4gSW4gdGhlIGVuZCBhbGwg
emVyb3MgZXhjZXB0IFYgYW5kIElWIHdvdWxkCmxvb2sgdG8gYmUgd2hhdCB3ZSB3YW50LCBhbGJl
aXQgc2V0dGluZyBvbiBvZiBTRSBvciBTQSBtYXkgYmUKd29ydGggY29uc2lkZXJpbmcuCgo+IFdo
eSBub3QgaW5pdGlhbGlzZSBldmVyeSBlbnRyeSBpbiB0aGUgZGV2aWNlIHRhYmxlIHdoZW4gd2Ug
Y3JlYXRlIGl0IHRvCj4gYSBzYWZlLCBibG9ja2VkIHN0YXRlLsKgIFRoYXQgd2F5LCB0aGUgb25s
eSB3YXkgYSBkZXZpY2Ugc3RhcnRzCj4gZnVuY3Rpb25pbmcgYXBwcm9wcmlhdGVseSBpcyB2aWEg
YSBzdWNjZXNzZnVsIGNhbGwgdG/CoAo+IGFtZF9pb21tdV9zZXRfcm9vdF9wYWdlX3RhYmxlKCkg
YW5kIGFtZF9pb21tdV9zZXRfaW50cmVtYXBfdGFibGUoKSwKPiB3aGljaCBzZWVtcyB0byBiZSBm
YXIgc2FmZXIgYmVoYXZpb3VyIG92ZXJhbGwuCgpJIGludGVuZCB0byBhZGQgYSByZXNwZWN0aXZl
IHBhdGNoIHRvIHRoZSBzZXJpZXMsIGlmIHdlIG1hbmFnZSB0bwphZ3JlZSAoc2VlIGFib3ZlKSB3
aGF0IHRoZSBpbml0aWFsIHNldHRpbmdzIHNob3VsZCBiZS4KCkphbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
