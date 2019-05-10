Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FF619E6A
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2019 15:44:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hP5lz-0005rC-3U; Fri, 10 May 2019 13:41:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=thpN=TK=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hP5ly-0005r6-5Z
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 13:41:14 +0000
X-Inumbo-ID: 46ae72de-7329-11e9-ad1a-ab09d56987c4
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 46ae72de-7329-11e9-ad1a-ab09d56987c4;
 Fri, 10 May 2019 13:41:12 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 96CA3A78;
 Fri, 10 May 2019 06:41:12 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 90D413F575;
 Fri, 10 May 2019 06:41:10 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <20190507151458.29350-1-julien.grall@arm.com>
 <20190507151458.29350-10-julien.grall@arm.com>
 <5CD56F04020000780022D80B@prv1-mh.provo.novell.com>
 <4f29c1a6-308b-eacf-002a-83a402d570b9@arm.com>
 <5CD57D71020000780022D8ED@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <3a359c40-ec6e-db96-b86e-17829c8ccf88@arm.com>
Date: Fri, 10 May 2019 14:41:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CD57D71020000780022D8ED@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 09/14] xen: Introduce HAS_M2P config and use
 to protect mfn_to_gmfn call
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 oleksandr_tyshchenko@epam.com, xen-devel <xen-devel@lists.xenproject.org>,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gMTAvMDUvMjAxOSAxNDozMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24g
MTAuMDUuMTkgYXQgMTU6MjIsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+IE9uIDEw
LzA1LzIwMTkgMTM6MzEsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMDcuMDUuMTkgYXQg
MTc6MTQsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+Pj4gLS0tIGEveGVuL2NvbW1v
bi9kb21jdGwuYwo+Pj4+ICsrKyBiL3hlbi9jb21tb24vZG9tY3RsLmMKPj4+PiBAQCAtMjA1LDcg
KzIwNSw3IEBAIHZvaWQgZ2V0ZG9tYWluaW5mbyhzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QKPj4+
PiB4ZW5fZG9tY3RsX2dldGRvbWFpbmluZm8gKmluZm8pCj4+Pj4gICAgICAgIGluZm8tPm91dHN0
YW5kaW5nX3BhZ2VzID0gZC0+b3V0c3RhbmRpbmdfcGFnZXM7Cj4+Pj4gICAgICAgIGluZm8tPnNo
cl9wYWdlcyAgICAgICAgID0gYXRvbWljX3JlYWQoJmQtPnNocl9wYWdlcyk7Cj4+Pj4gICAgICAg
IGluZm8tPnBhZ2VkX3BhZ2VzICAgICAgID0gYXRvbWljX3JlYWQoJmQtPnBhZ2VkX3BhZ2VzKTsK
Pj4+PiAtICAgIGluZm8tPnNoYXJlZF9pbmZvX2ZyYW1lID0gbWZuX3RvX2dtZm4oZCwgdmlydF90
b19tZm4oZC0+c2hhcmVkX2luZm8pKTsKPj4+PiArICAgIGluZm8tPnNoYXJlZF9pbmZvX2ZyYW1l
ID0gZ2ZuX3goZG9tYWluX3NoYXJlZF9pbmZvX2dmbihkKSk7Cj4+Pgo+Pj4gV2hhdCBpcyB0aGUg
aW50ZW5kZWQgYmVoYXZpb3Igb24gMzItYml0IEFybSBoZXJlPyBEbyB5b3UgcmVhbGx5Cj4+PiBt
ZWFuIHRvIHJldHVybiBhIHZhbHVlIHdpdGggMzIgYml0cyBvZiBvbmVzIChpbnN0ZWFkIG9mIDY0
IGJpdHMgb2YKPj4+IHRoZW0pIGluIHRoaXMgNjQtYml0IGZpZWxkPwo+PiBJdCBkb2VzIG5vdCBt
YXR0ZXIgYXMgbG9uZyBhcyB0aGUgR0ZOIGlzIGludmFsaWQgc28gaXQgY2FuJ3QgYmUgbWFwcGVk
Cj4+IGFmdGVyd2FyZHMuIFRoZSBleGFjdCB2YWx1ZSBpcyBub3QgZG9jdW1lbnRlZCBpbiB0aGUg
aGVhZGVyIHRvIGF2b2lkIGFueQo+PiBhc3N1bXB0aW9uLgo+IAo+IFRoYXQncyBub3QgaGVscGZ1
bCAtIGhvdyB3b3VsZCBhIGNvbnN1bWVyIGtub3cgdG8gYXZvaWQgdGhlIG1hcHBpbmcKPiBhdHRl
bXB0IGluIHRoZSBmaXJzdCBwbGFjZT8KCkkgY2FuJ3Qgc2VlIGFueSBpc3N1ZSB3aXRoIHRoZSBj
b25zdW1lciB0byB0cnkgdG8gbWFwIGl0LiBPaywgeW91IHdpbGwgd2FzdGUgYSAKY291cGxlIG9m
IGN5Y2xlcywgYnV0IHRoYXQgc2hvdWxkIGJlIHByZXR0eSByYXJlLgoKVGhlIHBvaW50IGhlcmUs
IHdlIGtlZXAgd2l0aGluIHRoZSBoeXBlcnZpc29yIHRoZSBpZGVhIG9mIHdoYXQncyB2YWxpZCBv
ciAKaW52YWxpZC4gVGhpcyBhbGxvd3MgdXMgbW9yZSBmbGV4aWJpbGl0eSBvbiB0aGUgdmFsdWUg
aGVyZSAoaW1hZ2luZSB3ZSBkZWNpZGUgdG8gCmNoYW5nZSB0aGUgdmFsdWUgb2YgR0ZOX0lOVkFM
SUQgaW4gdGhlIGZ1dHVyZS4uLikuCgo+IAo+Pj4+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJv
dWdoL2lvbW11LmMKPj4+PiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5jCj4+
Pj4gQEAgLTE4OCw5ICsxODgsMTAgQEAgdm9pZCBfX2h3ZG9tX2luaXQgaW9tbXVfaHdkb21faW5p
dChzdHJ1Y3QgZG9tYWluICpkKQo+Pj4+ICAgICAgICBoZC0+bmVlZF9zeW5jID0gaW9tbXVfaHdk
b21fc3RyaWN0ICYmICFpb21tdV91c2VfaGFwX3B0KGQpOwo+Pj4+ICAgICAgICBpZiAoIG5lZWRf
aW9tbXVfcHRfc3luYyhkKSApCj4+Pj4gICAgICAgIHsKPj4+PiArICAgICAgICBpbnQgcmMgPSAw
Owo+Pj4+ICsjaWZkZWYgQ09ORklHX0hBU19NMlAKPj4+PiAgICAgICAgICAgIHN0cnVjdCBwYWdl
X2luZm8gKnBhZ2U7Cj4+Pj4gICAgICAgICAgICB1bnNpZ25lZCBpbnQgaSA9IDAsIGZsdXNoX2Zs
YWdzID0gMDsKPj4+PiAtICAgICAgICBpbnQgcmMgPSAwOwo+Pj4+ICAgIAo+Pj4+ICAgICAgICAg
ICAgcGFnZV9saXN0X2Zvcl9lYWNoICggcGFnZSwgJmQtPnBhZ2VfbGlzdCApCj4+Pj4gICAgICAg
ICAgICB7Cj4+Pj4gQEAgLTIxNyw2ICsyMTgsOSBAQCB2b2lkIF9faHdkb21faW5pdCBpb21tdV9o
d2RvbV9pbml0KHN0cnVjdCBkb21haW4gKmQpCj4+Pj4gICAgICAgICAgICAvKiBVc2Ugd2hpbGUt
YnJlYWsgdG8gYXZvaWQgY29tcGlsZXIgd2FybmluZyAqLwo+Pj4+ICAgICAgICAgICAgd2hpbGUg
KCBpb21tdV9pb3RsYl9mbHVzaF9hbGwoZCwgZmx1c2hfZmxhZ3MpICkKPj4+PiAgICAgICAgICAg
ICAgICBicmVhazsKPj4+PiArI2Vsc2UKPj4+PiArICAgICAgICByYyA9IC1FT1BOT1RTVVBQOwo+
Pj4+ICsjZW5kaWYKPj4+PiAgICAKPj4+PiAgICAgICAgICAgIGlmICggcmMgKQo+Pj4+ICAgICAg
ICAgICAgICAgIHByaW50ayhYRU5MT0dfV0FSTklORyAiZCVkOiBJT01NVSBtYXBwaW5nIGZhaWxl
ZDogJWRcbiIsCj4+Pgo+Pj4gV291bGQgeW91IG1pbmQgZXh0ZW5kaW5nIHRoZSBzY29wZSBvZiB0
aGUgI2lmZGVmIGJleW9uZCB0aGlzIHByaW50aygpPwo+Pj4gSXQgc2VlbXMgcHJldHR5IHBvaW50
bGVzcyB0byBtZSB0byB1bmNvbmRpdGlvbmFsbHkgZW1pdCBhIGxvZyBtZXNzYWdlCj4+PiBoZXJl
Lgo+Pgo+PiBXZWxsLCBpdCBhdCBsZWFzdCB0ZWxsIHlvdSB0aGUgZnVuY3Rpb24gY2FuJ3Qgd29y
ay4gU28gSSB0aGluayBpdCBpcyBzdGlsbCBtYWtlcwo+PiBzZW5zZSB0byBoYXZlIGl0Lgo+IAo+
IEkgZGlzYWdyZWUuCllvdSBkaXNhZ3JlZSBiZWNhdXNlLi4uPwoKSSBob3BlIHlvdSBhcmUgYXdh
cmUsIHRoaXMgaXMgdW5saWtlbHkgZ29pbmcgdG8gYmUgcHJpbnRlZCBhcyB0aGUgY29kZSBzaG91
bGQgCm5vdCBiZSBjYWxsZWQuIElmIGl0IGV2ZXIgaGFwcGVucywgaXQgaXMgZWFzaWVyIGZvciBh
IHVzZXIgdG8gZ3JlcCB0aGUgY29kZSBmb3IgCnRoZSBtZXNzYWdlIHJhdGhlciB0aGFuIGhhdmlu
ZyB0byBhZGQgc29tZSB0byBmaW5kIG91dCB3aGVyZSB0aGUgLUVPUE5PVFNVUFAgaXMgCmNvbWlu
ZyBmcm9tLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
